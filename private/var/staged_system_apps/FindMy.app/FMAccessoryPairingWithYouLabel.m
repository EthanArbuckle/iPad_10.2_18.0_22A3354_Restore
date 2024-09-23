@implementation FMAccessoryPairingWithYouLabel

- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)init
{
  uint64_t v3;
  id v4;
  _TtC6FindMy30FMAccessoryPairingWithYouLabel *v5;
  uint64_t v6;
  _TtC6FindMy30FMAccessoryPairingWithYouLabel *v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_dotView;
  v4 = objc_allocWithZone((Class)type metadata accessor for FMAccessoryPairingWithYouIndicator());
  v5 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)objc_msgSend(v4, "init");
  v6 = OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_textLabel;
  *(Class *)((char *)&v5->super.super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)UILabel), "init");

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for FMAccessoryPairingWithYouLabel();
  v7 = -[FMAccessoryPairingWithYouLabel initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_100325DBC();

  return v7;
}

- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy30FMAccessoryPairingWithYouLabel *result;

  v5 = OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_dotView;
  v6 = objc_allocWithZone((Class)type metadata accessor for FMAccessoryPairingWithYouIndicator());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_textLabel;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UILabel), "init");

  result = (_TtC6FindMy30FMAccessoryPairingWithYouLabel *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMAccessoryPairingWithYouLabel.swift", 43, 2, 22, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)initWithFrame:(CGRect)a3
{
  _TtC6FindMy30FMAccessoryPairingWithYouLabel *result;

  result = (_TtC6FindMy30FMAccessoryPairingWithYouLabel *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryPairingWithYouLabel", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_dotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_textLabel));
}

@end
