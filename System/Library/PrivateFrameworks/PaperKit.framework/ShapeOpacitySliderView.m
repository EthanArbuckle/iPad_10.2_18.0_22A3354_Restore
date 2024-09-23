@implementation ShapeOpacitySliderView

- (_TtC8PaperKit22ShapeOpacitySliderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8PaperKit22ShapeOpacitySliderView *result;

  v5 = OBJC_IVAR____TtC8PaperKit22ShapeOpacitySliderView_gradient;
  v6 = objc_allocWithZone(MEMORY[0x1E0CD2790]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit22ShapeOpacitySliderView_trackImage) = 0;

  result = (_TtC8PaperKit22ShapeOpacitySliderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  _TtC8PaperKit22ShapeOpacitySliderView *v2;

  v2 = self;
  ShapeOpacitySliderView.didMoveToSuperview()();

}

- (void)layoutSubviews
{
  _TtC8PaperKit22ShapeOpacitySliderView *v2;

  v2 = self;
  ShapeOpacitySliderView.layoutSubviews()();

}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double height;
  objc_super v19;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)swift_getObjectType();
  -[ShapeOpacitySliderView thumbRectForBounds:trackRect:value:](&v19, sel_thumbRectForBounds_trackRect_value_, v11, v10, v9, v8, x, y, width, height, LODWORD(a5));
  v16 = a5 * -6.0 + 3.0 + v15;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v16;
  return result;
}

- (_TtC8PaperKit22ShapeOpacitySliderView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit22ShapeOpacitySliderView *result;

  result = (_TtC8PaperKit22ShapeOpacitySliderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit22ShapeOpacitySliderView_gradient));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit22ShapeOpacitySliderView_trackImage));
}

@end
