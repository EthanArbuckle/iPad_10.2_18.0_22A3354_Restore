@implementation TTSUnicodeUtils

+ (unsigned)codePointToUtf8ByteSize:(unsigned int)a3
{
  char v3;
  unsigned __int8 v4;

  if (a3 < 0x10000)
    v3 = 3;
  else
    v3 = 4;
  if (a3 >= 0x800)
    v4 = v3;
  else
    v4 = 2;
  if (a3 >= 0x80)
    return v4;
  else
    return 1;
}

+ (_NSRange)utf8RangeFromUTF16Range:(_NSRange)a3 chars:(const unsigned __int16 *)a4 size:(unint64_t)a5
{
  NSUInteger location;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  location = a3.location;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = a3.location + a3.length;
  do
  {
    if (v9 >= a5)
      break;
    v12 = a4[v9];
    if ((v12 & 0xFC00) == 0xD800)
    {
      v12 = ((a4[v9 + 1] - 56320) | (((_DWORD)v12 << 10) - 56623104)) + 0x10000;
      v13 = 2;
    }
    else
    {
      v13 = 1;
    }
    v14 = (void *)objc_opt_class();
    v18 = objc_msgSend_codePointToUtf8ByteSize_(v14, v15, v12, v16, v17);
    if (v9 == location)
      v8 = v10;
    if (v9 == v11)
    {
      v19 = v10 - v8;
      goto LABEL_14;
    }
    v9 += v13;
    v10 += v18;
  }
  while (v9 <= v11);
  if (v9 == v11)
  {
    v19 = v10 - v8;
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = 0;
  }
LABEL_14:
  v20 = v8;
  result.length = v19;
  result.location = v20;
  return result;
}

+ (_NSRange)utf16RangeFromUTF8Range:(_NSRange)a3 chars:(const char *)a4 size:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  _NSRange result;

  length = a3.length;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      v7 = 0;
      v8 = 0;
      v6 = 0;
      length = 0;
      while (1)
      {
        v9 = a4[v8];
        if (v9 < 0)
        {
          if ((v9 & 0xE0) == 0xC0)
          {
            v10 = 1;
            v11 = 2;
          }
          else if ((v9 & 0xF0) == 0xE0)
          {
            v10 = 1;
            v11 = 3;
          }
          else
          {
            if ((v9 & 0xF8) != 0xF0)
              break;
            v10 = 2;
            v11 = 4;
          }
        }
        else
        {
          v10 = 1;
          v11 = 1;
        }
        v12 = v11 + v8;
        if (v12 > a5)
          break;
        if (v8 == a3.location)
          v6 = v7;
        if (v8 < a3.location + a3.length && v8 >= a3.location)
          v14 = v10;
        else
          v14 = 0;
        length += v14;
        v7 += v10;
        v8 = v12;
        if (v12 >= a5)
          goto LABEL_25;
      }
      length = 0;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v6 = 0;
      length = 0;
    }
  }
LABEL_25:
  result.length = length;
  result.location = v6;
  return result;
}

@end
