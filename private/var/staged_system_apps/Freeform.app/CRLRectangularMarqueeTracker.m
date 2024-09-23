@implementation CRLRectangularMarqueeTracker

- (CRLRectangularMarqueeTracker)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLRectangularMarqueeTracker *v5;
  CRLRectangularMarqueeTracker *v6;
  NSMapTable *v7;
  NSMapTable *scaledRectsForReps;
  NSMutableSet *v9;
  NSMutableSet *pendingSelection;
  CGSize size;
  uint64_t v12;
  CRLCanvasRenderable *selectionOverlay;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLRectangularMarqueeTracker;
  v5 = -[CRLRectangularMarqueeTracker init](&v19, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v7 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    scaledRectsForReps = v6->_scaledRectsForReps;
    v6->_scaledRectsForReps = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingSelection = v6->_pendingSelection;
    v6->_pendingSelection = v9;

    size = CGRectNull.size;
    v6->_selectionRectScaled.origin = CGRectNull.origin;
    v6->_selectionRectScaled.size = size;
    v12 = objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    selectionOverlay = v6->_selectionOverlay;
    v6->_selectionOverlay = (CRLCanvasRenderable *)v12;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_interactiveCanvasController);
    -[CRLCanvasRenderable setDelegate:](v6->_selectionOverlay, "setDelegate:", WeakRetained);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.17, 0.44, 1.0, 1.0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.12, 0.31, 0.7, 0.2));
    -[CRLCanvasRenderable setBorderColor:](v6->_selectionOverlay, "setBorderColor:", objc_msgSend(v15, "CGColor"));
    -[CRLCanvasRenderable setBorderWidth:](v6->_selectionOverlay, "setBorderWidth:", 1.0);
    -[CRLCanvasRenderable setBackgroundColor:](v6->_selectionOverlay, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, "p_refreshRectsForReps", CFSTR("CRLCanvasUpdateScrollNotification"), v4);

  }
  return v6;
}

- (void)setCurrentUnscaledDragPoint:(CGPoint)a3
{
  self->_currentUnscaledDragPoint = a3;
  self->_wasCurrentUnscaledDragPointSetExternally = 1;
}

- (CGRect)p_currentUnscaledMarqueeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->_startedSelection)
  {
    x = sub_10005FDB0(self->_startingUnscaledPoint.x, self->_startingUnscaledPoint.y, self->_currentUnscaledDragPoint.x);
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)beginMarquee
{
  if (!self->_startedSelection)
  {
    self->_startedSelection = 1;
    -[CRLRectangularMarqueeTracker p_beginMarquee](self, "p_beginMarquee");
  }
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_startedSelection)
  {
    self->_startedSelection = 1;
    v5 = v4;
    -[CRLRectangularMarqueeTracker p_beginMarquee](self, "p_beginMarquee");
    goto LABEL_5;
  }
  if (self->_wasCurrentUnscaledDragPointSetExternally)
  {
    v5 = v4;
    -[CRLRectangularMarqueeTracker p_updateMarquee](self, "p_updateMarquee");
LABEL_5:
    v4 = v5;
  }

}

- (void)commitChangesForReps:(id)a3
{
  CGSize size;
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  CRLSelectionPath *selectionBeforeMarquee;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  if (!self->_startedSelection)
    return;
  size = CGRectZero.size;
  self->_selectionRectScaled.origin = CGRectZero.origin;
  self->_selectionRectScaled.size = size;
  -[CRLCanvasRenderable setBounds:](self->_selectionOverlay, "setBounds:", a3, self->_selectionRectScaled.origin.x, self->_selectionRectScaled.origin.y, self->_selectionRectScaled.size.width, self->_selectionRectScaled.size.height);
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(WeakRetained, "removeDecorator:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v8 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("CRLCanvasUpdateScrollNotification"), v8);

  if (-[NSMutableSet count](self->_pendingSelection, "count"))
  {
    if (!-[CRLRectangularMarqueeTracker shouldSuppressContextMenu](self, "shouldSuppressContextMenu"))
    {
      v9 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asiOSCVC"));

      objc_msgSend(v11, "performSelector:withObject:afterDelay:", "showDefaultEditUIForCurrentSelection", 0, 0.0);
LABEL_8:

    }
  }
  else if (!-[CRLRectangularMarqueeTracker shouldSuppressRestoringOriginalSelectionIfNothingSelected](self, "shouldSuppressRestoringOriginalSelectionIfNothingSelected"))
  {
    selectionBeforeMarquee = self->_selectionBeforeMarquee;
    v11 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    objc_msgSend(v13, "setSelectionPath:", selectionBeforeMarquee);

    goto LABEL_8;
  }
  v14 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layerHost"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "asiOSCVC"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "i_quickSelectViewController"));

  if (v19)
    objc_msgSend(v19, "unhideUIIfAppropriateAfterHidingForWindowRect");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v18 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("CRLMarqueeDidEndNotification"), v18, 0);

}

- (BOOL)operationShouldBeDynamic
{
  return 0;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)disallowAllActionsWhileTracking
{
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  CRLCanvasRenderable *selectionOverlay;

  selectionOverlay = self->_selectionOverlay;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &selectionOverlay, 1));
}

- (void)p_updateMarquee
{
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSMapTable *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  void *v44;
  BOOL v45;
  void *v46;
  _BOOL4 v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  double x;
  double y;
  double width;
  double height;
  id v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  id *location;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  p_interactiveCanvasController = &self->_interactiveCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->_startingUnscaledPoint.x, self->_startingUnscaledPoint.y);
  v6 = v5;
  v8 = v7;

  v9 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  objc_msgSend(v9, "convertUnscaledToBoundsPoint:", self->_currentUnscaledDragPoint.x, self->_currentUnscaledDragPoint.y);
  v11 = v10;
  v13 = v12;

  v81.origin.x = sub_10005FDB0(v6, v8, v11);
  v82 = CGRectIntegral(v81);
  self->_selectionRectScaled = v82;
  if (self->_shouldCenterResizeMarqueeRect)
  {
    v14 = sub_1000603DC(v82.size.width, v82.size.height, 2.0);
    self->_selectionRectScaled.origin.x = sub_10005FD98(v6, v8, v14);
    self->_selectionRectScaled.origin.y = v15;
    self->_selectionRectScaled.size.width = v16;
    self->_selectionRectScaled.size.height = v17;
  }
  if (-[CRLRectangularMarqueeTracker p_shouldUpdateMarqueeFrameForDragDistance:](self, "p_shouldUpdateMarqueeFrameForDragDistance:", sub_10006108C(v6, v8, v11, v13)))
  {
    -[CRLCanvasRenderable setFrame:](self->_selectionOverlay, "setFrame:", self->_selectionRectScaled.origin.x, self->_selectionRectScaled.origin.y, self->_selectionRectScaled.size.width, self->_selectionRectScaled.size.height);
  }
  v18 = objc_alloc_init((Class)NSMutableSet);
  v19 = objc_alloc_init((Class)NSMutableSet);
  location = (id *)p_interactiveCanvasController;
  v20 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  objc_msgSend(v20, "convertBoundsToUnscaledRect:", self->_selectionRectScaled.origin.x, self->_selectionRectScaled.origin.y, self->_selectionRectScaled.size.width, self->_selectionRectScaled.size.height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v29 = self->_scaledRectsForReps;
  v30 = -[NSMapTable countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v77 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_scaledRectsForReps, "objectForKeyedSubscript:", v34));
        objc_msgSend(v35, "CGRectValue");
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42;

        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "info"));
        v84.origin.x = v37;
        v84.origin.y = v39;
        v84.size.width = v41;
        v84.size.height = v43;
        v45 = CGRectContainsRect(self->_selectionRectScaled, v84);
        v46 = v19;
        if (!v45)
        {
          v85.origin.x = v37;
          v85.origin.y = v39;
          v85.size.width = v41;
          v85.size.height = v43;
          v47 = CGRectIntersectsRect(self->_selectionRectScaled, v85);
          v46 = v18;
          if (v47)
          {
            if (objc_msgSend(v34, "intersectsUnscaledRect:", v22, v24, v26, v28))
              v46 = v19;
            else
              v46 = v18;
          }
        }
        objc_msgSend(v46, "addObject:", v44);

      }
      v31 = -[NSMapTable countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v31);
  }

  -[NSMutableSet minusSet:](self->_pendingSelection, "minusSet:", v18);
  -[NSMutableSet unionSet:](self->_pendingSelection, "unionSet:", v19);
  if (self->_shouldInvertOriginalSelection)
    -[NSMutableSet crl_xorSet:](self->_pendingSelection, "crl_xorSet:", self->_originalSelection);
  -[CRLRectangularMarqueeTracker p_setPendingSelection](self, "p_setPendingSelection");
  self->_lastUnscaledPoint = self->_currentUnscaledDragPoint;
  v48 = objc_loadWeakRetained(location);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "layerHost"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "asiOSCVC"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "i_quickSelectViewController"));

  if (v51)
  {
    -[CRLRectangularMarqueeTracker p_currentUnscaledMarqueeRect](self, "p_currentUnscaledMarqueeRect");
    x = v83.origin.x;
    y = v83.origin.y;
    width = v83.size.width;
    height = v83.size.height;
    if (!CGRectIsNull(v83))
    {
      v56 = objc_loadWeakRetained(location);
      objc_msgSend(v56, "convertUnscaledToBoundsRect:", x, y, width, height);
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;

      v65 = objc_loadWeakRetained(location);
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "canvasView"));
      objc_msgSend(v66, "convertRect:toView:", 0, v58, v60, v62, v64);
      v68 = v67;
      v70 = v69;
      v72 = v71;
      v74 = v73;

      objc_msgSend(v51, "temporarilyHideUIIfAppropriateForWindowRect:", v68, v70, v72, v74);
    }
  }

}

- (void)p_beginMarquee
{
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  CRLSelectionPath *v8;
  CRLSelectionPath *selectionBeforeMarquee;
  id v10;
  id v11;
  CGPoint *p_startingUnscaledPoint;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSSet *v26;
  NSSet *originalSelection;
  unsigned int v28;
  NSMutableSet *pendingSelection;
  void *v30;
  CGPoint v31;
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("CRLMarqueeDidBeginNotification"), WeakRetained, 0);

  v5 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(v5, "addDecorator:", self);

  v6 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  v8 = (CRLSelectionPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  selectionBeforeMarquee = self->_selectionBeforeMarquee;
  self->_selectionBeforeMarquee = v8;

  -[CRLRectangularMarqueeTracker p_refreshRectsForReps](self, "p_refreshRectsForReps");
  v10 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasEditor"));

  v11 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  p_startingUnscaledPoint = &self->_startingUnscaledPoint;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitRep:", self->_startingUnscaledPoint.x, self->_startingUnscaledPoint.y));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "repForSelecting"));
  v15 = v14;
  if (self->_shouldInvertOriginalSelection || v14 && objc_msgSend(v14, "isSelectedIgnoringLocking"))
  {
    v16 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "infosForCurrentSelectionPath"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectsPassingTest:", &stru_1012625C8));
    -[NSMutableSet unionSet:](self->_pendingSelection, "unionSet:", v18);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "selectionPathWithInfo:", 0));
    v19 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "editorController"));
    objc_msgSend(v20, "setSelectionPath:", v18);

  }
  v21 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectionModelTranslator"));
  v23 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "editorController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionPath"));
  v26 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "boardItemsForSelectionPath:", v25));
  originalSelection = self->_originalSelection;
  self->_originalSelection = v26;

  if (v15)
  {
    if (self->_shouldInvertOriginalSelection)
    {
      v28 = objc_msgSend(v15, "isSelectedIgnoringLocking");
      pendingSelection = self->_pendingSelection;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));
      if (v28)
      {
        -[NSMutableSet removeObject:](pendingSelection, "removeObject:", v30);
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      if ((objc_msgSend(v15, "isSelected") & 1) != 0)
      {
LABEL_14:
        -[CRLRectangularMarqueeTracker p_setPendingSelection](self, "p_setPendingSelection");
        goto LABEL_15;
      }
      pendingSelection = self->_pendingSelection;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));
    }
    -[NSMutableSet addObject:](pendingSelection, "addObject:", v30);
    goto LABEL_13;
  }
LABEL_15:
  if (!-[CRLRectangularMarqueeTracker shouldSuppressAnimationWhenMarqueeBegins](self, "shouldSuppressAnimationWhenMarqueeBegins"))-[CRLRectangularMarqueeTracker p_beginMarqueePressAnimation](self, "p_beginMarqueePressAnimation");
  v31 = *p_startingUnscaledPoint;
  self->_lastUnscaledPoint = *p_startingUnscaledPoint;
  self->_currentUnscaledDragPoint = v31;

}

- (void)p_setPendingSelection
{
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableSet *pendingSelection;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  p_interactiveCanvasController = &self->_interactiveCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));

  v5 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectionPath"));
  *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v8).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mostSpecificSelectionOfClass:", v10, v9));
  v12 = v11;
  if (v11)
  {
    pendingSelection = self->_pendingSelection;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "boardItems"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "anyObject"));
    -[NSMutableSet removeObject:](pendingSelection, "removeObject:", v15);

  }
  v16 = -[NSMutableSet count](self->_pendingSelection, "count");
  if (!v12 || v16)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfos:", self->_pendingSelection));
  }
  else
  {
    v17 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionModelTranslator"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "containerGroups"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectionPathForNothingSelectedInsideGroup:", v20));

  }
  objc_msgSend(v22, "setSelectionPath:", v21);

}

- (void)p_refreshRectsForReps
{
  NSArray *v3;
  void *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSMapTable *scaledRectsForReps;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v3 = NSAllMapTableKeys(self->_scaledRectsForReps);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topLevelRepsForDragSelecting"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v11), "repForSelecting"));
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "demandsExclusiveSelection") & 1) == 0)
        {
          v14 = NSAllMapTableKeys(self->_scaledRectsForReps);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = objc_msgSend(v15, "containsObject:", v13);

          if ((v16 & 1) == 0)
          {
            v17 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
            objc_msgSend(v13, "frameInUnscaledCanvasForMarqueeSelecting");
            objc_msgSend(v17, "convertUnscaledToBoundsRect:");
            v19 = v18;
            v21 = v20;
            v23 = v22;
            v25 = v24;

            scaledRectsForReps = self->_scaledRectsForReps;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v19, v21, v23, v25));
            -[NSMapTable setObject:forKey:](scaledRectsForReps, "setObject:forKey:", v27, v13);

          }
          objc_msgSend(v5, "removeObject:", v13);
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = v5;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v34;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(v28);
        -[NSMapTable removeObjectForKey:](self->_scaledRectsForReps, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v32), (_QWORD)v33);
        v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v30);
  }

}

- (void)p_beginMarqueePressAnimation
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->_startingUnscaledPoint.x, self->_startingUnscaledPoint.y);
  v5 = v4;
  v7 = v6;

  v8 = sub_10005FD98(v5, v7, 1.0);
  v10 = v9;
  v12 = v11;
  -[CRLCanvasRenderable setFrame:](self->_selectionOverlay, "setFrame:", v8);
  -[CRLCanvasRenderable removeAnimationForKey:](self->_selectionOverlay, "removeAnimationForKey:", CFSTR("kCRLMarqueeStartAnimationKey"));
  v20 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("bounds.size")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 80.0, 80.0));
  objc_msgSend(v20, "setFromValue:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v10, v12));
  objc_msgSend(v20, "setToValue:", v14);

  LODWORD(v15) = 1036831949;
  LODWORD(v16) = 0.25;
  LODWORD(v17) = 0.25;
  LODWORD(v18) = 1.0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v16, v15, v17, v18));
  objc_msgSend(v20, "setTimingFunction:", v19);

  objc_msgSend(v20, "setDuration:", 0.3);
  objc_msgSend(v20, "setDelegate:", self);
  -[CRLCanvasRenderable addAnimation:forKey:](self->_selectionOverlay, "addAnimation:forKey:", v20, CFSTR("kCRLMarqueeStartAnimationKey"));

}

- (void)p_stopMarqueePressAnimation
{
  -[CRLCanvasRenderable removeAnimationForKey:](self->_selectionOverlay, "removeAnimationForKey:", CFSTR("kCRLMarqueeStartAnimationKey"));
}

- (BOOL)p_shouldUpdateMarqueeFrameForDragDistance:(double)a3
{
  void *v5;
  BOOL v6;
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable animationForKey:](self->_selectionOverlay, "animationForKey:", CFSTR("kCRLMarqueeStartAnimationKey")));

  v6 = a3 >= 20.0 || v5 == 0;
  v7 = v6;
  if (v6)
    -[CRLRectangularMarqueeTracker p_stopMarqueePressAnimation](self, "p_stopMarqueePressAnimation");
  return v7;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[CRLCanvasRenderable removeAnimationForKey:](self->_selectionOverlay, "removeAnimationForKey:", CFSTR("kCRLMarqueeStartAnimationKey"), a4);
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_storeWeak((id *)&self->_interactiveCanvasController, a3);
}

- (CGPoint)startingUnscaledPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingUnscaledPoint.x;
  y = self->_startingUnscaledPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartingUnscaledPoint:(CGPoint)a3
{
  self->_startingUnscaledPoint = a3;
}

- (CGPoint)currentUnscaledDragPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentUnscaledDragPoint.x;
  y = self->_currentUnscaledDragPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)shouldCenterResizeMarqueeRect
{
  return self->_shouldCenterResizeMarqueeRect;
}

- (void)setShouldCenterResizeMarqueeRect:(BOOL)a3
{
  self->_shouldCenterResizeMarqueeRect = a3;
}

- (BOOL)shouldInvertOriginalSelection
{
  return self->_shouldInvertOriginalSelection;
}

- (void)setShouldInvertOriginalSelection:(BOOL)a3
{
  self->_shouldInvertOriginalSelection = a3;
}

- (BOOL)shouldSuppressAnimationWhenMarqueeBegins
{
  return self->_shouldSuppressAnimationWhenMarqueeBegins;
}

- (void)setShouldSuppressAnimationWhenMarqueeBegins:(BOOL)a3
{
  self->_shouldSuppressAnimationWhenMarqueeBegins = a3;
}

- (BOOL)shouldSuppressContextMenu
{
  return self->_shouldSuppressContextMenu;
}

- (void)setShouldSuppressContextMenu:(BOOL)a3
{
  self->_shouldSuppressContextMenu = a3;
}

- (BOOL)shouldSuppressRestoringOriginalSelectionIfNothingSelected
{
  return self->_shouldSuppressRestoringOriginalSelectionIfNothingSelected;
}

- (void)setShouldSuppressRestoringOriginalSelectionIfNothingSelected:(BOOL)a3
{
  self->_shouldSuppressRestoringOriginalSelectionIfNothingSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBeforeMarquee, 0);
  objc_storeStrong((id *)&self->_originalSelection, 0);
  objc_storeStrong((id *)&self->_pendingSelection, 0);
  objc_storeStrong((id *)&self->_scaledRectsForReps, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
  objc_storeStrong((id *)&self->_selectionOverlay, 0);
}

@end
