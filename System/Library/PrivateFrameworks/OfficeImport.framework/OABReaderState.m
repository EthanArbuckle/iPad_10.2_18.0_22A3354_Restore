@implementation OABReaderState

- (OABReaderState)initWithClient:(Class)a3
{
  OABReaderState *v4;
  OABReaderState *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *mShapeIdMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *mEshContentIdMap;
  uint64_t v10;
  NSMutableArray *mGroupStack;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OABReaderState;
  v4 = -[OABReaderState init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mClient = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mShapeIdMap = v5->mShapeIdMap;
    v5->mShapeIdMap = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mEshContentIdMap = v5->mEshContentIdMap;
    v5->mEshContentIdMap = v8;

    v10 = objc_opt_new();
    mGroupStack = v5->mGroupStack;
    v5->mGroupStack = (NSMutableArray *)v10;

  }
  return v5;
}

- (id)colorPalette
{
  return self->mColorPalette;
}

- (Class)client
{
  return self->mClient;
}

- (void)setDrawable:(id)a3 forShapeId:(unsigned int)a4
{
  NSMutableDictionary *mShapeIdMap;
  void *v7;
  id v8;

  v8 = a3;
  mShapeIdMap = self->mShapeIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mShapeIdMap, "setObject:forKey:", v8, v7);

}

- (id)drawableForShapeId:(int)a3
{
  NSMutableDictionary *mShapeIdMap;
  void *v4;
  void *v5;

  mShapeIdMap = self->mShapeIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mShapeIdMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->mColorPalette, a3);
}

- (OABReaderState)init
{

  return 0;
}

- (id)contentObjectForId:(int)a3
{
  NSMutableDictionary *mEshContentIdMap;
  void *v4;
  void *v5;

  mEshContentIdMap = self->mEshContentIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mEshContentIdMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setContentObject:(id)a3 forId:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *mEshContentIdMap;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  mEshContentIdMap = self->mEshContentIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mEshContentIdMap, "setObject:forKey:", v8, v7);

}

- (int)groupDepth
{
  return -[NSMutableArray count](self->mGroupStack, "count");
}

- (id)groupStackReference
{
  return self->mGroupStack;
}

- (void)pushGroup:(id)a3
{
  -[NSMutableArray addObject:](self->mGroupStack, "addObject:", a3);
}

- (id)popGroup
{
  void *v3;

  -[OABReaderState peekGroup](self, "peekGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->mGroupStack, "removeLastObject");
  return v3;
}

- (id)peekGroup
{
  return (id)-[NSMutableArray lastObject](self->mGroupStack, "lastObject");
}

- (BOOL)isInsideGroup
{
  return -[NSMutableArray count](self->mGroupStack, "count") != 0;
}

- (id)xmlDrawingState
{
  return 0;
}

- (BOOL)useXmlBlobs
{
  return 0;
}

- (ESDContainer)bstoreContainerHolder
{
  return self->mBstoreContainerHolder;
}

- (void)setBstoreContainerHolder:(id)a3
{
  objc_storeStrong((id *)&self->mBstoreContainerHolder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBstoreContainerHolder, 0);
  objc_storeStrong((id *)&self->mGroupStack, 0);
  objc_storeStrong((id *)&self->mColorPalette, 0);
  objc_storeStrong((id *)&self->mEshContentIdMap, 0);
  objc_storeStrong((id *)&self->mShapeIdMap, 0);
}

@end
