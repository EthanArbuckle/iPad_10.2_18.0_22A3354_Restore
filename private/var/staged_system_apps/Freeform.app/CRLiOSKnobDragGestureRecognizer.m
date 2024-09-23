@implementation CRLiOSKnobDragGestureRecognizer

- (CRLiOSKnobDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSKnobDragGestureRecognizer *v5;
  CRLiOSKnobDragGestureRecognizer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  v5 = -[CRLiOSKnobDragGestureRecognizer initWithTarget:action:](&v8, "initWithTarget:action:", 0, 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLiOSKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  -[CRLiOSKnobDragGestureRecognizer dealloc](&v3, "dealloc");
}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  -[CRLiOSKnobDragGestureRecognizer state](self, "state");
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  -[CRLiOSKnobDragGestureRecognizer setState:](&v5, "setState:", a3);
}

- (void)reset
{
  UITouch *touch;
  UITouch *secondTouch;
  CRLCanvasRep *lastHitRep;
  CRLCanvasKnobTracker *tracker;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  -[CRLiOSKnobDragGestureRecognizer reset](&v7, "reset");
  -[CRLiOSKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
  touch = self->_touch;
  self->_touch = 0;

  secondTouch = self->_secondTouch;
  self->_secondTouch = 0;

  self->_knobToTouchOffset = CGPointZero;
  self->_originalPointInWindow = (CGPoint)xmmword_100EEC428;
  lastHitRep = self->_lastHitRep;
  self->_lastHitRep = 0;

  self->_touchesMoved = 0;
  self->_knobTouchHasMoved = 0;
  self->_delayHasElapsed = 0;
  tracker = self->_tracker;
  self->_tracker = 0;

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CRLCanvasRep *lastHitRep;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  UITouch *v18;
  UITouch *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  UITouch *touch;
  UITouch *v26;
  UITouch *v27;
  UITouch *v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  _BOOL8 v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  unsigned int v37;
  unsigned int v38;
  unsigned __int8 v39;
  UITouch *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t (**knobValidatorBlock)(id, void *, id);
  CRLCanvasKnobTracker *v48;
  CRLCanvasKnobTracker **p_tracker;
  CRLCanvasKnobTracker *tracker;
  void *v51;
  CRLCanvasKnobTracker *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGPoint *p_knobToTouchOffset;
  double x;
  double y;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  CRLCanvasKnobTracker *v67;
  uint64_t v68;
  double v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  UITouch *secondTouch;
  void *v81;
  CRLCanvasKnobTracker **v82;
  void *v83;
  id v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  double v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  double v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  _BOOL8 v115;
  id obj;
  id *obja;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  objc_super v125;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKnobDragGestureRecognizer icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asUIKitHost"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dynamicOperationController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tmCoordinator"));
  if (!-[CRLiOSKnobDragGestureRecognizer state](self, "state") && objc_msgSend(v8, "currentlyScrolling")
    || ((objc_msgSend(v11, "isInOperation") & 1) != 0
     || objc_msgSend(v8, "isInDynamicOperation"))
    && !-[CRLiOSKnobDragGestureRecognizer state](self, "state"))
  {
    goto LABEL_24;
  }
  v125.receiver = self;
  v125.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  -[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:](&v125, "touchesBegan:withEvent:", v6, v7);
  self->_touchesMoved = 0;
  lastHitRep = self->_lastHitRep;
  self->_lastHitRep = 0;

  if (!-[CRLiOSKnobDragGestureRecognizer state](self, "state"))
  {
    if (objc_msgSend(v6, "count") == (id)1)
    {
      v123 = v12;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allTouches"));
      if (objc_msgSend(v24, "count") == (id)1)
      {
        touch = self->_touch;

        v12 = v123;
        if (!touch)
        {
          v119 = v10;
          v26 = (UITouch *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
          v27 = self->_touch;
          self->_touch = v26;

          v28 = self->_touch;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITouch window](v28, "window"));
          -[UITouch locationInView:](v28, "locationInView:", v29);
          self->_originalPointInWindow.x = v30;
          self->_originalPointInWindow.y = v31;

          v32 = sub_10033831C(-[UITouch type](self->_touch, "type"));
          -[CRLiOSKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
          v34 = v33;
          v124 = 0;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitKnobAtPoint:inputType:returningRep:", v32, &v124));
          obj = v124;
          v36 = v124;
          v120 = v35;
          if (v35
            && -[UITouch tapCount](self->_touch, "tapCount") >= 2
            && !objc_msgSend(v35, "worksWithMultipleTaps"))
          {
            v10 = v119;
LABEL_73:
            v12 = v123;
            goto LABEL_74;
          }
          v115 = v32;
          v118 = v36;
          v10 = v119;
          if ((id)-[UITouch type](self->_touch, "type") == (id)3)
          {
            v37 = -[CRLiOSKnobDragGestureRecognizer modifierFlags](self, "modifierFlags");
            v38 = -[CRLiOSKnobDragGestureRecognizer modifierFlags](self, "modifierFlags");
            v39 = -[CRLiOSKnobDragGestureRecognizer buttonMask](self, "buttonMask");
            if ((v37 & 0x100000) != 0)
            {
              if ((sub_100260884((char)objc_msgSend(v120, "tag")) & 0x3DE) != 0)
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "layout"));
                v43 = objc_msgSend(v42, "supportsRotation");

                if ((v43 & 1) != 0)
                  goto LABEL_64;
              }
            }
            else if (*(_QWORD *)&v38 & 0x40000 | v39 & 2)
            {
LABEL_64:
              v12 = v123;
              v36 = v118;
              goto LABEL_74;
            }
          }
          v44 = objc_msgSend(v119, "shouldSelectAndScrollWithApplePencil");
          if (!v120 || (v44 & 1) != 0)
          {
            v12 = v123;
            v36 = v118;
            if (!v120)
              goto LABEL_74;
          }
          else
          {
            v12 = v123;
            v36 = v118;
            if ((id)-[UITouch type](self->_touch, "type") == (id)2)
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freehandDrawingToolkit"));
              v46 = objc_msgSend(v45, "isLassoSelectionForMixedTypeEnabledInDrawingMode");

              v12 = v123;
              if ((objc_msgSend(v120, "worksWithStylus") & 1) == 0 && (v46 & 1) == 0)
                goto LABEL_74;
            }
          }
          knobValidatorBlock = (uint64_t (**)(id, void *, id))self->_knobValidatorBlock;
          if (knobValidatorBlock && (knobValidatorBlock[2](knobValidatorBlock, v120, v36) & 1) == 0)
          {
            if (-[CRLiOSKnobDragGestureRecognizer state](self, "state"))
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101245108);
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100E0DA00();
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101245128);
              v63 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DE7468(v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v64, v65, 184, 0, "Our knob validator block expects to stop knob recognition before we have begun");

              v10 = v119;
              goto LABEL_64;
            }
          }
          else if (objc_msgSend(v120, "type") != (id)2)
          {
            objc_storeStrong((id *)&self->_lastHitRep, obj);
            v48 = (CRLCanvasKnobTracker *)objc_msgSend(v36, "newTrackerForKnob:", v120);
            p_tracker = &self->_tracker;
            tracker = self->_tracker;
            self->_tracker = v48;

            v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self->_tracker, "knob"));
            v52 = self->_tracker;
            obja = (id *)&self->_tracker;
            if (!v52)
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101245148);
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100E0D958();
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101245168);
              v53 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DE7468(v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]"));
              v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v54, v55, 197, 0, "invalid nil value for '%{public}s'", "_tracker");

              v36 = v118;
              v52 = (CRLCanvasKnobTracker *)*obja;
              v10 = v119;
              p_tracker = &self->_tracker;
            }
            -[CRLCanvasKnobTracker setInputType:](v52, "setInputType:", v115);
            objc_msgSend(v51, "position");
            objc_msgSend(v36, "convertNaturalPointToUnscaledCanvas:");
            v57 = v56;
            v59 = v58;
            p_knobToTouchOffset = &self->_knobToTouchOffset;
            v114 = v51;
            if (-[CRLCanvasKnobTracker shouldUseKnobOffset](*p_tracker, "shouldUseKnobOffset"))
            {
              x = sub_1000603B8(v57, v59, v34);
              p_knobToTouchOffset->x = x;
              self->_knobToTouchOffset.y = y;
            }
            else
            {
              *p_knobToTouchOffset = CGPointZero;
              x = p_knobToTouchOffset->x;
              y = self->_knobToTouchOffset.y;
            }
            -[CRLCanvasKnobTracker i_setKnobOffset:](*p_tracker, "i_setKnobOffset:", x, y);
            if (!self->_secondTouch
              || (v67 = *p_tracker,
                  objc_opt_class(CRLResizeKnobTracker, v66),
                  (objc_opt_isKindOfClass(v67, v68) & 1) != 0))
            {
              -[CRLiOSKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
              -[CRLCanvasKnobTracker setCurrentPosition:](*p_tracker, "setCurrentPosition:", sub_1000603D0(v69, v70, p_knobToTouchOffset->x));
              -[CRLiOSKnobDragGestureRecognizer addTarget:action:](self, "addTarget:action:", v11, "handleGestureRecognizer:");
              objc_msgSend(v123, "registerTrackerManipulator:", self);
              objc_opt_class(CRLResizeKnobTracker, v71);
              v73 = sub_100221D0C(v72, *p_tracker);
              v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
              if (v74 && self->_secondTouch)
              {
                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitRepWithTouch:"));
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "repForSelecting"));

                if (-[CRLiOSKnobDragGestureRecognizer p_hitRepIsValid:](self, "p_hitRepIsValid:", v76))
                {
                  objc_msgSend(v74, "setRepToMatch:", v76);
                  v77 = v74;
                  v78 = 0;
                }
                else
                {
                  objc_msgSend(v74, "setRepToMatch:", 0);
                  v77 = v74;
                  v78 = 1;
                }
                objc_msgSend(v77, "setShouldResizeFromCenter:", v78);
                secondTouch = self->_secondTouch;
                v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
                -[UITouch locationInView:](secondTouch, "locationInView:", v81);
                objc_msgSend(v74, "setSecondaryHUDPoint:");

                v36 = v118;
              }
              v121 = v74;
              v82 = &self->_tracker;
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*obja, "knob"));
              v84 = objc_msgSend(v83, "dragType");

              v12 = v123;
              switch((unint64_t)v84)
              {
                case 0uLL:
                  objc_msgSend(*obja, "delay");
                  if (v85 != 0.0)
                    goto LABEL_134;
                  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_101245188);
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100E0D5F8();
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_1012451A8);
                  v86 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100DE7468(v86);
                  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]"));
                  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
                  v89 = v87;
                  v90 = v88;
                  v91 = 241;
                  goto LABEL_133;
                case 1uLL:
                  objc_msgSend(*obja, "delay");
                  if (v92 != 0.0)
                    goto LABEL_134;
                  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_1012451C8);
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100E0D678();
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_1012451E8);
                  v93 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100DE7468(v93);
                  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]"));
                  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
                  v89 = v87;
                  v90 = v88;
                  v91 = 247;
                  goto LABEL_133;
                case 2uLL:
                  -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 1);
                  objc_msgSend(*obja, "delay");
                  if (v94 != 0.0)
                  {
                    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                    if (qword_10147E370 != -1)
                      dispatch_once(&qword_10147E370, &stru_101245208);
                    v95 = off_1013D9070;
                    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                      sub_100E0D6F8((uint64_t)obja, v95);
                    if (qword_10147E370 != -1)
                      dispatch_once(&qword_10147E370, &stru_101245228);
                    v96 = off_1013D9070;
                    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                      sub_100DE7468(v96);
                    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
                    v82 = &self->_tracker;
                    objc_msgSend(*obja, "delay");
                    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v97, v98, 254, 0, "requesting a delay of %f", v99);

                    v36 = v118;
                    v10 = v119;
                    v12 = v123;
                  }
                  if (objc_msgSend(v12, "takeControlWithTrackerManipulator:", self))
                  {
                    if (objc_msgSend(v11, "isInPossibleDynamicOperation"))
                    {
                      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentlyTransformingReps"));
                      objc_msgSend(v11, "stopTransformingReps:", v100);

                    }
                    objc_msgSend(v11, "beginOperation");
                    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker repsToTransform](*v82, "repsToTransform"));
                    objc_msgSend(v11, "startTransformingReps:", v101);

                  }
                  break;
                case 3uLL:
                  objc_msgSend(*obja, "delay");
                  if (v102 == 0.0)
                    break;
                  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_101245248);
                  v103 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100E0D798((uint64_t)obja, v103);
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_101245268);
                  v104 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100DE7468(v104);
                  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]"));
                  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
                  objc_msgSend(*obja, "delay");
                  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v105, v106, 275, 0, "requesting a delay of %f", v107);
                  goto LABEL_145;
                case 4uLL:
                  objc_msgSend(*obja, "delay");
                  if (v108 != 0.0)
                    goto LABEL_134;
                  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_101245288);
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100E0D838();
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_1012452A8);
                  v109 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100DE7468(v109);
                  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]"));
                  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
                  v89 = v87;
                  v90 = v88;
                  v91 = 281;
LABEL_133:
                  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v89, v90, v91, 0, "requesting a delay of 0");

                  v36 = v118;
                  v10 = v119;
                  v12 = v123;
                  v82 = &self->_tracker;
LABEL_134:
                  -[CRLCanvasKnobTracker delay](*v82, "delay");
                  -[CRLiOSKnobDragGestureRecognizer p_requestDelayedKnobTracking:](self, "p_requestDelayedKnobTracking:");
                  break;
                case 5uLL:
                  objc_msgSend(*obja, "delay");
                  if (v110 == 0.0)
                    break;
                  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_1012452C8);
                  v111 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100E0D8B8((uint64_t)obja, v111);
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_1012452E8);
                  v112 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100DE7468(v112);
                  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]"));
                  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
                  objc_msgSend(*obja, "delay");
                  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v105, v106, 287, 0, "requesting a delay of %f", v113);
LABEL_145:

                  v36 = v118;
                  v10 = v119;
                  v12 = v123;
                  break;
                default:
                  break;
              }

              v79 = v114;
              goto LABEL_75;
            }
            v120 = v114;
            goto LABEL_73;
          }
LABEL_74:
          -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 5);
          v79 = v120;
LABEL_75:

          goto LABEL_28;
        }
      }
      else
      {

        v12 = v123;
      }
    }
LABEL_24:
    -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 5);
    goto LABEL_28;
  }
  if (-[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)1
    || -[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)2)
  {
    objc_opt_class(CRLResizeKnobTracker, v14);
    v16 = sub_100221D0C(v15, self->_tracker);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v17 && !self->_secondTouch)
    {
      v122 = v12;
      v18 = (UITouch *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
      v19 = self->_secondTouch;
      self->_secondTouch = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitRepWithTouch:", self->_secondTouch));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repForSelecting"));

      if (-[CRLiOSKnobDragGestureRecognizer p_hitRepIsValid:](self, "p_hitRepIsValid:", v21))
      {
        objc_msgSend(v17, "setRepToMatch:", v21);
        v22 = v17;
        v23 = 0;
      }
      else
      {
        objc_msgSend(v17, "setRepToMatch:", 0);
        v22 = v17;
        v23 = 1;
      }
      objc_msgSend(v22, "setShouldResizeFromCenter:", v23);
      v40 = self->_secondTouch;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
      -[UITouch locationInView:](v40, "locationInView:", v41);
      objc_msgSend(v17, "setSecondaryHUDPoint:");

      v12 = v122;
    }

  }
LABEL_28:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  int *v7;
  UITouchType v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int *v17;
  void *v18;
  void *v19;
  id v20;
  UITouch *touch;
  void *v22;
  UITouch *v23;
  double v24;
  double v25;
  double v26;
  CRLiOSKnobDragGestureRecognizer *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  UITouch *secondTouch;
  void *v45;
  void *v46;
  void *v47;
  UITouch *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  BOOL v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  objc_super v68;

  v67 = a3;
  v6 = a4;
  v7 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  if (self->_touchesMoved)
    goto LABEL_5;
  v8 = -[UITouch type](self->_touch, "type");
  v9 = (double *)&unk_100EF0288;
  if (v8 != UITouchTypePencil)
    v9 = (double *)&unk_100EF0290;
  v10 = *v9;
  -[UITouch locationInView:](self->_touch, "locationInView:", 0);
  if (sub_10006108C(v11, v12, self->_originalPointInWindow.x, self->_originalPointInWindow.y) >= v10)
  {
LABEL_5:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKnobDragGestureRecognizer icc](self, "icc"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layerHost"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "asUIKitHost"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dynamicOperationController"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tmCoordinator"));
    self->_touchesMoved = 1;
    self->_knobTouchHasMoved = 1;
    v17 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
    if (!self->_delayHasElapsed)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self->_tracker, "knob"));
      if (objc_msgSend(v18, "dragType") == (id)4)
      {
        v19 = v15;
        v20 = v6;
        touch = self->_touch;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[UITouch window](touch, "window"));
        v23 = touch;
        v6 = v20;
        v15 = v19;
        -[UITouch locationInView:](v23, "locationInView:", v22);
        v17 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
        v26 = sub_10006108C(self->_originalPointInWindow.x, self->_originalPointInWindow.y, v24, v25);

        v7 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
        if (v26 >= 14.0)
        {
          -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 5);
          -[CRLiOSKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
        }
      }
      else
      {

      }
    }
    v68.receiver = self;
    v68.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
    v65 = v6;
    -[CRLiOSKnobDragGestureRecognizer touchesMoved:withEvent:](&v68, "touchesMoved:withEvent:", v67, v6);
    if (!objc_msgSend(v67, "containsObject:", *(Class *)((char *)&self->super.super.isa + v7[893])))
      goto LABEL_24;
    if (-[CRLiOSKnobDragGestureRecognizer state](self, "state"))
    {
      if (-[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)1)
      {
        v27 = self;
        v28 = 2;
LABEL_22:
        -[CRLiOSKnobDragGestureRecognizer setState:](v27, "setState:", v28);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    v29 = v16;
    v30 = v17[901];
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v30), "knob"));
    if (objc_msgSend(v31, "dragType") != (id)3)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v30), "knob"));
      if (objc_msgSend(v32, "dragType") != (id)1)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v30), "knob"));
        v60 = objc_msgSend(v59, "dragType");

        v61 = v60 == (id)5;
        v17 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
        if (!v61)
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v30), "knob"));
          v63 = objc_msgSend(v62, "dragType");

          v16 = v29;
          if (v63 || !self->_delayHasElapsed)
            goto LABEL_23;
          -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 1);
          goto LABEL_19;
        }
LABEL_18:
        -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 1);
        -[CRLiOSKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
        v16 = v29;
LABEL_19:
        if (!objc_msgSend(v66, "takeControlWithTrackerManipulator:", self))
        {
          v27 = self;
          v28 = 5;
          goto LABEL_22;
        }
        objc_msgSend(v16, "beginOperation");
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", self->_lastHitRep));
        objc_msgSend(v16, "startTransformingReps:", v33);

LABEL_23:
        -[CRLiOSKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v17[901]), "setCurrentPosition:", sub_1000603D0(v34, v35, self->_knobToTouchOffset.x));
LABEL_24:
        v36 = -[CRLiOSKnobDragGestureRecognizer modifierFlags](self, "modifierFlags");
        objc_opt_class(CRLResizeKnobTracker, v37);
        v38 = v17[901];
        v40 = sub_100221D0C(v39, *(void **)((char *)&self->super.super.isa + v38));
        v42 = (void *)objc_claimAutoreleasedReturnValue(v40);
        if (v42)
        {
          v43 = v16;
          secondTouch = self->_secondTouch;
          if (secondTouch)
          {
            if (objc_msgSend(v67, "containsObject:", self->_secondTouch))
            {
              v64 = v15;
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hitRepWithTouch:", self->_secondTouch));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "repForSelecting"));

              if (-[CRLiOSKnobDragGestureRecognizer p_hitRepIsValid:](self, "p_hitRepIsValid:", v46))
              {
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "repToMatch"));

                if (v47 != v46)
                  objc_msgSend(v42, "setRepToMatch:", v46);
              }
              v48 = self->_secondTouch;
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasView"));
              -[UITouch locationInView:](v48, "locationInView:", v49);
              objc_msgSend(v42, "setSecondaryHUDPoint:");

              v15 = v64;
            }
          }
          else
          {
            objc_msgSend(v42, "setShouldResizeFromCenter:", ((unint64_t)-[CRLiOSKnobDragGestureRecognizer modifierFlags](self, "modifierFlags") >> 19) & 1);
            objc_msgSend(v42, "setPreserveAspectRatio:", ((unint64_t)-[CRLiOSKnobDragGestureRecognizer modifierFlags](self, "modifierFlags") >> 17) & 1);
          }
          objc_msgSend(v42, "setSuppressSecondaryHUD:", secondTouch == 0);
          objc_msgSend(v42, "setSnapToGuides:", (*(_QWORD *)&v36 & 0x100000) == 0);
          v16 = v43;
        }
        objc_opt_class(CRLConnectionLineKnobTracker, v41);
        v51 = sub_100221D0C(v50, *(void **)((char *)&self->super.super.isa + v38));
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        v54 = v52;
        if (v52)
        {
          objc_msgSend(v52, "setShouldSnapToMagnets:", (*(_QWORD *)&v36 & 0x100000) == 0);
          objc_msgSend(v54, "setSnapEnabled:", (*(_QWORD *)&v36 & 0x100000) == 0);
        }
        objc_opt_class(_TtC8Freeform33CRLShapeConnectionLineKnobTracker, v53);
        v56 = sub_100221D0C(v55, *(void **)((char *)&self->super.super.isa + v38));
        v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        v58 = v57;
        if (v57)
          objc_msgSend(v57, "setSnapEnabled:", (*(_QWORD *)&v36 & 0x100000) == 0);
        if (-[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)2
          && objc_msgSend(*(id *)((char *)&self->super.super.isa + v38), "wantsAutoscroll"))
        {
          -[CRLiOSKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
          +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self);
        }

        v6 = v65;
        goto LABEL_41;
      }

    }
    goto LABEL_18;
  }
LABEL_41:

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  UITouch *secondTouch;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  CRLCanvasRep *lastHitRep;
  CRLCanvasRep *v42;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKnobDragGestureRecognizer icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asUIKitHost"));
  objc_opt_class(NSObject, v11);
  v18 = sub_1002220C8(v10, v12, 1, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLUIKitInteractionHost);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dynamicOperationController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tmCoordinator"));
  v43.receiver = self;
  v43.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  -[CRLiOSKnobDragGestureRecognizer touchesEnded:withEvent:](&v43, "touchesEnded:withEvent:", v6, v7);

  if (!objc_msgSend(v6, "containsObject:", self->_touch))
    goto LABEL_22;
  if (!-[CRLiOSKnobDragGestureRecognizer state](self, "state"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self->_tracker, "knob"));
    if (objc_msgSend(v29, "dragType"))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self->_tracker, "knob"));
      v31 = objc_msgSend(v30, "dragType");

      if (v31 != (id)3)
        goto LABEL_3;
    }
    else
    {

    }
    -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 5);
    goto LABEL_22;
  }
LABEL_3:
  if (!-[CRLiOSKnobDragGestureRecognizer state](self, "state") && !self->_delayHasElapsed)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self->_tracker, "knob"));
    if (objc_msgSend(v32, "dragType") != (id)4)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self->_tracker, "knob"));
      if (objc_msgSend(v33, "dragType"))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self->_tracker, "knob"));
        v35 = objc_msgSend(v34, "dragType");

        if (v35 != (id)1)
          goto LABEL_5;
LABEL_21:
        -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 5);
        -[CRLiOSKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
        goto LABEL_22;
      }

    }
    goto LABEL_21;
  }
LABEL_5:
  if (-[CRLiOSKnobDragGestureRecognizer state](self, "state")
    || (v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self->_tracker, "knob")),
        v23 = objc_msgSend(v22, "dragType"),
        v22,
        v23 != (id)5))
  {
    -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 3);
    -[CRLiOSKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
    -[CRLCanvasKnobTracker setCurrentPosition:](self->_tracker, "setCurrentPosition:", sub_1000603D0(v27, v28, self->_knobToTouchOffset.x));
    -[CRLCanvasKnobTracker setDragEnding:](self->_tracker, "setDragEnding:", 1);
    -[CRLCanvasAutoscroll invalidate](self->_autoscroll, "invalidate");
  }
  else
  {
    -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 3);
    -[CRLiOSKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
    -[CRLCanvasKnobTracker setCurrentPosition:](self->_tracker, "setCurrentPosition:", sub_1000603D0(v24, v25, self->_knobToTouchOffset.x));
    -[CRLCanvasKnobTracker setDragEnding:](self->_tracker, "setDragEnding:", 1);
    if (objc_msgSend(v21, "takeControlWithTrackerManipulator:", self))
    {
      objc_msgSend(v20, "beginOperation");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", self->_lastHitRep));
      objc_msgSend(v20, "startTransformingReps:", v26);

    }
  }
LABEL_22:
  if (self->_secondTouch && objc_msgSend(v6, "containsObject:"))
  {
    secondTouch = self->_secondTouch;
    self->_secondTouch = 0;

    objc_opt_class(CRLResizeKnobTracker, v37);
    v39 = sub_100221D0C(v38, self->_tracker);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    objc_msgSend(v40, "setRepToMatch:", 0);
    objc_msgSend(v40, "setShouldResizeFromCenter:", 0);

  }
  if (!self->_touchesMoved)
  {
    lastHitRep = self->_lastHitRep;
    if (lastHitRep)
    {
      if (-[CRLCanvasRep isSelected](lastHitRep, "isSelected")
        && -[CRLCanvasKnobTracker allowHUDToDisplay](self->_tracker, "allowHUDToDisplay")
        && -[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)3)
      {
        objc_msgSend(v19, "performSelector:withObject:afterDelay:", "toggleDefaultEditUIForCurrentSelection", 0, 0.0);
        v42 = self->_lastHitRep;
        self->_lastHitRep = 0;

      }
    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  CRLiOSKnobDragGestureRecognizer *v8;
  uint64_t v9;
  UITouch *secondTouch;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  CRLCanvasRep *lastHitRep;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  -[CRLiOSKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
  v16.receiver = self;
  v16.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  -[CRLiOSKnobDragGestureRecognizer touchesCancelled:withEvent:](&v16, "touchesCancelled:withEvent:", v6, v7);

  if (objc_msgSend(v6, "containsObject:", self->_touch))
  {
    if (!-[CRLiOSKnobDragGestureRecognizer state](self, "state"))
    {
      v8 = self;
      v9 = 5;
      goto LABEL_9;
    }
    if (-[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)1
      || -[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)2)
    {
      v8 = self;
      v9 = 4;
LABEL_9:
      -[CRLiOSKnobDragGestureRecognizer setState:](v8, "setState:", v9);
    }
  }
  else if (objc_msgSend(v6, "containsObject:", self->_secondTouch))
  {
    secondTouch = self->_secondTouch;
    self->_secondTouch = 0;

    objc_opt_class(CRLResizeKnobTracker, v11);
    v13 = sub_100221D0C(v12, self->_tracker);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v14, "setRepToMatch:", 0);
    objc_msgSend(v14, "setShouldResizeFromCenter:", 0);

  }
  lastHitRep = self->_lastHitRep;
  self->_lastHitRep = 0;

}

- (void)cancelBecauseOfRotation
{
  if (self->_tracker)
    -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 5);
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_tracker;
}

- (BOOL)readyToEndOperation
{
  return -[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)3;
}

- (void)operationDidEnd
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRLiOSKnobDragGestureRecognizer *v17;
  CRLCanvasKnobTracker *tracker;
  UITouch *secondTouch;
  CRLCanvasRep *lastHitRep;
  unsigned int v21;
  id v22;

  v22 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSKnobDragGestureRecognizer icc](self, "icc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asUIKitHost"));
  objc_opt_class(NSObject, v5);
  v12 = sub_1002220C8(v4, v6, 1, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLUIKitInteractionHost);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dynamicOperationController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tmCoordinator"));
  v16 = v15;
  if (self->_tracker)
  {
    v17 = (CRLiOSKnobDragGestureRecognizer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "controllingTM"));
    if (v17 == self
      && !self->_touchesMoved
      && (lastHitRep = self->_lastHitRep) != 0
      && -[CRLCanvasRep isSelected](lastHitRep, "isSelected"))
    {
      v21 = -[CRLCanvasKnobTracker allowHUDToDisplay](self->_tracker, "allowHUDToDisplay");

      if (v21)
        objc_msgSend(v13, "performSelector:withObject:afterDelay:", "toggleDefaultEditUIForCurrentSelection", 0, 0.0);
    }
    else
    {

    }
    -[CRLiOSKnobDragGestureRecognizer removeTarget:action:](self, "removeTarget:action:", v14, "handleGestureRecognizer:");
    tracker = self->_tracker;
    self->_tracker = 0;

    -[CRLiOSKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
  }
  secondTouch = self->_secondTouch;
  if (secondTouch && !self->_touch)
  {
    self->_secondTouch = 0;

  }
}

- (void)p_cancelDelayedKnobTracking
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_triggerDelayedKnobTracking:", 0);
}

- (void)p_requestDelayedKnobTracking:(double)a3
{
  self->_delayHasElapsed = 0;
  -[CRLiOSKnobDragGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_triggerDelayedKnobTracking:", 0, a3);
}

- (void)p_triggerDelayedKnobTracking:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  CRLCanvasKnobTracker *tracker;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKnobDragGestureRecognizer icc](self, "icc", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicOperationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tmCoordinator"));
  self->_delayHasElapsed = 1;
  if (-[CRLiOSKnobDragGestureRecognizer state](self, "state"))
  {
    if (-[CRLiOSKnobDragGestureRecognizer state](self, "state") != (id)5)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101245308);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0DB80(v7);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101245328);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
      v11 = sub_10034792C((unint64_t)-[CRLiOSKnobDragGestureRecognizer state](self, "state"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 590, 0, "delay fired when knob GR in state %@", v12);

LABEL_48:
    }
  }
  else
  {
    tracker = self->_tracker;
    if (!tracker)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101245348);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0DA80();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101245368);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 595, 0, "Delayed knob tracking timer fired when we have no tracker!");
      goto LABEL_48;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](tracker, "knob"));
    v15 = (unint64_t)objc_msgSend(v14, "dragType");

    if (v15 <= 5)
    {
      if (((1 << v15) & 0x2C) != 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101245388);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0DB00();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012453A8);
        v16 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 603, 0, "shouldn't have delayed knob tracking!");

      }
      else if (((1 << v15) & 0x12) != 0 || self->_knobTouchHasMoved)
      {
        -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 1);
      }
    }
    if (-[CRLiOSKnobDragGestureRecognizer state](self, "state") == (id)1
      && objc_msgSend(v6, "takeControlWithTrackerManipulator:", self))
    {
      if (objc_msgSend(v5, "isInPossibleDynamicOperation"))
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentlyTransformingReps"));
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(_QWORD *)v27 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "setShowKnobsDuringManipulation:", 0);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v22);
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentlyTransformingReps"));
        objc_msgSend(v5, "stopTransformingReps:", v25);

      }
      objc_msgSend(v5, "beginOperation");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self->_tracker, "rep"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
      objc_msgSend(v5, "startTransformingReps:", v10);
      goto LABEL_48;
    }
  }

}

- (CRLInteractiveCanvasController)icc
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (void)updateAfterAutoscroll:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[CRLiOSKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
  -[CRLCanvasKnobTracker setCurrentPosition:](self->_tracker, "setCurrentPosition:", sub_1000603D0(v5, v6, self->_knobToTouchOffset.x));
  -[CRLCanvasKnobTracker updateAfterAutoscroll:](self->_tracker, "updateAfterAutoscroll:", v4);

  -[CRLiOSKnobDragGestureRecognizer setState:](self, "setState:", 2);
}

- (void)autoscrollWillNotStart
{
  -[CRLCanvasKnobTracker autoscrollWillNotStart](self->_tracker, "autoscrollWillNotStart");
}

- (double)unscaledStartAutoscrollThreshold
{
  double result;

  -[CRLCanvasKnobTracker unscaledStartAutoscrollThreshold](self->_tracker, "unscaledStartAutoscrollThreshold");
  return result;
}

- (int)allowedAutoscrollDirections
{
  return -[CRLCanvasKnobTracker allowedAutoscrollDirections](self->_tracker, "allowedAutoscrollDirections");
}

- (BOOL)p_hitRepIsValid:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class(CRLResizeKnobTracker, v5);
  v7 = sub_100221D0C(v6, self->_tracker);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v4 || (v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rep")), v10, v10 == v4))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v4, "boundsForStandardKnobs");
    v13 = v12 > 1.0 && v11 > 1.0;
  }

  return v13;
}

- (CGPoint)p_pointInUnscaledCanvas
{
  void *v3;
  UITouch *touch;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSKnobDragGestureRecognizer icc](self, "icc"));
  touch = self->_touch;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
  -[UITouch locationInView:](touch, "locationInView:", v5);
  objc_msgSend(v3, "convertBoundsToUnscaledPoint:");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_storeStrong((id *)&self->_autoscroll, a3);
}

- (id)knobValidatorBlock
{
  return self->_knobValidatorBlock;
}

- (void)setKnobValidatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_knobValidatorBlock, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_lastHitRep, 0);
  objc_storeStrong((id *)&self->_secondTouch, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_touch, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
