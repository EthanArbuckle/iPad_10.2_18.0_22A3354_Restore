@implementation PXRetailExperienceInterface

+ (id)createRetailExperienceViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v3;
  v4 = (void *)sub_1A7007DBC();
  swift_release();
  return v4;
}

- (_TtC12PhotosUICore27PXRetailExperienceInterface)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXRetailExperienceInterface();
  return -[PXRetailExperienceInterface init](&v3, sel_init);
}

@end
