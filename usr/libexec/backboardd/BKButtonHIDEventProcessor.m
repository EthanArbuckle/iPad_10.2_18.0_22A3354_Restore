@implementation BKButtonHIDEventProcessor

- (BKButtonHIDEventProcessor)initWithContext:(id)a3
{
  id v4;
  BKButtonHIDEventProcessor *v5;
  BKButtonHIDEventProcessor *v6;
  void *v7;
  uint64_t KeyboardEvent;
  const void *v9;
  id v10;
  const void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BKButtonHIDEventProcessor;
  v5 = -[BKButtonHIDEventProcessor init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    v5->_eventRecordsLock._os_unfair_lock_opaque = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemInterface"));
    KeyboardEvent = IOHIDEventCreateKeyboardEvent(0, 0, 11, 46, 0, 0);
    if (KeyboardEvent)
    {
      v9 = (const void *)KeyboardEvent;
      v10 = objc_msgSend(v7, "systemEventOfType:matchingEvent:options:", 3, KeyboardEvent, 0);
      if (v10)
      {
        v11 = v10;
        v6->_ringerState = IOHIDEventGetIntegerValue(v10, 196610) != 0;
        v12 = sub_100059844();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = sub_10002DA38(v6->_ringerState);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          *(_DWORD *)buf = 138543362;
          v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "initial ringer state:%{public}@", buf, 0xCu);

        }
        CFRelease(v11);
      }
      CFRelease(v9);
    }

  }
  return v6;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  BKKeyboardHIDEventProcessor *v14;
  BKKeyboardHIDEventProcessor *keyboardEventProcessor;
  __IOHIDEvent *v16;
  uint64_t SenderID;
  int IntegerValue;
  unsigned __int16 v19;
  uint64_t v20;
  int Phase;
  BKEventSenderUsagePairDictionary *eventRecords;
  uint64_t v23;
  NSMutableDictionary *usagePairsPerSenderID;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _BKButtonEventRecord *v30;
  uint64_t v31;
  int v32;
  id v33;
  NSObject *v34;
  id *v35;
  void *v36;
  BKEventSenderUsagePairDictionary *v37;
  id v38;
  uint64_t v39;
  int v40;
  BKEventSenderUsagePairDictionary *v41;
  BKEventSenderUsagePairDictionary *v42;
  id v43;
  void *v44;
  void *v45;
  NSMutableDictionary *v46;
  NSMutableDictionary *v47;
  NSMutableDictionary *v48;
  id v49;
  int v50;
  int v51;
  BKEventSenderUsagePairDictionary *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  id *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  void *i;
  uint64_t v67;
  id v68;
  unsigned int v69;
  uint64_t v70;
  id obj;
  id obja;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  void *v85;

  v9 = a4;
  obj = a5;
  v10 = a5;
  if (!self->_keyboardEventProcessor)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
    v13 = objc_msgSend(v11, "eventProcessorOfClass:", objc_opt_class(BKKeyboardHIDEventProcessor, v12));
    v14 = (BKKeyboardHIDEventProcessor *)objc_claimAutoreleasedReturnValue(v13);
    keyboardEventProcessor = self->_keyboardEventProcessor;
    self->_keyboardEventProcessor = v14;

  }
  v16 = *a3;
  SenderID = IOHIDEventGetSenderID(v16);
  IntegerValue = IOHIDEventGetIntegerValue(v16, 196608);
  v19 = IOHIDEventGetIntegerValue(v16, 196609);
  v20 = IOHIDEventGetIntegerValue(v16, 196610);
  Phase = IOHIDEventGetPhase(v16);
  if ((unsigned __int16)IntegerValue == 11 && v19 == 46)
  {
    -[BKButtonHIDEventProcessor _processRingerSwitchEvent:down:sender:dispatcher:](self, "_processRingerSwitchEvent:down:sender:dispatcher:", v16, v20 != 0, v9, v10);
    goto LABEL_59;
  }
  v68 = a4;
  LODWORD(v67) = (unsigned __int16)IntegerValue;
  os_unfair_lock_lock(&self->_eventRecordsLock);
  eventRecords = self->_eventRecords;
  HIDWORD(v67) = v19;
  v23 = v19 | (IntegerValue << 16);
  v70 = SenderID;
  v69 = v19 | (IntegerValue << 16);
  if (eventRecords)
  {
    usagePairsPerSenderID = eventRecords->_usagePairsPerSenderID;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", SenderID));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](usagePairsPerSenderID, "objectForKeyedSubscript:", v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v23));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v27));

  }
  else
  {
    v28 = 0;
  }
  if (!v20 || v28)
  {
    if (v20)
    {
      if (v28)
      {
        *(_BYTE *)(v28 + 10) = 0;
        v40 = IOHIDEventGetPhase(v16);
        if (v40)
        {
          if (!*(_BYTE *)(v28 + 8))
            *(_BYTE *)(v28 + 8) = v40 & 1;
          if (!*(_BYTE *)(v28 + 9))
            *(_BYTE *)(v28 + 9) = (v40 & 4) != 0;
        }
      }
      else
      {
        IOHIDEventGetPhase(v16);
      }
    }
    else
    {
      v50 = IOHIDEventGetPhase(v16);
      if (!v28)
        goto LABEL_44;
      *(_BYTE *)(v28 + 10) = 1;
      v51 = *(unsigned __int8 *)(v28 + 8);
      if (v50)
      {
        if (!*(_BYTE *)(v28 + 8))
        {
          v51 = v50 & 1;
          *(_BYTE *)(v28 + 8) = v50 & 1;
        }
        if (!*(_BYTE *)(v28 + 9))
          *(_BYTE *)(v28 + 9) = (v50 & 4) != 0;
      }
      if (!v51 || *(_BYTE *)(v28 + 9))
      {
LABEL_44:
        v52 = self->_eventRecords;
        if (v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v70));
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v69));
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v52->_usagePairsPerSenderID, "objectForKeyedSubscript:", v53));
          sub_1000206D4((uint64_t)v52, v55, v53, v54);

        }
        v56 = sub_100059844();
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = sub_1000360F4((id *)v28);
          v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
          *(_DWORD *)buf = 67109890;
          v79 = v67;
          v80 = 1024;
          v81 = HIDWORD(v67);
          v82 = 2048;
          v83 = v70;
          v84 = 2114;
          v85 = v59;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, " 0x%X/0x%X/%llX finished: %{public}@", buf, 0x22u);

        }
      }
    }
    goto LABEL_49;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destinationsForEvent:fromSender:", v16, v9));
  if (!v29)
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v30 = objc_alloc_init(_BKButtonEventRecord);
  v28 = (uint64_t)v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_eventDispatcher, obj);
    objc_storeStrong((id *)(v28 + 16), v68);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    *(_QWORD *)(v28 + 40) = v31;
    objc_storeStrong((id *)(v28 + 32), v29);
    v32 = IOHIDEventGetPhase(v16);
    if (v32)
    {
      if (!*(_BYTE *)(v28 + 8))
        *(_BYTE *)(v28 + 8) = v32 & 1;
      if (!*(_BYTE *)(v28 + 9))
        *(_BYTE *)(v28 + 9) = (v32 & 4) != 0;
    }
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    IOHIDEventGetPhase(v16);
  }
  obja = v29;
  v33 = sub_100059844();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = sub_1000360F4((id *)v28);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    *(_DWORD *)buf = 67109890;
    v79 = v67;
    v80 = 1024;
    v81 = HIDWORD(v67);
    v82 = 2048;
    v83 = v70;
    v84 = 2114;
    v85 = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, " 0x%X/0x%X/%llX began: %{public}@", buf, 0x22u);

  }
  v37 = self->_eventRecords;
  if (v37)
  {
    v38 = (id)v28;
    v39 = v70;
LABEL_30:
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v39, v67));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v69));
    v46 = v37->_usagePairsPerSenderID;
    if (!v46)
    {
      v47 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v48 = v37->_usagePairsPerSenderID;
      v37->_usagePairsPerSenderID = v47;

      v46 = v37->_usagePairsPerSenderID;
    }
    v49 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v44));
    if (!v49)
    {
      v49 = objc_alloc_init((Class)NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v37->_usagePairsPerSenderID, "setObject:forKeyedSubscript:", v49, v44);
    }
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v28, v45);

    goto LABEL_35;
  }
  v41 = objc_alloc_init(BKEventSenderUsagePairDictionary);
  v42 = self->_eventRecords;
  self->_eventRecords = v41;

  v37 = self->_eventRecords;
  v43 = (id)v28;
  v39 = v70;
  if (v37)
    goto LABEL_30;
LABEL_35:

LABEL_49:
  os_unfair_lock_unlock(&self->_eventRecordsLock);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  if (v28)
    v60 = *(void **)(v28 + 32);
  else
    v60 = 0;
  v61 = v60;
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v63; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v64)
          objc_enumerationMutation(v61);
        -[BKButtonHIDEventProcessor _postEvent:sender:dispatcher:destination:cancelled:](self, "_postEvent:sender:dispatcher:destination:cancelled:", v16, v9, v10, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i), Phase == 8);
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    }
    while (v63);
  }

LABEL_59:
  return 1;
}

- (void)cancelButtonForSenderID:(unint64_t)a3 uagePage:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *p_eventRecordsLock;
  BKEventSenderUsagePairDictionary *eventRecords;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id *v18;
  void *v19;
  const void *KeyboardEvent;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  void *v39;

  v5 = a5;
  v6 = a4;
  p_eventRecordsLock = &self->_eventRecordsLock;
  os_unfair_lock_lock(&self->_eventRecordsLock);
  eventRecords = self->_eventRecords;
  if (eventRecords)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5 | ((_DWORD)v6 << 16)));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](eventRecords->_usagePairsPerSenderID, "objectForKeyedSubscript:", v11));
    v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));
    sub_1000206D4((uint64_t)eventRecords, v13, v11, v12);

  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_unlock(p_eventRecordsLock);
  v15 = sub_100059844();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = sub_1000360F4(v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 67109890;
      v33 = v6;
      v34 = 1024;
      v35 = v5;
      v36 = 2048;
      v37 = a3;
      v38 = 2114;
      v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, " 0x%X/0x%X/%llX soft cancel: %{public}@", buf, 0x22u);

    }
    KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(0, 0, v6, v5, 0, 0);
    IOHIDEventSetSenderID(KeyboardEvent, a3);
    v17 = v14[2];
    v21 = v14[3];
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v14[4];
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          -[BKButtonHIDEventProcessor _postEvent:sender:dispatcher:destination:cancelled:](self, "_postEvent:sender:dispatcher:destination:cancelled:", KeyboardEvent, v17, v21, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v26), 1, (_QWORD)v27);
          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v24);
    }

    CFRelease(KeyboardEvent);
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109632;
    v33 = v6;
    v34 = 1024;
    v35 = v5;
    v36 = 2048;
    v37 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "0x%X/0x%X/%llX soft cancel: no event found, ignoring request", buf, 0x18u);
  }

}

- (void)_postEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destination:(id)a6 cancelled:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  const void *Copy;
  BKKeyboardHIDEventProcessor *keyboardEventProcessor;
  id v16;
  id v17;
  uint64_t TimeStamp;
  uint64_t IntegerValue;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v7 = a7;
  v22 = a6;
  v12 = a5;
  v13 = a4;
  Copy = (const void *)IOHIDEventCreateCopy(0, a3);
  keyboardEventProcessor = self->_keyboardEventProcessor;
  if (keyboardEventProcessor)
    v16 = (id)-[BKKeyboardHIDEventProcessor eventSourceForSender:](keyboardEventProcessor, "eventSourceForSender:", v13);
  else
    v16 = objc_msgSend(v13, "eventSource");
  v17 = v16;

  BKSHIDEventSetSimpleDeliveryInfo(Copy, v17, v7, v22);
  if (Copy)
  {
    TimeStamp = IOHIDEventGetTimeStamp(Copy);
    IntegerValue = IOHIDEventGetIntegerValue(Copy, 196608);
    v20 = IOHIDEventGetIntegerValue(Copy, 196609);
    v21 = IOHIDEventGetIntegerValue(Copy, 196610);
  }
  else
  {
    v20 = 0;
    TimeStamp = 0;
    IntegerValue = 0;
    v21 = 0;
  }
  kdebug_trace(730465058, TimeStamp, IntegerValue, v20, v21);
  objc_msgSend(v12, "postEvent:toDestination:", Copy, v22);

  CFRelease(Copy);
}

- (void)_processRingerSwitchEvent:(__IOHIDEvent *)a3 down:(BOOL)a4 sender:(id)a5 dispatcher:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  self->_ringerState = v7;
  v12 = sub_100059844();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = sub_10002DA38(self->_ringerState);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543362;
    v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ringer state changed to:%{public}@", buf, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destinationsForEvent:fromSender:", a3, v10));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[BKButtonHIDEventProcessor _postEvent:sender:dispatcher:destination:cancelled:](self, "_postEvent:sender:dispatcher:destination:cancelled:", a3, v10, v11, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), 0);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }

}

- (unint64_t)ringerState
{
  return self->_ringerState;
}

- (void)setRingerState:(unint64_t)a3
{
  self->_ringerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardEventProcessor, 0);
  objc_storeStrong((id *)&self->_eventRecords, 0);
}

@end
