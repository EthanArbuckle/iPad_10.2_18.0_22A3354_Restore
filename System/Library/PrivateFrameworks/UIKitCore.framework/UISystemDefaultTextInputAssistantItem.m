@implementation UISystemDefaultTextInputAssistantItem

- (UISystemDefaultTextInputAssistantItem)init
{
  UISystemDefaultTextInputAssistantItem *v2;
  uint64_t v3;
  NSArray *defaultSystemLeadingBarButtonGroups;
  uint64_t v5;
  NSArray *defaultSystemTrailingBarButtonGroups;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISystemDefaultTextInputAssistantItem;
  v2 = -[UITextInputAssistantItem init](&v8, sel_init);
  if (v2)
  {
    if (+[UISystemInputAssistantViewController shouldShowSystemInputAssistantItems](UISystemInputAssistantViewController, "shouldShowSystemInputAssistantItems"))
    {
      +[UIAssistantBarButtonItemProvider defaultSystemLeadingBarButtonGroupsForItem:](UIAssistantBarButtonItemProvider, "defaultSystemLeadingBarButtonGroupsForItem:", v2);
      v3 = objc_claimAutoreleasedReturnValue();
      defaultSystemLeadingBarButtonGroups = v2->_defaultSystemLeadingBarButtonGroups;
      v2->_defaultSystemLeadingBarButtonGroups = (NSArray *)v3;

      +[UIAssistantBarButtonItemProvider defaultSystemTrailingBarButtonGroupsForItem:](UIAssistantBarButtonItemProvider, "defaultSystemTrailingBarButtonGroupsForItem:", v2);
      v5 = objc_claimAutoreleasedReturnValue();
      defaultSystemTrailingBarButtonGroups = v2->_defaultSystemTrailingBarButtonGroups;
      v2->_defaultSystemTrailingBarButtonGroups = (NSArray *)v5;

    }
    -[UISystemDefaultTextInputAssistantItem _updateIsSystemItem](v2, "_updateIsSystemItem");
  }
  return v2;
}

- (void)_updateIsSystemItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UISystemDefaultTextInputAssistantItem defaultSystemLeadingBarButtonGroups](self, "defaultSystemLeadingBarButtonGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInputAssistantItem leadingBarButtonGroups](self, "leadingBarButtonGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_areBarButtonGroupsBasicallyEqualToSystemDefaults(v6, v3) & 1) != 0)
  {
    -[UISystemDefaultTextInputAssistantItem defaultSystemTrailingBarButtonGroups](self, "defaultSystemTrailingBarButtonGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputAssistantItem trailingBarButtonGroups](self, "trailingBarButtonGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_systemItem = _areBarButtonGroupsBasicallyEqualToSystemDefaults(v4, v5);

  }
  else
  {
    self->_systemItem = 0;
  }

}

- (void)setLeadingBarButtonGroups:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISystemDefaultTextInputAssistantItem;
  -[UITextInputAssistantItem setLeadingBarButtonGroups:](&v4, sel_setLeadingBarButtonGroups_, a3);
  -[UISystemDefaultTextInputAssistantItem _updateIsSystemItem](self, "_updateIsSystemItem");
}

- (void)setTrailingBarButtonGroups:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISystemDefaultTextInputAssistantItem;
  -[UITextInputAssistantItem setTrailingBarButtonGroups:](&v4, sel_setTrailingBarButtonGroups_, a3);
  -[UISystemDefaultTextInputAssistantItem _updateIsSystemItem](self, "_updateIsSystemItem");
}

- (void)assistantCut
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 0);
}

- (void)assistantCopy
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 1);
}

- (void)assistantUndo
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 3);
}

- (void)assistantRedo
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 4);
}

- (void)assistantPaste:(id)a3 forEvent:(id)a4
{
  void *v5;

  objc_msgSend(a4, "_authenticationMessage", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v5);

  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 2);
}

- (void)assistantBold
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 5);
}

- (void)assistantItalic
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 6);
}

- (void)assistantUnderline
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 7);
}

- (void)assistantTextFormatting
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 9);
}

- (void)assistantEmoji
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 11);
}

- (void)assistantDictation
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 12);
}

- (void)assistantDictationMicOn
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 13);
}

- (void)assistantReturnKey
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 21);
}

- (void)assistantTextAnimation
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 22);
}

- (void)assistantDismiss
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 14);
}

- (void)assistantShowKeyboard
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 15);
}

- (void)assistantWriteboard
{
  -[UISystemDefaultTextInputAssistantItem performSystemButtonActionForStyle:](self, "performSystemButtonActionForStyle:", 18);
}

- (void)assistantExpand
{
  +[UIAssistantBarButtonItemProvider setAssistantBarCompact:](UIAssistantBarButtonItemProvider, "setAssistantBarCompact:", 0);
}

- (SEL)_responderSelectorForSystemButtonStyle:(int64_t)a3
{
  SEL result;

  result = 0;
  switch(a3)
  {
    case 0:
      result = sel_cut_;
      break;
    case 1:
      result = sel_copy_;
      break;
    case 2:
      result = sel_paste_;
      break;
    case 5:
      result = sel_toggleBoldface_;
      break;
    case 6:
      result = sel_toggleItalics_;
      break;
    case 7:
      result = sel_toggleUnderline_;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)canPerformSystemButtonActionForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  char v9;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateAsResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_responderForEditing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UISystemDefaultTextInputAssistantItem _responderSelectorForSystemButtonStyle:](self, "_responderSelectorForSystemButtonStyle:", a3);
  if (v8)
    v9 = objc_msgSend(v7, "canPerformAction:withSender:", v8, 0);
  else
    v9 = 1;

  return v9;
}

- (void)analyticsDispatchWithActionStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 4)
    +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", *off_1E16E5B20[a3], CFSTR("UCB"));
}

- (void)performSystemButtonActionForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  id v28;
  char v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(_QWORD *);
  void *v36;
  id v37;
  UISystemDefaultTextInputAssistantItem *v38;
  const char *v39;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  switch(a3)
  {
    case 9:
      _getResponderForEditing();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputAssistantItem trailingBarButtonGroups](self, "trailingBarButtonGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v8 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItemGroup _items](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && (objc_opt_respondsToSelector() & 1) != 0 && v10)
        objc_msgSend(v6, "performSelector:withObject:", sel__showTextFormattingOptions_, v10);
      goto LABEL_13;
    case 11:
      objc_msgSend(v5, "presentEmojiPopoverViaTrigger:completion:", CFSTR("ucb"), 0);
      goto LABEL_29;
    case 12:
      if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
        goto LABEL_14;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:](UIDictationInputModeOptions, "dictationInputModeOptionsWithInvocationSource:", CFSTR("UIDictationInputModeInvocationSourceUCBBar"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "switchToDictationInputModeWithOptions:", v10);
LABEL_13:

      goto LABEL_28;
    case 13:
LABEL_14:
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance", v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setReasonType:", 12);

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopDictation");
      goto LABEL_28;
    case 14:
      if (!objc_msgSend(v5, "isMinimized"))
        goto LABEL_29;
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHideSystemInputAssistantView:", 1);

      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minimize");
      goto LABEL_28;
    case 15:
      objc_msgSend(v5, "delegateAsResponder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "_suppressSoftwareKeyboard");

      if (v16)
      {
        objc_msgSend(v31, "delegateAsResponder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_setSuppressSoftwareKeyboard:", 0);
LABEL_28:

      }
      else if (objc_msgSend(v31, "isMinimized"))
      {
        objc_msgSend(v31, "showKeyboardWithoutSuppressionPolicy");
      }
LABEL_29:
      if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess", v31, v33, v34, v35, v36))
      {
        if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
          v23 = 1;
        else
          v23 = 12;
      }
      else
      {
        v23 = 1;
      }
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "feedbackGenerator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "actionOccurred:", v23);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        v27 = WeakRetained;
        v28 = objc_loadWeakRetained((id *)&self->_delegate);
        v29 = objc_opt_respondsToSelector();

        if ((v29 & 1) != 0)
        {
          v30 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v30, "didPerformSystemButtonActionForStyle:", a3);

        }
      }
      -[UISystemDefaultTextInputAssistantItem analyticsDispatchWithActionStyle:](self, "analyticsDispatchWithActionStyle:", a3);

      return;
    case 18:
      objc_msgSend(v5, "lookUpResponderChainForCustomInputView");
      goto LABEL_29;
    case 21:
      objc_msgSend(v5, "performReturn");
      goto LABEL_29;
    case 22:
      _getResponderForEditing();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        _getResponderForEditing();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "performSelector:withObject:", sel__showTextFormattingAnimationOptions_, 0);

      }
      goto LABEL_29;
    default:
      if (!-[UISystemDefaultTextInputAssistantItem canPerformSystemButtonActionForStyle:](self, "canPerformSystemButtonActionForStyle:", a3))goto LABEL_29;
      _getResponderForEditing();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      if (a3 == 4)
      {
        objc_msgSend(v11, "undoManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "redo");
      }
      else if (a3 == 3)
      {
        objc_msgSend(v11, "undoManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "undo");
      }
      else
      {
        v20 = -[UISystemDefaultTextInputAssistantItem _responderSelectorForSystemButtonStyle:](self, "_responderSelectorForSystemButtonStyle:", a3);
        v33 = MEMORY[0x1E0C809B0];
        v34 = 3221225472;
        v35 = __75__UISystemDefaultTextInputAssistantItem_performSystemButtonActionForStyle___block_invoke;
        v36 = &unk_1E16B1C28;
        v38 = self;
        v39 = v20;
        v37 = v6;
        +[UIPasteboard _performAsDataOwnerForAction:responder:block:](UIPasteboard, "_performAsDataOwnerForAction:responder:block:", v20, v37, &v33);
        UIKeyboardGetCurrentInputMode();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticGetKeyForInputMode();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticScalarIncrement();

        v12 = v37;
      }

      +[UIUndoGestureInteraction presentProductivityGestureTutorialInlineWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialInlineWithCompletion:", 0);
      goto LABEL_28;
  }
}

id __75__UISystemDefaultTextInputAssistantItem_performSystemButtonActionForStyle___block_invoke(_QWORD *a1)
{
  const char *v1;
  const char *v2;
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;

  v2 = (const char *)a1[5];
  v1 = (const char *)a1[6];
  v3 = (void *)a1[4];
  if (dyld_program_sdk_at_least())
  {
    v4 = v3;
    v5 = v1;
    v6 = v2;
  }
  else
  {
    v5 = sel_performSelector_withObject_;
    v4 = v3;
    v6 = v1;
  }
  return objc_msgSend(v4, v5, v6);
}

- (BOOL)_isSystemItem
{
  return self->_systemItem;
}

- (void)setSystemItem:(BOOL)a3
{
  self->_systemItem = a3;
}

- (UISystemDefaultTextInputAssistantItemDelegate)delegate
{
  return (UISystemDefaultTextInputAssistantItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isKeyboardCameraItem
{
  return self->_isKeyboardCameraItem;
}

- (NSArray)defaultSystemLeadingBarButtonGroups
{
  return self->_defaultSystemLeadingBarButtonGroups;
}

- (void)setDefaultSystemLeadingBarButtonGroups:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSystemLeadingBarButtonGroups, a3);
}

- (NSArray)defaultSystemTrailingBarButtonGroups
{
  return self->_defaultSystemTrailingBarButtonGroups;
}

- (void)setDefaultSystemTrailingBarButtonGroups:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSystemTrailingBarButtonGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSystemTrailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_defaultSystemLeadingBarButtonGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
