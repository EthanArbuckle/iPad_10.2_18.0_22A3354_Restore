@implementation _PXVisualDiagnosticsStrokeRectConfiguration

- (_PXVisualDiagnosticsStrokeRectConfiguration)init
{
  _PXVisualDiagnosticsStrokeRectConfiguration *v2;
  uint64_t v3;
  UIColor *strokeColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXVisualDiagnosticsStrokeRectConfiguration;
  v2 = -[_PXVisualDiagnosticsStrokeRectConfiguration init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
    strokeColor = v2->_strokeColor;
    v2->_strokeColor = (UIColor *)v3;

    v2->_lineWidth = 1.0;
  }
  return v2;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
