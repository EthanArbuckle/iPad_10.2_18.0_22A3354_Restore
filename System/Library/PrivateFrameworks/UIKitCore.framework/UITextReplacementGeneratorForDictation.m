@implementation UITextReplacementGeneratorForDictation

- (UITextReplacementGeneratorForDictation)initWithAlternatives:(id)a3 stringToReplace:(id)a4 replacementRange:(id)a5
{
  id v9;
  id v10;
  id v11;
  UITextReplacementGeneratorForDictation *v12;
  UITextReplacementGeneratorForDictation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UITextReplacementGeneratorForDictation;
  v12 = -[UITextReplacementGeneratorForDictation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[UITextReplacementGenerator setStringToReplace:](v12, "setStringToReplace:", v10);
    -[UITextReplacementGenerator setReplacementRange:](v13, "setReplacementRange:", v11);
    objc_storeStrong((id *)&v13->_alternatives, a3);
  }

  return v13;
}

- (id)replacements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UITextReplacementGeneratorForDictation alternatives](self, "alternatives", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternativeStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[UITextReplacementGenerator shouldAllowString:intoReplacements:](self, "shouldAllowString:intoReplacements:", v10, v3))
        {
          -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (NSTextAlternatives)alternatives
{
  return self->_alternatives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternatives, 0);
}

@end
