@implementation PillLabelView

- (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView *)sub_10059DCE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView)initWithCoder:(id)a3
{
  return (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView *)sub_10059DF38(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_label), "sizeThatFits:", a3.width, a3.height);
  v4 = v3 + 6.0 + 2.0;
  v6 = v5 + 2.0 + 6.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_label), "intrinsicContentSize");
  v3 = v2 + 6.0 + 2.0;
  v5 = v4 + 2.0 + 6.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PillLabelView();
  v2 = (char *)v9.receiver;
  -[PillLabelView layoutSubviews](&v9, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_label];
  objc_msgSend(v3, "sizeToFit", v9.receiver, v9.super_class);
  objc_msgSend(v2, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v11));

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_label));
  swift_bridgeObjectRelease(*(_QWORD *)&self->label[OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_text]);
}

@end
