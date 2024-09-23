@implementation SBPIPDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "allowAutoPIP");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBAllowAutoPIP"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualizeKeyboardFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBPIPVisualizeKeyboardFrame"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "visualizePositionRegions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBPIPVisualizePositionRegions"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "initiallyUsesMinimumPreferredContentSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBPIPInitiallyUsesMinimumPreferredContentSize"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lastKnownCornerPositionByContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBPIPLastKnownCornerPositionByContentType"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lastKnownSizeByContentType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBPIPLastKnownSizeByContentType"), 0, 1);

}

- (unint64_t)lastKnownCornerPositionForContentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[SBPIPDefaults lastKnownCornerPositionByContentType](self, "lastKnownCornerPositionByContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 3;

  return v7;
}

- (void)setLastKnownCornerPosition:(unint64_t)a3 contentType:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[SBPIPDefaults lastKnownCornerPositionByContentType](self, "lastKnownCornerPositionByContentType");
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v7;
  if (v7)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v6);

  -[SBPIPDefaults setLastKnownCornerPositionByContentType:](self, "setLastKnownCornerPositionByContentType:", v8);
}

- (double)lastKnownSizeForContentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[SBPIPDefaults lastKnownSizeByContentType](self, "lastKnownSizeByContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (void)setLastKnownSize:(double)a3 contentType:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[SBPIPDefaults lastKnownSizeByContentType](self, "lastKnownSizeByContentType");
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v7;
  if (v7)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v6);

  -[SBPIPDefaults setLastKnownSizeByContentType:](self, "setLastKnownSizeByContentType:", v8);
}

@end
