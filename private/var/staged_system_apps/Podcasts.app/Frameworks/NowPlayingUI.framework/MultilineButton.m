@implementation MultilineButton

- (_TtC12NowPlayingUI15MultilineButton)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI15MultilineButton *)sub_B7240(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI15MultilineButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B98DC();
}

- (BOOL)isEnabled
{
  return sub_B7D84(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _TtC12NowPlayingUI15MultilineButton *v4;

  v4 = self;
  sub_B7AF8(a3);

}

- (BOOL)isHighlighted
{
  return sub_B7D84(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC12NowPlayingUI15MultilineButton *v4;

  v4 = self;
  sub_B7C24(a3);

}

- (BOOL)isSelected
{
  return sub_B7D84(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtC12NowPlayingUI15MultilineButton *v4;

  v4 = self;
  sub_B7E00(a3);

}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI15MultilineButton *v2;

  v2 = self;
  sub_B7F18();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12NowPlayingUI15MultilineButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_B813C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC12NowPlayingUI15MultilineButton *v8;
  unsigned __int8 v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  if (-[MultilineButton pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y))
  {
    v9 = -[MultilineButton isEnabled](v8, "isEnabled");

    if ((v9 & 1) != 0)
      return v8;
  }
  else
  {

  }
  v8 = 0;
  return v8;
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MultilineButton();
  v2 = v3.receiver;
  -[MultilineButton tintColorDidChange](&v3, "tintColorDidChange");
  sub_B85BC();

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MultilineButton();
  -[MultilineButton setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  _TtC12NowPlayingUI15MultilineButton *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_B83D8();
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

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC12NowPlayingUI15MultilineButton *v6;
  NSString v7;
  _TtC12NowPlayingUI15MultilineButton *v8;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MultilineButton();
  -[MultilineButton setAccessibilityLabel:](&v9, "setAccessibilityLabel:", v7);

}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MultilineButton();
  -[MultilineButton setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15MultilineButton_borderColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI15MultilineButton_lineComponents));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15MultilineButton_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15MultilineButton_backgroundImageView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI15MultilineButton_backgroundImagesForStates));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15MultilineButton_activityIndicatorView));
}

@end
