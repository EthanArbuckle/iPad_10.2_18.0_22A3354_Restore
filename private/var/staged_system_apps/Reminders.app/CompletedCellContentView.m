@implementation CompletedCellContentView

- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithCoder:(id)a3
{
  _TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *result;

  result = (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIRemindersListCompletedCellContent.swift", 53, 2, 168, 0);
  __break(1u);
  return result;
}

- (NSArray)accessibilityElements
{
  _TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100404AEC();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)showHideAction:(id)a3
{
  _TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v9);
  swift_unknownObjectRelease(a3);
  v6 = *(void (**)(uint64_t))&v5->clearButton[OBJC_IVAR____TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView_internalConfiguration];
  if (v6)
  {
    v7 = *(_QWORD *)&v5->showHideButton[OBJC_IVAR____TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView_internalConfiguration];
    v8 = swift_retain();
    v6(v8);
    sub_1000381B8((uint64_t)v6, v7);
  }

  sub_100027F10(v9);
}

- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithFrame:(CGRect)a3
{
  _TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *result;

  result = (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *)_swift_stdlib_reportUnimplementedInitializer("Reminders.CompletedCellContentView", 34, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithArrangedSubviews:(id)a3
{
  _TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *result;

  result = (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *)_swift_stdlib_reportUnimplementedInitializer("Reminders.CompletedCellContentView", 34, "init(arrangedSubviews:)", 23, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = &self->NUIContainerStackView_opaque[OBJC_IVAR____TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView_internalConfiguration];
  v4 = *(_QWORD *)&self->completedCountLabel[OBJC_IVAR____TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView_internalConfiguration];
  v5 = *(_QWORD *)&self->clearButton[OBJC_IVAR____TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView_internalConfiguration];
  v6 = *((_QWORD *)v3 + 4);
  v7 = *((_QWORD *)v3 + 5);
  v8 = *((_QWORD *)v3 + 6);
  swift_bridgeObjectRelease(v4);
  sub_1000381B8(v5, v6);
  sub_1000381B8(v7, v8);
}

@end
