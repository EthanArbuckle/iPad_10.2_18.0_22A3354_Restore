@implementation HVQueue

void __42__HVQueue_deleteContentWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "diskStorageIsKnownToBeEmpty");
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v6, "diskContentBloomFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "matchesBloomFilter:", v5);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        objc_msgSend(v6, "setBloomFilterHits:", objc_msgSend(v6, "bloomFilterHits") + 1);
      else
        objc_msgSend(v6, "setBloomFilterMisses:", objc_msgSend(v6, "bloomFilterMisses") + 1);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }

    v4 = v6;
  }

}

void __41__HVQueue__deleteWithFilter_memory_disk___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  BOOL v34;
  int v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  const __CFString *v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t *v52;
  _QWORD v53[3];
  char v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  int v65;
  _QWORD v66[5];
  _QWORD v67[4];
  id v68;
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  _BYTE v73[20];
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "diskContentBloomFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v3, "setDiskContentBloomFilter:", 0);
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(v3, "memoryStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexesOfObjectsPassingTest:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_opt_new();
      v8 = MEMORY[0x24BDAC760];
      v67[0] = MEMORY[0x24BDAC760];
      v67[1] = 3221225472;
      v67[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_2;
      v67[3] = &unk_24DD7E8A0;
      v9 = v7;
      v68 = v9;
      v10 = v3;
      v69 = v10;
      objc_msgSend(v6, "enumerateIndexesUsingBlock:", v67);
      v11 = v69;
      v12 = v9;

      hv_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        v15 = objc_msgSend(v6, "count");
        v66[0] = v8;
        v66[1] = 3221225472;
        v66[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_3;
        v66[3] = &unk_24DD7E740;
        v66[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v12, "_pas_mappedArrayWithTransform:", v66);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413059;
        v71 = v14;
        v72 = 2048;
        *(_QWORD *)v73 = v15;
        *(_WORD *)&v73[8] = 2112;
        *(_QWORD *)&v73[10] = v16;
        *(_WORD *)&v73[18] = 2117;
        v74 = v12;
        _os_log_impl(&dword_21AA1D000, v13, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: Deleting %tu items from memory %@: %{sensitive}@", buf, 0x2Au);

      }
      objc_msgSend(v10, "memoryStorage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectsAtIndexes:", v6);

      -[HVQueue _updateMemoryQueueTransactionExtendingTimer:](*(_QWORD *)(a1 + 32), 0);
    }

  }
  if (*(_BYTE *)(a1 + 48) && (objc_msgSend(v3, "diskStorageIsKnownToBeEmpty") & 1) == 0)
  {
    v18 = 2 * objc_msgSend(v3, "diskStorageEventCount");
    if (v18 <= 0x80)
      v18 = 128;
    if (v18 >= 0x342A2)
      v20 = 213666;
    else
      v20 = v18;
    LODWORD(v19) = 1008981770;
    v42 = v20;
    objc_msgSend(MEMORY[0x24BE7A5A8], "bloomFilterInMemoryWithNumberOfValuesN:errorRateP:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v22 = (void *)objc_opt_new();
    v23 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v24 = MEMORY[0x24BDAC760];
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_201;
    v55[3] = &unk_24DD7E8C8;
    v25 = v22;
    v56 = v25;
    v26 = v23;
    v57 = v26;
    v27 = (void *)MEMORY[0x22074FF64](v55);
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v54 = 0;
    objc_msgSend(v3, "diskStorage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v24;
    v43[1] = 3221225472;
    v43[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_202;
    v43[3] = &unk_24DD7E8F0;
    v50 = v53;
    v29 = v26;
    v44 = v29;
    v48 = *(id *)(a1 + 40);
    v30 = v25;
    v31 = *(_QWORD *)(a1 + 32);
    v45 = v30;
    v46 = v31;
    v32 = v27;
    v49 = v32;
    v51 = &v58;
    v33 = v21;
    v47 = v33;
    v52 = &v62;
    objc_msgSend(v28, "pruneWithPredicateBlock:", v43);

    (*((void (**)(id, uint64_t))v32 + 2))(v32, 1);
    if (*((_DWORD *)v59 + 6))
      v34 = 1;
    else
      v34 = v4 == 0;
    v35 = !v34;
    hv_default_log_handle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v38 = *((_DWORD *)v59 + 6);
      v39 = &stru_24DD7F8A8;
      if (v35)
        v39 = CFSTR(" (!!! bloom filter false positive !!!!)");
      v40 = *((_DWORD *)v63 + 6);
      *(_DWORD *)buf = 138413058;
      v71 = v37;
      v72 = 1024;
      *(_DWORD *)v73 = v38;
      *(_WORD *)&v73[4] = 2112;
      *(_QWORD *)&v73[6] = v39;
      *(_WORD *)&v73[14] = 1024;
      *(_DWORD *)&v73[16] = v40;
      _os_log_impl(&dword_21AA1D000, v36, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: deleteContentWithRequest: biome enumeration deleted %u events on-disk%@, %u events remain on-disk", buf, 0x22u);
    }

    v41 = *((unsigned int *)v63 + 6);
    if (!(_DWORD)v41 || v42 >> 2 > v41)
    {
      if (!(_DWORD)v41)
        objc_msgSend(v3, "setDiskStorageIsKnownToBeEmpty:", 1);

      v33 = 0;
      v41 = *((unsigned int *)v63 + 6);
    }
    objc_msgSend(v3, "setDiskStorageEventCount:", v41);
    objc_msgSend(v3, "setDiskContentBloomFilter:", v33);
    if (v35)
      objc_msgSend(v3, "setBloomFilterFalsePositives:", objc_msgSend(v3, "bloomFilterFalsePositives") + 1);

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);

  }
}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  NSString *identifier;
  uint64_t v8;
  uint64_t v9;
  _PASLock *lock;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  hv_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = identifier;
    _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: deleteContentWithRequest: clearing queue", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_contentExpectedFromMultipleApps)
  {
    v8 = objc_msgSend(v5, "copyWithBundleIdentifier:", &stru_24DD7F8A8);

    v5 = (id)v8;
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v9 = MEMORY[0x24BDAC760];
  lock = self->_lock;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __42__HVQueue_deleteContentWithRequest_error___block_invoke;
  v18 = &unk_24DD7E678;
  v20 = &v21;
  v11 = v5;
  v19 = v11;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v15);
  v12 = v11;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__212;
  v31 = __Block_byref_object_dispose__213;
  v32 = 0;
  v26[5] = &buf;
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __42__HVQueue__filterBlockForDeletionRequest___block_invoke;
  v27[3] = &unk_24DD7E968;
  v27[4] = self;
  v27[5] = &buf;
  v25[5] = &buf;
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __42__HVQueue__filterBlockForDeletionRequest___block_invoke_2;
  v26[3] = &unk_24DD7E990;
  v26[4] = self;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __42__HVQueue__filterBlockForDeletionRequest___block_invoke_3;
  v25[3] = &unk_24DD7E9E0;
  v25[4] = self;
  objc_msgSend(v12, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:uniqueIdentifiersBlock:", v27, v26, v25, v15, v16, v17, v18);
  v13 = (void *)MEMORY[0x22074FF64](*(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);

  -[HVQueue _deleteWithFilter:memory:disk:]((uint64_t)self, v13, *((_BYTE *)v22 + 24));
  _Block_object_dispose(&v21, 8);

  return 1;
}

- (void)_deleteWithFilter:(uint64_t)a1 memory:(void *)a2 disk:(char)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  char v10;
  char v11;

  v5 = a2;
  if (a1)
  {
    v6 = *(void **)(a1 + 8);
    v8[1] = 3221225472;
    v8[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke;
    v8[3] = &unk_24DD7E918;
    v10 = a3;
    v11 = 1;
    v7 = v5;
    v8[0] = MEMORY[0x24BDAC760];
    v8[4] = a1;
    v9 = v5;
    objc_msgSend(v6, "runWithLockAcquired:", v8);

    v5 = v7;
  }

}

void __42__HVQueue__filterBlockForDeletionRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[HVQueue _filterBlockForBundleIdentifier:contentIdentifierSet:domainSelection:](*(_BYTE **)(a1 + 32), a2, 0, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (_BYTE)_filterBlockForBundleIdentifier:(void *)a3 contentIdentifierSet:(void *)a4 domainSelection:
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id *v11;
  _QWORD *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)v9;
  if (!a1)
    goto LABEL_20;
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection_, a1, CFSTR("HVQueue.m"), 889, CFSTR("Deletion call specifies both unique identifiers and domains."));

    goto LABEL_10;
  }
  if (v8 | v9)
  {
    if (!v9)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_232;
      v18[3] = &unk_24DD7EA08;
      v18[4] = a1;
      v11 = &v19;
      v19 = (id)v8;
      v12 = v18;
LABEL_16:
      a1 = (_BYTE *)MEMORY[0x22074FF64](v12);
LABEL_19:

      goto LABEL_20;
    }
LABEL_10:
    if (a1[24])
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection_, a1, CFSTR("HVQueue.m"), 912, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

      }
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_2;
      v23[3] = &unk_24DD7EA70;
      v23[4] = a1;
      v11 = &v24;
      v24 = v7;
      v25 = v10;
      a1 = (_BYTE *)MEMORY[0x22074FF64](v23);
      v13 = v25;
    }
    else
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_231;
      v20[3] = &unk_24DD7EA70;
      v20[4] = a1;
      v11 = &v21;
      v21 = v7;
      v22 = v10;
      a1 = (_BYTE *)MEMORY[0x22074FF64](v20);
      v13 = v22;
    }

    goto LABEL_19;
  }
  if (a1[24])
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection_, a1, CFSTR("HVQueue.m"), 894, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    }
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke;
    v26[3] = &unk_24DD7EA08;
    v26[4] = a1;
    v11 = &v27;
    v27 = v7;
    v12 = v26;
    goto LABEL_16;
  }
  a1 = &__block_literal_global_228;
LABEL_20:

  return a1;
}

void __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void (**v40)(_QWORD, _QWORD);
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id obj;
  void *context;
  _QWORD v49[5];
  id v50;
  id v51;
  int8x16_t v52;
  __int128 v53;
  char v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "memoryStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_22;
  hv_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    *(_DWORD *)buf = 138412290;
    v60 = v7;
    _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: reading from memory", buf, 0xCu);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v3, "memoryStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v56;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v56 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x22074FDF0]();
        -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "dequeuedContentIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", v16);

        if ((v18 & 1) == 0)
        {
          context = v15;
          v19 = v11;
          v20 = v12;
          objc_msgSend(*(id *)(a1 + 40), "deferredContentStates");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          HVDataSourceContentStateKey(objc_msgSend(*(id *)(a1 + 40), "dataSource"), v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23 || (v24 = *(unsigned __int8 *)(a1 + 80), v24 < objc_msgSend(v23, "levelOfService")))
          {
            objc_storeStrong(*(id **)(a1 + 64), v14);
            objc_msgSend(v3, "dequeuedContentIdentifiers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v16);

            objc_autoreleasePoolPop(context);
            goto LABEL_17;
          }

          v12 = v20;
          v11 = v19;
          v15 = context;
        }

        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_17:

  if (**(_QWORD **)(a1 + 64))
  {
    v26 = (void *)MEMORY[0x22074FDF0]();
    hv_default_log_handle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 32);
      v29 = *(_QWORD *)(v28 + 32);
      -[HVQueue _identifierForContent:]((unsigned __int8 *)v28, **(void ***)(a1 + 64));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = **(_QWORD **)(a1 + 64);
      *(_DWORD *)buf = 138412803;
      v60 = v29;
      v61 = 2112;
      v62 = v30;
      v63 = 2117;
      v64 = v31;
      _os_log_impl(&dword_21AA1D000, v27, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: read %@ from memory: %{sensitive}@", buf, 0x20u);

    }
    objc_msgSend(v3, "setDequeuedCount:", objc_msgSend(v3, "dequeuedCount") + 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_autoreleasePoolPop(v26);
  }
  else
  {
LABEL_22:
    if (!*(_BYTE *)(a1 + 81) && (objc_msgSend(v3, "diskStorageIsKnownToBeEmpty") & 1) == 0)
    {
      v32 = (void *)MEMORY[0x22074FDF0]();
      objc_msgSend(v3, "bookmark");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "los");
      v35 = *(unsigned __int8 *)(a1 + 80);

      if (v34 != v35)
      {
        objc_msgSend(v3, "bookmark");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "reset");

        v37 = *(unsigned __int8 *)(a1 + 80);
        objc_msgSend(v3, "bookmark");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setLos:", v37);

      }
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_175;
      v49[3] = &unk_24DD7E7E0;
      v53 = *(_OWORD *)(a1 + 64);
      v49[4] = *(_QWORD *)(a1 + 32);
      v39 = v3;
      v50 = v39;
      v51 = *(id *)(a1 + 40);
      v54 = *(_BYTE *)(a1 + 80);
      v52 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
      v40 = (void (**)(_QWORD, _QWORD))MEMORY[0x22074FF64](v49);
      v40[2](v40, 1);
      if (!**(_QWORD **)(a1 + 64))
        v40[2](v40, 0);

      objc_autoreleasePoolPop(v32);
      v41 = **(void ***)(a1 + 64);
      if (v41)
      {
        -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        hv_default_log_handle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
          v45 = **(_QWORD **)(a1 + 64);
          *(_DWORD *)buf = 138412803;
          v60 = v44;
          v61 = 2112;
          v62 = v42;
          v63 = 2117;
          v64 = v45;
          _os_log_impl(&dword_21AA1D000, v43, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: read %@ from disk: %{sensitive}@", buf, 0x20u);
        }

        objc_msgSend(v39, "dequeuedContentIdentifiers");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v42);

        objc_msgSend(v39, "setDequeuedCount:", objc_msgSend(v39, "dequeuedCount") + 1);
        objc_msgSend(v39, "setDiskStorageEventCount:", objc_msgSend(v39, "diskStorageEventCount")- (objc_msgSend(v39, "diskStorageEventCount") != 0));

      }
    }
  }

}

- (unsigned)_identifierForContent:(unsigned __int8 *)a1
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = a1[24];
    objc_msgSend(v3, "uniqueId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "bundleId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HVQueue _identifierForContentWithUniqueIdentifier:bundleId:]((uint64_t)a1, v6, v7);
      a1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HVQueue _identifierForContentWithUniqueIdentifier:bundleId:]((uint64_t)a1, v6, 0);
      a1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    }

  }
  return a1;
}

- (id)_identifierForContentWithUniqueIdentifier:(void *)a3 bundleId:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
    {
      v8 = (void *)MEMORY[0x22074FDF0]();
      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__identifierForContentWithUniqueIdentifier_bundleId_, a1, CFSTR("HVQueue.m"), 619, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

      }
      objc_opt_self();
      if (_bundleIdAllowedCharacterSet__pasOnceToken30 != -1)
        dispatch_once(&_bundleIdAllowedCharacterSet__pasOnceToken30, &__block_literal_global_186);
      v9 = (id)_bundleIdAllowedCharacterSet__pasExprOnceResult;
      objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@"), 0);
        hv_default_log_handle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          v14 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v18 = v14;
          v19 = 2112;
          v20 = v10;
          _os_log_fault_impl(&dword_21AA1D000, v11, OS_LOG_TYPE_FAULT, "HVQueue<%@>: _identifierForContentWithUniqueIdentifier called with nil uniqueId for bundleId %@", buf, 0x16u);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria())
          abort();
      }
      v16[0] = v10;
      v16[1] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(":"));
      a1 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v8);
    }
    else
    {
      v5 = v5;
      v10 = v7;
      a1 = (uint64_t)v5;
    }
  }
  else
  {
    v10 = v6;
  }

  return (id)a1;
}

- (BOOL)dequeueContent:(id *)a3 dataSourceContentState:(id)a4 minimumLevelOfService:(unsigned __int8)a5 inMemoryItemsOnly:(BOOL)a6 error:(id *)a7
{
  id v13;
  _PASLock *lock;
  id v15;
  int v16;
  BOOL v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  id *v23;
  SEL v24;
  unsigned __int8 v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v13 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__921;
  v31 = __Block_byref_object_dispose__922;
  v32 = 0;
  lock = self->_lock;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke;
  v19[3] = &unk_24DD7E808;
  v19[4] = self;
  v15 = v13;
  v25 = a5;
  v20 = v15;
  v21 = &v33;
  v26 = a6;
  v23 = a3;
  v24 = a2;
  v22 = &v27;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v19);
  v16 = *((unsigned __int8 *)v34 + 24);
  if (a7 && !*((_BYTE *)v34 + 24))
  {
    *a7 = objc_retainAutorelease((id)v28[5]);
    v16 = *((unsigned __int8 *)v34 + 24);
  }
  v17 = v16 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __55__HVQueue__updateMemoryQueueTransactionExtendingTimer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "diskStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v19, "memoryStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {

      v5 = v19;
    }
    else
    {
      objc_msgSend(v19, "memoryStorageTransaction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v19;
      if (v16)
      {
        objc_msgSend(v19, "setDiskStorageSource:", 0);
        objc_msgSend(v19, "setMemoryStorageTransaction:", 0);
        objc_msgSend(v19, "memoryStorageSigtermSource");
        v17 = objc_claimAutoreleasedReturnValue();
        dispatch_suspend(v17);

        objc_msgSend(v19, "memoryStorageIdleSource");
        v18 = objc_claimAutoreleasedReturnValue();
        dispatch_suspend(v18);

        goto LABEL_11;
      }
    }
    objc_msgSend(v5, "memoryStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        objc_msgSend(v19, "memoryStorageIdleSource");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = dispatch_time(0, 60000000000);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);

      }
      objc_msgSend(v19, "memoryStorageTransaction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = (void *)MEMORY[0x22074FDF0]();
        objc_msgSend(CFSTR("HVQueue-Memory-"), "stringByAppendingString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "UTF8String");
        v13 = (void *)os_transaction_create();
        objc_msgSend(v19, "setMemoryStorageTransaction:", v13);

        objc_msgSend(v19, "memoryStorageSigtermSource");
        v14 = objc_claimAutoreleasedReturnValue();
        dispatch_resume(v14);

        objc_msgSend(v19, "memoryStorageIdleSource");
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_resume(v15);

        objc_autoreleasePoolPop(v11);
      }
    }
  }
LABEL_11:

}

void __32__HVQueue_enqueueContent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  int v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x22074FDF0]();
  -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), *(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  v6 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(v3, "dequeuedContentIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

  objc_msgSend(v3, "memoryStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __32__HVQueue_enqueueContent_error___block_invoke_2;
  v42[3] = &unk_24DD7E6F0;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 32);
  v43 = v9;
  v44 = v10;
  v11 = v3;
  v45 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v42);

  objc_autoreleasePoolPop(v6);
  if (!objc_msgSend(v11, "isMemoryStorageFull")
    || objc_msgSend(v11, "memoryStorageLimit")
    && (objc_msgSend(v11, "diskStorage"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if ((objc_msgSend(v11, "isMemoryStorageFull") & 1) != 0)
    {
      objc_msgSend(v11, "memoryStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();

      hv_default_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        if (v14)
        {
          v17 = (void *)MEMORY[0x22074FDF0]();
          -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v17);
        }
        else
        {
          v18 = 0;
        }
        *(_DWORD *)buf = 138412802;
        v49 = v16;
        v50 = 2112;
        v51 = (uint64_t)v9;
        v52 = 2112;
        v53[0] = v18;
        _os_log_impl(&dword_21AA1D000, v15, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: writing %@ to memory (and flushing oldest in-memory item %@ to disk to make room)", buf, 0x20u);
        if (v14)

      }
      if (v14)
      {
        v24 = (void *)MEMORY[0x22074FDF0]();
        v25 = *(__CFString **)(a1 + 32);
        v47 = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HVQueue _writeEventsToDisk:guardedData:](v25, v26, v11);

        objc_msgSend(v11, "memoryStorage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeObjectAtIndex:", 0);

        objc_autoreleasePoolPop(v24);
      }
      else
      {
        hv_default_log_handle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          v37 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
          objc_msgSend(v11, "memoryStorage");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");
          v40 = objc_msgSend(v11, "memoryStorageLimit");
          objc_msgSend(v11, "memoryStorage");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413059;
          v49 = v37;
          v50 = 2048;
          v51 = v39;
          v52 = 1024;
          LODWORD(v53[0]) = v40;
          WORD2(v53[0]) = 2113;
          *(_QWORD *)((char *)v53 + 6) = v41;
          _os_log_fault_impl(&dword_21AA1D000, v31, OS_LOG_TYPE_FAULT, "HVQueue<%@>: enqueueContent: isMemoryStorageFull==YES but memoryStorage.firstObject was nil (memoryStorage.count=%tu, memoryStorageLimit=%d, memoryStorage=%{private}@)", buf, 0x26u);

        }
        if (_PASEvaluateLogFaultAndProbCrashCriteria())
          abort();
        v14 = 0;
      }
    }
    else
    {
      hv_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412546;
        v49 = v19;
        v50 = 2112;
        v51 = (uint64_t)v9;
        _os_log_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: writing %@ to memory", buf, 0x16u);
      }
    }

    hv_default_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412803;
      v49 = v30;
      v50 = 2112;
      v51 = (uint64_t)v9;
      v52 = 2117;
      v53[0] = v29;
      _os_log_impl(&dword_21AA1D000, v28, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: %@ %{sensitive}@", buf, 0x20u);
    }

    objc_msgSend(v11, "memoryStorage");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v20, "addObject:", *(_QWORD *)(a1 + 40));
    v23 = 1;
  }
  else if (objc_msgSend(v11, "memoryStorageLimit")
         || (objc_msgSend(v11, "diskStorage"), v32 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v32,
                                               !v32))
  {
    hv_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412803;
      v49 = v22;
      v50 = 2112;
      v51 = (uint64_t)v9;
      v52 = 2117;
      v53[0] = v21;
      _os_log_impl(&dword_21AA1D000, v20, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: memory storage full, no disk fallback -- dropping item %@! %{sensitive}@", buf, 0x20u);
    }
    v23 = 0;
  }
  else
  {
    hv_default_log_handle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(_QWORD *)(a1 + 40);
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412803;
      v49 = v35;
      v50 = 2112;
      v51 = (uint64_t)v9;
      v52 = 2117;
      v53[0] = v34;
      _os_log_impl(&dword_21AA1D000, v33, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: memory storage capacity is zero, immediately falling back to disk for newly enqueued item %@! %{sensitive}@", buf, 0x20u);
    }

    v36 = *(__CFString **)(a1 + 32);
    v46 = *(_QWORD *)(a1 + 40);
    v23 = 1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    -[HVQueue _writeEventsToDisk:guardedData:](v36, v20, v11);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(v11, "setEnqueuedCount:", objc_msgSend(v11, "enqueuedCount") + 1);
  -[HVQueue _updateMemoryQueueTransactionExtendingTimer:](*(_QWORD *)(a1 + 32), 1);

}

- (BOOL)enqueueContent:(id)a3 error:(id *)a4
{
  id v5;
  _PASLock *lock;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__HVQueue_enqueueContent_error___block_invoke;
  v9[3] = &unk_24DD7E718;
  v9[4] = self;
  v7 = v5;
  v10 = v7;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  LOBYTE(lock) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)lock;
}

- (uint64_t)_updateMemoryQueueTransactionExtendingTimer:(uint64_t)result
{
  void *v2;
  _QWORD v3[5];
  char v4;

  if (result)
  {
    v2 = *(void **)(result + 8);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __55__HVQueue__updateMemoryQueueTransactionExtendingTimer___block_invoke;
    v3[3] = &unk_24DD7E6A0;
    v4 = a2;
    v3[4] = result;
    return objc_msgSend(v2, "runWithLockAcquired:", v3);
  }
  return result;
}

- (HVQueue)initWithIdentifier:(id)a3 biomeStream:(id)a4 memoryLimit:(signed __int16)a5 contentProtection:(id)a6 contentExpectedFromMultipleApps:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  HVQueue *v16;
  HVQueue *v17;
  void *v18;
  void *v19;
  char *v20;
  uint64_t v21;
  _PASLock *lock;
  dispatch_semaphore_t v23;
  OS_dispatch_semaphore *contentConsumedSemaphore;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HVQueue;
  v16 = -[HVQueue init](&v29, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    if (v14)
    {
      location = 0;
      objc_initWeak(&location, v17);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __104__HVQueue_initWithIdentifier_biomeStream_memoryLimit_contentProtection_contentExpectedFromMultipleApps___block_invoke;
      v26[3] = &unk_24DD7E650;
      objc_copyWeak(&v27, &location);
      v18 = (void *)MEMORY[0x22074FF64](v26);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
      v19 = (void *)MEMORY[0x22074FF64](v18);

      v20 = -[HVQueueGuardedData initWithBiomeStream:memoryLimit:memoryStorageFlushCallback:]((char *)[HVQueueGuardedData alloc], v14, a5, v19);
    }
    else
    {
      v20 = -[HVQueueGuardedData initWithBiomeStream:memoryLimit:memoryStorageFlushCallback:]((char *)[HVQueueGuardedData alloc], 0, a5, 0);
      v19 = 0;
    }
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A610]), "initWithGuardedData:", v20);
    lock = v17->_lock;
    v17->_lock = (_PASLock *)v21;

    v23 = dispatch_semaphore_create(0);
    contentConsumedSemaphore = v17->_contentConsumedSemaphore;
    v17->_contentConsumedSemaphore = (OS_dispatch_semaphore *)v23;

    objc_storeStrong((id *)&v17->_contentProtection, a6);
    v17->_contentExpectedFromMultipleApps = a7;

  }
  return v17;
}

- (id)description
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__921;
  v10 = __Block_byref_object_dispose__922;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __22__HVQueue_description__block_invoke;
  v5[3] = &unk_24DD7E678;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)dequeuedContentConsumedWithError:(id *)a3
{
  _PASLock *lock;
  _QWORD v6[5];

  lock = self->_lock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__HVQueue_dequeuedContentConsumedWithError___block_invoke;
  v6[3] = &unk_24DD7E830;
  v6[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_contentConsumedSemaphore);
  return 1;
}

- (BOOL)dequeuedContentNotConsumed:(id)a3 error:(id *)a4
{
  id v5;
  _PASLock *lock;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__HVQueue_dequeuedContentNotConsumed_error___block_invoke;
  v9[3] = &unk_24DD7E858;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

  return 1;
}

- (id)statsWithError:(id *)a3
{
  _PASLock *lock;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__921;
  v11 = __Block_byref_object_dispose__922;
  v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __26__HVQueue_statsWithError___block_invoke;
  v6[3] = &unk_24DD7E678;
  v6[4] = self;
  v6[5] = &v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)diskStorageStreamCount
{
  _PASLock *lock;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__HVQueue_diskStorageStreamCount__block_invoke;
  v5[3] = &unk_24DD7EAE0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)cleanupWithError:(id *)a3 shouldContinueBlock:(id)a4
{
  id v5;
  void *v6;
  _PASLock *lock;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", -1209600.0);
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  lock = self->_lock;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__HVQueue_cleanupWithError_shouldContinueBlock___block_invoke;
  v12[3] = &unk_24DD7EB30;
  v12[4] = self;
  v13 = v6;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  -[_PASLock runWithLockAcquired:shouldContinueBlock:](lock, "runWithLockAcquired:shouldContinueBlock:", v12, v9);

  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentConsumedSemaphore, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __48__HVQueue_cleanupWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL (*v13)(uint64_t, void *, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t v23[4];
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE buf[24];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "diskStorageIsKnownToBeEmpty") & 1) == 0)
  {
    hv_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: starting cleanup tasks with cutoff date %@", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    objc_msgSend(v3, "diskStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __48__HVQueue_cleanupWithError_shouldContinueBlock___block_invoke_269;
    v14 = &unk_24DD7EB08;
    v15 = *(id *)(a1 + 48);
    v16 = &v19;
    v18 = *(_QWORD *)(a1 + 56);
    v17 = buf;
    objc_msgSend(v7, "pruneWithPredicateBlock:", &v11);

    if (!*((_BYTE *)v20 + 24))
    {
      objc_msgSend(v3, "setDiskStorageEventCount:", *(unsigned int *)(*(_QWORD *)&buf[8] + 24), v11, v12, v13, v14);
      if (!*(_DWORD *)(*(_QWORD *)&buf[8] + 24))
      {
        objc_msgSend(v3, "setDiskStorageIsKnownToBeEmpty:", 1);
        objc_msgSend(v3, "setDiskContentBloomFilter:", 0);
      }
    }
    hv_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v20 + 24))
        v9 = CFSTR("completed");
      else
        v9 = CFSTR("was asked to defer during");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)v23 = 138412546;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: %{public}@ cleanup tasks.", v23, 0x16u);
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(buf, 8);
  }

}

BOOL __48__HVQueue_cleanupWithError_shouldContinueBlock___block_invoke_269(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  id v7;
  double v8;
  double v9;
  double v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(uint64_t (**)(uint64_t))(v5 + 16);
  v7 = a2;
  if ((v6(v5) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  v10 = *(double *)(a1 + 56);
  if (v9 >= v10)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v9 < v10;
}

void __33__HVQueue_diskStorageStreamCount__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(a2, "diskStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publisherFromStartTime:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__HVQueue_diskStorageStreamCount__block_invoke_3;
  v6[3] = &unk_24DD7EAB8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_266, v6);

}

uint64_t __33__HVQueue_diskStorageStreamCount__block_invoke_3(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __26__HVQueue_statsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
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
  _QWORD v28[7];
  _QWORD v29[7];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[6];
  _QWORD v33[8];

  v33[6] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v33[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v32[0] = CFSTR("Identifier");
  v32[1] = CFSTR("Enqueued Count");
  v7 = (void *)0x24BDD1000;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "enqueuedCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v27;
  v32[2] = CFSTR("Dequeued Count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "dequeuedCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v26;
  v32[3] = CFSTR("Dequeued Identifiers");
  objc_msgSend(v6, "dequeuedContentIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v24;
  v32[4] = CFSTR("Memory");
  v30[0] = CFSTR("count");
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "memoryStorage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v22;
  v30[1] = CFSTR("limit");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", objc_msgSend(v6, "memoryStorageLimit"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v21;
  v30[2] = CFSTR("full");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isMemoryStorageFull"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v10;
  v32[5] = CFSTR("Disk");
  objc_msgSend(v6, "diskStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v28[0] = CFSTR("stream");
    objc_msgSend(v6, "diskStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    v28[1] = CFSTR("count");
    objc_msgSend(*(id *)(a1 + 32), "diskStorageStreamCount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    v28[2] = CFSTR("known to be empty");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "diskStorageIsKnownToBeEmpty"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v17;
    v28[3] = CFSTR("Bookmark");
    objc_msgSend(v6, "bookmark");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "jsonDict");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v3;
    v28[4] = CFSTR("Bloom filter hits");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "bloomFilterHits"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v4;
    v28[5] = CFSTR("Bloom filter hits (false positives)");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "bloomFilterFalsePositives"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v29[5] = v2;
    v28[6] = CFSTR("Bloom filter misses");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "bloomFilterMisses"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29[6] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 7);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("no disk queue");
  }
  v33[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (v11)
  {

  }
}

void __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "memoryStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

unsigned __int8 *__41__HVQueue__deleteWithFilter_memory_disk___block_invoke_3(uint64_t a1, void *a2)
{
  return -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), a2);
}

void __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_201(uint64_t a1, int a2)
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = 63;
  if (a2)
    v5 = 0;
  if (v4 > v5)
  {
    v6 = (void *)MEMORY[0x22074FDF0]();
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: deleteContentWithRequest: deleted identifiers %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    objc_autoreleasePoolPop(v6);
  }
}

uint64_t __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_202(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  if (!v5)
  {
    v9 = (void *)MEMORY[0x22074FDF0]();
LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    objc_autoreleasePoolPop(v9);
    v13 = 1;
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "personaId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      if (!*(_BYTE *)(v14 + 24))
      {
        *(_BYTE *)(v14 + 24) = 1;
        hv_default_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1 + 32);
          v20 = 138543362;
          v21 = v16;
          _os_log_impl(&dword_21AA1D000, v15, OS_LOG_TYPE_DEFAULT, "HVQueue<%{public}@>: deleteContentWithRequest: deleting events likely stored in V1 Biome persistence!", (uint8_t *)&v20, 0xCu);
        }

      }
      v9 = (void *)MEMORY[0x22074FDF0]();
      goto LABEL_12;
    }
  }
  v7 = (void *)MEMORY[0x22074FDF0]();
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_autoreleasePoolPop(v7);
  v9 = (void *)MEMORY[0x22074FDF0]();
  if ((v8 & 1) != 0)
  {
LABEL_12:
    v17 = *(void **)(a1 + 40);
    -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 48), v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    goto LABEL_13;
  }
  -[HVQueue _bundleIdForEvent:](*(__CFString **)(a1 + 48), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domainId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HVSpotlightDeletionRequest addDeletableContentWithBundleIdentifier:domainIdentifier:uniqueIdentifier:toBloomFilter:](HVSpotlightDeletionRequest, "addDeletableContentWithBundleIdentifier:domainIdentifier:uniqueIdentifier:toBloomFilter:", v10, v11, v12, *(_QWORD *)(a1 + 56));

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  objc_autoreleasePoolPop(v9);
  v13 = 0;
LABEL_14:

  return v13;
}

- (__CFString)_bundleIdForEvent:(__CFString *)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (LOBYTE(a1->length))
    {
      objc_msgSend(v3, "bundleId");
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = &stru_24DD7F8A8;
    }
  }

  return a1;
}

void __39__HVQueue__bundleIdAllowedCharacterSet__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("%:"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_bundleIdAllowedCharacterSet__pasExprOnceResult;
  _bundleIdAllowedCharacterSet__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

void __42__HVQueue__filterBlockForDeletionRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[HVQueue _filterBlockForBundleIdentifier:contentIdentifierSet:domainSelection:](*(_BYTE **)(a1 + 32), a2, 0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __42__HVQueue__filterBlockForDeletionRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__HVQueue__filterBlockForDeletionRequest___block_invoke_4;
  v11[3] = &unk_24DD7E9B8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v10 = v5;
  objc_msgSend(a3, "_pas_mappedSetWithTransform:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HVQueue _filterBlockForBundleIdentifier:contentIdentifierSet:domainSelection:](*(_BYTE **)(a1 + 32), v10, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

id __42__HVQueue__filterBlockForDeletionRequest___block_invoke_4(uint64_t a1, void *a2)
{
  return -[HVQueue _identifierForContentWithUniqueIdentifier:bundleId:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "bundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    hv_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v8;
      _os_log_fault_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_FAULT, "HVQueue<%@>: deletion for bundle %@ encountered event which does not respond to bundleId", (uint8_t *)&v10, 0x16u);
    }

    v5 = 1;
  }

  return v5;
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    hv_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v19 = 138412290;
      v20 = v7;
      v8 = "HVQueue<%@>: deleting null event";
      v9 = v4;
      v10 = 12;
LABEL_11:
      _os_log_fault_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v19, v10);
    }
LABEL_16:
    v6 = 1;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    hv_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v13 = *(_QWORD *)(a1 + 48);
      v19 = 138412802;
      v20 = v12;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v13;
      v8 = "HVQueue<%@>: deletion for bundle %@ domain %@ encountered event which does not respond to bundleId";
      v9 = v4;
      v10 = 32;
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  objc_msgSend(v3, "bundleId");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqualToString:](v4, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    v6 = 0;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    hv_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = 138412802;
      v20 = v17;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v18;
      _os_log_fault_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_FAULT, "HVQueue<%@>: deletion for bundle %@ domain %@ encountered event which does not respond to domainId", (uint8_t *)&v19, 0x20u);
    }

    goto LABEL_16;
  }
  objc_msgSend(v3, "domainId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(*(id *)(a1 + 48), "containsDomain:", v5);
  else
    v6 = 0;

LABEL_17:
  return v6;
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_231(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    hv_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      v5 = 1;
      goto LABEL_11;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v15 = 138412290;
    v16 = v7;
    v8 = "HVQueue<%@>: deleting null event";
    v9 = v6;
    v10 = 12;
LABEL_13:
    _os_log_fault_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v15, v10);
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    hv_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = 138412802;
    v16 = v13;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    v8 = "HVQueue<%@>: deletion for bundle %@ domain %@ encountered event which does not respond to domainId";
    v9 = v6;
    v10 = 32;
    goto LABEL_13;
  }
  objc_msgSend(v3, "domainId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(*(id *)(a1 + 48), "containsDomain:", v4);
  else
    v5 = 0;

LABEL_11:
  return v5;
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_232(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    hv_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v11 = 138412290;
      v12 = v7;
      _os_log_fault_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_FAULT, "HVQueue<%@>: deleting null event", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_9;
  }
  -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    hv_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v11 = 138412547;
      v12 = v10;
      v13 = 2117;
      v14 = v3;
      _os_log_fault_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_FAULT, "HVQueue<%@>: unable to generate content identifier for event, will delete to be safe: %{sensitive}@", (uint8_t *)&v11, 0x16u);
    }

    v5 = 0;
LABEL_9:
    v6 = 1;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4);
LABEL_10:

  return v6;
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_227()
{
  return 1;
}

void __44__HVQueue_dequeuedContentNotConsumed_error___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  -[HVQueue _identifierForContent:](v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeuedContentNotConsumed: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(v5, "dequeuedContentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v6);
}

void __44__HVQueue_dequeuedContentConsumedWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  HVSpotlightDeletionRequest *v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  _BYTE *v44;
  void *v45;
  void *v46;
  void *context;
  id v48;
  uint64_t v49;
  id v50;
  _BYTE *v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  _BYTE v63[24];
  void *v64;
  id v65;
  _BYTE buf[12];
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(v3, "dequeuedContentIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(v3, "dequeuedContentIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v5;
    v67 = 2048;
    v68 = v7;
    v69 = 2112;
    v70 = v8;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeuedContentConsumedWithError count:%tu, content:%@", buf, 0x20u);

  }
  objc_msgSend(v3, "dequeuedContentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v3, "diskContentBloomFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = *(_BYTE **)(a1 + 32);
      objc_msgSend(v3, "dequeuedContentIdentifiers");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (v12[24])
        {
          v51 = v12;
          v49 = a1;
          v50 = v3;
          context = (void *)MEMORY[0x22074FDF0]();
          v52 = (void *)objc_opt_new();
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v48 = v13;
          obj = v13;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, buf, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v59;
            v17 = CFSTR(":");
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v59 != v16)
                  objc_enumerationMutation(obj);
                v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                v20 = (void *)MEMORY[0x22074FDF0]();
                v21 = objc_msgSend(v19, "rangeOfString:options:", v17, 2);
                if (v21 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  hv_default_log_handle();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
                  {
                    v33 = *((_QWORD *)v51 + 4);
                    *(_DWORD *)v63 = 138412547;
                    *(_QWORD *)&v63[4] = v33;
                    *(_WORD *)&v63[12] = 2113;
                    *(_QWORD *)&v63[14] = v19;
                    _os_log_fault_impl(&dword_21AA1D000, v23, OS_LOG_TYPE_FAULT, "HVQueue<%@>: _spotlightDeletionRequestsForContentIdentifiers found a contentIdentifier missing a colon even though _contentExpectedFromMultipleApps=YES: %{private}@", v63, 0x16u);
                  }

                  if (_PASEvaluateLogFaultAndProbCrashCriteria())
                    abort();
                }
                else
                {
                  v24 = v21;
                  v25 = v22;
                  v26 = v17;
                  objc_msgSend(v19, "substringToIndex:", v21);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "stringByRemovingPercentEncoding");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v28)
                  {
                    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__spotlightDeletionRequestsForContentIdentifiers_, v51, CFSTR("HVQueue.m"), 821, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

                  }
                  objc_msgSend(v19, "substringFromIndex:", v24 + v25);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "objectForKeyedSubscript:", v28);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v30;
                  if (v30)
                  {
                    v32 = v30;
                  }
                  else
                  {
                    v32 = (id)objc_opt_new();
                    objc_msgSend(v52, "setObject:forKeyedSubscript:", v32, v28);
                  }
                  v17 = v26;

                  objc_msgSend(v32, "addObject:", v29);
                }
                objc_autoreleasePoolPop(v20);
              }
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, buf, 16);
            }
            while (v15);
          }

          objc_msgSend(v52, "allKeys");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v63 = MEMORY[0x24BDAC760];
          *(_QWORD *)&v63[8] = 3221225472;
          *(_QWORD *)&v63[16] = __59__HVQueue__spotlightDeletionRequestsForContentIdentifiers___block_invoke;
          v64 = &unk_24DD7E940;
          v65 = v52;
          v36 = v52;
          objc_msgSend(v35, "_pas_mappedArrayWithTransform:", v63);
          v12 = (_BYTE *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(context);
          a1 = v49;
          v3 = v50;
          v13 = v48;
        }
        else
        {
          v38 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:uniqueIdentifiers:]([HVSpotlightDeletionRequest alloc], "initWithBundleIdentifier:uniqueIdentifiers:", &stru_24DD7F8A8, v13);
          *(_QWORD *)buf = v38;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
          v12 = (_BYTE *)objc_claimAutoreleasedReturnValue();

        }
      }

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v39 = v12;
      v37 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v37)
      {
        v40 = *(_QWORD *)v55;
        while (2)
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v55 != v40)
              objc_enumerationMutation(v39);
            v42 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            objc_msgSend(v3, "diskContentBloomFilter");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v42) = objc_msgSend(v42, "matchesBloomFilter:", v43);

            if ((v42 & 1) != 0)
            {
              LOBYTE(v37) = 1;
              goto LABEL_38;
            }
          }
          v37 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v37)
            continue;
          break;
        }
      }
LABEL_38:

    }
    else
    {
      LOBYTE(v37) = 1;
    }
    v44 = *(_BYTE **)(a1 + 32);
    objc_msgSend(v3, "dequeuedContentIdentifiers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      -[HVQueue _filterBlockForBundleIdentifier:contentIdentifierSet:domainSelection:](v44, 0, v45, 0);
      v44 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    }

    -[HVQueue _deleteWithFilter:memory:disk:](*(_QWORD *)(a1 + 32), v44, v37);
    objc_msgSend(v3, "dequeuedContentIdentifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeAllObjects");

  }
}

HVSpotlightDeletionRequest *__59__HVQueue__spotlightDeletionRequestsForContentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HVSpotlightDeletionRequest *v4;
  void *v5;
  HVSpotlightDeletionRequest *v6;

  v3 = a2;
  v4 = [HVSpotlightDeletionRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:uniqueIdentifiers:](v4, "initWithBundleIdentifier:uniqueIdentifiers:", v3, v5);

  return v6;
}

void __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_175(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  __int128 v30;
  char v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  id v40;
  uint64_t *v41;
  char v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;

  if (**(_QWORD **)(a1 + 72))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 32);
    if (a2)
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v27 = *(_QWORD *)(a1 + 80);
    -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), **(void ***)(a1 + 72));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v27, v25, CFSTR("HVQueue.m"), 451, CFSTR("enumerateBiome(%@) called even though *content is nonnil (%@)"), v26, v28);

  }
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    objc_msgSend(v4, "futureCutoff");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
    objc_msgSend(*(id *)(a1 + 40), "bookmark");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureBookmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "bookmark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureCutoff");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "pastBookmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "diskStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "publisherWithStartTime:endTime:maxEvents:reversed:", 0, v9, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0;
  v12 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_2;
  v37[3] = &unk_24DD7E768;
  v41 = &v43;
  v13 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v38 = v13;
  v39 = v14;
  v40 = *(id *)(a1 + 48);
  v42 = *(_BYTE *)(a1 + 88);
  objc_msgSend(v11, "filterWithIsIncluded:", v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  v32[1] = 3221225472;
  v32[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_3;
  v32[3] = &unk_24DD7E790;
  v36 = a2;
  v16 = *(void **)(a1 + 40);
  v32[4] = *(_QWORD *)(a1 + 32);
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 56);
  v33 = v17;
  v34 = v18;
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_184;
  v29[3] = &unk_24DD7E7B8;
  v29[4] = *(_QWORD *)(a1 + 32);
  v31 = a2;
  v19 = *(_OWORD *)(a1 + 64);
  v35 = *(_QWORD *)(a1 + 64);
  v30 = v19;
  v20 = (id)objc_msgSend(v15, "drivableSinkWithBookmark:completion:shouldContinue:", v8, v32, v29);

  if (a2)
  {
    if (**(_QWORD **)(a1 + 72) || v44[3] == 0.0)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bookmark");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFutureCutoff:", v21);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "futureCutoff");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
LABEL_13:

    goto LABEL_14;
  }
  v23 = v44[3];

  if (v23 != 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v44[3]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bookmark");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFutureCutoff:", v21);
    goto LABEL_13;
  }
LABEL_14:

  _Block_object_dispose(&v43, 8);
}

BOOL __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;

  v3 = a2;
  v4 = (void *)MEMORY[0x22074FDF0]();
  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(v3, "timestamp");
  if (v5 >= v6)
    v6 = v5;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
  objc_msgSend(v3, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_msgSend(*(id *)(a1 + 32), "dequeuedContentIdentifiers"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 40), v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "containsObject:", v9),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 48), "deferredContentStates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HVDataSourceContentStateKey(objc_msgSend(*(id *)(a1 + 48), "dataSource"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 1;
    if (v14)
    {
      v15 = *(unsigned __int8 *)(a1 + 64);
      if (v15 >= objc_msgSend(v14, "levelOfService"))
        v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v11;
}

void __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "state"))
  {
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 64))
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(v5, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: drivableSinkWithBookmark frontfill: %@ error: %@", (uint8_t *)&v17, 0x20u);

    }
    v11 = *(unsigned __int8 *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "bookmark");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      objc_msgSend(v12, "setFutureBookmark:", v6);
    else
      objc_msgSend(v12, "setPastBookmark:", v6);

    objc_msgSend(v5, "error");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

uint64_t __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_184(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void **v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v6 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 56))
      v6 = CFSTR("NO");
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: reading from disk (frontfill: %@)", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(v3, "eventBody");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(void ***)(a1 + 48);
  v9 = *v8;
  *v8 = (void *)v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return 0;
}

void __32__HVQueue_enqueueContent_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x22074FDF0]();
  -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 40), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v10);

  if ((_DWORD)v8)
  {
    hv_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v12;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_21AA1D000, v11, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: %@ is already in memory queue at position %tu, existing item will be removed for updated item sharing identical identifier", (uint8_t *)&v15, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "memoryStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", a3);

    *a4 = 1;
  }

}

- (void)_writeEventsToDisk:(void *)a3 guardedData:
{
  id v5;
  id *v6;
  void *v7;
  NSObject *v8;
  void *isa;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  __CFString *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v28 = a1;
  if (a1)
  {
    v7 = (void *)MEMORY[0x22074FDF0]();
    if (objc_msgSend(v5, "count"))
    {
      v25 = v7;
      hv_default_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        isa = v28[1].isa;
        v10 = objc_msgSend(v5, "count");
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __42__HVQueue__writeEventsToDisk_guardedData___block_invoke;
        v33[3] = &unk_24DD7E740;
        v33[4] = v28;
        objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = isa;
        v37 = 2048;
        v38 = v10;
        v39 = 2112;
        v40 = v11;
        _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: _writeEventsToDisk will write %tu items to disk: %@", buf, 0x20u);

      }
      if (v6)
        objc_msgSend(v6[12], "setFutureBookmark:", 0);
      objc_msgSend(v6, "setDiskStorageIsKnownToBeEmpty:", 0);
      objc_msgSend(v6, "setDiskStorageEventCount:", objc_msgSend(v6, "diskStorageEventCount") + objc_msgSend(v5, "count"));
      objc_msgSend(v6, "diskContentBloomFilter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "diskStorageSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(v6, "diskStorage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "source");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setDiskStorageSource:", v13);
        if (!v13)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel__writeEventsToDisk_guardedData_, v28, CFSTR("HVQueue.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("diskStorageSource"));

          v13 = 0;
        }
      }
      v26 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      obj = v5;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v30 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x22074FDF0]();
            objc_msgSend(v13, "sendEvent:", v19);
            if (v12)
            {
              -[HVQueue _bundleIdForEvent:](v28, v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "domainId");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "uniqueId");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              +[HVSpotlightDeletionRequest addDeletableContentWithBundleIdentifier:domainIdentifier:uniqueIdentifier:toBloomFilter:](HVSpotlightDeletionRequest, "addDeletableContentWithBundleIdentifier:domainIdentifier:uniqueIdentifier:toBloomFilter:", v21, v22, v23, v12);

            }
            objc_autoreleasePoolPop(v20);
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v16);
      }

      v5 = v26;
      v7 = v25;
    }
    objc_autoreleasePoolPop(v7);
  }

}

unsigned __int8 *__42__HVQueue__writeEventsToDisk_guardedData___block_invoke(uint64_t a1, void *a2)
{
  return -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), a2);
}

void __22__HVQueue_description__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v4, "memoryStorage");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v15, "count");
  v8 = objc_msgSend(v4, "memoryStorageLimit");
  v9 = objc_msgSend(v4, "isMemoryStorageFull");
  objc_msgSend(v4, "diskStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeuedContentIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v5, "initWithFormat:", CFSTR("<HVQueue i:%@ m.count:%tu m.limit:%hi m.full:%d d:%@ dc.count:%tu>"), v6, v7, v8, v9, v10, objc_msgSend(v11, "count"));
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

void __104__HVQueue_initWithIdentifier_biomeStream_memoryLimit_contentProtection_contentExpectedFromMultipleApps___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 1);
    v5[1] = 3221225472;
    v5[2] = __34__HVQueue__flushMemoryQueueToDisk__block_invoke;
    v5[3] = &unk_24DD7E6C8;
    v5[4] = v2;
    v5[5] = sel__flushMemoryQueueToDisk;
    v4 = v2;
    v5[0] = MEMORY[0x24BDAC760];
    objc_msgSend(v3, "runWithLockAcquired:", v5);
    v2 = v4;
  }

}

void __34__HVQueue__flushMemoryQueueToDisk__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "diskStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HVQueue.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("guardedData.diskStorage != nil"));

  }
  objc_msgSend(v3, "memoryStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    hv_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(v3, "memoryStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v8;
      v16 = 2048;
      v17 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: Flushing memory queue to disk (%tu items)", buf, 0x16u);

    }
    v10 = *(__CFString **)(a1 + 32);
    objc_msgSend(v3, "memoryStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HVQueue _writeEventsToDisk:guardedData:](v10, v11, v3);

    objc_msgSend(v3, "memoryStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    -[HVQueue _updateMemoryQueueTransactionExtendingTimer:](*(_QWORD *)(a1 + 32), 0);
  }

}

- (unsigned)waitForDequeuedContentConsumedWithTimeout:(double)a3
{
  return objc_msgSend(MEMORY[0x24BE7A5D8], "waitForSemaphore:timeoutSeconds:", self->_contentConsumedSemaphore, a3);
}

- (id)uniqueIdentifiersInDiskStorage
{
  void *v3;
  _PASLock *lock;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  lock = self->_lock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HVQueue_TestHelpers__uniqueIdentifiersInDiskStorage__block_invoke;
  v7[3] = &unk_24DD7E830;
  v5 = v3;
  v8 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

  return v5;
}

- (id)uniqueIdentifiersInMemoryStorage
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__921;
  v10 = __Block_byref_object_dispose__922;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__HVQueue_TestHelpers__uniqueIdentifiersInMemoryStorage__block_invoke;
  v5[3] = &unk_24DD7EAE0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__HVQueue_TestHelpers__uniqueIdentifiersInMemoryStorage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "memoryStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_310);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __56__HVQueue_TestHelpers__uniqueIdentifiersInMemoryStorage__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueId");
}

void __54__HVQueue_TestHelpers__uniqueIdentifiersInDiskStorage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "diskStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publisherFromStartTime:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__HVQueue_TestHelpers__uniqueIdentifiersInDiskStorage__block_invoke_3;
  v6[3] = &unk_24DD7EF30;
  v7 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_307, v6);

}

void __54__HVQueue_TestHelpers__uniqueIdentifiersInDiskStorage__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "eventBody");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
