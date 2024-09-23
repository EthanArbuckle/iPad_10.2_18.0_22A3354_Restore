@implementation TSWPiOSCanvasViewController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPiOSCanvasViewController;
  -[TSDiOSCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[TSWPiOSCanvasViewController cancelDelayedTapAction](self, "cancelDelayedTapAction");
  objc_opt_class();
  -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  v5 = (void *)TSUDynamicCast();
  if (v5)
    objc_msgSend(v5, "dismissActivePopovers");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPiOSCanvasViewController;
  -[TSWPiOSCanvasViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (TSUSupportsTextInteraction())
    -[TSDCanvasView addInteraction:](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "addInteraction:", self->_textInteraction);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPiOSCanvasViewController;
  -[TSWPiOSCanvasViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (TSUSupportsTextInteraction())
    -[TSDCanvasView removeInteraction:](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "removeInteraction:", self->_textInteraction);
}

- (void)teardown
{
  NSMutableArray *gestureRecognizers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[TSWPiOSCanvasViewController isViewLoaded](self, "isViewLoaded"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    gestureRecognizers = self->_gestureRecognizers;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](gestureRecognizers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(gestureRecognizers);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(v8, "setDelegate:", 0);
          objc_msgSend((id)objc_msgSend(v8, "view"), "removeGestureRecognizer:", v8);
          -[TSDGestureDispatcher gestureRemovedFromView:](-[TSDInteractiveCanvasController gestureDispatcher](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher"), "gestureRemovedFromView:", v8);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](gestureRecognizers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    -[NSMutableArray removeAllObjects](self->_gestureRecognizers, "removeAllObjects");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSWPiOSCanvasViewController;
  -[TSDiOSCanvasViewController teardown](&v9, sel_teardown);
}

- (void)dealloc
{
  objc_super v3;

  if (TSUSupportsTextInteraction())
  {

    self->_textInteraction = 0;
  }

  self->_leftSwipeGestureRecognizer = 0;
  self->_rightSwipeGestureRecognizer = 0;

  self->_delayedTapAction = 0;
  self->_hyperlinkGestureRecognizer = 0;

  self->_gestureRecognizers = 0;
  self->_longPressGestureRecognizer = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPiOSCanvasViewController;
  -[TSDiOSCanvasViewController dealloc](&v3, sel_dealloc);
}

- (void)setUpGestureRecognizers
{
  UITextInteraction *v3;
  void *v4;
  TSWPLongPressGestureRecognizer *v5;
  TSDGestureDispatcher *v6;
  TSWPTapAndTouchGestureRecognizer *v7;
  TSWPLongPressGestureRecognizer *v8;
  TSWPLongPressGestureRecognizer *v9;
  TSWPTapGestureRecognizer *v10;
  TSWPTapGestureRecognizer *v11;
  TSWPTapGestureRecognizer *v12;
  TSWPTapGestureRecognizer *v13;
  void *v14;
  TSWPTapAndTouchGestureRecognizer *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TSWPiOSCanvasViewController;
  -[TSDiOSCanvasViewController setUpGestureRecognizers](&v16, sel_setUpGestureRecognizers);
  self->_gestureRecognizers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
  if (TSUSupportsTextInteraction())
  {
    v3 = (UITextInteraction *)(id)objc_msgSend(MEMORY[0x24BDF6ED0], "textInteractionsForSet:", 1);
    self->_textInteraction = v3;
    -[UITextInteraction setDelegate:](v3, "setDelegate:", self);
    -[UITextInteraction setTextInput:](self->_textInteraction, "setTextInput:", -[TSDInteractiveCanvasController textInputResponder](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "textInputResponder"));
    -[TSDCanvasView setHyperLinkDelegate:](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "setHyperLinkDelegate:", self);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69E8]), "initWithDelegate:", self);
    objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view"), "addInteraction:", v4);

    v5 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPLongPressGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", -[TSDInteractiveCanvasController gestureDispatcher](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher"), CFSTR("TSWPImmediatePress"));
    -[TSWPLongPressGestureRecognizer setEnabled:](v5, "setEnabled:", 0);
    -[TSWPLongPressGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 0);
    -[TSWPLongPressGestureRecognizer setMinimumPressDuration:](v5, "setMinimumPressDuration:", 0.0);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v5), "addGestureRecognizer:", v5);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v5);
  }
  else
  {
    v6 = -[TSDInteractiveCanvasController gestureDispatcher](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher");
    v15 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPTapAndTouchGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v6, CFSTR("TSWPDoubleTapAndTouch"));
    -[TSWPTapAndTouchGestureRecognizer setNumberOfTapsRequired:](v15, "setNumberOfTapsRequired:", 2);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v15), "addGestureRecognizer:", v15);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v15);
    v7 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPTapAndTouchGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v6, CFSTR("TSWPTapAndTouch"));
    -[TSWPTapAndTouchGestureRecognizer setNumberOfTapsRequired:](v7, "setNumberOfTapsRequired:", 1);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v7), "addGestureRecognizer:", v7);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v7);
    v8 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPLongPressGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v6, CFSTR("TSWPLongPress"));
    self->_longPressGestureRecognizer = v8;
    -[TSWPLongPressGestureRecognizer setNumberOfTapsRequired:](v8, "setNumberOfTapsRequired:", 0);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", self->_longPressGestureRecognizer), "addGestureRecognizer:", self->_longPressGestureRecognizer);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", self->_longPressGestureRecognizer);
    v9 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPLongPressGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v6, CFSTR("TSWPImmediatePress"));
    -[TSWPLongPressGestureRecognizer setNumberOfTapsRequired:](v9, "setNumberOfTapsRequired:", 0);
    -[TSWPLongPressGestureRecognizer setMinimumPressDuration:](v9, "setMinimumPressDuration:", 0.0);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v9), "addGestureRecognizer:", v9);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v9);
    v10 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPTapGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v6, CFSTR("TSWPImmediateDoubleTap"));
    -[TSWPTapGestureRecognizer setNumberOfTapsRequired:](v10, "setNumberOfTapsRequired:", 2);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v10), "addGestureRecognizer:", v10);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v10);
    v11 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPTapGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v6, CFSTR("TSWPSecondarySingleTap"));
    self->_secondarySingleTapGestureRecognizer = &v11->super;
    -[TSWPTapGestureRecognizer setEnabled:](v11, "setEnabled:", 0);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", self->_secondarySingleTapGestureRecognizer), "addGestureRecognizer:", self->_secondarySingleTapGestureRecognizer);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", self->_secondarySingleTapGestureRecognizer);
    v12 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPTapGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v6, CFSTR("TSWPImmediateSingleTap"));
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v12), "addGestureRecognizer:", v12);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v12);
    v13 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPTapGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v6, CFSTR("TSWPTwoFingerTap"));
    -[TSWPTapGestureRecognizer setNumberOfTouchesRequired:](v13, "setNumberOfTouchesRequired:", 2);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v13), "addGestureRecognizer:", v13);
    -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v13);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69E8]), "initWithDelegate:", self);
    objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view"), "addInteraction:", v14);

    -[TSDGestureDispatcher prioritizeRecognizer:overRecognizer:](v6, "prioritizeRecognizer:overRecognizer:", v7, v12);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v12, self->_secondarySingleTapGestureRecognizer, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", self->_secondarySingleTapGestureRecognizer, self->_longPressGestureRecognizer, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v7, v9, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v12, v7, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v15, v10, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v15, v7, 0);
    if (!-[TSWPiOSCanvasViewController onlyAllowTextSwipesWhenEditing](self, "onlyAllowTextSwipesWhenEditing"))
      -[TSWPiOSCanvasViewController addSwipeGestureRecognizers](self, "addSwipeGestureRecognizers");
  }
}

- (BOOL)canDisplayHyperlinkUI
{
  id v2;
  void *v3;
  BOOL result;

  v2 = -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  result = (objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_class(), objc_msgSend(v2, "selection"), (v3 = (void *)TSUDynamicCast()) == 0)
        || (unint64_t)objc_msgSend(v3, "infoCount") < 2;
  return result;
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  TSDInteractiveCanvasControllerDelegate *v9;

  v9 = -[TSDInteractiveCanvasController delegate](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDInteractiveCanvasControllerDelegate actionForHyperlink:inRep:gesture:](v9, "actionForHyperlink:inRep:gesture:", a3, a4, a5);
  if ((__CFString *)objc_msgSend(a5, "gestureKind") == CFSTR("TSWPImmediateSingleTap")
    && -[TSDInteractiveCanvasController inReadMode](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "inReadMode"))
  {
    return +[TSWPHyperlinkAction hyperlinkActionWithHyperlink:inRep:action:](TSWPHyperlinkAction, "hyperlinkActionWithHyperlink:inRep:action:", a3, a4, &__block_literal_global_74);
  }
  return 0;
}

uint64_t __64__TSWPiOSCanvasViewController_actionForHyperlink_inRep_gesture___block_invoke()
{
  return objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "visit");
}

- (void)gestureSequenceWillBegin
{

  self->_delayedTapAction = 0;
}

- (void)cancelDelayedTapAction
{
  TSWPTwoPartAction *delayedTapAction;

  delayedTapAction = self->_delayedTapAction;
  if (delayedTapAction)
  {
    -[TSWPTwoPartAction cancel](delayedTapAction, "cancel");

    self->_delayedTapAction = 0;
  }
}

- (void)startDelayedTapAction:(id)a3
{
  TSWPTwoPartAction *v5;

  -[TSWPiOSCanvasViewController cancelDelayedTapAction](self, "cancelDelayedTapAction");
  v5 = (TSWPTwoPartAction *)a3;
  self->_delayedTapAction = v5;
  -[TSWPTwoPartAction performStartAction](v5, "performStartAction");
  if (-[TSWPTwoPartAction performImmediately](self->_delayedTapAction, "performImmediately"))
    -[TSWPiOSCanvasViewController finishDelayedTapAction](self, "finishDelayedTapAction");
}

- (void)finishDelayedTapAction
{
  TSWPTwoPartAction *delayedTapAction;

  delayedTapAction = self->_delayedTapAction;
  if (delayedTapAction)
  {
    -[TSWPTwoPartAction performFinishAction](delayedTapAction, "performFinishAction");

    self->_delayedTapAction = 0;
    if (TSUSupportsTextInteraction())
      -[TSWPiOSCanvasViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__resetAndClearInteractions, 0, 0.12);
  }
}

- (void)_resetAndClearInteractions
{
  -[TSWPiOSCanvasViewController _clearSelectedRange](self, "_clearSelectedRange");
  -[TSWPiOSCanvasViewController _resetLinkInteraction](self, "_resetLinkInteraction");
}

- (void)_clearSelectedRange
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__resetAndClearInteractions, 0);
  objc_opt_class();
  -[TSDTextInputResponder selectedTextRange](-[TSDInteractiveCanvasController textInputResponder](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "textInputResponder"), "selectedTextRange");
  v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setRange:", objc_msgSend(v3, "range"), 0);
    -[TSDTextInputResponder setSelectedTextRange:](-[TSDInteractiveCanvasController textInputResponder](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "textInputResponder"), "setSelectedTextRange:", v4);
  }
}

- (BOOL)hasDelayedTapAction
{
  return self->_delayedTapAction != 0;
}

- (void)addSwipeGestureRecognizers
{
  void *v3;
  uint64_t v4;
  void *v5;
  TSWPSwipeGestureRecognizer *leftSwipeGestureRecognizer;
  TSWPSwipeGestureRecognizer *v7;
  TSWPSwipeGestureRecognizer *rightSwipeGestureRecognizer;
  TSWPSwipeGestureRecognizer *v9;

  if ((self->_leftSwipeGestureRecognizer || self->_rightSwipeGestureRecognizer)
    && -[TSWPiOSCanvasViewController onlyAllowTextSwipesWhenEditing](self, "onlyAllowTextSwipesWhenEditing"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPiOSCanvasViewController addSwipeGestureRecognizers]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPiOSCanvasViewController.m"), 438, CFSTR("swipe gesture recognizers should be nil, this might mean we're calling this method without releasing them"));
  }
  if (!self->_leftSwipeGestureRecognizer && !self->_rightSwipeGestureRecognizer
    || !-[TSWPiOSCanvasViewController onlyAllowTextSwipesWhenEditing](self, "onlyAllowTextSwipesWhenEditing"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    objc_msgSend(v5, "addObjectsFromArray:", -[NSSet allObjects](-[TSDiOSCanvasViewController panGestureRecognizers](self, "panGestureRecognizers"), "allObjects"));
    objc_msgSend(v5, "addObject:", -[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"));
    leftSwipeGestureRecognizer = self->_leftSwipeGestureRecognizer;
    if (!leftSwipeGestureRecognizer)
    {
      v7 = -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 2, 1);
      self->_leftSwipeGestureRecognizer = v7;
      -[TSWPiOSCanvasViewController setUpGestureDependenciesForNewCopyOfTextGesture:](self, "setUpGestureDependenciesForNewCopyOfTextGesture:", v7);
      leftSwipeGestureRecognizer = self->_leftSwipeGestureRecognizer;
    }
    -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", leftSwipeGestureRecognizer, v5);
    rightSwipeGestureRecognizer = self->_rightSwipeGestureRecognizer;
    if (!rightSwipeGestureRecognizer)
    {
      v9 = -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 1, 1);
      self->_rightSwipeGestureRecognizer = v9;
      -[TSWPiOSCanvasViewController setUpGestureDependenciesForNewCopyOfTextGesture:](self, "setUpGestureDependenciesForNewCopyOfTextGesture:", v9);
      rightSwipeGestureRecognizer = self->_rightSwipeGestureRecognizer;
    }
    -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", rightSwipeGestureRecognizer, v5);
    -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 4, 1), v5);
    -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 8, 1), v5);
    -[TSDiOSCanvasViewController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) == 0
      || -[TSDiOSCanvasViewControllerDelegate canvasViewController:enableSwipeGestureWithNumberOfTouches:](-[TSDiOSCanvasViewController delegate](self, "delegate"), "canvasViewController:enableSwipeGestureWithNumberOfTouches:", self, 2))
    {
      -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 2, 2), v5);
      -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 1, 2), v5);
      -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 4, 2), v5);
      -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 8, 2), v5);
    }
    -[TSDiOSCanvasViewController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) == 0
      || -[TSDiOSCanvasViewControllerDelegate canvasViewController:enableSwipeGestureWithNumberOfTouches:](-[TSDiOSCanvasViewController delegate](self, "delegate"), "canvasViewController:enableSwipeGestureWithNumberOfTouches:", self, 3))
    {
      -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 2, 3), v5);
      -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 1, 3), v5);
      -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 4, 3), v5);
      -[TSWPiOSCanvasViewController p_addSwipeGestureRecognizer:failRequiredFor:](self, "p_addSwipeGestureRecognizer:failRequiredFor:", -[TSWPiOSCanvasViewController p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:](self, "p_newSwipeGestureRecognizerWithDirection:numberOfTouchesRequired:", 8, 3), v5);
    }
  }
}

- (void)removeSwipeGestureRecognizers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view", 0, 0), "gestureRecognizers");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_opt_class();
        v8 = TSUDynamicCast();
        if (v8)
        {
          v9 = v8;
          objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view"), "removeGestureRecognizer:", v8);
          -[NSMutableArray removeObject:](self->_gestureRecognizers, "removeObject:", v9);
          -[TSDGestureDispatcher gestureRemovedFromView:](-[TSDInteractiveCanvasController gestureDispatcher](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher"), "gestureRemovedFromView:", v9);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  self->_leftSwipeGestureRecognizer = 0;
  self->_rightSwipeGestureRecognizer = 0;
}

- (TSUColor)backgroundColorForMagnifier
{
  return 0;
}

- (BOOL)shouldHideCanvasLayerInMagnifier
{
  return 1;
}

- (BOOL)onlyAllowTextSwipesWhenEditing
{
  return 0;
}

- (BOOL)hyperlinkUIShouldShowCustomUI
{
  return 0;
}

- (BOOL)hyperlinkUIShouldShow
{
  return 1;
}

- (id)hyperlinkUICustomStringForURLString:(id)a3
{
  return 0;
}

- (id)_dragItemsForInteraction:(id)a3 session:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[2];

  y = a5.y;
  x = a5.x;
  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  v10 = (void *)TSUDynamicCast();
  v11 = v10;
  if (v10)
    v12 = (id)objc_msgSend(v10, "dragItemForCurrentSelectionWithDragInteraction:session:withTouchPoint:", a3, a4, x, y);
  else
    v12 = +[TSWPEditingController dragItemForHitRepWithDragInteraction:session:canvasView:icc:withTouchPoint:](TSWPEditingController, "dragItemForHitRepWithDragInteraction:session:canvasView:icc:withTouchPoint:", a3, a4, -[TSWPiOSCanvasViewController view](self, "view"), -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), x, y);
  v13 = v12;
  if (!v12)
    return (id)MEMORY[0x24BDBD1A8];
  objc_msgSend(v11, "setSelection:", 0);
  v15[0] = v13;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  objc_msgSend(a4, "locationInView:", -[TSWPiOSCanvasViewController view](self, "view"));
  return -[TSWPiOSCanvasViewController _dragItemsForInteraction:session:withTouchAtPoint:](self, "_dragItemsForInteraction:session:withTouchAtPoint:", a3, a4);
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return +[TSWPEditingController previewForDragItem:](TSWPEditingController, "previewForDragItem:", a4);
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  -[TSWPLongPressGestureRecognizer setEnabled:](-[TSWPiOSCanvasViewController longPressGestureRecognizer](self, "longPressGestureRecognizer", a3, a4, a5), "setEnabled:", 0);
  -[TSWPLongPressGestureRecognizer setEnabled:](-[TSWPiOSCanvasViewController longPressGestureRecognizer](self, "longPressGestureRecognizer"), "setEnabled:", 1);
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  return +[TSWPEditingController retargetedDragItem:withDefault:canvasView:icc:](TSWPEditingController, "retargetedDragItem:withDefault:canvasView:icc:", a4, a5, -[TSWPiOSCanvasViewController view](self, "view", a3), -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
}

- (TSWPInteractiveCanvasController)interactiveCanvasController
{
  objc_opt_class();
  return (TSWPInteractiveCanvasController *)TSUDynamicCast();
}

- (void)p_addSwipeGestureRecognizer:(id)a3 failRequiredFor:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view"), "addGestureRecognizer:", a3);
  -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "requireGestureRecognizerToFail:", a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (id)p_newSwipeGestureRecognizerWithDirection:(int)a3 numberOfTouchesRequired:(unsigned int)a4
{
  uint64_t v5;
  __CFString **v6;
  TSWPSwipeGestureRecognizer *v7;

  v5 = *(_QWORD *)&a3;
  if (a4 == 3)
  {
    v6 = TSWPThreeFingerSwipe;
  }
  else
  {
    v6 = TSWPTwoFingerSwipe;
    if (a4 != 2)
      v6 = TSWPOneFingerSwipe;
  }
  v7 = -[UIGestureRecognizer initWithGestureDispatcher:gestureKind:]([TSWPSwipeGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", -[TSDInteractiveCanvasController gestureDispatcher](-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher"), *v6);
  -[TSWPSwipeGestureRecognizer setNumberOfTouchesRequired:](v7, "setNumberOfTouchesRequired:", a4);
  -[TSWPSwipeGestureRecognizer setDirection:](v7, "setDirection:", v5);
  -[TSWPSwipeGestureRecognizer setAllowedTouchTypes:](v7, "setAllowedTouchTypes:", &unk_24D8FA380);
  return v7;
}

- (BOOL)_shouldAllowInteractionAtPoint:(CGPoint)a3
{
  return -[TSWPiOSCanvasViewController _hitRepAtPoint:](self, "_hitRepAtPoint:", a3.x, a3.y) != 0;
}

- (id)_textInteractionBlockingRepClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (id)_hitRepAtPoint:(CGPoint)a3
{
  double y;
  double x;
  TSWPInteractiveCanvasController *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[10];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;

  y = a3.y;
  x = a3.x;
  v6 = -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v6, "convertUnscaledToBoundsPoint:", x, y);
  v8 = v7;
  v10 = v9;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v6, "convertBoundsToUnscaledPoint:", x, y);
  v12 = v11;
  v14 = v13;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__23;
  v28 = __Block_byref_object_dispose__23;
  v29 = 0;
  v15 = -[TSWPiOSCanvasViewController _textInteractionBlockingRepClasses](self, "_textInteractionBlockingRepClasses");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_opt_class();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __46__TSWPiOSCanvasViewController__hitRepAtPoint___block_invoke;
  v19[3] = &unk_24D82DF00;
  v19[8] = v8;
  v19[9] = v10;
  v19[4] = v6;
  v19[5] = v15;
  v19[6] = &v24;
  v19[7] = &v20;
  -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v6, "hitRep:withGesture:passingTest:", 0, v19, v12, v14);
  v16 = TSUDynamicCast();
  if (!v16)
  {
    if (v25[5])
    {
      v16 = 0;
    }
    else
    {
      v16 = -[TSWPInteractiveCanvasController closestRepToPoint:](v6, "closestRepToPoint:", v12, v14);
      if (v16)
        -[TSDInteractiveCanvasController beginEditingRep:](v6, "beginEditingRep:", v16);
    }
  }
  if (*((_BYTE *)v21 + 24))
    v17 = 0;
  else
    v17 = (void *)v16;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v17;
}

BOOL __46__TSWPiOSCanvasViewController__hitRepAtPoint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "convertNaturalPointFromUnscaledCanvas:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    v5 = v4;
    v7 = v6;
    objc_opt_class();
    objc_msgSend(v3, "smartFieldAtPoint:", v5, v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = TSUDynamicCast();
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "beginEditingRep:", v3);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_opt_class()))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  return v3 != 0;
}

- (id)_hyperLinkFieldAtPoint:(CGPoint)a3
{
  double y;
  double x;
  TSWPInteractiveCanvasController *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  y = a3.y;
  x = a3.x;
  v5 = -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:", x, y);
  v7 = v6;
  v9 = v8;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:", x, y);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__TSWPiOSCanvasViewController__hyperLinkFieldAtPoint___block_invoke;
  v12[3] = &unk_24D82DF28;
  v12[5] = v7;
  v12[6] = v9;
  v12[4] = &v13;
  -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v5, "hitRep:withGesture:passingTest:", 0, v12);
  v10 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __54__TSWPiOSCanvasViewController__hyperLinkFieldAtPoint___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_opt_class();
  result = TSUDynamicCast();
  if (result)
  {
    v3 = (void *)result;
    objc_msgSend((id)result, "convertNaturalPointFromUnscaledCanvas:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    v5 = v4;
    v7 = v6;
    objc_opt_class();
    objc_msgSend(v3, "smartFieldAtPoint:", v5, v7);
    result = TSUDynamicCast();
    if (result)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
      return 1;
    }
  }
  return result;
}

- (BOOL)interactionShouldSuppressSystemUI:(id)a3
{
  return TSUSupportsTextInteraction() ^ 1;
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  int v7;

  y = a4.y;
  x = a4.x;
  v7 = TSUSupportsTextInteraction();
  if (v7)
    LOBYTE(v7) = -[TSWPiOSCanvasViewController _shouldAllowInteractionAtPoint:](self, "_shouldAllowInteractionAtPoint:", x, y);
  return v7;
}

- (void)_resetLinkInteraction
{
  if (TSUSupportsTextInteraction())
  {
    self->_interactionHyperlinkField = 0;
    self->_isInteractingWithHyperLink = 0;
    self->_linkInteractionIsLongPress = 0;
  }
}

- (void)tapLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    -[TSWPiOSCanvasViewController startInteractionWithLinkAtPoint:](self, "startInteractionWithLinkAtPoint:", x, y);
    -[TSWPiOSCanvasViewController validateInteractionWithLinkAtPoint:](self, "validateInteractionWithLinkAtPoint:", x, y);
  }
}

- (BOOL)isInteractingWithLink
{
  int v3;

  v3 = TSUSupportsTextInteraction();
  if (v3)
    LOBYTE(v3) = self->_isInteractingWithHyperLink;
  return v3;
}

- (void)startInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    self->_interactionHyperlinkField = (TSWPHyperlinkField *)-[TSWPiOSCanvasViewController _hyperLinkFieldAtPoint:](self, "_hyperLinkFieldAtPoint:", x, y);
    self->_interactionHyperLinkRep = (TSWPRep *)-[TSWPiOSCanvasViewController _hitRepAtPoint:](self, "_hitRepAtPoint:", x, y);
    self->_isInteractingWithHyperLink = 1;
  }
}

- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;
  __CFString **v6;
  TSWPDummyTapGesture *v7;
  TSWPHyperlinkAction *v8;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction() && self->_isInteractingWithHyperLink)
  {
    if ((objc_msgSend(-[TSWPiOSCanvasViewController _hyperLinkFieldAtPoint:](self, "_hyperLinkFieldAtPoint:", x, y), "isEqual:", self->_interactionHyperlinkField) & 1) != 0)
    {
      self->_isInteractingWithHyperLink = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (self->_linkInteractionIsLongPress)
          v6 = TSWPLongPress;
        else
          v6 = TSWPImmediateSingleTap;
        v7 = -[TSWPDummyTapGesture initWithKind:]([TSWPDummyTapGesture alloc], "initWithKind:", *v6);
        v8 = -[TSWPiOSCanvasViewController actionForHyperlink:inRep:gesture:](self, "actionForHyperlink:inRep:gesture:", self->_interactionHyperlinkField, self->_interactionHyperLinkRep, v7);

      }
      else
      {
        v8 = +[TSWPHyperlinkAction hyperlinkActionWithHyperlink:inRep:action:](TSWPHyperlinkAction, "hyperlinkActionWithHyperlink:inRep:action:", self->_interactionHyperlinkField, self->_interactionHyperLinkRep, &__block_literal_global_43);
      }
      -[TSWPiOSCanvasViewController startDelayedTapAction:](self, "startDelayedTapAction:", v8);
    }
    else
    {
      -[TSWPiOSCanvasViewController cancelInteractionWithLink](self, "cancelInteractionWithLink");
    }
  }
}

uint64_t __66__TSWPiOSCanvasViewController_validateInteractionWithLinkAtPoint___block_invoke()
{
  return objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "visit");
}

- (void)cancelInteractionWithLink
{
  if (TSUSupportsTextInteraction())
    -[TSWPiOSCanvasViewController _resetAndClearInteractions](self, "_resetAndClearInteractions");
}

- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    self->_linkInteractionIsLongPress = 1;
    -[TSWPiOSCanvasViewController validateInteractionWithLinkAtPoint:](self, "validateInteractionWithLinkAtPoint:", x, y);
  }
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;
  int v6;

  y = a3.y;
  x = a3.x;
  v6 = TSUSupportsTextInteraction();
  if (v6)
    LOBYTE(v6) = -[TSWPiOSCanvasViewController _hyperLinkFieldAtPoint:](self, "_hyperLinkFieldAtPoint:", x, y) != 0;
  return v6;
}

- (void)_requestTextItemConstrainedToLineAtPoint:(CGPoint)a3 resultHandler:(id)a4
{
  double y;
  double x;
  TSWPInteractiveCanvasController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[10];

  y = a3.y;
  x = a3.x;
  v7 = -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v7, "convertUnscaledToBoundsPoint:", x, y);
  v9 = v8;
  v11 = v10;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v7, "convertBoundsToUnscaledPoint:", x, y);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__TSWPiOSCanvasViewController__requestTextItemConstrainedToLineAtPoint_resultHandler___block_invoke;
  v12[3] = &unk_24D82DF70;
  v12[6] = v9;
  v12[7] = v11;
  *(double *)&v12[8] = x;
  *(double *)&v12[9] = y;
  v12[4] = v7;
  v12[5] = a4;
  -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v7, "hitRep:withGesture:passingTest:", 0, v12);
}

BOOL __86__TSWPiOSCanvasViewController__requestTextItemConstrainedToLineAtPoint_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "convertNaturalPointFromUnscaledCanvas:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    v4 = (void *)objc_msgSend(v3, "hyperlinkRegionsConstrainedToLineAtPoint:");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "CGRectValue");
          objc_msgSend(v3, "convertNaturalRectToUnscaledCanvas:");
          objc_msgSend(*(id *)(a1 + 32), "convertUnscaledToBoundsRect:");
          x = v20.origin.x;
          y = v20.origin.y;
          width = v20.size.width;
          height = v20.size.height;
          if (CGRectContainsPoint(v20, *(CGPoint *)(a1 + 64)))
          {
            (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(x, y, width, height);
            return v3 != 0;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
  return v3 != 0;
}

- (TSWPSwipeGestureRecognizer)textLeftSwipeGestureRecognizer
{
  return self->_leftSwipeGestureRecognizer;
}

- (TSWPSwipeGestureRecognizer)textRightSwipeGestureRecognizer
{
  return self->_rightSwipeGestureRecognizer;
}

- (UITapGestureRecognizer)secondarySingleTapGestureRecognizer
{
  return self->_secondarySingleTapGestureRecognizer;
}

- (UIGestureRecognizer)hyperlinkGestureRecognizer
{
  return self->_hyperlinkGestureRecognizer;
}

- (TSWPLongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITextInteraction)textInteraction
{
  return self->_textInteraction;
}

- (void)setTextInteraction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1248);
}

@end
