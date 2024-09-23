@implementation TTRISizedToFitImageView

- (UIImage)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TTRISizedToFitImageView image](&v3, sel_image);
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[TTRISizedToFitImageView setImage:](&v6, sel_setImage_, v4);
  sub_1B480CC6C();

}

- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithImage:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC15RemindersUICore23TTRISizedToFitImageView *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore23TTRISizedToFitImageView_aspectRatioConstraint) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = a3;
  v7 = -[TTRISizedToFitImageView initWithImage:](&v9, sel_initWithImage_, v6);
  -[TTRISizedToFitImageView setContentMode:](v7, sel_setContentMode_, 2, v9.receiver, v9.super_class);
  sub_1B480CC6C();

  return v7;
}

- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC15RemindersUICore23TTRISizedToFitImageView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore23TTRISizedToFitImageView_aspectRatioConstraint) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[TTRISizedToFitImageView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  -[TTRISizedToFitImageView setContentMode:](v9, sel_setContentMode_, 2);
  sub_1B480CC6C();

  return v9;
}

- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore23TTRISizedToFitImageView *)TTRISizedToFitImageView.init(coder:)(a3);
}

- (_TtC15RemindersUICore23TTRISizedToFitImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC15RemindersUICore23TTRISizedToFitImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC15RemindersUICore23TTRISizedToFitImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore23TTRISizedToFitImageView_aspectRatioConstraint));
}

@end
