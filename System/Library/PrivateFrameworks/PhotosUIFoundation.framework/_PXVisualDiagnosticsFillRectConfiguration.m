@implementation _PXVisualDiagnosticsFillRectConfiguration

- (_PXVisualDiagnosticsFillRectConfiguration)init
{
  _PXVisualDiagnosticsFillRectConfiguration *v2;
  uint64_t v3;
  UIColor *fillColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXVisualDiagnosticsFillRectConfiguration;
  v2 = -[_PXVisualDiagnosticsFillRectConfiguration init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
    fillColor = v2->_fillColor;
    v2->_fillColor = (UIColor *)v3;

  }
  return v2;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
