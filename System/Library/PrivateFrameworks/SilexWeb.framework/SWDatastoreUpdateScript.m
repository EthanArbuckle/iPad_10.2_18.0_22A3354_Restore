@implementation SWDatastoreUpdateScript

- (SWDatastoreUpdateScript)initWithDatastore:(id)a3 oldDatastore:(id)a4 originatingSession:(id)a5
{
  id v9;
  id v10;
  id v11;
  SWDatastoreUpdateScript *v12;
  SWDatastoreUpdateScript *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SWDatastoreUpdateScript;
  v12 = -[SWDatastoreUpdateScript init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_datastore, a3);
    objc_storeStrong((id *)&v13->_oldDatastore, a4);
    objc_storeStrong((id *)&v13->_originatingSession, a5);
  }

  return v13;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("datastore.update");
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "userScriptSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWDatastoreUpdateScript datastore](self, "datastore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "JSONString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v7, 0, 1);
  return (WKUserScript *)v8;
}

+ (id)userScriptSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SWDatastoreUpdateScript_userScriptSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userScriptSource_onceToken_0 != -1)
    dispatch_once(&userScriptSource_onceToken_0, block);
  return (id)userScriptSource_source_0;
}

void __43__SWDatastoreUpdateScript_userScriptSource__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("datastore-init"), CFSTR("js"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v3, 4, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)userScriptSource_source_0;
  userScriptSource_source_0 = v1;

}

- (NSString)executableScript
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "executableSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWDatastoreUpdateScript datastore](self, "datastore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "JSONString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWDatastoreUpdateScript oldDatastore](self, "oldDatastore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "JSONString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWDatastoreUpdateScript originatingSession](self, "originatingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

+ (id)executableSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SWDatastoreUpdateScript_executableSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (executableSource_onceToken_0 != -1)
    dispatch_once(&executableSource_onceToken_0, block);
  return (id)executableSource_source_0;
}

void __43__SWDatastoreUpdateScript_executableSource__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("datastore-update"), CFSTR("js"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v3, 4, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)executableSource_source_0;
  executableSource_source_0 = v1;

}

- (SWDatastore)datastore
{
  return self->_datastore;
}

- (SWDatastore)oldDatastore
{
  return self->_oldDatastore;
}

- (SWSession)originatingSession
{
  return self->_originatingSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingSession, 0);
  objc_storeStrong((id *)&self->_oldDatastore, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

@end
