@implementation WFContentAttributionTracker

- (WFContentAttributionTracker)init
{
  void *v3;
  WFContentAttributionTracker *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[WFContentAttributionTracker initWithAttributionSets:](self, "initWithAttributionSets:", v3);

  return v4;
}

- (WFContentAttributionTracker)initWithAttributionSets:(id)a3
{
  id v5;
  WFContentAttributionTracker *v6;
  WFContentAttributionTracker *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *trackingAttributionSetQueue;
  WFContentAttributionTracker *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFContentAttributionTracker;
  v6 = -[WFContentAttributionTracker init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributionSets, a3);
    v8 = dispatch_queue_create("com.apple.Shortcuts.ContentAttributionSetTrackingQueue", 0);
    trackingAttributionSetQueue = v7->_trackingAttributionSetQueue;
    v7->_trackingAttributionSetQueue = (OS_dispatch_queue *)v8;

    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingAttributionSetQueue, 0);
  objc_storeStrong((id *)&self->_attributionSets, 0);
}

- (void)addAttributionSet:(id)a3 forParameter:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentAttributionTracker.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentAttributionSet"));

  }
  -[WFContentAttributionTracker trackingAttributionSetQueue](self, "trackingAttributionSetQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WFContentAttributionTracker_addAttributionSet_forParameter___block_invoke;
  block[3] = &unk_1E7AF55D0;
  block[4] = self;
  v14 = v8;
  v15 = v7;
  v10 = v7;
  v12 = v8;
  dispatch_sync(v9, block);

}

- (void)replaceAttributionSet:(id)a3 forParameter:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentAttributionTracker.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentAttributionSet"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentAttributionTracker.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[WFContentAttributionTracker trackingAttributionSetQueue](self, "trackingAttributionSetQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WFContentAttributionTracker_replaceAttributionSet_forParameter___block_invoke;
  block[3] = &unk_1E7AF55D0;
  block[4] = self;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v14 = v9;
  dispatch_sync(v10, block);

}

- (id)attributionSetForParameter:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__43084;
  v20 = __Block_byref_object_dispose__43085;
  v21 = 0;
  -[WFContentAttributionTracker trackingAttributionSetQueue](self, "trackingAttributionSetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WFContentAttributionTracker_attributionSetForParameter___block_invoke;
  block[3] = &unk_1E7AF8A80;
  v15 = &v16;
  block[4] = self;
  v6 = v4;
  v14 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)MEMORY[0x1E0D13EA0];
  objc_msgSend((id)v17[5], "allObjects");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v7, "attributionSetByMergingAttributionSets:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)trackedAttributionSet
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__43084;
  v13 = __Block_byref_object_dispose__43085;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentAttributionTracker trackingAttributionSetQueue](self, "trackingAttributionSetQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__WFContentAttributionTracker_trackedAttributionSet__block_invoke;
  v8[3] = &unk_1E7AF92E8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  v4 = (void *)MEMORY[0x1E0D13EA0];
  objc_msgSend((id)v10[5], "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionSetByMergingAttributionSets:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFContentAttributionTracker attributionSets](self, "attributionSets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attributionSets"));

}

- (WFContentAttributionTracker)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WFContentAttributionTracker *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("attributionSets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFContentAttributionTracker initWithAttributionSets:](self, "initWithAttributionSets:", v10);
  return v11;
}

- (NSMutableDictionary)attributionSets
{
  return self->_attributionSets;
}

- (OS_dispatch_queue)trackingAttributionSetQueue
{
  return self->_trackingAttributionSetQueue;
}

uint64_t __52__WFContentAttributionTracker_trackedAttributionSet__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__WFContentAttributionTracker_trackedAttributionSet__block_invoke_2;
  v4[3] = &unk_1E7AF43F8;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __52__WFContentAttributionTracker_trackedAttributionSet__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "unionSet:");
}

void __58__WFContentAttributionTracker_attributionSetForParameter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "key");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __66__WFContentAttributionTracker_replaceAttributionSet_forParameter___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", a1[6]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 8);
  objc_msgSend(v2, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

}

void __62__WFContentAttributionTracker_addAttributionSet_forParameter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v5, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
