@implementation RCPEventStreamRecorder

+ (id)recorderWithConfiguration:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  RCPCoreAnalyticsBackedAnalyticsEventSender *v7;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[4];
  v4[4] = v3;
  v6 = v3;

  v7 = objc_alloc_init(RCPCoreAnalyticsBackedAnalyticsEventSender);
  objc_msgSend(v4, "setAnalyticsEventSender:", v7);

  return v4;
}

- (void)dealloc
{
  __IOHIDEvent *startLocationEvent;
  objc_super v4;

  startLocationEvent = self->_startLocationEvent;
  if (startLocationEvent)
    CFRelease(startLocationEvent);
  v4.receiver = self;
  v4.super_class = (Class)RCPEventStreamRecorder;
  -[RCPEventStreamRecorder dealloc](&v4, sel_dealloc);
}

- (void)setStartLocationEvent:(__IOHIDEvent *)a3
{
  __IOHIDEvent *startLocationEvent;
  __IOHIDEvent *Copy;

  startLocationEvent = self->_startLocationEvent;
  if (startLocationEvent)
    CFRelease(startLocationEvent);
  Copy = (__IOHIDEvent *)IOHIDEventCreateCopy();
  self->_startLocationEvent = Copy;
  CFRetain(Copy);
}

- (__IOHIDEvent)startLocationEvent
{
  return self->_startLocationEvent;
}

- (BOOL)isRecording
{
  return -[RCPEventStreamRecorder state](self, "state") == 1;
}

- (void)startRecording
{
  -[RCPEventStreamRecorder setStartTimestamp:](self, "setStartTimestamp:", mach_absolute_time());
  if (!-[RCPEventStreamRecorder state](self, "state"))
  {
    -[RCPEventStreamRecorder setState:](self, "setState:", 1);
    +[RCPRecorder registerEventStreamRecorder:](RCPRecorder, "registerEventStreamRecorder:", self);
  }
}

- (void)stopRecording
{
  void *v3;

  -[RCPEventStreamRecorder finalizeEvents](self, "finalizeEvents");
  -[RCPEventStreamRecorder setState:](self, "setState:", 2);
  -[RCPEventStreamRecorder analyticsEventSender](self, "analyticsEventSender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEvent:", 0);

  +[RCPRecorder unregisterEventStreamRecorder:](RCPRecorder, "unregisterEventStreamRecorder:", self);
}

- (void)enqueueEvent:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  -[RCPEventStream rawEvents](self, "rawEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v21);

  -[RCPEventStreamRecorder config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maxStreamDuration");
  v7 = v6;

  v8 = v21;
  if (v7 > 0.0)
  {
    v9 = objc_msgSend(v21, "timestamp");
    -[RCPEventStream rawEvents](self, "rawEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    -[RCPEventStream rawEvents](self, "rawEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = 0;
      while (1)
      {
        -[RCPEventStream rawEvents](self, "rawEvents");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = RCPTimeIntervalFromMachTimestamp(v9 - objc_msgSend(v16, "timestamp"));

        if (v17 < v7)
          break;
        ++v14;
        -[RCPEventStream rawEvents](self, "rawEvents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v14 >= v19)
          goto LABEL_8;
      }
      v11 = v14;
    }
LABEL_8:
    -[RCPEventStream rawEvents](self, "rawEvents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectsInRange:", 0, v11);

    v8 = v21;
  }

}

- (void)_finalizePointerEvents
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __IOHIDEvent *startLocationEvent;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_startLocationEvent)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[RCPEventStream rawEvents](self, "rawEvents", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_msgSend(v8, "hidEvent");
        if (IOHIDEventGetType() == 17)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v5)
            goto LABEL_4;
          goto LABEL_13;
        }
      }
      v9 = v8;

      if (!v9)
        return;
      objc_msgSend(v9, "hidEvent");
      IOHIDEventGetSenderID();
      IOHIDEventSetSenderID();
      IOHIDEventGetTimeStamp();
      IOHIDEventSetTimeStamp();
      startLocationEvent = self->_startLocationEvent;
      v11 = objc_msgSend(v9, "deliveryTimestamp");
      objc_msgSend(v9, "senderProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[RCPEvent eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:](RCPEvent, "eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:", startLocationEvent, v11, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[RCPEventStream rawEvents](self, "rawEvents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertObject:atIndex:", v13, 0);

      v3 = v9;
    }
LABEL_13:

  }
}

- (RCPRecorderConfig)config
{
  return self->_config;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  self->_startTimestamp = a3;
}

- (RCPAnalyticsEventSender)analyticsEventSender
{
  return self->_analyticsEventSender;
}

- (void)setAnalyticsEventSender:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEventSender, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSender, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
