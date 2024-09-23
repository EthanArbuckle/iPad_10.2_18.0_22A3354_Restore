@implementation SDEDiagnosticFileProvider

- (id)files
{
  char *v2;
  Class isa;

  v2 = _s9StocksApp22DiagnosticFileProviderC5filesSaySSGyF_0();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (SDEDiagnosticFileProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[SDEDiagnosticFileProvider init](&v3, "init");
}

@end
