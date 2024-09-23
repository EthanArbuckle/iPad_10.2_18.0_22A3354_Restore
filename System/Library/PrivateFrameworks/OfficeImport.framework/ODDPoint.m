@implementation ODDPoint

- (ODDPoint)init
{
  ODDPoint *v2;
  ODDPointPropertySet *v3;
  ODDPointPropertySet *mPropertySet;
  OADShapeProperties *v5;
  OADShapeProperties *mShapeProperties;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ODDPoint;
  v2 = -[ODDPoint init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ODDPointPropertySet);
    mPropertySet = v2->mPropertySet;
    v2->mPropertySet = v3;

    v5 = objc_alloc_init(OADShapeProperties);
    mShapeProperties = v2->mShapeProperties;
    v2->mShapeProperties = v5;

  }
  return v2;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)shapeProperties
{
  return self->mShapeProperties;
}

- (id)propertySet
{
  return self->mPropertySet;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->mText, a3);
}

+ (void)addConnectionToPoint:(id)a3 order:(unint64_t)a4 array:(id *)a5
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = *a5;
  if (!*a5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    *a5 = v7;
  }
  v8 = objc_msgSend(v7, "count");
  v9 = a4 - v8;
  if (a4 > v8)
  {
    do
    {
      v10 = *a5;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      --v9;
    }
    while (v9);
  }
  v12 = objc_msgSend(*a5, "count");
  v13 = *a5;
  if (v12 == a4)
  {
    objc_msgSend(v13, "addObject:", v16);
  }
  else
  {
    objc_msgSend(v13, "objectAtIndex:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
      objc_msgSend(*a5, "replaceObjectAtIndex:withObject:", a4, v16);
    else
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Point already has a connection at the given order"));
  }

}

- (int)type
{
  return self->mType;
}

- (id)text
{
  return self->mText;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDPoint;
  -[ODDPoint description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mShapeProperties, 0);
  objc_storeStrong((id *)&self->mPropertySet, 0);
}

@end
