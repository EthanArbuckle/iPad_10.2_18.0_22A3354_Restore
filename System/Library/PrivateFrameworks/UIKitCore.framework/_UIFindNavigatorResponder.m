@implementation _UIFindNavigatorResponder

- (_UIFindNavigatorResponder)initWithFindNavigatorViewController:(id)a3
{
  id v5;
  _UIFindNavigatorResponder *v6;
  _UIFindNavigatorResponder *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFindNavigatorResponder;
  v6 = -[_UIFindNavigatorResponder init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_showsCollapsedInputView = 1;
    v6->_canBecomeFirstResponder = 1;
    objc_storeStrong((id *)&v6->_findNavigatorViewController, a3);
    -[_UIFindNavigatorViewController setParentResponder:](v7->_findNavigatorViewController, "setParentResponder:", v7);
    -[UIResponder inputAssistantItem](v7, "inputAssistantItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setVisibleWhenMinimized:", 1);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__willPersistFindUI_, CFSTR("UITextInputWillPersistFindUINotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__didPersistFindUI_, CFSTR("UITextInputDidPersistFindUINotification"), 0);

  }
  return v7;
}

- (unint64_t)hostingTypeForTraitCollection:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (objc_msgSend(a3, "userInterfaceIdiom") != 1)
    return 1;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEmojiInputMode") & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isHandwritingInputMode"))
  {
    v5 = 1;
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (id)nextResponder
{
  void *v2;
  void *v3;

  -[_UIFindNavigatorViewController findSession](self->_findNavigatorViewController, "findSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "divergentResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputView
{
  UIView *collapsedInputView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  UIView *v7;

  if (self->_showsCollapsedInputView)
  {
    collapsedInputView = self->_collapsedInputView;
    if (!collapsedInputView)
    {
      v4 = [UIView alloc];
      v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v6 = self->_collapsedInputView;
      self->_collapsedInputView = v5;

      collapsedInputView = self->_collapsedInputView;
    }
    v7 = collapsedInputView;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)inputDashboardViewController
{
  void *v3;
  unint64_t v4;
  _UIFindNavigatorViewController *v5;

  -[UIViewController traitCollection](self->_findNavigatorViewController, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIFindNavigatorResponder hostingTypeForTraitCollection:](self, "hostingTypeForTraitCollection:", v3);

  if (v4 == 2)
    v5 = self->_findNavigatorViewController;
  else
    v5 = 0;
  return v5;
}

- (id)inputAccessoryView
{
  return 0;
}

- (id)inputAccessoryViewController
{
  void *v3;
  unint64_t v4;
  _UIFindNavigatorViewController *v5;

  -[UIViewController traitCollection](self->_findNavigatorViewController, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIFindNavigatorResponder hostingTypeForTraitCollection:](self, "hostingTypeForTraitCollection:", v3);

  if (v4 == 1)
    v5 = self->_findNavigatorViewController;
  else
    v5 = 0;
  return v5;
}

- (void)becomeFirstResponderAndFocusFindField
{
  void *v3;
  _QWORD v4[5];

  self->_showsCollapsedInputView = 0;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66___UIFindNavigatorResponder_becomeFirstResponderAndFocusFindField__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

  -[UIResponder becomeFirstResponder](self, "becomeFirstResponder");
}

- (id)nextFirstResponder
{
  void *v2;
  void *v3;

  -[_UIFindNavigatorViewController findSession](self->_findNavigatorViewController, "findSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchableResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textInputContextIdentifier
{
  return 0;
}

- (id)textInputMode
{
  return 0;
}

- (void)_willPersistFindUI:(id)a3
{
  self->_isChangingInputModes = 1;
}

- (void)_didPersistFindUI:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[_UIFindNavigatorViewController findNavigatorView](self->_findNavigatorViewController, "findNavigatorView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isChangingInputModes)
  {
    v8 = v4;
    objc_msgSend(v4, "firstResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "_containsResponder:", v5);

    v4 = v8;
    if (v6)
    {
      objc_msgSend(v8, "firstResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadInputViews");

      v4 = v8;
    }
  }
  self->_isChangingInputModes = 0;

}

- (BOOL)_disallowsPresentationOfKeyboardShortcutHUD
{
  return 1;
}

- (BOOL)_alwaysRequireInlineCandidateView
{
  void *v2;
  BOOL v3;

  -[_UIFindNavigatorResponder inputDashboardViewController](self, "inputDashboardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasText
{
  return 0;
}

- (BOOL)forceDisableDictation
{
  return 1;
}

- (BOOL)acceptsInitialEmojiKeyboard
{
  return 1;
}

- (int64_t)keyboardAppearance
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[_UIFindNavigatorViewController findSession](self->_findNavigatorViewController, "findSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchableResponderAsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "userInterfaceStyle") == 2)
    v5 = 1;
  else
    v5 = 2 * (objc_msgSend(v4, "userInterfaceStyle") == 1);

  return v5;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -1;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)selectionRectsForRange:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)textInRange:(id)a3
{
  return 0;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return self->_canBecomeFirstResponder;
}

- (void)setCanBecomeFirstResponder:(BOOL)a3
{
  self->_canBecomeFirstResponder = a3;
}

- (UITextPosition)beginningOfDocument
{
  return self->beginningOfDocument;
}

- (UITextPosition)endOfDocument
{
  return self->endOfDocument;
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)objc_loadWeakRetained((id *)&self->inputDelegate);
}

- (void)setInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->inputDelegate, a3);
}

- (UITextRange)markedTextRange
{
  return self->markedTextRange;
}

- (NSDictionary)markedTextStyle
{
  return self->markedTextStyle;
}

- (void)setMarkedTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSelectedTextRange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (UITextInputTokenizer)tokenizer
{
  return self->tokenizer;
}

- (_UIFindNavigatorViewController)findNavigatorViewController
{
  return self->_findNavigatorViewController;
}

- (void)setFindNavigatorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_findNavigatorViewController, a3);
}

- (BOOL)isChangingInputModes
{
  return self->_isChangingInputModes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findNavigatorViewController, 0);
  objc_storeStrong((id *)&self->tokenizer, 0);
  objc_storeStrong((id *)&self->selectedTextRange, 0);
  objc_storeStrong((id *)&self->markedTextStyle, 0);
  objc_storeStrong((id *)&self->markedTextRange, 0);
  objc_destroyWeak((id *)&self->inputDelegate);
  objc_storeStrong((id *)&self->endOfDocument, 0);
  objc_storeStrong((id *)&self->beginningOfDocument, 0);
  objc_storeStrong((id *)&self->_collapsedInputView, 0);
}

@end
