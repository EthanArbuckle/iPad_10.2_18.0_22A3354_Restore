@implementation NSIndexPath(SCRCIndexPathExtras)

- (uint64_t)initWithString:()SCRCIndexPathExtras
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("["), &stru_24CB26880);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("]"), &stru_24CB26880);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8[i] = objc_msgSend(v10, "integerValue");

    }
  }
  v11 = objc_msgSend(a1, "initWithIndexes:length:", v8, v7);
  free(v8);

  return v11;
}

- (id)stringValue
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("["));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      v6 = objc_msgSend(a1, "indexAtPosition:", i);
      if (objc_msgSend(v2, "length") == 1)
        v7 = CFSTR("%i");
      else
        v7 = CFSTR(".%i");
      objc_msgSend(v2, "appendFormat:", v7, v6);
    }
  }
  objc_msgSend(v2, "appendString:", CFSTR("]"));
  return v2;
}

- (id)indexPathByInsertingFirstIndex:()SCRCIndexPathExtras
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathByConcatenatingIndexPath:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)indexPathByConcatenatingIndexPath:()SCRCIndexPathExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    v13 = a1;
LABEL_6:
    v12 = v13;
    goto LABEL_7;
  }
  if (!objc_msgSend(a1, "length"))
  {
    v13 = v4;
    goto LABEL_6;
  }
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(a1, "length");
  v7 = 8 * v5;
  v8 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
  objc_msgSend(v4, "getIndexes:", v8);
  v9 = malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
  objc_msgSend(a1, "getIndexes:", v9);
  v10 = v6 + v5;
  v11 = (char *)malloc_type_malloc(8 * (v6 + v5), 0x100004000313F17uLL);
  memcpy(v11, v9, 8 * v6);
  memcpy(&v11[8 * v6], v8, v7);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15D8]), "initWithIndexes:length:", v11, v10);
  free(v8);
  free(v9);
  free(v11);
LABEL_7:

  return v12;
}

@end
