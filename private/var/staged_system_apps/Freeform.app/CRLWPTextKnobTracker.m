@implementation CRLWPTextKnobTracker

- (CRLWPTextKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  CRLWPTextKnobTracker *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSUInteger v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  id v43;
  id v44;
  unint64_t v45;
  void *v46;
  void *v47;
  _BYTE *v48;
  _BYTE *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  char v68;
  objc_super v70;

  v6 = a3;
  v7 = a4;
  v70.receiver = self;
  v70.super_class = (Class)CRLWPTextKnobTracker;
  v9 = -[CRLCanvasKnobTracker initWithRep:knob:](&v70, "initWithRep:knob:", v6, v7);
  if (v9)
  {
    *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform11CRLWPEditor, v8).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textInputEditor"));
    v17 = sub_100221D0C(v12, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[CRLWPTextKnobTracker setTextEditor:](v9, "setTextEditor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
    objc_msgSend(v19, "setKnobTracking:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v9, "knob"));
    v21 = objc_msgSend(v20, "tag");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
    objc_msgSend(v22, "setKnobTag:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
    objc_msgSend(v7, "position");
    objc_msgSend(v23, "convertNaturalPointToUnscaledCanvas:");
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
    objc_msgSend(v28, "setKnobTrackingDragPoint:", v25, v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
    v9->_multiTap = (uint64_t)objc_msgSend(v29, "knobTrackingTapCount") > 1;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "selection"));

    v9->_selectionType = (unint64_t)objc_msgSend(v31, "type");
    v9->_rangeAtStart.location = (NSUInteger)objc_msgSend(v31, "range");
    v9->_rangeAtStart.length = v32;
    if (v9->_selectionType != 7)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "editorHelper"));
      v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "logicalToVisualSelection:", v31));

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
      objc_msgSend(v36, "setSelection:", v35);

      v31 = (void *)v35;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "editorHelper"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "calculateVisualRunsFromSelection:updateControllerSelection:", v31, 1));

    v40 = objc_msgSend(v39, "start");
    v41 = objc_msgSend(v39, "end");
    if (objc_msgSend(v39, "isVisual"))
    {
      v40 = objc_msgSend(v39, "headCharIndex");
      v42 = objc_msgSend(v39, "tailCharIndex");
      if (v42 < v40)
        v40 = v42;
      v43 = objc_msgSend(v39, "headCharIndex");
      v44 = objc_msgSend(v39, "tailCharIndex");
      if (v43 <= v44)
        v45 = (unint64_t)v44;
      else
        v45 = (unint64_t)v43;
      v9->_headCharAtStart = (unint64_t)objc_msgSend(v39, "headCharIndex");
      v9->_tailCharAtStart = (unint64_t)objc_msgSend(v39, "tailCharIndex");
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "storage"));
      v41 = (_BYTE *)sub_1001AF294(v45, v47);

    }
    else
    {
      v9->_headCharAtStart = (unint64_t)v40;
      v9->_tailCharAtStart = (unint64_t)v41;
    }
    if (v40 <= v41)
      v48 = v41;
    else
      v48 = v40;
    if (v40 >= v41)
      v49 = v41;
    else
      v49 = v40;
    v9->_rangeAtStart.location = (NSUInteger)v49;
    v9->_rangeAtStart.length = v48 - v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
    objc_msgSend(v50, "refreshEditMenu");

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
    v52 = objc_msgSend(v51, "wantsParagraphModeWithSelection:", v39);

    if (v52)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v9, "knob"));
      if (objc_msgSend(v54, "tag") == (id)10)
        v55 = objc_msgSend(v39, "start");
      else
        v55 = objc_msgSend(v39, "end");
      v56 = v55;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v9, "knob"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "repForCharIndex:isStart:", v56, objc_msgSend(v57, "tag") == (id)11));

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
      if (v59 != v58)
        objc_msgSend(v58, "invalidateKnobs");
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
      objc_msgSend(v60, "invalidateKnobs");

      v61 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v9, "knob"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "knobForTag:", objc_msgSend(v62, "tag")));
      -[CRLCanvasKnobTracker setKnob:](v9, "setKnob:", v63);

    }
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](v9, "textEditor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "interactiveCanvasController"));
    if (v65)
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));

      if (v7)
        v67 = v66 == 0;
      else
        v67 = 1;
      if (v67)
        v68 = 1;
      else
        v68 = v52;
      if ((v68 & 1) != 0)
        goto LABEL_35;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
      objc_msgSend(v7, "position");
      -[CRLWPTextKnobTracker p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:](v9, "p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:", v64, 1, 1);
    }

LABEL_35:
  }

  return v9;
}

- (void)dealloc
{
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC8Freeform11CRLWPEditor *textEditor;
  objc_super v10;
  uint8_t buf[24];

  if (self->_textMagnifierTimer)
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260FD8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38EA0(v3, v4);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260FF8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100E02830(v6, buf, v3, (os_log_t)v5);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextKnobTracker dealloc]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextKnobTracker.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 156, 0, "_textMagnifierTimer retains us, so it should be gone by our -dealloc");

  }
  -[CRLWPTextKnobTracker p_cleanupWhenDone](self, "p_cleanupWhenDone");
  -[CRLWPTextKnobTracker p_stopMagnifyingWithAnimation:](self, "p_stopMagnifyingWithAnimation:", 0);
  textEditor = self->_textEditor;
  self->_textEditor = 0;

  v10.receiver = self;
  v10.super_class = (Class)CRLWPTextKnobTracker;
  -[CRLCanvasKnobTracker dealloc](&v10, "dealloc");
}

- (double)delay
{
  return 0.1;
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  id v7;

  if (self->_ignoreNextCall)
  {
    self->_ignoreNextCall = 0;
  }
  else
  {
    y = a3.y;
    x = a3.x;
    self->_knobMoved = 1;
    -[CRLWPTextKnobTracker p_setSelectionFromPoint:](self, "p_setSelectionFromPoint:");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
    objc_msgSend(v6, "setKnobTrackingDragPoint:", x, y);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v7, "invalidateKnobPositions");

  }
}

- (void)endMovingKnob
{
  objc_super v3;

  if (self->_knobMoved)
    -[CRLWPTextKnobTracker p_fixUpWordSelection](self, "p_fixUpWordSelection");
  -[CRLWPTextKnobTracker p_stopMagnifyingWithAnimation:](self, "p_stopMagnifyingWithAnimation:", 1);
  -[CRLWPTextKnobTracker p_cleanupWhenDone](self, "p_cleanupWhenDone");
  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextKnobTracker;
  -[CRLCanvasKnobTracker endMovingKnob](&v3, "endMovingKnob");
}

- (void)p_cleanupWhenDone
{
  id v3;
  id v4;

  if (!self->_doneTracking)
  {
    self->_doneTracking = 1;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
    objc_msgSend(v3, "setKnobTracking:", 0);

    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v4, "invalidateKnobs");
    objc_msgSend(v4, "invalidateKnobPositions");
    objc_msgSend(v4, "refreshEditMenu");

  }
}

- (BOOL)p_isMagnifyingVerticalText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t selectionType;
  void *v9;
  unsigned __int8 *v10;
  _BOOL4 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selection"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v6 = objc_msgSend(v5, "tag");

  v7 = -[CRLWPTextKnobTracker p_charIndexForKnob:selection:](self, "p_charIndexForKnob:selection:", v6, v4);
  selectionType = self->_selectionType;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v10 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](CRLWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", v7, v6, selectionType, v9);

  if (v10)
    v11 = (v10[25] >> 5) & 1;
  else
    LOBYTE(v11) = 0;

  return v11;
}

+ (const)p_lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(unint64_t)a5 rep:(id)a6
{
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "columns", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v9);
      v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "lineFragmentForCharIndex:knobTag:selectionType:", a3, a4, a5);
      if (v13)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

- (id)p_rangedMagnifier
{
  unsigned int v3;
  __objc2_class **v4;
  CRLWPTextMagnifierRanged *v5;
  CRLWPTextMagnifierRanged *magnifier;

  if (!self->_magnifier)
  {
    v3 = -[CRLWPTextKnobTracker p_isMagnifyingVerticalText](self, "p_isMagnifyingVerticalText");
    v4 = off_101229A68;
    if (!v3)
      v4 = off_101229A60;
    v5 = (CRLWPTextMagnifierRanged *)objc_opt_new(*v4);
    magnifier = self->_magnifier;
    self->_magnifier = v5;

  }
  return self->_magnifier;
}

- (void)p_startMagnifyingAt:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  self->_didDragKnob = 1;
  if (+[CRLFeatureFlagGroup isRedesignedTextCursorEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isRedesignedTextCursorEnabled"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textSelectionDelegate"));
    objc_msgSend(v6, "beginLoupeSessionAt:", x, y);

  }
}

- (void)p_magnifyWithTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6 delayed:(BOOL)a7
{
  double y;
  double x;
  void *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  self->_didDragKnob = 1;
  if (+[CRLFeatureFlagGroup isRedesignedTextCursorEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isRedesignedTextCursorEnabled", a3, a6, a7, a4.x, a4.y, a5.x, a5.y))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textSelectionDelegate"));
    objc_msgSend(v10, "moveLoupeTo:", x, y);

  }
}

- (void)p_stopMagnifyingWithAnimation:(BOOL)a3
{
  void *v4;
  id v5;

  if (+[CRLFeatureFlagGroup isRedesignedTextCursorEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isRedesignedTextCursorEnabled", a3))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textSelectionDelegate"));
    objc_msgSend(v4, "endLoupeSession");

  }
}

- (void)p_setSelectionFromPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned __int8 v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  char *tailCharAtStart;
  void *v35;
  id v36;
  uint64_t v37;
  _NSRange *p_rangeAtStart;
  NSUInteger location;
  NSUInteger v40;
  void *v41;
  id v42;
  void *v43;
  CRLWPSelection *v44;
  unsigned int v45;
  char v46;
  id v47;
  char *v48;
  unsigned int v49;
  unint64_t headCharAtStart;
  unint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  NSUInteger length;
  char *v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  void *v62;
  unsigned int v63;
  void *v64;
  void *v65;
  char *v66;
  __int128 *v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  void *v72;
  id v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  unsigned int v83;
  __int128 *v84;
  char *v85;
  char *v86;
  __int128 *v87;
  char *v88;
  char *v89;
  NSUInteger v90;
  NSRange v91;
  id v92;
  NSUInteger v93;
  NSUInteger v94;
  void *v95;
  NSUInteger v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  unsigned int v126;
  _BOOL4 v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  double v132;
  void *v133;
  id v134;
  double v135;
  id v136;
  double v137;
  void *v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSUInteger *p_length;
  unsigned int v143;
  unsigned int v144;
  void *v145;
  id v146;
  NSRange v147;
  NSRange v148;
  NSRange v149;
  NSRange v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;

  y = a3.y;
  x = a3.x;
  v146 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "storage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "closestRepToPoint:forStorage:", v6, x, y));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "columns"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v15 = objc_msgSend(v14, "textIsVertical");

    v16 = -[CRLWPEditor wantsParagraphMode](self->_textEditor, "wantsParagraphMode");
    if (self->_multiTap)
      v17 = 1;
    else
      v17 = v16;
    if ((v17 & 1) == 0)
    {
      if (v15)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        objc_msgSend(v8, "knobOffsetForKnob:paragraphMode:", v18, 0);
        v20 = v19;

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        v22 = objc_msgSend(v21, "tag");
        v23 = 1.0;
        if (v22 == (id)11)
          v23 = -1.0;
        v10 = v10 + v20 + v23;
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        objc_msgSend(v8, "knobOffsetForKnob:paragraphMode:", v24, 0);
        v26 = v25;

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        v27 = objc_msgSend(v21, "tag");
        v28 = -1.0;
        if (v27 == (id)11)
          v28 = 1.0;
        v12 = v12 - v26 + v28;
      }

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "selection"));
    objc_msgSend(v29, "range");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    v144 = v15;
    v31 = objc_msgSend(v30, "tag");

    v32 = objc_msgSend(v29, "type");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
    tailCharAtStart = +[CRLWPColumn charIndexForPointWithPinning:isTail:selectionType:inLayoutTarget:](CRLWPColumn, "charIndexForPointWithPinning:isTail:selectionType:inLayoutTarget:", v31 == (id)10, v32, v33, v10, v12);

    if (tailCharAtStart == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v35 = v29;
      v36 = v8;
LABEL_146:

      goto LABEL_147;
    }
    v145 = v6;
    if (self->_multiTap)
    {
      if (v31 == (id)11)
      {
        if (-[CRLWPTextKnobTracker p_newHeadCharIndex:isPastTailCharIndex:rep:](self, "p_newHeadCharIndex:isPastTailCharIndex:rep:", tailCharAtStart, self->_tailCharAtStart, v8))
        {
          v37 = 10;
        }
        else
        {
          v37 = 11;
        }
LABEL_29:
        if (v31 == (id)v37)
          goto LABEL_34;
        objc_msgSend(v146, "setKnobTag:", v37);
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        objc_msgSend(v43, "invalidateKnobs");

        objc_msgSend(v8, "invalidateKnobs");
        v44 = (CRLWPSelection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "knobForTag:", v37));
        if (v44)
          -[CRLCanvasKnobTracker setKnob:](self, "setKnob:", v44);
        v31 = (id)v37;
        goto LABEL_33;
      }
      if (v31 == (id)10)
      {
        if (-[CRLWPTextKnobTracker p_newTailCharIndex:isPastHeadCharIndex:rep:](self, "p_newTailCharIndex:isPastHeadCharIndex:rep:", tailCharAtStart, self->_headCharAtStart, v8))
        {
          v37 = 11;
        }
        else
        {
          v37 = 10;
        }
        goto LABEL_29;
      }
      p_rangeAtStart = &self->_rangeAtStart;
      location = self->_rangeAtStart.location;
LABEL_39:
      p_length = &p_rangeAtStart->length;
      v40 = p_rangeAtStart->length + location;
      goto LABEL_40;
    }
    if (self->_selectionType)
      goto LABEL_34;
    p_rangeAtStart = &self->_rangeAtStart;
    location = self->_rangeAtStart.location;
    if (v31 == (id)11)
    {
      p_length = &self->_rangeAtStart.length;
      v40 = self->_rangeAtStart.length + location;
      if ((unint64_t)tailCharAtStart < v40)
      {
LABEL_35:
        v45 = -[CRLWPTextKnobTracker p_newHeadCharIndex:isPastTailCharIndex:rep:](self, "p_newHeadCharIndex:isPastTailCharIndex:rep:", tailCharAtStart, self->_tailCharAtStart, v8, 80);
        v46 = v45;
        if (v45)
        {
          if (self->_selectionType == 7)
            tailCharAtStart = (char *)self->_tailCharAtStart;
          else
            tailCharAtStart = (char *)objc_msgSend(v145, "previousCharacterIndex:", v40);
        }
        if (self->_selectionType == 7)
        {
          v57 = self->_tailCharAtStart;
          if ((unint64_t)tailCharAtStart <= v57)
            v58 = self->_tailCharAtStart;
          else
            v58 = (unint64_t)tailCharAtStart;
          v59 = (char *)objc_msgSend(v145, "nextCharacterIndex:", v58);
          if ((unint64_t)tailCharAtStart >= v57)
            v60 = (char *)v57;
          else
            v60 = tailCharAtStart;
          if (v60 <= v59)
            v61 = v59;
          else
            v61 = v60;
          if (v60 >= v59)
            tailCharAtStart = v59;
          else
            tailCharAtStart = v60;
          length = v61 - tailCharAtStart;
        }
        else
        {
          length = v40 - (_QWORD)tailCharAtStart;
        }
        v143 = 1;
        v141 = 11;
        goto LABEL_78;
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "storage"));
      v42 = objc_msgSend(v41, "previousCharacterIndex:", self->_rangeAtStart.length + p_rangeAtStart->location);
    }
    else
    {
      if (v31 != (id)10 || (unint64_t)tailCharAtStart > location)
        goto LABEL_39;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "storage"));
      v42 = objc_msgSend(v41, "nextCharacterIndex:", p_rangeAtStart->location);
    }
    v73 = v42;

    if (v73 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_34:
      p_rangeAtStart = &self->_rangeAtStart;
      p_length = &self->_rangeAtStart.length;
      v40 = self->_rangeAtStart.length + self->_rangeAtStart.location;
      if (v31 == (id)11)
        goto LABEL_35;
LABEL_40:
      v141 = (uint64_t)v31;
      v47 = objc_msgSend(v29, "type", 80);
      v48 = tailCharAtStart;
      if (v47 != (id)7)
        v48 = (char *)objc_msgSend(v6, "previousCharacterIndex:", tailCharAtStart);
      v49 = -[CRLWPTextKnobTracker p_newTailCharIndex:isPastHeadCharIndex:rep:](self, "p_newTailCharIndex:isPastHeadCharIndex:rep:", v48, self->_headCharAtStart, v8);
      v46 = v49;
      if (v49)
      {
        if (self->_selectionType == 7)
          tailCharAtStart = (char *)self->_headCharAtStart;
        else
          tailCharAtStart = (char *)objc_msgSend(v145, "nextCharacterIndex:", p_rangeAtStart->location);
      }
      if (self->_selectionType == 7)
      {
        headCharAtStart = self->_headCharAtStart;
        if (headCharAtStart <= (unint64_t)tailCharAtStart)
          v51 = (unint64_t)tailCharAtStart;
        else
          v51 = self->_headCharAtStart;
        v52 = (char *)objc_msgSend(v145, "nextCharacterIndex:", v51);
        v143 = 0;
        if (headCharAtStart >= (unint64_t)tailCharAtStart)
          v53 = tailCharAtStart;
        else
          v53 = (char *)headCharAtStart;
        if (v53 <= v52)
          v54 = v52;
        else
          v54 = v53;
        if (v53 >= v52)
          tailCharAtStart = v52;
        else
          tailCharAtStart = v53;
        length = v54 - tailCharAtStart;
      }
      else
      {
        v143 = 0;
        v56 = &tailCharAtStart[-v40];
        tailCharAtStart = (char *)p_rangeAtStart->location;
        length = (NSUInteger)&v56[p_rangeAtStart->length];
      }
LABEL_78:
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", tailCharAtStart, length));
      v63 = objc_msgSend(v146, "wantsParagraphModeWithSelection:", v62);

      if (!v63)
      {
        v72 = v145;
        goto LABEL_124;
      }
      if ((v46 & 1) != 0)
      {
LABEL_123:
        v72 = v145;
        tailCharAtStart = (char *)objc_msgSend(v145, "textRangeForParagraphsInCharRange:", tailCharAtStart, length);
        length = v90;
LABEL_124:
        if (self->_multiTap)
        {
          v149.location = p_rangeAtStart->location;
          v149.length = *p_length;
          v147.location = (NSUInteger)tailCharAtStart;
          v147.length = length;
          v91 = NSUnionRange(v147, v149);
          tailCharAtStart = (char *)v91.location;
          length = v91.length;
        }
        v92 = -[CRLWPTextKnobTracker adjustSelectionRange:forStorage:](self, "adjustSelectionRange:forStorage:", tailCharAtStart, length, v72);
        v94 = v93;
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "editorHelper"));
        v150.location = (NSUInteger)objc_msgSend(v95, "selectionRangeForCharIndex:", objc_msgSend(v29, "range"));
        v150.length = v96;
        v148.location = (NSUInteger)v92;
        v148.length = v94;
        v97 = (id)sub_1001E9700(v148, v150);
        v99 = v98;

        if (objc_msgSend(v29, "range") == v97 && v100 == v99)
        {
          v35 = v29;
          v36 = v8;
          v6 = v145;
          goto LABEL_146;
        }
        v6 = v145;
        v101 = objc_msgSend(objc_alloc((Class)objc_msgSend(v146, "wpSelectionClass")), "initWithType:range:styleInsertionBehavior:caretAffinity:", 7, v97, v99, 0, 0);
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "editorController"));
        objc_msgSend(v102, "setSelection:forEditor:withFlags:", v101, v146, 14);

        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "editorHelper"));
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "selection"));
        v105 = objc_msgSend(v103, "calculateVisualRunsFromSelection:updateControllerSelection:", v104, 1);

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "selection"));
        self->_selectionType = (unint64_t)objc_msgSend(v35, "type");
        if (v143)
          v106 = objc_msgSend(v35, "start");
        else
          v106 = objc_msgSend(v35, "end");
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repForCharIndex:isStart:", v106, v143));
        v108 = v107;
        if (v107)
        {
          v36 = v107;

          v109 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
          if (v109 != v36)
          {
            objc_msgSend(v146, "setKnobTag:", v141);
            v110 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
            objc_msgSend(v110, "invalidateKnobs");

            objc_msgSend(v36, "invalidateKnobs");
            -[CRLCanvasKnobTracker setRep:](self, "setRep:", v36);
            v111 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
            v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "knobForTag:", v141));
            -[CRLCanvasKnobTracker setKnob:](self, "setKnob:", v112);

          }
        }
        else
        {
          v36 = v8;
        }
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        objc_msgSend(v113, "knobCenterForSelection:knob:", v35, v114);
        v116 = v115;
        v118 = v117;
        v119 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        objc_msgSend(v119, "setPosition:", v116, v118);

        v120 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        objc_msgSend(v120, "position");
        v122 = v121;
        v124 = v123;
        v125 = CGRectNull.origin.y;

        v126 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v140), "wantsParagraphMode");
        v127 = v122 == CGRectNull.origin.x;
        if (v124 != v125)
          v127 = 0;
        if ((v126 | v127) == 1)
        {
          -[CRLWPTextKnobTracker p_stopMagnifyingWithAnimation:](self, "p_stopMagnifyingWithAnimation:", 1);
        }
        else
        {
          v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "interactiveCanvasController"));
          if (v128)
          {
            v129 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
            if (v129)
            {
              v130 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));

              if (!v130)
                goto LABEL_145;
              v128 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
              v131 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
              objc_msgSend(v131, "position");
              -[CRLWPTextKnobTracker p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:](self, "p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:", v128, self->_textMagnifierTimer == 0, 0);

            }
          }
        }
LABEL_145:

        goto LABEL_146;
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "columns"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](CRLWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", v64, 0, 1, v10, v12));

      v66 = (char *)objc_msgSend(v65, "lineFragmentClosestToPoint:knobTag:", 5, v10, v12);
      v67 = (__int128 *)v66;
      if (!v66)
        goto LABEL_122;
      v69 = *((double *)v66 + 5);
      v68 = *((double *)v66 + 6);
      v71 = *((double *)v66 + 7);
      v70 = *((double *)v66 + 8);
      if (v143)
      {
        if (v144)
        {
          if (v10 <= CGRectGetMinX(*(CGRect *)(v66 + 40)))
          {
            if (v141 != 10)
              goto LABEL_122;
            goto LABEL_89;
          }
LABEL_101:
          if (*((uint64_t *)v67 + 3) < 0)
            v84 = &xmmword_100EEE418;
          else
            v84 = v67;
          v85 = *(char **)v84;
          if (v85 <= &tailCharAtStart[length])
            v86 = &tailCharAtStart[length];
          else
            v86 = v85;
          if (v85 >= &tailCharAtStart[length])
            tailCharAtStart += length;
          else
            tailCharAtStart = v85;
          length = v86 - tailCharAtStart;
          goto LABEL_122;
        }
        if (v12 < CGRectGetMaxY(*(CGRect *)(v66 + 40)))
          goto LABEL_101;
        if (v141 != 10)
        {
LABEL_122:

          goto LABEL_123;
        }
      }
      else
      {
        if (v141 != 10)
          goto LABEL_122;
        if (v144)
        {
LABEL_89:
          v151.origin.x = v69;
          v151.origin.y = v68;
          v151.size.width = v71;
          v151.size.height = v70;
          if (v10 >= CGRectGetMaxX(v151))
            goto LABEL_122;
LABEL_113:
          if (*((uint64_t *)v67 + 3) < 0)
            v87 = &xmmword_100EEE418;
          else
            v87 = v67;
          v88 = (char *)(*(_QWORD *)v87 + *((_QWORD *)v87 + 1));
          if (tailCharAtStart <= v88)
            v89 = v88;
          else
            v89 = tailCharAtStart;
          if (tailCharAtStart >= v88)
            tailCharAtStart = v88;
          length = v89 - tailCharAtStart;
          goto LABEL_122;
        }
      }
      v153.origin.x = v69;
      v153.origin.y = v68;
      v153.size.width = v71;
      v153.size.height = v70;
      if (v12 > CGRectGetMinY(v153))
        goto LABEL_113;
      goto LABEL_122;
    }
    v44 = -[CRLWPSelection initWithRange:]([CRLWPSelection alloc], "initWithRange:", v73, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v74, "caretRectForSelection:", v44);
    v76 = v75;
    v78 = v77;
    v80 = v79;
    v82 = v81;

    v154.origin.x = CGRectNull.origin.x;
    v154.origin.y = CGRectNull.origin.y;
    v154.size.width = CGRectNull.size.width;
    v154.size.height = CGRectNull.size.height;
    v152.origin.x = v76;
    v152.origin.y = v78;
    v152.size.width = v80;
    v152.size.height = v82;
    if (!CGRectEqualToRect(v152, v154))
    {
      v83 = v144;
      if (v31 != (id)11)
        v83 = 0;
      if (v83 == 1)
      {
        v76 = v76 + v80;
      }
      else if (v31 == (id)10)
      {
        v132 = -0.0;
        if (!v144)
          v132 = v82;
        v78 = v78 + v132;
      }
      if (v144)
      {
        v133 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        v134 = objc_msgSend(v133, "tag");
        v135 = 1.0;
        if (v134 == (id)11)
          v135 = -1.0;
        v10 = v76 + v135;
      }
      else
      {
        v133 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
        v136 = objc_msgSend(v133, "tag");
        v137 = -1.0;
        if (v136 == (id)11)
          v137 = 1.0;
        v12 = v78 + v137;
      }

      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
      v139 = +[CRLWPColumn charIndexForPointWithPinning:inLayoutTarget:](CRLWPColumn, "charIndexForPointWithPinning:inLayoutTarget:", v138, v10, v12);

      if (v139 != 0x7FFFFFFFFFFFFFFFLL)
        tailCharAtStart = (char *)v139;
    }
LABEL_33:

    goto LABEL_34;
  }
LABEL_147:

}

- (BOOL)p_newHeadCharIndex:(unint64_t)a3 isPastTailCharIndex:(unint64_t)a4 rep:(id)a5
{
  id v8;
  BOOL v9;
  const void *v10;
  unint64_t v11;
  id v12;
  const void *v13;
  BOOL v14;
  unint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t v21;

  v8 = a5;
  v9 = a3 >= a4;
  if (self->_selectionType == 7 && !-[CRLWPEditor wantsParagraphMode](self->_textEditor, "wantsParagraphMode"))
  {
    v10 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](CRLWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", a3, 11, self->_selectionType, v8);
    v12 = objc_msgSend(v8, "range");
    v13 = 0;
    v14 = a4 >= (unint64_t)v12;
    v15 = a4 - (_QWORD)v12;
    if (v14 && v15 < v11)
      v13 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](CRLWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", a4, 11, self->_selectionType, v8);
    if (v10)
      v16 = v10 == v13;
    else
      v16 = 0;
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storage"));
      v19 = objc_msgSend(v18, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", a3);

      v20 = sub_100145F64((uint64_t)v10, a3);
      v21 = sub_100145F64((uint64_t)v10, a4);
      if (v19)
        v9 = v20 < v21;
      else
        v9 = v20 > v21;
    }
  }

  return v9;
}

- (BOOL)p_newTailCharIndex:(unint64_t)a3 isPastHeadCharIndex:(unint64_t)a4 rep:(id)a5
{
  id v8;
  BOOL v9;
  const void *v10;
  unint64_t v11;
  id v12;
  const void *v13;
  BOOL v14;
  unint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t v21;

  v8 = a5;
  v9 = a3 <= a4;
  if (self->_selectionType == 7 && !-[CRLWPEditor wantsParagraphMode](self->_textEditor, "wantsParagraphMode"))
  {
    v10 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](CRLWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", a3, 11, self->_selectionType, v8);
    v12 = objc_msgSend(v8, "range");
    v13 = 0;
    v14 = a4 >= (unint64_t)v12;
    v15 = a4 - (_QWORD)v12;
    if (v14 && v15 < v11)
      v13 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](CRLWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", a4, 11, self->_selectionType, v8);
    if (v10)
      v16 = v10 == v13;
    else
      v16 = 0;
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storage"));
      v19 = objc_msgSend(v18, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", a3);

      v20 = sub_100145F64((uint64_t)v10, a3);
      v21 = sub_100145F64((uint64_t)v10, a4);
      if (v19)
        v9 = v20 > v21;
      else
        v9 = v20 < v21;
    }
  }

  return v9;
}

- (void)p_fixUpWordSelection
{
  double v3;
  double v4;
  id v5;
  void *v6;
  _BYTE *v7;
  _BYTE *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  __int128 *v14;
  void *v15;
  void *v16;
  char v17;
  char *location;
  NSUInteger v19;
  NSUInteger length;
  void *v21;
  void *v22;
  id v23;
  NSUInteger v24;
  NSUInteger v25;
  NSRange v26;
  void *v27;
  char *v28;
  void *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSUInteger v35;
  void *v36;
  void *v37;
  NSUInteger v38;
  CRLWPSelection *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  NSRange v45;
  NSRange v46;

  if (-[CRLWPTextKnobTracker fixupWordSelection](self, "fixupWordSelection")
    && !-[CRLWPTextMagnifierRanged terminalPointPlacedCarefully](self->_magnifier, "terminalPointPlacedCarefully"))
  {
    -[CRLWPTextMagnifierRanged horizontalMovement](self->_magnifier, "horizontalMovement");
    v4 = v3;
    v43 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    v5 = objc_msgSend(v43, "tag");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
    v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selection"));

    if (v4 >= 0.0)
    {
      if (v4 <= 0.0)
        goto LABEL_38;
      if (v5 != (id)11)
      {
        v7 = objc_msgSend(v44, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        v11 = v10;
        if (v10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "columnForCharIndex:", v7));
          if (v12
            && (v13 = (uint64_t *)objc_msgSend(v12, "lineFragmentForCharIndex:knobTag:selectionType:", v7, 10, objc_msgSend(v44, "type"))) != 0&& (v13[3] < 0 ? (v14 = &xmmword_100EEE418) : (v14 = (__int128 *)v13), *(_QWORD *)v14 < (unint64_t)v7 && v7 == (_BYTE *)(*(_QWORD *)v14 + *((_QWORD *)v14 + 1))))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storage"));
            v17 = sub_1001AE368((uint64_t)objc_msgSend(v16, "characterAtIndex:", v7 - 1));

            if ((v17 & 1) != 0)
              goto LABEL_38;
          }
          else
          {

          }
        }
        goto LABEL_23;
      }
      v8 = objc_msgSend(v44, "start");
    }
    else
    {
      if (v5 == (id)11)
      {
        v7 = objc_msgSend(v44, "start");
LABEL_23:
        v9 = 1;
LABEL_24:
        if (v7 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
        {
          location = (char *)objc_msgSend(v44, "range");
          length = v19;
          if (v9)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "storage"));
            v23 = objc_msgSend(v22, "wordAtCharIndex:includePreviousWord:", v7, 1);
            v25 = v24;

            if (v23 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
LABEL_37:
              v39 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([CRLWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", objc_msgSend(v44, "type"), location, length, objc_msgSend(v44, "styleInsertionBehavior"), objc_msgSend(v44, "caretAffinity"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "editorController"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
              objc_msgSend(v41, "setSelection:forEditor:withFlags:", v39, v42, 9);

              goto LABEL_38;
            }
          }
          else if (v5 == (id)11)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
            v28 = (char *)objc_msgSend(v27, "nextWordFromIndex:forward:", v7, 1);

            if (v28 < &location[length])
            {
              location += v28 - v7;
              length -= v28 - v7;
              goto LABEL_37;
            }
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "storage"));
            v23 = objc_msgSend(v34, "wordAtCharIndex:includePreviousWord:", v7, 1);
            v25 = v35;

            if (v23 == (id)0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_37;
          }
          else
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
            v30 = (char *)objc_msgSend(v29, "nextWordFromIndex:forward:", v7, 0);
            v32 = v31;

            if (v30 != (char *)0x7FFFFFFFFFFFFFFFLL && &v30[v32] > location)
            {
              length = (NSUInteger)&v30[v32 + length - (_QWORD)v7];
              goto LABEL_37;
            }
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextKnobTracker textEditor](self, "textEditor"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "storage"));
            v23 = objc_msgSend(v37, "wordAtCharIndex:includePreviousWord:", v7, 1);
            v25 = v38;

            if (v23 == (id)0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_37;
          }
          v45.location = (NSUInteger)location;
          v45.length = length;
          v46.location = (NSUInteger)v23;
          v46.length = v25;
          v26 = NSUnionRange(v45, v46);
          location = (char *)v26.location;
          length = v26.length;
          goto LABEL_37;
        }
LABEL_38:

        return;
      }
      v8 = objc_msgSend(v44, "end");
    }
    v7 = v8;
    v9 = 0;
    goto LABEL_24;
  }
}

- (unint64_t)p_charIndexForKnob:(unint64_t)a3 selection:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a4;
  if (objc_msgSend(v5, "type") == (id)7)
  {
    if (a3 == 11)
      v6 = objc_msgSend(v5, "headCharIndex");
    else
      v6 = objc_msgSend(v5, "tailCharIndex");
  }
  else if (a3 == 11)
  {
    v6 = objc_msgSend(v5, "start");
  }
  else
  {
    v6 = objc_msgSend(v5, "end");
  }
  v7 = (unint64_t)v6;

  return v7;
}

- (BOOL)shouldHideOtherKnobs
{
  return 0;
}

- (BOOL)fixupWordSelection
{
  return 1;
}

- (_NSRange)adjustSelectionRange:(_NSRange)a3 forStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)updateSelectionAfterAutoscroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "adjustedUnscaledAutoscrollPoint");
  v5 = v4;
  v7 = v6;
  -[CRLWPTextMagnifierRanged setAutoscrollDirections:](self->_magnifier, "setAutoscrollDirections:", objc_msgSend(v8, "directions"));
  -[CRLWPTextKnobTracker p_setSelectionFromPoint:](self, "p_setSelectionFromPoint:", v5, v7);
  -[CRLWPTextMagnifierRanged postAutoscrollPoint:](self->_magnifier, "postAutoscrollPoint:", v5, v7);

}

- (_TtC8Freeform11CRLWPEditor)textEditor
{
  return self->_textEditor;
}

- (void)setTextEditor:(id)a3
{
  objc_storeStrong((id *)&self->_textEditor, a3);
}

- (BOOL)didDragKnob
{
  return self->_didDragKnob;
}

- (BOOL)ignoreNextCall
{
  return self->_ignoreNextCall;
}

- (void)setIgnoreNextCall:(BOOL)a3
{
  self->_ignoreNextCall = a3;
}

- (CGPoint)magnificationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_magnificationPoint.x;
  y = self->_magnificationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnifier, 0);
  objc_storeStrong((id *)&self->_textMagnifierTimer, 0);
  objc_storeStrong((id *)&self->_textEditor, 0);
}

@end
