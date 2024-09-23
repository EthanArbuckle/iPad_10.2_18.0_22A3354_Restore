@implementation EDTableStyle

+ (id)tableStyle
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDTableStyle)init
{
  EDTableStyle *v2;
  EDKeyedCollection *v3;
  EDKeyedCollection *mTableStyleElements;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDTableStyle;
  v2 = -[EDTableStyle init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(EDKeyedCollection);
    mTableStyleElements = v2->mTableStyleElements;
    v2->mTableStyleElements = v3;

  }
  return v2;
}

- (void)setName:(id)a3
{
  NSString *v5;
  NSString **p_mName;
  NSString *mName;
  NSString *v8;

  v5 = (NSString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }

}

- (id)tableStyleElements
{
  return self->mTableStyleElements;
}

- (id)name
{
  return self->mName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[NSString copy](self->mName, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = -[EDKeyedCollection copy](self->mTableStyleElements, "copy");
    v8 = (void *)v4[2];
    v4[2] = v7;

    v9 = v4;
  }

  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTableStyle;
  -[EDTableStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTableStyleElements, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end
