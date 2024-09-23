@implementation VUIJSMetricsInterface

- (VUIJSMetricsInterface)initWithAppContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIJSMetricsInterface;
  return -[VUIJSObject initWithAppContext:](&v4, sel_initWithAppContext_, a3);
}

- (void)recordLogEvent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordLog:", v3);

}

- (void)campaignAttributionForUrl:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v7, v10);
  -[VUIJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v11);

  objc_initWeak(&from, self);
  objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDA10]), "initWithURL:bag:", v8, v12);
  objc_msgSend(v13, "perform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__VUIJSMetricsInterface_campaignAttributionForUrl::__block_invoke;
  v17[3] = &unk_1E9FA59D0;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  v15 = v10;
  v18 = v15;
  v16 = (id)objc_msgSend(v14, "thenWithBlock:", v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

uint64_t __52__VUIJSMetricsInterface_campaignAttributionForUrl::__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "redirectURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__VUIJSMetricsInterface_campaignAttributionForUrl::__block_invoke_2;
  v9[3] = &unk_1E9F9DB28;
  objc_copyWeak(&v12, a1 + 6);
  v10 = a1[4];
  v7 = v5;
  v11 = v7;
  objc_msgSend(WeakRetained, "evaluate:", v9);

  objc_destroyWeak(&v12);
  return 0;
}

void __52__VUIJSMetricsInterface_campaignAttributionForUrl::__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "callWithArguments:", v4);

  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
}

@end
