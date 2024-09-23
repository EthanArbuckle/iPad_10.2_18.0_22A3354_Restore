@implementation SCDaemonError

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:underlyingErrors:", a3, MEMORY[0x24BDBD1A8]);
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD10D8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", SCDaemonErrorDomain, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

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
  v2 = -[SCDaemonError init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SCDaemonError setCode:](v2, "setCode:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDaemonError setUnderlyingErrors:](v3, "setUnderlyingErrors:", v4);

  }
  return v3;
}

- (id)toError
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  if (-[SCDaemonError code](self, "code")
    || (-[SCDaemonError underlyingErrors](self, "underlyingErrors"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    v5 = -[SCDaemonError code](self, "code");
    -[SCDaemonError underlyingErrors](self, "underlyingErrors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

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
