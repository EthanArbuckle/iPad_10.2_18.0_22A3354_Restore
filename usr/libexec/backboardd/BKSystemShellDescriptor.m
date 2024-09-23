@implementation BKSystemShellDescriptor

- (BKSystemShellDescriptor)init
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  BKSystemShellDescriptor *result;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKSystemShellDescriptor *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot directly allocate BKSystemShellDescriptor")));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138544642;
    v13 = v6;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("BKSystemShellDescriptor.m");
    v20 = 1024;
    v21 = 33;
    v22 = 2114;
    v23 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

  }
  result = (BKSystemShellDescriptor *)_bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  __break(0);
  return result;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  v4 = -[NSString hash](self->_bundlePath, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_jobLabel, "hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pid));
  v7 = v5 ^ (unint64_t)objc_msgSend(v6, "hash");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_systemIdleSleepInterval));
  v9 = (unint64_t)objc_msgSend(v8, "hash");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_watchdogType));
  v11 = v7 ^ v9 ^ (unint64_t)objc_msgSend(v10, "hash");

  v12 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27));
  return v12 ^ (v12 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;

  v4 = a3;
  v7 = objc_opt_class(BKSystemShellDescriptor, v5, v6);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    v8 = v4;
    v9 = BSEqualObjects(v8[1], self->_bundleIdentifier)
      && BSEqualObjects(v8[2], self->_bundlePath)
      && BSEqualObjects(v8[3], self->_jobLabel)
      && *((_DWORD *)v8 + 8) == self->_pid
      && *((double *)v8 + 5) == self->_systemIdleSleepInterval
      && v8[6] == self->_watchdogType;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return sub_10007B040([BKSystemShellDescriptor alloc], self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return sub_10007B040([BKMutableSystemShellDescriptor alloc], self);
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStyle debugStyle](BSDescriptionStyle, "debugStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:withStyle:](BSDescriptionStream, "descriptionForRootObject:withStyle:", self, v3));

  return (NSString *)v4;
}

- (id)succinctDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStyle succinctStyle](BSDescriptionStyle, "succinctStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:withStyle:](BSDescriptionStream, "descriptionForRootObject:withStyle:", self, v3));

  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int64_t watchdogType;
  __CFString *v11;
  id v12;

  v12 = a3;
  v4 = BSProcessDescriptionForPID(self->_pid);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v12, "appendString:withName:", v5, 0);

  if ((objc_msgSend(v12, "hasSuccinctStyle") & 1) == 0)
  {
    v6 = objc_msgSend(v12, "appendObject:withName:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
    v7 = objc_msgSend(v12, "appendObject:withName:", self->_bundlePath, CFSTR("bundlePath"));
    v8 = objc_msgSend(v12, "appendObject:withName:", self->_jobLabel, CFSTR("jobLabel"));
    v9 = objc_msgSend(v12, "appendDouble:withName:decimalPrecision:", CFSTR("systemIdleSleepInterval"), 2, self->_systemIdleSleepInterval);
    watchdogType = self->_watchdogType;
    if (watchdogType)
    {
      if (watchdogType == 1)
        v11 = CFSTR("shell");
      else
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<unknown:%lX>"), self->_watchdogType));
    }
    else
    {
      v11 = CFSTR("BackBoard");
    }
    objc_msgSend(v12, "appendString:withName:", v11, CFSTR("watchdogType"));

  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)jobLabel
{
  return self->_jobLabel;
}

- (int)pid
{
  return self->_pid;
}

- (double)systemIdleSleepInterval
{
  return self->_systemIdleSleepInterval;
}

- (int64_t)watchdogType
{
  return self->_watchdogType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobLabel, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  BKMutableSystemShellDescriptor *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = (void (**)(id, id))a3;
  v4 = [BKMutableSystemShellDescriptor alloc];
  v6 = sub_10007B0D4(v4, v5);
  v3[2](v3, v6);

  v7 = objc_msgSend(v6, "copy");
  return v7;
}

+ (BKSystemShellDescriptor)new
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  BKSystemShellDescriptor *result;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot directly allocate BKSystemShellDescriptor")));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = (objc_class *)objc_opt_class(a1, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138544642;
    v13 = v6;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = a1;
    v18 = 2114;
    v19 = CFSTR("BKSystemShellDescriptor.m");
    v20 = 1024;
    v21 = 38;
    v22 = 2114;
    v23 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

  }
  result = (BKSystemShellDescriptor *)_bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  __break(0);
  return result;
}

@end
