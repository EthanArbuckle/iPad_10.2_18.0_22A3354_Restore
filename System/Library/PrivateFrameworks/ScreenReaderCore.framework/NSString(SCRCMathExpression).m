@implementation NSString(SCRCMathExpression)

+ (id)stringWithDollarCode:()SCRCMathExpression
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("\x1C"), v4, CFSTR("\x1F"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)stringWrappedInMathMLTag:()SCRCMathExpression
{
  return objc_msgSend(a1, "stringWrappedInMathMLTag:withAttributes:", a3, 0);
}

- (id)stringWrappedInMathMLTag:()SCRCMathExpression withAttributes:
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  if (v9 >= 2)
  {
    v10 = v9 >> 1;
    v11 = 1;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v11 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR(" %@=\"%@\"), v12, v13);

      v11 += 2;
      --v10;
    }
    while (v10);
  }
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("</%@>"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v8, a1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
