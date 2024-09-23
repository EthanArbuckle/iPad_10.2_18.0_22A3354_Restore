@implementation MSDReportDoneRequest

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDReportDoneRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest requestStr](self, "requestStr"));
  v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest requestStr](self, "requestStr"));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("RequestOperation"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("UniqueDeviceID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest error](self, "error"));
  if (v6)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest error](self, "error"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08llX"), objc_msgSend(v8, "code")));
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("ErrorCode"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest error](self, "error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("ErrorDomain"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest error](self, "error"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
    objc_msgSend(v7, "setObject:forKey:", v13, NSLocalizedDescriptionKey);

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("Error"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "convertToNSData"));

  return v14;
}

- (NSString)requestStr
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestStr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_requestStr, 0);
}

@end
