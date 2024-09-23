@implementation LookupApplications

void __LookupApplications_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6), 0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;

          v9 = objc_alloc(MEMORY[0x1E0D3A820]);
          objc_msgSend(v8, "URL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v9, "initWithURL:", v10);

          v12 = *(void **)(a1 + 40);
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __LookupApplications_block_invoke_2;
          v14[3] = &unk_1E3E65868;
          v15 = v12;
          v16 = v8;
          v17 = *(id *)(a1 + 48);
          v13 = v8;
          objc_msgSend(v11, "getCGImageForImageDescriptor:completion:", v15, v14);

          return;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v4)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __LookupApplications_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  id v6;

  if (a2)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(*(id *)(a1 + 32), "scale");
    v6 = (id)objc_msgSend(v4, "initWithCGImage:scale:orientation:", a2, 0);
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = *(_QWORD *)(a1 + 40);
  else
    v5 = 0;
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6);

}

@end
