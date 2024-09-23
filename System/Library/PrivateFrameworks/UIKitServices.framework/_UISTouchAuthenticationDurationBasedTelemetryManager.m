@implementation _UISTouchAuthenticationDurationBasedTelemetryManager

- (_UISTouchAuthenticationDurationBasedTelemetryManager)initWithQueue:(id)a3
{
  id v5;
  _UISTouchAuthenticationDurationBasedTelemetryManager *v6;
  _UISTouchAuthenticationDurationBasedTelemetryManager *v7;
  BSMutableIntegerMap *v8;
  BSMutableIntegerMap *recordMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISTouchAuthenticationDurationBasedTelemetryManager;
  v6 = -[_UISTouchAuthenticationDurationBasedTelemetryManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D22FE0]);
    recordMap = v7->_recordMap;
    v7->_recordMap = v8;

  }
  return v7;
}

- (void)enqueueRecordForAnalytics:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82___UISTouchAuthenticationDurationBasedTelemetryManager_enqueueRecordForAnalytics___block_invoke;
  block[3] = &unk_1E2CAF4C0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)flushRecordsWithIdentifier:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83___UISTouchAuthenticationDurationBasedTelemetryManager_flushRecordsWithIdentifier___block_invoke;
  block[3] = &unk_1E2CAF4E8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_reportEventRecordToCoreAnalyticsIfNecessary:(void *)a1
{
  id v1;

  v1 = a1;
  if (-[_UISTouchAuthenticationRecord timeSinceCreation]((uint64_t)v1) > 0.2)
    _UISTouchAuthenticationTelemetryReportRecordWithDuration(v1, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
