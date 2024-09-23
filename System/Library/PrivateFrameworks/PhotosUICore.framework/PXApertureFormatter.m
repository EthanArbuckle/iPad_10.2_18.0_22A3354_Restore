@implementation PXApertureFormatter

+ (id)stringForObjectValue:(id)a3
{
  id v3;
  double v4;
  const __CFString *v5;
  __CFString *v6;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "doubleValue");
      if (v4 - floor(v4) == 0.0)
        v5 = CFSTR("ƒ/%0.0f");
      else
        v5 = CFSTR("ƒ/%0.4g");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, *(_QWORD *)&v4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = &stru_1E5149688;
  }

  return v6;
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
  double v14;

  v8 = a4;
  v14 = 0.0;
  if (!objc_msgSend(v8, "length"))
  {
    v14 = 0.0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "scanDouble:", &v14))
  {

    goto LABEL_8;
  }
  if ((objc_msgSend(v9, "scanString:intoString:", CFSTR("ƒ/"), 0) & 1) == 0
    && (objc_msgSend(v9, "scanString:intoString:", CFSTR("f/"), 0) & 1) == 0)
  {

    goto LABEL_12;
  }
  v10 = objc_msgSend(v9, "scanDouble:", &v14);

  if (!v10)
  {
LABEL_12:
    if (!a6)
    {
      v12 = 0;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 2048, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    a3 = a6;
    goto LABEL_14;
  }
LABEL_8:
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
LABEL_14:
    *a3 = v11;
    goto LABEL_15;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

@end
