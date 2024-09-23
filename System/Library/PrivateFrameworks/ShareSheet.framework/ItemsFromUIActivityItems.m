@implementation ItemsFromUIActivityItems

void ____ItemsFromUIActivityItems_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (_UIActivityItemIsLivePhoto(v5))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObjectAtIndex:", a3);
  }

}

void ____ItemsFromUIActivityItems_block_invoke_2(int8x16_t *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  id v5;
  _QWORD v6[4];
  int8x16_t v7;

  _UIActivityItemsWithTypes(*(void **)(*(_QWORD *)(a1[2].i64[0] + 8) + 40), a2, 0, a4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ____ItemsFromUIActivityItems_block_invoke_3;
  v6[3] = &unk_1E4002790;
  v7 = vextq_s8(a1[2], a1[2], 8uLL);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void ____ItemsFromUIActivityItems_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObjectIdenticalTo:", v4);

}

void ____ItemsFromUIActivityItems_block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v5, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObjectIdenticalTo:", v5);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

void ____ItemsFromUIActivityItems_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  dispatch_semaphore_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", v9))
        {
          v10 = dispatch_semaphore_create(0);
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = ____ItemsFromUIActivityItems_block_invoke_6;
          v14[3] = &unk_1E40027E0;
          v12 = *(_QWORD *)(a1 + 40);
          v11 = *(_QWORD *)(a1 + 48);
          v15 = v10;
          v16 = v11;
          v13 = v10;
          objc_msgSend(v3, "loadItemForTypeIdentifier:options:completionHandler:", v9, v12, v14);
          dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObjectIdenticalTo:", v3);
}

intptr_t ____ItemsFromUIActivityItems_block_invoke_6(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
