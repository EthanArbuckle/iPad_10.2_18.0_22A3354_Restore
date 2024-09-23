@implementation ACTKeyboardLayoutUtils

- (ACTKeyboardLayoutUtils)initWithLocale:(id)a3
{
  id v5;
  ACTKeyboardLayoutUtils *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *keyOverrides;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACTKeyboardLayoutUtils;
  v6 = -[ACTKeyboardLayoutUtils init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    keyOverrides = v6->_keyOverrides;
    v6->_keyOverrides = v7;

    objc_storeStrong((id *)&v6->_locale, a3);
  }

  return v6;
}

- (void)setLayoutKeyOverride:(id)a3 forKey:(id)a4 uiKeyboardStringNothing:(id)a5
{
  id v8;
  id v9;
  int v10;
  NSMutableDictionary *keyOverrides;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (v12)
  {
    v10 = objc_msgSend(v12, "isEqualToString:", v9);
    keyOverrides = self->_keyOverrides;
    if (v10)
      -[NSMutableDictionary removeObjectForKey:](keyOverrides, "removeObjectForKey:", v8);
    else
      -[NSMutableDictionary setObject:forKey:](keyOverrides, "setObject:forKey:", v12, v8);
  }

}

- (id)createTTKPlane:(id)a3
{
  id v4;
  TTKKeyboardPlane *v5;

  v4 = a3;
  v5 = -[TTKKeyboardPlane initWithUIKBTree:layoutUtils:]([TTKKeyboardPlane alloc], "initWithUIKBTree:layoutUtils:", v4, self);

  return v5;
}

- (id)baseKeyForString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)substitutesForKey:(id)a3 preferBaseKeyVariants:(BOOL)a4 preferManualShift:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length") == 1)
  {
    if (v8)
    {
      -[ACTKeyboardLayoutUtils baseKeyForString:](self, "baseKeyForString:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v11, "addObject:", v12);

    }
    v13 = objc_msgSend(v10, "characterAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v14, "characterIsMember:", v13);

    if ((_DWORD)v13 && !a5)
    {
      objc_msgSend(v10, "lowercaseStringWithLocale:", self->_locale);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);
      if (v8)
      {
        -[ACTKeyboardLayoutUtils baseKeyForString:](self, "baseKeyForString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v11, "addObject:", v16);

      }
    }
    if (v6)
    {
      v17 = objc_msgSend(v10, "characterAtIndex:", 0);
      objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v18, "characterIsMember:", v17);

      if ((_DWORD)v17)
      {
        objc_msgSend(v10, "uppercaseStringWithLocale:", self->_locale);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v19);
        if (v8)
        {
          -[ACTKeyboardLayoutUtils baseKeyForString:](self, "baseKeyForString:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v11, "addObject:", v20);

        }
      }
    }
    if (v8)
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ı")) & 1) != 0)
      {
        v21 = CFSTR("i");
LABEL_25:
        objc_msgSend(v11, "addObject:", v21);
        goto LABEL_26;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("İ")))
      {
        v21 = CFSTR("I");
        goto LABEL_25;
      }
    }
  }
LABEL_26:

  return v11;
}

- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4 includeSecondaryStrings:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "representedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "displayType") == 7 && (unint64_t)objc_msgSend(v9, "length") >= 2)
  {
    if (a4)
      objc_msgSend(v9, "substringFromIndex:", 1);
    else
      objc_msgSend(v9, "substringToIndex:", 1);
    v13 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Latin-Accents"));

  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_keyOverrides, "objectForKeyedSubscript:", *MEMORY[0x24BDF7AF0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
LABEL_19:

      goto LABEL_20;
    }
    if (objc_msgSend(v12, "length") == 2)
    {
      objc_msgSend(v13, "substringToIndex:", 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v13;
    }
LABEL_18:
    v19 = v14;

    v9 = v19;
    goto LABEL_19;
  }
  if (v5)
  {
    if (objc_msgSend(v8, "displayType") == 7)
    {
      objc_msgSend(v8, "secondaryRepresentedStrings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
        goto LABEL_14;
    }
    if (!objc_msgSend(v8, "displayType"))
    {
      objc_msgSend(v8, "secondaryRepresentedStrings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
LABEL_14:
        objc_msgSend(v8, "secondaryRepresentedStrings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
  }
LABEL_20:

  return v9;
}

- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4
{
  return -[ACTKeyboardLayoutUtils representedStringForKey:shifted:includeSecondaryStrings:](self, "representedStringForKey:shifted:includeSecondaryStrings:", a3, a4, 0);
}

- (id)exactKeyForString:(id)a3 keyplane:(id)a4 includeSecondaryStrings:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;
  id obj;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v23 = a5;
  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v8, "keys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
          -[ACTKeyboardLayoutUtils representedStringForKey:shifted:includeSecondaryStrings:](self, "representedStringForKey:shifted:includeSecondaryStrings:", v14, objc_msgSend(v9, "isShiftKeyplane"), v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v7, "isEqualToString:", v15) & 1) != 0)
            goto LABEL_13;
          objc_msgSend(v14, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("TenKey-Chinese-Pinyin"));

          if (v17)
          {
            objc_msgSend(v14, "displayString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "rangeOfString:options:", v7, 1);

            if (v19 != 0x7FFFFFFFFFFFFFFFLL)
            {
LABEL_13:
              v20 = v14;

              goto LABEL_14;
            }
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v11)
          continue;
        break;
      }
    }
    v20 = 0;
LABEL_14:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)exactKeyForString:(id)a3 keyplane:(id)a4
{
  return -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:includeSecondaryStrings:](self, "exactKeyForString:keyplane:includeSecondaryStrings:", a3, a4, 0);
}

- (id)alternativeKeyForString:(id)a3 keyplane:(id)a4 preferBaseKeyVariants:(BOOL)a5 preferManualShift:(BOOL)a6 substituteUpperCaseForLowerCase:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  if (a3)
  {
    -[ACTKeyboardLayoutUtils substitutesForKey:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:](self, "substitutesForKey:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:", a3, v9, v8, v7);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:](self, "exactKeyForString:keyplane:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17), v12, (_QWORD)v21);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            goto LABEL_12;
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v15)
          continue;
        break;
      }
    }
    v19 = 0;
LABEL_12:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 isRetyping:(BOOL)a6 preferBaseKeyVariants:(BOOL)a7 preferManualShift:(BOOL)a8 substituteUpperCaseForLowerCase:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;

  v9 = a8;
  v10 = a7;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:includeSecondaryStrings:](self, "exactKeyForString:keyplane:includeSecondaryStrings:", v15, v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17 && !a6)
  {
    -[ACTKeyboardLayoutUtils alternativeKeyForString:keyplane:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:](self, "alternativeKeyForString:keyplane:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:", v15, v16, v10, v9, a9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (NSMutableDictionary)keyOverrides
{
  return self->_keyOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyOverrides, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
