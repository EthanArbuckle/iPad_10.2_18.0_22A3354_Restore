@implementation PXChangeDetailsEntryForSection

void ___PXChangeDetailsEntryForSection_block_invoke(uint64_t a1, uint64_t a2)
{
  _PXChangeDetailsEntry *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "subitemChangesInItem:section:", a2, *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[_PXChangeDetailsEntry initWithIndex:changeDetails:]([_PXChangeDetailsEntry alloc], "initWithIndex:changeDetails:", a2, v5);
  objc_msgSend(*(id *)(a1 + 40), "addSubitemEntry:", v4);

}

@end
