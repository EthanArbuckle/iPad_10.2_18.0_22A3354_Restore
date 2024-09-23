@implementation PFAssertionPolicyThrowAlways

- (void)notifyAssertion:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = a3;
  objc_msgSend(v5, "prettyMethodName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "lineNumber");
  objc_msgSend(v5, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "raise:format:", v4, CFSTR("Assertion failure in %@, %@:%lu: %@"), v9, v6, v7, v8);
}

@end
