@implementation PUGroupValueFilter

- (void)setInputValue:(double)a3
{
  void *v4;
  id v5;

  -[PUGroupValueFilter filters](self, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInputValue:", a3);
}

- (double)outputValue
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;

  -[PUGroupValueFilter filters](self, "filters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputValue");
  v6 = v5;
  objc_msgSend(v3, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_msgSend(v8, "setInputValue:", v6);
      objc_msgSend(v8, "outputValue");
      v6 = v9;
      objc_msgSend(v3, "nextObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    while (v10);
  }

  return v6;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

@end
