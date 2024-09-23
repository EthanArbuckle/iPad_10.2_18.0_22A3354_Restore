@implementation UITextLayoutFragmentView

void __38___UITextLayoutFragmentView_drawRect___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layoutFragment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawAtPoint:inContext:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

@end
