@implementation PDTimeNode

- (PDTimeNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTimeNode;
  return -[PDTimeNode init](&v3, sel_init);
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setRestartType:(int)a3
{
  self->mRestartType = a3;
}

- (void)setStartTimeConditions:(id)a3
{
  objc_storeStrong((id *)&self->mStartTimeConditions, a3);
}

- (void)setAnimationPresetClass:(int)a3
{
  self->mAnimationPresetClass = a3;
}

- (void)setPresetSubType:(int)a3
{
  self->mHasPresetSubType = 1;
  self->mPresetSubType = a3;
}

- (void)setPresetId:(int)a3
{
  self->mHasPresetId = 1;
  self->mPresetId = a3;
}

- (void)setAcceleration:(double)a3
{
  self->mHasAcceleration = 1;
  self->mAcceleration = a3;
}

- (void)setDeceleration:(double)a3
{
  self->mHasDeceleration = 1;
  self->mDeceleration = a3;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
  self->mHasDuration = 1;
}

- (void)setChildTimeNodeList:(id)a3
{
  objc_storeStrong((id *)&self->mChildTimeNodeList, a3);
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->mGroupId, a3);
}

- (void)setIterate:(id)a3
{
  objc_storeStrong((id *)&self->mIterate, a3);
}

- (void)setRepeatCount:(int)a3
{
  self->mHasRepeatCount = 1;
  self->mRepeatCount = a3;
}

- (id)startTimeConditions
{
  return self->mStartTimeConditions;
}

- (id)endTimeConditions
{
  return self->mEndTimeConditions;
}

- (void)setEndTimeConditions:(id)a3
{
  objc_storeStrong((id *)&self->mEndTimeConditions, a3);
}

- (id)childTimeNodeList
{
  return self->mChildTimeNodeList;
}

- (id)subTimeNodeList
{
  return self->mSubTimeNodeList;
}

- (void)setSubTimeNodeList:(id)a3
{
  objc_storeStrong((id *)&self->mSubTimeNodeList, a3);
}

- (id)iterate
{
  return self->mIterate;
}

- (BOOL)hasType
{
  return -[PDTimeNode type](self, "type") != 0;
}

- (int)type
{
  return self->mType;
}

- (BOOL)hasPresetClass
{
  return -[PDTimeNode animationPresetClass](self, "animationPresetClass") != 0;
}

- (int)animationPresetClass
{
  return self->mAnimationPresetClass;
}

- (BOOL)hasPresetSubType
{
  return self->mHasPresetSubType;
}

- (int)presetSubType
{
  return self->mPresetSubType;
}

- (BOOL)hasPresetId
{
  return self->mHasPresetId;
}

- (int)presetId
{
  return self->mPresetId;
}

- (BOOL)hasRepeatCount
{
  return self->mHasRepeatCount;
}

- (int)repeatCount
{
  return self->mRepeatCount;
}

- (BOOL)hasRepeatDuration
{
  return self->mHasRepeatDuration;
}

- (int)repeatDuration
{
  if (self->mRepeatDuration == -1)
    return 0;
  else
    return self->mRepeatDuration;
}

- (void)setRepeatDuration:(int)a3
{
  self->mHasRepeatDuration = 1;
  self->mRepeatDuration = a3;
}

- (BOOL)hasRestartType
{
  return -[PDTimeNode restartType](self, "restartType") != 0;
}

- (int)restartType
{
  return self->mRestartType;
}

- (BOOL)hasDuration
{
  return self->mHasDuration;
}

- (double)duration
{
  double result;

  result = self->mDuration;
  if (result == -1.0)
    return 0.0;
  return result;
}

- (BOOL)hasSpeed
{
  return self->mHasSpeed;
}

- (double)speed
{
  return self->mSpeed;
}

- (void)setSpeed:(double)a3
{
  self->mHasSpeed = 1;
  self->mSpeed = a3;
}

- (BOOL)hasAcceleration
{
  return self->mHasAcceleration;
}

- (double)acceleration
{
  return self->mAcceleration;
}

- (BOOL)hasDeceleration
{
  return self->mHasDeceleration;
}

- (double)deceleration
{
  return self->mDeceleration;
}

- (BOOL)hasFillType
{
  return self->mHasFillType;
}

- (int)fillType
{
  return self->mFillType;
}

- (void)setFillType:(int)a3
{
  self->mHasFillType = 1;
  self->mFillType = a3;
}

- (id)groupId
{
  return self->mGroupId;
}

- (void)setGroupIdValue:(int)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PDTimeNode setGroupId:](self, "setGroupId:", v5);
}

- (BOOL)hasDisplay
{
  return self->mHasDisplay;
}

- (BOOL)display
{
  return self->mDisplay;
}

- (void)setDisplay:(BOOL)a3
{
  self->mHasDisplay = 1;
  self->mDisplay = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int mType;
  int mAnimationPresetClass;
  int mPresetId;
  int mPresetSubType;
  int mRepeatCount;
  int mRepeatDuration;
  int mRestartType;
  double mSpeed;
  double v16;
  double mAcceleration;
  double v18;
  double mDeceleration;
  double v20;
  int mDisplay;
  NSMutableArray *mStartTimeConditions;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  char v26;
  NSMutableArray *mEndTimeConditions;
  void *v28;
  _BOOL4 v29;
  NSMutableArray *v30;
  void *v31;
  char v32;
  NSMutableArray *mChildTimeNodeList;
  void *v34;
  _BOOL4 v35;
  NSMutableArray *v36;
  void *v37;
  char v38;
  NSMutableArray *mSubTimeNodeList;
  void *v40;
  _BOOL4 v41;
  NSMutableArray *v42;
  void *v43;
  char v44;
  NSString *mGroupId;
  void *v46;
  _BOOL4 v47;
  NSString *v48;
  void *v49;
  BOOL v50;
  int mHasDuration;
  double mDuration;
  double v53;
  PDIterate *mIterate;
  void *v55;
  _BOOL4 v56;
  PDIterate *v57;
  void *v58;
  char v59;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_34;
  mType = self->mType;
  if (mType != objc_msgSend(v6, "type"))
    goto LABEL_34;
  mAnimationPresetClass = self->mAnimationPresetClass;
  if (mAnimationPresetClass != objc_msgSend(v7, "animationPresetClass"))
    goto LABEL_34;
  mPresetId = self->mPresetId;
  if (mPresetId != objc_msgSend(v7, "presetId"))
    goto LABEL_34;
  mPresetSubType = self->mPresetSubType;
  if (mPresetSubType != objc_msgSend(v7, "presetSubType"))
    goto LABEL_34;
  mRepeatCount = self->mRepeatCount;
  if (mRepeatCount != objc_msgSend(v7, "repeatCount"))
    goto LABEL_34;
  mRepeatDuration = self->mRepeatDuration;
  if (mRepeatDuration != objc_msgSend(v7, "repeatDuration"))
    goto LABEL_34;
  mRestartType = self->mRestartType;
  if (mRestartType != objc_msgSend(v7, "restartType"))
    goto LABEL_34;
  mSpeed = self->mSpeed;
  objc_msgSend(v7, "speed");
  if (mSpeed != v16)
    goto LABEL_34;
  mAcceleration = self->mAcceleration;
  objc_msgSend(v7, "acceleration");
  if (mAcceleration != v18)
    goto LABEL_34;
  mDeceleration = self->mDeceleration;
  objc_msgSend(v7, "deceleration");
  if (mDeceleration != v20)
    goto LABEL_34;
  mDisplay = self->mDisplay;
  if (mDisplay != objc_msgSend(v7, "display"))
    goto LABEL_34;
  mStartTimeConditions = self->mStartTimeConditions;
  objc_msgSend(v7, "startTimeConditions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mStartTimeConditions) = (mStartTimeConditions != 0) ^ (v23 == 0);

  if ((mStartTimeConditions & 1) == 0)
    goto LABEL_34;
  v24 = self->mStartTimeConditions;
  if (v24)
  {
    objc_msgSend(v7, "startTimeConditions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[NSMutableArray isEqual:](v24, "isEqual:", v25);

    if ((v26 & 1) == 0)
      goto LABEL_34;
  }
  mEndTimeConditions = self->mEndTimeConditions;
  objc_msgSend(v7, "endTimeConditions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if ((mEndTimeConditions != 0) == v29)
    goto LABEL_34;
  v30 = self->mEndTimeConditions;
  if (v30)
  {
    objc_msgSend(v7, "endTimeConditions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[NSMutableArray isEqual:](v30, "isEqual:", v31);

    if ((v32 & 1) == 0)
      goto LABEL_34;
  }
  mChildTimeNodeList = self->mChildTimeNodeList;
  objc_msgSend(v7, "childTimeNodeList");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if ((mChildTimeNodeList != 0) == v35)
    goto LABEL_34;
  v36 = self->mChildTimeNodeList;
  if (v36)
  {
    objc_msgSend(v7, "childTimeNodeList");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[NSMutableArray isEqual:](v36, "isEqual:", v37);

    if ((v38 & 1) == 0)
      goto LABEL_34;
  }
  mSubTimeNodeList = self->mSubTimeNodeList;
  objc_msgSend(v7, "subTimeNodeList");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;

  if ((mSubTimeNodeList != 0) == v41)
    goto LABEL_34;
  v42 = self->mSubTimeNodeList;
  if (v42)
  {
    objc_msgSend(v7, "subTimeNodeList");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[NSMutableArray isEqual:](v42, "isEqual:", v43);

    if ((v44 & 1) == 0)
      goto LABEL_34;
  }
  mGroupId = self->mGroupId;
  objc_msgSend(v7, "groupId");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46 == 0;

  if ((mGroupId != 0) == v47)
    goto LABEL_34;
  v48 = self->mGroupId;
  if (v48)
  {
    objc_msgSend(v7, "groupId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[NSString isEqualToString:](v48, "isEqualToString:", v49);

    if (!v50)
      goto LABEL_34;
  }
  mHasDuration = self->mHasDuration;
  if (mHasDuration != objc_msgSend(v7, "hasDuration"))
    goto LABEL_34;
  if (self->mHasDuration)
  {
    mDuration = self->mDuration;
    objc_msgSend(v7, "duration");
    if (mDuration != v53)
      goto LABEL_34;
  }
  mIterate = self->mIterate;
  objc_msgSend(v7, "iterate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55 == 0;

  if ((mIterate != 0) != v56)
  {
    v57 = self->mIterate;
    if (v57)
    {
      objc_msgSend(v7, "iterate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[PDIterate isEqual:](v57, "isEqual:", v58);

    }
    else
    {
      v59 = 1;
    }
  }
  else
  {
LABEL_34:
    v59 = 0;
  }

  return v59;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (self->mPresetId << 8) + (self->mType << 16);
  v4 = -[NSMutableArray count](self->mStartTimeConditions, "count");
  v5 = -[NSMutableArray count](self->mEndTimeConditions, "count") ^ v4;
  v6 = -[NSMutableArray count](self->mChildTimeNodeList, "count");
  return (v5 ^ v6 ^ -[NSMutableArray count](self->mSubTimeNodeList, "count")) + v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTimeNode;
  -[PDTimeNode description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)attributeMap
{
  return self->attributeMap;
}

- (void)setAttributeMap:(id)a3
{
  objc_storeStrong((id *)&self->attributeMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->attributeMap, 0);
  objc_storeStrong((id *)&self->mGroupId, 0);
  objc_storeStrong((id *)&self->mIterate, 0);
  objc_storeStrong((id *)&self->mSubTimeNodeList, 0);
  objc_storeStrong((id *)&self->mChildTimeNodeList, 0);
  objc_storeStrong((id *)&self->mEndTimeConditions, 0);
  objc_storeStrong((id *)&self->mStartTimeConditions, 0);
}

- (int64_t)writeDuration
{
  return (uint64_t)self->mDuration;
}

- (int64_t)writeRepeatCount
{
  return self->mRepeatCount;
}

@end
