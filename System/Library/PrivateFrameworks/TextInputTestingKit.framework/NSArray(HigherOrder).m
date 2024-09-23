@implementation NSArray(HigherOrder)

- (id)filterWithBlock:()HigherOrder
{
  uint64_t (**v4)(id, void *);
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v4[2](v4, v7);

      if (v8)
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

      }
      ++v6;
    }
    while (objc_msgSend(a1, "count") > v6);
  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

@end
