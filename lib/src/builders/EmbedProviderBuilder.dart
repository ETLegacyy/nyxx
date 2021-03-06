part of nyxx;

/// Builds new instance of provider
class EmbedProviderBuilder {
  /// Name of provider
  String name;

  /// Url of provider
  String url;

  /// Builds object to Map() instance;
  Map<String, dynamic> build() {
    Map<String, dynamic> tmp = new Map();

    if (name != null) tmp["name"] = name;

    if (url != null) tmp["url"] = url;

    return tmp;
  }
}
