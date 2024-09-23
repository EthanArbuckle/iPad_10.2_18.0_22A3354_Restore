@implementation SBWorkspaceTerminateApps

uint64_t ___SBWorkspaceTerminateApps_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void ___SBWorkspaceTerminateApps_block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___SBWorkspaceTerminateApps_block_invoke_3;
  block[3] = &unk_1E8E9DED8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t ___SBWorkspaceTerminateApps_block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

@end
