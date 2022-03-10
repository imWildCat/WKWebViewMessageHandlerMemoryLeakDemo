# WKWebViewMessageHandlerMemoryLeakDemo

## Repro steps

1. Build and run the app
2. Tap "Show WebView", then dismiss the presented VC
3. Repeat it for three times
4. Use "Debug Memory Graph", check how many `DemoScriptHandler` instances are retained

## License

Public Domain.
