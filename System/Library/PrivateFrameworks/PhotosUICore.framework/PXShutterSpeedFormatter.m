@implementation PXShutterSpeedFormatter

+ (id)stringForObjectValue:(id)a3
{
  id v3;
  double v4;
  __CFString *v6;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "doubleValue");
      if (v4 > 0.0 && v4 < 0.5)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1/%ld s"), llround(1.0 / v4));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f s"), *(_QWORD *)&v4);
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
  uint64_t v14;
  uint64_t v15;
  double v16;

  v8 = a4;
  v16 = 0.0;
  if (objc_msgSend(v8, "length"))
  {
    v14 = 0;
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "scanInteger:", &v15)
      && objc_msgSend(v9, "scanString:intoString:", CFSTR("/"), 0)
      && objc_msgSend(v9, "scanInteger:", &v14)
      && v14)
    {
      v16 = (double)v15 / (double)v14;

    }
    else
    {
      objc_msgSend(v9, "setScanLocation:", 0);
      v10 = objc_msgSend(v9, "scanDouble:", &v16);

      if (!v10)
      {
        if (!a6)
        {
          v12 = 0;
          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 2048, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        a3 = a6;
        goto LABEL_13;
      }
    }
  }
  else
  {
    v16 = 0.0;
  }
  if (!a3)
  {
    v12 = 1;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1;
LABEL_13:
  *a3 = v11;
LABEL_16:

  return v12;
}

@end
