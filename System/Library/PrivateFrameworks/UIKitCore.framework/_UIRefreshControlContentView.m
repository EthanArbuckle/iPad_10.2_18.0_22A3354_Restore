@implementation _UIRefreshControlContentView

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (double)minimumSnappingHeight
{
  return 0.0;
}

- (void)willTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  id v4;

  if (a3 != a4)
  {
    -[UIView layer](self, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");

  }
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setRefreshControl:(id)a3
{
  self->_refreshControl = (UIRefreshControl *)a3;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, a3);
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (NSAttributedString)attributedTitle
{
  return 0;
}

- (int64_t)style
{
  return 1;
}

- (double)maximumSnappingHeight
{
  return 0.0;
}

- (double)_heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen
{
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
