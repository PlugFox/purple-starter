import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:purple_starter/common/database/app_database.dart';
import 'package:purple_starter/common/widget/app_dependencies_provider.dart';

extension BuildContextX on BuildContext {
  IAppDependencies get dependencies => AppDependenciesProvider.of(this);
  Dio get dio => dependencies.dio;
  AppDatabase get database => dependencies.database;

  AppLocalizations get localized => AppLocalizations.of(this)!;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}