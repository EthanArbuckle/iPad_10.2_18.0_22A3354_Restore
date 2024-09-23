@implementation UILabelAttributedStringContent

void __69___UILabelAttributedStringContent_intelligenceLightAttributedStrings__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)off_1E1678D98;
  if (a2)
    v3 = *(void **)(a1 + 32);
  else
    v3 = *(void **)(a1 + 40);
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:value:range:", v2);

}

void __59___UILabelAttributedStringContent_labelViewTextAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
