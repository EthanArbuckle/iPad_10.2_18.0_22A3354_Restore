@implementation VUIResourceImageDescriptor

- (unint64_t)type
{
  return self->_type;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
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

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setRenderAsTemplate:(BOOL)a3
{
  self->_renderAsTemplate = a3;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (NSString)name
{
  return self->_name;
}

- (VUIResourceImageDescriptor)initWithSymbol:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  VUIResourceImageDescriptor *v12;
  UIImageSymbolConfiguration *v13;
  void *symbolConfiguration;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VUIResourceImageDescriptor;
  v12 = -[VUIResourceImageDescriptor init](&v16, sel_init);
  if (v12)
  {
    if (objc_msgSend(v10, "length"))
    {
      objc_storeStrong((id *)&v12->_name, a3);
      v12->_size.width = width;
      v12->_size.height = height;
      v12->_containerSize.width = width;
      v12->_containerSize.height = height;
      v12->_type = 0;
      v12->_scaleMode = 1;
      v13 = (UIImageSymbolConfiguration *)v11;
      symbolConfiguration = v12->_symbolConfiguration;
      v12->_symbolConfiguration = v13;
    }
    else
    {
      symbolConfiguration = v12;
      v12 = 0;
    }
  }
  else
  {
    symbolConfiguration = 0;
  }

  return v12;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (_VUICornerRadii)borderRadii
{
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  _VUICornerRadii result;

  topLeft = self->_borderRadii.topLeft;
  topRight = self->_borderRadii.topRight;
  bottomLeft = self->_borderRadii.bottomLeft;
  bottomRight = self->_borderRadii.bottomRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topRight = topRight;
  result.topLeft = topLeft;
  return result;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (VUIResourceImageDescriptor)initWithResource:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  VUIResourceImageDescriptor *v9;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIResourceImageDescriptor;
  v9 = -[VUIResourceImageDescriptor init](&v11, sel_init);
  if (v9 && objc_msgSend(v8, "length"))
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v9->_size.width = width;
    v9->_size.height = height;
    v9->_containerSize.width = width;
    v9->_containerSize.height = height;
    v9->_scaleMode = 1;
    v9->_type = 1;
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (VUIResourceImageDescriptor)initWithResource:(id)a3 size:(CGSize)a4 containerSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  VUIResourceImageDescriptor *result;

  height = a5.height;
  width = a5.width;
  result = -[VUIResourceImageDescriptor initWithResource:size:](self, "initWithResource:size:", a3, a4.width, a4.height);
  if (result)
  {
    result->_containerSize.width = width;
    result->_containerSize.height = height;
  }
  return result;
}

- (VUIResourceImageDescriptor)initWithResourceSymbol:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  VUIResourceImageDescriptor *v12;
  UIImageSymbolConfiguration *v13;
  void *symbolConfiguration;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VUIResourceImageDescriptor;
  v12 = -[VUIResourceImageDescriptor init](&v16, sel_init);
  if (v12)
  {
    if (objc_msgSend(v10, "length"))
    {
      objc_storeStrong((id *)&v12->_name, a3);
      v12->_size.width = width;
      v12->_size.height = height;
      v12->_containerSize.width = width;
      v12->_containerSize.height = height;
      v12->_type = 2;
      v12->_scaleMode = 1;
      v13 = (UIImageSymbolConfiguration *)v11;
      symbolConfiguration = v12->_symbolConfiguration;
      v12->_symbolConfiguration = v13;
    }
    else
    {
      symbolConfiguration = v12;
      v12 = 0;
    }
  }
  else
  {
    symbolConfiguration = 0;
  }

  return v12;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (BOOL)shouldRenderAsTemplate
{
  return self->_renderAsTemplate;
}

- (void)setBorderRadii:(_VUICornerRadii)a3
{
  self->_borderRadii = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (int64_t)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (void)setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (BOOL)scaleToSize
{
  return self->_scaleToSize;
}

- (void)setScaleToSize:(BOOL)a3
{
  self->_scaleToSize = a3;
}

@end
