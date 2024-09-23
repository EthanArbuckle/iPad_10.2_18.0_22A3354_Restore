@implementation TIIndicScriptComposer_pa

- (NSDictionary)_modifiersToAllowedPrefixes
{
  NSDictionary *modifiersToAllowedPrefixes;

  modifiersToAllowedPrefixes = self->_modifiersToAllowedPrefixes;
  if (!modifiersToAllowedPrefixes)
  {
    self->_modifiersToAllowedPrefixes = (NSDictionary *)&unk_1EA140958;
    modifiersToAllowedPrefixes = self->_modifiersToAllowedPrefixes;
  }
  return modifiersToAllowedPrefixes;
}

- (id)_outputForModifier:(id)a3 withPrefix:(id)a4 displayString:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  -[TIIndicScriptComposer_pa _modifiersToAllowedPrefixes](self, "_modifiersToAllowedPrefixes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TIIndicScriptComposer languageIdentifier](self, "languageIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_lastConjunctInLanguage:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", objc_msgSend(v13, "_lastLongCharacter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "rangeOfString:options:", CFSTR("੍"), 2) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v11, "containsObject:", v14))
    {
      if (a5)
      {
        objc_msgSend(v13, "stringByAppendingString:", v8);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v8;
    }
    else
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      if (a5)
        *a5 = objc_retainAutorelease(v17);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_outputForModifier:(id)a3 withPrefix:(id)a4
{
  return -[TIIndicScriptComposer_pa _outputForModifier:withPrefix:displayString:](self, "_outputForModifier:withPrefix:displayString:", a3, a4, 0);
}

- (id)_displayStringForModifier:(id)a3 withPrefix:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v10;

  v6 = a3;
  v10 = v6;
  -[TIIndicScriptComposer_pa _outputForModifier:withPrefix:displayString:](self, "_outputForModifier:withPrefix:displayString:", v6, a4, &v10);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v7)
    v7 = v8;

  return v7;
}

- (id)contextualDisplayKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)TIIndicScriptComposer_pa;
  -[TIIndicScriptComposer contextualDisplayKeys](&v19, sel_contextualDisplayKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[TIIndicScriptComposer context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TIIndicScriptComposer_pa _modifiersToAllowedPrefixes](self, "_modifiersToAllowedPrefixes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[TIIndicScriptComposer_pa _displayStringForModifier:withPrefix:](self, "_displayStringForModifier:withPrefix:", v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  return v4;
}

- (id)stringByComposingInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[TIIndicScriptComposer context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIIndicScriptComposer_pa _outputForModifier:withPrefix:](self, "_outputForModifier:withPrefix:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIIndicScriptComposer_pa;
    -[TIIndicScriptComposer stringByComposingInput:](&v10, sel_stringByComposingInput_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiersToAllowedPrefixes, 0);
}

@end
