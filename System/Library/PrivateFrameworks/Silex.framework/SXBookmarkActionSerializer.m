@implementation SXBookmarkActionSerializer

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = 0;
    if (a4 != 1 && (isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "bookmark");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_alloc_init(MEMORY[0x24BDD1808]);
        objc_msgSend(v8, "componentIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFragment:", v12);

        objc_msgSend(v9, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
