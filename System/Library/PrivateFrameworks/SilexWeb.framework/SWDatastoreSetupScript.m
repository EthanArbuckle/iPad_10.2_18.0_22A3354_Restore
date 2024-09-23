@implementation SWDatastoreSetupScript

- (SWDatastoreSetupScript)initWithDatastore:(id)a3
{
  id v5;
  SWDatastoreSetupScript *v6;
  SWDatastoreSetupScript *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWDatastoreSetupScript;
  v6 = -[SWDatastoreSetupScript init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_datastore, a3);

  return v7;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("datastore.setup");
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
  objc_msgSend((id)objc_opt_class(), "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWDatastoreSetupScript datastore](self, "datastore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "JSONString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v7, 0, 1);
  return (WKUserScript *)v8;
}

+ (id)source
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SWDatastoreSetupScript_source__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (source_onceToken_0 != -1)
    dispatch_once(&source_onceToken_0, block);
  return (id)source_source_0;
}

void __32__SWDatastoreSetupScript_source__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("datastore-setup"), CFSTR("js"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v3, 4, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)source_source_0;
  source_source_0 = v1;

}

- (SWDatastore)datastore
{
  return self->_datastore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastore, 0);
}

@end
