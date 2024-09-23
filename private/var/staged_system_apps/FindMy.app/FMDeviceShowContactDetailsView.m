@implementation FMDeviceShowContactDetailsView

- (_TtC6FindMy30FMDeviceShowContactDetailsView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  double v7;
  id v8;
  char *v9;
  _TtC6FindMy30FMDeviceShowContactDetailsView *result;

  v4 = OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_showContactDetailsSwitch;
  v5 = qword_1005D20B8;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_1005D20B8, sub_10005E610);
  if (qword_1005D1E80 != -1)
    swift_once(&qword_1005D1E80, sub_100008974);
  v7 = *(double *)&qword_1005F5978;
  v8 = objc_allocWithZone((Class)type metadata accessor for FMSettingRowView());
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_10044402C(1, v7);
  v9 = (char *)self + OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_delegate;
  *((_QWORD *)v9 + 1) = 0;
  swift_unknownObjectWeakInit(v9);

  result = (_TtC6FindMy30FMDeviceShowContactDetailsView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMDeviceShowContactDetailsView.swift", 43, 2, 38, 0);
  __break(1u);
  return result;
}

- (void)setupSubviews
{
  _TtC6FindMy30FMDeviceShowContactDetailsView *v2;

  v2 = self;
  sub_10039BEEC();

}

- (void)showContactDetailsRowTap
{
  _TtC6FindMy30FMDeviceShowContactDetailsView *v2;

  v2 = self;
  sub_10039C1C8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_showContactDetailsSwitch));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.titleLabel[OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_phoneNumber]);
}

@end
