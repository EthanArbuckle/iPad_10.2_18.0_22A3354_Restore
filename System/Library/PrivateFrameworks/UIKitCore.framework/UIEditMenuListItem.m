@implementation UIEditMenuListItem

void __43___UIEditMenuListItem_itemWithMenuElement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSelector:", objc_msgSend(a2, "action"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __43___UIEditMenuListItem_itemWithMenuElement___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC5BE8];
  objc_msgSend(a2, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variantForActionIdentifier:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
