@implementation NSString(TCStringAdditions)

- (BOOL)tc_startsWithString:()TCStringAdditions
{
  uint64_t v1;
  uint64_t v2;

  v1 = objc_msgSend(a1, "rangeOfString:");
  return v2 && v1 == 0;
}

- (BOOL)tc_doesURLHostContainWhitespace
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a1);
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v1, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)nulTerminatedUTF8
{
  return objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
}

+ (uint64_t)tc_fixUnpairedSurrogateCharactersInBuffer:()TCStringAdditions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  int v9;
  uint64_t v10;

  v3 = *a3;
  v4 = a3[1];
  v5 = v4 - *a3;
  if (v4 != *a3)
  {
    v6 = 0;
    v7 = 0;
    v8 = v5 >> 1;
    while (1)
    {
      v9 = *(_WORD *)(v3 + 2 * v6) & 0xFC00;
      if (v9 == 56320)
        goto LABEL_7;
      if (v9 == 55296)
        break;
LABEL_8:
      v10 = v6;
LABEL_9:
      v6 = v10 + 1;
      if (v10 + 1 >= v8)
        return v7 & 1;
    }
    v10 = v6 + 1;
    if (v6 + 1 < v8 && (*(_WORD *)(v3 + 2 * v10) & 0xFC00) == 0xDC00)
      goto LABEL_9;
LABEL_7:
    *(_WORD *)(v3 + 2 * v6) = 9633;
    v7 = 1;
    goto LABEL_8;
  }
  v7 = 0;
  return v7 & 1;
}

+ (id)tc_stringByFixingUnpairedSurrogateCharactersInString:()TCStringAdditions
{
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *__p[3];

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  std::vector<unsigned short>::vector(__p, v5);
  objc_msgSend(v4, "getCharacters:", __p[0]);
  v6 = objc_msgSend(a1, "tc_fixUnpairedSurrogateCharactersInBuffer:", __p);
  v7 = v4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", __p[0], v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v7;
}

@end
