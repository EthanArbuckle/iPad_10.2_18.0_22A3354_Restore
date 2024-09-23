@implementation FMEmptyListButton

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMEmptyListButton_textColor));
}

- (_TtC6FindMy17FMEmptyListButton)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC6FindMy17FMEmptyListButton *result;

  v5 = OBJC_IVAR____TtC6FindMy17FMEmptyListButton_textColor;
  v6 = (void *)objc_opt_self(UIColor);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "systemBlueColor");
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6FindMy17FMEmptyListButton_isEnabled) = 1;

  result = (_TtC6FindMy17FMEmptyListButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMEmptyListButton.swift", 30, 2, 48, 0);
  __break(1u);
  return result;
}

- (NSString)accessibilityLabel
{
  _TtC6FindMy17FMEmptyListButton *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10022E3D8();
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

@end
