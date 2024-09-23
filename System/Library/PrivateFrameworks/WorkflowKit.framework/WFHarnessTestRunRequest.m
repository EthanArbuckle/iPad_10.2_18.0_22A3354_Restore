@implementation WFHarnessTestRunRequest

- (WFHarnessTestRunRequest)initWithTestBundleURL:(id)a3 xcTestClass:(id)a4 xcTestMethodName:(id)a5 testIdentifier:(id)a6 automationType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WFHarnessTestRunRequest *v17;
  WFHarnessTestRunDescriptor *v18;
  WFHarnessTestRunDescriptor *testRunDescriptor;
  void *v20;
  WFHarnessTestRunRequest *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[WFWorkflowRunRequest initWithInput:presentationMode:](self, "initWithInput:presentationMode:", 0, 3);
  if (v17)
  {
    v18 = -[WFHarnessTestRunDescriptor initWithTestBundleURL:xcTestClass:xcTestMethodName:testIdentifier:]([WFHarnessTestRunDescriptor alloc], "initWithTestBundleURL:xcTestClass:xcTestMethodName:testIdentifier:", v12, v13, v14, v15);
    testRunDescriptor = v17->_testRunDescriptor;
    v17->_testRunDescriptor = v18;

    v20 = (void *)objc_msgSend(v16, "copy");
    -[WFWorkflowRunRequest setAutomationType:](v17, "setAutomationType:", v20);

    -[WFWorkflowRunRequest setOutputBehavior:](v17, "setOutputBehavior:", 2);
    v21 = v17;
  }

  return v17;
}

- (void)getInputWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[WFHarnessTestRunRequest testRunDescriptor](self, "testRunDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "loadTestCaseWithError:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
  {
    objc_msgSend(v6, "input");
    v8 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8, 0);

    v4 = (void (**)(id, uint64_t, _QWORD))v8;
  }
  else
  {
    getWFTestHarnessLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFHarnessTestRunRequest getInputWithCompletionHandler:]";
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Can't load harness test case when getting shortcut input: %@", buf, 0x16u);
    }

    ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v7);
  }

}

- (WFHarnessTestRunRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testRunDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    getWFTestHarnessLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFHarnessTestRunRequest initWithCoder:]";
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Trying to deserialize a test run request, but there's no run descriptor attached to it. No idea what test case this request wants to run, failing.", buf, 0xCu);
    }

    v6 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFHarnessTestRunRequest;
  v6 = -[WFWorkflowRunRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v6)
  {
    v7 = v5;
    self = (WFHarnessTestRunRequest *)*((_QWORD *)v6 + 15);
    *((_QWORD *)v6 + 15) = v7;
LABEL_7:

  }
  return (WFHarnessTestRunRequest *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFHarnessTestRunRequest;
  v4 = a3;
  -[WFWorkflowRunRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFHarnessTestRunRequest testRunDescriptor](self, "testRunDescriptor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("testRunDescriptor"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHarnessTestRunDescriptor xcTestClass](self->_testRunDescriptor, "xcTestClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHarnessTestRunDescriptor xcTestMethodName](self->_testRunDescriptor, "xcTestMethodName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHarnessTestRunDescriptor testIdentifier](self->_testRunDescriptor, "testIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ %@, testIdentifier: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (WFHarnessTestRunDescriptor)testRunDescriptor
{
  return self->_testRunDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testRunDescriptor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
