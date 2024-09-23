@implementation CLMotionCuesServiceAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_1023016E8 != -1)
    dispatch_once(&qword_1023016E8, &stru_102140EC8);
  return (id)qword_1023016E0;
}

- (CLMotionCuesServiceAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMotionCuesServiceAdapter;
  return -[CLMotionCuesServiceAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMotionCuesServiceProtocol, &OBJC_PROTOCOL___CLMotionCuesServiceClientProtocol);
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)beginService
{
  -[CLMotionCuesServiceAdapter universe](self, "universe");
  operator new();
}

- (void)endService
{
  sub_100511010((uint64_t **)&self->_motionCuesService, 0);
}

- (void).cxx_destruct
{
  sub_100511010((uint64_t **)&self->_motionCuesService, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
