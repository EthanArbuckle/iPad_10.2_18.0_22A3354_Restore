@implementation TUAssembly

- (TUAssembly)init
{
  return (TUAssembly *)FrameworkAssembly.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
