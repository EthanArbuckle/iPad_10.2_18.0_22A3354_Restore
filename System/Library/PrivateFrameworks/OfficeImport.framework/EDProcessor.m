@implementation EDProcessor

- (EDProcessor)initWithWorkbook:(id)a3
{
  id v4;
  EDProcessor *v5;
  EDProcessor *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *mObjects;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDProcessor;
  v5 = -[EDProcessor init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mWorkbook, v4);
    objc_msgSend(v4, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->mResources, v7);

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mObjects = v6->mObjects;
    v6->mObjects = v8;

  }
  return v6;
}

- (void)markObjectForPostProcessing:(id)a3
{
  -[NSMutableArray addObject:](self->mObjects, "addObject:", a3);
}

- (void)applyProcessorWithSheet:(id)a3
{
  unsigned int i;
  void *v5;
  id v6;

  v6 = a3;
  for (i = 0; -[NSMutableArray count](self->mObjects, "count") > (unint64_t)i; ++i)
  {
    -[NSMutableArray objectAtIndex:](self->mObjects, "objectAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (-[EDProcessor isObjectSupported:](self, "isObjectSupported:", v5))
        -[EDProcessor applyProcessorToObject:sheet:](self, "applyProcessorToObject:sheet:", v5, v6);
    }

  }
}

- (BOOL)isObjectSupported:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mObjects, 0);
  objc_destroyWeak((id *)&self->mResources);
  objc_destroyWeak((id *)&self->mWorkbook);
}

@end
