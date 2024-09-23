@implementation TransparencyGPBAny

+ (TransparencyGPBAny)anyWithMessage:(id)a3 error:(id *)a4
{
  return (TransparencyGPBAny *)_objc_msgSend(a1, "anyWithMessage:typeURLPrefix:error:", a3, CFSTR("type.googleapis.com/"), a4);
}

+ (TransparencyGPBAny)anyWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  return (TransparencyGPBAny *)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:typeURLPrefix:error:", a3, a4, a5);
}

- (TransparencyGPBAny)initWithMessage:(id)a3 error:(id *)a4
{
  return -[TransparencyGPBAny initWithMessage:typeURLPrefix:error:](self, "initWithMessage:typeURLPrefix:error:", a3, CFSTR("type.googleapis.com/"), a4);
}

- (TransparencyGPBAny)initWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  TransparencyGPBAny *v8;
  TransparencyGPBAny *v9;

  v8 = -[TransparencyGPBMessage init](self, "init");
  v9 = v8;
  if (v8
    && !-[TransparencyGPBAny packWithMessage:typeURLPrefix:error:](v8, "packWithMessage:typeURLPrefix:error:", a3, a4, a5))
  {

    return 0;
  }
  return v9;
}

- (BOOL)packWithMessage:(id)a3 error:(id *)a4
{
  return -[TransparencyGPBAny packWithMessage:typeURLPrefix:error:](self, "packWithMessage:typeURLPrefix:error:", a3, CFSTR("type.googleapis.com/"), a4);
}

- (BOOL)packWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  NSString *v9;
  NSUInteger v10;
  NSString *v11;

  v9 = (NSString *)objc_msgSend(objc_msgSend(a3, "descriptor"), "fullName");
  v10 = -[NSString length](v9, "length");
  if (v10)
  {
    if (a5)
      *a5 = 0;
    if (objc_msgSend(a4, "length"))
    {
      if (objc_msgSend(a4, "hasSuffix:", CFSTR("/")))
        v11 = (NSString *)objc_msgSend(a4, "stringByAppendingString:", v9);
      else
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), a4, v9);
      v9 = v11;
    }
    -[TransparencyGPBAny setTypeURL:](self, "setTypeURL:", v9);
    -[TransparencyGPBAny setValue:](self, "setValue:", objc_msgSend(a3, "data"));
  }
  else if (a5)
  {
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyGPBWellKnownTypesErrorDomain"), -100, 0);
  }
  return v10 != 0;
}

- (id)unpackMessageClass:(Class)a3 error:(id *)a4
{
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v14;

  v7 = objc_msgSend(-[objc_class descriptor](a3, "descriptor"), "fullName");
  if (objc_msgSend(v7, "length"))
  {
    v8 = -[TransparencyGPBAny typeURL](self, "typeURL");
    v9 = (char *)objc_msgSend(v8, "rangeOfString:options:", CFSTR("/"), 4);
    if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v9;
      if (&v9[v10] != objc_msgSend(v8, "length"))
      {
        v12 = objc_msgSend(v8, "substringFromIndex:", v11 + 1);
        if (v12)
        {
          if ((objc_msgSend(v12, "isEqual:", v7) & 1) != 0)
            return -[objc_class parseFromData:error:](a3, "parseFromData:error:", -[TransparencyGPBAny value](self, "value"), a4);
        }
      }
    }
    if (a4)
    {
      v14 = -101;
LABEL_11:
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyGPBWellKnownTypesErrorDomain"), v14, 0);
    }
  }
  else if (a4)
  {
    v14 = -100;
    goto LABEL_11;
  }
  return 0;
}

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7460;
  if (!qword_1002A7460)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBAny, CFSTR("Any"), off_1002A1D20, &off_1002A1CE0, 2, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216DB8);
    qword_1002A7460 = (uint64_t)v2;
  }
  return v2;
}

@end
