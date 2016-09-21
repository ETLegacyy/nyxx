import '../../objects.dart';
import '../client.dart';

/// Sent when a channel is created, can be a `PMChannel`.
class ChannelCreateEvent {
  /// The channel that was created, either a `GuildChannel` or `PMChannel`.
  dynamic channel;

  /// Constructs a new [ChannelCreateEvent].
  ChannelCreateEvent(Client client, Map<String, dynamic> json) {
    if (client.ready) {
      if (json['d']['type'] == 1) {
        this.channel = new PrivateChannel(json['d']);
        client.channels[channel.id] = channel;
        client.emit('channelCreate', this);
      } else {
        Guild guild = client.guilds[json['d']['guild_id']];
        this.channel = new GuildChannel(client, json['d'], guild);
        client.channels[channel.id] = channel;
        client.emit('channelCreate', this);
      }
    }
  }
}
