@implementation BKDisplayLink

- (BKDisplayLink)initWithDisplayLinkClass:(Class)a3 display:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v11;
  id v12;
  BKDisplayLink *v13;
  BKDisplayLink *v14;
  id v15;
  id v16;
  void *v17;
  NSString *v18;
  NSString *displayUUID;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSString *v25;
  NSThread *v26;
  NSThread *thread;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  NSThread *v32;
  void *v33;
  objc_super v35;
  NSRunLoopMode v36;
  uint8_t buf[4];
  BKDisplayLink *v38;
  __int16 v39;
  NSString *v40;

  v11 = a4;
  v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)BKDisplayLink;
  v13 = -[BKDisplayLink init](&v35, "init");
  v14 = v13;
  if (v13)
  {
    v13->_displayLinkClass = a3;
    objc_storeStrong((id *)&v13->_display, a4);
    v15 = (id)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](v14->_display, "uniqueId"));
    v16 = objc_msgSend(v15, "length");
    v17 = (void *)BKSDisplayUUIDMainKey;
    if (v16)
      v17 = v15;
    v18 = v17;

    displayUUID = v14->_displayUUID;
    v14->_displayUUID = v18;

    objc_storeStrong(&v14->_target, a5);
    v14->_action = a6;
    v23 = BKLogMousePointer(v20, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v14->_displayUUID;
      *(_DWORD *)buf = 134218242;
      v38 = v14;
      v39 = 2114;
      v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "BKDisplayLink init %p %{public}@", buf, 0x16u);
    }

    v26 = (NSThread *)objc_msgSend(objc_alloc((Class)NSThread), "initWithTarget:selector:object:", v14, "_thread_startRunLoop", 0);
    thread = v14->_thread;
    v14->_thread = v26;

    -[NSThread start](v14->_thread, "start");
    v29 = objc_msgSend((id)objc_opt_class(v12, v28), "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ BKDisplayLink:%p for %@"), v30, v14, v14->_displayUUID));

    -[NSThread setName:](v14->_thread, "setName:", v31);
    v32 = v14->_thread;
    v36 = NSRunLoopCommonModes;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
    -[BKDisplayLink performSelector:onThread:withObject:waitUntilDone:modes:](v14, "performSelector:onThread:withObject:waitUntilDone:modes:", "description", v32, 0, 0, v33);

  }
  return v14;
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
  BKDisplayLink *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (!self->_thread_invalid)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must -invalidate before dealloc")));
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
      v19 = CFSTR("BKDisplayLink.m");
      v20 = 1024;
      v21 = 55;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x10001AEACLL);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKDisplayLink;
  -[BKDisplayLink dealloc](&v11, "dealloc");
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  BKDisplayLink *v10;

  v3 = BKLogMousePointer(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BKDisplayLink %p invalidate start ", (uint8_t *)&v9, 0xCu);
  }

  v5 = -[BKDisplayLink performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", "_thread_invalidate", self->_thread, 0, 0);
  v7 = BKLogMousePointer(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BKDisplayLink %p invalidate finish", (uint8_t *)&v9, 0xCu);
  }

}

- (void)setPaused:(BOOL)a3
{
  NSThread *thread;
  id v5;

  self->_paused = a3;
  thread = self->_thread;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:"));
  -[BKDisplayLink performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", "_thread_setPaused:", thread, v5, 0);

}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)_thread_setPaused:(id)a3
{
  -[CADisplayLink setPaused:](self->_thread_displayLink, "setPaused:", objc_msgSend(a3, "BOOLValue"));
}

- (void)_thread_invalidate
{
  _BOOL4 thread_invalid;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  CADisplayLink *thread_displayLink;
  CADisplay *display;
  __CFRunLoop *Current;
  int v10;
  BKDisplayLink *v11;

  thread_invalid = self->_thread_invalid;
  v4 = BKLogMousePointer(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (thread_invalid)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "BKDisplayLink %p _thread_invalidate already invalid", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BKDisplayLink %p _thread_invalidate", (uint8_t *)&v10, 0xCu);
    }

    self->_thread_invalid = 1;
    -[CADisplayLink invalidate](self->_thread_displayLink, "invalidate");
    thread_displayLink = self->_thread_displayLink;
    self->_thread_displayLink = 0;

    display = self->_display;
    self->_display = 0;

    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    CFRunLoopWakeUp(Current);
  }
}

- (void)_thread_displayLinkFired
{
  if (!self->_thread_invalid)
    objc_msgSend(self->_target, self->_action);
}

- (void)_thread_startRunLoop
{
  _opaque_pthread_t *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSRunLoop *v8;
  NSRunLoop *runLoop;
  CADisplayLink *v10;
  CADisplayLink *thread_displayLink;
  sched_param v12;
  uint8_t buf[4];
  int v14;

  v12 = (sched_param)63;
  v3 = pthread_self();
  v4 = pthread_setschedparam(v3, 2, &v12);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = BKLogCommon(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cannot set event router thread priority (error %d)", buf, 8u);
    }

  }
  v8 = (NSRunLoop *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  runLoop = self->_runLoop;
  self->_runLoop = v8;

  v10 = (CADisplayLink *)objc_claimAutoreleasedReturnValue(-[objc_class displayLinkWithDisplay:target:selector:](self->_displayLinkClass, "displayLinkWithDisplay:target:selector:", self->_display, self, "_thread_displayLinkFired"));
  thread_displayLink = self->_thread_displayLink;
  self->_thread_displayLink = v10;

  -[CADisplayLink addToRunLoop:forMode:](self->_thread_displayLink, "addToRunLoop:forMode:", self->_runLoop, NSRunLoopCommonModes);
  CFRunLoopRun();
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void)setDisplayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_thread_displayLink, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

@end
