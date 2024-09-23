@implementation _UIFontTextStyleCacheKey

- (BOOL)_isEqualToKey:(id)a3
{
  NSString *textStyle;
  _BOOL4 v6;
  NSString *contentSizeCategory;

  if (self->super._hash == *((_QWORD *)a3 + 1))
  {
    textStyle = self->_textStyle;
    if (textStyle == *((NSString **)a3 + 3) || (v6 = -[NSString isEqualToString:](textStyle, "isEqualToString:")))
    {
      contentSizeCategory = self->_contentSizeCategory;
      if (contentSizeCategory == *((NSString **)a3 + 4)
        || (v6 = -[NSString isEqualToString:](contentSizeCategory, "isEqualToString:")))
      {
        LOBYTE(v6) = self->_textLegibility == *((unsigned __int8 *)a3 + 16);
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFontTextStyleCacheKey;
  -[_UIFontTextStyleCacheKey dealloc](&v3, sel_dealloc);
}

- (void)setTextLegibility:(BOOL)a3
{
  self->_textLegibility = a3;
}

- (void)setTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)_hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_textStyle, "hash");
  return -[NSString hash](self->_contentSizeCategory, "hash") ^ v3 ^ self->_textLegibility;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textStyle: %@, contentSizeCategory: %@, legibilityWeight: %ld"), self->_textStyle, self->_contentSizeCategory, self->_textLegibility);
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (BOOL)textLegibility
{
  return self->_textLegibility;
}

@end
