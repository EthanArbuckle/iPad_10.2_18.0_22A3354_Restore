@implementation WBSPrivateBrowsingUserDefinedContentBlockerManager

void __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __104__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__clearAllEditsForContentBlocker___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "clearAllEditsForContentBlocker:", a2);
  return result;
}

@end
