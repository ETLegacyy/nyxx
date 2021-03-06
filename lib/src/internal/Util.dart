part of nyxx;

/// The utility functions for the client.
class Util {
  /// Gets a DateTime from a snowflake ID.
  static DateTime getDate(String id) {
    return new DateTime.fromMillisecondsSinceEpoch(
        ((int.parse(id) / 4194304) + 1420070400000).toInt());
  }

  static int RGBtoInt(String RGB) {
    int R = int.parse(RGB.substring(0, 3), radix: 16);
    int G = int.parse(RGB.substring(3, 5), radix: 16);
    int B = int.parse(RGB.substring(5), radix: 16);

    return B * 65536 + G * 256 + R;
  }

  /*
  /// Resolves an object into a target object.
  static String resolve(String to, dynamic object) {
    if (to == "channel") {
      if (object is Message) {
        return object.channel.id.toString();
      } else if (object is Channel) {
        return object.id.toString();
      } else if (object is Guild) {
        return object.defaultChannel.id.toString();
      } else {
        return object.toString();
      }
    } else if (to == "message") {
      if (object is Message) {
        return object.id.toString();
      } else {
        return object.toString();
      }
    } else if (to == "guild") {
      if (object is Message) {
        return object.guild.id.toString();
      } else if (object is GuildChannel) {
        return object.guild.id.toString();
      } else if (object is Guild) {
        return object.id.toString();
      } else {
        return object.toString();
      }
    } else if (to == "user") {
      if (object is Message) {
        return object.author.id.toString();
      } else if (object is User) {
        return object.id.toString();
      } else if (object is Member) {
        return object.id.toString();
      } else {
        return object.toString();
      }
    } else if (to == "member") {
      if (object is Message) {
        return object.author.id.toString();
      } else if (object is User) {
        return object.id.toString();
      } else if (object is Member) {
        return object.id.toString();
      } else {
        return object.toString();
      }
    } else if (to == "app") {
      if (object is User) {
        return object.id.toString();
      } else if (object is Member) {
        return object.id.toString();
      } else {
        return object.toString();
      }
    } else {
      return null;
    }
  }
  */
  /// Creates a text table.
  static String textTable(List<List<String>> rows) {
    List<List<String>> cols = [];
    List<List<String>> newRows = [];
    List<String> finalRows = [];

    rows.forEach((List<String> row) {
      int cellCount = 0;
      row.forEach((String cell) {
        if (cols.length <= cellCount) cols.add([]);
        cols[cellCount].add(cell);
        cellCount++;
      });
    });

    int colCount = 0;
    cols.forEach((List<String> col) {
      int maxLen = 0;
      col.forEach((String cell) {
        if (cell.length > maxLen) maxLen = cell.length;
      });

      int cellCount = 0;
      col.forEach((String cell) {
        cols[colCount][cellCount] = cell + (" " * (maxLen - cell.length));
        cellCount++;
      });

      cols[colCount].insert(1, "-" * maxLen);
      colCount++;
    });

    cols.forEach((List<String> col) {
      int cellCount = 0;
      col.forEach((String cell) {
        if (newRows.length <= cellCount) newRows.add([]);
        newRows[cellCount].add(cell);
        cellCount++;
      });
    });

    newRows.forEach((List<String> row) {
      finalRows.add(row.join(" "));
    });

    return finalRows.join("\n");
  }
}
