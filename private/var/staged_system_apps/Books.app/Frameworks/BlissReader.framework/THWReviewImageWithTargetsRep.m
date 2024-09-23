@implementation THWReviewImageWithTargetsRep

- (THWReviewImageWithTargetsRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWReviewImageWithTargetsRep *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewImageWithTargetsRep;
  result = -[THWReviewImageWithTargetsRep initWithLayout:canvas:](&v5, "initWithLayout:canvas:", a3, a4);
  if (result)
    result->_pressedTargetIndex = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsRep;
  -[THWReviewImageWithTargetsRep dealloc](&v3, "dealloc");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (BOOL)allowTrackingInControlContainer:(id)a3
{
  return 1;
}

- (void)updateChildrenFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsRep;
  -[THWReviewImageWithTargetsRep updateChildrenFromLayout](&v3, "updateChildrenFromLayout");
  if (!self->_questionState)
  {
    -[THWReviewImageWithTargetsRep setQuestionState:](self, "setQuestionState:", objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestionInitialState:", self));
    -[THWReviewImageWithTargetsRep p_updateTargetsAndPlacardLayout:animated:](self, "p_updateTargetsAndPlacardLayout:animated:", 1, 0);
    objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestionDidUpdateState:", self);
  }
}

- (void)p_updateTargetsAndPlacardLayout:(BOOL)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  uint64_t v14;
  double v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  double v24;
  id v25;
  id v26;
  _BOOL4 v27;
  id obj;
  id obja;
  _BOOL4 v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v30 = a4;
  v27 = a3;
  v5 = -[THWReviewImageWithTargetsRep canvas](self, "canvas");
  v6 = -[THWReviewImageWithTargetsRep layout](self, "layout");
  v7 = -[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = objc_msgSend(v6, "placardLayouts");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v7, "reviewQuestion:targetForPlacard:", self, objc_msgSend(v12, "index"));
        v14 = objc_opt_class(THWReviewDraggablePlacardRep);
        *(_QWORD *)&v15 = TSUDynamicCast(v14, objc_msgSend(v5, "repForLayout:", v12)).n128_u64[0];
        objc_msgSend(v16, "setArrowDirection:", objc_msgSend(v6, "placardArrowPlacementforTarget:", v13, v15));
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }
  if (v27)
    objc_msgSend(v6, "updatePlacardLayouts");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obja = objc_msgSend(v6, "targetLayouts");
  v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(obja);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
        v22 = objc_msgSend(v7, "reviewQuestion:placardForTarget:", self, objc_msgSend(v21, "index")) != (id)0x7FFFFFFFFFFFFFFFLL;
        v23 = objc_opt_class(THWReviewDragTargetRep);
        *(_QWORD *)&v24 = TSUDynamicCast(v23, objc_msgSend(v5, "repForLayout:", v21)).n128_u64[0];
        objc_msgSend(v25, "setRadioState:animated:", (2 * v22), v30, v24);
      }
      v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v18);
  }
  if (v30)
  {
    +[CATransaction begin](CATransaction, "begin");
    v26 = -[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController");
    objc_msgSend(v26, "beginAnimations:context:", CFSTR("position"), 0);
    objc_msgSend(v26, "setAnimationDuration:", 0.3);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_193390;
    v31[3] = &unk_42A880;
    v31[4] = self;
    objc_msgSend(v26, "setAnimationFilterBlock:", v31);
    objc_msgSend(v26, "layoutIfNeeded");
    objc_msgSend(v26, "commitAnimations");
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsRep;
  -[THWReviewImageWithTargetsRep addAdditionalChildLayersToArray:](&v3, "addAdditionalChildLayersToArray:", a3);
}

- (int)reviewQuestionStateForChoiceIndex:(unint64_t)a3
{
  return 0;
}

- (void)reviewQuestionUpdateChoiceIndex:(unint64_t)a3 withState:(int)a4
{
  objc_msgSend(-[THWReviewImageWithTargetsRep p_repForTargetIndex:](self, "p_repForTargetIndex:", a3), "setChoiceState:", *(_QWORD *)&a4);
}

- (void)reviewQuestionAnswerUpdated
{
  -[THWReviewImageWithTargetsRep p_updateTargetsAndPlacardLayout:animated:](self, "p_updateTargetsAndPlacardLayout:animated:", 1, objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestionIsCurrentlyInView:", self));
}

- (BOOL)reviewQuestionIsAnswerCheckable
{
  return -[THWReviewImageWithTargetsRep p_areAllTargetsSelected](self, "p_areAllTargetsSelected");
}

- (void)setQuestionState:(int)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (self->_questionState != a3)
  {
    if (a3 == 1)
    {
      v5 = -[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController");
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = objc_msgSend(-[THWReviewImageWithTargetsRep layout](self, "layout"), "targetLayouts");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
            v12 = objc_opt_class(THWReviewDragTargetRep);
            *(_QWORD *)&v13 = TSUDynamicCast(v12, objc_msgSend(v5, "repForLayout:", v11)).n128_u64[0];
            v15 = v14;
            objc_msgSend(v14, "setRadioState:", 0, v13);
            objc_msgSend(v15, "setChoiceState:", 0);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v8);
      }
    }
    self->_questionState = a3;
    objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestionDidUpdateState:", self);
  }
}

- (BOOL)reviewDragAllowDraggingForRep:(id)a3
{
  id v3;

  v3 = -[THWReviewImageWithTargetsRep p_targetRepForPlacardRep:](self, "p_targetRepForPlacardRep:", a3);
  return !v3 || objc_msgSend(v3, "choiceState") != 1;
}

- (void)reviewDragWillBeginForRep:(id)a3 withGesture:(id)a4
{
  THWReviewImageWithTargetsRep *v4;
  id v7;
  TSDRep *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  double v29;
  void *v30;
  id v31;
  THWReviewImageWithTargetsRep *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  if (a3)
  {
    v4 = self;
    if (!self->_layerDraggingController)
    {
      -[THWReviewImageWithTargetsRep p_setPanGRs:](self, "p_setPanGRs:", 0);
      v7 = objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "layerForRep:", a3);
      v8 = (TSDRep *)a3;
      v4->_draggingRep = v8;
      -[TSDRep pauseLayerUpdates](v8, "pauseLayerUpdates");
      objc_msgSend(a4, "naturalLocationForRep:", v4->_draggingRep);
      v10 = v9;
      v12 = v11;
      -[TSDRep naturalBounds](v4->_draggingRep, "naturalBounds");
      v4->_anchorPoint.x = v10 / v13;
      v4->_anchorPoint.y = v12 / v14;
      v4->_layerDraggingController = -[THWLayerDraggingController initWithLayer:hostView:gesture:anchorPoint:delegate:]([THWLayerDraggingController alloc], "initWithLayer:hostView:gesture:anchorPoint:delegate:", v7, objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](v4, "p_questionHost"), "reviewQuestionDraggingHostView:", v4), a4, v4, v4->_anchorPoint.x, v4->_anchorPoint.y);
      v15 = objc_opt_class(THWReviewDraggablePlacardRep);
      *(_QWORD *)&v17 = TSUDynamicCast(v15, -[THWReviewImageWithTargetsRep draggingRep](v4, "draggingRep")).n128_u64[0];
      v18 = v16;
      if (v16)
      {
        objc_msgSend(v16, "setArrowDirection:", 0, v17);
        objc_msgSend(objc_msgSend(v18, "layout"), "setPlacement:", 2);
      }
      -[THWReviewImageWithTargetsRep p_animatePlacardChanges:duration:](v4, "p_animatePlacardChanges:duration:", v18, 0.3);
      v19 = -[THWReviewImageWithTargetsRep p_targetRepForPlacardRep:](v4, "p_targetRepForPlacardRep:", v18);
      if (objc_msgSend(v19, "choiceState") == 2)
      {
        v33 = a4;
        v20 = -[THWReviewImageWithTargetsRep interactiveCanvasController](v4, "interactiveCanvasController");
        v21 = objc_alloc_init((Class)NSMutableIndexSet);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v32 = v4;
        v22 = objc_msgSend(-[THWReviewImageWithTargetsRep layout](v4, "layout"), "targetLayouts");
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(_QWORD *)v35 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
              v28 = objc_opt_class(THWReviewDragTargetRep);
              *(_QWORD *)&v29 = TSUDynamicCast(v28, objc_msgSend(v20, "repForLayout:", v27)).n128_u64[0];
              v31 = v30;
              if (objc_msgSend(v30, "choiceState", v29) == 2)
              {
                objc_msgSend(v31, "setChoiceState:", 0);
                if (v31 != v19)
                  objc_msgSend(v21, "addIndex:", objc_msgSend(v27, "index"));
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v24);
        }
        v4 = v32;
        objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](v32, "p_questionHost"), "reviewQuestion:unassociateTargets:", v32, v21);

        a4 = v33;
      }
      -[THWLayerDraggingController handleGesture:](v4->_layerDraggingController, "handleGesture:", a4);
    }
  }
}

- (void)reviewDragHandleForRep:(id)a3 withGesture:(id)a4
{
  -[THWLayerDraggingController handleGesture:](self->_layerDraggingController, "handleGesture:", a4);
}

- (void)layerDraggingDidBegin:(id)a3 withPosition:(CGPoint)a4
{
  double y;
  double x;
  unint64_t v7;
  id v8;
  void *v9;
  double v10;

  y = a4.y;
  x = a4.x;
  v7 = -[THWReviewImageWithTargetsRep draggingPlacardIndex](self, "draggingPlacardIndex", a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[THWReviewImageWithTargetsRep p_repForTargetIndex:](self, "p_repForTargetIndex:", objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestion:targetForPlacard:", self, v7));
    if (v8)
    {
      v9 = v8;
      objc_msgSend(objc_msgSend(v8, "layout"), "distanceSquaredToPoint:", x, y);
      if (v10 > 14400.0)
        objc_msgSend(v9, "setRadioState:", 0);
    }
  }
  -[THWReviewImageWithTargetsRep setWasInDrawer:](self, "setWasInDrawer:", -[THWReviewImageWithTargetsRep p_drawerContainsPoint:](self, "p_drawerContainsPoint:", x, y));
  -[THWReviewImageWithTargetsRep p_updateTargetStateForPoint:](self, "p_updateTargetStateForPoint:", x, y);
  -[THWReviewImageWithTargetsRep p_addPickupAnimation](self, "p_addPickupAnimation");
}

- (void)layerDraggingDidMove:(id)a3 withPosition:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  -[THWReviewImageWithTargetsRep p_updateTargetStateForPoint:](self, "p_updateTargetStateForPoint:", a3);
  -[THWReviewImageWithTargetsRep p_updateDrawerStateForPoint:](self, "p_updateDrawerStateForPoint:", x, y);
}

- (void)layerDraggingDidEnd:(id)a3 withPosition:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  int v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[5];

  y = a4.y;
  x = a4.x;
  -[THWReviewImageWithTargetsRep p_setPanGRs:](self, "p_setPanGRs:", 1);
  +[CATransaction begin](CATransaction, "begin");
  -[THWReviewImageWithTargetsRep p_updateTargetStateForPoint:](self, "p_updateTargetStateForPoint:", x, y);
  v7 = objc_opt_class(THWReviewDraggablePlacardRep);
  TSUDynamicCast(v7, -[THWReviewImageWithTargetsRep draggingRep](self, "draggingRep"));
  v9 = v8;
  v10 = -[THWReviewImageWithTargetsRep p_targetIndexNearPoint:](self, "p_targetIndexNearPoint:", x, y);
  v11 = -[THWReviewImageWithTargetsRep draggingPlacardIndex](self, "draggingPlacardIndex");
  v12 = v11;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[THWReviewImageWithTargetsRep p_didDragInsideDrawer:](self, "p_didDragInsideDrawer:", 0);
      v14 = 1;
    }
  }
  else if (v9
         && (v13 = -[THWReviewImageWithTargetsRep p_repForTargetIndex:](self, "p_repForTargetIndex:", v10),
             objc_msgSend(v13, "choiceState") != 1))
  {
    objc_msgSend(v9, "setArrowDirection:", objc_msgSend(-[THWReviewImageWithTargetsRep layout](self, "layout"), "placardArrowPlacementforTarget:", v10));
    v14 = 1;
    objc_msgSend(objc_msgSend(v9, "layout"), "setPlacement:", 1);
    objc_msgSend(v13, "setRadioState:", 2);
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(objc_msgSend(v9, "layout"), "placement") == 2)
    objc_msgSend(objc_msgSend(v9, "layout"), "setPlacement:", 0);
  -[THWReviewImageWithTargetsRep setPressedTargetIndex:](self, "setPressedTargetIndex:", 0x7FFFFFFFFFFFFFFFLL);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_193CD8;
  v34[3] = &unk_426DD0;
  v34[4] = self;
  v15 = -[TSDRep interactiveCanvasController](self->_draggingRep, "interactiveCanvasController");
  -[THWReviewImageWithTargetsRep p_animatePlacardChanges:duration:](self, "p_animatePlacardChanges:duration:", v9, 0.3);
  if (v14)
    objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestion:associatePlacard:withTarget:", self, v12, v10);
  -[TSDRep layerFrameInScaledCanvasRelativeToParent](self->_draggingRep, "layerFrameInScaledCanvasRelativeToParent");
  objc_msgSend(-[THWReviewImageWithTargetsRep canvas](self, "canvas"), "convertBoundsToUnscaledRect:", v16, v17, v18, v19);
  -[THWReviewImageWithTargetsRep layerDragging:convertNaturalPointToBounds:](self, "layerDragging:convertNaturalPointToBounds:", self->_layerDraggingController, TSDCenterOfRect(v20, v21, v22, v23));
  v25 = v24;
  v27 = v26;
  objc_msgSend(v15, "beginAnimations:context:", CFSTR("position"), 0);
  objc_msgSend(v15, "setAnimationDuration:", 0.3);
  objc_msgSend(v15, "setAnimationCompletionBlock:", v34);
  -[CALayer bounds](-[THWLayerDraggingController layer](self->_layerDraggingController, "layer"), "bounds");
  v32 = TSDCenterOfRect(v28, v29, v30, v31);
  -[CALayer setPosition:](-[THWLayerDraggingController layer](self->_layerDraggingController, "layer"), "setPosition:", v32, v33);
  -[CALayer setPosition:](-[THWLayerDraggingController wrapperLayer](self->_layerDraggingController, "wrapperLayer"), "setPosition:", v25, v27);
  objc_msgSend(v15, "commitAnimations");
  +[CATransaction commit](CATransaction, "commit");
}

- (CGPoint)layerDragging:(id)a3 naturalPositionWithGesture:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend(a4, "naturalLocationForRep:", self);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)layerDragging:(id)a3 convertNaturalPointToBounds:(CGPoint)a4
{
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v8 = -[THWReviewImageWithTargetsRep canvas](self, "canvas");
  -[THWReviewImageWithTargetsRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
  objc_msgSend(v8, "convertUnscaledToBoundsPoint:");
  objc_msgSend(objc_msgSend(a3, "hostView"), "convertPoint:fromView:", objc_msgSend(-[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), v9, v10);
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)layerDraggingBoundsLocationForICCWithGesture:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "boundsLocationForICC:", -[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController"));
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)p_choiceAtIndex:(unint64_t)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend(-[THWReviewImageWithTargetsRep layout](self, "layout"), "question"), "choices");
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    return 0;
  else
    return objc_msgSend(v4, "objectAtIndex:", a3);
}

- (id)p_questionHost
{
  return objc_msgSend(-[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWReviewQuestionHosting);
}

- (unint64_t)p_targetIndexNearPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  void *i;
  void *v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  y = a3.y;
  x = a3.x;
  if (-[THWReviewImageWithTargetsRep p_drawerContainsPoint:](self, "p_drawerContainsPoint:"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(-[THWReviewImageWithTargetsRep layout](self, "layout", 0), "targetLayouts");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v7)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v7;
  v9 = *(_QWORD *)v18;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = 1.79769313e308;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v13, "distanceSquaredToPoint:", x, y);
      if (v14 < v11)
      {
        v15 = v14;
        if (v14 <= 14400.0)
        {
          v10 = (unint64_t)objc_msgSend(v13, "index");
          v11 = v15;
        }
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v8);
  return v10;
}

- (id)p_repForTargetIndex:(unint64_t)a3
{
  uint64_t v5;
  id result;

  v5 = objc_opt_class(THWReviewDragTargetRep);
  TSUDynamicCast(v5, objc_msgSend(-[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", objc_msgSend(-[THWReviewImageWithTargetsRep layout](self, "layout"), "layoutForTargetIndex:", a3)));
  return result;
}

- (void)p_updateTargetStateForPoint:(CGPoint)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;

  v4 = -[THWReviewImageWithTargetsRep p_targetIndexNearPoint:](self, "p_targetIndexNearPoint:", a3.x, a3.y);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = -[THWReviewImageWithTargetsRep p_repForTargetIndex:](self, "p_repForTargetIndex:", v4);
  v6 = -[THWReviewImageWithTargetsRep pressedTargetIndex](self, "pressedTargetIndex");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
    if (v5)
      goto LABEL_6;
LABEL_10:
    v4 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_11;
  }
  v7 = -[THWReviewImageWithTargetsRep p_repForTargetIndex:](self, "p_repForTargetIndex:", v6);
  if (!v5)
    goto LABEL_10;
LABEL_6:
  if (objc_msgSend(v5, "choiceState") == 1 || v5 == v7)
    return;
  objc_msgSend(v5, "setRadioState:", 1);
LABEL_11:
  -[THWReviewImageWithTargetsRep setPressedTargetIndex:](self, "setPressedTargetIndex:", v4);
  if (v7)
  {
    v8 = objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestion:placardForTarget:", self, v6);
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = 2
         * (v8 != (id)-[THWReviewImageWithTargetsRep draggingPlacardIndex](self, "draggingPlacardIndex"));
    objc_msgSend(v7, "setRadioState:", v9);
  }
}

- (BOOL)p_drawerContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  v5 = -[THWReviewImageWithTargetsRep layout](self, "layout");
  if (v5)
  {
    v6 = objc_msgSend(v5, "drawerFrame");
    LOBYTE(v5) = TSDPointInRectInclusive(v6, x, y, v7, v8, v9, v10);
  }
  return (char)v5;
}

- (void)p_updateDrawerStateForPoint:(CGPoint)a3
{
  _BOOL8 v4;
  unsigned int v5;

  v4 = -[THWReviewImageWithTargetsRep p_drawerContainsPoint:](self, "p_drawerContainsPoint:", a3.x, a3.y);
  v5 = -[THWReviewImageWithTargetsRep wasInDrawer](self, "wasInDrawer");
  if (!v4)
  {
    if (!v5)
    {
      v4 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if ((v5 & 1) == 0)
  {
LABEL_5:
    -[THWReviewImageWithTargetsRep p_didDragInsideDrawer:](self, "p_didDragInsideDrawer:", v4);
    goto LABEL_7;
  }
  v4 = 1;
LABEL_7:
  -[THWReviewImageWithTargetsRep setWasInDrawer:](self, "setWasInDrawer:", v4);
}

- (void)p_addPickupAnimation
{
  CALayer *v3;
  id v4;
  BOOL v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  _QWORD v12[6];

  v3 = -[THWLayerDraggingController layer](self->_layerDraggingController, "layer");
  v4 = -[TSDRep interactiveCanvasController](self->_draggingRep, "interactiveCanvasController");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = v4;
    -[CALayer bounds](v3, "bounds");
    v8 = v7;
    objc_msgSend(v6, "beginAnimations:context:", CFSTR("scale"), 0);
    objc_msgSend(v6, "setAnimationDuration:", 0.15);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_194404;
    v12[3] = &unk_426E28;
    v12[4] = v6;
    v12[5] = v3;
    objc_msgSend(v6, "setAnimationCompletionBlock:", v12);
    CGAffineTransformMakeScale(&v11, 1.2, 1.2);
    v10 = v11;
    -[CALayer setAffineTransform:](v3, "setAffineTransform:", &v10);
    objc_msgSend(v6, "commitAnimations");
    objc_msgSend(v6, "beginAnimations:context:", CFSTR("position+opacity"), 0);
    objc_msgSend(v6, "setAnimationDuration:", 0.3);
    -[CALayer setPosition:](v3, "setPosition:", v8 * 0.5, -14.0);
    LODWORD(v9) = 1061997773;
    -[CALayer setOpacity:](v3, "setOpacity:", v9);
    objc_msgSend(v6, "commitAnimations");
  }
}

- (void)p_addDropAnimationWithCompletion:(id)a3
{
  CALayer *v5;
  id v6;
  BOOL v7;
  void *v8;
  __int128 v9;
  double v10;
  _OWORD v11[3];

  v5 = -[THWLayerDraggingController layer](self->_layerDraggingController, "layer");
  v6 = -[TSDRep interactiveCanvasController](self->_draggingRep, "interactiveCanvasController");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = v6;
    +[CATransaction begin](CATransaction, "begin");
    objc_msgSend(v8, "beginAnimations:context:", CFSTR("scale+opacity"), 0);
    objc_msgSend(v8, "setAnimationDuration:", 0.15);
    objc_msgSend(v8, "setAnimationCompletionBlock:", a3);
    v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v11[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v11[1] = v9;
    v11[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[CALayer setAffineTransform:](v5, "setAffineTransform:", v11);
    LODWORD(v10) = 1.0;
    -[CALayer setOpacity:](v5, "setOpacity:", v10);
    objc_msgSend(v8, "commitAnimations");
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (unint64_t)draggingPlacardIndex
{
  return -[THWReviewImageWithTargetsRep p_draggingPlacardIndexForRep:](self, "p_draggingPlacardIndexForRep:", self->_draggingRep);
}

- (unint64_t)p_draggingPlacardIndexForRep:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;

  v4 = objc_opt_class(THWReviewDraggablePlacardLayout);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, objc_msgSend(a3, "layout")).n128_u64[0];
  if (v5)
    return (unint64_t)objc_msgSend(v5, "index", v6);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)p_targetRepForPlacardRep:(id)a3
{
  return -[THWReviewImageWithTargetsRep p_repForTargetIndex:](self, "p_repForTargetIndex:", objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestion:targetForPlacard:", self, -[THWReviewImageWithTargetsRep p_draggingPlacardIndexForRep:](self, "p_draggingPlacardIndexForRep:", a3)));
}

- (BOOL)p_areAllTargetsSelected
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = -[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(-[THWReviewImageWithTargetsRep layout](self, "layout", 0), "targetLayouts");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(THWReviewDragTargetRep);
        *(_QWORD *)&v11 = TSUDynamicCast(v10, objc_msgSend(v3, "repForLayout:", v9)).n128_u64[0];
        if (objc_msgSend(v12, "radioState", v11) != 2)
          return 0;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 1;
}

- (id)p_filterAnimation:(id)a3 forLayer:(id)a4 key:(id)a5 forPlacardRep:(id)a6
{
  id v11;
  NSNull *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  id result;
  THWLayerDraggingController *layerDraggingController;

  v11 = -[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController");
  v12 = +[NSNull null](NSNull, "null");
  v13 = objc_msgSend(v11, "repForLayer:", a4);
  if (!v13)
    v13 = objc_msgSend(v11, "repForLayer:", objc_msgSend(a4, "superlayer"));
  v14 = objc_opt_class(THWReviewDraggablePlacardRep);
  TSUDynamicCast(v14, v13);
  v16 = v15;
  v17 = objc_opt_class(THWReviewDraggablePlacardRep);
  *(_QWORD *)&v18 = TSUDynamicCast(v17, objc_msgSend(v13, "parentRep")).n128_u64[0];
  v20 = v19;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("path"), v18)
    && objc_msgSend((id)v16, "calloutLayer") == a4)
  {
    objc_msgSend(a3, "duration");
    return objc_msgSend((id)v16, "calloutPathAnimationWithduration:");
  }
  if (!a6)
  {
    if (v16 | v20)
      return 0;
    goto LABEL_11;
  }
  result = 0;
  if ((id)v16 != a6 && (id)v20 != a6)
  {
LABEL_11:
    layerDraggingController = self->_layerDraggingController;
    if (layerDraggingController)
    {
      if (-[THWLayerDraggingController wrapperLayer](layerDraggingController, "wrapperLayer") == a4)
        return 0;
      else
        return v12;
    }
    else
    {
      return v12;
    }
  }
  return result;
}

- (void)p_animatePlacardChanges:(id)a3 duration:(double)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[6];

  v7 = objc_msgSend(a3, "interactiveCanvasController");
  v8 = objc_msgSend(v7, "layerForRep:", a3);
  +[CATransaction begin](CATransaction, "begin");
  objc_msgSend(v7, "beginAnimations:context:", CFSTR("placard-bounds"), 0);
  v9 = objc_msgSend(a3, "contentTextRep");
  if (v9)
  {
    v10 = v9;
    v11 = +[CATransition animation](CATransition, "animation");
    objc_msgSend(v11, "setType:", kCATransitionFade);
    objc_msgSend(v11, "setDuration:", a4);
    objc_msgSend(objc_msgSend(v10, "textLayer"), "addAnimation:forKey:", v11, CFSTR("fadeAnimation"));
  }
  objc_msgSend(v7, "setAnimationDuration:", a4);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_194A40;
  v20[3] = &unk_42A8A8;
  v20[4] = self;
  v20[5] = a3;
  objc_msgSend(v7, "setAnimationFilterBlock:", v20);
  objc_msgSend(v7, "layoutIfNeeded");
  objc_msgSend(a3, "updateLayerBoundsAndWPPosition");
  objc_msgSend(v8, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v8, "setPosition:", TSDCenterOfRect(v12, v14, v16, v18));
  -[CALayer setBounds:](-[THWLayerDraggingController wrapperLayer](self->_layerDraggingController, "wrapperLayer"), "setBounds:", v13, v15, v17, v19);
  objc_msgSend(v7, "commitAnimations");
  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_setPanGRs:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;

  v3 = a3;
  v4 = objc_msgSend(-[THWReviewImageWithTargetsRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView");
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = objc_opt_class(TSKScrollView);
      *(_QWORD *)&v8 = TSUDynamicCast(v6, v5).n128_u64[0];
      if (v7)
        objc_msgSend(objc_msgSend(v7, "panGestureRecognizer", v8), "setEnabled:", v3);
      v5 = objc_msgSend(v5, "superview", v8);
    }
    while (v5);
  }
}

- (void)p_didDragInsideDrawer:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  float v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(-[THWReviewImageWithTargetsRep layout](self, "layout", 0), "placardLayouts");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    if (v3)
      v9 = 0.5;
    else
      v9 = 1.0;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(THWReviewDraggablePlacardRep);
        *(_QWORD *)&v13 = TSUDynamicCast(v12, objc_msgSend(-[THWReviewImageWithTargetsRep canvas](self, "canvas"), "repForLayout:", v11)).n128_u64[0];
        v15 = v14;
        if (!objc_msgSend(objc_msgSend(v14, "layout", v13), "placement"))
        {
          v16 = objc_msgSend(objc_msgSend(v15, "interactiveCanvasController"), "layerForRep:", v15);
          *(float *)&v17 = v9;
          objc_msgSend(v16, "setOpacity:", v17);
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
}

- (int)questionState
{
  return self->_questionState;
}

- (THWLayerDraggingController)layerDraggingController
{
  return self->_layerDraggingController;
}

- (TSDRep)draggingRep
{
  return self->_draggingRep;
}

- (unint64_t)pressedTargetIndex
{
  return self->_pressedTargetIndex;
}

- (void)setPressedTargetIndex:(unint64_t)a3
{
  self->_pressedTargetIndex = a3;
}

- (BOOL)wasInDrawer
{
  return self->_wasInDrawer;
}

- (void)setWasInDrawer:(BOOL)a3
{
  self->_wasInDrawer = a3;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

@end
