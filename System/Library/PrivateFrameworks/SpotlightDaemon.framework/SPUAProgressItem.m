@implementation SPUAProgressItem

+ (void)initialize
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v2, (dispatch_qos_class_t)5u, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.spotlight.index.buckets", v3);
    v5 = (void *)sBatchDeleteQueue;
    sBatchDeleteQueue = (uint64_t)v4;

    v6 = objc_opt_new();
    v7 = (void *)sDeleteBatches;
    sDeleteBatches = v6;

    v8 = objc_opt_new();
    v9 = (void *)sUserActionItems;
    sUserActionItems = v8;

    sTotalOutstandingDeletes = 0;
  }
}

- (SPUAProgressItem)initWithBundleID:(id)a3 uaID:(id)a4 relatedID:(id)a5
{
  id v9;
  id v10;
  id v11;
  SPUAProgressItem *v12;
  SPUAProgressItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SPUAProgressItem;
  v12 = -[SPUAProgressItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    objc_storeStrong((id *)&v13->_uaID, a4);
    objc_storeStrong((id *)&v13->_relatedID, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *bundleID;
  void *v7;
  NSString *uaID;
  void *v9;
  NSString *relatedID;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    bundleID = self->_bundleID;
    objc_msgSend(v5, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](bundleID, "isEqual:", v7))
    {
      uaID = self->_uaID;
      objc_msgSend(v5, "uaID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](uaID, "isEqual:", v9))
      {
        relatedID = self->_relatedID;
        objc_msgSend(v5, "relatedID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqual:](relatedID, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SPUAProgressItem uaID](self, "uaID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)add
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];

  if (self->_expectedCount)
  {
    v2 = sBatchDeleteQueue;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __23__SPUAProgressItem_add__block_invoke;
    v4[3] = &unk_24D0EA758;
    v4[4] = self;
    _setup_block(v4, 0, 17439);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, v3);

  }
}

void __23__SPUAProgressItem_add__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)sUserActionItems, "member:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "setExpectedCount:", *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) + objc_msgSend(v2, "expectedCount"));
  else
    objc_msgSend((id)sUserActionItems, "addObject:", *(_QWORD *)(a1 + 32));

}

+ (void)queueRelatedDelete:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = sBatchDeleteQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__SPUAProgressItem_queueRelatedDelete_forBundleID___block_invoke;
  v11[3] = &unk_24D0EA9D8;
  v12 = v6;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  _setup_block(v11, 0, 17446);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v10);

}

void __51__SPUAProgressItem_queueRelatedDelete_forBundleID___block_invoke(uint64_t a1)
{
  _queueRelatedDelete(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)update:(int)a3
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  int v6;

  v3 = sBatchDeleteQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__SPUAProgressItem_update___block_invoke;
  v5[3] = &unk_24D0ED928;
  v5[4] = self;
  v6 = a3;
  _setup_block(v5, 0, 17478);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, v4);

}

void __27__SPUAProgressItem_update___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)sUserActionItems, "member:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    LODWORD(v4) = objc_msgSend(v2, "deleteCount");
    LODWORD(v5) = objc_msgSend(v3, "completeCount");
    v6 = objc_msgSend(v3, "errorCount");
    LODWORD(v7) = v6;
    v8 = *(_DWORD *)(a1 + 40);
    if (v8 == 2)
    {
      v4 = (v4 + 1);
      objc_msgSend(v3, "setDeleteCount:", v4);
    }
    else if (v8)
    {
      v7 = (v6 + 1);
      objc_msgSend(v3, "setErrorCount:", v7);
    }
    else
    {
      v5 = (v5 + 1);
      objc_msgSend(v3, "setCompleteCount:", v5);
    }
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_DWORD *)(a1 + 40);
      objc_msgSend(v3, "bundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "relatedID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uaID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = 67111170;
      v17[1] = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      v24 = 1024;
      v25 = v7;
      v26 = 1024;
      v27 = objc_msgSend(v3, "expectedCount");
      v28 = 1024;
      v29 = v5;
      v30 = 1024;
      v31 = v4;
      v32 = 1024;
      v33 = v7;
      _os_log_debug_impl(&dword_213CF1000, v9, OS_LOG_TYPE_DEBUG, "update relatedItem(%d) %@:%@:%@ %d:%d:%d:%d:%d", (uint8_t *)v17, 0x44u);

    }
    v10 = v5 + v4 + objc_msgSend(v3, "errorCount");
    if (v10 >= objc_msgSend(v3, "expectedCount"))
    {
      objc_msgSend((id)sUserActionItems, "removeObject:", v3);
      if ((_DWORD)v4)
      {
        if (!(_DWORD)v5)
        {
          objc_msgSend(v3, "bundleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "relatedID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          _queueRelatedDelete(v11, v12);

        }
      }
    }
  }

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)uaID
{
  return self->_uaID;
}

- (void)setUaID:(id)a3
{
  objc_storeStrong((id *)&self->_uaID, a3);
}

- (NSString)relatedID
{
  return self->_relatedID;
}

- (void)setRelatedID:(id)a3
{
  objc_storeStrong((id *)&self->_relatedID, a3);
}

- (unsigned)expectedCount
{
  return self->_expectedCount;
}

- (void)setExpectedCount:(unsigned int)a3
{
  self->_expectedCount = a3;
}

- (unsigned)completeCount
{
  return self->_completeCount;
}

- (void)setCompleteCount:(unsigned int)a3
{
  self->_completeCount = a3;
}

- (unsigned)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(unsigned int)a3
{
  self->_errorCount = a3;
}

- (unsigned)deleteCount
{
  return self->_deleteCount;
}

- (void)setDeleteCount:(unsigned int)a3
{
  self->_deleteCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedID, 0);
  objc_storeStrong((id *)&self->_uaID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
