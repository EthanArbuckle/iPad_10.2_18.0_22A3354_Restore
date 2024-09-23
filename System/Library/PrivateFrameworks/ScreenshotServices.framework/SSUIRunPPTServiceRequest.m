@implementation SSUIRunPPTServiceRequest

+ (id)entitlement
{
  return SSUIRunPPTEntitlement;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSUIRunPPTServiceRequest;
  v4 = a3;
  -[SSUIServiceRequest encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[SSUIRunPPTServiceRequest testName](self, "testName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SSUIRunPPTServiceRequestTestName"));

  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSUIRunPPTServiceRequest numberOfRequiredScreenshots](self, "numberOfRequiredScreenshots"), CFSTR("SSUIRunPPTServiceRequestNumberOfRequiredScreenshots"));
}

- (SSUIRunPPTServiceRequest)initWithBSXPCCoder:(id)a3
{
  id v3;
  SSUIRunPPTServiceRequest *v4;
  uint64_t v5;
  NSString *testName;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSUIRunPPTServiceRequest;
  v3 = a3;
  v4 = -[SSUIServiceRequest initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSUIRunPPTServiceRequestTestName"), v9.receiver, v9.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  testName = v4->_testName;
  v4->_testName = (NSString *)v5;

  v7 = objc_msgSend(v3, "decodeUInt64ForKey:", CFSTR("SSUIRunPPTServiceRequestNumberOfRequiredScreenshots"));
  v4->_numberOfRequiredScreenshots = v7;
  return v4;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)numberOfRequiredScreenshots
{
  return self->_numberOfRequiredScreenshots;
}

- (void)setNumberOfRequiredScreenshots:(unint64_t)a3
{
  self->_numberOfRequiredScreenshots = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
