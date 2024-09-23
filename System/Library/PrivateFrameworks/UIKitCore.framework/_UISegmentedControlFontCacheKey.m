@implementation _UISegmentedControlFontCacheKey

- (_UISegmentedControlFontCacheKey)initWithStyleProvider:(id)a3 size:(int)a4 selected:(BOOL)a5 bold:(BOOL)a6
{
  id v10;
  _UISegmentedControlFontCacheKey *v11;
  objc_class *v12;
  uint64_t v13;
  NSString *styleProviderName;
  objc_super v16;

  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UISegmentedControlFontCacheKey;
  v11 = -[_UISegmentedControlFontCacheKey init](&v16, sel_init);
  if (v11)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    styleProviderName = v11->_styleProviderName;
    v11->_styleProviderName = (NSString *)v13;

    v11->_size = a4;
    v11->_selected = a5;
    v11->_bold = a6;
  }

  return v11;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_styleProviderName, "hash") ^ self->_size ^ (unint64_t)self->_selected ^ self->_bold;
}

- (BOOL)isEqual:(id)a3
{
  _UISegmentedControlFontCacheKey *v4;
  BOOL v5;

  v4 = (_UISegmentedControlFontCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UISegmentedControlFontCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  _QWORD *v4;
  _DWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = (void *)v4[1];
  v7 = self->_styleProviderName;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_12:
      v11 = 0;
      goto LABEL_13;
    }
    v10 = -[NSString isEqual:](v7, "isEqual:", v8);

    if (!v10)
      goto LABEL_12;
  }
  if (self->_size != v5[4] || self->_selected != *((unsigned __int8 *)v5 + 20))
    goto LABEL_12;
  v11 = self->_bold == *((unsigned __int8 *)v5 + 21);
LABEL_13:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProviderName, 0);
}

@end
