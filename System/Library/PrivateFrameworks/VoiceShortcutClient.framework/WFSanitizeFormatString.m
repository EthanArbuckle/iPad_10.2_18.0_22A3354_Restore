@implementation WFSanitizeFormatString

void __WFSanitizeFormatString_block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("%[^@ ]+"), 16, &v5);
  v1 = v5;
  v2 = (void *)WFSanitizeFormatString_expression;
  WFSanitizeFormatString_expression = v0;

  if (!WFSanitizeFormatString_expression)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull WFSanitizeFormatString(NSString * _Nullable __strong, BOOL * _Nonnull)_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFContextualAction.m"), 62, CFSTR("Could not compile regex: %@"), v1);

  }
}

@end
