@implementation NavSignLaneGuidanceInfo

+ (id)fakeInfoForManeuver:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NavSignLaneGuidanceInfo *v9;
  void *v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  if (v3)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Continue straight [DEBUG]"), "mkServerFormattedString"));
    v11 = v7;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_createFakeLanes"));
  v9 = -[NavSignLaneGuidanceInfo initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:]([NavSignLaneGuidanceInfo alloc], "initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:", v5, v8, v3, 0, v6);

  return v9;
}

+ (id)_createFakeLanes
{
  uint32_t v2;
  uint64_t v3;
  uint32_t v4;
  unint64_t v5;
  uint32_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = arc4random_uniform(9u);
  v3 = v2 + 2;
  v4 = arc4random_uniform(v2 + 2);
  v5 = v4;
  v6 = arc4random_uniform(v3 - v4 + 1);
  v7 = v6 + (unint64_t)v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v3));
  v9 = 0;
  do
  {
    if (v9 < v5 || v9 > v7)
      v10 = objc_claimAutoreleasedReturnValue(+[GEOComposedRouteLaneInfo _debug_straightLane](GEOComposedRouteLaneInfo, "_debug_straightLane"));
    else
      v10 = objc_claimAutoreleasedReturnValue(+[GEOComposedRouteLaneInfo _debug_laneWithDirections:good:preferred:](GEOComposedRouteLaneInfo, "_debug_laneWithDirections:good:preferred:", &off_1012742B0, 1, v6 == 0));
    v11 = (void *)v10;
    objc_msgSend(v8, "addObject:", v10);

    ++v9;
  }
  while (v3 != v9);
  return v8;
}

- (NavSignLaneGuidanceInfo)initWithGuidanceLaneInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NavSignLaneGuidanceInfo *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc((Class)MKServerFormattedStringParameters);
    v6 = objc_msgSend(v4, "distanceDetailLevel");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "variableOverrides"));
    v8 = objc_msgSend(v5, "initWithInstructionsDistanceDetailLevel:variableOverrides:", v6, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryStrings"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryStrings"));
      v12 = sub_10039DCD4(v11, &stru_1011E6FA0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructions"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100B6F23C;
      v29[3] = &unk_1011B1CB8;
      v30 = v8;
      v16 = sub_10039DCD4(v15, v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v16);

      v11 = v30;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryStrings"));
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryStrings"));
      v20 = sub_10039DCD4(v19, &stru_1011E6FC0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titles"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100B6F2D4;
      v27[3] = &unk_1011B1CB8;
      v28 = v8;
      v23 = sub_10039DCD4(v22, v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v23);

      v19 = v28;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lanes"));
    self = -[NavSignLaneGuidanceInfo initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:](self, "initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:", v24, v25, objc_msgSend(v4, "isForManeuver"), v21, v13);

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NavSignLaneGuidanceInfo)initWithLaneInfoId:(id)a3 lanes:(id)a4
{
  return -[NavSignLaneGuidanceInfo initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:](self, "initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:", a3, a4, 1, 0, 0);
}

- (NavSignLaneGuidanceInfo)initWithLaneInfoId:(id)a3 lanes:(id)a4 forManeuver:(BOOL)a5 midStepTitles:(id)a6 details:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NavSignLaneGuidanceInfo *v17;
  NavSignLaneGuidanceInfo *v18;
  NavSignLaneGuidanceInfo *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    v21.receiver = self;
    v21.super_class = (Class)NavSignLaneGuidanceInfo;
    v17 = -[NavSignLaneGuidanceInfo init](&v21, "init");
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_laneInfoId, a3);
      objc_storeStrong((id *)&v18->_lanes, a4);
      v18->_isForManeuver = a5;
      objc_storeStrong((id *)&v18->_textAlternatives, a7);
      objc_storeStrong((id *)&v18->_midStepTitles, a6);
    }
    self = v18;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_opt_class(NavSignLaneGuidanceInfo);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo laneInfoId](self, "laneInfoId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "laneInfoId"));

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo laneInfoId](self, "laneInfoId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo lanes](self, "lanes"));
  v5 = objc_msgSend(v4, "count");
  v6 = -[NavSignLaneGuidanceInfo isForManeuver](self, "isForManeuver");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo textAlternatives](self, "textAlternatives"));
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo textAlternatives](self, "textAlternatives"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("laneInfoID: [%@] %d lanes (forManeuver:%d) %@"), v3, v5, v6, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("laneInfoID: [%@] %d lanes (forManeuver:%d) %@"), v3, v5, v6, &stru_1011EB268));
  }

  return v9;
}

- (BOOL)isForMidStep
{
  return !-[NavSignLaneGuidanceInfo isForManeuver](self, "isForManeuver");
}

- (_NSRange)highlightedLaneRange
{
  void *v3;
  void *v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo lanes](self, "lanes"));
  v5 = objc_msgSend(v3, "highlightedLaneRangeForLanes:", v4);
  v7 = v6;

  v8 = (NSUInteger)v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

+ (_NSRange)highlightedLaneRangeForLanes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  NSUInteger v20;
  NSUInteger v21;
  _NSRange result;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (objc_msgSend(v3, "count"))
    {
      v6 = 0;
      while (1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v6));
        if (objc_msgSend(v7, "isPreferredLaneForManeuver"))
          break;
        if (objc_msgSend(v7, "isLaneForManeuver"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
          v9 = v5;
          goto LABEL_8;
        }
LABEL_9:

        if (++v6 >= (unint64_t)objc_msgSend(v3, "count"))
          goto LABEL_10;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
      v9 = v4;
LABEL_8:
      objc_msgSend(v9, "addObject:", v8);

      goto LABEL_9;
    }
LABEL_10:
    v10 = objc_msgSend(v4, "count");
    v11 = v4;
    if (!v10)
    {
      if (objc_msgSend(v5, "count"))
        v11 = v5;
      else
        v11 = 0;
    }
    v12 = v11;
    if (objc_msgSend(v12, "count"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
      v14 = (uint64_t)objc_msgSend(v13, "unsignedIntegerValue");

    }
    else
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (objc_msgSend(v12, "count"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
      v17 = (uint64_t)objc_msgSend(v16, "unsignedIntegerValue");

    }
    else
    {
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v18 = v14 != 0x7FFFFFFFFFFFFFFFLL;
    v19 = v17 != 0x7FFFFFFFFFFFFFFFLL;
    if (v18 && v19)
      v15 = v17 - v14 + 1;
    else
      v15 = 0;
    if (!v18 || !v19)
      v14 = 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v15 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v20 = v14;
  v21 = v15;
  result.length = v21;
  result.location = v20;
  return result;
}

- (id)highlightedLanes
{
  NSArray *lanes;
  id v3;
  uint64_t v4;

  lanes = self->_lanes;
  v3 = -[NavSignLaneGuidanceInfo highlightedLaneRange](self, "highlightedLaneRange");
  return -[NSArray subarrayWithRange:](lanes, "subarrayWithRange:", v3, v4);
}

- (NSUUID)laneInfoId
{
  return self->_laneInfoId;
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (BOOL)isForManeuver
{
  return self->_isForManeuver;
}

- (NSArray)textAlternatives
{
  return self->_textAlternatives;
}

- (NSArray)midStepTitles
{
  return self->_midStepTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midStepTitles, 0);
  objc_storeStrong((id *)&self->_textAlternatives, 0);
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_laneInfoId, 0);
}

@end
