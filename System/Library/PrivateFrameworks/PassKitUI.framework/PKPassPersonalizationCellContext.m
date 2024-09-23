@implementation PKPassPersonalizationCellContext

- (double)minimumTextLabelWidth
{
  return self->_minimumTextLabelWidth;
}

- (void)setMinimumTextLabelWidth:(double)a3
{
  self->_minimumTextLabelWidth = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (BOOL)bindTextToStringRepresentation
{
  return self->_bindTextToStringRepresentation;
}

- (void)setBindTextToStringRepresentation:(BOOL)a3
{
  self->_bindTextToStringRepresentation = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)stringRepresentationBlock
{
  return self->_stringRepresentationBlock;
}

- (void)setStringRepresentationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)contactUpdateBlock
{
  return self->_contactUpdateBlock;
}

- (void)setContactUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contactUpdateBlock, 0);
  objc_storeStrong(&self->_stringRepresentationBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
}

@end
