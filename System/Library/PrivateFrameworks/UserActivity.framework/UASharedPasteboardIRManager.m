@implementation UASharedPasteboardIRManager

+ (id)sharedIRManager
{
  if (sharedIRManager_onceToken != -1)
    dispatch_once(&sharedIRManager_onceToken, &__block_literal_global_8);
  return (id)sharedIRManager_instance;
}

void __46__UASharedPasteboardIRManager_sharedIRManager__block_invoke()
{
  UASharedPasteboardIRManager *v0;
  void *v1;

  v0 = objc_alloc_init(UASharedPasteboardIRManager);
  v1 = (void *)sharedIRManager_instance;
  sharedIRManager_instance = (uint64_t)v0;

}

- (UASharedPasteboardIRManager)init
{
  UASharedPasteboardIRManager *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UASharedPasteboardIRManager;
  v2 = -[UASharedPasteboardIRManager init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[UASharedPasteboardIRManager setLookupTable:](v2, "setLookupTable:", v3);

  }
  return v2;
}

- (void)initializeConverters
{
  NSObject *v2;
  uint8_t v3[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_DEFAULT, "Initalizing PBIR Converters", v3, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "registerConverter");
  objc_msgSend((id)objc_opt_class(), "registerConverter");
  objc_msgSend((id)objc_opt_class(), "registerConverter");
  objc_msgSend((id)objc_opt_class(), "registerConverter");
}

- (id)registeredConverters
{
  void *v2;
  void *v3;

  -[UASharedPasteboardIRManager lookupTable](self, "lookupTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)registerIRHandlerClass:(Class)a3 forType:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EEE5E6D0))
  {
    -[UASharedPasteboardIRManager lookupTable](self, "lookupTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", a3, v7);

  }
}

- (id)converterForType:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;

  v4 = a3;
  -[UASharedPasteboardIRManager lookupTable](self, "lookupTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)(id)objc_msgSend(v5, "objectForKey:", v4);

  if (v6)
    v6 = (objc_class *)objc_alloc_init(v6);

  return v6;
}

- (NSMutableDictionary)lookupTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLookupTable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupTable, 0);
}

@end
