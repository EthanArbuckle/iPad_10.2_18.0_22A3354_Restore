@implementation BundleControllerHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_sHelper;
}

void __40__BundleControllerHelper_sharedInstance__block_invoke()
{
  BundleControllerHelper *v0;
  void *v1;

  v0 = objc_alloc_init(BundleControllerHelper);
  v1 = (void *)sharedInstance_sHelper;
  sharedInstance_sHelper = (uint64_t)v0;

}

- (id)loadSpecifiersFromPlistName:(id)a3 stringsName:(id)a4 bundle:(id)a5 specifier:(id)a6 target:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSMutableArray *bundleControllers;
  NSMutableArray *v24;
  NSMutableArray *v25;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v28 = 0;
  v29 = 0;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  objc_msgSend(v13, "pathForResource:ofType:", v12, CFSTR("plist"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = os_log_create("com.apple.pencilpairingui", ");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "bundlePath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v12;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_22ACC1000, v18, OS_LOG_TYPE_DEFAULT, "Warning: failed to load preferences plist '%@.plist' for bundle %@", buf, 0x16u);

    }
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v17);
  v27 = (id)objc_opt_new();
  SpecifiersFromPlist();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v27;
  bundleControllers = self->_bundleControllers;
  if (!bundleControllers)
  {
    v24 = (NSMutableArray *)objc_opt_new();
    v25 = self->_bundleControllers;
    self->_bundleControllers = v24;

    bundleControllers = self->_bundleControllers;
  }
  -[NSMutableArray addObjectsFromArray:](bundleControllers, "addObjectsFromArray:", v22, &v27);

  return v21;
}

- (BOOL)doubleTapRequiresHover
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[BundleControllerHelper opaqueTouchSenderDescriptor](self, "opaqueTouchSenderDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("GesturesOnlyWhileHoveringEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BKSHIDServicesGetPersistentServiceProperties();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GesturesOnlyWhileHoveringEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)setDoubleTapRequiresHover:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("GesturesOnlyWhileHoveringEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BundleControllerHelper opaqueTouchSenderDescriptor](self, "opaqueTouchSenderDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BKSHIDServicesSetPersistentServiceProperties();

}

- (id)opaqueTouchSenderDescriptor
{
  return (id)objc_msgSend(MEMORY[0x24BE0B6B0], "build:", &__block_literal_global_12);
}

uint64_t __53__BundleControllerHelper_opaqueTouchSenderDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrimaryPage:primaryUsage:", 65376, 4096);
}

- (void)setOpaqueTouchProperty:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = v6;
  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BundleControllerHelper opaqueTouchSenderDescriptor](self, "opaqueTouchSenderDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BKSHIDServicesSetPersistentServiceProperties();

  v10 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_22ACC1000, v10, OS_LOG_TYPE_DEFAULT, "Setting opaque touch property: %@: %@", (uint8_t *)&v11, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleControllers, 0);
}

@end
