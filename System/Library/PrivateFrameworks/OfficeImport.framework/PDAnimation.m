@implementation PDAnimation

- (PDAnimation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimation;
  return -[PDAnimation init](&v3, sel_init);
}

- (id)addRootTimeNode
{
  PDRootTimeNode *mRootTimeNode;
  PDRootTimeNode *v4;
  PDRootTimeNode *v5;

  mRootTimeNode = self->mRootTimeNode;
  if (!mRootTimeNode)
  {
    v4 = objc_alloc_init(PDRootTimeNode);
    v5 = self->mRootTimeNode;
    self->mRootTimeNode = v4;

    mRootTimeNode = self->mRootTimeNode;
  }
  return mRootTimeNode;
}

- (void)setBuildMap:(id)a3
{
  objc_storeStrong((id *)&self->mBuildMap, a3);
}

+ (TCEnumerationMap)entranceSubTypeMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_48, 0, &dword_22A0CC000);
  }
  if (+[PDAnimation entranceSubTypeMap]::onceToken != -1)
    dispatch_once(&+[PDAnimation entranceSubTypeMap]::onceToken, &__block_literal_global_100);
  return (TCEnumerationMap *)(id)+[PDAnimation entranceSubTypeMap]::sEntranceSubTypeMap;
}

void __33__PDAnimation_entranceSubTypeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PDAnimation entranceSubTypeMap]::PDEntranceAnimSubTypeMap, 54, 1);
  v1 = (void *)+[PDAnimation entranceSubTypeMap]::sEntranceSubTypeMap;
  +[PDAnimation entranceSubTypeMap]::sEntranceSubTypeMap = (uint64_t)v0;

}

+ (TCEnumerationMap)exitSubTypeMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_625_0, 0, &dword_22A0CC000);
  }
  if (+[PDAnimation exitSubTypeMap]::onceToken != -1)
    dispatch_once(&+[PDAnimation exitSubTypeMap]::onceToken, &__block_literal_global_626);
  return (TCEnumerationMap *)(id)+[PDAnimation exitSubTypeMap]::sExitSubTypeMap;
}

void __29__PDAnimation_exitSubTypeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PDAnimation exitSubTypeMap]::PDExitAnimSubTypeMap, 54, 1);
  v1 = (void *)+[PDAnimation exitSubTypeMap]::sExitSubTypeMap;
  +[PDAnimation exitSubTypeMap]::sExitSubTypeMap = (uint64_t)v0;

}

- (id)rootTimeNode
{
  return self->mRootTimeNode;
}

- (id)buildMap
{
  return self->mBuildMap;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimation;
  -[PDAnimation description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBuildMap, 0);
  objc_storeStrong((id *)&self->mRootTimeNode, 0);
}

@end
