@implementation BackgroundColorButton

- (id)backgroundColorForState:(unint64_t)a3
{
  NSMutableDictionary *colorLookup;
  void *v4;
  void *v5;

  colorLookup = self->_colorLookup;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](colorLookup, "objectForKeyedSubscript:", v4));

  return v5;
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableDictionary *colorLookup;
  unint64_t v10;

  v10 = (unint64_t)a3;
  v6 = objc_claimAutoreleasedReturnValue(-[BackgroundColorButton backgroundColorForState:](self, "backgroundColorForState:", a4));
  if ((objc_msgSend((id)v10, "isEqual:", v6) & 1) == 0 && v10 | v6)
  {
    if (v10)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton colorLookup](self, "colorLookup"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v8);

    }
    else
    {
      colorLookup = self->_colorLookup;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      -[NSMutableDictionary removeObjectForKey:](colorLookup, "removeObjectForKey:", v7);
    }

    -[BackgroundColorButton _updateBackgroundColor](self, "_updateBackgroundColor");
  }

}

- (NSMutableDictionary)colorLookup
{
  NSMutableDictionary *colorLookup;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  colorLookup = self->_colorLookup;
  if (!colorLookup)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5 = self->_colorLookup;
    self->_colorLookup = v4;

    colorLookup = self->_colorLookup;
  }
  return colorLookup;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BackgroundColorButton;
  -[BackgroundColorButton setHighlighted:](&v4, "setHighlighted:", a3);
  -[BackgroundColorButton _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BackgroundColorButton;
  -[BackgroundColorButton setEnabled:](&v4, "setEnabled:", a3);
  -[BackgroundColorButton _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BackgroundColorButton;
  -[BackgroundColorButton setSelected:](&v4, "setSelected:", a3);
  -[BackgroundColorButton _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton backgroundColorForState:](self, "backgroundColorForState:", -[BackgroundColorButton state](self, "state")));
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "isEqual:", v4))
  {
    v7.receiver = self;
    v7.super_class = (Class)BackgroundColorButton;
    -[BackgroundColorButton setBackgroundColor:](&v7, "setBackgroundColor:", v4);
  }

}

- (void)_updateBackgroundColor
{
  void *v3;
  unsigned __int8 v4;
  UIImage *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton backgroundColorForState:](self, "backgroundColorForState:", -[BackgroundColorButton state](self, "state")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton backgroundColor](self, "backgroundColor"));
  v4 = objc_msgSend(v6, "isEqual:", v3);

  if ((v4 & 1) == 0 && v6)
  {
    v5 = objc_opt_new(UIImage);
    -[BackgroundColorButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v5, 0);

    -[BackgroundColorButton setBackgroundColor:](self, "setBackgroundColor:", v6);
    -[BackgroundColorButton setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setTitleColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)NSMutableAttributedString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton attributedTitleForState:](self, "attributedTitleForState:", 0));
  v7 = objc_msgSend(v5, "initWithAttributedString:", v6);

  objc_msgSend(v7, "addAttribute:value:range:", NSForegroundColorAttributeName, v4, 0, objc_msgSend(v7, "length"));
  -[MapsThemeButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v7, 0);

}

- (void)setTitle:(id)a3 subTitle:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSString *v13;
  UIFontTextStyle v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  UIFontTextStyle v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const UIFontTextStyle *v27;
  void *v28;
  id v29;
  void *v30;
  NSAttributedStringKey v31;
  void *v32;
  NSAttributedStringKey v33;
  void *v34;
  NSAttributedStringKey v35;
  void *v36;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "length");
  v9 = objc_alloc((Class)NSMutableAttributedString);
  v11 = v9;
  if (v8)
  {
    v33 = NSFontAttributeName;
    v12 = _MKPlaceCardUseSmallerFont(v9, v10);
    v13 = (NSString *)UIFontTextStyleSubhead;
    if (v12)
      v14 = UIFontTextStyleFootnote;
    else
      v14 = (UIFontTextStyle)UIFontTextStyleSubhead;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v14, 2, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v15, 0.0));
    v34 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v18 = objc_msgSend(v11, "initWithString:attributes:", v7, v17);

    v19 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
    objc_msgSend(v18, "appendAttributedString:", v19);

    v20 = objc_alloc((Class)NSAttributedString);
    v31 = NSFontAttributeName;
    if (_MKPlaceCardUseSmallerFont(v20, v21))
      v22 = UIFontTextStyleFootnote;
    else
      v22 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v22));
    objc_msgSend(v23, "pointSize");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v32 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v7 = objc_msgSend(v20, "initWithString:attributes:", v6, v25);
    objc_msgSend(v18, "appendAttributedString:", v7);
  }
  else
  {
    v35 = NSFontAttributeName;
    v26 = _MKPlaceCardUseSmallerFont(v9, v10);
    v27 = &UIFontTextStyleFootnote;
    if (!v26)
      v27 = (const UIFontTextStyle *)&UIFontTextStyleSubhead;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v27, 2, 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v23, 0.0));
    v36 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    v18 = objc_msgSend(v11, "initWithString:attributes:", v7, v25);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v29 = objc_msgSend(v28, "mutableCopy");

  objc_msgSend(v29, "setAlignment:", 1);
  objc_msgSend(v29, "setParagraphSpacing:", -3.0);
  objc_msgSend(v29, "setLineBreakMode:", 4);
  objc_msgSend(v18, "addAttribute:value:range:", NSParagraphStyleAttributeName, v29, 0, objc_msgSend(v18, "length"));
  -[MapsThemeButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v18, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton titleLabel](self, "titleLabel"));
  objc_msgSend(v30, "setNumberOfLines:", 2);

}

- (void)setColorLookup:(id)a3
{
  objc_storeStrong((id *)&self->_colorLookup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorLookup, 0);
}

@end
