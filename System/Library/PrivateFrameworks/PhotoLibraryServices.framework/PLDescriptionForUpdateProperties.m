@implementation PLDescriptionForUpdateProperties

id __PLDescriptionForUpdateProperties_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = &stru_1E36789C0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = CFSTR("[R]");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = CFSTR("[F]");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), objc_opt_class());
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
