@implementation SnapshotPageTraitEnvironment

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment_traitCollection));
}

- (_TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment)init
{
  _TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment *result;

  result = (_TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.SnapshotPageTraitEnvironment", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment_traitCollection));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment_gridSpec));
}

@end
