@implementation NSError(PRSAdditions)

+ (id)prs_errorWithCode:()PRSAdditions
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = CFSTR("the 'currentConfiguration' argument was invalid.");
  else
    v5 = CFSTR("Unknown error.");
  v11 = *MEMORY[0x1E0CB2D68];
  v12[0] = v5;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = v5;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "prs_errorWithCode:underlyingError:userInfo:", a3, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)prs_errorWithCode:()PRSAdditions userInfo:
{
  return objc_msgSend(a1, "prs_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)prs_errorWithCode:()PRSAdditions underlyingError:userInfo:
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v8 = a4;
  v9 = (void *)objc_msgSend(a5, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  if (v8)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
  if (a3)
    v13 = CFSTR("the 'currentConfiguration' argument was invalid.");
  else
    v13 = CFSTR("Unknown error.");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoardServices.errorDomain"), a3, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
