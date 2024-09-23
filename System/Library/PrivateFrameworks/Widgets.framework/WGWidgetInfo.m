@implementation WGWidgetInfo

+ (id)widgetInfoWithExtension:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  if (+[WGCalendarWidgetInfo isCalendarExtension:](WGCalendarWidgetInfo, "isCalendarExtension:", v4))
    v5 = (objc_class *)WGCalendarWidgetInfo;
  else
    v5 = (objc_class *)a1;
  v6 = (void *)objc_msgSend([v5 alloc], "initWithExtension:", v4);

  return v6;
}

+ (void)_updateRowHeightForContentSizeCategory
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WGWidgetRowHeightDidChangeNotification"), 0);

}

+ (double)maximumContentHeightForCompactDisplayMode
{
  void *v2;
  uint64_t v3;
  double result;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("WGAzulWidgetsType"));

  if ((unint64_t)(v3 - 1) < 2)
    return 200.0;
  if (v3 == 3)
    return 400.0;
  result = 0.0;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDE27F0], "widgetRowHeight", 0.0);
    return v5 * 2.5;
  }
  return result;
}

+ (id)_productVersion
{
  if (_productVersion_onceToken != -1)
    dispatch_once(&_productVersion_onceToken, &__block_literal_global_28);
  return (id)_productVersion___productVersion;
}

void __31__WGWidgetInfo__productVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)_productVersion___productVersion;
  _productVersion___productVersion = v0;

}

- (WGWidgetInfo)initWithExtension:(id)a3
{
  id v5;
  WGWidgetInfo *v6;
  WGWidgetInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetInfo;
  v6 = -[WGWidgetInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    v7->_largestAllowedDisplayMode = 1;
  }

  return v7;
}

- (WGWidgetInfo)widgetInfoWithExtension:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSString *displayName;
  WGWidgetInfo *v11;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetInfo extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    objc_storeStrong((id *)&self->_extension, a3);
    displayName = self->_displayName;
    self->_displayName = 0;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)widgetIdentifier
{
  return (NSString *)-[NSExtension identifier](self->_extension, "identifier");
}

- (NSString)displayName
{
  NSString *displayName;
  NSExtension *v4;
  NSExtension *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  displayName = self->_displayName;
  if (!displayName)
  {
    v4 = self->_extension;
    v5 = v4;
    if (v4)
    {
      -[NSExtension objectForInfoDictionaryKey:](v4, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "length"))
      {
        v7 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v8 = v7;
          -[NSExtension identifier](v5, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v9;
          v20 = 2114;
          v21 = CFSTR("CFBundleDisplayName");
          _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "No display name found for identifier (%{public}@): specify a display name with the '%{public}@' key in the widget's Info.plist", (uint8_t *)&v18, 0x16u);

        }
      }
    }
    else
    {
      v6 = 0;
    }
    if (!objc_msgSend(v6, "length"))
    {
      v10 = (void *)MEMORY[0x24BDC1538];
      -[NSExtension identifier](v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "applicationProxyForIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "localizedName");
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
    if (!objc_msgSend(v6, "length"))
    {
      -[NSExtension identifier](v5, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v15;
    }

    v16 = self->_displayName;
    self->_displayName = (NSString *)v6;

    displayName = self->_displayName;
  }
  return displayName;
}

- (id)_queue_iconFromWidgetBundleForWidgetWithIdentifier:(id)a3 extension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v5 = a3;
  v6 = a4;
  BSDispatchQueueAssertNotMain();
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection") != 1)
    goto LABEL_8;
  objc_msgSend(v6, "objectForInfoDictionaryKey:", CFSTR("CFBundleIconFilesRightToLeft"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
    v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_8:
    objc_msgSend(v6, "objectForInfoDictionaryKey:", CFSTR("CFBundleIcons"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = v13;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    objc_msgSend(v17, "objectForKey:", CFSTR("CFBundlePrimaryIcon"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    v20 = v18;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v22 = v21;

    objc_msgSend(v22, "objectForKey:", CFSTR("CFBundleIconName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_opt_class();
    v25 = v23;
    if (v24)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v12 = v26;

    if (!v12)
    {
      objc_msgSend(v6, "objectForInfoDictionaryKey:", CFSTR("CFBundleIconFiles"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_class();
      v29 = v27;
      if (v28)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
      }
      else
      {
        v30 = 0;
      }
      v31 = v30;

      objc_msgSend(v31, "firstObject");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  if (objc_msgSend(v12, "length"))
  {
    v32 = (void *)MEMORY[0x24BDF6AC8];
    v33 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(MEMORY[0x24BDC1588], "pluginKitProxyForIdentifier:", v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bundleURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bundleWithURL:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "imageNamed:inBundle:", v12, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)_queue_iconWithSize:(CGSize)a3 scale:(double)a4 forWidgetWithIdentifier:(id)a5 extension:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v28[2];

  height = a3.height;
  width = a3.width;
  v28[1] = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  BSDispatchQueueAssertNotMain();
  if (objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple."))
    && (-[WGWidgetInfo _queue_iconFromWidgetBundleForWidgetWithIdentifier:extension:](self, "_queue_iconFromWidgetBundleForWidgetWithIdentifier:extension:", v11, v12), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    v15 = objc_alloc(MEMORY[0x24BE51A80]);
    v16 = objc_retainAutorelease(v14);
    v17 = objc_msgSend(v16, "CGImage");
    objc_msgSend(v16, "scale");
    v18 = (void *)objc_msgSend(v15, "initWithCGImage:scale:", v17);
    v19 = objc_alloc(MEMORY[0x24BE51A90]);
    v28[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithImages:", v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1588], "pluginKitProxyForIdentifier:", v11);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithResourceProxy:", v16);
  }

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", width, height, a4);
  objc_msgSend(v21, "imageForImageDescriptor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDF6AC8];
  v25 = objc_msgSend(v23, "CGImage");
  objc_msgSend(v23, "scale");
  objc_msgSend(v24, "imageWithCGImage:scale:orientation:", v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_queue_iconWithOutlineForWidgetWithIdentifier:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertNotMain();
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple."))
    && (-[WGWidgetInfo _queue_iconFromWidgetBundleForWidgetWithIdentifier:extension:](self, "_queue_iconFromWidgetBundleForWidgetWithIdentifier:extension:", v6, v7), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = objc_alloc(MEMORY[0x24BE51A80]);
    v11 = objc_retainAutorelease(v9);
    v12 = objc_msgSend(v11, "CGImage");
    objc_msgSend(v11, "scale");
    v13 = (void *)objc_msgSend(v10, "initWithCGImage:scale:", v12);
    v14 = objc_alloc(MEMORY[0x24BE51A90]);
    v23[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithImages:", v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1588], "pluginKitProxyForIdentifier:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithResourceProxy:", v11);
  }

  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AE0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDrawBorder:", 1);
  objc_msgSend(v16, "imageForImageDescriptor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDF6AC8];
  v20 = objc_msgSend(v18, "CGImage");
  objc_msgSend(v18, "scale");
  objc_msgSend(v19, "imageWithCGImage:scale:orientation:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)_requestIcon:(BOOL)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v6 = a4;
  if (v6)
  {
    -[WGWidgetInfo widgetIdentifier](self, "widgetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetInfo extension](self, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__WGWidgetInfo__requestIcon_withHandler___block_invoke;
    v12[3] = &unk_24D731B98;
    objc_copyWeak(&v16, &location);
    v17 = a3;
    v13 = v7;
    v14 = v8;
    v15 = v6;
    v10 = v8;
    v11 = v7;
    dispatch_async(v9, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __41__WGWidgetInfo__requestIcon_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v2, "size");
    v5 = v4;
    v7 = v6;
    objc_msgSend(v3, "scale");
    objc_msgSend(WeakRetained, "_queue_iconWithSize:scale:forWidgetWithIdentifier:extension:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, v7, v8);
  }
  else
  {
    objc_msgSend(WeakRetained, "_queue_iconWithOutlineForWidgetWithIdentifier:extension:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)requestIconWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    -[WGWidgetInfo _icon](self, "_icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      dispatch_get_global_queue(25, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__WGWidgetInfo_requestIconWithHandler___block_invoke;
      block[3] = &unk_24D731BC0;
      v12 = v4;
      v11 = v5;
      dispatch_async(v6, block);

      v7 = v12;
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __39__WGWidgetInfo_requestIconWithHandler___block_invoke_2;
      v8[3] = &unk_24D731BE8;
      v8[4] = self;
      v9 = v4;
      -[WGWidgetInfo _requestIcon:withHandler:](self, "_requestIcon:withHandler:", 1, v8);
      v7 = v9;
    }

  }
}

uint64_t __39__WGWidgetInfo_requestIconWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __39__WGWidgetInfo_requestIconWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WGWidgetInfo_requestIconWithHandler___block_invoke_3;
  block[3] = &unk_24D731620;
  objc_copyWeak(&v7, &location);
  v4 = v3;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __39__WGWidgetInfo_requestIconWithHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setIcon:", *(_QWORD *)(a1 + 32));

}

- (void)requestSettingsIconWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    -[WGWidgetInfo _outlineIcon](self, "_outlineIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      dispatch_get_global_queue(25, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke;
      block[3] = &unk_24D731BC0;
      v12 = v4;
      v11 = v5;
      dispatch_async(v6, block);

      v7 = v12;
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke_2;
      v8[3] = &unk_24D731BE8;
      v8[4] = self;
      v9 = v4;
      -[WGWidgetInfo _requestIcon:withHandler:](self, "_requestIcon:withHandler:", 0, v8);
      v7 = v9;
    }

  }
}

uint64_t __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke_3;
  block[3] = &unk_24D731620;
  objc_copyWeak(&v7, &location);
  v4 = v3;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setOutlineIcon:", *(_QWORD *)(a1 + 32));

}

- (void)_resetIconsImpl
{
  id v3;

  BSDispatchQueueAssertMain();
  -[WGWidgetInfo _setIcon:](self, "_setIcon:", 0);
  -[WGWidgetInfo _setOutlineIcon:](self, "_setOutlineIcon:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WGWidgetInfoIconDidInvalidateNotification"), 0);

}

- (void)_resetIcons
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __27__WGWidgetInfo__resetIcons__block_invoke;
  v2[3] = &unk_24D7316E8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __27__WGWidgetInfo__resetIcons__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetIconsImpl");

}

- (NSString)_sdkVersion
{
  NSString *sdkVersion;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  int v12;
  NSString *v13;
  NSString *v14;

  sdkVersion = self->_sdkVersion;
  if (!sdkVersion)
  {
    v4 = (void *)MEMORY[0x24BDC1538];
    -[WGWidgetInfo widgetIdentifier](self, "widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationProxyForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sdkVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)objc_msgSend(v8, "copy");
    v10 = self->_sdkVersion;
    self->_sdkVersion = v9;

    if (!self->_sdkVersion)
    {
      -[WGWidgetInfo widgetIdentifier](self, "widgetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple."));

      if (v12)
      {
        objc_msgSend((id)objc_opt_class(), "_productVersion");
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = self->_sdkVersion;
        self->_sdkVersion = v13;

      }
    }

    sdkVersion = self->_sdkVersion;
  }
  return sdkVersion;
}

- (BOOL)isLinkedOnOrAfterSystemVersion:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[WGWidgetInfo _sdkVersion](self, "_sdkVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _WGIsSystemVersionSameOrAfterSystemVersion(v5, v4);

  return v6;
}

- (double)initialHeight
{
  double result;

  objc_msgSend((id)objc_opt_class(), "maximumContentHeightForCompactDisplayMode");
  return result;
}

- (BOOL)wantsVisibleFrame
{
  void *v3;
  int v4;

  if ((*(_BYTE *)&self->_widgetInfoFlags & 1) == 0)
  {
    *(_BYTE *)&self->_widgetInfoFlags |= 1u;
    -[WGWidgetInfo widgetIdentifier](self, "widgetIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."));
    if (v4)
      LOBYTE(v4) = _WGBoolValueForInfoDictionaryKey((uint64_t)v3, CFSTR("NCWidgetWantsVisibleFrame"));
    self->_wantsVisibleFrame = v4;

  }
  return self->_wantsVisibleFrame;
}

- (void)_setWantsVisibleFrame:(BOOL)a3
{
  char widgetInfoFlags;

  widgetInfoFlags = (char)self->_widgetInfoFlags;
  if (self->_wantsVisibleFrame != a3 || (widgetInfoFlags & 1) == 0)
  {
    *(_BYTE *)&self->_widgetInfoFlags = widgetInfoFlags | 1;
    self->_wantsVisibleFrame = a3;
  }
}

- (void)registerWidgetHost:(id)a3
{
  id v4;
  NSPointerArray *registeredWidgetHosts;
  NSPointerArray *v6;
  NSPointerArray *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    registeredWidgetHosts = self->_registeredWidgetHosts;
    v8 = v4;
    if (!registeredWidgetHosts)
    {
      objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
      v6 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_registeredWidgetHosts;
      self->_registeredWidgetHosts = v6;

      registeredWidgetHosts = self->_registeredWidgetHosts;
    }
    -[NSPointerArray addPointer:](registeredWidgetHosts, "addPointer:", v8);
    -[WGWidgetInfo preferredContentSize](self, "preferredContentSize");
    objc_msgSend(v8, "setPreferredContentSize:");
    v4 = v8;
  }

}

- (void)updatePreferredContentSize:(CGSize)a3 forWidgetHost:(id)a4
{
  double height;
  double width;
  id v7;
  WGWidgetInfo *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSPointerArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  height = a3.height;
  width = a3.width;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(v7, "widgetInfo");
  v8 = (WGWidgetInfo *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
  {
    -[WGWidgetInfo preferredContentSize](self, "preferredContentSize");
    v10 = v9;
    v12 = v11;
    -[WGWidgetInfo setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
    if (v10 != width || v12 != height)
    {
      -[NSPointerArray compact](self->_registeredWidgetHosts, "compact");
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = self->_registeredWidgetHosts;
      v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            v18 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v17);
            if (v18 != v7)
              objc_msgSend(v18, "setPreferredContentSize:", width, height, (_QWORD)v19);
            ++v17;
          }
          while (v15 != v17);
          v15 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v15);
      }

    }
  }

}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)_setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (int64_t)initialDisplayMode
{
  return self->_initialDisplayMode;
}

- (int64_t)largestAllowedDisplayMode
{
  return self->_largestAllowedDisplayMode;
}

- (void)_setLargestAllowedDisplayMode:(int64_t)a3
{
  self->_largestAllowedDisplayMode = a3;
}

- (UIImage)_icon
{
  return self->_icon;
}

- (void)_setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIImage)_outlineIcon
{
  return self->_outlineIcon;
}

- (void)_setOutlineIcon:(id)a3
{
  objc_storeStrong((id *)&self->_outlineIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_registeredWidgetHosts, 0);
}

@end
