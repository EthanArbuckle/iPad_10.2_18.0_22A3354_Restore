@implementation CLDurianCommuteStats

- (CLDurianCommuteStats)initWithNVP:(CLNameValuePair)a3
{
  CLDurianCommuteStats *v3;
  _BYTE v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLDurianCommuteStats;
  v3 = -[CLDurianCommuteStats init](&v6, "init");
  if (v3)
  {
    -[CLDurianCommuteStats setCarryingItems:](v3, "setCarryingItems:", objc_opt_new(NSMutableSet));
    -[CLDurianCommuteStats setItemJourneyStats:](v3, "setItemJourneyStats:", objc_opt_new(NSMutableDictionary));
    sub_100525028(v5);
    -[CLDurianCommuteStats updateStatsWithNVP:](v3, "updateStatsWithNVP:", v5);
    sub_10011A5A8(v5);
  }
  return v3;
}

- (void)updateStatsWithNVP:(CLNameValuePair)a3
{
  void **v3;
  NSDate *v5;
  double v6;
  NSDate *v7;
  double v8;
  int64_t v9;
  _QWORD v10[2];
  uint64_t v11;
  double v12;

  v3 = a3._vptr$CLNameValuePair;
  v12 = 0.0;
  if (sub_1001FD98C((uint64_t)a3._vptr$CLNameValuePair, (const char *)objc_msgSend(CFSTR("kCLDurianCommuteMetricsKeyStartDate"), "UTF8String", a3._vptr$CLNameValuePair, a3.fDictionary), &v12))
  {
    v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v12);
    if (!-[CLDurianCommuteStats startDate](self, "startDate")
      || (-[NSDate timeIntervalSinceDate:](-[CLDurianCommuteStats startDate](self, "startDate"), "timeIntervalSinceDate:", v5), v6 > 0.0))
    {
      -[CLDurianCommuteStats setStartDate:](self, "setStartDate:", v5);
    }
  }
  if (sub_1001FD98C((uint64_t)v3, (const char *)objc_msgSend(CFSTR("kCLDurianCommuteMetricsKeyEndDate"), "UTF8String"), &v12))
  {
    v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v12);
    if (!-[CLDurianCommuteStats endDate](self, "endDate")
      || (-[NSDate timeIntervalSinceDate:](-[CLDurianCommuteStats endDate](self, "endDate"), "timeIntervalSinceDate:", v7), v8 < 0.0))
    {
      -[CLDurianCommuteStats setEndDate:](self, "setEndDate:", v7);
    }
  }
  v11 = 0;
  sub_10052655C((uint64_t)v3, (const char *)objc_msgSend(CFSTR("kCLDurianCommuteMetricsKeyJourneyCount"), "UTF8String"), &v11);
  v9 = -[CLDurianCommuteStats deviceJourneyCount](self, "deviceJourneyCount");
  -[CLDurianCommuteStats setDeviceJourneyCount:](self, "setDeviceJourneyCount:", v11 + v9);
  sub_100119F3C(v10);
  sub_100006BB4((uint64_t)v3, (const char *)objc_msgSend(CFSTR("kCLDurianCommuteMetricsKeyItemJourneyCounts"), "UTF8String"), v10);
  sub_100525A8C((uint64_t)v10);
}

- (CLNameValuePair)getNVPFromStats
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  void **v17;
  __CFDictionary *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _BYTE v25[128];
  CLNameValuePair result;

  v4 = v2;
  sub_100119F3C();
  v5 = (const char *)objc_msgSend(CFSTR("kCLDurianCommuteMetricsKeyStartDate"), "UTF8String");
  -[NSDate timeIntervalSinceReferenceDate](-[CLDurianCommuteStats startDate](self, "startDate"), "timeIntervalSinceReferenceDate");
  v24[0] = v6;
  sub_10018A4CC(v4, v5, v24);
  v7 = (const char *)objc_msgSend(CFSTR("kCLDurianCommuteMetricsKeyEndDate"), "UTF8String");
  -[NSDate timeIntervalSinceReferenceDate](-[CLDurianCommuteStats endDate](self, "endDate"), "timeIntervalSinceReferenceDate");
  v24[0] = v8;
  sub_10018A4CC(v4, v7, v24);
  v9 = (const char *)objc_msgSend(CFSTR("kCLDurianCommuteMetricsKeyJourneyCount"), "UTF8String");
  v24[0] = -[CLDurianCommuteStats deviceJourneyCount](self, "deviceJourneyCount");
  sub_1005282E8(v4, v9, v24);
  sub_100119F3C();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = -[NSMutableDictionary keyEnumerator](-[CLDurianCommuteStats itemJourneyStats](self, "itemJourneyStats"), "keyEnumerator");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13);
        v15 = -[NSMutableDictionary objectForKey:](-[CLDurianCommuteStats itemJourneyStats](self, "itemJourneyStats"), "objectForKey:", v14);
        v16 = (const char *)objc_msgSend(objc_msgSend(v14, "UUIDString"), "UTF8String");
        v19 = objc_msgSend(v15, "journeyCount");
        sub_1005282E8((uint64_t)v24, v16, &v19);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v11);
  }
  sub_1000CADE4(v4, (const char *)objc_msgSend(CFSTR("kCLDurianCommuteMetricsKeyItemJourneyCounts"), "UTF8String"), (uint64_t)v24);
  v17 = (void **)sub_10011A5A8(v24);
  result.fDictionary = v18;
  result._vptr$CLNameValuePair = v17;
  return result;
}

- (CLDurianCommuteStats)initWithDate:(id)a3
{
  CLDurianCommuteStats *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLDurianCommuteStats;
  v4 = -[CLDurianCommuteStats init](&v6, "init");
  if (v4)
  {
    -[CLDurianCommuteStats setStartDate:](v4, "setStartDate:", objc_msgSend(a3, "startDayOfWeek"));
    -[CLDurianCommuteStats setEndDate:](v4, "setEndDate:", -[NSDate dateByAddingTimeInterval:](v4->_startDate, "dateByAddingTimeInterval:", 604800.0));
    -[CLDurianCommuteStats setDeviceJourneyCount:](v4, "setDeviceJourneyCount:", 0);
    -[CLDurianCommuteStats setCarryingItems:](v4, "setCarryingItems:", objc_opt_new(NSMutableSet));
    -[CLDurianCommuteStats setItemJourneyStats:](v4, "setItemJourneyStats:", objc_opt_new(NSMutableDictionary));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianCommuteStats;
  -[CLDurianCommuteStats dealloc](&v3, "dealloc");
}

- (void)resetWithDate:(id)a3
{
  -[CLDurianCommuteStats setStartDate:](self, "setStartDate:", objc_msgSend(a3, "startDayOfWeek"));
  -[CLDurianCommuteStats setEndDate:](self, "setEndDate:", -[NSDate dateByAddingTimeInterval:](self->_startDate, "dateByAddingTimeInterval:", 604800.0));
  -[CLDurianCommuteStats setDeviceJourneyCount:](self, "setDeviceJourneyCount:", 0);
  -[NSMutableSet removeAllObjects](-[CLDurianCommuteStats carryingItems](self, "carryingItems"), "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](-[CLDurianCommuteStats itemJourneyStats](self, "itemJourneyStats"), "removeAllObjects");
}

- (BOOL)containsDate:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceDate:", -[CLDurianCommuteStats startDate](self, "startDate"));
  return v3 < 604800.0 && v3 >= 0.0;
}

- (void)removeAllCarryingItems
{
  -[NSMutableSet removeAllObjects](-[CLDurianCommuteStats carryingItems](self, "carryingItems"), "removeAllObjects");
}

- (void)addCarryingItem:(id)a3
{
  -[NSMutableSet addObject:](-[CLDurianCommuteStats carryingItems](self, "carryingItems"), "addObject:", a3);
}

- (void)completeJourney
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CLDurianJourneyStats *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[CLDurianCommuteStats setDeviceJourneyCount:](self, "setDeviceJourneyCount:", (char *)-[CLDurianCommuteStats deviceJourneyCount](self, "deviceJourneyCount") + 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[CLDurianCommuteStats carryingItems](self, "carryingItems", 0);
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (CLDurianJourneyStats *)-[NSMutableDictionary objectForKey:](-[CLDurianCommuteStats itemJourneyStats](self, "itemJourneyStats"), "objectForKey:", v8);
        if (!v9)
        {
          v9 = objc_alloc_init(CLDurianJourneyStats);
          -[NSMutableDictionary setObject:forKey:](-[CLDurianCommuteStats itemJourneyStats](self, "itemJourneyStats"), "setObject:forKey:", v9, v8);
        }
        -[CLDurianJourneyStats setJourneyCount:](v9, "setJourneyCount:", (char *)-[CLDurianJourneyStats journeyCount](v9, "journeyCount") + 1);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  -[NSMutableSet removeAllObjects](-[CLDurianCommuteStats carryingItems](self, "carryingItems"), "removeAllObjects");
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)deviceJourneyCount
{
  return self->_deviceJourneyCount;
}

- (void)setDeviceJourneyCount:(int64_t)a3
{
  self->_deviceJourneyCount = a3;
}

- (NSMutableDictionary)itemJourneyStats
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemJourneyStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)carryingItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCarryingItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
