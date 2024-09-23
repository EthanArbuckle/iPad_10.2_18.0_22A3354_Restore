@implementation NSObject(UIAccessibilityTextAttributeRotor)

- (uint64_t)_accessibilityMisspelledRotor
{
  return objc_msgSend(a1, "_accessibilityTextStylingCustomRotor:", 13);
}

- (id)_accessibilityCommonStylingRotors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityTextStylingCustomRotor:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTextStylingCustomRotor:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTextStylingCustomRotor:", 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityMisspelledRotor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTextStylingCustomRotor:", UIAccessibilityCustomSystemRotorTypePlainText);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTextStylingCustomRotor:", UIAccessibilityCustomSystemRotorTypeColorChange);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTextStylingCustomRotor:", UIAccessibilityCustomSystemRotorTypeFontChange);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTextStylingCustomRotor:", UIAccessibilityCustomSystemRotorTypeStyleChange);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_accessibilityNextTextRangeUsingTextStyling:()UIAccessibilityTextAttributeRotor attributeMatch:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  unsigned int (**v32)(id, void *, void *);

  v5 = a3;
  v32 = a4;
  __UIAccessibilityCastAsProtocol();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "targetRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  v8 = objc_msgSend(v5, "searchDirection");
  objc_msgSend(v7, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8 != 1;
  objc_msgSend(v6, "textStylingAtPosition:inDirection:", v9, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = 0;
  v12 = 0;
  while (1)
  {
    if (v8 == 1)
      objc_msgSend(v7, "end");
    else
      objc_msgSend(v7, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textStylingAtPosition:inDirection:", v13, v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32[2](v32, v14, v31))
      break;
    if (v8 == 1 && !v11)
    {
      objc_msgSend(v7, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (v8 != 1 && !v12)
    {
      objc_msgSend(v7, "end");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      objc_msgSend(v7, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v6;
      v17 = v15;
      v18 = -1;
      goto LABEL_18;
    }
LABEL_12:
    if (v8 != 1)
      goto LABEL_17;
LABEL_13:
    objc_msgSend(v7, "end");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    v17 = v15;
    v18 = 1;
LABEL_18:
    objc_msgSend(v16, "positionFromPosition:offset:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v7;
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v19, v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "start");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21
      || (v22 = (void *)v21,
          objc_msgSend(v7, "end"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          !v23))
    {

      goto LABEL_25;
    }

    v10 = v20;
  }
  if (v11)
  {
    objc_msgSend(v10, "end");
    v24 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v24;
    goto LABEL_24;
  }
  if (!v12)
  {
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v10, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
  v20 = v10;
LABEL_25:

  if (v12 || !v11)
  {
    if (v12 && !v11)
    {
      objc_msgSend(v6, "beginningOfDocument");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v6, "endOfDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = 0;
  if (v11 && v12)
  {
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v11, v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  return v26;
}

- (void)_accessibilityUnderlineTextMatch
{
  return &__block_literal_global_16;
}

- (void)_accessibilityItalicTextMatch
{
  return &__block_literal_global_432;
}

- (void)_accessibilityBoldTextMatch
{
  return &__block_literal_global_434;
}

- (void)_accessibilityPlainTextMatch
{
  return &__block_literal_global_435;
}

- (void)_accessibilityStyleChangeMatch
{
  return &__block_literal_global_436;
}

- (void)_accessibilityFontChangeMatch
{
  return &__block_literal_global_437;
}

- (void)_accessibilityColorChangeMatch
{
  return &__block_literal_global_438;
}

- (id)_accessibilityAttributeMatcher:()UIAccessibilityTextAttributeRotor
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__NSObject_UIAccessibilityTextAttributeRotor___accessibilityAttributeMatcher___block_invoke;
  block[3] = &unk_1E3DFE9F8;
  block[4] = a1;
  if (_accessibilityAttributeMatcher__onceToken != -1)
    dispatch_once(&_accessibilityAttributeMatcher__onceToken, block);
  v4 = (void *)_accessibilityAttributeMatcher__Matchers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_accessibilityAttributedTextRetrieval
{
  return 0;
}

- (uint64_t)_accessibilityMisspelledWordIn:()UIAccessibilityTextAttributeRotor searchRange:next:
{
  id v10;
  void *v11;
  const __CFString *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  void *v28;
  id v29;

  v10 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(a1, "spellCheckingType") != 1)
  {
    objc_msgSend(a1, "_accessibilityTextChecker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_8;
    v12 = (const __CFString *)*MEMORY[0x1E0C9B280];
    v13 = 0.0;
    do
    {
      CFRunLoopRunInMode(v12, 0.2, 0);
      objc_msgSend(a1, "_accessibilityTextChecker");
      v14 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v14;
      if (v14)
        break;
      v13 = v13 + 0.2;
    }
    while (v13 < 1.5);
    if (v14)
    {
LABEL_8:
      objc_msgSend(v10, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentInputMode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if ((a6 & 1) != 0)
        {
LABEL_10:
          objc_msgSend(v17, "primaryLanguage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v11, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v15, a4, a5, a4, 0, v18);

LABEL_23:
          goto LABEL_24;
        }
      }
      else
      {
        objc_msgSend(v16, "currentSystemInputMode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((a6 & 1) != 0)
          goto LABEL_10;
      }
      v28 = v16;
      v29 = v10;
      v20 = a4 + a5;
      if (a4 >= a4 + a5)
      {
        v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v21 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          objc_msgSend(v17, "primaryLanguage", v28, v29);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v11, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v15, a4, a5, a4, 0, v22);
          v25 = v24;

          if (v23 == 0x7FFFFFFFFFFFFFFFLL)
            break;
          a4 = v23 + v25;
          v21 = v23;
          v26 = v20 >= v23 + v25;
          a5 = v20 - (v23 + v25);
        }
        while (a5 != 0 && v26);
      }
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        v19 = 0x7FFFFFFFLL;
      else
        v19 = v21;
      v16 = v28;
      v10 = v29;
      goto LABEL_23;
    }
  }
  v19 = 0x7FFFFFFFLL;
LABEL_24:

  return v19;
}

- (id)_accessibilityTextStylingCustomRotor:()UIAccessibilityTextAttributeRotor
{
  void *v5;
  void *v6;
  id v7;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  if (!objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4B3860))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIAccessibilityCustomSystemRotorType-%d"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0CEA288]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__NSObject_UIAccessibilityTextAttributeRotor___accessibilityTextStylingCustomRotor___block_invoke;
    v12[3] = &unk_1E3DFFBD0;
    v12[4] = a1;
    v12[5] = a3;
    v10 = (void *)objc_msgSend(v9, "initWithSystemType:itemSearchBlock:", a3, v12);
    objc_msgSend(v10, "setVisibleInTouchRotor:", a3 == 13);
    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v10, v5);
    v7 = v10;
  }
  v11 = v7;

  return v11;
}

@end
