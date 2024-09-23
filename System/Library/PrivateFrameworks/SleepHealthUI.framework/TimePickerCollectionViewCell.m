@implementation TimePickerCollectionViewCell

- (_TtC13SleepHealthUI28TimePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC13SleepHealthUI28TimePickerCollectionViewCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell____lazy_storage___timePicker) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TimePickerCollectionViewCell();
  v8 = -[TimePickerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1A9C462F0();

  return v8;
}

- (_TtC13SleepHealthUI28TimePickerCollectionViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC13SleepHealthUI28TimePickerCollectionViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell____lazy_storage___timePicker) = 0;
  v5 = a3;

  result = (_TtC13SleepHealthUI28TimePickerCollectionViewCell *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (NSString)description
{
  _TtC13SleepHealthUI28TimePickerCollectionViewCell *v2;
  void *v3;

  v2 = self;
  sub_1A9BC9E30();

  v3 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)prepareForReuse
{
  sub_1A9BC9F00(self, (uint64_t)a2, (const char **)&selRef_prepareForReuse);
}

- (void)didMoveToSuperview
{
  sub_1A9BC9F00(self, (uint64_t)a2, (const char **)&selRef_didMoveToSuperview);
}

- (void).cxx_destruct
{
  sub_1A9BCA260((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell____lazy_storage___timePicker));
}

@end
