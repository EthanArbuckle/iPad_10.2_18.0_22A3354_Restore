@implementation _UIImageAssetRenditionCacheKey

+ (id)keyWithSize:(CGSize)a3 unresolvedTintColor:(id)a4 traitCollection:(id)a5 bold:(BOOL)a6 drawMode:(unsigned int)a7
{
  CGFloat height;
  CGFloat width;
  __CFString *v12;
  id v13;
  _UIImageAssetRenditionCacheKey *v14;
  uint64_t v15;
  UIColor *resolvedTintColor;
  uint64_t v17;
  NSString *appearanceName;

  height = a3.height;
  width = a3.width;
  v12 = (__CFString *)a5;
  v13 = a4;
  v14 = objc_alloc_init(_UIImageAssetRenditionCacheKey);
  objc_msgSend(v13, "resolvedColorWithTraitCollection:", v12);
  v15 = objc_claimAutoreleasedReturnValue();

  resolvedTintColor = v14->resolvedTintColor;
  v14->resolvedTintColor = (UIColor *)v15;

  -[UITraitCollection _styleEffectAppearanceName](v12);
  v17 = objc_claimAutoreleasedReturnValue();

  appearanceName = v14->appearanceName;
  v14->appearanceName = (NSString *)v17;

  v14->_size.width = width;
  v14->_size.height = height;
  v14->_drawMode = a7;
  *(_BYTE *)&v14->_flags = *(_BYTE *)&v14->_flags & 0xFE | a6;
  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = (unint64_t)self->_size.height ^ (unint64_t)self->_size.width;
  v4 = -[NSString hash](self->appearanceName, "hash");
  return v3 ^ v4 ^ -[UIColor hash](self->resolvedTintColor, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  UIColor *resolvedTintColor;
  UIColor *v6;
  UIColor *v7;
  UIColor *v8;
  BOOL v9;
  _BOOL4 v10;
  NSString *appearanceName;
  NSString *v12;
  _BOOL4 v13;
  BOOL v14;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  resolvedTintColor = self->resolvedTintColor;
  v6 = (UIColor *)v4[1];
  v7 = resolvedTintColor;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_15;
    v10 = -[UIColor isEqual:](v6, "isEqual:", v7);

    if (!v10)
      goto LABEL_16;
  }
  appearanceName = self->appearanceName;
  v6 = (UIColor *)v4[2];
  v12 = appearanceName;
  if (v6 != (UIColor *)v12)
  {
    v8 = (UIColor *)v12;
    if (v6 && v12)
    {
      v13 = -[UIColor isEqual:](v6, "isEqual:", v12);

      if (v13)
        goto LABEL_19;
LABEL_16:
      v14 = 0;
      goto LABEL_17;
    }
LABEL_15:

    goto LABEL_16;
  }

LABEL_19:
  v14 = 0;
  if (*((double *)v4 + 3) == self->_size.width && *((double *)v4 + 4) == self->_size.height)
  {
    if (*((_DWORD *)v4 + 10) == self->_drawMode)
    {
      v14 = ((*(_BYTE *)&self->_flags ^ *((unsigned __int8 *)v4 + 44)) & 1) == 0;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_17:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->appearanceName, 0);
  objc_storeStrong((id *)&self->resolvedTintColor, 0);
}

@end
