@implementation OISFUJson

+ (id)stringFromObject:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = v4;
  if (a3)
    objc_msgSend(a3, "sfu_appendJsonStringToString:", v4);
  else
    objc_msgSend(v4, "appendString:", CFSTR("null"));
  return v5;
}

+ (id)objectFromString:(id)a3
{
  OISFUJsonScanner *v3;
  id v4;

  v3 = -[OISFUJsonScanner initWithString:]([OISFUJsonScanner alloc], "initWithString:", a3);
  -[OISFUJsonScanner skipWhitespace](v3, "skipWhitespace");
  v4 = -[OISFUJsonScanner parseObjectWithMaxDepth:](v3, "parseObjectWithMaxDepth:", 10000);

  return v4;
}

+ (id)arrayFromString:(id)a3
{
  OISFUJsonScanner *v3;
  id v4;

  v3 = -[OISFUJsonScanner initWithString:]([OISFUJsonScanner alloc], "initWithString:", a3);
  -[OISFUJsonScanner skipWhitespace](v3, "skipWhitespace");
  v4 = -[OISFUJsonScanner parseArrayWithMaxDepth:](v3, "parseArrayWithMaxDepth:", 10000);

  return v4;
}

+ (id)dictionaryFromString:(id)a3
{
  OISFUJsonScanner *v3;
  id v4;

  v3 = -[OISFUJsonScanner initWithString:]([OISFUJsonScanner alloc], "initWithString:", a3);
  -[OISFUJsonScanner skipWhitespace](v3, "skipWhitespace");
  v4 = -[OISFUJsonScanner parseDictionaryWithMaxDepth:](v3, "parseDictionaryWithMaxDepth:", 10000);

  return v4;
}

@end
