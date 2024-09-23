@implementation TPKContentController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPopOverController, 0);
  objc_storeStrong((id *)&self->_eligibleContentsMonitoringController, 0);
  objc_storeStrong((id *)&self->_testContentText, 0);
  objc_storeStrong((id *)&self->_testContentTitle, 0);
  objc_storeStrong((id *)&self->_miniTipContentManager, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_lastRestartDisplayTrackingIdentifier, 0);
  objc_storeStrong((id *)&self->_checkQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastContentValidateDate, 0);
  objc_storeStrong((id *)&self->_nextAllowedCheckDate, 0);
}

- (TPKContentController)initWithContext:(id)a3
{
  id v5;
  TPKContentController *v6;
  TPKContentController *v7;
  uint64_t v8;
  NSHashTable *delegates;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *checkQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPKContentController;
  v6 = -[TPKContentController init](&v15, sel_init);
  if (!v6)
    goto LABEL_5;
  if ((objc_msgSend(MEMORY[0x24BEB7D40], "suppressTipKitContent") & 1) == 0)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (NSHashTable *)v8;

    v6->_dismissalReason = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("TPKContentController.contentQueue", v11);
    checkQueue = v6->_checkQueue;
    v6->_checkQueue = (OS_dispatch_queue *)v12;

LABEL_5:
    v7 = v6;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TPKContentController cancelContentDisplayDelay](self, "cancelContentDisplayDelay");
  -[TPSMiniTipContentManager invalidate](self->_miniTipContentManager, "invalidate");
  -[TPKContentController unregisterApplicationStateNotification](self, "unregisterApplicationStateNotification");
  v3.receiver = self;
  v3.super_class = (Class)TPKContentController;
  -[TPKContentController dealloc](&v3, sel_dealloc);
}

- (void)cancelContentDisplayDelay
{
  -[TPKContentController setContentDidDisplayDelayInProgress:](self, "setContentDidDisplayDelayInProgress:", 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_contentDisplayDelay, 0);
}

- (void)unregisterApplicationStateNotification
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF98], 0);

  self->_registeredApplicationStateNotification = 0;
  self->_didEnterBackground = 0;
}

- (void)setContentDidDisplayDelayInProgress:(BOOL)a3
{
  self->_contentDidDisplayDelayInProgress = a3;
}

- (void)showTestContent
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
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
  id v29;
  TPKContent *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  id v43;
  id v44;
  TPKContent *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  void *v49;
  _QWORD v50[3];
  _QWORD v51[3];
  void *v52;
  const __CFString *v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB7D40], "hintTitle");
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    -[TPKContentController testContentTitle](self, "testContentTitle");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    v4 = CFSTR("Example content title");
    if (v2)
      v4 = (__CFString *)v2;
    v41 = v4;

  }
  objc_msgSend(MEMORY[0x24BEB7D40], "hintBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "hasPrefix:", CFSTR("'"))
      || !objc_msgSend(v6, "hasSuffix:", CFSTR("'"))
      || (unint64_t)objc_msgSend(v6, "length") < 3)
    {
      goto LABEL_14;
    }
    objc_msgSend(v6, "substringWithRange:", 1, objc_msgSend(v6, "length") - 2);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TPKContentController testContentText](self, "testContentText");
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v8;
    v9 = CFSTR("[{\"type\": \"text\",\"text\": \"Example content text.\"}]");
    if (v8)
      v9 = (__CFString *)v8;
    v7 = v9;
  }
  v10 = v7;

  v6 = v10;
LABEL_14:
  objc_msgSend(MEMORY[0x24BEB7D40], "hintActionText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB7D40], "hintActionURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB7D40], "hintCustomizationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v11;
  if (v11)
    v34 = objc_msgSend(v11, "integerValue");
  else
    v34 = 0;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB7D70]), "initWithDictionary:", &unk_2519C5B40);
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v12, 1, &v44);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v44;

  v60 = CFSTR("title");
  v61[0] = v41;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = CFSTR("content");
    v55[0] = CFSTR("type");
    v55[1] = CFSTR("content");
    v56[0] = CFSTR("p");
    v56[1] = v39;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v17, CFSTR("body"));

    if (v36)
    {
      if (v35)
      {
        v53 = CFSTR("href");
        v54 = v36;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = CFSTR("type");
        v50[1] = CFSTR("attrs");
        v51[0] = CFSTR("actionButton");
        v51[1] = v18;
        v50[2] = CFSTR("text");
        v51[2] = v35;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v20, CFSTR("actions"));

      }
    }
  }
  v48 = CFSTR("mini");
  v49 = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = CFSTR("documentId");
  v46[1] = CFSTR("content");
  v47[0] = CFSTR("testing");
  v47[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB7D48]), "initWithDictionary:metadata:", v23, v37);
  objc_msgSend(MEMORY[0x24BEB7D40], "hintMonitoringEvents");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "dataUsingEncoding:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v13;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v27, 1, &v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v43;

    if (objc_msgSend(v28, "count"))
    {
      v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB7D80]), "initWithDictionary:desiredOutcomeDictionary:", v28, 0);

      if (v29)
        goto LABEL_28;
    }
    else
    {

    }
  }
  else
  {
    v28 = 0;
    v33 = v13;
  }
  v29 = objc_alloc_init(MEMORY[0x24BEB7D80]);
LABEL_28:
  v30 = -[TPKContent initWithDiscoverabilityTip:monitoringEvents:customizationID:userInfo:]([TPKContent alloc], "initWithDiscoverabilityTip:monitoringEvents:customizationID:userInfo:", v24, v29, v34, 0);
  -[TPKContent createCachedViewModelUsingViewDelegate:](v30, "createCachedViewModelUsingViewDelegate:", self);
  -[TPKContent updateState:](v30, "updateState:", 0);
  -[TPKContentController eligibleContentsMonitoringController](self, "eligibleContentsMonitoringController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "updateEligibilityWithContents:", v32);

  if (-[TPKContent state](v30, "state") == 3)
  {
    -[TPKContentController setState:](self, "setState:", 4);
    -[TPKContentController notifyDelegate:contentDidBecomeAvailable:animated:](self, "notifyDelegate:contentDidBecomeAvailable:animated:", 0, v30, 0);
  }

}

+ (TPKContentController)notifiedContentController
{
  return (TPKContentController *)objc_loadWeakRetained(&_notifiedContentController);
}

+ (void)setNotifiedContentController:(id)a3
{
  objc_storeWeak(&_notifiedContentController, a3);
}

+ (BOOL)_setNotifyForDisplayForController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_unfairLock);
  objc_msgSend(a1, "notifiedContentController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5 == (_QWORD)v4;
  else
    v7 = 1;
  v8 = v7;
  if (v7)
    objc_msgSend(a1, "setNotifiedContentController:", v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_unfairLock);

  return v8;
}

+ (void)_resetNotifyForDisplayForController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_unfairLock);
  objc_msgSend(a1, "notifiedContentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_248A67000, v6, OS_LOG_TYPE_DEFAULT, "Resetting pinned notified content controller (%p)", (uint8_t *)&v7, 0xCu);
    }

    +[TPKContentController setNotifiedContentController:](TPKContentController, "setNotifiedContentController:", 0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_unfairLock);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[TPKContentController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p context=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (TPKContent)content
{
  void *v2;
  void *v3;

  -[TPKContentController eligibleContentsMonitoringController](self, "eligibleContentsMonitoringController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TPKContent *)v3;
}

- (BOOL)allowsOverrides
{
  if (allowsOverrides_onceToken != -1)
    dispatch_once(&allowsOverrides_onceToken, &__block_literal_global);
  return allowsOverrides__allowsOverrides;
}

uint64_t __39__TPKContentController_allowsOverrides__block_invoke()
{
  uint64_t result;

  objc_msgSend(CFSTR("com.apple.TipKitLegacy"), "cStringUsingEncoding:", 4);
  result = os_variant_allows_internal_security_policies();
  allowsOverrides__allowsOverrides = result;
  return result;
}

- (void)addDelegate:(id)a3
{
  -[TPKContentController addDelegate:content:](self, "addDelegate:content:", a3, 0);
}

- (void)addDelegate:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int64_t state;
  void *v11;
  NSObject *checkQueue;
  TPKEligibleContentsMonitoringController *v13;
  TPKEligibleContentsMonitoringController *eligibleContentsMonitoringController;
  void *v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id location;
  _QWORD v24[5];

  v6 = a3;
  v7 = a4;
  if (v6 && !-[NSHashTable containsObject:](self->_delegates, "containsObject:", v6))
  {
    -[NSHashTable addObject:](self->_delegates, "addObject:", v6);
    -[TPKContentController content](self, "content");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    state = self->_state;
    if (state != 4)
    {
      if (state == 7)
      {
        if (v7 && !v8)
          -[TPKContentController notifyDelegate:didFinishWithContent:animated:](self, "notifyDelegate:didFinishWithContent:animated:", v6, v7, 0);
LABEL_12:
        if (-[TPKContentController allowsOverrides](self, "allowsOverrides"))
        {
          objc_msgSend(MEMORY[0x24BEB7D40], "displayContentForContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          self->_displayTestContent = objc_msgSend(v11, "isEqualToString:", self->_context);

        }
        if (self->_eligibleContentsMonitoringController)
        {
          if ((unint64_t)(self->_state - 2) >= 3)
          {
LABEL_16:
            objc_initWeak(&location, self);
            checkQueue = self->_checkQueue;
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __44__TPKContentController_addDelegate_content___block_invoke_2;
            block[3] = &unk_2519C01E0;
            objc_copyWeak(&v22, &location);
            dispatch_async(checkQueue, block);
            objc_destroyWeak(&v22);
            objc_destroyWeak(&location);
LABEL_27:

            goto LABEL_28;
          }
        }
        else
        {
          v13 = -[TPKEligibleContentsMonitoringController initWithContext:]([TPKEligibleContentsMonitoringController alloc], "initWithContext:", self->_context);
          eligibleContentsMonitoringController = self->_eligibleContentsMonitoringController;
          self->_eligibleContentsMonitoringController = v13;

          -[TPKEligibleContentsMonitoringController setDelegate:](self->_eligibleContentsMonitoringController, "setDelegate:", self);
          if (self->_displayTestContent)
            -[TPKEligibleContentsMonitoringController clearContents](self->_eligibleContentsMonitoringController, "clearContents");
          -[TPKContentController content](self, "content");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = objc_msgSend(v15, "state");
            v17 = 2;
            if (v16 == 3)
              v17 = 3;
            v9 = v15;
          }
          else
          {
            -[TPKEligibleContentsMonitoringController eligibleContents](self->_eligibleContentsMonitoringController, "eligibleContents");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");

            v9 = 0;
            if (!v19)
            {
              self->_state = 0;
              goto LABEL_16;
            }
            v17 = 2;
          }
          self->_state = v17;
        }
        v20 = self->_checkQueue;
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __44__TPKContentController_addDelegate_content___block_invoke;
        v24[3] = &unk_2519C01B8;
        v24[4] = self;
        dispatch_sync(v20, v24);
        goto LABEL_27;
      }
      if (state != 6)
        goto LABEL_12;
    }
    if (!v7 && v8)
      -[TPKContentController notifyDelegate:contentDidBecomeAvailable:animated:](self, "notifyDelegate:contentDidBecomeAvailable:animated:", v6, v8, 0);
    goto LABEL_12;
  }
LABEL_28:

}

uint64_t __44__TPKContentController_addDelegate_content___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForContent");
}

void __44__TPKContentController_addDelegate_content___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkForContent");

}

- (void)removeDelegate:(id)a3
{
  -[TPKContentController removeDelegate:content:](self, "removeDelegate:content:", a3, 0);
}

- (void)removeDelegate:(id)a3 content:(id)a4
{
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", a3, a4);
  if (!-[NSHashTable count](self->_delegates, "count") && self->_registeredApplicationStateNotification)
    -[TPKContentController unregisterApplicationStateNotification](self, "unregisterApplicationStateNotification");
}

- (void)registerApplicationStateNotification
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground, *MEMORY[0x24BEBE008], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground, *MEMORY[0x24BEBDF98], 0);

  self->_registeredApplicationStateNotification = 1;
}

- (TPSMiniTipContentManager)miniTipContentManager
{
  TPSMiniTipContentManager *miniTipContentManager;
  TPSMiniTipContentManager *v4;
  TPSMiniTipContentManager *v5;

  miniTipContentManager = self->_miniTipContentManager;
  if (!miniTipContentManager)
  {
    v4 = (TPSMiniTipContentManager *)objc_alloc_init(MEMORY[0x24BEB7D78]);
    v5 = self->_miniTipContentManager;
    self->_miniTipContentManager = v4;

    miniTipContentManager = self->_miniTipContentManager;
  }
  return miniTipContentManager;
}

- (void)applicationWillEnterForeground
{
  void *v3;
  BOOL v4;
  NSObject *checkQueue;
  NSObject *v6;
  void *v7;
  char v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD block[5];

  self->_didEnterBackground = 0;
  -[TPKContentController content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = self->_state != 6;
    checkQueue = self->_checkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__TPKContentController_applicationWillEnterForeground__block_invoke;
    block[3] = &unk_2519C01B8;
    block[4] = self;
    dispatch_sync(checkQueue, block);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = self->_checkQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __54__TPKContentController_applicationWillEnterForeground__block_invoke_2;
    v9[3] = &unk_2519C01E0;
    objc_copyWeak(&v10, &location);
    dispatch_async(v6, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    v4 = 1;
  }
  -[TPKContentController content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_state != 6 || v4;
    if ((v8 & 1) == 0)
      -[TPKContentController scheduleContentDisplayDelay](self, "scheduleContentDisplayDelay");
  }

}

uint64_t __54__TPKContentController_applicationWillEnterForeground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForContent");
}

void __54__TPKContentController_applicationWillEnterForeground__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkForContent");

}

- (void)applicationDidEnterBackground
{
  self->_didEnterBackground = 1;
}

- (void)invalidateClientContextIfNeeded
{
  id v3;

  if (-[TPKContentController contentDidDisplayDelayInProgress](self, "contentDidDisplayDelayInProgress"))
  {
    -[TPKContentController cancelContentDisplayDelay](self, "cancelContentDisplayDelay");
    -[TPKContentController contentDisplayDelay](self, "contentDisplayDelay");
  }
  -[TPKContentController eligibleContentsMonitoringController](self, "eligibleContentsMonitoringController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateClientContextIfNeeded");

}

- (void)dismissContent:(id)a3 reason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v8;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_248A67000, v7, OS_LOG_TYPE_DEFAULT, "dismissContent called: %@, reason: %ld", (uint8_t *)&v15, 0x16u);

  }
  if (-[TPKContentController state](self, "state") == 6
    && (-[TPKContentController content](self, "content"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqual:", v6),
        v9,
        v10))
  {
    -[TPKContentController eligibleContentsMonitoringController](self, "eligibleContentsMonitoringController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "manualDismissContent:", v6);

    -[TPKContentController setDismissalReason:](self, "setDismissalReason:", 10);
    -[TPKContentController _contentDidDismiss:](self, "_contentDidDismiss:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[TPKContentController state](self, "state");
      v15 = 138412546;
      v16 = v13;
      v17 = 2048;
      v18 = v14;
      _os_log_impl(&dword_248A67000, v12, OS_LOG_TYPE_DEFAULT, "Content: %@ not eligible to be dismissed. Current state: %ld", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)checkForContent
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  NSDate *nextAllowedCheckDate;
  NSDate *lastContentValidateDate;
  NSObject *checkQueue;
  NSDate *v12;
  NSDate *v13;
  unint64_t state;
  NSDate *v16;
  double v17;
  int v18;
  NSDate *v19;
  NSDate *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int64_t v24;
  NSDate *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  _QWORD block[4];
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE location[12];
  __int16 v41;
  int64_t v42;
  __int16 v43;
  NSDate *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (self->_eligibleContentsMonitoringController && !self->_contentCheckInProgress)
  {
    -[TPKContentController setLastRestartDisplayTrackingIdentifier:](self, "setLastRestartDisplayTrackingIdentifier:", 0);
    self->_contentCheckInProgress = 1;
    if (-[NSHashTable count](self->_delegates, "count") && !self->_registeredApplicationStateNotification)
      -[TPKContentController registerApplicationStateNotification](self, "registerApplicationStateNotification");
    v3 = -21600.0;
    v4 = -10800.0;
    if (-[TPKContentController allowsOverrides](self, "allowsOverrides"))
    {
      objc_msgSend(MEMORY[0x24BEB7D40], "discoverabilitySuppressionInterval");
      if (v5 != 0.0)
      {
        if (self->_displayTestContent)
          v4 = -10800.0;
        else
          v4 = v5;
        if (self->_displayTestContent)
          v3 = -21600.0;
        else
          v3 = v5;
      }
    }
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__0;
    v38 = __Block_byref_object_dispose__0;
    v39 = 0;
    -[TPKContentController content](self, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (self->_state == 6)
      {
        -[NSDate timeIntervalSinceNow](self->_lastContentValidateDate, "timeIntervalSinceNow");
        if (v7 < v4)
        {
          objc_initWeak((id *)location, self);
          v8 = MEMORY[0x24BDAC760];
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __39__TPKContentController_checkForContent__block_invoke;
          v32[3] = &unk_2519C0208;
          objc_copyWeak(&v33, (id *)location);
          v32[4] = &v34;
          -[TPKContentController _isContentValid:synchronous:completionHandler:](self, "_isContentValid:synchronous:completionHandler:", v6, 1, v32);
          nextAllowedCheckDate = self->_nextAllowedCheckDate;
          self->_nextAllowedCheckDate = 0;

          lastContentValidateDate = self->_lastContentValidateDate;
          self->_lastContentValidateDate = 0;

          self->_contentCheckInProgress = 0;
          if (-[TPKContentController _isEligibleImmediateContentAvailableError:](self, "_isEligibleImmediateContentAvailableError:", v35[5]))
          {
            checkQueue = self->_checkQueue;
            block[0] = v8;
            block[1] = 3221225472;
            block[2] = __39__TPKContentController_checkForContent__block_invoke_2;
            block[3] = &unk_2519C01E0;
            objc_copyWeak(&v31, (id *)location);
            dispatch_async(checkQueue, block);
            objc_destroyWeak(&v31);
          }
          objc_destroyWeak(&v33);
          objc_destroyWeak((id *)location);
          goto LABEL_44;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v13 = self->_lastContentValidateDate;
    self->_lastContentValidateDate = v12;

    state = self->_state;
    if (state == 3 && v6 != 0)
    {
      self->_contentCheckInProgress = 0;
      -[TPKContentController displayContent:synchronous:animated:](self, "displayContent:synchronous:animated:", v6, 1, 0);
LABEL_44:

      _Block_object_dispose(&v34, 8);
      return;
    }
    v16 = self->_nextAllowedCheckDate;
    if (v16 || (state | 2) == 6)
    {
      if (((state < 8) & (0xA1u >> state)) == 0
        || (-[NSDate timeIntervalSinceNow](v16, "timeIntervalSinceNow"), v17 >= v3))
      {
        v18 = 0;
        goto LABEL_35;
      }
      state = self->_state;
    }
    if (state == 2 && !self->_displayTestContent)
    {
      -[TPKContentController invalidateClientContextIfNeeded](self, "invalidateClientContextIfNeeded");
      if (self->_state != 2)
      {
        self->_contentCheckInProgress = 0;
        goto LABEL_44;
      }
    }
    self->_state = 0;
    v18 = 1;
LABEL_35:
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v20 = self->_nextAllowedCheckDate;
    self->_nextAllowedCheckDate = v19;

    objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = self->_state;
      v25 = self->_nextAllowedCheckDate;
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v23;
      v41 = 2048;
      v42 = v24;
      v43 = 2112;
      v44 = v25;
      _os_log_impl(&dword_248A67000, v21, OS_LOG_TYPE_DEFAULT, "Check for content for bundleID %@. Current state %zd, last check date %@", location, 0x20u);

    }
    self->_contentCheckInProgress = 0;
    if (v18)
    {
      self->_state = 1;
      if (self->_displayTestContent)
      {
        -[TPKContentController showTestContent](self, "showTestContent");
      }
      else
      {
        objc_initWeak((id *)location, self);
        v27 = self->_checkQueue;
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __39__TPKContentController_checkForContent__block_invoke_21;
        v28[3] = &unk_2519C01E0;
        objc_copyWeak(&v29, (id *)location);
        dispatch_async(v27, v28);
        objc_destroyWeak(&v29);
        objc_destroyWeak((id *)location);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)location = 0;
        _os_log_impl(&dword_248A67000, v26, OS_LOG_TYPE_DEFAULT, "Skipping content check", location, 2u);
      }

    }
    goto LABEL_44;
  }
}

void __39__TPKContentController_checkForContent__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "notifyDelegate:didFinishWithContent:animated:", 0, v8, 0);

    objc_msgSend(WeakRetained, "eligibleContentsMonitoringController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearContents");

  }
}

void __39__TPKContentController_checkForContent__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkForContent");

}

void __39__TPKContentController_checkForContent__block_invoke_21(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkCurrentEligibility");

}

- (void)checkCurrentEligibility
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_contentCheckInProgress)
  {
    v2 = MEMORY[0x24BDAC760];
    self->_contentCheckInProgress = 0;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __47__TPKContentController_checkCurrentEligibility__block_invoke;
    block[3] = &unk_2519C01B8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __47__TPKContentController_checkCurrentEligibility__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_248A67000, v2, OS_LOG_TYPE_DEFAULT, "No eligible content found for context %@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "eligibleContentsMonitoringController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearContents");

  return objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
}

- (void)displayContent:(id)a3 synchronous:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v6 = a4;
  v8 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__TPKContentController_displayContent_synchronous_animated___block_invoke;
  v10[3] = &unk_2519C0230;
  objc_copyWeak(&v12, &location);
  v9 = v8;
  v11 = v9;
  v13 = a5;
  -[TPKContentController _isContentValid:synchronous:completionHandler:](self, "_isContentValid:synchronous:completionHandler:", v9, v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __60__TPKContentController_displayContent_synchronous_animated___block_invoke(uint64_t a1, int a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = objc_msgSend(WeakRetained, "_isEligibleImmediateContentAvailableError:", v6);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "tip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "miniContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bodyText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      goto LABEL_5;
    }
    objc_msgSend(v10, "bodyContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_248A67000, v13, OS_LOG_TYPE_DEFAULT, "Found eligible content from cache: %@", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "notifyContentForDisplay:immediateContent:animated:", *(_QWORD *)(a1 + 32), v8, *(unsigned __int8 *)(a1 + 48));
      if (!(_DWORD)v8)
        goto LABEL_13;
LABEL_12:
      objc_msgSend(WeakRetained, "checkQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__TPKContentController_displayContent_synchronous_animated___block_invoke_22;
      block[3] = &unk_2519C01B8;
      block[4] = WeakRetained;
      dispatch_async(v18, block);

      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_248A67000, v15, OS_LOG_TYPE_DEFAULT, "Cache content is no longer eligible %@", buf, 0xCu);

  }
  objc_msgSend(WeakRetained, "eligibleContentsMonitoringController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clearContents");

  objc_msgSend(WeakRetained, "setState:", 5);
  if ((_DWORD)v8)
    goto LABEL_12;
LABEL_13:

}

uint64_t __60__TPKContentController_displayContent_synchronous_animated___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForContent");
}

- (void)_contentDidDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int64_t state;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  TPKContentController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "correlationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((self->_state | 2) == 6)
  {
    if (v5)
    {
      -[TPKContentController eligibleContentsMonitoringController](self, "eligibleContentsMonitoringController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didDisplayContent:", v4);

      self->_dismissalReason = 0;
      self->_state = 6;
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v10;
        v17 = 2048;
        v18 = self;
        _os_log_impl(&dword_248A67000, v9, OS_LOG_TYPE_DEFAULT, "Content did display %@ (%p)", (uint8_t *)&v15, 0x16u);

      }
      -[TPKContentController miniTipContentManager](self, "miniTipContentManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hintDisplayedForIdentifier:correlationID:context:", v5, v7, self->_context);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_248A67000, v14, OS_LOG_TYPE_DEFAULT, "Content did display called but there is no content", (uint8_t *)&v15, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      v15 = 138412546;
      v16 = v5;
      v17 = 2048;
      v18 = (TPKContentController *)state;
      _os_log_impl(&dword_248A67000, v12, OS_LOG_TYPE_DEFAULT, "Content did display called on %@ but state %zd is not set to available", (uint8_t *)&v15, 0x16u);
    }

  }
}

- (void)_contentDidDismiss:(id)a3
{
  id v4;
  void *v5;
  int64_t dismissalReason;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int64_t state;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  TPKContentController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_state == 6)
  {
    dismissalReason = self->_dismissalReason;
    -[TPKContentController setLastRestartDisplayTrackingIdentifier:](self, "setLastRestartDisplayTrackingIdentifier:", 0);
    objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        objc_msgSend(v4, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v9;
        v20 = 2048;
        v21 = self;
        _os_log_impl(&dword_248A67000, v7, OS_LOG_TYPE_DEFAULT, "Content did dismiss %@ (%p)", buf, 0x16u);

      }
      if (self->_dismissalReason)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[TPKContentController miniTipContentManager](self, "miniTipContentManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hintDismissedForIdentifier:bundleID:context:reason:", v5, v11, self->_context, self->_dismissalReason);

      }
      if (dismissalReason == 8)
      {
        -[TPKContentController setState:](self, "setState:", 2);
        objc_msgSend(v4, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPKContentController setLastRestartDisplayTrackingIdentifier:](self, "setLastRestartDisplayTrackingIdentifier:", v13);

        objc_initWeak((id *)buf, self);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __43__TPKContentController__contentDidDismiss___block_invoke;
        v16[3] = &unk_2519C0258;
        objc_copyWeak(&v17, (id *)buf);
        -[TPKContentController _isContentValid:synchronous:completionHandler:](self, "_isContentValid:synchronous:completionHandler:", v4, 0, v16);
        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
LABEL_16:
        self->_dismissalReason = 0;
        objc_msgSend((id)objc_opt_class(), "_resetNotifyForDisplayForController:", self);
        goto LABEL_17;
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_248A67000, v7, OS_LOG_TYPE_DEFAULT, "Content did dismiss called but there is no content", buf, 2u);
      }

      if (dismissalReason == 8)
        goto LABEL_16;
    }
    self->_state = 7;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    v20 = 2048;
    v21 = (TPKContentController *)state;
    _os_log_impl(&dword_248A67000, v14, OS_LOG_TYPE_DEFAULT, "Content did dismiss called on %@ but state %zd is not set to displayed", buf, 0x16u);
  }

LABEL_17:
}

void __43__TPKContentController__contentDidDismiss___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "eligibleContentsMonitoringController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearContents");

    objc_msgSend(v5, "setState:", 7);
    objc_msgSend(v5, "setLastRestartDisplayTrackingIdentifier:", 0);
    WeakRetained = v5;
  }

}

- (id)_createContentViewWithContent:(id)a3 asPopover:(BOOL)a4
{
  id v5;
  TPKTipContentHintView *v6;

  v5 = a3;
  v6 = -[TPKTipContentHintView initWithContentController:tipContent:]([TPKTipContentHintView alloc], "initWithContentController:tipContent:", self, v5);

  return v6;
}

- (id)createContentViewWithContent:(id)a3 annotatedView:(id)a4
{
  id v6;
  id v7;
  TPKTipContentAnnotationView *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[TPKTipContentAnnotationView initWithContentController:tipContent:sourceView:]([TPKTipContentAnnotationView alloc], "initWithContentController:tipContent:sourceView:", self, v7, v6);

  return v8;
}

- (id)createContentViewWithContent:(id)a3
{
  return -[TPKContentController _createContentViewWithContent:asPopover:](self, "_createContentViewWithContent:asPopover:", a3, 0);
}

- (void)registerCustomContentView:(id)a3
{
  objc_msgSend(a3, "setViewDelegate:", self);
}

- (id)createContentViewControllerWithContent:(id)a3 sourceViewController:(id)a4
{
  id v6;
  id v7;
  TPKContentPopoverViewController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[TPKContentPopoverViewController initWithContentController:tipContent:sourceViewController:]([TPKContentPopoverViewController alloc], "initWithContentController:tipContent:sourceViewController:", self, v7, v6);

  return v8;
}

- (BOOL)prepareTipContent:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "tip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "miniContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v6, "createCachedViewModelUsingViewDelegate:", self);
    objc_msgSend(v6, "parsingError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else if ((objc_msgSend(v6, "hasTipContent") & 1) != 0)
    {
      v13 = (void *)MEMORY[0x24BEB7CC0];
      objc_msgSend(v9, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "correlationID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "eventWithTipID:correlationID:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[TPKContentController context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContext:", v17);

      objc_msgSend(v16, "log");
      v12 = 1;
LABEL_10:

      goto LABEL_11;
    }
    -[TPKContentController miniTipContentManager](self, "miniTipContentManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPKContentController context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "personalizationFailedForContentID:bundleID:context:", v18, v7, v19);

    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)notifyContentForDisplay:(id)a3 immediateContent:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  TPKContentController *v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8)
  {
    if (a4
      || -[TPKContentController displayTestContent](self, "displayTestContent")
      || !-[NSHashTable count](self->_delegates, "count")
      || objc_msgSend((id)objc_opt_class(), "_setNotifyForDisplayForController:", self))
    {
      self->_state = 4;
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134217984;
        v12 = self;
        _os_log_impl(&dword_248A67000, v9, OS_LOG_TYPE_DEFAULT, "Notify delegates (%p)", (uint8_t *)&v11, 0xCu);
      }

      -[TPKContentController notifyDelegate:contentDidBecomeAvailable:animated:](self, "notifyDelegate:contentDidBecomeAvailable:animated:", 0, v8, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134217984;
        v12 = self;
        _os_log_impl(&dword_248A67000, v10, OS_LOG_TYPE_DEFAULT, "Notify delegates suppressed (%p)", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)_isContentValid:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSString *context;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(v8, "tip");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPKContentController lastRestartDisplayTrackingIdentifier](self, "lastRestartDisplayTrackingIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  -[TPKContentController miniTipContentManager](self, "miniTipContentManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __70__TPKContentController__isContentValid_synchronous_completionHandler___block_invoke;
  v21[3] = &unk_2519C02A8;
  objc_copyWeak(&v25, &location);
  v18 = v8;
  v22 = v18;
  v19 = v11;
  v23 = v19;
  v26 = v6;
  v20 = v9;
  v24 = v20;
  objc_msgSend(v16, "validateAndPrepareContentForDisplay:bundleID:context:synchronous:skipUsageCheck:completionHandler:", v12, v19, context, v6, v15, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __70__TPKContentController__isContentValid_synchronous_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  char v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_msgSend(WeakRetained, "displayTestContent") & 1) != 0 || a2)
  {
    v10 = objc_msgSend(WeakRetained, "prepareTipContent:bundleID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_248A67000, v8, OS_LOG_TYPE_DEFAULT, "Cache content %@ is no longer valid. Reason: %@", buf, 0x16u);

    }
    v10 = 0;
  }
  if (*(_BYTE *)(a1 + 64))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__TPKContentController__isContentValid_synchronous_completionHandler___block_invoke_27;
    block[3] = &unk_2519C0280;
    v13 = *(id *)(a1 + 48);
    v14 = v10;
    v12 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __70__TPKContentController__isContentValid_synchronous_completionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)_isEligibleImmediateContentAvailableError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB7EA8]))
    v5 = objc_msgSend(v3, "code") == 3;
  else
    v5 = 0;

  return v5;
}

- (void)notifyEventOccurred:(int64_t)a3 content:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  uint8_t buf[4];
  int64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v21 = a3;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_248A67000, v10, OS_LOG_TYPE_DEFAULT, "notifyEventOccurred: %zd, identifier %@", buf, 0x16u);

  }
  -[NSHashTable objectEnumerator](self->_delegates, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__TPKContentController_notifyEventOccurred_content_context___block_invoke;
  v16[3] = &unk_2519C02D0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a3;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

}

void __60__TPKContentController_notifyEventOccurred_content_context___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "contentController:eventOccurred:content:context:", a1[4], a1[7], a1[5], a1[6]);

}

- (void)notifyDelegate:(id)a3 contentDidBecomeAvailable:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void *)MEMORY[0x24BEB7D68];
  v10 = a3;
  objc_msgSend(v9, "tipkit");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_248A67000, v11, OS_LOG_TYPE_DEFAULT, "notifyDelegate:contentDidBecomeAvailable: %@", buf, 0xCu);

  }
  -[TPKContentController _notifyDelegate:contentDidBecomeAvailable:animated:](self, "_notifyDelegate:contentDidBecomeAvailable:animated:", v10, v8, v5);

  if (!v10)
  {
    -[NSHashTable objectEnumerator](self->_delegates, "objectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__TPKContentController_notifyDelegate_contentDidBecomeAvailable_animated___block_invoke;
    v15[3] = &unk_2519C02F8;
    v15[4] = self;
    v16 = v8;
    v17 = v5;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  }
}

uint64_t __74__TPKContentController_notifyDelegate_contentDidBecomeAvailable_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegate:contentDidBecomeAvailable:animated:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_notifyDelegate:(id)a3 contentDidBecomeAvailable:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      objc_msgSend(v8, "contentController:contentDidBecomeAvailable:animated:", self, v9, v5);
    }
    else
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __75__TPKContentController__notifyDelegate_contentDidBecomeAvailable_animated___block_invoke;
      block[3] = &unk_2519C0320;
      objc_copyWeak(&v13, &location);
      v11 = v8;
      v12 = v9;
      v14 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

}

void __75__TPKContentController__notifyDelegate_contentDidBecomeAvailable_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "contentController:contentDidBecomeAvailable:animated:", WeakRetained, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

- (void)notifyDelegate:(id)a3 didFinishWithContent:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void *)MEMORY[0x24BEB7D68];
  v10 = a3;
  objc_msgSend(v9, "tipkit");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_248A67000, v11, OS_LOG_TYPE_DEFAULT, "notifyDelegate:didFinishWithContent: %@", buf, 0xCu);

  }
  -[TPKContentController _notifyDelegate:didFinishWithContent:animated:](self, "_notifyDelegate:didFinishWithContent:animated:", v10, v8, v5);

  if (!v10)
  {
    -[NSHashTable objectEnumerator](self->_delegates, "objectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69__TPKContentController_notifyDelegate_didFinishWithContent_animated___block_invoke;
    v15[3] = &unk_2519C02F8;
    v15[4] = self;
    v16 = v8;
    v17 = v5;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  }
  -[TPKContentController _contentDidDismiss:](self, "_contentDidDismiss:", v8);

}

void __69__TPKContentController_notifyDelegate_didFinishWithContent_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegate:didFinishWithContent:animated:", v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)_notifyDelegate:(id)a3 didFinishWithContent:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      objc_msgSend(v8, "contentController:didFinishWithContent:animated:", self, v9, v5);
    }
    else
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__TPKContentController__notifyDelegate_didFinishWithContent_animated___block_invoke;
      block[3] = &unk_2519C0320;
      objc_copyWeak(&v13, &location);
      v11 = v8;
      v12 = v9;
      v14 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

}

void __70__TPKContentController__notifyDelegate_didFinishWithContent_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "contentController:didFinishWithContent:animated:", WeakRetained, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

- (void)scheduleContentDisplayDelay
{
  -[TPKContentController setContentDidDisplayDelayInProgress:](self, "setContentDidDisplayDelayInProgress:", 1);
  -[TPKContentController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_contentDisplayDelay, 0, 1.0);
}

- (void)contentDisplayDelay
{
  id v3;

  -[TPKContentController content](self, "content");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TPKContentController _contentDidDisplay:](self, "_contentDidDisplay:", v3);

}

- (void)contentViewWasCreated:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[TPKContentController content](self, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_248A67000, v4, OS_LOG_TYPE_DEFAULT, "Retrieve content view for content %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)contentViewWillBeShown:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  -[TPKContentController content](self, "content");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v9, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      -[TPKContentController cancelContentDisplayDelay](self, "cancelContentDisplayDelay");
      if (!self->_didEnterBackground)
        -[TPKContentController scheduleContentDisplayDelay](self, "scheduleContentDisplayDelay");
    }
  }

}

- (void)contentViewCloseButtonTapped:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_248A67000, v5, OS_LOG_TYPE_DEFAULT, "Close button tapped for %@", (uint8_t *)&v10, 0xCu);

  }
  if (self->_dismissalReason != 9)
  {
    -[TPKContentController eligibleContentsMonitoringController](self, "eligibleContentsMonitoringController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "manualDismissContent:", v4);

    self->_dismissalReason = 9;
    -[TPKContentController currentPopOverController](self, "currentPopOverController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TPKContentController currentPopOverController](self, "currentPopOverController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissPopoverAnimated:", 1);

    }
    -[TPKContentController notifyEventOccurred:content:context:](self, "notifyEventOccurred:content:context:", 2, v4, 0);
    -[TPKContentController notifyDelegate:didFinishWithContent:animated:](self, "notifyDelegate:didFinishWithContent:animated:", 0, v4, 1);
  }

}

- (void)contentView:(id)a3 actionTapped:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
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
  TPKContentController *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v54 = v10;
    v55 = 2112;
    v56 = v11;
    _os_log_impl(&dword_248A67000, v8, OS_LOG_TYPE_DEFAULT, "Action tapped for %@. %@", buf, 0x16u);

  }
  objc_msgSend(v7, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByRemovingPercentEncoding");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = self;
  v48 = v7;
  v46 = v14;
  if ((objc_msgSend(v14, "hasPrefix:", CFSTR("tips:open?type=pref&")) & 1) == 0
    && (objc_msgSend(v14, "hasPrefix:", CFSTR("tips:open?type=URL&")) & 1) == 0
    && !objc_msgSend(v14, "hasPrefix:", CFSTR("tips:open?type=appScheme&")))
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("tips:open?type=client")))
    {
      -[NSHashTable objectEnumerator](self->_delegates, "objectEnumerator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __49__TPKContentController_contentView_actionTapped___block_invoke;
      v49[3] = &unk_2519C0348;
      v49[4] = self;
      v50 = v6;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v49);

    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "count") <= 1)
  {

LABEL_18:
    v45 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("url"));

  if (v19 && (v20 = objc_msgSend(v14, "rangeOfString:", CFSTR("url=")), v20 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v14, "substringFromIndex:", v20 + v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v25);
    v22 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  if (!v22)
    goto LABEL_18;
  v26 = *MEMORY[0x24BE38320];
  v51[0] = *MEMORY[0x24BE38310];
  v51[1] = v26;
  v52[0] = MEMORY[0x24BDBD1C8];
  v52[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "openSensitiveURL:withOptions:", v22, v27);

  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[TPKContentController contentView:actionTapped:].cold.1(v22, v29);

  v45 = (void *)v22;
LABEL_19:
  v30 = (void *)MEMORY[0x24BEB7C80];
  objc_msgSend(v6, "content");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "tip");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v33 = v6;
  v43 = v6;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "tip");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "correlationID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "content");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "tip");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "clientConditionID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "URL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "eventWithContentID:collectionID:correlationID:clientConditionID:url:", v32, 0, v36, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "setDisplayType:", *MEMORY[0x24BEB7EB8]);
  objc_msgSend(v41, "log");
  objc_msgSend(v43, "content");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPKContentController notifyEventOccurred:content:context:](v47, "notifyEventOccurred:content:context:", 3, v42, 0);

}

void __49__TPKContentController_contentView_actionTapped___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentController:actionTapped:", v3, v4);

  }
}

- (void)contentView:(id)a3 needsLayoutForReason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  -[NSHashTable objectEnumerator](self->_delegates, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__TPKContentController_contentView_needsLayoutForReason___block_invoke;
  v9[3] = &unk_2519C0348;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __57__TPKContentController_contentView_needsLayoutForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "contentController:contentViewNeedsLayout:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)contentView:(id)a3 viewTappedForIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_248A67000, v8, OS_LOG_TYPE_DEFAULT, "Hint tapped for %@", (uint8_t *)&v14, 0xCu);

  }
  v10 = (void *)MEMORY[0x24BEB7CD0];
  objc_msgSend(v7, "tip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "correlationID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "eventWithTipID:correlationID:", v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "log");
  -[TPKContentController notifyEventOccurred:content:context:](self, "notifyEventOccurred:content:context:", 1, v7, 0);

}

- (id)contentView:(id)a3 personalizedStringForID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  -[TPKContentController content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable objectEnumerator](self->_delegates, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__TPKContentController_contentView_personalizedStringForID___block_invoke;
  v13[3] = &unk_2519C0370;
  v15 = &v17;
  v16 = a4;
  v13[4] = self;
  v10 = v7;
  v14 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __60__TPKContentController_contentView_personalizedStringForID___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "contentController:personalizedStringForID:content:", a1[4], a1[7], a1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      *a4 = 1;
  }

}

- (id)contentView:(id)a3 iconForCustomizationID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[NSHashTable objectEnumerator](self->_delegates, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__TPKContentController_contentView_iconForCustomizationID___block_invoke;
  v17[3] = &unk_2519C0398;
  v19 = &v22;
  v20 = &v26;
  v17[4] = self;
  v21 = a4;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);

  if (!*((_BYTE *)v23 + 24) && !v27[5])
  {
    objc_msgSend(v9, "preferredMicaLayerSize");
    if (v11 == *MEMORY[0x24BDBF148] && v10 == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      objc_msgSend(v9, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[TPKContentView SiriIconWithTraitCollection:](TPKContentView, "SiriIconWithTraitCollection:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v27[5];
      v27[5] = v13;

    }
  }
  v15 = (id)v27[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

void __59__TPKContentController_contentView_iconForCustomizationID___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v6 = (void *)a1[4];
    objc_msgSend(v6, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentController:content:iconForCustomizationID:", v6, v7, a1[8]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    objc_msgSend(v14, "contentController:contentView:iconForCustomizationID:", a1[4], a1[5], a1[8]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[7] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    *a4 = 1;

}

- (void)eligibleContentsMonitoringController:(id)a3 shouldDisplayContent:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a5;
  v7 = a4;
  -[TPKContentController setState:](self, "setState:", 3);
  -[TPKContentController displayContent:synchronous:animated:](self, "displayContent:synchronous:animated:", v7, 1, v5);

}

- (void)eligibleContentsMonitoringController:(id)a3 shouldDismissContent:(id)a4 reason:(int64_t)a5
{
  id v7;

  v7 = a4;
  -[TPKContentController setDismissalReason:](self, "setDismissalReason:", a5);
  -[TPKContentController notifyDelegate:didFinishWithContent:animated:](self, "notifyDelegate:didFinishWithContent:animated:", 0, v7, 1);

}

- (void)eligibleContentsMonitoringController:(id)a3 restartTrackingForContents:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "identifier", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[TPKContentController miniTipContentManager](self, "miniTipContentManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "restartTrackingForContentIdentifiers:", v6);

}

- (id)eligibleContentsMonitoringController:(id)a3 clientContextMapForKeys:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      -[TPKContentController _evaluateClientContextMap:forKeys:](self, "_evaluateClientContextMap:forKeys:", v6, v5);
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __85__TPKContentController_eligibleContentsMonitoringController_clientContextMapForKeys___block_invoke;
      block[3] = &unk_2519C03C0;
      block[4] = self;
      v10 = v6;
      v11 = v5;
      dispatch_sync(MEMORY[0x24BDAC9B8], block);

    }
    if (objc_msgSend(v6, "count"))
      v7 = (void *)objc_msgSend(v6, "copy");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __85__TPKContentController_eligibleContentsMonitoringController_clientContextMapForKeys___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateClientContextMap:forKeys:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_evaluateClientContextMap:(id)a3 forKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[NSHashTable objectEnumerator](self->_delegates, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__TPKContentController__evaluateClientContextMap_forKeys___block_invoke;
  v12[3] = &unk_2519C03E8;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

void __58__TPKContentController__evaluateClientContextMap_forKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "contentController:clientContextMapForKeys:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addEntriesFromDictionary:", v3);

  }
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)contentDismissedByUser
{
  return self->_contentDismissedByUser;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)didEnterBackground
{
  return self->_didEnterBackground;
}

- (void)setDidEnterBackground:(BOOL)a3
{
  self->_didEnterBackground = a3;
}

- (BOOL)contentCheckInProgress
{
  return self->_contentCheckInProgress;
}

- (void)setContentCheckInProgress:(BOOL)a3
{
  self->_contentCheckInProgress = a3;
}

- (BOOL)contentDidDisplayDelayInProgress
{
  return self->_contentDidDisplayDelayInProgress;
}

- (BOOL)displayTestContent
{
  return self->_displayTestContent;
}

- (void)setDisplayTestContent:(BOOL)a3
{
  self->_displayTestContent = a3;
}

- (int64_t)dismissalReason
{
  return self->_dismissalReason;
}

- (void)setDismissalReason:(int64_t)a3
{
  self->_dismissalReason = a3;
}

- (OS_dispatch_queue)checkQueue
{
  return self->_checkQueue;
}

- (void)setCheckQueue:(id)a3
{
  objc_storeStrong((id *)&self->_checkQueue, a3);
}

- (NSString)lastRestartDisplayTrackingIdentifier
{
  return self->_lastRestartDisplayTrackingIdentifier;
}

- (void)setLastRestartDisplayTrackingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastRestartDisplayTrackingIdentifier, a3);
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (void)setMiniTipContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_miniTipContentManager, a3);
}

- (NSString)testContentTitle
{
  return self->_testContentTitle;
}

- (void)setTestContentTitle:(id)a3
{
  objc_storeStrong((id *)&self->_testContentTitle, a3);
}

- (NSString)testContentText
{
  return self->_testContentText;
}

- (void)setTestContentText:(id)a3
{
  objc_storeStrong((id *)&self->_testContentText, a3);
}

- (TPKEligibleContentsMonitoringController)eligibleContentsMonitoringController
{
  return self->_eligibleContentsMonitoringController;
}

- (void)setEligibleContentsMonitoringController:(id)a3
{
  objc_storeStrong((id *)&self->_eligibleContentsMonitoringController, a3);
}

- (TPKContentPopoverViewController)currentPopOverController
{
  return self->_currentPopOverController;
}

- (void)setCurrentPopOverController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPopOverController, a3);
}

- (void)contentView:(uint64_t)a1 actionTapped:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_248A67000, a2, OS_LOG_TYPE_DEBUG, "Open %@", (uint8_t *)&v2, 0xCu);
}

@end
