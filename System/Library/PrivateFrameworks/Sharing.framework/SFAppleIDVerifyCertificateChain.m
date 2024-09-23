@implementation SFAppleIDVerifyCertificateChain

void __SFAppleIDVerifyCertificateChain_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;
  id v9;

  v5 = *(id *)(a1 + 32);
  v6 = 0;
  v7 = a3 == 4 || a3 == 1;
  if (a3 != 1 && a3 != 4)
  {
    v6 = 201219;
    if (gLogCategory_SFAppleIDKeychainUtilities <= 60)
    {
      v8 = v5;
      if (gLogCategory_SFAppleIDKeychainUtilities != -1 || _LogCategory_Initialize())
        LogPrintF();
      v5 = v8;
    }
  }
  if (v5)
  {
    v9 = v5;
    (*((void (**)(id, uint64_t, _BOOL8, uint64_t))v5 + 2))(v5, a2, v7, v6);
    v5 = v9;
  }

}

uint64_t __SFAppleIDVerifyCertificateChain_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, *(unsigned int *)(a1 + 40));
}

@end
