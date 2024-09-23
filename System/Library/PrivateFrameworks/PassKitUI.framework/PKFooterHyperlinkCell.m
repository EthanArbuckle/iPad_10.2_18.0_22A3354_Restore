@implementation PKFooterHyperlinkCell

- (PKFooterHyperlinkCell)initWithCoder:(id)a3
{
  PKFooterHyperlinkCell *v3;
  PKFooterHyperlinkCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKFooterHyperlinkCell;
  v3 = -[PKFooterHyperlinkCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PKFooterHyperlinkCell _commonInit](v3, "_commonInit");
  return v4;
}

- (PKFooterHyperlinkCell)initWithSize:(CGSize)a3
{
  return -[PKFooterHyperlinkCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
}

- (PKFooterHyperlinkCell)initWithFrame:(CGRect)a3
{
  PKFooterHyperlinkCell *v3;
  PKFooterHyperlinkCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKFooterHyperlinkCell;
  v3 = -[PKFooterHyperlinkCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKFooterHyperlinkCell _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIColor *v3;
  UIColor *linkTextColor;
  double v5;
  double v6;

  self->_textAlignment = 1;
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  linkTextColor = self->_linkTextColor;
  self->_linkTextColor = v3;

  v5 = PKTableViewCellTextInset();
  v6 = PKTableViewCellTextInset();
  self->_edgeInsets.top = 15.0;
  self->_edgeInsets.leading = v5;
  self->_edgeInsets.bottom = 15.0;
  self->_edgeInsets.trailing = v6;
  -[PKFooterHyperlinkCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C20]);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKFooterHyperlinkCell;
  -[PKFooterHyperlinkCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKFooterHyperlinkCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKFooterHyperlinkCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKFooterHyperlinkCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  int v8;
  NSDirectionalEdgeInsets *p_edgeInsets;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  v8 = -[PKFooterHyperlinkCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  p_edgeInsets = &self->_edgeInsets;
  v10 = 8;
  if (v8)
    v11 = 24;
  else
    v11 = 8;
  if (!v8)
    v10 = 24;
  v12 = width - (*(double *)((char *)&p_edgeInsets->top + v11) + *(double *)((char *)&p_edgeInsets->top + v10));
  v13 = p_edgeInsets->top + self->_edgeInsets.bottom;
  -[PKMultiHyperlinkView frame](self->_hyperLinkView, "frame");
  -[PKMultiHyperlinkView sizeThatFits:](self->_hyperLinkView, "sizeThatFits:", v12, height - v13);
  PKRectCenteredIntegralRect();
  v15 = v14;
  if (!a4)
    -[PKMultiHyperlinkView setFrame:](self->_hyperLinkView, "setFrame:");
  v16 = v13 + v15 + 0.0;
  v17 = width;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)setText:(id)a3
{
  id v5;
  NSString *text;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  text = self->_text;
  v9 = (NSString *)v5;
  v7 = text;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_text, a3);
    -[PKFooterHyperlinkCell _configureHyperlinkViewIfNecessary](self, "_configureHyperlinkViewIfNecessary");
  }
LABEL_9:

}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[PKFooterHyperlinkCell _configureHyperlinkViewIfNecessary](self, "_configureHyperlinkViewIfNecessary");
  }
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    -[PKFooterHyperlinkCell _configureHyperlinkViewIfNecessary](self, "_configureHyperlinkViewIfNecessary");
    v5 = v6;
  }

}

- (void)setLinkTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_linkTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_linkTextColor, a3);
    -[PKFooterHyperlinkCell _configureHyperlinkViewIfNecessary](self, "_configureHyperlinkViewIfNecessary");
    v5 = v6;
  }

}

- (void)setSources:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    -[PKFooterHyperlinkCell _configureHyperlinkViewIfNecessary](self, "_configureHyperlinkViewIfNecessary");
  }

}

- (void)_configureHyperlinkViewIfNecessary
{
  PKMultiHyperlinkView *hyperLinkView;
  PKMultiHyperlinkView *v4;
  PKMultiHyperlinkView *v5;
  void *v6;

  hyperLinkView = self->_hyperLinkView;
  if (!hyperLinkView)
  {
    v4 = objc_alloc_init(PKMultiHyperlinkView);
    v5 = self->_hyperLinkView;
    self->_hyperLinkView = v4;

    -[PKFooterHyperlinkCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_hyperLinkView);

    hyperLinkView = self->_hyperLinkView;
  }
  -[PKMultiHyperlinkView setText:](hyperLinkView, "setText:", self->_text);
  -[PKMultiHyperlinkView setSources:](self->_hyperLinkView, "setSources:", self->_sources);
  -[PKMultiHyperlinkView setTextAlignment:](self->_hyperLinkView, "setTextAlignment:", self->_textAlignment);
  -[PKMultiHyperlinkView setLinkTextColor:](self->_hyperLinkView, "setLinkTextColor:", self->_linkTextColor);
  -[PKMultiHyperlinkView setTextColor:](self->_hyperLinkView, "setTextColor:", self->_textColor);
  -[PKFooterHyperlinkCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSArray)sources
{
  return self->_sources;
}

- (NSDirectionalEdgeInsets)edgeInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_edgeInsets.top;
  leading = self->_edgeInsets.leading;
  bottom = self->_edgeInsets.bottom;
  trailing = self->_edgeInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_hyperLinkView, 0);
}

@end
