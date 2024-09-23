@implementation SUCoreEventAugmenter

- (SUCoreEventAugmenter)init
{
  SUCoreEventAugmenter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *stateQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUCoreEventAugmenter;
  v2 = -[SUCoreEventAugmenter init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.su.eventAugmenter", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)setPolicy:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SUCoreEventAugmenter_setPolicy___block_invoke;
  block[3] = &unk_1EA878A88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __34__SUCoreEventAugmenter_setPolicy___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)setPrimaryDescriptor:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SUCoreEventAugmenter_setPrimaryDescriptor___block_invoke;
  block[3] = &unk_1EA878A88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __45__SUCoreEventAugmenter_setPrimaryDescriptor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setAlternateDescriptor:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SUCoreEventAugmenter_setAlternateDescriptor___block_invoke;
  block[3] = &unk_1EA878A88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __47__SUCoreEventAugmenter_setAlternateDescriptor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)augmentEvent:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUCoreEventAugmenter *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SUCoreEventAugmenter_augmentEvent___block_invoke;
  block[3] = &unk_1EA878A88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __37__SUCoreEventAugmenter_augmentEvent___block_invoke(uint64_t a1)
{
  return +[SUCoreEventAugmenter augmentEvent:withPolicy:primaryDescriptor:alternateDescriptor:](SUCoreEventAugmenter, "augmentEvent:withPolicy:primaryDescriptor:alternateDescriptor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

+ (void)augmentEvent:(id)a3 withPolicy:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    v11 = CFSTR("missing required event param");
LABEL_10:
    objc_msgSend(v10, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_AUGMENTER]"), v11, 8101, 0);
    goto LABEL_11;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    v11 = CFSTR("missing required policy param");
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isSupervisedPolicy"))
    objc_msgSend(v12, "setSafeObject:forKey:", *MEMORY[0x1E0DA8B50], *MEMORY[0x1E0DA8AB8]);
  v6 = objc_msgSend(v5, "delayPeriodDays");
  if (v6 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSafeObject:forKey:", v7, *MEMORY[0x1E0DA8A58]);

  }
  objc_msgSend(v5, "requestedProductMarketingVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSafeObject:forKey:", v8, *MEMORY[0x1E0DA8AB0]);
  objc_msgSend(v5, "mdmPathName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSafeObject:forKey:", v9, *MEMORY[0x1E0DA8A60]);

LABEL_11:
}

+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4
{
  +[SUCoreEventAugmenter augmentEvent:withDescriptor:specifyAlternateUpdate:](SUCoreEventAugmenter, "augmentEvent:withDescriptor:specifyAlternateUpdate:", a3, a4, 0);
}

+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4 specifyAlternateUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;

  v5 = a5;
  v33 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v5)
      objc_msgSend(v7, "descriptorAudienceType");
    objc_msgSend(v8, "productBuildVersion");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSafeObject:forKey:");
    objc_msgSend(v8, "updateTypeName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSafeObject:forKey:");
    v9 = (void *)*MEMORY[0x1E0DA8B50];
    v10 = (void *)*MEMORY[0x1E0DA8B10];
    if (objc_msgSend(v8, "rampEnabled"))
      v11 = v9;
    else
      v11 = v10;
    v30 = v11;
    objc_msgSend(v33, "setSafeObject:forKey:");
    +[SUCoreDescriptor nameForDescriptorAudienceType:](SUCoreDescriptor, "nameForDescriptorAudienceType:", objc_msgSend(v8, "descriptorAudienceType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSafeObject:forKey:");
    +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:](SUCoreDescriptor, "nameForDescriptorPreferredUpdateType:", objc_msgSend(v8, "preferredUpdateType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSafeObject:forKey:");
    if (objc_msgSend(v8, "mandatoryUpdateEligible"))
      v12 = v9;
    else
      v12 = v10;
    v13 = v12;
    objc_msgSend(v33, "setSafeObject:forKey:", v13, *MEMORY[0x1E0DA8A68]);
    if (objc_msgSend(v8, "mandatoryUpdateOptional"))
      v14 = v9;
    else
      v14 = v10;
    v15 = v14;
    objc_msgSend(v33, "setSafeObject:forKey:", v15, *MEMORY[0x1E0DA8A70]);
    objc_msgSend(v8, "associatedSplatDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = v9;
    else
      v17 = v10;
    v18 = *MEMORY[0x1E0DA8AA8];
    v19 = v17;
    objc_msgSend(v33, "setSafeObject:forKey:", v19, v18);
    if (v19)
    {
      objc_msgSend(v16, "productBuildVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setSafeObject:forKey:", v20, *MEMORY[0x1E0DA8AA0]);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "totalRequiredFreeSpace"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSafeObject:forKey:", v21, *MEMORY[0x1E0DA8AC8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "preSUStagingRequiredSize"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "preSUStagingOptionalSize"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "enablePreSUStaging"))
      v24 = v9;
    else
      v24 = v10;
    v25 = *MEMORY[0x1E0DA8A88];
    v26 = v24;
    objc_msgSend(v33, "setSafeObject:forKey:", v22, v25);
    objc_msgSend(v33, "setSafeObject:forKey:", v23, *MEMORY[0x1E0DA8A80]);
    objc_msgSend(v33, "setSafeObject:forKey:", v26, *MEMORY[0x1E0DA8A78]);

    v27 = (void *)v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_AUGMENTER]"), CFSTR("missing required descriptor param"), 8101, 0);
  }

}

+ (void)augmentEvent:(id)a3 withPolicy:(id)a4 primaryDescriptor:(id)a5 alternateDescriptor:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_AUGMENTER]"), CFSTR("missing required event param"), 8101, 0);

    goto LABEL_11;
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_AUGMENTER]"), CFSTR("missing required policy param"), 8101, 0);

    if (v10)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_AUGMENTER]"), CFSTR("missing required descriptor param"), 8101, 0);

    goto LABEL_4;
  }
  if (!v10)
    goto LABEL_13;
LABEL_4:
  if (v9)
    +[SUCoreEventAugmenter augmentEvent:withPolicy:](SUCoreEventAugmenter, "augmentEvent:withPolicy:", v15, v9);
  if (v10)
    +[SUCoreEventAugmenter augmentEvent:withDescriptor:specifyAlternateUpdate:](SUCoreEventAugmenter, "augmentEvent:withDescriptor:specifyAlternateUpdate:", v15, v10, v11 != 0);
  if (v11)
    +[SUCoreEventAugmenter augmentEvent:withDescriptor:specifyAlternateUpdate:](SUCoreEventAugmenter, "augmentEvent:withDescriptor:specifyAlternateUpdate:", v15, v11, v10 != 0);
LABEL_11:

}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (SUCoreDescriptor)primaryDescriptor
{
  return self->_primaryDescriptor;
}

- (SUCoreDescriptor)alternateDescriptor
{
  return self->_alternateDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_alternateDescriptor, 0);
  objc_storeStrong((id *)&self->_primaryDescriptor, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

@end
