@implementation CLBackgroundInertialOdometryClientSession

- (CLBackgroundInertialOdometryClientSession)initWithClient:(id)a3 withIdentifier:(id)a4 usingReferenceFrame:(unint64_t)a5 atMachContinuousTime:(double)a6
{
  CLBackgroundInertialOdometryClientSession *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLBackgroundInertialOdometryClientSession;
  v10 = -[CLBackgroundInertialOdometryClientSession init](&v12, "init");
  if (v10)
  {
    v10->_client = (CLBackgroundInertialOdometryServiceClientProtocol *)a3;
    v10->_identifier = (NSString *)objc_msgSend(a4, "copy");
    v10->_referenceFrame = a5;
    v10->_sessionStartTime = a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_client = 0;
  self->_identifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBackgroundInertialOdometryClientSession;
  -[CLBackgroundInertialOdometryClientSession dealloc](&v3, "dealloc");
}

- (CLBackgroundInertialOdometryServiceClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
