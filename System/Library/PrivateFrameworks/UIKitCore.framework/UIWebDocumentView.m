@implementation UIWebDocumentView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (double)getTimestamp
{
  return (double)(unint64_t)GSCurrentEventTimestamp() / 1000000000.0;
}

+ (void)initialize
{
  void *v2;
  int v3;

  if ((id)objc_opt_class() == a1)
  {
    _UIApplicationLoadWebKit();
    +[UIWebPDFView setAsPDFDocRepAndView](UIWebPDFView, "setAsPDFDocRepAndView");
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WebKitSingleTapModeEnabled"));
    kSingleTapInteractionsEnabled = v3;
    if (v3)
      kSingleTapInteractionsHeuristic = objc_msgSend(v2, "integerForKey:", CFSTR("WebKitSingleTapModeHeuristic"));
  }
}

- (void)_restoreViewportSettingsWithSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  height = a3.height;
  width = a3.width;
  LODWORD(a3.width) = 1.0;
  -[UIWebDocumentView setInitialScale:forDocumentTypes:](self, "setInitialScale:forDocumentTypes:", 0xFFFFFFLL, a3.width);
  LODWORD(v6) = -1.0;
  -[UIWebDocumentView setInitialScale:forDocumentTypes:](self, "setInitialScale:forDocumentTypes:", 1, v6);
  LODWORD(v7) = -1.0;
  -[UIWebDocumentView setInitialScale:forDocumentTypes:](self, "setInitialScale:forDocumentTypes:", 2, v7);
  LODWORD(v8) = -1.0;
  -[UIWebDocumentView setInitialScale:forDocumentTypes:](self, "setInitialScale:forDocumentTypes:", 4, v8);
  LODWORD(v9) = 0.25;
  -[UIWebDocumentView setMinimumScale:forDocumentTypes:](self, "setMinimumScale:forDocumentTypes:", 0xFFFFFFLL, v9);
  LODWORD(v10) = 1.0;
  -[UIWebDocumentView setMinimumScale:forDocumentTypes:](self, "setMinimumScale:forDocumentTypes:", 8, v10);
  LODWORD(v11) = 1058642330;
  -[UIWebDocumentView setMinimumScale:forDocumentTypes:](self, "setMinimumScale:forDocumentTypes:", 16, v11);
  LODWORD(v12) = 1074580685;
  -[UIWebDocumentView setMaximumScale:forDocumentTypes:](self, "setMaximumScale:forDocumentTypes:", 0xFFFFFFLL, v12);
  LODWORD(v13) = 5.0;
  -[UIWebDocumentView setMaximumScale:forDocumentTypes:](self, "setMaximumScale:forDocumentTypes:", 1, v13);
  -[UIWebDocumentView setAllowsUserScaling:forDocumentTypes:](self, "setAllowsUserScaling:forDocumentTypes:", 1, 0xFFFFFFLL);
  -[UIWebDocumentView setAllowsShrinkToFit:forDocumentTypes:](self, "setAllowsShrinkToFit:forDocumentTypes:", 1, 16);
  -[UIWebDocumentView setAvoidsUnsafeArea:forDocumentTypes:](self, "setAvoidsUnsafeArea:forDocumentTypes:", 1, 0xFFFFFFLL);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 1, 320.0, -1.0);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 2, width, -1.0);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 4, 500.0, -1.0);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 8, -1.0, -1.0);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 16, width / 0.6, height / 0.6);
}

- (CGRect)webViewFrameForUIFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    objc_msgSend(-[UIView _screen](self, "_screen"), "_referenceBounds");
    width = v8;
    x = 0.0;
    y = 0.0;
    height = v8;
  }
  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)initSimpleHTMLDocumentWithStyle:(id)a3 frame:(CGRect)a4 preferences:(id)a5 groupName:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  UIWebDocumentView *v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  WebThreadLock();
  -[UIWebDocumentView webViewFrameForUIFrame:](self, "webViewFrameForUIFrame:", 0.0, 0.0, width, height);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD97A8]), "initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:", a3, a5, a6, v14, v15, v16, v17);
  v19 = -[UIWebDocumentView initWithWebView:frame:](self, "initWithWebView:frame:", v18, x, y, width, height);

  return v19;
}

- (UIWebDocumentView)initWithFrame:(CGRect)a3
{
  return -[UIWebDocumentView initWithWebView:frame:](self, "initWithWebView:frame:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIWebDocumentView)initWithWebView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char *v18;
  id v19;
  char v20;
  __int128 v21;
  _UIWebViewportHandler *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  objc_super v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  WebThreadLock();
  -[UIWebDocumentView webViewFrameForUIFrame:](self, "webViewFrameForUIFrame:", 0.0, 0.0, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v28.receiver = self;
  v28.super_class = (Class)UIWebDocumentView;
  v18 = -[UIWebTiledView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v18)
  {
    if (a3)
    {
      v19 = a3;
      *((_QWORD *)v18 + 55) = v19;
      objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);
      v20 = v18[964] & 0xDF;
    }
    else
    {
      *((_QWORD *)v18 + 55) = objc_msgSend(objc_alloc(MEMORY[0x1E0DD97A8]), "initWithFrame:", v11, v13, v15, v17);
      v20 = v18[964] | 0x20;
    }
    v18[964] = v20;
    objc_msgSend(*((id *)v18 + 55), "_setUIKitDelegate:", v18);
    objc_msgSend(*((id *)v18 + 55), "setEditingDelegate:", v18);
    objc_msgSend(*((id *)v18 + 52), "setContentView:", *((_QWORD *)v18 + 55));
    v21 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v18 + 1464) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v18 + 1480) = v21;
    v22 = objc_alloc_init(_UIWebViewportHandler);
    *((_QWORD *)v18 + 111) = v22;
    -[_UIWebViewportHandler setDelegate:](v22, "setDelegate:", v18);
    *((_DWORD *)v18 + 225) = 1065353216;
    v18[858] = 1;
    *((_QWORD *)v18 + 119) = 0;
    v18[857] = 1;
    v18[859] = 1;
    objc_msgSend(v18, "installGestureRecognizers");
    v23 = (void *)objc_msgSend(v18, "textInputTraits");
    objc_msgSend(v23, "setAutocapitalizationType:", 2);
    objc_msgSend(v23, "setAutocorrectionType:", 0);
    objc_msgSend(v23, "setSpellCheckingType:", 0);
    objc_msgSend(v23, "setKeyboardType:", 0);
    objc_msgSend(v23, "setSmartInsertDeleteType:", 0);
    objc_msgSend(v18, "setMultipleTouchEnabled:", 1);
    objc_msgSend(v18, "setMinimumSize:", width, height);
    objc_msgSend(v18, "_restoreViewportSettingsWithSize:", width, height);
    objc_msgSend(v18, "sendOrientationEventForOrientation:", objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0));
    v24 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v24, "addObserver:selector:name:object:", v18, sel_selectionChanged_, *MEMORY[0x1E0DD98A0], 0);
    objc_msgSend(v24, "addObserver:selector:name:object:", v18, sel__inspectorDidStartSearchingForNode_, *MEMORY[0x1E0DD97F0], objc_msgSend(*((id *)v18 + 55), "inspector"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v18, sel__inspectorDidStopSearchingForNode_, *MEMORY[0x1E0DD97F8], objc_msgSend(*((id *)v18 + 55), "inspector"));
    *((_QWORD *)v18 + 172) = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", v18);
    objc_msgSend(v18, "addInteraction:", objc_msgSend(v18, "dragInteraction"));
    *((_QWORD *)v18 + 173) = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", v18);
    objc_msgSend(v18, "addInteraction:", objc_msgSend(v18, "dropInteraction"));
    v30 = 0;
    v31 = &v30;
    v32 = 0x3052000000;
    v33 = __Block_byref_object_copy__242;
    v34 = __Block_byref_object_dispose__242;
    v25 = (objc_class *)qword_1ECD7A0E8;
    v35 = qword_1ECD7A0E8;
    if (!qword_1ECD7A0E8)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __getPKScribbleInteractionClass_block_invoke;
      v29[3] = &unk_1E16B14C0;
      v29[4] = &v30;
      __getPKScribbleInteractionClass_block_invoke((uint64_t)v29);
      v25 = (objc_class *)v31[5];
    }
    _Block_object_dispose(&v30, 8);
    v26 = objc_alloc_init(v25);
    *((_QWORD *)v18 + 144) = v26;
    objc_msgSend(v26, "setDelegate:", v18);
    objc_msgSend(*((id *)v18 + 144), "setElementSource:", v18);
    objc_msgSend(v18, "addInteraction:", *((_QWORD *)v18 + 144));
  }
  return (UIWebDocumentView *)v18;
}

- (void)_inspectorDidStartSearchingForNode:(id)a3
{
  *((_BYTE *)self + 965) |= 4u;
}

- (void)_inspectorDidStopSearchingForNode:(id)a3
{
  *((_BYTE *)self + 965) &= ~4u;
}

- (void)_removeDefinitionController:(BOOL)a3
{
  -[_UITextServiceSession dismissTextServiceAnimated:](self->_definitionSession, "dismissTextServiceAnimated:", a3);
}

- (void)_removeShareController:(BOOL)a3
{
  -[_UITextServiceSession dismissTextServiceAnimated:](self->_shareSession, "dismissTextServiceAnimated:", a3);
}

- (void)_removeShortcutController:(BOOL)a3
{
  -[_UITextServiceSession dismissTextServiceAnimated:](self->_learnSession, "dismissTextServiceAnimated:", a3);
}

- (BOOL)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->_delegate, "_webView:presentViewController:animated:completion:", self, a3, v6, a5);
  else
    return 0;
}

- (void)_dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "_webView:dismissViewControllerAnimated:completion:", self, v5, a4);
}

- (void)_setFont:(id)a3
{
  uint64_t v4;
  DOMCSSStyleDeclaration *v5;
  UITextRange *v6;

  v4 = objc_msgSend(a3, "markupDescription");
  v5 = -[DOMDocument createCSSStyleDeclaration](-[WebFrame DOMDocument](-[WebView mainFrame](self->_webView, "mainFrame"), "DOMDocument"), "createCSSStyleDeclaration");
  -[DOMCSSStyleDeclaration setCssText:](v5, "setCssText:", v4);
  v6 = -[UIWebDocumentView selectedTextRange](self, "selectedTextRange");
  -[UIWebDocumentView selectAll](self, "selectAll");
  -[WebView applyStyle:](self->_webView, "applyStyle:", v5);
  -[UIWebDocumentView setSelectedTextRange:](self, "setSelectedTextRange:", v6);
}

- (void)_setTextColor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  DOMCSSStyleDeclaration *v6;
  UITextRange *v7;

  v4 = objc_msgSend(a3, "styleString");
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color: %@"), v4);
  v6 = -[DOMDocument createCSSStyleDeclaration](-[WebFrame DOMDocument](-[WebView mainFrame](self->_webView, "mainFrame"), "DOMDocument"), "createCSSStyleDeclaration");
  -[DOMCSSStyleDeclaration setCssText:](v6, "setCssText:", v5);
  v7 = -[UIWebDocumentView selectedTextRange](self, "selectedTextRange");
  -[UIWebDocumentView selectAll](self, "selectAll");
  -[WebView applyStyle:](self->_webView, "applyStyle:", v6);
  -[UIWebDocumentView setSelectedTextRange:](self, "setSelectedTextRange:", v7);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __CFDictionary *plugInViews;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  UIWebFileUploadPanel *fileUploadPanel;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = *MEMORY[0x1E0DD97F0];
  v22[0] = *MEMORY[0x1E0DD98A0];
  v22[1] = v4;
  v5 = *MEMORY[0x1E0DD97B0];
  v22[2] = *MEMORY[0x1E0DD97F8];
  v22[3] = v5;
  v6 = *MEMORY[0x1E0CB33B0];
  v22[4] = *MEMORY[0x1E0CB33B8];
  v22[5] = v6;
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 6));
  if (self->_textPlaceholderRemovalObserver)
    objc_msgSend(v3, "removeObserver:");
  WebThreadLock();

  if ((*((_BYTE *)self + 964) & 0x40) != 0)
  {
    v7 = (void *)MEMORY[0x1E0DD97A8];
    v8 = -[UIWebDocumentView _groupName](self, "_groupName");
    objc_msgSend(v7, "_removeUserStyleSheetsFromGroup:world:", v8, objc_msgSend(MEMORY[0x1E0DD9790], "standardWorld"));
  }
  if (sDataDetectorsUIFrameworkLoaded == 1
    && -[UIWebDocumentView _dataDetectionIsActivated](self, "_dataDetectionIsActivated"))
  {
    objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController"), "frameWillBeRemoved:", -[WebView mainFrame](self->_webView, "mainFrame"));
  }
  -[WebView _clearDelegates](self->_webView, "_clearDelegates");
  -[WAKWindow close](self->super._wakWindow, "close");
  if ((*((_BYTE *)self + 964) & 0x20) != 0)
    -[WebView close](self->_webView, "close");

  -[_UIWebViewportHandler setDelegate:](self->_viewportHandler, "setDelegate:", 0);
  -[UIWebDocumentView cancelInteractionWithImmediateDisplay:](self, "cancelInteractionWithImmediateDisplay:", 1);
  -[UIWebDocumentView _cleanupSheet](self, "_cleanupSheet");
  -[UIAutoscroll invalidate](self->_autoscroll, "invalidate");

  -[UIWebDocumentView _unregisterPreview](self, "_unregisterPreview");
  -[UIWebDocumentView _clearPreviewRevealInformation](self, "_clearPreviewRevealInformation");
  plugInViews = self->_plugInViews;
  if (plugInViews)
  {
    v10 = (void *)-[__CFDictionary allValues](plugInViews, "allValues");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "setWebView:", 0);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
    CFRelease(self->_plugInViews);
    self->_plugInViews = 0;
  }

  -[CALayer removeFromSuperlayer](self->_contentLayersHostingLayer, "removeFromSuperlayer");
  fileUploadPanel = self->_fileUploadPanel;
  if (fileUploadPanel)
  {
    -[UIWebFileUploadPanel setDelegate:](fileUploadPanel, "setDelegate:", 0);
    -[UIWebFileUploadPanel dismiss](self->_fileUploadPanel, "dismiss");

  }
  -[UIWebDocumentView _removeDefinitionController:](self, "_removeDefinitionController:", 0);
  -[UIWebDocumentView _removeShareController:](self, "_removeShareController:", 0);
  -[UIWebPlaybackTargetPicker setDelegate:](self->_playbackTargetPicker, "setDelegate:", 0);

  v16.receiver = self;
  v16.super_class = (Class)UIWebDocumentView;
  -[UIWebTiledView dealloc](&v16, sel_dealloc);
}

- (BOOL)didFirstVisuallyNonEmptyLayout
{
  return (*((unsigned __int8 *)self + 963) >> 6) & 1;
}

- (BOOL)hasDrawnTiles
{
  return *((unsigned __int8 *)self + 964) >> 7;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  if (a3)
    -[UIWebDocumentView _registerPreview](self, "_registerPreview");
  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentView;
  -[UIWebTiledView willMoveToWindow:](&v5, sel_willMoveToWindow_, a3);
}

- (void)willMoveToSuperview:(id)a3
{
  -[UITextInteractionAssistant detach](self->_textSelectionAssistant, "detach", a3);
}

- (void)stopLoading:(id)a3
{
  -[UIWebDocumentView completeInteraction](self, "completeInteraction");
  -[WebView stopLoading:](self->_webView, "stopLoading:", a3);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)_runLoadBlock:(id)a3
{
  if ((*((_BYTE *)self + 963) & 1) != 0)
  {
    WebThreadLock();
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    WebThreadRun();
  }
}

- (void)_cleanUpFrameStateAndLoad:(id)a3
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__UIWebDocumentView__cleanUpFrameStateAndLoad___block_invoke;
  v5[3] = &unk_1E16B41B8;
  v5[4] = self;
  -[UIWebDocumentView _runLoadBlock:](self, "_runLoadBlock:", v5);
  -[UIWebDocumentView _runLoadBlock:](self, "_runLoadBlock:", a3);
}

uint64_t __47__UIWebDocumentView__cleanUpFrameStateAndLoad___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "mainFrame");
  result = objc_msgSend(*(id *)(a1 + 32), "_dataDetectionIsActivated");
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController"), "cancelURLificationForFrame:", v2);
  return result;
}

- (void)loadRequest:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__UIWebDocumentView_loadRequest___block_invoke;
  v3[3] = &unk_1E16C3CF0;
  v3[4] = self;
  v3[5] = a3;
  -[UIWebDocumentView _cleanUpFrameStateAndLoad:](self, "_cleanUpFrameStateAndLoad:", v3);
}

uint64_t __33__UIWebDocumentView_loadRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "mainFrame"), "loadRequest:", *(_QWORD *)(a1 + 40));
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__UIWebDocumentView_loadHTMLString_baseURL___block_invoke;
  v4[3] = &unk_1E16C3D18;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[UIWebDocumentView _cleanUpFrameStateAndLoad:](self, "_cleanUpFrameStateAndLoad:", v4);
}

uint64_t __44__UIWebDocumentView_loadHTMLString_baseURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 440), "mainFrame"), "loadHTMLString:baseURL:", a1[5], a1[6]);
}

- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6
{
  _QWORD v6[9];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__UIWebDocumentView_loadData_MIMEType_textEncodingName_baseURL___block_invoke;
  v6[3] = &unk_1E16ECB20;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  v6[8] = a6;
  -[UIWebDocumentView _cleanUpFrameStateAndLoad:](self, "_cleanUpFrameStateAndLoad:", v6);
}

uint64_t __64__UIWebDocumentView_loadData_MIMEType_textEncodingName_baseURL___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 440), "mainFrame"), "loadData:MIMEType:textEncodingName:baseURL:", a1[5], a1[6], a1[7], a1[8]);
}

- (void)setLoadsSynchronously:(BOOL)a3
{
  if (((((*((_BYTE *)self + 963) & 1) == 0) ^ a3) & 1) == 0)
  {
    WebThreadLock();
    *((_BYTE *)self + 963) = *((_BYTE *)self + 963) & 0xFE | a3;
    -[WebFrame _setLoadsSynchronously:](-[WebView mainFrame](self->_webView, "mainFrame"), "_setLoadsSynchronously:", *((_BYTE *)self + 963) & 1);
  }
}

- (BOOL)loadsSynchronously
{
  return *((_BYTE *)self + 963) & 1;
}

- (id)webView
{
  return self->_webView;
}

- (id)_groupName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%p"), _UIMainBundleIdentifier(), self);
}

- (id)_focusedOrMainFrame
{
  id m_parentTextView;
  WebView *webView;
  id result;

  m_parentTextView = self->m_parentTextView;
  webView = self->_webView;
  if (m_parentTextView)
    return -[WebView mainFrame](webView, "mainFrame");
  result = -[WebView selectedFrame](webView, "selectedFrame");
  if (!result)
  {
    webView = self->_webView;
    return -[WebView mainFrame](webView, "mainFrame");
  }
  return result;
}

- (void)setUserStyleSheet:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  WebThreadLock();
  v5 = -[UIWebDocumentView _groupName](self, "_groupName");
  if (!-[NSString isEqualToString:](-[WebView groupName](self->_webView, "groupName"), "isEqualToString:", v5))
    -[WebView setGroupName:](self->_webView, "setGroupName:", v5);
  v6 = objc_msgSend(MEMORY[0x1E0DD9790], "standardWorld");
  objc_msgSend(MEMORY[0x1E0DD97A8], "_removeUserStyleSheetsFromGroup:world:", v5, v6);
  LODWORD(v7) = 0;
  objc_msgSend(MEMORY[0x1E0DD97A8], "_addUserStyleSheetToGroup:world:source:url:includeMatchPatternStrings:excludeMatchPatternStrings:injectedFrames:", v5, v6, a3, 0, 0, 0, v7);
  *((_BYTE *)self + 964) |= 0x40u;
}

- (void)setDetectsPhoneNumbers:(BOOL)a3
{
  -[UIWebDocumentView setDataDetectorTypes:](self, "setDataDetectorTypes:", a3);
}

- (BOOL)detectsPhoneNumbers
{
  return (self->_dataDetectorTypes & 0xFFFFFFFF80000001) != 0;
}

- (BOOL)_dataDetectionIsActivated
{
  unint64_t dataDetectorTypes;
  BOOL v3;

  dataDetectorTypes = self->_dataDetectorTypes;
  if (dataDetectorTypes)
    v3 = dataDetectorTypes == 0xFFFFFFFF80000000;
  else
    v3 = 1;
  return !v3;
}

- (unint64_t)effectiveDataDetectorTypes
{
  if (self->_dataDetectorTypes == -1)
    return 511;
  else
    return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  _BOOL4 v5;

  if (self->_dataDetectorTypes != a3)
  {
    v5 = -[UIWebDocumentView _dataDetectionIsActivated](self, "_dataDetectionIsActivated");
    self->_dataDetectorTypes = a3;
    WebThreadLock();
    -[WebView _setWantsTelephoneNumberParsing:](self->_webView, "_setWantsTelephoneNumberParsing:", self->_dataDetectorTypes == 0xFFFFFFFF80000000);
    if (v5)
      objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController"), "frameWillBeRemoved:", -[WebView mainFrame](self->_webView, "mainFrame"));
  }
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v8 = v14.origin.x;
  v9 = v14.origin.y;
  v10 = v14.size.width;
  v11 = v14.size.height;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (!CGRectEqualToRect(v14, v15))
  {
    v13.receiver = self;
    v13.super_class = (Class)UIWebDocumentView;
    -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
    -[UIWebDocumentView _updateWebKitExposedScrollViewRect](self, "_updateWebKitExposedScrollViewRect");
    v12.receiver = self;
    v12.super_class = (Class)UIWebDocumentView;
    -[UIWebTiledView setNeedsLayout](&v12, sel_setNeedsLayout);
    -[UIWebDocumentView _notifyContentHostingLayersOfScaleChange](self, "_notifyContentHostingLayersOfScaleChange");
    if (v10 != width || v11 != height)
    {
      WebThreadLock();
      -[WAKWindow setContentRect:](self->super._wakWindow, "setContentRect:", 0.0, 0.0, width, height);
      -[WebView setFrameSize:](self->_webView, "setFrameSize:", width, height);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(self->_delegate, "view:didSetFrame:oldFrame:asResultOfZoom:", self, (*((unsigned __int8 *)self + 962) >> 6) & 1, x, y, width, height, v8, v9, v10, v11);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(self->_delegate, "view:didSetFrame:oldFrame:", self, x, y, width, height, v8, v9, v10, v11);
    }
  }
}

- (void)_setDocumentScale:(float)a3
{
  id v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  float v12;
  CALayer *contentLayersHostingLayer;
  NSView *v14;
  double v15;
  double v16;
  BOOL IsEmpty;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CATransform3D v22;
  CATransform3D v23;

  v5 = -[UIView _scroller](self, "_scroller");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "contentOffset");
    v23.m11 = v7;
    v23.m12 = v8;
    -[_UIWebViewportHandler integralScaleForScale:keepingPointFixed:](self->_viewportHandler, "integralScaleForScale:keepingPointFixed:", &v23, a3);
    v10 = v9;
    objc_msgSend(v6, "setContentOffset:", v23.m11, v23.m12);
  }
  else
  {
    -[_UIWebViewportHandler integralScaleForScale:keepingPointFixed:](self->_viewportHandler, "integralScaleForScale:keepingPointFixed:", 0, a3);
    v10 = v11;
  }
  v12 = v10;
  if (self->_documentScale != v12)
  {
    self->_documentScale = v12;
    memset(&v23, 0, sizeof(v23));
    CATransform3DMakeScale(&v23, v12, v12, 1.0);
    contentLayersHostingLayer = self->_contentLayersHostingLayer;
    v22 = v23;
    -[CALayer setTransform:](contentLayersHostingLayer, "setTransform:", &v22);
    WebThreadLock();
    v14 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView");
    *(float *)&v15 = self->_documentScale;
    -[NSView setScale:](v14, "setScale:", v15);
    *(float *)&v16 = self->_documentScale;
    -[WAKWindow setCurrentTileScale:](self->super._wakWindow, "setCurrentTileScale:", v16);
    IsEmpty = CGRectIsEmpty(self->_mainDocumentDoubleTapRect);
    if (v14)
    {
      if (!IsEmpty)
      {
        -[NSView convertRect:toView:](v14, "convertRect:toView:", 0, self->_mainDocumentDoubleTapRect.origin.x, self->_mainDocumentDoubleTapRect.origin.y, self->_mainDocumentDoubleTapRect.size.width, self->_mainDocumentDoubleTapRect.size.height);
        self->_doubleTapRect.origin.x = v18;
        self->_doubleTapRect.origin.y = v19;
        self->_doubleTapRect.size.width = v20;
        self->_doubleTapRect.size.height = v21;
      }
    }
    -[UIWebDocumentView _notifyPlugInViewsOfScaleChange](self, "_notifyPlugInViewsOfScaleChange");
    -[UIWebDocumentView _updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange](self, "_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange");
    -[UIWebDocumentView _notifyContentHostingLayersOfScaleChange](self, "_notifyContentHostingLayersOfScaleChange");
  }
}

- (float)_documentScale
{
  return self->_documentScale;
}

- (float)minimumScaleForMinimumSize:(CGSize)a3
{
  float result;

  -[_UIWebViewportHandler minimumScaleForViewSize:](self->_viewportHandler, "minimumScaleForViewSize:", a3.width, a3.height);
  return result;
}

- (float)initialScale
{
  float result;

  -[_UIWebViewportHandler initialScale](self->_viewportHandler, "initialScale");
  return result;
}

- (float)maximumScale
{
  float result;

  -[_UIWebViewportHandler maximumScale](self->_viewportHandler, "maximumScale");
  return result;
}

- (float)minimumScale
{
  float result;

  -[_UIWebViewportHandler minimumScale](self->_viewportHandler, "minimumScale");
  return result;
}

- (double)_zoomedDocumentScale
{
  double documentScale;
  id v3;
  double v4;

  documentScale = self->_documentScale;
  v3 = -[UIView _scroller](self, "_scroller");
  if (v3)
  {
    objc_msgSend(v3, "zoomScale");
    return v4 * documentScale;
  }
  return documentScale;
}

- (void)_updateScrollViewBoundaryZoomScales
{
  id v3;
  float v4;
  double v5;
  float v6;
  double v7;

  if ((*((_BYTE *)self + 961) & 4) != 0 && self->_documentScale > 0.0)
  {
    v3 = -[UIView _scroller](self, "_scroller");
    -[_UIWebViewportHandler minimumScale](self->_viewportHandler, "minimumScale");
    v5 = (float)(v4 / self->_documentScale);
    -[_UIWebViewportHandler maximumScale](self->_viewportHandler, "maximumScale");
    v7 = (float)(v6 / self->_documentScale);
    objc_msgSend(v3, "setMinimumZoomScale:", v5);
    objc_msgSend(v3, "setMaximumZoomScale:", v7);
    objc_msgSend(v3, "setZoomEnabled:", -[_UIWebViewportHandler allowsUserScaling](self->_viewportHandler, "allowsUserScaling"));
  }
}

- (void)viewportHandlerDidChangeScales:(id)a3
{
  WebHistoryItem *v5;
  float v6;
  float v7;
  double v8;
  float documentScale;
  float v10;
  double v11;
  float v12;
  float v13;

  -[UIWebDocumentView _updateScrollViewBoundaryZoomScales](self, "_updateScrollViewBoundaryZoomScales");
  if ((*((_BYTE *)self + 961) & 8) != 0)
  {
    if ((*((_BYTE *)self + 961) & 2) != 0)
    {
      documentScale = self->_documentScale;
      objc_msgSend(a3, "minimumScale");
      if (documentScale < v10)
        documentScale = v10;
      objc_msgSend(a3, "maximumScale");
      if (documentScale < *(float *)&v11)
        *(float *)&v11 = documentScale;
      -[UIWebDocumentView _setDocumentScale:](self, "_setDocumentScale:", v11);
    }
  }
  else
  {
    WebThreadLock();
    v5 = -[WebBackForwardList currentItem](-[WebView backForwardList](self->_webView, "backForwardList"), "currentItem");
    -[WebHistoryItem _scale](v5, "_scale");
    if (v6 <= 0.0 || (v7 = v6, (-[WebHistoryItem _scaleIsInitial](v5, "_scaleIsInitial") & 1) != 0))
    {
      objc_msgSend(a3, "initialScale");
    }
    else
    {
      objc_msgSend(a3, "minimumScale");
      if (v7 < v12)
        v7 = v12;
      objc_msgSend(a3, "maximumScale");
      if (v7 < *(float *)&v8)
        *(float *)&v8 = v7;
    }
    -[UIWebDocumentView _setDocumentScale:](self, "_setDocumentScale:", v8);
    -[UIWebDocumentView _updateScrollViewBoundaryZoomScales](self, "_updateScrollViewBoundaryZoomScales");
  }
  -[_UIWebViewportHandler minimumScale](self->_viewportHandler, "minimumScale");
  if (v13 > 0.0)
    -[WAKWindow setZoomedOutTileScale:](self->super._wakWindow, "setZoomedOutTileScale:");
}

- (void)viewportHandler:(id)a3 didChangeViewportSize:(CGSize)a4
{
  double height;
  double width;
  WebFrame *v8;
  NSView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if ((*((_BYTE *)self + 960) & 0x10) != 0)
  {
    height = a4.height;
    width = a4.width;
    WebThreadLock();
    v8 = -[WebView mainFrame](self->_webView, "mainFrame");
    v9 = -[WebFrameView documentView](-[WebFrame frameView](v8, "frameView"), "documentView");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WebView _fixedLayoutSize](self->_webView, "_fixedLayoutSize");
      v11 = v10;
      -[WebView _setFixedLayoutSize:](self->_webView, "_setFixedLayoutSize:", width, height);
      if ((*((_BYTE *)self + 961) & 0x20) == 0)
      {
        if (width != v11)
          -[WebFrame resetTextAutosizingBeforeLayout](v8, "resetTextAutosizingBeforeLayout");
        -[UIWebDocumentView _updateFixedPositionedObjectsLayoutRectUsingWebThread:synchronize:](self, "_updateFixedPositionedObjectsLayoutRectUsingWebThread:synchronize:", 0, 1);
      }
      -[NSView setNeedsLayout:](v9, "setNeedsLayout:", 1);
      -[NSView layout](v9, "layout");
    }
    else
    {
      -[UIView frame](self, "frame");
      v13 = v12;
      v15 = v14;
      objc_msgSend(a3, "availableViewSize");
      -[UIWebDocumentView setFrame:](self, "setFrame:", v13, v15, v16, v17);
    }
  }
}

- (void)viewportHandler:(id)a3 didChangeAvoidsUnsafeArea:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "_webView:didChangeAvoidsUnsafeArea:", self, v4);
}

- (CGPoint)convertPoint:(CGPoint)a3 toFrame:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend((id)objc_msgSend(a4, "documentView"), "convertPoint:fromView:", 0, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromFrame:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend((id)objc_msgSend(a4, "documentView"), "convertPoint:toView:", 0, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toFrame:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a4, "documentView"), "convertRect:fromView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromFrame:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a4, "documentView"), "convertRect:toView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_setDocumentType:(int)a3 overrideCustomConfigurations:(BOOL)a4 viewportArguments:(id)a5
{
  _UIWebViewportHandler *viewportHandler;
  _QWORD v6[6];
  int v7;
  BOOL v8;

  viewportHandler = self->_viewportHandler;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__UIWebDocumentView__setDocumentType_overrideCustomConfigurations_viewportArguments___block_invoke;
  v6[3] = &unk_1E16ECB48;
  v7 = a3;
  v8 = a4;
  v6[4] = self;
  v6[5] = a5;
  -[_UIWebViewportHandler update:](viewportHandler, "update:", v6);
}

uint64_t __85__UIWebDocumentView__setDocumentType_overrideCustomConfigurations_viewportArguments___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 *v5;
  void *v6;
  __int128 *v7;
  void *v8;
  __int16 v9;
  __int128 v11;
  __int128 v12;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 896) = *(_DWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = v2 + 1160;
  v4 = *(unsigned int *)(v2 + 896);
  v5 = (__int128 *)(v2 + 1160 + 32 * v4);
  if (!*(_BYTE *)(a1 + 52))
  {
    v11 = 0u;
    v12 = 0u;
    v8 = *(void **)(v2 + 888);
    if (v8)
    {
      objc_msgSend(v8, "rawViewConfiguration", v11, v12);
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 888);
    }
    v9 = objc_msgSend(v8, "webkitDefinedConfigurationFlags", (_QWORD)v11);
    if ((v9 & 2) != 0)
    {
      if ((v9 & 4) != 0)
        goto LABEL_7;
    }
    else
    {
      LODWORD(v12) = *(_DWORD *)(v3 + 32 * v4 + 16);
      if ((v9 & 4) != 0)
      {
LABEL_7:
        if ((v9 & 8) != 0)
          goto LABEL_8;
        goto LABEL_18;
      }
    }
    DWORD1(v12) = *(_DWORD *)(v3 + 32 * v4 + 20);
    if ((v9 & 8) != 0)
    {
LABEL_8:
      if ((v9 & 0x10) != 0)
        goto LABEL_9;
      goto LABEL_19;
    }
LABEL_18:
    DWORD2(v12) = *(_DWORD *)(v3 + 32 * v4 + 24);
    if ((v9 & 0x10) != 0)
    {
LABEL_9:
      if ((v9 & 0x20) != 0)
        goto LABEL_10;
      goto LABEL_20;
    }
LABEL_19:
    *(_QWORD *)&v11 = *(_QWORD *)v5;
    if ((v9 & 0x20) != 0)
    {
LABEL_10:
      if ((v9 & 0x40) != 0)
        goto LABEL_11;
      goto LABEL_21;
    }
LABEL_20:
    *((_QWORD *)&v11 + 1) = *((_QWORD *)v5 + 1);
    if ((v9 & 0x40) != 0)
    {
LABEL_11:
      if ((v9 & 0x80) != 0)
        goto LABEL_12;
      goto LABEL_22;
    }
LABEL_21:
    BYTE12(v12) = *(_BYTE *)(v3 + 32 * v4 + 28);
    if ((v9 & 0x80) != 0)
    {
LABEL_12:
      if ((v9 & 0x100) != 0)
      {
LABEL_14:
        v6 = *(void **)(*(_QWORD *)(a1 + 32) + 888);
        v7 = &v11;
        goto LABEL_15;
      }
LABEL_13:
      BYTE14(v12) = *(_BYTE *)(v3 + 32 * v4 + 30);
      goto LABEL_14;
    }
LABEL_22:
    BYTE13(v12) = *(_BYTE *)(v3 + 32 * v4 + 29);
    if ((v9 & 0x100) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(v2 + 888), "clearWebKitViewportConfigurationFlags");
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 888);
  v7 = v5;
LABEL_15:
  objc_msgSend(v6, "resetViewportConfiguration:", v7, v11, v12);
  return objc_msgSend(*(id *)(a1 + 32), "_applyViewportArguments:", *(_QWORD *)(a1 + 40));
}

- (void)_setDocumentType:(int)a3
{
  -[UIWebDocumentView _setDocumentType:overrideCustomConfigurations:viewportArguments:](self, "_setDocumentType:overrideCustomConfigurations:viewportArguments:", *(_QWORD *)&a3, 1, 0);
}

- (void)setSizeUpdatesSuspended:(BOOL)a3
{
  char v3;
  char v5;

  v3 = *((_BYTE *)self + 964);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 2;
    else
      v5 = 0;
    *((_BYTE *)self + 964) = v3 & 0xFD | v5;
    if (!a3 && (*((_BYTE *)self + 964) & 4) != 0)
      -[UIWebDocumentView _updateSize](self, "_updateSize");
    *((_BYTE *)self + 964) &= ~4u;
  }
}

- (BOOL)sizeUpdatesSuspended
{
  return (*((unsigned __int8 *)self + 964) >> 1) & 1;
}

- (void)_updateSize
{
  NSView *v3;
  NSView *v4;
  _UIWebViewportHandler *viewportHandler;
  _UIWebViewportHandler *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  float documentScale;
  _UIWebViewportHandler *v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _UIWebViewportHandler *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  double v36;
  float v37;
  float v38;
  double v39;
  double v40;
  id v41;
  _QWORD v42[6];
  _QWORD v43[9];
  _QWORD v44[5];
  _QWORD v45[5];
  CGRect v46;
  CGRect v47;

  if ((*((char *)self + 960) & 0x80000000) == 0)
  {
    if ((*((_BYTE *)self + 964) & 2) != 0)
    {
      *((_BYTE *)self + 964) |= 4u;
    }
    else
    {
      WebThreadLock();
      *((_BYTE *)self + 960) |= 0x80u;
      v3 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView");
      if (v3)
      {
        v4 = v3;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          viewportHandler = self->_viewportHandler;
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __32__UIWebDocumentView__updateSize__block_invoke_2;
          v44[3] = &unk_1E16B41B8;
          v44[4] = self;
          -[_UIWebViewportHandler update:](viewportHandler, "update:", v44);
          -[UIView frame](self, "frame");
          -[UIWebDocumentView setFrame:](self, "setFrame:");
        }
        else
        {
          if ((*((_BYTE *)self + 960) & 0x20) != 0)
          {
            -[_UIWebViewportHandler viewportWidth](self->_viewportHandler, "viewportWidth");
            v11 = v12;
            -[_UIWebViewportHandler viewportHeight](self->_viewportHandler, "viewportHeight");
            v9 = v13;
            v7 = 0;
            v8 = 0;
          }
          else
          {
            -[NSView bounds](v4, "bounds");
            v11 = v10;
          }
          documentScale = self->_documentScale;
          v15 = self->_viewportHandler;
          v16 = MEMORY[0x1E0C809B0];
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __32__UIWebDocumentView__updateSize__block_invoke_3;
          v43[3] = &unk_1E16CB380;
          v43[4] = self;
          v43[5] = v7;
          v43[6] = v8;
          *(double *)&v43[7] = v11;
          *(double *)&v43[8] = v9;
          -[_UIWebViewportHandler update:](v15, "update:", v43);
          if ((*((_BYTE *)self + 960) & 0x20) == 0)
          {
            -[_UIWebViewportHandler documentBounds](self->_viewportHandler, "documentBounds");
            v18 = v17;
            v20 = v19;
            v22 = v21;
            v24 = v23;
            -[NSView bounds](v4, "bounds");
            v47.origin.x = v25;
            v47.origin.y = v26;
            v47.size.width = v27;
            v47.size.height = v28;
            v46.origin.x = v18;
            v46.origin.y = v20;
            v46.size.width = v22;
            v46.size.height = v24;
            if (!CGRectEqualToRect(v46, v47))
            {
              v29 = self->_viewportHandler;
              v42[0] = v16;
              v42[1] = 3221225472;
              v42[2] = __32__UIWebDocumentView__updateSize__block_invoke_4;
              v42[3] = &unk_1E16C3CF0;
              v42[4] = v4;
              v42[5] = self;
              -[_UIWebViewportHandler update:](v29, "update:", v42);
            }
          }
          -[NSView bounds](v4, "bounds");
          -[NSView convertRect:toView:](v4, "convertRect:toView:", 0);
          v31 = v30;
          v33 = v32;
          -[_UIWebViewportHandler viewportWidth](self->_viewportHandler, "viewportWidth");
          v35 = (float)(v34 * self->_documentScale);
          if (v31 > v35)
            v35 = v31;
          v36 = round(v35);
          -[_UIWebViewportHandler viewportHeight](self->_viewportHandler, "viewportHeight");
          v37 = self->_documentScale;
          v39 = (float)(v38 * v37);
          if (v33 > v39)
            v39 = v33;
          v40 = floor(v39);
          if ((*((_BYTE *)self + 961) & 0x20) != 0)
          {
            self->_pendingSize.width = v36;
            self->_pendingSize.height = v40;
          }
          else
          {
            v41 = -[UIView _layer](self, "_layer");
            objc_msgSend(v41, "setLayoutsSuspended:", 1);
            -[UIView frame](self, "frame");
            -[UIWebDocumentView setFrame:](self, "setFrame:");
            objc_msgSend(v41, "setLayoutsSuspended:", 0);
            self->_pendingSize = (CGSize)*MEMORY[0x1E0C9D820];
            -[UIWebDocumentView _updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange](self, "_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange");
            v37 = self->_documentScale;
            if (v37 != documentScale)
            {
              -[UIWebTiledView removeAllNonVisibleTiles](self, "removeAllNonVisibleTiles");
              v37 = self->_documentScale;
            }
          }
          if (v37 != documentScale)
            -[WebView setNeedsDisplay:](self->_webView, "setNeedsDisplay:", 1);
        }
      }
      else
      {
        v6 = self->_viewportHandler;
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __32__UIWebDocumentView__updateSize__block_invoke;
        v45[3] = &unk_1E16B41B8;
        v45[4] = self;
        -[_UIWebViewportHandler update:](v6, "update:", v45);
      }
      *((_BYTE *)self + 960) &= ~0x80u;
    }
  }
}

uint64_t __32__UIWebDocumentView__updateSize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "setDocumentBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

uint64_t __32__UIWebDocumentView__updateSize__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "setDocumentBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

uint64_t __32__UIWebDocumentView__updateSize__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "setDocumentBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 656), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __32__UIWebDocumentView__updateSize__block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 888), "setDocumentBounds:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 656), "setBounds:", v3, v5, v7, v9);
}

- (void)_clearDoubleTapRect
{
  CGPoint v2;
  CGSize v3;

  v2 = (CGPoint)*MEMORY[0x1E0C9D648];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_mainDocumentDoubleTapRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_mainDocumentDoubleTapRect.size = v3;
  self->_doubleTapRect.origin = v2;
  self->_doubleTapRect.size = v3;
  *((_BYTE *)self + 962) &= ~1u;
}

- (void)setShouldIgnoreCustomViewport:(BOOL)a3
{
  char v3;
  char v5;
  _UIWebViewportHandler *viewportHandler;
  _QWORD v7[5];

  v3 = *((_BYTE *)self + 960);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 64;
    else
      v5 = 0;
    *((_BYTE *)self + 960) = v3 & 0xBF | v5;
    if (a3)
    {
      if (-[_UIWebViewportHandler webkitDefinedConfigurationFlags](self->_viewportHandler, "webkitDefinedConfigurationFlags"))
      {
        -[UIWebDocumentView _setDocumentType:](self, "_setDocumentType:", self->_documentType);
      }
    }
    else
    {
      WebThreadLock();
      viewportHandler = self->_viewportHandler;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__UIWebDocumentView_setShouldIgnoreCustomViewport___block_invoke;
      v7[3] = &unk_1E16B41B8;
      v7[4] = self;
      -[_UIWebViewportHandler update:](viewportHandler, "update:", v7);
    }
  }
}

uint64_t __51__UIWebDocumentView_setShouldIgnoreCustomViewport___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyViewportArguments:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "backForwardList"), "currentItem"), "_viewportArguments"));
}

- (BOOL)shouldIgnoreCustomViewport
{
  return (*((unsigned __int8 *)self + 960) >> 6) & 1;
}

- (void)_applyViewportArguments:(id)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  float v11;
  float v12;
  float v13;
  double v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  if (a3)
  {
    self->_wantsMinimalUI = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("minimal-ui")), "BOOLValue");
    if ((*((_BYTE *)self + 960) & 0x40) == 0)
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0DD98C0]), "floatValue");
      v6 = v5;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0DD98B8]), "floatValue");
      v8 = v7;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0DD98B0]), "floatValue");
      v10 = v9;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0DD98D8]), "floatValue");
      v12 = v11;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0DD98A8]), "floatValue");
      v14 = v13;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0DD98D0]), "floatValue");
      v16 = v15;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0DD98C8]), "floatValue");
      v18 = v17;
      v19 = objc_msgSend(a3, "objectForKey:", CFSTR("viewport-fit"));
      LODWORD(v20) = v10;
      LODWORD(v21) = v6;
      LODWORD(v22) = v8;
      LODWORD(v23) = v16;
      LODWORD(v24) = v18;
      -[_UIWebViewportHandler applyWebKitViewportArgumentsSize:initialScale:minimumScale:maximumScale:allowsUserScaling:allowsShrinkToFit:viewportFit:](self->_viewportHandler, "applyWebKitViewportArgumentsSize:initialScale:minimumScale:maximumScale:allowsUserScaling:allowsShrinkToFit:viewportFit:", v19, v12, v14, v20, v21, v22, v23, v24);
    }
  }
}

- (void)webView:(id)a3 didReceiveViewportArguments:(id)a4
{
  _UIWebViewportHandler *viewportHandler;
  _QWORD v7[6];

  WebThreadLock();
  viewportHandler = self->_viewportHandler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__UIWebDocumentView_webView_didReceiveViewportArguments___block_invoke;
  v7[3] = &unk_1E16C3CF0;
  v7[4] = self;
  v7[5] = a4;
  -[_UIWebViewportHandler update:](viewportHandler, "update:", v7);
}

uint64_t __57__UIWebDocumentView_webView_didReceiveViewportArguments___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyViewportArguments:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isClassicViewportMode
{
  return -[_UIWebViewportHandler isClassicViewportMode](self->_viewportHandler, "isClassicViewportMode");
}

- (void)webView:(id)a3 needsScrollNotifications:(id)a4 forFrame:(id)a5
{
  char v7;

  if (-[WebView mainFrame](self->_webView, "mainFrame", a3) == a5)
  {
    if (objc_msgSend(a4, "BOOLValue"))
      v7 = 0x80;
    else
      v7 = 0;
    *((_BYTE *)self + 962) = v7 & 0x80 | *((_BYTE *)self + 962) & 0x7F;
  }
}

- (BOOL)needsScrollNotifications
{
  return *((unsigned __int8 *)self + 962) >> 7;
}

- (void)sendScrollEventIfNecessary
{
  -[UIWebDocumentView sendScrollEventIfNecessaryWasUserScroll:](self, "sendScrollEventIfNecessaryWasUserScroll:", 1);
}

- (void)sendScrollEventIfNecessaryWasUserScroll:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  -[UIWebDocumentView _updateFixedPositioningObjectsLayoutDuringScroll](self, "_updateFixedPositioningObjectsLayoutDuringScroll");
  if (*((char *)self + 962) < 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    v5 = __61__UIWebDocumentView_sendScrollEventIfNecessaryWasUserScroll___block_invoke;
    v6 = &v8;
  }
  else
  {
    if (!v3)
      return;
    v7 = MEMORY[0x1E0C809B0];
    v5 = __61__UIWebDocumentView_sendScrollEventIfNecessaryWasUserScroll___block_invoke_2;
    v6 = &v7;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_1E16B41B8;
  v6[4] = (uint64_t)self;
  WebThreadRun();
}

uint64_t __61__UIWebDocumentView_sendScrollEventIfNecessaryWasUserScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "mainFrame"), "sendScrollEvent");
}

uint64_t __61__UIWebDocumentView_sendScrollEventIfNecessaryWasUserScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "mainFrame"), "_userScrolled");
}

- (void)resetTilingAfterLoadComplete
{
  objc_super v3;

  if ((*((_BYTE *)self + 961) & 0x20) != 0)
  {
    if ((*((_BYTE *)self + 960) & 0x10) != 0)
      -[UIWebDocumentView _updateSize](self, "_updateSize");
    -[UIWebTiledView setNeedsLayout](self, "setNeedsLayout");
  }
  if ((*((_BYTE *)self + 963) & 8) != 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIWebDocumentView;
    -[UIWebTiledView setTilingArea:](&v3, sel_setTilingArea_, 0);
    *((_BYTE *)self + 963) &= ~8u;
  }
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  if (-[WebView mainFrame](self->_webView, "mainFrame", a3) == a4)
  {
    *((_BYTE *)self + 965) &= ~8u;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "webViewMainFrameDidFinishLoad:", self);
    objc_msgSend((id)objc_msgSend(a4, "frameView"), "documentView");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *((_BYTE *)self + 963) &= ~0x80u;
      -[UIWebDocumentView resetTilingAfterLoadComplete](self, "resetTilingAfterLoadComplete");
      if (-[UIWebDocumentView _dataDetectionIsActivated](self, "_dataDetectionIsActivated"))
      {
        if (!-[WebView isEditable](self->_webView, "isEditable")
          && !-[UIWebDocumentView _parentTextView](self, "_parentTextView"))
        {
          WebThreadLock();
          objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController"), "startURLificationForFrame:detectedTypes:", a4, -[UIWebDocumentView effectiveDataDetectorTypes](self, "effectiveDataDetectorTypes"));
        }
      }
    }
  }
}

- (void)webThreadWebViewDidLayout:(id)a3 byScrolling:(BOOL)a4
{
  uint64_t v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD block[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "webThreadWebViewDidLayout:", self);
  self->_renderTreeSize = objc_msgSend(a3, "_renderTreeSize");
  v7 = MEMORY[0x1E0C809B0];
  if (self->_renderTreeSizeThresholdForReset)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__UIWebDocumentView_webThreadWebViewDidLayout_byScrolling___block_invoke;
    block[3] = &unk_1E16B41B8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (-[UIWebDocumentView hasSelection](self, "hasSelection"))
  {
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __59__UIWebDocumentView_webThreadWebViewDidLayout_byScrolling___block_invoke_2;
    v8[3] = &unk_1E16E86D8;
    v8[4] = self;
    v9 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], v8);
  }
}

uint64_t __59__UIWebDocumentView_webThreadWebViewDidLayout_byScrolling___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __59__UIWebDocumentView_webThreadWebViewDidLayout_byScrolling___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_selectionLayoutChangedByScrolling:", *(unsigned __int8 *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "hasEditableSelection");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_editableSelectionLayoutChangedByScrolling:", *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_selectionLayoutChangedByScrolling:(BOOL)a3
{
  -[UITextInteractionAssistant layoutChangedByScrolling:](self->_textSelectionAssistant, "layoutChangedByScrolling:", a3);
}

- (void)_editableSelectionLayoutChangedByScrolling:(BOOL)a3
{
  if (objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3), "autocorrectPrompt"))
  {
    objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "updateCandidateDisplay");
  }
}

- (void)webViewDidStartOverflowScroll:(id)a3
{
  -[UITextInteractionAssistant willStartScrollingOrZooming](self->_textSelectionAssistant, "willStartScrollingOrZooming", a3);
}

- (void)webViewDidEndOverflowScroll:(id)a3
{
  -[UITextInteractionAssistant didEndScrollingOrZooming](self->_textSelectionAssistant, "didEndScrollingOrZooming", a3);
}

- (void)webView:(id)a3 runOpenPanelForFileButtonWithResultListener:(id)a4 configuration:(id)a5
{
  UIWebFileUploadPanel *v6;

  if (self->_fileUploadPanel)
  {
    objc_msgSend(a4, "cancel", a3, a4, a5);
  }
  else
  {
    v6 = -[UIWebFileUploadPanel initWithResultListener:configuration:documentView:]([UIWebFileUploadPanel alloc], "initWithResultListener:configuration:documentView:", a4, a5, self);
    self->_fileUploadPanel = v6;
    -[UIWebFileUploadPanel setDelegate:](v6, "setDelegate:", self);
    -[UIWebFileUploadPanel present](self->_fileUploadPanel, "present");
  }
}

- (void)webViewDidRestoreFromPageCache:(id)a3
{
  *((_BYTE *)self + 965) |= 0x10u;
}

- (void)webView:(id)a3 didFirstVisuallyNonEmptyLayoutInFrame:(id)a4
{
  *((_BYTE *)self + 963) |= 0x40u;
  if ((*((_BYTE *)self + 960) & 0x10) != 0)
    -[UIWebDocumentView _updateSize](self, "_updateSize", a3, a4);
  -[UIWebTiledView setNeedsLayout](self, "setNeedsLayout", a3, a4);
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  if (-[WebView mainFrame](self->_webView, "mainFrame", a3) == a5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "webViewMainFrameDidFailLoad:withError:", self, a4);
    *((_BYTE *)self + 963) &= ~0x80u;
    -[UIWebDocumentView resetTilingAfterLoadComplete](self, "resetTilingAfterLoadComplete");
  }
}

- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4
{
  -[WebView mainFrame](self->_webView, "mainFrame", a3, a4);
}

- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4
{
  char v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WebHistoryItem *v12;
  void *v13;
  _QWORD *v14;

  if (-[WebView mainFrame](self->_webView, "mainFrame", a3) == a4)
  {
    *((_BYTE *)self + 961) &= ~8u;
    self->_previousDocumentScale = self->_documentScale;
    self->_documentScale = -1.0;
    -[UIWebDocumentView _resetFormDataForFrame:](self, "_resetFormDataForFrame:", a4);
    -[UIWebDocumentView setTilingArea:](self, "setTilingArea:", 2);
    -[UIWebTiledView setNeedsDisplay](self, "setNeedsDisplay");
    *((_BYTE *)self + 961) |= 0x20u;
    if (objc_msgSend(a4, "_isVisuallyNonEmpty"))
      v6 = 64;
    else
      v6 = 0;
    *((_BYTE *)self + 963) = *((_BYTE *)self + 963) & 0xBF | v6;
    *((_BYTE *)self + 964) &= ~0x80u;
    *((_BYTE *)self + 963) |= 0x80u;
    *((_BYTE *)self + 961) &= ~0x40u;
    self->_pendingSize = (CGSize)*MEMORY[0x1E0C9D820];
    v7 = *((_BYTE *)self + 965);
    if ((v7 & 0x10) == 0)
    {
      *((_BYTE *)self + 962) &= ~0x80u;
      v7 = *((_BYTE *)self + 965);
    }
    *((_BYTE *)self + 965) = v7 & 0xEF;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "webViewMainFrameDidCommitLoad:", self);
    v8 = (void *)objc_msgSend(a4, "dataSource");
    v9 = objc_msgSend((id)objc_msgSend(a4, "frameView"), "documentView");
    if ((objc_msgSend(a4, "_loadType") & 0xFFFFFFFD) == 4)
      v10 = 0;
    else
      v10 = -[WebHistoryItem _viewportArguments](-[WebBackForwardList currentItem](-[WebView backForwardList](self->_webView, "backForwardList"), "currentItem"), "_viewportArguments");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "response"), "MIMEType"), "lowercaseString"), "isEqualToString:", CFSTR("text/plain")) & 1) != 0)
    {
      v11 = 1;
    }
    else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD97A8], "_productivityDocumentMIMETypes"), "containsObject:", objc_msgSend((id)objc_msgSend(v8, "_responseMIMEType"), "lowercaseString")))
    {
      v11 = 2;
    }
    else
    {
      v11 = 4;
    }
    -[UIWebDocumentView _setDocumentType:overrideCustomConfigurations:viewportArguments:](self, "_setDocumentType:overrideCustomConfigurations:viewportArguments:", v11, 1, v10);
    v12 = -[WebBackForwardList currentItem](-[WebView backForwardList](self->_webView, "backForwardList"), "currentItem");

    self->_latestCommittedPageLoadHistoryItem = v12;
    -[UIWebDocumentView _clearDoubleTapRect](self, "_clearDoubleTapRect");
    -[UIWebDocumentView _clearAllConsoleMessages](self, "_clearAllConsoleMessages");
    if ((*((_BYTE *)self + 960) & 0x10) != 0)
    {
      -[UIWebDocumentView _updateSize](self, "_updateSize");
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (_QWORD *)MEMORY[0x1E0DD97B0];
      objc_msgSend(v13, "removeObserver:name:object:", self, *MEMORY[0x1E0DD97B0], 0);
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__WAKViewSizeDidChange_, *v14, v9);
    }
  }
}

- (void)webViewDidReceiveMobileDocType:(id)a3
{
  -[UIWebDocumentView _setDocumentType:overrideCustomConfigurations:viewportArguments:](self, "_setDocumentType:overrideCustomConfigurations:viewportArguments:", 3, 0, 0);
}

- (void)_WAKViewSizeDidChange:(id)a3
{
  NSView *v5;
  double v6;
  double v7;

  v5 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView");
  if (v5 == (NSView *)objc_msgSend(a3, "object"))
  {
    -[NSView frame](v5, "frame");
    if (v7 != *MEMORY[0x1E0C9D820] || v6 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[UIWebTiledView setNeedsLayout](self, "setNeedsLayout");
      if ((*((_BYTE *)self + 960) & 0x10) != 0)
        -[UIWebDocumentView _updateSize](self, "_updateSize");
    }
  }
}

- (CGRect)documentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[_UIWebViewportHandler documentBounds](self->_viewportHandler, "documentBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAutoresizes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 960) = *((_BYTE *)self + 960) & 0xEF | v3;
}

- (void)setIgnoresViewportOverflowWhenAutoresizing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 960) = *((_BYTE *)self + 960) & 0xDF | v3;
}

- (void)setMinimumSize:(CGSize)a3
{
  -[UIWebDocumentView setMinimumSize:updateCurrentViewportConfigurationSize:](self, "setMinimumSize:updateCurrentViewportConfigurationSize:", 0, a3.width, a3.height);
}

- (void)setMinimumSize:(CGSize)a3 updateCurrentViewportConfigurationSize:(BOOL)a4
{
  _UIWebViewportHandler *viewportHandler;
  _QWORD v5[5];
  CGSize v6;
  BOOL v7;

  viewportHandler = self->_viewportHandler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__UIWebDocumentView_setMinimumSize_updateCurrentViewportConfigurationSize___block_invoke;
  v5[3] = &unk_1E16ECB70;
  v5[4] = self;
  v7 = a4;
  v6 = a3;
  -[_UIWebViewportHandler update:](viewportHandler, "update:", v5);
}

uint64_t __75__UIWebDocumentView_setMinimumSize_updateCurrentViewportConfigurationSize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 888);
  if (v3)
  {
    objc_msgSend(v3, "rawViewConfiguration");
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_BYTE *)(a1 + 56)
    || (v4 = objc_msgSend(*(id *)(v2 + 888), "webkitDefinedConfigurationFlags"),
        v2 = *(_QWORD *)(a1 + 32),
        (v4 & 0x10) != 0))
  {
    v5 = 1;
  }
  else if (*(double *)&v7 == *(double *)(v2 + 1160 + 32 * *(unsigned int *)(v2 + 896)))
  {
    v5 = 0;
  }
  else
  {
    *(_QWORD *)&v7 = *(_QWORD *)(v2 + 1160 + 32 * *(unsigned int *)(v2 + 896));
    objc_msgSend(*(id *)(v2 + 888), "overrideViewportConfiguration:", &v7);
    v5 = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 888), "setAvailableViewSize:updateConfigurationSize:", v5, round(*(double *)(a1 + 40)), round(*(double *)(a1 + 48)), v7, v8);
}

- (void)setViewportSize:(CGSize)a3 forDocumentTypes:(int)a4
{
  uint64_t v4;
  double v5;
  double v6;

  v4 = 0;
  v5 = round(a3.width);
  v6 = round(a3.height);
  do
  {
    if (((a4 >> v4) & 1) != 0)
    {
      self->_defaultViewportConfigurations[0].size.width = v5;
      self->_defaultViewportConfigurations[0].size.height = v6;
    }
    ++v4;
    self = (UIWebDocumentView *)((char *)self + 32);
  }
  while (v4 != 5);
}

- (void)setInitialScale:(float)a3 forDocumentTypes:(int)a4
{
  uint64_t v4;
  FBSSceneIdentityToken **p_layeringSceneIdentity;

  v4 = 0;
  p_layeringSceneIdentity = &self->super.super.super.__layeringSceneIdentity;
  do
  {
    if (((a4 >> v4) & 1) != 0)
      *((float *)p_layeringSceneIdentity + 290) = a3;
    ++v4;
    p_layeringSceneIdentity += 4;
  }
  while (v4 != 5);
}

- (void)setMinimumScale:(float)a3 forDocumentTypes:(int)a4
{
  uint64_t v4;
  float *v5;

  v4 = 0;
  v5 = (float *)&self->super.super.super.__layeringSceneIdentity + 1;
  do
  {
    if (((a4 >> v4) & 1) != 0)
      v5[290] = a3;
    ++v4;
    v5 += 8;
  }
  while (v4 != 5);
}

- (void)setMaximumScale:(float)a3 forDocumentTypes:(int)a4
{
  uint64_t v4;
  NSMutableArray **p_constraintsExceptingSubviewAutoresizingConstraints;

  v4 = 0;
  p_constraintsExceptingSubviewAutoresizingConstraints = &self->super.super._constraintsExceptingSubviewAutoresizingConstraints;
  do
  {
    if (((a4 >> v4) & 1) != 0)
      *((float *)p_constraintsExceptingSubviewAutoresizingConstraints + 290) = a3;
    ++v4;
    p_constraintsExceptingSubviewAutoresizingConstraints += 4;
  }
  while (v4 != 5);
}

- (void)setAllowsUserScaling:(BOOL)a3 forDocumentTypes:(int)a4
{
  uint64_t v4;
  char *v5;

  v4 = 0;
  v5 = (char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints + 4;
  do
  {
    if (((a4 >> v4) & 1) != 0)
      v5[1160] = a3;
    ++v4;
    v5 += 32;
  }
  while (v4 != 5);
}

- (void)setAllowsShrinkToFit:(BOOL)a3 forDocumentTypes:(int)a4
{
  uint64_t v4;
  char *v5;

  v4 = 0;
  v5 = (char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints + 5;
  do
  {
    if (((a4 >> v4) & 1) != 0)
      v5[1160] = a3;
    ++v4;
    v5 += 32;
  }
  while (v4 != 5);
}

- (void)setAvoidsUnsafeArea:(BOOL)a3 forDocumentTypes:(int)a4
{
  uint64_t v4;
  char *v5;

  v4 = 0;
  v5 = (char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints + 6;
  do
  {
    if (((a4 >> v4) & 1) != 0)
      v5[1160] = a3;
    ++v4;
    v5 += 32;
  }
  while (v4 != 5);
}

- (void)fileUploadPanelDidDismiss:(id)a3
{
  -[UIWebFileUploadPanel setDelegate:](self->_fileUploadPanel, "setDelegate:", 0);

  self->_fileUploadPanel = 0;
}

- (void)setUpdatesScrollView:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 961) = *((_BYTE *)self + 961) & 0xFB | v3;
}

- (BOOL)updatesScrollView
{
  return (*((unsigned __int8 *)self + 961) >> 2) & 1;
}

- (void)_restoreScrollPointForce:(BOOL)a3
{
  id v4;
  double v5;
  double v6;
  NSView *v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  if (a3 || (*((_BYTE *)self + 961) & 0x10) != 0 && (*((_BYTE *)self + 961) & 8) == 0)
  {
    WebThreadLock();
    v4 = -[UIView _scroller](self, "_scroller");
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if ((*((_BYTE *)self + 961) & 0x40) != 0)
    {
      v7 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView");
      if (v7)
      {
        -[NSView convertPoint:toView:](v7, "convertPoint:toView:", self->_webView, self->_scrollPoint.x, self->_scrollPoint.y);
        v5 = v8;
        v6 = v9;
      }
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v4, v5, v6);
      v5 = v10;
      v6 = fmax(v11, 0.0);
      *((_BYTE *)self + 961) &= ~0x10u;
    }
    objc_msgSend(v4, "contentOffset");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v4, "contentInset");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v4, "_systemContentInset");
    *((_BYTE *)self + 965) |= 2u;
    objc_msgSend(v4, "_setContentOffsetPinned:", v5 - (v19 + v21), v6 - (v17 + v20));
    *((_BYTE *)self + 965) &= ~2u;
    *((_BYTE *)self + 965) &= ~8u;
    -[UIWebDocumentView _updateFixedPositioningObjectsLayoutAfterScroll](self, "_updateFixedPositioningObjectsLayoutAfterScroll");
    objc_msgSend(v4, "contentOffset");
    if (v13 != v23 || v15 != v22)
      -[UIWebTiledView layoutTilesNow](self, "layoutTilesNow");
  }
}

- (void)_resetForNewPage
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float previousDocumentScale;
  objc_super v11;
  objc_super v12;

  v3 = -[UIView _scroller](self, "_scroller");
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  if (self->_pendingSize.width != 0.0 && self->_pendingSize.height != 0.0)
  {
    -[UIView frame](self, "frame");
    -[UIWebDocumentView setFrame:](self, "setFrame:");
    self->_pendingSize = (CGSize)*MEMORY[0x1E0C9D820];
  }
  *((_BYTE *)self + 961) &= ~0x20u;
  *((_BYTE *)self + 961) |= 0x10u;
  self->_renderTreeSizeThresholdForReset = 0;
  if (*((char *)self + 963) < 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)UIWebDocumentView;
    -[UIWebTiledView setTilingArea:](&v12, sel_setTilingArea_, 1);
    *((_BYTE *)self + 963) |= 8u;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIWebDocumentView;
    -[UIWebTiledView setTilingArea:](&v11, sel_setTilingArea_, 0);
  }
  if ((*((_BYTE *)self + 961) & 4) != 0 && -[UIView _scroller](self, "_scroller"))
    -[UIWebDocumentView _restoreScrollPointForce:](self, "_restoreScrollPointForce:", 0);
  objc_msgSend(v3, "contentOffset");
  if (v5 != v9
    || v7 != v8
    || (previousDocumentScale = self->_previousDocumentScale, previousDocumentScale != 0.0)
    && previousDocumentScale != self->_documentScale)
  {
    -[UIWebTiledView removeAllTiles](self, "removeAllTiles");
    -[UIWebTiledView layoutTilesNow](self, "layoutTilesNow");
    self->_previousDocumentScale = 0.0;
  }
  -[UIWebDocumentView _showPendingContentLayers](self, "_showPendingContentLayers");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "didResetViewForNewPage:", self);
}

- (void)_saveStateToHistoryItem:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSView *v11;
  double v12;
  double v13;
  double v14;
  float v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "saveStateToHistoryItem:forWebView:", a3, self);
  v5 = -[UIView _scroller](self, "_scroller");
  if ((*((_BYTE *)self + 961) & 4) != 0)
  {
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(a3, "lastVisitWasFailure") & 1) == 0)
      {
        objc_msgSend(v6, "contentOffset");
        -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v6);
        v8 = v7;
        v10 = v9;
        v11 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView");
        if (v11)
        {
          -[NSView convertPoint:fromView:](v11, "convertPoint:fromView:", self->_webView, v8, v10);
          v8 = v12;
          v10 = v13;
        }
        -[_UIWebViewportHandler integralInitialScale](self->_viewportHandler, "integralInitialScale");
        v15 = v14;
        objc_msgSend(a3, "_setScrollPoint:", v8, v10);
        objc_msgSend(a3, "_setScale:isInitial:", self->_documentScale == v15);
      }
    }
  }
}

- (void)saveStateToCurrentHistoryItem
{
  if (self->_latestCommittedPageLoadHistoryItem)
  {
    WebThreadLock();
    -[UIWebDocumentView _saveStateToHistoryItem:](self, "_saveStateToHistoryItem:", self->_latestCommittedPageLoadHistoryItem);
  }
}

- (void)webView:(id)a3 saveStateToHistoryItem:(id)a4 forFrame:(id)a5
{
  unsigned int v7;
  __int16 v8;
  void *v9;
  double v10;
  _UIWebViewportHandler *viewportHandler;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  int v18;
  uint64_t v19;
  double v20;
  int v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  const __CFString *v27;
  double v28;

  -[UIWebDocumentView _saveStateToHistoryItem:](self, "_saveStateToHistoryItem:", a4);
  if ((objc_msgSend(a4, "lastVisitWasFailure") & 1) == 0)
  {
    v7 = -[_UIWebViewportHandler webkitDefinedConfigurationFlags](self->_viewportHandler, "webkitDefinedConfigurationFlags");
    v8 = v7;
    if (v7 || self->_wantsMinimalUI)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
      HIDWORD(v10) = 0;
      viewportHandler = self->_viewportHandler;
      if (viewportHandler)
        -[_UIWebViewportHandler rawViewConfiguration](viewportHandler, "rawViewConfiguration");
      LODWORD(v10) = 0;
      if ((v8 & 2) == 0)
        *(float *)&v10 = -1.0;
      v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10, 0);
      objc_msgSend(v9, "setObject:forKey:", v12, *MEMORY[0x1E0DD98B0]);
      LODWORD(v13) = 0;
      if ((v8 & 4) == 0)
        *(float *)&v13 = -1.0;
      v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
      objc_msgSend(v9, "setObject:forKey:", v14, *MEMORY[0x1E0DD98C0]);
      LODWORD(v15) = 0;
      if ((v8 & 8) == 0)
        *(float *)&v15 = -1.0;
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
      objc_msgSend(v9, "setObject:forKey:", v16, *MEMORY[0x1E0DD98B8]);
      if ((v8 & 0x40) != 0)
        v18 = 0;
      else
        v18 = -1;
      *(float *)&v17 = (float)v18;
      v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      objc_msgSend(v9, "setObject:forKey:", v19, *MEMORY[0x1E0DD98D0]);
      if ((v8 & 0x80) != 0)
        v21 = 0;
      else
        v21 = -1;
      *(float *)&v20 = (float)v21;
      v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
      objc_msgSend(v9, "setObject:forKey:", v22, *MEMORY[0x1E0DD98C8]);
      HIDWORD(v23) = HIDWORD(v28);
      *(float *)&v23 = v28;
      if ((v8 & 0x10) == 0)
        *(float *)&v23 = -1.0;
      v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
      objc_msgSend(v9, "setObject:forKey:", v24, *MEMORY[0x1E0DD98D8]);
      HIDWORD(v25) = 0;
      *(float *)&v25 = 0.0;
      if ((v8 & 0x20) == 0)
        *(float *)&v25 = -1.0;
      v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
      objc_msgSend(v9, "setObject:forKey:", v26, *MEMORY[0x1E0DD98A8]);
      objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wantsMinimalUI), CFSTR("minimal-ui"));
      if ((v8 & 0x100) != 0)
        v27 = CFSTR("cover");
      else
        v27 = CFSTR("auto");
      objc_msgSend(v9, "setObject:forKey:", v27, CFSTR("viewport-fit"));
      objc_msgSend(a4, "_setViewportArguments:", v9);

    }
  }
}

- (void)webView:(id)a3 restoreStateFromHistoryItem:(id)a4 forFrame:(id)a5 force:(BOOL)a6
{
  _BOOL8 v6;
  CGFloat v9;
  CGFloat v10;
  float v11;
  double v12;
  double v13;

  v6 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "restoreStateFromHistoryItem:forWebView:", a4, self);
  if ((*((_BYTE *)self + 961) & 4) != 0)
  {
    if (-[UIView _scroller](self, "_scroller"))
    {
      objc_msgSend(a4, "_scrollPoint");
      self->_scrollPoint.x = v9;
      self->_scrollPoint.y = v10;
      *((_BYTE *)self + 961) |= 0x40u;
      if ((*((_BYTE *)self + 961) & 0x20) == 0)
      {
        if (!objc_msgSend(a4, "_scaleIsInitial")
          || (objc_msgSend(a4, "_scale"),
              v12 = v11,
              -[_UIWebViewportHandler integralInitialScale](self->_viewportHandler, "integralInitialScale"),
              v13 == v12))
        {
          -[UIWebDocumentView _restoreScrollPointForce:](self, "_restoreScrollPointForce:", v6);
        }
      }
    }
  }
  -[UIWebTiledView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)webView:(id)a3 shouldScrollToPoint:(CGPoint)a4 forFrame:(id)a5
{
  double y;
  double x;
  id v10;
  WebFrameView *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  uint64_t v34;
  char v35;
  CGFloat v36;
  CGFloat v37;
  CGRect v39;
  CGRect v40;

  y = a4.y;
  x = a4.x;
  if ((unint64_t)(-[UIGestureRecognizer state](self->_twoFingerPanGestureRecognizer, "state") - 1) < 2
    || (objc_msgSend(a3, "_isProcessingUserGesture") & 1) == 0 && (*((_BYTE *)self + 965) & 8) != 0)
  {
    goto LABEL_7;
  }
  if (-[WebView mainFrame](self->_webView, "mainFrame") != a5)
  {
    LOBYTE(v10) = 1;
    return (char)v10;
  }
  if ((*((_BYTE *)self + 961) & 4) == 0)
  {
LABEL_7:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  v10 = -[UIView _scroller](self, "_scroller");
  if (v10)
  {
    v11 = -[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView");
    v12 = (void *)-[WebFrameView _scrollView](v11, "_scrollView");
    if ((*((_BYTE *)self + 961) & 0x20) != 0)
    {
      objc_msgSend(v12, "convertPoint:toView:", -[WebFrameView documentView](v11, "documentView"), x, y);
      LOBYTE(v10) = 0;
      self->_scrollPoint.x = v36;
      self->_scrollPoint.y = v37;
      v34 = 961;
      v35 = *((_BYTE *)self + 961) | 0x40;
    }
    else
    {
      v13 = -[UIView _scroller](self, "_scroller");
      objc_msgSend(v12, "convertPoint:toView:", 0, x, y);
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13);
      v15 = v14;
      v17 = v16;
      -[UIView frame](self, "frame");
      if (v15 < v18)
        v15 = v18;
      if (v17 < v19)
        v17 = v19;
      if (!CGRectIsNull(self->_exposedScrollViewRect))
      {
        objc_msgSend(v13, "contentOffset");
        v17 = v17 - (self->_exposedScrollViewRect.origin.y - v20);
        v15 = v15 - (self->_exposedScrollViewRect.origin.x - v21);
      }
      if ((*((_BYTE *)self + 960) & 0x10) != 0)
      {
        -[_UIWebViewportHandler documentBounds](self->_viewportHandler, "documentBounds");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        -[NSView bounds](-[WebFrameView documentView](v11, "documentView"), "bounds");
        v40.origin.x = v30;
        v40.origin.y = v31;
        v40.size.width = v32;
        v40.size.height = v33;
        v39.origin.x = v23;
        v39.origin.y = v25;
        v39.size.width = v27;
        v39.size.height = v29;
        if (!CGRectEqualToRect(v39, v40))
          -[UIWebDocumentView _updateSize](self, "_updateSize");
      }
      objc_msgSend(v13, "_setContentOffsetPinned:", v15, v17);
      -[UIWebDocumentView sendScrollEventIfNecessaryWasUserScroll:](self, "sendScrollEventIfNecessaryWasUserScroll:", 0);
      -[UIWebDocumentView _updateFixedPositioningObjectsLayoutAfterScroll](self, "_updateFixedPositioningObjectsLayoutAfterScroll");
      LOBYTE(v10) = 0;
      *((_BYTE *)self + 961) &= ~0x10u;
      v34 = 965;
      v35 = *((_BYTE *)self + 965) & 0xF7;
    }
    *((_BYTE *)&self->super.super.super.super.isa + v34) = v35;
  }
  return (char)v10;
}

- (void)_showPendingContentLayers
{
  -[CALayer setHidden:](self->_contentLayersHostingLayer, "setHidden:", 0);
}

- (void)forceLayout
{
  WebThreadLock();
  -[NSView layout](-[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView"), "layout");
  if ((*((_BYTE *)self + 961) & 0x20) != 0
    && -[UIWebDocumentView _shouldResetForNewPage](self, "_shouldResetForNewPage"))
  {
    -[UIWebDocumentView _resetForNewPage](self, "_resetForNewPage");
  }
  -[UIWebTiledView setNeedsLayout](self, "setNeedsLayout");
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutSubviews
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  UIWebDocumentView *v8;

  if ((WebThreadIsCurrent() & 1) == 0)
  {
    if ((*((_BYTE *)self + 961) & 0x20) != 0)
    {
      if (!-[UIWebDocumentView _shouldResetForNewPage](self, "_shouldResetForNewPage"))
        return;
      -[UIWebDocumentView _resetForNewPage](self, "_resetForNewPage");
    }
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __35__UIWebDocumentView_layoutSubviews__block_invoke;
    v7 = &unk_1E16B41B8;
    v8 = self;
    WebThreadRun();
    v3.receiver = self;
    v3.super_class = (Class)UIWebDocumentView;
    -[UIWebTiledView layoutSubviews](&v3, sel_layoutSubviews);
  }
}

uint64_t __35__UIWebDocumentView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "_viewGeometryDidChange");
}

- (void)setSmoothsFonts:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (a3 && (setSmoothsFonts__didSetOrientationProvider & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DD9720], "setOrientationProvider:", objc_opt_class());
    setSmoothsFonts__didSetOrientationProvider = 1;
  }
  -[WAKWindow setUseOrientationDependentFontAntialiasing:](self->super._wakWindow, "setUseOrientationDependentFontAntialiasing:", v3);
}

+ (BOOL)hasLandscapeOrientation
{
  return (unint64_t)(objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0)- 3) < 2;
}

- (void)setDrawsBackground:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  WebThreadLock();
  -[WebView setDrawsBackground:](self->_webView, "setDrawsBackground:", v3);
  -[UIWebTiledView setTilesOpaque:](self, "setTilesOpaque:", v3);
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentView;
  -[UIView setOpaque:](&v5, sel_setOpaque_);
  -[UIWebDocumentView setDrawsBackground:](self, "setDrawsBackground:", v3);
}

- (CGImage)newSnapshotWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WebThreadLock();
  -[UIWebTiledView layoutTilesNow](self, "layoutTilesNow");
  v9.receiver = self;
  v9.super_class = (Class)UIWebDocumentView;
  return -[UIView newSnapshotWithRect:](&v9, sel_newSnapshotWithRect_, x, y, width, height);
}

- (BOOL)cancelMouseTracking
{
  void *v2;

  v2 = (void *)DynamicCastUIScrollView((uint64_t)-[UIView _scroller](self, "_scroller"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "cancelTouchTracking");
  return (char)v2;
}

- (BOOL)cancelTouchTracking
{
  void *v2;

  v2 = (void *)DynamicCastUIScrollView((uint64_t)-[UIView _scroller](self, "_scroller"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "cancelTouchTracking");
  return (char)v2;
}

- (void)setIgnoresFocusingMouse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 960) = *((_BYTE *)self + 960) & 0xFB | v3;
}

- (void)setIgnoresKeyEvents:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 960) = *((_BYTE *)self + 960) & 0xF7 | v3;
}

- (void)setTilingArea:(int)a3
{
  objc_super v3;

  if ((*((_BYTE *)self + 963) & 8) == 0)
    goto LABEL_5;
  if (!a3)
    return;
  if (a3 == 1)
  {
    *((_BYTE *)self + 963) &= ~8u;
  }
  else
  {
LABEL_5:
    v3.receiver = self;
    v3.super_class = (Class)UIWebDocumentView;
    -[UIWebTiledView setTilingArea:](&v3, sel_setTilingArea_, *(_QWORD *)&a3);
  }
}

- (void)_cancelLongPressGestureRecognizer
{
  -[_UIWebHighlightLongPressGestureRecognizer cancel](self->_highlightLongPressGestureRecognizer, "cancel");
}

- (void)_didScroll
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  uint64_t v10;
  objc_super v11;
  objc_super v12;

  self->_mouseDownCount = 0;
  -[UIWebDocumentView cancelInteractionWithImmediateDisplay:](self, "cancelInteractionWithImmediateDisplay:", 1);
  -[UIWebDocumentView _cancelLongPressGestureRecognizer](self, "_cancelLongPressGestureRecognizer");
  if (objc_msgSend((id)DynamicCastUIScrollView((uint64_t)-[UIView _scroller](self, "_scroller")), "isDragging"))
  {
    *((_BYTE *)self + 961) &= ~0x10u;
    -[UIWebDocumentView _clearDoubleTapRect](self, "_clearDoubleTapRect");
    if ((*((_BYTE *)self + 963) & 8) != 0)
    {
      *((_BYTE *)self + 963) &= ~8u;
      v12.receiver = self;
      v12.super_class = (Class)UIWebDocumentView;
      -[UIWebTiledView setTilingArea:](&v12, sel_setTilingArea_, 0);
    }
  }
  v3 = -[UIView _scroller](self, "_scroller");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_verticalVelocity");
    v6 = v5;
    objc_msgSend(v4, "_horizontalVelocity");
    v8 = -v6;
    if (v6 >= 0.0)
      v8 = v6;
    if (v7 >= 0.0)
    {
      v9 = 3;
    }
    else
    {
      v7 = -v7;
      v9 = 2;
    }
    if (v8 >= v7)
      v10 = v6 >= 0.0;
    else
      v10 = v9;
    -[WAKWindow setTilingDirection:](self->super._wakWindow, "setTilingDirection:", v10);
    if ((*((_BYTE *)self + 965) & 2) == 0)
      -[UIWebDocumentView _updateFixedPositionContent](self, "_updateFixedPositionContent");
  }
  v11.receiver = self;
  v11.super_class = (Class)UIWebDocumentView;
  -[UIWebTiledView _didScroll](&v11, sel__didScroll);
}

- (BOOL)_isSubviewOfPlugInView:(id)a3
{
  BOOL v3;
  id v5;
  const void *Value;

  v3 = 0;
  if (a3 && self->_plugInViews)
  {
    v5 = a3;
    do
    {
      Value = CFDictionaryGetValue(self->_plugInViews, v5);
      v3 = Value != 0;
      if (Value)
        break;
      v5 = (id)objc_msgSend(v5, "superview");
    }
    while (v5);
  }
  return v3;
}

- (void)_notifyPlugInViewsOfWillBeginZooming
{
  __CFDictionary *plugInViews;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  plugInViews = self->_plugInViews;
  if (plugInViews && CFDictionaryGetCount(plugInViews))
  {
    v4 = (void *)-[__CFDictionary copy](self->_plugInViews, "copy");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "_webViewWillBeginZooming");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_notifyPlugInViewsOfDidEndZooming
{
  __CFDictionary *plugInViews;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  plugInViews = self->_plugInViews;
  if (plugInViews && CFDictionaryGetCount(plugInViews))
  {
    v4 = (void *)-[__CFDictionary copy](self->_plugInViews, "copy");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "_webViewDidEndZooming:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_notifyPlugInViewsOfDidZoom
{
  __CFDictionary *plugInViews;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  plugInViews = self->_plugInViews;
  if (plugInViews && CFDictionaryGetCount(plugInViews))
  {
    -[UIView transform](self, "transform");
    v4 = v15;
    v5 = (void *)-[__CFDictionary copy](self->_plugInViews, "copy");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "_webViewDidZoomWithRelativeScale:", v4);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_notifyPlugInViewsOfScaleChange
{
  __CFDictionary *plugInViews;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  plugInViews = self->_plugInViews;
  if (plugInViews && CFDictionaryGetCount(plugInViews))
  {
    v4 = (void *)-[__CFDictionary copy](self->_plugInViews, "copy");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "_webViewScaleDidChange");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)UIWebDocumentView;
  -[UIView _didMoveFromWindow:toWindow:](&v17, sel__didMoveFromWindow_toWindow_);
  v7 = (void *)-[__CFDictionary copy](self->_plugInViews, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "superview"))
          objc_msgSend(v12, "_didMoveFromWindow:toWindow:", a3, a4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

}

- (void)_notifyContentHostingLayersOfScaleChange
{
  CALayer *contentLayersHostingLayer;

  contentLayersHostingLayer = self->_contentLayersHostingLayer;
  -[UIView bounds](self, "bounds");
  -[CALayer setFrame:](contentLayersHostingLayer, "setFrame:");
}

- (void)setExposedScrollViewRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_exposedScrollViewRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_exposedScrollViewRect = &self->_exposedScrollViewRect;
  if (!CGRectEqualToRect(self->_exposedScrollViewRect, a3))
  {
    p_exposedScrollViewRect->origin.x = x;
    p_exposedScrollViewRect->origin.y = y;
    p_exposedScrollViewRect->size.width = width;
    p_exposedScrollViewRect->size.height = height;
    -[UIWebDocumentView _updateWebKitExposedScrollViewRect](self, "_updateWebKitExposedScrollViewRect");
    -[UIWebDocumentView _updateFixedPositionContent](self, "_updateFixedPositionContent");
  }
}

- (void)_updateWebKitExposedScrollViewRect
{
  id v3;
  double x;
  double y;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _BOOL4 IsEmpty;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v3 = -[UIView _scroller](self, "_scroller");
  x = self->_exposedScrollViewRect.origin.x;
  y = self->_exposedScrollViewRect.origin.y;
  width = self->_exposedScrollViewRect.size.width;
  height = self->_exposedScrollViewRect.size.height;
  -[UIView frame](self, "frame");
  if (v3)
  {
    -[UIView bounds](self, "bounds");
    -[UIView convertRect:toView:](self, "convertRect:toView:", v3);
    v11 = v10;
    v13 = v12;
    v23.size.width = v14;
    v23.size.height = v15;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v23.origin.x = v11;
    v23.origin.y = v13;
    v21 = CGRectIntersection(v20, v23);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
  }
  else
  {
    v11 = v8;
    v13 = v9;
  }
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  IsEmpty = CGRectIsEmpty(v22);
  v17 = 0.0;
  if (IsEmpty)
    v18 = 0.0;
  else
    v18 = v13;
  v19 = y - v18;
  if (!IsEmpty)
    v17 = v11;
  -[WAKWindow setExposedScrollViewRect:](self->super._wakWindow, "setExposedScrollViewRect:", x - v17, v19, width, height);
}

- (CGRect)_documentViewVisibleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  CGFloat x;
  double v15;
  CGFloat y;
  double v17;
  CGFloat width;
  double v19;
  CGFloat height;
  double v21;
  double v22;
  double v23;
  double v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v33;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UIView _scroller](self, "_scroller");
  if (v11)
  {
    v12 = v11;
    if (CGRectIsNull(self->_exposedScrollViewRect))
    {
      objc_msgSend(v12, "bounds");
      x = v13;
      y = v15;
      width = v17;
      height = v19;
    }
    else
    {
      x = self->_exposedScrollViewRect.origin.x;
      y = self->_exposedScrollViewRect.origin.y;
      width = self->_exposedScrollViewRect.size.width;
      height = self->_exposedScrollViewRect.size.height;
    }
    -[UIView convertRect:toView:](self, "convertRect:toView:", v12, v4, v6, v8, v10);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v29 = CGRectIntersection(v28, v33);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v12, v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
    v4 = v30.origin.x;
    v6 = v30.origin.y;
    v8 = v30.size.width;
    v10 = v30.size.height;
    if (CGRectIsNull(v30))
    {
      -[UIView bounds](self, "bounds");
      v4 = v21;
      v6 = v22;
      v8 = v23;
      v10 = v24;
    }
  }
  memset(&v27, 0, sizeof(v27));
  CGAffineTransformMakeScale(&v27, self->_documentScale, self->_documentScale);
  v25 = v27;
  CGAffineTransformInvert(&v26, &v25);
  v27 = v26;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  return CGRectApplyAffineTransform(v31, &v26);
}

- (CGRect)_layoutRectForFixedPositionObjects
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  double v11;
  double v12;
  float v13;
  float v14;
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
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  -[UIWebDocumentView _documentViewVisibleRect](self, "_documentViewVisibleRect");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[UIView _scroller](self, "_scroller"))
  {
    -[UIWebDocumentView _zoomedDocumentScale](self, "_zoomedDocumentScale");
    v12 = v11;
    v13 = fmin(v11, 1.20000005);
    -[_UIWebViewportHandler minimumScale](self->_viewportHandler, "minimumScale");
    if (v14 <= v13 || v14 == -1.0)
      v14 = v13;
    v16 = v14;
    if (v12 > v14)
    {
      -[_UIWebViewportHandler documentBounds](self->_viewportHandler, "documentBounds");
      if (!CGRectIsEmpty(v33))
      {
        -[_UIWebViewportHandler documentBounds](self->_viewportHandler, "documentBounds");
        v20 = v18 - height;
        v22 = v21 + v19 - width;
        v23 = v19 * (x - v21) / (v19 - width);
        if (v22 > 0.0)
          v24 = v23;
        else
          v24 = 0.0;
        memset(&v32.c, 0, 32);
        if (v17 + v20 > 0.0)
          v25 = v18 * (y - v17) / v20;
        else
          v25 = 0.0;
        *(_OWORD *)&v32.a = 0uLL;
        CGAffineTransformMakeTranslation(&v32, v24, v25);
        v30 = v32;
        CGAffineTransformScale(&v31, &v30, v12 / v16, v12 / v16);
        v32 = v31;
        v30 = v31;
        CGAffineTransformTranslate(&v31, &v30, -v24, -v25);
        v32 = v31;
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        v35 = CGRectApplyAffineTransform(v34, &v31);
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
      }
    }
  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_updateFixedPositionedObjectsLayoutRectUsingWebThread:(BOOL)a3 synchronize:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  double x;
  double y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL8 v15;
  CGRect v16;
  CGRect v17;

  v4 = a4;
  v5 = a3;
  -[UIWebDocumentView _layoutRectForFixedPositionObjects](self, "_layoutRectForFixedPositionObjects");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v17 = CGRectIntegral(v16);
  v11 = v17.origin.x;
  v12 = v17.origin.y;
  v13 = v17.size.width;
  v14 = v17.size.height;
  if (!v5)
  {
    v15 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    -[WebView _setCustomFixedPositionLayoutRect:](self->_webView, "_setCustomFixedPositionLayoutRect:", v11, v12, v13, v14);
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v15);
    if (!v4)
      return;
    goto LABEL_5;
  }
  -[WebView _setCustomFixedPositionLayoutRectInWebThread:synchronize:](self->_webView, "_setCustomFixedPositionLayoutRectInWebThread:synchronize:", v4, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  if (v4)
  {
LABEL_5:
    self->_fixedLayoutOriginRoundingDelta.width = x - v11;
    self->_fixedLayoutOriginRoundingDelta.height = y - v12;
    self->_fixedLayoutSizeRoundingDelta.width = width - v13;
    self->_fixedLayoutSizeRoundingDelta.height = height - v14;
  }
}

- (CGRect)_adjustedLayoutRectForFixedPositionObjects
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

  -[UIWebDocumentView _layoutRectForFixedPositionObjects](self, "_layoutRectForFixedPositionObjects");
  v4 = v3 - self->_fixedLayoutOriginRoundingDelta.width;
  v6 = v5 - self->_fixedLayoutOriginRoundingDelta.height;
  v8 = v7 - self->_fixedLayoutSizeRoundingDelta.width;
  v10 = v9 - self->_fixedLayoutSizeRoundingDelta.height;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (void)_updateFixedPositionContent
{
  void *v3;

  v3 = (void *)-[WebView _fixedPositionContent](self->_webView, "_fixedPositionContent");
  if (objc_msgSend(v3, "hasFixedOrStickyPositionLayers"))
  {
    -[UIWebDocumentView _adjustedLayoutRectForFixedPositionObjects](self, "_adjustedLayoutRectForFixedPositionObjects");
    objc_msgSend(v3, "scrollOrZoomChanged:");
  }
}

- (void)writeDataToPasteboard:(id)a3
{
  UIPasteboard *v4;

  if (-[UITextSelection granularity](-[UITextInteractionAssistant activeSelection](self->_textSelectionAssistant, "activeSelection"), "granularity") == 1)objc_msgSend(a3, "setValue:forKey:", CFSTR("NeXT smart paste pasteboard type"), CFSTR("NeXT smart paste pasteboard type"));
  v4 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  -[UIPasteboard setItems:](v4, "setItems:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3));
}

- (int64_t)getPasteboardItemsCount
{
  return -[UIPasteboard numberOfItems](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "numberOfItems");
}

- (BOOL)isInsideRichlyEditableTextWidget
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->m_parentTextView, "allowsEditingTextAttributes");
  else
    return 0;
}

- (BOOL)hasRichlyEditableSelection
{
  id v3;

  if (self->_isPerformingDrop)
  {
    LOBYTE(v3) = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "hasRichlyEditableDragCaret");
  }
  else
  {
    LODWORD(v3) = -[UIWebDocumentView hasSelection](self, "hasSelection");
    if ((_DWORD)v3)
    {
      if (-[UIWebDocumentView isInsideRichlyEditableTextWidget](self, "isInsideRichlyEditableTextWidget"))
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        v3 = -[UIWebDocumentView formElement](self, "formElement");
        if (v3)
          LOBYTE(v3) = objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isContentEditable");
      }
    }
  }
  return (char)v3;
}

- (BOOL)fragmentContainsRichContent:(id)a3
{
  return -[NSArray count](-[UIPasteboard valuesForPasteboardType:inItemSet:](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard", a3), "valuesForPasteboardType:inItemSet:", CFSTR("iOS rich content paste pasteboard type"), 0), "count") != 0;
}

- (BOOL)performTwoStepDrop:(id)a3 atDestination:(id)a4 isMove:(BOOL)a5
{
  uint64_t v5;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD9760], "sharedInstance", 0), "pasteboardTypes");
    v5 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v10 = v5;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (qword_1ECD7A100 != -1)
            dispatch_once(&qword_1ECD7A100, &__block_literal_global_1642);
          if ((objc_msgSend((id)qword_1ECD7A0F8, "containsObject:", v13) & 1) != 0)
          {
            WebThreadLock();
            LODWORD(v5) = -[UIWebDocumentView hasRichlyEditableSelection](self, "hasRichlyEditableSelection");
            if ((_DWORD)v5)
              LOBYTE(v5) = -[UIWebDocumentView _insertFragmentWithoutPreservingStyle:atDestination:smartReplace:collapseToEnd:](self, "_insertFragmentWithoutPreservingStyle:atDestination:smartReplace:collapseToEnd:", a3, a4, 0, 0);
            return v5;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        LOBYTE(v5) = 0;
        if (v10)
          continue;
        break;
      }
    }
  }
  return v5;
}

- (BOOL)performsTwoStepPaste:(id)a3
{
  UIPasteboard *v5;
  _BOOL8 v6;

  WebThreadLock();
  if (!-[UIWebDocumentView hasRichlyEditableSelection](self, "hasRichlyEditableSelection")
    || !-[UIWebDocumentView fragmentContainsRichContent:](self, "fragmentContainsRichContent:", a3))
  {
    return 0;
  }
  v5 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v6 = -[UIPasteboard numberOfItems](v5, "numberOfItems") == 1
    && -[UIPasteboard valueForPasteboardType:](v5, "valueForPasteboardType:", CFSTR("NeXT smart paste pasteboard type")) != 0;
  return -[UIWebDocumentView _insertFragmentWithoutPreservingStyle:atDestination:smartReplace:collapseToEnd:](self, "_insertFragmentWithoutPreservingStyle:atDestination:smartReplace:collapseToEnd:", a3, 0, v6, 1);
}

- (BOOL)_insertFragmentWithoutPreservingStyle:(id)a3 atDestination:(id)a4 smartReplace:(BOOL)a5 collapseToEnd:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v11;
  id v12;
  uint64_t v13;

  v6 = a6;
  v7 = a5;
  v11 = -[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame");
  v12 = -[UIWebDocumentView undoManager](self, "undoManager");
  v13 = objc_msgSend(v12, "groupsByEvent");
  objc_msgSend(v12, "setGroupsByEvent:", 0);
  objc_msgSend(-[UIWebDocumentView undoManager](self, "undoManager"), "beginUndoGrouping");
  if (a4)
    objc_msgSend(v11, "setSelectedDOMRange:affinity:closeTyping:", a4, 1, 1);
  objc_msgSend(v11, "_replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:", a3, 1, v7, 0);
  objc_msgSend(-[UIWebDocumentView undoManager](self, "undoManager"), "endUndoGrouping");
  objc_msgSend(-[UIWebDocumentView undoManager](self, "undoManager"), "beginUndoGrouping");
  objc_msgSend(v11, "removeUnchangeableStyles");
  if (v6 && -[UITextRange end](-[UIWebDocumentView selectedTextRange](self, "selectedTextRange"), "end"))
    -[UIWebDocumentView setSelectedTextRange:](self, "setSelectedTextRange:", -[UIWebDocumentView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", -[UITextRange end](-[UIWebDocumentView selectedTextRange](self, "selectedTextRange"), "end"), -[UITextRange end](-[UIWebDocumentView selectedTextRange](self, "selectedTextRange"), "end")));
  objc_msgSend(-[UIWebDocumentView undoManager](self, "undoManager"), "endUndoGrouping");
  objc_msgSend(v12, "setGroupsByEvent:", v13);
  return 1;
}

- (id)_supportedPasteboardTypesForCurrentSelection
{
  id m_parentTextView;
  _BOOL4 v5;
  uint64_t v6;

  m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
    return (id)objc_msgSend(m_parentTextView, "supportedPasteboardTypesForCurrentSelection");
  if (!qword_1ECD7A0D0)
  {
    qword_1ECD7A0D0 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)qword_1ECD7A0D0, "addObject:", objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier"));
    objc_msgSend((id)qword_1ECD7A0D0, "addObjectsFromArray:", UIPasteboardTypeListString);
    qword_1ECD7A0C8 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)qword_1ECD7A0C8, "addObject:", *MEMORY[0x1E0DD97D8]);
    objc_msgSend((id)qword_1ECD7A0C8, "addObject:", objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier"));
    objc_msgSend((id)qword_1ECD7A0C8, "addObject:", objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier"));
    objc_msgSend((id)qword_1ECD7A0C8, "addObjectsFromArray:", UIPasteboardTypeListImage);
    objc_msgSend((id)qword_1ECD7A0C8, "addObjectsFromArray:", qword_1ECD7A0D0);
  }
  v5 = -[UIWebDocumentView hasRichlyEditableSelection](self, "hasRichlyEditableSelection");
  v6 = 16;
  if (v5)
    v6 = 8;
  return *(id *)&_MergedGlobals_25_1[v6];
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  if (-[UIWebDocumentView hasSelection](self, "hasSelection"))
    return -[UIWebDocumentView _supportedPasteboardTypesForCurrentSelection](self, "_supportedPasteboardTypesForCurrentSelection");
  else
    return 0;
}

- (id)readDataFromPasteboard:(id)a3 withIndex:(int64_t)a4
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
  if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier")) & 1) != 0
    || objc_msgSend(UIPasteboardTypeListString, "containsObject:", a3))
  {
    return -[UIPasteboard valuesForPasteboardType:inItemSet:](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "valuesForPasteboardType:inItemSet:", a3, v5);
  }
  else
  {
    return -[UIPasteboard dataForPasteboardType:inItemSet:](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "dataForPasteboardType:inItemSet:", a3, v5);
  }
}

- (int64_t)getPasteboardChangeCount
{
  return -[UIPasteboard changeCount](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "changeCount");
}

- (void)showPlaybackTargetPicker:(BOOL)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  UIWebPlaybackTargetPicker *playbackTargetPicker;
  UIWebPlaybackTargetPicker *v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  playbackTargetPicker = self->_playbackTargetPicker;
  if (!playbackTargetPicker)
  {
    v11 = objc_alloc_init(UIWebPlaybackTargetPicker);
    self->_playbackTargetPicker = v11;
    -[UIWebPlaybackTargetPicker setDelegate:](v11, "setDelegate:", self);
    playbackTargetPicker = self->_playbackTargetPicker;
  }
  -[UIWebPlaybackTargetPicker show:fromRect:](playbackTargetPicker, "show:fromRect:", v8, x, y, width, height);
}

- (int)deviceOrientation
{
  int64_t orientation;

  orientation = self->_orientation;
  switch(orientation)
  {
    case 1:
      return 0;
    case 3:
      return 90;
    case 4:
      return -90;
    case 2:
      return 180;
  }
  return 0;
}

- (BOOL)shouldSuppressPasswordEcho
{
  return -[UIScreen isCaptured](-[UIWindow screen](-[UIView window](self, "window"), "screen"), "isCaptured")
      || +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode");
}

- (void)revealedSelectionByScrollingWebFrame:(id)a3
{
  -[UITextInteractionAssistant updateDisplayedSelection](self->_textSelectionAssistant, "updateDisplayedSelection", a3);
}

- (void)_webthread_webView:(id)a3 attachRootLayer:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  CALayer *contentLayersHostingLayer;
  CALayer *v9;
  CALayer *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  CATransform3D v14;
  CATransform3D v15;

  if (!self->_contentLayersHostingLayer)
  {
    self->_contentLayersHostingLayer = (CALayer *)(id)objc_msgSend(MEMORY[0x1E0CD27A8], "layer", a3);
    v6 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("anchorPoint"), v6, CFSTR("bounds"), v6, CFSTR("contents"), v6, CFSTR("opacity"), v6, CFSTR("position"), v6, CFSTR("shadowColor"), v6, CFSTR("sublayerTransform"), v6, CFSTR("sublayers"), v6, CFSTR("transform"),
           v6,
           CFSTR("zPosition"),
           v6,
           CFSTR("hidden"),
           0);
    -[CALayer setStyle:](self->_contentLayersHostingLayer, "setStyle:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("actions")));
    -[CALayer setAnchorPoint:](self->_contentLayersHostingLayer, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    contentLayersHostingLayer = self->_contentLayersHostingLayer;
    -[UIView bounds](self, "bounds");
    -[CALayer setFrame:](contentLayersHostingLayer, "setFrame:");
    if ((*((_BYTE *)self + 960) & 0x10) != 0)
    {
      v9 = self->_contentLayersHostingLayer;
      -[_UIWebViewportHandler documentBounds](self->_viewportHandler, "documentBounds");
      -[CALayer setBounds:](v9, "setBounds:");
    }
    memset(&v15, 0, sizeof(v15));
    CATransform3DMakeScale(&v15, self->_documentScale, self->_documentScale, 1.0);
    v10 = self->_contentLayersHostingLayer;
    v14 = v15;
    -[CALayer setTransform:](v10, "setTransform:", &v14);
    v11 = (void *)objc_msgSend(-[UIView _layer](self, "_layer"), "sublayers");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__UIWebDocumentView__webthread_webView_attachRootLayer___block_invoke;
    v13[3] = &unk_1E16DFC30;
    v13[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);
    if (!-[CALayer superlayer](self->_contentLayersHostingLayer, "superlayer"))
    {
      objc_msgSend(-[UIView _layer](self, "_layer"), "addSublayer:", self->_contentLayersHostingLayer);
      if (a4)
        goto LABEL_6;
LABEL_10:
      v12 = (void *)-[NSArray copy](-[CALayer sublayers](self->_contentLayersHostingLayer, "sublayers", a3), "copy");
      objc_msgSend(v12, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

      return;
    }
  }
  if (!a4)
    goto LABEL_10;
LABEL_6:
  if (!-[UIWebDocumentView _shouldResetForNewPage](self, "_shouldResetForNewPage", a3))
    -[CALayer setHidden:](self->_contentLayersHostingLayer, "setHidden:", 1);
  -[CALayer addSublayer:](self->_contentLayersHostingLayer, "addSublayer:", a4);
}

uint64_t __56__UIWebDocumentView__webthread_webView_attachRootLayer___block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;

  if (a2)
  {
    v6 = result;
    result = objc_msgSend(a2, "delegate");
    if (result)
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) != 0)
      {
        result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 32), "_layer"), "insertSublayer:atIndex:", *(_QWORD *)(*(_QWORD *)(v6 + 32) + 656), a3);
        *a4 = 1;
      }
    }
  }
  return result;
}

- (void)webViewDidCommitCompositingLayerChanges:(id)a3
{
  if ((*((_BYTE *)self + 965) & 1) != 0)
    -[UIWebDocumentView _updateSubviewCaches](self, "_updateSubviewCaches", a3);
  -[UIWebDocumentView _reshapePlugInViews](self, "_reshapePlugInViews", a3);
}

- (void)_setSubviewCachesNeedUpdate:(BOOL)a3
{
  *((_BYTE *)self + 965) = *((_BYTE *)self + 965) & 0xFE | a3;
}

- (id)_collectAdditionalSubviews
{
  return 0;
}

- (void)_updateSubviewCaches
{

  self->_additionalSubviews = (NSArray *)-[UIWebDocumentView _collectAdditionalSubviews](self, "_collectAdditionalSubviews");
  -[UIWebDocumentView _setSubviewCachesNeedUpdate:](self, "_setSubviewCachesNeedUpdate:", 0);
}

- (BOOL)_shouldUpdateSubviewCachesForPlugins
{
  const __CFDictionary *plugInViews;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  plugInViews = self->_plugInViews;
  if (plugInViews)
  {
    plugInViews = (const __CFDictionary *)CFDictionaryGetCount(plugInViews);
    if (plugInViews)
    {
      v4 = (void *)-[__CFDictionary allValues](self->_plugInViews, "allValues");
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      plugInViews = (const __CFDictionary *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (plugInViews)
      {
        v5 = (uint64_t)plugInViews;
        v6 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v11 != v6)
              objc_enumerationMutation(v4);
            v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
            if (objc_msgSend(v8, "willProvidePluginLayer")
              && !-[NSArray containsObject:](self->_additionalSubviews, "containsObject:", v8))
            {
              LOBYTE(plugInViews) = 1;
              return (char)plugInViews;
            }
          }
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          LOBYTE(plugInViews) = 0;
          if (v5)
            continue;
          break;
        }
      }
    }
  }
  return (char)plugInViews;
}

- (id)subviews
{
  char v3;
  _BOOL4 v4;
  NSArray *v5;
  objc_super v7;

  v3 = *((_BYTE *)self + 965);
  if ((v3 & 1) == 0)
  {
    v4 = -[UIWebDocumentView _shouldUpdateSubviewCachesForPlugins](self, "_shouldUpdateSubviewCachesForPlugins");
    v3 = *((_BYTE *)self + 965);
    if (v4)
    {
      v3 |= 1u;
      *((_BYTE *)self + 965) = v3;
    }
  }
  if ((v3 & 1) != 0)
    -[UIWebDocumentView _updateSubviewCaches](self, "_updateSubviewCaches");
  v7.receiver = self;
  v7.super_class = (Class)UIWebDocumentView;
  v5 = -[UIView subviews](&v7, sel_subviews);
  if (-[NSArray count](self->_additionalSubviews, "count")
    && !-[UIWebDocumentView _isInspectorSearchingForNode](self, "_isInspectorSearchingForNode"))
  {
    return -[NSArray arrayByAddingObjectsFromArray:](self->_additionalSubviews, "arrayByAddingObjectsFromArray:", v5);
  }
  return v5;
}

- (void)webViewDidDrawTiles:(id)a3
{
  *((_BYTE *)self + 964) |= 0x80u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "webViewDidDrawTiles:", self);
}

- (void)_renderUnbufferedInContext:(CGContext *)a3
{
  WAKWindow *wakWindow;
  _BOOL8 v6;
  CALayer *contentLayersHostingLayer;
  CATransform3D v8;
  CGAffineTransform transform;
  CGRect ClipBoundingBox;

  if ((WebThreadIsCurrent() & 1) == 0)
    WebThreadLock();
  objc_msgSend((id)-[WAKWindow contentView](self->super._wakWindow, "contentView"), "viewWillDraw");
  WKGetCurrentGraphicsContext();
  WKSetCurrentGraphicsContext();
  wakWindow = self->super._wakWindow;
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  -[WAKWindow displayRect:](wakWindow, "displayRect:", ClipBoundingBox.origin.x, ClipBoundingBox.origin.y, ClipBoundingBox.size.width, ClipBoundingBox.size.height);
  WKSetCurrentGraphicsContext();
  v6 = -[CALayer isHidden](self->_contentLayersHostingLayer, "isHidden");
  -[CALayer setHidden:](self->_contentLayersHostingLayer, "setHidden:", 0);
  CGContextSaveGState(a3);
  contentLayersHostingLayer = self->_contentLayersHostingLayer;
  if (contentLayersHostingLayer)
    -[CALayer transform](contentLayersHostingLayer, "transform");
  else
    memset(&v8, 0, sizeof(v8));
  CATransform3DGetAffineTransform(&transform, &v8);
  CGContextConcatCTM(a3, &transform);
  -[CALayer renderInContext:](self->_contentLayersHostingLayer, "renderInContext:", a3);
  CGContextRestoreGState(a3);
  -[CALayer setHidden:](self->_contentLayersHostingLayer, "setHidden:", v6);
}

- (id)checkSpellingOfString:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!self->_textChecker)
    self->_textChecker = (UITextChecker *)-[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[UITextChecker _doneLoading](self->_textChecker, "_doneLoading"))
  {
    v6 = (void *)objc_msgSend(+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), "currentInputMode");
    if (objc_msgSend((id)objc_msgSend(v6, "multilingualLanguages"), "count"))
    {
      v7 = objc_msgSend(v6, "multilingualLanguages");
    }
    else
    {
      if (!objc_msgSend(v6, "primaryLanguage"))
      {
        v8 = MEMORY[0x1E0C9AA60];
LABEL_9:
        v9 = objc_msgSend(a3, "length");
        v10 = 0;
        do
        {
          v11 = -[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:languages:](self->_textChecker, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", a3, 0, v9, v10, 0, v8);
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
            break;
          v13 = v11;
          v14 = v12;
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11, v12));
          v10 = v13 + v14;
        }
        while (v10 < objc_msgSend(a3, "length"));
        return v5;
      }
      v16[0] = objc_msgSend(v6, "languageWithRegion");
      v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    }
    v8 = v7;
    goto LABEL_9;
  }
  return v5;
}

- (void)_reshapePlugInViews
{
  __CFDictionary *plugInViews;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  plugInViews = self->_plugInViews;
  if (plugInViews)
  {
    v3 = (void *)-[__CFDictionary allValues](plugInViews, "allValues");
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "reshape");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
}

- (void)redrawScaledDocument
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
  double v12;
  __int128 v13;
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
  float documentScale;
  _UIWebViewportHandler *viewportHandler;
  double v26;
  _OWORD v27[3];

  -[UIWebDocumentView _restoreFlattenedContentLayers](self, "_restoreFlattenedContentLayers");
  *((_BYTE *)self + 965) &= ~2u;
  WebThreadLock();
  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIWebDocumentView _zoomedDocumentScale](self, "_zoomedDocumentScale");
  v12 = v11;
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v27[0] = *MEMORY[0x1E0C9BAA8];
  v27[1] = v13;
  v27[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIWebTiledView setTransform:](self, "setTransform:", v27);
  v14 = round(v4);
  v15 = round(v6);
  -[_UIWebViewportHandler availableViewSize](self->_viewportHandler, "availableViewSize");
  v17 = round(v10);
  v19 = round(v18);
  if (v17 >= v19)
    v20 = v17;
  else
    v20 = v19;
  v21 = round(v8);
  v22 = round(v16);
  if (v21 >= v22)
    v23 = v21;
  else
    v23 = v22;
  *((_BYTE *)self + 962) |= 0x40u;
  -[UIWebDocumentView setFrame:](self, "setFrame:", v14, v15, v23, v20);
  documentScale = self->_documentScale;
  viewportHandler = self->_viewportHandler;
  if ((*((_BYTE *)self + 961) & 8) != 0)
  {
    -[_UIWebViewportHandler minimumScale](viewportHandler, "minimumScale");
    if (v12 > *(float *)&v26)
      *(float *)&v26 = v12;
  }
  else
  {
    -[_UIWebViewportHandler initialScale](viewportHandler, "initialScale");
  }
  -[UIWebDocumentView _setDocumentScale:](self, "_setDocumentScale:", v26);
  *((_BYTE *)self + 962) &= ~0x40u;
  if (self->_documentScale != documentScale)
  {
    -[UIWebDocumentView _updateScrollViewBoundaryZoomScales](self, "_updateScrollViewBoundaryZoomScales");
    -[UIWebTiledView removeForegroundTiles](self, "removeForegroundTiles");
    -[UIWebTiledView layoutTilesNow](self, "layoutTilesNow");
    -[UIWebDocumentView _reshapePlugInViews](self, "_reshapePlugInViews");
  }
  -[UIWebDocumentView updateInteractionElements](self, "updateInteractionElements");
}

- (void)updateInteractionElements
{
  UITextInputDelegate *v3;

  -[UITextInteractionAssistant setNeedsSelectionDisplayUpdate](self->_textSelectionAssistant, "setNeedsSelectionDisplayUpdate");
  if (-[UIWebDocumentView isEditing](self, "isEditing"))
  {
    v3 = -[UIWebDocumentView inputDelegate](self, "inputDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UITextInputDelegate layoutHasChanged](v3, "layoutHasChanged");
  }
}

- (void)willRotateInteractionSheet
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;

  p_interaction = &self->_interaction;
  if (self->_interaction.var0)
  {
    if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)-[UIWebRotatingAlertController willRotate](p_interaction->var0, "willRotate");
  }
}

- (void)didRotateInteractionSheet
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;

  p_interaction = &self->_interaction;
  if (self->_interaction.var0)
  {
    if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)-[UIWebRotatingAlertController didRotate](p_interaction->var0, "didRotate");
  }
}

- (void)sendOrientationEventForOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[WebFrame deviceOrientationChanged](-[WebView mainFrame](self->_webView, "mainFrame"), "deviceOrientationChanged");
  }
}

- (void)setShouldOnlyRecognizeGesturesOnActiveElements:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 964) = *((_BYTE *)self + 964) & 0xF7 | v3;
}

- (BOOL)shouldOnlyRecognizeGesturesOnActiveElements
{
  return (*((unsigned __int8 *)self + 964) >> 3) & 1;
}

- (void)setMediaPlaybackAllowsAirPlay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  -[WebPreferences setMediaPlaybackAllowsAirPlay:](-[WebView preferences](self->_webView, "preferences"), "setMediaPlaybackAllowsAirPlay:", v3);
}

- (BOOL)mediaPlaybackAllowsAirPlay
{
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  return -[WebPreferences mediaPlaybackAllowsAirPlay](-[WebView preferences](self->_webView, "preferences"), "mediaPlaybackAllowsAirPlay");
}

- (void)setAlwaysConstrainsScale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 961) = *((_BYTE *)self + 961) & 0xFD | v3;
}

- (BOOL)alwaysConstrainsScale
{
  return (*((unsigned __int8 *)self + 961) >> 1) & 1;
}

- (void)setDoubleTapEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIGestureRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:");
  -[UIGestureRecognizer setEnabled:](self->_twoFingerDoubleTapGestureRecognizer, "setEnabled:", v3);
}

- (BOOL)isDoubleTapEnabled
{
  return -[UIGestureRecognizer isEnabled](self->_doubleTapGestureRecognizer, "isEnabled");
}

- (BOOL)_handleSingleTapZoomPreClickAtLocation:(CGPoint)a3
{
  if ((*((_BYTE *)self + 961) & 4) == 0 || (*((_BYTE *)self + 961) & 0x20) != 0)
    return 0;
  else
    return _UIWebSingleTapZoomAtLocationPreClick(self, a3.x, a3.y);
}

- (void)_handleSingleTapZoomPostClickAtLocation:(CGPoint)a3
{
  if ((*((_BYTE *)self + 961) & 4) != 0 && (*((_BYTE *)self + 961) & 0x20) == 0)
    _UIWebSingleTapZoomAtLocationPostClick(self, a3.x, a3.y);
}

- (void)_handleDoubleTapAtLocation:(CGPoint)a3
{
  if ((*((_BYTE *)self + 961) & 4) != 0 && (*((_BYTE *)self + 961) & 0x20) == 0)
    _UIWebDoubleTapAtLocation(self, a3.x, a3.y);
}

- (void)_handleTwoFingerDoubleTapAtLocation:(CGPoint)a3
{
  if ((*((_BYTE *)self + 961) & 4) != 0 && (*((_BYTE *)self + 961) & 0x20) == 0)
    zoomToMinimumScaleCenteringOnLocation(self, a3.x, a3.y);
}

- (CGRect)doubleTapRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_doubleTapRect.origin.x;
  y = self->_doubleTapRect.origin.y;
  width = self->_doubleTapRect.size.width;
  height = self->_doubleTapRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)doubleTapRectIsReplaced
{
  return *((_BYTE *)self + 962) & 1;
}

- (void)assistFormNode:(id)a3
{
  NSLog(CFSTR("No web forms support. Please use UIWebView in place of UIWebDocumentView."), a2, a3);
}

- (void)_focusAndAssistFormNode:(id)a3
{
  WebThreadLock();
  objc_msgSend(a3, "focus");
}

- (id)formElement
{
  return 0;
}

- (id)textFormElement
{
  return 0;
}

- (void)setIsStandaloneEditableView:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 962) = *((_BYTE *)self + 962) & 0xFD | v3;
}

- (BOOL)isStandaloneEditableView
{
  return (*((unsigned __int8 *)self + 962) >> 1) & 1;
}

- (void)setStandaloneEditingElement:(id)a3
{
  DOMHTMLElement *standaloneEditingElement;

  standaloneEditingElement = self->_standaloneEditingElement;
  self->_standaloneEditingElement = (DOMHTMLElement *)a3;

}

- (id)standaloneEditingElement
{
  return self->_standaloneEditingElement;
}

- (void)setIsWidgetEditingView:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 962) = *((_BYTE *)self + 962) & 0xFB | v3;
}

- (BOOL)isWidgetEditingView
{
  return (*((unsigned __int8 *)self + 962) >> 2) & 1;
}

- (BOOL)updateKeyboardStateOnResponderChanges
{
  id m_parentTextView;
  BOOL result;

  result = 0;
  if ((*((_BYTE *)self + 960) & 8) == 0)
  {
    if ((*((_BYTE *)self + 962) & 4) != 0)
      return 1;
    if ((*((_BYTE *)self + 962) & 2) != 0)
      return 1;
    m_parentTextView = self->m_parentTextView;
    if (m_parentTextView)
    {
      if ((objc_msgSend(m_parentTextView, "isEditable") & 1) != 0)
        return 1;
    }
  }
  return result;
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  id m_parentTextView;
  BOOL v5;
  objc_super v6;

  m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
    return objc_msgSend(m_parentTextView, "becomeFirstResponder");
  v6.receiver = self;
  v6.super_class = (Class)UIWebDocumentView;
  if (!-[UIView becomeFirstResponder](&v6, sel_becomeFirstResponder))
    return 0;
  if (self->_learnSession)
    -[UIWebDocumentView _removeShortcutController:](self, "_removeShortcutController:", 0);
  WebThreadLock();
  *((_BYTE *)self + 964) |= 0x10u;
  -[WAKWindow makeFirstResponder:](self->super._wakWindow, "makeFirstResponder:", -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView"));
  v5 = 1;
  -[UITextInteractionAssistant setSelectionDisplayVisible:](self->_textSelectionAssistant, "setSelectionDisplayVisible:", 1);
  -[UITextInteractionAssistant activateSelection](self->_textSelectionAssistant, "activateSelection");
  *((_BYTE *)self + 964) &= ~0x10u;
  return v5;
}

- (void)deferredBecomeFirstResponder
{
  if (self->m_parentTextView)
    self = (UIWebDocumentView *)self->m_parentTextView;
  -[UIWebDocumentView becomeFirstResponder](self, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  UIWebDocumentView *v3;
  id m_parentTextView;
  BOOL v5;
  objc_super v7;

  v3 = self;
  if ((*((_BYTE *)self + 964) & 1) != 0 || !-[UIView isFirstResponder](self, "isFirstResponder"))
    return 1;
  if (!-[UIWebDocumentView canResignFirstResponder](self, "canResignFirstResponder"))
    return 0;
  m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
  {
    if (!objc_msgSend(m_parentTextView, "canResignFirstResponder"))
      return 0;
  }
  *((_BYTE *)self + 964) |= 1u;
  v5 = 1;
  -[UIWebDocumentView cancelInteractionWithImmediateDisplay:](self, "cancelInteractionWithImmediateDisplay:", 1);
  v7.receiver = self;
  v7.super_class = (Class)UIWebDocumentView;
  -[UIResponder resignFirstResponder](&v7, sel_resignFirstResponder);
  objc_msgSend(self->m_parentTextView, "resignFirstResponder");
  -[UIWebDocumentView _removeDefinitionController:](self, "_removeDefinitionController:", 1);
  -[UIWebDocumentView _removeShareController:](self, "_removeShareController:", 1);
  -[UIWebDocumentView clearWKFirstResponder](self, "clearWKFirstResponder");
  -[UITextInteractionAssistant resignedFirstResponder](self->_textSelectionAssistant, "resignedFirstResponder");
  *((_BYTE *)self + 964) &= ~1u;
  return v5;
}

- (id)_responderForBecomeFirstResponder
{
  id v3;
  void *v4;

  WebThreadLock();
  v3 = -[WebView editingDelegate](self->_webView, "editingDelegate");
  if (!v3)
    return self;
  v4 = v3;
  if ((objc_msgSend(v3, "__isKindOfUIResponder") & 1) == 0)
    return self;
  return v4;
}

- (BOOL)makeWKFirstResponder
{
  if (self->_learnSession)
    -[UIWebDocumentView _removeShortcutController:](self, "_removeShortcutController:", 0);
  WebThreadLock();
  return -[WAKWindow makeFirstResponder:](self->super._wakWindow, "makeFirstResponder:", -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView"));
}

- (BOOL)clearWKFirstResponder
{
  WAKWindow *wakWindow;
  objc_class *v4;
  objc_method *InstanceMethod;
  IMP Implementation;
  objc_class *v7;
  objc_method *v8;
  IMP v9;

  WebThreadLock();
  if (_MergedGlobals_25_1[0] != 1)
  {
    v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel_resignFirstResponder);
    Implementation = method_getImplementation(InstanceMethod);
    v7 = (objc_class *)objc_msgSend((id)objc_opt_class(), "superclass");
    v8 = class_getInstanceMethod(v7, sel_resignFirstResponder);
    v9 = method_getImplementation(v8);
    _MergedGlobals_25_1[0] = 1;
    byte_1ECD7A0C1 = Implementation != v9;
    if (Implementation != v9)
      goto LABEL_3;
LABEL_5:
    wakWindow = (WAKWindow *)-[WAKWindow firstResponder](self->super._wakWindow, "firstResponder");
    goto LABEL_6;
  }
  if (!byte_1ECD7A0C1)
    goto LABEL_5;
LABEL_3:
  wakWindow = self->super._wakWindow;
LABEL_6:
  -[WAKWindow resignFirstResponder](wakWindow, "resignFirstResponder");
  return 1;
}

- (void)ensureSelection
{
  DOMDocument *v3;
  uint64_t v4;
  DOMHTMLElement *standaloneEditingElement;
  DOMRange *v6;

  WebThreadLock();
  if (-[UIWebDocumentView makeWKFirstResponder](self, "makeWKFirstResponder"))
  {
    if (!-[UIWebDocumentView hasSelection](self, "hasSelection"))
    {
      v3 = -[WebFrame DOMDocument](-[WebView mainFrame](self->_webView, "mainFrame"), "DOMDocument");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = -[DOMDocument body](v3, "body");
        if (self->_standaloneEditingElement)
          standaloneEditingElement = self->_standaloneEditingElement;
        else
          standaloneEditingElement = (DOMHTMLElement *)v4;
        if (-[DOMHTMLElement isContentEditable](standaloneEditingElement, "isContentEditable"))
        {
          v6 = -[DOMDocument createRange](v3, "createRange");
          -[DOMRange setStart:offset:](v6, "setStart:offset:", standaloneEditingElement, 0);
          -[DOMRange setEnd:offset:](v6, "setEnd:offset:", standaloneEditingElement, 0);
          -[WebView setSelectedDOMRange:affinity:](self->_webView, "setSelectedDOMRange:affinity:", v6, 1);
          -[DOMRange detach](v6, "detach");
        }
      }
    }
  }
}

- (void)setInteractionAssistantGestureRecognizers
{
  UITextInteractionAssistant *textSelectionAssistant;

  if (self->m_parentTextView)
    textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant");
  else
    textSelectionAssistant = self->_textSelectionAssistant;
  -[UITextInteractionAssistant setGestureRecognizers](textSelectionAssistant, "setGestureRecognizers");
}

- (void)_undoManagerDidUndo:(id)a3
{
  if (pthread_main_np())
  {
    if (-[UIView isFirstResponder](self, "isFirstResponder")
      || objc_msgSend(self->m_parentTextView, "isFirstResponder"))
    {
      objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "updateForChangedSelection");
      -[UIWebDocumentView setInteractionAssistantGestureRecognizers](self, "setInteractionAssistantGestureRecognizers");
    }
  }
  else
  {
    -[UIWebDocumentView performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, a3, 0);
  }
}

- (void)_undoManagerDidRedo:(id)a3
{
  if (pthread_main_np())
  {
    if (-[UIView isFirstResponder](self, "isFirstResponder")
      || objc_msgSend(self->m_parentTextView, "isFirstResponder"))
    {
      objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "updateForChangedSelection");
      -[UIWebDocumentView setInteractionAssistantGestureRecognizers](self, "setInteractionAssistantGestureRecognizers");
    }
  }
  else
  {
    -[UIWebDocumentView performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, a3, 0);
  }
}

- (id)undoManagerForWebView:(id)a3
{
  id result;
  void *v5;

  result = self->_undoManager;
  if (!result)
  {
    self->_undoManager = objc_alloc_init(WebThreadSafeUndoManager);
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__undoManagerDidUndo_, *MEMORY[0x1E0CB33B8], self->_undoManager);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__undoManagerDidRedo_, *MEMORY[0x1E0CB33B0], self->_undoManager);
    return self->_undoManager;
  }
  return result;
}

- (id)undoManager
{
  return -[UIWebDocumentView undoManagerForWebView:](self, "undoManagerForWebView:", self->_webView);
}

- (id)_parentTextView
{
  return self->m_parentTextView;
}

- (void)_setParentTextView:(id)a3
{
  self->m_parentTextView = a3;
}

+ (id)standardTextViewPreferences
{
  id result;

  result = (id)standardTextViewPreferences_sTextViewPreferences;
  if (!standardTextViewPreferences_sTextViewPreferences)
  {
    WebThreadLock();
    standardTextViewPreferences_sTextViewPreferences = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9780]), "initWithIdentifier:", CFSTR("com.apple.uikit.text"));
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setAutosaves:", 0);
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setJavaEnabled:", 0);
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setJavaScriptEnabled:", 0);
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setPlugInsEnabled:", 0);
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setDatabasesEnabled:", 0);
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setLocalStorageEnabled:", 0);
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setOfflineWebApplicationCacheEnabled:", 0);
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setDiskImageCacheEnabled:", 0);
    objc_msgSend((id)standardTextViewPreferences_sTextViewPreferences, "setAcceleratedDrawingEnabled:", 0);
    return (id)standardTextViewPreferences_sTextViewPreferences;
  }
  return result;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  WebThreadLock();
  -[WebView setContinuousSpellCheckingEnabled:](self->_webView, "setContinuousSpellCheckingEnabled:", v3);
}

- (id)delegate
{
  return 0;
}

- (BOOL)handleKeyTextCommandForCurrentEvent
{
  return -[UIKeyboardImpl handleKeyTextCommandForCurrentEvent](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "handleKeyTextCommandForCurrentEvent");
}

- (BOOL)handleKeyAppCommandForCurrentEvent
{
  return -[UIKeyboardImpl handleKeyAppCommandForCurrentEvent](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "handleKeyAppCommandForCurrentEvent");
}

- (void)addInputString:(id)a3 withFlags:(unint64_t)a4
{
  -[UIKeyboardImpl addInputString:withFlags:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "addInputString:withFlags:", a3, a4);
}

- (void)addInputString:(id)a3
{
  -[UIWebDocumentView addInputString:withFlags:](self, "addInputString:withFlags:", a3, 0);
}

- (void)deleteFromInput
{
  -[UIKeyboardImpl deleteFromInputWithFlags:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "deleteFromInputWithFlags:", 0);
}

- (void)deleteFromInputWithFlags:(unint64_t)a3
{
  -[UIKeyboardImpl deleteFromInputWithFlags:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "deleteFromInputWithFlags:", a3);
}

- (void)disableClearsOnInsertion
{
  if (self->m_parentTextView)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->m_parentTextView, "disableClearsOnInsertion");
  }
}

- (void)deleteBackward
{
  if (+[UIDictationController shouldDeleteBackward](UIDictationController, "shouldDeleteBackward"))
  {
    WebThreadLock();
    -[WebView deleteBackward:](self->_webView, "deleteBackward:", self);
    -[UIWebDocumentView disableClearsOnInsertion](self, "disableClearsOnInsertion");
  }
}

- (void)insertText:(id)a3
{
  if (+[UIDictationController shouldInsertText:](UIDictationController, "shouldInsertText:"))
  {
    WebThreadLock();
    -[WebView insertText:](self->_webView, "insertText:", a3);
    -[UIWebDocumentView disableClearsOnInsertion](self, "disableClearsOnInsertion");
  }
}

- (BOOL)isEditingSingleLineElement
{
  if (!-[UIWebDocumentView formElement](self, "formElement"))
    return -[UIWebDocumentView isSingleLineDocument](self, "isSingleLineDocument");
  -[UIWebDocumentView formElement](self, "formElement");
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  WebView *webView;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  if (!-[UIWebDocumentView isEditingSingleLineElement](self, "isEditingSingleLineElement")
    || (a3 = (id)objc_msgSend(a3, "singleLineResult"), objc_msgSend((id)objc_msgSend(a3, "phrases"), "count")))
  {
    v8 = objc_msgSend(a3, "bestText");
    if (-[UIWebDocumentView keyboardInput:shouldInsertText:isMarkedText:](self, "keyboardInput:shouldInsertText:isMarkedText:", objc_msgSend(v7, "delegate"), v8, 0))
    {
      WebThreadLock();
      -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
      v9 = +[UIDictationUtilities metadataDictionaryForCorrectionIdentifier:](UIDictationUtilities, "metadataDictionaryForCorrectionIdentifier:", a4);
      webView = self->_webView;
      v11 = v8;
      v12[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      -[WebView insertDictationPhrases:metadata:](webView, "insertDictationPhrases:metadata:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), v9);
      -[UITextInteractionAssistant setSelectionDisplayVisible:](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "setSelectionDisplayVisible:", 1);
      -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
      if (-[UIWebDocumentView rangeToRestoreAfterDictation](self, "rangeToRestoreAfterDictation"))
      {
        -[UIWebDocumentView setSelectedDOMRange:affinityDownstream:](self, "setSelectedDOMRange:affinityDownstream:", -[UIWebDocumentView rangeToRestoreAfterDictation](self, "rangeToRestoreAfterDictation"), 1);
        -[UIWebDocumentView setRangeToRestoreAfterDictation:](self, "setRangeToRestoreAfterDictation:", 0);
      }
    }
  }
}

- (id)metadataDictionariesForDictationResults
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v10 = 0;
  v11 = 0;
  WebThreadLock();
  -[WebFrame getDictationResultRanges:andMetadatas:](-[WebView mainFrame](self->_webView, "mainFrame"), "getDictationResultRanges:andMetadatas:", &v11, &v10);
  result = v10;
  if (v10)
  {
    result = (id)objc_msgSend(v10, "count");
    if (result)
    {
      v4 = objc_msgSend(v10, "count");
      if (v4)
      {
        v5 = v4;
        for (i = 0; i != v5; ++i)
        {
          v7 = (void *)objc_msgSend(v10, "objectAtIndex:", i, v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = objc_msgSend(v11, "objectAtIndex:", i);
            if (v8)
            {
              v9 = v8;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v7, "setObject:forKey:", -[WebFrame stringForRange:](-[WebView mainFrame](self->_webView, "mainFrame"), "stringForRange:", v9), CFSTR("fullText"));
            }
          }
        }
      }
      return v10;
    }
  }
  return result;
}

- (id)dictationResultMetadataForRange:(id)a3
{
  WebThreadLock();
  return (id)-[WebFrame dictationResultMetadataForRange:](-[WebView mainFrame](self->_webView, "mainFrame"), "dictationResultMetadataForRange:", a3);
}

- (BOOL)hasRangedSelection
{
  return -[UIWebDocumentView selectionState](self, "selectionState") == 2;
}

- (BOOL)_textPlaceholderHasBeenRemoved
{
  id v3;
  DOMElement *v4;
  BOOL v5;

  v3 = -[UIWebDocumentView formElement](self, "formElement");
  v4 = -[UIWebTextPlaceholder element](self->_textPlaceholder, "element");
  if (v3)
    v5 = -[DOMElement parentNode](v4, "parentNode") != 0;
  else
    v5 = -[DOMElement inDocument](v4, "inDocument");
  return !v5;
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  WebThreadLock();
  if (-[UIWebDocumentView hasRangedSelection](self, "hasRangedSelection"))
    -[UIWebDocumentView deleteBackward](self, "deleteBackward");
  return -[UIWebDocumentView _insertTextPlaceholderWithSize:](self, "_insertTextPlaceholderWithSize:", width, height);
}

- (void)removeTextPlaceholder:(id)a3
{
  -[UIWebDocumentView _removeTextPlaceholder:willInsertResult:](self, "_removeTextPlaceholder:willInsertResult:", a3, 0);
}

- (id)insertDictationResultPlaceholder
{
  WebThreadLock();
  if (-[UIWebDocumentView hasRangedSelection](self, "hasRangedSelection"))
    -[UIWebDocumentView deleteBackward](self, "deleteBackward");
  -[UIWebDocumentView _sizeForDictationResultPlaceholder](self, "_sizeForDictationResultPlaceholder");
  return -[UIWebDocumentView _insertTextPlaceholderWithSize:](self, "_insertTextPlaceholderWithSize:");
}

- (CGSize)_sizeForDictationResultPlaceholder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  float v7;
  double v8;
  UITextSelection *v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  CGSize result;

  WebThreadLock();
  v3 = -[UIWebDocumentView isCaretInEmptyParagraph](self, "isCaretInEmptyParagraph");
  v4 = (void *)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "DOMDocument");
  v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "getComputedStyle:pseudoElement:", objc_msgSend(v4, "body"), &stru_1E16EDF20), "getPropertyValue:", CFSTR("line-height"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("normal")))
  {
    objc_msgSend(-[UIWebDocumentView fontForCaretSelection](self, "fontForCaretSelection"), "lineHeight");
  }
  else
  {
    objc_msgSend(v5, "floatValue");
    v6 = v7;
  }
  if (v3)
    v8 = v6 + 3.0;
  else
    v8 = v6;
  v9 = -[UITextInteractionAssistant activeSelection](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "activeSelection");
  -[UITextSelection caretRectAtEndOfDocument](v9, "caretRectAtEndOfDocument");
  v12 = v11;
  if (v8 > v10 + v10 || v8 < 0.5)
    v8 = v10;
  -[UITextSelection caretRectAtBeginOfDocument](v9, "caretRectAtBeginOfDocument");
  dictatingIntoEmptyDocument = v14 == v12;
  +[UIDictationLandingView widthForLineHeight:](UIDictationLandingView, "widthForLineHeight:", v8);
  v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

- (id)_insertTextPlaceholderWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  UIWebTextPlaceholder *v6;
  void *v7;
  void *v8;
  WebView *webView;
  uint64_t v10;
  id m_parentTextView;
  void *v12;
  _QWORD v14[5];

  height = a3.height;
  width = a3.width;
  WebThreadLock();
  v6 = +[UIWebTextPlaceholder placeholderWithWebDocumentView:](UIWebTextPlaceholder, "placeholderWithWebDocumentView:", self);
  self->_textPlaceholder = v6;
  v7 = (void *)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "DOMDocument"), "createElement:", CFSTR("img"));
  -[UIWebTextPlaceholder setElement:](v6, "setElement:", v7);
  objc_msgSend(v7, "setAttribute:value:", CFSTR("style"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("width: %.0fpx; height: %.0fpx; max-width: %.0fpx; max-height: %.0fpx; border: 1px solid red; display:inline-block; border: none; outline: none; opacity: 0; vertical-align: bottom;"),
      *(_QWORD *)&width,
      *(_QWORD *)&height,
      *(_QWORD *)&width,
      *(_QWORD *)&height));
  objc_msgSend(v7, "setAttribute:value:", CFSTR("class"), CFSTR("-webkit-dictation-result-placeholder"));
  objc_msgSend(-[UIWebDocumentView selectedDOMRange](self, "selectedDOMRange"), "insertNode:", v7);
  if (-[UIWebDocumentView formElement](self, "formElement"))
    objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "hidePlaceholder");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  webView = self->_webView;
  v10 = *MEMORY[0x1E0DD9898];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__UIWebDocumentView__insertTextPlaceholderWithSize___block_invoke;
  v14[3] = &unk_1E16ECB98;
  v14[4] = self;
  self->_textPlaceholderRemovalObserver = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v10, webView, 0, v14);
  -[WebFrame forceLayoutAdjustingViewSize:](-[WebView mainFrame](self->_webView, "mainFrame"), "forceLayoutAdjustingViewSize:", 1);
  m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
    objc_msgSend(m_parentTextView, "webViewDidChange:", 0);
  v12 = (void *)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "DOMDocument"), "createRange");
  objc_msgSend(v12, "setStartAfter:", v7);
  objc_msgSend(v12, "setEndAfter:", v7);
  -[UIWebDocumentView setSelectedDOMRange:affinityDownstream:](self, "setSelectedDOMRange:affinityDownstream:", v12, 1);
  -[UITextInteractionAssistant selectionChanged](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "selectionChanged");
  -[UIWebDocumentView keyboardInputChanged:](self, "keyboardInputChanged:", self);
  -[UIWebDocumentView disableClearsOnInsertion](self, "disableClearsOnInsertion");
  return v6;
}

uint64_t __52__UIWebDocumentView__insertTextPlaceholderWithSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  WebThreadLock();
  result = objc_msgSend(*(id *)(a1 + 32), "_textPlaceholderHasBeenRemoved");
  if ((_DWORD)result)
    return -[UIDictationController cancelDictation](+[UIDictationController sharedInstance](UIDictationController, "sharedInstance"), "cancelDictation");
  return result;
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  if (self->_textPlaceholder == a3)
  {
    objc_msgSend((id)objc_msgSend(a3, "element"), "boundingBoxUsingTransforms");
    -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
    v5 = v8;
    v6 = v9;
    v7 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v11 = v4 + -3.0;
  if (IsMobileNotes())
  {
    objc_msgSend((id)objc_msgSend(-[UIView _window](self, "_window"), "screen"), "scale");
    if (v12 > 1.0)
      v11 = v11 + 7.5;
    else
      v11 = v11 + 8.0;
  }
  v13 = v7 + 3.0;
  v14 = v5;
  v15 = v11;
  v16 = v6;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_finishedUsingTextPlaceholder
{
  self->_textPlaceholderRemovalObserver = 0;

  self->_textPlaceholder = 0;
}

- (void)_removeTextPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  _BOOL4 v4;
  UIWebTextPlaceholder *textPlaceholder;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  id m_parentTextView;
  void *v15;

  v4 = a4;
  WebThreadLock();
  if (v4)
    -[UITextInteractionAssistant setSelectionDisplayVisible:](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "setSelectionDisplayVisible:", 0);
  textPlaceholder = self->_textPlaceholder;
  if (textPlaceholder)
    v8 = textPlaceholder == a3;
  else
    v8 = 0;
  if (v8 && self->_textPlaceholderRemovalObserver)
  {
    if (-[UIWebDocumentView formElement](self, "formElement"))
      objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "showPlaceholderIfNecessary");
    dictatingIntoEmptyDocument = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_textPlaceholderRemovalObserver);
    if (!-[UIWebDocumentView _textPlaceholderHasBeenRemoved](self, "_textPlaceholderHasBeenRemoved"))
    {
      v9 = (void *)objc_msgSend(a3, "element");
      v10 = (void *)objc_msgSend(v9, "previousSibling");
      for (i = 0; v10; v10 = (void *)objc_msgSend(v10, "previousSibling"))
        i = (i + 1);
      v12 = (void *)objc_msgSend(v9, "parentNode");
      v13 = (void *)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectedDOMRange");
      if ((void *)objc_msgSend(v13, "startContainer") != v12
        || objc_msgSend(v13, "startOffset") != (_DWORD)i + 1)
      {
        -[UIWebDocumentView setRangeToRestoreAfterDictation:](self, "setRangeToRestoreAfterDictation:", v13);
      }
      objc_msgSend(v12, "removeChild:", v9);
      if (!v4)
      {
        -[WebFrame forceLayoutAdjustingViewSize:](-[WebView mainFrame](self->_webView, "mainFrame"), "forceLayoutAdjustingViewSize:", 1);
        m_parentTextView = self->m_parentTextView;
        if (m_parentTextView)
          objc_msgSend(m_parentTextView, "webViewDidChange:", 0);
        -[UIWebDocumentView keyboardInputChanged:](self, "keyboardInputChanged:", self);
      }
      v15 = (void *)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "DOMDocument"), "createRange");
      objc_msgSend(v15, "setStart:offset:", v12, i);
      objc_msgSend(v15, "setEnd:offset:", v12, i);
      -[UIWebDocumentView setSelectedDOMRange:affinityDownstream:](self, "setSelectedDOMRange:affinityDownstream:", v15, 1);
    }
    -[UIWebDocumentView _finishedUsingTextPlaceholder](self, "_finishedUsingTextPlaceholder");
  }
}

- (id)dictationInterpretations
{
  return (id)-[WebFrame interpretationsForCurrentRoot](-[WebView mainFrame](self->_webView, "mainFrame"), "interpretationsForCurrentRoot");
}

- (void)clearMarkedText
{
  -[UIWebDocumentView setMarkedText:selectedRange:](self, "setMarkedText:selectedRange:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;

  -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
  -[UIWebDocumentView clearMarkedText](self, "clearMarkedText");
  WebThreadLock();
  v7 = -[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame");
  v8 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", a3);
  objc_msgSend(v7, "selectWithoutClosingTypingNSRange:", v8, v9);
  if (objc_msgSend(a4, "length"))
    -[UIWebDocumentView insertText:](self, "insertText:", a4);
  else
    -[UIWebDocumentView deleteBackward](self, "deleteBackward");
  -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
}

- (void)replaceCurrentWordWithText:(id)a3
{
  -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
  -[UIWebDocumentView clearMarkedText](self, "clearMarkedText");
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "expandSelectionToWordContainingCaretSelection");
  if (objc_msgSend(a3, "length"))
    -[UIWebDocumentView insertText:](self, "insertText:", a3);
  else
    -[UIWebDocumentView deleteBackward](self, "deleteBackward");
  -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[UIWebDocumentView ensureSelection](self, "ensureSelection");
  WebThreadLock();
  -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setMarkedText:selectedRange:", a3, location, length);
  -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
}

- (void)confirmMarkedText:(id)a3
{
  WebThreadLock();
  -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "confirmMarkedText:", a3);
  -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
  -[UIWebDocumentView setInteractionAssistantGestureRecognizers](self, "setInteractionAssistantGestureRecognizers");
}

- (unsigned)characterInRelationToCaretSelection:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "characterInRelationToCaretSelection:", v3);
}

- (unsigned)characterAfterCaretSelection
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "characterAfterCaretSelection");
}

- (id)fontForCaretSelection
{
  char v4;

  WebThreadLock();
  v4 = 0;
  return (id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "fontForSelection:", &v4);
}

- (id)textColorForCaretSelection
{
  id m_parentTextView;

  m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
    return (id)objc_msgSend(m_parentTextView, "textColor");
  else
    return +[UIColor blackColor](UIColor, "blackColor");
}

- (id)rectsForNSRange:(_NSRange)a3
{
  void *v3;
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  length = a3.length;
  location = a3.location;
  WebThreadLock();
  v7 = -[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame");
  v3 = (void *)objc_msgSend(v7, "selectionRectsForRange:", objc_msgSend(v7, "convertNSRangeToDOMRange:", location, length));
  v8 = (void *)objc_msgSend(v7, "documentView");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "rect");
        objc_msgSend(v8, "convertRect:toView:", 0);
        objc_msgSend(v13, "setRect:");
      }
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v3;
}

- (int)wordOffsetInRange:(id)a3
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "wordOffsetInRange:", a3);
}

- (void)replaceSelectionWithWebArchive:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;

  v5 = a5;
  v6 = a4;
  WebThreadLock();
  -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "_replaceSelectionWithWebArchive:selectReplacement:smartReplace:", a3, v6, v5);
  -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
}

- (_NSRange)selectionRange
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  WebThreadLock();
  v3 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "_selectedNSRange");
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)selectedDOMRange
{
  WebThreadLock();
  return (id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectedDOMRange");
}

- (void)setSelectedDOMRange:(id)a3 affinityDownstream:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  if (a3)
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "startContainer"), "ownerDocument"), "webFrame"), "setSelectedDOMRange:affinity:closeTyping:", a3, v4, 1);
  else
    objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "clearSelection");
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (id)rangeByMovingCurrentSelection:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  WebThreadLock();
  return (id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "rangeByMovingCurrentSelection:", v3);
}

- (id)rangeByExtendingCurrentSelection:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  WebThreadLock();
  return (id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "rangeByExtendingCurrentSelection:", v3);
}

- (void)extendCurrentSelection:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  v5 = -[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame");
  objc_msgSend(v5, "setSelectedDOMRange:affinity:closeTyping:", objc_msgSend(v5, "rangeByExtendingCurrentSelection:", v3), (int)v3 >= 0, 0);
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (BOOL)hasSelection
{
  if (pthread_main_np())
    WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "hasSelection");
}

- (BOOL)selectionAtDocumentStart
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionAtDocumentStart");
}

- (BOOL)selectionAtWordStart
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionAtWordStart");
}

- (void)selectAll
{
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "_selectAll");
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (void)setText:(id)a3
{
  uint64_t v5;

  -[UIView superview](self, "superview");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView setText:](-[UIView superview](self, "superview"), "setText:", a3);
  }
  else
  {
    WebThreadLock();
    -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
    objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "expandSelectionToElementContainingCaretSelection");
    v5 = objc_msgSend(-[UIWebDocumentView textInputTraits](self, "textInputTraits"), "textTrimmingSet");
    if (v5)
      a3 = (id)objc_msgSend(a3, "_stringByTrimmingCharactersInCFCharacterSet:", v5);
    -[UIWebDocumentView insertText:](self, "insertText:", a3);
    -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
  }
}

- (id)text
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[UIView superview](self, "superview");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)-[UIView text](-[UIView superview](self, "superview"), "text");
  WebThreadLock();
  v4 = -[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame");
  v5 = (void *)objc_msgSend(v4, "DOMDocument");
  v6 = objc_msgSend(v5, "documentElement");
  if (!v6)
    return &stru_1E16EDF20;
  v7 = (void *)v6;
  v8 = (void *)objc_msgSend(v5, "createRange");
  objc_msgSend(v8, "setStart:offset:", v7, 0);
  objc_msgSend(v8, "setEnd:offset:", v7, objc_msgSend((id)objc_msgSend(v7, "childNodes"), "length"));
  v9 = (void *)objc_msgSend(v4, "stringForRange:", v8);
  v10 = objc_msgSend(-[UIWebDocumentView textInputTraits](self, "textInputTraits"), "textTrimmingSet");
  if (v10)
    return (id)objc_msgSend(v9, "_stringByTrimmingCharactersInCFCharacterSet:", v10);
  return v9;
}

- (BOOL)hasContent
{
  WebFrame *v3;
  char v4;

  WebThreadLockFromAnyThread();
  v3 = -[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame");
  if (!v3)
    v3 = -[WebView mainFrame](self->_webView, "mainFrame");
  v4 = -[WebFrame focusedNodeHasContent](v3, "focusedNodeHasContent");
  WebThreadUnlockFromAnyThread();
  return v4;
}

- (void)setCaretChangeListener:(id)a3
{
  WebThreadLock();
  -[WebView setCaretChangeListener:](self->_webView, "setCaretChangeListener:", a3);
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;

  if (self->m_parentTextView && (length = a4.length, location = a4.location, (objc_opt_respondsToSelector() & 1) != 0))
    return objc_msgSend(self->m_parentTextView, "keyboardInput:shouldReplaceTextInRange:replacementText:", a3, location, length, a5);
  else
    return 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  _BOOL8 v5;
  id m_parentTextView;
  id v9;

  v5 = a5;
  if (self->m_parentTextView)
  {
    m_parentTextView = self->m_parentTextView;
    return objc_msgSend(m_parentTextView, "keyboardInput:shouldInsertText:isMarkedText:", a3, a4, v5);
  }
  v9 = -[UIWebDocumentView delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    m_parentTextView = v9;
    return objc_msgSend(m_parentTextView, "keyboardInput:shouldInsertText:isMarkedText:", a3, a4, v5);
  }
  return 1;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v5;

  if (self->m_parentTextView)
    return objc_msgSend(self->m_parentTextView, "keyboardInputShouldDelete:", a3);
  v5 = -[UIWebDocumentView delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v5, "keyboardInputChanged:", a3);
  else
    return 1;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id m_parentTextView;
  id v6;

  m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
    objc_msgSend(m_parentTextView, "keyboardInputChanged:", a3);
  v6 = -[UIWebDocumentView delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "keyboardInputChanged:", a3);
  return 1;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  id m_parentTextView;
  id v6;

  m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
    objc_msgSend(m_parentTextView, "keyboardInputChangedSelection:", a3);
  v6 = -[UIWebDocumentView delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "keyboardInputChangedSelection:", a3);
}

- (id)automaticallySelectedOverlay
{
  UIWebDocumentView *v2;
  char v3;

  v2 = self;
  if (self->m_parentTextView
    && (v3 = objc_opt_respondsToSelector(), v2 = (UIWebDocumentView *)v2->m_parentTextView, (v3 & 1) != 0))
  {
    return -[UIWebDocumentView automaticallySelectedOverlay](v2, "automaticallySelectedOverlay");
  }
  else
  {
    return v2;
  }
}

- (void)setBottomBufferHeight:(double)a3
{
  id m_parentTextView;

  m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
    objc_msgSend(m_parentTextView, "setBottomBufferHeight:", a3);
}

- (BOOL)requiresKeyEvents
{
  return 0;
}

- (void)handleKeyWebEvent:(id)a3
{
  WebThreadLock();
  -[WebFrame _handleKeyEvent:](-[WebView mainFrame](self->_webView, "mainFrame"), "_handleKeyEvent:", a3);
}

- (void)setPaused:(BOOL)a3
{
  -[UIWebDocumentView setPaused:withEvents:](self, "setPaused:withEvents:", a3, 0);
}

- (void)setPaused:(BOOL)a3 withEvents:(BOOL)a4
{
  WebThreadRun();
}

uint64_t __42__UIWebDocumentView_setPaused_withEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "mainFrame");
  v3 = v2;
  if (*(_BYTE *)(a1 + 40) && *(_BYTE *)(a1 + 41))
    objc_msgSend(v2, "prepareForPause");
  objc_msgSend(v3, "setTimeoutsPaused:", *(unsigned __int8 *)(a1 + 41));
  result = objc_msgSend(v3, "setPluginsPaused:", *(unsigned __int8 *)(a1 + 41));
  if (*(_BYTE *)(a1 + 40))
  {
    if (!*(_BYTE *)(a1 + 41))
      return objc_msgSend(v3, "resumeFromPause");
  }
  return result;
}

- (id)webView:(id)a3 plugInViewWithArguments:(id)a4 fromPlugInPackage:(id)a5
{
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const void *v12;
  UIWebPlugInView *v13;
  void *v14;
  __CFDictionary *plugInViews;

  if (!-[UIWebDocumentView mediaPlaybackAllowsAirPlay](self, "mediaPlaybackAllowsAirPlay", a3))
  {
    v8 = (_QWORD *)MEMORY[0x1E0DD9828];
    v9 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0DD9828]), "mutableCopy");
    objc_msgSend(v9, "setValue:forKey:", CFSTR("deny"), CFSTR("airplay"));
    objc_msgSend(v9, "setValue:forKey:", CFSTR("deny"), CFSTR("_media_element_airplay_"));
    a4 = (id)objc_msgSend(a4, "mutableCopy");
    objc_msgSend(a4, "setValue:forKey:", v9, *v8);

  }
  v10 = (void *)objc_msgSend((id)objc_msgSend(a5, "bundle"), "principalClass");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v11 = objc_msgSend(v10, "plugInViewWithArguments:", a4);
  if (!v11)
    return 0;
  v12 = (const void *)v11;
  v13 = -[UIWebPlugInView initWithWebView:plugInView:]([UIWebPlugInView alloc], "initWithWebView:plugInView:", self, v11);
  if (v13)
  {
    v14 = (void *)objc_msgSend((id)objc_msgSend(a5, "bundle"), "bundleIdentifier");
    -[UIWebPlugInView setIsQuickTimePlugIn:](v13, "setIsQuickTimePlugIn:", objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.quicktime.plugin")));
    -[UIWebPlugInView setIsMapViewPlugIn:](v13, "setIsMapViewPlugIn:", objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mapview.plugin")));
    -[UIWebPlugInView setIsiAdPlugIn:](v13, "setIsiAdPlugIn:", objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.iad.plugin")));
    plugInViews = self->_plugInViews;
    if (!plugInViews)
    {
      plugInViews = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      self->_plugInViews = plugInViews;
    }
    CFDictionarySetValue(plugInViews, v12, v13);
  }
  return v13;
}

- (void)webView:(id)a3 willShowFullScreenForPlugInView:(id)a4
{
  *((_BYTE *)self + 962) |= 0x20u;
  -[UITextInteractionAssistant clearSelection](self->_textSelectionAssistant, "clearSelection", a3, a4);
}

- (void)webView:(id)a3 didHideFullScreenForPlugInView:(id)a4
{
  if ((*((_BYTE *)self + 962) & 0x20) != 0)
  {
    *((_BYTE *)self + 962) &= ~0x20u;
    if (!-[UIWebDocumentView isShowingFullScreenPlugInUI](self, "isShowingFullScreenPlugInUI", a3, a4)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(self->_delegate, "webViewWillHideFullScreenPlugInUI:", self);
    }
  }
}

- (void)didRemovePlugInView:(id)a3
{
  if (a3)
  {
    CFDictionaryRemoveValue(self->_plugInViews, (const void *)objc_msgSend(a3, "plugInView"));
    -[UIWebDocumentView _setSubviewCachesNeedUpdate:](self, "_setSubviewCachesNeedUpdate:", 1);
  }
}

- (BOOL)isShowingFullScreenPlugInUI
{
  return (*((unsigned __int8 *)self + 962) >> 5) & 1;
}

- (BOOL)hasPlugInSubviews
{
  __CFDictionary *plugInViews;

  plugInViews = self->_plugInViews;
  if (plugInViews)
    LOBYTE(plugInViews) = CFDictionaryGetCount(plugInViews) != 0;
  return (char)plugInViews;
}

- (void)webView:(id)a3 willAddPlugInView:(id)a4
{
  const void *v6;
  __CFDictionary *plugInViews;
  __CFDictionary *Mutable;

  v6 = (const void *)objc_msgSend(a4, "plugInView", a3);
  plugInViews = self->_plugInViews;
  if (!plugInViews || !CFDictionaryGetValue(plugInViews, v6))
  {
    objc_msgSend(a4, "setWebView:", self);
    Mutable = self->_plugInViews;
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      self->_plugInViews = Mutable;
    }
    CFDictionarySetValue(Mutable, v6, a4);
    objc_msgSend(a4, "reshape");
    -[UIWebDocumentView _setSubviewCachesNeedUpdate:](self, "_setSubviewCachesNeedUpdate:", 1);
  }
}

- (UIColor)insertionPointColor
{
  WebFrame *v2;
  uint64_t v3;

  v2 = -[WebView mainFrame](self->_webView, "mainFrame");
  if ((objc_opt_respondsToSelector() & 1) != 0 && (v3 = -[WebFrame caretColor](v2, "caretColor")) != 0)
    return +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v3);
  else
    return (UIColor *)+[UIColor insertionPointColor](UIColor, "insertionPointColor");
}

- (id)textInputTraits
{
  id result;

  result = self->_traits;
  if (!result)
  {
    result = objc_alloc_init(UITextInputTraits);
    self->_traits = (UITextInputTraits *)result;
  }
  return result;
}

- (void)forwardInvocation:(id)a3
{
  id v5;
  objc_super v6;

  v5 = -[UIWebDocumentView textInputTraits](self, "textInputTraits");
  objc_msgSend(a3, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "invokeWithTarget:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIWebDocumentView;
    -[UIWebDocumentView forwardInvocation:](&v6, sel_forwardInvocation_, a3);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  if (!result)
    return (id)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  return result;
}

- (void)takeTraitsFrom:(id)a3
{
  objc_msgSend(-[UIWebDocumentView textInputTraits](self, "textInputTraits"), "takeTraitsFrom:", a3);
}

- (UITextInteractionAssistant)interactionAssistant
{
  UITextInteractionAssistant *result;
  id m_parentTextView;

  result = (UITextInteractionAssistant *)objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
  if (!result)
  {
    result = self->_textSelectionAssistant;
    if (!result)
    {
      m_parentTextView = self->m_parentTextView;
      if (m_parentTextView && objc_msgSend(m_parentTextView, "interactionAssistant"))
      {
        return (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant");
      }
      else
      {
        result = -[UITextInteractionAssistant initWithView:]([UITextInteractionAssistant alloc], "initWithView:", self);
        self->_textSelectionAssistant = result;
      }
    }
  }
  return result;
}

- (BOOL)_restoreFirstResponder
{
  UITextInteractionAssistant *v3;
  objc_super v5;

  v3 = -[UIWebDocumentView interactionAssistant](self, "interactionAssistant");
  if (v3)
  {
    -[UITextInteractionAssistant checkEditabilityAndSetFirstResponderIfNecessary](v3, "checkEditabilityAndSetFirstResponderIfNecessary");
    return -[UIView isFirstResponder](self, "isFirstResponder");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIWebDocumentView;
    return -[UIResponder _restoreFirstResponder](&v5, sel__restoreFirstResponder);
  }
}

- (BOOL)isEditable
{
  if (self->m_parentTextView && (objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->m_parentTextView, "isEditable");
  else
    return 0;
}

- (BOOL)isEditing
{
  if (self->m_parentTextView && (objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->m_parentTextView, "isEditing");
  else
    return 0;
}

- (void)beginSelectionChange
{
  if (!UIWebCurrentUserInterfaceIdiomIsSmallScreen())
  {
    -[_UITextServiceSession dismissTextServiceAnimated:](self->_definitionSession, "dismissTextServiceAnimated:", 1);
    -[_UITextServiceSession dismissTextServiceAnimated:](self->_shareSession, "dismissTextServiceAnimated:", 1);
  }
  -[UITextInputDelegate selectionWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "selectionWillChange:", self);
}

- (void)endSelectionChange
{
  -[UITextInputDelegate selectionDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "selectionDidChange:", self);
}

- (CGRect)_selectionClipRect
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _OWORD v10[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGRect result;

  v3 = -[UIWebDocumentView formElement](self, "formElement");
  if (v3)
  {
    v4 = v3;
    WebThreadLock();
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v4, "innerFrameQuad");
    v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "ownerDocument"), "webFrame"), "documentView");
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    v10[3] = v14;
    objc_msgSend(v5, "convertRect:toView:", 0, quadBoundingBox((double *)v10));
  }
  else
  {
    -[UIView bounds](self, "bounds");
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  -[UITextInteractionAssistant beginFloatingCursorAtPoint:](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "beginFloatingCursorAtPoint:", a3.x, a3.y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  -[UITextInteractionAssistant updateFloatingCursorAtPoint:](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "updateFloatingCursorAtPoint:", a3.x, a3.y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  -[UITextInteractionAssistant updateFloatingCursorAtPoint:animated:](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "updateFloatingCursorAtPoint:animated:", a4, a3.x, a3.y);
}

- (void)endFloatingCursor
{
  -[UITextInteractionAssistant endFloatingCursor](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "endFloatingCursor");
}

- (void)cut:(id)a3
{
  if (-[UIWebDocumentView keyboardInputShouldDelete:](self, "keyboardInputShouldDelete:", objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "delegate")))
  {
    WebThreadLock();
    -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
    -[WebView cut:](self->_webView, "cut:", a3);
    -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
    -[UIWebDocumentView disableClearsOnInsertion](self, "disableClearsOnInsertion");
  }
}

- (void)copy:(id)a3
{
  WebThreadLock();
  -[WebView copy:](self->_webView, "copy:", a3);
}

- (void)toggleBoldface:(id)a3
{
  if (-[UIWebDocumentView hasRichlyEditableSelection](self, "hasRichlyEditableSelection"))
  {
    WebThreadLock();
    -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
    -[WebView toggleBold:](self->_webView, "toggleBold:", a3);
    -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
  }
}

- (void)toggleItalics:(id)a3
{
  if (-[UIWebDocumentView hasRichlyEditableSelection](self, "hasRichlyEditableSelection"))
  {
    WebThreadLock();
    -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
    -[WebView toggleItalic:](self->_webView, "toggleItalic:", a3);
    -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
  }
}

- (void)toggleUnderline:(id)a3
{
  if (-[UIWebDocumentView hasRichlyEditableSelection](self, "hasRichlyEditableSelection"))
  {
    WebThreadLock();
    -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
    -[WebView toggleUnderline:](self->_webView, "toggleUnderline:", a3);
    -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
  }
}

- (CGRect)_shortcutPresentationRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView selectionRectsForDOMRange:](self, "selectionRectsForDOMRange:", -[UIWebDocumentView selectedDOMRange](self, "selectedDOMRange")), "objectAtIndex:", 0), "rect");
  v5 = round(v4);
  v7 = round(v6);
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v7;
  result.origin.x = v5;
  return result;
}

- (BOOL)_isDisplayingReferenceLibraryViewController
{
  return self->_definitionSession != 0;
}

- (void)_shareText:(id)a3 fromRect:(CGRect)a4
{
  _UITextServiceSession *v5;
  _QWORD v6[5];

  v5 = (_UITextServiceSession *)-[UIResponder _showServiceForType:withContext:](self, "_showServiceForType:withContext:", 8, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height));
  self->_shareSession = v5;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__UIWebDocumentView__shareText_fromRect___block_invoke;
  v6[3] = &unk_1E16E5E40;
  v6[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v5, "setDismissedHandler:", v6);
}

void __41__UIWebDocumentView__shareText_fromRect___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336) = 0;
}

- (void)_share:(id)a3
{
  id v4;

  v4 = -[UIWebDocumentView textInRange:](self, "textInRange:", -[UIWebDocumentView selectedTextRange](self, "selectedTextRange", a3));
  -[UIWebDocumentView _shortcutPresentationRect](self, "_shortcutPresentationRect");
  -[UIWebDocumentView _shareText:fromRect:](self, "_shareText:fromRect:", v4);
}

- (void)_shareElement:(id)a3 withURL:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(a4, "_web_userVisibleString");
  objc_msgSend(a3, "boundingBox");
  -[UIWebDocumentView _shareText:fromRect:](self, "_shareText:fromRect:", v6);
}

- (BOOL)_isDisplayingShareViewController
{
  return self->_shareSession != 0;
}

- (void)_define:(id)a3
{
  _UITextServiceSession *v4;
  _QWORD v5[5];

  v4 = (_UITextServiceSession *)-[UIResponder _showServiceForType:withContext:](self, "_showServiceForType:withContext:", 16, +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 16, self));
  self->_lookupSession = v4;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__UIWebDocumentView__define___block_invoke;
  v5[3] = &unk_1E16E5E40;
  v5[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v4, "setDismissedHandler:", v5);
}

void __29__UIWebDocumentView__define___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1344) = 0;
}

- (BOOL)_isDisplayingLookupViewController
{
  return self->_lookupSession != 0;
}

- (void)_translate:(id)a3
{
  _UITextServiceSession *v4;
  _QWORD v5[5];

  v4 = (_UITextServiceSession *)-[UIResponder _showServiceForType:withContext:](self, "_showServiceForType:withContext:", 32, +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 32, self));
  self->_translateSession = v4;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__UIWebDocumentView__translate___block_invoke;
  v5[3] = &unk_1E16E5E40;
  v5[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v4, "setDismissedHandler:", v5);
}

void __32__UIWebDocumentView__translate___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1352) = 0;
}

- (BOOL)_isDisplayingTranslateViewController
{
  return self->_translateSession != 0;
}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  -[UIWebDocumentView insertText:](self, "insertText:", objc_msgSend(a3, "string"));
}

- (void)_addShortcut:(id)a3
{
  _UITextServiceSession *v4;
  _QWORD v5[5];

  if (!UIWebCurrentUserInterfaceIdiomIsSmallScreen())
    -[UIWebDocumentView _removeShortcutController:](self, "_removeShortcutController:", 0);
  v4 = (_UITextServiceSession *)-[UIResponder _showServiceForType:withContext:](self, "_showServiceForType:withContext:", 4, +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 16, self));
  self->_learnSession = v4;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__UIWebDocumentView__addShortcut___block_invoke;
  v5[3] = &unk_1E16E5E40;
  v5[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v4, "setDismissedHandler:", v5);
}

uint64_t __34__UIWebDocumentView__addShortcut___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328) = 0;
  result = UIWebCurrentUserInterfaceIdiomIsSmallScreen();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  return result;
}

- (BOOL)_isDisplayingShortcutViewController
{
  return self->_learnSession != 0;
}

- (BOOL)_shouldPaste
{
  id v3;
  void *v4;
  UIPasteboard *v5;
  uint64_t v6;
  id v7;
  int v8;
  BOOL result;

  v3 = +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  if (!self->m_parentTextView)
    return 1;
  v4 = v3;
  v5 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v6 = -[UIPasteboard string](v5, "string");
  if (!v6)
  {
    v7 = -[UIPasteboard valueForPasteboardType:](v5, "valueForPasteboardType:", objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier"));
    if (v7)
      v6 = objc_msgSend(v7, "absoluteString");
    else
      v6 = 0;
  }
  v8 = objc_msgSend(self->m_parentTextView, "keyboardInput:shouldInsertText:isMarkedText:", objc_msgSend(v4, "delegate"), v6, 0);
  result = 0;
  if (v8)
    return 1;
  return result;
}

- (void)paste:(id)a3
{
  if (-[UIWebDocumentView _shouldPaste](self, "_shouldPaste"))
  {
    WebThreadLock();
    -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
    -[WebView paste:](self->_webView, "paste:", a3);
    -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
    -[UIWebDocumentView disableClearsOnInsertion](self, "disableClearsOnInsertion");
  }
}

- (void)pasteAndMatchStyle:(id)a3
{
  if (-[UIWebDocumentView _shouldPaste](self, "_shouldPaste"))
  {
    WebThreadLock();
    -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
    -[WebView pasteAsPlainText:](self->_webView, "pasteAsPlainText:", a3);
    -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
    -[UIWebDocumentView disableClearsOnInsertion](self, "disableClearsOnInsertion");
  }
}

- (void)select:(id)a3
{
  UITextInteractionAssistant *textSelectionAssistant;

  if (self->m_parentTextView)
    textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant", a3);
  else
    textSelectionAssistant = self->_textSelectionAssistant;
  -[UITextInteractionAssistant selectWord](textSelectionAssistant, "selectWord");
}

- (void)selectAll:(id)a3
{
  UITextInteractionAssistant *textSelectionAssistant;

  if (self->m_parentTextView)
    textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant");
  else
    textSelectionAssistant = self->_textSelectionAssistant;
  -[UITextInteractionAssistant selectAll:](textSelectionAssistant, "selectAll:", a3);
}

- (void)replace:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[UIWebDocumentView dictationResultMetadataForRange:](self, "dictationResultMetadataForRange:", -[UIWebDocumentView selectedDOMRange](self, "selectedDOMRange"));
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("alternativesSelectedCount"));
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "intValue") + 1), CFSTR("alternativesSelectedCount"));
  }
  -[UIKeyboardImpl replaceText:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "replaceText:", a3);
}

- (void)_promptForReplace:(id)a3
{
  UITextInteractionAssistant *textSelectionAssistant;

  if (self->m_parentTextView)
    textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant", a3);
  else
    textSelectionAssistant = self->_textSelectionAssistant;
  -[UITextInteractionAssistant scheduleReplacements](textSelectionAssistant, "scheduleReplacements");
}

- (void)_transliterateChinese:(id)a3
{
  UITextInteractionAssistant *textSelectionAssistant;

  if (self->m_parentTextView)
    textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant", a3);
  else
    textSelectionAssistant = self->_textSelectionAssistant;
  -[UITextInteractionAssistant scheduleChineseTransliteration](textSelectionAssistant, "scheduleChineseTransliteration");
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  -[UIWebDocumentView setBaseWritingDirection:](self, "setBaseWritingDirection:", -1);
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  -[UIWebDocumentView setBaseWritingDirection:](self, "setBaseWritingDirection:", 1);
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  -[UIWebDocumentView setBaseWritingDirection:](self, "setBaseWritingDirection:", 0);
}

- (BOOL)isCaretInEmptyParagraph
{
  int v3;
  int v4;

  if (-[UIWebDocumentView selectionState](self, "selectionState") != 1)
    return 0;
  v3 = (unsigned __int16)-[UIResponder _characterBeforeCaretSelection](self, "_characterBeforeCaretSelection");
  if (v3 != 10)
  {
    if (v3)
      return 0;
  }
  v4 = -[UIWebDocumentView characterAfterCaretSelection](self, "characterAfterCaretSelection");
  return v4 == 10 || v4 == 0;
}

- (BOOL)inPopover
{
  UIView *v2;
  UIView *v3;
  char isKindOfClass;

  v2 = -[UIView superview](self, "superview");
  if (v2)
  {
    v3 = v2;
    do
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        break;
      v3 = -[UIView superview](v3, "superview");
    }
    while (v3);
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  if (!a3 || !-[UIWebDocumentView hasRichlyEditableSelection](self, "hasRichlyEditableSelection", a3, a4))
    return 0;
  WebThreadLock();
  return (id)-[WebView typingAttributes](self->_webView, "typingAttributes");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v7;
  uint64_t v10;
  int64_t v12;
  uint64_t v13;
  id v14;
  UIPasteboard *v15;
  id v16;
  char v17;
  BOOL v18;
  UITextRange *v19;
  id v20;
  id v21;
  UIWebDocumentView *v22;
  uint64_t v23;
  id v24;
  char v25;
  UITextRange *v26;
  objc_super v28;

  v7 = -[UITextSelection selectionRects](-[UITextInteractionAssistant activeSelection](self->_textSelectionAssistant, "activeSelection"), "selectionRects");
  if (sel_toggleBoldface_ == a3 || sel_toggleItalics_ == a3 || sel_toggleUnderline_ == a3)
  {
    LOBYTE(v10) = -[UIWebDocumentView hasRichlyEditableSelection](self, "hasRichlyEditableSelection");
    return v10;
  }
  if (sel_makeTextWritingDirectionRightToLeft_ == a3 || sel_makeTextWritingDirectionLeftToRight_ == a3)
  {
    LODWORD(v10) = -[UIWebDocumentView hasEditableSelection](self, "hasEditableSelection");
    if (!(_DWORD)v10)
      return v10;
    if (-[UIWebDocumentView isCaretInEmptyParagraph](self, "isCaretInEmptyParagraph"))
      goto LABEL_38;
    v12 = -[UIWebDocumentView selectionBaseWritingDirection](self, "selectionBaseWritingDirection");
    v13 = objc_msgSend(-[UIWebDocumentView textInputTraits](self, "textInputTraits"), "keyboardType");
    if ((unint64_t)(v13 - 4) < 8 && ((0x93u >> (v13 - 4)) & 1) != 0)
      goto LABEL_38;
    if (!UIKeyboardIsRightToLeftInputModeActive() && !v12)
      goto LABEL_38;
    if (sel_makeTextWritingDirectionRightToLeft_ == a3 && !v12)
    {
LABEL_23:
      LOBYTE(v10) = 1;
      return v10;
    }
    v18 = sel_makeTextWritingDirectionLeftToRight_ == a3 && v12 == 1;
    goto LABEL_60;
  }
  if (sel_cut_ == a3)
  {
    if ((objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0)
      goto LABEL_38;
    LODWORD(v10) = -[UIWebDocumentView hasEditableSelection](self, "hasEditableSelection");
    if (!(_DWORD)v10)
      return v10;
LABEL_45:
    v18 = -[UIWebDocumentView selectionState](self, "selectionState") == 2;
LABEL_60:
    LOBYTE(v10) = v18;
    return v10;
  }
  if (sel_paste_ == a3)
  {
    LODWORD(v10) = -[UIWebDocumentView hasEditableSelection](self, "hasEditableSelection");
    if ((_DWORD)v10)
    {
      v15 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
      v16 = -[UIWebDocumentView supportedPasteboardTypesForCurrentSelection](self, "supportedPasteboardTypesForCurrentSelection");
      LOBYTE(v10) = -[UIPasteboard containsPasteboardTypes:inItemSet:](v15, "containsPasteboardTypes:inItemSet:", v16, objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[UIPasteboard numberOfItems](v15, "numberOfItems")));
    }
    return v10;
  }
  v14 = v7;
  if (sel_copy_ == a3)
  {
    v17 = objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure");
    LOBYTE(v10) = v17 ^ 1;
    if ((v17 & 1) != 0 || v14)
      return v10;
    goto LABEL_45;
  }
  if (sel__share_ == a3)
  {
    if ((objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0
      || !v14 && -[UIWebDocumentView selectionState](self, "selectionState") != 2)
    {
      goto LABEL_38;
    }
    LODWORD(v10) = -[UIResponder _canShowTextServiceForType:](self, "_canShowTextServiceForType:", 8);
    if (!(_DWORD)v10)
      return v10;
    v19 = -[UIWebDocumentView selectedTextRange](self, "selectedTextRange");
    if (qword_1ECD7A0E0 != -1)
      dispatch_once(&qword_1ECD7A0E0, &__block_literal_global_678);
    v20 = -[UIWebDocumentView textInRange:](self, "textInRange:", v19);
    v21 = (id)objc_msgSend(v20, "stringByTrimmingCharactersInSet:", qword_1ECD7A0D8);
LABEL_70:
    LOBYTE(v10) = objc_msgSend(v21, "length") != 0;
    return v10;
  }
  if (sel__define_ == a3)
  {
    if ((objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0
      || !v14 && -[UIWebDocumentView selectionState](self, "selectionState") != 2)
    {
      goto LABEL_38;
    }
    v22 = self;
    v23 = 2;
LABEL_68:
    LODWORD(v10) = -[UIResponder _canShowTextServiceForType:](v22, "_canShowTextServiceForType:", v23);
    if (!(_DWORD)v10)
      return v10;
    v21 = -[UIWebDocumentView textInRange:](self, "textInRange:", -[UIWebDocumentView selectedTextRange](self, "selectedTextRange"));
    goto LABEL_70;
  }
  if (sel__translate_ == a3)
  {
    if ((objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0
      || !v14 && -[UIWebDocumentView selectionState](self, "selectionState") != 2)
    {
      goto LABEL_38;
    }
    v22 = self;
    v23 = 32;
    goto LABEL_68;
  }
  if (sel__addShortcut_ == a3)
  {
    if ((objc_msgSend(+[_UITextServiceSession textServiceSessionForType:](_UITextServiceSession, "textServiceSessionForType:", 4), "isDisplaying") & 1) != 0|| (objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0|| !v14 && -[UIWebDocumentView selectionState](self, "selectionState") != 2)
    {
      goto LABEL_38;
    }
    LODWORD(v10) = -[UIResponder _canShowTextServiceForType:](self, "_canShowTextServiceForType:", 4);
    if ((_DWORD)v10)
    {
      v24 = -[UIWebDocumentView textInRange:](self, "textInRange:", -[UIWebDocumentView selectedTextRange](self, "selectedTextRange"));
      v10 = objc_msgSend(v24, "length");
      if (v10)
      {
        LODWORD(v10) = TIEnabledInputModesAllowOneToManyShortcuts();
        if ((_DWORD)v10)
        {
          LODWORD(v10) = objc_msgSend(v24, "_containsCJScripts");
          if ((_DWORD)v10)
          {
            v25 = -[UIWebDocumentView inPopover](self, "inPopover");
            goto LABEL_93;
          }
        }
      }
    }
    return v10;
  }
  if (sel__promptForReplace_ == a3 || sel__transliterateChinese_ == a3)
  {
    LODWORD(v10) = -[UIWebDocumentView hasEditableSelection](self, "hasEditableSelection");
    if (!(_DWORD)v10)
      return v10;
    v26 = -[UIWebDocumentView selectedTextRange](self, "selectedTextRange");
    if (!-[UITextRange isEmpty](v26, "isEmpty"))
    {
      LOBYTE(v10) = -[UIResponder _shouldPerformUICalloutBarButtonReplaceAction:forText:checkAutocorrection:](self, "_shouldPerformUICalloutBarButtonReplaceAction:forText:checkAutocorrection:", a3, -[UIWebDocumentView textInRange:](self, "textInRange:", v26), 1);
      return v10;
    }
    goto LABEL_38;
  }
  if (sel_select_ == a3)
  {
    if ((objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0)
      goto LABEL_38;
    LODWORD(v10) = -[UIWebDocumentView hasContent](self, "hasContent");
    if (!(_DWORD)v10)
      return v10;
    v18 = -[UIWebDocumentView selectionState](self, "selectionState") == 1;
    goto LABEL_60;
  }
  if (sel_selectAll_ != a3)
  {
    if (sel_replace_ != a3)
    {
LABEL_36:
      v28.receiver = self;
      v28.super_class = (Class)UIWebDocumentView;
      LOBYTE(v10) = -[UIView canPerformAction:withSender:](&v28, sel_canPerformAction_withSender_, a3, a4);
      return v10;
    }
    LODWORD(v10) = -[UIWebDocumentView hasEditableSelection](self, "hasEditableSelection");
    if (!(_DWORD)v10)
      return v10;
    v25 = objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure");
LABEL_93:
    LOBYTE(v10) = v25 ^ 1;
    return v10;
  }
  LODWORD(v10) = -[UIWebDocumentView hasContent](self, "hasContent");
  if ((_DWORD)v10)
  {
    LODWORD(v10) = -[UIWebDocumentView selectionState](self, "selectionState");
    if ((_DWORD)v10)
    {
      if ((_DWORD)v10 != 2)
      {
        if ((_DWORD)v10 == 1)
          return v10;
        goto LABEL_36;
      }
      if (!-[UIWebDocumentView hasEditableSelection](self, "hasEditableSelection"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (-[UIResponder _selectionAtDocumentStart](self, "_selectionAtDocumentStart"))
          {
            v25 = -[UIResponder _selectionAtDocumentEnd](self, "_selectionAtDocumentEnd");
            goto LABEL_93;
          }
          goto LABEL_23;
        }
      }
LABEL_38:
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

uint64_t __49__UIWebDocumentView_canPerformAction_withSender___block_invoke()
{
  void *v0;
  uint64_t result;
  __int16 v2;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet"));
  v2 = -4;
  objc_msgSend(v0, "addCharactersInString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v2, 1));
  result = objc_msgSend(v0, "copy");
  qword_1ECD7A0D8 = result;
  return result;
}

- (CGRect)visibleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)visibleContentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)autoscrollDragFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)autoscrollContentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)playsNicelyWithGestures
{
  return 1;
}

- (BOOL)becomesEditableWithGestures
{
  return 0;
}

- (void)resetSelectionAssistant
{
  -[UITextInteractionAssistant setGestureRecognizers](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "setGestureRecognizers");
  if (-[UIView isFirstResponder](self, "isFirstResponder"))
    -[UITextInteractionAssistant activateSelection](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "activateSelection");
}

- (void)willStartScroll
{
  *((_BYTE *)self + 965) &= ~8u;
  if (self->super._inGestureType != 2)
    -[UIWebTiledView setInGesture:](self, "setInGesture:", 8);
  -[UITextInteractionAssistant willStartScrollingOrZooming](self->_textSelectionAssistant, "willStartScrollingOrZooming");
}

- (void)willStartScrollToTop
{
  *((_BYTE *)self + 965) |= 8u;
  -[UIWebDocumentView setTilingArea:](self, "setTilingArea:", 3);
  -[UITextInteractionAssistant willStartScrollingOrZooming](self->_textSelectionAssistant, "willStartScrollingOrZooming");
}

- (void)_updateFixedPositioningObjectsLayoutDuringScroll
{
  -[UIWebDocumentView _updateFixedPositionedObjectsLayoutRectUsingWebThread:synchronize:](self, "_updateFixedPositionedObjectsLayoutRectUsingWebThread:synchronize:", 1, 0);
}

- (void)_updateFixedPositioningObjectsLayoutAfterScroll
{
  -[UIWebDocumentView _updateFixedPositionedObjectsLayoutRectUsingWebThread:synchronize:](self, "_updateFixedPositionedObjectsLayoutRectUsingWebThread:synchronize:", 1, 1);
  objc_msgSend((id)-[WebView _fixedPositionContent](self->_webView, "_fixedPositionContent"), "didFinishScrollingOrZooming");
}

- (void)_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange
{
  -[UIWebDocumentView _updateFixedPositionedObjectsLayoutRectUsingWebThread:synchronize:](self, "_updateFixedPositionedObjectsLayoutRectUsingWebThread:synchronize:", 0, 1);
}

- (void)didEndScroll
{
  -[UIWebDocumentView sendScrollEventIfNecessary](self, "sendScrollEventIfNecessary");
  if (self->super._inGestureType == 8)
    -[UIWebTiledView setInGesture:](self, "setInGesture:", 0);
  if (-[UIWebTiledView tilingArea](self, "tilingArea") == 3)
    -[UIWebDocumentView setTilingArea:](self, "setTilingArea:", 0);
  -[UITextInteractionAssistant didEndScrollingOrZooming](self->_textSelectionAssistant, "didEndScrollingOrZooming");
  -[UIWebDocumentView _updateFixedPositioningObjectsLayoutAfterScroll](self, "_updateFixedPositioningObjectsLayoutAfterScroll");
}

- (void)scrollViewWasRemoved
{
  -[UIWebTiledView setInGesture:](self, "setInGesture:", 0);
}

- (void)willStartZoom
{
  -[UIWebTiledView setInGesture:](self, "setInGesture:", 2);
  -[UIWebDocumentView _notifyPlugInViewsOfWillBeginZooming](self, "_notifyPlugInViewsOfWillBeginZooming");
  -[UITextInteractionAssistant willStartScrollingOrZooming](self->_textSelectionAssistant, "willStartScrollingOrZooming");
}

- (void)didZoom
{
  if ((*((_BYTE *)self + 961) & 0x20) == 0)
    *((_BYTE *)self + 961) |= 8u;
  -[UIWebDocumentView _clearDoubleTapRect](self, "_clearDoubleTapRect");
  -[UIWebDocumentView _notifyPlugInViewsOfDidZoom](self, "_notifyPlugInViewsOfDidZoom");
}

- (void)didEndZoom
{
  -[UIWebTiledView setInGesture:](self, "setInGesture:", 0);
  -[UIWebDocumentView _notifyPlugInViewsOfDidEndZooming](self, "_notifyPlugInViewsOfDidEndZooming");
  -[UITextInteractionAssistant didEndScrollingOrZooming](self->_textSelectionAssistant, "didEndScrollingOrZooming");
  -[UIWebDocumentView _editableSelectionLayoutChangedByScrolling:](self, "_editableSelectionLayoutChangedByScrolling:", 0);
  objc_msgSend((id)-[WebView _fixedPositionContent](self->_webView, "_fixedPositionContent"), "didFinishScrollingOrZooming");
}

- (double)maximumDoubleTapScale
{
  return 1.6;
}

- (unsigned)_contentSizeInExposedRect:(CGRect)a3 topLayer:(id)a4 visibleLayerCount:(int *)a5
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "bounds");
  -[CALayer convertRect:fromLayer:](self->_contentLayersHostingLayer, "convertRect:fromLayer:", a4);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (!objc_msgSend(a4, "contents"))
    goto LABEL_3;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v17;
  v37.size.height = v19;
  v36 = CGRectIntersection(v35, v37);
  v20 = v36.size.width;
  v21 = v36.size.height;
  if (!CGRectIsEmpty(v36))
  {
    v22 = (v20 * v21);
    ++*a5;
  }
  else
  {
LABEL_3:
    v22 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = (void *)objc_msgSend(a4, "sublayers", 0);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(v23);
        v22 += -[UIWebDocumentView _contentSizeInExposedRect:topLayer:visibleLayerCount:](self, "_contentSizeInExposedRect:topLayer:visibleLayerCount:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), a5, x, y, width, height);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v25);
  }
  return v22;
}

- (BOOL)_shouldFlattenContentLayersForRect:(CGRect)a3
{
  CALayer *contentLayersHostingLayer;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned int v9;
  BOOL result;
  __CFDictionary *plugInViews;
  CGAffineTransform v13;
  CGAffineTransform v14;
  int v15;
  CGRect v16;
  CGRect v17;

  contentLayersHostingLayer = self->_contentLayersHostingLayer;
  if (!contentLayersHostingLayer)
    return 0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = 0;
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 1.0 / self->_documentScale, 1.0 / self->_documentScale);
  v13 = v14;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v17 = CGRectApplyAffineTransform(v16, &v13);
  v9 = -[UIWebDocumentView _contentSizeInExposedRect:topLayer:visibleLayerCount:](self, "_contentSizeInExposedRect:topLayer:visibleLayerCount:", contentLayersHostingLayer, &v15, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  result = 0;
  if (v9 >= 0xC0000 && v15 >= 4)
  {
    plugInViews = self->_plugInViews;
    if (plugInViews && CFDictionaryGetCount(plugInViews) >= 1)
    {
      WebThreadLock();
      return -[WebView _pluginsAreRunning](self->_webView, "_pluginsAreRunning") ^ 1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)_createIOSurfaceFromRect:(CGRect)a3
{
  double height;
  double width;
  UIScreen *v6;
  double v7;
  double v8;
  __IOSurface *v9;
  CATransform3D v11;

  height = a3.size.height;
  width = a3.size.width;
  v6 = -[UIWindow screen](-[UIView window](self, "window"), "screen");
  if (!v6)
    return 0;
  -[UIScreen scale](v6, "scale");
  v8 = v7;
  memset(&v11, 0, sizeof(v11));
  CATransform3DMakeScale(&v11, v7 * self->_documentScale, v7 * self->_documentScale, 1.0);
  v9 = _UIRenderingBufferCreate(0, width * v8, height * v8);
  if (v9)
  {
    -[UIWindow _contextId](-[UIView window](self, "window"), "_contextId");
    CARenderServerRenderLayerWithTransform();
  }
  return v9;
}

- (void)_flattenAndSwapContentLayersInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v8;
  void *v9;
  _UIWebDocumentViewRotationLayer *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = _flattenAndSwapContentLayersInRect__processorCount;
  if (!_flattenAndSwapContentLayersInRect__processorCount)
  {
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processorCount");
    _flattenAndSwapContentLayersInRect__processorCount = v8;
  }
  if (v8 <= 1
    && self->_contentLayersHostingLayer
    && -[UIWebDocumentView _shouldFlattenContentLayersForRect:](self, "_shouldFlattenContentLayersForRect:", x, y, width, height))
  {
    v9 = -[UIWebDocumentView _createIOSurfaceFromRect:](self, "_createIOSurfaceFromRect:", x, y, width, height);
    if (v9)
    {
      v11 = v9;
      v10 = objc_alloc_init(_UIWebDocumentViewRotationLayer);
      self->_flattenedRotatingContentLayer = &v10->super;
      -[_UIWebDocumentViewRotationLayer setContents:](v10, "setContents:", v11);
      -[CALayer setFrame:](self->_flattenedRotatingContentLayer, "setFrame:", x, y, width, height);
      -[CALayer removeFromSuperlayer](self->_contentLayersHostingLayer, "removeFromSuperlayer");
      objc_msgSend(-[UIView _layer](self, "_layer"), "addSublayer:", self->_flattenedRotatingContentLayer);

    }
  }
}

- (void)_restoreFlattenedContentLayers
{
  CALayer *flattenedRotatingContentLayer;

  if (self->_contentLayersHostingLayer)
  {
    flattenedRotatingContentLayer = self->_flattenedRotatingContentLayer;
    if (flattenedRotatingContentLayer)
    {
      -[CALayer removeFromSuperlayer](flattenedRotatingContentLayer, "removeFromSuperlayer");

      self->_flattenedRotatingContentLayer = 0;
      objc_msgSend(-[UIView _layer](self, "_layer"), "addSublayer:", self->_contentLayersHostingLayer);
    }
  }
}

- (void)setTileUpdatesDisabled:(BOOL)a3
{
  objc_msgSend(-[UIView _layer](self, "_layer"), "setLayoutsSuspended:", a3);
}

- (BOOL)hasBodyElement
{
  WebThreadLock();
  return -[WebFrame hasBodyElement](-[WebView mainFrame](self->_webView, "mainFrame"), "hasBodyElement");
}

- (id)_textSelectingContainer
{
  if (*((_QWORD *)self + 56))
    return (id)*((_QWORD *)self + 56);
  return self;
}

- (UITextRange)selectedTextRange
{
  WebThreadLock();
  return (UITextRange *)+[UITextRangeImpl wrapDOMRange:withAffinity:](UITextRangeImpl, "wrapDOMRange:withAffinity:", -[UIWebDocumentView selectedDOMRange](self, "selectedDOMRange"), -[UIWebDocumentView selectionAffinity](self, "selectionAffinity"));
}

- (void)setSelectedTextRange:(id)a3
{
  int v5;

  if (!self->_selectionAffinity)
  {
    v5 = 1;
    if (objc_msgSend(a3, "isEmpty"))
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "start"), "webVisiblePosition"), "affinity") == 1)
        v5 = 1;
      else
        v5 = 2;
    }
    self->_selectionAffinity = v5;
  }
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  -[UIWebDocumentView setSelectedDOMRange:affinityDownstream:](self, "setSelectedDOMRange:affinityDownstream:", objc_msgSend(a3, "domRange"), self->_selectionAffinity != 2);
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
  self->_selectionAffinity = 0;
}

- (void)setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  int v6;
  void *m_parentTextView;

  if (a4)
    v6 = 1;
  else
    v6 = 2;
  self->_selectionAffinity = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    m_parentTextView = self->m_parentTextView;
  else
    m_parentTextView = self;
  objc_msgSend(m_parentTextView, "setSelectedTextRange:", a3);
  self->_selectionAffinity = 0;
}

- (UITextRange)markedTextRange
{
  void *v3;

  WebThreadLock();
  v3 = (void *)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "markedTextDOMRange");
  if ((objc_msgSend(v3, "collapsed") & 1) != 0)
    return 0;
  else
    return (UITextRange *)+[UITextRangeImpl wrapDOMRange:](UITextRangeImpl, "wrapDOMRange:", v3);
}

- (void)unmarkText
{
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "confirmMarkedText:", 0);
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (UITextPosition)beginningOfDocument
{
  WebThreadLock();
  return (UITextPosition *)+[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", -[WebFrame startPosition](-[WebView mainFrame](self->_webView, "mainFrame"), "startPosition"));
}

- (UITextPosition)endOfDocument
{
  WebThreadLock();
  return (UITextPosition *)+[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", -[WebFrame endPosition](-[WebView mainFrame](self->_webView, "mainFrame"), "endPosition"));
}

- (id)textInRange:(id)a3
{
  if (!a3)
    return 0;
  WebThreadLock();
  return (id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "stringForRange:", objc_msgSend(a3, "domRange")), "_stringByReplacingCharacter:withCharacter:", 160, 32);
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  uint64_t v6;
  uint64_t v7;

  WebThreadLock();
  v6 = objc_msgSend(MEMORY[0x1E0DD9718], "rangeForFirstPosition:second:", objc_msgSend(a3, "webVisiblePosition"), objc_msgSend(a4, "webVisiblePosition"));
  v7 = objc_msgSend((id)objc_msgSend(a4, "webVisiblePosition"), "affinity");
  if (v6)
    return +[UITextRangeImpl wrapDOMRange:withAffinity:](UITextRangeImpl, "wrapDOMRange:withAffinity:", v6, v7 != 1);
  else
    return 0;
}

- (id)rangeOfEnclosingWord:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;

  WebThreadLock();
  v4 = (void *)objc_msgSend(a3, "webVisiblePosition");
  v5 = objc_msgSend(v4, "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", 1, objc_msgSend(v4, "atBoundaryOfGranularity:inDirection:", 1, 1) ^ 1);
  if (v5)
    return +[UITextRangeImpl wrapDOMRange:](UITextRangeImpl, "wrapDOMRange:", v5);
  v7 = (void *)objc_msgSend(v4, "positionOfNextBoundaryOfGranularity:inDirection:", 1, 1);
  if (v4
    && (v8 = (void *)objc_msgSend(v7, "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", 1, 1)) != 0
    && (v5 = objc_msgSend(MEMORY[0x1E0DD9718], "rangeForFirstPosition:second:", objc_msgSend(v8, "startPosition"), v4)) != 0)
  {
    return +[UITextRangeImpl wrapDOMRange:](UITextRangeImpl, "wrapDOMRange:", v5);
  }
  else
  {
    return 0;
  }
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  WebThreadLock();
  -[UITextInputDelegate textWillChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textWillChange:", self);
  -[UIWebDocumentView setSelectedDOMRange:affinityDownstream:](self, "setSelectedDOMRange:affinityDownstream:", objc_msgSend(a3, "domRange"), 0);
  if (objc_msgSend(a4, "length"))
    -[UIWebDocumentView insertText:](self, "insertText:", a4);
  else
    -[UIWebDocumentView deleteBackward](self, "deleteBackward");
  -[UITextInputDelegate textDidChange:](-[UIWebDocumentView inputDelegate](self, "inputDelegate"), "textDidChange:", self);
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "compare:", objc_msgSend(a4, "webVisiblePosition"));
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  WebThreadLock();
  return (int)objc_msgSend((id)objc_msgSend(a4, "webVisiblePosition"), "distanceFromPosition:", objc_msgSend(a3, "webVisiblePosition"));
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  void *v6;
  int64_t v7;
  id result;

  WebThreadLock();
  v6 = (void *)objc_msgSend(a3, "webVisiblePosition");
  if (a4 >= 0)
    v7 = a4;
  else
    v7 = -a4;
  result = (id)objc_msgSend(v6, "positionByMovingInDirection:amount:", a4 < 1, v7);
  if (result)
    return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", result);
  return result;
}

- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6
{
  _BOOL8 v6;
  id result;

  v6 = a6;
  WebThreadLock();
  result = (id)objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionByMovingInDirection:amount:withAffinityDownstream:", a4, a5, v6);
  if (result)
    return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", result);
  return result;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return -[UIWebDocumentView _positionFromPosition:inDirection:offset:withAffinityDownstream:](self, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", a3, a4, a5, 1);
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  WebThreadLock();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "atBoundaryOfGranularity:inDirection:", a4, a5);
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id result;

  WebThreadLock();
  result = (id)objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionOfNextBoundaryOfGranularity:inDirection:", a4, a5);
  if (result)
    return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", result);
  return result;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "withinTextUnitOfGranularity:inDirectionIfAtBoundary:", a4, a5);
}

- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->m_parentTextView, "scrollRectToVisible:animated:", v4, x, y, width, height);
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;

  WebThreadLock();
  v8 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", a4, a5);
  v9 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "affinity");
  if (v8)
    return +[UITextRangeImpl wrapDOMRange:withAffinity:](UITextRangeImpl, "wrapDOMRange:withAffinity:", v8, v9 != 1);
  else
    return 0;
}

- (CGRect)firstRectForRange:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  WebThreadLock();
  v5 = -[UIWebDocumentView selectionRectsForDOMRange:](self, "selectionRectsForDOMRange:", objc_msgSend(a3, "domRange"));
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", 0), "rect");
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_lastRectForRange:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  WebThreadLock();
  v5 = -[UIWebDocumentView selectionRectsForDOMRange:](self, "selectionRectsForDOMRange:", objc_msgSend(a3, "domRange"));
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") - 1), "rect");
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (UITextInputDelegate)inputDelegate
{
  return self->_inputDelegate;
}

- (void)setInputDelegate:(id)a3
{
  self->_inputDelegate = (UITextInputDelegate *)a3;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIWebTextPlaceholder *textPlaceholder;
  DOMDocument *v19;
  DOMRange *v20;
  void *v21;
  uint64_t i;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "caretRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v13 = objc_msgSend(a3, "webVisiblePosition");
    if (v13)
    {
      -[UIWebDocumentView caretRectForVisiblePosition:](self, "caretRectForVisiblePosition:", v13);
      v6 = v14;
      v8 = v15;
      v10 = v16;
      v12 = v17;
    }
    else
    {
      v6 = *MEMORY[0x1E0C9D628];
      v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    textPlaceholder = self->_textPlaceholder;
    if (textPlaceholder)
    {
      if (-[DOMElement parentNode](-[UIWebTextPlaceholder element](textPlaceholder, "element"), "parentNode"))
      {
        if (IsMobileNotes())
        {
          v19 = -[WebFrame DOMDocument](-[WebView mainFrame](self->_webView, "mainFrame"), "DOMDocument");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = -[DOMDocument createRange](v19, "createRange");
            v21 = (void *)-[DOMElement previousSibling](-[UIWebTextPlaceholder element](self->_textPlaceholder, "element"), "previousSibling");
            for (i = 1; v21; i = (i + 1))
              v21 = (void *)objc_msgSend(v21, "previousSibling");
            v23 = -[DOMElement parentNode](-[UIWebTextPlaceholder element](self->_textPlaceholder, "element"), "parentNode");
            -[DOMRange setStart:offset:](v20, "setStart:offset:", v23, i);
            -[DOMRange setEnd:offset:](v20, "setEnd:offset:", v23, i);
            if ((objc_msgSend((id)-[DOMRange startPosition](v20, "startPosition"), "isEqual:", v13) & 1) != 0)
            {
              v24 = 0.0;
              if (!dictatingIntoEmptyDocument)
                v24 = 3.0;
              v8 = v8 + v24;
              v12 = v12 + -3.0;
            }
          }
        }
      }
    }
  }
  v25 = v6;
  v26 = v8;
  v27 = v10;
  v28 = v12;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (NSDictionary)markedTextStyle
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  id result;

  y = a3.y;
  x = a3.x;
  WebThreadLock();
  result = -[UIWebDocumentView webVisiblePositionForPoint:](self, "webVisiblePositionForPoint:", x, y);
  if (result)
    return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", result);
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  y = a3.y;
  x = a3.x;
  WebThreadLock();
  v8 = -[UIWebDocumentView webVisiblePositionForPoint:](self, "webVisiblePositionForPoint:", x, y);
  v9 = objc_msgSend((id)objc_msgSend(a4, "domRange"), "startPosition");
  v10 = objc_msgSend((id)objc_msgSend(a4, "domRange"), "endPosition");
  if (v9
    && (v11 = v10) != 0
    && (objc_msgSend(v8, "compare:", v9) == -1
     || (v9 = v11, objc_msgSend(v8, "compare:", v11) == 1)
     || (v9 = (uint64_t)v8) != 0))
  {
    return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", v9);
  }
  else
  {
    return 0;
  }
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  id v7;
  id v8;
  UIWebDocumentView *v9;
  id v10;
  id result;

  y = a3.y;
  x = a3.x;
  WebThreadLock();
  v6 = -[UIWebDocumentView closestPositionToPoint:](self, "closestPositionToPoint:", x, y);
  v7 = -[UIWebDocumentView positionFromPosition:offset:](self, "positionFromPosition:offset:", v6, 1);
  if (v7)
  {
    v8 = v7;
    v9 = self;
    v10 = v6;
  }
  else
  {
    result = -[UIWebDocumentView positionFromPosition:offset:](self, "positionFromPosition:offset:", v6, -1);
    if (!result)
      return result;
    v10 = result;
    v9 = self;
    v8 = v6;
  }
  return -[UIWebDocumentView textRangeFromPosition:toPosition:](v9, "textRangeFromPosition:toPosition:", v10, v8);
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  int64_t v7;

  WebThreadLock();
  v7 = -[UIWebDocumentView baseWritingDirectionForPosition:inDirection:](self, "baseWritingDirectionForPosition:inDirection:", objc_msgSend(a3, "start"), 0);
  if ((unint64_t)(a4 - 3) > 1)
  {
    if (v7 != 1)
      return (id)objc_msgSend(a3, "end");
  }
  else if (v7 == 1)
  {
    return (id)objc_msgSend(a3, "end");
  }
  return (id)objc_msgSend(a3, "start");
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id result;

  WebThreadLock();
  if (-[UIWebDocumentView baseWritingDirectionForPosition:inDirection:](self, "baseWritingDirectionForPosition:inDirection:", a3, 0) == 1)v7 = 1;
  else
    v7 = -1;
  if ((unint64_t)(a4 - 3) >= 2)
    v8 = 1;
  else
    v8 = v7;
  result = -[UIWebDocumentView positionFromPosition:offset:](self, "positionFromPosition:offset:", a3, v8);
  if (result)
    return -[UIWebDocumentView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", a3, result);
  return result;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  WebThreadLock();
  return -[UIWebDocumentView selectionBaseWritingDirection](self, "selectionBaseWritingDirection");
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setBaseWritingDirection:", a3);
}

- (int64_t)selectionAffinity
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionAffinity") != 1;
}

- (int64_t)selectionGranularity
{
  return self->m_selectionGranularity;
}

- (void)setSelectionGranularity:(int64_t)a3
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setSelectionGranularity:", a3);
  self->m_selectionGranularity = a3;
}

- (id)selectionRectsForRange:(id)a3
{
  if (!a3)
    return 0;
  WebThreadLock();
  return +[UITextSelectionRectImpl rectsWithWebRects:](UITextSelectionRectImpl, "rectsWithWebRects:", -[UIWebDocumentView selectionRectsForDOMRange:](self, "selectionRectsForDOMRange:", objc_msgSend(a3, "domRange")));
}

- (id)_documentUrl
{
  WebThreadLock();
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "dataSource"), "request"), "URL");
}

- (int)documentType
{
  return self->_documentType;
}

- (BOOL)_shouldResetForNewPage
{
  if ((*((char *)self + 963) & 0x80000000) == 0)
    return 1;
  if (!self->_suppressesIncrementalRendering && (*((_BYTE *)self + 963) & 0x40) != 0)
    return self->_renderTreeSize >= self->_renderTreeSizeThresholdForReset;
  return 0;
}

- (void)setRenderTreeSizeThresholdForReset:(unint64_t)a3
{
  if (self->_renderTreeSizeThresholdForReset != a3)
  {
    self->_renderTreeSizeThresholdForReset = a3;
    -[UIWebTiledView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_isInspectorSearchingForNode
{
  return (*((unsigned __int8 *)self + 965) >> 2) & 1;
}

- (double)currentDocumentScale
{
  return self->_documentScale;
}

- (CGRect)visibleContentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[UIView _scroller](self, "_scroller"), "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)minimumScaleForSize:(CGSize)a3
{
  float v3;

  -[UIWebDocumentView minimumScaleForMinimumSize:](self, "minimumScaleForMinimumSize:", a3.width, a3.height);
  return v3;
}

- (CGRect)rectOfInterestForPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double width;
  double height;
  NSView *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  char v33;
  CGRect v34;
  CGRect result;

  y = a3.y;
  x = a3.x;
  v6 = MEMORY[0x1E0C9D648];
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  WebThreadLock();
  v11 = (NSView *)-[WebView hitTest:](self->_webView, "hitTest:", x, y);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSView convertPoint:fromView:](v11, "convertPoint:fromView:", 0, x, y);
    v33 = 0;
    v32 = 0;
    objc_msgSend((id)-[NSView _frame](v11, "_frame"), "renderRectForPoint:isReplaced:fontSize:", &v33, &v32, v12, v13);
    v14 = v34.origin.x;
    v15 = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    if (!CGRectIsEmpty(v34))
    {
      v18 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView");
      if (v18 == v11)
      {
        v19 = v14;
        v20 = v15;
        v21 = width;
        v22 = height;
      }
      else
      {
        -[NSView convertRect:toView:](v11, "convertRect:toView:", v18, v14, v15, width, height);
      }
      self->_mainDocumentDoubleTapRect.origin.x = v19;
      self->_mainDocumentDoubleTapRect.origin.y = v20;
      self->_mainDocumentDoubleTapRect.size.width = v21;
      self->_mainDocumentDoubleTapRect.size.height = v22;
      -[NSView convertRect:toView:](v11, "convertRect:toView:", 0, v14, v15, width, height);
      v7 = v23;
      v8 = v24;
      v9 = v25;
      v10 = v26;
      v27 = *(CGSize *)(v6 + 16);
      self->_doubleTapRect.origin = *(CGPoint *)v6;
      self->_doubleTapRect.size = v27;
      *((_BYTE *)self + 962) = *((_BYTE *)self + 962) & 0xFE | v33;
    }
  }
  v28 = v7;
  v29 = v8;
  v30 = v9;
  v31 = v10;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)doubleTapScalesForSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[UIWebDocumentView minimumScaleForSize:](self, "minimumScaleForSize:", a3.width, a3.height);
  v5 = v4;
  -[UIWebDocumentView maximumDoubleTapScale](self, "maximumDoubleTapScale");
  if (v6 >= v5)
    v7 = v6;
  else
    v7 = v5;
  v8 = 0.0;
  v9 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v9;
  return result;
}

- (BOOL)considerHeightForDoubleTap
{
  return *((_BYTE *)self + 962) & 1;
}

- (BOOL)shouldSelectionAssistantReceiveDoubleTapAtPoint:(CGPoint)a3 forScale:(double)a4
{
  double y;
  double x;
  UIWebDocumentView *v6;
  double documentScale;

  y = a3.y;
  x = a3.x;
  v6 = self;
  LOBYTE(self) = 0;
  documentScale = v6->_documentScale;
  if (documentScale > 0.9 && documentScale < 1.1)
  {
    LODWORD(self) = -[UITextInteractionAssistant swallowsDoubleTapWithScale:atPoint:](v6->_textSelectionAssistant, "swallowsDoubleTapWithScale:atPoint:", a4 / documentScale, x, y);
    if ((_DWORD)self)
    {
      -[UIWebDocumentView _clearDoubleTapRect](v6, "_clearDoubleTapRect");
      LOBYTE(self) = 1;
    }
  }
  return (char)self;
}

- (void)willZoomToLocation:(CGPoint)a3 atScale:(double)a4 forDuration:(double)a5
{
  char v5;

  if (a5 <= 0.0)
    v5 = 0;
  else
    v5 = 2 * (self->_documentScale < a4);
  *((_BYTE *)self + 965) = *((_BYTE *)self + 965) & 0xFD | v5;
}

- (CGRect)currentDragCaretRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentDragCaretRect.origin.x;
  y = self->_currentDragCaretRect.origin.y;
  width = self->_currentDragCaretRect.size.width;
  height = self->_currentDragCaretRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentDragCaretRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_currentDragCaretRect;
  double v9;
  double v10;
  double v11;
  double v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_currentDragCaretRect = &self->_currentDragCaretRect;
  if (!CGRectEqualToRect(self->_currentDragCaretRect, a3))
  {
    v9 = p_currentDragCaretRect->origin.x;
    v10 = p_currentDragCaretRect->origin.y;
    v11 = p_currentDragCaretRect->size.width;
    v12 = p_currentDragCaretRect->size.height;
    p_currentDragCaretRect->origin.x = x;
    p_currentDragCaretRect->origin.y = y;
    p_currentDragCaretRect->size.width = width;
    p_currentDragCaretRect->size.height = height;
    -[UIWebDocumentView _didChangeDragCaretRectFromRect:toRect:](self, "_didChangeDragCaretRectFromRect:toRect:", v9, v10, v11, v12, x, y, width, height);
  }
}

- (BOOL)dragInteractionEnabled
{
  return -[UIDragInteraction isEnabled](self->_dragInteraction, "isEnabled");
}

- (void)setDragInteractionEnabled:(BOOL)a3
{
  -[UIDragInteraction setEnabled:](self->_dragInteraction, "setEnabled:", a3);
}

- (DOMRange)rangeToRestoreAfterDictation
{
  return self->_rangeToRestoreAfterDictation;
}

- (void)setRangeToRestoreAfterDictation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1056);
}

- (BOOL)suppressesIncrementalRendering
{
  return self->_suppressesIncrementalRendering;
}

- (void)setSuppressesIncrementalRendering:(BOOL)a3
{
  self->_suppressesIncrementalRendering = a3;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1376);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1384);
}

- (UIWebDraggingDelegate)webDraggingDelegate
{
  return self->_webDraggingDelegate;
}

- (void)setWebDraggingDelegate:(id)a3
{
  self->_webDraggingDelegate = (UIWebDraggingDelegate *)a3;
}

- (CGPoint)lastGlobalPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastGlobalPosition.x;
  y = self->_lastGlobalPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastGlobalPosition:(CGPoint)a3
{
  self->_lastGlobalPosition = a3;
}

- (NSString)draggedLinkTitle
{
  return self->_draggedLinkTitle;
}

- (void)setDraggedLinkTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1400);
}

- (NSURL)draggedLinkURL
{
  return self->_draggedLinkURL;
}

- (void)setDraggedLinkURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1408);
}

- (unint64_t)currentDragSourceAction
{
  return self->_currentDragSourceAction;
}

- (void)setCurrentDragSourceAction:(unint64_t)a3
{
  self->_currentDragSourceAction = a3;
}

- (UIView)initialDropSnapshotView
{
  return self->_initialDropSnapshotView;
}

- (void)setInitialDropSnapshotView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1424);
}

- (CGRect)exposedScrollViewRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_exposedScrollViewRect.origin.x;
  y = self->_exposedScrollViewRect.origin.y;
  width = self->_exposedScrollViewRect.size.width;
  height = self->_exposedScrollViewRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)wantsMinimalUI
{
  return self->_wantsMinimalUI;
}

- (unint64_t)renderTreeSize
{
  return self->_renderTreeSize;
}

- (unint64_t)renderTreeSizeThresholdForReset
{
  return self->_renderTreeSizeThresholdForReset;
}

+ (id)_createDefaultHighlightView
{
  _UIHighlightView *v2;
  _UIHighlightView *v3;

  v2 = [_UIHighlightView alloc];
  v3 = -[_UIHighlightView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setOpaque:](v3, "setOpaque:", 0);
  -[_UIHighlightView setCornerRadius:](v3, "setCornerRadius:", 2.0);
  -[_UIHighlightView setColor:](v3, "setColor:", +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.3));
  return v3;
}

+ (id)_sharedHighlightView
{
  id result;

  result = (id)_sharedHighlightView__highlightView;
  if (!_sharedHighlightView__highlightView)
  {
    result = +[UIWebDocumentView _createDefaultHighlightView](UIWebDocumentView, "_createDefaultHighlightView");
    _sharedHighlightView__highlightView = (uint64_t)result;
  }
  return result;
}

- (void)_registerPreview
{
  UIPreviewItemController *v3;

  if (self->_previewItemController)
    -[UIWebDocumentView _unregisterPreview](self, "_unregisterPreview");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || -[UIWebDocumentView allowsLinkPreview](self, "allowsLinkPreview"))
  {
    v3 = -[UIPreviewItemController initWithView:]([UIPreviewItemController alloc], "initWithView:", self);
    self->_previewItemController = v3;
    -[UIPreviewItemController setDelegate:](v3, "setDelegate:", self);
    self->_previewGestureRecognizer = (UILongPressGestureRecognizer *)-[UIPreviewItemController presentationGestureRecognizer](self->_previewItemController, "presentationGestureRecognizer");
    self->_previewSecondaryGestureRecognizer = (UILongPressGestureRecognizer *)-[UIPreviewItemController presentationSecondaryGestureRecognizer](self->_previewItemController, "presentationSecondaryGestureRecognizer");
  }
}

- (void)_unregisterPreview
{

  self->_previewGestureRecognizer = 0;
  self->_previewSecondaryGestureRecognizer = 0;
  -[UIPreviewItemController setDelegate:](self->_previewItemController, "setDelegate:", 0);

  self->_previewItemController = 0;
}

- (BOOL)isPreviewing
{
  return -[UIPreviewItemController interactionInProgress](self->_previewItemController, "interactionInProgress");
}

- (BOOL)_previewAllowedForPosition:(CGPoint)a3
{
  id v4;
  void *v5;
  CGPoint v7;

  v7 = a3;
  WebThreadLock();
  v4 = -[UIWebDocumentView approximateNodeAtViewportLocation:](self, "approximateNodeAtViewportLocation:", &v7);
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    LOBYTE(v4) = (objc_opt_isKindOfClass() & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "absoluteLinkURL", *(_QWORD *)&v7.x, *(_QWORD *)&v7.y), "absoluteString"), "length");
  }
  return (char)v4;
}

- (BOOL)_interactionShouldBeginFromPreviewItemController:(id)a3 forPosition:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->_delegate, "_webView:previewIsAllowedForPosition:", self, x, y);
  else
    return -[UIWebDocumentView _previewAllowedForPosition:](self, "_previewAllowedForPosition:", x, y);
}

- (id)_dataForPreviewItemController:(id)a3 atPosition:(CGPoint)a4 type:(int64_t *)a5
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  id v8;
  void *v10;
  id v11;
  void *v12;
  WebFrame *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  p_interaction = &self->_interaction;
  if (!self->_interaction.element)
    return 0;
  WebThreadLock();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)-[DOMNode absoluteLinkURL](p_interaction->element, "absoluteLinkURL");
    if (objc_msgSend((id)objc_msgSend(v10, "absoluteString"), "length"))
    {
      *a5 = 2;
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, UIPreviewDataLink);
      v11 = DataDetectorsUIGetClass(CFSTR("DDDetectionController"));
      v12 = (void *)objc_msgSend(v11, "sharedController");
      v13 = -[WebView mainFrame](self->_webView, "mainFrame");
      if (objc_msgSend((id)objc_msgSend(v11, "tapAndHoldSchemes"), "containsObject:", objc_msgSend(v10, "scheme")))
      {
        v16 = 0;
        v14 = objc_msgSend(v12, "resultForNode:url:frame:contextRef:", p_interaction->element, v10, v13, &v16);
        if (v14)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, UIPreviewDataDDResult);
        if (v16)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, UIPreviewDataDDContext);
      }
      else
      {
        v15 = (void *)objc_msgSend(v12, "copyContextForContainer:", v13);
        if (objc_msgSend(v15, "count"))
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, UIPreviewDataDDContext);

      }
    }
  }
  return v8;
}

- (id)_presentedViewControllerForPreviewItemController:(id)a3
{
  id delegate;
  void *v6;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  delegate = self->_delegate;
  v6 = (void *)objc_msgSend(a3, "previewData");
  return (id)objc_msgSend(delegate, "_webView:previewViewControllerForURL:", self, objc_msgSend(v6, "objectForKeyedSubscript:", UIPreviewDataLink));
}

- (void)_previewItemController:(id)a3 willPresentPreview:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "_webView:willPresentPreview:", self, a4);
}

- (void)_collectPreviewRevealInformationIfNeeded
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  id v3;
  uint64_t v4;
  id v5;

  p_interaction = &self->_interaction;
  if (!self->_interaction.previewHintImage || !self->_interaction.previewHintRects)
  {
    if (self->_interaction.element)
    {
      WebThreadLock();
      v3 = -[DOMNode _realNode](p_interaction->element, "_realNode");
      v4 = 0;
      v5 = 0;
      objc_msgSend(v3, "getPreviewSnapshotImage:andRects:", &v4, &v5);
      p_interaction->previewHintImage = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v4);
      p_interaction->previewHintRects = (NSArray *)v5;
    }
  }
}

- (void)_clearPreviewRevealInformation
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;

  p_interaction = &self->_interaction;

  p_interaction->previewHintImage = 0;
  p_interaction->previewHintRects = 0;
}

- (void)_previewItemController:(id)a3 didDismissPreview:(id)a4 committing:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "_webView:didDismissPreview:committing:", self, a4, v5);
}

- (void)_previewItemController:(id)a3 commitPreview:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "_webView:commitPreview:", self, a4);
}

- (id)_presentationSnapshotForPreview
{
  return self->_interaction.previewHintImage;
}

- (id)_presentationRectsForPreview
{
  return self->_interaction.previewHintRects;
}

- (id)_presentationSnapshotForPreviewItemController:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(self->_delegate, "_webView:presentationSnapshotForPreview:", self, objc_msgSend(a3, "presentedViewController"));
  else
    return -[UIWebDocumentView _presentationSnapshotForPreview](self, "_presentationSnapshotForPreview");
}

- (id)_presentationRectsForPreviewItemController:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(self->_delegate, "_webView:presentationRectsForPreview:", self, objc_msgSend(a3, "presentedViewController"));
  else
    return -[UIWebDocumentView _presentationRectsForPreview](self, "_presentationRectsForPreview");
}

- (CGRect)computeRectForElement:(id)a3 withHighligh:(id)a4 isInverted:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  BOOL v39;
  BOOL v41;
  BOOL v42;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t k;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  double v121;
  double v122;
  uint64_t j;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  uint64_t v130;
  id v131;
  id v132;
  double v133;
  double Height;
  CGFloat rect;
  int recta;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  double v157[8];
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect result;

  v5 = a5;
  v171 = *MEMORY[0x1E0C80C00];
  WebThreadLock();
  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "webFrame"), "documentView");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (a4)
    v19 = 2.0;
  else
    v19 = 0.0;
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v132 = a3;
  v20 = (void *)objc_msgSend(a3, "absoluteQuadsAtPoint:", self->_interaction.location.x, self->_interaction.location.y, &self->_interaction);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v162, v170, 16);
  if (v21)
  {
    v22 = v21;
    v131 = a4;
    v23 = *(_QWORD *)v163;
    v24 = v14;
    v25 = v16;
LABEL_6:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v163 != v23)
        objc_enumerationMutation(v20);
      v27 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v26);
      if (v27)
      {
        objc_msgSend(v27, "quad");
        v29 = *((double *)&v158 + 1);
        v28 = *(double *)&v158;
        v30 = *((double *)&v159 + 1);
        v31 = *(double *)&v159;
        v32 = *((double *)&v160 + 1);
        v33 = *(double *)&v160;
        v34 = *((double *)&v161 + 1);
        v35 = *(double *)&v161;
      }
      else
      {
        v34 = 0.0;
        v35 = 0.0;
        v160 = 0u;
        v161 = 0u;
        v32 = 0.0;
        v33 = 0.0;
        v30 = 0.0;
        v31 = 0.0;
        v158 = 0u;
        v159 = 0u;
        v29 = 0.0;
        v28 = 0.0;
      }
      if ((v31 - v28) * (v32 - v29) - (v30 - v29) * (v33 - v28) <= 0.0)
      {
        v36 = v29;
        v37 = v28;
      }
      else
      {
        v36 = v32;
        v37 = v33;
        v32 = v29;
        v33 = v28;
      }
      v38 = v33 == v31 && v30 == v36;
      v39 = v38 && v37 == v35;
      if (!v39 || v34 != v32)
      {
        v41 = v32 == v30 && v31 == v37;
        v42 = v41 && v36 == v34;
        if (!v42 || v35 != v33)
          break;
      }
      v157[0] = v33;
      v157[1] = v32;
      v157[2] = v31;
      v157[3] = v30;
      v157[4] = v37;
      v157[5] = v36;
      v157[6] = v35;
      v157[7] = v34;
      objc_msgSend(v9, "convertRect:toView:", 0, quadBoundingBox(v157));
      x = v172.origin.x;
      y = v172.origin.y;
      width = v172.size.width;
      rect = v172.size.height;
      v133 = CGRectGetWidth(v172);
      v173.origin.x = v12;
      v173.origin.y = v24;
      v173.size.width = v25;
      v173.size.height = v18;
      if (v133 > CGRectGetWidth(v173))
        goto LABEL_42;
      v174.origin.x = x;
      v174.origin.y = y;
      v174.size.width = width;
      v174.size.height = rect;
      Height = CGRectGetHeight(v174);
      v175.origin.x = v12;
      v175.origin.y = v24;
      v175.size.width = v25;
      v175.size.height = v18;
      if (Height > CGRectGetHeight(v175))
        goto LABEL_42;
      v176.origin.x = x;
      v176.origin.y = y;
      v176.size.width = width;
      v176.size.height = rect;
      v177 = CGRectIntegral(v176);
      v178 = CGRectInset(v177, -v19, -v19);
      v47 = (void *)MEMORY[0x1E0CB3B18];
      if (v5)
        -[UIView convertRect:toView:](self, "convertRect:toView:", 0, v178.origin.x, v178.origin.y, v178.size.width, v178.size.height);
      objc_msgSend(v10, "addObject:", objc_msgSend(v47, "valueWithCGRect:", v178.origin.x, v178.origin.y, v178.size.width, v178.size.height));
      if (v22 == ++v26)
      {
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v162, v170, 16);
        if (v22)
          goto LABEL_6;
LABEL_42:
        if (v131)
          goto LABEL_46;
        goto LABEL_56;
      }
    }
    objc_msgSend(v10, "removeAllObjects", v34, v35);
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v81 = (void *)objc_msgSend(v132, "absoluteQuadsAtPoint:", *(double *)(v130 + 8), *(double *)(v130 + 16));
    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v154;
      do
      {
        for (i = 0; i != v83; ++i)
        {
          if (*(_QWORD *)v154 != v84)
            objc_enumerationMutation(v81);
          v86 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
          if (v86)
          {
            objc_msgSend(v86, "quad");
            v87 = *((double *)&v149 + 1);
            v88 = *(double *)&v149;
            v89 = *((double *)&v150 + 1);
            v90 = *(double *)&v150;
            v91 = *((double *)&v151 + 1);
            v92 = *(double *)&v151;
            v94 = *((double *)&v152 + 1);
            v93 = *(double *)&v152;
          }
          else
          {
            v94 = 0.0;
            v93 = 0.0;
            v151 = 0u;
            v152 = 0u;
            v91 = 0.0;
            v92 = 0.0;
            v89 = 0.0;
            v90 = 0.0;
            v149 = 0u;
            v150 = 0u;
            v87 = 0.0;
            v88 = 0.0;
          }
          if ((v90 - v88) * (v91 - v87) - (v89 - v87) * (v92 - v88) <= 0.0)
          {
            v95 = v92;
            v96 = v91;
          }
          else
          {
            v95 = v88;
            v96 = v87;
            v88 = v92;
            v87 = v91;
          }
          objc_msgSend(v9, "convertPoint:toView:", 0, v93, v94);
          v98 = v97 - v19;
          v100 = v19 + v99;
          v101 = (void *)MEMORY[0x1E0CB3B18];
          if (v5)
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v98, v100);
          objc_msgSend(v10, "addObject:", objc_msgSend(v101, "valueWithCGPoint:", v98, v100));
          objc_msgSend(v9, "convertPoint:toView:", 0, v95, v96);
          v103 = v102 - v19;
          v105 = v104 - v19;
          v106 = (void *)MEMORY[0x1E0CB3B18];
          if (v5)
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v103, v105);
          objc_msgSend(v10, "addObject:", objc_msgSend(v106, "valueWithCGPoint:", v103, v105));
          objc_msgSend(v9, "convertPoint:toView:", 0, v90, v89);
          v108 = v19 + v107;
          v110 = v109 - v19;
          v111 = (void *)MEMORY[0x1E0CB3B18];
          if (v5)
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v108, v110);
          objc_msgSend(v10, "addObject:", objc_msgSend(v111, "valueWithCGPoint:", v108, v110));
          objc_msgSend(v9, "convertPoint:toView:", 0, v88, v87);
          v113 = v19 + v112;
          v115 = v19 + v114;
          v116 = (void *)MEMORY[0x1E0CB3B18];
          if (v5)
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v113, v115);
          objc_msgSend(v10, "addObject:", objc_msgSend(v116, "valueWithCGPoint:", v113, v115));
        }
        v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
      }
      while (v83);
    }
    if (v131)
    {
      recta = 0;
      goto LABEL_47;
    }
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v117 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v137, v166, 16);
    if (v117)
    {
      v118 = v117;
      v119 = 0;
      v120 = *(_QWORD *)v138;
      v121 = 0.0;
      v58 = 0.0;
      v122 = 0.0;
      v59 = 0.0;
      do
      {
        for (j = 0; j != v118; ++j)
        {
          if (*(_QWORD *)v138 != v120)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * j), "CGPointValue");
          if ((v119 & 1) != 0)
            v126 = v121;
          else
            v126 = v124;
          if ((v119 & 1) != 0)
            v127 = v58;
          else
            v127 = v124;
          if ((v119 & 1) != 0)
            v128 = v122;
          else
            v128 = v125;
          if ((v119 & 1) != 0)
            v129 = v59;
          else
            v129 = v125;
          if (v124 >= v126)
            v121 = v124;
          else
            v121 = v126;
          if (v124 >= v127)
            v58 = v127;
          else
            v58 = v124;
          if (v125 >= v128)
            v122 = v125;
          else
            v122 = v128;
          if (v125 >= v129)
            v59 = v129;
          else
            v59 = v125;
          v119 = 1;
        }
        v118 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v137, v166, 16);
      }
      while (v118);
    }
    else
    {
      v121 = 0.0;
      v58 = 0.0;
      v122 = 0.0;
      v59 = 0.0;
    }
    v60 = v121 - v58;
    v61 = v122 - v59;
    goto LABEL_66;
  }
  if (!a4)
  {
LABEL_56:
    v58 = *MEMORY[0x1E0C9D628];
    v59 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v60 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v61 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v62 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
    if (v62)
    {
      v63 = v62;
      v64 = 0;
      v65 = *(_QWORD *)v142;
      do
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v142 != v65)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * k), "rectValue");
          v71 = v67;
          v72 = v68;
          v73 = v69;
          v74 = v70;
          if ((v64 & 1) != 0)
          {
            v179.origin.x = v58;
            v179.origin.y = v59;
            v179.size.width = v60;
            v179.size.height = v61;
            v180 = CGRectUnion(v179, *(CGRect *)&v71);
            v58 = v180.origin.x;
            v59 = v180.origin.y;
            v60 = v180.size.width;
            v61 = v180.size.height;
          }
          else
          {
            v61 = v70;
            v60 = v69;
            v59 = v68;
            v58 = v67;
          }
          v64 = 1;
        }
        v63 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
      }
      while (v63);
    }
LABEL_66:

    goto LABEL_72;
  }
  v131 = a4;
LABEL_46:
  recta = 1;
LABEL_47:
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v49 = (void *)objc_msgSend(v132, "borderRadii");
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v145, v168, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v146;
    do
    {
      for (m = 0; m != v51; ++m)
      {
        if (*(_QWORD *)v146 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * m), "sizeValue");
        objc_msgSend(v9, "convertSize:toView:", 0);
        objc_msgSend(v48, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v54 + 2.0, v55 + 2.0));
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v145, v168, 16);
    }
    while (v51);
  }
  objc_msgSend(v131, "setCornerRadii:", v48);

  objc_msgSend(v131, "setColor:", objc_msgSend(v132, "tapHighlightColor"));
  if (v5)
  {
    v56 = *MEMORY[0x1E0C9D538];
    v57 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(-[UIView _screen](self, "_screen"), "bounds");
  }
  else
  {
    -[UIWebTiledView visibleRect](self, "visibleRect");
    v56 = v75;
    v57 = v76;
  }
  if (recta)
    objc_msgSend(v131, "setFrames:boundaryRect:", v10, v56, v57);
  else
    objc_msgSend(v131, "setQuads:boundaryRect:", v10, v56, v57);

  v58 = *MEMORY[0x1E0C9D628];
  v59 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v60 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v61 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_72:
  v77 = v58;
  v78 = v59;
  v79 = v60;
  v80 = v61;
  result.size.height = v80;
  result.size.width = v79;
  result.origin.y = v78;
  result.origin.x = v77;
  return result;
}

- (void)_interactionStartedFromPreviewItemController:(id)a3
{
  self->_panGestureWasEnabled = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView", a3), "panGestureRecognizer"), "isEnabled");
  self->_pinchGestureWasEnabled = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView"), "pinchGestureRecognizer"), "isEnabled");
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView"), "panGestureRecognizer"), "setEnabled:", 0);
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView"), "pinchGestureRecognizer"), "setEnabled:", 0);
  -[UIWebDocumentView _collectPreviewRevealInformationIfNeeded](self, "_collectPreviewRevealInformationIfNeeded");
  -[UIWebDocumentView hideTapHighlight](self, "hideTapHighlight");
  -[UIWebDocumentView resetInteraction](self, "resetInteraction");
}

- (void)_interactionStoppedFromPreviewItemController:(id)a3
{
  if (self->_panGestureWasEnabled)
    objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView", a3), "panGestureRecognizer"), "setEnabled:", 1);
  if (self->_pinchGestureWasEnabled)
    objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView", a3), "pinchGestureRecognizer"), "setEnabled:", 1);
  -[_UIWebHighlightLongPressGestureRecognizer cancel](self->_highlightLongPressGestureRecognizer, "cancel", a3);
  -[UIWebDocumentView _clearPreviewRevealInformation](self, "_clearPreviewRevealInformation");
}

- (void)clearInteractionTimer
{
  -[NSTimer invalidate](self->_interaction.timer, "invalidate");

  self->_interaction.timer = 0;
}

- (void)performInteractionSelector:(SEL)a3 afterDelay:(double)a4
{
  self->_interaction.timer = (NSTimer *)(id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, a3, 0, 0, a4);
}

- (void)_resetInteractionWithLocation:(CGPoint)a3 modifierFlags:(int64_t)a4
{
  CGFloat y;
  CGFloat x;

  y = a3.y;
  x = a3.x;
  -[UIWebDocumentView clearInteractionTimer](self, "clearInteractionTimer");
  -[UIWebDocumentView cancelInteraction](self, "cancelInteraction");
  self->_interaction.location.x = x;
  self->_interaction.location.y = y;
  self->_interaction.modifierFlags = a4;
  self->_interaction.isCancelled = 0;
  -[UIWebDocumentView highlightApproximateNodeInverted:](self, "highlightApproximateNodeInverted:", 0);
  if (!self->_interaction.element)
    -[UIWebDocumentView cancelInteraction](self, "cancelInteraction");
}

- (void)startInteractionWithLocation:(CGPoint)a3
{
  _BOOL4 isOnWebThread;

  isOnWebThread = self->_interaction.isOnWebThread;
  self->_interaction.isBlocked = isOnWebThread;
  if (!isOnWebThread)
    -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", 0, a3.x, a3.y);
}

- (void)continueInteractionWithLocation:(CGPoint)a3
{
  if (!self->_interaction.isCancelled)
    -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", 0, a3.x, a3.y);
}

- (void)tapInteractionWithLocation:(CGPoint)a3
{
  if (!self->_interaction.isBlocked && !self->_interaction.var0)
  {
    -[UIWebDocumentView startInteractionWithLocation:](self, "startInteractionWithLocation:", a3.x, a3.y);
    -[UIWebDocumentView attemptClick:](self, "attemptClick:", self);
  }
}

- (void)validateInteractionWithLocation:(CGPoint)a3
{
  if (!self->_interaction.isCancelled && !self->_interaction.isBlocked && !self->_interaction.var0)
  {
    if (!self->_interaction.isDisplayingHighlight)
      -[UIWebDocumentView startInteractionWithLocation:](self, "startInteractionWithLocation:", a3.x, a3.y);
    -[UIWebDocumentView attemptClick:](self, "attemptClick:", self, a3.x, a3.y);
  }
}

- (BOOL)startActionSheet
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;

  p_interaction = &self->_interaction;
  if (self->_interaction.allowsDataDetectorsSheet
    && self->_interaction.element
    && objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "tapAndHoldSchemes"), "containsObject:", -[DOMNode urlScheme](self->_interaction.element, "urlScheme")))
  {
    -[UIWebDocumentView _showDataDetectorsSheet](self, "_showDataDetectorsSheet");
    return 1;
  }
  if (p_interaction->allowsLinkSheet)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIWebDocumentView _showLinkSheet](self, "_showLinkSheet");
      return 1;
    }
  }
  return 0;
}

- (BOOL)isInInteraction
{
  return self->_interaction.attemptedClick || self->_interaction.element != 0;
}

- (BOOL)willInteractWithLocation:(CGPoint)a3
{
  id v4;
  id v5;
  BOOL result;
  CGPoint v7;

  v7 = a3;
  WebThreadLock();
  v4 = -[UIWebDocumentView approximateNodeAtViewportLocation:](self, "approximateNodeAtViewportLocation:", &v7);
  v5 = -[UIWebDocumentView formElement](self, "formElement", *(_QWORD *)&v7.x, *(_QWORD *)&v7.y);
  result = (!-[UIWebDocumentView _parentTextView](self, "_parentTextView")
         || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        && v4
        && !objc_msgSend(v5, "isEqual:", v4);
  return result;
}

- (void)installGestureRecognizers
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  _UIWebHighlightLongPressGestureRecognizer *v6;
  UILongPressGestureRecognizer *v7;
  UIPanGestureRecognizer *v8;

  if (!self->_singleTapGestureRecognizer)
  {
    v3 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__singleTapRecognized_);
    self->_singleTapGestureRecognizer = v3;
    -[UIGestureRecognizer setDelegate:](v3, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_singleTapGestureRecognizer);
    if (!kSingleTapInteractionsEnabled)
    {
      v4 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__doubleTapRecognized_);
      self->_doubleTapGestureRecognizer = v4;
      -[UITapGestureRecognizer setNumberOfTapsRequired:](v4, "setNumberOfTapsRequired:", 2);
      -[UIGestureRecognizer setDelegate:](self->_doubleTapGestureRecognizer, "setDelegate:", self);
      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);
      -[UIGestureRecognizer requireGestureRecognizerToFail:](self->_singleTapGestureRecognizer, "requireGestureRecognizerToFail:", self->_doubleTapGestureRecognizer);
      v5 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__twoFingerDoubleTapRecognized_);
      self->_twoFingerDoubleTapGestureRecognizer = v5;
      -[UITapGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 2);
      -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_twoFingerDoubleTapGestureRecognizer, "setNumberOfTouchesRequired:", 2);
      -[UIGestureRecognizer setDelegate:](self->_twoFingerDoubleTapGestureRecognizer, "setDelegate:", self);
      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_twoFingerDoubleTapGestureRecognizer);
      -[UIGestureRecognizer requireGestureRecognizerToFail:](self->_singleTapGestureRecognizer, "requireGestureRecognizerToFail:", self->_twoFingerDoubleTapGestureRecognizer);
    }
    v6 = -[_UIWebHighlightLongPressGestureRecognizer initWithTarget:action:]([_UIWebHighlightLongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__highlightLongPressRecognized_);
    self->_highlightLongPressGestureRecognizer = v6;
    -[UILongPressGestureRecognizer setDelay:](v6, "setDelay:", 0.12);
    -[UIGestureRecognizer setDelegate:](self->_highlightLongPressGestureRecognizer, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_highlightLongPressGestureRecognizer);
    v7 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__longPressRecognized_);
    self->_longPressGestureRecognizer = v7;
    -[UILongPressGestureRecognizer setDelay:](v7, "setDelay:", 0.75);
    -[UIGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", self);
    -[UILongPressGestureRecognizer _setRequiresQuietImpulse:](self->_longPressGestureRecognizer, "_setRequiresQuietImpulse:", 1);
    -[UILongPressGestureRecognizer set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:](self->_longPressGestureRecognizer, "set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:", 1);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_longPressGestureRecognizer);
    v8 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__twoFingerPanRecognized_);
    self->_twoFingerPanGestureRecognizer = v8;
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v8, "setMinimumNumberOfTouches:", 2);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_twoFingerPanGestureRecognizer, "setMaximumNumberOfTouches:", 2);
    -[UIPanGestureRecognizer setDelegate:](self->_twoFingerPanGestureRecognizer, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_twoFingerPanGestureRecognizer);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_doubleTapGestureRecognizer == a3 || self->_twoFingerDoubleTapGestureRecognizer == a3)
    return 1;
  else
    return !-[UIWebDocumentView _isSubviewOfPlugInView:](self, "_isSubviewOfPlugInView:", objc_msgSend(a4, "view"));
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  if (self->_highlightLongPressGestureRecognizer == a3 || self->_longPressGestureRecognizer == a3)
    return objc_msgSend(a4, "_isGestureType:", 9) ^ 1;
  else
    return 1;
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  return -[UITextInteractionAssistant loupeGesture](self->_textSelectionAssistant, "loupeGesture") != a4
      || self->_highlightLongPressGestureRecognizer != a3 && self->_longPressGestureRecognizer != a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *singleTapGestureRecognizer;
  _UIWebHighlightLongPressGestureRecognizer *highlightLongPressGestureRecognizer;

  if (*(_OWORD *)&self->_highlightLongPressGestureRecognizer == __PAIR128__((unint64_t)a4, (unint64_t)a3)
    || self->_highlightLongPressGestureRecognizer == a4 && self->_longPressGestureRecognizer == a3)
  {
    return 1;
  }
  singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
  if (singleTapGestureRecognizer != a3)
    goto LABEL_7;
  if (-[UITextInteractionAssistant singleTapGesture](self->_textSelectionAssistant, "singleTapGesture") == a4)
    return 1;
  singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
LABEL_7:
  if (singleTapGestureRecognizer == a4
    && -[UITextInteractionAssistant singleTapGesture](self->_textSelectionAssistant, "singleTapGesture") == a3)
  {
    return 1;
  }
  highlightLongPressGestureRecognizer = self->_highlightLongPressGestureRecognizer;
  if (highlightLongPressGestureRecognizer == a3 && self->_previewSecondaryGestureRecognizer == a4)
    return 1;
  if (highlightLongPressGestureRecognizer == a4 && self->_previewSecondaryGestureRecognizer == a3)
    return 1;
  if (highlightLongPressGestureRecognizer == a3 && self->_previewGestureRecognizer == a4)
    return 1;
  if (highlightLongPressGestureRecognizer == a4 && self->_previewGestureRecognizer == a3)
    return 1;
  if (self->_singleTapGestureRecognizer == a3 || self->_doubleTapGestureRecognizer == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return 1;
  }
  return 0;
}

- (void)_singleTapRecognized:(id)a3
{
  int v5;
  int v6;
  BOOL v7;
  BOOL v8;
  double v9;
  double v10;

  objc_msgSend(a3, "location");
  v5 = kSingleTapInteractionsEnabled;
  v6 = kSingleTapInteractionsHeuristic;
  if (kSingleTapInteractionsEnabled)
    v7 = kSingleTapInteractionsHeuristic == 2;
  else
    v7 = 0;
  if (v7)
  {
    objc_msgSend(a3, "location");
    if (-[UIWebDocumentView _handleSingleTapZoomPreClickAtLocation:](self, "_handleSingleTapZoomPreClickAtLocation:"))
      return;
    v5 = kSingleTapInteractionsEnabled;
    v6 = kSingleTapInteractionsHeuristic;
  }
  if (v5)
    v8 = v6 == 3;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(a3, "location");
    -[UIWebDocumentView _handleSingleTapZoomPostClickAtLocation:](self, "_handleSingleTapZoomPostClickAtLocation:");
  }
  else
  {
    if (!self->_interaction.isDisplayingHighlight)
      *((_BYTE *)self + 965) |= 0x20u;
    objc_msgSend(a3, "location");
    -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", objc_msgSend(a3, "modifierFlags"), v9, v10);
    -[UIWebDocumentView attemptClick:](self, "attemptClick:", self);
  }
}

- (void)_doubleTapRecognized:(id)a3
{
  objc_msgSend(a3, "location");
  -[UIWebDocumentView _handleDoubleTapAtLocation:](self, "_handleDoubleTapAtLocation:");
}

- (void)_twoFingerDoubleTapRecognized:(id)a3
{
  objc_msgSend(a3, "location");
  -[UIWebDocumentView _handleTwoFingerDoubleTapAtLocation:](self, "_handleTwoFingerDoubleTapAtLocation:");
}

- (SEL)_actionForLongPressOnElement:(id)a3
{
  if (!objc_msgSend(a3, "touchCalloutEnabled"))
    return 0;
  if (self->_interaction.allowsImageSheet)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return sel__showImageSheet;
  }
  if (self->_interaction.allowsDataDetectorsSheet)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "tapAndHoldSchemes"), "containsObject:", objc_msgSend(a3, "urlScheme")))return sel__showDataDetectorsSheet;
    }
  }
  if (!self->_interaction.allowsLinkSheet)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return sel__showLinkSheet;
  else
    return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v25;
  uint64_t v26;

  if ((*((_BYTE *)self + 964) & 8) == 0
    || (WebThreadLock(),
        objc_msgSend(a3, "locationInView:", self),
        v25 = v5,
        v26 = v6,
        (v7 = -[UIWebDocumentView approximateNodeAtViewportLocation:](self, "approximateNodeAtViewportLocation:", &v25)) != 0))
  {
    if ((self->_highlightLongPressGestureRecognizer == a3
       || self->_doubleTapGestureRecognizer == a3
       || self->_twoFingerDoubleTapGestureRecognizer == a3
       || self->_singleTapGestureRecognizer == a3
       || self->_longPressGestureRecognizer == a3)
      && (WebThreadLock(), (v8 = -[UIWebDocumentView textFormElement](self, "textFormElement")) != 0)
      && (v9 = v8,
          objc_msgSend(a3, "locationInView:", self),
          v25 = v10,
          v26 = v11,
          (v12 = -[UIWebDocumentView approximateNodeAtViewportLocation:](self, "approximateNodeAtViewportLocation:", &v25)) != 0)&& (objc_msgSend(v9, "isSameNode:", v12) & 1) != 0)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      if (self->_highlightLongPressGestureRecognizer == a3)
      {
        objc_msgSend(a3, "locationInView:", objc_msgSend(a3, "view"));
        v25 = v13;
        v26 = v14;
        WebThreadLock();
        v7 = -[UIWebDocumentView approximateNodeAtViewportLocation:](self, "approximateNodeAtViewportLocation:", &v25);
        if (!v7)
          return (char)v7;
        v15 = v7;
        if (!objc_msgSend(v7, "alwaysAttemptToShowTapHighlight")
          || (objc_msgSend(v15, "showsTapHighlight") & 1) == 0)
        {
          LOBYTE(v7) = -[UIWebDocumentView _actionForLongPressOnElement:](self, "_actionForLongPressOnElement:", v15) != 0;
          return (char)v7;
        }
      }
      else if (self->_twoFingerPanGestureRecognizer == a3)
      {
        objc_msgSend(a3, "locationOfTouch:inView:", 0, self);
        v17 = v16;
        v19 = v18;
        objc_msgSend(a3, "locationOfTouch:inView:", 1, self);
        v21 = v20;
        v23 = v22;
        WebThreadLock();
        LOBYTE(v7) = -[UIWebDocumentView supportsTwoFingerScrollingAtTouchLocation:andLocation:](self, "supportsTwoFingerScrollingAtTouchLocation:andLocation:", v17, v19, v21, v23);
        return (char)v7;
      }
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (void)_highlightLongPressRecognized:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = objc_msgSend(a3, "state");
  switch(v5)
  {
    case 4:
      goto LABEL_8;
    case 3:
      if (!-[UIPreviewItemController interactionInProgress](self->_previewItemController, "interactionInProgress"))
      {
        objc_msgSend(a3, "startPoint");
        -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", objc_msgSend(a3, "modifierFlags"), v8, v9);
        -[UIWebDocumentView attemptClick:](self, "attemptClick:", self);
        return;
      }
LABEL_8:
      -[UIWebDocumentView cancelInteraction](self, "cancelInteraction");
      return;
    case 1:
      if (!self->_interaction.isDisplayingHighlight)
        *((_BYTE *)self + 965) |= 0x20u;
      objc_msgSend(a3, "startPoint");
      -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", objc_msgSend(a3, "modifierFlags"), v6, v7);
      break;
  }
}

- (void)_longPressRecognized:(id)a3
{
  const char *v4;
  const char *v5;

  if (objc_msgSend(a3, "state") == 1)
  {
    if (self->_interaction.element)
    {
      v4 = -[UIWebDocumentView _actionForLongPressOnElement:](self, "_actionForLongPressOnElement:");
      if (v4)
      {
        v5 = v4;
        if (dyld_program_sdk_at_least())
          objc_msgSend(self, v5);
        else
          -[UIWebDocumentView performSelector:](self, sel_performSelector_, v5);
        -[_UIWebHighlightLongPressGestureRecognizer cancel](self->_highlightLongPressGestureRecognizer, "cancel");
      }
    }
    else
    {
      -[UIWebDocumentView cancelInteraction](self, "cancelInteraction");
    }
  }
}

- (void)_twoFingerPanRecognized:(id)a3
{
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;

  v5 = objc_msgSend(a3, "state");
  if ((unint64_t)(v5 - 3) < 2)
  {
    -[UIWebDocumentView webViewDidEndOverflowScroll:](self, "webViewDidEndOverflowScroll:", 0);
    return;
  }
  if (v5 != 2)
  {
    if (v5 != 1)
      return;
    objc_msgSend(a3, "locationInView:", self);
    self->_interaction.location.x = v6;
    self->_interaction.location.y = v7;
    self->_interaction.lastPanTranslation = (CGPoint)*MEMORY[0x1E0C9D538];
    -[UIWebDocumentView webViewDidStartOverflowScroll:](self, "webViewDidStartOverflowScroll:", 0);
  }
  if (-[UIPreviewItemController interactionInProgress](self->_previewItemController, "interactionInProgress"))
    -[UIWebDocumentView cancelInteraction](self, "cancelInteraction");
  else
    -[UIWebDocumentView sendScrollWheelEvents](self, "sendScrollWheelEvents");
}

- (void)performClick:(id)a3
{
  WebThreadRun();
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  uint64_t v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  char v14;
  uint64_t v16;
  _QWORD v17[11];

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v17[5] = MEMORY[0x1E0C809B0];
    v17[6] = 3221225472;
    v17[7] = __47__UIWebDocumentView_Interaction__performClick___block_invoke_2;
    v17[8] = &unk_1E16B41B8;
    v17[9] = *(_QWORD *)(a1 + 32);
    WebThreadRunOnMainThread();
  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "nodeCanBecomeFirstResponder");
  if (v4)
  {
    v17[0] = v3;
    v5 = __47__UIWebDocumentView_Interaction__performClick___block_invoke_3;
    v6 = v17;
LABEL_8:
    v7 = v4 ^ 1;
    v6[1] = 3221225472;
    v6[2] = (uint64_t)v5;
    v8 = *(_QWORD *)(a1 + 32);
    v6[3] = (uint64_t)&unk_1E16B41B8;
    v6[4] = v8;
    WebThreadRunOnMainThread();
    goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "isLikelyToBeginPageLoad")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = v3;
    v5 = __47__UIWebDocumentView_Interaction__performClick___block_invoke_4;
    v6 = &v16;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_10:
  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "window");
  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newMouseEvent:", 0);
  objc_msgSend(v9, "sendEventSynchronously:", v10);
  v11 = objc_msgSend(v10, "wasHandled");

  v12 = 1;
  v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "newMouseEvent:", 1);
  objc_msgSend(v9, "sendEventSynchronously:", v13);
  if ((v11 & 1) == 0)
    v12 = objc_msgSend(v13, "wasHandled");

  if ((isKindOfClass & 1) != 0)
    WebThreadRunOnMainThread();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  if (kSingleTapInteractionsEnabled)
    v14 = v12;
  else
    v14 = 1;
  if ((v14 & 1) == 0 && (kSingleTapInteractionsHeuristic - 1) <= 1)
    WebThreadRunOnMainThread();
  return WebThreadRunOnMainThread();
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginAllowingFocusRedirects");
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assistFormNode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 832));
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "webView:willClickElement:");
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endAllowingFocusRedirects");
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "webViewDidClick:");
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_syntheticMouseEventNotHandledAtLocation:", *(double *)(*(_QWORD *)(a1 + 32) + 784), *(double *)(*(_QWORD *)(a1 + 32) + 792));
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeInteraction");
}

- (id)newMouseEvent:(int)a3
{
  uint64_t v3;
  int v5;
  id v6;
  unsigned int modifierFlags;

  v3 = *(_QWORD *)&a3;
  v5 = objc_msgSend(MEMORY[0x1E0DD9748], "instancesRespondToSelector:", sel_initWithMouseEventType_timeStamp_location_modifiers_);
  v6 = objc_alloc(MEMORY[0x1E0DD9748]);
  +[UIWebDocumentView getTimestamp](UIWebDocumentView, "getTimestamp");
  if (!v5)
    return (id)objc_msgSend(v6, "initWithMouseEventType:timeStamp:location:", v3);
  modifierFlags = self->_interaction.modifierFlags;
  return (id)objc_msgSend(v6, "initWithMouseEventType:timeStamp:location:modifiers:", v3, modifierFlags & 0xA0000 | ((HIWORD(modifierFlags) & 1) << 18) & 0xFBEFFFFF | (modifierFlags >> 4) & 0x10000 | (((modifierFlags >> 18) & 1) << 20) & 0xFBFFFFFF | (((modifierFlags >> 23) & 1) << 26));
}

- (void)_sendMouseMoveAndAttemptClick:(id)a3
{
  WebThreadRun();
}

uint64_t __64__UIWebDocumentView_Interaction___sendMouseMoveAndAttemptClick___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v5;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "window");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "newMouseEvent:", 2);
  v5 = 0;
  objc_msgSend(v2, "sendMouseMoveEvent:contentChange:", v3, &v5);

  if (v5 == 1 || v5 == 2)
    return WebThreadRunOnMainThread();
  else
    return objc_msgSend(*(id *)(a1 + 32), "performClick:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__UIWebDocumentView_Interaction___sendMouseMoveAndAttemptClick___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeInteraction");
}

uint64_t __64__UIWebDocumentView_Interaction___sendMouseMoveAndAttemptClick___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deferInteraction");
}

- (void)attemptClick:(id)a3
{
  UIWebDocumentView *v4;
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  UIWebDocumentView *v9;
  void *v10;
  UIWebDocumentView *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v4 = self;
  v15 = *MEMORY[0x1E0C80C00];
  v11 = self;
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
    -[UIWebDocumentView becomeFirstResponder](v4, "becomeFirstResponder");
  -[UIWebDocumentView clearInteractionTimer](v4, "clearInteractionTimer");
  p_interaction = &v4->_interaction;
  if (!v4->_interaction.isDisplayingHighlight && GSEventQueueContainsMouseEvent())
    goto LABEL_14;
  if (-[UIWebDocumentView _isInspectorSearchingForNode](v4, "_isInspectorSearchingForNode"))
  {
    WebThreadLock();
    objc_msgSend(-[UIWebDocumentView deepestNodeAtViewportLocation:](v4, "deepestNodeAtViewportLocation:", v4->_interaction.location.x, v4->_interaction.location.y), "inspect");
LABEL_14:
    -[UIWebDocumentView cancelInteraction](v4, "cancelInteraction");
    return;
  }
  if (!v4->_interaction.isDisplayingHighlight)
    -[UIWebDocumentView highlightApproximateNodeInverted:](v4, "highlightApproximateNodeInverted:", 0);
  if (v4->_interaction.allowsImageSheet
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_respondsToSelector() & 1) != 0
    && -[interactionSheet webView:shouldImmediatelyShowImageSheetForElement:](v4->_interaction.delegate, "webView:shouldImmediatelyShowImageSheetForElement:", v4, v4->_interaction.element))
  {
    -[UIWebDocumentView _showImageSheet](v4, "_showImageSheet");
  }
  else
  {
    if (!v4->_interaction.allowsDataDetectorsSheet)
      goto LABEL_38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_38;
    v6 = (void *)-[DOMNode absoluteLinkURL](v4->_interaction.element, "absoluteLinkURL");
    v7 = -[WebView mainFrame](v4->_webView, "mainFrame");
    if (!v6)
      goto LABEL_38;
    v8 = v7;
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      v12 = 0;
      if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
      {
        v13 = xmmword_1E16ECE10;
        v14 = 0;
        TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
      {
        v4 = (UIWebDocumentView *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)-[UIWebDocumentView handleFailureInFunction:file:lineNumber:description:](v4, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TelephonyUtilitiesLibrary(void)"), CFSTR("UIWebDocumentViewInteraction.m"), 123, CFSTR("%s"), v12);
        __break(1u);
        free(v10);
      }
      if ((objc_msgSend(v6, "hasTelephonyScheme") & 1) != 0)
        goto LABEL_25;
    }
    if (objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController"), "shouldImmediatelyShowActionSheetForURL:forFrame:", v6, v8))
    {
LABEL_25:
      -[UIWebDocumentView _showDataDetectorsSheet](v4, "_showDataDetectorsSheet");
    }
    else
    {
LABEL_38:
      if (p_interaction->element)
      {
        p_interaction->isOnWebThread = 1;
        if (!p_interaction->attemptedClick)
        {
          p_interaction->attemptedClick = 1;
          v9 = v4;
        }
        -[UIWebDocumentView _sendMouseMoveAndAttemptClick:](v4, "_sendMouseMoveAndAttemptClick:", a3);
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend((id)WebThreadMakeNSInvocation(), "setArgument:atIndex:", &v11, 2);
          WebThreadCallDelegateAsync();
        }
        if (kSingleTapInteractionsEnabled && (kSingleTapInteractionsHeuristic - 1) <= 1)
          -[UIWebDocumentView _syntheticMouseEventNotHandledAtLocation:](v11, "_syntheticMouseEventNotHandledAtLocation:", v11->_interaction.location.x, v11->_interaction.location.y);
        -[UIWebDocumentView cancelInteraction](v11, "cancelInteraction");
      }
    }
  }
}

- (void)webView:(id)a3 didObserveDeferredContentChange:(int)a4 forFrame:(id)a5
{
  if (a4)
    -[UIWebDocumentView completeInteraction](self, "completeInteraction", a3, *(_QWORD *)&a4, a5);
  else
    -[UIWebDocumentView performClick:](self, "performClick:", self, *(_QWORD *)&a4, a5);
}

- (id)approximateNodeAtViewportLocation:(CGPoint *)a3
{
  -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)-[WebFrame approximateNodeAtViewportLocation:](-[WebView mainFrame](self->_webView, "mainFrame"), "approximateNodeAtViewportLocation:", a3);
  else
    return 0;
}

- (id)deepestNodeAtViewportLocation:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self->_webView, "mainFrame"), "frameView"), "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)-[WebFrame deepestNodeAtViewportLocation:](-[WebView mainFrame](self->_webView, "mainFrame"), "deepestNodeAtViewportLocation:", x, y);
  else
    return 0;
}

- (void)highlightApproximateNodeInverted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = a3;
  -[UIWebDocumentView clearInteractionTimer](self, "clearInteractionTimer");
  if (!GSEventQueueContainsMouseEvent())
  {
    WebThreadLock();
    v5 = -[UIWebDocumentView approximateNodeAtViewportLocation:](self, "approximateNodeAtViewportLocation:", &self->_interaction.location);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v5 = 0;
    v6 = -[UIWebDocumentView formElement](self, "formElement");
    if (-[UIWebDocumentView _parentTextView](self, "_parentTextView"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_8;
    }
    if (!v5 || objc_msgSend(v6, "isEqual:", v5))
      goto LABEL_8;
    if (v3)
    {
      v7 = +[UIWebDocumentView _createDefaultHighlightView](UIWebDocumentView, "_createDefaultHighlightView");
      -[UIWebTiledView visibleRect](self, "visibleRect");
      -[UIView convertRect:toView:](self, "convertRect:toView:", 0);
      objc_msgSend(v7, "setInvertHighlight:clipRect:", 1);
      objc_msgSend(v5, "showsTapHighlight");
    }
    else
    {
      v8 = +[UIWebDocumentView _sharedHighlightView](UIWebDocumentView, "_sharedHighlightView");
      v7 = v8;
      if (!self->_interaction.element)
      {
        objc_msgSend(v8, "removeFromSuperview");
        if (objc_msgSend(v5, "showsTapHighlight"))
          -[UIView addSubview:](self, "addSubview:", v7);
      }

      self->_interaction.element = (DOMNode *)+[UIThreadSafeNode threadSafeNodeWithNode:](UIThreadSafeNode, "threadSafeNodeWithNode:", v5);
      if ((objc_msgSend(v5, "showsTapHighlight") & 1) == 0)
        goto LABEL_21;
    }
    if ((*((_BYTE *)self + 965) & 0x20) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      -[interactionSheet webViewWillShowInteractionHighlight:](self->_interaction.delegate, "webViewWillShowInteractionHighlight:", self);
    -[UIWebDocumentView computeRectForElement:withHighligh:isInverted:](self, "computeRectForElement:withHighligh:isInverted:", v5, v7, v3);
    if (v3)
    {

LABEL_8:
      *((_BYTE *)self + 965) &= ~0x20u;
      return;
    }
LABEL_21:
    self->_mouseDownCount = 0;
    self->_interaction.isDisplayingHighlight = 1;
    goto LABEL_8;
  }
}

- (void)hideTapHighlight
{
  -[UIWebDocumentView clearInteractionTimer](self, "clearInteractionTimer");
  objc_msgSend(+[UIWebDocumentView _sharedHighlightView](UIWebDocumentView, "_sharedHighlightView"), "removeFromSuperview");
}

- (void)highlightApproximateNodeAndDisplayInfoSheet
{
  DOMNode *element;
  char *v4;

  -[UIWebDocumentView highlightApproximateNodeInverted:](self, "highlightApproximateNodeInverted:", 0);
  element = self->_interaction.element;
  if (!element)
  {
    -[UIWebDocumentView cancelInteraction](self, "cancelInteraction");
    return;
  }
  if (!-[DOMNode touchCalloutEnabled](element, "touchCalloutEnabled"))
    return;
  if (self->_interaction.allowsImageSheet)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = sel__showImageSheet;
LABEL_14:
      -[UIWebDocumentView performInteractionSelector:afterDelay:](self, "performInteractionSelector:afterDelay:", v4, 0.75);
      return;
    }
  }
  if (self->_interaction.allowsDataDetectorsSheet)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "tapAndHoldSchemes"), "containsObject:", -[DOMNode urlScheme](self->_interaction.element, "urlScheme")))
      {
        v4 = sel__showDataDetectorsSheet;
        goto LABEL_14;
      }
    }
  }
  if (self->_interaction.allowsLinkSheet)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = sel__showLinkSheet;
      goto LABEL_14;
    }
  }
}

- (void)resetInteraction
{
  -[UIWebDocumentView clearInteractionTimer](self, "clearInteractionTimer");
  self->_interaction.isCancelled = 1;
  self->_interaction.isDisplayingHighlight = 0;
}

- (void)completeInteraction
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;

  p_interaction = &self->_interaction;
  self->_interaction.isOnWebThread = 0;
  -[UIWebDocumentView cancelInteractionWithImmediateDisplay:](self, "cancelInteractionWithImmediateDisplay:", 0);
  if (p_interaction->attemptedClick)
  {
    p_interaction->attemptedClick = 0;

  }
}

- (void)cancelInteraction
{
  -[UIWebDocumentView cancelInteractionWithImmediateDisplay:](self, "cancelInteractionWithImmediateDisplay:", 1);
}

- (void)deferInteraction
{
  -[UIWebDocumentView resetInteraction](self, "resetInteraction");
  -[UIWebDocumentView performInteractionSelector:afterDelay:](self, "performInteractionSelector:afterDelay:", sel_hideTapHighlight, 0.0);
}

- (void)cancelInteractionWithImmediateDisplay:(BOOL)a3
{
  _BOOL4 v3;
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  DOMNode *element;
  UIWebRotatingAlertController *var0;
  UIWebDocumentView *v8;
  id *p_element;
  BOOL v10;
  _QWORD v11[5];
  double v12[8];
  CGRect v13;

  v3 = a3;
  p_interaction = &self->_interaction;
  if (self->_interaction.var0)
  {
    element = self->_interaction.element;
    if (element)
    {
      -[DOMNode absoluteQuad](element, "absoluteQuad");
      v13.origin.x = quadBoundingBox(v12);
      if (!CGRectIsEmpty(v13))
      {
        if (-[DOMNode ownerDocument](p_interaction->element, "ownerDocument"))
          return;
      }
    }
    var0 = p_interaction->var0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__UIWebDocumentView_Interaction__cancelInteractionWithImmediateDisplay___block_invoke;
    v11[3] = &unk_1E16B41B8;
    v11[4] = self;
    -[UIViewController dismissViewControllerAnimated:completion:](var0, "dismissViewControllerAnimated:completion:", 0, v11);
  }
  -[UIWebDocumentView resetInteraction](self, "resetInteraction");
  if (!v3)
  {
    p_element = (id *)&p_interaction->element;
    if (!p_interaction->element)
      return;
    -[UIWebDocumentView performInteractionSelector:afterDelay:](self, "performInteractionSelector:afterDelay:", sel_hideTapHighlight, 0.0);
    goto LABEL_15;
  }
  v8 = (UIWebDocumentView *)objc_msgSend(+[UIWebDocumentView _sharedHighlightView](UIWebDocumentView, "_sharedHighlightView"), "superview");
  p_element = (id *)&p_interaction->element;
  if (p_interaction->element)
    v10 = 1;
  else
    v10 = v8 == self;
  if (v10)
  {
    -[UIWebDocumentView hideTapHighlight](self, "hideTapHighlight");
LABEL_15:
    if (!p_interaction->var0)
    {
      WebThreadLock();

      *p_element = 0;
    }
  }
}

uint64_t __72__UIWebDocumentView_Interaction__cancelInteractionWithImmediateDisplay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupSheet");
}

- (id)_targetURL
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;

  p_interaction = &self->_interaction;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)-[DOMNode hrefURL](p_interaction->element, "hrefURL");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)-[DOMNode absoluteLinkURL](p_interaction->element, "absoluteLinkURL");
  else
    return 0;
}

- (void)_didDismissElementSheet
{
  -[UIWebDocumentView _cleanupSheet](self, "_cleanupSheet");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[interactionSheet webViewDidDismissElementSheet:](self->_interaction.delegate, "webViewDidDismissElementSheet:", self);
}

- (void)_cleanupSheet
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  UIWebRotatingAlertController *v4;

  p_interaction = &self->_interaction;
  -[UIWebRotatingAlertController doneWithSheet](self->_interaction.var0, "doneWithSheet");
  -[_UIRotatingAlertController setRotatingSheetDelegate:](p_interaction->var0, "setRotatingSheetDelegate:", 0);
  v4 = p_interaction->var0;
  p_interaction->var0 = 0;
  -[UIWebDocumentView completeInteraction](self, "completeInteraction");
}

- (void)sendScrollWheelEvents
{
  double v3;
  double v4;
  double documentScale;
  id v6;
  id v7;

  -[UIPanGestureRecognizer translationInView:](self->_twoFingerPanGestureRecognizer, "translationInView:", self);
  documentScale = self->_documentScale;
  if ((v3 - self->_interaction.lastPanTranslation.x) / documentScale != 0.0
    || (v4 - self->_interaction.lastPanTranslation.y) / documentScale != 0.0)
  {
    self->_interaction.lastPanTranslation.x = v3;
    self->_interaction.lastPanTranslation.y = v4;
    WebThreadLock();
    v6 = objc_alloc(MEMORY[0x1E0DD9748]);
    +[UIWebDocumentView getTimestamp](UIWebDocumentView, "getTimestamp");
    v7 = (id)objc_msgSend(v6, "initWithScrollWheelEventWithTimeStamp:location:deltaX:deltaY:");
    objc_msgSend((id)-[WebView window](self->_webView, "window"), "sendEvent:", v7);

  }
}

- (BOOL)supportsTwoFingerScrollingAtTouchLocation:(CGPoint)a3 andLocation:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = (void *)-[WebView hitTest:](self->_webView, "hitTest:");
  v10 = (void *)-[WebView hitTest:](self->_webView, "hitTest:", x, y);
  v11 = objc_msgSend(v9, "lastScrollableAncestor");
  if (v11 && v11 == objc_msgSend(v10, "lastScrollableAncestor"))
    return 1;
  if (v9 != v10)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v12 = objc_msgSend((id)objc_msgSend(v9, "_frame"), "scrollableNodeAtViewportLocation:", v7, v6);
  v13 = objc_msgSend((id)objc_msgSend(v9, "_frame"), "scrollableNodeAtViewportLocation:", x, y);
  return v12 && v12 == v13;
}

- (void)setInteractionDelegate:(id)a3
{
  self->_interaction.delegate = (interactionSheet *)a3;
}

- (id)interactionDelegate
{
  return self->_interaction.delegate;
}

- (void)setAllowsImageSheet:(BOOL)a3
{
  self->_interaction.allowsImageSheet = a3;
}

- (void)setAllowsDataDetectorsSheet:(BOOL)a3
{
  self->_interaction.allowsDataDetectorsSheet = a3;
}

- (void)setAllowsLinkSheet:(BOOL)a3
{
  self->_interaction.allowsLinkSheet = a3;
}

- (id)interactionElement
{
  return self->_interaction.element;
}

- (CGPoint)interactionLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_interaction.location.x;
  y = self->_interaction.location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)superviewForSheet
{
  UIWebDocumentView *v2;
  UIWebDocumentView *v3;
  UIWindow *v4;
  void *v6;
  id v7;

  v2 = self;
  v3 = -[UIWebDocumentView _parentTextView](self, "_parentTextView");
  if (!v3)
    v3 = v2;
  v4 = -[UIView window](v3, "window");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[interactionSheet superviewForInteractionForWebView:](v2->_interaction.delegate, "superviewForInteractionForWebView:", v2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[interactionSheet superviewForImageSheetForWebView:](v2->_interaction.delegate, "superviewForImageSheetForWebView:", v2);
  v6 = 0;
  do
  {
    v7 = +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v2);
    if (v7)
      v6 = v7;
    v2 = -[UIView superview](v2, "superview");
  }
  while (v2);
  if (v6)
    return (id)objc_msgSend(v6, "view");
  else
    return v4;
}

- (id)_doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)_setAcceptsFirstResponder:(BOOL)a3
{
  self->_interaction.acceptsFirstResponder = a3;
}

- (BOOL)_acceptsFirstResponder
{
  return self->_interaction.acceptsFirstResponder;
}

- (void)_didChangeDragCaretRectFromRect:(CGRect)a3 toRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 IsEmpty;
  _BOOL4 v10;
  _UITextDragCaretView *v11;
  CGRect v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  IsEmpty = CGRectIsEmpty(a3);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v10 = CGRectIsEmpty(v12);
  if (!IsEmpty || !v10)
  {
    if (IsEmpty)
    {
      v11 = -[_UITextDragCaretView initWithTextInputView:]([_UITextDragCaretView alloc], "initWithTextInputView:", self);
      self->_textDragCaretView = v11;
      -[_UITextDragCaretView insertAtPosition:](v11, "insertAtPosition:", +[UIWebCaretRectTextPosition textPositionWithCaretRect:](UIWebCaretRectTextPosition, "textPositionWithCaretRect:", x, y, width, height));
    }
    else if (v10)
    {
      -[_UITextDragCaretView remove](self->_textDragCaretView, "remove");

      self->_textDragCaretView = 0;
    }
    else
    {
      -[_UITextDragCaretView updateToPosition:](self->_textDragCaretView, "updateToPosition:", +[UIWebCaretRectTextPosition textPositionWithCaretRect:](UIWebCaretRectTextPosition, "textPositionWithCaretRect:", x, y, width, height));
    }
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  WebView *webView;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("dragStartedFromWebContent"));
  objc_msgSend(a3, "_locationInView:", self);
  v7 = v6;
  v9 = v8;
  webView = self->_webView;
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", -[UIView window](self, "window"), v6, v8);
  if (!-[WebView _requestStartDataInteraction:globalPosition:](webView, "_requestStartDataInteraction:globalPosition:", v7, v9, v11, v12))return (id)MEMORY[0x1E0C9AA60];
  -[UIWebDocumentView setCurrentDragSourceAction:](self, "setCurrentDragSourceAction:", -[WebView _dragSourceAction](self->_webView, "_dragSourceAction"));
  if (!-[UIWebDocumentView currentDragSourceAction](self, "currentDragSourceAction"))
    return (id)MEMORY[0x1E0C9AA60];
  -[WebView _draggedElementBounds](self->_webView, "_draggedElementBounds");
  self->_currentDragBoundingRect.origin.x = v13;
  self->_currentDragBoundingRect.origin.y = v14;
  self->_currentDragBoundingRect.size.width = v15;
  self->_currentDragBoundingRect.size.height = v16;
  -[UIWebDocumentView setDraggedLinkURL:](self, "setDraggedLinkURL:", -[WebView _draggedLinkURL](self->_webView, "_draggedLinkURL"));
  -[UIWebDocumentView setDraggedLinkTitle:](self, "setDraggedLinkTitle:", -[WebView _draggedLinkTitle](self->_webView, "_draggedLinkTitle"));
  v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD9760], "sharedInstance"), "takeRegistrationLists"), "firstObject"), "itemProvider");
  if (v17)
  {
    v30[0] = v17;
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (!objc_msgSend(v18, "count"))
    return (id)MEMORY[0x1E0C9AA60];
  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = (void *)-[UIWebDraggingDelegate _webView:adjustedItemProviders:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:adjustedItemProviders:", self, v18);
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v18);
        objc_msgSend(v19, "addObject:", -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i)));
      }
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v21);
  }
  return v19;
}

- (CGRect)convertRectWithDocumentScale:(CGRect)a3
{
  double documentScale;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  documentScale = self->_documentScale;
  v4 = a3.origin.x * documentScale;
  v5 = a3.origin.y * documentScale;
  v6 = a3.size.width * documentScale;
  v7 = a3.size.height * documentScale;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)targetedDragPreviewFromCurrentTextIndicatorData
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIImageView *v19;
  uint64_t v20;
  uint64_t v21;
  UIImageView *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UIDragPreviewTarget *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  UIDragPreviewParameters *v37;
  UIColor *v38;
  UITargetedDragPreview *v39;
  UIImageView *v40;
  UIDragPreviewTarget *v41;
  UIDragPreviewTarget *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[WebView _getDataInteractionData](self->_webView, "_getDataInteractionData");
  v4 = objc_msgSend(v3, "dataInteractionImage");
  v5 = -[UIWebDocumentView currentDragSourceAction](self, "currentDragSourceAction");
  objc_msgSend(v3, "textBoundingRectInRootViewCoordinates");
  x = v55.origin.x;
  y = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  if (CGRectIsEmpty(v55))
  {
    x = self->_currentDragBoundingRect.origin.x;
    y = self->_currentDragBoundingRect.origin.y;
    width = self->_currentDragBoundingRect.size.width;
    height = self->_currentDragBoundingRect.size.height;
  }
  v10 = (void *)objc_msgSend(v3, "textRectsInBoundingRectCoordinates");
  if (!objc_msgSend(v10, "count"))
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height));
  -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:", x, y, width, height);
  if ((v5 & 0xC) != 0)
  {
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v19 = [UIImageView alloc];
    v20 = objc_msgSend(v3, "contentImage");
    if (v20)
      v21 = v20;
    else
      v21 = v4;
    v22 = -[UIImageView initWithImage:](v19, "initWithImage:", v21);
    objc_msgSend(+[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", objc_msgSend(-[UIView _window](self, "_window"), "windowScene")), "convertRect:fromView:", self, v15, v16, v17, v18);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[UIImageView setFrame:](v22, "setFrame:");
    v31 = -[UIPreviewTarget initWithContainer:center:]([UIDragPreviewTarget alloc], "initWithContainer:center:", +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", objc_msgSend(-[UIView _window](self, "_window"), "windowScene")), v24 + v28 * 0.5, v26 + v30 * 0.5);
    if (self->_documentScale != 1.0)
    {
      v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v33 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v50;
        do
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v50 != v35)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v36), "CGRectValue");
            -[UIWebDocumentView convertRectWithDocumentScale:](self, "convertRectWithDocumentScale:");
            objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:"));
            ++v36;
          }
          while (v34 != v36);
          v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        }
        while (v34);
      }
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v32);
    }
    v37 = -[UIPreviewParameters initWithTextLineRects:]([UIDragPreviewParameters alloc], "initWithTextLineRects:", v10);
    v38 = (UIColor *)objc_msgSend(v3, "estimatedBackgroundColor");
    if (!v38)
      v38 = +[UIColor whiteColor](UIColor, "whiteColor");
    -[UIPreviewParameters setBackgroundColor:](v37, "setBackgroundColor:", v38);
    v39 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", v22, v37, v31);

  }
  else if ((v5 & 2) != 0)
  {
    v40 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v4);
    -[UIView convertRect:toView:](self, "convertRect:toView:", self, self->_currentDragBoundingRect.origin.x, self->_currentDragBoundingRect.origin.y, self->_currentDragBoundingRect.size.width, self->_currentDragBoundingRect.size.height);
    -[UIImageView setFrame:](v40, "setFrame:");
    v41 = [UIDragPreviewTarget alloc];
    __asm { FMOV            V2.2D, #0.5 }
    v47 = -[UIPreviewTarget initWithContainer:center:](v41, "initWithContainer:center:", self, vaddq_f64((float64x2_t)self->_currentDragBoundingRect.origin, vmulq_f64((float64x2_t)self->_currentDragBoundingRect.size, _Q2)));
    v37 = objc_alloc_init(UIDragPreviewParameters);
    -[UIPreviewParameters setBackgroundColor:](v37, "setBackgroundColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
    v39 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", v40, v37, v47);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unhandled draggable content type: %tu"), v5);
    v37 = 0;
    v39 = 0;
  }

  return v39;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id result;

  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return -[UIWebDocumentView targetedDragPreviewFromCurrentTextIndicatorData](self, "targetedDragPreviewFromCurrentTextIndicatorData");
  result = (id)-[UIWebDraggingDelegate _webView:previewForLiftingItem:session:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:previewForLiftingItem:session:", self, a4, a5);
  if (!result)
    return -[UIWebDocumentView targetedDragPreviewFromCurrentTextIndicatorData](self, "targetedDragPreviewFromCurrentTextIndicatorData");
  return result;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  objc_msgSend(+[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", objc_msgSend(a3, "view")), "dismissCurrentMenu");
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id result;

  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return -[UIWebDocumentView targetedDragPreviewFromCurrentTextIndicatorData](self, "targetedDragPreviewFromCurrentTextIndicatorData");
  result = (id)-[UIWebDraggingDelegate _webView:previewForCancellingItem:withDefault:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:previewForCancellingItem:withDefault:", self, a4, a5);
  if (!result)
    return -[UIWebDocumentView targetedDragPreviewFromCurrentTextIndicatorData](self, "targetedDragPreviewFromCurrentTextIndicatorData");
  return result;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  if (!self->_isPerformingDrop)
    -[UIWebDocumentView resetCurrentDragInformation](self, "resetCurrentDragInformation", a3, a4, a5);
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIWebDraggingDelegate _webView:dataOwnerForDragSession:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:dataOwnerForDragSession:", self, a4);
  else
    return 0;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;

  y = a5.y;
  x = a5.x;
  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIWebDraggingDelegate _webView:dataOwnerForAddingToSession:withTouchAtPoint:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:dataOwnerForAddingToSession:withTouchAtPoint:", self, a4, x, y);
  else
    return 0;
}

- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4
{
  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIWebDraggingDelegate _webView:dragSessionSupportsSystemDrag:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:dragSessionSupportsSystemDrag:", self, a4);
  else
    return 1;
}

- (void)_createSheetWithElementActions:(id)a3 showLinkTitle:(BOOL)a4
{
  _BOOL4 v4;
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  UIWebRotatingAlertController *var0;
  id v7;
  int v8;
  UIWebRotatingAlertController *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[7];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  p_interaction = &self->_interaction;
  var0 = self->_interaction.var0;
  if (var0)

  v7 = -[UIWebDocumentView _targetURL](self, "_targetURL");
  v8 = objc_msgSend(v7, "isJavaScriptURL");
  if (!v8
    || objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD9780], "standardPreferences"), "isJavaScriptEnabled"))
  {
    p_interaction->documentScale = self->_documentScale;
    v9 = -[UIWebRotatingAlertController initWithUIWebDocumentView:]([UIWebRotatingAlertController alloc], "initWithUIWebDocumentView:", self);
    p_interaction->var0 = v9;
    -[_UIRotatingAlertController setRotatingSheetDelegate:](v9, "setRotatingSheetDelegate:", self);
    -[UIAlertController setPreferredStyle:](v9, "setPreferredStyle:", 0);
    if (v4)
    {
      if (v8)
        v10 = objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("JavaScript Action Sheet Title"), CFSTR("JavaScript"), CFSTR("Localizable"));
      else
        v10 = objc_msgSend(v7, "_web_userVisibleString");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = 0;
        goto LABEL_13;
      }
      v10 = -[DOMNode getAttribute:](p_interaction->element, "getAttribute:", CFSTR("title"));
    }
    v11 = (void *)v10;
LABEL_13:
    if (objc_msgSend(v11, "length"))
      -[UIAlertController setTitle:](v9, "setTitle:", v11);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(a3);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "_title");
          v22[4] = v17;
          v23[0] = v13;
          v23[1] = 3221225472;
          v23[2] = __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke;
          v23[3] = &unk_1E16C3D18;
          v23[4] = v9;
          v23[5] = self;
          v23[6] = v17;
          v22[0] = v13;
          v22[1] = 3221225472;
          v22[2] = __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke_2;
          v22[3] = &unk_1E16ECCB0;
          -[UIAlertController _addActionWithTitle:style:handler:shouldDismissHandler:](v9, "_addActionWithTitle:style:handler:shouldDismissHandler:", v18, 0, v23, v22);
        }
        v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke_3;
    v21[3] = &unk_1E16ECCD8;
    v21[4] = self;
    -[UIAlertController addAction:](v9, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel")), 1, v21));
  }
}

_QWORD *__86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[106])
  {
    objc_msgSend(*(id *)(a1 + 48), "_runActionWithElement:targetURL:documentView:interactionLocation:", result[104], objc_msgSend(result, "_targetURL"), *(double *)(*(_QWORD *)(a1 + 40) + 784), *(double *)(*(_QWORD *)(a1 + 40) + 792));
    if (!objc_msgSend(*(id *)(a1 + 48), "dismissalHandler"))
      return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "_didDismissElementSheet");
    result = (_QWORD *)(*(uint64_t (**)(void))(objc_msgSend(*(id *)(a1 + 48), "dismissalHandler") + 16))();
    if ((_DWORD)result)
      return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "_didDismissElementSheet");
  }
  return result;
}

uint64_t __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke_2(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "dismissalHandler"))
    return (*(uint64_t (**)(void))(objc_msgSend(*(id *)(a1 + 32), "dismissalHandler") + 16))();
  else
    return 1;
}

uint64_t __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didDismissElementSheet");
}

- (void)_appendOpenActionsForURL:(id)a3 actions:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (_UIApplicationHasAppLinkEntitlements() && (v6 = _UIAppLinkForURL(a3)) != 0)
  {
    v7 = v6;
    v10 = CFSTR("UIWebElementActionContextAppLinkKey");
    v11[0] = v6;
    objc_msgSend(a4, "addObject:", +[UIWebElementAction standardElementActionWithType:customTitle:context:](UIWebElementAction, "standardElementActionWithType:customTitle:context:", 5, 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
    if (objc_msgSend((id)objc_msgSend(v7, "targetApplicationProxy"), "localizedNameForContext:", 0))
    {
      v8 = CFSTR("UIWebElementActionContextAppLinkKey");
      v9 = v7;
      objc_msgSend(a4, "addObject:", +[UIWebElementAction standardElementActionWithType:customTitle:context:](UIWebElementAction, "standardElementActionWithType:customTitle:context:", 6, 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1)));
    }
  }
  else
  {
    objc_msgSend(a4, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 1));
  }
}

- (void)_showImageSheet
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  p_interaction = &self->_interaction;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[interactionSheet webView:showCustomImageSheetForElement:fromLocation:](p_interaction->delegate, "webView:showCustomImageSheetForElement:fromLocation:", self, p_interaction->element, p_interaction->location.x, p_interaction->location.y))
  {
    objc_msgSend((id)UIApp, "_cancelAllEventsOfType:onWindowScene:", 0, objc_msgSend(-[UIView _window](self, "_window"), "windowScene"));
    return;
  }
  v4 = (void *)-[DOMNode hrefURL](p_interaction->element, "hrefURL");
  v5 = -[DOMNode showsTapHighlight](p_interaction->element, "showsTapHighlight");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((_DWORD)v5)
    -[UIWebDocumentView _appendOpenActionsForURL:actions:](self, "_appendOpenActionsForURL:actions:", v4, v6);
  if (objc_msgSend((id)getSSReadingListClass_0(), "supportsURL:", v4))
    objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 4));
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v7 = (uint64_t *)qword_1ECD82970;
  v18 = (void *)qword_1ECD82970;
  if (!qword_1ECD82970)
  {
    v8 = TCCLibrary_0();
    v7 = (uint64_t *)dlsym(v8, "kTCCServicePhotos");
    v16[3] = (uint64_t)v7;
    qword_1ECD82970 = (uint64_t)v7;
  }
  _Block_object_dispose(&v15, 8);
  if (!v7)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkTCCServicePhotos(void)"), CFSTR("UIWebDocumentViewInteraction.m"), 126, CFSTR("%s"), dlerror());
LABEL_27:
    __break(1u);
    return;
  }
  v9 = *v7;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v10 = off_1ECD82968;
  v18 = off_1ECD82968;
  if (!off_1ECD82968)
  {
    v11 = TCCLibrary_0();
    v10 = dlsym(v11, "TCCAccessPreflight");
    v16[3] = (uint64_t)v10;
    off_1ECD82968 = v10;
  }
  _Block_object_dispose(&v15, 8);
  if (!v10)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TCCAccessPreflightResult __TCCAccessPreflight(CFStringRef, CFDictionaryRef)"), CFSTR("UIWebDocumentViewInteraction.m"), 125, CFSTR("%s"), dlerror());
    goto LABEL_27;
  }
  if (((unsigned int (*)(uint64_t, _QWORD))v10)(v9, 0) != 1)
    objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 3));
  if ((objc_msgSend(v4, "isJavaScriptURL") & 1) == 0)
    objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 2));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = -[interactionSheet webView:actionsForImageElement:withTargetURL:suggestedActions:](p_interaction->delegate, "webView:actionsForImageElement:withTargetURL:suggestedActions:", self, p_interaction->element, v4, (id)objc_msgSend(v6, "copy"));
    if (v12)
      v6 = (void *)v12;
  }
  -[UIWebDocumentView _createSheetWithElementActions:showLinkTitle:](self, "_createSheetWithElementActions:showLinkTitle:", v6, v5);
  if (p_interaction->var0)
  {
    -[UIWebDocumentView highlightApproximateNodeInverted:](self, "highlightApproximateNodeInverted:", 1);
    if (!-[UIWebRotatingAlertController presentSheet](p_interaction->var0, "presentSheet"))
      -[UIWebDocumentView _didDismissElementSheet](self, "_didDismissElementSheet");
  }
}

- (void)_showLinkSheet
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  p_interaction = &self->_interaction;
  v4 = -[DOMNode absoluteLinkURL](self->_interaction.element, "absoluteLinkURL");
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    -[UIWebDocumentView _appendOpenActionsForURL:actions:](self, "_appendOpenActionsForURL:actions:", v5, v6);
    if (objc_msgSend((id)getSSReadingListClass_0(), "supportsURL:", v5))
      objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 4));
    if ((objc_msgSend(v5, "isJavaScriptURL") & 1) == 0)
    {
      objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 2));
      objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 7));
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = -[interactionSheet webView:actionsForLinkElement:withTargetURL:suggestedActions:](p_interaction->delegate, "webView:actionsForLinkElement:withTargetURL:suggestedActions:", self, p_interaction->element, v5, (id)objc_msgSend(v6, "copy"));
      if (v7)
        v6 = (void *)v7;
    }
    -[UIWebDocumentView _createSheetWithElementActions:showLinkTitle:](self, "_createSheetWithElementActions:showLinkTitle:", v6, 1);
    if (p_interaction->var0)
    {
      -[UIWebDocumentView hideTapHighlight](self, "hideTapHighlight");
      if (!-[UIWebRotatingAlertController presentSheet](p_interaction->var0, "presentSheet"))
        -[UIWebDocumentView _didDismissElementSheet](self, "_didDismissElementSheet");
    }
  }
}

- (void)actionDidFinish
{
  if (self->m_parentTextView)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->m_parentTextView, "actionDidFinish");
  }
}

- (void)_showDataDetectorsSheet
{
  $20B7F18E1186C5B84743D38AAA47AB57 *p_interaction;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  $20B7F18E1186C5B84743D38AAA47AB57 *v14;
  _QWORD v15[5];
  _QWORD v16[7];

  p_interaction = &self->_interaction;
  v4 = -[DOMNode absoluteLinkURL](self->_interaction.element, "absoluteLinkURL");
  if (v4)
  {
    v5 = (void *)v4;
    v6 = DataDetectorsUIGetClass(CFSTR("DDDetectionController"));
    if (objc_msgSend((id)objc_msgSend(v6, "tapAndHoldSchemes"), "containsObject:", objc_msgSend(v5, "scheme")))
    {
      v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "sharedController"), "actionsForDOMNode:forFrame:", p_interaction->element, -[WebView mainFrame](self->_webView, "mainFrame"));
      if (objc_msgSend(v7, "count"))
      {
        v14 = p_interaction;
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (objc_msgSend(v7, "count"))
        {
          v9 = 0;
          v10 = MEMORY[0x1E0C809B0];
          do
          {
            v11 = (void *)objc_msgSend(v7, "objectAtIndex:", v9);
            v12 = objc_msgSend(v11, "localizedName");
            v16[0] = v10;
            v16[1] = 3221225472;
            v16[2] = __64__UIWebDocumentView_InteractionPrivate___showDataDetectorsSheet__block_invoke;
            v16[3] = &unk_1E16ECD00;
            v16[4] = v6;
            v16[5] = v11;
            v16[6] = self;
            v13 = +[UIWebElementAction customElementActionWithTitle:actionHandler:](UIWebElementAction, "customElementActionWithTitle:actionHandler:", v12, v16);
            v15[0] = v10;
            v15[1] = 3221225472;
            v15[2] = __64__UIWebDocumentView_InteractionPrivate___showDataDetectorsSheet__block_invoke_2;
            v15[3] = &unk_1E16ECCB0;
            v15[4] = v11;
            objc_msgSend(v13, "setDismissalHandler:", v15);
            objc_msgSend(v8, "addObject:", v13);
            ++v9;
          }
          while (v9 < objc_msgSend(v7, "count"));
        }
        -[UIWebDocumentView _createSheetWithElementActions:showLinkTitle:](self, "_createSheetWithElementActions:showLinkTitle:", v8, 0);
        if (v14->var0)
        {
          -[UIWebDocumentView hideTapHighlight](self, "hideTapHighlight");
          if ((unint64_t)objc_msgSend(v8, "count") <= 1)
            -[_UIRotatingAlertController setArrowDirections:](v14->var0, "setArrowDirections:", 3);
          if (!-[UIWebRotatingAlertController presentSheet](v14->var0, "presentSheet"))
            -[UIWebDocumentView _didDismissElementSheet](self, "_didDismissElementSheet");
        }
      }
    }
  }
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___showDataDetectorsSheet__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedController"), "performAction:fromAlertController:interactionDelegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 848));
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___showDataDetectorsSheet__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasUserInterface") ^ 1;
}

- (CGRect)_presentationRectForSheetGivenPoint:(CGPoint)a3 inHostView:(id)a4
{
  CGRect v4;

  objc_msgSend(a4, "convertPoint:fromView:", self, a3.x, a3.y);
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  return CGRectInset(v4, -22.0, -22.0);
}

- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v4 = -[UIWebDocumentView superviewForSheet](self, "superviewForSheet", a3);
  if (v4)
  {
    -[UIWebDocumentView _presentationRectForSheetGivenPoint:inHostView:](self, "_presentationRectForSheetGivenPoint:inHostView:", v4, self->_interaction.location.x, self->_interaction.location.y);
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)presentationRectInHostViewForSheet:(id)a3
{
  id v4;
  id v5;
  DOMNode *element;
  DOMNode *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double x;
  double y;
  double documentScale;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  WebThreadLock();
  v4 = -[UIWebDocumentView superviewForSheet](self, "superviewForSheet");
  if (!v4)
    goto LABEL_12;
  v5 = v4;
  element = self->_interaction.element;
  if (element)
  {
    -[DOMNode absoluteQuad](element, "absoluteQuad");
    v7 = self->_interaction.element;
  }
  else
  {
    v7 = 0;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
  }
  v8 = quadBoundingBox((double *)&v29);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[DOMDocument webFrame](-[DOMNode ownerDocument](v7, "ownerDocument"), "webFrame");
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.width = v12;
  v34.size.height = v14;
  if (CGRectIsEmpty(v34))
    goto LABEL_12;
  if (v15)
  {
    x = self->_interaction.location.x;
    y = self->_interaction.location.y;
    documentScale = self->_interaction.documentScale;
    v19 = self->_documentScale;
    if (documentScale != v19)
    {
      v20 = v19 / documentScale;
      x = x * v20;
      y = y * v20;
      self->_interaction.documentScale = v19;
    }
    -[UIWebDocumentView convertRect:fromFrame:](self, "convertRect:fromFrame:", v15, v8, v10, v12, v14, v29, v30, v31, v32);
    v21 = v35.origin.x;
    v22 = v35.origin.y;
    width = v35.size.width;
    height = v35.size.height;
    v33.x = x;
    v33.y = y;
    if (!CGRectContainsPoint(v35, v33))
    {
      v36.origin.x = v21;
      v36.origin.y = v22;
      v36.size.width = width;
      v36.size.height = height;
      x = CGRectGetMidX(v36);
      v37.origin.x = v21;
      v37.origin.y = v22;
      v37.size.width = width;
      v37.size.height = height;
      y = CGRectGetMidY(v37);
    }
    self->_interaction.location.x = x;
    self->_interaction.location.y = y;
    -[UIWebDocumentView _presentationRectForSheetGivenPoint:inHostView:](self, "_presentationRectForSheetGivenPoint:inHostView:", v5, x, y);
  }
  else
  {
LABEL_12:
    v25 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)resetCurrentDragInformation
{
  uint64_t v3;
  CGSize v4;

  -[UIWebDocumentView setCurrentDragSourceAction:](self, "setCurrentDragSourceAction:", 0);
  v3 = MEMORY[0x1E0C9D648];
  -[UIWebDocumentView setCurrentDragCaretRect:](self, "setCurrentDragCaretRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIWebDocumentView setDraggedLinkURL:](self, "setDraggedLinkURL:", 0);
  -[UIWebDocumentView setDraggedLinkTitle:](self, "setDraggedLinkTitle:", 0);
  -[UIWebDocumentView setLastGlobalPosition:](self, "setLastGlobalPosition:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD9760], "sharedInstance"), "hasPendingOperation") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD9760], "sharedInstance"), "setItemProviders:", 0);
  -[UIView removeFromSuperview](-[UIWebDocumentView initialDropSnapshotView](self, "initialDropSnapshotView"), "removeFromSuperview");
  -[UIWebDocumentView setInitialDropSnapshotView:](self, "setInitialDropSnapshotView:", 0);
  v4 = *(CGSize *)(v3 + 16);
  self->_currentDragBoundingRect.origin = *(CGPoint *)v3;
  self->_currentDragBoundingRect.size = v4;
  -[UITextInteractionAssistant setGestureRecognizers](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "setGestureRecognizers");
}

- (void)updateDragCaretIfPossible
{
  -[WebView _dataInteractionCaretRect](self->_webView, "_dataInteractionCaretRect");
  -[UIWebDocumentView setCurrentDragCaretRect:](self, "setCurrentDragCaretRect:");
}

- (void)computeClientAndGlobalPointsForSession:(id)a3 outClientPoint:(CGPoint *)a4 outGlobalPoint:(CGPoint *)a5
{
  CGFloat v9;
  CGFloat v10;
  UIWindow *v11;
  CGFloat v12;
  CGFloat v13;

  if (a4)
  {
    objc_msgSend(a3, "locationInView:", self);
    a4->x = v9;
    a4->y = v10;
  }
  if (a5)
  {
    v11 = -[UIView window](self, "window");
    if (v11)
      objc_msgSend(a3, "locationInView:", v11);
    else
      -[UIWebDocumentView lastGlobalPosition](self, "lastGlobalPosition");
    a5->x = v12;
    a5->y = v13;
  }
}

- (void)_transitionDragPreviewToImageIfNecessary:(id)a3
{
  NSURL *v5;
  NSURL *v6;
  NSString *v7;
  uint64_t v8;

  if ((-[UIWebDocumentView currentDragSourceAction](self, "currentDragSourceAction") & 6) == 4)
  {
    v5 = -[UIWebDocumentView draggedLinkURL](self, "draggedLinkURL");
    if (v5)
    {
      v6 = v5;
      v7 = -[UIWebDocumentView draggedLinkTitle](self, "draggedLinkTitle");
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "items", MEMORY[0x1E0C809B0], 3221225472, __82__UIWebDocumentView_InteractionPrivate___transitionDragPreviewToImageIfNecessary___block_invoke, &unk_1E16ECD28, v7, v6, *(_QWORD *)&self->_currentDragBoundingRect.origin.x, *(_QWORD *)&self->_currentDragBoundingRect.origin.y, *(_QWORD *)&self->_currentDragBoundingRect.size.width, *(_QWORD *)&self->_currentDragBoundingRect.size.height), "firstObject"), "setPreviewProvider:", &v8);
    }
  }
}

UIDragPreview *__82__UIWebDocumentView_InteractionPrivate___transitionDragPreviewToImageIfNecessary___block_invoke(uint64_t a1)
{
  UIURLDragPreviewView *v2;
  UIDragPreviewParameters *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = +[UIURLDragPreviewView viewWithTitle:URL:](UIURLDragPreviewView, "viewWithTitle:URL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  __asm { FMOV            V2.2D, #0.5 }
  -[UIView setCenter:](v2, "setCenter:", vaddq_f64(*(float64x2_t *)(a1 + 48), vmulq_f64(*(float64x2_t *)(a1 + 64), _Q2)));
  v8 = [UIDragPreviewParameters alloc];
  v9 = (void *)MEMORY[0x1E0CB3B18];
  -[UIView bounds](v2, "bounds");
  v11[0] = objc_msgSend(v9, "valueWithCGRect:");
  return -[UIDragPreview initWithView:parameters:]([UIDragPreview alloc], "initWithView:parameters:", v2, -[UIPreviewParameters initWithTextLineRects:](v8, "initWithTextLineRects:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1)));
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebDraggingDelegate _webView:sessionDidEnter:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:sessionDidEnter:", self, a4);
  self->_isPerformingDrop = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD9760], "sharedInstance"), "setItemProviders:", extractItemProvidersFromDropSession(a4));
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  -[UIWebDocumentView computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:](self, "computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:", a4, &v7, &v9);
  -[UIWebDocumentView setLastGlobalPosition:](self, "setLastGlobalPosition:", v9, v10);
  v6 = objc_msgSend(a4, "_operationMask");
  -[WebView _enteredDataInteraction:client:global:operation:](self->_webView, "_enteredDataInteraction:client:global:operation:", a4, v6, v7, v8, v9, v10);
  -[UIWebDocumentView updateDragCaretIfPossible](self, "updateDragCaretIfPossible");
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  -[UIWebDocumentView _transitionDragPreviewToImageIfNecessary:](self, "_transitionDragPreviewToImageIfNecessary:", a4);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIDropProposal *v10;
  id result;
  double v12;
  double v13;
  double v14;
  double v15;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD9760], "sharedInstance", a3), "setItemProviders:", extractItemProvidersFromDropSession(a4));
  v14 = 0.0;
  v15 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  -[UIWebDocumentView computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:](self, "computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:", a4, &v12, &v14);
  -[UIWebDocumentView setLastGlobalPosition:](self, "setLastGlobalPosition:", v14, v15);
  v6 = objc_msgSend(a4, "_operationMask");
  v7 = -[WebView _updatedDataInteraction:client:global:operation:](self->_webView, "_updatedDataInteraction:client:global:operation:", a4, v6, v12, v13, v14, v15);
  v8 = 3;
  if (v7 != 16)
    v8 = 0;
  if (v7 == 1)
    v9 = 2;
  else
    v9 = v8;
  v10 = -[UIDropProposal initWithDropOperation:]([UIDropProposal alloc], "initWithDropOperation:", v9);
  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (result = (id)-[UIWebDraggingDelegate _webView:willUpdateDropProposalToProposal:forSession:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:willUpdateDropProposalToProposal:forSession:", self, v10, a4), v10 == result))
  {
    -[UIWebDocumentView updateDragCaretIfPossible](self, "updateDragCaretIfPossible");
    return v10;
  }
  return result;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  void *v9;
  UIView *v10;
  uint64_t v11;
  uint64_t v12;
  UIImageView *v13;
  UIColor *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebDraggingDelegate _webView:dropInteraction:item:willAnimateDropWithAnimator:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:dropInteraction:item:willAnimateDropWithAnimator:", self, a3, a4, a5);
  v9 = (void *)-[WebView _dataOperationTextIndicator](self->_webView, "_dataOperationTextIndicator");
  v10 = -[UIWebDocumentView initialDropSnapshotView](self, "initialDropSnapshotView");
  v11 = objc_msgSend(v9, "contentImageWithoutSelection");
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v13 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", objc_msgSend(v9, "contentImageWithoutSelection"));
    v14 = (UIColor *)objc_msgSend(v9, "estimatedBackgroundColor");
    if (!v14)
      v14 = +[UIColor whiteColor](UIColor, "whiteColor");
    -[UIImageView setBackgroundColor:](v13, "setBackgroundColor:", v14);
    objc_msgSend(v9, "contentImageWithoutSelectionRectInRootViewCoordinates");
    -[UIImageView setFrame:](v13, "setFrame:");
    -[UIView insertSubview:below:](self, "insertSubview:below:", v13, v10);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v17[3] = &unk_1E16ECD50;
    v17[4] = v13;
    objc_msgSend(a5, "addCompletion:", v17);
  }
  if (v10)
  {
    v15[4] = v10;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2;
    v16[3] = &unk_1E16B41B8;
    v16[4] = v10;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke_3;
    v15[3] = &unk_1E16E8700;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v16, v15, 0.1);
    -[UIWebDocumentView setInitialDropSnapshotView:](self, "setInitialDropSnapshotView:", 0);
  }
}

void __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");

}

uint64_t __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebDraggingDelegate _webView:sessionDidExit:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:sessionDidExit:", self, a4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DD9760], "sharedInstance"), "setItemProviders:", extractItemProvidersFromDropSession(a4));
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  -[UIWebDocumentView computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:](self, "computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:", a4, &v7, &v9);
  v6 = objc_msgSend(a4, "_operationMask");
  -[WebView _exitedDataInteraction:client:global:operation:](self->_webView, "_exitedDataInteraction:client:global:operation:", a4, v6, v7, v8, v9, v10);
  -[UIWebDocumentView setCurrentDragCaretRect:](self, "setCurrentDragCaretRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  UIWebDraggingDelegate *v6;
  void *ItemProvidersFromDropSession;
  void *v8;
  uint64_t v9;

  +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("dropOnWebContent"));
  v6 = -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[UIWebDraggingDelegate _webView:performDropWithSession:](v6, "_webView:performDropWithSession:", self, a4) & 1) == 0)
  {
    ItemProvidersFromDropSession = extractItemProvidersFromDropSession(a4);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (-[UIWebDraggingDelegate _webView:performDropWithItemProviders:](v6, "_webView:performDropWithItemProviders:", self, ItemProvidersFromDropSession) & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (ItemProvidersFromDropSession = (void *)-[UIWebDraggingDelegate _webView:willPerformDropWithSession:](v6, "_webView:willPerformDropWithSession:", self, a4), objc_msgSend(ItemProvidersFromDropSession, "count")))
      {
        self->_didCreateDropPreview = 0;
        self->_didEndDropSession = 0;
        self->_isPerformingDrop = 1;
        v8 = (void *)objc_msgSend(MEMORY[0x1E0DD9760], "sharedInstance");
        objc_msgSend(v8, "incrementPendingOperationCount", MEMORY[0x1E0C809B0], 3221225472, __69__UIWebDocumentView_InteractionPrivate__dropInteraction_performDrop___block_invoke, &unk_1E16ECD78, self, a4, ItemProvidersFromDropSession, v8);
        objc_msgSend(v8, "setItemProviders:", ItemProvidersFromDropSession);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "doAfterLoadingProvidedContentIntoFileURLs:synchronousTimeout:", &v9, 0.25);
        else
          objc_msgSend(v8, "doAfterLoadingProvidedContentIntoFileURLs:", &v9);
      }
    }
  }
}

uint64_t __69__UIWebDocumentView_InteractionPrivate__dropInteraction_performDrop___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v8;
  double v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:", *(_QWORD *)(a1 + 40), &v8, &v10);
  v2 = objc_msgSend(*(id *)(a1 + 40), "_operationMask");
  v3 = *(_BYTE **)(a1 + 32);
  if (!v3[1146])
  {
    v4 = (void *)objc_msgSend(v3, "snapshotViewAfterScreenUpdates:", 0);
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v4);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "initialDropSnapshotView"), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "setInitialDropSnapshotView:", v4);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "_tryToPerformDataInteraction:client:global:operation:", *(_QWORD *)(a1 + 40), v2, v8, v9, v10, v11);
  else
    v5 = 1;
  objc_msgSend(*(id *)(a1 + 32), "webDraggingDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "webDraggingDelegate"), "_webView:allowsSelectingContentAfterDropForSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "clearSelection");
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 1145))
  {
    objc_msgSend(*(id *)(v6 + 440), "_endedDataInteraction:global:", v8, v9, v10, v11);
    objc_msgSend(*(id *)(a1 + 32), "resetCurrentDragInformation");
    v6 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v6 + 1144) = 0;
  objc_msgSend(*(id *)(a1 + 32), "webDraggingDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "webDraggingDelegate"), "_webView:dropWasHandled:forSession:itemProviders:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "decrementPendingOperationCount");
  return objc_msgSend(*(id *)(a1 + 56), "setItemProviders:", 0);
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebDraggingDelegate _webView:dropInteraction:concludeDrop:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:dropInteraction:concludeDrop:", self, a3, a4);
  -[UIView removeFromSuperview](-[UIWebDocumentView initialDropSnapshotView](self, "initialDropSnapshotView"), "removeFromSuperview");
  -[UIWebDocumentView setInitialDropSnapshotView:](self, "setInitialDropSnapshotView:", 0);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;

  self->_didEndDropSession = 1;
  if (!self->_isPerformingDrop)
  {
    v7 = 0.0;
    v8 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    -[UIWebDocumentView computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:](self, "computeClientAndGlobalPointsForSession:outClientPoint:outGlobalPoint:", a4, &v5, &v7);
    -[WebView _endedDataInteraction:global:](self->_webView, "_endedDataInteraction:global:", v5, v6, v7, v8);
    -[UIWebDocumentView resetCurrentDragInformation](self, "resetCurrentDragInformation");
  }
}

- (id)fallbackDropPreviewForUninsertedContent:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MidX;
  double MidY;
  UIDragPreviewTarget *v16;
  id v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[UIWebDocumentView currentDragCaretRect](self, "currentDragCaretRect");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (CGRectIsEmpty(v19))
    return 0;
  -[UIView convertRect:toView:](self, "convertRect:toView:", +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", objc_msgSend(-[UIView _window](self, "_window"), "windowScene")), x, y, width, height);
  v10 = v20.origin.x;
  v11 = v20.origin.y;
  v12 = v20.size.width;
  v13 = v20.size.height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = v10;
  v21.origin.y = v11;
  v21.size.width = v12;
  v21.size.height = v13;
  MidY = CGRectGetMidY(v21);
  v16 = [UIDragPreviewTarget alloc];
  v17 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", objc_msgSend(-[UIView _window](self, "_window"), "windowScene"));
  CGAffineTransformMakeScale(&v18, 0.0001, 0.0001);
  return (id)objc_msgSend(a3, "retargetedPreviewWithTarget:", -[UIPreviewTarget initWithContainer:center:transform:](v16, "initWithContainer:center:transform:", v17, &v18, MidX, MidY));
}

- (id)editDragPreviewForTextIndicator:(id)a3
{
  UIImageView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIDragPreviewParameters *v15;
  UIColor *v16;
  UIDragPreviewTarget *v17;
  UITargetedDragPreview *v18;
  CGRect v19;

  objc_msgSend(a3, "textBoundingRectInRootViewCoordinates");
  if (CGRectIsEmpty(v19))
    return 0;
  v6 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", objc_msgSend(a3, "contentImage"));
  objc_msgSend(a3, "textBoundingRectInRootViewCoordinates");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIImageView setBounds:](v6, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v15 = -[UIPreviewParameters initWithTextLineRects:]([UIDragPreviewParameters alloc], "initWithTextLineRects:", objc_msgSend(a3, "textRectsInBoundingRectCoordinates"));
  v16 = (UIColor *)objc_msgSend(a3, "estimatedBackgroundColor");
  if (!v16)
    v16 = +[UIColor whiteColor](UIColor, "whiteColor");
  -[UIPreviewParameters setBackgroundColor:](v15, "setBackgroundColor:", v16);
  v17 = -[UIPreviewTarget initWithContainer:center:]([UIDragPreviewTarget alloc], "initWithContainer:center:", self, v8 + v12 * 0.5, v10 + v14 * 0.5);
  v18 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", v6, v15, v17);

  return v18;
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id result;

  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (result = (id)-[UIWebDraggingDelegate _webView:previewForDroppingItem:withDefault:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:previewForDroppingItem:withDefault:", self, a4, a5)) == 0)
  {
    result = -[UIWebDocumentView editDragPreviewForTextIndicator:](self, "editDragPreviewForTextIndicator:", -[WebView _dataOperationTextIndicator](self->_webView, "_dataOperationTextIndicator"));
    if (!result)
      result = -[UIWebDocumentView fallbackDropPreviewForUninsertedContent:](self, "fallbackDropPreviewForUninsertedContent:", a5);
  }
  self->_didCreateDropPreview = 1;
  return result;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  -[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIWebDraggingDelegate _webView:dataOwnerForDropSession:](-[UIWebDocumentView webDraggingDelegate](self, "webDraggingDelegate"), "_webView:dataOwnerForDropSession:", self, a4);
  else
    return 0;
}

- (BOOL)shouldRevealCurrentSelectionAfterInsertion
{
  return !self->_interaction.isWriting;
}

- (void)_selectPositionAtPoint:(CGPoint)a3
{
  WebThreadRun();
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___selectPositionAtPoint___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  void *v4;
  uint64_t result;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    WebThreadRunOnMainThread();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_focusedOrMainFrame");
  objc_msgSend(*(id *)(a1 + 32), "convertPointToSelectedFrameCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (void *)objc_msgSend(v3, "webVisiblePositionForPoint:");
  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_focusedOrMainFrame"), "setSelectedDOMRange:affinity:closeTyping:userTriggered:", objc_msgSend(MEMORY[0x1E0DD9718], "rangeForFirstPosition:second:", v4, v4), objc_msgSend(v4, "affinity"), 1, 1);
  if ((isKindOfClass & 1) != 0)
    return WebThreadRunOnMainThread();
  return result;
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___selectPositionAtPoint___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginAllowingFocusRedirects");
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___selectPositionAtPoint___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endAllowingFocusRedirects");
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  WebView *webView;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  WebThreadLock();
  webView = self->_webView;
  -[UIWebDocumentView convertRect:toFrame:](self, "convertRect:toFrame:", -[WebView mainFrame](webView, "mainFrame"), x, y, width, height);
  v12 = (void *)-[WebView _editableElementsInRect:](webView, "_editableElementsInRect:");
  if (objc_msgSend(v12, "count"))
  {
    v13 = objc_msgSend(v12, "count");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
    if (v13)
    {
      v15 = 0;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v17 = objc_msgSend(v12, "objectAtIndex:", v15);
        objc_msgSend(v14, "addObject:", v17);
        if (objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSameNode:", v17))
          v16 = v15;
        ++v15;
      }
      while (v13 != v15);
    }
    else
    {
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    (*((void (**)(id, void *, uint64_t))a5 + 2))(a5, v14, v16);
  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, MEMORY[0x1E0C9AA60], 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRun();
  else
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

uint64_t __122__UIWebDocumentView_InteractionPrivate___scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = MEMORY[0x1E0C809B0];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  WebThreadRunOnMainThread();
  v2 = *(void **)(a1 + 40);
  if (objc_msgSend(v2, "isSameNode:", objc_msgSend(*(id *)(a1 + 32), "formElement", v5, 3221225472, __122__UIWebDocumentView_InteractionPrivate___scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_2, &unk_1E16ECDC8, v6, v7)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_focusAndAssistFormNode:", v2);
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if ((objc_msgSend(v2, "nodeCanBecomeFirstResponder") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_selectPositionAtPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 32), "formElement");
    }
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

uint64_t __122__UIWebDocumentView_InteractionPrivate___scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _OWORD v14[4];
  CGRect result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WebThreadLock();
    if (a4)
      objc_msgSend(a4, "innerFrameQuad");
    else
      memset(v14, 0, sizeof(v14));
    v10 = quadBoundingBox((double *)v14);
    -[UIWebDocumentView convertRect:fromFrame:](self, "convertRect:fromFrame:", objc_msgSend((id)objc_msgSend(a4, "ownerDocument"), "webFrame"), v10, v11, v12, v13);
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  self->_interaction.isWriting = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadLock();
    objc_msgSend(a4, "setCanShowPlaceholder:", 0);
  }
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  self->_interaction.isWriting = 0;
  WebThreadRun();
}

uint64_t __88__UIWebDocumentView_InteractionPrivate___scribbleInteraction_didFinishWritingInElement___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadLock();
    objc_msgSend(v2, "setCanShowPlaceholder:", 1);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "revealCurrentSelection");
  result = objc_msgSend(*(id *)(a1 + 40), "formElement");
  if (result)
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      return WebThreadRunOnMainThread();
  }
  return result;
}

uint64_t __88__UIWebDocumentView_InteractionPrivate___scribbleInteraction_didFinishWritingInElement___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayFormNodeInputView");
}

- (BOOL)mouseEventsChangeSelection
{
  return (*((unsigned __int8 *)self + 962) >> 1) & 1;
}

- (CGPoint)constrainedPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat width;
  double height;
  double MinX;
  double MinY;
  double v15;
  double v16;
  double v17;
  double MaxX;
  double v19;
  double v20;
  double v21;
  CGPoint result;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  -[UIView size](self, "size");
  v7 = v6;
  -[UIView size](self, "size");
  v21 = v8 * 0.5;
  -[UIWebDocumentView _selectionClipRect](self, "_selectionClipRect");
  v9 = v23.origin.x;
  v10 = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = v9;
  v24.origin.y = v10;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  if (y >= MinY)
  {
    MinY = v10 + height;
    v15 = y - (v10 + height);
    if (v15 <= 0.0)
      goto LABEL_7;
    v16 = v15 / v21 + 5.0;
  }
  else
  {
    v15 = y - MinY;
    if (y - MinY >= 0.0)
      goto LABEL_7;
    v16 = 5.0 - v15 / v21;
  }
  y = MinY + v15 / v16;
LABEL_7:
  v17 = v7 * 0.5;
  if (x >= MinX)
  {
    v25.origin.x = v9;
    v25.origin.y = v10;
    v25.size.width = width;
    v25.size.height = height;
    MaxX = CGRectGetMaxX(v25);
    if (x - MaxX > 0.0)
      x = MaxX + (x - MaxX) / ((x - MaxX) / v17 + 5.0);
  }
  else if (x - MinX < 0.0)
  {
    x = MinX + (x - MinX) / (5.0 - (x - MinX) / v17);
  }
  v19 = x;
  v20 = y;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)selectWord
{
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "aggressivelyExpandSelectionToWordContainingCaretSelection");
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (CGRect)convertRectFromSelectedFrameCoordinates:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "documentView"), "convertRect:toView:", 0, x, y, width, height);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGPoint)convertPointToSelectedFrameCoordinates:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "documentView"), "convertPoint:fromView:", 0, x, y);
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)selectionChanged
{
  if (-[UIView superview](self, "superview"))
    -[UITextInteractionAssistant selectionChanged](-[UIWebDocumentView interactionAssistant](self, "interactionAssistant"), "selectionChanged");
  -[UIWebDocumentView _removeDefinitionController:](self, "_removeDefinitionController:", 1);
}

- (void)selectionChanged:(id)a3
{
  void *v4;
  CGRect v5;

  v4 = (void *)objc_msgSend(a3, "object");
  if (v4 == -[UIWebDocumentView webView](self, "webView"))
  {
    -[UIWebDocumentView selectionChanged](self, "selectionChanged");
    if (_AXSZoomTouchEnabled())
    {
      -[UIWebDocumentView caretRect](self, "caretRect");
      UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint, v5, &self->super.super);
    }
  }
}

- (void)clearSelection
{
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "clearSelection");
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (BOOL)hasEditableSelection
{
  if (pthread_main_np())
    WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "hasEditableSelection");
}

- (BOOL)hasMarkedText
{
  void *v3;

  WebThreadLock();
  v3 = (void *)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "markedTextDOMRange");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "collapsed") ^ 1;
  return (char)v3;
}

- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3
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

  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "closestCaretRectInMarkedTextRangeForPoint:", v5, v7);
  -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (unint64_t)offsetInMarkedTextForSelection:(id)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = (void *)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "markedTextDOMRange");
  if (!v5)
    return 0;
  v6 = v5;
  if ((objc_msgSend(v5, "collapsed") & 1) != 0)
    return 0;
  WebThreadLock();
  v8 = -[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame");
  v9 = objc_msgSend(v8, "convertDOMRangeToNSRange:", v6);
  v7 = v10;
  if (a3)
  {
    v11 = v9;
    v12 = objc_msgSend(v8, "convertDOMRangeToNSRange:", a3);
    if (v12 - v11 <= v7 && v12 - v11 >= 0)
      return v12 - v11;
  }
  return v7;
}

- (int)selectionState
{
  WebThreadLock();
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionState");
}

- (void)collapseSelection
{
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "collapseSelection");
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (void)setCaretInsets:(UIEdgeInsets)a3
{
  self->_caretInsets = a3;
}

- (UIEdgeInsets)caretInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_caretInsets.top;
  left = self->_caretInsets.left;
  bottom = self->_caretInsets.bottom;
  right = self->_caretInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)caretRect
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "caretRect");
  -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
  top = self->_caretInsets.top;
  left = self->_caretInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_caretInsets.right);
  v12 = v11 - (top + self->_caretInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (CGRect)caretRectForVisiblePosition:(id)a3
{
  double top;
  double left;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "caretRectForPosition:", a3);
  -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
  top = self->_caretInsets.top;
  left = self->_caretInsets.left;
  v8 = v7 + left;
  v10 = v9 + top;
  v12 = v11 - (left + self->_caretInsets.right);
  v14 = v13 - (top + self->_caretInsets.bottom);
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v8;
  return result;
}

- (int64_t)selectionBaseWritingDirection
{
  WebThreadLock();
  return (int)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionBaseWritingDirection");
}

- (void)toggleBaseWritingDirection
{
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "toggleBaseWritingDirection");
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (void)setBaseWritingDirection:(int64_t)a3
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setBaseWritingDirection:", a3);
}

- (void)setRangedSelectionBaseToCurrentSelection
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionBaseToCurrentSelection");
}

- (void)setRangedSelectionBaseToCurrentSelectionStart
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionBaseToCurrentSelectionStart");
}

- (void)setRangedSelectionBaseToCurrentSelectionEnd
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionBaseToCurrentSelectionEnd");
}

- (void)clearRangedSelectionInitialExtent
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "clearRangedSelectionInitialExtent");
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionStart
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionInitialExtentToCurrentSelectionStart");
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionInitialExtentToCurrentSelectionEnd");
}

- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4
{
  uint64_t v4;
  double y;
  double x;
  double v8;
  double v9;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", x, y);
  LOBYTE(v4) = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionExtentPoint:baseIsStart:allowFlipping:", v4, 0, v8, v9);
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
  return v4;
}

- (void)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double y;
  double x;
  double v10;
  double v11;

  v5 = a5;
  v6 = a4;
  y = a3.y;
  x = a3.x;
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", x, y);
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionExtentPoint:baseIsStart:allowFlipping:", v6, v5, v10, v11);
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", v7, v6);
  v10 = v9;
  v12 = v11;
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", x, y);
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setSelectionWithFirstPoint:secondPoint:", v10, v12, v13, v14);
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (id)wordAtPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  WebThreadLock();
  return (id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "wordAtPoint:", v5, v7);
}

- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4
{
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "startContainer"), "ownerDocument"), "webFrame"), "setSelectedDOMRange:affinity:closeTyping:", a3, a4, 1);
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (id)textInDOMRange:(id)a3
{
  WebThreadLock();
  return (id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "stringForRange:", a3);
}

- (id)selectionRectsForDOMRange:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WebThreadLock();
  v5 = (void *)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionRectsForRange:", a3);
  if (!objc_msgSend(v5, "count"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "rect");
        -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
        objc_msgSend(v10, "setRect:");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)selectionRects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WebThreadLock();
  v3 = (void *)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionRects");
  if (!objc_msgSend(v3, "count"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "rect");
        -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
        objc_msgSend(v8, "setRect:");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return v3;
}

- (void)smartExtendRangedSelection:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "smartExtendRangedSelection:", v3);
}

- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionWithExtentPoint:", v5, v7);
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (void)setSelectionToEnd
{
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "moveSelectionToEnd");
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (void)setSelectionToStart
{
  WebThreadLock();
  -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "moveSelectionToStart");
  -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
}

- (void)setAutoscrollContentOffset:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = -[UIWebDocumentView formElement](self, "formElement");
  if (v5)
  {
    v6 = v5;
    WebThreadLock();
    objc_msgSend(v6, "setScrollLeft:", (int)x);
    objc_msgSend(v6, "setScrollTop:", (int)y);
  }
}

- (CGPoint)autoscrollContentOffset
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  v2 = -[UIWebDocumentView formElement](self, "formElement");
  if (v2)
  {
    v3 = v2;
    WebThreadLock();
    v4 = (double)(int)objc_msgSend(v3, "scrollLeft");
    v5 = (double)(int)objc_msgSend(v3, "scrollTop");
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v6 = v4;
  result.y = v5;
  result.x = v6;
  return result;
}

- (CGRect)contentFrameForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIWebDocumentView formElement](self, "formElement", a3);
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)shouldAutoscroll
{
  UIAutoscroll *autoscroll;

  autoscroll = self->_autoscroll;
  if (autoscroll)
    return !-[UIAutoscroll disabled](autoscroll, "disabled");
  else
    return 1;
}

- (void)setShouldAutoscroll:(BOOL)a3
{
  _BOOL4 v3;
  UIAutoscroll *autoscroll;

  v3 = a3;
  autoscroll = self->_autoscroll;
  if (!autoscroll)
  {
    autoscroll = objc_alloc_init(UIAutoscroll);
    self->_autoscroll = autoscroll;
  }
  -[UIAutoscroll setDisabled:](autoscroll, "setDisabled:", !v3);
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  UITextInteractionAssistant *v7;
  UITextInteractionAssistant *textSelectionAssistant;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  id m_parentTextView;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char isKindOfClass;
  id v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  UIWebDocumentView *v45;
  char v46;
  double v47;
  double v48;
  int v49;
  double v51;
  double v52;
  double v53;
  double v54;
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
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  BOOL v73;
  int v74;
  int v76;
  id v77;
  UIView *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  BOOL v84;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;

  y = a3.y;
  x = a3.x;
  if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)v6 = 32.0;
  else
    v6 = 8.0;
  if (!self->_autoscroll)
    self->_autoscroll = objc_alloc_init(UIAutoscroll);
  v7 = -[UIWebDocumentView formElement](self, "formElement");
  if (!v7
    || (textSelectionAssistant = v7, !-[UITextInteractionAssistant isTextControl](v7, "isTextControl")))
  {
    v31 = *MEMORY[0x1E0C9D538];
    v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant");
      m_parentTextView = self->m_parentTextView;
      objc_msgSend(m_parentTextView, "contentInset");
      v97 = v32;
      v34 = v33;
      v36 = v35;
      if (!m_parentTextView)
        goto LABEL_65;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v38 = self->m_parentTextView;
      if ((isKindOfClass & 1) != 0)
      {
        textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant");
        m_parentTextView = (id)objc_msgSend(v38, "_scroller");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_65;
        objc_msgSend(m_parentTextView, "contentInset");
        v97 = v39;
        v34 = v40;
        v36 = v41;
        v42 = objc_msgSend(v38, "superview");
        objc_msgSend(v38, "frame");
        v45 = (UIWebDocumentView *)v42;
      }
      else
      {
        if (v38)
        {
          textSelectionAssistant = 0;
          goto LABEL_65;
        }
        textSelectionAssistant = self->_textSelectionAssistant;
        m_parentTextView = -[UIView _scroller](self, "_scroller");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_65;
        objc_msgSend(m_parentTextView, "contentInset");
        v97 = v52;
        v34 = v53;
        v36 = v54;
        v45 = self;
        v43 = v31;
        v44 = v30;
      }
      -[UIView convertPoint:toView:](v45, "convertPoint:toView:", m_parentTextView, v43, v44);
      v31 = v55;
      v30 = v56;
      if (!m_parentTextView)
        goto LABEL_65;
    }
    -[UIWebDocumentView visibleBounds](self, "visibleBounds");
    v96 = y;
    v58 = v57;
    v86 = v36;
    v60 = v59;
    v62 = v61;
    v89 = v30;
    v64 = v63;
    -[UIView size](self, "size");
    v87 = v34;
    v66 = v65;
    v95 = v6;
    v98 = x;
    v68 = v67;
    objc_msgSend(m_parentTextView, "autoscrollContentOffset");
    v28 = v69;
    v92 = v60;
    v93 = v70;
    v21 = v58 + v62;
    v90 = v60 + v64;
    v91 = -v97;
    objc_msgSend(m_parentTextView, "bounds");
    v22 = v31 + v66 - (v71 - v86);
    objc_msgSend(m_parentTextView, "bounds");
    v88 = v89 + v68 - (v72 - v87);
    v29 = 0.075;
    v27 = v95;
    v25 = v96;
    v18 = v98;
    goto LABEL_37;
  }
  v94 = v6;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[UITextInteractionAssistant ownerDocument](textSelectionAssistant, "ownerDocument"), "webFrame"), "documentView"), "scale");
  v10 = v9;
  -[UIWebDocumentView _selectionClipRect](self, "_selectionClipRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v98 = x;
  v18 = (x - v17) / v10;
  v19 = (double)(int)-[UITextInteractionAssistant scrollWidth](textSelectionAssistant, "scrollWidth");
  v20 = -[UITextInteractionAssistant scrollHeight](textSelectionAssistant, "scrollHeight");
  v21 = v14 / v10;
  v22 = v19 - v21;
  v23 = -[UITextInteractionAssistant scrollLeft](textSelectionAssistant, "scrollLeft");
  v24 = (double)v23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v96 = y;
    v25 = (y - v12) / v10;
    v88 = (double)v20 - v16 / v10;
    v90 = v16 / v10;
    v93 = (double)(int)-[UITextInteractionAssistant scrollTop](textSelectionAssistant, "scrollTop");
    v97 = 0.0;
    m_parentTextView = self;
    v91 = 0.0;
    v92 = 0.0;
    v27 = v94;
    v28 = v24;
    v29 = 0.2;
LABEL_37:
    v73 = v18 > v21 - v27 && v28 < v22;
    if (v73)
      v74 = 2;
    else
      v74 = 0;
    if (v28 > 0.0 && v18 < v27)
      v76 = 1;
    else
      v76 = v74;
    v77 = -[UIView _scroller](self, "_scroller");
    v78 = -[UIView superview](self, "superview");
    -[UIView frame](self, "frame");
    -[UIView convertRect:toView:](v78, "convertRect:toView:", v77);
    v80 = v79;
    objc_msgSend(v77, "contentInset");
    v73 = v80 < v81;
    v82 = -0.0;
    if (!v73)
      v82 = v97;
    v83 = v27 + v92 + v82;
    v84 = v93 > v91 && v25 < v83;
    v51 = v98;
    if (v84)
    {
      v49 = v76 | 4;
    }
    else if (v25 >= v90 - v27 && v93 < v88)
    {
      v49 = v76 | 8;
    }
    else
    {
      v49 = v76;
    }
    y = v96;
    if (!textSelectionAssistant)
      goto LABEL_65;
    goto LABEL_63;
  }
  objc_opt_class();
  v46 = objc_opt_isKindOfClass();
  if ((v46 & 1) != 0)
    v47 = 0.075;
  else
    v47 = 0.2;
  v48 = 0.0;
  if ((v46 & 1) != 0)
    v48 = 16.0;
  if (v23 < 1 || v18 >= v48)
  {
    if (v18 <= v21 - v48 || v22 <= v24)
      v49 = 0;
    else
      v49 = 2;
  }
  else
  {
    v49 = 1;
  }
  m_parentTextView = self;
  v51 = v98;
  v29 = v47;
LABEL_63:
  if (v49)
  {
    -[UIAutoscroll startAutoscroll:scrollContainer:point:directions:repeatInterval:](self->_autoscroll, "startAutoscroll:scrollContainer:point:directions:repeatInterval:", textSelectionAssistant, m_parentTextView, v51, y, v29);
    return;
  }
LABEL_65:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UITextInteractionAssistant autoscrollWillNotStart](textSelectionAssistant, "autoscrollWillNotStart");
  -[UIWebDocumentView cancelAutoscroll](self, "cancelAutoscroll");
}

- (void)cancelAutoscroll
{
  -[UIAutoscroll invalidate](self->_autoscroll, "invalidate");
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v8 = -[UIWebDocumentView formElement](self, "formElement");
  if (v8)
  {
    objc_msgSend(v8, "setSelectionWithPoint:", v5, v7);
  }
  else
  {
    WebThreadLock();
    -[UIWebDocumentView beginSelectionChange](self, "beginSelectionChange");
    objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "moveSelectionToPoint:", v5, v7);
    -[UIWebDocumentView endSelectionChange](self, "endSelectionChange");
  }
}

- (id)webVisiblePositionForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;

  y = a3.y;
  x = a3.x;
  WebThreadLock();
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", x, y);
  v7 = v6;
  v9 = v8;
  v10 = -[UIWebDocumentView formElement](self, "formElement");
  if (v10)
  {
    objc_msgSend(v10, "constrainedPoint:", v7, v9);
    v7 = v11;
    v9 = v12;
  }
  return (id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "webVisiblePositionForPoint:", v7, v9);
}

- (CGRect)visibleBounds
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  id v11;
  void *v12;
  double v13;
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
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect result;
  CGRect v48;

  -[UIView bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = -[UIView _scroller](self, "_scroller");
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "contentInset");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v12, v14 + v24, v16 + v21, v18 - (v24 + v22), v20 - (v21 + v23));
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[UIView bounds](self, "bounds");
    v48.origin.x = v33;
    v48.origin.y = v34;
    v48.size.width = v35;
    v48.size.height = v36;
    v45.origin.x = v26;
    v45.origin.y = v28;
    v45.size.width = v30;
    v45.size.height = v32;
    v46 = CGRectIntersection(v45, v48);
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
  }
  if (-[UIWebDocumentView isEditing](self, "isEditing"))
  {
    objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "subtractKeyboardFrameFromRect:inView:", self, x, y, width, height);
    x = v37;
    y = v38;
    width = v39;
    height = v40;
  }
  v41 = x;
  v42 = y;
  v43 = width;
  v44 = height;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (id)positionAtStartOrEndOfWord:(id)a3
{
  uint64_t v4;

  WebThreadLock();
  if ((objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "atBoundaryOfGranularity:inDirection:", 4, 0) & 1) == 0)
  {
    v4 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionAtStartOrEndOfWord");
    if (v4)
      return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", v4);
    return 0;
  }
  return a3;
}

- (BOOL)isInPrintMode
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  WebThreadLock();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", -[WebView mainFrame](self->_webView, "mainFrame"));
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = 0;
    while (1)
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v5), "frameView"), "documentView");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "_isInPrintMode") & 1) != 0)
        break;
      objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v5++), "childFrames"));
      if (v5 >= objc_msgSend(v3, "count"))
      {
        LOBYTE(v4) = 0;
        return v4;
      }
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)_beginPrintModeForHTMLView:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7 tileClippedContent:(BOOL)a8
{
  _BOOL4 v8;
  double height;
  double width;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIWebPaginationInfo *v30;
  double v32;

  v8 = a8;
  height = a4.height;
  width = a4.width;
  v16 = (a4.height - a5) * (a6 / a4.width);
  -[UIWebDocumentView setTilingArea:](self, "setTilingArea:", 2);
  if ((objc_msgSend(a3, "_beginPrintModeWithMinimumPageWidth:height:maximumPageWidth:", a6, v16, a7) & 1) != 0)
  {
    v32 = v16;
    ++self->_printModeCount;
    objc_msgSend(a3, "bounds");
    v18 = v17;
    v20 = v19;
    if (v17 >= a7)
      v21 = a7;
    else
      v21 = v17;
    v22 = width / v21;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = floor(-a5 / v22);
    if (v24 < v20)
    {
      v25 = floor(width / v22);
      v26 = floor(height / v22);
      do
      {
        objc_msgSend(a3, "_adjustedBottomOfPageWithTop:bottom:limit:", v24, v26 + v24, v24);
        v28 = 0.0;
        if (v24 >= 0.0)
          v29 = v24;
        else
          v29 = 0.0;
        if (v27 <= v20)
          v24 = v27;
        else
          v24 = v20;
        do
        {
          objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v28, v29, v25, v24 - v29));
          if (!v8)
            break;
          v28 = v25 + v28;
        }
        while (v28 < v18);
      }
      while (v24 < v20);
    }
    v30 = -[UIWebPaginationInfo initWithDocumentView:scaleFactor:layoutSize:pageRects:]([UIWebPaginationInfo alloc], "initWithDocumentView:scaleFactor:layoutSize:pageRects:", a3, v23, v22, v18, v32 / v22);
    -[UIWebPaginationInfo setWebDocumentView:](v30, "setWebDocumentView:", self);

    return v30;
  }
  else
  {
    -[UIWebDocumentView setTilingArea:](self, "setTilingArea:", 0);
    return 0;
  }
}

- (id)_beginPrintModeForPDFView:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7
{
  double height;
  double width;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  unsigned int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  UIWebPaginationInfo *v34;

  height = a4.height;
  width = a4.width;
  v14 = objc_msgSend(a3, "totalPages");
  v15 = v14;
  if (v14)
  {
    v16 = 0;
    v17 = v14;
    do
    {
      objc_msgSend(a3, "rectForPageNumber:", ++v16);
      if (a6 < v18)
        a6 = v18;
    }
    while (v17 != v16);
  }
  if (a6 >= a7)
    v19 = a7;
  else
    v19 = a6;
  v20 = width / v19;
  v21 = floor(height / (width / v19));
  if (v21 == 0.0)
    return 0;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a3, "rectForPageNumber:", 1);
  if (v15)
  {
    v24 = v23;
    v25 = 0;
    v26 = floor(-a5 / v20);
    v27 = floor(width / v20);
    v28 = 0.0;
    do
    {
      v29 = v28;
      v28 = v21 + v26;
      if (v24 > v21)
      {
LABEL_16:
        v24 = v24 - (v28 - v29);
      }
      else
      {
        while (1)
        {
          v30 = v29 + v24;
          if (v29 + v24 > v28)
          {
            v28 = v29;
            goto LABEL_19;
          }
          if (v25 + 1 >= v15)
            break;
          objc_msgSend(a3, "rectForPageNumber:", v25 + 2);
          v24 = v31;
          ++v25;
          v29 = v30;
          if (v31 > v21)
            goto LABEL_16;
        }
        ++v25;
        v28 = v29 + v24;
      }
LABEL_19:
      if (v26 >= 0.0)
        v32 = v26;
      else
        v32 = 0.0;
      objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, v32, v27, v28 - v32));
      v26 = v28;
    }
    while (v25 < v15);
  }
  else
  {
    v27 = floor(width / v20);
  }
  v34 = -[UIWebPaginationInfo initWithDocumentView:scaleFactor:layoutSize:pageRects:]([UIWebPaginationInfo alloc], "initWithDocumentView:scaleFactor:layoutSize:pageRects:", a3, v22, v20, v27, v21);
  -[UIWebPaginationInfo setWebDocumentView:](v34, "setWebDocumentView:", self);

  return v34;
}

- (id)beginPrintModeWithWidth:(double)a3 height:(double)a4 startOffset:(double)a5 shrinkToFit:(BOOL)a6 forFrame:(id)a7
{
  return -[UIWebDocumentView beginPrintModeWithWidth:height:startOffset:shrinkToFit:tileClippedContent:forFrame:](self, "beginPrintModeWithWidth:height:startOffset:shrinkToFit:tileClippedContent:forFrame:", a6, 0, a7, a3, a4, a5);
}

- (id)beginPrintModeWithWidth:(double)a3 height:(double)a4 startOffset:(double)a5 shrinkToFit:(BOOL)a6 tileClippedContent:(BOOL)a7 forFrame:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;

  v8 = a7;
  v9 = a6;
  if (!a8)
    a8 = -[WebView mainFrame](self->_webView, "mainFrame");
  return -[UIWebDocumentView beginPrintModeForFrame:withWidth:height:startOffset:shrinkToFit:tileClippedContent:](self, "beginPrintModeForFrame:withWidth:height:startOffset:shrinkToFit:tileClippedContent:", a8, v9, v8, a3, a4, a5);
}

- (id)beginPrintModeForFrame:(id)a3 withWidth:(double)a4 height:(double)a5 startOffset:(double)a6 shrinkToFit:(BOOL)a7 tileClippedContent:(BOOL)a8
{
  _BOOL8 v8;
  double v16;
  uint64_t v17;

  v8 = a8;
  if ((WebView *)objc_msgSend(a3, "webView") != self->_webView)
    return 0;
  if (!a7)
    return -[UIWebDocumentView beginPrintModeForFrame:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:](self, "beginPrintModeForFrame:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:", a3, v8, a4, a5, a6, a4, a4);
  v16 = *MEMORY[0x1E0DD98E0] * a4;
  WebThreadLock();
  v17 = objc_msgSend((id)objc_msgSend(a3, "frameView"), "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[UIWebDocumentView _beginPrintModeForHTMLView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:](self, "_beginPrintModeForHTMLView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:", v17, v8, a4, a5, a6, *MEMORY[0x1E0DD98E8] * a4, v16);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  return -[UIWebDocumentView _beginPrintModeForPDFView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:](self, "_beginPrintModeForPDFView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:", v17, a4, a5, a6, a4, v16);
}

- (id)beginPrintModeWithSize:(CGSize)a3 startOffset:(double)a4 minimumLayoutWidth:(double)a5 maximumLayoutWidth:(double)a6 tileClippedContent:(BOOL)a7
{
  return -[UIWebDocumentView beginPrintModeForFrame:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:](self, "beginPrintModeForFrame:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:", -[WebView mainFrame](self->_webView, "mainFrame"), a7, a3.width, a3.height, a4, a5, a6);
}

- (id)beginPrintModeForFrame:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7 tileClippedContent:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  WebView *v16;
  BOOL v17;
  uint64_t v18;

  v8 = a8;
  height = a4.height;
  width = a4.width;
  v16 = (WebView *)objc_msgSend(a3, "webView");
  v17 = a6 > 0.0 && v16 == self->_webView;
  if (!v17 || width <= 0.0)
    return 0;
  if (a7 < a6)
    a7 = a6;
  WebThreadLock();
  v18 = objc_msgSend((id)objc_msgSend(a3, "frameView"), "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[UIWebDocumentView _beginPrintModeForHTMLView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:](self, "_beginPrintModeForHTMLView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:", v18, v8, width, height, a5, a6, a7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[UIWebDocumentView _beginPrintModeForPDFView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:](self, "_beginPrintModeForPDFView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:", v18, width, height, a5, a6, a7);
  else
    return 0;
}

- (void)releasePrintMode
{
  unsigned int printModeCount;
  unsigned int v3;

  printModeCount = self->_printModeCount;
  if (!printModeCount || (v3 = printModeCount - 1, (self->_printModeCount = v3) == 0))
    -[UIWebDocumentView _endPrintMode](self, "_endPrintMode");
}

- (void)endPrintMode
{
  self->_printModeCount = 0;
  -[UIWebDocumentView _endPrintMode](self, "_endPrintMode");
}

- (void)_endPrintMode
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  WebThreadLock();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", -[WebView mainFrame](self->_webView, "mainFrame"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(v3, "objectAtIndex:", v4);
      v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "frameView"), "documentView");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v6, "_isInPrintMode"))
        {
          -[UIWebDocumentView setTilingArea:](self, "setTilingArea:", 0);
          objc_msgSend(v6, "_endPrintMode");
        }
      }
      objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(v5, "childFrames"));
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }
}

- (void)_drawPDFPagesForPage:(unint64_t)a3 withPaginationInfo:(id)a4
{
  void *v6;
  CGPDFDocument *v7;
  void *v8;
  _QWORD *ContextStack;
  CGContext *v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  size_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGPDFPage *Page;
  CGFloat Height;
  CGFloat Width;
  double v36;
  double v37;
  CGAffineTransform transform;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect BoxRect;

  v6 = (void *)objc_msgSend(a4, "documentView");
  v7 = (CGPDFDocument *)objc_msgSend(v6, "doc");
  if (CGPDFDocumentAllowsPrinting(v7))
  {
    v8 = (void *)objc_msgSend(a4, "pageRects");
    if (objc_msgSend(v8, "count") > a3)
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v10 = 0;
      else
        v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      CGContextSaveGState(v10);
      objc_msgSend(a4, "scaleFactor");
      CGContextScaleCTM(v10, v11, v11);
      objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", a3), "rectValue");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v20 = objc_msgSend(v6, "totalPages");
      if (v20)
      {
        v21 = 0;
        v22 = 0.0;
        v36 = v19;
        v37 = v13;
        do
        {
          v39.origin.x = v13;
          v39.origin.y = v15;
          v39.size.width = v17;
          v39.size.height = v19;
          if (v22 >= CGRectGetMaxY(v39))
            break;
          objc_msgSend(v6, "rectForPageNumber:", ++v21);
          v23 = v19;
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v40.origin.x = v13;
          v32 = v22 + v30;
          v40.size.width = v17;
          v40.origin.y = v15;
          v40.size.height = v23;
          if (v32 > CGRectGetMinY(v40))
          {
            Page = CGPDFDocumentGetPage(v7, v21);
            CGContextSaveGState(v10);
            CGContextScaleCTM(v10, 1.0, -1.0);
            v41.origin.x = v25;
            v41.origin.y = v27;
            v41.size.width = v29;
            v41.size.height = v31;
            Height = CGRectGetHeight(v41);
            CGContextTranslateCTM(v10, 0.0, v15 - v22 - Height);
            v42.origin.x = v25;
            v42.origin.y = v27;
            v42.size.width = v29;
            v42.size.height = v31;
            Width = CGRectGetWidth(v42);
            v43.origin.x = v25;
            v43.origin.y = v27;
            v43.size.width = v29;
            v43.size.height = v31;
            v44.size.height = CGRectGetHeight(v43);
            v44.origin.x = 0.0;
            v44.origin.y = 0.0;
            v44.size.width = Width;
            CGPDFPageGetDrawingTransform(&transform, Page, kCGPDFCropBox, v44, 0, 1);
            CGContextConcatCTM(v10, &transform);
            BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
            CGContextClipToRect(v10, BoxRect);
            CGContextDrawPDFPage(v10, Page);
            CGContextRestoreGState(v10);
          }
          v22 = v32;
          v19 = v36;
          v13 = v37;
        }
        while (v20 != v21);
      }
      CGContextRestoreGState(v10);
    }
  }
}

- (void)drawPage:(unint64_t)a3 withPaginationInfo:(id)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD *ContextStack;
  CGContext *v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  WebThreadLock();
  v7 = (void *)objc_msgSend(a4, "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v7, "_isInPrintMode"))
    {
      v8 = (void *)objc_msgSend(a4, "pageRects");
      if (objc_msgSend(v8, "count") > a3)
      {
        objc_msgSend(a4, "layoutSize");
        v10 = v9;
        v12 = v11;
        objc_msgSend(v7, "bounds");
        if (v13 != v10)
          objc_msgSend(v7, "_beginPrintModeWithMinimumPageWidth:height:maximumPageWidth:", v10, v12, v10);
        ContextStack = GetContextStack(0);
        if (*(int *)ContextStack < 1)
          v15 = 0;
        else
          v15 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        CGContextSaveGState(v15);
        objc_msgSend(a4, "scaleFactor");
        CGContextScaleCTM(v15, v16, v16);
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", a3), "rectValue");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        CGContextTranslateCTM(v15, -v17, -v19);
        -[WebView viewWillDraw](self->_webView, "viewWillDraw");
        objc_msgSend(v7, "displayRectIgnoringOpacity:inContext:", v15, v18, v20, v22, v24);
        CGContextRestoreGState(v15);
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIWebDocumentView _drawPDFPagesForPage:withPaginationInfo:](self, "_drawPDFPagesForPage:withPaginationInfo:", a3, a4);
  }
}

@end
