@implementation CHWorkoutTypeKey

+ (id)emptyKey
{
  CHWorkoutTypeKey *v2;

  v2 = objc_alloc_init(CHWorkoutTypeKey);
  -[CHWorkoutTypeKey setActivityType:](v2, "setActivityType:", _HKWorkoutActivityTypeNone);
  -[CHWorkoutTypeKey setIndoor:](v2, "setIndoor:", 0);
  -[CHWorkoutTypeKey setWorkoutBrandName:](v2, "setWorkoutBrandName:", 0);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[2] = self->_activityType;
  *((_BYTE *)v5 + 8) = self->_indoor;
  v6 = -[NSString copyWithZone:](self->_workoutBrandName, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v5[4] = self->_swimLocationType;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSString *workoutBrandName;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  id v15;
  unsigned int v16;
  id swimLocationType;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    workoutBrandName = self->_workoutBrandName;
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workoutBrandName"));
    if (workoutBrandName == v9)
    {
      v13 = 1;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workoutBrandName"));
      if (v10)
      {
        v11 = self->_workoutBrandName;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workoutBrandName"));
        v13 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    v15 = -[CHWorkoutTypeKey activityType](self, "activityType");
    if (v15 == objc_msgSend(v7, "activityType")
      && (v16 = -[CHWorkoutTypeKey isIndoor](self, "isIndoor"),
          (v13 & ~(v16 ^ objc_msgSend(v7, "isIndoor"))) == 1))
    {
      swimLocationType = (id)self->_swimLocationType;
      v14 = swimLocationType == objc_msgSend(v7, "swimLocationType");
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  _BOOL4 indoor;
  unint64_t activityType;
  NSString *workoutBrandName;
  NSString *v5;
  NSString **p_workoutBrandName;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  indoor = self->_indoor;
  activityType = self->_activityType;
  if (activityType == 46)
  {
    p_workoutBrandName = &self->_workoutBrandName;
    workoutBrandName = self->_workoutBrandName;
    v5 = p_workoutBrandName[1];
    v7 = 200000;
    if (v5 != (NSString *)2)
      v7 = 0;
    if (v5 == (NSString *)1)
      v8 = 100000;
    else
      v8 = v7;
    v9 = -[NSString hash](workoutBrandName, "hash") ^ v8;
  }
  else
  {
    v9 = -[NSString hash](self->_workoutBrandName, "hash");
  }
  v10 = 20000;
  if (!indoor)
    v10 = 0;
  return v9 ^ activityType ^ v10;
}

+ (id)initForWorkout:(id)a3
{
  id v4;
  CHWorkoutTypeKey *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(CHWorkoutTypeKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fiui_activityType"));

  -[CHWorkoutTypeKey setActivityType:](v5, "setActivityType:", objc_msgSend(v6, "effectiveTypeIdentifier"));
  if (objc_msgSend((id)objc_opt_class(a1, v7), "historyFilterDisambiguatesLocationForActivityType:", objc_msgSend(v6, "effectiveTypeIdentifier")))-[CHWorkoutTypeKey setIndoor:](v5, "setIndoor:", objc_msgSend(v6, "isIndoor"));
  if (objc_msgSend(v6, "effectiveTypeIdentifier") == (id)46)
    -[CHWorkoutTypeKey setSwimLocationType:](v5, "setSwimLocationType:", objc_msgSend(v6, "swimmingLocationType"));
  if (objc_msgSend(v6, "effectiveTypeIdentifier") == (id)14)
    -[CHWorkoutTypeKey setActivityType:](v5, "setActivityType:", 77);

  return v5;
}

+ (BOOL)historyFilterDisambiguatesLocationForActivityType:(unint64_t)a3
{
  if (a3 <= 0x34 && ((1 << a3) & 0x10402000000000) != 0)
    return 0;
  else
    return +[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:");
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(unint64_t)a3
{
  self->_activityType = a3;
}

- (BOOL)isIndoor
{
  return self->_indoor;
}

- (void)setIndoor:(BOOL)a3
{
  self->_indoor = a3;
}

- (NSString)workoutBrandName
{
  return self->_workoutBrandName;
}

- (void)setWorkoutBrandName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)swimLocationType
{
  return self->_swimLocationType;
}

- (void)setSwimLocationType:(int64_t)a3
{
  self->_swimLocationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutBrandName, 0);
}

@end
