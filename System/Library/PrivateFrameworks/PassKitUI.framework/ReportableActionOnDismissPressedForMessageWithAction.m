@implementation ReportableActionOnDismissPressedForMessageWithAction

void ___ReportableActionOnDismissPressedForMessageWithAction_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *MEMORY[0x1E0D68FA8];
  v3 = *MEMORY[0x1E0D68AA0];
  v6[0] = *MEMORY[0x1E0D68F50];
  v6[1] = v3;
  v4 = *MEMORY[0x1E0D68B18];
  v7[0] = v2;
  v7[1] = v4;
  v6[2] = *MEMORY[0x1E0D68858];
  v7[2] = *MEMORY[0x1E0D689C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ReportAnalyticsEventForMessage(v5, *(void **)(a1 + 32));

}

@end
