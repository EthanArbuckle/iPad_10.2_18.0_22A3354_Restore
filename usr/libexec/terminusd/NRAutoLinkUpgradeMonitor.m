@implementation NRAutoLinkUpgradeMonitor

- (id)description
{
  id v3;
  unint64_t identifier;
  unsigned int v5;
  unint64_t totalReceivedUpdates;
  unint64_t v7;
  __CFString *v8;
  const char *v9;
  id v10;

  v3 = objc_alloc((Class)NSString);
  identifier = self->_identifier;
  v5 = -[NRAutoLinkUpgradeMonitor started](self, "started");
  totalReceivedUpdates = self->_totalReceivedUpdates;
  v7 = -[NRAutoLinkUpgradeMonitor lastReceivedAdvice](self, "lastReceivedAdvice");
  v8 = CFSTR("None");
  switch(v7)
  {
    case 0uLL:
      break;
    case 1uLL:
      v8 = CFSTR("BluetoothDefault");
      break;
    case 2uLL:
      v8 = CFSTR("BluetoothClassic");
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      v8 = CFSTR("WiFi");
      break;
    default:
      if (v7 == 128)
        v8 = CFSTR("NoUpgrade");
      else
LABEL_5:
        v8 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown(%llu)"), v7);
      break;
  }
  v9 = "Not-";
  if (v5)
    v9 = "";
  v10 = objc_msgSend(v3, "initWithFormat:", CFSTR("[%llu %sMonitoring %llu %@]"), identifier, v9, totalReceivedUpdates, v8);

  return v10;
}

- (void)dealloc
{
  NRAutoLinkUpgradeMonitor *v2;
  void *v3;
  int IsLevelEnabled;
  NSUUID *nrUUID;
  NSUUID *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v2 = self;
  if (self)
    self = (NRAutoLinkUpgradeMonitor *)self->_nrUUID;
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0);

  if (IsLevelEnabled)
  {
    if (v2)
      nrUUID = v2->_nrUUID;
    else
      nrUUID = 0;
    v6 = nrUUID;
    v8 = (void *)_NRCopyLogObjectForNRUUID(v6, v7);
    _NRLogWithArgs(v8, 0, "%s%.30s:%-4d %@: dealloc", ", "-[NRAutoLinkUpgradeMonitor dealloc]", 397, v2);

  }
  if (v2 && !-[NRAutoLinkUpgradeMonitor cancelled](v2, "cancelled"))
  {
    -[NRAutoLinkUpgradeMonitor setCancelled:](v2, "setCancelled:", 1);
    -[NRAutoLinkUpgradeMonitor setUpdateBlock:](v2, "setUpdateBlock:", 0);
    -[NRAutoLinkUpgradeMonitor invalidateAggregateStatsTimerSource](v2, "invalidateAggregateStatsTimerSource");
    -[NRAutoLinkUpgradeMonitor reportEvent:](v2, "reportEvent:", 30003);
  }
  v9.receiver = v2;
  v9.super_class = (Class)NRAutoLinkUpgradeMonitor;
  -[NRAutoLinkUpgradeMonitor dealloc](&v9, "dealloc");
}

- (void)armWiFiAdviceMonitorTimerSource
{
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  OS_dispatch_source *wifiAdviceMonitorTimerSource;
  NSObject *v8;
  _QWORD handler[4];
  NSObject *v10;
  id v11;
  id location;

  if (!self->_wifiAdviceMonitorTimerSource)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[NRAutoLinkUpgradeMonitor queue](self, "queue"));
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);

    v5 = dispatch_time(0, 1800000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100066E48;
    handler[3] = &unk_1001B87F0;
    objc_copyWeak(&v11, &location);
    v6 = v4;
    v10 = v6;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    wifiAdviceMonitorTimerSource = self->_wifiAdviceMonitorTimerSource;
    self->_wifiAdviceMonitorTimerSource = (OS_dispatch_source *)v6;
    v8 = v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)invalidateWiFiAdviceMonitorTimerSource
{
  NSObject *wifiAdviceMonitorTimerSource;
  OS_dispatch_source *v4;

  wifiAdviceMonitorTimerSource = self->_wifiAdviceMonitorTimerSource;
  if (wifiAdviceMonitorTimerSource)
  {
    dispatch_source_cancel(wifiAdviceMonitorTimerSource);
    v4 = self->_wifiAdviceMonitorTimerSource;
    self->_wifiAdviceMonitorTimerSource = 0;

  }
}

- (void)armAggregateStatsTimerSource
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_source *aggregateStatsTimerSource;
  NSObject *v7;
  _QWORD handler[4];
  NSObject *v9;
  id v10;
  id location;

  if (!self->_aggregateStatsTimerSource)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[NRAutoLinkUpgradeMonitor queue](self, "queue"));
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);

    dispatch_source_set_timer(v4, 0x8000000000000000, 0x13A52453C000uLL, 0x12A05F200uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100066C24;
    handler[3] = &unk_1001B87F0;
    objc_copyWeak(&v10, &location);
    v5 = v4;
    v9 = v5;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume(v5);
    aggregateStatsTimerSource = self->_aggregateStatsTimerSource;
    self->_aggregateStatsTimerSource = (OS_dispatch_source *)v5;
    v7 = v5;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)invalidateAggregateStatsTimerSource
{
  NSObject *aggregateStatsTimerSource;
  OS_dispatch_source *v4;

  aggregateStatsTimerSource = self->_aggregateStatsTimerSource;
  if (aggregateStatsTimerSource)
  {
    dispatch_source_cancel(aggregateStatsTimerSource);
    v4 = self->_aggregateStatsTimerSource;
    self->_aggregateStatsTimerSource = 0;

  }
}

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  NSUUID *nrUUID;
  NSUUID *v8;
  id v9;
  id v10;

  if (self)
    nrUUID = self->_nrUUID;
  else
    nrUUID = 0;
  v8 = nrUUID;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NRAutoLinkUpgradeMonitor description](self, "description"));
  sub_100121E18(v8, a3, v10, v9);

}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v8);

  -[NRAutoLinkUpgradeMonitor reportEvent:details:](self, "reportEvent:details:", v4, v7);
}

- (void)reportEvent:(unsigned int)a3
{
  -[NRAutoLinkUpgradeMonitor reportEvent:details:](self, "reportEvent:details:", *(_QWORD *)&a3, 0);
}

- (void)setNrUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nrUUID, a3);
}

- (void)setLastReceivedAdviceID:(id)a3
{
  objc_storeStrong((id *)&self->_lastReceivedAdviceID, a3);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)lastReceivedAdvice
{
  return self->_lastReceivedAdvice;
}

- (void)setLastReceivedAdvice:(unint64_t)a3
{
  self->_lastReceivedAdvice = a3;
}

- (unint64_t)lastReceivedReason
{
  return self->_lastReceivedReason;
}

- (void)setLastReceivedReason:(unint64_t)a3
{
  self->_lastReceivedReason = a3;
}

- (unint64_t)lastAdvisoryTime
{
  return self->_lastAdvisoryTime;
}

- (void)setLastAdvisoryTime:(unint64_t)a3
{
  self->_lastAdvisoryTime = a3;
}

- (unint64_t)totalReceivedUpdates
{
  return self->_totalReceivedUpdates;
}

- (void)setTotalReceivedUpdates:(unint64_t)a3
{
  self->_totalReceivedUpdates = a3;
}

- (OS_dispatch_source)aggregateStatsTimerSource
{
  return self->_aggregateStatsTimerSource;
}

- (void)setAggregateStatsTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateStatsTimerSource, a3);
}

- (OS_dispatch_source)wifiAdviceMonitorTimerSource
{
  return self->_wifiAdviceMonitorTimerSource;
}

- (void)setWifiAdviceMonitorTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_wifiAdviceMonitorTimerSource, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)hasActiveNonDefaultAdvice
{
  return self->_hasActiveNonDefaultAdvice;
}

- (void)setHasActiveNonDefaultAdvice:(BOOL)a3
{
  self->_hasActiveNonDefaultAdvice = a3;
}

- (BOOL)hasReportedUpgradeStatusToSymptoms
{
  return self->_hasReportedUpgradeStatusToSymptoms;
}

- (void)setHasReportedUpgradeStatusToSymptoms:(BOOL)a3
{
  self->_hasReportedUpgradeStatusToSymptoms = a3;
}

- (BOOL)hasReportedHonoredStatusToSymptoms
{
  return self->_hasReportedHonoredStatusToSymptoms;
}

- (void)setHasReportedHonoredStatusToSymptoms:(BOOL)a3
{
  self->_hasReportedHonoredStatusToSymptoms = a3;
}

- (double)totalIntervalForNonDefaultAdvice
{
  return self->_totalIntervalForNonDefaultAdvice;
}

- (void)setTotalIntervalForNonDefaultAdvice:(double)a3
{
  self->_totalIntervalForNonDefaultAdvice = a3;
}

- (unint64_t)totalCountForNonDefaultAdvice
{
  return self->_totalCountForNonDefaultAdvice;
}

- (void)setTotalCountForNonDefaultAdvice:(unint64_t)a3
{
  self->_totalCountForNonDefaultAdvice = a3;
}

- (unint64_t)lastNonDefaultAdvisoryTime
{
  return self->_lastNonDefaultAdvisoryTime;
}

- (void)setLastNonDefaultAdvisoryTime:(unint64_t)a3
{
  self->_lastNonDefaultAdvisoryTime = a3;
}

- (double)totalDurationForWiFiAdvice
{
  return self->_totalDurationForWiFiAdvice;
}

- (void)setTotalDurationForWiFiAdvice:(double)a3
{
  self->_totalDurationForWiFiAdvice = a3;
}

- (unint64_t)totalCountForWiFiAdvice
{
  return self->_totalCountForWiFiAdvice;
}

- (void)setTotalCountForWiFiAdvice:(unint64_t)a3
{
  self->_totalCountForWiFiAdvice = a3;
}

- (unint64_t)timeOfWiFiAdvice
{
  return self->_timeOfWiFiAdvice;
}

- (void)setTimeOfWiFiAdvice:(unint64_t)a3
{
  self->_timeOfWiFiAdvice = a3;
}

- (double)totalDurationForBTClassicAdvice
{
  return self->_totalDurationForBTClassicAdvice;
}

- (void)setTotalDurationForBTClassicAdvice:(double)a3
{
  self->_totalDurationForBTClassicAdvice = a3;
}

- (unint64_t)totalCountForBTClassicAdvice
{
  return self->_totalCountForBTClassicAdvice;
}

- (void)setTotalCountForBTClassicAdvice:(unint64_t)a3
{
  self->_totalCountForBTClassicAdvice = a3;
}

- (unint64_t)timeOfBTClassicAdvice
{
  return self->_timeOfBTClassicAdvice;
}

- (void)setTimeOfBTClassicAdvice:(unint64_t)a3
{
  self->_timeOfBTClassicAdvice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_wifiAdviceMonitorTimerSource, 0);
  objc_storeStrong((id *)&self->_aggregateStatsTimerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastReceivedAdviceID, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

@end
