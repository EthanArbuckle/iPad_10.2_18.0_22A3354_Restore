@implementation _SKUIFontDescriptorCacheKey

- (_SKUIFontDescriptorCacheKey)initWithTextStyle:(__CFString *)a3 sizeCategory:(id)a4
{
  id v7;
  _SKUIFontDescriptorCacheKey *v8;
  _SKUIFontDescriptorCacheKey *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SKUIFontDescriptorCacheKey;
  v8 = -[_SKUIFontDescriptorCacheKey init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_textStyle = a3;
    objc_storeStrong((id *)&v8->_sizeCategory, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  CFHashCode v3;

  v3 = CFHash(self->_textStyle);
  return -[NSString hash](self->_sizeCategory, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _SKUIFontDescriptorCacheKey *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (_SKUIFontDescriptorCacheKey *)v4;
    if (self == v5)
    {
      v8 = 1;
    }
    else if (CFEqual(-[_SKUIFontDescriptorCacheKey textStyle](self, "textStyle"), -[_SKUIFontDescriptorCacheKey textStyle](v5, "textStyle")))
    {
      -[_SKUIFontDescriptorCacheKey sizeCategory](self, "sizeCategory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SKUIFontDescriptorCacheKey sizeCategory](v5, "sizeCategory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (__CFString)textStyle
{
  return self->_textStyle;
}

- (NSString)sizeCategory
{
  return self->_sizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeCategory, 0);
}

@end
