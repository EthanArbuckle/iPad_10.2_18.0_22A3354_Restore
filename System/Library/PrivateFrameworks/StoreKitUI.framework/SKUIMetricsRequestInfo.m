@implementation SKUIMetricsRequestInfo

- (SKUIMetricsRequestInfo)initWithReportRequestTimesMessagePayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SKUIMetricsRequestInfo *v9;
  SKUIMetricsRequestInfo *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMetricsRequestInfo initWithReportRequestTimesMessagePayload:].cold.1();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseStartTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseEndTime"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v5 && v6 && v7)
  {
    v10 = -[SKUIMetricsRequestInfo init](self, "init");
    if (v10)
    {
      +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v5);
      -[SKUIMetricsRequestInfo setRequestStartTime:](v10, "setRequestStartTime:");
      +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v6);
      -[SKUIMetricsRequestInfo setResponseStartTime:](v10, "setResponseStartTime:");
      +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v8);
      -[SKUIMetricsRequestInfo setResponseEndTime:](v10, "setResponseEndTime:");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseWasCached"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseWasCached"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIMetricsRequestInfo setResponseWasCached:](v10, "setResponseWasCached:", objc_msgSend(v12, "BOOLValue"));

      }
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SKUIMetricsRequestInfo requestStartTime](self, "requestStartTime");
  objc_msgSend(v4, "setRequestStartTime:");
  -[SKUIMetricsRequestInfo responseStartTime](self, "responseStartTime");
  objc_msgSend(v4, "setResponseStartTime:");
  -[SKUIMetricsRequestInfo responseEndTime](self, "responseEndTime");
  objc_msgSend(v4, "setResponseEndTime:");
  if (-[SKUIMetricsRequestInfo hasResponseWasCachedValue](self, "hasResponseWasCachedValue"))
  {
    objc_msgSend(v4, "setResponseWasCached:", -[SKUIMetricsRequestInfo responseWasCached](self, "responseWasCached"));
    objc_msgSend(v4, "setHasResponseWasCachedValue:", 1);
  }
  return v4;
}

- (void)setResponseWasCached:(BOOL)a3
{
  self->_responseWasCached = a3;
  -[SKUIMetricsRequestInfo setHasResponseWasCachedValue:](self, "setHasResponseWasCachedValue:", 1);
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  if (-[SKUIMetricsRequestInfo hasResponseWasCachedValue](self, "hasResponseWasCachedValue"))
  {
    v11[0] = CFSTR("requestStartTime");
    -[SKUIMetricsRequestInfo requestStartTime](self, "requestStartTime");
    +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v11[1] = CFSTR("responseStartTime");
    -[SKUIMetricsRequestInfo responseStartTime](self, "responseStartTime");
    +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    v11[2] = CFSTR("responseEndTime");
    -[SKUIMetricsRequestInfo responseEndTime](self, "responseEndTime");
    +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    v11[3] = CFSTR("responseWasCached");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKUIMetricsRequestInfo responseWasCached](self, "responseWasCached"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9[0] = CFSTR("requestStartTime");
    -[SKUIMetricsRequestInfo requestStartTime](self, "requestStartTime");
    +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v9[1] = CFSTR("responseStartTime");
    -[SKUIMetricsRequestInfo responseStartTime](self, "responseStartTime");
    +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    v9[2] = CFSTR("responseEndTime");
    -[SKUIMetricsRequestInfo responseEndTime](self, "responseEndTime");
    +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDictionary *)v7;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (void)setResponseStartTime:(double)a3
{
  self->_responseStartTime = a3;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (void)setResponseEndTime:(double)a3
{
  self->_responseEndTime = a3;
}

- (BOOL)responseWasCached
{
  return self->_responseWasCached;
}

- (BOOL)hasResponseWasCachedValue
{
  return self->_hasResponseWasCachedValue;
}

- (void)setHasResponseWasCachedValue:(BOOL)a3
{
  self->_hasResponseWasCachedValue = a3;
}

- (void)initWithReportRequestTimesMessagePayload:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMetricsRequestInfo initWithReportRequestTimesMessagePayload:]";
}

@end
