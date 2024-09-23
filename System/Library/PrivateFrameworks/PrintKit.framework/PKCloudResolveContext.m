@implementation PKCloudResolveContext

- (PKCloudResolveContext)initWithPKCloudPrinter:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  PKCloudResolveContext *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *tag;
  uint64_t v15;
  id completionHandler;
  uint64_t v17;
  NSDate *startTime;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  NSObject *v21;
  NSString *v22;
  objc_super v24;
  uint8_t buf[4];
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKCloudResolveContext;
  v11 = -[PKCloudResolveContext init](&v24, sel_init);
  if (v11)
  {
    v12 = -[PKCloudResolveContext initWithPKCloudPrinter:timeout:completionHandler:]::sTag++;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PKCloudResolveContext<%p:%d>"), v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    tag = v11->_tag;
    v11->_tag = (NSString *)v13;

    v11->_timeout = a4;
    objc_storeStrong((id *)&v11->_icloudPrinter, a3);
    v15 = MEMORY[0x227667BF0](v10);
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = (id)v15;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = objc_claimAutoreleasedReturnValue();
    startTime = v11->_startTime;
    v11->_startTime = (NSDate *)v17;

    v19 = dispatch_queue_create("com.apple.printing.reachable", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v19;

    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v11->_tag;
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_impl(&dword_220F9A000, v21, OS_LOG_TYPE_DEFAULT, "ALLOC: %@", buf, 0xCu);
    }

  }
  return v11;
}

- (void)_complete:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *tag;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PKLogCategory(PKLogCategoryDiscovery[0]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    tag = self->_tag;
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_startTime);
    v9 = v8;
    objc_msgSend(v4, "bonjourDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = tag;
    v13 = 2048;
    v14 = v9;
    v15 = 2048;
    v16 = v4;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_DEFAULT, "%@: FINISH after %.5fs - printer %p { %@ }", (uint8_t *)&v11, 0x2Au);

  }
  (*((void (**)(void))self->_completionHandler + 2))();

}

- (void)start
{
  PKiCloudPrinter *icloudPrinter;
  void *v4;
  NSEnumerator *v5;
  NSEnumerator *enumerator;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  NSString *tag;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  icloudPrinter = self->_icloudPrinter;
  if (icloudPrinter)
  {
    -[PKiCloudPrinter printerURLs](icloudPrinter, "printerURLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectEnumerator");
      v5 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
      enumerator = self->_enumerator;
      self->_enumerator = v5;

      -[PKCloudResolveContext _driveResolution](self, "_driveResolution");
    }
    else
    {
      _PKLogCategory(PKLogCategoryDiscovery[0]);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        tag = self->_tag;
        v11 = 138412290;
        v12 = tag;
        _os_log_impl(&dword_220F9A000, v9, OS_LOG_TYPE_DEFAULT, "%@: printer array is nil", (uint8_t *)&v11, 0xCu);
      }

      -[PKCloudResolveContext _complete:](self, "_complete:", 0);
    }

  }
  else
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = self->_tag;
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_220F9A000, v7, OS_LOG_TYPE_ERROR, "%@: _icloudPrinter is nil", (uint8_t *)&v11, 0xCu);
    }

    -[PKCloudResolveContext _complete:](self, "_complete:", 0);
  }
}

- (void)_driveResolution
{
  void *v3;
  OS_dispatch_queue *v4;
  NSObject *v5;
  NSString *tag;
  double timeout;
  id *v8;
  NSObject *v9;
  NSString *v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  double v14;
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[4];
  _QWORD v18[2];
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[NSEnumerator nextObject](self->_enumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = self->_queue;
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ipp:")) & 1) != 0
      || objc_msgSend(v3, "hasPrefix:", CFSTR("ipps:")))
    {
      _PKLogCategory(PKLogCategoryDiscovery[0]);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        tag = self->_tag;
        *(_DWORD *)buf = 138412547;
        v20 = tag;
        v21 = 2113;
        v22 = v3;
        _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_DEFAULT, "%@ CALL %{private}@", buf, 0x16u);
      }

      timeout = self->_timeout;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __41__PKCloudResolveContext__driveResolution__block_invoke;
      v17[3] = &unk_24E6CE2A0;
      v18[0] = v4;
      v18[1] = self;
      +[PKPrinter printerWithName:discoveryTimeout:completionHandler:](PKPrinter, "printerWithName:discoveryTimeout:completionHandler:", v3, v17, timeout);
      v8 = (id *)v18;
    }
    else
    {
      _PKLogCategory(PKLogCategoryDiscovery[0]);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_tag;
        *(_DWORD *)buf = 138412547;
        v20 = v12;
        v21 = 2113;
        v22 = v3;
        _os_log_impl(&dword_220F9A000, v11, OS_LOG_TYPE_DEFAULT, "%@ CALL %{private}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_timeout;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __41__PKCloudResolveContext__driveResolution__block_invoke_258;
      v15[3] = &unk_24E6CE2A0;
      v16[0] = v4;
      v16[1] = self;
      +[PKPrinter printerWithURL:discoveryTimeout:completionHandler:](PKPrinter, "printerWithURL:discoveryTimeout:completionHandler:", v13, v15, v14);

      v8 = (id *)v16;
    }

  }
  else
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_tag;
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_220F9A000, v9, OS_LOG_TYPE_DEFAULT, "%@: completed enumeration", buf, 0xCu);
    }

    -[PKCloudResolveContext _complete:](self, "_complete:", 0);
  }

}

void __41__PKCloudResolveContext__driveResolution__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__PKCloudResolveContext__driveResolution__block_invoke_2;
  v6[3] = &unk_24E6CE278;
  v4 = *(NSObject **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __41__PKCloudResolveContext__driveResolution__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkFound:", *(_QWORD *)(a1 + 40));
}

void __41__PKCloudResolveContext__driveResolution__block_invoke_258(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__PKCloudResolveContext__driveResolution__block_invoke_2_259;
  v6[3] = &unk_24E6CE278;
  v4 = *(NSObject **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __41__PKCloudResolveContext__driveResolution__block_invoke_2_259(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkFound:", *(_QWORD *)(a1 + 40));
}

- (void)_checkFound:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  NSString *tag;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __37__PKCloudResolveContext__checkFound___block_invoke;
    v9[3] = &unk_24E6CE2C8;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v10, "pollForPrinterStatusQueue:completionHandler:", queue, v9);

  }
  else
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      tag = self->_tag;
      *(_DWORD *)buf = 138412290;
      v12 = tag;
      _os_log_impl(&dword_220F9A000, v7, OS_LOG_TYPE_DEFAULT, "%@ Not found, trying next", buf, 0xCu);
    }

    -[PKCloudResolveContext _driveResolution](self, "_driveResolution");
  }

}

void __37__PKCloudResolveContext__checkFound___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("printer-status-time")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_complete:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v9 = 138412547;
      v10 = v8;
      v11 = 2113;
      v12 = v7;
      _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_DEFAULT, "%@ found printer %{private}@ not reachable, trying next", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_driveResolution");
  }

}

- (id)description
{
  void *v3;
  NSString *tag;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  tag = self->_tag;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_startTime);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %.5fs running }"), tag, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *tag;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _PKLogCategory(PKLogCategoryDiscovery[0]);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    tag = self->_tag;
    *(_DWORD *)buf = 138412290;
    v7 = tag;
    _os_log_impl(&dword_220F9A000, v3, OS_LOG_TYPE_DEFAULT, "DEALLOC: %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PKCloudResolveContext;
  -[PKCloudResolveContext dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_icloudPrinter, 0);
}

@end
