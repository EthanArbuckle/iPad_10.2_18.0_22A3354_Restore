@implementation PXRepresentedEntityProviderRegistration

+ (void)registerViewAnnotationView:(id)a3
{
  uint64_t v3;
  UIView *v4;

  v3 = qword_1EE945BE0;
  v4 = (UIView *)a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  sub_1A7ADBF34();
  PXRepresentedEntityProvider.registerAnnotationView(_:)(v4);

  swift_release();
}

- (_TtC12PhotosUICore39PXRepresentedEntityProviderRegistration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXRepresentedEntityProviderRegistration();
  return -[PXRepresentedEntityProviderRegistration init](&v3, sel_init);
}

@end
