@implementation TSKLayerPool

- (TSKLayerPool)init
{
  TSKLayerPool *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKLayerPool;
  v2 = -[TSKLayerPool init](&v4, sel_init);
  if (v2)
  {
    v2->mLayerClass = (Class)objc_opt_class();
    v2->mLayerDelegate = +[TSKNullActionLayerDelegate layerDelegate](TSKNullActionLayerDelegate, "layerDelegate");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKLayerPool;
  -[TSKLayerPool dealloc](&v3, sel_dealloc);
}

- (id)requestLayerFromPool
{
  NSMutableArray *mLayerPool;
  id v4;

  mLayerPool = self->mLayerPool;
  if (!mLayerPool)
  {
    mLayerPool = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->mLayerPool = mLayerPool;
  }
  if (!-[NSMutableArray count](mLayerPool, "count")
    || (v4 = (id)-[NSMutableArray lastObject](self->mLayerPool, "lastObject"),
        -[NSMutableArray removeLastObject](self->mLayerPool, "removeLastObject"),
        !v4))
  {
    v4 = (id)-[objc_class layer](self->mLayerClass, "layer");
  }
  objc_msgSend(v4, "setDelegate:", self->mLayerDelegate);
  return v4;
}

- (void)returnLayerToPool:(id)a3
{
  NSMutableArray *mLayerPool;

  mLayerPool = self->mLayerPool;
  if (mLayerPool)
  {
    if (!a3)
      return;
    goto LABEL_3;
  }
  mLayerPool = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  self->mLayerPool = mLayerPool;
  if (a3)
  {
LABEL_3:
    -[NSMutableArray addObject:](mLayerPool, "addObject:", a3);
    objc_msgSend(a3, "removeFromSuperlayer");
    objc_msgSend(a3, "setContents:", 0);
    objc_msgSend(a3, "setDelegate:", 0);
  }
}

- (Class)layerClass
{
  return self->mLayerClass;
}

- (void)setLayerClass:(Class)a3
{
  self->mLayerClass = a3;
}

- (id)layerDelegate
{
  return self->mLayerDelegate;
}

- (void)setLayerDelegate:(id)a3
{
  self->mLayerDelegate = a3;
}

@end
