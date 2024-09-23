@implementation UIAppearance

uint64_t __83___UIAppearance__applyInvocationsTo_window_matchingSelector_onlySystemInvocations___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t result;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  v29 = result;
  if (result)
  {
    v28 = *(_QWORD *)v46;
    v31 = a1;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(a2);
        v30 = v6;
        v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "appearancesAtNode:withObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v6), *(_QWORD *)(a1 + 40));
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v32 = v7;
        v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
        if (v34)
        {
          v33 = *(_QWORD *)v42;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v42 != v33)
                objc_enumerationMutation(v32);
              v9 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v8);
              v36 = *(_QWORD *)(a1 + 48);
              v10 = *(_QWORD *)(a1 + 72);
              if (v9)
              {
                v11 = *(id *)(v9 + 16);
                v12 = *(_QWORD *)(v9 + 24);
              }
              else
              {
                v11 = 0;
                v12 = 0;
              }
              v35 = v8;
              if (v10 | v12)
              {
                v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v49 = 0u;
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
                if (v14)
                {
                  v15 = v14;
                  v16 = *(_QWORD *)v50;
                  do
                  {
                    for (i = 0; i != v15; ++i)
                    {
                      if (*(_QWORD *)v50 != v16)
                        objc_enumerationMutation(v11);
                      v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                      v19 = +[_UIAppearance _windowsForSource:](_UIAppearance, "_windowsForSource:", objc_msgSend((id)v12, "objectForKey:", v18));
                      if ((!v10 || objc_msgSend(v18, "selector") == v10)
                        && (!v19 || objc_msgSend(v19, "containsObject:", v36)))
                      {
                        objc_msgSend(v13, "addObject:", v18);
                      }
                    }
                    v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
                  }
                  while (v15);
                }
                v11 = v13;
                a1 = v31;
              }
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v38;
                do
                {
                  for (j = 0; j != v21; ++j)
                  {
                    if (*(_QWORD *)v38 != v22)
                      objc_enumerationMutation(v11);
                    v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                    v25 = objc_msgSend(objc_getAssociatedObject(v24, &_MergedGlobals_1083), "BOOLValue");
                    if ((v25 & 1) != 0 || a3)
                    {
                      if (v25)
                        v26 = 56;
                      else
                        v26 = 64;
                      objc_msgSend(*(id *)(a1 + v26), "addObject:", v24);
                    }
                  }
                  v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
                }
                while (v21);
              }
              v8 = v35 + 1;
            }
            while (v35 + 1 != v34);
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
          }
          while (v34);
        }
        v6 = v30 + 1;
      }
      while (v30 + 1 != v29);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      v29 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __46___UIAppearance_appearancesAtNode_withObject___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;

  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(v3, "_isValidAppearanceForCustomizableObject:", *(_QWORD *)(a1 + 40));
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }
  return result;
}

uint64_t __41___UIAppearance__handleGetterInvocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  NSString *v7;
  uint64_t result;
  uint64_t i;
  unint64_t v10;
  _BYTE *v11;
  id v13;
  id v14;

  v7 = NSStringFromSelector((SEL)objc_msgSend(a2, "selector"));
  if (-[NSString characterAtIndex:](v7, "characterAtIndex:", 0) == 95)
    v7 = -[NSString substringFromIndex:](v7, "substringFromIndex:", 1);
  result = -[NSString isEqualToString:](v7, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if (!(_DWORD)result)
    return result;
  if (*(_QWORD *)(a1 + 64) < 3uLL)
    goto LABEL_18;
  for (i = 2; ; ++i)
  {
    v13 = 0;
    v14 = 0;
    v10 = i + 1;
    objc_msgSend(a2, "getArgument:atIndex:", &v13, i + 1);
    objc_msgSend(*(id *)(a1 + 40), "getArgument:atIndex:", &v14, i);
    result = objc_msgSend(*(id *)(a1 + 48), "getArgumentTypeAtIndex:", i);
    if (*(_BYTE *)result != 64)
      break;
    v11 = (_BYTE *)result;
    result = objc_msgSend(v14, "isEqual:", v13);
    if (!(_DWORD)result)
      return result;
    if (*v11 != 64)
      break;
    if (v10 >= *(_QWORD *)(a1 + 64))
      goto LABEL_18;
LABEL_16:
    ;
  }
  if (v10 < *(_QWORD *)(a1 + 64) && v14 == v13)
    goto LABEL_16;
  if (v14 == v13)
  {
LABEL_18:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

id __36___UIAppearance__recorderForSource___block_invoke()
{
  id result;

  qword_1ECD7E198 = (uint64_t)dispatch_queue_create("com.apple.UIKit.UIAppearance.sharedRecorderAccessQueue", 0);
  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  qword_1ECD7E190 = (uint64_t)result;
  return result;
}

id __36___UIAppearance__recorderForSource___block_invoke_96(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)qword_1ECD7E190, "objectForKey:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(_UIAppearanceRecorder);
    return (id)objc_msgSend((id)qword_1ECD7E190, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
  return result;
}

uint64_t __54___UIAppearance__recordersExcludingSource_withWindow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  objc_class *aClass;
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
  if (!*(_QWORD *)(a1 + 32) || (result = objc_msgSend(a2, "isEqual:"), (result & 1) == 0))
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "_windowsForSource:", a2);
    if (!v6 || (result = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 48)), (_DWORD)result))
    {
      result = objc_msgSend(*(id *)(a1 + 40), "_recorderForSource:", a2);
      v17 = (void *)result;
      if (result)
      {
        v7 = objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v20)
        {
          v19 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v27 != v19)
                objc_enumerationMutation(a3);
              v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              aClass = (objc_class *)objc_msgSend(v9, "objectForKey:", CFSTR("_UIAppearanceWrapperKeyClass"));
              if (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:") != v7)
              {
                v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v22 = 0u;
                v23 = 0u;
                v24 = 0u;
                v25 = 0u;
                v11 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("_UIAppearanceWrapperKeyContainerClasses"));
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                if (v12)
                {
                  v13 = v12;
                  v14 = *(_QWORD *)v23;
LABEL_14:
                  v15 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v23 != v14)
                      objc_enumerationMutation(v11);
                    v16 = *(objc_class **)(*((_QWORD *)&v22 + 1) + 8 * v15);
                    if (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v16) == v7)
                      break;
                    objc_msgSend(v10, "addObject:", NSStringFromClass(v16));
                    if (v13 == ++v15)
                    {
                      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                      if (v13)
                        goto LABEL_14;
                      goto LABEL_20;
                    }
                  }
                }
                else
                {
LABEL_20:
                  objc_msgSend(v17, "_recordInvocation:withClassName:containerClassNames:traitCollection:selectorString:forRemoteProcess:", objc_msgSend(v9, "objectForKey:", CFSTR("_UIAppearanceWrapperKeyInvocation")), NSStringFromClass(aClass), v10, objc_msgSend(v9, "objectForKey:", CFSTR("_UIAppearanceWrapperKeyTraitCollection")), objc_msgSend(v9, "objectForKey:", CFSTR("_UIAppearanceWrapperKeySelector")), 1);
                }
              }
            }
            v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          }
          while (v20);
        }
        objc_msgSend(a3, "removeAllObjects");
        return objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);
      }
    }
  }
  return result;
}

uint64_t __45___UIAppearance__removeInvocationsForSource___block_invoke(uint64_t a1, id *a2, void *a3, uint64_t a4)
{
  uint64_t result;

  objc_msgSend(a2, "_removeInvocationsForSource:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend(a2[2], "count");
  if (!result)
    return objc_msgSend(a3, "removeObjectForKey:", a4);
  return result;
}

@end
