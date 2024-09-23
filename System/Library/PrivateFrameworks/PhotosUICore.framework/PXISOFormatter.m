@implementation PXISOFormatter

+ (id)stringForObjectValue:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "integerValue");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ISO %ld"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = &stru_1E5149688;
  }

  return v5;
}

- (id)stringForObjectValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "stringForObjectValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  uint64_t v14;

  v8 = a4;
  v14 = 0;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scanString:intoString:", CFSTR("ISO"), 0);
    v10 = objc_msgSend(v9, "scanInteger:", &v14);

    if (!v10)
    {
      if (!a6)
      {
        v12 = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 2048, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      a3 = a6;
      goto LABEL_8;
    }
  }
  else
  {
    v14 = 0;
  }
  if (!a3)
  {
    v12 = 1;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1;
LABEL_8:
  *a3 = v11;
LABEL_11:

  return v12;
}

@end
