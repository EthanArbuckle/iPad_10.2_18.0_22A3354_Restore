@implementation TSWPHyperlinkUIController

- (BOOL)isCanvasInReadMode
{
  return -[TSDInteractiveCanvasController inReadMode](-[TSWPHyperlinkUIController interactiveCanvasController](self, "interactiveCanvasController"), "inReadMode");
}

+ (id)sharedHyperlinkUIController
{
  id result;
  void *v3;

  result = (id)+[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance;
  if (!+[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance)
  {
    +[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance = objc_alloc_init(TSWPHyperlinkUIController);
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", +[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance, sel_p_documentUIWillCloseNotification_, CFSTR("TSKDocumentUIWillCloseNotification"), 0);
    return (id)+[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance;
  }
  return result;
}

- (int)p_UIState
{
  if (self->_hyperlinkField)
    return 5;
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkUIController;
  -[TSWPHyperlinkUIController dealloc](&v3, sel_dealloc);
}

- (void)visit
{
  objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "openURL:", -[TSWPHyperlinkField url](self->_hyperlinkField, "url"));
  -[TSWPHyperlinkUIController endUISession](self, "endUISession");
}

- (void)setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:(BOOL)a3
{
  -[TSDInteractiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:](-[TSWPHyperlinkUIController interactiveCanvasController](self, "interactiveCanvasController"), "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", a3);
}

- (void)startUISessionForHyperlinkField:(id)a3 inRep:(id)a4
{
  TSWPFilteredStorage *v7;
  TSWPStorage *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  TSWPStorage *v12;
  uint64_t v13;
  uint64_t v14;
  TSWPFilteredStorage *v15;
  TSWPStorage *v16;

  if (!-[TSWPHyperlinkUIController p_UIState](self, "p_UIState"))
  {
    self->_hyperlinkRep = (TSWPHyperlinkHostRepProtocol *)a4;
    self->_hyperlinkField = (TSWPHyperlinkField *)a3;
    v7 = [TSWPFilteredStorage alloc];
    v8 = -[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage");
    v9 = -[TSWPSmartField range](self->_hyperlinkField, "range");
    v11 = v10;
    v12 = -[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage");
    v13 = -[TSWPSmartField range](self->_hyperlinkField, "range");
    v15 = -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:](v7, "initWithStorage:subRange:removeRanges:", v8, v9, v11, -[TSWPStorage deletedRangesInRange:](v12, "deletedRangesInRange:", v13, v14));
    self->_originalDisplayText = (NSString *)-[TSWPFilteredStorage string](v15, "string");

    self->_changeSession = 0;
    v16 = -[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage");
    self->_observedStorage = v16;
    -[TSWPStorage addObserver:](v16, "addObserver:", self);
    ++self->_hyperlinkUISessionID;
  }
}

- (BOOL)hasOpenSessionForHyperlinkField:(id)a3
{
  return self->_hyperlinkField == a3;
}

- (BOOL)hasStartedSession
{
  return -[TSWPHyperlinkUIController p_UIState](self, "p_UIState") != 0;
}

- (void)p_stopObservingStorage
{
  TSWPStorage *observedStorage;

  observedStorage = self->_observedStorage;
  if (observedStorage)
  {
    -[TSWPStorage removeObserver:](observedStorage, "removeObserver:", self);
    self->_observedStorage = 0;
  }
}

- (void)endUISession
{
  TSWPInteractiveCanvasController *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  if (self->_hyperlinkRep)
  {
    -[TSWPHyperlinkUIController hideHyperlinkHighlight](self, "hideHyperlinkHighlight");
    if (!self->_shouldMaintainKeyboardWhenEndingSession)
    {
      v3 = -[TSWPHyperlinkUIController interactiveCanvasController](self, "interactiveCanvasController");
      v4 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __41__TSWPHyperlinkUIController_endUISession__block_invoke;
      block[3] = &unk_24D829278;
      block[4] = v3;
      dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
    }

    self->_hyperlinkRep = 0;
    self->_hyperlinkField = 0;

    self->_originalDisplayText = 0;
    self->_editedDisplayText = 0;

    self->_editedURLString = 0;
    self->_cachedEditingController = 0;
  }
  -[TSWPHyperlinkUIController p_stopObservingStorage](self, "p_stopObservingStorage");
}

uint64_t __41__TSWPHyperlinkUIController_endUISession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", 0);
}

- (TSWPEditingController)editingController
{
  TSWPEditingController *result;
  TSWPEditingController *v4;
  TSWPStorage *v5;
  TSWPEditingController *cachedEditingController;
  TSWPEditingController *v7;

  result = self->_cachedEditingController;
  if (!result)
  {
    v4 = -[TSDEditorController mostSpecificCurrentEditorOfClass:](-[TSDInteractiveCanvasController editorController](-[TSWPHyperlinkUIController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "mostSpecificCurrentEditorOfClass:", objc_opt_class());
    self->_cachedEditingController = v4;
    v5 = -[TSWPEditingController storage](v4, "storage");
    if (v5 == -[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage"))
      cachedEditingController = self->_cachedEditingController;
    else
      cachedEditingController = 0;
    self->_cachedEditingController = cachedEditingController;
    v7 = cachedEditingController;
    return self->_cachedEditingController;
  }
  return result;
}

- (void)showHyperlinkHighlight
{
  -[TSWPHyperlinkHostRepProtocol setHighlightedHyperlinkField:](self->_hyperlinkRep, "setHighlightedHyperlinkField:", self->_hyperlinkField);
}

- (void)hideHyperlinkHighlight
{
  -[TSWPHyperlinkHostRepProtocol setHighlightedHyperlinkField:](self->_hyperlinkRep, "setHighlightedHyperlinkField:", 0);
}

- (void)p_selectHyperlinkField
{
  TSWPEditingController *v3;
  uint64_t v4;
  uint64_t v5;

  if (!-[TSWPHyperlinkUIController isCanvasInReadMode](self, "isCanvasInReadMode"))
  {
    v3 = -[TSWPHyperlinkUIController editingController](self, "editingController");
    v4 = -[TSWPSmartField range](self->_hyperlinkField, "range");
    -[TSWPEditingController setSelection:withFlags:](v3, "setSelection:withFlags:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v4, v5), 0x200000);
  }
}

- (void)p_clearTextSelection
{
  if (!-[TSWPHyperlinkUIController isCanvasInReadMode](self, "isCanvasInReadMode"))
    -[TSWPEditingController setSelection:withFlags:](-[TSWPHyperlinkUIController editingController](self, "editingController"), "setSelection:withFlags:", 0, 0x200000);
}

- (BOOL)isDisplayingHyperlinkUI
{
  int v3;

  v3 = -[TSWPHyperlinkUIController p_UIState](self, "p_UIState");
  if (v3)
  {
    if (TSUPhoneUI())
      LOBYTE(v3) = self->_observedStorage != 0;
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (CGRect)p_viewBoundsForField
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[TSWPHyperlinkHostRepProtocol naturalBoundsRectForHyperlinkField:](self->_hyperlinkRep, "naturalBoundsRectForHyperlinkField:", self->_hyperlinkField);
  -[TSWPHyperlinkHostRepProtocol convertNaturalRectToUnscaledCanvas:](self->_hyperlinkRep, "convertNaturalRectToUnscaledCanvas:");
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](-[TSWPHyperlinkUIController interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v3, v4, v5, v6);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)p_initChangeSessionAuthorCreatedWithCommand:(id *)a3
{
  void *v5;

  if (!self->_changeSession)
  {
    v5 = (void *)objc_msgSend(-[TSWPStorage documentRoot](-[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage"), "documentRoot"), "changeSessionManagerForModel:", -[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage"));
    if (v5)
      self->_changeSession = (TSWPChangeSession *)objc_msgSend(v5, "changeSessionAuthorCreatedWithCommand:", a3);
  }
}

- (BOOL)p_shouldSetCanvasSelectionWhenDismissing
{
  char isKindOfClass;

  if (-[TSWPHyperlinkUIController isCanvasInReadMode](self, "isCanvasInReadMode"))
  {
    isKindOfClass = 0;
  }
  else
  {
    -[TSWPHyperlinkHostRepProtocol parentRep](self->_hyperlinkRep, "parentRep");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)p_shouldSetTextSelectionWhenDismissing
{
  return !-[TSWPHyperlinkUIController isCanvasInReadMode](self, "isCanvasInReadMode")
      && !-[TSWPStorage wpKind](-[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage"), "wpKind")
      && !self->_closingDocument
      && !self->_removeHyperlink;
}

+ (id)defaultTableView
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E58]), "initWithFrame:style:", 1, 0.0, 0.0, 320.0, 10.0);
  +[TSKPopoverBasedViewController configureTableView:](TSKPopoverBasedViewController, "configureTableView:", v2);
  objc_msgSend(v2, "setSeparatorInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  return v2;
}

- (void)i_openURLAction
{
  objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "openURL:", -[TSWPHyperlinkField url](self->_hyperlinkField, "url"));
}

- (NSString)stringForDisplay
{
  if (-[TSWPHyperlinkUIController editedDisplayText](self, "editedDisplayText"))
    return -[TSWPHyperlinkUIController editedDisplayText](self, "editedDisplayText");
  else
    return self->_originalDisplayText;
}

- (NSString)stringForURL
{
  if (-[TSWPHyperlinkUIController editedURLString](self, "editedURLString"))
    return -[TSWPHyperlinkUIController editedURLString](self, "editedURLString");
  else
    return -[NSURL absoluteString](-[TSWPHyperlinkField url](self->_hyperlinkField, "url"), "absoluteString");
}

- (TSWPInteractiveCanvasController)interactiveCanvasController
{
  return (TSWPInteractiveCanvasController *)-[TSWPHyperlinkHostRepProtocol interactiveCanvasController](self->_hyperlinkRep, "interactiveCanvasController");
}

- (UIViewController)viewControllerForPresenting
{
  UIViewController *v3;
  void *v4;
  uint64_t v5;

  objc_opt_class();
  -[TSKDocumentRoot viewController](-[TSDInteractiveCanvasController documentRoot](-[TSWPHyperlinkUIController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "viewController");
  v3 = (UIViewController *)TSUDynamicCast();
  if (!v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPHyperlinkUIController viewControllerForPresenting]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPHyperlinkUIController.mm"), 1262, CFSTR("invalid nil value for '%s'"), "viewController");
  }
  return v3;
}

- (NSString)editedDisplayText
{
  return self->_editedDisplayText;
}

- (void)setEditedDisplayText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)editedURLString
{
  return self->_editedURLString;
}

- (void)setEditedURLString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)shouldMaintainKeyboardWhenEndingSession
{
  return self->_shouldMaintainKeyboardWhenEndingSession;
}

- (void)setShouldMaintainKeyboardWhenEndingSession:(BOOL)a3
{
  self->_shouldMaintainKeyboardWhenEndingSession = a3;
}

@end
