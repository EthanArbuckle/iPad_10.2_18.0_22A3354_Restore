@implementation PLAssetJournalEntryPayload

- (PLAssetJournalEntryPayload)initWithAdditionalAssetAttributes:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PLAssetJournalEntryPayload *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "payloadID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("additionalAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subRelationshipProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)PLAssetJournalEntryPayload;
    v13 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v15, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v8, v9, v6, v7, v12);

  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (PLAssetJournalEntryPayload)initWithAssetDescription:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLAssetJournalEntryPayload *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "payloadID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("additionalAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subRelationshipProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("assetDescription"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subRelationshipProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    v15 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v17, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v8, v9, v6, v7, v14);

  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithUnmanagedAdjustment:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLAssetJournalEntryPayload *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "payloadID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("additionalAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subRelationshipProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("unmanagedAdjustment"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subRelationshipProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    v15 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v17, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v8, v9, v6, v7, v14);

  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithInternalResource:(id)a3 filesystemBookmark:(id)a4 changedKeys:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PLAssetJournalEntryPayload *v25;
  void *v26;
  PLManagedObjectJournalEntryPayload *v28;
  PLManagedObjectJournalEntryPayload *v29;
  void *v30;
  id v31;
  objc_super v32;
  _QWORD v33[6];

  v33[5] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v8 = a4;
  v9 = a5;
  v30 = v8;
  if (v8)
  {
    v28 = [PLManagedObjectJournalEntryPayload alloc];
    objc_msgSend(v8, "payloadID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("modernResources"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subRelationshipProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("fileSystemBookmark"));
    v15 = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subRelationshipProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](v28, "initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:", v10, v11, v8, v15, v17);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v31, "payloadID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
  v33[0] = CFSTR("resourceType");
  v33[1] = CFSTR("version");
  v33[2] = CFSTR("recipeID");
  v33[3] = CFSTR("compactUTI");
  v33[4] = CFSTR("dataStoreSubtype");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("modernResources"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subRelationshipProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)PLAssetJournalEntryPayload;
  v25 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v32, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v18, v19, v31, v21, v24);

  if (v25)
  {
    if (v29)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](v25->super._payloadAttributes, "addEntriesFromDictionary:", v29->_payloadAttributes);
      -[NSMutableSet unionSet:](v25->super._nilAttributes, "unionSet:", v29->_nilAttributes);
    }
    v26 = (void *)-[NSMutableDictionary mutableCopy](v25->super._payloadAttributes, "mutableCopy");
    -[NSMutableDictionary removeAllObjects](v25->super._payloadAttributes, "removeAllObjects");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25->super._payloadAttributes, "setObject:forKeyedSubscript:", v26, CFSTR("resource"));

  }
  return v25;
}

- (PLAssetJournalEntryPayload)initWithCloudMaster:(id)a3 payloadID:(id)a4 changedKeys:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  PLAssetJournalEntryPayload *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("master"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subRelationshipProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    v15 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v17, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v9, v11, v8, v10, v14);

  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithCloudMasterMediaMetadata:(id)a3 payloadID:(id)a4 changedKeys:(id)a5 modelProperties:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  PLAssetJournalEntryPayload *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    v14 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    v15 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v17, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v11, v14, v10, v12, v13);
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithExtendedAttributes:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PLAssetJournalEntryPayload *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "payloadID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extendedAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subRelationshipProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)PLAssetJournalEntryPayload;
    v13 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v15, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v8, v9, v6, v7, v12);

  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (PLAssetJournalEntryPayload)initWithEditedIPTCAttributes:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLAssetJournalEntryPayload *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "payloadID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("additionalAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subRelationshipProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("editedIPTCAttributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subRelationshipProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    v15 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v17, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v8, v9, v6, v7, v14);

  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (void)mergePayload:(id)a3
{
  id *v4;
  id v5;
  void *v6;
  PLAssetJournalEntryPayloadResource *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4[1];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v16 = v5;
    v7 = -[PLAssetJournalEntryPayloadResource initWithPayloadAttributes:payload:]([PLAssetJournalEntryPayloadResource alloc], "initWithPayloadAttributes:payload:", v6, self);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PLAssetJournalEntryPayload resources](self, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "isEqualToPayloadResource:", v7))
            objc_msgSend(v14, "mergePayloadResource:nilAttributes:", v7, v4[2]);
          objc_msgSend(v14, "payloadAttributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v8, CFSTR("resources"));
    v5 = v16;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload mergePayload:](&v17, sel_mergePayload_, v4);
  }

}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  unsigned int v29;
  BOOL v30;
  unsigned int v31;
  void *v32;
  uint64_t v33;
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "parentProperty");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToKey:", CFSTR("resources"));

  if (!v15)
  {
    if (objc_msgSend(v13, "isEqualToKey:", CFSTR("inTrash")))
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      v21 = objc_msgSend(v12, "isInTrash");
LABEL_15:
      objc_msgSend(v20, "numberWithBool:", v21);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "key");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v18);
      goto LABEL_16;
    }
    if (objc_msgSend(v13, "isEqualToKey:", CFSTR("keywords")))
    {
      objc_msgSend(v12, "keywords");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "relatedEntityPropertyNames");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "anyObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "valueForKey:", v26);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringSet:](self, "encodedDataForUUIDStringSet:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:](self, "updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:", v10, v11, v13, v18);
      goto LABEL_16;
    }
    if (objc_msgSend(v13, "isEqualToKey:", CFSTR("bundleScope")))
    {
      v16 = v12;
      if (objc_msgSend(v16, "bundleScope"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v16, "bundleScope"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
    }
    else
    {
      if (objc_msgSend(v13, "isEqualToKey:", CFSTR("avalancheUUID")))
      {
        v16 = v12;
        v29 = objc_msgSend(v16, "avalancheKind");
        v30 = v29 == 2;
        if (v29 < 2)
        {
          objc_msgSend(v16, "avalancheUUID");
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
      }
      else
      {
        if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("avalanchePickType")))
        {
          if (objc_msgSend(v13, "isEqualToKey:", CFSTR("libraryScopeAssetContributorsToUpdate")))
          {
            v32 = (void *)MEMORY[0x1E0CB3B20];
            v33 = *MEMORY[0x1E0CB3188];
            v34 = v12;
            objc_msgSend(v32, "valueTransformerForName:", v33);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "libraryScopeAssetContributorsToUpdate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "reverseTransformedValue:", v18);
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          goto LABEL_33;
        }
        v16 = v12;
        v31 = objc_msgSend(v16, "avalancheKind");
        v30 = v31 == 2;
        if (v31 < 2)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "avalanchePickType"));
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
      }
      if (!v30)
        goto LABEL_17;
    }
    objc_msgSend(v13, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v18);
    goto LABEL_16;
  }
  if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("uti")))
  {
    if (objc_msgSend(v13, "isEqualToKey:", CFSTR("volume")))
    {
      objc_msgSend(v12, "fileSystemVolume");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v18);
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v19 = (void *)v22;
      objc_msgSend(v13, "key");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v23);

      goto LABEL_10;
    }
    if (objc_msgSend(v13, "isEqualToKey:", CFSTR("inTrash")))
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      v21 = objc_msgSend(v12, "isTrashedOrExpunged");
      goto LABEL_15;
    }
LABEL_33:
    v27 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v12, "uniformTypeIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v18 = (void *)v17;
  objc_msgSend(v13, "key");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v19);
LABEL_10:

LABEL_16:
LABEL_17:

  v27 = 1;
LABEL_18:

  return v27;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *payloadAttributes;
  void *v15;
  objc_super v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "parentProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToKey:", CFSTR("resources"));

  if (!v9)
  {
    if (objc_msgSend(v7, "isEqualToKey:", CFSTR("keywords")))
    {
      objc_msgSend(v7, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v7, "isEqualToKey:", CFSTR("libraryScopeAssetContributorsToUpdate")))
    {
      objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0CB3188]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      payloadAttributes = self->super._payloadAttributes;
      objc_msgSend(v7, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](payloadAttributes, "objectForKeyedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transformedValue:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v17, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7, self, PLAssetJournalEntryPayload, v18.receiver, v18.super_class);
LABEL_12:
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!objc_msgSend(v7, "isEqualToKey:", CFSTR("volume")))
  {
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v18, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7, v17.receiver, v17.super_class, self, PLAssetJournalEntryPayload);
    goto LABEL_12;
  }
  objc_msgSend(v7, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v13 = (void *)v12;
LABEL_10:

LABEL_13:
  return v13;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  unsigned __int8 v19;
  double v20;
  double v21;
  double v22;
  objc_super v24;
  objc_super v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "parentProperty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToKey:", CFSTR("resources"));

  if (v12)
  {
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("uti")))
    {
      objc_msgSend(v9, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUniformTypeIdentifierIntegratedLookup identifierFromCompactRepresentation:](PLUniformTypeIdentifierIntegratedLookup, "identifierFromCompactRepresentation:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v14, "isEqualToString:", v8);

      goto LABEL_18;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("inTrash")))
    {
LABEL_8:
      v17 = objc_msgSend(v9, "integerValue");
      v15 = objc_msgSend(v8, "BOOLValue") ^ (v17 == 0);
      goto LABEL_18;
    }
    v19 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v26, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, v24.receiver, v24.super_class, v25.receiver, v25.super_class, self, PLAssetJournalEntryPayload);
LABEL_17:
    LOBYTE(v15) = v19;
    goto LABEL_18;
  }
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("inTrash")))
    goto LABEL_8;
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("keywords")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v16, "isEqualToSet:", v8);

    goto LABEL_18;
  }
  if (!objc_msgSend(v10, "isEqualToKey:", CFSTR("dateCreatedSource")))
  {
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("duration")))
    {
      objc_msgSend(v9, "doubleValue");
      v21 = round(v20 * 1000.0);
      objc_msgSend(v8, "doubleValue");
      LOBYTE(v15) = v21 - round(v22 * 1000.0) == 0.0;
      goto LABEL_18;
    }
    v19 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v24, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, self, PLAssetJournalEntryPayload, v25.receiver, v25.super_class, v26.receiver, v26.super_class);
    goto LABEL_17;
  }
  v18 = objc_msgSend(v9, "integerValue");
  LOBYTE(v15) = 1;
  if (v8 && v18)
  {
    v19 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v25, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, v24.receiver, v24.super_class, self, PLAssetJournalEntryPayload, v26.receiver, v26.super_class);
    goto LABEL_17;
  }
LABEL_18:

  return v15;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PLDescriptionBuilder *v14;
  PLAssetJournalEntryPayloadResource *v15;
  void *v16;
  PLDescriptionBuilder *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  PLDescriptionBuilder *v27;
  PLAssetJournalEntryPayloadResource *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id obj;
  uint64_t v39;
  PLAssetJournalEntryPayload *v40;
  objc_super v41;
  objc_super v42;
  objc_super v43;
  objc_super v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("resource")))
  {
    v11 = objc_msgSend(v10, "style");
    v12 = objc_msgSend(v10, "indent");
    if (v11 == 1)
      v13 = v12;
    else
      v13 = v12 + 1;
    v14 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", v9, objc_msgSend(v10, "style"), v13);
    v15 = -[PLAssetJournalEntryPayloadResource initWithPayloadAttributes:payload:]([PLAssetJournalEntryPayloadResource alloc], "initWithPayloadAttributes:payload:", v9, self);
    -[PLAssetJournalEntryPayloadResource appendToDescriptionBuilder:](v15, "appendToDescriptionBuilder:", v14);
    -[PLDescriptionBuilder build](v14, "build");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendName:object:", v8, v16);

    goto LABEL_6;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("resources")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("keywords")))
    {
      -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v9);
      v14 = (PLDescriptionBuilder *)objc_claimAutoreleasedReturnValue();
      v43.receiver = self;
      v43.super_class = (Class)PLAssetJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v43, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v14, v10);
      goto LABEL_7;
    }
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("libraryScopeAssetContributorsToUpdate")))
    {
      v41.receiver = self;
      v41.super_class = (Class)PLAssetJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v41, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v9, v10);
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0CB3188]);
    v14 = (PLDescriptionBuilder *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder transformedValue:](v14, "transformedValue:", v9);
    v15 = (PLAssetJournalEntryPayloadResource *)objc_claimAutoreleasedReturnValue();
    v42.receiver = self;
    v42.super_class = (Class)PLAssetJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v42, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v15, v10);
LABEL_6:

LABEL_7:
    goto LABEL_30;
  }
  if (objc_msgSend(v10, "style") == 1)
  {
    v44.receiver = self;
    v44.super_class = (Class)PLAssetJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v44, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v9, v10);
  }
  else
  {
    v37 = v8;
    v17 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", v9, objc_msgSend(v10, "style"), objc_msgSend(v10, "indent") + 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("version"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v18;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("subType"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v9;
    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v21;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v39 = *(_QWORD *)v46;
      v40 = self;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v46 != v39)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          v27 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", v26, objc_msgSend(v10, "style"), -[PLDescriptionBuilder indent](v17, "indent") + 1);
          v28 = -[PLAssetJournalEntryPayloadResource initWithPayloadAttributes:payload:]([PLAssetJournalEntryPayloadResource alloc], "initWithPayloadAttributes:payload:", v26, self);
          -[PLAssetJournalEntryPayloadResource appendToDescriptionBuilder:](v28, "appendToDescriptionBuilder:", v27);
          if (objc_msgSend(v10, "style") == 2)
          {
            v29 = (void *)MEMORY[0x1E0CB3940];
            -[PLDescriptionBuilder build](v27, "build");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("\n%@"), v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            -[PLDescriptionBuilder build](v27, "build");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v24 + i);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDescriptionBuilder appendName:object:](v17, "appendName:object:", v32, v31);

          self = v40;
        }
        v24 += i;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v10, "style") == 2)
    {
      v33 = (void *)MEMORY[0x1E0CB3940];
      -[PLDescriptionBuilder build](v17, "build");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("\n%@"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PLDescriptionBuilder build](v17, "build");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v36;
    v8 = v37;
    objc_msgSend(v10, "appendName:object:", v37, v35);

  }
LABEL_30:

}

- (id)insertAssetFromDataInManagedObjectContext:(id)a3 keywordUUIDRemapping:(id)a4 rawPayloadAttributesToUpdate:(id)a5
{
  NSDictionary *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *keywordUUIDRemapping;

  v8 = (NSDictionary *)a4;
  v9 = a5;
  +[PLManagedObject insertInManagedObjectContext:](PLManagedAsset, "insertInManagedObjectContext:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "payloadIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUuid:", v12);

  keywordUUIDRemapping = self->_keywordUUIDRemapping;
  self->_keywordUUIDRemapping = v8;

  -[PLManagedObjectJournalEntryPayload applyPayloadToManagedObject:payloadAttributesToUpdate:](self, "applyPayloadToManagedObject:payloadAttributesToUpdate:", v10, v9);
  return v10;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSMutableDictionary *payloadAttributes;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PLAssetJournalEntryPayload *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSMutableDictionary *v57;
  void *v58;
  __int16 v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  NSMutableDictionary *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  float v113;
  void *v114;
  uint64_t v115;
  PLAssetJournalEntryPayload *v116;
  _BOOL4 v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  unsigned __int16 v126;
  NSMutableDictionary *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  NSMutableDictionary *v133;
  void *v134;
  void *v135;
  NSMutableDictionary *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  NSMutableDictionary *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id obj;
  id v163;
  PLAssetJournalEntryPayload *v164;
  NSObject *v165;
  objc_super v166;
  objc_super v167;
  objc_super v168;
  objc_super v169;
  objc_super v170;
  objc_super v171;
  objc_super v172;
  objc_super v173;
  objc_super v174;
  _QWORD v175[5];
  _QWORD v176[4];
  id v177;
  id v178;
  PLAssetJournalEntryPayload *v179;
  _QWORD v180[4];
  void *v181;
  id v182;
  PLAssetJournalEntryPayload *v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  id v188;
  _QWORD v189[4];
  void *v190;
  id v191;
  PLAssetJournalEntryPayload *v192;
  uint8_t buf[4];
  uint64_t v194;
  __int16 v195;
  NSObject *v196;
  __int16 v197;
  void *v198;
  __int16 v199;
  void *v200;
  _BYTE v201[128];
  uint64_t v202;

  v202 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v164 = self;
  if (!objc_msgSend(v10, "requiresConversion"))
  {
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("savedAssetType")))
    {
      objc_msgSend(MEMORY[0x1E0D73310], "maskForIsValidForBackup");
      -[PLAssetJournalEntryPayload savedAssetType](self, "savedAssetType");
      if (PLValidatedSavedAssetTypeApplies())
      {
        v174.receiver = self;
        v174.super_class = (Class)PLAssetJournalEntryPayload;
        -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v174, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      }
      goto LABEL_39;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("locationData")))
    {
      -[PLAssetJournalEntryPayload locationData](self, "locationData");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[PLAssetJournalEntryPayload dateCreated](self, "dateCreated");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = +[PLManagedAsset newLocationFromLocationData:timestampIfMissing:](PLManagedAsset, "newLocationFromLocationData:timestampIfMissing:", v21, v22);

        objc_msgSend(v23, "coordinate");
        if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
        {
          v24 = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v23, "pl_locationHash"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "additionalAttributes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setLocationHash:", v25);

          objc_msgSend(v23, "horizontalAccuracy");
          if (v27 != 0.0)
          {
            objc_msgSend(v23, "horizontalAccuracy");
            v29 = v28;
            objc_msgSend(v24, "additionalAttributes");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setGpsHorizontalAccuracy:", v29);

          }
          self = v164;
        }

      }
      v173.receiver = self;
      v173.super_class = (Class)PLAssetJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v173, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      goto LABEL_31;
    }
    if ((objc_msgSend(v10, "isEqualToKey:", CFSTR("embeddedThumbnailWidth")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToKey:", CFSTR("embeddedThumbnailHeight")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToKey:", CFSTR("embeddedThumbnailOffset")) & 1) != 0
      || objc_msgSend(v10, "isEqualToKey:", CFSTR("embeddedThumbnailLength")))
    {
      payloadAttributes = self->super._payloadAttributes;
      objc_msgSend(v10, "key");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](payloadAttributes, "objectForKeyedSubscript:", v21);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forKey:", v32, v12);

      goto LABEL_31;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("originalHash")))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("originalHash"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v78 = v11;
        objc_msgSend(v78, "originalStableHash");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v79)
        {
          objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setOriginalStableHash:", v80);

        }
      }
      v172.receiver = self;
      v172.super_class = (Class)PLAssetJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v172, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      goto LABEL_31;
    }
    if (!objc_msgSend(v10, "isEqualToKey:", CFSTR("highFrameRateState")))
    {
      if (objc_msgSend(v10, "isEqualToKey:", CFSTR("dateCreatedSource")))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("dateCreatedSource"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v92)
        {
          -[PLAssetJournalEntryPayload _fixDateCreatedSourceWithAdditionalAssetAttributes:](self, "_fixDateCreatedSourceWithAdditionalAssetAttributes:", v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLAssetJournalEntryPayload dateCreatedSource](self, "dateCreatedSource"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v93, CFSTR("dateCreatedSource"));

        }
        v170.receiver = self;
        v170.super_class = (Class)PLAssetJournalEntryPayload;
        -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v170, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      }
      else if (objc_msgSend(v10, "isEqualToKey:", CFSTR("playbackStyle")))
      {
        if (!-[PLAssetJournalEntryPayload playbackStyle](self, "playbackStyle"))
        {
          if (-[PLAssetJournalEntryPayload kind](self, "kind") == 3)
          {
            -[PLAssetJournalEntryPayload originalUniformTypeIdentifier](self, "originalUniformTypeIdentifier");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = +[PLManagedAsset assetTypeFromUniformTypeIdentifier:](PLManagedAsset, "assetTypeFromUniformTypeIdentifier:", v114);

          }
          else
          {
            v115 = -[PLAssetJournalEntryPayload kind](self, "kind");
          }
          if ((_DWORD)v115 != 3)
          {
            -[PLAssetJournalEntryPayload setPlaybackStyle:](self, "setPlaybackStyle:", +[PLManagedAsset defaultPlaybackStyleFromAssetType:subtype:playbackVariation:](PLManagedAsset, "defaultPlaybackStyleFromAssetType:subtype:playbackVariation:", v115, -[PLAssetJournalEntryPayload kindSubtype](self, "kindSubtype"), -[PLAssetJournalEntryPayload playbackVariation](self, "playbackVariation")));
            if (-[PLAssetJournalEntryPayload playbackStyle](self, "playbackStyle"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[PLAssetJournalEntryPayload playbackStyle](self, "playbackStyle"));
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v150, CFSTR("playbackStyle"));

            }
          }
        }
        v169.receiver = self;
        v169.super_class = (Class)PLAssetJournalEntryPayload;
        -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v169, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      }
      else if (objc_msgSend(v10, "isEqualToKey:", CFSTR("kind")))
      {
        if (-[PLAssetJournalEntryPayload kind](self, "kind") == 3)
        {
          -[PLAssetJournalEntryPayload originalUniformTypeIdentifier](self, "originalUniformTypeIdentifier");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAssetJournalEntryPayload setKind:](self, "setKind:", +[PLManagedAsset assetTypeFromUniformTypeIdentifier:](PLManagedAsset, "assetTypeFromUniformTypeIdentifier:", v130));

          if (-[PLAssetJournalEntryPayload kind](self, "kind") != 3)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLAssetJournalEntryPayload kind](self, "kind"));
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v131, CFSTR("kind"));

          }
        }
        v168.receiver = self;
        v168.super_class = (Class)PLAssetJournalEntryPayload;
        -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v168, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      }
      else if (objc_msgSend(v10, "isEqualToKey:", CFSTR("sleetIsReversible")))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("sleetIsReversible"));
        v141 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v141)
        {
          -[PLAssetJournalEntryPayload _fixSleetIsReversibleWithAdditionalAssetAttributes:](self, "_fixSleetIsReversibleWithAdditionalAssetAttributes:", v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLAssetJournalEntryPayload sleetIsReversible](self, "sleetIsReversible"));
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v142, CFSTR("sleetIsReversible"));

        }
        v167.receiver = self;
        v167.super_class = (Class)PLAssetJournalEntryPayload;
        -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v167, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      }
      else
      {
        v166.receiver = self;
        v166.super_class = (Class)PLAssetJournalEntryPayload;
        -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v166, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      }
      goto LABEL_39;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("highFrameRateState"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      v171.receiver = self;
      v171.super_class = (Class)PLAssetJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v171, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
      goto LABEL_39;
    }
    v116 = self;
    v38 = v13;
    v117 = -[PLAssetJournalEntryPayload isVideo](v116, "isVideo");
    v39 = v11;
    if (!v117)
      goto LABEL_129;
    objc_opt_class();
    objc_msgSend(v39, "managedObjectContext");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v119 = v118;
    else
      v119 = 0;
    v120 = v119;

    objc_msgSend(v120, "pl_libraryBundle");
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v121, "timeZoneLookup");
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PLAssetJournalEntryPayload kindSubtype](v116, "kindSubtype") == 101)
    {
      v123 = (void *)MEMORY[0x1E0D75308];
      -[PLAssetJournalEntryPayload adjustmentFormatIdentifier](v116, "adjustmentFormatIdentifier");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAssetJournalEntryPayload adjustmentFormatVersion](v116, "adjustmentFormatVersion");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v123) = objc_msgSend(v123, "isRecognizedSlowMotionFormatWithIdentifier:version:", v124, v125);

      if ((v123 & 1) != 0)
      {
        v126 = 3;
LABEL_157:

        v152 = v39;
        if (v126)
        {
          v153 = v152;
          objc_msgSend(v152, "setHighFrameRateState:", v126);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v126);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v154, CFSTR("highFrameRateState"));

          if (-[PLAssetJournalEntryPayload kindSubtype](v164, "kindSubtype") != 101)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v164->super._payloadAttributes, "setObject:forKeyedSubscript:", &unk_1E375FED0, CFSTR("kindSubtype"));
            objc_msgSend(v153, "setKindSubtype:", 101);
            objc_msgSend(v38, "setObject:forKeyedSubscript:", &unk_1E375FED0, CFSTR("kindSubtype"));
          }
        }
        goto LABEL_129;
      }
      objc_msgSend(v39, "pathManager");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAssetJournalEntryPayload _loadOriginalVideoMetadataWithPathManager:timezoneLookup:](v164, "_loadOriginalVideoMetadataWithPathManager:timezoneLookup:", v151, v122);
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v144, "isSloMo"))
        v126 = 3;
      else
        v126 = 2;
    }
    else
    {
      if (!-[PLAssetJournalEntryPayload hasAdjustments](v116, "hasAdjustments"))
      {
        v126 = 0;
        goto LABEL_157;
      }
      objc_msgSend(v39, "pathManager");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAssetJournalEntryPayload _loadOriginalVideoMetadataWithPathManager:timezoneLookup:](v164, "_loadOriginalVideoMetadataWithPathManager:timezoneLookup:", v143, v122);
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      v126 = objc_msgSend(v144, "isSloMo");
    }

    goto LABEL_157;
  }
  if (!objc_msgSend(v10, "isEqualToKey:", CFSTR("inTrash")))
  {
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("assetDescription")))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("description"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v20;
      if (v20 && objc_msgSend(v20, "length"))
        objc_msgSend(v11, "setLongDescription:", v16);
      goto LABEL_38;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("assetMediaMetadataRelationship")))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("assetMediaMetadata"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v11, "setMediaMetadataData:", v16);
      goto LABEL_38;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("unmanagedAdjustment")))
    {
      if (!-[PLAssetJournalEntryPayload hasAdjustments](self, "hasAdjustments"))
        goto LABEL_39;
      objc_msgSend(v11, "managedObjectContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedObject insertInManagedObjectContext:](PLUnmanagedAdjustment, "insertInManagedObjectContext:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "subRelationshipProperties");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v189[0] = MEMORY[0x1E0C809B0];
      v189[1] = 3221225472;
      v189[2] = __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke;
      v189[3] = &unk_1E36708B0;
      v190 = v34;
      v191 = v13;
      v192 = self;
      v16 = v34;
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v189);

      objc_msgSend(v11, "setUnmanagedAdjustment:", v16);
      v36 = v190;
LABEL_77:

      goto LABEL_38;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("master")))
    {
      v37 = self;
      v38 = v13;
      -[NSMutableDictionary objectForKeyedSubscript:](v37->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("cloudMasterGUID"));
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v160 = v12;
        v40 = v11;
        objc_msgSend(v40, "managedObjectContext");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCloudMaster cloudMasterWithGUID:inMomentShare:prefetchResources:inManagedObjectContext:](PLCloudMaster, "cloudMasterWithGUID:inMomentShare:prefetchResources:inManagedObjectContext:", v39, 0, 0, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
          goto LABEL_128;
        objc_msgSend(v40, "managedObjectContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedObject insertInManagedObjectContext:](PLCloudMaster, "insertInManagedObjectContext:", v43);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "setCloudMasterGUID:", v39);
        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("importedBy"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setImportedBy:", (__int16)objc_msgSend(v44, "intValue"));

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("creatorBundleID"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setImportedByBundleIdentifier:", v45);

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("importedByDisplayName"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setImportedByDisplayName:", v46);

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("originalFilename"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setOriginalFilename:", v47);

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("originalOrientation"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setOriginalOrientation:", (__int16)objc_msgSend(v48, "intValue"));

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("originatingAssetIdentifier"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setOriginatingAssetIdentifier:", v49);

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("creationDate"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setCreationDate:", v50);

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("importDate"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setImportDate:", v51);

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("originalUTI"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setUniformTypeIdentifier:", v52);

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mediaMetadataType"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setMediaMetadataType:", v53);

        objc_msgSend(v42, "mediaMetadata");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setValue:forKey:", v55, CFSTR("data"));

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("fullSizeJPEGSource"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = v164->super._payloadAttributes;
        if (v56)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v57, "objectForKeyedSubscript:", CFSTR("fullSizeJPEGSource"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "intValue");
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v57, "objectForKeyedSubscript:", CFSTR("originalWidth"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = (double)objc_msgSend(v102, "integerValue");
          -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("originalHeight"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = (double)objc_msgSend(v104, "integerValue");

          objc_msgSend(v42, "uniformTypeIdentifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = +[PLCloudMaster fullSizeJPEGSourceForUTI:andImageDimensions:](PLCloudMaster, "fullSizeJPEGSourceForUTI:andImageDimensions:", v58, v103, v105);
        }
        objc_msgSend(v42, "setFullSizeJPEGSource:", v59);

        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("importSessionID"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setImportSessionID:", v106);

        if (!-[PLAssetJournalEntryPayload isVideo](v164, "isVideo"))
          goto LABEL_128;
        -[NSMutableDictionary objectForKeyedSubscript:](v164->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v107)
        {
          PLMigrationGetLog();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v40, "uuid");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v194 = (uint64_t)v129;
            _os_log_impl(&dword_199541000, v128, OS_LOG_TYPE_DEFAULT, "Rebuild: unable to find mediaMetadata in master for %{public}@", buf, 0xCu);

          }
          goto LABEL_127;
        }
        v188 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v107, 0, 0, &v188);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = v188;
        if (v108)
        {
          objc_msgSend(MEMORY[0x1E0C8AF90], "assetProxyWithPropertyList:", v108);
          v109 = objc_claimAutoreleasedReturnValue();
          -[NSObject plVideoCodecName](v109, "plVideoCodecName");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setCodecName:", v110);

          objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v109);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v111, "count"))
          {
            objc_msgSend(v111, "objectAtIndex:", 0);
            v158 = v11;
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "nominalFrameRate");
            objc_msgSend(v42, "setVideoFrameRate:", (int)v113);

            v11 = v158;
          }
        }
        else
        {
          PLMigrationGetLog();
          v109 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
LABEL_126:

            v128 = v165;
LABEL_127:

LABEL_128:
            objc_msgSend(v40, "setMaster:", v42);
            objc_msgSend(v40, "additionalAttributes");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "setOriginalStableHash:", v39);

            v12 = v160;
            goto LABEL_129;
          }
          objc_msgSend(v40, "uuid");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v194 = (uint64_t)v111;
          v195 = 2114;
          v196 = v165;
          _os_log_impl(&dword_199541000, v109, OS_LOG_TYPE_DEFAULT, "Rebuild: unable to serialize videoProperties for %{public}@: %{public}@", buf, 0x16u);
        }

        goto LABEL_126;
      }
LABEL_129:

      v13 = v38;
      goto LABEL_39;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("keywords")))
    {
      v159 = v13;
      v60 = v11;
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("keywords"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v62, "count"))
      {
        v161 = v12;
        v156 = v10;
        v157 = v11;
        v163 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v184 = 0u;
        v185 = 0u;
        v186 = 0u;
        v187 = 0u;
        v155 = v62;
        obj = v62;
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v185;
          do
          {
            for (i = 0; i != v64; ++i)
            {
              if (*(_QWORD *)v185 != v65)
                objc_enumerationMutation(obj);
              v67 = *(NSObject **)(*((_QWORD *)&v184 + 1) + 8 * i);
              -[NSDictionary objectForKeyedSubscript:](self->_keywordUUIDRemapping, "objectForKeyedSubscript:", v67);
              v68 = objc_claimAutoreleasedReturnValue();
              v69 = (void *)v68;
              if (v68)
                v70 = v68;
              else
                v70 = (uint64_t)v67;
              objc_msgSend(v60, "managedObjectContext");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLManagedKeyword keywordForUuid:context:](PLManagedKeyword, "keywordForUuid:context:", v70, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              if (v72)
              {
                if (v69)
                {
                  PLMigrationGetLog();
                  v73 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v72, "title");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v194 = (uint64_t)v74;
                    v195 = 2112;
                    v196 = v67;
                    v197 = 2112;
                    v198 = v69;
                    v199 = 2112;
                    v200 = v75;
                    _os_log_impl(&dword_199541000, v73, OS_LOG_TYPE_DEFAULT, "Rebuild: using re-mapped uuid for keyword %@, %@ -> %@, for asset: %@", buf, 0x2Au);

                    self = v164;
                  }

                }
                objc_msgSend(v163, "addObject:", v72);
              }
              else
              {
                PLMigrationGetLog();
                v76 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                {
                  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
                  v77 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v194 = v70;
                  v195 = 2112;
                  v196 = v77;
                  _os_log_impl(&dword_199541000, v76, OS_LOG_TYPE_ERROR, "Rebuild: could not find keyword for uuid: %@ for asset: %@", buf, 0x16u);

                  self = v164;
                }

              }
            }
            v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
          }
          while (v64);
        }

        objc_msgSend(v60, "setKeywords:", v163);
        v10 = v156;
        v11 = v157;
        v12 = v161;
        v62 = v155;
      }

LABEL_68:
      v13 = v159;
      goto LABEL_39;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("extendedAttributes")))
    {
      objc_msgSend(v11, "managedObjectContext");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedObject insertInManagedObjectContext:](PLExtendedAttributes, "insertInManagedObjectContext:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "subRelationshipProperties");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v180[0] = MEMORY[0x1E0C809B0];
      v180[1] = 3221225472;
      v180[2] = __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_1081;
      v180[3] = &unk_1E36708B0;
      v181 = v82;
      v182 = v13;
      v183 = self;
      v16 = v82;
      objc_msgSend(v83, "enumerateKeysAndObjectsUsingBlock:", v180);

      objc_msgSend(v11, "setExtendedAttributes:", v16);
      v36 = v181;
      goto LABEL_77;
    }
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("editedIPTCAttributes")))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("iptcData"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v85)
        goto LABEL_39;
      objc_msgSend(v11, "managedObjectContext");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedObject insertInManagedObjectContext:](PLEditedIPTCAttributes, "insertInManagedObjectContext:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "subRelationshipProperties");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v176[0] = MEMORY[0x1E0C809B0];
      v176[1] = 3221225472;
      v176[2] = __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_2;
      v176[3] = &unk_1E36708B0;
      v21 = v87;
      v177 = v21;
      v178 = v13;
      v179 = self;
      objc_msgSend(v88, "enumerateKeysAndObjectsUsingBlock:", v176);

      v89 = v11;
      objc_msgSend(v21, "data");
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      if (v90)
      {
        objc_msgSend(v21, "data");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setIPTCData:", v91);

      }
      objc_msgSend(v89, "setEditedIPTCAttributes:", v21);

    }
    else
    {
      if (objc_msgSend(v10, "isEqualToKey:", CFSTR("resources"))
        && -[PLAssetJournalEntryPayload hasAdjustments](self, "hasAdjustments"))
      {
        v159 = v13;
        v94 = -[PLAssetJournalEntryPayload bestCPLResourceTypeForAdjustedFingerPrint](self, "bestCPLResourceTypeForAdjustedFingerPrint");
        -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("resources"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v175[0] = MEMORY[0x1E0C809B0];
        v175[1] = 3221225472;
        v175[2] = __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_3;
        v175[3] = &__block_descriptor_40_e29_B32__0__NSDictionary_8Q16_B24l;
        v175[4] = v94;
        objc_msgSend(v95, "indexesOfObjectsPassingTest:", v175);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v11;
        v98 = objc_msgSend(v96, "count");
        if (v98 == 1)
        {
          objc_msgSend(v95, "objectAtIndexedSubscript:", objc_msgSend(v96, "firstIndex"));
          self = (PLAssetJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
          -[PLAssetJournalEntryPayload objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("fingerprint"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v99 = 0;
        }
        objc_msgSend(v97, "additionalAttributes");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setAdjustedStableHash:", v99);

        if (v98 == 1)
        {

        }
        goto LABEL_68;
      }
      if (objc_msgSend(v10, "isEqualToKey:", CFSTR("bundleScope")))
      {
        v16 = v11;
        v100 = self->super._payloadAttributes;
        objc_msgSend(v10, "key");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v100, "objectForKeyedSubscript:", v101);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v16, "setBundleScope:", (unsigned __int16)objc_msgSend(v18, "integerValue"));
        goto LABEL_37;
      }
      if (objc_msgSend(v10, "isEqualToKey:", CFSTR("libraryScopeAssetContributorsToUpdate")))
      {
        v127 = self->super._payloadAttributes;
        v18 = v11;
        -[PLAssetJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](self, "payloadValueFromAttributes:forPayloadProperty:", v127, v10);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setLibraryScopeAssetContributorsToUpdate:", v16);
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      if (!objc_msgSend(v10, "isEqualToKey:", CFSTR("avalancheUUID")))
      {
        if (objc_msgSend(v10, "isEqualToKey:", CFSTR("avalanchePickType")))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("avalancheUUID"));
          v145 = (void *)objc_claimAutoreleasedReturnValue();

          if (v145)
          {
            v146 = self->super._payloadAttributes;
            v147 = v11;
            objc_msgSend(v10, "key");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](v146, "objectForKeyedSubscript:", v148);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v147, "setAvalanchePickType:", objc_msgSend(v149, "integerValue"));

          }
        }
        goto LABEL_39;
      }
      v21 = v11;
      v133 = self->super._payloadAttributes;
      objc_msgSend(v10, "key");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v133, "objectForKeyedSubscript:", v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();

      if (v135)
      {
        v136 = self->super._payloadAttributes;
        objc_msgSend(v10, "key");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v136, "objectForKeyedSubscript:", v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setAvalancheUUID:", v138);

        v139 = 1;
      }
      else
      {
        v139 = 0;
      }
      objc_msgSend(v21, "setAvalancheKind:", v139);
    }
LABEL_31:

    goto LABEL_39;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("inTrash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    v16 = v11;
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("trashedReason"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v19 = objc_msgSend(v17, "unsignedShortValue");
    else
      v19 = 0;
    objc_msgSend(v16, "trashWithReason:", v19);
    goto LABEL_37;
  }
LABEL_39:

}

- (NSArray)resources
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PLAssetJournalEntryPayloadResource *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("resources"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[PLAssetJournalEntryPayloadResource initWithPayloadAttributes:payload:]([PLAssetJournalEntryPayloadResource alloc], "initWithPayloadAttributes:payload:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), self);
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (signed)savedAssetType
{
  void *v2;
  signed __int16 v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("savedAssetType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (unsigned)bundleScope
{
  void *v3;
  void *v4;
  unsigned __int16 v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("bundleScope"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("bundleScope"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)mediaGroupUUID
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mediaGroupUUID"));
}

- (id)cloudMasterGUID
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("cloudAssetGUID"));
}

- (id)originalResourceRelativePathsWithPathManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unsigned int v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("directory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("filename"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8
    || (objc_msgSend(MEMORY[0x1E0D73310], "maskForReferencedAsset"),
        -[PLAssetJournalEntryPayload savedAssetType](self, "savedAssetType"),
        (PLValidatedSavedAssetTypeApplies() & 1) != 0))
  {
    v29 = 0;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = v7;
    v26 = v5;
    objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v9;
    objc_msgSend(v9, "addObject:");
    v27 = v4;
    v10 = objc_msgSend(v4, "isUBF");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[PLAssetJournalEntryPayload resources](self, "resources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v16, "isOriginalResource"))
          {
            v17 = objc_msgSend(v16, "resourceType");
            if (v17 <= 0xB && ((1 << v17) & 0xC3C) != 0)
            {
              objc_msgSend(v16, "uniformTypeIdentifierString");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v10 & 1) != 0)
                objc_msgSend(MEMORY[0x1E0D752F0], "preferredOrFallbackFilenameExtensionForType:", v20);
              else
                +[PLManagedAsset preferredFileExtensionForType:](PLManagedAsset, "preferredFileExtensionForType:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v28, "stringByDeletingPathExtension");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "stringByAppendingPathExtension:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v29, "addObject:", v23);
              }

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }

    v5 = v26;
    v4 = v27;
    v7 = v25;
  }

  return v29;
}

- (signed)kind
{
  void *v2;
  signed __int16 v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setKind:(signed __int16)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v4, CFSTR("kind"));

}

- (signed)kindSubtype
{
  void *v2;
  signed __int16 v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)isVideo
{
  return -[PLAssetJournalEntryPayload kind](self, "kind") == 1;
}

- (BOOL)isImage
{
  return -[PLAssetJournalEntryPayload kind](self, "kind") == 0;
}

- (unsigned)playbackStyle
{
  void *v2;
  unsigned __int16 v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("playbackStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setPlaybackStyle:(unsigned __int16)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v4, CFSTR("playbackStyle"));

}

- (unsigned)playbackVariation
{
  void *v2;
  unsigned __int16 v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("playbackVariation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)highFrameRateState
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("highFrameRateState"));
}

- (BOOL)isDefaultAdjustedSlomo
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PLAssetJournalEntryPayload adjustmentFormatIdentifier](self, "adjustmentFormatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.video.slomo"));

  -[PLAssetJournalEntryPayload adjustmentFormatVersion](self, "adjustmentFormatVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("1.1")) & 1) != 0)
      LOBYTE(v4) = 1;
    else
      LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("1.0"));
  }
  v7 = -[PLAssetJournalEntryPayload isVideo](self, "isVideo") & v4;

  return v7;
}

- (BOOL)hasAdjustments
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("adjustmentsState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedShortValue") != 0;

  return v3;
}

- (id)hdrGain
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("hdrGain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "floatValue");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)uniformTypeIdentifier
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("uti"));
}

- (id)dateCreated
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("dateCreated"));
}

- (id)locationData
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("locationData"));
}

- (id)latitude
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("latitude"));
}

- (id)longitude
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("longitude"));
}

- (id)extendedAttributesLatitude
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("exLatitude"));
}

- (id)extendedAttributesLongitude
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("exLongitude"));
}

- (id)originalOrientation
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("originalOrientation"));
}

- (id)adjustmentFormatIdentifier
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("adjustmentFormatIdentifier"));
}

- (id)adjustmentFormatVersion
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("adjustmentFormatVersion"));
}

- (id)directory
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("directory"));
}

- (id)filename
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("filename"));
}

- (unint64_t)bestCPLResourceTypeForAdjustedFingerPrint
{
  if (-[PLAssetJournalEntryPayload isImage](self, "isImage"))
    return 2;
  if (!-[PLAssetJournalEntryPayload isVideo](self, "isVideo"))
    return 0;
  if (-[PLAssetJournalEntryPayload isDefaultAdjustedSlomo](self, "isDefaultAdjustedSlomo"))
    return 0;
  return 16;
}

- (void)setLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = +[PLManagedAsset newLocationDataFromLocation:](PLManagedAsset, "newLocationDataFromLocation:");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v4, CFSTR("locationData"));
  v5 = (void *)MEMORY[0x1E0CB37E8];
  if (v4)
  {
    objc_msgSend(v14, "coordinate");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v6, CFSTR("latitude"));

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "coordinate");
    v9 = v8;
    v10 = v7;
  }
  else
  {
    v11 = MEMORY[0x1E0C9E500];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0C9E500]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v12, CFSTR("latitude"));

    v10 = (void *)MEMORY[0x1E0CB37E8];
    v9 = *(double *)(v11 + 8);
  }
  objc_msgSend(v10, "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v13, CFSTR("longitude"));

}

- (id)originalUniformTypeIdentifier
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("originalUTI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[PLAssetJournalEntryPayload hasAdjustments](self, "hasAdjustments")
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("uti")), (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[PLAssetJournalEntryPayload resources](self, "resources");
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
LABEL_7:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
          if (objc_msgSend(v10, "isOriginalResource", (_QWORD)v16))
          {
            if ((objc_msgSend(v10, "isPrimaryResource") & 1) != 0)
              break;
          }
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v7)
              goto LABEL_7;
            goto LABEL_14;
          }
        }
        objc_msgSend(v10, "uniformTypeIdentifierString");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3)
          return v3;
      }
      else
      {
LABEL_14:

      }
      -[PLAssetJournalEntryPayload filename](self, "filename", (_QWORD)v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathExtension");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v12 = (void *)MEMORY[0x1E0CEC3F8];
        -[PLAssetJournalEntryPayload filename](self, "filename");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "typeWithFilenameExtension:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "isDynamic") & 1) != 0)
        {
          v3 = 0;
        }
        else
        {
          objc_msgSend(v15, "identifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
    }
  }
  return v3;
}

- (int64_t)dateCreatedSource
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("dateCreatedSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setDateCreatedSource:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v4, CFSTR("dateCreatedSource"));

}

- (BOOL)sleetIsReversible
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("sleetIsReversible"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", &unk_1E375FEE8);

  return v3;
}

- (void)setSleetIsReversible:(unsigned __int16)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v4, CFSTR("sleetIsReversible"));

}

- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unsigned int v12;
  objc_super v13;

  v4 = a3;
  v5 = -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion");
  v6 = -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion");
  v7 = -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion");
  v8 = -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion");
  v9 = -[PLManagedObjectJournalEntryPayload payloadVersionIsLessThanVersion:forKey:inUpdatePayloads:](self, "payloadVersionIsLessThanVersion:forKey:inUpdatePayloads:", 21, CFSTR("hdrGain"), v4);
  v10 = -[PLManagedObjectJournalEntryPayload payloadVersionIsLessThanVersion:forKey:inUpdatePayloads:](self, "payloadVersionIsLessThanVersion:forKey:inUpdatePayloads:", 25, CFSTR("depthStates"), v4);
  v11 = -[PLManagedObjectJournalEntryPayload payloadVersionIsLessThanVersion:forKey:inUpdatePayloads:](self, "payloadVersionIsLessThanVersion:forKey:inUpdatePayloads:", 101, CFSTR("customRenderedValue"), v4);
  v12 = -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion");
  if (-[PLManagedObjectJournalEntryPayload payloadVersionIsLessThanVersion:forKey:inUpdatePayloads:](self, "payloadVersionIsLessThanVersion:forKey:inUpdatePayloads:", 300, CFSTR("adjustmentsState"), v4))
  {
    -[PLAssetJournalEntryPayload _convertHasAdjustmentsToAdjustmentsState](self, "_convertHasAdjustmentsToAdjustmentsState");
  }
  if (v5 <= 1)
    -[PLAssetJournalEntryPayload _fixAdjustedAssetUTI](self, "_fixAdjustedAssetUTI");
  if (v6 <= 2)
    -[PLAssetJournalEntryPayload _fixLocationData](self, "_fixLocationData");
  if (v7 <= 3)
    -[PLAssetJournalEntryPayload _fixXMPSidecarUTI](self, "_fixXMPSidecarUTI");
  if (v8 <= 5)
  {
    -[PLAssetJournalEntryPayload _fixResourceTypeUnknownValues](self, "_fixResourceTypeUnknownValues");
    if (!v9)
    {
LABEL_11:
      if (!v10)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if (!v9)
  {
    goto LABEL_11;
  }
  -[PLAssetJournalEntryPayload _fixHDRGainZeroValueToNULL](self, "_fixHDRGainZeroValueToNULL");
  if (!v10)
  {
LABEL_12:
    if (!v11)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  -[PLAssetJournalEntryPayload _convertDepthStatesToDepthType](self, "_convertDepthStatesToDepthType");
  if (v11)
LABEL_13:
    -[PLAssetJournalEntryPayload _convertCustomRenderedValueToHDRType](self, "_convertCustomRenderedValueToHDRType");
LABEL_14:
  if (v12 <= 0x66)
    -[PLAssetJournalEntryPayload _filterNonPersistedResources](self, "_filterNonPersistedResources");
  v13.receiver = self;
  v13.super_class = (Class)PLAssetJournalEntryPayload;
  -[PLManagedObjectJournalEntryPayload migrateMergedPayloadWithUpdatePayloads:](&v13, sel_migrateMergedPayloadWithUpdatePayloads_, v4);

}

- (id)_loadOriginalVideoMetadataWithPathManager:(id)a3 timezoneLookup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVProxyData:timeZoneLookup:", v8, v7);
    if (v9)
      goto LABEL_14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73310], "maskForReferencedAsset");
    -[PLAssetJournalEntryPayload savedAssetType](self, "savedAssetType");
    if ((PLValidatedSavedAssetTypeApplies() & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D74498];
      v30 = *MEMORY[0x1E0CB2938];
      v31[0] = CFSTR("skipping reference asset");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 46502, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PLAssetJournalEntryPayload directory](self, "directory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v13 = (void *)MEMORY[0x1E0C99E98];
        -[PLAssetJournalEntryPayload directory](self, "directory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAssetJournalEntryPayload filename](self, "filename");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "assetMainFilePathWithDirectory:filename:bundleScope:", v14, v15, -[PLAssetJournalEntryPayload bundleScope](self, "bundleScope"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fileURLWithPath:isDirectory:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVURL:timeZoneLookup:", v17, v7);

          if (v9)
            goto LABEL_14;
        }
        else
        {
          v9 = 0;
        }
      }
    }
  }
  PLMigrationGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136446978;
    v23 = "-[PLAssetJournalEntryPayload _loadOriginalVideoMetadataWithPathManager:timezoneLookup:]";
    v24 = 2114;
    v25 = v19;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v20;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "%{public}s: failed to load metadata for asset with uuid %{public}@, not fatal, will proceed with migration, error: %@ %@", (uint8_t *)&v22, 0x2Au);

  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (id)_loadOriginalImageMetadataWithPathManager:(id)a3 timezoneLookup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D75140]);
    v10 = (void *)MEMORY[0x1E0D752F0];
    -[PLAssetJournalEntryPayload originalUniformTypeIdentifier](self, "originalUniformTypeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typeWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithImageSourceProxyOrEncodedImagePropertyData:contentType:timeZoneLookup:", v8, v12, v7);

    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0D73310], "maskForReferencedAsset");
  -[PLAssetJournalEntryPayload savedAssetType](self, "savedAssetType");
  if ((PLValidatedSavedAssetTypeApplies() & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D74498];
    v35 = *MEMORY[0x1E0CB2938];
    v36[0] = CFSTR("skipping reference asset");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 46502, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PLAssetJournalEntryPayload directory](self, "directory");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v18 = (void *)v17;
    v19 = (void *)MEMORY[0x1E0C99E98];
    -[PLAssetJournalEntryPayload directory](self, "directory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAssetJournalEntryPayload filename](self, "filename");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetMainFilePathWithDirectory:filename:bundleScope:", v20, v21, -[PLAssetJournalEntryPayload bundleScope](self, "bundleScope"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:isDirectory:", v22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v11, 0, 12, v7, 0, 0);
LABEL_3:

      if (v13)
        goto LABEL_14;
      goto LABEL_10;
    }
  }
LABEL_11:
  PLMigrationGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 136446978;
    v28 = "-[PLAssetJournalEntryPayload _loadOriginalImageMetadataWithPathManager:timezoneLookup:]";
    v29 = 2114;
    v30 = v24;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v25;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "%{public}s: failed to load metadata for asset with uuid %{public}@, not fatal, will proceed with migration, error: %@ %@", (uint8_t *)&v27, 0x2Au);

  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordUUIDRemapping, 0);
}

id __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)PLAssetJournalEntryPayload;
  return objc_msgSendSuper2(&v6, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, a3, v4, a2, v3);
}

id __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_1081(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)PLAssetJournalEntryPayload;
  return objc_msgSendSuper2(&v6, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, a3, v4, a2, v3);
}

id __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)PLAssetJournalEntryPayload;
  return objc_msgSendSuper2(&v6, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, a3, v4, a2, v3);
}

BOOL __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "intValue");
  return v5 == *(_QWORD *)(a1 + 32) && v7 == 2;
}

+ (id)modelPropertiesDescription
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  const __CFString *v203;
  void *v204;
  const __CFString *v205;
  void *v206;
  _QWORD v207[8];
  _QWORD v208[8];
  const __CFString *v209;
  void *v210;
  _QWORD v211[52];
  _QWORD v212[52];
  _QWORD v213[36];
  _QWORD v214[36];
  _QWORD v215[2];
  _QWORD v216[2];
  _QWORD v217[18];
  _QWORD v218[18];
  const __CFString *v219;
  void *v220;
  _QWORD v221[8];
  _QWORD v222[8];
  _QWORD v223[49];
  _QWORD v224[51];

  MEMORY[0x1E0C80A78](a1);
  v224[49] = *MEMORY[0x1E0C80C00];
  v223[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v224[0] = v201;
  v223[1] = CFSTR("directory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v224[1] = v200;
  v223[2] = CFSTR("filename");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v224[2] = v199;
  v223[3] = CFSTR("savedAssetType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v224[3] = v198;
  v223[4] = CFSTR("bundleScope");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v224[4] = v197;
  v223[5] = CFSTR("cloudAssetGUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v224[5] = v196;
  v223[6] = CFSTR("avalancheUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v224[6] = v195;
  v223[7] = CFSTR("avalanchePickType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v224[7] = v194;
  v223[8] = CFSTR("hidden");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v224[8] = v193;
  v223[9] = CFSTR("favorite");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v224[9] = v192;
  v223[10] = CFSTR("trashedState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:", CFSTR("inTrash"), 100, 1, 0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v224[10] = v191;
  v223[11] = CFSTR("trashedReason");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v224[11] = v190;
  v223[12] = CFSTR("dateCreated");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v224[12] = v189;
  v223[13] = CFSTR("addedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v224[13] = v188;
  v223[14] = CFSTR("locationData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v224[14] = v187;
  v223[15] = CFSTR("mediaGroupUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v224[15] = v186;
  v223[16] = CFSTR("videoCpVisibilityState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("videoCpVisibility"), 100, 0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v224[16] = v185;
  v223[17] = CFSTR("videoCpDurationValue");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("videoCpDuration"), 300, 0);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v224[17] = v184;
  v223[18] = CFSTR("currentSleetCast");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v224[18] = v183;
  v223[19] = CFSTR("hdrType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("customRenderedValue"), 100, 0);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v224[19] = v182;
  v223[20] = CFSTR("spatialType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v224[20] = v181;
  v223[21] = CFSTR("depthType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("depthStates"), 100, 0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v224[21] = v180;
  v223[22] = CFSTR("duration");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("duration"), 500, 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v224[22] = v179;
  v223[23] = CFSTR("adjustmentsState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v224[23] = v178;
  v223[24] = CFSTR("hdrGain");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v224[24] = v177;
  v223[25] = CFSTR("height");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v224[25] = v176;
  v223[26] = CFSTR("kind");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v224[26] = v175;
  v223[27] = CFSTR("kindSubtype");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v224[27] = v174;
  v223[28] = CFSTR("lastSharedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v224[28] = v173;
  v223[29] = CFSTR("latitude");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("latitude"), 500, 0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v224[29] = v172;
  v223[30] = CFSTR("longitude");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("longitude"), 500, 0);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v224[30] = v171;
  v223[31] = CFSTR("modificationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v224[31] = v170;
  v223[32] = CFSTR("orientation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v224[32] = v169;
  v223[33] = CFSTR("originalColorSpace");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v224[33] = v168;
  v223[34] = CFSTR("playbackStyle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v224[34] = v167;
  v223[35] = CFSTR("playbackVariation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v224[35] = v166;
  v223[36] = CFSTR("sortToken");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v224[36] = v165;
  v223[37] = CFSTR("uniformTypeIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("uti"), 700, 0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v224[37] = v164;
  v223[38] = CFSTR("visibilityState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v224[38] = v163;
  v223[39] = CFSTR("width");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v224[39] = v162;
  v223[40] = CFSTR("deferredProcessingNeeded");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v224[40] = v161;
  v223[41] = CFSTR("cameraProcessingAdjustmentState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("snowplowState"), 100, 0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v224[41] = v160;
  v223[42] = CFSTR("highFrameRateState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v224[42] = v159;
  v223[43] = CFSTR("isMagicCarpet");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v224[43] = v158;
  v223[44] = CFSTR("libraryScopeShareState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v224[44] = v157;
  v223[45] = CFSTR("master");
  +[PLCloudMaster entityName](PLCloudMaster, "entityName");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v221[0] = CFSTR("cloudMasterGUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v222[0] = v156;
  v221[1] = CFSTR("uniformTypeIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("originalUTI"), 700, 0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v222[1] = v155;
  v221[2] = CFSTR("creationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v222[2] = v154;
  v221[3] = CFSTR("importDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v222[3] = v153;
  v221[4] = CFSTR("mediaMetadataType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v222[4] = v152;
  v221[5] = CFSTR("importSessionID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v222[5] = v151;
  v221[6] = CFSTR("fullSizeJPEGSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v222[6] = v150;
  v221[7] = CFSTR("mediaMetadata");
  +[PLCloudMasterMediaMetadata entityName](PLCloudMasterMediaMetadata, "entityName");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = CFSTR("data");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("mediaMetadata"), 1000, 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = v149;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v220, &v219, 1);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v146, v147, 0, 1, 0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v222[7] = v145;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v222, v221, 8);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("master"), v144, v148, 0, 1, 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v224[45] = v143;
  v223[46] = CFSTR("modernResources");
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v217[0] = CFSTR("resourceType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("type"), 200, 0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v218[0] = v142;
  v217[1] = CFSTR("version");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v218[1] = v141;
  v217[2] = CFSTR("recipeID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v218[2] = v140;
  v217[3] = CFSTR("dataStoreSubtype");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("subType"), 300, 0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v218[3] = v139;
  v217[4] = CFSTR("unorientedWidth");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("uwidth"), 300, 0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v218[4] = v138;
  v217[5] = CFSTR("unorientedHeight");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("uheight"), 300, 0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v218[5] = v137;
  v217[6] = CFSTR("dataLength");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("length"), 300, 0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v218[6] = v136;
  v217[7] = CFSTR("fingerprint");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v218[7] = v135;
  v217[8] = CFSTR("stableHash");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v218[8] = v134;
  v217[9] = CFSTR("sidecarIndex");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v218[9] = v133;
  v217[10] = CFSTR("ptpTrashedState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("ptpTrashedState"), 300, 0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v218[10] = v132;
  v217[11] = CFSTR("trashedState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:", CFSTR("inTrash"), 100, 1, 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v218[11] = v131;
  v217[12] = CFSTR("remoteAvailability");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v218[12] = v130;
  v217[13] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v218[13] = v129;
  v217[14] = CFSTR("compactUTI");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:", CFSTR("uti"), 700, 1, 0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v218[14] = v128;
  v217[15] = CFSTR("codecFourCharCodeName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("codec"), 700, 0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v218[15] = v127;
  v217[16] = CFSTR("fileSystemVolume");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("volume"), v2, 1);
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  v218[16] = v126;
  v217[17] = CFSTR("fileSystemBookmark");
  +[PLFileSystemBookmark entityName](PLFileSystemBookmark, "entityName");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v215[0] = CFSTR("bookmarkData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v216[0] = v124;
  v215[1] = CFSTR("pathRelativeToVolume");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("bookmarkPath"), 700, 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v216[1] = v123;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v216, v215, 2);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("bookmark"), v121, v122, 0, 1, 0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v218[17] = v120;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v218, v217, 18);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("resources"), v119, v125, 1, 1, 0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v224[46] = v118;
  v223[47] = CFSTR("extendedAttributes");
  +[PLExtendedAttributes entityName](PLExtendedAttributes, "entityName");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v213[0] = CFSTR("aperture");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exAperture"), 500, 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v214[0] = v117;
  v213[1] = CFSTR("bitrate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exBitrate"), 500, 0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v214[1] = v116;
  v213[2] = CFSTR("cameraModel");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exCameraModel"), 700, 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v214[2] = v115;
  v213[3] = CFSTR("cameraMake");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exCameraMake"), 700, 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v214[3] = v114;
  v213[4] = CFSTR("codec");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exCodec"), 700, 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v214[4] = v113;
  v213[5] = CFSTR("credit");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exCredit"), 700, 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v214[5] = v112;
  v213[6] = CFSTR("dateCreated");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exDateCreated"), 900, 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v214[6] = v111;
  v213[7] = CFSTR("duration");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exDuration"), 500, 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v214[7] = v110;
  v213[8] = CFSTR("exposureBias");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exExposureBias"), 500, 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v214[8] = v109;
  v213[9] = CFSTR("flashFired");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exFlashFired"), 800, 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v214[9] = v108;
  v213[10] = CFSTR("focalLength");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exFocalLength"), 500, 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v214[10] = v107;
  v213[11] = CFSTR("focalLengthIn35mm");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exFocalLengthIn35mm"), 300, 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v214[11] = v106;
  v213[12] = CFSTR("fps");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exFps"), 500, 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v214[12] = v105;
  v213[13] = CFSTR("generativeAIType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exGenerativeAIType"), 200, 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v214[13] = v104;
  v213[14] = CFSTR("iso");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exIso"), 300, 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v214[14] = v103;
  v213[15] = CFSTR("lensModel");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exLensModel"), 700, 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v214[15] = v102;
  v213[16] = CFSTR("meteringMode");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exMeteringMode"), 300, 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v214[16] = v101;
  v213[17] = CFSTR("sampleRate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exSampleRate"), 300, 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v214[17] = v100;
  v213[18] = CFSTR("shutterSpeed");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exShutterSpeed"), 500, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v214[18] = v99;
  v213[19] = CFSTR("trackFormat");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exTrackFormat"), 300, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v214[19] = v98;
  v213[20] = CFSTR("whiteBalance");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exWhiteBalance"), 300, 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v214[20] = v97;
  v213[21] = CFSTR("latitude");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exLatitude"), 500, 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v214[21] = v96;
  v213[22] = CFSTR("longitude");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exLongitude"), 500, 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v214[22] = v95;
  v213[23] = CFSTR("slushSceneBias");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v214[23] = v94;
  v213[24] = CFSTR("slushWarmthBias");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v214[24] = v93;
  v213[25] = CFSTR("slushVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v214[25] = v92;
  v213[26] = CFSTR("slushPreset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v214[26] = v91;
  v213[27] = CFSTR("timezoneName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exTimezoneName"), 700, 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v214[27] = v90;
  v213[28] = CFSTR("timezoneOffset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exTimezoneOffset"), 200, 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v214[28] = v88;
  v213[29] = CFSTR("digitalZoomRatio");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exDigitalZoomRatio"), 500, 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v214[29] = v87;
  v213[30] = CFSTR("orientation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exOrientation"), 100, 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v214[30] = v86;
  v213[31] = CFSTR("sleetCast");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exSleetCast"), 100, 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v214[31] = v85;
  v213[32] = CFSTR("sleetToneBias");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exSleetToneBias"), 500, 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v214[32] = v84;
  v213[33] = CFSTR("sleetColorBias");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exSleetColorBias"), 500, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v214[33] = v83;
  v213[34] = CFSTR("sleetIntensity");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exSleetIntensity"), 500, 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v214[34] = v82;
  v213[35] = CFSTR("sleetRenderingVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("exSleetRenderingVersion"), 100, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v214[35] = v81;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v214, v213, 36);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("extendedAttributes"), v80, v89, 0, 1, 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v224[47] = v79;
  v223[48] = CFSTR("additionalAttributes");
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v211[0] = CFSTR("importedByBundleIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("creatorBundleID"), 700, 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v212[0] = v78;
  v211[1] = CFSTR("importedByDisplayName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v212[1] = v77;
  v211[2] = CFSTR("originalAssetsUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("originalAssetUUID"), 700, 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v212[2] = v76;
  v211[3] = CFSTR("publicGlobalUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v212[3] = v75;
  v211[4] = CFSTR("title");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v212[4] = v74;
  v211[5] = CFSTR("accessibilityDescription");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v212[5] = v73;
  v211[6] = CFSTR("timeZoneName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v212[6] = v72;
  v211[7] = CFSTR("timeZoneOffset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v212[7] = v71;
  v211[8] = CFSTR("originalFilename");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v212[8] = v70;
  v211[9] = CFSTR("placeAnnotationData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v212[9] = v69;
  v211[10] = CFSTR("videoCpDurationTimescale");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v212[10] = v68;
  v211[11] = CFSTR("videoCpDisplayValue");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v212[11] = v67;
  v211[12] = CFSTR("videoCpDisplayTimescale");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v212[12] = v66;
  v211[13] = CFSTR("importedBy");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v212[13] = v65;
  v211[14] = CFSTR("cameraCaptureDevice");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v212[14] = v64;
  v211[15] = CFSTR("alternateImportImageDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v212[15] = v63;
  v211[16] = CFSTR("editorBundleID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v212[16] = v62;
  v211[17] = CFSTR("embeddedThumbnailHeight");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v212[17] = v61;
  v211[18] = CFSTR("embeddedThumbnailLength");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v212[18] = v60;
  v211[19] = CFSTR("embeddedThumbnailOffset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v212[19] = v59;
  v211[20] = CFSTR("embeddedThumbnailWidth");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v212[20] = v58;
  v211[21] = CFSTR("exifTimestampString");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v212[21] = v57;
  v211[22] = CFSTR("montage");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v212[22] = v56;
  v211[23] = CFSTR("originalFilesize");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v212[23] = v55;
  v211[24] = CFSTR("originalHeight");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v212[24] = v54;
  v211[25] = CFSTR("originalOrientation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v212[25] = v53;
  v211[26] = CFSTR("originalResourceChoice");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v212[26] = v52;
  v211[27] = CFSTR("originalWidth");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v212[27] = v51;
  v211[28] = CFSTR("sleetIsReversible");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v212[28] = v50;
  v211[29] = CFSTR("originatingAssetIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v212[29] = v49;
  v211[30] = CFSTR("ptpTrashedState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("ptpTrashedState"), 300, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v212[30] = v48;
  v211[31] = CFSTR("shareOriginator");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v212[31] = v47;
  v211[32] = CFSTR("shareType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v212[32] = v46;
  v211[33] = CFSTR("playCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v212[33] = v45;
  v211[34] = CFSTR("shareCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v212[34] = v44;
  v211[35] = CFSTR("viewCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v212[35] = v43;
  v211[36] = CFSTR("lastViewedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v212[36] = v42;
  v211[37] = CFSTR("deferredPhotoIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("snowdayIdentifier"), 700, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v212[37] = v41;
  v211[38] = CFSTR("mediaMetadataType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("assetMediaMetadataType"), 700, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v212[38] = v40;
  v211[39] = CFSTR("photoStreamTagId");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v212[39] = v39;
  v211[40] = CFSTR("originalHash");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v212[40] = v38;
  v211[41] = CFSTR("spatialOverCaptureGroupIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("snowplowGroupUUID"), 700, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v212[41] = v37;
  v211[42] = CFSTR("syndicationIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v212[42] = v36;
  v211[43] = CFSTR("syndicationHistory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v212[43] = v35;
  v211[44] = CFSTR("libraryScopeAssetContributorsToUpdate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v212[44] = v34;
  v211[45] = CFSTR("dateCreatedSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v212[45] = v33;
  v211[46] = CFSTR("viewPresentation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v212[46] = v32;
  v211[47] = CFSTR("keywords");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("keywords"), v3, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v212[47] = v31;
  v211[48] = CFSTR("assetDescription");
  +[PLAssetDescription entityName](PLAssetDescription, "entityName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = CFSTR("longDescription");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("description"), 700, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v210, &v209, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("assetDescription"), v28, v29, 0, 1, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v212[48] = v27;
  v211[49] = CFSTR("unmanagedAdjustment");
  +[PLUnmanagedAdjustment entityName](PLUnmanagedAdjustment, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v207[0] = CFSTR("adjustmentBaseImageFormat");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v208[0] = v26;
  v207[1] = CFSTR("adjustmentFormatIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v208[1] = v25;
  v207[2] = CFSTR("adjustmentFormatVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v208[2] = v24;
  v207[3] = CFSTR("adjustmentRenderTypes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v208[3] = v23;
  v207[4] = CFSTR("adjustmentTimestamp");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v208[4] = v22;
  v207[5] = CFSTR("editorLocalizedName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v208[5] = v21;
  v207[6] = CFSTR("otherAdjustmentsFingerprint");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v208[6] = v20;
  v207[7] = CFSTR("similarToOriginalAdjustmentsFingerprint");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v208[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v208, v207, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("unmanagedAdjustment"), v17, v19, 0, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v212[49] = v16;
  v211[50] = CFSTR("mediaMetadata");
  +[PLCloudMasterMediaMetadata entityName](PLCloudMasterMediaMetadata, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = CFSTR("data");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("assetMediaMetadata"), 1000, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v206, &v205, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("assetMediaMetadataRelationship"), v5, v15, 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v212[50] = v6;
  v211[51] = CFSTR("editedIPTCAttributes");
  +[PLEditedIPTCAttributes entityName](PLEditedIPTCAttributes, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = CFSTR("data");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("iptcData"), 1000, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("editedIPTCAttributes"), v9, v7, 0, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v212[51] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v212, v211, 52);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v11, v202, 0, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v224[48] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v224, v223, 49);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)nonPersistedModelPropertiesDescription
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  _QWORD v273[2];
  _QWORD v274[2];
  _QWORD v275[17];
  _QWORD v276[17];
  const __CFString *v277;
  void *v278;
  _QWORD v279[19];
  _QWORD v280[19];
  _QWORD v281[66];
  _QWORD v282[66];
  _QWORD v283[2];
  _QWORD v284[2];
  _QWORD v285[2];
  _QWORD v286[2];
  const __CFString *v287;
  void *v288;
  _QWORD v289[43];
  _QWORD v290[43];
  const __CFString *v291;
  void *v292;
  _QWORD v293[105];
  _QWORD v294[107];

  MEMORY[0x1E0C80A78](a1);
  v294[105] = *MEMORY[0x1E0C80C00];
  v293[0] = CFSTR("adjustmentTimestamp");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v294[0] = v272;
  v293[1] = CFSTR("analysisStateModificationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v294[1] = v271;
  v293[2] = CFSTR("avalancheKind");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v294[2] = v270;
  v293[3] = CFSTR("cloudBatchID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v294[3] = v269;
  v293[4] = CFSTR("cloudBatchPublishDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v294[4] = v268;
  v293[5] = CFSTR("cloudCollectionGUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v294[5] = v267;
  v293[6] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v294[6] = v266;
  v293[7] = CFSTR("cloudDownloadRequests");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v294[7] = v265;
  v293[8] = CFSTR("cloudHasCommentsByMe");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v294[8] = v264;
  v293[9] = CFSTR("cloudHasCommentsConversation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v294[9] = v263;
  v293[10] = CFSTR("cloudHasUnseenComments");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v294[10] = v262;
  v293[11] = CFSTR("cloudIsDeletable");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v294[11] = v261;
  v293[12] = CFSTR("cloudIsMyAsset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v294[12] = v260;
  v293[13] = CFSTR("cloudLastViewedCommentDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v294[13] = v259;
  v293[14] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v294[14] = v258;
  v293[15] = CFSTR("cloudOwnerHashedPersonID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v294[15] = v257;
  v293[16] = CFSTR("cloudPlaceholderKind");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v294[16] = v256;
  v293[17] = CFSTR("cloudServerPublishDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v294[17] = v255;
  v293[18] = CFSTR("complete");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v294[18] = v254;
  v293[19] = CFSTR("curationScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v294[19] = v253;
  v293[20] = CFSTR("duplicateAssetVisibilityState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v294[20] = v252;
  v293[21] = CFSTR("faceAdjustmentVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v294[21] = v251;
  v293[22] = CFSTR("faceAreaPoints");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v294[22] = v250;
  v293[23] = CFSTR("highlightVisibilityScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v294[23] = v249;
  v293[24] = CFSTR("imageRequestHints");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v294[24] = v248;
  v293[25] = CFSTR("overallAestheticScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v294[25] = v247;
  v293[26] = CFSTR("packedAcceptableCropRect");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v294[26] = v246;
  v293[27] = CFSTR("packedPreferredCropRect");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v294[27] = v245;
  v293[28] = CFSTR("promotionScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v294[28] = v244;
  v293[29] = CFSTR("thumbnailIndex");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v294[29] = v243;
  v293[30] = CFSTR("trashedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v294[30] = v242;
  v293[31] = CFSTR("videoDeferredProcessingNeeded");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v294[31] = v241;
  v293[32] = CFSTR("deleteReason");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v294[32] = v240;
  v293[33] = CFSTR("iconicScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v294[33] = v239;
  v293[34] = CFSTR("captureSessionIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v294[34] = v238;
  v293[35] = CFSTR("generativeMemoryCreationEligibilityState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v294[35] = v237;
  v293[36] = CFSTR("albums");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v294[36] = v236;
  v293[37] = CFSTR("albumsBeingCustomKeyAsset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v294[37] = v235;
  v293[38] = CFSTR("albumsBeingKeyAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v294[38] = v234;
  v293[39] = CFSTR("analysisStates");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v294[39] = v233;
  v293[40] = CFSTR("cloudComments");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v294[40] = v232;
  v293[41] = CFSTR("cloudFeedAssetsEntry");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v294[41] = v231;
  v293[42] = CFSTR("computedAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v294[42] = v230;
  v293[43] = CFSTR("destinationAssetsForDuplication");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v294[43] = v229;
  v293[44] = CFSTR("detectedFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v294[44] = v228;
  v293[45] = CFSTR("temporalDetectedFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v294[45] = v227;
  v293[46] = CFSTR("detectedTorsos");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v294[46] = v226;
  v293[47] = CFSTR("faceCrops");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v294[47] = v225;
  v293[48] = CFSTR("highlightBeingAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v294[48] = v224;
  v293[49] = CFSTR("videoKeyFrameTimeScale");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v294[49] = v223;
  v293[50] = CFSTR("videoKeyFrameValue");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v294[50] = v222;
  v293[51] = CFSTR("dayGroupHighlightBeingAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v294[51] = v221;
  v293[52] = CFSTR("dayGroupHighlightBeingKeyAssetPrivate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v294[52] = v220;
  v293[53] = CFSTR("dayGroupHighlightBeingKeyAssetShared");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v294[53] = v219;
  v293[54] = CFSTR("dayGroupHighlightBeingExtendedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v294[54] = v218;
  v293[55] = CFSTR("dayGroupHighlightBeingSummaryAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v294[55] = v217;
  v293[56] = CFSTR("duplicateMetadataMatchingAlbum");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v294[56] = v216;
  v293[57] = CFSTR("duplicatePerceptualMatchingAlbum");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v294[57] = v215;
  v293[58] = CFSTR("highlightBeingExtendedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v294[58] = v214;
  v293[59] = CFSTR("highlightBeingKeyAssetPrivate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v294[59] = v213;
  v293[60] = CFSTR("highlightBeingKeyAssetShared");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v294[60] = v212;
  v293[61] = CFSTR("highlightBeingSummaryAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v294[61] = v211;
  v293[62] = CFSTR("monthHighlightBeingKeyAssetPrivate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v294[62] = v210;
  v293[63] = CFSTR("monthHighlightBeingKeyAssetShared");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v294[63] = v209;
  v293[64] = CFSTR("yearHighlightBeingKeyAssetPrivate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v294[64] = v208;
  v293[65] = CFSTR("yearHighlightBeingKeyAssetShared");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v294[65] = v207;
  v293[66] = CFSTR("dayHighlightBeingCollageAssetsPrivate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v294[66] = v206;
  v293[67] = CFSTR("dayHighlightBeingCollageAssetsShared");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v294[67] = v205;
  v293[68] = CFSTR("dayHighlightBeingCollageAssetsMixed");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v294[68] = v204;
  v293[69] = CFSTR("importSession");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v294[69] = v203;
  v293[70] = CFSTR("conversation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v294[70] = v202;
  v293[71] = CFSTR("legacyFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v294[71] = v201;
  v293[72] = CFSTR("likeComments");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v294[72] = v200;
  v293[73] = CFSTR("mediaAnalysisAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v294[73] = v199;
  v293[74] = CFSTR("computeSyncAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v294[74] = v198;
  v293[75] = CFSTR("photoAnalysisAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v294[75] = v197;
  v293[76] = CFSTR("isDetectedScreenshot");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v294[76] = v196;
  v293[77] = CFSTR("isRecentlySaved");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v294[77] = v195;
  v293[78] = CFSTR("memoriesBeingCuratedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v294[78] = v194;
  v293[79] = CFSTR("memoriesBeingExtendedCuratedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v294[79] = v193;
  v293[80] = CFSTR("memoriesBeingKeyAsset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v294[80] = v192;
  v293[81] = CFSTR("memoriesBeingMovieCuratedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v294[81] = v191;
  v293[82] = CFSTR("memoriesBeingUserCuratedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v294[82] = v190;
  v293[83] = CFSTR("memoriesBeingRepresentativeAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v294[83] = v189;
  v293[84] = CFSTR("memoriesBeingCustomUserAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v294[84] = v188;
  v293[85] = CFSTR("memoriesBeingUserRemovedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v294[85] = v187;
  v293[86] = CFSTR("moment");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v294[86] = v186;
  v293[87] = CFSTR("momentShare");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v294[87] = v185;
  v293[88] = CFSTR("libraryScope");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v294[88] = v184;
  v293[89] = CFSTR("activeLibraryScopeParticipationState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v294[89] = v183;
  v293[90] = CFSTR("libraryScopeContributors");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v294[90] = v182;
  v293[91] = CFSTR("libraryScopeAssetContributors");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v294[91] = v181;
  v293[92] = CFSTR("trashedByParticipant");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v294[92] = v180;
  v293[93] = CFSTR("resources");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v294[93] = v179;
  v293[94] = CFSTR("suggestionsBeingKeyAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v294[94] = v178;
  v293[95] = CFSTR("suggestionsBeingRepresentativeAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v294[95] = v177;
  v293[96] = CFSTR("packedBadgeAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v294[96] = v176;
  v293[97] = CFSTR("derivedCameraCaptureDevice");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v294[97] = v175;
  v293[98] = CFSTR("syndicationState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v294[98] = v174;
  v293[99] = CFSTR("searchIndexRebuildState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v294[99] = v173;
  v293[100] = CFSTR("stickerConfidenceScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v294[100] = v172;
  v293[101] = CFSTR("extendedAttributes");
  v291 = CFSTR("asset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v292 = v171;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v170, 0, 0, 1, 0);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v294[101] = v169;
  v293[102] = CFSTR("additionalAttributes");
  v289[0] = CFSTR("hasPeopleSceneMidOrGreaterConfidence");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v290[0] = v168;
  v289[1] = CFSTR("adjustedStableHash");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v290[1] = v167;
  v289[2] = CFSTR("allowedForAnalysis");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v290[2] = v166;
  v289[3] = CFSTR("cloudAvalanchePickType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v290[3] = v165;
  v289[4] = CFSTR("cloudKindSubtype");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v290[4] = v164;
  v289[5] = CFSTR("cloudRecoveryState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v290[5] = v163;
  v289[6] = CFSTR("cloudStateRecoveryAttemptsCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v290[6] = v162;
  v289[7] = CFSTR("destinationAssetCopyState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v290[7] = v161;
  v289[8] = CFSTR("distanceIdentity");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v290[8] = v160;
  v289[9] = CFSTR("faceRegions");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v290[9] = v159;
  v289[10] = CFSTR("gpsHorizontalAccuracy");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v290[10] = v158;
  v289[11] = CFSTR("importSessionID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v290[11] = v157;
  v289[12] = CFSTR("lastUploadAttemptDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v290[12] = v156;
  v289[13] = CFSTR("locationHash");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v290[13] = v155;
  v289[14] = CFSTR("originalStableHash");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v290[14] = v154;
  v289[15] = CFSTR("pendingPlayCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v290[15] = v153;
  v289[16] = CFSTR("pendingShareCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v290[16] = v152;
  v289[17] = CFSTR("pendingViewCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v290[17] = v151;
  v289[18] = CFSTR("reverseLocationData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v290[18] = v150;
  v289[19] = CFSTR("reverseLocationDataIsValid");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v290[19] = v149;
  v289[20] = CFSTR("sceneAnalysisTimestamp");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v290[20] = v148;
  v289[21] = CFSTR("sceneAnalysisVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v290[21] = v147;
  v289[22] = CFSTR("sceneAnalysisIsFromPreview");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v290[22] = v146;
  v289[23] = CFSTR("shiftedLocationData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v290[23] = v145;
  v289[24] = CFSTR("shiftedLocationIsValid");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v290[24] = v144;
  v289[25] = CFSTR("objectSaliencyRectsData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v290[25] = v143;
  v289[26] = CFSTR("uploadAttempts");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v290[26] = v142;
  v289[27] = CFSTR("variationSuggestionStates");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v290[27] = v141;
  v289[28] = CFSTR("inferredTimeZoneOffset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v290[28] = v140;
  v289[29] = CFSTR("deferredProcessingCandidateOptions");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v290[29] = v139;
  v289[30] = CFSTR("sourceAssetForDuplicationScopeIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v290[30] = v138;
  v289[31] = CFSTR("sourceAssetForDuplicationIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v290[31] = v137;
  v289[32] = CFSTR("faceAnalysisVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v290[32] = v136;
  v289[33] = CFSTR("duplicateDetectorPerceptualProcessingState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v290[33] = v135;
  v289[34] = CFSTR("asset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v290[34] = v134;
  v289[35] = CFSTR("personReferences");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v290[35] = v133;
  v289[36] = CFSTR("sceneClassifications");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v290[36] = v132;
  v289[37] = CFSTR("temporalSceneClassifications");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v290[37] = v131;
  v289[38] = CFSTR("sceneprint");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v290[38] = v130;
  v289[39] = CFSTR("assetDescription");
  v287 = CFSTR("assetAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v288 = v129;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v288, &v287, 1);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v128, 0, 0, 1, 0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v290[39] = v127;
  v289[40] = CFSTR("unmanagedAdjustment");
  v285[0] = CFSTR("assetAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v286[0] = v126;
  v285[1] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v286[1] = v125;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v286, v285, 2);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v124, 0, 0, 1, 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v290[40] = v123;
  v289[41] = CFSTR("mediaMetadata");
  v283[0] = CFSTR("additionalAssetAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v284[0] = v122;
  v283[1] = CFSTR("cloudMaster");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v284[1] = v121;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v284, v283, 2);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v120, 0, 0, 1, 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v290[41] = v119;
  v289[42] = CFSTR("editedIPTCAttributes");
  v281[0] = CFSTR("caption");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v282[0] = v118;
  v281[1] = CFSTR("byLine");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v282[1] = v117;
  v281[2] = CFSTR("copyrightNotice");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v282[2] = v116;
  v281[3] = CFSTR("keywords");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v282[3] = v115;
  v281[4] = CFSTR("urgency");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v282[4] = v114;
  v281[5] = CFSTR("dateCreated");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v282[5] = v113;
  v281[6] = CFSTR("digitalCreationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v282[6] = v112;
  v281[7] = CFSTR("digitalCreationTime");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v282[7] = v111;
  v281[8] = CFSTR("digitalSourceType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v282[8] = v110;
  v281[9] = CFSTR("expirationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v282[9] = v109;
  v281[10] = CFSTR("expirationTime");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v282[10] = v108;
  v281[11] = CFSTR("referenceDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v282[11] = v107;
  v281[12] = CFSTR("releaseDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v282[12] = v106;
  v281[13] = CFSTR("releaseTime");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v282[13] = v105;
  v281[14] = CFSTR("timeCreated");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v282[14] = v104;
  v281[15] = CFSTR("editStatus");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v282[15] = v103;
  v281[16] = CFSTR("contentLocationCode");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v282[16] = v102;
  v281[17] = CFSTR("contentLocationName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v282[17] = v101;
  v281[18] = CFSTR("countryPrimaryLocationCode");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v282[18] = v100;
  v281[19] = CFSTR("objectAttributeReference");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v282[19] = v99;
  v281[20] = CFSTR("objectTypeReference");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v282[20] = v98;
  v281[21] = CFSTR("subjectReference");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v282[21] = v97;
  v281[22] = CFSTR("subLocation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v282[22] = v96;
  v281[23] = CFSTR("scene");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v282[23] = v95;
  v281[24] = CFSTR("creatorContactInfo");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v282[24] = v94;
  v281[25] = CFSTR("ciAdrCity");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v282[25] = v93;
  v281[26] = CFSTR("ciAdrCtry");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v282[26] = v92;
  v281[27] = CFSTR("ciAdrExtadr");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v282[27] = v91;
  v281[28] = CFSTR("ciAdrPcode");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v282[28] = v90;
  v281[29] = CFSTR("ciAdrRegion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v282[29] = v89;
  v281[30] = CFSTR("ciEmailWork");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v282[30] = v88;
  v281[31] = CFSTR("ciTelWork");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v282[31] = v87;
  v281[32] = CFSTR("ciUrlWork");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v282[32] = v86;
  v281[33] = CFSTR("actionAdvised");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v282[33] = v85;
  v281[34] = CFSTR("audioDuration");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v282[34] = v84;
  v281[35] = CFSTR("audioOutcue");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v282[35] = v83;
  v281[36] = CFSTR("audioSamplingRate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v282[36] = v82;
  v281[37] = CFSTR("audioSamplingRes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v282[37] = v81;
  v281[38] = CFSTR("audioType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v282[38] = v80;
  v281[39] = CFSTR("byLineTitle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v282[39] = v79;
  v281[40] = CFSTR("category");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v282[40] = v78;
  v281[41] = CFSTR("city");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v282[41] = v77;
  v281[42] = CFSTR("contact");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v282[42] = v76;
  v281[43] = CFSTR("countryPrimaryLocationName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v282[43] = v75;
  v281[44] = CFSTR("credit");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v282[44] = v74;
  v281[45] = CFSTR("editorialUpdate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v282[45] = v73;
  v281[46] = CFSTR("fixtureIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v282[46] = v72;
  v281[47] = CFSTR("headline");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v282[47] = v71;
  v281[48] = CFSTR("imageOrientation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v282[48] = v70;
  v281[49] = CFSTR("imageType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v282[49] = v69;
  v281[50] = CFSTR("languageIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v282[50] = v68;
  v281[51] = CFSTR("objectCycle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v282[51] = v67;
  v281[52] = CFSTR("originatingProgram");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v282[52] = v66;
  v281[53] = CFSTR("originalTransmissionReference");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v282[53] = v65;
  v281[54] = CFSTR("programVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v282[54] = v64;
  v281[55] = CFSTR("provinceState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v282[55] = v63;
  v281[56] = CFSTR("objectName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v282[56] = v62;
  v281[57] = CFSTR("referenceNumber");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v282[57] = v61;
  v281[58] = CFSTR("referenceService");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v282[58] = v60;
  v281[59] = CFSTR("source");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v282[59] = v59;
  v281[60] = CFSTR("specialInstructions");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v282[60] = v58;
  v281[61] = CFSTR("supplementalCategory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v282[61] = v57;
  v281[62] = CFSTR("writerEditor");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v282[62] = v56;
  v281[63] = CFSTR("usageTerms");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v282[63] = v55;
  v281[64] = CFSTR("starRating");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v282[64] = v54;
  v281[65] = CFSTR("assetAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v282[65] = v53;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v282, v281, 66);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v52, 0, 0, 1, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v290[42] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v290, v289, 43);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v50, 0, 0, 1, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v294[102] = v49;
  v293[103] = CFSTR("modernResources");
  v279[0] = CFSTR("cloudDeleteAssetUUIDWithResourceType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v280[0] = v48;
  v279[1] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v280[1] = v47;
  v279[2] = CFSTR("cloudLastOnDemandDownloadDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v280[2] = v46;
  v279[3] = CFSTR("cloudLastPrefetchDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v280[3] = v45;
  v279[4] = CFSTR("cloudPrunedAt");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v280[4] = v44;
  v279[5] = CFSTR("cloudMasterDateCreated");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v280[5] = v43;
  v279[6] = CFSTR("cloudPrefetchCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v280[6] = v42;
  v279[7] = CFSTR("cloudSourceType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v280[7] = v41;
  v279[8] = CFSTR("dataStoreKeyData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v280[8] = v40;
  v279[9] = CFSTR("fileID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v280[9] = v39;
  v279[10] = CFSTR("localAvailability");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v280[10] = v38;
  v279[11] = CFSTR("localAvailabilityTarget");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v280[11] = v37;
  v279[12] = CFSTR("remoteAvailabilityTarget");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v280[12] = v36;
  v279[13] = CFSTR("asset");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v280[13] = v35;
  v279[14] = CFSTR("transientCloudMaster");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v280[14] = v34;
  v279[15] = CFSTR("dataStoreClassID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v280[15] = v33;
  v279[16] = CFSTR("trashedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v280[16] = v32;
  v279[17] = CFSTR("utiConformanceHint");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v280[17] = v31;
  v279[18] = CFSTR("fileSystemBookmark");
  v277 = CFSTR("resource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v278 = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v278, &v277, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v29, 0, 0, 1, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v280[18] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v280, v279, 19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v27, 0, 0, 1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v294[103] = v26;
  v293[104] = CFSTR("master");
  v275[0] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v276[0] = v25;
  v275[1] = CFSTR("importedBy");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v276[1] = v24;
  v275[2] = CFSTR("importedByBundleIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v276[2] = v23;
  v275[3] = CFSTR("importedByDisplayName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v276[3] = v22;
  v275[4] = CFSTR("originalFilename");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v276[4] = v21;
  v275[5] = CFSTR("originalOrientation");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v276[5] = v20;
  v275[6] = CFSTR("originatingAssetIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v276[6] = v19;
  v275[7] = CFSTR("placeholderState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v276[7] = v18;
  v275[8] = CFSTR("assets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v276[8] = v17;
  v275[9] = CFSTR("momentShare");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v276[9] = v16;
  v275[10] = CFSTR("resources");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v276[10] = v15;
  v275[11] = CFSTR("transientModernResources");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v276[11] = v14;
  v275[12] = CFSTR("videoFrameRate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v276[12] = v13;
  v275[13] = CFSTR("codecName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v276[13] = v2;
  v275[14] = CFSTR("sourceMasterForDuplicationScopeIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v276[14] = v3;
  v275[15] = CFSTR("sourceMasterForDuplicationIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v276[15] = v4;
  v275[16] = CFSTR("mediaMetadata");
  v273[0] = CFSTR("additionalAssetAttributes");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v274[0] = v5;
  v273[1] = CFSTR("cloudMaster");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v274[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v274, v273, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v7, 0, 0, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v276[16] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v276, v275, 17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v9, 0, 0, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v294[104] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v294, v293, 105);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PLAssetJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_71216 != -1)
    dispatch_once(&modelProperties_onceToken_71216, block);
  return (id)modelProperties_modelProperties_71217;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PLAssetJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_71214 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_71214, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_71215;
}

+ (id)payloadClassID
{
  return +[PLManagedAsset entityName](PLManagedAsset, "entityName");
}

+ (unsigned)payloadVersion
{
  return 300;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 10;
}

+ (id)snapshotSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  BOOL v12;

  v5 = a4;
  v6 = a3;
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recipeID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = +[PLAssetJournalEntryPayloadResource isValidForPersistenceWithRecipeID:](PLAssetJournalEntryPayloadResource, "isValidForPersistenceWithRecipeID:", objc_msgSend(v9, "integerValue"));
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D73280];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v11, "bundleScopeShouldBePersistedForRebuild:", (unsigned __int16)objc_msgSend(v9, "integerValue"));
  }
  v12 = v10;

  return v12;
}

void __66__PLAssetJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_71215;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_71215 = v1;

}

uint64_t __45__PLAssetJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_71217;
  modelProperties_modelProperties_71217 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_71217, 0);
}

- (void)_convertHasAdjustmentsToAdjustmentsState
{
  void *v3;
  int v4;
  NSMutableDictionary *payloadAttributes;
  void *v6;
  int v7;
  void *v8;
  id v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("hasAdjustments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    v4 = objc_msgSend(v3, "BOOLValue");
    payloadAttributes = self->super._payloadAttributes;
    if (v4)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](payloadAttributes, "objectForKeyedSubscript:", CFSTR("adjustmentRenderTypes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "unsignedIntegerValue");

      if ((v7 & 0x2000) != 0)
      {
        payloadAttributes = self->super._payloadAttributes;
        v8 = &unk_1E375FF00;
      }
      else
      {
        payloadAttributes = self->super._payloadAttributes;
        if (v7)
          v8 = &unk_1E375FF18;
        else
          v8 = &unk_1E375FEE8;
      }
    }
    else
    {
      v8 = &unk_1E375FF30;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](payloadAttributes, "setObject:forKeyedSubscript:", v8, CFSTR("adjustmentsState"));
    v3 = v9;
  }

}

- (void)_fixAdjustedAssetUTI
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[PLAssetJournalEntryPayload hasAdjustments](self, "hasAdjustments"))
  {
    if (-[PLAssetJournalEntryPayload isImage](self, "isImage"))
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:");

    }
    else if (-[PLAssetJournalEntryPayload isVideo](self, "isVideo"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      -[PLAssetJournalEntryPayload resources](self, "resources");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v16 != v6)
              objc_enumerationMutation(v3);
            v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            if (!objc_msgSend(v8, "dataStoreClassID")
              && objc_msgSend(v8, "version") == 2
              && objc_msgSend(v8, "cplType") == 16)
            {
              objc_msgSend(v8, "uniformTypeIdentifierString");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = (void *)*MEMORY[0x1E0CEC5B0];
              objc_msgSend((id)*MEMORY[0x1E0CEC5B0], "identifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v10, "isEqualToString:", v11);

              if ((v12 & 1) == 0)
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", &unk_1E375FF18, CFSTR("deferredProcessingNeeded"));

              goto LABEL_19;
            }
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v5)
            continue;
          break;
        }
      }

      v9 = (void *)*MEMORY[0x1E0CEC5B0];
LABEL_19:
      objc_msgSend(v9, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v13, CFSTR("uti"));

    }
  }
}

- (void)_fixLocationData
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  CLLocationDegrees v8;
  CLLocationCoordinate2D v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  -[PLAssetJournalEntryPayload extendedAttributesLatitude](self, "extendedAttributesLatitude");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAssetJournalEntryPayload locationData](self, "locationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v13;
  if (!v3 && v13)
  {
    -[PLAssetJournalEntryPayload extendedAttributesLongitude](self, "extendedAttributesLongitude");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v13, "doubleValue");
      v7 = v6;
      objc_msgSend(v5, "doubleValue");
      v9 = CLLocationCoordinate2DMake(v7, v8);
      if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
      {
        v10 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        -[PLAssetJournalEntryPayload dateCreated](self, "dateCreated");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v11, v9.latitude, v9.longitude, 0.0, 0.0, 0.0);

      }
      else
      {
        v12 = 0;
      }
      -[PLAssetJournalEntryPayload setLocation:](self, "setLocation:", v12);

    }
    v4 = v13;
  }

}

- (void)_fixXMPSidecarUTI
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  PLAssetJournalEntryPayload *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = self;
  -[PLAssetJournalEntryPayload resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v22 = (void *)*MEMORY[0x1E0CEC4A0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v9, "resourceType") != 5)
        {
          objc_msgSend(v9, "payloadAttributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);
          goto LABEL_16;
        }
        v10 = (void *)MEMORY[0x1E0D752F0];
        objc_msgSend(v9, "uniformTypeIdentifierString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "typeWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "isDynamic"))
        {
          v13 = objc_alloc(MEMORY[0x1E0C99E08]);
          objc_msgSend(v9, "payloadAttributes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithDictionary:", v14);

          objc_msgSend(v22, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("uti"));

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceAAEType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v12, "isEqual:", v17))
          {

LABEL_14:
            objc_msgSend(v9, "payloadAttributes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
          v18 = objc_msgSend(v9, "cplType");

          if (v18 == 22)
            goto LABEL_14;
          v19 = objc_alloc(MEMORY[0x1E0C99E08]);
          objc_msgSend(v9, "payloadAttributes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v19, "initWithDictionary:", v20);

          objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E375FF48, CFSTR("subType"));
        }
LABEL_15:
        objc_msgSend(v3, "addObject:", v15);

LABEL_16:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v21->super._payloadAttributes, "setObject:forKeyedSubscript:", v3, CFSTR("resources"));
}

- (void)_fixResourceTypeUnknownValues
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  PLAssetJournalEntryPayload *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v13 = self;
  -[PLAssetJournalEntryPayload resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "resourceType") == 32)
        {
          v10 = objc_alloc(MEMORY[0x1E0C99E08]);
          objc_msgSend(v9, "payloadAttributes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v10, "initWithDictionary:", v11);

          objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E375FF60, CFSTR("type"));
        }
        else
        {
          objc_msgSend(v9, "payloadAttributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v13->super._payloadAttributes, "setObject:forKeyedSubscript:", v3, CFSTR("resources"));
}

- (void)_fixHDRGainZeroValueToNULL
{
  void *v3;
  void *v4;
  _BOOL4 IsEqual;
  void *v6;

  -[PLAssetJournalEntryPayload hdrGain](self, "hdrGain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    IsEqual = PLNumberIsEqual(v3, &unk_1E37643B8);
    v4 = v6;
    if (IsEqual)
    {
      -[NSMutableDictionary removeObjectForKey:](self->super._payloadAttributes, "removeObjectForKey:", CFSTR("hdrGain"));
      v4 = v6;
    }
  }

}

- (void)_convertDepthStatesToDepthType
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  BOOL v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("customRenderedValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("depthStates"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (v6 == 2 || v4 << 16 == 458752 || (v4 << 16 != 0x80000 ? (v7 = v6 == 3) : (v7 = 1), v7))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", &unk_1E375FF78, CFSTR("depthStates"));
}

- (void)_convertCustomRenderedValueToHDRType
{
  id v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("customRenderedValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLAssetJournalEntryPayload isImage](self, "isImage")
    && (objc_msgSend(&unk_1E3763ED8, "containsObject:", v3) & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", &unk_1E375FF90, CFSTR("customRenderedValue"));
  }

}

- (void)_filterNonPersistedResources
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PLAssetJournalEntryPayload resources](self, "resources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isValidForPersistence"))
        {
          objc_msgSend(v9, "payloadAttributes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v3, CFSTR("resources"));
}

- (void)_fixDateCreatedSourceWithAdditionalAssetAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "pl_libraryBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZoneLookup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PLAssetJournalEntryPayload isImage](self, "isImage"))
  {
    -[PLAssetJournalEntryPayload _loadOriginalImageMetadataWithPathManager:timezoneLookup:](self, "_loadOriginalImageMetadataWithPathManager:timezoneLookup:", v14, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[PLAssetJournalEntryPayload isVideo](self, "isVideo"))
    {
LABEL_10:
      v13 = 0;
      goto LABEL_11;
    }
    -[PLAssetJournalEntryPayload _loadOriginalVideoMetadataWithPathManager:timezoneLookup:](self, "_loadOriginalVideoMetadataWithPathManager:timezoneLookup:", v14, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if (!v11)
    goto LABEL_10;
  v13 = objc_msgSend(v11, "creationDateSource");

LABEL_11:
  -[PLAssetJournalEntryPayload setDateCreatedSource:](self, "setDateCreatedSource:", v13);

}

- (void)_fixSleetIsReversibleWithAdditionalAssetAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "pl_libraryBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZoneLookup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAssetJournalEntryPayload setSleetIsReversible:](self, "setSleetIsReversible:", 0);
  v11 = 0;
  if (-[PLAssetJournalEntryPayload isImage](self, "isImage"))
  {
    -[PLAssetJournalEntryPayload _loadOriginalImageMetadataWithPathManager:timezoneLookup:](self, "_loadOriginalImageMetadataWithPathManager:timezoneLookup:", v14, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v12)
    {
      objc_msgSend(v12, "smartStyleIsReversible");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        -[PLAssetJournalEntryPayload setSleetIsReversible:](self, "setSleetIsReversible:", 1);
    }
  }

}

@end
