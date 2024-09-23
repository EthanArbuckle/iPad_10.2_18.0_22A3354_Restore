@implementation UISnapshotScreenWindowsRectBlock

void ___UISnapshotScreenWindowsRectBlock_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _OWORD v19[8];
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0CD30F0];
  v21[0] = *MEMORY[0x1E0CD3118];
  v4 = *MEMORY[0x1E0CD30B0];
  v20[0] = v3;
  v20[1] = v4;
  objc_msgSend(v2, "_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  v20[2] = *MEMORY[0x1E0CD30A8];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "_layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_slotId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  v20[3] = *MEMORY[0x1E0CD3140];
  v10 = *(_OWORD *)(a1 + 136);
  v19[4] = *(_OWORD *)(a1 + 120);
  v19[5] = v10;
  v11 = *(_OWORD *)(a1 + 168);
  v19[6] = *(_OWORD *)(a1 + 152);
  v19[7] = v11;
  v12 = *(_OWORD *)(a1 + 72);
  v19[0] = *(_OWORD *)(a1 + 56);
  v19[1] = v12;
  v13 = *(_OWORD *)(a1 + 104);
  v19[2] = *(_OWORD *)(a1 + 88);
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = *MEMORY[0x1E0CD30A0];
  v15 = *(_QWORD *)(a1 + 48);
  v21[3] = v14;
  v21[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScreen _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v2, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((CARenderServerSnapshot() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setSlotId:", 0);

  }
}

@end
