@implementation IconTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v15;
  _TtC8StocksUI18IconTextAttachment *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v15 = a3;
  v16 = self;
  v17 = sub_1DC3C1E24((uint64_t)a3, a6, v12, v11, width, height, x, y);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (_TtC8StocksUI18IconTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  if (!a3)
  {
    v13 = a4;
    v9 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    v12 = 0;
    return (_TtC8StocksUI18IconTextAttachment *)sub_1DC3C2030((uint64_t)v5, v9, v10, v12);
  }
  v6 = a4;
  v7 = v5;
  v5 = (void *)sub_1DC3FFDF4();
  v9 = v8;

  if (!a4)
    goto LABEL_5;
LABEL_3:
  v10 = sub_1DC408A4C();
  v12 = v11;

  return (_TtC8StocksUI18IconTextAttachment *)sub_1DC3C2030((uint64_t)v5, v9, v10, v12);
}

- (_TtC8StocksUI18IconTextAttachment)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  char *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC8StocksUI18IconTextAttachment_baselineAdjustment;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = (char *)self + OBJC_IVAR____TtC8StocksUI18IconTextAttachment_imageHeightOverride;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[IconTextAttachment initWithCoder:](&v9, sel_initWithCoder_, a3);
}

@end
