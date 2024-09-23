@implementation NSError(SCWAdditions)

- (uint64_t)sc_hasUnderlyingErrorCode:()SCWAdditions
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v6)
    return 0;
  if (objc_msgSend(a1, "code") != a3)
  {
    if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __51__NSError_SCWAdditions__sc_hasUnderlyingErrorCode___block_invoke;
      v12[3] = &__block_descriptor_40_e17_B16__0__NSError_8l;
      v12[4] = a3;
      v7 = objc_msgSend(v10, "scw_containsObjectPassingTest:", v12);

      return v7;
    }
    return 0;
  }
  return 1;
}

@end
