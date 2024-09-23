@implementation NavIdleTimeoutTimer

- (NavIdleTimeoutTimer)initWithWindow:(id)a3
{
  return -[NavIdleTimeoutTimer initWithWindow:idleTimeout:](self, "initWithWindow:idleTimeout:", a3, 15.0);
}

- (NavIdleTimeoutTimer)initWithWindow:(id)a3 idleTimeout:(double)a4
{
  id v6;
  NavIdleTimeoutTimer *v7;
  NavIdleTimeoutTimer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NavIdleTimeoutTimer;
  v7 = -[NavIdleTimeoutTimer init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_window, v6);
    v8->_idleTimeout = a4;
    -[NavIdleTimeoutTimer _setupEventTap](v8, "_setupEventTap");
    -[NavIdleTimeoutTimer _scheduleTimer](v8, "_scheduleTimer");
  }

  return v8;
}

- (NavIdleTimeoutTimer)initWithView:(id)a3
{
  return -[NavIdleTimeoutTimer initWithView:idleTimeout:](self, "initWithView:idleTimeout:", a3, 15.0);
}

- (NavIdleTimeoutTimer)initWithView:(id)a3 idleTimeout:(double)a4
{
  id v6;
  NavIdleTimeoutTimer *v7;
  NavIdleTimeoutTimer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NavIdleTimeoutTimer;
  v7 = -[NavIdleTimeoutTimer init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_view, v6);
    v8->_idleTimeout = a4;
    -[NavIdleTimeoutTimer _setupEventTap](v8, "_setupEventTap");
    -[NavIdleTimeoutTimer _scheduleTimer](v8, "_scheduleTimer");
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutGestureRecognizer view](self->_gestureRecognizer, "view"));
  objc_msgSend(v3, "removeGestureRecognizer:", self->_gestureRecognizer);

  -[NavIdleTimeoutTimer _invalidateTimer](self, "_invalidateTimer");
  v4.receiver = self;
  v4.super_class = (Class)NavIdleTimeoutTimer;
  -[NavIdleTimeoutTimer dealloc](&v4, "dealloc");
}

- (void)_setupEventTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NavIdleTimeoutGestureRecognizer *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer window](self, "window"));

  if (v3)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100C1D0A4;
    v11[3] = &unk_1011DE808;
    objc_copyWeak(&v12, &location);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[EventTap eventTapWithHandler:](EventTap, "eventTapWithHandler:", v11));
    -[NavIdleTimeoutTimer setEventTap:](self, "setEventTap:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer window](self, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer eventTap](self, "eventTap"));
    objc_msgSend(v5, "_maps_registerEventTap:", v6);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer view](self, "view"));

    if (v7)
    {
      v8 = -[NavIdleTimeoutGestureRecognizer initWithTarget:action:]([NavIdleTimeoutGestureRecognizer alloc], "initWithTarget:action:", self, "_handleGesture:");
      -[NavIdleTimeoutTimer setGestureRecognizer:](self, "setGestureRecognizer:", v8);

      v10 = (id)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer view](self, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer gestureRecognizer](self, "gestureRecognizer"));
      objc_msgSend(v10, "addGestureRecognizer:", v9);

    }
  }
}

- (void)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (!objc_msgSend(v4, "type") && !-[NavIdleTimeoutTimer suppressInterruptions](self, "suppressInterruptions"))
  {
    -[NavIdleTimeoutTimer _invalidateTimer](self, "_invalidateTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer window](self, "window"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "touchesForWindow:", v5));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer view](self, "view"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "touchesForWindow:", v8));

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "phase", (_QWORD)v15) != (id)3 && objc_msgSend(v14, "phase") != (id)4)
          {

            goto LABEL_17;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          continue;
        break;
      }
    }

    -[NavIdleTimeoutTimer _scheduleTimer](self, "_scheduleTimer");
LABEL_17:

  }
}

- (void)_handleGesture:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "event"));
  -[NavIdleTimeoutTimer _handleEvent:](self, "_handleEvent:", v4);

}

- (void)_scheduleTimer
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  dispatch_source_t v7;
  NSObject *v8;
  double v9;
  dispatch_time_t v10;
  NSObject *v11;
  double v12;
  NSObject *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer dispatchSource](self, "dispatchSource"));

  if (v3)
    -[NavIdleTimeoutTimer _invalidateTimer](self, "_invalidateTimer");
  v4 = sub_100C1D500();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NavIdleTimeoutTimer idleTimeout](self, "idleTimeout");
    *(_DWORD *)buf = 134217984;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling timeout in %f", buf, 0xCu);
  }

  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  -[NavIdleTimeoutTimer setDispatchSource:](self, "setDispatchSource:", v7);

  objc_initWeak((id *)buf, self);
  v8 = objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer dispatchSource](self, "dispatchSource"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100C1D540;
  handler[3] = &unk_1011AD260;
  objc_copyWeak(&v15, (id *)buf);
  dispatch_source_set_event_handler(v8, handler);

  -[NavIdleTimeoutTimer idleTimeout](self, "idleTimeout");
  v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  v11 = objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer dispatchSource](self, "dispatchSource"));
  -[NavIdleTimeoutTimer idleTimeout](self, "idleTimeout");
  dispatch_source_set_timer(v11, v10, 1000000000 * (unint64_t)v12, 0x3B9ACA00uLL);

  v13 = objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer dispatchSource](self, "dispatchSource"));
  dispatch_resume(v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_invalidateTimer
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer dispatchSource](self, "dispatchSource"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer dispatchSource](self, "dispatchSource"));
    dispatch_source_cancel(v4);

    -[NavIdleTimeoutTimer setDispatchSource:](self, "setDispatchSource:", 0);
  }
}

- (void)_handleTimer
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[NavIdleTimeoutTimer _invalidateTimer](self, "_invalidateTimer");
  v3 = sub_100C1D500();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Timeout fired", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavIdleTimeoutTimer delegate](self, "delegate"));
  objc_msgSend(v5, "idleTimerDidTimeout:", self);

}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (BOOL)suppressInterruptions
{
  return self->_suppressInterruptions;
}

- (void)setSuppressInterruptions:(BOOL)a3
{
  self->_suppressInterruptions = a3;
}

- (NavIdleTimerDelegate)delegate
{
  return (NavIdleTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EventTap)eventTap
{
  return self->_eventTap;
}

- (void)setEventTap:(id)a3
{
  objc_storeStrong((id *)&self->_eventTap, a3);
}

- (NavIdleTimeoutGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (OS_dispatch_source)dispatchSource
{
  return self->_dispatchSource;
}

- (void)setDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSource, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_eventTap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_window);
}

@end
