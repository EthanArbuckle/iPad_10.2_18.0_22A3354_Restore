@implementation VUIDebugViewDataSource

- (VUIDebugViewDataSource)init
{
  VUIDebugViewDataSource *v2;
  VUIDebugViewDataSource *v3;
  uint64_t v4;
  NSArray *metricsDataSource;
  uint64_t v6;
  NSArray *defaultsDataSource;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIDebugViewDataSource;
  v2 = -[VUIDebugViewDataSource init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VUIDebugViewDataSource _createMetricsDataSource](v2, "_createMetricsDataSource");
    v4 = objc_claimAutoreleasedReturnValue();
    metricsDataSource = v3->_metricsDataSource;
    v3->_metricsDataSource = (NSArray *)v4;

    -[VUIDebugViewDataSource _createDefaultsDataSource](v3, "_createDefaultsDataSource");
    v6 = objc_claimAutoreleasedReturnValue();
    defaultsDataSource = v3->_defaultsDataSource;
    v3->_defaultsDataSource = (NSArray *)v6;

  }
  return v3;
}

- (id)_createDefaultsDataSource
{
  void *v2;
  VUIDebugViewDefaults *v3;
  void *v4;
  void *v5;
  VUIDebugViewDefaults *v6;
  VUIDebugViewDefaults *v7;
  void *v8;
  void *v9;
  VUIDebugViewDefaults *v10;
  VUIDebugViewDefaults *v11;
  VUIDebugViewDefaults *v12;
  VUIDebugViewDefaults *v13;
  VUIDebugViewDefaults *v14;
  VUIDebugViewDefaults *v15;
  VUIDebugViewDefaults *v16;
  void *v17;

  v2 = (void *)objc_opt_new();
  v3 = [VUIDebugViewDefaults alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:](v3, "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Enable Debug UI"), 0, v5, *MEMORY[0x1E0DC6B08], 1);
  objc_msgSend(v2, "addObject:", v6);

  v7 = [VUIDebugViewDefaults alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:](v7, "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Stage Demo"), 0, v9, *MEMORY[0x1E0DC6B10], 1);
  objc_msgSend(v2, "addObject:", v10);

  v11 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:]([VUIDebugViewDefaults alloc], "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Ignore HTTP Cache"), 0, CFSTR("com.apple.ITMLKit"), CFSTR("IgnoreHTTPCache"), 1);
  objc_msgSend(v2, "addObject:", v11);

  v12 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:]([VUIDebugViewDefaults alloc], "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Print Document XML"), 0, CFSTR("com.apple.ITMLKit"), CFSTR("LogDocumentXML"), 1);
  objc_msgSend(v2, "addObject:", v12);

  v13 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:]([VUIDebugViewDefaults alloc], "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("JS Console Logging"), 0, CFSTR("com.apple.ITMLKit"), CFSTR("LogJSConsole"), 1);
  objc_msgSend(v2, "addObject:", v13);

  v14 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:]([VUIDebugViewDefaults alloc], "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Purge Images on Launch"), 0, CFSTR("com.apple.TVMLKit"), CFSTR("PurgeImageCache"), 1);
  objc_msgSend(v2, "addObject:", v14);

  v15 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:]([VUIDebugViewDefaults alloc], "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Page Perf UI"), 0, CFSTR("com.apple.TVMLKit"), CFSTR("PagePerformanceUIEnabled"), 1);
  objc_msgSend(v2, "addObject:", v15);

  v16 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:]([VUIDebugViewDefaults alloc], "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("UI Animation Coefficient"), CFSTR("Values (0, 2, 5, 10, 25)"), CFSTR("com.apple.UIKit"), CFSTR("UIAnimationDragCoefficient"), 0);
  objc_msgSend(v2, "addObject:", v16);
  v17 = (void *)objc_msgSend(v2, "copy");

  return v17;
}

- (id)_createMetricsDataSource
{
  void *v2;
  VUIDebugViewDefaults *v3;
  void *v4;
  void *v5;
  VUIDebugViewDefaults *v6;
  VUIDebugViewDefaults *v7;
  void *v8;
  void *v9;
  VUIDebugViewDefaults *v10;
  VUIDebugViewDefaults *v11;
  void *v12;
  void *v13;
  VUIDebugViewDefaults *v14;
  VUIDebugViewDefaults *v15;
  void *v16;
  void *v17;
  VUIDebugViewDefaults *v18;
  void *v19;

  v2 = (void *)objc_opt_new();
  v3 = [VUIDebugViewDefaults alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:](v3, "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Show logging in Console"), 0, v5, *MEMORY[0x1E0DC6B28], 1);
  objc_msgSend(v2, "addObject:", v6);

  v7 = [VUIDebugViewDefaults alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:](v7, "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Show expanded logging in Console"), 0, v9, *MEMORY[0x1E0DC6B20], 1);
  objc_msgSend(v2, "addObject:", v10);

  v11 = [VUIDebugViewDefaults alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:](v11, "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Metrics Expanded Click Logging"), 0, v13, *MEMORY[0x1E0DC6B18], 1);
  objc_msgSend(v2, "addObject:", v14);

  v15 = [VUIDebugViewDefaults alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[VUIDebugViewDefaults initWithTitle:subtitle:domain:defaultName:BOOLType:](v15, "initWithTitle:subtitle:domain:defaultName:BOOLType:", CFSTR("Log pageRender events"), 0, v17, *MEMORY[0x1E0DC6B30], 1);
  objc_msgSend(v2, "addObject:", v18);

  v19 = (void *)objc_msgSend(v2, "copy");
  return v19;
}

- (NSArray)metricsDataSource
{
  return self->_metricsDataSource;
}

- (void)setMetricsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_metricsDataSource, a3);
}

- (NSArray)defaultsDataSource
{
  return self->_defaultsDataSource;
}

- (void)setDefaultsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDataSource, 0);
  objc_storeStrong((id *)&self->_metricsDataSource, 0);
}

@end
