@implementation UISnapshotLayerIdRectBlock

void ___UISnapshotLayerIdRectBlock_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _OWORD v22[8];
  _QWORD v23[8];
  _QWORD v24[10];

  v24[8] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0CD30F0];
  v24[0] = *MEMORY[0x1E0CD3110];
  v4 = *MEMORY[0x1E0CD30B0];
  v23[0] = v3;
  v23[1] = v4;
  objc_msgSend(v2, "_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v5;
  v23[2] = *MEMORY[0x1E0CD3098];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 184));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  v23[3] = *MEMORY[0x1E0CD30E8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  v23[4] = *MEMORY[0x1E0CD30A8];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "_layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_slotId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v10, "value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v11;
  v23[5] = *MEMORY[0x1E0CD3140];
  v12 = *(_OWORD *)(a1 + 136);
  v22[4] = *(_OWORD *)(a1 + 120);
  v22[5] = v12;
  v13 = *(_OWORD *)(a1 + 168);
  v22[6] = *(_OWORD *)(a1 + 152);
  v22[7] = v13;
  v14 = *(_OWORD *)(a1 + 72);
  v22[0] = *(_OWORD *)(a1 + 56);
  v22[1] = v14;
  v15 = *(_OWORD *)(a1 + 104);
  v22[2] = *(_OWORD *)(a1 + 88);
  v22[3] = v15;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CD30E0];
  v24[5] = v16;
  v24[6] = MEMORY[0x1E0C9AAB0];
  v18 = *MEMORY[0x1E0CD30D8];
  v23[6] = v17;
  v23[7] = v18;
  v24[7] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScreen _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v2, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((CARenderServerSnapshot() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_setSlotId:", 0);

  }
}

@end
