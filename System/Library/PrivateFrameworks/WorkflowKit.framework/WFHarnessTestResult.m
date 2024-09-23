@implementation WFHarnessTestResult

- (WFHarnessTestResult)initWithFailure:(BOOL)a3 output:(id)a4 reason:(id)a5 failureFilePath:(id)a6 failureLine:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  WFHarnessTestResult *v16;
  WFHarnessTestResult *v17;
  uint64_t v18;
  NSString *failureReason;
  uint64_t v20;
  NSString *failureFilePath;
  WFHarnessTestResult *v22;
  objc_super v24;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)WFHarnessTestResult;
  v16 = -[WFHarnessTestResult init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_failed = a3;
    objc_storeStrong((id *)&v16->_output, a4);
    v18 = objc_msgSend(v14, "copy");
    failureReason = v17->_failureReason;
    v17->_failureReason = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    failureFilePath = v17->_failureFilePath;
    v17->_failureFilePath = (NSString *)v20;

    v17->_failureLine = a7;
    v22 = v17;
  }

  return v17;
}

- (id)errorRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  WFHarnessTestResult *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!-[WFHarnessTestResult failed](self, "failed"))
    return 0;
  -[WFHarnessTestResult failureReason](self, "failureReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB35C8];
  if (v3)
  {
    v13[0] = self;
    v5 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("WFHarnessTestErrorResult");
    v12[1] = v5;
    -[WFHarnessTestResult failureReason](self, "failureReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WFHarnessTestErrorDomain"), 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("WFHarnessTestErrorResult");
    v11 = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WFHarnessTestErrorDomain"), 0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (WFHarnessTestResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  WFHarnessTestResult *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("failed"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("output"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("failureReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("failureFilePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("failureLine"));

  v10 = -[WFHarnessTestResult initWithFailure:output:reason:failureFilePath:failureLine:](self, "initWithFailure:output:reason:failureFilePath:failureLine:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[WFHarnessTestResult failed](self, "failed"), CFSTR("failed"));
  -[WFHarnessTestResult output](self, "output");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("output"));

  -[WFHarnessTestResult failureReason](self, "failureReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("failureReason"));

  -[WFHarnessTestResult failureFilePath](self, "failureFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("failureFilePath"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[WFHarnessTestResult failureLine](self, "failureLine"), CFSTR("failureLine"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFHarnessTestResult failed](self, "failed"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[WFHarnessTestResult failureReason](self, "failureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p failed: %@, failureReason: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)failed
{
  return self->_failed;
}

- (WFWorkflowOutputRunResult)output
{
  return self->_output;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (NSString)failureFilePath
{
  return self->_failureFilePath;
}

- (int64_t)failureLine
{
  return self->_failureLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureFilePath, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

+ (id)successWithOutput:(id)a3
{
  id v3;
  WFHarnessTestResult *v4;
  void *v5;
  WFHarnessTestResult *v6;

  v3 = a3;
  v4 = [WFHarnessTestResult alloc];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E50]), "initWithOutput:", v3);

  v6 = -[WFHarnessTestResult initWithFailure:output:reason:failureFilePath:failureLine:](v4, "initWithFailure:output:reason:failureFilePath:failureLine:", 0, v5, 0, 0, 0);
  return v6;
}

+ (id)failureWithReason:(id)a3
{
  id v5;
  WFHarnessTestResult *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHarnessTestResult.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("failureReason"));

  }
  v6 = -[WFHarnessTestResult initWithFailure:output:reason:failureFilePath:failureLine:]([WFHarnessTestResult alloc], "initWithFailure:output:reason:failureFilePath:failureLine:", 1, 0, v5, 0, 0);

  return v6;
}

+ (id)failureWithReason:(id)a3 filePath:(id)a4 line:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  WFHarnessTestResult *v12;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHarnessTestResult.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("failureReason"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHarnessTestResult.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filePath"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = -[WFHarnessTestResult initWithFailure:output:reason:failureFilePath:failureLine:]([WFHarnessTestResult alloc], "initWithFailure:output:reason:failureFilePath:failureLine:", 1, 0, v9, v11, a5);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
