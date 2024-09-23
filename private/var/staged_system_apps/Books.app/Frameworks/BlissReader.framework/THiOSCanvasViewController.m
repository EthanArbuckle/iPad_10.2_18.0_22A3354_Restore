@implementation THiOSCanvasViewController

- (THiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THiOSCanvasViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THiOSCanvasViewController;
  v4 = -[THiOSCanvasViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", a3, a4);
  if (v4)
    -[THiOSCanvasViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  return v4;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  uint64_t v3;

  v3 = objc_opt_class(THInteractiveCanvasController, a2);
  return (THInteractiveCanvasController *)TSUDynamicCast(v3, *(_QWORD *)&self->TIACanvasViewController_opaque[OBJC_IVAR___TSDiOSCanvasViewController_mICC]);
}

- (void)dealloc
{
  objc_super v3;

  -[THiOSCanvasViewController p_releaseOutlets](self, "p_releaseOutlets");

  self->_menuAnnotationUUID = 0;
  v3.receiver = self;
  v3.super_class = (Class)THiOSCanvasViewController;
  -[THiOSCanvasViewController dealloc](&v3, "dealloc");
}

- (void)p_releaseOutlets
{
  -[THiOSCanvasViewController setSingleTFTapGestureRecognizer:](self, "setSingleTFTapGestureRecognizer:", 0);
  -[THiOSCanvasViewController setDelayedTFTapGestureRecognizer:](self, "setDelayedTFTapGestureRecognizer:", 0);
  -[THiOSCanvasViewController setHighlightGestureController:](self, "setHighlightGestureController:", 0);
  -[THGlossaryPopoverViewController dismissViewControllerAnimated:completion:](-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController"), "dismissViewControllerAnimated:completion:", 0, 0);
  -[THiOSCanvasViewController p_cleanupGlossaryPopover](self, "p_cleanupGlossaryPopover");
  -[UIViewController dismissViewControllerAnimated:completion:](-[THiOSCanvasViewController sharePopoverController](self, "sharePopoverController"), "dismissViewControllerAnimated:completion:", 0, 0);
  -[THiOSCanvasViewController setSharePopoverController:](self, "setSharePopoverController:", 0);
  -[BCDDParsecCollectionViewController dismissViewControllerAnimated:completion:](-[THiOSCanvasViewController lookupController](self, "lookupController"), "dismissViewControllerAnimated:completion:", 0, 0);
  -[THiOSCanvasViewController setLookupController:](self, "setLookupController:", 0);
  -[LTUITranslationViewController dismissViewControllerAnimated:completion:](-[THiOSCanvasViewController translationController](self, "translationController"), "dismissViewControllerAnimated:completion:", 0, 0);
  -[THiOSCanvasViewController setTranslationController:](self, "setTranslationController:", 0);
  -[THiOSCanvasViewController setTrackingController:](self, "setTrackingController:", 0);

  self->_traitsCache = 0;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THiOSCanvasViewController;
  -[THiOSCanvasViewController viewDidLoad](&v5, "viewDidLoad");
  objc_msgSend(-[THiOSCanvasViewController view](self, "view"), "setExclusiveTouch:", 0);
  -[THiOSCanvasViewController setTakeFirstResponderOnTap:](self, "setTakeFirstResponderOnTap:", 1);
  objc_msgSend(-[THiOSCanvasViewController view](self, "view"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_opt_new(THiOSTraitsCache, v3);
  -[THiOSCanvasViewController setTraitsCache:](self, "setTraitsCache:", v4);

  -[THiOSCanvasViewController setEditMenuInteraction:](self, "setEditMenuInteraction:", objc_msgSend(objc_alloc((Class)UIEditMenuInteraction), "initWithDelegate:", self));
  objc_msgSend(-[THiOSCanvasViewController view](self, "view"), "addInteraction:", -[THiOSCanvasViewController editMenuInteraction](self, "editMenuInteraction"));
}

- (id)_selectionDisplayInteraction
{
  id v2;
  id result;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(-[THiOSCanvasViewController view](self, "view", 0), "interactions");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v11;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
      v8 = objc_opt_class(UITextSelectionDisplayInteraction);
      *(_QWORD *)&v9 = TSUDynamicCast(v8, v7).n128_u64[0];
      if (result)
        break;
      if (v4 == (id)++v6)
      {
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16, v9);
        v4 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (void)_adjustZPositionIfNecessary
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = -[THiOSCanvasViewController _selectionDisplayInteraction](self, "_selectionDisplayInteraction");
  objc_msgSend(objc_msgSend(objc_msgSend(v2, "highlightView"), "layer"), "setZPosition:", 10.0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = objc_msgSend(v2, "handleViews", 0);
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
        objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "layer"), "setZPosition:", 10.0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  -[THiOSCanvasViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[THiOSTraitsCache updateTraitsWithCollection:](-[THiOSCanvasViewController traitsCache](self, "traitsCache"), "updateTraitsWithCollection:", -[THiOSCanvasViewController traitCollection](self, "traitCollection"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  -[THiOSCanvasViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "_accessibilityInvertColorsStatusDidChange:", UIAccessibilityInvertColorsStatusDidChangeNotification, 0);
  -[THiOSCanvasViewController _adjustZPositionIfNecessary](self, "_adjustZPositionIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  -[THiOSCanvasViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIAccessibilityInvertColorsStatusDidChangeNotification, 0);
}

- (void)_accessibilityInvertColorsStatusDidChange:(id)a3
{
  -[THInteractiveCanvasController invalidateLayers](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "invalidateLayers");
}

- (BOOL)wantsHyperlinkGestureRecognizer
{
  return 0;
}

- (BOOL)shouldHideCanvasLayerInMagnifier
{
  return 0;
}

- (void)setUpGestureRecognizers
{
  id v3;
  uint64_t v4;
  THInteractiveCanvasController *v5;
  uint64_t v6;
  id v7;
  THShortTapGestureRecognizer *v8;
  THShortTapGestureRecognizer *v9;
  id v10;
  THInteractiveCanvasController *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *j;
  void *v25;
  THWFreeTransformGestureRecognizer *v26;
  THWFreeTransformGestureRecognizer *v27;
  uint64_t v28;
  double v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v39.receiver = self;
  v39.super_class = (Class)THiOSCanvasViewController;
  v3 = -[THiOSCanvasViewController setUpGestureRecognizers](&v39, "setUpGestureRecognizers");
  if ((TSUSupportsTextInteraction(v3, v4) & 1) != 0)
  {
    v5 = -[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
    v6 = TSWPImmediatePress;
    v42 = TSWPImmediatePress;
    -[THInteractiveCanvasController enableGestureKinds:](v5, "enableGestureKinds:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
  }
  else
  {
    v6 = TSWPImmediatePress;
  }
  v7 = -[THInteractiveCanvasController gestureDispatcher](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher");
  v8 = [THShortTapGestureRecognizer alloc];
  -[THiOSCanvasViewController setSingleTFTapGestureRecognizer:](self, "setSingleTFTapGestureRecognizer:", -[THShortTapGestureRecognizer initWithGestureDispatcher:gestureKind:](v8, "initWithGestureDispatcher:gestureKind:", v7, TSDShortTap));
  -[UITapGestureRecognizer setAllowedTouchTypes:](-[THiOSCanvasViewController singleTFTapGestureRecognizer](self, "singleTFTapGestureRecognizer"), "setAllowedTouchTypes:", &off_469A00);
  objc_msgSend(-[THiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", -[THiOSCanvasViewController singleTFTapGestureRecognizer](self, "singleTFTapGestureRecognizer")), "addGestureRecognizer:", -[THiOSCanvasViewController singleTFTapGestureRecognizer](self, "singleTFTapGestureRecognizer"));
  v9 = [THShortTapGestureRecognizer alloc];
  -[THiOSCanvasViewController setDelayedTFTapGestureRecognizer:](self, "setDelayedTFTapGestureRecognizer:", -[THShortTapGestureRecognizer initWithGestureDispatcher:gestureKind:](v9, "initWithGestureDispatcher:gestureKind:", v7, TSDDelayedShortTap));
  -[UITapGestureRecognizer setAllowedTouchTypes:](-[THiOSCanvasViewController delayedTFTapGestureRecognizer](self, "delayedTFTapGestureRecognizer"), "setAllowedTouchTypes:", &off_469A18);
  objc_msgSend(-[THiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", -[THiOSCanvasViewController delayedTFTapGestureRecognizer](self, "delayedTFTapGestureRecognizer")), "addGestureRecognizer:", -[THiOSCanvasViewController delayedTFTapGestureRecognizer](self, "delayedTFTapGestureRecognizer"));
  v10 = -[THInteractiveCanvasController gestureRecognizerWithKind:](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureRecognizerWithKind:", v6);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](-[THiOSCanvasViewController singleTFTapGestureRecognizer](self, "singleTFTapGestureRecognizer"), "requireGestureRecognizerToFail:", v10);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](-[THiOSCanvasViewController delayedTFTapGestureRecognizer](self, "delayedTFTapGestureRecognizer"), "requireGestureRecognizerToFail:", v10);
  -[THiOSCanvasViewController setHighlightGestureController:](self, "setHighlightGestureController:", objc_alloc_init(THHighlightGestureController));
  -[THHighlightGestureController setInteractiveCanvasController:](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "setInteractiveCanvasController:", -[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  -[THHighlightGestureController setUpGestureRecognizers](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "setUpGestureRecognizers");
  -[THTimeoutDragGestureRecognizer requireGestureRecognizerToFail:](-[THHighlightGestureController highlightGestureRecognizer](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "highlightGestureRecognizer"), "requireGestureRecognizerToFail:", v10);
  v11 = -[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
  v12 = TSWPLongPress;
  objc_msgSend(-[THInteractiveCanvasController gestureRecognizerWithKind:](v11, "gestureRecognizerWithKind:", TSWPLongPress), "requireGestureRecognizerToFail:", -[THHighlightGestureController highlightGestureRecognizer](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "highlightGestureRecognizer"));
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](-[THiOSCanvasViewController singleTFTapGestureRecognizer](self, "singleTFTapGestureRecognizer"), "requireGestureRecognizerToFail:", -[THHighlightGestureController marginNotesGestureRecognizer](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "marginNotesGestureRecognizer"));
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](-[THiOSCanvasViewController delayedTFTapGestureRecognizer](self, "delayedTFTapGestureRecognizer"), "requireGestureRecognizerToFail:", -[THHighlightGestureController marginNotesGestureRecognizer](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "marginNotesGestureRecognizer"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = -[THiOSCanvasViewController panGestureRecognizers](self, "panGestureRecognizers");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "requireGestureRecognizerToFail:", -[THHighlightGestureController marginNotesGestureRecognizer](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "marginNotesGestureRecognizer"));
        objc_msgSend(v18, "requireGestureRecognizerToFail:", -[THHighlightGestureController highlightGestureRecognizer](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "highlightGestureRecognizer"));
        objc_msgSend(v7, "allowSimultaneousRecognitionByRecognizers:", v10, v18, 0);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v15);
  }
  objc_msgSend(v7, "allowSimultaneousRecognitionByRecognizers:", -[THInteractiveCanvasController gestureRecognizerWithKind:](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureRecognizerWithKind:", v12), -[THHighlightGestureController highlightGestureRecognizer](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "highlightGestureRecognizer"), 0);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = objc_msgSend(-[THiOSCanvasViewController view](self, "view"), "gestureRecognizers");
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    v23 = (id)TSWPTapAndTouch;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v25, "gestureKind") == v23)
          -[UITapGestureRecognizer requireGestureRecognizerToFail:](-[THiOSCanvasViewController delayedTFTapGestureRecognizer](self, "delayedTFTapGestureRecognizer"), "requireGestureRecognizerToFail:", v25);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v21);
  }
  v26 = [THWFreeTransformGestureRecognizer alloc];
  v27 = -[THWFreeTransformGestureRecognizer initWithGestureDispatcher:gestureKind:](v26, "initWithGestureDispatcher:gestureKind:", v7, TSDFreeTransform);
  -[THWFreeTransformGestureRecognizer setAllowedTouchTypes:](v27, "setAllowedTouchTypes:", &off_469A30);
  objc_msgSend(-[THiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v27), "addGestureRecognizer:", v27);
  v28 = objc_opt_class(THDocumentViewController);
  *(_QWORD *)&v29 = TSUDynamicCast(v28, -[THiOSCanvasViewController delegate](self, "delegate")).n128_u64[0];
  -[THWFreeTransformGestureRecognizer setUnmovingParentView:](v27, "setUnmovingParentView:", objc_msgSend(v30, "view", v29));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  -[THHighlightGestureController setEnabled:](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "setEnabled:", 0);
  v8.receiver = self;
  v8.super_class = (Class)THiOSCanvasViewController;
  -[THiOSCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  -[THHighlightGestureController setEnabled:](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "setEnabled:", 1);
}

- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = objc_opt_class(TSDGroupRep, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)THiOSCanvasViewController;
  return -[THiOSCanvasViewController shouldSelectAndShowEditMenuOnFirstTapForRep:](&v7, "shouldSelectAndShowEditMenuOnFirstTapForRep:", a3);
}

- (BOOL)shouldPreventGestureFromEditingController:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a3, "locationInView:", -[THiOSCanvasViewController view](self, "view"));
  v5 = v4;
  v7 = v6;
  v8 = -[THInteractiveCanvasController hitRep:](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v4, v6);
  v9 = objc_opt_class(THWPRep);
  TSUDynamicCast(v9, v8);
  if (v10)
    LOBYTE(v10) = objc_msgSend(v10, "hasMarginNoteAtCanvasPoint:", v5, v7);
  return (char)v10;
}

- (BOOL)shouldIgnoreTextGestures
{
  return +[THWPHighlightController activePopoverEditor](THWPHighlightController, "activePopoverEditor") != 0;
}

- (void)hideEditMenu
{
  NSNotificationCenter *v3;
  objc_super v4;

  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:](v3, "postNotificationName:object:", AEAnnotationPopoverShouldHideNotification, self);
  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  -[THiOSCanvasViewController hideEditMenu](&v4, "hideEditMenu");
}

- (void)buildMenuWithBuilder:(id)a3
{
  double y;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat x;
  void *i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v21;
  UIMenu *v22;
  UIMenu *v23;
  id v24;
  const __CFString *v25;
  id v26;
  UIKeyCommand *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  UIKeyCommand *v34;
  _BYTE v35[128];

  objc_msgSend(a3, "removeMenuForIdentifier:", UIMenuLookup);
  objc_msgSend(a3, "removeMenuForIdentifier:", UIMenuServices);
  objc_msgSend(a3, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuStandardEdit, &stru_429D90);
  y = CGPointZero.y;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = objc_msgSend(objc_msgSend(-[THiOSCanvasViewController view](self, "view", 0), "interactions"), "reverseObjectEnumerator");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v10 = *(_QWORD *)&y;
    x = CGPointZero.x;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(UIContextMenuInteraction);
        *(_QWORD *)&v16 = TSUDynamicCast(v14, v13).n128_u64[0];
        if (v15)
        {
          objc_msgSend(v15, "locationInView:", -[THiOSCanvasViewController view](self, "view", v16));
          v18 = v16;
          v19 = v17;
          if (CGPointZero.x == v16 && y == v17)
          {
            v10 = *(_QWORD *)&v17;
            x = v16;
          }
          else
          {
            v10 = 0x7FEFFFFFFFFFFFFFLL;
            v16 = 1.79769313e308;
            v21 = v18 == 1.79769313e308 && v17 == 1.79769313e308;
            x = 1.79769313e308;
            if (!v21)
              goto LABEL_21;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16, v16);
      v19 = *(double *)&v10;
      v18 = x;
    }
    while (v8);
  }
  else
  {
    v19 = y;
    v18 = CGPointZero.x;
  }
LABEL_21:
  v22 = -[THInteractiveCanvasController menuForHighlightAtLocation:](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "menuForHighlightAtLocation:", v18, v19);
  if (v22)
  {
    v23 = v22;
    v24 = a3;
    v25 = (const __CFString *)UIMenuStandardEdit;
  }
  else
  {
    v34 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.on.doc")), "copy:", CFSTR("C"), 0x80000, 0);
    objc_msgSend(a3, "insertSiblingMenu:afterMenuForIdentifier:", +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_43D7D8, 0, CFSTR("com.apple.iBooks.EditMenuGroup"), 17, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1)), UIMenuStandardEdit);
    v26 = +[_TtC8BookCore23BECustomViewMenuElement createHighlightMenuElementFor:annotationUUID:delegate:](_TtC8BookCore23BECustomViewMenuElement, "createHighlightMenuElementFor:annotationUUID:delegate:", 4, 0, self);
    v27 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Add Note"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("note.text")), "addNote:", CFSTR("N"), 0x80000, 0);
    v33[0] = v26;
    v33[1] = v27;
    objc_msgSend(a3, "insertSiblingMenu:afterMenuForIdentifier:", +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_43D7D8, 0, CFSTR("com.apple.iBooks.AnnotationMenuGroup"), 17, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2)), CFSTR("com.apple.iBooks.EditMenuGroup"));
    v28 = +[NSMutableArray array](NSMutableArray, "array");
    objc_msgSend(v28, "addObject:", +[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Look Up"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass.circle")), "showDictionary:", 0));
    objc_msgSend(v28, "addObject:", +[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Translate"), &stru_43D7D8, 0), +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("translate")), "translateSelection:", 0));
    objc_msgSend(v28, "addObject:", +[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Search"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.text.magnifyingglass")), "searchSelection:", 0));
    objc_msgSend(v28, "addObject:", +[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Share"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")), "shareSelection:", 0));
    v23 = +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_43D7D8, 0, CFSTR("com.apple.iBooks.OtherMenuGroup"), 17, v28);
    v24 = a3;
    v25 = CFSTR("com.apple.iBooks.AnnotationMenuGroup");
  }
  objc_msgSend(v24, "insertSiblingMenu:afterMenuForIdentifier:", v23, v25);
  objc_msgSend(a3, "removeMenuForIdentifier:", UIMenuStandardEdit);
}

- (void)shareSelection:(id)a3
{
  THInteractiveCanvasController *v4;
  uint64_t v5;
  double v6;
  id v7;

  v4 = -[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3);
  v5 = objc_opt_class(THWPEditingController);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(-[THInteractiveCanvasController editorController](v4, "editorController"), "textInputEditor")).n128_u64[0];
  objc_msgSend(v7, "shareSelection:", self, v6);
}

- (void)translateSelection:(id)a3
{
  THInteractiveCanvasController *v4;
  uint64_t v5;
  double v6;
  id v7;

  v4 = -[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3);
  v5 = objc_opt_class(THWPEditingController);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(-[THInteractiveCanvasController editorController](v4, "editorController"), "textInputEditor")).n128_u64[0];
  objc_msgSend(v7, "translateSelection:", self, v6);
}

- (void)createHighlightForSelectionWithCurrentThemeWithCompletion:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSCanvasViewController createHighlightForSelectionWithCurrentThemeWithCompletion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSCanvasViewController.m"), 683, CFSTR("THiOSCanvasViewController createHighlightForSelectionWithCurrentTheme not implemented"));
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)createHighlightForSelectionWithStyle:(int)a3
{
  uint64_t v3;
  THInteractiveCanvasController *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  v5 = -[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
  v6 = objc_opt_class(THWPEditingController);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, objc_msgSend(-[THInteractiveCanvasController editorController](v5, "editorController"), "textInputEditor")).n128_u64[0];
  v9 = v8;
  objc_msgSend(v8, "addHighlightWithStyle:forSender:", v3, self, v7);
  objc_msgSend(v9, "setSelection:", 0);
}

- (void)setStyleOfExistingHighlight:(id)a3 to:(int)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, *(_QWORD *)&a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSCanvasViewController setStyleOfExistingHighlight:to:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSCanvasViewController.m"), 700, CFSTR("THiOSCanvasViewController setStyleOfExistingHighlight:to: not implemented"));
}

- (id)p_activityItemsConfigurationWithSelectedAnnotation:(id)a3
{
  id v4;

  if (!a3)
    return 0;
  v4 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", +[AEAnnotationCatalystItemProvider itemProviderWithAnnotation:propertyProvider:](AEAnnotationCatalystItemProvider, "itemProviderWithAnnotation:propertyProvider:", a3, 0));
  return objc_msgSend(objc_alloc((Class)UIActivityItemsConfiguration), "initWithItemProviders:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
}

- (int64_t)p_styleForPresentation:(id)a3
{
  id v3;
  char *v4;

  v3 = a3;
  if (a3 || (v3 = -[THiOSCanvasViewController traitCollection](self, "traitCollection")) != 0)
  {
    v4 = (char *)objc_msgSend(v3, "horizontalSizeClass");
    if (objc_msgSend(v3, "verticalSizeClass") == (char *)&dword_0 + 1 || v4 == (_BYTE *)&dword_0 + 1)
      return 0;
    else
      return 7;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSCanvasViewController p_styleForPresentation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSCanvasViewController.m"), 778, CFSTR("invalid nil value for '%s'"), "traitCollection");
    return 0;
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -[THiOSCanvasViewController adaptivePresentationStyleForPresentationController:traitCollection:](self, "adaptivePresentationStyleForPresentationController:traitCollection:", a3, -[THiOSCanvasViewController traitCollection](self, "traitCollection"));
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  int64_t v6;
  id v7;

  v6 = -[THiOSCanvasViewController p_styleForPresentation:](self, "p_styleForPresentation:", a4);
  v7 = objc_msgSend(a3, "presentedViewController");
  if (v7 == -[THGlossaryPopoverViewController navigationController](-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController"), "navigationController"))objc_msgSend(-[THGlossaryPopoverViewController navigationController](-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController"), "navigationController"), "setNavigationBarHidden:", v6 == 7);
  return v6;
}

- (void)p_cleanupGlossaryPopover
{
  -[THiOSCanvasViewController setGlossaryPopoverViewController:](self, "setGlossaryPopoverViewController:", 0);
  -[THiOSCanvasViewController setGlossaryPopoverNavController:](self, "setGlossaryPopoverNavController:", 0);
  -[THiOSCanvasViewController setGlossaryHitInfo:](self, "setGlossaryHitInfo:", 0);
}

- (void)doneButtonPressed:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_121A68;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  -[THiOSCanvasViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  BCDDParsecCollectionViewController *v4;

  v4 = (BCDDParsecCollectionViewController *)objc_msgSend(a3, "presentedViewController");
  if (v4 == -[THGlossaryPopoverViewController navigationController](-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController"), "navigationController"))
  {
    -[THiOSCanvasViewController p_cleanupGlossaryPopover](self, "p_cleanupGlossaryPopover");
  }
  else if (v4 == -[THiOSCanvasViewController lookupController](self, "lookupController"))
  {
    -[THiOSCanvasViewController setLookupController:](self, "setLookupController:", 0);
  }
  else if (v4 == (BCDDParsecCollectionViewController *)-[THiOSCanvasViewController sharePopoverController](self, "sharePopoverController"))
  {
    -[THiOSCanvasViewController setSharePopoverController:](self, "setSharePopoverController:", 0);
  }
  else if (v4 == -[THiOSCanvasViewController translationController](self, "translationController"))
  {
    -[THiOSCanvasViewController setTranslationController:](self, "setTranslationController:", 0);
  }
}

- (id)newNavigationControllerForGlossaryView:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  UIColor *v9;
  UIColor *v10;
  id v11;
  id v12;
  id v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[4];

  if ((-[THiOSCanvasViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0)
    v5 = 0;
  else
    v5 = -[THiOSCanvasViewController im_isCompactHeight](self, "im_isCompactHeight") ^ 1;
  v6 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", a3);
  objc_msgSend(v6, "setNavigationBarHidden:", v5);
  objc_msgSend(v6, "setToolbarHidden:", 0);
  v7 = objc_msgSend(v6, "toolbar");
  objc_msgSend(v7, "setOpaque:", 0);
  objc_msgSend(v7, "setTranslucent:", 1);
  objc_msgSend(v7, "_setHidesShadow:", 1);
  v8 = objc_msgSend(a3, "themePage");
  v9 = (UIColor *)objc_msgSend(v8, "popoverBackgroundColor");
  v10 = (UIColor *)objc_msgSend(v8, "keyColor");
  v11 = objc_msgSend(v8, "dividerColor");
  v12 = objc_msgSend(objc_alloc((Class)BEHairlineDividerView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v12);
  v13 = objc_msgSend(v12, "heightAnchor");
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v23[0] = objc_msgSend(v13, "constraintEqualToConstant:", 1.0 / v14);
  v23[1] = objc_msgSend(objc_msgSend(v12, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "leadingAnchor"));
  v23[2] = objc_msgSend(objc_msgSend(v12, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "trailingAnchor"));
  v23[3] = objc_msgSend(objc_msgSend(v12, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "topAnchor"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  v15 = objc_msgSend(v8, "identifier");
  if (objc_msgSend(v15, "isEqualToString:", kIMThemeIdentifierBlissClassicTheme))
  {
    v9 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.97);
    v10 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  }
  objc_msgSend(v7, "setBackgroundColor:", v9);
  objc_msgSend(v7, "setBarTintColor:", v9);
  objc_msgSend(v7, "setTintColor:", v10);
  objc_msgSend(v12, "setBackgroundColor:", v11);
  objc_msgSend(v6, "setOverrideUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
  v16 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
  objc_msgSend(objc_msgSend(a3, "navigationItem"), "setRightBarButtonItem:animated:", v16, 0);

  v17 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Glossary Index"), &stru_43D7D8, 0), 0, a3, "showGlossaryIndex");
  v18 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Look Up"), &stru_43D7D8, 0), 0, a3, "showDictionaryEntry");
  v19 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v20 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  +[THGlossaryPopoverViewController toolbarButtonHInset](THGlossaryPopoverViewController, "toolbarButtonHInset");
  objc_msgSend(v20, "setWidth:");
  v22[0] = v20;
  v22[1] = v17;
  v22[2] = v19;
  v22[3] = v18;
  v22[4] = v20;
  objc_msgSend(a3, "setToolbarItems:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 5));

  return v6;
}

- (CGRect)p_glossaryTargetRect
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v3 = objc_opt_class(THWPRep);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, -[THInteractiveCanvasController repForInfo:](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", -[THiOSCanvasViewController glossaryHitInfo](self, "glossaryHitInfo"))).n128_u64[0];
  if (v4)
  {
    v6 = v4;
    v7 = -[THiOSCanvasViewController glossaryRangeInRep](self, "glossaryRangeInRep", v5);
    objc_msgSend(v6, "popoverPresentationRectForRange:", v7, v8);
    v10 = v9;
    v12 = v11;
    v13 = TSDAddPoints(objc_msgSend(v6, "frameInUnscaledCanvas"));
    objc_msgSend(objc_msgSend(v6, "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v13, v14, v10, v12);
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)presentGlossaryPopoverOfType:(int)a3 withTerm:(id)a4 rangeInRep:(_NSRange)a5 rep:(id)a6
{
  uint64_t v9;

  if (a6)
  {
    v9 = *(_QWORD *)&a3;
    -[THiOSCanvasViewController setGlossaryRangeInRep:](self, "setGlossaryRangeInRep:", a5.location, a5.length);
    -[THiOSCanvasViewController setGlossaryHitInfo:](self, "setGlossaryHitInfo:", objc_msgSend(a6, "info"));
    -[THiOSCanvasViewController p_glossaryTargetRect](self, "p_glossaryTargetRect");
    -[THiOSCanvasViewController p_presentGlossaryPopoverOfType:withTerm:targetRect:](self, "p_presentGlossaryPopoverOfType:withTerm:targetRect:", v9, a4);
  }
  else
  {
    -[THiOSCanvasViewController setGlossaryHitInfo:](self, "setGlossaryHitInfo:", 0, a4, a5.location, a5.length);
  }
}

- (void)replaceGlossaryPopoverWithDictionaryForTerm:(id)a3
{
  TSDInfo *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = -[THiOSCanvasViewController glossaryHitInfo](self, "glossaryHitInfo");
  if (a3)
  {
    if (v5)
    {
      -[THiOSCanvasViewController p_glossaryTargetRect](self, "p_glossaryTargetRect");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[THiOSCanvasViewController p_dismissGlossaryPopoverAnimated:cleanup:](self, "p_dismissGlossaryPopoverAnimated:cleanup:", 0, 0);
      -[THiOSCanvasViewController p_presentGlossaryPopoverOfType:withTerm:targetRect:](self, "p_presentGlossaryPopoverOfType:withTerm:targetRect:", 2, a3, v7, v9, v11, v13);
    }
  }
}

- (void)p_presentGlossaryPopoverOfType:(int)a3 withTerm:(id)a4 targetRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unsigned int v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  id v39;
  id v40;
  THGlossaryPopoverViewController *v41;
  _QWORD v42[5];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = objc_opt_class(THDocumentViewController);
  *(_QWORD *)&v13 = TSUDynamicCast(v12, -[THiOSCanvasViewController delegate](self, "delegate")).n128_u64[0];
  v15 = v14;
  v16 = objc_msgSend(v14, "view", v13);
  objc_msgSend(v16, "convertRect:fromView:", -[THiOSCanvasViewController view](self, "view"), x, y, width, height);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  if ((objc_msgSend(v15, "im_isCompactWidth") & 1) != 0)
    v25 = 1;
  else
    v25 = objc_msgSend(v15, "im_isCompactHeight");
  switch(a3)
  {
    case 3:
      v28 = objc_alloc_init((Class)LTUITranslationViewController);
      v29 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", a4);
      v40 = v29;
      if ((v25 & 1) == 0)
      {
        objc_msgSend(v28, "setModalPresentationStyle:", 7);
        v29 = v40;
      }
      objc_msgSend(v28, "setText:", v29, v40);
      objc_msgSend(v28, "setIsSourceEditable:", 0);
      objc_msgSend(v28, "setOverrideUserInterfaceStyle:", objc_msgSend(v15, "overrideUserInterfaceStyle"));
      v30 = objc_msgSend(v28, "popoverPresentationController");
      objc_msgSend(v30, "setSourceView:", v16);
      objc_msgSend(v30, "setSourceRect:", v18, v20, v22, v24);
      objc_msgSend(v30, "setPermittedArrowDirections:", 15);
      objc_msgSend(v30, "setDelegate:", self);
      objc_msgSend(v30, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v15);
      -[THiOSCanvasViewController bc_presentViewController:animated:tintColor:completion:](self, "bc_presentViewController:animated:tintColor:completion:", v28, 1, +[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"), 0);
      -[THiOSCanvasViewController setTranslationController:](self, "setTranslationController:", v28);

LABEL_19:
      return;
    case 2:
      v31 = objc_msgSend(objc_alloc((Class)BCDDParsecCollectionViewController), "initWithString:range:", a4, 0, objc_msgSend(a4, "length"));
      objc_msgSend(v31, "setOverrideUserInterfaceStyle:", objc_msgSend(v15, "overrideUserInterfaceStyle"));
      if ((v25 & 1) == 0)
        objc_msgSend(v31, "setModalPresentationStyle:", 7);
      v32 = objc_msgSend(v31, "popoverPresentationController");
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_12262C;
      v42[3] = &unk_427830;
      v42[4] = objc_msgSend(v31, "dismissCompletionHandler");
      objc_msgSend(v31, "setDismissCompletionHandler:", v42);
      objc_msgSend(v32, "setSourceView:", v16);
      objc_msgSend(v32, "setSourceRect:", v18, v20, v22, v24);
      objc_msgSend(v32, "setPermittedArrowDirections:", 15);
      objc_msgSend(v32, "setDelegate:", self);
      objc_msgSend(v32, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v15);
      -[THiOSCanvasViewController bc_presentViewController:animated:tintColor:completion:](self, "bc_presentViewController:animated:tintColor:completion:", v31, 1, +[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"), 0);
      -[THiOSCanvasViewController setLookupController:](self, "setLookupController:", v31);

      break;
    case 0:
      v26 = objc_msgSend(objc_msgSend(v15, "documentRoot"), "glossaryController");
      v27 = v26;
      if (v25)
      {
        objc_msgSend(objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "existingBookViewControllerForDocumentRoot:", -[THInteractiveCanvasController documentRoot](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot")), "showGlossaryEntry:", objc_msgSend(objc_msgSend(v26, "model"), "entryForTerm:", a4));
        return;
      }
      v33 = objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "existingBookViewControllerForDocumentRoot:", -[THInteractiveCanvasController documentRoot](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"));
      v41 = -[THGlossaryPopoverViewController initWithTerm:glossaryController:]([THGlossaryPopoverViewController alloc], "initWithTerm:glossaryController:", a4, v27);
      -[THGlossaryPopoverViewController setBookViewController:](v41, "setBookViewController:", v33);
      v34 = objc_opt_class(IMThemePage);
      *(_QWORD *)&v36 = TSUDynamicCast(v34, -[THiOSCanvasViewController im_theme](self, "im_theme")).n128_u64[0];
      if (v35)
        -[THGlossaryPopoverViewController setTheme:](v41, "setTheme:", v35, v36);
      -[THiOSCanvasViewController setGlossaryPopoverViewController:](self, "setGlossaryPopoverViewController:", v41, v36);

      self->_glossaryPopoverNavController = 0;
      self->_glossaryPopoverNavController = (UINavigationController *)-[THiOSCanvasViewController newNavigationControllerForGlossaryView:](self, "newNavigationControllerForGlossaryView:", v41);
      -[THGlossaryPopoverViewController preferredContentSize](v41, "preferredContentSize");
      -[UINavigationController setPreferredContentSize:](-[THiOSCanvasViewController glossaryPopoverNavController](self, "glossaryPopoverNavController"), "setPreferredContentSize:", v37, v38);
      -[THGlossaryPopoverViewController setGlossaryPresenting:](v41, "setGlossaryPresenting:", self);
      -[UINavigationController setModalPresentationStyle:](-[THiOSCanvasViewController glossaryPopoverNavController](self, "glossaryPopoverNavController"), "setModalPresentationStyle:", 7);
      v39 = -[UINavigationController popoverPresentationController](-[THiOSCanvasViewController glossaryPopoverNavController](self, "glossaryPopoverNavController"), "popoverPresentationController");
      objc_msgSend(v39, "setSourceView:", v16);
      objc_msgSend(v39, "setSourceRect:", v18, v20, v22, v24);
      objc_msgSend(v39, "setPermittedArrowDirections:", 3);
      objc_msgSend(v39, "setDelegate:", self);
      objc_msgSend(v39, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v41);
      -[THiOSCanvasViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", -[THiOSCanvasViewController glossaryPopoverNavController](self, "glossaryPopoverNavController"), 1, 0);
      goto LABEL_19;
  }
}

- (void)dismissGlossaryIfPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((-[THGlossaryPopoverViewController _isInPopoverPresentation](-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController"), "_isInPopoverPresentation") & 1) != 0|| (-[BCDDParsecCollectionViewController _isInPopoverPresentation](-[THiOSCanvasViewController lookupController](self, "lookupController"), "_isInPopoverPresentation") & 1) != 0|| -[LTUITranslationViewController _isInPopoverPresentation](-[THiOSCanvasViewController translationController](self, "translationController"), "_isInPopoverPresentation"))
  {
    -[THiOSCanvasViewController dismissGlossaryPopoverAnimated:](self, "dismissGlossaryPopoverAnimated:", v3);
  }
}

- (void)dismissGlossaryPopoverAnimated:(BOOL)a3
{
  -[THiOSCanvasViewController p_dismissGlossaryPopoverAnimated:cleanup:](self, "p_dismissGlossaryPopoverAnimated:cleanup:", a3, 1);
}

- (void)p_dismissGlossaryPopoverAnimated:(BOOL)a3 cleanup:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[THGlossaryPopoverViewController dismissViewControllerAnimated:completion:](-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController"), "dismissViewControllerAnimated:completion:", a3, 0);
  -[BCDDParsecCollectionViewController dismissViewControllerAnimated:completion:](-[THiOSCanvasViewController lookupController](self, "lookupController"), "dismissViewControllerAnimated:completion:", v5, 0);
  -[THiOSCanvasViewController setLookupController:](self, "setLookupController:", 0);
  -[LTUITranslationViewController dismissViewControllerAnimated:completion:](-[THiOSCanvasViewController translationController](self, "translationController"), "dismissViewControllerAnimated:completion:", v5, 0);
  -[THiOSCanvasViewController setTranslationController:](self, "setTranslationController:", 0);
  if (v4)
    -[THiOSCanvasViewController p_cleanupGlossaryPopover](self, "p_cleanupGlossaryPopover");
}

- (void)resetHighlightGestureRecognizers
{
  -[THHighlightGestureController setEnabled:](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "setEnabled:", 0);
  -[THHighlightGestureController setEnabled:](-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController"), "setEnabled:", 1);
}

- (void)repositionGlossaryIfPopoverAnimated:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  if (-[THiOSCanvasViewController glossaryHitInfo](self, "glossaryHitInfo", a3))
  {
    -[THiOSCanvasViewController p_glossaryTargetRect](self, "p_glossaryTargetRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = objc_opt_class(THDocumentViewController);
    *(_QWORD *)&v13 = TSUDynamicCast(v12, -[THiOSCanvasViewController delegate](self, "delegate")).n128_u64[0];
    objc_msgSend(objc_msgSend(v14, "view", v13), "convertRect:fromView:", -[THiOSCanvasViewController view](self, "view"), v5, v7, v9, v11);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    if ((-[THGlossaryPopoverViewController _isInPopoverPresentation](-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController"), "_isInPopoverPresentation") & 1) != 0)objc_msgSend(-[UINavigationController popoverPresentationController](-[THiOSCanvasViewController glossaryPopoverNavController](self, "glossaryPopoverNavController"), "popoverPresentationController"), "setSourceRect:", v16, v18, v20, v22);
    objc_msgSend(-[BCDDParsecCollectionViewController popoverPresentationController](-[THiOSCanvasViewController lookupController](self, "lookupController"), "popoverPresentationController"), "setSourceRect:", v16, v18, v20, v22);
    objc_msgSend(-[LTUITranslationViewController popoverPresentationController](-[THiOSCanvasViewController translationController](self, "translationController"), "popoverPresentationController"), "setSourceRect:", v16, v18, v20, v22);
  }
}

- (BOOL)isGlossaryPresented
{
  return -[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController") != 0;
}

- (void)presentSharePopoverWithItemProvider:(id)a3 targetRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = objc_opt_class(THDocumentViewController);
  TSUDynamicCast(v10, -[THiOSCanvasViewController delegate](self, "delegate"));
  v12 = v11;
  v15 = objc_msgSend(objc_alloc((Class)IMActivityController), "initWithActivityItems:applicationActivities:shareType:propertySource:tracker:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3), 0, objc_msgSend(a3, "shareType"), objc_msgSend(a3, "propertySource"), -[THiOSCanvasViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  objc_msgSend(v15, "setManagedBook:", objc_msgSend(objc_msgSend(objc_msgSend(-[THInteractiveCanvasController documentRoot](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "bookDescription"), "asset"), "isManagedBook"));
  v13 = objc_msgSend(v15, "viewController");
  objc_msgSend(v13, "setModalPresentationStyle:", 7);
  objc_msgSend(v13, "setOverrideUserInterfaceStyle:", objc_msgSend(v12, "overrideUserInterfaceStyle"));
  v14 = objc_msgSend(v13, "popoverPresentationController");
  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setPermittedArrowDirections:", 15);
  objc_msgSend(v14, "setSourceView:", -[THInteractiveCanvasController canvasView](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"));
  objc_msgSend(v14, "setSourceRect:", x, y, width, height);
  objc_msgSend(v14, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v12);
  -[THiOSCanvasViewController setSharePopoverController:](self, "setSharePopoverController:", v13);
  -[THiOSCanvasViewController bc_presentViewController:animated:tintColor:completion:](self, "bc_presentViewController:animated:tintColor:completion:", v13, 1, +[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"), 0);

}

- (void)dismissSharePopover
{
  UIViewController *v3;
  UIViewController *v4;

  v3 = -[THiOSCanvasViewController sharePopoverController](self, "sharePopoverController");
  if (v3)
  {
    v4 = v3;
    if (-[UIViewController _isInPopoverPresentation](v3, "_isInPopoverPresentation"))
    {
      -[UIViewController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 0, 0);
      -[THiOSCanvasViewController setSharePopoverController:](self, "setSharePopoverController:", 0);
    }
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v6;
  UIAlertController *v7;

  if (a4 == 3)
  {
    v6 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Error"), &stru_43D7D8, 0);
    v7 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Failed to send email"), &stru_43D7D8, 0), 1);
    -[UIAlertController addAction:](v7, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0), 1, 0));
    -[THiOSCanvasViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
  -[THiOSCanvasViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[THiOSTraitsCache updateTraitsWithCollection:](-[THiOSCanvasViewController traitsCache](self, "traitsCache", a3, a4), "updateTraitsWithCollection:", -[THiOSCanvasViewController traitCollection](self, "traitCollection"));
}

- (void)_resetInteractionTracking
{
  self->_haveDeterminedInitialModifiers = 0;
  self->_initialTextInteractionModifiers = 0;
}

- (void)_scheduleInteractionReset
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_resetInteractionTracking", 0);
  -[THiOSCanvasViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_resetInteractionTracking", 0, 0.25);
}

- (BOOL)_shouldBeginCustomHighlighterActionForTouchType:(int64_t)a3 modifierFlags:(int64_t)initialTextInteractionModifiers
{
  unint64_t v4;

  if (a3 == 3)
  {
    if (self->_haveDeterminedInitialModifiers)
    {
      initialTextInteractionModifiers = self->_initialTextInteractionModifiers;
    }
    else
    {
      self->_haveDeterminedInitialModifiers = 1;
      self->_initialTextInteractionModifiers = initialTextInteractionModifiers;
    }
    v4 = ((unint64_t)initialTextInteractionModifiers >> 20) & 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  -[THiOSCanvasViewController _scheduleInteractionReset](self, "_scheduleInteractionReset");
  return v4;
}

- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4
{
  -[THHighlightGestureController handleHighlightState:atPoint:](self->mHighlightGestureController, "handleHighlightState:atPoint:", a3, a4.x, a4.y);
}

- (id)_textInteractionBlockingRepClasses
{
  uint64_t v3;

  v3 = objc_opt_class(THWWebRep);
  return +[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (UITapGestureRecognizer)singleTFTapGestureRecognizer
{
  return self->mSingleTFTapGestureRecognizer;
}

- (void)setSingleTFTapGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (UITapGestureRecognizer)delayedTFTapGestureRecognizer
{
  return self->mDelayedTFTapGestureRecognizer;
}

- (void)setDelayedTFTapGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (THHighlightGestureController)highlightGestureController
{
  return self->mHighlightGestureController;
}

- (void)setHighlightGestureController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (THGlossaryPopoverViewController)glossaryPopoverViewController
{
  return self->mGlossaryPopoverViewController;
}

- (void)setGlossaryPopoverViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (BOOL)takeFirstResponderOnTap
{
  return self->mTakeFirstResponderOnTap;
}

- (void)setTakeFirstResponderOnTap:(BOOL)a3
{
  self->mTakeFirstResponderOnTap = a3;
}

- (TSDTrackingController)trackingController
{
  return self->_trackingController;
}

- (void)setTrackingController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (BCDDParsecCollectionViewController)lookupController
{
  return self->_lookupController;
}

- (void)setLookupController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (LTUITranslationViewController)translationController
{
  return self->_translationController;
}

- (void)setTranslationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (UIViewController)sharePopoverController
{
  return self->_sharePopoverController;
}

- (void)setSharePopoverController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (UINavigationController)glossaryPopoverNavController
{
  return self->_glossaryPopoverNavController;
}

- (void)setGlossaryPopoverNavController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (_NSRange)glossaryRangeInRep
{
  _NSRange *p_glossaryRangeInRep;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_glossaryRangeInRep = &self->_glossaryRangeInRep;
  location = self->_glossaryRangeInRep.location;
  length = p_glossaryRangeInRep->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setGlossaryRangeInRep:(_NSRange)a3
{
  self->_glossaryRangeInRep = a3;
}

- (TSDInfo)glossaryHitInfo
{
  return self->_glossaryHitInfo;
}

- (void)setGlossaryHitInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (THiOSTraitsCache)traitsCache
{
  return self->_traitsCache;
}

- (void)setTraitsCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (BOOL)haveDeterminedInitialModifiers
{
  return self->_haveDeterminedInitialModifiers;
}

- (void)setHaveDeterminedInitialModifiers:(BOOL)a3
{
  self->_haveDeterminedInitialModifiers = a3;
}

- (int64_t)initialTextInteractionModifiers
{
  return self->_initialTextInteractionModifiers;
}

- (void)setInitialTextInteractionModifiers:(int64_t)a3
{
  self->_initialTextInteractionModifiers = a3;
}

- (NSString)menuAnnotationUUID
{
  return self->_menuAnnotationUUID;
}

- (void)setMenuAnnotationUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (CGRect)rectForPresentedMenuForTextInteraction
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectForPresentedMenuForTextInteraction.origin.x;
  y = self->_rectForPresentedMenuForTextInteraction.origin.y;
  width = self->_rectForPresentedMenuForTextInteraction.size.width;
  height = self->_rectForPresentedMenuForTextInteraction.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRectForPresentedMenuForTextInteraction:(CGRect)a3
{
  self->_rectForPresentedMenuForTextInteraction = a3;
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

@end
