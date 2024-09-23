@implementation FMNoItemView

- (_TtC6FindMy12FMNoItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003BBE2C();
}

- (void)dealloc
{
  _TtC6FindMy12FMNoItemView *v2;
  objc_super v3;

  v2 = self;
  sub_1003BADB8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FMNoItemView();
  -[FMNoItemView dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy12FMNoItemView_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy12FMNoItemView_secondaryActionButtonHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy12FMNoItemView_tertiaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy12FMNoItemView_tertiaryActionButtonHeight));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy12FMNoItemView_devicesSubscription));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy12FMNoItemView_cardChangeSubscription));

}

- (void)handleAction
{
  _TtC6FindMy12FMNoItemView *v2;

  v2 = self;
  sub_1003BB298();

}

- (void)handleSecondaryAction
{
  _TtC6FindMy12FMNoItemView *v2;

  v2 = self;
  sub_1003BB4AC();

}

- (void)handleTertiaryAction
{
  _TtC6FindMy12FMNoItemView *v2;

  v2 = self;
  sub_1003BB4F0();

}

- (void)handleLearnMoreButton
{
  _TtC6FindMy12FMNoItemView *v2;

  v2 = self;
  sub_1003BB534();

}

@end
