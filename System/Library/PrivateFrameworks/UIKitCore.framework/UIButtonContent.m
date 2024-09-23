@implementation UIButtonContent

- (NSAttributedString)attributedTitle
{
  return self->attributedTitle;
}

- (NSString)title
{
  return self->title;
}

- (UIImage)background
{
  return self->background;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->preferredSymbolConfiguration;
}

- (UIImage)image
{
  return self->image;
}

- (NSNumber)drawingStroke
{
  return self->drawingStroke;
}

- (BOOL)isEmpty
{
  return !self->title
      && !self->attributedTitle
      && !self->image
      && !self->background
      && !self->titleColor
      && !self->imageColor
      && !self->shadowColor
      && self->drawingStroke == 0;
}

- (void)setBackground:(id)a3
{
  objc_storeStrong((id *)&self->background, a3);
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->image, a3);
}

- (void)setAttributedTitle:(id)a3
{
  objc_storeStrong((id *)&self->attributedTitle, a3);
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->preferredSymbolConfiguration, a3);
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->titleColor, a3);
}

- (UIColor)shadowColor
{
  return self->shadowColor;
}

- (UIColor)imageColor
{
  return self->imageColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->drawingStroke, 0);
  objc_storeStrong((id *)&self->shadowColor, 0);
  objc_storeStrong((id *)&self->imageColor, 0);
  objc_storeStrong((id *)&self->titleColor, 0);
  objc_storeStrong((id *)&self->background, 0);
  objc_storeStrong((id *)&self->image, 0);
  objc_storeStrong((id *)&self->attributedTitle, 0);
  objc_storeStrong((id *)&self->title, 0);
}

- (BOOL)updateVariableLengthStringForView:(id)a3
{
  id v4;
  NSString *v5;
  BOOL v6;
  NSString *title;
  BOOL v8;

  v4 = a3;
  if (self->isWidthVariant)
  {
    _UIAdaptLocalizedStringForView(self->title, v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSString isEqualToString:](self->title, "isEqualToString:", v5);
    if (!v6)
    {
      title = self->title;
      self->title = v5;
      v5 = title;
    }
    v8 = !v6;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  char IsWidthVariant;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->title != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->title, a3);
    IsWidthVariant = _NSStringIsWidthVariant(self->title);
    v5 = v7;
    self->isWidthVariant = IsWidthVariant;
  }

}

- (UIColor)titleColor
{
  return self->titleColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[UIButtonContent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[UIButtonContent attributedTitle](self, "attributedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedTitle:", v6);

  -[UIButtonContent image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v7);

  -[UIButtonContent background](self, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackground:", v8);

  -[UIButtonContent titleColor](self, "titleColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:", v9);

  -[UIButtonContent imageColor](self, "imageColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageColor:", v10);

  -[UIButtonContent shadowColor](self, "shadowColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowColor:", v11);

  -[UIButtonContent drawingStroke](self, "drawingStroke");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDrawingStroke:", v12);

  -[UIButtonContent preferredSymbolConfiguration](self, "preferredSymbolConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredSymbolConfiguration:", v13);

  return v4;
}

- (UIButtonContent)initWithCoder:(id)a3
{
  id v4;
  UIButtonContent *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  void *v10;
  uint64_t v11;
  NSAttributedString *attributedTitle;
  uint64_t v13;
  UIImage *image;
  uint64_t v15;
  UIImageSymbolConfiguration *preferredSymbolConfiguration;
  uint64_t v17;
  UIImage *background;
  uint64_t v19;
  UIColor *titleColor;
  uint64_t v21;
  UIColor *imageColor;
  uint64_t v23;
  UIColor *shadowColor;
  uint64_t v25;
  NSNumber *drawingStroke;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)UIButtonContent;
  v5 = -[UIButtonContent init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = objc_msgSend(v6, "copy");
      title = v5->title;
      v5->title = (NSString *)v7;
    }
    else
    {
      title = v5->title;
      v5->title = 0;
    }

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAttributedTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_msgSend(v9, "copy");
      attributedTitle = v5->attributedTitle;
      v5->attributedTitle = (NSAttributedString *)v11;
    }
    else
    {
      attributedTitle = v5->attributedTitle;
      v5->attributedTitle = 0;
    }

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIImage"));
    v13 = objc_claimAutoreleasedReturnValue();
    image = v5->image;
    v5->image = (UIImage *)v13;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIImageSymbolConfiguration"));
    v15 = objc_claimAutoreleasedReturnValue();
    preferredSymbolConfiguration = v5->preferredSymbolConfiguration;
    v5->preferredSymbolConfiguration = (UIImageSymbolConfiguration *)v15;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBackgroundImage"));
    v17 = objc_claimAutoreleasedReturnValue();
    background = v5->background;
    v5->background = (UIImage *)v17;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITitleColor"));
    v19 = objc_claimAutoreleasedReturnValue();
    titleColor = v5->titleColor;
    v5->titleColor = (UIColor *)v19;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIImageColor"));
    v21 = objc_claimAutoreleasedReturnValue();
    imageColor = v5->imageColor;
    v5->imageColor = (UIColor *)v21;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIShadowColor"));
    v23 = objc_claimAutoreleasedReturnValue();
    shadowColor = v5->shadowColor;
    v5->shadowColor = (UIColor *)v23;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDrawingStroke"));
    v25 = objc_claimAutoreleasedReturnValue();
    drawingStroke = v5->drawingStroke;
    v5->drawingStroke = (NSNumber *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *title;
  NSAttributedString *attributedTitle;
  UIImage *image;
  UIImageSymbolConfiguration *preferredSymbolConfiguration;
  UIImage *background;
  UIColor *titleColor;
  UIColor *imageColor;
  UIColor *shadowColor;
  NSNumber *drawingStroke;
  id v14;

  v4 = a3;
  title = self->title;
  v14 = v4;
  if (title)
  {
    objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("UITitle"));
    v4 = v14;
  }
  attributedTitle = self->attributedTitle;
  if (attributedTitle)
  {
    objc_msgSend(v14, "encodeObject:forKey:", attributedTitle, CFSTR("UIAttributedTitle"));
    v4 = v14;
  }
  image = self->image;
  if (image)
  {
    objc_msgSend(v14, "encodeObject:forKey:", image, CFSTR("UIImage"));
    v4 = v14;
  }
  preferredSymbolConfiguration = self->preferredSymbolConfiguration;
  if (preferredSymbolConfiguration)
  {
    objc_msgSend(v14, "encodeObject:forKey:", preferredSymbolConfiguration, CFSTR("UIImageSymbolConfiguration"));
    v4 = v14;
  }
  background = self->background;
  if (background)
  {
    objc_msgSend(v14, "encodeObject:forKey:", background, CFSTR("UIBackgroundImage"));
    v4 = v14;
  }
  titleColor = self->titleColor;
  if (titleColor)
  {
    objc_msgSend(v14, "encodeObject:forKey:", titleColor, CFSTR("UITitleColor"));
    v4 = v14;
  }
  imageColor = self->imageColor;
  if (imageColor)
  {
    objc_msgSend(v14, "encodeObject:forKey:", imageColor, CFSTR("UIImageColor"));
    v4 = v14;
  }
  shadowColor = self->shadowColor;
  if (shadowColor)
  {
    objc_msgSend(v14, "encodeObject:forKey:", shadowColor, CFSTR("UIShadowColor"));
    v4 = v14;
  }
  drawingStroke = self->drawingStroke;
  if (drawingStroke)
  {
    objc_msgSend(v14, "encodeObject:forKey:", drawingStroke, CFSTR("UIDrawingStroke"));
    v4 = v14;
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p Title = %@, AttributedTitle = %@, Image = %@, Background = %@, TitleColor = %@, ImageColor = %@, ShadowColor = %@, DrawingStroke = %@>"), v5, self, self->title, self->attributedTitle, self->image, self->background, self->titleColor, self->imageColor, self->shadowColor, self->drawingStroke);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setImageColor:(id)a3
{
  objc_storeStrong((id *)&self->imageColor, a3);
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->shadowColor, a3);
}

- (void)setDrawingStroke:(id)a3
{
  objc_storeStrong((id *)&self->drawingStroke, a3);
}

@end
