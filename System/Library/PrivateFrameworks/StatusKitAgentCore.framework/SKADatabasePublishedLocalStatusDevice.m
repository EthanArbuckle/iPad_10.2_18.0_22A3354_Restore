@implementation SKADatabasePublishedLocalStatusDevice

- (SKADatabasePublishedLocalStatusDevice)initWithCoreDataPulishedLocalStatusDevice:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKADatabasePublishedLocalStatus *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SKADatabasePublishedLocalStatus *v18;
  void *v19;
  SKADatabasePublishedLocalStatusDevice *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "pendingStatuses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = -[SKADatabasePublishedLocalStatus initWithCoreDataPublishedLocalStatus:]([SKADatabasePublishedLocalStatus alloc], "initWithCoreDataPublishedLocalStatus:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11));
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "deliveredStatuses", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = -[SKADatabasePublishedLocalStatus initWithCoreDataPublishedLocalStatus:]([SKADatabasePublishedLocalStatus alloc], "initWithCoreDataPublishedLocalStatus:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17));
        objc_msgSend(v6, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v15);
  }

  objc_msgSend(v4, "idsIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SKADatabasePublishedLocalStatusDevice initWithIDSIdentifier:pendingStatuses:deliveredStatuses:](self, "initWithIDSIdentifier:pendingStatuses:deliveredStatuses:", v19, v5, v6);

  return v20;
}

- (SKADatabasePublishedLocalStatusDevice)initWithIDSIdentifier:(id)a3 pendingStatuses:(id)a4 deliveredStatuses:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKADatabasePublishedLocalStatusDevice *v12;
  SKADatabasePublishedLocalStatusDevice *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SKADatabasePublishedLocalStatusDevice;
  v12 = -[SKADatabasePublishedLocalStatusDevice init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_idsIdentifier, a3);
    objc_storeStrong((id *)&v13->_pendingStatuses, a4);
    objc_storeStrong((id *)&v13->_deliveredStatuses, a5);
  }

  return v13;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifier, a3);
}

- (NSArray)pendingStatuses
{
  return self->_pendingStatuses;
}

- (void)setPendingStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_pendingStatuses, a3);
}

- (NSArray)deliveredStatuses
{
  return self->_deliveredStatuses;
}

- (void)setDeliveredStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_deliveredStatuses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveredStatuses, 0);
  objc_storeStrong((id *)&self->_pendingStatuses, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end
