@implementation UnanimatedContainerBoxView

- (void)layoutSubviews
{
  _TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView *v2;

  v2 = self;
  sub_100379338();

}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UnanimatedContainerBoxView();
  return -[UnanimatedContainerBoxView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithArrangedSubviews:(id)a3
{
  void *isa;
  uint64_t v5;
  uint64_t v6;
  _TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView *v7;
  objc_super v9;

  isa = a3;
  if (a3)
  {
    v5 = sub_100005ED8(0, (unint64_t *)&qword_1006406F0, UIView_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v5);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UnanimatedContainerBoxView();
  v7 = -[UnanimatedContainerBoxView initWithArrangedSubviews:](&v9, "initWithArrangedSubviews:", isa);

  return v7;
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UnanimatedContainerBoxView();
  return -[UnanimatedContainerBoxView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
