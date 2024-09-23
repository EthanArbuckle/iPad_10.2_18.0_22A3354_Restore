@implementation CLDeviceProximityHelper

+ (int)convertPocketStateToDeviceProximity:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

- (CLDeviceProximityHelper)initWithOwnerClass:(void *)a3
{
  CLDeviceProximityHelper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLDeviceProximityHelper;
  v4 = -[CLDeviceProximityHelper init](&v6, "init");
  if (v4)
  {
    v4->_fPocketStateManager = objc_opt_new(CMPocketStateManager);
    v4->_fDeviceProximity = a3;
  }
  return v4;
}

- (void)queryForProximity:(id)a3 monitorInterval:(double)a4 withTimeout:(double)a5
{
  CMPocketStateManager *fPocketStateManager;
  _QWORD v7[5];

  fPocketStateManager = self->_fPocketStateManager;
  if (fPocketStateManager)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10097974C;
    v7[3] = &unk_102161028;
    v7[4] = self;
    -[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:](fPocketStateManager, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", a3, v7, a4, a5);
  }
}

- (void)invalidate
{
  CMPocketStateManager *fPocketStateManager;
  CMPocketStateManager **p_fPocketStateManager;

  p_fPocketStateManager = &self->_fPocketStateManager;
  fPocketStateManager = self->_fPocketStateManager;
  if (fPocketStateManager)
  {

    *p_fPocketStateManager = 0;
    p_fPocketStateManager[1] = 0;
  }
}

- (CMPocketStateManager)fPocketStateManager
{
  return self->_fPocketStateManager;
}

- (void)fDeviceProximity
{
  return self->_fDeviceProximity;
}

@end
