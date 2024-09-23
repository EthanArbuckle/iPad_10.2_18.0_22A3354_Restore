@implementation UIView(SiriUICore)

- (uint64_t)suic_updateViewHierarchyToUseSiriLanguageSemanticContentAttribute
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(a1, "conformsToProtocol:", &unk_1EE6EAE38);
  if ((_DWORD)result)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (result = objc_msgSend(a1, "disallowSemanticContentModification"), (result & 1) == 0))
    {
      if (SUICSiriLanguageIsRTL())
        v3 = 4;
      else
        v3 = 3;
      return objc_msgSend(a1, "suic_recursiveSetSemanticContentAttribute:", v3);
    }
  }
  return result;
}

- (uint64_t)suic_recursiveSetSemanticContentAttribute:()SiriUICore
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "suic_recursiveSetSemanticContentAttribute:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (objc_msgSend(a1, "semanticContentAttribute") != a3)
    objc_msgSend(a1, "setSemanticContentAttribute:", a3);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(a1, "textAlignment");
      if (result == 4)
        return objc_msgSend(a1, "setTextAlignment:", 2* (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a1, "semanticContentAttribute")) != 0));
    }
  }
  return result;
}

@end
