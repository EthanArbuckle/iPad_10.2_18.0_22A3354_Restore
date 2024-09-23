@implementation CCDDeviceUploadRetrieveSoldToIdsRequest

- (int64_t)requestType
{
  return 2;
}

- (id)httpMethod
{
  return CFSTR("POST");
}

- (id)endpointPath
{
  return CFSTR("/device/upload/getorgsoldtoid");
}

- (id)requestBody
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  void *v7;

  v6 = CFSTR("searchString");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRetrieveSoldToIdsRequest organization](self, "organization"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "orgId"));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

  return v4;
}

- (DEPDeviceUploadOrganization)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
  objc_storeStrong((id *)&self->_organization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organization, 0);
}

@end
