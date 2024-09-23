@implementation UIScreenRemoveScreen

void ___UIScreenRemoveScreen_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD799C0 != -1)
    dispatch_once(&qword_1ECD799C0, &__block_literal_global_820);
  v2 = (id)qword_1ECD799C8;
  objc_msgSend(*(id *)(a1 + 32), "displayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ECD799F0 != -1)
    dispatch_once(&qword_1ECD799F0, &__block_literal_global_830);
  v4 = (id)qword_1ECD799E8;
  objc_msgSend(v4, "removeObject:", v3);
  if (!objc_msgSend(v4, "countForObject:", v3))
  {
    objc_msgSend(v2, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);

    if (v5 == v6)
    {
      if (qword_1ECD799F8 != -1)
        dispatch_once(&qword_1ECD799F8, &__block_literal_global_832);
      if (byte_1ECD7992C)
      {
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = v2;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v15;
LABEL_13:
          v11 = 0;
          while (1)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
            if (objc_msgSend(v12, "_isMainLikeScreen", (_QWORD)v14))
            {
              if (v12 != *(void **)(a1 + 32))
                break;
            }
            if (v9 == ++v11)
            {
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
              if (v9)
                goto LABEL_13;
              goto LABEL_23;
            }
          }
          v13 = v12;

          if (!v13)
            goto LABEL_24;
          objc_msgSend(v7, "removeObject:", v13);
          objc_msgSend(v7, "replaceObjectAtIndex:withObject:", 0, v13);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          v7 = v13;
        }
LABEL_23:

      }
    }
    else
    {
      objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
LABEL_24:

}

@end
