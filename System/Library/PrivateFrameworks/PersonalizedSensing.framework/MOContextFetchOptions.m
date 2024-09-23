@implementation MOContextFetchOptions

- (MOContextFetchOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOContextFetchOptions;
  return -[MOContextFetchOptions init](&v3, sel_init);
}

- (MOContextFetchOptions)initWithContextFormat:(unint64_t)a3 contextRetrieval:(unint64_t)a4 contextCount:(unint64_t)a5
{
  MOContextFetchOptions *v8;
  MOContextFetchOptions *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)MOContextFetchOptions;
  v8 = -[MOContextFetchOptions init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_contextFormat = a3;
    v8->_contextRetrieval = a4;
    v8->_contextCount = a5;
    _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v14 = a3;
      v15 = 2048;
      v16 = a4;
      v17 = 2048;
      v18 = a5;
      _os_log_impl(&dword_243AAA000, v10, OS_LOG_TYPE_INFO, "ContextFetchOptions contextFormat,%lu,contextRetrieval,%lu,contextCount,%lu", buf, 0x20u);
    }

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MOContextFetchOptions initWithContextFormat:contextRetrieval:contextCount:]([MOContextFetchOptions alloc], "initWithContextFormat:contextRetrieval:contextCount:", -[MOContextFetchOptions contextFormat](self, "contextFormat"), -[MOContextFetchOptions contextRetrieval](self, "contextRetrieval"), -[MOContextFetchOptions contextCount](self, "contextCount"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t contextFormat;
  id v5;

  contextFormat = self->_contextFormat;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", contextFormat, CFSTR("contextFormat"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contextRetrieval, CFSTR("contextRetrieval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contextCount, CFSTR("contextCount"));

}

- (MOContextFetchOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contextFormat"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contextRetrieval"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contextCount"));

  return -[MOContextFetchOptions initWithContextFormat:contextRetrieval:contextCount:](self, "initWithContextFormat:contextRetrieval:contextCount:", v5, v6, v7);
}

- (unint64_t)contextFormat
{
  return self->_contextFormat;
}

- (void)setContextFormat:(unint64_t)a3
{
  self->_contextFormat = a3;
}

- (unint64_t)contextRetrieval
{
  return self->_contextRetrieval;
}

- (void)setContextRetrieval:(unint64_t)a3
{
  self->_contextRetrieval = a3;
}

- (unint64_t)contextCount
{
  return self->_contextCount;
}

- (void)setContextCount:(unint64_t)a3
{
  self->_contextCount = a3;
}

@end
