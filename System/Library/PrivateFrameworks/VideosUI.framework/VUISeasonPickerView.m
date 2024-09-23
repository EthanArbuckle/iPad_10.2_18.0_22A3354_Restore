@implementation VUISeasonPickerView

void __38___VUISeasonPickerView_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

}

@end
