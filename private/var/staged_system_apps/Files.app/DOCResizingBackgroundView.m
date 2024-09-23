@implementation DOCResizingBackgroundView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC5FilesP33_09D0274269B98F0636737C10BDC1F70925DOCResizingBackgroundView_preferredHeight);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC5FilesP33_09D0274269B98F0636737C10BDC1F70925DOCResizingBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_09D0274269B98F0636737C10BDC1F70925DOCResizingBackgroundView_preferredHeight) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[DOCResizingBackgroundView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC5FilesP33_09D0274269B98F0636737C10BDC1F70925DOCResizingBackgroundView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_09D0274269B98F0636737C10BDC1F70925DOCResizingBackgroundView_preferredHeight) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[DOCResizingBackgroundView initWithCoder:](&v7, "initWithCoder:", a3);
}

@end
