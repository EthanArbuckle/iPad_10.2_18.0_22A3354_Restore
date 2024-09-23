@implementation ODDChoose

- (ODDChoose)init
{
  ODDChoose *v2;
  NSMutableArray *v3;
  NSMutableArray *mWhens;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODDChoose;
  v2 = -[ODDChoose init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mWhens = v2->mWhens;
    v2->mWhens = v3;

  }
  return v2;
}

- (id)whens
{
  return self->mWhens;
}

- (void)addWhen:(id)a3
{
  -[NSMutableArray addObject:](self->mWhens, "addObject:", a3);
}

- (id)otherwise
{
  return self->mOtherwise;
}

- (void)setOtherwise:(id)a3
{
  objc_storeStrong((id *)&self->mOtherwise, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDChoose;
  -[ODDLayoutObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOtherwise, 0);
  objc_storeStrong((id *)&self->mWhens, 0);
}

@end
