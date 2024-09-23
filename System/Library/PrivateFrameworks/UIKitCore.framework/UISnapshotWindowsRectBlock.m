@implementation UISnapshotWindowsRectBlock

void ___UISnapshotWindowsRectBlock_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0CD30F0];
  v20[0] = *MEMORY[0x1E0CD3108];
  v4 = *MEMORY[0x1E0CD30B0];
  v19[0] = v3;
  v19[1] = v4;
  objc_msgSend(v2, "_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  v19[2] = *MEMORY[0x1E0CD30A8];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "_layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_slotId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = *MEMORY[0x1E0CD30A0];
  v10 = *(_QWORD *)(a1 + 48);
  v20[2] = v9;
  v20[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 56);
  v13 = v11;
  v14 = v12;
  if (objc_msgSend(v14, "count"))
  {
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v15, "addEntriesFromDictionary:", v14);
    v16 = (id)objc_msgSend(v15, "copy");

  }
  else
  {
    v16 = v13;
  }

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
