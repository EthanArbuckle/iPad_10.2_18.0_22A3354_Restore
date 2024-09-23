@implementation SBHIconLibraryTableView

uint64_t __42___SBHIconLibraryTableView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "headerViewForSection:", objc_msgSend(a2, "section"));
}

@end
