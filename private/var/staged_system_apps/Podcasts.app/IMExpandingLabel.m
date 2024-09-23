@implementation IMExpandingLabel

- (void)setFont:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textAttributes](self, "textAttributes"));
  v5 = objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, NSFontAttributeName);
  -[IMExpandingLabel setTextAttributes:](self, "setTextAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel text](self, "text"));
  -[IMExpandingLabel setText:](self, "setText:", 0);
  -[IMExpandingLabel setText:](self, "setText:", v6);

}

- (void)setMoreButtonFont:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  CGRect v8;
  CGRect v9;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel moreButton](self, "moreButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleLabel"));
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v7, "sizeToFit");
  v6 = objc_opt_class(MTTouchInsetsButton);
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
  {
    objc_msgSend(v7, "setTouchInsets:", -8.0, -8.0, -8.0, -8.0);
    objc_msgSend(v7, "frame");
    v9 = CGRectInset(v8, 0.0, 6.0);
    objc_msgSend(v7, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width + 10.0, v9.size.height);
  }

}

- (unint64_t)maximumNumberOfLinesThatFitHeight:(double)a3
{
  void *v4;
  double v5;
  unint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel _font](self, "_font"));
  objc_msgSend(v4, "lineHeight");
  v6 = (unint64_t)(a3 / v5);

  return v6;
}

- (id)_font
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textAttributes](self, "textAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", NSFontAttributeName));

  return v3;
}

@end
