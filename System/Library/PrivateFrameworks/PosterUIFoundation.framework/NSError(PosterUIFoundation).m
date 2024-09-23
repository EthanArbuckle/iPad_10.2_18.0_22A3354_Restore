@implementation NSError(PosterUIFoundation)

+ (id)pui_errorWithCode:()PosterUIFoundation
{
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDD0FD8];
  if ((unint64_t)(a3 - 1) > 8)
    v5 = CFSTR("Unknown error.");
  else
    v5 = off_25154CD88[a3 - 1];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_errorWithCode:underlyingError:userInfo:", a3, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)pui_errorWithCode:()PosterUIFoundation userInfo:
{
  return objc_msgSend(a1, "pui_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)pui_errorWithCode:()PosterUIFoundation underlyingError:userInfo:
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
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD1398]);
  if ((unint64_t)(a3 - 1) > 8)
    v13 = CFSTR("Unknown error.");
  else
    v13 = off_25154CD88[a3 - 1];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FD8]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation.errorDomain"), a3, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
