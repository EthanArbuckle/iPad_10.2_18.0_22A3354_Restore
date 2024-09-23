@implementation SBWindowingLayoutFormatParser

+ (id)parse:(id)a3 bundleIdentifiersToLaunch:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  SBWindowingLayoutFormatParser *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    v9 = 2;
    goto LABEL_20;
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 5)
  {
    v9 = 3;
LABEL_20:
    _SBWindowingLayoutFormatErrorWithCode(v9);
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v9 = 5;
    goto LABEL_20;
  }
  v10 = (void *)objc_opt_new();
  v11 = objc_alloc_init(SBWindowingLayoutFormatParser);
  v22 = v8;
  -[SBWindowingLayoutFormatParser _createMapForLabelToBundleIdentifierAndLayoutRole:](v11, "_createMapForLabelToBundleIdentifierAndLayoutRole:", v8);
  v23 = v7;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("["));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v17, "length"))
        {
          objc_msgSend(v17, "substringToIndex:", objc_msgSend(v17, "length"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0;
          -[SBWindowingLayoutFormatParser _parse:error:](v11, "_parse:error:", v18, &v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v24;

          if (v20)
            *a5 = objc_retainAutorelease(v20);
          else
            objc_msgSend(v10, "addObject:", v19);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  v8 = v22;
  v7 = v23;
LABEL_21:

  return v10;
}

- (id)_parse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SBWindowingLayoutItemRequest *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  NSUInteger v29;
  id v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id obj;
  id *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v38 = a4;
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("|"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v41;
      v35 = v7;
      v32 = v6;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v41 != v34)
            objc_enumerationMutation(obj);
          v36 = v9;
          v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
          v11 = objc_alloc_init(SBWindowingLayoutItemRequest);
          if (objc_msgSend(v10, "length"))
          {
            v12 = 0;
            while (1)
            {
              v39 = 0;
              v13 = -[SBWindowingLayoutFormatParser _findValidSubStringRangeForComponent:startIndex:currentIndex:error:](self, "_findValidSubStringRangeForComponent:startIndex:currentIndex:error:", v10, v12, v12, &v39);
              v15 = v14;
              v16 = objc_retainAutorelease(v39);
              *v38 = v16;
              if (v16)
              {
                v17 = v16;
                goto LABEL_57;
              }
              objc_msgSend(v10, "substringWithRange:", v13, v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v8, "containsObject:", v17))
                break;
              if (!-[SBWindowingLayoutItemRequest layoutRole](v11, "layoutRole"))
              {
                -[NSDictionary objectForKey:](self->_labelToBundleIdentifierAndLayoutRole, "objectForKey:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v18;
                if (v18)
                {
                  objc_msgSend(v18, "bs_safeNumberForKey:", CFSTR("layoutRole"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "unsignedIntegerValue");

                  objc_msgSend(v19, "bs_safeStringForKey:", CFSTR("bundleIdentifier"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SBWindowingLayoutItemRequest setLayoutRole:](v11, "setLayoutRole:", v21);
                  -[SBWindowingLayoutItemRequest setBundleID:](v11, "setBundleID:", v22);
                  objc_msgSend(v8, "addObject:", v17);

                }
              }
              if (-[SBWindowingLayoutItemRequest size](v11, "size") == 7)
              {
                objc_msgSend(v17, "lowercaseString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v23, "isEqualToString:", CFSTR("maximized")) & 1) != 0)
                {
                  v24 = 1;
                }
                else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("fullscreen")) & 1) != 0)
                {
                  v24 = 2;
                }
                else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("smallest")) & 1) != 0)
                {
                  v24 = 3;
                }
                else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("inset")) & 1) != 0)
                {
                  v24 = 4;
                }
                else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("quarter")) & 1) != 0)
                {
                  v24 = 5;
                }
                else if (objc_msgSend(v23, "isEqualToString:", CFSTR("half")))
                {
                  v24 = 6;
                }
                else
                {
                  v24 = 7;
                }

                -[SBWindowingLayoutItemRequest setSize:](v11, "setSize:", v24);
              }
              if (-[SBWindowingLayoutItemRequest position](v11, "position") == 6)
              {
                objc_msgSend(v17, "lowercaseString");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v25, "isEqualToString:", CFSTR("topright")) & 1) != 0)
                {
                  v26 = 2;
                }
                else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("topleft")) & 1) != 0)
                {
                  v26 = 3;
                }
                else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("bottomleft")) & 1) != 0)
                {
                  v26 = 4;
                }
                else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("bottomright")) & 1) != 0)
                {
                  v26 = 5;
                }
                else if (objc_msgSend(v25, "isEqualToString:", CFSTR("center")))
                {
                  v26 = 1;
                }
                else
                {
                  v26 = 6;
                }

                -[SBWindowingLayoutItemRequest setPosition:](v11, "setPosition:", v26);
              }
              objc_msgSend(v17, "lowercaseString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("keyfocus"));

              if (v28)
                -[SBWindowingLayoutItemRequest setWantsFocus:](v11, "setWantsFocus:", 1);
              v12 = v13 + v15 + 1;

              if (v12 >= objc_msgSend(v10, "length"))
                goto LABEL_46;
            }
            _SBWindowingLayoutFormatErrorWithCode(6uLL);
            *v38 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

            v30 = 0;
            v6 = v32;
            v7 = v35;
            goto LABEL_59;
          }
LABEL_46:
          if (-[SBWindowingLayoutItemRequest size](v11, "size") == 7)
            -[SBWindowingLayoutItemRequest setSize:](v11, "setSize:", 0);
          v7 = v35;
          if (-[SBWindowingLayoutItemRequest position](v11, "position") == 6)
            -[SBWindowingLayoutItemRequest setPosition:](v11, "setPosition:", 0);
          objc_msgSend(v35, "addObject:", v11);

          v9 = v36 + 1;
        }
        while (v36 + 1 != v33);
        v6 = v32;
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v33)
          continue;
        break;
      }
    }

    v29 = -[NSDictionary count](self->_labelToBundleIdentifierAndLayoutRole, "count");
    if (v29 == objc_msgSend(v7, "count"))
    {
      v30 = v7;
    }
    else
    {
      _SBWindowingLayoutFormatErrorWithCode(4uLL);
      v30 = 0;
      *v38 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_59:

  }
  else
  {
    _SBWindowingLayoutFormatErrorWithCode(2uLL);
    v30 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

- (_NSRange)_findValidSubStringRangeForComponent:(id)a3 startIndex:(unint64_t)a4 currentIndex:(unint64_t)a5 error:(id *)a6
{
  id v10;
  char v11;
  char v12;
  int v13;
  unint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  char valid;
  unint64_t v18;
  _NSRange result;

  v10 = a3;
  if (objc_msgSend(v10, "length") <= a5
    || (v11 = objc_msgSend(v10, "characterAtIndex:", a5), v11 == 93)
    || v11 == 124
    || (v12 = v11, v13 = v11, isValidSymbol(v11)))
  {
    v14 = a5 - a4;
  }
  else
  {
    valid = isValidSymbol(v13);
    if (((v12 & 0xDF) - 65) < 0x1Au || (valid & 1) != 0)
    {
      a4 = -[SBWindowingLayoutFormatParser _findValidSubStringRangeForComponent:startIndex:currentIndex:error:](self, "_findValidSubStringRangeForComponent:startIndex:currentIndex:error:", v10, a4, a5 + 1, a6);
      v14 = v18;
    }
    else
    {
      _SBWindowingLayoutFormatErrorWithCode(1uLL);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      a4 = 0x7FFFFFFFFFFFFFFFLL;
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  v15 = a4;
  v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (void)_createMapForLabelToBundleIdentifierAndLayoutRole:(id)a3
{
  id v4;
  NSDictionary *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  NSDictionary *labelToBundleIdentifierAndLayoutRole;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSDictionary *)objc_opt_new();
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    v7 = 1;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E91CE530, "objectAtIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBWindowingLayoutFormatParser _applyLayoutRole:](self, "_applyLayoutRole:", v7);
      v14[0] = CFSTR("bundleIdentifier");
      v14[1] = CFSTR("layoutRole");
      v15[0] = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", v12, v9);

      v7 = v10 + 1;
      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }
  labelToBundleIdentifierAndLayoutRole = self->_labelToBundleIdentifierAndLayoutRole;
  self->_labelToBundleIdentifierAndLayoutRole = v5;

}

- (int64_t)_applyLayoutRole:(int64_t)a3
{
  if (SBLayoutRoleIsValidForSplitView(a3) && a3 <= 25)
    return a3;
  else
    return -[SBWindowingLayoutFormatParser _applyLayoutRole:](self, "_applyLayoutRole:", a3 + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelToBundleIdentifierAndLayoutRole, 0);
}

@end
