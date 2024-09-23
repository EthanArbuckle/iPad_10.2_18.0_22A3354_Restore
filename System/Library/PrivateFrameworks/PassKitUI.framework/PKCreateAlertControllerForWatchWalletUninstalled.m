@implementation PKCreateAlertControllerForWatchWalletUninstalled

uint64_t __PKCreateAlertControllerForWatchWalletUninstalled_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __PKCreateAlertControllerForWatchWalletUninstalled_block_invoke_2()
{
  return PKBeginInstallWatchWallet();
}

@end
