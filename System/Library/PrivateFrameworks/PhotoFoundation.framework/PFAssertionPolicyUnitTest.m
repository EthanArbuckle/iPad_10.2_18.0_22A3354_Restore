@implementation PFAssertionPolicyUnitTest

- (void)notifyAssertion:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isFatal") & 1) != 0 || objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99768];
    objc_msgSend(v9, "prettyMethodName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "lineNumber");
    objc_msgSend(v9, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("Assertion failure in %@, %@:%lu: %@"), v5, v6, v7, v8);

  }
}

@end
