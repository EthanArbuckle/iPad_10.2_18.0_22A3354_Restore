@implementation EDStylesCollection

- (EDStylesCollection)init
{
  EDStylesCollection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDStylesCollection;
  result = -[EDCollection init](&v3, sel_init);
  if (result)
    result->mDefaultWorkbookStyleIndex = -1;
  return result;
}

- (void)setDefaultWorkbookStyleIndex:(unint64_t)a3
{
  self->mDefaultWorkbookStyleIndex = a3;
}

- (unint64_t)addObject:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EDStylesCollection;
  v5 = -[EDCollection addObject:](&v7, sel_addObject_, v4);
  if (v5 != (id)-1)
    objc_msgSend(v4, "setIndex:", v5);

  return (unint64_t)v5;
}

- (id)defaultWorkbookStyle
{
  return -[EDCollection objectAtIndex:](self, "objectAtIndex:", self->mDefaultWorkbookStyleIndex);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDStylesCollection;
  -[EDCollection removeObjectAtIndex:](&v3, sel_removeObjectAtIndex_, a3);
}

- (void)removeAllObjects
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)EDStylesCollection;
  -[EDCollection removeAllObjects](&v2, sel_removeAllObjects);
}

- (unint64_t)defaultWorkbookStyleIndex
{
  return self->mDefaultWorkbookStyleIndex;
}

@end
