import 'package:nyxx/nyxx.dart' as nyxx;

import 'dart:io';

// Main function
void main() {
  // Create new bot instance
  nyxx.Client bot = new nyxx.Client(Platform.environment['DISCORD_TOKEN']);

  // Listen to ready event. Invoked when bot started listening to events.
  bot.onReady.listen((nyxx.ReadyEvent e) {
    print("Ready!");
  });

  // Listen to all incoming messages via Dart Stream
  bot.onMessage.listen((nyxx.MessageEvent e) {
    // When receive specific message send new file to channel
    if (e.message.content == "!give-me-file") {
      // Send file via `sendFile()`. File path must be in list, so we have there `[]` syntax.
      // First argument is path to file. When no additional arguments specified file is sent as is.
      // File has to be in root project directory if path is relative.
      e.message.channel.sendFile(["image.jpg"]);
    }

    if (e.message.content == "!give-me-embed") {
      // Files can be used within embeds as custom images

      // Use `{file-name}` to embed sent file into embed.
      var embed = new nyxx.EmbedBuilder("Example Title")
        ..thumbnailUrl = "{example_file.jpg}";

      // Sent all together
      e.message.channel.sendFile(["example.file.jpg"], embed: embed);
    }
  });
}
