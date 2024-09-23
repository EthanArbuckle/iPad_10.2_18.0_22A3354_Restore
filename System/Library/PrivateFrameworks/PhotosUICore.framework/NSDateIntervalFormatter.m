@implementation NSDateIntervalFormatter

void __58__NSDateIntervalFormatter_PhotosUICore___px_substitutions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__NSDateIntervalFormatter_PhotosUICore___px_substitutions__block_invoke_2;
  v6[3] = &unk_1E511F638;
  v7 = v2;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = v2;
  objc_msgSend(&unk_1E53F0A70, "enumerateKeysAndObjectsUsingBlock:", v6);
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)_px_substitutions_substitutionsByLocaleIdentifier;
  _px_substitutions_substitutionsByLocaleIdentifier = v3;

}

void __58__NSDateIntervalFormatter_PhotosUICore___px_substitutions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("NSDateIntervalFormatter+PhotosUICore.m"), 299, CFSTR("unsupported substitution key %@"), v5);

      abort();
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

void __72__NSDateIntervalFormatter_PhotosUICore___px_localizedCapitalizedString___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v11 = a2;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = v11;
  if (*(_BYTE *)(v12 + 24))
  {
    *(_BYTE *)(v12 + 24) = 0;
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v11, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "replaceCharactersInRange:withString:", a3, a4, v14);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "rangeOfCharacterFromSet:options:range:", _px_localizedCapitalizedString__wordSeparatorCharacterSet, 0, a3 + a4, a5 + a6 - (a3 + a4)) != 0x7FFFFFFFFFFFFFFFLL)*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

void __72__NSDateIntervalFormatter_PhotosUICore___px_localizedCapitalizedString___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("."));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)_px_localizedCapitalizedString__wordSeparatorCharacterSet;
  _px_localizedCapitalizedString__wordSeparatorCharacterSet = v1;

}

void __72__NSDateIntervalFormatter_PhotosUICore___px_localizedCapitalizedString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("af"), CFSTR("ca"), CFSTR("cs"), CFSTR("da"), CFSTR("es"), CFSTR("fr"), CFSTR("it"), CFSTR("nb"), CFSTR("nl"), CFSTR("nn"), CFSTR("pt"), CFSTR("ru"), CFSTR("uk"), CFSTR("vi"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_px_localizedCapitalizedString__languagesWithCustomCapitalization;
  _px_localizedCapitalizedString__languagesWithCustomCapitalization = v0;

}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char v10;
  id v11;

  v11 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", v6, v11, 0, 0, objc_msgSend(v5, "length"));

  v8 = v11;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    if ((objc_msgSend(v11, "hasPrefix:", CFSTR(" ")) & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(v11, "hasSuffix:", CFSTR(" "));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
    v8 = v11;
  }

}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", v3, CFSTR(" "), 0, 0, objc_msgSend(v2, "length"));

}

uint64_t __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
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
  if (a3)
  {
    if (a2 + 1 > (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length")
      || (objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a2)) & 1) == 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v5 = *(id *)(a1 + 40);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v27;
LABEL_6:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
          v11 = objc_msgSend(v10, "length") + a2;
          if (v11 <= objc_msgSend(*(id *)(a1 + 32), "length"))
          {
            objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, objc_msgSend(v10, "length"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", v10);

            if ((v13 & 1) != 0)
              break;
          }
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
            if (v7)
              goto LABEL_6;
            goto LABEL_26;
          }
        }
LABEL_27:
        v14 = objc_msgSend(v10, "length");
        goto LABEL_28;
      }
      goto LABEL_26;
    }
  }
  else if (a2 < 1
         || (objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a2 - 1)) & 1) == 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = *(id *)(a1 + 40);
    v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
LABEL_19:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
        if (objc_msgSend(v10, "length", (_QWORD)v22) <= (unint64_t)a2)
        {
          objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2 - objc_msgSend(v10, "length"), objc_msgSend(v10, "length"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v10);

          if ((v20 & 1) != 0)
            goto LABEL_27;
        }
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v16)
            goto LABEL_19;
          break;
        }
      }
    }
LABEL_26:
    v14 = 0;
LABEL_28:

    return v14;
  }
  return 1;
}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v13; v4 = v13 - i)
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v14, 385, i, v4);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v8 = v6;
      for (j = v7; ; j += v10)
      {
        v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        if (!v10)
          break;
        v8 -= v10;
      }
      do
      {
        v11 = j;
        i = j + v8;
        v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        j += v12;
      }
      while (v12);
      objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", *(_QWORD *)(a1 + 48), v8, v11);
      v13 = objc_msgSend(*(id *)(a1 + 32), "length");
    }
  }

}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(v5, "length");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_7;
    v8[3] = &unk_1E511F530;
    v9 = v4;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v7 = v4;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v8);

  }
}

uint64_t __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  unint64_t v7;

  if (!a2
    || (result = objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a2)), (_DWORD)result))
  {
    v7 = a3 + a2 - 1;
    if (v7 >= objc_msgSend(*(id *)(a1 + 32), "length") - 1)
      return 1;
    result = objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v7));
    if ((_DWORD)result)
      return 1;
  }
  return result;
}

uint64_t __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToDictionary:", a2);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", *(_QWORD *)(a1 + 48), a3, a4);
  }
  return result;
}

uint64_t __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", *(_QWORD *)(a1 + 48), a3, a4);
  return result;
}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v0);

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v1);

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v2);

  v3 = objc_msgSend(v6, "copy");
  v4 = (void *)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet;
  px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet = v3;

  v5 = (void *)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationWordsByLanguages;
  px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationWordsByLanguages = (uint64_t)&unk_1E53F0930;

}

@end
