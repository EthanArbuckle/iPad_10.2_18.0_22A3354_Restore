@implementation PLResult

+ (id)successWithResult:(id)a3
{
  id v3;
  PLResultSuccess *v4;

  v3 = a3;
  v4 = -[PLResultSuccess initWithResult:]([PLResultSuccess alloc], "initWithResult:", v3);

  return v4;
}

- (id)initForSubclasses
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLResult;
  return -[PLResult init](&v3, sel_init);
}

- (id)resultByWrappingUnderlyingErrorWithDomain:(id)a3 code:(int64_t)a4 debugDescription:(id)a5
{
  id v8;
  id v9;
  PLResult *v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  if (-[PLResult isSuccess](self, "isSuccess"))
  {
    v10 = self;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2938]);
    -[PLResult error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB3388]);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v8, a4, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "failureWithError:", v13);
    v10 = (PLResult *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)result
{
  PLResult *v2;
  id v3;

  v2 = self;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSError)error
{
  PLResult *v2;
  id v3;

  v2 = self;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)isSuccess
{
  PLResult *v2;
  id v3;

  v2 = self;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)isFailure
{
  PLResult *v2;
  id v3;

  v2 = self;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PLResult)resultWithError:(id *)a3
{
  PLResult *v3;
  id v4;

  v3 = self;
  PFMethodNotImplementedException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)description
{
  PLResult *v2;
  id v3;

  v2 = self;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)failureWithError:(id)a3
{
  id v3;
  PLResultFailure *v4;

  v3 = a3;
  v4 = -[PLResultFailure initWithError:]([PLResultFailure alloc], "initWithError:", v3);

  return v4;
}

@end
