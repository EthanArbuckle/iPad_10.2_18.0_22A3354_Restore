@implementation NSString(CRLineWrappingUtilities)

- (BOOL)_crStartsWithBOS
{
  id v2;
  uint64_t v3;

  objc_opt_self();
  if (qword_1ED0B4540 != -1)
    dispatch_once(&qword_1ED0B4540, &__block_literal_global_15);
  v2 = (id)_MergedGlobals_18;
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2);

  return v3 == 0;
}

- (BOOL)_crStartsWithListItemIndicator
{
  return +[CRListItemOutputRegion textStartsWithListItem:](CRListItemOutputRegion, "textStartsWithListItem:", a1);
}

- (BOOL)_crStartsWithDigit
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2);

  return v3 == 0;
}

- (uint64_t)_crEndsWithDigit
{
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1));

  return v3;
}

- (uint64_t)_crEndsWithEOS
{
  id v2;
  void *v3;
  uint64_t v4;

  objc_opt_self();
  if (qword_1ED0B4550 != -1)
    dispatch_once(&qword_1ED0B4550, &__block_literal_global_10);
  v2 = (id)qword_1ED0B4548;
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "hasSuffix:", v3) ^ 1;

  return v4;
}

- (uint64_t)_crEndsWithMOS
{
  id v2;
  void *v3;
  uint64_t v4;

  objc_opt_self();
  if (qword_1ED0B4570 != -1)
    dispatch_once(&qword_1ED0B4570, &__block_literal_global_16_0);
  v2 = (id)qword_1ED0B4568;
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "hasSuffix:", v3) ^ 1;

  return v4;
}

- (uint64_t)_crEndsWithClosingPunctuation
{
  id v2;
  void *v3;
  uint64_t v4;

  objc_opt_self();
  if (qword_1ED0B4560 != -1)
    dispatch_once(&qword_1ED0B4560, &__block_literal_global_13_0);
  v2 = (id)qword_1ED0B4558;
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "hasSuffix:", v3) ^ 1;

  return v4;
}

- (uint64_t)_crIsStartOfSentence
{
  if ((objc_msgSend(a1, "_crStartsWithBOS") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_crStartsWithListItemIndicator");
}

- (BOOL)_crIsListItemMarker
{
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  +[CRListItemMarker listItemMarkerForText:requiresAdjacentText:](CRListItemMarker, "listItemMarkerForText:requiresAdjacentText:", a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v5 = 0;
  if (v2)
  {
    objc_msgSend(v2, "range");
    if (v4 == objc_msgSend(a1, "length"))
      v5 = 1;
  }

  return v5;
}

- (uint64_t)_crIsProgrammingStatement
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  v2 = objc_msgSend(a1, "length");
  result = 0;
  if (a1)
  {
    if (v2)
    {
      result = objc_msgSend(a1, "length");
      if (result)
      {
        if (objc_msgSend(a1, "length"))
        {
          v4 = 0;
          while (objc_msgSend(a1, "characterAtIndex:", v4) - 32 < 0x60)
          {
            if (++v4 >= (unint64_t)objc_msgSend(a1, "length"))
              goto LABEL_8;
          }
        }
        else
        {
LABEL_8:
          if ((objc_msgSend(a1, "containsString:", CFSTR(" = ")) & 1) != 0
            || (objc_msgSend(a1, "hasSuffix:", CFSTR("{")) & 1) != 0
            || (objc_msgSend(a1, "hasPrefix:", CFSTR("}")) & 1) != 0
            || (objc_msgSend(a1, "hasPrefix:", CFSTR("// ")) & 1) != 0
            || (objc_msgSend(a1, "hasPrefix:", CFSTR("# ")) & 1) != 0
            || objc_msgSend(a1, "hasPrefix:", CFSTR("["))
            && (objc_msgSend(a1, "hasSuffix:", CFSTR("];")) & 1) != 0)
          {
            return 1;
          }
          if ((objc_msgSend(a1, "hasSuffix:", CFSTR(")")) & 1) != 0
            || objc_msgSend(a1, "hasSuffix:", CFSTR(");")))
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v5, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", 0));

            if (v6)
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
              v7 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v7);
              v8 = (void *)objc_claimAutoreleasedReturnValue();

              LOBYTE(v7) = objc_msgSend(v8, "hasPrefix:", CFSTR("("));
              if ((v7 & 1) != 0)
                return 1;
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)_crIsSentencePunctuatedIncludingWhitespace:()CRLineWrappingUtilities
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  int v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v27[7];
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = objc_msgSend(&unk_1E993F758, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v39;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v7)
        objc_enumerationMutation(&unk_1E993F758);
      v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
      if (a3)
      {
        v10 = v9;
      }
      else
      {
        objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v5);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
      v12 = objc_msgSend(a1, "containsString:", v10);

      if ((v12 & 1) != 0)
        goto LABEL_43;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(&unk_1E993F758, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  if (a3)
  {
    objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v5);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v35;
LABEL_15:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
        if (v15 + v17 == objc_msgSend(v13, "count") - 1)
          break;
        objc_msgSend(v13, "objectAtIndexedSubscript:", v15 + v17 + 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "hasSuffix:", CFSTR(".")))
        {
          if (objc_msgSend(v18, "_crContainsText")
            && (!objc_msgSend(v18, "_crStartsWithUppercase")
             || objc_msgSend(v18, "_crIsAllCaps") && objc_msgSend(v18, "length") != 2
             || (unint64_t)objc_msgSend(v18, "length") >= 4))
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "_crStartsWithCharacterInSet:", v20) & 1) != 0)
            {
              v21 = objc_msgSend(v19, "_crStartsWithLowercase");

              if ((v21 & 1) == 0)
                goto LABEL_42;
            }
            else
            {

            }
          }
        }
        else if ((objc_msgSend(v18, "hasSuffix:", CFSTR(",")) & 1) != 0
               || objc_msgSend(v18, "hasSuffix:", CFSTR("，")))
        {
          if (!objc_msgSend(v18, "_crContainsText")
            || !objc_msgSend(v19, "_crContainsText")
            || (v22 = objc_msgSend(v18, "_crIsAllCaps"), v22 == objc_msgSend(v19, "_crIsAllCaps"))
            || (unint64_t)objc_msgSend(v18, "length") < 3
            || (unint64_t)objc_msgSend(v19, "length") < 2)
          {
LABEL_42:

            goto LABEL_43;
          }
        }

        if (v14 == ++v17)
        {
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          v15 += v17;
          if (v14)
            goto LABEL_15;
          break;
        }
      }
    }

  }
  else
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__7;
    v28[4] = __Block_byref_object_dispose__7;
    v29 = 0;
    v23 = objc_msgSend(a1, "length");
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __80__NSString_CRLineWrappingUtilities___crIsSentencePunctuatedIncludingWhitespace___block_invoke;
    v27[3] = &unk_1E98DA9B8;
    v27[4] = a1;
    v27[5] = v28;
    v27[6] = &v30;
    objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v23, 2, v27);
    v24 = *((_BYTE *)v31 + 24) == 0;
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(&v30, 8);
    if (!v24)
    {
LABEL_43:
      v25 = 1;
      goto LABEL_44;
    }
  }
  v25 = 0;
LABEL_44:

  return v25;
}

@end
