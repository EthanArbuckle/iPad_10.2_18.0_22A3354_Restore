@implementation AXElement(CACElement)

+ (id)wordsFromString:()CACElement
{
  __CFString *v3;
  void *v4;
  void *v5;
  CFLocaleRef v6;
  __CFStringTokenizer *v7;
  CFRange CurrentTokenRange;
  void *v9;
  CFRange v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFLocaleCreate(0, (CFLocaleIdentifier)objc_msgSend(v5, "bestLocaleIdentifier"));

  v11.length = -[__CFString length](v3, "length");
  v11.location = 0;
  v7 = CFStringTokenizerCreate(0, v3, v11, 0, 0);
  if (v6)
    CFRelease(v6);
  while (CFStringTokenizerAdvanceToNextToken(v7))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v7);
    if (CurrentTokenRange.location != -1)
    {
      -[__CFString substringWithRange:](v3, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

    }
  }
  if (v7)
    CFRelease(v7);

  return v4;
}

+ (uint64_t)_trimMutableString:()CACElement toMaxWordCount:
{
  __CFString *v5;
  void *v6;
  CFLocaleRef v7;
  CFStringTokenizerRef v8;
  unint64_t v9;
  CFRange CurrentTokenRange;
  uint64_t v11;
  CFRange v13;

  v5 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFLocaleCreate(0, (CFLocaleIdentifier)objc_msgSend(v6, "bestLocaleIdentifier"));

  v13.length = -[__CFString length](v5, "length");
  v13.location = 0;
  v8 = CFStringTokenizerCreate(0, v5, v13, 0, 0);
  if (v7)
    CFRelease(v7);
  if (!CFStringTokenizerAdvanceToNextToken(v8))
  {
LABEL_8:
    v11 = 0;
    if (!v8)
      goto LABEL_10;
LABEL_9:
    CFRelease(v8);
    goto LABEL_10;
  }
  v9 = 0;
  while (1)
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
    if (CurrentTokenRange.location != -1 && v9 >= a4)
      break;
    ++v9;
    if (!CFStringTokenizerAdvanceToNextToken(v8))
      goto LABEL_8;
  }
  -[__CFString deleteCharactersInRange:](v5, "deleteCharactersInRange:", CurrentTokenRange.location + CurrentTokenRange.length, -[__CFString length](v5, "length") - (CurrentTokenRange.location + CurrentTokenRange.length));
  v11 = 1;
  if (v8)
    goto LABEL_9;
LABEL_10:

  return v11;
}

+ (uint64_t)doesArrayOfWords:()CACElement containArrayOfArrayWords:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v25 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      v24 = v8;
      v27 = v7;
      do
      {
        v12 = v10;
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        v14 = objc_msgSend(v5, "count", v24);
        v15 = objc_msgSend(v13, "count");
        v16 = v14 - v15;
        if (v14 <= v15)
        {
          v10 = v12;
        }
        else
        {
          v17 = v15;
          v10 = v8;
          if (v15 >= 1)
          {
            v26 = v12;
            v18 = 0;
            v29 = v16 + 1;
            do
            {
              v19 = 0;
              while (1)
              {
                objc_msgSend(v5, "objectAtIndexedSubscript:", v18 + v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v20, "isEqualToString:", v21);

                if ((v22 & 1) == 0)
                  break;
                if (v17 == ++v19)
                {
                  v10 = v8;
                  goto LABEL_16;
                }
              }
              ++v18;
            }
            while (v18 != v29);
            v10 = v26;
LABEL_16:
            v9 = v25;
            v7 = v27;
          }
        }
        ++v8;
        ++v11;
      }
      while (v11 != v7);
      v8 = v24 + v7;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)recognitionStrings
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(a1, "userInputLabels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v42 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = a1;
        objc_msgSend(a1, "_combinationsFromTitle:isCarPlayConnected:", v7, objc_msgSend(v8, "carPlayConnected"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              if (objc_msgSend(v15, "length"))
                objc_msgSend(v2, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v12);
        }

        a1 = v9;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v4);
  }

  if (objc_msgSend(a1, "hasAnyTraits:", *MEMORY[0x24BDFF008]))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(a1, "uiElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithAXAttribute:", 5043);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_combinationsFromTitle:isCarPlayConnected:", v17, objc_msgSend(v18, "carPlayConnected"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * k);
          if (objc_msgSend(v24, "length")
            && (!objc_msgSend(v2, "count") || (objc_msgSend(v2, "containsObject:", v24) & 1) == 0))
          {
            objc_msgSend(v2, "addObject:", v24);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v21);
    }

  }
  if (!objc_msgSend(v2, "count") && objc_msgSend(a1, "eligibleForIconVision"))
  {
    objc_msgSend(a1, "uiElement");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayWithAXAttribute:", 2315);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDFE7B8], "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "classifyImages:withTimeout:", v26, 0.5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "length"))
      objc_msgSend(v2, "addObject:", v28);

  }
  if (objc_msgSend(a1, "hasAnyTraits:", *MEMORY[0x24BDFEFF8]))
  {
    objc_msgSend(a1, "uiElement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayWithAXAttribute:", 2239);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v30);

  }
  return v2;
}

- (id)_combinationsFromTitle:()CACElement isCarPlayConnected:
{
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;

  v5 = (void *)MEMORY[0x24BDBCEE0];
  v6 = a3;
  objc_msgSend(v5, "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_24F2ADCC8;
  if (v6)
    v8 = v6;
  v9 = v8;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bestLocaleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CACLocaleUtilities isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:", v11, CFSTR("en")))
  {
    v41 = v11;
    -[__CFString cac_stringByPreparingForAX](v9, "cac_stringByPreparingForAX");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v14;
    v15 = objc_msgSend(v14, "count");
    objc_msgSend(v7, "addObject:", v12);
    if (v15 >= 1)
    {
      v16 = 0;
      v17 = 3;
      if (a4)
        v17 = v15;
      v42 = v17;
      v43 = v15;
      while (1)
      {
        v45 = v16;
        v18 = (void *)MEMORY[0x24BDD16A8];
        v19 = v15 - v16;
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v16, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectsAtIndexes:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR(" "));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          if (!a4)
            break;
        }
        v24 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(v7, "addObject:", v24);

        if (v19 >= v42)
          v19 = v42;
        if ((v19 & 0x8000000000000000) == 0)
        {
          do
          {
            objc_msgSend(MEMORY[0x24BDFEA68], "_trimMutableString:toMaxWordCount:", v23, v19);
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v23, "rangeOfCharacterFromSet:", v25);

            if (v26 == 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
            {
              objc_msgSend(a1, "englishFunctionWords");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lowercaseString");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v28, "containsObject:", v29);

              if ((v30 & 1) != 0)
                continue;
            }
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v32);

          }
          while (v19-- > 0);
        }

        v16 = v45 + 1;
        v15 = v43;
        if (v45 + 1 == v43)
          goto LABEL_27;
      }

    }
LABEL_27:
    v34 = v12;
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(" "));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "containsObject:", v38))
    {
      objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v38);
      objc_msgSend(v39, "unionOrderedSet:", v7);

      v7 = v39;
    }
    v11 = v41;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 4;
    do
    {
      objc_msgSend(MEMORY[0x24BDFEA68], "_trimMutableString:toMaxWordCount:", v34, v35);
      v36 = (void *)objc_msgSend(v34, "copy");
      objc_msgSend(v7, "addObject:", v36);

      --v35;
    }
    while (v35);
  }

  return v7;
}

- (id)englishFunctionWords
{
  if (englishFunctionWords_onceToken != -1)
    dispatch_once(&englishFunctionWords_onceToken, &__block_literal_global_204_1);
  return (id)englishFunctionWords___wordSet;
}

- (uint64_t)isVisuallyEqual:()CACElement
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  NSObject *v20;
  CGRect v22;
  CGRect v23;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", v4))
  {
    objc_msgSend(a1, "userInputLabels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInputLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToArray:", v6) && (v5 || !v6) && (!v5 || v6))
    {
      objc_msgSend(a1, "visibleFrame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v4, "visibleFrame");
      v23.origin.x = v15;
      v23.origin.y = v16;
      v23.size.width = v17;
      v23.size.height = v18;
      v22.origin.x = v8;
      v22.origin.y = v10;
      v22.size.width = v12;
      v22.size.height = v14;
      if (CGRectEqualToRect(v22, v23))
      {
        v19 = 1;
LABEL_14:

        goto LABEL_15;
      }
      CACLogElementEvaluation();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[AXElement(CACElement) isVisuallyEqual:].cold.1(v20);

    }
    v19 = 0;
    goto LABEL_14;
  }
  v19 = 0;
LABEL_15:

  return v19;
}

- (uint64_t)cacPerformExcapeAction
{
  return objc_msgSend(a1, "performAction:", 2013);
}

- (void)isVisuallyEqual:()CACElement .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = 0;
  _os_log_debug_impl(&dword_229A40000, log, OS_LOG_TYPE_DEBUG, "Discovered new critera for object. VisibleFrame: %lu", (uint8_t *)&v1, 0xCu);
}

@end
