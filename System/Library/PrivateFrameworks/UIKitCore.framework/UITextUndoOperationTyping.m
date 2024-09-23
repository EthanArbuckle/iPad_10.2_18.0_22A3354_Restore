@implementation UITextUndoOperationTyping

uint64_t __38___UITextUndoOperationTyping_undoRedo__block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "replaceCharactersInRange:withAttributedString:", a1[5], a1[6], *(_QWORD *)(a1[4] + 48));
}

@end
