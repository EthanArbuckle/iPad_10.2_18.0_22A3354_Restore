@implementation UIFont

- (CTFontRef)_fontAdjustedForTypesettingLanguage:(CTFontRef)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CTFontDescriptor *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[__CTFont fontDescriptor](a1, "fontDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CA8248];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CA8248]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "length"))
    {
      if (!v7 || (objc_msgSend(v3, "isEqualToString:", v7) & 1) == 0)
      {
        -[__CTFont fontDescriptor](a1, "fontDescriptor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v6;
        v17[0] = v3;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fontDescriptorByAddingAttributes:", v9);
        v10 = (const __CTFontDescriptor *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_11;
LABEL_9:
        -[__CTFont pointSize](a1, "pointSize");
        a1 = CTFontCreateWithFontDescriptor(v10, v14, 0);
LABEL_12:

        goto LABEL_13;
      }
    }
    else if (v7)
    {
      -[__CTFont fontDescriptor](a1, "fontDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fontAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "removeObjectForKey:", v6);
      v10 = (const __CTFontDescriptor *)objc_msgSend(objc_alloc((Class)off_1E167A830), "initWithFontAttributes:", v13);

      if (v10)
        goto LABEL_9;
LABEL_11:
      a1 = 0;
      goto LABEL_12;
    }
    v10 = 0;
    goto LABEL_11;
  }
LABEL_13:

  return a1;
}

- (CTFontRef)_fontAdjustedForTypesettingLanguageAwareLineHeightRatio:(const __CTFont *)a1
{
  CTFontRef v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  const __CTFontDescriptor *v15;
  char v16;
  void *v17;
  void *v18;
  CGFloat v19;
  uint64_t v21;
  _QWORD v22[2];

  v2 = a1;
  v22[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[__CTFont fontDescriptor](a1, "fontDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CA8358];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA8358]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (a2 == -1.0)
    {
      if (v6)
      {
        v12 = objc_alloc((Class)off_1E167A830);
        -[__CTFont fontDescriptor](v2, "fontDescriptor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fontAttributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (const __CTFontDescriptor *)objc_msgSend(v12, "initWithFontAttributes:", v14);

        if (v15)
        {
LABEL_18:
          -[__CTFont pointSize](v2, "pointSize");
          v2 = CTFontCreateWithFontDescriptor(v15, v19, 0);
LABEL_21:

          return v2;
        }
      }
      else
      {
        v15 = 0;
      }
LABEL_20:
      v2 = 0;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 != v9)
    {
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {

      }
      else
      {
        v16 = objc_msgSend(v8, "isEqual:", v9);

        if ((v16 & 1) != 0)
          goto LABEL_15;
      }
      -[__CTFont fontDescriptor](v2, "fontDescriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v5;
      v22[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fontDescriptorByAddingAttributes:", v18);
      v15 = (const __CTFontDescriptor *)objc_claimAutoreleasedReturnValue();

LABEL_17:
      if (v15)
        goto LABEL_18;
      goto LABEL_20;
    }

LABEL_15:
    v15 = 0;
    goto LABEL_17;
  }
  return v2;
}

@end
