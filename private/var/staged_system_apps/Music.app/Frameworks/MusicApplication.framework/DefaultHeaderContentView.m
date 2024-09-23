@implementation DefaultHeaderContentView

- (_TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23092C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_22CA7C(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_22CF0C();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)music_inheritedLayoutInsetsDidChange
{
  _TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView *v2;

  v2 = self;
  sub_22D2A0();

}

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView *v2;

  v2 = self;
  sub_22D42C();

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  _TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_22E580();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (unint64_t)accessibilityTraits
{
  _TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView *v2;
  UIAccessibilityTraits v3;

  v2 = self;
  v3 = sub_22E8A8();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView____lazy_storage___topLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView____lazy_storage___bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView____lazy_storage___chevronImageView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView____lazy_storage___artworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_systemStyleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_topHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_bottomHairlineView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_tapGestureRecognizerHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_tapGestureRecognizer));
}

@end
