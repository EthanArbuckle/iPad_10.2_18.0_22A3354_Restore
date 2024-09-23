@implementation ICProgressIndicatorTracker

- (ICProgressIndicatorTracker)init
{
  -[ICProgressIndicatorTracker doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICProgressIndicatorTracker)initWithDelegate:(id)a3
{
  id v4;
  ICProgressIndicatorTracker *v5;
  ICProgressIndicatorTracker *v6;
  id v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICProgressIndicatorTracker;
  v5 = -[ICProgressIndicatorTracker init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[ICProgressIndicatorTracker setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_msgSend(objc_alloc((Class)ICSelectorDelayer), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v6, "progressIndicatorShouldUpdate", 0, 1, 0.1);
    -[ICProgressIndicatorTracker setProgressIndicatorShouldStartDelayer:](v6, "setProgressIndicatorShouldStartDelayer:", v7);

    v8 = objc_msgSend(objc_alloc((Class)ICSelectorDelayer), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v6, "progressIndicatorShouldUpdate", 0, 1, 1.0);
    -[ICProgressIndicatorTracker setProgressIndicatorShouldStopDelayer:](v6, "setProgressIndicatorShouldStopDelayer:", v8);

  }
  return v6;
}

- (void)invalidate
{
  void *v3;
  id v4;

  -[ICProgressIndicatorTracker setDelegate:](self, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorShouldStartDelayer](self, "progressIndicatorShouldStartDelayer"));
  objc_msgSend(v3, "cancelPreviousFireRequests");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorShouldStopDelayer](self, "progressIndicatorShouldStopDelayer"));
  objc_msgSend(v4, "cancelPreviousFireRequests");

}

- (void)setMakingProgress:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  if (self->_makingProgress != a3)
  {
    v3 = a3;
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10040AB3C(v3, v5, v6, v7, v8, v9, v10, v11);

    self->_makingProgress = v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorShouldStartDelayer](self, "progressIndicatorShouldStartDelayer"));
    v13 = v12;
    if (v3)
    {
      objc_msgSend(v12, "requestFire");

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorShouldStopDelayer](self, "progressIndicatorShouldStopDelayer"));
      objc_msgSend(v14, "cancelPreviousFireRequests");
    }
    else
    {
      objc_msgSend(v12, "cancelPreviousFireRequests");

      v15 = objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorStartDate](self, "progressIndicatorStartDate"));
      if (v15)
      {
        v16 = (void *)v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorStartDate](self, "progressIndicatorStartDate"));
        objc_msgSend(v17, "timeIntervalSinceNow");
        v19 = v18;

        if (v19 <= -1.0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorShouldStopDelayer](self, "progressIndicatorShouldStopDelayer"));
          objc_msgSend(v23, "cancelPreviousFireRequests");

          -[ICProgressIndicatorTracker setProgressIndicatorShouldAnimate:](self, "setProgressIndicatorShouldAnimate:", 0);
          -[ICProgressIndicatorTracker setProgressIndicatorStartDate:](self, "setProgressIndicatorStartDate:", 0);
          return;
        }
        v20 = -v19;
      }
      else
      {
        v20 = 0.0;
      }
      v21 = 1.0 - v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorShouldStopDelayer](self, "progressIndicatorShouldStopDelayer"));
      objc_msgSend(v22, "setDelay:", v21);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICProgressIndicatorTracker progressIndicatorShouldStopDelayer](self, "progressIndicatorShouldStopDelayer"));
      objc_msgSend(v14, "requestFire");
    }

  }
}

- (void)setProgressIndicatorShouldAnimate:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  BOOL v13;

  if (self->_progressIndicatorShouldAnimate != a3)
  {
    v3 = a3;
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10040ABA4(v3, v5, v6, v7, v8, v9, v10, v11);

    self->_progressIndicatorShouldAnimate = v3;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000CA5E0;
    v12[3] = &unk_100550360;
    v13 = v3;
    v12[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
}

- (void)progressIndicatorShouldUpdate
{
  -[ICProgressIndicatorTracker setProgressIndicatorShouldAnimate:](self, "setProgressIndicatorShouldAnimate:", -[ICProgressIndicatorTracker makingProgress](self, "makingProgress"));
}

- (ICProgressIndicatorTrackerDelegate)delegate
{
  return (ICProgressIndicatorTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)progressIndicatorShouldAnimate
{
  return self->_progressIndicatorShouldAnimate;
}

- (BOOL)makingProgress
{
  return self->_makingProgress;
}

- (ICSelectorDelayer)progressIndicatorShouldStartDelayer
{
  return self->_progressIndicatorShouldStartDelayer;
}

- (void)setProgressIndicatorShouldStartDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorShouldStartDelayer, a3);
}

- (ICSelectorDelayer)progressIndicatorShouldStopDelayer
{
  return self->_progressIndicatorShouldStopDelayer;
}

- (void)setProgressIndicatorShouldStopDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorShouldStopDelayer, a3);
}

- (NSDate)progressIndicatorStartDate
{
  return self->_progressIndicatorStartDate;
}

- (void)setProgressIndicatorStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorStartDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorStartDate, 0);
  objc_storeStrong((id *)&self->_progressIndicatorShouldStopDelayer, 0);
  objc_storeStrong((id *)&self->_progressIndicatorShouldStartDelayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
