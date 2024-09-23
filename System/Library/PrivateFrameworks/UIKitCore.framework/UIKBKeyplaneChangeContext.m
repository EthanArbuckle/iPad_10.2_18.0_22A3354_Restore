@implementation UIKBKeyplaneChangeContext

- (void)setUpdateAssistantView:(BOOL)a3
{
  self->_updateAssistantView = a3;
}

+ (id)keyplaneChangeContext
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)sizeDidChange
{
  return self->_sizeDidChange;
}

- (void)setIsSecureTextEntry:(BOOL)a3
{
  self->_isSecureTextEntry = a3;
}

- (void)setSplitWidthsChanged:(BOOL)a3
{
  self->_splitWidthsChanged = a3;
}

+ (id)keyplaneChangeContextWithSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v5, "setSize:", width, height);
  return v5;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
  self->_sizeDidChange = 1;
}

- (BOOL)splitWidthsChanged
{
  return self->_splitWidthsChanged;
}

- (BOOL)selfSizingChanged
{
  return self->_selfSizingChanged;
}

- (void)setSelfSizingChanged:(BOOL)a3
{
  self->_selfSizingChanged = a3;
}

- (BOOL)updateAssistantView
{
  return self->_updateAssistantView;
}

- (BOOL)isSecureTextEntry
{
  return self->_isSecureTextEntry;
}

- (BOOL)isDynamicLayout
{
  return self->_isDynamicLayout;
}

- (void)setIsDynamicLayout:(BOOL)a3
{
  self->_isDynamicLayout = a3;
}

@end
