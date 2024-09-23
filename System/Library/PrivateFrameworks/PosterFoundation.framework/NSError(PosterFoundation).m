@implementation NSError(PosterFoundation)

+ (id)pf_errorWithCode:()PosterFoundation
{
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDD0FD8];
  if ((unint64_t)(a3 - 1) > 2)
    v5 = CFSTR("Unknown error.");
  else
    v5 = (const __CFString *)*((_QWORD *)&off_251543CC0 + a3 - 1);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pf_errorWithCode:underlyingError:userInfo:", a3, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)pf_errorWithCode:()PosterFoundation userInfo:
{
  return objc_msgSend(a1, "pf_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)pf_errorWithCode:()PosterFoundation underlyingError:userInfo:
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
  if ((unint64_t)(a3 - 1) > 2)
    v13 = CFSTR("Unknown error.");
  else
    v13 = (const __CFString *)*((_QWORD *)&off_251543CC0 + a3 - 1);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FD8]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterFoundation"), a3, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)pf_isFileNotFoundError
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
  {
    v3 = 4;
  }
  else
  {
    if (!objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD1128]))
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = 2;
  }
  v4 = objc_msgSend(a1, "code") == v3;
LABEL_7:

  return v4;
}

@end
