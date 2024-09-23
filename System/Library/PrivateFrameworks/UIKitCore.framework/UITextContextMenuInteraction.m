@implementation UITextContextMenuInteraction

- (UITextContextMenuInteraction)init
{
  UITextContextMenuInteraction *v2;
  UIContextMenuInteraction *v3;
  UIContextMenuInteraction *contextMenuInteraction;
  UIEditMenuInteraction *v5;
  UIEditMenuInteraction *editMenuInteraction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITextContextMenuInteraction;
  v2 = -[UITextInteraction init](&v8, sel_init);
  if (v2)
  {
    v3 = -[UIContextMenuInteraction initWithDelegate:]([UIContextMenuInteraction alloc], "initWithDelegate:", v2);
    contextMenuInteraction = v2->_contextMenuInteraction;
    v2->_contextMenuInteraction = v3;

    v5 = -[UIEditMenuInteraction initWithDelegate:]([UIEditMenuInteraction alloc], "initWithDelegate:", v2);
    editMenuInteraction = v2->_editMenuInteraction;
    v2->_editMenuInteraction = v5;

    -[UIEditMenuInteraction setPresentsContextMenuAsSecondaryAction:](v2->_editMenuInteraction, "setPresentsContextMenuAsSecondaryAction:", 0);
  }
  return v2;
}

- (void)dismissSelectionCommandsWithReason:(int64_t)a3
{
  UIEditMenuConfiguration *currentSelectionCommandsConfiguration;
  void *v6;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  UIEditMenuConfiguration *v13;
  void *v14;
  id v15;

  currentSelectionCommandsConfiguration = self->_currentSelectionCommandsConfiguration;
  -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_hasVisibleMenu"))
    v8 = a3 != 1 && !self->_isPresentingOrDismissingContextMenu;
  else
    v8 = 0;

  if (currentSelectionCommandsConfiguration)
    v9 = 0;
  else
    v9 = !v8;
  if (!v9)
  {
    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_selectedMenuLeaf");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
    else
    {
      -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_selectedMenuLeaf");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v15 = 0;
        if (!currentSelectionCommandsConfiguration)
          goto LABEL_20;
        goto LABEL_19;
      }
    }
    if ((objc_msgSend(v15, "attributes") & 8) != 0)
    {
LABEL_24:

      return;
    }
    if (!currentSelectionCommandsConfiguration)
    {
LABEL_20:
      if (v8)
      {
        -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dismissMenu");

      }
      if (self->_currentInputUIConfiguration)
        -[UITextContextMenuInteraction _presentEditMenuForInputUI](self, "_presentEditMenuForInputUI");
      goto LABEL_24;
    }
LABEL_19:
    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissMenu");

    v13 = self->_currentSelectionCommandsConfiguration;
    self->_currentSelectionCommandsConfiguration = 0;

    goto LABEL_20;
  }
}

- (void)didMoveToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UITextContextMenuInteraction;
  -[UITextInteraction didMoveToView:](&v14, sel_didMoveToView_, v4);
  -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addInteraction:", v5);

  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addInteraction:", v7);

    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_editMenuAssistant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMenuInteraction:", self);

    -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setProxySender:", v4);

    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setProxySender:", v4);

    v12 = -[UITextContextMenuInteraction _shouldBridgeMenuControllerItems](self, "_shouldBridgeMenuControllerItems");
    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "set_includeMenuControllerItems:", v12);

  }
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (BOOL)_shouldBridgeMenuControllerItems
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  -[UITextInteraction _textInput](self, "_textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[UITextInteraction _textInput](self, "_textInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
    v7 = objc_msgSend(v5, "_implementsEditMenu");
  else
    v7 = objc_opt_respondsToSelector();
  v8 = v7;

  return (v8 & 1) == 0;
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UITextContextMenuInteraction;
  -[UITextInteraction willMoveToView:](&v13, sel_willMoveToView_, a3);
  -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeInteraction:", v6);

  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeInteraction:", v10);

    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_editMenuAssistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMenuInteraction:", 0);

  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)dismissMenuForInputUI
{
  UIEditMenuConfiguration *currentInputUIConfiguration;
  void *v4;
  id v5;

  currentInputUIConfiguration = self->_currentInputUIConfiguration;
  if (currentInputUIConfiguration)
  {
    self->_currentInputUIConfiguration = 0;

    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissMenu");

    if (self->_currentSelectionCommandsConfiguration)
    {
      -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentEditMenuWithConfiguration:", self->_currentSelectionCommandsConfiguration);

    }
  }
}

- (void)setExternalContextMenuDelegate:(id)a3
{
  UITextContextMenuInteraction *v3;
  UIContextMenuInteractionDelegate **p_externalContextMenuDelegate;
  id v5;
  $B2270CF3445A216E2CEF06A69D277962 *p_externalDelegateImplements;

  v3 = self;
  p_externalContextMenuDelegate = &self->_externalContextMenuDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_externalContextMenuDelegate, v5);
  p_externalDelegateImplements = &v3->_externalDelegateImplements;
  v3->_externalDelegateImplements.highlightPreviewForItem = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.dismissalPreviewForItem = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.willPerformPreviewAction = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.willDisplay = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.willEndForConfiguration = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.previewForHighlighting_DEPR = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.previewForDismissing_DEPR = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.styleForMenu = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.accessoriesForMenu = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.shouldBeDelayedByGestureRecognizer = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.asyncConfigurationForMenuAtLocation = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.overrideSuggestedActions = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.shouldAttemptToPresent = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_externalDelegateImplements->interactionEffectForTargetedPreview = v3 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externallyManagedConfiguration, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_destroyWeak((id *)&self->_externalContextMenuDelegate);
  objc_storeStrong((id *)&self->_currentSelectionCommandsConfiguration, 0);
  objc_storeStrong((id *)&self->_currentInputUIConfiguration, 0);
}

- (CGPoint)locationInTextInputViewForLocationInView:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UITextInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", v6, x, y);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v13, v10, v12);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)prepareForContextMenuAtLocationInView:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "_shouldShowEditMenu") & 1) == 0)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_32;
  }
  -[UITextContextMenuInteraction locationInTextInputViewForLocationInView:](self, "locationInTextInputViewForLocationInView:", x, y);
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v10, "conformsToProtocolCached:", &unk_1EE0CE228);
  v16 = objc_msgSend(v10, "conformsToProtocolCached:", &unk_1EE0CE288);
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")&& v15 | v16)
  {
    if (v16)
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __81__UITextContextMenuInteraction_prepareForContextMenuAtLocationInView_completion___block_invoke;
      v37[3] = &unk_1E16E5510;
      v38 = v7;
      objc_msgSend(v10, "selectTextForEditMenuWithLocationInView:completionHandler:", v37, v12, v14);
      v17 = v38;
LABEL_10:

      goto LABEL_32;
    }
    if (v15)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __81__UITextContextMenuInteraction_prepareForContextMenuAtLocationInView_completion___block_invoke_2;
      v35[3] = &unk_1E16E5510;
      v36 = v7;
      objc_msgSend(v10, "selectTextForContextMenuWithLocationInView:completionHandler:", v35, v12, v14);
      v17 = v36;
      goto LABEL_10;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "prepareSelectionForContextMenuWithLocationInView:completionHandler:", v7, v12, v14);
    goto LABEL_32;
  }
  objc_msgSend(v8, "setFirstResponderIfNecessary");
  objc_msgSend(v8, "setSelectionHighlightMode:", 0);
  objc_msgSend(v8, "activeSelection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectedRange");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v18, "selectedRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEmpty");

    objc_msgSend(v10, "closestPositionToPoint:", v12, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectedRange");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "start");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v10, "comparePosition:toPosition:", v22, v24);
    if (v21)
    {
      v26 = v25 != 0;
    }
    else if (v25 == -1)
    {
      v26 = 1;
    }
    else
    {
      objc_msgSend(v18, "selectedRange");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "end");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v10, "comparePosition:toPosition:", v33, v22) == -1;

    }
    if (-[UITextContextMenuInteraction _textInputIsSecure](self, "_textInputIsSecure"))
    {
      if (!v26)
      {
        v27 = 0;
        goto LABEL_29;
      }
      goto LABEL_23;
    }
  }
  else
  {
    if (-[UITextContextMenuInteraction _textInputIsSecure](self, "_textInputIsSecure"))
    {
LABEL_23:
      -[UITextInteraction _beginSelectionChange](self, "_beginSelectionChange");
      goto LABEL_27;
    }
    LOBYTE(v26) = 1;
  }
  +[UIRevealInteraction revealItemForTextInput:locationInTextInputView:](UIRevealInteraction, "revealItemForTextInput:locationInTextInputView:", v10, v12, v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[UITextInteraction _beginSelectionChange](self, "_beginSelectionChange");
    if (v27)
    {
      v28 = objc_msgSend(v27, "highlightRange");
      objc_msgSend(v10, "_textRangeFromNSRange:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSelectedRange:", v30);

LABEL_28:
      objc_msgSend(v18, "commit");
      -[UITextInteraction _endSelectionChange](self, "_endSelectionChange");
      objc_msgSend(v8, "notifyKeyboardSelectionChanged");
      goto LABEL_29;
    }
LABEL_27:
    objc_msgSend(v18, "alterSelection:granularity:", 1, v12, v14);
    v27 = 0;
    goto LABEL_28;
  }
LABEL_29:
  objc_msgSend(v18, "selectedRange");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEmpty");

  if (v32)
  {

    v27 = 0;
  }
  (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 1, v27);

LABEL_32:
}

void __81__UITextContextMenuInteraction_prepareForContextMenuAtLocationInView_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6;

  createRVItem(a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __81__UITextContextMenuInteraction_prepareForContextMenuAtLocationInView_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6;

  createRVItem(a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_textInputIsSecure
{
  void *v3;
  void *v4;
  char v5;

  -[UITextInteraction _textInput](self, "_textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSecureTextEntry");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_logDeprecatedMenuControllerUsageIfNeeded
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  char v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  if (dyld_program_sdk_at_least())
  {
    +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "menuItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "count"))
    {

      goto LABEL_7;
    }
    v4 = -[UITextContextMenuInteraction _shouldBridgeMenuControllerItems](self, "_shouldBridgeMenuControllerItems");

    if (!v4)
      return;
    -[UITextInteraction _textInput](self, "_textInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[UITextInteraction _textInput](self, "_textInput");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_logWarningForMenuControllerUsage");
LABEL_7:

      return;
    }
    v7 = _logDeprecatedMenuControllerUsageIfNeeded___s_category;
    if (!_logDeprecatedMenuControllerUsageIfNeeded___s_category)
    {
      v7 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_logDeprecatedMenuControllerUsageIfNeeded___s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Using UIMenuController to add items into text menus is deprecated. Please implement the UITextInput API editMenuForTextRange:suggestedActions: instead.", buf, 2u);
    }
  }
}

- (void)_didPerformMenuLeaf:(id)a3 target:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if ((objc_msgSend(v10, "attributes") & 8) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "willFinishIgnoringCalloutBarFadeAfterPerformingAction");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    +[UIKBAnalyticsDispatcher keyboardAnalyticsDispatchWithSelector:withTrigger:](UIKBAnalyticsDispatcher, "keyboardAnalyticsDispatchWithSelector:withTrigger:", objc_msgSend(v10, "action"), CFSTR("EditMenu"));

}

- (id)_editMenuForSuggestedActions:(id)a3 rvItem:(id)a4 isEditMenu:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  _QWORD v64[4];

  v5 = a5;
  v64[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v51 = a4;
  v52 = v8;
  -[UITextInteraction _textInput](self, "_textInput");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedRange");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = -[UITextContextMenuInteraction _textInputIsSecure](self, "_textInputIsSecure");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v50, "editMenuForTextRange:suggestedActions:", v47, v52);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "children");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = v52;
LABEL_6:
  -[UITextContextMenuInteraction _logDeprecatedMenuControllerUsageIfNeeded](self, "_logDeprecatedMenuControllerUsageIfNeeded");
  -[UITextInteraction _updatedAccessibilityTextMenuWithMenuElements:](self, "_updatedAccessibilityTextMenuWithMenuElements:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v14;
  if (v14)
  {
    v15 = v14;

    v13 = v15;
  }
  if (v51)
    v16 = v48;
  else
    v16 = 1;
  if ((v16 & 1) == 0)
  {
    v58 = 0;
    v59 = &v58;
    v60 = 0x2050000000;
    v17 = (void *)_MergedGlobals_5_14;
    v61 = _MergedGlobals_5_14;
    if (!_MergedGlobals_5_14)
    {
      v53 = MEMORY[0x1E0C809B0];
      v54 = 3221225472;
      v55 = (uint64_t)__getDDRevealBridgeClass_block_invoke;
      v56 = &unk_1E16B14C0;
      v57 = &v58;
      __getDDRevealBridgeClass_block_invoke((uint64_t)&v53);
      v17 = (void *)v59[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v58, 8);
    -[UITextInteraction view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    v54 = (uint64_t)&v53;
    v55 = 0x2020000000;
    v19 = (id *)qword_1ECD7ABD0;
    v56 = (void *)qword_1ECD7ABD0;
    if (!qword_1ECD7ABD0)
    {
      v20 = DataDetectorsUILibrary_0();
      v19 = (id *)dlsym(v20, "kDataDetectorsSourceRectKey");
      *(_QWORD *)(v54 + 24) = v19;
      qword_1ECD7ABD0 = (uint64_t)v19;
    }
    _Block_object_dispose(&v53, 8);
    if (v19)
    {
      v45 = *v19;
      v62 = v45;
      v21 = (void *)MEMORY[0x1E0CB3B18];
      -[UITextInteraction assistantDelegate](self, "assistantDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_editMenuAssistant");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_editMenuTargetRect");
      objc_msgSend(v21, "valueWithCGRect:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v24;
      v53 = 0;
      v54 = (uint64_t)&v53;
      v55 = 0x2020000000;
      v25 = (id *)qword_1ECD7ABD8;
      v56 = (void *)qword_1ECD7ABD8;
      if (!qword_1ECD7ABD8)
      {
        v26 = DataDetectorsUILibrary_0();
        v25 = (id *)dlsym(v26, "kDDContextNoRoomForSubtitlesKey");
        *(_QWORD *)(v54 + 24) = v25;
        qword_1ECD7ABD8 = (uint64_t)v25;
      }
      _Block_object_dispose(&v53, 8);
      if (v25)
      {
        v63 = *v25;
        v27 = (void *)MEMORY[0x1E0CB37E8];
        v28 = v63;
        objc_msgSend(v27, "numberWithBool:", v5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v64[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v62, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "updatedTextInteractionMenuElements:withRVItem:view:context:", v13, v51, v46, v31);
        v32 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v32;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDDContextNoRoomForSubtitlesKey(void)");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("UITextContextMenuInteraction.m"), 56, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsSourceRectKey(void)");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("UITextContextMenuInteraction.m"), 55, CFSTR("%s"), dlerror());

    }
    __break(1u);
  }
LABEL_21:
  +[UIKBAutoFillMenus updatedSystemAutoFillMenuWithMenuElements:isSecureTextField:](UIKBAutoFillMenus, "updatedSystemAutoFillMenuWithMenuElements:isSecureTextField:", v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    v35 = v33;

    v13 = v35;
  }
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "updatedTextReplacementsMenuWithMenuElements:", v13);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = v37;

    v13 = v38;
  }
  if (v12)
  {
    objc_msgSend(v12, "menuByReplacingChildren:", v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v39;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextContextMenuInteraction.m"), 429, CFSTR("This method should never be called. We use the async menuForConfiguration:suggestedActions: method instead."));

  return 0;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v6;
  UIEditMenuConfiguration *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect v48;
  CGRect result;

  v6 = a3;
  v7 = (UIEditMenuConfiguration *)a4;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_editMenuAssistant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_currentInputUIConfiguration == v7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "overrideEditMenuTargetRectForConfiguration:", v7);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[UITextInteraction _textInput](self, "_textInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textInputView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "convertRect:toView:", v25, v16, v18, v20, v22);
    v10 = v26;
    v11 = v27;
    v12 = v28;
    v13 = v29;

  }
  else
  {
    v10 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v48.origin.x = v10;
  v48.origin.y = v11;
  v48.size.width = v12;
  v48.size.height = v13;
  if (CGRectIsNull(v48))
  {
    objc_msgSend(v9, "_selectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_editMenuTargetRect");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    objc_msgSend(v6, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertRect:toView:", v39, v32, v34, v36, v38);
    v10 = v40;
    v11 = v41;
    v12 = v42;
    v13 = v43;

  }
  v44 = v10;
  v45 = v11;
  v46 = v12;
  v47 = v13;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a5;
  -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_hasVisibleMenu");

  if (v7)
  {
    -[UITextContextMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissMenu");

  }
  -[UITextInteraction _textInput](self, "_textInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "systemWillPresentEditMenuWithAnimator:", v13);
  }
  else
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[UITextInteraction _textInput](self, "_textInput");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "willPresentEditMenuWithAnimator:", v13);

    }
  }

}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a5;
  -[UITextInteraction _textInput](self, "_textInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "systemWillDismissEditMenuWithAnimator:", v10);
  }
  else
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[UITextInteraction _textInput](self, "_textInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "willDismissEditMenuWithAnimator:", v10);

    }
  }

}

- (id)_editMenuInteraction:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  objc_msgSend(a5, "identifier", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardMenuTipIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editMenuTipView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)_editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v9 = a6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __109__UITextContextMenuInteraction__editMenuInteraction_menuForConfiguration_suggestedActions_completionHandler___block_invoke;
  v11[3] = &unk_1E16E5538;
  v11[4] = self;
  v12 = v9;
  v10 = v9;
  -[UITextContextMenuInteraction _querySelectionCommandsForConfiguration:suggestedActions:completionHandler:](self, "_querySelectionCommandsForConfiguration:suggestedActions:completionHandler:", a4, a5, v11);

}

void __109__UITextContextMenuInteraction__editMenuInteraction_menuForConfiguration_suggestedActions_completionHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_currentInputUIMenuElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = a3 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v10 = v11;
  }
  else
  {
    objc_msgSend(v11, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "menuByReplacingChildren:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v9;
  }
  v12 = v10;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_editMenuInteraction:(id)a3 didPerformMenuLeaf:(id)a4 target:(id)a5
{
  -[UITextContextMenuInteraction _didPerformMenuLeaf:target:](self, "_didPerformMenuLeaf:target:", a4, a5);
}

- (void)_querySelectionCommandsForConfiguration:(id)a3 suggestedActions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  char v30;
  _QWORD v31[5];
  id v32;
  id v33;
  char v34;
  _QWORD v35[5];
  id v36;
  id v37;
  char v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("UITextContextMenuInteraction.TextSelectionMenu"));

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_editMenuAssistant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "overrideMenu");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v12 & 1) == 0)
  {
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", MEMORY[0x1E0C9AA60]);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(v15, "children");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = v15;
    v19 = 0;
    if (!v18)
      goto LABEL_22;
    goto LABEL_21;
  }
  -[UITextInteraction _textInput](self, "_textInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "conformsToProtocolCached:", &unk_1EE0CE228);
  v22 = objc_msgSend(v20, "conformsToProtocolCached:", &unk_1EE0CE288);
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")&& v21 | v22)
  {
    if (v22)
    {
      v23 = (void *)objc_opt_new();
      objc_msgSend(v23, "setFlags:", 1);
      objc_msgSend(v23, "setSurroundingGranularity:", 3);
      objc_msgSend(v23, "setGranularityCount:", 1);
      v40 = 0;
      v41 = &v40;
      v42 = 0x2050000000;
      v24 = (void *)qword_1ECD7ABE0;
      v43 = qword_1ECD7ABE0;
      if (!qword_1ECD7ABE0)
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __getBETextDocumentRequestClass_block_invoke_0;
        v39[3] = &unk_1E16B14C0;
        v39[4] = &v40;
        __getBETextDocumentRequestClass_block_invoke_0((uint64_t)v39);
        v24 = (void *)v41[3];
      }
      v25 = objc_retainAutorelease(v24);
      _Block_object_dispose(&v40, 8);
      v26 = (void *)objc_msgSend([v25 alloc], "_initWithUIKitDocumentRequest:", v23);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke;
      v35[3] = &unk_1E16E5560;
      v35[4] = self;
      v36 = v9;
      v37 = v10;
      v38 = 1;
      objc_msgSend(v20, "requestDocumentContext:completionHandler:", v26, v35);

      goto LABEL_16;
    }
    if (v21)
    {
      v23 = (void *)objc_opt_new();
      objc_msgSend(v23, "setFlags:", 1);
      objc_msgSend(v23, "setSurroundingGranularity:", 3);
      objc_msgSend(v23, "setGranularityCount:", 1);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke_2;
      v31[3] = &unk_1E16E5588;
      v31[4] = self;
      v32 = v9;
      v33 = v10;
      v34 = 1;
      objc_msgSend(v20, "requestDocumentContext:completionHandler:", v23, v31);

LABEL_16:
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[UITextContextMenuInteraction _editMenuForCurrentSelectionWithSuggestedActions:isEditMenu:](self, "_editMenuForCurrentSelectionWithSuggestedActions:isEditMenu:", v9, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke_3;
    v27[3] = &unk_1E16E55B0;
    v27[4] = self;
    v28 = v9;
    v29 = v10;
    v30 = 1;
    objc_msgSend(v20, "requestRVItemInSelectedRangeWithCompletionHandler:", v27);

  }
  v18 = 0;
LABEL_19:

LABEL_20:
  v19 = 1;
  if (v18)
LABEL_21:
    (*((void (**)(id, id, uint64_t))v10 + 2))(v10, v18, v19);
LABEL_22:

}

void __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "_uikitDocumentContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "selectedTextRange");
  createRVItem(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_editMenuForSuggestedActions:rvItem:isEditMenu:", *(_QWORD *)(a1 + 40), v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "fullText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "selectedTextRange");
  v7 = v6;

  createRVItem(v4, v5, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_editMenuForSuggestedActions:rvItem:isEditMenu:", *(_QWORD *)(a1 + 40), v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_editMenuForSuggestedActions:rvItem:isEditMenu:", *(_QWORD *)(a1 + 40), a2, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)_editMenuForCurrentSelectionWithSuggestedActions:(id)a3 isEditMenu:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  unsigned int v36;

  v4 = a4;
  v6 = a3;
  if (!-[UITextContextMenuInteraction _textInputIsSecure](self, "_textInputIsSecure"))
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeSelection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "selectedText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");
      v13 = 0;
      if (v11)
      {
LABEL_5:
        v7 = (void *)objc_msgSend(objc_alloc((Class)getRVItemClass()), "initWithText:selectedRange:", v11, v13, v12);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v8, "selectedTextRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:offset:", v15, -500);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v8, "beginningOfDocument");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;

      objc_msgSend(v14, "end");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:offset:", v20, 500);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v36 = v4;
      v34 = v14;
      v35 = v10;
      v33 = v6;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        objc_msgSend(v8, "endOfDocument");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v24 = v23;

      objc_msgSend(v8, "textRangeFromPosition:toPosition:", v19, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textInRange:", v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v8, "_selectedNSRange");
      v28 = v27;
      objc_msgSend(v8, "beginningOfDocument");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v8, "offsetFromPosition:toPosition:", v29, v19);

      v13 = v26 - v30;
      v12 = v28;

      v4 = v36;
      v10 = v35;
      v6 = v33;
      if (v11)
        goto LABEL_5;
    }
    v7 = 0;
    goto LABEL_14;
  }
  v7 = 0;
LABEL_15:
  -[UITextContextMenuInteraction _editMenuForSuggestedActions:rvItem:isEditMenu:](self, "_editMenuForSuggestedActions:rvItem:isEditMenu:", v6, v7, v4, v33);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_currentInputUIMenuElements
{
  UIEditMenuConfiguration *currentSelectionCommandsConfiguration;
  void *v3;
  void *v4;
  void *v5;

  currentSelectionCommandsConfiguration = self->_currentSelectionCommandsConfiguration;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (currentSelectionCommandsConfiguration)
    objc_msgSend(v3, "stopDictationMenuElementsShowingTitle:", 1);
  else
    objc_msgSend(v3, "keyboardMenuElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_editMenuInteraction:(id)a3 preferredLayoutRectsForConfiguration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_editMenuAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v7, "_preferredLayoutRectsForEditMenu", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v13), "CGRectValue");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v7, "_selectionView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "convertRect:toView:", v23, v15, v17, v19, v21);
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;

        v40.origin.x = v25;
        v40.origin.y = v27;
        v40.size.width = v29;
        v40.size.height = v31;
        if (!CGRectIsNull(v40))
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v25, v27, v29, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v32);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)presentSelectionCommandsWithConfiguration:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_currentSelectionCommandsConfiguration, a3);
  v5 = a3;
  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentEditMenuWithConfiguration:", v5);

}

- (void)updateVisibleMenuPosition
{
  id v2;

  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateVisibleMenuPositionAnimated:", 1);

}

- (BOOL)dismissedRecently
{
  void *v2;
  char v3;

  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_dismissedRecently");

  return v3;
}

- (BOOL)isDisplayingMenu
{
  void *v2;
  char v3;

  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisplayingMenu");

  return v3;
}

- (BOOL)dismissedByActionSelection
{
  void *v2;
  char v3;

  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_dismissedByActionSelection");

  return v3;
}

- (void)presentMenuForInputUI:(id)a3 preferredArrowDirection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEditMenuConfiguration *v12;
  void *v13;
  UIEditMenuConfiguration *currentInputUIConfiguration;
  id v15;

  if (!self->_currentInputUIConfiguration)
  {
    v6 = a3;
    if (-[UITextContextMenuInteraction isDisplayingMenu](self, "isDisplayingMenu"))
      -[UITextContextMenuInteraction dismissSelectionCommandsWithReason:](self, "dismissSelectionCommandsWithReason:", 0);
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_editMenuAssistant");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "_editMenuTargetRect");
    +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v6, v9 + v8 * 0.5, v11 + v10 * 0.5);
    v12 = (UIEditMenuConfiguration *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "_editMenuSourceWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditMenuConfiguration set_overrideSourceWindow:](v12, "set_overrideSourceWindow:", v13);

    -[UIEditMenuConfiguration set_ignoresPassthroughInView:](v12, "set_ignoresPassthroughInView:", 1);
    -[UIEditMenuConfiguration set_prefersMenuPresentationInView:](v12, "set_prefersMenuPresentationInView:", objc_msgSend(v15, "_editMenuPrefersPresentationInView"));
    -[UIEditMenuConfiguration setPreferredArrowDirection:](v12, "setPreferredArrowDirection:", a4);
    currentInputUIConfiguration = self->_currentInputUIConfiguration;
    self->_currentInputUIConfiguration = v12;

    -[UITextContextMenuInteraction _presentEditMenuForInputUI](self, "_presentEditMenuForInputUI");
  }
}

- (BOOL)isDisplayingMenuForInputUI
{
  return self->_currentInputUIConfiguration
      && -[UITextContextMenuInteraction isDisplayingMenu](self, "isDisplayingMenu");
}

- (BOOL)isDisplayingMenuForSelectionCommands
{
  return self->_currentSelectionCommandsConfiguration
      && -[UITextContextMenuInteraction isDisplayingMenu](self, "isDisplayingMenu");
}

- (void)_presentEditMenuForInputUI
{
  id v3;

  if (self->_currentInputUIConfiguration)
  {
    -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentEditMenuWithConfiguration:", self->_currentInputUIConfiguration);

  }
}

- (BOOL)_isExternalConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;

  v4 = a3;
  -[UITextContextMenuInteraction externallyManagedConfiguration](self, "externallyManagedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v7 == v6)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
      v9 = objc_msgSend(v6, "isEqual:", v7);
  }

  return v9;
}

- (id)_targetedPreviewForCurrentSelection
{
  void *v3;
  void *v4;
  void *v5;
  UITargetedPreview *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView *v17;
  UIView *v18;
  UIPreviewTarget *v19;
  UITargetedPreview *v20;
  void *v21;

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_editMenuAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_selectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "window");
  v6 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_editMenuAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_editMenuTargetRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = [UIView alloc];
    v18 = -[UIView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v14, v16);
    v19 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", v5, v10 + v14 * 0.5, v12 + v16 * 0.5);
    v20 = [UITargetedPreview alloc];
    v21 = (void *)objc_opt_new();
    v6 = -[UITargetedPreview initWithView:parameters:target:](v20, "initWithView:parameters:target:", v18, v21, v19);

  }
  return v6;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextContextMenuInteraction.m"), 800, CFSTR("This method should never be called. We use the async configurationForMenuAtLocation: method instead."));

  return 0;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[UITextContextMenuInteraction _isExternalConfiguration:](self, "_isExternalConfiguration:", v9))
    goto LABEL_7;
  if (self->_externalDelegateImplements.highlightPreviewForItem)
  {
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:", v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_externalDelegateImplements.previewForHighlighting_DEPR)
    {
LABEL_7:
      -[UITextContextMenuInteraction _targetedPreviewForCurrentSelection](self, "_targetedPreviewForCurrentSelection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextMenuInteraction:previewForHighlightingMenuWithConfiguration:", v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  if (!v13)
    goto LABEL_7;
LABEL_8:

  return v13;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[UITextContextMenuInteraction _isExternalConfiguration:](self, "_isExternalConfiguration:", v9))
    goto LABEL_7;
  if (self->_externalDelegateImplements.dismissalPreviewForItem)
  {
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextMenuInteraction:configuration:dismissalPreviewForItemWithIdentifier:", v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_externalDelegateImplements.previewForDismissing_DEPR)
    {
LABEL_7:
      -[UITextContextMenuInteraction _targetedPreviewForCurrentSelection](self, "_targetedPreviewForCurrentSelection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextMenuInteraction:previewForDismissingMenuWithConfiguration:", v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  if (!v13)
    goto LABEL_7;
LABEL_8:

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (self->_externalDelegateImplements.willPerformPreviewAction
    && -[UITextContextMenuInteraction _isExternalConfiguration:](self, "_isExternalConfiguration:", v8))
  {
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contextMenuInteraction:willPerformPreviewActionForMenuWithConfiguration:animator:", v11, v8, v9);

  }
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_externalDelegateImplements.willDisplay
    && -[UITextContextMenuInteraction _isExternalConfiguration:](self, "_isExternalConfiguration:", v9))
  {
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextMenuInteraction:willDisplayMenuForConfiguration:animator:", v8, v9, v10);

  }
  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDisplayingMenu");

  v14 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    if (v10)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __96__UITextContextMenuInteraction_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
      v17[3] = &unk_1E16B1B28;
      v17[4] = self;
      objc_msgSend(v10, "addAnimations:", v17);
    }
    else
    {
      -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dismissMenu");

    }
  }
  self->_isPresentingOrDismissingContextMenu = 1;
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __96__UITextContextMenuInteraction_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_2;
  v16[3] = &unk_1E16B1B28;
  v16[4] = self;
  objc_msgSend(v10, "addCompletion:", v16);

}

void __96__UITextContextMenuInteraction_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "editMenuInteraction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissMenu");

}

uint64_t __96__UITextContextMenuInteraction_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 144) = 0;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  UIContextMenuConfiguration *externallyManagedConfiguration;
  _QWORD v14[5];
  _QWORD v15[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  if (self->_externalDelegateImplements.willEndForConfiguration
    && -[UITextContextMenuInteraction _isExternalConfiguration:](self, "_isExternalConfiguration:", v9))
  {
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contextMenuInteraction:willEndForConfiguration:animator:", v8, v9, v10);

    if (v10)
    {
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __88__UITextContextMenuInteraction_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
      v15[3] = &unk_1E16B1B28;
      v15[4] = self;
      objc_msgSend(v10, "addAnimations:", v15);
    }
    else
    {
      externallyManagedConfiguration = self->_externallyManagedConfiguration;
      self->_externallyManagedConfiguration = 0;

    }
  }
  self->_isPresentingOrDismissingContextMenu = 1;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __88__UITextContextMenuInteraction_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2;
  v14[3] = &unk_1E16B1B28;
  v14[4] = self;
  objc_msgSend(v10, "addCompletion:", v14);

}

void __88__UITextContextMenuInteraction_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 176);
  *(_QWORD *)(v1 + 176) = 0;

}

uint64_t __88__UITextContextMenuInteraction_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 144) = 0;
  return result;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (self->_externalDelegateImplements.styleForMenu
    && -[UITextContextMenuInteraction _isExternalConfiguration:](self, "_isExternalConfiguration:", v7))
  {
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_contextMenuInteraction:styleForMenuWithConfiguration:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_UIContextMenuStyle defaultStyle](_UIContextMenuStyle, "defaultStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set_parentTraitEnvironmentForUserInterfaceStyle:", v8);
  }

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (self->_externalDelegateImplements.accessoriesForMenu
    && -[UITextContextMenuInteraction _isExternalConfiguration:](self, "_isExternalConfiguration:", v7))
  {
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_contextMenuInteraction:accessoriesForMenuWithConfiguration:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_contextMenuInteraction:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  if (!self->_externalDelegateImplements.shouldBeDelayedByGestureRecognizer)
    return 0;
  v6 = a4;
  v7 = a3;
  -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_contextMenuInteraction:shouldBeDelayedByGestureRecognizer:", v7, v6);

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (self->_externalDelegateImplements.overrideSuggestedActions
    && -[UITextContextMenuInteraction _isExternalConfiguration:](self, "_isExternalConfiguration:", v7))
  {
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_contextMenuInteraction:overrideSuggestedActionsForConfiguration:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (void)_contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _BOOL4 asyncConfigurationForMenuAtLocation;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  id v23;
  double v24;
  double v25;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke;
  aBlock[3] = &unk_1E16E55D8;
  aBlock[4] = self;
  v12 = v10;
  v23 = v12;
  v13 = v9;
  v22 = v13;
  v24 = x;
  v25 = y;
  v14 = _Block_copy(aBlock);
  asyncConfigurationForMenuAtLocation = self->_externalDelegateImplements.asyncConfigurationForMenuAtLocation;
  -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (asyncConfigurationForMenuAtLocation)
  {
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_3;
    v19[3] = &unk_1E16E5600;
    v19[4] = self;
    v20 = v14;
    objc_msgSend(v17, "_contextMenuInteraction:configurationForMenuAtLocation:completion:", v13, v19, x, y);

  }
  else
  {

    if (v17)
    {
      -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contextMenuInteraction:configurationForMenuAtLocation:", v13, x, y);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_externallyManagedConfiguration, v17);
    }
    (*((void (**)(void *, void *))v14 + 2))(v14, v17);

  }
}

void __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[5];
  id v5;
  id v6;
  __int128 v7;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2;
    v4[3] = &unk_1E16E55D8;
    v4[4] = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    v7 = *(_OWORD *)(a1 + 56);
    objc_msgSend(a2, "_prepareWithCompletion:", v4);

  }
  else
  {
    -[UITextContextMenuInteraction _defaultContextMenuInteraction:configurationForMenuAtLocation:completion:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
}

void __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), a2);
  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    -[UITextContextMenuInteraction _defaultContextMenuInteraction:configurationForMenuAtLocation:completion:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)_defaultContextMenuInteraction:(void *)a3 configurationForMenuAtLocation:(double)a4 completion:(double)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  double v36;

  v9 = a3;
  v10 = v9;
  if (a1)
  {
    v11 = MEMORY[0x1E0C809B0];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __105__UITextContextMenuInteraction__defaultContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke;
    v26 = &unk_1E16E5628;
    v27 = v9;
    v12 = a2;
    v13 = &v23;
    if (objc_msgSend(v12, "menuAppearance", v23, v24) == 2)
    {
      if (objc_msgSend(v12, "_inputPrecision") == 2)
      {
        v28 = v11;
        v29 = 3221225472;
        v30 = __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke;
        v31 = &unk_1E16E5678;
        v32 = a1;
        v33 = v12;
        v35 = a4;
        v36 = a5;
        v34 = v13;
        objc_msgSend(a1, "prepareForContextMenuAtLocationInView:completion:", &v28, a4, a5);

      }
      else
      {
        objc_msgSend(a1, "assistantDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_editMenuAssistant");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_editMenuTargetRect");
        v18 = v17 + v16 * 0.5;
        v21 = v20 + v19 * 0.5;

        v28 = v11;
        v29 = 3221225472;
        v30 = __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_3;
        v31 = &unk_1E16E56A0;
        v32 = a1;
        v33 = v12;
        v34 = *(id *)&v18;
        v35 = v21;
        +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, &v28);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(uint64_t *, void *))v25)(v13, v22);

      }
    }
    else
    {
      ((void (*)(uint64_t *, _QWORD))v25)(v13, 0);
    }

  }
}

void __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)_contextMenuInteraction:(id)a3 shouldAttemptToPresentConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  if (!self->_externalDelegateImplements.shouldAttemptToPresent)
    return 1;
  v6 = a4;
  v7 = a3;
  -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_contextMenuInteraction:shouldAttemptToPresentConfiguration:", v7, v6);

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  if (self->_externalDelegateImplements.interactionEffectForTargetedPreview)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[UITextContextMenuInteraction externalContextMenuDelegate](self, "externalContextMenuDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_contextMenuInteraction:configuration:interactionEffectForTargetedPreview:", v10, v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)_contextMenuInteraction:(id)a3 didPerformMenuLeaf:(id)a4 target:(id)a5
{
  -[UITextContextMenuInteraction _didPerformMenuLeaf:target:](self, "_didPerformMenuLeaf:target:", a4, a5);
}

uint64_t __105__UITextContextMenuInteraction__defaultContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "grabberSuppressionAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "activeSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEmpty");

    if ((v10 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v6, "obtainSelectionGrabberSuppressionAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGrabberSuppressionAssertion:", v7);
  }

LABEL_5:
  if (a2)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2;
    v13[3] = &unk_1E16E5650;
    v11 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v11;
    v16 = *(_OWORD *)(a1 + 56);
    v15 = v5;
    +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_suggestedActionsForContextMenuInteraction:location:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_editMenuForSuggestedActions:rvItem:isEditMenu:", v2, *(_QWORD *)(a1 + 48), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_suggestedActionsForContextMenuInteraction:location:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_editMenuForCurrentSelectionWithSuggestedActions:isEditMenu:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_suggestedActionsForContextMenuInteraction:(id)a3 location:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextContextMenuInteraction editMenuInteraction](self, "editMenuInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIEditMenuProvider menuElementsFromResponderChain:atLocation:inCoordinateSpace:includeMenuControllerItems:](_UIEditMenuProvider, "menuElementsFromResponderChain:atLocation:inCoordinateSpace:includeMenuControllerItems:", v8, v9, objc_msgSend(v10, "_includeMenuControllerItems"), x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIContextMenuInteractionDelegate)externalContextMenuDelegate
{
  return (UIContextMenuInteractionDelegate *)objc_loadWeakRetained((id *)&self->_externalContextMenuDelegate);
}

- (UIContextMenuConfiguration)externallyManagedConfiguration
{
  return self->_externallyManagedConfiguration;
}

@end
