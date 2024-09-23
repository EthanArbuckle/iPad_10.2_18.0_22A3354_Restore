@implementation _UITextLayoutControllerBase

- (id)positionFromPosition:(uint64_t)a3 offset:
{
  if (a1)
  {
    objc_msgSend(a1, "positionFromPosition:offset:affinity:", a2, a3, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (UITextInputController)textInputController
{
  UITextInputController *v1;
  UITextInputDelegate *inputDelegate;

  if (a1)
  {
    v1 = a1;
    inputDelegate = a1->_inputDelegate;
    if (inputDelegate)
    {
      -[UITextInputDelegate textInputController](inputDelegate, "textInputController");
      a1 = (UITextInputController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = -[UITextInputController initWithTextLayoutController:]([UITextInputController alloc], "initWithTextLayoutController:", v1);
    }
  }
  return a1;
}

- (UITextRange)unobscuredRange
{
  UITextRange *unobscuredRange;
  UITextRange *v3;
  _UITextLayoutControllerBase *v4;
  void *v5;

  unobscuredRange = self->_unobscuredRange;
  if (unobscuredRange)
  {
    v3 = unobscuredRange;
  }
  else
  {
    v4 = self;
    -[_UITextLayoutControllerBase beginningOfDocument](v4, "beginningOfDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextLayoutControllerBase emptyTextRangeAtPosition:](v4, "emptyTextRangeAtPosition:", v5);
    v3 = (UITextRange *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setUnobscuredRange:(id)a3
{
  objc_storeStrong((id *)&self->_unobscuredRange, a3);
}

+ (_UITextKit2LayoutController)layoutControllerWithTextView:(void *)a3 textContainer:
{
  id v4;
  id v5;
  void *v6;
  _UITextKit2LayoutController *v7;
  _UITextKit2LayoutController *v8;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(v4, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[_UITextKit2LayoutController initWithTextView:textContainer:]([_UITextKit2LayoutController alloc], "initWithTextView:textContainer:", v5, v4);
  else
    v7 = (_UITextKit2LayoutController *)-[_UITextKit1LayoutController initWithTextView:textContainer:]((id *)[_UITextKit1LayoutController alloc], v5, v4);
  v8 = v7;

  return v8;
}

- (NSTextContainer)firstTextContainer
{
  void *v2;
  void *v3;

  -[_UITextLayoutControllerBase textContainers](self, "textContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTextContainer *)v3;
}

- (void)adoptTextInputController:(id)a3
{
  _UITextInputControllerLayoutManagerConnection *textInputControllerConnection;
  _UITextInputControllerLayoutManagerConnection *v4;
  id v6;
  _UITextInputControllerLayoutManagerConnection *v7;
  _UITextInputControllerLayoutManagerConnection *v8;

  textInputControllerConnection = self->_textInputControllerConnection;
  if (textInputControllerConnection)
  {
    v8 = (_UITextInputControllerLayoutManagerConnection *)a3;
    -[_UITextInputControllerLayoutManagerConnection setTextInputController:](textInputControllerConnection, "setTextInputController:", v8);
    v4 = v8;
  }
  else
  {
    v6 = a3;
    v7 = -[_UITextInputControllerLayoutManagerConnection initWithTextInputController:]([_UITextInputControllerLayoutManagerConnection alloc], "initWithTextInputController:", v6);

    v4 = self->_textInputControllerConnection;
    self->_textInputControllerConnection = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unobscuredRange, 0);
  objc_storeStrong((id *)&self->_classicCanvasViewClass, 0);
  objc_storeStrong((id *)&self->_textInputControllerConnection, 0);
}

- (_UITextLayoutBaselineCalculator)baselineCalculatorForView:(uint64_t)a1 typingAttributes:(void *)a2 usesLineFragmentOrigin:(void *)a3 fallbackTextContainerOrigin:(uint64_t)a4
{
  id v7;
  id v8;
  _UITextLayoutBaselineCalculator *v9;
  _UITextLayoutBaselineCalculator *v10;

  if (a1)
  {
    v7 = a3;
    v8 = a2;
    v9 = [_UITextLayoutBaselineCalculator alloc];
    objc_msgSend(v8, "_currentScreenScale");
    v10 = -[_UITextLayoutBaselineCalculator initWithTextLayoutController:typingAttributes:usesLineFragmentOrigin:coordinateSpace:scale:fallbackTextContainerOrigin:](v9, "initWithTextLayoutController:typingAttributes:usesLineFragmentOrigin:coordinateSpace:scale:fallbackTextContainerOrigin:", a1, v7, a4, v8);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)nearestTextRangeAtPoint:(double)a3 inContainer:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v7 = a1;
    objc_msgSend(v7, "nearestPositionAtPoint:inContainer:", a2, a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:offset:affinity:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "textRangeFromPosition:toPosition:", v8, v9);
    else
      objc_msgSend(v7, "emptyTextRangeAtPosition:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)detachFromTextInputController
{
  int has_internal_diagnostics;
  _UITextInputControllerLayoutManagerConnection *textInputControllerConnection;
  int v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];
  uint8_t v16[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  textInputControllerConnection = self->_textInputControllerConnection;
  if (has_internal_diagnostics)
  {
    if (!textInputControllerConnection)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Cannot detach if we were never attached", v16, 2u);
      }

    }
  }
  else if (!textInputControllerConnection)
  {
    v9 = _MergedGlobals_1241;
    if (!_MergedGlobals_1241)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_MergedGlobals_1241);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Cannot detach if we were never attached", buf, 2u);
    }
  }
  v5 = os_variant_has_internal_diagnostics();
  -[_UITextInputControllerLayoutManagerConnection textInputController](self->_textInputControllerConnection, "textInputController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Already detached", v14, 2u);
      }

    }
  }
  else if (!v6)
  {
    v11 = qword_1ECD809C8;
    if (!qword_1ECD809C8)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&qword_1ECD809C8);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Already detached", v13, 2u);
    }
  }
  -[_UITextInputControllerLayoutManagerConnection setTextInputController:](self->_textInputControllerConnection, "setTextInputController:", 0);
}

- (BOOL)isDocumentObscured
{
  return self->_documentObscured;
}

- (void)setDocumentObscured:(BOOL)a3
{
  self->_documentObscured = a3;
}

@end
