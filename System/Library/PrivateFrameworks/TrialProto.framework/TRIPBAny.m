@implementation TRIPBAny

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)_MergedGlobals_10;
  if (!_MergedGlobals_10)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    if (!qword_1ECF0E670)
      qword_1ECF0E670 = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("google.protobuf"), CFSTR("TRIPB"), 3);
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1921A4550);
    if (_MergedGlobals_10)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIAny.pbobjc.m"), 101, CFSTR("Startup recursed!"));
    _MergedGlobals_10 = (uint64_t)v2;
  }
  return v2;
}

+ (id)anyWithMessage:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "anyWithMessage:typeURLPrefix:error:", a3, CFSTR("type.googleapis.com/"), a4);
}

+ (id)anyWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:typeURLPrefix:error:", a3, a4, a5);
}

- (TRIPBAny)initWithMessage:(id)a3 error:(id *)a4
{
  return -[TRIPBAny initWithMessage:typeURLPrefix:error:](self, "initWithMessage:typeURLPrefix:error:", a3, CFSTR("type.googleapis.com/"), a4);
}

- (TRIPBAny)initWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  TRIPBAny *v8;
  TRIPBAny *v9;

  v8 = -[TRIPBMessage init](self, "init");
  v9 = v8;
  if (v8 && !-[TRIPBAny packWithMessage:typeURLPrefix:error:](v8, "packWithMessage:typeURLPrefix:error:", a3, a4, a5))
  {

    return 0;
  }
  return v9;
}

- (BOOL)packWithMessage:(id)a3 error:(id *)a4
{
  return -[TRIPBAny packWithMessage:typeURLPrefix:error:](self, "packWithMessage:typeURLPrefix:error:", a3, CFSTR("type.googleapis.com/"), a4);
}

- (BOOL)packWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "descriptor"), "fullName");
  v10 = objc_msgSend(v9, "length");
  if (v10)
  {
    if (a5)
      *a5 = 0;
    if (objc_msgSend(a4, "length"))
    {
      if (objc_msgSend(a4, "hasSuffix:", CFSTR("/")))
        v11 = objc_msgSend(a4, "stringByAppendingString:", v9);
      else
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), a4, v9);
      v9 = (void *)v11;
    }
    -[TRIPBAny setTypeURL:](self, "setTypeURL:", v9);
    -[TRIPBAny setValue:](self, "setValue:", objc_msgSend(a3, "data"));
  }
  else if (a5)
  {
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIPBWellKnownTypesErrorDomain"), -100, 0);
  }
  return v10 != 0;
}

- (id)unpackMessageClass:(Class)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  uint64_t v15;

  v7 = (void *)objc_msgSend((id)-[objc_class descriptor](a3, "descriptor"), "fullName");
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)-[TRIPBAny typeURL](self, "typeURL");
    v9 = objc_msgSend(v8, "rangeOfString:options:", CFSTR("/"), 4);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v9;
      if (v9 + v10 != objc_msgSend(v8, "length"))
      {
        v12 = (void *)objc_msgSend(v8, "substringFromIndex:", v11 + 1);
        if (v12)
        {
          if ((objc_msgSend(v12, "isEqual:", v7) & 1) != 0)
            return (id)-[objc_class parseFromData:error:](a3, "parseFromData:error:", -[TRIPBAny value](self, "value"), a4);
        }
      }
    }
    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = -101;
LABEL_11:
      *a4 = (id)objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("TRIPBWellKnownTypesErrorDomain"), v15, 0);
    }
  }
  else if (a4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -100;
    goto LABEL_11;
  }
  return 0;
}

@end
