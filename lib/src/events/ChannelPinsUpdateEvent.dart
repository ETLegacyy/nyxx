part of nyxx;

/// Fired when channel's pinned messages are updated
class ChannelPinsUpdateEvent {
  /// Id of channel where change occurred
  Snowflake channelId;

  /// the time at which the most recent pinned message was pinned
  DateTime lastPingTimestamp;

  ChannelPinsUpdateEvent._new(Client client, Map<String, dynamic> json) {
    this.channelId = new Snowflake(json['d']['channel_id']);
    this.lastPingTimestamp = json['d']['last_pin_timestamp'];
    client._events.onChannelPinsUpdate.add(this);
  }
}
