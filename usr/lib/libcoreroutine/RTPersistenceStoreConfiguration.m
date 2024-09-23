@implementation RTPersistenceStoreConfiguration

- (RTPersistenceStoreConfiguration)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithName_readOnly_store_);
}

- (RTPersistenceStoreConfiguration)initWithName:(id)a3 readOnly:(BOOL)a4 store:(id)a5
{
  id v8;
  id v9;
  void *v10;
  RTPersistenceStoreConfiguration *v11;
  uint64_t v12;
  NSString *name;
  RTPersistenceStoreConfiguration *v14;
  NSObject *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTPersistenceStoreConfiguration initWithName:readOnly:store:]";
      v21 = 1024;
      v22 = 24;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name (in %s:%d)", buf, 0x12u);
    }

    if (v10)
      goto LABEL_12;
    goto LABEL_9;
  }
  if (!v9)
  {
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTPersistenceStoreConfiguration initWithName:readOnly:store:]";
      v21 = 1024;
      v22 = 25;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: store (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTPersistenceStoreConfiguration;
  v11 = -[RTPersistenceStoreConfiguration init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v11->_readOnly = a4;
    objc_storeWeak((id *)&v11->_store, v10);
  }
  self = v11;
  v14 = self;
LABEL_13:

  return v14;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (RTPersistenceStore)store
{
  return (RTPersistenceStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
