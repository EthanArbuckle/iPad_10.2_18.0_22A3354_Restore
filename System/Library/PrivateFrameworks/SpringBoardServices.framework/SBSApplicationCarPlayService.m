@implementation SBSApplicationCarPlayService

- (void)fetchIconStateForVehicleId:(id)a3 withCompletion:(id)a4
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v4 = a4;
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__SBSApplicationCarPlayService_fetchIconStateForVehicleId_withCompletion___block_invoke;
    block[3] = &unk_1E288D310;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __74__SBSApplicationCarPlayService_fetchIconStateForVehicleId_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 inVehicle:(id)a4 withCompletion:(id)a5
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v5 = a5;
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__SBSApplicationCarPlayService_fetchApplicationIconInformationForBundleIdentifier_inVehicle_withCompletion___block_invoke;
    block[3] = &unk_1E288D310;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __108__SBSApplicationCarPlayService_fetchApplicationIconInformationForBundleIdentifier_inVehicle_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
