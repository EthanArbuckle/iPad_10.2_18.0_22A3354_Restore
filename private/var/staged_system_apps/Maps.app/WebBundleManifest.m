@implementation WebBundleManifest

- (WebBundleManifest)initWithVersion:(id)a3 files:(id)a4
{
  id v6;
  id v7;
  WebBundleManifest *v8;
  WebBundleManifest *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WebBundleManifest;
  v8 = -[WebBundleManifest init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[WebBundleManifest setVersion:](v8, "setVersion:", v6);
    -[WebBundleManifest setFiles:](v9, "setFiles:", v7);
  }

  return v9;
}

- (WebBundleManifest)initWithCoder:(id)a3
{
  id v4;
  WebBundleManifest *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WebBundleManifest;
  v5 = -[WebBundleManifest init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("WebBundleManifestVersionKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[WebBundleManifest setVersion:](v5, "setVersion:", v7);

    v8 = objc_opt_class(NSSet);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(WebBundleFile), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("WebBundleManifestFilesKey")));
    -[WebBundleManifest setFiles:](v5, "setFiles:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", version, CFSTR("WebBundleManifestVersionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_files, CFSTR("WebBundleManifestFilesKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManifest version](self, "version"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManifest files](self, "files"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  WebBundleManifest *v4;
  WebBundleManifest *v5;
  uint64_t v6;
  WebBundleManifest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = (WebBundleManifest *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManifest version](v7, "version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManifest version](self, "version"));
    if (v8 == v9 || objc_msgSend(v8, "isEqual:", v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManifest files](v7, "files"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManifest files](self, "files"));
      if (v10 == v11)
        v12 = 1;
      else
        v12 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSSet)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
