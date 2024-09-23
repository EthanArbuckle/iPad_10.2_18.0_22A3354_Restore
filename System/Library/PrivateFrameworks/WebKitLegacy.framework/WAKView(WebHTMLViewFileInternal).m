@implementation WAKView(WebHTMLViewFileInternal)

- (uint64_t)_web_addDescendentWebHTMLViewsToArray:()WebHTMLViewFileInternal
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend(a1, "subviews", 0);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(a3, "addObject:", v9);
        objc_msgSend(v9, "_web_addDescendentWebHTMLViewsToArray:", a3);
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

@end
