@implementation UNSAttachmentsService

- (UNSAttachmentsService)initWithAttachmentsRepository:(id)a3 notificationRepository:(id)a4 notificationSchedulingService:(id)a5 pendingNotificationRepository:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  UNSAttachmentsService *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)UNSAttachmentsService;
  v15 = -[UNSAttachmentsService init](&v20, sel_init);
  if (v15)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.usernotificationsserver.AttachmentsService", v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v15->_attachmentsRepository, a3);
    objc_storeStrong((id *)&v15->_notificationRepository, a4);
    objc_storeStrong((id *)&v15->_notificationSchedulingService, a5);
    objc_storeStrong((id *)&v15->_pendingNotificationRepository, a6);
    -[UNSAttachmentsService _beginObservingNotificationChanges](v15, "_beginObservingNotificationChanges");
  }

  return v15;
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  if (a3)
    -[UNSAttachmentsService ensureIntegrityWithCompletionHandler:](self, "ensureIntegrityWithCompletionHandler:", &__block_literal_global_1);
}

void __69__UNSAttachmentsService_contentProtectionStateChangedForFirstUnlock___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = *MEMORY[0x24BDF8980];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_216DCB000, v0, OS_LOG_TYPE_DEFAULT, "Attachment integrity check complete after first unlock", v1, 2u);
  }
}

- (void)ensureIntegrityWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__UNSAttachmentsService_ensureIntegrityWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D639AE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__UNSAttachmentsService_ensureIntegrityWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[16];

  v2 = *MEMORY[0x24BDF8980];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "Suspending attachment service", buf, 2u);
  }
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__UNSAttachmentsService_ensureIntegrityWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_24D639AE0;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_queue_ensureIntegrityWithCompletionHandler:", v4);

}

uint64_t __62__UNSAttachmentsService_ensureIntegrityWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = *MEMORY[0x24BDF8980];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "Resuming attachment service", v4, 2u);
  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_queue_ensureIntegrityWithCompletionHandler:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id obj;
  NSObject *queue;
  _QWORD block[5];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  NSObject *v20;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("com.apple.usernotificationsserver.AttachmentsService.integrity", v4);

  v5 = dispatch_group_create();
  -[UNCAttachmentsRepository bundleIdentifiersClaimingAttachments](self->_attachmentsRepository, "bundleIdentifiersClaimingAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        dispatch_group_enter(v5);
        v19[0] = v8;
        v19[1] = 3221225472;
        v19[2] = __69__UNSAttachmentsService__queue_ensureIntegrityWithCompletionHandler___block_invoke;
        v19[3] = &unk_24D639B08;
        v21 = v26;
        v19[4] = v11;
        v20 = v5;
        -[UNSAttachmentsService _notificationIdentifiersForBundleIdentifier:replyOnQueue:completionHandler:](self, "_notificationIdentifiersForBundleIdentifier:replyOnQueue:completionHandler:", v11, queue, v19);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __69__UNSAttachmentsService__queue_ensureIntegrityWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24D639B30;
  v18 = v26;
  block[4] = self;
  v17 = v13;
  v12 = v13;
  dispatch_group_notify(v5, queue, block);

  _Block_object_dispose(v26, 8);
}

void __69__UNSAttachmentsService__queue_ensureIntegrityWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", a2, *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __69__UNSAttachmentsService__queue_ensureIntegrityWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 16), "ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (id)resolveAttachmentsForRequest:(id)a3 bundleIdentifier:(id)a4 fromLocalClientConnection:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *queue;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v13 = v10;
  v39 = v13;
  -[UNSAttachmentsService _queue_resolveGenmojiAttachmentsForRequest:](self, "_queue_resolveGenmojiAttachmentsForRequest:", v35[5]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v35[5];
  v35[5] = v14;

  objc_msgSend(v13, "content");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attachments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    queue = self->_queue;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __103__UNSAttachmentsService_resolveAttachmentsForRequest_bundleIdentifier_fromLocalClientConnection_error___block_invoke;
    v23[3] = &unk_24D639B58;
    v26 = &v34;
    v23[4] = self;
    v24 = v11;
    v25 = v12;
    v27 = &v28;
    dispatch_sync(queue, v23);
    if (a6)
    {
      v20 = (void *)v29[5];
      if (v20)
        *a6 = objc_retainAutorelease(v20);
    }

    _Block_object_dispose(&v28, 8);
  }
  v21 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v21;
}

void __103__UNSAttachmentsService_resolveAttachmentsForRequest_bundleIdentifier_fromLocalClientConnection_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = a1[6];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "_queue_resolveAttachmentsForRequest:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:continueOnFailure:error:", v3, v5, v2, 0, 0, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)resolveAttachmentsSkippingErrorsForRequest:(id)a3 bundleIdentifier:(id)a4 fromBundleProxyForServiceExtension:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *queue;
  id v16;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  objc_msgSend(v9, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __120__UNSAttachmentsService_resolveAttachmentsSkippingErrorsForRequest_bundleIdentifier_fromBundleProxyForServiceExtension___block_invoke;
    block[3] = &unk_24D639B80;
    v22 = &v23;
    block[4] = self;
    v19 = v9;
    v20 = v10;
    v21 = v11;
    dispatch_sync(queue, block);

  }
  else
  {
    objc_storeStrong(v24 + 5, a3);
  }
  v16 = v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __120__UNSAttachmentsService_resolveAttachmentsSkippingErrorsForRequest_bundleIdentifier_fromBundleProxyForServiceExtension___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_resolveAttachmentsForRequest:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:continueOnFailure:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), 1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_resolveGenmojiAttachmentsForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t, uint64_t);
  void *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_msgSend(v6, "length");
  v9 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __68__UNSAttachmentsService__queue_resolveGenmojiAttachmentsForRequest___block_invoke;
  v31[3] = &unk_24D639BA8;
  v10 = v7;
  v32 = v10;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v31);
  -[UNSAttachmentsService _thumbnailRepresentationsForGlyphData:](self, "_thumbnailRepresentationsForGlyphData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "mutableCopy");
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v13 = objc_msgSend(v6, "length");
  v23 = v9;
  v24 = 3221225472;
  v25 = __68__UNSAttachmentsService__queue_resolveGenmojiAttachmentsForRequest___block_invoke_2;
  v26 = &unk_24D639BD0;
  v14 = v11;
  v27 = v14;
  v29 = v30;
  v15 = v12;
  v28 = v15;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, &v23);
  objc_msgSend(v4, "content", v23, v24, v25, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "setAttributedBody:", v15);
  v18 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(v4, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trigger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestWithIdentifier:content:trigger:destinations:", v19, v17, v20, objc_msgSend(v4, "destinations"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v30, 8);
  return v21;
}

void __68__UNSAttachmentsService__queue_resolveGenmojiAttachmentsForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("CTAdaptiveImageProvider")))
        {
          v10 = *(void **)(a1 + 32);
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "imageContent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __68__UNSAttachmentsService__queue_resolveGenmojiAttachmentsForRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
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
  unint64_t v22;
  uint64_t v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v7, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v52;
    v9 = 0x24BDF6000uLL;
    v10 = 0x24BDBC000;
    v40 = a3;
    v41 = a4;
    v42 = v8;
    v43 = v7;
    v39 = a1;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v52 != v48)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, v39);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v12;
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("CTAdaptiveImageProvider")))
        {
          if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                                 + 8)
                                                                                     + 24))
          {
            objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "generatedProperties");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "additionalProperties");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "objectForKey:", CFSTR("contentIdentifier"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", CFSTR("shortDescription"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", CFSTR("alignmentInsetWidths"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v17;
              objc_msgSend(v17, "objectForKey:", CFSTR("alignmentInsetHeights"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v15;
              objc_msgSend(v15, "images");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)objc_opt_new();
              if (objc_msgSend(v20, "count"))
              {
                v22 = 0;
                do
                {
                  v23 = objc_msgSend(v20, "objectAtIndex:", v22);
                  objc_msgSend(v18, "objectAtIndex:", v22);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "floatValue");
                  v26 = v25;

                  objc_msgSend(v19, "objectAtIndex:", v22);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "floatValue");
                  v29 = v28;

                  v30 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 1840)), "initWithImage:alignmentInset:", v23, v26, v29);
                  objc_msgSend(v21, "addObject:", v30);

                  ++v22;
                }
                while (v22 < objc_msgSend(v20, "count"));
              }
              if (v47)
              {
                v8 = v42;
                v7 = v43;
                v31 = v45;
                if (v46 && objc_msgSend(v21, "count"))
                {
                  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6728]), "initWithContentIdentifier:shortDescription:strikeImages:", v47, v46, v21);
                  v33 = objc_alloc(MEMORY[0x24BDF66E8]);
                  objc_msgSend(v32, "imageData");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = (void *)objc_msgSend(v33, "initWithImageContent:", v34);

                  v36 = v35;
                  a1 = v39;
                  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v39 + 48) + 8) + 24);

                  v13 = v36;
                  v8 = v42;
                  v7 = v43;
                }
                else
                {
                  a1 = v39;
                }
              }
              else
              {
                v8 = v42;
                v7 = v43;
                a1 = v39;
                v31 = v45;
              }

              a3 = v40;
              a4 = v41;
              v9 = 0x24BDF6000;
              v10 = 0x24BDBC000uLL;
            }
          }
        }
        if (v13)
        {
          v37 = *(void **)(a1 + 40);
          v55 = v50;
          v56 = v13;
          objc_msgSend(*(id *)(v10 + 3696), "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setAttributes:range:", v38, a3, a4);

          v9 = 0x24BDF6000;
        }

      }
      v49 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v49);
  }

}

- (id)_queue_resolveAttachmentsForRequest:(id)a3 bundleIdentifier:(id)a4 fromLocalClientConnection:(id)a5 orFromServiceExtensionOfBundleProxy:(id)a6 continueOnFailure:(BOOL)a7 error:(id *)a8
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  id v50;
  void *v51;
  int v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *j;
  UNCAttachmentsRepository *attachmentsRepository;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  id v68;
  id v70;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *obj;
  id v77;
  _BOOL4 v78;
  char v79;
  uint64_t v80;
  UNSAttachmentsService *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t v97[128];
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  _BYTE v101[10];
  id v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v78 = a7;
  v105 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v82 = a4;
  v73 = a5;
  v72 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enterSecurityScope");
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v12, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v15;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
  v74 = v13;
  v81 = self;
  if (!v16)
  {
    v77 = 0;
    v79 = 1;
    goto LABEL_24;
  }
  v17 = v16;
  v77 = 0;
  v18 = *(_QWORD *)v94;
  v79 = 1;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v94 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
      objc_msgSend(v20, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v20, "type");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "type");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (v25)
        {
          objc_msgSend(v22, "URL");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            goto LABEL_11;
        }
        else
        {
          v33 = *MEMORY[0x24BDF8980];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v99 = v20;
            v100 = 2114;
            *(_QWORD *)v101 = v22;
            _os_log_error_impl(&dword_216DCB000, v33, OS_LOG_TYPE_ERROR, "Type conflict between attachment and pre-resolved attachment: attachment=%{public}@, preResolvedAttachment=%{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 100, 0);
          v34 = objc_claimAutoreleasedReturnValue();

          v77 = (id)v34;
        }
      }
      else
      {
        v92 = v77;
        -[UNSAttachmentsService _queue_resolvedURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:](self, "_queue_resolvedURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:", v20, v12, v82, v73, v72, &v92);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v92;

        v77 = v27;
        if (v26)
        {
LABEL_11:
          v28 = objc_alloc(MEMORY[0x24BDF8830]);
          objc_msgSend(v20, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "type");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "options");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v28, "initWithIdentifier:URL:type:options:", v29, v26, v30, v31);

          v13 = v74;
          objc_msgSend(v75, "addObject:", v32);

          self = v81;
          goto LABEL_19;
        }
      }
      self = v81;
      v35 = *MEMORY[0x24BDF8980];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v99 = v20;
        v100 = 2114;
        *(_QWORD *)v101 = v77;
        _os_log_error_impl(&dword_216DCB000, v35, OS_LOG_TYPE_ERROR, "Unable to stage attachment: attachment=%{public}@, error=%{public}@", buf, 0x16u);
      }
      if (!v78)
      {

        v79 = 0;
        goto LABEL_24;
      }
      v79 = 0;
LABEL_19:

    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    if (v17)
      continue;
    break;
  }
LABEL_24:

  objc_msgSend(v12, "leaveSecurityScope");
  if ((v79 & 1) != 0 || v78)
  {
    objc_msgSend(v12, "content");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (id)objc_msgSend(v63, "mutableCopy");

    objc_msgSend(v56, "setAttachments:", v75);
    v64 = (void *)MEMORY[0x24BDF8858];
    objc_msgSend(v12, "identifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trigger");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "requestWithIdentifier:content:trigger:destinations:", v65, v56, v66, objc_msgSend(v12, "destinations"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = *MEMORY[0x24BDF8980];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v99 = v57;
      v100 = 1024;
      *(_DWORD *)v101 = v79 & 1;
      *(_WORD *)&v101[4] = 1024;
      *(_DWORD *)&v101[6] = v78;
      _os_log_impl(&dword_216DCB000, v67, OS_LOG_TYPE_DEFAULT, "Successfully resolved request: resolvedRequest=%{public}@, resolutionSuccess=%{BOOL}d, continueOnFailure=%{BOOL}d", buf, 0x18u);
    }
  }
  else
  {
    v70 = v12;
    v36 = *MEMORY[0x24BDF8980];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
      -[UNSAttachmentsService _queue_resolveAttachmentsForRequest:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:continueOnFailure:error:].cold.1((uint64_t)v77, v36);
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v37 = v13;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v89;
      do
      {
        v41 = 0;
        v80 = v39;
        do
        {
          if (*(_QWORD *)v89 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v41);
          if ((-[UNCAttachmentsRepository isRepositoryURL:](self->_attachmentsRepository, "isRepositoryURL:", v42, v70) & 1) != 0)
          {
            v43 = *MEMORY[0x24BDF8980];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v99 = v42;
              _os_log_impl(&dword_216DCB000, v43, OS_LOG_TYPE_DEFAULT, "Skipping attachment URL from repository: URL=%{public}@", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v37, "objectForKey:", v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "URL");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "path");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v46, "fileExistsAtPath:", v47);

            if ((v48 & 1) == 0)
            {
              v49 = v40;
              v50 = v37;
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = 0;
              v52 = objc_msgSend(v51, "copyItemAtURL:toURL:error:", v45, v42, &v87);
              v53 = v87;

              v54 = *MEMORY[0x24BDF8980];
              v55 = *MEMORY[0x24BDF8980];
              if (v52)
              {
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v99 = v45;
                  v100 = 2114;
                  *(_QWORD *)v101 = v42;
                  _os_log_impl(&dword_216DCB000, v54, OS_LOG_TYPE_DEFAULT, "Rolled back attachment: resolvedURL=%{public}@, originalAttachmentURL=%{public}@", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v99 = v45;
                v100 = 2114;
                *(_QWORD *)v101 = v42;
                *(_WORD *)&v101[8] = 2114;
                v102 = v53;
                _os_log_error_impl(&dword_216DCB000, v54, OS_LOG_TYPE_ERROR, "Unable to roll back attachment: resolvedURL=%{public}@, originalAttachmentURL=%{public}@, error=%{public}@", buf, 0x20u);
              }

              v37 = v50;
              v40 = v49;
              v39 = v80;
            }

            self = v81;
          }
          ++v41;
        }
        while (v39 != v41);
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
      }
      while (v39);
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v56 = v75;
    v57 = (void *)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
    if (v57)
    {
      v58 = *(_QWORD *)v84;
      v12 = v70;
      do
      {
        for (j = 0; j != v57; j = (char *)j + 1)
        {
          if (*(_QWORD *)v84 != v58)
            objc_enumerationMutation(v56);
          attachmentsRepository = self->_attachmentsRepository;
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j), "URL", v70);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCAttachmentsRepository removeReferenceToRepositoryURL:forNotificationIdentifier:bundleIdentifier:](attachmentsRepository, "removeReferenceToRepositoryURL:forNotificationIdentifier:bundleIdentifier:", v61, v62, v82);

        }
        v57 = (void *)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
      }
      while (v57);
    }
    else
    {
      v12 = v70;
    }
  }

  if (a8 && v77)
    *a8 = objc_retainAutorelease(v77);
  v68 = v57;

  return v68;
}

- (id)_thumbnailRepresentationsForGlyphData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id obj;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v27;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v6);
        v20 = 0;
        v21 = &v20;
        v22 = 0x3032000000;
        v23 = __Block_byref_object_copy_;
        v24 = __Block_byref_object_dispose_;
        v25 = 0;
        v18[0] = 0;
        v18[1] = v18;
        v18[2] = 0x3032000000;
        v18[3] = __Block_byref_object_copy_;
        v18[4] = __Block_byref_object_dispose_;
        v19 = 0;
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5EF0]), "initWithData:contentType:size:scale:representationTypes:", v7, CFSTR("com.apple.private.usernotifications.genmoji.attachment"), 4, 1025.0, 1025.0, 1.0);
        objc_msgSend(v8, "setContentTypeUTI:", CFSTR("com.apple.private.usernotifications.genmoji.attachment"));
        objc_msgSend(MEMORY[0x24BDE5EF8], "sharedGenerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __63__UNSAttachmentsService__thumbnailRepresentationsForGlyphData___block_invoke;
        v14[3] = &unk_24D639BF8;
        v16 = &v20;
        v17 = v18;
        v10 = v8;
        v15 = v10;
        objc_msgSend(v9, "synchronousGenerateThumbnailForRequest:updateHandler:statusHandler:completionHandler:", v10, 0, 0, v14);

        if (v21[5])
          objc_msgSend(v13, "addObject:");

        _Block_object_dispose(v18, 8);
        _Block_object_dispose(&v20, 8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v4);
  }

  return v13;
}

void __63__UNSAttachmentsService__thumbnailRepresentationsForGlyphData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = *MEMORY[0x24BDF8980];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
      __63__UNSAttachmentsService__thumbnailRepresentationsForGlyphData___block_invoke_cold_1(a1, a1 + 48, v8);
  }

}

- (id)_queue_resolvedURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8
{
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v32;
  uint64_t v34;
  uint64_t v35;

  v13 = a3;
  queue = self->_queue;
  v32 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v13, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByStandardizingPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "URLByResolvingSymlinksInPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x24BDF8830]);
  objc_msgSend(v13, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "type");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "options");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v21, "initWithIdentifier:URL:type:options:", v22, v20, v23, v24);

  if (-[UNCAttachmentsRepository isRepositoryURL:](self->_attachmentsRepository, "isRepositoryURL:", v20))
  {
    v35 = 0;
    v26 = (id *)&v35;
    v27 = v32;
    -[UNSAttachmentsService _queue_validatedRepositoryURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:](self, "_queue_validatedRepositoryURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:", v25, v17, v16, v15, v32, &v35);
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
    v26 = (id *)&v34;
    v27 = v32;
    -[UNSAttachmentsService _queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:](self, "_queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:", v25, v17, v16, v15, v32, &v34);
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v28;

  v30 = *v26;
  if (!v29 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
    -[UNSAttachmentsService _queue_resolvedURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:].cold.1();
  if (a8 && v30)
    *a8 = objc_retainAutorelease(v30);

  return v29;
}

- (id)_queue_validatedRepositoryURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v11, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UNCAttachmentsRepository isValidRepositoryURL:forBundleIdentifier:](self->_attachmentsRepository, "isValidRepositoryURL:forBundleIdentifier:", v13, v12))
  {
    v14 = (void *)MEMORY[0x24BDF8238];
    objc_msgSend(v11, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "typeWithIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "preferredFilenameExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);
    v20 = *MEMORY[0x24BDF8980];
    if (v19)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138543618;
        v26 = v11;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_216DCB000, v20, OS_LOG_TYPE_DEFAULT, "Attachment is in repository for bundle: attachment=%{public}@, bundleIdentifier=%@", (uint8_t *)&v25, 0x16u);
      }
      v21 = v13;
      v22 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
      {
        v25 = 138544130;
        v26 = v11;
        v27 = 2112;
        v28 = v12;
        v29 = 2114;
        v30 = v17;
        v31 = 2114;
        v32 = v18;
        _os_log_error_impl(&dword_216DCB000, v20, OS_LOG_TYPE_ERROR, "Attachment has a type that doesn't match existing file in the repository: attachment=%{public}@, bundleIdentifier=%@, expectedExtension=%{public}@, actualExtension=%{public}@", (uint8_t *)&v25, 0x2Au);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 101, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
    }

    if (a8)
    {
LABEL_14:
      if (v22)
        *a8 = objc_retainAutorelease(v22);
    }
  }
  else
  {
    v23 = *MEMORY[0x24BDF8980];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
      -[UNSAttachmentsService _queue_validatedRepositoryURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:].cold.1((uint64_t)v11, (uint64_t)v12, v23);
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 100, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    if (a8)
      goto LABEL_14;
  }

  return v21;
}

- (id)_queue_resolvedFileURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  UNCAttachmentsRepository *attachmentsRepository;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  int v49;
  id v50;
  NSObject *v51;
  id v52;
  id v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  _BYTE v73[18];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v65 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v14, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v18, &v69);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v69;
  v21 = v20;
  v64 = v16;
  if (v19 && !v20)
  {
    v68 = 0;
    v22 = objc_msgSend(MEMORY[0x24BDF8830], "stagingActionForFileHandle:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:servicingBundleIdentifier:error:", v19, v16, v17, v15, &v68);
    v63 = v68;
    if (!v22)
    {
      v42 = *MEMORY[0x24BDF8980];
      v40 = v63;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v71 = v18;
        v72 = 2112;
        *(_QWORD *)v73 = v15;
        *(_WORD *)&v73[8] = 2114;
        *(_QWORD *)&v73[10] = v63;
        _os_log_error_impl(&dword_216DCB000, v42, OS_LOG_TYPE_ERROR, "Attachment file is not related to bundle: fileURL=%{public}@, bundleIdentifier=%@, stagingError=%{public}@", buf, 0x20u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 100, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
LABEL_33:
      objc_msgSend(v19, "closeFile");
      if (!a8)
        goto LABEL_36;
      goto LABEL_34;
    }
    v61 = v15;
    v57 = a8;
    v23 = (void *)MEMORY[0x24BDF8238];
    objc_msgSend(v14, "type");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "typeWithIdentifier:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = v25;
    objc_msgSend(v25, "preferredFilenameExtension");
    v26 = objc_claimAutoreleasedReturnValue();
    -[UNSAttachmentsService _temporaryAttachmentFileURL](self, "_temporaryAttachmentFileURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)v26;
    objc_msgSend(v27, "URLByAppendingPathExtension:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = *MEMORY[0x24BDF8980];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v71 = v18;
      v72 = 2114;
      *(_QWORD *)v73 = v28;
      _os_log_impl(&dword_216DCB000, v29, OS_LOG_TYPE_DEFAULT, "Will stage attachment file via secure copy: fileURL=%{public}@, temporaryFileURL=%{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0;
    v31 = objc_msgSend(v30, "unc_securelyCopyFile:fromURL:toURL:error:", v19, v18, v28, &v67);
    v60 = v67;

    v62 = v28;
    if (!v31)
    {
      v43 = *MEMORY[0x24BDF8980];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v71 = v18;
        v72 = 2114;
        *(_QWORD *)v73 = v28;
        *(_WORD *)&v73[8] = 2114;
        *(_QWORD *)&v73[10] = v60;
        _os_log_error_impl(&dword_216DCB000, v43, OS_LOG_TYPE_ERROR, "Unable to stage attachment file: fileURL=%{public}@, temporaryFileURL=%{public}@ error=%{public}@", buf, 0x20u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 104, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v40 = v63;
      a8 = v57;
      goto LABEL_32;
    }
    v54 = v17;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "attributesOfItemAtPath:error:", v33, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v34;
    objc_msgSend(v34, "objectForKey:", *MEMORY[0x24BDD0D08]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "family");
    v36 = UNNotificationAttachmentFamilyMaximumSize();
    v55 = v35;
    if (objc_msgSend(v35, "unsignedLongValue") <= v36)
    {
      attachmentsRepository = self->_attachmentsRepository;
      objc_msgSend(v65, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCAttachmentsRepository moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:](attachmentsRepository, "moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:", v28, v45, v15);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = *MEMORY[0x24BDF8980];
      v47 = *MEMORY[0x24BDF8980];
      if (v41)
      {
        v40 = v63;
        a8 = v57;
        v17 = v54;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v71 = v14;
          v72 = 2114;
          *(_QWORD *)v73 = v41;
          _os_log_impl(&dword_216DCB000, v46, OS_LOG_TYPE_DEFAULT, "Copied attachment file into repository: attachment=%{public}@, repositoryURL=%{public}@", buf, 0x16u);
        }
        v39 = 0;
        goto LABEL_31;
      }
      v17 = v54;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[UNSAttachmentsService _queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:].cold.2();
      v37 = 104;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
        -[UNSAttachmentsService _queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:].cold.1();
      v37 = 102;
      v17 = v54;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", v37, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v49 = objc_msgSend(v48, "removeItemAtURL:error:", v28, &v66);
    v50 = v66;

    v51 = *MEMORY[0x24BDF8980];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v71 = v14;
      v72 = 1024;
      *(_DWORD *)v73 = v49;
      *(_WORD *)&v73[4] = 2114;
      *(_QWORD *)&v73[6] = v50;
      _os_log_impl(&dword_216DCB000, v51, OS_LOG_TYPE_DEFAULT, "Performed delete for invalid attachment: attachment=%{public}@, success=%{BOOL}d, error=%{public}@", buf, 0x1Cu);
    }

    v41 = 0;
    v40 = v63;
    a8 = v57;
    v15 = v61;
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  v38 = *MEMORY[0x24BDF8980];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v71 = v18;
    v72 = 2112;
    *(_QWORD *)v73 = v15;
    *(_WORD *)&v73[8] = 2114;
    *(_QWORD *)&v73[10] = v21;
    _os_log_error_impl(&dword_216DCB000, v38, OS_LOG_TYPE_ERROR, "Error opening file for attachment URL: fileURL=%{public}@, bundleIdentifier=%@, fileHandleCreationError=%{public}@", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 100, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = 0;
  if (a8)
  {
LABEL_34:
    if (v39)
      *a8 = objc_retainAutorelease(v39);
  }
LABEL_36:
  v52 = v41;

  return v52;
}

- (id)_temporaryAttachmentFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_stagingDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_queue_deleteAttachmentDataForNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[UNSAttachmentsService _queue_deleteAttachmentDataForNotificationRecord:bundleIdentifier:](self, "_queue_deleteAttachmentDataForNotificationRecord:bundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_queue_deleteAttachmentDataForNotificationRecord:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UNCAttachmentsRepository *attachmentsRepository;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "attachments", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        attachmentsRepository = self->_attachmentsRepository;
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNCAttachmentsRepository removeReferenceToRepositoryURL:forNotificationIdentifier:bundleIdentifier:](attachmentsRepository, "removeReferenceToRepositoryURL:forNotificationIdentifier:bundleIdentifier:", v15, v8, v7);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__UNSAttachmentsService_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_24D639C20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __57__UNSAttachmentsService_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[UNSAttachmentsService _queue_applicationDidUninstall:](self, "_queue_applicationDidUninstall:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_queue_applicationDidUninstall:(id)a3
{
  NSObject *queue;
  id v5;
  UNCAttachmentsRepository *attachmentsRepository;
  id v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  attachmentsRepository = self->_attachmentsRepository;
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UNCAttachmentsRepository deleteAllFilesForBundleIdentifier:](attachmentsRepository, "deleteAllFilesForBundleIdentifier:", v7);
}

- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
  -[UNSAttachmentsService _repositoryDidPerformUpdates:forBundleIdentifier:](self, "_repositoryDidPerformUpdates:forBundleIdentifier:", a4, a5);
}

- (void)pendingNotificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
  -[UNSAttachmentsService _repositoryDidPerformUpdates:forBundleIdentifier:](self, "_repositoryDidPerformUpdates:forBundleIdentifier:", a4, a5);
}

- (void)_beginObservingNotificationChanges
{
  uint64_t v3;

  v3 = *MEMORY[0x24BEBF4F0];
  -[UNCNotificationRepository addObserver:forBundleIdentifier:](self->_notificationRepository, "addObserver:forBundleIdentifier:", self, *MEMORY[0x24BEBF4F0]);
  -[UNCPendingNotificationRepository addObserver:forBundleIdentifier:](self->_pendingNotificationRepository, "addObserver:forBundleIdentifier:", self, v3);
}

- (void)_repositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  UNSAttachmentsService *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__UNSAttachmentsService__repositoryDidPerformUpdates_forBundleIdentifier___block_invoke;
  v11[3] = &unk_24D639C48;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[UNSAttachmentsService _notificationIdentifiersForBundleIdentifier:replyOnQueue:completionHandler:](self, "_notificationIdentifiersForBundleIdentifier:replyOnQueue:completionHandler:", v9, queue, v11);

}

void __74__UNSAttachmentsService__repositoryDidPerformUpdates_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  id v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v3)
  {
    v4 = v3;
    v23 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        objc_opt_class();
        UNSafeCast();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        UNSafeCast();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v7)
        {
          objc_msgSend((id)objc_opt_class(), "_attachmentURLsRemovedByReplaceUpdate:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "notificationRecord");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v13 = v10;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeReferenceToRepositoryURL:forNotificationIdentifier:bundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17++), v12, *(_QWORD *)(a1 + 48));
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v15);
          }

LABEL_15:
          goto LABEL_16;
        }
        if (v8)
        {
          objc_msgSend(v6, "notificationRecord");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v21, "containsObject:", v18);

          if ((v19 & 1) == 0)
            objc_msgSend(*(id *)(a1 + 40), "_queue_deleteAttachmentDataForNotificationRecord:bundleIdentifier:", v13, *(_QWORD *)(a1 + 48));
          goto LABEL_15;
        }
LABEL_16:

        ++v5;
      }
      while (v5 != v4);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v4 = v20;
    }
    while (v20);
  }

}

- (void)_notificationIdentifiersForBundleIdentifier:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  UNCNotificationRepository *notificationRepository;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a5;
  notificationRepository = self->_notificationRepository;
  v10 = a4;
  v11 = a3;
  -[UNCNotificationRepository notificationRecordsForBundleIdentifier:](notificationRepository, "notificationRecordsForBundleIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_notificationIdentifiersForNotificationRecords:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSchedulingService undeliveredNotificationRecordsForBundleIdentifier:](self->_notificationSchedulingService, "undeliveredNotificationRecordsForBundleIdentifier:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_notificationIdentifiersForNotificationRecords:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __100__UNSAttachmentsService__notificationIdentifiersForBundleIdentifier_replyOnQueue_completionHandler___block_invoke;
  v19[3] = &unk_24D639C70;
  v20 = v16;
  v21 = v8;
  v17 = v16;
  v18 = v8;
  dispatch_async(v10, v19);

}

uint64_t __100__UNSAttachmentsService__notificationIdentifiersForBundleIdentifier_replyOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

+ (id)_stagingDirectory
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_notificationIdentifiersForNotificationRecords:(id)a3
{
  return (id)objc_msgSend(a3, "bs_mapNoNulls:", &__block_literal_global_36);
}

+ (id)_attachmentURLsRemovedByReplaceUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  objc_msgSend(v3, "notificationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replacedNotificationRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__UNSAttachmentsService__attachmentURLsRemovedByReplaceUpdate___block_invoke_2;
  v14[3] = &unk_24D639D18;
  v15 = v6;
  v9 = v6;
  objc_msgSend(v8, "bs_mapNoNulls:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __63__UNSAttachmentsService__attachmentURLsRemovedByReplaceUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "URL");
}

id __63__UNSAttachmentsService__attachmentURLsRemovedByReplaceUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingNotificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationSchedulingService, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_attachmentsRepository, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_resolveAttachmentsForRequest:(uint64_t)a1 bundleIdentifier:(NSObject *)a2 fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:continueOnFailure:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_216DCB000, a2, OS_LOG_TYPE_ERROR, "Hit error staging attachment, will roll back: error=%{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __63__UNSAttachmentsService__thumbnailRepresentationsForGlyphData___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  OUTLINED_FUNCTION_0(&dword_216DCB000, a2, a3, "Could not generate thumbnail for request=%{public}@ with error=%{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_resolvedURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "Unable to resolve URL: attachment=%{public}@, error=%{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_validatedRepositoryURLForNotificationAttachment:(NSObject *)a3 request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_216DCB000, a2, a3, "Attachment claims to be in the repository for bundle but is not: attachment=%{public}@, bundleIdentifier=%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "Attachment's file exceeds maximum size: attachment=%{public}@, size=%{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "Serious error moving attachment file into repository: attachment=%{public}@, temporaryFileURL=%{public}@");
  OUTLINED_FUNCTION_2();
}

@end
