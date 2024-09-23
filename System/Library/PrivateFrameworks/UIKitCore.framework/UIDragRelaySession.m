@implementation UIDragRelaySession

void __47___UIDragRelaySession_beginDragFromView_point___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dragSessionCompletedInitialCheckIn");

}

void __58___UIDragRelaySession_updateDragPreviewForItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setIndex:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  objc_msgSend(*(id *)(a1 + 40), "dragItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "previewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviewProvider:", 0);
  objc_msgSend(v5, "setPreviewProvider:", v6);
  objc_msgSend(v5, "_updatePreferredPreview");

}

@end
