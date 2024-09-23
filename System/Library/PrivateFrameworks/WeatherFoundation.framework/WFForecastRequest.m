@implementation WFForecastRequest

+ (id)forecastRequestForLocation:(id)a3 onDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocation:onDate:completionHandler:", v10, v9, v8);

  return v11;
}

+ (id)forecastRequestForLocation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocation:completionHandler:", v7, v6);

  return v8;
}

- (WFForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  WFForecastRequest *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFForecastRequest initWithLocation:onDate:completionHandler:](self, "initWithLocation:onDate:completionHandler:", v8, v9, v7);

  return v10;
}

- (WFForecastRequest)initWithLocation:(id)a3 onDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  WFForecastRequest *v11;
  uint64_t v12;
  WFLocation *location;
  uint64_t v14;
  id completionHandler;
  uint64_t v16;
  NSLocale *locale;
  WFForecastRequest *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (!v10)
    goto LABEL_10;
  if (!v8)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 4;
LABEL_9:
    objc_msgSend(v19, "wf_errorWithCode:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v21);

LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  if (!v9)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 2;
    goto LABEL_9;
  }
  v23.receiver = self;
  v23.super_class = (Class)WFForecastRequest;
  v11 = -[WFTask init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    location = v11->_location;
    v11->_location = (WFLocation *)v12;

    objc_storeStrong((id *)&v11->_onDate, a4);
    v14 = MEMORY[0x212BE2990](v10);
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = (id)v14;

    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v16 = objc_claimAutoreleasedReturnValue();
    locale = v11->_locale;
    v11->_locale = (NSLocale *)v16;

  }
  self = v11;
  v18 = self;
LABEL_11:

  return v18;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyy-MM-dd'T'hh:mm:ss"));
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[WFForecastRequest onDate](self, "onDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFForecastRequest location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, date = %@, location = %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)startWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFForecastRequest location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFForecastRequest locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFForecastRequest onDate](self, "onDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("WFForecastRequestAttachRawAPIOptionsKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WFForecastRequest attachRawAPIData](self, "attachRawAPIData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTask identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forecastForLocation:locale:onDate:options:taskIdentifier:", v5, v6, v7, v9, v10);

}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  objc_super v19;

  v4 = a3;
  -[WFForecastRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "rawAPIData");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "forecast");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v4, "rawAPIData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFForecastRequest setRawAPIData:](self, "setRawAPIData:", v9);

      }
    }
    objc_msgSend(v4, "forecast");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    -[WFForecastRequest locale](self, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFForecastRequest setLocale:](self, "setLocale:", v13);

    }
    -[WFForecastRequest trackingParameter](self, "trackingParameter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      -[WFForecastRequest setTrackingParameter:](self, "setTrackingParameter:", CFSTR("apple_TWC"));
    -[WFForecastRequest locale](self, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFForecastRequest trackingParameter](self, "trackingParameter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "editLinksWithLocale:trackingParameter:", v15, v16);

    -[WFForecastRequest completionHandler](self, "completionHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v17)[2](v17, v11, v18);

  }
  v19.receiver = self;
  v19.super_class = (Class)WFForecastRequest;
  -[WFTask handleResponse:](&v19, sel_handleResponse_, v4);

}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[WFForecastRequest completionHandler](self, "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFForecastRequest;
  -[WFTask handleError:forResponseIdentifier:](&v9, sel_handleError_forResponseIdentifier_, v7, v6);

}

- (void)handleCancellation
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  objc_super v6;

  -[WFForecastRequest completionHandler](self, "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFForecastRequest completionHandler](self, "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)WFForecastRequest;
  -[WFTask handleCancellation](&v6, sel_handleCancellation);
}

- (void)cleanup
{
  objc_super v3;

  -[WFForecastRequest setCompletionHandler:](self, "setCompletionHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WFForecastRequest;
  -[WFTask cleanup](&v3, sel_cleanup);
}

+ (id)forecastRequestForLocation:(id)a3 date:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocation:date:completionHandler:", v10, v9, v8);

  return v11;
}

- (WFForecastRequest)initWithLocation:(id)a3 date:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  WFForecastRequest *v15;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateFromComponents:", v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = -[WFForecastRequest initWithLocation:onDate:completionHandler:](self, "initWithLocation:onDate:completionHandler:", v10, v13, v9);

  -[WFForecastRequest setDate:](v15, "setDate:", v8);
  return v15;
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)onDate
{
  return self->_onDate;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDateComponents)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)forecastType
{
  return self->_forecastType;
}

- (void)setForecastType:(unint64_t)a3
{
  self->_forecastType = a3;
}

- (BOOL)attachRawAPIData
{
  return self->_attachRawAPIData;
}

- (void)setAttachRawAPIData:(BOOL)a3
{
  self->_attachRawAPIData = a3;
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
  objc_storeStrong((id *)&self->_rawAPIData, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)trackingParameter
{
  return self->_trackingParameter;
}

- (void)setTrackingParameter:(id)a3
{
  objc_storeStrong((id *)&self->_trackingParameter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingParameter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_onDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
