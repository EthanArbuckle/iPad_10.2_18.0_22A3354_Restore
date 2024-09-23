@implementation TSDCanvasView(SXAccessibility)

- (id)sxaxNextSpeakThisElementFromElement:()SXAccessibility
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_speakThisElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 >= objc_msgSend(v5, "count") - 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (uint64_t)accessibilityElementsHidden
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)TSDCanvasView_0;
  if ((objc_msgSendSuper2(&v3, sel_accessibilityElementsHidden) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_isInPreviewPlatter");
}

- (id)_speakThisElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
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

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topLevelReps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v11, "_accessibilityIsSpeakThisElement"))
          objc_msgSend(v2, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BEBADC8], "defaultSpeakScreenOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithOptions:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v13;
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
        if (objc_msgSend(v19, "_accessibilityIsSpeakThisElement", (_QWORD)v22)
          && (objc_msgSend(v2, "containsObject:", v19) & 1) == 0)
        {
          objc_msgSend(v2, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_46);
  v20 = (void *)objc_msgSend(v2, "copy");

  return v20;
}

- (uint64_t)_isInPreviewPlatter
{
  Class v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  v2 = NSClassFromString(CFSTR("_UIPlatterTransformView"));
  if (!v2)
  {
    v2 = NSClassFromString(CFSTR("_UIPlatterView"));
    if (!v2)
      return 0;
  }
  objc_msgSend(a1, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__TSDCanvasView_SXAccessibility___isInPreviewPlatter__block_invoke;
  v8[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v8[4] = v2;
  objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("sourceView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = objc_msgSend(a1, "isDescendantOfView:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
