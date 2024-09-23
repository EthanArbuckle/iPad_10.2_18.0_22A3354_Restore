@implementation WRM_Timer

- (WRM_Timer)initWithFireTimeIntervalSinceNow:(double)a3 queue:(id)a4 block:(id)a5
{
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD handler[6];
  objc_super v16;

  if (!a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WRM_Timer.m"), 12, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != NULL"));
  v16.receiver = self;
  v16.super_class = (Class)WRM_Timer;
  v10 = -[WRM_Timer init](&v16, "init");
  if (v10)
  {
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)a4);
    *((_QWORD *)v10 + 1) = v11;
    if (!v11)
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("WRM_Timer.m"), 17, CFSTR("Cannot create dispatch timer"));
      v11 = *((_QWORD *)v10 + 1);
    }
    v12 = dispatch_walltime(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v13 = *((_QWORD *)v10 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005FFF8;
    handler[3] = &unk_100202D60;
    handler[4] = v10;
    handler[5] = a5;
    dispatch_source_set_event_handler(v13, handler);
    *((_DWORD *)v10 + 4) = 1;
    dispatch_resume(*((dispatch_object_t *)v10 + 1));
  }
  return (WRM_Timer *)v10;
}

- (void)dealloc
{
  objc_super v3;

  -[WRM_Timer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WRM_Timer;
  -[WRM_Timer dealloc](&v3, "dealloc");
}

- (BOOL)isValid
{
  return self->_valid != 0;
}

- (void)invalidate
{
  int *p_valid;
  unsigned int v4;
  NSObject *source;

  p_valid = &self->_valid;
  while (1)
  {
    v4 = __ldxr((unsigned int *)p_valid);
    if (v4 != 1)
      break;
    if (!__stxr(0, (unsigned int *)p_valid))
    {
      dispatch_source_cancel((dispatch_source_t)self->_source);
      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:
  source = self->_source;
  if (source)
  {
    dispatch_release(source);
    self->_source = 0;
  }
}

+ (unint64_t)getTimeStamp
{
  timeval v3;

  v3.tv_sec = 0;
  *(_QWORD *)&v3.tv_usec = 0;
  gettimeofday(&v3, 0);
  return 1000 * v3.tv_sec + v3.tv_usec / 0x3E8uLL;
}

@end
