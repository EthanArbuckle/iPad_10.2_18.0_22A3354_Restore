@implementation PKPeerPaymentRemoveRecurringPaymentRecentMemoIcon

uint64_t __PKPeerPaymentRemoveRecurringPaymentRecentMemoIcon_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = a2;
  v10[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = PKCombinedHash(17, v7);
  return v8;
}

BOOL __PKPeerPaymentRemoveRecurringPaymentRecentMemoIcon_block_invoke_701(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() != *(_QWORD *)(a1 + 40);
  return v6;
}

@end
