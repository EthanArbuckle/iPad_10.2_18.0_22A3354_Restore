@implementation WBSReaderFont

+ (WBSReaderFont)systemFont
{
  return (WBSReaderFont *)objc_msgSend(a1, "systemFontWithDisplayName:", CFSTR("San Francisco"));
}

+ (id)systemFontWithDisplayName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFamilyName:displayName:type:", CFSTR("System"), v4, 1);

  return v5;
}

+ (WBSReaderFont)systemSerifFont
{
  return (WBSReaderFont *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithFamilyName:displayName:type:", CFSTR("System Serif"), CFSTR("New York"), 2);
}

+ (id)fontWithFamilyName:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFamilyName:displayName:type:", v6, v7, 0);

  return v8;
}

- (id)_initWithFamilyName:(id)a3 displayName:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  WBSReaderFont *v10;
  uint64_t v11;
  NSString *familyName;
  uint64_t v13;
  NSString *displayName;
  WBSReaderFont *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSReaderFont;
  v10 = -[WBSReaderFont init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    familyName = v10->_familyName;
    v10->_familyName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v13;

    v10->_type = a5;
    v15 = v10;
  }

  return v10;
}

- (NSString)familyNameForWebContent
{
  if (self->_type > 1uLL)
    return (NSString *)CFSTR("ui-serif");
  else
    return self->_familyName;
}

- (NSString)displayName
{
  NSString *displayName;

  displayName = self->_displayName;
  if (displayName)
    return displayName;
  -[WBSReaderFont _localizedName](self, "_localizedName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isInstalled
{
  BOOL v2;
  __CTFontDescriptor *v3;

  if ((unint64_t)(self->_type - 1) < 2)
    return 1;
  v3 = -[WBSReaderFont _createFontDescriptorRefForFontFamilyName:restrictToEnabled:](self, "_createFontDescriptorRefForFontFamilyName:restrictToEnabled:", self->_familyName, 1);
  v2 = v3 != 0;

  return v2;
}

- (id)_localizedName
{
  NSString **p_localizedName;
  __CTFontDescriptor *v4;
  __CTFontDescriptor *v5;
  NSString *v6;
  NSString *localizedName;

  if (self->_hasCalculatedLocalizedName)
  {
    p_localizedName = &self->_localizedName;
  }
  else
  {
    v4 = -[WBSReaderFont _createFontDescriptorRefForFontFamilyName:restrictToEnabled:](self, "_createFontDescriptorRefForFontFamilyName:restrictToEnabled:", self->_familyName, 0);
    if (v4)
    {
      v5 = v4;
      v6 = (NSString *)CTFontDescriptorCopyLocalizedAttribute(v4, (CFStringRef)*MEMORY[0x1E0CA8300], 0);
      localizedName = self->_localizedName;
      self->_localizedName = v6;

      CFRelease(v5);
    }
    p_localizedName = &self->_localizedName;
    if (!-[NSString length](self->_localizedName, "length"))
      objc_storeStrong((id *)&self->_localizedName, self->_familyName);
    self->_hasCalculatedLocalizedName = 1;
  }
  return *p_localizedName;
}

- (__CTFontDescriptor)_createFontDescriptorRefForFontFamilyName:(id)a3 restrictToEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const __CTFontDescriptor *v7;
  const __CTFontDescriptor *v8;
  __CTFontDescriptor *MatchingFontDescriptor;

  v4 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_familyName, *MEMORY[0x1E0CA8300]);
  if (v4)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA82F0]);
  v7 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)v6);
  v8 = v7;
  if (v7)
  {
    MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v7, 0);
    CFRelease(v8);
  }
  else
  {
    MatchingFontDescriptor = 0;
  }

  return MatchingFontDescriptor;
}

- (BOOL)isEqual:(id)a3
{
  WBSReaderFont *v4;
  WBSReaderFont *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = (WBSReaderFont *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBSReaderFont familyName](self, "familyName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSReaderFont familyName](v5, "familyName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual())
      {
        -[WBSReaderFont displayName](self, "displayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSReaderFont displayName](v5, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual())
          v10 = self->_type == v5->_type;
        else
          v10 = 0;

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WBSReaderFont familyName](self, "familyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WBSReaderFont displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4 ^ self->_type;

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t type;
  const __CFString *v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  type = self->_type;
  v6 = CFSTR("Named");
  if (type == 1)
    v6 = CFSTR("System");
  if (type == 2)
    v7 = CFSTR("System Serif");
  else
    v7 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; familyName = \"%@\"; displayName = \"%@\"; type = \"%@\">"),
    v4,
    self,
    self->_familyName,
    self->_displayName,
    v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)familyName
{
  return self->_familyName;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end
