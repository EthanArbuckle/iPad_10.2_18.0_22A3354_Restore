@implementation BKHIDDirectTouchEventProcessor

- (void)setEventDispatchMode:(unsigned __int8)a3 ambiguityRecommendation:(unsigned __int8)a4 lastTouchTimestamp:(double)a5 forTouchStreamIdentifier:(unsigned int)a6
{
  NSObject *queue;
  _QWORD block[8];
  unsigned int v8;
  _QWORD v9[3];
  unsigned __int8 v10;
  _QWORD v11[3];
  unsigned __int8 v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000170BC;
  block[3] = &unk_1000EB1B8;
  v8 = a6;
  block[4] = self;
  block[5] = v9;
  block[6] = v11;
  *(double *)&block[7] = a5;
  dispatch_async(queue, block);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

- (id)_queue_touchStreamClientForReference:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *queue_referenceToTouchStreamClient;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](queue_referenceToTouchStreamClient, "objectForKeyedSubscript:", v6));

  return v7;
}

- (void)cancelTouchesOnDisplay:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *queue;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  id v15;

  v5 = BKLogTouchEvents(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a3;
    v8 = objc_msgSend(v7, "length");
    v9 = (void *)BKSDisplayUUIDMainKey;
    if (v8)
      v9 = v7;
    v10 = v9;

    *(_DWORD *)buf = 138543362;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "soft cancel on display:%{public}@", buf, 0xCu);

  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100018EB0;
  v13[3] = &unk_1000ECD80;
  v13[4] = self;
  v13[5] = a3;
  dispatch_async(queue, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKTouchPadManager sharedInstance](BKTouchPadManager, "sharedInstance"));
  objc_msgSend(v12, "sendCancelEventForDisplay:", a3);

}

- (id)_queue_applyCachedPropertiesToMultitouchService:(id)a3
{
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  BKIOHIDServicePersistentPropertyController *persistentPropertyController;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "displayUUID"));
  if (objc_msgSend(a3, "primaryUsagePage") == 13 && objc_msgSend(a3, "primaryUsage") == 4)
  {
    v20 = 0x3FF0000000000000;
    sub_10000F834(v5, 0, 0, (double *)&v20, 0, 0);
    v6 = *(double *)&v20;
    v8 = BKLogTouchEvents(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(a3, "senderID");
      *(_DWORD *)buf = 134218240;
      v22 = v10;
      v23 = 1024;
      LODWORD(v24) = (int)(v6 * 160.0);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "service %llX setProperty:%d forKey:QuantizationDPI", buf, 0x12u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(v6 * 160.0)));
    objc_msgSend(a3, "setProperty:forKey:", v11, CFSTR("QuantizationDPI"));

  }
  persistentPropertyController = self->_persistentPropertyController;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "senderDescriptor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKIOHIDServicePersistentPropertyController allPersistentPropertiesForServicesMatchingDescriptor:](persistentPropertyController, "allPersistentPropertiesForServicesMatchingDescriptor:", v13));

  v15 = objc_msgSend(v14, "count");
  if (v15)
  {
    v16 = BKLogTouchEvents(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(a3, "senderID");
      *(_DWORD *)buf = 134218242;
      v22 = v18;
      v23 = 2114;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "service %llX restore persistent props %{public}@", buf, 0x16u);
    }

    objc_msgSend(a3, "setProperties:", v14);
  }

  return v14;
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  unsigned int v18;
  id v19;
  unsigned int v20;
  uint64_t v21;
  BKIOHIDService *queue_mainDisplayAOPDigitizerService;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint32_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL8 v31;
  double v32;
  BSContinuousMachTimer *queue_mainDisplayDigitizerSentinelTimer;
  BKIOHIDService *v34;
  uint64_t v35;
  NSObject *v36;
  BKIOHIDService *v37;
  uint64_t v38;
  NSObject *v39;
  BKIOHIDService *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  double v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderCache"));

  v42 = v7;
  objc_msgSend(v7, "addSenderInfo:", a4);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = a4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "isBuiltIn");
        v14 = (int)v13;
        v15 = BKLogTouchEvents(v13);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_msgSend(v12, "senderID");
          *(_DWORD *)buf = 134218242;
          v48 = *(double *)&v17;
          v49 = 2114;
          v50 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "digitizer attached (sender %llX) service:%{public}@", buf, 0x16u);
        }

        if (v14)
        {
          v18 = objc_msgSend(v12, "primaryUsagePage");
          v19 = objc_msgSend(v12, "primaryUsage");
          v20 = v19 | (v18 << 16);
          switch(v20)
          {
            case 0xD0001u:
              if (!self->_queue_mainDisplayAOPDigitizerService)
              {
                v38 = BKLogTouchEvents(v19);
                v39 = objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "*** acquired AOP digitizer", buf, 2u);
                }

                v40 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayAOPDigitizerService;
                self->_queue_mainDisplayAOPDigitizerService = v40;
                break;
              }
              v25 = BKLogTouchEvents(v19);
              queue_mainDisplayAOPDigitizerService = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled((os_log_t)queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v23 = queue_mainDisplayAOPDigitizerService;
                v24 = "*** already have an AOP digitizer";
LABEL_21:
                v27 = 2;
                goto LABEL_24;
              }
              break;
            case 0xD0004u:
              if (!self->_queue_mainDisplayDigitizerService)
              {
                v29 = BKLogTouchEvents(v19);
                v30 = objc_claimAutoreleasedReturnValue(v29);
                v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
                if (v31)
                {
                  v32 = BSContinuousMachTimeNow(v31) - self->_queue_startMainDisplayDigitizerMatchingTime;
                  *(_DWORD *)buf = 134217984;
                  v48 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "*** acquired main display digitizer (after %gs)", buf, 0xCu);
                }

                -[BSContinuousMachTimer invalidate](self->_queue_mainDisplayDigitizerSentinelTimer, "invalidate");
                queue_mainDisplayDigitizerSentinelTimer = self->_queue_mainDisplayDigitizerSentinelTimer;
                self->_queue_mainDisplayDigitizerSentinelTimer = 0;

                v34 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayDigitizerService;
                self->_queue_mainDisplayDigitizerService = v34;
                break;
              }
              v26 = BKLogTouchEvents(v19);
              queue_mainDisplayAOPDigitizerService = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled((os_log_t)queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v23 = queue_mainDisplayAOPDigitizerService;
                v24 = "*** already have a main display digitizer";
                goto LABEL_21;
              }
              break;
            case 0xD0020u:
              if (self->_queue_mainDisplayPencilDigitizerService)
              {
                v21 = BKLogTouchEvents(v19);
                queue_mainDisplayAOPDigitizerService = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(v21);
                if (os_log_type_enabled((os_log_t)queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v23 = queue_mainDisplayAOPDigitizerService;
                  v24 = "*** already have a pencil digitizer";
                  goto LABEL_21;
                }
              }
              else
              {
                v35 = BKLogTouchEvents(v19);
                v36 = objc_claimAutoreleasedReturnValue(v35);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "*** acquired pencil digitizer", buf, 2u);
                }

                v37 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayPencilDigitizerService;
                self->_queue_mainDisplayPencilDigitizerService = v37;
              }
              break;
            default:
              v28 = BKLogTouchEvents(v19);
              queue_mainDisplayAOPDigitizerService = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(v28);
              if (!os_log_type_enabled((os_log_t)queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
                break;
              *(_DWORD *)buf = 67109120;
              LODWORD(v48) = v20;
              v23 = queue_mainDisplayAOPDigitizerService;
              v24 = "*** unexpected digitizer usage pair 0x%X";
              v27 = 8;
LABEL_24:
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, buf, v27);
              break;
          }

        }
        v41 = -[BKHIDDirectTouchEventProcessor _queue_addDigitizerStateForService:](self, "_queue_addDigitizerStateForService:", v12);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v9);
  }

}

- (void)serviceDidDisappear:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BKIOHIDService *queue_mainDisplayDigitizerService;
  uint64_t v12;
  NSObject *v13;
  BKIOHIDService *queue_mainDisplayPencilDigitizerService;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  unsigned int v27;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = BKLogTouchEvents(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134218240;
    v25 = objc_msgSend(a3, "senderID");
    v26 = 1024;
    v27 = objc_msgSend(a3, "isBuiltIn");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "digitizer detached (sender %llX) builtIn:%d", (uint8_t *)&v24, 0x12u);
  }

  if (self->_queue_mainDisplayDigitizerService == a3)
  {
    v9 = BKLogTouchEvents(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "*** lost main display digitizer ***", (uint8_t *)&v24, 2u);
    }

    queue_mainDisplayDigitizerService = self->_queue_mainDisplayDigitizerService;
    self->_queue_mainDisplayDigitizerService = 0;

  }
  if (self->_queue_mainDisplayPencilDigitizerService == a3)
  {
    v12 = BKLogTouchEvents(v8);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "*** lost pencil digitizer ***", (uint8_t *)&v24, 2u);
    }

    queue_mainDisplayPencilDigitizerService = self->_queue_mainDisplayPencilDigitizerService;
    self->_queue_mainDisplayPencilDigitizerService = 0;

  }
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "displayUUID"));
  v16 = objc_msgSend(v15, "length");
  v17 = (void *)BKSDisplayUUIDMainKey;
  if (v16)
    v17 = v15;
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor _queue_digitizerStateForService:](self, "_queue_digitizerStateForService:", a3));
  v20 = BKLogTouchEvents(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138543362;
    v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "cancel -- digitizer did disappear:%{public}@", (uint8_t *)&v24, 0xCu);
  }

  objc_msgSend(v19, "invalidate");
  v22 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_perDisplayInfo, "objectForKey:", v18));
  v23 = (void *)v22;
  if (v22)
    objc_msgSend(*(id *)(v22 + 48), "removeObjectForKey:", a3);

}

- (void)setHitTestRegions:(id)a3 forDisplay:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C70;
  block[3] = &unk_1000ECD38;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(queue, block);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  __IOHIDEvent *v8;
  __IOHIDEvent *v9;
  __IOHIDEvent *v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  BOOL v17;
  id v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  BOOL v25;
  __IOHIDEvent *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  __IOHIDEvent *v30;
  __int16 v31;
  __IOHIDEvent *v32;

  v8 = *a3;
  v26 = v8;
  v25 = 0;
  v9 = (__IOHIDEvent *)objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor _determineServiceForEvent:sender:fromTouchPad:](self, "_determineServiceForEvent:sender:fromTouchPad:", v8, a4, &v25));
  v10 = v9;
  if (v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[__IOHIDEvent displayUUID](v9, "displayUUID"));
    v12 = -[__IOHIDEvent primaryUsagePage](v10, "primaryUsagePage");
    v13 = -[__IOHIDEvent primaryUsage](v10, "primaryUsage");
    if (v25)
    {
LABEL_3:
      v14 = objc_claimAutoreleasedReturnValue(+[BKTouchPadManager sharedInstance](BKTouchPadManager, "sharedInstance"));
      -[NSObject processEvent:sender:dispatcher:](v14, "processEvent:sender:dispatcher:", &v26, a4, a5);
LABEL_4:

      goto LABEL_7;
    }
    if (v12 == 13)
    {
      v17 = v13 == 12 || v13 == 5;
      v25 = v17;
      if (v13 == 12 || v13 == 5)
        goto LABEL_3;
    }
    else
    {
      v25 = 0;
    }
    v18 = -[__IOHIDEvent isBuiltIn](v10, "isBuiltIn");
    if ((v11 != 0) != (_DWORD)v18)
    {
      v19 = -[__IOHIDEvent primaryUsagePage](v10, "primaryUsagePage");
      v18 = -[__IOHIDEvent primaryUsage](v10, "primaryUsage");
      if ((v18 | (v19 << 16)) - 851969 <= 0x1F && ((1 << ((_BYTE)v18 - 1)) & 0x80000009) != 0)
      {
        -[BKHIDDirectTouchEventProcessor _handleDirectTouchEvent:service:](self, "_handleDirectTouchEvent:service:", v8, v10);
        goto LABEL_7;
      }
    }
    v20 = BKLogTouchEvents(v18);
    v14 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = v11;
      v22 = -[NSObject length](v21, "length");
      v23 = BKSDisplayUUIDMainKey;
      if (v22)
        v23 = v21;
      v24 = v23;

      *(_DWORD *)buf = 138543874;
      v28 = v24;
      v29 = 2114;
      v30 = v10;
      v31 = 2114;
      v32 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "ignoring digitizer event for display %{public}@ from unsupported service: (%{public}@):%{public}@", buf, 0x20u);

    }
    goto LABEL_4;
  }
  v15 = BKLogTouchEvents(0);
  v11 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v28 = a4;
    v29 = 2114;
    v30 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "ignoring digitizer event from non-digitizer sender (%{public}@):%{public}@", buf, 0x16u);
  }
LABEL_7:

  return 0;
}

- (void)_handleDirectTouchEvent:(__IOHIDEvent *)a3 service:(id)a4
{
  NSObject *queue;
  void *v9;
  NSString *v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  uint64_t TimeStamp;
  uint64_t v17;
  _QWORD block[7];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  BKHIDDirectTouchEventProcessor *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (!a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must have a service here")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue(v10);
      v13 = (objc_class *)objc_opt_class(self, v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138544642;
      v20 = v11;
      v21 = 2114;
      v22 = v15;
      v23 = 2048;
      v24 = self;
      v25 = 2114;
      v26 = CFSTR("BKHIDDirectTouchEventProcessor.mm");
      v27 = 1024;
      v28 = 1250;
      v29 = 2114;
      v30 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    __break(0);
    JUMPOUT(0x100009350);
  }
  if (byte_100117398)
  {
    if (a3)
      TimeStamp = IOHIDEventGetTimeStamp(a3);
    else
      TimeStamp = 0;
    kdebug_trace(730464260, TimeStamp, 0, 0, 0);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BEA0;
  block[3] = &unk_1000EB798;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_sync(queue, block);
  if (byte_100117398)
  {
    if (a3)
      v17 = IOHIDEventGetTimeStamp(a3);
    else
      v17 = 0;
    kdebug_trace(730464264, v17, 0, 0, 0);
  }
}

- (id)_determineServiceForEvent:(__IOHIDEvent *)a3 sender:(id)a4 fromTouchPad:(BOOL *)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t Type;
  uint64_t v26;
  void *v28;
  int v29;
  void *v30;

  v9 = objc_opt_class(BKHIDAccessibilitySender, a2);
  if ((objc_opt_isKindOfClass(a4, v9) & 1) == 0 || (v11 = a4) == 0)
  {
    v17 = objc_opt_class(BKIOHIDService, v10);
    v18 = a4;
    v19 = v18;
    if (v17)
    {
      if ((objc_opt_isKindOfClass(v18, v17) & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    v12 = 0;
    v22 = 0;
    goto LABEL_27;
  }
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayUUID"));

  if (v13)
  {
    v15 = BKLogTouchEvents(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayUUID"));
      v29 = 138543362;
      v30 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Not supported: accessibility digitizer for external display (%{public}@)", (uint8_t *)&v29, 0xCu);

    }
LABEL_26:

    v22 = 0;
    v21 = 0;
    goto LABEL_27;
  }
  if (!objc_msgSend(v12, "isPencilDigitizer"))
    goto LABEL_18;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor mainDisplayPencilDigitizerService](self, "mainDisplayPencilDigitizerService"));
  if (!v21)
  {
    v23 = BKLogTouchEvents(0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Pencil AX event, but pencil digitizer is missing", (uint8_t *)&v29, 2u);
    }

LABEL_18:
    v21 = (id)objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor mainDisplayDigitizerService](self, "mainDisplayDigitizerService"));
  }
  Type = IOHIDEventGetType(a3);
  if ((_DWORD)Type == 11)
  {
    Type = IOHIDEventGetIntegerValue(a3, 720921);
    v22 = Type == 0;
    if (v21)
      goto LABEL_27;
  }
  else
  {
    v22 = 0;
    if (v21)
      goto LABEL_27;
  }
  if (!v22)
  {
    v26 = BKLogTouchEvents(Type);
    v16 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "AX event, but main screen digitizer is missing", (uint8_t *)&v29, 2u);
    }
    goto LABEL_26;
  }
LABEL_27:
  *a5 = v22;

  return v21;
}

- (id)_queue_addDigitizerStateForService:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  BKTouchDeliveryStatisticsLoggingObserver *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BKDirectTouchState *v13;
  BKHIDEventHitTestDispatcher *dispatcher;
  BKHIDDirectTouchEventProcessor *v15;
  uint64_t v16;
  BKHIDDirectTouchEventProcessor *v17;
  uint64_t v18;
  uint64_t v19;
  BKTouchContactSet *v20;
  BSInvalidatable *globalKeyboardObserver;
  NSMutableDictionary *v22;
  NSMutableDictionary *queue_perDisplayInfo;
  NSMutableDictionary *v24;
  NSMutableDictionary *queue_referenceToTouchStreamClient;
  id v26;
  void *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *queue_slotIDToSlotRecord;
  BKDirectTouchStateHitTester *v30;
  id *v31;
  BKHIDDirectTouchEventProcessor *v32;
  id v33;
  BKDirectTouchStateHitTester *v34;
  id v35;
  BKDirectTouchUpdateEvents *v36;
  id *v37;
  id *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  id *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  int64_t queue_interfaceOrientation;
  void *v55;
  unsigned int v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v63;
  NSString *v64;
  id v65;
  uint64_t v66;
  objc_class *v67;
  NSString *v68;
  void *v69;
  void *v70;
  void *v71;
  BKTouchDeliveryStatisticsLoggingObserver *v72;
  objc_super v73;
  _BYTE v74[22];
  __int16 v75;
  BKHIDDirectTouchEventProcessor *v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  void *v82;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor _queue_applyCachedPropertiesToMultitouchService:](self, "_queue_applyCachedPropertiesToMultitouchService:", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "displayUUID"));
  v6 = objc_msgSend(v5, "length");
  v7 = (void *)BKSDisplayUUIDMainKey;
  if (v6)
    v7 = v5;
  v8 = v7;

  v70 = v8;
  v9 = [BKTouchDeliveryStatisticsLoggingObserver alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llX-%@"), objc_msgSend(a3, "senderID"), v8));
  v72 = -[BKTouchDeliveryStatisticsLoggingObserver initWithLabel:](v9, "initWithLabel:", v10);

  v11 = objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:](self, "_queue_displayInfoForDisplay:createIfNeeded:", v8, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKTouchDeliveryObservationManager sharedInstance](BKTouchDeliveryObservationManager, "sharedInstance"));
  v13 = [BKDirectTouchState alloc];
  if (v13
    && (dispatcher = self->_dispatcher,
        v73.receiver = v13,
        v73.super_class = (Class)BKDirectTouchState,
        v15 = -[BKHIDDirectTouchEventProcessor init](&v73, "init"),
        (v17 = v15) != 0))
  {
    v18 = objc_opt_class(v15, v16);
    if (v18 != objc_opt_class(BKDirectTouchState, v19))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclasses not allowed")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v64 = NSStringFromSelector("initWithHIDService:eventProcessor:displayInfo:dispatcher:touchDeliveryObserver:statisticsObserver:deliveryPolicyServer:eventSystemInteface:");
        v65 = (id)objc_claimAutoreleasedReturnValue(v64);
        v67 = (objc_class *)objc_opt_class(v17, v66);
        v68 = NSStringFromClass(v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        *(_DWORD *)v74 = 138544642;
        *(_QWORD *)&v74[4] = v65;
        *(_WORD *)&v74[12] = 2114;
        *(_QWORD *)&v74[14] = v69;
        v75 = 2048;
        v76 = v17;
        v77 = 2114;
        v78 = CFSTR("BKDirectTouchState.mm");
        v79 = 1024;
        v80 = 204;
        v81 = 2114;
        v82 = v63;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v74, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v63), "UTF8String"));
      __break(0);
      JUMPOUT(0x100009D7CLL);
    }
    objc_storeStrong((id *)&v17->_queue, a3);
    objc_storeStrong((id *)&v17->_touchEventServer, self);
    objc_storeStrong((id *)&v17->_matchers, (id)v11);
    objc_storeStrong((id *)&v17->_pencilOpaqueTouchPersistentPropertySupport, dispatcher);
    objc_storeStrong((id *)&v17->_queue_mainDisplayAOPDigitizerService, v12);
    objc_storeStrong((id *)&v17->_queue_mainDisplayDigitizerService, 0);
    objc_storeStrong((id *)&v17->_queue_mainDisplayDigitizerSentinelTimer, 0);
    v20 = objc_alloc_init(BKTouchContactSet);
    globalKeyboardObserver = v17->_globalKeyboardObserver;
    v17->_globalKeyboardObserver = (BSInvalidatable *)v20;

    v22 = (NSMutableDictionary *)objc_alloc_init((Class)BSMutableIntegerMap);
    queue_perDisplayInfo = v17->_queue_perDisplayInfo;
    v17->_queue_perDisplayInfo = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)BSMutableIntegerMap);
    queue_referenceToTouchStreamClient = v17->_queue_referenceToTouchStreamClient;
    v17->_queue_referenceToTouchStreamClient = v24;

    v26 = objc_alloc_init((Class)BSMutableIntegerMap);
    v27 = *(void **)&v17->_queue_previousVendedTouchStreamReference;
    *(_QWORD *)&v17->_queue_previousVendedTouchStreamReference = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableSet);
    queue_slotIDToSlotRecord = v17->_queue_slotIDToSlotRecord;
    v17->_queue_slotIDToSlotRecord = v28;

    v30 = [BKDirectTouchStateHitTester alloc];
    v31 = v17;
    v32 = self;
    v33 = (id)v11;
    if (v30)
    {
      *(_QWORD *)v74 = v30;
      *(_QWORD *)&v74[8] = BKDirectTouchStateHitTester;
      v34 = (BKDirectTouchStateHitTester *)objc_msgSendSuper2((objc_super *)v74, "init");
      v30 = v34;
      if (v34)
      {
        objc_storeStrong((id *)&v34->_state, v17);
        objc_storeStrong((id *)&v30->_eventProcessor, self);
        objc_storeStrong((id *)&v30->_displayInfo, (id)v11);
        objc_storeStrong((id *)&v30->_touchDeliveryPolicyServer, 0);
      }
    }

    v35 = v31[3];
    v31[3] = v30;

    v36 = [BKDirectTouchUpdateEvents alloc];
    if (v36)
    {
      *(_QWORD *)v74 = v36;
      *(_QWORD *)&v74[8] = BKDirectTouchUpdateEvents;
      v37 = (id *)objc_msgSendSuper2((objc_super *)v74, "init");
      v38 = v37;
      if (v37)
        objc_storeStrong(v37 + 3, v17);
    }
    else
    {
      v38 = 0;
    }
    v39 = v31[23];
    v31[23] = v38;

    v40 = objc_alloc_init((Class)NSMutableArray);
    v41 = v31[9];
    v31[9] = v40;

    if (v72)
      objc_msgSend(v31[9], "addObject:", v72);
    if (v12)
      objc_msgSend(v31[9], "addObject:", v12);
    *((_BYTE *)v31 + 205) = objc_msgSend(a3, "primaryUsage") == 32;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_queue propertyForKey:](v17->_queue, "propertyForKey:", CFSTR("MaxHoverHeight")));
    v43 = v42;
    if (v42)
    {
      objc_msgSend(v42, "doubleValue");
      v31[24] = v44;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    sub_100009EB4((uint64_t)v31, (uint64_t)objc_msgSend(v45, "digitizerVisualizeTouches"), (uint64_t)objc_msgSend(v45, "digitizerVisualizeHitTestRegions"));
    v47 = BKLogTouchEvents(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v74 = 138543362;
      *(_QWORD *)&v74[4] = v31;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "init: %{public}@", v74, 0xCu);
    }

  }
  else
  {
    v31 = 0;
  }
  v49 = v31;
  v50 = a3;
  if (v11)
  {
    v51 = *(void **)(v11 + 48);
    if (!v51)
    {
      v52 = objc_alloc_init((Class)NSMutableDictionary);
      v53 = *(void **)(v11 + 48);
      *(_QWORD *)(v11 + 48) = v52;

      v51 = *(void **)(v11 + 48);
    }
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v49, v50);
  }

  queue_interfaceOrientation = self->_queue_interfaceOrientation;
  if (queue_interfaceOrientation && v49)
    v49[19] = (id)queue_interfaceOrientation;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", CFSTR("HoverDisabled")));
  v56 = objc_msgSend(v55, "BOOLValue");

  if (v56)
  {
    if (!v49)
      goto LABEL_34;
    *((_BYTE *)v49 + 209) = 1;
  }
  else if (!v49)
  {
    goto LABEL_34;
  }
  v49[13] = (id)self->_queue_activeModifiers;
LABEL_34:
  if (v11)
  {
    v57 = *(id *)(v11 + 32);
    if (v57)
      sub_100017654((uint64_t)v49, v57);
  }
  else
  {
    v57 = 0;
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  v59 = objc_msgSend(v58, "digitizerVisualizeTouches");

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  v61 = objc_msgSend(v60, "digitizerVisualizeHitTestRegions");

  sub_100009EB4((uint64_t)v49, (uint64_t)v59, (uint64_t)v61);
  objc_msgSend(v50, "addDisappearanceObserver:queue:", self, self->_queue);

  return v49;
}

- (id)_queue_digitizerStateForService:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "displayUUID"));
  v6 = objc_msgSend(v5, "length");
  v7 = (void *)BKSDisplayUUIDMainKey;
  if (v6)
    v7 = v5;
  v8 = v7;

  v9 = objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:](self, "_queue_displayInfoForDisplay:createIfNeeded:", v8, 1));
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v9 + 48), "objectForKeyedSubscript:", a3));
  else
    v11 = 0;

  return v11;
}

- (void)_queue_enumerateDigitizersForDisplay:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id *v11;
  id *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8)
    v9 = v7;
  v10 = v9;

  v11 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_queue_perDisplayInfo, "objectForKeyedSubscript:", v10));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = sub_10000C210(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        (*((void (**)(id, _QWORD))a4 + 2))(a4, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16));
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (id)_queue_displayInfoForDisplay:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *queue_perDisplayInfo;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  BKDirectTouchPerDisplayInfo *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BKDisplayController *defaultDisplayController;
  BKDisplayController *v15;
  BKDisplayController *v16;

  if (!a3)
    __assert_rtn("-[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:]", "BKHIDDirectTouchEventProcessor.mm", 1064, "displayUUID");
  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  if (!queue_perDisplayInfo)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = self->_queue_perDisplayInfo;
    self->_queue_perDisplayInfo = v8;

    queue_perDisplayInfo = self->_queue_perDisplayInfo;
  }
  v10 = (BKDirectTouchPerDisplayInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](queue_perDisplayInfo, "objectForKeyedSubscript:", a3));
  if (v10)
    v11 = 1;
  else
    v11 = !v4;
  if (!v11)
  {
    v10 = objc_alloc_init(BKDirectTouchPerDisplayInfo);
    if (objc_msgSend(a3, "isEqualToString:", BKSDisplayUUIDMainKey))
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay builtinDisplay](BKSHIDEventDisplay, "builtinDisplay"));
    else
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay displayWithHardwareIdentifier:](BKSHIDEventDisplay, "displayWithHardwareIdentifier:", a3));
    v13 = v12;
    if (v10)
      objc_storeStrong((id *)&v10->_display, v12);
    defaultDisplayController = self->_defaultDisplayController;
    if (defaultDisplayController)
      v15 = defaultDisplayController;
    else
      v15 = (BKDisplayController *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](BKDisplayController, "sharedInstance"));
    v16 = v15;
    if (v10)
      objc_storeStrong((id *)&v10->_displayController, v15);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_perDisplayInfo, "setObject:forKeyedSubscript:", v10, a3);
  }
  return v10;
}

- (BKHIDDirectTouchEventProcessor)initWithContext:(id)a3
{
  void *v5;
  BKHIDDirectTouchEventProcessor *v6;
  BKHIDDirectTouchEventProcessor *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  void *v10;
  id v11;
  void *v12;
  BKIOHIDServiceSimplePersistentPropertySupport *v13;
  BKIOHIDServiceSimplePersistentPropertySupport *pencilOpaqueTouchPersistentPropertySupport;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *i;
  id v20;
  uint64_t v21;
  id v22;
  OS_dispatch_queue *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  dispatch_queue_global_t global_queue;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  BKHIDDirectTouchEventProcessor *v36;
  id v37;
  OS_dispatch_queue *v38;
  id v39;
  void *v40;
  BKHIDDirectTouchEventProcessor *v41;
  id v43;
  id v44;
  BKHIDEventHitTestDispatcher *obj;
  id v46;
  _QWORD v47[4];
  BKHIDDirectTouchEventProcessor *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  BKHIDDirectTouchEventProcessor *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id location;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _QWORD v67[2];
  _BYTE v68[128];
  _BYTE v69[128];

  obj = objc_alloc_init(BKHIDEventHitTestDispatcher);
  objc_opt_self(BKTouchEventServer);
  if (qword_100117348 != -1)
    dispatch_once(&qword_100117348, &stru_1000EAC48);
  v5 = (void *)qword_100117350;
  v44 = (id)qword_100117350;
  v46 = (id)objc_claimAutoreleasedReturnValue(+[BKIOHIDServicePersistentPropertyController digitizerServicePersistentPropertyController](BKIOHIDServicePersistentPropertyController, "digitizerServicePersistentPropertyController"));
  if (self
    && (v66.receiver = self,
        v66.super_class = (Class)BKHIDDirectTouchEventProcessor,
        v6 = -[BKHIDDirectTouchEventProcessor init](&v66, "init"),
        (v7 = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_dispatcher, obj);
    objc_storeStrong((id *)&v7->_touchEventServer, v5);
    objc_storeStrong((id *)&v7->_persistentPropertyController, v46);
    v8 = BSDispatchQueueCreateWithFixedPriority("BKDigitizerInfoArbiterDispatchQueue", 0, 63);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "serviceMatcherDataProvider"));
    v11 = objc_alloc((Class)BKIOHIDServiceSimplePersistentPropertySupport);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventSenderDescriptor stylusOpaqueTouchDigitizer](BKSHIDEventSenderDescriptor, "stylusOpaqueTouchDigitizer"));
    v13 = (BKIOHIDServiceSimplePersistentPropertySupport *)objc_msgSend(v11, "initWithSenderDescriptor:matcherDataProvider:persistentPropertyController:", v12, v10, v46);
    pencilOpaqueTouchPersistentPropertySupport = v7->_pencilOpaqueTouchPersistentPropertySupport;
    v7->_pencilOpaqueTouchPersistentPropertySupport = v13;

    objc_msgSend(v46, "registerHandler:", v7->_pencilOpaqueTouchPersistentPropertySupport);
    v15 = objc_alloc_init((Class)NSMutableArray);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDDirectTouchEventProcessor digitizerMatchingDictionaries](BKHIDDirectTouchEventProcessor, "digitizerMatchingDictionaries"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v18)
            objc_enumerationMutation(v16);
          v20 = objc_msgSend(objc_alloc((Class)BKIOHIDServiceMatcher), "initWithMatchingDictionary:dataProvider:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i), v10);
          objc_msgSend(v15, "addObject:", v20);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v17);
    }

    objc_storeStrong((id *)&v7->_matchers, v15);
    v7->_queue_startMainDisplayDigitizerMatchingTime = BSContinuousMachTimeNow(v21);
    objc_initWeak(&location, v7);
    v22 = objc_msgSend(objc_alloc((Class)BSContinuousMachTimer), "initWithIdentifier:", CFSTR("BKHIDDirectTouchEventProcessor-WaitForMainDigitizer"));
    objc_storeStrong((id *)&v7->_queue_mainDisplayDigitizerSentinelTimer, v22);
    v23 = v7->_queue;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000592DC;
    v58[3] = &unk_1000EAFE0;
    objc_copyWeak(&v60, &location);
    v59 = v22;
    v43 = v59;
    objc_msgSend(v59, "scheduleWithFireInterval:leewayInterval:queue:handler:", v23, v58, 60.0, 5.0);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v24 = v15;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v55 != v26)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j), "startObserving:queue:", v7, v7->_queue);
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      }
      while (v25);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "digitizerSignpostsEnabled"));
    global_queue = dispatch_get_global_queue(21, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v32 = objc_msgSend(v28, "observeDefault:onQueue:withBlock:", v29, v31, &stru_1000EB000);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "digitizerVisualizeTouches"));
    v67[0] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "digitizerVisualizeHitTestRegions"));
    v67[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 2));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000593D8;
    v52[3] = &unk_1000ECDA8;
    v36 = v7;
    v53 = v36;
    v37 = objc_msgSend(v28, "observeDefaults:onQueue:withBlock:", v35, v31, v52);

    v38 = v7->_queue;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100059444;
    v50[3] = &unk_1000EC208;
    objc_copyWeak(&v51, &location);
    v39 = (id)BSLogAddStateCaptureBlockWithTitle(v38, CFSTR("BKDirectTouch"), v50);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](CAWindowServer, "serverIfRunning"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000594A8;
    v47[3] = &unk_1000EB048;
    objc_copyWeak(&v49, &location);
    v41 = v36;
    v48 = v41;
    objc_msgSend(v40, "setSlotDeletionCallback:", v47);

    -[BKIOHIDServicePersistentPropertyController registerHandler:](v7->_persistentPropertyController, "registerHandler:", v41);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (void)dealloc
{
  objc_super v3;

  -[BKIOHIDServiceSimplePersistentPropertySupport invalidate](self->_pencilOpaqueTouchPersistentPropertySupport, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKHIDDirectTouchEventProcessor;
  -[BKHIDDirectTouchEventProcessor dealloc](&v3, "dealloc");
}

- (void)didInitializeRegistryWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  BSInvalidatable *v7;
  BSInvalidatable *globalKeyboardObserver;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "eventProcessorRegistry"));
  v6 = objc_msgSend(v4, "eventProcessorOfClass:", objc_opt_class(BKKeyboardHIDEventProcessor, v5));
  v9 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addGlobalKeyboardObserver:", self));
  globalKeyboardObserver = self->_globalKeyboardObserver;
  self->_globalKeyboardObserver = v7;

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100059264;
  v6[3] = &unk_1000ECD80;
  v6[4] = a3;
  v6[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v6);
  v5 = objc_msgSend(a3, "appendObject:withName:", self->_queue_perDisplayInfo, CFSTR("perDisplayInfo"));
}

- (BKIOHIDService)mainDisplayDigitizerService
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10005615C;
  v10 = sub_10005616C;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059250;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (BKIOHIDService)mainDisplayAOPDigitizerService
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10005615C;
  v10 = sub_10005616C;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005923C;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (BKIOHIDService)mainDisplayPencilDigitizerService
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10005615C;
  v10 = sub_10005616C;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059228;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (void)cancelTouchesWithIdentifiers:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD block[7];
  uint8_t buf[4];
  id v12;

  v5 = (uint64_t)objc_msgSend(a3, "count");
  v6 = BKLogTouchEvents(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 < 31)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cancel touches with identifiers: %{public}@", buf, 0xCu);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059040;
    block[3] = &unk_1000EB798;
    block[4] = a3;
    block[5] = self;
    block[6] = v5;
    dispatch_async(queue, block);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "too many touch identifiers passed to CancelTouchesWithIdentifiers (%d)", buf, 8u);
    }

  }
}

- (void)cancelTouchesOnMainDisplay
{
  -[BKHIDDirectTouchEventProcessor cancelTouchesOnDisplay:](self, "cancelTouchesOnDisplay:", 0);
}

- (void)cancelTouchesOnAllDisplays
{
  uint64_t v3;
  NSObject *v4;
  NSObject *queue;
  void *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = BKLogTouchEvents(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "soft cancel on all displays", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059020;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(queue, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKTouchPadManager sharedInstance](BKTouchPadManager, "sharedInstance"));
  objc_msgSend(v6, "sendCancelEventForAllDisplays");

}

- (id)cancelAndSuppressTouchesOnDisplay:(id)a3 reason:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD block[6];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v7 = BKLogTouchEvents(self);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "canceling events for suppression reason: %{public}@", buf, 0xCu);
  }

  v9 = objc_alloc_init((Class)NSMutableArray);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058E48;
  block[3] = &unk_1000EB770;
  block[4] = self;
  block[5] = a3;
  v11 = v9;
  v19 = v11;
  v20 = a4;
  dispatch_sync(queue, block);
  v12 = objc_alloc((Class)BSSimpleAssertion);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100058EDC;
  v16[3] = &unk_1000EB118;
  v13 = v11;
  v17 = v13;
  v14 = objc_msgSend(v12, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("touch-suppression-cancel-array"), a4, v16);

  return v14;
}

- (unsigned)addTouchStreamForContextID:(unsigned int)a3 display:(id)a4 versionedPID:(int64_t)a5 identifier:(unsigned int)a6 shouldSendAmbiguityRecommendations:(BOOL)a7
{
  NSObject *queue;
  unsigned int v8;
  _QWORD v10[8];
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000584CC;
  v10[3] = &unk_1000EB168;
  v10[4] = self;
  v10[5] = a4;
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v10[6] = &v14;
  v10[7] = a5;
  dispatch_sync(queue, v10);
  v8 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)invalidateTouchStreamReference:(unsigned int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  unsigned int v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058270;
  v4[3] = &unk_1000EC950;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)transferTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 toContextID:(unsigned int)a5
{
  NSObject *queue;
  _QWORD v6[7];
  unsigned int v7;

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005796C;
  v6[3] = &unk_1000EB200;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v7 = a5;
  dispatch_sync(queue, v6);
}

- (BOOL)detachTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 assignUserIdentifier:(unsigned int)a5 policy:(id)a6 offset:(CGPoint)a7
{
  NSObject *queue;
  char v8;
  _QWORD v10[9];
  CGPoint v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100057508;
  v10[3] = &unk_1000EB250;
  v10[6] = &v13;
  v10[7] = a3;
  v10[8] = a4;
  v12 = a5;
  v10[4] = self;
  v10[5] = a6;
  v11 = a7;
  dispatch_sync(queue, v10);
  v8 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)setRoutingPolicy:(id)a3 forTouchesWithUserIdentifier:(unsigned int)a4
{
  NSObject *queue;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[6];
  unsigned int v8;
  uint8_t buf[16];

  if (a4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100057234;
    block[3] = &unk_1000ECDF8;
    block[4] = self;
    block[5] = a3;
    v8 = a4;
    dispatch_sync(queue, block);
  }
  else
  {
    v5 = BKLogTouchEvents(self);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "cannot alter routing policy for touches with zero userIdentifer", buf, 2u);
    }

  }
}

- (void)setOffset:(CGPoint)a3 forTouchesWithUserIdentifier:(unsigned int)a4
{
  NSObject *queue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  CGPoint v8;
  unsigned int v9;
  uint8_t buf[16];

  if (a4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100057078;
    v7[3] = &unk_1000EB200;
    v7[4] = self;
    v8 = a3;
    v9 = a4;
    dispatch_sync(queue, v7);
  }
  else
  {
    v5 = BKLogTouchEvents(self);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "cannot alter touch offset for zero userIdentifer", buf, 2u);
    }

  }
}

- (void)postTouchAnnotations:(id)a3 sourcePID:(int)a4
{
  NSObject *queue;
  _QWORD block[6];
  int v6;

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056E08;
  block[3] = &unk_1000ECDF8;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(queue, block);
}

- (BOOL)shouldIgnoreTouchesWhileObjectInProximity
{
  BKHIDDirectTouchEventProcessor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_shouldIgnoreTouchesWhileObjectInProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setShouldIgnoreTouchesWhileObjectInProximity:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldIgnoreTouchesWhileObjectInProximity = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setExcludedZoomContextIDs:(id)a3 fromVersionedPID:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056CCC;
  block[3] = &unk_1000EB798;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)setBuiltInDisplayInterfaceOrientation:(int64_t)a3
{
  uint64_t v5;
  BKIOHIDServicePersistentPropertyController *persistentPropertyController;
  void *v7;
  void *v8;
  void *v9;
  NSObject *queue;
  _QWORD block[6];
  const __CFString *v12;
  void *v13;

  if ((unint64_t)(a3 - 1) > 3)
    v5 = 0;
  else
    v5 = dword_1000B3DB0[a3 - 1];
  persistentPropertyController = self->_persistentPropertyController;
  v12 = CFSTR("GraphicsOrientation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
  v13 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventSenderDescriptor anyBuiltinTouchscreenDigitizer](BKSHIDEventSenderDescriptor, "anyBuiltinTouchscreenDigitizer"));
  -[BKIOHIDServicePersistentPropertyController setPersistentProperties:forSenderDescriptor:](persistentPropertyController, "setPersistentProperties:forSenderDescriptor:", v8, v9);

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018C9C;
  block[3] = &unk_1000ECB60;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (id)authenticationSpecificationForSlotID:(unsigned int)a3 registrantEntitled:(BOOL *)a4
{
  NSObject *queue;
  id v5;
  _QWORD v7[7];
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  *a4 = 0;
  if (!a3)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10005615C;
  v13 = sub_10005616C;
  v14 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100056C08;
  v7[3] = &unk_1000EB2C0;
  v8 = a3;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a4;
  dispatch_sync(queue, v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (void)addTouchAuthenticationSpecifications:(id)a3 registrantEntitled:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056944;
  block[3] = &unk_1000EB2E8;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_sync(queue, block);
}

- (void)_queue_resetTouchAuthenticationInitialSampleEvent
{
  NSMutableOrderedSet *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSMutableOrderedSet *queue_touchEnterSlotIDs;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  NSMutableOrderedSet *v19;
  _BYTE v20[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_queue_touchEnterSlotIDs;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_slotIDToSlotRecord, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v7), (_QWORD)v14));
        if (v8)
        {
          if ((uint64_t)v7 + v5 >= 2)
            v9 = 1;
          else
            v9 = 2;
          v8[3] = v9;
        }

        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      v5 += (uint64_t)v7;
    }
    while (v4);
  }

  v11 = BKLogTouchEvents(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    queue_touchEnterSlotIDs = self->_queue_touchEnterSlotIDs;
    *(_DWORD *)buf = 138543362;
    v19 = queue_touchEnterSlotIDs;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "resetTouchAuthenticationInitialSampleEventMasks:%{public}@", buf, 0xCu);
  }

}

- (void)applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  CGFloat y;
  CGFloat x;
  NSObject *queue;
  _QWORD block[10];
  unsigned int v16;

  y = a3.y;
  x = a3.x;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056538;
  block[3] = &unk_1000EB310;
  block[4] = a4;
  block[5] = self;
  *(CGFloat *)&block[8] = x;
  *(CGFloat *)&block[9] = y;
  v16 = a6;
  block[6] = a5;
  block[7] = a7;
  dispatch_sync(queue, block);
}

- (void)_queue_windowServerDidDeleteSlotID:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NSMutableDictionary count](self->_queue_slotIDToSlotRecord, "count");
  if (v5)
  {
    v6 = BKLogTouchEvents(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CA didDeleteSlot:%X", (uint8_t *)v9, 8u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    -[NSMutableDictionary removeObjectForKey:](self->_queue_slotIDToSlotRecord, "removeObjectForKey:", v8);
    -[NSMutableOrderedSet removeObject:](self->_queue_touchEnterSlotIDs, "removeObject:", v8);
    -[BKHIDDirectTouchEventProcessor _queue_resetTouchAuthenticationInitialSampleEvent](self, "_queue_resetTouchAuthenticationInitialSampleEvent");

  }
}

- (void)_queue_enumerateDigitizersForAllDisplaysUsingBlock:(id)a3
{
  NSMutableDictionary *queue_perDisplayInfo;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100056420;
  v6[3] = &unk_1000EB338;
  v6[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queue_perDisplayInfo, "enumerateKeysAndObjectsUsingBlock:", v6);
}

- (void)_queue_enumerateTouchStreamsForAllDisplaysUsingBlock:(id)a3
{
  NSMutableDictionary *queue_perDisplayInfo;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000563B4;
  v6[3] = &unk_1000EB338;
  v6[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queue_perDisplayInfo, "enumerateKeysAndObjectsUsingBlock:", v6);
}

- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = objc_msgSend(a3, "primaryPage");
  v5 = objc_msgSend(a3, "primaryUsage");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[BKHIDDirectTouchEventProcessor digitizerMatchingDictionaries](BKHIDDirectTouchEventProcessor, "digitizerMatchingDictionaries"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("DeviceUsagePage")));
        v11 = objc_msgSend(v10, "unsignedIntValue");

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("DeviceUsage")));
        LODWORD(v10) = objc_msgSend(v12, "unsignedIntValue");

        v13 = v5 == (_DWORD)v10 || v5 == 0;
        if (v4 == v11 && v13)
        {
          v14 = 1;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (id)_persistentPropertyKeyDenylist
{
  if (qword_1001173A0 != -1)
    dispatch_once(&qword_1001173A0, &stru_1000EB358);
  return (id)qword_1001173A8;
}

- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4
{
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *queue;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[6];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];

  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100056118;
  v43[3] = &unk_1000EB380;
  v29 = (id)objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor _persistentPropertyKeyDenylist](self, "_persistentPropertyKeyDenylist"));
  v44 = v29;
  v45 = &v46;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v43);
  if (*((_BYTE *)v47 + 24))
  {
    v7 = 1;
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("HoverDisabled")));
    v9 = objc_opt_class(NSNumber, v8);
    v10 = v27;
    v11 = v10;
    if (v9)
    {
      if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = sub_10005615C;
    v41 = sub_10005616C;
    v42 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100056174;
    block[3] = &unk_1000EC7E0;
    v36 = &v37;
    block[4] = self;
    block[5] = a4;
    v15 = v13;
    v35 = v15;
    dispatch_sync(queue, block);
    v28 = v15;
    if (objc_msgSend((id)v38[5], "count"))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v16 = (id)v38[5];
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v54, 16);
      v18 = v17;
      if (v17)
      {
        v19 = *(_QWORD *)v31;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v20);
            v22 = BKLogTouchEvents(v17);
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", a3));
              *(_DWORD *)buf = 138543618;
              v51 = v24;
              v52 = 2114;
              v53 = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "sending:%{public}@ to:%{public}@", buf, 0x16u);

            }
            v17 = objc_msgSend(v21, "setProperties:", a3);
            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v54, 16);
          v18 = v17;
        }
        while (v17);
      }
    }
    else
    {
      v25 = BKLogTouchEvents(0);
      v16 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v51 = a4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "no currently matched services for %{public}@", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v37, 8);
    v7 = 2;
  }

  _Block_object_dispose(&v46, 8);
  return v7;
}

- (void)globalKeyboardModifiersDidChange:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100055D54;
  v4[3] = &unk_1000ECB60;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)_queue_touchStreamInfoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id *v12;
  void *v13;
  BKDigitizerTouchStreamAggregate *v14;
  BKDigitizerTouchStreamAggregate *v15;
  BKDigitizerTouchStreamAggregate *v16;
  const char *v17;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8)
    v9 = v7;
  v10 = v9;

  v11 = objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:](self, "_queue_displayInfoForDisplay:createIfNeeded:", v10, 1));
  v12 = (id *)v11;
  if (v11)
    v13 = *(void **)(v11 + 24);
  else
    v13 = 0;
  v14 = v13;
  v15 = v14;
  if (v4 && !v14)
  {
    v16 = objc_alloc_init(BKDigitizerTouchStreamAggregate);
    v15 = v16;
    if (v16)
      objc_setProperty_nonatomic_copy(v16, v17, v10, 8);
    if (v12)
      objc_storeStrong(v12 + 3, v15);
  }

  return v15;
}

- (unsigned)_queue_addTouchStreamClient:(id)a3 toDisplayUUID:(id)a4 versionedPID:(int64_t)a5
{
  unsigned int v8;
  uint64_t v9;
  id *v10;
  id v11;
  id v12;
  NSMutableDictionary *queue_referenceToTouchStreamClient;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  OS_dispatch_queue *queue;
  id v21;
  void *v22;
  unsigned int queue_previousVendedTouchStreamReference;
  void *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id location;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = self->_queue_previousVendedTouchStreamReference + 1;
  self->_queue_previousVendedTouchStreamReference = v8;
  if (a3)
    *((_DWORD *)a3 + 4) = v8;
  v9 = objc_claimAutoreleasedReturnValue(-[BKHIDDirectTouchEventProcessor _queue_touchStreamInfoForDisplayUUID:createIfNeeded:](self, "_queue_touchStreamInfoForDisplayUUID:createIfNeeded:", a4, 1));
  v10 = (id *)v9;
  if (v9)
  {
    if (!*(_QWORD *)(v9 + 16))
    {
      v11 = objc_alloc_init((Class)NSMutableArray);
      v12 = v10[2];
      v10[2] = v11;

    }
    if (a3)
      objc_storeWeak((id *)a3 + 4, v10);
    objc_msgSend(v10[2], "addObject:", a3);
  }
  queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  if (!queue_referenceToTouchStreamClient)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v15 = self->_queue_referenceToTouchStreamClient;
    self->_queue_referenceToTouchStreamClient = v14;

    queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_queue_previousVendedTouchStreamReference));
  -[NSMutableDictionary setObject:forKeyedSubscript:](queue_referenceToTouchStreamClient, "setObject:forKeyedSubscript:", a3, v16);

  v18 = BKLogTouchEvents(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = a3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "create touch stream %{public}@", buf, 0xCu);
  }

  objc_initWeak(&location, a3);
  queue = self->_queue;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100055C84;
  v32[3] = &unk_1000EC7B8;
  objc_copyWeak(&v33, &location);
  if (a3)
  {
    if (*((_QWORD *)a3 + 7))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_processDeathWatcher == nil")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v26 = NSStringFromSelector("watchForProcessDeathOnQueue:block:");
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v29 = (objc_class *)objc_opt_class(a3, v28);
        v30 = NSStringFromClass(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 138544642;
        v36 = v27;
        v37 = 2114;
        v38 = v31;
        v39 = 2048;
        v40 = a3;
        v41 = 2114;
        v42 = CFSTR("BKDigitizerTouchStreamClient.m");
        v43 = 1024;
        v44 = 96;
        v45 = 2114;
        v46 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
      __break(0);
      JUMPOUT(0x100055688);
    }
    v21 = objc_msgSend(objc_alloc((Class)BSProcessDeathWatcher), "initWithPID:queue:deathHandler:", *((unsigned int *)a3 + 10), queue, v32);
    v22 = (void *)*((_QWORD *)a3 + 7);
    *((_QWORD *)a3 + 7) = v21;

  }
  queue_previousVendedTouchStreamReference = self->_queue_previousVendedTouchStreamReference;
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return queue_previousVendedTouchStreamReference;
}

- (BOOL)_queue_hasTouchEnterSlots
{
  return -[NSMutableOrderedSet count](self->_queue_touchEnterSlotIDs, "count") != 0;
}

- (id)_queue_slotRecordForSlotID:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *queue_slotIDToSlotRecord;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    queue_slotIDToSlotRecord = self->_queue_slotIDToSlotRecord;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](queue_slotIDToSlotRecord, "objectForKeyedSubscript:", v6));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_queue_contextIDsToIgnoreForZoomSenders
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_queue_zoomExcludedContextIDs;
}

- (void)_queue_addServicesMatchingSenderDescriptor:(id)a3 inPerDisplayInfo:(id)a4 toArray:(id)a5
{
  id *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = sub_10000C210((id *)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        if (v12)
          v12 = (_QWORD *)v12[1];
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "senderDescriptor", (_QWORD)v15));
        if (objc_msgSend(v14, "matchesDescriptor:failureReason:", a3, 0))
          objc_msgSend(a5, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (id)_queue_servicesMatchingSenderDescriptor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSMutableDictionary *queue_perDisplayInfo;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint8_t v24[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "associatedDisplay"));
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "_isNullDisplay");
    if ((_DWORD)v8)
    {
      v9 = BKLogTouchEvents(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "touch services cannot match nullDisplay", v24, 2u);
      }

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_hardwareIdentifier"));
      queue_perDisplayInfo = self->_queue_perDisplayInfo;
      v18 = v16;
      v19 = objc_msgSend(v18, "length");
      v20 = (void *)BKSDisplayUUIDMainKey;
      if (v19)
        v20 = v18;
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](queue_perDisplayInfo, "objectForKey:", v21));
      -[BKHIDDirectTouchEventProcessor _queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:](self, "_queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:", a3, v22, v5);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_queue_perDisplayInfo, "allValues"));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v12);
          -[BKHIDDirectTouchEventProcessor _queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:](self, "_queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:", a3, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), v5);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDisplayController, 0);
  objc_storeStrong((id *)&self->_queue_zoomExcludedContextIDs, 0);
  objc_storeStrong((id *)&self->_queue_zoomDeathWatcher, 0);
  objc_storeStrong((id *)&self->_queue_touchEnterSlotIDs, 0);
  objc_storeStrong((id *)&self->_queue_slotIDToSlotRecord, 0);
  objc_storeStrong((id *)&self->_queue_referenceToTouchStreamClient, 0);
  objc_storeStrong((id *)&self->_queue_perDisplayInfo, 0);
  objc_storeStrong((id *)&self->_globalKeyboardObserver, 0);
  objc_storeStrong((id *)&self->_queue_mainDisplayDigitizerSentinelTimer, 0);
  objc_storeStrong((id *)&self->_queue_mainDisplayPencilDigitizerService, 0);
  objc_storeStrong((id *)&self->_queue_mainDisplayAOPDigitizerService, 0);
  objc_storeStrong((id *)&self->_queue_mainDisplayDigitizerService, 0);
  objc_storeStrong((id *)&self->_pencilOpaqueTouchPersistentPropertySupport, 0);
  objc_storeStrong((id *)&self->_matchers, 0);
  objc_storeStrong((id *)&self->_persistentPropertyController, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_touchEventServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (NSArray)digitizerMatchingDictionaries
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v11[0] = CFSTR("DeviceUsagePage");
  v11[1] = CFSTR("DeviceUsage");
  v12[0] = &off_1000F73F0;
  v12[1] = &off_1000F7408;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v13[0] = v2;
  v9[0] = CFSTR("DeviceUsagePage");
  v9[1] = CFSTR("DeviceUsage");
  v10[0] = &off_1000F73F0;
  v10[1] = &off_1000F7420;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  v13[1] = v3;
  v7[0] = CFSTR("DeviceUsagePage");
  v7[1] = CFSTR("DeviceUsage");
  v8[0] = &off_1000F73F0;
  v8[1] = &off_1000F7438;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  v13[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3));

  return (NSArray *)v5;
}

@end
