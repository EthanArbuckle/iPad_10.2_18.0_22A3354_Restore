@implementation OCXSStream

- (OCXSStream)init
{
  OCXSStream *v2;
  uint64_t v3;
  NSMutableArray *mLevelStack;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OCXSStream;
  v2 = -[OCXSStream init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
    mLevelStack = v2->mLevelStack;
    v2->mLevelStack = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)pushLevel:(int)a3 name:(const char *)a4
{
  uint64_t v5;
  OCXSStreamLevel *v7;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(OCXSStreamLevel);
  -[OCXSStreamLevel setName:](v7, "setName:", a4);
  -[OCXSStreamLevel setDepth:](v7, "setDepth:", v5);
  -[NSMutableArray addObject:](self->mLevelStack, "addObject:", v7);

}

- (BOOL)hasLevels
{
  return -[NSMutableArray count](self->mLevelStack, "count") != 0;
}

- (int)currentContextDepth
{
  int v2;
  void *v3;
  void *v4;

  -[NSMutableArray lastObject](self->mLevelStack, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "depth");

  if (v4)
    return v2;
  else
    return -1;
}

- (int)currentContextChildDepth
{
  return -[OCXSStream currentContextDepth](self, "currentContextDepth") + 1;
}

- (BOOL)popLevel
{
  _BOOL4 v3;

  v3 = -[OCXSStream hasLevels](self, "hasLevels");
  if (v3)
    -[NSMutableArray removeLastObject](self->mLevelStack, "removeLastObject");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLevelStack, 0);
}

@end
