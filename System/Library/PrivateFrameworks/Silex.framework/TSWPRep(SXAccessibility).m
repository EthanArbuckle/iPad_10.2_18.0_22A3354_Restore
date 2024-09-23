@implementation TSWPRep(SXAccessibility)

- (uint64_t)isAccessibilityElement
{
  return objc_msgSend(a1, "sxax_shouldBeOccluded") ^ 1;
}

- (id)accessibilityAttributedValue
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  _QWORD v28[5];
  id v29;

  objc_msgSend(a1, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "range");
  objc_msgSend(v2, "substringWithRange:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v5);
  objc_msgSend(a1, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "range");
  v10 = v9;
  v11 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __56__TSWPRep_SXAccessibility__accessibilityAttributedValue__block_invoke;
  v28[3] = &unk_24D688B70;
  v28[4] = a1;
  v12 = v6;
  v29 = v12;
  objc_msgSend(v7, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v8, v10, v28);

  v13 = objc_msgSend(v5, "length");
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  objc_msgSend(a1, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a1, "range");
  v17 = v16;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __56__TSWPRep_SXAccessibility__accessibilityAttributedValue__block_invoke_2;
  v22[3] = &unk_24D688B98;
  v18 = v12;
  v25 = 0;
  v26 = v13;
  v23 = v18;
  v24 = v27;
  objc_msgSend(v14, "enumerateWithAttributeKind:inRange:usingBlock:", 2, v15, v17, v22);

  v19 = v23;
  v20 = v18;

  _Block_object_dispose(v27, 8);
  return v20;
}

- (id)accessibilityLanguage
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "range");
  objc_msgSend(v2, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v3, v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x219A06CD0](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilityNextElementsForSpeakThis
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "interactiveCanvasController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(a1, "interactiveCanvasController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sxaxNextSpeakThisElementFromElement:", a1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v11[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)TSWPRep_0;
    objc_msgSendSuper2(&v10, sel__accessibilityNextElementsForSpeakThis);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (uint64_t)accessibilityLineNumberForPoint:()SXAccessibility
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint v27;
  CGPoint v28;
  CGRect v29;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "countLines");
        if (v12 >= 1)
        {
          v13 = v12;
          v14 = 0;
          v15 = v12 + v8;
          while (1)
          {
            objc_msgSend(v11, "boundsOfLineFragmentAtIndex:", v14);
            v28.x = a2;
            v28.y = a3;
            if (CGRectContainsPoint(v29, v28))
              break;
            if (v13 == ++v14)
            {
              v8 = v15;
              goto LABEL_11;
            }
          }
          v19 = v8 + v14;
          goto LABEL_15;
        }
LABEL_11:
        ;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v7)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep(SXAccessibility) accessibilityLineNumberForPoint:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/TSWPRep+SXAccessibility.m");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27.x = a2;
  v27.y = a3;
  NSStringFromCGPoint(v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 92, CFSTR("Line not found for natural point: %@"), v18);

  v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v19;
}

- (id)accessibilityContentForLineNumber:()SXAccessibility
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "_STAXColumnForLineIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfLineFragmentAtIndex:", a3);
  v8 = v7;
  objc_msgSend(a1, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)accessibilityFrameForLineNumber:()SXAccessibility
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "_STAXColumnForLineIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundsOfLineFragmentAtIndex:", a3);
  objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:");
  v7 = v6;

  return v7;
}

- (id)_STAXColumnForLineIndex:()SXAccessibility
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep(SXAccessibility) _STAXColumnForLineIndex:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/TSWPRep+SXAccessibility.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 116, CFSTR("Invalid line index"));

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "columns", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 += objc_msgSend(v14, "countLines");
        if (v11 > (uint64_t)a3)
        {
          v15 = v14;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (double)_accessibilityFrameForRange:()SXAccessibility
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v2 = objc_msgSend(a1, "sxaxStorageRelativeRangeFromRepRelativeRange:");
  v4 = v3;
  objc_msgSend(a1, "_STAXColumnForStorageRelativeCharIndex:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB3B68], "selectionWithRange:", v2, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rectsForSelection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGRectValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:", v10, v12, v14, v16);
    v18 = v17;

  }
  else
  {
    v18 = *MEMORY[0x24BDBF090];
  }

  return v18;
}

- (uint64_t)sxaxStorageRelativeRangeFromRepRelativeRange:()SXAccessibility
{
  return objc_msgSend(a1, "range") + a3;
}

- (uint64_t)sxaxRepRelativeRangeFromStorageRelativeRange:()SXAccessibility
{
  return a3 - objc_msgSend(a1, "range");
}

- (uint64_t)_accessibilitySelectedTextRange
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "selection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v3, v4);

  return v5;
}

- (void)_accessibilitySetSelectedTextRange:()SXAccessibility
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = objc_msgSend(a1, "sxaxStorageRelativeRangeFromRepRelativeRange:");
  objc_msgSend(MEMORY[0x24BEB3B68], "selectionWithRange:", v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(a1, "interactiveCanvasController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginEditingRep:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSelection:", v7);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], 0);

}

- (uint64_t)_accessibilityLineStartPosition
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a1, "selection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;
  v6 = *MEMORY[0x24BEB3BF0];
  v7 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);

  if (v6 == v3 && v7 == v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a1, "selection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "range");
  v12 = v11 + v10 - 1;

  v13 = objc_msgSend(a1, "_sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:", v12);
  return objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v13, v14);
}

- (uint64_t)_accessibilityLineRangeForPosition:()SXAccessibility
{
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "range");
  if (v5 < a3)
    return *MEMORY[0x24BEB3BF0];
  if (a3)
  {
    objc_msgSend(a1, "range");
    v8 = a3 - (v7 == a3);
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(a1, "_sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:", objc_msgSend(a1, "sxaxStorageRelativeRangeFromRepRelativeRange:", v8, 0));
  return objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v9, v10);
}

- (uint64_t)_accessibilityLineEndPosition
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "selection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v3 + v4;

  v6 = objc_msgSend(a1, "_sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:", v5);
  v8 = objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v6, v7);
  return v8 + v9;
}

- (unint64_t)_sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:()SXAccessibility
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = *MEMORY[0x24BEB3BF0];
  objc_msgSend(a1, "_STAXColumnForStorageRelativeCharIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "countLines");
    if (v7 >= 1)
    {
      v8 = v7;
      v9 = 0;
      while (1)
      {
        v10 = objc_msgSend(v6, "rangeOfLineFragmentAtIndex:", v9);
        if (v10 <= a3 && v10 + v11 > a3)
          break;
        if (v8 == ++v9)
          goto LABEL_9;
      }
      v4 = v10;
    }
  }
LABEL_9:

  return v4;
}

- (id)_STAXColumnForStorageRelativeCharIndex:()SXAccessibility
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "columns", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "range") <= a3)
        {
          v10 = objc_msgSend(v9, "range");
          if (v10 + v11 > a3)
          {
            v12 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (uint64_t)_accessibilityRangeForLineNumber:()SXAccessibility
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3 & ~(a3 >> 63);
  objc_msgSend(a1, "_STAXColumnForLineIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfLineFragmentAtIndex:", v4);
  v8 = objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v6, v7);

  return v8;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:()SXAccessibility
{
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t i;
  void *v18;
  NSRange v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  NSRange v40;
  NSRange v41;
  NSRange v42;
  NSRange v43;

  v39 = *MEMORY[0x24BDAC8D0];
  if (!a4 || (objc_msgSend(a1, "hasBeenRemoved") & 1) != 0)
    return MEMORY[0x24BDBD1A8];
  v33 = (void *)objc_opt_new();
  objc_msgSend(a1, "range");
  if (a3 <= v8)
  {
    v15 = objc_msgSend(a1, "sxaxStorageRelativeRangeFromRepRelativeRange:", a3, a4);
    v30 = v16;
    v31 = v15;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(a1, "columns");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v32)
    {
      v29 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v40.location = objc_msgSend(v18, "range");
          v42.length = v30;
          v42.location = v31;
          v19 = NSIntersectionRange(v40, v42);
          if (v19.length)
          {
            v20 = objc_msgSend(v18, "lineIndexForCharIndex:eol:", v19.location, 0);
            v21 = objc_msgSend(v18, "lineIndexForCharIndex:eol:", v19.length + v19.location - 1, 0);
            if (v20 <= v21)
            {
              v22 = v21;
              do
              {
                v41.location = objc_msgSend(v18, "rangeOfLineFragmentAtIndex:", v20);
                v43 = v19;
                v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3B68]), "initWithRange:", NSIntersectionRange(v41, v43).location, v41.length);
                objc_msgSend(a1, "rectForSelection:", v23);
                if (v24 * v25 > 0.0)
                {
                  objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:");
                  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "addObject:", v26);

                }
                ++v20;
              }
              while (v20 <= v22);
            }
          }
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v32);
    }

  }
  else
  {
    objc_msgSend(a1, "_accessibilityNextElementsForSpeakThis");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "range");
        objc_msgSend(v10, "_accessibilityTextRectsForSpeakThisStringRange:", a3 - v11, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObjectsFromArray:", v12);

      }
      if (!objc_msgSend(v33, "count"))
      {
        v13 = (void *)MEMORY[0x24BDD1968];
        objc_msgSend(v10, "accessibilityFrame");
        objc_msgSend(v13, "valueWithCGRect:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v14);

      }
    }

  }
  v27 = (void *)objc_msgSend(v33, "copy");

  return v27;
}

- (uint64_t)_accessibilitySpeakThisShouldScrollTextRects
{
  return 1;
}

- (id)_accessibilityRawRangeForUITextRange:()SXAccessibility
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  TSUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (id)objc_msgSend(v5, "range");
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)TSWPRep_0;
    v7 = objc_msgSendSuper2(&v10, sel__accessibilityRawRangeForUITextRange_, v4);
  }
  v8 = v7;

  return v8;
}

- (uint64_t)_accessibilityTextRangeFromNSRange:()SXAccessibility
{
  return objc_msgSend(MEMORY[0x24BEB3AC0], "textRangeWithRange:");
}

- (uint64_t)_accessibilityHasTextOperations
{
  return 1;
}

- (id)_accessibilityTextOperations
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSString *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sxaxTextInputEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sxaxSupportedEditRotorActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(NSString **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v3, "canPerformEditorAction:withSender:", NSSelectorFromString(v9), 0))
        {
          objc_msgSend(a1, "sxaxNameForEditRotorAction:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  v11 = (void *)objc_msgSend(v2, "copy");

  return v11;
}

- (uint64_t)accessibilityEditOperationAction:()SXAccessibility
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  SEL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "sxaxSupportedEditRotorActions");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(NSString **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      objc_msgSend(a1, "sxaxNameForEditRotorAction:", v10, (_QWORD)v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = NSSelectorFromString(v10);

    if (v15)
    {
      objc_msgSend(a1, "interactiveCanvasController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "makeEditorPerformAction:withSender:", v15, 0);
      v13 = 1;
      goto LABEL_12;
    }
    v13 = 0;
  }
  else
  {
LABEL_9:
    v13 = 0;
    v14 = v5;
LABEL_12:

  }
  return v13;
}

- (id)_sxaxTextInputEditor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  objc_msgSend(a1, "interactiveCanvasController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputEditor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)sxaxSupportedEditRotorActions
{
  return &unk_24D702FC0;
}

- (id)sxaxNameForEditRotorAction:()SXAccessibility
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("copy:")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Copy");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("selectAll:")))
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Select all");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D68E0F8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (uint64_t)_accessibilityIsSpeakThisElement
{
  return 1;
}

@end
