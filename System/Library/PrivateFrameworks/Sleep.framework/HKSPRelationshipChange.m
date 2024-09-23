@implementation HKSPRelationshipChange

- (BOOL)isAdd
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HKSPChange changedValue](self, "changedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKSPChange originalValue](self, "originalValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isUpdate
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HKSPChange changedValue](self, "changedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKSPChange originalValue](self, "originalValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isRemove
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HKSPChange changedValue](self, "changedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[HKSPChange originalValue](self, "originalValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)deepCopy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc((Class)objc_opt_class());
  -[HKSPChange property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[HKSPChange changedValue](self, "changedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HKSPChange originalValue](self, "originalValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", 0);
  v10 = (void *)objc_msgSend(v3, "initWithProperty:changedValue:originalValue:", v5, v7, v9);

  return v10;
}

@end
