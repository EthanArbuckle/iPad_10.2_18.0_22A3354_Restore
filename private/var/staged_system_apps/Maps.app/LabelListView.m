@implementation LabelListView

+ (double)heightForWidth:(double)a3 strings:(id)a4 fonts:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "spacingForNumberOfStrings:", objc_msgSend(v9, "count")));
  objc_msgSend(a1, "heightForWidth:strings:fonts:spacings:", v9, v8, v10, a3);
  v12 = v11;

  return v12;
}

+ (double)heightForWidth:(double)a3 strings:(id)a4 fonts:(id)a5 spacings:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  float v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v9, "count");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0.0;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v14));
      v17 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v14));
        objc_msgSend(v16, "_maps_sizeWithFont:constrainedToSize:options:", v18, 1, a3, 3.40282347e38);
        v15 = v15 + v19;

        if (v14 < (unint64_t)objc_msgSend(v11, "count"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v14));
          objc_msgSend(v20, "floatValue");
          v15 = v15 + v21;

        }
      }

      ++v14;
    }
    while (v13 != (id)v14);
  }
  else
  {
    v15 = 0.0;
  }

  return v15;
}

+ (id)spacingForNumberOfStrings:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  _UNKNOWN **v7;

  if (a3)
    v4 = a3 - 1;
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v4));
  if (a3 >= 2)
  {
    v6 = 0;
    do
    {
      if (v6)
        v7 = &off_10126CB20;
      else
        v7 = &off_10126CB08;
      objc_msgSend(v5, "addObject:", v7);
      ++v6;
    }
    while (v6 < v4);
  }
  return v5;
}

- (LabelListView)initWithFrame:(CGRect)a3
{
  LabelListView *v3;
  NSMutableArray *v4;
  NSMutableArray *labels;
  uint64_t v6;
  UIColor *textColor;
  LabelListView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LabelListView;
  v3 = -[LabelListView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    labels = v3->_labels;
    v3->_labels = v4;

    v6 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v6;

    v3->_textAlignment = 0;
    v8 = v3;
  }

  return v3;
}

- (void)addLabelWithText:(id)a3 accessibilityText:(id)a4 font:(id)a5
{
  -[LabelListView addLabelWithText:attributedText:accessibilityText:font:color:](self, "addLabelWithText:attributedText:accessibilityText:font:color:", a3, 0, a4, a5, 0);
}

- (void)addLabelWithText:(id)a3 attributedText:(id)a4 accessibilityText:(id)a5 font:(id)a6 color:(id)a7
{
  id v12;
  id v13;
  UIColor *v14;
  id v15;
  UIColor *textColor;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (UIColor *)a7;
  if (!v18)
    goto LABEL_10;
  v15 = +[UILabel newStandardTextLabelWithFont:](UILabel, "newStandardTextLabelWithFont:", a6);
  objc_msgSend(v15, "setLineBreakMode:", 0);
  objc_msgSend(v15, "setTextAlignment:", self->_textAlignment);
  objc_msgSend(v15, "setNumberOfLines:", 0);
  if (!v12)
  {
    objc_msgSend(v15, "setText:", v18);
    if (!v13)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v15, "setAttributedText:", v12);
  if (v13)
LABEL_4:
    objc_msgSend(v15, "setAccessibilityLabel:", v13);
LABEL_5:
  textColor = v14;
  if (!v14)
    textColor = self->_textColor;
  objc_msgSend(v15, "setTextColor:", textColor);
  if (sub_1002A8AA0(self) == 5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    objc_msgSend(v15, "setHighlightedTextColor:", v17);

  }
  objc_msgSend(v15, "setShadowColor:", self->_shadowColor);
  -[LabelListView addSubview:](self, "addSubview:", v15);
  -[NSMutableArray addObject:](self->_labels, "addObject:", v15);

LABEL_10:
}

- (void)layoutToFitSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  id v7;

  height = a3.height;
  width = a3.width;
  v6 = objc_msgSend((id)objc_opt_class(self), "spacingForNumberOfStrings:", -[NSMutableArray count](self->_labels, "count"));
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[LabelListView layoutToFitSize:spacings:](self, "layoutToFitSize:spacings:", v7, width, height);

}

- (void)layoutToFitSize:(CGSize)a3 spacings:(id)a4
{
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  char *v10;
  char *v11;
  char *v12;
  double MaxY;
  void *v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  id v19;
  CGRect v20;

  width = a3.width;
  v19 = a4;
  -[LabelListView frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v10 = (char *)-[NSMutableArray count](self->_labels, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    MaxY = 0.0;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:", v12));
      objc_msgSend(v14, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, width, 1.79769313e308);
      v16 = v15;
      if (v12 && v12 - 1 < objc_msgSend(v19, "count"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v12 - 1));
        objc_msgSend(v17, "floatValue");
        MaxY = MaxY + v18;

      }
      objc_msgSend(v14, "setFrame:", 0.0, MaxY, width, v16);
      v20.origin.x = 0.0;
      v20.origin.y = MaxY;
      v20.size.width = width;
      v20.size.height = v16;
      MaxY = CGRectGetMaxY(v20);

      ++v12;
    }
    while (v11 != v12);
  }
  else
  {
    MaxY = 0.0;
  }
  -[LabelListView setFrame:](self, "setFrame:", v7, v9, width, MaxY);

}

- (void)removeAllLabels
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_labels;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "removeFromSuperview", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_labels, "removeAllObjects");
}

- (void)setTextColor:(id)a3
{
  UIColor **p_textColor;
  UIColor *v6;
  UIColor *v7;

  p_textColor = &self->_textColor;
  v6 = (UIColor *)a3;
  v7 = v6;
  if (*p_textColor != v6)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    v6 = *p_textColor;
  }
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_labels, "makeObjectsPerformSelector:withObject:", "setTextColor:", v6);

}

- (void)setShadowColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_shadowColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_shadowColor, a3);
    -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_labels, "makeObjectsPerformSelector:withObject:", "setShadowColor:", self->_shadowColor);
    v5 = v6;
  }

}

- (void)setTextAlignment:(int64_t)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_labels;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setTextAlignment:", self->_textAlignment, (_QWORD)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (NSArray)labels
{
  return &self->_labels->super;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
