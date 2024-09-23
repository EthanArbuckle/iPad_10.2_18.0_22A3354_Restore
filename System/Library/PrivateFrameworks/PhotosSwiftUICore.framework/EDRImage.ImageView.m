@implementation EDRImage.ImageView

- (void)layoutSubviews
{
  _TtCV17PhotosSwiftUICore8EDRImage9ImageView *v2;

  v2 = self;
  sub_24421F800();

}

- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithImage:(id)a3
{
  id v4;
  _TtCV17PhotosSwiftUICore8EDRImage9ImageView *result;

  v4 = a3;
  sub_24421F894(a3);
  return result;
}

- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v6;
  id v7;
  _TtCV17PhotosSwiftUICore8EDRImage9ImageView *result;

  v6 = a3;
  v7 = a4;
  sub_24421F928(a3, a4);
  return result;
}

- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithFrame:(CGRect)a3
{
  return (_TtCV17PhotosSwiftUICore8EDRImage9ImageView *)sub_24421F9E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV17PhotosSwiftUICore8EDRImage9ImageView)initWithCoder:(id)a3
{
  _TtCV17PhotosSwiftUICore8EDRImage9ImageView *result;

  sub_24421FA98(a3);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCV17PhotosSwiftUICore8EDRImage9ImageView_edrGainView));
  swift_bridgeObjectRelease();
}

@end
