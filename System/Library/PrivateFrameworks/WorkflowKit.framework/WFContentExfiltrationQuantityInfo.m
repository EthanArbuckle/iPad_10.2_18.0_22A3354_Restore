@implementation WFContentExfiltrationQuantityInfo

+ (int64_t)sharingItemCountLimitForContentWithAttribution:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "appDescriptor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC7E90]) & 1) == 0)
      {
        if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC7EA0]) & 1) != 0)
        {
LABEL_5:
          v6 = 10;
LABEL_9:

          goto LABEL_10;
        }
        if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC7F38]) & 1) == 0)
        {
          if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC7F20]) & 1) != 0)
          {
            v6 = 20;
            goto LABEL_9;
          }
          if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC7EC0]) & 1) != 0)
          {
            v6 = 100;
            goto LABEL_9;
          }
          if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC7F18]) & 1) == 0)
          {
            if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC7F00]))
              v6 = 100;
            else
              v6 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_9;
          }
          goto LABEL_5;
        }
      }
      v6 = 50;
      goto LABEL_9;
    }
  }
  v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return v6;
}

+ (int64_t)deletionItemCountLimitForContentWithContentItemClassName:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  char v6;
  objc_class *v7;
  void *v8;
  char v9;
  int64_t v10;
  objc_class *v11;
  void *v12;
  char v13;
  objc_class *v14;
  void *v15;
  char v16;
  objc_class *v18;
  void *v19;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
    goto LABEL_6;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 10;
    goto LABEL_7;
  }
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "isEqualToString:", v12);

  if ((v13 & 1) != 0
    || (v14 = (objc_class *)objc_opt_class(),
        NSStringFromClass(v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v3, "isEqualToString:", v15),
        v15,
        (v16 & 1) != 0))
  {
LABEL_6:
    v10 = 50;
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WFHKSampleContentItem")) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "isEqualToString:", v19);

    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_7:

  return v10;
}

@end
