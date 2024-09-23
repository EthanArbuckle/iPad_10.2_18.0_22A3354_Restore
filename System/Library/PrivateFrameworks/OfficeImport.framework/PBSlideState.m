@implementation PBSlideState

- (PBSlideState)init
{
  PBSlideState *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mBuildOrderMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBSlideState;
  v2 = -[PBSlideState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mBuildOrderMap = v2->mBuildOrderMap;
    v2->mBuildOrderMap = v3;

    v2->mCurrentGroupId = 0;
  }
  return v2;
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->mBuildOrderMap, "removeAllObjects");
  self->mCurrentGroupId = 0;
}

- (void)addBuild:(id)a3 order:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSMutableDictionary *mBuildOrderMap;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v6)
  {
    v12 = v6;
    while (1)
    {
      mBuildOrderMap = self->mBuildOrderMap;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](mBuildOrderMap, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        break;
      v4 = (v4 + 1);
    }
    v10 = self->mBuildOrderMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, v11);

    v6 = v12;
  }

}

- (id)buildOrderMap
{
  return self->mBuildOrderMap;
}

- (unsigned)generateGroupId
{
  unsigned int mCurrentGroupId;

  mCurrentGroupId = self->mCurrentGroupId;
  self->mCurrentGroupId = mCurrentGroupId + 1;
  return mCurrentGroupId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBuildOrderMap, 0);
}

@end
