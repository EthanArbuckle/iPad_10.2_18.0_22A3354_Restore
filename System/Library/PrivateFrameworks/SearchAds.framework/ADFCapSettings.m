@implementation ADFCapSettings

- (ADFCapSettings)initWithType:(int64_t)a3 location:(double)a4 clickExpiration:(double)a5 fCapExpiration:(double)a6 maxFCapElements:(unint64_t)a7 maxClickCapElements:(unint64_t)a8
{
  ADFCapSettings *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ADFCapSettings;
  result = -[ADFCapSettings init](&v15, sel_init);
  if (result)
  {
    result->_pageType = a3;
    result->_reverseGeolocationRefreshThresholdInMeters = a4;
    result->_clickExpirationThresholdInSeconds = a5;
    result->_frequencyCapExpirationInSeconds = a6;
    result->_maxFrequencyCapElements = a7;
    result->_maxClickCapElements = a8;
  }
  return result;
}

- (void)setReverseGeolocationRefreshThresholdInMeters:(double)a3
{
  self->_reverseGeolocationRefreshThresholdInMeters = a3;
}

- (void)setMaxFrequencyCapElements:(unint64_t)a3
{
  self->_maxFrequencyCapElements = a3;
}

- (void)setMaxClickCapElements:(unint64_t)a3
{
  self->_maxClickCapElements = a3;
}

- (void)setFrequencyCapExpirationInSeconds:(double)a3
{
  self->_frequencyCapExpirationInSeconds = a3;
}

- (void)setClickExpirationThresholdInSeconds:(double)a3
{
  self->_clickExpirationThresholdInSeconds = a3;
}

- (unint64_t)maxFrequencyCapElements
{
  return self->_maxFrequencyCapElements;
}

- (unint64_t)maxClickCapElements
{
  return self->_maxClickCapElements;
}

- (double)frequencyCapExpirationInSeconds
{
  return self->_frequencyCapExpirationInSeconds;
}

- (double)clickExpirationThresholdInSeconds
{
  return self->_clickExpirationThresholdInSeconds;
}

- (void)overrideFrequencyCapExpiration:(double)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v14;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "%@ Frequency Cap Expiration Overridden: %f seconds.", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend_setFrequencyCapExpirationInSeconds_(self, v15, v16, v17, v18, a3);
}

- (void)overrideMaxFrequencyCapElements:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v14;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "%@ Max Frequency Cap Elements Overridden: %lu elements.", (uint8_t *)&v18, 0x16u);

  }
  objc_msgSend_setMaxFrequencyCapElements_(self, v15, a3, v16, v17);
}

- (void)overrideClickExpiration:(double)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v14;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "%@ Toro Click Expiration Overridden: %f seconds.", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend_setClickExpirationThresholdInSeconds_(self, v15, v16, v17, v18, a3);
}

- (void)overrideMaxClickElements:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v14;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "%@ Max Toro Click Elements Overridden: %lu elements.", (uint8_t *)&v18, 0x16u);

  }
  objc_msgSend_setMaxClickCapElements_(self, v15, a3, v16, v17);
}

- (void)overrideRevGeoThreshold:(double)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v14;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "%@ Reverse Geolocation Update Threshold Overridden: %f meters.", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend_setReverseGeolocationRefreshThresholdInMeters_(self, v15, v16, v17, v18, a3);
}

- (id)_capTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("Unknown");
  else
    return off_24F0D8CD0[a3];
}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_pageType = a3;
}

- (double)reverseGeolocationRefreshThresholdInMeters
{
  return self->_reverseGeolocationRefreshThresholdInMeters;
}

@end
