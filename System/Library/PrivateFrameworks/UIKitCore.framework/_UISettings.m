@implementation _UISettings

- (_UISettings)initWithDefaultValues
{
  _UISettings *v2;
  _UISettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISettings;
  v2 = -[PTSettings initWithDefaultValues](&v5, sel_initWithDefaultValues);
  v3 = v2;
  if (v2)
    -[PTSettings _setObservationEnabled:](v2, "_setObservationEnabled:", 1);
  return v3;
}

+ (id)settingsFromArchiveFile:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  _ArchivePath(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v6, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if (a4)
      {
        objc_msgSend(*a4, "localizedDescription");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = &stru_1E16EDF20;
      }
      v16 = objc_opt_class();
      NSLog(CFSTR("*** error reading settings archive file: <%@: %@> %@"), v16, v6, v10);

      v9 = 0;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "settingsFromArchiveDictionary:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      if (a4)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0CB28A8];
        v19 = *MEMORY[0x1E0CB2D50];
        v20[0] = CFSTR("Non-dictionary plist");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v14);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v15 = objc_opt_class();
      NSLog(CFSTR("*** error unarchiving settings: <%@: %@> Non-dictionary plist"), v15, v6);
    }
    else
    {
      if (a4)
      {
        objc_msgSend(*a4, "localizedDescription");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = &stru_1E16EDF20;
      }
      v17 = objc_opt_class();
      NSLog(CFSTR("*** error unserializing settings archive data: <%@: %@> %@"), v17, v6, v11);

    }
    v9 = 0;
    goto LABEL_19;
  }
  NSLog(CFSTR("*** error reading settings archive: shared archive directory does not exist."));
  v9 = 0;
LABEL_21:

  return v9;
}

- (BOOL)archiveToFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  BOOL v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB38B0];
  -[PTSettings archiveDictionary](self, "archiveDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithPropertyList:format:options:error:", v8, 200, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (a4)
    {
      objc_msgSend(*a4, "localizedDescription");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = &stru_1E16EDF20;
    }
    v14 = objc_opt_class();
    NSLog(CFSTR("*** error serializing settings archive dictionary: <%@> %@"), v14, v10);
    goto LABEL_12;
  }
  _ArchivePath(v6);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (v11 = 1, (objc_msgSend(v9, "writeToFile:options:error:", v10, 1, a4) & 1) == 0))
  {
    if (a4)
    {
      objc_msgSend(*a4, "localizedDescription");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &stru_1E16EDF20;
    }
    v13 = objc_opt_class();
    NSLog(CFSTR("*** error writing settings archive data: <%@: %@> %@"), v13, v10, v12);

LABEL_12:
    v11 = 0;
  }

  return v11;
}

- (BOOL)restoreFromArchiveFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "settingsFromArchiveFile:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[_UISettings setValuesFromModel:](self, "setValuesFromModel:", v7);

  return v7 != 0;
}

+ (BOOL)_supportsArchivingCustomClass:(Class)a3
{
  return (Class)objc_opt_class() == a3 || objc_opt_class() == (_QWORD)a3;
}

+ (BOOL)_supportsArchivingStructType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CGPoint")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("CGSize")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CGRect"));
  }

  return v4;
}

+ (id)_archiveDictionaryForObject:(id)a3 ofCustomClass:(Class)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  if ((Class)objc_opt_class() == a4)
  {
    objc_msgSend(a1, "_dictionaryForColor:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v8;
    goto LABEL_7;
  }
  if ((Class)objc_opt_class() == a4)
  {
    objc_msgSend(a1, "_dictionaryForFont:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

+ (id)_archiveDictionaryForValue:(id)a3 ofStructType:(id)a4
{
  id v5;
  id v6;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v8;
  CGPoint v10;
  CGSize v11;
  CGRect v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("CGPoint")))
  {
    objc_msgSend(v5, "CGPointValue");
    DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v10);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("CGSize")))
  {
    objc_msgSend(v5, "CGSizeValue");
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v11);
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("CGRect")))
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v5, "CGRectValue");
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v12);
  }
  v8 = DictionaryRepresentation;
LABEL_8:

  return v8;
}

+ (id)_objectOfCustomClass:(Class)a3 fromArchiveDictionary:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    objc_msgSend(a1, "_colorFromDictionary:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v8;
    goto LABEL_7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    objc_msgSend(a1, "_fontFromDictionary:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

+ (id)_valueOfStructType:(id)a3 fromArchiveDictionary:(id)a4
{
  id v5;
  const __CFDictionary *v6;
  uint64_t v7;
  CGSize v8;
  void *v9;
  CGRect v11;

  v5 = a3;
  v6 = (const __CFDictionary *)a4;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("CGPoint")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("CGSize")))
    {
      v11.origin = (CGPoint)*MEMORY[0x1E0C9D820];
      if (CGSizeMakeWithDictionaryRepresentation(v6, (CGSize *)&v11))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", *(_OWORD *)&v11.origin);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CGRect")))
    {
      v8 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v11.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      v11.size = v8;
      if (CGRectMakeWithDictionaryRepresentation(v6, &v11))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *(_OWORD *)&v11.origin, *(_OWORD *)&v11.size);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v11.origin = (CGPoint)*MEMORY[0x1E0C9D538];
  if (!CGPointMakeWithDictionaryRepresentation(v6, &v11.origin))
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(_OWORD *)&v11.origin);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v7;
LABEL_12:

  return v9;
}

+ (id)_colorFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;

  v3 = a3;
  _NumberForKey(v3, (uint64_t)CFSTR("red"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _NumberForKey(v3, (uint64_t)CFSTR("green"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NumberForKey(v3, (uint64_t)CFSTR("blue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _NumberForKey(v3, (uint64_t)CFSTR("alpha"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v4 && v5 && v6 && v7)
  {
    objc_msgSend(v4, "floatValue");
    v10 = v9;
    objc_msgSend(v5, "floatValue");
    v12 = v11;
    objc_msgSend(v6, "floatValue");
    v14 = v13;
    objc_msgSend(v7, "floatValue");
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v10, v12, v14, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_dictionaryForColor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v11 = 0.0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v3 = 0;
  if (objc_msgSend(a3, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9))
  {
    v13[0] = CFSTR("red");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v13[1] = CFSTR("green");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v5;
    v13[2] = CFSTR("blue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v6;
    v13[3] = CFSTR("alpha");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)_fontFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  float v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("fontName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  _NumberForKey(v3, (uint64_t)CFSTR("fontSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(v7, "floatValue");
    objc_msgSend(off_1E167A828, "fontWithName:size:", v6, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_dictionaryForFont:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11[0] = CFSTR("fontName");
    v3 = a3;
    objc_msgSend(v3, "fontName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("fontSize");
    v12[0] = v4;
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "pointSize");
    v7 = v6;

    objc_msgSend(v5, "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end
