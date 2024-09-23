@implementation TCNumberFormatUtilities

+ (id)cleanDateTimeFormatString:(id)a3 withMappings:(id)a4
{
  id v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v22;

  v5 = a3;
  v22 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      if (!objc_msgSend(v5, "length"))
      {
        v11 = v5;
        goto LABEL_32;
      }
      v9 = objc_msgSend(v5, "rangeOfString:", CFSTR("'"));
      v10 = v9;
      if (!((v9 != 0) | v7 & 1))
        break;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = 0;
        v12 = v5;
        if ((v7 & 1) == 0)
          goto LABEL_20;
        goto LABEL_7;
      }
      if (!v9)
        goto LABEL_24;
      objc_msgSend(v5, "substringToIndex:", v9);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "substringFromIndex:", v10 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v12 = (void *)v16;
        if ((v7 & 1) == 0)
        {
LABEL_20:
          objc_msgSend(a1, "cleanDateTimeSubstring:withMappings:", v12, v22);
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_21:
          v17 = v12;
          v18 = (void *)v15;

          if (!v18)
          {
            v19 = 0;
            goto LABEL_33;
          }
          objc_msgSend(v6, "appendString:", v18);
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {

            goto LABEL_32;
          }
          goto LABEL_26;
        }
LABEL_7:
        if (objc_msgSend(v12, "rangeOfString:", CFSTR("\")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v13;
          objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\"\"), 2, 0, objc_msgSend(v13, "length"));
        }
        if ((v8 & 1) != 0)
          v14 = CFSTR("%@\");
        else
          v14 = CFSTR("\"%@\");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v12);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
LABEL_25:
      v18 = 0;
LABEL_26:
      v8 = 0;
      v7 ^= 1u;
      v5 = v18;
LABEL_27:

      v5 = v11;
      if (!v11)
        goto LABEL_32;
    }
    if (objc_msgSend(v6, "length"))
    {
      if ((unint64_t)objc_msgSend(v6, "length") >= 2)
        objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
      objc_msgSend(v6, "appendString:", CFSTR("'"));
      v7 = 1;
      objc_msgSend(v5, "substringFromIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
      goto LABEL_27;
    }
LABEL_24:
    objc_msgSend(v5, "substringFromIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_25;
  }
  v11 = 0;
LABEL_32:
  v19 = v6;
LABEL_33:

  return v19;
}

+ (id)cleanDateTimeSubstring:(id)a3 withMappings:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v28;
  void *v29;

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v5, "rangeOfString:", CFSTR("s:S")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("s:S"), CFSTR("s.S"));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("EMLdyYGDwFWhHKkmsSa"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "invertedSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      while (1)
      {
        if (!objc_msgSend(v5, "length"))
          goto LABEL_28;
        v9 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v29);
        v10 = v9;
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        if (!v9)
        {
          v11 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v28);
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = 0;
          }
          else
          {
            objc_msgSend(v5, "substringToIndex:", v11);
            v22 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "substringFromIndex:", v11);
            v12 = objc_claimAutoreleasedReturnValue();

            v5 = (id)v22;
          }
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" ,.-:<>/"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "invertedSet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v5, "rangeOfCharacterFromSet:", v24) != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), v5);
            v25 = objc_claimAutoreleasedReturnValue();

            v5 = (id)v25;
          }
          objc_msgSend(v8, "appendString:", v5);

          goto LABEL_26;
        }
        objc_msgSend(v5, "substringToIndex:", v9);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "substringFromIndex:", v10);
        v12 = objc_claimAutoreleasedReturnValue();

        if (v13)
          goto LABEL_13;
LABEL_27:
        v5 = (id)v12;
        if (!v12)
          goto LABEL_28;
      }
      v12 = 0;
      v13 = (uint64_t)v5;
LABEL_13:
      v5 = (id)v13;
      while (objc_msgSend(v5, "length"))
      {
        v14 = (void *)MEMORY[0x24BDD14A8];
        objc_msgSend(v5, "substringToIndex:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "characterSetWithCharactersInString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "invertedSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v17);
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(v5, "substringToIndex:", v18);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "substringFromIndex:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = (id)v20;
        }
        objc_msgSend(v6, "objectForKey:", v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

          v26 = 0;
          v5 = (id)v12;
          goto LABEL_31;
        }
        objc_msgSend(v8, "appendString:", v21);

        v5 = v19;
        if (!v19)
          break;
      }
LABEL_26:

      goto LABEL_27;
    }
LABEL_28:
    v26 = v8;
LABEL_31:

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
