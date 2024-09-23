@implementation ParallaxView.ContentView

- (_TtCC16MusicApplication12ParallaxView11ContentView)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication12ParallaxView11ContentView *)sub_B97044(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ParallaxView.ContentView();
  return -[ParallaxView.ContentView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ParallaxView.ContentView();
  v4 = a3;
  v5 = v6.receiver;
  -[ParallaxView.ContentView setBackgroundColor:](&v6, "setBackgroundColor:", v4);
  sub_B98554();

}

- (_TtCC16MusicApplication12ParallaxView11ContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B9940C();
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication12ParallaxView11ContentView *v2;

  v2 = self;
  sub_B97BF4();

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_controlsView));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkImageDidChange), *(_QWORD *)&self->backgroundArtworkComponent[OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkImageDidChange]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkProminentColorDidChange), *(_QWORD *)&self->backgroundArtworkComponent[OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkProminentColorDidChange]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkImageAttachmentsDidChange), *(_QWORD *)&self->backgroundArtworkComponent[OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkImageAttachmentsDidChange]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_videoLooperDidChangeHandler), *(_QWORD *)&self->backgroundArtworkComponent[OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_videoLooperDidChangeHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_videoLooperDidFailHandler), *(_QWORD *)&self->backgroundArtworkComponent[OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_videoLooperDidFailHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_isPlayingDidChangeHandler), *(_QWORD *)&self->backgroundArtworkComponent[OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_isPlayingDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView____lazy_storage___overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_topBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_topBlurMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView____lazy_storage___bottomGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_gradientColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView____lazy_storage___legibilityGradient));
}

@end
