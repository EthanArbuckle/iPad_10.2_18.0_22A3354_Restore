@implementation _UINavTitleAppearanceData

- (NSDictionary)largeTitleTextAttributes
{
  NSDictionary *largeTitleTextAttributes;
  NSDictionary *v3;
  void *v4;

  largeTitleTextAttributes = self->_largeTitleTextAttributes;
  if (largeTitleTextAttributes)
  {
    v3 = largeTitleTextAttributes;
  }
  else
  {
    -[_UINavigationBarTitleFontProvider defaultLargeTitleFont](self->_titleFontProvider, "defaultLargeTitleFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UINavigationTitleAppearanceAttributesWithFont(v4);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)standardTitleDataForIdiom:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = (void *)_UIStandardTitleData;
  if (!_UIStandardTitleData)
  {
    v5 = objc_opt_new();
    v6 = (void *)_UIStandardTitleData;
    _UIStandardTitleData = v5;

    v4 = (void *)_UIStandardTitleData;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    a3 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (_QWORD *)objc_opt_new();
    v9 = (void *)v8[2];
    v8[2] = 0;

    v10 = (void *)v8[3];
    v8[3] = 0;

    v8[4] = 0;
    v8[5] = 0;
    +[_UINavigationBarTitleFontProvider providerForIdiom:](_UINavigationBarTitleFontProvider, "providerForIdiom:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v8[6];
    v8[6] = v11;

    v8[7] = a3;
    v13 = (id)objc_msgSend(v8, "markReadOnly");
    v14 = (void *)_UIStandardTitleData;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, v15);

  }
  return v8;
}

- (id)replicate
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavTitleAppearanceData;
  -[_UIBarAppearanceData replicate](&v9, sel_replicate);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[NSDictionary copy](self->_titleTextAttributes, "copy");
  v5 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v4;

  v6 = -[NSDictionary copy](self->_largeTitleTextAttributes, "copy");
  v7 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v6;

  *(UIOffset *)(v3 + 32) = self->_titlePositionAdjustment;
  *(_QWORD *)(v3 + 56) = self->_titleFontProviderIdiom;
  objc_storeStrong((id *)(v3 + 48), self->_titleFontProvider);
  return (id)v3;
}

- (BOOL)checkEqualTo:(id)a3
{
  double *v4;
  char v6;
  void *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  BOOL v12;
  int v13;
  NSDictionary *largeTitleTextAttributes;
  void *v15;
  NSDictionary *v16;
  objc_super v17;

  v4 = (double *)a3;
  v17.receiver = self;
  v17.super_class = (Class)_UINavTitleAppearanceData;
  if (!-[_UIBarAppearanceData checkEqualTo:](&v17, sel_checkEqualTo_, v4)
    || self->_titleFontProviderIdiom != *((_QWORD *)v4 + 7))
  {
    goto LABEL_7;
  }
  if (self->_titlePositionAdjustment.horizontal != v4[4] || self->_titlePositionAdjustment.vertical != v4[5])
    goto LABEL_7;
  v8 = (void *)*((_QWORD *)v4 + 2);
  v9 = self->_titleTextAttributes;
  v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_18;
  }
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v6 = 0;
LABEL_23:

    goto LABEL_8;
  }
  v13 = -[NSDictionary isEqual:](v9, "isEqual:", v10);

  if (v13)
  {
LABEL_18:
    largeTitleTextAttributes = self->_largeTitleTextAttributes;
    v15 = (void *)*((_QWORD *)v4 + 3);
    v9 = largeTitleTextAttributes;
    v16 = v15;
    if (v9 == v16)
    {
      v6 = 1;
      v11 = v9;
    }
    else
    {
      v11 = v16;
      v6 = 0;
      if (v9 && v16)
        v6 = -[NSDictionary isEqual:](v9, "isEqual:", v16);
    }
    goto LABEL_23;
  }
LABEL_7:
  v6 = 0;
LABEL_8:

  return v6;
}

- (UIOffset)titlePositionAdjustment
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_titlePositionAdjustment.horizontal;
  vertical = self->_titlePositionAdjustment.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setLargeTitleTextAttributes:(id)a3
{
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *largeTitleTextAttributes;
  id v9;

  v9 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  if (v9)
  {
    -[_UINavigationBarTitleFontProvider defaultLargeTitleFont](self->_titleFontProvider, "defaultLargeTitleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UINavigationTitleAppearanceCompleteAttributesWithFont(v9, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSDictionary *)objc_msgSend(v6, "copy");
    largeTitleTextAttributes = self->_largeTitleTextAttributes;
    self->_largeTitleTextAttributes = v7;

  }
  else
  {
    v5 = self->_largeTitleTextAttributes;
    self->_largeTitleTextAttributes = 0;
  }

}

- (NSDictionary)titleTextAttributes
{
  NSDictionary *titleTextAttributes;
  NSDictionary *v3;
  void *v4;

  titleTextAttributes = self->_titleTextAttributes;
  if (titleTextAttributes)
  {
    v3 = titleTextAttributes;
  }
  else
  {
    -[_UINavigationBarTitleFontProvider defaultInlineTitleFont](self->_titleFontProvider, "defaultInlineTitleFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UINavigationTitleAppearanceAttributesWithFont(v4);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setTitleTextAttributes:(id)a3
{
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *titleTextAttributes;
  id v9;

  v9 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  if (v9)
  {
    -[_UINavigationBarTitleFontProvider defaultInlineTitleFont](self->_titleFontProvider, "defaultInlineTitleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UINavigationTitleAppearanceCompleteAttributesWithFont(v9, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSDictionary *)objc_msgSend(v6, "copy");
    titleTextAttributes = self->_titleTextAttributes;
    self->_titleTextAttributes = v7;

  }
  else
  {
    v5 = self->_titleTextAttributes;
    self->_titleTextAttributes = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFontProvider, 0);
  objc_storeStrong((id *)&self->_largeTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_titleTextAttributes, 0);
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("InlineAttributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_ui_decodeTextAttributesForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("LargeAttributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_ui_decodeTextAttributesForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("InlineOffset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeUIOffsetForKey:", v11);
    v13 = v12;
    v15 = v14;

  }
  else
  {
    objc_msgSend(v5, "_ui_decodeTextAttributesForKey:", CFSTR("InlineAttributes"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_ui_decodeTextAttributesForKey:", CFSTR("LargeAttributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeUIOffsetForKey:", CFSTR("InlineOffset"));
    v13 = v16;
    v15 = v17;
  }
  if (!(v8 | v10) && v13 == 0.0 && v15 == 0.0)
  {
    v18 = 0;
  }
  else
  {
    v18 = objc_opt_new();
    objc_storeStrong((id *)(v18 + 16), (id)v8);
    *(double *)(v18 + 32) = v13;
    *(double *)(v18 + 40) = v15;
    objc_storeStrong((id *)(v18 + 24), (id)v10);
    v19 = CFSTR("TitleProviderIdiom");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("TitleProviderIdiom"));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v5, "containsValueForKey:", v19))
      v20 = objc_msgSend(v5, "decodeIntegerForKey:", v19);
    else
      v20 = 0;
    *(_QWORD *)(v18 + 56) = v20;
    +[_UINavigationBarTitleFontProvider providerForIdiom:](_UINavigationBarTitleFontProvider, "providerForIdiom:");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(v18 + 48);
    *(_QWORD *)(v18 + 48) = v21;

  }
  return (id)v18;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _UINavTitleAppearanceData *v9;
  NSDictionary *titleTextAttributes;
  void *v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  NSDictionary *largeTitleTextAttributes;
  void *v16;
  unint64_t titleFontProviderIdiom;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = (void *)_UIStandardTitleData;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_titleFontProviderIdiom);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (_UINavTitleAppearanceData *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    goto LABEL_21;
  titleTextAttributes = self->_titleTextAttributes;
  if (titleTextAttributes)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("InlineAttributes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_ui_encodeTextAttributes:forKey:", titleTextAttributes, v11);

    }
    else
    {
      objc_msgSend(v20, "_ui_encodeTextAttributes:forKey:", self->_titleTextAttributes, CFSTR("InlineAttributes"));
    }
  }
  if (self->_titlePositionAdjustment.horizontal != 0.0 || self->_titlePositionAdjustment.vertical != 0.0)
  {
    if (!v6)
    {
      objc_msgSend(v20, "encodeUIOffset:forKey:", CFSTR("InlineOffset"));
      largeTitleTextAttributes = self->_largeTitleTextAttributes;
      if (!largeTitleTextAttributes)
        goto LABEL_17;
      v16 = v20;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("InlineOffset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeUIOffset:forKey:", v12, self->_titlePositionAdjustment.horizontal, self->_titlePositionAdjustment.vertical);

  }
  v13 = self->_largeTitleTextAttributes;
  if (v13)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("LargeAttributes"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_ui_encodeTextAttributes:forKey:", v13, v14);

      goto LABEL_17;
    }
    v16 = v20;
    largeTitleTextAttributes = self->_largeTitleTextAttributes;
LABEL_16:
    objc_msgSend(v16, "_ui_encodeTextAttributes:forKey:", largeTitleTextAttributes, CFSTR("LargeAttributes"));
  }
LABEL_17:
  titleFontProviderIdiom = self->_titleFontProviderIdiom;
  if (titleFontProviderIdiom > 5 || ((1 << titleFontProviderIdiom) & 0x23) == 0)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("TitleProviderIdiom"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "encodeInteger:forKey:", titleFontProviderIdiom, v19);

    }
    else
    {
      objc_msgSend(v20, "encodeInteger:forKey:", titleFontProviderIdiom, CFSTR("TitleProviderIdiom"));
    }
  }
LABEL_21:

}

- (void)describeInto:(id)a3
{
  id v4;
  CGFloat horizontal;
  double vertical;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UINavTitleAppearanceData;
  -[_UIBarAppearanceData describeInto:](&v8, sel_describeInto_, v4);
  objc_msgSend(v4, "appendString:", CFSTR(" titleTextAttributes="));
  _UIBADPrettyPrintTextAttributes(v4, self->_titleTextAttributes);
  vertical = self->_titlePositionAdjustment.vertical;
  if (self->_titlePositionAdjustment.horizontal != 0.0 || vertical != 0.0)
  {
    horizontal = self->_titlePositionAdjustment.horizontal;
    NSStringFromUIOffset(*(UIOffset *)(&vertical - 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" titlePositionAdjustment=%@"), v7);

  }
  objc_msgSend(v4, "appendString:", CFSTR(" largeTitleTextAttributes="));
  _UIBADPrettyPrintTextAttributes(v4, self->_largeTitleTextAttributes);

}

- (int64_t)hashInto:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavTitleAppearanceData;
  return -[_UIBarAppearanceData hashInto:](&v4, sel_hashInto_, a3);
}

- (void)setTitlePositionAdjustment:(UIOffset)a3
{
  CGFloat vertical;
  CGFloat horizontal;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  self->_titlePositionAdjustment.horizontal = horizontal;
  self->_titlePositionAdjustment.vertical = vertical;
}

@end
