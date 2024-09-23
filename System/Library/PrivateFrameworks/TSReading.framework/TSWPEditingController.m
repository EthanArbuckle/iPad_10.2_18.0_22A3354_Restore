@implementation TSWPEditingController

- (TSWPSelection)selection
{
  TSWPSelection *selection;
  void *v3;
  uint64_t v4;

  selection = self->_selection;
  if (selection)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController selection]");
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 489, CFSTR("Bad selection class - returning nil."));
      return 0;
    }
  }
  return selection;
}

- (TSDTextSelection)textInputSelection
{
  return (TSDTextSelection *)self->_selection;
}

- (TSWPEditingController)initWithStorage:(id)a3 interactiveCanvasController:(id)a4
{
  char *v6;
  __int128 v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSWPEditingController;
  v6 = -[TSWPEditingController init](&v10, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 1) = a3;
    *((_QWORD *)v6 + 3) = a4;
    v7 = *MEMORY[0x24BEB3BF0];
    *(_OWORD *)(v6 + 72) = *MEMORY[0x24BEB3BF0];
    *((_QWORD *)v6 + 13) = 0x7FFFFFFFFFFFFFFFLL;
    v6[113] = 1;
    v6[360] = 0;
    *(_OWORD *)(v6 + 152) = v7;
    objc_msgSend(v6, "setShouldDisplayKeyboard:", 1);
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel_p_inputLanguageDidChangeNotification_, *MEMORY[0x24BDF7F68], 0);
    objc_msgSend(v6, "setSupportsDataDetectors:", 1);
    objc_msgSend(v6, "setSuppressPhonetics:", objc_msgSend(a3, "allowsElementKind:", 4096) ^ 1);
  }
  return (TSWPEditingController *)v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  if (self->_knobTracking)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 597, CFSTR("-dealloc called while tracking"));
  }
  if (self->_definitionPopoverController)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController dealloc]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 599, CFSTR("expected nil value for '%s'"), "_definitionPopoverController");
  }
  if ((TSUSupportsTextInteraction() & 1) == 0 && self->_definitionViewController)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController dealloc]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 602, CFSTR("expected nil value for '%s'"), "_definitionViewController");
  }

  self->_inputViewForHidingKeyboard = 0;
  self->_autoscroll = 0;

  self->_selection = 0;
  self->_suggestions = 0;

  self->_insertionStyle = 0;
  self->_storage = 0;

  self->_fidgetResolver = 0;
  self->_tapInfo = 0;

  self->_markedText = 0;
  -[TSDMultiPaneController dismissAnimated:](self->_insertBreakPopoverController, "dismissAnimated:", 0);

  self->_insertBreakPopoverController = 0;
  self->_dictationInterpretations = 0;

  self->_autocorrectedEntries = 0;
  self->_previousSelectedAnnotation = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  v9.receiver = self;
  v9.super_class = (Class)TSWPEditingController;
  -[TSWPEditingController dealloc](&v9, sel_dealloc);
}

- (void)teardown
{
  -[TSWPEditingController p_cancelDelayedSelectors](self, "p_cancelDelayedSelectors");
  self->_interactiveCanvasController = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
}

- (void)setCoalescingText:(BOOL)a3
{
  self->_coalescingText = a3;
  -[TSWPEditingController setCanCoalesceBreakingCharacters:](self, "setCanCoalesceBreakingCharacters:", 0);
}

- (void)setKnobTracking:(BOOL)a3
{
  void *v5;
  TSKFidgetResolver *v6;
  TSWPSelection *selection;
  void *v8;
  TSWPInteractiveCanvasController *interactiveCanvasController;
  double v10;
  double v11;
  double v12;
  double v13;
  TSWPInteractiveCanvasController *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[7];

  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v5 = (void *)TSUProtocolCast();
  self->_knobTracking = a3;
  if (a3)
  {
    v6 = objc_alloc_init(TSKFidgetResolver);
    self->_fidgetResolver = v6;
    -[TSKFidgetResolver setFidgetThreshold:](v6, "setFidgetThreshold:", 0.2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "knobTrackingDidBegin");
  }
  else
  {
    -[TSWPEditingController setKnobTrackingTapCount:](self, "setKnobTrackingTapCount:", 0);
    selection = self->_selection;
    if (selection && -[TSWPSelection isValid](selection, "isValid"))
    {
      if (-[TSWPEditingController isInParagraphMode](self, "isInParagraphMode"))
      {
        v8 = (void *)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasView"), "enclosingScrollView");
        interactiveCanvasController = self->_interactiveCanvasController;
        objc_msgSend(v8, "contentOffset");
        -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](interactiveCanvasController, "convertBoundsToUnscaledPoint:");
        v11 = v10;
        v13 = v12;
        v14 = self->_interactiveCanvasController;
        -[TSDInteractiveCanvasController viewScale](v14, "viewScale");
        -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](v14, "clampedUnscaledContentOffset:forViewScale:", v11, v13, v15);
        -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self->_interactiveCanvasController, "convertUnscaledToBoundsPoint:");
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __41__TSWPEditingController_setKnobTracking___block_invoke;
        v18[3] = &unk_24D82A578;
        v18[4] = v8;
        v18[5] = v16;
        v18[6] = v17;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v18, 0.25);
      }

      self->_fidgetResolver = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "knobTrackingDidEnd");
  }
}

uint64_t __41__TSWPEditingController_setKnobTracking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)model
{
  return self->_storage;
}

- (id)documentRoot
{
  return -[TSDInteractiveCanvasController documentRoot](self->_interactiveCanvasController, "documentRoot");
}

- (void)didBecomeCurrentEditor
{
  -[TSKChangeNotifier addObserver:forChangeSource:](-[TSDInteractiveCanvasController changeNotifier](self->_interactiveCanvasController, "changeNotifier"), "addObserver:forChangeSource:", self, self->_storage);
  objc_msgSend(+[TSWPEditMenuController sharedEditMenuController](TSWPEditMenuController, "sharedEditMenuController"), "setIsBeginningEditing:", 1);
  -[TSWPInteractiveCanvasController didBeginEditingText](self->_interactiveCanvasController, "didBeginEditingText");
  self->_initialStorageChangeCount = -[TSWPStorage changeCount](self->_storage, "changeCount");
}

- (void)willResignCurrentEditor
{
  -[TSWPEditingController dismissActivePopovers](self, "dismissActivePopovers");
  -[TSWPEditingController p_cancelDelayedSelectors](self, "p_cancelDelayedSelectors");
  -[TSKChangeNotifier removeObserver:forChangeSource:](-[TSDInteractiveCanvasController changeNotifier](self->_interactiveCanvasController, "changeNotifier"), "removeObserver:forChangeSource:", self, self->_storage);
  -[TSWPInteractiveCanvasController willEndEditingText](self->_interactiveCanvasController, "willEndEditingText");
}

- (void)didBecomeTextInputEditor
{

  self->_dictationInterpretations = 0;
  self->_autocorrectedEntries = 0;
}

- (id)p_containingShapeRep
{
  id v2;
  uint64_t v3;
  void *v4;

  if (!self->_storage)
    return 0;
  v2 = -[TSDInteractiveCanvasController repsForInfo:](self->_interactiveCanvasController, "repsForInfo:", -[TSWPEditingController storage](self, "storage"));
  objc_opt_class();
  objc_msgSend(v2, "anyObject");
  v3 = TSUDynamicCast();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  objc_opt_class();
  objc_msgSend(v4, "parentRep");
  return (id)TSUDynamicCast();
}

- (void)willResignTextInputEditorAndDeselect:(BOOL)a3
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (self->_storage)
  {
    v4 = a3;
    if (!-[TSWPInteractiveCanvasController isTearingDown](self->_interactiveCanvasController, "isTearingDown"))
    {
      v5 = -[TSDInteractiveCanvasController repsForInfo:](self->_interactiveCanvasController, "repsForInfo:", -[TSWPEditingController storage](self, "storage"));
      objc_opt_class();
      objc_msgSend(v5, "anyObject");
      v6 = TSUDynamicCast();
      if (v6)
      {
        v7 = (void *)v6;
        objc_opt_class();
        objc_msgSend(v7, "parentRep");
        v8 = (void *)TSUDynamicCast();
        if (v8)
          objc_msgSend(v8, "willEndEditingContainedRep");
      }
      if (v4)
        -[TSWPEditingController setSelection:](self, "setSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8)));
      if (objc_msgSend(v5, "count")
        && -[TSWPStorage wpKind](-[TSWPEditingController storage](self, "storage"), "wpKind") == 5)
      {
        objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_66);
      }
      +[TSWPEditMenuController hideEditMenu](TSWPEditMenuController, "hideEditMenu");

      self->_dictationInterpretations = 0;
      self->_autocorrectedEntries = 0;
    }
  }
  -[TSWPEditingController setCoalescingText:](self, "setCoalescingText:", 0);
  if (self->_storage)
  {
    v10 = CFSTR("TSWPEditingControllerEditor");
    v11[0] = self;
    v9 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSWPEditingControllerEditingDidEnd"), self->_storage, v9);
  }
}

uint64_t __62__TSWPEditingController_willResignTextInputEditorAndDeselect___block_invoke()
{
  void *v0;
  uint64_t result;

  objc_opt_class();
  v0 = (void *)objc_msgSend((id)TSUDynamicCast(), "parentRep");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v0, "willEndEditingContainedRep");
  return result;
}

- (void)willResignTextInputEditor
{
  -[TSWPEditingController willResignTextInputEditorAndDeselect:](self, "willResignTextInputEditorAndDeselect:", 1);
}

- (void)willEnterForeground
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[TSDInteractiveCanvasController repsForInfo:](self->_interactiveCanvasController, "repsForInfo:", -[TSWPEditingController storage](self, "storage", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "willEnterForeground");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)didEnterBackground
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TSWPEditingController protectedStopMagnification](self, "protectedStopMagnification");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[TSDInteractiveCanvasController repsForInfo:](self->_interactiveCanvasController, "repsForInfo:", -[TSWPEditingController storage](self, "storage", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "didEnterBackground");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)cancelKnobTrackingAndMagnifying
{
  -[TSWPEditingController p_cancelDelayedSelectors](self, "p_cancelDelayedSelectors");
  if (self->_knobTracker)
  {
    self->_readyToEnd = 1;
    -[TSDDynamicOperationController handleTrackerManipulator:](-[TSDInteractiveCanvasController dynamicOperationController](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "dynamicOperationController"), "handleTrackerManipulator:", self);

    self->_knobTracker = 0;
  }
  else
  {
    -[TSWPEditingController protectedStopMagnification](self, "protectedStopMagnification");
  }
}

- (id)editingReps
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  objc_opt_class();
  -[TSDInteractiveCanvasController repForInfo:](self->_interactiveCanvasController, "repForInfo:", -[TSWPEditingController storage](self, "storage"));
  v4 = TSUDynamicCast();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  return v3;
}

- (id)p_editingRepForCharIndex:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = -[TSWPEditingController editingReps](self, "editingReps", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
    goto LABEL_16;
  v6 = v5;
  v7 = *(_QWORD *)v18;
  v8 = a3 ? a3 - 1 : 0;
LABEL_5:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v7)
      objc_enumerationMutation(v4);
    v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
    v11 = objc_msgSend(v10, "range");
    if (v8 >= v11 && v8 - v11 < v12)
      break;
    if (v6 == ++v9)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        goto LABEL_5;
      break;
    }
  }
  if (!v10)
  {
LABEL_16:
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_editingRepForCharIndex:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 1270, CFSTR("No valid rep for given char index"));
    return 0;
  }
  return v10;
}

- (void)p_suppressSelectionHighlight:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[TSWPEditingController editingReps](self, "editingReps", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSelectionHighlightSuppressed") != v3)
        {
          objc_msgSend(v9, "setSuppressSelectionHighlight:", v3);
          objc_msgSend(v9, "invalidateKnobs");
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (CGRect)p_targetRectForSelection:(id)a3
{
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  TSWPInteractiveCanvasController *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect result;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v74 = *MEMORY[0x24BDAC8D0];
  v5 = (double *)MEMORY[0x24BDBF070];
  v6 = *MEMORY[0x24BDBF070];
  v7 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v10 = -[TSWPEditingController editingReps](self, "editingReps");
  if (v10)
  {
    v11 = v10;
    v63 = v9;
    v64 = v8;
    v65 = v7;
    v66 = v6;
    v12 = *v5;
    v13 = v5[1];
    v14 = v5[2];
    v15 = v5[3];
    v16 = -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
    -[TSDInteractiveCanvasController visibleBoundsRectClippedToWindow](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "visibleBoundsRectClippedToWindow");
    -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](v16, "convertBoundsToUnscaledRect:");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = objc_msgSend(a3, "isInsertionPoint");
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v70;
      v67 = v24;
      v29 = v18;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v70 != v28)
            objc_enumerationMutation(v11);
          v31 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v30);
          v68.size.width = v14;
          v68.size.height = v15;
          v68.origin.x = v12;
          v68.origin.y = v13;
          if (v25)
            objc_msgSend(v31, "caretRectForSelection:", a3);
          else
            objc_msgSend(v31, "rectForSelection:", a3);
          objc_msgSend(v31, "convertNaturalRectToUnscaledCanvas:");
          v33 = v32;
          v35 = v34;
          v37 = v36;
          v39 = v38;
          v40 = objc_msgSend(v31, "parentRep");
          v41 = v29;
          v42 = v20;
          v43 = v22;
          v44 = v67;
          if (v40)
          {
            v45 = (void *)objc_msgSend(v31, "parentRep", v29, v20, v22, v67);
            objc_msgSend((id)objc_msgSend(v31, "parentRep"), "clipRect");
            objc_msgSend(v45, "convertNaturalRectToUnscaledCanvas:");
            v82.origin.x = v46;
            v82.origin.y = v47;
            v82.size.width = v48;
            v82.size.height = v49;
            v75.origin.x = v29;
            v75.origin.y = v20;
            v75.size.width = v22;
            v75.size.height = v67;
            *(CGRect *)&v41 = CGRectIntersection(v75, v82);
          }
          v83.origin.x = v33;
          v83.origin.y = v35;
          v83.size.width = v37;
          v83.size.height = v39;
          v76 = CGRectIntersection(*(CGRect *)&v41, v83);
          x = v76.origin.x;
          y = v76.origin.y;
          width = v76.size.width;
          height = v76.size.height;
          if (CGRectGetHeight(v76) == 0.0
            && (v77.origin.x = x,
                v77.origin.y = y,
                v77.size.width = width,
                v77.size.height = height,
                CGRectGetWidth(v77) == 0.0))
          {
            v12 = v68.origin.x;
            v13 = v68.origin.y;
            v14 = v68.size.width;
            v15 = v68.size.height;
          }
          else
          {
            v84.origin.x = x;
            v84.origin.y = y;
            v84.size.width = width;
            v84.size.height = height;
            v78 = CGRectUnion(v68, v84);
            v12 = v78.origin.x;
            v13 = v78.origin.y;
            v14 = v78.size.width;
            v15 = v78.size.height;
          }
          ++v30;
        }
        while (v27 != v30);
        v54 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
        v27 = v54;
      }
      while (v54);
    }
    v79.origin.x = v12;
    v79.origin.y = v13;
    v79.size.width = v14;
    v79.size.height = v15;
    v7 = v65;
    v6 = v66;
    v9 = v63;
    v8 = v64;
    if (CGRectGetHeight(v79) != 0.0
      || (v80.origin.x = v12, v80.origin.y = v13,
                              v80.size.width = v14,
                              v80.size.height = v15,
                              CGRectGetWidth(v80) != 0.0))
    {
      -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v12, v13, v14, v15);
      v6 = v55;
      v7 = v56;
      v8 = v57;
      v9 = v58;
    }
  }
  v59 = v6;
  v60 = v7;
  v61 = v8;
  v62 = v9;
  result.size.height = v62;
  result.size.width = v61;
  result.origin.y = v60;
  result.origin.x = v59;
  return result;
}

- (BOOL)shouldShowEditMenu
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  TSWPSelection *v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  char v11;

  if ((TSUSupportsTextInteraction() & 1) != 0 || self->_suppressEditMenu)
    goto LABEL_3;
  if (-[TSKDocumentRoot isFindActive](-[TSDInteractiveCanvasController documentRoot](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "isFindActive")|| -[TSDInteractiveCanvasController textGesturesInFlight](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "textGesturesInFlight")|| -[TSDInteractiveCanvasController currentlyScrolling](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling")|| -[TSDInteractiveCanvasController animatingViewScale](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "animatingViewScale")|| self->_magnifying|| -[TSWPEditingController isSelectionSingleAnchoredDrawableAttachment](self, "isSelectionSingleAnchoredDrawableAttachment"))
  {
    v4 = 0;
  }
  else
  {
    v4 = !-[TSDInteractiveCanvasController inReadMode](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "inReadMode");
  }
  if ((TSUSupportsTextInteraction() & 1) != 0)
  {
    if (!v4)
      goto LABEL_3;
  }
  else if (!v4 || self->_definitionViewController)
  {
    goto LABEL_3;
  }
  if (self->_definitionPopoverController
    || (-[TSWPDismissBlockPopover isVisible](self->_rubyTextViewController, "isVisible") & 1) != 0
    || (objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "isDisplayingHyperlinkUI") & 1) != 0)
  {
    goto LABEL_3;
  }
  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v5 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v5, "editorAllowsEditMenu");
    if (!v3)
      return v3;
  }
  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v6 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v6, "allowEditMenuToAppear");
    if (!v3)
      return v3;
  }
  if (+[TSKPopoverController anyPopoversVisible](TSKPopoverController, "anyPopoversVisible")
    || -[TSDInteractiveCanvasController inspectorModeEnabled](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "inspectorModeEnabled")|| self->_markedRange.length|| self->_knobTracking)
  {
LABEL_3:
    LOBYTE(v3) = 0;
    return v3;
  }
  v7 = -[TSWPEditingController selection](self, "selection");
  if (-[TSWPSelection isValid](v7, "isValid") && -[TSWPSelection type](v7, "type") != 2)
  {
    -[TSWPSelection range](v7, "range");
    v8 = v9 != 0;
  }
  else
  {
    v8 = 0;
  }
  v10 = -[TSWPStorage wpKind](-[TSWPEditingController storage](self, "storage"), "wpKind") == 1
     && -[TSWPStorage length](-[TSWPEditingController storage](self, "storage"), "length") == 0;
  v11 = self->_shouldShowEditMenuForInsertionPoint || v8;
  LOBYTE(v3) = 1;
  if ((v11 & 1) == 0 && !v10)
    LOBYTE(v3) = self->_showNextEditMenu;
  return v3;
}

- (BOOL)editorCanHideEditMenu
{
  return TSUSupportsTextInteraction() ^ 1;
}

- (BOOL)wantsDoneButtonWhenEditing
{
  return 1;
}

- (void)dismissActivePopovers
{
  TSDMultiPaneController *insertBreakPopoverController;
  TSDMultiPaneController *v4;

  -[TSWPEditingController p_dismissDefinitionPopover](self, "p_dismissDefinitionPopover");
  insertBreakPopoverController = self->_insertBreakPopoverController;
  if (insertBreakPopoverController)
  {
    -[TSDMultiPaneController dismissAnimated:](insertBreakPopoverController, "dismissAnimated:", 1);
    v4 = self->_insertBreakPopoverController;
    self->_insertBreakPopoverController = 0;
  }
}

- (void)p_clearEditMenuFlags
{
  *(_WORD *)&self->_shouldShowEditMenuForInsertionPoint = 0;
}

- (BOOL)isSelectionSingleAnchoredDrawableAttachment
{
  TSWPSelection *v3;
  uint64_t v4;

  v3 = -[TSWPEditingController selection](self, "selection");
  if (!-[TSWPSelection isRange](v3, "isRange"))
    return 0;
  -[TSWPSelection range](v3, "range");
  if (v4 != 1)
    return 0;
  objc_opt_class();
  -[TSWPStorage attachmentAtCharIndex:](-[TSWPEditingController storage](self, "storage"), "attachmentAtCharIndex:", -[TSWPSelection range](v3, "range"));
  return objc_msgSend((id)TSUDynamicCast(), "isAnchored");
}

- (void)p_rescheduleDelayedUpdateHUDState
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_updateHUDState, 0);
  -[TSWPEditingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_updateHUDState, 0, 0.1);
}

- (void)p_updateHUDState
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  TSWPSelection *v13;
  TSWPStorage *storage;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(-[TSWPEditingController editingReps](self, "editingReps"), "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = -[TSWPEditingController editingReps](self, "editingReps", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7), "layout"), "layoutIsValid"))goto LABEL_11;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v5)
            goto LABEL_4;
          break;
        }
      }
    }
    if (+[TSWPEditMenuController isAnimating](TSWPEditMenuController, "isAnimating"))
    {
LABEL_11:
      -[TSWPEditingController p_rescheduleDelayedUpdateHUDState](self, "p_rescheduleDelayedUpdateHUDState");
      return;
    }
    if (-[TSWPEditingController shouldShowEditMenu](self, "shouldShowEditMenu")
      && (-[TSWPEditingController p_targetRectForSelection:](self, "p_targetRectForSelection:", -[TSWPEditingController selection](self, "selection")), x = v23.origin.x, y = v23.origin.y, width = v23.size.width, height = v23.size.height, !CGRectIsNull(v23)))
    {
      +[TSWPEditMenuController showEditMenuAtTargetRect:canCenterHUD:interactiveCanvasController:](TSWPEditMenuController, "showEditMenuAtTargetRect:canCenterHUD:interactiveCanvasController:", -[TSWPEditingController canCenterHUD](self, "canCenterHUD"), -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), x, y, width, height);
      self->_editMenuIsVisible = 1;
    }
    else if (-[TSWPEditingController editorCanHideEditMenu](self, "editorCanHideEditMenu"))
    {
      -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
      v12 = (void *)TSUProtocolCast();
      v13 = -[TSWPEditingController selection](self, "selection");
      +[TSWPEditMenuController hideEditMenu](TSWPEditMenuController, "hideEditMenu");
      self->_editMenuIsVisible = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        storage = self->_storage;
        v15 = -[TSWPSelection range](v13, "range");
        objc_msgSend(v12, "showCustomEditMenuForStorage:range:", storage, v15, v16);
      }
    }
  }
}

- (BOOL)canCenterHUD
{
  return 1;
}

- (void)p_cancelDelayedSelectors
{
  -[TSWPEditingController p_cancelTapAndLongPressPreviousSelector](self, "p_cancelTapAndLongPressPreviousSelector");
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)updateHUDState
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2178E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "This call is a no-op for clients that use UITextInteraction.", v0, 2u);
}

- (id)topLevelInspectorAutosaveName
{
  return CFSTR("TSWPTextInspectorLastSelectedPane");
}

- (_NSRange)editRange
{
  TSWPStorage *storage;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  _NSRange result;

  if (!TSUSupportsTextInteraction())
  {
    if (-[TSWPSelection isValid](self->_selection, "isValid"))
    {
      v6 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:", -[TSWPSelection start](self->_selection, "start"));
      v8 = v7;
      v9 = -[TSWPSelection range](self->_selection, "range");
      if (v6 > v9 || v6 + v8 < v9 + v10)
      {
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController editRange]");
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 1906, CFSTR("Bad range from selectionRangeForCharIndex."));
      }
      goto LABEL_11;
    }
LABEL_10:
    v6 = 0;
    v8 = 0;
LABEL_11:
    v4 = v6;
    v5 = v8;
    goto LABEL_12;
  }
  storage = self->_storage;
  if (!storage)
    goto LABEL_10;
  v4 = -[TSWPStorage range](storage, "range");
LABEL_12:
  result.length = v5;
  result.location = v4;
  return result;
}

- (double)p_effectiveFontSizeForCurrentSelection
{
  _BOOL4 v3;
  double result;
  uint64_t v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v3 = -[TSWPSelection isValid](self->_selection, "isValid");
  result = 0.0;
  if (v3)
  {
    v5 = -[TSWPSelection range](self->_selection, "range", 0.0, self->_insertionStyle);
    v6[1] = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self->_storage, "characterStyleAtCharIndex:effectiveRange:", v5 - ((v5 != 0) & ~-[TSWPSelection isRange](self->_selection, "isRange")), 0);
    v6[2] = objc_msgSend(-[TSWPEditingController styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", -[TSWPSelection range](self->_selection, "range")), 0);
    TSWPResolveFloatPropertyForStyles(v6, 3uLL, 17);
  }
  return result;
}

- (double)viewScaleForSelectionWithTargetPointSize:(double)a3
{
  double v4;
  double v5;
  BOOL v6;
  double result;

  -[TSWPEditingController p_effectiveFontSizeForCurrentSelection](self, "p_effectiveFontSizeForCurrentSelection");
  v5 = a3 / v4;
  v6 = v4 <= 0.0;
  result = 0.0;
  if (!v6)
    return v5;
  return result;
}

- (double)targetPointSizeForSelectionWithViewScale:(double)a3
{
  double v4;

  -[TSWPEditingController p_effectiveFontSizeForCurrentSelection](self, "p_effectiveFontSizeForCurrentSelection");
  return v4 * a3;
}

- (void)p_highlightRubyTextWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  length = a3.length;
  location = a3.location;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[TSWPEditingController editingReps](self, "editingReps", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setSecondaryHighlightRange:color:pathStyle:", location, length, objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.200000003), "CGColor"), 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)p_clearSecondaryHighlight
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[TSWPEditingController editingReps](self, "editingReps", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "clearSecondaryHighlight");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (id)p_wordRangesForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  const __CFString *v7;
  const __CFLocale *v8;
  _QWORD v10[5];
  CFRange v11;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = -[TSWPStorage string](self->_storage, "string");
  v8 = (const __CFLocale *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__TSWPEditingController_p_wordRangesForRange___block_invoke;
  v10[3] = &unk_24D82D808;
  v10[4] = v6;
  v11.location = location;
  v11.length = length;
  TSWPEnumerateWordsInStringWithBlock(v7, v11, v8, (uint64_t)v10);
  return v6;
}

uint64_t __46__TSWPEditingController_p_wordRangesForRange___block_invoke(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  void *v2;
  void *v3;
  CFRange CurrentTokenRange;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1968];
  CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer);
  return objc_msgSend(v2, "addObject:", objc_msgSend(v3, "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length));
}

- (id)p_viewControllerForPresenting
{
  void *v2;

  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v2 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(v2, "viewControllerForPresenting");
  else
    return 0;
}

- (CGRect)p_adjustedPopoverTargetRectForRange:(_NSRange)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect result;

  -[TSWPEditingController p_targetRectForSelection:](self, "p_targetRectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3.location, a3.length));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasView");
  v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "window"), "rootViewController"), "view");
  objc_msgSend(v12, "convertRect:toView:", v13, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v13, "bounds");
  v23 = v22;
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.width = v19;
  v30.size.height = v21;
  v24 = v23 - CGRectGetMaxX(v30);
  if (v15 >= v24)
  {
    if (v15 < 350.0)
    {
      v25 = 350.0 - v15;
      v15 = v15 + 350.0 - v15;
      goto LABEL_6;
    }
  }
  else if (v24 < 350.0)
  {
    v25 = 350.0 - v24;
LABEL_6:
    v19 = v19 - v25;
  }
  objc_msgSend(v12, "convertRect:fromView:", v13, v15, v17, v19, v21);
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (id)p_documentViewController
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(-[TSWPEditingController documentRoot](self, "documentRoot"), "viewController");
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_documentViewController]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 2146, CFSTR("invalid nil value for '%s'"), "dvc");
  }
  return v2;
}

- (BOOL)isUnscaledPointInTextSelection:(CGPoint)a3
{
  double y;
  double x;
  TSWPSelection *v6;
  void *v7;
  int v8;

  y = a3.y;
  x = a3.x;
  v6 = -[TSWPEditingController selection](self, "selection");
  objc_opt_class();
  -[TSDInteractiveCanvasController hitRep:](self->_interactiveCanvasController, "hitRep:", x, y);
  v7 = (void *)TSUDynamicCast();
  v8 = objc_msgSend(v7, "canEditWithEditor:", self);
  if (!-[TSWPSelection isValid](v6, "isValid") || !v8)
    return 0;
  objc_msgSend(v7, "convertNaturalPointFromUnscaledCanvas:", x, y);
  return objc_msgSend(v7, "isPointInSelectedArea:");
}

- (BOOL)p_respondsToListGestures
{
  void *v2;

  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v2 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "editorAllowsListInteraction");
  else
    return 1;
}

- (BOOL)p_respondsToHyperlinkGestures
{
  void *v2;

  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v2 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "editorAllowsHyperlinkInteraction");
  else
    return 1;
}

- (BOOL)p_respondsToRubyGestures
{
  void *v2;

  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v2 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "editorAllowsRubyInteraction");
  else
    return 1;
}

- (id)p_repForSwipeAtUnscaledLocation:(CGPoint)a3
{
  double y;
  double x;
  TSWPInteractiveCanvasController *v6;
  TSWPSelection *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  TSWPStorage *v20;
  uint64_t v21;
  CGFloat v25;
  CGFloat v26;
  CGFloat width;
  CGFloat height;
  CGFloat v29;
  CGFloat v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGPoint v38;
  CGRect v39;
  CGRect v40;

  y = a3.y;
  x = a3.x;
  v37 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
  v7 = -[TSWPEditingController selection](self, "selection");
  -[TSDInteractiveCanvasController convertBoundsToUnscaledSize:](v6, "convertBoundsToUnscaledSize:", 50.0, 50.0);
  v9 = v8;
  v11 = v10;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = -[TSDInteractiveCanvasController hitRepsAtPoint:withSlop:](v6, "hitRepsAtPoint:withSlop:", x, y, v8, v10, 0);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v13)
    return 0;
  v14 = v13;
  v15 = *(_QWORD *)v33;
  v16 = -v9;
  v17 = -v11;
LABEL_3:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v33 != v15)
      objc_enumerationMutation(v12);
    v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[TSWPEditingController storage](self, "storage");
      if (v20 == (TSWPStorage *)objc_msgSend(v19, "storage"))
      {
        if (-[TSWPSelection isInsertionPoint](v7, "isInsertionPoint"))
          objc_msgSend(v19, "caretRect");
        else
          objc_msgSend(v19, "rectForSelection:", v7);
        v39 = CGRectInset(*(CGRect *)&v21, v16, v17);
        v25 = v39.origin.x;
        v26 = v39.origin.y;
        width = v39.size.width;
        height = v39.size.height;
        objc_msgSend(v19, "convertNaturalPointFromUnscaledCanvas:", x, y);
        v38.x = v29;
        v38.y = v30;
        v40.origin.x = v25;
        v40.origin.y = v26;
        v40.size.width = width;
        v40.size.height = height;
        if (CGRectContainsPoint(v40, v38))
          return v19;
      }
    }
    if (v14 == ++v18)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v14)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)canHandleSwipeGestureForGestureRecognizer:(id)a3 outDelta:(int64_t *)a4 outTextDirection:(int64_t *)a5 outLayoutDirection:(int64_t *)a6
{
  int v11;
  _BOOL4 v12;
  int64_t v13;
  _BOOL4 v14;
  int64_t v15;

  v11 = objc_msgSend(a3, "direction");
  v12 = -[TSWPEditingController textIsVerticalAtCharIndex:](self, "textIsVerticalAtCharIndex:", 0);
  if (v12)
  {
    if (a5)
    {
      v13 = 3;
      if (v11 != 4)
        v13 = 0;
      if (v11 == 8)
        v13 = 2;
      *a5 = v13;
    }
    if (a6)
      *a6 = v11 == 4;
    v14 = v11 == 4;
    if (v11 == 8)
      goto LABEL_22;
  }
  else
  {
    if (a5)
    {
      v15 = 3;
      if (v11 != 2)
        v15 = 0;
      if (v11 == 1)
        v15 = 2;
      *a5 = v15;
    }
    if (a6)
      *a6 = v11 == 2;
    v14 = v11 == 2;
    if (v11 == 1)
      goto LABEL_22;
  }
  if (!v14)
    return 0;
LABEL_22:
  if ((__CFString *)objc_msgSend(a3, "gestureKind") == CFSTR("TSWPOneFingerSwipe")
    && (v12 | !-[TSWPEditingController swipeableParagraphIsSelected](self, "swipeableParagraphIsSelected")) != 1
    || -[TSWPEditingController isInParagraphMode](self, "isInParagraphMode"))
  {
    return 0;
  }
  if (a4)
    *a4 = 0;
  return 1;
}

- (BOOL)swipeableParagraphIsSelected
{
  _BOOL4 v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  BOOL v9;

  v3 = -[TSWPSelection isValid](self->_selection, "isValid");
  if (v3)
  {
    v3 = -[TSWPEditingController p_respondsToListGestures](self, "p_respondsToListGestures");
    if (v3)
    {
      v4 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", -[TSWPSelection range](self->_selection, "range"));
      v6 = v5;
      v7 = -[TSWPStorage paragraphHasListLabelAtCharIndex:](self->_storage, "paragraphHasListLabelAtCharIndex:", -[TSWPSelection range](self->_selection, "range"));
      LOBYTE(v3) = -[TSWPSelection isInsertionPoint](self->_selection, "isInsertionPoint") && v6 <= 1 && v7
                || -[TSWPSelection type](self->_selection, "type") == 2
                || -[TSWPSelection range](self->_selection, "range") == v4
                && ((-[TSWPSelection range](self->_selection, "range"), v8 == v6) ? (v9 = v7) : (v9 = 0), v9)
                || -[TSWPEditingController isInParagraphMode](self, "isInParagraphMode");
    }
  }
  return v3;
}

- (BOOL)canHandleGesture:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v21;

  objc_opt_class();
  v5 = TSUDynamicCast();
  objc_msgSend(a3, "unscaledLocationForICC:", -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = v6;
  v9 = v8;
  objc_opt_class();
  -[TSDInteractiveCanvasController hitRep:](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v7, v9);
  v10 = (void *)TSUDynamicCast();
  v11 = objc_msgSend(v10, "canEditWithEditor:", self);
  v21 = 0;
  v12 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->_interactiveCanvasController, "hitKnobAtPoint:returningRep:", &v21, v7, v9);
  objc_opt_class();
  v13 = (void *)TSUDynamicCast();
  v14 = objc_msgSend(v12, "tag") == 11 || objc_msgSend(v12, "tag") == 10;
  v15 = 0;
  if (v12 && v13)
    v15 = (TSWPStorage *)objc_msgSend(v13, "storage") == self->_storage && v14;
  if (v13)
    v11 &= v14;
  v16 = (__CFString *)objc_msgSend(a3, "gestureKind");
  v17 = v16;
  if ((v16 == CFSTR("TSWPOneFingerSwipe") || v16 == CFSTR("TSWPTwoFingerSwipe") || v16 == CFSTR("TSWPThreeFingerSwipe"))
    && -[TSWPSelection isValid](self->_selection, "isValid"))
  {
    v15 = -[TSWPEditingController canHandleSwipeGestureForGestureRecognizer:outDelta:outTextDirection:outLayoutDirection:](self, "canHandleSwipeGestureForGestureRecognizer:outDelta:outTextDirection:outLayoutDirection:", v5, 0, 0, 0);
    goto LABEL_28;
  }
  if (v17 == CFSTR("TSWPLongPress") && !v12)
  {
LABEL_18:
    v15 = v11;
    goto LABEL_28;
  }
  if (v17 != CFSTR("TSWPImmediatePress") || self->_ignoreFutureImmediatePresses)
  {
    if (v17 != CFSTR("TSWPImmediateSingleTap")
      && v17 != CFSTR("TSWPTwoFingerTap")
      && v17 != CFSTR("TSWPSecondarySingleTap")
      && v17 != CFSTR("TSWPImmediateDoubleTap")
      && v17 != CFSTR("TSWPTapAndTouch")
      && v17 != CFSTR("TSWPDoubleTapAndTouch"))
    {
      v15 = 2 * (v17 != CFSTR("TSWPUndefinedGestureKind"));
      goto LABEL_28;
    }
    goto LABEL_18;
  }
LABEL_28:
  if (v10 && v15)
  {
    objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v7, v9);
    v18 = objc_msgSend(v10, "footnoteReferenceAttachmentAtPoint:");
    if (v17 == CFSTR("TSWPTapAndTouch") && v18 != 0)
      v15 = 0;
  }
  return v15 == 1;
}

- (void)p_handleSwipeMoveCaretWithTextGranularity:(int64_t)a3 textDirection:(int64_t)a4 layoutDirection:(int64_t)a5
{
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _BOOL8 v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  TSWPSelection *v26;

  if (!-[TSWPSelection isValid](self->_selection, "isValid"))
    return;
  v9 = -[TSWPEditingController insertionPoint](self, "insertionPoint");
  if (-[TSWPSelection isRange](self->_selection, "isRange"))
  {
    if (a5)
    {
      if (!a3)
        ++v9;
    }
    else
    {
      v10 = -[TSWPSelection range](self->_selection, "range");
      v9 = ((__PAIR128__(v11, a3) - 1) >> 64) + v10;
    }
  }
  v12 = -[TSWPSelection caretAffinity](self->_selection, "caretAffinity") == 1;
  LODWORD(v13) = 2143289344;
  v14 = -[TSWPEditingController charIndexByMovingPosition:toBoundary:inDirection:preferPosition:](self, "charIndexByMovingPosition:toBoundary:inDirection:preferPosition:", +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v9, v12, 0, v13), a3, a4, 0);
  if (a3 == 1)
  {
    v15 = -[TSWPEditingController rangeOfWordEnclosingCharIndex:backward:](self, "rangeOfWordEnclosingCharIndex:backward:", v9, a5 == 0);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4 == 3)
      {
        if (v9 != v15)
          goto LABEL_16;
      }
      else if (a4 != 2 || v9 != v15 + v16)
      {
        goto LABEL_16;
      }
      v17 = -[TSWPSelection caretAffinity](self->_selection, "caretAffinity") == 1;
      LODWORD(v18) = 2143289344;
      v14 = -[TSWPEditingController charIndexByMovingPosition:toBoundary:inDirection:preferPosition:](self, "charIndexByMovingPosition:toBoundary:inDirection:preferPosition:", +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v14, v17, 0, v18), 1, a4, 0);
    }
  }
LABEL_16:
  v19 = -[TSWPStorage range](self->_storage, "range");
  if (v14 <= v19 + v20 && v14 >= -[TSWPStorage range](self->_storage, "range")
    || (v21 = -[TSWPStorage range](self->_storage, "range"), v9 <= v21 + v22)
    && (v14 = v9, v9 >= -[TSWPStorage range](self->_storage, "range")))
  {
    if (v14 != -[TSWPSelection range](self->_selection, "range") || v25)
    {
      v26 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, v14, 0, 0, a4 == 2);
      -[TSDInteractiveCanvasController setSelection:onModel:withFlags:](self->_interactiveCanvasController, "setSelection:onModel:withFlags:", v26, self->_storage, 80);

    }
  }
  else
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_handleSwipeMoveCaretWithTextGranularity:textDirection:layoutDirection:]");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 2939, CFSTR("Swipe gesture tried to set invalid insertion point"));
  }
}

- (void)p_handleLongPressGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  TSWPTextKnobTracker *knobTracker;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  TSDInteractiveCanvasController *v25;
  double v26;
  CGFloat v27;
  TSWPSelection *v28;
  int v29;
  void *v30;

  objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), "view"));
  v6 = v5;
  v8 = v7;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:");
  v10 = v9;
  v12 = v11;
  v30 = 0;
  v13 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->_interactiveCanvasController, "hitKnobAtPoint:returningRep:", &v30);
  v14 = objc_msgSend(a3, "state");
  if ((unint64_t)(v14 - 3) < 2)
  {
    objc_opt_class();
    objc_msgSend(a3, "targetRep");
    v17 = (void *)TSUDynamicCast();
    if (v17)
      objc_msgSend(v17, "setShouldHideSelectionControls:", 0);
    v18 = (void *)objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "target");
    if (v18)
      objc_msgSend(v18, "setShouldHideSelectionControls:", 0);
    knobTracker = self->_knobTracker;
    if (knobTracker)
    {
      if (!-[TSWPTextKnobTracker didShowMagnifier](knobTracker, "didShowMagnifier")
        && !-[TSWPEditingController isInParagraphMode](self, "isInParagraphMode"))
      {
        -[TSWPEditingController tappedOnKnob:](self, "tappedOnKnob:", v13);
      }
      -[TSWPEditingController p_handleKnobDragGestureRecognizer:](self, "p_handleKnobDragGestureRecognizer:", a3);

      self->_knobTracker = 0;
    }
    else
    {
      -[TSWPEditingController p_endAutoscroll](self, "p_endAutoscroll");
      -[TSWPEditingController revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold](self, "revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold");
      -[TSWPEditingController protectedStopMagnification](self, "protectedStopMagnification");
      if (objc_msgSend(a3, "state") == 3)
      {
        self->_shouldShowEditMenuForInsertionPoint = 1;
        objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "becomeFirstResponder");
      }
    }
  }
  else if (v14 == 2)
  {
    if (self->_knobTracker)
    {
LABEL_25:
      -[TSWPEditingController p_handleKnobDragGestureRecognizer:](self, "p_handleKnobDragGestureRecognizer:", a3);
      return;
    }
    if (-[TSWPSelection type](self->_selection, "type") != 2)
    {
      if (objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasView"), "enclosingScrollView"), "isScrollEnabled"))+[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self, v10, v12);
      -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", self->_initialPressTextSelectionGranularity, 0, v10, v12);
    }
  }
  else
  {
    if (v14 != 1)
      return;
    -[TSWPEditingController p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
    objc_opt_class();
    objc_msgSend(a3, "targetRep");
    v15 = (void *)TSUDynamicCast();
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "setShouldHideSelectionControls:", 1);
    }
    else
    {
      objc_opt_class();
      -[TSDInteractiveCanvasController hitRep:](self->_interactiveCanvasController, "hitRep:", v10, v12);
      v16 = (void *)TSUDynamicCast();
    }
    objc_msgSend(v16, "convertNaturalPointFromUnscaledCanvas:", v10, v12);
    if (v13)
    {
      v20 = v30;
      objc_msgSend(v13, "position");
      objc_msgSend(v20, "convertNaturalPointToUnscaledCanvas:");
      v22 = v21;
      v24 = v23;
      v25 = -[TSWPEditingController icc](self, "icc");
      objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController icc](self, "icc"), "layerHost"), "asiOSCVC"), "view"));
      -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v25, "convertBoundsToUnscaledPoint:");
      self->_knobToTouchOffset.x = TSDSubtractPoints(v22, v24, v26);
      self->_knobToTouchOffset.y = v27;
      objc_opt_class();
      -[TSWPEditingController p_createKnobTracker:forRep:tapCount:](self, "p_createKnobTracker:forRep:tapCount:", v13, TSUDynamicCast(), 1);
      -[TSWPEditingController p_beginOperationAndTakeControl](self, "p_beginOperationAndTakeControl");
      goto LABEL_25;
    }
    -[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v16, 2, 1, 0);
    self->_initialPressTextSelectionGranularity = 1;
    v28 = -[TSWPEditingController selection](self, "selection");
    v29 = -[TSWPSelection type](v28, "type");
    if (!-[TSWPEditingController pIsSelectionPlaceHolderTextWithSelection:](self, "pIsSelectionPlaceHolderTextWithSelection:", v28)&& v29 != 2)
    {
      -[TSWPEditingController p_beginMagnification:forRep:atPoint:](self, "p_beginMagnification:forRep:atPoint:", v28, v16, v6, v8);
    }
  }
}

- (CGPoint)p_clampPointToLine:(CGPoint)a3 trackingRep:(id)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CGPoint result;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:");
  objc_msgSend(a4, "pinToNaturalBounds:andLastLineFragment:", 1);
  if (a4)
  {
    objc_msgSend(a4, "lineMetricsAtPoint:");
    v8 = 0;
    v7 = 0;
    v10 = 0;
    v9 = 0;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v7 = 0;
  }
  if (!CGRectIsEmpty(*(CGRect *)&v7))
  {
    objc_msgSend(a4, "convertNaturalRectToUnscaledCanvas:", (unsigned __int128)0, (unsigned __int128)0);
    y = CGRectGetMidY(v14);
  }
  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)p_handleTapAndTouchGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSDictionary *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  self->_ignoreFutureImmediatePresses = 1;
  objc_msgSend(a3, "unscaledLocationForICC:", -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = v5;
  v8 = v7;
  objc_opt_class();
  objc_msgSend(a3, "targetRep");
  v9 = (void *)TSUDynamicCast();
  if (!v9)
  {
    objc_opt_class();
    -[TSDInteractiveCanvasController hitRep:](self->_interactiveCanvasController, "hitRep:", v6, v8);
    v9 = (void *)TSUDynamicCast();
  }
  v10 = v9;
  objc_msgSend(v9, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(a3, "numberOfTapsRequired");
  if (!v10
    || (v16 = v15, -[TSWPSelection type](self->_selection, "type") == 3)
    || -[TSWPSelection type](self->_selection, "type") == 5)
  {
    -[TSWPEditingController p_endAutoscroll](self, "p_endAutoscroll");
    -[TSWPEditingController p_cancelTapAndLongPressPreviousSelector](self, "p_cancelTapAndLongPressPreviousSelector");
    if (objc_msgSend(a3, "gestureState") == 3 || objc_msgSend(a3, "gestureState") == 4)
    {
      if (self->_knobTracker)
      {
        objc_opt_class();
        v17 = TSUDynamicCast();
        if (!v17)
        {
          v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_handleTapAndTouchGesture:]");
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3427, CFSTR("invalid nil value for '%s'"), "gr");
        }
        -[TSWPEditingController p_handleKnobDragGestureRecognizer:](self, "p_handleKnobDragGestureRecognizer:", v17);

        self->_knobTracker = 0;
      }
      else if (self->_magnifying)
      {
        -[TSWPEditingController protectedStopMagnification](self, "protectedStopMagnification");
      }
    }
    else if (self->_magnifying)
    {
      if (objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasView"), "enclosingScrollView"), "isScrollEnabled"))+[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self, v6, v8);
      -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", self->_initialPressTextSelectionGranularity, 0, v6, v8);
    }
    return;
  }
  v20 = v16 + 1;
  if (objc_msgSend(a3, "gestureState") == 1)
  {
    -[TSWPEditingController p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
    if (!-[TSWPInteractiveCanvasController suppressDoubleTapForSelection](self->_interactiveCanvasController, "suppressDoubleTapForSelection"))-[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v10, v20, 1, 0, v12, v14);
    -[TSWPEditingController p_cancelTapAndLongPressPreviousSelector](self, "p_cancelTapAndLongPressPreviousSelector");
    v39[0] = CFSTR("TSWPEditingControllerTextRepKey");
    v39[1] = CFSTR("TSWPEditingControllerRepPointKey");
    v40[0] = v10;
    v40[1] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v12, v14);
    v21 = (NSDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    self->_tapInfo = v21;
    self->_tapAndLongPressIsPossible = 1;
    -[TSWPEditingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_beginTapAndLongPress_, v21, 0.2);
    return;
  }
  if (objc_msgSend(a3, "gestureState") == 2)
  {
    if (-[TSWPSelection type](self->_selection, "type") == 2)
      return;
    objc_msgSend(-[NSDictionary objectForKey:](self->_tapInfo, "objectForKey:", CFSTR("TSWPEditingControllerRepPointKey")), "CGPointValue");
    v23 = v22;
    v25 = v24;
    if (-[TSWPInteractiveCanvasController suppressDoubleTapForSelection](self->_interactiveCanvasController, "suppressDoubleTapForSelection"))
    {
      v26 = TSDDistance(v23, v25, v12, v14) <= 5.0;
    }
    else
    {
      v26 = 0;
    }
    if (self->_tapAndLongPressIsPossible && !v26)
    {
      -[TSWPEditingController p_cancelTapAndLongPressPreviousSelector](self, "p_cancelTapAndLongPressPreviousSelector");
      v37[0] = CFSTR("TSWPEditingControllerTextRepKey");
      v37[1] = CFSTR("TSWPEditingControllerRepPointKey");
      v38[0] = v10;
      v38[1] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v12, v14);
      v31 = (NSDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      self->_tapInfo = v31;
      self->_tapAndLongPressIsPossible = 1;
      -[TSWPEditingController p_beginTapAndLongPress:](self, "p_beginTapAndLongPress:", v31);
    }
    if (self->_magnifying)
      goto LABEL_46;
    if (!self->_knobTracker)
    {
      v35 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v36 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_handleTapAndTouchGesture:]");
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3341, CFSTR("after beginTapAndLongPress, we must be either tracking the knobs, or magnifying"));
      if (self->_magnifying)
      {
LABEL_46:
        if (objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasView"), "enclosingScrollView"), "isScrollEnabled"))+[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self, v6, v8);
        -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", self->_initialPressTextSelectionGranularity, 0, v6, v8);
        return;
      }
      if (!self->_knobTracker)
        return;
    }
    objc_opt_class();
    v32 = TSUDynamicCast();
    if (!v32)
    {
      v33 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_handleTapAndTouchGesture:]");
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3354, CFSTR("invalid nil value for '%s'"), "gr");
    }
    -[TSWPEditingController p_handleKnobDragGestureRecognizer:](self, "p_handleKnobDragGestureRecognizer:", v32);
  }
  else
  {
    -[TSWPEditingController p_endAutoscroll](self, "p_endAutoscroll");
    if (self->_tapAndLongPressIsPossible && v20 == 2)
      -[TSWPInteractiveCanvasController zoomColumnAtPoint:](self->_interactiveCanvasController, "zoomColumnAtPoint:", v6, v8);
    -[TSWPEditingController p_cancelTapAndLongPressPreviousSelector](self, "p_cancelTapAndLongPressPreviousSelector");
    if (self->_knobTracker)
    {
      objc_opt_class();
      v27 = TSUDynamicCast();
      if (!v27)
      {
        v28 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_handleTapAndTouchGesture:]");
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3395, CFSTR("invalid nil value for '%s'"), "gr");
      }
      -[TSWPEditingController p_handleKnobDragGestureRecognizer:](self, "p_handleKnobDragGestureRecognizer:", v27);

      self->_knobTracker = 0;
    }
    else
    {
      -[TSWPEditingController protectedStopMagnification](self, "protectedStopMagnification");
    }
    if (objc_msgSend(a3, "gestureState") != 5
      && -[TSWPSelection isValid](-[TSWPEditingController selection](self, "selection"), "isValid"))
    {
      if (v20 == 2)
        v30 = 3;
      else
        v30 = 1;
      -[TSWPEditingController selectionChangedWithFlags:wpFlags:](self, "selectionChangedWithFlags:wpFlags:", 0, v30);
    }
  }
}

- (void)p_beginTapAndLongPress:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSWPSelection *v12;
  TSWPSelection *v13;

  if (!self->_tapAndLongPressIsPossible)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_beginTapAndLongPress:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3463, CFSTR("_tapAndLongPressIsPossible should be YES"));
  }
  self->_tapAndLongPressIsPossible = 0;
  if (-[TSWPSelection type](self->_selection, "type") != 2)
  {
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TSWPEditingControllerTextRepKey"));
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TSWPEditingControllerRepPointKey")), "CGPointValue");
    v9 = v8;
    v11 = v10;
    if (-[TSWPInteractiveCanvasController suppressDoubleTapForSelection](self->_interactiveCanvasController, "suppressDoubleTapForSelection"))
    {
      -[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v7, 2, 1, 0, v9, v11);
    }
    v12 = -[TSWPEditingController selection](self, "selection");
    v13 = v12;
    if (!self->_knobTracker && -[TSWPSelection isValid](v12, "isValid") && -[TSWPSelection isRange](v13, "isRange"))
      -[TSWPEditingController p_beginKnobTrackingSelection:forRep:atPoint:](self, "p_beginKnobTrackingSelection:forRep:atPoint:", v13, v7, v9, v11);
    else
      -[TSWPEditingController p_beginMagnification:forRep:atPoint:](self, "p_beginMagnification:forRep:atPoint:", v13, v7, v9, v11);
  }

  self->_tapInfo = 0;
}

- (void)p_cancelTapAndLongPressPreviousSelector
{
  if (self->_tapAndLongPressIsPossible)
  {
    self->_tapAndLongPressIsPossible = 0;
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_beginTapAndLongPress_, self->_tapInfo);
  }

  self->_tapInfo = 0;
}

- (void)p_dismissDefinitionPopover
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    if (-[UIPopoverController isPopoverVisible](self->_definitionPopoverController, "isPopoverVisible"))
      -[UIPopoverController dismissPopoverAnimated:](self->_definitionPopoverController, "dismissPopoverAnimated:", 1);
    -[TSWPReferenceLibraryViewController setDelegate:](self->_definitionViewController, "setDelegate:", 0);

    self->_definitionViewController = 0;
    self->_definitionPopoverController = 0;
  }
}

- (void)p_beginKnobTrackingSelection:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", a4, 0, 0, 0, a5.x, a5.y);
  v9 = objc_msgSend(a3, "range");
  objc_msgSend(a3, "range");
  if (v8 >= v9 + (v10 >> 1))
    v11 = 10;
  else
    v11 = 11;
  v12 = objc_msgSend(a4, "knobForTag:", v11);
  if (v12)
  {
LABEL_15:
    -[TSWPEditingController p_createKnobTracker:forRep:tapCount:](self, "p_createKnobTracker:forRep:tapCount:", v12, a4, 2);
    -[TSWPEditingController p_beginOperationAndTakeControl](self, "p_beginOperationAndTakeControl");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = (void *)objc_msgSend(a4, "siblings", 0);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "knobForTag:", v11);
          if (v18)
          {
            v12 = v18;
            goto LABEL_15;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v15)
          continue;
        break;
      }
    }
  }
}

- (void)p_createKnobTracker:(id)a3 forRep:(id)a4 tapCount:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  id v11;

  if (!self->_knobTracker
    || (v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_createKnobTracker:forRep:tapCount:]"), objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3548, CFSTR("expected nil value for '%s'"), "_knobTracker"), !self->_knobTracker))
  {
    -[TSWPEditingController setKnobTrackingTapCount:](self, "setKnobTrackingTapCount:", a5);
    v11 = (id)objc_msgSend(a4, "newTrackerForKnob:", a3);
    self->_knobTracker = (TSWPTextKnobTracker *)v11;

  }
}

- (void)p_handleTapGestures:(id)a3
{
  __CFString *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  TSWPSelection *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSUInteger *v26;
  TSWPSelection *v27;
  NSUInteger v28;
  NSUInteger v29;

  v5 = (__CFString *)objc_msgSend(a3, "gestureKind");
  objc_msgSend(a3, "unscaledLocationForICC:", -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = v6;
  v9 = v8;
  objc_opt_class();
  objc_msgSend(a3, "targetRep");
  v10 = (void *)TSUDynamicCast();
  if (!v10)
  {
    objc_opt_class();
    -[TSDInteractiveCanvasController hitRep:](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v7, v9);
    v10 = (void *)TSUDynamicCast();
  }
  v11 = v10;
  objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v7, v9);
  v13 = v12;
  v15 = v14;
  if (v5 == CFSTR("TSWPImmediateSingleTap"))
  {
    if (!v11)
    {
      v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_handleTapGestures:]");
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3588, CFSTR("we should have gotten a valid textRep by now"));
    }
    v26 = (NSUInteger *)MEMORY[0x24BEB3BF0];
    self->_originalSelectionRange = (_NSRange)*MEMORY[0x24BEB3BF0];
    -[TSWPEditingController p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
    if (!self->_editMenuIsVisible)
    {
      v27 = -[TSWPEditingController selection](self, "selection");
      if (-[TSWPSelection isValid](v27, "isValid"))
      {
        v28 = -[TSWPSelection range](v27, "range");
      }
      else
      {
        v28 = *v26;
        v29 = v26[1];
      }
      self->_originalSelectionRange.location = v28;
      self->_originalSelectionRange.length = v29;
    }
    -[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v11, 1, 0, 0, v13, v15);
    v22 = 0;
    v23 = 148;
    goto LABEL_26;
  }
  if (v5 != CFSTR("TSWPSecondarySingleTap")
    && (v5 == CFSTR("TSWPImmediateDoubleTap") || v5 == CFSTR("TSWPTwoFingerTap")))
  {
    v17 = v5 == CFSTR("TSWPImmediateDoubleTap") ? 2 : 4 * (v5 == CFSTR("TSWPTwoFingerTap"));
    if (!v11)
    {
      v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_handleTapGestures:]");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3763, CFSTR("we should have gotten a valid textRep by now"));
    }
    -[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v11, v17, 0, 0, v13, v15);
    v20 = -[TSWPEditingController selection](self, "selection");
    if (v20)
    {
      -[TSWPSelection range](v20, "range");
      if (!v21)
      {
        v22 = 1;
        v23 = 232;
LABEL_26:
        *((_BYTE *)&self->super.isa + v23) = v22;
      }
    }
  }
}

- (BOOL)handleGesture:(id)a3
{
  __CFString *v5;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TSWPEditingController *v11;
  uint64_t v12;
  void *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = (__CFString *)objc_msgSend(a3, "gestureKind");
  self->_mostRecentGestureKind = (NSString *)v5;
  objc_opt_class();
  -[TSDInteractiveCanvasController layerHost](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost");
  objc_msgSend((id)TSUDynamicCast(), "cancelDelayedTapAction");
  v7 = v5 == CFSTR("TSWPOneFingerSwipe") || v5 == CFSTR("TSWPTwoFingerSwipe") || v5 == CFSTR("TSWPThreeFingerSwipe");
  if (v7 && -[TSWPSelection isValid](self->_selection, "isValid"))
  {
    v20 = 2;
    v21 = 0;
    v19 = 0;
    objc_opt_class();
    v8 = TSUDynamicCast();
    if (v8
      && -[TSWPEditingController canHandleSwipeGestureForGestureRecognizer:outDelta:outTextDirection:outLayoutDirection:](self, "canHandleSwipeGestureForGestureRecognizer:outDelta:outTextDirection:outLayoutDirection:", v8, &v21, &v20, &v19))
    {
      if (!v21)
      {
        if (v5 == CFSTR("TSWPOneFingerSwipe"))
        {
          v10 = v19;
          v9 = v20;
          v11 = self;
          v12 = 0;
        }
        else
        {
          if (v5 == CFSTR("TSWPTwoFingerSwipe"))
          {
            v17 = 1;
            -[TSWPEditingController p_handleSwipeMoveCaretWithTextGranularity:textDirection:layoutDirection:](self, "p_handleSwipeMoveCaretWithTextGranularity:textDirection:layoutDirection:", 1, v20, v19);
            return v17;
          }
          if (v5 != CFSTR("TSWPThreeFingerSwipe"))
            return 1;
          v10 = v19;
          v9 = v20;
          v11 = self;
          v12 = 4;
        }
        -[TSWPEditingController p_handleSwipeMoveCaretWithTextGranularity:textDirection:layoutDirection:](v11, "p_handleSwipeMoveCaretWithTextGranularity:textDirection:layoutDirection:", v12, v9, v10);
      }
      return 1;
    }
  }
  else
  {
    if (v5 == CFSTR("TSWPLongPress") || v5 == CFSTR("TSWPImmediatePress"))
    {
      -[TSWPEditingController p_handleLongPressGesture:](self, "p_handleLongPressGesture:", a3);
      return 1;
    }
    if (v5 == CFSTR("TSWPTapAndTouch") || v5 == CFSTR("TSWPDoubleTapAndTouch"))
    {
      -[TSWPEditingController p_handleTapAndTouchGesture:](self, "p_handleTapAndTouchGesture:", TSUProtocolCast());
      return 1;
    }
    if (v5 == CFSTR("TSWPImmediateSingleTap")
      || v5 == CFSTR("TSWPTwoFingerTap")
      || v5 == CFSTR("TSWPSecondarySingleTap")
      || v5 == CFSTR("TSWPImmediateDoubleTap"))
    {
      -[TSWPEditingController p_handleTapGestures:](self, "p_handleTapGestures:", a3);
      return 1;
    }
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController handleGesture:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3869, CFSTR("TSWPEditingController can't handle a gesture of kind %@"), v5);
  }
  return 0;
}

- (void)gestureSequenceWillBegin
{
  self->_originalSelectionRange = (_NSRange)*MEMORY[0x24BEB3BF0];
  *(_WORD *)&self->_gestureBeganWhenEditingBegan = objc_msgSend(+[TSWPEditMenuController sharedEditMenuController](TSWPEditMenuController, "sharedEditMenuController"), "isBeginningEditing");
}

- (void)gestureSequenceDidEnd
{
  void *v3;
  TSWPSelection *v4;
  __CFString *mostRecentGestureKind;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger location;
  NSUInteger length;

  self->_ignoreFutureImmediatePresses = 0;
  objc_opt_class();
  -[TSDInteractiveCanvasController layerHost](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost");
  v3 = (void *)TSUDynamicCast();
  if (objc_msgSend(v3, "hasDelayedTapAction"))
  {
    objc_msgSend(v3, "finishDelayedTapAction");
    goto LABEL_21;
  }
  v4 = -[TSWPEditingController selection](self, "selection");
  if (!v4)
    goto LABEL_21;
  mostRecentGestureKind = (__CFString *)self->_mostRecentGestureKind;
  if (mostRecentGestureKind != CFSTR("TSWPImmediateSingleTap"))
  {
    if (mostRecentGestureKind != CFSTR("TSWPTapAndTouch"))
      goto LABEL_21;
    -[TSWPSelection range](v4, "range");
    if (v6)
      goto LABEL_21;
    goto LABEL_19;
  }
  v7 = -[TSWPSelection range](v4, "range");
  location = self->_originalSelectionRange.location;
  length = self->_originalSelectionRange.length;
  if ((location != *MEMORY[0x24BEB3BF0] || length != *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8))
    && v7 == location
    && v8 == length)
  {
LABEL_19:
    if (!self->_gestureBeganWhenEditingBegan)
      self->_shouldShowEditMenuForInsertionPoint = 1;
  }
LABEL_21:
  self->_gestureBeganWhenEditingBegan = 0;
}

- (void)setAutoscroll:(id)a3
{
  TSDAutoscroll *autoscroll;

  autoscroll = self->_autoscroll;
  if (autoscroll != a3)
  {

    self->_autoscroll = 0;
    self->_autoscroll = (TSDAutoscroll *)a3;
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return self->_readyToEnd;
}

- (id)tracker
{
  return self->_knobTracker;
}

- (BOOL)readyToEndOperation
{
  return self->_readyToEnd;
}

- (void)p_beginOperationAndTakeControl
{
  TSWPInteractiveCanvasController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;

  v3 = -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
  if (-[TSDDynamicOperationController isInOperation](-[TSDInteractiveCanvasController dynamicOperationController](v3, "dynamicOperationController"), "isInOperation"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_beginOperationAndTakeControl]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4332, CFSTR("beginning WP operation in DOC when already in an operation"));
  }
  -[TSDTrackerManipulatorCoordinator registerTrackerManipulator:](-[TSDInteractiveCanvasController tmCoordinator](v3, "tmCoordinator"), "registerTrackerManipulator:", self);
  if (-[TSDTrackerManipulatorCoordinator takeControlWithTrackerManipulator:](-[TSDInteractiveCanvasController tmCoordinator](v3, "tmCoordinator"), "takeControlWithTrackerManipulator:", self))
  {
    -[TSDDynamicOperationController beginOperation](-[TSDInteractiveCanvasController dynamicOperationController](v3, "dynamicOperationController"), "beginOperation");
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_beginOperationAndTakeControl]");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
    -[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](v3, "tmCoordinator"), "controllingTM");
    v9 = (objc_class *)objc_opt_class();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 4341, CFSTR("could not take control with WP Editing Controller. Controlling TM is %@"), NSStringFromClass(v9));
  }
}

- (void)p_endAutoscroll
{
  -[TSDAutoscroll invalidate](-[TSWPEditingController autoscroll](self, "autoscroll"), "invalidate");
  -[TSWPEditingController setAutoscroll:](self, "setAutoscroll:", 0);
}

- (void)p_handleKnobDragGestureRecognizer:(id)a3
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  TSDInteractiveCanvasController *v8;
  double v9;
  double v10;
  double v11;

  v5 = objc_msgSend(a3, "state") == 3 || objc_msgSend(a3, "state") == 4;
  self->_readyToEnd = v5;
  if (!self->_knobTracker)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_handleKnobDragGestureRecognizer:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4355, CFSTR("invalid nil value for '%s'"), "_knobTracker");
  }
  if (objc_msgSend(a3, "state") == 3 || objc_msgSend(a3, "state") == 1)
    -[TSWPTextKnobTracker setIgnoreNextCall:](self->_knobTracker, "setIgnoreNextCall:", 1);
  v8 = -[TSWPEditingController icc](self, "icc");
  objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController icc](self, "icc"), "layerHost"), "asiOSCVC"), "view"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v8, "convertBoundsToUnscaledPoint:");
  v9 = TSDRoundedPoint();
  v11 = v10;
  -[TSDKnobTracker setCurrentPosition:](self->_knobTracker, "setCurrentPosition:", TSDAddPoints(v9, v10, self->_knobToTouchOffset.x));
  if (self->_readyToEnd)
    -[TSWPEditingController p_endAutoscroll](self, "p_endAutoscroll");
  else
    +[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self, v9, v11);
  -[TSDDynamicOperationController handleTrackerManipulator:](-[TSDInteractiveCanvasController dynamicOperationController](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "dynamicOperationController"), "handleTrackerManipulator:", self);
}

- (unint64_t)insertionPoint
{
  if (-[TSWPSelection isValid](self->_selection, "isValid"))
    return -[TSWPSelection start](self->_selection, "start");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setInsertionPoint:(unint64_t)a3
{
  -[TSWPEditingController setInsertionPoint:withFlags:](self, "setInsertionPoint:withFlags:", a3, 0);
}

- (void)setInsertionPoint:(unint64_t)a3 withFlags:(unint64_t)a4
{
  TSWPSelection *v6;

  v6 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3, 0);
  -[TSWPEditingController setSelection:withFlags:](self, "setSelection:withFlags:", v6, a4);

}

- (void)setSelection:(id)a3
{
  -[TSWPEditingController setSelection:withFlags:](self, "setSelection:withFlags:", a3, 0);
}

- (void)p_setRevertibleSelection:(id)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  -[TSKFidgetResolver pushValue:](self->_fidgetResolver, "pushValue:");
  if (objc_msgSend(a3, "isValid"))
  {
    v5 = objc_msgSend(a3, "end");
    if (v5 > -[TSWPStorage length](self->_storage, "length"))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setRevertibleSelection:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4421, CFSTR("Selection extends past end of storage"));
    }
    if (objc_msgSend(a3, "isInsertionPoint"))
    {
      v8 = objc_msgSend(a3, "range");
      if (v8 < -[TSWPStorage length](self->_storage, "length")
        && (-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", objc_msgSend(a3, "range")) & 0xFC00) == 0xDC00)
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setRevertibleSelection:]");
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4427, CFSTR("Insertion point is before the wrong half of a surrogate pair"));
        a3 = (id)objc_msgSend(a3, "copyWithNewRange:", objc_msgSend(a3, "range") + 1, 0);
      }
    }
    else
    {
      v11 = objc_msgSend(a3, "start");
      if (v11 <= -[TSWPStorage length](self->_storage, "length"))
      {
        v12 = objc_msgSend(a3, "start");
        if (v12 != -[TSWPStorage length](self->_storage, "length")
          && (-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", objc_msgSend(a3, "start")) & 0xFC00) == 0xDC00)
        {
          v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setRevertibleSelection:]");
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4436, CFSTR("Selection covers half of a surrogate pair"));
        }
      }
      v15 = objc_msgSend(a3, "end");
      if (v15 <= -[TSWPStorage length](self->_storage, "length"))
      {
        v16 = objc_msgSend(a3, "end");
        if (v16 != -[TSWPStorage length](self->_storage, "length")
          && (-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", objc_msgSend(a3, "end")) & 0xFC00) == 0xDC00)
        {
          v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setRevertibleSelection:]");
          objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4441, CFSTR("Selection covers half of a surrogate pair"));
        }
      }
    }
  }
  v19 = a3;

  self->_selection = (TSWPSelection *)a3;
}

- (void)setSelection:(id)a3 withFlags:(unint64_t)a4
{
  -[TSWPEditingController p_setSelection:withFlags:force:](self, "p_setSelection:withFlags:force:", a3, a4, 0);
}

- (void)p_setSelection:(id)a3 withFlags:(unint64_t)a4 force:(BOOL)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  objc_class *v14;
  TSWPSelection *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  TSDMultiPaneController *insertBreakPopoverController;
  TSDMultiPaneController *v21;
  char v22;
  TSWPSelection *v23;
  TSWPSelection *selection;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  TSWPSelection *v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setSelection:withFlags:force:]");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = (objc_class *)objc_opt_class();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 4478, CFSTR("[TSWPEditingController setSelection:] expected %@, got %@"), v13, NSStringFromClass(v14));
    }
  }
  objc_opt_class();
  v15 = (TSWPSelection *)TSUDynamicCast();
  if (-[TSWPSelection isValid](v15, "isValid"))
  {
    v16 = -[TSWPSelection end](v15, "end");
    if (v16 > -[TSWPStorage length](self->_storage, "length"))
    {
      v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setSelection:withFlags:force:]");
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4480, CFSTR("Bad selection range"));
    }
  }
  if (!a3)
  {
    v49 = CFSTR("TSDEditorControllerEditorKey");
    v50[0] = self;
    v19 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDEditorControllerTextEditorWillClearSelection"), 0, v19);
  }
  if (!-[TSWPSelection isValid](v15, "isValid"))
  {

    self->_dictationInterpretations = 0;
    self->_autocorrectedEntries = 0;
  }
  if (!-[TSWPSelection isInsertionPoint](v15, "isInsertionPoint"))
  {
    insertBreakPopoverController = self->_insertBreakPopoverController;
    if (insertBreakPopoverController)
    {
      -[TSDMultiPaneController dismissAnimated:](insertBreakPopoverController, "dismissAnimated:", 1);
      v21 = self->_insertBreakPopoverController;
      self->_insertBreakPopoverController = 0;
    }
  }
  -[TSWPEditingController setCoalescingText:](self, "setCoalescingText:", 0);
  -[TSWPEditingController p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
  v22 = TSUSupportsTextInteraction();
  if ((a4 & 0x20) == 0 && (v22 & 1) == 0)
  {
    if (-[TSWPEditingController pIsSelectionPlaceHolderTextWithSelection:](self, "pIsSelectionPlaceHolderTextWithSelection:", v15))
    {
      v23 = (TSWPSelection *)(id)objc_msgSend(-[TSWPStorage extendSelectionToIncludeSmartFields:](self->_storage, "extendSelectionToIncludeSmartFields:", v15), "copyWithNewType:", 3);
    }
    else
    {
      v23 = -[TSWPEditingController p_extendSelectionToIncludeSmartFields:](self, "p_extendSelectionToIncludeSmartFields:", v15);
    }
    v15 = v23;
  }
  if (-[TSWPEditingController isParagraphModeWithSelection:onStorage:](self, "isParagraphModeWithSelection:onStorage:", v15, self->_storage))
  {
    v15 = -[TSWPEditingController extendSelectionToParagraphs:](self, "extendSelectionToParagraphs:", v15);
  }
  if (a5 || (selection = self->_selection, selection != v15) && !-[TSWPSelection isEqual:](selection, "isEqual:", v15))
  {
    if (!-[TSWPSelection isEquivalentForInsertionStyle:](self->_selection, "isEquivalentForInsertionStyle:", v15))
    {

      self->_insertionStyle = 0;
    }
    self->_selectionAnchor = 0x7FFFFFFFFFFFFFFFLL;
    if (-[TSWPSelection isValid](v15, "isValid"))
    {
      switch(-[TSWPSelection type](v15, "type"))
      {
        case 0:
        case 4:
        case 6:
        case 7:
          break;
        case 1:
          if (!-[TSWPSelection isInsertionPoint](v15, "isInsertionPoint"))
          {
            v34 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v35 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setSelection:withFlags:force:]");
            v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
            v28 = CFSTR("label selection isn't an insertion point");
            v29 = (void *)v34;
            v30 = v35;
            v31 = 4579;
            goto LABEL_40;
          }
          break;
        case 2:
          if (!-[TSWPSelection isRange](v15, "isRange"))
          {
            v36 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setSelection:withFlags:force:]");
            objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4583, CFSTR("topic selection isn't a range"));
          }
          v38 = -[TSWPSelection range](v15, "range");
          v40 = v39;
          if (v38 != -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", v38))
          {
            v41 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v42 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setSelection:withFlags:force:]");
            objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4585, CFSTR("Topic selection doesn't start at paragraph boundary"));
          }
          v43 = v38 + v40;
          v44 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", v43 - 1);
          if (v43 != v44 + v45)
          {
            v46 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v47 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setSelection:withFlags:force:]");
            v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
            v28 = CFSTR("Topic selection doesn't end at paragraph boundary");
            v29 = (void *)v46;
            v30 = v47;
            v31 = 4586;
            goto LABEL_40;
          }
          break;
        case 3:
        case 5:
          if (!-[TSWPSelection isRange](v15, "isRange"))
          {
            v25 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setSelection:withFlags:force:]");
            v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
            v28 = CFSTR("replace selection isn't a insertion range");
            v29 = (void *)v25;
            v30 = v26;
            v31 = 4576;
            goto LABEL_40;
          }
          break;
        default:
          v32 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_setSelection:withFlags:force:]");
          v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
          v28 = CFSTR("illegal selection type");
          v29 = (void *)v32;
          v30 = v33;
          v31 = 4566;
LABEL_40:
          objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, v27, v31, v28);
          break;
      }
    }
    *(_WORD *)&self->_selectionLastModifiedWithKnob = self->_knobTracking;
    self->_currentSelectionFlags = a4;
    -[TSWPEditingController p_setRevertibleSelection:](self, "p_setRevertibleSelection:", v15);
    -[TSWPEditingController selectionChangedWithFlags:wpFlags:](self, "selectionChangedWithFlags:wpFlags:", a4, 0);
  }
  v48 = self->_selection;
  if (v48
    && -[TSWPSelection isValid](v48, "isValid")
    && (self->_markedRange.location != *MEMORY[0x24BEB3BF0]
     || self->_markedRange.length != *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8)))
  {
    -[TSWPEditingController clearMarkedRange](self, "clearMarkedRange");
  }
  if (!-[TSWPSelection isValid](self->_selection, "isValid"))
    -[TSWPEditingController p_clearEditMenuFlags](self, "p_clearEditMenuFlags");

  self->_previousSelectedAnnotation = 0;
}

- (void)revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold
{
  id v3;
  void *v4;

  v3 = -[TSKFidgetResolver nonFidgetValue](self->_fidgetResolver, "nonFidgetValue");
  if (v3)
  {
    v4 = v3;

    self->_selection = (TSWPSelection *)v4;
    -[TSWPEditingController selectionChangedWithFlags:wpFlags:](self, "selectionChangedWithFlags:wpFlags:", self->_currentSelectionFlags, 0);
  }
}

- (void)p_beginMagnification:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  y = a5.y;
  x = a5.x;
  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate", a3, a4);
  v8 = (void *)TSUProtocolCast();
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", x, y);
  v10 = v9;
  v12 = v11;
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v8, "editorAllowsMagnifier"))
    -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", self->_initialPressTextSelectionGranularity, 1, v10, v12);
}

- (void)p_postWillStyleTextNotification
{
  uint64_t v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("TSDEditorControllerEditorKey");
  v4[0] = self;
  v2 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDEditorControllerTextEditorWillStyleText"), 0, v2);
}

- (void)p_postSelectionContentsChangedNotification
{
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("TSWPEditingControllerEditor");
  v5[0] = self;
  v3 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSWPEditingControllerSelectionContentsChanged"), self->_storage, v3);
}

- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4
{
  void *v6;
  TSDEditorController *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (self->_storage)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4);
    v8[0] = CFSTR("TSWPEditingControllerEditor");
    v8[1] = CFSTR("TSWPEditingControllerSelectionFlagsKey");
    v9[0] = self;
    v9[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("TSWPEditingControllerSelectionChanged"), self->_storage, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
    -[TSWPEditingController p_postSelectionContentsChangedNotification](self, "p_postSelectionContentsChangedNotification");
  }
  -[TSWPEditingController dismissActivePopovers](self, "dismissActivePopovers", a3, a4);
  v7 = -[TSDInteractiveCanvasController editorController](self->_interactiveCanvasController, "editorController");
  if (!-[TSWPEditingController trackingKnobInParagraphMode](self, "trackingKnobInParagraphMode"))
  {
    -[TSDEditorController editorDidChangeSelection:withSelectionFlags:](v7, "editorDidChangeSelection:withSelectionFlags:", self, a3);
    if ((a3 & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  -[TSDEditorController editorDidChangeSelectionAndWantsKeyboard:withSelectionFlags:](v7, "editorDidChangeSelectionAndWantsKeyboard:withSelectionFlags:", self, a3);
  if ((a3 & 0x10000) != 0)
LABEL_7:
    -[TSWPEditingController p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
LABEL_8:
  self->_suppressEditMenu = (a3 & 0x20000) != 0;
  if (self->_magnifying)
  {
    if (objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "target"))
    {
      objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "canvasNeedsDisplay");
    }
  }
}

- (id)extendSelectionToParagraphs:(id)a3
{
  TSWPStorage *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = -[TSWPEditingController storage](self, "storage");
  v6 = objc_msgSend(a3, "range");
  -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:", -[TSWPStorage textRangeForParagraphsInCharRange:](v5, "textRangeForParagraphsInCharRange:", v6, v7));
  v8 = NSIntersectionRangeInclusive();
  v10 = (void *)objc_msgSend(a3, "copyWithNewRange:", v8, v9);
  v11 = v10;
  return -[TSWPEditingController p_extendSelectionToIncludeSmartFields:](self, "p_extendSelectionToIncludeSmartFields:", v10);
}

- (id)p_columnForCharIndex:(unint64_t)a3 withStorage:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char **v9;
  uint64_t i;
  char **v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSDInteractiveCanvasController layoutsForModel:withSelection:](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layoutsForModel:withSelection:", a4, +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3, 1));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v29;
  v9 = &selRef_initWithProperties_bundle_dataManager_precedingStroker_;
  v23 = *(_QWORD *)v29;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v5);
      v11 = v9;
      v12 = (void *)TSUProtocolCast();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = (void *)objc_msgSend(v12, "columns");
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
LABEL_8:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
          v19 = objc_msgSend(v18, "range");
          if (a3 >= v19 && a3 - v19 < v20)
            return v18;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v15)
              goto LABEL_8;
            break;
          }
        }
      }
      v9 = v11;
      v8 = v23;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    v18 = 0;
    if (v7)
      continue;
    return v18;
  }
}

- (BOOL)isInParagraphMode
{
  return -[TSWPEditingController isParagraphModeWithSelection:onStorage:](self, "isParagraphModeWithSelection:onStorage:", self->_selection, self->_storage);
}

- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;

  if (!-[TSWPEditingController p_canEditTextString](self, "p_canEditTextString")
    || (-[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate"),
        v7 = (void *)TSUProtocolCast(),
        objc_msgSend(a3, "isValid"))
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v7, "editorShouldAlwaysBeInParagraphMode") & 1) != 0)
  {
    LOBYTE(v8) = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0 || (v8 = objc_msgSend(v7, "editorAllowsParagraphMode")) != 0)
  {
    v8 = objc_msgSend(a3, "isRange");
    if (v8)
    {
      v9 = objc_msgSend(a3, "range");
      v11 = v10;
      v12 = objc_msgSend(a4, "selectedParagraphBreakCount:", v9, v10);
      v13 = objc_msgSend(a4, "emptyParagraphCount:", v9, v11);
      v14 = v13 != 0;
      objc_msgSend(a4, "paragraphIndexRangeForCharRange:", v9, v11);
      LOBYTE(v8) = 0;
      if (a4)
      {
        if (v15 >= 2 && v12 != v14)
        {
          if (objc_msgSend(a3, "type") == 3)
          {
            LOBYTE(v8) = 0;
          }
          else
          {
            v8 = -[TSWPSelection type](self->_selection, "type");
            v16 = v8 == 5;
            LOBYTE(v8) = v8 != 5;
            if (!v16 && v12 - v14 == 1)
            {
              v17 = v11 + v9 - 1;
              v18 = -[TSWPEditingController p_columnForCharIndex:withStorage:](self, "p_columnForCharIndex:withStorage:", v9, a4);
              v19 = -[TSWPEditingController p_columnForCharIndex:withStorage:](self, "p_columnForCharIndex:withStorage:", v17, a4);
              v20 = objc_msgSend(v18, "lineIndexForCharIndex:eol:", v9, 0);
              v21 = objc_msgSend(v19, "lineIndexForCharIndex:eol:", v17, 0) - v20;
              if (!v13)
                ++v21;
              LOBYTE(v8) = v18 != v19 || v21 > 2;
            }
          }
        }
      }
    }
  }
  return v8;
}

- (BOOL)trackingKnobInParagraphMode
{
  _BOOL4 v3;

  v3 = -[TSWPEditingController knobTracking](self, "knobTracking");
  if (v3)
    LOBYTE(v3) = -[TSWPEditingController isInParagraphMode](self, "isInParagraphMode");
  return v3;
}

- (_NSRange)markedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_markedRange.length;
  location = self->_markedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)clearMarkedRange
{
  uint64_t v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (self->_markedRange.location != *MEMORY[0x24BEB3BF0]
    || self->_markedRange.length != *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8))
  {
    self->_markedRange = (_NSRange)*MEMORY[0x24BEB3BF0];
    v5 = CFSTR("TSWPEditingControllerEditor");
    v6[0] = self;
    v4 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSWPEditingControllerMarkChanged"), self->_storage, v4);

    self->_markedText = 0;
  }
}

- (unint64_t)countOfHyperlinksInUserSelection
{
  TSWPStorage *storage;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[TSWPSelection isValid](self->_selection, "isValid"))
  {
    storage = self->_storage;
    v4 = -[TSWPSelection range](self->_selection, "range");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __57__TSWPEditingController_countOfHyperlinksInUserSelection__block_invoke;
    v8[3] = &unk_24D82D830;
    v8[4] = &v9;
    -[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](storage, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v4, v5, v8);
  }
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __57__TSWPEditingController_countOfHyperlinksInUserSelection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "elementKind");
  if ((_DWORD)result == 512)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)p_hitRepWithPoint:(CGPoint)a3 keyboardAdjustmentDelta:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", a3.x, a3.y + a4);
  v6 = v5;
  v8 = v7;
  objc_opt_class();
  -[TSDInteractiveCanvasController hitRep:](self->_interactiveCanvasController, "hitRep:", v6, v8);
  v9 = (void *)TSUDynamicCast();
  if (!v9)
  {
    -[TSDInteractiveCanvasController convertBoundsToUnscaledSize:](self->_interactiveCanvasController, "convertBoundsToUnscaledSize:", 20.0, 2.0);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = -[TSDInteractiveCanvasController hitRepsAtPoint:withSlop:](self->_interactiveCanvasController, "hitRepsAtPoint:withSlop:", v6, v8, v10, v11, 0);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v9, "isEditing")
          && (TSWPStorage *)objc_msgSend(v9, "storage") == self->_storage)
        {
          break;
        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v14)
            goto LABEL_4;
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7
{
  return objc_msgSend(a3, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", a5, 0, a6, a7, a4.x, a4.y);
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7
{
  return objc_msgSend(a3, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", a5, a6, a7, 0, a4.x, a4.y);
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8
{
  return objc_msgSend(a3, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", a5, a6, a7, a8, 0, a4.x, a4.y);
}

- (unint64_t)textSelectionGranularityForTapCount:(unint64_t)a3
{
  if (a3 - 2 >= 3)
    return 4 * (a3 == 5);
  else
    return a3 - 1;
}

- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double y;
  double x;
  unint64_t v14;
  _BOOL8 v15;
  void *v16;
  uint64_t v17;

  v7 = a7;
  v8 = a6;
  y = a4.y;
  x = a4.x;
  -[TSWPEditingController p_sendHandleTapNotification](self, "p_sendHandleTapNotification");
  v14 = -[TSWPEditingController textSelectionGranularityForTapCount:](self, "textSelectionGranularityForTapCount:", a5);
  if (a5)
    v15 = v8;
  else
    v15 = 0;
  LOBYTE(v17) = 0;
  -[TSWPEditingController p_setTappedSelection:](self, "p_setTappedSelection:", -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", a3, v14, v8, v7, v15, 0, x, y, v17));
  if (v8)
  {
    -[TSDInteractiveCanvasController delegate](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate");
    v16 = (void *)TSUProtocolCast();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "didSetTappedSelectionWithWPEditor:onWPRep:", self, a3);
  }
}

- (id)selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  return -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", a3, a5, 0, 1, 1, 0, a4.x, a4.y, v6);
}

- (void)tappedOnKnob:(id)a3
{
  uint64_t v4;
  TSWPSelection *selection;
  uint64_t v6;
  uint64_t v7;
  TSWPSelection *v8;

  v4 = objc_msgSend(a3, "tag");
  selection = self->_selection;
  if (v4 == 11)
    v6 = -[TSWPSelection start](selection, "start");
  else
    v6 = -[TSWPSelection end](selection, "end");
  v7 = v6;
  -[TSWPEditingController p_sendHandleTapNotification](self, "p_sendHandleTapNotification");
  v8 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v7, 0);
  -[TSWPEditingController p_setTappedSelection:](self, "p_setTappedSelection:", v8);

}

- (void)p_sendHandleTapNotification
{
  uint64_t v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("TSDEditorControllerEditorKey");
  v4[0] = self;
  v2 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDEditorControllerTextEditorWillHandleTap"), 0, v2);
}

- (void)p_setTappedSelection:(id)a3
{
  uint64_t v5;

  if (-[TSWPEditingController pIsSelectionPlaceHolderTextWithSelection:](self, "pIsSelectionPlaceHolderTextWithSelection:"))
  {
    v5 = 16464;
  }
  else
  {
    v5 = 16720;
  }
  -[TSDInteractiveCanvasController setSelection:onModel:withFlags:](self->_interactiveCanvasController, "setSelection:onModel:withFlags:", a3, self->_storage, v5);
}

- (BOOL)p_hitListLabelAtCharIndex:(unint64_t)a3 atNaturalPoint:(CGPoint)a4 inRep:(id)a5
{
  double y;
  double x;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGRect v21;
  CGRect v22;

  if (!a5)
    return 0;
  y = a4.y;
  x = a4.x;
  if (!-[TSWPEditingController p_respondsToListGestures](self, "p_respondsToListGestures"))
    return 0;
  objc_msgSend(a5, "labelRectForCharIndex:", a3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v22.origin.x = TSDRectWithCenterAndSize(x, y, 40.0);
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  return CGRectIntersectsRect(v21, v22);
}

- (id)p_selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 selectsEntireLink:(BOOL)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double y;
  double x;
  void *v14;
  uint64_t v16;

  v8 = a6;
  v9 = a5;
  y = a3.y;
  x = a3.x;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, x, y);
  v14 = (void *)TSUDynamicCast();
  if (!objc_msgSend(v14, "isEditing"))
    return 0;
  objc_msgSend(v14, "convertNaturalPointFromUnscaledCanvas:", x, y);
  objc_msgSend(v14, "pinToClosestColumn:");
  LOBYTE(v16) = a7;
  return -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", v14, a4, v9, 1, 0, v8, v16);
}

- (id)p_selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9 selectsEntireLink:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL4 v11;
  double y;
  double x;
  void *v17;
  void *v18;
  TSWPStorage *storage;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  CGFloat v24;
  TSWPFilteredStorage *v25;
  TSWPStorage *v26;
  uint64_t v27;
  uint64_t v28;
  TSWPFilteredStorage *v29;
  uint64_t v30;
  uint64_t v31;
  TSWPStorage *v32;
  void *selection;
  CGFloat width;
  unint64_t v35;
  unint64_t v36;
  NSUInteger v37;
  NSUInteger length;
  TSWPStorage *v39;
  unint64_t v40;
  uint64_t v41;
  unsigned int v42;
  CGFloat v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  TSWPStorage *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  int v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BOOL4 v64;
  TSWPSelection *v65;
  TSWPSelection *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CGFloat v74;
  double v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  CGFloat MidX;
  double v89;
  double v90;
  double v91;
  double v92;
  unint64_t v93;
  NSUInteger v94;
  NSRange v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  BOOL v99;
  TSWPSelection *v100;
  TSWPSelection *v101;
  TSWPSelection *v102;
  double v104;
  double v105;
  char v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double v114;
  double v115;
  CGFloat v116;
  CGRect rect;
  TSWPParagraphEnumerator v118;
  unsigned __int8 v119;
  _BYTE v120[9];
  NSRange v121;
  NSRange v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  v10 = a9;
  v11 = a8;
  y = a4.y;
  x = a4.x;
  objc_opt_class();
  v17 = (void *)TSUDynamicCast();
  if (!v17)
    return 0;
  v18 = v17;
  v120[0] = 1;
  v119 = 0;
  storage = self->_storage;
  if (storage == (TSWPStorage *)objc_msgSend(v17, "storage"))
  {
    *(double *)&v20 = COERCE_DOUBLE(-[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v18, v10, &v119, v120, x, y));
  }
  else
  {
    *(double *)&v20 = COERCE_DOUBLE(-[TSWPStorage length](self->_storage, "length"));
    v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:]");
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5299, CFSTR("The selection for the rep's storage is not the same as the editor's storage."));
  }
  if (*(double *)&v20 == NAN)
    return 0;
  v24 = *(double *)&v20;
  if (!v120[0])
  {
    *(double *)&v20 = COERCE_DOUBLE(-[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v20));
    if (*(double *)&v20 == NAN)
      return 0;
  }
  rect.origin.x = v24;
  v115 = *MEMORY[0x24BEB3BF0];
  v25 = [TSWPFilteredStorage alloc];
  v26 = self->_storage;
  v27 = -[TSWPStorage selectionRangeForCharIndex:](v26, "selectionRangeForCharIndex:", v20);
  v29 = -[TSWPFilteredStorage initWithStorage:subRange:](v25, "initWithStorage:subRange:", v26, v27, v28);
  v30 = -[TSWPFilteredStorage charIndexMappedFromStorage:](v29, "charIndexMappedFromStorage:", v20);
  switch(a5)
  {
    case 0uLL:
      v31 = v30;
      if (v11
        && -[TSWPEditingController p_hitListLabelAtCharIndex:atNaturalPoint:inRep:](self, "p_hitListLabelAtCharIndex:atNaturalPoint:inRep:", *(_QWORD *)&rect.origin.x, v18, x, y))
      {
        v32 = self->_storage;
        if (v32)
          -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](v32, "paragraphEnumeratorAtCharIndex:styleProvider:", v20, 0);
        else
          memset(&v118, 0, sizeof(v118));
        width = COERCE_DOUBLE(TSWPParagraphEnumerator::paragraphTextRange(&v118));
        v63 = v62;
        v64 = v62 != 0;
        v65 = -[TSWPEditingController selection](self, "selection");
        if (v63)
        {
          v66 = v65;
          if (-[TSWPSelection isValid](v65, "isValid"))
          {
            if (-[TSWPSelection type](v66, "type") == 2)
            {
              v67 = -[TSWPSelection range](v66, "range");
              if (v67 <= *(_QWORD *)&width && v67 + v68 >= *(_QWORD *)&width + v63)
                width = COERCE_DOUBLE(-[TSWPSelection range](v66, "range"));
            }
          }
        }
        v41 = (2 * v64);
        TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v118);
        goto LABEL_99;
      }
      v44 = -[TSWPFilteredStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](v29, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v31, 6, &v118);
      v118.var0 = (id)-[TSWPFilteredStorage charRangeMappedToStorage:](v29, "charRangeMappedToStorage:", v118.var0, v118.var1);
      v118.var1 = v45;
      if (a7 || v44)
      {
        objc_opt_class();
        if (TSUDynamicCast())
          v59 = a10;
        else
          v59 = 1;
        if (v59)
          v41 = 7;
        else
          v41 = 0;
        if (v59)
          width = rect.origin.x;
        else
          width = *(double *)&v118.var0;
        goto LABEL_99;
      }
      if (v119)
      {
        if (v20 > -[TSWPStorage selectionRangeMinForCharIndex:](self->_storage, "selectionRangeMinForCharIndex:", v20))
        {
          v46 = -[TSWPFilteredStorage whiteSpaceRangeAtCharIndex:includingBreaks:](v29, "whiteSpaceRangeAtCharIndex:includingBreaks:", -[TSWPFilteredStorage previousCharacterIndex:](v29, "previousCharacterIndex:", -[TSWPFilteredStorage charIndexMappedFromStorage:](v29, "charIndexMappedFromStorage:", v20)), 0);
          if (v46 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v47 = v46;
            *(double *)&v20 = COERCE_DOUBLE(-[TSWPFilteredStorage charIndexMappedToStorage:](v29, "charIndexMappedToStorage:", v46));
            v120[0] = 1;
            v31 = v47;
            *(_QWORD *)&rect.origin.x = v20;
          }
        }
      }
      -[TSWPEditingController dictationInterpretationsAtCharIndex:outRange:](self, "dictationInterpretationsAtCharIndex:outRange:", v20, &rect.size);
      *(double *)&v48 = COERCE_DOUBLE(objc_msgSend(v18, "rangeOfMisspelledWordAtCharIndex:", v20));
      if (*(_QWORD *)&rect.size.width != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!-[TSWPSelection isValid](self->_selection, "isValid"))
        {
          v41 = 5;
          width = rect.size.width;
          goto LABEL_99;
        }
        v60 = -[TSWPSelection range](self->_selection, "range");
        width = rect.size.width;
        v41 = 5;
        if (v60 != *(_QWORD *)&rect.size.width || v61 != *(_QWORD *)&rect.size.height)
          goto LABEL_99;
      }
      if (*(double *)&v48 != NAN)
      {
        v41 = 3;
        width = *(double *)&v48;
        goto LABEL_99;
      }
      if (-[TSWPSelection isValid](self->_selection, "isValid")
        && (-[TSWPSelection type](self->_selection, "type") == 3 || -[TSWPSelection type](self->_selection, "type") == 5))
      {
        if ((v49 = -[TSWPSelection range](self->_selection, "range"), v20 >= v49) && v20 - v49 < v50
          || (v51 = -[TSWPSelection range](self->_selection, "range"), v51 + v52 == v20))
        {
          selection = self->_selection;
          goto LABEL_15;
        }
      }
      v69 = -[TSWPFilteredStorage wordAtCharIndex:includePreviousWord:](v29, "wordAtCharIndex:includePreviousWord:", -[TSWPFilteredStorage scanBackwardForWordAtCharIndex:](v29, "scanBackwardForWordAtCharIndex:", v31), 0);
      if (v69 == 0x7FFFFFFFFFFFFFFFLL)
        v69 = -[TSWPFilteredStorage whiteSpaceRangeAtCharIndex:includingBreaks:](v29, "whiteSpaceRangeAtCharIndex:includingBreaks:", v31, 0);
      v71 = v69;
      width = rect.origin.x;
      if (v69 == 0x7FFFFFFFFFFFFFFFLL || !v70)
        goto LABEL_117;
      *(double *)&v72 = COERCE_DOUBLE(-[TSWPFilteredStorage charRangeMappedToStorage:](v29, "charRangeMappedToStorage:", v69, v70));
      *(_QWORD *)&width = v73 + v72 - 1;
      objc_msgSend(v18, "caretRectForCharIndex:leadingEdge:caretAffinity:", v72, 1, 0);
      v116 = v75;
      rect.origin.x = v74;
      v77 = v76;
      v114 = v76;
      v79 = v78;
      objc_msgSend(v18, "caretRectForCharIndex:leadingEdge:caretAffinity:", *(_QWORD *)&width, 0, 0);
      v81 = v80;
      v83 = v82;
      v85 = v84;
      v87 = v86;
      v123.origin.y = v77;
      v123.size.width = v79;
      v123.origin.x = rect.origin.x;
      v123.size.height = v116;
      MidX = CGRectGetMidX(v123);
      v113 = v85;
      v124.origin.x = v81;
      v111 = v87;
      v112 = v83;
      v124.origin.y = v83;
      v124.size.width = v85;
      v89 = MidX;
      v124.size.height = v87;
      v90 = CGRectGetMidX(v124);
      v91 = v90;
      if (v89 <= v90)
        v92 = v90;
      else
        v92 = v89;
      if (v89 <= v90)
        v90 = v89;
      v110 = v90;
      v125.origin.x = rect.origin.x;
      v125.origin.y = v114;
      v125.size.width = v79;
      v125.size.height = v116;
      if (CGRectIsNull(v125))
        goto LABEL_86;
      v126.size.width = v113;
      v126.origin.x = v81;
      v126.origin.y = v112;
      v126.size.height = v111;
      if (CGRectIsNull(v126))
        goto LABEL_106;
      if (vabdd_f64(v114, v112) >= 0.00999999978)
      {
        v127.origin.x = rect.origin.x;
        v127.origin.y = v114;
        v127.size.width = v79;
        v127.size.height = v116;
        v104 = vabdd_f64(CGRectGetMinX(v127), y);
        v128.origin.x = rect.origin.x;
        v128.origin.y = v114;
        v128.size.width = v79;
        v128.size.height = v116;
        v105 = vabdd_f64(CGRectGetMaxX(v128), y);
        if (v105 < v104)
          v104 = v105;
        v129.origin.y = v112;
        v129.origin.x = v81;
        v129.size.width = v113;
        v129.size.height = v111;
        if (v104 <= vabdd_f64(CGRectGetMinY(v129), y)
          && (v130.origin.x = v81,
              v130.origin.y = v112,
              v130.size.width = v113,
              v130.size.height = v111,
              v104 <= vabdd_f64(CGRectGetMaxY(v130), y)))
        {
          v106 = 1;
          width = *(double *)&v72;
        }
        else
        {
          v106 = 0;
        }
        v120[0] = v106;
      }
      else if (v89 > v91 != v92 - x >= x - v110)
      {
LABEL_106:
        v120[0] = 1;
        width = *(double *)&v72;
      }
      else
      {
LABEL_86:
        v120[0] = 0;
      }
LABEL_117:
      if (width == NAN)
      {
        v107 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", v71);
        v108 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:]");
        objc_msgSend(v107, "handleFailureInFunction:file:lineNumber:description:", v108, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5465, CFSTR("invalid charIndex for visual selection"));
        width = NAN;
      }
      v41 = 7;
LABEL_99:
      -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:", *(_QWORD *)&width);
      v96 = NSIntersectionRangeInclusive();
      v98 = v97;
      v99 = v96 == -[TSWPStorage length](self->_storage, "length") && !v98 || v120[0] != 0;
      v120[0] = v99;
      v100 = [TSWPSelection alloc];
      LOBYTE(v109) = v120[0];
      v101 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v100, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", v41, v96, v98, 0, v119, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v109, self->_storage);
      v102 = v101;
      v23 = -[TSWPEditingController logicalToVisualSelection:](self, "logicalToVisualSelection:", -[TSWPEditingController p_extendSelectionToIncludeSmartFields:](self, "p_extendSelectionToIncludeSmartFields:", v101));

      return v23;
    case 1uLL:
      v35 = -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:", v18, v10, 1, 1, 0, x, y);
      v36 = -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:", v18, v10, 0, 0, 0, x, y);
      if (v11
        && -[TSWPSelection isValid](self->_selection, "isValid")
        && -[TSWPSelection type](self->_selection, "type") == 2
        && -[TSWPEditingController p_hitListLabelAtCharIndex:atNaturalPoint:inRep:](self, "p_hitListLabelAtCharIndex:atNaturalPoint:inRep:", v20, v18, x, y))
      {
        width = COERCE_DOUBLE(-[TSWPSelection range](self->_selection, "range"));
        length = v37;
        v39 = self->_storage;
        v40 = -[TSWPSelection start](self->_selection, "start");
        if (v39)
          -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](v39, "paragraphEnumeratorAtCharIndex:styleProvider:", v40, 0);
        else
          memset(&v118, 0, sizeof(v118));
        v43 = rect.origin.x;
        v93 = TSWPParagraphEnumerator::paragraphLevel(&v118);
        while (!TSWPParagraphEnumerator::isLastParagraph(&v118))
        {
          TSWPParagraphEnumerator::operator++(&v118);
          if (TSWPParagraphEnumerator::paragraphLevel(&v118) <= v93
            || !TSWPParagraphEnumerator::paragraphHasListLabel(&v118))
          {
            break;
          }
          v122.location = TSWPParagraphEnumerator::paragraphTextRange(&v118);
          v122.length = v94;
          *(CGFloat *)&v121.location = width;
          v121.length = length;
          v95 = NSUnionRange(v121, v122);
          width = *(double *)&v95.location;
          length = v95.length;
        }
        TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v118);
        v42 = 2;
      }
      else if (v35 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v42 = 8;
        width = v115;
        v43 = rect.origin.x;
      }
      else
      {
        *(double *)&v54 = COERCE_DOUBLE(-[TSWPFilteredStorage rangeForSelectionAtCharIndex:caretIndex:](v29, "rangeForSelectionAtCharIndex:caretIndex:", -[TSWPFilteredStorage charIndexMappedFromStorage:](v29, "charIndexMappedFromStorage:", v36), -[TSWPFilteredStorage charIndexMappedFromStorage:](v29, "charIndexMappedFromStorage:", v35)));
        v56 = v55;
        width = COERCE_DOUBLE(-[TSWPFilteredStorage charRangeMappedToStorage:](v29, "charRangeMappedToStorage:", v54, v55));
        v57 = v56 == 1;
        v43 = rect.origin.x;
        if (v57)
        {
          v58 = -[TSWPFilteredStorage characterAtIndex:](v29, "characterAtIndex:", v54);
          v42 = 0;
          if (v58 == 65532)
            width = *(double *)&v54;
        }
        else
        {
          v42 = 0;
        }
      }
      if (width == NAN)
        v41 = 7;
      else
        v41 = v42;
      if (width == NAN)
        width = v43;
      goto LABEL_99;
    case 2uLL:
      if (-[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:", v18, v10, 0, &v119, x, y) == 0x7FFFFFFFFFFFFFFFLL)goto LABEL_25;
      LOBYTE(rect.size.width) = 0;
      HIBYTE(rect.origin.y) = 0;
      v118.var0 = 0;
      width = COERCE_DOUBLE(-[TSWPEditingController p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v20, &rect.size, 2, 1, &v118, (char *)&rect.origin.y + 7));
      -[TSWPEditingController p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v20, &rect.size, 2, 0, &v118, v120);
      v41 = 0;
      goto LABEL_99;
    case 3uLL:
      if (-[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:", v18, v10, 0, &v119, x, y) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v53 = self->_storage;
        if (v53)
          -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](v53, "paragraphEnumeratorAtCharIndex:styleProvider:", v20, 0);
        else
          memset(&v118, 0, sizeof(v118));
        width = COERCE_DOUBLE(TSWPParagraphEnumerator::paragraphTextRange(&v118));
        TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v118);
        goto LABEL_65;
      }
LABEL_25:
      v41 = 7;
      width = rect.origin.x;
      goto LABEL_99;
    case 4uLL:
      selection = self->_storage;
LABEL_15:
      width = COERCE_DOUBLE(objc_msgSend(selection, "range"));
LABEL_65:
      v41 = 0;
      goto LABEL_99;
    default:
      v41 = 8;
      width = v115;
      goto LABEL_99;
  }
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (self->_storage == a4)
  {
    if (-[TSWPSelection isValid](-[TSWPEditingController selection](self, "selection"), "isValid"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v22 != v8)
              objc_enumerationMutation(a3);
            v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v10, "kind") == 1)
            {
              objc_msgSend(v10, "details");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "details"), "objectForKeyedSubscript:", CFSTR("selection"));
                v12 = objc_msgSend(v11, "range");
                v14 = v13;
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "details"), "objectForKeyedSubscript:", CFSTR("TSWPEditingControllerReassignSelectionKey")), "BOOLValue"))
                {
                  -[TSWPEditingController setSelection:](self, "setSelection:", v11);
                }
                else
                {
                  v15 = -[TSWPStorage range](self->_storage, "range");
                  v17 = v16;
                  v18 = -[TSWPSelection range](-[TSWPEditingController selection](self, "selection"), "range");
                  if (v15 <= v18 && v15 + v17 >= v18 + v19)
                  {
                    if (-[TSWPSelection intersectsRange:](-[TSWPEditingController selection](self, "selection"), "intersectsRange:", v12, v14)|| -[TSWPSelection isInsertionPoint](-[TSWPEditingController selection](self, "selection"), "isInsertionPoint")&& (v20 = -[TSWPSelection start](-[TSWPEditingController selection](self, "selection"), "start"), v20 == -[TSWPStorage length](self->_storage, "length"))&& v12 + v14 == -[TSWPStorage length](self->_storage, "length"))
                    {
                      -[TSWPEditingController p_postSelectionContentsChangedNotification](self, "p_postSelectionContentsChangedNotification");
                      return;
                    }
                  }
                }
              }
            }
          }
          v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v7)
            continue;
          break;
        }
      }
    }
  }
}

- (TSDInteractiveCanvasController)icc
{
  return &self->_interactiveCanvasController->super;
}

- (void)updateAfterAutoscroll:(id)a3
{
  TSWPInteractiveCanvasController *interactiveCanvasController;
  double v6;
  double v7;
  double v8;
  double v9;
  TSWPTextKnobTracker *knobTracker;
  id v11;

  interactiveCanvasController = self->_interactiveCanvasController;
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](interactiveCanvasController, "layerHost"), "canvasView"), "convertPoint:fromView:", 0, self->_autoscrollPoint.x, self->_autoscrollPoint.y);
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](interactiveCanvasController, "convertBoundsToUnscaledPoint:");
  v7 = v6;
  v9 = v8;
  -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
  knobTracker = self->_knobTracker;
  if (knobTracker)
  {
    -[TSWPTextKnobTracker updateAfterAutoscroll:atPoint:](knobTracker, "updateAfterAutoscroll:atPoint:", a3, self->_autoscrollPoint.x, self->_autoscrollPoint.y);
  }
  else
  {
    v11 = +[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier");
    objc_msgSend(v11, "setAutoscrollDirections:", objc_msgSend(a3, "directions"));
    if (-[TSWPSelection isInsertionPoint](-[TSWPEditingController selection](self, "selection"), "isInsertionPoint"))
      -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 0, v7, v9);
    objc_msgSend(v11, "postAutoscrollPoint:", v7, v9);
  }
}

- (void)autoscrollWillNotStart
{
  objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "autoscrollWillNotStart");
  -[TSWPTextKnobTracker autoscrollWillNotStart](self->_knobTracker, "autoscrollWillNotStart");
}

- (id)pasteboardController
{
  return -[TSKDocumentRoot pasteboardController](-[TSDInteractiveCanvasController documentRoot](self->_interactiveCanvasController, "documentRoot"), "pasteboardController");
}

- (BOOL)pStorageCanAcceptDrawableAttachments
{
  return -[TSWPStorage allowsElementKind:](self->_storage, "allowsElementKind:", 1048591);
}

- (_NSRange)smartDeletionSelection:(id)a3 isVisual:(BOOL *)a4
{
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  NSUInteger v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  BOOL v17;
  uint64_t v18;
  char v19;
  _BOOL4 v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  _NSRange result;

  v7 = objc_msgSend(a3, "range");
  v9 = v8;
  if (a4)
    *a4 = objc_msgSend(a3, "isVisual");
  if ((unint64_t)objc_msgSend(a3, "visualRangeCount") <= 1 && objc_msgSend(a3, "isRange"))
  {
    v7 = objc_msgSend(a3, "superRange");
    v9 = v10;
    if (a4)
      *a4 = 0;
    v11 = -[TSWPStorage length](self->_storage, "length");
    v36 = 0;
    v37 = 0;
    -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_storage, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v7, 6, &v36);
    v12 = v7 + v9;
    if (v7)
      v13 = v36 == v7;
    else
      v13 = 1;
    v14 = !v13;
    v15 = v37 + v36;
    if (v37 + v36 < v12)
    {
      -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_storage, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v12 - 1, 6, &v36);
      v15 = v37 + v36;
    }
    v17 = v15 == v12 || v12 == v11;
    if (v14)
    {
      v18 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v7 - 1);
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v18))
      {
        v19 = 0;
        v20 = v18 == 32;
        v21 = 1;
        if (v17)
          goto LABEL_36;
LABEL_38:
        v29 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v7 + v9);
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v29) & 1) == 0)
        {
          if ((v20 & objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "postSmartSet"), "characterIsMember:", v29)) != 1)goto LABEL_52;
          goto LABEL_46;
        }
        if ((_DWORD)v29 == 32)
          v30 = v14;
        else
          v30 = 1;
        if ((v30 & 1) == 0)
          goto LABEL_47;
        if ((v19 & 1) != 0)
        {
          v9 += ((_DWORD)v29 == 32) & ~v21;
          goto LABEL_52;
        }
        if ((_DWORD)v29 == 32)
        {
LABEL_47:
          ++v9;
          goto LABEL_52;
        }
LABEL_36:
        if (!v20)
          goto LABEL_52;
LABEL_46:
        --v7;
        goto LABEL_47;
      }
      v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "preSmartSet"), "characterIsMember:", v18);
      v20 = 0;
      v21 = v28 ^ 1;
    }
    else
    {
      v20 = 0;
      v21 = 1;
    }
    v19 = 1;
    if (v17)
      goto LABEL_36;
    goto LABEL_38;
  }
  if (objc_msgSend(a3, "isRange")
    && objc_msgSend(a3, "isVisual")
    && -[TSWPEditingController textStorage:hasWhitespaceBoundedWordAtSelection:](self, "textStorage:hasWhitespaceBoundedWordAtSelection:", -[TSWPEditingController storage](self, "storage"), a3))
  {
    LOBYTE(v36) = 0;
    v22 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", -[TSWPEditingController p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", a3, &v36), 3);
    if (IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](-[TSWPEditingController storage](self, "storage"), "characterAtIndex:", v22)))
    {
      v23 = objc_msgSend(a3, "superRange");
      if (v22 >= v23 && v22 - v23 < v24)
        goto LABEL_49;
    }
    v25 = -[TSWPEditingController p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", a3, &v36);
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v26 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController smartDeletionSelection:isVisual:]");
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5914, CFSTR("Invalid index for right edge of selection"));
      goto LABEL_50;
    }
    v22 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v25, 2);
    if (IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](-[TSWPEditingController storage](self, "storage"), "characterAtIndex:", v22)))
    {
LABEL_49:
      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = -[TSWPEditingController p_adjustVisualSelection:withOtherSelection:](self, "p_adjustVisualSelection:withOtherSelection:", a3, -[TSWPEditingController logicalToVisualSelection:](self, "logicalToVisualSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v22, 1)));
        v9 = v35;
        if (!a4)
          goto LABEL_52;
        goto LABEL_51;
      }
    }
LABEL_50:
    v31 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v32 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController smartDeletionSelection:isVisual:]");
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5927, CFSTR("A spaceCharIndexToRemove to remove should always be found"));
    if (!a4)
      goto LABEL_52;
LABEL_51:
    *a4 = 1;
  }
LABEL_52:
  v33 = v7;
  v34 = v9;
  result.length = v34;
  result.location = v33;
  return result;
}

- (CGRect)overrideCaretRectForSelection:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF070];
  v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)textStorage:(id)a3 hasWhitespaceBoundedWordAtSelection:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  char v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char v33;

  v33 = 0;
  if (objc_msgSend(a4, "isVisual"))
  {
    v7 = -[TSWPEditingController p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", a4, &v33);
    v8 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v7, 3);
    if ((IsWhitespaceCharacter(objc_msgSend(a3, "characterAtIndex:", v7)) & 1) != 0)
      goto LABEL_6;
    if (v8 == objc_msgSend(a3, "length")
      || IsWhitespaceCharacter(objc_msgSend(a3, "characterAtIndex:", v8)))
    {
      v9 = TSWPCJKLanguageForInputLanguageString((void *)objc_msgSend(a3, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v7, 1, 1, 0));
      LOBYTE(v10) = 0;
      v11 = 0;
      if (v9 == 6)
      {
LABEL_6:
        v12 = -[TSWPEditingController p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", a4, &v33);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController textStorage:hasWhitespaceBoundedWordAtSelection:]");
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5987, CFSTR("Invalid index for right edge of selection"));
LABEL_16:
          LOBYTE(v10) = 0;
          v11 = 1;
          return v10 & v11;
        }
        v22 = v12;
        v23 = objc_msgSend(a3, "characterAtIndex:", v12);
        if ((IsParagraphBreakingCharacter(v23) & 1) != 0)
          goto LABEL_16;
        if ((IsWhitespaceCharacter(v23) & 1) != 0)
          goto LABEL_27;
        v24 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v22, 2);
        if (v24 != objc_msgSend(a3, "length")
          && !IsWhitespaceCharacter(objc_msgSend(a3, "characterAtIndex:", v24)))
        {
          goto LABEL_16;
        }
        v25 = v22 <= v24 ? v24 : v22;
        v26 = v22 >= v24 ? v24 : v22;
        v11 = 1;
        if (TSWPCJKLanguageForInputLanguageString((void *)objc_msgSend(a3, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v26, v25 - v26, 1, 0)) == 6)
        {
LABEL_27:
          v20 = objc_msgSend(a4, "range");
          v19 = a3;
          v21 = v27;
          goto LABEL_28;
        }
LABEL_35:
        LOBYTE(v10) = 0;
        return v10 & v11;
      }
      return v10 & v11;
    }
LABEL_14:
    LOBYTE(v10) = 0;
    v11 = 0;
    return v10 & v11;
  }
  if (!objc_msgSend(a4, "isValid") || !objc_msgSend(a4, "isRange"))
    goto LABEL_14;
  v15 = objc_msgSend(a4, "range");
  v17 = v16;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "preSmartSet"), "characterIsMember:", objc_msgSend(a3, "characterAtIndex:", v15)) & 1) != 0|| (v28 = objc_msgSend(a3, "wordAtCharIndex:includePreviousWord:", v15, 0), LOBYTE(v10) = 0, v11 = 0, v28 == v15)&& (v29 = TSWPCJKLanguageForInputLanguageString((void *)objc_msgSend(a3, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v15, 1, 1, 0)), LOBYTE(v10) = 0, v11 = 0, v29 == 6))
  {
    v18 = objc_msgSend(a3, "characterAtIndex:", v15 + v17 - 1);
    if ((IsParagraphBreakingCharacter(v18) & 1) != 0)
      goto LABEL_16;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "postSmartSet"), "characterIsMember:", v18) & 1) == 0)
    {
      v11 = 1;
      v30 = objc_msgSend(a3, "wordAtCharIndex:includePreviousWord:", v15 + v17, 1);
      LOBYTE(v10) = 0;
      if (!v31 || v30 + v31 != v15 + v17)
        return v10 & v11;
      v11 = 1;
      if (TSWPCJKLanguageForInputLanguageString((void *)objc_msgSend(a3, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v15 + v17 - 1, 1, 1, 0)) != 6)goto LABEL_35;
    }
    v19 = a3;
    v20 = v15;
    v21 = v17;
LABEL_28:
    v10 = objc_msgSend(v19, "isAllWhitespaceInRange:", v20, v21) ^ 1;
    v11 = v10;
  }
  return v10 & v11;
}

- (BOOL)p_selectionIsSimpleInsertionPoint
{
  _BOOL4 v3;

  v3 = -[TSWPSelection isInsertionPoint](self->_selection, "isInsertionPoint");
  if (v3)
    LOBYTE(v3) = -[TSWPSelection type](self->_selection, "type") != 3
              && -[TSWPSelection type](self->_selection, "type") != 5
              && -[TSWPSelection type](self->_selection, "type") != 4
              && -[TSWPStorage length](self->_storage, "length") != 0;
  return v3;
}

- (BOOL)p_canSelectAllWithSender:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v10;

  if (!+[TSDCanvasEditor physicalKeyboardIsSender:](TSDCanvasEditor, "physicalKeyboardIsSender:", a3))
    return -[TSWPEditingController p_selectionIsSimpleInsertionPoint](self, "p_selectionIsSimpleInsertionPoint");
  if (-[TSWPSelection isValid](self->_selection, "isValid"))
  {
    v4 = -[TSWPSelection range](self->_selection, "range");
    v6 = v5;
    if (v4 != -[TSWPStorage range](self->_storage, "range") || v6 != v7)
      return 1;
    v10 = -[TSWPSelection type](self->_selection, "type") == 0;
  }
  else
  {
    v10 = -[TSWPStorage length](self->_storage, "length") == 0;
  }
  return !v10;
}

- (BOOL)p_canInsertBreak
{
  if (-[TSWPEditingController p_canEditTextString](self, "p_canEditTextString")
    && -[TSWPSelection isValid](self->_selection, "isValid"))
  {
    -[TSWPSelection isInsertionPoint](self->_selection, "isInsertionPoint");
  }
  return 1;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  _BOOL4 v7;
  _BOOL4 v8;
  int v10;
  BOOL v11;
  TSWPStorage *storage;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v7 = +[TSDCanvasEditor physicalKeyboardIsSender:](TSDCanvasEditor, "physicalKeyboardIsSender:", a4);
  if (-[TSWPEditingController p_canEditTextString](self, "p_canEditTextString"))
  {
    v8 = -[TSWPSelection isValid](self->_selection, "isValid");
    if (sel_deleteObject_ == a3)
    {
      if (!v8)
        return -1;
LABEL_23:
      if (-[TSWPSelection type](self->_selection, "type") != 4)
      {
        v8 = -[TSWPSelection isRange](self->_selection, "isRange");
LABEL_36:
        v11 = !v8;
LABEL_37:
        if (v11)
          return -1;
        else
          return 1;
      }
      return -1;
    }
  }
  else
  {
    if (sel_deleteObject_ == a3)
      return -1;
    v8 = 0;
  }
  if (sel_delete_ == a3)
  {
    if (!v8 || !v7)
      return -1;
    goto LABEL_23;
  }
  if (sel_copy_ == a3)
  {
    if (!-[TSWPSelection isValid](self->_selection, "isValid")
      || -[TSWPSelection type](self->_selection, "type") == 3
      || -[TSWPSelection type](self->_selection, "type") == 5
      || -[TSWPSelection type](self->_selection, "type") == 4
      || -[TSWPSelection isInsertionPoint](self->_selection, "isInsertionPoint"))
    {
      v10 = 0;
    }
    else
    {
      v10 = !-[TSWPEditingController pIsSelectionPlaceHolderText](self, "pIsSelectionPlaceHolderText");
    }
    v11 = (v7 & v10) == 0;
    goto LABEL_37;
  }
  if (sel_select_ == a3)
  {
    if (!v7)
      return -1;
LABEL_33:
    v8 = -[TSWPEditingController p_selectionIsSimpleInsertionPoint](self, "p_selectionIsSimpleInsertionPoint");
    goto LABEL_36;
  }
  if (sel_customSelect_ == a3)
    goto LABEL_33;
  if (sel_selectAll_ == a3)
  {
    if (!v7)
      return -1;
LABEL_35:
    v8 = -[TSWPEditingController p_canSelectAllWithSender:](self, "p_canSelectAllWithSender:", a4);
    goto LABEL_36;
  }
  if (sel_customSelectAll_ == a3)
    goto LABEL_35;
  if (sel_replaceWithSuggestion0_ == a3
    || sel_replaceWithSuggestion1_ == a3
    || sel_replaceWithSuggestion2_ == a3
    || sel_replaceWithSuggestion3_ == a3
    || sel_replaceWithSuggestion4_ == a3
    || sel_noReplacementsFound_ == a3)
  {
    goto LABEL_36;
  }
  if (sel_definitionAction_ == a3)
  {
    storage = self->_storage;
    v13 = -[TSWPSelection range](self->_selection, "range");
    if (-[TSWPStorage hasSmartFieldsInRange:](storage, "hasSmartFieldsInRange:", v13, v14))
      return -1;
    if (!-[TSWPSelection isRange](self->_selection, "isRange"))
      return -1;
    v15 = -[TSWPEditingController rangeOfWordEnclosingCharIndex:backward:](self, "rangeOfWordEnclosingCharIndex:backward:", -[TSWPSelection range](self->_selection, "range"), 0);
    v17 = v16;
    v18 = -[TSWPSelection range](self->_selection, "range");
    if (v15 > v18)
      return -1;
    v11 = v15 + v17 < v18 + v19;
    goto LABEL_37;
  }
  if (sel_endEditingAndSelectParent_ == a3)
    return (-[TSWPStorage wpKind](self->_storage, "wpKind") & 0xFFFFFFFE) == 2;
  else
    return -[TSWPEditingController p_canPerformOptInEditorAction:withSender:](self, "p_canPerformOptInEditorAction:withSender:", a3, a4);
}

- (int)p_canPerformOptInEditorAction:(SEL)a3 withSender:(id)a4
{
  -[TSWPEditingController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  return 0;
}

- (id)styleProvider
{
  uint64_t v3;
  __objc2_class *v4;

  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v3 = TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (__objc2_class *)v3;
  else
    v4 = TSWPStorageStyleProvider;
  return (id)-[__objc2_class styleProviderForStorage:](v4, "styleProviderForStorage:", self->_storage);
}

- (id)currentLayoutParent
{
  return 0;
}

- (id)stringFromSelection
{
  TSWPStorage *storage;
  uint64_t v4;
  uint64_t v5;

  storage = self->_storage;
  v4 = -[TSWPSelection superRange](self->_selection, "superRange");
  return -[TSWPStorage stringEquivalentFromRange:withLayoutParent:](storage, "stringEquivalentFromRange:withLayoutParent:", v4, v5, -[TSWPEditingController currentLayoutParent](self, "currentLayoutParent"));
}

- (void)copy:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (-[TSWPSelection isRange](self->_selection, "isRange", a3))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (-[TSWPStorage stylesheet](self->_storage, "stylesheet"))
    {
      v5 = -[TSWPSelection range](self->_selection, "range");
      v7 = -[TSWPStorage nsAttributedSubstringFromRange:scale:](self->_storage, "nsAttributedSubstringFromRange:scale:", v5, v6, 1.0);
      v8 = objc_msgSend(v7, "tsu_RTFFromRange:documentAttributes:", 0, objc_msgSend(v7, "length"), 0);
      if (v8)
        objc_msgSend(v4, "setObject:forKey:", v8, *MEMORY[0x24BDC1850]);
    }
    v9 = -[TSWPStorage substringWithSelection:](-[TSWPEditingController storage](self, "storage"), "substringWithSelection:", -[TSWPEditingController selection](self, "selection"));
    objc_msgSend(v4, "setObject:forKey:", v9, *MEMORY[0x24BDC1898]);
    v11[0] = v4;
    v10 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard"), "setItems:", v10);

  }
}

- (BOOL)selectionIsOnEmptyParagraph
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[TSWPSelection isValid](self->_selection, "isValid");
  if (v3)
  {
    -[TSWPSelection range](self->_selection, "range");
    if (v4)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v5 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", -[TSWPSelection start](self->_selection, "start"));
      LOBYTE(v3) = v6 == (v5 + v6 != -[TSWPStorage length](self->_storage, "length"));
    }
  }
  return v3;
}

- (BOOL)canSetWritingDirection:(int)a3
{
  int v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = -[TSWPEditingController p_canEditTextString](self, "p_canEditTextString");
  if (!v5)
    return v5;
  v5 = -[TSWPSelection isValid](self->_selection, "isValid");
  if (!v5)
    return v5;
  v5 = objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "supportsRTL");
  if (!v5)
    return v5;
  if (-[TSWPSelection type](self->_selection, "type") == 3
    || -[TSWPSelection type](self->_selection, "type") == 5
    || -[TSWPSelection type](self->_selection, "type") == 4)
  {
    goto LABEL_14;
  }
  if ((a3 + 1) > 2)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController canSetWritingDirection:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 7859, CFSTR("Unknown writing direction."));
    goto LABEL_14;
  }
  v6 = -[TSWPSelection start](self->_selection, "start");
  if (v6 > -[TSWPStorage length](self->_storage, "length"))
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = objc_msgSend((id)TSWPResolvePropertyForStyles(0, (uint64_t)-[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_storage, "paragraphStyleAtCharIndex:effectiveRange:", v6, 0), 44, 0), "intValue");
  if (v5 == -1)
  {
    v5 = -[TSWPStorage writingDirectionForParagraphAtCharIndex:](self->_storage, "writingDirectionForParagraphAtCharIndex:", v6);
    if (v5 == -1)
      v5 = objc_msgSend(-[TSWPStorage documentRoot](self->_storage, "documentRoot"), "isDirectionRightToLeft");
  }
  LOBYTE(v5) = v5 != a3;
  return v5;
}

- (int64_t)writingDirectionForCharIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;

  if (-[TSWPStorage length](self->_storage, "length") < a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController writingDirectionForCharIndex:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 7956, CFSTR("Bad char index into storage."));
  }
  if (-[TSWPStorage length](self->_storage, "length") >= a3)
  {
    v7 = -[TSWPStorage writingDirectionForParagraphAtCharIndex:](self->_storage, "writingDirectionForParagraphAtCharIndex:", a3)+ 1;
    if (v7 < 3)
      return v7 - 1;
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController writingDirectionForCharIndex:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 7973, CFSTR("Unknown writing direction."));
  }
  return -1;
}

- (BOOL)editorKeyboardLanguageIsRTL
{
  id v2;

  v2 = -[TSWPEditingController editorKeyboardLanguage](self, "editorKeyboardLanguage");
  return objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", v2) == 2;
}

- (void)referenceLibrarayViewControllerWasDismissed:(id)a3
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {

    self->_definitionViewController = 0;
    self->_definitionPopoverController = 0;
    -[TSDInteractiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:](self->_interactiveCanvasController, "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", 0);
  }
}

- (void)popoverControllerDidDismissPopoverBasedViewController:(id)a3
{
  TSWPEditingController *v3;

  v3 = self;

}

- (void)select:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  TSWPSelection *v8;

  v4 = -[TSWPStorage rangeForSelectionWithInsertionSelection:](self->_storage, "rangeForSelectionWithInsertionSelection:", self->_selection);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[TSWPSelection isValid](self->_selection, "isValid") && -[TSWPSelection start](self->_selection, "start"))
      v6 = -[TSWPSelection start](self->_selection, "start") - 1;
    else
      v6 = 0;
    v7 = 0;
  }
  else
  {
    v6 = v4;
    v7 = v5;
  }
  v8 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v6, v7);
  -[TSWPEditingController setSelection:withFlags:](self, "setSelection:withFlags:", -[TSWPEditingController logicalToVisualSelection:](self, "logicalToVisualSelection:", -[TSWPEditingController p_extendSelectionToIncludeSmartFields:](self, "p_extendSelectionToIncludeSmartFields:", v8)), 65792);

}

- (void)p_addInsertItemsIntoMenu:(id)a3
{
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  char *v11;

  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  TSUProtocolCast();
  if ((TSUPhoneUI() & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = -[TSWPEditingController acceptsTabs](self, "acceptsTabs");
    v6 = -[TSWPEditingController acceptsLineBreaks](self, "acceptsLineBreaks") + v5;
    v7 = -[TSWPEditingController acceptsColumnBreaks](self, "acceptsColumnBreaks");
    v8 = v6 + v7 + -[TSWPEditingController acceptsPageBreaks](self, "acceptsPageBreaks");
    if (v8 >= 2)
    {
      v9 = (void *)MEMORY[0x24BDF6BB8];
      v10 = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Insert"), &stru_24D82FEB0, CFSTR("TSText"));
      v11 = sel_showInsertBreak_;
LABEL_14:
      objc_msgSend(a3, "addObject:", objc_msgSend(v9, "menuItemWithTitle:action:", v10, v11));
      return;
    }
    if (v8 == 1)
    {
      if (-[TSWPEditingController acceptsTabs](self, "acceptsTabs"))
        objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Tab"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_insertTab_));
      if (-[TSWPEditingController acceptsLineBreaks](self, "acceptsLineBreaks"))
        objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Line Break"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_insertLineBreak_));
      if (-[TSWPEditingController acceptsColumnBreaks](self, "acceptsColumnBreaks"))
        objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Column Break"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_insertColumnBreak_));
      if (-[TSWPEditingController acceptsPageBreaks](self, "acceptsPageBreaks"))
      {
        v9 = (void *)MEMORY[0x24BDF6BB8];
        v10 = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Page Break"), &stru_24D82FEB0, CFSTR("TSTextPlatform"));
        v11 = sel_insertPageBreak_;
        goto LABEL_14;
      }
    }
  }
}

- (void)p_addCommonEditItemsIntoMenu:(id)a3
{
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Select"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_customSelect_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Select All"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_customSelectAll_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Cut"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_cutObject_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_copyObject_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Paste"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_pasteObject_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDF6BB8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_24D82FEB0, CFSTR("TSTextPlatform")), sel_deleteObject_));
}

- (id)extraMenuItems
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");

  self->_suggestions = 0;
  if (!-[TSWPSelection isValid](self->_selection, "isValid")
    || -[TSWPSelection type](self->_selection, "type") != 3 && -[TSWPSelection type](self->_selection, "type") != 5
    || -[TSWPEditingController pIsSelectionPlaceHolderText](self, "pIsSelectionPlaceHolderText"))
  {
    -[TSWPStorage wpKind](-[TSWPEditingController storage](self, "storage"), "wpKind");
    -[TSWPEditingController p_addCommonEditItemsIntoMenu:](self, "p_addCommonEditItemsIntoMenu:", v3);
  }
  return v3;
}

- (void)replaceAction:(id)a3
{
  -[TSWPEditingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_switchToReplaceSelection, 0, 0.0);
}

- (void)definitionAction:(id)a3
{
  TSWPStorage *storage;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  TSWPReferenceLibraryViewController *v8;
  id v9;
  UIPopoverController *v10;
  uint64_t v11;
  uint64_t v12;
  CGRect v13;
  CGRect v14;

  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    storage = self->_storage;
    v5 = -[TSWPSelection range](self->_selection, "range");
    v7 = -[TSWPStorage substringWithRange:](storage, "substringWithRange:", v5, v6);

    self->_definitionViewController = 0;
    v8 = -[UIReferenceLibraryViewController initWithTerm:]([TSWPReferenceLibraryViewController alloc], "initWithTerm:", v7);
    self->_definitionViewController = v8;
    -[TSWPReferenceLibraryViewController setDelegate:](v8, "setDelegate:", self);
    if (TSUPhoneUI())
    {
      -[TSDInteractiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:](self->_interactiveCanvasController, "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", 1);
      v9 = -[TSWPEditingController p_viewControllerForPresenting](self, "p_viewControllerForPresenting");
      if (!v9)
        v9 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSWPEditingController p_documentViewController](self, "p_documentViewController"), "view"), "window"), "rootViewController");
      objc_msgSend(v9, "presentViewController:animated:completion:", self->_definitionViewController, 1, 0);
    }
    else
    {

      self->_definitionPopoverController = 0;
      v10 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CA0]), "initWithContentViewController:", self->_definitionViewController);
      self->_definitionPopoverController = v10;
      v11 = -[TSWPSelection range](-[TSWPEditingController selection](self, "selection"), "range");
      -[TSWPEditingController p_firstRectForRange:actualRange:](self, "p_firstRectForRange:actualRange:", v11, v12, 0);
      v14 = CGRectIntegral(v13);
      -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v10, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), "view"), 15, 1, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
    }
  }
}

- (void)styleAction:(id)a3
{
  TSWPSelection *v4;
  uint64_t v5;
  uint64_t v6;
  TSWPSelection *v7;

  v4 = [TSWPSelection alloc];
  v5 = -[TSWPSelection superRange](self->_selection, "superRange");
  v7 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:](v4, "initWithType:range:styleInsertionBehavior:caretAffinity:", 4, v5, v6, -[TSWPSelection styleInsertionBehavior](self->_selection, "styleInsertionBehavior"), -[TSWPSelection caretAffinity](self->_selection, "caretAffinity"));
  -[TSWPEditingController setSelection:](self, "setSelection:", v7);

  -[TSDInteractiveCanvasController layoutInvalidated](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
  self->_showNextEditMenu = 1;
}

- (void)p_switchToReplaceSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TSWPSelection *v7;

  if (!-[TSWPSelection isRange](self->_selection, "isRange"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_switchToReplaceSelection]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 8589, CFSTR("shouldn't change an insertion point to a replacement selection"));
  }
  v5 = -[TSWPEditingController rangeOfWordEnclosingCharIndex:backward:](self, "rangeOfWordEnclosingCharIndex:backward:", -[TSWPSelection range](self->_selection, "range"), 0);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 3, v5, v6, -[TSWPSelection styleInsertionBehavior](self->_selection, "styleInsertionBehavior"), -[TSWPSelection caretAffinity](self->_selection, "caretAffinity"));
    -[TSWPEditingController setSelection:](self, "setSelection:", v7);

  }
}

- (void)selectAll:(id)a3
{
  TSWPSelection *v5;
  TSWPStorage *storage;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TSWPSelection *v11;

  v5 = [TSWPSelection alloc];
  storage = self->_storage;
  if (-[TSWPSelection isValid](self->_selection, "isValid"))
    v7 = -[TSWPSelection start](self->_selection, "start");
  else
    v7 = 0;
  v8 = -[TSWPStorage selectionRangeForCharIndex:](storage, "selectionRangeForCharIndex:", v7);
  v11 = -[TSWPSelection initWithRange:](v5, "initWithRange:", v8, v9);
  if (+[TSDCanvasEditor physicalKeyboardIsSender:](TSDCanvasEditor, "physicalKeyboardIsSender:", a3))
    v10 = 0;
  else
    v10 = 0x10000;
  -[TSWPEditingController setSelection:withFlags:](self, "setSelection:withFlags:", v11, v10);

}

- (BOOL)p_isTextInputEditor
{
  return -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self->_interactiveCanvasController, "editorController"), "textInputEditor") == self;
}

- (id)currentFontColor
{
  unint64_t v3;
  id v4;
  id v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  if (-[TSWPSelection isValid](self->_selection, "isValid"))
    v3 = -[TSWPSelection start](self->_selection, "start");
  else
    v3 = 0;
  v4 = -[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:](self->_storage, "characterStyleAtCharIndex:left:effectiveRange:", v3, -[TSWPSelection isInsertionPoint](self->_selection, "isInsertionPoint"), 0);
  v5 = -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_storage, "paragraphStyleAtCharIndex:effectiveRange:", v3, 0);
  v7[0] = self->_insertionStyle;
  v7[1] = v4;
  v7[2] = v5;
  return (id)TSWPResolvePropertyForStyles((uint64_t)v7, 3uLL, 18, 0);
}

- (BOOL)canHighlightCurrentSelection
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  _BOOL4 v7;

  v3 = -[TSWPEditingController p_canEditTextString](self, "p_canEditTextString");
  v4 = -[TSWPEditingController canShowCommentForCurrentSelectionGetHighlight:range:](self, "canShowCommentForCurrentSelectionGetHighlight:range:", 0, 0);
  if (-[TSWPSelection isValid](self->_selection, "isValid"))
  {
    objc_msgSend(-[TSWPEditingController p_highlightSelectionForSelection:](self, "p_highlightSelectionForSelection:", self->_selection), "range");
    if (v5)
      v6 = !v4;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v3 & v6 & -[TSWPStorage highlightsAllowed](-[TSWPEditingController storage](self, "storage"), "highlightsAllowed");
  return !self->_hostEditor && v7;
}

- (BOOL)canShowCommentForCurrentSelectionGetHighlight:(id *)a3 range:(_NSRange *)a4
{
  uint64_t v7;
  TSWPStorage *storage;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _NSRange v12;
  unint64_t v13;
  uint64_t v14;
  _NSRange v16;

  LODWORD(v7) = -[TSWPEditingController p_canEditTextString](self, "p_canEditTextString");
  if ((_DWORD)v7)
  {
    LODWORD(v7) = -[TSWPSelection isValid](self->_selection, "isValid");
    if ((_DWORD)v7)
    {
      LODWORD(v7) = -[TSWPStorage highlightsAllowed](-[TSWPEditingController storage](self, "storage"), "highlightsAllowed");
      if ((_DWORD)v7)
      {
        storage = self->_storage;
        v9 = -[TSWPSelection superRange](self->_selection, "superRange");
        v7 = -[TSWPStorage firstHighlightForSelectionRange:outRange:](storage, "firstHighlightForSelectionRange:outRange:", v9, v10, &v16);
        if (v7)
        {
          v11 = (void *)v7;
          v12 = v16;
          v13 = -[TSWPSelection superRange](self->_selection, "superRange");
          if (v12.location <= v13 && v12.length + v12.location >= v13 + v14)
          {
            if (a3)
              *a3 = v11;
            if (a4)
              *a4 = v16;
            LOBYTE(v7) = 1;
          }
          else
          {
            LOBYTE(v7) = 0;
          }
        }
      }
    }
  }
  return v7;
}

- (BOOL)canRemoveHighlightForCurrentSelection
{
  _BOOL4 v3;
  TSWPStorage *storage;
  uint64_t v5;
  uint64_t v6;

  v3 = -[TSWPEditingController p_canEditTextString](self, "p_canEditTextString");
  if (v3)
  {
    v3 = -[TSWPSelection isValid](self->_selection, "isValid");
    if (v3)
    {
      v3 = -[TSWPStorage highlightsAllowed](-[TSWPEditingController storage](self, "storage"), "highlightsAllowed");
      if (v3)
      {
        storage = self->_storage;
        v5 = -[TSWPSelection superRange](self->_selection, "superRange");
        LOBYTE(v3) = -[TSWPStorage firstHighlightForSelectionRange:outRange:](storage, "firstHighlightForSelectionRange:outRange:", v5, v6, 0) != 0;
      }
    }
  }
  return v3;
}

- (BOOL)canAddOrShowComment
{
  _BOOL4 v3;

  v3 = -[TSWPSelection isValid](self->_selection, "isValid");
  if (v3)
    LOBYTE(v3) = -[TSWPEditingController canRemoveHighlightForCurrentSelection](self, "canRemoveHighlightForCurrentSelection")|| -[TSWPEditingController canHighlightCurrentSelection](self, "canHighlightCurrentSelection");
  return v3;
}

- (BOOL)canAcceptOrRejectChange
{
  return 0;
}

- (id)p_highlightSelectionForSelection:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(a3, "isInsertionPoint"))
    v5 = -[TSWPStorage rangeForSelectionWithInsertionSelection:](self->_storage, "rangeForSelectionWithInsertionSelection:", a3);
  else
    v5 = objc_msgSend(a3, "superRange");
  return +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v5, v6);
}

- (void)beginAutomaticTextEditingIfNeededForPoint:(CGPoint)a3
{
  double y;
  double x;
  TSWPInteractiveCanvasController *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  v5 = -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:", x, y);
  v6 = -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v5, "hitRep:withGesture:passingTest:", 0, &__block_literal_global_726);
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isEditing") & 1) == 0)
    -[TSDInteractiveCanvasController beginEditingRep:](v5, "beginEditingRep:", v6);
}

BOOL __67__TSWPEditingController_beginAutomaticTextEditingIfNeededForPoint___block_invoke(uint64_t a1, void *a2)
{
  return (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(a2, "containsText") & 1) != 0;
}

- (BOOL)allowAutomaticTextEditingToBeginWithDifferentEditor
{
  return !-[TSWPSelection isValid](self->_selection, "isValid")
      || -[TSWPSelection isInsertionPoint](self->_selection, "isInsertionPoint");
}

- (unint64_t)closestCharIndexToPoint:(CGPoint)a3 isAtEndOfLine:(BOOL *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", a3.x, a3.y);
  v7 = v6;
  v9 = v8;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, v7, v9);
  v10 = (void *)TSUDynamicCast();
  objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v7, v9);
  return -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v10, 1, a4, 0);
}

- (unint64_t)p_charIndexAtPoint:(CGPoint)a3 isAtEndOfLine:(BOOL *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", a3.x, a3.y);
  v7 = v6;
  v9 = v8;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, v7, v9);
  v10 = (void *)TSUDynamicCast();
  objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v7, v9);
  return -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:", v10, 0, 1, a4);
}

- (BOOL)p_isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int)a5 inDirection:(int64_t)a6
{
  _BOOL8 v8;
  uint64_t v11;
  CFIndex v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  CFIndex v18;
  CFIndex v19;
  BOOL v20;
  int v21;
  uint64_t v22;
  NSUInteger location;
  NSUInteger v24;
  NSUInteger length;
  NSUInteger v26;
  NSRange v27;
  const __CFAllocator *v28;
  const __CFString *v29;
  __CFStringTokenizer *v30;
  CFRange CurrentTokenRange;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  unint64_t v42;
  CFIndex *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  BOOL result;
  uint64_t v48;
  int v50;
  unint64_t v52;
  int v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  NSRange v61;
  NSRange v62;
  CFRange v63;

  v8 = a4;
  v60 = *MEMORY[0x24BDAC8D0];
  v11 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  v13 = v11 + v12;
  if (a3)
    v14 = a3 - (v11 + v12 == a3);
  else
    v14 = 0;
  if (v14 >= v13)
    return 0;
  v15 = v11;
  switch(a5)
  {
    case 0:
      v16 = objc_msgSend(-[TSWPStorage string](self->_storage, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v14);
      goto LABEL_41;
    case 1:
      if ((unint64_t)a6 > 1)
      {
        v44 = -[TSWPEditingController p_writingDirectionForCharAtIndex:](self, "p_writingDirectionForCharAtIndex:", v14);
        v45 = 2;
        if (v44 == 1)
          v45 = 3;
        v20 = v45 == a6;
      }
      else
      {
        v20 = a6 == 0;
      }
      v46 = v20;
      v16 = -[TSWPEditingController rangeOfWordEnclosingCharIndex:backward:](self, "rangeOfWordEnclosingCharIndex:backward:", v14, v46);
LABEL_41:
      v19 = v16;
      v18 = v17;
      goto LABEL_52;
    case 2:
      v21 = a5;
      v22 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", a3);
      location = v22;
      length = v24;
      if (a3 && v22 == a3)
      {
        v62.location = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", a3 - 1);
        v62.length = v26;
        v61.location = location;
        v61.length = length;
        v27 = NSUnionRange(v61, v62);
        location = v27.location;
        length = v27.length;
      }
      v28 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v29 = -[TSWPStorage string](self->_storage, "string");
      v63.location = location;
      v63.length = length;
      v30 = CFStringTokenizerCreate(v28, v29, v63, 1uLL, 0);
      if (CFStringTokenizerGoToTokenAtIndex(v30, a3))
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
        v19 = CurrentTokenRange.location;
        v18 = CurrentTokenRange.length;
      }
      else
      {
        v19 = *MEMORY[0x24BEB3BF0];
        v18 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
      }
      CFRelease(v30);
      a5 = v21;
      goto LABEL_52;
    case 3:
      v19 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", a3);
      if (v32)
        v18 = v32
            - IsParagraphBreakingCharacter(-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v32 + v19 - 1));
      else
        v18 = 0;
      goto LABEL_52;
    case 4:
      v53 = a5;
      v54 = v11;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v33 = (void *)objc_msgSend(-[TSWPEditingController p_layoutTargetForCharIndex:eolAffinity:](self, "p_layoutTargetForCharIndex:eolAffinity:", a3, v8), "columns");
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (!v34)
      {
        v18 = 0;
        v19 = 0x7FFFFFFFFFFFFFFFLL;
        v15 = v54;
        goto LABEL_52;
      }
      v35 = v34;
      v52 = a6;
      v36 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v56 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          v39 = objc_msgSend(v38, "range", v52);
          v41 = v14 < v39 || v14 - v39 >= v40;
          if (!v41 || v8 && v14 == v39 + v40)
          {
            v42 = objc_msgSend(v38, "lineIndexForCharIndex:eol:", v14, v8);
            if (v42 > 0x7FFFFFFFFFFFFFFELL)
            {
              v18 = 0;
              v19 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              v43 = (CFIndex *)objc_msgSend(v38, "lineFragmentAtIndex:", v42);
              v19 = *v43;
              v18 = v43[1];
            }
            goto LABEL_47;
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        v18 = 0;
        v19 = 0x7FFFFFFFFFFFFFFFLL;
        if (v35)
          continue;
        break;
      }
LABEL_47:
      a5 = v53;
      a6 = v52;
      v15 = v54;
      if (v53 != 5)
      {
LABEL_52:
        result = v19 + v18 == a3;
        if (v19 != a3 && v19 + v18 != a3)
          return 0;
        switch(a5)
        {
          case 0:
          case 2:
            if (a6 == 1)
            {
              if (v13 == a3)
                return 0;
            }
            else if (!a6 && v15 == a3)
            {
              return 0;
            }
            return (unint64_t)(a6 - 6) < 0xFFFFFFFFFFFFFFFELL;
          case 1:
          case 4:
            if ((unint64_t)a6 > 1)
            {
              v50 = -[TSWPEditingController p_writingDirectionForCharAtIndex:](self, "p_writingDirectionForCharAtIndex:", a3);
              v48 = 2;
              if (v50 == 1)
                v48 = 3;
              if (v19 == a3)
                return (a6 & 0xFFFFFFFFFFFFFFFELL) == 2 && v48 != a6;
            }
            else
            {
              v48 = v19 == a3;
            }
            return v48 == a6;
          case 3:
            if (v15 == a3 && (unint64_t)a6 <= 5 && ((1 << a6) & 0x25) != 0
              || v13 == a3 && (unint64_t)a6 <= 4 && ((1 << a6) & 0x1A) != 0)
            {
              return 0;
            }
            if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 1)
              return v19 == a3;
            if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 0)
              return result;
            return 0;
          default:
            return 0;
        }
      }
      if (v54 == a3 && v52 <= 4 && ((1 << v52) & 0x1A) != 0)
        return 1;
      if (v13 != a3 || v52 >= 6)
        return 0;
      else
        return (0x25u >> v52) & 1;
    default:
      v18 = v12;
      v53 = a5;
      v52 = a6;
      v54 = v11;
      v19 = v11;
      goto LABEL_47;
  }
}

- (id)p_layoutTargetForCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4
{
  TSWPSelection *v5;
  TSWPInteractiveCanvasController *v6;
  TSWPStorage *storage;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v5 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, a3, 0, 0, a4);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  v16 = 0;
  v6 = -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
  storage = self->_storage;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__TSWPEditingController_p_layoutTargetForCharIndex_eolAffinity___block_invoke;
  v10[3] = &unk_24D82B618;
  v10[4] = &v11;
  -[TSWPInteractiveCanvasController withLayoutForModel:withSelection:performBlock:](v6, "withLayoutForModel:withSelection:performBlock:", storage, v5, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

id __64__TSWPEditingController_p_layoutTargetForCharIndex_eolAffinity___block_invoke(uint64_t a1)
{
  id result;

  result = (id)TSUProtocolCast();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (unint64_t)p_MoveByLineRange:(_NSRange)a3 up:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v8 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  if (v4)
  {
    v10 = location;
    if (location > v8)
    {
      v10 = location - 1;
      v11 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", location - 1);
      v12 = v11;
      v13 = IsParagraphBreakingCharacter(v11);
      if (v12 != 8232
        && (v13 & 1) == 0
        && !objc_msgSend(-[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", location - 1), "isPartitioned"))
      {
        return location;
      }
    }
  }
  else
  {
    v10 = location + length;
    v14 = v10 <= v8 || v10 >= v8 + v9;
    if (!v14
      && objc_msgSend(-[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", v10), "isPartitioned"))
    {
      v15 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v10 - 1);
      v16 = v15;
      LODWORD(v17) = IsParagraphBreakingCharacter(v15) ^ 1;
      if (v16 == 8232)
        v17 = 0;
      else
        v17 = v17;
      v10 += v17;
    }
  }
  return v10;
}

- (unint64_t)p_lineIndexForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = -[TSWPEditingController p_layoutTargetForCharIndex:eolAffinity:](self, "p_layoutTargetForCharIndex:eolAffinity:", a3, a5);
  *a4 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (void *)objc_msgSend(v8, "columns", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "range");
        if (a3 - v15 < v16 && a3 >= v15 || v15 + v16 == a3)
        {
          result = objc_msgSend(v14, "lineIndexForCharIndex:eol:", a3, v5);
          if (result <= 0x7FFFFFFFFFFFFFFELL)
          {
            *a4 = v14;
            return result;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)invalidateSelectionVisualRuns
{
  unint64_t v3;
  TSWPSelection *selection;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (-[TSWPSelection isVisual](self->_selection, "isVisual")
    && -[TSWPSelection validVisualRanges](self->_selection, "validVisualRanges"))
  {
    v3 = -[TSWPSelection visualRangeCount](self->_selection, "visualRangeCount");
    selection = self->_selection;
    if (v3 < 2)
    {
      v7 = -[TSWPSelection superRange](self->_selection, "superRange");
      v5 = -[TSWPSelection copyWithNewType:range:](selection, "copyWithNewType:range:", 0, v7, v8);
      v6 = 0x800000;
    }
    else
    {
      v5 = -[TSWPSelection copyWithNewType:](self->_selection, "copyWithNewType:", 7);
      v6 = 0;
    }
    -[TSWPEditingController p_setSelection:withFlags:force:](self, "p_setSelection:withFlags:force:", v5, v6, 1);
  }
}

- (id)calculateVisualRunsFromSelection:(id)a3 updateControllerSelection:(BOOL)a4
{
  _BOOL4 v4;
  TSWPSelection *v5;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  TSWPStorage *storage;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  TSWPLineFragment *v14;
  TSWPLineFragment *v15;
  unint64_t v16;
  uint64_t v17;
  TSWPLineFragment *v18;
  unint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  BOOL v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  _BOOL4 v30;
  unsigned int v31;
  char *v32;
  NSUInteger v33;
  NSUInteger v34;
  BOOL v35;
  _BOOL4 v36;
  int v37;
  unint64_t v38;
  unint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  TSWPStorage *v45;
  unint64_t v46;
  NSUInteger v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  NSUInteger v51;
  BOOL v52;
  unint64_t v53;
  NSUInteger v54;
  TSWPSelection *v55;
  TSWPSelection *v56;
  TSWPSelection *v57;
  NSUInteger v59;
  uint64_t v60;
  char *v61;
  char *v62;
  __int128 v63;
  uint64_t v64;
  char v65;
  int v66;
  unsigned int v67;
  char *v68;
  NSUInteger v69;
  NSUInteger v70;
  int v72;
  unint64_t v73;
  unint64_t v74;
  NSUInteger v75;
  NSUInteger v76;
  unint64_t v77;
  unint64_t v78;
  _BOOL4 v79;
  _BOOL4 v80;
  _BOOL4 v81;
  TSWPLineFragment *v82;
  uint64_t *v83;
  __int16 v84;
  unint64_t v85;
  _NSRange v86;
  _NSRange v87;
  __int128 v88;
  BOOL v89;
  void *__p;
  char *v91;
  uint64_t v92;
  TSWPRangeVector v93;
  _QWORD v94[2];

  v4 = a4;
  v5 = (TSWPSelection *)a3;
  if ((objc_msgSend(a3, "validVisualRanges") & 1) != 0 || -[TSWPSelection isInsertionPoint](v5, "isInsertionPoint"))
    return v5;
  v94[0] = 0;
  v7 = -[TSWPSelection start](v5, "start");
  if (v7 <= -[TSWPStorage range](self->_storage, "range"))
    v8 = -[TSWPStorage range](self->_storage, "range");
  else
    v8 = -[TSWPSelection start](v5, "start");
  v9 = v8;
  storage = self->_storage;
  v11 = -[TSWPSelection end](v5, "end");
  if (v11 >= -[TSWPStorage characterCount](self->_storage, "characterCount"))
    v12 = -[TSWPStorage characterCount](self->_storage, "characterCount");
  else
    v12 = -[TSWPSelection end](v5, "end");
  v13 = -[TSWPStorage previousCharacterIndex:](storage, "previousCharacterIndex:", v12);
  memset(&v93, 0, sizeof(v93));
  v14 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v9, v94, 0);
  v15 = 0;
  if (-[TSWPSelection type](v5, "type") == 7 && v14)
  {
    if (-[TSWPSelection isRange](v5, "isRange"))
    {
      v16 = TSWPLineFragment::visualIndexForCharIndex(v14, v9);
      -[TSWPSelection range](v5, "range");
      if (!v17)
      {
        v13 = -[TSWPSelection end](v5, "end");
        v85 = v9;
        v15 = v14;
        goto LABEL_97;
      }
      v18 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v13, v94, 0);
      v15 = v18;
      if (v18)
      {
        v19 = TSWPLineFragment::visualIndexForCharIndex(v18, v13);
        __p = 0;
        v91 = 0;
        v92 = 0;
        TSWPLineFragment::fillWritingDirectionRuns((uint64_t *)v14, &__p);
        v20 = (char *)__p;
        v21 = v91;
        v79 = v4;
        if (__p == v91)
        {
          v21 = (char *)__p;
          if ((*((_DWORD *)v14 + 6) & 0x800) != 0)
          {
            v22 = *(_OWORD *)v14;
            v89 = (*((_DWORD *)v14 + 6) & 0x1000) == 0;
            v88 = v22;
            v87 = (_NSRange)vdupq_lane_s64(v22, 0);
            std::vector<TSWPLFWritingDirectionRun>::push_back[abi:nn180100](&__p, (__int128 *)&v87);
            v20 = (char *)__p;
            v21 = v91;
          }
        }
        v82 = v14;
        v83 = (uint64_t *)v15;
        v23 = v14 == v15;
        v24 = v16 > v19;
        v25 = !v23 || !v24;
        if (v23 && v24)
          v26 = v13;
        else
          v26 = v9;
        v85 = v26;
        if (!v25)
          v13 = v9;
        if (v21 != v20)
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v30 = v14 == (TSWPLineFragment *)v83;
          v84 = *((_DWORD *)v14 + 6);
          if ((*((_DWORD *)v14 + 6) & 0x1000) == 0)
            v30 = 1;
          v80 = v14 != (TSWPLineFragment *)v83;
          v81 = v30;
          v31 = 1;
          while (1)
          {
            v32 = &v20[40 * v27];
            v34 = *((_QWORD *)v32 + 2);
            v33 = *((_QWORD *)v32 + 3);
            v86.location = v34;
            v86.length = v33;
            v35 = v85 < v34 || v85 - v34 >= v33;
            v36 = !v35;
            if (v36)
              break;
LABEL_51:
            if (v13 >= v34 && v13 - v34 < v33)
            {
              if (*((_BYTE *)__p + 40 * v27 + 32))
              {
                v45 = self->_storage;
                if (v36)
                {
                  v46 = -[TSWPStorage nextCharacterIndex:](v45, "nextCharacterIndex:", v13);
                  v47 = v85;
                  if (v85 <= v46)
                    v48 = v46;
                  else
                    v48 = v85;
                  if (v85 >= v46)
                    v47 = v46;
                }
                else
                {
                  v50 = -[TSWPStorage nextCharacterIndex:](v45, "nextCharacterIndex:", v13);
                  if (v34 <= v50)
                    v48 = v50;
                  else
                    v48 = v34;
                  if (v34 >= v50)
                    v47 = v50;
                  else
                    v47 = v34;
                }
LABEL_75:
                v51 = v48 - v47;
                v86.location = v47;
              }
              else
              {
                if (v36)
                {
                  v49 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v85);
                  if (v13 <= v49)
                    v48 = v49;
                  else
                    v48 = v13;
                  if (v13 >= v49)
                    v47 = v49;
                  else
                    v47 = v13;
                  goto LABEL_75;
                }
                if (v13 <= v33 + v34)
                  v53 = v33 + v34;
                else
                  v53 = v13;
                if (v13 >= v33 + v34)
                  v54 = v33 + v34;
                else
                  v54 = v13;
                v51 = v53 - v54;
                v86.location = v54;
              }
              v86.length = v51;
              v29 = 1;
            }
            if ((v84 & 0x1000) != 0)
            {
              if (((v29 | v28) & 1) != 0 || v82 != (TSWPLineFragment *)v83)
                TSWPRangeVector::addRange(&v93, &v86);
              if (((v28 & v80 | v29) & 1) != 0)
              {
LABEL_110:
                if ((v29 & 1) == 0)
                  goto LABEL_111;
                goto LABEL_161;
              }
            }
            else
            {
              if ((v28 & 1) != 0)
                TSWPRangeVector::addRange(&v93, &v86);
              if ((v29 & 1) != 0)
                goto LABEL_161;
            }
            v27 = v31;
            v20 = (char *)__p;
            v52 = 0xCCCCCCCCCCCCCCCDLL * ((v91 - (_BYTE *)__p) >> 3) > v31++;
            if (!v52)
              goto LABEL_110;
          }
          v37 = v20[40 * v27 + 32];
          if (v81)
          {
            if (!v37)
              goto LABEL_37;
          }
          else if (v37)
          {
LABEL_37:
            v38 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v85);
            if (v34 <= v38)
              v39 = v38;
            else
              v39 = v34;
            if (v34 >= v38)
              v40 = v38;
            else
              v40 = v34;
            v41 = v39 - v40;
            v86.location = v40;
LABEL_50:
            v86.length = v41;
            v28 = 1;
            goto LABEL_51;
          }
          v42 = v85;
          if (v85 <= v33 + v34)
            v43 = v33 + v34;
          else
            v43 = v85;
          if (v85 >= v33 + v34)
            v42 = v33 + v34;
          v41 = v43 - v42;
          v86.location = v42;
          goto LABEL_50;
        }
LABEL_111:
        v59 = *((_QWORD *)v82 + 1) + *(_QWORD *)v82;
        if (v59 <= *v83)
          v60 = *v83;
        else
          v60 = *((_QWORD *)v82 + 1) + *(_QWORD *)v82;
        if (v59 >= *v83)
          v59 = *v83;
        v87.location = v59;
        v87.length = v60 - v59;
        TSWPRangeVector::addRange(&v93, &v87);
        v91 = (char *)__p;
        TSWPLineFragment::fillWritingDirectionRuns(v83, &__p);
        v61 = (char *)__p;
        v62 = v91;
        if (__p == v91)
        {
          if ((v83[3] & 0x800) == 0)
            goto LABEL_161;
          v63 = *(_OWORD *)v83;
          v89 = (v83[3] & 0x1000) == 0;
          v88 = v63;
          v87 = (_NSRange)vdupq_lane_s64(v63, 0);
          std::vector<TSWPLFWritingDirectionRun>::push_back[abi:nn180100](&__p, (__int128 *)&v87);
          v61 = (char *)__p;
          v62 = v91;
        }
        if (v62 != v61)
        {
          v64 = 0;
          v65 = 0;
          v66 = *((_DWORD *)v83 + 6);
          v67 = 1;
          while (1)
          {
            v68 = &v61[40 * v64];
            v70 = *((_QWORD *)v68 + 2);
            v69 = *((_QWORD *)v68 + 3);
            v86.location = v70;
            v86.length = v69;
            if (v13 >= v70 && v13 - v70 < v69)
              break;
            if ((v66 & 0x1000) == 0)
              goto LABEL_150;
            if ((v65 & 1) != 0)
              goto LABEL_159;
LABEL_151:
            v65 = 0;
LABEL_160:
            v64 = v67;
            v61 = (char *)__p;
            v52 = 0xCCCCCCCCCCCCCCCDLL * ((v91 - (_BYTE *)__p) >> 3) > v67++;
            if (!v52)
              goto LABEL_161;
          }
          v72 = v61[40 * v64 + 32];
          if ((v66 & 0x1000) != 0)
          {
            if (v72)
            {
              v76 = v69 + v70;
              if (v13 <= v69 + v70)
                v77 = v69 + v70;
              else
                v77 = v13;
              if (v13 < v69 + v70)
                v76 = v13;
            }
            else
            {
              v78 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v13);
              if (v70 <= v78)
                v77 = v78;
              else
                v77 = v70;
              if (v70 >= v78)
                v76 = v78;
              else
                v76 = v70;
            }
            v86.location = v76;
            v86.length = v77 - v76;
LABEL_159:
            TSWPRangeVector::addRange(&v93, &v86);
            v65 = 1;
            goto LABEL_160;
          }
          if (v72)
          {
            v73 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v13);
            if (v70 <= v73)
              v74 = v73;
            else
              v74 = v70;
            if (v70 >= v73)
              v75 = v73;
            else
              v75 = v70;
          }
          else
          {
            v75 = v69 + v70;
            if (v13 <= v69 + v70)
              v74 = v69 + v70;
            else
              v74 = v13;
            if (v13 < v69 + v70)
              v75 = v13;
          }
          v86.location = v75;
          v86.length = v74 - v75;
          v65 = 1;
LABEL_150:
          TSWPRangeVector::addRange(&v93, &v86);
          if ((v65 & 1) != 0)
            goto LABEL_161;
          goto LABEL_151;
        }
LABEL_161:
        if (__p)
        {
          v91 = (char *)__p;
          operator delete(__p);
        }
        v4 = v79;
        v14 = v82;
        v15 = (TSWPLineFragment *)v83;
        goto LABEL_97;
      }
    }
    else
    {
      v15 = 0;
    }
  }
  v85 = v9;
LABEL_97:
  if (v93.__end_ == v93.__begin_)
  {
    if (-[TSWPSelection isVisual](v5, "isVisual") && -[TSWPSelection isRange](v5, "isRange"))
      v55 = -[TSWPSelection copyWithNewType:](v5, "copyWithNewType:", 0);
    else
      v55 = v5;
  }
  else
  {
    v55 = -[TSWPSelection copyWithVisualRanges:startChar:endChar:rightToLeft:sameLine:](v5, "copyWithVisualRanges:startChar:endChar:rightToLeft:sameLine:", &v93, v85, v13, -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtCharIndex:](self->_storage, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", -[TSWPSelection start](v5, "start")), v14 == v15);
  }
  v5 = v55;
  if (v4 && -[TSWPSelection isEqual:](self->_selection, "isEqual:", v55))
  {
    v56 = v5;

    self->_selection = v5;
  }
  v57 = v5;
  if (v93.__begin_)
  {
    v93.__end_ = v93.__begin_;
    operator delete(v93.__begin_);
  }
  return v5;
}

- (id)logicalToVisualSelection:(id)a3
{
  NSUInteger v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  NSUInteger location;
  _DWORD *v10;
  uint64_t *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  char *v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  NSUInteger v19;
  NSRange v20;
  BOOL v21;
  _BYTE *v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  NSRange v26;
  char *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  NSUInteger v31;
  NSRange v32;
  TSWPStorage *storage;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t *v41;
  TSWPEditingController *v42;
  void *__p;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSRange v48;
  NSRange v49;
  NSRange v50;

  -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
  v46 = 0;
  v47 = 0;
  v5 = objc_msgSend(a3, "start");
  v6 = objc_msgSend(a3, "end");
  v42 = self;
  v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v5, &v47, objc_msgSend(a3, "caretAffinity") == 1);
  if (objc_msgSend(a3, "type") || !v7)
    goto LABEL_60;
  objc_msgSend(a3, "range");
  if (!v8)
  {
    a3 = (id)objc_msgSend(a3, "copyWithNewType:", 7);
    goto LABEL_60;
  }
  location = v6 - 1;
  v10 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", location, &v46, 1);
  if (!v10)
    goto LABEL_60;
  v11 = (uint64_t *)v10;
  v12 = objc_msgSend(a3, "range");
  v14 = v13;
  __p = 0;
  v44 = 0;
  v45 = 0;
  if (v7 == v11)
  {
    TSWPLineFragment::fillWritingDirectionRuns(v7, &__p);
    v22 = __p;
    if (v44 == __p)
      goto LABEL_45;
    v23 = 0;
    v24 = 0;
    v25 = 1;
    while (1)
    {
      v49.location = v12;
      v49.length = v14;
      v26 = NSIntersectionRange(*(NSRange *)&v22[40 * v23 + 16], v49);
      v22 = __p;
      if ((v24 & 1) == 0 && v26.length)
      {
        if (!*((_BYTE *)__p + 40 * v23 + 32))
        {
          v5 = -[TSWPStorage previousCharacterIndex:](v42->_storage, "previousCharacterIndex:", v26.location + v26.length);
          v24 = 1;
          v22 = __p;
LABEL_23:
          if (v26.length)
          {
            if (v22[40 * v23 + 32])
            {
              location = -[TSWPStorage previousCharacterIndex:](v42->_storage, "previousCharacterIndex:", v26.location + v26.length);
              v22 = __p;
            }
            else
            {
              location = v26.location;
            }
          }
          goto LABEL_28;
        }
        v24 = 1;
        v5 = v26.location;
      }
      if ((v24 & 1) != 0)
        goto LABEL_23;
LABEL_28:
      v23 = v25;
      v21 = 0xCCCCCCCCCCCCCCCDLL * ((v44 - v22) >> 3) > v25++;
      if (!v21)
        goto LABEL_45;
    }
  }
  TSWPLineFragment::fillWritingDirectionRuns(v7, &__p);
  v41 = v11;
  v15 = v44;
  if (v44 == __p)
    goto LABEL_33;
  v16 = 0;
  v17 = *((_DWORD *)v7 + 6);
  v18 = 1;
  v15 = (char *)__p;
  while (1)
  {
    v48.location = v12;
    v48.length = v14;
    v20 = NSIntersectionRange(*(NSRange *)&v15[40 * v16 + 16], v48);
    v19 = v20.location;
    if (v20.length)
      break;
LABEL_13:
    v16 = v18;
    v15 = (char *)__p;
    v21 = 0xCCCCCCCCCCCCCCCDLL * ((v44 - (_BYTE *)__p) >> 3) > v18++;
    if (!v21)
      goto LABEL_33;
  }
  v15 = (char *)__p;
  if ((v17 & 0x1000) != 0)
  {
    if (*((_BYTE *)__p + 40 * v16 + 32))
      v19 = -[TSWPStorage previousCharacterIndex:](v42->_storage, "previousCharacterIndex:", v20.location + v20.length);
    v5 = v19;
    goto LABEL_13;
  }
  if (*((_BYTE *)__p + 40 * v16 + 32))
  {
    v5 = v20.location;
  }
  else
  {
    v5 = -[TSWPStorage previousCharacterIndex:](v42->_storage, "previousCharacterIndex:", v20.location + v20.length);
    v15 = (char *)__p;
  }
LABEL_33:
  v44 = v15;
  TSWPLineFragment::fillWritingDirectionRuns(v41, &__p);
  v27 = (char *)__p;
  if (v44 == __p)
    goto LABEL_45;
  v28 = 0;
  v29 = *((_DWORD *)v41 + 6);
  v30 = 1;
  while (2)
  {
    v50.location = v12;
    v50.length = v14;
    v32 = NSIntersectionRange(*(NSRange *)&v27[40 * v28 + 16], v50);
    v31 = v32.location;
    if (!v32.length)
    {
LABEL_40:
      v28 = v30;
      v27 = (char *)__p;
      v21 = 0xCCCCCCCCCCCCCCCDLL * ((v44 - (_BYTE *)__p) >> 3) > v30++;
      if (!v21)
        goto LABEL_45;
      continue;
    }
    break;
  }
  if ((v29 & 0x1000) == 0)
  {
    if (*((_BYTE *)__p + 40 * v28 + 32))
      v31 = -[TSWPStorage previousCharacterIndex:](v42->_storage, "previousCharacterIndex:", v32.location + v32.length);
    location = v31;
    goto LABEL_40;
  }
  if (!*((_BYTE *)__p + 40 * v28 + 32))
    v31 = -[TSWPStorage previousCharacterIndex:](v42->_storage, "previousCharacterIndex:", v32.location + v32.length);
  location = v31;
LABEL_45:
  storage = v42->_storage;
  if (v5 <= location)
  {
    v37 = -[TSWPStorage nextCharacterIndex:](storage, "nextCharacterIndex:", location);
    if (v5 <= v37)
      v35 = v37;
    else
      v35 = v5;
    if (v5 >= v37)
      v36 = v37;
    else
      v36 = v5;
  }
  else
  {
    v34 = -[TSWPStorage nextCharacterIndex:](storage, "nextCharacterIndex:", v5);
    if (location <= v34)
      v35 = v34;
    else
      v35 = location;
    if (location >= v34)
      v36 = v34;
    else
      v36 = location;
  }
  a3 = (id)objc_msgSend(a3, "copyWithNewVisualTypeRange:head:tail:", v36, v35 - v36, v5, location);
  if (__p)
  {
    v44 = (char *)__p;
    operator delete(__p);
  }
LABEL_60:
  if (!a3)
  {
    v38 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v39 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController logicalToVisualSelection:]");
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12066, CFSTR("invalid nil value for '%s'"), "result");
  }
  return a3;
}

- (const)p_lineFragmentForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5
{
  unint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;

  v6 = -[TSWPEditingController p_lineIndexForCharIndex:column:eol:](self, "p_lineIndexForCharIndex:column:eol:", a3, a4, a5);
  if (objc_msgSend(*a4, "countLines"))
    v7 = 1;
  else
    v7 = v6 == 0x7FFFFFFFFFFFFFFFLL;
  if (!v7)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_lineFragmentForCharIndex:column:eol:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12073, CFSTR("Empty column returned from p_lineIndexForCharIndex"));
  }
  if (v6 >= objc_msgSend(*a4, "countLines"))
    return 0;
  else
    return (const void *)objc_msgSend(*a4, "lineFragmentAtIndex:", v6);
}

- (const)p_lastVisibleLineFragmentForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  void *v4;
  const void *result;
  const void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend((id)objc_msgSend(-[TSWPEditingController p_layoutTargetForCharIndex:eolAffinity:](self, "p_layoutTargetForCharIndex:eolAffinity:", a3, a4), "columns"), "reverseObjectEnumerator");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = (const void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "countLines"))
          return (const void *)objc_msgSend(v9, "lineFragmentAtIndex:", objc_msgSend(v9, "countLines") - 1);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = (const void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (const)p_nearestLineFragmentWithSameVerticalPositionAs:(unint64_t)a3 xPos:(double)a4 inColumn:(id)a5
{
  double MinY;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(a5, "boundsOfLineFragmentAtIndex:");
  MinY = CGRectGetMinY(v21);
  do
  {
    v9 = a3;
    if (!a3)
      break;
    --a3;
    objc_msgSend(a5, "boundsOfLineFragmentAtIndex:", v9 - 1);
  }
  while (CGRectGetMinY(v22) >= MinY);
  v10 = objc_msgSend(a5, "countLines");
  if (v9 < v10)
  {
    v11 = v10;
    v12 = INFINITY;
    v13 = v9;
    do
    {
      objc_msgSend(a5, "boundsOfLineFragmentAtIndex:", v13);
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;
      if (MinY != CGRectGetMinY(v23))
        break;
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v18 = vabdd_f64(a4, CGRectGetMinX(v24));
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v19 = vabdd_f64(a4, CGRectGetMaxX(v25));
      if (v19 >= v18)
        v19 = v18;
      if (v19 < v12)
      {
        v12 = v19;
        v9 = v13;
      }
      ++v13;
    }
    while (v13 < v11);
  }
  return (const void *)objc_msgSend(a5, "lineFragmentAtIndex:", v9);
}

- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6
{
  unint64_t v11;
  float v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  TSWPSelection *v16;
  uint64_t v17;
  TSWPSelection *v18;
  uint64_t v20;
  char v21;
  char v22;

  v11 = objc_msgSend(a3, "charIndex");
  if (a6)
  {
    objc_msgSend(a3, "preferredPosition");
    *a6 = v12;
  }
  v21 = 0;
  v13 = objc_msgSend(a3, "charIndex");
  v22 = objc_msgSend(a3, "endOfLineAffinity");
  v14 = -[TSWPEditingController p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v13, &v22, a4, a5, a6, &v21);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v14;
    v16 = [TSWPSelection alloc];
    v17 = objc_msgSend(a3, "endOfLineAffinity");
    LOBYTE(v20) = v21;
    v18 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v16, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v15, 0, 0, v17, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v20, self->_storage);
    v11 = -[TSWPSelection leadingCharIndex](v18, "leadingCharIndex");

  }
  return v11;
}

- (unint64_t)p_charIndexByMovingCharIndex:(unint64_t)a3 withEolAffinity:(BOOL *)a4 toBoundary:(int)a5 inDirection:(int64_t)a6 preferPosition:(double *)a7 isLeadingEdge:(BOOL *)a8
{
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  CFIndex v21;
  CFIndex v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  CFIndex v37;
  CFIndex v38;
  CFIndex v39;
  unint64_t v40;
  CFIndex v41;
  CFIndex v42;
  CFIndex v43;
  const __CFAllocator *v44;
  const __CFString *v45;
  __CFStringTokenizer *v46;
  CFRange CurrentTokenRange;
  CFIndex length;
  CFRange v49;
  CFIndex location;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t *v55;
  uint64_t v56;
  int v57;
  char v58;
  _BOOL4 v59;
  CFIndex v60;
  double v61;
  unint64_t v62;
  unint64_t v63;
  CFStringTokenizerTokenType v64;
  unint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  CFRange v70;
  CFIndex v71;
  TSWPLineFragment *v72;
  unint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  int v76;
  char v77;
  unint64_t v78;
  uint64_t v80;
  int v81;
  int v82;
  BOOL v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  id v87;
  BOOL v88;
  double v89;
  double v90;
  TSWPLineFragment *v91;
  TSWPLineFragment *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  double i;
  BOOL v102;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  BOOL v107;
  uint64_t v108;
  int v109;
  int v110;
  TSWPLineFragment *v111;
  CFIndex v112;
  id v113;
  id v114;
  CFRange v115;

  v15 = *MEMORY[0x24BEB3BF0];
  v112 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v16 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  v18 = v16 + v17;
  if (a8)
    *a8 = 1;
  if (v18 < a3)
    goto LABEL_4;
  switch(a5)
  {
    case 0:
      v20 = a6;
      v23 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", -[TSWPEditingController p_layoutOrderCharIndexForCaretCharIndex:inDirection:](self, "p_layoutOrderCharIndexForCaretCharIndex:inDirection:", a3, a6), a6);
      goto LABEL_28;
    case 1:
      v20 = a6;
      v23 = -[TSWPEditingController charIndexMovingByWordFromCharIndex:inDirection:](self, "charIndexMovingByWordFromCharIndex:inDirection:", -[TSWPEditingController p_layoutOrderCharIndexForCaretCharIndex:inDirection:](self, "p_layoutOrderCharIndexForCaretCharIndex:inDirection:", a3, a6), a6);
LABEL_28:
      v19 = -[TSWPEditingController p_caretCharIndexForLayoutOrderCharIndex:inDirection:](self, "p_caretCharIndexForLayoutOrderCharIndex:inDirection:", v23, a6);
      goto LABEL_6;
    case 2:
      v33 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", a3);
      v35 = a6 & 0xFFFFFFFFFFFFFFFDLL;
      if (v33 <= v18)
        v36 = v18;
      else
        v36 = v33;
      if (v33 >= v18)
        v37 = v18;
      else
        v37 = v33;
      v38 = v36 - v37;
      v39 = v33 + v34;
      if (v16 <= v33 + v34)
        v40 = v33 + v34;
      else
        v40 = v16;
      if (v16 < v33 + v34)
        v39 = v16;
      v41 = v40 - v39;
      if (v35 == 1)
        v42 = v39;
      else
        v42 = v37;
      if (v35 == 1)
        v43 = v41;
      else
        v43 = v38;
      v44 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v45 = -[TSWPStorage string](self->_storage, "string");
      v115.location = v42;
      v115.length = v43;
      v46 = CFStringTokenizerCreate(v44, v45, v115, 1uLL, 0);
      if (CFStringTokenizerGoToTokenAtIndex(v46, a3))
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v46);
        if (v35)
        {
          v83 = v35 == 1;
          v20 = a6;
          v21 = v112;
          if (!v83)
            goto LABEL_92;
          v49 = CFStringTokenizerGetCurrentTokenRange(v46);
          length = v49.length;
          location = v49.location;
          if (a3 > LODWORD(v49.location))
            goto LABEL_93;
LABEL_73:
          v62 = a3;
          do
          {
            v63 = v62 - 1;
            if (v62 <= v16)
              break;
            v64 = CFStringTokenizerGoToTokenAtIndex(v46, v62 - 1);
            v62 = v63;
          }
          while (!v64);
          if (v63 <= v16)
          {
            v19 = v16;
            goto LABEL_99;
          }
          goto LABEL_92;
        }
        location = CurrentTokenRange.location;
        v71 = CurrentTokenRange.length;
        v20 = a6;
        v21 = v112;
        if (CurrentTokenRange.location + CurrentTokenRange.length != (int)a3)
          goto LABEL_92;
        goto LABEL_91;
      }
      if (!v35)
      {
        v71 = 0;
        location = -1;
        v20 = a6;
        v21 = v112;
LABEL_91:
        if (CFStringTokenizerAdvanceToNextToken(v46))
        {
LABEL_92:
          v70 = CFStringTokenizerGetCurrentTokenRange(v46);
          length = v70.length;
          location = v70.location;
LABEL_93:
          v71 = length;
          goto LABEL_96;
        }
        goto LABEL_94;
      }
      v83 = v35 == 1;
      v20 = a6;
      v21 = v112;
      if (v83)
        goto LABEL_73;
      v71 = 0;
      location = -1;
LABEL_94:
      if (v18 == a3)
      {
        v21 = 0;
        v15 = v18;
      }
LABEL_96:
      if (location != -1)
      {
        v21 = v71;
        v15 = location;
      }
      v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_99:
      CFRelease(v46);
LABEL_7:
      switch(v20)
      {
        case 0:
        case 2:
          if (v15 <= a3)
            v22 = v21;
          else
            v22 = 0;
          v19 = v22 + v15;
          break;
        case 1:
        case 3:
          if (v15 + v21 >= a3)
            v19 = v15;
          else
            v19 = v15 + v21;
          break;
        default:
          break;
      }
      if (v18 >= v19)
        v24 = v19;
      else
        v24 = v18;
      if (v24 <= v16)
        v24 = v16;
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        return 0x7FFFFFFFFFFFFFFFLL;
      else
        return v24;
    case 3:
      v52 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", a3);
      if (v51)
        v53 = v51
            - IsParagraphBreakingCharacter(-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v52 + v51 - 1));
      else
        v53 = 0;
      v20 = a6;
      v65 = (unint64_t *)MEMORY[0x24BEB3BF0];
      switch(v20)
      {
        case 0:
        case 2:
          if (v53 + v52 == a3 && v53 + v52 < v18)
          {
            v52 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", a3 + 1);
            if (v66)
              v53 = v66
                  - IsParagraphBreakingCharacter(-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v66 + v52 - 1));
            else
              v53 = 0;
          }
          break;
        case 1:
        case 3:
          if (v52 == a3 && v52 > v16)
          {
            v52 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", a3 - 1);
            v53 = v67 - 1;
          }
          break;
        default:
          break;
      }
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      if (v52 != 0x7FFFFFFFFFFFFFFFLL)
      {
        switch(v20)
        {
          case 0:
          case 2:
            v19 = v52 + v53;
            break;
          case 1:
          case 3:
            v19 = v52;
            break;
          default:
            break;
        }
      }
      v15 = *v65;
      v21 = v65[1];
      goto LABEL_7;
    case 4:
      -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
      if ((unint64_t)a6 < 4)
      {
        v114 = 0;
        v54 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v114, *a4);
        v19 = v18;
        if (!v54)
          goto LABEL_5;
        v55 = v54;
        switch(a6)
        {
          case 1:
            v19 = *v54;
            goto LABEL_5;
          case 2:
            v19 = TSWPLineFragment::rightMostCharIndex((TSWPLineFragment *)v54);
            if (a8)
            {
              if (!TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v55, v19)
                && v19 < -[TSWPStorage length](self->_storage, "length"))
              {
                v75 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v19);
                v76 = v75;
                v77 = IsParagraphBreakingCharacter(v75);
                if (v76 != 8232 && (v77 & 1) == 0)
                  *a8 = 0;
              }
            }
            LOBYTE(v59) = (v55[3] & 0x1000) == 0;
            break;
          case 3:
            v19 = TSWPLineFragment::leftMostCharIndex((TSWPLineFragment *)v54);
            if (a8)
            {
              if (TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v55, v19) == 1
                && v19 < -[TSWPStorage length](self->_storage, "length"))
              {
                v56 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v19);
                v57 = v56;
                v58 = IsParagraphBreakingCharacter(v56);
                if (v57 != 8232 && (v58 & 1) == 0)
                  *a8 = 0;
              }
            }
            v59 = (*((_DWORD *)v55 + 6) >> 12) & 1;
            break;
          default:
            v78 = -[TSWPStorage charIndexRemappedFromStorage:](self->_storage, "charIndexRemappedFromStorage:", v54[1] + *v54);
            v19 = v78;
            if (v78 > v16 && v78 > a3)
            {
              v80 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v78 - 1);
              v81 = v80;
              v82 = IsParagraphBreakingCharacter(v80);
              v83 = v81 != 8232 && v82 == 0;
              if (!v83)
                v19 = -[TSWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", v19);
            }
            goto LABEL_5;
        }
        *a4 = v59;
        goto LABEL_5;
      }
      if ((unint64_t)(a6 - 4) > 1)
      {
        v68 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v69 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]");
        v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
        v29 = CFSTR("Unsupported horizontal line direction");
        v30 = (void *)v68;
        v31 = v69;
        v32 = 12364;
LABEL_26:
        objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, v28, v32, v29);
LABEL_4:
        v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_5:
        v20 = a6;
        goto LABEL_6;
      }
      if (a7)
        v61 = *a7;
      else
        v61 = NAN;
      v20 = a6;
      v114 = 0;
      v72 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v114, *a4);
      v111 = v72;
      if (v72)
      {
        v20 = a6;
        v73 = -[TSWPEditingController p_MoveByLineRange:up:](self, "p_MoveByLineRange:up:", *(_QWORD *)v72, *((_QWORD *)v72 + 1), a6 == 4);
      }
      else if (a6 == 4)
      {
        v74 = -[TSWPEditingController p_lastVisibleLineFragmentForCharIndex:eol:](self, "p_lastVisibleLineFragmentForCharIndex:eol:", a3, *a4);
        if (!v74)
        {
          v73 = 0;
LABEL_133:
          v113 = 0;
          v84 = -[TSWPEditingController p_lineIndexForCharIndex:column:eol:](self, "p_lineIndexForCharIndex:column:eol:", v73, &v113, v20 == 4);
          if (v84 <= 0x7FFFFFFFFFFFFFFELL)
          {
            v85 = v84;
            v86 = objc_msgSend(v113, "lineFragmentAtIndex:", v84);
            v87 = v113;
            if (v111 && v86 && v111 != (TSWPLineFragment *)v86 && v113 == v114)
            {
              for (i = *((double *)v111 + 7); i == *(double *)(v86 + 56); i = *((double *)v111 + 7))
              {
                v73 = -[TSWPEditingController p_MoveByLineRange:up:](self, "p_MoveByLineRange:up:", *(_QWORD *)v86, *(_QWORD *)(v86 + 8), v20 == 4);
                v85 = -[TSWPEditingController p_lineIndexForCharIndex:column:eol:](self, "p_lineIndexForCharIndex:column:eol:", v73, &v113, v20 == 4);
                v86 = objc_msgSend(v113, "lineFragmentAtIndex:", v85);
                v87 = v113;
                v102 = v73 == v18 || v73 == v16;
                if (v102 || v113 != v114)
                  break;
              }
            }
            v88 = v85 > 0x7FFFFFFFFFFFFFFELL || v87 == 0;
            if (v88
              || (objc_msgSend(v87, "frameBounds"),
                  v90 = v61 + v89,
                  (v91 = -[TSWPEditingController p_nearestLineFragmentWithSameVerticalPositionAs:xPos:inColumn:](self, "p_nearestLineFragmentWithSameVerticalPositionAs:xPos:inColumn:", v85, v113, v90)) == 0))
            {
              if (v73 <= a3 || v20 == 4)
                v19 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v19 = v73;
              goto LABEL_6;
            }
            v92 = v91;
            if (v91 != v111 && (v113 != v114 || v111 && *((double *)v111 + 7) != *((double *)v91 + 7)))
            {
              if (*a4)
              {
                v93 = *(_QWORD *)v91;
                v94 = *((_QWORD *)v91 + 1);
                if (v94)
                {
                  v95 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v93 + v94 - 1);
                  v96 = v95;
                  v97 = IsParagraphBreakingCharacter(v95);
                  if (v96 == 8232)
                    v98 = 1;
                  else
                    v98 = v97;
                  v99 = v94 - v98;
                }
                else
                {
                  v99 = 0;
                }
                v19 = v99 + v93;
              }
              else
              {
                if ((*((_BYTE *)v91 + 24) & 1) == 0 || (v104 = *(_QWORD *)v91, v73 == *(_QWORD *)v91))
                {
                  v73 = TSWPLineFragment::charIndexForWPOffset(v91, v90, 1, 0, 0, 0);
                  v104 = *(_QWORD *)v92;
                }
                v105 = *((_QWORD *)v92 + 1);
                v106 = v105 + v104;
                if (v105)
                  v107 = v73 == v106;
                else
                  v107 = 0;
                if (v107)
                {
                  if (v73 != v18
                    || (v108 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v18 - 1),
                        v109 = v108,
                        v110 = IsParagraphBreakingCharacter(v108),
                        v109 == 8232)
                    || (v19 = v18, v110))
                  {
                    v19 = v73 - 1;
                  }
                }
                else
                {
                  v19 = v73;
                }
              }
              goto LABEL_6;
            }
          }
          v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
          v21 = v112;
          goto LABEL_7;
        }
        v73 = v74[1] + *v74;
      }
      else
      {
        v73 = v18;
      }
      v19 = v73;
      if (v73 > 0x7FFFFFFFFFFFFFFELL)
        goto LABEL_6;
      goto LABEL_133;
    case 5:
      v15 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:", a3);
      v21 = v60;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      v20 = a6;
      goto LABEL_7;
    default:
      v26 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]");
      v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
      v29 = CFSTR("Unsupported granularity");
      v30 = (void *)v26;
      v31 = v27;
      v32 = 12485;
      goto LABEL_26;
  }
}

- (BOOL)p_isCharIndex:(unint64_t)a3 withinTextUnit:(int)a4 inDirection:(int64_t)a5
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v11;
  uint64_t v12;

  if (a4 != 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, *(_QWORD *)&a4, a5);
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_isCharIndex:withinTextUnit:inDirection:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12566, CFSTR("unexpected granularity"));
    return 0;
  }
  if ((unint64_t)a5 > 5)
    return 0;
  v6 = -[TSWPEditingController p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:", a3, a5);
  if (v6 > -[TSWPStorage length](self->_storage, "length"))
    return 0;
  v7 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self->_storage, "wordAtCharIndex:includePreviousWord:", v6, 0);
  return v6 >= v7 && v6 - v7 < v8;
}

- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4
{
  _BOOL8 v4;
  NSUInteger *v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  v4 = a4;
  v7 = (NSUInteger *)MEMORY[0x24BEB3BF0];
  v8 = *MEMORY[0x24BEB3BF0];
  v9 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  if (-[TSWPStorage length](self->_storage, "length") >= a3)
  {
    v10 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self->_storage, "wordAtCharIndex:includePreviousWord:", a3, v4);
    if (v10 != a3 || !v4)
    {
      v8 = v10;
      v9 = v11;
    }
    else
    {
      v8 = *v7;
      v9 = v7[1];
    }
  }
  v13 = v8;
  v14 = v9;
  result.length = v14;
  result.location = v13;
  return result;
}

- (BOOL)isDisplayingPhoneticsHUD
{
  TSWPDismissBlockPopover *rubyTextViewController;

  rubyTextViewController = self->_rubyTextViewController;
  if (rubyTextViewController)
    LOBYTE(rubyTextViewController) = -[TSWPDismissBlockPopover isVisible](rubyTextViewController, "isVisible");
  return (char)rubyTextViewController;
}

- (void)dismissPhoneticsHUDAnimated:(BOOL)a3
{
  -[TSWPDismissBlockPopover dismissAnimated:](self->_rubyTextViewController, "dismissAnimated:", a3);
}

- (void)cancelPhoneticsHUDAnimated:(BOOL)a3
{
  self->_cancelRubyText = 1;
  -[TSWPDismissBlockPopover dismissAnimated:](self->_rubyTextViewController, "dismissAnimated:", a3);
}

- (BOOL)p_isIgnoringKeyboardInput
{
  TSDInteractiveCanvasControllerDelegate *v3;

  v3 = -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !-[TSDInteractiveCanvasControllerDelegate editorAllowsKeyboard](v3, "editorAllowsKeyboard"))
  {
    return 1;
  }
  else
  {
    return !-[TSWPSelection isValid](self->_selection, "isValid");
  }
}

- (BOOL)wantsCaret
{
  TSDInteractiveCanvasControllerDelegate *v3;
  int v4;

  v3 = -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v4 = -[TSWPEditingController p_canEditTextString](self, "p_canEditTextString");
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LOBYTE(v4) = -[TSDInteractiveCanvasControllerDelegate editorAllowsCaret](v3, "editorAllowsCaret");
    else
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)wantsKeyboard
{
  return 1;
}

- (BOOL)p_keyboardShouldShowOnscreen
{
  TSWPSelection *v3;
  TSDInteractiveCanvasControllerDelegate *v4;
  int v5;
  char v6;
  BOOL v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v11;
  _BOOL4 v12;
  BOOL result;
  int v14;
  char v15;

  v3 = -[TSWPEditingController selection](self, "selection");
  v4 = -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[TSDInteractiveCanvasControllerDelegate willChangeContentOffsetIfKeyboardHidden](v4, "willChangeContentOffsetIfKeyboardHidden") ^ 1;
  else
    v5 = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = -[TSDInteractiveCanvasControllerDelegate editorAllowsKeyboard](v4, "editorAllowsKeyboard") ^ 1;
  else
    v6 = 0;
  v7 = -[TSKDocumentRoot isFindActive](-[TSDInteractiveCanvasController documentRoot](self->_interactiveCanvasController, "documentRoot"), "isFindActive");
  v8 = -[TSWPEditingController shouldDisplayKeyboard](self, "shouldDisplayKeyboard");
  v9 = -[TSWPSelection isValid](v3, "isValid");
  v10 = -[TSWPEditingController isBecomingActive](self, "isBecomingActive");
  v11 = -[TSWPEditingController isDisplayingPhoneticsHUD](self, "isDisplayingPhoneticsHUD");
  v12 = -[TSWPEditingController isInParagraphMode](self, "isInParagraphMode");
  result = 0;
  v14 = v12 & v5;
  if (self->_knobTracking)
    v15 = v14;
  else
    v15 = 0;
  if (v8 && (v6 & 1) == 0 && !v7 && (v9 || v10) && !v11 && (v15 & 1) == 0)
    return (TSUPhoneUI() & v14) != 1
        || (self->_currentSelectionFlags & 0x10000) == 0 && !self->_selectionLastModifiedWithKnob;
  return result;
}

- (void)abandonMarkedText
{
  -[TSDTextInputResponder acceptAutocorrection](-[TSDInteractiveCanvasController textInputResponder](self->_interactiveCanvasController, "textInputResponder"), "acceptAutocorrection");
}

- (void)endEditing
{
  id v3;
  TSDEditorController *v4;
  TSDEditorController *v5;

  -[TSWPEditingController dismissActivePopovers](self, "dismissActivePopovers");
  -[TSWPEditingController p_cancelDelayedSelectors](self, "p_cancelDelayedSelectors");
  v3 = -[TSWPEditingController p_containingShapeRep](self, "p_containingShapeRep");
  v4 = -[TSDInteractiveCanvasController editorController](self->_interactiveCanvasController, "editorController");
  v5 = v4;
  if (v3)
  {
    -[TSDEditorController popEditor:](v4, "popEditor:", self);
    objc_msgSend(-[TSDEditorController mostSpecificCurrentEditorOfClass:](v5, "mostSpecificCurrentEditorOfClass:", 0), "setSelection:", 0);
  }
  else if (objc_msgSend(-[TSDEditorController currentEditorsOfClass:](v4, "currentEditorsOfClass:", objc_opt_class()), "containsObject:", self))
  {
    -[TSDEditorController popEditor:](v5, "popEditor:", self);
  }
}

- (void)endEditingAndSelectParent:(id)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = -[TSWPStorage wpKind](self->_storage, "wpKind", a3);
  if (v4 == 2)
  {
    v7 = -[TSDContainerInfo findCharIndexForFootnoteAttachment:](-[TSWPStorage parentInfo](self->_storage, "parentInfo"), "findCharIndexForFootnoteAttachment:", -[TSWPStorage owningAttachment](self->_storage, "owningAttachment"));
    -[TSDInteractiveCanvasController endEditing](self->_interactiveCanvasController, "endEditing");
    -[TSDCanvasEditor setSelection:](-[TSDInteractiveCanvasController canvasEditor](self->_interactiveCanvasController, "canvasEditor"), "setSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v7 + 1, 0));
  }
  else if (v4 == 3)
  {
    objc_opt_class();
    -[TSWPStorage parentInfo](self->_storage, "parentInfo");
    v5 = TSUDynamicCast();
    if (v5)
    {
      v6 = v5;
      -[TSDInteractiveCanvasController endEditing](self->_interactiveCanvasController, "endEditing");
      -[TSDCanvasEditor setSelectionToInfo:](-[TSDInteractiveCanvasController canvasEditor](self->_interactiveCanvasController, "canvasEditor"), "setSelectionToInfo:", v6);
    }
  }
}

- (BOOL)textIsVerticalAtCharIndex:(unint64_t)a3
{
  uint64_t v4;
  TSWPStorage *storage;
  TSDContainerInfo *v6;

  -[TSWPStorage parentInfo](self->_storage, "parentInfo", a3);
  v4 = TSUProtocolCast();
  storage = self->_storage;
  if (v4)
  {
    v6 = -[TSWPStorage parentInfo](storage, "parentInfo");
    return -[TSDContainerInfo textIsVertical](v6, "textIsVertical");
  }
  if (!-[TSWPStorage wpKind](storage, "wpKind"))
  {
    -[TSWPStorage documentRoot](self->_storage, "documentRoot");
    v6 = (TSDContainerInfo *)TSUProtocolCast();
    return -[TSDContainerInfo textIsVertical](v6, "textIsVertical");
  }
  return 0;
}

- (int64_t)returnKeyType
{
  if (self->_suppressBreaks)
    return 9;
  else
    return 0;
}

- (unint64_t)textLength
{
  return -[TSWPStorage length](self->_storage, "length");
}

- (id)unfilteredText
{
  return -[TSWPStorage string](self->_storage, "string");
}

- (id)textInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  __CFString *v10;
  TSWPFilteredStorage *v11;
  const __CFAllocator *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  UniChar chars[12];
  uint64_t v30;

  length = a3.length;
  location = a3.location;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSWPStorage string](self->_storage, "string");
  if (location + length > objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController textInRange:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12933, CFSTR("bad text range"));
  }
  v9 = objc_msgSend(v6, "length");
  v10 = &stru_24D82FEB0;
  if (length && location + length <= v9)
  {
    if (-[TSWPStorage hasTrackedChanges](self->_storage, "hasTrackedChanges"))
    {
      v11 = -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:]([TSWPFilteredStorage alloc], "initWithStorage:subRange:removeRanges:", self->_storage, location, length, -[TSWPStorage deletedRangesInRange:](self->_storage, "deletedRangesInRange:", location, length));
      v10 = (__CFString *)-[TSWPFilteredStorage string](v11, "string");
      if (!-[__CFString length](v10, "length"))
        v10 = CFSTR(" ");

    }
    else
    {
      v10 = (__CFString *)objc_msgSend(v6, "substringWithRange:", location, length);
    }
    if (!-[TSWPEditingController textInRange:]::sSeparatorSet)
    {
      *(_OWORD *)chars = xmmword_217C2AD40;
      *(_QWORD *)&chars[7] = 0x20292028000F000DLL;
      v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v13 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x24BDBD240], chars, 11);
      if (v13)
      {
        v14 = v13;
        -[TSWPEditingController textInRange:]::sSeparatorSet = (uint64_t)CFCharacterSetCreateWithCharactersInString(v12, v13);
        CFRelease(v14);
      }
      else
      {
        v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController textInRange:]");
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12970, CFSTR("invalid nil value for '%s'"), "setStr");
      }
    }
    if ((unint64_t)-[__CFString rangeOfCharacterFromSet:](v10, "rangeOfCharacterFromSet:") <= 0x7FFFFFFFFFFFFFFELL)
    {
      v17 = (void *)-[__CFString componentsSeparatedByCharactersInSet:](v10, "componentsSeparatedByCharactersInSet:", -[TSWPEditingController textInRange:]::sSeparatorSet);
      v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", -[__CFString length](v10, "length"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        v21 = 1;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            if ((v21 & 1) != 0)
              -[__CFString appendString:](v10, "appendString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            else
              -[__CFString appendFormat:](v10, "appendFormat:", CFSTR("\n%@"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            v21 = 0;
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          v21 = 0;
        }
        while (v19);
      }
    }
  }
  return v10;
}

- (CGRect)firstRectForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPFilteredStorage *v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  length = a3.length;
  location = a3.location;
  if (-[TSWPStorage hasTrackedChanges](self->_storage, "hasTrackedChanges"))
  {
    v6 = -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:]([TSWPFilteredStorage alloc], "initWithStorage:subRange:removeRanges:", self->_storage, location, length, -[TSWPStorage deletedRangesInRange:](self->_storage, "deletedRangesInRange:", location, length));
    v7 = -[TSWPFilteredStorage charRangeMappedFromStorage:](v6, "charRangeMappedFromStorage:", location, length);
    location = -[TSWPFilteredStorage charRangeMappedToStorage:](v6, "charRangeMappedToStorage:", v7, v8);
    length = v9;

  }
  -[TSWPEditingController p_firstRectForRange:actualRange:](self, "p_firstRectForRange:actualRange:", location, length, 0);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)p_setInsertionStyle:(id)a3
{
  id v5;

  if (self->_insertionStyle != a3)
  {
    v5 = a3;

    self->_insertionStyle = (TSWPCharacterStyle *)a3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSWPEditingControllerInsertionStyleChanged"), self->_storage, 0);
  }
}

- (id)characterStyleForDeletedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id result;
  id v12;
  _QWORD v13[2];
  uint64_t v14;

  length = a3.length;
  location = a3.location;
  -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_storage, "smartFieldAtCharIndex:attributeKind:effectiveRange:", a3.location, 6, &v14);
  objc_opt_class();
  v6 = TSUDynamicCast();
  v7 = v14;
  v8 = -[TSWPStorage attachmentOrFootnoteAtCharIndex:](-[TSWPEditingController storage](self, "storage"), "attachmentOrFootnoteAtCharIndex:", location);
  if (v7 == location && v6 != 0 || v8 != 0)
    return 0;
  v12 = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self->_storage, "characterStyleAtCharIndex:effectiveRange:", location, v13);
  result = 0;
  if (v12 && v13[0] == location)
  {
    if (v13[1] + location <= location + length)
      return v12;
    else
      return 0;
  }
  return result;
}

- (void)extendSelectionLeft
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  TSWPStorage *storage;
  unint64_t i;
  unint64_t v10;
  TSWPSelection *v11;

  v3 = -[TSWPSelection range](-[TSWPEditingController selection](self, "selection"), "range");
  v5 = v4;
  v6 = -[TSWPStorage selectionRangeMinForCharIndex:](self->_storage, "selectionRangeMinForCharIndex:", v3);
  if (v3 > v6)
  {
    v7 = v6;
    storage = self->_storage;
    for (i = v3; ; i = v10)
    {
      v10 = -[TSWPStorage previousCharacterIndex:](storage, "previousCharacterIndex:", i);
      if (v10 <= v7
        || !-[TSWPStorage anchoredDrawableAttachmentCharacterAtCharIndex:](self->_storage, "anchoredDrawableAttachmentCharacterAtCharIndex:", v10))
      {
        break;
      }
      storage = self->_storage;
    }
    v11 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v10, v5 + v3 - v10);
    -[TSWPEditingController setSelection:](self, "setSelection:", v11);

  }
}

- (void)extendSelectionRight
{
  TSWPSelection *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  TSWPSelection *v11;

  v3 = -[TSWPEditingController selection](self, "selection");
  if (!-[TSWPSelection isValid](v3, "isValid"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController extendSelectionRight]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 14569, CFSTR("Invalid selection"));
  }
  if (-[TSWPSelection isValid](v3, "isValid"))
  {
    v6 = -[TSWPSelection range](v3, "range");
    v8 = v6 + v7;
    v9 = -[TSWPStorage selectionRangeMaxForCharIndex:](self->_storage, "selectionRangeMaxForCharIndex:", v6 + v7);
    if (v8 < v9)
    {
      v10 = v9;
      do
        v8 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v8);
      while (v8 < v10
           && -[TSWPStorage anchoredDrawableAttachmentCharacterAtCharIndex:](self->_storage, "anchoredDrawableAttachmentCharacterAtCharIndex:", v8));
      v11 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v6, v8 - v6);
      -[TSWPEditingController setSelection:](self, "setSelection:", v11);

    }
  }
}

- (CGRect)p_firstRectForRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  NSUInteger length;
  NSUInteger location;
  double *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  NSUInteger v12;
  NSUInteger v13;
  TSWPSelection *v14;
  id v15;
  void *v16;
  uint64_t v17;
  double x;
  double y;
  double width;
  double height;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSUInteger v28;
  NSRange v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  TSWPEditingController *v39;
  _QWORD range1[3];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  NSRange v47;
  NSRange v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v46 = *MEMORY[0x24BDAC8D0];
  -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
  v7 = (double *)MEMORY[0x24BDBF070];
  v8 = *MEMORY[0x24BDBF070];
  v9 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v12 = *MEMORY[0x24BEB3BF0];
  v13 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  range1[0] = location;
  v14 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", location, length);
  v39 = self;
  v15 = -[TSDInteractiveCanvasController layoutForModel:withSelection:](self->_interactiveCanvasController, "layoutForModel:withSelection:", self->_storage, v14);
  if (!v15)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController p_firstRectForRange:actualRange:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 14664, CFSTR("failed to find a layout, can't present autocorrection UI"));
  }
  x = *v7;
  y = v7[1];
  width = v7[2];
  height = v7[3];
  *(_OWORD *)&range1[1] = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = (void *)objc_msgSend(v15, "columns", v15);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &range1[1], v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v42;
LABEL_5:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(range1[2] + 8 * v26);
      if (length)
      {
        objc_msgSend(*(id *)(range1[2] + 8 * v26), "firstRectForSelection:includeSpaceAfter:includeSpaceBefore:includeLeading:", v14, 0, 0, 0);
        x = v49.origin.x;
        y = v49.origin.y;
        width = v49.size.width;
        height = v49.size.height;
        if (CGRectIsEmpty(v49))
        {
          x = *v7;
          y = v7[1];
          width = v7[2];
          height = v7[3];
        }
        else
        {
          v51.origin.x = x;
          v51.origin.y = y;
          v51.size.width = width;
          v51.size.height = height;
          if (!CGRectIsNull(v51))
          {
            v48.location = objc_msgSend(v27, "range");
            v48.length = v28;
            v47.location = range1[0];
            v47.length = length;
            v29 = NSIntersectionRange(v47, v48);
            v12 = v29.location;
            v13 = v29.length;
          }
        }
      }
      else
      {
        objc_msgSend(*(id *)(range1[2] + 8 * v26), "caretRectForSelection:", v14);
        x = v50.origin.x;
        y = v50.origin.y;
        width = v50.size.width;
        height = v50.size.height;
        if (!CGRectIsNull(v50))
        {
          v12 = range1[0];
          v13 = 0;
        }
      }
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      if (!CGRectIsNull(v52))
        break;
      if (v24 == ++v26)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &range1[1], v45, 16);
        if (v24)
          goto LABEL_5;
        break;
      }
    }
  }

  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  if (!CGRectIsNull(v53))
  {
    objc_msgSend(v38, "rectInRoot:", x, y, width, height);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v39->_interactiveCanvasController, "convertUnscaledToBoundsRect:");
    v8 = v30;
    v9 = v31;
    v10 = v32;
    v11 = v33;
  }
  v54.origin.x = v8;
  v54.origin.y = v9;
  v54.size.width = v10;
  v54.size.height = v11;
  if (CGRectIsNull(v54))
  {
    v8 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  if (a4)
  {
    a4->location = v12;
    a4->length = v13;
  }
  v34 = v8;
  v35 = v9;
  v36 = v10;
  v37 = v11;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (id)_repsForStorage:(id)a3 selection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRange v23;
  NSRange v24;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSWPInteractiveCanvasController _repsForStorage:](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "_repsForStorage:", a3);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = objc_msgSend(a4, "range");
        v14 = v13;
        v24.location = objc_msgSend(v11, "range");
        v24.length = v15;
        v23.location = v12;
        v23.length = v14;
        if (NSIntersectionRange(v23, v24).length)
          objc_msgSend(v6, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  return v6;
}

- (id)_addSelectionRectsForLayout:(id)a3 selection:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t k;
  double x;
  double y;
  double width;
  double height;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  TSDTextSelectionRect *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  TSDTextSelectionRect *v53;
  id obj;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  unsigned int v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;
  CGRect v83;
  CGRect v84;

  v4 = a4;
  v82 = *MEMORY[0x24BDAC8D0];
  v62 = objc_msgSend(a4, "range");
  v58 = v7;
  v63 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v61 = a3;
  obj = (id)objc_msgSend(a3, "columns");
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (v57)
  {
    v56 = *(_QWORD *)v76;
    v64 = v4;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v76 != v56)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v65 = objc_msgSend(v9, "textIsVertical");
        if (v58)
        {
          v74 = 0;
          v59 = i;
          if (objc_msgSend(v4, "isVisual"))
          {
            v74 = (id)objc_msgSend(v4, "visualRangesArray");
            v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v60 = v74;
            v11 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v71;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v71 != v13)
                    objc_enumerationMutation(v60);
                  v15 = objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "rangeValue");
                  v17 = (void *)objc_msgSend(v9, "rectsForSelectionRange:selectionType:", v15, v16, objc_msgSend(v64, "type"));
                  if (objc_msgSend(v17, "count") != 1)
                  {
                    v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController _addSelectionRectsForLayout:selection:]");
                    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 14766, CFSTR("A visual selection should only return one rect"));
                  }
                  objc_msgSend(v10, "addObject:", objc_msgSend(v17, "objectAtIndex:", 0));
                }
                v12 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
              }
              while (v12);
            }
          }
          else
          {
            v10 = (void *)objc_msgSend(v9, "rectsForSelection:ranges:", v4, &v74);
          }
          v24 = objc_msgSend(v10, "count");
          if (v24 != objc_msgSend(v74, "count"))
          {
            v25 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController _addSelectionRectsForLayout:selection:]");
            v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm");
            v28 = objc_msgSend(v10, "count");
            objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 14775, CFSTR("rect/range count mismatch: %lu v %lu"), v28, objc_msgSend(v74, "count"));
          }
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v29 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
          if (v29)
          {
            v30 = v29;
            v31 = 0;
            v32 = *(_QWORD *)v67;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v67 != v32)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * k), "CGRectValue");
                x = v84.origin.x;
                y = v84.origin.y;
                width = v84.size.width;
                height = v84.size.height;
                if (!CGRectIsEmpty(v84))
                {
                  objc_msgSend(v61, "rectInRoot:", x, y, width, height);
                  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](self->_interactiveCanvasController, "convertUnscaledToBoundsRect:");
                  v39 = v38;
                  v41 = v40;
                  v43 = v42;
                  v45 = v44;
                  v46 = objc_msgSend((id)objc_msgSend(v74, "objectAtIndexedSubscript:", (v31 + k)), "rangeValue");
                  v48 = -[TSDTextSelectionRect initWithRect:direction:range:containsStart:containsEnd:isVertical:]([TSDTextSelectionRect alloc], "initWithRect:direction:range:containsStart:containsEnd:isVertical:", -[TSWPEditingController writingDirectionForCharIndex:](self, "writingDirectionForCharIndex:", v46), +[TSDTextRange textRangeWithRange:](TSDTextRange, "textRangeWithRange:", v46, v47), v46 == v62, v46 + v47 == v62 + v58, v65, v39, v41, v43, v45);
                  objc_msgSend(v63, "addObject:", v48);

                }
              }
              v30 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
              v31 += k;
            }
            while (v30);
          }
          v4 = v64;
          i = v59;
        }
        else
        {
          objc_msgSend(v9, "caretRectForSelection:", v4);
          v20 = v83.origin.x;
          v21 = v83.origin.y;
          v22 = v83.size.width;
          v23 = v83.size.height;
          if (!CGRectIsNull(v83))
          {
            objc_msgSend(v61, "rectInRoot:", v20, v21, v22, v23);
            -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](self->_interactiveCanvasController, "convertUnscaledToBoundsRect:");
            v53 = -[TSDTextSelectionRect initWithRect:direction:range:containsStart:containsEnd:isVertical:]([TSDTextSelectionRect alloc], "initWithRect:direction:range:containsStart:containsEnd:isVertical:", -[TSWPEditingController writingDirectionForCharIndex:](self, "writingDirectionForCharIndex:", v62), +[TSDTextRange textRangeWithRange:](TSDTextRange, "textRangeWithRange:", v62, 0), 1, 1, v65, v49, v50, v51, v52);
            objc_msgSend(v63, "addObject:", v53);

            return v63;
          }
        }
      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    }
    while (v57);
  }
  return v63;
}

- (id)selectionRectsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPInteractiveCanvasController *v6;
  NSUInteger v7;
  void *v8;
  TSWPSelection *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  length = a3.length;
  location = a3.location;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDInteractiveCanvasController delegate](v6, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[TSDInteractiveCanvasControllerDelegate selectableWordLimit](-[TSDInteractiveCanvasController delegate](v6, "delegate"), "selectableWordLimit"))
  {
    location = +[TSDRangeClamper clampSelectedRange:inFullString:toWordLimit:](TSDRangeClamper, "clampSelectedRange:inFullString:toWordLimit:", location, length, -[TSWPEditingController unfilteredText](self, "unfilteredText"), -[TSDInteractiveCanvasControllerDelegate selectableWordLimit](-[TSDInteractiveCanvasController delegate](v6, "delegate"), "selectableWordLimit"));
    length = v7;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
  v9 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", location, length);
  if (TSUSupportsTextInteraction())
  {
    v10 = -[TSWPEditingController _repsForStorage:selection:](self, "_repsForStorage:selection:", self->_storage, v9);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v8, "addObjectsFromArray:", -[TSWPEditingController _addSelectionRectsForLayout:selection:](self, "_addSelectionRectsForLayout:selection:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "layout"), v9));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v12);
    }
  }
  else
  {
    v15 = -[TSDInteractiveCanvasController layoutsForModel:withSelection:](self->_interactiveCanvasController, "layoutsForModel:withSelection:", self->_storage, v9);
    if (!objc_msgSend(v15, "count"))
    {
      v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController selectionRectsForRange:]");
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 14861, CFSTR("failed to find a layout"));
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v15);
          objc_msgSend(v8, "addObjectsFromArray:", -[TSWPEditingController _addSelectionRectsForLayout:selection:](self, "_addSelectionRectsForLayout:selection:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v9));
        }
        v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v19);
    }
  }

  return v8;
}

- (id)textColorAtCharIndex:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v5 = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self->_storage, "characterStyleAtCharIndex:effectiveRange:", a3, 0);
  v6 = objc_msgSend(-[TSWPEditingController styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", a3), 0);
  v8[0] = self->_insertionStyle;
  v8[1] = v5;
  v8[2] = v6;
  return (id)objc_msgSend((id)TSWPResolvePropertyForStyles((uint64_t)v8, 3uLL, 18, 0), "UIColor");
}

- (id)p_columnForCharIndex:(unint64_t)a3
{
  TSWPSelection *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3, 0);
  v5 = -[TSDInteractiveCanvasController layoutForModel:withSelection:](self->_interactiveCanvasController, "layoutForModel:withSelection:", self->_storage, v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_msgSend(v5, "columns", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v15;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
    objc_msgSend(v11, "caretRectForSelection:", v4);
    if (v12 > 0.0)
      return v11;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)textFontAtCharIndex:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  const __CTFont *v7;
  const __CTFont *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v5 = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self->_storage, "characterStyleAtCharIndex:effectiveRange:", a3, 0);
  v6 = objc_msgSend(-[TSWPEditingController styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", a3), 0);
  v15[0] = self->_insertionStyle;
  v15[1] = v5;
  v15[2] = v6;
  v7 = TSWPCreateFontForStylesWithScale((uint64_t)v15, 3uLL, 0x64uLL);
  v8 = TSWPUIFontForCTFont(v7);
  CFRelease(v7);
  -[__CTFont pointSize](v8, "pointSize");
  v10 = v9;
  -[TSDInteractiveCanvasController viewScale](self->_interactiveCanvasController, "viewScale");
  v12 = v10 * v11;
  v13 = -[TSWPEditingController p_columnForCharIndex:](self, "p_columnForCharIndex:", a3);
  if (v13)
    v12 = v12 * (float)((float)(unint64_t)objc_msgSend(v13, "scaleTextPercent") / 100.0);
  return -[__CTFont fontWithSize:](v8, "fontWithSize:", v12);
}

- (id)selectionWithRange:(_NSRange)a3
{
  return -[TSWPEditingController p_extendSelectionToIncludeSmartFields:](self, "p_extendSelectionToIncludeSmartFields:", -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3.location, a3.length));
}

- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4
{
  _BOOL8 v4;
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  TSWPSelection *v9;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  if (-[TSWPSelection range](-[TSWPEditingController selection](self, "selection"), "range") == a3.location)
    v8 = 168000;
  else
    v8 = 135232;
  v9 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, location, length, 0, v4);
  -[TSDInteractiveCanvasController setSelection:onModel:withFlags:](self->_interactiveCanvasController, "setSelection:onModel:withFlags:", v9, self->_storage, v8);

  self->_selectionLastModifiedWithKeyboard = 1;
  -[TSWPEditingController p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
}

- (void)setSelectionWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  TSWPSelection *v10;
  TSWPSelection *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v10 = [TSWPSelection alloc];
  LOBYTE(v13) = a4;
  v11 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v10, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, location, length, 0, v5, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v13, self->_storage);
  if (-[TSWPSelection range](-[TSWPEditingController selection](self, "selection"), "range") == location)
    v12 = 168000;
  else
    v12 = 135232;
  -[TSDInteractiveCanvasController setSelection:onModel:withFlags:](self->_interactiveCanvasController, "setSelection:onModel:withFlags:", v11, self->_storage, v12);

  self->_selectionLastModifiedWithKeyboard = 1;
  -[TSWPEditingController p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
}

- (id)editingSearchReference
{
  TSWPSelection *v3;
  TSWPSearchReference *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSWPEditingController selection](self, "selection");
  v4 = (TSWPSearchReference *)v3;
  if (v3)
  {
    if (-[TSWPSelection isValid](v3, "isValid"))
    {
      v4 = +[TSWPSearchReference searchReferenceWithStorage:selection:](TSWPSearchReference, "searchReferenceWithStorage:selection:", self->_storage, v4);
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = -[TSWPEditingController editingReps](self, "editingReps", 0);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "layout"), "calculatePointFromSearchReference:", v4);
            if ((v10 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
            {
              -[TSWPSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
              return v4;
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            continue;
          break;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (id)p_extendSelectionToIncludeSmartFields:(id)a3
{
  int v5;
  id result;

  v5 = objc_msgSend(a3, "type");
  result = -[TSWPStorage extendSelectionToIncludeSmartFields:](self->_storage, "extendSelectionToIncludeSmartFields:", a3);
  if (v5 == 7)
    return -[TSWPEditingController logicalToVisualSelection:](self, "logicalToVisualSelection:", result);
  return result;
}

- (void)p_setSelectionFromPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 includeListLabels:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, x, y);
  v10 = (void *)TSUDynamicCast();
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v10, "isEditing"))
    {
      objc_msgSend(v11, "convertNaturalPointFromUnscaledCanvas:", x, y);
      objc_msgSend(v11, "pinToClosestColumn:");
      LOBYTE(v16) = 0;
      v12 = -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", v11, a4, 0, 1, v5, 0, v16);
      if ((objc_msgSend(v12, "isEqual:", -[TSWPEditingController selection](self, "selection")) & 1) == 0)
      {
        if (-[TSWPEditingController pIsSelectionPlaceHolderTextWithSelection:](self, "pIsSelectionPlaceHolderTextWithSelection:", v12))
        {
          v13 = 4176;
        }
        else
        {
          v13 = 4432;
        }
        -[TSWPEditingController setSelection:withFlags:](self, "setSelection:withFlags:", v12, v13);
      }
      if (self->_magnifying)
      {
        if ((void *)objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "target") != v11)objc_msgSend((id)objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "target"), "setShouldHideSelectionControls:", 0);
        objc_msgSend(v11, "setShouldHideSelectionControls:", self->_initialPressTextSelectionGranularity == 1);
        objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "setTarget:", v11);
        -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self->_interactiveCanvasController, "convertUnscaledToBoundsPoint:", x, y);
        objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "setMagnificationPoint:", v14, v15);
      }
    }
  }
}

- (id)selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 selectsEntireLink:(BOOL)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double y;
  double x;
  void *v14;
  uint64_t v16;

  v8 = a6;
  v9 = a5;
  y = a3.y;
  x = a3.x;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, x, y);
  v14 = (void *)TSUDynamicCast();
  if (!objc_msgSend(v14, "isEditing"))
    return 0;
  objc_msgSend(v14, "convertNaturalPointFromUnscaledCanvas:", x, y);
  objc_msgSend(v14, "pinToClosestColumn:");
  LOBYTE(v16) = a7;
  return -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", v14, a4, v9, 1, 0, v8, v16);
}

- (void)p_adjustSelection:(id)a3 withUnscaledCanvasPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 allowPastBreak:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  CGRect v13;

  v7 = a7;
  v8 = a6;
  -[TSDInteractiveCanvasController visibleUnscaledRect](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
  CGRectInset(v13, 1.0, 1.0);
  v12 = -[TSWPEditingController p_selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:selectsEntireLink:](self, "p_selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:selectsEntireLink:", a5, v8, v7, 1, TSDClampPointInRect());
  if (v12)
    -[TSWPEditingController p_adjustSelection:withOtherSelection:textSelectionGranularity:](self, "p_adjustSelection:withOtherSelection:textSelectionGranularity:", a3, v12, a5);
}

- (void)p_inputLanguageDidChangeNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;

  if (-[TSWPSelection isValid](self->_selection, "isValid", a3))
  {
    v5 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", -[TSWPSelection range](self->_selection, "range"));
    if (v4)
    {
      if (v4 == 1)
        v6 = IsParagraphBreakingCharacter(-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v5)) ^ 1;
      else
        v6 = 1;
    }
    else
    {
      v6 = 0;
    }
    if (!-[TSWPSelection isInsertionPoint](self->_selection, "isInsertionPoint") || (v6 & 1) != 0)
    {
      -[TSWPEditingController selectionChangedWithFlags:wpFlags:](self, "selectionChangedWithFlags:wpFlags:", self->_currentSelectionFlags, 0);
    }
    else
    {
      v7 = -[TSWPStorage writingDirectionForParagraphAtCharIndex:](self->_storage, "writingDirectionForParagraphAtCharIndex:", v5);
      if ((v7 != 1) == (objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", TSWPGetPrimaryInputLanguage()) == 2))-[TSWPEditingController setBaseWritingDirection:forParagraphsWithRange:](self, "setBaseWritingDirection:forParagraphsWithRange:");
    }
  }
}

- (BOOL)p_canEditTextString
{
  uint64_t v3;
  void *v4;

  -[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate");
  v3 = TSUProtocolCast();
  if (v3 && (v4 = (void *)v3, (objc_opt_respondsToSelector() & 1) != 0))
    return objc_msgSend(v4, "disallowEditingOfTextStringWithStorage:", -[TSWPEditingController storage](self, "storage")) ^ 1;
  else
    return 1;
}

- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5
{
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  TSWPSelection *v12;
  TSWPSelection *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSRange v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSUInteger v36;
  uint64_t v37;
  TSWPSelection *v38;
  NSRange v39;
  NSRange v40;

  v6 = a3;
  if (objc_msgSend(a3, "isValid") && objc_msgSend(a4, "isValid"))
  {
    objc_msgSend(v6, "superRange");
    if (objc_msgSend(a4, "type") == 7
      && (!objc_msgSend(v6, "type") || objc_msgSend(v6, "type") == 7))
    {
      if (objc_msgSend(v6, "type") != 7)
        v6 = -[TSWPEditingController logicalToVisualSelection:](self, "logicalToVisualSelection:", v6);
      v8 = -[TSWPEditingController p_adjustVisualSelection:withOtherSelection:](self, "p_adjustVisualSelection:withOtherSelection:", v6, a4);
      v10 = v9;
      if (!-[TSWPSelection isValid](-[TSWPEditingController selection](self, "selection"), "isValid")
        || -[TSWPSelection range](-[TSWPEditingController selection](self, "selection"), "range") != v8
        || v11 != v10)
      {
        v12 = [TSWPSelection alloc];
        LOBYTE(v37) = 1;
        v13 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v12, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v8, v10, 0, 0, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v37, self->_storage);
LABEL_28:
        v38 = v13;
        -[TSWPEditingController setSelection:withFlags:](self, "setSelection:withFlags:", v13, 768);

      }
    }
    else
    {
      v14 = objc_msgSend(v6, "range");
      if (v14 >= objc_msgSend(a4, "range")
        || (v15 = objc_msgSend(a4, "range"), v17 = v15 + v16, v18 = objc_msgSend(v6, "range"), v17 >= v18 + v19))
      {
        v28 = objc_msgSend(v6, "range");
        v30 = v29;
        v40.location = objc_msgSend(a4, "range");
        v40.length = v31;
        v39.location = v28;
        v39.length = v30;
        v32 = NSUnionRange(v39, v40);
        location = v32.location;
        length = v32.length;
      }
      else
      {
        v20 = objc_msgSend(a4, "range");
        v21 = objc_msgSend(v6, "range");
        if (v20 <= v21 + (v22 >> 1))
        {
          location = objc_msgSend(a4, "range");
          v34 = objc_msgSend(v6, "range");
          if (location <= v34 + v35)
            v36 = v34 + v35;
          else
            v36 = location;
          if (location >= v34 + v35)
            location = v34 + v35;
          length = v36 - location;
        }
        else
        {
          v23 = objc_msgSend(v6, "range");
          v24 = objc_msgSend(a4, "range");
          if (v23 <= v24)
            v25 = v24;
          else
            v25 = v23;
          if (v23 >= v24)
            location = v24;
          else
            location = v23;
          length = v25 - location;
        }
      }
      if (!-[TSWPSelection isValid](-[TSWPEditingController selection](self, "selection"), "isValid")
        || -[TSWPSelection range](-[TSWPEditingController selection](self, "selection"), "range") != location
        || v33 != length)
      {
        v13 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", location, length);
        goto LABEL_28;
      }
    }
  }
}

- (UIView)inputView
{
  UIView *result;
  id v4;

  if (-[TSWPEditingController p_keyboardShouldShowOnscreen](self, "p_keyboardShouldShowOnscreen"))
    return 0;
  result = self->_inputViewForHidingKeyboard;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    result = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    self->_inputViewForHidingKeyboard = result;
  }
  return result;
}

- (UIView)inputAccessoryView
{
  void *v3;

  if (-[TSWPEditingController p_keyboardShouldShowOnscreen](self, "p_keyboardShouldShowOnscreen")
    && (-[TSDInteractiveCanvasController delegate](self->_interactiveCanvasController, "delegate"),
        v3 = (void *)TSUProtocolCast(),
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    return (UIView *)objc_msgSend(v3, "formatBarAccessoryView");
  }
  else
  {
    return 0;
  }
}

- (BOOL)textEditingSupportsFormatBar
{
  return -[TSWPEditingController inputAccessoryView](self, "inputAccessoryView") != 0;
}

- (id)p_previousAutocorrectionForWordAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  uint64_t v6;
  id result;
  _NSRange v8;

  if (a4)
    *a4 = *(_NSRange *)MEMORY[0x24BEB3BF0];
  v6 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self->_storage, "wordAtCharIndex:includePreviousWord:", a3, 1);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  result = -[TSWPStorage dictationAndAutocorrectionKeyAtCharIndex:effectiveRange:](self->_storage, "dictationAndAutocorrectionKeyAtCharIndex:effectiveRange:", v6, &v8);
  if (result)
  {
    result = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_autocorrectedEntries, "objectForKeyedSubscript:", result);
    if (a4)
    {
      if (result)
        *a4 = v8;
    }
  }
  return result;
}

- (int)valueForWritingDirectionPropertyForInspector:(id)a3
{
  TSWPSelection *v4;
  uint64_t v5;
  TSWPStorage *storage;
  id v7;
  int v8;
  TSWPInteractiveCanvasController *v9;
  void *v10;
  TSWPParagraphEnumerator v12;

  v4 = -[TSWPEditingController selection](self, "selection", a3);
  if (!-[TSWPSelection isValid](v4, "isValid"))
    return -1;
  v5 = -[TSWPSelection start](v4, "start");
  storage = self->_storage;
  v7 = -[TSWPEditingController styleProvider](self, "styleProvider");
  if (storage)
    -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](storage, "paragraphEnumeratorAtCharIndex:styleProvider:", v5, v7);
  else
    memset(&v12, 0, sizeof(v12));
  v8 = objc_msgSend((id)TSWPParagraphEnumerator::paragraphStyle(&v12, 0), "intValueForProperty:", 44);
  if (v8 == -1)
  {
    v9 = -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
    objc_opt_class();
    -[TSDInteractiveCanvasController layoutForInfo:](v9, "layoutForInfo:", self->_storage);
    v10 = (void *)TSUDynamicCast();
    if (!v10 || (v8 = objc_msgSend(v10, "naturalDirection"), v8 == -1))
      v8 = TSWPParagraphEnumerator::paragraphRunsRightToLeft(&v12);
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v12);
  return v8;
}

- (void)p_removeAutocorrectionAtCharIndex:(unint64_t)a3
{
  id v4;

  v4 = -[TSWPStorage dictationAndAutocorrectionKeyAtCharIndex:effectiveRange:](self->_storage, "dictationAndAutocorrectionKeyAtCharIndex:effectiveRange:", a3, 0);
  if (v4)
    -[NSMutableDictionary removeObjectForKey:](self->_autocorrectedEntries, "removeObjectForKey:", v4);
}

- (id)dictationInterpretationsAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  id result;
  _NSRange v7;

  if (a4)
    *a4 = *(_NSRange *)MEMORY[0x24BEB3BF0];
  result = -[TSWPStorage dictationAndAutocorrectionKeyAtCharIndex:effectiveRange:](self->_storage, "dictationAndAutocorrectionKeyAtCharIndex:effectiveRange:", a3, &v7);
  if (result)
  {
    result = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictationInterpretations, "objectForKeyedSubscript:", result);
    if (a4)
    {
      if (result)
        *a4 = v7;
    }
  }
  return result;
}

- (void)addAllDictationInterpretationRangesInRange:(_NSRange)a3 toRanges:(void *)a4
{
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  void *__p;
  _QWORD *v21;
  uint64_t v22;

  __p = 0;
  v21 = 0;
  v22 = 0;
  -[TSWPStorage addAllDictationAndAutocorrectionKeyRangesInRange:toRanges:](self->_storage, "addAllDictationAndAutocorrectionKeyRangesInRange:toRanges:", a3.location, a3.length, &__p);
  v6 = __p;
  if (self->_dictationInterpretations)
  {
    v7 = v21;
    if (__p != v21)
    {
      do
      {
        if (-[NSMutableDictionary objectForKeyedSubscript:](self->_dictationInterpretations, "objectForKeyedSubscript:", -[TSWPStorage dictationAndAutocorrectionKeyAtCharIndex:effectiveRange:](self->_storage, "dictationAndAutocorrectionKeyAtCharIndex:effectiveRange:", *v6, 0)))
        {
          v9 = (_OWORD *)*((_QWORD *)a4 + 1);
          v8 = *((_QWORD *)a4 + 2);
          if ((unint64_t)v9 >= v8)
          {
            v11 = ((uint64_t)v9 - *(_QWORD *)a4) >> 4;
            v12 = v11 + 1;
            if ((unint64_t)(v11 + 1) >> 60)
              abort();
            v13 = v8 - *(_QWORD *)a4;
            if (v13 >> 3 > v12)
              v12 = v13 >> 3;
            if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
              v14 = 0xFFFFFFFFFFFFFFFLL;
            else
              v14 = v12;
            if (v14)
              v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a4 + 16, v14);
            else
              v15 = 0;
            v16 = &v15[16 * v11];
            *(_OWORD *)v16 = *(_OWORD *)v6;
            v18 = *(char **)a4;
            v17 = (char *)*((_QWORD *)a4 + 1);
            v19 = v16;
            if (v17 != *(char **)a4)
            {
              do
              {
                *((_OWORD *)v19 - 1) = *((_OWORD *)v17 - 1);
                v19 -= 16;
                v17 -= 16;
              }
              while (v17 != v18);
              v17 = *(char **)a4;
            }
            v10 = v16 + 16;
            *(_QWORD *)a4 = v19;
            *((_QWORD *)a4 + 1) = v16 + 16;
            *((_QWORD *)a4 + 2) = &v15[16 * v14];
            if (v17)
              operator delete(v17);
          }
          else
          {
            *v9 = *(_OWORD *)v6;
            v10 = v9 + 1;
          }
          *((_QWORD *)a4 + 1) = v10;
        }
        v6 += 2;
      }
      while (v6 != v7);
      v6 = __p;
    }
  }
  if (v6)
  {
    v21 = v6;
    operator delete(v6);
  }
}

- (BOOL)suppressesTextInspector
{
  return 0;
}

- (BOOL)shouldShowSelectedTextAsFocused
{
  return 0;
}

- (TSWPInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (NSAttributedString)markedText
{
  return self->_markedText;
}

- (BOOL)knobTracking
{
  return self->_knobTracking;
}

- (unint64_t)knobTag
{
  return self->_knobTag;
}

- (void)setKnobTag:(unint64_t)a3
{
  self->_knobTag = a3;
}

- (CGPoint)knobTrackingDragPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_knobTrackingDragPoint.x;
  y = self->_knobTrackingDragPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setKnobTrackingDragPoint:(CGPoint)a3
{
  self->_knobTrackingDragPoint = a3;
}

- (unsigned)knobTrackingTapCount
{
  return self->_knobTrackingTapCount;
}

- (void)setKnobTrackingTapCount:(unsigned int)a3
{
  self->_knobTrackingTapCount = a3;
}

- (TSWPCharacterStyle)insertionStyle
{
  return self->_insertionStyle;
}

- (BOOL)canCoalesce
{
  return self->_canCoalesce;
}

- (void)setCanCoalesce:(BOOL)a3
{
  self->_canCoalesce = a3;
}

- (BOOL)isBecomingActive
{
  return self->_isBecomingActive;
}

- (void)setIsBecomingActive:(BOOL)a3
{
  self->_isBecomingActive = a3;
}

- (BOOL)supportsDataDetectors
{
  return self->_supportsDataDetectors;
}

- (void)setSupportsDataDetectors:(BOOL)a3
{
  self->_supportsDataDetectors = a3;
}

- (BOOL)isEditingPlainText
{
  return self->_isEditingPlainText;
}

- (void)setIsEditingPlainText:(BOOL)a3
{
  self->_isEditingPlainText = a3;
}

- (BOOL)shouldDisplayKeyboard
{
  return self->_shouldDisplayKeyboard;
}

- (void)setShouldDisplayKeyboard:(BOOL)a3
{
  self->_shouldDisplayKeyboard = a3;
}

- (unint64_t)currentSelectionFlags
{
  return self->_currentSelectionFlags;
}

- (BOOL)selectionLastModifiedWithKnob
{
  return self->_selectionLastModifiedWithKnob;
}

- (BOOL)selectionLastModifiedWithKeyboard
{
  return self->_selectionLastModifiedWithKeyboard;
}

- (BOOL)suppressDataDetectorsOnResignTextInput
{
  return self->_suppressDataDetectorsOnResignTextInput;
}

- (TSDAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (CGPoint)autoscrollPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_autoscrollPoint.x;
  y = self->_autoscrollPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAutoscrollPoint:(CGPoint)a3
{
  self->_autoscrollPoint = a3;
}

- (TSDEditor)hostEditor
{
  return self->_hostEditor;
}

- (void)setHostEditor:(id)a3
{
  self->_hostEditor = (TSDEditor *)a3;
}

- (BOOL)suppressBreaks
{
  return self->_suppressBreaks;
}

- (void)setSuppressBreaks:(BOOL)a3
{
  self->_suppressBreaks = a3;
}

- (BOOL)suppressPhonetics
{
  return self->_suppressPhonetics;
}

- (void)setSuppressPhonetics:(BOOL)a3
{
  self->_suppressPhonetics = a3;
}

- (BOOL)suppressTabs
{
  return self->_suppressTabs;
}

- (void)setSuppressTabs:(BOOL)a3
{
  self->_suppressTabs = a3;
}

- (BOOL)disableInspector
{
  return self->_disableInspector;
}

- (void)setDisableInspector:(BOOL)a3
{
  self->_disableInspector = a3;
}

- (BOOL)coalescingText
{
  return self->_coalescingText;
}

- (BOOL)canCoalesceBreakingCharacters
{
  return self->_canCoalesceBreakingCharacters;
}

- (void)setCanCoalesceBreakingCharacters:(BOOL)a3
{
  self->_canCoalesceBreakingCharacters = a3;
}

- (id)tsax_listItemLabelForCharIndex:(unint64_t)a3 textIsLiteral:(BOOL *)a4
{
  id result;
  uint64_t v8;
  int v9;
  uint64_t v10;

  *a4 = 1;
  -[TSDInteractiveCanvasController layoutIfNeeded](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
  v10 = 0;
  result = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v10, 1);
  if (result)
  {
    v8 = *((_QWORD *)result + 22);
    if (!v8)
      return 0;
    v9 = *(_DWORD *)(v8 + 64);
    if ((v9 - 2) < 2)
      return *(id *)(v8 + 96);
    if (v9 == 1)
    {
      result = (id)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Image bullet"), &stru_24D82FEB0, CFSTR("TSText"));
      *a4 = 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (_NSRange)tsax_rangeOfLineFragmentAtCharIndex:(unint64_t)a3
{
  NSUInteger *v5;
  NSUInteger *v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  _NSRange result;

  -[TSDInteractiveCanvasController layoutIfNeeded](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
  v9 = 0;
  v5 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v9, 1);
  v6 = (NSUInteger *)MEMORY[0x24BEB3BF0];
  if (v5)
    v6 = v5;
  v7 = *v6;
  v8 = v6[1];
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)dragItemForCurrentSelectionWithDragInteraction:(id)a3 session:(id)a4 withTouchPoint:(CGPoint)a5
{
  double y;
  double x;
  TSWPInteractiveCanvasController *v10;
  TSWPStorage *v11;
  TSWPSelection *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  TSWPStorageItemProvider *v21;
  void *v22;
  TSWPDragItem *v23;
  TSWPDragItem *v24;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  y = a5.y;
  x = a5.x;
  v10 = -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
  v11 = -[TSWPEditingController storage](self, "storage");
  v12 = -[TSWPEditingController selection](self, "selection");
  v13 = -[TSWPEditingController stringFromSelection](self, "stringFromSelection");
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v10, "convertBoundsToUnscaledPoint:", x, y);
  if (v11
    && (v16 = v14, v17 = v15, -[TSWPSelection range](v12, "range"), v18)
    && objc_msgSend(v13, "length")
    && -[TSWPEditingController isUnscaledPointInTextSelection:](self, "isUnscaledPointInTextSelection:", v16, v17))
  {
    v28 = 0;
    -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](v10, "hitKnobAtPoint:returningRep:", &v28, v16, v17);
    v19 = 0;
    if (!v28)
    {
      v26 = 0u;
      v27 = 0u;
      v20 = +[TSWPEditingController _targetedDragPreviewForSelection:interactiveCanvasController:reps:applyScale:imageFrameUnion:](TSWPEditingController, "_targetedDragPreviewForSelection:interactiveCanvasController:reps:applyScale:imageFrameUnion:", v12, v10, -[TSWPEditingController _repsForStorage:selection:](self, "_repsForStorage:selection:", v11, v12), 0, &v26);
      v21 = +[TSWPStorageItemProvider storageItemProviderWithString:](TSWPStorageItemProvider, "storageItemProviderWithString:", v13);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15F0]), "initWithObject:", v21);
      v23 = [TSWPDragItem alloc];
      v24 = -[TSWPDragItem initWithDragPreview:canvasRect:](v23, "initWithDragPreview:canvasRect:", v20, v26, v27);
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF69F0]), "initWithItemProvider:", v22);
      objc_msgSend(v19, "setLocalObject:", v24);

    }
  }
  else
  {
    v19 = (id)objc_msgSend((id)objc_opt_class(), "dragItemForHitRepWithDragInteraction:session:canvasView:icc:withTouchPoint:", a3, a4, objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "view"), self->_interactiveCanvasController, x, y);
  }
  return v19;
}

+ (id)dragItemForHitRepWithDragInteraction:(id)a3 session:(id)a4 canvasView:(id)a5 icc:(id)a6 withTouchPoint:(CGPoint)a7
{
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  TSWPURLDragItem *v50;
  uint64_t v51;
  uint64_t v52;
  TSWPURLDragItem *v53;

  objc_msgSend(a6, "convertBoundsToUnscaledPoint:", a7.x, a7.y);
  v12 = v11;
  v14 = v13;
  objc_opt_class();
  objc_msgSend(a6, "hitRep:", v12, v14);
  v15 = (void *)TSUDynamicCast();
  objc_msgSend(v15, "convertNaturalPointFromUnscaledCanvas:", v12, v14);
  v17 = v16;
  v19 = v18;
  objc_opt_class();
  objc_msgSend(v15, "smartFieldAtPoint:", v17, v19);
  v20 = TSUDynamicCast();
  if (!v20)
  {
    v24 = 0;
    return v24;
  }
  v21 = (void *)v20;
  objc_msgSend(a6, "delegate");
  v22 = objc_opt_respondsToSelector();
  v23 = (void *)objc_msgSend(a6, "delegate");
  if ((v22 & 1) != 0)
  {
    v24 = (id)objc_msgSend(v23, "interactiveCanvasController:dragItemForSmartField:interaction:session:", a6, v21, a3, a4);
    if (!v24)
      return v24;
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v25 = objc_msgSend((id)objc_msgSend(a6, "delegate"), "interactiveCanvasController:allowsDragOfSmartField:", a6, v21) ^ 1;
  else
    v25 = 0;
  objc_opt_class();
  v26 = (void *)TSUDynamicCast();
  v24 = 0;
  if (objc_msgSend(v26, "url") && (v25 & 1) == 0)
  {
    v27 = objc_msgSend(v26, "displayText");
    if (!v27)
      v27 = objc_msgSend((id)objc_msgSend(v26, "url"), "absoluteString");
    v28 = objc_msgSend(v26, "range");
    objc_msgSend(v15, "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v28, v29));
    objc_msgSend(v15, "convertNaturalRectToUnscaledCanvas:");
    objc_msgSend(a6, "convertUnscaledToBoundsPoint:", TSDCenterOfRect(v30, v31, v32, v33));
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A00]), "initWithContainer:center:", a5, v34, v35);
    v37 = (id)objc_msgSend(MEMORY[0x24BDF6E88], "previewForURL:title:target:", objc_msgSend(v26, "url"), v27, v36);

    v38 = objc_msgSend(MEMORY[0x24BDD15F0], "itemProviderWithURL:title:", objc_msgSend(v26, "url"), v27);
    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF69F0]), "initWithItemProvider:", v38);
    objc_msgSend(v24, "setLocalObject:", v37);

    if (v24)
    {
LABEL_14:
      objc_msgSend(v24, "localObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = objc_msgSend(v21, "range");
        objc_msgSend(v15, "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v39, v40));
        objc_msgSend(v15, "convertNaturalRectToUnscaledCanvas:");
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v49 = objc_msgSend(v24, "localObject");
        v50 = [TSWPURLDragItem alloc];
        v51 = objc_msgSend(v21, "range");
        v53 = -[TSWPURLDragItem initWithDragPreview:canvasRect:canvasDragPoint:range:](v50, "initWithDragPreview:canvasRect:canvasDragPoint:range:", v49, v51, v52, v42, v44, v46, v48, v12, v14);
        objc_msgSend(v24, "setLocalObject:", v53);

      }
    }
  }
  return v24;
}

+ (id)previewForDragItem:(id)a3
{
  char isKindOfClass;
  void *v5;

  objc_msgSend(a3, "localObject");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = (void *)objc_msgSend(a3, "localObject");
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (id)objc_msgSend((id)objc_msgSend(a3, "localObject"), "targetedDragPreview");
    return 0;
  }
  return v5;
}

+ (id)retargetedDragItem:(id)a3 withDefault:(id)a4 canvasView:(id)a5 icc:(id)a6
{
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  CGRect v41;
  CGRect v42;

  objc_msgSend(a3, "localObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v10 = (void *)objc_msgSend(a3, "localObject");
  objc_msgSend(v10, "canvasRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_msgSend(a5, "superview");
  objc_msgSend(a6, "convertUnscaledToBoundsRect:", v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend((id)objc_msgSend(v19, "superview"), "convertRect:fromView:", a5, v20, v22, v24, v26);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  objc_msgSend(v19, "frame");
  v42.origin.x = TSDRectWithSize();
  v42.origin.y = v36;
  v42.size.width = v37;
  v42.size.height = v38;
  v41.origin.x = v29;
  v41.origin.y = v31;
  v41.size.width = v33;
  v41.size.height = v35;
  if (!CGRectIntersectsRect(v41, v42))
    return 0;
  v39 = (void *)objc_msgSend(v10, "retargetedDragPreviewForDefaultTargetedDragPreview:icc:canvasView:boundsRect:", a4, a6, a5, v21, v23, v25, v27);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "view"), "layer"), "setZPosition:", 1.0);
  return v39;
}

+ (id)dropProposalForSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(a3, "items", 0);
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "localObject");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A10]), "initWithDropOperation:", 0);
          return v4;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

+ (id)_targetedDragPreviewForSelection:(id)a3 interactiveCanvasController:(id)a4 reps:(id)a5 applyScale:(BOOL)a6 imageFrameUnion:(CGRect *)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  double v45;
  double v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  __int128 v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL4 v64;
  id obj;
  __int128 v68;
  __int128 v69;
  id v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v64 = a6;
  v94 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a5, "count"));
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = a5;
  v13 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v87;
    v68 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v69 = *MEMORY[0x24BDBF090];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v87 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        *(_OWORD *)&v73.a = v69;
        *(_OWORD *)&v73.c = v68;
        v18 = (void *)objc_msgSend(v17, "textImageForSelection:frame:usingGlyphRect:drawBackground:shouldPulsate:suppressInvisibles:", a3, &v73, 0, 0, 0, 1);
        objc_msgSend(v17, "convertNaturalRectToUnscaledCanvas:", v73.a, v73.b, v73.c, v73.d);
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v95.origin.x = x;
        v95.origin.y = y;
        v95.size.width = width;
        v95.size.height = height;
        if (CGRectIsNull(v95))
        {
          height = v26;
          width = v24;
          y = v22;
          x = v20;
        }
        else
        {
          v96.origin.x = x;
          v96.origin.y = y;
          v96.size.width = width;
          v96.size.height = height;
          v98.origin.x = v20;
          v98.origin.y = v22;
          v98.size.width = v24;
          v98.size.height = v26;
          v97 = CGRectUnion(v96, v98);
          x = v97.origin.x;
          y = v97.origin.y;
          width = v97.size.width;
          height = v97.size.height;
        }
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", objc_msgSend(v18, "UIImage"));
        objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);
        objc_msgSend(v71, "addObject:", v27);

        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v28 = (void *)objc_msgSend(v17, "selectionRects");
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v83 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * j), "CGRectValue");
              objc_msgSend(v17, "convertNaturalRectToUnscaledCanvas:");
              objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:"));
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
          }
          while (v30);
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
    }
    while (v14);
  }
  v33 = (void *)objc_msgSend((id)objc_msgSend(a4, "layerHost"), "asiOSCVC");
  v34 = objc_msgSend(v33, "view");
  objc_msgSend(a4, "convertUnscaledToBoundsPoint:", TSDCenterOfRect(x, y, width, height));
  v36 = v35;
  v38 = v37;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", TSDRectWithCenterAndSize(v35, v37, width));
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v40 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v79 != v42)
          objc_enumerationMutation(v71);
        v44 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
        objc_msgSend(v44, "frame");
        objc_msgSend(v44, "setFrame:", TSDSubtractPoints(v45, v46, x));
        objc_msgSend(v39, "addSubview:", v44);
      }
      v41 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    }
    while (v41);
  }
  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v48 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v75;
    do
    {
      for (m = 0; m != v49; ++m)
      {
        if (*(_QWORD *)v75 != v50)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * m), "CGRectValue");
        objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", TSDSubtractPoints(v52, v53, x)));
      }
      v49 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    }
    while (v49);
  }

  memset(&v73, 0, sizeof(v73));
  if (v64)
  {
    objc_msgSend(a4, "viewScale");
    v55 = v54;
    objc_msgSend(a4, "viewScale");
    CGAffineTransformMakeScale(&v73, v55, v56);
  }
  else
  {
    v57 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v73.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v73.c = v57;
    *(_OWORD *)&v73.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  v58 = objc_alloc(MEMORY[0x24BDF6A00]);
  v72 = v73;
  v59 = (void *)objc_msgSend(v58, "initWithContainer:center:transform:", v34, &v72, v36, v38);
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69F8]), "initWithTextLineRects:", v47);

  v61 = (void *)objc_msgSend(v33, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v60, "setBackgroundColor:", objc_msgSend(v61, "backgroundColorForDragUIPlatter"));
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E88]), "initWithView:parameters:target:", v39, v60, v59);

  if (a7)
  {
    a7->origin.x = x;
    a7->origin.y = y;
    a7->size.width = width;
    a7->size.height = height;
  }
  return v62;
}

- (BOOL)pIsSelectionPlaceHolderText
{
  return -[TSWPEditingController pIsSelectionPlaceHolderTextWithSelection:](self, "pIsSelectionPlaceHolderTextWithSelection:", self->_selection);
}

- (BOOL)pIsSelectionPlaceHolderTextWithSelection:(id)a3
{
  int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v12;
  uint64_t v13;

  v5 = objc_msgSend(a3, "isValid");
  if (v5)
  {
    v6 = objc_msgSend(a3, "range");
    if (!v7)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
    v8 = v6;
    v9 = v6 + v7;
    if (v6 < v6 + v7)
    {
      do
      {
        v10 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_storage, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v8, 6, &v12);
        if (!v10 || (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
          goto LABEL_8;
        v8 = v13 + v12;
      }
      while (v13 + v12 < v9);
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)p_caretCharIndexForLayoutOrderCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  unint64_t v4;
  unint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TSWPLineFragment *v10;
  unint64_t v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if ((unint64_t)(a4 - 2) > 1)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_caretCharIndexForLayoutOrderCharIndex:inDirection:]");
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 107, CFSTR("Unsupported vertical character direction"));
    }
    else
    {
      result = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        return result;
      v7 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:", a3);
      v9 = v8;
      -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
      v15 = 0;
      v10 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v4, &v15, 0);
      if (v10)
      {
        v11 = TSWPLineFragment::caretCharIndexForLayoutOrderCharIndex(v10, v4, self->_storage);
        if (v11 <= v7 + v9 && v11 >= v7)
          return v11;
      }
    }
  }
  return v4;
}

- (unint64_t)p_layoutOrderCharIndexForCaretCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  unint64_t v4;
  unint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TSWPLineFragment *v10;
  unint64_t v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if ((unint64_t)(a4 - 2) > 1)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_layoutOrderCharIndexForCaretCharIndex:inDirection:]");
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 151, CFSTR("Unsupported vertical character direction"));
    }
    else
    {
      result = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        return result;
      v7 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:", a3);
      v9 = v8;
      -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
      v15 = 0;
      v10 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v4, &v15, 0);
      if (v10)
      {
        v11 = TSWPLineFragment::layoutOrderCharIndexForCaretCharIndex(v10, v4, self->_storage);
        if (v11 <= v7 + v9 && v11 >= v7)
          return v11;
      }
    }
  }
  return v4;
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  return -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:", a3, 0, a4);
}

- (_NSRange)p_expandParagraphRangeForEnumerator:(TSWPParagraphEnumerator *)a3
{
  NSUInteger location;
  NSUInteger v5;
  NSUInteger length;
  NSUInteger v7;
  NSRange v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSRange v12;
  NSRange v13;
  NSRange v14;
  _NSRange result;
  NSRange v16;
  NSRange v17;

  location = TSWPParagraphEnumerator::paragraphTextRange(a3);
  length = v5;
  if (!TSWPParagraphEnumerator::isFirstParagraph(a3))
  {
    TSWPParagraphEnumerator::operator--(a3);
    v16.location = TSWPParagraphEnumerator::paragraphTextRange(a3);
    v16.length = v7;
    v13.location = location;
    v13.length = length;
    v8 = NSUnionRange(v13, v16);
    location = v8.location;
    length = v8.length;
    TSWPParagraphEnumerator::operator++(a3);
  }
  if (TSWPParagraphEnumerator::isLastParagraph(a3))
  {
    v9 = location;
    v10 = length;
  }
  else
  {
    TSWPParagraphEnumerator::operator++(a3);
    v17.location = TSWPParagraphEnumerator::paragraphTextRange(a3);
    v17.length = v11;
    v14.location = location;
    v14.length = length;
    v12 = NSUnionRange(v14, v17);
    v10 = v12.length;
    v9 = v12.location;
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TSWPStorage *storage;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  TSWPStorage *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  TSWPLineFragment *v30;
  TSWPLineFragment *v31;
  int v32;
  unint64_t v33;
  int v36;
  int v37;
  BOOL v38;
  _BOOL4 v39;
  int v40;
  int v41;
  unint64_t v42;
  _BOOL4 v43;
  int v44;
  TSWPLineFragment *v45;
  TSWPLineFragment *v46;
  uint64_t v47;
  TSWPLineFragment *v48;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  TSWPStorage *v55;
  unint64_t v56;
  uint64_t v59;
  TSWPParagraphEnumerator v60;

  v8 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  v10 = v9;
  storage = self->_storage;
  if (storage)
    -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](storage, "paragraphEnumeratorAtCharIndex:styleProvider:", a3, 0);
  else
    memset(&v60, 0, sizeof(v60));
  v12 = -[TSWPEditingController p_expandParagraphRangeForEnumerator:](self, "p_expandParagraphRangeForEnumerator:", &v60);
  v14 = -[TSWPStorage textSourceForLayoutInRange:](-[TSWPEditingController storage](self, "storage"), "textSourceForLayoutInRange:", v12, v13);
  v15 = v8 + v10;
  v16 = 1;
  switch(a5)
  {
    case 0:
      if (v15 <= a3)
        goto LABEL_9;
      while (-[TSWPStorage anchoredDrawableAttachmentCharacterAtCharIndex:](self->_storage, "anchoredDrawableAttachmentCharacterAtCharIndex:", a3))
      {
        if (v15 == ++a3)
        {
          a3 = v15;
          break;
        }
      }
LABEL_9:
      v17 = objc_msgSend(v14, "charIndexMappedFromStorage:", a3);
      if (v17 >= objc_msgSend(v14, "charIndexMappedFromStorage:", v15))
      {
        v51 = objc_msgSend(v14, "charIndexRemappedFromStorage:", v15);
        goto LABEL_74;
      }
      v18 = objc_msgSend(-[TSWPStorage string](self->_storage, "string"), "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v14, "charIndexMappedToStorage:", v17));
      v20 = v18 + v19;
      if (v18 + v19 > v15)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:]");
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 237, CFSTR("composed character extends past storage boundary"));
      }
      goto LABEL_83;
    case 1:
      do
      {
        v20 = a3;
        if (a3 <= v8)
          break;
        --a3;
      }
      while (-[TSWPStorage anchoredDrawableAttachmentCharacterAtCharIndex:](self->_storage, "anchoredDrawableAttachmentCharacterAtCharIndex:", v20 - 1));
      v23 = objc_msgSend(v14, "charIndexMappedFromStorage:", v20);
      if (v23 > objc_msgSend(v14, "charIndexMappedFromStorage:", v8))
      {
        v24 = objc_msgSend(v14, "charIndexMappedToStorage:", v23 - 1);
        v25 = objc_msgSend(-[TSWPStorage string](self->_storage, "string"), "length");
        v26 = self->_storage;
        if (v24 >= v25)
          v27 = objc_msgSend(-[TSWPStorage string](v26, "string"), "length");
        else
          v27 = objc_msgSend(-[TSWPStorage string](v26, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v24);
        v20 = v27;
      }
      v52 = objc_msgSend(v14, "charIndexMappedToStorage:", v23);
      if (v52 > v8)
      {
        v53 = objc_msgSend(v14, "charIndexRemappedFromStorage:", v52 - 1);
        v54 = objc_msgSend(-[TSWPStorage string](self->_storage, "string"), "length");
        v55 = self->_storage;
        v56 = v53 >= v54
            ? objc_msgSend(-[TSWPStorage string](v55, "string"), "length")
            : objc_msgSend(-[TSWPStorage string](v55, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v53);
        if (v56 < v20)
          v20 = v56;
      }
      goto LABEL_83;
    case 2:
      goto LABEL_19;
    case 3:
      v16 = 0;
LABEL_19:
      -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
      v59 = 0;
      v30 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v59, 0);
      v31 = v30;
      if (!v30)
      {
        v20 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_43;
      }
      if (v16)
        v32 = 2;
      else
        v32 = 3;
      v33 = TSWPLineFragment::nextOrPreviousCharIndexForDirection((uint64_t)v30, a3, v32, self->_storage);
      v20 = v33;
      if (v33 == 0x7FFFFFFFFFFFFFFFLL || v33 < v8 || v33 > v15)
      {
        if (a4 && *((_QWORD *)v31 + 1) + *(_QWORD *)v31 > a3)
        {
          v36 = *a4;
          v37 = TSWPLineFragment::writingDirectionForCharIndex(v31, a3) == 1;
          v38 = v36 == v37;
          v39 = v36 != v37;
          v40 = v38;
          if (!v16)
            v39 = v40;
          if (v39
            && (IsParagraphBreakingCharacter(-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", a3)) & 1) == 0)
          {
            *a4 = v36 ^ 1;
            if (a3 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v20 = a3;
              goto LABEL_83;
            }
          }
        }
LABEL_43:
        v41 = v16 ^ -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtCharIndex:](self->_storage, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", a3);
        if (v31)
        {
          v42 = *(_QWORD *)v31;
          v31 = (TSWPLineFragment *)*((_QWORD *)v31 + 1);
          if (v41)
            goto LABEL_45;
        }
        else
        {
          v42 = a3;
          if (v41)
          {
LABEL_45:
            if ((unint64_t)v31 + v42 < v15)
            {
              if (v31)
                v20 = (unint64_t)v31 + v42;
              else
                v20 = v42 + 1;
            }
            goto LABEL_56;
          }
        }
        if (v42 > v8)
          v20 = v42 - 1;
LABEL_56:
        if (v20 == 0x7FFFFFFFFFFFFFFFLL
          || (v45 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v20, &v59, 0), (v46 = v45) == 0))
        {
          if (v41)
            v48 = v31;
          else
            v48 = 0;
          v20 = (unint64_t)v48 + v42;
        }
        else
        {
          if (v16)
            v47 = TSWPLineFragment::leftMostCharIndex(v45);
          else
            v47 = TSWPLineFragment::rightMostCharIndex(v45);
          v20 = v47;
          if (a4 && (*((_DWORD *)v46 + 6) & 0x4800) == 0x4000)
            *a4 = 1;
        }
        if (v20 == 0x7FFFFFFFFFFFFFFFLL || v20 < v8 || v20 > v15)
        {
          v51 = objc_msgSend(v14, "charIndexRemappedFromStorage:", a3);
LABEL_74:
          v20 = v51;
        }
        goto LABEL_83;
      }
      if (!a4)
        goto LABEL_83;
      v43 = *a4;
      v44 = TSWPLineFragment::writingDirectionForCharIndex(v31, v33);
      if (v44 == TSWPLineFragment::writingDirectionForCharIndex(v31, a3))
      {
        if (*a4)
          goto LABEL_83;
      }
      else
      {
        *a4 = !v43;
        if (!v43)
          goto LABEL_83;
      }
      if (v20 == *((_QWORD *)v31 + 1) + *(_QWORD *)v31)
        *a4 = 1;
LABEL_83:
      TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v60);
      return v20;
    default:
      v28 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:]");
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 346, CFSTR("Unsupported vertical character direction"));
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_83;
  }
}

- (BOOL)p_isLayoutLeftToRightAtCharIndex:(unint64_t)a3
{
  TSWPLineFragment *v5;
  uint64_t v7;

  -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
  v7 = 0;
  v5 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v7, 0);
  return !v5 || TSWPLineFragment::writingDirectionForCharIndex(v5, a3) == 0;
}

- (unint64_t)p_adjustedCharIndexForWordTestingFromCharIndex:(unint64_t)a3 forDirection:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  TSWPStorage *storage;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  TSWPParagraphEnumerator v29;

  if ((unint64_t)a4 >= 4)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 375, CFSTR("Bad input direction."));
  }
  switch(a4)
  {
    case 0:
      storage = self->_storage;
      if (storage)
        -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](storage, "paragraphEnumeratorAtCharIndex:styleProvider:", a3, 0);
      else
        memset(&v29, 0, sizeof(v29));
      v26 = -[TSWPEditingController p_expandParagraphRangeForEnumerator:](self, "p_expandParagraphRangeForEnumerator:", &v29);
      a3 = objc_msgSend(-[TSWPStorage textSourceForLayoutInRange:](-[TSWPEditingController storage](self, "storage"), "textSourceForLayoutInRange:", v26, v27), "charIndexRemappedFromStorage:", a3);
      TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v29);
      break;
    case 1:
      v22 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", a3, 1);
      if (v22 == 0x7FFFFFFFFFFFFFFFLL || v22 == a3)
        a3 = 0x7FFFFFFFFFFFFFFFLL;
      else
        a3 = v22;
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v24 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:]");
        v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm");
        v15 = (void *)v24;
        v16 = v25;
        v17 = 424;
        goto LABEL_32;
      }
      break;
    case 2:
      if (!-[TSWPEditingController p_isLayoutLeftToRightAtCharIndex:](self, "p_isLayoutLeftToRightAtCharIndex:", a3))
      {
        v10 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", a3, 2);
        v11 = v10 == 0x7FFFFFFFFFFFFFFFLL || v10 == a3;
        a3 = v11 ? 0x7FFFFFFFFFFFFFFFLL : v10;
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:]");
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm");
          v15 = (void *)v12;
          v16 = v13;
          v17 = 410;
          goto LABEL_32;
        }
      }
      break;
    case 3:
      if (-[TSWPEditingController p_isLayoutLeftToRightAtCharIndex:](self, "p_isLayoutLeftToRightAtCharIndex:", a3))
      {
        v18 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", a3, 3);
        v19 = v18 == 0x7FFFFFFFFFFFFFFFLL || v18 == a3;
        a3 = v19 ? 0x7FFFFFFFFFFFFFFFLL : v18;
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:]");
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm");
          v15 = (void *)v20;
          v16 = v21;
          v17 = 389;
LABEL_32:
          objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v14, v17, CFSTR("Should not have received NSNotFound."));
          a3 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      break;
    default:
      return a3;
  }
  return a3;
}

- (__CFStringTokenizer)p_createTokenizerForCharIndex:(unint64_t)a3 outTokenizerRange:(_NSRange *)a4
{
  NSUInteger v7;
  __CFStringTokenizer *v8;

  a4->location = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:");
  a4->length = v7;
  v8 = CFStringTokenizerCreate(0, (CFStringRef)-[TSWPStorage string](self->_storage, "string"), *(CFRange *)a4, 0, 0);
  CFStringTokenizerGoToTokenAtIndex(v8, a3);
  return v8;
}

- (int)p_moveFromCharIndex:(unint64_t *)a3 tokenizerRef:(__CFStringTokenizer *)a4 tokenizerRange:(_NSRange *)a5 direction:(int64_t)a6 currentWordRange:(_NSRange)a7 newWordRange:(_NSRange *)a8 reasonToStop:(unsigned int)a9
{
  TSWPStorage *storage;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  __CFStringTokenizer *v17;
  CFStringTokenizerTokenType v19;
  BOOL v20;
  BOOL v21;
  CFRange v22;
  CFIndex v23;
  CFIndex v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  CFRange CurrentTokenRange;
  _NSRange *v36;
  id v37;
  NSUInteger length;
  NSUInteger location;
  TSWPParagraphEnumerator v42;

  length = a7.length;
  location = a7.location;
  storage = self->_storage;
  if (storage)
    -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](storage, "paragraphEnumeratorAtCharIndex:styleProvider:", *a3, 0);
  else
    memset(&v42, 0, sizeof(v42));
  v13 = -[TSWPEditingController p_expandParagraphRangeForEnumerator:](self, "p_expandParagraphRangeForEnumerator:", &v42);
  v37 = -[TSWPStorage textSourceForLayoutInRange:](-[TSWPEditingController storage](self, "storage"), "textSourceForLayoutInRange:", v13, v14);
  objc_msgSend(v37, "charRangeMappedFromStorage:", location, length);
  v36 = a8;
  v15 = *a3;
  while (1)
  {
    v16 = -[TSWPEditingController p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:", v15, a6, v36);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_38;
    v17 = *a4;
    if (!*a4)
      goto LABEL_13;
    if (v16 < a5->location || v16 - a5->location >= a5->length)
    {
      CFRelease(v17);
      *a4 = 0;
LABEL_13:
      v17 = -[TSWPEditingController p_createTokenizerForCharIndex:outTokenizerRange:](self, "p_createTokenizerForCharIndex:outTokenizerRange:", v16, a5);
      *a4 = v17;
    }
    v19 = CFStringTokenizerGoToTokenAtIndex(v17, v16);
    if ((a9 & 2) != 0 && !v19)
    {
      v31 = 2;
      goto LABEL_42;
    }
    if (!v19)
      goto LABEL_32;
    v20 = location == *MEMORY[0x24BEB3BF0] && length == *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
    v21 = v20;
    if ((a9 & 4) != 0 && !v21)
      break;
    if ((a9 & 8) != 0)
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(*a4);
      v23 = CurrentTokenRange.location;
      v24 = CurrentTokenRange.length;
      v31 = 8;
      goto LABEL_41;
    }
LABEL_32:
    v30 = -[TSWPEditingController charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", *a3, a6);
    v15 = v30;
    if (v30 == 0x7FFFFFFFFFFFFFFFLL || v30 == *a3)
    {
      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v32 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:]");
        objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 533, CFSTR("Should not have received NSNotFound."));
      }
LABEL_38:
      v31 = 1;
      goto LABEL_42;
    }
    *a3 = v30;
  }
  v22 = CFStringTokenizerGetCurrentTokenRange(*a4);
  v23 = v22.location;
  v24 = v22.length;
  objc_msgSend(v37, "charRangeMappedFromStorage:", v22.location, v22.length);
  v25 = NSIntersectionRangeInclusive();
  v27 = v26;
  v28 = NSIntersectionRangeInclusive();
  if (v22.location == location && v22.length == length || v29 | v28 && (v27 || !v25))
    goto LABEL_32;
  v31 = 4;
LABEL_41:
  v36->location = v23;
  v36->length = v24;
LABEL_42:
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v42);
  return v31;
}

- (unint64_t)charIndexMovingByWordFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  unint64_t v11;
  unint64_t result;
  CFRange CurrentTokenRange;
  unsigned int v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFTypeRef cf;
  __int128 v27;
  __int128 v28;
  unint64_t v29;

  if ((unint64_t)a4 > 3)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) charIndexMovingByWordFromCharIndex:inDirection:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 646, CFSTR("Unsupported direction"));
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v5 = a3;
  v7 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  v9 = v8;
  v29 = v5;
  v10 = (__int128 *)MEMORY[0x24BEB3BF0];
  v28 = *MEMORY[0x24BEB3BF0];
  v11 = -[TSWPEditingController p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:", v5, a4);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    return result;
  v27 = *v10;
  cf = -[TSWPEditingController p_createTokenizerForCharIndex:outTokenizerRange:](self, "p_createTokenizerForCharIndex:outTokenizerRange:", v11, &v27);
  CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)cf);
  LODWORD(v24) = 7;
  v14 = -[TSWPEditingController p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:](self, "p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:", &v29, &cf, &v27, a4, CurrentTokenRange.location, CurrentTokenRange.length, &v28, v24);
  v15 = CurrentTokenRange.location == *(_QWORD *)v10 && CurrentTokenRange.length == *((_QWORD *)v10 + 1);
  if (v15 || (v16 = v29, v29 == v5))
  {
    if (v14 == 4 || v14 == 1)
      goto LABEL_11;
  }
  else if (v14 <= 4 && ((1 << v14) & 0x16) != 0)
  {
    goto LABEL_12;
  }
  LODWORD(v25) = 8;
  -[TSWPEditingController p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:](self, "p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:", &v29, &cf, &v27, a4, &v28, v25);
LABEL_11:
  v16 = v29;
LABEL_12:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v16 >= v7)
    {
      v21 = v7 + v9;
      v5 = v16;
      if (v16 > v21)
      {
        v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) charIndexMovingByWordFromCharIndex:inDirection:]");
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 637, CFSTR("Result beyond selection range max."));
        return v21;
      }
    }
    else
    {
      v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) charIndexMovingByWordFromCharIndex:inDirection:]");
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 632, CFSTR("Result beyond selection range min."));
      return v7;
    }
  }
  return v5;
}

- (_NSRange)p_adjustVisualSelection:(id)a3 withOtherSelection:(id)a4
{
  unint64_t v6;
  NSUInteger v7;
  id v8;
  id v9;
  NSUInteger v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64x2_t *v15;
  TSWPRangeVector *v16;
  TSWPRangeVector *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  TSWPStorage *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  TSWPStorage *storage;
  unint64_t v30;
  TSWPStorage *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  BOOL v36;
  unint64_t v37;
  NSUInteger v38;
  NSUInteger v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  int64x2_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  int64x2_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char v55;
  _NSRange result;

  v6 = *MEMORY[0x24BEB3BF0];
  v7 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v8 = -[TSWPEditingController calculateVisualRunsFromSelection:updateControllerSelection:](self, "calculateVisualRunsFromSelection:updateControllerSelection:", a3, 0);
  v9 = -[TSWPEditingController calculateVisualRunsFromSelection:updateControllerSelection:](self, "calculateVisualRunsFromSelection:updateControllerSelection:", a4, 0);
  -[TSWPEditingController p_selection:toGlyphRange:](self, "p_selection:toGlyphRange:", v8, &v50);
  -[TSWPEditingController p_selection:toGlyphRange:](self, "p_selection:toGlyphRange:", v9, &v43);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_s64(v50), (int32x4_t)vceqzq_s64(v43)))) & 1) != 0)
    goto LABEL_96;
  if (v52 == v45 && v54 == v47 && v55 == v49)
  {
    v6 = objc_msgSend(v8, "range");
    v7 = v10;
    goto LABEL_96;
  }
  if (objc_msgSend(v8, "isInsertionPoint"))
  {
    v11 = objc_msgSend(v9, "isInsertionPoint");
    v12 = v50.i64[0];
    v13 = v43.i64[0];
    if (!v11)
    {
      if (v50.i64[0] == v43.i64[0])
      {
        if (v51 >= v44)
        {
          v28 = &v45;
          v27 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v50);
        }
        else
        {
          v27 = v52;
          v28 = &v47;
        }
        v35 = *v28;
        v36 = v27 > *v28;
        if (v27 >= *v28)
          v14 = *v28;
        else
          v14 = v27;
        if (v36)
          v24 = v27;
        else
          v24 = v35;
        goto LABEL_88;
      }
      v24 = v52;
      v14 = v45;
      v25 = *(_DWORD *)(v50.i64[0] + 24);
      if (v52 < v45)
      {
        if ((v25 & 0x1000) != 0)
          v24 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v50);
        v14 = v24;
        v24 = v47;
        goto LABEL_88;
      }
      if ((v25 & 0x1000) != 0)
      {
LABEL_88:
        storage = self->_storage;
        goto LABEL_89;
      }
LABEL_40:
      v15 = &v50;
LABEL_41:
      v24 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", v15);
      goto LABEL_88;
    }
    if (v50.i64[0] != v43.i64[0])
    {
      v14 = v52;
      if (v52 < v45)
      {
        if ((*(_BYTE *)(v50.i64[0] + 25) & 0x10) != 0)
        {
          v14 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v50);
          v13 = v43.i64[0];
        }
        if ((*(_BYTE *)(v13 + 25) & 0x10) != 0)
        {
          v24 = v45 - v49;
          goto LABEL_88;
        }
        v15 = &v43;
        goto LABEL_41;
      }
      v14 = v45;
      if ((*(_BYTE *)(v43.i64[0] + 25) & 0x10) != 0)
      {
        v14 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v43);
        v12 = v50.i64[0];
      }
      if ((*(_BYTE *)(v12 + 25) & 0x10) != 0)
      {
        v24 = v52;
        goto LABEL_88;
      }
      goto LABEL_40;
    }
    if (v51 <= v44)
    {
      v26 = v52;
      if (!v55)
      {
        v34 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v43);
        goto LABEL_74;
      }
    }
    else
    {
      v26 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v50);
    }
    v34 = v45;
LABEL_74:
    if (v26 >= v34)
      v14 = v34;
    else
      v14 = v26;
    if (v26 <= v34)
      v24 = v34;
    else
      v24 = v26;
    goto LABEL_88;
  }
  v16 = (TSWPRangeVector *)objc_msgSend(v8, "visualRanges");
  if (!TSWPRangeVector::containsCharacterAtIndex(v16, v45, 0)
    || (v17 = (TSWPRangeVector *)objc_msgSend(v8, "visualRanges"),
        !TSWPRangeVector::containsCharacterAtIndex(v17, v47, 0)))
  {
    if (v43.i64[0] == v50.i64[0])
    {
      if ((*(_BYTE *)(v43.i64[0] + 25) & 0x10) != 0)
      {
        if (v44 < v51)
          goto LABEL_22;
      }
      else if (v44 >= v51)
      {
        goto LABEL_22;
      }
    }
    else if (v45 > v52)
    {
LABEL_22:
      v23 = v52;
      goto LABEL_48;
    }
    if (v48 && (*(_BYTE *)(v43.i64[0] + 25) & 0x10) != 0)
      v23 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v43);
    else
      v23 = v45;
LABEL_48:
    if (v43.i64[1] == v50.i64[1])
    {
      if ((*(_BYTE *)(v43.i64[1] + 25) & 0x10) != 0)
      {
        if (v46 > v53)
          goto LABEL_50;
      }
      else if (v46 < v53)
      {
        goto LABEL_50;
      }
    }
    else if (v47 < v54)
    {
LABEL_50:
      v30 = v54;
      goto LABEL_60;
    }
    if (v48)
    {
      if ((*(_BYTE *)(v43.i64[0] + 25) & 0x10) != 0)
        v30 = v45;
      else
        v30 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v43);
    }
    else
    {
      v30 = v47;
    }
LABEL_60:
    if (v23 >= v30)
      v6 = v30;
    else
      v6 = v23;
    if (v23 <= v30)
      v22 = v30;
    else
      v22 = v23;
    v31 = self->_storage;
LABEL_67:
    v32 = -[TSWPStorage nextCharacterIndex:](v31, "nextCharacterIndex:", v22);
    if (v6 <= v32)
      v33 = v32;
    else
      v33 = v6;
    if (v6 >= v32)
      v6 = v32;
    goto LABEL_95;
  }
  v18 = v45;
  v19 = objc_msgSend(v8, "superRange");
  if (v18 <= v19 + (v20 >> 1))
  {
    v14 = v45;
    storage = self->_storage;
    v24 = v54;
LABEL_89:
    v37 = -[TSWPStorage nextCharacterIndex:](storage, "nextCharacterIndex:", v24);
    if (v14 <= v37)
      v33 = v37;
    else
      v33 = v14;
    if (v14 >= v37)
      v6 = v37;
    else
      v6 = v14;
LABEL_95:
    v7 = v33 - v6;
    goto LABEL_96;
  }
  if (v43.i64[0] != v50.i64[0])
  {
    v6 = v52;
    v21 = self->_storage;
    if (*(_QWORD *)v50.i64[0] <= *(_QWORD *)v43.i64[0])
      v22 = -[TSWPEditingController p_LeftCharForInsertion:](self, "p_LeftCharForInsertion:", &v43);
    else
      v22 = v45;
    v31 = v21;
    goto LABEL_67;
  }
  v40 = *(_DWORD *)(v43.i64[0] + 24);
  if ((v40 & 0x1000) != 0)
  {
    v41 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v45);
    v40 = *(_DWORD *)(v43.i64[0] + 24);
  }
  else
  {
    v41 = v45;
  }
  if ((v40 & 0x1000) == 0 && v49)
    v41 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v45);
  if (v52 <= v41)
    v42 = v41;
  else
    v42 = v52;
  if (v52 >= v41)
    v6 = v41;
  else
    v6 = v52;
  v7 = v42 - v6;
LABEL_96:
  v38 = v6;
  v39 = v7;
  result.length = v39;
  result.location = v38;
  return result;
}

- (unint64_t)p_LeftCharForInsertion:(id *)a3
{
  TSWPLineFragment *var0;
  unint64_t var3;
  unint64_t v6;
  TSWPStorage *storage;
  unint64_t v8;

  var0 = a3->var0;
  var3 = a3->var3;
  v6 = var3;
  if (!a3->var7)
    v6 = TSWPLineFragment::nextOrPreviousCharIndexForDirection((uint64_t)a3->var0, a3->var3, 3, self->_storage);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((*((_BYTE *)var0 + 25) & 0x10) == 0 && var3)
    {
      storage = self->_storage;
      v8 = *(_QWORD *)var0;
      return -[TSWPStorage previousCharacterIndex:](storage, "previousCharacterIndex:", v8);
    }
  }
  else
  {
    if (v6 == -[TSWPStorage characterCount](self->_storage, "characterCount"))
    {
      storage = self->_storage;
      v8 = v6;
      return -[TSWPStorage previousCharacterIndex:](storage, "previousCharacterIndex:", v8);
    }
    return v6;
  }
  return var3;
}

- (unint64_t)p_rightEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  void *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _DWORD *v14;
  int v15;
  int v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  uint64_t v21;

  v21 = 0;
  v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", objc_msgSend(a3, "start"), &v21, 0);
  if (!v7)
    return objc_msgSend(a3, "insertionChar");
  v8 = (unint64_t *)v7;
  if (objc_msgSend(a3, "isRange"))
  {
    if (objc_msgSend(a3, "isVisual"))
    {
      v9 = *v8;
      v10 = v8[1];
      v11 = objc_msgSend(a3, "range");
      if (v9 <= v11 && v10 + v9 >= v11 + v12)
      {
        if ((*((_BYTE *)v8 + 25) & 0x10) != 0)
          v19 = objc_msgSend(a3, "headChar");
        else
          v19 = objc_msgSend(a3, "tailChar");
        v13 = v19;
        v16 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v19);
        goto LABEL_25;
      }
      if ((*((_BYTE *)v8 + 25) & 0x10) != 0)
      {
        v13 = objc_msgSend(a3, "headChar");
        v18 = *((_DWORD *)v8 + 6);
        v16 = -[TSWPEditingController p_writingDirectionForCharAtIndex:](self, "p_writingDirectionForCharAtIndex:", v13);
        if ((v18 & 0x1000) != 0)
        {
LABEL_25:
          v17 = v16 == 1;
          goto LABEL_26;
        }
        goto LABEL_20;
      }
      v13 = objc_msgSend(a3, "tailChar");
      v14 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v13, &v21, 0);
      if (v14)
      {
        v15 = v14[6];
        v16 = -[TSWPEditingController p_writingDirectionForCharAtIndex:](self, "p_writingDirectionForCharAtIndex:", v13);
        if ((v15 & 0x1000) == 0)
          goto LABEL_25;
LABEL_20:
        v17 = v16 != 1;
        goto LABEL_26;
      }
      return objc_msgSend(a3, "insertionChar");
    }
    if (objc_msgSend(a3, "isValid"))
    {
      v13 = objc_msgSend(a3, "end");
      v17 = 1;
LABEL_26:
      *a4 = v17;
      return v13;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v13 = objc_msgSend(a3, "insertionChar");
    if (objc_msgSend(a3, "type") != 7 && v13 == v8[1] + *v8 && *a4 && v13)
    {
      v13 = -[TSWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", v13);
      *a4 = 0;
    }
  }
  return v13;
}

- (unint64_t)p_leftEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  void *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TSWPLineFragment *v14;
  int v15;
  int v16;
  TSWPLineFragment *v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v22;

  v22 = 0;
  v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", objc_msgSend(a3, "start"), &v22, 0);
  if (!v7)
    return objc_msgSend(a3, "insertionChar");
  v8 = (unint64_t *)v7;
  if (objc_msgSend(a3, "isVisual") && objc_msgSend(a3, "isRange"))
  {
    v9 = *v8;
    v10 = v8[1];
    v11 = objc_msgSend(a3, "range");
    if (v9 <= v11 && v10 + v9 >= v11 + v12)
    {
      if ((*((_BYTE *)v8 + 25) & 0x10) != 0)
        v20 = objc_msgSend(a3, "tailChar");
      else
        v20 = objc_msgSend(a3, "headChar");
      v13 = v20;
      v16 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v20);
      goto LABEL_23;
    }
    if ((*((_BYTE *)v8 + 25) & 0x10) != 0)
    {
      v13 = objc_msgSend(a3, "tailChar");
      v17 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v13, &v22, 0);
      if (v17)
      {
        v18 = *((_DWORD *)v17 + 6);
        v16 = TSWPLineFragment::writingDirectionForCharIndex(v17, v13);
        if ((v18 & 0x1000) != 0)
        {
LABEL_23:
          v19 = v16 != 1;
          goto LABEL_24;
        }
LABEL_17:
        v19 = v16 == 1;
LABEL_24:
        *a4 = v19;
        return v13;
      }
    }
    else
    {
      v13 = objc_msgSend(a3, "headChar");
      v14 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v13, &v22, 0);
      if (v14)
      {
        v15 = *((_DWORD *)v14 + 6);
        v16 = TSWPLineFragment::writingDirectionForCharIndex(v14, v13);
        if ((v15 & 0x1000) == 0)
          goto LABEL_23;
        goto LABEL_17;
      }
    }
    return objc_msgSend(a3, "insertionChar");
  }
  v13 = objc_msgSend(a3, "insertionChar");
  if (objc_msgSend(a3, "type") != 7 && v13 == v8[1] + *v8 && *a4 && v13)
  {
    v13 = -[TSWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", v13);
    *a4 = 0;
  }
  return v13;
}

- (void)p_selection:(id)a3 toGlyphRange:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL4 var6;
  uint64_t v12;
  TSWPLineFragment *var0;
  TSWPLineFragment *v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t var2;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  a4->var6 = objc_msgSend(a3, "isInsertionPoint");
  v7 = objc_msgSend(a3, "rawRange");
  v8 = v7;
  if (a4->var6)
  {
    a4->var7 = 0;
    v21 = 0;
    v22 = 0;
    v9 = v7;
  }
  else
  {
    v10 = objc_msgSend(a3, "end");
    var6 = a4->var6;
    v9 = v10 - 1;
    a4->var7 = 0;
    v21 = 0;
    v22 = 0;
    if (!var6)
    {
LABEL_6:
      v12 = 0;
      goto LABEL_7;
    }
  }
  if (objc_msgSend(a3, "caretAffinity", v21, v22) != 1)
    goto LABEL_6;
  v12 = objc_msgSend(a3, "leadingEdge");
LABEL_7:
  var0 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v8, &v22, v12, v21);
  a4->var0 = var0;
  if ((_DWORD)v12 && !var0)
  {
    var0 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v8 - 1, &v22, 1);
    a4->var0 = var0;
  }
  v14 = var0;
  if (!a4->var6)
  {
    v14 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v9, &v21, objc_msgSend(a3, "caretAffinity") == 1);
    var0 = a4->var0;
  }
  a4->var1 = v14;
  if (var0)
  {
    v15 = *((_QWORD *)var0 + 1);
    if (v15)
    {
      if (a4->var6)
      {
        if (v8 == *(_QWORD *)var0 + v15)
          v16 = (*((unsigned __int8 *)var0 + 25) >> 4) & 1;
        else
          v16 = TSWPLineFragment::writingDirectionForCharIndex(var0, v8) == 1;
        if (v16 == objc_msgSend(a3, "leadingEdge"))
          v8 = TSWPLineFragment::nextOrPreviousCharIndexForDirection((uint64_t)a4->var0, v8, 2, self->_storage);
        if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 == -[TSWPStorage length](self->_storage, "length"))
        {
          v8 = TSWPLineFragment::rightMostCharIndex(a4->var0);
          a4->var7 = 1;
        }
        v20 = TSWPLineFragment::visualIndexForCharIndex(a4->var0, v8);
        a4->var2 = v20;
        a4->var3 = v8;
        a4->var4 = v20;
        a4->var5 = v8;
      }
      else if (v14)
      {
        a4->var2 = TSWPLineFragment::visualIndexForCharIndex(var0, v8);
        v18 = TSWPLineFragment::visualIndexForCharIndex(a4->var1, v9);
        a4->var3 = v8;
        a4->var4 = v18;
        a4->var5 = v9;
        if (a4->var0 == a4->var1)
        {
          var2 = a4->var2;
          if (var2 >= v18 != (*((_BYTE *)a4->var0 + 25) & 0x10) >> 4)
          {
            a4->var2 = v18;
            a4->var3 = v9;
            a4->var4 = var2;
            a4->var5 = v8;
          }
        }
      }
    }
    else
    {
      a4->var2 = 0;
      a4->var4 = 0;
      if ((*((_DWORD *)var0 + 6) & 0x1000) != 0)
        v17 = v8 - 1;
      else
        v17 = v8;
      a4->var3 = v17;
      a4->var5 = v8 - 1;
    }
  }
}

- (int)p_writingDirectionForCharAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  TSWPLineFragment *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[7];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  v10[5] = v3;
  v10[6] = v4;
  v10[0] = 0;
  v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, v10, 0);
  if (v7)
    return TSWPLineFragment::writingDirectionForCharIndex(v7, a3 - (*((_QWORD *)v7 + 1) + *(_QWORD *)v7 == a3));
  v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_writingDirectionForCharAtIndex:]");
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 1119, CFSTR("invalid nil value for '%s'"), "lineFragment");
  return -1;
}

- (const)p_lineFragmentWithCaretInfo:(id *)a3 forSelection:(id)a4
{
  _DWORD *v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  BOOL v12;
  int v13;
  unint64_t v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  int v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  int v28;
  __int16 v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;

  v35 = 0;
  v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", objc_msgSend(a4, "range"), &v35, objc_msgSend(a4, "isAtEndOfLine"));
  v8 = (uint64_t)v7;
  if (v7)
  {
    v9 = v7[6];
    v10 = objc_msgSend(a4, "insertionChar");
    v11 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v10);
    v12 = v11 == 1;
    v30 = v9;
    v33 = (unsigned __int16)(v9 & 0x1000) >> 12;
    v34 = objc_msgSend(a4, "leadingEdge");
    if ((v9 & 0x1000) != 0)
      v13 = 2;
    else
      v13 = 1;
    v14 = -[TSWPStorage length](self->_storage, "length");
    v15 = v13;
    if (v10 < v14)
    {
      TSWPComposedCharacterAtIndexForTextSource(v10, self->_storage);
      v15 = TSWPGetBidiClass();
    }
    v32 = v15;
    if ((objc_msgSend(a4, "isVisual") & 1) != 0
      || v10 <= *(_QWORD *)v8
      || (v11 == 1) == -[TSWPEditingController editorKeyboardLanguageIsRTL](self, "editorKeyboardLanguageIsRTL"))
    {
      v16 = v11 == 1;
      v31 = v11 == 1;
      if (v31 != v34)
        goto LABEL_13;
    }
    else
    {
      v10 = -[TSWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", objc_msgSend(a4, "insertionChar"));
      v16 = 0;
      LOBYTE(v34) = 0;
      if (TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v10) == 1)
      {
        LOBYTE(v31) = 1;
        v12 = 1;
LABEL_13:
        v17 = TSWPLineFragment::nextOrPreviousCharIndexForDirection(v8, v10, 3, self->_storage);
        if (v17 == *(_QWORD *)(v8 + 8) + *(_QWORD *)v8)
          v18 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v18 = v17;
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v33) = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v18) == 1;
          TSWPComposedCharacterAtIndexForTextSource(v18, self->_storage);
          v13 = TSWPGetBidiClass();
        }
        if (v10 == TSWPLineFragment::rightMostCharIndex((TSWPLineFragment *)v8))
        {
          v19 = 0x7FFFFFFFFFFFFFFFLL;
          if ((v30 & 0x1000) != 0)
          {
            v19 = v10;
            v20 = v12;
          }
          else
          {
            v20 = 0;
          }
          v21 = v32;
          v16 = v33;
          if ((v30 & 0x1000) != 0)
            v22 = v32;
          else
            v22 = 1;
          if ((*(_BYTE *)(v8 + 25) & 8) != 0)
            v23 = v19;
          else
            v23 = v10;
          if ((*(_BYTE *)(v8 + 25) & 8) != 0)
            v12 = v20;
          v24 = v13;
          if ((*(_BYTE *)(v8 + 25) & 8) != 0)
            v13 = v22;
          else
            v13 = v32;
        }
        else
        {
          v21 = v32;
          v16 = v33;
          v24 = v13;
          v23 = v10;
          v13 = v32;
        }
LABEL_54:
        a3->var4 = v18;
        a3->var5 = v16;
        a3->var2 = v34;
        a3->var6 = v24;
        a3->var7 = v23;
        a3->var8 = v12;
        a3->var9 = v13;
        a3->var0 = v10;
        a3->var1 = v31;
        a3->var3 = v21;
        return (const void *)v8;
      }
      LOBYTE(v31) = 0;
    }
    v25 = TSWPLineFragment::nextOrPreviousCharIndexForDirection(v8, v10, 2, self->_storage);
    if (v25 == *(_QWORD *)(v8 + 8) + *(_QWORD *)v8)
      v23 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v23 = v25;
    v12 = v33;
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v23) == 1;
      TSWPComposedCharacterAtIndexForTextSource(v23, self->_storage);
      v13 = TSWPGetBidiClass();
    }
    if (v10 == TSWPLineFragment::leftMostCharIndex((TSWPLineFragment *)v8))
    {
      v26 = 0x7FFFFFFFFFFFFFFFLL;
      if ((v30 & 0x1000) != 0)
      {
        v27 = 1;
      }
      else
      {
        v26 = v10;
        v27 = v16;
      }
      v21 = v32;
      if ((v30 & 0x1000) != 0)
        v28 = 2;
      else
        v28 = v32;
      if ((*(_BYTE *)(v8 + 25) & 8) != 0)
        v18 = v26;
      else
        v18 = v10;
      if ((*(_BYTE *)(v8 + 25) & 8) != 0)
      {
        v16 = v27;
        v24 = v28;
      }
      else
      {
        v24 = v32;
      }
    }
    else
    {
      v18 = v10;
      v21 = v32;
      v24 = v32;
    }
    goto LABEL_54;
  }
  return (const void *)v8;
}

- (unint64_t)p_getVisualDeletionIndexForSelection:(id)a3 backward:(BOOL *)a4
{
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  TSWPStorage *storage;
  uint64_t v19;
  unint64_t v20;
  char v21;
  int v22;
  unint64_t v23;
  char v24;
  int v25;

  v7 = objc_msgSend(a3, "range");
  if ((objc_msgSend(a3, "isInsertionPoint") & 1) == 0)
  {
    objc_msgSend(a3, "range");
    if (!v8 || *a4)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_getVisualDeletionIndexForSelection:backward:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 1270, CFSTR("invalid selection type"));
    }
  }
  v11 = -[TSWPEditingController p_lineFragmentWithCaretInfo:forSelection:](self, "p_lineFragmentWithCaretInfo:forSelection:", &v19, a3);
  if (v11)
  {
    v12 = v11;
    if (v11[1])
    {
      if (objc_msgSend(a3, "isVisual"))
      {
        if ((objc_msgSend(a3, "isInsertionPoint") & 1) != 0 || (objc_msgSend(a3, "range"), v13) && !*a4)
        {
          v14 = *v12;
          v15 = v12[1] + ((int)(*((_DWORD *)v12 + 6) << 20) >> 31);
          if (v21 == v24 || v22 == 3 || v25 == 3)
          {
            if (v21 == v24 || !objc_msgSend(a3, "isVisual"))
              return v7;
            if (v21)
            {
              if (v20 == 0x7FFFFFFFFFFFFFFFLL)
                return v15 + v14;
              else
                return v20;
            }
            v16 = v23;
            v7 = v14;
            if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              return v7;
          }
          else
          {
            if (v21)
            {
              *a4 = 0;
              if (-[TSWPEditingController editorKeyboardLanguageIsRTL](self, "editorKeyboardLanguageIsRTL"))
                v7 = v20;
              else
                v7 = v23;
              if (v7 == 0x7FFFFFFFFFFFFFFFLL)
              {
                *a4 = 1;
                return v15 + v14;
              }
              return v7;
            }
            *a4 = 1;
            if (-[TSWPEditingController editorKeyboardLanguageIsRTL](self, "editorKeyboardLanguageIsRTL"))
            {
              v16 = v23;
              if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v7 = v14;
                if (v21)
                  return v7;
                storage = self->_storage;
                v16 = v20;
                return -[TSWPStorage nextCharacterIndex:](storage, "nextCharacterIndex:", v16);
              }
            }
            else
            {
              v16 = v20;
              if (v20 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v7 = v14;
                if (!v24)
                  return v7;
                storage = self->_storage;
                v16 = v23;
                return -[TSWPStorage nextCharacterIndex:](storage, "nextCharacterIndex:", v16);
              }
            }
          }
          storage = self->_storage;
          return -[TSWPStorage nextCharacterIndex:](storage, "nextCharacterIndex:", v16);
        }
      }
    }
  }
  return v7;
}

- (unint64_t)p_getVisualInsertionPointIndexForString:(id)a3 selection:(id)a4
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  BOOL v29;
  _BOOL4 v30;
  int v31;
  unint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  unint64_t v35;
  _BOOL4 v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *__p;
  _BYTE *v43;
  uint64_t v44;
  char v45[16];
  unint64_t v46;
  unsigned __int8 v47;
  int v48;
  unint64_t v49;
  unsigned __int8 v50;
  int v51;

  if (!objc_msgSend(a4, "isInsertionPoint") || (objc_msgSend(a4, "isVisual") & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEditingController(Internal) p_getVisualInsertionPointIndexForString:selection:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 1384, CFSTR("invalid selection type"));
  }
  v9 = objc_msgSend(a4, "range");
  v10 = -[TSWPEditingController p_lineFragmentWithCaretInfo:forSelection:](self, "p_lineFragmentWithCaretInfo:forSelection:", v45, a4);
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(a4, "isInsertionPoint"))
    {
      if (objc_msgSend(a4, "isVisual"))
      {
        v12 = v11[6];
        if ((v12 & 0x4000) == 0)
        {
          v13 = *(_QWORD *)v11;
          v14 = *((_QWORD *)v11 + 1);
          if (objc_msgSend(a3, "length"))
          {
            objc_msgSend(a3, "utf32CharacterAtIndex:", 0);
            v15 = TSWPGetBidiClass();
          }
          else
          {
            v15 = 6;
          }
          if (v48 != v51)
          {
            v16 = v14 + (v12 << 20 >> 31);
            if (v15 == v48)
            {
              v9 = v46;
              if (v46 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((v12 & 0x1000) != 0)
                  v17 = v14 + (v12 << 20 >> 31);
                else
                  v17 = 0;
                return v17 + v13;
              }
              if (v47)
                return v9;
              return -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v9);
            }
            if (v15 == v51)
            {
              v9 = v49;
              if (v49 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((v12 & 0x1000) != 0)
                  v17 = 0;
                else
                  v17 = v14 + (v12 << 20 >> 31);
                return v17 + v13;
              }
              if (!v50)
                return v9;
              return -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v9);
            }
            if ((v15 & 0xFFFFFFFD) == 1 || v15 == 2)
              v19 = v15;
            else
              v19 = 1;
            __p = 0;
            v43 = 0;
            v44 = 0;
            TSWPLineFragment::fillWritingDirectionRuns((uint64_t *)v11, &__p);
            if (v46 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v20 = 0;
            }
            else
            {
              v21 = v43 - (_BYTE *)__p;
              if (v43 == __p)
                goto LABEL_52;
              v22 = 0;
              v23 = v21 / 40;
              v28 = v21 / 40 != 0;
              v24 = v21 / 40 - 1;
              if (v24 == 0 || !v28)
                v23 = 1;
              v25 = (unint64_t *)((char *)__p + 24);
              while (1)
              {
                v26 = *(v25 - 1);
                v28 = v46 >= v26;
                v27 = v46 - v26;
                v28 = !v28 || v27 >= *v25;
                if (!v28)
                  break;
                v25 += 5;
                if (v23 == ++v22)
                {
                  v22 = v23;
                  break;
                }
              }
              v20 = v22 + 1;
              if (v22 == 0x7FFFFFFFFFFFFFFELL || v22 >= v24)
                goto LABEL_52;
            }
            if (*((_BYTE *)__p + 40 * v20 + 33))
              v29 = v19 == 2;
            else
              v29 = 0;
            if (v29)
            {
              v32 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", *((_QWORD *)__p + 5 * v20 + 1));
LABEL_89:
              v9 = v32;
LABEL_90:
              if (__p)
              {
                v43 = __p;
                operator delete(__p);
              }
              return v9;
            }
LABEL_52:
            if (v19 == 3)
            {
              v31 = v47;
              v30 = (v47 | v50) == 0;
            }
            else
            {
              if (v19 != 2)
              {
                v33 = v47 == 0;
                v36 = v50 == 0;
                v30 = 1;
                goto LABEL_70;
              }
              v30 = 0;
              v31 = v47;
            }
            v33 = v31 == 0;
            if (!v30 && v31)
            {
              if ((v12 & 0x1000) != 0)
                v34 = v16;
              else
                v34 = 0;
              v35 = v34 + v13;
              if (v46 == 0x7FFFFFFFFFFFFFFFLL)
                v9 = v35;
              else
                v9 = v46;
              goto LABEL_90;
            }
            v36 = v50 == 0;
            if (v50)
              v37 = v30;
            else
              v37 = 1;
            if ((v37 & 1) == 0)
            {
              if (v49 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((v12 & 0x1000) != 0)
                  v38 = 0;
                else
                  v38 = v16;
                goto LABEL_87;
              }
              goto LABEL_88;
            }
LABEL_70:
            if (!v30 || !v33)
            {
              if (v30 && v36)
              {
                if ((v12 & 0x1000) != 0)
                  v39 = 0;
                else
                  v39 = v16;
                v40 = v39 + v13;
                if (v49 == 0x7FFFFFFFFFFFFFFFLL)
                  v9 = v40;
                else
                  v9 = v49;
              }
              goto LABEL_90;
            }
            if (v46 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((v12 & 0x1000) != 0)
                v38 = v16;
              else
                v38 = 0;
LABEL_87:
              v9 = v38 + v13;
              goto LABEL_90;
            }
LABEL_88:
            v32 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:");
            goto LABEL_89;
          }
        }
      }
    }
  }
  return v9;
}

@end
