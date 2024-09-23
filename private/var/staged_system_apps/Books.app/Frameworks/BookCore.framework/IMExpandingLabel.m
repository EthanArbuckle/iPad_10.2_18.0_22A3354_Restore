@implementation IMExpandingLabel

- (void)_IMExpandingLabelComonInit
{
  UIFont *v3;
  UIFont *font;
  UIColor *v5;
  UIColor *textColor;
  UIColor *v7;
  UIColor *showMoreTextColor;
  NSTextStorage *v9;
  NSTextStorage *textStorage;
  NSLayoutManager *v11;
  NSLayoutManager *textLayoutManager;
  NSTextContainer *v13;
  NSTextContainer *textContainer;
  id v15;
  double y;
  double width;
  double height;
  UITextView *v19;
  UITextView *textView;
  void *v21;
  UILabel *v22;
  UILabel *showMoreLabel;
  void *v24;
  void *v25;
  UITapGestureRecognizer *v26;
  UITapGestureRecognizer *showMoreTapRecognizer;

  self->_numberOfLinesWhenCollapsed = 3;
  self->_textAlignment = 4;
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  font = self->_font;
  self->_font = v3;

  v5 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  textColor = self->_textColor;
  self->_textColor = v5;

  v7 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  showMoreTextColor = self->_showMoreTextColor;
  self->_showMoreTextColor = v7;

  v9 = (NSTextStorage *)objc_alloc_init((Class)NSTextStorage);
  textStorage = self->_textStorage;
  self->_textStorage = v9;

  v11 = (NSLayoutManager *)objc_alloc_init((Class)NSLayoutManager);
  textLayoutManager = self->_textLayoutManager;
  self->_textLayoutManager = v11;

  -[NSTextStorage addLayoutManager:](self->_textStorage, "addLayoutManager:", self->_textLayoutManager);
  v13 = (NSTextContainer *)objc_msgSend(objc_alloc((Class)NSTextContainer), "initWithSize:", CGSizeZero.width, CGSizeZero.height);
  textContainer = self->_textContainer;
  self->_textContainer = v13;

  -[NSTextContainer setLineBreakMode:](self->_textContainer, "setLineBreakMode:", 4);
  -[NSTextContainer setLineFragmentPadding:](self->_textContainer, "setLineFragmentPadding:", 0.0);
  -[NSTextContainer setMaximumNumberOfLines:](self->_textContainer, "setMaximumNumberOfLines:", self->_numberOfLinesWhenCollapsed);
  -[NSTextContainer setHeightTracksTextView:](self->_textContainer, "setHeightTracksTextView:", 1);
  -[NSTextContainer setWidthTracksTextView:](self->_textContainer, "setWidthTracksTextView:", 1);
  -[NSLayoutManager addTextContainer:](self->_textLayoutManager, "addTextContainer:", self->_textContainer);
  v15 = objc_alloc((Class)UITextView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v19 = (UITextView *)objc_msgSend(v15, "initWithFrame:textContainer:", self->_textContainer, CGRectZero.origin.x, y, width, height);
  textView = self->_textView;
  self->_textView = v19;

  -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v21);

  -[UITextView setShowsVerticalScrollIndicator:](self->_textView, "setShowsVerticalScrollIndicator:", 0);
  -[UITextView setShowsHorizontalScrollIndicator:](self->_textView, "setShowsHorizontalScrollIndicator:", 0);
  -[IMExpandingLabel addSubview:](self, "addSubview:", self->_textView);
  v22 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  showMoreLabel = self->_showMoreLabel;
  self->_showMoreLabel = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel showMoreTextColor](self, "showMoreTextColor"));
  -[UILabel setTextColor:](self->_showMoreLabel, "setTextColor:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_showMoreLabel, "setBackgroundColor:", v25);

  -[IMExpandingLabel setShowMoreAttributedText:](self, "setShowMoreAttributedText:", 0);
  -[IMExpandingLabel setShowMoreFont:](self, "setShowMoreFont:", 0);
  -[IMExpandingLabel addSubview:](self, "addSubview:", self->_showMoreLabel);
  -[UILabel setUserInteractionEnabled:](self->_showMoreLabel, "setUserInteractionEnabled:", 1);
  v26 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_expand");
  showMoreTapRecognizer = self->_showMoreTapRecognizer;
  self->_showMoreTapRecognizer = v26;

  -[UITapGestureRecognizer setDelegate:](self->_showMoreTapRecognizer, "setDelegate:", self);
  -[IMExpandingLabel addGestureRecognizer:](self, "addGestureRecognizer:", self->_showMoreTapRecognizer);
}

- (IMExpandingLabel)init
{
  IMExpandingLabel *v2;
  IMExpandingLabel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMExpandingLabel;
  v2 = -[IMExpandingLabel init](&v5, "init");
  v3 = v2;
  if (v2)
    -[IMExpandingLabel _IMExpandingLabelComonInit](v2, "_IMExpandingLabelComonInit");
  return v3;
}

- (IMExpandingLabel)initWithCoder:(id)a3
{
  IMExpandingLabel *v3;
  IMExpandingLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMExpandingLabel;
  v3 = -[IMExpandingLabel initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[IMExpandingLabel _IMExpandingLabelComonInit](v3, "_IMExpandingLabelComonInit");
  return v4;
}

- (IMExpandingLabel)initWithFrame:(CGRect)a3
{
  IMExpandingLabel *v3;
  IMExpandingLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMExpandingLabel;
  v3 = -[IMExpandingLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[IMExpandingLabel _IMExpandingLabelComonInit](v3, "_IMExpandingLabelComonInit");
  return v4;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGPoint v9;
  CGRect v10;
  CGRect v11;

  objc_msgSend(a3, "locationInView:", self->_showMoreLabel);
  v5 = v4;
  v7 = v6;
  -[UILabel bounds](self->_showMoreLabel, "bounds");
  v11 = CGRectInset(v10, -20.0, -20.0);
  v9.x = v5;
  v9.y = v7;
  return CGRectContainsPoint(v11, v9);
}

- (void)setText:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];
  _QWORD v13[3];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSTextStorage string](self->_textStorage, "string"));
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
    goto LABEL_4;
  v6 = objc_msgSend(v4, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    v5 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v5, "setAlignment:", self->_textAlignment);
    v12[0] = NSFontAttributeName;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel font](self, "font"));
    v13[0] = v8;
    v12[1] = NSForegroundColorAttributeName;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textColor](self, "textColor"));
    v12[2] = NSParagraphStyleAttributeName;
    v13[1] = v9;
    v13[2] = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));

    v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v4, v10);
    -[NSTextStorage setAttributedString:](self->_textStorage, "setAttributedString:", v11);
    -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");

LABEL_4:
  }

}

- (NSString)text
{
  return (NSString *)-[NSTextStorage string](self->_textStorage, "string");
}

- (void)setAttributedText:(id)a3
{
  id v4;

  v4 = a3;
  self->_useAttributedText = objc_msgSend(v4, "length") != 0;
  if (objc_msgSend(v4, "length"))
    -[NSTextStorage setAttributedString:](self->_textStorage, "setAttributedString:", v4);
  else
    -[NSTextStorage deleteCharactersInRange:](self->_textStorage, "deleteCharactersInRange:", 0, -[NSTextStorage length](self->_textStorage, "length"));
  -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");

}

- (NSAttributedString)attributedText
{
  void *v2;

  if (self->_useAttributedText)
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSTextStorage attributedSubstringFromRange:](self->_textStorage, "attributedSubstringFromRange:", 0, -[NSTextStorage length](self->_textStorage, "length")));
  else
    v2 = 0;
  return (NSAttributedString *)v2;
}

- (void)setFont:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel font](self, "font"));

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[IMExpandingLabel _updateTextAttributes](self, "_updateTextAttributes");
    -[UITextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
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
    -[IMExpandingLabel _updateTextAttributes](self, "_updateTextAttributes");
    -[UITextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[IMExpandingLabel _updateTextAttributes](self, "_updateTextAttributes");
    -[UITextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
  }
}

- (void)setLineBreakMode:(int64_t)a3
{
  if (-[NSTextContainer lineBreakMode](self->_textContainer, "lineBreakMode") != a3)
  {
    -[NSTextContainer setLineBreakMode:](self->_textContainer, "setLineBreakMode:", a3);
    -[UITextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
  }
}

- (int64_t)lineBreakMode
{
  return -[NSTextContainer lineBreakMode](self->_textContainer, "lineBreakMode");
}

- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3
{
  uint64_t v4;
  unint64_t numberOfLinesWhenCollapsed;

  if (self->_numberOfLinesWhenCollapsed != a3)
  {
    v4 = 3;
    if (a3)
      v4 = a3;
    self->_numberOfLinesWhenCollapsed = v4;
    if (-[IMExpandingLabel isExpanded](self, "isExpanded"))
      numberOfLinesWhenCollapsed = 0;
    else
      numberOfLinesWhenCollapsed = self->_numberOfLinesWhenCollapsed;
    -[NSTextContainer setMaximumNumberOfLines:](self->_textContainer, "setMaximumNumberOfLines:", numberOfLinesWhenCollapsed);
    -[UITextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
  }
}

- (void)_updateTextAttributes
{
  void *v3;
  id v4;
  NSTextStorage *textStorage;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[3];

  if (!self->_useAttributedText)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    v4 = objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "setAlignment:", self->_textAlignment);
    textStorage = self->_textStorage;
    v9[0] = NSFontAttributeName;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel font](self, "font"));
    v10[0] = v6;
    v9[1] = NSForegroundColorAttributeName;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textColor](self, "textColor"));
    v9[2] = NSParagraphStyleAttributeName;
    v10[1] = v7;
    v10[2] = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
    -[NSTextStorage setAttributes:range:](textStorage, "setAttributes:range:", v8, 0, -[NSTextStorage length](self->_textStorage, "length"));

  }
}

- (void)setShowMoreAttributedText:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_showMoreLabel, "attributedText"));
  if (v4 != v7)
  {

LABEL_4:
    -[UILabel setAttributedText:](self->_showMoreLabel, "setAttributedText:", v7);
    -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_showMoreLabel, "attributedText"));
  v6 = objc_msgSend(v7, "isEqualToAttributedString:", v5);

  if ((v6 & 1) == 0)
    goto LABEL_4;
LABEL_5:

}

- (NSAttributedString)showMoreAttributedText
{
  return -[UILabel attributedText](self->_showMoreLabel, "attributedText");
}

- (void)setShowMoreFont:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_showMoreLabel, "font"));

  v5 = v6;
  if (v4 != v6)
  {
    -[UILabel setFont:](self->_showMoreLabel, "setFont:", v6);
    -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (UIFont)showMoreFont
{
  return -[UILabel font](self->_showMoreLabel, "font");
}

- (void)setShowMoreTextColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_showMoreTextColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_showMoreTextColor, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel showMoreTextColor](self, "showMoreTextColor"));
    -[UILabel setTextColor:](self->_showMoreLabel, "setTextColor:", v6);

    v5 = v7;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  double v15;
  double v16;
  _BOOL4 v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)IMExpandingLabel;
  -[IMExpandingLabel layoutSubviews](&v24, "layoutSubviews");
  -[IMExpandingLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textView](self, "textView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = -[NSTextContainer maximumNumberOfLines](self->_textContainer, "maximumNumberOfLines");
  if (v12)
  {
    v13 = v12;
    -[NSTextContainer setMaximumNumberOfLines:](self->_textContainer, "setMaximumNumberOfLines:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textView](self, "textView"));
    objc_msgSend(v14, "sizeThatFits:", v8, 3.40282347e38);
    v16 = v15;

    v17 = v16 <= v10;
    -[NSTextContainer setMaximumNumberOfLines:](self->_textContainer, "setMaximumNumberOfLines:", v13);
  }
  else
  {
    v17 = 1;
  }
  v18 = self->_expanded || v17;
  -[UILabel setHidden:](self->_showMoreLabel, "setHidden:", v18);
  if ((-[UILabel isHidden](self->_showMoreLabel, "isHidden") & 1) == 0)
  {
    -[UILabel sizeThatFits:](self->_showMoreLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v20 = v19;
    v22 = v21;
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    v23 = CGRectGetMaxX(v25) - v20;
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    -[UILabel setFrame:](self->_showMoreLabel, "setFrame:", v23, CGRectGetMaxY(v26) - v22, v20, v22);
  }
  -[IMExpandingLabel _setTextExclusionPath](self, "_setTextExclusionPath");
  -[UITextView setNeedsDisplay](self->_textView, "setNeedsDisplay");
}

- (void)_setTextExclusionPath
{
  void *v3;
  void *v4;
  void *v5;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  if (-[IMExpandingLabel isExpanded](self, "isExpanded")
    || (-[UILabel isHidden](self->_showMoreLabel, "isHidden") & 1) != 0)
  {
    -[NSTextContainer setExclusionPaths:](self->_textContainer, "setExclusionPaths:", &__NSArray0__struct);
  }
  else
  {
    -[UILabel frame](self->_showMoreLabel, "frame");
    v7 = CGRectInset(v6, -5.0, 0.0);
    v8 = CGRectIntegral(v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height));
    v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
    -[NSTextContainer setExclusionPaths:](self->_textContainer, "setExclusionPaths:", v4);

  }
}

- (void)_expand
{
  void (**labelResizedBlock)(void);

  labelResizedBlock = (void (**)(void))self->_labelResizedBlock;
  if (labelResizedBlock)
    labelResizedBlock[2]();
}

- (void)setExpanded:(BOOL)a3
{
  unint64_t numberOfLinesWhenCollapsed;

  self->_expanded = a3;
  if (a3)
    numberOfLinesWhenCollapsed = 0;
  else
    numberOfLinesWhenCollapsed = self->_numberOfLinesWhenCollapsed;
  -[NSTextContainer setMaximumNumberOfLines:](self->_textContainer, "setMaximumNumberOfLines:", numberOfLinesWhenCollapsed);
  -[UILabel setHidden:](self->_showMoreLabel, "setHidden:", self->_expanded);
  -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textView](self, "textView"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)showMoreTextColor
{
  return self->_showMoreTextColor;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (unint64_t)numberOfLinesWhenCollapsed
{
  return self->_numberOfLinesWhenCollapsed;
}

- (id)labelResizedBlock
{
  return self->_labelResizedBlock;
}

- (void)setLabelResizedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong(&self->_labelResizedBlock, 0);
  objc_storeStrong((id *)&self->_showMoreTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_showMoreTapRecognizer, 0);
  objc_storeStrong((id *)&self->_showMoreLabel, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
}

@end
