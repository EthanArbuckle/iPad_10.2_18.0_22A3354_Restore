@implementation PXGTungstenRecordingEvent

- (PXGTungstenRecordingEvent)initWithComponent:(int64_t)a3 eventName:(id)a4
{
  id v7;
  PXGTungstenRecordingEvent *v8;
  PXGTungstenRecordingEvent *v9;
  void *v10;
  uint64_t v11;
  NSString *threadDescription;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGTungstenRecordingEvent;
  v8 = -[PXGTungstenRecordingEvent init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_component = a3;
    objc_storeStrong((id *)&v8->_eventName, a4);
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = objc_claimAutoreleasedReturnValue();
    threadDescription = v9->_threadDescription;
    v9->_threadDescription = (NSString *)v11;

    v9->_timestamp = CFAbsoluteTimeGetCurrent();
  }

  return v9;
}

- (id)serializable
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTungstenRecording.m"), 100, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGTungstenRecordingEvent serializable]", v6);

  abort();
}

- (int64_t)component
{
  return self->_component;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)threadDescription
{
  return self->_threadDescription;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadDescription, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
