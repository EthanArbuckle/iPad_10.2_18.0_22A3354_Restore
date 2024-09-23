@implementation PKPeerPaymentAddRecurringPaymentRecentMemoIcon

uint64_t __PKPeerPaymentAddRecurringPaymentRecentMemoIcon_block_invoke(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = a1;
  v9[1] = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = PKCombinedHash(17, v6);
  return v7;
}

@end
