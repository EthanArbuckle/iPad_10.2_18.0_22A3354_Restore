@implementation PXVideoPlaybackReporter

- (void)addEndpointWithPlayerItem:(id)a3
{
  id v4;
  PXVideoPlaybackReporterAVPlayerItemEndpoint *v5;

  v4 = a3;
  v5 = -[PXVideoPlaybackReporterAVPlayerItemEndpoint initWithPlayerItem:]([PXVideoPlaybackReporterAVPlayerItemEndpoint alloc], "initWithPlayerItem:", v4);

  -[PXVideoPlaybackReporter addEndpoint:](self, "addEndpoint:", v5);
}

- (PXVideoPlaybackReporter)initWithIdentifier:(id)a3
{
  return -[PXVideoPlaybackReporter initWithIdentifier:CPAnalysticsEndpoint:](self, "initWithIdentifier:CPAnalysticsEndpoint:", a3, 0);
}

- (PXVideoPlaybackReporter)initWithIdentifier:(id)a3 CPAnalysticsEndpoint:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PXVideoPlaybackReporter *v7;
  uint64_t v8;
  NSString *identifier;
  NSMutableArray *v10;
  NSMutableArray *endpoints;
  _PXVideoPlaybackCPAnalyticsEndpoint *v12;
  _PXVideoPlaybackCPAnalyticsEndpoint *cpAnalyticsEndpoint;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXVideoPlaybackReporter;
  v7 = -[PXVideoPlaybackReporter init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    endpoints = v7->_endpoints;
    v7->_endpoints = v10;

    v7->_endpointsLock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      v12 = objc_alloc_init(_PXVideoPlaybackCPAnalyticsEndpoint);
      cpAnalyticsEndpoint = v7->_cpAnalyticsEndpoint;
      v7->_cpAnalyticsEndpoint = v12;

      -[PXVideoPlaybackReporter addEndpoint:](v7, "addEndpoint:", v7->_cpAnalyticsEndpoint);
    }
  }

  return v7;
}

- (PXVideoPlaybackReporter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoPlaybackReporter.m"), 89, CFSTR("%s is not available as initializer"), "-[PXVideoPlaybackReporter init]");

  abort();
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoPlaybackReporter identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXVideoPlaybackReporter state](self, "state");
  if ((unint64_t)(v7 - 1) > 2)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E5145A78[v7 - 1];
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; %@; State: %@>"), v5, self, v6, v8);

  return v9;
}

- (void)addEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLVideoPlaybackGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PXVideoPlaybackReporter identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[VideoPlaybackReporting] %@: Adding video playback reporter endpoint: %@", (uint8_t *)&v8, 0x16u);

  }
  -[PXVideoPlaybackReporter identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoggingIdentifier:", v7);

  os_unfair_lock_lock(&self->_endpointsLock);
  -[NSMutableArray addObject:](self->_endpoints, "addObject:", v4);
  os_unfair_lock_unlock(&self->_endpointsLock);
  -[PXVideoPlaybackReporter _sendPayloadToEndpointIfNeeded:](self, "_sendPayloadToEndpointIfNeeded:", v4);

}

- (void)setState:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  PXVideoPlaybackReporter *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
    self->_state = a3;
  -[PXVideoPlaybackReporter _sendPayloadToEndpointsIfNeeded](self, "_sendPayloadToEndpointsIfNeeded");
  PLVideoPlaybackGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PXVideoPlaybackReporter identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[VideoPlaybackReporting] %@: Video playback reporting state changed: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)reportPlaybackRequestedWithPriority:(int64_t)a3
{
  void *v5;
  id v6;

  if (!-[PXVideoPlaybackReporter state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoPlaybackReporter setStartDate:](self, "setStartDate:", v5);

    -[PXVideoPlaybackReporter setPriority:](self, "setPriority:", a3);
    -[PXVideoPlaybackReporter setState:](self, "setState:", 1);
    -[PXVideoPlaybackReporter cpAnalyticsEndpoint](self, "cpAnalyticsEndpoint");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackRequested");

  }
}

- (void)reportAVAssetCreated
{
  id v3;

  if (-[PXVideoPlaybackReporter state](self, "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXVideoPlaybackReporter setAssetCreationDate:](self, "setAssetCreationDate:", v3);

  }
}

- (void)reportPlaybackBegan
{
  void *v3;

  if (-[PXVideoPlaybackReporter state](self, "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoPlaybackReporter setEndDate:](self, "setEndDate:", v3);

    -[PXVideoPlaybackReporter setState:](self, "setState:", 2);
  }
}

- (void)reportPlaybackAbandoned
{
  void *v3;

  if (-[PXVideoPlaybackReporter state](self, "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoPlaybackReporter setEndDate:](self, "setEndDate:", v3);

    -[PXVideoPlaybackReporter setState:](self, "setState:", 3);
  }
}

- (void)_sendPayloadToEndpointsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[PXVideoPlaybackReporter isStateFinal](self, "isStateFinal"))
  {
    os_unfair_lock_lock(&self->_endpointsLock);
    -[PXVideoPlaybackReporter endpoints](self, "endpoints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    os_unfair_lock_unlock(&self->_endpointsLock);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          -[PXVideoPlaybackReporter _sendPayloadToEndpointIfNeeded:](self, "_sendPayloadToEndpointIfNeeded:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)isStateFinal
{
  return -[PXVideoPlaybackReporter state](self, "state") == 3 || -[PXVideoPlaybackReporter state](self, "state") == 2;
}

- (void)_sendPayloadToEndpointIfNeeded:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];

  v5 = a3;
  if (-[PXVideoPlaybackReporter isStateFinal](self, "isStateFinal"))
  {
    -[PXVideoPlaybackReporter startDate](self, "startDate");

    -[PXVideoPlaybackReporter endDate](self, "endDate");
    -[PXVideoPlaybackReporter endDate](self, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoPlaybackReporter startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    -[PXVideoPlaybackReporter assetCreationDate](self, "assetCreationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoPlaybackReporter startDate](self, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;

    v14 = -[PXVideoPlaybackReporter priority](self, "priority");
    v15 = -[PXVideoPlaybackReporter state](self, "state");
    if (v15 == 2)
    {
      v16 = 1;
    }
    else if (v15 == 3)
    {
      v16 = 2;
    }
    else
    {
      if (v15 < 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoPlaybackReporter.m"), 185, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v16 = 0;
    }
    v18[0] = llround(v9 * 1000.0);
    v18[1] = llround(v13 * 1000.0);
    v18[2] = v14;
    v18[3] = v16;
    objc_msgSend(v5, "sendPayload:", v18);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (NSMutableArray)endpoints
{
  return self->_endpoints;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)assetCreationDate
{
  return self->_assetCreationDate;
}

- (void)setAssetCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_assetCreationDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (_PXVideoPlaybackCPAnalyticsEndpoint)cpAnalyticsEndpoint
{
  return self->_cpAnalyticsEndpoint;
}

- (void)setCpAnalyticsEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_cpAnalyticsEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpAnalyticsEndpoint, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_assetCreationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
