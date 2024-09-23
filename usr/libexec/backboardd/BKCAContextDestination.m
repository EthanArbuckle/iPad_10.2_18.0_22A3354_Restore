@implementation BKCAContextDestination

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class(self, a2, a3));
  *((_DWORD *)v4 + 2) = self->_contextID;
  *((_DWORD *)v4 + 3) = self->_clientPort;
  objc_storeStrong((id *)v4 + 2, self->_inheritedSceneHostSettings);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  BOOL v12;

  v4 = a3;
  v7 = objc_opt_class(BKCAContextDestination, v5, v6);
  v8 = v4;
  v9 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = v11 && self->_contextID == v11[2] && self->_clientPort == v11[3];
  return v12;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_contextID));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BKCAContextDestination)initWithContextID:(unsigned int)a3 clientPort:(unsigned int)a4
{
  BKCAContextDestination *result;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  BKCAContextDestination *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;

  if (!a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), *(_QWORD *)&a4, CFSTR("contextID != 0")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v13 = (objc_class *)objc_opt_class(self, v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138544642;
      v25 = v11;
      v26 = 2114;
      v27 = v15;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKCAContextDestination.m");
      v32 = 1024;
      v33 = 19;
      v34 = 2114;
      v35 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    __break(0);
    JUMPOUT(0x100013258);
  }
  if (a4 + 1 <= 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("(((clientPort) != 0) && ((clientPort) != ((mach_port_name_t) ~0)))")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v20 = (objc_class *)objc_opt_class(self, v19);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138544642;
      v25 = v18;
      v26 = 2114;
      v27 = v22;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKCAContextDestination.m");
      v32 = 1024;
      v33 = 20;
      v34 = 2114;
      v35 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
    __break(0);
    JUMPOUT(0x100013350);
  }
  v23.receiver = self;
  v23.super_class = (Class)BKCAContextDestination;
  result = -[BKCAContextDestination init](&v23, "init");
  if (result)
  {
    result->_contextID = a3;
    result->_clientPort = a4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inheritedSceneHostSettings, 0);
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)BSDescriptionStream);
  -[BKCAContextDestination appendSuccinctDescriptionToFormatter:](self, "appendSuccinctDescriptionToFormatter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));

  return v4;
}

- (void)appendSuccinctDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "appendUInt64:withName:format:", self->_contextID, CFSTR("contextID"), 1);
  v5 = objc_msgSend(v7, "appendUInt64:withName:format:", self->_clientPort, CFSTR("clientPort"), 1);
  v6 = objc_msgSend(v7, "appendObject:withName:skipIfNil:", self->_inheritedSceneHostSettings, CFSTR("inheritedSceneHostSettings"), 1);

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKCAContextDestination *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041DD8;
  v4[3] = &unk_1000ECD80;
  v5 = self;
  v6 = a3;
  v3 = v6;
  objc_msgSend(v3, "appendProem:block:", v5, v4);

}

@end
