@implementation CRLMultiRepRotateTracker

- (CRLMultiRepRotateTracker)initWithReps:(id)a3
{
  id v4;
  CRLMultiRepRotateTracker *v5;
  CRLMultiRepRotateTracker *v6;
  uint64_t v7;
  NSArray *trackers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLMultiRepRotateTracker;
  v5 = -[CRLMultiRepRotateTracker init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CRLMultiRepRotateTracker p_trackersForReps:](v5, "p_trackersForReps:", v4));
    trackers = v6->_trackers;
    v6->_trackers = (NSArray *)v7;

  }
  return v6;
}

- (NSSet)repsBeingRotated
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_trackers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "rep", (_QWORD)v11));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (CGPoint)unscaledCenterForRotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  if (!-[NSArray count](self->_trackers, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BBD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17DA4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BBF8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultiRepRotateTracker unscaledCenterForRotation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMultiRepRotateTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 45, 0, "Must have at least one tracker to ask for its center of rotation");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_trackers, "firstObject"));
  objc_msgSend(v6, "unscaledCenterForRotation");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setUnscaledCenterForRotation:(CGPoint)a3
{
  double y;
  double x;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  y = a3.y;
  x = a3.x;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_trackers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setUnscaledCenterForRotation:", x, y, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (double)currentTotalAngleOfRotationInRadians
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!-[NSArray count](self->_trackers, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BC18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17E28();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BC38);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultiRepRotateTracker currentTotalAngleOfRotationInRadians]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMultiRepRotateTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 58, 0, "Must have at least one tracker to ask for its total angle of rotation");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_trackers, "firstObject"));
  objc_msgSend(v6, "currentTotalAngleOfRotationInRadians");
  v8 = v7;

  return v8;
}

- (id)p_trackersForReps:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  CRLCanvasRepRotateTracker *v24;
  CRLCanvasRepRotateTracker *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CRLMultiRepRotateTracker p_unscaledBoundingRectForReps:](self, "p_unscaledBoundingRectForReps:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = sub_100061400(v7, v9, v11, v13);
    v19 = v18;
    v20 = *(_QWORD *)v29;
    v21 = 1;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v14);
        v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v22);
        v24 = [CRLCanvasRepRotateTracker alloc];
        v25 = -[CRLCanvasRepRotateTracker initWithRep:](v24, "initWithRep:", v23, (_QWORD)v28);
        -[CRLCanvasRepRotateTracker setUnscaledCenterForRotation:](v25, "setUnscaledCenterForRotation:", v17, v19);
        -[CRLCanvasRepRotateTracker setShouldShowGuides:](v25, "setShouldShowGuides:", v21 & 1);
        -[CRLCanvasRepRotateTracker setSnapThreshold:](v25, "setSnapThreshold:", 0.0);
        -[CRLCanvasRepRotateTracker setShouldShowHUD:](v25, "setShouldShowHUD:", 0);
        objc_msgSend(v5, "addObject:", v25);

        v21 = 0;
        v22 = (char *)v22 + 1;
      }
      while (v16 != v22);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v21 = 0;
    }
    while (v16);
  }

  v26 = objc_msgSend(v5, "copy");
  return v26;
}

- (CGRect)p_unscaledBoundingRectForReps:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL IsNull;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  CGRect v39;
  CGRect v40;
  CGRect result;

  v3 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "boundsForStandardKnobs");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        IsNull = CGRectIsNull(v39);
        objc_msgSend(v12, "convertNaturalRectToUnscaledCanvas:", v14, v16, v18, v20);
        v26 = v22;
        v27 = v23;
        v28 = v24;
        v29 = v25;
        if (!IsNull)
        {
          v40.origin.x = x;
          v40.origin.y = y;
          v40.size.width = width;
          v40.size.height = height;
          *(CGRect *)&v22 = CGRectUnion(v40, *(CGRect *)&v26);
        }
        x = v22;
        y = v23;
        width = v24;
        height = v25;
      }
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v9);
  }

  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)addRotateDelta:(double)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_trackers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "addRotateDelta:", a3, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (double)snapThreshold
{
  return 0.0;
}

- (void)setScaledHUDPosition:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_trackers, "firstObject"));
  objc_msgSend(v5, "setScaledHUDPosition:", x, y);

}

- (BOOL)isEnqueueingCommandsInRealTime
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  unsigned int v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_trackers, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasController"));
  v6 = objc_msgSend(v5, "shouldSupportedDynamicOperationsEnqueueCommandsInRealTime");

  if (!v6)
    return 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_trackers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "rep", (_QWORD)v16));
        v13 = objc_msgSend(v12, "allowsSupportedDynamicOperationsToBeRealTime");

        if (!v13)
        {
          v14 = 0;
          goto LABEL_13;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_trackers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rep", (_QWORD)v11));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
        objc_msgSend(v8, "changeDynamicLayoutsForReps:", v10);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)commitChangesForReps:(id)a3
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_trackers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rep", (_QWORD)v11));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
        objc_msgSend(v8, "commitChangesForReps:", v10);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 1;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->_isInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->_isInspectorDrivenTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackers, 0);
}

@end
