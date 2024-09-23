@implementation WFHarnessTestRunResult

- (WFHarnessTestRunResult)initWithTestResult:(id)a3
{
  id v6;
  WFHarnessTestRunResult *v7;
  WFHarnessTestRunResult *v8;
  WFHarnessTestRunResult *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessTestRunResult.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("testResult"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFHarnessTestRunResult;
  v7 = -[WFWorkflowRunResult initWithError:](&v12, sel_initWithError_, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_testResult, a3);
    v9 = v8;
  }

  return v8;
}

- (WFHarnessTestRunResult)initWithCoder:(id)a3
{
  id v4;
  WFHarnessTestRunResult *v5;
  uint64_t v6;
  WFHarnessTestResult *testResult;
  WFHarnessTestRunResult *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFHarnessTestRunResult;
  v5 = -[WFWorkflowRunResult initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testResult"));
    v6 = objc_claimAutoreleasedReturnValue();
    testResult = v5->_testResult;
    v5->_testResult = (WFHarnessTestResult *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFHarnessTestRunResult;
  v4 = a3;
  -[WFWorkflowRunResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFHarnessTestRunResult testResult](self, "testResult", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("testResult"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFHarnessTestRunResult;
  -[WFWorkflowRunResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHarnessTestRunResult testResult](self, "testResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, testResult: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFHarnessTestResult)testResult
{
  return self->_testResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testResult, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
