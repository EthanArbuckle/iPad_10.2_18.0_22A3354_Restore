@implementation PXUserEventTrackerCommon

- (void)setCurrentTab:(unint64_t)a3
{
  self->_currentTab = a3;
}

- (PXUserEventTrackerCommon)init
{
  PXUserEventTrackerCommon *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUserEventTrackerCommon;
  result = -[PXUserEventTrackerCommon init](&v3, sel_init);
  if (result)
  {
    result->_currentSessionSource = 27;
    result->_currentSessionTab = 0;
    result->_currentLogStateStartDate = 0.0;
    result->_currentLogSubStateStartDate = 0.0;
    result->_applicationIsInForeground = 1;
    result->_enableDetailedDebugLogging = 0;
  }
  return result;
}

- (void)applicationWillEnterForeground:(id)a3
{
  unint64_t currentSessionSource;
  id WeakRetained;

  currentSessionSource = self->_currentSessionSource;
  WeakRetained = objc_loadWeakRetained(&self->_currentSessionSender);
  -[PXUserEventTrackerCommon _setCurrentSessionSource:sender:isInForeground:](self, "_setCurrentSessionSource:sender:isInForeground:", currentSessionSource, WeakRetained, 1);

}

- (void)_setCurrentSessionSource:(unint64_t)a3 sender:(id)a4 isInForeground:(BOOL)a5
{
  int v5;
  id v8;
  id WeakRetained;
  int applicationIsInForeground;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  _BOOL8 v18;
  id obj;

  v5 = a5;
  v8 = a4;
  obj = v8;
  if (self->_currentSessionSource == a3)
  {
    WeakRetained = objc_loadWeakRetained(&self->_currentSessionSender);
    if (WeakRetained == obj)
    {
      applicationIsInForeground = self->_applicationIsInForeground;

      v8 = obj;
      if (applicationIsInForeground == v5)
        goto LABEL_55;
    }
    else
    {

      v8 = obj;
    }
  }
  if (a3 == 27)
  {
    if (self->_currentSessionSource == 5)
      a3 = 3;
    else
      a3 = 27;
  }
  if ((v5 & 1) != 0)
  {
    v11 = 0;
    v12 = 0;
    v13 = 1;
    v14 = 3;
    v15 = 0;
    switch(a3)
    {
      case 3uLL:
      case 5uLL:
        break;
      case 4uLL:
        v11 = 0;
        v12 = 0;
        v15 = 0;
        v13 = 1;
        goto LABEL_23;
      case 6uLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v14 = 4;
        v11 = 1;
        break;
      case 7uLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v11 = 2;
        goto LABEL_23;
      case 8uLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v11 = 3;
        goto LABEL_23;
      case 9uLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v14 = 4;
        v11 = 4;
        break;
      case 0xAuLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v11 = 5;
        goto LABEL_23;
      case 0xBuLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v11 = 6;
LABEL_23:
        v14 = 4;
        break;
      case 0xCuLL:
        v11 = 7;
        goto LABEL_25;
      case 0xFuLL:
        v11 = 0;
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v14 = 13;
        break;
      case 0x11uLL:
        v11 = 0;
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v14 = 9;
        break;
      case 0x12uLL:
        v11 = 0;
LABEL_15:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v14 = 10;
        break;
      case 0x13uLL:
        v11 = 0;
LABEL_29:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v14 = 11;
        break;
      case 0x14uLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v11 = 8;
        goto LABEL_33;
      case 0x15uLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v11 = 9;
        goto LABEL_33;
      case 0x16uLL:
        v12 = 0;
        v15 = 0;
        v13 = 1;
        v11 = 10;
LABEL_33:
        v14 = 5;
        break;
      case 0x17uLL:
        v12 = 1;
        v11 = 11;
        v14 = 5;
        v13 = 1;
        v15 = 1;
        break;
      case 0x18uLL:
        v13 = 1;
        v15 = 2;
        goto LABEL_37;
      case 0x19uLL:
        v13 = 1;
        v15 = 3;
        goto LABEL_37;
      case 0x1AuLL:
        v13 = 1;
        v15 = 4;
LABEL_37:
        v11 = 11;
        v14 = 5;
LABEL_38:
        v12 = v13;
        break;
      default:
LABEL_25:
        v15 = 0;
        v13 = 0;
        v14 = 1;
        v12 = 0;
        switch(self->_currentTab)
        {
          case 2uLL:
            v12 = 0;
            v15 = 0;
            v13 = 1;
            v14 = 6;
            break;
          case 3uLL:
            v12 = 0;
            v15 = 0;
            v13 = 1;
            v14 = 7;
            break;
          case 4uLL:
          case 8uLL:
            v12 = 0;
            v15 = 0;
            v13 = 1;
            v14 = 8;
            break;
          case 5uLL:
            v12 = 0;
            v15 = 0;
            v13 = 1;
            goto LABEL_33;
          case 6uLL:
            goto LABEL_15;
          case 7uLL:
            goto LABEL_29;
          case 9uLL:
            goto LABEL_39;
          case 0xAuLL:
            v12 = 0;
            v15 = 0;
            v13 = 1;
            v14 = 12;
            break;
          default:
            goto LABEL_38;
        }
        break;
    }
LABEL_39:
    if (-[PXUserEventTrackerCommon isEventSourceSenderAppearingForTheFirstTime:](self, "isEventSourceSenderAppearingForTheFirstTime:", v8))
    {
      v16 = v13 ^ 1;
      if (v14 == self->_currentLogState)
        v16 = 1;
      if ((v16 & 1) == 0)
        -[PXUserEventTrackerCommon logViewCountForLogState:](self, "logViewCountForLogState:", v14);
      if (v11 && v11 != self->_currentLogSubState)
        -[PXUserEventTrackerCommon logViewCountForLogSubState:](self, "logViewCountForLogSubState:", v11);
      v17 = v12 ^ 1;
      if (v15 == self->_currentLogSubSubState)
        v17 = 1;
      if ((v17 & 1) == 0)
        -[PXUserEventTrackerCommon logViewCountForLogSubSubState:](self, "logViewCountForLogSubSubState:", v15);
    }
  }
  else
  {
    -[PXUserEventTrackerCommon isEventSourceSenderAppearingForTheFirstTime:](self, "isEventSourceSenderAppearingForTheFirstTime:", v8);
    v15 = 0;
    v11 = 0;
    v14 = 2;
  }
  v18 = self->_applicationIsInForeground != v5 || self->_currentSessionTab != self->_currentTab;
  -[PXUserEventTrackerCommon setCurrentLogState:logSubState:logSubSubState:forceLogging:](self, "setCurrentLogState:logSubState:logSubSubState:forceLogging:", v14, v11, v15, v18);
  self->_currentSessionSource = a3;
  objc_storeWeak(&self->_currentSessionSender, obj);
  v8 = obj;
  self->_currentSessionTab = self->_currentTab;
  self->_applicationIsInForeground = v5;
LABEL_55:

}

- (void)eventSourceDidDisappear:(unint64_t)a3 sender:(id)a4
{
  id *p_currentSessionSender;
  id v6;
  id WeakRetained;

  p_currentSessionSender = &self->_currentSessionSender;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(p_currentSessionSender);

  if (WeakRetained == v6)
    -[PXUserEventTrackerCommon _setCurrentSessionSource:sender:isInForeground:](self, "_setCurrentSessionSource:sender:isInForeground:", 27, 0, self->_applicationIsInForeground);
}

- (void)eventSourceWillAppear:(unint64_t)a3 sender:(id)a4
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained(&self->_currentSessionSender);

  v7 = v8;
  if (WeakRetained != v8)
  {
    -[PXUserEventTrackerCommon _setCurrentSessionSource:sender:isInForeground:](self, "_setCurrentSessionSource:sender:isInForeground:", a3, v8, self->_applicationIsInForeground);
    v7 = v8;
  }

}

- (void)eventSourceDidChange:(unint64_t)a3 sender:(id)a4
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained(&self->_currentSessionSender);

  v7 = v8;
  if (WeakRetained == v8)
  {
    -[PXUserEventTrackerCommon _setCurrentSessionSource:sender:isInForeground:](self, "_setCurrentSessionSource:sender:isInForeground:", a3, v8, self->_applicationIsInForeground);
    v7 = v8;
  }

}

- (void)setCurrentLogState:(unint64_t)a3 logSubState:(unint64_t)a4 logSubSubState:(unint64_t)a5 forceLogging:(BOOL)a6
{
  _BOOL4 v6;
  unint64_t currentLogSubState;
  double v12;
  unint64_t currentLogSubSubState;
  double v14;
  double v16;

  v6 = a6;
  currentLogSubState = self->_currentLogSubState;
  if (currentLogSubState != a4)
  {
    if (currentLogSubState)
    {
      v12 = CFAbsoluteTimeGetCurrent() - self->_currentLogSubStateStartDate;
      if (v12 < 0.0)
        v12 = 0.0;
      -[PXUserEventTrackerCommon logCounterValuesForLogSubState:duration:](self, "logCounterValuesForLogSubState:duration:", self->_currentLogSubState, v12);
    }
    self->_currentLogSubState = a4;
    self->_currentLogSubStateStartDate = CFAbsoluteTimeGetCurrent();
  }
  currentLogSubSubState = self->_currentLogSubSubState;
  if (currentLogSubSubState != a5)
  {
    if (currentLogSubSubState)
    {
      v14 = CFAbsoluteTimeGetCurrent() - self->_currentLogSubSubStateStartDate;
      if (v14 < 0.0)
        v14 = 0.0;
      -[PXUserEventTrackerCommon logCounterValuesForLogSubSubState:duration:](self, "logCounterValuesForLogSubSubState:duration:", self->_currentLogSubSubState, v14);
    }
    self->_currentLogSubSubState = a5;
    self->_currentLogSubSubStateStartDate = CFAbsoluteTimeGetCurrent();
  }
  if (self->_currentLogState != a3 || v6)
  {
    v16 = CFAbsoluteTimeGetCurrent() - self->_currentLogStateStartDate;
    if (v16 < 0.0)
      v16 = 0.0;
    -[PXUserEventTrackerCommon logCounterValuesForLogState:duration:](self, "logCounterValuesForLogState:duration:", self->_currentLogState, v16);
    self->_currentLogState = a3;
    self->_currentLogStateStartDate = CFAbsoluteTimeGetCurrent();
    self->_currentLogSubState = a4;
    self->_currentLogSubStateStartDate = CFAbsoluteTimeGetCurrent();
  }
}

- (BOOL)isEventSourceSenderAppearingForTheFirstTime:(id)a3
{
  return 1;
}

- (void)logCounterValuesForLogSubState:(unint64_t)a3 duration:(double)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUserEventTrackerCommon.m"), 312, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXUserEventTrackerCommon logCounterValuesForLogSubState:duration:]", v8);

  abort();
}

- (void)logCounterValuesForLogState:(unint64_t)a3 duration:(double)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUserEventTrackerCommon.m"), 316, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXUserEventTrackerCommon logCounterValuesForLogState:duration:]", v8);

  abort();
}

- (void)applicationDidEnterBackground:(id)a3
{
  unint64_t currentSessionSource;
  id WeakRetained;

  currentSessionSource = self->_currentSessionSource;
  WeakRetained = objc_loadWeakRetained(&self->_currentSessionSender);
  -[PXUserEventTrackerCommon _setCurrentSessionSource:sender:isInForeground:](self, "_setCurrentSessionSource:sender:isInForeground:", currentSessionSource, WeakRetained, 0);

}

- (void)willViewMemoriesFeedView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startOfDayForDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleForKey:", CFSTR("MemoriesFeedLastVisitTimestampKey"));
  v7 = v6;

  if (v7 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:toDate:options:", 16, v8, v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "day");
    if (v10 >= 1)
      -[PXUserEventTrackerCommon aggregateSetMemoryFeedNumberOfDaysSinceLastVisit:](self, "aggregateSetMemoryFeedNumberOfDaysSinceLastVisit:", v10);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "setDouble:forKey:", CFSTR("MemoriesFeedLastVisitTimestampKey"));

}

- (void)aggregateSetMemoryFeedNumberOfDaysSinceLastVisit:(int64_t)a3
{
  PLSAggregateDictionarySetValueForScalarKey();
}

- (id)PXLogStateDescription:(unint64_t)a3
{
  if (a3 > 0xD)
    return 0;
  else
    return off_1E5146FC8[a3];
}

- (id)PXLogSubStateDescription:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return CFSTR("PXLogSubStateNone");
  else
    return off_1E5147038[a3 - 1];
}

- (id)PXLogSubSubStateDescription:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_1E5147090[a3];
}

- (unint64_t)currentTab
{
  return self->_currentTab;
}

- (BOOL)enableDetailedDebugLogging
{
  return self->_enableDetailedDebugLogging;
}

- (unint64_t)currentLogState
{
  return self->_currentLogState;
}

- (void)setCurrentLogState:(unint64_t)a3
{
  self->_currentLogState = a3;
}

- (unint64_t)currentLogSubState
{
  return self->_currentLogSubState;
}

- (void)setCurrentLogSubState:(unint64_t)a3
{
  self->_currentLogSubState = a3;
}

- (unint64_t)currentLogSubSubState
{
  return self->_currentLogSubSubState;
}

- (void)setCurrentLogSubSubState:(unint64_t)a3
{
  self->_currentLogSubSubState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_currentSessionSender);
}

@end
