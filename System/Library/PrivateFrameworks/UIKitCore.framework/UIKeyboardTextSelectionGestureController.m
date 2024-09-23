@implementation UIKeyboardTextSelectionGestureController

void __59___UIKeyboardTextSelectionGestureController_sharedInstance__block_invoke()
{
  _UIKeyboardTextSelectionGestureController *v0;
  void *v1;

  v0 = objc_alloc_init(_UIKeyboardTextSelectionGestureController);
  v1 = (void *)qword_1ECD7C640;
  qword_1ECD7C640 = (uint64_t)v0;

}

void __74___UIKeyboardTextSelectionGestureController_willRemoveSelectionController__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setEnabled:", 0);
  objc_msgSend(v2, "setEnabled:", 1);

}

@end
