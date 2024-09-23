@implementation NSString(TSUNSStringPathExtensions)

- (uint64_t)tsu_rangeOfString:()TSUNSStringPathExtensions options:updatingSearchRange:
{
  char v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v5 = a4;
  if (!a5)
    return objc_msgSend(a1, "rangeOfString:options:range:", a3, a4, 0, objc_msgSend(a3, "length"));
  v7 = *a5;
  v8 = a5[1];
  result = objc_msgSend(a1, "rangeOfString:options:range:", a3, a4, *a5, v8);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_OWORD *)a5 = NSInvalidRange;
  }
  else if ((v5 & 4) != 0)
  {
    *a5 = v7;
    a5[1] = result - v7;
  }
  else
  {
    *a5 = result + v10;
    a5[1] = v8 + v7 - (result + v10);
  }
  return result;
}

- (uint64_t)tsu_range
{
  objc_msgSend(a1, "length");
  return 0;
}

- (void)tsu_enumerateRangesOfCharactersInSet:()TSUNSStringPathExtensions usingBlock:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  objc_msgSend(v6, "setCaseSensitive:", 1);
  objc_msgSend(v6, "setCharactersToBeSkipped:", 0);
  if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
  {
    do
    {
      v7 = objc_msgSend(v6, "scanLocation");
      if (objc_msgSend(v6, "scanCharactersFromSet:intoString:", a3, 0))
      {
        v8 = objc_msgSend(v6, "scanLocation");
        v9 = 0;
        (*(void (**)(uint64_t, uint64_t, uint64_t, char *))(a4 + 16))(a4, v7, v8 - v7, &v9);
        if (v9)
          break;
      }
      if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
        objc_msgSend(v6, "scanUpToCharactersFromSet:intoString:", a3, 0);
    }
    while (!objc_msgSend(v6, "isAtEnd"));
  }

}

- (BOOL)tsu_containsSubstring:()TSUNSStringPathExtensions
{
  return objc_msgSend(a1, "rangeOfString:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tsu_pathToRelativeComponentPath:()TSUNSStringPathExtensions
{
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  if (a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_msgSend(a3, "pathComponents");
    v7 = objc_msgSend(v6, "count");
    v8 = objc_alloc_init(MEMORY[0x24BDD1460]);
    if (v7)
    {
      v9 = 0;
      v10 = v7;
      while (1)
      {
        v11 = v10 - 1;
        if (objc_msgSend(v5, "fileExistsAtPath:", objc_msgSend(a1, "stringByAppendingPathComponent:", objc_msgSend(v6, "objectAtIndex:", v10 - 1))))
        {
          v12 = a1;
          if (v11 < v7)
          {
            v13 = -1;
            v12 = a1;
            do
              v12 = (void *)objc_msgSend(v12, "stringByAppendingPathComponent:", objc_msgSend(v6, "objectAtIndex:", v10 + v13++));
            while (v9 != v13);
          }
          if (objc_msgSend(v5, "fileExistsAtPath:", v12))
            break;
        }
        ++v9;
        --v10;
        if (!v11)
          goto LABEL_10;
      }
      v14 = v12;
    }
    else
    {
LABEL_10:
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (BOOL)tsu_isPathCreatedByAppendingPathComponent:()TSUNSStringPathExtensions insideBasePath:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;

  v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v8 = (void *)objc_msgSend(a1, "stringByStandardizingPath");
  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "stringByAppendingPathComponent:", a3), "stringByStandardizingPath"), "pathComponents");
  if (a1 != a4)
    v8 = (void *)objc_msgSend(a4, "stringByStandardizingPath");
  v10 = (void *)objc_msgSend(v8, "pathComponents");
  v11 = objc_msgSend(v9, "count");
  v12 = objc_msgSend(v10, "count");
  if (v12 <= v11)
  {
    v14 = 0;
    v15 = v12;
    if (v12)
    {
      v16 = 1;
      do
      {
        if ((objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v14), "isEqualToString:", objc_msgSend(v9, "objectAtIndex:", v14)) & 1) == 0)break;
        v14 = v16;
      }
      while (v15 > v16++);
    }
    v13 = v15 == v14;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
