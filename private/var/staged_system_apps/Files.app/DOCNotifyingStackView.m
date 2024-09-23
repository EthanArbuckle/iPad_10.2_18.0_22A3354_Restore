@implementation DOCNotifyingStackView

- (void)layoutSubviews
{
  _TtC5FilesP33_AC5D3075082B3B9466C6D761FB909D2D21DOCNotifyingStackView *v2;

  v2 = self;
  sub_10049602C();

}

- (_TtC5FilesP33_AC5D3075082B3B9466C6D761FB909D2D21DOCNotifyingStackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5FilesP33_AC5D3075082B3B9466C6D761FB909D2D21DOCNotifyingStackView_stackViewDidLayoutSubviews);
  v9 = (objc_class *)type metadata accessor for DOCNotifyingStackView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[DOCNotifyingStackView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC5FilesP33_AC5D3075082B3B9466C6D761FB909D2D21DOCNotifyingStackView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5FilesP33_AC5D3075082B3B9466C6D761FB909D2D21DOCNotifyingStackView_stackViewDidLayoutSubviews);
  v6 = (objc_class *)type metadata accessor for DOCNotifyingStackView();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[DOCNotifyingStackView initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100087534(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5FilesP33_AC5D3075082B3B9466C6D761FB909D2D21DOCNotifyingStackView_stackViewDidLayoutSubviews), *(_QWORD *)&self->stackViewDidLayoutSubviews[OBJC_IVAR____TtC5FilesP33_AC5D3075082B3B9466C6D761FB909D2D21DOCNotifyingStackView_stackViewDidLayoutSubviews]);
}

@end
