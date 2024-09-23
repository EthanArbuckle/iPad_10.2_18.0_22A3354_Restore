@implementation NSError(WFSiriExecution)

- (BOOL)wf_isRequiresShortcutsJrError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("WFSiriExecutionErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 0;
  else
    v3 = 0;

  return v3;
}

+ (uint64_t)wfSiriExecutionRequiresShortcutsJrError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFSiriExecutionErrorDomain"), 0, 0);
}

@end
