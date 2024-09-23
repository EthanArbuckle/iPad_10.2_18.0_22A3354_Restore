@implementation SearchUIAppCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;

  v5 = a4;
  if ((objc_msgSend(a3, "isLocalApplicationResult") & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_msgSend(v5, "command");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_msgSend(v5, "command");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
  }

  return isKindOfClass & 1;
}

- (id)prefixMatchExtensionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SearchUICompletion result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompletion completionStringToMatch](self, "completionStringToMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "localizedOpenString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SearchUICompletion result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

@end
