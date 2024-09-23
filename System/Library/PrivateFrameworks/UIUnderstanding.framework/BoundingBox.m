@implementation BoundingBox

- (CGRect)rect
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_rect);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_rect);
  swift_beginAccess();
  *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (CGSize)imageSize
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_imageSize);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_imageSize);
  swift_beginAccess();
  *v5 = width;
  v5[1] = height;
}

- (_TtC15UIUnderstanding11BoundingBox)initWithRect:(CGRect)a3 imageSize:(CGSize)a4
{
  objc_super v5;

  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_rect) = a3;
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_imageSize) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BoundingBox();
  return -[BoundingBox init](&v5, sel_init);
}

- (NSString)description
{
  _TtC15UIUnderstanding11BoundingBox *v2;
  void *v3;

  v2 = self;
  sub_24970F004();

  v3 = (void *)sub_24972CB94();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15UIUnderstanding11BoundingBox)init
{
  _TtC15UIUnderstanding11BoundingBox *result;

  result = (_TtC15UIUnderstanding11BoundingBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
