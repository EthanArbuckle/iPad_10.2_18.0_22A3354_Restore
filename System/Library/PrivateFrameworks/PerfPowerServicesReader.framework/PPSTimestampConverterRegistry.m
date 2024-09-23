@implementation PPSTimestampConverterRegistry

- (PPSTimestampConverterRegistry)init
{
  PPSTimestampConverterRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *converters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPSTimestampConverterRegistry;
  v2 = -[PPSTimestampConverterRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    converters = v2->_converters;
    v2->_converters = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PPSTimestampConverterRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_instance;
}

void __47__PPSTimestampConverterRegistry_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

+ (id)converterForFilepath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PPSTimestampConverter *v6;
  void *v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "converters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (PPSTimestampConverter *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = -[PPSTimestampConverter initWithFilepath:]([PPSTimestampConverter alloc], "initWithFilepath:", v3);
    if (v6)
    {
      objc_msgSend(v4, "converters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v3);

    }
  }

  return v6;
}

- (NSMutableDictionary)converters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConverters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converters, 0);
}

@end
