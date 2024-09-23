@implementation MapOptionsPlatterView

- (_TtC12PhotosUICore21MapOptionsPlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC12PhotosUICore21MapOptionsPlatterView *)MapOptionsPlatterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12PhotosUICore21MapOptionsPlatterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A6C6C150();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore21MapOptionsPlatterView_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore21MapOptionsPlatterView_shadowView));
}

@end
