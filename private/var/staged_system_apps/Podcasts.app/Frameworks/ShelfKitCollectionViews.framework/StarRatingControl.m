@implementation StarRatingControl

- (_TtC23ShelfKitCollectionViews17StarRatingControl)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews17StarRatingControl *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_starCount) = (Class)(&dword_4 + 1);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_hasRTLTransformSet) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_rating) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_lastSentRating) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews17StarRatingControl *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/StarRatingControl.swift", 47, 2, 52, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_13CED0();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[StarRatingControl sizeThatFits:](self, "sizeThatFits:", 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC23ShelfKitCollectionViews17StarRatingControl *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_13BA4C(x, y, width, height);

}

- (uint64_t)beginTrackingWithTouch:(void *)a3 withEvent:(void *)a4
{
  id v6;
  id v7;
  char *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_msgSend(v6, "locationInView:", v8);
  sub_13C0CC(v9);
  v10 = *(_QWORD *)&v8[OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_rating];
  *(_QWORD *)&v8[OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_rating] = v11;
  if (v10 != v11)
    objc_msgSend(v8, "setNeedsDisplay");

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  _TtC23ShelfKitCollectionViews17StarRatingControl *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_13CFC8(a3);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews17StarRatingControl *v5;

  v4 = a3;
  v5 = self;
  sub_13D058();

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
  v4.super_class = (Class)type metadata accessor for StarRatingControl();
  -[StarRatingControl setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_13C27C(self, (uint64_t)a2, 0xD00000000000001FLL, (void *)0x800000000030FD40);
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_13C3A0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_13C27C(self, (uint64_t)a2, 0xD00000000000001ELL, (void *)0x800000000030FD20);
}

- (void)setAccessibilityHint:(id)a3
{
  sub_13C3A0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_13D0E8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC23ShelfKitCollectionViews17StarRatingControl_rating));
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setAccessibilityValue:(id)a3
{
  sub_13C3A0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (NSArray)accessibilityCustomActions
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_13C498();

  if (v3)
  {
    sub_E710(0, &qword_3D8348, UIAccessibilityCustomAction_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  void *isa;
  uint64_t v5;
  uint64_t v6;
  _TtC23ShelfKitCollectionViews17StarRatingControl *v7;
  _TtC23ShelfKitCollectionViews17StarRatingControl *v8;
  objc_super v9;

  isa = a3;
  if (a3)
  {
    v5 = sub_E710(0, &qword_3D8348, UIAccessibilityCustomAction_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v5);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StarRatingControl();
  -[StarRatingControl setAccessibilityCustomActions:](&v9, "setAccessibilityCustomActions:", isa);

}

- (void)accessibilitySetStarRatingZero
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *v2;

  v2 = self;
  sub_13C86C(0);

}

- (void)accessibilitySetStarRatingOne
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *v2;

  v2 = self;
  sub_13C86C(1);

}

- (void)accessibilitySetStarRatingTwo
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *v2;

  v2 = self;
  sub_13C86C(2);

}

- (void)accessibilitySetStarRatingThree
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *v2;

  v2 = self;
  sub_13C86C(3);

}

- (void)accessibilitySetStarRatingFour
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *v2;

  v2 = self;
  sub_13C86C(4);

}

- (void)accessibilitySetStarRatingFive
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *v2;

  v2 = self;
  sub_13C86C(5);

}

- (_TtC23ShelfKitCollectionViews17StarRatingControl)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews17StarRatingControl *result;

  result = (_TtC23ShelfKitCollectionViews17StarRatingControl *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.StarRatingControl", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
