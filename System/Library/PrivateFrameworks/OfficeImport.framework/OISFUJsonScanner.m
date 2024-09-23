@implementation OISFUJsonScanner

- (OISFUJsonScanner)initWithString:(id)a3
{
  OISFUJsonScanner *v4;
  uint64_t v5;
  unsigned __int16 *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OISFUJsonScanner;
  v4 = -[OISFUJsonScanner init](&v8, sel_init);
  if (v4)
  {
    v4->mString = (NSString *)a3;
    v5 = objc_msgSend(a3, "length");
    v4->mLength = v5;
    v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    v4->mCharacters = v6;
    objc_msgSend(a3, "getCharacters:", v6);
    v4->mWhitespaceCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v4->mDecimalDigitCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->mCharacters);
  v3.receiver = self;
  v3.super_class = (Class)OISFUJsonScanner;
  -[OISFUJsonScanner dealloc](&v3, sel_dealloc);
}

- (unsigned)nextCharacter
{
  unint64_t mOffset;
  unsigned __int16 *mCharacters;

  mOffset = self->mOffset;
  if (mOffset >= self->mLength)
    return 0;
  mCharacters = self->mCharacters;
  self->mOffset = mOffset + 1;
  return mCharacters[mOffset];
}

- (void)skipWhitespace
{
  unint64_t mOffset;
  unint64_t mLength;

  mOffset = self->mOffset;
  if (mOffset < self->mLength)
  {
    do
    {
      if (!-[NSCharacterSet characterIsMember:](self->mWhitespaceCharacterSet, "characterIsMember:", self->mCharacters[mOffset]))break;
      mLength = self->mLength;
      mOffset = self->mOffset + 1;
      self->mOffset = mOffset;
    }
    while (mOffset < mLength);
  }
}

- (id)parseHexCharacter
{
  __int16 v3;
  uint64_t v4;
  int v5;
  __int16 v6;
  __int16 v8;

  v3 = 0;
  v4 = 4;
  while (1)
  {
    v5 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
    v6 = v5 - 48;
    if ((v5 - 48) >= 0xA)
      break;
LABEL_7:
    v3 = (16 * v3) | v6;
    if (!--v4)
    {
      v8 = v3;
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v8, 1);
    }
  }
  if ((v5 - 97) <= 5)
  {
    v6 = v5 - 87;
    goto LABEL_7;
  }
  if ((v5 - 65) <= 5)
  {
    v6 = v5 - 55;
    goto LABEL_7;
  }
  return 0;
}

- (void)appendCharactersInRange:(_NSRange)a3 toString:(id)a4
{
  id v5;

  if (a3.length)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", &self->mCharacters[a3.location], a3.length, 0);
    objc_msgSend(a4, "appendString:", v5);

  }
}

- (id)parseString
{
  unint64_t mOffset;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  id result;
  int v9;
  const __CFString *v10;

  if (-[OISFUJsonScanner nextCharacter](self, "nextCharacter") != 34)
    return 0;
  mOffset = self->mOffset;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  while (2)
  {
    v5 = 0;
    while (1)
    {
      v6 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
      if (v6 == 34)
      {
        -[OISFUJsonScanner appendCharactersInRange:toString:](self, "appendCharactersInRange:toString:", mOffset, v5, v4);
        return v4;
      }
      v7 = v6;
      if (v6 == 92)
        break;
      result = 0;
      if (v7 >= 0x20)
      {
        ++v5;
        if (v7 - 127 >= 0x21)
          continue;
      }
      return result;
    }
    -[OISFUJsonScanner appendCharactersInRange:toString:](self, "appendCharactersInRange:toString:", mOffset, v5, v4);
    v9 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
    result = 0;
    if (v9 > 97)
    {
      switch(v9)
      {
        case 'n':
          v10 = CFSTR("\n");
          goto LABEL_26;
        case 'o':
        case 'p':
        case 'q':
        case 's':
          return result;
        case 'r':
          v10 = CFSTR("\r");
          goto LABEL_26;
        case 't':
          v10 = CFSTR("\t");
          goto LABEL_26;
        case 'u':
          result = -[OISFUJsonScanner parseHexCharacter](self, "parseHexCharacter");
          v10 = (const __CFString *)result;
          if (result)
            goto LABEL_26;
          return result;
        default:
          if (v9 == 98)
          {
            v10 = CFSTR("\b");
          }
          else
          {
            if (v9 != 102)
              return result;
            v10 = CFSTR("\f");
          }
          break;
      }
      goto LABEL_26;
    }
    switch(v9)
    {
      case '"':
        v10 = CFSTR("\");
LABEL_26:
        objc_msgSend(v4, "appendString:", v10);
        mOffset = self->mOffset;
        continue;
      case '/':
        v10 = CFSTR("/");
        goto LABEL_26;
      case '\\':
        v10 = CFSTR("\\");
        goto LABEL_26;
    }
  }
  return result;
}

- (id)parseDictionaryWithMaxDepth:(int)a3
{
  int v5;
  id result;
  BOOL v7;
  uint64_t v8;
  unint64_t mOffset;
  void *v10;
  id v11;
  int v12;

  v5 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
  result = 0;
  v7 = __OFSUB__(a3, 1);
  v8 = (a3 - 1);
  if ((int)v8 < 0 == v7 && v5 == 123)
  {
    -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
    mOffset = self->mOffset;
    if (mOffset < self->mLength && self->mCharacters[mOffset] == 125)
    {
      self->mOffset = mOffset + 1;
      return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    }
    else
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      result = -[OISFUJsonScanner parseString](self, "parseString");
      if (result)
      {
        v11 = result;
        while (1)
        {
          -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
          if (-[OISFUJsonScanner nextCharacter](self, "nextCharacter") != 58)
            return 0;
          -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
          result = -[OISFUJsonScanner parseObjectWithMaxDepth:](self, "parseObjectWithMaxDepth:", v8);
          if (!result)
            return result;
          objc_msgSend(v10, "setObject:forKey:", result, v11);
          -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
          v12 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
          if (v12 != 44)
            break;
          -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
          result = -[OISFUJsonScanner parseString](self, "parseString");
          v11 = result;
          if (!result)
            return result;
        }
        if (v12 == 125)
          return v10;
        else
          return 0;
      }
    }
  }
  return result;
}

- (id)parseArrayWithMaxDepth:(int)a3
{
  int v5;
  id result;
  BOOL v7;
  uint64_t v8;
  unint64_t mOffset;
  void *v10;
  id v11;
  int v12;

  v5 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
  result = 0;
  v7 = __OFSUB__(a3, 1);
  v8 = (a3 - 1);
  if ((int)v8 < 0 == v7 && v5 == 91)
  {
    -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
    mOffset = self->mOffset;
    if (mOffset < self->mLength && self->mCharacters[mOffset] == 93)
    {
      self->mOffset = mOffset + 1;
      return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
    }
    else
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      result = -[OISFUJsonScanner parseObjectWithMaxDepth:](self, "parseObjectWithMaxDepth:", v8);
      if (result)
      {
        v11 = result;
        while (1)
        {
          objc_msgSend(v10, "addObject:", v11);
          -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
          v12 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
          if (v12 != 44)
            break;
          -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
          result = -[OISFUJsonScanner parseObjectWithMaxDepth:](self, "parseObjectWithMaxDepth:", v8);
          v11 = result;
          if (!result)
            return result;
        }
        if (v12 == 93)
          return v10;
        else
          return 0;
      }
    }
  }
  return result;
}

- (BOOL)parseConstantString:(const char *)a3
{
  const char *v4;
  BOOL result;

  if (!*a3)
    return 1;
  v4 = a3 + 1;
  do
  {
    result = -[OISFUJsonScanner nextCharacter](self, "nextCharacter") == *(v4 - 1);
    if (!result)
      break;
  }
  while (*(unsigned __int8 *)v4++);
  return result;
}

- (id)parseNull
{
  if (-[OISFUJsonScanner parseConstantString:](self, "parseConstantString:", "null"))
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  else
    return 0;
}

- (id)parseTrue
{
  if (-[OISFUJsonScanner parseConstantString:](self, "parseConstantString:", "true"))
    return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  else
    return 0;
}

- (id)parseFalse
{
  if (-[OISFUJsonScanner parseConstantString:](self, "parseConstantString:", "false"))
    return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  else
    return 0;
}

- (id)parseNumber
{
  unint64_t mOffset;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  mOffset = self->mOffset;
  v4 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
  if ((_DWORD)v4 == 45)
    v4 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter", v4);
  if (-[NSCharacterSet characterIsMember:](self->mDecimalDigitCharacterSet, "characterIsMember:", v4))
  {
    do
    {
      v5 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
      if (!(_DWORD)v5)
        goto LABEL_17;
      v6 = v5;
    }
    while (-[NSCharacterSet characterIsMember:](self->mDecimalDigitCharacterSet, "characterIsMember:", v5));
    if (v6 == 46)
    {
      if (!-[NSCharacterSet characterIsMember:](self->mDecimalDigitCharacterSet, "characterIsMember:", -[OISFUJsonScanner nextCharacter](self, "nextCharacter")))return 0;
      do
      {
        v7 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
        if (!(_DWORD)v7)
          goto LABEL_17;
        v6 = v7;
      }
      while (-[NSCharacterSet characterIsMember:](self->mDecimalDigitCharacterSet, "characterIsMember:", v7));
    }
    if ((v6 & 0xFFFFFFDF) != 0x45)
    {
LABEL_17:
      --self->mOffset;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", &self->mCharacters[mOffset], self->mOffset - mOffset, 0);
      v12 = (void *)objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:locale:", v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("."), *MEMORY[0x24BDBCB00]));

      return v12;
    }
    v8 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
    if ((_DWORD)v8 == 45 || (v9 = v8, (_DWORD)v8 == 43))
      v9 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
    if (-[NSCharacterSet characterIsMember:](self->mDecimalDigitCharacterSet, "characterIsMember:", v9))
    {
      do
        v10 = -[OISFUJsonScanner nextCharacter](self, "nextCharacter");
      while ((_DWORD)v10
           && -[NSCharacterSet characterIsMember:](self->mDecimalDigitCharacterSet, "characterIsMember:", v10));
      goto LABEL_17;
    }
  }
  return 0;
}

- (id)parseObjectWithMaxDepth:(int)a3
{
  uint64_t v5;
  unsigned int v6;

  -[OISFUJsonScanner skipWhitespace](self, "skipWhitespace");
  v5 = (a3 - 1);
  if (a3 < 1)
    return 0;
  v6 = self->mCharacters[self->mOffset];
  if (v6 > 0x6D)
  {
    switch(v6)
    {
      case 'n':
        return -[OISFUJsonScanner parseNull](self, "parseNull", v5);
      case 't':
        return -[OISFUJsonScanner parseTrue](self, "parseTrue", v5);
      case '{':
        return -[OISFUJsonScanner parseDictionaryWithMaxDepth:](self, "parseDictionaryWithMaxDepth:", v5);
    }
  }
  else
  {
    switch(v6)
    {
      case '"':
        return -[OISFUJsonScanner parseString](self, "parseString", v5);
      case '[':
        return -[OISFUJsonScanner parseArrayWithMaxDepth:](self, "parseArrayWithMaxDepth:", v5);
      case 'f':
        return -[OISFUJsonScanner parseFalse](self, "parseFalse", v5);
    }
  }
  return -[OISFUJsonScanner parseNumber](self, "parseNumber", v5);
}

@end
