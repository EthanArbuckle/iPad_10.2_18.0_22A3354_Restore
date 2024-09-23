@implementation UISTouchAuthenticationDurationBasedTelemetryManager

void __82___UISTouchAuthenticationDurationBasedTelemetryManager_enqueueRecordForAnalytics___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    BSDispatchQueueAssert();
    v3 = objc_msgSend(v2, "serviceInstanceIdentifier");
    if (v3 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_processRecord_, WeakRetained, CFSTR("_UISTouchAuthenticationDurationBasedTelemetryManager.m"), 60, CFSTR("Records provided to _UISTouchAuthenticationDurationBasedTelemetryManager require a valid serviceInstanceIdentifier"));

    }
    v4 = objc_msgSend(WeakRetained[2], "containsObjectForKey:", v3);
    v5 = WeakRetained[2];
    if (v4)
    {
      objc_msgSend(v5, "objectForKey:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6 || (objc_msgSend(v6, "isEqual:", v2) & 1) == 0)
      {
        -[_UISTouchAuthenticationDurationBasedTelemetryManager _reportEventRecordToCoreAnalyticsIfNecessary:](v7);
        objc_msgSend(WeakRetained[2], "setObject:forKey:", v2, v3);
      }

    }
    else
    {
      objc_msgSend(v5, "setObject:forKey:", v2, v3);
    }
  }

}

void __83___UISTouchAuthenticationDurationBasedTelemetryManager_flushRecordsWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *(_QWORD *)(a1 + 40);
    BSDispatchQueueAssert();
    if (objc_msgSend(WeakRetained[2], "containsObjectForKey:", v2))
    {
      objc_msgSend(WeakRetained[2], "objectForKey:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISTouchAuthenticationDurationBasedTelemetryManager _reportEventRecordToCoreAnalyticsIfNecessary:](v3);

      objc_msgSend(WeakRetained[2], "removeObjectForKey:", v2);
    }
  }

}

@end
