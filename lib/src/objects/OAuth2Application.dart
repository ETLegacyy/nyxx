part of nyxx;

/// An OAuth2 application.
class OAuth2Application {
  /// The [Client] object.
  Client client;

  /// The raw object returned by the API
  Map<String, dynamic> raw;

  /// The app's description.
  String description;

  /// The app's icon hash.
  String icon;

  /// The app's ID.
  Snowflake id;

  /// The app's name.
  String name;

  /// The app's RPC origins.
  List<String> rpcOrigins;

  /// A timestamp for when the app was created.
  DateTime createdAt;

  OAuth2Application._new(this.client, this.raw) {
    this.description = raw['description'];
    this.icon = raw['icon'];
    this.id = new Snowflake(raw['id']);
    this.name = raw['name'];
    this.rpcOrigins = raw['rpcOrigins'] as List<String>;
    this.createdAt = id.timestamp;
  }

  /// Returns a string representation of this object.
  @override
  String toString() {
    return this.name;
  }
}
