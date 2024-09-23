@implementation SFUJson

+ (id)stringFromObject:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = v4;
  if (a3)
    objc_msgSend(a3, "appendJsonStringToString:", v4);
  else
    objc_msgSend(v4, "appendString:", CFSTR("null"));
  return v5;
}

+ (id)objectFromString:(id)a3
{
  SFUJsonScanner *v3;
  id v4;

  v3 = -[SFUJsonScanner initWithString:]([SFUJsonScanner alloc], "initWithString:", a3);
  -[SFUJsonScanner skipWhitespace](v3, "skipWhitespace");
  v4 = -[SFUJsonScanner parseObjectWithMaxDepth:](v3, "parseObjectWithMaxDepth:", 10000);

  return v4;
}

+ (id)arrayFromString:(id)a3
{
  SFUJsonScanner *v3;
  id v4;

  v3 = -[SFUJsonScanner initWithString:]([SFUJsonScanner alloc], "initWithString:", a3);
  -[SFUJsonScanner skipWhitespace](v3, "skipWhitespace");
  v4 = -[SFUJsonScanner parseArrayWithMaxDepth:](v3, "parseArrayWithMaxDepth:", 10000);

  return v4;
}

+ (id)dictionaryFromString:(id)a3
{
  SFUJsonScanner *v3;
  id v4;

  v3 = -[SFUJsonScanner initWithString:]([SFUJsonScanner alloc], "initWithString:", a3);
  -[SFUJsonScanner skipWhitespace](v3, "skipWhitespace");
  v4 = -[SFUJsonScanner parseDictionaryWithMaxDepth:](v3, "parseDictionaryWithMaxDepth:", 10000);

  return v4;
}

@end
