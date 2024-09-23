@implementation UICollectionView

BOOL __55__UICollectionView_IC__ic_selectionContainsFocusedItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "row");
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "row"))
  {
    v5 = objc_msgSend(v3, "item");
    v6 = v5 == objc_msgSend(*(id *)(a1 + 32), "item");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
