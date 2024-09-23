@implementation GradientBackgroundDecorationView

+ (Class)layerClass
{
  sub_1D9B92368((uint64_t)a1);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8VideosUI32GradientBackgroundDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI32GradientBackgroundDecorationView *)sub_1D9B9238C();
}

- (_TtC8VideosUI32GradientBackgroundDecorationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B92738();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI32GradientBackgroundDecorationView_gradientLayer));
}

@end
