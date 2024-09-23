@implementation UIPrintInfoPrinterLookup

void ___UIPrintInfoPrinterLookup_block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = objc_msgSend(MEMORY[0x1E0D80A68], "printerLookupWithName:andTimeout:", *(_QWORD *)(a1 + 32), 60.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___UIPrintInfoPrinterLookup_block_invoke_2;
  v3[3] = &unk_1E9D97578;
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t ___UIPrintInfoPrinterLookup_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

@end
