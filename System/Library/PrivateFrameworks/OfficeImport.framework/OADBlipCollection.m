@implementation OADBlipCollection

- (OADBlipCollection)init
{
  OADBlipCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *mBlips;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADBlipCollection;
  v2 = -[OADBlipCollection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mBlips = v2->mBlips;
    v2->mBlips = v3;

  }
  return v2;
}

- (unsigned)addBlip:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableArray addObject:](self->mBlips, "addObject:", v4);
  LODWORD(self) = -[NSMutableArray count](self->mBlips, "count");

  return self;
}

- (id)blipAtIndex:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = (a3 - 1);
  if (a3 >= 1 && (int)-[NSMutableArray count](self->mBlips, "count") >= a3)
  {
    -[NSMutableArray objectAtIndex:](self->mBlips, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSMutableArray)blips
{
  return self->mBlips;
}

- (unsigned)blipCount
{
  return -[NSMutableArray count](self->mBlips, "count");
}

- (void)setBlips:(id)a3
{
  objc_storeStrong((id *)&self->mBlips, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBlips, 0);
}

@end
