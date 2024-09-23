@implementation BKDigitizerTouchStreamClient

- (BKDigitizerTouchStreamClient)init
{
  BKDigitizerTouchStreamClient *v2;
  BKDigitizerTouchStreamClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKDigitizerTouchStreamClient;
  v2 = -[BKDigitizerTouchStreamClient init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_dispatchMode = 1;
    v2->_creationTime = BSContinuousMachTimeNow(v2);
    v3->_valid = 1;
  }
  return v3;
}

- (void)dealloc
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKDigitizerTouchStreamClient *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (self && self->_valid)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dealloc without previous -invalidate")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKDigitizerTouchStreamClient.m");
      v20 = 1024;
      v21 = 45;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x10008C404);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKDigitizerTouchStreamClient;
  -[BKDigitizerTouchStreamClient dealloc](&v11, "dealloc");
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10008C4BC;
  v3[3] = &unk_1000ECD80;
  v3[4] = a3;
  v3[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_processDeathWatcher, 0);
  objc_storeStrong((id *)&self->_touchDestination, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
