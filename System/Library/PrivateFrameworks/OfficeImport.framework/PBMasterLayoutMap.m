@implementation PBMasterLayoutMap

+ (id)masterLayoutMap
{
  return objc_alloc_init(PBMasterLayoutMap);
}

- (PBMasterLayoutMap)init
{
  PBMasterLayoutMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mMasterIdToMasterInfoMap;
  NSMutableDictionary *v5;
  NSMutableDictionary *mTitleIdToMasterIdMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBMasterLayoutMap;
  v2 = -[PBMasterLayoutMap init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mMasterIdToMasterInfoMap = v2->mMasterIdToMasterInfoMap;
    v2->mMasterIdToMasterInfoMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mTitleIdToMasterIdMap = v2->mTitleIdToMasterIdMap;
    v2->mTitleIdToMasterIdMap = v5;

  }
  return v2;
}

- (void)setMasterInfo:(id)a3 forMasterId:(int)a4
{
  NSMutableDictionary *mMasterIdToMasterInfoMap;
  void *v7;
  id v8;

  v8 = a3;
  mMasterIdToMasterInfoMap = self->mMasterIdToMasterInfoMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mMasterIdToMasterInfoMap, "setObject:forKey:", v8, v7);

}

- (id)masterInfoForSlideHolder:(id)a3
{
  id v4;
  void *v5;
  const void *v6;
  unsigned int *v7;
  uint64_t v8;
  void *v9;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "firstChildOfType:", 1007);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)objc_msgSend(v5, "eshObject");
  if (!v6
  {
    +[TCMessageException exceptionWithMessage:](TCMessageException, "exceptionWithMessage:", TCUnknownProblemMessage);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v8 = v7[21];
  -[PBMasterLayoutMap masterInfoForMasterId:](self, "masterInfoForMasterId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PBMasterLayoutMap masterInfoForMasterId:](self, "masterInfoForMasterId:", -[PBMasterLayoutMap masterIdForTitleId:](self, "masterIdForTitleId:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)masterInfoForMasterId:(int)a3
{
  NSMutableDictionary *mMasterIdToMasterInfoMap;
  void *v4;
  void *v5;

  mMasterIdToMasterInfoMap = self->mMasterIdToMasterInfoMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mMasterIdToMasterInfoMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allMasterIds
{
  return (id)-[NSMutableDictionary allKeys](self->mMasterIdToMasterInfoMap, "allKeys");
}

- (id)slideLayoutForSlideHolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBMasterLayoutMap masterInfoForSlideHolder:](self, "masterInfoForSlideHolder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slideLayoutForSlideHolder:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setMasterId:(int)a3 forTitleId:(int)a4
{
  NSMutableDictionary *mTitleIdToMasterIdMap;
  void *v6;
  id v7;

  mTitleIdToMasterIdMap = self->mTitleIdToMasterIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mTitleIdToMasterIdMap, "setObject:forKey:", v7, v6);

}

- (int)masterIdForTitleId:(int)a3
{
  NSMutableDictionary *mTitleIdToMasterIdMap;
  void *v4;
  void *v5;
  int v6;

  mTitleIdToMasterIdMap = self->mTitleIdToMasterIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mTitleIdToMasterIdMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTitleIdToMasterIdMap, 0);
  objc_storeStrong((id *)&self->mMasterIdToMasterInfoMap, 0);
}

@end
