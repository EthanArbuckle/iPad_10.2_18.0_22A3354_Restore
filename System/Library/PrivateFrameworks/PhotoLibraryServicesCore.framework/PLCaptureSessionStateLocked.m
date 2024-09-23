@implementation PLCaptureSessionStateLocked

- (PLCaptureSessionStateLocked)initWithSessionIdentifier:(id)a3
{
  id v5;
  PLCaptureSessionStateLocked *v6;
  uint64_t v7;
  NSString *sessionIdentifier;
  PLCaptureSessionStateLocked *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCaptureSessionState.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PLCaptureSessionStateLocked;
  v6 = -[PLCaptureSessionState initWithType:](&v12, sel_initWithType_, 2);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    sessionIdentifier = v6->_sessionIdentifier;
    v6->_sessionIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLCaptureSessionStateLocked(%@)"), self->_sessionIdentifier);
}

- (NSString)sessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
