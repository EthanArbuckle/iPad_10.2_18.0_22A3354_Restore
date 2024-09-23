@implementation UIKeyboardSupplementaryControlKeyTransformation

+ (double)_totalKeyPaddingForOrientation:(int64_t)a3
{
  double result;

  result = 10.0;
  if ((unint64_t)(a3 - 3) < 2)
    return 14.0;
  return result;
}

+ (double)_keyplanePaddingForOrientation:(int64_t)a3
{
  double v3;

  objc_msgSend(a1, "_totalKeyPaddingForOrientation:", a3);
  return v3 * 0.5;
}

+ (double)_keyplanePaddingForOrientation:(int64_t)a3 row:(unint64_t)a4
{
  double result;

  if (a4 == 5)
    return 1.0;
  objc_msgSend(a1, "_keyplanePaddingForOrientation:", a3);
  return result;
}

+ (unint64_t)_numberOfKeysInRow:(id)a3 firstKey:(id *)a4 lastKey:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "frame");
        if (!CGRectIsEmpty(v24))
        {
          if (!v11)
            v11 = v15;
          ++v12;
          v16 = v15;

          v10 = v16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
    if (a4)
      goto LABEL_13;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    if (a4)
LABEL_13:
      *a4 = objc_retainAutorelease(v11);
  }
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v12;
}

+ (double)_derivedLeadingControlKeyWidthForRow:(unint64_t)a3 keysForRow:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  _BOOL4 v18;
  double v19;
  double v20;
  id v22;
  id v23;

  v8 = a4;
  v9 = a5;
  v22 = 0;
  v23 = 0;
  v10 = objc_msgSend(a1, "_numberOfKeysInRow:firstKey:lastKey:", v8, &v23, &v22);
  v11 = v23;
  v12 = v22;
  objc_msgSend(v9, "screenTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "orientation");

  v15 = v14 - 3;
  switch(a3)
  {
    case 0uLL:
      v16 = dbl_186681670[v15 < 2];
      goto LABEL_10;
    case 1uLL:
      v16 = 87.0;
      if (v15 < 2)
        v16 = 136.0;
      v17 = 10;
      break;
    case 2uLL:
      v18 = v15 < 2;
      if (objc_msgSend(v11, "interactionType") == 2)
        ++v10;
      v16 = dbl_186681660[v18];
LABEL_10:
      v17 = 11;
      break;
    case 3uLL:
      v17 = 0;
      v16 = dbl_186681650[v15 < 2];
      break;
    default:
      v17 = 0;
      v16 = 0.0;
      break;
  }
  objc_msgSend(a1, "_scaledDerivedLeadingControlKeyWidth:forKeysForRow:keyCount:numberOfKeysInSpecification:context:", v8, v10, v17, v9, v16);
  v20 = v19;

  return v20;
}

+ (double)_derivedFiveRowControlKeyWidthForRow:(unint64_t)a3 keysForRow:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v21;
  id v22;

  v21 = 0;
  v22 = 0;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(a1, "_numberOfKeysInRow:firstKey:lastKey:", v9, &v22, &v21);
  v11 = v22;
  objc_msgSend(v8, "screenTraits", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "orientation");

  v14 = v13 - 3;
  if (a3 == 2)
  {
    v15 = dbl_186681680[v14 < 2];
    v17 = 10;
  }
  else if (a3 == 1)
  {
    v15 = 84.0;
    if (v14 < 2)
      v15 = 101.0;
    v17 = 11;
  }
  else
  {
    v15 = 0.0;
    v16 = 42.0;
    if (v14 < 2)
      v16 = 52.0;
    if (a3)
      v17 = 0;
    else
      v17 = 11;
    if (!a3)
      v15 = v16;
  }
  objc_msgSend(a1, "_scaledDerivedLeadingControlKeyWidth:forKeysForRow:keyCount:numberOfKeysInSpecification:context:", v9, v10, v17, v8, v15);
  v19 = v18;

  return v19;
}

+ (double)_scaledDerivedLeadingControlKeyWidth:(double)a3 forKeysForRow:(id)a4 keyCount:(int64_t)a5 numberOfKeysInSpecification:(int64_t)a6 context:(id)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  objc_msgSend(v13, "screenTraits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "orientation");

  objc_msgSend(a1, "_totalKeyPaddingForOrientation:", v15);
  v17 = v16;
  if (a6 && a5 > a6)
  {
    a3 = 10.0 / (dbl_186681690[(unint64_t)(v15 - 3) < 2] * (double)(a5 - a6) + 10.0) * a3;
    v35 = 0u;
    v36 = 0u;
    v18 = v16 + a3;
    v33 = 0u;
    v34 = 0u;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v24, "interactionType", (_QWORD)v33) == 2)
          {
            objc_msgSend(v24, "frame");
            v18 = v18 + CGRectGetWidth(v39);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v21);
    }

    objc_msgSend(v13, "screenTraits");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "keyboardWidth");
    v27 = v26;

    if (v18 > v27)
    {
      objc_msgSend(v13, "screenTraits");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "keyboardWidth");
      a3 = v29 - (v18 - a3) - v17;

    }
  }
  objc_msgSend(a1, "layoutScaleFactorForContext:", v13, (_QWORD)v33);
  v31 = v30;

  return (v17 + a3) * v31;
}

+ (double)_derivedTrailingControlKeyWidthForRow:(unint64_t)a3 orientation:(int64_t)a4
{
  double v6;
  double v7;

  objc_msgSend(a1, "_totalKeyPaddingForOrientation:", a4);
  v7 = dbl_1866816A0[(unint64_t)(a4 - 3) < 2];
  if (a3 != 3)
    v7 = -1.0;
  return v7 + v6;
}

+ (id)_supplementaryControlKeySetForOrientation:(int64_t)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v33;

  v5 = a4;
  if (!__supplementaryControlKeysetCache)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)__supplementaryControlKeysetCache;
    __supplementaryControlKeysetCache = (uint64_t)v6;

  }
  UIKeyboardGetCurrentInputMode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  KBStarLayoutString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferencesActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "inputModeSupportsCrescendo:", v9);

  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "currentKeyplaneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@-%ld"), v9, v15, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)__supplementaryControlKeysetCache, "objectForKey:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_6;
    v18 = CFSTR("Portrait");
    objc_msgSend(v5, "screenTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "orientation") - 3;

    if (v20 <= 1)
    {
      v21 = CFSTR("Landscape");

      v18 = v21;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wildcat-%@Fudge-%@"), v18, v9);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screenTraits");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardLayoutStar keyboardWithName:screenTraits:](UIKeyboardLayoutStar, "keyboardWithName:screenTraits:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "currentKeyplaneName");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString rangeOfString:options:](v25, "rangeOfString:options:", CFSTR("alternate"), 1);
    if (v26)
    {

      v25 = CFSTR("Alternate");
    }
    objc_msgSend(v24, "subtreeWithName:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v22;
    if (v27
      || (v25,
          v25 = CFSTR("Small-Letters"),
          objc_msgSend(v24, "subtreeWithName:", CFSTR("Small-Letters")),
          (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (v25 = CFSTR("Letters"),
          objc_msgSend(v24, "subtreeWithName:", CFSTR("Letters")),
          (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = v27;
      objc_msgSend(v27, "subtreeWithName:", CFSTR("Wildcat-Fudge-Control-Keys-Keylayout"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "keySet");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend((id)__supplementaryControlKeysetCache, "setObject:forKey:", v17, v16);
        v31 = 0;
      }
      else
      {
        v17 = 0;
        v31 = 1;
      }

    }
    else
    {
      v17 = 0;
      v31 = 1;
    }

    if (!v31)
    {
LABEL_6:
      v17 = v17;
      v13 = v17;
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (id)_supplementaryControlKeyWithName:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v7, "screenTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_supplementaryControlKeySetForOrientation:context:", objc_msgSend(v8, "orientation"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subtrees");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v26)
  {
    v11 = *(_QWORD *)v32;
    v24 = *(_QWORD *)v32;
    v25 = v7;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v10);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v13, "subtrees");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v28 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_msgSend(v19, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", v6);

              if ((v21 & 1) != 0)
              {
                v22 = v19;

                v7 = v25;
                goto LABEL_19;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v16)
              continue;
            break;
          }
        }

        v11 = v24;
      }
      v22 = 0;
      v7 = v25;
      v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v26);
  }
  else
  {
    v22 = 0;
  }
LABEL_19:

  return v22;
}

+ (id)_supplementaryScriptSwitchKeyWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_supplementaryControlKeyWithName:context:", CFSTR("Roman-to-Non-Roman-Switch-Key"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "_supplementaryControlKeyWithName:context:", CFSTR("Non-Roman-to-Roman-Switch-Key"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_cachedUndoOrRedoKeyForKeyplane:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstCachedKeyWithName:", CFSTR("Undo-Key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstCachedKeyWithName:", CFSTR("Redo-Key"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v4;
  else
    v7 = (void *)v5;
  v8 = v7;
  if (!v8)
  {
    objc_msgSend(v3, "cachedKeysByKeyName:", CFSTR("Modify-For-Writeboard-Key"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      v19 = v6;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("Undo-Key")))
          {

LABEL_17:
            v8 = v14;
            v6 = v19;
            goto LABEL_18;
          }
          objc_msgSend(v14, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Redo-Key"));

          if (v17)
            goto LABEL_17;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v8 = 0;
        v6 = v19;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v8 = 0;
    }
LABEL_18:

  }
  return v8;
}

+ (id)_supplementaryShiftKeysWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "screenTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(a1, "_supplementaryControlKeySetForOrientation:context:", objc_msgSend(v6, "orientation"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v13, "subtrees");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v23 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              if (objc_msgSend(v19, "interactionType") == 14)
                objc_msgSend(v5, "addObject:", v19);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v16);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  return v5;
}

+ (id)transformationIdentifier
{
  return CFSTR("supp_12.SU");
}

+ (id)cachedControlKeySetsForTransformationContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "screenTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_supplementaryControlKeySetForOrientation:context:", objc_msgSend(v5, "orientation"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subtrees");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (double)_keyPitchForKeyplane:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v5 = 0.0;
  if ((unint64_t)objc_msgSend(v4, "numberOfRows") <= 4)
  {
    if ((unint64_t)objc_msgSend(v4, "numberOfRows") < 2)
    {
      v16 = 0;
      v15 = 0;
      v14 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        objc_msgSend(v4, "keysForDisplayRowAtIndex:", v6 + 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v21 = 0;
        v8 = objc_msgSend(a1, "_numberOfKeysInRow:firstKey:lastKey:", v7, &v21, &v20);
        v9 = v21;
        v10 = v20;
        v11 = v8 - (objc_msgSend(v9, "interactionType") == 14);
        LODWORD(v8) = objc_msgSend(v10, "interactionType");

        *(&v22 + v6) = v11 - ((_DWORD)v8 == 14);
        v12 = objc_msgSend(v4, "numberOfRows");
        v13 = v6 + 2;
        ++v6;
      }
      while (v13 < v12);
      v14 = v22;
      v15 = v23;
      v16 = v24;
    }
    if (v14 > 0xB || v15 > 0xB || (v5 = 18.0, v16 >= 0xB))
    {
      if (v14 > 0xC || v15 > 0xC || v16 >= 0xC)
      {
        if (v16 >= 0xC || v15 >= 0xD || v14 >= 0xE)
          v5 = 0.0;
        else
          v5 = 16.0;
      }
      else
      {
        v5 = 16.8;
      }
    }
  }

  return v5;
}

+ (void)adjustHorizontalPaddingForKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Width;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  void *v35;
  void *v36;
  double v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  double v57;
  void *v58;
  unint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "screenTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "orientation");

  objc_msgSend(v7, "screenTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  objc_msgSend(v7, "screenTraits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyboardWidth");
  v16 = v15;

  objc_msgSend(a1, "_totalKeyPaddingForOrientation:", v9);
  v18 = v17;
  objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 0, 0, v7);
  v20 = v19;
  objc_msgSend(v6, "frame");
  Width = CGRectGetWidth(v71);
  v22 = 0.0;
  v59 = v9 - 5;
  if ((unint64_t)(v9 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    objc_msgSend(a1, "_keyPitchForKeyplane:", v6);
    v22 = v23;
  }
  objc_msgSend(a1, "layoutScaleFactorForContext:", v7, v7);
  v25 = v24;
  v27 = v26;
  if ((unint64_t)objc_msgSend(v6, "numberOfRows") >= 2)
  {
    v28 = v18 + v20 + Width;
    v30 = v22 <= 0.0 || v59 < 0xFFFFFFFFFFFFFFFELL;
    v31 = *MEMORY[0x1E0C9D538];
    v32 = v22 * 5.2571428 * v25;
    v33 = v16 / v28;
    v34 = 1;
    do
    {
      objc_msgSend(v6, "keysForDisplayRowAtIndex:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      v37 = v33;
      if (!v30)
      {
        v38 = objc_msgSend(v35, "count", v33);
        v37 = v33;
        if (v38 >= 2)
        {
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v39 = v36;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
          v41 = v31;
          v42 = v31;
          if (v40)
          {
            v43 = v40;
            v44 = 0;
            v45 = *(_QWORD *)v65;
            v42 = v31;
            do
            {
              for (i = 0; i != v43; ++i)
              {
                if (*(_QWORD *)v65 != v45)
                  objc_enumerationMutation(v39);
                v47 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                objc_msgSend(v47, "frame");
                if (!CGRectIsEmpty(v72) && objc_msgSend(v47, "interactionType") != 14)
                {
                  objc_msgSend(v47, "frame");
                  v41 = v48 + v49 * 0.5;
                  if ((v44 & 1) != 0)
                    goto LABEL_25;
                  v44 = 1;
                  v42 = v48 + v49 * 0.5;
                }
              }
              v43 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
            }
            while (v43);
            v41 = v31;
          }
LABEL_25:

          v37 = v32 / (v41 - v42);
        }
      }
      objc_msgSend(v6, "scaleKeys:withFactor:scale:", v36, v37, v27, v13);

      ++v34;
    }
    while (v34 < objc_msgSend(v6, "numberOfRows"));
  }
  v62 = 0u;
  v63 = 0u;
  if (v59 >= 0xFFFFFFFFFFFFFFFELL)
    v50 = 4.0;
  else
    v50 = 2.0;
  v60 = 0uLL;
  v61 = 0uLL;
  objc_msgSend(v6, "keys");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v61 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        objc_msgSend(v56, "frame");
        objc_msgSend(v56, "setPaddedFrame:", v50 + v57);
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v53);
  }

}

+ (CGSize)layoutScaleFactorForContext:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "screenTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)(objc_msgSend(v4, "orientation") - 3) < 2;

  v6 = dbl_1866816B0[v5];
  objc_msgSend(v3, "keyboardSize");
  v8 = v7 / v6;
  objc_msgSend(v3, "keyboardSize");
  v10 = v9;
  objc_msgSend(v3, "activeKeyplane");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "frame");
  v13 = v10 / v12;

  v14 = v8;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (void)transformKeysForFourRowKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *i;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  CGFloat MinX;
  uint64_t v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  id v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  id v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  int v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  uint64_t v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;

  v125 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "screenTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  objc_msgSend(v7, "screenTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "orientation");

  objc_msgSend(a1, "adjustHorizontalPaddingForKeyplane:withTransformationContext:", v6, v7);
  objc_msgSend(a1, "_keyplanePaddingForOrientation:", v13);
  v15 = v14;
  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 0, v16, v7);
  v18 = v17;
  v19 = 0;
  if ((unint64_t)objc_msgSend(v16, "count") >= 2)
  {
    objc_msgSend(a1, "_supplementaryControlKeyWithName:context:", CFSTR("Tab-Key"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v19, v16, v15, -1.0, v18, -1.0, v11);
  objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screenTraits");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keyboardWidth");
  v23 = v22;
  objc_msgSend(v19, "frame");
  v25 = v23 - v24;
  objc_msgSend(v20, "frame");
  v26 = v25 - CGRectGetMinX(v126);

  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v20, v26, 0.0, v11);
  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 1, v27, v7);
  v29 = v28;
  objc_msgSend(a1, "_supplementaryControlKeyWithName:context:", CFSTR("Caps-Lock-Key"), v7);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v7, "usesScriptSwitch");
  objc_msgSend(v6, "scriptSwitchKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (!(_DWORD)v20)
  {

    if (!v32)
      goto LABEL_11;
    objc_msgSend(v6, "scriptSwitchKey");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeKey:", v33);
    v34 = (uint64_t)v30;
LABEL_10:

    v30 = (id)v34;
LABEL_11:
    if (v30)
      goto LABEL_36;
    goto LABEL_12;
  }

  if (!v32)
  {
    objc_msgSend(a1, "_supplementaryScriptSwitchKeyWithContext:", v7);
    v34 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Caps-Lock-Key"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_msgSend(v6, "removeKey:", v33);
    goto LABEL_10;
  }

LABEL_12:
  objc_msgSend(v6, "scriptSwitchKey");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cachedUndoOrRedoKeyForKeyplane:", v6);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v36)
    v38 = (void *)v36;
  else
    v38 = v35;
  v30 = v38;

  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v30 == v35)
  {
    v117 = v27;
    objc_msgSend(v6, "cachedKeysByKeyName:", CFSTR("More-Key"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "containsObject:", v35))
    {
      objc_msgSend(v41, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (id)objc_msgSend(v42, "copy");

      v44 = v35;
    }
    else
    {
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v45 = v40;
      v43 = (id)objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
      if (v43)
      {
        v113 = v40;
        v114 = a1;
        v46 = *(_QWORD *)v121;
        while (2)
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(_QWORD *)v121 != v46)
              objc_enumerationMutation(v45);
            v48 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v48, "interactionType") == 11
              && (objc_msgSend(v41, "containsObject:", v48) & 1) == 0)
            {
              v43 = v48;
              goto LABEL_31;
            }
          }
          v43 = (id)objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
          if (v43)
            continue;
          break;
        }
LABEL_31:
        v40 = v113;
        a1 = v114;
      }

      objc_msgSend(v35, "setMergeAsMoreKey:", 1);
      objc_msgSend(v6, "removeKey:", v35);
      v44 = 0;
    }
    objc_msgSend(v6, "replaceKey:withKey:", v44, v43);
    objc_msgSend(v35, "setMergeAsMoreKey:", 0);

    v27 = v117;
  }
  else if (objc_msgSend(v39, "containsObject:", v30))
  {
    objc_msgSend(v6, "removeKey:andShiftKeys:scale:", v30, v40, v11);
  }

  if (!v30)
  {
    objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 0, 0, v7);
    v29 = v49;
  }
LABEL_36:
  objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v30, v27, v15, -1.0, v29, -1.0, v11);
  objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Return-Key"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screenTraits");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "keyboardWidth");
  v53 = v52;
  objc_msgSend(v30, "frame");
  v55 = v53 - v54;
  objc_msgSend(v50, "frame");
  v56 = v55 - CGRectGetMinX(v127);

  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v50, v56, 0.0, v11);
  objc_msgSend(v6, "cachedKeysByKeyName:", CFSTR("Shift-Key"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "count") == 2)
  {
    objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "paddedFrame");
    v60 = v59;
    objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "paddedFrame");
    v63 = v62;

    if (v60 >= v63)
    {
      objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v57;
      v66 = 0;
    }
    else
    {
      objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v57;
      v66 = 1;
    }
    objc_msgSend(v65, "objectAtIndexedSubscript:", v66);
    v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v57, "firstObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keysForDisplayRowAtIndex:", 3);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Return-Key"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v67, "containsObject:", v68))
    {
      v69 = v68;
    }
    else
    {
      objc_msgSend(v67, "lastObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "layoutTag");
      v71 = objc_claimAutoreleasedReturnValue();
      if (v71)
      {
        v72 = (void *)v71;
        v115 = a1;
        objc_msgSend(v67, "lastObject");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "name");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v74, "hasSuffix:", CFSTR("width-Toggle-Key"));

        if (v118)
        {
          objc_msgSend(v67, "lastObject");
          v69 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v69 = 0;
        }
        a1 = v115;
      }
      else
      {

        v69 = 0;
      }
    }

  }
  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 3);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "firstObject");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v76, "interactionType") == 2)
  {
    objc_msgSend(v76, "frame");
    MinX = CGRectGetMinX(v128);
    v78 = 2;
    if (MinX < 1.0)
      v78 = 0;
  }
  else
  {
    v78 = 2;
  }
  v119 = v78;
  objc_msgSend(a1, "_supplementaryShiftKeysWithContext:", v7);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v79, "count") != 2 || v64 && (objc_msgSend(v75, "containsObject:", v64) & 1) != 0)
  {
    v80 = v64;
  }
  else
  {
    objc_msgSend(v79, "firstObject");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 2, v75, v7);
    v82 = v81;
    objc_msgSend(v80, "frame");
    objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v80, v75, 0.0, -1.0, v82);
    if (!v69 || (objc_msgSend(v75, "containsObject:", v69) & 1) == 0)
    {
      objc_msgSend(v79, "lastObject");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v75, "lastObject");
      v116 = a1;
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "frame");
      v86 = v85;
      v88 = v87;
      v90 = v89;
      v92 = v91;

      objc_msgSend(v7, "screenTraits");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "keyboardWidth");
      v95 = v94;
      v129.origin.x = v86;
      v129.origin.y = v88;
      v129.size.width = v90;
      v129.size.height = v92;
      v96 = v95 - CGRectGetMaxX(v129);

      objc_msgSend(v75, "lastObject");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "shape");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setShape:", v98);

      a1 = v116;
      v130.origin.x = v86;
      v130.origin.y = v88;
      v130.size.width = v90;
      v130.size.height = v92;
      objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v83, 0, CGRectGetMaxX(v130), -1.0, v96, -1.0, v11);
      v69 = v83;
    }
  }
  v99 = v80;
  objc_msgSend(v99, "frame");
  objc_msgSend(v99, "setFrame:", v15 + v100, v102 + 0.0, v101 - (v15 + 0.0));
  objc_msgSend(v99, "paddedFrame");
  objc_msgSend(v99, "setPaddedFrame:", v15 + v103, v105 + 0.0, v104 - (v15 + 0.0));

  objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", v119, v75, v7);
  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v99);
  objc_msgSend(v7, "screenTraits");
  v106 = a1;
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "keyboardWidth");
  v109 = v108;
  objc_msgSend(v99, "frame");
  v111 = v109 - v110;
  objc_msgSend(v69, "frame");
  v112 = v111 - CGRectGetMinX(v131);

  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v69, v112, 0.0, v11);
  objc_msgSend(v106, "transformLastRowKeysForKeyplane:row:withTransformationContext:", v6, 4, v7);

}

+ (void)transformKeysForFiveRowKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double Width;
  double v16;
  double v17;
  double v18;
  uint64_t i;
  void *v20;
  id v21;
  CGRect v22;

  v21 = a3;
  v6 = a4;
  objc_msgSend(v6, "screenTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  objc_msgSend(v6, "screenTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orientation");

  objc_msgSend(v6, "screenTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyboardWidth");
  v14 = v13;

  objc_msgSend(v21, "frame");
  Width = CGRectGetWidth(v22);
  if (Width > 0.0)
  {
    v16 = v14 / Width;
    objc_msgSend(a1, "layoutScaleFactorForContext:", v6);
    v18 = v17;
    for (i = 1; i != 5; ++i)
    {
      objc_msgSend(v21, "keysForDisplayRowAtIndex:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scaleKeys:withFactor:scale:", v20, v16, v18, v10);

    }
  }
  objc_msgSend(a1, "transformLastRowKeysForKeyplane:row:withTransformationContext:", v21, 5, v6);

}

+ (void)transformKeysForHandwritingKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double Width;
  id v28;
  CGRect v29;
  CGRect v30;

  v28 = a3;
  v6 = a4;
  objc_msgSend(v6, "screenTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  objc_msgSend(v6, "screenTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orientation");

  objc_msgSend(a1, "layoutScaleFactorForContext:", v6);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v28, "keysForDisplayRowAtIndex:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 0, v16, v6);
  objc_msgSend(v28, "insertKey:withFrame:andShiftKeys:scale:", 0, v16, -1.0, -1.0, v17, -1.0, v10);
  objc_msgSend(v28, "scaleKeys:withFactor:scale:", v16, v13, v15, v10);
  objc_msgSend(v28, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenTraits");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyboardWidth");
  v21 = v20;
  objc_msgSend(v18, "frame");
  v22 = v21 - CGRectGetMinX(v29);

  objc_msgSend(v28, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v18, v22, 0.0, v10);
  objc_msgSend(v28, "keysForDisplayRowAtIndex:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenTraits");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "keyboardWidth");
  v26 = v25;

  objc_msgSend(v28, "frame");
  Width = CGRectGetWidth(v30);
  if (Width > 0.0)
    objc_msgSend(v28, "scaleKeys:withFactor:scale:", v23, v26 / Width, v15, v10);
  objc_msgSend(a1, "transformLastRowKeysForKeyplane:row:withTransformationContext:", v28, 2, v6);

}

+ (void)transformLastRowKeysForKeyplane:(id)a3 row:(unint64_t)a4 withTransformationContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double MinX;
  void *v44;
  double Width;
  void *v46;
  double v47;
  CGFloat v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "screenTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  objc_msgSend(v9, "screenTraits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "orientation");

  objc_msgSend(v8, "keysForDisplayRowAtIndex:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(a1, "_keyplanePaddingForOrientation:row:", v15, a4);
    objc_msgSend(v8, "repositionKeys:withOffset:scale:", v16);
    v17 = objc_msgSend(v16, "indexOfObjectPassingTest:", &__block_literal_global_366);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "layoutScaleFactorForContext:", v9);
      v19 = v18;
    }
    else
    {
      objc_msgSend(v16, "objectAtIndex:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "layoutScaleFactorForContext:", v9);
      v19 = v21;
      if (v20)
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v22 = v16;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        v53 = v16;
        if (v23)
        {
          v24 = v23;
          v54 = v15;
          v25 = 0;
          v26 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v56 != v26)
                objc_enumerationMutation(v22);
              v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
              if (objc_msgSend(v28, "visible", v53))
              {
                if (objc_msgSend(v28, "interactionType") == 15)
                {
                  v29 = v28;

                  v25 = 1;
                  v20 = v29;
                }
                else
                {
                  objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 3, v22, v9);
                  v31 = v30;
                  if ((v25 & 1) != 0
                    && objc_msgSend(v28, "interactionType") != 1
                    && objc_msgSend(v28, "interactionType") != 2)
                  {
                    objc_msgSend(a1, "_derivedTrailingControlKeyWidthForRow:orientation:", 3, v54);
                    v31 = v32;
                  }
                  objc_msgSend(v8, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v28, v31, 0.0, v13);
                }
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
          }
          while (v24);
        }

        objc_msgSend(v9, "screenTraits");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "keyboardWidth");
        v35 = v34;
        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "frame");
        v38 = v35 - v37;
        objc_msgSend(v22, "lastObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "frame");
        v40 = v38 - CGRectGetMaxX(v63);

        objc_msgSend(v20, "frame");
        objc_msgSend(v8, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v20, v40 + v41, 0.0, v13);
        objc_msgSend(v8, "scaleKeys:withFactor:scale:", v22, 1.0, v19, v13);
        v16 = v53;
        goto LABEL_22;
      }
    }
    objc_msgSend(v16, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "frame");
    MinX = CGRectGetMinX(v64);
    v60 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    Width = CGRectGetWidth(v65);
    objc_msgSend(v42, "frame");
    objc_msgSend(v8, "scaleKeys:withFactor:scale:", v44, Width / CGRectGetWidth(v66), 1.0, v13);

    v59 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "frame");
    objc_msgSend(v8, "repositionKeys:withOffset:scale:", v46, MinX - CGRectGetMinX(v67), 0.0, v13);

    objc_msgSend(v20, "frame");
    v47 = CGRectGetMinX(v68);
    objc_msgSend(v42, "frame");
    v48 = CGRectGetMaxX(v69) - v47;
    objc_msgSend(v9, "screenTraits");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "keyboardWidth");
    v51 = v50 - v47;
    objc_msgSend(v42, "frame");
    v52 = v51 - CGRectGetMaxX(v70);

    objc_msgSend(v8, "scaleKeys:withFactor:scale:", v16, (v48 + v52) / v48, v19, v13);
    objc_msgSend(v20, "frame");
    objc_msgSend(v8, "repositionKeys:withOffset:scale:", v16, v47 - CGRectGetMinX(v71), 0.0, v13);

LABEL_22:
  }

}

BOOL __113__UIKeyboardSupplementaryControlKeyTransformation_transformLastRowKeysForKeyplane_row_withTransformationContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "interactionType") == 15;
}

+ (void)transformKeysForVietnameseKeyPlane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  id v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  int v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  int v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  _BOOL8 v89;
  _BOOL8 v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[16];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v114 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "screenTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  objc_msgSend(v7, "screenTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "orientation");

  objc_msgSend(a1, "adjustHorizontalPaddingForKeyplane:withTransformationContext:", v6, v7);
  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 1);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 3);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keysForDisplayRowAtIndex:", 5);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 3);
  v18 = v17 + v17;
  objc_msgSend(a1, "_derivedTrailingControlKeyWidthForRow:orientation:", 3, v13);
  v20 = v19;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v21 = v16;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v108;
LABEL_3:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v108 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v25);
      if (!objc_msgSend(v26, "displayType"))
        break;
      if (v23 == ++v25)
      {
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
        if (v23)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v29 = v26;

    if (!v29)
      goto LABEL_10;
  }
  else
  {
LABEL_9:

LABEL_10:
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v93, OS_LOG_TYPE_FAULT, "Key plane should have at least one letter key.", buf, 2u);
      }

    }
    else
    {
      v27 = transformKeysForVietnameseKeyPlane_withTransformationContext____s_category;
      if (!transformKeysForVietnameseKeyPlane_withTransformationContext____s_category)
      {
        v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&transformKeysForVietnameseKeyPlane_withTransformationContext____s_category);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Key plane should have at least one letter key.", buf, 2u);
      }
    }
    v29 = 0;
  }
  objc_msgSend(v29, "frame");
  v31 = v30;
  objc_msgSend(v7, "screenTraits");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "keyboardWidth");
  v34 = (v33 - v18 - v20) / 9.0;

  v35 = v34 / v31;
  objc_msgSend(v6, "scaleKeys:withFactor:scale:", v14, v35, 1.0, v11);
  objc_msgSend(v6, "scaleKeys:withFactor:scale:", v15, v35, 1.0, v11);
  objc_msgSend(v6, "scaleKeys:withFactor:scale:", v97, v35, 1.0, v11);
  objc_msgSend(v6, "scaleKeys:withFactor:scale:", v21, v35, 1.0, v11);

  objc_msgSend(a1, "_derivedFiveRowControlKeyWidthForRow:keysForRow:context:", 0, v14, v7);
  v94 = (void *)v14;
  objc_msgSend(v6, "repositionKeys:withOffset:scale:", v14);
  objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screenTraits");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "keyboardWidth");
  v39 = v38;
  objc_msgSend(v36, "frame");
  v40 = v39 - CGRectGetMinX(v115);

  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v36, v40, 0.0, v11);
  objc_msgSend(a1, "_derivedFiveRowControlKeyWidthForRow:keysForRow:context:", 1, v15, v7);
  v42 = v41;
  objc_msgSend(v15, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "frame");
  CGRectGetMinX(v116);

  objc_msgSend(a1, "_supplementaryControlKeyWithName:context:", CFSTR("Tab-Key"), v7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v44, v15, 0.0, -1.0, v42, -1.0, v11);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v45 = v15;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
  v47 = v45;
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v103;
LABEL_19:
    v50 = 0;
    while (1)
    {
      if (*(_QWORD *)v103 != v49)
        objc_enumerationMutation(v45);
      v51 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v50);
      if (objc_msgSend(v51, "interactionType") == 13)
        break;
      if (v48 == ++v50)
      {
        v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
        if (v48)
          goto LABEL_19;
        v47 = v45;
        goto LABEL_28;
      }
    }
    v47 = v51;

    if (!v47)
      goto LABEL_29;
    objc_msgSend(v7, "screenTraits");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "keyboardWidth");
    v54 = v53;
    objc_msgSend(v47, "frame");
    v55 = v54 - CGRectGetMinX(v117);

    objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v47, v55, 0.0, v11);
  }
LABEL_28:

LABEL_29:
  objc_msgSend(a1, "_derivedFiveRowControlKeyWidthForRow:keysForRow:context:", 2, v97, v7);
  v57 = v56;
  objc_msgSend(v6, "name");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "containsString:", CFSTR("Alternate"));

  v95 = a1;
  if (v59)
  {
    v60 = CFSTR("Undo-Key");
    objc_msgSend(a1, "_supplementaryControlKeyWithName:context:", CFSTR("Undo-Key"), v7);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_supplementaryControlKeyWithName:context:", CFSTR("Redo-Key"), v7);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "containsString:", CFSTR("First-Alternate"));

    v65 = v61;
    if ((v64 & 1) == 0)
    {
      objc_msgSend(v6, "name");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "containsString:", CFSTR("Second-Alternate"));

      if (!v67)
      {
        v68 = 0;
LABEL_42:

        goto LABEL_43;
      }
      v60 = CFSTR("Redo-Key");
      v65 = v62;
    }
    objc_msgSend(v61, "setVisible:", v64);
    objc_msgSend(v62, "setVisible:", v64 ^ 1);
    v68 = v65;
    objc_msgSend(v6, "firstCachedKeyWithName:", v60);
    v69 = objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      v70 = (void *)v69;
      if (objc_msgSend(v96, "containsObject:", v69))
        objc_msgSend(v6, "removeKey:andShiftKeys:scale:", v70, v96, v11);
      else
        objc_msgSend(v6, "removeKey:", v70);

    }
    goto LABEL_42;
  }
  objc_msgSend(a1, "_supplementaryControlKeyWithName:context:", CFSTR("Caps-Lock-Key"), v7);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "usesScriptSwitch"))
    goto LABEL_44;
  objc_msgSend(a1, "_supplementaryScriptSwitchKeyWithContext:", v7);
  v68 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Caps-Lock-Key"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
    objc_msgSend(v6, "removeKey:", v61);
LABEL_43:

  v71 = v68;
LABEL_44:
  objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v71, v97, 0.0, -1.0, v57, -1.0, v11);
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v72 = v97;
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
  v74 = v72;
  if (v73)
  {
    v75 = v73;
    v76 = *(_QWORD *)v99;
LABEL_46:
    v77 = 0;
    while (1)
    {
      if (*(_QWORD *)v99 != v76)
        objc_enumerationMutation(v72);
      v78 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v77);
      if (objc_msgSend(v78, "interactionType") == 13)
        break;
      if (v75 == ++v77)
      {
        v75 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
        if (v75)
          goto LABEL_46;
        v74 = v72;
        goto LABEL_55;
      }
    }
    v74 = v78;

    if (!v74)
      goto LABEL_56;
    objc_msgSend(v7, "screenTraits");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "keyboardWidth");
    v81 = v80;
    objc_msgSend(v74, "frame");
    v82 = v81 - CGRectGetMinX(v118);

    objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v74, v82, 0.0, v11);
  }
LABEL_55:

LABEL_56:
  objc_msgSend(v6, "cachedKeysByKeyName:", CFSTR("Shift-Key"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "paddedFrame");
  v86 = v85;
  objc_msgSend(v83, "objectAtIndexedSubscript:", 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "paddedFrame");
  v89 = v86 < v88;
  v90 = v86 >= v88;

  objc_msgSend(v83, "objectAtIndexedSubscript:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "objectAtIndexedSubscript:", v89);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v91, v18, 0.0, v11);
  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v92, v20, 0.0, v11);

  objc_msgSend(v95, "transformLastRowKeysForKeyplane:row:withTransformationContext:", v6, 5, v7);
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "screenTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  objc_msgSend(v7, "screenTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orientation");

  v13 = objc_msgSend(v6, "visualStyling") & 0xFF0000;
  v14 = objc_msgSend(v6, "numberOfRows");
  objc_msgSend(a1, "layoutScaleFactorForContext:", v7);
  v16 = v15;
  if (v13 == 589824)
  {
    objc_msgSend(a1, "transformKeysForHandwritingKeyplane:withTransformationContext:", v6, v7);
  }
  else if (v14 == 5)
  {
    objc_msgSend(v6, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsString:", CFSTR("Wildcat-Vietnamese"));

    if (v18)
      objc_msgSend(a1, "transformKeysForVietnameseKeyPlane:withTransformationContext:", v6, v7);
    else
      objc_msgSend(a1, "transformKeysForFiveRowKeyplane:withTransformationContext:", v6, v7);
  }
  else if (v14 == 4)
  {
    objc_msgSend(a1, "transformKeysForFourRowKeyplane:withTransformationContext:", v6, v7);
  }
  objc_msgSend(v6, "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v7, "screenTraits");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "keyboardWidth");
  v27 = v26;

  objc_msgSend(v6, "setFrame:", v20, v22, v27, v24);
  +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v6, "subtrees", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v34, "type") == 3)
        {
          objc_msgSend(v34, "shape");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v7, "screenTraits");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "keyboardWidth");
            v38 = v37;
            objc_msgSend(v34, "frame");
            v40 = v38 / v39;

            objc_msgSend(v34, "shape");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "shapeByScalingShape:factor:", v41, v40, v16);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setShape:", v42);

          }
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v31);
  }

  objc_msgSend(v6, "setObject:forProperty:", 0, CFSTR("KBunionFrame"));
  objc_msgSend(v6, "setObject:forProperty:", 0, CFSTR("KBunionPaddedFrame"));

  return v6;
}

@end
