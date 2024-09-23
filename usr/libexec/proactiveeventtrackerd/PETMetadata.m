@implementation PETMetadata

- (void)setMetadataWithConfigVersion:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  utsname v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSince1970");
  -[PETMetadata setUploadTime:](self, "setUploadTime:", (unint64_t)v6);

  -[PETMetadata setPlatform:](self, "setPlatform:", CFSTR("iOS"));
  memset(&v20, 0, 512);
  if (uname(&v20))
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20.machine));
  -[PETMetadata setDevice:](self, "setDevice:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_PASDeviceState currentOsBuild](_PASDeviceState, "currentOsBuild"));
  -[PETMetadata setBuild:](self, "setBuild:", v8);

  -[PETMetadata setIsInternal:](self, "setIsInternal:", +[_PASDeviceInfo isInternalBuild](_PASDeviceInfo, "isInternalBuild"));
  -[PETMetadata setIsSeed:](self, "setIsSeed:", 0);
  v9 = -[PETMetadata isInternal](self, "isInternal");
  v10 = 0;
  if ((v9 & 1) == 0)
    v10 = -[PETMetadata isSeed](self, "isSeed", 0) ^ 1;
  -[PETMetadata setIsGm:](self, "setIsGm:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PETMetadata getCountryCode](PETMetadata, "getCountryCode"));
  -[PETMetadata setCountry:](self, "setCountry:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", kCFLocaleLanguageCode));
    -[PETMetadata setLanguage:](self, "setLanguage:", v15);

  }
  -[PETMetadata setConfigVersion:](self, "setConfigVersion:", a3);
  v16 = (void *)CFPreferencesCopyAppValue(CFSTR("ExperimentGroup"), CFSTR("com.apple.da"));
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("carry"));

  -[PETMetadata setIsInternalCarry:](self, "setIsInternalCarry:", v17);
  if (-[PETMetadata isInternal](self, "isInternal"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
    -[PETMetadata setUploadIdentifier:](self, "setUploadIdentifier:", v19);

  }
}

+ (id)getCountryCode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "countryCode"));

  return v3;
}

@end
