@implementation CCDDeviceUploadRetrieveRequestTypesRequest

- (int64_t)requestType
{
  return 1;
}

- (id)httpMethod
{
  return CFSTR("GET");
}

- (id)endpointPath
{
  return CFSTR("/device/upload/requesttypes");
}

@end
