@implementation TLTimelineEntryNodeRecycleBin

+ (id)sharedRecycleBin
{
  if (sharedRecycleBin_onceToken != -1)
    dispatch_once(&sharedRecycleBin_onceToken, &__block_literal_global);
  return (id)sharedRecycleBin_bin;
}

void __49__TLTimelineEntryNodeRecycleBin_sharedRecycleBin__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[TLTimelineEntryNodeRecycleBin _init]([TLTimelineEntryNodeRecycleBin alloc], "_init");
  v1 = (void *)sharedRecycleBin_bin;
  sharedRecycleBin_bin = (uint64_t)v0;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLTimelineEntryNodeRecycleBin;
  return -[TLTimelineEntryNodeRecycleBin init](&v3, sel_init);
}

- (void)recycleEntryNode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;

  v3 = a3;
  objc_msgSend(v3, "leftNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightNode");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    objc_msgSend(v3, "leftNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightNode:", 0);

  }
  objc_msgSend(v3, "rightNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftNode");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v3)
  {
    objc_msgSend(v3, "rightNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftNode:", 0);

  }
  objc_msgSend(v3, "setLeftNode:", 0);
  objc_msgSend(v3, "setRightNode:", 0);
  v16 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v16;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v11, "setEntry:", 0);
    _SharedRecycleBin();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v12);
    _SharedRecycleBin();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 <= 0x3E7)
    {
      _SharedRecycleBin();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v11);

    }
    objc_sync_exit(v12);

  }
}

- (id)retrieveRecycledEntryNode
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  TLTimelineEntryNode *v6;
  void *v7;

  _SharedRecycleBin();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  _SharedRecycleBin();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    _SharedRecycleBin();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (TLTimelineEntryNode *)objc_claimAutoreleasedReturnValue();

    _SharedRecycleBin();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v6);

  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  if (!v6)
    v6 = objc_alloc_init(TLTimelineEntryNode);
  return v6;
}

- (void)emptyRecycleBin
{
  void *v2;
  id obj;

  _SharedRecycleBin();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  _SharedRecycleBin();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_sync_exit(obj);
}

- (unint64_t)numberOfRecycledNodes
{
  void *v2;
  void *v3;
  unint64_t v4;

  _SharedRecycleBin();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  _SharedRecycleBin();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_sync_exit(v2);
  return v4;
}

- (unint64_t)maximumNumberOfRecycledNodes
{
  return 1000;
}

@end
