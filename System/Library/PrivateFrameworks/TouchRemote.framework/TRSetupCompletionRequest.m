@implementation TRSetupCompletionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t errorCode;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupCompletionRequest;
  -[TRMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self->_completedSuccessfully)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("cS"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v4, "encodeInteger:forKey:", errorCode, CFSTR("eC"));

}

- (TRSetupCompletionRequest)initWithCoder:(id)a3
{
  id v4;
  TRSetupCompletionRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRSetupCompletionRequest;
  v5 = -[TRMessage initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_completedSuccessfully = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cS"));
    v5->_errorCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eC"));
  }

  return v5;
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (self->_completedSuccessfully)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("completedSuccessfully:%@ errorCode:%ld"), v3, self->_errorCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)TRSetupCompletionRequest;
  -[TRMessage description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)completedSuccessfully
{
  return self->_completedSuccessfully;
}

- (void)setCompletedSuccessfully:(BOOL)a3
{
  self->_completedSuccessfully = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

@end
