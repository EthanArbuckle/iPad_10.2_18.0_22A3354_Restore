@implementation CLAmbientLightDecisionTreeHelper

- (CLAmbientLightDecisionTreeHelper)initWithQueue:(id)a3 decisionTreeObj:(void *)a4
{
  CLAmbientLightDecisionTreeHelper *v6;
  uint64_t v7;
  __IOHIDEventSystemClient *hidClientRef;
  _QWORD v10[5];
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v11.receiver = self;
  v11.super_class = (Class)CLAmbientLightDecisionTreeHelper;
  v6 = -[CLAmbientLightDecisionTreeHelper init](&v11, "init");
  if (v6)
  {
    v7 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
    v6->_hidClientRef = (__IOHIDEventSystemClient *)v7;
    v6->_hidEventQueue = (OS_dispatch_queue *)a3;
    v6->_fAmbientLightDecisionTree = a4;
    if (v7)
    {
      v12[0] = CFSTR("PrimaryUsagePage");
      v12[1] = CFSTR("PrimaryUsage");
      v13[0] = &off_10221BDF8;
      v13[1] = &off_10221BE10;
      IOHIDEventSystemClientSetMatching(v7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
      IOHIDEventSystemClientScheduleWithDispatchQueue(v6->_hidClientRef, v6->_hidEventQueue);
      hidClientRef = v6->_hidClientRef;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000920B4;
      v10[3] = &unk_10217AFB8;
      v10[4] = v6;
      IOHIDEventSystemClientRegisterEventBlock(hidClientRef, v10, 0, 0);
    }
  }
  return v6;
}

- (void)shutdown
{
  __IOHIDEventSystemClient *hidClientRef;
  __IOHIDEventSystemClient **p_hidClientRef;

  p_hidClientRef = &self->_hidClientRef;
  hidClientRef = self->_hidClientRef;
  if (hidClientRef)
  {
    IOHIDEventSystemClientUnscheduleFromDispatchQueue(hidClientRef, self->_hidEventQueue);
    CFRelease(self->_hidClientRef);
    *p_hidClientRef = 0;
    p_hidClientRef[1] = 0;
  }
  self->_fAmbientLightDecisionTree = 0;
}

- (void)fAmbientLightDecisionTree
{
  return self->_fAmbientLightDecisionTree;
}

@end
