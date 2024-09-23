@implementation _UIKeyShortcutHUDPadCompactMetrics

- (double)standardHUDWidth
{
  return 10000.0;
}

- (double)standardMenuToolbarSpacing
{
  return 0.0;
}

- (double)minimumScreenEdgeDistance
{
  double v2;

  -[UIKeyShortcutHUDMetrics menuPanelStrokeWidth](self, "menuPanelStrokeWidth");
  return -v2;
}

- (double)minimumBottomScreenEdgeDistance
{
  return 0.0;
}

- (double)menuPlatterCornerRadius
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 12.0);
  return result;
}

- (double)toolbarPlatterCornerRadius
{
  return 0.0;
}

- (unint64_t)menuPanelCornerMask
{
  return 3;
}

- (BOOL)shouldExtendToolbarThroughSafeArea
{
  return 1;
}

- (double)toolbarPanelStrokeWidth
{
  return 0.0;
}

- (unint64_t)toolbarPanelCornerMask
{
  return 0;
}

- (double)standardMenuPadding
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 16.0);
  return result;
}

- (double)menuBaseVerticalContentInset
{
  double v3;
  double v4;
  double v5;

  -[_UIKeyShortcutHUDPadCompactMetrics standardMenuPadding](self, "standardMenuPadding");
  v4 = v3;
  -[_UIKeyShortcutHUDPadCompactMetrics menuCellHorizontalContentMargin](self, "menuCellHorizontalContentMargin");
  return v4 - v5;
}

- (double)toolbarContentInset
{
  return 5.0;
}

- (BOOL)toolbarStylesCategoriesAsPageControl
{
  return 1;
}

- (double)menuCellHorizontalContentMargin
{
  return 8.0;
}

- (double)toolbarCellCornerRadius
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 8.0);
  return result;
}

@end
