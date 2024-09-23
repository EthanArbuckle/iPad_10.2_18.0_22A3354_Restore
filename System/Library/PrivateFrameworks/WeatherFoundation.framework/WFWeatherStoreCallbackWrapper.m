@implementation WFWeatherStoreCallbackWrapper

- (WFWeatherStoreCallbackWrapper)initWithForecastRetrievalBlock:(id)a3
{
  id v4;
  WFWeatherStoreCallbackWrapper *v5;
  WFWeatherStoreCallbackWrapper *v6;
  uint64_t v7;
  id forecastRetrievalCompletionBlock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWeatherStoreCallbackWrapper;
  v5 = -[WFWeatherStoreCallbackWrapper init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_requestType = 0;
    v7 = MEMORY[0x212BE2990](v4);
    forecastRetrievalCompletionBlock = v6->_forecastRetrievalCompletionBlock;
    v6->_forecastRetrievalCompletionBlock = (id)v7;

    v6->_executedCompletionBlock = 0;
  }

  return v6;
}

- (WFWeatherStoreCallbackWrapper)initWithAQIScaleRetrievalBlock:(id)a3
{
  id v4;
  WFWeatherStoreCallbackWrapper *v5;
  WFWeatherStoreCallbackWrapper *v6;
  uint64_t v7;
  id aqiScaleRetrievalCompletionBlock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWeatherStoreCallbackWrapper;
  v5 = -[WFWeatherStoreCallbackWrapper init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_requestType = 1;
    v7 = MEMORY[0x212BE2990](v4);
    aqiScaleRetrievalCompletionBlock = v6->_aqiScaleRetrievalCompletionBlock;
    v6->_aqiScaleRetrievalCompletionBlock = (id)v7;

    v6->_executedCompletionBlock = 0;
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)executeCallbackwithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint8_t v16[16];

  v6 = a3;
  v7 = a4;
  if (self->_executedCompletionBlock)
  {
    WFLogForCategory(2uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21189A000, v8, OS_LOG_TYPE_DEFAULT, "Duplicate execution of a forecast request completion block", v16, 2u);
    }
    goto LABEL_16;
  }
  self->_executedCompletionBlock = 1;
  v9 = -[WFWeatherStoreCallbackWrapper requestType](self, "requestType");
  if (v9 == 1)
  {
    if (v6)
    {
      v13 = objc_msgSend(v6, "requestType");
      if (v13 == -[WFWeatherStoreCallbackWrapper requestType](self, "requestType"))
      {
        objc_msgSend(v6, "aqiScale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherStoreCallbackWrapper aqiScaleRetrievalCompletionBlock](self, "aqiScaleRetrievalCompletionBlock");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    -[WFWeatherStoreCallbackWrapper aqiScaleRetrievalCompletionBlock](self, "aqiScaleRetrievalCompletionBlock");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v8 = v15;
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v15 + 16))(v15, 0, 0);
LABEL_16:

    goto LABEL_17;
  }
  if (!v9)
  {
    if (v6)
    {
      v10 = objc_msgSend(v6, "requestType");
      if (v10 == -[WFWeatherStoreCallbackWrapper requestType](self, "requestType"))
      {
        objc_msgSend(v6, "forecastData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherStoreCallbackWrapper forecastRetrievalCompletionBlock](self, "forecastRetrievalCompletionBlock");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v14 = (void *)v12;
        (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v11, v7);

        goto LABEL_17;
      }
    }
    -[WFWeatherStoreCallbackWrapper forecastRetrievalCompletionBlock](self, "forecastRetrievalCompletionBlock");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_17:

}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (id)forecastRetrievalCompletionBlock
{
  return self->_forecastRetrievalCompletionBlock;
}

- (void)setForecastRetrievalCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)aqiScaleRetrievalCompletionBlock
{
  return self->_aqiScaleRetrievalCompletionBlock;
}

- (void)setAqiScaleRetrievalCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)executedCompletionBlock
{
  return self->_executedCompletionBlock;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_aqiScaleRetrievalCompletionBlock, 0);
  objc_storeStrong(&self->_forecastRetrievalCompletionBlock, 0);
}

@end
