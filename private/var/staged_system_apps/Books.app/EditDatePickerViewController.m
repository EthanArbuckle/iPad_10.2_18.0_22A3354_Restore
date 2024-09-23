@implementation EditDatePickerViewController

- (void)loadView
{
  _TtC5Books28EditDatePickerViewController *v2;

  v2 = self;
  sub_100340BF8();

}

- (_TtC5Books28EditDatePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5Books28EditDatePickerViewController *)sub_100340FF0(v5, v7, a4);
}

- (_TtC5Books28EditDatePickerViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC5Books28EditDatePickerViewController *v8;
  char *v9;
  uint64_t v10;
  _TtC5Books28EditDatePickerViewController *v11;
  objc_super v13;

  v5 = OBJC_IVAR____TtC5Books28EditDatePickerViewController_datePicker;
  v6 = objc_allocWithZone((Class)UIDatePicker);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v9 = (char *)v8 + OBJC_IVAR____TtC5Books28EditDatePickerViewController_initialDate;
  v10 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for EditDatePickerViewController(0);
  v11 = -[EditDatePickerViewController initWithCoder:](&v13, "initWithCoder:", v7);

  return v11;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books28EditDatePickerViewController_datePicker));
  sub_100010D2C((uint64_t)self + OBJC_IVAR____TtC5Books28EditDatePickerViewController_initialDate);
}

@end
