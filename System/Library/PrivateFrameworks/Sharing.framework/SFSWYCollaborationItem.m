@implementation SFSWYCollaborationItem

void __84___SFSWYCollaborationItem_initWithItemProvider_activityItem_isURLProviderSupported___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __84___SFSWYCollaborationItem_initWithItemProvider_activityItem_isURLProviderSupported___block_invoke_2;
    v4[3] = &unk_1E482D3A0;
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

void __84___SFSWYCollaborationItem_initWithItemProvider_activityItem_isURLProviderSupported___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "collaborationMetadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_didLoadMetadata:", v3);

}

@end
