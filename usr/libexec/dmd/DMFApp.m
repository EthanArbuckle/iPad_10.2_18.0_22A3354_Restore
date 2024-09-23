@implementation DMFApp

- (DMFApp)initWithJob:(id)a3 hasUpdateAvailable:(BOOL)a4 propertyKeys:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  DMFApp *v11;
  void *v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
  v11 = -[DMFApp initWithBundleIdentifier:propertyKeys:](self, "initWithBundleIdentifier:propertyKeys:", v10, v9);

  if (v11)
  {
    if (objc_msgSend(v9, "containsObject:", CFSTR("type")))
      -[DMFApp setType:](v11, "setType:", 0);
    if (objc_msgSend(v9, "containsObject:", CFSTR("storeItemIdentifier")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v8, "storeItemID")));
      -[DMFApp setStoreItemIdentifier:](v11, "setStoreItemIdentifier:", v12);

    }
    if (objc_msgSend(v9, "containsObject:", CFSTR("isAppStoreVendable")))
      -[DMFApp setIsAppStoreVendable:](v11, "setIsAppStoreVendable:", 1);
    if (objc_msgSend(v9, "containsObject:", CFSTR("hasUpdateAvailable")))
      -[DMFApp setHasUpdateAvailable:](v11, "setHasUpdateAvailable:", v6);
  }

  return v11;
}

- (DMFApp)initWithBundleIdentifier:(id)a3 propertyKeys:(id)a4
{
  id v6;
  id v7;
  DMFApp *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)DMFApp;
  v8 = -[DMFApp init](&v27, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    if (objc_msgSend(v7, "containsObject:", CFSTR("bundleIdentifier")))
      -[DMFApp setBundleIdentifier:](v8, "setBundleIdentifier:", v6);
    if (objc_msgSend(v7, "containsObject:", CFSTR("installationState")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppLifeCycle lifeCycleForBundleIdentifier:](DMDAppLifeCycle, "lifeCycleForBundleIdentifier:", v6));
      -[DMFApp setInstallationState:](v8, "setInstallationState:", objc_msgSend(v10, "currentState"));

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("VPNUUIDString")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "VPNUUIDStringForBundleIdentifier:", v6));
      -[DMFApp setVPNUUIDString:](v8, "setVPNUUIDString:", v11);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("cellularSliceUUIDString")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellularSliceUUIDStringForBundleIdentifier:", v6));
      -[DMFApp setCellularSliceUUIDString:](v8, "setCellularSliceUUIDString:", v12);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("contentFilterUUIDString")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentFilterUUIDStringForBundleIdentifier:", v6));
      -[DMFApp setContentFilterUUIDString:](v8, "setContentFilterUUIDString:", v13);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("DNSProxyUUIDString")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "DNSProxyUUIDStringForBundleIdentifier:", v6));
      -[DMFApp setDNSProxyUUIDString:](v8, "setDNSProxyUUIDString:", v14);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("relayUUIDString")))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "relayUUIDStringForBundleIdentifier:", v6));
      -[DMFApp setRelayUUIDString:](v8, "setRelayUUIDString:", v15);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("associatedDomains")))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "associatedDomainsForBundleIdentifier:", v6));
      -[DMFApp setAssociatedDomains:](v8, "setAssociatedDomains:", v16);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("associatedDomainsEnableDirectDownloads")))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "associatedDomainsEnableDirectDownloadsForBundleIdentifier:", v6));
      -[DMFApp setAssociatedDomainsEnableDirectDownloads:](v8, "setAssociatedDomainsEnableDirectDownloads:", v17);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("removable")))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "removabilityForBundleIdentifier:", v6));
      -[DMFApp setRemovable:](v8, "setRemovable:", v18);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("tapToPayScreenLock")))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tapToPayScreenLockForBundleIdentifier:", v6));
      -[DMFApp setTapToPayScreenLock:](v8, "setTapToPayScreenLock:", v19);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("allowUserToHide")))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allowUserToHideForBundleIdentifier:", v6));
      -[DMFApp setAllowUserToHide:](v8, "setAllowUserToHide:", v20);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("allowUserToLock")))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allowUserToLockForBundleIdentifier:", v6));
      -[DMFApp setAllowUserToLock:](v8, "setAllowUserToLock:", v21);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("configuration")))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configurationForBundleIdentifier:", v6));
      -[DMFApp setConfiguration:](v8, "setConfiguration:", v22);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("feedback")))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "feedbackForBundleIdentifier:", v6));
      -[DMFApp setFeedback:](v8, "setFeedback:", v23);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("sourceIdentifier")))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceIdentifierForBundleIdentifier:", v6));
      -[DMFApp setSourceIdentifier:](v8, "setSourceIdentifier:", v24);

    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("managementInformation")))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managementInformationForBundleIdentifier:", v6));
      -[DMFApp setManagementInformation:](v8, "setManagementInformation:", v25);

    }
  }

  return v8;
}

- (id)initWithApplicationRecord:(id)a3 hasUpdateAvailable:(BOOL)a4 propertyKeys:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  DMFApp *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  void *v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  v11 = -[DMFApp initWithBundleIdentifier:propertyKeys:](self, "initWithBundleIdentifier:propertyKeys:", v10, v9);
  if (!v11)
    goto LABEL_65;
  v48 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "compatibilityObject"));
  if (objc_msgSend(v9, "containsObject:", CFSTR("type")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationType"));
    if ((objc_msgSend(v13, "isEqualToString:", LSSystemApplicationType) & 1) != 0)
    {
      v14 = 1;
    }
    else if (objc_msgSend(v13, "isEqualToString:", LSUserApplicationType))
    {
      v14 = 2;
    }
    else
    {
      v14 = 0;
    }
    -[DMFApp setType:](v11, "setType:", v14);

  }
  if (objc_msgSend(v9, "containsObject:", CFSTR("displayName")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedName"));
    if (v15)
    {
      -[DMFApp setDisplayName:](v11, "setDisplayName:", v15);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemName"));
      -[DMFApp setDisplayName:](v11, "setDisplayName:", v16);

    }
  }
  if (objc_msgSend(v9, "containsObject:", CFSTR("storeItemIdentifier")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemID"));
    -[DMFApp setStoreItemIdentifier:](v11, "setStoreItemIdentifier:", v17);

  }
  if (objc_msgSend(v9, "containsObject:", CFSTR("externalVersionIdentifier")))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "externalVersionIdentifier"));
    -[DMFApp setExternalVersionIdentifier:](v11, "setExternalVersionIdentifier:", v18);

  }
  if (objc_msgSend(v9, "containsObject:", CFSTR("distributorIdentifier")))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "iTunesMetadata"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "distributorInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "distributorID"));
    -[DMFApp setDistributorIdentifier:](v11, "setDistributorIdentifier:", v21);

  }
  if (objc_msgSend(v9, "containsObject:", CFSTR("version")))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleVersion"));
    -[DMFApp setVersion:](v11, "setVersion:", v22);

  }
  if (objc_msgSend(v9, "containsObject:", CFSTR("shortVersion")))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortVersionString"));
    -[DMFApp setShortVersion:](v11, "setShortVersion:", v23);

  }
  v24 = objc_msgSend(v9, "containsObject:", CFSTR("staticUsage"));
  v25 = objc_msgSend(v9, "containsObject:", CFSTR("dynamicUsage"));
  v26 = objc_msgSend(v9, "containsObject:", CFSTR("onDemandResourcesUsage"));
  v27 = objc_msgSend(v9, "containsObject:", CFSTR("sharedUsage"));
  v28 = v27;
  if ((v24 & 1) != 0 || (v25 & 1) != 0 || (v26 & 1) != 0 || v27)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "diskUsage"));
    v30 = v29;
    if (v24)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "staticUsage"));
      -[DMFApp setStaticUsage:](v11, "setStaticUsage:", v45);

      if (!v25)
      {
LABEL_30:
        if (!v26)
          goto LABEL_31;
        goto LABEL_68;
      }
    }
    else if (!v25)
    {
      goto LABEL_30;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dynamicUsage"));
    -[DMFApp setDynamicUsage:](v11, "setDynamicUsage:", v46);

    if (!v26)
    {
LABEL_31:
      if (!v28)
      {
LABEL_33:

        goto LABEL_34;
      }
LABEL_32:
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "sharedUsage"));
      -[DMFApp setSharedUsage:](v11, "setSharedUsage:", v31);

      goto LABEL_33;
    }
LABEL_68:
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "onDemandResourcesUsage"));
    -[DMFApp setOnDemandResourcesUsage:](v11, "setOnDemandResourcesUsage:", v47);

    if (!v28)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_34:
  v32 = objc_msgSend(v9, "containsObject:", CFSTR("isPlaceholder"));
  v33 = objc_msgSend(v9, "containsObject:", CFSTR("isRestricted"));
  v34 = v33;
  if ((v32 & 1) != 0 || v33)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appState"));
    v36 = v35;
    if (v32)
      -[DMFApp setIsPlaceholder:](v11, "setIsPlaceholder:", objc_msgSend(v35, "isPlaceholder"));
    if (v34)
      -[DMFApp setIsRestricted:](v11, "setIsRestricted:", objc_msgSend(v36, "isRestricted"));

  }
  v37 = objc_msgSend(v9, "containsObject:", CFSTR("isUserBasedVPP"));
  v38 = objc_msgSend(v9, "containsObject:", CFSTR("isLicenseExpired"));
  v39 = objc_msgSend(v9, "containsObject:", CFSTR("isLicenseRevoked"));
  v40 = v39;
  if ((v37 & 1) == 0 && (v38 & 1) == 0 && !v39)
    goto LABEL_48;
  v41 = +[SSPurchaseReceipt vppStateFlagsWithProxy:](SSPurchaseReceipt, "vppStateFlagsWithProxy:", v12);
  v42 = v41;
  if (!v37)
  {
    if (!v38)
      goto LABEL_46;
LABEL_71:
    -[DMFApp setIsLicenseExpired:](v11, "setIsLicenseExpired:", (v42 >> 2) & 1);
    if (!v40)
      goto LABEL_48;
    goto LABEL_47;
  }
  -[DMFApp setIsUserBasedVPP:](v11, "setIsUserBasedVPP:", (v41 >> 1) & 1);
  if (v38)
    goto LABEL_71;
LABEL_46:
  if (v40)
LABEL_47:
    -[DMFApp setIsLicenseRevoked:](v11, "setIsLicenseRevoked:", (v42 >> 3) & 1);
LABEL_48:
  if (objc_msgSend(v9, "containsObject:", CFSTR("isDeviceBasedVPP")))
    -[DMFApp setIsDeviceBasedVPP:](v11, "setIsDeviceBasedVPP:", objc_msgSend(v12, "isDeviceBasedVPP"));
  if (objc_msgSend(v9, "containsObject:", CFSTR("isUPP")))
    -[DMFApp setIsUPP:](v11, "setIsUPP:", objc_msgSend(v12, "profileValidated"));
  if (objc_msgSend(v9, "containsObject:", CFSTR("isValidated")))
    -[DMFApp setIsValidated:](v11, "setIsValidated:", -[DMFApp _proxyIsValidated:](v11, "_proxyIsValidated:", v12));
  if (objc_msgSend(v9, "containsObject:", CFSTR("isAppClip")))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appClipMetadata"));
    -[DMFApp setIsAppClip:](v11, "setIsAppClip:", v43 != 0);

  }
  if (objc_msgSend(v9, "containsObject:", CFSTR("isAppStoreVendable")))
    -[DMFApp setIsAppStoreVendable:](v11, "setIsAppStoreVendable:", objc_msgSend(v12, "isAppStoreVendable"));
  if (objc_msgSend(v9, "containsObject:", CFSTR("isBetaApp")))
    -[DMFApp setIsBetaApp:](v11, "setIsBetaApp:", objc_msgSend(v12, "isBetaApp"));
  if (objc_msgSend(v9, "containsObject:", CFSTR("isAdHocCodeSigned")))
    -[DMFApp setIsAdHocCodeSigned:](v11, "setIsAdHocCodeSigned:", objc_msgSend(v12, "isAdHocCodeSigned"));
  if (objc_msgSend(v9, "containsObject:", CFSTR("hasUpdateAvailable")))
    -[DMFApp setHasUpdateAvailable:](v11, "setHasUpdateAvailable:", v48);

LABEL_65:
  return v11;
}

- (BOOL)_proxyIsValidated:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bundleURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

  if (v4)
  {
    v5 = MISAppApprovalState(v4, 0);
    if (v5)
      v6 = v5 == 3;
    else
      v6 = 1;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
