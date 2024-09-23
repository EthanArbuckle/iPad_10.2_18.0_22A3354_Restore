@implementation PKJob

- (PKJob)initWithJobID:(int)a3 updateState:(id)a4
{
  id v7;
  PKJob *v8;
  PKJob *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKJob;
  v8 = -[PKJob init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_localJobID = a3;
    objc_storeStrong((id *)&v8->_updatableState, a4);
  }

  return v9;
}

- (PKJob)initWithCoder:(id)a3
{
  id v4;
  PKJob *v5;
  uint64_t v6;
  PKMutableJobState *updatableState;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKJob;
  v5 = -[PKJob init](&v9, sel_init);
  if (v5)
  {
    v5->_localJobID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_localJobID"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_updatableState"));
    v6 = objc_claimAutoreleasedReturnValue();
    updatableState = v5->_updatableState;
    v5->_updatableState = (PKMutableJobState *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_localJobID, CFSTR("_localJobID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_updatableState, CFSTR("_updatableState"));

}

- (id)userCodableDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("localJobID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_localJobID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("updatableState");
  v8[0] = v3;
  -[PKMutableJobState userCodableDictionary](self->_updatableState, "userCodableDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKJob)initWithUserCodableDictionary:(id)a3
{
  id v4;
  PKJob *v5;
  void *v6;
  PKMutableJobState *v7;
  void *v8;
  uint64_t v9;
  PKMutableJobState *updatableState;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKJob;
  v5 = -[PKJob init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localJobID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localJobID = objc_msgSend(v6, "intValue");

    v7 = [PKMutableJobState alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updatableState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKMutableJobState initWithUserCodableDictionary:](v7, "initWithUserCodableDictionary:", v8);
    updatableState = v5->_updatableState;
    v5->_updatableState = (PKMutableJobState *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t localJobID;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  localJobID = self->_localJobID;
  v6 = (void *)-[PKMutableJobState copy](self->_updatableState, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithJobID:updateState:", localJobID, v6);

  return v7;
}

- (void)_withPrinterAsync:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  -[PKJob updatableState](self, "updatableState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "printerEndpointData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[PKPrinterBonjourEndpoint endpointWithData:](PKPrinterBonjourEndpoint, "endpointWithData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPrinter printerWithBonjourEndpoint:discoveryTimeout:completionHandler:](PKPrinter, "printerWithBonjourEndpoint:discoveryTimeout:completionHandler:", v6, v7, 1.0);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (PKPrinter)printer
{
  PKPrinter *cachedPrinter;
  PKJob *v4;
  void *v5;
  PKPrinter *v6;
  PKPrinter *v7;
  _QWORD v9[5];

  cachedPrinter = self->_cachedPrinter;
  if (!cachedPrinter)
  {
    v4 = self;
    if (object_isClass(v4))
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PKJob printer]");
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v4, "-[PKJob printer]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __16__PKJob_printer__block_invoke;
    v9[3] = &unk_24E6CD410;
    v9[4] = v4;
    withDebuggableSemaphore<PKPrinter * {__strong}>(v5, v9, 3.0);
    v6 = (PKPrinter *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedPrinter;
    self->_cachedPrinter = v6;

    cachedPrinter = self->_cachedPrinter;
  }
  return cachedPrinter;
}

uint64_t __16__PKJob_printer__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_withPrinterAsync:", a2);
}

+ (id)jobForJobID:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v4 = a1;
  if (object_isClass(v4))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PKJob jobForJobID:]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v4, "+[PKJob jobForJobID:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __21__PKJob_jobForJobID___block_invoke;
  v8[3] = &__block_descriptor_48_e22_v16__0___v____PKJob__8l;
  v8[4] = v4;
  v8[5] = a3;
  withDebuggableSemaphore<PKJob * {__strong}>(v5, v8, 3.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __21__PKJob_jobForJobID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __21__PKJob_jobForJobID___block_invoke_2;
  v7[3] = &unk_24E6CD438;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "jobsCompletionHandler:", v7);

}

void __21__PKJob_jobForJobID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "localJobID", (_QWORD)v8) == *(_QWORD *)(a1 + 40))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)jobsCompletionHandler:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;
  _QWORD v5[4];
  void (**v6)(id, _QWORD);
  uint64_t state64;

  v3 = (void (**)(id, _QWORD))a3;
  if (_initPrintKitNotificiations(void)::sOnce != -1)
    dispatch_once(&_initPrintKitNotificiations(void)::sOnce, &__block_literal_global_271);
  if (printd_running_token < 0 || (state64 = 0, notify_get_state(printd_running_token, &state64)) || !state64)
  {
    v3[2](v3, 0);
  }
  else
  {
    +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __31__PKJob_jobsCompletionHandler___block_invoke;
    v5[3] = &unk_24E6CD4A0;
    v6 = v3;
    objc_msgSend(v4, "getRecentJobsCompletionHandler:", v5);

  }
}

void __31__PKJob_jobsCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  PKJob *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PKJob *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v5, "count");
  if (v8 == objc_msgSend(v6, "count"))
  {
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        v10 = [PKJob alloc];
        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[PKJob initWithJobID:updateState:](v10, "initWithJobID:updateState:", v12, v13);

        objc_msgSend(v7, "addObject:", v14);
      }
    }
  }
  else
  {
    _PKLogCategory(PKLogCategoryDefault[0]);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v15, OS_LOG_TYPE_ERROR, "number of jobs incorrect for number of states", buf, 2u);
    }

  }
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __31__PKJob_jobsCompletionHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "state");
  v9 = objc_msgSend(v7, "state");
  v10 = v8 > v9;
  if (v8 != v9)
    v10 = -1;
  if (v8 < v9)
    v11 = 1;
  else
    v11 = v10;

  if (!v11)
  {
    objc_msgSend(v6, "timeAtCreation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeAtCreation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "compare:", v13);

    if (!v11)
    {
      v14 = v6;
      v15 = v7;
      v16 = objc_msgSend(v14, "number");
      v17 = objc_msgSend(v15, "number");
      if (v16 < v17)
        v11 = -1;
      else
        v11 = v16 > v17;

    }
  }

  return v11;
}

+ (void)currentJobCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__PKJob_currentJobCompletionHandler___block_invoke;
  v6[3] = &unk_24E6CD4F0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "jobsCompletionHandler:", v6);

}

void __37__PKJob_currentJobCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = (id *)&v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "state") <= 5)
        {
          objc_storeStrong(v16 + 5, v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__PKJob_currentJobCompletionHandler___block_invoke_24;
  v8[3] = &unk_24E6CD4C8;
  v9 = *(id *)(a1 + 32);
  v10 = &v15;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __37__PKJob_currentJobCompletionHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

+ (id)jobs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = a1;
  if (object_isClass(v2))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PKJob jobs]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v2, "+[PKJob jobs]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __13__PKJob_jobs__block_invoke;
  v6[3] = &__block_descriptor_40_e24_v16__0___v____NSArray__8l;
  v6[4] = v2;
  withDebuggableSemaphore<NSArray * {__strong}>(v3, v6, 3.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __13__PKJob_jobs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "jobsCompletionHandler:", a2);
}

+ (id)currentJob
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = a1;
  if (object_isClass(v2))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PKJob currentJob]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v2, "+[PKJob currentJob]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __19__PKJob_currentJob__block_invoke;
  v6[3] = &__block_descriptor_40_e22_v16__0___v____PKJob__8l;
  v6[4] = v2;
  withDebuggableSemaphore<PKJob * {__strong}>(v3, v6, 3.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __19__PKJob_currentJob__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "currentJobCompletionHandler:", a2);
}

- (void)cancel
{
  id v3;

  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelJob:", -[PKJob localJobID](self, "localJobID"));

}

- (void)_updateJobState:(id)a3
{
  PKMutableJobState **p_updatableState;
  PKMutableJobState *updatableState;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  updatableState = self->_updatableState;
  p_updatableState = &self->_updatableState;
  -[PKMutableJobState thumbnailImage](updatableState, "thumbnailImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)p_updatableState, a3);
  -[PKMutableJobState thumbnailImage](*p_updatableState, "thumbnailImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[PKMutableJobState setThumbnailImage:](*p_updatableState, "setThumbnailImage:", v7);

}

- (void)updateCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKJob localJobID](self, "localJobID");
  -[PKMutableJobState thumbnailImage](self->_updatableState, "thumbnailImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__PKJob_updateCompletionHandler___block_invoke;
  v9[3] = &unk_24E6CD538;
  v8 = v4;
  v9[4] = self;
  v10 = v8;
  objc_msgSend(v5, "getJobUpdateStatus:includeThumbnail:completionHandler:", v6, v7 == 0, v9);

}

void __33__PKJob_updateCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_updateJobState:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (int64_t)update
{
  PKJob *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];

  v2 = self;
  if (object_isClass(v2))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PKJob update]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v2, "-[PKJob update]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __15__PKJob_update__block_invoke;
  v6[3] = &unk_24E6CD560;
  v6[4] = v2;
  v4 = withDebuggableSemaphore<PKStatus>(v3, v6, 3.0);

  return v4;
}

uint64_t __15__PKJob_update__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCompletionHandler:", a2);
}

- (int64_t)localJobID
{
  void *v2;
  int64_t v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "localJobID");

  return v3;
}

- (NSString)printerDisplayName
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printerDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)printerLocation
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printerLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)printerKind
{
  void *v2;
  int64_t v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "printerKind");

  return v3;
}

- (PKPrintSettings)settings
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPrintSettings *)v3;
}

- (NSDate)timeAtCreation
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeAtCreation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)state
{
  void *v2;
  int64_t v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (int64_t)mediaSheetsCompleted
{
  void *v2;
  int64_t v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaSheetsCompleted");

  return v3;
}

- (NSDate)timeAtProcessing
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeAtProcessing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)timeAtCompleted
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeAtCompleted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)mediaSheets
{
  void *v2;
  int64_t v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaSheets");

  return v3;
}

- (int64_t)mediaProgress
{
  void *v2;
  int64_t v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaProgress");

  return v3;
}

- (int64_t)remoteJobId
{
  void *v2;
  int64_t v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "remoteJobId");

  return v3;
}

- (NSString)PIN
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PIN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)jobPrinterStateMessage
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jobPrinterStateMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)jobPrinterStateReasons
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jobPrinterStateReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)jobStateMessage
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jobStateMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)jobStateReasons
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jobStateReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSData)thumbnailImage
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)printerEndpointData
{
  void *v2;
  void *v3;

  -[PKJob updatableState](self, "updatableState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printerEndpointData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)localizedStatusString
{
  int64_t v3;
  int64_t v4;
  PKJob *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int64_t v12;
  const char *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  PKJob *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = -[PKJob state](self, "state");
  v4 = v3;
  if (v3 == 10 || v3 == 5)
  {
    v5 = self;
    v6 = -[PKJob mediaSheetsCompleted](v5, "mediaSheetsCompleted");
    v7 = (v6 & ~(v6 >> 63)) + 1;
    if (-[PKJob mediaSheets](v5, "mediaSheets") >= 1 && v7 >= -[PKJob mediaSheets](v5, "mediaSheets"))
      v7 = -[PKJob mediaSheets](v5, "mediaSheets");
    v8 = (void *)MEMORY[0x24BDD16F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  v12 = v4 - 3;
  v13 = "Printer status - Hold";
  v14 = CFSTR("Hold");
  switch(v12)
  {
    case 0:
LABEL_10:
      v13 = "Printer status - Waiting";
      v14 = CFSTR("Waiting");
      goto LABEL_16;
    case 1:
      goto LABEL_16;
    case 2:
    case 7:

      v13 = "Printer status - Hold";
      v14 = CFSTR("Hold");
      switch(v12)
      {
        case 0:
          goto LABEL_10;
        case 1:
          goto LABEL_16;
        case 2:
          v19 = self;
          if (-[PKJob mediaSheets](v19, "mediaSheets") < 1)
          {
            v17 = 0;
          }
          else
          {
            v20 = -[PKJob mediaSheets](v19, "mediaSheets");
            v21 = (void *)MEMORY[0x24BDD16F0];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedStringFromNumber:numberStyle:", v22, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (v17)
            PKLocalizedString(CFSTR("Printing %@ of %@..."), "Value for print status panel printing page <n> of <m>");
          else
            PKLocalizedString(CFSTR("Printing page %@..."), " Value for print status panel printing page <n>");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@ %@"), 0, v11, v17);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }
          break;
        case 3:
          goto LABEL_12;
        case 4:
          goto LABEL_13;
        case 5:
          goto LABEL_14;
        case 6:
          goto LABEL_15;
        case 7:
          PKLocalizedString(CFSTR("Canceling page %@..."), "Printer status - Canceling page <n>");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@"), 0, v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = 0;
          v17 = 0;
          break;
        default:
          goto LABEL_11;
      }
      goto LABEL_17;
    case 3:
LABEL_12:
      v13 = "Printer status - Stopped";
      v14 = CFSTR("Stopped");
      goto LABEL_16;
    case 4:
LABEL_13:
      v13 = "Printer status - Canceled";
      v14 = CFSTR("Canceled");
      goto LABEL_16;
    case 5:
LABEL_14:
      v13 = "Printer status - Failed";
      v14 = CFSTR("Failed");
      goto LABEL_16;
    case 6:
LABEL_15:
      v13 = "Printer status - Finished";
      v14 = CFSTR("Finished");
      goto LABEL_16;
    default:
LABEL_11:
      v13 = "Printer status - Unknown";
      v14 = CFSTR("Unknown");
LABEL_16:
      v15 = 0;
      PKLocalizedString(&v14->isa, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
LABEL_17:

      return (NSString *)v16;
  }
}

- (NSString)localizedJobOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PKJob *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[5];

  v45[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKJob settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duplex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKJob settings](self, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duplex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("one-sided"));

    if ((v7 & 1) == 0)
    {
      PKLocalizedString(CFSTR("Double-sided"), "Label for double sided printing");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v39);
      goto LABEL_6;
    }
  }
  else
  {

  }
  PKLocalizedString(CFSTR("Single-sided"), "Label for single sided printing");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:", v39);
LABEL_6:
  -[PKJob settings](self, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKJob settings](self, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v45[0] = CFSTR("monochrome");
    v45[1] = CFSTR("auto-monochrome");
    v45[2] = CFSTR("process-monochrome");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", v11))
      PKLocalizedString(CFSTR("Black & White"), "Label for black & white (grayscale) printing");
    else
      PKLocalizedString(CFSTR("Color"), "Label for color printing");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "addObject:", v13);
    v39 = (void *)v13;
  }
  -[PKJob settings](self, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "finishings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    -[PKJob settings](self, "settings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finishings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v20)
    {
      v37 = self;
      v21 = 0;
      v22 = 0;
      v23 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(v19);
          v25 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          v21 |= objc_msgSend(&unk_24E6EB2A0, "containsObject:", v25);
          v22 |= objc_msgSend(&unk_24E6EB2B8, "containsObject:", v25);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v20);

      self = v37;
      if ((v21 & 1) != 0)
      {
        PKLocalizedString(CFSTR("Staple"), "The printer will staple the job");
        v26 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v26;
        objc_msgSend(v38, "addObject:", v26);
      }
      if ((v22 & 1) != 0)
      {
        PKLocalizedString(CFSTR("Punch"), "The printer will hole-punch the job");
        v27 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v27;
        objc_msgSend(v38, "addObject:", v27);
      }
    }
    else
    {

    }
  }
  -[PKJob settings](self, "settings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "paper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29 == 0;

  if (!v30)
  {
    -[PKJob settings](self, "settings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "paper");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "localizedName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_msgSend(v38, "addObject:", v33);

  }
  PKLocalizedString(CFSTR(","), "localized comma for joining strings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "componentsJoinedByString:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v35;
}

- (PKMutableJobState)updatableState
{
  return (PKMutableJobState *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatableState, 0);
  objc_storeStrong((id *)&self->_cachedPrinter, 0);
}

@end
