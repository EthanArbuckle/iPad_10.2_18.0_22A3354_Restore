@implementation PKDashboardFooterTextItem

+ (id)itemWithFooterText:(id)a3
{
  id v3;
  PKDashboardFooterTextItem *v4;

  v3 = a3;
  v4 = objc_alloc_init(PKDashboardFooterTextItem);
  -[PKDashboardFooterTextItem setFooterText:](v4, "setFooterText:", v3);

  -[PKDashboardFooterTextItem setBottomInsetType:](v4, "setBottomInsetType:", 1);
  -[PKDashboardFooterTextItem setUseHorizontalInsets:](v4, "setUseHorizontalInsets:", 1);
  -[PKDashboardFooterTextItem setUseContentInsets:](v4, "setUseContentInsets:", 1);
  return v4;
}

+ (id)identifier
{
  return CFSTR("footerTextItem");
}

- (unint64_t)bottomInsetType
{
  return self->_bottomInsetType;
}

- (void)setBottomInsetType:(unint64_t)a3
{
  self->_bottomInsetType = a3;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_NSRange)linkRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_linkRange.length;
  location = self->_linkRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLinkRange:(_NSRange)a3
{
  self->_linkRange = a3;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (void)setLinkTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkTextColor, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (int64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(int64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (BOOL)useHorizontalInsets
{
  return self->_useHorizontalInsets;
}

- (void)setUseHorizontalInsets:(BOOL)a3
{
  self->_useHorizontalInsets = a3;
}

- (BOOL)useContentInsets
{
  return self->_useContentInsets;
}

- (void)setUseContentInsets:(BOOL)a3
{
  self->_useContentInsets = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
}

@end
