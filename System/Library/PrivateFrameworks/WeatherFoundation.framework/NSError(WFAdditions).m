@implementation NSError(WFAdditions)

+ (uint64_t)wf_errorWithCode:()WFAdditions
{
  return objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", a3, 0);
}

+ (id)wf_errorWithCode:()WFAdditions userInfo:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;

  v5 = (void *)objc_msgSend(a4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  v9 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if ((unint64_t)(a3 - 1) > 0xE)
      v10 = CFSTR("An unknown error occured.  Please file a radar with whatever it is you did to cause this.");
    else
      v10 = off_24CCA1CB0[a3 - 1];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WeatherFoundationErrorDomain"), a3, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)wf_errorWithCode:()WFAdditions encapsulatedError:userInfo:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = (void *)objc_msgSend(a5, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  if (v7)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
