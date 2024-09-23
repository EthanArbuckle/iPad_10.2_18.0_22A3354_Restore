@implementation NSArray(PhotosUIFoundation)

- (id)px_subarrayAfterIndex:()PhotosUIFoundation
{
  uint64_t v4;
  void *v5;

  v4 = a3 + 1;
  if (a3 + 1 >= (unint64_t)objc_msgSend(a1, "count"))
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", v4, objc_msgSend(a1, "count") - v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)px_enumerateObjectsFromIndex:()PhotosUIFoundation usingBlock:
{
  void (**v6)(id, void *, unint64_t, _BYTE *);
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  char v11;

  v6 = a4;
  v11 = 0;
  v7 = objc_msgSend(a1, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 1;
    do
    {
      if (a3 >= v8)
        a3 = 0;
      objc_msgSend(a1, "objectAtIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v10, a3, &v11);

      if (v9 >= v8)
        break;
      ++a3;
      ++v9;
    }
    while (!v11);
  }

}

- (id)px_objectAfterObject:()PhotosUIFoundation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(a1, "indexOfObject:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || (v3 = v2 + 1, v2 + 1 >= (unint64_t)objc_msgSend(a1, "count")))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)px_numbersFrom:()PhotosUIFoundation to:increment:
{
  id i;
  void *v7;

  for (i = objc_alloc_init(MEMORY[0x24BDBCEB8]); a1 <= a2; a1 = round((a1 + a3) / a3) * a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v7);

  }
  return i;
}

+ (uint64_t)px_integersFrom:()PhotosUIFoundation to:
{
  return objc_msgSend(a1, "px_numbersFrom:to:increment:", (double)a3, (double)a4, 1.0);
}

@end
