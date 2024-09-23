@implementation MAAutoAsset

uint64_t __97__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDetermineResultAtBegin_withCompletion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __114__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDetermineResultAtEnd_assets_bytes_error_withCompletion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __90__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDownloadAtBegin_withCompletion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __107__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDownloadAtEnd_assets_bytes_error_withCompletion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __88__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageCancelAtBegin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __101__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageCancelAtEnd_operationError_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __90__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stagePurgeAllAtBegin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __103__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stagePurgeAllAtEnd_operationError_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__MAAutoAsset_SUCoreBorderMAAutoAsset__SUCoreBorder_stagePurgeAll___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DA8988];
  v4 = a2;
  objc_msgSend(v3, "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "end:atFunction:", CFSTR("ma"), CFSTR("stagePurgeAll"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "_SUCoreBorder_stagePurgeAllAtEnd:operationError:withCompletion:", v6, v4, *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
