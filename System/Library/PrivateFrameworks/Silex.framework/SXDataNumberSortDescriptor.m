@implementation SXDataNumberSortDescriptor

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;

  v6 = a4;
  v7 = a3;
  -[SXDataNumberSortDescriptor key](self, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataNumberSortDescriptor numberForObject:](self, "numberForObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataNumberSortDescriptor key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataNumberSortDescriptor numberForObject:](self, "numberForObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v13)
    {
      if ((-[SXDataNumberSortDescriptor ascending](self, "ascending") & 1) != 0)
      {
        v14 = v10;
        v15 = v13;
      }
      else
      {
        v14 = v13;
        v15 = v10;
      }
      v16 = objc_msgSend(v14, "compare:", v15);
    }
    else
    {
      v16 = -1;
    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (id)numberForObject:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
