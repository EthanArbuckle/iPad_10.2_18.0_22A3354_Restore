@implementation SXViewLocationConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;
  BOOL v11;

  v5 = a3;
  v6 = objc_msgSend(a4, "viewingLocation");
  objc_msgSend(v5, "viewLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = CFSTR("article");
    if (v6 == 3)
      v8 = CFSTR("issue_table_of_contents");
    if (v6 == 2)
      v9 = CFSTR("issue");
    else
      v9 = (__CFString *)v8;
    objc_msgSend(v5, "viewLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[__CFString caseInsensitiveCompare:](v9, "caseInsensitiveCompare:", v10) == 0;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

@end
