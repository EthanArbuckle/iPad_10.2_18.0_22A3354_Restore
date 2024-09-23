@implementation TSCardView

- (void)layoutSubviews
{
  TSCardView *v2;

  v2 = self;
  CardView.layoutSubviews()();

}

- (TSCardView)initWithCoder:(id)a3
{
  CardView.init(coder:)((uint64_t)a3);
}

- (void)toggleExpansion
{
  TSCardView *v2;

  v2 = self;
  CardView.toggleExpansion()();

}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1B1645FB4(self, (uint64_t)a2, (void (*)(void))CardView.accessibilityLabel.getter);
}

- (void)setAccessibilityLabel:(id)a3
{
  TSCardView *v4;

  if (a3)
    sub_1B16B9860();
  v4 = self;
  CardView.accessibilityLabel.setter();

}

- (TSCardView)initWithFrame:(CGRect)a3
{
  CardView.init(frame:)();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardView_onCloseTap);
  OUTLINED_FUNCTION_25_0(OBJC_IVAR___TSCardView_expandAccessibilityActionHandler);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardView_expandAccessibilityAction);
  OUTLINED_FUNCTION_25_0(OBJC_IVAR___TSCardView_collapseAccessibilityActionHandler);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardView_collapseAccessibilityAction);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardView_contentView);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardView_clippingView);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardView_grabberView);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardView_contentOverlayButtonView);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardView_barView);

}

- (BOOL)expandCard:(id)a3
{
  return sub_1B1646378(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSCardView_expandAccessibilityActionHandler);
}

- (BOOL)collapseCard:(id)a3
{
  return sub_1B1646378(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSCardView_collapseAccessibilityActionHandler);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  TSCardView *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = CardView.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)((UIGestureRecognizer)v8, (UIGestureRecognizer)v7);

  return v9;
}

@end
