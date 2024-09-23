@implementation MSDNotDemoRequest

- (MSDNotDemoRequest)init
{
  MSDNotDemoRequest *v2;
  MSDNotDemoRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDNotDemoRequest;
  v2 = -[MSDDemoUnitServerRequest init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MSDDemoUnitServerRequest setUseBAAAuthentication:](v2, "setUseBAAAuthentication:", 1);
  return v3;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDNotDemoRequest;
  if (!-[MSDDemoUnitServerRequest isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNotDemoRequest serialNumber](self, "serialNumber"));
  v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  void *v7;

  v6 = CFSTR("serial_number");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNotDemoRequest serialNumber](self, "serialNumber"));
  v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "convertToNSData"));
  return v4;
}

- (id)getUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/api/device/1/%@/mark_as_not_demo"), v2));

  return v3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
