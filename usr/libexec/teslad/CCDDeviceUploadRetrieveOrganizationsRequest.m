@implementation CCDDeviceUploadRetrieveOrganizationsRequest

- (int64_t)requestType
{
  return 0;
}

- (id)httpMethod
{
  return CFSTR("GET");
}

- (id)endpointPath
{
  return CFSTR("/device/upload/orgs");
}

@end
