@implementation PXPhotosBarsSelectModeChevronButton

void __PXPhotosBarsSelectModeChevronButton_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHeld");
  v5 = 40;
  if (v4)
    v5 = 32;
  objc_msgSend(v8, "setImage:", *(_QWORD *)(a1 + v5));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "background");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(v3, "setConfiguration:", v8);
}

id __PXPhotosBarsSelectModeChevronButton_block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "barsControllerActionsForSelectionContextMenu:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5149688, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
