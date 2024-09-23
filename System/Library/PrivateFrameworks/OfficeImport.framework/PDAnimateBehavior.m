@implementation PDAnimateBehavior

- (PDAnimateBehavior)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimateBehavior;
  return -[PDTimeNode init](&v3, sel_init);
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->mTgtElement, a3);
}

- (id)target
{
  return self->mTgtElement;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PDAnimationTarget *mTgtElement;
  void *v9;
  _BOOL4 v10;
  PDAnimationTarget *v11;
  void *v12;
  char v13;
  char v14;
  NSMutableArray *mAttributeNames;
  void *v16;
  objc_super v18;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    mTgtElement = self->mTgtElement;
    objc_msgSend(v6, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if ((mTgtElement != 0) == v10)
    {
      v14 = 0;
    }
    else
    {
      v11 = self->mTgtElement;
      if (v11)
      {
        objc_msgSend(v7, "target");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PDAnimationTarget isEqual:](v11, "isEqual:", v12);

        if (self->mTgtElement)
          v14 = v13;
        else
          v14 = 1;
      }
      else
      {
        v14 = 1;
      }
    }
    mAttributeNames = self->mAttributeNames;
    objc_msgSend(v7, "attributeNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(mAttributeNames) = v14 | -[NSMutableArray isEqualToArray:](mAttributeNames, "isEqualToArray:", v16);

    if ((mAttributeNames & 1) != 0)
    {
      v18.receiver = self;
      v18.super_class = (Class)PDAnimateBehavior;
      LOBYTE(v7) = -[PDTimeNode isEqual:](&v18, sel_isEqual_, v4);
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return (char)v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[PDAnimationTarget hash](self->mTgtElement, "hash");
  return -[NSMutableArray count](self->mAttributeNames, "count") ^ v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimateBehavior;
  -[PDTimeNode description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableArray)attributeNames
{
  return self->mAttributeNames;
}

- (void)setAttributeNames:(id)a3
{
  objc_storeStrong((id *)&self->mAttributeNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAttributeNames, 0);
  objc_storeStrong((id *)&self->mTgtElement, 0);
}

@end
