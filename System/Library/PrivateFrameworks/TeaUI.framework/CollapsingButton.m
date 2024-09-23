@implementation CollapsingButton

- (_TtC5TeaUI16CollapsingButton)init
{
  return (_TtC5TeaUI16CollapsingButton *)CollapsingButton.init()();
}

- (_TtC5TeaUI16CollapsingButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  CollapsingButton.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC5TeaUI16CollapsingButton *v2;

  v2 = self;
  CollapsingButton.layoutSubviews()();

}

- (CGSize)intrinsicContentSize
{
  _TtC5TeaUI16CollapsingButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = CollapsingButton.intrinsicContentSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC5TeaUI16CollapsingButton *v3;
  unint64_t v4;
  unint64_t v5;
  CGSize v6;
  double width;
  double height;
  CGSize result;

  v3 = self;
  v6 = CollapsingButton.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  width = v6.width;
  height = v6.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  _TtC5TeaUI16CollapsingButton *v5;
  unint64_t v6;
  unint64_t v7;
  UILayoutPriority v8;
  UILayoutPriority v9;
  CGSize v10;
  double width;
  double height;
  CGSize result;

  v5 = self;
  v10 = CollapsingButton.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)((CGSize)__PAIR128__(v7, v6), v8, v9);

  width = v10.width;
  height = v10.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)didMoveToWindow
{
  _TtC5TeaUI16CollapsingButton *v2;

  v2 = self;
  CollapsingButton.didMoveToWindow()();

}

- (_TtC5TeaUI16CollapsingButton)initWithFrame:(CGRect)a3
{
  CollapsingButton.init(frame:)();
}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI16CollapsingButton_animationDelegate);
  sub_1B14F93D0((uint64_t)self + OBJC_IVAR____TtC5TeaUI16CollapsingButton_configuration);

}

- (BOOL)isAccessibilityElement
{
  _TtC5TeaUI16CollapsingButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = CollapsingButton.isAccessibilityElement.getter();

  return v3 & 1;
}

- (unint64_t)accessibilityTraits
{
  _TtC5TeaUI16CollapsingButton *v2;
  unint64_t v3;

  v2 = self;
  v3 = CollapsingButton.accessibilityTraits.getter();

  return v3;
}

@end
