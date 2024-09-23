@implementation SXEmailActionSerializer

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("mailto:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "recipient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v7);

    }
    objc_msgSend(v4, "subject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "subject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "appendFormat:", CFSTR("?subject=%@"), v11);
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
