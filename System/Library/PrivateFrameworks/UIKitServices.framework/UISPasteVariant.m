@implementation UISPasteVariant

+ (NSArray)allVariants
{
  if (_MergedGlobals_8 != -1)
    dispatch_once(&_MergedGlobals_8, &__block_literal_global_5);
  return (NSArray *)(id)qword_1ECDA58C0;
}

void __30__UISPasteVariant_allVariants__block_invoke()
{
  UISPasteVariant *v0;
  UISPasteVariant *v1;
  UISPasteVariant *v2;
  UISPasteVariant *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = -[UISPasteVariant initWithSecureName:selector:actionIdentifier:glpyh:keyInput:keyModifierFlags:]([UISPasteVariant alloc], "initWithSecureName:selector:actionIdentifier:glpyh:keyInput:keyModifierFlags:", 0x10000, sel_paste_, CFSTR("com.apple.action.paste"), CFSTR("doc.on.clipboard"), CFSTR("v"), 0x100000);
  v6[0] = v0;
  v1 = -[UISPasteVariant initWithSecureName:selector:actionIdentifier:glpyh:keyInput:keyModifierFlags:]([UISPasteVariant alloc], "initWithSecureName:selector:actionIdentifier:glpyh:keyInput:keyModifierFlags:", 65537, sel_pasteAndMatchStyle_, CFSTR("com.apple.action.pasteAndMatchStyle"), CFSTR("doc.on.clipboard"), CFSTR("v"), 1703936);
  v6[1] = v1;
  v2 = -[UISPasteVariant initWithSecureName:selector:actionIdentifier:glpyh:keyInput:keyModifierFlags:]([UISPasteVariant alloc], "initWithSecureName:selector:actionIdentifier:glpyh:keyInput:keyModifierFlags:", 65538, sel_pasteAndGo_, CFSTR("com.apple.action.pasteAndGo"), CFSTR("doc.on.clipboard"), 0, 0);
  v6[2] = v2;
  v3 = -[UISPasteVariant initWithSecureName:selector:actionIdentifier:glpyh:keyInput:keyModifierFlags:]([UISPasteVariant alloc], "initWithSecureName:selector:actionIdentifier:glpyh:keyInput:keyModifierFlags:", 65539, sel_pasteAndSearch_, CFSTR("com.apple.action.pasteAndSearch"), CFSTR("doc.on.clipboard"), 0, 0);
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECDA58C0;
  qword_1ECDA58C0 = v4;

}

- (UISPasteVariant)initWithSecureName:(unsigned int)a3 selector:(SEL)a4 actionIdentifier:(id)a5 glpyh:(id)a6 keyInput:(id)a7 keyModifierFlags:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  UISPasteVariant *v18;
  UISPasteVariant *v19;
  uint64_t v20;
  NSString *glyph;
  uint64_t v22;
  NSString *keyInput;
  objc_super v25;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)UISPasteVariant;
  v18 = -[UISPasteVariant init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_secureName = a3;
    v18->_selector = a4;
    objc_storeStrong((id *)&v18->_actionIdentifier, a5);
    v20 = objc_msgSend(v16, "copy");
    glyph = v19->_glyph;
    v19->_glyph = (NSString *)v20;

    v22 = objc_msgSend(v17, "copy");
    keyInput = v19->_keyInput;
    v19->_keyInput = (NSString *)v22;

    v19->_keyModifierFlags = a8;
  }

  return v19;
}

+ (id)variantForSecureName:(unsigned int)a3
{
  unsigned __int16 v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(a1, "allVariants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= (unint64_t)v3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)variantForSelector:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "allVariants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((SEL)objc_msgSend(v9, "selector") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)variantForActionIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "allVariants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "actionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)localizedStringForLocalization:(id)a3
{
  return UISLocalizedStringForSecureName(self->_secureName, a3);
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (SEL)selector
{
  return self->_selector;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)glyph
{
  return self->_glyph;
}

- (NSString)keyInput
{
  return self->_keyInput;
}

- (int64_t)keyModifierFlags
{
  return self->_keyModifierFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyInput, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
