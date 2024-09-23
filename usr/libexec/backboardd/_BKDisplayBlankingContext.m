@implementation _BKDisplayBlankingContext

- (id)initForDisplay:(id)a3
{
  id v5;
  _BKDisplayBlankingContext *v6;
  _BKDisplayBlankingContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BKDisplayBlankingContext;
  v6 = -[_BKDisplayBlankingContext init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_display, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_BKDisplayBlankingContext clear](self, "clear");
  v3.receiver = self;
  v3.super_class = (Class)_BKDisplayBlankingContext;
  -[_BKDisplayBlankingContext dealloc](&v3, "dealloc");
}

- (void)blank
{
  uint64_t v3;
  NSObject *v4;
  CAWindowServerDisplay *display;
  void *v7;
  NSString *v8;
  _BKDisplayBlankingContext *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  CAWindowServerDisplay *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  _BKDisplayBlankingContext *v16;
  __int16 v17;
  CAWindowServerDisplay *v18;
  __int16 v19;
  _BKDisplayBlankingContext *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;

  if (self->_blankingContext)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Already have a context")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (_BKDisplayBlankingContext *)objc_claimAutoreleasedReturnValue(v8);
      v11 = (objc_class *)objc_opt_class(self, v10);
      v12 = NSStringFromClass(v11);
      v13 = (CAWindowServerDisplay *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138544642;
      v16 = v9;
      v17 = 2114;
      v18 = v13;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("_BKDisplayBlankingContext.m");
      v23 = 1024;
      v24 = 33;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    __break(0);
    JUMPOUT(0x10002DEB4);
  }
  v3 = BKLogCommon(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    display = self->_display;
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = display;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ - blanking display: %@", buf, 0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002E118;
  v14[3] = &unk_1000ECDA8;
  v14[4] = self;
  -[_BKDisplayBlankingContext _wrapInCATransaction:](self, "_wrapInCATransaction:", v14);
}

- (void)clear
{
  uint64_t v3;
  NSObject *v4;
  CAWindowServerDisplay *display;
  _QWORD v6[5];
  uint8_t buf[4];
  _BKDisplayBlankingContext *v8;
  __int16 v9;
  CAWindowServerDisplay *v10;

  if (self->_blankingContext)
  {
    v3 = BKLogCommon(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      display = self->_display;
      *(_DWORD *)buf = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = display;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ - clearing blanked display: %@", buf, 0x16u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002E0C0;
    v6[3] = &unk_1000ECDA8;
    v6[4] = self;
    -[_BKDisplayBlankingContext _wrapInCATransaction:](self, "_wrapInCATransaction:", v6);
  }
}

- (void)_updateBounds
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_blankingContext, "layer"));
  -[CAWindowServerDisplay bounds](self->_display, "bounds");
  objc_msgSend(v3, "setBounds:");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bounds"), a4, a5, a6))
    -[_BKDisplayBlankingContext _updateBounds](self, "_updateBounds");
}

- (void)_wrapInCATransaction:(id)a3
{
  void (**v3)(_QWORD);

  if (a3)
  {
    v3 = (void (**)(_QWORD))a3;
    +[CATransaction begin](CATransaction, "begin");
    v3[2](v3);

    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blankingContext, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

@end
