@implementation UINavigationBarItemStack

void __42___UINavigationBarItemStack_iterateItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "item");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

uint64_t __51___UINavigationBarItemStack_reverseIterateEntries___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
