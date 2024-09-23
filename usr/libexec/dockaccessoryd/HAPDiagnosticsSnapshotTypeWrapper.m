@implementation HAPDiagnosticsSnapshotTypeWrapper

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPDiagnosticsSnapshotTypeWrapper *v6;
  HAPDiagnosticsSnapshotTypeWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPDiagnosticsSnapshotTypeWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPDiagnosticsSnapshotTypeWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

- (HAPDiagnosticsSnapshotTypeWrapper)init
{
  HAPDiagnosticsSnapshotTypeWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPDiagnosticsSnapshotTypeWrapper;
  result = -[HAPDiagnosticsSnapshotTypeWrapper init](&v3, "init");
  if (result)
    result->_value = 0;
  return result;
}

- (HAPDiagnosticsSnapshotTypeWrapper)initWithValue:(unint64_t)a3
{
  HAPDiagnosticsSnapshotTypeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAPDiagnosticsSnapshotTypeWrapper;
  result = -[HAPDiagnosticsSnapshotTypeWrapper init](&v5, "init");
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  id v12;
  unsigned int v14;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    *a4 = 0;
    if (!objc_msgSend(v6, "length"))
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));
      v9 = 0;
LABEL_8:
      *a4 = v8;
      goto LABEL_11;
    }
  }
  else if (!objc_msgSend(v6, "length"))
  {
    v9 = 0;
    goto LABEL_11;
  }
  v14 = 0;
  v10 = objc_retainAutorelease(v7);
  v11 = sub_100022530((unsigned __int8 *)objc_msgSend(v10, "bytes"), (uint64_t)objc_msgSend(v10, "length"), (int *)&v14);
  v9 = v14 == 0;
  if (!v14)
  {
    -[HAPDiagnosticsSnapshotTypeWrapper setValue:](self, "setValue:", v11);
    goto LABEL_11;
  }
  if (a4)
  {
    v12 = sub_100040DDC(v14);
    v8 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_8;
  }
LABEL_11:

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  return sub_1000225E0(-[HAPDiagnosticsSnapshotTypeWrapper value](self, "value", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HAPDiagnosticsSnapshotTypeWrapper initWithValue:](+[HAPDiagnosticsSnapshotTypeWrapper allocWithZone:](HAPDiagnosticsSnapshotTypeWrapper, "allocWithZone:", a3), "initWithValue:", -[HAPDiagnosticsSnapshotTypeWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPDiagnosticsSnapshotTypeWrapper *v5;
  uint64_t v6;
  HAPDiagnosticsSnapshotTypeWrapper *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v5 = (HAPDiagnosticsSnapshotTypeWrapper *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPDiagnosticsSnapshotTypeWrapper, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = -[HAPDiagnosticsSnapshotTypeWrapper value](self, "value");
      v9 = -[HAPDiagnosticsSnapshotTypeWrapper value](v7, "value");

      v10 = v8 == v9;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)description
{
  __CFString *v2;
  void *v3;
  void *v4;

  v2 = HAPDiagnosticsSnapshotTypeAsString(-[HAPDiagnosticsSnapshotTypeWrapper value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPDiagnosticsSnapshotTypeWrapper value=%@>"), v3));

  return (NSString *)v4;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

@end
