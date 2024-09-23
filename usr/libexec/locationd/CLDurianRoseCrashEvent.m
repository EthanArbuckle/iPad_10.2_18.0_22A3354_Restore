@implementation CLDurianRoseCrashEvent

- (CLDurianRoseCrashEvent)init
{
  -[CLDurianRoseCrashEvent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianRoseCrashEvent)initWithData:(id)a3
{
  CLDurianRoseCrashEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLDurianRoseCrashEvent;
  v4 = -[CLDurianRoseCrashEvent init](&v6, "init");
  if (v4)
    v4->_data = (NSData *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianRoseCrashEvent;
  -[CLDurianRoseCrashEvent dealloc](&v3, "dealloc");
}

- (unsigned)core
{
  return 0;
}

- (NSString)crashString
{
  return (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", self->_data, 1);
}

@end
