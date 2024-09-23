@implementation PKODIAssessment

- (PKODIAssessment)init
{
  PKODIAssessment *v2;
  PKODIAssessment *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *replyQueue;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *assessmentComputedBlocks;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKODIAssessment;
  v2 = -[PKODIAssessment init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_create("com.apple.passkitcore.PKODIAssessment.work", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.passkitcore.PKODIAssessment.reply", 0);
    replyQueue = v3->_replyQueue;
    v3->_replyQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    assessmentComputedBlocks = v3->_assessmentComputedBlocks;
    v3->_assessmentComputedBlocks = v8;

  }
  return v3;
}

- (void)startAssessment
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PKODIAssessment_startAssessment__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __34__PKODIAssessment_startAssessment__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "CoreODI session already in progress, discarding", (uint8_t *)&v6, 2u);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 33) = 1;
  objc_msgSend(*(id *)(a1 + 32), "createODISession");
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Created ODISession: %@", (uint8_t *)&v6, 0xCu);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
}

- (void)startAssessmentWithHostBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[PKODIAssessment startAssessment](self, "startAssessment");
  -[PKODIAssessment updateAssessmentWithHostBundleIdentifier:](self, "updateAssessmentWithHostBundleIdentifier:", v4);

}

- (void)updateAssessment:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PKODIAssessment_updateAssessment___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __36__PKODIAssessment_updateAssessment___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isAssessing");
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Updating CoreODI assessment on session: %@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateWithAdditionalAttributes:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v4)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Assessment not underway, ignoring update", (uint8_t *)&v6, 2u);
    }

  }
}

- (BOOL)isAssessing
{
  PKODIAssessment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isAssessing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateAssessmentWithHostBundleIdentifier:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PKODIAssessment_updateAssessmentWithHostBundleIdentifier___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __60__PKODIAssessment_updateAssessmentWithHostBundleIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[8];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isAssessing") & 1) != 0)
  {
    if (!*(_QWORD *)(a1 + 40))
      return;
    v2 = objc_alloc_init(MEMORY[0x1E0D17580]);
    v3 = *(_QWORD *)(a1 + 40);
    v6 = CFSTR("callerClientBundle");
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAttributes:](v2, "setAttributes:", v4);

    objc_msgSend(*(id *)(a1 + 32), "updateAssessment:", v2);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Assessment not underway, ignoring update", v5, 2u);
    }
  }

}

- (void)updateAssessmentWithModel:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PKODIAssessment_updateAssessmentWithModel___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __45__PKODIAssessment_updateAssessmentWithModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  id v50;
  uint8_t buf[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isAssessing") & 1) != 0)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 40), "currencyCode");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v2, *MEMORY[0x1E0D175E0]);

    objc_msgSend(*(id *)(a1 + 40), "transactionAmount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v3, *MEMORY[0x1E0D17670]);

    objc_msgSend(*(id *)(a1 + 40), "merchantName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v4, *MEMORY[0x1E0D175F0]);

    objc_msgSend(*(id *)(a1 + 40), "pass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryAccountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v6, *MEMORY[0x1E0D175E8]);

    objc_msgSend(*(id *)(a1 + 40), "shippingEmail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "shippingPhone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "phoneNumbers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "shippingAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postalAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "billingAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postalAddresses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "safelySetObject:forKey:", v10, *MEMORY[0x1E0D17650]);
    objc_msgSend(v50, "safelySetObject:forKey:", v15, *MEMORY[0x1E0D17668]);
    objc_msgSend(*(id *)(a1 + 40), "billingAddress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "givenName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v25, *MEMORY[0x1E0D175C8]);

    objc_msgSend(*(id *)(a1 + 40), "billingAddress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "familyName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v27, *MEMORY[0x1E0D175D0]);

    objc_msgSend(*(id *)(a1 + 40), "shippingAddress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "givenName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v29, *MEMORY[0x1E0D17658]);

    objc_msgSend(*(id *)(a1 + 40), "shippingAddress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "familyName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v31, *MEMORY[0x1E0D17660]);

    if (v19)
    {
      objc_msgSend(v19, "street");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v32, *MEMORY[0x1E0D17640]);

      objc_msgSend(v19, "subLocality");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v33, *MEMORY[0x1E0D17648]);

      objc_msgSend(v19, "state");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v34, *MEMORY[0x1E0D17638]);

      objc_msgSend(v19, "city");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v35, *MEMORY[0x1E0D17618]);

      objc_msgSend(v19, "country");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v36, *MEMORY[0x1E0D17620]);

      objc_msgSend(v19, "ISOCountryCode");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v37, *MEMORY[0x1E0D17628]);

      objc_msgSend(v19, "postalCode");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v38, *MEMORY[0x1E0D17630]);

    }
    if (v23)
    {
      objc_msgSend(v23, "street");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v39, *MEMORY[0x1E0D175B8]);

      objc_msgSend(v23, "subLocality");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v40, *MEMORY[0x1E0D175C0]);

      objc_msgSend(v23, "state");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v41, *MEMORY[0x1E0D175B0]);

      objc_msgSend(v23, "city");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v42, *MEMORY[0x1E0D17590]);

      objc_msgSend(v23, "country");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v43, *MEMORY[0x1E0D17598]);

      objc_msgSend(v23, "ISOCountryCode");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v44, *MEMORY[0x1E0D175A0]);

      objc_msgSend(v23, "postalCode");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safelySetObject:forKey:", v45, *MEMORY[0x1E0D175A8]);

    }
    objc_msgSend(*(id *)(a1 + 40), "pass");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "issuerCountryCode");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safelySetObject:forKey:", v47, CFSTR("issuerCountryCode"));

    v48 = objc_alloc_init(MEMORY[0x1E0D17580]);
    objc_msgSend(v48, "setAttributes:", v50);
    objc_msgSend(*(id *)(a1 + 32), "updateAssessment:", v48);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v49, OS_LOG_TYPE_DEFAULT, "Assessment not underway, ignoring update", buf, 2u);
    }

  }
}

- (void)computeAssessment
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PKODIAssessment_computeAssessment__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __36__PKODIAssessment_computeAssessment__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 32);
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(v2 + 80), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Already computing CoreODI assessment on session: %@", buf, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(v2 + 80), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Computing CoreODI assessment on session: %@", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 40) = CFAbsoluteTimeGetCurrent();
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
    PKTimeProfileBegin(0, CFSTR("get_odi_assessment"));
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__PKODIAssessment_computeAssessment__block_invoke_19;
    v9[3] = &unk_1E2AC9AB8;
    v9[4] = v8;
    objc_msgSend(v8, "getAssessmentWithCompletion:", v9);
  }
}

void __36__PKODIAssessment_computeAssessment__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PKODIAssessment_computeAssessment__block_invoke_2;
  block[3] = &unk_1E2ABE0F8;
  v12 = v6;
  v13 = v5;
  v14 = v7;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __36__PKODIAssessment_computeAssessment__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = PKTimeProfileEnd(v2, CFSTR("get_odi_assessment"), CFSTR("PKODIAssessment: ODISession: getAssessment"));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error computing CoreODI assessment: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Received CoreODI assessment: %@", (uint8_t *)&v8, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 20));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 8), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 33) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 20));
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 32) = 0;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 48);
  if (v7)
    dispatch_source_cancel(v7);
}

- (id)currentAssessment
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSString copy](self->_assessment, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)currentAssessmentDidTimeout
{
  PKODIAssessment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_currentAssessmentDidTimeout;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)waitForAssessmentWithContinueBlock:(id)a3
{
  -[PKODIAssessment waitForAssessmentWithTimeout:startTimeoutFromAssessmentStart:continueBlock:](self, "waitForAssessmentWithTimeout:startTimeoutFromAssessmentStart:continueBlock:", 5, 0, a3);
}

- (void)waitForAssessmentWithTimeout:(unint64_t)a3 startTimeoutFromAssessmentStart:(BOOL)a4 continueBlock:(id)a5
{
  id v8;
  void *v9;
  NSObject *workQueue;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke;
    v11[3] = &unk_1E2AC9AE0;
    v11[4] = self;
    v12 = v8;
    v13 = a3;
    v14 = a4;
    dispatch_async(workQueue, v11);

  }
}

void __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  double v10;
  CFAbsoluteTime Current;
  uint64_t v12;
  double v13;
  double v14;
  CFAbsoluteTime v15;
  dispatch_source_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[5];
  _QWORD handler[5];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "currentAssessment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32), v4, !v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_callAssessmentComputedBlocksAndDidTimeout:", 0);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v6 + 32))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v6 + 80), "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "CoreODI assessment requested, but computation not started %@", buf, 0xCu);

      }
    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = (double)v9;
      if (*(_BYTE *)(a1 + 56))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v12 = *(_QWORD *)(a1 + 32);
        v13 = Current - *(double *)(v12 + 40);
        v14 = (double)*(unint64_t *)(a1 + 48) + -0.25;
        if (v13 < v14)
        {
          v15 = CFAbsoluteTimeGetCurrent();
          v12 = *(_QWORD *)(a1 + 32);
          v14 = v15 - *(double *)(v12 + 40);
        }
        v10 = v10 - v14;
      }
      else
      {
        v12 = *(_QWORD *)(a1 + 32);
      }
      v16 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v12 + 56));
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 48);
      *(_QWORD *)(v17 + 48) = v16;

      v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      v20 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v21 = *(_QWORD *)(a1 + 32);
      v22 = MEMORY[0x1E0C809B0];
      v23 = *(NSObject **)(v21 + 48);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke_23;
      handler[3] = &unk_1E2ABE120;
      handler[4] = v21;
      dispatch_source_set_event_handler(v23, handler);
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(NSObject **)(v24 + 48);
      v26[0] = v22;
      v26[1] = 3221225472;
      v26[2] = __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke_24;
      v26[3] = &unk_1E2ABE120;
      v26[4] = v24;
      dispatch_source_set_cancel_handler(v25, v26);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48));
    }
  }
}

uint64_t __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke_23(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 48))
  {
    v2 = result;
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v1 + 80), "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "CoreODI assessment timed out %@", (uint8_t *)&v7, 0xCu);

    }
    v5 = *(_QWORD *)(v2 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = 0;

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(v2 + 32) + 20));
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 16) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v2 + 32) + 20));
    return objc_msgSend(*(id *)(v2 + 32), "_callAssessmentComputedBlocksAndDidTimeout:", 1);
  }
  return result;
}

uint64_t __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke_24(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  return objc_msgSend(*(id *)(a1 + 32), "_callAssessmentComputedBlocksAndDidTimeout:", 0);
}

- (void)provideSessionFeedback:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKODIAssessment odiSession](self, "odiSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = a3;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Providing ODISession feedback %ld on session %@", (uint8_t *)&v8, 0x16u);

  }
  -[PKODIAssessment odiSession](self, "odiSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provideFeedbackOnPayloadOutcome:", a3);

}

- (void)getAssessmentWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)_callAssessmentComputedBlocksAndDidTimeout:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PKODIAssessment__callAssessmentComputedBlocksAndDidTimeout___block_invoke;
  v4[3] = &unk_1E2ABE1C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

void __62__PKODIAssessment__callAssessmentComputedBlocksAndDidTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "currentAssessment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 72))
    {
      objc_msgSend(*(id *)(v4 + 80), "availablePartialAssessment");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __62__PKODIAssessment__callAssessmentComputedBlocksAndDidTimeout___block_invoke_2;
        block[3] = &unk_1E2ABDAB8;
        v15 = v11;
        v14 = v3;
        v16 = *(_BYTE *)(a1 + 40);
        dispatch_async(v12, block);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

uint64_t __62__PKODIAssessment__callAssessmentComputedBlocksAndDidTimeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)allowPartialAssessment
{
  return self->_allowPartialAssessment;
}

- (void)setAllowPartialAssessment:(BOOL)a3
{
  self->_allowPartialAssessment = a3;
}

- (ODISession)odiSession
{
  return self->_odiSession;
}

- (void)setOdiSession:(id)a3
{
  objc_storeStrong((id *)&self->_odiSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiSession, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_assessmentComputedBlocks, 0);
  objc_storeStrong((id *)&self->_assessment, 0);
}

@end
