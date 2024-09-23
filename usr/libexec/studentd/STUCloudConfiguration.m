@implementation STUCloudConfiguration

+ (STUCloudConfiguration)sharedConfiguration
{
  if (qword_1000FC360 != -1)
    dispatch_once(&qword_1000FC360, &stru_1000CAB40);
  return (STUCloudConfiguration *)(id)qword_1000FC368;
}

- (BOOL)isEphemeralMultiUser
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo"));
  v3 = objc_msgSend(v2, "isEphemeralMultiUser");

  return v3;
}

- (BOOL)isEDUPayloadInstalled
{
  return 0;
}

- (BOOL)isSupervised
{
  return self->_supervised;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (BOOL)EDUPayloadInstalledByUserEnrollment
{
  return self->_EDUPayloadInstalledByUserEnrollment;
}

- (void)setEDUPayloadInstalledByUserEnrollment:(BOOL)a3
{
  self->_EDUPayloadInstalledByUserEnrollment = a3;
}

@end
