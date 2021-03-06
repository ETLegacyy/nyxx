part of nyxx;

/// Emitted when multiple messages are deleted at once.
class MessageDeleteBulkEvent {
  /// List of deleted messages
  List<Snowflake> deletedMessages = new List();

  /// Channel on which messages was deleted.
  Channel channel;

  MessageDeleteBulkEvent._new(Client client, Map<String, dynamic> json) {
    this.channel = client.channels[json['d']['channel_id']];

    json['d']['ids']
        .forEach((String i) => deletedMessages.add(new Snowflake(i)));
    client._events.onMessageDeleteBulk.add(this);
  }
}
