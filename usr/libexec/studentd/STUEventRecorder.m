@implementation STUEventRecorder

- (void)dealloc
{
  objc_super v3;

  -[STUEventRecorder stopRecording](self, "stopRecording");
  v3.receiver = self;
  v3.super_class = (Class)STUEventRecorder;
  -[STUEventRecorder dealloc](&v3, "dealloc");
}

- (STUEventRecorder)initWithDevice:(id)a3 store:(id)a4 dateProvider:(id)a5
{
  id v10;
  id v11;
  id v12;
  STUEventRecorder *v13;
  STUEventRecorder *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUEventRecorder.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUEventRecorder.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUEventRecorder.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateProvider"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)STUEventRecorder;
  v13 = -[STUEventRecorder init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mDevice, a3);
    objc_storeStrong((id *)&v14->mStore, a4);
    objc_storeStrong((id *)&v14->mDateProvider, a5);
  }

  return v14;
}

- (void)startRecording
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (!-[STUEventRecorder isRecording](self, "isRecording"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = objc_msgSend((id)objc_opt_class(self), "observedDeviceKeyPaths", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[CRKDevice addObserver:forKeyPath:options:context:](self->mDevice, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), 0, CFSTR("kSTUEventRecorderObservationContext"));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[STUEventRecorder setRecording:](self, "setRecording:", 1);
    -[STUEventRecorder recordCurrentState](self, "recordCurrentState");
  }
}

- (void)stopRecording
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  STUEventStoreProtocol *mStore;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  NSObject *v14;
  NSArray *mLastOpenApps;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (-[STUEventRecorder isRecording](self, "isRecording"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = objc_msgSend((id)objc_opt_class(self), "observedDeviceKeyPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          -[CRKDevice removeObserver:forKeyPath:context:](self->mDevice, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8), CFSTR("kSTUEventRecorderObservationContext"));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    mStore = self->mStore;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDateProviderProtocol currentDate](self->mDateProvider, "currentDate"));
    v16 = 0;
    v11 = -[STUEventStoreProtocol purgeEventsBeforeDate:error:](mStore, "purgeEventsBeforeDate:error:", v10, &v16);
    v12 = v16;

    if ((v11 & 1) == 0)
    {
      v13 = sub_10005E948();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10007D48C(v12, v14);

    }
    mLastOpenApps = self->mLastOpenApps;
    self->mLastOpenApps = 0;

    -[STUEventRecorder setRecording:](self, "setRecording:", 0);
  }
}

- (void)recordEvent:(id)a3
{
  id v5;
  STUEventStoreProtocol *mStore;
  unsigned __int8 v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v5 = a3;
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUEventRecorder.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  if (-[STUEventRecorder isRecording](self, "isRecording"))
  {
    mStore = self->mStore;
    v15 = 0;
    v7 = -[STUEventStoreProtocol storeEvent:error:](mStore, "storeEvent:error:", v5, &v15);
    v8 = v15;
    if ((v7 & 1) == 0)
    {
      v13 = sub_10005E948();
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10007D520((uint64_t)v5, v8, v11);
      goto LABEL_11;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUEventRecorder delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "eventRecorder:didRecordEvent:");

    if ((v10 & 1) != 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[STUEventRecorder delegate](self, "delegate"));
      -[NSObject eventRecorder:didRecordEvent:](v11, "eventRecorder:didRecordEvent:", self, v5);
LABEL_11:

    }
  }
  else
  {
    v12 = sub_10005E948();
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10007D5D0((uint64_t)v5, v8);
  }

}

+ (id)observedDeviceKeyPaths
{
  if (qword_1000FC558 != -1)
    dispatch_once(&qword_1000FC558, &stru_1000CB810);
  return (id)qword_1000FC560;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  CRKDevice *v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned __int8 v16;
  objc_super v17;

  v10 = a3;
  v11 = (CRKDevice *)a4;
  v12 = a5;
  if (a6 == CFSTR("kSTUEventRecorderObservationContext"))
  {
    if (self->mDevice == v11
      && ((objc_msgSend(v10, "isEqualToString:", CRKDeviceAllOpenApplicationsKey) & 1) != 0
       || objc_msgSend(v10, "isEqualToString:", CFSTR("lockState"))))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUEventRecorder currentOpenApps](self, "currentOpenApps"));
      v14 = self->mLastOpenApps;
      v15 = v13;
      if (v15 | v14)
      {
        v16 = objc_msgSend((id)v14, "isEqual:", v15);

        if ((v16 & 1) == 0)
        {
          objc_storeStrong((id *)&self->mLastOpenApps, v13);
          -[STUEventRecorder recordCurrentOpenApps](self, "recordCurrentOpenApps");
        }
      }

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)STUEventRecorder;
    -[STUEventRecorder observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)recordCurrentOpenApps
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[STUEventRecorder currentOpenApps](self, "currentOpenApps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUEventRecorder primaryApp](self, "primaryApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CRKDevice platform](self->mDevice, "platform")));
  v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CRKOpenAppsDidChangeEventBundleIdentifiersUserInfoKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CRKOpenAppsDidChangeEventPlatformUserInfoKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CRKOpenAppsDidChangeEventPrimaryBundleIdentifierUserInfoKey);
  v6 = objc_alloc((Class)CRKLogEvent);
  v7 = CRKOpenAppsDidChangeEventName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUDateProviderProtocol currentDate](self->mDateProvider, "currentDate"));
  v9 = objc_msgSend(v6, "initWithName:date:userInfo:", v7, v8, v5);

  -[STUEventRecorder recordEvent:](self, "recordEvent:", v9);
}

- (NSArray)currentOpenApps
{
  void *v3;
  void *v4;

  if (-[CRKDevice lockState](self->mDevice, "lockState") == (id)1
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRKDevice allOpenApplications](self->mDevice, "allOpenApplications")),
        v3,
        v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRKDevice allOpenApplications](self->mDevice, "allOpenApplications"));
  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return (NSArray *)v4;
}

- (NSString)primaryApp
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUEventRecorder currentOpenApps](self, "currentOpenApps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return (NSString *)v3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (STUEventRecorderDelegate)delegate
{
  return (STUEventRecorderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mLastOpenApps, 0);
  objc_storeStrong((id *)&self->mDateProvider, 0);
  objc_storeStrong((id *)&self->mStore, 0);
  objc_storeStrong((id *)&self->mDevice, 0);
}

@end
