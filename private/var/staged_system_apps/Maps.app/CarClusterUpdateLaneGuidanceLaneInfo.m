@implementation CarClusterUpdateLaneGuidanceLaneInfo

+ (id)laneGuidanceLaneInfoUpdateWithComposedRouteLaneInfos:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  _QWORD v9[4];
  id v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "isPreferredLaneForManeuver") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C41FC0;
  v9[3] = &unk_1011E9A38;
  v11 = (char)v4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

- (CarClusterUpdateLaneGuidanceLaneInfo)initWithComposedRouteLaneInfo:(id)a3 atIndex:(unint64_t)a4 highlightFirstAngle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CarClusterUpdateLaneGuidanceLaneInfo *v9;
  _UNKNOWN **v10;
  uint64_t v11;
  NSNumber *index;
  __int16 v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  _BOOL8 v21;
  _UNKNOWN **v22;
  id v23;
  void *v24;
  void *v25;
  NSNumber *angleHighlight;
  uint64_t v27;
  id v28;
  NSArray *angle;
  id obj;
  NSArray *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];

  v5 = a5;
  v8 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CarClusterUpdateLaneGuidanceLaneInfo;
  v9 = -[CarClusterUpdateLaneGuidanceLaneInfo init](&v37, "init");
  if (!v9)
    goto LABEL_20;
  v10 = MKPlaceCollectionsLogicController_ptr;
  v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  index = v9->_index;
  v9->_index = (NSNumber *)v11;

  v9->_status = 0;
  if ((objc_msgSend(v8, "isPreferredLaneForManeuver") & 1) != 0)
  {
    v13 = 2;
LABEL_6:
    v9->_status = v13;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isLaneForManeuver"))
  {
    v13 = 1;
    goto LABEL_6;
  }
LABEL_7:
  v32 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "directions"));
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v17);
        -[CarClusterUpdateLaneGuidanceLaneInfo _angleFromLaneDirection:](v9, "_angleFromLaneDirection:", objc_msgSend(v18, "direction"));
        v20 = v19;
        if (!v5)
          goto LABEL_14;
        v21 = v5;
        v22 = v10;
        v23 = v8;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "directions"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));

        v8 = v23;
        v10 = v22;
        v5 = v21;
        if (v18 == v25)
        {
          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[370], "numberWithDouble:", v20));
          angleHighlight = v9->_angleHighlight;
          v9->_angleHighlight = (NSNumber *)v27;
        }
        else
        {
LABEL_14:
          angleHighlight = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[370], "numberWithDouble:", v20));
          -[NSArray addObject:](v32, "addObject:", angleHighlight);
        }

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      v15 = v28;
    }
    while (v28);
  }

  angle = v9->_angle;
  v9->_angle = v32;

LABEL_20:
  return v9;
}

- (double)_angleFromLaneDirection:(int)a3
{
  double result;

  result = 0.0;
  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 == 256)
      {
        return 180.0;
      }
      else if (a3 == 128)
      {
        return -45.0;
      }
    }
    else if (a3 == 32)
    {
      return -135.0;
    }
    else if (a3 == 64)
    {
      return -90.0;
    }
  }
  else if (a3 > 7)
  {
    if (a3 == 8)
    {
      return 135.0;
    }
    else if (a3 == 16)
    {
      return -180.0;
    }
  }
  else if (a3 == 2)
  {
    return 45.0;
  }
  else if (a3 == 4)
  {
    return 90.0;
  }
  return result;
}

+ (id)_enumProperties
{
  if (qword_1014D4560 != -1)
    dispatch_once(&qword_1014D4560, &stru_1011E9A58);
  return (id)qword_1014D4568;
}

+ (id)_integersKeyed
{
  if (qword_1014D4570 != -1)
    dispatch_once(&qword_1014D4570, &stru_1011E9A78);
  return (id)qword_1014D4578;
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIndex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned __int16)a3
{
  self->_status = a3;
}

- (NSArray)angle
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAngle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)angleHighlight
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAngleHighlight:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_angleHighlight, 0);
  objc_storeStrong((id *)&self->_angle, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end
