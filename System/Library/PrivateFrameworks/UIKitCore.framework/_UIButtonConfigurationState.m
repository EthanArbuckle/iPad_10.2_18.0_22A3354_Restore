@implementation _UIButtonConfigurationState

- (unint64_t)_controlState
{
  unint64_t v3;

  v3 = -[UIViewConfigurationState isHighlighted](self, "isHighlighted");
  if (-[UIViewConfigurationState isDisabled](self, "isDisabled"))
    v3 |= 2uLL;
  if (-[UIViewConfigurationState isSelected](self, "isSelected"))
    v3 |= 4uLL;
  if (-[UIViewConfigurationState isFocused](self, "isFocused"))
    return v3 | 8;
  else
    return v3;
}

@end
