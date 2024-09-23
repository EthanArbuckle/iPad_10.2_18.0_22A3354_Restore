@implementation UIOutlineItemRenderer

void __63___UIOutlineItemRenderer_initWithIdentifier_cellClass_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "willUpdateCellHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "willUpdateCellHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v9)[2](v9, v10, v5);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
