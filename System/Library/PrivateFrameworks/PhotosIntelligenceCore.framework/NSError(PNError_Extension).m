@implementation NSError(PNError_Extension)

+ (id)_pn_genericErrorWithUnderlyingError:()PNError_Extension localizedDescription:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD1398]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("PNPhotosIntelligenceErrorDomain"), -1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)pn_genericErrorWithMultipleUnderlyingErrors:()PNError_Extension localizedDescription:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD10D8]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("PNPhotosIntelligenceErrorDomain"), 3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)pn_errorWithCode:()PNError_Extension localizedDescription:
{
  __CFString *v6;
  id v7;
  void *v8;
  va_list va;

  va_start(va, format);
  v6 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, format, va);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("PNPhotosIntelligenceErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)pn_genericErrorWithLocalizedDescription:()PNError_Extension
{
  __CFString *v10;
  void *v11;

  v10 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a3, &a9);
  objc_msgSend(a1, "_pn_genericErrorWithUnderlyingError:localizedDescription:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)pn_genericErrorWithUnderlyingError:()PNError_Extension localizedDescription:
{
  const __CFAllocator *v11;
  id v12;
  __CFString *v13;
  void *v14;

  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12 = a3;
  v13 = (__CFString *)CFStringCreateWithFormatAndArguments(v11, 0, a4, &a9);
  objc_msgSend(a1, "_pn_genericErrorWithUnderlyingError:localizedDescription:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
