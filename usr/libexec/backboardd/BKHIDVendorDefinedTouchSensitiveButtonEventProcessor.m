@implementation BKHIDVendorDefinedTouchSensitiveButtonEventProcessor

- (BKHIDVendorDefinedTouchSensitiveButtonEventProcessor)initWithContext:(id)a3
{
  BKHIDVendorDefinedTouchSensitiveButtonEventProcessor *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKHIDVendorDefinedTouchSensitiveButtonEventProcessor;
  result = -[BKHIDVendorDefinedTouchSensitiveButtonEventProcessor init](&v4, "init", a3);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  os_unfair_lock_s *p_lock;
  id v12;
  NSMutableDictionary *v13;
  __int16 IntegerValue;
  __int16 v15;
  _BKTouchSensitiveButtonKey *v16;
  BKHIDVendorDefinedTouchSensitiveButtonEventProcessor *v17;
  BKHIDVendorDefinedTouchSensitiveButtonEventProcessor *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  int v25;
  id v26;
  objc_class *v27;
  NSMutableDictionary *lock_eventRecords;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  Class super_class;
  NSObject *v32;
  int64_t v33;
  id v35;
  id v36;
  id *v37;
  uint64_t v38;
  id v39;
  objc_class *v40;
  objc_class *v41;
  _BOOL4 v42;
  id v43;
  id receiver;
  __CFString *v45;
  void *v46;
  id v47;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  id v52;
  id v53;
  Class v54;
  void *v55;
  void *v56;
  int v57;
  objc_class *v58;
  id v59;
  objc_super v60;
  __int128 v61;
  id v62;
  id v63;
  __int128 v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  void *v68;

  v8 = a4;
  v9 = a5;
  v10 = *a3;
  if (IOHIDEventGetType(*a3) == 1
    && IOHIDEventGetIntegerValue(v10, 0x10000) == 65280
    && IOHIDEventGetIntegerValue(v10, 65537) == 102)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v12 = v8;
    v59 = v9;
    if (!self)
    {
LABEL_45:

      os_unfair_lock_unlock(p_lock);
      v33 = 1;
      goto LABEL_23;
    }
    os_unfair_lock_assert_owner(&self->_lock);
    v13 = (NSMutableDictionary *)objc_msgSend(v12, "senderID");
    IntegerValue = IOHIDEventGetIntegerValue(v10, 0x10000);
    v15 = IOHIDEventGetIntegerValue(v10, 65537);
    v64 = 0uLL;
    if (!sub_100033C58((uint64_t)v10, (uint64_t *)&v64))
    {
      v35 = sub_100059844();
      v20 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v60.receiver) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "data for TouchSensitiveButton event is corrupt", (uint8_t *)&v60, 2u);
      }
      goto LABEL_44;
    }
    v16 = [_BKTouchSensitiveButtonKey alloc];
    if (v16)
    {
      v60.receiver = v16;
      v60.super_class = (Class)_BKTouchSensitiveButtonKey;
      v17 = -[BKHIDVendorDefinedTouchSensitiveButtonEventProcessor init](&v60, "init");
      v18 = v17;
      if (v17)
      {
        v17->_lock_eventRecords = v13;
        LOWORD(v17->_lock._os_unfair_lock_opaque) = IntegerValue;
        HIWORD(v17->_lock._os_unfair_lock_opaque) = v15;
      }
    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lock_eventRecords, "objectForKey:", v18));
    v20 = v18;
    v60.receiver = v20;
    v58 = v19;
    v60.super_class = v58;
    v61 = v64;
    v62 = v12;
    v63 = v59;
    v21 = sub_100059844();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = sub_100033FCC((uint64_t)v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543362;
      v66 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "incoming %{public}@", buf, 0xCu);

    }
    if (!**((_DWORD **)&v61 + 1))
    {
      v36 = sub_100059844();
      v32 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "TouchSensitiveButton: got event for idle stage, bailing", buf, 2u);
      }
      goto LABEL_42;
    }
    v25 = *(_DWORD *)(*((_QWORD *)&v61 + 1) + 4);
    if (!v25)
    {
      if (!v60.super_class)
      {
        v43 = sub_100059844();
        v32 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          receiver = v60.receiver;
          v45 = sub_100033548(**((_DWORD **)&v61 + 1));
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          *(_DWORD *)buf = 138543618;
          v66 = receiver;
          v67 = 2114;
          v68 = v46;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "[TouchSensitiveButton %{public}@]: did not see an enter transition to stage %{public}@, ignoring change event", buf, 0x16u);

        }
        goto LABEL_42;
      }
      sub_10003CB4C(self, (uint64_t)v10, (uint64_t)&v60);
      sub_10003C8A0((uint64_t)&v60);
      super_class = v60.super_class;
      if (v60.super_class)
        super_class = (Class)*((_QWORD *)v60.super_class + 3);
      goto LABEL_21;
    }
    if (v25 != 2)
    {
      if (v25 != 1)
      {
LABEL_43:
        v53 = v60.receiver;
        v60.receiver = 0;

        v54 = v60.super_class;
        v60.super_class = 0;

        v61 = 0uLL;
        v55 = v62;
        v62 = 0;

        v56 = v63;
        v63 = 0;

        sub_10003C868(&v60.receiver);
LABEL_44:

        goto LABEL_45;
      }
      v26 = v60.receiver;
      v27 = v60.super_class;
      if (!v27)
      {
        v27 = objc_alloc_init(_BKTouchSensitiveButtonEventRecord);
        objc_storeStrong((id *)&v60.super_class, v27);
        lock_eventRecords = self->_lock_eventRecords;
        if (!lock_eventRecords)
        {
          v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v30 = self->_lock_eventRecords;
          self->_lock_eventRecords = v29;

          lock_eventRecords = self->_lock_eventRecords;
        }
        -[NSMutableDictionary setObject:forKey:](lock_eventRecords, "setObject:forKey:", v27, v26);
      }

      sub_10003CB4C(self, (uint64_t)v10, (uint64_t)&v60);
      sub_10003C8A0((uint64_t)&v60);
      super_class = v60.super_class;
      if (v60.super_class)
        super_class = (Class)*((_QWORD *)v60.super_class + 3);
LABEL_21:
      v32 = super_class;
      sub_10003C93C((uint64_t)self, (uint64_t)v10, v32, v63);
LABEL_42:

      goto LABEL_43;
    }
    v37 = v60.super_class;
    v32 = v37;
    if (v37)
    {
      v38 = **((_DWORD **)&v61 + 1);
      v39 = v37[2];
      v57 = v38;
      LOBYTE(v38) = objc_msgSend(v39, "containsIndex:", v38);

      if ((v38 & 1) != 0)
      {
        sub_10003C8A0((uint64_t)&v60);
        v40 = v32[3].isa;
        sub_10003C93C((uint64_t)self, (uint64_t)v10, v40, v63);

        v41 = v32[2].isa;
        v42 = -[objc_class count](v41, "count") == 0;

        if (v42)
          -[NSMutableDictionary removeObjectForKey:](self->_lock_eventRecords, "removeObjectForKey:", v60.receiver);
        goto LABEL_42;
      }
      v52 = sub_100059844();
      v48 = objc_claimAutoreleasedReturnValue(v52);
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        goto LABEL_41;
      *(_DWORD *)buf = 138543618;
      v66 = v60.receiver;
      v67 = 1024;
      LODWORD(v68) = v57;
      v49 = "[TouchSensitiveButton %{public}@]: did not see an enter transition to stage %d, ignoring exit event";
      v50 = v48;
      v51 = 18;
    }
    else
    {
      v47 = sub_100059844();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
LABEL_41:

        goto LABEL_42;
      }
      *(_DWORD *)buf = 138543362;
      v66 = v60.receiver;
      v49 = "[TouchSensitiveButton %{public}@]: did not see an enter transition for this button, ignoring exit event";
      v50 = v48;
      v51 = 12;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v49, buf, v51);
    goto LABEL_41;
  }
  v33 = 0;
LABEL_23:

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_eventRecords, 0);
}

@end
