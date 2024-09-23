@implementation PBFCircleView

- (double)strokeWidth
{
  _TtC11PosterBoard13PBFCircleView *v3;
  double v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1CBB82754();
  swift_release();
  swift_release();

  return v5;
}

- (void)setStrokeWidth:(double)a3
{
  _TtC11PosterBoard13PBFCircleView *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1CBB82760();
}

- (UIColor)strokeColor
{
  return (UIColor *)sub_1CBB35D70(self);
}

- (void)setStrokeColor:(id)a3
{
  sub_1CBB35E78(self, (uint64_t)a2, a3);
}

- (UIColor)fillColor
{
  return (UIColor *)sub_1CBB35D70(self);
}

- (void)setFillColor:(id)a3
{
  sub_1CBB35E78(self, (uint64_t)a2, a3);
}

+ (Class)layerClass
{
  sub_1CBAEE3F0(0, &qword_1EF9B5708);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  _TtC11PosterBoard13PBFCircleView *v2;

  v2 = self;
  PBFCircleView.layoutSubviews()();

}

- (_TtC11PosterBoard13PBFCircleView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard13PBFCircleView *)PBFCircleView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard13PBFCircleView)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard13PBFCircleView *)PBFCircleView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC11PosterBoard13PBFCircleView__strokeWidth;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9B5718);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11PosterBoard13PBFCircleView__strokeColor;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9B5710);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC11PosterBoard13PBFCircleView__fillColor, v6);
}

@end
