@implementation PDBuildMapKey

- (PDBuildMapKey)initWithDrawable:(id)a3 groupId:(id)a4
{
  id v6;
  id v7;
  PDBuildMapKey *v8;
  uint64_t v9;
  NSValue *mDrawableValue;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDBuildMapKey;
  v8 = -[PDBuildMapKey init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    mDrawableValue = v8->mDrawableValue;
    v8->mDrawableValue = (NSValue *)v9;

    objc_storeStrong((id *)&v8->mGroupId, a4);
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;

  v3 = -[NSValue pointerValue](self->mDrawableValue, "pointerValue");
  return (unint64_t)v3 + -[NSString intValue](self->mGroupId, "intValue");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSString *mGroupId;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PDBuildMapKey drawable](self, "drawable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "drawable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
LABEL_3:
      v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    if (self->mGroupId)
    {
      objc_msgSend(v5, "groupId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      mGroupId = self->mGroupId;
      if (v9)
      {
        objc_msgSend(v5, "groupId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NSString isEqualToString:](mGroupId, "isEqualToString:", v11);
LABEL_10:

        goto LABEL_11;
      }
      if (mGroupId)
        goto LABEL_3;
    }
    objc_msgSend(v5, "groupId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11 == 0;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)drawable
{
  return -[NSValue nonretainedObjectValue](self->mDrawableValue, "nonretainedObjectValue");
}

- (id)groupId
{
  return self->mGroupId;
}

- (PDBuildMapKey)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDBuildMapKey;
  return -[PDBuildMapKey init](&v3, sel_init);
}

- (void)setDrawable:(id)a3
{
  NSValue *v4;
  NSValue *mDrawableValue;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:");
  v4 = (NSValue *)objc_claimAutoreleasedReturnValue();
  mDrawableValue = self->mDrawableValue;
  self->mDrawableValue = v4;

}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->mGroupId, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDBuildMapKey;
  -[PDBuildMapKey description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGroupId, 0);
  objc_storeStrong((id *)&self->mDrawableValue, 0);
}

@end
