@implementation NSArray(IMAdditions)

- (uint64_t)pf_indexOfObjectWithValue:()IMAdditions forKeyPath:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "count");
  v9 = v8;
  if (v8 < 1)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    v11 = v8;
    do
    {
      v12 = v11 - v10;
      if (v11 < v10)
        ++v12;
      v13 = v10 + (v12 >> 1);
      objc_msgSend(a1, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForKeyPath:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "compare:", v6) == -1)
        v10 = v13 + 1;
      else
        v11 = v13;

    }
    while (v10 < v11);
  }
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 < v9)
  {
    objc_msgSend(a1, "objectAtIndex:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKeyPath:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "compare:", v6);

    if (!v19)
      v16 = v10;
  }

  return v16;
}

@end
