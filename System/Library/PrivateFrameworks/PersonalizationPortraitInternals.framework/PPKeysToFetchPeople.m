@implementation PPKeysToFetchPeople

void __PPKeysToFetchPeople_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[17];

  v11[16] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = *MEMORY[0x1E0C966D0];
  v11[0] = *MEMORY[0x1E0C96790];
  v11[1] = v1;
  v2 = *MEMORY[0x1E0C966C0];
  v11[2] = *MEMORY[0x1E0C96780];
  v11[3] = v2;
  v3 = *MEMORY[0x1E0C967A0];
  v11[4] = *MEMORY[0x1E0C96798];
  v11[5] = v3;
  v4 = *MEMORY[0x1E0C966A8];
  v11[6] = *MEMORY[0x1E0C967C0];
  v11[7] = v4;
  v5 = *MEMORY[0x1E0C967B8];
  v11[8] = *MEMORY[0x1E0C967F0];
  v11[9] = v5;
  v6 = *MEMORY[0x1E0C96670];
  v11[10] = *MEMORY[0x1E0C96758];
  v11[11] = v6;
  v7 = *MEMORY[0x1E0C967A8];
  v11[12] = *MEMORY[0x1E0C96868];
  v11[13] = v7;
  v11[14] = *MEMORY[0x1E0C96898];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[15] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 16);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)PPKeysToFetchPeople__pasExprOnceResult;
  PPKeysToFetchPeople__pasExprOnceResult = v9;

  objc_autoreleasePoolPop(v0);
}

@end
