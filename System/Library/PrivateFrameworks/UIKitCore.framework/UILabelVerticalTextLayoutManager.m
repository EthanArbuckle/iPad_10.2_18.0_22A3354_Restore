@implementation UILabelVerticalTextLayoutManager

uint64_t __84___UILabelVerticalTextLayoutManager__drawWithAttributedString_rect_options_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "layoutFragmentFrame");
  objc_msgSend(v3, "drawAtPoint:inContext:", *(_QWORD *)(a1 + 32));

  return 1;
}

@end
