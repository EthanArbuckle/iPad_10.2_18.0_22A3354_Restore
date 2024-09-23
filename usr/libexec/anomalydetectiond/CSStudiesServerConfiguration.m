@implementation CSStudiesServerConfiguration

- (CSStudiesServerConfiguration)initWithServer:(id)a3 certificate:(id)a4 study:(id)a5 andAuthorizationID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CSStudiesServerConfiguration *v15;
  CSStudiesServerConfiguration *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSStudiesServerConfiguration;
  v15 = -[CSStudiesServerConfiguration init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_server, a3);
    objc_storeStrong((id *)&v16->_certificate, a4);
    objc_storeStrong((id *)&v16->_studyUUID, a5);
    objc_storeStrong((id *)&v16->_auth, a6);
  }

  return v16;
}

+ (id)persistentConfiguration
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("hdsEndpointName")));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("GM")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration kappaGMConfiguration](CSStudiesServerConfiguration, "kappaGMConfiguration"));
LABEL_9:
    v5 = (void *)v4;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Internal")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration kappaInternalConfiguration](CSStudiesServerConfiguration, "kappaInternalConfiguration"));
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("CMPrototyping")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration kappaCMPrototypingConfiguration](CSStudiesServerConfiguration, "kappaCMPrototypingConfiguration"));
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Staging")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration kappaStagingConfiguration](CSStudiesServerConfiguration, "kappaStagingConfiguration"));
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  if (objc_msgSend(v7, "isInternalInstall"))
    v8 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration kappaInternalConfiguration](CSStudiesServerConfiguration, "kappaInternalConfiguration"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration kappaGMConfiguration](CSStudiesServerConfiguration, "kappaGMConfiguration"));
  v5 = (void *)v8;

LABEL_10:
  return v5;
}

+ (id)persistentConfigurationIgneous
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("hdsEndpointNameIgneous")));
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("GM")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("CMPrototyping")))
    {
      v4 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration igneousCMPrototypingConfiguration](CSStudiesServerConfiguration, "igneousCMPrototypingConfiguration"));
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Staging")))
    {
      v4 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration igneousStagingConfiguration](CSStudiesServerConfiguration, "igneousStagingConfiguration"));
      goto LABEL_7;
    }
  }
  v4 = objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration igneousGMConfiguration](CSStudiesServerConfiguration, "igneousGMConfiguration"));
LABEL_7:
  v5 = (void *)v4;

  return v5;
}

+ (id)kappaGMConfiguration
{
  if (qword_1003892F0 != -1)
    dispatch_once(&qword_1003892F0, &stru_100346FF0);
  return (id)qword_1003892B8;
}

+ (id)kappaInternalConfiguration
{
  if (qword_1003892F8 != -1)
    dispatch_once(&qword_1003892F8, &stru_100347010);
  return (id)qword_1003892C0;
}

+ (id)kappaCMPrototypingConfiguration
{
  if (qword_100389300 != -1)
    dispatch_once(&qword_100389300, &stru_100347030);
  return (id)qword_1003892C8;
}

+ (id)kappaStagingConfiguration
{
  if (qword_100389308 != -1)
    dispatch_once(&qword_100389308, &stru_100347050);
  return (id)qword_1003892D0;
}

+ (id)igneousCMPrototypingConfiguration
{
  if (qword_100389310 != -1)
    dispatch_once(&qword_100389310, &stru_100347070);
  return (id)qword_1003892D8;
}

+ (id)igneousStagingConfiguration
{
  if (qword_100389318 != -1)
    dispatch_once(&qword_100389318, &stru_100347090);
  return (id)qword_1003892E0;
}

+ (id)igneousGMConfiguration
{
  if (qword_100389320 != -1)
    dispatch_once(&qword_100389320, &stru_1003470B0);
  return (id)qword_1003892E8;
}

- (NSString)server
{
  return self->_server;
}

- (NSString)certificate
{
  return self->_certificate;
}

- (NSUUID)studyUUID
{
  return self->_studyUUID;
}

- (NSString)auth
{
  return self->_auth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auth, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
