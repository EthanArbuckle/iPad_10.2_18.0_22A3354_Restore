@implementation ODDLayoutObjectList

- (ODDLayoutObjectList)init
{
  ODDLayoutObjectList *v2;
  NSMutableArray *v3;
  NSMutableArray *mChildren;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODDLayoutObjectList;
  v2 = -[ODDLayoutObjectList init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mChildren = v2->mChildren;
    v2->mChildren = v3;

  }
  return v2;
}

- (id)children
{
  return self->mChildren;
}

- (void)addChild:(id)a3
{
  -[NSMutableArray addObject:](self->mChildren, "addObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildren, 0);
}

@end
