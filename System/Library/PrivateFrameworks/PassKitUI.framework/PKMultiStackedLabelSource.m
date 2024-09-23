@implementation PKMultiStackedLabelSource

- (PKMultiStackedLabelSource)initWithText:(id)a3
{
  id v5;
  PKMultiStackedLabelSource *v6;
  PKMultiStackedLabelSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMultiStackedLabelSource;
  v6 = -[PKMultiStackedLabelSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_text, a3);

  return v7;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  if (self->_text)
    objc_msgSend(v3, "appendString:");
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSCopying *)v6;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_text);
  objc_msgSend(v3, "safelyAddObject:", self->_font);
  objc_msgSend(v3, "safelyAddObject:", self->_icon);
  objc_msgSend(v3, "safelyAddObject:", self->_textColor);
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKMultiStackedLabelSource *v4;
  PKMultiStackedLabelSource *v5;
  PKMultiStackedLabelSource *v6;
  NSString *text;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  char v12;

  v4 = (PKMultiStackedLabelSource *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        text = v6->_text;
        v8 = self->_text;
        v9 = text;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
          {

            goto LABEL_16;
          }
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_16;
        }
        if (PKEqualObjects() && PKEqualObjects())
        {
          v12 = PKEqualObjects();
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        v12 = 0;
        goto LABEL_17;
      }
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKMultiStackedLabelSource *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  UIFont *font;
  uint64_t v10;
  UIImage *icon;
  uint64_t v12;
  UIColor *textColor;

  v5 = +[PKMultiStackedLabelSource allocWithZone:](PKMultiStackedLabelSource, "allocWithZone:");
  v6 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  text = v5->_text;
  v5->_text = (NSString *)v6;

  v8 = -[UIFont copyWithZone:](self->_font, "copyWithZone:", a3);
  font = v5->_font;
  v5->_font = (UIFont *)v8;

  v10 = -[UIImage copy](self->_icon, "copy");
  icon = v5->_icon;
  v5->_icon = (UIImage *)v10;

  v12 = -[UIColor copyWithZone:](self->_textColor, "copyWithZone:", a3);
  textColor = v5->_textColor;
  v5->_textColor = (UIColor *)v12;

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
