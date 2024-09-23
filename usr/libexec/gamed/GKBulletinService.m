@implementation GKBulletinService

- (BOOL)requiresAuthentication
{
  return 0;
}

+ (unint64_t)requiredEntitlements
{
  return 1;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKBulletinServiceInterface, a2);
}

- (void)sendRefreshContentsForDataTypeToAllClientProxy:(unsigned int)a3
{
  _QWORD v3[4];
  unsigned int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016F68;
  v3[3] = &unk_1002BB778;
  v4 = a3;
  +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v3);
}

@end
