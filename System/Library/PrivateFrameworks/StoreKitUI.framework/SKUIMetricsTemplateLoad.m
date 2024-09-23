@implementation SKUIMetricsTemplateLoad

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIMetricsTemplateLoad copyWithZone:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init((Class)objc_opt_class());
  -[SKUIMetricsTemplateLoad requestStartTime](self, "requestStartTime");
  objc_msgSend(v12, "setRequestStartTime:");
  -[SKUIMetricsTemplateLoad responseStartTime](self, "responseStartTime");
  objc_msgSend(v12, "setResponseStartTime:");
  -[SKUIMetricsTemplateLoad responseEndTime](self, "responseEndTime");
  objc_msgSend(v12, "setResponseEndTime:");
  objc_msgSend(v12, "setResponseWasCached:", -[SKUIMetricsTemplateLoad responseWasCached](self, "responseWasCached"));
  return v12;
}

- (NSDictionary)dictionaryRepresentation
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMetricsTemplateLoad dictionaryRepresentation].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v17[0] = CFSTR("requestStartTime");
  -[SKUIMetricsTemplateLoad requestStartTime](self, "requestStartTime");
  +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = CFSTR("responseStartTime");
  -[SKUIMetricsTemplateLoad responseStartTime](self, "responseStartTime");
  +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  v17[2] = CFSTR("responseEndTime");
  -[SKUIMetricsTemplateLoad responseEndTime](self, "responseEndTime");
  +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = CFSTR("responseWasCached");
  +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:", (double)-[SKUIMetricsTemplateLoad responseWasCached](self, "responseWasCached"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v15;
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

- (void)setResponseWasCached:(BOOL)a3
{
  self->_responseWasCached = a3;
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dictionaryRepresentation
{
}

@end
