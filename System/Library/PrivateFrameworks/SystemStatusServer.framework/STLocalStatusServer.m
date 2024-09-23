@implementation STLocalStatusServer

id __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_2(uint64_t a1, void *a2)
{
  return -[STLocalStatusServer _internalQueue_dataForClient:domain:presentationData:](*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
}

id __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke(uint64_t a1, void *a2)
{
  return -[STLocalStatusServer _internalQueue_dataForClient:domain:presentationData:](*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
}

- (id)_internalQueue_dataForClient:(uint64_t)a3 domain:(void *)a4 presentationData:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    v9 = v8;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = *(void **)(a1 + 72);
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = v10;
    objc_msgSend(v11, "numberWithUnsignedInteger:", a3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        v19 = v9;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "dataTransformerForClient:", v7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "transformedDataForData:", v19);
          v9 = (id)objc_claimAutoreleasedReturnValue();

          ++v18;
          v19 = v9;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __70__STLocalStatusServer_registerPublisherClient_forDomain_fallbackData___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[3];
  v15 = v2;
  objc_msgSend(v15, "objectForKey:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    objc_msgSend(v15, "setObject:forKey:", v3, a1[7]);
  }
  objc_msgSend(v3, "addObject:", a1[5]);
  v4 = (_QWORD *)a1[4];
  if (v4)
    v4 = (_QWORD *)v4[4];
  v5 = v4;
  objc_msgSend(v5, "objectForKey:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v6, a1[5]);
  }
  v8 = (_QWORD *)a1[4];
  if (v8)
    v8 = (_QWORD *)v8[10];
  v9 = v8;
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v6);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v12 = a1[4];
  if (v12)
    v13 = *(void **)(v12 + 40);
  else
    v13 = 0;
  objc_msgSend(v13, "recordForKey:", CFSTR("volatileData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFallbackData:forClientKey:domain:", a1[6], v6, a1[7]);

}

void __96__STLocalStatusServer_updateVolatileDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  id v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = *(_QWORD *)(a1 + 64);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    -[STLocalStatusServer _internalQueue_volatileDataForDomain:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[STLocalStatusServer _internalQueue_fallbackDataForPublisherClient:domain:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 64));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;

    v29 = v11;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    if (v15)
      v16 = *(void **)(v15 + 40);
    else
      v16 = 0;
    v17 = *(_QWORD *)(a1 + 64);
    v18 = v16;
    objc_msgSend(v18, "recordForKey:", CFSTR("volatileData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 56);
    v21 = v12;
    v22 = v14;
    v23 = v19;
    v24 = v13;
    v25 = v20;
    if (v15)
    {
      if ((objc_msgSend(v21, "isEmpty") & 1) != 0)
      {
        if (v25)
          v25[2](v25);
      }
      else
      {
        v26 = *(id *)(v15 + 32);
        objc_msgSend(v26, "objectForKey:", v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __124__STLocalStatusServer__internalQueue_publishDiff_forPublisherClient_domain_inDataChangeRecord_withChangeContext_completion___block_invoke;
        v30[3] = &unk_1E8E18170;
        v31 = v23;
        v32 = v21;
        v33 = v27;
        v34 = v17;
        v28 = v27;
        -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v15, v17, v24, v30);
        if (v25)
          v25[2](v25);

      }
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
}

- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__STLocalStatusServer_updateVolatileDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke;
  block[3] = &unk_1E8E181E8;
  v20 = v12;
  v21 = a4;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(internalQueue, block);

}

- (id)_internalQueue_volatileDataForDomain:(uint64_t)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 40), "recordForKey:", CFSTR("volatileData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentDataForDomain:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__STLocalStatusServer_registerPublisherClient_forDomain_fallbackData___block_invoke;
  v13[3] = &unk_1E8E18170;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

- (id)dataForDomain:(unint64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__STLocalStatusServer_dataForDomain___block_invoke;
  block[3] = &unk_1E8E18148;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_internalQueue_presentationDataForDomain:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "currentDataForDomain:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *(void **)(a1 + 64);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = v5;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      v14 = v4;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "transformedDataForData:", v14);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v4;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v4;
}

- (void)_internalQueue_mutateDataForDomain:(void *)a3 withChangeContext:(void *)a4 block:
{
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD);
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t v50;
  _QWORD block[4];
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[5];
  id v58;
  uint64_t v59;
  _QWORD v60[5];
  id v61;
  uint64_t v62;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1 && v8)
  {
    v42 = v7;
    -[STLocalStatusServer _internalQueue_presentationDataForDomain:](a1, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STLocalStatusServer _internalQueue_publishedDomains]((dispatch_queue_t *)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke;
    v60[3] = &unk_1E8E182B0;
    v60[4] = a1;
    v62 = a2;
    v40 = v10;
    v61 = v40;
    objc_msgSend(v12, "bs_map:", v60);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9);
    -[STLocalStatusServer _internalQueue_presentationDataForDomain:](a1, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copyWithZone:", 0);

    v17 = objc_msgSend(v12, "count");
    if (v17)
    {
      v18 = v17;
      v36 = v11;
      v37 = v9;
      v57[0] = v13;
      v57[1] = 3221225472;
      v57[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_2;
      v57[3] = &unk_1E8E182B0;
      v38 = a2;
      v39 = a1;
      v57[4] = a1;
      v59 = a2;
      v58 = v16;
      objc_msgSend(v12, "bs_map:", v57);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v35 = v16;
      do
      {
        objc_msgSend(v14, "objectAtIndex:", v22, v35);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndex:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "isEqual:", v24) & 1) == 0)
        {
          objc_msgSend(v12, "objectAtIndex:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v25);

          objc_msgSend(v21, "addObject:", v24);
        }

        ++v22;
      }
      while (v18 != v22);
      v26 = objc_msgSend(v20, "count");
      if (v26)
      {
        v27 = *(NSObject **)(v39 + 96);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_3;
        block[3] = &unk_1E8E182D8;
        v55 = v26;
        v52 = v21;
        v53 = v20;
        v56 = v38;
        v54 = v42;
        dispatch_async(v27, block);

      }
      v11 = v36;
      v9 = v37;
      a2 = v38;
      a1 = v39;
      v13 = MEMORY[0x1E0C809B0];
      v16 = v35;
    }
    v28 = *(NSObject **)(a1 + 96);
    v47[0] = v13;
    v47[1] = 3221225472;
    v47[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_4;
    v47[3] = &unk_1E8E18198;
    v50 = a2;
    v29 = v16;
    v48 = v29;
    v7 = v42;
    v49 = v42;
    dispatch_async(v28, v47);
    -[STLocalStatusServer _internalQueue_publishedDomains]((dispatch_queue_t *)a1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", v30) & 1) == 0)
    {
      objc_msgSend((id)a1, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        v33 = v13;
        v34 = *(NSObject **)(a1 + 96);
        v43[0] = v33;
        v43[1] = 3221225472;
        v43[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_132;
        v43[3] = &unk_1E8E18260;
        v44 = v31;
        v45 = a1;
        v46 = v30;
        dispatch_async(v34, v43);

      }
    }

  }
}

void __37__STLocalStatusServer_dataForDomain___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[STLocalStatusServer _internalQueue_presentationDataForDomain:](a1[4], a1[6]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copyWithZone:", 0);
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_internalQueue_publishedDomains
{
  id *v1;
  void *v2;
  void *v3;

  v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[11]);
    objc_msgSend(v1[5], "recordForKey:", CFSTR("volatileData"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "domainsWithSignificantData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id *)objc_msgSend(v3, "copy");

  }
  return v1;
}

uint64_t __124__STLocalStatusServer__internalQueue_publishDiff_forPublisherClient_domain_inDataChangeRecord_withChangeContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDiff:forClientKey:domain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 56))
  {
    v2 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        v3 = 0;
      }
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "observeData:forDomain:withChangeContext:", v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 56));
  }
}

void __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (STSystemStatusIsInternalLoggingEnabled())
  {
    STSystemStatusLogServer();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      STSystemStatusDescriptionForDomain();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138543874;
      v7 = v3;
      v8 = 2114;
      v9 = v4;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1D02C7000, v2, OS_LOG_TYPE_DEFAULT, "Server data changed for %{public}@ domain: %{public}@ -- context: %{public}@", (uint8_t *)&v6, 0x20u);

    }
  }
}

void __88__STLocalStatusServer_updateDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = *(_QWORD *)(a1 + 64);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    -[STLocalStatusServer _internalQueue_dataForDomain:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[STLocalStatusServer _internalQueue_fallbackDataForPublisherClient:domain:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 64));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = (void *)objc_msgSend(v11, "mutableCopyWithZone:", 0);
    v22 = (void *)v12;
    objc_msgSend(v14, "applyDiff:", v12);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = (void *)objc_msgSend(v14, "copyWithZone:", 0);
    v17 = *(_QWORD *)(a1 + 64);
    v18 = *(_QWORD **)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    if (v18)
      v18 = (_QWORD *)v18[5];
    v20 = v18;
    objc_msgSend(v20, "recordForKey:", CFSTR("data"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[STLocalStatusServer _internalQueue_publishData:forPublisherClient:domain:inDataChangeRecord:withChangeContext:completion:](v15, v16, v19, v17, v21, v13, *(void **)(a1 + 56));

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
}

- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__STLocalStatusServer_updateDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke;
  block[3] = &unk_1E8E181E8;
  v20 = v12;
  v21 = a4;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(internalQueue, block);

}

- (void)_internalQueue_publishData:(void *)a3 forPublisherClient:(uint64_t)a4 domain:(void *)a5 inDataChangeRecord:(void *)a6 withChangeContext:(void *)a7 completion:
{
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  unint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v21 = a2;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (a1)
  {
    objc_msgSend(v14, "currentDataForDomain:", a4);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v21 | v17 && (objc_msgSend((id)v17, "isEqual:", v21) & 1) == 0)
    {
      v18 = *(id *)(a1 + 32);
      objc_msgSend(v18, "objectForKey:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __124__STLocalStatusServer__internalQueue_publishData_forPublisherClient_domain_inDataChangeRecord_withChangeContext_completion___block_invoke;
      v22[3] = &unk_1E8E18170;
      v23 = v14;
      v24 = (id)v21;
      v25 = v19;
      v26 = a4;
      v20 = v19;
      -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](a1, a4, v15, v22);
      if (v16)
        v16[2](v16);

    }
    else if (v16)
    {
      v16[2](v16);
    }

  }
}

- (id)_internalQueue_dataForDomain:(uint64_t)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 40), "recordForKey:", CFSTR("data"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentDataForDomain:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (STLocalStatusServer)init
{
  STLocalStatusServer *v2;
  BSMutableIntegerMap *v3;
  BSMutableIntegerMap *clientsByDomain;
  BSMutableIntegerMap *v5;
  BSMutableIntegerMap *publisherClientsByDomain;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  STStatusDomainDataChangeLog *dataChangeLog;
  uint64_t v12;
  NSMapTable *changeLogKeysByPublisherClient;
  uint64_t v14;
  NSMutableDictionary *dataTransformersByDomain;
  uint64_t v16;
  NSMutableDictionary *clientDataTransformerProvidersByDomain;
  uint64_t v18;
  NSMutableDictionary *domainsByChangeLogKey;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v22;
  OS_dispatch_queue *clientQueue;
  STStatusDomainXPCClientListener *v24;
  STStatusDomainXPCClientListener *xpcClientListener;
  STStatusDomainPublisherXPCClientListener *v26;
  STStatusDomainPublisherXPCClientListener *publisherXPCClientListener;
  id v28;
  STLocalStatusServer *v30;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)STLocalStatusServer;
  v2 = -[STLocalStatusServer init](&v31, sel_init);
  if (v2)
  {
    v3 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    clientsByDomain = v2->_clientsByDomain;
    v2->_clientsByDomain = v3;

    v5 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    publisherClientsByDomain = v2->_publisherClientsByDomain;
    v2->_publisherClientsByDomain = v5;

    v7 = (void *)MEMORY[0x1E0C99E40];
    v32[0] = CFSTR("data");
    v32[1] = CFSTR("volatileData");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedSetWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A30]), "initWithRecordKeys:", v9);
    dataChangeLog = v2->_dataChangeLog;
    v2->_dataChangeLog = (STStatusDomainDataChangeLog *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    changeLogKeysByPublisherClient = v2->_changeLogKeysByPublisherClient;
    v2->_changeLogKeysByPublisherClient = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    dataTransformersByDomain = v2->_dataTransformersByDomain;
    v2->_dataTransformersByDomain = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    clientDataTransformerProvidersByDomain = v2->_clientDataTransformerProvidersByDomain;
    v2->_clientDataTransformerProvidersByDomain = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    domainsByChangeLogKey = v2->_domainsByChangeLogKey;
    v2->_domainsByChangeLogKey = (NSMutableDictionary *)v18;

    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    v22 = BSDispatchQueueCreateSerial();
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v22;

    v24 = -[STStatusDomainXPCClientListener initWithServerHandle:]([STStatusDomainXPCClientListener alloc], "initWithServerHandle:", v2);
    xpcClientListener = v2->_xpcClientListener;
    v2->_xpcClientListener = v24;

    v26 = -[STStatusDomainPublisherXPCClientListener initWithServerHandle:]([STStatusDomainPublisherXPCClientListener alloc], "initWithServerHandle:", v2);
    publisherXPCClientListener = v2->_publisherXPCClientListener;
    v2->_publisherXPCClientListener = v26;

    v30 = v2;
    v28 = (id)BSLogAddStateCaptureBlockWithTitle();

  }
  return v2;
}

uint64_t __27__STLocalStatusServer_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "description");
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__STLocalStatusServer_setDelegate___block_invoke;
  block[3] = &unk_1E8E17F10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

id __35__STLocalStatusServer_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (BSIntegerSet)publishedDomains
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__STLocalStatusServer_publishedDomains__block_invoke;
  v5[3] = &unk_1E8E18120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BSIntegerSet *)v3;
}

void __39__STLocalStatusServer_publishedDomains__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[STLocalStatusServer _internalQueue_publishedDomains](*(dispatch_queue_t **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)publishedDataForDomain:(unint64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__STLocalStatusServer_publishedDataForDomain___block_invoke;
  block[3] = &unk_1E8E18148;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__STLocalStatusServer_publishedDataForDomain___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[STLocalStatusServer _internalQueue_dataForDomain:](a1[4], a1[6]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copyWithZone:", 0);
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)publishedVolatileDataForDomain:(unint64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__STLocalStatusServer_publishedVolatileDataForDomain___block_invoke;
  block[3] = &unk_1E8E18148;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__STLocalStatusServer_publishedVolatileDataForDomain___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[STLocalStatusServer _internalQueue_volatileDataForDomain:](a1[4], a1[6]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copyWithZone:", 0);
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__STLocalStatusServer_removePublisherClient_forDomain___block_invoke;
  block[3] = &unk_1E8E18198;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(internalQueue, block);

}

void __55__STLocalStatusServer_removePublisherClient_forDomain___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[3];
  v19 = v2;
  objc_msgSend(v19, "objectForKey:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", a1[5]);
  v4 = (_QWORD *)a1[4];
  if (v4)
    v4 = (_QWORD *)v4[4];
  v5 = v4;
  objc_msgSend(v5, "objectForKey:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)a1[4];
  if (v7)
    v7 = (_QWORD *)v7[5];
  v8 = v7;
  objc_msgSend(v8, "recordForKey:", CFSTR("volatileData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = a1[4];
  v11 = a1[6];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__STLocalStatusServer_removePublisherClient_forDomain___block_invoke_2;
  v20[3] = &unk_1E8E18198;
  v12 = v9;
  v21 = v12;
  v13 = v6;
  v14 = a1[6];
  v22 = v13;
  v23 = v14;
  -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v10, v11, 0, v20);
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v19, "removeObjectForKey:", a1[6]);
  v15 = (_QWORD *)a1[4];
  if (v15)
    v15 = (_QWORD *)v15[10];
  v16 = v15;
  objc_msgSend(v16, "objectForKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObject:", v18);

  if (!objc_msgSend(v17, "count"))
  {
    objc_msgSend(v16, "removeObjectForKey:", v13);
    objc_msgSend(v5, "removeObjectForKey:", a1[5]);
  }

}

uint64_t __55__STLocalStatusServer_removePublisherClient_forDomain___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllEntriesForClientKey:domain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *internalQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__STLocalStatusServer_publishData_forPublisherClient_domain_withChangeContext_completion___block_invoke;
  v21[3] = &unk_1E8E181C0;
  v21[4] = self;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  v25 = v15;
  v26 = a5;
  v17 = v15;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(internalQueue, v21);

}

void __90__STLocalStatusServer_publishData_forPublisherClient_domain_withChangeContext_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = *(_QWORD *)(a1 + 72);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    v8 = *(void **)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 72);
    if (v9)
      v11 = *(void **)(v9 + 40);
    else
      v11 = 0;
    v12 = v11;
    objc_msgSend(v12, "recordForKey:", CFSTR("data"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[STLocalStatusServer _internalQueue_publishData:forPublisherClient:domain:inDataChangeRecord:withChangeContext:completion:](v9, v7, v8, v10, v14, *(void **)(a1 + 56), *(void **)(a1 + 64));

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 64);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }
}

- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *internalQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__STLocalStatusServer_publishVolatileData_forPublisherClient_domain_withChangeContext_completion___block_invoke;
  v21[3] = &unk_1E8E181C0;
  v21[4] = self;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  v25 = v15;
  v26 = a5;
  v17 = v15;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(internalQueue, v21);

}

void __98__STLocalStatusServer_publishVolatileData_forPublisherClient_domain_withChangeContext_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = *(_QWORD *)(a1 + 72);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    v8 = *(void **)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 72);
    if (v9)
      v11 = *(void **)(v9 + 40);
    else
      v11 = 0;
    v12 = v11;
    objc_msgSend(v12, "recordForKey:", CFSTR("volatileData"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[STLocalStatusServer _internalQueue_publishData:forPublisherClient:domain:inDataChangeRecord:withChangeContext:completion:](v9, v7, v8, v10, v14, *(void **)(a1 + 56), *(void **)(a1 + 64));

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 64);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }
}

- (id)_internalQueue_fallbackDataForPublisherClient:(uint64_t)a3 domain:
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 88);
    v6 = a2;
    dispatch_assert_queue_V2(v5);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "recordForKey:", CFSTR("volatileData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fallbackDataForClientKey:domain:", v7, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)registerClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__STLocalStatusServer_registerClient_forDomain___block_invoke;
  block[3] = &unk_1E8E18198;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __48__STLocalStatusServer_registerClient_forDomain___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  v12 = v2;
  objc_msgSend(v12, "objectForKey:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    objc_msgSend(v12, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  -[STLocalStatusServer _internalQueue_presentationDataForDomain:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", 0);

  if (v5)
  {
    -[STLocalStatusServer _internalQueue_dataForClient:domain:presentationData:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = v6;
  if (v7)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 88));
    v11 = *(NSObject **)(v7 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__STLocalStatusServer__internalQueue_notifyClient_ofData_forDomain___block_invoke;
    block[3] = &unk_1E8E18198;
    v14 = v9;
    v15 = v10;
    v16 = v8;
    dispatch_async(v11, block);

  }
}

- (void)removeClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__STLocalStatusServer_removeClient_forDomain___block_invoke;
  block[3] = &unk_1E8E18198;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(internalQueue, block);

}

void __46__STLocalStatusServer_removeClient_forDomain___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[2];
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", a1[5]);
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v4, "removeObjectForKey:", a1[6]);

}

- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__STLocalStatusServer_reportUserInteraction_forClient_domain___block_invoke;
  v14[3] = &unk_1E8E18170;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = a5;
  v12 = v8;
  v13 = v10;
  dispatch_async(internalQueue, v14);

}

void __62__STLocalStatusServer_reportUserInteraction_forClient_domain___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  uint64_t *v24;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = MEMORY[0x1E0C809B0];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __62__STLocalStatusServer_reportUserInteraction_forClient_domain___block_invoke_2;
    v19 = &unk_1E8E18210;
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v20 = v10;
    v21 = v11;
    v12 = &v16;
    if (v7)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 88));
      objc_msgSend(*(id *)(v7 + 24), "objectForKey:", v9, v16, v17, v18, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");

      if (objc_msgSend(v14, "count"))
      {
        v15 = *(NSObject **)(v7 + 96);
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __94__STLocalStatusServer__internalQueue_enumeratePublisherClientsForDomain_withClientQueueBlock___block_invoke;
        block[3] = &unk_1E8E18300;
        v23 = v14;
        v24 = v12;
        dispatch_async(v15, block);

      }
    }

  }
}

uint64_t __62__STLocalStatusServer_reportUserInteraction_forClient_domain___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleUserInteraction:forDomain:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  return (NSString *)-[STLocalStatusServer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STLocalStatusServer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STLocalStatusServer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  id v13;
  STLocalStatusServer *v14;

  v4 = a3;
  -[STLocalStatusServer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke;
  block[3] = &unk_1E8E18260;
  v7 = v5;
  v12 = v7;
  v13 = v4;
  v14 = self;
  v8 = v4;
  dispatch_sync(internalQueue, block);
  v9 = v7;

  return v9;
}

void __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E8E17F10;
  v3[4] = a1[6];
  v4 = v1;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, v2, v3);

}

void __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[5];
  v10 = v2;
  objc_msgSend(v10, "recordForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainsWithData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v14[3] = &unk_1E8E18238;
  v15 = v3;
  v16 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v4, "enumerateWithBlock:", v14);
  objc_msgSend(v10, "recordForKey:", CFSTR("volatileData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domainsWithData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v11[3] = &unk_1E8E18238;
  v12 = v7;
  v13 = *(id *)(a1 + 40);
  v9 = v7;
  objc_msgSend(v8, "enumerateWithBlock:", v11);

}

void __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "currentDataForDomain:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  STSystemStatusDescriptionForDomain();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v6, v4);

}

void __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "currentDataForDomain:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  STSystemStatusDescriptionForDomain();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (volatile)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v7, v5);
}

- (void)addDataTransformer:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__STLocalStatusServer_addDataTransformer_forDomain___block_invoke;
  block[3] = &unk_1E8E18198;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __52__STLocalStatusServer_addDataTransformer_forDomain___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[8];
  v11 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v4, v5);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__STLocalStatusServer_addDataTransformer_forDomain___block_invoke_2;
  v12[3] = &unk_1E8E17F10;
  v8 = v4;
  v13 = v8;
  v9 = *(id *)(a1 + 40);
  v14 = v9;
  if (v6)
  {
    -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v6, v7, 0, v12);
    v10 = v13;
    v9 = v14;
  }
  else
  {
    v10 = v8;
  }

}

uint64_t __52__STLocalStatusServer_addDataTransformer_forDomain___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeDataTransformer:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__STLocalStatusServer_removeDataTransformer_forDomain___block_invoke;
  block[3] = &unk_1E8E18198;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __55__STLocalStatusServer_removeDataTransformer_forDomain___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  uint64_t v5;
  id v6;
  uint64_t v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__STLocalStatusServer_removeDataTransformer_forDomain___block_invoke_2;
  v4[3] = &unk_1E8E18198;
  v1 = (void *)a1[5];
  v2 = a1[6];
  v5 = a1[4];
  v7 = v2;
  v3 = v1;
  v6 = v3;
  if (v5)
  {
    -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v5, v2, 0, v4);
    v3 = v6;
  }

}

void __55__STLocalStatusServer_removeDataTransformer_forDomain___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[8];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1[6];
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", a1[5]);

}

- (void)modifyDataTransformer:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__STLocalStatusServer_modifyDataTransformer_forDomain_usingBlock___block_invoke;
  block[3] = &unk_1E8E18288;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_sync(internalQueue, block);

}

void __66__STLocalStatusServer_modifyDataTransformer_forDomain_usingBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[8];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__STLocalStatusServer_modifyDataTransformer_forDomain_usingBlock___block_invoke_2;
    v13[3] = &unk_1E8E18300;
    v10 = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    v15 = v12;
    v11 = *(id *)(a1 + 40);
    v14 = v11;
    if (v9)
    {
      -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v9, v10, 0, v13);
      v11 = v14;
      v12 = v15;
    }

  }
}

uint64_t __66__STLocalStatusServer_modifyDataTransformer_forDomain_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__STLocalStatusServer_addClientDataTransformerProvider_forDomain___block_invoke;
  block[3] = &unk_1E8E18198;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __66__STLocalStatusServer_addClientDataTransformerProvider_forDomain___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v11 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v4, v5);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__STLocalStatusServer_addClientDataTransformerProvider_forDomain___block_invoke_2;
  v12[3] = &unk_1E8E17F10;
  v8 = v4;
  v13 = v8;
  v9 = *(id *)(a1 + 40);
  v14 = v9;
  if (v6)
  {
    -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v6, v7, 0, v12);
    v10 = v13;
    v9 = v14;
  }
  else
  {
    v10 = v8;
  }

}

uint64_t __66__STLocalStatusServer_addClientDataTransformerProvider_forDomain___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__STLocalStatusServer_removeClientDataTransformerProvider_forDomain___block_invoke;
  block[3] = &unk_1E8E18198;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __69__STLocalStatusServer_removeClientDataTransformerProvider_forDomain___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  uint64_t v5;
  id v6;
  uint64_t v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__STLocalStatusServer_removeClientDataTransformerProvider_forDomain___block_invoke_2;
  v4[3] = &unk_1E8E18198;
  v1 = (void *)a1[5];
  v2 = a1[6];
  v5 = a1[4];
  v7 = v2;
  v3 = v1;
  v6 = v3;
  if (v5)
  {
    -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v5, v2, 0, v4);
    v3 = v6;
  }

}

void __69__STLocalStatusServer_removeClientDataTransformerProvider_forDomain___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1[6];
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", a1[5]);

}

- (void)modifyClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__STLocalStatusServer_modifyClientDataTransformerProvider_forDomain_usingBlock___block_invoke;
  block[3] = &unk_1E8E18288;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_sync(internalQueue, block);

}

void __80__STLocalStatusServer_modifyClientDataTransformerProvider_forDomain_usingBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__STLocalStatusServer_modifyClientDataTransformerProvider_forDomain_usingBlock___block_invoke_2;
    v13[3] = &unk_1E8E18300;
    v10 = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    v15 = v12;
    v11 = *(id *)(a1 + 40);
    v14 = v11;
    if (v9)
    {
      -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v9, v10, 0, v13);
      v11 = v14;
      v12 = v15;
    }

  }
}

uint64_t __80__STLocalStatusServer_modifyClientDataTransformerProvider_forDomain_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __124__STLocalStatusServer__internalQueue_publishData_forPublisherClient_domain_inDataChangeRecord_withChangeContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setData:forClientKey:domain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_132(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemStatusServer:publishedDomainsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __94__STLocalStatusServer__internalQueue_enumeratePublisherClientsForDomain_withClientQueueBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __68__STLocalStatusServer__internalQueue_notifyClient_ofData_forDomain___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observeData:forDomain:withChangeContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (STLocalStatusServerDelegate)delegate
{
  return (STLocalStatusServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_domainsByChangeLogKey, 0);
  objc_storeStrong((id *)&self->_clientDataTransformerProvidersByDomain, 0);
  objc_storeStrong((id *)&self->_dataTransformersByDomain, 0);
  objc_storeStrong((id *)&self->_publisherXPCClientListener, 0);
  objc_storeStrong((id *)&self->_xpcClientListener, 0);
  objc_storeStrong((id *)&self->_dataChangeLog, 0);
  objc_storeStrong((id *)&self->_changeLogKeysByPublisherClient, 0);
  objc_storeStrong((id *)&self->_publisherClientsByDomain, 0);
  objc_storeStrong((id *)&self->_clientsByDomain, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
