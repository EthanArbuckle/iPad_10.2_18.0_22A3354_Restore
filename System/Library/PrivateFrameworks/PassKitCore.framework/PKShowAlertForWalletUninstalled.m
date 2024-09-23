@implementation PKShowAlertForWalletUninstalled

uint64_t __PKShowAlertForWalletUninstalled_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (!a3)
    PKOpenInstallWallet();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
