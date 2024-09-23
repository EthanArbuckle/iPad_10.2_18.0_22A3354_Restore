@implementation HAPDiagnosticsSnapshotFormatWrapper

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPDiagnosticsSnapshotFormatWrapper *v6;
  HAPDiagnosticsSnapshotFormatWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPDiagnosticsSnapshotFormatWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPDiagnosticsSnapshotFormatWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPDiagnosticsSnapshotFormatWrapper)init
{
  HAPDiagnosticsSnapshotFormatWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPDiagnosticsSnapshotFormatWrapper;
  result = -[HAPDiagnosticsSnapshotFormatWrapper init](&v3, "init");
  if (result)
    result->_value = 0;
  return result;
}

- (HAPDiagnosticsSnapshotFormatWrapper)initWithValue:(int64_t)a3
{
  HAPDiagnosticsSnapshotFormatWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAPDiagnosticsSnapshotFormatWrapper;
  result = -[HAPDiagnosticsSnapshotFormatWrapper init](&v5, "init");
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  id v11;
  unsigned int v13;

  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    if (!a4)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));
    v9 = 0;
    goto LABEL_7;
  }
  v13 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = sub_100022530((unsigned __int8 *)objc_msgSend(v7, "bytes"), (uint64_t)objc_msgSend(v7, "length"), (int *)&v13);
  v9 = v13 == 0;
  if (!v13)
  {
    -[HAPDiagnosticsSnapshotFormatWrapper setValue:](self, "setValue:", v8);
    goto LABEL_10;
  }
  if (a4)
  {
    v10 = sub_100040DDC(v13);
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
LABEL_7:
    *a4 = v11;
  }
LABEL_10:

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  return sub_1000225E0(-[HAPDiagnosticsSnapshotFormatWrapper value](self, "value", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HAPDiagnosticsSnapshotFormatWrapper initWithValue:](+[HAPDiagnosticsSnapshotFormatWrapper allocWithZone:](HAPDiagnosticsSnapshotFormatWrapper, "allocWithZone:", a3), "initWithValue:", -[HAPDiagnosticsSnapshotFormatWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPDiagnosticsSnapshotFormatWrapper *v5;
  uint64_t v6;
  HAPDiagnosticsSnapshotFormatWrapper *v7;
  int64_t v8;
  int64_t v9;
  BOOL v10;

  v5 = (HAPDiagnosticsSnapshotFormatWrapper *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPDiagnosticsSnapshotFormatWrapper, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = -[HAPDiagnosticsSnapshotFormatWrapper value](self, "value");
      v9 = -[HAPDiagnosticsSnapshotFormatWrapper value](v7, "value");

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

  v2 = HAPDiagnosticsSnapshotFormatAsString(-[HAPDiagnosticsSnapshotFormatWrapper value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPDiagnosticsSnapshotFormatWrapper value=%@>"), v3));

  return (NSString *)v4;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

@end
