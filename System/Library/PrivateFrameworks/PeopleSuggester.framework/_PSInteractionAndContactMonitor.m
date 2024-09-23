@implementation _PSInteractionAndContactMonitor

- (_PSInteractionAndContactMonitor)initWithInteractionStore:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  _PSInteractionAndContactMonitor *v9;
  _PSInteractionAndContactMonitor *v10;
  uint64_t v11;
  NSMutableOrderedSet *contactStoreEnumerationCache;
  uint64_t v13;
  NSData *changeHistoryToken;
  uint64_t v15;
  OS_dispatch_queue *notificationQueue;
  uint64_t v17;
  dispatch_block_t v18;
  void *v19;
  id *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _PSInteractionAndContactMonitor *result;
  _QWORD v26[4];
  id v27;
  _QWORD block[4];
  id v29;
  id location;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v7 = a3;
  v8 = a4;
  v9 = -[_PSInteractionAndContactMonitor init](self, "init");
  v10 = v9;
  if (!v9)
    goto LABEL_6;
  v9->_lock._os_unfair_lock_opaque = 0;
  objc_storeStrong((id *)&v9->_interactionStore, a3);
  objc_storeStrong((id *)&v10->_contactStore, a4);
  v11 = objc_opt_new();
  contactStoreEnumerationCache = v10->_contactStoreEnumerationCache;
  v10->_contactStoreEnumerationCache = (NSMutableOrderedSet *)v11;

  -[CNContactStore currentHistoryToken](v10->_contactStore, "currentHistoryToken");
  v13 = objc_claimAutoreleasedReturnValue();
  changeHistoryToken = v10->_changeHistoryToken;
  v10->_changeHistoryToken = (NSData *)v13;

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "ps_interaction_contact_monitor_notification");
  v15 = objc_claimAutoreleasedReturnValue();
  notificationQueue = v10->_notificationQueue;
  v10->_notificationQueue = (OS_dispatch_queue *)v15;

  objc_initWeak(&location, v10);
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke;
  block[3] = &unk_1E4400328;
  objc_copyWeak(&v29, &location);
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v20 = (id *)getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  v34 = getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  if (!getCNContactStoreDidChangeNotificationSymbolLoc_ptr)
  {
    v21 = (void *)ContactsLibrary_1();
    v20 = (id *)dlsym(v21, "CNContactStoreDidChangeNotification");
    v32[3] = (uint64_t)v20;
    getCNContactStoreDidChangeNotificationSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v31, 8);
  if (v20)
  {
    v22 = *v20;
    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke_2;
    v26[3] = &unk_1E4400350;
    v23 = v18;
    v27 = v23;
    v24 = (id)objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", v22, 0, 0, v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
LABEL_6:

    return v10;
  }
  dlerror();
  result = (_PSInteractionAndContactMonitor *)abort_report_np();
  __break(1u);
  return result;
}

- (void)dealloc
{
  __CFSet *contactIdsInContactStore;
  objc_super v4;

  contactIdsInContactStore = self->_contactIdsInContactStore;
  if (contactIdsInContactStore)
    CFRelease(contactIdsInContactStore);
  v4.receiver = self;
  v4.super_class = (Class)_PSInteractionAndContactMonitor;
  -[_PSInteractionAndContactMonitor dealloc](&v4, sel_dealloc);
}

- (void)populateContactIdCachesWithMessageCache:(id)a3 shareCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _PSInteractionAndContactMonitor *v30;
  id v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSInteractionAndContactMonitor interactionStore](self, "interactionStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSInteractionAndContactMonitor contactIdsSeen](self, "contactIdsSeen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v28 = v9;
    v29 = v8;
    v30 = self;
    v11 = (void *)objc_opt_new();
    v32 = v6;
    objc_msgSend(v6, "interactions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v7;
    objc_msgSend(v7, "interactions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v12;
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "recipients");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v35 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                objc_msgSend(v22, "personId");
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  objc_msgSend(v22, "personId");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "addObject:", v24);

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v19);
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v14);
    }
    self = v30;
    os_unfair_lock_lock(&v30->_lock);
    v25 = (void *)objc_msgSend(v11, "copy");
    -[_PSInteractionAndContactMonitor setContactIdsSeen:](v30, "setContactIdsSeen:", v25);

    os_unfair_lock_unlock(&v30->_lock);
    v9 = v28;
    v8 = v29;
    objc_msgSend(v29, "addObserver:selector:name:object:", v30, sel_notifyWhenContactAddedToInteractionStore_, *MEMORY[0x1E0D15B28], v28);

    v7 = v31;
    v6 = v32;
  }
  if (!self->_contactIdsInContactStore)
  {
    self->_contactIdsInContactStore = CFSetCreateMutable(0, 0, 0);
    -[_PSInteractionAndContactMonitor fetchAllContactIdsFromContactStore](self, "fetchAllContactIdsFromContactStore");
  }

}

- (void)fetchAllContactIdsFromContactStore
{
  os_unfair_lock_s *p_lock;
  __CFSet *contactIdsInContactStore;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  CFIndex Count;
  _QWORD v12[5];
  uint8_t buf[4];
  CFIndex v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactIdsInContactStore = self->_contactIdsInContactStore;
  if (contactIdsInContactStore)
    CFRelease(contactIdsInContactStore);
  self->_contactIdsInContactStore = CFSetCreateMutable(0, 0, 0);
  -[NSMutableOrderedSet removeAllObjects](self->_contactStoreEnumerationCache, "removeAllObjects");
  v5 = objc_alloc((Class)getCNContactFetchRequestClass());
  getCNContactIdentifierKey_1();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKeysToFetch:", v7);

  objc_msgSend(v8, "setContactBatchCount:", 100);
  -[_PSInteractionAndContactMonitor contactStore](self, "contactStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69___PSInteractionAndContactMonitor_fetchAllContactIdsFromContactStore__block_invoke;
  v12[3] = &unk_1E4400378;
  v12[4] = self;
  objc_msgSend(v9, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, 0, v12);

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    Count = CFSetGetCount(self->_contactIdsInContactStore);
    *(_DWORD *)buf = 134217984;
    v14 = Count;
    _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "_PSInteractionAndContactMonitor: Fetched all %tu contact ids from contact store", buf, 0xCu);
  }

  os_unfair_lock_unlock(p_lock);
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.PeopleSuggester.ReQuery"), "UTF8String"));

}

- (void)fetchChangedContactIdsFromContactStore
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A07F4000, log, OS_LOG_TYPE_DEBUG, "_PSInteractionAndContactMonitor: Received a Drop Everything change history event. Purging contact IDs.", v1, 2u);
}

- (void)notifyWhenContactAddedToInteractionStore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D15B30]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSInteractionAndContactMonitor contactIdsSeen](self, "contactIdsSeen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v5;
  v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v26)
  {
    v29 = v7;
    v28 = 0;
    v24 = *(_QWORD *)v35;
    v25 = v8;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v8);
        v27 = v9;
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "recipients", v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v15, "identifier");
              v16 = objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                v17 = (void *)v16;
                -[_PSInteractionAndContactMonitor contactIdsSeen](self, "contactIdsSeen");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "containsObject:", v19);

                if ((v20 & 1) == 0)
                {
                  objc_msgSend(v15, "identifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "addObject:", v21);

                  v28 = 1;
                }
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v12);
        }

        v9 = v27 + 1;
        v8 = v25;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v26);

    os_unfair_lock_lock(&self->_lock);
    v7 = v29;
    v22 = (void *)objc_msgSend(v29, "copy");
    -[_PSInteractionAndContactMonitor setContactIdsSeen:](self, "setContactIdsSeen:", v22);

    os_unfair_lock_unlock(&self->_lock);
    if ((v28 & 1) != 0)
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.PeopleSuggester.ReQuery"), "UTF8String"));
  }
  else
  {

    os_unfair_lock_lock(&self->_lock);
    v23 = (void *)objc_msgSend(v7, "copy");
    -[_PSInteractionAndContactMonitor setContactIdsSeen:](self, "setContactIdsSeen:", v23);

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (NSSet)contactIdsSeen
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSSet copy](self->_contactIdsSeen, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (BOOL)contactIdIsInContactStore:(id)a3
{
  const void *v4;
  __CFSet *contactIdsInContactStore;
  BOOL v6;

  v4 = (const void *)objc_msgSend(a3, "_ps_pointerSizedHash");
  os_unfair_lock_lock(&self->_lock);
  contactIdsInContactStore = self->_contactIdsInContactStore;
  if (contactIdsInContactStore)
    v6 = CFSetContainsValue(contactIdsInContactStore, v4) != 0;
  else
    v6 = 0;
  os_unfair_lock_unlock(&self->_lock);
  return v6;
}

- (void)enumerateContactStoreWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _PSInteractionAndContactMonitor *v22;
  void (**v23)(id, uint64_t, unsigned __int8 *);
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unsigned __int8 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableOrderedSet set](self->_contactStoreEnumerationCache, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  os_unfair_lock_unlock(&self->_lock);
  v28 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1A1AFCA24]();
        v4[2](v4, v12, &v28);
        LODWORD(v12) = v28;
        objc_autoreleasePoolPop(v13);
        if ((_DWORD)v12)
        {
          v19 = v7;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[_PSInteractionAndContactMonitor contactStore](self, "contactStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc((Class)getCNContactFetchRequestClass());
  getCNContactIdentifierKey_1();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithKeysToFetch:", v17);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66___PSInteractionAndContactMonitor_enumerateContactStoreWithBlock___block_invoke;
  v20[3] = &unk_1E44003A0;
  v21 = v7;
  v22 = self;
  v23 = v4;
  objc_msgSend(v14, "enumerateContactsWithFetchRequest:error:usingBlock:", v18, 0, v20);

  v19 = v21;
LABEL_11:

}

- (void)visitDropEverythingEvent:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  +[_PSLogging generalChannel](_PSLogging, "generalChannel", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_INFO, "_PSInteractionAndContactMonitor: Received drop everything event, refetching contacts", v5, 2u);
  }

  -[_PSInteractionAndContactMonitor fetchAllContactIdsFromContactStore](self, "fetchAllContactIdsFromContactStore");
}

- (void)visitAddContactEvent:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableOrderedSet _ps_appendObject:truncatingToCount:](self->_historyChangesQueuedToAddToEnumerationCache, "_ps_appendObject:truncatingToCount:", v5, 32);
  CFSetAddValue(self->_historyChangesQueuedToAdd, (const void *)objc_msgSend(v5, "_ps_pointerSizedHash"));

}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;

  objc_msgSend(a3, "contactIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet removeObject:](self->_historyChangesQueuedToAddToEnumerationCache, "removeObject:", v4);
  CFSetAddValue(self->_historyChangesQueuedToDelete, (const void *)objc_msgSend(v4, "_ps_pointerSizedHash"));

}

- (void)setContactIdsSeen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_contactIdsSeen, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong(&self->_processContactChanges, 0);
  objc_storeStrong((id *)&self->_historyChangesQueuedToAddToEnumerationCache, 0);
  objc_storeStrong((id *)&self->_changeHistoryToken, 0);
  objc_storeStrong((id *)&self->_contactStoreEnumerationCache, 0);
}

@end
