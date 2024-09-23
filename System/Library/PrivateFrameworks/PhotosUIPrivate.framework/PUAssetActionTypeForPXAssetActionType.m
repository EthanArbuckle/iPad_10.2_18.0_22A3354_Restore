@implementation PUAssetActionTypeForPXAssetActionType

void __PUAssetActionTypeForPXAssetActionType_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[24];
  _QWORD v15[25];

  v15[24] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D7C138];
  v14[0] = *MEMORY[0x1E0D7C130];
  v14[1] = v0;
  v15[0] = &unk_1E59BB928;
  v15[1] = &unk_1E59BB940;
  v1 = *MEMORY[0x1E0D7C0D0];
  v14[2] = *MEMORY[0x1E0D7C010];
  v14[3] = v1;
  v15[2] = &unk_1E59BB958;
  v15[3] = &unk_1E59BB970;
  v2 = *MEMORY[0x1E0D7C128];
  v14[4] = *MEMORY[0x1E0D7C120];
  v14[5] = v2;
  v15[4] = &unk_1E59BB988;
  v15[5] = &unk_1E59BB9A0;
  v3 = *MEMORY[0x1E0D7C118];
  v14[6] = *MEMORY[0x1E0D7C0C0];
  v14[7] = v3;
  v15[6] = &unk_1E59BB9B8;
  v15[7] = &unk_1E59BB9D0;
  v4 = *MEMORY[0x1E0D7BF90];
  v14[8] = *MEMORY[0x1E0D7BF98];
  v14[9] = v4;
  v15[8] = &unk_1E59BB9E8;
  v15[9] = &unk_1E59BBA00;
  v5 = *MEMORY[0x1E0D7BFB0];
  v14[10] = *MEMORY[0x1E0D7C0E0];
  v14[11] = v5;
  v15[10] = &unk_1E59BBA18;
  v15[11] = &unk_1E59BBA30;
  v6 = *MEMORY[0x1E0D7BFB8];
  v14[12] = *MEMORY[0x1E0D7C0F8];
  v14[13] = v6;
  v15[12] = &unk_1E59BBA48;
  v15[13] = &unk_1E59BBA60;
  v7 = *MEMORY[0x1E0D7C088];
  v14[14] = *MEMORY[0x1E0D7BFC0];
  v14[15] = v7;
  v15[14] = &unk_1E59BBA78;
  v15[15] = &unk_1E59BBA90;
  v8 = *MEMORY[0x1E0D7BFD8];
  v14[16] = *MEMORY[0x1E0D7C0C8];
  v14[17] = v8;
  v15[16] = &unk_1E59BBAA8;
  v15[17] = &unk_1E59BBAC0;
  v9 = *MEMORY[0x1E0D7BFF8];
  v14[18] = *MEMORY[0x1E0D7BFF0];
  v14[19] = v9;
  v15[18] = &unk_1E59BBAD8;
  v15[19] = &unk_1E59BBAF0;
  v10 = *MEMORY[0x1E0D7BFE8];
  v14[20] = *MEMORY[0x1E0D7C060];
  v14[21] = v10;
  v15[20] = &unk_1E59BBB38;
  v15[21] = &unk_1E59BBB08;
  v11 = *MEMORY[0x1E0D7C0D8];
  v14[22] = *MEMORY[0x1E0D7BFE0];
  v14[23] = v11;
  v15[22] = &unk_1E59BBB20;
  v15[23] = &unk_1E59BBB50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 24);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)PUAssetActionTypeForPXAssetActionType__pxToPUActionTypeMapping;
  PUAssetActionTypeForPXAssetActionType__pxToPUActionTypeMapping = v12;

}

@end
