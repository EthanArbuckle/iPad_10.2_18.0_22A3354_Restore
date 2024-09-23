@implementation PXAppDependencyManager

+ (void)addPhotoLibraryProviderDependency:(id)a3
{
  sub_1A7100FB8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A7101764);
}

+ (void)addURLNavigationPerformerProviderDependency:(id)a3
{
  sub_1A7100FB8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A7101888);
}

+ (void)addPersonImageProviderDependency:(id)a3
{
  sub_1A7100FB8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A71019B0);
}

- (_TtC12PhotosUICore22PXAppDependencyManager)init
{
  return (_TtC12PhotosUICore22PXAppDependencyManager *)sub_1A710171C(self, (uint64_t)a2, type metadata accessor for PXAppDependencyManager);
}

@end
