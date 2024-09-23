@implementation PDAnimationInfoData

- (PDAnimationInfoData)initWithTarget:(id)a3 presetClass:(int)a4 presetId:(int)a5 triggerType:(int)a6 iterateType:(int)a7 delay:(double)a8 direction:(double)a9 order:(unsigned int)a10 groupId:(id)a11 build:(id)a12
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  id v21;
  id v22;
  PDAnimationInfoData *v23;
  PDAnimationInfoData *v24;
  uint64_t v25;
  OADDrawable *mDrawable;
  PDSequentialTimeNode *v27;
  PDSequentialTimeNode *mSequentialTimeNodeData;
  objc_super v30;

  v15 = *(_QWORD *)&a7;
  v16 = *(_QWORD *)&a6;
  v17 = *(_QWORD *)&a5;
  v18 = *(_QWORD *)&a4;
  v20 = a3;
  v21 = a11;
  v22 = a12;
  v30.receiver = self;
  v30.super_class = (Class)PDAnimationInfoData;
  v23 = -[PDAnimationInfoData init](&v30, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->mOrder = a10;
    objc_storeStrong((id *)&v23->mBuild, a12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "drawable");
      v25 = objc_claimAutoreleasedReturnValue();
      mDrawable = v24->mDrawable;
      v24->mDrawable = (OADDrawable *)v25;

    }
    v27 = +[PDSequentialTimeNode newSequentialTimeNodeGroupForAnimationInfoWithClass:target:](PDSequentialTimeNode, "newSequentialTimeNodeGroupForAnimationInfoWithClass:target:", objc_opt_class(), v20);
    mSequentialTimeNodeData = v24->mSequentialTimeNodeData;
    v24->mSequentialTimeNodeData = v27;

    -[PDSequentialTimeNode setPresetClass:](v24->mSequentialTimeNodeData, "setPresetClass:", v18);
    -[PDSequentialTimeNode setPresetId:](v24->mSequentialTimeNodeData, "setPresetId:", v17);
    -[PDSequentialTimeNode setTriggerType:](v24->mSequentialTimeNodeData, "setTriggerType:", v16);
    -[PDSequentialTimeNode setIterateType:](v24->mSequentialTimeNodeData, "setIterateType:", v15);
    -[PDSequentialTimeNode setDirection:](v24->mSequentialTimeNodeData, "setDirection:", a9);
    -[PDSequentialTimeNode setTarget:](v24->mSequentialTimeNodeData, "setTarget:", v20);
    -[PDSequentialTimeNode setGroupId:](v24->mSequentialTimeNodeData, "setGroupId:", v21);
    if ((_DWORD)v16 != 1)
      -[PDSequentialTimeNode setDelay:](v24->mSequentialTimeNodeData, "setDelay:", a8);
  }

  return v24;
}

- (unsigned)order
{
  return self->mOrder;
}

- (id)build
{
  return self->mBuild;
}

- (id)data
{
  return self->mSequentialTimeNodeData;
}

- (id)drawable
{
  return self->mDrawable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawable, 0);
  objc_storeStrong((id *)&self->mSequentialTimeNodeData, 0);
  objc_storeStrong((id *)&self->mBuild, 0);
}

@end
