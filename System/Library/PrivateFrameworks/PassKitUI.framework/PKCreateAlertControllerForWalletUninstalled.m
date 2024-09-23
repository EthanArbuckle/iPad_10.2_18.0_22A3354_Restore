@implementation PKCreateAlertControllerForWalletUninstalled

uint64_t __PKCreateAlertControllerForWalletUninstalled_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __PKCreateAlertControllerForWalletUninstalled_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  PKOpenInstallWallet();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
