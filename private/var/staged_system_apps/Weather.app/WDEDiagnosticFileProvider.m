@implementation WDEDiagnosticFileProvider

- (id)files
{
  WDEDiagnosticFileProvider *v2;
  Class isa;

  v2 = self;
  DiagnosticFileProvider.files()();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)exportDirectoryAndReturnError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  WDEDiagnosticFileProvider *v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  DiagnosticFileProvider.exportDirectory()((uint64_t)v7);

  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (WDEDiagnosticFileProvider)init
{
  return (WDEDiagnosticFileProvider *)DiagnosticFileProvider.init()();
}

@end
