@implementation HVDonationReceiver

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  HVQueues *queues;
  BOOL v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v19 = v6;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: deleteContentWithRequest called: %{private}@", buf, 0xCu);
  }

  queues = self->_queues;
  v15 = 0;
  v9 = -[HVQueues deleteContentWithRequest:error:](queues, "deleteContentWithRequest:error:", v6, &v15);
  v10 = v15;
  if (!v9)
  {
    hv_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_error_impl(&dword_21AA1D000, v11, OS_LOG_TYPE_ERROR, "HVDonationReceiver: deleteContentWithRequest failed: %@", buf, 0xCu);
    }

    if (a4)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD1398];
      v17 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 6, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

+ (id)defaultReceiver
{
  if (defaultReceiver__pasOnceToken6 != -1)
    dispatch_once(&defaultReceiver__pasOnceToken6, &__block_literal_global_1157);
  return (id)defaultReceiver__pasExprOnceResult;
}

- (BOOL)donateInteractions:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  HVInteraction *v19;
  HVQueues *queues;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  BOOL v28;
  id *v29;
  id v30;
  char v31;
  NSObject *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  id v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v33 = a4;
  if (+[HVContentAdmission shouldAdmitContentFromBundleIdentifier:](HVContentAdmission, "shouldAdmitContentFromBundleIdentifier:"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    v10 = v9 == 0;
    if (v9)
    {
      v11 = v9;
      v28 = v9 == 0;
      v29 = a5;
      v30 = v7;
      v12 = 0;
      v13 = *(_QWORD *)v36;
      v14 = *MEMORY[0x24BDD0CF8];
      v31 = 1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v8);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x22074FDF0]();
          objc_msgSend(v16, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v19 = -[HVInteraction initWithInteraction:bundleIdentifier:]([HVInteraction alloc], "initWithInteraction:bundleIdentifier:", v16, v33);
            queues = self->_queues;
            v34 = 0;
            v21 = -[HVQueues enqueueContent:contentProtection:error:](queues, "enqueueContent:contentProtection:error:", v19, v14, &v34);
            v22 = v34;
            if (!v21)
            {
              hv_default_log_handle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v22;
                _os_log_error_impl(&dword_21AA1D000, v23, OS_LOG_TYPE_ERROR, "HVDonationReceiver: donateInteractions: HVQueues enqueueContent failed: %@", buf, 0xCu);
              }

              v24 = v22;
              v31 = 0;
              v12 = v24;
            }

          }
          else
          {
            hv_default_log_handle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543619;
              v42 = v33;
              v43 = 2117;
              v44 = v16;
              _os_log_fault_impl(&dword_21AA1D000, v22, OS_LOG_TYPE_FAULT, "Received interaction with nil identifier from bundle id %{public}@: %{sensitive}@", buf, 0x16u);
            }
          }

          objc_autoreleasePoolPop(v17);
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v11);

      v10 = v31;
      if ((v29 == 0) | v31 & 1)
      {
        v7 = v30;
        goto LABEL_27;
      }
      v25 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BDD1398];
      v8 = v12;
      v7 = v30;
      if (!v12)
        v8 = (id)objc_opt_new();
      v40 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 2, v26);
      *v29 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v28;
      if (v12)
      {
        v10 = 0;
        goto LABEL_27;
      }
    }

    v12 = 0;
    goto LABEL_27;
  }
  hv_default_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v33;
    _os_log_impl(&dword_21AA1D000, v12, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: donateInteraction: ignoring interaction from %@ due to user settings.", buf, 0xCu);
  }
  v10 = 1;
LABEL_27:

  return v10;
}

- (HVDonationReceiver)init
{
  void *v3;
  HVDonationReceiver *v4;

  +[HVQueues defaultQueues](HVQueues, "defaultQueues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HVDonationReceiver initWithQueues:](self, "initWithQueues:", v3);

  return v4;
}

- (HVDonationReceiver)initWithQueues:(id)a3
{
  id v5;
  HVDonationReceiver *v6;
  HVDonationReceiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HVDonationReceiver;
  v6 = -[HVDonationReceiver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queues, a3);

  return v7;
}

- (void)_setUpUserActivityDonations
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *biomeSubQueue;
  BMBiomeScheduler *v5;
  BMBiomeScheduler *biomeScheduler;
  void *v7;
  void *v8;
  void *v9;
  BPSSink *v10;
  BPSSink *biomeSink;
  _QWORD v12[5];

  objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "HVDonationReceiver.biomeSubQueue", 9);
  v3 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  biomeSubQueue = self->_biomeSubQueue;
  self->_biomeSubQueue = v3;

  v5 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CB48]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.HVDonationReceiver.BiomeScheduler"), self->_biomeSubQueue);
  biomeScheduler = self->_biomeScheduler;
  self->_biomeScheduler = v5;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "publisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", self->_biomeScheduler);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__HVDonationReceiver__setUpUserActivityDonations__block_invoke_9;
  v12[3] = &unk_24DD7EF30;
  v12[4] = self;
  objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_8_1147, v12);
  v10 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  biomeSink = self->_biomeSink;
  self->_biomeSink = v10;

}

- (BOOL)donateSearchableItems:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  HVQueues *queues;
  void *v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v47;
  char v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  NSObject *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  hv_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_13_1133);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v61 = v10;
    v62 = 2114;
    v63 = v8;
    v64 = 2114;
    v65 = v11;
    _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: received %tu searchableItems for %{public}@ (%{public}@)", buf, 0x20u);

  }
  if (+[HVContentAdmission shouldAdmitContentFromBundleIdentifier:](HVContentAdmission, "shouldAdmitContentFromBundleIdentifier:", v8))
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    v14 = v13 == 0;
    v51 = v13;
    if (v13)
    {
      v42 = a5;
      v43 = v7;
      v15 = 0;
      v16 = *(_QWORD *)v55;
      v48 = 1;
      v47 = *(_QWORD *)v55;
      v45 = v12;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v55 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x22074FDF0]();
          objc_msgSend(v18, "bundleID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v8);

          if ((v21 & 1) != 0)
          {
            v53 = 0;
            +[HVBiomeConversions biomeEventFromSearchableItem:bundleIdentifier:error:](HVBiomeConversions, "biomeEventFromSearchableItem:bundleIdentifier:error:", v18, v8, &v53);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v53;
            if (v22)
            {
              v24 = v15;
              v25 = v8;
              queues = self->_queues;
              objc_msgSend(v18, "protection");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = 0;
              v28 = -[HVQueues enqueueContent:contentProtection:error:](queues, "enqueueContent:contentProtection:error:", v22, v27, &v52);
              v29 = v52;

              if (v28)
              {
                v8 = v25;
                v15 = v24;
              }
              else
              {
                hv_default_log_handle();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v18, "bundleID");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "uniqueIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "domainIdentifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v61 = (uint64_t)v50;
                  v62 = 2114;
                  v63 = v37;
                  v64 = 2114;
                  v65 = v38;
                  v66 = 2112;
                  v67 = v29;
                  _os_log_error_impl(&dword_21AA1D000, v31, OS_LOG_TYPE_ERROR, "HVDonationReceiver: donateSearchableItems: HVQueues enqueueContent bid:%{public}@ uid:%{public}@ did:%{public}@ failed: %@", buf, 0x2Au);

                }
                v29 = v29;

                v48 = 0;
                v15 = v29;
                v8 = v25;
              }
              v12 = v45;
              v16 = v47;
            }
            else
            {
              hv_default_log_handle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v18, "bundleID");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "uniqueIdentifier");
                v49 = v15;
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "domainIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v61 = (uint64_t)v44;
                v62 = 2114;
                v63 = v35;
                v64 = 2114;
                v65 = v36;
                v66 = 2112;
                v67 = v23;
                _os_log_error_impl(&dword_21AA1D000, v30, OS_LOG_TYPE_ERROR, "HVDonationReceiver: HVBiomeConversions biomeEventFromSearchableItem bid:%{public}@ uid:%{public}@ did:%{public}@ failed: %@", buf, 0x2Au);

                v16 = v47;
                v15 = v49;

              }
              v48 = 0;
              v29 = v15;
              v15 = v23;
            }

          }
          else
          {
            hv_default_log_handle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v18, "bundleID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "uniqueIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "domainIdentifier");
              v34 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v61 = (uint64_t)v32;
              v62 = 2114;
              v63 = v8;
              v64 = 2114;
              v65 = v33;
              v66 = 2114;
              v67 = v34;
              _os_log_fault_impl(&dword_21AA1D000, v23, OS_LOG_TYPE_FAULT, "HVDonationReceiver: HVBiomeConversions mismatched bundle id (%{public}@ != %{public}@) uid:%{public}@ did:%{public}@", buf, 0x2Au);

            }
            v48 = 0;
          }

          objc_autoreleasePoolPop(v19);
          ++v17;
        }
        while (v51 != v17);
        v51 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      }
      while (v51);

      v14 = v48;
      if ((v42 == 0) | v48 & 1)
      {
        v7 = v43;
        goto LABEL_36;
      }
      v39 = (void *)MEMORY[0x24BDD1540];
      v58 = *MEMORY[0x24BDD1398];
      v12 = v15;
      v7 = v43;
      if (!v15)
        v12 = (id)objc_opt_new();
      v59 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 2, v40);
      *v42 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      if (v15)
      {
        v14 = 0;
        goto LABEL_36;
      }
    }

    v15 = 0;
    goto LABEL_36;
  }
  hv_default_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = (uint64_t)v8;
    _os_log_impl(&dword_21AA1D000, v15, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: donateSearchableItems: ignoring content from %{public}@ due to user settings.", buf, 0xCu);
  }
  v14 = 1;
LABEL_36:

  return v14;
}

- (BOOL)donateUserAction:(id)a3 searchableItem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  HVSearchableUserActivity *v19;
  HVSearchableUserActivity *v20;
  HVQueues *queues;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  __int128 *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  id v47;
  __int128 v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HVContentAdmission shouldAdmitContentFromBundleIdentifier:](HVContentAdmission, "shouldAdmitContentFromBundleIdentifier:", v10);

  if (v11)
  {
    v12 = dispatch_semaphore_create(0);
    *(_QWORD *)&v48 = 0;
    *((_QWORD *)&v48 + 1) = &v48;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__1125;
    v51 = __Block_byref_object_dispose__1126;
    v52 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__1125;
    v42 = __Block_byref_object_dispose__1126;
    v43 = 0;
    v13 = (void *)MEMORY[0x24BDD1960];
    objc_msgSend(v8, "uaIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __60__HVDonationReceiver_donateUserAction_searchableItem_error___block_invoke;
    v34[3] = &unk_24DD7EF98;
    v36 = &v38;
    v37 = &v48;
    v15 = v12;
    v35 = v15;
    v16 = (id)objc_msgSend(v13, "_fetchUserActivityWithUUID:intervalToWaitForDocumentSynchronizationToComplete:completionHandler:", v14, v34, 5.0);

    objc_msgSend(MEMORY[0x24BE7A5D8], "waitForSemaphore:", v15);
    if (!*(_QWORD *)(*((_QWORD *)&v48 + 1) + 40))
    {
      v23 = 0;
      if (a5)
        *a5 = objc_retainAutorelease((id)v39[5]);
      goto LABEL_19;
    }
    hv_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(*((_QWORD *)&v48 + 1) + 40);
      *(_DWORD *)buf = 138412290;
      v47 = v18;
      _os_log_impl(&dword_21AA1D000, v17, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: donateUserActivity: fetched user activity: %@", buf, 0xCu);
    }

    v19 = [HVSearchableUserActivity alloc];
    v20 = -[HVSearchableUserActivity initWithUserActivity:searchableItem:](v19, "initWithUserActivity:searchableItem:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 40), v9);
    queues = self->_queues;
    objc_msgSend(v9, "protection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v23 = -[HVQueues enqueueContent:contentProtection:error:](queues, "enqueueContent:contentProtection:error:", v20, v22, &v33);
    v24 = v33;

    if ((v23 & 1) == 0)
    {
      hv_default_log_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v24;
        _os_log_error_impl(&dword_21AA1D000, v27, OS_LOG_TYPE_ERROR, "HVDonationReceiver: donateUserAction: HVQueues enqueueContent failed: %@", buf, 0xCu);
      }

      v28 = v24;
      v25 = v28;
      if (!a5)
        goto LABEL_18;
      v32 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD1398];
      v29 = v28;
      if (!v28)
        v29 = (void *)objc_opt_new();
      v45 = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 2, v30);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      if (v25)
        goto LABEL_18;

    }
    v25 = 0;
LABEL_18:

LABEL_19:
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v48, 8);
    goto LABEL_20;
  }
  hv_default_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "bundleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = 138412290;
    *(_QWORD *)((char *)&v48 + 4) = v26;
    _os_log_impl(&dword_21AA1D000, v15, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: donateUserActivity: ignoring activity from %@ due to user settings.", (uint8_t *)&v48, 0xCu);

  }
  v23 = 1;
LABEL_20:

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeSink, 0);
  objc_storeStrong((id *)&self->_biomeScheduler, 0);
  objc_storeStrong((id *)&self->_biomeSubQueue, 0);
  objc_storeStrong((id *)&self->_queues, 0);
}

void __60__HVDonationReceiver_donateUserAction_searchableItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_ERROR, "HVDonationReceiver: donateUserAction: failed to fetch user activity: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

__CFString *__67__HVDonationReceiver_donateSearchableItems_bundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("(NO UNIQUEID!)");
  v4 = v2;

  return v4;
}

void __49__HVDonationReceiver__setUpUserActivityDonations__block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HVContentAdmission shouldAdmitContentFromBundleIdentifier:](HVContentAdmission, "shouldAdmitContentFromBundleIdentifier:", v4);

  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *MEMORY[0x24BDD0CE0];
    v13 = 0;
    v8 = objc_msgSend(v6, "enqueueContent:contentProtection:error:", v3, v7, &v13);
    v9 = v13;
    if ((v8 & 1) == 0)
    {
      hv_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v3, "uuid");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "associatedBundleId");
      v12 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_21AA1D000, v10, OS_LOG_TYPE_ERROR, "HVDonationReceiver: user activities: failed to enqueue %@ from %@: %@", buf, 0x20u);

LABEL_7:
      goto LABEL_8;
    }
  }
  else
  {
    hv_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uuid");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "associatedBundleId");
      v11 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: user activities: ignoring %@ from %@ due to settings.", buf, 0x16u);
      goto LABEL_7;
    }
  }
LABEL_9:

}

void __49__HVDonationReceiver__setUpUserActivityDonations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    hv_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_21AA1D000, v3, OS_LOG_TYPE_ERROR, "HVDonationReceiver: user activities: completion error: %@", (uint8_t *)&v6, 0xCu);

    }
  }
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: user activities: completed.", (uint8_t *)&v6, 2u);
  }

}

void __37__HVDonationReceiver_defaultReceiver__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_opt_new();
  v2 = (void *)defaultReceiver__pasExprOnceResult;
  defaultReceiver__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
