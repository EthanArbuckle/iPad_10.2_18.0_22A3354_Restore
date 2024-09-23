@implementation TFDiagnosticFileManager

- (TFDiagnosticFileManager)initWithDiagnosticDumpDir:(id)a3 diagnosticDumpNotificationName:(id)a4 log:(id)a5
{
  uint64_t v6;
  id v7;
  TFDiagnosticFileManager *result;

  v6 = sub_190BE4628();
  MEMORY[0x1E0C80A78](v6);
  sub_190BE45C8();
  sub_190BE5000();
  v7 = a5;
  DiagnosticFileManager.init(diagnosticDumpDir:diagnosticDumpNotificationName:log:)();
  return result;
}

- (void)addDiagnosticFileProvider:(id)a3
{
  sub_190B104DC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))DiagnosticFileManager.add(diagnosticFileProvider:));
}

- (void)removeDiagnosticFileProvider:(id)a3
{
  sub_190B104DC(self, (uint64_t)a2, (uint64_t)a3, DiagnosticFileManager.remove(diagnosticFileProvider:));
}

- (id)diagnosticFiles
{
  return sub_190B11BE8(self, (uint64_t)a2, DiagnosticFileManager.diagnosticFiles());
}

- (id)availableDiagnosticFiles
{
  return sub_190B11BE8(self, (uint64_t)a2, (void (*)(void))DiagnosticFileManager.availableDiagnosticFiles());
}

- (TFDiagnosticFileManager)init
{
  DiagnosticFileManager.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___TFDiagnosticFileManager_diagnosticDumpDir;
  v4 = OUTLINED_FUNCTION_6_3();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  v5 = (char *)self + OBJC_IVAR___TFDiagnosticFileManager_logger;
  v6 = OUTLINED_FUNCTION_96();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
