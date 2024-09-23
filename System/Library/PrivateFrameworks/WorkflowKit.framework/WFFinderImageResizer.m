@implementation WFFinderImageResizer

- (WFFinderImageResizer)init
{
  WFFinderImageResizer *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  WFFinderImageResizer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFFinderImageResizer;
  v2 = -[WFFinderImageResizer init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.WFFinderImageResizer", v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)computeResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  WFFinderImageResizer *v22;
  id v23;
  id v24;
  BOOL v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sizes"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageCollection"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v12 = (unint64_t)objc_msgSend(v10, "count") > 1;
  -[WFFinderImageResizer queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WFFinderImageResizer_computeResizedSizesForImages_inSizes_completion___block_invoke;
  block[3] = &unk_1E7AF57E0;
  v21 = v9;
  v22 = self;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v14 = v10;
  v15 = v11;
  v16 = v9;
  dispatch_async(v13, block);

}

- (id)resizeImages:(id)a3 toSize:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageCollection"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v9, "numberOfItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFinderImageResizer queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke;
  block[3] = &unk_1E7AF8F70;
  v28 = v11;
  v25 = v9;
  v26 = v10;
  v14 = v12;
  v27 = v14;
  v15 = v10;
  v16 = v11;
  v17 = v9;
  dispatch_async(v13, block);

  v18 = v27;
  v19 = v14;

  return v19;
}

- (BOOL)unsafeComputeResizedSizesForImageContentItems:(id)a3 inSizes:(id)a4 intoSizesTable:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[4];
  int v42;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sizes"));

    if (v13)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

  if (!v12)
    goto LABEL_14;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFinderImageResizer.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sizesTable"));

LABEL_4:
  v14 = objc_msgSend(v11, "count");
  v15 = objc_msgSend(v12, "count") * v14;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  if (objc_msgSend(v11, "count"))
  {
    v18 = 0;
    do
    {
      if (objc_msgSend(v12, "count"))
      {
        v19 = 0;
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v20);

          objc_msgSend(v12, "objectAtIndexedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v21);

          ++v19;
        }
        while (v19 < objc_msgSend(v12, "count"));
      }
      ++v18;
    }
    while (v18 < objc_msgSend(v11, "count"));
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2810000000;
  v41[3] = &unk_1C1C1142F;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__49711;
  v39 = __Block_byref_object_dispose__49712;
  v40 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__WFFinderImageResizer_unsafeComputeResizedSizesForImageContentItems_inSizes_intoSizesTable_error___block_invoke;
  block[3] = &unk_1E7AF5830;
  v33 = v41;
  v34 = &v35;
  v22 = v16;
  v30 = v22;
  v23 = v17;
  v31 = v23;
  v24 = v13;
  v32 = v24;
  dispatch_apply(v15, 0, block);
  if (a6)
    *a6 = objc_retainAutorelease((id)v36[5]);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);

  return a6 != 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __99__WFFinderImageResizer_unsafeComputeResizedSizesForImageContentItems_inSizes_intoSizesTable_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    getWFActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[WFFinderImageResizer unsafeComputeResizedSizesForImageContentItems:inSizes:intoSizesTable:error:]_block_invoke";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Starting resizing image %@ (descriptor: %@) for size estimation...", buf, 0x20u);
    }

    v16 = 0;
    WFConvertImage(v5, v6, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    v10 = v16;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    getWFActionsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = objc_msgSend(v8, "fileSize");
        *(_DWORD *)buf = 136315906;
        v18 = "-[WFFinderImageResizer unsafeComputeResizedSizesForImageContentItems:inSizes:intoSizesTable:error:]_block_invoke";
        v19 = 2112;
        v20 = v5;
        v21 = 2112;
        v22 = v6;
        v23 = 2048;
        v24 = v13;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Computed size for %@ (descriptor: %@): %lld", buf, 0x2Au);
      }

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v14 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v14, v6);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "fileSize"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[WFFinderImageResizer unsafeComputeResizedSizesForImageContentItems:inSizes:intoSizesTable:error:]_block_invoke";
        v19 = 2112;
        v20 = v5;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Error updating file sizes for image %@, descriptor: %@", buf, 0x20u);
      }

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v9);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    }

  }
}

void __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke_2;
  v4[3] = &unk_1E7AF9A70;
  v7 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "generateCollectionByCoercingToItemClass:completionHandler:", v3, v4);

}

void __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke_3;
    v4[3] = &unk_1E7AF5808;
    v5 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(a2, "transformItemsUsingBlock:completionHandler:", v4, *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v9 = 0;
  v6 = a3;
  WFConvertImage(a2, v5, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
  v6[2](v6, v7, v8);

}

void __72__WFFinderImageResizer_computeResizedSizesForImages_inSizes_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__WFFinderImageResizer_computeResizedSizesForImages_inSizes_completion___block_invoke_2;
  v7[3] = &unk_1E7AF57B8;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v7[4] = v5;
  v8 = v6;
  v10 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v2, "generateCollectionByCoercingToItemClass:completionHandler:", v3, v7);

}

void __72__WFFinderImageResizer_computeResizedSizesForImages_inSizes_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, a4);
    return;
  }
  objc_msgSend(a2, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v10 = objc_msgSend(v7, "unsafeComputeResizedSizesForImageContentItems:inSizes:intoSizesTable:error:", v5, v9, v6, &v19);
  v11 = v19;

  if ((v10 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v11;
      v14 = objc_msgSend(v12, "unsafeComputeResizedSizesForImageContentItems:inSizes:intoSizesTable:error:", v5, v13, v6, &v18);
      v15 = v18;

      if ((v14 & 1) == 0)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v11 = v15;
        goto LABEL_10;
      }
      v11 = v15;
    }
    v16 = *(_QWORD *)(a1 + 48);
    v17 = (void *)objc_msgSend(v6, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v17, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_10:

}

@end
