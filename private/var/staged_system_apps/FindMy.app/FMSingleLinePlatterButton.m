@implementation FMSingleLinePlatterButton

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMSingleLinePlatterButton_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMSingleLinePlatterButton_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMSingleLinePlatterButton_color));
}

- (_TtC6FindMy25FMSingleLinePlatterButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100259BD4();
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC6FindMy25FMSingleLinePlatterButton *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy25FMSingleLinePlatterButton_label);
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

- (BOOL)isUserInteractionEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMSingleLinePlatterButton();
  return -[FMSingleLinePlatterButton isUserInteractionEnabled](&v3, "isUserInteractionEnabled");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMSingleLinePlatterButton();
  v4 = (char *)v5.receiver;
  -[FMSingleLinePlatterButton setUserInteractionEnabled:](&v5, "setUserInteractionEnabled:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC6FindMy25FMSingleLinePlatterButton_label], "setEnabled:", v3, v5.receiver, v5.super_class);

}

- (_TtC6FindMy25FMSingleLinePlatterButton)init
{
  _TtC6FindMy25FMSingleLinePlatterButton *result;

  result = (_TtC6FindMy25FMSingleLinePlatterButton *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSingleLinePlatterButton", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
