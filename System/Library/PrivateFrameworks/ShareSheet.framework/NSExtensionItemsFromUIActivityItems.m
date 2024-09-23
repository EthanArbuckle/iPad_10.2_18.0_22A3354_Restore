@implementation NSExtensionItemsFromUIActivityItems

uint64_t ____NSExtensionItemsFromUIActivityItems_block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        objc_getAssociatedObject(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5), &__UIIsContentManagedReferenceKey);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "BOOLValue", (_QWORD)v9) & 1) != 0)
        {

          v7 = 1;
          goto LABEL_12;
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_12:

  return v7;
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (_UIActivityItemIsLivePhoto(v7))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithLivePhoto:", v7);
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v5);
      v6 = a1[4];
      if (v6)
        (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeObjectAtIndex:", a3);

  }
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  _UIActivityItemsWithTypes(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2, 0, a4, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_4;
  v14[3] = &unk_1E4002880;
  v15 = v7;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v16 = v8;
  v18 = v9;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v17 = v10;
  v19 = v11;
  v12 = v7;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  _NSItemProviderForUIActivityItem(v5, *(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v3);
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v3, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeObjectIdenticalTo:", v5);
  }

}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)*MEMORY[0x1E0CA5C40];
    objc_msgSend(*(id *)(a1 + 32), "activityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIActivityGetTypeIdentifier(v3, v4, (uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", v3, v6);
    v8 = *MEMORY[0x1E0CA5C20];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_6;
    v14[3] = &unk_1E40028D0;
    v9 = v3;
    v15 = v9;
    objc_msgSend(v7, "registerItemForTypeIdentifier:loadHandler:", v8, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v7, v9);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObjectIdenticalTo:", v9);

LABEL_9:
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)*MEMORY[0x1E0CA5C20];
    objc_msgSend(*(id *)(a1 + 32), "activityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UIActivityGetTypeIdentifier(v3, v11, (uint64_t)v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", v3, v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v7, v3);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObjectIdenticalTo:", v3);
    goto LABEL_9;
  }
LABEL_10:

}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_6(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "string");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a2)[2](v4, v5, 0);

}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_7(_QWORD *a1, void *a2)
{
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "registeredTypeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v4 = objc_msgSend(v7, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.group-activities.activity"));

    v5 = v7;
    if ((v4 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v7);
  v5 = v7;
  v6 = a1[4];
  if (v6)
  {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v7);
    v5 = v7;
  }
LABEL_6:
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeObjectIdenticalTo:", v5);

}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = v3;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(v3, "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v4 == v6)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v3, "attachments");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v32;
        v9 = *MEMORY[0x1E0CA5C90];
        v19 = *MEMORY[0x1E0CB2CA8];
        v10 = *MEMORY[0x1E0CB2CA0];
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v32 != v8)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v12, "hasItemConformingToTypeIdentifier:", v9))
            {
              v25 = 0;
              v26 = &v25;
              v27 = 0x3032000000;
              v28 = __Block_byref_object_copy__2;
              v29 = __Block_byref_object_dispose__2;
              v30 = 0;
              v13 = dispatch_semaphore_create(0);
              v35 = v19;
              v36 = v10;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v22[0] = MEMORY[0x1E0C809B0];
              v22[1] = 3221225472;
              v22[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_9;
              v22[3] = &unk_1E4002948;
              v24 = &v25;
              v15 = v13;
              v23 = v15;
              objc_msgSend(v12, "loadItemForTypeIdentifier:options:completionHandler:", v9, v14, v22);

              dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
              if (v26[5])
              {
                v16 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:");
                if (v16 != 0x7FFFFFFFFFFFFFFFLL)
                  objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v16);
              }

              _Block_object_dispose(&v25, 8);
            }
            v17 = *(_QWORD *)(a1 + 40);
            if (v17)
              (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v12, v21);
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        }
        while (v7);
      }

      v3 = v21;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v3);
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v21, v21);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObjectIdenticalTo:", v21);

}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_9(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v7, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  if (*(_BYTE *)(a1 + 32))
    v6 = MEMORY[0x1E0C9AAB0];
  else
    v6 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("com.apple.UIKit.NSExtensionItemUserInfoIsContentManagedKey"));
  objc_msgSend(v7, "setUserInfo:", v5);

}

@end
