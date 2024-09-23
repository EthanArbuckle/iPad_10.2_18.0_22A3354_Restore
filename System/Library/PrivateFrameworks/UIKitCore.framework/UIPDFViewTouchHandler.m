@implementation UIPDFViewTouchHandler

+ (void)releaseViewManager
{

  qword_1ECD7A768 = 0;
}

- (UIPDFViewTouchHandler)initWithView:(id)a3
{
  UIPDFViewTouchHandler *v4;
  UIPDFViewTouchHandler *v5;
  UIPDFSelectionController *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *v9;
  UILongPressGestureRecognizer *v10;
  UILongPressGestureRecognizer *v11;
  UIPDFMagnifierController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIPDFViewTouchHandler;
  v4 = -[UIPDFViewTouchHandler init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pdfPageView = (UIPDFPageView *)a3;
    v6 = objc_alloc_init(UIPDFSelectionController);
    v5->_selectionController = v6;
    -[UIPDFSelectionController setPageView:](v6, "setPageView:", a3);
    -[UIPDFPageView setSelectionController:](v5->_pdfPageView, "setSelectionController:", v5->_selectionController);
    v7 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v5, sel_doubleTapRecognized_);
    v5->_doubleTapRecognizer = v7;
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v7, "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v5->_doubleTapRecognizer, "setNumberOfTouchesRequired:", 1);
    -[UIGestureRecognizer setDelegate:](v5->_doubleTapRecognizer, "setDelegate:", v5);
    v8 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v5, sel_singleTapRecognized_);
    v5->_singleTapRecognizer = v8;
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v8, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v5->_singleTapRecognizer, "setNumberOfTouchesRequired:", 1);
    -[UIGestureRecognizer setDelegate:](v5->_singleTapRecognizer, "setDelegate:", v5);
    -[UIGestureRecognizer requireGestureRecognizerToFail:](v5->_singleTapRecognizer, "requireGestureRecognizerToFail:", v5->_doubleTapRecognizer);
    v9 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v5, sel_twoFingerTapRecognized_);
    v5->_twoFingerTapRecognizer = v9;
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v9, "setNumberOfTouchesRequired:", 2);
    -[UIGestureRecognizer setDelegate:](v5->_twoFingerTapRecognizer, "setDelegate:", v5);
    -[UIGestureRecognizer requireGestureRecognizerToFail:](v5->_singleTapRecognizer, "requireGestureRecognizerToFail:", v5->_twoFingerTapRecognizer);
    v10 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", v5, sel_briefPressRecognized_);
    v5->_briefPressRecognizer = v10;
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v10, "setMinimumPressDuration:", 0.2);
    -[UIGestureRecognizer setDelegate:](v5->_briefPressRecognizer, "setDelegate:", v5);
    v11 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", v5, sel_longPressRecognized_);
    v5->_longPressRecognizer = v11;
    -[UIGestureRecognizer setDelegate:](v11, "setDelegate:", v5);
    v5->_menuController = +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
    v12 = objc_alloc_init(UIPDFMagnifierController);
    v5->_magnifyController = v12;
    -[UIPDFMagnifierController setPageView:](v12, "setPageView:", a3);
    v5->_showMagnifier = 0;
    v5->_showLoupe = 1;
    -[UIPDFViewTouchHandler setFirstTouch](v5, "setFirstTouch");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "viewReleased:", self->_pdfPageView);
  -[UIGestureRecognizer removeTarget:action:](self->_doubleTapRecognizer, "removeTarget:action:", self, 0);
  -[UIGestureRecognizer setDelegate:](self->_doubleTapRecognizer, "setDelegate:", 0);

  -[UIGestureRecognizer removeTarget:action:](self->_singleTapRecognizer, "removeTarget:action:", self, 0);
  -[UIGestureRecognizer setDelegate:](self->_singleTapRecognizer, "setDelegate:", 0);

  -[UIGestureRecognizer removeTarget:action:](self->_twoFingerTapRecognizer, "removeTarget:action:", self, 0);
  -[UIGestureRecognizer setDelegate:](self->_twoFingerTapRecognizer, "setDelegate:", 0);

  -[UIGestureRecognizer removeTarget:action:](self->_briefPressRecognizer, "removeTarget:action:", self, 0);
  -[UIGestureRecognizer setDelegate:](self->_briefPressRecognizer, "setDelegate:", 0);

  -[UIGestureRecognizer removeTarget:action:](self->_longPressRecognizer, "removeTarget:action:", self, 0);
  -[UIGestureRecognizer setDelegate:](self->_longPressRecognizer, "setDelegate:", 0);

  -[UIPDFSelectionController setPageView:](self->_selectionController, "setPageView:", 0);
  -[UIPDFMagnifierController hide](self->_magnifyController, "hide");

  v3.receiver = self;
  v3.super_class = (Class)UIPDFViewTouchHandler;
  -[UIResponder dealloc](&v3, sel_dealloc);
}

- (void)enableRecognizers
{
  -[UIView addGestureRecognizer:](self->_pdfPageView, "addGestureRecognizer:", self->_singleTapRecognizer);
  -[UIView addGestureRecognizer:](self->_pdfPageView, "addGestureRecognizer:", self->_doubleTapRecognizer);
  -[UIView addGestureRecognizer:](self->_pdfPageView, "addGestureRecognizer:", self->_briefPressRecognizer);
  -[UIView addGestureRecognizer:](self->_pdfPageView, "addGestureRecognizer:", self->_longPressRecognizer);
  -[UIView addGestureRecognizer:](self->_pdfPageView, "addGestureRecognizer:", self->_twoFingerTapRecognizer);
}

- (void)disableRecognizers
{
  -[UIView removeGestureRecognizer:](self->_pdfPageView, "removeGestureRecognizer:", self->_singleTapRecognizer);
  -[UIView removeGestureRecognizer:](self->_pdfPageView, "removeGestureRecognizer:", self->_doubleTapRecognizer);
  -[UIView removeGestureRecognizer:](self->_pdfPageView, "removeGestureRecognizer:", self->_briefPressRecognizer);
  -[UIView removeGestureRecognizer:](self->_pdfPageView, "removeGestureRecognizer:", self->_longPressRecognizer);
  -[UIView removeGestureRecognizer:](self->_pdfPageView, "removeGestureRecognizer:", self->_twoFingerTapRecognizer);
}

- (id)nextResponder
{
  return self->_pdfPageView;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[UIResponder canResignFirstResponder](self, "canResignFirstResponder");
  if (v3)
  {
    -[UIPDFSelectionController clearSelection](self->_selectionController, "clearSelection");
    v5.receiver = self;
    v5.super_class = (Class)UIPDFViewTouchHandler;
    LOBYTE(v3) = -[UIResponder resignFirstResponder](&v5, sel_resignFirstResponder);
  }
  return v3;
}

- (void)setFirstTouch
{
  self->_firstTouch = 1;
  self->_useDelegateForLinks = 1;
}

- (BOOL)delegateGesture:(id)a3 kind:(int)a4
{
  UIPDFAnnotationController *v7;
  _BOOL4 v8;
  BOOL v9;

  if (self->_useDelegateForLinks)
  {
    v7 = -[UIPDFPageView annotationController](self->_pdfPageView, "annotationController");
    objc_msgSend(a3, "locationInView:", self->_pdfPageView);
    v8 = -[UIPDFAnnotationController isLinkAnnotationAt:](v7, "isLinkAnnotationAt:");
    if (v8)
    {
      if (a4)
      {
        if (a4 == 2)
        {
          v9 = -[UIPDFAnnotationController annotationLongPressRecognized:](-[UIPDFPageView annotationController](self->_pdfPageView, "annotationController"), "annotationLongPressRecognized:", a3);
        }
        else
        {
          if (a4 != 1)
          {
LABEL_11:
            LOBYTE(v8) = 1;
            return v8;
          }
          v9 = -[UIPDFAnnotationController annotationBriefPressRecognized:](-[UIPDFPageView annotationController](self->_pdfPageView, "annotationController"), "annotationBriefPressRecognized:", a3);
        }
      }
      else
      {
        v9 = -[UIPDFAnnotationController annotationSingleTapRecognized:](-[UIPDFPageView annotationController](self->_pdfPageView, "annotationController"), "annotationSingleTapRecognized:", a3);
      }
      self->_useDelegateForLinks = v9;
      goto LABEL_11;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)briefPressRecognized:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  if (!-[UIPDFViewTouchHandler delegateGesture:kind:](self, "delegateGesture:kind:", a3, 1))
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    objc_msgSend(a3, "locationInView:", self->_pdfPageView);
    v6 = v5;
    v8 = v7;
    switch(objc_msgSend(a3, "state"))
    {
      case 1:
        -[UIPDFPageView clearSearchHighlights](self->_pdfPageView, "clearSearchHighlights");
        -[UIPDFSelectionController startTracking:showMagnifier:](self->_selectionController, "startTracking:showMagnifier:", &self->_showMagnifier, v6, v8);
        if (self->_showMagnifier)
        {
          -[UIPDFSelectionController initialSelectionPoint](self->_selectionController, "initialSelectionPoint");
          -[UIPDFMagnifierController setPosition:viewPoint:](self->_magnifyController, "setPosition:viewPoint:");
          -[UIPDFMagnifierController showMagnifier](self->_magnifyController, "showMagnifier");
        }
        self->_trackingSelection = 1;
        break;
      case 2:
        -[UIPDFSelectionController tracking:showMagnifier:](self->_selectionController, "tracking:showMagnifier:", &self->_showMagnifier, v6, v8);
        if (self->_trackingSelection)
        {
          if (!self->_showMagnifier)
            goto LABEL_14;
          -[UIPDFSelectionController currentSelectionPoint](self->_selectionController, "currentSelectionPoint");
          -[UIPDFMagnifierController setPosition:viewPoint:](self->_magnifyController, "setPosition:viewPoint:");
          -[UIPDFMagnifierController move](self->_magnifyController, "move");
        }
        break;
      case 3:
        if (self->_showMagnifier)
          -[UIPDFMagnifierController hide](self->_magnifyController, "hide");
        -[UIPDFSelectionController endTracking:](self->_selectionController, "endTracking:", v6, v8);
        -[UIPDFViewTouchHandler showMenu](self, "showMenu");
        break;
      case 4:
        if (self->_showMagnifier)
LABEL_14:
          -[UIPDFMagnifierController hide](self->_magnifyController, "hide");
        break;
      default:
        return;
    }
  }
}

- (void)longPressRecognized:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIPDFMagnifierController *magnifyController;
  char v10;

  if (-[UIPDFMagnifierController visible](self->_magnifyController, "visible")
    || !-[UIPDFViewTouchHandler delegateGesture:kind:](self, "delegateGesture:kind:", a3, 2))
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    objc_msgSend(a3, "locationInView:", self->_pdfPageView);
    v6 = v5;
    v8 = v7;
    v10 = 0;
    -[UIPDFMagnifierController setPosition:viewPoint:](self->_magnifyController, "setPosition:viewPoint:", v5, v7, v5, v7);
    switch(objc_msgSend(a3, "state"))
    {
      case 1:
        -[UIPDFPageView clearSearchHighlights](self->_pdfPageView, "clearSearchHighlights");
        -[UIPDFSelectionController clearSelection](self->_selectionController, "clearSelection");
        -[UIPDFSelectionController startTracking:showMagnifier:](self->_selectionController, "startTracking:showMagnifier:", &v10, v6, v8);
        if (v10)
          -[UIPDFMagnifierController showLoupe](self->_magnifyController, "showLoupe");
        break;
      case 2:
        -[UIPDFSelectionController tracking:showMagnifier:](self->_selectionController, "tracking:showMagnifier:", &self->_showLoupe, v6, v8);
        magnifyController = self->_magnifyController;
        if (!self->_showLoupe)
          goto LABEL_10;
        -[UIPDFMagnifierController move](magnifyController, "move");
        break;
      case 3:
        -[UIPDFMagnifierController hide](self->_magnifyController, "hide");
        -[UIPDFSelectionController endTracking:](self->_selectionController, "endTracking:", v6, v8);
        -[UIPDFViewTouchHandler showMenu](self, "showMenu");
        break;
      case 4:
        magnifyController = self->_magnifyController;
LABEL_10:
        -[UIPDFMagnifierController hide](magnifyController, "hide");
        break;
      default:
        return;
    }
  }
}

- (void)doubleTapRecognized:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    objc_msgSend(a3, "locationInView:", self->_pdfPageView);
    -[UIPDFPageView doubleTapAt:](self->_pdfPageView, "doubleTapAt:");
  }
}

- (void)singleTapRecognized:(id)a3
{
  if (!-[UIPDFViewTouchHandler delegateGesture:kind:](self, "delegateGesture:kind:", a3, 0)
    && objc_msgSend(a3, "state") == 3)
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    objc_msgSend(a3, "locationInView:", self->_pdfPageView);
    -[UIPDFPageView singleTapAt:](self->_pdfPageView, "singleTapAt:");
  }
}

- (void)twoFingerTapRecognized:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (objc_msgSend(a3, "state") == 3)
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    -[UIPDFPageView clearSearchHighlights](self->_pdfPageView, "clearSearchHighlights");
    -[UIPDFSelectionController clearSelection](self->_selectionController, "clearSelection");
    objc_msgSend(a3, "locationOfTouch:inView:", 0, self->_pdfPageView);
    v6 = v5;
    v8 = v7;
    objc_msgSend(a3, "locationOfTouch:inView:", 1, self->_pdfPageView);
    -[UIPDFSelectionController startTracking:andPoint:](self->_selectionController, "startTracking:andPoint:", v6, v8, v9, v10);
    -[UIPDFSelectionController endTracking:](self->_selectionController, "endTracking:", v6, v8);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_firstTouch)
  {
    -[UIPDFAnnotationController addLinkAnnotationViews](-[UIPDFPageView annotationController](self->_pdfPageView, "annotationController", a3, a4), "addLinkAnnotationViews");
    self->_firstTouch = 0;
    self->_useDelegateForLinks = 1;
  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIPDFAnnotationController *v9;
  _BOOL4 v10;

  objc_msgSend(a3, "locationInView:", self->_pdfPageView);
  v6 = v5;
  v8 = v7;
  v9 = -[UIPDFPageView annotationController](self->_pdfPageView, "annotationController");
  if (!-[UIPDFAnnotationController willHandleTouchGestureAtPoint:](v9, "willHandleTouchGestureAtPoint:", v6, v8))
  {
    if (-[UIPDFPageView allowSelection](self->_pdfPageView, "allowSelection")
      || self->_briefPressRecognizer != a3 && self->_longPressRecognizer != a3)
    {
      if (self->_twoFingerTapRecognizer == a3)
      {
        LOBYTE(v10) = -[UIPDFPageView allowTwoFingerSelection](self->_pdfPageView, "allowTwoFingerSelection");
      }
      else if (self->_briefPressRecognizer == a3)
      {
        objc_msgSend(a3, "locationInView:", self->_pdfPageView);
        LOBYTE(v10) = -[UIPDFSelectionController shouldTrackAt:](self->_selectionController, "shouldTrackAt:");
      }
      else if (self->_singleTapRecognizer == a3)
      {
        objc_msgSend(a3, "locationInView:", self->_pdfPageView);
        LOBYTE(v10) = -[UIPDFPageView willDoSomethingWithTap:](self->_pdfPageView, "willDoSomethingWithTap:");
      }
      else
      {
        LOBYTE(v10) = 1;
      }
      return v10;
    }
LABEL_12:
    LOBYTE(v10) = 0;
    return v10;
  }
  if (!self->_useDelegateForLinks)
    goto LABEL_12;
  v10 = -[UIPDFAnnotationController isLinkAnnotationAt:](v9, "isLinkAnnotationAt:", v6, v8);
  if (v10)
    LOBYTE(v10) = -[UIPDFAnnotationController linkAnnotationShouldBegin:](v9, "linkAnnotationShouldBegin:", a3);
  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  UIPDFPage *v8;
  CGPDFDocument *Document;
  objc_super v10;

  if (!self->_allowMenu)
    return 0;
  if (sel_copy_ == a3
    && (v8 = -[UIPDFPageView page](self->_pdfPageView, "page"), -[UIPDFPage selection](v8, "selection")))
  {
    Document = CGPDFPageGetDocument(-[UIPDFPage CGPage](v8, "CGPage"));
    return CGPDFDocumentAllowsCopying(Document);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIPDFViewTouchHandler;
    return -[UIResponder canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, a3, a4);
  }
}

- (void)copy:(id)a3
{
  -[UIPDFSelection copyToPasteboard](-[UIPDFPage selection](-[UIPDFPageView page](self->_pdfPageView, "page", a3), "selection"), "copyToPasteboard");
}

- (void)selectAll:(id)a3
{
  -[UIPDFSelectionController extendSelectionToParagraph](self->_selectionController, "extendSelectionToParagraph", a3);
  -[UIPDFPageView setNeedsDisplay](self->_pdfPageView, "setNeedsDisplay");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_showMenu, 0, 0, 0.4);
  -[UIPDFPageView setNeedsDisplay](self->_pdfPageView, "setNeedsDisplay");
}

- (void)showMenu
{
  UIPDFSelection *v3;
  UIPDFSelection *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double x;
  double y;
  double width;
  double height;
  NSObject *v17;
  id v18;
  NSArray *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pdfPageView, "page"), "selection");
  if (v3)
  {
    v4 = v3;
    -[UIResponder becomeFirstResponder](self, "becomeFirstResponder");
    -[UIPDFSelection bounds](v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    memset(&v31, 0, sizeof(v31));
    -[UIPDFSelection transform](v4, "transform");
    v30 = v31;
    v34.origin.x = v6;
    v34.origin.y = v8;
    v34.size.width = v10;
    v34.size.height = v12;
    v35 = CGRectApplyAffineTransform(v34, &v30);
    -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pdfPageView, "convertRectFromPDFPageSpace:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
    v37 = CGRectInset(v36, -2.0, -2.0);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    -[UIPDFPageView delegate](self->_pdfPageView, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = -[UIPDFPageView delegate](self->_pdfPageView, "delegate");
      -[UIMenuController setMenuItems:](self->_menuController, "setMenuItems:", -[NSObject menuItems:forPage:](v17, "menuItems:forPage:", MEMORY[0x1E0C9AA60], self->_pdfPageView));
    }
    if (!objc_msgSend(-[UIPDFSelection string](v4, "string"), "length")
      || (v18 = -[UIPDFSelection string](v4, "string"),
          !objc_msgSend((id)objc_msgSend(v18, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), "length")))
    {
      v19 = -[UIMenuController menuItems](self->_menuController, "menuItems");
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v27 != v23)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if ((char *)objc_msgSend(v25, "action") != sel_lookupSelection_)
              objc_msgSend(v20, "addObject:", v25);
          }
          v22 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v22);
      }
      -[UIMenuController setMenuItems:](self->_menuController, "setMenuItems:", v20);
    }
    -[UIMenuController setTargetRect:inView:](self->_menuController, "setTargetRect:inView:", self->_pdfPageView, x, y, width, height);
    -[UIMenuController update](self->_menuController, "update");
    -[UIMenuController setMenuVisible:animated:](self->_menuController, "setMenuVisible:animated:", 1, 1);
  }
}

- (BOOL)allowMenu
{
  return self->_allowMenu;
}

- (void)setAllowMenu:(BOOL)a3
{
  self->_allowMenu = a3;
}

@end
