@implementation PKMultiKeyValueCellKeyValueSource

- (PKMultiKeyValueCellKeyValueSource)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v7;
  id v8;
  PKMultiKeyValueCellKeyValueSource *v9;
  PKMultiKeyValueCellKeyValueSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKMultiKeyValueCellKeyValueSource;
  v9 = -[PKMultiKeyValueCellKeyValueSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_subtitle, a4);
  }

  return v10;
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

  if (self->_title)
    objc_msgSend(v3, "appendString:");
  if (self->_subtitle)
    objc_msgSend(v3, "appendString:");
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSCopying *)v6;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitle);
  PKCombinedHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKMultiKeyValueCellKeyValueSource *v4;
  PKMultiKeyValueCellKeyValueSource *v5;
  PKMultiKeyValueCellKeyValueSource *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *subtitle;
  NSString *v14;
  _BOOL4 v15;

  v4 = (PKMultiKeyValueCellKeyValueSource *)a3;
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
        title = v6->_title;
        v8 = self->_title;
        v9 = title;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_17;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_18;
        }
        subtitle = v6->_subtitle;
        v8 = self->_subtitle;
        v14 = subtitle;
        if (v8 == v14)
        {

LABEL_20:
          v12 = self->_bold == v6->_bold;
          goto LABEL_21;
        }
        v10 = v14;
        if (v8 && v14)
        {
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (v15)
            goto LABEL_20;
LABEL_18:
          v12 = 0;
LABEL_21:

          goto LABEL_22;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKMultiKeyValueCellKeyValueSource *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;

  v5 = +[PKMultiKeyValueCellKeyValueSource allocWithZone:](PKMultiKeyValueCellKeyValueSource, "allocWithZone:");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v8;

  v5->_bold = self->_bold;
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)isBold
{
  return self->_bold;
}

- (void)setBold:(BOOL)a3
{
  self->_bold = a3;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setSubtitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
