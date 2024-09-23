@implementation HAPTLVNumberValueBase

- (HAPTLVNumberValueBase)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPTLVNumberValueBase;
  return -[HAPTLVNumberValueBase init](&v3, "init");
}

- (HAPTLVNumberValueBase)initWithValue:(id)a3
{
  id v5;
  HAPTLVNumberValueBase *v6;
  HAPTLVNumberValueBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPTLVNumberValueBase;
  v6 = -[HAPTLVNumberValueBase init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  unsigned int v12;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v12 = 0;
    v7 = objc_retainAutorelease(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVNumberValueBase _parseFromData:length:status:](self, "_parseFromData:length:status:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), &v12));
    v9 = v12 == 0;
    if (v12)
    {
      if (a4)
      {
        v10 = sub_100040DDC(v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
      }
    }
    else
    {
      -[HAPTLVNumberValueBase setValue:](self, "setValue:", v8);
    }

  }
  else
  {
    v9 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](NSError, "hmfErrorWithCode:", 3));
  }

  return v9;
}

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  if (a3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVNumberValueBase value](self, "value")),
        v5,
        !v5))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](NSError, "hmfErrorWithCode:", 8));
    v6 = 0;
    *a3 = v7;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVNumberValueBase _serialize](self, "_serialize"));
  }
  return v6;
}

- (id)_serialize
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPTLVNumberValueBase *v4;
  void *v5;
  HAPTLVNumberValueBase *v6;

  v4 = +[HAPTLVNumberValueBase allocWithZone:](HAPTLVNumberValueBase, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVNumberValueBase value](self, "value"));
  v6 = -[HAPTLVNumberValueBase initWithValue:](v4, "initWithValue:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPTLVNumberValueBase *v5;
  uint64_t v6;
  HAPTLVNumberValueBase *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (HAPTLVNumberValueBase *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPTLVNumberValueBase, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVNumberValueBase value](self, "value"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVNumberValueBase value](v7, "value"));

      v10 = objc_msgSend(v8, "isEqualToNumber:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
