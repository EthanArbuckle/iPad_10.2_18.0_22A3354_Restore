@implementation WFConfigurationParameterEditorHostingCellContext

- (UIColor)overridingBackgroundColor
{
  return self->_overridingBackgroundColor;
}

- (void)setOverridingBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_overridingBackgroundColor, a3);
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (void)setFillProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fillProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_overridingBackgroundColor, 0);
}

@end
