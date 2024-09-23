@implementation SXPhoneNumberActionSerializer

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (a4 != 1 && v6)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDD1808]);
      objc_msgSend(v8, "setScheme:", CFSTR("tel"));
      objc_msgSend(v5, "phoneNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHost:", v9);

      objc_msgSend(v8, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
