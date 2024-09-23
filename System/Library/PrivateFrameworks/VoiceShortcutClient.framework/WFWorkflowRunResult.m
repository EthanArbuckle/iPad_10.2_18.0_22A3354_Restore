@implementation WFWorkflowRunResult

- (WFWorkflowRunResult)initWithError:(id)a3
{
  id v5;
  WFWorkflowRunResult *v6;
  WFWorkflowRunResult *v7;
  WFWorkflowRunResult *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowRunResult;
  v6 = -[WFWorkflowRunResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalError, a3);
    v8 = v7;
  }

  return v7;
}

- (id)resultBySettingError:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithError:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  NSError *internalError;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self)
    internalError = self->_internalError;
  else
    internalError = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p Error: %@>"), v5, self, internalError);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *v4;
  NSError *v5;
  NSError *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self && (v4 = self->_internalError) != 0)
  {
    v5 = v4;
    v6 = self->_internalError;
    WFEncodableError(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("error"));

  }
  else
  {
    objc_msgSend(v8, "encodeObject:forKey:", 0, CFSTR("error"));
    v5 = 0;
  }

}

- (WFWorkflowRunResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFWorkflowRunResult *v7;

  v4 = a3;
  WFAllowedClassesForDecodingNSError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFWorkflowRunResult initWithError:](self, "initWithError:", v6);
  return v7;
}

- (BOOL)isCancelled
{
  NSError *internalError;
  NSError *v4;
  void *v5;
  NSError *v6;
  BOOL v7;

  if (self)
    internalError = self->_internalError;
  else
    internalError = 0;
  v4 = internalError;
  -[NSError domain](v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    if (self)
      v6 = self->_internalError;
    else
      v6 = 0;
    v7 = -[NSError code](v6, "code") == 3072;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSError)error
{
  NSError *v3;
  NSError *internalError;

  if (-[WFWorkflowRunResult isCancelled](self, "isCancelled"))
  {
    v3 = 0;
  }
  else
  {
    if (self)
      internalError = self->_internalError;
    else
      internalError = 0;
    v3 = internalError;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalError, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
