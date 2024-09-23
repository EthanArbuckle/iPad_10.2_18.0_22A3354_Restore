@implementation MapsThrottler

- (MapsThrottler)initWithInitialValue:(id)a3 throttlingInterval:(double)a4 queue:(id)a5 updateHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  MapsThrottler *v14;
  MapsThrottler *v15;
  id v16;
  id updateHandler;
  uint64_t v18;
  geo_isolater *isolator;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MapsThrottler;
  v14 = -[MapsThrottler init](&v21, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_value, a3);
    v15->_throttlingInterval = fmax(a4, 0.0);
    objc_storeStrong((id *)&v15->_queue, a5);
    v16 = objc_retainBlock(v13);
    updateHandler = v15->_updateHandler;
    v15->_updateHandler = v16;

    v18 = geo_isolater_create("MapsThrottler");
    isolator = v15->_isolator;
    v15->_isolator = (geo_isolater *)v18;

  }
  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  double throttlingInterval;
  const char *label;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MapsThrottler;
  v3 = -[MapsThrottler description](&v17, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  throttlingInterval = self->_throttlingInterval;
  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  v7 = self->_value;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_7;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_7:

LABEL_9:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (interval: %#.2lfs, queue: %s, value: %@)"), v4, *(_QWORD *)&throttlingInterval, label, v14));

  return v15;
}

- (id)value
{
  geo_isolater *isolator;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006162CC;
  v10 = sub_1006162DC;
  v11 = 0;
  isolator = self->_isolator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006162E4;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  geo_isolate_sync_data(isolator, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSDate)valueTimestamp
{
  geo_isolater *isolator;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006162CC;
  v10 = sub_1006162DC;
  v11 = 0;
  isolator = self->_isolator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006163C4;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  geo_isolate_sync_data(isolator, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setValue:(id)a3
{
  id v4;
  geo_isolater *isolator;
  id v6;
  _QWORD v7[4];
  id v8;
  MapsThrottler *v9;

  v4 = a3;
  isolator = self->_isolator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100616454;
  v7[3] = &unk_1011AC8B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  geo_isolate_sync(isolator, v7);

}

- (void)_dispatchIfNeeded
{
  id v3;
  NSObject *v4;
  MapsThrottler *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  NSObject *v20;
  MapsThrottler *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_time_t v28;
  NSObject *queue;
  _QWORD block[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  __CFString *v37;

  geo_assert_isolated(self->_isolator, a2);
  if (!self->_valueChangedSinceLastUpdateStarted || self->_dispatched || self->_running)
  {
    v3 = sub_100616744();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:

      return;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThrottler performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_10;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_10:

    if (v5->_dispatched)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v12;
    if (v5->_running)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
    *(_DWORD *)buf = 138543874;
    v33 = v11;
    v34 = 2114;
    v35 = *(double *)&v13;
    v36 = 2114;
    v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] will not dispatch (dispatched: %{public}@, running: %{public}@)", buf, 0x20u);

    goto LABEL_17;
  }
  if (self->_lastUpdateStartedDate)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v16, "timeIntervalSinceDate:", self->_lastUpdateStartedDate);
    v18 = fmax(self->_throttlingInterval - v17, 0.0);

  }
  else
  {
    v18 = 0.0;
  }
  v19 = sub_100616744();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = self;
    v22 = (objc_class *)objc_opt_class(v21);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThrottler performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

        goto LABEL_28;
      }

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_28:

    *(_DWORD *)buf = 138543618;
    v33 = v27;
    v34 = 2048;
    v35 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] will dispatch after %#.2lfs", buf, 0x16u);

  }
  self->_dispatched = 1;
  objc_initWeak((id *)buf, self);
  v28 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100616B4C;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v31, (id *)buf);
  dispatch_after(v28, queue, block);
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (void)_run
{
  geo_isolater *isolator;
  _QWORD *v4;
  id v5;
  NSObject *v6;
  MapsThrottler *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  _QWORD v23[6];
  id v24;
  id location;
  _QWORD v26[3];
  char v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  __CFString *v38;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1006162CC;
  v33 = sub_1006162DC;
  v34 = 0;
  isolator = self->_isolator;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100616F3C;
  v28[3] = &unk_1011ADF48;
  v28[4] = self;
  v28[5] = &v29;
  geo_isolate_sync(isolator, v28);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100616FA8;
  v23[3] = &unk_1011BE200;
  objc_copyWeak(&v24, &location);
  v23[4] = self;
  v23[5] = v26;
  v4 = objc_retainBlock(v23);
  v5 = sub_100616744();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThrottler performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && (objc_msgSend(v11, "isEqualToString:", v10) & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

LABEL_7:
        v14 = v13;
        v15 = (id)v30[5];
        v16 = v15;
        if (!v15)
        {
          v22 = CFSTR("<nil>");
          goto LABEL_15;
        }
        v17 = (objc_class *)objc_opt_class(v15);
        v18 = NSStringFromClass(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "performSelector:", "accessibilityIdentifier"));
          v21 = v20;
          if (v20 && (objc_msgSend(v20, "isEqualToString:", v19) & 1) == 0)
          {
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

            goto LABEL_13;
          }

        }
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_13:

LABEL_15:
        *(_DWORD *)buf = 138543618;
        v36 = v14;
        v37 = 2114;
        v38 = v22;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] calling update handler with value %{public}@", buf, 0x16u);

        goto LABEL_16;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
    goto LABEL_7;
  }
LABEL_16:

  (*((void (**)(void))self->_updateHandler + 2))();
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v29, 8);

}

- (double)throttlingInterval
{
  return self->_throttlingInterval;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastUpdateStartedDate, 0);
  objc_storeStrong((id *)&self->_valueTimestamp, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_isolator, 0);
}

@end
