@implementation UIScenePresenterOwner

uint64_t __56___UIScenePresenterOwner_enumeratePresentersUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56___UIScenePresenterOwner_enumeratePresentersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

void __74___UIScenePresenterOwner__updateHostingStateForScenePresentersIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) == 0)
    objc_msgSend(v6, "updateHostingStateIfNecessary");

}

uint64_t __45___UIScenePresenterOwner__activatePresenter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __36___UIScenePresenterOwner_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __36___UIScenePresenterOwner_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

void __64___UIScenePresenterOwner_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("prioritizedPresenter"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("activePresenters"), 0);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("inactivePresenters"), 0);

}

@end
