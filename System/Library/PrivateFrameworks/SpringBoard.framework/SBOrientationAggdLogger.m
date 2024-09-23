@implementation SBOrientationAggdLogger

- (void)_keyboardDidShow:(id)a3
{
  self->_isKeyboardOnScreen = 1;
  self->_keyboardOnScreenStartTime = mach_absolute_time();
}

- (void)_keyboardWillHide:(id)a3
{
  double v4;

  SBOrientationKeyboardUsageTimeAggdKey(self->_currentOrientation);
  -[SBOrientationAggdLogger _bucketedElapsedTimeWithStartTime:](self, "_bucketedElapsedTimeWithStartTime:", self->_currentOrientationStartTime);
  if ((unint64_t)v4)
    ADClientPushValueForDistributionKey();
  self->_isKeyboardOnScreen = 0;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  int v8;
  NSArray *currentElements;
  void *v10;
  int64_t currentOrientation;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  NSArray *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMainDisplay");

  if (v8)
  {
    currentElements = self->_currentElements;
    objc_msgSend(v6, "elements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqualToArray:](currentElements, "isEqualToArray:", v10))
    {
      currentOrientation = self->_currentOrientation;
      v12 = objc_msgSend(v6, "interfaceOrientation");

      if (currentOrientation == v12)
        goto LABEL_19;
    }
    else
    {

    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = self->_currentElements;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "isUIApplicationElement", (_QWORD)v29);
          objc_msgSend(v18, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19)
          {
            SBOrientationAppUsageTimeAggdKey((uint64_t)v20, self->_currentOrientation);
          }
          else
          {
            objc_msgSend(v20, "pathExtension");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            SBOrientationSpringBoardUsageTimeAggdKey((uint64_t)v22, self->_currentOrientation);

          }
          -[SBOrientationAggdLogger _bucketedElapsedTimeWithStartTime:](self, "_bucketedElapsedTimeWithStartTime:", self->_currentOrientationStartTime);
          if ((unint64_t)v23)
            ADClientPushValueForDistributionKey();
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

    -[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentOrientation = objc_msgSend(v24, "interfaceOrientation");

    self->_currentOrientationStartTime = mach_absolute_time();
    -[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "elements");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (NSArray *)objc_msgSend(v26, "copy");
    v28 = self->_currentElements;
    self->_currentElements = v27;

  }
LABEL_19:

}

- (double)_bucketedElapsedTimeWithStartTime:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  mach_timebase_info info;

  if (*(double *)&_bucketedElapsedTimeWithStartTime__timebaseFactor == 0.0)
  {
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v5) = info.denom;
    LODWORD(v4) = info.numer;
    *(double *)&_bucketedElapsedTimeWithStartTime__timebaseFactor = (double)v4 / (double)v5 * 0.000000001;
  }
  v6 = mach_absolute_time();
  v7 = 0;
  result = 3600.0;
  while (*(double *)&_bucketedElapsedTimeWithStartTime__timebaseFactor * (double)(v6 - a3) >= (double)_bucketedElapsedTimeWithStartTime__buckets[v7])
  {
    if (++v7 == 8)
      return result;
  }
  if ((int)v7 <= 1)
    LODWORD(v7) = 1;
  return (double)_bucketedElapsedTimeWithStartTime__buckets[(v7 - 1)];
}

- (SBOrientationAggdLogger)init
{
  SBOrientationAggdLogger *v2;
  uint64_t v3;
  FBSDisplayLayoutMonitor *layoutMonitor;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *currentElements;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBOrientationAggdLogger;
  v2 = -[SBOrientationAggdLogger init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D230D0], "sharedMonitorForDisplayType:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v3;

    -[FBSDisplayLayoutMonitor addObserver:](v2->_layoutMonitor, "addObserver:", v2);
    -[FBSDisplayLayoutMonitor currentLayout](v2->_layoutMonitor, "currentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_currentOrientation = objc_msgSend(v5, "interfaceOrientation");

    v2->_currentOrientationStartTime = mach_absolute_time();
    -[FBSDisplayLayoutMonitor currentLayout](v2->_layoutMonitor, "currentLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    currentElements = v2->_currentElements;
    v2->_currentElements = (NSArray *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__noteSignificantTimeChanged_, CFSTR("SBSignificantTimeChangedNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__orientationLockChanged_, *MEMORY[0x1E0DAC368], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[FBSDisplayLayoutMonitor removeObserver:](self->_layoutMonitor, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBOrientationAggdLogger;
  -[SBOrientationAggdLogger dealloc](&v4, sel_dealloc);
}

- (void)_noteSignificantTimeChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSignificantTimeChangeWasMidnight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    -[SBOrientationAggdLogger _saveOrientationLockAggdValues](self, "_saveOrientationLockAggdValues");
}

- (void)_saveOrientationLockAggdValues
{
  void *v2;
  id v3;

  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isUserLocked");

  ADClientSetValueForScalarKey();
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLockOrientation");
  ADClientSetValueForScalarKey();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentElements, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end
