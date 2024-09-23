@implementation POXSDurationDefinition

- (id)valueFromString:(id)a3
{
  id v3;
  void *v4;
  int v5;
  char v6;
  double v7;
  char v8;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v16;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v3);
  v5 = objc_msgSend(v4, "scanString:intoString:", CFSTR("-"), 0);
  objc_msgSend(v4, "scanString:intoString:", CFSTR("+"), 0);
  v6 = objc_msgSend(v4, "scanString:intoString:", CFSTR("P"), 0) ^ 1;
  v7 = 0.0;
  if ((objc_msgSend(v4, "isAtEnd") & 1) == 0 && (v6 & 1) == 0)
  {
    v8 = 0;
    while (1)
    {
      v16 = 0.0;
      v6 = objc_msgSend(v4, "scanDouble:", &v16) ^ 1;
      v9 = objc_msgSend(v4, "scanLocation");
      v10 = objc_msgSend(v3, "characterAtIndex:", v9);
      if (v10 > 82)
        break;
      switch(v10)
      {
        case 'D':
          v11 = v16;
LABEL_21:
          v12 = v11 * 24.0;
          goto LABEL_22;
        case 'H':
          v12 = v16;
LABEL_22:
          v7 = v7 + v12 * 60.0 * 60.0;
          goto LABEL_25;
        case 'M':
          if ((v8 & 1) != 0)
          {
            v7 = v7 + v16 * 60.0;
            v8 = 1;
            goto LABEL_25;
          }
          v8 = 0;
          break;
      }
      v6 = 1;
LABEL_25:
      objc_msgSend(v4, "setScanLocation:", v9 + 1);
      if ((objc_msgSend(v4, "isAtEnd") & 1) != 0 || (v6 & 1) != 0)
        goto LABEL_27;
    }
    if (v10 == 83)
    {
      v7 = v7 + v16;
      goto LABEL_25;
    }
    if (v10 != 87)
    {
      if (v10 == 84)
        v6 = v8;
      else
        v6 = 1;
      if (v10 == 84)
        v8 = 1;
      goto LABEL_25;
    }
    v11 = v16 * 7.0;
    goto LABEL_21;
  }
LABEL_27:
  if ((v6 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = -v7;
    if (!v5)
      v14 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)stringFromValue:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "longLongValue");
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v4 & 0x8000000000000000) != 0)
    {
      objc_msgSend(v5, "appendString:", CFSTR("-"));
      v4 = -(uint64_t)v4;
    }
    v7 = v4 % 0x93A80;
    objc_msgSend(v6, "appendString:", CFSTR("P"));
    if (v4 >= 0x93A80)
      objc_msgSend(v6, "appendFormat:", CFSTR("%llu%C"), v4 / 0x93A80, 87);
    v8 = v4 % 0x15180;
    if (v7 >= 0x15180)
      objc_msgSend(v6, "appendFormat:", CFSTR("%llu%C"), v7 / 0x15180uLL, 68);
    v9 = v4 % 0x3C;
    if (v8 <= 0xE0F && (v4 % 0xE10 <= 0x3B ? (v10 = v9 == 0) : (v10 = 0), v10))
    {
      if (!v4)
        objc_msgSend(v6, "appendString:", CFSTR("T0S"));
    }
    else
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("%C"), 84);
      if (v8 >= 0xE10)
        objc_msgSend(v6, "appendFormat:", CFSTR("%llu%C"), v8 / 0xE10uLL, 72);
      if ((unsigned __int16)(v4 % 0xE10) >= 0x3Cu)
        objc_msgSend(v6, "appendFormat:", CFSTR("%llu%C"), v4 % 0xE10 / 0x3C, 77);
      if (v9)
        objc_msgSend(v6, "appendFormat:", CFSTR("%llu%C"), v9, 83);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
