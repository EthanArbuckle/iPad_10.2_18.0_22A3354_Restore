@implementation CCDEnrollmentRetrieveCloudConfigurationRequest

- (int64_t)requestType
{
  return 1;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depConfigurationEnrollmentURLStringWithURLString:](CCDFeatures, "depConfigurationEnrollmentURLStringWithURLString:", CFSTR("https://iprofiles.apple.com/v2/profile"));
}

- (id)requestPayload
{
  return (id)objc_opt_new(CCDProfileConfigurationRequestPayload, a2);
}

@end
