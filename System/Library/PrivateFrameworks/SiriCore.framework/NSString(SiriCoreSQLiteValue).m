@implementation NSString(SiriCoreSQLiteValue)

- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (a3)
  {
    objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\"\"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("\"%@\"), v6);
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("'%@'"), v6);
  }
  v8 = (void *)v7;

  return v8;
}

- (uint64_t)siriCoreSQLiteValue_textRepresentation
{
  return objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
}

- (uint64_t)siriCoreSQLiteValue_type
{
  return 5;
}

- (id)siriCoreSQLiteValue_toNumber
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v10;
  int v11;
  __int128 v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v2 = objc_msgSend(a1, "length");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  v15 = 0;
  if (objc_msgSend(v3, "scanUnsignedLongLong:", &v15) && objc_msgSend(v3, "scanLocation") == v2)
  {
    v4 = v15;
    if (v15 != -1)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v7 = (void *)v5;
      goto LABEL_26;
    }
    if (objc_msgSend(a1, "isEqualToString:", CFSTR("18446744073709551615")))
    {
      v4 = v15;
      goto LABEL_6;
    }
LABEL_23:
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithString:", a1);
    goto LABEL_25;
  }
  objc_msgSend(v3, "setScanLocation:", 0);
  v14 = 0;
  if (objc_msgSend(v3, "scanLongLong:", &v14) && objc_msgSend(v3, "scanLocation") == v2)
  {
    v6 = v14;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((objc_msgSend(a1, "isEqualToString:", CFSTR("+9223372036854775807")) & 1) == 0)
        goto LABEL_23;
      v6 = v14;
    }
    if (v6 == 0x8000000000000000)
    {
      if (!objc_msgSend(a1, "isEqualToString:", CFSTR("-9223372036854775808")))
        goto LABEL_23;
      v6 = v14;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v6);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  objc_msgSend(v3, "setScanLocation:", 0);
  v12 = 0uLL;
  v13 = 0;
  v7 = 0;
  if (objc_msgSend(v3, "scanDecimal:", &v12))
  {
    if (objc_msgSend(v3, "scanLocation") == v2)
    {
      if ((BYTE1(v12) & 0xC) == 0
        && (objc_msgSend(v3, "setScanLocation:", 0),
            *(_QWORD *)&v10 = 0,
            objc_msgSend(v3, "scanDouble:", &v10))
        && objc_msgSend(v3, "scanLocation") == v2)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v10);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = objc_alloc(MEMORY[0x24BDD1518]);
        v10 = v12;
        v11 = v13;
        v5 = objc_msgSend(v8, "initWithDecimal:", &v10);
      }
      goto LABEL_25;
    }
    v7 = 0;
  }
LABEL_26:

  return v7;
}

- (uint64_t)siriCoreSQLiteValue_toData
{
  return objc_msgSend(a1, "dataUsingEncoding:", 4);
}

@end
