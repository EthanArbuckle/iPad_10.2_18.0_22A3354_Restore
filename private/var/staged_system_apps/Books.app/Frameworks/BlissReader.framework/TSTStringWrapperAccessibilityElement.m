@implementation TSTStringWrapperAccessibilityElement

+ (id)stringWrapperAccessibilityElementWithTableRep:(id)a3 string:(id)a4
{
  TSTStringWrapperAccessibilityElement *v4;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = 0;
  if (a3 && a4)
  {
    v7 = objc_msgSend(a3, "tsaxHeaderElementsCache");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if ((objc_msgSend(objc_msgSend(v12, "accessibilityLabel"), "isEqualToString:", a4) & 1) != 0)
          break;
        if (v9 == (id)++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_13;
        }
      }
      v4 = v12;
      if (v4)
        return v4;
    }
LABEL_13:
    v4 = -[TSAccessibilityElement initWithAccessibilityParent:]([TSTStringWrapperAccessibilityElement alloc], "initWithAccessibilityParent:", a3);
    -[TSTStringWrapperAccessibilityElement setAccessibilityLabel:](v4, "setAccessibilityLabel:", a4);
    if (!v7)
    {
      v7 = (id)objc_opt_new(NSMutableArray, v13);
      objc_msgSend(a3, "tsaxSetHeaderElementsCache:", v7);

    }
    objc_msgSend(v7, "addObject:", v4);
  }
  return v4;
}

@end
