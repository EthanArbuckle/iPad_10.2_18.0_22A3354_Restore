@implementation Result

+ (Result)resultWithValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithSuccess:", v4);

  return (Result *)v5;
}

+ (Result)resultWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithError:", v4);

  return (Result *)v5;
}

- (Result)initWithSuccess:(id)a3
{
  id v5;
  Result *v6;
  Result *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Value cannot be nil"));
  v9.receiver = self;
  v9.super_class = (Class)Result;
  v6 = -[Result init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_value, a3);
    v7->_isSuccess = 1;
  }

  return v7;
}

- (Result)initWithError:(id)a3
{
  id v5;
  Result *v6;
  Result *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Error cannot be nil"));
  v9.receiver = self;
  v9.super_class = (Class)Result;
  v6 = -[Result init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_isSuccess = 0;
  }

  return v7;
}

- (void)withValue:(id)a3 orError:(id)a4
{
  void (**v6)(id, id);
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  void *v9;
  uint64_t Log;
  NSObject *v11;
  id value;
  NSError *error;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  void *v19;

  v6 = (void (**)(id, id))a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[Result _errorMessageForValue:error:](self, "_errorMessageForValue:error:", v6 == 0, v7 == 0));
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Result");
    v11 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
    }

  }
  value = self->_value;
  if (v6 && value)
  {
    v6[2](v6, self->_value);
  }
  else
  {
    error = self->_error;
    if (v8 && error)
    {
      v8[2](v8);
    }
    else
    {
      if (!v6 && value)
      {
        v14 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Result");
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Had a value but no value block", (uint8_t *)&v18, 2u);
        }

        error = self->_error;
      }
      if (!v8 && error)
      {
        v16 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Result");
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Had an error but no error block", (uint8_t *)&v18, 2u);
        }

      }
    }
  }

}

- (id)description
{
  id v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100491920;
  v13 = sub_100491930;
  v8.receiver = self;
  v8.super_class = (Class)Result;
  v3 = -[Result description](&v8, "description");
  v14 = (id)objc_claimAutoreleasedReturnValue(v3);
  v6[4] = &v9;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100491938;
  v7[3] = &unk_1011B8310;
  v7[4] = &v9;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004919B8;
  v6[3] = &unk_1011B17D0;
  -[Result withValue:orError:](self, "withValue:orError:", v7, v6);
  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)_errorMessageForValue:(BOOL)a3 error:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = CFSTR("value block is nil.");
  if (a4)
    v4 = CFSTR("both are nil.");
  if (a3)
    v5 = v4;
  else
    v5 = CFSTR("error block is nil.");
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Neither block can be nil but "), "stringByAppendingString:", v5));
}

- (BOOL)isEqual:(id)a3
{
  Result *v4;
  BOOL v5;

  v4 = (Result *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else if (-[Result isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = -[Result isEqualToResult:](self, "isEqualToResult:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4;
  unsigned int v5;
  BOOL v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "isSuccess");
  if (v5 == -[Result isSuccess](self, "isSuccess"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v8[5] = &v10;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100491BF4;
    v9[3] = &unk_1011B8338;
    v9[4] = self;
    v9[5] = &v10;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100491C2C;
    v8[3] = &unk_1011B8360;
    v8[4] = self;
    objc_msgSend(v4, "withValue:orError:", v9, v8);
    v6 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  _BOOL4 isSuccess;
  uint64_t v3;

  v3 = 16;
  if (!self->_isSuccess)
    v3 = 24;
  isSuccess = self->_isSuccess;
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.isa + v3), "hash") ^ (2654435761 * isSuccess);
}

- (id)map:(id)a3
{
  uint64_t v3;
  void *v4;
  Result *v5;

  if (self->_isSuccess)
  {
    v3 = (*((uint64_t (**)(id, id))a3 + 2))(a3, self->_value);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (Result *)objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v4));

  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (id)flatMap:(id)a3
{
  uint64_t v3;
  Result *v4;

  if (self->_isSuccess)
  {
    v3 = (*((uint64_t (**)(id, id))a3 + 2))(a3, self->_value);
    v4 = (Result *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
