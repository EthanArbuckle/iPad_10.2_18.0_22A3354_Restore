@implementation UIWebBrowserView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _UIApplicationLoadWebKit();
}

+ (id)getUIWebBrowserViewForWebFrame:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a3, "webView"), "_UIKitDelegate");
}

- (UIWebBrowserView)initWithWebView:(id)a3 frame:(CGRect)a4
{
  UIWebBrowserView *v4;
  UIWebBrowserView *v5;
  void *v6;
  UIWebFormDelegate *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIWebBrowserView;
  v4 = -[UIWebDocumentView initWithWebView:frame:](&v9, sel_initWithWebView_frame_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)&v4->super + 961) |= 4u;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__keyboardWillChangeFrame_, CFSTR("UIKeyboardWillChangeFrameNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__keyboardDidChangeFrame_, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__keyboardWillShow_, CFSTR("UIKeyboardWillShowNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__keyboardWillHide_, CFSTR("UIKeyboardWillHideNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__keyboardDidHide_, CFSTR("UIKeyboardDidHideNotification"), 0);
    *((_BYTE *)v5 + 1608) |= 1u;
    v7 = -[UIWebFormDelegate initWithWebBrowserView:]([UIWebFormDelegate alloc], "initWithWebBrowserView:", v5);
    v5->_formDelegate = v7;
    -[WebView _setFormDelegate:](v5->super._webView, "_setFormDelegate:", v7);
    -[WebView _setUIWebViewUserAgentWithBuildVersion:](v5->super._webView, "_setUIWebViewUserAgentWithBuildVersion:", -[UIDevice buildVersion](+[UIDevice currentDevice](UIDevice, "currentDevice"), "buildVersion"));
    -[WebPreferences setShrinksStandaloneImagesToFit:](-[WebView preferences](v5->super._webView, "preferences"), "setShrinksStandaloneImagesToFit:", 1);
  }
  return v5;
}

- (UIWebBrowserView)initWithFrame:(CGRect)a3
{
  UIWebBrowserView *v3;
  UIWebBrowserView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebBrowserView;
  v3 = -[UIWebDocumentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[WebView _setUIWebViewUserAgentWithBuildVersion:](v3->super._webView, "_setUIWebViewUserAgentWithBuildVersion:", -[UIDevice buildVersion](+[UIDevice currentDevice](UIDevice, "currentDevice"), "buildVersion"));
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  -[UIWebBrowserView _clearFormAutoFillStateForFrame:](self, "_clearFormAutoFillStateForFrame:", -[WebView mainFrame](self->super._webView, "mainFrame"));
  -[UIWebBrowserView set_accessory:](self, "set_accessory:", 0);
  -[UIWebBrowserView set_input:](self, "set_input:", 0);
  -[UIWebBrowserView set_currentAssistedNode:](self, "set_currentAssistedNode:", 0);
  self->_editingDelegateForEverythingExceptForms = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15[0] = CFSTR("UIKeyboardWillChangeFrameNotification");
  v15[1] = CFSTR("UIKeyboardDidChangeFrameNotification");
  v15[2] = CFSTR("UIKeyboardWillShowNotification");
  v15[3] = CFSTR("UIKeyboardWillHideNotification");
  v15[4] = CFSTR("UIKeyboardDidHideNotification");
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5));
  -[UIGestureRecognizer setDelegate:](self->_webTouchEventsGestureRecognizer, "setDelegate:", 0);

  v4 = (void *)-[NSHashTable copy](self->_activeHighlighters, "copy");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "clearBrowserView");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView dealloc](&v9, sel_dealloc);
}

- (void)installGestureRecognizers
{
  UIWebTouchEventsGestureRecognizer *v3;
  objc_super v4;

  if (!self->_webTouchEventsGestureRecognizer)
  {
    v3 = -[UIWebTouchEventsGestureRecognizer initWithTarget:action:touchDelegate:]([UIWebTouchEventsGestureRecognizer alloc], "initWithTarget:action:touchDelegate:", self, sel__webTouchEventsRecognized_, self);
    self->_webTouchEventsGestureRecognizer = v3;
    -[UIGestureRecognizer setDelegate:](v3, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_webTouchEventsGestureRecognizer);
    v4.receiver = self;
    v4.super_class = (Class)UIWebBrowserView;
    -[UIWebDocumentView installGestureRecognizers](&v4, sel_installGestureRecognizers);
  }
}

- (BOOL)isEditable
{
  objc_super v4;

  if (-[DOMNode _requiresInputView](self->_currentAssistedNode, "_requiresInputView"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UIWebBrowserView;
  return -[UIWebDocumentView isEditable](&v4, sel_isEditable);
}

- (BOOL)_keepKeyboardVisibleDuringFocusRedirects
{
  _BOOL4 v3;

  v3 = -[UIWebBrowserView allowDOMFocusRedirects](self, "allowDOMFocusRedirects");
  if (v3)
    LOBYTE(v3) = -[DOMNode _requiresInputView](self->_assistedNodeStartingFocusRedirects, "_requiresInputView");
  return v3;
}

- (BOOL)_requiresKeyboardWhenFirstResponder
{
  return (*((_BYTE *)self + 1608) & 2) != 0
      || -[DOMNode _requiresInputView](self->_currentAssistedNode, "_requiresInputView")
      || -[UIWebBrowserView _keepKeyboardVisibleDuringFocusRedirects](self, "_keepKeyboardVisibleDuringFocusRedirects");
}

- (BOOL)_requiresKeyboardResetOnReload
{
  return 1;
}

- (id)_keyboardResponder
{
  UIWebBrowserView *v2;

  v2 = self;
  if (-[DOMNode conformsToProtocol:](self->_currentAssistedNode, "conformsToProtocol:", &unk_1EDE22370))
    return v2->_currentAssistedNode;
  return v2;
}

- (id)textDocument
{
  id result;

  result = -[UIWebBrowserView formElement](self, "formElement");
  if (!result)
    return self;
  return result;
}

- (BOOL)_resignFirstResponderAndBlurFocusedElement
{
  objc_super v4;

  if (self->_currentAssistedNode)
  {
    WebThreadLock();
    if (-[DOMNode nodeType](self->_currentAssistedNode, "nodeType") == 1)
      -[DOMNode blur](self->_currentAssistedNode, "blur");
    if (self->_currentAssistedNode)
      -[UIWebBrowserView _stopAssistingFormNode](self, "_stopAssistingFormNode");
  }
  v4.receiver = self;
  v4.super_class = (Class)UIWebBrowserView;
  return -[UIWebDocumentView resignFirstResponder](&v4, sel_resignFirstResponder);
}

- (id)keyCommands
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, sel__nextAccessoryTab_);
  v3[1] = +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x20000, sel__prevAccessoryTab_);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
}

- (void)_nextAccessoryTab:(id)a3
{
  -[UIWebBrowserView accessoryTab:](self, "accessoryTab:", 1);
}

- (void)_prevAccessoryTab:(id)a3
{
  -[UIWebBrowserView accessoryTab:](self, "accessoryTab:", 0);
}

- (id)inputAccessoryView
{
  if (!self->_accessory)
  {
    -[UIWebBrowserView set_accessory:](self, "set_accessory:", -[UIWebFormAccessory initWithInputAssistantItem:]([UIWebFormAccessory alloc], "initWithInputAssistantItem:", -[UIResponder inputAssistantItem](self, "inputAssistantItem")));
    -[UIWebFormAccessory setDelegate:](self->_accessory, "setDelegate:", self);
  }
  if ((*((_BYTE *)self + 1608) & 1) != 0
    && ((*((_BYTE *)self + 1608) & 2) != 0
     || -[DOMNode _requiresAccessoryView](self->_currentAssistedNode, "_requiresAccessoryView")
     || -[UIWebBrowserView _keepKeyboardVisibleDuringFocusRedirects](self, "_keepKeyboardVisibleDuringFocusRedirects")))
  {
    return self->_accessory;
  }
  else
  {
    return 0;
  }
}

- (id)inputView
{
  if (self->_input)
    -[UIWebBrowserView _displayFormNodeInputView](self, "_displayFormNodeInputView");
  else
    -[UIWebBrowserView set_input:](self, "set_input:", -[DOMNode createPeripheral](self->_currentAssistedNode, "createPeripheral"));
  return (id)-[UIFormPeripheral assistantView](self->_input, "assistantView");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  if (sel__promptForReplace_ != a3 && sel__transliterateChinese_ != a3)
  {
    if (sel__nextAccessoryTab_ == a3)
    {
      if (self->_currentAssistedNode)
      {
        LOBYTE(v7) = -[UIWebFormAccessory isNextEnabled](self->_accessory, "isNextEnabled");
        return (char)v7;
      }
    }
    else
    {
      if (sel__prevAccessoryTab_ != a3)
      {
        v11.receiver = self;
        v11.super_class = (Class)UIWebBrowserView;
        LOBYTE(v7) = -[UIWebDocumentView canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, a4);
        return (char)v7;
      }
      if (self->_currentAssistedNode)
      {
        LOBYTE(v7) = -[UIWebFormAccessory isPreviousEnabled](self->_accessory, "isPreviousEnabled");
        return (char)v7;
      }
    }
LABEL_18:
    LOBYTE(v7) = 0;
    return (char)v7;
  }
  v7 = -[UIWebBrowserView textFormElement](self, "textFormElement");
  if (v7)
  {
    v8 = v7;
    if ((objc_msgSend(v7, "isSecure") & 1) != 0)
      goto LABEL_18;
    v7 = (id)objc_msgSend(v8, "selectedTextRange");
    if (v7)
    {
      v9 = v7;
      if ((objc_msgSend(v7, "isEmpty") & 1) != 0)
        goto LABEL_18;
      LOBYTE(v7) = -[UIResponder _shouldPerformUICalloutBarButtonReplaceAction:forText:checkAutocorrection:](self, "_shouldPerformUICalloutBarButtonReplaceAction:forText:checkAutocorrection:", a3, -[UIWebDocumentView textInRange:](self, "textInRange:", v9), 0);
    }
  }
  return (char)v7;
}

- (void)copy:(id)a3
{
  uint64_t v3;
  UIPasteboard *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView copy:](&v5, sel_copy_, a3);
  v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", 0x1E178FA00, 0x1E178FA00);
  v4 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  -[UIPasteboard addItems:](v4, "addItems:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3));
}

- (id)_editingDelegate
{
  UIWebBrowserView *v2;
  UIResponder *v3;

  v2 = self;
  if (!-[UIWebBrowserView formElement](self, "formElement"))
  {
    v3 = -[UIWebBrowserView _editingDelegateForEverythingExceptForms](v2, "_editingDelegateForEverythingExceptForms");
    if (v3)
      return v3;
  }
  return v2;
}

- (BOOL)playsNicelyWithGestures
{
  objc_super v4;

  if (!-[UIWebBrowserView formElement](self, "formElement"))
  {
    -[UIWebBrowserView _editingDelegateForEverythingExceptForms](self, "_editingDelegateForEverythingExceptForms");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return -[UIResponder playsNicelyWithGestures](-[UIWebBrowserView _editingDelegateForEverythingExceptForms](self, "_editingDelegateForEverythingExceptForms"), "playsNicelyWithGestures");
  }
  v4.receiver = self;
  v4.super_class = (Class)UIWebBrowserView;
  return -[UIWebDocumentView playsNicelyWithGestures](&v4, sel_playsNicelyWithGestures);
}

- (void)_promptForReplace:(id)a3
{
  -[UITextInteractionAssistant scheduleReplacements](self->super._textSelectionAssistant, "scheduleReplacements", a3);
}

- (void)_transliterateChinese:(id)a3
{
  -[UITextInteractionAssistant scheduleChineseTransliteration](self->super._textSelectionAssistant, "scheduleChineseTransliteration", a3);
}

- (void)_startAssistingNode:(id)a3
{
  -[UIFormPeripheral beginEditing](self->_input, "beginEditing", a3);
}

- (void)_stopAssistingNode:(id)a3
{
  -[UIFormPeripheral endEditing](self->_input, "endEditing", a3);
  -[UIWebBrowserView set_input:](self, "set_input:", 0);
}

- (void)_startRelinquishingFirstResponderToFocusedElement
{
  -[WebView _pushPerformingProgrammaticFocus](self->super._webView, "_pushPerformingProgrammaticFocus");
}

- (void)_stopRelinquishingFirstResponderToFocusedElement
{
  -[WebView _popPerformingProgrammaticFocus](self->super._webView, "_popPerformingProgrammaticFocus");
}

- (void)_setInputViewBoundsForAutomaticKeyboardInfo:(id)a3 adjustScrollView:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  BOOL v9;
  UIWindow *v10;
  double v11;
  double x;
  double v13;
  double y;
  double v15;
  double width;
  double v17;
  double height;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v4 = a4;
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[UIWindow _isHostedInAnotherProcess](-[UIView window](self, "window"), "_isHostedInAnotherProcess");
    v10 = -[UIView window](self, "window");
    objc_msgSend(v8, "CGRectValue");
    x = v11;
    y = v13;
    width = v15;
    height = v17;
    if (!v9)
    {
      -[UIScreen bounds](-[UIWindow screen](-[UIView window](self, "window"), "screen"), "bounds");
      v29.origin.x = v19;
      v29.origin.y = v20;
      v29.size.width = v21;
      v29.size.height = v22;
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v28 = CGRectIntersection(v27, v29);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
    }
    -[UIWindow convertRect:fromWindow:](v10, "convertRect:fromWindow:", 0, x, y, width, height);
    self->_inputViewBounds.origin.x = v23;
    self->_inputViewBounds.origin.y = v24;
    self->_inputViewBounds.size.width = v25;
    self->_inputViewBounds.size.height = v26;
    if (v4)
      objc_msgSend(-[UIView _scroller](self, "_scroller"), "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", a3, 1, &self->_lastAdjustmentForScroller);
  }
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  if (self->_currentAssistedNode)
    -[UIWebBrowserView _setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:](self, "_setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:", objc_msgSend(a3, "userInfo"), 1);
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  -[UIWebBrowserView _setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:](self, "_setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:", objc_msgSend(a3, "userInfo"), 0);
}

- (void)_keyboardWillShow:(id)a3
{
  if (self->_currentAssistedNode)
  {
    -[UIWebBrowserView _setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:](self, "_setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:", objc_msgSend(a3, "userInfo"), 1);
    *((_BYTE *)self + 1608) = *((_BYTE *)self + 1608) & 0xFD | (2
                                                              * ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1));
  }
}

- (void)_keyboardWillHide:(id)a3
{
  if ((objc_msgSend(+[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance"), "isRotating") & 1) == 0)
  {
    -[UIWebBrowserView _setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:](self, "_setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:", objc_msgSend(a3, "userInfo"), 1);
    *((_BYTE *)self + 1608) &= ~2u;
  }
}

- (void)_updateFixedPositioningObjectsLayoutDuringScroll
{
  objc_super v2;

  if (!self->_currentAssistedNode)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebBrowserView;
    -[UIWebDocumentView _updateFixedPositioningObjectsLayoutDuringScroll](&v2, sel__updateFixedPositioningObjectsLayoutDuringScroll);
  }
}

- (void)_updateFixedPositioningObjectsLayoutAfterScroll
{
  objc_super v2;

  if (!self->_currentAssistedNode)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebBrowserView;
    -[UIWebDocumentView _updateFixedPositioningObjectsLayoutAfterScroll](&v2, sel__updateFixedPositioningObjectsLayoutAfterScroll);
  }
}

- (void)_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange
{
  objc_super v2;

  if (!self->_currentAssistedNode)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebBrowserView;
    -[UIWebDocumentView _updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange](&v2, sel__updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange);
  }
}

- (void)_updateFixedPositionContent
{
  objc_super v2;

  if (!self->_currentAssistedNode)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebBrowserView;
    -[UIWebDocumentView _updateFixedPositionContent](&v2, sel__updateFixedPositionContent);
  }
}

- (void)_updateFixedPositioningObjectsLayoutSoon
{
  if (!self->_currentAssistedNode)
    -[UIWebBrowserView _updateFixedPositioningObjectsLayoutAfterScroll](self, "_updateFixedPositioningObjectsLayoutAfterScroll");
}

- (void)_updateScrollerViewForInputView:(id)a3
{
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", a3, 1, &self->_lastAdjustmentForScroller);
}

- (void)_didScroll
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView _didScroll](&v3, sel__didScroll);
  if ((*((_BYTE *)self + 1608) & 0x40) != 0)
    -[UIWebDocumentView sendScrollEventIfNecessary](self, "sendScrollEventIfNecessary");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWebBrowserView;
    -[UIWebDocumentView setFrame:](&v8, sel_setFrame_, x, y, width, height);
    if (self->_currentAssistedNode)
      objc_msgSend(-[UIView _scroller](self, "_scroller"), "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", 0, 0, &self->_lastAdjustmentForScroller);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWebBrowserView;
    -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
    if (self->_currentAssistedNode)
      objc_msgSend(-[UIView _scroller](self, "_scroller"), "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", 0, 0, &self->_lastAdjustmentForScroller);
  }
}

- (void)_stopAssistingFormNode
{
  DOMNode *v3;

  v3 = self->_currentAssistedNode;
  -[DOMNode _stopAssistingDocumentView:](self->_currentAssistedNode, "_stopAssistingDocumentView:", self);
  -[UIWebBrowserView set_currentAssistedNode:](self, "set_currentAssistedNode:", 0);
  -[UIResponder reloadInputViews](self, "reloadInputViews");

  -[UIWebBrowserView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateFixedPositioningObjectsLayoutSoon, 0, 0.0);
}

- (void)_displayFormNodeInputView
{
  if (!-[UIWebBrowserView allowDOMFocusRedirects](self, "allowDOMFocusRedirects")
    && !self->super._interaction.isWriting)
  {
    WebThreadLock();
    -[UIWebBrowserView _zoomToNode:forceScroll:](self, "_zoomToNode:forceScroll:", self->_currentAssistedNode, -[DOMNode _requiresInputView](self->_currentAssistedNode, "_requiresInputView"));
    -[DOMNode _startAssistingDocumentView:](self->_currentAssistedNode, "_startAssistingDocumentView:", self);
    -[UIWebBrowserView _updateAccessory](self, "_updateAccessory");
  }
}

- (void)_updateAutoFillButton
{
  char v3;
  UIWebAutoFillDelegate *autoFillDelegate;
  uint64_t v5;
  UIWebFormAccessory *accessory;
  int v7;

  if (!-[DOMNode _supportsAutoFill](self->_currentAssistedNode, "_supportsAutoFill"))
  {
    accessory = self->_accessory;
    goto LABEL_6;
  }
  v3 = objc_opt_respondsToSelector();
  autoFillDelegate = self->_autoFillDelegate;
  if ((v3 & 1) != 0)
  {
    v5 = -[UIWebAutoFillDelegate titleOfAutoFillButtonInWebBrowserView:](autoFillDelegate, "titleOfAutoFillButtonInWebBrowserView:", self);
    accessory = self->_accessory;
    if (v5)
    {
      -[UIWebFormAccessory showAutoFillButtonWithTitle:](accessory, "showAutoFillButtonWithTitle:");
      return;
    }
    goto LABEL_6;
  }
  v7 = -[UIWebAutoFillDelegate webBrowserViewShouldShowAutoFillButton:](autoFillDelegate, "webBrowserViewShouldShowAutoFillButton:", self);
  accessory = self->_accessory;
  if (!v7)
  {
LABEL_6:
    -[UIWebFormAccessory hideAutoFillButton](accessory, "hideAutoFillButton");
    return;
  }
  -[UIWebFormAccessory showAutoFillButton](accessory, "showAutoFillButton");
  -[UIWebAutoFillDelegate webBrowserView:updateAutoFillButton:](self->_autoFillDelegate, "webBrowserView:updateAutoFillButton:", self, -[UIWebFormAccessory _autofill](self->_accessory, "_autofill"));
}

- (void)_updateAccessory
{
  _BOOL8 v3;
  _BOOL8 v4;

  if (!-[UIWebBrowserView allowDOMFocusRedirects](self, "allowDOMFocusRedirects"))
  {
    v3 = -[DOMNode _nextAssistedNode](self->_currentAssistedNode, "_nextAssistedNode") != 0;
    v4 = -[DOMNode _previousAssistedNode](self->_currentAssistedNode, "_previousAssistedNode") != 0;
    -[UIWebFormAccessory setNextEnabled:](self->_accessory, "setNextEnabled:", v3);
    -[UIWebFormAccessory setPreviousEnabled:](self->_accessory, "setPreviousEnabled:", v4);
    -[UIWebBrowserView _updateAutoFillButton](self, "_updateAutoFillButton");
    -[UIWebFormAccessory setClearVisible:](self->_accessory, "setClearVisible:", -[DOMNode _supportsAccessoryClear](self->_currentAssistedNode, "_supportsAccessoryClear"));
  }
}

- (void)_focusAndAssistFormNode:(id)a3
{
  WebThreadLock();
  -[UIWebBrowserView _beginAllowingFocusRedirects](self, "_beginAllowingFocusRedirects");
  -[UIWebBrowserView assistFormNode:](self, "assistFormNode:", a3);
  objc_msgSend(a3, "focus");
  -[UIWebBrowserView _endAllowingFocusRedirects](self, "_endAllowingFocusRedirects");
}

- (void)_beginAllowingFocusRedirects
{
  -[UIWebBrowserView setAllowDOMFocusRedirects:](self, "setAllowDOMFocusRedirects:", 1);
  self->_assistedNodeStartingFocusRedirects = self->_currentAssistedNode;
}

- (void)_endAllowingFocusRedirects
{
  -[UIWebBrowserView setAllowDOMFocusRedirects:](self, "setAllowDOMFocusRedirects:", 0);
  -[UIWebBrowserView _reloadInputViewsAfterPotentialFocusRedirect](self, "_reloadInputViewsAfterPotentialFocusRedirect");

  self->_assistedNodeStartingFocusRedirects = 0;
}

- (void)_assistFormNode:(id)a3
{
  -[UIWebBrowserView _beginAllowingFocusRedirects](self, "_beginAllowingFocusRedirects");
  -[UIWebBrowserView assistFormNode:](self, "assistFormNode:", a3);
  -[UIWebBrowserView _endAllowingFocusRedirects](self, "_endAllowingFocusRedirects");
}

- (void)assistFormNode:(id)a3
{
  DOMNode *currentAssistedNode;

  currentAssistedNode = self->_currentAssistedNode;
  if (!currentAssistedNode
    || !-[DOMNode isSameNode:](currentAssistedNode, "isSameNode:", objc_msgSend(a3, "_realNode")))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->super._delegate, "webView:willAssistFormNode:", self, a3);
    -[UIWebBrowserView set_currentAssistedNode:](self, "set_currentAssistedNode:", +[UIThreadSafeNode threadSafeNodeWithNode:](UIThreadSafeNode, "threadSafeNodeWithNode:", a3));
  }
}

- (void)_reloadInputViewsAfterPotentialFocusRedirect
{
  -[DOMNode _stopAssistingDocumentView:](self->_assistedNodeStartingFocusRedirects, "_stopAssistingDocumentView:", self);
  -[UIResponder reloadInputViews](self, "reloadInputViews");
  if (self->_currentAssistedNode)
    -[UIWebBrowserView _displayFormNodeInputView](self, "_displayFormNodeInputView");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateFixedPositioningObjectsLayoutSoon, 0);
}

- (void)_preserveFocusWithToken:(id)a3 destructively:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *focusPreservingTokens;
  DOMNode *currentAssistedNode;

  v4 = a4;
  focusPreservingTokens = self->_focusPreservingTokens;
  if (!focusPreservingTokens)
  {
    focusPreservingTokens = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    self->_focusPreservingTokens = focusPreservingTokens;
  }
  currentAssistedNode = self->_currentAssistedNode;
  if (!currentAssistedNode)
  {
    currentAssistedNode = (DOMNode *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    focusPreservingTokens = self->_focusPreservingTokens;
  }
  -[NSMutableDictionary setObject:forKey:](focusPreservingTokens, "setObject:forKey:", currentAssistedNode, a3);
  if (v4)
  {
    if (self->_currentAssistedNode)
      -[UIWebBrowserView _stopAssistingFormNode](self, "_stopAssistingFormNode");
  }
}

- (BOOL)_restoreFocusWithToken:(id)a3
{
  DOMNode *v5;
  BOOL v6;

  v5 = (DOMNode *)-[NSMutableDictionary objectForKey:](self->_focusPreservingTokens, "objectForKey:");
  if (-[DOMNode isEqual:](v5, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    -[UIWebBrowserView _stopAssistingFormNode](self, "_stopAssistingFormNode");
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIWebBrowserView _focusAndAssistFormNode:](self, "_focusAndAssistFormNode:", v5);
      v6 = self->_currentAssistedNode == v5;
    }
    else
    {
      v6 = 0;
    }
  }
  -[NSMutableDictionary removeObjectForKey:](self->_focusPreservingTokens, "removeObjectForKey:", a3);
  return v6;
}

- (void)_clearToken:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_focusPreservingTokens, "removeObjectForKey:", a3);
}

- (void)setAllowsInlineMediaPlayback:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  -[WebPreferences setMediaPlaybackAllowsInline:](-[WebView preferences](self->super._webView, "preferences"), "setMediaPlaybackAllowsInline:", v3);
}

- (BOOL)allowsInlineMediaPlayback
{
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  return -[WebPreferences mediaPlaybackAllowsInline](-[WebView preferences](self->super._webView, "preferences"), "mediaPlaybackAllowsInline");
}

- (void)setMediaPlaybackRequiresUserAction:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  -[WebPreferences setMediaPlaybackRequiresUserGesture:](-[WebView preferences](self->super._webView, "preferences"), "setMediaPlaybackRequiresUserGesture:", v3);
}

- (BOOL)mediaPlaybackRequiresUserAction
{
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  return -[WebPreferences mediaPlaybackRequiresUserGesture](-[WebView preferences](self->super._webView, "preferences"), "mediaPlaybackRequiresUserGesture");
}

- (void)setAudioSessionCategoryOverride:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  -[WebPreferences setAudioSessionCategoryOverride:](-[WebView preferences](self->super._webView, "preferences"), "setAudioSessionCategoryOverride:", v3);
}

- (void)setAllowsPictureInPictureVideo:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[WebView preferences](self->super._webView, "preferences");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((WebThreadIsLocked() & 1) == 0)
      WebThreadLock();
    -[WebPreferences setAllowsAlternateFullscreen:](-[WebView preferences](self->super._webView, "preferences"), "setAllowsAlternateFullscreen:", v3);
  }
}

- (BOOL)allowsPictureInPictureVideo
{
  -[WebView preferences](self->super._webView, "preferences");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  return -[WebPreferences allowsAlternateFullscreen](-[WebView preferences](self->super._webView, "preferences"), "allowsAlternateFullscreen");
}

- (void)setAllowsLinkPreview:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 1609);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 1609) = v3 & 0xFE | a3;
    if (a3)
      -[UIWebDocumentView _registerPreview](self, "_registerPreview");
    else
      -[UIWebDocumentView _unregisterPreview](self, "_unregisterPreview");
  }
}

- (BOOL)allowsLinkPreview
{
  return *((_BYTE *)self + 1609) & 1;
}

- (unsigned)audioSessionCategoryOverride
{
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  return -[WebPreferences audioSessionCategoryOverride](-[WebView preferences](self->super._webView, "preferences"), "audioSessionCategoryOverride");
}

- (void)setNetworkInterfaceName:(id)a3
{
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  -[WebPreferences setNetworkInterfaceName:](-[WebView preferences](self->super._webView, "preferences"), "setNetworkInterfaceName:", a3);
}

- (NSString)networkInterfaceName
{
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  return (NSString *)-[WebPreferences networkInterfaceName](-[WebView preferences](self->super._webView, "preferences"), "networkInterfaceName");
}

- (void)accessoryTab:(BOOL)a3
{
  _BOOL4 v3;
  DOMNode *currentAssistedNode;
  uint64_t v6;

  v3 = a3;
  WebThreadLock();
  currentAssistedNode = self->_currentAssistedNode;
  if (v3)
    v6 = -[DOMNode _nextAssistedNode](currentAssistedNode, "_nextAssistedNode");
  else
    v6 = -[DOMNode _previousAssistedNode](currentAssistedNode, "_previousAssistedNode");
  if (v6)
    -[UIWebBrowserView _focusAndAssistFormNode:](self, "_focusAndAssistFormNode:", v6);
  else
    -[UIWebBrowserView _updateAccessory](self, "_updateAccessory");
}

- (void)accessoryAutoFill
{
  -[UIWebAutoFillDelegate autoFillInWebBrowserView:](self->_autoFillDelegate, "autoFillInWebBrowserView:", self);
}

- (void)accessoryClear
{
  WebThreadLock();
  -[DOMNode _accessoryClear](self->_currentAssistedNode, "_accessoryClear");
}

- (void)_scrollCaretToVisible:(id)a3
{
  id v4;
  id v5;

  v4 = -[UIWebBrowserView formElement](self, "formElement", a3);
  if (v4)
  {
    if (!self->super._interaction.isWriting)
    {
      v5 = v4;
      WebThreadLock();
      -[UIWebBrowserView _zoomToNode:forceScroll:](self, "_zoomToNode:forceScroll:", v5, 0);
    }
  }
}

- (void)formDelegateTextDidChange
{
  if (!self->super._interaction.isWriting)
    -[UIWebBrowserView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__scrollCaretToVisible_, self, 0.0);
}

- (id)formElement
{
  return self->_currentAssistedNode;
}

- (id)textFormElement
{
  return (id)objc_msgSend(-[UIWebBrowserView formElement](self, "formElement"), "_textFormElement");
}

- (void)_resetFormDataForFrame:(id)a3
{
  -[UIWebFormDelegate dataSourceHasChangedForFrame:](self->_formDelegate, "dataSourceHasChangedForFrame:", a3);
  if (self->_currentAssistedNode)
    -[UIWebBrowserView _stopAssistingFormNode](self, "_stopAssistingFormNode");
}

- (void)_autoFillFrame:(id)a3
{
  if (objc_msgSend(a3, "isMainFrame")
    && (*((char *)&self->super + 963) & 0x80000000) == 0
    && (*((_BYTE *)&self->super + 963) & 0x40) != 0)
  {
    *((_BYTE *)self + 1608) |= 4u;
    -[UIWebAutoFillDelegate webBrowserView:preFillInFrame:](self->_autoFillDelegate, "webBrowserView:preFillInFrame:", self, a3);
    *((_BYTE *)self + 1608) &= ~4u;
  }
}

- (void)webView:(id)a3 willCloseFrame:(id)a4
{
  -[UIWebBrowserView _clearFormAutoFillStateForFrame:](self, "_clearFormAutoFillStateForFrame:", a4);
}

- (void)_clearFormAutoFillStateForFrame:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebAutoFillDelegate webBrowserView:clearFormAutoFillStateForFrame:](self->_autoFillDelegate, "webBrowserView:clearFormAutoFillStateForFrame:", self, a3);
}

- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  id v6;

  if (self->_currentAssistedNode)
  {
    v6 = -[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame", a3);
    if (v6 == a4 || objc_msgSend(v6, "_isDescendantOfFrame:", a4))
      -[DOMNode blur](self->_currentAssistedNode, "blur");
  }
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView webView:didFinishLoadForFrame:](&v6, sel_webView_didFinishLoadForFrame_, a3);
  -[UIWebBrowserView _autoFillFrame:](self, "_autoFillFrame:", a4);
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView webView:didFailLoadWithError:forFrame:](&v7, sel_webView_didFailLoadWithError_forFrame_, a3, a4);
  -[UIWebBrowserView _autoFillFrame:](self, "_autoFillFrame:", a5);
}

- (void)acceptedAutoFillWord:(id)a3
{
  *((_BYTE *)self + 1608) |= 4u;
  -[UIWebFormDelegate acceptedAutoFillWord:](self->_formDelegate, "acceptedAutoFillWord:", a3);
  *((_BYTE *)self + 1608) &= ~4u;
}

- (BOOL)isAutoFillMode
{
  id v3;

  v3 = -[UIWebBrowserView formElement](self, "formElement");
  return v3
      && objc_msgSend(v3, "isTextControl")
      && -[UIWebFormDelegate hasCurrentSuggestions](self->_formDelegate, "hasCurrentSuggestions");
}

- (BOOL)_isAutoFilling
{
  return (*((unsigned __int8 *)self + 1608) >> 2) & 1;
}

- (void)_webViewFormEditedStatusHasChanged:(id)a3
{
  *((_BYTE *)self + 1608) ^= 0x20u;
}

- (void)webView:(id)a3 elementDidFocusNode:(id)a4
{
  if ((*((_BYTE *)&self->super + 964) & 0x10) == 0)
  {
    if (objc_msgSend(a4, "nodeCanBecomeFirstResponder", a3)
      && ((*((_BYTE *)self + 1608) & 8) != 0
       || self->super._interaction.element
       || -[UIWebBrowserView allowDOMFocusRedirects](self, "allowDOMFocusRedirects")
       || -[UIWebBrowserView isDispatchingTouchEvents](self, "isDispatchingTouchEvents")))
    {
      if (!-[UIView isFirstResponder](self, "isFirstResponder")
        && ((*((_BYTE *)self + 1608) & 8) != 0
         || -[UIWebBrowserView isDispatchingTouchEvents](self, "isDispatchingTouchEvents")))
      {
        -[UIWebDocumentView becomeFirstResponder](self, "becomeFirstResponder");
      }
      if (-[UIWebBrowserView allowDOMFocusRedirects](self, "allowDOMFocusRedirects"))
        -[UIWebBrowserView assistFormNode:](self, "assistFormNode:", a4);
      else
        -[UIWebBrowserView _assistFormNode:](self, "_assistFormNode:", a4);
    }
    -[UIWebBrowserView _updateAccessory](self, "_updateAccessory");
  }
}

- (void)webView:(id)a3 elementDidBlurNode:(id)a4
{
  DOMNode *currentAssistedNode;

  currentAssistedNode = self->_currentAssistedNode;
  if (currentAssistedNode)
  {
    if (-[DOMNode isSameNode:](currentAssistedNode, "isSameNode:", a4))
    {
      if (objc_msgSend(a4, "nodeType") == 1)
      {
        *((_BYTE *)self + 1608) &= ~2u;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || objc_msgSend(a4, "isContentEditable"))
        {
          -[UIWebBrowserView _stopAssistingFormNode](self, "_stopAssistingFormNode");
        }
      }
    }
  }
  -[UIWebBrowserView _updateAccessory](self, "_updateAccessory", a3, a4);
}

- (BOOL)_shouldDeferEvents
{
  return self->_dispatchedTouchEvents != 0;
}

- (void)_dispatchWebEvent:(id)a3
{
  ++self->_dispatchedTouchEvents;
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "window"), "sendEventSynchronously:", a3);
  --self->_dispatchedTouchEvents;
}

- (void)_startDeferringEvents
{
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "setUserInteractionEnabled:", 0);
}

- (void)_endDeferringEvents
{
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "setUserInteractionEnabled:", 1);
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (void)_deferWebEvent:(id)a3
{
  NSMutableArray *deferredTouchEvents;

  deferredTouchEvents = self->_deferredTouchEvents;
  if (!deferredTouchEvents)
  {
    deferredTouchEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_deferredTouchEvents = deferredTouchEvents;
  }
  if (!-[NSMutableArray count](deferredTouchEvents, "count"))
    -[UIWebBrowserView _startDeferringEvents](self, "_startDeferringEvents");
  -[NSMutableArray addObject:](self->_deferredTouchEvents, "addObject:", a3);
}

- (void)_handleDeferredEvents
{
  NSMutableArray *deferredTouchEvents;
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
  if (-[NSMutableArray count](self->_deferredTouchEvents, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    deferredTouchEvents = self->_deferredTouchEvents;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredTouchEvents, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(deferredTouchEvents);
          -[UIWebBrowserView _dispatchWebEvent:](self, "_dispatchWebEvent:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredTouchEvents, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
    -[NSMutableArray removeAllObjects](self->_deferredTouchEvents, "removeAllObjects");

    self->_deferredTouchEvents = 0;
    -[UIWebBrowserView _endDeferringEvents](self, "_endDeferringEvents");
  }
}

- (void)_webTouchEventsRecognized:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  unsigned int v13;
  double v14;
  double v15;
  uint64_t v16;
  id v18;

  v4 = objc_msgSend(a3, "lastTouchEvent");
  v5 = *(unsigned int *)(v4 + 80);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  if ((_DWORD)v5)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", *(double *)(*(_QWORD *)(v4 + 72) + v9 + 16), *(double *)(*(_QWORD *)(v4 + 72) + v9 + 24)));
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(v4 + 72) + v9 + 32)));
      objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(v4 + 72) + v9 + 40)));
      v9 += 88;
    }
    while (88 * v5 != v9);
  }
  if ((*(_DWORD *)v4 - 1) >= 3)
    v10 = 6;
  else
    v10 = (*(_DWORD *)v4 + 6);
  v11 = objc_alloc(MEMORY[0x1E0DD9748]);
  v12 = *(double *)(v4 + 8);
  v13 = objc_msgSend(a3, "modifierFlags");
  *(float *)&v14 = *(double *)(v4 + 48);
  *(float *)&v15 = *(double *)(v4 + 56);
  LOBYTE(v16) = *(_BYTE *)(v4 + 64);
  v18 = (id)objc_msgSend(v11, "initWithTouchEventType:timeStamp:location:modifiers:touchCount:touchLocations:touchIdentifiers:touchPhases:isGesture:gestureScale:gestureRotation:", v10, v13 & 0xA0000 | ((HIWORD(v13) & 1) << 18) & 0xFBEFFFFF | (v13 >> 4) & 0x10000 | (((v13 >> 18) & 1) << 20) & 0xFBFFFFFF | (((v13 >> 23) & 1) << 26), v5, v6, v7, v8, v12, *(double *)(v4 + 32), *(double *)(v4 + 40), v14, v15, v16);

  if (-[UIWebBrowserView _shouldDeferEvents](self, "_shouldDeferEvents"))
  {
    -[UIWebBrowserView _deferWebEvent:](self, "_deferWebEvent:", v18);

  }
  else
  {
    WebThreadLock();
    -[UIWebBrowserView _dispatchWebEvent:](self, "_dispatchWebEvent:", v18);

    -[UIWebBrowserView _handleDeferredEvents](self, "_handleDeferredEvents");
  }
}

- (BOOL)isDispatchingTouchEvents
{
  return -[UIWebTouchEventsGestureRecognizer isDispatchingTouchEvents](self->_webTouchEventsGestureRecognizer, "isDispatchingTouchEvents");
}

- (CGPoint)_convertWindowPointToViewport:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0, x, y);
  v12 = fmax(v11, 0.0);
  if (v12 >= v7)
    v12 = v7;
  v13 = fmax(v10, 0.0);
  if (v13 >= v9)
    v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)webViewDidPreventDefaultForEvent:(id)a3
{
  -[UIWebTouchEventsGestureRecognizer setDefaultPrevented:](self->_webTouchEventsGestureRecognizer, "setDefaultPrevented:", 1);
  -[UIWebDocumentView cancelInteraction](self, "cancelInteraction");
}

- (CGRect)_activeRectForRectToCenter:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  DOMNode *element;
  uint64_t v9;
  WebFrame *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double documentScale;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WebThreadLock();
  element = -[UIWebBrowserView formElement](self, "formElement");
  if (!element)
  {
    if (self->super._interaction.var0)
      element = self->super._interaction.element;
    else
      element = 0;
  }
  v9 = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "documentView");
  if (element)
  {
    v10 = -[DOMDocument webFrame](-[DOMNode ownerDocument](element, "ownerDocument"), "webFrame");
    v11 = (void *)-[WebFrame documentView](v10, "documentView");
    if (self->super._interaction.var0)
    {
      -[DOMNode absoluteQuad](element, "absoluteQuad");
      v12 = quadBoundingBox(&v35);
    }
    else
    {
      -[WebFrame rectForScrollToVisible](v10, "rectForScrollToVisible");
    }
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v25 = v15;
LABEL_16:
    objc_msgSend(v11, "convertRect:toView:", v9, v22, v23, v24, v25);
    documentScale = self->super._documentScale;
    v26 = v31 * documentScale;
    v27 = v32 * documentScale;
    v28 = v33 * documentScale;
    v29 = v34 * documentScale;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(self->super._delegate, "webViewRotateShouldCenterSelectionRect:", self) & 1) != 0)
  {
    v16 = (void *)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "selectedFrame");
    if (!v16)
      v16 = (void *)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame");
    v11 = (void *)objc_msgSend(v16, "documentView");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "frameView"), "documentView"), "selectionRect");
    v39.origin.x = v17;
    v39.origin.y = v18;
    v39.size.width = v19;
    v39.size.height = v20;
    v21 = 1.0 / self->super._documentScale;
    v36.origin.x = x * v21;
    v36.origin.y = y * v21;
    v36.size.width = width * v21;
    v36.size.height = height * v21;
    v37 = CGRectIntersection(v36, v39);
    v22 = v37.origin.x;
    v23 = v37.origin.y;
    v24 = v37.size.width;
    v25 = v37.size.height;
    if (!CGRectIsEmpty(v37))
      goto LABEL_16;
  }
  v26 = *MEMORY[0x1E0C9D628];
  v27 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v28 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v29 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_17:
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_centerRect:(CGRect)a3 forSizeChange:(BOOL)a4 withVisibleHeight:(double)a5 pinningEdge:(unint64_t)a6 toValue:(double)a7
{
  _BOOL4 v10;
  double height;
  double width;
  double y;
  double x;
  id v16;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 IsEmpty;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  BOOL v59;
  double v60;
  double v61;
  char v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v10 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v64 = a5;
    v66 = a7;
    v16 = -[UIView _scroller](self, "_scroller");
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v65 = v19;
    objc_msgSend(v16, "convertRect:fromView:", self, x, y, width, height);
    v21 = v20;
    v23 = v22;
    v26 = v25 + (v18 - v24) * -0.5;
    if (v10)
    {
      -[UIWebBrowserView _activeRectForRectToCenter:](self, "_activeRectForRectToCenter:", x, y, width, height);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
    }
    else
    {
      v28 = *MEMORY[0x1E0C9D628];
      v30 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v32 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v34 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    v35 = round(v26);
    v67.origin.x = v28;
    v67.origin.y = v30;
    v67.size.width = v32;
    v67.size.height = v34;
    IsEmpty = CGRectIsEmpty(v67);
    if (IsEmpty)
    {
      v37 = v65;
      v38 = round(v21 + (v65 - v23) * -0.5);
    }
    else
    {
      objc_msgSend(v16, "convertRect:fromView:", self, v28, v30, v32, v34);
      v39 = v68.origin.x;
      v40 = v68.origin.y;
      v41 = v68.size.width;
      v42 = v68.size.height;
      v43 = round(CGRectGetMidY(v68) + v64 * -0.5);
      v69.origin.x = v39;
      v69.origin.y = v40;
      v69.size.width = v41;
      v69.size.height = v42;
      v44 = CGRectGetMinX(v69) + -20.0;
      if (v35 >= v44)
        v35 = v44;
      v70.origin.x = v39;
      v70.origin.y = v40;
      v70.size.width = v41;
      v70.size.height = v42;
      v45 = CGRectGetMinY(v70) + -20.0;
      if (v43 >= v45)
        v43 = v45;
      v71.origin.x = v39;
      v71.origin.y = v40;
      v71.size.width = v41;
      v71.size.height = v42;
      v46 = CGRectGetMaxX(v71) + 20.0 - v18;
      if (v35 < v46)
        v35 = v46;
      v72.origin.x = v39;
      v72.origin.y = v40;
      v72.size.width = v41;
      v72.size.height = v42;
      v37 = v65;
      v47 = CGRectGetMaxY(v72) + 20.0 - v65;
      if (v43 >= v47)
        v38 = v43;
      else
        v38 = v47;
    }
    objc_msgSend(v16, "contentSize");
    v49 = v48;
    v51 = v50;
    objc_msgSend(v16, "contentInset");
    v56 = v49 + v54 + v55 - v18;
    if (v35 >= v56)
      v57 = v56;
    else
      v57 = v35;
    if (v57 < 0.0)
      v57 = 0.0;
    v58 = round(v57);
    v59 = a6 == 1 && IsEmpty;
    v60 = v66;
    if (!v59)
    {
      v61 = v51 + v52 + v53 - v37;
      if (v38 < v61)
        v61 = v38;
      if (v61 < 0.0)
        v61 = 0.0;
      v62 = !IsEmpty;
      if (a6 != 4)
        v62 = 1;
      if ((v62 & 1) != 0)
      {
        v60 = round(v61);
      }
      else
      {
        objc_msgSend(v16, "contentSize", v61, v66);
        v60 = v63 - v37;
      }
    }
    objc_msgSend(v16, "setContentOffset:", v58, v60);
  }
}

- (void)_centerRect:(CGRect)a3 forSizeChange:(BOOL)a4 withVisibleHeight:(double)a5 pinningEdge:(unint64_t)a6
{
  -[UIWebBrowserView _centerRect:forSizeChange:withVisibleHeight:pinningEdge:toValue:](self, "_centerRect:forSizeChange:withVisibleHeight:pinningEdge:toValue:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5, 0.0);
}

- (void)_zoomToNode:(id)a3 forceScroll:(BOOL)a4
{
  _BOOL8 v4;
  float v7;
  float v8;
  float v9;
  float documentScale;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double x;
  double y;
  double width;
  double height;
  float v20;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  _OWORD v40[4];
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v4 = a4;
  if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1|| !-[_UIWebViewportHandler allowsUserScaling](self->super._viewportHandler, "allowsUserScaling"))
  {
    documentScale = self->super._documentScale;
  }
  else
  {
    objc_msgSend(a3, "computedFontSize");
    v8 = 16.0 / v7;
    -[_UIWebViewportHandler minimumScale](self->super._viewportHandler, "minimumScale");
    if (v8 < v9)
      v8 = v9;
    -[_UIWebViewportHandler maximumScale](self->super._viewportHandler, "maximumScale");
    if (v8 < documentScale)
      documentScale = v8;
  }
  -[_UIWebViewportHandler integralScaleForScale:keepingPointFixed:](self->super._viewportHandler, "integralScaleForScale:keepingPointFixed:", 0, documentScale);
  v12 = v11;
  v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "webFrame");
  v14 = (void *)objc_msgSend(v13, "documentView");
  v15 = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "documentView");
  if (a3)
    objc_msgSend(a3, "absoluteQuad");
  else
    memset(v40, 0, sizeof(v40));
  v41.origin.x = quadBoundingBox((double *)v40);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  if (!CGRectIsEmpty(v41))
  {
    v20 = v12;
    v39 = v20;
    objc_msgSend(v14, "convertRect:toView:", v15, x, y, width, height);
    v21 = self->super._documentScale;
    v23 = v22 * v21;
    v25 = v24 * v21;
    v27 = v26 * v21;
    v29 = v28 * v21;
    objc_msgSend(v13, "rectForScrollToVisible");
    objc_msgSend(v14, "convertRect:toView:", v15);
    v30 = self->super._documentScale;
    v32 = v31 * v30;
    v34 = v33 * v30;
    v36 = v35 * v30;
    v38 = v37 * v30;
    v42.origin.x = v23;
    v42.origin.y = v25;
    v42.size.width = v27;
    v42.size.height = v29;
    v43.origin.x = v32;
    v43.origin.y = v34;
    v43.size.width = v36;
    v43.size.height = v38;
    if (!CGRectContainsRect(v42, v43))
    {
      v32 = *MEMORY[0x1E0C9D628];
      v34 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v36 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v38 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    -[UIWebBrowserView _zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:](self, "_zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:", v4, v23, v25, v27, v29, v32, v34, v36, v38, v39);
  }
}

- (void)_zoomToRect:(CGRect)a3 ensuringVisibilityOfRect:(CGRect)a4 withScale:(double)a5 forceScroll:(BOOL)a6
{
  -[UIWebBrowserView _zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:formAssistantFrame:animationDuration:](self, "_zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:formAssistantFrame:animationDuration:", a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(_QWORD *)&a5, *(_QWORD *)&self->_inputViewBounds.origin.x, *(_QWORD *)&self->_inputViewBounds.origin.y, *(_QWORD *)&self->_inputViewBounds.size.width, *(_QWORD *)&self->_inputViewBounds.size.height, 0x3FD0000000000000);
}

- (uint64_t)_zoomToRect:(CGFloat)a3 ensuringVisibilityOfRect:(CGFloat)a4 withScale:(CGFloat)a5 forceScroll:(CGFloat)a6 formAssistantFrame:(CGFloat)a7 animationDuration:(CGFloat)a8
{
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 IsNull;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double MaxY;
  double v74;
  _BOOL4 v75;
  CGFloat v76;
  double v77;
  double v78;
  uint64_t result;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
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
  int v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  CGFloat r2;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat rect;
  CGFloat recta;
  CGFloat v111;
  CGFloat v113;
  double v117;
  CGFloat v119;
  double v121;
  double v122;
  double v123;
  CGFloat v125;
  double v126;
  double v127;
  double MinY;
  double v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;

  v24 = (void *)objc_msgSend((id)a1, "_scroller");
  v25 = (void *)objc_msgSend(v24, "window");
  v26 = a12 / *(float *)(a1 + 900);
  objc_msgSend(v24, "minimumZoomScale");
  if (v26 < v27)
    v26 = v27;
  objc_msgSend(v24, "maximumZoomScale");
  if (v26 < v28)
    v28 = v26;
  v117 = v28;
  v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "_viewControllerForAncestor"), "_rootAncestorViewController"), "_viewControllerForSupportedInterfaceOrientations"), "view");
  if (v29)
    v30 = (void *)v29;
  else
    v30 = v25;
  objc_msgSend(v30, "bounds");
  objc_msgSend(v30, "convertRect:toView:", v24);
  v125 = v31;
  v105 = v33;
  v106 = v32;
  r2 = v34;
  objc_msgSend((id)a1, "exposedScrollViewRect");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  objc_msgSend(v24, "bounds");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v130.origin.x = v36;
  v130.origin.y = v38;
  v130.size.width = v40;
  v130.size.height = v42;
  IsNull = CGRectIsNull(v130);
  v102 = v48;
  v103 = v50;
  if (IsNull)
    v52 = v48;
  else
    v52 = v40;
  if (IsNull)
    v53 = v50;
  else
    v53 = v42;
  v100 = v44;
  v101 = v46;
  if (IsNull)
    v54 = v46;
  else
    v54 = v38;
  if (IsNull)
    v55 = v44;
  else
    v55 = v36;
  v122 = v55;
  v123 = v54;
  v146.origin.x = v125;
  v146.size.width = v105;
  v146.origin.y = v106;
  v146.size.height = r2;
  v131 = CGRectIntersection(*(CGRect *)(&v52 - 2), v146);
  x = v131.origin.x;
  y = v131.origin.y;
  width = v131.size.width;
  height = v131.size.height;
  objc_msgSend(v25, "convertRect:toView:", v24, a13, a14, a15, a16);
  v147.origin.x = v60;
  v147.origin.y = v61;
  v147.size.width = v62;
  v147.size.height = v63;
  v132.origin.x = x;
  rect = y;
  v132.origin.y = y;
  v132.size.width = width;
  v132.size.height = height;
  v133 = CGRectIntersection(v132, v147);
  v64 = v133.origin.x;
  v65 = v133.origin.y;
  v66 = v133.size.width;
  v67 = v133.size.height;
  v126 = width;
  v127 = 0.0;
  if (CGRectIsEmpty(v133))
    goto LABEL_26;
  v134.origin.x = v64;
  v134.origin.y = v65;
  v134.size.width = v66;
  v134.size.height = v67;
  MinY = CGRectGetMinY(v134);
  v135.origin.x = x;
  v135.origin.y = rect;
  v135.size.width = width;
  v135.size.height = height;
  v68 = CGRectGetMinY(v135);
  v69 = x;
  v70 = MinY - v68;
  v107 = v69;
  v136.origin.x = v69;
  v136.origin.y = rect;
  v71 = height;
  v136.size.width = width;
  v136.size.height = height;
  MaxY = CGRectGetMaxY(v136);
  v137.origin.x = v64;
  v137.origin.y = v65;
  v137.size.width = v66;
  v137.size.height = v67;
  height = MaxY - CGRectGetMaxY(v137);
  v129 = v70;
  if (v70 < 106.0 && height >= v70)
  {
    v138.origin.x = v64;
    v138.origin.y = v65;
    v138.size.width = v66;
    v138.size.height = v67;
    v74 = CGRectGetMaxY(v138);
    v139.origin.x = v107;
    v139.origin.y = rect;
    v139.size.width = width;
    v139.size.height = v71;
    v127 = v74 - CGRectGetMinY(v139);
LABEL_26:
    v129 = height;
  }
  v140.origin.x = a6;
  v140.origin.y = a7;
  v140.size.width = a8;
  v140.size.height = a9;
  v75 = CGRectIsNull(v140);
  if ((a11 & 1) == 0)
  {
    objc_msgSend(v24, "convertPoint:toView:", a1, v122, v123);
    v76 = v141.origin.x;
    v141.size.width = width;
    v78 = v127 + v77;
    v141.origin.y = v127 + v77;
    v141.size.height = v129;
    v148.origin.x = a2;
    v148.origin.y = a3;
    v148.size.width = a4;
    v148.size.height = a5;
    result = CGRectContainsRect(v141, v148);
    if ((result & 1) != 0)
      return result;
    if (!v75)
    {
      v142.origin.x = v76;
      v142.origin.y = v78;
      v149.origin.x = a6;
      v142.size.width = width;
      v142.size.height = v129;
      v149.origin.y = a7;
      v149.size.width = a8;
      v149.size.height = a9;
      result = CGRectContainsRect(v142, v149);
      if ((result & 1) != 0)
        return result;
    }
  }
  v80 = v117;
  v81 = width;
  v82 = (width - a4 * v117) * 0.5;
  if (v82 < 0.0)
    v82 = 0.0;
  v83 = v129;
  v84 = (v129 - a5 * v117) * 0.5;
  if (v84 < 0.0)
    v84 = 0.0;
  v85 = a2 * v117 - v82;
  v121 = a3 * v117 - v84;
  objc_msgSend(*(id *)(a1 + 888), "documentBounds");
  objc_msgSend((id)a1, "convertRect:toView:", v24, v86 * a12, v87 * a12, v88 * a12, v89 * a12);
  v119 = v90;
  v111 = v92;
  v113 = v91;
  recta = v93;
  if (v75)
  {
    v94 = -INFINITY;
    goto LABEL_41;
  }
  v143.origin.x = a6 * v117;
  v143.origin.y = a7 * v117;
  v143.size.width = a8 * v117;
  v143.size.height = a9 * v117;
  v95 = CGRectGetMaxX(v143) + 20.0 - v126;
  v144.origin.x = a6 * v117;
  v144.origin.y = a7 * v117;
  v83 = v129;
  v144.size.width = a8 * v117;
  v144.size.height = a9 * v117;
  v94 = CGRectGetMaxY(v144) + 20.0 - v129 - v127;
  if (v85 >= v95)
  {
    v80 = v117;
    v90 = v119;
    v81 = v126;
    v92 = v111;
    v91 = v113;
    v93 = recta;
LABEL_41:
    v96 = !v75;
    v97 = CGRectGetMaxX(*(CGRect *)&v90) - v81;
    if (v85 <= v97)
      v95 = v85;
    else
      v95 = v97;
    goto LABEL_44;
  }
  v96 = 1;
  v80 = v117;
LABEL_44:
  v98 = v121 - v127;
  if (!v96 || v98 >= v94)
  {
    v145.origin.x = v119;
    v145.size.width = v111;
    v145.origin.y = v113;
    v145.size.height = recta;
    v99 = CGRectGetMaxY(v145) - v83;
    if (v98 <= v99)
      v94 = v121 - v127;
    else
      v94 = v99;
  }
  return objc_msgSend(v24, "_zoomToCenter:scale:duration:force:", 1, (v102 * 0.5 + v95 - (v122 - v100)) / v80, (v103 * 0.5 + v94 - (v123 - v101)) / v80, v80, a17);
}

- (void)_zoomToRect:(CGRect)a3 withScale:(double)a4
{
  -[UIWebBrowserView _zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:](self, "_zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), *(_QWORD *)&a4);
}

- (CGSize)_defaultScrollViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double v12;
  double MaxY;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;
  CGRect v18;

  objc_msgSend(-[UIView _scroller](self, "_scroller"), "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView frame](self, "frame");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MaxX = CGRectGetMaxX(v17);
  if (MaxX < v4)
    MaxX = v4;
  v12 = round(MaxX);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MaxY = CGRectGetMaxY(v18);
  if (MaxY < v6)
    MaxY = v6;
  v14 = round(MaxY);
  v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)rotateEnclosingScrollViewToFrame:(CGRect)a3
{
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v4 = _UIWebRotateToFrame(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UIView _scroller](self, "_scroller");
  objc_msgSend(v11, "bounds");
  objc_msgSend(v11, "convertRect:toView:", self);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  v13 = CGRectUnion(v12, v14);
  -[UIWebDocumentView _flattenAndSwapContentLayersInRect:](self, "_flattenAndSwapContentLayersInRect:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
}

- (void)webView:(id)a3 addMessageToConsole:(id)a4 withSource:(id)a5
{
  $1CF94A04F8ADBB3673F9BB79AC4F7AE2 *p_messages;
  NSMutableArray *all;
  __int16 v9;
  char v10;
  NSMutableArray *html;
  NSMutableArray *error;

  p_messages = &self->_messages;
  all = self->_messages.all;
  if (!all)
  {
    all = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    p_messages->all = all;
  }
  -[NSMutableArray addObject:](all, "addObject:", a4, a4, a5);
  v9 = objc_msgSend(a4, "_web_messageType");
  v10 = v9;
  if ((v9 & 0x20) != 0)
  {
    html = p_messages->html;
    if (!html)
    {
      html = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      p_messages->html = html;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    html = p_messages->javascript;
    if (!html)
    {
      html = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      p_messages->javascript = html;
    }
  }
  else
  {
    if ((v9 & 0x100) == 0)
      goto LABEL_13;
    html = p_messages->css;
    if (!html)
    {
      html = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      p_messages->css = html;
    }
  }
  -[NSMutableArray addObject:](html, "addObject:", a4);
LABEL_13:
  if ((v10 & 0x10) != 0)
  {
    error = p_messages->error;
    if (!error)
    {
      error = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      p_messages->error = error;
    }
    goto LABEL_25;
  }
  if ((v10 & 8) != 0)
  {
    error = p_messages->warning;
    if (!error)
    {
      error = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      p_messages->warning = error;
    }
    goto LABEL_25;
  }
  if ((v10 & 2) != 0)
  {
    error = p_messages->tip;
    if (!error)
    {
      error = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      p_messages->tip = error;
    }
    goto LABEL_25;
  }
  if ((v10 & 4) != 0)
  {
    error = p_messages->log;
    if (!error)
    {
      error = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      p_messages->log = error;
    }
LABEL_25:
    -[NSMutableArray addObject:](error, "addObject:", a4);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("UIWebViewDidReceiveMessageNotification"), self);
}

- (id)messagesMatchingMask:(int)a3
{
  void *v3;
  $1CF94A04F8ADBB3673F9BB79AC4F7AE2 *p_error;

  v3 = 0;
  if (a3 > 995)
  {
    if (a3 > 1007)
    {
      if (a3 == 1008)
      {
        p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.error;
        return p_error->all;
      }
      if (a3 == 1022)
      {
        p_error = &self->_messages;
        return p_error->all;
      }
    }
    else
    {
      if (a3 == 996)
      {
        p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.log;
        return p_error->all;
      }
      if (a3 == 1000)
      {
        p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.warning;
        return p_error->all;
      }
    }
  }
  else if (a3 > 285)
  {
    if (a3 == 286)
    {
      p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.css;
      return p_error->all;
    }
    if (a3 == 994)
    {
      p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.tip;
      return p_error->all;
    }
  }
  else
  {
    if (a3 == 62)
    {
      p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.html;
      return p_error->all;
    }
    if (a3 == 158)
    {
      p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.javascript;
      return p_error->all;
    }
  }
  return v3;
}

- (void)clearMessagesMatchingMask:(int)a3
{
  $1CF94A04F8ADBB3673F9BB79AC4F7AE2 *p_messages;
  uint64_t v6;
  int v7;
  BOOL v8;
  int v9;

  p_messages = &self->_messages;
  v6 = -[NSMutableArray count](self->_messages.all, "count");
  v7 = v6;
  if (a3 == 1022)
  {
    v8 = v6 != 0;
    -[NSMutableArray removeAllObjects](p_messages->all, "removeAllObjects");
    goto LABEL_19;
  }
  if ((int)v6 < 1)
  {
    v8 = 0;
    if ((a3 & 0x20) == 0)
      goto LABEL_10;
  }
  else
  {
    v9 = 0;
    v8 = 0;
    do
    {
      if ((objc_msgSend((id)-[NSMutableArray objectAtIndex:](p_messages->all, "objectAtIndex:", v9), "_web_messageType") & a3) != 0)
      {
        -[NSMutableArray removeObjectAtIndex:](p_messages->all, "removeObjectAtIndex:", v9);
        --v7;
        v8 = 1;
      }
      else
      {
        ++v9;
      }
    }
    while (v9 < v7);
    if ((a3 & 0x20) == 0)
    {
LABEL_10:
      if ((a3 & 0x80) != 0)
        goto LABEL_20;
LABEL_11:
      if ((a3 & 0x100) != 0)
        goto LABEL_21;
LABEL_12:
      if ((a3 & 0x10) != 0)
        goto LABEL_22;
LABEL_13:
      if ((a3 & 8) != 0)
        goto LABEL_23;
LABEL_14:
      if ((a3 & 2) != 0)
        goto LABEL_24;
LABEL_15:
      if ((a3 & 4) != 0)
        goto LABEL_25;
LABEL_16:
      if (!v8)
        return;
      goto LABEL_17;
    }
  }
LABEL_19:
  -[NSMutableArray removeAllObjects](p_messages->html, "removeAllObjects");
  if ((a3 & 0x80) == 0)
    goto LABEL_11;
LABEL_20:
  -[NSMutableArray removeAllObjects](p_messages->javascript, "removeAllObjects");
  if ((a3 & 0x100) == 0)
    goto LABEL_12;
LABEL_21:
  -[NSMutableArray removeAllObjects](p_messages->css, "removeAllObjects");
  if ((a3 & 0x10) == 0)
    goto LABEL_13;
LABEL_22:
  -[NSMutableArray removeAllObjects](p_messages->error, "removeAllObjects");
  if ((a3 & 8) == 0)
    goto LABEL_14;
LABEL_23:
  -[NSMutableArray removeAllObjects](p_messages->warning, "removeAllObjects");
  if ((a3 & 2) == 0)
    goto LABEL_15;
LABEL_24:
  -[NSMutableArray removeAllObjects](p_messages->tip, "removeAllObjects");
  if ((a3 & 4) == 0)
    goto LABEL_16;
LABEL_25:
  -[NSMutableArray removeAllObjects](p_messages->log, "removeAllObjects");
  if (v8)
LABEL_17:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("UIWebViewDidClearMessagesNotification"), self);
}

- (void)_clearAllConsoleMessages
{
  -[UIWebBrowserView clearMessagesMatchingMask:](self, "clearMessagesMatchingMask:", 1022);
}

- (BOOL)_dumpWebArchiveAtPath:(id)a3
{
  char v5;
  uint64_t v7;

  if ((WebThreadIsCurrent() & 1) == 0)
    WebThreadLock();
  if ((objc_msgSend(a3, "hasSuffix:", CFSTR(".webarchive")) & 1) == 0)
    a3 = (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR(".webarchive"));
  v7 = 0;
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "DOMDocument"), "webArchive"), "data"), "writeToFile:options:error:", a3, 0, &v7);
  if ((v5 & 1) == 0)
    NSLog(CFSTR("Could not archive: %@ to path: %@ (%@)"), self, a3, v7);
  return v5;
}

- (void)_clearSelectionAndUI
{
  -[UITextInteractionAssistant clearSelection](self->super._textSelectionAssistant, "clearSelection");
}

- (void)_setSelectedDOMRangeAndUpdateUI:(id)a3
{
  WebThreadLock();
  -[WebView setSelectedDOMRange:affinity:](self->super._webView, "setSelectedDOMRange:affinity:", a3, 1);
  -[UIWebDocumentView selectionChanged](self, "selectionChanged");
}

- (void)_startURLificationIfNeededCoalesce:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  WebFrame *v6;
  unint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (-[UIWebDocumentView _dataDetectionIsActivated](self, "_dataDetectionIsActivated"))
  {
    WebThreadLock();
    v5 = (void *)objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
    v6 = -[WebView mainFrame](self->super._webView, "mainFrame");
    v7 = -[UIWebDocumentView effectiveDataDetectorTypes](self, "effectiveDataDetectorTypes");
    if (v3)
      v8 = 2;
    else
      v8 = 0;
    objc_msgSend(v5, "startURLificationForFrame:detectedTypes:options:", v6, v7, v8);
  }
}

- (id)_absoluteUrlRelativeToDocumentURL:(id)a3
{
  void *v5;

  WebThreadLock();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "dataSource"), "request"), "URL"), "absoluteURL");
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("#")) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v5, "absoluteString"), "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    v5 = (void *)objc_msgSend(v5, "URLByDeletingLastPathComponent");
  }
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", a3, v5), "absoluteURL"), "standardizedURL");
}

- (void)webView:(id)a3 didFirstVisuallyNonEmptyLayoutInFrame:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView webView:didFirstVisuallyNonEmptyLayoutInFrame:](&v6, sel_webView_didFirstVisuallyNonEmptyLayoutInFrame_, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->super._delegate, "webViewMainFrameDidFirstVisuallyNonEmptyLayoutInFrame:", self);
  -[UIWebBrowserView _autoFillFrame:](self, "_autoFillFrame:", a4);
}

- (BOOL)alwaysDispatchesScrollEvents
{
  return (*((unsigned __int8 *)self + 1608) >> 6) & 1;
}

- (void)setAlwaysDispatchesScrollEvents:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 1608);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 64;
    else
      v4 = 0;
    *((_BYTE *)self + 1608) = v3 & 0xBF | v4;
    -[UIWebTiledView setAllowsPaintingAndScriptsWhilePanning:](self, "setAllowsPaintingAndScriptsWhilePanning:");
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)scalesForContainerSize:(CGSize)a3
{
  float v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[UIWebDocumentView minimumScaleForMinimumSize:](self, "minimumScaleForMinimumSize:", a3.width, a3.height);
  v5 = v4;
  -[UIWebDocumentView maximumScale](self, "maximumScale");
  v7 = v6;
  v8 = 0.0;
  v9 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v9;
  return result;
}

- (void)updateBoundariesOfScrollView:(id)a3 withScales:(id)a4
{
  double var0;
  double v6;

  var0 = a4.var0;
  -[UIWebDocumentView zoomedDocumentScale](self, "zoomedDocumentScale", a4.var0, a4.var1, a4.var2);
  objc_msgSend(a3, "setMinimumZoomScale:", var0 / v6);
}

- (double)minimumVerticalContentOffset
{
  return 0.0;
}

- (double)heightToKeepVisible
{
  return 0.0;
}

- (double)scaleForProposedNewScale:(double)a3 andOldScale:(double)a4
{
  if (!-[UIWebBrowserView _currentAssistedNode](self, "_currentAssistedNode") && !self->super._interaction.var0)
    return a3;
  return a4;
}

- (id)addFindOnPageHighlighter
{
  UIWebBrowserFindOnPageHighlighter *v3;
  NSHashTable *activeHighlighters;

  v3 = -[UIWebBrowserFindOnPageHighlighter initWithBrowserView:]([UIWebBrowserFindOnPageHighlighter alloc], "initWithBrowserView:", self);
  activeHighlighters = self->_activeHighlighters;
  if (!activeHighlighters)
  {
    activeHighlighters = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 514, 1);
    self->_activeHighlighters = activeHighlighters;
  }
  -[NSHashTable addObject:](activeHighlighters, "addObject:", v3);
  return v3;
}

- (void)_removeFindOnPageHighlighter:(id)a3
{
  -[NSHashTable removeObject:](self->_activeHighlighters, "removeObject:", a3);
}

- (void)redrawScaledDocument
{
  NSHashTable *activeHighlighters;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView redrawScaledDocument](&v12, sel_redrawScaledDocument);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  activeHighlighters = self->_activeHighlighters;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](activeHighlighters, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
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
          objc_enumerationMutation(activeHighlighters);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "updateHighlightBubbleWobble:", 0);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](activeHighlighters, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  NSMutableSet *overflowScrollViews;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView _didMoveFromWindow:toWindow:](&v16, sel__didMoveFromWindow_toWindow_);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  overflowScrollViews = self->_overflowScrollViews;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](overflowScrollViews, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(overflowScrollViews);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_didMoveFromWindow:toWindow:", a3, a4);
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](overflowScrollViews, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }
}

- (void)webView:(id)a3 didCreateOrUpdateScrollingLayer:(id)a4 withContentsLayer:(id)a5 scrollSize:(id)a6 forNode:(id)a7 allowHorizontalScrollbar:(BOOL)a8 allowVerticalScrollbar:(BOOL)a9
{
  _BOOL8 v9;
  UIWebOverflowScrollView *v15;
  UIWebOverflowContentView *v16;
  UIWebOverflowContentView *v17;
  UIPanGestureRecognizer *v18;
  double v19;
  double v20;
  double v21;

  v9 = a8;
  if (!objc_msgSend(a4, "delegate", a3))
  {
    v15 = -[UIWebOverflowScrollView initWithLayer:node:webBrowserView:]([UIWebOverflowScrollView alloc], "initWithLayer:node:webBrowserView:", a4, a7, self);
    -[UIWebBrowserView _noteOverflowScrollViewPendingInsertion:](self, "_noteOverflowScrollViewPendingInsertion:", v15);

    v17 = -[UIWebOverflowContentView initWithLayer:]([UIWebOverflowContentView alloc], "initWithLayer:", a5);
    -[UIWebOverflowScrollView setOverflowContentView:](v15, "setOverflowContentView:", v17);

    goto LABEL_5;
  }
  v15 = (UIWebOverflowScrollView *)objc_msgSend(a4, "delegate");
  v16 = -[UIWebOverflowScrollView overflowContentView](v15, "overflowContentView");
  if (-[UIView layer](v16, "layer") != a5)
  {
    -[UIWebOverflowContentView replaceLayer:](v16, "replaceLayer:", a5);
LABEL_5:
    -[UIWebDocumentView _setSubviewCachesNeedUpdate:](self, "_setSubviewCachesNeedUpdate:", 1);
  }
  -[UIScrollView setShowsHorizontalScrollIndicator:](v15, "setShowsHorizontalScrollIndicator:", v9);
  -[UIScrollView setShowsVerticalScrollIndicator:](v15, "setShowsVerticalScrollIndicator:", a9);
  objc_msgSend(a6, "sizeValue");
  -[UIScrollView setContentSize:](v15, "setContentSize:");
  v18 = -[UIScrollView panGestureRecognizer](v15, "panGestureRecognizer");
  +[UIPanGestureRecognizer _defaultHysteresis](UIPanGestureRecognizer, "_defaultHysteresis");
  v20 = v19;
  -[UIWebDocumentView _zoomedDocumentScale](self, "_zoomedDocumentScale");
  -[UIPanGestureRecognizer _setHysteresis:](v18, "_setHysteresis:", v20 / v21);
}

- (void)webView:(id)a3 willRemoveScrollingLayer:(id)a4 withContentsLayer:(id)a5 forNode:(id)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = (void *)objc_msgSend(a5, "delegate", a3);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "willBeRemoved");
    objc_msgSend(v9, "removeFromSuperview");
  }
  v10 = (void *)objc_msgSend(a4, "delegate");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "willBeRemoved");
    objc_msgSend(v11, "setBeingRemoved:", 1);
    objc_msgSend(v11, "_webCustomViewWillBeRemovedFromSuperview");
    -[UIWebBrowserView _noteOverflowScrollViewPendingDeletion:](self, "_noteOverflowScrollViewPendingDeletion:", v11);
    objc_msgSend(v11, "setBeingRemoved:", 0);
    -[UIWebBrowserView _removeAdditionalSubview:](self, "_removeAdditionalSubview:", v11);
    objc_msgSend(v11, "setNode:", 0);
  }
  -[UIWebDocumentView _setSubviewCachesNeedUpdate:](self, "_setSubviewCachesNeedUpdate:", 1);
}

- (void)_overflowScrollView:(id)a3 willStartScrollingForNode:(id)a4
{
  -[UITextInteractionAssistant willStartScrollingOrZooming](self->super._textSelectionAssistant, "willStartScrollingOrZooming", a3, a4);
  -[UIWebDocumentView cancelInteraction](self, "cancelInteraction");
  -[UIWebDocumentView _cancelLongPressGestureRecognizer](self, "_cancelLongPressGestureRecognizer");
}

- (void)_webThreadOverflowScrollOffsetChanged
{
  _BOOL4 pendingGeometryChangeAfterOverflowScroll;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  WebView *webView;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_pendingOverflowDataLock, "lock");
  pendingGeometryChangeAfterOverflowScroll = self->_pendingGeometryChangeAfterOverflowScroll;
  self->_pendingGeometryChangeAfterOverflowScroll = 0;
  v4 = (void *)-[NSMutableArray copy](self->_pendingOverflowScrolls, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingOverflowScrolls, "removeAllObjects");
  -[NSLock unlock](self->_pendingOverflowDataLock, "unlock");
  if (pendingGeometryChangeAfterOverflowScroll)
    -[WebView _viewGeometryDidChange](self->super._webView, "_viewGeometryDidChange");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        webView = self->super._webView;
        objc_msgSend(v9, "offset");
        -[WebView _overflowScrollPositionChangedTo:forNode:isUserScroll:](webView, "_overflowScrollPositionChangedTo:forNode:isUserScroll:", objc_msgSend(v9, "node"), objc_msgSend(v9, "isUserScroll"), v11, v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (BOOL)appendOverflowScrollForNode:(id)a3 offset:(CGPoint)a4 whileScrolling:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  NSMutableArray *pendingOverflowScrolls;
  UIWebOverflowScrollInfo *v12;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  pendingOverflowScrolls = self->_pendingOverflowScrolls;
  if (!pendingOverflowScrolls)
  {
    pendingOverflowScrolls = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_pendingOverflowScrolls = pendingOverflowScrolls;
  }
  if (-[NSMutableArray count](pendingOverflowScrolls, "count")
    && (objc_msgSend((id)-[NSMutableArray lastObject](self->_pendingOverflowScrolls, "lastObject"), "coalesceScrollForNode:offset:isUserScroll:", a3, v5, x, y) & 1) != 0)
  {
    return 0;
  }
  v12 = -[UIWebOverflowScrollInfo initWithNode:offset:isUserScroll:]([UIWebOverflowScrollInfo alloc], "initWithNode:offset:isUserScroll:", a3, v5, x, y);
  -[NSMutableArray addObject:](self->_pendingOverflowScrolls, "addObject:", v12);

  return 1;
}

- (void)_overflowScrollView:(id)a3 scrollOffsetChangedForNode:(id)a4 whileScrolling:(BOOL)a5
{
  _BOOL8 v5;
  NSLock *pendingOverflowDataLock;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;

  if (a4)
  {
    v5 = a5;
    pendingOverflowDataLock = self->_pendingOverflowDataLock;
    if (!pendingOverflowDataLock)
    {
      pendingOverflowDataLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      self->_pendingOverflowDataLock = pendingOverflowDataLock;
    }
    -[NSLock lock](pendingOverflowDataLock, "lock");
    v10 = !self->_pendingGeometryChangeAfterOverflowScroll;
    self->_pendingGeometryChangeAfterOverflowScroll = 1;
    if (!v5
      || objc_msgSend(a3, "isTracking")
      && -[UIWebBrowserView isDispatchingTouchEvents](self, "isDispatchingTouchEvents")
      || (v11 = v10, -[UIWebBrowserView alwaysDispatchesScrollEvents](self, "alwaysDispatchesScrollEvents")))
    {
      objc_msgSend(a3, "contentOffset");
      v12 = -[UIWebBrowserView appendOverflowScrollForNode:offset:whileScrolling:](self, "appendOverflowScrollForNode:offset:whileScrolling:", a4, v5);
      v11 = v10 || v12;
    }
    -[NSLock unlock](self->_pendingOverflowDataLock, "unlock");
    v13 = (void *)-[WebView _fixedPositionContent](self->super._webView, "_fixedPositionContent");
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "hasFixedOrStickyPositionLayers"))
    {
      v14 = objc_msgSend(a3, "layer");
      objc_msgSend(a3, "contentOffset");
      objc_msgSend(v13, "overflowScrollPositionForLayer:changedTo:", v14);
    }
    if (v11)
      WebThreadRun();
  }
}

uint64_t __82__UIWebBrowserView__overflowScrollView_scrollOffsetChangedForNode_whileScrolling___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_webThreadOverflowScrollOffsetChanged");
}

- (void)_overflowScrollView:(id)a3 didEndScrollingForNode:(id)a4
{
  -[UITextInteractionAssistant didEndScrollingOrZooming](self->super._textSelectionAssistant, "didEndScrollingOrZooming", a3, a4);
}

- (BOOL)_hasSubviewContainingWebContent:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a3, "isDescendantOfView:", self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a3, "isDescendantOfView:", self);
  else
    return 0;
}

- (void)_noteOverflowScrollViewPendingInsertion:(id)a3
{
  NSMutableSet *overflowScrollViewsPendingInsertion;

  overflowScrollViewsPendingInsertion = self->_overflowScrollViewsPendingInsertion;
  if (!overflowScrollViewsPendingInsertion)
  {
    overflowScrollViewsPendingInsertion = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    self->_overflowScrollViewsPendingInsertion = overflowScrollViewsPendingInsertion;
  }
  -[NSMutableSet addObject:](overflowScrollViewsPendingInsertion, "addObject:", a3);
}

- (void)_noteOverflowScrollViewPendingDeletion:(id)a3
{
  UIWebOverflowScrollViewInfo *v5;

  if (!self->_overflowScrollViewsPendingDeletion)
    self->_overflowScrollViewsPendingDeletion = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = -[UIWebOverflowScrollViewInfo initWithScrollView:]([UIWebOverflowScrollViewInfo alloc], "initWithScrollView:", a3);
  objc_msgSend((id)objc_msgSend(a3, "layer"), "removeFromSuperlayer");
  -[NSMutableSet addObject:](self->_overflowScrollViewsPendingDeletion, "addObject:", v5);

}

- (void)_addAdditionalSubview:(id)a3
{
  NSMutableSet *overflowScrollViews;

  overflowScrollViews = self->_overflowScrollViews;
  if (!overflowScrollViews)
  {
    overflowScrollViews = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    self->_overflowScrollViews = overflowScrollViews;
  }
  -[NSMutableSet addObject:](overflowScrollViews, "addObject:", a3);
}

- (void)_removeAdditionalSubview:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet removeObject:](self->_overflowScrollViewsPendingInsertion, "removeObject:", a3);
  -[NSMutableSet removeObject:](self->_overflowScrollViews, "removeObject:", a3);

}

- (void)webViewDidCommitCompositingLayerChanges:(id)a3
{
  NSMutableSet *overflowScrollViewsPendingInsertion;
  uint64_t v5;
  uint64_t v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableSet *overflowScrollViewsPendingDeletion;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView webViewDidCommitCompositingLayerChanges:](&v24, sel_webViewDidCommitCompositingLayerChanges_, a3);
  overflowScrollViewsPendingInsertion = self->_overflowScrollViewsPendingInsertion;
  if (*(_OWORD *)&self->_overflowScrollViewsPendingInsertion != 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](overflowScrollViewsPendingInsertion, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(overflowScrollViewsPendingInsertion);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_msgSend(v10, "fixUpViewAfterInsertion") & 1) != 0)
          {
            -[UIWebBrowserView _addAdditionalSubview:](self, "_addAdditionalSubview:", v10);
            -[UIWebDocumentView _setSubviewCachesNeedUpdate:](self, "_setSubviewCachesNeedUpdate:", 1);
          }
          else
          {
            if (!v7)
              v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
            -[NSMutableSet addObject:](v7, "addObject:", v10);
          }
        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](overflowScrollViewsPendingInsertion, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    self->_overflowScrollViewsPendingInsertion = v7;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    overflowScrollViewsPendingDeletion = self->_overflowScrollViewsPendingDeletion;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](overflowScrollViewsPendingDeletion, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(overflowScrollViewsPendingDeletion);
          -[UIView _webCustomViewWasRemovedFromSuperview:]((_QWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "scrollView"), (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "oldSuperview"));
        }
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](overflowScrollViewsPendingDeletion, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
      }
      while (v13);
    }

    self->_overflowScrollViewsPendingDeletion = 0;
  }
}

- (id)_collectAdditionalSubviews
{
  id v3;
  NSMutableSet *overflowScrollViewsPendingDeletion;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  overflowScrollViewsPendingDeletion = self->_overflowScrollViewsPendingDeletion;
  if (overflowScrollViewsPendingDeletion)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableSet count](overflowScrollViewsPendingDeletion, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_overflowScrollViewsPendingDeletion;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "scrollView"));
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }
  updateSubviewsOfScrollContentViews(self->super._contentLayersHostingLayer, self, v3, v5);
  return v3;
}

- (void)_setUnobscuredSafeAreaInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[WebView _setUnobscuredSafeAreaInsets:](self->super._webView, "_setUnobscuredSafeAreaInsets:", top, left, bottom, right);
}

- (BOOL)_shouldRestorationInputViewsOnlyWhenKeepingFirstResponder
{
  return 1;
}

- (UIWebFormAccessory)_accessory
{
  return self->_accessory;
}

- (void)set_accessory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1496);
}

- (UIFormPeripheral)_input
{
  return self->_input;
}

- (void)set_input:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1504);
}

- (DOMNode)_currentAssistedNode
{
  return self->_currentAssistedNode;
}

- (void)set_currentAssistedNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1512);
}

- (UIResponder)_editingDelegateForEverythingExceptForms
{
  return self->_editingDelegateForEverythingExceptForms;
}

- (void)set_editingDelegateForEverythingExceptForms:(id)a3
{
  self->_editingDelegateForEverythingExceptForms = (UIResponder *)a3;
}

- (BOOL)isAccessoryEnabled
{
  return *((_BYTE *)self + 1608) & 1;
}

- (void)setAccessoryEnabled:(BOOL)a3
{
  *((_BYTE *)self + 1608) = *((_BYTE *)self + 1608) & 0xFE | a3;
}

- (BOOL)inputViewObeysDOMFocus
{
  return (*((unsigned __int8 *)self + 1608) >> 3) & 1;
}

- (void)setInputViewObeysDOMFocus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 1608) = *((_BYTE *)self + 1608) & 0xF7 | v3;
}

- (BOOL)allowDOMFocusRedirects
{
  return (*((unsigned __int8 *)self + 1608) >> 4) & 1;
}

- (void)setAllowDOMFocusRedirects:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 1608) = *((_BYTE *)self + 1608) & 0xEF | v3;
}

- (BOOL)hasEditedTextField
{
  return (*((unsigned __int8 *)self + 1608) >> 5) & 1;
}

- (UIWebAutoFillDelegate)autoFillDelegate
{
  return self->_autoFillDelegate;
}

- (void)setAutoFillDelegate:(id)a3
{
  self->_autoFillDelegate = (UIWebAutoFillDelegate *)a3;
}

- (BOOL)isAnyTouchOverActiveArea:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[WebView _touchEventRegions](self->super._webView, "_touchEventRegions");
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(a3);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "locationInView:", 0);
          -[UIWebBrowserView _convertWindowPointToViewport:](self, "_convertWindowPointToViewport:");
          v11 = v10;
          v13 = v12;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v20;
            while (2)
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v20 != v16)
                  objc_enumerationMutation(v5);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "hitTest:", v11, v13) & 1) != 0)
                {
                  LOBYTE(v6) = 1;
                  return v6;
                }
                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              if (v15)
                continue;
              break;
            }
          }
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        LOBYTE(v6) = 0;
      }
      while (v7);
    }
  }
  return v6;
}

@end
