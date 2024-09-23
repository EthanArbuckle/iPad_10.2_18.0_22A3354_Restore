@implementation NSString(SFUJsonAdditions)

- (uint64_t)appendJsonStringToString:()SFUJsonAdditions
{
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  int v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  __int16 v14;

  if (appendJsonStringToString__onceToken != -1)
    dispatch_once(&appendJsonStringToString__onceToken, &__block_literal_global_5);
  objc_msgSend(a3, "appendString:", CFSTR("\"));
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:", appendJsonStringToString__escapeCharacters) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(a1, "length");
    v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    objc_msgSend(a1, "getCharacters:", v6);
    if (!v5)
    {
LABEL_28:
      free(v6);
      return objc_msgSend(a3, "appendString:", CFSTR("\"));
    }
    v7 = v6;
    while (1)
    {
      v9 = *v7++;
      v8 = v9;
      v14 = v9;
      if (v9 <= 33)
      {
        switch((int)v8)
        {
          case 8:
            v10 = a3;
            v11 = CFSTR("\\b");
            break;
          case 9:
            v10 = a3;
            v11 = CFSTR("\\t");
            break;
          case 10:
            v10 = a3;
            v11 = CFSTR("\\n");
            break;
          case 12:
            v10 = a3;
            v11 = CFSTR("\\f");
            break;
          case 13:
            v10 = a3;
            v11 = CFSTR("\\r");
            break;
          default:
            goto LABEL_23;
        }
        goto LABEL_27;
      }
      if ((int)v8 > 8231)
      {
        if ((_DWORD)v8 == 8232)
        {
          v10 = a3;
          v11 = CFSTR("\\u2028");
        }
        else
        {
          if ((_DWORD)v8 != 8233)
          {
LABEL_23:
            if (v8 < 0x20)
              v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\\u%.4x"), v8);
            else
              v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v14, 1);
            v11 = (const __CFString *)v12;
            v10 = a3;
            goto LABEL_27;
          }
          v10 = a3;
          v11 = CFSTR("\\u2029");
        }
      }
      else if ((_DWORD)v8 == 34)
      {
        v10 = a3;
        v11 = CFSTR("\\\");
      }
      else
      {
        if ((_DWORD)v8 != 92)
          goto LABEL_23;
        v10 = a3;
        v11 = CFSTR("\\\\");
      }
LABEL_27:
      objc_msgSend(v10, "appendString:", v11);
      if (!--v5)
        goto LABEL_28;
    }
  }
  objc_msgSend(a3, "appendString:", a1);
  return objc_msgSend(a3, "appendString:", CFSTR("\"));
}

@end
