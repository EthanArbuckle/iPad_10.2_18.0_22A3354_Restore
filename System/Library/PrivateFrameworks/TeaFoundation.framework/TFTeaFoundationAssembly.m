@implementation TFTeaFoundationAssembly

- (TFTeaFoundationAssembly)init
{
  return (TFTeaFoundationAssembly *)FrameworkAssembly.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
