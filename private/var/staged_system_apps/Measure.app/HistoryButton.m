@implementation HistoryButton

- (_TtC7Measure13HistoryButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC7Measure13HistoryButton *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_tapHandler);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_button) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_controlType) = 0;
  v5 = a3;

  result = (_TtC7Measure13HistoryButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/HistoryButton.swift", 27, 2, 80, 0);
  __break(1u);
  return result;
}

- (_TtC7Measure13HistoryButton)initWithFrame:(CGRect)a3
{
  _TtC7Measure13HistoryButton *result;

  result = (_TtC7Measure13HistoryButton *)_swift_stdlib_reportUnimplementedInitializer("Measure.HistoryButton", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000217BC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_tapHandler), *(_QWORD *)&self->tapHandler[OBJC_IVAR____TtC7Measure13HistoryButton_tapHandler]);

}

- (void)showHistoryFrom:(id)a3
{
  id v4;
  _TtC7Measure13HistoryButton *v5;

  v4 = a3;
  v5 = self;
  sub_1000830C0();

}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure13HistoryButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_100083160();

  return v9;
}

@end
