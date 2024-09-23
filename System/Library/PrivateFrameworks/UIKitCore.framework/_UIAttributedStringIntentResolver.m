@implementation _UIAttributedStringIntentResolver

+ (id)fontAttributeValueForInlineIntent:(int64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5
{
  char v5;
  id v6;
  char isKindOfClass;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v6;
  v9 = v8;
  v10 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    if ((v5 & 4) != 0)
      v11 = v5 & 3 | 0x400u;
    else
      v11 = v5 & 3;
    if ((_DWORD)v11)
    {
      objc_msgSend(v8, "fontDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v5 & 4) == 0 || (objc_msgSend(v13, "symbolicTraits") & 0x400) != 0)
      {
        objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v14, 0.0);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((v5 & 2) == 0)
          CTFontGetWeight();
        objc_msgSend(v9, "pointSize");
        objc_msgSend(off_1E167A828, "monospacedSystemFontOfSize:weight:");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v10 = (id)v15;

    }
    else
    {
      v10 = v8;
    }

  }
  return v10;
}

@end
