@implementation TSADocumentViewController

- (BOOL)isCanvasFullScreen
{
  return 0;
}

- (BOOL)chartDataEditorShowing
{
  return 0;
}

- (BOOL)isKeyboardUp
{
  return +[TSKKeyboardMonitor keyboardIsVisibleAndDocked](TSKKeyboardMonitor, "keyboardIsVisibleAndDocked");
}

- (BOOL)inPrintPreviewMode
{
  return 0;
}

- (BOOL)isInspectorVisible
{
  return 0;
}

- (BOOL)inFindReplaceMode
{
  return -[TSADocumentViewController documentMode](self, "documentMode") == 2;
}

- (TSADebugViewController)debugViewController
{
  TSADebugViewController *result;

  result = self->_debugViewController;
  if (!result)
  {
    result = -[TSADebugViewController initWithDelegate:]([TSADebugViewController alloc], "initWithDelegate:", self);
    self->_debugViewController = result;
  }
  return result;
}

- (TSADocumentViewController)initWithDefaultView
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentViewController initWithDefaultView]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 337, CFSTR("Abstract method"));
  self->mSavedContentOffset = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->mSavedCanvasViewScale = 0.0;
  return 0;
}

- (TSADocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TSADocumentViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSADocumentViewController;
  result = -[TSADocumentViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
    result->_shouldShowInstructionalText = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  self->_coachingTipsButton = 0;
  self->_sharingButton = 0;
  -[TSADocumentViewController setNavigatorViewController:](self, "setNavigatorViewController:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSADocumentViewController;
  -[TSAViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)isCJKEnabled
{
  return -[NSArray count](-[TSADocumentViewController CJKLanguages](self, "CJKLanguages"), "count") != 0;
}

- (BOOL)isBiDiEnabled
{
  return -[NSArray count](-[TSADocumentViewController bidiLanguages](self, "bidiLanguages"), "count") != 0;
}

- (id)p_arrayByAddingLanguage:(id)a3 toArray:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(a4);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasPrefix:", a3) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    objc_msgSend(a4, "addObject:", a3);
  }
  return a4;
}

- (NSArray)listLanguages
{
  return (NSArray *)TSUFindInputLanguagesWithBlock();
}

uint64_t __42__TSADocumentViewController_listLanguages__block_invoke()
{
  return TSUHasListLanguage();
}

- (NSArray)CJKLanguages
{
  return (NSArray *)TSUFindInputLanguagesWithBlock();
}

uint64_t __41__TSADocumentViewController_CJKLanguages__block_invoke()
{
  return TSUHasCJKLanguage();
}

- (NSArray)bidiLanguages
{
  return (NSArray *)TSUFindInputLanguagesWithBlock();
}

uint64_t __42__TSADocumentViewController_bidiLanguages__block_invoke()
{
  return TSUHasBiDiLanguage();
}

- (TSAInteractiveCanvasController)defaultInteractiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setDefaultInteractiveCanvasController:(id)a3
{
  id v5;

  v5 = a3;

  self->_interactiveCanvasController = (TSAInteractiveCanvasController *)a3;
}

- (void)setDocument:(id)a3
{
  TIADocument *document;

  document = self->_document;
  if (document != a3)
  {
    if (document)
    {
      if (self->_isDocumentLoaded)
        -[TSADocumentViewController unloadDocument](self, "unloadDocument");
      else
        -[TSADocumentViewController teardown](self, "teardown");
    }

    self->_document = (TIADocument *)a3;
    self->_isDocumentLoaded = 0;
  }
}

- (TSADocumentRoot)documentRoot
{
  return -[TIADocument documentRoot](self->_document, "documentRoot");
}

- (void)setDocumentUnloaded
{
  self->_isDocumentLoaded = 0;
}

- (void)willReplaceDocument
{
  if (!self->_isAbandoningDocument)
  {
    self->_documentModeBeforeReplaceController = -[TSADocumentViewController p_documentModeToRestoreFor:](self, "p_documentModeToRestoreFor:", -[TSADocumentViewController documentMode](self, "documentMode"));
    -[TSADocumentViewController setDocumentMode:animated:](self, "setDocumentMode:animated:", 0, 0);
    -[TSADocumentViewController viewWillDisappear:](self, "viewWillDisappear:", 0);
    -[TSAViewController viewDidDisappear:](self, "viewDidDisappear:", 0);
  }
}

- (void)didReplaceDocument
{
  -[TSADocumentViewController viewWillAppear:](self, "viewWillAppear:", 0);
  -[TSADocumentViewController viewDidAppear:](self, "viewDidAppear:", 0);
  -[TSADocumentViewController setDocumentMode:animated:](self, "setDocumentMode:animated:", self->_documentModeBeforeReplaceController, 0);
}

- (void)abandonDocument
{
  self->_isAbandoningDocument = 1;
  -[TSADocumentViewController willReplaceDocument](self, "willReplaceDocument");
  -[TSADocumentViewController setDocument:](self, "setDocument:", 0);
  self->_isAbandoningDocument = 0;
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  if (-[TSADocumentViewController documentMode](self, "documentMode") == 1)
    -[TSDInteractiveCanvasController setSelection:onModel:withFlags:](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setSelection:onModel:withFlags:", a3, a4, a5);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)TSAActiveCoachingTipSetObserverContext != a6 && TSACanvasCoachingTipsObserverContext != (_QWORD)a6)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSADocumentViewController;
    -[TSADocumentViewController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)navigatePlay:(id)a3
{
  objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController", a3), "endUISession");
}

- (void)p_startBackgroundInit
{
  objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_p_backgroundInit, self, 0);
}

- (void)p_backgroundInit
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDD1460]);
  objc_msgSend(MEMORY[0x24BDD17F0], "setThreadPriority:", 0.0);
  -[TSADocumentViewController backgroundInit](self, "backgroundInit");
  objc_msgSend(v3, "drain");
}

- (BOOL)teardownAppUIForDocumentManagerAction
{
  return 1;
}

- (double)mainToolsMenuMinimumHeight
{
  return 0.0;
}

- (void)p_restoreTextSelectionAfterModalDismiss
{
  if (TSUPhoneUI())
    -[TSDInteractiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:](self->_interactiveCanvasController, "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", 1);
}

- (void)popoverControllerDidDismissPopoverBasedViewController:(id)a3
{
  if (TSUPhoneUI() && !self->_documentModeChangeInProgress)
  {
    -[TSDInteractiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:](self->_interactiveCanvasController, "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", 0);
    -[TSADocumentViewController adjustContentViewFrame](self, "adjustContentViewFrame");
    -[TSADocumentViewController adjustScrollViewInsets](self, "adjustScrollViewInsets");
  }
  if (TSUPhoneUI())
    self->_helpViewVisibleState = 0;
}

- (BOOL)popoverController:(id)a3 shouldReceiveOutsideTouchAtLocation:(CGPoint)a4 inView:(id)a5
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
  CGPoint v20;
  CGRect v21;

  y = a4.y;
  x = a4.x;
  -[UIButton bounds](self->_closeButton, "bounds", a3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIButton convertPoint:fromView:](self->_closeButton, "convertPoint:fromView:", a5, x, y);
  v20.x = v17;
  v20.y = v18;
  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  return !CGRectContainsPoint(v21, v20);
}

- (void)popoverController:(id)a3 learnMoreAPDIDTapped:(id)a4
{
  -[TSAViewController showHelpWithTopicId:completion:](self, "showHelpWithTopicId:completion:", a4, 0);
}

- (BOOL)navigatorHiddenDefault
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKeyInCurrentRole:", CFSTR("NavigatorHidden"));
}

- (void)setNavigatorHiddenDefault:(BOOL)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setBool:forKeyInCurrentRole:", a3, CFSTR("NavigatorHidden"));
}

- (double)viewHeaderHeight
{
  return 0.0;
}

- (void)closeDocumentPressed
{
  objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
  -[TSDInteractiveCanvasController teardownBackgroundRendering](-[TSADocumentViewController defaultInteractiveCanvasController](self, "defaultInteractiveCanvasController"), "teardownBackgroundRendering");
}

- (BOOL)p_shouldZoomOutFromTable
{
  return 0;
}

- (BOOL)p_shouldZoomOutForCurrentSelection
{
  return -[TSAInteractiveCanvasController hasEmptyWPSelection](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "hasEmptyWPSelection")|| -[TSADocumentViewController p_shouldZoomOutFromTable](self, "p_shouldZoomOutFromTable");
}

- (void)documentWillClose
{
  self->_isClosingDocument = 1;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKDocumentUIWillCloseNotification"), self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "hideMenu");
  -[TSDInteractiveCanvasController beginEditingRep:](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "beginEditingRep:", 0);
}

- (void)loadDocument
{
  TSAInteractiveCanvasController *v3;
  TSADocumentRoot *v4;
  int64_t v5;

  if (!self->_isDocumentLoaded)
  {
    v3 = -[TSADocumentViewController defaultInteractiveCanvasController](self, "defaultInteractiveCanvasController");
    v4 = -[TSADocumentViewController documentRoot](self, "documentRoot");
    -[TSDInteractiveCanvasController setShowInvisibleObjects:](v3, "setShowInvisibleObjects:", 1);
    -[TSKChangeNotifier addObserver:forChangeSource:](-[TSKDocumentRoot changeNotifier](v4, "changeNotifier"), "addObserver:forChangeSource:", self, v4);
    -[TSAInteractiveCanvasController loadDocument](v3, "loadDocument");
    v5 = -[TSADocumentViewController lastDocumentMode](self, "lastDocumentMode");
    -[TSADocumentViewController setLastDocumentMode:](self, "setLastDocumentMode:", v5);
    -[TSADocumentViewController p_setDocumentMode:animated:dismissOnTop:](self, "p_setDocumentMode:animated:dismissOnTop:", v5, 0, 1);
    objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "setObservedUndoManager:", -[TSADocumentViewController undoManager](self, "undoManager"));
    self->_isDocumentLoaded = 1;
  }
}

- (void)p_teardown
{
  -[TSAInteractiveCanvasController teardown](-[TSADocumentViewController defaultInteractiveCanvasController](self, "defaultInteractiveCanvasController"), "teardown");
  objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "willCloseDocumentContext:", -[TSPObject context](-[TSADocumentViewController documentRoot](self, "documentRoot"), "context"));
}

- (void)unloadDocument
{
  TSAInteractiveCanvasController *v3;
  TSADocumentRoot *v4;

  v3 = -[TSADocumentViewController defaultInteractiveCanvasController](self, "defaultInteractiveCanvasController");
  objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "setObservedUndoManager:", 0);
  -[TSADocumentViewController p_deregisterForNotifications](self, "p_deregisterForNotifications");
  v4 = -[TSADocumentViewController documentRoot](self, "documentRoot");
  -[TSKChangeNotifier removeObserver:forChangeSource:](-[TSKDocumentRoot changeNotifier](v4, "changeNotifier"), "removeObserver:forChangeSource:", self, v4);
  -[TSAInteractiveCanvasController unloadDocument](v3, "unloadDocument");
  -[TSADocumentViewController p_teardown](self, "p_teardown");
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3
{
  double y;
  double x;
  TSAInteractiveCanvasController *v6;
  double MaxY;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v6 = -[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDScrollView frame](self->_scrollView, "frame");
  MaxY = CGRectGetMaxY(v18);
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v6, "convertUnscaledToBoundsPoint:", x, y);
  v9 = v8;
  v11 = v10;
  -[TSDScrollView contentSize](self->_scrollView, "contentSize");
  if (v12 - v11 < MaxY)
  {
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v6, "convertBoundsToUnscaledPoint:", v9, fmax(v11 - (MaxY - (v12 - v11)), 0.0));
    x = v13;
    y = v14;
  }
  v15 = x;
  v16 = y;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)toolsFindReplace
{
  -[TSADocumentViewController setDocumentMode:animated:](self, "setDocumentMode:animated:", 2, TSUPadUI());
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSADocumentViewController;
  -[TSADocumentViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)title
{
  if (TSUPadUI())
    return -[TSADocumentRoot name](-[TIADocument documentRoot](self->_document, "documentRoot"), "name");
  else
    return &stru_24D82FEB0;
}

- (BOOL)isLayoutBelowApplicationToolbar
{
  return 0;
}

- (id)closeDocumentButton
{
  return -[TSAViewController toolbarButtonWithTitle:target:action:isModal:](self, "toolbarButtonWithTitle:target:action:isModal:", -[TSADocumentViewController closeDocumentButtonTitle](self, "closeDocumentButtonTitle"), self, sel_closeDocumentPressed, 0);
}

- (BOOL)displaySharingButton
{
  return 1;
}

- (double)leftToolbarItemsInset
{
  int IsLandscape;
  double *v3;

  if (TSUPhoneUI())
  {
    IsLandscape = TSUStatusBarIsLandscape();
    v3 = (double *)&TSADefaultLeftToolbarItemsInsetiPhoneLandscape;
    if (!IsLandscape)
      v3 = (double *)&TSADefaultLeftToolbarItemsInsetiPhonePortrait;
  }
  else
  {
    v3 = (double *)&TSADefaultLeftToolbarItemsInsetiPad;
  }
  return *v3;
}

- (double)rightToolbarItemsInset
{
  int v2;
  double *v3;

  v2 = TSUPhoneUI();
  v3 = (double *)&TSADefaultRightToolbarItemsInsetiPhone;
  if (!v2)
    v3 = (double *)&TSADefaultRightToolbarItemsInsetiPad;
  return *v3;
}

- (CGRect)rectForPopoverFromToolbarButton:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v7 = v6 + -6.0;
  objc_msgSend((id)objc_msgSend(a3, "imageView"), "frame");
  v10 = v5;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v10;
  result.origin.x = v8;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSADocumentViewController;
  -[TSADocumentViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!self->_document)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentViewController viewWillAppear:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 2812, CFSTR("No document has been set"));
  }
  self->_keyboardHeight = 0.0;
  -[TSDInteractiveCanvasController setDelegate:](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setDelegate:", self);
  if (!self->_isDocumentLoaded)
  {
    -[TSADocumentViewController loadDocument](self, "loadDocument");
    self->_isClosingDocument = 0;
  }
  if (!self->_registered)
  {
    self->_registered = 1;
    +[TSKKeyboardMonitor addKeyboardObserver:](TSKKeyboardMonitor, "addKeyboardObserver:", self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_willEnterFullScreen_, CFSTR("TSKWillEnterFullScreenNotification"), 0);
    -[TSADocumentViewController registerForCanvasEditorNotifications](self, "registerForCanvasEditorNotifications");
  }
  -[TSADocumentViewController adjustContentViewFrame](self, "adjustContentViewFrame");
  -[TSADocumentViewController adjustScrollViewInsets](self, "adjustScrollViewInsets");
  -[TSADocumentViewController setIsLandscapeOrientation:](self, "setIsLandscapeOrientation:", TSUStatusBarIsLandscape());
  if (TSUPhoneUI())
  {
    if (!-[TSADocumentViewController isLandscapeOrientation](self, "isLandscapeOrientation"))
      -[TSAViewController setLeftToolbarItemsMaximumWidth:](self, "setLeftToolbarItemsMaximumWidth:", 168.0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSADocumentViewController;
  -[TSAViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (!self->_document)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentViewController viewDidAppear:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 2872, CFSTR("No document has been set"));
  }
  if (!self->_scheduledBackgroundInit)
  {
    self->_scheduledBackgroundInit = 1;
    -[TSADocumentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_startBackgroundInit, 0, 0.00999999978);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)TSADocumentViewController;
  -[TSAViewController viewWillDisappear:](&v13, sel_viewWillDisappear_, a3);
  if (-[TSADocumentViewController document](self, "document"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = -[TSDCanvas topLevelReps](-[TSDInteractiveCanvasController canvas](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvas"), "topLevelReps");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "recursivelyPerformSelectorIfImplemented:", sel_disableCaretAnimation);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v6);
    }
  }
  -[TSADocumentViewController p_deregisterForNotifications](self, "p_deregisterForNotifications");
  -[TSADocumentViewController adjustContentViewFrame](self, "adjustContentViewFrame");
}

- (void)p_deregisterForNotifications
{
  if (self->_registered)
  {
    self->_registered = 0;
    +[TSKKeyboardMonitor removeKeyboardObserver:](TSKKeyboardMonitor, "removeKeyboardObserver:", self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("TSKWillEnterFullScreenNotification"), 0);
    -[TSADocumentViewController deRegisterForCanvasEditorNotifications](self, "deRegisterForCanvasEditorNotifications");
    self->_keyboardHeight = 0.0;
  }
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSADocumentViewController;
  -[TSADocumentViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (CGRect)openCloseAnimationCanvasFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDInteractiveCanvasController visibleBoundsRect](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "visibleBoundsRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)openCloseAnimationAlternativeView
{
  return 0;
}

- (void)didStopCloseDocumentAnimation
{
  -[TSAInteractiveCanvasController teardown](self->_interactiveCanvasController, "teardown");
}

- (double)externalKeyboardHideMinDuration
{
  return 0.0;
}

- (id)alternativeOpenCloseDocumentAnimationView
{
  return 0;
}

- (BOOL)useToolBarHeightForSetDocumentMode
{
  return 0;
}

- (double)toolbarSpaceWidth
{
  return 18.0;
}

- (double)toolbarTextButtonSpaceWidth
{
  int v2;
  double result;

  v2 = TSUPadUI();
  result = 18.0;
  if (v2)
    return 22.0;
  return result;
}

- (void)interactiveCanvasController:(id)a3 willAnimateToViewScale:(double)a4 withDuration:(double)a5 unscaledContentOffset:(CGPoint)a6
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
    +[TSWPEditMenuController hideEditMenu](TSWPEditMenuController, "hideEditMenu");
}

- (id)childViewControllerForStatusBarStyle
{
  return 0;
}

- (_NSRange)visibleRootIndexRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setDocumentMode:(int64_t)a3 animated:(BOOL)a4
{
  -[TSADocumentViewController setDocumentMode:animated:dismissOnTop:](self, "setDocumentMode:animated:dismissOnTop:", a3, a4, 1);
}

- (void)setDocumentMode:(int64_t)a3 animated:(BOOL)a4 dismissOnTop:(BOOL)a5
{
  if (self->_documentMode != a3)
  {
    -[TSADocumentViewController p_setDocumentMode:animated:dismissOnTop:](self, "p_setDocumentMode:animated:dismissOnTop:");
    if (a3 != 2)
      -[TSADocumentViewController setLastDocumentMode:](self, "setLastDocumentMode:", a3);
  }
}

- (void)setDocumentMode:(int64_t)a3
{
  -[TSADocumentViewController setDocumentMode:animated:](self, "setDocumentMode:animated:", a3, 0);
}

- (int64_t)defaultDocumentMode
{
  return 1;
}

- (int64_t)lastDocumentMode
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("DocumentMode"));
  if (v3)
    return objc_msgSend(v3, "integerValue");
  else
    return -[TSADocumentViewController defaultDocumentMode](self, "defaultDocumentMode");
}

- (void)setLastDocumentMode:(int64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setInteger:forKey:", a3, CFSTR("DocumentMode"));
}

+ (void)resetLastDocumentMode
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "removeObjectForKey:", CFSTR("DocumentMode"));
}

- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  -[TSAInteractiveCanvasController willSetDocumentToMode:fromMode:animated:](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "willSetDocumentToMode:fromMode:animated:", a3, a4, a5);
}

- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  -[TSAInteractiveCanvasController didSetDocumentToMode:fromMode:animated:](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "didSetDocumentToMode:fromMode:animated:", a3, a4, a5);
}

- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  BOOL v4;

  if (-[TSADocumentViewController documentMode](self, "documentMode", a3.x, a3.y)
    && -[TSADocumentViewController documentMode](self, "documentMode") != 2)
  {
    return 0;
  }
  v4 = 1;
  -[TSADocumentViewController setDocumentMode:animated:](self, "setDocumentMode:animated:", 1, 1);
  return v4;
}

- (BOOL)shouldAutoscrollToSelectionOnContentViewSizeChange
{
  return self->_documentMode != 0;
}

- (CGRect)contentFrame
{
  CGFloat v3;
  CGFloat x;
  CGFloat v5;
  CGFloat y;
  CGFloat v7;
  CGFloat width;
  CGFloat v9;
  CGFloat height;
  double v11;
  CGFloat v12;
  CGSize v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect remainder;
  CGRect result;

  objc_msgSend((id)-[TSADocumentViewController view](self, "view"), "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  remainder.origin.x = v3;
  remainder.origin.y = v5;
  remainder.size.width = v7;
  remainder.size.height = v9;
  -[TSADocumentViewController viewHeaderHeight](self, "viewHeaderHeight");
  if (v11 > 0.0)
  {
    v12 = v11;
    v13 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    v21.origin = (CGPoint)*MEMORY[0x24BDBF090];
    v21.size = v13;
    v14 = x;
    v13.width = y;
    v15 = width;
    v16 = height;
    CGRectDivide(*(CGRect *)((char *)&v13 - 8), &v21, &remainder, v12, CGRectMinYEdge);
    x = remainder.origin.x;
    y = remainder.origin.y;
    width = remainder.size.width;
    height = remainder.size.height;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)willChangeContentOffsetIfKeyboardHidden
{
  TSKScrollView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v9;

  if (self->_keyboardHeight <= 0.0)
    return 0;
  v3 = -[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "enclosingScrollView");
  -[TSKScrollView contentSize](v3, "contentSize");
  v5 = v4;
  -[TSKScrollView contentOffset](v3, "contentOffset");
  v7 = v6;
  -[TSKScrollView frame](v3, "frame");
  return v5 - v7 < CGRectGetMaxY(v9) - self->_keyboardHeight;
}

- (BOOL)shouldAdjustContentFrameWhileRotating
{
  return 1;
}

- (id)contentView
{
  return self->_scrollView;
}

- (void)adjustScrollViewInsets
{
  -[TSDInteractiveCanvasController unobscuredFrameDidChange](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "unobscuredFrameDidChange");
}

- (void)adjustContentViewFrame
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
  float v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v17;
  CGRect v18;

  -[TSADocumentViewController contentFrame](self, "contentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSDScrollView frame](self->_scrollView, "frame");
  v12 = v11;
  -[TSDScrollView frame](self->_scrollView, "frame");
  v18.origin.x = v13;
  v18.origin.y = v14;
  v18.size.width = v15;
  v18.size.height = v16;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (!CGRectEqualToRect(v17, v18))
    -[TSDScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "adjustContentInsets");
  -[TSADocumentViewController didSetContentViewFrame](self, "didSetContentViewFrame");
  -[TSDInteractiveCanvasController invalidateVisibleBounds](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "invalidateVisibleBounds");
  if (v10 != v12
    && -[TSADocumentViewController shouldAutoscrollToSelectionOnContentViewSizeChange](self, "shouldAutoscrollToSelectionOnContentViewSizeChange")&& v10 < v12)
  {
    -[TSDInteractiveCanvasController setShouldAutoscrollToSelectionAfterLayout:](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setShouldAutoscrollToSelectionAfterLayout:", 1);
  }
}

- (BOOL)preserveScrollViewClipping
{
  return 0;
}

- (CGRect)visibleScaledCanvasRectWithoutKeyboard
{
  TSAInteractiveCanvasController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSDCanvasView *v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = -[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDInteractiveCanvasController visibleBoundsRect](v3, "visibleBoundsRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[TSADocumentViewController isKeyboardUp](self, "isKeyboardUp"))
  {
    v12 = -[TSDInteractiveCanvasController canvasView](v3, "canvasView");
    v11 = v11 + self->_keyboardHeight;
    -[TSKScrollView contentSize](-[TSDCanvasView enclosingScrollView](v12, "enclosingScrollView"), "contentSize");
    v14 = v13;
    v15 = v14;
    if (v11 >= v15)
      v11 = v15;
  }
  v16 = v5;
  v17 = v7;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)visibleUnscaledCanvasRectWithoutKeyboard
{
  TSAInteractiveCanvasController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = -[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
  -[TSADocumentViewController visibleScaledCanvasRectWithoutKeyboard](self, "visibleScaledCanvasRectWithoutKeyboard");
  -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](v3, "convertBoundsToUnscaledRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGSize)sizeOfScrollViewEnclosingCanvas
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TSKScrollView frame](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "enclosingScrollView"), "frame");
  v4 = v3;
  v6 = v5;
  if (-[TSADocumentViewController isKeyboardUp](self, "isKeyboardUp"))
    v6 = v6 + self->_keyboardHeight;
  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)allowEditMenuToAppear
{
  objc_opt_class();
  -[TSDInteractiveCanvasController layerHost](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost");
  return !objc_msgSend((id)TSUDynamicCast(), "presentedViewController")
      && -[TSADocumentViewController presentedViewController](self, "presentedViewController") == 0;
}

- (BOOL)allowTextEditingToBegin
{
  return 1;
}

- (BOOL)allowImagePickerToAppear
{
  _BOOL4 v3;

  v3 = -[TSADocumentViewController allowEditMenuToAppear](self, "allowEditMenuToAppear");
  if (v3)
    LOBYTE(v3) = !-[TSDInteractiveCanvasController inReadMode](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "inReadMode");
  return v3;
}

- (void)p_setDocumentMode:(int64_t)a3 animated:(BOOL)a4 dismissOnTop:(BOOL)a5
{
  _BOOL4 v5;
  int64_t documentMode;
  TSAInteractiveCanvasController *v9;
  TSAInteractiveCanvasController *v10;
  uint64_t v11;
  double v12;
  _QWORD v13[6];
  _QWORD v14[9];

  if (!self->_settingDocumentMode)
  {
    v5 = a4;
    self->_settingDocumentMode = 1;
    documentMode = self->_documentMode;
    -[TSADocumentViewController willSetDocumentToMode:fromMode:animated:](self, "willSetDocumentToMode:fromMode:animated:", a3, documentMode, a4);
    self->_documentMode = a3;
    v9 = -[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
    v10 = v9;
    if (!a3)
    {
      -[TSDInteractiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:](v9, "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", 1);
      -[TSADocumentViewController setSelection:onModel:withFlags:](self, "setSelection:onModel:withFlags:", +[TSDCanvasSelection emptySelection](TSDCanvasSelection, "emptySelection"), -[TSADocumentViewController documentRoot](self, "documentRoot"), 0);
    }
    -[TSDInteractiveCanvasController setInReadMode:](v10, "setInReadMode:", a3 == 0);
    -[TSDInteractiveCanvasController setShowInvisibleObjects:](v10, "setShowInvisibleObjects:", a3 != 0);
    v11 = objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v12 = 0.2;
    if (!v5)
      v12 = 0.0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __69__TSADocumentViewController_p_setDocumentMode_animated_dismissOnTop___block_invoke;
    v14[3] = &unk_24D82FBE8;
    v14[4] = v11;
    v14[5] = self;
    v14[6] = v10;
    v14[7] = documentMode;
    v14[8] = a3;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __69__TSADocumentViewController_p_setDocumentMode_animated_dismissOnTop___block_invoke_2;
    v13[3] = &unk_24D82FC10;
    v13[4] = self;
    v13[5] = v11;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 196612, v14, v13, v12, 0.0);
    if ((objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "isDisplayingHyperlinkUI") & 1) == 0)-[TSDInteractiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:](v10, "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", 0);
    self->_settingDocumentMode = 0;
  }
}

uint64_t __69__TSADocumentViewController_p_setDocumentMode_animated_dismissOnTop___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  _BOOL8 v5;
  _QWORD *v6;

  objc_msgSend(*(id *)(a1 + 32), "beginIgnoringInteractionEvents");
  v2 = objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled");
  v3 = (void *)MEMORY[0x24BDF6F90];
  v4 = TSUPadUI();
  v5 = 1;
  if ((v4 & 1) == 0)
    v5 = *(_QWORD *)(a1 + 56) != 2;
  objc_msgSend(v3, "setAnimationsEnabled:", v5);
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1203) = 1;
  v6 = *(_QWORD **)(a1 + 40);
  if (v6[140] == 1)
  {
    objc_msgSend(*(id *)(a1 + 48), "resumeEditing");
    v6 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v6, "adjustContentViewFrame");
  return objc_msgSend(*(id *)(a1 + 40), "didSetDocumentToMode:fromMode:animated:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), 0);
}

uint64_t __69__TSADocumentViewController_p_setDocumentMode_animated_dismissOnTop___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1203) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "endIgnoringInteractionEvents");
}

- (void)hideSharedUIPanelsForReadMode
{
  -[TSADocumentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (NSString)closeDocumentButtonTitle
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentViewController closeDocumentButtonTitle]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 3696, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSADocumentViewController closeDocumentButtonTitle]"), 0));
}

- (double)modalToolbarTitleBaselineOffset
{
  return 0.0;
}

- (int64_t)modalToolbarTitleBaselineOffsetBarMetrics
{
  return 0;
}

- (void)p_zoomOutForCurrentSelection
{
  __CFRunLoop *Main;
  const void *v4;
  _QWORD block[5];

  if (!self->_waitingToZoomOut
    && -[TSDInteractiveCanvasController shouldZoomOnSelectionChange](self->_interactiveCanvasController, "shouldZoomOnSelectionChange"))
  {
    self->_waitingToZoomOut = 1;
    if (!-[TSADocumentViewController isKeyboardUp](self, "isKeyboardUp"))
    {
      Main = CFRunLoopGetMain();
      v4 = (const void *)*MEMORY[0x24BDBD5A0];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__TSADocumentViewController_p_zoomOutForCurrentSelection__block_invoke;
      block[3] = &unk_24D829278;
      block[4] = self;
      CFRunLoopPerformBlock(Main, v4, block);
    }
  }
}

uint64_t __57__TSADocumentViewController_p_zoomOutForCurrentSelection__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "zoomOutAnimated:", 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1200) = 0;
  return result;
}

- (void)zoomOutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  -[TSDInteractiveCanvasController fitWidthViewScale](self->_interactiveCanvasController, "fitWidthViewScale");
  v6 = v5;
  -[TSDInteractiveCanvasController visibleUnscaledRect](self->_interactiveCanvasController, "visibleUnscaledRect");
  -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self->_interactiveCanvasController, "setViewScale:contentOffset:clampOffset:animated:", 1, v3, v6, 0.0, v7);
}

- (float)viewBottomInScreenCoordinates
{
  CGRect v3;

  objc_msgSend((id)-[TSADocumentViewController view](self, "view"), "frame");
  return CGRectGetMaxY(v3);
}

- (void)setCanvasScrollViewClipsToBoundsForKeyboardAnimation:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[TSADocumentViewController preserveScrollViewClipping](self, "preserveScrollViewClipping"))
    -[TSKScrollView setClipsToBounds:](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "enclosingScrollView"), "setClipsToBounds:", v3);
}

- (void)keyboardWillShowOrDock:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  float v9;
  float v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[7];

  if (-[TSADocumentViewController contentView](self, "contentView") && self->_registered)
  {
    v5 = (void *)objc_msgSend(a3, "userInfo");
    if (!v5)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentViewController keyboardWillShowOrDock:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 3969, CFSTR("invalid nil value for '%s'"), "userInfo");
    }
    objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "onScreenHeight");
    self->_keyboardHeight = v8;
    objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF79C0]), "floatValue");
    v10 = v9;
    if ((objc_msgSend(+[TSAApplicationDelegate sharedDelegate](TSAApplicationDelegate, "sharedDelegate"), "isActivating") & 1) != 0)
    {
      v11 = 0.0;
      v12 = 4;
    }
    else
    {
      if (self->_documentModeChangeInProgress)
        v11 = 0.2;
      else
        v11 = v10;
      if (self->_documentModeChangeInProgress)
        v12 = 196612;
      else
        v12 = 4;
    }
    v13 = objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__TSADocumentViewController_keyboardWillShowOrDock___block_invoke;
    v15[3] = &unk_24D82A528;
    v15[4] = v13;
    v15[5] = self;
    *(double *)&v15[6] = v11;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__TSADocumentViewController_keyboardWillShowOrDock___block_invoke_2;
    v14[3] = &unk_24D82FC10;
    v14[4] = self;
    v14[5] = v13;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", v12, v15, v14, v11, 0.0);
  }
}

uint64_t __52__TSADocumentViewController_keyboardWillShowOrDock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginIgnoringInteractionEvents");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1160) = *(_QWORD *)(a1 + 48);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "interactiveCanvasController"), "setShouldAutoscrollToSelectionAfterLayout:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "adjustScrollViewInsets");
}

uint64_t __52__TSADocumentViewController_keyboardWillShowOrDock___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "endIgnoringInteractionEvents");
}

- (void)keyboardShowCanceled
{
  -[TSDScrollView contentOffset](self->_scrollView, "contentOffset");
  -[TSKScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[7];

  self->_keyboardHeight = 0.0;
  if (-[TSADocumentViewController contentView](self, "contentView") && self->_registered)
  {
    objc_opt_class();
    -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self->_interactiveCanvasController, "editorController"), "textInputEditor");
    v5 = (void *)TSUDynamicCast();
    if (self->_documentMode == 1
      && ((objc_msgSend(v5, "trackingKnobInParagraphMode") & 1) != 0
       || -[TSAViewController isPresentingModalViewController](self, "isPresentingModalViewController")))
    {
      -[TSADocumentViewController adjustContentViewFrame](self, "adjustContentViewFrame");
      -[TSADocumentViewController adjustScrollViewInsets](self, "adjustScrollViewInsets");
    }
    else
    {
      v6 = (void *)objc_msgSend(a3, "userInfo");
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDF79C0]), "floatValue");
      v8 = v7;
      if ((objc_msgSend(+[TSAApplicationDelegate sharedDelegate](TSAApplicationDelegate, "sharedDelegate"), "isActivating") & 1) != 0)
      {
        v9 = 0.0;
        v10 = 4;
      }
      else
      {
        if (self->_documentModeChangeInProgress)
          v9 = 0.2;
        else
          v9 = v8;
        if (self->_documentModeChangeInProgress)
          v10 = 196612;
        else
          v10 = 4;
      }
      v11 = objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __54__TSADocumentViewController_keyboardWillHideOrUndock___block_invoke;
      v13[3] = &unk_24D82A528;
      v13[4] = v11;
      v13[5] = self;
      *(double *)&v13[6] = v9;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __54__TSADocumentViewController_keyboardWillHideOrUndock___block_invoke_2;
      v12[3] = &unk_24D82FC10;
      v12[4] = self;
      v12[5] = v11;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", v10, v13, v12, v9, 0.0);
      if (self->_waitingToZoomOut)
      {
        -[TSADocumentViewController zoomOutAnimated:](self, "zoomOutAnimated:", 1);
        self->_waitingToZoomOut = 0;
      }
    }
  }
}

uint64_t __54__TSADocumentViewController_keyboardWillHideOrUndock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginIgnoringInteractionEvents");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1160) = *(_QWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 40), "adjustScrollViewInsets");
}

uint64_t __54__TSADocumentViewController_keyboardWillHideOrUndock___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "endIgnoringInteractionEvents");
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[TIADocument documentRoot](self->_document, "documentRoot") == a4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      v18 = CFSTR("selection");
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(a3);
          v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
          if (objc_msgSend(v8, "kind", v18) == 2)
          {
            v9 = (void *)objc_msgSend(v8, "details");
            v10 = objc_msgSend(v9, "objectForKey:", CFSTR("model"));
            objc_opt_class();
            objc_msgSend(v9, "objectForKey:", v18);
            v11 = TSUDynamicCast();
            objc_opt_class();
            objc_msgSend(v9, "objectForKey:", CFSTR("flags"));
            v12 = objc_msgSend((id)TSUDynamicCast(), "unsignedIntegerValue");
            if (v10)
            {
              if (v11)
              {
LABEL_10:
                -[TSADocumentViewController setSelection:onModel:withFlags:](self, "setSelection:onModel:withFlags:", v11, v10, v12 | 0x40);
                goto LABEL_11;
              }
            }
            else
            {
              v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentViewController asyncProcessChanges:forChangeSource:]");
              objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 4130, CFSTR("bad model in a selection change record"));
              if (v11)
                goto LABEL_10;
            }
            v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentViewController asyncProcessChanges:forChangeSource:]");
            objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 4131, CFSTR("bad selection in a selection change record"));
            goto LABEL_10;
          }
LABEL_11:
          ++v7;
        }
        while (v5 != v7);
        v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v5 = v17;
      }
      while (v17);
    }
  }
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)isPrintingCanvas
{
  return 0;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  return (unint64_t)(self->_documentMode - 1) < 2;
}

- (double)autoZoomAnimationDurationForInteractiveCanvasController:(id)a3
{
  uint64_t v4;
  double result;

  v4 = -[TSADocumentViewController presentedViewController](self, "presentedViewController", a3);
  result = 0.0;
  if (!v4)
  {
    result = self->_contentFrameAnimationDuration;
    if (result == 0.0)
      return 0.3;
  }
  return result;
}

- (void)editorDidChangeSelection:(id)a3
{
  if (-[TSADocumentViewController documentMode](self, "documentMode", a3) != 2
    && !-[TSADocumentViewController preventDocumentModeChangesDuringSelectionChanges](self, "preventDocumentModeChangesDuringSelectionChanges"))
  {
    -[TSADocumentViewController setDocumentMode:animated:](self, "setDocumentMode:animated:", 1, 1);
  }
  if (-[TSADocumentViewController p_shouldZoomOutForCurrentSelection](self, "p_shouldZoomOutForCurrentSelection"))
    -[TSADocumentViewController p_zoomOutForCurrentSelection](self, "p_zoomOutForCurrentSelection");
}

- (id)rectanglesObscuringView:(id)a3
{
  void *v4;
  CGFloat v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGSize v13;
  double keyboardHeight;
  CGFloat v15;
  double footerHeightPadding;
  CGRect v18;
  CGRect remainder;
  CGRect v20;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "array", a3);
  objc_msgSend((id)-[TSADocumentViewController view](self, "view"), "frame");
  v8 = v5;
  v10 = v9;
  v11 = v6;
  v12 = v7;
  memset(&remainder, 0, sizeof(remainder));
  v13 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v18.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v18.size = v13;
  keyboardHeight = self->_keyboardHeight;
  if (keyboardHeight > 0.0)
  {
    v15 = v10;
    CGRectDivide(*(CGRect *)&v5, &v18, &remainder, keyboardHeight, CGRectMaxYEdge);
    v4 = (void *)objc_msgSend(v4, "arrayByAddingObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size));
  }
  footerHeightPadding = self->_footerHeightPadding;
  if (footerHeightPadding > 0.0)
  {
    v20.origin.x = v8;
    v20.origin.y = v10;
    v20.size.width = v11;
    v20.size.height = v12;
    CGRectDivide(v20, &v18, &remainder, footerHeightPadding, CGRectMaxYEdge);
    v4 = (void *)objc_msgSend(v4, "arrayByAddingObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size));
  }
  if (-[TSADocumentViewController documentMode](self, "documentMode", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size, *(_QWORD *)&remainder.origin.x, *(_QWORD *)&remainder.origin.y, *(_QWORD *)&remainder.size.width, *(_QWORD *)&remainder.size.height) == 2)
  {
    objc_msgSend((id)-[TSAFindReplaceUIController view](-[TSADocumentViewController findReplaceUIController](self, "findReplaceUIController"), "view"), "frame");
    return (id)objc_msgSend(v4, "arrayByAddingObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:"));
  }
  return v4;
}

- (id)drawableFactory
{
  return -[TSADocumentRoot drawableFactory](-[TSADocumentViewController documentRoot](self, "documentRoot"), "drawableFactory");
}

- (void)willInsertDrawable
{
  if (TSUPhoneUI())
  {
    if (-[TSDInteractiveCanvasController shouldZoomOnSelectionChange](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "shouldZoomOnSelectionChange"))
    {
      -[TSADocumentViewController zoomOutAnimated:](self, "zoomOutAnimated:", 0);
    }
  }
}

- (BOOL)showEditMenuOnChartInsert
{
  return 1;
}

- (double)paddingAboveHalfHeightAtTopOfScreen
{
  return 0.0;
}

- (id)superviewForChartDataEditor:(id)a3
{
  return (id)objc_msgSend((id)-[TSADocumentViewController applicationViewController](self, "applicationViewController", a3), "view");
}

- (BOOL)shouldIgnoreTextGestures
{
  return -[TSADocumentViewController documentMode](self, "documentMode") == 2;
}

- (BOOL)toolsControllerIsVisible
{
  return 0;
}

- (BOOL)insertControllerIsVisible
{
  return 0;
}

- (void)p_scrollToRect:(CGRect)a3
{
  -[TSDInteractiveCanvasController scrollRectToVisibleCenter:animated:onlyScrollNecessaryAxes:](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "scrollRectToVisibleCenter:animated:onlyScrollNecessaryAxes:", 1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)p_scrollToCurrentSelection
{
  id v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  char v7;

  v3 = -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = 1;
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v3, "performSelector:withObject:", sel_shouldScrollToCurrentSelection_, &v7), v7))
    {
      v4 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      v5 = *MEMORY[0x24BDBF090];
      v6 = v4;
      objc_msgSend(v3, "performSelector:withObject:", sel_selectionRect_, &v5);
      -[TSADocumentViewController p_scrollToRect:](self, "p_scrollToRect:", v5, v6);
    }
  }
}

- (int64_t)p_documentModeToRestoreFor:(int64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return a3;
}

- (TSDiOSCanvasViewController)canvasViewController
{
  return self->_canvasViewController;
}

- (void)setCanvasViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1072);
}

- (TSANavigatorViewController)navigatorViewController
{
  return self->_navigatorViewController;
}

- (void)setNavigatorViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (UIScrollView)canvasScrollView
{
  return &self->_scrollView->super.super;
}

- (BOOL)isDocumentLoaded
{
  return self->_isDocumentLoaded;
}

- (BOOL)isClosingDocument
{
  return self->_isClosingDocument;
}

- (int64_t)documentMode
{
  return self->_documentMode;
}

- (BOOL)shouldShowInstructionalText
{
  return self->_shouldShowInstructionalText;
}

- (BOOL)isPrintingDocument
{
  return self->_isPrintingDocument;
}

- (BOOL)isHidingStatusBar
{
  return self->_isHidingStatusBar;
}

- (void)setHidingStatusBar:(BOOL)a3
{
  self->_isHidingStatusBar = a3;
}

- (BOOL)isLandscapeOrientation
{
  return self->_isLandscapeOrientation;
}

- (void)setIsLandscapeOrientation:(BOOL)a3
{
  self->_isLandscapeOrientation = a3;
}

- (TSAInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1104);
}

- (UIButton)coachingTipsButton
{
  return self->_coachingTipsButton;
}

- (TIADocument)document
{
  return self->_document;
}

- (TSAFindReplaceUIController)findReplaceUIController
{
  return self->_findReplaceUIController;
}

- (BOOL)printerOptionsShowing
{
  return self->_printerOptionsShowing;
}

- (void)setPrinterOptionsShowing:(BOOL)a3
{
  self->_printerOptionsShowing = a3;
}

- (BOOL)isPopoverGestureInFlight
{
  return self->_isPopoverGestureInFlight;
}

- (BOOL)preventDocumentModeChangesDuringSelectionChanges
{
  return self->_preventDocumentModeChangesDuringSelectionChanges;
}

- (TSKUIAlert)openDocumentKeepOrDeleteAlert
{
  return self->_openDocumentKeepOrDeleteAlert;
}

- (void)setOpenDocumentKeepOrDeleteAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1232);
}

- (UIButton)sharingButton
{
  return self->_sharingButton;
}

- (BOOL)editMenuTapGRWasEnabledForFind
{
  return self->_editMenuTapGRWasEnabledForFind;
}

- (void)setEditMenuTapGRWasEnabledForFind:(BOOL)a3
{
  self->_editMenuTapGRWasEnabledForFind = a3;
}

- (TSASyncResolveConflictViewController)_openDocumentResolveConflictViewController
{
  return self->__openDocumentResolveConflictViewController;
}

- (void)set_openDocumentResolveConflictViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1248);
}

- (TSKUIAlert)_openDocumentUpdatedAlert
{
  return self->__openDocumentUpdatedAlert;
}

- (void)_setOpenDocumentUpdatedAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1256);
}

- (TSKUIAlert)_openDocumentEvictionAlert
{
  return self->__openDocumentEvictionAlert;
}

- (void)set_openDocumentEvictionAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1264);
}

@end
