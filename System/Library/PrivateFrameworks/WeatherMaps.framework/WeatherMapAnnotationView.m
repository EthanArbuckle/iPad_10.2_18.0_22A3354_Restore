@implementation WeatherMapAnnotationView

- (_TtC11WeatherMaps24WeatherMapAnnotationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFC31E8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC11WeatherMaps24WeatherMapAnnotationView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1DBFC32AC();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps24WeatherMapAnnotationView *v2;

  v2 = self;
  sub_1DBFC336C();

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self;
  sub_1DBFC3504(a3, a4);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  void *v3;

  sub_1DBFC3640();
  if (v2)
  {
    v3 = (void *)sub_1DBFF8170();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_1DBFC37C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1DBFC3F88);
}

- (NSString)accessibilityValue
{
  _TtC11WeatherMaps24WeatherMapAnnotationView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DBFC36FC();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DBFF8170();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  sub_1DBFC37C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1DBFC3F88);
}

- (NSString)accessibilityHint
{
  return (NSString *)0;
}

- (void)setAccessibilityHint:(id)a3
{
  sub_1DBFC37C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1DBE8BD4C);
}

- (unint64_t)accessibilityTraits
{
  _TtC11WeatherMaps24WeatherMapAnnotationView *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1DBFC3854();

  return v3;
}

- (CGRect)accessibilityFrame
{
  _TtC11WeatherMaps24WeatherMapAnnotationView *v2;

  v2 = self;
  sub_1DBFC3920();
}

- (UIBezierPath)accessibilityPath
{
  _TtC11WeatherMaps24WeatherMapAnnotationView *v2;

  v2 = self;
  sub_1DBFC39E4();
}

- (void)setAccessibilityPath:(id)a3
{
  id v5;
  _TtC11WeatherMaps24WeatherMapAnnotationView *v6;

  v5 = a3;
  v6 = self;

}

- (CGPoint)accessibilityActivationPoint
{
  _TtC11WeatherMaps24WeatherMapAnnotationView *v2;

  v2 = self;
  sub_1DBFC3AF4();
}

- (_TtC11WeatherMaps24WeatherMapAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
    sub_1DBFF81A0();
  swift_unknownObjectRetain();
  sub_1DBFC3B84();
}

- (void).cxx_destruct
{
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_dataSource);
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_delegate);
  sub_1DBE9ADF8((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_viewModel, (uint64_t (*)(_QWORD))type metadata accessor for WeatherMapAnnotationViewModel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_cachedBalloonContentView);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_mapAnnotation);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView____lazy_storage___locationLabel);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView____lazy_storage___pinView));
}

- (id)_balloonImage
{
  return 0;
}

- (int64_t)_balloonCalloutStyle
{
  return 0;
}

- (id)_balloonContentView
{
  _TtC11WeatherMaps24WeatherMapAnnotationView *v2;

  v2 = self;
  sub_1DBFC3D94();
}

- (id)_balloonTintColor
{
  return sub_1DBFC3F3C();
}

@end
