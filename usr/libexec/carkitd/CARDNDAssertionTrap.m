@implementation CARDNDAssertionTrap

- (CARDNDAssertionTrap)initWithPreferences:(id)a3
{
  id v4;
  CARDNDAssertionTrap *v5;
  CARDNDAssertionTrap *v6;
  uint64_t v7;
  NSUserDefaults *userDefaults;
  void *v9;

  v4 = a3;
  v5 = -[CARDNDAssertionTrap init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_preferences, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = (NSUserDefaults *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDAssertionTrap userDefaults](v6, "userDefaults"));
    v6->_activeAssertions = (int64_t)objc_msgSend(v9, "integerForKey:", CFSTR("CARDNDAssertionStateKey"));

  }
  return v6;
}

- (BOOL)isActive
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:", 8))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDAssertionTrap preferences](self, "preferences"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "disableTimerTimestamp"));

    if (!v4
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
          v6 = +[CARAnalytics calendarUnitsOfType:fromDate:toDate:](CARAnalytics, "calendarUnitsOfType:fromDate:toDate:", 64, v4, v5), v5, v6 >= 8))
    {
      self->_activeAssertions &= ~8uLL;
    }

  }
  return -[CARDNDAssertionTrap activeAssertions](self, "activeAssertions") != 0;
}

- (BOOL)hasAssertion:(int64_t)a3
{
  return (a3 & ~(unint64_t)-[CARDNDAssertionTrap activeAssertions](self, "activeAssertions")) == 0;
}

- (void)takeAssertion:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  void *v14;

  v5 = -[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:");
  if (!v5)
  {
    v7 = CarDNDWDLogging(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Taking assertion trap for %@", buf, 0xCu);

    }
    if (a3 == 8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDAssertionTrap preferences](self, "preferences"));
      objc_msgSend(v11, "setDisableTimerTimestamp:", v10);

    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100034B90;
  v12[3] = &unk_1000B6370;
  v12[4] = self;
  v12[5] = a3;
  -[CARDNDAssertionTrap _mutateAssertionsCallingDelegate:withBlock:](self, "_mutateAssertionsCallingDelegate:withBlock:", 1, v12);
}

- (void)releaseAssertion:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;

  v5 = -[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:");
  if (v5)
  {
    v7 = CarDNDWDLogging(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Releasing assertion trap for %@", buf, 0xCu);

    }
    if (a3 == 8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDAssertionTrap preferences](self, "preferences"));
      objc_msgSend(v10, "setDisableTimerTimestamp:", 0);

    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100034CD8;
  v11[3] = &unk_1000B6370;
  v11[4] = self;
  v11[5] = a3;
  -[CARDNDAssertionTrap _mutateAssertionsCallingDelegate:withBlock:](self, "_mutateAssertionsCallingDelegate:withBlock:", 1, v11);
}

- (void)releaseAllAssertions
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = CarDNDWDLogging(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing all assertion traps.", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100034DB0;
  v6[3] = &unk_1000B51B8;
  v6[4] = self;
  -[CARDNDAssertionTrap _mutateAssertionsCallingDelegate:withBlock:](self, "_mutateAssertionsCallingDelegate:withBlock:", 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDAssertionTrap preferences](self, "preferences"));
  objc_msgSend(v5, "setDisableTimerTimestamp:", 0);

}

- (void)releaseAllTemporaryAssertions
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = CarDNDWDLogging(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing all temporary assertions.", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100034E64;
  v5[3] = &unk_1000B51B8;
  v5[4] = self;
  -[CARDNDAssertionTrap _mutateAssertionsCallingDelegate:withBlock:](self, "_mutateAssertionsCallingDelegate:withBlock:", 0, v5);
}

- (NSString)activeAssertionsDebugString
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (-[CARDNDAssertionTrap isActive](self, "isActive"))
  {
    v4 = (void *)objc_opt_new(NSMutableArray, v3);
    if (-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:", 4))
      objc_msgSend(v4, "addObject:", CFSTR("Airplane Mode"));
    if (-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:", 1))
      objc_msgSend(v4, "addObject:", CFSTR("CarPlay session"));
    if (-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:", 2))
      objc_msgSend(v4, "addObject:", CFSTR("User-disabled until end of drive"));
    if (-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:", 8))
      objc_msgSend(v4, "addObject:", CFSTR("8-minute hold"));
    if (-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:", 16))
      objc_msgSend(v4, "addObject:", CFSTR("System-disabled until end of drive"));
    if (-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:", 32))
      objc_msgSend(v4, "addObject:", CFSTR("Find My Device mode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", ")));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Active assertions: %@"), v5));

  }
  else
  {
    v6 = CFSTR("No active assertions.");
  }
  return (NSString *)v6;
}

- (void)_mutateAssertionsCallingDelegate:(BOOL)a3 withBlock:(id)a4
{
  _BOOL4 v4;
  CARDNDAssertionTrap *v6;
  unsigned int v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void (**v13)(void);

  v4 = a3;
  v13 = (void (**)(void))a4;
  v6 = self;
  objc_sync_enter(v6);
  v7 = -[CARDNDAssertionTrap isActive](v6, "isActive");
  v13[2]();
  v8 = -[CARDNDAssertionTrap isActive](v6, "isActive");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDAssertionTrap userDefaults](v6, "userDefaults"));
  objc_msgSend(v9, "setInteger:forKey:", -[CARDNDAssertionTrap activeAssertions](v6, "activeAssertions"), CFSTR("CARDNDAssertionStateKey"));

  if (v4 && v8 | v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDAssertionTrap delegate](v6, "delegate"));
    v11 = objc_opt_respondsToSelector(v10, "assertionTrap:didBecomeActive:");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDAssertionTrap delegate](v6, "delegate"));
      objc_msgSend(v12, "assertionTrap:didBecomeActive:", v6, v8);

    }
  }
  objc_sync_exit(v6);

}

- (CARAutomaticDNDStatus)preferences
{
  return (CARAutomaticDNDStatus *)objc_loadWeakRetained((id *)&self->_preferences);
}

- (CARDNDAssertionTrapDelegate)delegate
{
  return (CARDNDAssertionTrapDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)activeAssertions
{
  return self->_activeAssertions;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_preferences);
}

@end
