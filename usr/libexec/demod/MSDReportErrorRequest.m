@implementation MSDReportErrorRequest

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDReportErrorRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportErrorRequest error](self, "error"));
  v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[4];

  v13[0] = CFSTR("ErrorCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportErrorRequest error](self, "error"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "code")));
  v14[0] = v4;
  v13[1] = CFSTR("ErrorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportErrorRequest error](self, "error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v14[1] = v6;
  v13[2] = NSLocalizedDescriptionKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportErrorRequest error](self, "error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
  v14[2] = v8;
  v13[3] = CFSTR("UniqueDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v14[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "convertToNSData"));
  return v11;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
