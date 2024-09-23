@implementation CRLiOSGestureDispatcherLogger

- (void)setLogNextGesture:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("TSDDebugDumpNextTextGesture"));

}

- (BOOL)logNextGesture
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("TSDDebugDumpNextTextGesture"));

  return v3;
}

- (void)startGestureLoggingSession
{
  NSMutableDictionary *v3;

  if (-[CRLiOSGestureDispatcherLogger logNextGesture](self, "logNextGesture"))
  {
    v3 = objc_opt_new(NSMutableDictionary);
    -[CRLiOSGestureDispatcherLogger setGestureLogDictionary:](self, "setGestureLogDictionary:", v3);

    -[CRLiOSGestureDispatcherLogger setGestureSessionStarted:](self, "setGestureSessionStarted:", 1);
  }
}

- (void)logStartStateForGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (-[CRLiOSGestureDispatcherLogger logNextGesture](self, "logNextGesture"))
  {
    if (!-[CRLiOSGestureDispatcherLogger gestureSessionStarted](self, "gestureSessionStarted"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243210);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0A458();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243230);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logStartStateForGesture:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 59, 0, "The gesture session should have been started before logging");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSGestureDispatcherLogger gestureLogDictionary](self, "gestureLogDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

    if (!v10)
    {
      v10 = objc_opt_new(NSMutableDictionary);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, CFSTR("gestureKind"));

      v12 = objc_opt_new(NSMutableArray);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, CFSTR("allTouchesArray"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "inputType")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, CFSTR("inputType"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedGestureTarget"));
      v15 = objc_opt_respondsToSelector(v14, "targetStateForGestureLog");

      if ((v15 & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedGestureTarget"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "targetStateForGestureLog"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, CFSTR("targetStartState"));

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "tsdModifierFlags")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v18, CFSTR("modifierFlags"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSGestureDispatcherLogger gestureLogDictionary](self, "gestureLogDictionary"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, v20);

    }
  }

}

- (void)logGesture:(id)a3 atUnscaledLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (-[CRLiOSGestureDispatcherLogger logNextGesture](self, "logNextGesture"))
  {
    if (!-[CRLiOSGestureDispatcherLogger gestureSessionStarted](self, "gestureSessionStarted"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243250);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0A578();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243270);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logGesture:atUnscaledLocation:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 80, 0, "The gesture session should have been started before logging");

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSGestureDispatcherLogger gestureLogDictionary](self, "gestureLogDictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "gestureKind"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

    if (v13)
    {
      v14 = objc_opt_new(NSMutableDictionary);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "gestureState")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, CFSTR("gestureState"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", x));
      v21[0] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", y));
      v21[1] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, CFSTR("locationInView"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("allTouchesArray")));
      objc_msgSend(v19, "addObject:", v14);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243290);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0A4D8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012432B0);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v20);
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logGesture:atUnscaledLocation:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v19, 83, 0, "invalid nil value for '%{public}s'", "singleGestureStateDictionary");
    }

  }
}

- (void)logEndStateForGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (-[CRLiOSGestureDispatcherLogger logNextGesture](self, "logNextGesture"))
  {
    if (!-[CRLiOSGestureDispatcherLogger gestureSessionStarted](self, "gestureSessionStarted"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012432D0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0A698();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012432F0);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logEndStateForGesture:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 96, 0, "The gesture session should have been started before logging");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSGestureDispatcherLogger gestureLogDictionary](self, "gestureLogDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedGestureTarget"));
      v12 = objc_opt_respondsToSelector(v11, "targetStateForGestureLog");

      if ((v12 & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedGestureTarget"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "targetStateForGestureLog"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("targetEndState"));

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSGestureDispatcherLogger gestureLogDictionary](self, "gestureLogDictionary"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v16);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243310);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0A5F8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243330);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logEndStateForGesture:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 98, 0, "invalid nil value for '%{public}s'", "singleGestureStateDictionary");
    }

  }
}

- (void)endGestureLoggingSession
{
  void *v3;
  void *v4;
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (-[CRLiOSGestureDispatcherLogger logNextGesture](self, "logNextGesture"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSGestureDispatcherLogger gestureLogDictionary](self, "gestureLogDictionary"));
    v10 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 1, &v10));

    v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("CRLGestureDispatcherLog.json")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v9, "createFileAtPath:contents:attributes:", v8, v4, 0);

    -[CRLiOSGestureDispatcherLogger setGestureLogDictionary:](self, "setGestureLogDictionary:", 0);
    -[CRLiOSGestureDispatcherLogger setLogNextGesture:](self, "setLogNextGesture:", 0);
    -[CRLiOSGestureDispatcherLogger setGestureSessionStarted:](self, "setGestureSessionStarted:", 0);

  }
}

- (BOOL)gestureSessionStarted
{
  return self->_gestureSessionStarted;
}

- (void)setGestureSessionStarted:(BOOL)a3
{
  self->_gestureSessionStarted = a3;
}

- (NSMutableDictionary)gestureLogDictionary
{
  return self->_gestureLogDictionary;
}

- (void)setGestureLogDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_gestureLogDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureLogDictionary, 0);
}

@end
