@implementation FMItemTerminalView

- (void)dealloc
{
  _TtC6FindMy18FMItemTerminalView *v2;
  objc_super v3;

  v2 = self;
  sub_100169A20();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FMItemTerminalView();
  -[FMTerminalView dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_secondaryActionButtonHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_tertiaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_tertiaryActionButtonHeight));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_cardChangeSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_devicesSubscription));
}

- (_TtC6FindMy18FMItemTerminalView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10016AA90();
}

- (void)handleSecondaryAction
{
  _TtC6FindMy18FMItemTerminalView *v2;

  v2 = self;
  sub_10016A3CC();

}

- (void)handleTertiaryAction
{
  _TtC6FindMy18FMItemTerminalView *v2;

  v2 = self;
  sub_10016A410();

}

@end
