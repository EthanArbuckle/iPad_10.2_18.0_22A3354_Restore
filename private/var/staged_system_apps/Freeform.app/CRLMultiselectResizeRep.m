@implementation CRLMultiselectResizeRep

- (CRLMultiselectResizeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  CRLMultiselectResizeRep *v4;
  CRLMultiselectResizeRep *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLMultiselectResizeRep;
  v4 = -[CRLCanvasRep initWithLayout:canvas:](&v8, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_viewScaleForCurrentLayerRelativePath = 0.0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v4, "interactiveCanvasController"));
    objc_msgSend(v6, "addDecorator:", v5);

  }
  return v5;
}

- (void)selectionDidChange
{
  id v3;

  -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v3, "invalidateFrame");

}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return 0;
}

- (id)repForRotating
{
  void *v3;
  unsigned int v4;
  CRLMultiselectResizeRep *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = objc_msgSend(v3, "supportsRotation");

  if (v4)
    v5 = self;
  else
    v5 = 0;
  return v5;
}

- (BOOL)shouldShowKnobs
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = objc_msgSend(v3, "isInDynamicOperation");

  return v4 ^ 1 | -[CRLMultiselectResizeRep p_representedSelectedLayoutInLayoutState:](self, "p_representedSelectedLayoutInLayoutState:", 4);
}

- (BOOL)shouldCreateSelectionKnobs
{
  unsigned __int8 v3;
  unsigned __int8 v4;

  v3 = -[CRLMultiselectResizeRep p_representedSelectedLayoutInLayoutState:](self, "p_representedSelectedLayoutInLayoutState:", 2);
  v4 = -[CRLMultiselectResizeRep p_representedSelectedLayoutInLayoutState:](self, "p_representedSelectedLayoutInLayoutState:", 3);
  return (v3 | v4 | -[CRLMultiselectResizeRep p_representedSelectedLayoutInLayoutState:](self, "p_representedSelectedLayoutInLayoutState:", 5)) ^ 1;
}

- (BOOL)shouldCreateConnectionLineKnobs
{
  return 0;
}

- (BOOL)shouldShowSelectionHighlight
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = objc_msgSend(v2, "isInDynamicOperation") ^ 1;

  return v3;
}

- (void)documentModeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLMultiselectResizeRep;
  -[CRLCanvasRep documentModeDidChange](&v3, "documentModeDidChange");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
}

- (void)willBeRemoved
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "removeDecorator:", self);

  v4.receiver = self;
  v4.super_class = (Class)CRLMultiselectResizeRep;
  -[CRLCanvasRep willBeRemoved](&v4, "willBeRemoved");
}

- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable
{
  return 1;
}

- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4
{
  return 3;
}

- (NSArray)decoratorOverlayRenderables
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)p_multiselectLayout
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLMultiselectResizeLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (BOOL)p_representedSelectedLayoutInLayoutState:(int)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeRep p_multiselectLayout](self, "p_multiselectLayout", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representedSelectedLayouts"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "layoutState") == a3)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)dynamicResizeDidBegin
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CRLMultiselectResizeRep *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)CRLMultiselectResizeRep;
  v3 = -[CRLCanvasRep dynamicResizeDidBegin](&v17, "dynamicResizeDidBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeRep p_representedSelectedReps](self, "p_representedSelectedReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(CRLMultiselectResizeRep **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        if (v10 != self && objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "isSelected"))
          v11 = -[CRLMultiselectResizeRep dynamicResizeDidBegin](v10, "dynamicResizeDidBegin");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CRLMultiselectResizeRep *v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeRep p_representedSelectedReps](self, "p_representedSelectedReps"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(CRLMultiselectResizeRep **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        if (v10 != self && objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "isSelected"))
          objc_msgSend(v4, "applyNewBoundsToRep:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v12.receiver = self;
  v12.super_class = (Class)CRLMultiselectResizeRep;
  -[CRLCanvasRep dynamicResizeDidEndWithTracker:](&v12, "dynamicResizeDidEndWithTracker:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v11, "invalidatePosition");

}

- (BOOL)willHandleResizingLayoutForRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

  return v5 == v6;
}

- (id)p_representedSelectedReps
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform24CRLMultiselectResizeInfo, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "representedSelectedBoardItems", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "repForInfo:", v16));
        objc_msgSend(v3, "addObject:", v18);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v3;
}

- (id)additionalRepsToResize
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform24CRLMultiselectResizeInfo, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "representedSelectedBoardItems", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "repForInfo:", v16));
        objc_msgSend(v3, "addObject:", v18);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v3;
}

@end
