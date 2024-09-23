@implementation NSError(TLExtensions)

+ (id)tl_errorWithDomain:()TLExtensions description:
{
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (a4)
  {
    v18 = &a9;
    v12 = (objc_class *)MEMORY[0x1E0CB3940];
    v13 = a4;
    v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

    if (v14)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", v11, 0, v15, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)tl_nonRedundantDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@, "), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", v6, &stru_1E952DE48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v8, &stru_1E952DE48);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
