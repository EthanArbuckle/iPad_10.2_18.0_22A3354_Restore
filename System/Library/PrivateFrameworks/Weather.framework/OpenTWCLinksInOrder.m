@implementation OpenTWCLinksInOrder

void __OpenTWCLinksInOrder_block_invoke(uint64_t a1, char a2)
{
  id v2;

  if ((a2 & 1) == 0)
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v2, "removeObjectAtIndex:", 0);
    OpenTWCLinksInOrder(v2);

  }
}

@end
