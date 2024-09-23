@implementation THWPopUpContentProvider

- (THWPopUpContentProvider)initWithPopUpInfo:(id)a3 scale:(double)a4 documentRoot:(id)a5 scrollableCanvasHost:(id)a6 bookNavigator:(id)a7 documentNavigator:(id)a8
{
  THWPopUpContentProvider *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)THWPopUpContentProvider;
  v14 = -[THWPopUpContentProvider init](&v16, "init");
  if (v14)
  {
    v14->_popupInfo = (TSWPopUpInfo *)a3;
    v14->_documentRoot = (TSKDocumentRoot *)a5;
    v14->_scrollableCanvasHost = (THWScrollableCanvasHosting *)a6;
    v14->_scale = a4;
    v14->_bookNavigator = (THBookNavigation *)a7;
    v14->_documentNavigator = (THDocumentNavigator *)a8;
    v14->_scrollableCanvasController = -[THWScrollableCanvasController initWithDocumentRoot:]([THWScrollableCanvasController alloc], "initWithDocumentRoot:", a5);
    -[THWScrollableCanvasController setDelegate:](-[THWPopUpContentProvider scrollableCanvasController](v14, "scrollableCanvasController"), "setDelegate:", v14);
    -[THWPopUpContentProvider p_updateWithSettings:](v14, "p_updateWithSettings:", -[TSWPopUpInfo frameViewSettings](-[THWPopUpContentProvider popupInfo](v14, "popupInfo"), "frameViewSettings"));
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPopUpContentProvider;
  -[THWPopUpContentProvider dealloc](&v3, "dealloc");
}

- (void)p_updateWithSettings:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  THWScrollableCanvasController *scrollableCanvasController;
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
  double v30;
  double v31;
  double v32;

  -[THWScrollableCanvasController createViewIfNeededWithFrame:viewScale:](self->_scrollableCanvasController, "createViewIfNeededWithFrame:viewScale:", a3, 0.0, 0.0, 100.0, 100.0, 1.0);
  -[TSKScrollView setMayPassScrollEventsToNextResponder:](-[THWScrollableCanvasController scrollView](self->_scrollableCanvasController, "scrollView"), "setMayPassScrollEventsToNextResponder:", 0);
  if (-[THWScrollableCanvasController mainView](self->_scrollableCanvasController, "mainView"))
  {
    objc_msgSend(-[TSWPopUpInfo frameViewSettings](-[THWPopUpContentProvider popupInfo](self, "popupInfo"), "frameViewSettings"), "frameViewSize");
    v5 = v4;
    v7 = v6;
    -[THWPopUpContentProvider scale](self, "scale");
    v9 = v5 * v8;
    v10 = -[THWPopUpContentProvider scale](self, "scale");
    v12 = TSDRectWithOriginAndSize(v10, CGPointZero.x, CGPointZero.y, v9, v7 * v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    scrollableCanvasController = self->_scrollableCanvasController;
    -[THWPopUpContentProvider scale](self, "scale");
    -[THWScrollableCanvasController setFrame:scale:](scrollableCanvasController, "setFrame:scale:", v12, v14, v16, v18, v20);
  }
  objc_msgSend(-[TSWPopUpInfo frameViewSettings](-[THWPopUpContentProvider popupInfo](self, "popupInfo"), "frameViewSettings"), "frameCanvasContentInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[UIView bounds](-[THWScrollableCanvasController mainView](self->_scrollableCanvasController, "mainView"), "bounds");
  -[TSKScrollView setFrame:](-[THWScrollableCanvasController scrollView](self->_scrollableCanvasController, "scrollView"), "setFrame:", v24 + v29, v22 + v30, v31 - (v24 + v28), v32 - (v22 + v26));
  -[TSKScrollView setScrollIndicatorInsets:](-[THWScrollableCanvasController scrollView](self->_scrollableCanvasController, "scrollView"), "setScrollIndicatorInsets:", 4.0, 0.0, 0.0, 2.0 - v28);
}

- (UIView)popoverContentView
{
  return -[THWScrollableCanvasController mainView](-[THWPopUpContentProvider scrollableCanvasController](self, "scrollableCanvasController"), "mainView");
}

- (TSWPopoverTheme)popoverTheme
{
  return (TSWPopoverTheme *)-[TSWPopUpInfo popoverTheme](-[THWPopUpContentProvider popupInfo](self, "popupInfo"), "popoverTheme");
}

- (void)teardown
{
  -[THWScrollableCanvasController teardownController](-[THWPopUpContentProvider scrollableCanvasController](self, "scrollableCanvasController"), "teardownController");
  -[THWScrollableCanvasController teardownView](-[THWPopUpContentProvider scrollableCanvasController](self, "scrollableCanvasController"), "teardownView");
  -[THWScrollableCanvasController setDelegate:](-[THWPopUpContentProvider scrollableCanvasController](self, "scrollableCanvasController"), "setDelegate:", 0);
}

- (void)displayModeDidChange:(int)a3
{
  -[THWScrollableCanvasController displayModeDidChange:](-[THWPopUpContentProvider scrollableCanvasController](self, "scrollableCanvasController"), "displayModeDidChange:", *(_QWORD *)&a3);
}

- (CGSize)unscaledContentSizeForFillScreen
{
  double v2;
  double v3;
  CGSize result;

  -[THWScrollableCanvasController unscaledContentSizeForFillScreen](-[THWPopUpContentProvider scrollableCanvasController](self, "scrollableCanvasController"), "unscaledContentSizeForFillScreen");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)disableCanvasInteraction
{
  -[THWScrollableCanvasController disableCanvasInteraction](-[THWPopUpContentProvider scrollableCanvasController](self, "scrollableCanvasController"), "disableCanvasInteraction");
}

- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(-[TSWPopUpInfo frameViewSettings](-[THWPopUpContentProvider popupInfo](self, "popupInfo", a3), "frameViewSettings"), "frameCanvasSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4
{
  return objc_msgSend(-[TSWPopUpInfo frameViewSettings](-[THWPopUpContentProvider popupInfo](self, "popupInfo", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "frameViewSettings"), "frameCanvasInfos");
}

- (UIEdgeInsets)p_scaledEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
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
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[THWPopUpContentProvider scale](self, "scale");
  v9 = top * v8;
  -[THWPopUpContentProvider scale](self, "scale");
  v11 = left * v10;
  -[THWPopUpContentProvider scale](self, "scale");
  v13 = bottom * v12;
  -[THWPopUpContentProvider scale](self, "scale");
  v15 = right * v14;
  v16 = v9;
  v17 = v11;
  v18 = v13;
  result.right = v15;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  objc_msgSend(-[TSWPopUpInfo frameViewSettings](-[THWPopUpContentProvider popupInfo](self, "popupInfo", a3), "frameViewSettings"), "frameCanvasContentInsets");
  -[THWPopUpContentProvider p_scaledEdgeInsets:](self, "p_scaledEdgeInsets:");
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)scrollableCanvasController:(id)a3 geometryProviderForLayout:(id)a4
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return 0;
}

- (THWScrollableCanvasHosting)scrollableCanvasHost
{
  return self->_scrollableCanvasHost;
}

- (id)strokeLayerForScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)maskLayerForScrollableCanvasController:(id)a3
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  id v5;

  v5 = objc_msgSend(a4, "gestureKind", a3);
  return v5 == (id)TSWPImmediateSingleTap;
}

- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 1;
}

- (BOOL)allowSelectionPopover
{
  return 1;
}

- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  void *v9;

  v9 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSWPInteractiveCanvasControllerDelegate, -[THWPopUpContentProvider scrollableCanvasHost](self, "scrollableCanvasHost", a3));
  return objc_msgSend(v9, "actionForHyperlink:inRep:gesture:", a4, a5, a6);
}

- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)bookNavigatorForScrollableCanvasController:(id)a3
{
  return self->_bookNavigator;
}

- (id)documentNavigatorForScrollableCanvasController:(id)a3
{
  return self->_documentNavigator;
}

- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3
{
  return 1;
}

- (UIEdgeInsets)scrollViewContentInsetForScrollableCanvasController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 4.0;
  v4 = 0.0;
  v5 = 4.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (THWScrollableCanvasController)scrollableCanvasController
{
  return self->_scrollableCanvasController;
}

- (TSWPopUpInfo)popupInfo
{
  return (TSWPopUpInfo *)objc_getProperty(self, a2, 16, 1);
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (double)scale
{
  return self->_scale;
}

- (THBookNavigation)bookNavigator
{
  return self->_bookNavigator;
}

- (THDocumentNavigator)documentNavigator
{
  return self->_documentNavigator;
}

@end
