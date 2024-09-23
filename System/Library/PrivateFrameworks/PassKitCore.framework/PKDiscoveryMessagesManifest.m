@implementation PKDiscoveryMessagesManifest

- (PKDiscoveryMessagesManifest)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryMessagesManifest *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PKDiscoveryEngagementMessage *v13;
  uint64_t v14;
  NSArray *engagementMessages;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  PKDiscoveryNotification *v23;
  uint64_t v24;
  NSArray *notifications;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKDiscoveryMessagesManifest;
  v5 = -[PKDiscoveryMessagesManifest init](&v36, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("engagementMessages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v33;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v8);
            v13 = -[PKDiscoveryEngagementMessage initWithDictionary:]([PKDiscoveryEngagementMessage alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12));
            if (v13)
              objc_msgSend(v7, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v10);
      }

      v14 = objc_msgSend(v7, "copy");
      engagementMessages = v5->_engagementMessages;
      v5->_engagementMessages = (NSArray *)v14;

    }
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("notifications"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v27 = v6;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v29;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v18);
            v23 = -[PKDiscoveryNotification initWithDictionary:]([PKDiscoveryNotification alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v22));
            if (v23)
              objc_msgSend(v17, "addObject:", v23);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v20);
      }

      v24 = objc_msgSend(v17, "copy");
      notifications = v5->_notifications;
      v5->_notifications = (NSArray *)v24;

      v6 = v27;
    }

  }
  return v5;
}

- (int64_t)version
{
  return self->_version;
}

- (NSArray)engagementMessages
{
  return self->_engagementMessages;
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_engagementMessages, 0);
}

@end
