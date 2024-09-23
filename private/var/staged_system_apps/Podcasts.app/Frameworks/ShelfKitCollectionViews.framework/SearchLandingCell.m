@implementation SearchLandingCell

- (_TtC23ShelfKitCollectionViews17SearchLandingCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17SearchLandingCell *)sub_11DDD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews17SearchLandingCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_11EE00();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews17SearchLandingCell *v6;

  v5 = a3;
  v6 = self;
  sub_11E43C((uint64_t)a3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[SearchLandingCell setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC23ShelfKitCollectionViews17SearchLandingCell *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_label);
  v3 = self;
  v4 = objc_msgSend(v2, "text");
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC23ShelfKitCollectionViews17SearchLandingCell *v8;
  _TtC23ShelfKitCollectionViews17SearchLandingCell *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[SearchLandingCell setAccessibilityLabel:](&v10, "setAccessibilityLabel:", a3);

}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[SearchLandingCell setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_label));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_objectGraph));
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_label));
}

@end
