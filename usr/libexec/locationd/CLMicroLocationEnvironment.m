@implementation CLMicroLocationEnvironment

+ (id)shared
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031C3CC;
  block[3] = &unk_10212BB58;
  block[4] = a1;
  if (qword_102301148 != -1)
    dispatch_once(&qword_102301148, block);
  return (id)qword_102301140;
}

- (CLMicroLocationEnvironment)init
{
  CLMicroLocationEnvironment *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationEnvironment;
  result = -[CLMicroLocationEnvironment init](&v3, "init");
  if (result)
    result->_isTestingEnvironment = 0;
  return result;
}

- (BOOL)isTestingEnvironment
{
  if (!self->_isTestingEnvironment)
    return 0;
  sub_100197040();
  return sub_10075D288();
}

- (void)setIsTestingEnvironment:(BOOL)a3
{
  self->_isTestingEnvironment = a3;
}

@end
