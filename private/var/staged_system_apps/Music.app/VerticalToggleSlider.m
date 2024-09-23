@implementation VerticalToggleSlider

- (_TtC11MusicCoreUI20VerticalToggleSlider)initWithFrame:(CGRect)a3
{
  return (_TtC11MusicCoreUI20VerticalToggleSlider *)VerticalToggleSlider.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MusicCoreUI20VerticalToggleSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11MusicCoreUI20VerticalToggleSliderC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3;
  _TtC11MusicCoreUI20VerticalToggleSlider *v4;
  __int128 *v5;
  uint64_t v6;
  _TtC11MusicCoreUI20VerticalToggleSlider *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  if (*((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) == 2)
  {
    v3 = qword_1011DE350;
    v4 = self;
    if (v3 != -1)
      swift_once(&qword_1011DE350, sub_100CE1EFC);
    v5 = &xmmword_1011E6C48;
  }
  else
  {
    v6 = qword_1011DE358;
    v7 = self;
    if (v6 != -1)
      swift_once(&qword_1011DE358, sub_100CE1F14);
    v5 = &xmmword_1011E6C58;
  }
  v8 = *(double *)v5;
  v9 = *((double *)v5 + 1);

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)isEnabled
{
  return sub_100CE0FC4(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  sub_100CE1060(self, (uint64_t)a2, a3, (const char **)&selRef_isEnabled, (SEL *)&selRef_setEnabled_, (void (*)(id))sub_100CDEB7C);
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VerticalToggleSlider();
  v2 = v3.receiver;
  -[VerticalToggleSlider tintColorDidChange](&v3, "tintColorDidChange");
  sub_100CDC248();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC11MusicCoreUI20VerticalToggleSlider *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  LOBYTE(self) = _s11MusicCoreUI20VerticalToggleSliderC5point6inside4withSbSo7CGPointV_So7UIEventCSgtF_0(x, y);

  return self & 1;
}

- (void)didMoveToWindow
{
  _TtC11MusicCoreUI20VerticalToggleSlider *v2;

  v2 = self;
  VerticalToggleSlider.didMoveToWindow()();

}

- (BOOL)isHighlighted
{
  return sub_100CE0FC4(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_100CE1060(self, (uint64_t)a2, a3, (const char **)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_, (void (*)(id))sub_100CE1184);
}

- (void)longPressed:(id)a3
{
  id v4;
  _TtC11MusicCoreUI20VerticalToggleSlider *v5;

  v4 = a3;
  v5 = self;
  sub_100CDD974(v4);

}

- (void)dragged:(id)a3
{
  id v4;
  _TtC11MusicCoreUI20VerticalToggleSlider *v5;

  v4 = a3;
  v5 = self;
  sub_100CDDAB0(v4);

}

- (void).cxx_destruct
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition;
  sub_10013C57C(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition), *((_QWORD *)v3 + 1), *((void **)v3 + 2), *((_QWORD *)v3 + 3), *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), *((_QWORD *)v3 + 6), *((_QWORD *)v3 + 7), *((_QWORD *)v3 + 8), *((_QWORD *)v3 + 9));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___stretchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___growView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___levelView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressGestureRecognizer));
}

- (BOOL)accessibilityToggleIsOn
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) != 2;
}

- (BOOL)accessibilityAutomaticallyDisablesOnMaxValue
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_automaticallyDisablesOnMaxValue;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_automaticallyDisablesOnMaxValue, v4, 0, 0);
  return *v2;
}

- (float)accessibilityMinValue
{
  return *(float *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
}

- (float)accessibilityMaxValue
{
  return *(float *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
}

- (float)accessibilitySliderValue
{
  float result;

  VerticalToggleSlider.value.getter();
  return result;
}

- (void)accessibilitySetSliderValue:(double)a3
{
  _TtC11MusicCoreUI20VerticalToggleSlider *v4;

  v4 = self;
  VerticalToggleSlider.accessibilitySetSliderValue(_:)(a3);

}

@end
