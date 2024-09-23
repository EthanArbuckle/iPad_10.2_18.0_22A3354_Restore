@implementation TimePickerTableViewCell

- (_TtC13SleepHealthUI23TimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  char *v6;
  void *v7;
  char *v8;
  _TtC13SleepHealthUI23TimePickerTableViewCell *v9;
  _TtC13SleepHealthUI23TimePickerTableViewCell *v10;
  objc_super v12;

  if (a4)
  {
    sub_1A9CE82E0();
    v6 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell_item;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((_QWORD *)v6 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell____lazy_storage___timePicker) = 0;
    v7 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    v8 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell_item;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_QWORD *)v8 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell____lazy_storage___timePicker) = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TimePickerTableViewCell();
  v9 = -[TimePickerTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, v7);

  v10 = v9;
  sub_1A9C46400();

  return v10;
}

- (_TtC13SleepHealthUI23TimePickerTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC13SleepHealthUI23TimePickerTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell____lazy_storage___timePicker) = 0;
  v5 = a3;

  result = (_TtC13SleepHealthUI23TimePickerTableViewCell *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (NSString)description
{
  _TtC13SleepHealthUI23TimePickerTableViewCell *v2;
  void *v3;

  v2 = self;
  sub_1A9C46AD0();

  v3 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)prepareForReuse
{
  _TtC13SleepHealthUI23TimePickerTableViewCell *v2;

  v2 = self;
  sub_1A9C46BC4((SEL *)&selRef_prepareForReuse);

}

- (void)didMoveToSuperview
{
  _TtC13SleepHealthUI23TimePickerTableViewCell *v2;

  v2 = self;
  sub_1A9C46BC4((SEL *)&selRef_didMoveToSuperview);

}

- (void).cxx_destruct
{
  sub_1A9BEDB34((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell_item, (unint64_t *)&qword_1EEB44998, (unint64_t *)&qword_1EEB449A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell____lazy_storage___timePicker));
}

@end
