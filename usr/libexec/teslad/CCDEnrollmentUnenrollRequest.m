@implementation CCDEnrollmentUnenrollRequest

- (int64_t)requestType
{
  return 3;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depRemoveEnrollmentURLStringWithURLString:](CCDFeatures, "depRemoveEnrollmentURLStringWithURLString:", CFSTR("https://iprofiles.apple.com/v2/unenroll"));
}

- (id)requestPayload
{
  return (id)objc_opt_new(CCDUnenrollRequestPayload, a2);
}

@end
