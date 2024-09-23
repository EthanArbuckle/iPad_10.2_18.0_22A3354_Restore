@implementation OADPath

- (OADPath)init
{
  OADPath *v2;
  NSMutableArray *v3;
  NSMutableArray *mElements;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADPath;
  v2 = -[OADPath init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mElements = v2->mElements;
    v2->mElements = v3;

    v2->mFillMode = 1;
    v2->mStroked = 1;
  }
  return v2;
}

- (void)addElement:(id)a3
{
  -[NSMutableArray addObject:](self->mElements, "addObject:", a3);
}

- (unint64_t)elementCount
{
  return -[NSMutableArray count](self->mElements, "count");
}

- (BOOL)stroked
{
  return self->mStroked;
}

- (id)elementAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mElements, "objectAtIndex:", a3);
}

- (void)setFillMode:(int)a3
{
  self->mFillMode = a3;
}

- (void)setStroked:(BOOL)a3
{
  self->mStroked = a3;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->mSize.width;
  height = self->mSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)fillMode
{
  return self->mFillMode;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADPath;
  -[OADPath description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mElements, 0);
}

@end
