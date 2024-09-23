@implementation BKMutableSystemShellDescriptor

- (void)setBundleIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  NSString *bundleIdentifier;
  objc_class *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  BKMutableSystemShellDescriptor *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v24 = a3;
  if (v24)
  {
    v6 = objc_opt_class(NSString, v5);
    if ((objc_opt_isKindOfClass(v24, v6) & 1) == 0)
    {
      v9 = (objc_class *)objc_msgSend(v24, "classForCoder");
      if (!v9)
        v9 = (objc_class *)objc_opt_class(v24, v10);
      v11 = NSStringFromClass(v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v14 = (objc_class *)objc_opt_class(NSString, v13);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("bundleIdentifier"), v12, v16));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v18 = NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v21 = (objc_class *)objc_opt_class(self, v20);
        v22 = NSStringFromClass(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138544642;
        v26 = v19;
        v27 = 2114;
        v28 = v23;
        v29 = 2048;
        v30 = self;
        v31 = 2114;
        v32 = CFSTR("BKSystemShellDescriptor.m");
        v33 = 1024;
        v34 = 192;
        v35 = 2114;
        v36 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
      __break(0);
      JUMPOUT(0x10007A6C8);
    }
  }

  v7 = (NSString *)objc_msgSend(v24, "copy");
  bundleIdentifier = self->super._bundleIdentifier;
  self->super._bundleIdentifier = v7;

}

- (void)setBundlePath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  NSString *bundlePath;
  objc_class *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  BKMutableSystemShellDescriptor *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v24 = a3;
  if (v24)
  {
    v6 = objc_opt_class(NSString, v5);
    if ((objc_opt_isKindOfClass(v24, v6) & 1) == 0)
    {
      v9 = (objc_class *)objc_msgSend(v24, "classForCoder");
      if (!v9)
        v9 = (objc_class *)objc_opt_class(v24, v10);
      v11 = NSStringFromClass(v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v14 = (objc_class *)objc_opt_class(NSString, v13);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("bundlePath"), v12, v16));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v18 = NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v21 = (objc_class *)objc_opt_class(self, v20);
        v22 = NSStringFromClass(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138544642;
        v26 = v19;
        v27 = 2114;
        v28 = v23;
        v29 = 2048;
        v30 = self;
        v31 = 2114;
        v32 = CFSTR("BKSystemShellDescriptor.m");
        v33 = 1024;
        v34 = 198;
        v35 = 2114;
        v36 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
      __break(0);
      JUMPOUT(0x10007A8B0);
    }
  }

  v7 = (NSString *)objc_msgSend(v24, "copy");
  bundlePath = self->super._bundlePath;
  self->super._bundlePath = v7;

}

- (void)setJobLabel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  NSString *jobLabel;
  objc_class *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  BKMutableSystemShellDescriptor *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v24 = a3;
  if (v24)
  {
    v6 = objc_opt_class(NSString, v5);
    if ((objc_opt_isKindOfClass(v24, v6) & 1) == 0)
    {
      v9 = (objc_class *)objc_msgSend(v24, "classForCoder");
      if (!v9)
        v9 = (objc_class *)objc_opt_class(v24, v10);
      v11 = NSStringFromClass(v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v14 = (objc_class *)objc_opt_class(NSString, v13);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("jobLabel"), v12, v16));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v18 = NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v21 = (objc_class *)objc_opt_class(self, v20);
        v22 = NSStringFromClass(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138544642;
        v26 = v19;
        v27 = 2114;
        v28 = v23;
        v29 = 2048;
        v30 = self;
        v31 = 2114;
        v32 = CFSTR("BKSystemShellDescriptor.m");
        v33 = 1024;
        v34 = 204;
        v35 = 2114;
        v36 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
      __break(0);
      JUMPOUT(0x10007AA98);
    }
  }

  v7 = (NSString *)objc_msgSend(v24, "copy");
  jobLabel = self->super._jobLabel;
  self->super._jobLabel = v7;

}

- (void)setPid:(int)a3
{
  self->super._pid = a3;
}

- (void)setSystemIdleSleepInterval:(double)a3
{
  self->super._systemIdleSleepInterval = a3;
}

- (void)setWatchdogType:(int64_t)a3
{
  self->super._watchdogType = a3;
}

@end
