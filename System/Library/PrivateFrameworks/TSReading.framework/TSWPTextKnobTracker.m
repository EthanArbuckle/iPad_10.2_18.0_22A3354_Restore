@implementation TSWPTextKnobTracker

- (TSWPTextKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  TSWPTextKnobTracker *v5;
  TSDRep *v6;
  double v7;
  double v8;
  TSWPSelection *v9;
  NSUInteger v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSUInteger v19;
  _BOOL4 v20;
  TSDRep *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  char v26;
  uint64_t v27;
  TSWPInteractiveCanvasController *v28;
  TSDRep *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)TSWPTextKnobTracker;
  v5 = -[TSDKnobTracker initWithRep:knob:](&v31, sel_initWithRep_knob_, a3);
  if (v5)
  {
    objc_opt_class();
    -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSDRep interactiveCanvasController](-[TSDKnobTracker rep](v5, "rep"), "interactiveCanvasController"), "editorController"), "textInputEditor");
    -[TSWPTextKnobTracker setEditingController:](v5, "setEditingController:", TSUDynamicCast());
    -[TSWPEditingController setKnobTracking:](-[TSWPTextKnobTracker editingController](v5, "editingController"), "setKnobTracking:", 1);
    -[TSWPEditingController setKnobTag:](-[TSWPTextKnobTracker editingController](v5, "editingController"), "setKnobTag:", -[TSDKnob tag](-[TSDKnobTracker knob](v5, "knob"), "tag"));
    v6 = -[TSDKnobTracker rep](v5, "rep");
    objc_msgSend(a4, "position");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](v6, "convertNaturalPointToUnscaledCanvas:");
    -[TSWPEditingController setKnobTrackingDragPoint:](-[TSWPTextKnobTracker editingController](v5, "editingController"), "setKnobTrackingDragPoint:", v7, v8);
    v5->_multiTap = -[TSWPEditingController knobTrackingTapCount](-[TSWPTextKnobTracker editingController](v5, "editingController"), "knobTrackingTapCount") > 1;
    v9 = -[TSWPEditingController selection](-[TSWPTextKnobTracker editingController](v5, "editingController"), "selection");
    v5->_rangeAtStart.location = -[TSWPSelection range](v9, "range");
    v5->_rangeAtStart.length = v10;
    if (-[TSWPSelection type](v9, "type") != 7)
    {
      v9 = -[TSWPEditingController logicalToVisualSelection:](-[TSWPTextKnobTracker editingController](v5, "editingController"), "logicalToVisualSelection:", v9);
      -[TSWPEditingController setSelection:](-[TSWPTextKnobTracker editingController](v5, "editingController"), "setSelection:", v9);
    }
    v5->_selectionType = -[TSWPSelection type](v9, "type");
    v11 = -[TSWPEditingController calculateVisualRunsFromSelection:updateControllerSelection:](-[TSWPTextKnobTracker editingController](v5, "editingController"), "calculateVisualRunsFromSelection:updateControllerSelection:", v9, 1);
    v12 = objc_msgSend(v11, "headChar");
    v13 = objc_msgSend(v11, "tailChar");
    if (v13 >= v12)
      v14 = v12;
    else
      v14 = v13;
    v15 = objc_msgSend(v11, "headChar");
    v16 = objc_msgSend(v11, "tailChar");
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    if (v14 <= v17 + 1)
      v18 = v17 + 1;
    else
      v18 = v14;
    if (v14 >= v17 + 1)
      v19 = v17 + 1;
    else
      v19 = v14;
    v5->_rangeAtStart.location = v19;
    v5->_rangeAtStart.length = v18 - v19;
    v5->_headCharAtStart = objc_msgSend(v11, "headChar");
    v5->_tailCharAtStart = objc_msgSend(v11, "tailChar");
    -[TSDRep invalidateHUDState](-[TSDKnobTracker rep](v5, "rep"), "invalidateHUDState");
    v20 = -[TSWPEditingController isParagraphModeWithSelection:onStorage:](-[TSWPTextKnobTracker editingController](v5, "editingController"), "isParagraphModeWithSelection:onStorage:", v11, -[TSWPEditingController storage](-[TSWPTextKnobTracker editingController](v5, "editingController"), "storage"));
    if (v20)
    {
      v21 = -[TSDKnobTracker rep](v5, "rep");
      if (-[TSDKnob tag](-[TSDKnobTracker knob](v5, "knob"), "tag") == 10)
        v22 = objc_msgSend(v11, "start");
      else
        v22 = objc_msgSend(v11, "end");
      v23 = (void *)-[TSDRep repForCharIndex:isStart:](v21, "repForCharIndex:isStart:", v22, -[TSDKnob tag](-[TSDKnobTracker knob](v5, "knob"), "tag") == 11);
      if (-[TSDKnobTracker rep](v5, "rep") != v23)
        objc_msgSend(v23, "invalidateKnobs");
      -[TSDRep invalidateKnobs](-[TSDKnobTracker rep](v5, "rep"), "invalidateKnobs");
      -[TSDKnobTracker setKnob:](v5, "setKnob:", -[TSDRep knobForTag:](-[TSDKnobTracker rep](v5, "rep"), "knobForTag:", -[TSDKnob tag](-[TSDKnobTracker knob](v5, "knob"), "tag")));
    }
    if (-[TSWPEditingController interactiveCanvasController](-[TSWPTextKnobTracker editingController](v5, "editingController"), "interactiveCanvasController"))
    {
      v24 = -[TSDKnobTracker rep](v5, "rep");
      if (a4)
        v25 = v24 == 0;
      else
        v25 = 1;
      v26 = v25 || v20;
      if ((v26 & 1) == 0)
      {
        v27 = -[TSDKnobTracker rep](v5, "rep");
        v28 = -[TSWPEditingController interactiveCanvasController](-[TSWPTextKnobTracker editingController](v5, "editingController"), "interactiveCanvasController");
        v29 = -[TSDKnobTracker rep](v5, "rep");
        objc_msgSend(a4, "position");
        -[TSDRep convertNaturalPointToUnscaledCanvas:](v29, "convertNaturalPointToUnscaledCanvas:");
        -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v28, "convertUnscaledToBoundsPoint:");
        -[TSWPTextKnobTracker p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:](v5, "p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:", v27, 1, 1);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (self->_textMagnifierTimer)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextKnobTracker dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextKnobTracker.mm"), 126, CFSTR("_textMagnifierTimer retains us, so it should be gone by our -dealloc"));
  }
  -[TSWPTextKnobTracker p_cleanupWhenDone](self, "p_cleanupWhenDone");
  -[TSWPTextKnobTracker p_stopMagnifyingWithAnimation:](self, "p_stopMagnifyingWithAnimation:", 0);

  self->_editingController = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSWPTextKnobTracker;
  -[TSDKnobTracker dealloc](&v5, sel_dealloc);
}

- (double)delay
{
  return 0.1;
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y;
  double x;

  if (self->_ignoreNextCall)
  {
    self->_ignoreNextCall = 0;
  }
  else
  {
    y = a3.y;
    x = a3.x;
    self->_knobMoved = 1;
    -[TSWPTextKnobTracker p_setSelectionFromPoint:](self, "p_setSelectionFromPoint:");
    -[TSWPEditingController setKnobTrackingDragPoint:](-[TSWPTextKnobTracker editingController](self, "editingController"), "setKnobTrackingDragPoint:", x, y);
    -[TSDRep invalidateKnobPositions](-[TSDKnobTracker rep](self, "rep"), "invalidateKnobPositions");
  }
}

- (void)endMovingKnob
{
  objc_super v3;

  if (self->_knobMoved)
  {
    -[TSWPTextKnobTracker p_fixUpWordSelection](self, "p_fixUpWordSelection");
    -[TSWPTextKnobTracker p_stopMagnifyingWithAnimation:](self, "p_stopMagnifyingWithAnimation:", 0);
  }
  -[TSWPTextKnobTracker p_cleanupWhenDone](self, "p_cleanupWhenDone");
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextKnobTracker;
  -[TSDKnobTracker endMovingKnob](&v3, sel_endMovingKnob);
}

- (void)p_cleanupWhenDone
{
  TSDRep *v3;

  if (!self->_doneTracking)
  {
    self->_doneTracking = 1;
    -[TSWPEditingController setKnobTracking:](-[TSWPTextKnobTracker editingController](self, "editingController"), "setKnobTracking:", 0);
    v3 = -[TSDKnobTracker rep](self, "rep");
    -[TSDRep invalidateKnobs](v3, "invalidateKnobs");
    -[TSDRep invalidateKnobPositions](v3, "invalidateKnobPositions");
    -[TSDRep invalidateHUDState](v3, "invalidateHUDState");
  }
}

- (BOOL)p_isMagnifyingVerticalText
{
  TSWPSelection *v3;
  unint64_t v4;
  unsigned __int8 *v5;

  v3 = -[TSWPEditingController selection](-[TSWPTextKnobTracker editingController](self, "editingController"), "selection");
  v4 = -[TSDKnob tag](-[TSDKnobTracker knob](self, "knob"), "tag");
  v5 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](TSWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", -[TSWPTextKnobTracker p_charIndexForKnob:selection:](self, "p_charIndexForKnob:selection:", v4, v3), v4, self->_selectionType, -[TSDKnobTracker rep](self, "rep"));
  if (v5)
    LODWORD(v5) = (v5[25] >> 5) & 1;
  return (char)v5;
}

+ (const)p_lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(int)a5 rep:(id)a6
{
  uint64_t v6;
  void *v9;
  const void *result;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v6 = *(_QWORD *)&a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_msgSend(a6, "columns", 0);
  result = (const void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v11 = result;
    v12 = *(_QWORD *)v15;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v12)
        objc_enumerationMutation(v9);
      result = (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13), "lineFragmentForCharIndex:knobTag:selectionType:", a3, a4, v6);
      if (result)
        break;
      if (v11 == (const void *)++v13)
      {
        result = (const void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v11 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (id)p_rangedMagnifier
{
  _BOOL4 v2;
  __objc2_class **v3;

  v2 = -[TSWPTextKnobTracker p_isMagnifyingVerticalText](self, "p_isMagnifyingVerticalText");
  v3 = off_24D827660;
  if (!v2)
    v3 = off_24D827648;
  return (id)-[__objc2_class sharedRangedMagnifier](*v3, "sharedRangedMagnifier");
}

- (void)p_startMagnifying
{
  NSTimer *textMagnifierTimer;
  void *v4;
  uint64_t v5;
  id v6;
  TSWPTextMagnifierRanged *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  textMagnifierTimer = self->_textMagnifierTimer;
  if (!textMagnifierTimer)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextKnobTracker p_startMagnifying]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextKnobTracker.mm"), 261, CFSTR("invalid nil value for '%s'"), "_textMagnifierTimer");
    textMagnifierTimer = self->_textMagnifierTimer;
  }
  v6 = -[NSTimer userInfo](textMagnifierTimer, "userInfo");
  v7 = -[TSWPTextKnobTracker p_rangedMagnifier](self, "p_rangedMagnifier");
  self->_magnifier = v7;
  v8 = objc_msgSend(v6, "target");
  objc_msgSend(v6, "magnificationPoint");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "offset");
  -[TSWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:](v7, "beginMagnifyingTarget:magnificationPoint:offset:animated:", v8, objc_msgSend(v6, "animated"), v10, v12, v13, v14);
  self->_didShowMagnifier = 1;

  self->_textMagnifierTimer = 0;
}

- (void)p_magnifyWithTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6 delayed:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  double y;
  double x;
  double v11;
  double v12;
  NSTimer *textMagnifierTimer;
  void *v16;
  TSWPTextMagnifierRanged *magnifier;
  TSWPTextMagnifierRanged *v18;
  TSWPBeginMagnificationUserInfo *v19;

  v7 = a7;
  v8 = a6;
  y = a5.y;
  x = a5.x;
  v11 = a4.y;
  v12 = a4.x;
  textMagnifierTimer = self->_textMagnifierTimer;
  if (textMagnifierTimer)
  {
    -[NSTimer invalidate](textMagnifierTimer, "invalidate");

    self->_textMagnifierTimer = 0;
  }
  if (v7)
  {
    v19 = objc_alloc_init(TSWPBeginMagnificationUserInfo);
    -[TSWPBeginMagnificationUserInfo setTarget:](v19, "setTarget:", a3);
    -[TSWPBeginMagnificationUserInfo setMagnificationPoint:](v19, "setMagnificationPoint:", v12, v11);
    -[TSWPBeginMagnificationUserInfo setOffset:](v19, "setOffset:", x, y);
    -[TSWPBeginMagnificationUserInfo setAnimated:](v19, "setAnimated:", v8);
    self->_textMagnifierTimer = (NSTimer *)(id)objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_p_startMagnifying, v19, 0, 0.25);
    v16 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    objc_msgSend(v16, "addTimer:forMode:", self->_textMagnifierTimer, *MEMORY[0x24BDBCA90]);

  }
  else
  {
    magnifier = self->_magnifier;
    if (magnifier)
    {
      -[TSWPTextMagnifierRanged setTarget:](magnifier, "setTarget:", a3);
      -[TSWPTextMagnifierRanged setMagnificationPoint:](self->_magnifier, "setMagnificationPoint:", v12, v11);
      -[TSWPTextMagnifierRanged setOffset:](self->_magnifier, "setOffset:", x, y);
    }
    else
    {
      v18 = -[TSWPTextKnobTracker p_rangedMagnifier](self, "p_rangedMagnifier");
      self->_magnifier = v18;
      -[TSWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:](v18, "beginMagnifyingTarget:magnificationPoint:offset:animated:", a3, v8, v12, v11, x, y);
      self->_didShowMagnifier = 1;
    }
  }
}

- (void)p_stopMagnifyingWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  NSTimer *textMagnifierTimer;
  TSWPTextMagnifierRanged *magnifier;

  v3 = a3;
  textMagnifierTimer = self->_textMagnifierTimer;
  if (textMagnifierTimer)
  {
    -[NSTimer invalidate](textMagnifierTimer, "invalidate");

    self->_textMagnifierTimer = 0;
  }
  magnifier = self->_magnifier;
  if (magnifier)
  {
    -[TSWPTextMagnifierRanged stopMagnifying:](magnifier, "stopMagnifying:", v3);
    self->_magnifier = 0;
  }
}

- (void)p_setSelectionFromPoint:(CGPoint)a3
{
  double y;
  double x;
  TSWPEditingController *v6;
  TSWPStorage *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  _BOOL8 v15;
  _BOOL8 v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  TSWPSelection *v23;
  unint64_t v24;
  unint64_t v25;
  NSUInteger tailCharAtStart;
  uint64_t v27;
  _NSRange *p_rangeAtStart;
  NSUInteger location;
  NSUInteger v30;
  _BOOL4 v31;
  uint64_t v32;
  BOOL v33;
  _BOOL4 v34;
  unint64_t headCharAtStart;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  NSUInteger length;
  NSUInteger v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  NSUInteger *v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  uint64_t v54;
  NSUInteger v55;
  TSWPSelection *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  unint64_t v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  NSUInteger v68;
  NSUInteger v69;
  NSUInteger v70;
  NSUInteger v71;
  NSRange v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  TSWPSelection *v77;
  uint64_t v78;
  TSWPSelection *v79;
  uint64_t v80;
  TSDRep *v81;
  TSDRep *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  _BOOL4 v87;
  TSWPInteractiveCanvasController *v88;
  TSDRep *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  TSDRep *v94;
  NSUInteger *v95;
  NSUInteger *p_length;
  _NSRange *v97;
  int v98;
  uint64_t v99;
  NSRange v100;
  NSRange v101;
  CGRect v102;
  CGRect v103;

  y = a3.y;
  x = a3.x;
  v6 = -[TSWPTextKnobTracker editingController](self, "editingController");
  v7 = -[TSWPEditingController storage](v6, "storage");
  v8 = -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](-[TSWPEditingController interactiveCanvasController](v6, "interactiveCanvasController"), "closestRepToPoint:forStorage:", v7, x, y);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v11 = v10;
    v13 = v12;
    v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "columns"), "objectAtIndexedSubscript:", 0), "textIsVertical");
    v15 = -[TSWPEditingController isInParagraphMode](self->_editingController, "isInParagraphMode");
    v16 = v15;
    if (!self->_multiTap && !v15)
    {
      objc_msgSend(v9, "knobOffsetForKnob:paragraphMode:", -[TSDKnobTracker knob](self, "knob"), 0);
      v18 = v17;
      v19 = -[TSDKnob tag](-[TSDKnobTracker knob](self, "knob"), "tag");
      v20 = -1.0;
      if (v19 == 11)
        v21 = 1.0;
      else
        v21 = -1.0;
      if (v19 != 11)
        v20 = 1.0;
      v22 = v11 + v18 + v20;
      if (v14)
        v11 = v22;
      else
        v13 = v13 - v18 + v21;
    }
    v98 = v14;
    v23 = -[TSWPEditingController selection](v6, "selection");
    -[TSWPSelection range](v23, "range");
    v24 = -[TSDKnob tag](-[TSDKnobTracker knob](self, "knob"), "tag");
    v25 = objc_msgSend(v9, "charIndexForPointWithPinning:isTail:selectionType:", v24 == 10, -[TSWPSelection type](v23, "type"), v11, v13);
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      tailCharAtStart = v25;
      if (self->_multiTap)
      {
        if (v24 == 11)
        {
          if (-[TSWPTextKnobTracker p_newHeadCharIndex:isPastTailCharIndex:rep:](self, "p_newHeadCharIndex:isPastTailCharIndex:rep:", v25, self->_tailCharAtStart, v9))
          {
            v27 = 10;
          }
          else
          {
            v27 = 11;
          }
          goto LABEL_26;
        }
        if (v24 == 10)
        {
          if (-[TSWPTextKnobTracker p_newTailCharIndex:isPastHeadCharIndex:rep:](self, "p_newTailCharIndex:isPastHeadCharIndex:rep:", v25, self->_headCharAtStart, v9))
          {
            v27 = 11;
          }
          else
          {
            v27 = 10;
          }
LABEL_26:
          if (v24 == v27)
          {
            v99 = v24;
          }
          else
          {
            -[TSWPEditingController setKnobTag:](v6, "setKnobTag:", v27);
            -[TSDRep invalidateKnobs](-[TSDKnobTracker rep](self, "rep"), "invalidateKnobs");
            objc_msgSend(v9, "invalidateKnobs");
            v32 = objc_msgSend(v9, "knobForTag:", v27);
            if (v32)
              -[TSDKnobTracker setKnob:](self, "setKnob:", v32);
            v99 = v27;
          }
          goto LABEL_31;
        }
        v99 = v24;
        p_rangeAtStart = &self->_rangeAtStart;
        location = self->_rangeAtStart.location;
LABEL_37:
        v97 = p_rangeAtStart;
        p_length = &p_rangeAtStart->length;
        v30 = p_rangeAtStart->length + location;
        goto LABEL_38;
      }
      v99 = v24;
      if (self->_selectionType)
        goto LABEL_31;
      p_rangeAtStart = &self->_rangeAtStart;
      location = self->_rangeAtStart.location;
      if (v24 == 11)
      {
        v30 = self->_rangeAtStart.length + location;
        if (v25 < v30)
        {
          v97 = &self->_rangeAtStart;
          v31 = -[TSWPTextKnobTracker p_newHeadCharIndex:isPastTailCharIndex:rep:](self, "p_newHeadCharIndex:isPastTailCharIndex:rep:", v25, self->_tailCharAtStart, v9, &self->_rangeAtStart.length);
LABEL_33:
          v33 = v31;
          if (v31)
          {
            if (self->_selectionType == 7)
              tailCharAtStart = self->_tailCharAtStart;
            else
              tailCharAtStart = -[TSWPStorage previousCharacterIndex:](v7, "previousCharacterIndex:", v30);
          }
          if (self->_selectionType == 7)
          {
            v43 = self->_tailCharAtStart;
            if (tailCharAtStart >= v43)
              v44 = self->_tailCharAtStart;
            else
              v44 = tailCharAtStart;
            if (tailCharAtStart <= v43)
              v45 = self->_tailCharAtStart;
            else
              v45 = tailCharAtStart;
            v46 = -[TSWPStorage nextCharacterIndex:](v7, "nextCharacterIndex:", v45);
            if (v44 <= v46)
              v47 = v46;
            else
              v47 = v44;
            if (v44 >= v46)
              tailCharAtStart = v46;
            else
              tailCharAtStart = v44;
            length = v47 - tailCharAtStart;
          }
          else
          {
            length = v30 - tailCharAtStart;
          }
          v39 = 1;
          v99 = 11;
          goto LABEL_74;
        }
        v54 = -[TSWPStorage previousCharacterIndex:](-[TSWPEditingController storage](v6, "storage"), "previousCharacterIndex:", self->_rangeAtStart.length + p_rangeAtStart->location);
      }
      else
      {
        if (v24 != 10 || v25 > location)
          goto LABEL_37;
        v54 = -[TSWPStorage nextCharacterIndex:](-[TSWPEditingController storage](v6, "storage"), "nextCharacterIndex:", p_rangeAtStart->location);
      }
      if (v54 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v56 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v54, 0);
        -[TSDRep knobCenterForSelection:knob:](-[TSDKnobTracker rep](self, "rep"), "knobCenterForSelection:knob:", v56, -[TSDKnobTracker knob](self, "knob"));
        v58 = v57;
        v60 = v59;

        if (v58 != *MEMORY[0x24BDBF070] || v60 != *(double *)(MEMORY[0x24BDBF070] + 8))
        {
          objc_msgSend(v9, "knobOffsetForKnob:paragraphMode:", -[TSDKnobTracker knob](self, "knob"), v16);
          v62 = v61;
          v63 = -[TSDKnob tag](-[TSDKnobTracker knob](self, "knob"), "tag");
          v64 = -1.0;
          if (v63 == 11)
            v65 = 1.0;
          else
            v65 = -1.0;
          if (v63 != 11)
            v64 = 1.0;
          v66 = v58 + v62 + v64;
          if (v98)
            v11 = v66;
          else
            v13 = v60 - v62 + v65;
          v67 = objc_msgSend(v9, "charIndexForPointWithPinning:", v11, v13);
          if (v67 != 0x7FFFFFFFFFFFFFFFLL)
            tailCharAtStart = v67;
        }
      }
LABEL_31:
      v97 = &self->_rangeAtStart;
      p_length = &self->_rangeAtStart.length;
      v30 = self->_rangeAtStart.length + self->_rangeAtStart.location;
      if (v99 == 11)
      {
        v31 = -[TSWPTextKnobTracker p_newHeadCharIndex:isPastTailCharIndex:rep:](self, "p_newHeadCharIndex:isPastTailCharIndex:rep:", tailCharAtStart, self->_tailCharAtStart, v9, p_length);
        goto LABEL_33;
      }
LABEL_38:
      v34 = -[TSWPTextKnobTracker p_newTailCharIndex:isPastHeadCharIndex:rep:](self, "p_newTailCharIndex:isPastHeadCharIndex:rep:", tailCharAtStart, self->_headCharAtStart, v9, p_length);
      v33 = v34;
      if (v34)
      {
        if (self->_selectionType == 7)
          tailCharAtStart = self->_headCharAtStart;
        else
          tailCharAtStart = -[TSWPStorage nextCharacterIndex:](v7, "nextCharacterIndex:", v97->location);
      }
      if (self->_selectionType == 7)
      {
        headCharAtStart = self->_headCharAtStart;
        if (headCharAtStart >= tailCharAtStart)
          v36 = tailCharAtStart;
        else
          v36 = self->_headCharAtStart;
        if (headCharAtStart <= tailCharAtStart)
          v37 = tailCharAtStart;
        else
          v37 = self->_headCharAtStart;
        v38 = -[TSWPStorage nextCharacterIndex:](v7, "nextCharacterIndex:", v37);
        v39 = 0;
        if (v36 <= v38)
          v40 = v38;
        else
          v40 = v36;
        if (v36 >= v38)
          tailCharAtStart = v38;
        else
          tailCharAtStart = v36;
        length = v40 - tailCharAtStart;
      }
      else
      {
        v39 = 0;
        v42 = tailCharAtStart - v30;
        tailCharAtStart = v97->location;
        length = v42 + v97->length;
      }
LABEL_74:
      if (!-[TSWPEditingController isParagraphModeWithSelection:onStorage:](v6, "isParagraphModeWithSelection:onStorage:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", tailCharAtStart, length), v7))
      {
LABEL_121:
        if (self->_multiTap)
        {
          v101.location = v97->location;
          v101.length = *v95;
          v100.location = tailCharAtStart;
          v100.length = length;
          v72 = NSUnionRange(v100, v101);
          tailCharAtStart = v72.location;
          length = v72.length;
        }
        -[TSWPTextKnobTracker adjustSelectionRange:forStorage:](self, "adjustSelectionRange:forStorage:", tailCharAtStart, length, v7);
        -[TSWPStorage selectionRangeForCharIndex:](v7, "selectionRangeForCharIndex:", -[TSWPSelection range](v23, "range"));
        v73 = NSIntersectionRangeInclusive();
        v75 = v74;
        if (-[TSWPSelection range](v23, "range") != v73 || v76 != v75)
        {
          v77 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 7, v73, v75, 0, 0);
          if (v99 == 10)
            v78 = 33616;
          else
            v78 = 848;
          -[TSWPEditingController setSelection:withFlags:](v6, "setSelection:withFlags:", v77, v78);
          -[TSWPEditingController calculateVisualRunsFromSelection:updateControllerSelection:](v6, "calculateVisualRunsFromSelection:updateControllerSelection:", -[TSWPEditingController selection](v6, "selection"), 1);
          v79 = -[TSWPEditingController selection](v6, "selection");

          if ((_DWORD)v39)
            v80 = -[TSWPSelection start](v79, "start");
          else
            v80 = -[TSWPSelection end](v79, "end");
          v81 = (TSDRep *)objc_msgSend(v9, "repForCharIndex:isStart:", v80, v39);
          if (v81)
          {
            v82 = v81;
            if (-[TSDKnobTracker rep](self, "rep") != v81)
            {
              -[TSWPEditingController setKnobTag:](v6, "setKnobTag:", v99);
              -[TSDRep invalidateKnobs](-[TSDKnobTracker rep](self, "rep"), "invalidateKnobs");
              -[TSDRep invalidateKnobs](v82, "invalidateKnobs");
              -[TSDKnobTracker setRep:](self, "setRep:", v82);
              -[TSDKnobTracker setKnob:](self, "setKnob:", -[TSDRep knobForTag:](-[TSDKnobTracker rep](self, "rep"), "knobForTag:", v99));
            }
          }
          -[TSDRep knobCenterForSelection:knob:](-[TSDKnobTracker rep](self, "rep"), "knobCenterForSelection:knob:", v79, -[TSDKnobTracker knob](self, "knob"));
          -[TSDKnob setPosition:](-[TSDKnobTracker knob](self, "knob"), "setPosition:", v83, v84);
          -[TSDKnob position](-[TSDKnobTracker knob](self, "knob"), "position");
          v87 = v86 == *(double *)(MEMORY[0x24BDBF070] + 8) && v85 == *MEMORY[0x24BDBF070];
          if (-[TSWPEditingController isInParagraphMode](self->_editingController, "isInParagraphMode") || v87)
          {
            -[TSWPTextKnobTracker p_stopMagnifyingWithAnimation:](self, "p_stopMagnifyingWithAnimation:", 1);
          }
          else if (-[TSWPEditingController interactiveCanvasController](v6, "interactiveCanvasController")
                 && -[TSDKnobTracker rep](self, "rep"))
          {
            if (-[TSDKnobTracker knob](self, "knob"))
            {
              v88 = -[TSWPEditingController interactiveCanvasController](v6, "interactiveCanvasController");
              v89 = -[TSDKnobTracker rep](self, "rep");
              -[TSDKnob position](-[TSDKnobTracker knob](self, "knob"), "position");
              -[TSDRep convertNaturalPointToUnscaledCanvas:](v89, "convertNaturalPointToUnscaledCanvas:");
              -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v88, "convertUnscaledToBoundsPoint:");
              v91 = v90;
              v93 = v92;
              v94 = -[TSDKnobTracker rep](self, "rep");
              -[TSWPTextKnobTracker p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:](self, "p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:", v94, self->_textMagnifierTimer == 0, 0, v91, v93, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
            }
          }
        }
        return;
      }
      if (v33)
        goto LABEL_120;
      v48 = objc_msgSend(+[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", objc_msgSend(v9, "columns"), 0, 1, v11, v13), "lineFragmentClosestToPoint:knobTag:", 5, v11, v13);
      if (!v48)
        goto LABEL_120;
      v49 = (NSUInteger *)v48;
      v51 = *(double *)(v48 + 48);
      v50 = *(double *)(v48 + 56);
      v53 = *(double *)(v48 + 64);
      v52 = *(double *)(v48 + 72);
      if ((_DWORD)v39)
      {
        if (v98)
        {
          if (v11 <= CGRectGetMinX(*(CGRect *)(v48 + 48)))
          {
            if (v99 != 10)
              goto LABEL_120;
            goto LABEL_84;
          }
LABEL_90:
          if (*v49 <= length + tailCharAtStart)
            v55 = length + tailCharAtStart;
          else
            v55 = *v49;
          if (*v49 >= length + tailCharAtStart)
            tailCharAtStart += length;
          else
            tailCharAtStart = *v49;
          length = v55 - tailCharAtStart;
          goto LABEL_120;
        }
        if (v13 < CGRectGetMaxY(*(CGRect *)(v48 + 48)))
          goto LABEL_90;
        if (v99 != 10)
        {
LABEL_120:
          tailCharAtStart = -[TSWPStorage textRangeForParagraphsInCharRange:](v7, "textRangeForParagraphsInCharRange:", tailCharAtStart, length);
          length = v71;
          goto LABEL_121;
        }
      }
      else
      {
        if (v99 != 10)
          goto LABEL_120;
        if (v98)
        {
LABEL_84:
          v102.origin.x = v51;
          v102.origin.y = v50;
          v102.size.width = v53;
          v102.size.height = v52;
          if (v11 >= CGRectGetMaxX(v102))
            goto LABEL_120;
LABEL_114:
          v68 = v49[1];
          v69 = v68 + *v49;
          if (tailCharAtStart <= v69)
            v70 = v68 + *v49;
          else
            v70 = tailCharAtStart;
          if (tailCharAtStart >= v69)
            tailCharAtStart = v69;
          length = v70 - tailCharAtStart;
          goto LABEL_120;
        }
      }
      v103.origin.x = v51;
      v103.origin.y = v50;
      v103.size.width = v53;
      v103.size.height = v52;
      if (v13 > CGRectGetMinY(v103))
        goto LABEL_114;
      goto LABEL_120;
    }
  }
}

- (BOOL)p_newHeadCharIndex:(unint64_t)a3 isPastTailCharIndex:(unint64_t)a4 rep:(id)a5
{
  BOOL v9;
  BOOL v10;
  TSWPLineFragment *v11;
  unint64_t v12;
  unint64_t v13;
  TSWPLineFragment *v14;
  BOOL v15;
  unint64_t v16;
  _BOOL4 v17;
  unint64_t v18;
  unint64_t v19;

  v9 = -[TSWPEditingController isInParagraphMode](self->_editingController, "isInParagraphMode");
  v10 = a3 >= a4;
  if (self->_selectionType == 7 && !v9)
  {
    v11 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](TSWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", a3, 11, 7, a5);
    v13 = objc_msgSend(a5, "range");
    v14 = 0;
    v15 = a4 >= v13;
    v16 = a4 - v13;
    if (v15 && v16 < v12)
      v14 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](TSWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", a4, 11, self->_selectionType, a5);
    if (v11 && v11 == v14)
    {
      v17 = -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtCharIndex:](-[TSWPEditingController storage](-[TSWPTextKnobTracker editingController](self, "editingController"), "storage"), "isWritingDirectionRightToLeftForParagraphAtCharIndex:", a3);
      v18 = TSWPLineFragment::visualIndexForCharIndex(v11, a3);
      v19 = TSWPLineFragment::visualIndexForCharIndex(v11, a4);
      if (v17)
        return v18 < v19;
      else
        return v18 > v19;
    }
  }
  return v10;
}

- (BOOL)p_newTailCharIndex:(unint64_t)a3 isPastHeadCharIndex:(unint64_t)a4 rep:(id)a5
{
  BOOL v9;
  BOOL v10;
  TSWPLineFragment *v11;
  unint64_t v12;
  unint64_t v13;
  TSWPLineFragment *v14;
  BOOL v15;
  unint64_t v16;
  _BOOL4 v17;
  unint64_t v18;
  unint64_t v19;

  v9 = -[TSWPEditingController isInParagraphMode](self->_editingController, "isInParagraphMode");
  v10 = a3 <= a4;
  if (self->_selectionType == 7 && !v9)
  {
    v11 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](TSWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", a3, 11, 7, a5);
    v13 = objc_msgSend(a5, "range");
    v14 = 0;
    v15 = a4 >= v13;
    v16 = a4 - v13;
    if (v15 && v16 < v12)
      v14 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:knobTag:selectionType:rep:](TSWPTextKnobTracker, "p_lineFragmentForCharIndex:knobTag:selectionType:rep:", a4, 11, self->_selectionType, a5);
    if (v11 && v11 == v14)
    {
      v17 = -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtCharIndex:](-[TSWPEditingController storage](-[TSWPTextKnobTracker editingController](self, "editingController"), "storage"), "isWritingDirectionRightToLeftForParagraphAtCharIndex:", a3);
      v18 = TSWPLineFragment::visualIndexForCharIndex(v11, a3);
      v19 = TSWPLineFragment::visualIndexForCharIndex(v11, a4);
      if (v17)
        return v18 > v19;
      else
        return v18 < v19;
    }
  }
  return v10;
}

- (void)p_fixUpWordSelection
{
  double v3;
  double v4;
  unint64_t v5;
  TSWPSelection *v6;
  TSWPSelection *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t location;
  NSUInteger v11;
  NSUInteger length;
  uint64_t v13;
  int v14;
  TSDRep *v15;
  void *v16;
  unint64_t *v17;
  NSUInteger v18;
  TSWPStorage *v19;
  unint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  NSRange v23;
  uint64_t v24;
  uint64_t v25;
  TSWPSelection *v26;
  NSRange v27;
  NSRange v28;

  if (!-[TSWPTextKnobTracker fixupWordSelection](self, "fixupWordSelection")
    || -[TSWPTextMagnifierRanged terminalPointPlacedCarefully](self->_magnifier, "terminalPointPlacedCarefully"))
  {
    -[TSWPEditingController revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold](-[TSWPTextKnobTracker editingController](self, "editingController"), "revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold");
    return;
  }
  -[TSWPTextMagnifierRanged horizontalMovement](self->_magnifier, "horizontalMovement");
  v4 = v3;
  v5 = -[TSDKnob tag](-[TSDKnobTracker knob](self, "knob"), "tag");
  v6 = -[TSWPEditingController selection](-[TSWPTextKnobTracker editingController](self, "editingController"), "selection");
  v7 = v6;
  if (v4 >= 0.0)
  {
    if (v4 <= 0.0)
      return;
    if (v5 != 11)
    {
      v9 = -[TSWPSelection end](v6, "end");
      v15 = -[TSDKnobTracker rep](self, "rep");
      if (v15
        && (v16 = (void *)-[TSDRep columnForCharIndex:](v15, "columnForCharIndex:", v9)) != 0
        && (v17 = (unint64_t *)objc_msgSend(v16, "lineFragmentForCharIndex:knobTag:selectionType:", v9, 10, -[TSWPSelection type](v7, "type"))) != 0)
      {
        v14 = 1;
        if (*v17 < v9
          && v9 == v17[1] + *v17
          && (IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](-[TSWPEditingController storage](-[TSWPTextKnobTracker editingController](self, "editingController"), "storage"), "characterAtIndex:", v9 - 1)) & 1) != 0)
        {
          return;
        }
      }
      else
      {
        v14 = 1;
      }
      goto LABEL_21;
    }
    v13 = -[TSWPSelection start](v6, "start");
  }
  else
  {
    if (v5 == 11)
    {
      v8 = -[TSWPSelection start](v6, "start");
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = v8;
        location = -[TSWPSelection range](v7, "range");
        length = v11;
        goto LABEL_27;
      }
      return;
    }
    v13 = -[TSWPSelection end](v6, "end");
  }
  v9 = v13;
  v14 = 0;
LABEL_21:
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    location = -[TSWPSelection range](v7, "range");
    length = v18;
    if (!v14)
    {
      v19 = -[TSWPEditingController storage](-[TSWPTextKnobTracker editingController](self, "editingController"), "storage");
      if (v5 != 11)
      {
        v24 = -[TSWPStorage nextWordFromIndex:forward:](v19, "nextWordFromIndex:forward:", v9, 0);
        if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 + v25 > location)
        {
          length = length - v9 + v24 + v25;
          goto LABEL_29;
        }
        v21 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](-[TSWPEditingController storage](-[TSWPTextKnobTracker editingController](self, "editingController"), "storage"), "wordAtCharIndex:includePreviousWord:", v9, 1);
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_29;
        goto LABEL_28;
      }
      v20 = -[TSWPStorage nextWordFromIndex:forward:](v19, "nextWordFromIndex:forward:", v9, 1);
      if (v20 < location + length)
      {
        location += v20 - v9;
        length -= v20 - v9;
        goto LABEL_29;
      }
    }
LABEL_27:
    v21 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](-[TSWPEditingController storage](-[TSWPTextKnobTracker editingController](self, "editingController"), "storage"), "wordAtCharIndex:includePreviousWord:", v9, 1);
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_28:
      v28.location = v21;
      v28.length = v22;
      v27.location = location;
      v27.length = length;
      v23 = NSUnionRange(v27, v28);
      location = v23.location;
      length = v23.length;
    }
LABEL_29:
    v26 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", -[TSWPSelection type](v7, "type"), location, length, -[TSWPSelection styleInsertionBehavior](v7, "styleInsertionBehavior"), -[TSWPSelection caretAffinity](v7, "caretAffinity"));
    -[TSWPEditingController setSelection:withFlags:](-[TSWPTextKnobTracker editingController](self, "editingController"), "setSelection:withFlags:", v26, 772);

  }
}

- (unint64_t)p_charIndexForKnob:(unint64_t)a3 selection:(id)a4
{
  if (objc_msgSend(a4, "type") == 7)
  {
    if (a3 == 11)
      return objc_msgSend(a4, "headChar");
    else
      return objc_msgSend(a4, "tailChar");
  }
  else if (a3 == 11)
  {
    return objc_msgSend(a4, "start");
  }
  else
  {
    return objc_msgSend(a4, "end");
  }
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

- (void)updateAfterAutoscroll:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  y = a4.y;
  x = a4.x;
  -[TSWPTextMagnifierRanged setAutoscrollDirections:](self->_magnifier, "setAutoscrollDirections:", objc_msgSend(a3, "directions"));
  v7 = -[TSWPTextKnobTracker icc](self, "icc");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSWPTextKnobTracker icc](self, "icc"), "layerHost"), "canvasView"), "convertPoint:fromView:", 0, x, y);
  objc_msgSend(v7, "convertBoundsToUnscaledPoint:");
  v9 = v8;
  v11 = v10;
  -[TSWPTextKnobTracker p_setSelectionFromPoint:](self, "p_setSelectionFromPoint:");
  -[TSWPTextMagnifierRanged postAutoscrollPoint:](self->_magnifier, "postAutoscrollPoint:", v9, v11);
}

- (id)icc
{
  return -[TSWPEditingController interactiveCanvasController](-[TSWPTextKnobTracker editingController](self, "editingController"), "interactiveCanvasController");
}

- (void)updateAfterAutoscroll:(id)a3
{
  -[TSWPTextMagnifierRanged setAutoscrollDirections:](self->_magnifier, "setAutoscrollDirections:", objc_msgSend(a3, "directions"));
}

- (void)autoscrollWillNotStart
{
  -[TSWPTextMagnifierRanged autoscrollWillNotStart](self->_magnifier, "autoscrollWillNotStart");
}

- (double)unscaledStartAutoscrollThreshold
{
  _BOOL4 v2;
  double result;

  v2 = -[TSWPEditingController isInParagraphMode](self->_editingController, "isInParagraphMode");
  result = 40.0;
  if (!v2)
    return 25.0;
  return result;
}

- (TSWPEditingController)editingController
{
  return self->_editingController;
}

- (void)setEditingController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)didShowMagnifier
{
  return self->_didShowMagnifier;
}

- (BOOL)ignoreNextCall
{
  return self->_ignoreNextCall;
}

- (void)setIgnoreNextCall:(BOOL)a3
{
  self->_ignoreNextCall = a3;
}

@end
