@implementation PFAssertionPolicyCrashReport

- (void)notifyAssertion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "isFatal"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "prettyMethodName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "lineNumber");
    objc_msgSend(v10, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Assertion failure in %@, %@:%lu\n%@"), v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_retainAutorelease(v8);
    qword_1EF1518F8 = objc_msgSend(v9, "UTF8String");

  }
}

@end
