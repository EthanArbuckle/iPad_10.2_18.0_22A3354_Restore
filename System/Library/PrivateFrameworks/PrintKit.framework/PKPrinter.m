@implementation PKPrinter

- (PKPrinterBrowseInfo)browseInfo
{
  return self->_browseInfo;
}

- (id)initPKPrinterWithBrowseInfo:(id)a3
{
  id v5;
  PKPrinter *v6;
  PKPrinter *v7;
  PKPrinterDescription *printerDescription;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPrinter;
  v6 = -[PKPrinter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_browseInfo, a3);
    printerDescription = v7->_printerDescription;
    v7->_printerDescription = 0;

    -[PKPrinter _setInitialAccessStateFromBrowseInfo](v7, "_setInitialAccessStateFromBrowseInfo");
    -[PKPrinter _updateiCloudPrinterInfo](v7, "_updateiCloudPrinterInfo");
  }

  return v7;
}

- (BOOL)_allowedToPrintToThisPrinter
{
  NSObject *v3;
  const char *v4;
  void *v5;
  void *v6;
  BOOL v7;
  int v9;
  PKPrinter *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[PKPrinterBrowseInfo isIPPS](self->_browseInfo, "isIPPS")
    || !+[PKDefaults ippsIsRequired](PKDefaults, "ippsIsRequired"))
  {
    if (!+[PKDefaults mcProfilePrintersOnlyAllowed](PKDefaults, "mcProfilePrintersOnlyAllowed"))
      return 1;
    -[PKPrinter printerURL](self, "printerURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PKDefaults uriMatchesMCProfileAdded:](PKDefaults, "uriMatchesMCProfileAdded:", v6);

    if (v7)
      return 1;
    _PKLogCategory(PKLogCategoryFramework);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2080;
      v12 = "";
      v4 = "%@: managed configuration requires only known printers%s";
      goto LABEL_10;
    }
  }
  else
  {
    _PKLogCategory(PKLogCategoryFramework);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2080;
      v12 = "";
      v4 = "%@: ipps is required for this printer%s";
LABEL_10:
      _os_log_impl(&dword_220F9A000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v9, 0x16u);
    }
  }

  return 0;
}

+ (PKPrinter)printerWithURL:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5
{
  void *v8;
  PKPrinter *result;
  id v10;

  v10 = a5;
  +[PKPrinterBonjourEndpoint endpointWithURL:](PKPrinterBonjourEndpoint, "endpointWithURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "printerWithBonjourEndpoint:discoveryTimeout:completionHandler:", v8, v10, a4);

  return result;
}

+ (PKPrinter)printerWithName:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  NSObject *v12;
  PKPrinter *result;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("ipp:")) & 1) != 0
    || (objc_msgSend(v8, "hasPrefix:", CFSTR("ipps:")) & 1) != 0)
  {
    PKURLWithString(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[PKPrinterBonjourEndpoint endpointWithURL:](PKPrinterBonjourEndpoint, "endpointWithURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

    if (v11)
      goto LABEL_7;
  }
  else
  {
    +[PKPrinterBonjourEndpoint endpointWithBonjourString:](PKPrinterBonjourEndpoint, "endpointWithBonjourString:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
LABEL_7:
      objc_msgSend(a1, "printerWithBonjourEndpoint:discoveryTimeout:completionHandler:", v11, v9, a4);
      goto LABEL_12;
    }
  }
  _PKLogCategory(PKLogCategoryFramework);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = a1;
    v16 = 2112;
    v17 = v8;
    v18 = 2080;
    v19 = "";
    _os_log_impl(&dword_220F9A000, v12, OS_LOG_TYPE_DEFAULT, "%@: Couldn't create a bonjour endpoint from '%@'%s", (uint8_t *)&v14, 0x20u);
  }

  v9[2](v9, 0);
LABEL_12:

  return result;
}

+ (PKPrinter)printerWithBonjourEndpoint:(id)a3 discoveryTimeout:(double)a4 completionHandler:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  PKPrinter *result;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = a3;
  dispatch_async(v8, &__block_literal_global_10);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__PKPrinter_printerWithBonjourEndpoint_discoveryTimeout_completionHandler___block_invoke_2;
  v12[3] = &unk_24E6CDF80;
  v13 = v7;
  v10 = v7;
  +[PKPrinterBrowseInfo findPrinterWithBonjourEndpoint:withTimeout:completionHandler:](PKPrinterBrowseInfo, "findPrinterWithBonjourEndpoint:withTimeout:completionHandler:", v9, v12, a4);

  return result;
}

id __75__PKPrinter_printerWithBonjourEndpoint_discoveryTimeout_completionHandler___block_invoke()
{
  return +[PKDefaults iCloudPrinters](PKDefaults, "iCloudPrinters");
}

void __75__PKPrinter_printerWithBonjourEndpoint_discoveryTimeout_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && (objc_msgSend(v3, "_allowedToPrintToThisPrinter") & 1) != 0)
  {
    objc_msgSend(v3, "_updateiCloudPrinterInfo");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (PKPrinter)printerWithEndpointData:(id)a3 discoveryTime:(double)a4 completionHandler:(id)a5
{
  void *v8;
  PKPrinter *result;
  void (**v10)(id, _QWORD);

  v10 = (void (**)(id, _QWORD))a5;
  +[PKPrinterBonjourEndpoint endpointWithData:](PKPrinterBonjourEndpoint, "endpointWithData:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(a1, "printerWithBonjourEndpoint:discoveryTimeout:completionHandler:", v8, v10, a4);
  else
    v10[2](v10, 0);

  return result;
}

+ (PKPrinter)printerWithiCloudPrinter:(id)a3 discoveryTime:(double)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  PKCloudResolveContext *v9;
  NSObject *v10;
  void *v11;
  PKPrinter *result;
  int v13;
  PKCloudResolveContext *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = -[PKCloudResolveContext initWithPKCloudPrinter:timeout:completionHandler:]([PKCloudResolveContext alloc], "initWithPKCloudPrinter:timeout:completionHandler:", v7, v8, a4);
  _PKLogCategory(PKLogCategoryDiscovery[0]);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_220F9A000, v10, OS_LOG_TYPE_DEFAULT, "Created icloud resolution context %@ for %@", (uint8_t *)&v13, 0x16u);

  }
  -[PKCloudResolveContext start](v9, "start");

  return result;
}

+ (PKPrinter)printerWithName:(id)a3
{
  objc_msgSend(a1, "printerWithName:discoveryTimeout:", a3, 2.0);
  return (PKPrinter *)(id)objc_claimAutoreleasedReturnValue();
}

+ (PKPrinter)printerWithName:(id)a3 discoveryTimeout:(double)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  double v15;

  v6 = a3;
  v7 = a1;
  if (object_isClass(v7))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PKPrinter printerWithName:discoveryTimeout:]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v7, "+[PKPrinter printerWithName:discoveryTimeout:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__PKPrinter_printerWithName_discoveryTimeout___block_invoke;
  v12[3] = &unk_24E6CDFA8;
  v14 = v7;
  v9 = v6;
  v13 = v9;
  v15 = a4;
  withDebuggableSemaphore<PKPrinter * {__strong}>(v8, v12, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPrinter *)v10;
}

uint64_t __46__PKPrinter_printerWithName_discoveryTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "printerWithName:discoveryTimeout:completionHandler:", *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 48));
}

+ (BOOL)printerLookupWithName:(id)a3 andTimeout:(double)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "printerWithName:discoveryTimeout:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[PKPrinter uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateDescription:(id)a3 browseInfo:(id)a4
{
  id v7;
  NSDate *v8;
  NSDate *printerDescriptionTime;
  id v10;

  v10 = a3;
  v7 = a4;
  if (v10)
    objc_storeStrong((id *)&self->_printerDescription, a3);
  if (v7)
    objc_storeStrong((id *)&self->_browseInfo, a4);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  printerDescriptionTime = self->_printerDescriptionTime;
  self->_printerDescriptionTime = v8;

}

- (void)_updateiCloudPrinterInfo
{
  void *v3;
  uint64_t v4;
  PKiCloudPrinter *iCloudPrinter;
  PKiCloudPrinter *v6;
  id v7;
  _QWORD v8[5];

  +[PKDefaults iCloudPrinters](PKDefaults, "iCloudPrinters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8[1] = 3221225472;
    v8[2] = __37__PKPrinter__updateiCloudPrinterInfo__block_invoke;
    v8[3] = &unk_24E6CDFD0;
    v8[4] = self;
    v7 = v3;
    v8[0] = MEMORY[0x24BDAC760];
    v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v8);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      iCloudPrinter = self->_iCloudPrinter;
      self->_iCloudPrinter = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
      v6 = (PKiCloudPrinter *)objc_claimAutoreleasedReturnValue();
      iCloudPrinter = self->_iCloudPrinter;
      self->_iCloudPrinter = v6;
    }

    v3 = v7;
  }

}

uint64_t __37__PKPrinter__updateiCloudPrinterInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

- (void)withDescriptionAsync:(id)a3
{
  void (**v4)(id, PKPrinterDescription *);
  PKPrinterDescription *v5;
  void *v6;
  double v7;
  NSObject *v8;
  NSDate *v9;
  NSDate *printerDescriptionTime;
  void *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(id, PKPrinterDescription *);
  _QWORD v15[5];
  uint8_t buf[16];

  v4 = (void (**)(id, PKPrinterDescription *))a3;
  v5 = self->_printerDescription;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_printerDescriptionTime);
    if (v7 > 5.0)
    {
      _PKLogCategory(PKLogCategoryFramework);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220F9A000, v8, OS_LOG_TYPE_DEFAULT, "refreshing printer description after timeout", buf, 2u);
      }

      objc_msgSend(v6, "addTimeInterval:", 60.0);
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      printerDescriptionTime = self->_printerDescriptionTime;
      self->_printerDescriptionTime = v9;

      -[PKPrinter bonjourName](self, "bonjourName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __34__PKPrinter_withDescriptionAsync___block_invoke;
      v15[3] = &unk_24E6CDFF8;
      v15[4] = self;
      PrintdRPC::GetPrinterDescription(v11, 0, v15);

    }
    v4[2](v4, v5);

  }
  else
  {
    -[PKPrinter bonjourName](self, "bonjourName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __34__PKPrinter_withDescriptionAsync___block_invoke_2;
    v13[3] = &unk_24E6CE020;
    v13[4] = self;
    v14 = v4;
    PrintdRPC::GetPrinterDescription(v12, 0, v13);

  }
}

uint64_t __34__PKPrinter_withDescriptionAsync___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDescription:browseInfo:", a2, a3);
}

void __34__PKPrinter_withDescriptionAsync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_updateDescription:browseInfo:", v6, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PKPrinter description](self, "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_printerDescription)
    v6 = ", has_desc";
  else
    v6 = "";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %@%s }"), v4, self->_browseInfo, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)printerURL
{
  void *v3;
  PKPrinter *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  if (object_isClass(v4))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PKPrinter printerURL]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v4, "-[PKPrinter printerURL]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __23__PKPrinter_printerURL__block_invoke;
  v9[3] = &unk_24E6CD018;
  v6 = v3;
  v10 = v6;
  withDebuggableSemaphore<NSURL * {__strong}>(v5, v9, 5.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

uint64_t __23__PKPrinter_printerURL__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "withResolvedURL:", a2);
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentNameRepresentationForPrintKitUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)bonjourName
{
  return -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
}

- (NSString)bonjourDisplayName
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameForPrintKitUI");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = &stru_24E6CFEB0;
  return (NSString *)v4;
}

- (NSString)displayName
{
  __CFString *v3;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[PKiCloudPrinter displayName](self->_iCloudPrinter, "displayName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PKPrinter bonjourDisplayName](self, "bonjourDisplayName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = v5;
      v7 = -[__CFString rangeOfString:](v5, "rangeOfString:", CFSTR(" @ "));
      if (v7 != 0x7FFFFFFFFFFFFFFFLL && v6)
      {
        -[__CFString substringToIndex:](v3, "substringToIndex:", v7);
        v8 = objc_claimAutoreleasedReturnValue();

        v3 = (__CFString *)v8;
      }
    }
    else
    {
      v3 = &stru_24E6CFEB0;
    }
  }
  return (NSString *)v3;
}

- (NSString)location
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[PKiCloudPrinter location](self->_iCloudPrinter, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PKPrinterBrowseInfo location](self->_browseInfo, "location");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[PKPrinter bonjourDisplayName](self, "bonjourDisplayName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "rangeOfString:", CFSTR(" @ "));
      v3 = 0;
      if (v5 != 0x7FFFFFFFFFFFFFFFLL && v6)
      {
        objc_msgSend(v4, "substringFromIndex:", v5 + v6);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  return (NSString *)v3;
}

- (BOOL)isiCloudPrinter
{
  return self->_iCloudPrinter != 0;
}

- (NSDate)lastUsedDate
{
  return -[PKiCloudPrinter lastUsedDate](self->_iCloudPrinter, "lastUsedDate");
}

- (NSData)printerImageData
{
  return -[PKiCloudPrinter printerImageData](self->_iCloudPrinter, "printerImageData");
}

- (NSString)makeAndModel
{
  return -[PKPrinterBrowseInfo makeAndModel](self->_browseInfo, "makeAndModel");
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PKPrinterBrowseInfo uuid](self->_browseInfo, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isFromMCProfile
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "provenance") == 1)
  {
    v4 = 1;
  }
  else
  {
    -[PKPrinter printerURL](self, "printerURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[PKDefaults uriMatchesMCProfileAdded:](PKDefaults, "uriMatchesMCProfileAdded:", v6);

  }
  return v4;
}

- (int64_t)type
{
  return -[PKPrinterBrowseInfo type](self->_browseInfo, "type");
}

- (int64_t)kind
{
  void *v2;
  int64_t v3;

  -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "provenance") == 8)
    v3 = 3;
  else
    v3 = 4;

  return v3;
}

- (BOOL)supportsJobAccountID
{
  return (unint64_t)(-[PKPrinter jobAccountIDSupport](self, "jobAccountIDSupport") - 1) < 2;
}

- (int64_t)jobAccountIDSupport
{
  int64_t result;

  result = (int64_t)self->_printerDescription;
  if (result)
    return objc_msgSend((id)result, "jobAccountIDSupport");
  return result;
}

- (unint64_t)jobTypesSupported
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[PKPrinterBrowseInfo txtRecord](self->_browseInfo, "txtRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = 0;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(&unk_24E6E9EE8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
            v7 |= objc_msgSend(v11, "unsignedIntValue");

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasPrintInfoSupported
{
  return self->_printerDescription != 0;
}

- (NSDictionary)printInfoSupported
{
  PKPrinter *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = self;
  if (object_isClass(v2))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PKPrinter printInfoSupported]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v2, "-[PKPrinter printInfoSupported]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__PKPrinter_printInfoSupported__block_invoke;
  v6[3] = &unk_24E6CE070;
  v6[4] = v2;
  withDebuggableSemaphore<NSDictionary * {__strong}>(v3, v6, 5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

void __31__PKPrinter_printInfoSupported__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__PKPrinter_printInfoSupported__block_invoke_2;
  v6[3] = &unk_24E6CE048;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "withDescriptionAsync:", v6);

}

void __31__PKPrinter_printInfoSupported__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "printInfoSupportedDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (BOOL)hasIdentifyPrinterOp
{
  return -[PKPrinterDescription identifyActions](self->_printerDescription, "identifyActions") != 0;
}

- (void)identifySelf
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __25__PKPrinter_identifySelf__block_invoke;
  v3[3] = &unk_24E6CE098;
  objc_copyWeak(&v4, &location);
  -[PKPrinter withDescriptionAsync:](self, "withDescriptionAsync:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __25__PKPrinter_identifySelf__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_identifySelf:", v5);

    v3 = v5;
  }

}

- (void)_identifySelf:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_opt_new();
  if ((objc_msgSend(v9, "identifyActions") & 1) != 0
    && (PKLocalizedString(CFSTR("AirPrint Ready"), "AirPrint ready message to be shown on printer"),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "addObject:", CFSTR("display"));
  }
  else
  {
    v6 = 0;
  }
  if ((objc_msgSend(v9, "identifyActions") & 2) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("flash"));
  if ((objc_msgSend(v9, "identifyActions") & 4) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("sound"));
  -[PKPrinter browseInfo](self, "browseInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bonjourName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PrintdRPC::IdentifyPrinter(v8, v6, v4);

}

- (void)_updateAccessState:(int64_t)a3
{
  NSObject *v5;
  int64_t accessState;
  int v7;
  PKPrinter *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _PKLogCategory(PKLogCategoryFramework);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    accessState = self->_accessState;
    v7 = 138413058;
    v8 = self;
    v9 = 1024;
    v10 = accessState;
    v11 = 1024;
    v12 = a3;
    v13 = 2080;
    v14 = "";
    _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_DEFAULT, "%@: _accessState %d to %d%s", (uint8_t *)&v7, 0x22u);
  }

  self->_accessState = a3;
}

- (void)unlockWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t accessState;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  PKPrinter *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _PKLogCategory(PKLogCategoryFramework);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    accessState = self->_accessState;
    *(_DWORD *)buf = 138412802;
    v18 = self;
    v19 = 1024;
    v20 = accessState;
    v21 = 2080;
    v22 = "";
    _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_DEFAULT, "%@: unlockWithCompletionHandler current accessState=%d%s", buf, 0x1Cu);
  }

  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __41__PKPrinter_unlockWithCompletionHandler___block_invoke;
  v15[3] = &unk_24E6CE0C0;
  v8 = v4;
  v16 = v8;
  v9 = MEMORY[0x227667BF0](v15);
  v10 = (void *)v9;
  if (self->_accessState <= 0)
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __41__PKPrinter_unlockWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_24E6CE0E8;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v10;
    PrintdRPC::CheckAccessStateAsync(v11, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __41__PKPrinter_unlockWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__PKPrinter_unlockWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_24E6CCD88;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __41__PKPrinter_unlockWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __41__PKPrinter_unlockWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  id v6;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "_updateAccessState:", a2);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelUnlock
{
  NSObject *v3;
  int v4;
  PKPrinter *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _PKLogCategory(PKLogCategoryFramework);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412546;
    v5 = self;
    v6 = 2080;
    v7 = "";
    _os_log_impl(&dword_220F9A000, v3, OS_LOG_TYPE_DEFAULT, "%@: cancelUnlock%s", (uint8_t *)&v4, 0x16u);
  }

  PKCancelAlert(CFSTR("cancelUnlock"));
}

- (void)removeCredentialsFromKeychain
{
  PrintdRPC *v3;
  PKPrinterBonjourEndpoint *v4;

  -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
  v3 = (PrintdRPC *)objc_claimAutoreleasedReturnValue();
  PrintdRPC::RemoveKeychainItem(v3, v4);

  -[PKPrinter _setInitialAccessStateFromBrowseInfo](self, "_setInitialAccessStateFromBrowseInfo");
}

- (void)_setInitialAccessStateFromBrowseInfo
{
  void *v3;
  void *v4;
  int64_t v5;
  id v6;

  -[PKPrinterBrowseInfo txtRecord](self->_browseInfo, "txtRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("air"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("none")) ^ 1;
    v4 = v6;
  }
  else
  {
    v5 = 0;
  }
  self->_accessState = v5;

}

- (void)_checkAvailable:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  NSObject *v21;
  _QWORD v22[5];
  _QWORD handler[5];
  _QWORD block[4];
  id v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "provenance");

  if (v11 == 2)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "provenanceIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2080;
      v27 = (uint64_t (*)(uint64_t, uint64_t))"";
      _os_log_impl(&dword_220F9A000, v12, OS_LOG_TYPE_DEFAULT, "%@: extension printer (%{public}@) always available%s", buf, 0x20u);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke;
    block[3] = &unk_24E6CE110;
    v25 = v9;
    dispatch_async(v8, block);

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v27 = __Block_byref_object_copy__6;
    v28 = __Block_byref_object_dispose__6;
    v29 = (id)MEMORY[0x227667BF0](v9);
    v15 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);
    v16 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v17 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_79;
    handler[3] = &unk_24E6CE138;
    handler[4] = buf;
    dispatch_source_set_event_handler(v15, handler);
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_2;
    v22[3] = &unk_24E6CE138;
    v22[4] = buf;
    dispatch_source_set_cancel_handler(v15, v22);
    -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_3;
    v20[3] = &unk_24E6CE160;
    v20[4] = self;
    v19 = v15;
    v21 = v19;
    PrintdRPC::GetPrinterDescription(v18, 1, v20);

    dispatch_resume(v19);
    _Block_object_dispose(buf, 8);

  }
}

uint64_t __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_79(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __53__PKPrinter__checkAvailable_queue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateDescription:browseInfo:", a2, a3);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

- (void)pollForPrinterAttributes:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PKPrinter bonjourName](self, "bonjourName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PrintdRPC::QueryPrinterWithAttributess(v7, v8, v6);

}

- (void)pollForPrinterStatusQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CFAbsoluteTime Current;
  NSObject *v9;
  PrinterStatusQueuePoll *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  CFAbsoluteTime v17;
  uint8_t buf[4];
  PKPrinter *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  _PKLogCategory(PKLogCategoryFramework);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = self;
    _os_log_impl(&dword_220F9A000, v9, OS_LOG_TYPE_DEFAULT, "PKPrinter<%p>: pollForPrinterStatusQueue: start", buf, 0xCu);
  }

  PrinterStatusQueuePoll::requestedAttributess(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__PKPrinter_pollForPrinterStatusQueue_completionHandler___block_invoke;
  v14[3] = &unk_24E6CE188;
  v14[4] = self;
  v17 = Current;
  v12 = v6;
  v15 = v12;
  v13 = v7;
  v16 = v13;
  -[PKPrinter pollForPrinterAttributes:completionHandler:](self, "pollForPrinterAttributes:completionHandler:", v11, v14);

}

void __57__PKPrinter_pollForPrinterStatusQueue_completionHandler___block_invoke(uint64_t a1, void **a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  _PKLogCategory(PKLogCategoryFramework);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v40 = v6;
    _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_DEFAULT, "PKPrinter<%p>: pollForPrinterStatusQueue: done", buf, 0xCu);
  }

  if (a2)
  {
    v30 = (void *)objc_opt_new();
    Printd_Parameters::_get_PrinterMandatoryJobAttributes(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count"))
    {
      if (objc_msgSend(v29, "containsObject:", CFSTR("job-password")))
      {
        PKLocalizedString(CFSTR("This printer requires a PIN to print."), "PIN required message.");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v7);

      }
      if (objc_msgSend(v29, "containsObject:", CFSTR("job-account-id")))
      {
        PKLocalizedString(CFSTR("This printer requires account information."), "Warning string for printers requiring an ID for job accounting");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v8);

      }
    }
    Printd_Parameters::_get_PrinterStateReasons(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      Printd_Parameters::_get_MediaSourceSupported(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      Printd_Parameters::_get_PrinterInputTray(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKTray traysWithMediaSourceSupported:printerInputTrays:](PKTray, "traysWithMediaSourceSupported:printerInputTrays:", v9, v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      +[PKTray filter:withBlock:](PKTray, "filter:withBlock:", v27, &__block_literal_global_289);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v12 = v26;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v35;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = v16;
              objc_msgSend(v17, "localizedName");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v18);

            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
        }
        while (v13);
      }

      PKCopyLocalizedPrinterStateReasons(v28, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v30, "addObjectsFromArray:", v19);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("printer-status-time"));

    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("synth-printer-state-reasons-localized"));
  }
  else
  {
    PKLocalizedString(CFSTR("The printer is offline."), "The printer is offline.");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("synth-printer-state-reasons-localized"));
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("synth-printer-state-printer-rtt"));

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PKPrinter_pollForPrinterStatusQueue_completionHandler___block_invoke_96;
  block[3] = &unk_24E6CCDF0;
  v23 = *(NSObject **)(a1 + 40);
  v24 = *(id *)(a1 + 48);
  v32 = v4;
  v33 = v24;
  v25 = v4;
  dispatch_async(v23, block);

}

uint64_t __57__PKPrinter_pollForPrinterStatusQueue_completionHandler___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getSupplyLevels:(id)a3
{
  SuppliesPoll *v4;
  void *v5;
  SuppliesPoll *v6;
  _QWORD v7[4];
  SuppliesPoll *v8;

  v4 = (SuppliesPoll *)a3;
  SuppliesPoll::requestedAttributess(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__PKPrinter_getSupplyLevels___block_invoke;
  v7[3] = &unk_24E6CE1B0;
  v6 = v4;
  v8 = v6;
  -[PKPrinter pollForPrinterAttributes:completionHandler:](self, "pollForPrinterAttributes:completionHandler:", v5, v7);

}

void __29__PKPrinter_getSupplyLevels___block_invoke(uint64_t a1, void **a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  if (a2)
  {
    suppliesForPollResponse(a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__PKPrinter_getSupplyLevels___block_invoke_2;
  v7[3] = &unk_24E6CCDF0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __29__PKPrinter_getSupplyLevels___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)supportsColor
{
  return self->_supportsColor;
}

- (BOOL)supportsDuplex
{
  return self->_supportsDuplex;
}

- (int64_t)accessState
{
  return self->_accessState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_job_request, 0);
  objc_storeStrong((id *)&self->_printerDescriptionTime, 0);
  objc_storeStrong((id *)&self->_iCloudPrinter, 0);
  objc_storeStrong((id *)&self->_printerDescription, 0);
  objc_storeStrong((id *)&self->_browseInfo, 0);
}

- (BOOL)knowsReadyPaperList
{
  void *v2;
  char v3;

  -[PKPrinterDescription paperList](self->_printerDescription, "paperList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMediaReady");

  return v3;
}

- (BOOL)isPaperReady:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PKPrinterDescription paperList](self->_printerDescription, "paperList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPaperReady:", v4);

  return v6;
}

- (id)availableRollPapersPreferBorderless:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[PKPrinterDescription paperList](self->_printerDescription, "paperList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableRollPapersPreferBorderless:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)papersForPhotoWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;

  height = a3.height;
  width = a3.width;
  -[PKPrinterDescription paperList](self->_printerDescription, "paperList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "papersForPhotoWithSize:", width, height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)paperListForDuplexMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPrinterDescription paperList](self->_printerDescription, "paperList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paperListForDuplexMode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)papersForDocumentWithSize:(CGSize)a3 andDuplex:(BOOL)a4
{
  return -[PKPrinter papersForDocumentWithSize:scaleUpOnRoll:andDuplex:](self, "papersForDocumentWithSize:scaleUpOnRoll:andDuplex:", 0, a4, a3.width, a3.height);
}

- (id)papersForDocumentWithSize:(CGSize)a3 scaleUpOnRoll:(BOOL)a4 andDuplex:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double height;
  double width;
  void *v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  height = a3.height;
  width = a3.width;
  -[PKPrinterDescription paperList](self->_printerDescription, "paperList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "papersForDocumentWithSize:scaleUpOnRoll:andDuplex:", v6, v5, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)matchedPaper:(id)a3 preferBorderless:(BOOL)a4 withDuplexMode:(id)a5 didMatch:(BOOL *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  -[PKPrinterDescription paperList](self->_printerDescription, "paperList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "matchedPaper:preferBorderless:withDuplexMode:didMatch:", v10, v8, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)printURL:(id)a3 ofType:(id)a4 printSettings:(id)a5 completionHandlerWithLocalJobNumber:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  BOOL v16;
  __CFString *v17;
  int v18;
  __CFString *v19;
  void *v20;
  char v21;
  PKPrintJobRequest *v22;
  void *v23;
  PKPrintJobRequest *v24;
  PKPrintJobRequest *v25;
  _QWORD v26[4];
  id v27;
  PKPrintJobRequest *v28;
  __CFString *v29;
  id v30;
  char v31;
  uint8_t buf[4];
  PKPrinter *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  _PKLogCategory(PKLogCategoryFramework);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v33 = self;
    v34 = 2112;
    v35 = v10;
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = v12;
    v40 = 2080;
    v41 = "";
    _os_log_impl(&dword_220F9A000, v14, OS_LOG_TYPE_DEFAULT, "%@: printURL:%@ ofType:%@ printSettings:%@%s", buf, 0x34u);
  }

  v15 = -[PKPrinter _allowedToPrintToThisPrinter](self, "_allowedToPrintToThisPrinter");
  if (v10)
    v16 = v15;
  else
    v16 = 0;
  if (v16)
  {
    if (-[__CFString isEqual:](v11, "isEqual:", CFSTR("image/heic")))
    {
      v17 = CFSTR("image/jpeg");
    }
    else
    {
      v18 = -[__CFString isEqual:](v11, "isEqual:", CFSTR("image/png"));
      v17 = CFSTR("image/jpeg");
      if (!v18)
        v17 = v11;
    }
    v19 = v17;
    -[PKPrinterDescription jpegFeatures](self->_printerDescription, "jpegFeatures");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", CFSTR("icc"));

    v22 = [PKPrintJobRequest alloc];
    -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PKPrintJobRequest initWithPrinterName:](v22, "initWithPrinterName:", v23);

    -[PKPrintJobRequest setPrintSettings:](v24, "setPrintSettings:", v12);
    -[PKPrintJobRequest setFileType:](v24, "setFileType:", v19);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __89__PKPrinter_Printing__printURL_ofType_printSettings_completionHandlerWithLocalJobNumber___block_invoke;
    v26[3] = &unk_24E6CE1D8;
    v30 = v13;
    v27 = v10;
    v25 = v24;
    v28 = v25;
    v29 = v11;
    v31 = v21;
    -[PKPrintJobRequest startRequestCompletionHandler:](v25, "startRequestCompletionHandler:", v26);

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __89__PKPrinter_Printing__printURL_ofType_printSettings_completionHandlerWithLocalJobNumber___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  const __CFURL *v18;
  id v19;
  CGImageSource *v20;
  int v21;
  char v22;
  CFDictionaryRef v23;
  void *v24;
  CGImage *v25;
  int v26;
  CGImage *ImageAtIndex;
  CGColorSpace *ColorSpace;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  void *v37;
  const __CFURL *v38;
  id v39;
  CGImageSource *v40;
  CGImageSource *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  const __CFURL *v46;
  void *v47;
  id v48;
  const __CFDictionary *cf;
  id cfa;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t block;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    if (softLinkPUTIsPersistentURL(*(const __CFURL **)(a1 + 32)))
    {
      v3 = *(void **)(a1 + 32);
      v4 = *(void **)(a1 + 56);
      v5 = *(id *)(a1 + 40);
      v6 = v3;
      v7 = v4;
      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      block = MEMORY[0x24BDAC760];
      v57 = 3221225472;
      v58 = (const __CFString *)___ZL27writePersistentURLToPrinterP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke;
      v59 = &unk_24E6CE378;
      v61 = v5;
      v62 = v7;
      v60 = v6;
      v9 = v6;
      v10 = v7;
      v11 = v5;
      dispatch_async(v8, &block);

    }
    else
    {
      v12 = objc_msgSend(*(id *)(a1 + 48), "isEqual:", CFSTR("application/pdf"));
      v14 = *(void **)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      if (v12)
      {
        writeURLToPrinter(v13, *(void **)(a1 + 32), *(void **)(a1 + 56));
      }
      else
      {
        v15 = *(unsigned __int8 *)(a1 + 64);
        v17 = *(void **)(a1 + 48);
        v16 = *(void **)(a1 + 56);
        v51 = v13;
        v18 = v14;
        v52 = v17;
        v19 = v16;
        v20 = CGImageSourceCreateWithURL(v18, 0);
        if (v20)
        {
          v21 = objc_msgSend(v52, "isEqual:", CFSTR("image/jpeg"));
          if (v15)
            v22 = 1;
          else
            v22 = v21 ^ 1;
          if ((v22 & 1) != 0 || (v23 = CGImageSourceCopyProperties(v20, 0)) == 0)
          {
            v26 = 0;
          }
          else
          {
            cf = v23;
            -[__CFDictionary objectForKeyedSubscript:](cf, "objectForKeyedSubscript:", *MEMORY[0x24BDD9580]);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BDD9658]);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x24BDD9688]);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v25 = 0;
            }
            else
            {
              ImageAtIndex = CGImageSourceCreateImageAtIndex(v20, 0, 0);
              v25 = ImageAtIndex;
              if (ImageAtIndex && (ColorSpace = CGImageGetColorSpace(ImageAtIndex)) != 0)
              {
                CGColorSpaceGetName(ColorSpace);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v24 = 0;
              }
            }
            v29 = *MEMORY[0x24BDBF290];
            block = *MEMORY[0x24BDBF318];
            v57 = v29;
            v58 = CFSTR("Apple Wide Color Sharing Profile");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &block, 3);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30;
            if (v24)
              v26 = objc_msgSend(v30, "containsObject:", v24) ^ 1;
            else
              v26 = 0;
            if (v25)
              CFRelease(v25);
            CFRelease(cf);

          }
          if ((v21 ^ 1 | v26) == 1)
          {
            cfa = v51;
            v32 = v19;
            jpegWithImageSource(v20, v15 == 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v33)
            {
              v35 = v15 != 0;
              v53[0] = MEMORY[0x24BDAC760];
              v53[1] = 3221225472;
              v53[2] = ___ZL34convertFromImageSourceAndWriteJPEGP17PKPrintJobRequestP13CGImageSourcebhU13block_pointerFvP8NSNumberE_block_invoke;
              v53[3] = &unk_24E6CE410;
              v36 = v33;
              v54 = v36;
              v55 = v32;
              v37 = (void *)MEMORY[0x227667BF0](v53);
              if ((v35 | v21) == 1)
              {
                writeURLToPrinter(cfa, v36, v37);
              }
              else
              {
                v48 = cfa;
                v38 = (const __CFURL *)v36;
                v39 = v37;
                v46 = v38;
                v40 = CGImageSourceCreateWithURL(v38, 0);
                v41 = v40;
                if (v40)
                {
                  jpegWithImageSource(v40, 1);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  CFRelease(v41);
                  if (v42)
                  {
                    block = MEMORY[0x24BDAC760];
                    v57 = 3221225472;
                    v58 = (const __CFString *)___ZL21convertToSharableJPEGP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke;
                    v59 = &unk_24E6CE410;
                    v43 = v42;
                    v60 = v43;
                    v61 = v39;
                    writeURLToPrinter(v48, v43, &block);

                  }
                  else
                  {
                    (*((void (**)(id, _QWORD))v39 + 2))(v39, 0);
                  }

                }
                else
                {
                  (*((void (**)(id, _QWORD))v39 + 2))(v39, 0);
                }

              }
            }
            else
            {
              (*((void (**)(id, _QWORD))v32 + 2))(v32, 0);
            }

          }
          else
          {
            writeURLToPrinter(v51, v18, v19);
          }
          CFRelease(v20);
        }
        else
        {
          (*((void (**)(id, _QWORD))v19 + 2))(v19, 0);
        }

      }
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
}

- (void)printURL:(id)a3 ofType:(id)a4 printSettings:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__PKPrinter_Printing__printURL_ofType_printSettings_completionHandler___block_invoke;
  v12[3] = &unk_24E6CE200;
  v13 = v10;
  v11 = v10;
  -[PKPrinter printURL:ofType:printSettings:completionHandlerWithLocalJobNumber:](self, "printURL:ofType:printSettings:completionHandlerWithLocalJobNumber:", a3, a4, a5, v12);

}

uint64_t __71__PKPrinter_Printing__printURL_ofType_printSettings_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = 1280;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (int64_t)startJob:(id)a3 ofType:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  PKPrintJobRequest *v9;
  void *v10;
  PKPrintJobRequest *v11;
  PKPrintJobRequest *v12;
  NSObject *v13;
  PKPrintJobRequest *v14;
  int64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  NSObject *p_super;
  uint8_t buf[4];
  PKPrinter *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (char *)a4;
  _PKLogCategory(PKLogCategoryFramework);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v6;
    v27 = 2080;
    v28 = "";
    _os_log_impl(&dword_220F9A000, v8, OS_LOG_TYPE_DEFAULT, "%@: startJob ofType:%@ printSettings:%@%s", buf, 0x2Au);
  }

  if (-[PKPrinter _allowedToPrintToThisPrinter](self, "_allowedToPrintToThisPrinter"))
  {
    v9 = [PKPrintJobRequest alloc];
    -[PKPrinterBrowseInfo bonjourName](self->_browseInfo, "bonjourName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPrintJobRequest initWithPrinterName:](v9, "initWithPrinterName:", v10);

    -[PKPrintJobRequest setPrintSettings:](v11, "setPrintSettings:", v6);
    -[PKPrintJobRequest setFileType:](v11, "setFileType:", v7);
    if (v11)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __39__PKPrinter_Printing__startJob_ofType___block_invoke;
      v19[3] = &unk_24E6CE228;
      v12 = v11;
      p_super = &v12->super;
      if ((withDebuggableSemaphore<BOOL>(CFSTR("startJob:ofType:"), v19, 5.0) & 1) != 0)
      {
        _PKLogCategory(PKLogCategoryFramework);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_220F9A000, v13, OS_LOG_TYPE_DEFAULT, "Job submission - Job stream created", buf, 2u);
        }

        v14 = v12;
        v15 = 0;
        v16 = &self->_job_request->super;
        self->_job_request = v14;
      }
      else
      {
        _PKLogCategory(PKLogCategoryFramework);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_220F9A000, v16, OS_LOG_TYPE_DEFAULT, "Job submission - Could not create job", buf, 2u);
        }
        v15 = 1280;
      }

      v17 = p_super;
    }
    else
    {
      _PKLogCategory(PKLogCategoryFramework);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = self;
        v23 = 2080;
        v24 = "";
        _os_log_impl(&dword_220F9A000, v17, OS_LOG_TYPE_DEFAULT, "%@: unable to create ipp request%s", buf, 0x16u);
      }
      v15 = 1280;
    }

  }
  else
  {
    v15 = 1280;
  }

  return v15;
}

uint64_t __39__PKPrinter_Printing__startJob_ofType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "startRequestCompletionHandler:", a2);
}

- (int64_t)sendData:(const char *)a3 ofLength:(int64_t)a4
{
  void *v5;
  PKPrintJobRequest *v6;
  NSObject *v7;
  PKPrintJobRequest *v8;
  int64_t v9;
  _QWORD v11[4];
  PKPrintJobRequest *v12;
  id v13;
  uint8_t buf[4];
  PKPrinter *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_job_request)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_job_request;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__PKPrinter_Printing__sendData_ofLength___block_invoke;
    v11[3] = &unk_24E6CE250;
    v12 = v6;
    v13 = v5;
    v7 = v5;
    v8 = v6;
    if (withDebuggableSemaphore<BOOL>(CFSTR("sendData:ofLength:"), v11, 5.0))
      v9 = 0;
    else
      v9 = 1024;

  }
  else
  {
    _PKLogCategory(PKLogCategoryFramework);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2080;
      v17 = "";
      _os_log_impl(&dword_220F9A000, v7, OS_LOG_TYPE_DEFAULT, "%@: sendData called outside startJob/finishJob%s", buf, 0x16u);
    }
    v9 = 1282;
  }

  return v9;
}

uint64_t __41__PKPrinter_Printing__sendData_ofLength___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeRequestData:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

- (void)abortJobCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__PKPrinter_Printing__abortJobCompletionHandler___block_invoke;
  v6[3] = &unk_24E6CE200;
  v7 = v4;
  v5 = v4;
  -[PKPrinter finalizeJob:completionHandler:](self, "finalizeJob:completionHandler:", 1, v6);

}

uint64_t __49__PKPrinter_Printing__abortJobCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)finishJobCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__PKPrinter_Printing__finishJobCompletionHandler___block_invoke;
  v6[3] = &unk_24E6CE200;
  v7 = v4;
  v5 = v4;
  -[PKPrinter finalizeJob:completionHandler:](self, "finalizeJob:completionHandler:", 0, v6);

}

uint64_t __50__PKPrinter_Printing__finishJobCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2)
      v3 = 0;
    else
      v3 = 1282;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)finalizeJob:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);
  PKPrintJobRequest *job_request;
  PKPrintJobRequest *v8;
  NSObject *v9;
  int v10;
  PKPrinter *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  job_request = self->_job_request;
  if (job_request)
  {
    self->_job_request = 0;
    v8 = job_request;

    -[PKPrintJobRequest finishRequest:completionHandler:](v8, "finishRequest:completionHandler:", v4, v6);
  }
  else
  {
    _PKLogCategory(PKLogCategoryFramework);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2080;
      v13 = "";
      _os_log_impl(&dword_220F9A000, v9, OS_LOG_TYPE_DEFAULT, "%@: -finishJob called without -startJob%s", (uint8_t *)&v10, 0x16u);
    }

    if (v6)
      v6[2](v6, 0);
  }

}

@end
