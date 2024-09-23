@implementation ErrorView

- (_TtC5TeaUI9ErrorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ErrorView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC5TeaUI9ErrorView *v2;

  v2 = self;
  ErrorView.layoutSubviews()();

}

- (_TtC5TeaUI9ErrorView)initWithFrame:(CGRect)a3
{
  ErrorView.init(frame:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI9ErrorView_styler);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI9ErrorView_label);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI9ErrorView_scrollView);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI9ErrorView_visualEffectView);
  swift_release();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  _TtC5TeaUI9ErrorView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  ErrorView.accessibilityLabel.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B16B983C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  _TtC5TeaUI9ErrorView *v4;

  if (a3)
    sub_1B16B9860();
  v4 = self;
  ErrorView.accessibilityLabel.setter();

}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (void)setAccessibilityElements:(id)a3
{
  uint64_t v4;
  _TtC5TeaUI9ErrorView *v5;

  if (a3)
    v4 = sub_1B16B9B54();
  else
    v4 = 0;
  v5 = self;
  ErrorView.accessibilityElements.setter(v4);

}

@end
