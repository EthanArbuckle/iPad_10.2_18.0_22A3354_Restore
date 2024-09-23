@implementation MSDFMHSessionTaskInfo

- (BOOL)addAuthHeader
{
  MSDFMHSessionTaskInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  objc_super v12;

  v2 = self;
  if (!-[MSDFMHSessionTaskInfo useBAAAuthentication](self, "useBAAAuthentication"))
  {
    v12.receiver = v2;
    v12.super_class = (Class)MSDFMHSessionTaskInfo;
    LOBYTE(v2) = -[MSDHubSessionTaskInfo addAuthHeader](&v12, "addAuthHeader");
    return (char)v2;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBAAInterface sharedInstance](MSDBAAInterface, "sharedInstance"));
  if ((objc_msgSend(v3, "generateBAACertficate:", 0) & 1) == 0)
  {
    v8 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000BE0EC();
    LOBYTE(v2) = 0;
    goto LABEL_15;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](v2, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo postData](v2, "postData"));
  v11 = 0;
  LODWORD(v2) = objc_msgSend(v3, "addBAAAuthenticationHeadersToRequest:withBody:error:", v4, v5, &v11);
  v6 = v11;

  if (!(_DWORD)v2 || v6)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BE088();

LABEL_15:
    goto LABEL_6;
  }
  LOBYTE(v2) = 1;
LABEL_6:

  return (char)v2;
}

- (NSURL)fmhURLOverride
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFmhURLOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)useBAAAuthentication
{
  return self->_useBAAAuthentication;
}

- (void)setUseBAAAuthentication:(BOOL)a3
{
  self->_useBAAAuthentication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmhURLOverride, 0);
}

@end
