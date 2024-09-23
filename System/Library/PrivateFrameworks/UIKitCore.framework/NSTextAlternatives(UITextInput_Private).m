@implementation NSTextAlternatives(UITextInput_Private)

+ (uint64_t)attributedText:()UITextInput_Private withAlternativeTexts:
{
  return objc_msgSend(off_1E1679D20, "attributedText:withAlternativeTexts:style:", a3, a4, 1);
}

+ (id)attributedText:()UITextInput_Private withAlternativeTexts:style:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v9 = objc_msgSend(objc_alloc((Class)off_1E1679D20), "initWithPrimaryString:alternativeStrings:isLowConfidence:", v8, v7, a5 == 1);
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    v14 = *(_QWORD *)off_1E16790E0;
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v8, v11);

    v8 = (id)v9;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
  }

  return v12;
}

@end
