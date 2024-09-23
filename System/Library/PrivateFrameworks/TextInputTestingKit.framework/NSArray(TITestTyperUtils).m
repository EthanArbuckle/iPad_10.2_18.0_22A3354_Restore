@implementation NSArray(TITestTyperUtils)

- (id)arrayInterspersingSpaceStringsBetweenObjects
{
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2 * objc_msgSend(a1, "count") - 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "count"))
    {
      v3 = 0;
      do
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v4);

        if (v3 < objc_msgSend(a1, "count") - 1)
          objc_msgSend(v2, "addObject:", CFSTR(" "));
        ++v3;
      }
      while (v3 < objc_msgSend(a1, "count"));
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a1;
  }
  return v5;
}

@end
