@implementation UIWKTextInteractionAssistant

- (BOOL)wantsLinkInteraction
{
  return 0;
}

- (Class)selectionInteractionClass
{
  return (Class)objc_opt_class();
}

- (int64_t)currentCursorBehavior
{
  return 2;
}

- (BOOL)containerIsBrowserView
{
  return 0;
}

- (BOOL)usesAsynchronousSelectionController
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (UIWKTextInteractionAssistantDelegate *)a3;
}

- (UIWKTextInteractionAssistant)initWithView:(id)a3
{
  UIWKTextInteractionAssistant *result;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWKTextInteractionAssistant;
  result = -[UITextInteractionAssistant initWithView:](&v5, sel_initWithView_, a3);
  if (result)
  {
    result->_selectionOperation = 0;
    result->_options = 0;
    v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->_caretBeforeTap.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    result->_caretBeforeTap.size = v4;
  }
  return result;
}

- (void)addGestureRecognizersToView:(id)a3
{
  UIGestureRecognizer *v5;
  objc_super v6;

  if (objc_msgSend(a3, "isEditable"))
    -[UIWKTextInteractionAssistant textChecker](self, "textChecker");
  v6.receiver = self;
  v6.super_class = (Class)UIWKTextInteractionAssistant;
  -[UITextInteractionAssistant addGestureRecognizersToView:](&v6, sel_addGestureRecognizersToView_, a3);
  v5 = -[UITextInteractionAssistant forcePressGesture](self, "forcePressGesture");
  if (v5)
    -[UIGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &unk_1E1A94E08);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  -[UITextInteractionAssistant dealloc](&v3, sel_dealloc);
}

- (id)textChecker
{
  id result;

  result = self->_textChecker;
  if (!result)
  {
    result = -[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
    self->_textChecker = (UITextChecker *)result;
  }
  return result;
}

- (BOOL)overrideGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)overrideGestureRecognizerShouldBegin:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UITextInput *v10;
  uint64_t v11;
  UITextInput *v12;

  objc_msgSend(a3, "locationInView:", objc_msgSend(a3, "view"));
  v6 = v5;
  v8 = v7;
  v9 = gestureTypeForGestureRecognizer(a3, objc_msgSend((id)objc_msgSend(a3, "view"), "isEditable"));
  if (objc_msgSend((id)objc_msgSend(a3, "view"), "conformsToProtocolCached:", &unk_1EE0CE288))
  {
    v10 = (UITextInput *)objc_msgSend(a3, "view");
    if ((unint64_t)(v9 - 1) > 9)
      v11 = 0;
    else
      v11 = qword_186684838[v9 - 1];
    return -[UITextInput textInteractionGesture:shouldBeginAtPoint:](v10, "textInteractionGesture:shouldBeginAtPoint:", v11, v6, v8);
  }
  v12 = -[UITextInteractionAssistant view](self, "view");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = v12;
    v11 = v9;
    return -[UITextInput textInteractionGesture:shouldBeginAtPoint:](v10, "textInteractionGesture:shouldBeginAtPoint:", v11, v6, v8);
  }
  return 0;
}

- (BOOL)containerIsAtom
{
  return 0;
}

- (BOOL)containerAllowsSelection
{
  return 1;
}

- (BOOL)containerAllowsSelectionTintOnly
{
  return 0;
}

- (void)scheduleChineseTransliterationForText:(id)a3
{
  id v5;
  UITextReplacementGeneratorForChineseTransliteration *v6;

  if (objc_msgSend(a3, "length"))
  {
    v6 = objc_alloc_init(UITextReplacementGeneratorForChineseTransliteration);
    -[UITextReplacementGenerator setReplacementRange:](v6, "setReplacementRange:", -[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange"));
    -[UITextReplacementGenerator setStringToReplace:](v6, "setStringToReplace:", a3);
    v5 = -[UITextReplacementGeneratorForChineseTransliteration replacements](v6, "replacements");
    if (objc_msgSend(v5, "count"))
      -[UIKeyboardImpl replaceText:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "replaceText:", objc_msgSend(v5, "firstObject"));

  }
}

- (void)scheduleReplacementsWithOptions:(unint64_t)a3
{
  if ((a3 & 0x10) != 0)
  {
    self->_options = a3;
    self->_selectionOperation = 3;
  }
  else
  {
    -[UIWKTextInteractionAssistant scheduleReplacementsForText:withOptions:](self, "scheduleReplacementsForText:withOptions:", -[UITextInput selectedText](-[UITextInteractionAssistant view](self, "view"), "selectedText"), a3);
  }
}

- (void)scheduleReplacementsForText:(id)a3
{
  -[UIWKTextInteractionAssistant scheduleReplacementsForText:withOptions:](self, "scheduleReplacementsForText:withOptions:", a3, 8);
}

- (BOOL)shouldTryReplacementsForText:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  uint64_t v7;
  uint64_t v8;

  v4 = a4;
  LODWORD(v7) = objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "autocorrectSpellingEnabled");
  if ((_DWORD)v7)
  {
    v7 = objc_msgSend(a3, "length");
    if (v7)
    {
      LODWORD(v7) = objc_msgSend(-[UIWKTextInteractionAssistant textChecker](self, "textChecker"), "_doneLoading");
      if ((_DWORD)v7)
      {
        if ((v4 & 7) == 0
          || (v8 = objc_msgSend(-[UIWKTextInteractionAssistant textChecker](self, "textChecker"), "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", a3, 0, objc_msgSend(a3, "length"), 0, 0, +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages")), LOBYTE(v7) = 0, v8 != 0x7FFFFFFFFFFFFFFFLL))
        {
          LOBYTE(v7) = 1;
        }
      }
    }
  }
  return v7;
}

- (void)scheduleReplacementsForText:(id)a3 withOptions:(unint64_t)a4
{
  if (-[UIWKTextInteractionAssistant shouldTryReplacementsForText:withOptions:](self, "shouldTryReplacementsForText:withOptions:"))
  {
    -[UIWKTextInteractionAssistant showReplacementsForText:withOptions:](self, "showReplacementsForText:withOptions:", a3, a4);
  }
}

- (id)generatorForRange:(id)a3 withOptions:(unint64_t)a4
{
  UITextReplacementGeneratorForCorrections *v7;
  id CurrentInputMode;
  uint64_t v9;
  objc_super v11;

  if ((objc_msgSend(a3, "isEqual:", -[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange")) & 1) != 0)
  {
    if (objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "autocorrectSpellingEnabled"))
    {
      v7 = objc_alloc_init(UITextReplacementGeneratorForCorrections);
      -[UITextReplacementGenerator setReplacementRange:](v7, "setReplacementRange:", -[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange"));
      -[UITextReplacementGenerator setStringToReplace:](v7, "setStringToReplace:", -[UITextInput selectedText](-[UITextInteractionAssistant view](self, "view"), "selectedText"));
      -[UITextReplacementGeneratorForCorrections setTextChecker:](v7, "setTextChecker:", -[UIWKTextInteractionAssistant textChecker](self, "textChecker"));
      -[UITextReplacementGeneratorForCorrections setAutocorrectionRecord:](v7, "setAutocorrectionRecord:", -[UIKeyboardImpl autocorrectionRecordForWord:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "autocorrectionRecordForWord:", -[UITextInput selectedText](-[UITextInteractionAssistant view](self, "view"), "selectedText")));
      -[UITextReplacementGeneratorForCorrections setMaxEditDistance:](v7, "setMaxEditDistance:", 2);
      -[UITextReplacementGeneratorForCorrections setMaxCountAfterAutocorrectionGuesses:](v7, "setMaxCountAfterAutocorrectionGuesses:", 1);
      CurrentInputMode = UIKeyboardGetCurrentInputMode();
      if (UIKeyboardCheckSpellingForInputMode(CurrentInputMode))
        v9 = 3;
      else
        v9 = 0;
      -[UITextReplacementGeneratorForCorrections setMaxCountAfterSpellingGuesses:](v7, "setMaxCountAfterSpellingGuesses:", v9);
      -[UITextReplacementGeneratorForCorrections setForceHistoryReplacement:](v7, "setForceHistoryReplacement:", (self->_options & 4) == 0);
      -[UITextReplacementGeneratorForCorrections setForceAutocorrectionGuesses:](v7, "setForceAutocorrectionGuesses:", (self->_options & 2) == 0);
      -[UITextReplacementGeneratorForCorrections setForceSpellingGuesses:](v7, "setForceSpellingGuesses:", (self->_options & 1) == 0);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIWKTextInteractionAssistant;
    return -[UITextInteractionAssistant generatorForRange:withOptions:](&v11, sel_generatorForRange_withOptions_, a3, a4);
  }
}

- (void)showReplacementsForText:(id)a3 withOptions:(unint64_t)a4
{
  _UITextChoiceAccelerationAssistant *v7;
  UITextPosition *v8;
  _QWORD v9[7];

  if ((a4 & 0x20) != 0)
  {
    v7 = -[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant");
    v8 = -[UITextRange start](-[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange"), "start");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke;
    v9[3] = &unk_1E16E5D78;
    v9[4] = a3;
    v9[5] = self;
    v9[6] = a4;
    -[_UITextChoiceAccelerationAssistant fullAutocorrectionForWord:atPosition:completionHandler:](v7, "fullAutocorrectionForWord:atPosition:completionHandler:", a3, v8, v9);
  }
  else
  {
    -[UIWKTextInteractionAssistant showReplacementsForText:withOptions:rects:](self, "showReplacementsForText:withOptions:rects:", a3, a4, 0);
  }
}

uint64_t __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  _QWORD v15[7];
  _QWORD v16[7];
  _QWORD v17[7];

  v2 = a2;
  if (!a2)
    v2 = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "webInteractionDelegate");
  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = (void *)objc_msgSend(v5, "webInteractionDelegate");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_2;
    v17[3] = &unk_1E16E5D28;
    v7 = *(_QWORD *)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v17[5] = v2;
    v17[6] = v7;
    v8 = v17;
  }
  else
  {
    v9 = objc_msgSend(v5, "asyncInteractionDelegate");
    v10 = *(void **)(a1 + 40);
    if (!v9)
    {
      v13 = (void *)objc_msgSend(v10, "asyncWebKitInteractionDelegate");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_4;
      v15[3] = &unk_1E16E5D50;
      v14 = *(_QWORD *)(a1 + 48);
      v15[4] = *(_QWORD *)(a1 + 40);
      v15[5] = v2;
      v15[6] = v14;
      return objc_msgSend(v13, "requestAutocorrectionRectsForString:withCompletionHandler:", v2, v15);
    }
    v6 = (void *)objc_msgSend(v10, "asyncInteractionDelegate");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_3;
    v16[3] = &unk_1E16E5D28;
    v11 = *(_QWORD *)(a1 + 48);
    v16[4] = *(_QWORD *)(a1 + 40);
    v16[5] = v2;
    v16[6] = v11;
    v8 = v16;
  }
  return objc_msgSend(v6, "requestTextRectsForString:withCompletionHandler:", v2, v8);
}

uint64_t __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a2);
        v9 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "rect");
        objc_msgSend(v4, "addObject:", objc_msgSend(v9, "valueWithCGRect:"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(*(id *)(a1 + 32), "showReplacementsForText:withOptions:rects:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
}

uint64_t __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a2);
        v9 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "rect");
        objc_msgSend(v4, "addObject:", objc_msgSend(v9, "valueWithCGRect:"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(*(id *)(a1 + 32), "showReplacementsForText:withOptions:rects:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
}

uint64_t __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(a2, "firstRect");
    v8[0] = objc_msgSend(v4, "valueWithCGRect:");
    v5 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(a2, "lastRect");
    v8[1] = objc_msgSend(v5, "valueWithCGRect:");
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  }
  else
  {
    v6 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "showReplacementsForText:withOptions:rects:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);
}

- (void)showReplacementsForText:(id)a3 withOptions:(unint64_t)a4 rects:(id)a5
{
  _BOOL4 v9;
  uint64_t v10;
  id v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v9 = (self->_options & 8) == 0;
  v10 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"), 2);
  v11 = -[UIWKTextInteractionAssistant generatorForRange:withOptions:](self, "generatorForRange:withOptions:", -[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange"), a4);
  v12 = dbl_1866847A0[v9];
  if (!+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))goto LABEL_12;
  v13 = (void *)objc_msgSend(v11, "replacements");
  v14 = objc_msgSend(v13, "count");
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v14;
    if (!objc_msgSend(v11, "autocorrectionRecord")
      && (objc_msgSend(v11, "forceAutocorrectionGuesses") & 1) == 0
      && !v15)
    {
      goto LABEL_11;
    }
    if (v15)
      -[_UITextChoiceAccelerationAssistant updateReplacements:forCandidate:](-[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant"), "updateReplacements:forCandidate:", v13, a3);
  }
  else
  {
    -[_UITextChoiceAccelerationAssistant updateReplacementsForSavedCandidate:](-[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant"), "updateReplacementsForSavedCandidate:", a3);
  }
  if (!-[_UITextChoiceAccelerationAssistant presentTextChoicePromptForText:delay:autocorrectionRects:](-[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant"), "presentTextChoicePromptForText:delay:autocorrectionRects:", a3, a5, v12))
  {
LABEL_11:
    -[_UITextChoiceAccelerationAssistant dismissWithoutSelection](-[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant"), "dismissWithoutSelection");
LABEL_12:
    -[_UITextInteractionEditMenuAssistant showReplacementsWithGenerator:forDictation:afterDelay:](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "showReplacementsWithGenerator:forDictation:afterDelay:", v11, 0, v12);
  }
}

- (void)selectTextForReplacement:(id)a3 withOptions:(unint64_t)a4
{
  if (-[UIWKTextInteractionAssistant shouldTryReplacementsForText:withOptions:](self, "shouldTryReplacementsForText:withOptions:", a3))
  {
    -[UITextInteractionAssistant view](self, "view");
    self->_options = a4;
    self->_selectionOperation = 3;
    -[UITextInput selectWordForReplacement](-[UITextInteractionAssistant view](self, "view"), "selectWordForReplacement");
  }
}

- (BOOL)requiresImmediateUpdate
{
  return self->_selectionOperation == 0;
}

- (void)updateActivatingSelectionView
{
  if (-[UIWKTextInteractionAssistant shouldDelayActivatingSelectionView](self, "shouldDelayActivatingSelectionView"))
  {
    -[UITextInteractionAssistant activateSelection](self, "activateSelection");
    -[UIWKTextInteractionAssistant setShouldDelayActivatingSelectionView:](self, "setShouldDelayActivatingSelectionView:", 0);
  }
}

- (void)selectionChanged
{
  int64_t selectionOperation;
  int v4;
  UITextInput *v5;
  int v6;
  UITextInput *v7;
  _QWORD v8[5];
  objc_super v9;

  -[UIWKTextInteractionAssistant updateActivatingSelectionView](self, "updateActivatingSelectionView");
  -[UIKeyboardImpl postInputResponderCapabilitiesChangedNotification](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "postInputResponderCapabilitiesChangedNotification");
  -[UITextInteractionAssistant setExpectingCommit:](self, "setExpectingCommit:", 0);
  v9.receiver = self;
  v9.super_class = (Class)UIWKTextInteractionAssistant;
  -[UITextInteractionAssistant selectionChanged](&v9, sel_selectionChanged);
  if (objc_msgSend((id)-[UITextInput selectedTextRange](-[UITextInteractionAssistant view](self, "view"), "selectedTextRange"), "isEmpty"))-[UITextInteractionAssistant setGrabberSuppressionAssertion:](self, "setGrabberSuppressionAssertion:", 0);
  objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "updateShiftStateAfterAsyncSelectionChange");
  selectionOperation = self->_selectionOperation;
  if (selectionOperation == 3)
  {
    self->_options &= ~0x10uLL;
    v4 = -[UITextInput conformsToProtocol:](-[UITextInteractionAssistant view](self, "view"), "conformsToProtocol:", &unk_1EE0CE288);
    v5 = -[UITextInteractionAssistant view](self, "view");
    v6 = -[UITextInput isReplaceAllowed](v5, "isReplaceAllowed");
    if (v4)
    {
      if (!v6)
        goto LABEL_13;
      v7 = v5;
    }
    else
    {
      if (!v6)
        goto LABEL_13;
      v7 = -[UITextInteractionAssistant view](self, "view");
    }
    -[UIWKTextInteractionAssistant showReplacementsForText:withOptions:](self, "showReplacementsForText:withOptions:", -[UITextInput selectedText](v7, "selectedText"), self->_options);
    goto LABEL_13;
  }
  if (!selectionOperation)
  {
    -[UITextInteractionAssistant scrollSelectionToVisible](self, "scrollSelectionToVisible");
    goto LABEL_16;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__UIWKTextInteractionAssistant_selectionChanged__block_invoke;
  v8[3] = &unk_1E16E5DA0;
  v8[4] = self;
  -[UIKeyboardTaskQueue addTask:](-[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue"), "addTask:", v8);
LABEL_13:
  if (self->_selectionOperation == 1)
    -[UITextInteractionAssistant scrollSelectionToVisible](self, "scrollSelectionToVisible");
  self->_selectionOperation = 0;
LABEL_16:
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
}

uint64_t __48__UIWKTextInteractionAssistant_selectionChanged__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "endSelectionChange");
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_editMenuAssistant"), "showSelectionCommandsAfterDelay:", 0.2);
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (id)_asText
{
  return (id)-[UITextInput _proxyTextInput](-[UITextInteractionAssistant view](self, "view"), "_proxyTextInput");
}

- (void)showSelectionView
{
  -[UITextInteractionAssistant activateSelection](self, "activateSelection");
  -[UIWKTextInteractionAssistant setShouldDelayActivatingSelectionView:](self, "setShouldDelayActivatingSelectionView:", 0);
}

- (id)alternativesForSelectedText
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UITextInteractionAssistant view](self, "view");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return (id)MEMORY[0x1E0C9AA60];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[UITextInput conformsToProtocolCached:](-[UITextInteractionAssistant view](self, "view"), "conformsToProtocolCached:", &unk_1EE0CE288))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (void *)-[UITextInput alternativesForSelectedText](-[UITextInteractionAssistant view](self, "view", 0), "alternativesForSelectedText");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_nsTextAlternative"));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", -[UITextInput alternativesForSelectedText](-[UITextInteractionAssistant view](self, "view"), "alternativesForSelectedText"));
  }
  return v3;
}

- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(int64_t)a6
{
  double y;
  double x;
  id v12;
  UITextSelection *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  UITextInput *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  int v28;
  double v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  char v44;
  UITextSelection *v45;
  uint64_t v46;
  UITextInput *v47;
  void *v48;
  _UITextChoiceAccelerationAssistant *v49;
  uint64_t v50;
  UITextReplacementGeneratorForDictation *v51;
  _QWORD v52[6];
  char v53;
  _QWORD v54[11];
  CGRect v55;

  y = a3.y;
  x = a3.x;
  if (!-[UIKeyboardTaskQueue isMainThreadExecutingTask](-[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue"), "isMainThreadExecutingTask"))
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke;
    v54[3] = &unk_1E16E5DC8;
    v54[4] = self;
    *(double *)&v54[5] = x;
    *(double *)&v54[6] = y;
    v54[7] = a4;
    v54[8] = a5;
    v54[9] = a6;
    -[UIKeyboardTaskQueue addTask:](-[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue"), "addTask:", v54);
    return;
  }
  switch(a4)
  {
    case 0:
      v12 = +[UITextMagnifierCaret sharedCaretMagnifier](UITextMagnifierCaret, "sharedCaretMagnifier");
      switch(a5)
      {
        case 1:
          -[UITextInteractionAssistant configureForHighlightMode](self, "configureForHighlightMode");
          if (-[UITextInteractionAssistant willHandoffLoupeMagnifier](self, "willHandoffLoupeMagnifier"))
          {
            -[UITextInteractionAssistant resetWillHandoffLoupeMagnifier](self, "resetWillHandoffLoupeMagnifier");
          }
          else
          {
            v46 = -[UITextInput textInputView](-[UITextInteractionAssistant view](self, "view"), "textInputView");
            v47 = -[UITextInteractionAssistant view](self, "view");
            objc_msgSend(v12, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v46, v47, 1, x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
          }
          break;
        case 2:
          goto LABEL_39;
        case 3:
          UIDistanceBetweenPointAndRect(x, y, self->_caretBeforeTap.origin.x, self->_caretBeforeTap.origin.y, self->_caretBeforeTap.size.width, self->_caretBeforeTap.size.height);
          v42 = v41;
          v43 = _UIGetTextRefinement_NearCaretDistance();
          v44 = -[UITextInput isFirstResponder](-[UITextInteractionAssistant view](self, "view"), "isFirstResponder");
          objc_msgSend(v12, "setMagnificationPoint:", x, y);
          v45 = -[UITextInteractionAssistant activeSelection](self, "activeSelection");
          if (v42 >= v43
            && !-[UITextRange _isRanged](-[UITextSelection selectedRange](v45, "selectedRange"), "_isRanged"))
          {
            -[UITextInteractionAssistant configureForSelectionMode](self, "configureForSelectionMode");
          }
          if (!-[UITextInteractionAssistant willHandoffLoupeMagnifier](self, "willHandoffLoupeMagnifier"))
            objc_msgSend(v12, "stopMagnifying:", 1);
          -[UIWKTextInteractionAssistant endSelectionChange](self, "endSelectionChange");
          -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
          if ((v44 & 1) == 0
            && !-[UITextInteractionAssistant willHandoffLoupeMagnifier](self, "willHandoffLoupeMagnifier"))
          {
            -[UITextInteractionAssistant setGestureRecognizers](self, "setGestureRecognizers");
          }
          break;
        case 4:
          -[UIWKTextInteractionAssistant endSelectionChange](self, "endSelectionChange");
          -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
          break;
        default:
          return;
      }
      return;
    case 1:
      v13 = -[UITextInteractionAssistant activeSelection](self, "activeSelection");
      if (-[UITextInput isFirstResponder](-[UITextInteractionAssistant view](self, "view"), "isFirstResponder"))v14 = objc_msgSend((id)-[UITextInput _responderWindow](-[UITextInteractionAssistant view](self, "view"), "_responderWindow"), "_isApplicationKeyWindow");
      else
        v14 = 0;
      -[_UITextInteractionEditMenuAssistant _editMenuIsVisibleOrDismissedRecently](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "_editMenuIsVisibleOrDismissedRecently");
      UIDistanceBetweenPointAndRect(x, y, self->_caretBeforeTap.origin.x, self->_caretBeforeTap.origin.y, self->_caretBeforeTap.size.width, self->_caretBeforeTap.size.height);
      v24 = v23;
      v25 = _UIGetTextRefinement_NearCaretDistance();
      -[UIWKTextInteractionAssistant endSelectionChange](self, "endSelectionChange");
      v26 = -[UIWKTextInteractionAssistant alternativesForSelectedText](self, "alternativesForSelectedText");
      if (!objc_msgSend((id)-[UITextInput selectedText](-[UITextInteractionAssistant view](self, "view"), "selectedText"), "compare:", self->_wordBeforeTap)&& -[UITextRange _isRanged](-[UITextSelection selectedRange](v13, "selectedRange"), "_isRanged"))
      {
        v27 = 0;
        v28 = 0;
        if (-[_UITextInteractionEditMenuAssistant _hasTextReplacements](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "_hasTextReplacements"))
        {
          v29 = 0.4;
          v30 = 0;
          goto LABEL_31;
        }
        v30 = 0;
LABEL_66:
        -[_UITextInteractionEditMenuAssistant hideSelectionCommands](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "hideSelectionCommands");
        goto LABEL_77;
      }
      v31 = (void *)-[UITextInput selectedText](-[UITextInteractionAssistant view](self, "view"), "selectedText");
      v30 = v31;
      if ((a6 & 1) != 0 && objc_msgSend(v31, "length"))
      {
        v27 = (void *)objc_msgSend(-[UIWKTextInteractionAssistant textChecker](self, "textChecker"), "grammarAlternativesForString:", v30);
        v32 = 1;
      }
      else
      {
        v32 = 0;
        v27 = 0;
      }
      v29 = 0.2;
      if (objc_msgSend(v27, "count"))
      {
        v28 = 0;
      }
      else if (v14
             && (v24 < v25
              || (-[UITextSelection caretRect](v13, "caretRect"),
                  v55.origin.x = v37,
                  v55.origin.y = v38,
                  v55.size.width = v39,
                  v55.size.height = v40,
                  CGRectEqualToRect(self->_caretBeforeTap, v55))))
      {
        v28 = 0;
        v29 = 0.4;
      }
      else
      {
        v28 = a6 & v32;
        if (!objc_msgSend(v26, "count"))
          goto LABEL_66;
      }
LABEL_31:
      if (!objc_msgSend(v26, "count"))
        v26 = (id)objc_msgSend(v27, "mutableCopy");
      if (!objc_msgSend(v26, "count"))
        goto LABEL_76;
      v33 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "firstObject"), "alternativeStrings"), "containsObject:", 0x1E1749860);
      if ((v33 & 1) != 0)
        goto LABEL_35;
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "firstObject"), "alternativeStrings"), "containsObject:", 0x1E1749840) & 1) != 0)
      {
        v34 = 0;
        v35 = 0;
        v36 = 1;
      }
      else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "firstObject"), "alternativeStrings"), "containsObject:", 0x1E1749880) & 1) != 0)
      {
        v35 = 0;
        v36 = 0;
        v34 = 1;
      }
      else
      {
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "firstObject"), "alternativeStrings"), "containsObject:", 0x1E17498A0) & 1) == 0)
        {
          v51 = -[UITextReplacementGeneratorForDictation initWithAlternatives:stringToReplace:replacementRange:]([UITextReplacementGeneratorForDictation alloc], "initWithAlternatives:stringToReplace:replacementRange:", objc_msgSend(v26, "firstObject"), v30, -[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange"));
          -[_UITextInteractionEditMenuAssistant showReplacementsWithGenerator:forDictation:afterDelay:](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "showReplacementsWithGenerator:forDictation:afterDelay:", v51, 1, v29);

LABEL_35:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          goto LABEL_69;
        }
        v34 = 0;
        v36 = 0;
        v35 = 1;
      }
LABEL_69:
      self->_options = 8;
      self->_selectionOperation = 0;
      -[UITextInput selectWordForReplacement](-[UITextInteractionAssistant view](self, "view"), "selectWordForReplacement");
      if (v34)
      {
        -[UIDictationController handleWKActionMoveAfter](+[UIDictationController sharedInstance](UIDictationController, "sharedInstance"), "handleWKActionMoveAfter");
      }
      else if (v35)
      {
        -[UIDictationController handleWKActionMoveBefore](+[UIDictationController sharedInstance](UIDictationController, "sharedInstance"), "handleWKActionMoveBefore");
      }
      else
      {
        if (!v36)
        {
          v28 = 0;
          if (!v33)
            goto LABEL_77;
          goto LABEL_76;
        }
        objc_msgSend((id)objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "inputDelegateManager"), "deleteBackward");
      }
      v28 = 0;
      if ((v33 & 1) != 0)
LABEL_76:
        -[_UITextInteractionEditMenuAssistant showSelectionCommandsAfterDelay:](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "showSelectionCommandsAfterDelay:", v29);
LABEL_77:
      v48 = (void *)-[UITextInput selectedTextRange](-[UITextInteractionAssistant view](self, "view"), "selectedTextRange");
      if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled")&& v48)
      {
        v49 = -[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant");
        v50 = objc_msgSend(v48, "start");
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke_2;
        v52[3] = &unk_1E16E5DF0;
        v53 = v28;
        v52[4] = self;
        v52[5] = v30;
        -[_UITextChoiceAccelerationAssistant shouldShowPromptForWebKitText:atPosition:completionHandler:](v49, "shouldShowPromptForWebKitText:atPosition:completionHandler:", v30, v50, v52);
      }
      else
      {
        -[UIWKTextInteractionAssistant setWordBeforeTap:](self, "setWordBeforeTap:", 0);
        if (v28)
          -[UIWKTextInteractionAssistant selectTextForReplacement:withOptions:](self, "selectTextForReplacement:withOptions:", v30, 15);
      }
      return;
    case 2:
      v15 = +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
      v16 = v15;
      switch(a5)
      {
        case 1:
          objc_msgSend(v15, "setIsHorizontal:", +[UITextSelectionRect startIsHorizontal:](UITextSelectionRect, "startIsHorizontal:", -[UITextSelection selectionRects](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectionRects")));
          v17 = -[UITextInput textInputView](-[UITextInteractionAssistant view](self, "view"), "textInputView");
          v18 = -[UITextInteractionAssistant view](self, "view");
          objc_msgSend(v16, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v17, v18, 1, x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
          -[UIWKTextInteractionAssistant endSelectionChange](self, "endSelectionChange");
          -[UITextSelection setRangedSelectionBaseToCurrentSelection](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "setRangedSelectionBaseToCurrentSelection");
          -[UITextSelection clearRangedSelectionInitialExtent](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "clearRangedSelectionInitialExtent");
          goto LABEL_4;
        case 2:
          objc_msgSend(v15, "setMagnificationPoint:", x, y);
          -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
          -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
          -[UITextSelection updateBaseIsStartWithDocumentPoint:](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "updateBaseIsStartWithDocumentPoint:", x, y);
          return;
        case 3:
          -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
          objc_msgSend(v16, "setMagnificationPoint:", x, y);
          objc_msgSend(v16, "stopMagnifying:", 1);
          if (!-[UITextRange _isRanged](-[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange"), "_isRanged"))objc_msgSend(v16, "stopMagnifying:", 1);
          goto LABEL_59;
        case 4:
          -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
LABEL_59:
          -[UITextInteractionAssistant setNeedsSelectionDisplayUpdate](self, "setNeedsSelectionDisplayUpdate");
          break;
        default:
          return;
      }
      return;
    case 8:
    case 9:
    case 10:
      -[UIWKTextInteractionAssistant endSelectionChange](self, "endSelectionChange");
      -[_UITextInteractionEditMenuAssistant showSelectionCommands](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "showSelectionCommands");
      goto LABEL_4;
    case 11:
LABEL_4:
      -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
      return;
    case 14:
      v19 = +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      if ((a6 & 4) != 0)
        objc_msgSend(v19, "didChangePhraseBoundary");
      v20 = +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
      v12 = v20;
      if ((unint64_t)(a5 - 3) < 2)
      {
        if (v20)
        {
          objc_msgSend(v20, "setMagnificationPoint:", x, y);
          objc_msgSend(v12, "stopMagnifying:", 1);
        }
        -[UITextCursorAssertion invalidate](self->_blinkAssertion, "invalidate");

        self->_blinkAssertion = 0;
        objc_msgSend((id)objc_msgSend(-[UIWKTextInteractionAssistant _asText](self, "_asText"), "inputDelegate"), "selectionDidChange:", -[UIWKTextInteractionAssistant _asText](self, "_asText"));
        -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
        -[UITextInteractionAssistant setInGesture:](self, "setInGesture:", 0);
      }
      else if (a5 == 2)
      {
LABEL_39:
        -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
        objc_msgSend(v12, "setMagnificationPoint:", x, y);
      }
      else if (a5 == 1)
      {
        objc_msgSend(v20, "setMagnificationPoint:", x, y);
        v21 = objc_msgSend(-[UIWKTextInteractionAssistant _asText](self, "_asText"), "textInputView");
        v22 = -[UIWKTextInteractionAssistant _asText](self, "_asText");
        objc_msgSend(v12, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v21, v22, 1, x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
        -[UITextInteractionAssistant setInGesture:](self, "setInGesture:", 1);
        self->_blinkAssertion = (UITextCursorAssertion *)-[UITextCursorAssertionController nonBlinkingAssertionWithReason:](-[UITextInteractionAssistant _assertionController](self, "_assertionController"), "nonBlinkingAssertionWithReason:", CFSTR("WebKit2 Phrase Boundary gesture"));
      }
      return;
    default:
      return;
  }
}

uint64_t __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "selectionChangedWithGestureAt:withGesture:withState:withFlags:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(a2, "returnExecutionToParent");
}

uint64_t __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;
  int v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectTextForReplacement:withOptions:", *(_QWORD *)(a1 + 40), 32);
    return objc_msgSend(*(id *)(a1 + 32), "setWordBeforeTap:", 0);
  }
  else
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_textChoicesAssistant"), "dismissWithoutSelection");
    result = objc_msgSend(*(id *)(a1 + 32), "setWordBeforeTap:", 0);
    if (v4)
      return objc_msgSend(*(id *)(a1 + 32), "selectTextForReplacement:withOptions:", *(_QWORD *)(a1 + 40), 15);
  }
  return result;
}

- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(int64_t)a5
{
  double y;
  double x;
  UIKeyboardTaskQueue *v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD v12[5];

  y = a3.y;
  x = a3.x;
  if ((a5 & 2) != 0)
    -[UITextRangeAdjustmentInteraction setBaseIsStart:](-[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction"), "setBaseIsStart:", -[UITextRangeAdjustmentInteraction baseIsStart](-[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction"), "baseIsStart") ^ 1);
  if ((unint64_t)(a4 - 3) < 3)
  {
    -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
    -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
    +[UIView commitAnimations](UIView, "commitAnimations");
    v9 = -[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", MEMORY[0x1E0C809B0], 3221225472, __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke_2, &unk_1E16E5DA0, self), "taskQueue");
    v10 = &v11;
LABEL_9:
    -[UIKeyboardTaskQueue addTask:](v9, "addTask:", v10);
    return;
  }
  if (a4 == 2)
  {
    -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
    -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke;
    v12[3] = &unk_1E16E5DA0;
    v12[4] = self;
    v9 = -[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue");
    v10 = v12;
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
    -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
  }
}

uint64_t __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "endSelectionChange");
  return objc_msgSend(a2, "returnExecutionToParent");
}

uint64_t __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "endSelectionChange");
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  UITextSelection *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;

  y = a3.y;
  x = a3.x;
  v6 = -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v7 = (void *)objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "rangeView");
  objc_msgSend(v7, "convertPoint:toView:", -[UITextInput textInputView](-[UITextInteractionAssistant view](self, "view"), "textInputView"), x, y);
  v9 = v8;
  v11 = v10;
  -[UITextSelection setGranularity:](v6, "setGranularity:", 0);
  v12 = -[UITextSelection setRangedSelectionExtentPoint:baseIsStart:](v6, "setRangedSelectionExtentPoint:baseIsStart:", objc_msgSend(v7, "baseIsStart"), v9, v11);
  -[UITextSelection commit](v6, "commit");
  if ((_DWORD)v12 != objc_msgSend(v7, "baseIsStart"))
    objc_msgSend(v7, "setBaseIsStart:", v12);
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
}

- (void)updateWithMagnifierTerminalPoint:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v3 = a3;
  v5 = (void *)objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "rangeView");
  v6 = +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  if (!objc_msgSend(v6, "target"))
  {
    objc_msgSend(v6, "stopMagnifying:", 0);
    return;
  }
  if ((!objc_msgSend(v6, "terminalPointPlacedCarefully")
     || -[UITextInteractionAssistant autoscrolled](self, "autoscrolled"))
    && -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"))
  {
    -[UIWKTextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
    objc_msgSend(v5, "setAnimateUpdate:", 1);
    objc_msgSend((id)objc_msgSend(v5, "startGrabber"), "setAnimating:", 1);
    objc_msgSend((id)objc_msgSend(v5, "endGrabber"), "setAnimating:", 1);
    +[UIView beginAnimations:context:](UIView, "beginAnimations:context:", 0, self);
    +[UIView setAnimationDuration:](UIView, "setAnimationDuration:", 0.2);
    +[UIView setAnimationCurve:](UIView, "setAnimationCurve:", 2);
    +[UIView setAnimationDelegate:](UIView, "setAnimationDelegate:", self);
    +[UIView setAnimationDidStopSelector:](UIView, "setAnimationDidStopSelector:", sel_selectionAnimationDidStop_finished_);
    v7 = objc_msgSend(v6, "horizontalMovement");
    v8 = 4;
    if (v7 >= 0)
      v8 = 5;
    if (v7 <= 0)
      v9 = v8;
    else
      v9 = 3;
    objc_msgSend(v5, "updateBaseAndExtentPointsFromEdges");
    objc_msgSend(v5, "extentPoint");
    objc_msgSend(v5, "convertPoint:toView:", -[UITextInput textInputView](-[UITextInteractionAssistant view](self, "view"), "textInputView"), v10, v11);
    objc_msgSend(v6, "setAnimationPoint:");
    objc_msgSend(v6, "animationPoint");
    v13 = v12;
    v15 = v14;
    goto LABEL_14;
  }
  if (v3)
  {
    objc_msgSend(v6, "terminalPoint");
    objc_msgSend(v6, "setMagnificationPoint:");
    objc_msgSend(v5, "activeTouchPoint");
    objc_msgSend(v6, "terminalPoint");
    v13 = v16;
    v15 = v17;
    v9 = 5;
LABEL_14:
    -[UIWKTextInteractionAssistant changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](self, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", v9, objc_msgSend(v5, "baseIsStart"), 0, v13, v15);
  }
  objc_msgSend(v6, "stopMagnifying:", 1);
  if (!-[_UITextInteractionEditMenuAssistant _editMenuIsVisible](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "_editMenuIsVisible"))-[_UITextInteractionEditMenuAssistant showSelectionCommandsAfterDelay:](-[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant"), "showSelectionCommandsAfterDelay:", 0.2);
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
}

- (void)rangeSelectionStarted:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];

  y = a3.y;
  x = a3.x;
  -[UITextInteraction _callDelegateWillMoveTextRangeExtentAtPoint:](-[UITextInteractionAssistant interactions](self, "interactions"), "_callDelegateWillMoveTextRangeExtentAtPoint:", a3.x, a3.y);
  -[UITextSelection setGranularity:](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "setGranularity:", 0);
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view"), "convertPoint:fromView:", objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "rangeView"), x, y);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__UIWKTextInteractionAssistant_rangeSelectionStarted___block_invoke;
  v8[3] = &unk_1E16E5E18;
  v8[4] = self;
  v8[5] = v6;
  v8[6] = v7;
  -[UIKeyboardTaskQueue addTask:](-[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue"), "addTask:", v8);
}

uint64_t __54__UIWKTextInteractionAssistant_rangeSelectionStarted___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "beginSelectionChange");
  objc_msgSend(*(id *)(a1 + 32), "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 0, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_legacySelectionView"), "rangeView"), "baseIsStart"), 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)rangeSelectionEnded:(CGPoint)a3
{
  double y;
  double x;
  _UITextInteractionEditMenuAssistant *v6;
  _QWORD v7[5];

  y = a3.y;
  x = a3.x;
  if (objc_msgSend(+[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier"), "target"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__UIWKTextInteractionAssistant_rangeSelectionEnded___block_invoke;
    v7[3] = &unk_1E16E5DA0;
    v7[4] = self;
    -[UIKeyboardTaskQueue addTask:](-[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue"), "addTask:", v7);
  }
  else
  {
    v6 = -[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant");
    if (!-[_UITextInteractionEditMenuAssistant _editMenuIsVisible](v6, "_editMenuIsVisible"))
      -[_UITextInteractionEditMenuAssistant showSelectionCommands](v6, "showSelectionCommands");
    -[UITextInput changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](-[UITextInteractionAssistant view](self, "view"), "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 5, -[UITextRangeAdjustmentInteraction baseIsStart](-[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction"), "baseIsStart"), 0, x, y);
  }
}

uint64_t __52__UIWKTextInteractionAssistant_rangeSelectionEnded___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updateWithMagnifierTerminalPoint:", 1);
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)rangeSelectionMoved:(CGPoint)a3 withTouchPoint:(CGPoint)a4
{
  double y;
  double x;
  UITextRangeAdjustmentInteraction *v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  v7 = -[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction", a3.x, a3.y, a4.x, a4.y);
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view"), "convertPoint:fromView:", objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "rangeView"), x, y);
  -[UITextInput changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](-[UITextInteractionAssistant view](self, "view"), "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 1, -[UITextRangeAdjustmentInteraction baseIsStart](v7, "baseIsStart"), 0, v8, v9);
}

- (void)rangeSelectionCanceled
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__UIWKTextInteractionAssistant_rangeSelectionCanceled__block_invoke;
  v2[3] = &unk_1E16E5DA0;
  v2[4] = self;
  -[UIKeyboardTaskQueue addTask:](-[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue"), "addTask:", v2);
}

uint64_t __54__UIWKTextInteractionAssistant_rangeSelectionCanceled__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "beginSelectionChange");
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)selectWord
{
  UIKeyboardTaskQueue *v3;
  _QWORD v4[5];

  self->_selectionOperation = 1;
  -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
  -[UITextInteractionAssistant configureForSelectionMode](self, "configureForSelectionMode");
  v3 = -[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__UIWKTextInteractionAssistant_selectWord__block_invoke;
  v4[3] = &unk_1E16E5DA0;
  v4[4] = self;
  -[UIKeyboardTaskQueue addTask:](v3, "addTask:", v4);
}

uint64_t __42__UIWKTextInteractionAssistant_selectWord__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "beginSelectionChange");
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)selectAll:(id)a3
{
  UIKeyboardTaskQueue *v4;
  _QWORD v5[5];

  self->_selectionOperation = 2;
  -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary", a3);
  v4 = -[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "taskQueue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__UIWKTextInteractionAssistant_selectAll___block_invoke;
  v5[3] = &unk_1E16E5DA0;
  v5[4] = self;
  -[UIKeyboardTaskQueue addTask:](v4, "addTask:", v5);
}

uint64_t __42__UIWKTextInteractionAssistant_selectAll___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "beginSelectionChange");
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)showDictionaryFor:(id)a3 fromRect:(CGRect)a4
{
  _UITextServiceSession *v5;
  _QWORD v6[5];

  v5 = (_UITextServiceSession *)(id)-[UITextInput _showServiceForType:withContext:](-[UITextInteractionAssistant view](self, "view"), "_showServiceForType:withContext:", 2, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, -[UITextInteractionAssistant view](self, "view"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height));
  self->_definitionSession = v5;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__UIWKTextInteractionAssistant_showDictionaryFor_fromRect___block_invoke;
  v6[3] = &unk_1E16E5E40;
  v6[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v5, "setDismissedHandler:", v6);
}

void __59__UIWKTextInteractionAssistant_showDictionaryFor_fromRect___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = 0;
}

- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _UITextServiceSession *v10;
  _QWORD v11[5];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)-[_UITextServiceSession dismissTextServiceAnimated:](self->_learnSession, "dismissTextServiceAnimated:", 0);
  v10 = (_UITextServiceSession *)(id)-[UITextInput _showServiceForType:withContext:](-[UITextInteractionAssistant view](self, "view"), "_showServiceForType:withContext:", 4, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, -[UITextInteractionAssistant view](self, "view"), x, y, width, height));
  self->_learnSession = v10;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__UIWKTextInteractionAssistant_showTextServiceFor_fromRect___block_invoke;
  v11[3] = &unk_1E16E5E40;
  v11[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v10, "setDismissedHandler:", v11);
}

UIUserInterfaceIdiom __60__UIWKTextInteractionAssistant_showTextServiceFor_fromRect___block_invoke(uint64_t a1)
{
  UIUserInterfaceIdiom result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360) = 0;
  result = -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom");
  if ((result & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "becomeFirstResponder");
  return result;
}

- (BOOL)shouldSuppressSelectionCommands
{
  objc_super v3;

  if (self->_shareSession
    || self->_learnSession
    || self->_definitionSession
    || self->_lookupSession
    || self->_translateSession)
  {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  return -[UITextInteractionAssistant shouldSuppressSelectionCommands](&v3, sel_shouldSuppressSelectionCommands);
}

- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _UITextServiceSession *v10;
  _QWORD v11[5];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)-[_UITextServiceSession dismissTextServiceAnimated:](self->_shareSession, "dismissTextServiceAnimated:", 0);
  v10 = (_UITextServiceSession *)(id)-[UITextInput _showServiceForType:withContext:](-[UITextInteractionAssistant view](self, "view"), "_showServiceForType:withContext:", 8, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, -[UITextInteractionAssistant view](self, "view"), x, y, width, height));
  self->_shareSession = v10;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__UIWKTextInteractionAssistant_showShareSheetFor_fromRect___block_invoke;
  v11[3] = &unk_1E16E5E40;
  v11[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v10, "setDismissedHandler:", v11);
}

UIUserInterfaceIdiom __59__UIWKTextInteractionAssistant_showShareSheetFor_fromRect___block_invoke(uint64_t a1)
{
  UIUserInterfaceIdiom result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) = 0;
  result = -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom");
  if ((result & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "becomeFirstResponder");
  return result;
}

- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5
{
  _UITextServiceSession *v6;
  _QWORD v7[5];

  v6 = (_UITextServiceSession *)(id)-[UITextInput _showServiceForType:withContext:](-[UITextInteractionAssistant view](self, "view"), "_showServiceForType:withContext:", 16, +[_UITextServiceSessionContext sessionContextWithText:withRect:withRange:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withRange:withView:", a3, a4.location, a4.length, -[UITextInteractionAssistant view](self, "view"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height));
  self->_lookupSession = v6;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UIWKTextInteractionAssistant_lookup_withRange_fromRect___block_invoke;
  v7[3] = &unk_1E16E5E40;
  v7[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v6, "setDismissedHandler:", v7);
}

void __58__UIWKTextInteractionAssistant_lookup_withRange_fromRect___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376) = 0;
}

- (void)lookup:(id)a3 fromRect:(CGRect)a4
{
  _UITextServiceSession *v5;
  _QWORD v6[5];

  v5 = (_UITextServiceSession *)(id)-[UITextInput _showServiceForType:withContext:](-[UITextInteractionAssistant view](self, "view"), "_showServiceForType:withContext:", 16, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, -[UITextInteractionAssistant view](self, "view"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height));
  self->_lookupSession = v5;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__UIWKTextInteractionAssistant_lookup_fromRect___block_invoke;
  v6[3] = &unk_1E16E5E40;
  v6[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v5, "setDismissedHandler:", v6);
}

void __48__UIWKTextInteractionAssistant_lookup_fromRect___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376) = 0;
}

- (void)translate:(id)a3 fromRect:(CGRect)a4
{
  _UITextServiceSession *v5;
  _QWORD v6[5];

  v5 = (_UITextServiceSession *)(id)-[UITextInput _showServiceForType:withContext:](-[UITextInteractionAssistant view](self, "view"), "_showServiceForType:withContext:", 32, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, -[UITextInteractionAssistant view](self, "view"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height));
  self->_translateSession = v5;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__UIWKTextInteractionAssistant_translate_fromRect___block_invoke;
  v6[3] = &unk_1E16E5E40;
  v6[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v5, "setDismissedHandler:", v6);
}

void __51__UIWKTextInteractionAssistant_translate_fromRect___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384) = 0;
}

- (void)willStartScrollingOverflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  -[UITextInteractionAssistant willStartScrollingOrZooming](&v3, sel_willStartScrollingOrZooming);
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction setActivated:](-[UITextInteractionAssistant _selectionViewManager](self, "_selectionViewManager"), "setActivated:", 0);
  }
  else
  {
    objc_msgSend(-[UITextInteractionAssistant _selectionView](self, "_selectionView"), "setVisible:", 0);
  }
}

- (void)didEndScrollingOverflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  -[UITextInteractionAssistant didEndScrollingOrZooming](&v3, sel_didEndScrollingOrZooming);
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    if (!-[UIWKTextInteractionAssistant shouldSuppressSelectionCommands](self, "shouldSuppressSelectionCommands"))
      -[UITextSelectionDisplayInteraction setActivated:](-[UITextInteractionAssistant _selectionViewManager](self, "_selectionViewManager"), "setActivated:", 1);
  }
  else
  {
    objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "setVisible:", 1);
  }
}

- (void)willChangeSelection
{
  CGRect *p_caretBeforeTap;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  p_caretBeforeTap = &self->_caretBeforeTap;
  -[_UIKeyboardTextSelectionController caretRectForCursorPosition](-[UITextInteractionAssistant activeSelectionController](self, "activeSelectionController"), "caretRectForCursorPosition");
  p_caretBeforeTap->origin.x = v3;
  p_caretBeforeTap->origin.y = v4;
  p_caretBeforeTap->size.width = v5;
  p_caretBeforeTap->size.height = v6;
}

- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  y = a4.y;
  x = a4.x;
  -[UITextSelectionDisplayInteraction _didBeginRangeAdjustmentInteraction:](-[UITextInteractionAssistant _selectionViewManager](self, "_selectionViewManager"), "_didBeginRangeAdjustmentInteraction:", a3);
  -[UITextInteraction _callDelegateWillMoveTextRangeExtentAtPoint:](-[UITextInteractionAssistant interactions](self, "interactions"), "_callDelegateWillMoveTextRangeExtentAtPoint:", x, y);
  -[UITextSelection setGranularity:](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "setGranularity:", 0);
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view"), "convertPoint:fromView:", objc_msgSend(a3, "view"), x, y);
  -[UIKeyboardTaskQueue addTask:](-[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", MEMORY[0x1E0C809B0], 3221225472, __79__UIWKTextInteractionAssistant_textRangeAdjustmentInteraction_didBeginAtPoint___block_invoke, &unk_1E16E5E68, self, a3, v8, v9), "taskQueue"), "addTask:", &v10);
}

uint64_t __79__UIWKTextInteractionAssistant_textRangeAdjustmentInteraction_didBeginAtPoint___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "beginSelectionChange");
  objc_msgSend(*(id *)(a1 + 32), "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 0, objc_msgSend(*(id *)(a1 + 40), "baseIsStart"), 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)textRangeAdjustmentInteraction:(id)a3 selectionMoved:(CGPoint)a4 withTouchPoint:(CGPoint)a5
{
  double v7;
  double v8;

  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view", a4.x, a4.y, a5.x, a5.y), "convertPoint:fromView:", objc_msgSend(a3, "view"), a4.x, a4.y);
  -[UIWKTextInteractionAssistant changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](self, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 1, objc_msgSend(a3, "baseIsStart"), 0, v7, v8);
}

- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4
{
  double y;
  double x;
  _UITextInteractionEditMenuAssistant *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  y = a4.y;
  x = a4.x;
  -[UITextSelectionDisplayInteraction _didEndRangeAdjustmentInteraction:](-[UITextInteractionAssistant _selectionViewManager](self, "_selectionViewManager"), "_didEndRangeAdjustmentInteraction:", a3);
  v8 = -[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant");
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view"), "convertPoint:fromView:", objc_msgSend(a3, "view"), x, y);
  v10 = v9;
  v12 = v11;
  if (!-[_UITextInteractionEditMenuAssistant _editMenuIsVisible](v8, "_editMenuIsVisible"))
    -[_UITextInteractionEditMenuAssistant showSelectionCommands](v8, "showSelectionCommands");
  -[UIWKTextInteractionAssistant changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](self, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 5, objc_msgSend(a3, "baseIsStart"), 0, v10, v12);
}

- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__UIWKTextInteractionAssistant_textRangeAdjustmentInteractionWasCancelled___block_invoke;
  v3[3] = &unk_1E16E5DA0;
  v3[4] = self;
  -[UIKeyboardTaskQueue addTask:](-[UIKeyboardImpl taskQueue](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", a3), "taskQueue"), "addTask:", v3);
}

uint64_t __75__UIWKTextInteractionAssistant_textRangeAdjustmentInteractionWasCancelled___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "beginSelectionChange");
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (id)webInteractionDelegate
{
  if (-[UITextInput conformsToProtocolCached:](-[UITextInteractionAssistant view](self, "view"), "conformsToProtocolCached:", &unk_1EE0CE288))return -[UITextInteractionAssistant view](self, "view");
  else
    return 0;
}

- (id)asyncWebKitInteractionDelegate
{
  if (-[UITextInput conformsToProtocolCached:](-[UITextInteractionAssistant view](self, "view"), "conformsToProtocolCached:", &unk_1EE0CE648))return -[UITextInteractionAssistant view](self, "view");
  else
    return 0;
}

- (id)asyncInteractionDelegate
{
  if (-[UITextInput conformsToProtocolCached:](-[UITextInteractionAssistant view](self, "view"), "conformsToProtocolCached:", &unk_1EE0CE228))return -[UITextInteractionAssistant view](self, "view");
  else
    return 0;
}

- (id)asyncTextInteractionDelegate
{
  return self->_delegate;
}

- (void)beginSelectionChange
{
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")&& -[UIWKTextInteractionAssistant delegate](self, "delegate"))
  {
    -[UIWKTextInteractionAssistantDelegate selectionWillChange:](-[UIWKTextInteractionAssistant delegate](self, "delegate"), "selectionWillChange:", self);
  }
  else
  {
    -[UITextInput beginSelectionChange](-[UITextInteractionAssistant view](self, "view"), "beginSelectionChange");
  }
}

- (void)endSelectionChange
{
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")&& -[UIWKTextInteractionAssistant delegate](self, "delegate"))
  {
    -[UIWKTextInteractionAssistantDelegate selectionDidChange:](-[UIWKTextInteractionAssistant delegate](self, "delegate"), "selectionDidChange:", self);
  }
  else
  {
    -[UITextInput endSelectionChange](-[UITextInteractionAssistant view](self, "view"), "endSelectionChange");
  }
}

- (void)willBeginSelectionInteraction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  -[UITextInteractionAssistant willBeginSelectionInteraction](&v3, sel_willBeginSelectionInteraction);
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
  {
    if (-[UIWKTextInteractionAssistant delegate](self, "delegate"))
      -[UIWKTextInteractionAssistantDelegate selectionWillChange:](-[UIWKTextInteractionAssistant delegate](self, "delegate"), "selectionWillChange:", self);
  }
}

- (void)didEndSelectionInteraction
{
  objc_super v3;

  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")&& -[UIWKTextInteractionAssistant delegate](self, "delegate"))
  {
    -[UIWKTextInteractionAssistantDelegate selectionDidChange:](-[UIWKTextInteractionAssistant delegate](self, "delegate"), "selectionDidChange:", self);
  }
  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  -[UITextInteractionAssistant didEndSelectionInteraction](&v3, sel_didEndSelectionInteraction);
}

- (void)changeSelectionWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 baseIsStart:(BOOL)a5 withFlags:(int64_t)a6
{
  _BOOL8 v7;
  double y;
  double x;
  int v12;
  UITextInput *v13;
  int64_t v14;

  v7 = a5;
  y = a3.y;
  x = a3.x;
  v12 = -[UITextInput conformsToProtocolCached:](-[UITextInteractionAssistant view](self, "view"), "conformsToProtocolCached:", &unk_1EE0CE288);
  v13 = -[UITextInteractionAssistant view](self, "view");
  if (v12)
  {
    if ((unint64_t)a4 >= 5)
      v14 = 5;
    else
      v14 = a4;
    -[UITextInput adjustSelectionBoundaryToPoint:touchPhase:baseIsStart:flags:](v13, "adjustSelectionBoundaryToPoint:touchPhase:baseIsStart:flags:", v14, v7, a6, x, y);
  }
  else
  {
    -[UITextInput conformsToProtocolCached:](v13, "conformsToProtocolCached:", &unk_1EE0CE228);
    -[UITextInput changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](-[UITextInteractionAssistant view](self, "view"), "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", a4, v7, a6, x, y);
  }
}

- (NSString)wordBeforeTap
{
  return self->_wordBeforeTap;
}

- (void)setWordBeforeTap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

- (CGRect)caretBeforeTap
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_caretBeforeTap.origin.x;
  y = self->_caretBeforeTap.origin.y;
  width = self->_caretBeforeTap.size.width;
  height = self->_caretBeforeTap.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCaretBeforeTap:(CGRect)a3
{
  self->_caretBeforeTap = a3;
}

- (BOOL)shouldDelayActivatingSelectionView
{
  return self->_shouldDelayActivatingSelectionView;
}

- (void)setShouldDelayActivatingSelectionView:(BOOL)a3
{
  self->_shouldDelayActivatingSelectionView = a3;
}

- (UIWKTextInteractionAssistantDelegate)delegate
{
  return self->_delegate;
}

@end
