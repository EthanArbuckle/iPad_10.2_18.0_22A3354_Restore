@implementation _DASActivityRateLimitTracker

- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3
{
  id v4;
  _DASActivityRateLimitTracker *v5;
  double v6;
  uint64_t v7;
  NSMutableArray *occurrences;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DASActivityRateLimitTracker;
  v5 = -[_DASActivityRateLimitTracker init](&v10, "init");
  if (v5)
  {
    v5->_maximum = (unint64_t)objc_msgSend(v4, "maximum");
    objc_msgSend(v4, "window");
    v5->_window = v6;
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    occurrences = v5->_occurrences;
    v5->_occurrences = (NSMutableArray *)v7;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3 andOccurrences:(id)a4
{
  id v6;
  id v7;
  _DASActivityRateLimitTracker *v8;
  double v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *occurrences;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DASActivityRateLimitTracker;
  v8 = -[_DASActivityRateLimitTracker init](&v14, "init");
  if (v8)
  {
    v8->_maximum = (unint64_t)objc_msgSend(v6, "maximum");
    objc_msgSend(v6, "window");
    v8->_window = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
    occurrences = v8->_occurrences;
    v8->_occurrences = (NSMutableArray *)v11;

    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (unint64_t)occurrencesInWindow:(double)a3 atDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  double v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitTracker occurrences](self, "occurrences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));

  os_unfair_lock_unlock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "timeIntervalSinceDate:", v6, (_QWORD)v20);
        v18 = (double)(int)-v17;
        if (v18 <= a3)
        {
          ++v13;
          objc_msgSend(v7, "addObject:", v16, v18);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v18);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  os_unfair_lock_lock(&self->_lock);
  -[_DASActivityRateLimitTracker setOccurrences:](self, "setOccurrences:", v7);
  os_unfair_lock_unlock(&self->_lock);

  return v13;
}

- (BOOL)timewiseEligibleAtDate:(id)a3 withLPMWindowExtension:(BOOL)a4
{
  id v6;
  double v7;
  unint64_t v8;
  BOOL v9;

  v6 = a3;
  if (a4)
    v7 = 3600.0;
  else
    -[_DASActivityRateLimitTracker window](self, "window");
  v8 = -[_DASActivityRateLimitTracker occurrencesInWindow:atDate:](self, "occurrencesInWindow:atDate:", v6, v7);
  v9 = v8 < -[_DASActivityRateLimitTracker maximum](self, "maximum");

  return v9;
}

- (void)executeAtDate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray addObject:](self->_occurrences, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)nextTimewiseEligibleDateFromDate:(id)a3 withLPMWindowExtension:(BOOL)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  unsigned int v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[NSMutableArray count](self->_occurrences, "count");
  os_unfair_lock_unlock(&self->_lock);
  if (a4)
  {
    v9 = 3600.0;
  }
  else
  {
    -[_DASActivityRateLimitTracker window](self, "window");
    v9 = v10;
  }
  v11 = -[_DASActivityRateLimitTracker occurrencesInWindow:atDate:](self, "occurrencesInWindow:atDate:", v6, v9);
  if (v11 < -[_DASActivityRateLimitTracker maximum](self, "maximum")
    || (v12 = v8 - v11, (v12 & 0x80000000) != 0))
  {
    v15 = v6;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitTracker occurrences](self, "occurrences"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v12));

    os_unfair_lock_unlock(p_lock);
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v14, v9));

  }
  return v15;
}

- (BOOL)onlyExpiredOccurrencesAtDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitTracker occurrences](self, "occurrences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));

  os_unfair_lock_unlock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "timeIntervalSinceDate:", v4, (_QWORD)v17);
        v13 = (double)(int)-v12;
        -[_DASActivityRateLimitTracker window](self, "window");
        if (v14 >= v13)
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (id)description
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_DASActivityRateLimitTracker window](self, "window");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_DASActivityRateLimitTracker occurrencesInWindow:atDate:](self, "occurrencesInWindow:atDate:", v5, v4)));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_maximum));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_window));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Rate Limit - Current:%@ Max:%@ Window:%@>"), v6, v7, v8));

  return v9;
}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(unint64_t)a3
{
  self->_maximum = a3;
}

- (double)window
{
  return self->_window;
}

- (void)setWindow:(double)a3
{
  self->_window = a3;
}

- (NSMutableArray)occurrences
{
  return self->_occurrences;
}

- (void)setOccurrences:(id)a3
{
  objc_storeStrong((id *)&self->_occurrences, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrences, 0);
}

@end
