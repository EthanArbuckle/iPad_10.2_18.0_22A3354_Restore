@implementation UIToolTipConfiguration

+ (UIToolTipConfiguration)configurationWithToolTip:(NSString *)toolTip
{
  return +[UIToolTipConfiguration configurationWithToolTip:inRect:](UIToolTipConfiguration, "configurationWithToolTip:inRect:", toolTip, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

+ (UIToolTipConfiguration)configurationWithToolTip:(NSString *)toolTip inRect:(CGRect)sourceRect
{
  double height;
  double width;
  double y;
  double x;
  NSString *v8;
  void *v9;

  height = sourceRect.size.height;
  width = sourceRect.size.width;
  y = sourceRect.origin.y;
  x = sourceRect.origin.x;
  v8 = toolTip;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setToolTip:", v8);

  objc_msgSend(v9, "setSourceRect:", x, y, width, height);
  return (UIToolTipConfiguration *)v9;
}

- (NSString)toolTip
{
  return self->_toolTip;
}

- (void)setToolTip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolTip, 0);
}

@end
