@implementation UIEditMenuListViewCell

uint64_t __41___UIEditMenuListViewCell__setupSlotView__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolvedStyleForStyle:", a2);
}

void __41___UIEditMenuListViewCell__setupSlotView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16[2];

  v7 = a3;
  v8 = a4;
  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___UIEditMenuListViewCell__setupSlotView__block_invoke_3;
  block[3] = &unk_1E16D5C70;
  v16[1] = a2;
  v13 = v7;
  v14 = *(id *)(a1 + 32);
  v10 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  v15 = v8;
  v11 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __41___UIEditMenuListViewCell__setupSlotView__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  +[_UIConcretePasteboard _remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:](_UIConcretePasteboard, "_remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41___UIEditMenuListViewCell__setupSlotView__block_invoke_4;
    block[3] = &unk_1E16D5C48;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    v5 = *(id *)(a1 + 48);
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v6);
  }

}

void __41___UIEditMenuListViewCell__setupSlotView__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "_wantsPasteSlotView")
    && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    objc_msgSend(WeakRetained, "_hideContents");
  }

}

@end
