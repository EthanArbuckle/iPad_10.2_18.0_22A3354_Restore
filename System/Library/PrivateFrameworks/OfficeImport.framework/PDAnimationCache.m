@implementation PDAnimationCache

- (PDAnimationCache)initWithAnimationInfo:(id)a3
{
  id v4;
  PDAnimationCache *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *mGroupId;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDAnimationCache;
  v5 = -[PDAnimationCache init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDAnimationCache setTarget:](v5, "setTarget:", v6);

    objc_msgSend(v4, "motionPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDAnimationCache setMotionPath:](v5, "setMotionPath:", v7);

    objc_msgSend(v4, "groupId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDAnimationCache setGroupId:](v5, "setGroupId:", v8);

    objc_msgSend(v4, "build");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDAnimationCache setBuild:](v5, "setBuild:", v9);

    v5->mNodeType = objc_msgSend(v4, "nodeType");
    v5->mPresetId = objc_msgSend(v4, "presetId");
    v5->mPresetSubType = objc_msgSend(v4, "presetSubType");
    v5->mPresetClass = objc_msgSend(v4, "presetClass");
    v5->mIterateType = objc_msgSend(v4, "iterateType");
    if (objc_msgSend(v4, "hasDelay"))
    {
      objc_msgSend(v4, "delay");
      -[PDAnimationCache setDelay:](v5, "setDelay:");
    }
    if (objc_msgSend(v4, "hasDirection"))
    {
      objc_msgSend(v4, "direction");
      -[PDAnimationCache setDirection:](v5, "setDirection:");
    }
    if (objc_msgSend(v4, "hasDuration"))
    {
      objc_msgSend(v4, "duration");
      -[PDAnimationCache setDuration:](v5, "setDuration:");
    }
    if (objc_msgSend(v4, "hasPartCount"))
      -[PDAnimationCache setPartCount:](v5, "setPartCount:", objc_msgSend(v4, "partCount"));
    if (objc_msgSend(v4, "hasValue"))
    {
      objc_msgSend(v4, "value");
      -[PDAnimationCache setValue:](v5, "setValue:");
    }
    v5->mIsHead = objc_msgSend(v4, "isHead");
    v5->mLevel = objc_msgSend(v4, "level");
    objc_msgSend(v4, "groupId");
    v10 = objc_claimAutoreleasedReturnValue();
    mGroupId = v5->mGroupId;
    v5->mGroupId = (NSString *)v10;

  }
  return v5;
}

- (void)setDelay:(double)a3
{
  self->mDelay = a3;
  self->mHasDelay = 1;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
  self->mHasDuration = 1;
}

- (void)setDirection:(double)a3
{
  self->mDirection = a3;
  self->mHasDirection = 1;
}

- (void)setPartCount:(int)a3
{
  self->mPartCount = a3;
  self->mHasPartCount = 1;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
  self->mHasValue = 1;
}

+ (void)loadAnimationCache:(id)a3 pdAnimation:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unsigned int i;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PDBuildMapKey *v17;
  void *v18;
  PDBuildMapKey *v19;
  void *v20;
  id v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v21 = a5;
  objc_msgSend(v8, "rootTimeNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(a1, "mapCommonData:cacheData:state:", v9, v22, v21);
  objc_msgSend(v8, "buildMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    for (i = 0; ; i = v12 + 1)
    {
      v12 = i;
      if (objc_msgSend(v22, "count") <= (unint64_t)i)
        break;
      objc_msgSend(v22, "objectAtIndex:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "target");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "target");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "drawable");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_13;
        v17 = [PDBuildMapKey alloc];
        objc_msgSend(v13, "groupId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PDBuildMapKey initWithDrawable:groupId:](v17, "initWithDrawable:groupId:", v16, v18);

        objc_msgSend(v10, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v13, "setBuild:", v20);

      }
      else
      {
        v16 = v14;
      }

LABEL_13:
    }
  }

}

+ (id)createAnimationInfoDataForCacheItem:(id)a3 order:(unsigned int)a4
{
  id v4;
  void *v5;
  PDAnimationInfoData *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  void *v16;
  PDAnimationInfoData *v17;

  v4 = a3;
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [PDAnimationInfoData alloc];
    objc_msgSend(v4, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "presetClass");
    v9 = objc_msgSend(v4, "presetId");
    v10 = objc_msgSend(v4, "nodeType");
    v11 = objc_msgSend(v4, "iterateType");
    objc_msgSend(v4, "delay");
    v13 = v12;
    v14 = objc_msgSend(v4, "presetSubType");
    objc_msgSend(v4, "groupId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "build");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PDAnimationInfoData initWithTarget:presetClass:presetId:triggerType:iterateType:delay:direction:order:groupId:build:](v6, "initWithTarget:presetClass:presetId:triggerType:iterateType:delay:direction:order:groupId:build:", v7, v8, v9, v10, v11, a4, v13, (double)v14, v15, v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (PDAnimationTarget)target
{
  return self->mTarget;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->mTarget, a3);
}

- (int)nodeType
{
  return self->mNodeType;
}

- (void)setNodeType:(int)a3
{
  self->mNodeType = a3;
}

- (int)presetId
{
  return self->mPresetId;
}

- (void)setPresetId:(int)a3
{
  self->mPresetId = a3;
}

- (int)presetSubType
{
  return self->mPresetSubType;
}

- (void)setPresetSubType:(int)a3
{
  self->mPresetSubType = a3;
}

- (int)presetClass
{
  return self->mPresetClass;
}

- (void)setPresetClass:(int)a3
{
  self->mPresetClass = a3;
}

- (int)iterateType
{
  return self->mIterateType;
}

- (void)setIterateType:(int)a3
{
  self->mIterateType = a3;
}

- (BOOL)hasDelay
{
  return self->mHasDelay;
}

- (void)setHasDelay:(BOOL)a3
{
  self->mHasDelay = a3;
}

- (double)delay
{
  return self->mDelay;
}

- (BOOL)hasDuration
{
  return self->mHasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->mHasDuration = a3;
}

- (double)duration
{
  return self->mDuration;
}

- (BOOL)hasDirection
{
  return self->mHasDirection;
}

- (void)setHasDirection:(BOOL)a3
{
  self->mHasDirection = a3;
}

- (double)direction
{
  return self->mDirection;
}

- (BOOL)hasPartCount
{
  return self->mHasPartCount;
}

- (void)setHasPartCount:(BOOL)a3
{
  self->mHasPartCount = a3;
}

- (int)partCount
{
  return self->mPartCount;
}

- (PDAnimateMotionBehavior)motionPath
{
  return self->mMotionPath;
}

- (void)setMotionPath:(id)a3
{
  objc_storeStrong((id *)&self->mMotionPath, a3);
}

- (BOOL)hasValue
{
  return self->mHasValue;
}

- (void)setHasValue:(BOOL)a3
{
  self->mHasValue = a3;
}

- (double)value
{
  return self->mValue;
}

- (NSString)groupId
{
  return self->mGroupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->mGroupId, a3);
}

- (BOOL)isHead
{
  return self->mIsHead;
}

- (void)setIsHead:(BOOL)a3
{
  self->mIsHead = a3;
}

- (int)level
{
  return self->mLevel;
}

- (void)setLevel:(int)a3
{
  self->mLevel = a3;
}

- (PDBuild)build
{
  return self->mBuild;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->mBuild, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGroupId, 0);
  objc_storeStrong((id *)&self->mBuild, 0);
  objc_storeStrong((id *)&self->mMotionPath, 0);
  objc_storeStrong((id *)&self->mTarget, 0);
}

+ (void)mapCommonData:(id)a3 cacheData:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int i;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v23, "hasPresetClass")
    || objc_msgSend(v23, "animationPresetClass") != 1
    && objc_msgSend(v23, "animationPresetClass") != 2
    && objc_msgSend(v23, "animationPresetClass") != 6
    && objc_msgSend(v23, "animationPresetClass") != 3
    && objc_msgSend(v23, "animationPresetClass") != 4)
  {
    objc_msgSend(v23, "childTimeNodeList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_25;
    objc_msgSend(v23, "childTimeNodeList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; i = v13 + 1)
    {
      v13 = i;
      if (objc_msgSend(v11, "count") <= (unint64_t)i)
      {

        goto LABEL_25;
      }
      objc_msgSend(v11, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "parallel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v14, "parallel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "mapCommonData:cacheData:state:", v16, v8, v9);
      }
      else
      {
        objc_msgSend(v14, "sequential");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v14, "sequential");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "mapCommonData:cacheData:state:", v16, v8, v9);
        }
        else
        {
          objc_msgSend(v14, "audio");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {

          }
          else
          {
            objc_msgSend(v14, "video");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              goto LABEL_23;
          }
          objc_msgSend(v14, "audio");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 || (objc_msgSend(v14, "video"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_msgSend(v16, "target");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v9, "mediaNodeMap");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "target");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forUncopiedKey:", v16, v22);

            }
          }
        }
      }

LABEL_23:
    }
  }
  objc_msgSend(a1, "mapAnimationInfo:cacheData:state:", v23, v8, v9);
LABEL_25:

}

+ (void)mapAnimationInfo:(id)a3 cacheData:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PDAnimationCache *v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v19, "animationPresetClass");
  v10 = objc_msgSend(v19, "type");
  v11 = objc_msgSend(v19, "presetSubType");
  v12 = objc_msgSend(v19, "presetId");
  objc_msgSend(v19, "groupId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  TSUDynamicCast(v14, (uint64_t)v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "buildInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc_init(PDAnimationCache);
    -[PDAnimationCache setPresetClass:](v17, "setPresetClass:", v9);
    -[PDAnimationCache setNodeType:](v17, "setNodeType:", v10);
    -[PDAnimationCache setPresetSubType:](v17, "setPresetSubType:", v11);
    -[PDAnimationCache setPresetId:](v17, "setPresetId:", v12);
    objc_msgSend(v16, "target");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDAnimationCache setTarget:](v17, "setTarget:", v18);

    -[PDAnimationCache setIterateType:](v17, "setIterateType:", objc_msgSend(v16, "iterateType"));
    -[PDAnimationCache setGroupId:](v17, "setGroupId:", v13);
    objc_msgSend(v16, "duration");
    -[PDAnimationCache setDuration:](v17, "setDuration:");
    objc_msgSend(v16, "delay");
    -[PDAnimationCache setDelay:](v17, "setDelay:");
    if (objc_msgSend(v8, "isValid:", v17))
      objc_msgSend(v7, "addObject:", v17);

  }
}

@end
