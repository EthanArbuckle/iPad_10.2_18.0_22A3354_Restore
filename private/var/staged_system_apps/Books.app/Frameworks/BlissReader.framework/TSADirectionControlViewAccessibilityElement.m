@implementation TSADirectionControlViewAccessibilityElement

- (UIView)directionView
{
  return (UIView *)-[TSADirectionControlViewControllerAccessibility tsaxDirectionView](-[TSADirectionControlViewAccessibilityElement directionViewController](self, "directionViewController"), "tsaxDirectionView");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("direction.control.description"));
}

- (id)accessibilityValue
{
  return -[TSADirectionControlViewControllerAccessibility accessibilityValue](-[TSADirectionControlViewAccessibilityElement directionViewController](self, "directionViewController"), "accessibilityValue");
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView accessibilityFrame](-[TSADirectionControlViewAccessibilityElement directionView](self, "directionView"), "accessibilityFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)accessibilityIncrement
{
  -[TSADirectionControlViewControllerAccessibility accessibilityIncrement](-[TSADirectionControlViewAccessibilityElement directionViewController](self, "directionViewController"), "accessibilityIncrement");
}

- (void)accessibilityDecrement
{
  -[TSADirectionControlViewControllerAccessibility accessibilityDecrement](-[TSADirectionControlViewAccessibilityElement directionViewController](self, "directionViewController"), "accessibilityDecrement");
}

- (TSADirectionControlViewControllerAccessibility)directionViewController
{
  return self->_directionViewController;
}

- (void)setDirectionViewController:(id)a3
{
  self->_directionViewController = (TSADirectionControlViewControllerAccessibility *)a3;
}

@end
