@implementation WFAggregateCommonRequest

- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 trackingParameter:(id)a5 completionHandler:(id)a6
{
  return -[WFAggregateCommonRequest initWithLocation:types:units:trackingParameter:completionHandler:](self, "initWithLocation:types:units:trackingParameter:completionHandler:", a3, a4, 0, a5, a6);
}

- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 units:(int)a5 trackingParameter:(id)a6 completionHandler:(id)a7
{
  return -[WFAggregateCommonRequest initWithLocation:types:units:requestOptions:trackingParameter:completionHandler:](self, "initWithLocation:types:units:requestOptions:trackingParameter:completionHandler:", a3, a4, *(_QWORD *)&a5, 0, a6, a7);
}

- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 units:(int)a5 requestOptions:(id)a6 trackingParameter:(id)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  WFAggregateCommonRequest *v19;
  WFAggregateCommonRequest *v20;
  void **p_trackingParameter;
  uint64_t v22;
  id completionHandler;
  uint64_t v24;
  NSLocale *locale;
  void *v26;
  void *v27;
  id v29;
  objc_super v30;

  v29 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = -[WFAggregateCommonRequest _supportedForecastTypes:](self, "_supportedForecastTypes:", a4);
  v30.receiver = self;
  v30.super_class = (Class)WFAggregateCommonRequest;
  v19 = -[WFTask init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_location, a3);
    v20->_types = v18;
    p_trackingParameter = (void **)&v20->_trackingParameter;
    objc_storeStrong((id *)&v20->_trackingParameter, a7);
    v20->_units = a5;
    objc_storeStrong((id *)&v20->_requestOptions, a6);
    v22 = MEMORY[0x212BE2990](v17);
    completionHandler = v20->_completionHandler;
    v20->_completionHandler = (id)v22;

    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v24 = objc_claimAutoreleasedReturnValue();
    locale = v20->_locale;
    v20->_locale = (NSLocale *)v24;

    -[WFAggregateCommonRequest trackingParameter](v20, "trackingParameter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = *p_trackingParameter;
      *p_trackingParameter = CFSTR("apple_TWC");

    }
  }

  return v20;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[WFAggregateCommonRequest location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, location = %@, types = %lu>"), v4, self, v5, -[WFAggregateCommonRequest types](self, "types"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)_supportedForecastTypes:(unint64_t)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v9 = 0;
  v10[0] = &v9;
  v10[1] = 0x2020000000;
  v10[2] = a3;
  WFAggregateCommonRequestSupportedForecastTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__WFAggregateCommonRequest__supportedForecastTypes___block_invoke;
  v8[3] = &unk_24CCA2740;
  v8[4] = &v9;
  v8[5] = &v11;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v8);

  if (*(_QWORD *)(v10[0] + 24))
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_opt_class();
      -[WFAggregateCommonRequest _supportedForecastTypes:].cold.1(v5, (uint64_t)v10, (uint64_t)v15, v4);
    }

  }
  v6 = v12[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __52__WFAggregateCommonRequest__supportedForecastTypes___block_invoke(uint64_t result, uint64_t a2)
{
  if ((a2 & ~*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24)) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) |= a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) &= ~a2;
  }
  return result;
}

- (void)cleanup
{
  id completionHandler;
  objc_super v4;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFAggregateCommonRequest;
  -[WFTask cleanup](&v4, sel_cleanup);
}

- (void)handleCancellation
{
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  objc_super v5;

  -[WFAggregateCommonRequest completionHandler](self, "completionHandler");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, _QWORD, void *))v3)[2](v3, 0, 0, v4);

  v5.receiver = self;
  v5.super_class = (Class)WFAggregateCommonRequest;
  -[WFTask handleCancellation](&v5, sel_handleCancellation);
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  objc_super v20;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "airQualityObservations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAirQualityObservations:", v6);

  objc_msgSend(v4, "currentObservations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentObservations:", v7);

  objc_msgSend(v4, "lastTwentyFourHoursOfObservations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastTwentyFourHoursOfObservations:", v8);

  objc_msgSend(v4, "hourlyForecastedConditions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHourlyForecastedConditions:", v9);

  objc_msgSend(v4, "dailyForecastedConditions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDailyForecastedConditions:", v10);

  objc_msgSend(v4, "dailyPollenForecastedConditions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDailyPollenForecastedConditions:", v11);

  objc_msgSend(v4, "severeWeatherEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSevereWeatherEvents:", v12);

  objc_msgSend(v4, "changeForecasts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChangeForecasts:", v13);

  objc_msgSend(v4, "nextHourPrecipitation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNextHourPrecipitation:", v14);

  objc_msgSend(v5, "currentObservations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAggregateCommonRequest locale](self, "locale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAggregateCommonRequest trackingParameter](self, "trackingParameter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "editLinksWithLocale:trackingParameter:", v16, v17);

  -[WFAggregateCommonRequest completionHandler](self, "completionHandler");
  v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawAPIData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, _QWORD))v18)[2](v18, v5, v19, 0);

  v20.receiver = self;
  v20.super_class = (Class)WFAggregateCommonRequest;
  -[WFTask handleResponse:](&v20, sel_handleResponse_, v4);

}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[WFAggregateCommonRequest completionHandler](self, "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, _QWORD, id))v8)[2](v8, 0, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFAggregateCommonRequest;
  -[WFTask handleError:forResponseIdentifier:](&v9, sel_handleError_forResponseIdentifier_, v7, v6);

}

- (void)startWithService:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = -[WFAggregateCommonRequest types](self, "types");
  -[WFAggregateCommonRequest location](self, "location");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[WFAggregateCommonRequest units](self, "units");
  -[WFAggregateCommonRequest locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTask identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAggregateCommonRequest requestOptions](self, "requestOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forecast:forLocation:withUnits:locale:taskIdentifier:requestOptions:", v5, v10, v6, v7, v8, v9);

}

- (WFLocation)location
{
  return self->_location;
}

- (unint64_t)types
{
  return self->_types;
}

- (int)units
{
  return self->_units;
}

- (WFRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (NSString)trackingParameter
{
  return self->_trackingParameter;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_trackingParameter, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (void)_supportedForecastTypes:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(*(_QWORD *)a2 + 24);
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2048;
  *(_QWORD *)(a3 + 14) = v6;
  v7 = a1;
  _os_log_error_impl(&dword_21189A000, a4, OS_LOG_TYPE_ERROR, "Unhandled %{public}@ request types: %lu", (uint8_t *)a3, 0x16u);

}

@end
