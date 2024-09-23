@implementation WBSPasswordPatternMatcher

- (id)patternMatchesForPassword:(id)a3 withWordListCollection:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  -[WBSPasswordPatternMatcher _wordListMatchesForPassword:withWordListCollection:](self, "_wordListMatchesForPassword:withWordListCollection:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionSet:", v10);
  -[WBSPasswordPatternMatcher _sequencePatternMatchesForPassword:](self, "_sequencePatternMatchesForPassword:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v11);

  -[WBSPasswordPatternMatcher _keyboardLayoutPatternMatchesForPassword:](self, "_keyboardLayoutPatternMatchesForPassword:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v12);

  -[WBSPasswordPatternMatcher _repetitionMatchesForPassword:withMatches:](self, "_repetitionMatchesForPassword:withMatches:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionSet:", v13);
  return v9;
}

- (id)patternMatchesForPasscode:(id)a3 withWordListCollection:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  -[WBSPasswordPatternMatcher _wordListMatchesForPasscode:withWordListCollection:](self, "_wordListMatchesForPasscode:withWordListCollection:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionSet:", v10);
  -[WBSPasswordPatternMatcher _sequenceMatchesForPasscode:](self, "_sequenceMatchesForPasscode:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v11);

  -[WBSPasswordPatternMatcher _dateMatchesForPasscode:](self, "_dateMatchesForPasscode:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v12);

  -[WBSPasswordPatternMatcher _repetitionMatchesForPasscode:](self, "_repetitionMatchesForPasscode:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionSet:", v13);
  return v9;
}

- (id)_keyboardsByIdentifier
{
  if (_keyboardsByIdentifier_onceToken != -1)
    dispatch_once(&_keyboardsByIdentifier_onceToken, &__block_literal_global_42);
  return (id)_keyboardsByIdentifier_keyboardsByIdentifier;
}

void __51__WBSPasswordPatternMatcher__keyboardsByIdentifier__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariCoreBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("WBSPasswordKeyboardLayouts"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_keyboardsByIdentifier_keyboardsByIdentifier;
  _keyboardsByIdentifier_keyboardsByIdentifier = v2;

  if (!_keyboardsByIdentifier_keyboardsByIdentifier)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __51__WBSPasswordPatternMatcher__keyboardsByIdentifier__block_invoke_cold_1(v4);
  }

}

- (unint64_t)_directionFromHexCoordinate:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "integerValue");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "integerValue");
  if (_directionFromHexCoordinate_to__onceToken != -1)
    dispatch_once(&_directionFromHexCoordinate_to__onceToken, &__block_literal_global_10);
  v15 = v8 - v10;
  v16 = (void *)_directionFromHexCoordinate_to__directions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12 - v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v16, "indexOfObject:", v19);

  return v20;
}

void __60__WBSPasswordPatternMatcher__directionFromHexCoordinate_to___block_invoke()
{
  void *v0;

  v0 = (void *)_directionFromHexCoordinate_to__directions;
  _directionFromHexCoordinate_to__directions = (uint64_t)&unk_1E64D13D0;

}

- (id)_passwordWithoutShiftedCharacters:(id)a3 shiftMap:(id)a4 outShiftedCharacterIndexSet:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t i;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "length");
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(v7, "substringWithRange:", i, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v11, "appendString:", v14);
        objc_msgSend(v10, "addIndex:", i);
      }
      else
      {
        objc_msgSend(v11, "appendString:", v13);
      }

    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v11;
}

- (id)_keyboardLayoutPatternMatchesForPassword:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 > 2)
  {
    v7 = v5;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[WBSPasswordPatternMatcher _keyboardsByIdentifier](self, "_keyboardsByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__WBSPasswordPatternMatcher__keyboardLayoutPatternMatchesForPassword___block_invoke;
    v13[3] = &unk_1E649E130;
    v13[4] = self;
    v14 = v4;
    v16 = v7;
    v10 = v8;
    v15 = v10;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);

    v11 = v15;
    v6 = v10;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __70__WBSPasswordPatternMatcher__keyboardLayoutPatternMatchesForPassword___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;

  v27 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ShiftMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v28 = 0;
  objc_msgSend(v8, "_passwordWithoutShiftedCharacters:shiftMap:outShiftedCharacterIndexSet:", v9, v7, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v28;
  if (*(_QWORD *)(a1 + 56) != 2)
  {
    v24 = v7;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = v12;
      objc_msgSend(v10, "substringWithRange:", v13, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *(_QWORD *)(a1 + 56);
      v17 = v13 + 1;
      if (v12 && v17 < v16)
      {
        v18 = 1;
        do
        {
          v19 = v11;
          v11 = v12;

          objc_msgSend(v10, "substringWithRange:", v13 + v18, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v20);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12
            || objc_msgSend(*(id *)(a1 + 32), "_directionFromHexCoordinate:to:", v11, v12) == 0x7FFFFFFFFFFFFFFFLL)
          {
            break;
          }
          if ((unint64_t)++v18 >= 3)
          {
            v21 = objc_msgSend(v25, "countOfIndexesInRange:", v13, v18);
            v22 = *(void **)(a1 + 48);
            objc_msgSend(*(id *)(a1 + 32), "_keyboardMatchWithPassword:range:shiftedCharacterCount:keyboardIdentifier:keyboard:", *(_QWORD *)(a1 + 40), v13, v18, v21, v27, v26);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v23);

          }
        }
        while ((unint64_t)(v13 + v18) < *(_QWORD *)(a1 + 56));
        v16 = *(_QWORD *)(a1 + 56);
      }
      ++v13;
    }
    while (v17 < v16 - 2);

    v7 = v24;
  }

}

- (id)_keyboardMatchWithPassword:(id)a3 range:(_NSRange)a4 shiftedCharacterCount:(unint64_t)a5 keyboardIdentifier:(id)a6 keyboard:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  WBSPasswordPatternMatch *v22;
  const __CFString *v24;
  _QWORD v25[2];

  length = a4.length;
  location = a4.location;
  v25[1] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  objc_msgSend(a3, "substringWithRange:", location, length);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Layout"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (double)(unint64_t)objc_msgSend(v15, "count");
  v17 = pow(6.0, (double)(unint64_t)(objc_msgSend(v14, "length") - 1)) * v16;
  v24 = CFSTR("KeyboardLayout");
  v25[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (a5)
  {
    v20 = nChooseK((double)length, (double)a5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("CaseVariations"));

    v17 = v17 * v20;
  }
  v22 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 1, v14, location, length, v19, v17);

  return v22;
}

- (id)_sequencePatternMatchesForPassword:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 > 2)
  {
    v7 = v5;
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v4, "characterAtIndex:", v8 + 1);
      v10 = objc_msgSend(v4, "characterAtIndex:", v8);
      if (v9 != v10)
      {
        v11 = v8 + 2;
        if (v8 + 2 < v7)
        {
          v12 = v9 - (unint64_t)v10;
          do
          {
            v13 = objc_msgSend(v4, "characterAtIndex:", v11);
            v14 = v11 - 1;
            if (v13 - objc_msgSend(v4, "characterAtIndex:", v14) != v12)
              break;
            -[WBSPasswordPatternMatcher _sequencePatternMatchWithPassword:startIndex:endIndex:delta:](self, "_sequencePatternMatchWithPassword:startIndex:endIndex:delta:", v4, v8, v14 + 1, v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v15);

            v11 = v14 + 2;
          }
          while (v11 != v7);
        }
      }
    }
    while (v8++ != v7 - 3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_sequencePatternMatchWithPassword:(id)a3 startIndex:(unint64_t)a4 endIndex:(unint64_t)a5 delta:(int64_t)a6
{
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  double v14;
  void *v15;
  int v16;
  int64_t v17;
  WBSPasswordPatternMatch *v18;

  v9 = a5 - a4 + 1;
  objc_msgSend(a3, "substringWithRange:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "characterAtIndex:", 0);
  -[WBSPasswordPatternMatcher _obviousSequenceStartCharacterSet](self, "_obviousSequenceStartCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "characterIsMember:", v11);

  v14 = 4.0;
  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "safari_asciiDigitCharacterSet", 4.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "characterIsMember:", v11);

    v14 = 26.0;
    if (v16)
      v14 = 10.0;
  }
  if (a6 >= 0)
    v17 = a6;
  else
    v17 = -a6;
  v18 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 2, v10, a4, v9, 0, v14 * (double)v17 * (double)v9);

  return v18;
}

- (id)_obviousSequenceStartCharacterSet
{
  if (_obviousSequenceStartCharacterSet_onceToken != -1)
    dispatch_once(&_obviousSequenceStartCharacterSet_onceToken, &__block_literal_global_36_0);
  return (id)_obviousSequenceStartCharacterSet_obviousSequenceStartCharacterSet;
}

void __62__WBSPasswordPatternMatcher__obviousSequenceStartCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("aAzZ019"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_obviousSequenceStartCharacterSet_obviousSequenceStartCharacterSet;
  _obviousSequenceStartCharacterSet_obviousSequenceStartCharacterSet = v0;

}

- (id)_wordListMatchesForPassword:(id)a3 withWordListCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t i;
  int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v31;
  id v32;
  void *v33;
  id v34;
  WBSPasswordPatternMatcher *v35;
  void *v36;
  id obj;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[WBSPasswordPatternMatcher _commonlySubstitutedCharacterSet](self, "_commonlySubstitutedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (objc_msgSend(v6, "length"))
  {
    v11 = 0;
    do
    {
      if (objc_msgSend(v7, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11)))
        objc_msgSend(v10, "addIndex:", v11);
      ++v11;
    }
    while (v11 < objc_msgSend(v6, "length"));
  }
  v31 = v10;
  v33 = v6;
  v35 = self;
  v36 = v7;
  -[WBSPasswordPatternMatcher _passwordVariationsWithoutCommonCharacterSubstitutions:](self, "_passwordVariationsWithoutCommonCharacterSubstitutions:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
        v19 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        if (v8)
        {
          for (i = 0; i != v8; ++i)
          {
            v21 = objc_msgSend(v18, "characterAtIndex:", i);
            if (v21 != objc_msgSend(v9, "characterAtIndex:", i))
              objc_msgSend(v19, "addIndex:", i);
          }
        }
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v18);

        ++v17;
      }
      while (v17 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v15);
  }

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __80__WBSPasswordPatternMatcher__wordListMatchesForPassword_withWordListCollection___block_invoke;
  v38[3] = &unk_1E649E1A0;
  v39 = obj;
  v40 = v34;
  v41 = v13;
  v42 = v33;
  v43 = v31;
  v22 = v32;
  v44 = v22;
  v23 = v31;
  v24 = v33;
  v25 = v13;
  v26 = v34;
  v27 = obj;
  -[WBSPasswordPatternMatcher _enumerateGraphemeClusterSubrangesOfString:withMinimumLength:usingBlock:](v35, "_enumerateGraphemeClusterSubrangesOfString:withMinimumLength:usingBlock:", v24, 3, v38);
  v28 = v44;
  v29 = v22;

  return v29;
}

void __80__WBSPasswordPatternMatcher__wordListMatchesForPassword_withWordListCollection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id obj;
  _QWORD v15[4];
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "substringWithRange:", a2, a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __80__WBSPasswordPatternMatcher__wordListMatchesForPassword_withWordListCollection___block_invoke_2;
        v15[3] = &unk_1E649E178;
        v12 = *(void **)(a1 + 40);
        v16 = *(id *)(a1 + 48);
        v17 = v10;
        v22 = a2;
        v23 = a3;
        v18 = *(id *)(a1 + 56);
        v19 = *(id *)(a1 + 64);
        v20 = v11;
        v21 = *(id *)(a1 + 72);
        v13 = v11;
        objc_msgSend(v12, "enumerateEntriesForString:withBlock:", v13, v15);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

}

void __80__WBSPasswordPatternMatcher__wordListMatchesForPassword_withWordListCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  WBSPasswordPatternMatch *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (double)(unint64_t)objc_msgSend(v3, "guessesRequired");
  v18[0] = CFSTR("WordListGuessesRequired");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v18[1] = CFSTR("WordListIdentifier");
  objc_msgSend(v3, "wordListIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  LODWORD(v5) = objc_msgSend(v3, "isSensitive");
  if ((_DWORD)v5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsSensitive"));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countOfIndexesInRange:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v9, "indexGreaterThanOrEqualToIndex:", *(_QWORD *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("FirstSubstitutedCharacter"));

    objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v12, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("FirstSubstitutionCharacter"));

    v15 = nChooseK((double)(unint64_t)objc_msgSend(*(id *)(a1 + 56), "countOfIndexesInRange:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88)), (double)v11);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("SubstitutionVariations"));

    v4 = v15 * v4;
  }
  v17 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v8, v4);
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v17);

}

- (id)_commonlySubstitutedCharactersMap
{
  if (_commonlySubstitutedCharactersMap_onceToken != -1)
    dispatch_once(&_commonlySubstitutedCharactersMap_onceToken, &__block_literal_global_42);
  return (id)_commonlySubstitutedCharactersMap_substitutionMap;
}

void __62__WBSPasswordPatternMatcher__commonlySubstitutedCharactersMap__block_invoke()
{
  void *v0;

  v0 = (void *)_commonlySubstitutedCharactersMap_substitutionMap;
  _commonlySubstitutedCharactersMap_substitutionMap = (uint64_t)&unk_1E64D10A8;

}

- (id)_commonlySubstitutedCharacterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSPasswordPatternMatcher__commonlySubstitutedCharacterSet__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  if (_commonlySubstitutedCharacterSet_onceToken != -1)
    dispatch_once(&_commonlySubstitutedCharacterSet_onceToken, block);
  return (id)_commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet;
}

void __61__WBSPasswordPatternMatcher__commonlySubstitutedCharacterSet__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_commonlySubstitutedCharactersMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v2 = (void *)_commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet;
  _commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet = (uint64_t)v1;

  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_151);
}

void __61__WBSPasswordPatternMatcher__commonlySubstitutedCharacterSet__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)_commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet, "addCharactersInString:", a2);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)_commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet, "addCharactersInString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_passwordVariationsWithoutCommonCharacterSubstitutions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSPasswordPatternMatcher _commonlySubstitutedCharactersMap](self, "_commonlySubstitutedCharactersMap");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", &stru_1E64A2498, 0);
  v25 = v5;
  if (v5)
  {
    v7 = 0;
    v24 = v4;
    while (1)
    {
      v8 = v6;
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = v7;
      objc_msgSend(v4, "substringWithRange:", v7, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v36;
        obj = v9;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v36 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v15 = v30;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v32;
              do
              {
                v19 = 0;
                do
                {
                  if (*(_QWORD *)v32 != v18)
                    objc_enumerationMutation(v15);
                  objc_msgSend(v14, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v19));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v20);

                  ++v19;
                }
                while (v17 != v19);
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v17);
            }

            if (!objc_msgSend(v15, "count"))
            {
              objc_msgSend(v14, "stringByAppendingString:", v28);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v21);

            }
            ++v13;
          }
          while (v13 != v11);
          v9 = obj;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v11);
      }

      if ((unint64_t)objc_msgSend(v6, "count") > 0xFF)
        break;

      v7 = v27 + 1;
      v4 = v24;
      if (v27 + 1 == v25)
        goto LABEL_21;
    }
    v4 = v24;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_21:
    objc_msgSend(v6, "addObject:", v4);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
  }

  return v22;
}

- (void)_enumerateGraphemeClusterSubrangesOfString:(id)a3 withMinimumLength:(unint64_t)a4 usingBlock:(id)a5
{
  void (**v7)(id, unint64_t, unint64_t);
  uint64_t v8;
  unint64_t v9;
  unint64_t i;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v7 = (void (**)(id, unint64_t, unint64_t))a5;
  v8 = objc_msgSend(v16, "length");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i < v9; ++i)
    {
      v11 = objc_msgSend(v16, "rangeOfComposedCharacterSequenceAtIndex:", i);
      if (v11 == i)
      {
        if (v9 - i >= a4)
        {
          v13 = a4;
          do
          {
            v14 = objc_msgSend(v16, "rangeOfComposedCharacterSequenceAtIndex:", v13 + i - 1);
            if (v14 + v15 == v13 + i)
              v7[2](v7, i, v13);
            else
              v13 = v13 + v15 - 2;
            ++v13;
          }
          while (v13 <= v9 - i);
        }
      }
      else
      {
        i = v12 + v11 - 1;
      }
    }
  }

}

- (id)_repetitionMatchesForPassword:(id)a3 withMatches:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  char v16;
  id v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WBSPasswordPatternMatch *v26;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = a4;
  v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_msgSend(v5, "length");
  v29 = v6 - 1;
  if (v6 != 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = v6;
    v31 = v6;
    do
    {
      v30 = v9;
      v10 = v9 >> 1;
      if (v9 >> 1 <= 1)
        v10 = 1;
      v35 = v10;
      if ((unint64_t)(v7 - v8) >= 2)
      {
        v11 = 1;
        do
        {
          objc_msgSend(v5, "substringWithRange:", v8, v11, v29);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v8 + v11;
          if (v8 + v11 <= (unint64_t)(v7 - v11))
          {
            v14 = 1;
            do
            {
              objc_msgSend(v5, "substringWithRange:", v13, v11);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v12);

              if ((v16 & 1) == 0)
                break;
              ++v14;
              v13 += v11;
            }
            while (v13 <= v7 - v11);
            if (v14 >= 2)
            {
              -[WBSPasswordPatternMatcher _patternWithFewestGuessesRequiredWithRange:patternMatches:](self, "_patternWithFewestGuessesRequiredWithRange:patternMatches:", v8, v11, v33);
              v17 = (id)objc_claimAutoreleasedReturnValue();
              if (!v17)
                v17 = -[WBSPasswordPatternMatch initExhaustiveSearchPatternWithMatchedSubstring:range:]([WBSPasswordPatternMatch alloc], "initExhaustiveSearchPatternWithMatchedSubstring:range:", v12, v8, v11);
              objc_msgSend(v17, "guessesRequired");
              v19 = v18;
              v20 = v18 * (double)v14;
              v21 = v14 * v11;
              objc_msgSend(v5, "substringWithRange:", v8, v14 * v11);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v36[0] = CFSTR("BaseGuesses");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v36[1] = CFSTR("RepetitionCount");
              v37[0] = v23;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v37[1] = v24;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 4, v22, v8, v21, v25, v20);
              objc_msgSend(v34, "addObject:", v26);

              v7 = v31;
            }
          }

        }
        while (v11++ != v35);
      }
      ++v8;
      v9 = v30 - 1;
    }
    while (v8 != v29);
  }

  return v34;
}

- (id)_patternWithFewestGuessesRequiredWithRange:(_NSRange)a3 patternMatches:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  double v15;
  double v16;
  double v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  length = a3.length;
  location = a3.location;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (location == objc_msgSend(v12, "range") && length == v13)
        {
          if (!v9 || (objc_msgSend(v9, "guessesRequired"), v16 = v15, objc_msgSend(v12, "guessesRequired"), v16 > v17))
          {
            v18 = v12;

            v9 = v18;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_characterRepetitionPatternForPasscode:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend(v3, "length");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v3, "substringWithRange:", i, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v9);
      }
      objc_msgSend(v5, "addObject:", v10);

    }
  }

  return v5;
}

- (id)_commonPasscodeCharacterRepetitionPatterns
{
  if (_commonPasscodeCharacterRepetitionPatterns_onceToken != -1)
    dispatch_once(&_commonPasscodeCharacterRepetitionPatterns_onceToken, &__block_literal_global_155);
  return (id)_commonPasscodeCharacterRepetitionPatterns_patterns;
}

void __71__WBSPasswordPatternMatcher__commonPasscodeCharacterRepetitionPatterns__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E64D15C8, &unk_1E64D15E0, &unk_1E64D15F8, &unk_1E64D1610, &unk_1E64D1628, &unk_1E64D1640, &unk_1E64D1658, &unk_1E64D1670, &unk_1E64D1688, &unk_1E64D16A0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_commonPasscodeCharacterRepetitionPatterns_patterns;
  _commonPasscodeCharacterRepetitionPatterns_patterns = v0;

}

- (id)_repetitionMatchesForPasscode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  WBSPasswordPatternMatch *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[WBSPasswordPatternMatcher _characterRepetitionPatternForPasscode:](self, "_characterRepetitionPatternForPasscode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordPatternMatcher _commonPasscodeCharacterRepetitionPatterns](self, "_commonPasscodeCharacterRepetitionPatterns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 4, v4, 0, objc_msgSend(v4, "length"), 0, 360.0);
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

- (id)_sequenceMatchesForPasscode:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  WBSPasswordPatternMatch *v12;
  id v13;
  id v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_msgSend(v3, "length");
  v6 = objc_msgSend(v3, "characterAtIndex:", 0);
  v7 = objc_msgSend(v3, "characterAtIndex:", 1);
  v8 = v7 - v6;
  if (v8 != -1 && v8 != 1)
  {
LABEL_11:
    v14 = v4;
    goto LABEL_12;
  }
  if (v5 >= 3)
  {
    v10 = 2;
    do
    {
      v11 = v7;
      v7 = objc_msgSend(v3, "characterAtIndex:", v10);
      if (v7 - v11 != v8)
        goto LABEL_11;
    }
    while (v5 != ++v10);
  }
  v12 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 2, v3, 0, objc_msgSend(v3, "length"), 0, 20.0);
  objc_msgSend(v4, "addObject:", v12);
  v13 = v4;

LABEL_12:
  return v4;
}

- (id)_dateMatchesForPasscode:(id)a3
{
  id v3;
  id v4;
  id v5;
  WBSPasswordPatternMatch *v6;
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v3, "length") == 4
    && (unint64_t)(objc_msgSend(v3, "integerValue") - 2026) > 0xFFFFFFFFFFFFFFB4)
  {
    v6 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 5, v3, 0, 4, 0, 75.0);
    objc_msgSend(v4, "addObject:", v6);
    v7 = v4;

  }
  else
  {
    v5 = v4;
  }

  return v4;
}

- (id)_wordListMatchesForPasscode:(id)a3 withWordListCollection:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__WBSPasswordPatternMatcher__wordListMatchesForPasscode_withWordListCollection___block_invoke;
  v14[3] = &unk_1E649E248;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateEntriesForString:withBlock:", v10, v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __80__WBSPasswordPatternMatcher__wordListMatchesForPasscode_withWordListCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  WBSPasswordPatternMatch *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  WBSPasswordPatternMatch *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("WordListIdentifier");
  v3 = a2;
  objc_msgSend(v3, "wordListIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [WBSPasswordPatternMatch alloc];
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v7, "length");
  v9 = objc_msgSend(v3, "guessesRequired");

  v10 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:](v6, "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 3, v7, 0, v8, v5, (double)v9);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

void __51__WBSPasswordPatternMatcher__keyboardsByIdentifier__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B2621000, log, OS_LOG_TYPE_FAULT, "Failed to load keyboard layout resource.", v1, 2u);
}

@end
