@implementation PKSecureElementIsAvailableWithCompletion

void __PKSecureElementIsAvailableWithCompletion_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.passkit.secureelement.available", 0);
  v1 = (void *)qword_1ECF21D78;
  qword_1ECF21D78 = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.passkit.secureelement.reply", MEMORY[0x1E0C80D50]);
  v3 = (void *)qword_1ECF21D80;
  qword_1ECF21D80 = (uint64_t)v2;

}

void __PKSecureElementIsAvailableWithCompletion_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v2 = PKSecureElementAvailableFlags();
  if ((v2 & 1) != 0)
  {
    v5 = qword_1ECF21D80;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PKSecureElementIsAvailableWithCompletion_block_invoke_3;
    block[3] = &unk_1E2AC1C68;
    v8 = *(id *)(a1 + 32);
    v9 = v2;
    dispatch_async(v5, block);
    v3 = v8;
  }
  else
  {
    objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __PKSecureElementIsAvailableWithCompletion_block_invoke_4;
    v6[3] = &unk_1E2AC1CB8;
    v4 = *(id *)(a1 + 32);
    v6[4] = v4;
    if (qword_1ECF21D68 != -1)
      dispatch_once(&qword_1ECF21D68, &__block_literal_global_457_0);
    __PKSecureElementIsAvailableWithCompletion_block_invoke_4((uint64_t)v6, 1u, byte_1ECF21C7E != 0);

  }
}

uint64_t __PKSecureElementIsAvailableWithCompletion_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, (*(_QWORD *)(a1 + 40) >> 1) & 1);
  return result;
}

void __PKSecureElementIsAvailableWithCompletion_block_invoke_4(uint64_t a1, unsigned int a2, int a3)
{
  char v3;
  char v4;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  char v11;

  v3 = a3;
  v4 = a2;
  v6 = 2;
  if (!a3)
    v6 = 0;
  PKSetSecureElementAvailableFlags(v6 | a2);
  v7 = qword_1ECF21D80;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __PKSecureElementIsAvailableWithCompletion_block_invoke_5;
  v8[3] = &unk_1E2AC1C90;
  v9 = *(id *)(a1 + 32);
  v10 = v4;
  v11 = v3;
  dispatch_async(v7, v8);

}

uint64_t __PKSecureElementIsAvailableWithCompletion_block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  return result;
}

@end
