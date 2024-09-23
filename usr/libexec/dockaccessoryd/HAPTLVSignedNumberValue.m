@implementation HAPTLVSignedNumberValue

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPTLVSignedNumberValue *v6;
  HAPTLVSignedNumberValue *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPTLVSignedNumberValue);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPTLVNumberValueBase parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", sub_10002228C((unsigned __int8 *)a3, a4, a5));
}

- (id)_serialize
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVNumberValueBase value](self, "value"));
  v3 = sub_10002234C((uint64_t)objc_msgSend(v2, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVNumberValueBase value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPTLVSignedNumberValue value=%lld>"), objc_msgSend(v2, "longLongValue")));

  return v3;
}

@end
