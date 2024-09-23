@implementation STGenericIntentHelper

- (STGenericIntentHelper)init
{
  STGenericIntentHelper *v2;
  uint64_t v3;
  NSMutableDictionary *handlers;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_queue_t v9;
  OS_dispatch_queue *siriResponseQueue;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *waitForIntentCompleteSemaphore;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STGenericIntentHelper;
  v2 = -[STGenericIntentHelper init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
    v3 = objc_claimAutoreleasedReturnValue();
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.siri.GenericIntentHelper", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.siri.GenericIntentResponse", v6);
    siriResponseQueue = v2->_siriResponseQueue;
    v2->_siriResponseQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_semaphore_create(0);
    waitForIntentCompleteSemaphore = v2->_waitForIntentCompleteSemaphore;
    v2->_waitForIntentCompleteSemaphore = (OS_dispatch_semaphore *)v11;

    AFLogInitIfNeeded();
  }
  return v2;
}

- (void)finishedLaunching:(BOOL)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__STGenericIntentHelper_finishedLaunching___block_invoke;
  block[3] = &unk_24DB768B8;
  block[4] = self;
  if (finishedLaunching__onceToken != -1)
    dispatch_once(&finishedLaunching__onceToken, block);
}

- (void)handleSiriTask:(id)a3 withApplication:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__STGenericIntentHelper_handleSiriTask_withApplication___block_invoke;
  v14[3] = &unk_24DB768E0;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v7;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  dispatch_async(queue, v14);

}

- (void)_handleIntent:(id)a3 withTask:(id)a4 andApplication:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  STGenericIntentLocation *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  STGenericIntentPerson *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  STGenericIntentGroup *v31;
  void *v32;
  STGenericIntentPerson *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  STGenericIntentTopic *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  int v55;
  const __CFString *v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  STGenericIntentDateRange *v68;
  STGenericIntent *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  STGenericIntentPerson *v81;
  void *v82;
  void *v83;
  STGenericIntentLocation *v84;
  STGenericIntentHelper *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  STGenericIntentGroup *v90;
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE09010];
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09010], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    v85 = self;
    v87 = v9;
    v88 = v10;
    if (v12)
    {
      *(_DWORD *)buf = 136315394;
      v92 = "-[STGenericIntentHelper _handleIntent:withTask:andApplication:]";
      v93 = 2112;
      v94 = v8;
      _os_log_debug_impl(&dword_219960000, v11, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }
    objc_msgSend(v8, "info");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("address"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("value"));
    v15 = (STGenericIntentLocation *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("photoTopic"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("value"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "info");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("photoAlbumName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("value"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "info");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("photoContact"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("value"));
    v24 = (STGenericIntentPerson *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "info");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("photoAttributes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("value"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("semanticValue"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "info");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("photoNoun"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("value"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("semanticValue"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v31 = objc_alloc_init(STGenericIntentGroup);
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("inputValue"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v31;
      -[STGenericIntentGroup setName:](v31, "setName:", v32);

    }
    else
    {
      v90 = 0;
    }
    v81 = v24;
    if (!v24)
      goto LABEL_11;
    v33 = v24;
    v24 = objc_alloc_init(STGenericIntentPerson);
    -[STGenericIntentPerson objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", CFSTR("fullName"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGenericIntentPerson setName:](v24, "setName:", v34);

    -[STGenericIntentPerson name](v24, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");

    if (!v36)
    {
      v39 = objc_alloc_init(MEMORY[0x24BDD1730]);
      -[STGenericIntentPerson objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", CFSTR("firstName"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setGivenName:", v40);

      -[STGenericIntentPerson objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", CFSTR("lastName"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setFamilyName:", v41);

      objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v39, 2, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGenericIntentPerson setName:](v24, "setName:", v42);

      if (v18)
        goto LABEL_12;
    }
    else
    {
LABEL_11:
      if (v18)
      {
LABEL_12:
        v37 = objc_alloc_init(STGenericIntentTopic);
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("inputValue"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[STGenericIntentTopic setName:](v37, "setName:", v38);

        goto LABEL_15;
      }
    }
    v37 = 0;
LABEL_15:
    v83 = v18;
    v84 = v15;
    if (!v15)
    {
      v44 = 0;
      goto LABEL_30;
    }
    -[STGenericIntentLocation objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("regionType"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "containsString:", CFSTR("Address")))
    {

    }
    else
    {
      -[STGenericIntentLocation objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("regionType"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "containsString:", CFSTR("Street"));

      if (!v46)
      {
        -[STGenericIntentLocation objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("regionType"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "containsString:", CFSTR("State"));

        if (v55)
        {
          v56 = CFSTR("stateCode");
        }
        else
        {
          -[STGenericIntentLocation objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("regionType"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "containsString:", CFSTR("City"));

          if (v58)
          {
            v56 = CFSTR("city");
          }
          else
          {
            -[STGenericIntentLocation objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("regionType"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "containsString:", CFSTR("Country"));

            if (!v60)
            {
              v53 = 0;
              v44 = 0;
              v50 = 0.0;
              v52 = 0.0;
              goto LABEL_29;
            }
            v56 = CFSTR("countryCode");
          }
        }
        -[STGenericIntentLocation objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v56);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "lowercaseString");
        v44 = objc_claimAutoreleasedReturnValue();
        v53 = 0;
        v50 = 0.0;
        v52 = 0.0;
LABEL_28:

LABEL_29:
        v15 = -[STGenericIntentLocation initWithName:latitude:longitude:]([STGenericIntentLocation alloc], "initWithName:latitude:longitude:", v44, v50, v52);
        -[STGenericIntentLocation setIsLatLong:](v15, "setIsLatLong:", v53);
LABEL_30:
        v80 = (void *)v44;
        v82 = v21;
        objc_msgSend(v8, "info");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("photoDate"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("value"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("start"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("end"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("date"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("date"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = -[STGenericIntentDateRange initWithStartDate:endDate:]([STGenericIntentDateRange alloc], "initWithStartDate:endDate:", v66, v67);

        }
        else
        {
          v68 = 0;
        }
        v69 = -[STGenericIntent initWithName:]([STGenericIntent alloc], "initWithName:", CFSTR("photosSearch"));
        objc_msgSend(v8, "utterance");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[STGenericIntent setUtterance:](v69, "setUtterance:", v70);

        v9 = v87;
        -[STGenericIntent setSiriTask:](v69, "setSiriTask:", v87);
        -[STGenericIntent setIntentRequest:](v69, "setIntentRequest:", v8);
        v10 = v88;
        -[STGenericIntent setAppInForeground:](v69, "setAppInForeground:", objc_msgSend(v88, "applicationState") == 0);
        -[STGenericIntent setIsLaunch:](v69, "setIsLaunch:", objc_msgSend(v8, "isForegroundLaunch"));
        -[STGenericIntent setAttributes:](v69, "setAttributes:", &stru_24DB774E8);
        if (objc_msgSend(v89, "containsString:", CFSTR("videos")))
        {
          v71 = (void *)MEMORY[0x24BDD17C8];
          -[STGenericIntent attributes](v69, "attributes");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "stringWithFormat:", CFSTR(" %@ video"), v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[STGenericIntent setAttributes:](v69, "setAttributes:", v73);

          v10 = v88;
        }
        v74 = v86;
        if (!objc_msgSend(v86, "length"))
          goto LABEL_41;
        if (objc_msgSend(v86, "containsString:", CFSTR("from_front_facing_camera")))
        {
          v75 = (void *)MEMORY[0x24BDD17C8];
          -[STGenericIntent attributes](v69, "attributes");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "stringWithFormat:", CFSTR(" %@ selfies"), v76, v79);
        }
        else
        {
          if ((objc_msgSend(v86, "isEqualToString:", CFSTR("taken")) & 1) != 0)
          {
LABEL_41:
            if (v24)
              -[STGenericIntent addParam:withValue:](v69, "addParam:withValue:", CFSTR("byPeopleInPhoto"), v24);
            if (v15)
              -[STGenericIntent addParam:withValue:](v69, "addParam:withValue:", CFSTR("byPhotoLocation"), v15);
            if (v68)
              -[STGenericIntent addParam:withValue:](v69, "addParam:withValue:", CFSTR("byPhotoDateCreated"), v68);
            if (v90)
              -[STGenericIntent addParam:withValue:](v69, "addParam:withValue:", CFSTR("byPhotoAlbum"), v90);
            if (v37)
              -[STGenericIntent addParam:withValue:](v69, "addParam:withValue:", CFSTR("byPhotoTopic"), v37);
            -[STGenericIntentHelper _invokeHandlerForIntent:](v85, "_invokeHandlerForIntent:", v69);

            goto LABEL_52;
          }
          v77 = (void *)MEMORY[0x24BDD17C8];
          -[STGenericIntent attributes](v69, "attributes");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "stringWithFormat:", CFSTR(" %@ %@"), v76, v86);
        }
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[STGenericIntent setAttributes:](v69, "setAttributes:", v78);

        v9 = v87;
        v10 = v88;
        v74 = v86;
        goto LABEL_41;
      }
    }
    -[STGenericIntentLocation objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("latitude"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGenericIntentLocation objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("longitude"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    v50 = v49;
    objc_msgSend(v48, "doubleValue");
    v52 = v51;

    v44 = 0;
    v53 = 1;
    goto LABEL_28;
  }
  if (v12)
  {
    *(_DWORD *)buf = 136315138;
    v92 = "-[STGenericIntentHelper _handleIntent:withTask:andApplication:]";
    _os_log_debug_impl(&dword_219960000, v11, OS_LOG_TYPE_DEBUG, "%s nil intent, check to make sure you are linked against SiriTask", buf, 0xCu);
  }
LABEL_52:

}

- (void)forIntentParam:(id)a3 predict:(id)a4
{
  void *v5;
  dispatch_time_t v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, 10000000000);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__STGenericIntentHelper_forIntentParam_predict___block_invoke;
  block[3] = &unk_24DB768B8;
  v10 = v5;
  v8 = v5;
  dispatch_after(v6, queue, block);

}

- (void)forIntent:(id)a3 registerHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__STGenericIntentHelper_forIntent_registerHandler___block_invoke;
  block[3] = &unk_24DB76908;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (BOOL)_invokeHandlerForIntent:(id)a3
{
  id v4;
  NSMutableDictionary *handlers;
  void *v6;
  void *v7;
  NSObject *v8;
  NSMutableDictionary *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  NSMutableDictionary *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  handlers = self->_handlers;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](handlers, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__STGenericIntentHelper__invokeHandlerForIntent___block_invoke;
    v11[3] = &unk_24DB76930;
    v13 = v7;
    v12 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

  }
  else
  {
    v8 = *MEMORY[0x24BE09010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09010], OS_LOG_TYPE_ERROR))
    {
      v10 = self->_handlers;
      *(_DWORD *)buf = 136315650;
      v15 = "-[STGenericIntentHelper _invokeHandlerForIntent:]";
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_219960000, v8, OS_LOG_TYPE_ERROR, "%s No handler registered for intent %@, registered handlers: %@", buf, 0x20u);
    }
  }

  return 0;
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (OS_dispatch_queue)siriResponseQueue
{
  return self->_siriResponseQueue;
}

- (void)setSiriResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_siriResponseQueue, a3);
}

- (OS_dispatch_semaphore)waitForIntentCompleteSemaphore
{
  return self->_waitForIntentCompleteSemaphore;
}

- (void)setWaitForIntentCompleteSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_waitForIntentCompleteSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForIntentCompleteSemaphore, 0);
  objc_storeStrong((id *)&self->_siriResponseQueue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __49__STGenericIntentHelper__invokeHandlerForIntent___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__STGenericIntentHelper__invokeHandlerForIntent___block_invoke_2;
  block[3] = &unk_24DB768B8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);

}

uint64_t __49__STGenericIntentHelper__invokeHandlerForIntent___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "finishedState");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "finished");
  return result;
}

void __51__STGenericIntentHelper_forIntent_registerHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

}

void __48__STGenericIntentHelper_forIntentParam_predict___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init((Class)getINVocabularyUpdaterClass());
  objc_msgSend(v2, "setCustomPhotoAlbumNames:", *(_QWORD *)(a1 + 32));

}

uint64_t __56__STGenericIntentHelper_handleSiriTask_withApplication___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  dispatch_time_t v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE09010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09010], OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = "-[STGenericIntentHelper handleSiriTask:withApplication:]_block_invoke";
    _os_log_debug_impl(&dword_219960000, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "waitForIntentCompleteSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v3, v4);

  return objc_msgSend(*(id *)(a1 + 32), "_handleIntent:withTask:andApplication:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __43__STGenericIntentHelper_finishedLaunching___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__STGenericIntentHelper_finishedLaunching___block_invoke_2;
  block[3] = &unk_24DB768B8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __43__STGenericIntentHelper_finishedLaunching___block_invoke_2(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "waitForIntentCompleteSemaphore");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v1);

}

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1)
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_158);
  return (id)sharedHelper_sHelper;
}

void __37__STGenericIntentHelper_sharedHelper__block_invoke()
{
  STGenericIntentHelper *v0;
  void *v1;

  v0 = objc_alloc_init(STGenericIntentHelper);
  v1 = (void *)sharedHelper_sHelper;
  sharedHelper_sHelper = (uint64_t)v0;

}

@end
