@implementation TTRIInsetTextField

- (double)horizontalInset
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset);
  swift_beginAccess();
  return *v2;
}

- (void)setHorizontalInset:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset);
  swift_beginAccess();
  *v4 = a3;
}

- (double)verticalInset
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_verticalInset);
  swift_beginAccess();
  return *v2;
}

- (void)setVerticalInset:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_verticalInset);
  swift_beginAccess();
  *v4 = a3;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1B4386618(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_textRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1B4386618(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_editingRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1B4386618(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_placeholderRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxX;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)swift_getObjectType();
  v7 = (char *)v21.receiver;
  -[TTRIInsetTextField clearButtonRectForBounds:](&v21, sel_clearButtonRectForBounds_, x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MaxX = CGRectGetMaxX(v22);
  v15 = (double *)&v7[OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset];
  swift_beginAccess();
  v16 = *v15;

  v17 = MaxX - (v11 + v16);
  v18 = v9;
  v19 = v11;
  v20 = v13;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (_TtC15RemindersUICore18TTRIInsetTextField)initWithFrame:(CGRect)a3
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
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_verticalInset) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[TTRITextField initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore18TTRIInsetTextField)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_horizontalInset) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore18TTRIInsetTextField_verticalInset) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TTRITextField initWithCoder:](&v7, sel_initWithCoder_, a3);
}

@end
