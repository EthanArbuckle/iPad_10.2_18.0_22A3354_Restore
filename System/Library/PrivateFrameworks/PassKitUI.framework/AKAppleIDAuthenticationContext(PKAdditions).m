@implementation AKAppleIDAuthenticationContext(PKAdditions)

- (id)pk_AKAppleIDAuthenticationInAppContext
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = a1;
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D002F8]);
    objc_msgSend(a1, "reason");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setReason:", v3);

    objc_msgSend(a1, "DSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDSID:", v4);

    objc_msgSend(a1, "altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAltDSID:", v5);

    objc_msgSend(a1, "defaultButtonString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDefaultButtonString:", v6);

    objc_msgSend(a1, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTitle:", v7);

    objc_msgSend(a1, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setUsername:", v8);

    objc_msgSend(v2, "setMaximumLoginAttempts:", objc_msgSend(a1, "maximumLoginAttempts"));
    objc_msgSend(v2, "setIsEphemeral:", objc_msgSend(a1, "isEphemeral"));
    objc_msgSend(v2, "setShouldOfferSecurityUpgrade:", objc_msgSend(a1, "shouldOfferSecurityUpgrade"));
    objc_msgSend(a1, "appProvidedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAppProvidedData:", v9);

    objc_msgSend(v2, "setServiceType:", objc_msgSend(a1, "serviceType"));
    objc_msgSend(v2, "setIsUsernameEditable:", objc_msgSend(a1, "isUsernameEditable"));
    objc_msgSend(v2, "setAuthenticationType:", objc_msgSend(a1, "authenticationType"));
  }
  return v2;
}

@end
