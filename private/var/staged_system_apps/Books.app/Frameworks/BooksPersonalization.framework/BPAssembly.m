@implementation BPAssembly

- (BPAssembly)init
{
  return (BPAssembly *)FrameworkAssembly.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BPAssembly_assemblies));
}

@end
