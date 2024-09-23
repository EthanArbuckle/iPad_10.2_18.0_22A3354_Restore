@implementation QUModelFactory

void __50__QUModelFactory_getModelForLocale_withTimeoutMS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = a2;
  objc_msgSend(v7, "lock");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(v9 + 24);

  if (v10 != v8)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      goto LABEL_14;
    }
    LODWORD(v23) = 138412290;
    *(_QWORD *)((char *)&v23 + 4) = v6;
    v12 = "[QPNLU] QU model changed before load complete error: %@";
    v13 = v11;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
LABEL_4:
    _os_log_impl(&dword_244EAA000, v13, v14, v12, (uint8_t *)&v23, v15);
    goto LABEL_5;
  }
  if (*(_DWORD *)(v9 + 16) == 2)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_244EAA000, v16, OS_LOG_TYPE_DEFAULT, "[QPNLU] Waking threads blocked on load", (uint8_t *)&v23, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "broadcast");
  }
  v17 = *(_QWORD *)(a1 + 32);
  if (!v6)
  {
    *(_DWORD *)(v17 + 16) = 3;
    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    LOWORD(v23) = 0;
    v12 = "[QPNLU] QU model loaded";
    v13 = v11;
    v14 = OS_LOG_TYPE_DEFAULT;
    v15 = 2;
    goto LABEL_4;
  }
  objc_storeStrong((id *)(v17 + 56), a3);
  objc_msgSend((id)objc_opt_class(), "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v23) = 138412290;
    *(_QWORD *)((char *)&v23 + 4) = v6;
    _os_log_impl(&dword_244EAA000, v18, OS_LOG_TYPE_ERROR, "[QPNLU] QU model load failed error: %@", (uint8_t *)&v23, 0xCu);
  }

  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 24);
  *(_QWORD *)(v19 + 24) = 0;

  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
LABEL_14:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock", v23);

}

- (id)getModelForLocale:(id)a3 withTimeoutMS:(unsigned int)a4
{
  id v6;
  NSSet *unsupportedLocaleIdentifiers;
  void *v8;
  NSError *v9;
  NSError *loadError;
  QUUnderstandingModel *v11;
  id releaseBlock;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  U2OwlModel *v20;
  QUUnderstandingModel *quModel;
  OS_os_transaction *v22;
  OS_os_transaction *transaction;
  NSError *v24;
  QUUnderstandingModel *v25;
  int state;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[5];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  unsupportedLocaleIdentifiers = self->_unsupportedLocaleIdentifiers;
  objc_msgSend(v6, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(unsupportedLocaleIdentifiers) = -[NSSet containsObject:](unsupportedLocaleIdentifiers, "containsObject:", v8);

  -[NSCondition lock](self->_condition, "lock");
  if ((_DWORD)unsupportedLocaleIdentifiers)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.QueryParser.QUModelError"), -9002, 0);
    v9 = (NSError *)objc_claimAutoreleasedReturnValue();
    loadError = self->_loadError;
    self->_loadError = v9;

    -[NSCondition unlock](self->_condition, "unlock");
    v11 = 0;
  }
  else
  {
    releaseBlock = self->_releaseBlock;
    if (releaseBlock)
    {
      dispatch_block_cancel(releaseBlock);
      v13 = self->_releaseBlock;
      self->_releaseBlock = 0;

    }
    -[QUUnderstandingModel locale](self->_quModel, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if ((v17 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "localeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v19;
        _os_log_impl(&dword_244EAA000, v18, OS_LOG_TYPE_INFO, "[QPNLU] QU creating new model for %@", buf, 0xCu);

      }
      v20 = -[U2OwlModel initWithLocale:]([U2OwlModel alloc], "initWithLocale:", v6);
      quModel = self->_quModel;
      self->_quModel = (QUUnderstandingModel *)v20;

      v22 = (OS_os_transaction *)os_transaction_create();
      transaction = self->_transaction;
      self->_transaction = v22;

      v24 = self->_loadError;
      self->_loadError = 0;

      self->_state = 1;
      v25 = self->_quModel;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __50__QUModelFactory_getModelForLocale_withTimeoutMS___block_invoke;
      v31[3] = &unk_2515EC298;
      v31[4] = self;
      -[QUUnderstandingModel loadWithCompletionHandler:](v25, "loadWithCompletionHandler:", v31);
    }
    state = self->_state;
    if (a4 && state != 3)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_244EAA000, v27, OS_LOG_TYPE_DEFAULT, "[QPNLU] Waiting for model load", buf, 2u);
      }

      self->_state = 2;
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)a4 / 1000.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", v28);
      objc_msgSend((id)objc_opt_class(), "log");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_244EAA000, v29, OS_LOG_TYPE_DEFAULT, "[QPNLU] Done waiting", buf, 2u);
      }

      if (self->_state == 2)
        self->_state = 1;

      state = self->_state;
    }
    if (state == 3)
      v11 = self->_quModel;
    else
      v11 = 0;
    -[NSCondition unlock](self->_condition, "unlock");
  }

  return v11;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__QUModelFactory_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __21__QUModelFactory_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.queryunderstanding", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

void __32__QUModelFactory_sharedInstance__block_invoke()
{
  QUModelFactory *v0;
  void *v1;

  v0 = objc_alloc_init(QUModelFactory);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

+ (BOOL)useSpotlightResources
{
  return +[U2HeadWrapper useSpotlightResources](U2HeadWrapper, "useSpotlightResources");
}

+ (void)setUseSpotlightResources:(BOOL)a3
{
  +[U2HeadWrapper setUseSpotlightResources:](U2HeadWrapper, "setUseSpotlightResources:", a3);
}

+ (NSBundle)U2HeadBundle
{
  return +[U2HeadWrapper U2HeadBundle](U2HeadWrapper, "U2HeadBundle");
}

+ (void)setU2HeadBundle:(id)a3
{
  +[U2HeadWrapper setU2HeadBundle:](U2HeadWrapper, "setU2HeadBundle:", a3);
}

- (QUModelFactory)init
{
  QUModelFactory *v2;
  NSCondition *v3;
  NSCondition *condition;
  OS_os_transaction *transaction;
  id releaseBlock;
  uint64_t v7;
  NSSet *unsupportedLocaleIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)QUModelFactory;
  v2 = -[QUModelFactory init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    condition = v2->_condition;
    v2->_condition = v3;

    transaction = v2->_transaction;
    v2->_transaction = 0;

    releaseBlock = v2->_releaseBlock;
    v2->_releaseBlock = 0;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("en_IN"), CFSTR("en-IN"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    unsupportedLocaleIdentifiers = v2->_unsupportedLocaleIdentifiers;
    v2->_unsupportedLocaleIdentifiers = (NSSet *)v7;

  }
  return v2;
}

- (id)quModel
{
  return self->_quModel;
}

- (void)releaseModel
{
  NSError *loadError;
  id releaseBlock;
  id v5;
  NSObject *v6;
  QUUnderstandingModel *quModel;
  OS_os_transaction *transaction;
  uint8_t v9[16];

  -[NSCondition lock](self->_condition, "lock");
  loadError = self->_loadError;
  self->_loadError = 0;

  releaseBlock = self->_releaseBlock;
  if (releaseBlock)
  {
    dispatch_block_cancel(releaseBlock);
    v5 = self->_releaseBlock;
    self->_releaseBlock = 0;

  }
  if (self->_quModel)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_244EAA000, v6, OS_LOG_TYPE_INFO, "[QPNLU] QU model released.", v9, 2u);
    }

    quModel = self->_quModel;
    self->_quModel = 0;

    transaction = self->_transaction;
    self->_transaction = 0;

  }
  if (self->_state == 2)
    -[NSCondition broadcast](self->_condition, "broadcast");
  self->_state = 0;
  -[NSCondition unlock](self->_condition, "unlock");
}

- (NSError)loadError
{
  NSError *v3;

  -[NSCondition lock](self->_condition, "lock");
  v3 = self->_loadError;
  -[NSCondition unlock](self->_condition, "unlock");
  return v3;
}

- (void)setLoadError:(id)a3
{
  objc_storeStrong((id *)&self->_loadError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadError, 0);
  objc_storeStrong(&self->_releaseBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_unsupportedLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_quModel, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
