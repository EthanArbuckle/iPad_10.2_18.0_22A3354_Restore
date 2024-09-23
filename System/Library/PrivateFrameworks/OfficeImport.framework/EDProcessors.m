@implementation EDProcessors

- (EDProcessors)initWithWorkbook:(id)a3
{
  id v4;
  EDProcessors *v5;
  EDProcessors *v6;
  NSMutableArray *v7;
  NSMutableArray *mProcessors;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDProcessors;
  v5 = -[EDProcessors init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mWorkbook, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mProcessors = v6->mProcessors;
    v6->mProcessors = v7;

  }
  return v6;
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->mProcessors, "removeAllObjects");
}

- (void)addProcessorClass:(Class)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = [a3 alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
  v6 = (id)objc_msgSend(v4, "initWithWorkbook:", WeakRetained);

  -[NSMutableArray addObject:](self->mProcessors, "addObject:", v6);
}

- (void)markObject:(id)a3 processor:(Class)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = -[NSMutableArray count](self->mProcessors, "count");
  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->mProcessors, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if ((Class)objc_opt_class() == a4 && objc_msgSend(v8, "isObjectSupported:", v9))
          break;
      }

      if (v6 == ++v7)
        goto LABEL_7;
    }
    objc_msgSend(v8, "markObjectForPostProcessing:", v9);

  }
LABEL_7:

}

- (void)applyProcessorsWithSheet:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x22E2DDB58]();
  v5 = -[NSMutableArray count](self->mProcessors, "count");
  +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", (double)v5, 1.0);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->mProcessors, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applyProcessorWithSheet:", v8);

      +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
    }
  }
  -[EDProcessors removeAllObjects](self, "removeAllObjects");
  +[TCProgressContext endStage](TCProgressContext, "endStage");
  objc_autoreleasePoolPop(v4);

}

- (BOOL)hasProcessors
{
  return -[NSMutableArray count](self->mProcessors, "count") != 0;
}

- (void)removeProcessorClass:(Class)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;

  v5 = -[NSMutableArray count](self->mProcessors, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->mProcessors, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();

      if (v9 == a3)
        break;
      if (v6 == ++v7)
        return;
    }
    -[NSMutableArray removeObjectAtIndex:](self->mProcessors, "removeObjectAtIndex:", v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProcessors, 0);
  objc_destroyWeak((id *)&self->mWorkbook);
}

@end
