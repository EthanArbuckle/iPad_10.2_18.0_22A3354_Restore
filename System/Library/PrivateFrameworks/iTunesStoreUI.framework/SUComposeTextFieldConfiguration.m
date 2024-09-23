@implementation SUComposeTextFieldConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUComposeTextFieldConfiguration;
  -[SUComposeTextFieldConfiguration dealloc](&v3, sel_dealloc);
}

- (UIEdgeInsets)borderInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderInsets.top;
  left = self->_borderInsets.left;
  bottom = self->_borderInsets.bottom;
  right = self->_borderInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBorderInsets:(UIEdgeInsets)a3
{
  self->_borderInsets = a3;
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
