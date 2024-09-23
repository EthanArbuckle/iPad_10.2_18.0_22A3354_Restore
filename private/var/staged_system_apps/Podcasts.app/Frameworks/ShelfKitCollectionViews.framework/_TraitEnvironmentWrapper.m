@implementation _TraitEnvironmentWrapper

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_3B3149F5140CF30271827167208E639424_TraitEnvironmentWrapper_traitCollection));
}

- (_TtC23ShelfKitCollectionViewsP33_3B3149F5140CF30271827167208E639424_TraitEnvironmentWrapper)init
{
  _TtC23ShelfKitCollectionViewsP33_3B3149F5140CF30271827167208E639424_TraitEnvironmentWrapper *result;

  result = (_TtC23ShelfKitCollectionViewsP33_3B3149F5140CF30271827167208E639424_TraitEnvironmentWrapper *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews._TraitEnvironmentWrapper", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_3B3149F5140CF30271827167208E639424_TraitEnvironmentWrapper_traitCollection));
}

@end
