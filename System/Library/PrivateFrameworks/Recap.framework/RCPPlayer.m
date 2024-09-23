@implementation RCPPlayer

- (void)tearDown
{
  -[RCPEventDeliveryServicePool tearDown](self->_deliveryServicePool, "tearDown");
}

- (void)playEventStream:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint32_t numer;
  uint32_t denom;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  double v27;
  double v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  RCPPlayer *v55;
  uint64_t v56;
  RCPPlayerPlaybackOptions **p_playbackOptions;
  void *v58;
  uint64_t v59;
  timespec __rqtp;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  mach_timebase_info info;
  _BYTE v73[128];
  uint8_t v74[128];
  _BYTE buf[32];
  __int128 v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[RCPPlayer environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playbackSpeedFactor");
  v10 = v9;
  objc_msgSend(v6, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "speedFactorToAdjustRecordingEnvironment:", v11);
  objc_msgSend(v7, "setPlaybackSpeedFactor:", v10 * v12);

  v55 = self;
  p_playbackOptions = &self->_playbackOptions;
  objc_storeStrong((id *)&self->_playbackOptions, a4);
  v52 = v8;
  if (objc_msgSend(v8, "isSimulator")
    && (v13 = (void *)objc_opt_class(), (objc_msgSend(v13, "isSubclassOfClass:", objc_opt_class(), v8) & 1) == 0))
  {
    objc_msgSend(v6, "environment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isSimulator"))
    {
      objc_msgSend(v6, "environment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_stompSenderForSimulatorPlayback = v15 == v8;

    }
    else
    {
      self->_stompSenderForSimulatorPlayback = 1;
    }

  }
  else
  {
    self->_stompSenderForSimulatorPlayback = 0;
  }
  info = 0;
  mach_timebase_info(&info);
  numer = info.numer;
  denom = info.denom;
  objc_msgSend(v7, "playbackSpeedFactor");
  v19 = v18;
  objc_msgSend(v6, "events");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = mach_absolute_time();
  objc_msgSend(v7, "minDelayBetweenSends");
  v23 = v22;
  v70 = 0u;
  v71 = 0u;
  v69 = 0u;
  if (v7)
    objc_msgSend(v7, "transform");
  v58 = v7;
  v54 = v6;
  if (-[RCPPlayerPlaybackOptions linkEventDeliveryToDisplayRefreshRate](*p_playbackOptions, "linkEventDeliveryToDisplayRefreshRate", v52))
  {
    +[RCPPlayerDisplayLinkWaiter wait](RCPPlayerDisplayLinkWaiter, "wait");
    objc_msgSend(v20, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = v69;
    *(_OWORD *)&buf[16] = v70;
    v76 = v71;
    -[RCPPlayer _sendEvent:machTimeOffset:transform:](v55, "_sendEvent:machTimeOffset:transform:", v24, 0, buf);

  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v25 = v20;
  v59 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v59)
  {
    v26 = 0;
    v27 = (double)(numer / denom);
    v28 = 1.0 / v19;
    v29 = (unint64_t)(v23 * 1000000000.0);
    v56 = *(_QWORD *)v66;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v66 != v56)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v30);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(v31, "preActions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v62 != v35)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "play");
              v37 = mach_absolute_time();
            }
            v21 = v37;
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
          }
          while (v34);
        }

        objc_msgSend(v25, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (unint64_t)(v28 * (double)(unint64_t)objc_msgSend(v58, "timestampForEventReplay:", v38));

        v40 = v21 - v39;
        v41 = v21
            - v39
            + (unint64_t)(v28 * (double)(unint64_t)objc_msgSend(v58, "timestampForEventReplay:", v31));
        v42 = (unint64_t)(v27 * (double)mach_absolute_time());
        v43 = v42 + v29;
        if (v42 + v29 <= (unint64_t)((double)v41 * v27 + -1000000.0))
          v43 = (unint64_t)((double)v41 * v27 + -1000000.0);
        if (!v29)
          v43 = (unint64_t)((double)v41 * v27 + -1000000.0);
        v44 = v43 - v42;
        if (v43 > v42)
        {
          __rqtp.tv_sec = v44 / 0x3B9ACA00;
          __rqtp.tv_nsec = v44 % 0x3B9ACA00;
          nanosleep(&__rqtp, 0);
          RCPLogPlayback();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = RCPTimeIntervalFromMachTimestamp((unint64_t)((double)v44 / v27));
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v46;
            _os_log_impl(&dword_1A5E84000, v45, OS_LOG_TYPE_INFO, " - %4ld delayed by %0.9fs -\n", buf, 0x16u);
          }

        }
        v47 = mach_absolute_time();
        v48 = RCPTimeIntervalFromMachTimestamp(v47);
        v49 = RCPTimeIntervalFromMachTimestamp(v41);
        RCPLogPlayback();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v48 - v49;
          _os_log_debug_impl(&dword_1A5E84000, v50, OS_LOG_TYPE_DEBUG, "  - %4ld delivery - difference %0.9fs -\n", buf, 0x16u);
        }

        if (!-[RCPPlayerPlaybackOptions linkEventDeliveryToDisplayRefreshRate](*p_playbackOptions, "linkEventDeliveryToDisplayRefreshRate")|| v26)
        {
          *(_OWORD *)buf = v69;
          *(_OWORD *)&buf[16] = v70;
          v76 = v71;
          -[RCPPlayer _sendEvent:machTimeOffset:transform:](v55, "_sendEvent:machTimeOffset:transform:", v31, v40, buf);
        }
        ++v26;
        ++v30;
      }
      while (v30 != v59);
      v59 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v59);
  }

  -[RCPPlayer analyticsEventSender](v55, "analyticsEventSender");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sendEvent:", 1);

}

- (void)_sendEvent:(id)a3 machTimeOffset:(int64_t)a4 transform:(CGAffineTransform *)a5
{
  RCPEventDeliveryServicePool *deliveryServicePool;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  _OWORD v13[3];

  deliveryServicePool = self->_deliveryServicePool;
  v9 = a3;
  objc_msgSend(v9, "senderProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventDeliveryServicePool deliveryServiceForSenderProperties:](deliveryServicePool, "deliveryServiceForSenderProperties:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&a5->c;
  v13[0] = *(_OWORD *)&a5->a;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a5->tx;
  -[RCPPlayer _sendEvent:withService:machTimeOffset:transform:](self, "_sendEvent:withService:machTimeOffset:transform:", v9, v11, a4, v13);

}

- (void)_sendEvent:(id)a3 withService:(id)a4 machTimeOffset:(int64_t)a5 transform:(CGAffineTransform *)a6
{
  id v10;
  __int128 v11;
  __IOHIDEvent *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  NSObject *v15;
  _OWORD v16[3];

  v10 = a4;
  v11 = *(_OWORD *)&a6->c;
  v16[0] = *(_OWORD *)&a6->a;
  v16[1] = v11;
  v16[2] = *(_OWORD *)&a6->tx;
  v12 = -[RCPPlayer _cloneAndTransformHIDEvent:machTimeOffset:transform:](self, "_cloneAndTransformHIDEvent:machTimeOffset:transform:", a3, a5, v16);
  -[RCPPlayerPlaybackOptions customizeHIDEvent](self->_playbackOptions, "customizeHIDEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[RCPPlayerPlaybackOptions customizeHIDEvent](self->_playbackOptions, "customizeHIDEvent");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, __IOHIDEvent *))v14)[2](v14, v12);

  }
  if (v12)
  {
    RCPLogPlayback();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[RCPPlayer _sendEvent:withService:machTimeOffset:transform:].cold.1(v12, v15);

    objc_msgSend(v10, "postHIDEvent:", v12);
    CFRelease(v12);
  }

}

- (__IOHIDEvent)_cloneAndTransformHIDEvent:(id)a3 machTimeOffset:(int64_t)a4 transform:(CGAffineTransform *)a5
{
  __IOHIDEvent *Copy;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v11;

  if (!objc_msgSend(a3, "hidEvent"))
    return 0;
  Copy = (__IOHIDEvent *)IOHIDEventCreateCopy();
  IOHIDEventGetTimeStamp();
  -[RCPPlayerPlaybackOptions playbackSpeedFactor](self->_playbackOptions, "playbackSpeedFactor");
  mach_absolute_time();
  IOHIDEventSetTimeStamp();
  v8 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v11.c = v8;
  *(_OWORD *)&v11.tx = *(_OWORD *)&a5->tx;
  if (!CGAffineTransformIsIdentity(&v11))
  {
    v9 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v11.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v11.c = v9;
    *(_OWORD *)&v11.tx = *(_OWORD *)&a5->tx;
    RCPHIDEventTransformLocation((uint64_t)Copy, (__int128 *)&v11);
  }
  return Copy;
}

- (BOOL)prewarmForEventStream:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  RCPEventDeliveryServicePool *v15;
  void *v16;
  RCPEventDeliveryServicePool *deliveryServicePool;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    deliveryServicePool = self->_deliveryServicePool;
    v19 = 0;
    -[RCPEventDeliveryServicePool prewarmForSenderProperties:withError:](deliveryServicePool, "prewarmForSenderProperties:withError:", 0, &v19);
    v11 = v19;
    if (!a4)
      goto LABEL_18;
    goto LABEL_16;
  }
  objc_msgSend(v6, "events");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v22;
LABEL_4:
    v13 = 0;
    v14 = v11;
    while (1)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v8);
      v15 = self->_deliveryServicePool;
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "senderProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v14;
      -[RCPEventDeliveryServicePool prewarmForSenderProperties:withError:](v15, "prewarmForSenderProperties:withError:", v16, &v20);
      v11 = v20;

      if (a4)
      {
        if (v11)
          break;
      }
      ++v13;
      v14 = v11;
      if (v10 == v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          goto LABEL_4;
        break;
      }
    }
  }
  else
  {
    v11 = 0;
  }

  if (a4)
  {
LABEL_16:
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
LABEL_18:

  return v11 == 0;
}

- (RCPEventEnvironment)environment
{
  return self->_environment;
}

- (RCPAnalyticsEventSender)analyticsEventSender
{
  return self->_analyticsEventSender;
}

+ (id)sharedPlayer
{
  if (sharedPlayer_onceToken != -1)
    dispatch_once(&sharedPlayer_onceToken, &__block_literal_global_6);
  return (id)sharedPlayer__sharedPlayer;
}

void __25__RCPPlayer_sharedPlayer__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedPlayer__sharedPlayer;
  sharedPlayer__sharedPlayer = v0;

}

+ (void)playEventStream:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  RCPLogPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5E84000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0x1F5uLL, "RecapPlayEventStream", (const char *)&unk_1A5EA9051, buf, 2u);
  }

  objc_msgSend(a1, "sharedPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prewarmForEventStream:withError:", v7, 0);

  objc_msgSend(a1, "sharedPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playEventStream:withOptions:", v7, v6);

  objc_msgSend(a1, "sharedPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tearDown");

  RCPLogPlayback();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5E84000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0x1F5uLL, "RecapPlayEventStream", (const char *)&unk_1A5EA9051, v13, 2u);
  }

}

+ (void)tearDown
{
  id v2;

  objc_msgSend(a1, "sharedPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tearDown");

}

- (RCPPlayer)init
{
  RCPEventDeliveryServicePool *v3;
  void *v4;
  RCPCoreAnalyticsBackedAnalyticsEventSender *v5;
  RCPPlayer *v6;

  v3 = objc_alloc_init(RCPEventDeliveryServicePool);
  +[RCPEventEnvironment currentEnvironment](RCPEventEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(RCPCoreAnalyticsBackedAnalyticsEventSender);
  v6 = -[RCPPlayer initWithDeliveryServicePool:environment:analyticsEventSender:](self, "initWithDeliveryServicePool:environment:analyticsEventSender:", v3, v4, v5);

  return v6;
}

- (RCPPlayer)initWithDeliveryServicePool:(id)a3 environment:(id)a4 analyticsEventSender:(id)a5
{
  id v9;
  id v10;
  id v11;
  RCPPlayer *v12;
  RCPPlayer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RCPPlayer;
  v12 = -[RCPPlayer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deliveryServicePool, a3);
    objc_storeStrong((id *)&v13->_environment, a4);
    objc_storeStrong((id *)&v13->_analyticsEventSender, a5);
  }

  return v13;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (RCPPlayerPlaybackOptions)playbackOptions
{
  return self->_playbackOptions;
}

- (void)setPlaybackOptions:(id)a3
{
  objc_storeStrong((id *)&self->_playbackOptions, a3);
}

- (BOOL)stompSenderForSimulatorPlayback
{
  return self->_stompSenderForSimulatorPlayback;
}

- (void)setStompSenderForSimulatorPlayback:(BOOL)a3
{
  self->_stompSenderForSimulatorPlayback = a3;
}

- (RCPEventDeliveryServicePool)deliveryServicePool
{
  return self->_deliveryServicePool;
}

- (void)setDeliveryServicePool:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryServicePool, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSender, 0);
  objc_storeStrong((id *)&self->_deliveryServicePool, 0);
  objc_storeStrong((id *)&self->_playbackOptions, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)_sendEvent:(const void *)a1 withService:(NSObject *)a2 machTimeOffset:transform:.cold.1(const void *a1, NSObject *a2)
{
  __CFString *v3;
  int v4;
  __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)CFCopyDescription(a1);
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_1A5E84000, a2, OS_LOG_TYPE_DEBUG, "send event %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
