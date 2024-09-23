@implementation LookupSystemApplications

void __LookupSystemApplications_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 1);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v6);
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v7, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

      if ((v8 & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v7;

    if (!v10)
      goto LABEL_12;
    v11 = objc_alloc(MEMORY[0x1E0D3A820]);
    objc_msgSend(v10, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithURL:", v12);

    v14 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __LookupSystemApplications_block_invoke_2;
    v17[3] = &unk_1E3E65868;
    v18 = v14;
    v15 = *(id *)(a1 + 48);
    v19 = v10;
    v20 = v15;
    v16 = v10;
    objc_msgSend(v13, "getCGImageForImageDescriptor:completion:", v18, v17);

  }
  else
  {
LABEL_9:

LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __LookupSystemApplications_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  id v6;

  if (a2)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(*(id *)(a1 + 32), "scale");
    v5 = objc_msgSend(v4, "initWithCGImage:scale:orientation:", a2, 0);
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
