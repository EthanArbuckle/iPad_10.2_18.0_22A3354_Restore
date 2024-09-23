@implementation PLResultSuccess

- (BOOL)isFailure
{
  return 0;
}

- (PLResultSuccess)initWithResult:(id)a3
{
  id v6;
  id *v7;
  PLResultSuccess *v8;
  PLResultSuccess *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResult.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PLResultSuccess;
  v7 = -[PLResult initForSubclasses](&v12, sel_initForSubclasses);
  v8 = (PLResultSuccess *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

- (BOOL)isSuccess
{
  return 1;
}

- (id)result
{
  return self->_result;
}

- (id)error
{
  return 0;
}

- (id)resultWithError:(id *)a3
{
  return self->_result;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> success: %@"), v5, self, self->_result);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
}

@end
