@implementation SUCrawlView

id ___SUCrawlView_block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id *v4;
  id v5;
  __int128 v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  _QWORD aBlock[4];
  __int128 v12;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ___SUCrawlView_block_invoke_4;
    v9[3] = &unk_1EA44CCD0;
    v8 = *(_OWORD *)(a1 + 32);
    v5 = (id)v8;
    v10 = v8;
    v4 = (id *)v9;
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = ___SUCrawlView_block_invoke_3;
    aBlock[3] = &unk_1EA44CCD0;
    v7 = *(_OWORD *)(a1 + 32);
    v3 = (id)v7;
    v12 = v7;
    v4 = (id *)aBlock;
LABEL_5:
    v1 = _Block_copy(v4);

  }
  return v1;
}

void ___SUCrawlView_block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        if (!*a4)
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!*a4)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v8, "subviews", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
          v20 = _Block_copy(v7);
          (*((void (**)(id, void *, uint64_t, _BYTE *))v7 + 2))(v7, v20, v19, a4);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

    --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

void ___SUCrawlView_block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "subviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (!*a4)
        {
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          if (!*a4)
          {
            v14 = _Block_copy(v7);
            (*((void (**)(id, void *, uint64_t, _BYTE *))v7 + 2))(v7, v14, v13, a4);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __SUCrawlView_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
