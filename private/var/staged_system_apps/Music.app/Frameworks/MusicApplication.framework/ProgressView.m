@implementation ProgressView

- (_TtC16MusicApplication12ProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12ProgressView *)sub_8AFC48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12ProgressView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_8B04B8();
}

- (double)progress
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12ProgressView_progress);
}

- (void)setProgress:(double)a3
{
  _TtC16MusicApplication12ProgressView *v4;

  v4 = self;
  sub_8AFF90(a3);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication12ProgressView *v2;

  v2 = self;
  sub_8B0194();

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = fmin(result.height, 5.0);
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12ProgressView_progressFillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12ProgressView_backgroundView));
}

@end
