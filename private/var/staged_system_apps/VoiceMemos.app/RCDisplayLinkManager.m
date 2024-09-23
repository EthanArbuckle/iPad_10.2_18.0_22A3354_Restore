@implementation RCDisplayLinkManager

- (void)_pauseDisplayLink
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[CADisplayLink isPaused](self->_displayLink, "isPaused"))
  {
    v3 = OSLogForCategory(kVMLogCategoryDefault);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10010BE5C(v4, v5, v6, v7, v8, v9, v10, v11);

    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  }
}

- (RCDisplayLinkManager)init
{
  RCDisplayLinkManager *v2;
  uint64_t v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSHashTable *observers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RCDisplayLinkManager;
  v2 = -[RCDisplayLinkManager init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", v2, "_displayLinkDidUpdate:"));
    displayLink = v2->_displayLink;
    v2->_displayLink = (CADisplayLink *)v3;

    v5 = v2->_displayLink;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, NSRunLoopCommonModes);

    -[RCDisplayLinkManager _pauseDisplayLink](v2, "_pauseDisplayLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, v8);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, v8);
    v9 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

  }
  return v2;
}

- (void)setTimeController:(id)a3
{
  objc_storeStrong((id *)&self->_timeController, a3);
}

- (void)_startDisplayLinkIfNeeded
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (-[NSHashTable count](self->_observers, "count") && -[CADisplayLink isPaused](self->_displayLink, "isPaused"))
  {
    v3 = OSLogForCategory(kVMLogCategoryDefault);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10010BECC(v4, v5, v6, v7, v8, v9, v10, v11);

    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  -[RCDisplayLinkManager _startDisplayLinkIfNeeded](self, "_startDisplayLinkIfNeeded", a3);
}

+ (RCDisplayLinkManager)sharedManager
{
  if (qword_1001ED8D8 != -1)
    dispatch_once(&qword_1001ED8D8, &stru_1001AC4D0);
  return (RCDisplayLinkManager *)(id)qword_1001ED8D0;
}

- (void)setPaused:(BOOL)a3
{
  if (a3)
    -[RCDisplayLinkManager _pauseDisplayLink](self, "_pauseDisplayLink");
  else
    -[RCDisplayLinkManager _startDisplayLinkIfNeeded](self, "_startDisplayLinkIfNeeded");
}

- (BOOL)paused
{
  return -[CADisplayLink isPaused](self->_displayLink, "isPaused");
}

- (void)addDisplayLinkObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
  -[RCDisplayLinkManager _startDisplayLinkIfNeeded](self, "_startDisplayLinkIfNeeded");
}

- (void)removeDisplayLinkObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
    -[RCDisplayLinkManager _pauseDisplayLink](self, "_pauseDisplayLink");
}

- (void)_displayLinkDidUpdate:(id)a3
{
  id v4;
  RCTimeController *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = self->_timeController;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "displayLinkDidUpdate:withTimeController:", v4, v5);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred;
  float maximum;
  float minimum;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  CAFrameRateRange v12;
  CAFrameRateRange v13;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  -[CADisplayLink preferredFrameRateRange](self->_displayLink, "preferredFrameRateRange");
  v13.minimum = minimum;
  v13.maximum = maximum;
  v13.preferred = preferred;
  if (!CAFrameRateRangeIsEqualToRange(v12, v13))
  {
    *(float *)&v7 = minimum;
    *(float *)&v8 = maximum;
    *(float *)&v9 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", v7, v8, v9);
    v10 = OSLogForCategory(kVMLogCategoryDefault);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10010BF3C(v11, preferred);

  }
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float v2;
  float v3;
  float v4;
  CAFrameRateRange result;

  -[CADisplayLink preferredFrameRateRange](self->_displayLink, "preferredFrameRateRange");
  result.preferred = v4;
  result.maximum = v3;
  result.minimum = v2;
  return result;
}

- (RCTimeController)timeController
{
  return self->_timeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
