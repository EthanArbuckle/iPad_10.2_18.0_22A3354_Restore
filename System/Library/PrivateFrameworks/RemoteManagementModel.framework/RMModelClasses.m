@implementation RMModelClasses

+ (Class)classForCommandType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = classForCommandType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&classForCommandType__onceToken, &__block_literal_global_10);
  objc_msgSend((id)classForCommandType__commandClassByCommandType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

void __38__RMModelClasses_classForCommandType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_opt_class();
  +[RMModelManagementTestCommandCommand registeredIdentifier](RMModelManagementTestCommandCommand, "registeredIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v0, v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)classForCommandType__commandClassByCommandType;
  classForCommandType__commandClassByCommandType = v2;

}

+ (Class)classForDeclarationType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = classForDeclarationType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&classForDeclarationType__onceToken, &__block_literal_global_2);
  objc_msgSend((id)declarationClassByDeclarationType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

void __42__RMModelClasses_classForDeclarationType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 40);
  v82 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_opt_class();
  +[RMModelActivationSimpleDeclaration registeredIdentifier](RMModelActivationSimpleDeclaration, "registeredIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v0, v1);

  v2 = objc_opt_class();
  +[RMModelAssetCredentialACMEDeclaration registeredIdentifier](RMModelAssetCredentialACMEDeclaration, "registeredIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v2, v3);

  v4 = objc_opt_class();
  +[RMModelAssetCredentialCertificateDeclaration registeredIdentifier](RMModelAssetCredentialCertificateDeclaration, "registeredIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v4, v5);

  v6 = objc_opt_class();
  +[RMModelAssetCredentialIdentityDeclaration registeredIdentifier](RMModelAssetCredentialIdentityDeclaration, "registeredIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v6, v7);

  v8 = objc_opt_class();
  +[RMModelAssetCredentialSCEPDeclaration registeredIdentifier](RMModelAssetCredentialSCEPDeclaration, "registeredIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v8, v9);

  v10 = objc_opt_class();
  +[RMModelAssetCredentialUserNameAndPasswordDeclaration registeredIdentifier](RMModelAssetCredentialUserNameAndPasswordDeclaration, "registeredIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v10, v11);

  v12 = objc_opt_class();
  +[RMModelAssetDataDeclaration registeredIdentifier](RMModelAssetDataDeclaration, "registeredIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v12, v13);

  v14 = objc_opt_class();
  +[RMModelAssetUserIdentityDeclaration registeredIdentifier](RMModelAssetUserIdentityDeclaration, "registeredIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v14, v15);

  v16 = objc_opt_class();
  +[RMModelAccountCalDAVDeclaration registeredIdentifier](RMModelAccountCalDAVDeclaration, "registeredIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v16, v17);

  v18 = objc_opt_class();
  +[RMModelAccountCardDAVDeclaration registeredIdentifier](RMModelAccountCardDAVDeclaration, "registeredIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v18, v19);

  v20 = objc_opt_class();
  +[RMModelAccountExchangeDeclaration registeredIdentifier](RMModelAccountExchangeDeclaration, "registeredIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v20, v21);

  v22 = objc_opt_class();
  +[RMModelAccountGoogleDeclaration registeredIdentifier](RMModelAccountGoogleDeclaration, "registeredIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v22, v23);

  v24 = objc_opt_class();
  +[RMModelAccountLDAPDeclaration registeredIdentifier](RMModelAccountLDAPDeclaration, "registeredIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v24, v25);

  v26 = objc_opt_class();
  +[RMModelAccountMailDeclaration registeredIdentifier](RMModelAccountMailDeclaration, "registeredIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v26, v27);

  v28 = objc_opt_class();
  +[RMModelAccountSubscribedCalendarDeclaration registeredIdentifier](RMModelAccountSubscribedCalendarDeclaration, "registeredIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v28, v29);

  v30 = objc_opt_class();
  +[RMModelAppManagedDeclaration registeredIdentifier](RMModelAppManagedDeclaration, "registeredIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v30, v31);

  v32 = objc_opt_class();
  +[RMModelAppMarketplaceDeclaration registeredIdentifier](RMModelAppMarketplaceDeclaration, "registeredIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v32, v33);

  v34 = objc_opt_class();
  +[RMModelAppSettingsDeclaration registeredIdentifier](RMModelAppSettingsDeclaration, "registeredIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v34, v35);

  v36 = objc_opt_class();
  +[RMModelDiskManagementSettingsDeclaration registeredIdentifier](RMModelDiskManagementSettingsDeclaration, "registeredIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v36, v37);

  v38 = objc_opt_class();
  +[RMModelLegacyInteractiveProfileDeclaration registeredIdentifier](RMModelLegacyInteractiveProfileDeclaration, "registeredIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v38, v39);

  v40 = objc_opt_class();
  +[RMModelLegacyProfileDeclaration registeredIdentifier](RMModelLegacyProfileDeclaration, "registeredIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v40, v41);

  v42 = objc_opt_class();
  +[RMModelManagementStatusSubscriptionsDeclaration registeredIdentifier](RMModelManagementStatusSubscriptionsDeclaration, "registeredIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v42, v43);

  v44 = objc_opt_class();
  +[RMModelManagementTestDeclaration registeredIdentifier](RMModelManagementTestDeclaration, "registeredIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v44, v45);

  v46 = objc_opt_class();
  +[RMModelNetworkEAPDeclaration registeredIdentifier](RMModelNetworkEAPDeclaration, "registeredIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v46, v47);

  v48 = objc_opt_class();
  +[RMModelNetworkWiFiDeclaration registeredIdentifier](RMModelNetworkWiFiDeclaration, "registeredIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v48, v49);

  v50 = objc_opt_class();
  +[RMModelPasscodeSettingsDeclaration registeredIdentifier](RMModelPasscodeSettingsDeclaration, "registeredIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v50, v51);

  v52 = objc_opt_class();
  +[RMModelScreenSharingConnectionGroupDeclaration registeredIdentifier](RMModelScreenSharingConnectionGroupDeclaration, "registeredIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v52, v53);

  v54 = objc_opt_class();
  +[RMModelScreenSharingConnectionDeclaration registeredIdentifier](RMModelScreenSharingConnectionDeclaration, "registeredIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v54, v55);

  v56 = objc_opt_class();
  +[RMModelScreenSharingHostSettingsDeclaration registeredIdentifier](RMModelScreenSharingHostSettingsDeclaration, "registeredIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v56, v57);

  v58 = objc_opt_class();
  +[RMModelSecurityCertificateDeclaration registeredIdentifier](RMModelSecurityCertificateDeclaration, "registeredIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v58, v59);

  v60 = objc_opt_class();
  +[RMModelSecurityIdentityDeclaration registeredIdentifier](RMModelSecurityIdentityDeclaration, "registeredIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v60, v61);

  v62 = objc_opt_class();
  +[RMModelSecurityPasskeyAttestationDeclaration registeredIdentifier](RMModelSecurityPasskeyAttestationDeclaration, "registeredIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v62, v63);

  v64 = objc_opt_class();
  +[RMModelServicesBackgroundTasksDeclaration registeredIdentifier](RMModelServicesBackgroundTasksDeclaration, "registeredIdentifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v64, v65);

  v66 = objc_opt_class();
  +[RMModelServicesConfigurationFilesDeclaration registeredIdentifier](RMModelServicesConfigurationFilesDeclaration, "registeredIdentifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v66, v67);

  v68 = objc_opt_class();
  +[RMModelSoftwareUpdateEnforcementSpecificDeclaration registeredIdentifier](RMModelSoftwareUpdateEnforcementSpecificDeclaration, "registeredIdentifier");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v68, v69);

  v70 = objc_opt_class();
  +[RMModelSoftwareUpdateSettingsDeclaration registeredIdentifier](RMModelSoftwareUpdateSettingsDeclaration, "registeredIdentifier");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v70, v71);

  v72 = objc_opt_class();
  +[RMModelWatchEnrollmentDeclaration registeredIdentifier](RMModelWatchEnrollmentDeclaration, "registeredIdentifier");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v72, v73);

  v74 = objc_opt_class();
  +[RMModelManagementOrganizationInformationDeclaration registeredIdentifier](RMModelManagementOrganizationInformationDeclaration, "registeredIdentifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v74, v75);

  v76 = objc_opt_class();
  +[RMModelManagementPropertiesDeclaration registeredIdentifier](RMModelManagementPropertiesDeclaration, "registeredIdentifier");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v76, v77);

  v78 = objc_opt_class();
  +[RMModelManagementServerCapabilitiesDeclaration registeredIdentifier](RMModelManagementServerCapabilitiesDeclaration, "registeredIdentifier");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v78, v79);

  v80 = objc_msgSend(v82, "copy");
  v81 = (void *)declarationClassByDeclarationType;
  declarationClassByDeclarationType = v80;

}

+ (void)ensureClassForDeclarations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "classForDeclarationType:", &stru_25160BAF0);
  v5 = (void *)objc_msgSend((id)declarationClassByDeclarationType, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  v9 = v6;
  if (!v7)
    goto LABEL_16;
  v10 = v7;
  v11 = 0;
  v12 = *(_QWORD *)v21;
  v13 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v8 = 138543362;
  v19 = v8;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v6);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (objc_msgSend(v15, "isSubclassOfClass:", objc_opt_class()))
      {
        objc_msgSend(v15, "registeredIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "objectForKeyedSubscript:", v16))
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromClass((Class)v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v17;
            _os_log_impl(&dword_24510E000, v13, OS_LOG_TYPE_DEFAULT, "Registering declaration model class: %{public}@", buf, 0xCu);

          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v16, v19, (_QWORD)v20);
          v11 = 1;
        }

      }
    }
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  }
  while (v10);

  if ((v11 & 1) != 0)
  {
    v18 = objc_msgSend(v5, "copy");
    v9 = (void *)declarationClassByDeclarationType;
    declarationClassByDeclarationType = v18;
LABEL_16:

  }
}

+ (void)hideDeclarationsWithTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "classForDeclarationType:", &stru_25160BAF0);
  v5 = (void *)objc_msgSend((id)declarationClassByDeclarationType, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = objc_msgSend(v5, "copy");
  v12 = (void *)declarationClassByDeclarationType;
  declarationClassByDeclarationType = v11;

}

+ (Class)classForStatusItemType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = classForStatusItemType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&classForStatusItemType__onceToken, &__block_literal_global_45);
  objc_msgSend((id)statusItemClassByStatusItemType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

void __41__RMModelClasses_classForStatusItemType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 43);
  v88 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_opt_class();
  +[RMModelStatusAccountListCalDAV statusItemType](RMModelStatusAccountListCalDAV, "statusItemType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v0, v1);

  v2 = objc_opt_class();
  +[RMModelStatusAccountListCardDAV statusItemType](RMModelStatusAccountListCardDAV, "statusItemType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v2, v3);

  v4 = objc_opt_class();
  +[RMModelStatusAccountListExchange statusItemType](RMModelStatusAccountListExchange, "statusItemType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v4, v5);

  v6 = objc_opt_class();
  +[RMModelStatusAccountListGoogle statusItemType](RMModelStatusAccountListGoogle, "statusItemType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v6, v7);

  v8 = objc_opt_class();
  +[RMModelStatusAccountListLDAP statusItemType](RMModelStatusAccountListLDAP, "statusItemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v8, v9);

  v10 = objc_opt_class();
  +[RMModelStatusAccountListMailIncoming statusItemType](RMModelStatusAccountListMailIncoming, "statusItemType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v10, v11);

  v12 = objc_opt_class();
  +[RMModelStatusAccountListMailOutgoing statusItemType](RMModelStatusAccountListMailOutgoing, "statusItemType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v12, v13);

  v14 = objc_opt_class();
  +[RMModelStatusAccountListSubscribedCalendar statusItemType](RMModelStatusAccountListSubscribedCalendar, "statusItemType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v14, v15);

  v16 = objc_opt_class();
  +[RMModelStatusAppManagedList statusItemType](RMModelStatusAppManagedList, "statusItemType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v16, v17);

  v18 = objc_opt_class();
  +[RMModelStatusDeviceSerialNumber statusItemType](RMModelStatusDeviceSerialNumber, "statusItemType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v18, v19);

  v20 = objc_opt_class();
  +[RMModelStatusDeviceUDID statusItemType](RMModelStatusDeviceUDID, "statusItemType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v20, v21);

  v22 = objc_opt_class();
  +[RMModelStatusDeviceModelFamily statusItemType](RMModelStatusDeviceModelFamily, "statusItemType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v22, v23);

  v24 = objc_opt_class();
  +[RMModelStatusDeviceModelIdentifier statusItemType](RMModelStatusDeviceModelIdentifier, "statusItemType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v24, v25);

  v26 = objc_opt_class();
  +[RMModelStatusDeviceModelMarketingName statusItemType](RMModelStatusDeviceModelMarketingName, "statusItemType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v26, v27);

  v28 = objc_opt_class();
  +[RMModelStatusDeviceModelNumber statusItemType](RMModelStatusDeviceModelNumber, "statusItemType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v28, v29);

  v30 = objc_opt_class();
  +[RMModelStatusDeviceOperatingSystemBuildVersion statusItemType](RMModelStatusDeviceOperatingSystemBuildVersion, "statusItemType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v30, v31);

  v32 = objc_opt_class();
  +[RMModelStatusDeviceOperatingSystemFamily statusItemType](RMModelStatusDeviceOperatingSystemFamily, "statusItemType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v32, v33);

  v34 = objc_opt_class();
  +[RMModelStatusDeviceOperatingSystemMarketingName statusItemType](RMModelStatusDeviceOperatingSystemMarketingName, "statusItemType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v34, v35);

  v36 = objc_opt_class();
  +[RMModelStatusDeviceOperatingSystemSupplementalBuildVersion statusItemType](RMModelStatusDeviceOperatingSystemSupplementalBuildVersion, "statusItemType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v36, v37);

  v38 = objc_opt_class();
  +[RMModelStatusDeviceOperatingSystemSupplementalExtraVersion statusItemType](RMModelStatusDeviceOperatingSystemSupplementalExtraVersion, "statusItemType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v38, v39);

  v40 = objc_opt_class();
  +[RMModelStatusDeviceOperatingSystemVersion statusItemType](RMModelStatusDeviceOperatingSystemVersion, "statusItemType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v40, v41);

  v42 = objc_opt_class();
  +[RMModelStatusDeviceBatteryHealth statusItemType](RMModelStatusDeviceBatteryHealth, "statusItemType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v42, v43);

  v44 = objc_opt_class();
  +[RMModelStatusDiskManagementFileVaultEnabled statusItemType](RMModelStatusDiskManagementFileVaultEnabled, "statusItemType");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v44, v45);

  v46 = objc_opt_class();
  +[RMModelStatusManagementClientCapabilities statusItemType](RMModelStatusManagementClientCapabilities, "statusItemType");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v46, v47);

  v48 = objc_opt_class();
  +[RMModelStatusManagementDeclarations statusItemType](RMModelStatusManagementDeclarations, "statusItemType");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v48, v49);

  v50 = objc_opt_class();
  +[RMModelStatusManagementPushToken statusItemType](RMModelStatusManagementPushToken, "statusItemType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v50, v51);

  v52 = objc_opt_class();
  +[RMModelStatusMDMApp statusItemType](RMModelStatusMDMApp, "statusItemType");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v52, v53);

  v54 = objc_opt_class();
  +[RMModelStatusPasscodeCompliance statusItemType](RMModelStatusPasscodeCompliance, "statusItemType");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v54, v55);

  v56 = objc_opt_class();
  +[RMModelStatusPasscodeIsPresent statusItemType](RMModelStatusPasscodeIsPresent, "statusItemType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v56, v57);

  v58 = objc_opt_class();
  +[RMModelStatusScreenSharingConnectionGroupUnresolvedConnections statusItemType](RMModelStatusScreenSharingConnectionGroupUnresolvedConnections, "statusItemType");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v58, v59);

  v60 = objc_opt_class();
  +[RMModelStatusSecurityCertificateList statusItemType](RMModelStatusSecurityCertificateList, "statusItemType");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v60, v61);

  v62 = objc_opt_class();
  +[RMModelStatusServicesBackgroundTask statusItemType](RMModelStatusServicesBackgroundTask, "statusItemType");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v62, v63);

  v64 = objc_opt_class();
  +[RMModelStatusSoftwareUpdateFailureReason statusItemType](RMModelStatusSoftwareUpdateFailureReason, "statusItemType");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v64, v65);

  v66 = objc_opt_class();
  +[RMModelStatusSoftwareUpdateInstallReason statusItemType](RMModelStatusSoftwareUpdateInstallReason, "statusItemType");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v66, v67);

  v68 = objc_opt_class();
  +[RMModelStatusSoftwareUpdateInstallState statusItemType](RMModelStatusSoftwareUpdateInstallState, "statusItemType");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v68, v69);

  v70 = objc_opt_class();
  +[RMModelStatusSoftwareUpdatePendingVersion statusItemType](RMModelStatusSoftwareUpdatePendingVersion, "statusItemType");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v70, v71);

  v72 = objc_opt_class();
  +[RMModelStatusTestArrayValue statusItemType](RMModelStatusTestArrayValue, "statusItemType");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v72, v73);

  v74 = objc_opt_class();
  +[RMModelStatusTestBooleanValue statusItemType](RMModelStatusTestBooleanValue, "statusItemType");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v74, v75);

  v76 = objc_opt_class();
  +[RMModelStatusTestDictionaryValue statusItemType](RMModelStatusTestDictionaryValue, "statusItemType");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v76, v77);

  v78 = objc_opt_class();
  +[RMModelStatusTestErrorValue statusItemType](RMModelStatusTestErrorValue, "statusItemType");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v78, v79);

  v80 = objc_opt_class();
  +[RMModelStatusTestIntegerValue statusItemType](RMModelStatusTestIntegerValue, "statusItemType");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v80, v81);

  v82 = objc_opt_class();
  +[RMModelStatusTestRealValue statusItemType](RMModelStatusTestRealValue, "statusItemType");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v82, v83);

  v84 = objc_opt_class();
  +[RMModelStatusTestStringValue statusItemType](RMModelStatusTestStringValue, "statusItemType");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v84, v85);

  v86 = objc_msgSend(v88, "copy");
  v87 = (void *)statusItemClassByStatusItemType;
  statusItemClassByStatusItemType = v86;

}

+ (void)ensureClassForStatusItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "classForStatusItemType:", &stru_25160BAF0);
  v5 = (void *)objc_msgSend((id)statusItemClassByStatusItemType, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  v9 = v6;
  if (!v7)
    goto LABEL_16;
  v10 = v7;
  v11 = 0;
  v12 = *(_QWORD *)v21;
  v13 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v8 = 138543362;
  v19 = v8;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v6);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (objc_msgSend(v15, "isSubclassOfClass:", objc_opt_class()))
      {
        objc_msgSend(v15, "statusItemType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "objectForKeyedSubscript:", v16))
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromClass((Class)v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v17;
            _os_log_impl(&dword_24510E000, v13, OS_LOG_TYPE_DEFAULT, "Registering status item model class: %{public}@", buf, 0xCu);

          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v16, v19, (_QWORD)v20);
          v11 = 1;
        }

      }
    }
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  }
  while (v10);

  if ((v11 & 1) != 0)
  {
    v18 = objc_msgSend(v5, "copy");
    v9 = (void *)statusItemClassByStatusItemType;
    statusItemClassByStatusItemType = v18;
LABEL_16:

  }
}

+ (id)allActivationClasses
{
  if (allActivationClasses_onceToken != -1)
    dispatch_once(&allActivationClasses_onceToken, &__block_literal_global_90);
  return (id)allActivationClasses_activationClasses;
}

void __38__RMModelClasses_allActivationClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", objc_opt_class());
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)allActivationClasses_activationClasses;
  allActivationClasses_activationClasses = v0;

}

+ (id)allConfigurationClasses
{
  if (allConfigurationClasses_onceToken != -1)
    dispatch_once(&allConfigurationClasses_onceToken, &__block_literal_global_92);
  return (id)allConfigurationClasses_configurationClasses;
}

void __41__RMModelClasses_allConfigurationClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 29);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)allConfigurationClasses_configurationClasses;
  allConfigurationClasses_configurationClasses = v0;

}

+ (id)allAssetClasses
{
  if (allAssetClasses_onceToken != -1)
    dispatch_once(&allAssetClasses_onceToken, &__block_literal_global_93);
  return (id)allAssetClasses_assetClasses;
}

void __33__RMModelClasses_allAssetClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 7);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)allAssetClasses_assetClasses;
  allAssetClasses_assetClasses = v0;

}

+ (id)allManagementClasses
{
  if (allManagementClasses_onceToken != -1)
    dispatch_once(&allManagementClasses_onceToken, &__block_literal_global_94);
  return (id)allManagementClasses_managementClasses;
}

void __38__RMModelClasses_allManagementClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)allManagementClasses_managementClasses;
  allManagementClasses_managementClasses = v0;

}

+ (id)allStatusItemClasses
{
  if (allStatusItemClasses_onceToken != -1)
    dispatch_once(&allStatusItemClasses_onceToken, &__block_literal_global_95);
  return (id)allStatusItemClasses_statusItemClasses;
}

void __38__RMModelClasses_allStatusItemClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 43);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)allStatusItemClasses_statusItemClasses;
  allStatusItemClasses_statusItemClasses = v0;

}

@end
