@implementation TVCollectionView

void __50___TVCollectionView_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "collectionView:shouldHandleLongPressForItemAtIndexPath:", *(_QWORD *)(a1 + 32), v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

void __39___TVCollectionView__playButtonAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView:didReceivePhysicalPlayForItemAtIndexPath:", *(_QWORD *)(a1 + 32), v4);

}

void __38___TVCollectionView__longPressAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView:didReceiveLongPressForItemAtIndexPath:", *(_QWORD *)(a1 + 32), v4);

}

id __37___TVCollectionView_setContentInset___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_TVCollectionView;
  return objc_msgSendSuper2(&v2, sel_setContentInset_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
