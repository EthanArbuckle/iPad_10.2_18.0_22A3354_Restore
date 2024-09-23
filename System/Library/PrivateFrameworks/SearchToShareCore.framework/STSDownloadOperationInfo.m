@implementation STSDownloadOperationInfo

- (STSDownloadOperationInfo)initWithOperation:(id)a3 begin:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  STSDownloadOperationInfo *v15;
  STSDownloadOperationInfo *v16;
  uint64_t v17;
  NSMutableArray *beginBlocks;
  NSMutableArray *v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *progressBlocks;
  NSMutableArray *v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *completionBlocks;
  NSMutableArray *v27;
  void *v28;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)STSDownloadOperationInfo;
  v15 = -[STSDownloadOperationInfo init](&v30, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_operation, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    beginBlocks = v16->_beginBlocks;
    v16->_beginBlocks = (NSMutableArray *)v17;

    if (v12)
    {
      v19 = v16->_beginBlocks;
      v20 = (void *)MEMORY[0x227672A18](v12);
      -[NSMutableArray addObject:](v19, "addObject:", v20);

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    progressBlocks = v16->_progressBlocks;
    v16->_progressBlocks = (NSMutableArray *)v21;

    if (v13)
    {
      v23 = v16->_progressBlocks;
      v24 = (void *)MEMORY[0x227672A18](v13);
      -[NSMutableArray addObject:](v23, "addObject:", v24);

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = objc_claimAutoreleasedReturnValue();
    completionBlocks = v16->_completionBlocks;
    v16->_completionBlocks = (NSMutableArray *)v25;

    if (v14)
    {
      v27 = v16->_completionBlocks;
      v28 = (void *)MEMORY[0x227672A18](v14);
      -[NSMutableArray addObject:](v27, "addObject:", v28);

    }
  }

  return v16;
}

- (id)beginBlocks
{
  return (id)-[NSMutableArray copy](self->_beginBlocks, "copy");
}

- (NSArray)progressBlocks
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_progressBlocks, "copy");
}

- (NSArray)completionBlocks
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_completionBlocks, "copy");
}

- (void)addBegin:(id)a3
{
  NSMutableArray *beginBlocks;
  id v4;

  beginBlocks = self->_beginBlocks;
  v4 = (id)MEMORY[0x227672A18](a3, a2);
  -[NSMutableArray addObject:](beginBlocks, "addObject:", v4);

}

- (void)addProgress:(id)a3
{
  NSMutableArray *progressBlocks;
  id v4;

  progressBlocks = self->_progressBlocks;
  v4 = (id)MEMORY[0x227672A18](a3, a2);
  -[NSMutableArray addObject:](progressBlocks, "addObject:", v4);

}

- (void)addCompletion:(id)a3
{
  NSMutableArray *completionBlocks;
  id v4;

  completionBlocks = self->_completionBlocks;
  v4 = (id)MEMORY[0x227672A18](a3, a2);
  -[NSMutableArray addObject:](completionBlocks, "addObject:", v4);

}

- (NSOperation)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_progressBlocks, 0);
  objc_storeStrong((id *)&self->_beginBlocks, 0);
}

@end
