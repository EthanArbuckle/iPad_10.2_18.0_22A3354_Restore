@implementation UISnapshotViewRectBlock

void ___UISnapshotViewRectBlock_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _OWORD v27[8];
  _QWORD v28[8];
  _QWORD v29[10];

  v29[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0CD30F0];
  v29[0] = *MEMORY[0x1E0CD3110];
  v5 = *MEMORY[0x1E0CD30B0];
  v28[0] = v4;
  v28[1] = v5;
  objc_msgSend(v3, "_screen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v28[2] = *MEMORY[0x1E0CD3098];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "contextId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v8;
  v28[3] = *MEMORY[0x1E0CD30E8];
  v26 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v9;
  v28[4] = *MEMORY[0x1E0CD30A8];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "_layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_slotId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v12, "value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v13;
  v28[5] = *MEMORY[0x1E0CD3140];
  v14 = *(_OWORD *)(a1 + 128);
  v27[4] = *(_OWORD *)(a1 + 112);
  v27[5] = v14;
  v15 = *(_OWORD *)(a1 + 160);
  v27[6] = *(_OWORD *)(a1 + 144);
  v27[7] = v15;
  v16 = *(_OWORD *)(a1 + 64);
  v27[0] = *(_OWORD *)(a1 + 48);
  v27[1] = v16;
  v17 = *(_OWORD *)(a1 + 96);
  v27[2] = *(_OWORD *)(a1 + 80);
  v27[3] = v17;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CD3130];
  v29[5] = v18;
  v29[6] = MEMORY[0x1E0C9AAB0];
  v20 = *MEMORY[0x1E0CD30E0];
  v28[6] = v19;
  v28[7] = v20;
  v29[7] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v3, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((CARenderServerSnapshot() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setSlotId:", 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "setAccessibilityIgnoresInvertColors:", objc_msgSend(*(id *)(a1 + 32), "accessibilityIgnoresInvertColors"));

}

@end
