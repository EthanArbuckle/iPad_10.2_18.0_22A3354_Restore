@implementation SocialOnboardingNetworkCell

- (_TtC16MusicApplication27SocialOnboardingNetworkCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication27SocialOnboardingNetworkCell *)sub_7D143C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication27SocialOnboardingNetworkCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MusicApplication27SocialOnboardingNetworkCell *result;

  v5 = OBJC_IVAR____TtC16MusicApplication27SocialOnboardingNetworkCell_networkStackView;
  type metadata accessor for SocialOnboardingNetworkStackView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MusicApplication27SocialOnboardingNetworkCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/SocialOnboardingNetworkCell.swift", 50, 2, 38, 0);
  __break(1u);
  return result;
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.super.super.super.super.super.isa
                            + OBJC_IVAR____TtC16MusicApplication27SocialOnboardingNetworkCell_networkStackView)
                 + OBJC_IVAR____TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView_title
                 + 8);
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC16MusicApplication27SocialOnboardingNetworkCell *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v9 = a3;
  v8 = self;
  sub_7D1F34(v5, v7);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication27SocialOnboardingNetworkCell *v2;

  v2 = self;
  sub_7D17BC();

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SocialOnboardingNetworkCell();
  return -[SocialOnboardingNetworkCell isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SocialOnboardingNetworkCell();
  v4 = v5.receiver;
  -[SocialOnboardingNetworkCell setHighlighted:](&v5, "setHighlighted:", v3);
  sub_7D1FF4((char)objc_msgSend(v4, "isHighlighted", v5.receiver, v5.super_class));

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SocialOnboardingNetworkCell_networkStackView));
}

@end
