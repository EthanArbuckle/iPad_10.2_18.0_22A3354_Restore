@implementation PPSDataIngesterRegistry

- (PPSDataIngesterRegistry)init
{
  PPSDataIngesterRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *dataIngesters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPSDataIngesterRegistry;
  v2 = -[PPSDataIngesterRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dataIngesters = v2->_dataIngesters;
    v2->_dataIngesters = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PPSDataIngesterRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_instance_0;
}

void __41__PPSDataIngesterRegistry_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v0;

}

+ (id)dataIngesterForFilepath:(id)a3 requestType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSObject *v11;
  void *v12;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_stringForFilepath:requestType:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataIngesters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if ((unint64_t)a4 > 2)
    {
      PPSReaderLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[PPSDataIngesterRegistry dataIngesterForFilepath:requestType:].cold.1(a4, v11);

      v10 = 0;
    }
    else
    {
      v10 = (objc_class *)objc_opt_class();
    }
    v9 = (void *)objc_msgSend([v10 alloc], "initWithFilepath:", v5);
    if (v6)
    {
      objc_msgSend(v7, "dataIngesters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v6);

    }
  }

  return v9;
}

+ (void)releaseDataIngesterForFilepath:(id)a3 requestType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v5 = a3;
    objc_msgSend((id)objc_opt_class(), "_stringForFilepath:requestType:", v5, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataIngesters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
}

+ (id)_stringForFilepath:(id)a3 requestType:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%ld::%@"), a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableDictionary)dataIngesters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataIngesters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataIngesters, 0);
}

+ (void)dataIngesterForFilepath:(uint64_t)a1 requestType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_2439D9000, a2, OS_LOG_TYPE_DEBUG, "Invalid ingester type: %ld.", (uint8_t *)&v2, 0xCu);
}

@end
