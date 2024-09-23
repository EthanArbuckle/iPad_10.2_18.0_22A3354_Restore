@implementation _UITextChoiceAccelerationAssistant

- (UITextInput)textInputResponder
{
  return (UITextInput *)objc_loadWeakRetained((id *)&self->_textInputResponder);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)dismissIfPresented
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (-[_UITextChoiceAccelerationAssistant keepPromptActive](self, "keepPromptActive"))
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  -[_UITextChoiceAccelerationAssistant cancelPromptDisplay](self, "cancelPromptDisplay");
  -[_UITextChoiceAccelerationAssistant releaseSelectionGrabberAssertion](self, "releaseSelectionGrabberAssertion");
  v3 = -[_UITextChoiceAccelerationAssistant promptIsVisible](self, "promptIsVisible");
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "reset");
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v4, "removeAnimated:", 1);

  if (-[_UITextChoiceAccelerationAssistant usingCustomInteraction](self, "usingCustomInteraction"))
  {
    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "end");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textRangeFromPosition:toPosition:", v5, v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "updateTextChoicePromptSelection:toRange:", v10, v12);

        }
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    LOBYTE(v3) = -[_UITextChoiceAccelerationAssistant showingPrompt](self, "showingPrompt");
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissTextChoicePrompt");

  }
  return v3;
}

- (void)removePassthroughContainer
{
  void *v3;
  void *v4;

  -[_UITextChoiceAccelerationAssistant passthroughContainer](self, "passthroughContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UITextChoiceAccelerationAssistant passthroughContainer](self, "passthroughContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[_UITextChoiceAccelerationAssistant setPassthroughContainer:](self, "setPassthroughContainer:", 0);
  }
}

- (void)releaseSelectionGrabberAssertion
{
  _UIAssertion **p_grabberSuppressionAssertion;
  id WeakRetained;
  _UIAssertion *textChoiceInteractionGrabberSuppressionAssertion;

  p_grabberSuppressionAssertion = &self->_grabberSuppressionAssertion;
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabberSuppressionAssertion);
  objc_msgSend(WeakRetained, "_invalidate");

  objc_storeWeak((id *)p_grabberSuppressionAssertion, 0);
  -[_UIAssertion _invalidate](self->_textChoiceInteractionGrabberSuppressionAssertion, "_invalidate");
  textChoiceInteractionGrabberSuppressionAssertion = self->_textChoiceInteractionGrabberSuppressionAssertion;
  self->_textChoiceInteractionGrabberSuppressionAssertion = 0;

}

- (BOOL)promptIsVisible
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;

  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alpha");
    v7 = v6 > 0.0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_UITextChoiceAccelerationPassthroughView)passthroughContainer
{
  return self->_passthroughContainer;
}

- (void)cancelPromptDisplay
{
  void *v3;

  -[_UITextChoiceAccelerationAssistant promptDisplayTimer](self, "promptDisplayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UITextChoiceAccelerationAssistant setPromptDisplayTimer:](self, "setPromptDisplayTimer:", 0);
  -[_UITextChoiceAccelerationAssistant removePassthroughContainer](self, "removePassthroughContainer");
}

- (void)setPromptDisplayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_promptDisplayTimer, a3);
}

- (NSTimer)promptDisplayTimer
{
  return self->_promptDisplayTimer;
}

- (void)updateActivePromptForCandidate:(id)a3 displayRects:(id)a4 highlightOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v5 = a5;
  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[_UITextChoiceAccelerationAssistant parentViewForPrompt](self, "parentViewForPrompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_14:
    -[_UITextChoiceAccelerationAssistant setKeepPromptActive:](self, "setKeepPromptActive:", 0);
    goto LABEL_19;
  }
  v11 = -[_UITextChoiceAccelerationAssistant keepPromptActive](self, "keepPromptActive");
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13 == v10 && v11;
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_convertVisualAltitude:toView:", v16, 0.0);
  objc_msgSend(v15, "_setVisualAltitude:");

  if (!objc_msgSend(v9, "count"))
  {
    v23 = -[_UITextChoiceAccelerationAssistant keepPromptActive](self, "keepPromptActive");
    if (!v9 && !v8 && v23)
    {
      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hideForNow");

      -[_UITextChoiceAccelerationAssistant removePassthroughContainer](self, "removePassthroughContainer");
    }
    goto LABEL_14;
  }
  -[_UITextChoiceAccelerationAssistant setKeepPromptActive:](self, "setKeepPromptActive:", 1);
  objc_msgSend(v9, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v14)
    {
      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "showChoices:", 0);

    }
    -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inputOverlayContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant textHighlightColor](self, "textHighlightColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateTextBoxHighlightForRect:inTextView:parentView:highlightColor:", v17, v21, v10, v22);
  }
  else
  {
    if (!v14)
    {
      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "updateButtonForType:", 1);

      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _candidatesChoicesFromTextChoices(v27, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "inputOverlayContainer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "updateWithChoices:fromParentView:referenceTextView:presentedFromRect:textHighlightColor:", v28, v10, v30, v17, 0);

      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "updateButtonName:placement:originalText:", CFSTR("xmark"), 1, v8);

    }
    -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inputOverlayContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant textHighlightColor](self, "textHighlightColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateForSingleWord:textAnchorRect:inTextView:parentView:highlightColor:", v8, v17, v21, v10, v22);
  }

  -[_UITextChoiceAccelerationAssistant setupPassthroughContainer](self, "setupPassthroughContainer");
LABEL_19:

}

- (_UITextChoiceAccelerationBubble)prompt
{
  _UITextChoiceAccelerationBubble *prompt;
  _UITextChoiceAccelerationBubble *v4;
  _UITextChoiceAccelerationBubble *v5;

  prompt = self->_prompt;
  if (!prompt)
  {
    -[_UITextChoiceAccelerationAssistant createPromptWithCompletionHandler:](self, "createPromptWithCompletionHandler:", 0);
    v4 = (_UITextChoiceAccelerationBubble *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prompt;
    self->_prompt = v4;

    prompt = self->_prompt;
  }
  return prompt;
}

- (BOOL)keepPromptActive
{
  return self->_keepPromptActive;
}

- (void)setKeepPromptActive:(BOOL)a3
{
  self->_keepPromptActive = a3;
}

- (id)parentViewForPrompt
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_UITextChoiceAccelerationAssistant currentKeyboardSceneDelegate](self, "currentKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputOverlayContainer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)currentKeyboardSceneDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputOverlayContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (_UITextChoicesAssistantDelegate)delegate
{
  return (_UITextChoicesAssistantDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_UITextChoiceAccelerationAssistant)initWithTextInputResponder:(id)a3
{
  id v4;
  _UITextChoiceAccelerationAssistant *v5;
  _UITextChoiceAccelerationAssistant *v6;
  _UITextChoiceInteraction *v7;
  _UITextChoiceInteraction *textChoiceInteraction;

  v4 = a3;
  v5 = -[_UITextChoiceAccelerationAssistant initWithInteractionAssistant:](self, "initWithInteractionAssistant:", 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textInputResponder, v4);
    v6->_usingCustomInteraction = 1;
    v7 = -[_UITextChoiceInteraction initWithDelegate:]([_UITextChoiceInteraction alloc], "initWithDelegate:", v6);
    textChoiceInteraction = v6->_textChoiceInteraction;
    v6->_textChoiceInteraction = v7;

  }
  return v6;
}

- (_UITextChoiceAccelerationAssistant)initWithInteractionAssistant:(id)a3
{
  id v4;
  _UITextChoiceAccelerationAssistant *v5;
  _UITextChoiceAccelerationAssistant *v6;
  uint64_t v7;
  NSMutableArray *underlinedRanges;
  uint64_t v9;
  NSMutableDictionary *savedLists;
  uint64_t v11;
  NSMutableDictionary *underlinedWordData;
  uint64_t v13;
  NSMutableDictionary *underlinedWordDataForDictation;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UITextChoiceAccelerationAssistant;
  v5 = -[_UITextChoiceAccelerationAssistant init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactionAssistant, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    underlinedRanges = v6->_underlinedRanges;
    v6->_underlinedRanges = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    savedLists = v6->_savedLists;
    v6->_savedLists = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    underlinedWordData = v6->_underlinedWordData;
    v6->_underlinedWordData = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    underlinedWordDataForDictation = v6->_underlinedWordDataForDictation;
    v6->_underlinedWordDataForDictation = (NSMutableDictionary *)v13;

    v6->_usingCustomInteraction = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel_displayDidChange_, CFSTR("UITextSelectionWillScroll"), 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel_displayDidChange_, CFSTR("UITextSelectionWillZoom"), 0);

  }
  return v6;
}

- (void)setNeedsUnderlineUpdate
{
  -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdateWithReason:](self, "setNeedsUnderlineUpdateWithReason:", 0);
}

- (id)_document
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[_UITextChoiceAccelerationAssistant selectionViewManager](self, "selectionViewManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeSelectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)removeAllUnderlinesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  -[_UITextChoiceAccelerationAssistant _existingUnderlineView](self, "_existingUnderlineView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearAllUnderlinesAnimated:", v3);

  -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[_UITextChoiceAccelerationAssistant underlinedWordDataForDictation](self, "underlinedWordDataForDictation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[_UITextChoiceAccelerationAssistant savedLists](self, "savedLists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textInputView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant textChoiceInteraction](self, "textChoiceInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeInteraction:", v12);

  }
}

- (NSMutableArray)underlinedRanges
{
  return self->_underlinedRanges;
}

- (NSMutableDictionary)underlinedWordData
{
  return self->_underlinedWordData;
}

- (NSMutableDictionary)savedLists
{
  return self->_savedLists;
}

- (id)_existingUnderlineView
{
  void *v3;
  _UITextUnderlineView *v4;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[_UITextChoiceAccelerationAssistant selectionViewManager](self, "selectionViewManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_existingUnderlineView");
    v4 = (_UITextUnderlineView *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_selectionHighlightView;
  }
  return v4;
}

- (id)selectionViewManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_selectionViewManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_selectionDisplayInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return v5;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textInputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "interactions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v15;
          if (objc_msgSend(v12, "isActivated"))
            v16 = v12;
          else
            v16 = 0;

          goto LABEL_21;
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_21:

  if (v16)
    v17 = v16;
  else
    v17 = v12;
  v18 = v17;

  return v18;
}

- (UITextInteractionAssistant)interactionAssistant
{
  return (UITextInteractionAssistant *)objc_loadWeakRetained((id *)&self->_interactionAssistant);
}

- (void)removeAllUnderlines
{
  -[_UITextChoiceAccelerationAssistant removeAllUnderlinesAnimated:](self, "removeAllUnderlinesAnimated:", 0);
}

- (void)selectionDidChange
{
  void *v3;
  void *v4;
  id v5;

  if (-[_UITextChoiceAccelerationAssistant usingCustomInteraction](self, "usingCustomInteraction"))
  {
    -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v5 = v3;
      objc_msgSend(v3, "end");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant updateUnderlinesIfNeededAfterPosition:](self, "updateUnderlinesIfNeededAfterPosition:", v4);

      v3 = v5;
    }

  }
}

- (BOOL)usingCustomInteraction
{
  return self->_usingCustomInteraction;
}

- (_UITextChoiceAccelerationAssistant)init
{
  return -[_UITextChoiceAccelerationAssistant initWithInteractionAssistant:](self, "initWithInteractionAssistant:", 0);
}

- (BOOL)textChoiceInteraction:(id)a3 shouldRespondToTapAtPoint:(CGPoint)a4
{
  double y;
  double x;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  if (!-[_UITextChoiceAccelerationAssistant usingCustomInteraction](self, "usingCustomInteraction", a3)
    || -[_UITextChoiceAccelerationAssistant showingPrompt](self, "showingPrompt"))
  {
    return 0;
  }
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closestPositionToPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v9)
  {
    -[_UITextChoiceAccelerationAssistant rangeForTextChoicesAtPosition:](self, "rangeForTextChoicesAtPosition:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v7 = 1;
  }

  return v7;
}

- (void)textChoiceInteraction:(id)a3 receivedTapAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;

  y = a4.y;
  x = a4.x;
  if (!-[_UITextChoiceAccelerationAssistant showingPrompt](self, "showingPrompt", a3))
  {
    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "closestPositionToPoint:", x, y);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_8;
    -[_UITextChoiceAccelerationAssistant rangeForTextChoicesAtPosition:](self, "rangeForTextChoicesAtPosition:", v19);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15
      || (v16 = (void *)v15,
          -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = -[_UITextChoiceAccelerationAssistant showAutocorrectReplacementChoicesIfNeeded:forRange:](self, "showAutocorrectReplacementChoicesIfNeeded:forRange:", v17, v16), v17, v16, !v18))
    {
LABEL_8:
      -[_UITextChoiceAccelerationAssistant dismissIfPresented](self, "dismissIfPresented");
    }
    goto LABEL_9;
  }
  -[_UITextChoiceAccelerationAssistant dismissIfPresented](self, "dismissIfPresented");
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "closestPositionToPoint:", x, y);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v19;
  if (v19)
  {
    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textRangeFromPosition:toPosition:", v19, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateTextChoicePromptSelection:toRange:", v11, v13);

    }
LABEL_9:
    v8 = v19;
  }

}

- (id)createPromptWithCompletionHandler:(id)a3
{
  id v4;
  _UITextChoiceAccelerationBubble *v5;
  _UITextChoiceAccelerationBubble *v6;
  _UITextChoiceAccelerationBubble *v7;
  id v8;
  void *v9;
  _UITextChoiceAccelerationBubble *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  _UITextChoiceAccelerationBubble *v16;
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = [_UITextChoiceAccelerationBubble alloc];
  v6 = -[_UITextChoiceAccelerationBubble initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __72___UITextChoiceAccelerationAssistant_createPromptWithCompletionHandler___block_invoke;
  v15 = &unk_1E16C7180;
  objc_copyWeak(&v18, &location);
  v7 = v6;
  v16 = v7;
  v8 = v4;
  v17 = v8;
  +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIControl addAction:forControlEvents:](v7, "addAction:forControlEvents:", v9, 64, v12, v13, v14, v15);
  v10 = v7;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

- (void)_addUnderlineView
{
  void *v3;
  _UITextUnderlineView *v4;
  _UITextUnderlineView *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UITextChoiceAccelerationAssistant selectionHighlightView](self, "selectionHighlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [_UITextUnderlineView alloc];
    v5 = -[_UITextUnderlineView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_UITextChoiceAccelerationAssistant setSelectionHighlightView:](self, "setSelectionHighlightView:", v5);

  }
  -[_UITextChoiceAccelerationAssistant selectionViewManager](self, "selectionViewManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_hostViewBelowText");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UITextChoiceAccelerationAssistant selectionHighlightView](self, "selectionHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

}

- (id)_underlineView
{
  void *v3;
  _UITextUnderlineView *v4;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[_UITextChoiceAccelerationAssistant selectionViewManager](self, "selectionViewManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_underlineView");
    v4 = (_UITextUnderlineView *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_selectionHighlightView;
  }
  return v4;
}

- (id)textInputView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    return v6;
  }
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v6;
}

- (void)activateUnderlineViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[_UITextChoiceAccelerationAssistant selectionViewManager](self, "selectionViewManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activate");

    }
  }
  else
  {
    -[_UITextChoiceAccelerationAssistant selectionHighlightView](self, "selectionHighlightView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[_UITextChoiceAccelerationAssistant _addUnderlineView](self, "_addUnderlineView");
  }
}

- (void)setNeedsUnderlineUpdateWithReason:(int64_t)a3
{
  id v5;

  if (!self->_needsUpdate && !+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    self->_needsUpdate = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateUnderlineGeometryIfNeeded_, v5, 0.0);

  }
}

- (void)updateUnderlineGeometryIfNeeded:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  void *v56;
  void *v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  BOOL v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id obj;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v86 = *MEMORY[0x1E0C80C00];
  if (!self->_needsUpdate)
    return;
  v77 = objc_msgSend(a3, "integerValue");
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_UITextChoiceAccelerationAssistant _document](self, "_document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  if ((v5 & 1) == 0)
  {
    -[_UITextChoiceAccelerationAssistant removeAllUnderlinesAnimated:](self, "removeAllUnderlinesAnimated:", 0);
    -[_UITextChoiceAccelerationAssistant dismissIfPresented](self, "dismissIfPresented");
  }
  -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (!objc_msgSend(v7, "count"))
    -[_UITextChoiceAccelerationAssistant removeAllUnderlinesAnimated:](self, "removeAllUnderlinesAnimated:", 0);
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  obj = v8;
  if (!v9)
  {
LABEL_34:

    goto LABEL_35;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v82;
  v79 = *(_QWORD *)v82;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v82 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
      if ((objc_msgSend(v14, "isEmpty") & 1) == 0)
      {
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "textInRange:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          -[_UITextChoiceAccelerationAssistant removeWordForRange:](self, "removeWordForRange:", v14);
LABEL_28:

          continue;
        }
        objc_msgSend(v19, "documentTextToReplace");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v16);

        if (!v21)
        {
LABEL_27:
          v12 = v79;
          goto LABEL_28;
        }
        if ((v11 & 1) == 0)
        {
          -[_UITextChoiceAccelerationAssistant selectionRectsForRange:](self, "selectionRectsForRange:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "rect");
          v25 = v24;
          v27 = v26;

          objc_msgSend(v19, "underlines");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "firstObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "rect");
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v37 = v36;

          if (v77 == 1)
          {
            objc_msgSend(v22, "firstObject");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UITextChoiceAccelerationAssistant convertedSelectionRect:](self, "convertedSelectionRect:", v38);
            v40 = v39;
            v42 = v41;
            v44 = v43;
            v46 = v45;

            v87.origin.x = v40;
            v87.origin.y = v42;
            v87.size.width = v44;
            v87.size.height = v46;
            v89.origin.x = v31;
            v89.origin.y = v33;
            v89.size.width = v35;
            v89.size.height = v37;
            if (CGRectEqualToRect(v87, v89))
            {
              objc_msgSend(v22, "lastObject");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UITextChoiceAccelerationAssistant convertedSelectionRect:](self, "convertedSelectionRect:", v47);
              v49 = v48;
              v51 = v50;
              v53 = v52;
              v55 = v54;

              objc_msgSend(v19, "underlines");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "lastObject");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "rect");
              v90.origin.x = v58;
              v90.origin.y = v59;
              v90.size.width = v60;
              v90.size.height = v61;
              v88.origin.x = v49;
              v88.origin.y = v51;
              v88.size.width = v53;
              v88.size.height = v55;
              v75 = CGRectEqualToRect(v88, v90);

              if (v75)
                goto LABEL_33;
              goto LABEL_26;
            }
          }
          else if (v25 == v31 && v27 == v33)
          {
            objc_msgSend(v22, "lastObject");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "rect");
            v63 = v62;
            v65 = v64;
            objc_msgSend(v19, "underlines");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "lastObject");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "rect");
            v69 = v68;
            v71 = v70;

            if (v63 == v69 && v65 == v71)
            {
LABEL_33:

              v8 = obj;
              goto LABEL_34;
            }
            goto LABEL_26;
          }

        }
LABEL_26:
        objc_msgSend(v19, "underlines");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationAssistant updateUnderlineRects:forRange:](self, "updateUnderlineRects:forRange:", v72, v14);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setUnderlines:", v73);

        objc_msgSend(v19, "underlines");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addObjectsFromArray:", v74);

        v11 = 1;
        goto LABEL_27;
      }
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (v10)
      continue;
    break;
  }

  if ((v11 & 1) != 0)
  {
    -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnderlineRects:", v78);
    goto LABEL_34;
  }
LABEL_35:
  self->_needsUpdate = 0;

}

- (void)refreshExistingUnderlines
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id obj;
  void *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (!v5)
      goto LABEL_48;
    v6 = v5;
    v7 = *(_QWORD *)v75;
    v63 = *(_QWORD *)v75;
    while (1)
    {
      v8 = 0;
      v64 = v6;
      do
      {
        if (*(_QWORD *)v75 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v8);
        -[_UITextChoiceAccelerationAssistant _document](self, "_document", v62);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textInRange:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          -[_UITextChoiceAccelerationAssistant removeWordForRange:](self, "removeWordForRange:", v9);
          goto LABEL_44;
        }
        objc_msgSend(v14, "documentTextToReplace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v11);

        if (v16)
        {
          objc_msgSend(v14, "underlines");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationAssistant updateUnderlineRects:forRange:](self, "updateUnderlineRects:forRange:", v17, v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setUnderlines:", v18);

          objc_msgSend(v14, "underlines");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObjectsFromArray:", v19);

          goto LABEL_44;
        }
        objc_msgSend(v9, "start");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "endOfDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v67 = v22;
        if (v22)
        {
          if (!v20
            || (-[_UITextChoiceAccelerationAssistant _document](self, "_document"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = objc_msgSend(v23, "comparePosition:toPosition:", v22, v20),
                v23,
                v24 == -1))
          {
            v25 = v22;

            v20 = v25;
          }
        }
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "tokenizer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "rangeEnclosingPosition:withGranularity:inDirection:", v20, 1, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = v20;
        v69 = v12;
        if (v28 && (objc_msgSend(v28, "isEmpty") & 1) == 0)
        {
          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v39 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v39, "textInRange:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "documentTextToReplace");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v39) = objc_msgSend(v40, "isEqualToString:", v29);

          if ((v39 & 1) != 0)
            goto LABEL_30;
        }
        else
        {
          v29 = v11;
        }
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "tokenizer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "rangeEnclosingPosition:withGranularity:inDirection:", v20, 1, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32 && (objc_msgSend(v32, "isEmpty") & 1) == 0)
        {
          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v41 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v41, "textInRange:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "documentTextToReplace");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v41) = objc_msgSend(v42, "isEqualToString:", v33);

          if ((v41 & 1) != 0)
          {
            v29 = v33;
            v28 = v32;
LABEL_30:
            -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "indexOfObject:", v9);

            -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47;
            v62 = v29;
            if (v46 == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v47, "addObject:", v28);
            else
              objc_msgSend(v47, "replaceObjectAtIndex:withObject:", v46, v28);

            -[_UITextChoiceAccelerationAssistant selectionRectsForRange:](self, "selectionRectsForRange:", v28);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v51 = v49;
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
            if (v52)
            {
              v53 = v52;
              v54 = *(_QWORD *)v71;
              do
              {
                for (i = 0; i != v53; ++i)
                {
                  if (*(_QWORD *)v71 != v54)
                    objc_enumerationMutation(v51);
                  -[_UITextChoiceAccelerationAssistant underlineRectForTextSelectionRect:forCandidate:](self, "underlineRectForTextSelectionRect:forCandidate:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i), 0, v62);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v56)
                    objc_msgSend(v50, "addObject:", v56);

                }
                v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
              }
              while (v53);
            }

            objc_msgSend(v14, "setUnderlines:", v50);
            objc_msgSend(v65, "addObjectsFromArray:", v50);
            -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v28);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v69;
            objc_msgSend(v58, "removeObjectForKey:", v69);

            -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKey:", v14, v57);

            v7 = v63;
            v6 = v64;
            v29 = v62;
            goto LABEL_43;
          }
        }
        else
        {
          v33 = v29;
        }
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "tokenizer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "positionFromPosition:toBoundary:inDirection:", v20, 1, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "tokenizer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "rangeEnclosingPosition:withGranularity:inDirection:", v36, 1, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28 && !objc_msgSend(v28, "isEmpty"))
        {
          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "textInRange:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "documentTextToReplace");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v43) = objc_msgSend(v44, "isEqualToString:", v29);

          v12 = v69;
          if ((_DWORD)v43)
            goto LABEL_30;
          v6 = v64;
        }
        else
        {

          v29 = v33;
          v6 = v64;
          v12 = v69;
        }
        -[_UITextChoiceAccelerationAssistant removeWordForRange:](self, "removeWordForRange:", v9);
        v7 = v63;
LABEL_43:

        v11 = v29;
LABEL_44:

        ++v8;
      }
      while (v8 != v6);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      v6 = v60;
      if (!v60)
      {
LABEL_48:

        -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setUnderlineRects:", v65);

        return;
      }
    }
  }
}

- (void)updateUnderlinesForAddedRange:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  -[_UITextChoiceAccelerationAssistant activateUnderlineViewIfNeeded](self, "activateUnderlineViewIfNeeded");
  v4 = v20;
  if (v20)
  {
    objc_msgSend(v20, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UITextChoiceAccelerationAssistant positionIsAtDocumentStart:](self, "positionIsAtDocumentStart:", v5);

    if (!v6)
    {
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tokenizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "start");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:toBoundary:inDirection:", v9, 2, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "start");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "comparePosition:toPosition:", v12, v10);

        if (v13)
          -[_UITextChoiceAccelerationAssistant removeUnderlinesBeforePosition:](self, "removeUnderlinesBeforePosition:", v10);
      }

    }
    -[_UITextChoiceAccelerationAssistant lastAddedPosition](self, "lastAddedPosition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "end");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant lastAddedPosition](self, "lastAddedPosition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "comparePosition:toPosition:", v16, v17);

      objc_msgSend(v20, "end");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 != 1)
      {
        -[_UITextChoiceAccelerationAssistant updateUnderlinesIfNeededAfterPosition:](self, "updateUnderlinesIfNeededAfterPosition:", v19);
LABEL_12:

        v4 = v20;
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v20, "end");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_UITextChoiceAccelerationAssistant setLastAddedPosition:](self, "setLastAddedPosition:", v19);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)addUnderlinesForCandidate:(id)a3 range:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[_UITextChoiceAccelerationAssistant updateUnderlinesForAddedRange:](self, "updateUnderlinesForAddedRange:", v6);
  -[_UITextChoiceAccelerationAssistant underlineRectsForCandidate:range:](self, "underlineRectsForCandidate:range:", v17, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess") && objc_msgSend(v7, "count"))
  {
    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textInputView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant textChoiceInteraction](self, "textChoiceInteraction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addInteraction:", v11);

    }
    -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addUnderlines:animated:", v7, 0);

    -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v6);

    +[_UIReplacementCandidate candidateForAutocorrectionCandidate:range:](_UIReplacementCandidate, "candidateForAutocorrectionCandidate:range:", v17, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUnderlines:", v7);
    objc_msgSend(v14, "setUnderlineStyle:", 1);
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, v16);

  }
}

- (void)addUnderlineForCandidate:(id)a3 range:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(v15, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant anchorRangeForText:](self, "anchorRangeForText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant underlineRectsForInput:](self, "underlineRectsForInput:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v8);

    +[_UIReplacementCandidate candidateForAutocorrectionCandidate:range:](_UIReplacementCandidate, "candidateForAutocorrectionCandidate:range:", v15, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUnderlines:", v10);
    objc_msgSend(v12, "setUnderlineStyle:", 0);
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, v14);

  }
  if (v6 && (objc_msgSend(v6, "isEmpty") & 1) == 0)
    -[_UITextChoiceAccelerationAssistant addUnderlinesForCandidate:range:](self, "addUnderlinesForCandidate:range:", v15, v6);

}

- (void)underlineTextInRange:(id)a3 revertText:(id)a4 textChoices:(id)a5 isActiveEditingSession:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v6 = a6;
  v29 = a3;
  v10 = a4;
  v11 = a5;
  -[_UITextChoiceAccelerationAssistant updateUnderlinesForAddedRange:](self, "updateUnderlinesForAddedRange:", v29);
  -[_UITextChoiceAccelerationAssistant underlineRectsForCandidate:range:](self, "underlineRectsForCandidate:range:", 0, v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (v29 && !v13)
  {
    -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v29);

    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textInRange:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && objc_msgSend(v16, "length"))
    {
      +[_UIReplacementCandidate candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:](_UIReplacementCandidate, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:", v16, v10, 0, v29, 1, 1, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRevertText:", v10);
      objc_msgSend(v17, "setTextChoices:", v11);
      v18 = objc_msgSend(v12, "count");
      v19 = v18 != 0;
      if (v18)
        objc_msgSend(v17, "setUnderlines:", v12);
      objc_msgSend(v17, "setUnderlineStyle:", 1);
      -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v17, v21);

      if (v6)
      {
        -[_UITextChoiceAccelerationAssistant underlinedWordDataForDictation](self, "underlinedWordDataForDictation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v17, v23);

      }
    }
    else
    {
      v19 = 0;
    }
    -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addUnderlines:animated:", v12, 0);

    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "textInputView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant textChoiceInteraction](self, "textChoiceInteraction");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addInteraction:", v28);

    }
    if (v19)
      -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdate](self, "setNeedsUnderlineUpdate");

  }
}

- (void)underlineTextInRange:(id)a3 revertText:(id)a4
{
  -[_UITextChoiceAccelerationAssistant underlineTextInRange:revertText:textChoices:isActiveEditingSession:](self, "underlineTextInRange:revertText:textChoices:isActiveEditingSession:", a3, a4, 0, 0);
}

- (id)underlineRectsForCandidate:(id)a3 range:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[_UITextChoiceAccelerationAssistant selectionRectsForRange:](self, "selectionRectsForRange:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant underlineRectsForCandidate:selectionRects:](self, "underlineRectsForCandidate:selectionRects:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)underlineRectsForCandidate:(id)a3 selectionRects:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[_UITextChoiceAccelerationAssistant underlineRectForTextSelectionRect:forCandidate:](self, "underlineRectForTextSelectionRect:forCandidate:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v6, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UITextChoiceAccelerationAssistant _document](self, "_document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_underlineRectsByDocumentLineForSelectionRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updateUnderlineRects:(id)a3 forRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UITextChoiceAccelerationAssistant selectionRectsForRange:](self, "selectionRectsForRange:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboard currentDocumentState](UIKeyboard, "currentDocumentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "_asNSRangeRelativeToDocument:", v10);
    v13 = v12;

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "firstRectForCharacterRange:", v11, v13);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "inputOverlayContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v23, v15, v17, v19, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v25 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v25;
    }

  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v8, "count"))
  {
    v27 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndex:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant underlineRectForTextSelectionRect:forCandidate:](self, "underlineRectForTextSelectionRect:forCandidate:", v28, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 < objc_msgSend(v6, "count"))
      {
        if (v29)
          break;
      }
      if (v29)
        goto LABEL_11;
LABEL_12:

      if (++v27 >= objc_msgSend(v8, "count"))
        goto LABEL_13;
    }
    objc_msgSend(v6, "objectAtIndex:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setUnderlineType:", objc_msgSend(v30, "underlineType"));
    objc_msgSend(v30, "underlineColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setUnderlineColor:", v31);

LABEL_11:
    objc_msgSend(v26, "addObject:", v29);
    goto LABEL_12;
  }
LABEL_13:

  return v26;
}

- (id)keyFromRange:(id)a3
{
  id v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  void *v11;
  NSRange v13;

  v4 = a3;
  -[_UITextChoiceAccelerationAssistant _document](self, "_document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_asNSRangeRelativeToDocument:", v5);
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0CB3940];
  v13.location = v6;
  v13.length = v8;
  NSStringFromRange(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_removeUnderlinesRelativeToPosition:(id)a3 compare:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id obj;
  _UITextChoiceAccelerationAssistant *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = self;
  -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = v6;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v14, "start");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (a4 == -1)
        {
          objc_msgSend(v14, "end");
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v16;
        }
        -[_UITextChoiceAccelerationAssistant _document](v30, "_document");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "comparePosition:toPosition:", v15, v9);

        if (v18 == a4)
        {
          v19 = a4;
          v20 = v11;
          v21 = v12;
          v22 = v9;
          -[_UITextChoiceAccelerationAssistant underlinedWordData](v30, "underlinedWordData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationAssistant keyFromRange:](v30, "keyFromRange:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v25, "underlines");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObjectsFromArray:", v26);

          }
          -[_UITextChoiceAccelerationAssistant removeWordForRange:](v30, "removeWordForRange:", v14);

          v9 = v22;
          v12 = v21;
          v11 = v20;
          a4 = v19;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  -[_UITextChoiceAccelerationAssistant _underlineView](v30, "_underlineView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeUnderlines:animated:", v28, 1);

}

- (void)removeUnderlinesBeforePosition:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = v7;
  if (v7 && v5)
  {
    -[_UITextChoiceAccelerationAssistant _removeUnderlinesRelativeToPosition:compare:](self, "_removeUnderlinesRelativeToPosition:compare:", v7, -1);
    v6 = v7;
  }

}

- (void)removeUnderlinesAfterPosition:(id)a3
{
  if (a3)
    -[_UITextChoiceAccelerationAssistant _removeUnderlinesRelativeToPosition:compare:](self, "_removeUnderlinesRelativeToPosition:compare:", a3, 1);
}

- (void)clearUnderlinesIfNeededBeforePosition:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = v21;
  if (v21 && v5)
  {
    if (-[_UITextChoiceAccelerationAssistant positionIsAtDocumentStart:](self, "positionIsAtDocumentStart:", v21))
    {
      -[_UITextChoiceAccelerationAssistant removeAllUnderlinesAnimated:](self, "removeAllUnderlinesAnimated:", 0);
      -[_UITextChoiceAccelerationAssistant dismissIfPresented](self, "dismissIfPresented");
LABEL_15:
      v6 = v21;
      goto LABEL_16;
    }
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "positionFromPosition:toBoundary:inDirection:", v21, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textRangeFromPosition:toPosition:", v9, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11
        && (-[_UITextChoiceAccelerationAssistant _document](self, "_document"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "textInRange:", v11),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR(" ")),
            v13,
            v12,
            (v14 & 1) != 0))
      {
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "tokenizer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "positionFromPosition:toBoundary:inDirection:", v9, 1, 1);
        v17 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v17;
        if (!v17)
          goto LABEL_14;
      }
      else
      {

      }
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tokenizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "positionFromPosition:toBoundary:inDirection:", v9, 1, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        -[_UITextChoiceAccelerationAssistant removeUnderlinesBeforePosition:](self, "removeUnderlinesBeforePosition:", v20);
      -[_UITextChoiceAccelerationAssistant setKeepPromptActive:](self, "setKeepPromptActive:", 0);

    }
LABEL_14:
    -[_UITextChoiceAccelerationAssistant updateUnderlinesIfNeededAfterPosition:](self, "updateUnderlinesIfNeededAfterPosition:", v21);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)updateUnderlinesIfNeededAfterPosition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  -[_UITextChoiceAccelerationAssistant lastAddedPosition](self, "lastAddedPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant lastAddedPosition](self, "lastAddedPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "comparePosition:toPosition:", v14, v6);

    if (v7 == -1)
    {
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tokenizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:toBoundary:inDirection:", v14, 2, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationAssistant lastAddedPosition](self, "lastAddedPosition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "offsetFromPosition:toPosition:", v10, v12);

        if (v13 >= 2)
        {
          -[_UITextChoiceAccelerationAssistant removeAllUnderlinesAnimated:](self, "removeAllUnderlinesAnimated:", 1);
          -[_UITextChoiceAccelerationAssistant setLastAddedPosition:](self, "setLastAddedPosition:", v14);
        }
      }
      -[_UITextChoiceAccelerationAssistant refreshExistingUnderlines](self, "refreshExistingUnderlines");

    }
  }

}

- (void)clearUnderlineForPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v14, 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") && !v7)
    {
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tokenizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:toBoundary:inDirection:", v14, 1, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "tokenizer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "positionFromPosition:toBoundary:inDirection:", v7, 1, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "textRangeFromPosition:toPosition:", v12, v14);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_7;
        }
        v7 = 0;
      }
LABEL_10:

      v4 = v14;
      goto LABEL_11;
    }
LABEL_7:
    if (v7)
      -[_UITextChoiceAccelerationAssistant clearUnderlinesInRange:animated:](self, "clearUnderlinesInRange:animated:", v7, 1);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)clearUnderlinesInRange:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _BOOL4 v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v27 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v29 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v29)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
          -[_UITextChoiceAccelerationAssistant _document](self, "_document", v26);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "start");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "end");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "comparePosition:toPosition:", v13, v14);

          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "end");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "start");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v16, "comparePosition:toPosition:", v17, v18);

          if (v15 != 1 && v19 != -1)
          {
            -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v11);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v23, "underlines");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObjectsFromArray:", v24);

            }
            -[_UITextChoiceAccelerationAssistant removeWordForRange:animated:](self, "removeWordForRange:animated:", v11, v27);

          }
          ++v10;
        }
        while (v9 != v10);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v9);
    }

    -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeUnderlines:animated:", v26, v27);

  }
}

- (void)adjustRangesAfterPosition:(id)a3 byOffset:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  int64_t v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 || !a4)
  {
    -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdate](self, "setNeedsUnderlineUpdate");
    goto LABEL_21;
  }
  v38 = a4;
  -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v9)
    goto LABEL_19;
  v10 = v9;
  v11 = *(_QWORD *)v42;
  v36 = *(_QWORD *)v42;
  v37 = v6;
  do
  {
    v12 = 0;
    v40 = v10;
    do
    {
      if (*(_QWORD *)v42 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "comparePosition:toPosition:", v15, v6);

      if (v16 != -1)
      {
        -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "start");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "positionFromPosition:offset:", v21, v38);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "end");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "positionFromPosition:offset:", v24, v38);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "textRangeFromPosition:toPosition:", v22, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "removeObjectForKey:", v17);

          -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v19, v30);

          -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "indexOfObject:", v13);

          if (v32 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "replaceObjectAtIndex:withObject:", v32, v27);

          }
          v11 = v36;
          v6 = v37;
LABEL_15:

          v10 = v40;
        }
        else
        {
          -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "indexOfObject:", v13);

          if (v35 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObjectAtIndex:", v35);
            goto LABEL_15;
          }
        }

      }
      ++v12;
    }
    while (v10 != v12);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v10);
LABEL_19:

  -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdate](self, "setNeedsUnderlineUpdate");
LABEL_21:

}

- (BOOL)positionIsAtDocumentStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  -[_UITextChoiceAccelerationAssistant _document](self, "_document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "comparePosition:toPosition:", v4, v6) == 0;

  }
  return v7;
}

- (id)underlineRectForTextSelectionRect:(id)a3 forCandidate:(id)a4
{
  id v6;
  id v7;
  double v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGRect v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rect");
  if (v8 == 0.0
    || (-[_UITextChoiceAccelerationAssistant convertedSelectionRect:](self, "convertedSelectionRect:", v6),
        x = v25.origin.x,
        y = v25.origin.y,
        width = v25.size.width,
        height = v25.size.height,
        CGRectEqualToRect(v25, *MEMORY[0x1E0C9D628])))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v6, "baselineOffset");
    if (v15 == 0.0)
      v16 = height * 0.75;
    else
      v16 = v15;
    if (v6)
    {
      objc_msgSend(v6, "transform");
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v22 = 0u;
    }
    +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", &v22, x, y, width, height, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant defaultUnderlineColor](self, "defaultUnderlineColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (TIGetShowCandidateConfidenceValue_onceToken != -1)
        dispatch_once(&TIGetShowCandidateConfidenceValue_onceToken, &__block_literal_global_917);
      objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController", v22, v23, v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForPreferenceKey:", CFSTR("ShowCandidateConfidence"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v18) = objc_msgSend(v19, "BOOLValue");
      if ((_DWORD)v18)
      {
        switch(objc_msgSend(v7, "confidence"))
        {
          case 0u:
            +[UIColor systemGreenColor](UIColor, "systemGreenColor");
            v20 = objc_claimAutoreleasedReturnValue();
            goto LABEL_20;
          case 1u:
            +[UIColor systemYellowColor](UIColor, "systemYellowColor");
            v20 = objc_claimAutoreleasedReturnValue();
            goto LABEL_20;
          case 2u:
            +[UIColor systemRedColor](UIColor, "systemRedColor");
            v20 = objc_claimAutoreleasedReturnValue();
            goto LABEL_20;
          case 3u:
            +[UIColor systemGrayColor](UIColor, "systemGrayColor");
            v20 = objc_claimAutoreleasedReturnValue();
LABEL_20:
            v21 = (void *)v20;

            v17 = v21;
            break;
          default:
            break;
        }
      }
    }
    objc_msgSend(v13, "setUnderlineColor:", v17, v22, v23, v24);

  }
  return v13;
}

- (CGRect)convertedSelectionRect:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
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
  CGRect result;

  v4 = a3;
  -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[_UITextChoiceAccelerationAssistant activateUnderlineViewIfNeeded](self, "activateUnderlineViewIfNeeded"),
        -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "rect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textInputView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:fromView:", v15, v7, v9, v11, v13);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

  }
  else
  {
    v17 = *MEMORY[0x1E0C9D628];
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)defaultUnderlineColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v15;
  void *v16;
  _QWORD v18[6];
  double v19;
  double v20;
  uint64_t v21;

  +[UIKeyboard currentDocumentState](UIKeyboard, "currentDocumentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrectTextBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "insertionPointColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v5, "cgColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  -[_UITextChoiceAccelerationAssistant _document](self, "_document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertionPointColor");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_UITextChoiceAccelerationAssistant textInputView](self, "textInputView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tintColor");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = (void *)v10;

    if (v6)
      goto LABEL_9;
  }
  +[UIColor insertionPointColor](UIColor, "insertionPointColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v21 = 0;
  v19 = 0.0;
  v20 = 0.0;
  if (objc_msgSend(v6, "getHue:saturation:brightness:alpha:", &v21, &v20, &v19, 0))
  {
    v12 = v19 * (v20 * -0.5 + 1.0);
    v13 = 0.0;
    if (v12 != 0.0 && v12 != 1.0)
      v13 = (v19 - v12) / fmin(v12, 1.0 - v12) * 1.2;
    v20 = fmin(v13, 1.0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59___UITextChoiceAccelerationAssistant_defaultUnderlineColor__block_invoke;
    v18[3] = &__block_descriptor_48_e36___UIColor_16__0__UITraitCollection_8l;
    v18[4] = v21;
    *(double *)&v18[5] = v20;
    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v18);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.4);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

  return v16;
}

- (void)updateSelectionHighlights
{
  UITextInteractionAssistant **p_interactionAssistant;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  _UIAssertion *v9;
  _UIAssertion *textChoiceInteractionGrabberSuppressionAssertion;
  id obj;

  p_interactionAssistant = &self->_interactionAssistant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);

  if (WeakRetained)
  {
    -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "obtainSelectionGrabberSuppressionAssertion");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained((id *)p_interactionAssistant);
    objc_msgSend(v6, "setGrabberSuppressionAssertion:", obj);

    objc_storeWeak((id *)&self->_grabberSuppressionAssertion, obj);
    v7 = objc_loadWeakRetained((id *)p_interactionAssistant);
    objc_msgSend(v7, "setNeedsSelectionDisplayUpdate");

  }
  else
  {
    v8 = objc_loadWeakRetained((id *)&self->_textInputResponder);

    if (!v8)
      return;
    -[_UITextChoiceAccelerationAssistant selectionViewManager](self, "selectionViewManager");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "_obtainGrabberSuppressionAssertion");
    v9 = (_UIAssertion *)objc_claimAutoreleasedReturnValue();
    textChoiceInteractionGrabberSuppressionAssertion = self->_textChoiceInteractionGrabberSuppressionAssertion;
    self->_textChoiceInteractionGrabberSuppressionAssertion = v9;

    objc_msgSend(obj, "setNeedsSelectionUpdate");
    -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdate](self, "setNeedsUnderlineUpdate");
  }

}

- (id)textHighlightColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;

  +[UIKeyboard currentDocumentState](UIKeyboard, "currentDocumentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrectTextBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "autocorrectTextBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v5, "cgColor"));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v6;
    goto LABEL_6;
  }
  -[_UITextChoiceAccelerationAssistant _document](self, "_document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionHighlightColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[UIColor selectionHighlightColor](UIColor, "selectionHighlightColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[_UITextChoiceAccelerationAssistant textInputView](self, "textInputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dbl_18667AE20[objc_msgSend(v13, "userInterfaceStyle") == 2];

  -[_UITextChoiceAccelerationAssistant textInputView](self, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_7:

  return v9;
}

- (BOOL)autocorrectInlinePromptIsVisible
{
  _BOOL4 v3;

  v3 = -[_UITextChoiceAccelerationAssistant showingAutocorrectInlinePrompt](self, "showingAutocorrectInlinePrompt");
  if (v3)
    LOBYTE(v3) = -[_UITextChoiceAccelerationAssistant promptIsVisible](self, "promptIsVisible");
  return v3;
}

- (BOOL)showingPrompt
{
  BOOL v3;
  id WeakRetained;

  if (-[_UITextChoiceAccelerationAssistant showingAutocorrectInlinePrompt](self, "showingAutocorrectInlinePrompt"))
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabberSuppressionAssertion);
  v3 = WeakRetained
    || self->_textChoiceInteractionGrabberSuppressionAssertion
    || -[_UITextChoiceAccelerationAssistant promptIsVisible](self, "promptIsVisible");

  return v3;
}

- (BOOL)showingPromptsIncludingDictationChoices
{
  BOOL v3;
  void *v4;

  if (-[_UITextChoiceAccelerationAssistant showingAutocorrectInlinePrompt](self, "showingAutocorrectInlinePrompt")
    || -[_UITextChoiceAccelerationAssistant promptIsVisible](self, "promptIsVisible"))
  {
    return 1;
  }
  -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (void)setupPassthroughContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _UITextChoiceAccelerationPassthroughView *v7;
  _UITextChoiceAccelerationPassthroughView *v8;
  id v9;

  -[_UITextChoiceAccelerationAssistant passthroughContainer](self, "passthroughContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_UITextChoiceAccelerationAssistant textInputView](self, "textInputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyWindow");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v7 = [_UITextChoiceAccelerationPassthroughView alloc];
      objc_msgSend(v9, "bounds");
      v8 = -[_UITextChoiceAccelerationPassthroughView initWithFrame:delegate:](v7, "initWithFrame:delegate:", self);
      -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
      objc_msgSend(v9, "addSubview:", v8);
      -[_UITextChoiceAccelerationAssistant setPassthroughContainer:](self, "setPassthroughContainer:", v8);

    }
  }
}

- (void)didRecognizeDismissal
{
  void *v3;

  if (-[_UITextChoiceAccelerationAssistant keepPromptActive](self, "keepPromptActive"))
  {
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "acceptAutocorrectionWithCompletionHandler:", 0);
LABEL_6:

    goto LABEL_7;
  }
  if (-[_UITextChoiceAccelerationAssistant dismissIfPresented](self, "dismissIfPresented"))
  {
    -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[_UITextChoiceAccelerationAssistant removeWordForRange:animated:](self, "removeWordForRange:animated:", v3, 0);
    goto LABEL_6;
  }
LABEL_7:
  -[_UITextChoiceAccelerationAssistant resetDictationChoices](self, "resetDictationChoices");
}

- (BOOL)showPromptForReplacementCandidate:(id)a3
{
  return -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:delay:](self, "showPromptForReplacementCandidate:delay:", a3, 0.0);
}

- (BOOL)showPromptForReplacementCandidate:(id)a3 delay:(double)a4
{
  return -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:originalCandidate:delay:](self, "showPromptForReplacementCandidate:originalCandidate:delay:", a3, 0, a4);
}

- (BOOL)showPromptForReplacementCandidate:(id)a3 originalCandidate:(id)a4 delay:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void (**v43)(void *, _QWORD);
  void *v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  id v52;
  _UITextChoiceAccelerationAssistant *v53;
  id v54;
  id v55;
  id v56;

  v8 = a3;
  v9 = a4;
  -[_UITextChoiceAccelerationAssistant updateSelectionHighlights](self, "updateSelectionHighlights");
  -[_UITextChoiceAccelerationAssistant setKeepPromptActive:](self, "setKeepPromptActive:", 0);
  -[_UITextChoiceAccelerationAssistant parentViewForPrompt](self, "parentViewForPrompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v30 = 0;
    goto LABEL_38;
  }
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_convertVisualAltitude:toView:", v12, 0.0);
  objc_msgSend(v11, "_setVisualAltitude:");

  objc_msgSend(v8, "rangeInDocument");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "underlines");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(v8, "documentTextToReplace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant underlineRectsForInput:](self, "underlineRectsForInput:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v16, "count"))
    {
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textInRange:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 && objc_msgSend(v18, "length"))
      {
        -[_UITextChoiceAccelerationAssistant underlineRectsForInput:](self, "underlineRectsForInput:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v19;
      }

    }
    v14 = v16;
  }
  if (!v14 || !objc_msgSend(v14, "count"))
  {
    -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activeSelectionController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "selection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "underlineRectsForRange:", v13);
      v24 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v24;
    }
  }
  if (-[_UITextChoiceAccelerationAssistant usingCustomInteraction](self, "usingCustomInteraction"))
  {
    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "selectionRectsForRange:", v13);
      v27 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v27;
    }
  }
  if (!v14 || !objc_msgSend(v14, "count"))
  {
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "asyncInputDelegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {

    }
    else
    {
      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "webInputDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "asyncWebKitInteractionDelegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "webSelectionRects");
        v38 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "inputDelegateManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "selectedTextRange");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
LABEL_26:

      goto LABEL_27;
    }
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "inputDelegateManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "selectionRectsForRange:", v35);
    v38 = objc_claimAutoreleasedReturnValue();

    v14 = v37;
LABEL_25:

    v14 = (void *)v38;
    goto LABEL_26;
  }
LABEL_27:
  if (objc_msgSend(v14, "count")
    && (objc_msgSend(v14, "firstObject"), (v39 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v40 = (void *)v39;
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __96___UITextChoiceAccelerationAssistant_showPromptForReplacementCandidate_originalCandidate_delay___block_invoke;
    v50 = &unk_1E16C71C8;
    v51 = v8;
    v52 = v9;
    v53 = self;
    v41 = v13;
    v54 = v41;
    v55 = v10;
    v42 = v40;
    v56 = v42;
    v43 = (void (**)(void *, _QWORD))_Block_copy(&v47);
    -[_UITextChoiceAccelerationAssistant cancelPromptDisplay](self, "cancelPromptDisplay", v47, v48, v49, v50);
    if (a5 <= 0.0)
    {
      v43[2](v43, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v43, a5);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant setPromptDisplayTimer:](self, "setPromptDisplayTimer:", v44);

    }
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
      || -[_UITextChoiceAccelerationAssistant usingCustomInteraction](self, "usingCustomInteraction"))
    {
      -[_UITextChoiceAccelerationAssistant removeWordForRange:](self, "removeWordForRange:", v41);
    }
    -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 1;
    objc_msgSend(v45, "removeUnderlines:animated:", v14, 1);

  }
  else
  {
    v30 = 0;
  }

LABEL_38:
  return v30;
}

- (BOOL)showChoicesForAutocorrectionCandidate:(id)a3 range:(id)a4
{
  return -[_UITextChoiceAccelerationAssistant showChoicesForAutocorrectionCandidate:range:delay:](self, "showChoicesForAutocorrectionCandidate:range:delay:", a3, a4, 0.0);
}

- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (objc_msgSend(v6, "length"))
    {
      v8 = objc_msgSend(v6, "length");
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:offset:", v7, -v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textRangeFromPosition:toPosition:", v10, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "textInRange:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "isEqualToString:", v6))
            v15 = v12;
          else
            v15 = 0;

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textRangeFromPosition:toPosition:", v7, v7);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)showChoicesForAutocorrectionCandidate:(id)a3 range:(id)a4 delay:(double)a5
{
  TIKeyboardCandidate *v9;
  id v10;
  TIKeyboardCandidate **p_candidate;
  BOOL v12;
  void *v13;
  TIKeyboardCandidate *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  TIKeyboardCandidate *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  BOOL v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  char v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  TIKeyboardCandidate *v80;
  void *v81;
  _UITextChoiceAccelerationAssistant *v82;
  _UITextChoiceAccelerationAssistant *v83;
  int v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v9 = (TIKeyboardCandidate *)a3;
  v10 = a4;
  p_candidate = &self->_candidate;
  if (self->_candidate == v9)
  {
    -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "candidate");
    v14 = (TIKeyboardCandidate *)objc_claimAutoreleasedReturnValue();
    if (v14 == v9)
    {
      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16 != 0;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  -[TIKeyboardCandidate candidate](v9, "candidate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || v12)
  {
    -[_UITextChoiceAccelerationAssistant dismissWithoutSelection](self, "dismissWithoutSelection");
LABEL_25:
    v32 = 0;
    goto LABEL_26;
  }
  if (objc_msgSend(v10, "isEmpty"))
  {
    objc_msgSend(v10, "start");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant rangeForTextChoicesAtPosition:](self, "rangeForTextChoicesAtPosition:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && (objc_msgSend(v19, "isEmpty") & 1) == 0)
    {
      v22 = v10;
      v10 = v19;
    }
    else
    {
      -[TIKeyboardCandidate candidate](v9, "candidate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "start");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant _rangeOfText:endingAtPosition:](self, "_rangeOfText:endingAtPosition:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = v22;

        v10 = v23;
      }
      else if (!v10)
      {
        goto LABEL_18;
      }
      if (objc_msgSend(v10, "isEmpty"))
      {
LABEL_18:
        v24 = v10;
        v25 = v9;
        v82 = self;
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "tokenizer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24;
        objc_msgSend(v24, "start");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "rangeEnclosingPosition:withGranularity:inDirection:", v29, 1, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30 && (objc_msgSend(v30, "isEmpty") & 1) == 0)
        {
          v31 = v30;

          v28 = v31;
        }
        v9 = v25;

        v10 = v28;
        self = v82;
      }
    }

  }
  if (!v10 || (objc_msgSend(v10, "isEmpty") & 1) != 0)
    goto LABEL_25;
  objc_storeStrong((id *)p_candidate, a3);
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[_UITextChoiceAccelerationAssistant updateSelectionHighlights](self, "updateSelectionHighlights");
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "presentTextChoicePromptForRange:", v10);

    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKey:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[_UITextChoiceAccelerationAssistant removeWordForRange:](self, "removeWordForRange:", v10);
      -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "underlines");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeUnderlines:animated:", v39, 1);

    }
    -[_UITextChoiceAccelerationAssistant cancelPromptDisplay](self, "cancelPromptDisplay");

    v32 = 1;
    goto LABEL_26;
  }
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setCandidate:", v9);

  -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "keyboardState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "secureCandidateRenderTraits");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "singleCellHeight");
  v45 = v44;
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setSecureCandidateHeight:", v45);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidate candidate](v9, "candidate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant listForFinalString:](self, "listForFinalString:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextChoiceAccelerationAssistant alternateCorrectionsForList:](self, "alternateCorrectionsForList:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidate input](v9, "input");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "length");

  if (v52)
  {
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "textInRange:", v10);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardCandidate input](v9, "input");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isEqualToString:", v54);

    if (v56)
    {
      -[TIKeyboardCandidate candidate](v9, "candidate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isEqualToString:", v54);

      if ((v58 & 1) != 0)
      {
        v84 = 0;
LABEL_39:

        goto LABEL_40;
      }
      -[TIKeyboardCandidate candidate](v9, "candidate");
      v59 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TIKeyboardCandidate input](v9, "input");
      v59 = objc_claimAutoreleasedReturnValue();
    }
    v60 = (void *)v59;
    objc_msgSend(v47, "addObject:", v59);

    v84 = 1;
    goto LABEL_39;
  }
  v84 = 0;
LABEL_40:
  v81 = v49;
  if (objc_msgSend(v50, "count"))
  {
    v83 = self;
    v80 = v9;
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v79 = v50;
    v61 = v50;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
    if (v62)
    {
      v63 = v62;
      v64 = 0;
      v65 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v86 != v65)
            objc_enumerationMutation(v61);
          v67 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          if (objc_msgSend(v67, "isAlternativeInput"))
          {
            objc_msgSend(v67, "candidate");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v68;
            LOBYTE(v84) = 1;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
            v69 = objc_claimAutoreleasedReturnValue();

            v64 = (void *)v69;
          }
          objc_msgSend(v67, "candidate");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v70);

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
      }
      while (v63);
    }
    else
    {
      v64 = 0;
    }

    self = v83;
    v84 = v84 & ((unint64_t)objc_msgSend(v47, "count") < 2);
    v9 = v80;
    v49 = v81;
    v50 = v79;
  }
  else
  {
    v64 = 0;
  }
  -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v10);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKey:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v73)
  {
    -[TIKeyboardCandidate candidate](v9, "candidate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidate input](v9, "input");
    v75 = v50;
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIReplacementCandidate candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:](_UIReplacementCandidate, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:", v74, v76, 0, v10, 1, 0, 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = v75;
    v49 = v81;

  }
  if (objc_msgSend(v47, "count"))
    v77 = 1;
  else
    v77 = 2;
  objc_msgSend(v73, "setPreferredPromptStyle:", v77);
  if (v84)
    v78 = 2;
  else
    v78 = 0;
  objc_msgSend(v73, "setPreferredPromptButton:", v78);
  if (v73 && objc_msgSend(v47, "count"))
    objc_msgSend(v73, "setTextChoices:", v47);
  objc_msgSend(v73, "setAlternativeRevertTexts:", v64);
  v32 = -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:delay:](self, "showPromptForReplacementCandidate:delay:", v73, a5);

LABEL_26:
  return v32;
}

- (void)clearSecureCandidateHashes
{
  NSArray *secureCandidateHashes;

  secureCandidateHashes = self->_secureCandidateHashes;
  self->_secureCandidateHashes = 0;

}

- (BOOL)showChoicesForCandidates:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    v5 = -[_UITextChoiceAccelerationAssistant _tryShowChoicesForTextSuggestionsOrSecureCandidates:](self, "_tryShowChoicesForTextSuggestionsOrSecureCandidates:", v4)|| -[_UITextChoiceAccelerationAssistant _tryShowChoicesForSmartReplies:](self, "_tryShowChoicesForSmartReplies:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_tryShowChoicesForTextSuggestionsOrSecureCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _OWORD v41[3];
  void *v42;
  __CFString *v43;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "slotID"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _secureCandidateHashForCandidate(v5));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("secure text");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v5, "customInfoType") == 32)
      {
        v7 = 0;
        v8 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v5, "textSuggestion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "headerText");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "headerText");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "displayText");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("%@\n%@"), v38, v39);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "displayText");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      if (!-[__CFString length](v8, "length"))
      {

        v7 = 0;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFString hash](v8, "hash"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!-[NSArray isEqualToArray:](self->_secureCandidateHashes, "isEqualToArray:", v7))
    {
      objc_storeStrong((id *)&self->_secureCandidateHashes, v7);
      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCandidate:", v5);

      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyboardState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "secureCandidateRenderTraits");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "singleCellHeight");
      v14 = v13;
      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSecureCandidateHeight:", v14);

      v43 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activeSelection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "selectedRange");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIReplacementCandidate candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:](_UIReplacementCandidate, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:", &stru_1E16EDF20, &stru_1E16EDF20, v16, v19, 0, 1, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activeSelection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "caretRect");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v41[0] = *MEMORY[0x1E0C9BAA8];
      v41[1] = v31;
      v41[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", v41, v24, v26, v28, v30, 0.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUnderlines:", v33);

      v34 = -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:](self, "showPromptForReplacementCandidate:", v20);
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v34 = 0;
    goto LABEL_11;
  }
  v34 = 0;
LABEL_12:

  return v34;
}

- (BOOL)_tryShowChoicesForSmartReplies:(id)a3
{
  id v4;
  void *v5;
  int IsSmartReply;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _UITextChoiceAccelerationAssistant *v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsSmartReply = _candidateSourceIsSmartReply(v5);

  if (IsSmartReply)
  {
    v43 = self;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v48 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if (_candidateSourceIsSmartReply(v14))
          {
            objc_msgSend(v7, "addObject:", v14);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _secureCandidateHashForCandidate(v14));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v11);
    }

    if (-[NSArray isEqualToArray:](v43->_secureCandidateHashes, "isEqualToArray:", v8))
    {
      v16 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v43->_secureCandidateHashes, v8);
      objc_msgSend(v9, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "input");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = (__CFString *)v18;
      else
        v20 = &stru_1E16EDF20;
      v21 = v20;

      -[_UITextChoiceAccelerationAssistant interactionAssistant](v43, "interactionAssistant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activeSelection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "selectedRange");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      +[_UIReplacementCandidate candidateForDocumentText:revertText:candidateChoices:range:underlineStyle:promptStyle:promptButton:](_UIReplacementCandidate, "candidateForDocumentText:revertText:candidateChoices:range:underlineStyle:promptStyle:promptButton:", v21, &stru_1E16EDF20, v7, v24, 0, 2, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UITextChoiceAccelerationAssistant interactionAssistant](v43, "interactionAssistant");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "activeSelection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "caretRect");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;

      v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
      v45 = v36;
      v46 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", buf, v29, v31, v33, v35, 0.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setUnderlines:", v38);

      -[_UITextChoiceAccelerationAssistant prompt](v43, "prompt");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setCandidate:", 0);

      -[_UITextChoiceAccelerationAssistant prompt](v43, "prompt");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setReplacement:", v25);

      v16 = -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:](v43, "showPromptForReplacementCandidate:", v25);
      _UIKeyboardSmartReplyLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_DEFAULT, "Text choice assistant is showing prompt for smart reply candidates", buf, 2u);
      }

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)showChoicesForTextInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCandidate:", 0);

    -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReplacement:", v7);

    objc_msgSend(v7, "textChoices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v7, "revertText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTextChoices:", v12);

    }
    v13 = -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:](self, "showPromptForReplacementCandidate:", v7);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)showDictationChoicesForTextInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[_UITextChoiceAccelerationAssistant underlinedWordDataForDictation](self, "underlinedWordDataForDictation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:](self, "showPromptForReplacementCandidate:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)showChoicesForTextInRange:(id)a3 withReplacements:(id)a4 delay:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "originalText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replacementText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIReplacementCandidate candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:](_UIReplacementCandidate, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:", v12, v13, 0, v8, 0, 1, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "replacementText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v11, "replacementText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v17);

      }
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        v18 = 1;
        do
        {
          objc_msgSend(v9, "objectAtIndex:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "replacementText");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v19, "replacementText");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v21);

          }
          ++v18;
        }
        while (v18 < objc_msgSend(v9, "count"));
      }
      objc_msgSend(v14, "setTextChoices:", v15);
      objc_msgSend(v14, "setPreferredPromptButton:", 0);
      objc_msgSend(v14, "setPreferredPromptStyle:", 2);

    }
    v22 = -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:delay:](self, "showPromptForReplacementCandidate:delay:", v14, a5);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)showAutocorrectReplacementChoicesIfNeeded:(id)a3 forRange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;

  v6 = a4;
  +[UITextReplacementGeneratorForCorrections generatorForTextInput:range:options:](UITextReplacementGeneratorForCorrections, "generatorForTextInput:range:options:", a3, v6, 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_12;
  if ((objc_msgSend(v7, "isStringToReplaceMisspelled") & 1) == 0)
    objc_msgSend(v8, "forceAutocorrectionGuesses");
  objc_msgSend(v8, "autocorrectionRecord");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9 && (v10 = (void *)v9, v11 = objc_msgSend(v8, "forceAutocorrectionGuesses"), v10, v11))
  {
    objc_msgSend(v8, "autocorrectionRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_UITextChoiceAccelerationAssistant showChoicesForAutocorrectionCandidate:range:delay:](self, "showChoicesForAutocorrectionCandidate:range:delay:", v12, v6, 0.2);
  }
  else
  {
    if (!objc_msgSend(v8, "forceAutocorrectionGuesses"))
    {
LABEL_11:
      -[_UITextChoiceAccelerationAssistant dismissWithoutSelection](self, "dismissWithoutSelection");
LABEL_12:
      v15 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v8, "replacements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_UITextChoiceAccelerationAssistant showChoicesForTextInRange:withReplacements:delay:](self, "showChoicesForTextInRange:withReplacements:delay:", v6, v12, 0.2);
  }
  v14 = v13;

  if (!v14)
    goto LABEL_11;
  v15 = 1;
LABEL_13:

  return v15;
}

- (void)updatePrompt:(id)a3 forReplacementCandidate:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "preferredPromptButton");
    v8 = CFSTR("arrow.uturn.backward");
    v9 = 1;
    switch(v7)
    {
      case 0:
        v9 = 0;
        v8 = &stru_1E16EDF20;
        break;
      case 1:
        goto LABEL_6;
      case 3:
        v7 = 2;
LABEL_6:
        v8 = CFSTR("xmark");
        v9 = v7;
        break;
      case 4:
        v9 = 2;
        break;
      case 5:
        if (objc_msgSend(v11, "labelNumber"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.circle.fill"), objc_msgSend(v11, "labelNumber"));
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = &stru_1E16EDF20;
        }
        v9 = 3;
        break;
      default:
        break;
    }
    objc_msgSend(v11, "updateButtonForType:", objc_msgSend(v6, "preferredPromptButton"));
  }
  else
  {
    v8 = CFSTR("arrow.uturn.backward");
    v9 = 1;
  }
  objc_msgSend(v6, "revertText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateButtonName:placement:originalText:", v8, v9, v10);

}

- (id)rangeForTextChoicesAtPosition:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
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
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[_UITextChoiceAccelerationAssistant _document](self, "_document");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "start");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "comparePosition:toPosition:", v4, v12);

          if (v13 != -1)
          {
            -[_UITextChoiceAccelerationAssistant _document](self, "_document");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "end");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "comparePosition:toPosition:", v4, v15);

            if (v16 != 1)
            {
              v17 = v10;

              v7 = v17;
            }
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateDictationChoicesFromPromptIndex:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a4;
  if (a3 == -1)
  {
    -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a3 < 1;
    v8 = a3 - 1;
    if (v7
      || (-[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v8 >= v10))
    {
      _UIKeyboardLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Attempted to update out of bound dictation prompts", v14, 2u);
      }
      goto LABEL_10;
    }
    -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  if (v13)
  {
    -[_UITextChoiceAccelerationAssistant updateDocumentFromPrompt:completionHandler:](self, "updateDocumentFromPrompt:completionHandler:", v13, v6);
LABEL_10:

  }
}

- (void)updateDocumentFromPrompt:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  unint64_t v132;
  void *v133;
  unint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  int v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  uint8_t buf[16];
  void *v147;
  _QWORD v148[3];

  v148[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[_UITextChoiceAccelerationAssistant cancelPromptDisplay](self, "cancelPromptDisplay");
  -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleTextChoiceBubbleTapped");

  objc_msgSend(v6, "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "slotID"))
  {
    objc_msgSend(v6, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_4;
    objc_msgSend(v6, "selectedCandidateChoice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (_candidateSourceIsSmartReply(v16))
    {
      _UIKeyboardSmartReplyLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Text choice assistant is accepting smart reply candidate", buf, 2u);
      }

      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "acceptPredictiveInput:", v16);
LABEL_53:

      goto LABEL_5;
    }
    -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEmpty") & 1) == 0)
    {
      v19 = v18;
      if (v18)
      {
LABEL_21:
        -[_UITextChoiceAccelerationAssistant _document](self, "_document");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "textInRange:", v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v6, "shouldRejectCandidate"))
        {
          objc_msgSend(v6, "selectedChoice");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "isEqualToString:", CFSTR("autocorrection.cancel")))
          {

LABEL_25:
            -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "fadeAutocorrectPrompt");

            +[UIKBAnalyticsDispatcher didRevisionBubbleTap](UIKBAnalyticsDispatcher, "didRevisionBubbleTap");
            goto LABEL_50;
          }
          v30 = -[_UITextChoiceAccelerationAssistant keepPromptActive](self, "keepPromptActive");

          if (v30)
            goto LABEL_25;
        }
        else if (-[_UITextChoiceAccelerationAssistant keepPromptActive](self, "keepPromptActive"))
        {
          goto LABEL_25;
        }
        v145 = v27;
        if (objc_msgSend(v6, "promptStyle") == 3)
        {
          objc_msgSend(v6, "replacement");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "rangeInDocument");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v6, "replacement");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "textChoices");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = objc_msgSend(v35, "isEqualToString:", 0x1E1749840);

            objc_msgSend(v6, "replacement");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "textChoices");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = objc_msgSend(v38, "isEqualToString:", 0x1E1749860);

            -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UITextChoiceAccelerationAssistant _document](self, "_document");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = objc_msgSend(v40, "_nsrangeForTextRange:", v39);
            v136 = v41;

            -[_UITextChoiceAccelerationAssistant _document](self, "_document");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "replacement");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "rangeInDocument");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = objc_msgSend(v42, "_nsrangeForTextRange:", v44);
            v125 = v45;

            objc_msgSend(v6, "replacement");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "voiceCommandDisambiguationSelectedIndex");
            v142 = (void *)objc_claimAutoreleasedReturnValue();

            if (v138)
            {
              -[_UITextChoiceAccelerationAssistant _document](self, "_document");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "replacement");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "rangeInDocument");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setSelectedTextRange:", v49);

            }
            else if (v127)
            {
              -[_UITextChoiceAccelerationAssistant _document](self, "_document");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "replacement");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "rangeInDocument");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setSelectedTextRange:", v74);

              -[_UITextChoiceAccelerationAssistant _document](self, "_document");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v140 = objc_msgSend(v75, "_nsrangeForTextRange:", v76);
              v129 = v77;

              -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "deleteBackward");

              -[_UITextChoiceAccelerationAssistant _document](self, "_document");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(v79, "_nsrangeForTextRange:", v80);

              -[_UITextChoiceAccelerationAssistant _document](self, "_document");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v113) = v134 > v132;
              -[_UITextChoiceAccelerationAssistant restoreInsertionPointPositionWithDocument:originalPositionRange:targetRange:payloadRange:contextBefore:](self, "restoreInsertionPointPositionWithDocument:originalPositionRange:targetRange:payloadRange:contextBefore:", v82, v134, v136, 0, v140 + v129 - v81, 0, 0, v113);

            }
            else
            {
              v119 = v39;
              objc_msgSend(v6, "replacement");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "textChoices");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "objectAtIndexedSubscript:", 0);
              v85 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "replacement");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "rangeInDocument");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "replacement");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "documentTextToReplace");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = (void *)v85;
              +[UITextReplacement replacementWithRange:original:replacement:menuTitle:isDictationCommandReplacement:](UITextReplacement, "replacementWithRange:original:replacement:menuTitle:isDictationCommandReplacement:", v86, v88, v85, v85, 1);
              v89 = objc_claimAutoreleasedReturnValue();

              -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = (void *)v89;
              objc_msgSend(v90, "replaceText:", v89);

              objc_msgSend(v6, "replacement");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "revertText");
              v92 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "replacement");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "textChoices");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "firstObject");
              v122 = (void *)objc_claimAutoreleasedReturnValue();

              v95 = objc_msgSend(v141, "length");
              v124 = v92;
              v96 = v95 - objc_msgSend(v92, "length");
              objc_msgSend(v6, "replacement");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "rangeInDocument");
              v98 = (void *)objc_claimAutoreleasedReturnValue();

              -[_UITextChoiceAccelerationAssistant _document](self, "_document");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "end");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "positionFromPosition:offset:", v100, v96);
              v131 = (void *)objc_claimAutoreleasedReturnValue();

              -[_UITextChoiceAccelerationAssistant _document](self, "_document");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = v98;
              objc_msgSend(v98, "start");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "textRangeFromPosition:toPosition:", v102, v131);
              v103 = (void *)objc_claimAutoreleasedReturnValue();

              if (v103)
              {
                objc_msgSend(v6, "replacement");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "voiceCommandTrackingUUID");
                v105 = (void *)objc_claimAutoreleasedReturnValue();

                -[_UITextChoiceAccelerationAssistant resetDictationChoices](self, "resetDictationChoices");
                v148[0] = v124;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 1);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UITextChoiceAccelerationAssistant underlineTextInRange:revertText:textChoices:isActiveEditingSession:](self, "underlineTextInRange:revertText:textChoices:isActiveEditingSession:", v103, v124, v106, 1);

                v147 = v103;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UITextChoiceAccelerationAssistant decorateTextInRanges:replacementText:allowAutomaticReplacement:autoHide:voiceCommandTrackingUUID:withCompletionHandler:](self, "decorateTextInRanges:replacementText:allowAutomaticReplacement:autoHide:voiceCommandTrackingUUID:withCompletionHandler:", v107, v122, 0, 1, v105, v7);

              }
              -[_UITextChoiceAccelerationAssistant _document](self, "_document");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v113) = v134 > v132;
              -[_UITextChoiceAccelerationAssistant restoreInsertionPointPositionWithDocument:originalPositionRange:targetRange:payloadRange:contextBefore:](self, "restoreInsertionPointPositionWithDocument:originalPositionRange:targetRange:payloadRange:contextBefore:", v108, v134, v136, v132, v125, 0, objc_msgSend(v141, "length"), v113);

              v39 = v119;
            }
            v27 = v145;
            if (v7)
              v7[2](v7, v142);
            -[_UITextChoiceAccelerationAssistant resetDictationChoices](self, "resetDictationChoices");

            goto LABEL_50;
          }
          +[UIDictationController activeInstance](UIDictationController, "activeInstance");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v6, "deltaRange");
          v126 = v66;
          v128 = v65;
          objc_msgSend(v6, "replacement");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "documentTextToReplace");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "replacement");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "textChoices");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "objectAtIndexedSubscript:", 0);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v6, "originalSelectedRange");
          v118 = v68;
          v120 = v67;
          objc_msgSend(v6, "replacement");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "voiceCommandDisambiguationSelectedIndex");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "replacement");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "voiceCommandDisambiguationTargetCount");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "replacement");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "voiceCommandTrackingUUID");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "performTextReplacementForWebKitWithDeltaRange:targetText:replacementText:originalSelectedRange:voiceCommandDisambiguationSelectedIndex:voiceCommandDisambiguationTargetCount:voiceCommandUUID:completionHandler:", v128, v126, v139, v121, v120, v118, v114, v69, v71, v7);

          -[_UITextChoiceAccelerationAssistant resetDictationChoices](self, "resetDictationChoices");
        }
        else
        {
          objc_msgSend(v6, "candidate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "candidate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v143 = v51;
          if (objc_msgSend(v51, "length"))
          {
            objc_msgSend(v18, "end");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UITextChoiceAccelerationAssistant _rangeOfText:endingAtPosition:](self, "_rangeOfText:endingAtPosition:", v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53 && (objc_msgSend(v53, "isEmpty") & 1) == 0)
            {
              v54 = v53;

              v55 = v51;
              v145 = v55;
              v19 = v54;
            }

          }
          objc_msgSend(v6, "selectedChoice");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "selectedChoice");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          +[UITextReplacement replacementWithRange:original:replacement:menuTitle:](UITextReplacement, "replacementWithRange:original:replacement:menuTitle:", v19, v145, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UITextChoiceAccelerationAssistant informAnalyticsOfUpcomingCandidateReplacement](self, "informAnalyticsOfUpcomingCandidateReplacement");
          -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "replaceText:", v58);

          if (objc_msgSend(v6, "shouldRejectCandidate"))
          {
            -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "candidate");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "rejectAutocorrection:", v61);

          }
          -[_UITextChoiceAccelerationAssistant informAnalyticsOfCompletedCandidateReplacement](self, "informAnalyticsOfCompletedCandidateReplacement");
          +[UIDictationController activeInstance](UIDictationController, "activeInstance");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "replacement");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "voiceCommandTrackingUUID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "markDictationUndoEventWithVoiceCommandUUID:viaTapOnRevertBubble:", v64, 1);

        }
        v27 = v145;
LABEL_50:
        -[_UITextChoiceAccelerationAssistant removeWordForRange:](self, "removeWordForRange:", v19);
        if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
        {
          v109 = objc_msgSend(v27, "length");
          objc_msgSend(v6, "selectedChoice");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = v109 - objc_msgSend(v110, "length");

          objc_msgSend(v19, "start");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationAssistant adjustRangesAfterPosition:byOffset:](self, "adjustRangesAfterPosition:byOffset:", v112, v111);

        }
        goto LABEL_53;
      }
    }
    objc_msgSend(v18, "start");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant rangeForTextChoicesAtPosition:](self, "rangeForTextChoicesAtPosition:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) == 0)
      {
        v21 = 0;
        goto LABEL_19;
      }
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "end");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_rangeOfEnclosingWord:", v25);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_19;
    }
    if ((objc_msgSend(v21, "isEmpty") & 1) == 0)
    {
      v21 = v21;

      v19 = v21;
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    v19 = v18;
    goto LABEL_20;
  }

LABEL_4:
  -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authenticationMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_attemptAuthenticationWithMessage:", v13);

  -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "acceptPredictiveInput:", v15);

LABEL_5:
}

- (void)informAnalyticsOfUpcomingCandidateReplacement
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;

  +[UIKBAnalyticsDispatcher didRevisionBubbleTap](UIKBAnalyticsDispatcher, "didRevisionBubbleTap");
  +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNextCandidateReplacementSource:", 8);

  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonType");

  if (v5 == 1)
  {
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("reversionBubble");
  }
  else
  {
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v7 = CFSTR("revisionBubble");
    else
      v7 = CFSTR("autocorrectionBubble");
  }
  v8 = v6;
  objc_msgSend(v6, "acceptingCandidateWithTrigger:", v7);

}

- (void)informAnalyticsOfCompletedCandidateReplacement
{
  id v2;

  +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNextCandidateReplacementSource:", 0);

}

- (id)activeSelectedRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeSelection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[_UITextChoiceAccelerationAssistant interactionAssistant](self, "interactionAssistant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeSelectionController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selection");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "selectedRange");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTextRange");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;

  return v11;
}

- (void)removeWordForRange:(id)a3
{
  -[_UITextChoiceAccelerationAssistant removeWordForRange:animated:](self, "removeWordForRange:animated:", a3, 1);
}

- (void)removeWordForRange:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a4;
  v27 = a3;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInRange:", v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITextChoiceAccelerationAssistant candidateForFinalString:](self, "candidateForFinalString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_UITextChoiceAccelerationAssistant savedLists](self, "savedLists");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v7);

    }
  }
  -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v27);

  -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v11);

    -[_UITextChoiceAccelerationAssistant underlinedWordDataForDictation](self, "underlinedWordDataForDictation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v11);

    -[_UITextChoiceAccelerationAssistant savedLists](self, "savedLists");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentTextToReplace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v17);

    if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "underlines");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeUnderlines:animated:", v19, v4);

      -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdate](self, "setNeedsUnderlineUpdate");
    }
  }
  -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (!v23)
    {
      -[_UITextChoiceAccelerationAssistant textInputResponder](self, "textInputResponder");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "textInputView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant textChoiceInteraction](self, "textChoiceInteraction");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeInteraction:", v26);

    }
  }

}

- (void)dismissWithoutSelection
{
  void *v3;
  id v4;

  -[_UITextChoiceAccelerationAssistant cancelPromptDisplay](self, "cancelPromptDisplay");
  -[_UITextChoiceAccelerationAssistant setKeepPromptActive:](self, "setKeepPromptActive:", 0);
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissTextChoicePrompt");

  }
  -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimated:", 1);

}

- (void)removeActivePromptAndUnderline
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[_UITextChoiceAccelerationAssistant cancelPromptDisplay](self, "cancelPromptDisplay");
  v3 = -[_UITextChoiceAccelerationAssistant promptIsVisible](self, "promptIsVisible");
  -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEmpty"))
  {
    objc_msgSend(v15, "start");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant rangeForTextChoicesAtPosition:](self, "rangeForTextChoicesAtPosition:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_msgSend(v5, "isEmpty") & 1) == 0)
    {
      v6 = v5;

      v15 = v6;
    }

  }
  if ((objc_msgSend(v15, "isEmpty") & 1) == 0)
  {
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant keyFromRange:](self, "keyFromRange:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "underlines");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "underlines");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeUnderlines:animated:", v13, 1);

      }
      -[_UITextChoiceAccelerationAssistant removeWordForRange:](self, "removeWordForRange:", v15);
    }

  }
  if (v3)
  {
    -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAnimated:", 1);

  }
}

- (void)addList:(id)a3 forCandidate:(id)a4
{
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a3;
      objc_msgSend(a4, "candidate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant savedLists](self, "savedLists");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v6, v8);

    }
  }
}

- (id)listForFinalString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UITextChoiceAccelerationAssistant savedLists](self, "savedLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)candidateForFinalString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UITextChoiceAccelerationAssistant savedLists](self, "savedLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextChoiceAccelerationAssistant autocorrectionForList:](self, "autocorrectionForList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)alternateCorrectionsForList:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "corrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternateCorrections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)autocorrectionForList:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "corrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)shouldShowPromptForWebKitText:(id)a3 atPosition:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(id, uint64_t);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v10[2](v10, 1);
  }
  else
  {
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputDelegateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "asyncCapableInputDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setSurroundingGranularity:", 0);
      objc_msgSend(v16, "setFlags:", 197);
      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "inputDelegateManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __97___UITextChoiceAccelerationAssistant_shouldShowPromptForWebKitText_atPosition_completionHandler___block_invoke;
      v19[3] = &unk_1E16C71F0;
      v19[4] = self;
      v20 = v8;
      v21 = v9;
      v22 = v10;
      objc_msgSend(v18, "requestDocumentContext:completionHandler:", v16, v19);

    }
    else
    {
      v10[2](v10, 0);
    }
  }

}

- (void)fullAutocorrectionForWord:(id)a3 atPosition:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD aBlock[5];
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __93___UITextChoiceAccelerationAssistant_fullAutocorrectionForWord_atPosition_completionHandler___block_invoke;
    aBlock[3] = &unk_1E16C71F0;
    aBlock[4] = self;
    v26 = v8;
    v27 = v9;
    v13 = v10;
    v28 = v13;
    v24 = _Block_copy(aBlock);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setSurroundingGranularity:", 0);
    objc_msgSend(v14, "setFlags:", 197);
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputDelegateManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "asyncCapableInputDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "inputDelegateManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "asyncCapableInputDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "inputDelegateManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v24;
      objc_msgSend(v22, "requestDocumentContext:completionHandler:", v14, v24);

      if (v20)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
      v23 = v24;
    }
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
    v20 = 0;
    goto LABEL_8;
  }
  (*((void (**)(id, id))v10 + 2))(v10, v8);
LABEL_9:

}

- (id)rangeOfAutocorrectionForString:(id)a3 atPosition:(id)a4 inDocument:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  unint64_t v25;
  unint64_t v26;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "autocorrectedRanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "caretRectForPosition:", v7);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v19 = objc_msgSend(v8, "rangeContainedWithinRect:", v12, v14, v16, v18);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "rangeValue", (_QWORD)v30);
          if (v19 >= v25 && v19 - v25 < v26)
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v25, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v22);
    }
    v28 = 0;
LABEL_15:

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)trackUnderlineForWebKitCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(v4, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant anchorRangeForText:](self, "anchorRangeForText:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UITextChoiceAccelerationAssistant underlinedRanges](self, "underlinedRanges");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

    }
    +[_UIReplacementCandidate candidateForAutocorrectionCandidate:range:](_UIReplacementCandidate, "candidateForAutocorrectionCandidate:range:", v4, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnderlineStyle:", 0);
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

  }
  else
  {
    _UIKeyboardLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Attempted to track underline for empty candidate", v13, 2u);
    }

  }
}

- (BOOL)presentTextChoicePromptForText:(id)a3 delay:(double)a4 autocorrectionRects:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
     || !objc_msgSend(v11, "underlineStyle")))
  {
    -[_UITextChoiceAccelerationAssistant savedLists](self, "savedLists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "documentTextToReplace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "corrections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "autocorrection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "CGRectValue");
      v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v26 = *MEMORY[0x1E0C9BAA8];
      v24 = v26;
      v27 = v25;
      v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v23 = v28;
      +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", &v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGRectValue");
      v26 = v24;
      v27 = v25;
      v28 = v23;
      +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", &v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v29[0] = v18;
      v29[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUnderlines:", v21);

    }
    -[_UITextChoiceAccelerationAssistant showPromptForReplacementCandidate:originalCandidate:delay:](self, "showPromptForReplacementCandidate:originalCandidate:delay:", v11, v16, a4);

  }
  return v11 != 0;
}

- (void)updateReplacements:(id)a3 forCandidate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_msgSend(v23, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITextChoiceAccelerationAssistant anchorRangeForText:](self, "anchorRangeForText:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v11 = objc_msgSend(v23, "count");
      objc_msgSend(v7, "replacementText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 <= 1)
        v13 = 1;
      else
        v13 = 2;
      +[_UIReplacementCandidate candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:](_UIReplacementCandidate, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:", v6, v12, 0, v10, 0, v13, 2 * (v11 < 2));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        v15 = 0;
        do
        {
          objc_msgSend(v23, "objectAtIndex:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "replacementText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "replacementText");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v18);

          }
          ++v15;
        }
        while (v15 < objc_msgSend(v23, "count"));
      }
      if (objc_msgSend(v14, "count"))
        objc_msgSend(v9, "setTextChoices:", v14);

    }
    objc_msgSend(v9, "textChoices");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 <= 1)
      v21 = 1;
    else
      v21 = 2;
    objc_msgSend(v9, "setPreferredPromptStyle:", v21);
    objc_msgSend(v9, "setPreferredPromptButton:", 2 * (v20 < 2));
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v9, v6);

  }
}

- (void)updateReplacementsForSavedCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant listForFinalString:](self, "listForFinalString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant alternateCorrectionsForList:](self, "alternateCorrectionsForList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant autocorrectionForList:](self, "autocorrectionForList:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputDelegateManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asyncCapableInputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "inputDelegateManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectedText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v8, "input");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", v16);

    if (v18)
    {
      objc_msgSend(v8, "candidate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v16);

      if ((v20 & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v8, "candidate");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "input");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    objc_msgSend(v5, "addObject:", v21);

    goto LABEL_10;
  }
LABEL_11:
  if (objc_msgSend(v7, "count"))
  {
    v44 = v8;
    v23 = v4;
    v24 = v6;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v25 = v7;
    v26 = v7;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v47 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "candidate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v28);
    }

    v7 = v25;
    v6 = v24;
    v4 = v23;
    v8 = v44;
  }
  if (objc_msgSend(v5, "count"))
  {
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", v4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      v34 = objc_msgSend(v5, "count");
      -[_UITextChoiceAccelerationAssistant anchorRangeForText:](self, "anchorRangeForText:", v4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v45 = v6;
      v36 = v7;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34 <= 1)
        v38 = 1;
      else
        v38 = 2;
      +[_UIReplacementCandidate candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:](_UIReplacementCandidate, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:", v4, v37, 0, v35, 0, v38, 2 * (v34 < 2));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v36;
      v6 = v45;

    }
    v39 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v33, "setTextChoices:", v39);

    objc_msgSend(v33, "textChoices");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");

    if (v41 <= 1)
      v42 = 1;
    else
      v42 = 2;
    objc_msgSend(v33, "setPreferredPromptStyle:", v42);
    objc_msgSend(v33, "setPreferredPromptButton:", 2 * (v41 < 2));
    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v33, v4);

  }
}

- (void)restoreInsertionPointPositionWithDocument:(id)a3 originalPositionRange:(_NSRange)a4 targetRange:(_NSRange)a5 payloadRange:(_NSRange)a6 contextBefore:(BOOL)a7
{
  NSUInteger length;
  NSUInteger v8;
  NSUInteger location;
  id v12;
  void *v13;
  void *v14;
  id v15;

  length = a5.length;
  v8 = a4.length;
  location = a4.location;
  v12 = a3;
  v15 = v12;
  if (a7)
  {
    location += a6.length - length;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextChoiceAccelerationAssistant.m"), 4183, CFSTR("restoreInsertionPointPositionWithDocument to an invalid range (%lu)"), 0x7FFFFFFFFFFFFFFFLL);

      v12 = v15;
    }
  }
  objc_msgSend(v12, "_textRangeFromNSRange:", location, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelectedTextRange:", v13);

}

- (void)resetDictationChoices
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "removeAnimated:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[_UITextChoiceAccelerationAssistant dictationDisambiguationUIAssertion](self, "dictationDisambiguationUIAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UITextChoiceAccelerationAssistant dictationDisambiguationUIAssertion](self, "dictationDisambiguationUIAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_invalidate");

    -[_UITextChoiceAccelerationAssistant setDictationDisambiguationUIAssertion:](self, "setDictationDisambiguationUIAssertion:", 0);
  }
}

- (void)resetDictationUnderlines
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[_UITextChoiceAccelerationAssistant underlinedWordDataForDictation](self, "underlinedWordDataForDictation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[_UITextChoiceAccelerationAssistant underlinedWordDataForDictation](self, "underlinedWordDataForDictation", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
          -[_UITextChoiceAccelerationAssistant _underlineView](self, "_underlineView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "underlines");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeUnderlines:animated:", v13, 1);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    -[_UITextChoiceAccelerationAssistant underlinedWordDataForDictation](self, "underlinedWordDataForDictation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITextChoiceAccelerationAssistant underlinedWordData](self, "underlinedWordData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsForKeys:", v15);

    -[_UITextChoiceAccelerationAssistant underlinedWordDataForDictation](self, "underlinedWordDataForDictation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAllObjects");

    if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
      -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdate](self, "setNeedsUnderlineUpdate");

  }
}

- (void)cancelPendingDictationPromptDisplay
{
  void *v3;
  void *v4;

  -[_UITextChoiceAccelerationAssistant dictationUnderlineDisplayTimer](self, "dictationUnderlineDisplayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UITextChoiceAccelerationAssistant setDictationUnderlineDisplayTimer:](self, "setDictationUnderlineDisplayTimer:", 0);
  -[_UITextChoiceAccelerationAssistant dictationPromptAutoUpdateTimer](self, "dictationPromptAutoUpdateTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[_UITextChoiceAccelerationAssistant setDictationPromptAutoUpdateTimer:](self, "setDictationPromptAutoUpdateTimer:", 0);
}

- (void)decorateTextInRanges:(id)a3 replacementText:(id)a4 allowAutomaticReplacement:(BOOL)a5 autoHide:(BOOL)a6 voiceCommandTrackingUUID:(id)a7 withCompletionHandler:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  _BOOL4 v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  _QWORD v58[5];
  _QWORD v59[5];
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v9 = a6;
  v10 = a5;
  v68 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v53 = a4;
  v54 = a8;
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    v48 = v9;
    -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)objc_opt_new();
      -[_UITextChoiceAccelerationAssistant setDictationVoiceEditingPrompts:](self, "setDictationVoiceEditingPrompts:", v15);

    }
    -[_UITextChoiceAccelerationAssistant updateSelectionHighlights](self, "updateSelectionHighlights");
    -[_UITextChoiceAccelerationAssistant textHighlightColor](self, "textHighlightColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      -[_UITextChoiceAccelerationAssistant selectionViewManager](self, "selectionViewManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_cursorTintColor");
      v18 = objc_claimAutoreleasedReturnValue();

      v52 = (void *)v18;
    }
    else
    {
      v52 = v16;
    }
    v51 = objc_msgSend(v13, "count");
    v62 = 0u;
    v63 = 0u;
    v19 = v51 == 1 && v10;
    v47 = v19;
    v64 = 0uLL;
    v65 = 0uLL;
    v49 = v13;
    obj = v13;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v20)
    {
      v21 = v20;
      v55 = 0;
      v22 = 1;
      v23 = *(_QWORD *)v63;
      v50 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v63 != v23)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          -[_UITextChoiceAccelerationAssistant underlineRectsForCandidate:range:](self, "underlineRectsForCandidate:range:", 0, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            -[_UITextChoiceAccelerationAssistant _document](self, "_document");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "textInRange:", v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28 && objc_msgSend(v28, "length"))
            {
              v66 = v53;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
              v56 = v22;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v55 + i);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(obj, "count"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              +[_UIReplacementCandidate candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:voiceCommandDisambiguationSelectedIndex:voiceCommandDisambiguationTargetCount:](_UIReplacementCandidate, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:voiceCommandDisambiguationSelectedIndex:voiceCommandDisambiguationTargetCount:", v28, v28, v29, v25, 0, 3, 5, v30, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              -[_UITextChoiceAccelerationAssistant createPromptWithCompletionHandler:](self, "createPromptWithCompletionHandler:", v54);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setPromptStyle:", 3);
              -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v33);

              -[_UITextChoiceAccelerationAssistant parentViewForPrompt](self, "parentViewForPrompt");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "_convertVisualAltitude:toView:", v33, 0.0);
              objc_msgSend(v33, "_setVisualAltitude:");
              -[_UITextChoiceAccelerationAssistant textInputView](self, "textInputView");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "firstObject");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "updateWithChoices:fromParentView:referenceTextView:presentedFromRect:textHighlightColor:", 0, v35, v36, v37, v52);

              objc_msgSend(v33, "updateButtonForType:", 5);
              objc_msgSend(v33, "setReplacement:", v32);
              if (v51 != 1)
                objc_msgSend(v33, "setLabelNumber:", v56);
              -[_UITextChoiceAccelerationAssistant updatePrompt:forReplacementCandidate:](self, "updatePrompt:forReplacementCandidate:", v33, v32);
              v22 = v56 + 1;

              v23 = v50;
            }

          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        v55 = (v55 + i);
      }
      while (v21);
    }

    -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v38, "count") < 2)
    {
      v13 = v49;
      v40 = v52;
      v41 = v48;
    }
    else
    {
      -[_UITextChoiceAccelerationAssistant dictationDisambiguationUIAssertion](self, "dictationDisambiguationUIAssertion");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v49;
      v40 = v52;
      v41 = v48;
      if (v39)
        goto LABEL_29;
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_obtainDisambiguationUIAssertion");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant setDictationDisambiguationUIAssertion:](self, "setDictationDisambiguationUIAssertion:", v42);

    }
LABEL_29:
    -[_UITextChoiceAccelerationAssistant setupPassthroughContainer](self, "setupPassthroughContainer");
    if (v47)
    {
      -[_UITextChoiceAccelerationAssistant cancelPendingDictationPromptDisplay](self, "cancelPendingDictationPromptDisplay");
      -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        v45 = (void *)MEMORY[0x1E0C99E88];
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __157___UITextChoiceAccelerationAssistant_decorateTextInRanges_replacementText_allowAutomaticReplacement_autoHide_voiceCommandTrackingUUID_withCompletionHandler___block_invoke;
        v59[3] = &unk_1E16C7218;
        v59[4] = self;
        v60 = v44;
        v61 = v54;
        objc_msgSend(v45, "scheduledTimerWithTimeInterval:repeats:block:", 0, v59, 0.2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationAssistant setDictationPromptAutoUpdateTimer:](self, "setDictationPromptAutoUpdateTimer:", v46);

      }
      else if (v54)
      {
        (*((void (**)(id, _QWORD))v54 + 2))(v54, 0);
      }
    }
    else
    {
      if (!v41)
      {
        if (v54)
          (*((void (**)(id, _QWORD))v54 + 2))(v54, 0);
        goto LABEL_39;
      }
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __157___UITextChoiceAccelerationAssistant_decorateTextInRanges_replacementText_allowAutomaticReplacement_autoHide_voiceCommandTrackingUUID_withCompletionHandler___block_invoke_2;
      v58[3] = &unk_1E16C4358;
      v58[4] = self;
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v58, 0.3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant setDictationUnderlineDisplayTimer:](self, "setDictationUnderlineDisplayTimer:", v44);
    }

LABEL_39:
  }

}

- (void)decorateTextInRects:(id)a3 targetTextArray:(id)a4 replacementText:(id)a5 deltaRanges:(id)a6 originalSelectedRange:(_NSRange)a7 allowAutomaticReplacement:(BOOL)a8 autoHide:(BOOL)a9 voiceCommandUUID:(id)a10 withCompletionHandler:(id)a11
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _UITextChoiceAccelerationAssistant *v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;
  id v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v70 = a5;
  v69 = a6;
  v68 = a10;
  v71 = a11;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    goto LABEL_35;
  -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](self, "dictationVoiceEditingPrompts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_opt_new();
    -[_UITextChoiceAccelerationAssistant setDictationVoiceEditingPrompts:](self, "setDictationVoiceEditingPrompts:", v19);

  }
  -[_UITextChoiceAccelerationAssistant updateSelectionHighlights](self, "updateSelectionHighlights");
  -[_UITextChoiceAccelerationAssistant textHighlightColor](self, "textHighlightColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[_UITextChoiceAccelerationAssistant selectionViewManager](self, "selectionViewManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_cursorTintColor");
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }
  v67 = v20;
  v23 = objc_msgSend(v16, "count");
  v24 = v23 == 1 && a8;
  v62 = v24;
  if (v23 != objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextChoiceAccelerationAssistant.m"), 4342, CFSTR("rects must match targets"));

  }
  v72 = self;
  if (v23)
  {
    v25 = 0;
    v64 = v17;
    v65 = v16;
    v63 = v23;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27 && objc_msgSend(v27, "length"))
      {
        v78[0] = v70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIReplacementCandidate candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:voiceCommandDisambiguationSelectedIndex:voiceCommandDisambiguationTargetCount:](_UIReplacementCandidate, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:voiceCommandDisambiguationSelectedIndex:voiceCommandDisambiguationTargetCount:", v28, v28, v29, 0, 0, 0, 5, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "setVoiceCommandTrackingUUID:", v68);
        -[_UITextChoiceAccelerationAssistant createPromptWithCompletionHandler:](v72, "createPromptWithCompletionHandler:", v71);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setPromptStyle:", 3);
        -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](v72, "dictationVoiceEditingPrompts");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v33);

        -[_UITextChoiceAccelerationAssistant parentViewForPrompt](v72, "parentViewForPrompt");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "_convertVisualAltitude:toView:", v33, 0.0);
        objc_msgSend(v33, "_setVisualAltitude:");
        objc_msgSend(v26, "CGRectValue");
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42;
        -[_UITextChoiceAccelerationAssistant delegate](v72, "delegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "inputOverlayContainer");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v45, v37, v39, v41, v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v63;
        -[_UITextChoiceAccelerationAssistant textInputView](v72, "textInputView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "updateWithChoices:fromParentView:referenceTextView:presentedFromRect:textHighlightColor:", 0, v35, v47, v46, v67);

        objc_msgSend(v33, "updateButtonForType:", 5);
        objc_msgSend(v33, "setReplacement:", v32);
        if (v63 != 1)
          objc_msgSend(v33, "setLabelNumber:", v25 + 1);
        if (v69)
        {
          objc_msgSend(v69, "objectAtIndex:", v25);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "rangeValue");
          objc_msgSend(v33, "setDeltaRange:", v49, v50);

        }
        objc_msgSend(v33, "setOriginalSelectedRange:", a7.location, a7.length);
        -[_UITextChoiceAccelerationAssistant updatePrompt:forReplacementCandidate:](v72, "updatePrompt:forReplacementCandidate:", v33, v32);

        v17 = v64;
        v16 = v65;
      }

      ++v25;
    }
    while (v23 != v25);
  }
  -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](v72, "dictationVoiceEditingPrompts");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v51, "count") <= 1)
  {
    v53 = v67;
    goto LABEL_25;
  }
  -[_UITextChoiceAccelerationAssistant dictationDisambiguationUIAssertion](v72, "dictationDisambiguationUIAssertion");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v67;
  if (!v52)
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "_obtainDisambiguationUIAssertion");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant setDictationDisambiguationUIAssertion:](v72, "setDictationDisambiguationUIAssertion:", v54);

LABEL_25:
  }
  -[_UITextChoiceAccelerationAssistant setupPassthroughContainer](v72, "setupPassthroughContainer");
  if (v62)
  {
    -[_UITextChoiceAccelerationAssistant cancelPendingDictationPromptDisplay](v72, "cancelPendingDictationPromptDisplay");
    -[_UITextChoiceAccelerationAssistant dictationVoiceEditingPrompts](v72, "dictationVoiceEditingPrompts");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "firstObject");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = (void *)MEMORY[0x1E0C99E88];
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __198___UITextChoiceAccelerationAssistant_decorateTextInRects_targetTextArray_replacementText_deltaRanges_originalSelectedRange_allowAutomaticReplacement_autoHide_voiceCommandUUID_withCompletionHandler___block_invoke;
      v75[3] = &unk_1E16C7218;
      v75[4] = v72;
      v76 = v56;
      v77 = v71;
      objc_msgSend(v57, "scheduledTimerWithTimeInterval:repeats:block:", 0, v75, 0.2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant setDictationPromptAutoUpdateTimer:](v72, "setDictationPromptAutoUpdateTimer:", v58);

    }
  }
  else if (a9)
  {
    v59 = (void *)MEMORY[0x1E0C99E88];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __198___UITextChoiceAccelerationAssistant_decorateTextInRects_targetTextArray_replacementText_deltaRanges_originalSelectedRange_allowAutomaticReplacement_autoHide_voiceCommandUUID_withCompletionHandler___block_invoke_2;
    v73[3] = &unk_1E16C7240;
    v73[4] = v72;
    v74 = v71;
    objc_msgSend(v59, "scheduledTimerWithTimeInterval:repeats:block:", 0, v73, 0.3);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant setDictationUnderlineDisplayTimer:](v72, "setDictationUnderlineDisplayTimer:", v60);

  }
  else if (v71)
  {
    (*((void (**)(id, _QWORD))v71 + 2))(v71, 0);
  }

LABEL_35:
}

- (void)presentIfNeededForRange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v14 = a3;
  if (!objc_msgSend(v14, "isEmpty"))
    goto LABEL_5;
  objc_msgSend(v14, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant rangeForTextChoicesAtPosition:](self, "rangeForTextChoicesAtPosition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  -[_UITextChoiceAccelerationAssistant _document](self, "_document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_rangeOfEnclosingWord:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_4:
    v8 = v5;

    v9 = v8;
  }
  else
  {
LABEL_5:
    v9 = v14;
    if (!v14)
    {
      -[_UITextChoiceAccelerationAssistant dismissIfPresented](self, "dismissIfPresented");
      v13 = 0;
      goto LABEL_11;
    }
  }
  v15 = v9;
  -[_UITextChoiceAccelerationAssistant _document](self, "_document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textInRange:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextChoiceAccelerationAssistant candidateForFinalString:](self, "candidateForFinalString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[_UITextChoiceAccelerationAssistant showChoicesForAutocorrectionCandidate:range:](self, "showChoicesForAutocorrectionCandidate:range:", v12, v15);
  else
    -[_UITextChoiceAccelerationAssistant dismissIfPresented](self, "dismissIfPresented");

  v13 = v15;
LABEL_11:

}

- (id)anchorRangeForText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_UITextChoiceAccelerationAssistant activeSelectedRange](self, "activeSelectedRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UITextChoiceAccelerationAssistant _document](self, "_document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_rangeOfText:endingAtPosition:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;

      v5 = v9;
    }

  }
  return v5;
}

- (id)underlineRectsForInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant anchorRangeForText:](self, "anchorRangeForText:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "isEmpty") & 1) == 0)
    {
      +[UIKeyboard currentDocumentState](UIKeyboard, "currentDocumentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationAssistant _document](self, "_document");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "_asNSRangeRelativeToDocument:", v9);
      v12 = v11;

      v21 = v12;
      v22 = v10;
      objc_msgSend(v8, "rectsForCharacterRange:withGranularity:", v10, v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "CGRectValue");
            -[_UITextChoiceAccelerationAssistant underlineRectFromDocumentRect:](self, "underlineRectFromDocumentRect:");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_msgSend(v5, "addObject:", v18);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v15);
      }
      if (!objc_msgSend(v5, "count"))
      {
        objc_msgSend(v8, "firstRectForCharacterRange:", v22, v21);
        -[_UITextChoiceAccelerationAssistant underlineRectFromDocumentRect:](self, "underlineRectFromDocumentRect:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v5, "addObject:", v19);

      }
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)underlineRectFromDocumentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITextChoiceAccelerationAssistant textInputView](self, "textInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputOverlayContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toCoordinateSpace:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[_UITextChoiceAccelerationAssistant delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inputOverlayContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v20, v12, v14, v16, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextChoiceAccelerationAssistant underlineRectForTextSelectionRect:forCandidate:](self, "underlineRectForTextSelectionRect:forCandidate:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)textWillBeginScrolling
{
  void *v3;
  void *v4;
  int IsSmartReply;
  NSObject *v6;
  void *v7;
  _UIReplacementCandidate *v8;
  _UIReplacementCandidate *stashedReplacement;
  uint8_t v10[16];

  if (-[_UITextChoiceAccelerationAssistant promptIsVisible](self, "promptIsVisible"))
  {
    -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replacement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IsSmartReply = _replacementSourceIsSmartReply(v4);

    if (IsSmartReply)
    {
      _UIKeyboardSmartReplyLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Text choice assistant is stashing smart replies as scrolling begins", v10, 2u);
      }

      -[_UITextChoiceAccelerationAssistant prompt](self, "prompt");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "replacement");
      v8 = (_UIReplacementCandidate *)objc_claimAutoreleasedReturnValue();
      stashedReplacement = self->_stashedReplacement;
      self->_stashedReplacement = v8;

      -[_UITextChoiceAccelerationAssistant clearSecureCandidateHashes](self, "clearSecureCandidateHashes");
    }
  }
}

- (void)textDidEndScrolling
{
  _UIReplacementCandidate *v3;
  _UIReplacementCandidate *stashedReplacement;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = self->_stashedReplacement;
  stashedReplacement = self->_stashedReplacement;
  self->_stashedReplacement = 0;

  if (!-[_UITextChoiceAccelerationAssistant promptIsVisible](self, "promptIsVisible")
    && _replacementSourceIsSmartReply(v3))
  {
    _UIKeyboardSmartReplyLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Text choice assistant is restoring stashed smart replies as scrolling ends", v7, 2u);
    }

    -[_UIReplacementCandidate candidateChoices](v3, "candidateChoices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant showChoicesForCandidates:](self, "showChoicesForCandidates:", v6);

  }
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)setPassthroughContainer:(id)a3
{
  objc_storeStrong((id *)&self->_passthroughContainer, a3);
}

- (void)setPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_prompt, a3);
}

- (NSMutableArray)dictationVoiceEditingPrompts
{
  return self->_dictationVoiceEditingPrompts;
}

- (void)setDictationVoiceEditingPrompts:(id)a3
{
  objc_storeStrong((id *)&self->_dictationVoiceEditingPrompts, a3);
}

- (NSTimer)dictationPromptAutoUpdateTimer
{
  return self->_dictationPromptAutoUpdateTimer;
}

- (void)setDictationPromptAutoUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dictationPromptAutoUpdateTimer, a3);
}

- (NSTimer)dictationUnderlineDisplayTimer
{
  return self->_dictationUnderlineDisplayTimer;
}

- (void)setDictationUnderlineDisplayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dictationUnderlineDisplayTimer, a3);
}

- (NSString)documentTextToReplace
{
  return self->_documentTextToReplace;
}

- (void)setDocumentTextToReplace:(id)a3
{
  objc_storeStrong((id *)&self->_documentTextToReplace, a3);
}

- (UITextRange)lastRange
{
  return self->_lastRange;
}

- (void)setLastRange:(id)a3
{
  objc_storeStrong((id *)&self->_lastRange, a3);
}

- (TIAutocorrectionList)lastList
{
  return self->_lastList;
}

- (void)setLastList:(id)a3
{
  objc_storeStrong((id *)&self->_lastList, a3);
}

- (void)setUnderlinedRanges:(id)a3
{
  objc_storeStrong((id *)&self->_underlinedRanges, a3);
}

- (void)setSavedLists:(id)a3
{
  objc_storeStrong((id *)&self->_savedLists, a3);
}

- (void)setUnderlinedWordData:(id)a3
{
  objc_storeStrong((id *)&self->_underlinedWordData, a3);
}

- (NSMutableDictionary)underlinedWordDataForDictation
{
  return self->_underlinedWordDataForDictation;
}

- (void)setUnderlinedWordDataForDictation:(id)a3
{
  objc_storeStrong((id *)&self->_underlinedWordDataForDictation, a3);
}

- (UITextPosition)lastAddedPosition
{
  return self->_lastAddedPosition;
}

- (void)setLastAddedPosition:(id)a3
{
  objc_storeStrong((id *)&self->_lastAddedPosition, a3);
}

- (_UIAssertion)grabberSuppressionAssertion
{
  return (_UIAssertion *)objc_loadWeakRetained((id *)&self->_grabberSuppressionAssertion);
}

- (void)setGrabberSuppressionAssertion:(id)a3
{
  objc_storeWeak((id *)&self->_grabberSuppressionAssertion, a3);
}

- (_UITextUnderlineView)selectionHighlightView
{
  return self->_selectionHighlightView;
}

- (void)setSelectionHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionHighlightView, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void)setUsingCustomInteraction:(BOOL)a3
{
  self->_usingCustomInteraction = a3;
}

- (_UITextChoiceInteraction)textChoiceInteraction
{
  return self->_textChoiceInteraction;
}

- (void)setTextChoiceInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_textChoiceInteraction, a3);
}

- (_UIAssertion)textChoiceInteractionGrabberSuppressionAssertion
{
  return self->_textChoiceInteractionGrabberSuppressionAssertion;
}

- (void)setTextChoiceInteractionGrabberSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_textChoiceInteractionGrabberSuppressionAssertion, a3);
}

- (_UIAssertion)dictationDisambiguationUIAssertion
{
  return self->_dictationDisambiguationUIAssertion;
}

- (void)setDictationDisambiguationUIAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_dictationDisambiguationUIAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationDisambiguationUIAssertion, 0);
  objc_storeStrong((id *)&self->_textChoiceInteractionGrabberSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_textChoiceInteraction, 0);
  objc_storeStrong((id *)&self->_selectionHighlightView, 0);
  objc_destroyWeak((id *)&self->_grabberSuppressionAssertion);
  objc_storeStrong((id *)&self->_promptDisplayTimer, 0);
  objc_storeStrong((id *)&self->_lastAddedPosition, 0);
  objc_storeStrong((id *)&self->_underlinedWordDataForDictation, 0);
  objc_storeStrong((id *)&self->_underlinedWordData, 0);
  objc_storeStrong((id *)&self->_savedLists, 0);
  objc_storeStrong((id *)&self->_underlinedRanges, 0);
  objc_storeStrong((id *)&self->_lastList, 0);
  objc_storeStrong((id *)&self->_lastRange, 0);
  objc_storeStrong((id *)&self->_documentTextToReplace, 0);
  objc_storeStrong((id *)&self->_dictationUnderlineDisplayTimer, 0);
  objc_storeStrong((id *)&self->_dictationPromptAutoUpdateTimer, 0);
  objc_storeStrong((id *)&self->_dictationVoiceEditingPrompts, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_passthroughContainer, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_destroyWeak((id *)&self->_textInputResponder);
  objc_destroyWeak((id *)&self->_interactionAssistant);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureCandidateHashes, 0);
  objc_storeStrong((id *)&self->_stashedReplacement, 0);
}

@end
