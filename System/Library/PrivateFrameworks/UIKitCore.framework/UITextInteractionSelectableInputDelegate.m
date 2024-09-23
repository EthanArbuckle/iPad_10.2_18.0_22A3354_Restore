@implementation UITextInteractionSelectableInputDelegate

+ (UITextInteractionSelectableInputDelegate)selectableInputDelegateWithTextInput:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[3];
  v5[3] = v4;

  return (UITextInteractionSelectableInputDelegate *)v5;
}

- (UITextInput)textInput
{
  return self->_textInput;
}

- (void)updateSelectionRects
{
  void *v2;
  id v3;

  -[UITextInput interactionAssistant](self->_textInput, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "selectionChanged");
    objc_msgSend(v3, "setNeedsSelectionDisplayUpdate");
    v2 = v3;
  }

}

- (id)nextResponder
{
  return self->_textInput;
}

- (BOOL)hasText
{
  return -[UITextInput hasText](self->_textInput, "hasText");
}

- (void)insertText:(id)a3
{
  -[UITextInput insertText:](self->_textInput, "insertText:", a3);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (void)deleteBackward
{
  -[UITextInput deleteBackward](self->_textInput, "deleteBackward");
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (id)textInRange:(id)a3
{
  return (id)-[UITextInput textInRange:](self->_textInput, "textInRange:", a3);
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  -[UITextInput replaceRange:withText:](self->_textInput, "replaceRange:withText:", a3, a4);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)-[UITextInput selectedTextRange](self->_textInput, "selectedTextRange");
}

- (void)setSelectedTextRange:(id)a3
{
  -[UITextInput setSelectedTextRange:](self->_textInput, "setSelectedTextRange:", a3);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (UITextRange)markedTextRange
{
  return (UITextRange *)-[UITextInput markedTextRange](self->_textInput, "markedTextRange");
}

- (NSDictionary)markedTextStyle
{
  return (NSDictionary *)-[UITextInput markedTextStyle](self->_textInput, "markedTextStyle");
}

- (void)setMarkedTextStyle:(id)a3
{
  -[UITextInput setMarkedTextStyle:](self->_textInput, "setMarkedTextStyle:", a3);
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  -[UITextInput setMarkedText:selectedRange:](self->_textInput, "setMarkedText:selectedRange:", a3, a4.location, a4.length);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (void)unmarkText
{
  -[UITextInput unmarkText](self->_textInput, "unmarkText");
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (UITextPosition)beginningOfDocument
{
  return (UITextPosition *)-[UITextInput beginningOfDocument](self->_textInput, "beginningOfDocument");
}

- (UITextPosition)endOfDocument
{
  return (UITextPosition *)-[UITextInput endOfDocument](self->_textInput, "endOfDocument");
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return (id)-[UITextInput textRangeFromPosition:toPosition:](self->_textInput, "textRangeFromPosition:toPosition:", a3, a4);
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return (id)-[UITextInput positionFromPosition:offset:](self->_textInput, "positionFromPosition:offset:", a3, a4);
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return (id)-[UITextInput positionFromPosition:inDirection:offset:](self->_textInput, "positionFromPosition:inDirection:offset:", a3, a4, a5);
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return -[UITextInput comparePosition:toPosition:](self->_textInput, "comparePosition:toPosition:", a3, a4);
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return -[UITextInput offsetFromPosition:toPosition:](self->_textInput, "offsetFromPosition:toPosition:", a3, a4);
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)-[UITextInput inputDelegate](self->_textInput, "inputDelegate");
}

- (void)setInputDelegate:(id)a3
{
  -[UITextInput setInputDelegate:](self->_textInput, "setInputDelegate:", a3);
}

- (UITextInputTokenizer)tokenizer
{
  return (UITextInputTokenizer *)-[UITextInput tokenizer](self->_textInput, "tokenizer");
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return (id)-[UITextInput positionWithinRange:farthestInDirection:](self->_textInput, "positionWithinRange:farthestInDirection:", a3, a4);
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return (id)-[UITextInput characterRangeByExtendingPosition:inDirection:](self->_textInput, "characterRangeByExtendingPosition:inDirection:", a3, a4);
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -[UITextInput baseWritingDirectionForPosition:inDirection:](self->_textInput, "baseWritingDirectionForPosition:inDirection:", a3, a4);
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  -[UITextInput setBaseWritingDirection:forRange:](self->_textInput, "setBaseWritingDirection:forRange:", a3, a4);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UITextInput firstRectForRange:](self->_textInput, "firstRectForRange:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UITextInput caretRectForPosition:](self->_textInput, "caretRectForPosition:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  return (id)-[UITextInput selectionRectsForRange:](self->_textInput, "selectionRectsForRange:", a3);
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return (id)-[UITextInput closestPositionToPoint:](self->_textInput, "closestPositionToPoint:", a3.x, a3.y);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return (id)-[UITextInput closestPositionToPoint:withinRange:](self->_textInput, "closestPositionToPoint:withinRange:", a4, a3.x, a3.y);
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return (id)-[UITextInput characterRangeAtPoint:](self->_textInput, "characterRangeAtPoint:", a3.x, a3.y);
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  -[UITextInput _deleteBackwardAndNotify:](self->_textInput, "_deleteBackwardAndNotify:", a3);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (void)_deleteForwardAndNotify:(BOOL)a3
{
  -[UITextInput _deleteForwardAndNotify:](self->_textInput, "_deleteForwardAndNotify:", a3);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (void)_moveCurrentSelection:(int)a3
{
  -[UITextInput _moveCurrentSelection:](self->_textInput, "_moveCurrentSelection:", *(_QWORD *)&a3);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  -[UITextInput _setMarkedText:selectedRange:](self->_textInput, "_setMarkedText:selectedRange:", a3, a4.location, a4.length);
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (void)_unmarkText
{
  -[UITextInput _unmarkText](self->_textInput, "_unmarkText");
  -[UITextInteractionSelectableInputDelegate updateSelectionRects](self, "updateSelectionRects");
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveUp:withHistory:](self->_textInput, "_moveUp:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveDown:withHistory:](self->_textInput, "_moveDown:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveLeft:withHistory:](self->_textInput, "_moveLeft:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveRight:withHistory:](self->_textInput, "_moveRight:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveToStartOfWord:withHistory:](self->_textInput, "_moveToStartOfWord:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveToStartOfParagraph:withHistory:](self->_textInput, "_moveToStartOfParagraph:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveToStartOfLine:withHistory:](self->_textInput, "_moveToStartOfLine:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveToStartOfDocument:withHistory:](self->_textInput, "_moveToStartOfDocument:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveToEndOfWord:withHistory:](self->_textInput, "_moveToEndOfWord:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveToEndOfParagraph:withHistory:](self->_textInput, "_moveToEndOfParagraph:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveToEndOfLine:withHistory:](self->_textInput, "_moveToEndOfLine:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  UITextInput *textInput;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  textInput = self->_textInput;
  v7 = a4;
  -[UITextInput inputDelegate](textInput, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionWillChange:", self->_textInput);

  -[UITextInput _moveToEndOfDocument:withHistory:](self->_textInput, "_moveToEndOfDocument:withHistory:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput inputDelegate](self->_textInput, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange:", self->_textInput);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInput, 0);
}

@end
