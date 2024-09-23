@implementation DateRangePickerContentView

- (_TtC11MobileNotes26DateRangePickerContentView)initWithCoder:(id)a3
{
  _TtC11MobileNotes26DateRangePickerContentView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes26DateRangePickerContentView____lazy_storage___dateRangePicker) = 0;

  result = (_TtC11MobileNotes26DateRangePickerContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004796E0, "MobileNotes/FolderComposerFilterCellDateRangePicker.swift", 57, 2, 71, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v6;
  id v7;
  _TtC11MobileNotes26DateRangePickerContentView *v8;
  int64_t *v9;
  void *v10;
  id v11;
  _TtC11MobileNotes26DateRangePickerContentView *v12;
  int64_t v13;

  if (a4 != 1)
  {
    if (a4)
      return 0;
    v6 = (void *)objc_opt_self(ICLocalizationUtilities);
    v7 = a3;
    v8 = self;
    if (objc_msgSend(v6, "isArabic"))
      goto LABEL_4;
LABEL_6:
    v9 = (int64_t *)&ICDateFilterTypeSelectionRelativeRangeAmountMax;
    goto LABEL_7;
  }
  v10 = (void *)objc_opt_self(ICLocalizationUtilities);
  v11 = a3;
  v12 = self;
  if ((objc_msgSend(v10, "isArabic") & 1) != 0)
    goto LABEL_6;
LABEL_4:
  v9 = (int64_t *)&ICDateFilterRelativeRangeSelectionTypeValidCount;
LABEL_7:
  v13 = *v9;

  return v13;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8;
  _TtC11MobileNotes26DateRangePickerContentView *v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;

  v8 = a3;
  v9 = self;
  sub_1003361C8(a4, a5);
  v11 = v10;

  if (v11)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  _TtC11MobileNotes26DateRangePickerContentView *v8;

  v7 = a3;
  v8 = self;
  sub_1003363A0(v7, a5);

}

- (_TtC11MobileNotes26DateRangePickerContentView)initWithFrame:(CGRect)a3
{
  _TtC11MobileNotes26DateRangePickerContentView *result;

  result = (_TtC11MobileNotes26DateRangePickerContentView *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.DateRangePickerContentView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000153C0((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC11MobileNotes26DateRangePickerContentView_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes26DateRangePickerContentView____lazy_storage___dateRangePicker));
}

@end
