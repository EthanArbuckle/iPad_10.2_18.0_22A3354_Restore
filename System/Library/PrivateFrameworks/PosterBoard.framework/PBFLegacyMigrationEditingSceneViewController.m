@implementation PBFLegacyMigrationEditingSceneViewController

- (PBFLegacyMigrationEditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 exnihiloPathAssertion:(id)a5 replacing:(id)a6
{
  objc_class *v11;
  id v12;
  objc_super v14;

  type metadata accessor for ExnihiloPathAssertion();
  v11 = (objc_class *)swift_allocObject();
  *((_QWORD *)v11 + 2) = a5;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___PBFLegacyMigrationEditingSceneViewController_exnihiloPathAssertion) = v11;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___PBFLegacyMigrationEditingSceneViewController_posterPairToReplace) = (Class)a6;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for LegacyMigrationEditingSceneViewController();
  swift_unknownObjectRetain();
  v12 = a6;
  return -[PREditingSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:](&v14, sel_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo_, a3, a4, 0, 0, 0);
}

- (PBFLegacyMigrationEditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  PBFLegacyMigrationEditingSceneViewController *result;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  result = (PBFLegacyMigrationEditingSceneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___PBFLegacyMigrationEditingSceneViewController_posterPairToReplace));
}

@end
