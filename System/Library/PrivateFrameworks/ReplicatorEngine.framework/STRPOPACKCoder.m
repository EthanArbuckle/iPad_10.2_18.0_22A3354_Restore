@implementation STRPOPACKCoder

+ (id)encodeObject:(id)a3 error:(id *)a4
{
  id v5;
  STRPPropertyListTypeEncoder *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  int v12;

  v5 = a3;
  v6 = objc_alloc_init(STRPPropertyListTypeEncoder);
  -[STRPPropertyListTypeEncoder encodeRootObject:](v6, "encodeRootObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v8 = (void *)MEMORY[0x2495328AC](v7, 0, &v12);
  if (v8)
    v9 = v12 == 0;
  else
    v9 = 0;
  v10 = !v9;
  if (a4 && v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("STRPCodingErrorDomain"), 2, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  void *v7;
  STRPPropertyListTypeDecoder *v8;
  void *v9;

  v7 = (void *)OPACKDecodeData();
  if (v7)
  {
    v8 = objc_alloc_init(STRPPropertyListTypeDecoder);
    -[STRPPropertyListTypeDecoder decodeRootObjectOfClass:fromEncoded:error:](v8, "decodeRootObjectOfClass:fromEncoded:error:", a3, v7, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("STRPCodingErrorDomain"), 2, 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
