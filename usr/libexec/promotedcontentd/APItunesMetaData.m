@implementation APItunesMetaData

- (APItunesMetaData)initWithBundleID:(id)a3
{
  id v5;
  APItunesMetaData *v6;
  APItunesMetaData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APItunesMetaData;
  v6 = -[APItunesMetaData init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleID, a3);

  return v7;
}

- (NSString)distributorID
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;

  v3 = objc_alloc((Class)LSApplicationRecord);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
  v13 = 0;
  v5 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v13);
  v6 = v13;

  if (v6)
  {
    v7 = APLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to look up Application Record for %{public}@ due to error: %{public}@", buf, 0x16u);

    }
    v10 = 0;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iTunesMetadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject distributorInfo](v8, "distributorInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "distributorID"));

  }
  return (NSString *)v10;
}

- (BOOL)installedByAppStore
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData distributorID](self, "distributorID"));
  v3 = objc_msgSend(CFSTR("com.apple.AppStore"), "isEqualToString:", v2);

  return v3;
}

- (BOOL)installedAsTestApp
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (-[APItunesMetaData installedByAppStore](self, "installedByAppStore"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData distributorID](self, "distributorID"));

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData distributorID](self, "distributorID"));
  v6 = objc_msgSend(CFSTR("com.apple.TestFlight"), "isEqualToString:", v5);

  return v6;
}

- (BOOL)loadMetaDataWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  void *v9;
  const char *v10;
  unsigned __int8 v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSURL *v22;
  NSURL *bundleURL;
  NSURL *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSNumber *v34;
  NSNumber *adamID;
  NSString *v36;
  NSString *purchaseDate;
  NSString *v38;
  NSString *conversionDate;
  NSString *v40;
  NSString *impressionDate;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v56;
  id v57;
  NSErrorUserInfoKey v58;
  const __CFString *v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  void *v63;

  if (-[APItunesMetaData installedAsTestApp](self, "installedAsTestApp"))
  {
    v5 = APLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData distributorID](self, "distributorID"));
      *(_DWORD *)buf = 138543619;
      v61 = v8;
      v62 = 2113;
      v63 = v9;
      v10 = "%{public}@ App was installed as a test app: %{private}@";
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v10, buf, 0x16u);

LABEL_34:
    }
  }
  else
  {
    v11 = -[APItunesMetaData installedByAppStore](self, "installedByAppStore");
    v12 = APLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue(v12);
    v13 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if ((v11 & 1) != 0)
    {
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
        *(_DWORD *)buf = 138543362;
        v61 = v14;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@ App is from App Store", buf, 0xCu);

      }
      v15 = objc_alloc((Class)LSApplicationRecord);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
      v57 = 0;
      v8 = objc_msgSend(v15, "initWithBundleIdentifier:allowPlaceholder:error:", v16, 0, &v57);
      v6 = v57;

      if (v6)
      {
        v17 = APLogForCategory(4);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v6, "localizedDescription"));
          *(_DWORD *)buf = 138543618;
          v61 = v19;
          v62 = 2114;
          v63 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not find bundle URL from bundle ID %{public}@, error %{public}@", buf, 0x16u);

        }
        if (a3)
        {
          v58 = NSLocalizedDescriptionKey;
          v59 = CFSTR("Could not find bundle URL");
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.itunesMetaData"), 3, v21));

        }
      }
      v22 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleContainerURL"));
      bundleURL = self->_bundleURL;
      self->_bundleURL = v22;

      v24 = self->_bundleURL;
      if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
      {
        v25 = objc_msgSend(objc_alloc((Class)APSettingsStorageUserDefaults), "initWithDefaultValues:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKey:", CFSTR("APAttribution.itunesMetadataFileUrl")));
        if (v26)
        {
          v27 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v26));

          v24 = (NSURL *)v27;
        }

      }
      v28 = APLogForCategory(4);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](v24, "absoluteString"));
        *(_DWORD *)buf = 138477827;
        v61 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Loading meta data from %{private}@", buf, 0xCu);

      }
      if (v24)
      {
        v56 = v6;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIStoreMetadata metadataForBundleContainerURL:error:](MIStoreMetadata, "metadataForBundleContainerURL:error:", v24, &v56));
        v32 = v56;

        if (v31)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "iAdAttribution"));
          self->_isAttributed = objc_msgSend(v33, "BOOLValue");

          v34 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "itemID"));
          adamID = self->_adamID;
          self->_adamID = v34;

          v36 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "purchaseDate"));
          purchaseDate = self->_purchaseDate;
          self->_purchaseDate = v36;

          v38 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "iAdConversionDate"));
          conversionDate = self->_conversionDate;
          self->_conversionDate = v38;

          v40 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "iAdImpressionDate"));
          impressionDate = self->_impressionDate;
          self->_impressionDate = v40;

          v7 = 1;
          if (self->_conversionDate)
            self->_isAttributed = 1;
        }
        else
        {
          v47 = APLogForCategory(4);
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v32, "localizedDescription"));
            *(_DWORD *)buf = 138412546;
            v61 = v49;
            v62 = 2112;
            v63 = v50;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Error loading the itunesMetadata file %@, %@", buf, 0x16u);

          }
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v32, "localizedDescription"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error loading the itunesMetadata file %@, %@"), v51, v52));
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userInfo](v32, "userInfo"));
          CreateDiagnosticReport(v53, v54, CFSTR("com.apple.ap.itunesMetaData"));

          v7 = 0;
        }
        v6 = v32;
      }
      else
      {
        v42 = APLogForCategory(4);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
          *(_DWORD *)buf = 138412290;
          v61 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Meta data URL is nil for %@", buf, 0xCu);

        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Meta data URL is nil for %@"), v31));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userInfo](v6, "userInfo"));
        CreateDiagnosticReport(v45, v46, CFSTR("com.apple.ap.itunesMetaData"));

        v7 = 0;
      }

      goto LABEL_34;
    }
    if (v13)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[APItunesMetaData bundleID](self, "bundleID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[APItunesMetaData distributorID](self, "distributorID"));
      *(_DWORD *)buf = 138543619;
      v61 = v8;
      v62 = 2113;
      v63 = v9;
      v10 = "%{public}@ App is not from App Store: %{private}@";
      v7 = 1;
      goto LABEL_24;
    }
    v7 = 1;
  }

  return v7;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (BOOL)isAttributed
{
  return self->_isAttributed;
}

- (NSString)conversionDate
{
  return self->_conversionDate;
}

- (NSString)impressionDate
{
  return self->_impressionDate;
}

- (NSString)purchaseDate
{
  return self->_purchaseDate;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_impressionDate, 0);
  objc_storeStrong((id *)&self->_conversionDate, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
