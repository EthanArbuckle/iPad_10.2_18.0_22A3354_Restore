@implementation PDSCurrentServerEnvironment

void __PDSCurrentServerEnvironment_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  __objc2_prot_list **p_prots;
  char v9;
  id v10;

  if (CUTIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BE508E0], "sharedDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "appValueForKey:", CFSTR("pds-environment"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "intValue"));
      v1 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v1;
    if (v1)
    {
      switch(objc_msgSend(v1, "shortValue"))
      {
        case 0u:
          PDSCurrentServerEnvironment_env = 0;
          goto LABEL_28;
        case 1u:
          p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___PDSCDCache + 16);
          v9 = 1;
          goto LABEL_20;
        case 2u:
          p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___PDSCDCache + 16);
          v9 = 2;
          goto LABEL_20;
        case 3u:
          p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___PDSCDCache + 16);
          v9 = 3;
          goto LABEL_20;
        case 4u:
          p_prots = &OBJC_PROTOCOL___PDSCDCache.prots;
          v9 = 4;
LABEL_20:
          *((_BYTE *)p_prots + 368) = v9;
          break;
        default:
          goto LABEL_28;
      }
      goto LABEL_28;
    }
LABEL_10:
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.jett.switch-icloud"));
    objc_msgSend(v3, "objectForKey:", CFSTR("env"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_27:

      v2 = 0;
LABEL_28:

      return;
    }
    v5 = v4;
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("icloud1")) & 1) != 0)
      {
        v7 = 1;
LABEL_25:
        PDSCurrentServerEnvironment_env = v7;
        goto LABEL_26;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("icloud2")) & 1) != 0)
      {
        v7 = 2;
        goto LABEL_25;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("icloud3")) & 1) != 0)
      {
        v7 = 3;
        goto LABEL_25;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("icloud4")))
      {
        v7 = 4;
        goto LABEL_25;
      }
    }
LABEL_26:

    goto LABEL_27;
  }
}

@end
