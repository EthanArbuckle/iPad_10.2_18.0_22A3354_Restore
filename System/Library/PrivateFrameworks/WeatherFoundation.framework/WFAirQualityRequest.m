@implementation WFAirQualityRequest

+ (id)airQualityRequestForLocation:(id)a3 locale:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:locale:completionHandler:", v9, v8, v7);

  return v10;
}

- (WFAirQualityRequest)initWithLocation:(id)a3 locale:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFAirQualityRequest *v11;
  WFAirQualityRequest *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFAirQualityRequest;
  v11 = -[WFTask initWithResponseRequired:](&v15, sel_initWithResponseRequired_, 1);
  v12 = v11;
  if (v11)
  {
    if (v9)
    {
      -[WFAirQualityRequest setLocale:](v11, "setLocale:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAirQualityRequest setLocale:](v12, "setLocale:", v13);

    }
    -[WFAirQualityRequest setLocation:](v12, "setLocation:", v8);
    -[WFAirQualityRequest setCompletionHandler:](v12, "setCompletionHandler:", v10);
  }

  return v12;
}

- (id)options
{
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (-[WFAirQualityRequest attachRawAPIData](self, "attachRawAPIData"))
  {
    v4 = CFSTR("WFAirQualityRequestAttachRawAPIOptionsKey");
    v5[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBD1B8];
  }
  return v2;
}

- (void)startWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFAirQualityRequest location](self, "location");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityRequest locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityRequest options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTask identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "airQualityForLocation:locale:options:taskIdentifier:", v8, v5, v6, v7);

}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[WFAirQualityRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAirQualityRequest completionHandler](self, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "airQualityConditions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v6)[2](v6, v7, v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)WFAirQualityRequest;
  -[WFTask handleResponse:](&v9, sel_handleResponse_, v4);

}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[WFAirQualityRequest completionHandler](self, "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFAirQualityRequest;
  -[WFTask handleError:forResponseIdentifier:](&v9, sel_handleError_forResponseIdentifier_, v7, v6);

}

- (void)cleanup
{
  objc_super v3;

  -[WFAirQualityRequest setCompletionHandler:](self, "setCompletionHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WFAirQualityRequest;
  -[WFTask cleanup](&v3, sel_cleanup);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)attachRawAPIData
{
  return self->_attachRawAPIData;
}

- (void)setAttachRawAPIData:(BOOL)a3
{
  self->_attachRawAPIData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
