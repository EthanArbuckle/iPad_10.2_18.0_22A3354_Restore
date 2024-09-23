@implementation _DASTimer

- (void)cancelPreviousWakeRequest
{
  __CFString *v3;
  BOOL v4;
  const __CFDate *time_to_wake;

  time_to_wake = (const __CFDate *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_previousWakeRequestDictionary, "objectForKeyedSubscript:", CFSTR("time")));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_previousWakeRequestDictionary, "objectForKeyedSubscript:", CFSTR("scheduledby")));
  if (time_to_wake)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
    IOPMCancelScheduledPowerEvent(time_to_wake, v3, CFSTR("wake"));

}

- (void)scheduleOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6
{
  _BOOL4 v6;
  double v10;
  void *v11;
  unint64_t v12;
  NSObject *timer;
  dispatch_time_t v14;
  id v15;

  v6 = a6;
  v15 = a3;
  dispatch_suspend((dispatch_object_t)self->_timer);
  v10 = a5 - a4;
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4 + 10.0));
    -[_DASTimer requestSystemWakeOnBehalfOf:at:withLeeway:cancelPrevious:](self, "requestSystemWakeOnBehalfOf:at:withLeeway:cancelPrevious:", v15, v11, 1, v10 + -10.0);

    v12 = 10;
  }
  else
  {
    v12 = (unint64_t)fmax(v10, 1.0);
  }
  timer = self->_timer;
  v14 = dispatch_walltime(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer(timer, v14, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * v12);
  dispatch_resume((dispatch_object_t)self->_timer);

}

- (void)requestSystemWakeOnBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5 cancelPrevious:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *previousWakeRequestDictionary;
  NSObject *v17;
  uint8_t buf[4];
  id v19;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("time"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)a5));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("leeway"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), _DASDaemonServiceName, v10));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("scheduledby"));

  if (v6)
  {
    -[_DASTimer cancelPreviousWakeRequest](self, "cancelPreviousWakeRequest");
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v12));
    previousWakeRequestDictionary = self->_previousWakeRequestDictionary;
    self->_previousWakeRequestDictionary = v15;

  }
  if (IOPMRequestSysWake(v12))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to request system wake for %@", buf, 0xCu);
    }

  }
}

- (id)callback
{
  return self->_callback;
}

- (_DASTimer)initWithCallback:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  dispatch_source_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_DASTimer;
  v5 = -[_DASTimer init](&v19, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.das.dastimerqueue", v9);
    v11 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v10;

    v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v5 + 2));
    v13 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v12;

    dispatch_set_qos_class_fallback(*((_QWORD *)v5 + 3), 17);
    dispatch_source_set_timer(*((dispatch_source_t *)v5 + 3), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
    objc_initWeak(&location, v5);
    v14 = *((_QWORD *)v5 + 3);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000472C;
    v16[3] = &unk_10015D9E0;
    objc_copyWeak(&v17, &location);
    dispatch_source_set_event_handler(v14, v16);
    dispatch_resume(*((dispatch_object_t *)v5 + 3));
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return (_DASTimer *)v5;
}

+ (_DASTimer)timerWithCallback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithCallback:", v4);

  return (_DASTimer *)v5;
}

- (void)requestSystemWakeOBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5
{
  -[_DASTimer requestSystemWakeOnBehalfOf:at:withLeeway:cancelPrevious:](self, "requestSystemWakeOnBehalfOf:at:withLeeway:cancelPrevious:", a3, a4, 0, a5);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSDictionary)previousWakeRequestDictionary
{
  return self->_previousWakeRequestDictionary;
}

- (void)setPreviousWakeRequestDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_previousWakeRequestDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousWakeRequestDictionary, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
