@implementation NSError(PRUtilities)

+ (id)pr_errorWithCode:()PRUtilities
{
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB2D68];
  if ((unint64_t)(a3 - 1) > 8)
    v5 = CFSTR("Unknown error.");
  else
    v5 = off_1E2186350[a3 - 1];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pr_errorWithCode:underlyingError:userInfo:", a3, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)pr_errorWithCode:()PRUtilities userInfo:
{
  return objc_msgSend(a1, "pr_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)pr_errorWithCode:()PRUtilities underlyingError:userInfo:
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
  if ((unint64_t)(a3 - 1) > 8)
    v13 = CFSTR("Unknown error.");
  else
    v13 = off_1E2186350[a3 - 1];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterKit.errorDomain"), a3, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
