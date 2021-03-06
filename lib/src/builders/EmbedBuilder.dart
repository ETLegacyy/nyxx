part of nyxx;

/// Builds up embed object.
/// All fields are optional except of [title]
class EmbedBuilder {
  /// Embed title
  String title;

  /// Embed type
  String type;

  /// Embed description.
  String description;

  /// Url of Embed
  String url;

  /// Color code of the embed
  int color;

  /// Timestamp of embed content
  DateTime timestamp;

  /// Embed Footer
  EmbedFooterBuilder footer;

  /// Image Url
  String imageUrl;

  /// Thumbnail Url
  String thumbnailUrl;

  /// Video url
  String videoUrl;

  /// Author aka provider
  EmbedProviderBuilder provider;

  /// Author of embed
  EmbedAuthorBuilder author;

  /// Embed custom fields;
  List<Map<String, dynamic>> _fields;

  /// Bootstraper for [EmbedBuilder], takes title as required property
  EmbedBuilder(this.title) {
    _fields = new List();
  }

  /// Adds field to embed. [name] and [value] fields are required. Inline is set to false by default.
  void addField({String name, String value, bool inline = false}) {
    _fields.add(new EmbedFieldBuilder(name, value, inline).build());
  }

  /// Added field to embed using [EmbedFieldBuilder]
  void addFieldBuilder(EmbedFieldBuilder field) {
    _fields.add(field.build());
  }

  /// Builds object to Map() instance;
  Map<String, dynamic> build() {
    Map<String, dynamic> tmp = new Map();

    if (title != null) tmp["title"] = title;

    if (type != null) tmp["type"] = type;

    if (description != null) tmp["description"] = description;

    if (url != null) tmp["url"] = url;

    if (timestamp != null) tmp["timestamp"] = timestamp.toIso8601String();

    if (color != null) tmp["color"] = color;

    if (footer != null) tmp["footer"] = footer.build();

    if (imageUrl != null) tmp["image"] = <String, dynamic>{"url": imageUrl};

    if (thumbnailUrl != null)
      tmp["thumbnail"] = <String, dynamic>{"url": thumbnailUrl};

    if (videoUrl != null) tmp["video"] = <String, dynamic>{"url": videoUrl};

    if (provider != null) tmp["provider"] = provider.build();

    if (author != null) tmp["author"] = author.build();

    if (_fields.length > 0) tmp["fields"] = _fields;

    return tmp;
  }
}
