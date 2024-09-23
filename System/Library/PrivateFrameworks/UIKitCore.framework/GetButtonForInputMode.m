@implementation GetButtonForInputMode

void ___GetButtonForInputMode_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputMode:userInitiated:", v2, 1);

}

@end
