@implementation PXFetchSnapshotImageForDescriptor

void __PXFetchSnapshotImageForDescriptor_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  void *v14;
  void (*v15)(void);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "snapshots", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i));
          v13 = objc_msgSend(v12, "image");
          if (v13)
          {
            v16 = v13;
            v17 = objc_msgSend(v12, "imageOrientation");
            if ((unint64_t)(v17 - 1) >= 7)
              v18 = 0;
            else
              v18 = v17;

            objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v16, v18, 1.0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", *(_QWORD *)off_1E50B8070, -1, CFSTR("Poster snapshot image could not be loaded."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_15:
    v15();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
