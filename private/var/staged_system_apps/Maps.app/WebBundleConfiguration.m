@implementation WebBundleConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self, "webBundleDirectory"));
  objc_msgSend(v4, "setWebBundleDirectory:", v5);

  return v4;
}

- (WebBundleConfiguration)initWithCoder:(id)a3
{
  id v4;
  WebBundleConfiguration *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WebBundleConfiguration;
  v5 = -[WebBundleConfiguration init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("WebBundleConfigurationDirectory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[WebBundleConfiguration setWebBundleDirectory:](v5, "setWebBundleDirectory:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self, "webBundleDirectory"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WebBundleConfigurationDirectory"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self, "webBundleDirectory"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  WebBundleConfiguration *v4;
  WebBundleConfiguration *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (WebBundleConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](v5, "webBundleDirectory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self, "webBundleDirectory"));
    if (v7 == v8)
      v9 = 1;
    else
      v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)rootDirectory
{
  return (NSString *)&stru_1011EB268;
}

- (NSString)messageHandlerName
{
  return (NSString *)&stru_1011EB268;
}

- (NSString)urlScheme
{
  return (NSString *)&stru_1011EB268;
}

- (NSURL)entryPointUrl
{
  return 0;
}

- (NSURL)entryPointUrlBase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration urlScheme](self, "urlScheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration rootDirectory](self, "rootDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@/"), v3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

  return (NSURL *)v6;
}

- (NSURL)serverURL
{
  return 0;
}

- (NSURL)debugOverrideServerURL
{
  return 0;
}

- (NSString)manifestSignedResourceName
{
  return 0;
}

- (NSString)manifestKey
{
  return 0;
}

- (NSURL)webBundleDirectory
{
  NSURL *v3;
  NSURL *webBundleDirectory;
  NSURL *v5;

  if (!self->_webBundleDirectory)
  {
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteBuiltInWebBundleDirectory](self, "absoluteBuiltInWebBundleDirectory"));
    webBundleDirectory = self->_webBundleDirectory;
    self->_webBundleDirectory = v3;

  }
  if (-[WebBundleConfiguration temporarilyUseOnDeviceDirectory](self, "temporarilyUseOnDeviceDirectory"))
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteCachedWebBundleDirectory](self, "absoluteCachedWebBundleDirectory"));
  else
    v5 = self->_webBundleDirectory;
  return v5;
}

- (NSURL)absoluteCachedWebBundleDirectory
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration onDeviceDirectoryWritable](self, "onDeviceDirectoryWritable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration directoryForNewWebBundleName:](self, "directoryForNewWebBundleName:", v3));

  return (NSURL *)v4;
}

- (NSURL)absoluteBuiltInWebBundleDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathForResource:ofType:inDirectory:", CFSTR("index"), CFSTR("html"), CFSTR("OnDeviceWebBundle")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByDeletingLastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  return (NSURL *)v5;
}

- (id)_webBundleConfigurationStorageDirectory
{
  NSString *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library/Caches")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  return v5;
}

- (id)directoryForNewWebBundleName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration _webBundleConfigurationStorageDirectory](self, "_webBundleConfigurationStorageDirectory"));
  v13 = 0;
  objc_msgSend(v5, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, &v13);
  v6 = v13;
  if (v6)
  {
    v7 = sub_10043292C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Marking directory as excluded from backup error: %@", buf, 0xCu);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration rootDirectory](self, "rootDirectory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", v4));
  return v11;
}

- (NSString)onDeviceDirectory
{
  return self->_onDeviceDirectory;
}

- (NSString)onDeviceDirectoryWritable
{
  return self->_onDeviceDirectoryWritable;
}

- (void)setWebBundleDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_webBundleDirectory, a3);
}

- (BOOL)temporarilyUseOnDeviceDirectory
{
  return self->_temporarilyUseOnDeviceDirectory;
}

- (void)setTemporarilyUseOnDeviceDirectory:(BOOL)a3
{
  self->_temporarilyUseOnDeviceDirectory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webBundleDirectory, 0);
  objc_storeStrong((id *)&self->_onDeviceDirectoryWritable, 0);
  objc_storeStrong((id *)&self->_onDeviceDirectory, 0);
}

@end
