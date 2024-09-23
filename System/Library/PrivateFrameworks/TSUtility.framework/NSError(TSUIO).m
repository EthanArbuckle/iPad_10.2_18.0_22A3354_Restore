@implementation NSError(TSUIO)

+ (id)tsu_IOErrorWithCode:()TSUIO
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  if (a3 == 1)
  {
    SFUBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("An error occurred while writing");
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    SFUBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("An error occurred while reading");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D61C228, CFSTR("TSUtility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:", CFSTR("com.apple.iwork.TSUIO"), a3, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)tsu_IOReadErrorWithErrno:()TSUIO
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  SFUBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("An error occurred while reading: %s"), &stru_24D61C228, CFSTR("TSUtility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, strerror(a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:", CFSTR("com.apple.iwork.TSUIO"), 0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)tsu_IOWriteErrorWithErrno:()TSUIO
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  SFUBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("An error occurred while writing: %s"), &stru_24D61C228, CFSTR("TSUtility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, strerror(a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:", CFSTR("com.apple.iwork.TSUIO"), 1, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
