@implementation UIView(RTL)

- (uint64_t)recursive_setSemanticContentAttribute:()RTL
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v10, "recursive_setSemanticContentAttribute:", a3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && objc_msgSend(a1, "semanticContentAttribute") != a3)
    objc_msgSend(a1, "setSemanticContentAttribute:", a3);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(a1, "textAlignment");
      if (result == 4)
        return objc_msgSend(a1, "setTextAlignment:", 2* (objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a1, "semanticContentAttribute")) != 0));
    }
  }
  return result;
}

+ (uint64_t)siriChevronShouldBeOnLeadingSide
{
  _BOOL4 IsRTL;

  IsRTL = SiriUISystemLanguageIsRTL();
  return IsRTL ^ SiriLanguageIsRTL();
}

@end
