@implementation UIFindNavigatorResponder

void __66___UIFindNavigatorResponder_becomeFirstResponderAndFocusFindField__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "findNavigatorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findNavigatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
}

@end
