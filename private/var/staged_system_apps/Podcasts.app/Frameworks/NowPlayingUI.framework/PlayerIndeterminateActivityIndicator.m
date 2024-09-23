@implementation PlayerIndeterminateActivityIndicator

- (_TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator)initWithFrame:(CGRect)a3
{
  _TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator *result;

  sub_108DF4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)tick
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_phaseXPosition) = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_speed) + *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_phaseXPosition);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_patternLayer), "setBackgroundColorPhase:");
}

- (_TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1091F0();
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PlayerIndeterminateActivityIndicator();
  v2 = (char *)v13.receiver;
  -[PlayerIndeterminateActivityIndicator layoutSubviews](&v13, "layoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_patternLayer];
  v4 = objc_msgSend(v2, "layer", v13.receiver, v13.super_class);
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_patternLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_displayLink));
}

@end
