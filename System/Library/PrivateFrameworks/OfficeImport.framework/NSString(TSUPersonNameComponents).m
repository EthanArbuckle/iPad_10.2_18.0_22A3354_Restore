@implementation NSString(TSUPersonNameComponents)

+ (id)tsu_localizedDisplayNameWithPersonNameComponents:()TSUPersonNameComponents
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_165);
    objc_msgSend(v3, "givenName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
    objc_msgSend(v3, "familyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    if (v5 && v7)
    {
      if ((objc_msgSend(v4, "tsu_isCJKString") & 1) != 0 || objc_msgSend(v6, "tsu_isCJKString"))
      {
        objc_msgSend(v6, "stringByAppendingString:", v4);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (v5)
    {
      v8 = v4;
    }
    else
    {
      if (!v7)
      {
        v9 = 0;
        goto LABEL_16;
      }
      v8 = v6;
    }
    v9 = v8;
LABEL_16:

    goto LABEL_17;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

@end
