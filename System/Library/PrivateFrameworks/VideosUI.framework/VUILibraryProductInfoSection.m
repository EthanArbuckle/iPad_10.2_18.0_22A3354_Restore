@implementation VUILibraryProductInfoSection

+ (id)headerViewWithString:(id)a3
{
  id v3;
  VUITextLayout *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v4, "setTextStyle:", 15);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v4, "setColor:", v5);

  -[VUITextLayout setFontWeight:](v4, "setFontWeight:", 10);
  -[VUITextLayout setTextTransform:](v4, "setTextTransform:", 2);
  -[VUITextLayout setNumberOfLinesAXSmall:](v4, "setNumberOfLinesAXSmall:", 1);
  -[VUITextLayout setNumberOfLinesAXLarge:](v4, "setNumberOfLinesAXLarge:", 1);
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dataViewWithString:(id)a3
{
  id v3;
  VUITextLayout *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v4, "setTextStyle:", 14);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v4, "setColor:", v5);

  -[VUITextLayout setNumberOfLinesAXSmall:](v4, "setNumberOfLinesAXSmall:", 1);
  -[VUITextLayout setNumberOfLinesAXLarge:](v4, "setNumberOfLinesAXLarge:", 1);
  -[VUITextLayout setMinimumScaleFactor:](v4, "setMinimumScaleFactor:", 0.7);
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIEdgeInsets)headerMargin
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 19.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIView)headerContentView
{
  return self->_headerContentView;
}

- (void)setHeaderContentView:(id)a3
{
  objc_storeStrong((id *)&self->_headerContentView, a3);
}

- (NSArray)dataViews
{
  return self->_dataViews;
}

- (void)setDataViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (UIEdgeInsets)headerPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_headerPadding.top;
  left = self->_headerPadding.left;
  bottom = self->_headerPadding.bottom;
  right = self->_headerPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHeaderPadding:(UIEdgeInsets)a3
{
  self->_headerPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataViews, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
