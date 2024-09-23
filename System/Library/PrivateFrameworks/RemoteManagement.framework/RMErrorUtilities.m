@implementation RMErrorUtilities

+ (id)createErrorWithCode:(int64_t)a3 userInfo:(id)a4 descriptionKey:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v9;

  objc_msgSend(a1, "_populateDescriptionInUserInfo:descriptionKey:arguments:", a4, a5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("RMErrorDomain"), a3, v6);

  return v7;
}

+ (id)_populateDescriptionInUserInfo:(id)a3 descriptionKey:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "_populateDescriptionInUserInfo:descriptionKey:arguments:", a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_populateDescriptionInUserInfo:(id)a3 descriptionKey:(id)a4 arguments:(char *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char *v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v28 = a5;
  objc_msgSend(a1, "_localizedDescriptionFormatWithKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_englishDescriptionFormatWithKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)MEMORY[0x24BDD17C8];
  v13 = v10;
  v14 = [v12 alloc];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:locale:arguments:", v13, v15, v28);

  v17 = getEnglishDescription_onceToken;
  v18 = v11;
  if (v17 != -1)
    dispatch_once(&getEnglishDescription_onceToken, &__block_literal_global_7);
  v19 = objc_alloc(MEMORY[0x24BDD17C8]);
  v20 = (void *)objc_msgSend(v19, "initWithFormat:locale:arguments:", v18, getEnglishDescription_enUSPosixLocale, v28);

  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_%@"), &stru_24D968E30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDBCED8];
  v23 = *MEMORY[0x24BDD0BA0];
  v29[0] = *MEMORY[0x24BDD0FC8];
  v29[1] = v23;
  v30[0] = v16;
  v30[1] = v20;
  v29[2] = CFSTR("RMErrorUserInfoKeyDescriptionKey");
  v30[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithDictionary:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v25, "setValuesForKeysWithDictionary:", v8);
  v26 = (void *)objc_msgSend(v25, "copy", v28, v28);

  return v26;
}

+ (id)_localizedDescriptionFormatWithKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[RMBundle remoteManagementBundle](RMBundle, "remoteManagementBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24D968E30, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_englishDescriptionFormatWithKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[RMBundle remoteManagementBundle](RMBundle, "remoteManagementBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:localization:", v3, &stru_24D968E30, 0, CFSTR("en"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)createAccountAlreadyExistsErrorWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 205, 0, CFSTR("Error.AccountAlreadyExists_%@"), a3);
}

+ (id)createAccountMissingErrorWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 217, 0, CFSTR("Error.AccountMissing_%@"), a3);
}

+ (id)createAlreadyEnrolledInMDMv1Error
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 213, 0, CFSTR("Error.AlreadyEnrolledInMDMv1"));
}

+ (id)createAssetCannotBeDownloadedErrorWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2200, v6, CFSTR("Error.AssetCannotBeDownloaded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2200, 0, CFSTR("Error.AssetCannotBeDownloaded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)createAssetContentTypeCannotBeVerifiedError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2201, 0, CFSTR("Error.AssetContentTypeCannotBeVerified"));
}

+ (id)createAssetSizeCannotBeVerifiedError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2202, 0, CFSTR("Error.AssetSizeCannotBeVerified"));
}

+ (id)createAssetHashCannotBeVerifiedError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2203, 0, CFSTR("Error.AssetHashCannotBeVerified"));
}

+ (id)createAssetCannotProcessFileErrorWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2204, v6, CFSTR("Error.AssetCannotProcessFile"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2204, 0, CFSTR("Error.AssetCannotProcessFile"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)createAssetInvalidError:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2205, 0, CFSTR("Error.AssetInvalid_%@"), a3);
}

+ (id)createAssetTypeInvalidError:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2207, 0, CFSTR("Error.AssetTypeInvalid_%@"), a3);
}

+ (id)createAssetInvalidURLError:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2206, 0, CFSTR("Error.AssetInvalidURL_%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)createBootstrapURINotFound
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 207, 0, CFSTR("Error.BootstrapURINotFound"));
}

+ (id)createCannotChangeValueErrorForPropertyNamed:(id)a3 onObject:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0B88];
  v15 = *MEMORY[0x24BDBB5A8];
  v16 = a4;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_populateDescriptionInUserInfo:descriptionKey:", v11, CFSTR("Error.CannotChangeValue_%@"), v10, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 1550, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)createCMSDecodeErrorWithStatusCode:(int)a3 reason:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v4 = *(_QWORD *)&a3;
  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("RMCMSDecodeStatusCodeKey");
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = *MEMORY[0x24BDD0FD8];
  v14[0] = v8;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 102, v9, CFSTR("Error.CMSDecodeError_%@"), v10, v13[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)createConnectionNotEntitledWithName:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2, 0, CFSTR("Error.ConnectionNotEntitled_%@"), a3);
}

+ (id)createCouldNotInstallApp
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 3000, 0, CFSTR("Error.CouldNotInstallApp"));
}

+ (id)createCouldNotInstallAppWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 3000, v6, CFSTR("Error.CouldNotInstallApp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 3000, 0, CFSTR("Error.CouldNotInstallApp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)createCouldNotParseURLErrorWithString:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 210, 0, CFSTR("Error.CouldNotParseURL_%@"), a3);
}

+ (id)createDeclarationNotFoundErrorWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 216, 0, CFSTR("Error.DeclarationNotFound_%@"), a3);
}

+ (id)createDeviceIdentityNotFoundError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 100, 0, CFSTR("Error.DeviceIdentityNotFound"));
}

+ (id)createDisallowedStatusValueErrorWithKeyPath:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2001, 0, CFSTR("Error.DisallowedStatusValue_%@"), a3);
}

+ (id)createFeatureDisabledError:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 4, 0, CFSTR("Error.FeatureDisabled_%@"), a3);
}

+ (id)createHTTPErrorWithStatusCode:(int64_t)a3 reason:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("RMHTTPStatusCodeKey");
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = *MEMORY[0x24BDD0FD8];
  v14[0] = v8;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1000, v9, CFSTR("Error.HTTPStatus_%@"), v10, v13[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)createIncorrectPayloadTypeErrorWithExpectedType:(id)a3 actualType:(id)a4
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 204, 0, CFSTR("Error.IncorrectPayloadType_%@_%@"), a3, a4);
}

+ (id)createInternalError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 0, 0, CFSTR("Error.Internal"));
}

+ (id)createInternalErrorWithDescription:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 0, 0, CFSTR("Error.Internal_%@"), a3);
}

+ (id)createInternalErrorWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 0, v6, CFSTR("Error.Internal"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 0, 0, CFSTR("Error.Internal"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)createInvalidPasscodeError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 215, 0, CFSTR("Error.InvalidPasscode"));
}

+ (id)createInvalidStatusValueErrorWithKeyPath:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2002, 0, CFSTR("Error.InvalidStatusValue_%@"), a3);
}

+ (id)createLicenseNotFound
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 3001, 0, CFSTR("Error.LicenseNotFound"));
}

+ (id)createManagementSourceNotFoundErrorWithAccountIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 200, 0, CFSTR("Error.ManagementSourceForAccountNotFound_%@"), a3);
}

+ (id)createManagementSourceNotFoundErrorWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 200, 0, CFSTR("Error.ManagementSourceNotFound_%@"), a3);
}

+ (id)createManagementSourceAlreadyExistsErrorWithAccountIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 201, 0, CFSTR("Error.ManagementSourceAlreadyExists_%@"), a3);
}

+ (id)createManagementSourceAlreadyExistsErrorWithURI:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 201, 0, CFSTR("Error.ManagementSourceAlreadyExists_%@"), a3);
}

+ (id)createMDMRequestFailed:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1100, 0, CFSTR("Error.MDMRequestFailed_%@"), a3);
}

+ (id)createMDMRequestInvalid:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1101, 0, CFSTR("Error.MDMRequestInvalid_%@"), a3);
}

+ (id)createMismatchedValuesErrorForPropertyNamed:(id)a3 onObject:(id)a4 expected:(id)a5 actual:(id)a6
{
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDBB5A0];
  v22 = *MEMORY[0x24BDBB5A8];
  v23 = v10;
  v25 = a4;
  v26 = a3;
  v24 = *MEMORY[0x24BDBB5B0];
  v27 = a5;
  v11 = (void *)MEMORY[0x24BDBCE70];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", &v25, &v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD1540];
  v18 = *MEMORY[0x24BDD0B88];
  objc_msgSend(a1, "_populateDescriptionInUserInfo:descriptionKey:", v16, CFSTR("Error.MismatchedValues_%@_%@_%@"), v15, v13, v12, v22, v23, v24, v25, v26, v27, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 1550, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)createMissingMandatoryPropertyErrorWithPropertyNamed:(id)a3 onObject:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDBB5A0];
  v16 = *MEMORY[0x24BDBB5A8];
  v17 = v6;
  v18 = a4;
  v19 = a3;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", &v18, &v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BDD0B88];
  objc_msgSend(a1, "_populateDescriptionInUserInfo:descriptionKey:", v10, CFSTR("Error.MissingMandatoryProperty_%@"), v9, v16, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1570, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)createMissingReferralURLError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 209, 0, CFSTR("Error.MissingReferralURL"));
}

+ (id)createMissingServerResponseItemErrorWithName:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1003, 0, CFSTR("Error.MissingServerResponseItem_%@"), a3);
}

+ (id)createMobileKeyBagErrorWithCode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("RMMobileKeyBagErrorCodeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 101, v6, CFSTR("Error.MobileKeyBagError_%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)createMultipleErrorOrReturnTheSingleErrorWithErrors:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v10 = *MEMORY[0x24BDBB408];
    v7 = (void *)objc_msgSend(v4, "copy");

    v11[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 3, v8, CFSTR("Error.Multiple"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

+ (id)createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:(id)a3
{
  id v3;
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD0B88];
    v8 = *MEMORY[0x24BDD0BA0];
    v14[0] = CFSTR("Multiple validation errors occurred.");
    v9 = *MEMORY[0x24BDBB408];
    v13[0] = v8;
    v13[1] = v9;
    v10 = (void *)objc_msgSend(v3, "copy");

    v14[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 1560, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
}

+ (id)createNotImplementedErrorForFeature:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1, 0, CFSTR("Error.NotImplemented_%@"), a3);
}

+ (id)createOrganizationProofInvalidError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 206, 0, CFSTR("Error.OrganizationProofInvalid"));
}

+ (id)createProfileCannotBeInstalledBySource:(id)a3 source:(id)a4
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1208, 0, CFSTR("Error.ProfileCannotBeInstalledBySource_%@_%@"), a3, a4);
}

+ (id)createProfileCannotFindRemoveProfile:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1207, 0, CFSTR("Error.ProfileCannotFindRemoveProfile_%@"), a3);
}

+ (id)createProfileCannotRemoveOtherProfile:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1206, 0, CFSTR("Error.ProfileCannotRemoveOtherProfile_%@"), a3);
}

+ (id)createProfileCannotReplaceOtherProfile:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1205, 0, CFSTR("Error.ProfileCannotReplaceOtherProfile_%@"), a3);
}

+ (id)createProfileInvalidErrorWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1200, v6, CFSTR("Error.ProfileInvalid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1200, 0, CFSTR("Error.ProfileInvalid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)createProfilePayloadInvalidKey:(id)a3 key:(id)a4
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1203, 0, CFSTR("Error.ProfilePayloadInvalidKey_%@_%@"), a3, a4);
}

+ (id)createProfilePayloadInvalidKeyItems:(id)a3 key:(id)a4
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1204, 0, CFSTR("Error.ProfilePayloadInvalidKeyItems_%@_%@"), a3, a4);
}

+ (id)createProfilePayloadMissingKey:(id)a3 key:(id)a4
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1202, 0, CFSTR("Error.ProfilePayloadMissingKey_%@_%@"), a3, a4);
}

+ (id)createProfilePayloadNotAllowedErrorWithPayloadType:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1201, 0, CFSTR("Error.ProfilePayloadNotAllowed_%@"), a3);
}

+ (id)createServiceDiscoveryInvalidUserIdentifierWithReason:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 300, 0, CFSTR("Error.ServiceDiscoveryInvalidUserIdentifier_%@"), a3);
}

+ (id)createServiceDiscoveryWellKnownFailedWithReason:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 301, 0, CFSTR("Error.ServiceDiscoveryWellKnownFailed_%@"), a3);
}

+ (id)createServiceDiscoveryWellKnownInvalidWithReason:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 302, 0, CFSTR("Error.ServiceDiscoveryWellKnownInvalid_%@"), a3);
}

+ (id)createStatePreventsSyncingError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 214, 0, CFSTR("Error.StatePreventsSyncing"));
}

+ (id)createTooManyFailedAuthenticationsError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 211, 0, CFSTR("Error.TooManyFailedAuthentications"));
}

+ (id)createTooManyReferralsError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 208, 0, CFSTR("Error.TooManyReferrals"));
}

+ (id)createTooManyDeviceManagementSourcesError
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 202, 0, CFSTR("Error.TooManyDeviceManagementSources"));
}

+ (id)createUnableToEvaluatePredicateErrorWithFormat:(id)a3 reason:(id)a4
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2100, 0, CFSTR("Error.UnableToEvaluatePredicate_%@_%@"), a3, a4);
}

+ (id)createUnableToParsePredicateErrorWithFormat:(id)a3 reason:(id)a4
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2101, 0, CFSTR("Error.UnableToParsePredicate_%@_%@"), a3, a4);
}

+ (id)createUnableToParsePredicateErrorWithCustomOperator:(id)a3 predicateFormat:(id)a4
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2102, 0, CFSTR("Error.UnableToParsePredicateWithCustomOperator_%@_%@"), a4, a3);
}

+ (id)createUnhandledContentTypeErrorWithContentType:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1001, 0, CFSTR("Error.UnhandledContentType_%@"), a3);
}

+ (id)createUnsupportedAuthenticationSchemeErrorWithScheme:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 212, 0, CFSTR("Error.UnsupportedAuthenticationScheme_%@"), a3);
}

+ (id)createUnsupportedStatusValueErrorWithKeyPath:(id)a3
{
  return (id)objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 2000, 0, CFSTR("Error.UnsupportedStatusValue_%@"), a3);
}

+ (id)createUnverifiedDownloadHashErrorWithURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1004, 0, CFSTR("Error.UnverifiedDownloadHash_%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)createUnverifiedDownloadSizeErrorWithURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:userInfo:descriptionKey:", 1005, 0, CFSTR("Error.UnverifiedDownloadSize_%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)convertSwiftError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);

  v6 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "code");

  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)convertSwiftErrorReference:(id *)a3
{
  if (a3 && *a3)
  {
    +[RMErrorUtilities convertSwiftError:](RMErrorUtilities, "convertSwiftError:");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

@end
