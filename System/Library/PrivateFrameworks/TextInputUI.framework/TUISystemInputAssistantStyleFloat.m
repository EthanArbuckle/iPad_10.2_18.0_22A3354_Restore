@implementation TUISystemInputAssistantStyleFloat

- (BOOL)enableButtonTintColor
{
  return 1;
}

- (BOOL)drawsPredictionBackdropView
{
  return 1;
}

- (UIColor)predictionSeparatorColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (UIColor)predictionHighlightColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
}

- (double)highlightMargin
{
  return 0.0;
}

- (double)highlightCornerRadius
{
  return 10.0;
}

- (BOOL)useContinuousCornerInHighlight
{
  return 1;
}

- (double)barButtonWidth
{
  return 36.0;
}

- (double)minimumInterBarItemSpace
{
  return 15.0;
}

- (UIImageSymbolConfiguration)barButtonImageSymbolConfiguration
{
  return (UIImageSymbolConfiguration *)objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 19.0);
}

- (double)separatorMargin
{
  return 13.0;
}

- (BOOL)shouldAnimatePredictionCandidate
{
  return 0;
}

- (BOOL)clipsToBounds
{
  return 1;
}

@end
