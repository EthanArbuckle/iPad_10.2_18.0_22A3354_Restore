@implementation EmptyStateView

- (_TtC5TeaUI14EmptyStateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  EmptyStateView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC5TeaUI14EmptyStateView *v2;

  v2 = self;
  EmptyStateView.layoutSubviews()();

}

- (_TtC5TeaUI14EmptyStateView)initWithFrame:(CGRect)a3
{
  EmptyStateView.init(frame:)();
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection + OBJC_IVAR____TtC5TeaUI14EmptyStateView_model);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI14EmptyStateView_styler);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14EmptyStateView_label);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14EmptyStateView_imageView);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14EmptyStateView_scrollView);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14EmptyStateView_visualEffectView);
  swift_release();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  _TtC5TeaUI14EmptyStateView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  EmptyStateView.accessibilityLabel.getter();
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
  _TtC5TeaUI14EmptyStateView *v4;

  if (a3)
    sub_1B16B9860();
  v4 = self;
  EmptyStateView.accessibilityLabel.setter();

}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (void)setAccessibilityElements:(id)a3
{
  uint64_t v4;
  _TtC5TeaUI14EmptyStateView *v5;

  if (a3)
    v4 = sub_1B16B9B54();
  else
    v4 = 0;
  v5 = self;
  EmptyStateView.accessibilityElements.setter(v4);

}

@end
