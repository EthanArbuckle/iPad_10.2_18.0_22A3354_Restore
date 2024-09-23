@implementation LockScreenSecureWindow

- (LockScreenSecureWindow)initWithCoder:(id)a3
{
  LockScreenSecureWindow *v3;
  LockScreenSecureWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LockScreenSecureWindow;
  v3 = -[LockScreenSecureWindow initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[LockScreenSecureWindow _commonInit](v3, "_commonInit");
  return v4;
}

- (LockScreenSecureWindow)initWithFrame:(CGRect)a3
{
  LockScreenSecureWindow *v3;
  LockScreenSecureWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LockScreenSecureWindow;
  v3 = -[LockScreenSecureWindow initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LockScreenSecureWindow _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  -[LockScreenSecureWindow setHidden:](self, "setHidden:", objc_msgSend(v3, "isInNavigatingState") ^ 1);

  -[LockScreenSecureWindow setUserInteractionEnabled:](self, "setUserInteractionEnabled:", -[LockScreenSecureWindow isHidden](self, "isHidden") ^ 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v4, "registerObserver:", self);

}

- (BOOL)_canAffectStatusBarAppearance
{
  return 1;
}

- (void)registerEventTap:(id)a3
{
  id v4;
  NSHashTable *eventTaps;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  eventTaps = self->_eventTaps;
  v8 = v4;
  if (!eventTaps)
  {
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v7 = self->_eventTaps;
    self->_eventTaps = v6;

    v4 = v8;
    eventTaps = self->_eventTaps;
  }
  -[NSHashTable addObject:](eventTaps, "addObject:", v4);
  self->_hasEventTaps = 1;

}

- (void)sendEvent:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  if (self->_hasEventTaps)
  {
    if (-[NSHashTable count](self->_eventTaps, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = self->_eventTaps;
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "sendEvent:", v4);
            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }

    }
    else
    {
      self->_hasEventTaps = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)LockScreenSecureWindow;
  -[LockScreenSecureWindow sendEvent:](&v10, "sendEvent:", v4);

}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  dispatch_time_t v6;
  _QWORD block[5];

  if ((MNNavigationServiceStateIsNavigating(a5, a2) & 1) == 0)
  {
    -[LockScreenSecureWindow setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10054E918;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateIsNavigating(a5, a2))
  {
    -[LockScreenSecureWindow setHidden:](self, "setHidden:", 0);
    -[LockScreenSecureWindow setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTaps, 0);
}

@end
