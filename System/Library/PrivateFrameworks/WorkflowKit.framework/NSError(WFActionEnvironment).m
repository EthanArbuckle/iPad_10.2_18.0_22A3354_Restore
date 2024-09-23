@implementation NSError(WFActionEnvironment)

- (BOOL)wf_isUnsupportedEnvironmentError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("WFActionErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 2;
  else
    v3 = 0;

  return v3;
}

+ (id)wfUnsupportedEnvironmentError
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("This action cannot be run in the current environment."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 2, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
