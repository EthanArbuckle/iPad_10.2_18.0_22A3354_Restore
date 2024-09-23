@implementation SocialButton

- (_TtC16MusicApplication12SocialButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12SocialButton *)sub_B49EC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12SocialButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B4B8BC();
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SocialButton();
  return -[SocialButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication12SocialButton *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for SocialButton();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[SocialButton isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[SocialButton setHighlighted:](&v8, "setHighlighted:", v3);
  sub_B4A7E8(v7);

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SocialButton();
  -[SocialButton frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC16MusicApplication12SocialButton *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for SocialButton();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  -[SocialButton frame](&v19, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[SocialButton setFrame:](&v18, "setFrame:", x, y, width, height);
  sub_B4AB24(v11, v13, v15, v17);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication12SocialButton *v5;
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
  sub_B4AC58(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)tintColorDidChange
{
  char *v2;
  unint64_t v3;
  unint64_t *v4;
  _BYTE v5[24];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SocialButton();
  v2 = (char *)v6.receiver;
  -[SocialButton tintColorDidChange](&v6, "tintColorDidChange");
  v3 = sub_1A2BC4((uint64_t)_swiftEmptyArrayStorage);
  v4 = (unint64_t *)&v2[OBJC_IVAR____TtC16MusicApplication12SocialButton_cachedBackgroundImagesForAppearances];
  swift_beginAccess(&v2[OBJC_IVAR____TtC16MusicApplication12SocialButton_cachedBackgroundImagesForAppearances], v5, 1, 0);
  *v4 = v3;
  swift_bridgeObjectRelease();
  sub_B4B174();

}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
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
  v13.super_class = (Class)type metadata accessor for SocialButton();
  v2 = (char *)v13.receiver;
  -[SocialButton layoutSubviews](&v13, "layoutSubviews");
  objc_msgSend(v2, "bounds", v13.receiver, v13.super_class);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "music_inheritedLayoutInsets");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicApplication12SocialButton_titleCompositingView], "setFrame:", UIEdgeInsetsInsetRect(v4, v6, v8, v10, v11, v12));
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicApplication12SocialButton_backgroundImageView], "setFrame:", v4, v6, v8, v10);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC16MusicApplication12SocialButton *v8;
  unsigned __int8 v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  if (-[SocialButton pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y))
  {
    v9 = -[SocialButton isEnabled](v8, "isEnabled");

    if ((v9 & 1) != 0)
      return v8;
  }
  else
  {

  }
  v8 = 0;
  return v8;
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
  v4.super_class = (Class)type metadata accessor for SocialButton();
  -[SocialButton setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  char *v2;
  uint64_t v3;
  NSString v4;

  v2 = *(char **)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication12SocialButton_titleCompositingView)
     + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text;
  v3 = *((_QWORD *)v2 + 1);
  if (v3)
  {
    swift_bridgeObjectRetain(*((_QWORD *)v2 + 1));
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setAccessibilityLabel:(id)a3
{
  _TtC16MusicApplication12SocialButton *v4;
  NSString v5;
  _TtC16MusicApplication12SocialButton *v6;
  objc_super v7;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v4 = self;
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SocialButton();
  -[SocialButton setAccessibilityLabel:](&v7, "setAccessibilityLabel:", v5);

}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SocialButton();
  -[SocialButton setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication12SocialButton_title]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication12SocialButton_cachedBackgroundImagesForAppearances));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12SocialButton_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12SocialButton_titleCompositingView));
}

@end
