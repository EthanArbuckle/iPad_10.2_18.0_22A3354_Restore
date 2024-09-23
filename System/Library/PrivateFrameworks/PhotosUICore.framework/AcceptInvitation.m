@implementation AcceptInvitation

void ___AcceptInvitation_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "assetLocalIdentifiers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _MoveAssetsIfNecessary(v4, v3, v5, *(void **)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

@end
