@implementation LookupInstalledApplications

void __LookupInstalledApplications_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __LookupInstalledApplications_block_invoke_2;
  v12[3] = &unk_1E3E65890;
  v14 = v6;
  v15 = v7;
  v13 = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "getRemovableSytemApplicationsWithCompletionBlock:", v12);

}

uint64_t __LookupInstalledApplications_block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __LookupInstalledApplications_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __LookupInstalledApplications_block_invoke_4;
  v13[3] = &unk_1E3E65890;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v15 = v6;
  v16 = v7;
  v14 = v10;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v9, v13);

}

uint64_t __LookupInstalledApplications_block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __LookupInstalledApplications_block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 32);
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  v23 = *MEMORY[0x1E0DAFCE8];
  v21 = v1;
  if (v1)
  {
    v20 = *(_QWORD *)v34;
    v2 = *MEMORY[0x1E0DAFD08];
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v3);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v5 = *(id *)(a1 + 40);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v30;
          v22 = v3;
LABEL_8:
          v9 = 0;
          while (1)
          {
            if (*(_QWORD *)v30 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
            objc_msgSend(v10, "valueForProperty:", v2);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "isEqual:", v4))
              break;
            objc_msgSend(v10, "valueForProperty:", v23);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 48));

            if ((v13 & 1) != 0)
              goto LABEL_17;
            if (v7 == ++v9)
            {
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              v3 = v22;
              if (v7)
                goto LABEL_8;
              goto LABEL_15;
            }
          }

LABEL_17:
          v14 = v10;

          v3 = v22;
          if (v14)
            goto LABEL_21;
        }
        else
        {
LABEL_15:

        }
        ++v3;
      }
      while (v3 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v21);
  }
  v14 = 0;
LABEL_21:

  objc_msgSend(v14, "valueForProperty:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isPlaceholder");
  if (*(_QWORD *)(a1 + 56) && v15 && (v16 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 64), "isCanceled") & 1) == 0)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v15);
    v18 = *(void **)(a1 + 56);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __LookupInstalledApplications_block_invoke_6;
    v25[3] = &unk_1E3E65868;
    v26 = v18;
    v28 = *(id *)(a1 + 72);
    v27 = v14;
    objc_msgSend(v17, "getCGImageForImageDescriptor:completion:", v26, v25);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __LookupInstalledApplications_block_invoke_6(uint64_t a1, uint64_t a2)
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

void __LookupInstalledApplications_block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

@end
