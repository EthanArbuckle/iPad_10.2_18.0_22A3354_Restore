@implementation _UIBadgeView

- (_UIBadgeVisualStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  _UIBadgeVisualStyle *v5;
  NSMutableDictionary *mergedTextAttributes;
  _UIBadgeVisualStyle *v7;

  v5 = (_UIBadgeVisualStyle *)a3;
  if (self->_style != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_style, a3);
    mergedTextAttributes = self->_mergedTextAttributes;
    self->_mergedTextAttributes = 0;

    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setTextAttributes:(id)a3
{
  NSDictionary *v4;
  NSDictionary *textAttributes;
  char v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSMutableDictionary *mergedTextAttributes;
  NSDictionary *v10;

  v4 = (NSDictionary *)a3;
  textAttributes = self->_textAttributes;
  if (textAttributes != v4)
  {
    v10 = v4;
    v6 = -[NSDictionary isEqual:](textAttributes, "isEqual:", v4);
    v4 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (NSDictionary *)-[NSDictionary copy](v10, "copy");
      v8 = self->_textAttributes;
      self->_textAttributes = v7;

      mergedTextAttributes = self->_mergedTextAttributes;
      self->_mergedTextAttributes = 0;

      -[UIView setNeedsLayout](self, "setNeedsLayout");
      v4 = v10;
    }
  }

}

- (void)setBadgeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_badgeColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_badgeColor, a3);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (_UIBadgeView)initWithText:(id)a3
{
  id v4;
  _UIBadgeView *v5;
  uint64_t v6;
  NSString *text;

  v4 = a3;
  v5 = -[UIView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 24.0, 22.0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v6;

    -[_UIBadgeView _setUpLabelIfNecessary](v5, "_setUpLabelIfNecessary");
    -[_UIBadgeView _applyTextToLabel](v5, "_applyTextToLabel");
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  }

  return v5;
}

- (void)_setUpLabelIfNecessary
{
  NSUInteger v3;
  UILabel *label;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;

  v3 = -[NSString length](self->_text, "length");
  label = self->_label;
  if (v3)
  {
    if (!label)
    {
      v6 = objc_alloc_init(UILabel);
      v7 = self->_label;
      self->_label = v6;

      +[UIColor clearColor](UIColor, "clearColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_label, "setBackgroundColor:", v8);

      -[UIView setOpaque:](self->_label, "setOpaque:", 0);
      -[UIView addSubview:](self, "addSubview:", self->_label);
    }
  }
  else
  {
    -[UIView removeFromSuperview](label, "removeFromSuperview");
    v5 = self->_label;
    self->_label = 0;

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_UIBadgeVisualStyle cornerRadius](self->_style, "cornerRadius");
  -[UIView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  if (self->_badgeColor)
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:");
  }
  else
  {
    -[_UIBadgeVisualStyle defaultBadgeColor](self->_style, "defaultBadgeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v7);

  }
  -[_UIBadgeView _applyTextToLabel](self, "_applyTextToLabel");
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v4, v6);
  v9 = v8;
  v11 = v10;
  UIFloorToViewScale(self);
  v13 = v12 + self->_textOffset.horizontal;
  UIFloorToViewScale(self);
  -[UILabel setFrame:](self->_label, "setFrame:", v13, v14 + self->_textOffset.vertical, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  NSUInteger v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[_UIBadgeVisualStyle cornerRadius](self->_style, "cornerRadius", a3.width, a3.height);
  v5 = v4 + v4;
  v6 = -[NSString length](self->_text, "length");
  v7 = v5;
  if (v6 >= 2)
  {
    -[_UIBadgeView _setUpLabelIfNecessary](self, "_setUpLabelIfNecessary", v5);
    -[_UIBadgeView _applyTextToLabel](self, "_applyTextToLabel");
    -[_UIBadgeVisualStyle maxWidth](self->_style, "maxWidth");
    v9 = v8;
    -[_UIBadgeVisualStyle minWidth](self->_style, "minWidth");
    v11 = v10;
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v13 = v12;
    -[_UIBadgeVisualStyle edgePadding](self->_style, "edgePadding");
    v7 = v13 + v14 + v14;
    if (v11 >= v7)
      v7 = v11;
    if (v9 <= v7)
      v7 = v9;
  }
  v15 = v5;
  result.height = v15;
  result.width = v7;
  return result;
}

- (void)_applyTextToLabel
{
  NSMutableDictionary *v3;
  NSMutableDictionary *mergedTextAttributes;
  void *v5;
  id v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  id v9;

  if (-[NSString length](self->_text, "length"))
  {
    if (qword_1ECD79D20 != -1)
      dispatch_once(&qword_1ECD79D20, &__block_literal_global_77);
    if (!self->_mergedTextAttributes)
    {
      v3 = (NSMutableDictionary *)objc_msgSend((id)qword_1ECD79D18, "mutableCopy");
      mergedTextAttributes = self->_mergedTextAttributes;
      self->_mergedTextAttributes = v3;

      -[_UIBadgeVisualStyle font](self->_style, "font");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mergedTextAttributes, "setObject:forKeyedSubscript:", v5, *(_QWORD *)off_1E1678D90);

      if (-[NSDictionary count](self->_textAttributes, "count"))
        -[NSMutableDictionary addEntriesFromDictionary:](self->_mergedTextAttributes, "addEntriesFromDictionary:", self->_textAttributes);
      -[NSMutableDictionary removeObjectForKey:](self->_mergedTextAttributes, "removeObjectForKey:", *(_QWORD *)off_1E1678C50);
    }
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (self->_mergedTextAttributes)
      v7 = self->_mergedTextAttributes;
    else
      v7 = (NSMutableDictionary *)qword_1ECD79D18;
    v8 = objc_msgSend(v6, "initWithString:attributes:", self->_text, v7);
  }
  else
  {
    v8 = 0;
  }
  v9 = (id)v8;
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v8);

}

- (void)setTextOffset:(UIOffset)a3
{
  if (self->_textOffset.horizontal != a3.horizontal || self->_textOffset.vertical != a3.vertical)
  {
    self->_textOffset = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_mergedTextAttributes, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  char v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  text = self->_text;
  if (text != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqual:](text, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_text;
      self->_text = v7;

      -[_UIBadgeView _setUpLabelIfNecessary](self, "_setUpLabelIfNecessary");
      -[_UIBadgeView _applyTextToLabel](self, "_applyTextToLabel");
      -[UIView sizeToFit](self, "sizeToFit");
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      v4 = v9;
    }
  }

}

- (NSString)text
{
  return self->_text;
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (UIOffset)textOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_textOffset.horizontal;
  vertical = self->_textOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

@end
