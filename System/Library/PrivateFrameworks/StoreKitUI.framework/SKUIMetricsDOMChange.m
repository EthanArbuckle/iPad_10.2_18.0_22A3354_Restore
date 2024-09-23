@implementation SKUIMetricsDOMChange

- (SKUIMetricsDOMChange)initWithReportDomBuildTimesMessagePayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SKUIMetricsDOMChange *v8;
  SKUIMetricsDOMChange *v9;
  void *v10;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMetricsDOMChange initWithReportDomBuildTimesMessagePayload:].cold.1();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildEndTime"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = -[SKUIMetricsDOMChange init](self, "init");
    if (v9)
    {
      +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v5);
      -[SKUIMetricsDOMChange setBuildStartTime:](v9, "setBuildStartTime:");
      +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v7);
      -[SKUIMetricsDOMChange setBuildEndTime:](v9, "setBuildEndTime:");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageWasDeferred"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIMetricsDOMChange setFromDeferredMessage:](v9, "setFromDeferredMessage:", objc_msgSend(v10, "BOOLValue"));

    }
    self = v9;
    v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SKUIMetricsDOMChange buildStartTime](self, "buildStartTime");
  objc_msgSend(v4, "setBuildStartTime:");
  -[SKUIMetricsDOMChange buildEndTime](self, "buildEndTime");
  objc_msgSend(v4, "setBuildEndTime:");
  -[SKUIMetricsDOMChange renderStartTime](self, "renderStartTime");
  objc_msgSend(v4, "setRenderStartTime:");
  -[SKUIMetricsDOMChange renderEndTime](self, "renderEndTime");
  objc_msgSend(v4, "setRenderEndTime:");
  objc_msgSend(v4, "setFromDeferredMessage:", -[SKUIMetricsDOMChange isFromDeferredMessage](self, "isFromDeferredMessage"));
  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("buildStartTime");
  -[SKUIMetricsDOMChange buildStartTime](self, "buildStartTime");
  +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("buildEndTime");
  -[SKUIMetricsDOMChange buildEndTime](self, "buildEndTime");
  +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("renderStartTime");
  -[SKUIMetricsDOMChange renderStartTime](self, "renderStartTime");
  +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("renderEndTime");
  -[SKUIMetricsDOMChange renderEndTime](self, "renderEndTime");
  +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  _BOOL4 v11;
  uint64_t v12;

  -[SKUIMetricsDOMChange buildStartTime](self, "buildStartTime");
  v4 = (unint64_t)v3;
  -[SKUIMetricsDOMChange buildEndTime](self, "buildEndTime");
  v6 = v4 + 10 * (unint64_t)v5;
  -[SKUIMetricsDOMChange renderStartTime](self, "renderStartTime");
  v8 = v6 + 100 * (unint64_t)v7;
  -[SKUIMetricsDOMChange renderEndTime](self, "renderEndTime");
  v10 = v8 + 1000 * (unint64_t)v9;
  v11 = -[SKUIMetricsDOMChange isFromDeferredMessage](self, "isFromDeferredMessage");
  v12 = 10000;
  if (!v11)
    v12 = 0;
  return v10 + v12;
}

- (BOOL)isEqual:(id)a3
{
  SKUIMetricsDOMChange *v4;
  SKUIMetricsDOMChange *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;

  v4 = (SKUIMetricsDOMChange *)a3;
  if (self == v4)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SKUIMetricsDOMChange buildStartTime](self, "buildStartTime");
      v7 = v6;
      -[SKUIMetricsDOMChange buildStartTime](v5, "buildStartTime");
      if (v7 != v8)
        goto LABEL_10;
      -[SKUIMetricsDOMChange buildEndTime](self, "buildEndTime");
      v10 = v9;
      -[SKUIMetricsDOMChange buildEndTime](v5, "buildEndTime");
      if (v10 != v11)
        goto LABEL_10;
      -[SKUIMetricsDOMChange renderStartTime](self, "renderStartTime");
      v13 = v12;
      -[SKUIMetricsDOMChange renderStartTime](v5, "renderStartTime");
      if (v13 == v14
        && (-[SKUIMetricsDOMChange renderEndTime](self, "renderEndTime"),
            v16 = v15,
            -[SKUIMetricsDOMChange renderEndTime](v5, "renderEndTime"),
            v16 == v17))
      {
        v18 = -[SKUIMetricsDOMChange isFromDeferredMessage](self, "isFromDeferredMessage");
        v19 = v18 ^ -[SKUIMetricsDOMChange isFromDeferredMessage](v5, "isFromDeferredMessage") ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v19) = 0;
      }

    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMetricsDOMChange buildStartTime](self, "buildStartTime");
  v7 = v6;
  -[SKUIMetricsDOMChange buildEndTime](self, "buildEndTime");
  v9 = v8;
  -[SKUIMetricsDOMChange renderStartTime](self, "renderStartTime");
  v11 = v10;
  -[SKUIMetricsDOMChange renderEndTime](self, "renderEndTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; buildStartTime = %f; buildEndTime = %f; renderStartTime = %f; renderEndTime = %f>"),
    v5,
    self,
    v7,
    v9,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)buildStartTime
{
  return self->_buildStartTime;
}

- (void)setBuildStartTime:(double)a3
{
  self->_buildStartTime = a3;
}

- (double)buildEndTime
{
  return self->_buildEndTime;
}

- (void)setBuildEndTime:(double)a3
{
  self->_buildEndTime = a3;
}

- (double)renderStartTime
{
  return self->_renderStartTime;
}

- (void)setRenderStartTime:(double)a3
{
  self->_renderStartTime = a3;
}

- (double)renderEndTime
{
  return self->_renderEndTime;
}

- (void)setRenderEndTime:(double)a3
{
  self->_renderEndTime = a3;
}

- (BOOL)isFromDeferredMessage
{
  return self->_fromDeferredMessage;
}

- (void)setFromDeferredMessage:(BOOL)a3
{
  self->_fromDeferredMessage = a3;
}

- (void)initWithReportDomBuildTimesMessagePayload:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMetricsDOMChange initWithReportDomBuildTimesMessagePayload:]";
}

@end
