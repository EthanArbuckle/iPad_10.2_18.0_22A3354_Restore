@implementation EDCollectionWithPointerEquality

- (BOOL)isEqualToCollection:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t i;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[EDCollection count](self, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    if (v5)
    {
      v6 = 0;
      for (i = 0; i != v5; v6 = i >= v5)
      {
        -[EDCollection objectAtIndex:](self, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
          break;
        ++i;
      }
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
