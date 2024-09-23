@implementation FollowNavButton

- (_TtC23ShelfKitCollectionViews15FollowNavButton)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews15FollowNavButton *result;

  *((_BYTE *)&self->super.super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15FollowNavButton_followState) = 6;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews15FollowNavButton_updateStateCallbackDelay) = (Class)0x3FE0000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews15FollowNavButton_updateStateCallback) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews15FollowNavButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/FollowNavButton.swift", 45, 2, 56, 0);
  __break(1u);
  return result;
}

- (void)onClick
{
  _TtC23ShelfKitCollectionViews15FollowNavButton *v2;

  v2 = self;
  sub_13D588();

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC23ShelfKitCollectionViews15FollowNavButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_13E9B8();

  return v7;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15FollowNavButton_presenter));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15FollowNavButton_headerButtonTipProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15FollowNavButton_metricsController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15FollowNavButton_updateStateCallback));
}

- (NSString)accessibilityIdentifier
{
  _TtC23ShelfKitCollectionViews15FollowNavButton *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_13E298();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)accessibilityLabel
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = *((unsigned __int8 *)&self->super.super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews15FollowNavButton_followState);
  if (v2 == 6 || (sub_1008B0(v2), !v3))
  {
    v5 = 0;
  }
  else
  {
    v4 = v3;
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  return (NSString *)v5;
}

@end
