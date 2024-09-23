@implementation PUILocationServicesAuthorizationLevelController

- (PUILocationServicesAuthorizationLevelController)init
{
  PUILocationServicesAuthorizationLevelController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  v2 = -[PUILocationServicesListController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_profileSettingsChanged_, CFSTR("PSProfileConnectionEffectiveSettingsChangedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  -[PUILocationServicesListController dealloc](&v4, sel_dealloc);
}

- (void)profileSettingsChanged:(id)a3
{
  void *v4;
  void *v5;
  PUILocationServicesAuthorizationLevelController *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D471F8]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v10, "intValue");
  if ((_DWORD)v4 != getpid())
  {
    -[PUILocationServicesAuthorizationLevelController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topViewController");
    v6 = (PUILocationServicesAuthorizationLevelController *)objc_claimAutoreleasedReturnValue();
    if (v6 != self)
    {

LABEL_6:
      goto LABEL_7;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = isModificationAllowedForID(v7);

    if ((v8 & 1) == 0)
    {
      -[PUILocationServicesAuthorizationLevelController navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)setSpecifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serviceKey;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  v4 = a3;
  -[PUILocationServicesAuthorizationLevelController setSpecifier:](&v7, sel_setSpecifier_, v4);
  objc_msgSend(v4, "identifier", v7.receiver, v7.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  -[PUILocationServicesListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PUILocationServicesAuthorizationLevelController _updatePreciseLocationCell](self, "_updatePreciseLocationCell");
}

- (void)_updatePreciseLocationCell
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((self->_authMask & 1) != 0)
  {
    -[PUILocationServicesAuthorizationLevelController correctiveCompensationSpecifiersGroup](self, "correctiveCompensationSpecifiersGroup");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUILocationServicesAuthorizationLevelController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v6, 1);
    goto LABEL_5;
  }
  -[PUILocationServicesAuthorizationLevelController specifierForID:](self, "specifierForID:", self->_serviceKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v6 = 0;
    -[PUILocationServicesAuthorizationLevelController correctiveCompensationSpecifiersGroup](self, "correctiveCompensationSpecifiersGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationServicesAuthorizationLevelController specifiers](self, "specifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationServicesAuthorizationLevelController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v4, objc_msgSend(v5, "count"), 1);

LABEL_5:
    v3 = v6;
  }

}

- (void)_synchronizeLocationDetails
{
  NSDictionary *v3;
  NSDictionary *details;

  v3 = (NSDictionary *)PSUICLCopyAppsUsingLocation();
  details = self->_details;
  self->_details = v3;

}

- (id)specifiers
{
  PUILocationServicesAuthorizationLevelController *v2;
  uint64_t v3;
  id CLLocationManagerClass_0;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSBundle *v32;
  NSBundle *v33;
  void *v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  NSString *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSBundle *authEntityBundle;
  uint64_t v44;
  NSString *displayName;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id obj;
  void *v57;
  id v58;
  int v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (int)*MEMORY[0x1E0D80590];
  if (*(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3))
  {
LABEL_55:
    objc_sync_exit(v2);

    v22 = *(id *)((char *)&v2->super.super.super.super.super.super.isa + v3);
    return v22;
  }
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUILocationServicesAuthorizationLevelController _synchronizeLocationDetails](v2, "_synchronizeLocationDetails");
  if (v2->_serviceKey)
  {
    CLLocationManagerClass_0 = getCLLocationManagerClass_0();
    -[NSDictionary objectForKey:](v2->_details, "objectForKey:", v2->_serviceKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(CLLocationManagerClass_0, "allowableAuthorizationForLocationDictionary:", v5);

    -[NSDictionary objectForKey:](v2->_details, "objectForKey:", v2->_serviceKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("BundleId"));
    v8 = objc_claimAutoreleasedReturnValue();
    _PUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v61 = "-[PUILocationServicesAuthorizationLevelController specifiers]";
      v62 = 2112;
      v63 = v8;
      _os_log_impl(&dword_1DB1FB000, v9, OS_LOG_TYPE_DEFAULT, "%s: entity bundle ID: %@", buf, 0x16u);
    }
    obj = (id)v8;

    v59 = 0;
    objc_msgSend(getCLLocationManagerClass_0(), "getIncidentalUseMode:forBundleIdentifier:", &v59, v8);
    v10 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("ALLOW_LOCATION_SERVICES_HEADER"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupSpecifierWithName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setIdentifier:", CFSTR("LOCATION_SERVICES_AUTH_GROUP"));
    objc_msgSend(v12, "setProperty:forKey:", CFSTR("LOCATION_SERVICES_AUTH_GROUP"), *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v13, *MEMORY[0x1E0D80898]);

    objc_msgSend(v58, "addObject:", v12);
    v14 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("NEVER_AUTHORIZATION"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, v2, 0, 0, 0, 3, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "setIdentifier:", CFSTR("LOCATION_SERVICES_AUTH_NEVER"));
    if ((v6 & 6) != 0)
      v16 = CFSTR("NOT_DETERMINED_AUTHORIZATION");
    else
      v16 = CFSTR("NOT_DETERMINED_AUTHORIZATION_NO_AUTH");
    PUI_LocalizedStringForLocationServicesPrivacy(v16);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIdentifier:", CFSTR("LOCATION_SERVICES_AUTH_NOT_DETERMINED"));
    v18 = *MEMORY[0x1E0D80700];
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    v53 = v17;
    -[PUILocationServicesAuthorizationLevelController specifier](v2, "specifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = PUIIsAppClip(v20);

    if ((_DWORD)v17)
      PUI_LocalizedStringForDimSum(CFSTR("WHILE_USING_TODAY"));
    else
      PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("WHEN_IN_USE_AUTHORIZATION"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v54, v2, 0, 0, 0, 3, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIdentifier:", CFSTR("LOCATION_SERVICES_AUTH_WHEN_IN_USE"));
    v24 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("WHEN_IN_USE_APP_OR_WIDGET_AUTHORIZATION"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, v2, 0, 0, 0, 3, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setIdentifier:", CFSTR("LOCATION_SERVICES_AUTH_WHEN_IN_USE_APP_OR_WIDGET"));
    objc_msgSend(v26, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v18);
    v27 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("ALWAYS_AUTHORIZATION"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, v2, 0, 0, 0, 3, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setIdentifier:", CFSTR("LOCATION_SERVICES_AUTH_ALWAYS"));
    objc_msgSend(v58, "addObject:", v57);
    if (!-[NSString isEqualToString:](v2->_serviceKey, "isEqualToString:", CFSTR("/System/Library/PrivateFrameworks/AssistantServices.framework"))|| _os_feature_enabled_impl())
    {
      objc_msgSend(v58, "addObject:", v53);
    }
    if ((v6 & 2) != 0)
    {
      objc_msgSend(v58, "addObject:", v23);
      if (v59)
        objc_msgSend(v58, "addObject:", v26);
    }
    if ((v6 & 4) != 0)
      objc_msgSend(v58, "addObject:", v29);
    if (!v2->_details || !v7)
      goto LABEL_52;
    v30 = objc_msgSend(getCLLocationManagerClass_0(), "primaryEntityClassForLocationDictionary:", v7);
    if (v30 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CA5860], "bundleProxyForIdentifier:", obj);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bundleURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "path");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v55);
        authEntityBundle = v2->_authEntityBundle;
        v2->_authEntityBundle = (NSBundle *)v42;

      }
      if (obj)
      {
        -[PUILocationServicesListController localizedDisplayNameForBundleID:](v2, "localizedDisplayNameForBundleID:");
        v44 = objc_claimAutoreleasedReturnValue();
        displayName = v2->_displayName;
        v2->_displayName = (NSString *)v44;

        if (-[NSString length](v2->_displayName, "length"))
        {
LABEL_42:

LABEL_43:
          v46 = objc_msgSend(getCLLocationManagerClass_0(), "entityAuthorizationForLocationDictionary:", v7);
          v2->_authMask = v46;
          if (v46)
          {
            if ((v46 & 1) != 0)
            {
              objc_msgSend(v58, "specifierForID:", CFSTR("LOCATION_SERVICES_AUTH_NEVER"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setProperty:forKey:", v47, *MEMORY[0x1E0D808E0]);
            }
            else if ((v46 & 2) != 0)
            {
              if (v59 == 3)
                objc_msgSend(v58, "specifierForID:", CFSTR("LOCATION_SERVICES_AUTH_WHEN_IN_USE_APP_OR_WIDGET"));
              else
                objc_msgSend(v58, "specifierForID:", CFSTR("LOCATION_SERVICES_AUTH_WHEN_IN_USE"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setProperty:forKey:", v47, *MEMORY[0x1E0D808E0]);
            }
            else
            {
              if ((v46 & 4) == 0)
              {
LABEL_51:
                -[PUILocationServicesAuthorizationLevelController _constructFooterForAuthorizationLevel:](v2, "_constructFooterForAuthorizationLevel:", v2->_authMask);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setProperty:forKey:", v48, *MEMORY[0x1E0D80848]);

LABEL_52:
                v2->_correctiveCompensationState = objc_msgSend(getCLLocationManagerClass_0(), "correctiveCompensationStatusForLocationDictionary:", v7);
                if ((v2->_authMask & 1) == 0)
                {
                  -[PUILocationServicesAuthorizationLevelController correctiveCompensationSpecifiersGroup](v2, "correctiveCompensationSpecifiersGroup");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "addObjectsFromArray:", v49);

                }
                v50 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
                *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3) = (Class)v58;

                goto LABEL_55;
              }
              objc_msgSend(v58, "specifierForID:", CFSTR("LOCATION_SERVICES_AUTH_ALWAYS"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setProperty:forKey:", v47, *MEMORY[0x1E0D808E0]);
            }
          }
          else
          {
            objc_msgSend(v58, "specifierForID:", CFSTR("LOCATION_SERVICES_AUTH_NOT_DETERMINED"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setProperty:forKey:", v47, *MEMORY[0x1E0D808E0]);
          }

          goto LABEL_51;
        }
        objc_storeStrong((id *)&v2->_displayName, obj);
        _PUILoggingFacility();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v61 = (const char *)obj;
          v62 = 2112;
          v63 = (uint64_t)v7;
          _os_log_impl(&dword_1DB1FB000, v39, OS_LOG_TYPE_DEFAULT, "No display name found for application: %@, dict: %@", buf, 0x16u);
        }
      }
      else
      {
        _PUILoggingFacility();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[PUILocationServicesAuthorizationLevelController specifiers].cold.1();
      }
    }
    else
    {
      if (v30 != 2)
        goto LABEL_43;
      objc_msgSend(v7, "objectForKey:", CFSTR("BundlePath"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v55);
        v32 = v2->_authEntityBundle;
        v2->_authEntityBundle = (NSBundle *)v31;

        v33 = v2->_authEntityBundle;
        if (!v33)
          goto LABEL_42;
        -[NSBundle objectForInfoDictionaryKey:](v33, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AAC8]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "copy");
        v36 = v2->_displayName;
        v2->_displayName = (NSString *)v35;

        if (-[NSString length](v2->_displayName, "length"))
          goto LABEL_42;
        objc_msgSend(v55, "lastPathComponent");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v2->_displayName;
        v2->_displayName = (NSString *)v37;

        _PUILoggingFacility();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[PUILocationServicesAuthorizationLevelController specifiers].cold.3((uint64_t)v55, (uint64_t)v7, v39);
      }
      else
      {
        _PUILoggingFacility();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[PUILocationServicesAuthorizationLevelController specifiers].cold.2();
      }
    }

    goto LABEL_42;
  }
  _PUILoggingFacility();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v61 = "-[PUILocationServicesAuthorizationLevelController specifiers]";
    _os_log_impl(&dword_1DB1FB000, v21, OS_LOG_TYPE_DEFAULT, "%s: _serviceKey is nil", buf, 0xCu);
  }

  v22 = *(id *)((char *)&v2->super.super.super.super.super.super.isa + v3);
  objc_sync_exit(v2);

  return v22;
}

- (NSArray)correctiveCompensationSpecifiersGroup
{
  NSArray *correctiveCompensationSpecifiersGroup;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;

  correctiveCompensationSpecifiersGroup = self->_correctiveCompensationSpecifiersGroup;
  if (!correctiveCompensationSpecifiersGroup)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationServicesAuthorizationLevelController specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PUIIsAppClip(v7);

    if (v8)
      PUI_LocalizedStringForDimSum(CFSTR("PRECISE_LOCATION_APP_CLIP_FOOTER"));
    else
      PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("PRECISE_LOCATION_FOOTER"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v9, *MEMORY[0x1E0D80848]);
    v10 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("PRECISE_LOCATION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel__setPreciseLocationEnabled_specifier_, sel__preciseLocationStatus_, 0, 6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setProperty:forKey:", self->_serviceKey, *MEMORY[0x1E0D80868]);
    -[PUILocationServicesAuthorizationLevelController _preciseLocationStatus:](self, "_preciseLocationStatus:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v13, *MEMORY[0x1E0D807F0]);

    -[NSArray addObject:](v4, "addObject:", v5);
    -[NSArray addObject:](v4, "addObject:", v12);
    v14 = self->_correctiveCompensationSpecifiersGroup;
    self->_correctiveCompensationSpecifiersGroup = v4;

    correctiveCompensationSpecifiersGroup = self->_correctiveCompensationSpecifiersGroup;
  }
  return correctiveCompensationSpecifiersGroup;
}

- (void)_setPreciseLocationEnabled:(id)a3 specifier:(id)a4
{
  NSDictionary *details;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  details = self->_details;
  v7 = a3;
  objc_msgSend(a4, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](details, "objectForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v7, "BOOLValue");
  self->_correctiveCompensationState = v8 ^ 1;
  if ((_DWORD)v8)
    v9 = 1;
  else
    v9 = 2;
  objc_msgSend(getCLLocationManagerClass_0(), "setEntityAuthorization:withCorrectiveCompensationType:forLocationDictionary:", self->_authMask, v9, v10);
  -[PUILocationServicesAuthorizationLevelController _setLocationAuthorizationLevelMaskForAssociatedFramework:withCorrectiveCompensation:](self, "_setLocationAuthorizationLevelMaskForAssociatedFramework:withCorrectiveCompensation:", self->_authMask, v9);

}

- (id)_preciseLocationStatus:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !self->_correctiveCompensationState);
}

- (id)_constructFooterForAuthorizationLevel:(unint64_t)a3
{
  void *v4;
  id CLLocationManagerClass_0;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x1E0CB3940], "string", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLLocationManagerClass_0 = getCLLocationManagerClass_0();
  -[NSDictionary objectForKey:](self->_details, "objectForKey:", self->_serviceKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(CLLocationManagerClass_0, "allowableAuthorizationForLocationDictionary:", v6);

  if ((v7 & 4) == 0)
  {
    if ((v7 & 2) == 0)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
LABEL_4:
      v11 = 0;
      goto LABEL_16;
    }
    v12 = 2;
    goto LABEL_8;
  }
  if ((v7 & 2) == 0)
  {
    v12 = 4;
LABEL_8:
    -[PUILocationServicesAuthorizationLevelController _purposeStringForAuthorizationLevel:](self, "_purposeStringForAuthorizationLevel:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[PUILocationServicesAuthorizationLevelController _purposeStringForAuthorizationLevel:](self, "_purposeStringForAuthorizationLevel:", 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_10:
    if (!self->_displayName || !v11)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      goto LABEL_16;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("PURPOSE_STRING"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v9 = 0;
    v8 = 0;
    goto LABEL_13;
  }
  -[PUILocationServicesAuthorizationLevelController _purposeStringForAuthorizationLevel:](self, "_purposeStringForAuthorizationLevel:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationServicesAuthorizationLevelController _purposeStringForAuthorizationLevel:](self, "_purposeStringForAuthorizationLevel:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationServicesAuthorizationLevelController _purposeStringForAuthorizationLevel:](self, "_purposeStringForAuthorizationLevel:", 2);
  v19 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v19;
  if (!self->_displayName || !v10)
    goto LABEL_4;
  v20 = (void *)MEMORY[0x1E0CB3940];
  if (v19)
  {
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("PURPOSE_STRING_COMBINED"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v14, v10, v9);
  }
  else
  {
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("PURPOSE_STRING_REDUCED"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v14, v10, v21);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_13:

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v17;
  }
LABEL_16:

  return v4;
}

- (id)_purposeStringForAuthorizationLevel:(unint64_t)a3
{
  void *authEntityBundle;
  _QWORD *p_isa;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v10;
  void *v11;
  void *v12;
  _Unwind_Exception *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  authEntityBundle = self->_authEntityBundle;
  if (!authEntityBundle)
    goto LABEL_15;
  p_isa = &self->super.super.super.super.super.super.isa;
  if (!self->_displayName)
    goto LABEL_10;
  if ((~(_BYTE)a3 & 6) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    p_isa = (_QWORD *)getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr;
    v17 = getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr;
    if (!getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr)
    {
      v5 = (void *)CoreLocationLibrary();
      p_isa = dlsym(v5, "kCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKey");
      v15[3] = (uint64_t)p_isa;
      getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr = (uint64_t)p_isa;
    }
    _Block_object_dispose(&v14, 8);
    if (p_isa)
    {
LABEL_14:
      objc_msgSend(authEntityBundle, "objectForInfoDictionaryKey:", *p_isa, v14);
      authEntityBundle = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
  }
  if ((a3 & 2) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    p_isa = (_QWORD *)getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr;
    v17 = getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr;
    if (!getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr)
    {
      v6 = (void *)CoreLocationLibrary();
      p_isa = dlsym(v6, "kCLCommonLocationWhenInUseUsageDescriptionKey");
      v15[3] = (uint64_t)p_isa;
      getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr = (uint64_t)p_isa;
    }
    _Block_object_dispose(&v14, 8);
    if (!p_isa)
      goto LABEL_27;
    goto LABEL_14;
  }
  if ((a3 & 4) == 0)
  {
LABEL_10:
    authEntityBundle = 0;
    goto LABEL_15;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v10 = (_QWORD *)getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr;
  v17 = getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr;
  if (!getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr)
  {
    v11 = (void *)CoreLocationLibrary();
    v10 = dlsym(v11, "kCLCommonLocationAlwaysUsageDescriptionKey");
    v15[3] = (uint64_t)v10;
    getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v14, 8);
  if (!v10)
  {
LABEL_28:
    v13 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }
  objc_msgSend(authEntityBundle, "objectForInfoDictionaryKey:", *v10, v14);
  authEntityBundle = (void *)objc_claimAutoreleasedReturnValue();
  if (!authEntityBundle)
  {
    authEntityBundle = (void *)p_isa[200];
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    p_isa = (_QWORD *)getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr;
    v17 = getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr;
    if (!getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr)
    {
      v12 = (void *)CoreLocationLibrary();
      p_isa = dlsym(v12, "kCLCommonLocationUsageDescriptionKey");
      v15[3] = (uint64_t)p_isa;
      getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr = (uint64_t)p_isa;
    }
    _Block_object_dispose(&v14, 8);
    if (!p_isa)
    {
      __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
LABEL_27:
      __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
      goto LABEL_28;
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = authEntityBundle;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)_usageTextForAuthorizationLevel:(unint64_t)a3
{
  void *v3;
  __CFString *v4;

  if (!a3)
  {
    v4 = CFSTR("NOT_DETERMINED_AUTHORIZATION_EXPLANATION");
LABEL_9:
    PUI_LocalizedStringForLocationServicesPrivacy(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if ((a3 & 2) != 0)
  {
    v4 = CFSTR("WHEN_IN_USE_AUTHORIZATION_EXPLANATION");
    goto LABEL_9;
  }
  if ((a3 & 4) != 0)
  {
    v4 = CFSTR("ALWAYS_AUTHORIZATION_EXPLANATION");
    goto LABEL_9;
  }
  v3 = 0;
  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  v6 = a4;
  -[PUILocationServicesAuthorizationLevelController tableView:didSelectRowAtIndexPath:](&v9, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = -[PUILocationServicesAuthorizationLevelController indexForIndexPath:](self, "indexForIndexPath:", v6, v9.receiver, v9.super_class);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PUILocationServicesAuthorizationLevelController specifierAtIndex:](self, "specifierAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[PUILocationServicesAuthorizationLevelController _setLocationAuthorizationLevelForSpecifier:](self, "_setLocationAuthorizationLevelForSpecifier:", v8);

  }
  -[PUILocationServicesAuthorizationLevelController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("LOCATION_SERVICES_AUTH_GROUP"), 1);
}

- (void)_setLocationAuthorizationLevelForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  int v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKey:](self->_details, "objectForKey:", self->_serviceKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_authMask = 0;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("LOCATION_SERVICES_AUTH_NOT_DETERMINED"));

  if (v8)
  {
    v9 = 0;
    self->_authMask = 0;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("LOCATION_SERVICES_AUTH_NEVER"));

    if (v12)
    {
      v9 = 0;
      v10 = 1;
      self->_authMask = 1;
      goto LABEL_10;
    }
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("LOCATION_SERVICES_AUTH_WHEN_IN_USE"));

    if (v14)
    {
      v10 = 0;
      v9 = 2;
      self->_authMask = 2;
      goto LABEL_10;
    }
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("LOCATION_SERVICES_AUTH_WHEN_IN_USE_APP_OR_WIDGET"));

    if (v16)
    {
      v10 = 0;
      self->_authMask = 2;
      v9 = 3;
      goto LABEL_10;
    }
    objc_msgSend(v4, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("LOCATION_SERVICES_AUTH_ALWAYS"));

    if (v25)
    {
      v9 = 0;
      self->_authMask = 4;
    }
    else
    {
      _PUILoggingFacility();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB1FB000, v26, OS_LOG_TYPE_DEFAULT, "Setting an unknown state for location services auth level.", buf, 2u);
      }

      v9 = 0;
    }
  }
  v10 = 1;
LABEL_10:
  -[PUILocationServicesAuthorizationLevelController specifierForID:](self, "specifierForID:", CFSTR("LOCATION_SERVICES_AUTH_GROUP"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationServicesAuthorizationLevelController _constructFooterForAuthorizationLevel:](self, "_constructFooterForAuthorizationLevel:", self->_authMask);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProperty:forKey:", v18, *MEMORY[0x1E0D80848]);

  objc_msgSend(getCLLocationManagerClass_0(), "setEntityAuthorization:withCorrectiveCompensationType:forLocationDictionary:", self->_authMask, 0, v5);
  -[PUILocationServicesAuthorizationLevelController _setLocationAuthorizationLevelMaskForAssociatedFramework:withCorrectiveCompensation:](self, "_setLocationAuthorizationLevelMaskForAssociatedFramework:withCorrectiveCompensation:", self->_authMask, 0);
  if ((v10 & 1) == 0)
  {
    v27 = 0;
    objc_msgSend(getCLLocationManagerClass_0(), "getIncidentalUseMode:forBundleIdentifier:", &v27, v6);
    if (v27)
    {
      _PUILoggingFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v29 = v9;
        _os_log_impl(&dword_1DB1FB000, v19, OS_LOG_TYPE_DEFAULT, "Setting incidental mode %d", buf, 8u);
      }

      objc_msgSend(getCLLocationManagerClass_0(), "setIncidentalUseMode:forBundleIdentifier:", v9, v6);
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.Maps"));

  if (v21)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.Maps.LocationAuthorizationChangedNotification"), 0, 0, 1u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.LocationServicesStateChanged"), 0);

  -[PUILocationServicesAuthorizationLevelController _updatePreciseLocationCell](self, "_updatePreciseLocationCell");
}

- (void)_setLocationAuthorizationLevelMaskForAssociatedFramework:(unint64_t)a3 withCorrectiveCompensation:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  NSString *serviceKey;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = *(_QWORD *)&a4;
  -[PUILocationServicesAuthorizationLevelController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (v14)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("frameworkBundlePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_10;
    serviceKey = self->_serviceKey;
    objc_msgSend(v14, "objectForKey:", CFSTR("appBundleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(serviceKey) = -[NSString isEqualToString:](serviceKey, "isEqualToString:", v11);

    if (!(_DWORD)serviceKey)
      goto LABEL_10;
    -[NSDictionary objectForKey:](self->_details, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(getCLLocationManagerClass_0(), "allowableAuthorizationForLocationDictionary:", v12);
    if ((v13 & a3) == 0)
    {
      if ((a3 & 4) == 0 || (v13 & 2) == 0)
        goto LABEL_9;
      a3 = 2;
    }
    objc_msgSend(getCLLocationManagerClass_0(), "setEntityAuthorization:withCorrectiveCompensationType:forLocationDictionary:", a3, v4, v12);
LABEL_9:

LABEL_10:
    v8 = v14;
  }

}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1576);
}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1592);
}

- (NSBundle)authEntityBundle
{
  return self->_authEntityBundle;
}

- (void)setAuthEntityBundle:(id)a3
{
  objc_storeStrong((id *)&self->_authEntityBundle, a3);
}

- (void)setCorrectiveCompensationSpecifiersGroup:(id)a3
{
  objc_storeStrong((id *)&self->_correctiveCompensationSpecifiersGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctiveCompensationSpecifiersGroup, 0);
  objc_storeStrong((id *)&self->_authEntityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
}

- (void)specifiers
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_1(&dword_1DB1FB000, a3, (uint64_t)a3, "No display name found for bundle: %@, dict: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

@end
