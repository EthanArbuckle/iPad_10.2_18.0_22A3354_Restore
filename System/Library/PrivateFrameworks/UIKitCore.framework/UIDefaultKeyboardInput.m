@implementation UIDefaultKeyboardInput

- (id)textInputTraits
{
  UITextInputTraits *m_traits;
  UITextInputTraits *v4;
  UITextInputTraits *v5;

  m_traits = self->m_traits;
  if (!m_traits)
  {
    v4 = objc_alloc_init(UITextInputTraits);
    v5 = self->m_traits;
    self->m_traits = v4;

    m_traits = self->m_traits;
  }
  return m_traits;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[UIDefaultKeyboardInput textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIDefaultKeyboardInput;
    -[UIDefaultKeyboardInput forwardInvocation:](&v6, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIDefaultKeyboardInput textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "takeTraitsFrom:", v4);

}

- (id)delegate
{
  return 0;
}

- (unsigned)characterInRelationToCaretSelection:(int)a3
{
  return 0;
}

- (unsigned)characterBeforeCaretSelection
{
  return 0;
}

- (unsigned)characterAfterCaretSelection
{
  return 0;
}

- (id)fontForCaretSelection
{
  return 0;
}

- (id)textColorForCaretSelection
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (id)rectsForNSRange:(_NSRange)a3
{
  return 0;
}

- (int)wordOffsetInRange:(id)a3
{
  return -1;
}

- (BOOL)hasContent
{
  return 0;
}

- (BOOL)hasSelection
{
  return 0;
}

- (int)selectionState
{
  return 0;
}

- (BOOL)selectionAtDocumentStart
{
  return 0;
}

- (BOOL)selectionAtWordStart
{
  return 0;
}

- (_NSRange)selectionRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)rangeByMovingCurrentSelection:(int)a3
{
  return 0;
}

- (id)rangeByExtendingCurrentSelection:(int)a3
{
  return 0;
}

- (id)text
{
  return 0;
}

- (CGRect)caretRect
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

- (BOOL)isShowingPlaceholder
{
  return 0;
}

- (BOOL)isSecure
{
  return 0;
}

- (BOOL)acceptsEmoji
{
  return 0;
}

- (BOOL)forceEnableDictation
{
  return 0;
}

- (BOOL)forceDisableDictation
{
  return 0;
}

- (id)selectionView
{
  return 0;
}

- (UITextInteractionAssistant)interactionAssistant
{
  return 0;
}

- (BOOL)isEditable
{
  return 0;
}

- (BOOL)isEditing
{
  return 0;
}

- (BOOL)becomesEditableWithGestures
{
  return 0;
}

- (BOOL)hasText
{
  return 0;
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (UITextPosition)beginningOfDocument
{
  return 0;
}

- (UITextPosition)endOfDocument
{
  return 0;
}

- (id)textInRange:(id)a3
{
  return 0;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
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

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
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

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UITextRange)markedTextRange
{
  return 0;
}

- (NSDictionary)markedTextStyle
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

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (UITextInputTokenizer)tokenizer
{
  return 0;
}

- (UITextInputDelegate)inputDelegate
{
  return 0;
}

- (id)selectionRectsForRange:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_traits, 0);
}

@end
