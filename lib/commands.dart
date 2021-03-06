/// Nyxx DISCORD API wrapper for Dart
///
/// This module contains commands specific logic that this framework offers.
/// There are 2 implementations of [Commands] handler: [InstanceCommandFramework] and [MirrorsCommandFramework].
/// They are created to achieve same result but has different capabilities. [MirrorsCommandFramework] is more advanced and offers
/// more functionality. In other hand [InstanceCommandFramework] is faster one, because has faster command resolution.
library nyxx.commands;

import "dart:mirrors";
import 'dart:async';
import 'nyxx.dart';

import 'package:logging/logging.dart';

part 'src/commands/CommandExecutionFailEvent.dart';
part 'src/commands/CommandsFramework.dart';
part 'src/commands/Annotations.dart';
part 'src/commands/CommandContext.dart';
part 'src/commands/Service.dart';
part 'src/commands/CooldownCache.dart';

part 'src/commands/TypeConverter.dart';
