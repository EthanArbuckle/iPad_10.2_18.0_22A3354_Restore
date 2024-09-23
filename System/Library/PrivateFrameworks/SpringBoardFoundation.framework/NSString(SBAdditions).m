@implementation NSString(SBAdditions)

- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:
{
  return objc_msgSend(a1, "_adjustedFontForScripts:forFont:withPointAdjustment:ignoringContent:", a3, a4, 0, -1.0);
}

- (id)_adjustedFontForScripts:()SBAdditions forFont:withPointAdjustment:ignoringContent:
{
  id v10;
  int v11;
  int v12;
  int v13;
  int v14;
  id v15;
  double v16;
  int v17;
  int v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  v10 = a5;
  v11 = objc_msgSend(a1, "_isInScript:useLocaleOnly:", 1, a6);
  v12 = objc_msgSend(a1, "_isInScript:useLocaleOnly:", 2, a6);
  v13 = objc_msgSend(a1, "_isInScript:useLocaleOnly:", 4, a6);
  v14 = objc_msgSend(a1, "_isInScript:useLocaleOnly:", 8, a6);
  if ((a4 & 3) != 0
    && ((v12 & (a4 >> 1) & 1) != 0 || (a4 & v11 & 1) != 0 || (v13 & (a4 >> 2) & 1) != 0 || (v14 & (a4 >> 3)) != 0))
  {
    v16 = 2.0;
    if (v12)
      v16 = 1.0;
    if (a2 >= 0.0)
      v17 = 1;
    else
      v17 = v12;
    v18 = v17 | v11;
    if (a2 >= 0.0)
      v16 = a2;
    v19 = 0.0;
    if (!(v13 | v14))
      v19 = a2;
    if (v18)
      v20 = v16;
    else
      v20 = v19;
    objc_msgSend(v10, "pointSize");
    objc_msgSend(v10, "fontWithSize:", v20 + v21);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v10;
  }
  v22 = v15;

  return v22;
}

- (uint64_t)_isInScript:()SBAdditions useLocaleOnly:
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v10;

  if (!a4)
    return objc_msgSend(a1, "_isEntirelyCharactersInScript:", a3);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((unint64_t)(a3 - 1) >= 8)
    v8 = 0;
  else
    v8 = off_1E200EF88[a3 - 1];
  v10 = objc_msgSend(v6, "hasPrefix:", v8);

  return v10;
}

- (uint64_t)_isEntirelyCharactersInScript:()SBAdditions
{
  uint64_t result;
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__NSString_SBAdditions___isEntirelyCharactersInScript___block_invoke;
  block[3] = &unk_1E200EF28;
  block[5] = a3;
  block[6] = a2;
  block[4] = a1;
  if (_isEntirelyCharactersInScript__onceToken != -1)
    dispatch_once(&_isEntirelyCharactersInScript__onceToken, block);
  result = objc_msgSend(a1, "sb_isEntirelyCharactersInSet:", _isEntirelyCharactersInScript____set);
  if ((_DWORD)result)
    return objc_msgSend(a1, "_isEntirelyCommon") ^ 1;
  return result;
}

- (uint64_t)sb_isEntirelyCharactersInSet:()SBAdditions
{
  uint64_t result;
  uint64_t v6;
  void *v7;
  int v8;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v6 = result;
    v7 = malloc_type_malloc(2 * result, 0x1000040BDFB0063uLL);
    objc_msgSend(a1, "getCharacters:range:", v7, 0, v6);
    v8 = MEMORY[0x18D774394](a3, v7, v6, 1);
    free(v7);
    return v6 == v8;
  }
  return result;
}

- (BOOL)sb_containsEmoji
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "sb_emojiWithoutVS16Set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2);

  return v3 != 0x7FFFFFFFFFFFFFFFLL || CEMStringContainsEmoji() != 0;
}

+ (id)sb_emojiWithoutVS16Set
{
  if (sb_emojiWithoutVS16Set_onceToken != -1)
    dispatch_once(&sb_emojiWithoutVS16Set_onceToken, &__block_literal_global_17);
  return (id)sb_emojiWithoutVS16Set___emojiWithoutVS16Set;
}

- (uint64_t)_isEntirelyCommon
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __42__NSString_SBAdditions___isEntirelyCommon__block_invoke;
  v7 = &unk_1E200EB18;
  v8 = a1;
  v9 = a2;
  if (_isEntirelyCommon_onceToken != -1)
    dispatch_once(&_isEntirelyCommon_onceToken, &v4);
  return objc_msgSend(a1, "sb_isEntirelyCharactersInSet:", _isEntirelyCommon___charSet, v4, v5, v6, v7, v8, v9);
}

- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:withPointAdjustment:
{
  return objc_msgSend(a1, "_adjustedFontForScripts:forFont:withPointAdjustment:ignoringContent:", a3, a4, 0);
}

- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:ignoringContent:
{
  return objc_msgSend(a1, "_adjustedFontForScripts:forFont:withPointAdjustment:ignoringContent:", -1.0);
}

@end
