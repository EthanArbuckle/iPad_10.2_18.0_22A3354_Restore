@implementation NSError(Interchange)

- (id)interchangeErrorDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("errorMessage");
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(a1, "localizedFailureReason");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = v4;
  v8[2] = CFSTR("errorDomain");
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v6;
}

+ (id)errorWithInterchangeErrorDictionary:()Interchange
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("errorCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("errorMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("errorDomain"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v9 = CFSTR("InterchangeCallbackErrorDomain");
  if (v8)
    v9 = v8;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E0CB2D50], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", v10, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
