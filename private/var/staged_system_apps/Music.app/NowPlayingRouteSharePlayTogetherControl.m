@implementation NowPlayingRouteSharePlayTogetherControl

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  _TtC5Music39NowPlayingRouteSharePlayTogetherControl *v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (self->routeButton[OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_style] == 1)
  {
    if (*(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_style))
    {
      v2 = qword_10119C048;
      v3 = self;
      if (v2 != -1)
        swift_once(&qword_10119C048, sub_1004652D0);
      v5 = *((double *)&xmmword_10124D060 + 1);
      v4 = *(double *)&xmmword_10124D060;

    }
    else
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_routeButton), "intrinsicContentSize");
      v4 = v6;
      v5 = v7;
    }
  }
  else
  {
    v4 = UIViewNoIntrinsicMetric;
    v5 = UIViewNoIntrinsicMetric;
  }
  v8 = v4;
  v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC5Music39NowPlayingRouteSharePlayTogetherControl)initWithFrame:(CGRect)a3
{
  return (_TtC5Music39NowPlayingRouteSharePlayTogetherControl *)sub_100465DEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC5Music39NowPlayingRouteSharePlayTogetherControl *v2;

  v2 = self;
  sub_100466E98();

}

- (_TtC5Music39NowPlayingRouteSharePlayTogetherControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10046738C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_sharePlayTogetherButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_routeButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_sharePlayTogetherButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_badgeMaskLayer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_inactiveStyleConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_activeStyleConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_routeOnlyStyleConstraints));
}

@end
