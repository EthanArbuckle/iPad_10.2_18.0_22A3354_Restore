@implementation NSString(SiriPresentationActivationCancelReason)

+ (const)stringWithSiriPresentationActivationCancelReason:()SiriPresentationActivationCancelReason
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("SiriPresentationActivationCancelReasonShellEvent");
  else
    return off_1E91FC838[a3 - 1];
}

- (uint64_t)cancelReason
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationActivationCancelReason:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqualToString:", v2);

  v4 = 0;
  if ((v3 & 1) == 0)
  {
    v4 = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationActivationCancelReason:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqualToString:", v5);

    if ((v6 & 1) == 0)
    {
      v4 = 2;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationActivationCancelReason:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "isEqualToString:", v7);

      if ((v8 & 1) == 0)
      {
        v4 = 3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationActivationCancelReason:", 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(a1, "isEqualToString:", v9);

        if ((v10 & 1) == 0)
        {
          v4 = 4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationActivationCancelReason:", 4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "isEqualToString:", v11);

          if ((v12 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationActivationCancelReason:", 5);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(a1, "isEqualToString:", v13);

            if (v14)
              return 5;
            else
              return 0;
          }
        }
      }
    }
  }
  return v4;
}

@end
