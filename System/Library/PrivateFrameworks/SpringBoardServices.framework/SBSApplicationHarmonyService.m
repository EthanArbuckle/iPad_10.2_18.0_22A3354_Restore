@implementation SBSApplicationHarmonyService

- (void)fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a3 withCompletionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (v6)
  {
    -[SBSAbstractFacilityService callbackQueue](self, "callbackQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSAbstractApplicationService client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __97__SBSApplicationHarmonyService_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E288DE80;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    objc_msgSend(v8, "fetchWhitePointAdaptivityStyleForDisplayId:withCompletionHandler:", v4, v10);

  }
}

void __97__SBSApplicationHarmonyService_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __97__SBSApplicationHarmonyService_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E288DE58;
  v3 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  dispatch_async(v3, v4);

}

uint64_t __97__SBSApplicationHarmonyService_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
