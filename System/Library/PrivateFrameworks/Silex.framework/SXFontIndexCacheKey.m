@implementation SXFontIndexCacheKey

- (SXFontIndexCacheKey)initWithFontAttributes:(id)a3 fontSize:(int64_t)a4
{
  id v7;
  SXFontIndexCacheKey *v8;
  SXFontIndexCacheKey *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXFontIndexCacheKey;
  v8 = -[SXFontIndexCacheKey init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fontAttributes, a3);
    v9->_fontSize = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_fontSize ^ -[SXFontAttributes hash](self->_fontAttributes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SXFontIndexCacheKey *v4;
  SXFontIndexCacheKey *v5;
  BOOL v6;

  v4 = (SXFontIndexCacheKey *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_fontSize == v5->_fontSize
      && -[SXFontAttributes isEqual:](self->_fontAttributes, "isEqual:", v5->_fontAttributes);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SXFontIndexCacheKey initWithFontAttributes:fontSize:]([SXFontIndexCacheKey alloc], "initWithFontAttributes:fontSize:", self->_fontAttributes, self->_fontSize);
}

- (SXFontAttributes)fontAttributes
{
  return self->_fontAttributes;
}

- (int64_t)fontSize
{
  return self->_fontSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontAttributes, 0);
}

@end
