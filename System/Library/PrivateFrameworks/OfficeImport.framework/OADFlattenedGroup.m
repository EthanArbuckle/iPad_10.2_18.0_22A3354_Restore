@implementation OADFlattenedGroup

- (OADFlattenedGroup)init
{
  OADFlattenedGroup *v2;
  NSMutableArray *v3;
  NSMutableArray *mDrawables;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADFlattenedGroup;
  v2 = -[OADDrawable initWithPropertiesClass:](&v6, sel_initWithPropertiesClass_, 0);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mDrawables = v2->mDrawables;
    v2->mDrawables = v3;

  }
  return v2;
}

- (id)drawables
{
  return self->mDrawables;
}

- (void)addDrawable:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSMutableArray addObject:](self->mDrawables, "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawables, 0);
}

@end
