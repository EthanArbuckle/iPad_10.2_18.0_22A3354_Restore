@implementation BKTouchPadManager

- (void)sendCancelEventForDisplay:(id)a3
{
  id v4;
  NSObject *touchPadQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  touchPadQueue = self->_touchPadQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003B20;
  v7[3] = &unk_1000ECD80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(touchPadQueue, v7);

}

+ (id)sharedInstance
{
  if (qword_100117238 != -1)
    dispatch_once(&qword_100117238, &stru_1000E9FE0);
  return (id)qword_100117230;
}

- (BKTouchPadManager)init
{
  BKTouchPadManager *v2;
  uint64_t Serial;
  OS_dispatch_queue *touchPadQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *queue_currentTouchPads;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BKIOHIDServiceMatcher *v12;
  BKIOHIDServiceMatcher *touchPadMatcher;
  objc_super v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v15.receiver = self;
  v15.super_class = (Class)BKTouchPadManager;
  v2 = -[BKTouchPadManager init](&v15, "init");
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial(CFSTR("BKTouchPadQueue"));
    touchPadQueue = v2->_touchPadQueue;
    v2->_touchPadQueue = (OS_dispatch_queue *)Serial;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queue_currentTouchPads = v2->_queue_currentTouchPads;
    v2->_queue_currentTouchPads = v5;

    v19[0] = CFSTR("DeviceUsagePage");
    v19[1] = CFSTR("DeviceUsage");
    v20[0] = &off_1000F72A0;
    v20[1] = &off_1000F72B8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    v16 = v7;
    v17 = CFSTR("DeviceUsagePairs");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v18 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

    v10 = objc_alloc((Class)BKIOHIDServiceMatcher);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
    v12 = (BKIOHIDServiceMatcher *)objc_msgSend(v10, "initWithMatchingDictionary:dataProvider:", v9, v11);
    touchPadMatcher = v2->_touchPadMatcher;
    v2->_touchPadMatcher = v12;

    -[BKIOHIDServiceMatcher startObserving:queue:](v2->_touchPadMatcher, "startObserving:queue:", v2, v2->_touchPadQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BKIOHIDServiceMatcher invalidate](self->_touchPadMatcher, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKTouchPadManager;
  -[BKTouchPadManager dealloc](&v3, "dealloc");
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  return -[BKTouchPadManager processEvent:sender:display:dispatcher:](self, "processEvent:sender:display:dispatcher:", a3, a4, 0, a5);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 display:(id)a5 dispatcher:(id)a6
{
  id v10;
  id v11;
  id v12;
  __IOHIDEvent *v13;
  NSObject *touchPadQueue;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  __IOHIDEvent *v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *a3;
  touchPadQueue = self->_touchPadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025C9C;
  block[3] = &unk_1000EA008;
  block[4] = self;
  v20 = v10;
  v22 = v12;
  v23 = v13;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_sync(touchPadQueue, block);

  return 1;
}

- (void)sendCancelEventForAllDisplays
{
  NSObject *touchPadQueue;
  _QWORD block[5];

  touchPadQueue = self->_touchPadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025BC0;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(touchPadQueue, block);
}

- (void)serviceDidDisappear:(id)a3
{
  NSObject *touchPadQueue;
  id v5;

  touchPadQueue = self->_touchPadQueue;
  v5 = a3;
  dispatch_assert_queue_V2(touchPadQueue);
  -[BKTouchPadManager _queue_touchPadRemoved:](self, "_queue_touchPadRemoved:", v5);

}

- (void)_queue_touchPadRemoved:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "senderID")));
  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_currentTouchPads, "objectForKey:", v4));
  v6 = (void *)v5;
  if (v5)
  {
    v7 = BKLogTouchEvents(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TouchPad was removed: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    -[BKTouchPadManager _queue_sendCancelEventForTouchPad:](self, "_queue_sendCancelEventForTouchPad:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_queue_currentTouchPads, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_queue_currentTouchPads, "count"))
      BKSHIDServicesSetTouchPadAvailability();
  }

}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  NSObject *touchPadQueue;
  BKIOHIDServiceMatcher *v7;
  BKIOHIDServiceMatcher *touchPadMatcher;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  touchPadQueue = self->_touchPadQueue;
  v7 = (BKIOHIDServiceMatcher *)a3;
  dispatch_assert_queue_V2(touchPadQueue);
  touchPadMatcher = self->_touchPadMatcher;

  if (touchPadMatcher == v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderCache"));
    objc_msgSend(v10, "addSenderInfo:", v11);

    -[BKTouchPadManager _queue_touchPadsDetected:](self, "_queue_touchPadsDetected:", v11);
  }

}

- (void)_queue_touchPadsDetected:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = -[NSMutableDictionary count](self->_queue_currentTouchPads, "count");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100025A98;
    v7[3] = &unk_1000EA080;
    v7[4] = self;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
    v5 = -[NSMutableDictionary count](self->_queue_currentTouchPads, "count");
    if (!v4)
    {
      if (v5)
        BKSHIDServicesSetTouchPadAvailability(1);
    }
  }

}

- (void)_queue_sendEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 toDestination:(id)a5 dispatcher:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *Copy;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t ConciseDescription;
  void *v22;
  uint64_t TimeStamp;
  uint64_t v24;
  int v25;
  void *v26;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (byte_100117398)
  {
    if (a3)
    {
      TimeStamp = IOHIDEventGetTimeStamp(a3);
      kdebug_trace(730464260, TimeStamp, 0, 0, 0);
      if (!byte_100117398)
        goto LABEL_2;
      v24 = IOHIDEventGetTimeStamp(a3);
    }
    else
    {
      kdebug_trace(730464260, 0, 0, 0, 0);
      v24 = 0;
      if (!byte_100117398)
        goto LABEL_2;
    }
    kdebug_trace(730464264, v24, 0, 0, 0);
  }
LABEL_2:
  v12 = (void *)objc_opt_new(BKSHIDEventDigitizerAttributes);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "environment"));
  objc_msgSend(v12, "setEnvironment:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "display"));
  objc_msgSend(v12, "setDisplay:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "token"));
  objc_msgSend(v12, "setToken:", v16);

  objc_msgSend(v9, "maxForce");
  objc_msgSend(v12, "setMaximumForce:");
  objc_msgSend(v12, "setSource:", objc_msgSend(v13, "eventSource"));
  Copy = (const void *)IOHIDEventCreateCopy(kCFAllocatorDefault, a3);
  objc_msgSend(v9, "digitizerSurfaceDimensions");
  objc_msgSend(v12, "setDigitizerSurfaceSize:");
  BKSHIDEventSetDigitizerAttributes(Copy, v12);
  IOHIDEventSetSenderID(Copy, objc_msgSend(v13, "senderID"));
  v19 = BKLogTouchEvents(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    ConciseDescription = BKSHIDEventGetConciseDescription(Copy);
    v22 = (void *)objc_claimAutoreleasedReturnValue(ConciseDescription);
    v25 = 138543362;
    v26 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "touchpad %{public}@", (uint8_t *)&v25, 0xCu);

  }
  objc_msgSend(v11, "postEvent:toDestination:", Copy, v10);
  CFRelease(Copy);

}

- (void)_queue_handleEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  const __CFArray *Children;
  const __CFArray *v17;
  CFIndex Count;
  uint64_t v19;
  unsigned int v20;
  CFIndex v21;
  const void *ValueAtIndex;
  char IntegerValue;
  char v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  unsigned int v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  _BOOL4 v59;
  _BYTE v60[128];

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentDestinations"));
  if ((IOHIDEventGetIntegerValue(a3, 720903) & 0x80) != 0 && objc_msgSend(v10, "count"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v11);
          -[BKTouchPadManager _queue_sendEvent:fromTouchPad:toDestination:dispatcher:](self, "_queue_sendEvent:fromTouchPad:toDestination:dispatcher:", a3, v8, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), v9);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v13);
    }

    objc_msgSend(v8, "resetForCancel");
  }
  else
  {
    Children = (const __CFArray *)IOHIDEventGetChildren(a3);
    if (Children)
    {
      v17 = Children;
      Count = CFArrayGetCount(Children);
      if (Count)
      {
        v19 = Count;
        v20 = objc_msgSend(v8, "pathIndexTouchingMask");
        LODWORD(v42) = objc_msgSend(v8, "pathIndexInRangeMask");
        v41 = v10;
        v40 = v20;
        if (v19 < 1)
        {
          HIDWORD(v42) = v20;
        }
        else
        {
          v21 = 0;
          HIDWORD(v42) = v20;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v17, v21);
            if (IOHIDEventGetType(ValueAtIndex) == 11)
            {
              IntegerValue = IOHIDEventGetIntegerValue(ValueAtIndex, 720901);
              v24 = IOHIDEventGetIntegerValue(ValueAtIndex, 720903);
              if ((v24 & 2) != 0)
              {
                v25 = IOHIDEventGetIntegerValue(ValueAtIndex, 720905);
                v26 = HIDWORD(v42) | (1 << IntegerValue);
                if (!v25)
                  v26 = HIDWORD(v42) & ~(1 << IntegerValue);
                HIDWORD(v42) = v26;
              }
              if ((v24 & 1) != 0)
              {
                v27 = IOHIDEventGetIntegerValue(ValueAtIndex, 720904);
                v28 = v42 | (1 << IntegerValue);
                if (!v27)
                  v28 = v42 & ~(1 << IntegerValue);
                LODWORD(v42) = v28;
              }
            }
            ++v21;
          }
          while (v19 != v21);
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "senderInfo"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "displayUUID"));
        v31 = BKLogTouchEvents(v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          v53 = HIDWORD(v42);
          v54 = 1024;
          v55 = v42;
          v56 = 1024;
          v57 = v40 != 0;
          v58 = 1024;
          v59 = v42 != 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "touches:%X ranges:%X then:%{BOOL}u now:%{BOOL}u", buf, 0x1Au);
        }

        if (!v42 || v40)
        {
          v34 = v41;
        }
        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "overrideSenderDescriptor"));
          v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destinationsForEvent:fromSender:overrideSenderDescriptor:", a3, v29, v33));

          objc_msgSend(v8, "setCurrentDestinations:", v34);
          objc_msgSend(v8, "setEventDispatcher:", v9);
        }
        objc_msgSend(v8, "setPathIndexInRangeMask:", v42);
        objc_msgSend(v8, "setPathIndexTouchingMask:", HIDWORD(v42));
        if (objc_msgSend(v34, "count"))
          _BKHIDNoteUserEventOccurredOnDisplay(v30);
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v37; j = (char *)j + 1)
            {
              if (*(_QWORD *)v44 != v38)
                objc_enumerationMutation(v35);
              -[BKTouchPadManager _queue_sendEvent:fromTouchPad:toDestination:dispatcher:](self, "_queue_sendEvent:fromTouchPad:toDestination:dispatcher:", a3, v8, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j), v9);
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v37);
        }

        v10 = v41;
      }
    }
  }

}

- (void)_queue_sendCancelEventForTouchPad:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const void *DigitizerEvent;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v5 = BKLogTouchEvents(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "touchpad: Cancel (%{public}@)", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDestinations"));
  if (objc_msgSend(v7, "count"))
  {
    v8 = mach_absolute_time();
    DigitizerEvent = (const void *)IOHIDEventCreateDigitizerEvent(0, v8, 3, 0, 0, 128, 0, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0);
    IOHIDEventSetIntegerValue(DigitizerEvent, 720921, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderInfo"));
    IOHIDEventSetSenderID(DigitizerEvent, objc_msgSend(v10, "senderID"));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventDispatcher"));
          -[BKTouchPadManager _queue_sendEvent:fromTouchPad:toDestination:dispatcher:](self, "_queue_sendEvent:fromTouchPad:toDestination:dispatcher:", DigitizerEvent, v4, v16, v17);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    CFRelease(DigitizerEvent);
  }
  objc_msgSend(v4, "resetForCancel");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchPadMatcher, 0);
  objc_storeStrong((id *)&self->_queue_currentTouchPads, 0);
  objc_storeStrong((id *)&self->_touchPadQueue, 0);
}

@end
