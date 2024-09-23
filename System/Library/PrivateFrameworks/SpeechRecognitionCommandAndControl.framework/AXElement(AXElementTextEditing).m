@implementation AXElement(AXElementTextEditing)

- (uint64_t)cacApplyFormatBold
{
  return objc_msgSend(a1, "cacPerformTextOperation:", *MEMORY[0x24BDFF010]);
}

- (uint64_t)cacApplyFormatItalics
{
  return objc_msgSend(a1, "cacPerformTextOperation:", *MEMORY[0x24BDFF048]);
}

- (uint64_t)cacApplyFormatUnderline
{
  return objc_msgSend(a1, "cacPerformTextOperation:", *MEMORY[0x24BDFF0B0]);
}

- (uint64_t)cacPerformTextCopy
{
  return objc_msgSend(a1, "cacPerformTextOperation:", *MEMORY[0x24BDFF018]);
}

- (uint64_t)cacPerformTextCut
{
  return objc_msgSend(a1, "cacPerformTextOperation:", *MEMORY[0x24BDFF020]);
}

- (void)cacPerformTextPaste
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithAXAttribute:", 3065);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__AXElement_AXElementTextEditing__cacPerformTextPaste__block_invoke;
  v6[3] = &unk_24F2ABDF8;
  v6[4] = a1;
  objc_msgSend(v2, "_requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:completionBlock:", 0x6B3CE0810AAF53ALL, v5, v6);

}

- (void)cacPerformTextUndo
{
  _QWORD *v2;
  id v3;

  v2 = (_QWORD *)MEMORY[0x24BDFF0B8];
  if (objc_msgSend(a1, "cacSupportsTextOperation:", *MEMORY[0x24BDFF0B8]))
  {
    objc_msgSend(a1, "cacPerformTextOperation:", *v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shake");

  }
}

- (uint64_t)cacPerformTextRedo
{
  return objc_msgSend(a1, "cacPerformTextOperation:", *MEMORY[0x24BDFF068]);
}

- (void)cacPerformTextSelectAll
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (_QWORD *)MEMORY[0x24BDFF088];
  if (objc_msgSend(a1, "cacSupportsTextOperation:", *MEMORY[0x24BDFF088]))
  {
    objc_msgSend(a1, "cacPerformTextOperation:", *v2);
  }
  else
  {
    objc_msgSend(a1, "cacFirstPosition");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cacLastPosition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACTextMarkerRange markerRangeWithStartMarker:endMarker:](CACTextMarkerRange, "markerRangeWithStartMarker:endMarker:", v5, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cacSetTextSelectionToCACTextMarkerRange:", v4);

  }
}

- (uint64_t)cacSupportsTextOperation:()AXElementTextEditing
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "cacTextOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)cacPerformTextOperation:()AXElementTextEditing
{
  return objc_msgSend(a1, "performAction:withValue:", 2012, a3);
}

- (void)rectForRange:()AXElementTextEditing
{
  if (a3 != 0x7FFFFFFF)
    return (void *)objc_msgSend(result, "boundsForTextRange:");
  return result;
}

- (void)_scrollToVisibleForRange:()AXElementTextEditing
{
  double x;
  double y;
  double width;
  double height;
  void *v8;
  id v9;
  CGRect v10;

  if (a3 != 0x7FFFFFFF)
  {
    objc_msgSend(a1, "boundsForTextRange:");
    x = v10.origin.x;
    y = v10.origin.y;
    width = v10.size.width;
    height = v10.size.height;
    if (!CGRectEqualToRect(v10, *MEMORY[0x24BDBF090]))
    {
      objc_msgSend(a1, "uiElement");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", x, y, width, height);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performAXAction:withValue:", 2039, v8);

    }
  }
}

- (uint64_t)visibleTextRange
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCache:", 2216);

  objc_msgSend(a1, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeWithAXAttribute:", 2216);

  return v4;
}

- (uint64_t)isVisibleTextRange:()AXElementTextEditing
{
  objc_msgSend(a1, "rectForRange:");
  return objc_msgSend(a1, "isVisibleTextRect:");
}

- (BOOL)isVisibleTextRect:()AXElementTextEditing
{
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;

  if (CGRectEqualToRect(*(CGRect *)&a2, *MEMORY[0x24BDBF090]))
    return 0;
  objc_msgSend(a1, "visibleFrame");
  v16.origin.x = v11;
  v16.origin.y = v12;
  v16.size.width = v13;
  v16.size.height = v14;
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  return CGRectIntersectsRect(v15, v16);
}

- (CACTextMarkerRange)cacTextSelectionCACTextMarkerRange
{
  uint64_t v1;
  uint64_t v2;

  v1 = objc_msgSend(a1, "selectedTextRange");
  return +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v1, v2);
}

- (uint64_t)cacSetTextSelectionToRange:()AXElementTextEditing
{
  void *v7;
  uint64_t result;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willProgrammaticallySelectRange:forElement:", a3, a4, a1);

  result = objc_msgSend(a1, "setSelectedTextRange:", a3, a4);
  if (a4)
    return objc_msgSend(a1, "_scrollToVisibleForRange:", a3, a4);
  return result;
}

- (uint64_t)cacSetTextSelectionToCACTextMarkerRange:()AXElementTextEditing
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "nsRange");
  return objc_msgSend(a1, "cacSetTextSelectionToRange:", v4, v5);
}

- (id)cacStringForRange:()AXElementTextEditing
{
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = objc_msgSend(a1, "_numberOfCharacters");
  if (a3 <= v7)
  {
    v8 = 0;
    if (a4 && a3 + a4 <= v7)
    {
      objc_msgSend(a1, "uiElement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateCache:", 2006);

      objc_msgSend(a1, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "substringWithRange:", a3, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)cacString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCache:", 2006);

  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

- (uint64_t)cacStringForCACTextMarkerRange:()AXElementTextEditing
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "nsRange");
  return objc_msgSend(a1, "cacStringForRange:", v4, v5);
}

- (uint64_t)deleteTextAtRange:()AXElementTextEditing
{
  objc_msgSend(a1, "setSelectedTextRange:");
  if (a4)
    objc_msgSend(a1, "_scrollToVisibleForRange:", a3, a4);
  return objc_msgSend(a1, "deleteText");
}

- (uint64_t)deleteTextAtTextMarkerRange:()AXElementTextEditing
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "nsRange");
  return objc_msgSend(a1, "deleteTextAtRange:", v4, v5);
}

- (CACTextMarker)cacFirstPosition
{
  return +[CACTextMarker markerWithIndex:](CACTextMarker, "markerWithIndex:", 0);
}

- (CACTextMarker)cacLastPosition
{
  return +[CACTextMarker markerWithIndex:](CACTextMarker, "markerWithIndex:", objc_msgSend(a1, "_numberOfCharacters"));
}

- (uint64_t)_numberOfCharacters
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCache:", 2006);

  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (uint64_t)lineRangeForPosition:()AXElementTextEditing
{
  void *v4;
  const void *v5;
  CFTypeID v6;
  __int128 v8;

  v8 = xmmword_229AD41D0;
  objc_msgSend(a1, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const void *)objc_msgSend(v4, "objectWithAXAttribute:parameter:", 94009, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3));

  if (!v5)
    return 0x7FFFFFFFLL;
  v6 = CFGetTypeID(v5);
  if (v6 != AXValueGetTypeID() || AXValueGetType((AXValueRef)v5) != kAXValueTypeCFRange)
    return 0x7FFFFFFFLL;
  AXValueGetValue((AXValueRef)v5, kAXValueTypeCFRange, &v8);
  return v8;
}

- (id)textMarkerRangeForSelection
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCache:", 4004);

  objc_msgSend(a1, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithAXAttribute:", 4004);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)textLineEndMarker:()AXElementTextEditing
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCache:", 94003);

  objc_msgSend(a1, "uiElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectWithAXAttribute:parameter:", 94003, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)textLineStartMarker:()AXElementTextEditing
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCache:", 94002);

  objc_msgSend(a1, "uiElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectWithAXAttribute:parameter:", 94002, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)elementForTextMarker:()AXElementTextEditing
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCache:", 94006);

  objc_msgSend(a1, "elementForAttribute:parameter:", 94006, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)textMarkerFrame:()AXElementTextEditing
{
  id v4;
  void *v5;
  const __AXValue *v6;
  CFTypeID v7;
  __int128 v8;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  objc_msgSend(a1, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __AXValue *)objc_msgSend(v5, "objectWithAXAttribute:parameter:", 94000, v4);

  if (v6 && (v7 = CFGetTypeID(v6), v7 == AXValueGetTypeID()))
  {
    v10 = 0u;
    v11 = 0u;
    AXValueGetValue(v6, kAXValueTypeCGRect, &v10);
  }
  else
  {
    v8 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v10 = *MEMORY[0x24BDBF090];
    v11 = v8;
  }
  return *(double *)&v10;
}

- (uint64_t)rangeForTextMarker:()AXElementTextEditing
{
  id v4;
  void *v5;
  const void *v6;
  CFTypeID v7;
  __int128 v9;

  v9 = xmmword_229AD41D0;
  v4 = a3;
  objc_msgSend(a1, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)objc_msgSend(v5, "objectWithAXAttribute:parameter:", 94012, v4);

  if (v6)
  {
    v7 = CFGetTypeID(v6);
    if (v7 == AXValueGetTypeID() && AXValueGetType((AXValueRef)v6) == kAXValueTypeCFRange)
      AXValueGetValue((AXValueRef)v6, kAXValueTypeCFRange, &v9);
  }
  return v9;
}

- (uint64_t)rangeForTextMarkers:()AXElementTextEditing
{
  id v4;
  void *v5;
  const void *v6;
  CFTypeID v7;
  __int128 v9;

  v9 = xmmword_229AD41D0;
  v4 = a3;
  objc_msgSend(a1, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)objc_msgSend(v5, "objectWithAXAttribute:parameter:", 94017, v4);

  if (v6)
  {
    v7 = CFGetTypeID(v6);
    if (v7 == AXValueGetTypeID() && AXValueGetType((AXValueRef)v6) == kAXValueTypeCFRange)
      AXValueGetValue((AXValueRef)v6, kAXValueTypeCFRange, &v9);
  }
  return v9;
}

- (id)objectForRange:()AXElementTextEditing withParameterizedAttribute:
{
  AXValueRef v7;
  AXValueRef v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[0] = a3;
  v12[1] = a4;
  v7 = AXValueCreate(kAXValueTypeCFRange, v12);
  if (!v7)
    return 0;
  v8 = v7;
  objc_msgSend(a1, "uiElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectWithAXAttribute:parameter:", a5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(v8);
  return v10;
}

- (id)textMarkersForRange:()AXElementTextEditing
{
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForRange:withParameterizedAttribute:", a3, a4, 94014);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

@end
