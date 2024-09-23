@implementation PKPaymentAuthorizationInvalidDataStateParam

+ (id)paramWithDataType:(int64_t)a3 status:(int64_t)a4 error:(id)a5 clientErrors:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a6;
  v11 = a5;
  objc_msgSend(a1, "param");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDataType:", a3);
  objc_msgSend(v12, "setStatus:", a4);
  objc_msgSend(v12, "setError:", v11);

  objc_msgSend(v12, "setClientErrors:", v10);
  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; dataType: %ld; status: %ld; error: %@, client errors: %@>"),
               objc_opt_class(),
               self,
               self->_dataType,
               self->_status,
               self->_error,
               self->_clientErrors);
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)clientErrors
{
  return self->_clientErrors;
}

- (void)setClientErrors:(id)a3
{
  objc_storeStrong((id *)&self->_clientErrors, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clientErrors, 0);
}

@end
