@implementation PXSharedLibraryFinishReviewAssistant

void __PXSharedLibraryFinishReviewAssistant_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (a2 && (objc_msgSend(*(id *)(a1 + 32), "isCancelled", v5) & 1) == 0)
    _CreateOrPublishLibraryScope(*(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 72), *(void **)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 64));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

@end
