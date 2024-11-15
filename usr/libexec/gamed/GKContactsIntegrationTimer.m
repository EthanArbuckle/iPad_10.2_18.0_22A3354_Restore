@implementation GKContactsIntegrationTimer

- (void)startWithStartTime:(unint64_t)a3 updateInterval:(double)a4 queue:(id)a5 updateBlock:(id)a6 cancelBlock:(id)a7
{
  NSObject *v12;
  id v13;
  id v14;
  NSObject *timer;
  OS_dispatch_source *v16;
  OS_dispatch_source *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD handler[4];
  id v25;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  v16 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);
  v17 = self->_timer;
  self->_timer = v16;

  dispatch_source_set_timer((dispatch_source_t)self->_timer, a3, (unint64_t)a4, 0x3B9ACA00uLL);
  v18 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100133AE0;
  handler[3] = &unk_1002BB540;
  v25 = v13;
  v19 = v13;
  dispatch_source_set_event_handler(v18, handler);
  v20 = self->_timer;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100133AEC;
  v22[3] = &unk_1002BB540;
  v23 = v14;
  v21 = v14;
  dispatch_source_set_cancel_handler(v20, v22);
  dispatch_resume((dispatch_object_t)self->_timer);

}

- (void)cancel
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationTimer timer](self, "timer"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationTimer timer](self, "timer"));
    dispatch_source_cancel(v4);

  }
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
