@implementation SXTextTangierFlowRep

- (id)storage
{
  void *v2;
  void *v3;

  -[SXTextTangierFlowRep info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)wpEditorClass
{
  return (Class)objc_opt_class();
}

- (BOOL)forceTiling
{
  return 1;
}

- (BOOL)preventClipToColumn
{
  return 1;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGPoint v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v29 = *MEMORY[0x24BDAC8D0];
  v22 = a4;
  v9 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[SXTextTangierFlowRep childReps](self, "childReps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "layout");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "geometry");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "frame");
          v30.x = x;
          v30.y = y;
          v18 = CGRectContainsPoint(v31, v30);

          if (v18)
          {

            v20 = 0;
            v19 = v22;
            goto LABEL_12;
          }
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
        continue;
      break;
    }
  }

  v23.receiver = self;
  v23.super_class = (Class)SXTextTangierFlowRep;
  v19 = v22;
  -[SXTextTangierFlowRep hitRep:withGesture:passingTest:](&v23, sel_hitRep_withGesture_passingTest_, v22, v9, x, y);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v20;
}

- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v7;
  uint64_t v8;
  BOOL v10;

  v5 = a5;
  v7 = objc_msgSend(a3, "range");
  if (v5 && v7 <= a4)
    return v7 + v8 > a4;
  v10 = v7 + v8 >= a4;
  if (v7 >= a4)
    v10 = 0;
  return !v5 && v10;
}

- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4
{
  _BOOL8 v4;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  if (-[SXTextTangierFlowRep p_doesRep:containCharIndex:isStart:](self, "p_doesRep:containCharIndex:isStart:", self, a3, a4))
  {
    return self;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SXTextTangierFlowRep siblings](self, "siblings", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[SXTextTangierFlowRep p_doesRep:containCharIndex:isStart:](self, "p_doesRep:containCharIndex:isStart:", v13, a3, v4))
        {
          v14 = v13;

          return v14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  return 0;
}

- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(int)a5
{
  _BOOL4 v6;
  id v8;
  unint64_t result;
  void *v10;
  unint64_t v11;
  void *v13;
  int v14;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SXTextTangierFlowRep;
  v8 = -[SXTextTangierFlowRep charIndexForPointWithPinning:isTail:selectionType:](&v15, sel_charIndexForPointWithPinning_isTail_selectionType_, a3.x, a3.y);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[SXTextTangierFlowRep storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    if (a5 == 7 && (unint64_t)v8 < v11 && v6)
    {
      -[SXTextTangierFlowRep storage](self, "storage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "characterAtIndex:", v8);

      if (v14 != 10)
        return (unint64_t)v8;
      -[SXTextTangierFlowRep storage](self, "storage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v10, "previousCharacterIndex:", v8);
    }

    return (unint64_t)v8;
  }
  return result;
}

- (id)siblings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[SXTextTangierFlowRep orderedSiblings](self, "orderedSiblings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)orderedSiblings
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SXTextTangierFlowRep canvas](self, "canvas", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topLevelReps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        TSUDynamicCast();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "storage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXTextTangierFlowRep storage](self, "storage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (BOOL)updateFromVisualPosition
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  CGRect v22;
  CGRect v23;

  -[SXTextTangierFlowRep layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SXTextTangierFlowRep frameInCanvas](self, "frameInCanvas");
  v23.origin.x = v13;
  v23.origin.y = v14;
  v23.size.width = v15;
  v23.size.height = v16;
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  v17 = CGRectEqualToRect(v22, v23);

  if (!v17)
  {
    v18 = objc_alloc(MEMORY[0x24BEB3AA8]);
    -[SXTextTangierFlowRep frameInCanvas](self, "frameInCanvas");
    v19 = (void *)objc_msgSend(v18, "initWithFrame:");
    -[SXTextTangierFlowRep layout](self, "layout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setGeometry:", v19);

  }
  return !v17;
}

- (void)dealloc
{
  objc_super v3;

  -[SXTextTangierFlowRep _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierFlowRep;
  -[SXTextTangierFlowRep dealloc](&v3, sel_dealloc);
}

- (id)supportedCustomRotors
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  -[SXTextTangierFlowRep accessibilityDataSource](self, "accessibilityDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityCustomRotorMembershipForRep:", self);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[SXTextTangierFlowRep storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SXTextTangierFlowRep range](self, "range");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__SXTextTangierFlowRep_supportedCustomRotors__block_invoke;
  v9[3] = &unk_24D68DB20;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v5, v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __45__SXTextTangierFlowRep_supportedCustomRotors__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "linkRotor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "linkRotor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v8);

  }
  v9 = objc_msgSend(v12, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  *a5 = 1;
}

- (id)itemsForCustomRotor:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXTextTangierFlowRep headingsRotor](self, "headingsRotor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    -[SXTextTangierFlowRep headingsRotor](self, "headingsRotor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6798]), "initWithTargetElement:targetRange:", self, 0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithObject:", v9);

      goto LABEL_17;
    }
  }
  else
  {

  }
  -[SXTextTangierFlowRep linkRotor](self, "linkRotor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v4)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_17;
  }
  -[SXTextTangierFlowRep linkRotor](self, "linkRotor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_5;
  -[SXTextTangierFlowRep sxaxLinkElements](self, "sxaxLinkElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        v19 = objc_alloc(MEMORY[0x24BDF6798]);
        v20 = (void *)objc_msgSend(v19, "initWithTargetElement:targetRange:", v18, 0, (_QWORD)v22);
        objc_msgSend(v12, "addObject:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  v7 = (void *)objc_msgSend(v12, "copy");
LABEL_17:

  return v7;
}

- (id)sxaxLinkElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  SXTextTangierFlowRep *v16;
  id v17;

  -[SXTextTangierFlowRep _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("SXAXLinkElementsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    -[SXTextTangierFlowRep storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SXTextTangierFlowRep range](self, "range");
    v8 = v7;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __40__SXTextTangierFlowRep_sxaxLinkElements__block_invoke;
    v15 = &unk_24D688B70;
    v16 = self;
    v17 = v4;
    v9 = v4;
    objc_msgSend(v5, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v6, v8, &v12);

    v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15, v16);
    -[SXTextTangierFlowRep _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v10, CFSTR("SXAXLinkElementsKey"));

    v3 = (void *)v10;
  }
  return v3;
}

void __40__SXTextTangierFlowRep_sxaxLinkElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SXTextLinkAccessibilityElement *v4;
  id v5;

  v3 = a2;
  objc_opt_class();
  TSUDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4 = -[SXTextLinkAccessibilityElement initWithHyperlinkField:parentRep:]([SXTextLinkAccessibilityElement alloc], "initWithHyperlinkField:parentRep:", v5, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
}

- (id)automationElements
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[SXTextTangierFlowRep sxaxLinkElements](self, "sxaxLinkElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SXTextTangierFlowRep;
    -[SXTextTangierFlowRep automationElements](&v7, sel_automationElements);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  objc_super v6;

  -[SXTextTangierFlowRep info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSpeakableContent");

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)SXTextTangierFlowRep;
  return -[TSWPRep isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  y = a3.y;
  x = a3.x;
  v20 = *MEMORY[0x24BDAC8D0];
  -[SXTextTangierFlowRep accessibilityElements](self, "accessibilityElements");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "accessibilityHitTest:", x, y);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  v14.receiver = self;
  v14.super_class = (Class)SXTextTangierFlowRep;
  -[SXTextTangierFlowRep accessibilityHitTest:](&v14, sel_accessibilityHitTest_, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CGRect)accessibilityFrameForScrolling
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGRect result;

  v37.receiver = self;
  v37.super_class = (Class)SXTextTangierFlowRep;
  -[SXTextTangierFlowRep accessibilityFrameForScrolling](&v37, sel_accessibilityFrameForScrolling);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SXTextTangierFlowRep _accessibilityScrollParent](self, "_accessibilityScrollParent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInset");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "adjustedContentInset");
  if (v15 == v23 && v13 == v20 && v19 == v22 && v17 == v21)
  {
    objc_msgSend(v11, "safeAreaInsets");
    v28 = fmin(-v27, 0.0);
    v30 = fmin(-v29, 0.0);
    v4 = v4 + v30;
    v6 = v6 + v28;
    v8 = v8 - (v30 + fmin(-v32, 0.0));
    v10 = v10 - (v28 + fmin(-v31, 0.0));
  }

  v33 = v4;
  v34 = v6;
  v35 = v8;
  v36 = v10;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXTextTangierFlowRep;
  v3 = -[SXTextTangierFlowRep accessibilityTraits](&v10, sel_accessibilityTraits);
  -[SXTextTangierFlowRep accessibilityDataSource](self, "accessibilityDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityCustomRotorMembershipForRep:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextTangierFlowRep headingsRotor](self, "headingsRotor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  v8 = *MEMORY[0x24BDF73C0];
  if (!v7)
    v8 = 0;
  return v8 | v3;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v3;
  int v4;
  id v5;
  NSUInteger v6;
  objc_super v7;
  _NSRange result;

  -[SXTextTangierFlowRep accessibilityDataSource](self, "accessibilityDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityRepIsSelectable:", self);

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SXTextTangierFlowRep;
    v5 = -[TSWPRep _accessibilitySelectedTextRange](&v7, sel__accessibilitySelectedTextRange);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  int v7;
  objc_super v8;

  length = a3.length;
  location = a3.location;
  -[SXTextTangierFlowRep accessibilityDataSource](self, "accessibilityDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accessibilityRepIsSelectable:", self);

  if (v7)
  {
    v8.receiver = self;
    v8.super_class = (Class)SXTextTangierFlowRep;
    -[TSWPRep _accessibilitySetSelectedTextRange:](&v8, sel__accessibilitySetSelectedTextRange_, location, length);
  }
}

- (id)accessibilityNextTextNavigationElement
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  -[SXTextTangierFlowRep orderedSiblings](self, "orderedSiblings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v5 = v4, v4 >= objc_msgSend(v3, "count") - 1))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)accessibilityPreviousTextNavigationElement
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[SXTextTangierFlowRep orderedSiblings](self, "orderedSiblings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self);
  v5 = 0;
  if (v4 && v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4 - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)accessibilitySupportsTextSelection
{
  SXTextTangierFlowRep *v2;
  void *v3;

  v2 = self;
  -[SXTextTangierFlowRep accessibilityDataSource](self, "accessibilityDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "accessibilityRepIsSelectable:", v2);

  return (char)v2;
}

- (id)sxaxSupportedEditRotorActions
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SXTextTangierFlowRep;
  -[TSWPRep sxaxSupportedEditRotorActions](&v7, sel_sxaxSupportedEditRotorActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObjectsFromArray:", v4);
  if ((objc_msgSend(v3, "containsObject:", CFSTR("lookup:")) & 1) == 0)
    objc_msgSend(v3, "addObject:", CFSTR("lookup:"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)sxaxNameForEditRotorAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lookup:")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Lookup"), &stru_24D68E0F8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SXTextTangierFlowRep;
    -[TSWPRep sxaxNameForEditRotorAction:](&v8, sel_sxaxNameForEditRotorAction_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (SXTextTangierRepAccessibilityDataSource)accessibilityDataSource
{
  return (SXTextTangierRepAccessibilityDataSource *)objc_loadWeakRetained((id *)&self->accessibilityDataSource);
}

- (void)setAccessibilityDataSource:(id)a3
{
  objc_storeWeak((id *)&self->accessibilityDataSource, a3);
}

- (SXAXCustomRotor)linkRotor
{
  return self->_linkRotor;
}

- (void)setLinkRotor:(id)a3
{
  objc_storeStrong((id *)&self->_linkRotor, a3);
}

- (SXAXCustomRotor)headingsRotor
{
  return self->_headingsRotor;
}

- (void)setHeadingsRotor:(id)a3
{
  objc_storeStrong((id *)&self->_headingsRotor, a3);
}

- (SXTextTangierInteractiveCanvasController)icc
{
  return (SXTextTangierInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_icc);
}

- (void)setIcc:(id)a3
{
  objc_storeWeak((id *)&self->_icc, a3);
}

- (CGRect)frameInCanvas
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameInCanvas.origin.x;
  y = self->_frameInCanvas.origin.y;
  width = self->_frameInCanvas.size.width;
  height = self->_frameInCanvas.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameInCanvas:(CGRect)a3
{
  self->_frameInCanvas = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_headingsRotor, 0);
  objc_storeStrong((id *)&self->_linkRotor, 0);
  objc_destroyWeak((id *)&self->accessibilityDataSource);
}

@end
