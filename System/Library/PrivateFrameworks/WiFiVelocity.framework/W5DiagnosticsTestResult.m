@implementation W5DiagnosticsTestResult

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5DiagnosticsTestResult;
  -[W5DiagnosticsTestResult dealloc](&v3, sel_dealloc);
}

- (void)setConfiguration:(id)a3
{
  NSDictionary *configuration;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  configuration = self->_configuration;
  if (configuration != a3)
  {

    self->_configuration = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        v11 = objc_opt_class();
        v12 = objc_opt_class();
        v13 = objc_opt_class();
        v14 = objc_opt_class();
        self->_configuration = (NSDictionary *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setInfo:(id)a3
{
  NSDictionary *info;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  info = self->_info;
  if (info != a3)
  {

    self->_info = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v18 = (void *)MEMORY[0x24BDBCF20];
        v19 = (void *)MEMORY[0x24BDD1620];
        v17 = objc_opt_class();
        v16 = objc_opt_class();
        v8 = objc_opt_class();
        v9 = objc_opt_class();
        v10 = objc_opt_class();
        v11 = objc_opt_class();
        v12 = objc_opt_class();
        v13 = objc_opt_class();
        v14 = objc_opt_class();
        v15 = objc_opt_class();
        self->_info = (NSDictionary *)(id)objc_msgSend(v19, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v18, "setWithObjects:", v17, v16, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Name: %@ (%ld)\n"), W5DescriptionForDiagnosticsTestID(self->_testID), self->_testID);
  objc_msgSend(v3, "appendFormat:", CFSTR("Description: %@\n"), W5ExtendedDescriptionForDiagnosticsTestID(self->_testID));
  if (self->_didPass)
    v4 = CFSTR("Yes");
  else
    v4 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("Pass: %@\n"), v4);
  if (self->_result)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("Result: %@\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("Error: %@\n"), self->_error);
  objc_msgSend(v3, "appendFormat:", CFSTR("UUID: %@\n"), -[NSUUID UUIDString](self->_uuid, "UUIDString"));
  v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v6, "setDateStyle:", 0);
  objc_msgSend(v6, "setTimeStyle:", 2);
  objc_msgSend(v6, "setLocale:", objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Started: %@\n"), objc_msgSend(v6, "stringFromDate:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_testStarted)));
  objc_msgSend(v3, "appendFormat:", CFSTR("Completed: %@\n"), objc_msgSend(v6, "stringFromDate:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_testCompleted)));
  objc_msgSend(v3, "appendFormat:", CFSTR("Configuration: %@\n"), self->_configuration);
  objc_msgSend(v3, "appendFormat:", CFSTR("Info: %@\n"), self->_info);
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5DiagnosticsTestResult;
  if (-[W5DiagnosticsTestResult conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToDiagnosticsTestResult:(id)a3
{
  return -[NSUUID isEqual:](self->_uuid, "isEqual:", objc_msgSend(a3, "uuid"));
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5DiagnosticsTestResult isEqualToDiagnosticsTestResult:](self, "isEqualToDiagnosticsTestResult:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5DiagnosticsTestResult *v4;

  v4 = -[W5DiagnosticsTestResult init](+[W5DiagnosticsTestResult allocWithZone:](W5DiagnosticsTestResult, "allocWithZone:", a3), "init");
  -[W5DiagnosticsTestResult setUuid:](v4, "setUuid:", self->_uuid);
  -[W5DiagnosticsTestResult setTestID:](v4, "setTestID:", self->_testID);
  -[W5DiagnosticsTestResult setResult:](v4, "setResult:", self->_result);
  -[W5DiagnosticsTestResult setDidPass:](v4, "setDidPass:", self->_didPass);
  -[W5DiagnosticsTestResult setError:](v4, "setError:", self->_error);
  -[W5DiagnosticsTestResult setConfiguration:](v4, "setConfiguration:", self->_configuration);
  -[W5DiagnosticsTestResult setInfo:](v4, "setInfo:", self->_info);
  -[W5DiagnosticsTestResult setTestStarted:](v4, "setTestStarted:", self->_testStarted);
  -[W5DiagnosticsTestResult setTestCompleted:](v4, "setTestCompleted:", self->_testCompleted);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_testID, CFSTR("_testID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_configuration, CFSTR("_configuration"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("_error"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_result, CFSTR("_result"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_didPass, CFSTR("_didPass"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_info, CFSTR("_info"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_testStarted"), self->_testStarted);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_testCompleted"), self->_testCompleted);
}

- (W5DiagnosticsTestResult)initWithCoder:(id)a3
{
  W5DiagnosticsTestResult *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)W5DiagnosticsTestResult;
  v4 = -[W5DiagnosticsTestResult init](&v25, sel_init);
  if (v4)
  {
    v4->_testID = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_testID"));
    v4->_result = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_result"));
    v4->_didPass = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_didPass"));
    v4->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid")), "copy");
    v4->_error = (NSError *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_error")), "copy");
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v4->_configuration = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), CFSTR("_configuration")), "copy");
    v24 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    v22 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v4->_info = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v24, "setWithObjects:", v23, v22, v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0), CFSTR("_info")),
                                  "copy");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_testStarted"));
    v4->_testStarted = v19;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_testCompleted"));
    v4->_testCompleted = v20;
  }
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)testID
{
  return self->_testID;
}

- (void)setTestID:(int64_t)a3
{
  self->_testID = a3;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (BOOL)didPass
{
  return self->_didPass;
}

- (void)setDidPass:(BOOL)a3
{
  self->_didPass = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)testStarted
{
  return self->_testStarted;
}

- (void)setTestStarted:(double)a3
{
  self->_testStarted = a3;
}

- (double)testCompleted
{
  return self->_testCompleted;
}

- (void)setTestCompleted:(double)a3
{
  self->_testCompleted = a3;
}

@end
