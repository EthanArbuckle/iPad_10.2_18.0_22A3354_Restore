@implementation NSError(WFToolKit)

- (BOOL)wf_isCancelledStepError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("WFToolKitErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 0;
  else
    v3 = 0;

  return v3;
}

+ (uint64_t)wfCancelledStepError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFToolKitErrorDomain"), 0, 0);
}

@end
