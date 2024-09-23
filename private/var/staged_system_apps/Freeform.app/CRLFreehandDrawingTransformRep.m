@implementation CRLFreehandDrawingTransformRep

- (CRLFreehandDrawingTransformRep)initWithLayout:(id)a3 canvas:(id)a4
{
  CRLFreehandDrawingTransformRep *v4;
  CRLFreehandDrawingTransformRep *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingTransformRep;
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

- (void)invalidateSubselectionAffordance
{
  CRLBezierPath *currentLayerRelativePath;
  id v4;

  currentLayerRelativePath = self->_currentLayerRelativePath;
  self->_currentLayerRelativePath = 0;

  self->_viewScaleForCurrentLayerRelativePath = 0.0;
  -[CRLCanvasRenderable removeAnimationForKey:](self->_blackPathRenderable, "removeAnimationForKey:", CFSTR("linePhase"));
  -[CRLCanvasRenderable removeAnimationForKey:](self->_whitePathRenderable, "removeAnimationForKey:", CFSTR("linePhase"));
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "invalidateOverlayLayersForRep:", self);

}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return 0;
}

- (BOOL)pathContainsPoint:(CGPoint)a3
{
  CRLBezierPath *currentLayerRelativePath;

  currentLayerRelativePath = self->_currentLayerRelativePath;
  if (currentLayerRelativePath)
    LOBYTE(currentLayerRelativePath) = -[CRLBezierPath containsPoint:](currentLayerRelativePath, "containsPoint:", a3.x, a3.y);
  return (char)currentLayerRelativePath;
}

- (id)overlayRenderables
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  CRLCanvasShapeRenderable *blackPathRenderable;
  void *v10;
  CRLCanvasShapeRenderable *v11;
  CRLCanvasShapeRenderable *v12;
  void *v13;
  CRLCanvasShapeRenderable *v14;
  void *v15;
  CRLCanvasShapeRenderable *whitePathRenderable;
  void *v17;
  CRLCanvasShapeRenderable *v18;
  CRLCanvasShapeRenderable *v19;
  void *v20;
  CRLCanvasShapeRenderable *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  CRLBezierPath *v26;
  CRLBezierPath *currentLayerRelativePath;
  _BOOL8 v28;
  CRLCanvasShapeRenderable *v29;
  void *v30;
  uint64_t v31;
  objc_super v33;
  _QWORD v34[2];

  v33.receiver = self;
  v33.super_class = (Class)CRLFreehandDrawingTransformRep;
  v3 = -[CRLCanvasRep overlayRenderables](&v33, "overlayRenderables");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  if (-[CRLFreehandDrawingTransformRep p_shouldDisplayAnimatedSelectionOutline](self, "p_shouldDisplayAnimatedSelectionOutline"))
  {
    v8 = +[CRLFreehandDrawingToolMarquee wasLastMarqueeClockwise](CRLFreehandDrawingToolMarquee, "wasLastMarqueeClockwise");
    blackPathRenderable = self->_blackPathRenderable;
    if (!blackPathRenderable)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      v11 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingToolMarquee dottedMarqueeRenderableOfColor:offsetDashes:](CRLFreehandDrawingToolMarquee, "dottedMarqueeRenderableOfColor:offsetDashes:", v10, 0));
      v12 = self->_blackPathRenderable;
      self->_blackPathRenderable = v11;

      blackPathRenderable = self->_blackPathRenderable;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable animationForKey:](blackPathRenderable, "animationForKey:", CFSTR("linePhase")));

    if (!v13)
    {
      v14 = self->_blackPathRenderable;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingToolMarquee dottedMarqueeRenderableAnimationWithOffsetDashes:clockwise:](CRLFreehandDrawingToolMarquee, "dottedMarqueeRenderableAnimationWithOffsetDashes:clockwise:", 0, v8));
      -[CRLCanvasRenderable addAnimation:forKey:](v14, "addAnimation:forKey:", v15, CFSTR("linePhase"));

    }
    whitePathRenderable = self->_whitePathRenderable;
    if (!whitePathRenderable)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
      v18 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingToolMarquee dottedMarqueeRenderableOfColor:offsetDashes:](CRLFreehandDrawingToolMarquee, "dottedMarqueeRenderableOfColor:offsetDashes:", v17, 1));
      v19 = self->_whitePathRenderable;
      self->_whitePathRenderable = v18;

      whitePathRenderable = self->_whitePathRenderable;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable animationForKey:](whitePathRenderable, "animationForKey:", CFSTR("linePhase")));

    if (!v20)
    {
      v21 = self->_whitePathRenderable;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingToolMarquee dottedMarqueeRenderableAnimationWithOffsetDashes:clockwise:](CRLFreehandDrawingToolMarquee, "dottedMarqueeRenderableAnimationWithOffsetDashes:clockwise:", 1, v8));
      -[CRLCanvasRenderable addAnimation:forKey:](v21, "addAnimation:forKey:", v22, CFSTR("linePhase"));

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v23, "viewScale");
    v25 = v24;

    if (!self->_currentLayerRelativePath || v25 != self->_viewScaleForCurrentLayerRelativePath)
    {
      v26 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformRep p_calculateLayerRelativePathForAffordance](self, "p_calculateLayerRelativePathForAffordance"));
      currentLayerRelativePath = self->_currentLayerRelativePath;
      self->_currentLayerRelativePath = v26;

      -[CRLCanvasShapeRenderable setPath:](self->_blackPathRenderable, "setPath:", -[CRLBezierPath CGPath](self->_currentLayerRelativePath, "CGPath"));
      -[CRLCanvasShapeRenderable setPath:](self->_whitePathRenderable, "setPath:", -[CRLBezierPath CGPath](self->_currentLayerRelativePath, "CGPath"));
      self->_viewScaleForCurrentLayerRelativePath = v25;
    }
    v28 = +[CATransaction disableActions](CATransaction, "disableActions");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CRLCanvasRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
    -[CRLCanvasRenderable setFrame:](self->_blackPathRenderable, "setFrame:");
    -[CRLCanvasRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
    -[CRLCanvasRenderable setFrame:](self->_whitePathRenderable, "setFrame:");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", v28);
    v29 = self->_whitePathRenderable;
    v34[0] = self->_blackPathRenderable;
    v34[1] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v30));

    v7 = (id)v31;
  }
  return v7;
}

- (id)ancestorRepForDrawingIntoLayer
{
  return 0;
}

- (BOOL)shouldShowKnobs
{
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = objc_msgSend(v3, "isInDynamicOperation");

  v5 = -[CRLFreehandDrawingTransformRep p_siblingLayoutInLayoutState:](self, "p_siblingLayoutInLayoutState:", 4);
  if (-[CRLFreehandDrawingTransformRep p_isInDrawingTransformMode](self, "p_isInDrawingTransformMode"))
    return v4 ^ 1 | v5;
  else
    return 0;
}

- (BOOL)shouldCreateSelectionKnobs
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  v3 = -[CRLFreehandDrawingTransformRep p_siblingLayoutInLayoutState:](self, "p_siblingLayoutInLayoutState:", 2);
  v4 = -[CRLFreehandDrawingTransformRep p_siblingLayoutInLayoutState:](self, "p_siblingLayoutInLayoutState:", 3);
  v5 = -[CRLFreehandDrawingTransformRep p_siblingLayoutInLayoutState:](self, "p_siblingLayoutInLayoutState:", 5);
  return -[CRLFreehandDrawingTransformRep p_isInDrawingTransformMode](self, "p_isInDrawingTransformMode") & ~v3 & ((v4 | v5) ^ 1);
}

- (BOOL)shouldShowSelectionHighlight
{
  void *v3;
  unsigned int v4;

  if (-[CRLFreehandDrawingTransformRep p_isInDrawingTransformMode](self, "p_isInDrawingTransformMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = objc_msgSend(v3, "isInDynamicOperation") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)documentModeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingTransformRep;
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
  v4.super_class = (Class)CRLFreehandDrawingTransformRep;
  -[CRLCanvasRep willBeRemoved](&v4, "willBeRemoved");
}

- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable
{
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)p_transformLayout
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(CRLFreehandDrawingTransformLayout, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)p_calculateLayerRelativePathForAffordance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  CGAffineTransform v14;
  CGAffineTransform t2;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformRep p_transformLayout](self, "p_transformLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "representedShapeLayouts"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v6, "viewScale");
    v7 = 1.0;
    if (v8 > 0.0)
    {
      objc_msgSend(v6, "viewScale");
      v7 = v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:](CRLFreehandDrawingShapeTracingHelper, "unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:", v5, 10.0 / v7));
    memset(&v18, 0, sizeof(v18));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "transformInRoot");
    else
      memset(&v16, 0, sizeof(v16));
    CGAffineTransformInvert(&t1, &v16);
    -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
    CGAffineTransformConcat(&v18, &t1, &t2);

    v14 = v18;
    objc_msgSend(v10, "transformUsingAffineTransform:", &v14);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  }

  return v10;
}

- (BOOL)p_shouldDisplayAnimatedSelectionOutline
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = -[CRLFreehandDrawingTransformRep p_toolkitWantsToSuppressKnobs](self, "p_toolkitWantsToSuppressKnobs");
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "smartSelectionManager"));
    v9 = objc_opt_class(CRLFreehandDrawingTransformInfo, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v11 = sub_100221D0C(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "representedShapeInfos", 0));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v20 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v15);
          v21 = sub_100221D0C(v20, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          if (v22
            && objc_msgSend(v7, "doesCurrentSmartSelectedDrawingShapeItemsContainDrawingShapeItem:", v22))
          {

            v3 = 0;
            goto LABEL_13;
          }

        }
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (BOOL)p_toolkitWantsToSuppressKnobs
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "freehandDrawingToolkit"));
  v4 = objc_msgSend(v3, "wantsToSuppressKnobsOnTransformReps");

  return v4;
}

- (BOOL)p_isInDrawingMode
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "freehandDrawingToolkit"));
  v4 = objc_msgSend(v3, "isInDrawingMode");

  return v4;
}

- (BOOL)p_isInDrawingTransformMode
{
  _BOOL4 v3;

  v3 = -[CRLFreehandDrawingTransformRep p_isInDrawingMode](self, "p_isInDrawingMode");
  if (v3)
    LOBYTE(v3) = !-[CRLFreehandDrawingTransformRep p_toolkitWantsToSuppressKnobs](self, "p_toolkitWantsToSuppressKnobs");
  return v3;
}

- (BOOL)p_siblingLayoutInLayoutState:(int)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = (objc_class *)objc_opt_class(CRLFreehandDrawingLayout, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));
  v8 = sub_1002223BC(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "children", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "layoutState") == a3)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
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
  CRLFreehandDrawingTransformRep *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)CRLFreehandDrawingTransformRep;
  v3 = -[CRLCanvasRep dynamicResizeDidBegin](&v17, "dynamicResizeDidBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformRep p_siblingReps](self, "p_siblingReps", 0));
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
        v10 = *(CRLFreehandDrawingTransformRep **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        if (v10 != self && objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "isSelected"))
          v11 = -[CRLFreehandDrawingTransformRep dynamicResizeDidBegin](v10, "dynamicResizeDidBegin");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CRLFreehandDrawingTransformRep *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingTransformRep;
  -[CRLCanvasRep dynamicallyResizingWithTracker:](&v15, "dynamicallyResizingWithTracker:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformRep p_siblingReps](self, "p_siblingReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
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
        v10 = *(CRLFreehandDrawingTransformRep **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
        if (v10 != self && objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "isSelected"))
          -[CRLFreehandDrawingTransformRep dynamicallyResizingWithTracker:](v10, "dynamicallyResizingWithTracker:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CRLFreehandDrawingTransformRep *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformRep p_siblingReps](self, "p_siblingReps"));
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
        v10 = *(CRLFreehandDrawingTransformRep **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        if (v10 != self && objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "isSelected"))
          objc_msgSend(v4, "applyNewBoundsToRep:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingTransformRep;
  -[CRLCanvasRep dynamicResizeDidEndWithTracker:](&v11, "dynamicResizeDidEndWithTracker:", v4);

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

- (id)p_siblingReps
{
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v3 = (objc_class *)objc_opt_class(CRLFreehandDrawingLayout, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
  v6 = sub_1002223BC(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7 && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info")), v8, v8))
  {
    v10 = (objc_class *)objc_opt_class(CRLFreehandDrawingRep, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repForInfo:", v12));
    v14 = sub_1002223BC(v10, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "childReps"));
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)additionalRepsToResize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v5 = objc_opt_class(CRLFreehandDrawingTransformInfo, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representedShapeInfos", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repForInfo:", v14));
        objc_msgSend(v3, "addObject:", v16);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v3;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CRLFreehandDrawingTransformRep *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingTransformRep;
  -[CRLCanvasRep dynamicFreeTransformDidBeginWithTracker:](&v15, "dynamicFreeTransformDidBeginWithTracker:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformRep p_siblingReps](self, "p_siblingReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
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
        v10 = *(CRLFreehandDrawingTransformRep **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
        if (v10 != self && objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "isSelected"))
          -[CRLFreehandDrawingTransformRep dynamicFreeTransformDidBeginWithTracker:](v10, "dynamicFreeTransformDidBeginWithTracker:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CRLFreehandDrawingTransformRep *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingTransformRep;
  -[CRLCanvasRep dynamicallyFreeTransformingWithTracker:](&v15, "dynamicallyFreeTransformingWithTracker:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformRep p_siblingReps](self, "p_siblingReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
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
        v10 = *(CRLFreehandDrawingTransformRep **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
        if (v10 != self && objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "isSelected"))
          -[CRLFreehandDrawingTransformRep dynamicallyFreeTransformingWithTracker:](v10, "dynamicallyFreeTransformingWithTracker:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CRLFreehandDrawingTransformRep *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTransformRep p_siblingReps](self, "p_siblingReps"));
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
        v10 = *(CRLFreehandDrawingTransformRep **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        if (v10 != self && objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "isSelected"))
          objc_msgSend(v4, "applyNewBoundsToRep:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingTransformRep;
  -[CRLCanvasRep dynamicFreeTransformDidEndWithTracker:](&v11, "dynamicFreeTransformDidEndWithTracker:", v4);

}

- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

  return v5 == v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayerRelativePath, 0);
  objc_storeStrong((id *)&self->_whitePathRenderable, 0);
  objc_storeStrong((id *)&self->_blackPathRenderable, 0);
}

@end
