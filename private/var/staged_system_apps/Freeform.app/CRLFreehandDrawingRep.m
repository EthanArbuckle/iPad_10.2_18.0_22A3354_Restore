@implementation CRLFreehandDrawingRep

- (CRLFreehandDrawingRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6;
  CRLFreehandDrawingRep *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *currentlySelectedInfosShowingAffordance;
  void *v13;
  CRLFreehandDrawingRep *v14;
  uint64_t v15;
  NSMutableSet *childRepsForTrifurcation;
  uint64_t v17;
  NSMutableSet *childRepsWithSixChannelRenderEnabled;
  uint64_t v19;
  NSMutableSet *childRepsSuppressingSixChannelRender;
  void *v21;
  id v22;
  void *v23;
  NSSet *v24;
  NSSet *subscribedFreehandDrawingIDs;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *drawingDetectionItems;
  void **v44;
  uint64_t v45;
  id (*v46)(uint64_t);
  void *v47;
  CRLFreehandDrawingRep *v48;
  objc_super v49;

  v6 = a4;
  v49.receiver = self;
  v49.super_class = (Class)CRLFreehandDrawingRep;
  v7 = -[CRLCanvasRep initWithLayout:canvas:](&v49, "initWithLayout:canvas:", a3, v6);
  if (v7 && objc_msgSend(v6, "isCanvasInteractive"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v7, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "p_selectionOrSelectedInfosChanged", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v10);

    v11 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    currentlySelectedInfosShowingAffordance = v7->_currentlySelectedInfosShowingAffordance;
    v7->_currentlySelectedInfosShowingAffordance = (NSSet *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](v7, "canvas"));
    v44 = _NSConcreteStackBlock;
    v45 = 3221225472;
    v46 = sub_10018705C;
    v47 = &unk_10122D110;
    v14 = v7;
    v48 = v14;
    objc_msgSend(v13, "performBlockAfterLayoutIfNecessary:", &v44);

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    childRepsForTrifurcation = v14->_childRepsForTrifurcation;
    v14->_childRepsForTrifurcation = (NSMutableSet *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    childRepsWithSixChannelRenderEnabled = v14->_childRepsWithSixChannelRenderEnabled;
    v14->_childRepsWithSixChannelRenderEnabled = (NSMutableSet *)v17;

    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    childRepsSuppressingSixChannelRender = v14->_childRepsSuppressingSixChannelRender;
    v14->_childRepsSuppressingSixChannelRender = (NSMutableSet *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](v14, "p_freehandDrawingInfo"));
    v22 = objc_alloc((Class)NSSet);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "id"));
    v24 = (NSSet *)objc_msgSend(v22, "initWithObjects:", v23, 0, v44, v45, v46, v47);
    subscribedFreehandDrawingIDs = v14->_subscribedFreehandDrawingIDs;
    v14->_subscribedFreehandDrawingIDs = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v14, "interactiveCanvasController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "pkDrawingProvider"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v14, "interactiveCanvasController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pkDrawingProvider"));
      objc_msgSend(v29, "addPKDrawingsObserver:", v14);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v14, "interactiveCanvasController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pkDrawingProvider"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "id"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "pkStrokesForFreehandDrawingItemID:", v32));

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cachedPKDrawing"));
      -[CRLFreehandDrawingRep p_updatePKRecognitionControllerWithStrokes:useCachedSession:](v14, "p_updatePKRecognitionControllerWithStrokes:useCachedSession:", v33, v34 != 0);

      if (v33 && objc_msgSend(v33, "count"))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](v14, "p_freehandDrawingInfo"));
        if (objc_msgSend(v35, "prohibitsClustering"))
        {

        }
        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](v14, "p_freehandDrawingInfo"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "pkRecognitionController"));

          if (v37)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](v14, "p_freehandDrawingInfo"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pkRecognitionController"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "dataDetectorController"));
            v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "currentItems"));
            drawingDetectionItems = v14->_drawingDetectionItems;
            v14->_drawingDetectionItems = (NSArray *)v41;

            -[CRLFreehandDrawingRep p_addDataDetectorInteractionIfNeeded](v14, "p_addDataDetectorInteractionIfNeeded");
          }
        }
      }

    }
  }

  return v7;
}

- (id)p_freehandDrawingInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (BOOL)isInvisible
{
  return !-[CRLFreehandDrawingRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer");
}

- (BOOL)canOcclude
{
  return 1;
}

- (void)willBeRemoved
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  CRLFreehandDrawingRepTrifurcationContainer *activeTrifurcationContainer;
  void *v9;
  void *v10;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *mathRecognitionHandler;
  void *v12;
  unsigned int v13;
  void *v14;
  UIView *baseMathView;
  UIViewController *baseMathViewController;
  objc_super v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "isCanvasInteractive");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v7);

    -[NSMutableSet removeAllObjects](self->_childRepsForTrifurcation, "removeAllObjects");
    -[CRLFreehandDrawingRepTrifurcationContainer tearDown](self->_activeTrifurcationContainer, "tearDown");
    activeTrifurcationContainer = self->_activeTrifurcationContainer;
    self->_activeTrifurcationContainer = 0;

    -[NSMutableSet removeAllObjects](self->_childRepsWithSixChannelRenderEnabled, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_childRepsSuppressingSixChannelRender, "removeAllObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pkDrawingProvider"));
    objc_msgSend(v10, "removePKDrawingsObserver:", self);

  }
  -[CRLFreehandDrawingRep p_removeSubselectionAffordanceIfNeeded](self, "p_removeSubselectionAffordanceIfNeeded");
  -[CRLMathRecognitionItemsHandler willBeRemoved](self->_mathRecognitionHandler, "willBeRemoved");
  mathRecognitionHandler = self->_mathRecognitionHandler;
  self->_mathRecognitionHandler = 0;

  if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v13 = objc_msgSend(v12, "isCanvasInteractive");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v14, "removeDecorator:", self);

      -[UIView removeFromSuperview](self->_baseMathView, "removeFromSuperview");
    }
  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 2))
    -[CRLFreehandDrawingRep p_removeDataDetectorInteraction](self, "p_removeDataDetectorInteraction");
  baseMathView = self->_baseMathView;
  self->_baseMathView = 0;

  baseMathViewController = self->_baseMathViewController;
  self->_baseMathViewController = 0;

  v17.receiver = self;
  v17.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep willBeRemoved](&v17, "willBeRemoved");
}

- (id)additionalRepsForDraggingConnectionLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v8).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mostSpecificSelectionOfClass:", v10, v9));

  *(_QWORD *)&v13 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v12).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v13));
  v17 = sub_100221D0C(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v11
    && v18
    && (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containerGroups")),
        v20 = objc_msgSend(v19, "containsObject:", v18),
        v19,
        v20))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)CRLFreehandDrawingRep;
    v23 = -[CRLCanvasRep additionalRepsForDraggingConnectionLine:](&v25, "additionalRepsForDraggingConnectionLine:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v23);
  }

  return v22;
}

- (BOOL)p_shouldDrawShapeRep:(id)a3 withOtherShapeRep:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isMoreOptimalToDrawWithOtherShapeRepsIfPossible"))
    v7 = objc_msgSend(v5, "canDrawWithOtherShapeRep:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)p_drawChildShapeReps:(id)a3 togetherInContext:(CGContext *)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char isKindOfClass;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "count"))
  {
    if (objc_msgSend(v16, "count") == (id)1)
    {
      CGContextSaveGState(a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v6, "recursivelyDrawInContext:keepingChildrenPassingTest:", a4, 0);

      CGContextRestoreGState(a4);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
      objc_msgSend(v7, "opacity");
      v9 = v8;

      if (v9 != 0.0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stroke"));
        objc_opt_class(CRLPencilKitInkStroke, v13);
        isKindOfClass = objc_opt_isKindOfClass(v12, v14);

        if ((isKindOfClass & 1) != 0)
          -[CRLFreehandDrawingRep p_drawChildShapeRepsWithPencilKitStrokes:togetherInContext:](self, "p_drawChildShapeRepsWithPencilKitStrokes:togetherInContext:", v16, a4);
        else
          -[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:](self, "p_concatenatePathDrawChildShapeReps:togetherInContext:", v16, a4);
      }
    }
  }

}

- (void)p_concatenatePathDrawChildShapeReps:(id)a3 togetherInContext:(CGContext *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v36;
  void **p_cache;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  char *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  char isKindOfClass;
  unsigned int v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char *v63;
  void *v64;
  double v65;
  double v66;
  char *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  unsigned int v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  char *i;
  BOOL v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  CGContextRef c;
  void *v91;
  void *v92;
  id obj;
  double v94;
  _BOOL4 v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  char *v99;
  id v100;
  CGAffineTransform transform;
  CGAffineTransform v102;
  CGAffineTransform t2;
  CGAffineTransform t1;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  CGAffineTransform v109;
  CGAffineTransform v110;
  _BYTE v111[128];
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E8B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E02ED8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E8D0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 556, 0, "Should be drawing at least two shape reps here.");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  memset(&v109, 0, sizeof(v109));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));
  v12 = v11;
  c = a4;
  if (v11)
    objc_msgSend(v11, "transformInRoot");
  else
    memset(&v109, 0, sizeof(v109));

  *(_QWORD *)&v14 = objc_opt_class(CRLBrushStroke, v13).n128_u64[0];
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shapeLayout", v14));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stroke"));
  v19 = sub_100221D0C(v16, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "strokeName"));
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("Pencil")))
    {

LABEL_18:
      v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      goto LABEL_20;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "strokeName"));
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("Crayon"));

    if (v23)
      goto LABEL_18;
  }
  v24 = 0;
LABEL_20:

  v92 = v10;
  objc_msgSend(v10, "opacity");
  if (v25 != 1.0 && fabs(v25 + -1.0) >= 0.000000999999997)
    goto LABEL_24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stroke"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "color"));
  objc_msgSend(v28, "alphaComponent");
  v30 = v29;

  v31 = 0;
  if (v30 != 1.0 && fabs(v30 + -1.0) >= 0.000000999999997)
LABEL_24:
    v31 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v5;
  v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
  if (v97)
  {
    v96 = *(_QWORD *)v106;
    v95 = (v24 | v31) != 0;
    v36 = &__kCFBooleanFalse;
    p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;
    v38 = v92;
    v91 = v9;
    while (1)
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v106 != v96)
          objc_enumerationMutation(obj);
        v98 = v39;
        v40 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "shapeLayout"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "pathSource"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bezierPath"));
        v100 = objc_msgSend(v43, "copy");

        objc_msgSend(v40, "clipRect");
        v45 = v44;
        v47 = v46;
        v49 = v48;
        v51 = v50;
        if (v40 != v38)
        {
          memset(&v110, 0, sizeof(v110));
          if (v41)
            objc_msgSend(v41, "transformInRoot");
          else
            memset(&t1, 0, sizeof(t1));
          v102 = v109;
          CGAffineTransformInvert(&t2, &v102);
          CGAffineTransformConcat(&v110, &t1, &t2);
          v102 = v110;
          objc_msgSend(v100, "transformUsingAffineTransform:", &v102);
          v102 = v110;
          v112.origin.x = v45;
          v112.origin.y = v47;
          v112.size.width = v49;
          v112.size.height = v51;
          v113 = CGRectApplyAffineTransform(v112, &v102);
          v45 = v113.origin.x;
          v47 = v113.origin.y;
          v49 = v113.size.width;
          v51 = v113.size.height;
        }
        if (v95)
        {
          v52 = (char *)objc_msgSend(v100, "totalSubpathCountIncludingEffectivelyEmptySubpaths");
          if (v24)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stroke"));
            objc_opt_class(CRLBrushStroke, v54);
            isKindOfClass = objc_opt_isKindOfClass(v53, v55);

            if ((isKindOfClass & 1) == 0)
            {
              v57 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10123E8F0);
              v58 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v110.a) = 67109890;
                HIDWORD(v110.a) = v57;
                LOWORD(v110.b) = 2082;
                *(_QWORD *)((char *)&v110.b + 2) = "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:]";
                WORD1(v110.c) = 2082;
                *(_QWORD *)((char *)&v110.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLF"
                                                   "reehandDrawingRep.m";
                WORD2(v110.d) = 1024;
                *(_DWORD *)((char *)&v110.d + 6) = 600;
                _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Trying to draw a shape without a brush stroke along with one with a brush stroke.", (uint8_t *)&v110, 0x22u);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10123E910);
              v59 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                v85 = v59;
                v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 373, "packedBacktraceString"));
                LODWORD(v110.a) = 67109378;
                HIDWORD(v110.a) = v57;
                LOWORD(v110.b) = 2114;
                *(_QWORD *)((char *)&v110.b + 2) = v86;
                _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v110, 0x12u);

              }
              v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:]"));
              v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
              objc_msgSend(p_cache + 373, "handleFailureInFunction:file:lineNumber:isFatal:description:", v60, v61, 600, 0, "Trying to draw a shape without a brush stroke along with one with a brush stroke.");

            }
            v94 = height;
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dynamicPatternOffsetsBySubpath"));
            v63 = (char *)objc_msgSend(v62, "count");
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "shapeInfo"));
            objc_msgSend(v64, "strokePatternOffsetDistance");
            v66 = v65;

            if (v52)
            {
              v67 = 0;
              v99 = v63;
              do
              {
                if (v62)
                {
                  if (v67 >= v63)
                  {
                    v70 = v41;
                    v71 = v31;
                    v72 = v36;
                    v73 = v24;
                    v74 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
                    if (qword_10147E370 != -1)
                      dispatch_once(&qword_10147E370, &stru_10123E930);
                    v75 = off_1013D9070;
                    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(v110.a) = 67109890;
                      HIDWORD(v110.a) = v74;
                      LOWORD(v110.b) = 2082;
                      *(_QWORD *)((char *)&v110.b + 2) = "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:tog"
                                                         "etherInContext:]";
                      WORD1(v110.c) = 2082;
                      *(_QWORD *)((char *)&v110.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItem"
                                                         "s/CRLFreehandDrawingRep.m";
                      WORD2(v110.d) = 1024;
                      *(_DWORD *)((char *)&v110.d + 6) = 617;
                      _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out of range of dynamicPatternOffsetsBySubpath. Falling back to info value.", (uint8_t *)&v110, 0x22u);
                    }
                    if (qword_10147E370 != -1)
                      dispatch_once(&qword_10147E370, &stru_10123E950);
                    v76 = off_1013D9070;
                    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    {
                      v80 = v76;
                      v81 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                      LODWORD(v110.a) = 67109378;
                      HIDWORD(v110.a) = v74;
                      LOWORD(v110.b) = 2114;
                      *(_QWORD *)((char *)&v110.b + 2) = v81;
                      _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v110, 0x12u);

                      p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
                    }
                    v77 = p_cache + 373;
                    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:]"));
                    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
                    objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 617, 0, "Out of range of dynamicPatternOffsetsBySubpath. Falling back to info value.");

                    p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
                    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v66));
                    v24 = v73;
                    v36 = v72;
                    v31 = v71;
                    v41 = v70;
                    v63 = v99;
                    goto LABEL_63;
                  }
                  v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectAtIndexedSubscript:", v67));
                }
                else
                {
                  v68 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v66));
                }
                v69 = (void *)v68;
LABEL_63:
                objc_msgSend((id)v24, "addObject:", v69);

                ++v67;
              }
              while (v52 != v67);
            }

            v9 = v91;
            v38 = v92;
            height = v94;
          }
          if (v31 && v52)
          {
            for (i = 0; i != v52; ++i)
            {
              if (i)
                goto LABEL_70;
              v114.origin.x = x;
              v114.origin.y = y;
              v114.size.width = width;
              v114.size.height = height;
              v118.origin.x = v45;
              v118.origin.y = v47;
              v118.size.width = v49;
              v118.size.height = v51;
              v83 = CGRectIntersectsRect(v114, v118);
              v84 = &__kCFBooleanTrue;
              if (!v83)
LABEL_70:
                v84 = v36;
              objc_msgSend((id)v31, "addObject:", v84);
            }
          }
        }
        objc_msgSend(v9, "appendBezierPath:", v100);
        v115.origin.x = x;
        v115.origin.y = y;
        v115.size.width = width;
        v115.size.height = height;
        v119.origin.x = v45;
        v119.origin.y = v47;
        v119.size.width = v49;
        v119.size.height = v51;
        v116 = CGRectUnion(v115, v119);
        x = v116.origin.x;
        y = v116.origin.y;
        width = v116.size.width;
        height = v116.size.height;

        v39 = v98 + 1;
      }
      while ((id)(v98 + 1) != v97);
      v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
      if (!v97)
        goto LABEL_76;
    }
  }
  v38 = v92;
LABEL_76:

  CGContextSaveGState(c);
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layout"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "geometry"));
  v89 = v88;
  if (v88)
    objc_msgSend(v88, "transform");
  else
    memset(&transform, 0, sizeof(transform));
  CGContextConcatCTM(c, &transform);

  v117.origin.x = x;
  v117.origin.y = y;
  v117.size.width = width;
  v117.size.height = height;
  CGContextClipToRect(c, v117);
  objc_msgSend(v38, "drawInContext:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:", c, v9, v24, v31);
  CGContextRestoreGState(c);

}

- (CGRect)p_boundsInNaturalSpaceForMathView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
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
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "bounds");
  v13 = sub_1000614B8(v9, v10, v11, v12);
  v15 = v14;
  -[UIView convertPoint:fromView:](self->_baseMathView, "convertPoint:fromView:", v4, v6, v8);
  v17 = v16;
  v19 = v18;
  -[UIView convertPoint:fromView:](self->_baseMathView, "convertPoint:fromView:", v4, v13, v15);
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasView"));
  objc_msgSend(v25, "convertPoint:fromView:", self->_baseMathView, v17, v19);
  v27 = v26;
  v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "canvasView"));
  objc_msgSend(v31, "convertPoint:fromView:", self->_baseMathView, v21, v23);
  v33 = v32;
  v35 = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v36, "convertBoundsToUnscaledPoint:", v27, v29);
  v38 = v37;
  v40 = v39;

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v41, "convertBoundsToUnscaledPoint:", v33, v35);
  v43 = v42;
  v45 = v44;

  -[CRLGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v38, v40);
  v47 = v46;
  v49 = v48;
  -[CRLGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v43, v45);
  v51 = sub_10005FDB0(v47, v49, v50);
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (id)createAdditionalBoardItemsForCopyImaging
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGContext *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  void *v44;
  CGImage *Image;
  __CFData *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v51;
  void *v52;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v53;
  void *v54;
  void *v55;
  void *v56;
  double x;
  double y;
  double width;
  double height;
  CRLCanvasInfoGeometry *v61;
  void *v62;
  _BYTE rect[56];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  CGRect v70;
  CGRect v71;

  v3 = objc_alloc_init((Class)NSMutableArray);
  if (-[CRLFreehandDrawingRep p_hasMathResultViews](self, "p_hasMathResultViews"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvas"));
    objc_msgSend(v5, "contentsScale");
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvas"));
    objc_msgSend(v9, "viewScale");
    v11 = v10;

    v12 = v7 * v11;
    -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = sub_1000603DC(v17, v19, v12);
    v23 = sub_10040FA64(11, v21, v22);
    CGContextScaleCTM(v23, v12, v12);
    *(double *)rect = v14;
    CGContextTranslateCTM(v23, -v14, -v16);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          -[CRLFreehandDrawingRep p_boundsInNaturalSpaceForMathView:](self, "p_boundsInNaturalSpaceForMathView:", v29);
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v37 = v36;
          CGContextSaveGState(v23);
          objc_msgSend(v29, "bounds");
          v39 = -v38;
          objc_msgSend(v29, "bounds");
          CGContextTranslateCTM(v23, v39, -v40);
          CGContextTranslateCTM(v23, v31, v33);
          objc_msgSend(v29, "bounds");
          v42 = v35 / v41;
          objc_msgSend(v29, "bounds");
          CGContextScaleCTM(v23, v42, v37 / v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
          objc_msgSend(v44, "renderInContext:", v23);

          CGContextRestoreGState(v23);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v26);
    }

    Image = CGBitmapContextCreateImage(v23);
    v46 = sub_100435130(Image);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    CGImageRelease(Image);
    CGContextRelease(v23);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "editingCoordinator"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "boardItemFactory"));

    v51 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "assetOwner"));
    v53 = -[CRLPreinsertionAssetWrapper initWithData:filename:owner:error:](v51, "initWithData:filename:owner:error:", v47, CFSTR("freehand-drawing-math-solve-image-for-copying"), v52, 0);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPreinsertionAssetWrapper synchronouslyCreateAsset](v53, "synchronouslyCreateAsset"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v56 = v55;
    if (v55)
      objc_msgSend(v55, "transformInRoot");
    else
      memset(&rect[8], 0, 48);
    v70.origin.x = *(CGFloat *)rect;
    v70.origin.y = v16;
    v70.size.width = v18;
    v70.size.height = v20;
    v71 = CGRectApplyAffineTransform(v70, (CGAffineTransform *)&rect[8]);
    x = v71.origin.x;
    y = v71.origin.y;
    width = v71.size.width;
    height = v71.size.height;

    v61 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", x, y, width, height);
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "makeImageItemWithGeometry:imageData:thumbnailData:", v61, v54, 0));
    objc_msgSend(v62, "setStroke:", 0);
    objc_msgSend(v62, "setShadow:", 0);
    objc_msgSend(v62, "setMaskInfo:", 0);
    objc_msgSend(v3, "addObject:", v62);

  }
  return v3;
}

- (void)viewScaleDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *baseMathView;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _OWORD v18[3];
  _OWORD v19[3];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep viewScaleDidChange](&v20, "viewScaleDidChange");
  if (!self->_attachedMathResultView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[CRLFreehandDrawingRep p_getUnRotatedFrameWithoutMathResults](self, "p_getUnRotatedFrameWithoutMathResults");
    objc_msgSend(v3, "convertUnscaledToBoundsRect:");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    baseMathView = self->_baseMathView;
    v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v19[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v19[1] = v13;
    v19[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[UIView setTransform:](baseMathView, "setTransform:", v19);
    -[UIView setFrame:](self->_baseMathView, "setFrame:", v5, v7, v9, v11);
    self->_frameAtMathViewAttachment.origin.x = v5;
    self->_frameAtMathViewAttachment.origin.y = v7;
    self->_frameAtMathViewAttachment.size.width = v9;
    self->_frameAtMathViewAttachment.size.height = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pureGeometryInRoot"));
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "transform");
    else
      memset(v18, 0, sizeof(v18));
    self->_rotationAtMathViewAttachment = sub_1000791EC((double *)v18);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v17, "invalidateContentLayersForRep:", self);

  }
}

- (void)didEndZoomingOperation
{
  void *v3;

  if (-[CRLFreehandDrawingRep p_hasMathResultViews](self, "p_hasMathResultViews"))
  {
    -[CRLFreehandDrawingRep p_teardownAndReinitializeMathRecognitionHandler](self, "p_teardownAndReinitializeMathRecognitionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v3, "invalidateFrame");

    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  }
}

- (void)viewScrollDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep viewScrollDidChange](&v3, "viewScrollDidChange");
  self->_isViewScrolling = 1;
}

- (void)viewScrollingEnded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep viewScrollingEnded](&v3, "viewScrollingEnded");
  self->_isViewScrolling = 0;
  if (self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation)
  {
    self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation = 0;
    -[CRLFreehandDrawingRep p_teardownAndReinitializeMathRecognitionHandler](self, "p_teardownAndReinitializeMathRecognitionHandler");
  }
}

- (void)dynamicOperationDidEnd
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep dynamicOperationDidEnd](&v3, "dynamicOperationDidEnd");
  -[CRLFreehandDrawingRep p_updateLayoutBoundsForMathResultView](self, "p_updateLayoutBoundsForMathResultView");
  if (self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation)
  {
    self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation = 0;
    -[CRLFreehandDrawingRep p_teardownAndReinitializeMathRecognitionHandler](self, "p_teardownAndReinitializeMathRecognitionHandler");
  }
}

- (void)willEnterForeground
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep willEnterForeground](&v7, "willEnterForeground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pkRecognitionController"));
  objc_msgSend(v4, "tagAsActive");

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10123E970);
  v5 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tagging recognition controller as active.", v6, 2u);
  }
}

- (void)didEnterBackground
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep didEnterBackground](&v7, "didEnterBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pkRecognitionController"));
  objc_msgSend(v4, "tagAsIdle");

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10123E990);
  v5 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tagging recognition controller as idle.", v6, 2u);
  }
}

- (void)p_setupMathPaperAndDataRecognition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _TtC8Freeform17CRLMathResultView *v12;
  UIView *baseMathView;
  UIView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIViewController *v19;
  UIViewController *baseMathViewController;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v21;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *mathRecognitionHandler;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _OWORD v32[3];

  if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[CRLFreehandDrawingRep p_getUnRotatedFrameWithoutMathResults](self, "p_getUnRotatedFrameWithoutMathResults");
    objc_msgSend(v3, "convertUnscaledToBoundsRect:");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = -[CRLMathResultView initWithFrame:delegate:]([_TtC8Freeform17CRLMathResultView alloc], "initWithFrame:delegate:", self, v5, v7, v9, v11);
    baseMathView = self->_baseMathView;
    self->_baseMathView = &v12->super.super;

    v14 = self->_baseMathView;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UIView setClipsToBounds:](self->_baseMathView, "setClipsToBounds:", 0);
    self->_attachedMathResultView = 0;
    self->_frameAtMathViewAttachment.origin.x = v5;
    self->_frameAtMathViewAttachment.origin.y = v7;
    self->_frameAtMathViewAttachment.size.width = v9;
    self->_frameAtMathViewAttachment.size.height = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pureGeometryInRoot"));
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "transform");
    else
      memset(v32, 0, sizeof(v32));
    self->_rotationAtMathViewAttachment = sub_1000791EC((double *)v32);

    self->_previousAspectRatio = v9 / v11;
    v19 = (UIViewController *)objc_alloc_init((Class)UIViewController);
    baseMathViewController = self->_baseMathViewController;
    self->_baseMathViewController = v19;

    -[UIViewController setView:](self->_baseMathViewController, "setView:", self->_baseMathView);
    v21 = -[CRLMathRecognitionItemsHandler initWithRep:view:viewController:]([_TtC8Freeform30CRLMathRecognitionItemsHandler alloc], "initWithRep:view:viewController:", self, self->_baseMathView, self->_baseMathViewController);
    mathRecognitionHandler = self->_mathRecognitionHandler;
    self->_mathRecognitionHandler = v21;

    self->_waitingForLayoutPass = 0;
    self->_allowedToToggleMathPopoverUI = 0;
    self->_isPresentingMathPopoverUI = 0;
    -[CRLFreehandDrawingRep setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap](self, "setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v23, "addDecorator:", self);

  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 2))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pkRecognitionController"));

    if (!v25)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E9B0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E02F58();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E9D0);
      v26 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_setupMathPaperAndDataRecognition]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 828, 0, "invalid nil value for '%{public}s'", "self.p_freehandDrawingInfo.pkRecognitionController");

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "pkRecognitionController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dataDetectorController"));
    objc_msgSend(v31, "setDelegate:", self);

  }
}

- (void)p_initializePKRecognitionSessionAndSetupMathAndDataRecognitionWithDrawing:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  objc_msgSend(v5, "setCachedPKDrawing:", v4);

  v6 = objc_alloc((Class)PKRecognitionController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "strokes"));
  v8 = objc_msgSend(v6, "initWithDrawing:visibleOnscreenStrokes:useSessionCache:", v4, v7, 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  objc_msgSend(v9, "setPkRecognitionController:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pkRecognitionController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataDetectorController"));
  objc_msgSend(v12, "setDelegate:", self);

  -[CRLFreehandDrawingRep p_setupMathPaperAndDataRecognition](self, "p_setupMathPaperAndDataRecognition");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pkRecognitionController"));
  objc_msgSend(v14, "tagAsActive");

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10123E9F0);
  v15 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tagging recognition controller as active.", v16, 2u);
  }
}

- (void)p_updatePKRecognitionControllerWithStrokes:(id)a3 useCachedSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t v32[16];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pkRecognitionController"));
  if (v8)
  {

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v10 = objc_msgSend(v9, "prohibitsClustering");

    if ((v10 & 1) == 0)
    {
      v21 = objc_alloc_init((Class)PKDrawing);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "id"));
      objc_msgSend(v21, "_setUUID:", v30);

      v31 = objc_msgSend(v21, "undoableAddNewStrokes:", v6);
      -[CRLFreehandDrawingRep p_initializePKRecognitionSessionAndSetupMathAndDataRecognitionWithDrawing:](self, "p_initializePKRecognitionSessionAndSetupMathAndDataRecognitionWithDrawing:", v21);
      goto LABEL_13;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pkRecognitionController"));

  if (!v12 || !v4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pkRecognitionController"));

    if (!v17)
      goto LABEL_14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pkRecognitionController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "drawing"));
    v21 = objc_msgSend(v20, "copy");

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v21, "_setAllStrokes:", v22);

    objc_msgSend(v21, "invalidateVisibleStrokes");
    v23 = objc_msgSend(v21, "undoableAddNewStrokes:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v24, "timeIntervalSince1970");
    -[CRLMathRecognitionItemsHandler setLastStrokeTimestamp:](self->_mathRecognitionHandler, "setLastStrokeTimestamp:");

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pkRecognitionController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "strokes"));
    objc_msgSend(v26, "setDrawing:withVisibleOnscreenStrokes:", v21, v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    objc_msgSend(v28, "setCachedPKDrawing:", v21);

LABEL_13:
    goto LABEL_14;
  }
  -[CRLFreehandDrawingRep p_setupMathPaperAndDataRecognition](self, "p_setupMathPaperAndDataRecognition");
  -[CRLFreehandDrawingRep p_teardownAndReinitializeMathRecognitionHandler](self, "p_teardownAndReinitializeMathRecognitionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pkRecognitionController"));
  objc_msgSend(v14, "tagAsActive");

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10123EA10);
  v15 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tagging recognition controller as active.", v32, 2u);
  }
LABEL_14:

}

- (PKDrawing)pkDrawing
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pkRecognitionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "drawing"));

  return (PKDrawing *)v4;
}

- (PKMathRecognitionController)pkMathRecognitionController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pkRecognitionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mathRecognitionController"));

  return (PKMathRecognitionController *)v4;
}

- (PKRecognitionController)pkRecognitionController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pkRecognitionController"));

  return (PKRecognitionController *)v3;
}

- (void)didUpdateMathResultView
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
  objc_msgSend(v3, "setValue:forKey:", &__kCFBooleanFalse, CFSTR("hidden"));

  self->_attachedMathResultView = 1;
  if (self->_isViewScrolling)
  {
    self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation = 1;
  }
  else
  {
    v4 = -[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation");
    self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation = v4;
    if (!v4)
      goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
  objc_msgSend(v5, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("hidden"));

LABEL_5:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v6, "invalidateContentLayersForRep:", self);

  if (!-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    -[CRLFreehandDrawingRep p_updateLayoutBoundsForMathResultView](self, "p_updateLayoutBoundsForMathResultView");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v7, "invalidateFrame");

    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  }
}

- (BOOL)p_hasMathResultViews
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)decoratorOverlayViews
{
  void *v3;
  UIView *baseMathView;

  if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled"))
  {
    -[CRLFreehandDrawingRep p_updateBaseMathViewIfNeeded](self, "p_updateBaseMathViewIfNeeded");
    baseMathView = self->_baseMathView;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &baseMathView, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (CGRect)p_getUnRotatedFrameWithoutMathResults
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGRect v30;

  v3 = -[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicGeometry"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "infoGeometry"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  }
  v8 = v7;
  objc_msgSend(v7, "boundsBeforeRotation");
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingLayout](self, "p_freehandDrawingLayout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pureGeometryWithoutMathResults"));
  objc_msgSend(v14, "size");
  v16 = v15;
  v18 = v17;

  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingLayout](self, "p_freehandDrawingLayout"));
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "pureTransformInRootWithoutMathResults");
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
  }

  v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v26.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  v22 = *(_OWORD *)&v26.a;
  *(_OWORD *)&v26.c = v23;
  *(_OWORD *)&v26.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v21 = *(_OWORD *)&v26.tx;
  CGAffineTransformMakeTranslation(&t2, *(double *)&v29 - v10, *((double *)&v29 + 1) - v12);
  *(_OWORD *)&t1.a = v22;
  *(_OWORD *)&t1.c = v23;
  *(_OWORD *)&t1.tx = v21;
  CGAffineTransformConcat(&v26, &t1, &t2);
  t1 = v26;
  v30.origin.x = v10;
  v30.origin.y = v12;
  v30.size.width = v16;
  v30.size.height = v18;
  return CGRectApplyAffineTransform(v30, &t1);
}

- (void)p_teardownAndReinitializeMathRecognitionHandler
{
  _TtC8Freeform30CRLMathRecognitionItemsHandler *mathRecognitionHandler;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v4;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v5;

  -[CRLMathRecognitionItemsHandler willBeRemoved](self->_mathRecognitionHandler, "willBeRemoved");
  mathRecognitionHandler = self->_mathRecognitionHandler;
  self->_mathRecognitionHandler = 0;

  v4 = -[CRLMathRecognitionItemsHandler initWithRep:view:viewController:]([_TtC8Freeform30CRLMathRecognitionItemsHandler alloc], "initWithRep:view:viewController:", self, self->_baseMathView, self->_baseMathViewController);
  v5 = self->_mathRecognitionHandler;
  self->_mathRecognitionHandler = v4;

}

- (void)pkStrokesForFreehandItemsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EA30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03064();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EA50);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep pkStrokesForFreehandItemsDidChange:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 946, 0, "This operation must only be performed on the main thread.");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentItem"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));

    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123EA70);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E02FE4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123EA90);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep pkStrokesForFreehandItemsDidChange:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 950, 0, "Unexpected nil freehandDrawingIDToPKStrokesMap returned from pkDrawingsForFreehandItemsDidChange");

    }
    self->_waitingForLayoutPass = 1;
    -[CRLFreehandDrawingRep p_updatePKRecognitionControllerWithStrokes:useCachedSession:](self, "p_updatePKRecognitionControllerWithStrokes:useCachedSession:", v11, 0);

  }
}

- (void)updateDrawingShapeItemUUIDToStrokeDataUUIDDict:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "forwardKeys", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
        -[CRLBidirectionalMap setObject:forKeyedSubscript:](self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)removeDrawingShapeItemUUIDToStrokeDataUUIDPair:(id)a3
{
  -[CRLBidirectionalMap setObject:forKeyedSubscript:](self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap, "setObject:forKeyedSubscript:", 0, a3);
}

- (void)didUpdateShouldSolveMathForTriggerStroke:(id)a3 shouldSolveMath:(BOOL)a4 undoable:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  CRLBidirectionalMap *drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  _TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *v31;
  void *v32;
  _TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];

  v5 = a5;
  v6 = a4;
  drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap = self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_strokeDataUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBidirectionalMap objectForKeyedSubscript:](drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap, "objectForKeyedSubscript:", v10));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v13 = v12;
    if (!v12)
      goto LABEL_10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "childItems"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10018A3AC;
    v36[3] = &unk_10123EAB8;
    v36[4] = v11;
    v15 = objc_msgSend(v14, "indexOfObjectPassingTest:", v36);

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
    *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v16).n128_u64[0];
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "childItems", v17));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v15));
    v22 = sub_100221D0C(v19, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "commandController"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pencilKitStrokePathCompactData"));
      objc_msgSend(v26, "setShouldSolveMath:", v6);
      objc_msgSend(v25, "openGroup");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = v27;
      if (v6)
        v29 = CFSTR("Insert Result");
      else
        v29 = CFSTR("Remove Result");
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v29, 0, CFSTR("UndoStrings")));

      objc_msgSend(v25, "setCurrentGroupActionString:", v30);
      v31 = [_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData alloc];
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "maskPath"));
      v33 = -[CRLCommandSetFreehandDrawingShapeItemPKData initWithFreehandDrawingShapeItem:strokePathCompactData:maskPath:](v31, "initWithFreehandDrawingShapeItem:strokePathCompactData:maskPath:", v23, v26, v32);

      -[CRLCommand setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:](v33, "setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:", 0);
      if (v5)
        objc_msgSend(v25, "enqueueCommand:", v33);
      else
        objc_msgSend(v25, "enqueueWithNonUndoableCommand:", v33);
      objc_msgSend(v25, "closeGroup");

    }
    else
    {
LABEL_10:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123EAD8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E030E4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123EAF8);
      v34 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didUpdateShouldSolveMathForTriggerStroke:shouldSolveMath:undoable:]"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v35, 999, 0, "Could not locate freehand drawing shapeItem for _strokeDataUUID given by trigger stroke");

    }
  }

}

- (void)setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap
{
  void *v3;
  void *v4;
  void *v5;
  CRLBidirectionalMap *v6;
  CRLBidirectionalMap *drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  CRLBidirectionalMap *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EB18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03164();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EB38);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1005, 0, "setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap has already been called for this rep");

  }
  v6 = objc_alloc_init(CRLBidirectionalMap);
  drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap = self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
  self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pkDrawingProvider"));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childItems"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          if (v10)
          {
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "id"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "strokeDataUUIDForDrawingShapeItemUUID:", v17));

            if (v18)
            {
              v19 = self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "id"));
              -[CRLBidirectionalMap setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    v8 = v21;
  }

}

- (void)updateFromLayout
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *baseMathView;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  unsigned int v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[3];
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLGroupRep updateFromLayout](&v36, "updateFromLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "isCanvasInteractive");

  if (!v4)
    return;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  -[CRLFreehandDrawingRep p_getUnRotatedFrameWithoutMathResults](self, "p_getUnRotatedFrameWithoutMathResults");
  objc_msgSend(v5, "convertUnscaledToBoundsRect:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (vabdd_f64(v11 / v13, self->_previousAspectRatio) <= 0.001)
  {
    self->_waitingForLayoutPass = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v19, "invalidateContentLayersForRep:", self);

  }
  else
  {
    if (!-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
    {
      baseMathView = self->_baseMathView;
      v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v35[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v35[1] = v15;
      v35[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      -[UIView setTransform:](baseMathView, "setTransform:", v35);
      -[UIView setFrame:](self->_baseMathView, "setFrame:", v7, v9, v11, v13);
      self->_frameAtMathViewAttachment.origin.x = v7;
      self->_frameAtMathViewAttachment.origin.y = v9;
      self->_frameAtMathViewAttachment.size.width = v11;
      self->_frameAtMathViewAttachment.size.height = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pureGeometryInRoot"));
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "transform");
      }
      else
      {
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
      }
      self->_rotationAtMathViewAttachment = sub_1000791EC((double *)&v32);

    }
    self->_waitingForLayoutPass = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", v32, v33, v34));
    objc_msgSend(v26, "invalidateContentLayersForRep:", self);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v28 = objc_msgSend(v27, "isInDynamicOperation");

    if ((v28 & 1) == 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
      objc_msgSend(v31, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("hidden"));

      -[CRLMathRecognitionItemsHandler redrawSubviews](self->_mathRecognitionHandler, "redrawSubviews");
      goto LABEL_18;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v30 = objc_msgSend(v29, "isInDynamicOperation");

    if (v30)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
      v20 = v24;
      v25 = &__kCFBooleanTrue;
      goto LABEL_15;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
  if (!objc_msgSend(v20, "count"))
  {
LABEL_16:

    goto LABEL_18;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
  v23 = objc_msgSend(v22, "isHidden");

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
    v20 = v24;
    v25 = &__kCFBooleanFalse;
LABEL_15:
    objc_msgSend(v24, "setValue:forKey:", v25, CFSTR("hidden"));
    goto LABEL_16;
  }
LABEL_18:
  self->_previousAspectRatio = v11 / v13;
  if (-[CRLFreehandDrawingRep p_hasMathResultViews](self, "p_hasMathResultViews") && self->_attachedMathResultView)
  {
    -[CRLFreehandDrawingRep p_updateBaseMathViewIfNeeded](self, "p_updateBaseMathViewIfNeeded");
    if (!-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
      -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  }
}

- (void)p_updateBaseMathViewIfNeeded
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
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double width;
  double height;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v55;
  CGAffineTransform v56;
  _OWORD v57[3];
  CGAffineTransform v58;
  CGAffineTransform v59;

  -[CRLFreehandDrawingRep p_getUnRotatedFrameWithoutMathResults](self, "p_getUnRotatedFrameWithoutMathResults");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v11, "convertUnscaledToBoundsRect:", v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[UIView frame](self->_baseMathView, "frame");
  if (!sub_10005FF70(v20, v21, v22, v23, v13, v15, v17, v19)
    && self->_attachedMathResultView
    && !self->_waitingForLayoutPass)
  {
    width = self->_frameAtMathViewAttachment.size.width;
    height = self->_frameAtMathViewAttachment.size.height;
    v26 = v17 / width;
    v27 = v19 / height;
    v28 = sub_100061400(self->_frameAtMathViewAttachment.origin.x, self->_frameAtMathViewAttachment.origin.y, width, height);
    v29 = sub_100061400(v13, v15, v17, v19);
    v31 = sub_1000603B8(v29, v30, v28);
    v33 = v32;
    memset(&v59, 0, sizeof(v59));
    -[UIView bounds](self->_baseMathView, "bounds");
    v35 = v26 * (v34 * 0.5);
    -[UIView bounds](self->_baseMathView, "bounds");
    CGAffineTransformMakeTranslation(&v59, v35, v27 * (v36 * 0.5));
    memset(&v58, 0, sizeof(v58));
    -[UIView bounds](self->_baseMathView, "bounds");
    v38 = v26 * (v37 * -0.5);
    -[UIView bounds](self->_baseMathView, "bounds");
    CGAffineTransformMakeTranslation(&v58, v38, v27 * (v39 * -0.5));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pureGeometryInRoot"));
    v42 = v41;
    if (v41)
      objc_msgSend(v41, "transform");
    else
      memset(v57, 0, sizeof(v57));
    v43 = sub_1000791EC((double *)v57);

    memset(&v56, 0, sizeof(v56));
    CGAffineTransformMakeRotation(&t2, v43 - self->_rotationAtMathViewAttachment);
    t1 = v59;
    CGAffineTransformConcat(&v55, &t1, &t2);
    t1 = v58;
    CGAffineTransformConcat(&v56, &v55, &t1);
    v46 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    v45 = *(_OWORD *)&t1.a;
    *(_OWORD *)&t1.c = v46;
    *(_OWORD *)&t1.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v44 = *(_OWORD *)&t1.tx;
    CGAffineTransformMakeScale(&v52, v26, v27);
    *(_OWORD *)&v51.a = v45;
    *(_OWORD *)&v51.c = v46;
    *(_OWORD *)&v51.tx = v44;
    CGAffineTransformConcat(&t1, &v51, &v52);
    v50 = t1;
    v49 = v56;
    CGAffineTransformConcat(&v51, &v50, &v49);
    t1 = v51;
    CGAffineTransformMakeTranslation(&v48, v31, v33);
    v50 = t1;
    CGAffineTransformConcat(&v51, &v50, &v48);
    t1 = v51;
    v47 = v51;
    -[UIView setTransform:](self->_baseMathView, "setTransform:", &v47);
  }
}

- (void)subviewWillBeRemovedWithSubview:(id)a3
{
  -[CRLFreehandDrawingRep p_updateBoundsForMathResultSubviewsWillChangeWithDelay:](self, "p_updateBoundsForMathResultSubviewsWillChangeWithDelay:", 1);
}

- (void)didAddSubviewWithSubview:(id)a3
{
  -[CRLFreehandDrawingRep p_updateBoundsForMathResultSubviewsWillChangeWithDelay:](self, "p_updateBoundsForMathResultSubviewsWillChangeWithDelay:", 0);
}

- (void)p_updateBoundsForMathResultSubviewsWillChangeWithDelay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v5, "invalidateFrame");

  if (v3)
    -[CRLFreehandDrawingRep performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_updateLayoutBoundsForMathResultView", 0, 0.0);
  else
    -[CRLFreehandDrawingRep p_updateLayoutBoundsForMathResultView](self, "p_updateLayoutBoundsForMathResultView");
}

- (CGRect)p_boundsForMathResultViews
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect v29;
  CGRect result;
  CGRect v31;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subviews"));
        v14 = objc_msgSend(v13, "count");

        if (v14)
        {
          -[CRLFreehandDrawingRep p_boundsInNaturalSpaceForMathView:](self, "p_boundsInNaturalSpaceForMathView:", v12);
          v31.origin.x = v15;
          v31.origin.y = v16;
          v31.size.width = v17;
          v31.size.height = v18;
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = width;
          v28.size.height = height;
          v29 = CGRectUnion(v28, v31);
          x = v29.origin.x;
          y = v29.origin.y;
          width = v29.size.width;
          height = v29.size.height;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)p_updateLayoutBoundsForMathResultView
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
  id v12;

  -[CRLFreehandDrawingRep p_boundsForMathResultViews](self, "p_boundsForMathResultViews");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingLayout](self, "p_freehandDrawingLayout"));
  objc_msgSend(v11, "setBoundsForMathResultViews:", v4, v6, v8, v10);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v12, "invalidateFrame");

}

- (void)p_drawChildShapeRepsWithPencilKitStrokes:(id)a3 togetherInContext:(CGContext *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  unsigned int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  _BYTE v41[128];

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EB58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E031E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EB78);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_drawChildShapeRepsWithPencilKitStrokes:togetherInContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1125, 0, "Should be drawing at least two shape reps here.");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13), "shapeLayout"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pencilKitStrokesInParentInfoSpace"));
        if (v15)
        {
          objc_msgSend(v8, "addObjectsFromArray:", v15);
        }
        else
        {
          v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10123EB98);
          v17 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v32 = v16;
            v33 = 2082;
            v34 = "-[CRLFreehandDrawingRep p_drawChildShapeRepsWithPencilKitStrokes:togetherInContext:]";
            v35 = 2082;
            v36 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m";
            v37 = 1024;
            v38 = 1131;
            v39 = 2082;
            v40 = "currentStrokesInDrawingSpace";
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10123EBB8);
          v18 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v21 = v18;
            v22 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v32 = v16;
            v33 = 2114;
            v34 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_drawChildShapeRepsWithPencilKitStrokes:togetherInContext:]"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1131, 0, "invalid nil value for '%{public}s'", "currentStrokesInDrawingSpace");

        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v11);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "backgroundColor"));
  +[CRLPencilKitInkStroke drawStrokes:inContext:overTransparentCanvas:](CRLPencilKitInkStroke, "drawStrokes:inContext:overTransparentCanvas:", v8, a4, v24 == 0);

}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  _BYTE v31[128];
  CGRect ClipBoundingBox;

  v6 = a4;
  if (!-[CRLFreehandDrawingRep p_isTrifurcatedRenderingEnabled](self, "p_isTrifurcatedRenderingEnabled"))
  {
    ClipBoundingBox = CGContextGetClipBoundingBox(a3);
    x = ClipBoundingBox.origin.x;
    y = ClipBoundingBox.origin.y;
    width = ClipBoundingBox.size.width;
    height = ClipBoundingBox.size.height;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_shapeChildrenForDrawingRecursively](self, "p_shapeChildrenForDrawingRecursively"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10018B858;
    v25[3] = &unk_10123EBE0;
    v12 = v6;
    v26 = v12;
    v27 = x;
    v28 = y;
    v29 = width;
    v30 = height;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_arrayOfObjectsPassingTest:", v25));

    -[CRLFreehandDrawingRep p_drawShapeChildren:inContext:](self, "p_drawShapeChildren:inContext:", v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_childrenToExcludeFromFlattenedDrawing](self, "p_childrenToExcludeFromFlattenedDrawing"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "containsObject:", v20)
            && (!v12 || (*((unsigned int (**)(id, void *))v12 + 2))(v12, v20)))
          {
            CGContextSaveGState(a3);
            objc_msgSend(v20, "recursivelyDrawInContext:keepingChildrenPassingTest:", a3, v12);
            CGContextRestoreGState(a3);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      }
      while (v17);
    }

  }
}

- (void)p_drawShapeChildren:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  int v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGContext *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  CGImage *Image;
  int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect ClipBoundingBox;

  v6 = a3;
  v7 = sub_100411FB8((uint64_t)a4);
  if (v7)
  {
    -[CRLGroupRep clipRect](self, "clipRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    ClipBoundingBox = CGContextGetClipBoundingBox(a4);
    v58.origin.x = v9;
    v58.origin.y = v11;
    v58.size.width = v13;
    v58.size.height = v15;
    v59 = CGRectIntersection(v58, ClipBoundingBox);
    x = v59.origin.x;
    y = v59.origin.y;
    width = v59.size.width;
    height = v59.size.height;
    if (CGRectIsEmpty(v59))
      goto LABEL_23;
    v52 = v7;
    v20 = sub_1000603DC(width, height, 3.0);
    v22 = v21;
    v23 = sub_10040EB4C();
    v25 = sub_100062E10(v20, v22, v23, v24);
    v26 = v20 / v25;
    v28 = sub_10040FA64(35, v25, v27);
    v29 = sub_100411DA0((uint64_t)a4);
    v30 = sub_100411FB8((uint64_t)a4);
    v31 = sub_1004120C4((uint64_t)a4);
    v32 = sub_1004121D0((uint64_t)a4);
    v33 = sub_100411EAC((uint64_t)a4);
    sub_10040F974((uint64_t)v28, v29, v30, v31, v33, v32);
    CGContextScaleCTM(v28, 1.0 / v26, 1.0 / v26);
    CGContextScaleCTM(v28, 3.0, 3.0);
    CGContextTranslateCTM(v28, -x, -y);
  }
  else
  {
    v52 = 0;
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    v28 = a4;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v6, "count"))
  {
    v35 = 0;
    v36 = 1;
    while (1)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v36 - 1));
      if ((id)v36 == objc_msgSend(v6, "count"))
        break;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v36));
      if (!-[CRLFreehandDrawingRep p_shouldDrawShapeRep:withOtherShapeRep:](self, "p_shouldDrawShapeRep:withOtherShapeRep:", v37, v38))goto LABEL_10;
LABEL_11:

      if (v36++ >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_13;
    }
    v38 = 0;
LABEL_10:
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v35, v36 - v35));
    objc_msgSend(v34, "addObject:", v39);

    v35 = v36;
    goto LABEL_11;
  }
LABEL_13:
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v41 = v34;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v54;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v54 != v44)
          objc_enumerationMutation(v41);
        v46 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v45), "rangeValue");
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", v46, v47));
        -[CRLFreehandDrawingRep p_drawChildShapeReps:togetherInContext:](self, "p_drawChildShapeReps:togetherInContext:", v48, v28);

        v45 = (char *)v45 + 1;
      }
      while (v43 != v45);
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v43);
  }

  if (v52)
  {
    v49 = sub_100411820((uint64_t)a4);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    objc_msgSend(v50, "beginFreehandDrawing:", self);
    Image = CGBitmapContextCreateImage(v28);
    CGContextRelease(v28);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    CGContextDrawImage(a4, v60, Image);
    CGImageRelease(Image);
    objc_msgSend(v50, "endFreehandDrawing:", self);

  }
LABEL_23:

}

- (void)didUpdateRenderable:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  v3 = a3;
  -[CRLCanvasRep didUpdateRenderable:](&v5, "didUpdateRenderable:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer", v5.receiver, v5.super_class));

  objc_msgSend(v4, "setDrawsAsynchronously:", 1);
}

- (CRLWidthLimitedQueue)queueForConcurrentlyDrawingChildrenIntoLayersIfSafe
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (qword_101414F00 != -1)
    dispatch_once(&qword_101414F00, &stru_10123EC00);
  v3 = atomic_load((unsigned __int8 *)&self->_safeForChildrenToDrawConcurrently);
  if ((v3 & 1) != 0)
  {
    v7 = (id)qword_101414EF8;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EC20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03264();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EC40);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep queueForConcurrentlyDrawingChildrenIntoLayersIfSafe]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1336, 0, "Trying to get the concurrent queue when it isn't safe to do so.");

    v7 = 0;
  }
  return (CRLWidthLimitedQueue *)v7;
}

- (void)willUpdateChildLayers
{
  atomic_store(1u, (unsigned __int8 *)&self->_safeForChildrenToDrawConcurrently);
}

- (void)didUpdateChildLayers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep queueForConcurrentlyDrawingChildrenIntoLayersIfSafe](self, "queueForConcurrentlyDrawingChildrenIntoLayersIfSafe"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EC60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E032E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EC80);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didUpdateChildLayers]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1352, 0, "invalid nil value for '%{public}s'", "queue");

  }
  atomic_store(0, (unsigned __int8 *)&self->_safeForChildrenToDrawConcurrently);
  objc_msgSend(v3, "performSync:", &stru_10123ECA0);

}

- (id)additionalRenderablesOverRenderable
{
  NSArray *v3;
  void *v4;
  CRLFreehandDrawingRepTrifurcationContainer *activeTrifurcationContainer;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *v20;
  NSArray *dataDetectorRenderables;
  uint64_t v22;
  _OWORD v24[3];
  _OWORD v25[3];
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _QWORD v34[3];

  v33.receiver = self;
  v33.super_class = (Class)CRLFreehandDrawingRep;
  v3 = -[CRLCanvasRep additionalRenderablesOverRenderable](&v33, "additionalRenderablesOverRenderable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!-[CRLFreehandDrawingRep p_isTrifurcatedRenderingEnabled](self, "p_isTrifurcatedRenderingEnabled"))
  {
    -[CRLFreehandDrawingRepTrifurcationContainer tearDown](self->_activeTrifurcationContainer, "tearDown");
    activeTrifurcationContainer = self->_activeTrifurcationContainer;
    self->_activeTrifurcationContainer = 0;
    goto LABEL_40;
  }
  activeTrifurcationContainer = (CRLFreehandDrawingRepTrifurcationContainer *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_trifurcationContainer](self, "p_trifurcationContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepTrifurcationContainer backRenderable](activeTrifurcationContainer, "backRenderable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepTrifurcationContainer middleRenderable](activeTrifurcationContainer, "middleRenderable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepTrifurcationContainer frontRenderable](activeTrifurcationContainer, "frontRenderable"));
  if (v6)
  {
    if (v7)
      goto LABEL_4;
LABEL_19:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123ED00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E033FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123ED20);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep additionalRenderablesOverRenderable]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 1370, 0, "invalid nil value for '%{public}s'", "middleRenderable");

    if (v8)
      goto LABEL_5;
LABEL_28:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123ED40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03370();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123ED60);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep additionalRenderablesOverRenderable]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1371, 0, "invalid nil value for '%{public}s'", "frontRenderable");

    goto LABEL_39;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123ECC0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E03488();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123ECE0);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep additionalRenderablesOverRenderable]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1369, 0, "invalid nil value for '%{public}s'", "backRenderable");

  if (!v7)
    goto LABEL_19;
LABEL_4:
  if (!v8)
    goto LABEL_28;
LABEL_5:
  if (v6 && v7)
  {
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    if (activeTrifurcationContainer)
    {
      -[CRLFreehandDrawingRepTrifurcationContainer transformForMiddleRenderable:](activeTrifurcationContainer, "transformForMiddleRenderable:", 0);
      v28 = 0u;
      v29 = 0u;
      v27 = 0u;
      -[CRLFreehandDrawingRepTrifurcationContainer transformForMiddleRenderable:](activeTrifurcationContainer, "transformForMiddleRenderable:", 1);
    }
    else
    {
      v28 = 0uLL;
      v29 = 0uLL;
      v27 = 0uLL;
    }
    v26[0] = v30;
    v26[1] = v31;
    v26[2] = v32;
    objc_msgSend(v6, "setAffineTransform:", v26);
    v25[0] = v27;
    v25[1] = v28;
    v25[2] = v29;
    objc_msgSend(v7, "setAffineTransform:", v25);
    v24[0] = v30;
    v24[1] = v31;
    v24[2] = v32;
    objc_msgSend(v8, "setAffineTransform:", v24);
    v34[0] = v6;
    v34[1] = v7;
    v34[2] = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 3));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v18));

    v4 = (void *)v19;
  }
LABEL_39:

LABEL_40:
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 2))
  {
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_makeDataDetectorRenderables:](self, "p_makeDataDetectorRenderables:", self->_drawingDetectionItems));
    dataDetectorRenderables = self->_dataDetectorRenderables;
    self->_dataDetectorRenderables = v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", self->_dataDetectorRenderables));
    v4 = (void *)v22;
  }
  return v4;
}

- (void)beginTrifurcatedRenderForChildRep:(id)a3
{
  id v4;
  CRLFreehandDrawingRep *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CRLFreehandDrawingRepTrifurcationContainer *activeTrifurcationContainer;
  void *v13;

  v4 = a3;
  v5 = (CRLFreehandDrawingRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

  if (v5 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123ED80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03594();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EDA0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep beginTrifurcatedRenderForChildRep:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1403, 0, "expected equality between %{public}s and %{public}s", "childRep.parentRep", "self");

  }
  if (-[NSMutableSet containsObject:](self->_childRepsForTrifurcation, "containsObject:", v4))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EDC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03514();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EDE0);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep beginTrifurcatedRenderForChildRep:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1404, 0, "Should not ask to begin trifurcated render for a child rep for which it has already begun.");

  }
  -[NSMutableSet addObject:](self->_childRepsForTrifurcation, "addObject:", v4);
  -[CRLFreehandDrawingRepTrifurcationContainer tearDown](self->_activeTrifurcationContainer, "tearDown");
  activeTrifurcationContainer = self->_activeTrifurcationContainer;
  self->_activeTrifurcationContainer = 0;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v13, "invalidateContentLayersForRep:", self);

  if (-[NSMutableSet count](self->_childRepsForTrifurcation, "count") == (id)1)
    -[CRLFreehandDrawingRep setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)endTrifurcatedRenderForChildRep:(id)a3
{
  id v4;
  CRLFreehandDrawingRep *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (CRLFreehandDrawingRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

  if (v5 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EE00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E036B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EE20);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep endTrifurcatedRenderForChildRep:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1422, 0, "expected equality between %{public}s and %{public}s", "childRep.parentRep", "self");

  }
  if ((-[NSMutableSet containsObject:](self->_childRepsForTrifurcation, "containsObject:", v4) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EE40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03630();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EE60);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep endTrifurcatedRenderForChildRep:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1423, 0, "Should not ask to end trifurcated render for a child rep that did not begin it.");

  }
  -[NSMutableSet removeObject:](self->_childRepsForTrifurcation, "removeObject:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v12, "invalidateContentLayersForRep:", self);

  if (!-[NSMutableSet count](self->_childRepsForTrifurcation, "count"))
    -[CRLFreehandDrawingRep setNeedsDisplay](self, "setNeedsDisplay");

}

- (BOOL)p_isTrifurcatedRenderingEnabled
{
  return -[NSMutableSet count](self->_childRepsForTrifurcation, "count") != 0;
}

- (id)p_trifurcationContainer
{
  void *v3;
  void *v4;
  void *v5;
  CRLFreehandDrawingRepTrifurcationContainer *activeTrifurcationContainer;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  void *v19;
  unsigned int v20;
  CRLFreehandDrawingRepTrifurcationContainer *v21;
  CRLFreehandDrawingRepTrifurcationContainer *v22;
  CRLFreehandDrawingRepTrifurcationContainer *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  if (!-[CRLFreehandDrawingRep p_isTrifurcatedRenderingEnabled](self, "p_isTrifurcatedRenderingEnabled"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EE80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0374C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EEA0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_trifurcationContainer]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1442, 0, "Should not ask for the trifurcation container when rendering is not trifurcated.");

  }
  activeTrifurcationContainer = self->_activeTrifurcationContainer;
  if (activeTrifurcationContainer)
    return activeTrifurcationContainer;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = -[NSMutableSet mutableCopy](self->_childRepsForTrifurcation, "mutableCopy");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_shapeChildrenForDrawingRecursively](self, "p_shapeChildrenForDrawingRecursively"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v18 = objc_msgSend(v11, "count");
        v19 = v10;
        if (v18)
        {
          v20 = objc_msgSend(v11, "containsObject:", v17);
          v19 = v8;
          if (v20)
          {
            objc_msgSend(v11, "removeObject:", v17);
            v19 = v9;
          }
        }
        objc_msgSend(v19, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }
  v21 = -[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]([CRLFreehandDrawingRepTrifurcationContainer alloc], "initWithDelegate:backReps:middleReps:frontReps:", self, v8, v9, v10);
  v22 = self->_activeTrifurcationContainer;
  self->_activeTrifurcationContainer = v21;

  v23 = self->_activeTrifurcationContainer;
  return v23;
}

- (void)didAddSixChannelEnabledChildRep:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CRLFreehandDrawingRep *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v6 = objc_msgSend(v5, "isCanvasInteractive");

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EEC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E038E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EEE0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelEnabledChildRep:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1484, 0, "Should not call -didAddSixChannelEnabledChildRep: on a non-interactive canvas.");

  }
  if (-[NSMutableSet containsObject:](self->_childRepsWithSixChannelRenderEnabled, "containsObject:", v4))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EF00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03868();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EF20);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelEnabledChildRep:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1485, 0, "Should not report to add a six channel enabled child rep that is already added.");

  }
  v13 = (CRLFreehandDrawingRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

  if (v13 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EF40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E037CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EF60);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelEnabledChildRep:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1486, 0, "expected equality between %{public}s and %{public}s", "childRep.parentRep", "self");

  }
  -[NSMutableSet addObject:](self->_childRepsWithSixChannelRenderEnabled, "addObject:", v4);
  if (-[NSMutableSet count](self->_childRepsWithSixChannelRenderEnabled, "count") == (id)1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v17, "invalidateContentLayersForRep:", self);

  }
}

- (void)didRemoveSixChannelEnabledChildRep:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v6 = objc_msgSend(v5, "isCanvasInteractive");

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EF80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E039E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EFA0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didRemoveSixChannelEnabledChildRep:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1497, 0, "Should not call -didRemoveSixChannelEnabledChildRep: on a non-interactive canvas.");

  }
  if ((-[NSMutableSet containsObject:](self->_childRepsWithSixChannelRenderEnabled, "containsObject:", v4) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EFC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03968();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123EFE0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didRemoveSixChannelEnabledChildRep:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1498, 0, "Should not report to remove a six channel enabled child rep that was not added.");

  }
  -[NSMutableSet removeObject:](self->_childRepsWithSixChannelRenderEnabled, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_childRepsWithSixChannelRenderEnabled, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v13, "invalidateContentLayersForRep:", self);

  }
}

- (void)didAddSixChannelSuppressingChildRep:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CRLFreehandDrawingRep *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v6 = objc_msgSend(v5, "isCanvasInteractive");

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F000);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03B84();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F020);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelSuppressingChildRep:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1510, 0, "Should not call -didAddSixChannelSuppressingChildRep: on a non-interactive canvas.");

  }
  if (-[NSMutableSet containsObject:](self->_childRepsSuppressingSixChannelRender, "containsObject:", v4))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F040);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03B04();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F060);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelSuppressingChildRep:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1511, 0, "Should not report to add a six channel suppressing child rep that is already added.");

  }
  v13 = (CRLFreehandDrawingRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

  if (v13 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F080);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03A68();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F0A0);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelSuppressingChildRep:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1512, 0, "expected equality between %{public}s and %{public}s", "childRep.parentRep", "self");

  }
  -[NSMutableSet addObject:](self->_childRepsSuppressingSixChannelRender, "addObject:", v4);
  if (-[NSMutableSet count](self->_childRepsSuppressingSixChannelRender, "count") == (id)1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v17, "invalidateContentLayersForRep:", self);

  }
}

- (void)didRemoveSixChannelSuppressingChildRep:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v6 = objc_msgSend(v5, "isCanvasInteractive");

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F0C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03C84();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F0E0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didRemoveSixChannelSuppressingChildRep:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1523, 0, "Should not call -didRemoveSixChannelSuppressingChildRep: on a non-interactive canvas.");

  }
  if ((-[NSMutableSet containsObject:](self->_childRepsSuppressingSixChannelRender, "containsObject:", v4) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F100);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03C04();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F120);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didRemoveSixChannelSuppressingChildRep:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1524, 0, "Should not report to remove a six channel suppressing child rep that was not added.");

  }
  -[NSMutableSet removeObject:](self->_childRepsSuppressingSixChannelRender, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_childRepsSuppressingSixChannelRender, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v13, "invalidateContentLayersForRep:", self);

  }
}

- (BOOL)p_wantsSixChannelLayer
{
  return !-[NSMutableSet count](self->_childRepsSuppressingSixChannelRender, "count")
      && -[NSMutableSet count](self->_childRepsWithSixChannelRenderEnabled, "count") != 0;
}

- (id)beginEditingChildrenIfAllowedAtUnscaledPoint:(CGPoint)a3 pickingDeepestChild:(BOOL)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  CRLFreehandDrawingRep *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", a4, a3.x, a3.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "canBeginFreehandDrawingMode");

  if (v7)
  {
    v8 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v8, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v8, "interactiveCanvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasEditor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v8, "info"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPathWithInfo:", v13));
    objc_msgSend(v10, "setSelectionPath:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v8, "interactiveCanvasController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "freehandDrawingToolkit"));
    objc_msgSend(v16, "beginDrawingModeIfNeededForTouchType:", 1);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5
{
  _BOOL8 v5;
  double y;
  double x;
  unsigned int (**v9)(id, CRLFreehandDrawingRep *);
  CRLFreehandDrawingRep *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  objc_super v18;
  CGPoint v19;
  CGRect v20;

  v5 = a4;
  y = a3.y;
  x = a3.x;
  v9 = (unsigned int (**)(id, CRLFreehandDrawingRep *))a5;
  if (!-[CRLGroupRep containsPoint:withPrecision:](self, "containsPoint:withPrecision:", v5, x, y)
    || v9 && !v9[2](v9, self)
    || (v10 = self) == 0)
  {
    if (-[CRLFreehandDrawingRep p_hasMathResultViews](self, "p_hasMathResultViews")
      && (-[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs"),
          v19.x = x,
          v19.y = y,
          CGRectContainsPoint(v20, v19)))
    {
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "freehandDrawingToolkit"));
  v14 = objc_msgSend(v13, "isInDrawingMode");

  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)CRLFreehandDrawingRep;
    v15 = -[CRLCanvasRep hitRep:withPrecision:passingTest:](&v18, "hitRep:withPrecision:passingTest:", v5, v9, x, y);
    v16 = objc_claimAutoreleasedReturnValue(v15);

    v10 = (CRLFreehandDrawingRep *)v16;
  }

  return v10;
}

- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4
{
  double y;
  double x;
  id v7;
  CRLFreehandDrawingRep *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double b;
  double a;
  double d;
  double c;
  double ty;
  double tx;
  NSArray *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  CRLFreehandDrawingRep *i;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  const CGPath *CopyByStrokingPath;
  _BOOL4 v34;
  double v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGAffineTransform v42;
  objc_super v43;
  _BYTE v44[128];
  CGPoint v45;
  CGPoint v46;
  CGRect v47;

  y = a3.y;
  x = a3.x;
  v43.receiver = self;
  v43.super_class = (Class)CRLFreehandDrawingRep;
  v7 = -[CRLCanvasRep hitRepChrome:passingTest:](&v43, "hitRepChrome:passingTest:", a4);
  v8 = (CRLFreehandDrawingRep *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    if (!-[CRLFreehandDrawingRep p_hasMathResultViews](self, "p_hasMathResultViews")
      || (-[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs"),
          v46.x = x,
          v46.y = y,
          !CGRectContainsPoint(v47, v46))
      || (v8 = self) == 0)
    {
      if (-[NSArray count](self->_drawingDetectionItems, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
        objc_msgSend(v9, "viewScale");
        v37 = v10;

        -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
        v36 = v11;
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
        objc_msgSend(v14, "viewScale");
        v16 = v15;

        memset(&v42, 0, sizeof(v42));
        CGAffineTransformMakeScale(&v42, v16, v16);
        a = v42.a;
        b = v42.b;
        c = v42.c;
        d = v42.d;
        tx = v42.tx;
        ty = v42.ty;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v23 = self->_dataDetectorRenderables;
        v8 = (CRLFreehandDrawingRep *)-[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v8)
        {
          v25 = ty + v13 * d + b * v36;
          v26 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v8; i = (CRLFreehandDrawingRep *)((char *)i + 1))
            {
              if (*(_QWORD *)v39 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
              objc_opt_class(CRLCanvasShapeRenderable, v24);
              v30 = sub_100221D0C(v29, v28);
              v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
              v32 = v31;
              if (v31)
              {
                CopyByStrokingPath = CGPathCreateCopyByStrokingPath((CGPathRef)objc_msgSend(v31, "path"), 0, 40.0 / v37, kCGLineCapButt, kCGLineJoinBevel, 1.0);
                v45.x = tx + v13 * c + a * v36;
                v45.y = v25;
                v34 = CGPathContainsPoint(CopyByStrokingPath, 0, v45, 0);
                CGPathRelease(CopyByStrokingPath);
                if (v34)
                {
                  v8 = self;

                  goto LABEL_18;
                }
              }

            }
            v8 = (CRLFreehandDrawingRep *)-[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
            if (v8)
              continue;
            break;
          }
        }
LABEL_18:

      }
      else
      {
        v8 = 0;
      }
    }
  }
  return v8;
}

- (CGRect)frameInUnscaledCanvasForMarqueeSelecting
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  objc_super v19;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLGroupRep frameInUnscaledCanvasForMarqueeSelecting](&v19, "frameInUnscaledCanvasForMarqueeSelecting");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CRLFreehandDrawingRep p_hasMathResultViews](self, "p_hasMathResultViews"))
  {
    -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v8;
  objc_super v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)CRLFreehandDrawingRep;
  if (-[CRLGroupRep intersectsUnscaledRect:](&v10, "intersectsUnscaledRect:"))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v8 = -[CRLFreehandDrawingRep p_hasMathResultViews](self, "p_hasMathResultViews");
    if (v8)
    {
      -[CRLFreehandDrawingRep frameInUnscaledCanvasForMarqueeSelecting](self, "frameInUnscaledCanvasForMarqueeSelecting");
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      v12 = CGRectIntersection(v11, v13);
      v14.origin.x = CGRectNull.origin.x;
      v14.origin.y = CGRectNull.origin.y;
      v14.size.width = CGRectNull.size.width;
      v14.size.height = CGRectNull.size.height;
      LOBYTE(v8) = !CGRectEqualToRect(v12, v14);
    }
  }
  return v8;
}

- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3
{
  void *v4;
  unsigned int v5;

  if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled", a3.x, a3.y))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v5 = objc_msgSend(v4, "documentIsSharedReadOnly") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)handleEditMenuTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  void *v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  y = a3.y;
  x = a3.x;
  if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled", a4)&& -[CRLCanvasRep isSelected](self, "isSelected"))
  {
    -[CRLMathRecognitionItemsHandler setShouldCallEditMenuTapForRep:](self->_mathRecognitionHandler, "setShouldCallEditMenuTapForRep:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "miniFormatterPresenter"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asiOSPresenter"));
    v11 = objc_msgSend(v10, "isPresentingInFixedPosition");

    if (self->_allowedToToggleMathPopoverUI)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMathRecognitionItemsHandler mathViewController](self->_mathRecognitionHandler, "mathViewController"));
      v13 = objc_msgSend(v12, "handleSingleTapAtDrawingLocation:", x, y);

      self->_isPresentingMathPopoverUI = -[CRLMathRecognitionItemsHandler isPresentingPopoverUI](self->_mathRecognitionHandler, "isPresentingPopoverUI");
      if (v13)
      {
        if (((objc_msgSend(v9, "isPresentingMiniFormatter") ^ 1 | v11) & 1) == 0)
          -[CRLFreehandDrawingRep p_hideMiniFormatter](self, "p_hideMiniFormatter");
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews", 0));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v24 != v17)
                objc_enumerationMutation(v14);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1)
                                                                                 + 8 * (_QWORD)i), "subviews"));
              v20 = objc_msgSend(v19, "count");

              if (v20)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
                objc_msgSend(v21, "invalidateContentLayersForRep:", self);

                goto LABEL_20;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v16)
              continue;
            break;
          }
        }
LABEL_20:

      }
    }
    else
    {
      self->_allowedToToggleMathPopoverUI = 1;
    }
    if (self->_isPresentingMathPopoverUI)
      v22 = 1;
    else
      v22 = v11;
    if ((v22 & 1) == 0)
      -[CRLFreehandDrawingRep p_toggleMiniFormatter](self, "p_toggleMiniFormatter");

  }
  else if (-[CRLGroupRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking"))
  {
    -[CRLFreehandDrawingRep p_toggleMiniFormatter](self, "p_toggleMiniFormatter");
  }
}

- (BOOL)manuallyControlsMiniFormatter
{
  unsigned __int8 v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingRep;
  v2 = -[CRLCanvasRep manuallyControlsMiniFormatter](&v4, "manuallyControlsMiniFormatter");
  return +[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled") | v2;
}

- (void)p_toggleMiniFormatter
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "miniFormatterPresenter"));
  v6 = objc_msgSend(v5, "isPresentingMiniFormatter");

  if (v6)
    -[CRLFreehandDrawingRep p_hideMiniFormatter](self, "p_hideMiniFormatter");
  else
    -[CRLFreehandDrawingRep p_showMiniFormatter](self, "p_showMiniFormatter");
}

- (void)p_showMiniFormatter
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if ((objc_msgSend(v6, "documentIsSharedReadOnly") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "miniFormatterPresenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_selectionPath](self, "p_selectionPath"));
    objc_msgSend(v4, "presentMiniFormatterForSelectionPath:", v5);

  }
}

- (void)p_hideMiniFormatter
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "miniFormatterPresenter"));
  objc_msgSend(v4, "dismissMiniFormatterForRep:", self);

}

- (id)p_selectionPath
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[CRLCanvasRep isSelected](self, "isSelected");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfo:", v8));

  }
  return v7;
}

- (BOOL)handledLassoTapAtPoint:(CGPoint)a3 withInputType:(int64_t)a4
{
  double y;
  double x;
  unsigned int v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingRep;
  v7 = -[CRLCanvasRep handledLassoTapAtPoint:withInputType:](&v9, "handledLassoTapAtPoint:withInputType:", a4);
  if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled"))
    v7 |= -[CRLFreehandDrawingRep p_handledTapAtPoint:](self, "p_handledTapAtPoint:", x, y);
  return v7;
}

- (BOOL)handledDirectTouchForDrawingModePencilOnlyAtPoint:(CGPoint)a3
{
  double y;
  double x;
  unsigned int v6;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingRep;
  v6 = -[CRLCanvasRep handledDirectTouchForDrawingModePencilOnlyAtPoint:](&v8, "handledDirectTouchForDrawingModePencilOnlyAtPoint:");
  if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled"))
    v6 |= -[CRLFreehandDrawingRep p_handledTapAtPoint:](self, "p_handledTapAtPoint:", x, y);
  return v6;
}

- (BOOL)p_handledTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  unsigned __int8 v8;

  y = a3.y;
  x = a3.x;
  -[CRLMathRecognitionItemsHandler setShouldCallEditMenuTapForRep:](self->_mathRecognitionHandler, "setShouldCallEditMenuTapForRep:", 0);
  if (-[CRLCanvasRep isLocked](self, "isLocked"))
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMathRecognitionItemsHandler mathViewController](self->_mathRecognitionHandler, "mathViewController"));
  v8 = objc_msgSend(v7, "handleSingleTapAtDrawingLocation:", x, y);

  return v8;
}

- (BOOL)directlyManagesLayerContent
{
  objc_super v4;

  if (-[CRLFreehandDrawingRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingRep;
  return -[CRLGroupRep directlyManagesLayerContent](&v4, "directlyManagesLayerContent");
}

- (Class)layerClass
{
  uint64_t v3;
  __objc2_class *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  if (-[CRLFreehandDrawingRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer"))
  {
    if (-[CRLFreehandDrawingRep p_wantsSixChannelLayer](self, "p_wantsSixChannelLayer"))
      v4 = CRLSixChannelTilingLayer;
    else
      v4 = CRLTilingLayer;
    objc_opt_class(v4, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLFreehandDrawingRep;
    v5 = -[CRLGroupRep layerClass](&v9, "layerClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return (Class)v6;
}

- (BOOL)drawsDescendantsIntoLayer
{
  if (!self->_drawsDescendantsIntoLayer)
  {
    self->_drawsDescendantsIntoLayer = 1;
    -[CRLFreehandDrawingRep setNeedsDisplay](self, "setNeedsDisplay");
  }
  return 1;
}

- (CGRect)frameInUnscaledCanvas
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if (-[CRLFreehandDrawingRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer"))
  {
    -[CRLGroupRep clipRect](self, "clipRect");
    -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLFreehandDrawingRep;
    -[CRLGroupRep frameInUnscaledCanvas](&v7, "frameInUnscaledCanvas");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)i_baseFrameInUnscaledCanvasForPositioningLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if (-[CRLFreehandDrawingRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer"))
  {
    -[CRLFreehandDrawingRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLFreehandDrawingRep;
    -[CRLGroupRep i_baseFrameInUnscaledCanvasForPositioningLayer](&v7, "i_baseFrameInUnscaledCanvasForPositioningLayer");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)skipsRerenderForTranslation
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasController"));
  v4 = objc_msgSend(v3, "shouldSupportedDynamicOperationsEnqueueCommandsInRealTime");

  return v4;
}

- (void)setNeedsDisplay
{
  objc_super v3;

  if (-[CRLFreehandDrawingRep p_shouldAllowSetNeedsDisplay](self, "p_shouldAllowSetNeedsDisplay"))
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLFreehandDrawingRep;
    -[CRLGroupRep setNeedsDisplay](&v3, "setNeedsDisplay");
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CRLFreehandDrawingRep p_shouldAllowSetNeedsDisplay](self, "p_shouldAllowSetNeedsDisplay"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLFreehandDrawingRep;
    -[CRLCanvasRep setNeedsDisplayInRect:](&v8, "setNeedsDisplayInRect:", x, y, width, height);
  }
}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unsigned int v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep updateRenderableGeometryFromLayout:](&v15, "updateRenderableGeometryFromLayout:", v4);
  objc_msgSend(v4, "frame");
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v14 = objc_msgSend(v13, "layoutState");

  if (v14 != 3
    && !sub_10005FDF0(v6, v8, v10, v12)
    && -[CRLFreehandDrawingRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer")
    && !-[CRLFreehandDrawingRep p_isTrifurcatedRenderingEnabled](self, "p_isTrifurcatedRenderingEnabled")
    && -[CRLFreehandDrawingRep p_shouldAllowSetNeedsDisplay](self, "p_shouldAllowSetNeedsDisplay"))
  {
    objc_msgSend(v4, "setNeedsDisplay");
  }

}

- (void)becameSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep becameSelected](&v3, "becameSelected");
  self->_allowedToToggleMathPopoverUI = 0;
  self->_isPresentingMathPopoverUI = 0;
}

- (void)becameNotSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep becameNotSelected](&v3, "becameNotSelected");
  -[_PKDataDetectorInteraction setEnabled:](self->_pkDataDetectorInteraction, "setEnabled:", 0);
}

- (id)childRepsToInformForSelectabilityChanges
{
  return +[NSMutableSet set](NSMutableSet, "set");
}

- (BOOL)shouldShowSelectionHighlight
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingRep;
  v3 = -[CRLGroupRep shouldShowSelectionHighlight](&v8, "shouldShowSelectionHighlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  v6 = objc_msgSend(v5, "isInDrawingMode");

  return v3 & ~v6;
}

- (double)p_zPositionForSelectionHighlightLayer
{
  void *v2;
  void *v3;
  unsigned int v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "freehandDrawingToolkit"));
  v4 = objc_msgSend(v3, "isInDrawingMode");

  result = 0.0;
  if (v4)
    return 1.0;
  return result;
}

- (BOOL)shouldShowKnobs
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingRep;
  v3 = -[CRLCanvasRep shouldShowKnobs](&v8, "shouldShowKnobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  v6 = objc_msgSend(v5, "isInDrawingMode");

  return v3 & ~v6;
}

- (BOOL)p_shouldHideDataDetectors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  if (-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation") || !objc_msgSend(v4, "count"))
  {
    v7 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
    if ((objc_msgSend(v6, "isInDrawingMode") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
      v7 = v8 != 0;

    }
  }

  return v7;
}

- (id)p_makeDataDetectorRenderables:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *i;
  void *v15;
  void *v16;
  CRLCanvasDataDetectorStrokeRenderable *v17;
  id v18;
  const CGPath *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  id v26;
  id v28;
  id obj;
  uint64_t v30;
  NSArray *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGAffineTransform transform;
  _BYTE v37[128];

  v4 = a3;
  if (-[CRLFreehandDrawingRep p_shouldHideDataDetectors:](self, "p_shouldHideDataDetectors:", v4))
  {
    v31 = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    objc_msgSend(v5, "unrotatedFrameAtDataDetection");
    v7 = v6;
    v9 = v8;
    -[CRLFreehandDrawingRep p_getUnRotatedFrameWithoutMathResults](self, "p_getUnRotatedFrameWithoutMathResults");
    if (v7 / v9 == v10 / v11 || vabdd_f64(v7 / v9, v10 / v11) < 0.00999999978)
    {
      memset(&transform, 0, sizeof(transform));
      -[CRLFreehandDrawingRep p_makeTransformForDataDetectorRenderables](self, "p_makeTransformForDataDetectorRenderables");
      v31 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v28 = v4;
      obj = v4;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v12)
      {
        v13 = v12;
        v30 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v30)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLDataDetectorStrokeLayer layer](CRLDataDetectorStrokeLayer, "layer"));
            v17 = -[CRLCanvasShapeRenderable initWithShapeLayer:]([CRLCanvasDataDetectorStrokeRenderable alloc], "initWithShapeLayer:", v16);
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_baselinePath")));
            v19 = CGPathCreateCopyByTransformingPath((CGPathRef)objc_msgSend(v18, "CGPath"), &transform);

            -[CRLCanvasShapeRenderable setPath:](v17, "setPath:", v19);
            CGPathRelease(v19);
            objc_msgSend(v15, "_strokeWidth");
            v21 = sub_1003C65EC(v20 * 0.5, 1.0, 5.0);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
            objc_msgSend(v22, "viewScale");
            v24 = v21 * v23;

            -[CRLCanvasShapeRenderable setLineWidth:](v17, "setLineWidth:", v24);
            -[CRLCanvasShapeRenderable setMiterLimit:](v17, "setMiterLimit:", v24);
            -[CRLCanvasShapeRenderable setLineCap:](v17, "setLineCap:", kCALineCapRound);
            -[CRLCanvasShapeRenderable setLineJoin:](v17, "setLineJoin:", kCALineCapRound);
            v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor")));
            -[CRLCanvasShapeRenderable setStrokeColor:](v17, "setStrokeColor:", objc_msgSend(v25, "CGColor"));

            v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
            -[CRLCanvasShapeRenderable setFillColor:](v17, "setFillColor:", objc_msgSend(v26, "CGColor"));

            objc_msgSend(v15, "_frame");
            -[CRLCanvasDataDetectorStrokeRenderable setRecognitionFrame:](v17, "setRecognitionFrame:");
            -[NSArray addObject:](v31, "addObject:", v17);

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v13);
      }

      v4 = v28;
    }
    else
    {
      v31 = self->_dataDetectorRenderables;
    }

  }
  return v31;
}

- (CGAffineTransform)p_makeTransformForDataDetectorRenderables
{
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  BOOL v41;
  double v42;
  _BOOL4 v43;
  BOOL v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  void *v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CGAffineTransform *result;
  NSString *v58;
  NSString *v59;
  void *v60;
  NSString *v61;
  void *v62;
  NSObject *v63;
  NSString *v64;
  void *v65;
  NSString *v66;
  void *v67;
  NSString *v68;
  void *v69;
  CGFloat point;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CGFloat v74;
  double v75;
  double v76;
  os_log_t log;
  NSObject *loga;
  double v79;
  CGFloat v80;
  double size;
  void *sizea;
  double v83[7];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v86;
  _OWORD v87[3];
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGSize v90;
  CGSize v91;
  CGPoint v92;
  CGPoint v93;
  CGPoint v94;
  CGPoint v95;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  objc_msgSend(v5, "unrotatedFrameAtDataDetection");
  log = v6;
  size = v7;
  objc_msgSend(v5, "unscaledFrameAtDataDetection");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "rotationAtDataDetection");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v18, "viewScale");
  v20 = v19;

  memset(&v88, 0, sizeof(v88));
  CGAffineTransformMakeScale(&v88, v20, v20);
  -[CRLFreehandDrawingRep p_getUnRotatedFrameWithoutMathResults](self, "p_getUnRotatedFrameWithoutMathResults");
  v22 = v21;
  v79 = v23;
  -[CRLFreehandDrawingRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  v28 = sub_100061400(v24, v25, v26, v27);
  v30 = v29;
  v31 = sub_100061400(v9, v11, v13, v15);
  v33 = v32;
  v80 = v28;
  v83[0] = v31;
  v34 = sub_1000603B8(v28, v30, v31);
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "pureGeometryInRoot"));
  v39 = v38;
  v74 = v36;
  if (v38)
    objc_msgSend(v38, "transform");
  else
    memset(v87, 0, sizeof(v87));
  v40 = sub_1000791EC((double *)v87);

  v41 = sub_10005FE60(v28, v30, v83[0], v33);
  v42 = *(double *)&log;
  if (sub_10005FDF0(v22, v79, *(double *)&log, size))
  {
    v43 = 0;
  }
  else
  {
    v43 = *(double *)&log != CGSizeZero.width;
    if (size != CGSizeZero.height)
      v43 = 1;
  }
  v44 = fabs(v40 - v17) < 0.00999999978 || v40 == v17;
  v75 = -v33;
  v76 = -v83[0];
  v45 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v46 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v46;
  v47 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v47;
  if (v43)
  {
    v71 = v47;
    v72 = v46;
    v73 = v45;
    if (qword_10147E560 != -1)
    {
      dispatch_once(&qword_10147E560, &stru_10123F140);
      v42 = *(double *)&log;
    }
    v48 = off_1013D9260;
    if (os_log_type_enabled((os_log_t)off_1013D9260, OS_LOG_TYPE_DEBUG))
    {
      point = v79 / size;
      loga = v48;
      v90.width = v42;
      v90.height = size;
      v58 = NSStringFromCGSize(v90);
      sizea = (void *)objc_claimAutoreleasedReturnValue(v58);
      v91.width = v22;
      v91.height = v79;
      v59 = NSStringFromCGSize(v91);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      v92.x = v22 / v42;
      v92.y = point;
      v61 = NSStringFromCGPoint(v92);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      LODWORD(v89.a) = 138412802;
      *(_QWORD *)((char *)&v89.a + 4) = sizea;
      WORD2(v89.b) = 2112;
      *(_QWORD *)((char *)&v89.b + 6) = v60;
      HIWORD(v89.c) = 2112;
      *(_QWORD *)&v89.d = v62;
      _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "Frame size changed from initial size: %@ to %@, by %@", (uint8_t *)&v89, 0x20u);

    }
    memset(&v89, 0, sizeof(v89));
    CGAffineTransformMakeScale(&v89, v22 / v42, v22 / v42);
    t1 = v89;
    memset(&v86, 0, sizeof(v86));
    sub_1000796D4(&t1, &v86, v76, v75);
    *(_OWORD *)&t1.a = v73;
    *(_OWORD *)&t1.c = v72;
    *(_OWORD *)&t1.tx = v71;
    t2 = v86;
    CGAffineTransformConcat(retstr, &t1, &t2);
    if (v44)
    {
LABEL_13:
      if (v41)
        goto LABEL_30;
      goto LABEL_25;
    }
  }
  else if (v44)
  {
    goto LABEL_13;
  }
  if (qword_10147E560 != -1)
    dispatch_once(&qword_10147E560, &stru_10123F160);
  v49 = off_1013D9260;
  if (os_log_type_enabled((os_log_t)off_1013D9260, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v89.a) = 134218496;
    *(double *)((char *)&v89.a + 4) = v17;
    WORD2(v89.b) = 2048;
    *(double *)((char *)&v89.b + 6) = v40;
    HIWORD(v89.c) = 2048;
    v89.d = v40 - v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Rotation changed from initial position: %f to %f by %f", (uint8_t *)&v89, 0x20u);
  }
  memset(&v89, 0, sizeof(v89));
  CGAffineTransformMakeRotation(&v89, v40 - v17);
  t1 = v89;
  memset(&v86, 0, sizeof(v86));
  sub_1000796D4(&t1, &v86, v76, v75);
  v50 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v50;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  *(CGAffineTransform *)&v83[1] = v86;
  CGAffineTransformConcat(&t1, &t2, (CGAffineTransform *)&v83[1]);
  v51 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v51;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  if (!v41)
  {
LABEL_25:
    if (qword_10147E560 != -1)
      dispatch_once(&qword_10147E560, &stru_10123F180);
    v52 = off_1013D9260;
    if (os_log_type_enabled((os_log_t)off_1013D9260, OS_LOG_TYPE_DEBUG))
    {
      v63 = v52;
      v93.x = v83[0];
      v93.y = v33;
      v64 = NSStringFromCGPoint(v93);
      v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
      v94.y = v30;
      v94.x = v80;
      v66 = NSStringFromCGPoint(v94);
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      v95.x = v34;
      v95.y = v74;
      v68 = NSStringFromCGPoint(v95);
      v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
      LODWORD(v89.a) = 138412802;
      *(_QWORD *)((char *)&v89.a + 4) = v65;
      WORD2(v89.b) = 2112;
      *(_QWORD *)((char *)&v89.b + 6) = v67;
      HIWORD(v89.c) = 2112;
      *(_QWORD *)&v89.d = v69;
      _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Frame center changed from initial location: %@ to %@, by %@", (uint8_t *)&v89, 0x20u);

    }
    memset(&v89, 0, sizeof(v89));
    CGAffineTransformMakeTranslation(&v89, v34, v74);
    v53 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v53;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    t2 = v89;
    CGAffineTransformConcat(&v86, &t1, &t2);
    v54 = *(_OWORD *)&v86.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v86.a;
    *(_OWORD *)&retstr->c = v54;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v86.tx;
  }
LABEL_30:
  v55 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v86.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v86.c = v55;
  *(_OWORD *)&v86.tx = *(_OWORD *)&retstr->tx;
  t1 = v88;
  CGAffineTransformConcat(&v89, &v86, &t1);
  v56 = *(_OWORD *)&v89.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v89.a;
  *(_OWORD *)&retstr->c = v56;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v89.tx;

  return result;
}

- (void)p_invokeDataDetectorIfDetectorRenderableIsTapped:(CGPoint)a3 detectorRenderables:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  double v20;
  uint64_t v21;
  void *i;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  const CGPath *CopyByStrokingPath;
  _BOOL4 v29;
  void *v30;
  void *v31;
  double v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  _PKDataDetectorInteraction *pkDataDetectorInteraction;
  id v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  CGPoint v48;
  CGRect v49;
  CGRect v50;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[NSArray count](self->_drawingDetectionItems, "count") && self->_pkDataDetectorInteraction)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v8, "convertUnscaledToBoundsPoint:", x, y);
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v13, "viewScale");
    v15 = v14;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v37 = v7;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v17)
    {
      v19 = v17;
      v20 = 40.0 / v15;
      v21 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          objc_opt_class(CRLCanvasDataDetectorStrokeRenderable, v18);
          v25 = sub_100221D0C(v24, v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v27 = v26;
          if (v26)
          {
            CopyByStrokingPath = CGPathCreateCopyByStrokingPath((CGPathRef)objc_msgSend(v26, "path"), 0, v20, kCGLineCapButt, kCGLineJoinBevel, 1.0);
            v48.x = v10;
            v48.y = v12;
            v29 = CGPathContainsPoint(CopyByStrokingPath, 0, v48, 0);
            CGPathRelease(CopyByStrokingPath);
            if (v29)
            {
              -[_PKDataDetectorInteraction setEnabled:](self->_pkDataDetectorInteraction, "setEnabled:", 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[_PKDataDetectorInteraction tapGestureRecognizer](self->_pkDataDetectorInteraction, "tapGestureRecognizer"));
              objc_msgSend(v30, "setEnabled:", 0);

              memset(&v42, 0, sizeof(v42));
              -[CRLFreehandDrawingRep p_makeTransformForDataDetectorRenderables](self, "p_makeTransformForDataDetectorRenderables");
              objc_msgSend(v27, "recognitionFrame");
              v41 = v42;
              v50 = CGRectApplyAffineTransform(v49, &v41);
              -[_PKDataDetectorInteraction setSourceRect:](self->_pkDataDetectorInteraction, "setSourceRect:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
              objc_msgSend(v31, "viewScale");
              v33 = v32;
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
              objc_msgSend(v34, "viewScale");
              CGAffineTransformMakeScale(&v40, v33, v35);
              pkDataDetectorInteraction = self->_pkDataDetectorInteraction;
              v39 = v40;
              -[_PKDataDetectorInteraction setHighlightTransform:](pkDataDetectorInteraction, "setHighlightTransform:", &v39);

              v38 = v42;
              -[_PKDataDetectorInteraction setHighlightPreviewTransform:](self->_pkDataDetectorInteraction, "setHighlightPreviewTransform:", &v38);
              if (-[_PKDataDetectorInteraction handleTapAtPoint:](self->_pkDataDetectorInteraction, "handleTapAtPoint:", x, y))
              {

                goto LABEL_15;
              }
            }
          }

        }
        v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_15:

    v7 = v37;
  }

}

- (void)_dataDetectorControllerItemsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *drawingDetectionItems;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  -[CRLFreehandDrawingRep p_getUnRotatedFrameWithoutMathResults](self, "p_getUnRotatedFrameWithoutMathResults");
  objc_msgSend(v5, "setUnrotatedFrameAtDataDetection:");
  -[CRLFreehandDrawingRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  objc_msgSend(v5, "setUnscaledFrameAtDataDetection:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pureGeometryInRoot"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "transform");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  objc_msgSend(v5, "setRotationAtDataDetection:", sub_1000791EC((double *)&v12));

  v9 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItems"));
  drawingDetectionItems = self->_drawingDetectionItems;
  self->_drawingDetectionItems = v9;

  if (-[NSArray count](self->_drawingDetectionItems, "count"))
    -[CRLFreehandDrawingRep p_addDataDetectorInteractionIfNeeded](self, "p_addDataDetectorInteractionIfNeeded");
  else
    -[CRLFreehandDrawingRep p_removeDataDetectorInteraction](self, "p_removeDataDetectorInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", v12, v13, v14));
  objc_msgSend(v11, "invalidateOverlayLayersForRep:", self);

}

- (void)p_addDataDetectorInteractionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _PKDataDetectorInteraction *v11;
  _PKDataDetectorInteraction *pkDataDetectorInteraction;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (!self->_pkDataDetectorInteraction)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pkRecognitionController"));

    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F1A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E03D04();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F1C0);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_addDataDetectorInteractionIfNeeded]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2202, 0, "invalid nil value for '%{public}s'", "self.p_freehandDrawingInfo.pkRecognitionController");

    }
    v8 = objc_alloc((Class)_PKDataDetectorInteraction);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pkRecognitionController"));
    v11 = (_PKDataDetectorInteraction *)objc_msgSend(v8, "initWithRecognitionController:", v10);
    pkDataDetectorInteraction = self->_pkDataDetectorInteraction;
    self->_pkDataDetectorInteraction = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_PKDataDetectorInteraction dataDetectorController](self->_pkDataDetectorInteraction, "dataDetectorController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));

    if (!v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_PKDataDetectorInteraction dataDetectorController](self->_pkDataDetectorInteraction, "dataDetectorController"));
      objc_msgSend(v15, "setDelegate:", self);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasView"));
    objc_msgSend(v17, "addInteraction:", self->_pkDataDetectorInteraction);

    -[_PKDataDetectorInteraction setEnabled:](self->_pkDataDetectorInteraction, "setEnabled:", 0);
  }
}

- (void)p_removeDataDetectorInteraction
{
  void *v3;
  void *v4;
  _PKDataDetectorInteraction *pkDataDetectorInteraction;

  if (self->_pkDataDetectorInteraction)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
    objc_msgSend(v4, "removeInteraction:", self->_pkDataDetectorInteraction);

    pkDataDetectorInteraction = self->_pkDataDetectorInteraction;
    self->_pkDataDetectorInteraction = 0;

  }
}

- (void)processChangedProperty:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLGroupRep processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 == 5)
  {
    if (-[CRLFreehandDrawingRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer"))
      -[CRLFreehandDrawingRep setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (id)p_ingestibleItemSourceForDragInfo:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "itemSource"));
  v10 = sub_100221DDC(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLIngestibleItemSource);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (BOOL)p_canReceiveDropWithDragInfo:(id)a3
{
  return 0;
}

- (id)dragAndDropHighlightRenderable
{
  CRLCanvasRenderable *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingRep;
  v3 = -[CRLCanvasRep dragAndDropHighlightRenderable](&v6, "dragAndDropHighlightRenderable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[CRLFreehandDrawingRep shouldShowSelectionHighlight](self, "shouldShowSelectionHighlight"))
  {
    -[CRLFreehandDrawingRep p_zPositionForSelectionHighlightLayer](self, "p_zPositionForSelectionHighlightLayer");
    objc_msgSend(v4, "setZPosition:");
  }
  return v4;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  unint64_t v8;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLFreehandDrawingRep;
  v8 = -[CRLCanvasRep dragOperationForDragInfo:atUnscaledPoint:](&v10, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y);
  if (-[CRLFreehandDrawingRep p_canReceiveDropWithDragInfo:](self, "p_canReceiveDropWithDragInfo:", v7))
    v8 = (unint64_t)objc_msgSend(v7, "dragOperationMask") & 1;

  return v8;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionPathWithInfo:", v12));
  objc_msgSend(v10, "setSelectionPath:", v13);

  *(_QWORD *)&v15 = objc_opt_class(CRLFreehandDrawingEditor, v14).n128_u64[0];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mostSpecificCurrentEditorOfClass:", v16, v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_ingestibleItemSourceForDragInfo:](self, "p_ingestibleItemSourceForDragInfo:", v8));

  objc_msgSend(v17, "insertContentsOfFreehandDrawingsFromItemSource:atUnscaledPoint:completionHandler:", v18, &stru_10123F200, x, y);
  return 1;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLGroupRep dynamicResizeDidEndWithTracker:](&v5, "dynamicResizeDidEndWithTracker:", a3);
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLGroupRep setNeedsDisplay](&v4, "setNeedsDisplay");
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLGroupRep dynamicFreeTransformDidEndWithTracker:](&v5, "dynamicFreeTransformDidEndWithTracker:", a3);
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLGroupRep setNeedsDisplay](&v4, "setNeedsDisplay");
}

- (double)canvasViewScaleForTrifurcationContainer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas", a3));
  objc_msgSend(v3, "viewScale");
  v5 = v4;

  return v5;
}

- (double)canvasContentsScaleForTrifurcationContainer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas", a3));
  objc_msgSend(v3, "contentsScale");
  v5 = v4;

  return v5;
}

- (CGPoint)parentScaledCanvasFrameOriginForTrifurcationContainer:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  double v10;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", a3));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "layerFrameInScaledCanvas");
    x = v5;
    y = v7;
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }

  v9 = x;
  v10 = y;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGRect)clipRectInScaledCanvasForTrifurcationContainer:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas", a3));
  -[CRLGroupRep clipRect](self, "clipRect");
  -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
  objc_msgSend(v4, "convertUnscaledToBoundsRect:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)drawShapeReps:(id)a3 intoContext:(CGContext *)a4 forLayer:(id)a5 inTrifurcationContainer:(id)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;

  v9 = a5;
  v10 = a3;
  CGContextSaveGState(a4);
  objc_msgSend(v9, "frame");
  CGContextTranslateCTM(a4, -v11, -v12);
  -[CRLCanvasRep layerFrameInScaledCanvasRelativeToParent](self, "layerFrameInScaledCanvasRelativeToParent");
  CGContextTranslateCTM(a4, v13, v14);
  -[CRLCanvasRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", v9, a4);
  -[CRLFreehandDrawingRep p_drawShapeChildren:inContext:](self, "p_drawShapeChildren:inContext:", v10, a4);

  -[CRLCanvasRep didDrawInLayer:context:](self, "didDrawInLayer:context:", v9, a4);
  CGContextRestoreGState(a4);
}

- (void)documentModeDidChange
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLCanvasRep documentModeDidChange](&v6, "documentModeDidChange");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  -[CRLCanvasRep invalidateSelectionHighlightRenderable](self, "invalidateSelectionHighlightRenderable");
  -[CRLFreehandDrawingRep drawsDescendantsIntoLayer](self, "drawsDescendantsIntoLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = objc_msgSend(v4, "isInDrawingMode");

  if ((v5 & 1) == 0)
    -[CRLFreehandDrawingRep p_removeSubselectionAffordanceIfNeeded](self, "p_removeSubselectionAffordanceIfNeeded");
}

- (void)suppressionOfFreehandContentDidChange
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[CRLCanvasRep isLocked](self, "isLocked"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = objc_msgSend(v3, "shouldSuppressFreehandContent");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerRenderablesForRep:", self, 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setHidden:", v4);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (id)dragItemsForBeginningDragOfChildRep:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  CRLItemProviderItemWriter *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  if (!objc_msgSend(a3, "isSelected"))
    return &__NSArray0__struct;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
  *(_QWORD *)&v7 = objc_opt_class(CRLFreehandDrawingEditor, v6).n128_u64[0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mostSpecificCurrentEditorOfClass:", v8, v7));

  if (objc_msgSend(v9, "canCopySubselection"))
  {
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createFreehandDrawingsToCopyForSubselection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "infosForCurrentSelectionPath"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i)));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "unscaledPathToIncludeForSystemPreviewOutline"));
          if (v18)
            objc_msgSend(v10, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }
    v19 = objc_alloc_init(CRLItemProviderItemWriter);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v21 = (void *)v28;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLItemProviderItemWriter createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:](v19, "createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:", v28, v20, 0));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep dragItemsForBeginningDragWithItemProvider:deepCopiedBoardItems:withUnscaledTracedPaths:previewBackgroundColor:localObjectProvider:](self, "dragItemsForBeginningDragWithItemProvider:deepCopiedBoardItems:withUnscaledTracedPaths:previewBackgroundColor:localObjectProvider:", v22, v28, v10, v23, 0));
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F220);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E03D90();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F240);
      v26 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep dragItemsForBeginningDragOfChildRep:]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v27, 2422, 0, "invalid nil value for '%{public}s'", "itemProvider");

      v24 = &__NSArray0__struct;
      v21 = (void *)v28;
    }

  }
  else
  {
    v24 = &__NSArray0__struct;
  }

  return v24;
}

- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting
{
  return -[NSArray count](self->_drawingDetectionItems, "count") != 0;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return -[NSArray count](self->_drawingDetectionItems, "count") != 0;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 2))
  {
    v7 = -[NSArray copy](self->_dataDetectorRenderables, "copy");
    -[CRLFreehandDrawingRep p_invokeDataDetectorIfDetectorRenderableIsTapped:detectorRenderables:](self, "p_invokeDataDetectorIfDetectorRenderableIsTapped:detectorRenderables:", v7, x, y);

  }
  return 0;
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return -[CRLGroupRep i_childRepsWantContextMenuWhenEditingDisabledAtPoint:onlyNonGrouped:](self, "i_childRepsWantContextMenuWhenEditingDisabledAtPoint:onlyNonGrouped:", 1, a3.x, a3.y);
}

- (id)unscaledPathToIncludeForSystemPreviewOutline
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  _OWORD v11[3];
  _OWORD v12[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  if (v3)
    objc_msgSend(v3, "transformInRoot");
  else
    memset(v12, 0, sizeof(v12));
  if (sub_100079210((double *)v12) && !objc_msgSend(v4, "isEmpty")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo")),
        v6 = objc_msgSend(v5, "shouldBeTreatedAsBoxForConnectionLinesForPerf"),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "i_wrapPath"));
    v7 = objc_msgSend(v9, "copy");

    if (v7)
    {
      v8 = v7;
      if (!objc_msgSend(v7, "isEmpty"))
        goto LABEL_9;
    }
  }
  -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));

LABEL_9:
  if (v3)
    objc_msgSend(v3, "transformInRoot");
  else
    memset(v11, 0, sizeof(v11));
  objc_msgSend(v8, "transformUsingAffineTransform:", v11);
  objc_msgSend(v4, "appendBezierPath:", v8);

  return v4;
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  if (-[NSSet containsObject:](self->_currentlySelectedInfosShowingAffordance, "containsObject:"))
  {
    objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
    v7 = sub_1002223BC(v6, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutForInfo:", v8));

      if (objc_msgSend(v11, "layoutState") != 2)
        self->_shouldUpdateAffordanceOnNextDidProcessAllChanges = 1;

    }
  }

}

- (void)didProcessAllChanges
{
  if (self->_shouldUpdateAffordanceOnNextDidProcessAllChanges)
  {
    self->_shouldUpdateAffordanceOnNextDidProcessAllChanges = 0;
    -[CRLFreehandDrawingRep p_selectionOrSelectedInfosChanged](self, "p_selectionOrSelectedInfosChanged");
  }
}

- (void)p_selectionOrSelectedInfosChanged
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = objc_msgSend(v4, "isInDrawingMode");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
    *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v9).n128_u64[0];
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mostSpecificSelectionOfClass:", v11, v10));

    if (v15
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "boardItems")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo")),
          v14 = objc_msgSend(v12, "containsObject:", v13),
          v13,
          v12,
          v14))
    {
      -[CRLFreehandDrawingRep p_updateSubselectionAffordance](self, "p_updateSubselectionAffordance");
    }
    else
    {
      -[CRLFreehandDrawingRep p_removeSubselectionAffordanceIfNeeded](self, "p_removeSubselectionAffordanceIfNeeded");
    }

  }
}

- (void)p_updateSubselectionAffordance
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v6).n128_u64[0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mostSpecificSelectionOfClass:", v8, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boardItems"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v13);
        v19 = sub_100221D0C(v18, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = v20;
        if (v20)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "parentInfo"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRep containerInfo](self, "containerInfo"));
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (v24)
            objc_msgSend(v25, "addObject:", v21);
        }

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  -[CRLFreehandDrawingRep p_showSubselectionAffordanceForInfos:](self, "p_showSubselectionAffordanceForInfos:", v25);
}

- (void)p_removeSubselectionAffordanceIfNeeded
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingLayout](self, "p_freehandDrawingLayout"));
  v4 = objc_msgSend(v3, "showingSubselectionAffordance");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    -[CRLFreehandDrawingRep p_showSubselectionAffordanceForInfos:](self, "p_showSubselectionAffordanceForInfos:", v5);

  }
}

- (void)p_showSubselectionAffordanceForInfos:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSSet *currentlySelectedInfosShowingAffordance;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_currentlySelectedInfosShowingAffordance;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingCoordinator"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "changeNotifier"));
        objc_msgSend(v13, "removeObserver:forChangeSource:", self, v10);

      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingLayout](self, "p_freehandDrawingLayout"));
  objc_msgSend(v14, "showSubselectionAffordanceForSelectedInfos:", v4);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = (NSSet *)v4;
  v16 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editingCoordinator"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "changeNotifier"));
        objc_msgSend(v23, "addObserver:forChangeSource:", self, v20);

      }
      v17 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v17);
  }

  currentlySelectedInfosShowingAffordance = self->_currentlySelectedInfosShowingAffordance;
  self->_currentlySelectedInfosShowingAffordance = v15;

}

- (CRLFreehandDrawingLayout)p_freehandDrawingLayout
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLFreehandDrawingLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v3));
  v7 = sub_1002223BC(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (CRLFreehandDrawingLayout *)v8;
}

- (id)p_shapeChildrenForDrawingRecursively
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_childrenToExcludeFromFlattenedDrawing](self, "p_childrenToExcludeFromFlattenedDrawing"));
  if (objc_msgSend(v4, "count"))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001920A8;
    v25[3] = &unk_1012318E8;
    v25[4] = v4;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_arrayOfObjectsPassingTest:", v25));

    v3 = (void *)v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
        objc_opt_class(CRLShapeRep, v9);
        v15 = sub_1002223BC(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shapeLayout", (_QWORD)v21));
          v19 = objc_msgSend(v18, "isInvisible");

          if ((v19 & 1) == 0)
            objc_msgSend(v6, "addObject:", v17);
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)p_childrenToExcludeFromFlattenedDrawing
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v5 = objc_msgSend(v4, "isCanvasInteractive");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingLayout](self, "p_freehandDrawingLayout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transformInfo"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForInfo:", v9));
      if (v10)
        objc_msgSend(v3, "addObject:", v10);

    }
    *(_QWORD *)&v11 = objc_opt_class(CRLFreehandDrawingToolFillAndLegacyStroke, v8).n128_u64[0];
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "freehandDrawingToolkit", v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentTool"));
    v16 = sub_100221D0C(v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "drawingReps"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100192264;
      v22[3] = &unk_10123F268;
      v22[4] = self;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crl_arrayOfObjectsPassingTest:", v22));

      objc_msgSend(v3, "addObjectsFromArray:", v20);
    }

  }
  return v3;
}

- (BOOL)p_shouldAllowSetNeedsDisplay
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[3];

  if (-[CRLCanvasRep isBeingResized](self, "isBeingResized")
    || -[CRLCanvasRep isBeingFreeTransformed](self, "isBeingFreeTransformed"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
    if ((objc_msgSend(v3, "aspectRatioLocked") & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometryInRoot"));
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "transform");
      else
        memset(v9, 0, sizeof(v9));
      v4 = !sub_100079384((double *)v9);

    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)crlaxChildren
{
  return 0;
}

- (BOOL)crlaxAllowedToEditChildren
{
  return 0;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v11;
  objc_super v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = objc_msgSend(v4, "isInDrawingMode");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Double tap and hold, then drag to draw.");
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, 0, 0));

    return v9;
  }
  if (-[CRLCanvasRep isSelected](self, "isSelected"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Double tap to edit drawing.");
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingRep;
  v11 = -[CRLFreehandDrawingRep accessibilityHint](&v12, "accessibilityHint");
  return (id)objc_claimAutoreleasedReturnValue(v11);
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (-[CRLCanvasRep isSelected](self, "isSelected"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
    v5 = objc_msgSend(v4, "isInDrawingMode");

    if ((v5 & 1) != 0)
    {
      return 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freehandDrawingToolkit"));
      v6 = 1;
      objc_msgSend(v8, "beginDrawingModeIfNeededForTouchType:", 1);

    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLFreehandDrawingRep;
    return -[CRLFreehandDrawingRep accessibilityActivate](&v10, "accessibilityActivate");
  }
  return v6;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = objc_msgSend(v4, "isInDrawingMode");

  if ((v5 & 1) != 0)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingRep;
  v7 = -[CRLFreehandDrawingRep accessibilityDragSourceDescriptors](&v8, "accessibilityDragSourceDescriptors");
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = objc_msgSend(v4, "isInDrawingMode");

  if ((v5 & 1) != 0)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingRep;
  v7 = -[CRLFreehandDrawingRep accessibilityCustomActions](&v8, "accessibilityCustomActions");
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  CGFloat MidX;
  double MidY;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  CGPoint result;
  CGRect v14;
  CGRect v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = objc_msgSend(v4, "isInDrawingMode");

  MidX = -1.0;
  MidY = -1.0;
  if ((v5 & 1) == 0)
  {
    -[CRLFreehandDrawingRep accessibilityFrame](self, "accessibilityFrame");
    x = v14.origin.x;
    y = v14.origin.y;
    width = v14.size.width;
    height = v14.size.height;
    MidX = CGRectGetMidX(v14);
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    MidY = CGRectGetMidY(v15);
  }
  v12 = MidX;
  result.y = MidY;
  result.x = v12;
  return result;
}

- (BOOL)crlaxNeedsEditRotorMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRep p_freehandDrawingInfo](self, "p_freehandDrawingInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childInfos"));
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", (_QWORD)v16));
        LOBYTE(v12) = objc_msgSend(v13, "currentSelectionPathContainsInfo:", v12);

        if ((v12 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)crlaxHasAttachedMathResultView
{
  if (self->_attachedMathResultView)
    return -[CRLFreehandDrawingRep p_hasMathResultViews](self, "p_hasMathResultViews");
  else
    return 0;
}

- (CGRect)crlaxAttachedMathResultViewFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;
  CGRect v37;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_baseMathView, "subviews"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v23 = height;
    v24 = width;
    v25 = y;
    v26 = CGRectNull.origin.x;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v10), "accessibilityFrame", *(_QWORD *)&v23, *(_QWORD *)&v24, *(_QWORD *)&v25, *(_QWORD *)&v26);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        v36.origin.y = v25;
        v36.origin.x = v26;
        v36.size.height = v23;
        v36.size.width = v24;
        if (CGRectEqualToRect(v32, v36))
        {
          height = v18;
          width = v16;
          y = v14;
          x = v12;
        }
        else
        {
          v33.origin.x = x;
          v33.origin.y = y;
          v33.size.width = width;
          v33.size.height = height;
          v37.origin.x = v12;
          v37.origin.y = v14;
          v37.size.width = v16;
          v37.size.height = v18;
          v34 = CGRectIntersection(v33, v37);
          x = v34.origin.x;
          y = v34.origin.y;
          width = v34.size.width;
          height = v34.size.height;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (NSString)crlaxRecognizedMathDescription
{
  return -[CRLMathRecognitionItemsHandler crlaxRecognizedMathDescription](self->_mathRecognitionHandler, "crlaxRecognizedMathDescription");
}

- (NSArray)decoratorOverlayRenderables
{
  return self->decoratorOverlayRenderables;
}

- (NSSet)subscribedFreehandDrawingIDs
{
  return self->_subscribedFreehandDrawingIDs;
}

- (CRLBidirectionalMap)drawingShapeItemUUIDToStrokeDataUUIBidirectionalMap
{
  return self->_drawingShapeItemUUIDToStrokeDataUUIBidirectionalMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingShapeItemUUIDToStrokeDataUUIBidirectionalMap, 0);
  objc_storeStrong((id *)&self->_subscribedFreehandDrawingIDs, 0);
  objc_storeStrong((id *)&self->decoratorOverlayRenderables, 0);
  objc_storeStrong((id *)&self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap, 0);
  objc_storeStrong((id *)&self->_dataDetectorRenderables, 0);
  objc_storeStrong((id *)&self->_drawingDetectionItems, 0);
  objc_storeStrong((id *)&self->_pkDataDetectorInteraction, 0);
  objc_storeStrong((id *)&self->_baseMathViewController, 0);
  objc_storeStrong((id *)&self->_baseMathView, 0);
  objc_storeStrong((id *)&self->_mathRecognitionHandler, 0);
  objc_storeStrong((id *)&self->_pkDrawing, 0);
  objc_storeStrong((id *)&self->_childRepsSuppressingSixChannelRender, 0);
  objc_storeStrong((id *)&self->_childRepsWithSixChannelRenderEnabled, 0);
  objc_storeStrong((id *)&self->_activeTrifurcationContainer, 0);
  objc_storeStrong((id *)&self->_childRepsForTrifurcation, 0);
  objc_storeStrong((id *)&self->_currentlySelectedInfosShowingAffordance, 0);
}

@end
