@implementation EDTableStylesCollection

- (void)setDefaultTableStyleName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->mDefaultTableStyleName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mDefaultTableStyleName, a3);
    v5 = v6;
  }

}

- (void)setDefaultPivotStyleName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->mDefaultPivotStyleName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mDefaultPivotStyleName, a3);
    v5 = v6;
  }

}

- (id)objectWithName:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4 && (v5 = -[EDCollection count](self, "count")) != 0)
  {
    v6 = 0;
    while (1)
    {
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        if ((objc_msgSend(v8, "isEqualToString:", v4) & 1) != 0)
          break;
      }

      if (v5 == ++v6)
        goto LABEL_7;
    }

  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

- (id)defaultTableStyle
{
  return -[EDTableStylesCollection objectWithName:](self, "objectWithName:", self->mDefaultTableStyleName);
}

- (id)defaultPivotStyle
{
  return -[EDTableStylesCollection objectWithName:](self, "objectWithName:", self->mDefaultPivotStyleName);
}

- (id)defaultTableStyleName
{
  return self->mDefaultTableStyleName;
}

- (id)defaultPivotStyleName
{
  return self->mDefaultPivotStyleName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultPivotStyleName, 0);
  objc_storeStrong((id *)&self->mDefaultTableStyleName, 0);
}

@end
