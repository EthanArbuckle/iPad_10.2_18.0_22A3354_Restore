@implementation SUSMKockedServiceRecord

- (SUSMKockedServiceRecord)init
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v5[7];
  char v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = _SUSUILoggingFacility();
  v6 = 16;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
  {
    log = location[0];
    type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_error_impl(&dword_21BF33000, log, type, "SUSMKockedServiceRecord should not be initialized with init", v5, 2u);
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return 0;
}

- (SUSMKockedServiceRecord)initWithServiceType:(int64_t)a3 resolvingService:(Class)a4 usingMockedClass:(Class)a5
{
  NSString *v5;
  NSString *resolvedServiceClassName;
  SUSMKockedServiceRecord *v8;
  objc_super v9;
  id obj;
  Class v11;
  int64_t v12;
  SEL v13;
  SUSMKockedServiceRecord *v14;

  v13 = a2;
  v12 = a3;
  v11 = a4;
  obj = a5;
  v14 = 0;
  v9.receiver = self;
  v9.super_class = (Class)SUSMKockedServiceRecord;
  v14 = -[SUSMKockedServiceRecord init](&v9, sel_init);
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    v14->_serviceType = v12;
    v5 = NSStringFromClass(v11);
    resolvedServiceClassName = v14->_resolvedServiceClassName;
    v14->_resolvedServiceClassName = v5;

    objc_storeStrong((id *)&v14->_mockedServiceClass, obj);
  }
  v8 = v14;
  objc_storeStrong((id *)&v14, 0);
  return v8;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSString)resolvedServiceClassName
{
  return self->_resolvedServiceClassName;
}

- (Class)mockedServiceClass
{
  return self->_mockedServiceClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockedServiceClass, 0);
  objc_storeStrong((id *)&self->_resolvedServiceClassName, 0);
}

@end
