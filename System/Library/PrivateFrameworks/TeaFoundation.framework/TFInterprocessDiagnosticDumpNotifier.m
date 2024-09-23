@implementation TFInterprocessDiagnosticDumpNotifier

- (TFInterprocessDiagnosticDumpNotifier)initWithNotificationName:(id)a3 diagnosticFileManager:(id)a4
{
  id v5;

  sub_190BE5000();
  v5 = a4;
  return (TFInterprocessDiagnosticDumpNotifier *)InterprocessDiagnosticDumpNotifier.init(notificationName:diagnosticFileManager:)();
}

- (void)triggerDiagnosticFileDump
{
  TFInterprocessDiagnosticDumpNotifier *v2;

  v2 = self;
  InterprocessDiagnosticDumpNotifier.triggerDiagnosticFileDump()();

}

- (TFInterprocessDiagnosticDumpNotifier)init
{
  InterprocessDiagnosticDumpNotifier.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
