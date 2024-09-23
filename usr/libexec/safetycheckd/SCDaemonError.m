@implementation SCDaemonError

+ (id)errorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "errorWithCode:underlyingErrors:", a3, &__NSArray0__struct);
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, NSMultipleUnderlyingErrorsKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SCDaemonErrorDomain, a3, v6));

  return v7;
}

- (SCDaemonError)init
{
  SCDaemonError *v2;
  SCDaemonError *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCDaemonError;
  v2 = -[SCDaemonError init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[SCDaemonError setCode:](v2, "setCode:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[SCDaemonError setUnderlyingErrors:](v3, "setUnderlyingErrors:", v4);

  }
  return v3;
}

- (id)toError
{
  void *v3;
  id v4;
  int64_t v5;
  void *v6;
  void *v7;

  if (-[SCDaemonError code](self, "code")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCDaemonError underlyingErrors](self, "underlyingErrors")),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    v5 = -[SCDaemonError code](self, "code");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCDaemonError underlyingErrors](self, "underlyingErrors"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", v5, v6));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (NSMutableArray)underlyingErrors
{
  return self->_underlyingErrors;
}

- (void)setUnderlyingErrors:(id)a3
{
  self->_underlyingErrors = (NSMutableArray *)a3;
}

@end
