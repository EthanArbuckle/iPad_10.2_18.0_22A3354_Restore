@implementation PLResultFailure

- (PLResultFailure)initWithError:(id)a3
{
  id v5;
  PLResultFailure *v6;
  uint64_t v7;
  NSError *error;
  PLResultFailure *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResult.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PLResultFailure;
  v6 = -[PLResult initForSubclasses](&v12, sel_initForSubclasses);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    error = v6->_error;
    v6->_error = (NSError *)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)isSuccess
{
  return 0;
}

- (BOOL)isFailure
{
  return 1;
}

- (id)result
{
  return 0;
}

- (id)error
{
  return self->_error;
}

- (id)resultWithError:(id *)a3
{
  if (a3)
    *a3 = objc_retainAutorelease(self->_error);
  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> failure: %@"), v5, self, self->_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
