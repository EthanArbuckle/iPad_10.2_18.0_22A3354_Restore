@implementation WFOutOfProcessWorkflowController

uint64_t __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

void __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, void *, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__13582;
    v22 = __Block_byref_object_dispose__13583;
    v23 = (id)objc_opt_new();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_2;
    v14 = &unk_1E7AEDA90;
    v7 = *(id *)(a1 + 32);
    v17 = *(_OWORD *)(a1 + 56);
    v15 = v7;
    v16 = &v18;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);
    v8 = objc_msgSend((id)v19[5], "copy", v11, v12, v13, v14);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

void __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_3;
  v11[3] = &unk_1E7AEDA68;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v7, "if_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[7], CFSTR("WFOutOfProcessWorkflowController+ContextualActions.m"), 44, CFSTR("can't find size descriptor matching the service's response (%@, %@)"), a1[4], v8);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setObject:forKeyedSubscript:", v6, v9);

}

uint64_t __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
