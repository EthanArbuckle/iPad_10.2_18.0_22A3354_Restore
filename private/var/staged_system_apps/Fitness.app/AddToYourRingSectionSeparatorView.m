@implementation AddToYourRingSectionSeparatorView

- (_TtC10FitnessApp33AddToYourRingSectionSeparatorView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  _TtC10FitnessApp33AddToYourRingSectionSeparatorView *v9;
  _TtC10FitnessApp33AddToYourRingSectionSeparatorView *v10;
  uint64_t v11;
  _TtC10FitnessApp33AddToYourRingSectionSeparatorView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC10FitnessApp33AddToYourRingSectionSeparatorView_div;
  sub_10001E724(0, (unint64_t *)&qword_100821308, UIView_ptr);
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)sub_1005AEEC8();

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for AddToYourRingSectionSeparatorView();
  v10 = -[AddToYourRingSectionSeparatorView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v11 = *(uint64_t *)((char *)&v10->super.super.super.super.isa
                   + OBJC_IVAR____TtC10FitnessApp33AddToYourRingSectionSeparatorView_div);
  v12 = v10;
  -[AddToYourRingSectionSeparatorView addSubview:](v12, "addSubview:", v11);
  sub_10011E0DC();

  return v12;
}

- (_TtC10FitnessApp33AddToYourRingSectionSeparatorView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC10FitnessApp33AddToYourRingSectionSeparatorView *v7;
  _TtC10FitnessApp33AddToYourRingSectionSeparatorView *v8;
  objc_super v10;

  v5 = OBJC_IVAR____TtC10FitnessApp33AddToYourRingSectionSeparatorView_div;
  sub_10001E724(0, (unint64_t *)&qword_100821308, UIView_ptr);
  v6 = a3;
  v7 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1005AEEC8();

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for AddToYourRingSectionSeparatorView();
  v8 = -[AddToYourRingSectionSeparatorView initWithCoder:](&v10, "initWithCoder:", v6);

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp33AddToYourRingSectionSeparatorView_div));
}

@end
