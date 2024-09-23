@implementation CRCFactoryHelper

- (CRCFactoryHelper)init
{
  CRCFactoryHelper *v2;
  CRCFactoryHelper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRCFactoryHelper;
  v2 = -[CoreRepairHelper init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CoreRepairHelper setFactoryServiceOn:](v2, "setFactoryServiceOn:", 1);
  return v3;
}

+ (id)sharedInstance
{
  if (qword_100066838 != -1)
    dispatch_once(&qword_100066838, &stru_100050BF0);
  return (id)qword_100066830;
}

@end
