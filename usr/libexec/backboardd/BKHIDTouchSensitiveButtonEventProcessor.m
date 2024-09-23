@implementation BKHIDTouchSensitiveButtonEventProcessor

- (BKHIDTouchSensitiveButtonEventProcessor)initWithContext:(id)a3
{
  id v4;
  BKHIDTouchSensitiveButtonEventProcessor *v5;
  BKHIDTouchSensitiveButtonEventProcessor *v6;
  BKHIDTouchSensitiveButtonScanningController *v7;
  BKHIDTouchSensitiveButtonScanningController *buttonScanningController;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKHIDTouchSensitiveButtonEventProcessor;
  v5 = -[BKHIDTouchSensitiveButtonEventProcessor init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = -[BKHIDTouchSensitiveButtonScanningController initWithContext:]([BKHIDTouchSensitiveButtonScanningController alloc], "initWithContext:", v4);
    buttonScanningController = v6->_buttonScanningController;
    v6->_buttonScanningController = v7;

  }
  return v6;
}

- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5
{
  -[BKHIDTouchSensitiveButtonScanningController setScanningActive:buttonIdentifier:forPID:](self->_buttonScanningController, "setScanningActive:buttonIdentifier:forPID:", a3, a4, *(_QWORD *)&a5);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  id v11;
  __int16 IntegerValue;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  _BKTouchSensitiveButtonKey *v18;
  BKHIDTouchSensitiveButtonEventProcessor *v19;
  BKHIDTouchSensitiveButtonEventProcessor *v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  NSObject *v25;
  uint64_t TimeStamp;
  __CFString *v27;
  void *v28;
  id v29;
  objc_class *v30;
  NSMutableDictionary *lock_eventRecords;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  int v34;
  Class super_class;
  NSObject *v36;
  int64_t v37;
  id v38;
  __CFString *v39;
  void *v40;
  id v41;
  id *v42;
  uint64_t v43;
  id v44;
  unsigned __int8 v45;
  int v46;
  objc_class *v47;
  objc_class *v48;
  _BOOL4 v49;
  id v50;
  id receiver;
  __CFString *v52;
  void *v53;
  id v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  id v59;
  objc_class *v61;
  id v62;
  id v63;
  os_unfair_lock *lock;
  id v65;
  objc_super v66;
  unsigned int v67;
  int v68;
  __IOHIDEvent *v69;
  uint64_t v70;
  id v71;
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  void *v76;

  v8 = a4;
  v9 = a5;
  v10 = *a3;
  if (IOHIDEventGetType(*a3) == 42)
  {
    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v62 = v8;
    v65 = v8;
    v63 = v9;
    if (!self)
    {
LABEL_42:

      os_unfair_lock_unlock(lock);
      v37 = 1;
      v8 = v62;
      goto LABEL_43;
    }
    os_unfair_lock_assert_owner(lock);
    v11 = objc_msgSend(v65, "senderID");
    IntegerValue = IOHIDEventGetIntegerValue(v10, 2752513);
    v13 = IOHIDEventGetIntegerValue(v10, 2752512);
    v14 = sub_100033ED0((uint64_t)v10);
    if (!v14)
    {
      v38 = sub_100059844();
      v22 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v39 = sub_100033FCC((uint64_t)v10);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        LODWORD(v66.receiver) = 138543362;
        *(id *)((char *)&v66.receiver + 4) = v40;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "missing force stage event -- dropping event: %{public}@", (uint8_t *)&v66, 0xCu);

      }
      goto LABEL_41;
    }
    v15 = v14;
    v16 = IOHIDEventGetIntegerValue(v14, 2686976);
    v17 = IOHIDEventGetIntegerValue(v15, 2686977);
    v18 = [_BKTouchSensitiveButtonKey alloc];
    if (v18)
    {
      v66.receiver = v18;
      v66.super_class = (Class)_BKTouchSensitiveButtonKey;
      v19 = -[BKHIDTouchSensitiveButtonEventProcessor init](&v66, "init");
      v20 = v19;
      if (v19)
      {
        *(_QWORD *)&v19->_lock._os_unfair_lock_opaque = v11;
        LOWORD(v19->_buttonScanningController) = IntegerValue;
        WORD1(v19->_buttonScanningController) = v13;
      }
    }
    else
    {
      v20 = 0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lock_eventRecords, "objectForKey:", v20));
    v22 = v20;
    v66.receiver = v22;
    v61 = v21;
    v66.super_class = v61;
    v67 = v16;
    v68 = v17;
    v69 = v10;
    v70 = v15;
    v71 = v65;
    v72 = v63;
    v23 = 2 * (v17 == 0);
    v24 = sub_100059844();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, v23))
    {
      TimeStamp = IOHIDEventGetTimeStamp(v10);
      v27 = sub_100033FCC((uint64_t)v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 134218242;
      v74 = TimeStamp;
      v75 = 2114;
      v76 = v28;
      _os_log_impl((void *)&_mh_execute_header, v25, v23, "in %llX %{public}@", buf, 0x16u);

    }
    if (!v67)
    {
      v41 = sub_100059844();
      v36 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "TouchSensitiveButton: got event for idle stage, bailing", buf, 2u);
      }
      goto LABEL_39;
    }
    if (!v68)
    {
      if (!v66.super_class)
      {
        v50 = sub_100059844();
        v36 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          receiver = v66.receiver;
          v52 = sub_100033548(v67);
          v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
          *(_DWORD *)buf = 138543618;
          v74 = (uint64_t)receiver;
          v75 = 2114;
          v76 = v53;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "[TouchSensitiveButton %{public}@]: did not see an enter transition to stage %{public}@, ignoring change event", buf, 0x16u);

        }
        goto LABEL_39;
      }
      sub_100042850(self, (uint64_t)v10, (uint64_t)&v66);
      sub_10004252C((uint64_t)&v66);
      v34 = v68;
      super_class = v66.super_class;
      if (v66.super_class)
        super_class = (Class)*((_QWORD *)v66.super_class + 3);
      goto LABEL_19;
    }
    if (v68 != 2)
    {
      if (v68 != 1)
      {
LABEL_40:
        sub_1000424F4(&v66.receiver);

LABEL_41:
        goto LABEL_42;
      }
      v29 = v66.receiver;
      v30 = v66.super_class;
      if (!v30)
      {
        v30 = objc_alloc_init(_BKTouchSensitiveButtonEventRecord);
        objc_storeStrong((id *)&v66.super_class, v30);
        lock_eventRecords = self->_lock_eventRecords;
        if (!lock_eventRecords)
        {
          v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v33 = self->_lock_eventRecords;
          self->_lock_eventRecords = v32;

          lock_eventRecords = self->_lock_eventRecords;
        }
        -[NSMutableDictionary setObject:forKey:](lock_eventRecords, "setObject:forKey:", v30, v29);
      }

      sub_100042850(self, (uint64_t)v10, (uint64_t)&v66);
      sub_10004252C((uint64_t)&v66);
      v34 = v68;
      super_class = v66.super_class;
      if (v66.super_class)
        super_class = (Class)*((_QWORD *)v66.super_class + 3);
LABEL_19:
      v36 = super_class;
      sub_1000425C0((uint64_t)self, (uint64_t)v10, 0, v34, v36, v72);
LABEL_39:

      goto LABEL_40;
    }
    v42 = v66.super_class;
    v36 = v42;
    if (v42)
    {
      v43 = v67;
      v44 = v42[2];
      v45 = objc_msgSend(v44, "containsIndex:", v43);

      if ((v45 & 1) != 0)
      {
        sub_10004252C((uint64_t)&v66);
        v46 = v68;
        v47 = v36[3].isa;
        sub_1000425C0((uint64_t)self, (uint64_t)v10, 0, v46, v47, v72);

        v48 = v36[2].isa;
        v49 = -[objc_class count](v48, "count") == 0;

        if (v49)
          -[NSMutableDictionary removeObjectForKey:](self->_lock_eventRecords, "removeObjectForKey:", v66.receiver);
        goto LABEL_39;
      }
      v59 = sub_100059844();
      v55 = objc_claimAutoreleasedReturnValue(v59);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_DWORD *)buf = 138543618;
      v74 = (uint64_t)v66.receiver;
      v75 = 1024;
      LODWORD(v76) = v43;
      v56 = "[TouchSensitiveButton %{public}@]: did not see an enter transition to stage %d, ignoring exit event";
      v57 = v55;
      v58 = 18;
    }
    else
    {
      v54 = sub_100059844();
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
LABEL_38:

        goto LABEL_39;
      }
      *(_DWORD *)buf = 138543362;
      v74 = (uint64_t)v66.receiver;
      v56 = "[TouchSensitiveButton %{public}@]: did not see an enter transition for this button, ignoring exit event";
      v57 = v55;
      v58 = 12;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
    goto LABEL_38;
  }
  v37 = 0;
LABEL_43:

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_eventRecords, 0);
  objc_storeStrong((id *)&self->_buttonScanningController, 0);
}

@end
