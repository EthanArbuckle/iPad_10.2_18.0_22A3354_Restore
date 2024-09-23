@implementation PassMeetsFilterRequirements

void ___PassMeetsFilterRequirements_block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  BOOL v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a2;
  objc_msgSend(v5, "passUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_14;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_14;
  }
  if ((objc_msgSend(v5, "isNFCExpressEnabled") & 1) != 0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    objc_msgSend(v5, "passInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___PassMeetsFilterRequirements_block_invoke_2;
    v14[3] = &unk_1E2AD6CB0;
    v14[4] = &v15;
    objc_msgSend(v12, "enumerateCredentialsWithHandler:", v14);
    if (*((_BYTE *)v16 + 24))
      v13 = 0;
    else
      v13 = objc_msgSend(v12, "cardType") == 3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = !v13;
    *a3 = v13;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    *a3 = 1;
  }
LABEL_14:

}

void ___PassMeetsFilterRequirements_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "supportsInSessionExpress"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
          *a4 = 1;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

@end
