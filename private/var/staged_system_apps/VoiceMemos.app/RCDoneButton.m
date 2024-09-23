@implementation RCDoneButton

- (double)buttonHeight
{
  return 49.0;
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->buttonHeight[OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_titleString];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10VoiceMemos12RCDoneButton *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_titleString);
  v6 = *(_QWORD *)&self->buttonHeight[OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_titleString];
  *v5 = v4;
  v5[1] = v7;
  v8 = self;
  swift_bridgeObjectRelease(v6);
  -[RCDoneButton setNeedsUpdateConfiguration](v8, "setNeedsUpdateConfiguration");

}

- (_TtC10VoiceMemos12RCDoneButton)init
{
  return (_TtC10VoiceMemos12RCDoneButton *)sub_1001097E8();
}

- (_TtC10VoiceMemos12RCDoneButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10010A740();
}

- (void)setEnabled:(BOOL)a3 isHidden:(BOOL)a4 userInteractionEnabled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  _TtC10VoiceMemos12RCDoneButton *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = self;
  -[RCDoneButton setEnabled:](v8, "setEnabled:", v7);
  -[RCDoneButton setHidden:](v8, "setHidden:", v6);
  -[RCDoneButton setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", v5);

}

- (void)updateConfiguration
{
  _TtC10VoiceMemos12RCDoneButton *v2;

  v2 = self;
  sub_10010A05C();

}

- (double)calculatedWidth
{
  _TtC10VoiceMemos12RCDoneButton *v2;
  double v3;
  double v4;

  v2 = self;
  sub_10010A284();
  v4 = v3;

  return v4;
}

- (_TtC10VoiceMemos12RCDoneButton)initWithFrame:(CGRect)a3
{
  _TtC10VoiceMemos12RCDoneButton *result;

  result = (_TtC10VoiceMemos12RCDoneButton *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.RCDoneButton", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_layoutHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_styleProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->buttonHeight[OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_titleString]);
}

@end
