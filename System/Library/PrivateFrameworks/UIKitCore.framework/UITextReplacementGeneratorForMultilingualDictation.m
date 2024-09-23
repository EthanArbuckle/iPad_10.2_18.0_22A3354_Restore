@implementation UITextReplacementGeneratorForMultilingualDictation

- (UITextReplacementGeneratorForMultilingualDictation)initWithMultilingualAlternatives:(id)a3 stringToReplace:(id)a4 replacementRange:(id)a5
{
  id v9;
  id v10;
  id v11;
  UITextReplacementGeneratorForMultilingualDictation *v12;
  UITextReplacementGeneratorForMultilingualDictation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UITextReplacementGeneratorForMultilingualDictation;
  v12 = -[UITextReplacementGeneratorForMultilingualDictation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[UITextReplacementGenerator setStringToReplace:](v12, "setStringToReplace:", v10);
    -[UITextReplacementGenerator setReplacementRange:](v13, "setReplacementRange:", v11);
    objc_storeStrong((id *)&v13->_multilingualAlternatives, a3);
  }

  return v13;
}

- (id)replacements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UITextReplacementGeneratorForMultilingualDictation multilingualAlternatives](self, "multilingualAlternatives", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[UITextReplacementGenerator shouldAllowString:intoReplacements:](self, "shouldAllowString:intoReplacements:", v10, v3);

        if (v11)
        {
          -[UITextReplacementGenerator replacementRange](self, "replacementRange");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIDictationMultilingualUtilities textReplacementFromMultilingualString:replacementRange:stringToReplace:](UIDictationMultilingualUtilities, "textReplacementFromMultilingualString:replacementRange:stringToReplace:", v9, v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (NSArray)multilingualAlternatives
{
  return self->_multilingualAlternatives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multilingualAlternatives, 0);
}

@end
