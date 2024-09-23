@implementation SEMProvisionalResourceManager

- (SEMProvisionalResourceManager)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMProvisionalResourceManager)initWithResourceName:(id)a3 lifespan:(double)a4 activationBlock:(id)a5 deactivationBlock:(id)a6 serializeOperations:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  SEMProvisionalResourceManager *v17;
  uint64_t v18;
  NSString *resourceName;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id activationBlock;
  uint64_t v24;
  id deactivationBlock;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *activationQueue;
  NSObject *v29;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *expirationQueue;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  void *v43;
  SEMProvisionalResourceManager *v44;
  NSObject *v45;
  dispatch_queue_t v46;
  OS_dispatch_queue *operationQueue;
  objc_super v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v7 = a7;
  v54 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v49.receiver = self;
  v49.super_class = (Class)SEMProvisionalResourceManager;
  v17 = -[SEMProvisionalResourceManager init](&v49, sel_init);
  if (!v17)
  {
LABEL_20:
    v44 = v17;
    goto LABEL_21;
  }
  v18 = objc_msgSend_copy(v12, v15, v16);
  resourceName = v17->_resourceName;
  v17->_resourceName = (NSString *)v18;

  if (!objc_msgSend_length(v17->_resourceName, v20, v21))
  {
    v34 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[SEMProvisionalResourceManager initWithResourceName:lifespan:activationBlock:deactivationBlock:serializeOperations:]";
      v52 = 2112;
      v53 = v12;
      _os_log_error_impl(&dword_2462C4000, v34, OS_LOG_TYPE_ERROR, "%s Resource name must be nonempty. Received: %@", buf, 0x16u);
    }
    goto LABEL_17;
  }
  v17->_expirationInterval = a4;
  if (a4 <= 0.0)
  {
    v35 = (void *)qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v36 = (void *)MEMORY[0x24BDD16E0];
    v37 = v35;
    objc_msgSend_numberWithDouble_(v36, v38, v39, a4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v51 = "-[SEMProvisionalResourceManager initWithResourceName:lifespan:activationBlock:deactivationBlock:serializeOperations:]";
    v52 = 2112;
    v53 = v40;
    v41 = "%s Lifespan must be greater than 0. Received: %@";
LABEL_16:
    _os_log_error_impl(&dword_2462C4000, v37, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);

    goto LABEL_17;
  }
  v22 = MEMORY[0x2495571C4](v13);
  activationBlock = v17->_activationBlock;
  v17->_activationBlock = (id)v22;

  if (!v17->_activationBlock)
  {
    v42 = (void *)qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v37 = v42;
    v40 = (void *)MEMORY[0x2495571C4](0);
    *(_DWORD *)buf = 136315394;
    v51 = "-[SEMProvisionalResourceManager initWithResourceName:lifespan:activationBlock:deactivationBlock:serializeOperations:]";
    v52 = 2112;
    v53 = v40;
    v41 = "%s Invalid activation block: %@";
    goto LABEL_16;
  }
  v24 = MEMORY[0x2495571C4](v14);
  deactivationBlock = v17->_deactivationBlock;
  v17->_deactivationBlock = (id)v24;

  if (v17->_deactivationBlock)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("activation", v26);
    activationQueue = v17->_activationQueue;
    v17->_activationQueue = (OS_dispatch_queue *)v27;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v29, QOS_CLASS_BACKGROUND, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = dispatch_queue_create("expiration", v30);
    expirationQueue = v17->_expirationQueue;
    v17->_expirationQueue = (OS_dispatch_queue *)v31;

    if (v7)
      v33 = 0;
    else
      v33 = MEMORY[0x24BDAC9C0];
    dispatch_queue_attr_make_with_autorelease_frequency(v33, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = dispatch_queue_create("operation", v45);
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = (OS_dispatch_queue *)v46;

    v17->_isActive = 0;
    v17->_operationsInProgress = 0;
    goto LABEL_20;
  }
  v43 = (void *)qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    v37 = v43;
    v40 = (void *)MEMORY[0x2495571C4](0);
    *(_DWORD *)buf = 136315394;
    v51 = "-[SEMProvisionalResourceManager initWithResourceName:lifespan:activationBlock:deactivationBlock:serializeOperations:]";
    v52 = 2112;
    v53 = v40;
    v41 = "%s Invalid deactivation block: %@";
    goto LABEL_16;
  }
LABEL_17:
  v44 = 0;
LABEL_21:

  return v44;
}

- (void)activateAsyncWithCompletion:(id)a3
{
  id v4;
  NSObject *activationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2462CBA60;
  block[3] = &unk_25175EB58;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(activationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)activateWithError:(id *)a3 operationBlock:(id)a4
{
  id v6;
  NSObject *activationQueue;
  uint64_t v8;
  int64_t v9;
  NSObject *operationQueue;
  NSObject *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  activationQueue = self->_activationQueue;
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2462CBD30;
  block[3] = &unk_25175EB80;
  block[5] = &v17;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(activationQueue, block);
  v9 = v18[3];
  if ((v9 | 2) == 3)
  {
    operationQueue = self->_operationQueue;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = sub_2462CBE50;
    v14[3] = &unk_25175EBA8;
    v15 = v6;
    dispatch_sync(operationQueue, v14);
    v11 = self->_activationQueue;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = sub_2462CBE5C;
    v13[3] = &unk_25175EAA0;
    v13[4] = self;
    dispatch_sync(v11, v13);

    v9 = v18[3];
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (int64_t)deactivateWithError:(id *)a3
{
  NSObject *activationQueue;
  int64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2462CBF08;
  block[3] = &unk_25175EB80;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(activationQueue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_setExpirationTimer
{
  uint64_t v2;
  void *v4;
  const char *v5;
  dispatch_time_t v6;
  NSObject *expirationQueue;
  _QWORD block[5];

  objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], a2, v2, self->_expirationInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpirationDate_(self, v5, (uint64_t)v4);

  v6 = dispatch_time(0, (uint64_t)(self->_expirationInterval * 1000000000.0));
  expirationQueue = self->_expirationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2462CC188;
  block[3] = &unk_25175EAA0;
  block[4] = self;
  dispatch_after(v6, expirationQueue, block);
}

- (BOOL)isActive
{
  NSObject *activationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  activationQueue = self->_activationQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2462CC434;
  v5[3] = &unk_25175EAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(activationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong(&self->_deactivationBlock, 0);
  objc_storeStrong(&self->_activationBlock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_expirationQueue, 0);
  objc_storeStrong((id *)&self->_activationQueue, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
}

@end
