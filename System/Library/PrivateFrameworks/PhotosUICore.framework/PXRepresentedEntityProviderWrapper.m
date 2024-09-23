@implementation PXRepresentedEntityProviderWrapper

+ (void)registerAppIntentsViewAnnotationDelegate:(id)a3
{
  sub_1A710169C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))PXRepresentedEntityProvider.registerDelegate(_:));
}

+ (void)unregisterAppIntentsViewAnnotationDelegate:(id)a3
{
  sub_1A710169C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))PXRepresentedEntityProvider.unregisterDelegate(_:));
}

- (_TtC12PhotosUICore34PXRepresentedEntityProviderWrapper)init
{
  return (_TtC12PhotosUICore34PXRepresentedEntityProviderWrapper *)sub_1A710171C(self, (uint64_t)a2, type metadata accessor for PXRepresentedEntityProviderWrapper);
}

@end
