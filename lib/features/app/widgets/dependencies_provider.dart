import 'package:flutter/material.dart';
import 'package:functional_starter/common/interfaces/app_dependencies.dart';
import 'package:http/http.dart' as http;

class AppDependenciesProvider extends StatefulWidget {
  final Widget child;

  const AppDependenciesProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  static IAppDependencies of(BuildContext context) =>
      _InheritedAppDependenciesProvider.of(context).providerState;

  @override
  _AppDependenciesProviderState createState() =>
      _AppDependenciesProviderState();
}

class _AppDependenciesProviderState extends State<AppDependenciesProvider>
    implements IAppDependencies {
  http.Client? _client;

  @override
  http.Client get httpClient => _client ??= http.Client();

  @override
  void dispose() {
    _client?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _InheritedAppDependenciesProvider(
        providerState: this,
        child: widget.child,
      );
}

class _InheritedAppDependenciesProvider extends InheritedWidget {
  final _AppDependenciesProviderState providerState;

  const _InheritedAppDependenciesProvider({
    required this.providerState,
    required Widget child,
  }) : super(child: child);

  static _InheritedAppDependenciesProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<
        _InheritedAppDependenciesProvider>();
    assert(provider != null, "Unable to locate AppDependenciesProvider.");
    return provider!;
  }

  @override
  bool updateShouldNotify(_InheritedAppDependenciesProvider _) => false;
}
