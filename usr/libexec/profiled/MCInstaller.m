@implementation MCInstaller

+ (id)sharedInstaller
{
  if (qword_1000FD910 != -1)
    dispatch_once(&qword_1000FD910, &stru_1000E3B60);
  return (id)qword_1000FD908;
}

- (MCInstaller)init
{
  MCInstaller *v2;
  NSMutableArray *v3;
  NSMutableArray *queuedProfiles;
  dispatch_queue_t v5;
  OS_dispatch_queue *purgatoryWorkerQueue;
  FLFollowUpController *v7;
  FLFollowUpController *followUpController;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCInstaller;
  v2 = -[MCInstaller init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedProfiles = v2->_queuedProfiles;
    v2->_queuedProfiles = v3;

    v5 = dispatch_queue_create("MCInstaller Purgatory worker queue", 0);
    purgatoryWorkerQueue = v2->_purgatoryWorkerQueue;
    v2->_purgatoryWorkerQueue = (OS_dispatch_queue *)v5;

    v7 = (FLFollowUpController *)objc_msgSend(objc_alloc((Class)FLFollowUpController), "initWithClientIdentifier:", CFSTR("com.apple.managedconfiguration.profiled"));
    followUpController = v2->_followUpController;
    v2->_followUpController = v7;

  }
  return v2;
}

- (id)identifiersOfInstalledProfilesWithFilterFlags:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiersOfProfilesWithFilterFlags:", v3));

  return v5;
}

- (id)pathToInstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allInstalledProfileIdentifiers"));

  if (objc_msgSend(v7, "containsObject:", v5))
  {
    if (a4 == 2)
      v8 = sub_1000443A8();
    else
      v8 = sub_1000443E4();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "MCHashedFilenameWithExtension:", CFSTR("stub")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v11));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)pathToUninstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uninstalledProfileIdentifiersForDevice:", a5));

  if (objc_msgSend(v8, "containsObject:", v6))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathToHoldingTankProfileDataForIdentifier:targetDevice:createDirectory:", v6, a5, 0));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)pathToInstalledProfileByUUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  unsigned int v24;
  id v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v26 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allInstalledProfileIdentifiers"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    v8 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v7)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
      v11 = objc_autoreleasePoolPush();
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[150], "sharedManifest"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allInstalledUserProfileIdentifiers"));
      v14 = objc_msgSend(v13, "containsObject:", v10);

      if (v14)
        v15 = sub_1000443A8();
      else
        v15 = sub_1000443E4();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "MCHashedFilenameWithExtension:", CFSTR("stub")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v18));
      v28 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v19, &v28));
      v21 = v20;
      v22 = 0;
      if (!v28)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUID"));
        v24 = objc_msgSend(v23, "isEqualToString:", v26);

        if (v24)
          v22 = v18;
        else
          v22 = 0;
        v8 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
      }

      objc_autoreleasePoolPop(v11);
      if (v22)
        break;
      if (v6 == (id)++v9)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    v22 = 0;
  }

  return v22;
}

- (id)popProfileDataAtHeadOfInstallationQueue
{
  void *v3;

  if (-[NSMutableArray count](self->_queuedProfiles, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queuedProfiles, "objectAtIndex:", 0));
    -[NSMutableArray removeObjectAtIndex:](self->_queuedProfiles, "removeObjectAtIndex:", 0);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_badProvisioningProfileError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCProvisioningProfileErrorDomain;
  v3 = MCErrorArray(CFSTR("PROVISIONING_ERROR_BAD_PROFILE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 25000, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  void ***v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  os_log_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  os_log_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void **v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void *v39;
  MCInstaller *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;

  v8 = a3;
  v9 = a5;
  v47 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:fileName:allowEmptyPayload:outError:](MCProfile, "profileWithData:fileName:allowEmptyPayload:outError:", v8, a4, 0, &v47));
  v11 = v47;
  if (!v11)
  {
    if (!objc_msgSend(v10, "isStub"))
      goto LABEL_32;
    v16 = _MCLogObjects[9];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Stub profile cannot be queued for installation", buf, 2u);
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _malformedPayloadErrorInternal:](self, "_malformedPayloadErrorInternal:", 1));
    if (!v11)
    {
LABEL_32:
      if (objc_msgSend(v10, "targetDeviceType"))
      {
        v36 = _NSConcreteStackBlock;
        v37 = 3221225472;
        v38 = sub_100044D6C;
        v39 = &unk_1000E3BB0;
        v40 = self;
        v17 = v10;
        v41 = v17;
        v18 = v9;
        v42 = v18;
        v19 = objc_retainBlock(&v36);
        switch(-[MCInstaller _targetValidationStatusForProfile:](self, "_targetValidationStatusForProfile:", v17, v36, v37, v38, v39, v40))
        {
          case 0:
            v20 = _MCLogObjects[9];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = v20;
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", objc_msgSend(v17, "targetDeviceType")));
              *(_DWORD *)buf = 138543362;
              v49 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Profile-defined target-device-type %{public}@ successfully validated", buf, 0xCu);

            }
            -[MCInstaller _queueProfileData:profile:forDevice:completion:](self, "_queueProfileData:profile:forDevice:completion:", v8, v17, objc_msgSend(v17, "targetDeviceType"), v18);
            break;
          case 1:
            v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceMismatchError](self, "_targetDeviceMismatchError"));
            goto LABEL_25;
          case 2:
            v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDevicePreflightFailedError](self, "_targetDevicePreflightFailedError"));
            goto LABEL_25;
          case 3:
            v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceUnavailableError](self, "_targetDeviceUnavailableError"));
            goto LABEL_25;
          case 4:
            v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceArchivedError](self, "_targetDeviceArchivedError"));
LABEL_25:
            v35 = (void *)v34;
            ((void (*)(void ***, uint64_t))v19[2])(v19, v34);

            break;
          default:
            break;
        }

        v29 = v41;
      }
      else
      {
        v23 = +[MCProfile thisDeviceType](MCProfile, "thisDeviceType");
        if (v23 != (id)1)
        {
          v30 = v23;
          v31 = _MCLogObjects[9];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v31;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
            *(_DWORD *)buf = 138543618;
            v49 = v33;
            v50 = 2050;
            v51 = v30;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Profile '%{public}@' does not define a target device. Assuming %{public}lu...", buf, 0x16u);

          }
          -[MCInstaller _queueProfileData:profile:forDevice:completion:](self, "_queueProfileData:profile:forDevice:completion:", v8, v10, v30, v9);
          goto LABEL_28;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _preflightProfileForInstallationOnWatch:](self, "_preflightProfileForInstallationOnWatch:", v10));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _preflightProfileForInstallationOnHomePod:](self, "_preflightProfileForInstallationOnHomePod:", v10));
        v26 = _MCLogObjects[9];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
          *(_DWORD *)buf = 138543362;
          v49 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Profile '%{public}@' does not define a target device. Asking user to resolve...", buf, 0xCu);

        }
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100044D58;
        v43[3] = &unk_1000E3B88;
        v43[4] = self;
        v44 = v8;
        v45 = v10;
        v46 = v9;
        +[MCTargetDeviceResolver showResolutionPromptWithWatchOption:homePodOption:completionBlock:](MCTargetDeviceResolver, "showResolutionPromptWithWatchOption:homePodOption:completionBlock:", v24 == 0, v25 == 0, v43);

        v29 = v44;
      }

LABEL_28:
      v11 = 0;
      goto LABEL_29;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _malformedPayloadErrorWithUnderlyingError:](self, "_malformedPayloadErrorWithUnderlyingError:", v11));
  v13 = _MCLogObjects[9];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543362;
    v49 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Profile cannot be queued for installation. Error: %{public}@", buf, 0xCu);

  }
  (*((void (**)(id, void *, void *, uint64_t))v9 + 2))(v9, v12, v10, 99);

LABEL_29:
}

- (int64_t)_targetValidationStatusForProfile:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  int IsAppleTV;

  v4 = a3;
  v5 = 1;
  switch((unint64_t)objc_msgSend(v4, "targetDeviceType"))
  {
    case 1uLL:
      if ((MCGestaltIsPhone() & 1) == 0)
      {
        IsAppleTV = MCGestaltIsiPad();
        goto LABEL_17;
      }
      v5 = 0;
      break;
    case 2uLL:
      if ((MCGestaltIsPhone() & 1) == 0 && !MCGestaltIsWatch())
        goto LABEL_19;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _preflightProfileForInstallationOnWatch:](self, "_preflightProfileForInstallationOnWatch:", v4));

      if (v6)
        goto LABEL_13;
      v7 = +[MCTargetDeviceResolver watchAvailability](MCTargetDeviceResolver, "watchAvailability");
      if (v7 >= 3)
        v5 = 3;
      else
        v5 = qword_1000B1540[v7];
      break;
    case 3uLL:
      if ((MCGestaltIsPhone() & 1) != 0 || (MCGestaltIsiPad() & 1) != 0 || MCGestaltIsHomePod())
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _preflightProfileForInstallationOnHomePod:](self, "_preflightProfileForInstallationOnHomePod:", v4));

        if (v8)
        {
LABEL_13:
          v5 = 2;
        }
        else if (+[MCTargetDeviceResolver isHomePodAvailable](MCTargetDeviceResolver, "isHomePodAvailable"))
        {
          v5 = 0;
        }
        else
        {
          v5 = 3;
        }
      }
      else
      {
LABEL_19:
        v5 = 1;
      }
      break;
    case 4uLL:
      IsAppleTV = MCGestaltIsAppleTV();
      goto LABEL_17;
    case 6uLL:
      IsAppleTV = MCGestaltIsVisionDevice();
LABEL_17:
      v5 = IsAppleTV ^ 1u;
      break;
    default:
      break;
  }

  return v5;
}

+ (void)isInteractiveProfileInstallationAllowedBySDP:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  char v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload payloadsRequiringRatchetWithStolenDeviceProtection](MCPayload, "payloadsRequiringRatchetWithStolenDeviceProtection"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloads"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "containsObject:", objc_opt_class(v15)))
        {
          v16 = objc_opt_class(MCMDMPayload);
          isKindOfClass = objc_opt_isKindOfClass(v15, v16);
          v11 |= isKindOfClass;
          v12 |= isKindOfClass ^ 1;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }

  if ((v12 & 1) != 0 || (v11 & 1) != 0)
    +[DMCRatchet isAuthorizedForOperation:completion:](DMCRatchet, "isAuthorizedForOperation:completion:", v11 & ~v12 & 1, v6);
  else
    v6[2](v6, 0);

}

- (void)_queueProfileData:(id)a3 profile:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id, uint64_t);
  os_log_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  os_log_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  void (**v40)(id, _QWORD, id, uint64_t);
  unint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, id, uint64_t))a6;
  if (a5 == 99)
  {
    v13 = _MCLogObjects[9];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      *(_DWORD *)buf = 138543362;
      v43 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Profile %{public}@ cancelled queueing for installation", buf, 0xCu);

    }
    v12[2](v12, 0, v11, 99);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v17 = objc_msgSend(v16, "effectiveRestrictedBoolForSetting:", MCFeatureUIConfigurationProfileInstallationAllowed);

    if (v17 != 2)
    {
      if (a5 == 6
        && (+[DMCFeatureFlags isVisionProfileEnrollEnabled](DMCFeatureFlags, "isVisionProfileEnrollEnabled") & 1) == 0&& (v27 = objc_opt_class(MCConfigurationProfile), (objc_opt_isKindOfClass(v11, v27) & 1) != 0)&& objc_msgSend(v11, "isMDMProfile"))
      {
        v28 = _MCLogObjects[9];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = v28;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", 6));
          *(_DWORD *)buf = 138543618;
          v43 = v30;
          v44 = 2114;
          v45 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Profile %{public}@ failed queueing for %{public}@ because profile-driven MDM enrollment is blocked", buf, 0x16u);

        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _profileDrivenEnrollmentBlocked](self, "_profileDrivenEnrollmentBlocked"));
        ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v32, v11, 6);
      }
      else
      {
        if (!objc_msgSend(v11, "isUserEnrollmentProfile"))
        {
          if (a5 == 3)
          {
            -[MCInstaller _continueQueueingProfile:profileData:forDevice:completion:](self, "_continueQueueingProfile:profileData:forDevice:completion:", v11, v10, 3, v12);
          }
          else
          {
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472;
            v37[2] = sub_1000456B8;
            v37[3] = &unk_1000E3BD8;
            v40 = v12;
            v37[4] = self;
            v38 = v11;
            v41 = a5;
            v39 = v10;
            +[MCInstaller isInteractiveProfileInstallationAllowedBySDP:completion:](MCInstaller, "isInteractiveProfileInstallationAllowedBySDP:completion:", v38, v37);

          }
          goto LABEL_26;
        }
        v33 = _MCLogObjects[9];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", a5));
          *(_DWORD *)buf = 138543618;
          v43 = v35;
          v44 = 2114;
          v45 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Profile %{public}@ failed queueing for %{public}@ because profile-driven user enrollment is not supported", buf, 0x16u);

        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _profileDrivenUserEnrollmentNotSupportedError](self, "_profileDrivenUserEnrollmentNotSupportedError"));
        ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v32, v11, a5);
      }

      goto LABEL_26;
    }
    v18 = MCErrorRestrictionCauseProfile;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v20 = objc_msgSend(v19, "effectiveRestrictedBoolForSetting:", MCFeatureLockdownModeAllowed);

    if (v20 == 1)
    {
      v21 = MCErrorRestrictionCauseLockdownMode;

      v18 = v21;
    }
    v22 = _MCLogObjects[9];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", a5));
      *(_DWORD *)buf = 138543618;
      v43 = v24;
      v44 = 2114;
      v45 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Profile %{public}@ failed queueing for %{public}@ because UI profile installation is restricted", buf, 0x16u);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _uiProfileInstallationDisabledTopLevelErrorWithCause:](self, "_uiProfileInstallationDisabledTopLevelErrorWithCause:", v18));
    ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v26, v11, a5);

  }
LABEL_26:

}

- (void)_continueQueueingProfile:(id)a3 profileData:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id, unint64_t);
  void *v13;
  OS_dispatch_queue *purgatoryWorkerQueue;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  _BYTE *v29;
  unint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, id, unint64_t))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", a5));
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:](MCTargetDeviceResolver, "purgatorySupportedForDevice:", a5))
  {
    *(_QWORD *)v37 = 0;
    *(_QWORD *)&v37[8] = v37;
    *(_QWORD *)&v37[16] = 0x3032000000;
    v38 = sub_100045AE0;
    v39 = sub_100045AF0;
    purgatoryWorkerQueue = self->_purgatoryWorkerQueue;
    v40 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045AF8;
    block[3] = &unk_1000E3C00;
    block[4] = self;
    v27 = v11;
    v15 = v10;
    v29 = v37;
    v30 = a5;
    v28 = v15;
    dispatch_sync((dispatch_queue_t)purgatoryWorkerQueue, block);
    v16 = *(_QWORD *)(*(_QWORD *)&v37[8] + 40);
    v17 = _MCLogObjects[9];
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&v37[8] + 40), "MCVerboseDescription"));
        *(_DWORD *)buf = 138543874;
        v32 = v19;
        v33 = 2114;
        v34 = v13;
        v35 = 2114;
        v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Profile %{public}@ failed queueing for %{public}@ with purgatory error: %{public}@", buf, 0x20u);

      }
      v12[2](v12, *(_QWORD *)(*(_QWORD *)&v37[8] + 40), v15, a5);
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        v33 = 2114;
        v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Profile %{public}@ succesfully queued in holding tank for %{public}@", buf, 0x16u);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _installationHaltedTopLevelError](self, "_installationHaltedTopLevelError"));
      ((void (**)(id, void *, id, unint64_t))v12)[2](v12, v25, v15, a5);

    }
    _Block_object_dispose(v37, 8);

  }
  else
  {
    -[NSMutableArray addObject:](self->_queuedProfiles, "addObject:", v11);
    v21 = _MCLogObjects[9];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      *(_DWORD *)v37 = 138543618;
      *(_QWORD *)&v37[4] = v23;
      *(_WORD *)&v37[12] = 2114;
      *(_QWORD *)&v37[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Profile %{public}@ successfully queued for Settings jump for %{public}@", v37, 0x16u);

    }
    v12[2](v12, 0, v10, a5);
  }

}

- (id)_malformedPayloadErrorInternal:(BOOL)a3
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (uint64_t *)&MCProfileErrorDomain;
  if (!a3)
    v3 = (uint64_t *)&MCInstallationErrorDomain;
  v4 = *v3;
  if (a3)
    v5 = 1000;
  else
    v5 = 4000;
  v6 = MCErrorArray(CFSTR("MALFORMED_PAYLOAD_ERROR_DESCRIPTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, v5, v7, MCErrorTypeFatal, 0));

  return v8;
}

- (id)_malformedPayloadErrorWithUnderlyingError:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = MCInstallationErrorDomain;
  v4 = a3;
  v5 = MCErrorArray(CFSTR("MALFORMED_PAYLOAD_ERROR_DESCRIPTION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 4000, v6, v4, MCErrorTypeFatal, 0));

  return v7;
}

- (id)_targetDeviceErrorWithUnderlyingError:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = MCInstallationErrorDomain;
  v4 = a3;
  v5 = MCErrorArray(CFSTR("ERROR_PROFILE_TARGET_DESCRIPTION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 4035, v6, v4, MCErrorTypeFatal, 0));

  return v7;
}

- (id)_targetDeviceUnavailableError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCProfileErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_PROFILE_TARGET_UNAVAILABLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 1012, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_targetDeviceArchivedError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCProfileErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_PROFILE_TARGET_ARCHIVED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 1014, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_targetDevicePreflightFailedError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCProfileErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_PROFILE_TARGET_PREFLIGHT_FAILED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 1011, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_targetDeviceMismatchError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCProfileErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_PROFILE_TARGET_MISMATCH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 1015, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_uiProfileInstallationDisabledTopLevelErrorWithCause:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;

  v3 = a3;
  v4 = MCInstallationErrorDomain;
  v5 = MCErrorArray(CFSTR("ERROR_PROFILE_UI_INSTALLATION_DISABLED"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = MCErrorTypeFatal;
  if (v3)
  {
    v11 = MCErrorRestrictionCauseKey;
    v12 = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:](NSError, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:", v4, 4037, v6, 0, 0, 0, v7, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:](NSError, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:", v4, 4037, v6, 0, 0, 0, MCErrorTypeFatal, 0));
  }

  return v9;
}

- (id)_installationHaltedTopLevelError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = MCInstallationErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_PROFILE_UI_INSTALLATION_HALTED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = MCProfileErrorDomain;
  v6 = MCErrorArray(CFSTR("ERROR_PROFILE_UI_INSTALLATION_HALTED"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = MCErrorTypeFatal;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v5, 1013, v7, MCErrorTypeFatal, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v2, 4036, v4, v9, v8));

  return v10;
}

- (id)_invalidInputError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCInstallationErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_USER_INPUT_INVALID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4006, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_userCancelledErrorWithFriendlyName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = MCInstallationErrorDomain;
  v4 = MCErrorArray(CFSTR("ERROR_PROFILE_USER_CANCELLED_P_ID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 4004, v5, MCErrorTypeFatal, a3, 0));

  return v6;
}

- (id)_profileDrivenEnrollmentBlocked
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCInstallationErrorDomain;
  v3 = MCErrorArrayByDevice(CFSTR("ERROR_PROFILE_DRIVEN_ENROLLMENT_BLOCKED"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4054, v4, MCErrorTypeFatal));

  return v5;
}

- (id)_profileDrivenUserEnrollmentNotSupportedError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCInstallationErrorDomain;
  v3 = MCErrorArrayByDevice(CFSTR("ERROR_PROFILE_DRIVEN_USER_ENROLLMENT_NOT_SUPPORTED"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4055, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (BOOL)_promptUserForComplianceWithRestrictions:(id)a3 handler:(id)a4 interactionClient:(id)a5 outPasscode:(id *)a6 outError:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  NSDictionary *currentlyInstallingRestrictions;
  id v19;
  BOOL v20;
  unsigned __int8 v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  signed int v31;
  signed int v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  unsigned int v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSDictionary *v61;
  void *v63;
  id *v64;
  id *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  signed int v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  _QWORD v78[8];
  _QWORD v79[8];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    v17 = objc_msgSend(v16, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v13, 0);

    if (v17)
    {
      currentlyInstallingRestrictions = self->_currentlyInstallingRestrictions;
      self->_currentlyInstallingRestrictions = 0;

      v19 = 0;
      goto LABEL_48;
    }
    v75 = 0;
    v21 = objc_msgSend(v15, "requestCurrentPasscodeOutPasscode:", &v75);
    v22 = v75;
    if ((v21 & 1) == 0)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "profile"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "friendlyName"));
      v19 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _userCancelledErrorWithFriendlyName:](self, "_userCancelledErrorWithFriendlyName:", v58));

LABEL_42:
LABEL_43:

      v61 = self->_currentlyInstallingRestrictions;
      self->_currentlyInstallingRestrictions = 0;

      if (v19)
      {
        if (a7)
          *a7 = objc_retainAutorelease(v19);
        v20 = 0;
        if (a6)
          *a6 = &stru_1000E4AA0;
        goto LABEL_49;
      }
LABEL_48:
      v20 = 1;
LABEL_49:

      goto LABEL_50;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    v74 = 0;
    objc_msgSend(v23, "unlockDeviceWithPasscode:outError:", v22, &v74);
    v19 = v74;

    if (v19)
      goto LABEL_43;
    v68 = v22;
    v64 = a7;
    v65 = a6;
    v66 = v14;
    objc_storeStrong((id *)&self->_currentlyInstallingRestrictions, a3);
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "effectiveValueForSetting:", MCFeaturePasscodeKeyboardComplexity));
    v26 = objc_msgSend(v25, "intValue");

    v73 = 0;
    v27 = +[MCPasscodeManagerWriter unlockScreenTypeForRestrictions:outSimplePasscodeType:](MCPasscodeManagerWriter, "unlockScreenTypeForRestrictions:outSimplePasscodeType:", v13, &v73);
    if (v27 <= v26)
      v28 = v26;
    else
      v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "effectiveValueForSetting:", MCFeatureSimplePasscodeComplexity));
    v31 = objc_msgSend(v30, "intValue");

    v32 = v73;
    if (v73 < v31)
    {
      v73 = v31;
      v32 = v31;
    }
    if (v32)
      v33 = 3;
    else
      v33 = 4;
    if (v32 == 1)
      v34 = 7;
    else
      v34 = v33;
    if (v28)
      v34 = 3;
    v79[0] = CFSTR("0");
    if (v28 == 1)
      v35 = 5;
    else
      v35 = v34;
    v78[0] = kMCIDUUIDKey;
    v78[1] = kMCIDTitleKey;
    v36 = MCLocalizedString(CFSTR("NEW_POLICY_ACCEPT_PROMPT_TITLE"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v79[1] = v69;
    v78[2] = kMCIDDescriptionKey;
    v37 = MCLocalizedString(CFSTR("NEW_POLICY_ACCEPT_PROMPT_DESCRIPTION"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v79[2] = v38;
    v78[3] = kMCIDRetypeDescriptionKey;
    v39 = MCLocalizedString(CFSTR("NEW_POLICY_ACCEPT_RETYPE_DESCRIPTION"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v79[3] = v40;
    v78[4] = kMCIDMismatchDescriptionKey;
    v41 = MCLocalizedString(CFSTR("NEW_POLICY_ACCEPT_MISMATCH_DESCRIPTION"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v79[4] = v42;
    v78[5] = kMCIDFinePrintKey;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter localizedDescriptionOfPasscodePolicyFromRestrictions:](MCPasscodeManagerWriter, "localizedDescriptionOfPasscodePolicyFromRestrictions:", v13));
    v79[5] = v43;
    v78[6] = kMCIDFieldTypeKey;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v35));
    v78[7] = kMCIDFlagsKey;
    v79[6] = v44;
    v79[7] = &off_1000ED1A8;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 8));
    v46 = objc_msgSend(v45, "mutableCopy");

    v63 = v46;
    v76 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));
    v77 = v47;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));

    v48 = 0;
    v49 = kMCIDResponseKey;
    while (1)
    {
      v72 = 0;
      v50 = objc_msgSend(v15, "requestUserInput:delegate:outResult:", v70, self, &v72);
      v51 = v72;
      v52 = v51;
      if (!v50 || !v51)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "profile"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "friendlyName"));
        v19 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _userCancelledErrorWithFriendlyName:](self, "_userCancelledErrorWithFriendlyName:", v59));

        goto LABEL_34;
      }
      if (!objc_msgSend(v51, "count"))
      {
        v19 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _invalidInputError](self, "_invalidInputError"));
        goto LABEL_35;
      }
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectAtIndex:", 0));
      if (!objc_msgSend(v53, "count"))
        break;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectAtIndex:", 0));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndex:", 0));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", v49));

      v48 = v56;
      if ((+[MCPasscodeManagerWriter passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:](MCPasscodeManagerWriter, "passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:", v56, v13, 1, 0) & 1) != 0)goto LABEL_36;
    }
    v19 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _invalidInputError](self, "_invalidInputError"));
LABEL_34:

LABEL_35:
    v56 = v48;
    if (v19)
      goto LABEL_41;
LABEL_36:
    v71 = 0;
    objc_msgSend(v67, "changePasscodeFrom:to:skipRecovery:senderBundleID:outError:", v68, v56, 0, CFSTR("com.apple.managedconfiguration.profiled.MCInstaller"), &v71);
    v60 = v71;
    if (v60)
    {
      v19 = v60;
    }
    else
    {
      -[MCInstaller _updateCDPWithNewPasscode:passcodeType:](self, "_updateCDPWithNewPasscode:passcodeType:", v56, v73);
      if (v65)
      {
        v48 = objc_retainAutorelease(v56);
        v19 = 0;
        *v65 = v48;
        goto LABEL_41;
      }
      v19 = 0;
    }
    v48 = v56;
LABEL_41:

    a6 = v65;
    v14 = v66;
    a7 = v64;
    v57 = v67;
    v22 = v68;
    goto LABEL_42;
  }
  v20 = 1;
LABEL_50:

  return v20;
}

- (void)_updateCDPWithNewPasscode:(id)a3 passcodeType:(int)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  v5 = a3;
  v6 = objc_alloc_init((Class)CDPContext);
  objc_msgSend(v6, "setType:", 6);
  if (a4 == -1)
    v7 = 3;
  else
    v7 = 2;
  v8 = objc_msgSend(objc_alloc((Class)CDPStateController), "initWithContext:", v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100046AA4;
  v9[3] = &unk_1000E3C20;
  v9[4] = v7;
  objc_msgSend(v8, "localSecretChangedTo:secretType:completion:", v5, v7, v9);

}

- (BOOL)_promptUserForMAIDSignIn:(id)a3 personaID:(id)a4 handler:(id)a5 interactionClient:(id)a6 outError:(id *)a7
{
  id v11;
  unsigned int v12;
  char v14;

  v11 = a5;
  v14 = 0;
  v12 = objc_msgSend(a6, "requestMAIDSignIn:personaID:outError:isCancelled:", a3, a4, a7, &v14);
  if (a7 && v14)
    *a7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userCancelledError"));
  if (a7 && v12 != 1 && !*a7)
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4038, 0, MCErrorTypeFatal));

  return v12;
}

- (void)_promptUserForRestoreWithAccountID:(id)a3 personaID:(id)a4 interactionClient:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = _MCLogObjects[9];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting managed restore...", v11, 2u);
  }
  objc_msgSend(v9, "requestManagedRestoreWithManagedAppleID:personaID:", v7, v8);

}

- (id)_validateNewMDMProfile:(id)a3 installationOption:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  void *v21;

  v5 = kMCInstallProfileOptionInstallationSource;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", v5));
  v8 = objc_msgSend(v6, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assignedManagedAppleID"));
  if (v11
    && (objc_msgSend(v7, "isEqualToString:", kDMCProfileInstallationSourceAccountDrivenUserEnrollment) & 1) == 0)
  {
    v16 = objc_msgSend(v7, "isEqualToString:", kDMCProfileInstallationSourceAccountDrivenDeviceEnrollment);

    if ((v16 & 1) == 0)
    {
      v17 = MCInstallationErrorDomain;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "friendlyName"));
      v21 = v12;
      v18 = CFSTR("MDM_ERROR_PROFILE_CONTAINS_ASSIGNED_MAID_KEY");
LABEL_14:
      v19 = MCErrorArray(v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v17, 4022, v13, MCErrorTypeFatal, v21, 0));
      goto LABEL_15;
    }
  }
  else
  {

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enrollmentMode"));
  if (objc_msgSend(v12, "isEqualToString:", kMDMEnrollmentModeBYOD)
    && (objc_msgSend(v7, "isEqualToString:", kDMCProfileInstallationSourceAccountDrivenUserEnrollment) & 1) == 0)
  {

LABEL_13:
    v17 = MCInstallationErrorDomain;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "friendlyName"));
    v21 = v12;
    v18 = CFSTR("MDM_ERROR_PROFILE_CONTAINS_INVALID_ENROLLMENT_MODE_KEY");
    goto LABEL_14;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enrollmentMode"));
  if (!objc_msgSend(v13, "isEqualToString:", kMDMEnrollmentModeADDE))
  {
    v15 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v14 = objc_msgSend(v7, "isEqualToString:", kDMCProfileInstallationSourceAccountDrivenDeviceEnrollment);

  if ((v14 & 1) == 0)
    goto LABEL_13;
  v15 = 0;
LABEL_16:

  return v15;
}

- (id)_validateMDMReplacementNewProfile:(id)a3 oldProfile:(id)a4 client:(id)a5
{
  void *v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  int v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  int v30;
  os_log_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  os_log_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  unsigned int v51;
  os_log_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  int v56;
  NSMutableArray *v57;
  int v58;
  void *v59;
  void *v60;
  unsigned __int8 v61;
  os_log_t v62;
  NSObject *v63;
  void *v64;
  void *v65;
  int v66;
  os_log_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  unsigned int v71;
  unsigned int v72;
  os_log_t v73;
  NSObject *v74;
  unsigned int v75;
  unsigned int v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  unint64_t v82;
  id v83;
  uint64_t v85;
  uint64_t v86;
  int v88;
  unsigned int v89;
  int v90;
  uint8_t buf[4];
  _BYTE v92[10];
  void *v93;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v7, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = objc_msgSend(v8, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = objc_opt_new(NSMutableArray);
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "managedAppleIDName"));
  if (!v16)
    goto LABEL_3;
  v17 = (void *)v16;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedAppleIDName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "managedAppleIDName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lowercaseString"));
  v21 = objc_msgSend(v18, "isEqualToString:", v20);

  if ((v21 & 1) == 0)
  {
    v23 = _MCLogObjects[9];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = v23;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedAppleIDName"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "managedAppleIDName"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v92 = v5;
      *(_WORD *)&v92[8] = 2114;
      v93 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "appleID doesn't match! Old managedAppleIDName:%{public}@, new managedAppleIDName: %{public}@", buf, 0x16u);

    }
    -[NSMutableArray addObject:](v15, "addObject:", kMDMManagedAppleIDKey);
    v22 = 1;
  }
  else
  {
LABEL_3:
    v22 = 0;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enrollmentMode"));
  if (!v26)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "enrollmentMode"));
    if (!v5)
      goto LABEL_11;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enrollmentMode"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "enrollmentMode"));
  v29 = objc_msgSend(v27, "isEqualToString:", v28);

  if (v26)
  {

    if ((v29 & 1) != 0)
    {
LABEL_11:
      v30 = 0;
      goto LABEL_16;
    }
  }
  else
  {

    if ((v29 & 1) != 0)
      goto LABEL_11;
  }
  v31 = _MCLogObjects[9];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enrollmentMode"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "enrollmentMode"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v92 = v33;
    *(_WORD *)&v92[8] = 2114;
    v93 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "enrollmentMode doesn't match! Old enrollmentMode:%{public}@, new enrollmentMode: %{public}@", buf, 0x16u);

  }
  -[NSMutableArray addObject:](v15, "addObject:", kMDMEnrollmentModeKey);
  v30 = 1;
LABEL_16:
  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requiredAppIDForMDM"));
  if (v35
    && (v36 = (void *)v35,
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requiredAppIDForMDM")),
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requiredAppIDForMDM")),
        v39 = objc_msgSend(v37, "isEqualToNumber:", v38),
        v38,
        v37,
        v36,
        (v39 & 1) == 0))
  {
    v40 = _MCLogObjects[9];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requiredAppIDForMDM"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requiredAppIDForMDM"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v92 = v42;
      *(_WORD *)&v92[8] = 2114;
      v93 = v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "requiredAppIDForMDM doesn't match! Old requiredAppIDForMDM:%{public}@, new requiredAppIDForMDM: %{public}@", buf, 0x16u);

    }
    -[NSMutableArray addObject:](v15, "addObject:", kMDMRequiredAppIDForMDMKey);
    v90 = 1;
  }
  else
  {
    v90 = 0;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topic"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topic"));
  v46 = objc_msgSend(v44, "isEqualToString:", v45);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[MCActivationUtilities sharedInstance](MCActivationUtilities, "sharedInstance"));
  LODWORD(v45) = objc_msgSend(v47, "isHRNMode");

  if ((v45 | 2) == 2 || (v46 & 1) != 0)
  {
    v48 = 0;
  }
  else
  {
    v62 = _MCLogObjects[9];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = v62;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topic"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topic"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v92 = v64;
      *(_WORD *)&v92[8] = 2114;
      v93 = v65;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "topic doesn't match! Old topic:%{public}@, new topic: %{public}@", buf, 0x16u);

    }
    -[NSMutableArray addObject:](v15, "addObject:", kMDMTopicKey);
    v48 = 1;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverURLString"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serverURLString"));
  v51 = objc_msgSend(v49, "isEqualToString:", v50);

  v89 = v51;
  if ((v51 & 1) == 0)
  {
    v52 = _MCLogObjects[9];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = v52;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverURLString"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serverURLString"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v92 = v50;
      *(_WORD *)&v92[8] = 2114;
      v93 = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "serverURLString doesn't match! Old serverURLString:%{public}@, new serverURLString: %{public}@", buf, 0x16u);

    }
    -[NSMutableArray addObject:](v15, "addObject:", kMDMServerURLKey);
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "checkInURLString"));
  if (v55 || (v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "checkInURLString"))) != 0)
  {
    v88 = v48;
    v56 = v30;
    v57 = v15;
    v58 = v22;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "checkInURLString"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "checkInURLString"));
    v61 = objc_msgSend(v59, "isEqualToString:", v60);

    if (v55)
    else

    v22 = v58;
    if ((v61 & 1) != 0)
    {
      v66 = 0;
      v15 = v57;
    }
    else
    {
      v67 = _MCLogObjects[9];
      v15 = v57;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v68 = v67;
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "checkInURLString"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "checkInURLString"));
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v92 = v69;
        *(_WORD *)&v92[8] = 2114;
        v93 = v70;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "checkInURLString doesn't match! Old checkInURLString:%{public}@, new checkInURLString: %{public}@", buf, 0x16u);

      }
      -[NSMutableArray addObject:](v57, "addObject:", kMDMCheckInURLKey);
      v66 = 1;
    }
    v30 = v56;
    v48 = v88;
  }
  else
  {
    v66 = 0;
  }
  v71 = objc_msgSend(v11, "supportUserChannel");
  v72 = v71 ^ objc_msgSend(v14, "supportUserChannel");
  if (v72 == 1)
  {
    v73 = _MCLogObjects[9];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v74 = v73;
      v75 = objc_msgSend(v11, "supportUserChannel");
      v76 = objc_msgSend(v14, "supportUserChannel");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v92 = v75;
      *(_WORD *)&v92[4] = 1024;
      *(_DWORD *)&v92[6] = v76;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "supportUserChannel doesn't match! Old supportUserChannel:%d, new supportUserChannel: %d", buf, 0xEu);

    }
    -[NSMutableArray addObject:](v15, "addObject:", kMDMUserChannelCapability);
  }
  if (((v72 | v30 | v22 | v48 | v90 | v66 | v89 ^ 1) & 1) != 0)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v15, "componentsJoinedByString:", CFSTR(", ")));
    v78 = MCMDMErrorDomain;
    v79 = MCErrorArray(CFSTR("MDM_ERROR_REPLACEMENT_MISMATCH"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v78, 12012, v80, MCErrorTypeFatal, v77, 0));

  }
  else
  {
    if (a5
      || (v82 = (unint64_t)objc_msgSend(v11, "accessRights"),
          v83 = (id)((unint64_t)objc_msgSend(v14, "accessRights") | v82),
          v83 == objc_msgSend(v11, "accessRights")))
    {
      v81 = 0;
      goto LABEL_53;
    }
    v85 = MCMDMErrorDomain;
    v86 = MCErrorArray(CFSTR("MDM_ERROR_REPLACEMENT_TOO_MUCH_RIGHTS"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(v86);
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v85, 12012, v77, MCErrorTypeFatal, 0));
  }

LABEL_53:
  return v81;
}

- (id)_guardAgainstNoMDMPayloadWithNewProfile:(id)a3 oldProfile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    v8 = objc_msgSend(v5, "isMDMProfile");
  else
    v8 = 0;
  v9 = objc_opt_class(MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0 && ((v8 | objc_msgSend(v6, "isMDMProfile") ^ 1) & 1) == 0)
  {
    v11 = MCInstallationErrorDomain;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "friendlyName"));
    v13 = MCErrorArray(CFSTR("ERROR_PROFILE_MDM_REPLACEMENT_P_OLD_ID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v11, 4015, v14, MCErrorTypeFatal, v12, 0));
    v10 = objc_msgSend(v15, "MCCopyAsPrimaryError");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_deviceLockedError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCInstallationErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_DEVICE_LOCKED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4009, v4, MCErrorTypeFatal, 0));

  return v5;
}

+ (id)deviceNotSupervisedError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = MCChaperoneErrorDomain;
  v3 = MCErrorArray(CFSTR("CHAPERONE_DEVICE_NOT_CHAPERONED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 29000, v4, MCErrorTypeFatal, 0));
  v6 = objc_msgSend(v5, "MCCopyAsPrimaryError");

  return v6;
}

+ (id)deviceIsSupervisedError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = MCChaperoneErrorDomain;
  v3 = MCErrorArray(CFSTR("CHAPERONE_DEVICE_IS_CHAPERONED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 29004, v4, MCErrorTypeFatal, 0));
  v6 = objc_msgSend(v5, "MCCopyAsPrimaryError");

  return v6;
}

+ (id)notInstalledByMDMError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCInstallationErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_PROFILE_MDM_ONLY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4021, v4, MCErrorTypeFatal, 0));

  return v5;
}

+ (id)notSupportedUnderMultiUserModeError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCInstallationErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_NOT_SUPPORTED_UNDER_MULTIUSER_MODE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4047, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_installProfileHandler:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  unsigned int v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int isKindOfClass;
  void *v36;
  unsigned int v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  unsigned int v70;
  void *v71;
  void **v72;
  void *v73;
  id v74;
  void *v75;
  _BOOL4 v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  id v89;
  NSObject *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  void *v103;
  unsigned int v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  unsigned int v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  unsigned int v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  unsigned int v128;
  void *v129;
  void *v130;
  unsigned int v131;
  void *v132;
  void *v133;
  void *v134;
  NSObject *v135;
  void *v136;
  void *v137;
  unsigned int v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  void *v146;
  id *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  id v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  id v161;
  id v162;
  void *v163;
  unsigned int v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  id v170;
  void *v171;
  id v172;
  uint64_t v173;
  void **p_vtable;
  uint64_t v175;
  uint64_t v176;
  id v177;
  id v178;
  uint64_t v179;
  void *i;
  void *v181;
  _BOOL4 v182;
  void *v183;
  unsigned __int8 v184;
  void *v185;
  unsigned __int8 v186;
  void *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  id v191;
  id v192;
  uint64_t v193;
  id v194;
  void *v195;
  unsigned int v196;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  uint64_t v201;
  void *v202;
  id v203;
  uint64_t v204;
  void *j;
  id v206;
  id v207;
  id v208;
  void *v209;
  id *v210;
  void *v211;
  void *v212;
  void *v213;
  id *v214;
  id *v215;
  int v216;
  void *v217;
  id v218;
  void *v219;
  __CFString *v220;
  _BOOL4 v221;
  char v222;
  id v223;
  id v224;
  id v225;
  void *v226;
  id v227;
  NSObject *v228;
  id v229;
  void *v230;
  void *v231;
  void *v232;
  id v233;
  NSObject *v234;
  id v235;
  id *v236;
  id v237;
  void *v238;
  void *v239;
  id v240;
  id v241;
  uint64_t v242;
  id v243;
  uint64_t v244;
  void *v245;
  _BOOL4 v246;
  void *v247;
  void *v248;
  id v249;
  id v250;
  void *v251;
  id *v252;
  id v253;
  id v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  id v259;
  id v260;
  id v261;
  id *v262;
  id v263;
  MCProfileEventsManager *v264;
  void *v265;
  void *v266;
  id *v267;
  void *v268;
  unsigned int v269;
  void *v270;
  unsigned int v271;
  void *v272;
  id v273;
  uint64_t v274;
  uint64_t v275;
  void *k;
  void *v277;
  unsigned int v278;
  void *v279;
  unsigned int v280;
  uint64_t v281;
  void *v282;
  char v283;
  void *v284;
  NSObject *v285;
  NSObject *v286;
  uint64_t v287;
  id v288;
  id v289;
  id v290;
  void *v291;
  id v292;
  uint64_t v293;
  void *v294;
  id v295;
  __CFString *v296;
  uint64_t v297;
  void *v298;
  void *v299;
  int v300;
  void *v301;
  _BOOL4 v302;
  id v303;
  id v304;
  void *v305;
  unsigned int v306;
  unsigned int v307;
  MCKeybagUnlockAssertion *v308;
  uint64_t v309;
  id v310;
  void *v311;
  void *v313;
  void *v314;
  id v315;
  id v316;
  id v317;
  id v318;
  id v319;
  id v320;
  void *v321;
  id v322;
  void *v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  id v328;
  id v329;
  _QWORD v330[4];
  id v331;
  uint64_t *v332;
  _QWORD v333[4];
  id v334;
  id v335;
  id v336;
  _QWORD v337[5];
  id v338;
  id v339;
  id v340;
  id v341;
  _BYTE *v342;
  uint64_t *v343;
  id v344;
  id v345;
  id v346;
  __CFString *v347;
  id v348;
  __CFString *v349;
  id v350;
  id v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  id obj;
  id v365;
  id v366;
  uint64_t v367;
  id *v368;
  uint64_t v369;
  uint64_t (*v370)(uint64_t, uint64_t);
  void (*v371)(uint64_t);
  id v372;
  char v373;
  uint8_t v374[128];
  _BYTE buf[24];
  char v376;
  _BYTE v377[128];
  _BYTE v378[128];
  _BYTE v379[128];

  v11 = a3;
  v12 = a4;
  v315 = a5;
  v317 = a6;
  v323 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v314 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[MCInstaller setSetAsideAccountIdentifiersByPayloadClass:](self, "setSetAsideAccountIdentifiersByPayloadClass:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[MCInstaller setSetAsideDictionariesByPayloadClass:](self, "setSetAsideDictionariesByPayloadClass:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
  v321 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

  v313 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionManagingProfileIdentifier));
  v311 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionAdditionalManagedProfileIdentifiers));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionsIsInstalledByDeclarativeManagement));
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionFilterFlag));
  v306 = objc_msgSend(v20, "intValue");

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "currentRestrictions"));
  v316 = objc_msgSend(v21, "MCDeepCopy");

  v373 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionInstallationType));
  v307 = objc_msgSend(v22, "intValue");

  v367 = 0;
  v368 = (id *)&v367;
  v369 = 0x3032000000;
  v370 = sub_100045AE0;
  v371 = sub_100045AF0;
  v372 = 0;
  v23 = kMCInstallProfileOptionPersonaID;
  v320 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionPersonaID));
  v24 = _MCLogObjects[9];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Beginning profile installation...", buf, 2u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionAssumeOwnership));
  v26 = objc_msgSend(v25, "BOOLValue");

  if (v26)
  {
    v27 = _MCLogObjects[9];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Beginning profile assume ownership...", buf, 2u);
    }
    v28 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _assumeOwnershipProfileHandler:options:source:outError:](self, "_assumeOwnershipProfileHandler:options:source:outError:", v11, v12, v317, a7));
    v322 = 0;
    v318 = 0;
    v308 = 0;
    goto LABEL_115;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "systemProfileRestrictions"));
  v304 = objc_msgSend(v29, "MCMutableDeepCopy");

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "userProfileRestrictions"));
  v303 = objc_msgSend(v30, "MCMutableDeepCopy");

  v31 = _MCLogObjects[5];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v321;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Beginning profile installation for %{public}@", buf, 0xCu);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v305 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "installedMDMProfile"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
  v34 = objc_opt_class(MCConfigurationProfile);
  isKindOfClass = objc_opt_isKindOfClass(v33, v34);
  if ((isKindOfClass & 1) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    v37 = objc_msgSend(v36, "isMDMProfile");

    if (!v37)
    {
      v302 = 0;
      v42 = 1;
      goto LABEL_18;
    }
    v302 = v305 != 0;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    if (v305)
    {
      v38 = (id)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "installedMDMProfile"));
      v40 = objc_claimAutoreleasedReturnValue(-[MCInstaller _validateMDMReplacementNewProfile:oldProfile:client:](self, "_validateMDMReplacementNewProfile:oldProfile:client:", v33, v39, v315));
      v41 = v368[5];
      v368[5] = (id)v40;

    }
    else
    {
      v43 = objc_claimAutoreleasedReturnValue(-[MCInstaller _validateNewMDMProfile:installationOption:](self, "_validateNewMDMProfile:installationOption:", v33, v12));
      v38 = v368[5];
      v368[5] = (id)v43;
    }

  }
  else
  {
    v302 = 0;
  }

  v42 = isKindOfClass ^ 1;
LABEL_18:
  if (v368[5])
  {
    v322 = 0;
    v318 = 0;
LABEL_51:

    v308 = 0;
    v76 = 0;
    goto LABEL_52;
  }
  v300 = v42;
  if (v307 == 2)
    v44 = 2;
  else
    v44 = 1;
  v45 = objc_claimAutoreleasedReturnValue(-[MCInstaller _installedProfileWithIdentifier:installationType:](self, "_installedProfileWithIdentifier:installationType:", v321, v44));
  v301 = (void *)v45;
  if (!v45)
  {
    v322 = 0;
    goto LABEL_38;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
  v47 = objc_claimAutoreleasedReturnValue(-[MCInstaller _guardAgainstNoMDMPayloadWithNewProfile:oldProfile:](self, "_guardAgainstNoMDMPayloadWithNewProfile:oldProfile:", v46, v45));
  v48 = v368[5];
  v368[5] = (id)v47;

  if (v368[5])
  {
    v322 = 0;
LABEL_49:
    v318 = 0;
    goto LABEL_50;
  }
  if (!v302)
  {
    v51 = kMCDMManagedProfileToManagingProfileKey;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v314, "dependentsOfParent:inDomain:", v321, kMCDMManagedProfileToManagingProfileKey));
    v53 = objc_msgSend(v52, "count");

    if (!v313 || v53)
    {
      v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "identifier"));
      v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v314, "dependentsOfParent:inDomain:", v148, v51));
      v150 = objc_msgSend(v149, "count");

      if (!(v17 & 1 | (v150 == 0)))
      {
        v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "friendlyName"));
        v158 = MCErrorArray(CFSTR("MDM_ERROR_PROFILE_MANAGED_REMOVE_P_ID"));
        v159 = (void *)objc_claimAutoreleasedReturnValue(v158);
        v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12013, v159, MCErrorTypeFatal, v157, 0));
        v161 = objc_msgSend(v160, "MCCopyAsPrimaryError");
        v162 = v368[5];
        v368[5] = v161;

        v322 = 0;
        v318 = 0;
        v60 = v156;
        goto LABEL_44;
      }
      if (!v19 || !v150)
      {
        if (!v313)
        {
          v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionIsOTAUpdate));
          v184 = objc_msgSend(v183, "BOOLValue");

          if ((v184 & 1) == 0)
          {
            v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
            v186 = objc_msgSend(v301, "doesSigningAllowReplacementWithProfile:", v185);

            if ((v186 & 1) == 0)
            {
              v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "friendlyName"));
              v188 = MCErrorArray(CFSTR("ERROR_MISMATCHED_SIGNERS_P_ID"));
              v189 = (void *)objc_claimAutoreleasedReturnValue(v188);
              v190 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4008, v189, MCErrorTypeFatal, v187, 0));
              v191 = v368[5];
              v368[5] = (id)v190;

              v192 = objc_msgSend(v368[5], "MCCopyAsPrimaryError");
              v322 = 0;
              v318 = 0;
              v60 = v368[5];
              v368[5] = v192;
              goto LABEL_44;
            }
          }
        }
        goto LABEL_28;
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "friendlyName"));
      v152 = MCErrorArray(CFSTR("MDM_ERROR_PROFILE_MANAGED_REMOVE_P_ID"));
      v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
      v154 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12013, v153, MCErrorTypeFatal, v151, 0));
      v155 = v368[5];
      v368[5] = (id)v154;

    }
    else
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "friendlyName"));
      v56 = MCErrorArray(CFSTR("MDM_ERROR_PROFILE_UNMANAGED_REMOVE_P_ID"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      v58 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12013, v57, MCErrorTypeFatal, v55, 0));
      v59 = v368[5];
      v368[5] = (id)v58;

    }
    v322 = 0;
    v318 = 0;
    v60 = v54;
LABEL_44:

LABEL_50:
    goto LABEL_51;
  }
LABEL_28:
  v49 = _MCLogObjects[5];
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v321;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Profile “%{public}@” is replacing an existing profile having the same identifier.", buf, 0xCu);
  }

  v322 = objc_msgSend(v301, "createHandler");
  objc_msgSend(v322, "setAsideWithInstaller:", self);
  if (objc_msgSend(v301, "isInstalledForUser"))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "identifier"));
    objc_msgSend(v303, "removeObjectForKey:", v50);
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "identifier"));
    objc_msgSend(v304, "removeObjectForKey:", v50);
  }

LABEL_38:
  if (v307 == 2)
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectForKey:", v321));
  else
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v304, "objectForKey:", v321));
  v62 = v61;

  if (v62)
  {
    v60 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "friendlyName"));
    v64 = MCErrorArray(CFSTR("ERROR_PROFILE_NONUNIQUE_UUID_P_ID"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4002, v65, MCErrorTypeFatal, v63, 0));
    v67 = objc_msgSend(v66, "MCCopyAsPrimaryError");
    v68 = v368[5];
    v368[5] = v67;

LABEL_43:
    v318 = 0;
    goto LABEL_44;
  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionIsOTAUpdate));
  v70 = objc_msgSend(v69, "BOOLValue");

  if (v70)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    v72 = v368 + 5;
    v366 = v368[5];
    -[MCInstaller _showWarningsForUpdatingProfile:originalProfile:interactionClient:outError:](self, "_showWarningsForUpdatingProfile:originalProfile:interactionClient:outError:", v71, v301, v315, &v366);
    v73 = v366;
  }
  else
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    v72 = v368 + 5;
    v365 = v368[5];
    -[MCInstaller _showWarningsForProfile:interactionClient:outError:](self, "_showWarningsForProfile:interactionClient:outError:", v71, v315, &v365);
    v73 = v365;
  }
  v74 = v73;
  v75 = *v72;
  *v72 = v74;

  if (v368[5])
    goto LABEL_49;
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
  v147 = v368 + 5;
  obj = v368[5];
  v299 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "restrictionsWithHeuristicsAppliedOutError:", &obj));
  objc_storeStrong(v147, obj);

  if (v368[5])
    goto LABEL_117;
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledInteractively));
  v164 = objc_msgSend(v163, "BOOLValue");

  if (v164)
  {
    v166 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", MCFeatureAutonomousSingleAppModePermittedAppIDs, v299));
    if (v166)
    {
      v167 = MCErrorArray(CFSTR("ERROR_PROFILE_NO_INTERACTIVE_INSTALLATION"));
      v168 = (void *)objc_claimAutoreleasedReturnValue(v167);
      v169 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4020, v168, MCErrorTypeFatal, 0));
      v170 = v368[5];
      v368[5] = (id)v169;

    }
  }
  v60 = v299;
  if (v368[5])
    goto LABEL_43;
  if ((v17 & 1) == 0)
  {
    if (qword_1000FD920 != -1)
      dispatch_once(&qword_1000FD920, &stru_1000E3C40);
    if (!os_variant_has_internal_ui("com.apple.ManagedConfiguration.OverrideProfileValidation", v165)
      || (v60 = v299,
          !CFPreferencesGetAppBooleanValue(CFSTR("AllowMDMOnlyPayloadsWithoutMDM"), kMCNotBackedUpPreferencesDomain, 0)))
    {
      v362 = 0u;
      v363 = 0u;
      v360 = 0u;
      v361 = 0u;
      v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      v319 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "payloads"));

      v172 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v360, v379, 16);
      if (v172)
      {
        v173 = *(_QWORD *)v361;
        p_vtable = &OBJC_METACLASS___MCExtensibleSingleSignOnPayloadHandler.vtable;
        v297 = *(_QWORD *)v361;
        do
        {
          v175 = 0;
          v295 = v172;
          do
          {
            if (*(_QWORD *)v361 != v173)
              objc_enumerationMutation(v319);
            v309 = v175;
            v176 = *(_QWORD *)(*((_QWORD *)&v360 + 1) + 8 * v175);
            v356 = 0u;
            v357 = 0u;
            v358 = 0u;
            v359 = 0u;
            v177 = p_vtable[291];
            v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v356, v378, 16);
            if (v178)
            {
              v179 = *(_QWORD *)v357;
              while (2)
              {
                for (i = 0; i != v178; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v357 != v179)
                    objc_enumerationMutation(v177);
                  if ((objc_opt_isKindOfClass(v176, *(_QWORD *)(*((_QWORD *)&v356 + 1) + 8 * (_QWORD)i)) & 1) != 0)
                  {
                    v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v23));
                    v182 = v181 == 0;

                    if (v182)
                    {
                      v193 = objc_claimAutoreleasedReturnValue(+[MCInstaller notInstalledByMDMError](MCInstaller, "notInstalledByMDMError"));
                      v194 = v368[5];
                      v368[5] = (id)v193;

                      goto LABEL_156;
                    }
                  }
                }
                v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v356, v378, 16);
                if (v178)
                  continue;
                break;
              }
            }

            v175 = v309 + 1;
            v173 = v297;
            p_vtable = (void **)(&OBJC_METACLASS___MCExtensibleSingleSignOnPayloadHandler + 24);
          }
          while ((id)(v309 + 1) != v295);
          v173 = v297;
          v172 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v360, v379, 16);
        }
        while (v172);
      }
LABEL_156:

      v60 = v299;
    }
  }
  if (v368[5])
    goto LABEL_43;
  v195 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v196 = objc_msgSend(v195, "isSupervised");

  if (v196)
  {
    v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    v198 = objc_msgSend(v197, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
    v199 = (void *)objc_claimAutoreleasedReturnValue(v198);
    v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "firstObject"));

    if (v200 && objc_msgSend(v200, "isUserEnrollment"))
    {
      v201 = objc_claimAutoreleasedReturnValue(+[MCInstaller deviceIsSupervisedError](MCInstaller, "deviceIsSupervisedError"));
LABEL_172:
      v206 = v368[5];
      v368[5] = (id)v201;

    }
  }
  else
  {
    v354 = 0u;
    v355 = 0u;
    v352 = 0u;
    v353 = 0u;
    v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "payloads"));

    v203 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v352, v377, 16);
    if (v203)
    {
      v204 = *(_QWORD *)v353;
      while (2)
      {
        for (j = 0; j != v203; j = (char *)j + 1)
        {
          if (*(_QWORD *)v353 != v204)
            objc_enumerationMutation(v200);
          if (-[MCInstaller deviceSupervisionRequiredForPayload:](self, "deviceSupervisionRequiredForPayload:", *(_QWORD *)(*((_QWORD *)&v352 + 1) + 8 * (_QWORD)j)))
          {
            v201 = objc_claimAutoreleasedReturnValue(+[MCInstaller deviceNotSupervisedError](MCInstaller, "deviceNotSupervisedError"));
            goto LABEL_172;
          }
        }
        v203 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v352, v377, 16);
        if (v203)
          continue;
        break;
      }
    }
  }

  if (v368[5])
    goto LABEL_117;
  v207 = v307 == 2 ? v303 : v304;
  objc_msgSend(v207, "setObject:forKey:", v299, v321);
  v208 = objc_msgSend(v12, "copy");
  v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
  objc_msgSend(v209, "setInstallOptions:", v208);

  v210 = v368 + 5;
  v351 = v368[5];
  objc_msgSend(v11, "stageForInstallationWithInstaller:interactionClient:outError:", self, v315, &v351);
  objc_storeStrong(v210, v351);
  if (v368[5])
  {
LABEL_117:
    v318 = 0;
LABEL_118:
    v60 = v299;
    goto LABEL_44;
  }
  v318 = v11;
  v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "currentRestrictions"));
  v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "defaultRestrictions"));
  v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "systemClientRestrictions"));
  v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "userClientRestrictions"));
  v214 = v368 + 5;
  v350 = v368[5];
  v298 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:](MCRestrictionManagerWriter, "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:", v211, v28, v304, v303, v212, v213, 0, &v350));
  objc_storeStrong(v214, v350);

  if (v368[5])
  {

    goto LABEL_118;
  }
  v349 = &stru_1000E4AA0;
  v215 = v368 + 5;
  v348 = v368[5];
  -[MCInstaller _promptUserForComplianceWithRestrictions:handler:interactionClient:outPasscode:outError:](self, "_promptUserForComplianceWithRestrictions:handler:interactionClient:outPasscode:outError:", v298, v318, v315, &v349, &v348);
  v296 = v349;
  objc_storeStrong(v215, v348);
  if (v368[5])
  {
    v76 = 0;
    v308 = 0;
    v216 = 2;
    goto LABEL_278;
  }
  v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v318, "profile"));
  v218 = objc_msgSend(v217, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
  v219 = (void *)objc_claimAutoreleasedReturnValue(v218);
  v294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "firstObject"));

  if (v294)
  {
    v220 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager"));
    if (-[__CFString isPasscodeSet](v220, "isPasscodeSet"))
    {
      v221 = -[__CFString length](v296, "length") == 0;

      if (!v221)
      {
LABEL_187:
        if (!v302 && (objc_msgSend(v294, "accessRights") & 4) != 0)
        {
          if ((MCKeybagHasMDMEscrowDataAndSecret() & 1) != 0)
          {

          }
          else
          {
            v346 = 0;
            v222 = MCKeybagCreateMDMEscrowWithPasscode(v296, &v346);
            v292 = v346;
            if ((v222 & 1) == 0)
            {
              v286 = _MCLogObjects[2];
              if (os_log_type_enabled(v286, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v292;
                _os_log_impl((void *)&_mh_execute_header, v286, OS_LOG_TYPE_ERROR, "Unable to create unlock token: %{public}@", buf, 0xCu);
              }

              v287 = MCErrorArray(CFSTR("MDM_ERROR_MUST_INSTALL_INTERACTIVELY_P_ID"));
              v291 = (void *)objc_claimAutoreleasedReturnValue(v287);
              v290 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCInstallationErrorDomain, 4042, v291, v292, MCErrorTypeFatal, v321, 0));
              v288 = objc_msgSend(v290, "MCCopyAsPrimaryError");
              v289 = v368[5];
              v368[5] = v288;

              v76 = 0;
              v308 = 0;
              goto LABEL_274;
            }

          }
        }
        if (v296 && (-[__CFString isEqualToString:](v296, "isEqualToString:", &stru_1000E4AA0) & 1) == 0)
        {
          v223 = objc_msgSend(v12, "mutableCopy");
          v224 = +[NSString _newZStringWithString:](NSString, "_newZStringWithString:", v296);
          objc_msgSend(v223, "setObject:forKeyedSubscript:", v224, kMDMPasscodeKey);

          v225 = objc_msgSend(v223, "copy");
          v12 = v225;
        }
        v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v294, "managedAppleID"));
        v227 = objc_msgSend(v226, "length");

        if (v227)
        {
          v228 = _MCLogObjects[5];
          if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEFAULT, "We are doing DS 1.0 user enrollment", buf, 2u);
          }

        }
        if (v302)
        {
          v229 = objc_msgSend(v305, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
          v230 = (void *)objc_claimAutoreleasedReturnValue(v229);
          v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "firstObject"));

          objc_msgSend(v294, "setIsUserEnrollment:", objc_msgSend(v231, "isUserEnrollment"));
LABEL_202:

LABEL_209:
          objc_msgSend(v294, "setPersonaID:", v320);
          if (!v368[5])
          {
            v238 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
            v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v321));

            v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "identifier"));
            if (v28)
            {
              v240 = objc_msgSend(v12, "mutableCopy");
              objc_msgSend(v240, "setObject:forKeyedSubscript:", v28, kMDMRMAccountIDKey);
              v241 = objc_msgSend(v240, "copy");

              v12 = v241;
            }

          }
          if ((objc_msgSend(v294, "isUserEnrollment") & 1) == 0
            && (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad") & 1) == 0&& +[DMCMultiUserModeUtilities deviceHasMultipleUsers](DMCMultiUserModeUtilities, "deviceHasMultipleUsers"))
          {
            v242 = objc_claimAutoreleasedReturnValue(+[MCInstaller notSupportedUnderMultiUserModeError](MCInstaller, "notSupportedUnderMultiUserModeError"));
            v243 = v368[5];
            v368[5] = (id)v242;

          }
          goto LABEL_217;
        }
        v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v294, "managedAppleID"));
        v233 = objc_msgSend(v232, "length");

        if (!v233)
          goto LABEL_209;
        v291 = (void *)objc_claimAutoreleasedReturnValue(+[DMCPersonaHelper enterprisePersonaIdentifier](DMCPersonaHelper, "enterprisePersonaIdentifier"));
        if (!v291)
          goto LABEL_222;
        v234 = _MCLogObjects[5];
        if (os_log_type_enabled(v234, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v291;
          _os_log_impl((void *)&_mh_execute_header, v234, OS_LOG_TYPE_ERROR, "Enterprise persona (%{public}@) exists without any MDM enrollment! Cleaning up anyway...", buf, 0xCu);
        }

        v345 = 0;
        +[DMCPersonaHelper removePersona:error:](DMCPersonaHelper, "removePersona:error:", v291, &v345);
        v235 = v345;
        if (v235)
        {
          v236 = v368;
          v237 = v235;
        }
        else
        {
LABEL_222:
          v344 = 0;
          v247 = (void *)objc_claimAutoreleasedReturnValue(+[DMCPersonaHelper createEnterprisePersonaWithDevicePasscode:error:](DMCPersonaHelper, "createEnterprisePersonaWithDevicePasscode:error:", v296, &v344));
          v28 = v344;

          if (v247)
          {
            +[DMCPersonaHelper trackDirtyPersona:](DMCPersonaHelper, "trackDirtyPersona:", v247);
            v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v294, "managedAppleID"));
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v376 = 0;
            v337[0] = _NSConcreteStackBlock;
            v337[1] = 3221225472;
            v337[2] = sub_10004A748;
            v337[3] = &unk_1000E3C68;
            v342 = buf;
            v337[4] = self;
            v310 = v248;
            v338 = v310;
            v339 = v247;
            v249 = v318;
            v340 = v249;
            v341 = v315;
            v343 = &v367;
            v320 = v339;
            v231 = (void *)objc_claimAutoreleasedReturnValue(+[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v339, v337));

            if (v368[5])
              v250 = v368[5];
            else
              v250 = v231;
            objc_storeStrong(v368 + 5, v250);
            if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            {
              v251 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
              v252 = v368 + 5;
              v336 = v368[5];
              v333[0] = _NSConcreteStackBlock;
              v333[1] = 3221225472;
              v333[2] = sub_10004A7B4;
              v333[3] = &unk_1000E3C90;
              v253 = v249;
              v334 = v253;
              v335 = v294;
              objc_msgSend(v251, "dmc_updateAppleAccountWithPersonaID:error:updateBlock:", v320, &v336, v333);
              objc_storeStrong(v252, v336);

              v254 = objc_msgSend(objc_alloc((Class)NSConditionLock), "initWithCondition:", 1);
              v28 = (id)objc_claimAutoreleasedReturnValue(+[DMCEnrollmentFlowController enrollmentFlowController](DMCEnrollmentFlowController, "enrollmentFlowController"));
              v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "profile"));
              v256 = objc_claimAutoreleasedReturnValue(objc_msgSend(v255, "organization"));
              v257 = (void *)v256;
              v258 = v310;
              if (v256)
                v258 = (void *)v256;
              v259 = v258;

              v330[0] = _NSConcreteStackBlock;
              v330[1] = 3221225472;
              v330[2] = sub_10004A86C;
              v330[3] = &unk_1000E3CB8;
              v332 = &v367;
              v260 = v254;
              v331 = v260;
              objc_msgSend(v28, "updateMDMUserEnrollmentWithManagedAppleID:profileIdentifier:organizationName:personaID:completionHandler:", v310, v321, v259, v320, v330);
              objc_msgSend(v260, "lockWhenCondition:", 0);
              objc_msgSend(v260, "unlock");

            }
            _Block_object_dispose(buf, 8);

            goto LABEL_202;
          }
          v285 = _MCLogObjects[5];
          if (os_log_type_enabled(v285, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, v285, OS_LOG_TYPE_ERROR, "Failed to create enterprise persona with error: %{public}@", buf, 0xCu);
          }

          v236 = v368;
          v237 = v28;
          v320 = 0;
        }
        v76 = 0;
        v308 = 0;
        v290 = v236[5];
        v292 = v237;
        v236[5] = v237;
LABEL_274:
        v216 = 2;
        goto LABEL_275;
      }
      v347 = v296;
      objc_msgSend(v315, "requestCurrentPasscodeOutPasscode:", &v347);
      v220 = v296;
      v296 = v347;
    }

    goto LABEL_187;
  }
LABEL_217:
  if (!v368[5])
  {
    v308 = objc_alloc_init(MCKeybagUnlockAssertion);
    if (v320
      && (v244 = kMDMPersonaKey,
          v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMDMPersonaKey)),
          v246 = v245 == 0,
          v245,
          v246))
    {
      v261 = objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v261, "setObject:forKeyedSubscript:", v320, v244);
      v28 = objc_msgSend(v261, "copy");

    }
    else
    {
      v28 = v12;
    }
    v262 = v368 + 5;
    v329 = v368[5];
    objc_msgSend(v318, "installWithInstaller:options:interactionClient:outError:", self, v28, v315, &v329);
    objc_storeStrong(v262, v329);
    v292 = objc_msgSend(v28, "mutableCopy");
    objc_msgSend(v292, "removeObjectForKey:", kMDMPasscodeKey);
    v12 = objc_msgSend(v292, "copy");

    v263 = v368[5];
    v76 = v263 == 0;
    if (v263)
      goto LABEL_237;
    v264 = objc_opt_new(MCProfileEventsManager);
    v265 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v318, "profile"));
    -[MCProfileEventsManager addEventForProfile:operation:source:](v264, "addEventForProfile:operation:source:", v265, CFSTR("install"), v317);

    if (((v300 | v302) & 1) == 0)
      -[MCInstaller _sendMDMEnrollmentEventWithInstallationOptions:](self, "_sendMDMEnrollmentEventWithInstallationOptions:", v12);
    v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v318, "profile"));
    v266 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "loggingID"));
    v267 = v368 + 5;
    v328 = v368[5];
    objc_msgSend(v323, "setSystemProfileRestrictions:userProfileRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outAppWhitelistSettingsChanged:outRecomputedNag:outError:", v304, v303, v266, 0, 0, &v373, 0, &v328);
    objc_storeStrong(v267, v328);

    if (v368[5])
    {
      v76 = 1;
LABEL_237:
      v216 = 2;
LABEL_276:

      goto LABEL_277;
    }
    v291 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
    if (objc_msgSend(v291, "isSupervised")
      && objc_msgSend(v291, "isTeslaEnrolled")
      && (v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", kMCInstallProfileOptionIsCloudProfile)),
          v269 = objc_msgSend(v268, "BOOLValue"),
          v268,
          v269)
      && (v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v318, "profile")),
          v271 = objc_msgSend(v270, "containsPayloadOfClass:", objc_opt_class(MCMDMPayload)),
          v270,
          v271))
    {
      v290 = (id)objc_claimAutoreleasedReturnValue(+[MCInstaller considerProfilesInstalledDuringBuddyForManagement](MCInstaller, "considerProfilesInstalledDuringBuddyForManagement"));
    }
    else
    {
      v290 = 0;
    }
    v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "currentRestrictions"));
    objc_msgSend(v318, "didInstallOldGlobalRestrictions:newGlobalRestrictions:", v316, v272);

    if (objc_msgSend(v313, "length") && (objc_msgSend(v313, "isEqualToString:", v321) & 1) == 0)
      objc_msgSend(v314, "addDependent:ofParent:inDomain:reciprocalDomain:toSystem:user:", v321, v313, kMCDMManagingProfileToManagedProfileKey, kMCDMManagedProfileToManagingProfileKey, v307 != 2, v307 == 2);
    if (objc_msgSend(v311, "count"))
    {
      v326 = 0u;
      v327 = 0u;
      v324 = 0u;
      v325 = 0u;
      v28 = v311;
      v273 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v324, v374, 16);
      if (v273)
      {
        v274 = *(_QWORD *)v325;
        v293 = kMCDMManagingProfileToManagedProfileKey;
        v275 = kMCDMManagedProfileToManagingProfileKey;
        do
        {
          for (k = 0; k != v273; k = (char *)k + 1)
          {
            if (*(_QWORD *)v325 != v274)
              objc_enumerationMutation(v28);
            v277 = *(void **)(*((_QWORD *)&v324 + 1) + 8 * (_QWORD)k);
            if ((objc_msgSend(v277, "isEqualToString:", v321) & 1) == 0
              && (objc_msgSend(v290, "containsObject:", v277) & 1) == 0)
            {
              objc_msgSend(v314, "addDependent:ofParent:inDomain:reciprocalDomain:toSystem:user:", v277, v321, v293, v275, v307 != 2, v307 == 2);
            }
          }
          v273 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v324, v374, 16);
        }
        while (v273);
      }

    }
    v278 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:](MCRestrictionManager, "isWebContentFilterUIActiveWithRestrictionDictionary:", v316);
    v279 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "currentRestrictions"));
    v280 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:](MCRestrictionManager, "isWebContentFilterUIActiveWithRestrictionDictionary:", v279);

    if (v278 != v280)
      MCSendWebContentFilterUIActiveChangedNotification(v281);
    v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v294, "managedAppleID"));
    if (objc_msgSend(v282, "length"))
      v283 = v302;
    else
      v283 = 1;

    if ((v283 & 1) == 0)
    {
      v284 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v294, "managedAppleID"));
      -[MCInstaller _promptUserForRestoreWithAccountID:personaID:interactionClient:](self, "_promptUserForRestoreWithAccountID:personaID:interactionClient:", v284, v320, v315);

    }
    v216 = 0;
    v76 = 1;
LABEL_275:

    goto LABEL_276;
  }
  v76 = 0;
  v308 = 0;
  v216 = 2;
LABEL_277:

LABEL_278:
  if ((v216 | 2) != 2)
    goto LABEL_115;
LABEL_52:
  v77 = v368[5];
  if (!v77)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "profile"));
    v89 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "installOptions"));

    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "profile"));
    v94 = objc_msgSend(v93, "isInstalledForUser");

    if (v322)
    {
      v95 = _MCLogObjects[5];
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, "Removing profiles that were set aside...", buf, 2u);
      }

      objc_msgSend(v322, "removeWithInstaller:options:", self, 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "currentRestrictions"));
      objc_msgSend(v322, "didRemoveOldGlobalRestrictions:newGlobalRestrictions:", v316, v96);

      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "profile"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "identifier"));

      v99 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _managingProfileIdentifierForProfileIdentifier:](self, "_managingProfileIdentifierForProfileIdentifier:", v98));
      if (v99)
        objc_msgSend(v314, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:", v98, v99, kMCDMManagingProfileToManagedProfileKey, kMCDMManagedProfileToManagingProfileKey, v94 ^ 1, v94);

      v100 = objc_msgSend(v12, "mutableCopy");
      v101 = v100;
      if (v302)
      {
        v102 = kMCInstallProfileOptionIsCloudProfile;
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", kMCInstallProfileOptionIsCloudProfile));
        v104 = objc_msgSend(v103, "BOOLValue");

        if (v104)
        {
          v105 = kMCInstallProfileOptionIsCloudLocked;
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", kMCInstallProfileOptionIsCloudLocked));
          v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v106, "BOOLValue")));
          objc_msgSend(v101, "setObject:forKeyedSubscript:", v107, v105);

          v108 = &__kCFBooleanTrue;
        }
        else
        {
          v108 = &__kCFBooleanFalse;
          objc_msgSend(v101, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kMCInstallProfileOptionIsCloudLocked);
        }
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v108, v102);
      }
      else
      {
        objc_msgSend(v100, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kMCInstallProfileOptionIsCloudLocked);
        v102 = kMCInstallProfileOptionIsCloudProfile;
        objc_msgSend(v101, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kMCInstallProfileOptionIsCloudProfile);
      }
      v112 = +[MCProfile newProfileSignatureVersion](MCProfile, "newProfileSignatureVersion");
      objc_msgSend(v101, "setObject:forKeyedSubscript:", v112, kMCInstallProfileOptionSignatureVersion);

      v111 = v101;
    }
    else
    {
      v109 = objc_msgSend(v12, "mutableCopy");
      v110 = +[MCProfile newProfileSignatureVersion](MCProfile, "newProfileSignatureVersion");
      objc_msgSend(v109, "setObject:forKeyedSubscript:", v110, kMCInstallProfileOptionSignatureVersion);

      v111 = v109;
      v102 = kMCInstallProfileOptionIsCloudProfile;
    }
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKeyedSubscript:", v102));
    if (objc_msgSend(v113, "BOOLValue"))
    {
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKeyedSubscript:", kMCInstallProfileOptionIsCloudLocked));
      v115 = objc_msgSend(v114, "BOOLValue");

      if (!v115)
        goto LABEL_88;
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      objc_msgSend(v116, "setLocked:", 1);

      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      objc_msgSend(v113, "setRemovalPasscode:", 0);
    }

LABEL_88:
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    objc_msgSend(v117, "setInstallOptions:", v111);

    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    if (v307 == 2)
      v119 = sub_1000443A8();
    else
      v119 = sub_1000443E4();
    v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
    objc_msgSend(v118, "writeStubToDirectory:", v120);

    v121 = +[MCProfile thisDeviceType](MCProfile, "thisDeviceType");
    if (+[MCTargetDeviceResolver purgatorySupportedForDevice:](MCTargetDeviceResolver, "purgatorySupportedForDevice:", v121))
    {
      -[MCInstaller purgePurgatoryProfileWithIdentifier:targetDevice:](self, "purgePurgatoryProfileWithIdentifier:targetDevice:", v321, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledInteractively));
      v123 = objc_msgSend(v122, "BOOLValue");

      if (v123)
      {
        v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
        sub_10007AF48(v124, 0);

      }
    }
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
    if ((~v306 & 9) != 0)
      objc_msgSend(v125, "addIdentifierToSystemManifest:flag:", v321, v306);
    else
      objc_msgSend(v125, "addIdentifierToUserManifest:flag:", v321, v306);

    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "profile"));
    if (objc_msgSend(v126, "containsPayloadOfClass:", objc_opt_class(MCDefaultsPayload)))
    {

    }
    else
    {
      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      v128 = objc_msgSend(v127, "containsPayloadOfClass:", objc_opt_class(MCDefaultsPayload));

      if (!v128)
        goto LABEL_101;
    }
    notify_post((const char *)objc_msgSend(MCDefaultsDidChangeNotification, "UTF8String"));
LABEL_101:
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "profile"));
    if (objc_msgSend(v129, "containsPayloadOfClass:", objc_opt_class(MCAppWhitelistPayloadBase)))
    {

    }
    else
    {
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      v131 = objc_msgSend(v130, "containsPayloadOfClass:", objc_opt_class(MCAppWhitelistPayloadBase));

      if (!v131)
      {
LABEL_106:
        v135 = _MCLogObjects[5];
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v321;
          _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "Profile “%{public}@” installed.", buf, 0xCu);
        }

        goto LABEL_109;
      }
    }
    buf[0] = 0;
    v132 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "effectiveUserSettings"));
    objc_msgSend(v132, "recomputeAppOptionsEffectiveUserSettings:outEffectiveChangeDetected:", v133, buf);

    if (buf[0])
    {
      MCSendAppWhitelistChangedNotification();
      v134 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
      objc_msgSend(v134, "retryNotNowResponse");

    }
    goto LABEL_106;
  }
  if (v318)
    objc_msgSend(v318, "unstageFromInstallationWithInstaller:", self);
  if (v76)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "currentRestrictions"));
    v79 = objc_msgSend(v78, "copy");

    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "systemProfileRestrictions"));
    v81 = objc_msgSend(v80, "MCMutableDeepCopy");

    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "userProfileRestrictions"));
    v83 = objc_msgSend(v82, "MCMutableDeepCopy");

    if (v307 == 2)
      v84 = v83;
    else
      v84 = v81;
    objc_msgSend(v84, "removeObjectForKey:", v321);
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "loggingID"));
    objc_msgSend(v323, "setSystemProfileRestrictions:userProfileRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outAppWhitelistSettingsChanged:outRecomputedNag:outError:", v81, v83, v86, 0, 0, 0, 0, 0);

    objc_msgSend(v11, "removeWithInstaller:options:", self, 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "currentRestrictions"));
    objc_msgSend(v11, "didRemoveOldGlobalRestrictions:newGlobalRestrictions:", v79, v87);

  }
  if (v322)
    objc_msgSend(v322, "unsetAside");
  if (v320)
    v88 = v76;
  else
    v88 = 1;
  if ((v88 & 1) == 0)
    +[DMCPersonaHelper removePersonaAndAccountsWithPersonaID:](DMCPersonaHelper, "removePersonaAndAccountsWithPersonaID:", v320);
  v89 = (id)objc_claimAutoreleasedReturnValue(+[MCInstaller _installationFailureErrorWithUnderlyingError:](MCInstaller, "_installationFailureErrorWithUnderlyingError:", v368[5]));
  v90 = _MCLogObjects[5];
  if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
  {
    v91 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v321;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v91;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "Profile “%{public}@” failed to install with error: %{public}@", buf, 0x16u);

  }
  if (a7)
  {
    v89 = objc_retainAutorelease(v89);
    *a7 = v89;
  }
LABEL_109:

  -[MCInstaller setSetAsideAccountIdentifiersByPayloadClass:](self, "setSetAsideAccountIdentifiersByPayloadClass:", 0);
  -[MCInstaller setSetAsideDictionariesByPayloadClass:](self, "setSetAsideDictionariesByPayloadClass:", 0);
  if (objc_msgSend(v320, "length"))
    +[DMCPersonaHelper untrackDirtyPersona:](DMCPersonaHelper, "untrackDirtyPersona:", v320);
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload accountPayloads](MCPayload, "accountPayloads"));
  v138 = objc_msgSend(v136, "containsAnyPayloadOfClasses:", v137);

  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "profile"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload accountPayloads](MCPayload, "accountPayloads"));
  LODWORD(v137) = objc_msgSend(v139, "containsAnyPayloadOfClasses:", v140);

  -[MCInstaller _removeOrphanedResourcesOptions:includingAccounts:](self, "_removeOrphanedResourcesOptions:includingAccounts:", v12, v138 | v137);
  v141 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "effectiveUserSettings"));
  objc_msgSend(v141, "recomputeHacksAfterProfileChangesEffectiveUserSettings:sendNotifications:", v142, 1);

  v143 = objc_msgSend(v141, "recomputeAccountVPNAssociations");
  if (v77)
  {
    v144 = 0;
  }
  else
  {
    v144 = objc_msgSend(v321, "copy");

  }
  v28 = v144;

LABEL_115:
  _Block_object_dispose(&v367, 8);

  return v28;
}

- (BOOL)deviceSupervisionRequiredForPayload:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MCPayload supervisedRequiredPayloads](MCPayload, "supervisedRequiredPayloads"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass(v3, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)) & 1) != 0)
        {

          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = objc_opt_class(MCVPNPayload);
  if ((objc_opt_isKindOfClass(v3, v9) & 1) != 0
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vpnType", (_QWORD)v14)),
        v11 = objc_msgSend(v10, "isEqualToString:", kMCVPNPayloadBaseVPNTypeAlwaysOn),
        v10,
        (v11 & 1) != 0))
  {
LABEL_13:
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)addSetAsideAccountIdentifier:(id)a3 forPayloadClass:(Class)a4
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = NSStringFromClass(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller setAsideAccountIdentifiersByPayloadClass](self, "setAsideAccountIdentifiersByPayloadClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller setAsideAccountIdentifiersByPayloadClass](self, "setAsideAccountIdentifiersByPayloadClass"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v7);

  }
  objc_msgSend(v9, "addObject:", v11);

}

- (id)setAsideAccountIdentifiersForPayloadClass:(Class)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller setAsideAccountIdentifiersByPayloadClass](self, "setAsideAccountIdentifiersByPayloadClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  return v8;
}

- (void)addSetAsideDictionary:(id)a3 forPayloadHandlerClass:(Class)a4
{
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = NSStringFromClass(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setAsideDictionariesByPayloadClass, "objectForKeyedSubscript:", v7));
  if (!v8)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_setAsideDictionariesByPayloadClass, "setObject:forKeyedSubscript:", v8, v7);
  }
  objc_msgSend(v8, "addObject:", v9);

}

- (id)setAsideDictionariesForPayloadHandlerClass:(Class)a3
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setAsideDictionariesByPayloadClass, "objectForKeyedSubscript:", v5));

  return v6;
}

- (BOOL)_showWarningsForProfile:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "installationWarnings"));
  LOBYTE(a5) = -[MCInstaller _showWarnings:interactionClient:outError:](self, "_showWarnings:interactionClient:outError:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)_showWarningsForUpdatingProfile:(id)a3 originalProfile:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "installationWarnings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "installationWarnings"));

  v14 = objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v14, "removeObjectsInArray:", v12);
  LOBYTE(a6) = -[MCInstaller _showWarnings:interactionClient:outError:](self, "_showWarnings:interactionClient:outError:", v14, v10, a6);

  return (char)a6;
}

- (BOOL)_showWarnings:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  BOOL v11;
  char v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  v13 = 0;
  v10 = objc_msgSend(v8, "showUserWarnings:outResult:", v7, &v13);
  if (v13 && v10)
  {
    v8 = 0;
LABEL_5:
    v11 = 1;
    goto LABEL_6;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileHandler userCancelledError](MCProfileHandler, "userCancelledError"));
  v11 = v8 == 0;
  if (a5 && v8)
  {
    v8 = objc_retainAutorelease(v8);
    v11 = 0;
    *a5 = v8;
  }
LABEL_6:

  return v11;
}

- (id)existingProfileContainingPayloadClass:(Class)a3 excludingProfileIdentifier:(id)a4
{
  return -[MCInstaller existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:", a3, 3, a4);
}

- (id)existingProfileContainingPayloadClass:(Class)a3 inProfilesWithFilterFlags:(int)a4 excludingProfileIdentifier:(id)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifiersOfProfilesWithFilterFlags:", v5));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isEqualToString:", v15, (_QWORD)v18) & 1) == 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v15));
          if ((objc_msgSend(v16, "containsPayloadOfClass:", a3) & 1) != 0)
            goto LABEL_12;

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)installProfileData:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  int v16;
  void *v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  unsigned int v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  os_log_t v116;
  NSObject *v117;
  void *v118;
  id v119;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  unsigned int v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  id v141;
  void *v142;
  unsigned __int8 v143;
  void *v144;
  uint64_t v145;
  char isKindOfClass;
  uint64_t v147;
  id v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  unsigned int v156;
  void *v157;
  id v158;
  id v159;
  uint64_t v160;
  void *j;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  id v170;
  id v171;
  id v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  NSObject *v177;
  unsigned int v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  uint64_t v183;
  id v184;
  id v185;
  id obj;
  void *v187;
  uint64_t v188;
  id v189;
  id v190;
  id v191;
  void *v192;
  void *v193;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  id v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  id v215;
  id v216;
  uint8_t buf[4];
  void *v218;
  _BYTE v219[128];
  _BYTE v220[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v200 = a6;
  v13 = kMCInstallProfileOptionFilterFlag;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCInstallProfileOptionFilterFlag));
  v15 = objc_msgSend(v14, "intValue");

  if (v15 <= 1)
    v16 = 1;
  else
    v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCInstallProfileOptionInstallationType));
  v18 = objc_msgSend(v17, "intValue");

  if (v18 == 2)
    v19 = 8;
  else
    v19 = 16;
  v20 = v19 | v16;
  if (v11)
    v21 = objc_msgSend(v11, "mutableCopy");
  else
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v20));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, v13);

  if (v12)
    v24 = &__kCFBooleanTrue;
  else
    v24 = &__kCFBooleanFalse;
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, kMCInstallProfileOptionIsInstalledInteractively);
  v25 = +[MCProfile newProfileSignatureVersion](MCProfile, "newProfileSignatureVersion");
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, kMCInstallProfileOptionSignatureVersion);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  objc_msgSend(v26, "commitChanges");
  v216 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:options:outError:](MCProfile, "profileWithData:options:outError:", v10, v22, &v216));
  v28 = v216;
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    goto LABEL_91;
  }
  v193 = v12;
  v215 = 0;
  v31 = objc_msgSend(v27, "mayInstallWithOptions:hasInteractionClient:outError:", v22, v12 != 0, &v215);
  v29 = v215;
  if (!v31)
  {
    v30 = 0;
    v12 = v193;
    goto LABEL_91;
  }
  v192 = v27;
  v191 = objc_msgSend(v27, "createHandler");
  if (!v191)
  {
    v30 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _malformedPayloadErrorInternal:](self, "_malformedPayloadErrorInternal:", 0));
    v35 = 0;
    v34 = 0;
    v12 = v193;
    goto LABEL_89;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  v33 = objc_msgSend(v32, "isDeviceLocked");

  v12 = v193;
  if (v33)
  {
    v30 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _deviceLockedError](self, "_deviceLockedError"));
    v34 = 0;
    goto LABEL_88;
  }
  if (objc_msgSend(v192, "targetDeviceType"))
  {
    if (objc_msgSend(v192, "targetDeviceType"))
    {
      v36 = objc_msgSend(v192, "targetDeviceType");
      if (v36 != +[MCProfile thisDeviceType](MCProfile, "thisDeviceType"))
      {
        v45 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceMismatchError](self, "_targetDeviceMismatchError"));
        v30 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceErrorWithUnderlyingError:](self, "_targetDeviceErrorWithUnderlyingError:", v45));

        v34 = 0;
        v29 = (id)v45;
        goto LABEL_88;
      }
    }
  }
  if (objc_msgSend(v192, "isStub"))
  {
    v37 = MCProfileErrorDomain;
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
    v39 = MCErrorArray(CFSTR("ERROR_PROFILE_MALFORMED_P_ID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v37, 1000, v40, 0, MCErrorTypeFatal, v38, 0));
    v30 = objc_msgSend(v41, "MCCopyAsPrimaryError");

    v34 = 0;
    v29 = (id)v38;
    goto LABEL_88;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v43 = objc_msgSend(v42, "userMode");

  if (v43 != 1)
  {
    v30 = v29;
    v27 = v192;
    goto LABEL_54;
  }
  v189 = (id)objc_claimAutoreleasedReturnValue(+[MCPayload unavailablePayloadsInEphemeralMultiUser](MCPayload, "unavailablePayloadsInEphemeralMultiUser"));
  if (v18 == 2)
    v44 = objc_claimAutoreleasedReturnValue(+[MCPayload unavailableUserPayloadsInEphemeralMultiUser](MCPayload, "unavailableUserPayloadsInEphemeralMultiUser"));
  else
    v44 = objc_claimAutoreleasedReturnValue(+[MCPayload unavailableSystemPayloadsInEphemeralMultiUser](MCPayload, "unavailableSystemPayloadsInEphemeralMultiUser"));
  v187 = (void *)v44;
  v27 = v192;
  v213 = 0u;
  v214 = 0u;
  v212 = 0u;
  v211 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "payloads"));
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v211, v220, 16);
  if (!v46)
    goto LABEL_52;
  v47 = v46;
  v184 = v10;
  v48 = *(_QWORD *)v212;
  while (2)
  {
    for (i = 0; i != v47; i = (char *)i + 1)
    {
      if (*(_QWORD *)v212 != v48)
        objc_enumerationMutation(obj);
      v50 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v189, "containsObject:", objc_opt_class(v50)))
      {
        v51 = MCInstallationErrorDomain;
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "type"));
        v180 = v52;
        v53 = MCErrorArray(CFSTR("ERROR_UNACCEPTABLE_PAYLOAD_IN_MULTI_USER_P_TYPE"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        v55 = MCErrorTypeFatal;
        v56 = v51;
        v57 = 4029;
LABEL_50:
        v61 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v56, v57, v54, v55, v180, 0));

        v29 = (id)v61;
        goto LABEL_51;
      }
      if (objc_msgSend(v187, "containsObject:", objc_opt_class(v50)))
      {
        if (v18 == 2)
          v58 = 4032;
        else
          v58 = 4031;
        if (v18 == 2)
          v59 = CFSTR("ERROR_UNACCEPTABLE_USER_PAYLOAD_IN_MULTI_USER_P_TYPE");
        else
          v59 = CFSTR("ERROR_UNACCEPTABLE_SYSTEM_PAYLOAD_IN_MULTI_USER_P_TYPE");
        v183 = MCInstallationErrorDomain;
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "type"));
        v180 = v52;
        v60 = MCErrorArray(v59);
        v54 = (void *)objc_claimAutoreleasedReturnValue(v60);
        v55 = MCErrorTypeFatal;
        v56 = v183;
        v57 = v58;
        goto LABEL_50;
      }
    }
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v211, v220, 16);
    if (v47)
      continue;
    break;
  }
LABEL_51:
  v10 = v184;
  v27 = v192;
LABEL_52:

  v30 = 0;
  if (v29)
  {
LABEL_53:
    v35 = v191;
    goto LABEL_90;
  }
LABEL_54:
  if (objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCGlobalHTTPProxyPayload)))
  {
    v62 = objc_opt_class(MCGlobalHTTPProxyPayload);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    v29 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:excludingProfileIdentifier:", v62, v63));

    if (v29)
    {
      v195 = MCInstallationErrorDomain;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "friendlyName"));
      v181 = v64;
      v65 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_GLOBAL_HTTP_PROXY_P_OLD_ID"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      v67 = MCErrorTypeFatal;
      v68 = v195;
      v69 = 4017;
      goto LABEL_70;
    }
    v27 = v192;
    if ((unint64_t)objc_msgSend(v192, "countOfPayloadsOfClass:", objc_opt_class(MCGlobalHTTPProxyPayload)) >= 2)
    {
      v189 = NSError;
      v187 = (void *)MCInstallationErrorDomain;
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
      v71 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_GLOBAL_HTTP_P_ID"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      v73 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v187, 4017, v72, MCErrorTypeFatal, v70, 0));

      v30 = (id)v73;
      v27 = v192;
    }
  }
  if (objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCSingleAppPayload)))
  {
    v74 = objc_opt_class(MCSingleAppPayload);
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    v29 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:excludingProfileIdentifier:", v74, v75));

    if (v29)
    {
      v196 = MCInstallationErrorDomain;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "friendlyName"));
      v181 = v64;
      v76 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_APP_LOCK_P_OLD_ID"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(v76);
      v67 = MCErrorTypeFatal;
      v68 = v196;
      v69 = 4019;
      goto LABEL_70;
    }
    v27 = v192;
    if ((unint64_t)objc_msgSend(v192, "countOfPayloadsOfClass:", objc_opt_class(MCSingleAppPayload)) >= 2)
    {
      v189 = NSError;
      v187 = (void *)MCInstallationErrorDomain;
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
      v78 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_APP_LOCK_P_ID"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
      v80 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v187, 4019, v79, MCErrorTypeFatal, v77, 0));

      v30 = (id)v80;
      v27 = v192;
    }
  }
  if (!objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCHomeScreenLayoutPayload)))
  {
LABEL_73:
    if (objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCNotificationSettingsPayload)))
    {
      if (v18 == 2)
        v90 = 9;
      else
        v90 = 19;
      v91 = v27;
      v92 = objc_opt_class(MCNotificationSettingsPayload);
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "identifier"));
      v29 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:", v92, v90, v93));

      if (v29)
      {
        v94 = MCInstallationErrorDomain;
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "friendlyName"));
        v96 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_NOTIFICATION_SETTINGS_P_OLD_ID"));
        v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
        v98 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v94, 4028, v97, MCErrorTypeFatal, v95, 0));

        v34 = 0;
        v30 = (id)v98;
LABEL_87:
        v12 = v193;
        goto LABEL_88;
      }
      v185 = v10;
      if ((unint64_t)objc_msgSend(v91, "countOfPayloadsOfClass:", objc_opt_class(MCNotificationSettingsPayload)) < 2)
      {
        v27 = v91;
      }
      else
      {
        v121 = MCInstallationErrorDomain;
        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
        v123 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_NOTIFICATION_SETTINGS_P_ID"));
        v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
        v125 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v121, 4028, v124, MCErrorTypeFatal, v122, 0));

        v30 = (id)v125;
        v27 = v192;
      }
    }
    else
    {
      v185 = v10;
    }
    if ((objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCAPNPayload)) & 1) != 0
      || objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCCellularPayload)))
    {
      v99 = objc_opt_class(MCAPNPayload);
      v100 = v27;
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
      v29 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:excludingProfileIdentifier:", v99, v101));

      if (v29
        || (v102 = objc_opt_class(MCCellularPayload),
            v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "identifier")),
            v29 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:excludingProfileIdentifier:", v102, v103)), v103, v29))
      {
        v104 = MCInstallationErrorDomain;
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "friendlyName"));
        v106 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_APN_P_OLD_ID"));
        v107 = objc_claimAutoreleasedReturnValue(v106);
        v108 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v104, 4018, v107, MCErrorTypeFatal, v105, 0));

        v30 = (id)v107;
LABEL_85:

        v34 = 0;
        v30 = (id)v108;
LABEL_86:
        v10 = v185;
        goto LABEL_87;
      }
      v126 = (char *)objc_msgSend(v100, "countOfPayloadsOfClass:", objc_opt_class(MCAPNPayload));
      v27 = v100;
      if (&v126[(_QWORD)objc_msgSend(v100, "countOfPayloadsOfClass:", objc_opt_class(MCCellularPayload))] >= (char *)2)
      {
        v127 = MCInstallationErrorDomain;
        v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "friendlyName"));
        v128 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_APN_P_ID"));
        v105 = (void *)objc_claimAutoreleasedReturnValue(v128);
        v108 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v127, 4018, v105, MCErrorTypeFatal, v29, 0));
        goto LABEL_85;
      }
    }
    v10 = v185;
    v12 = v193;
    if (objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCConferenceRoomDisplayPayload)))
    {
      v129 = objc_opt_class(MCConferenceRoomDisplayPayload);
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
      v29 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:excludingProfileIdentifier:", v129, v130));

      if (v29)
      {
        v131 = MCInstallationErrorDomain;
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "friendlyName"));
        v182 = v132;
        v133 = CFSTR("ERROR_PROFILE_MULTIPLE_CONFERENCE_ROOM_DISPLAY_P_OLD_ID");
LABEL_120:
        v137 = MCErrorArray(v133);
        v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
        v139 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v131, 4034, v138, MCErrorTypeFatal, v182, 0));

        v34 = 0;
        v30 = (id)v139;
        goto LABEL_88;
      }
      v27 = v192;
      if ((unint64_t)objc_msgSend(v192, "countOfPayloadsOfClass:", objc_opt_class(MCConferenceRoomDisplayPayload)) >= 2)
      {
        v131 = MCInstallationErrorDomain;
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
        v182 = v132;
        v133 = CFSTR("ERROR_PROFILE_MULTIPLE_CONFERENCE_ROOM_DISPLAY_P_ID");
        goto LABEL_120;
      }
    }
    if (objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCPasswordPolicyPayload)))
    {
      v210 = v30;
      v134 = -[MCInstaller _allowsPasswordPoliciesFromProfile:outError:](self, "_allowsPasswordPoliciesFromProfile:outError:", v27, &v210);
      v29 = v210;

      if (!v134)
      {
        v30 = 0;
        goto LABEL_53;
      }
      v30 = v29;
    }
    if (objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCAirPlaySecurityPayload)))
    {
      v135 = objc_opt_class(MCAirPlaySecurityPayload);
      v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
      v29 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:excludingProfileIdentifier:", v135, v136));

      if (v29)
      {
        v131 = MCInstallationErrorDomain;
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "friendlyName"));
        v182 = v132;
        v133 = CFSTR("ERROR_PROFILE_MULTIPLE_AIRPLAY_SECURITY_P_OLD_ID");
        goto LABEL_120;
      }
      v27 = v192;
      if ((unint64_t)objc_msgSend(v192, "countOfPayloadsOfClass:", objc_opt_class(MCAirPlaySecurityPayload)) >= 2)
      {
        v131 = MCInstallationErrorDomain;
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
        v182 = v132;
        v133 = CFSTR("ERROR_PROFILE_MULTIPLE_AIRPLAY_SECURITY_P_ID");
        goto LABEL_120;
      }
    }
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "removalDate"));
    if (v29)
    {
      v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v141 = objc_msgSend(v29, "compare:", v140);

      if (v141 == (id)-1)
      {
        v151 = MCInstallationErrorDomain;
        v148 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
        v152 = MCErrorArray(CFSTR("ERROR_PROFILE_REMOVAL_DATE_PAST_P_ID"));
        v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
        v154 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v151, 4025, v153, MCErrorTypeFatal, v148, 0));

        v34 = 0;
        v30 = (id)v154;
        goto LABEL_163;
      }
    }
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCInstallProfileOptionsIsRMUserEnrollment));
    v143 = objc_msgSend(v142, "BOOLValue");
    if ((v143 & 1) != 0)
      goto LABEL_127;
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
    if (objc_msgSend(v144, "BOOLValue"))
    {
      v189 = v144;
      v187 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
      if ((objc_msgSend(v187, "isUserEnrollment") & 1) != 0)
      {
        v12 = v193;
LABEL_127:
        v145 = objc_opt_class(MCProfileServiceProfile);
        isKindOfClass = objc_opt_isKindOfClass(v192, v145);
        if ((v143 & 1) == 0)
        {

        }
        if ((isKindOfClass & 1) != 0)
        {
          v147 = MCInstallationErrorDomain;
          v148 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
          v149 = MCErrorArray(CFSTR("ERROR_PROFILE_FORBIDDEN_USER_ENROLLMENT_AND_OTA"));
          v150 = (void *)objc_claimAutoreleasedReturnValue(v149);
          v198 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v147, 4040, v150, MCErrorTypeFatal, v148, 0));

          v34 = 0;
          v30 = (id)v198;
LABEL_163:

          goto LABEL_88;
        }
LABEL_134:
        v155 = (void *)objc_claimAutoreleasedReturnValue(+[MCActivationUtilities sharedInstance](MCActivationUtilities, "sharedInstance"));
        v156 = objc_msgSend(v155, "isHRNMode");

        if (v156 <= 1)
        {
          v157 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload hrnRequiredPayloads](MCPayload, "hrnRequiredPayloads"));
          v206 = 0u;
          v207 = 0u;
          v208 = 0u;
          v209 = 0u;
          v190 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "payloads"));
          v158 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v206, v219, 16);
          if (v158)
          {
            v159 = v158;
            v160 = *(_QWORD *)v207;
            while (2)
            {
              for (j = 0; j != v159; j = (char *)j + 1)
              {
                if (*(_QWORD *)v207 != v160)
                  objc_enumerationMutation(v190);
                v162 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v157, "containsObject:", objc_opt_class(v162)))
                {
                  v188 = MCInstallationErrorDomain;
                  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "type"));
                  v164 = MCErrorArray(CFSTR("ERROR_HRN_REQUIRED_P_TYPE"));
                  v165 = (void *)objc_claimAutoreleasedReturnValue(v164);
                  v166 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v188, 4044, v165, MCErrorTypeFatal, v163, 0));

                  v30 = (id)v166;
                  goto LABEL_145;
                }
              }
              v159 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v206, v219, 16);
              if (v159)
                continue;
              break;
            }
          }
LABEL_145:

          v12 = v193;
        }
        if (v30)
        {
          v34 = 0;
          v10 = v185;
          goto LABEL_88;
        }
        v167 = MCLocalizedString(CFSTR("INSTALL_STATUS_INSTALLING_PROFILE"));
        v168 = (void *)objc_claimAutoreleasedReturnValue(v167);
        objc_msgSend(v12, "setDefaultStatus:", v168);

        v169 = objc_opt_class(MCProfileServiceProfileHandler);
        if ((objc_opt_isKindOfClass(v191, v169) & 1) != 0)
        {
          v205 = 0;
          -[MCInstaller _showWarningsForProfile:interactionClient:outError:](self, "_showWarningsForProfile:interactionClient:outError:", v192, v193, &v205);
          v170 = v205;
          if (v170)
          {
            v30 = v170;
            v34 = 0;
            goto LABEL_86;
          }
          v203 = 0;
          v204 = 0;
          v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "fetchFinalProfileWithClient:outProfileData:outError:", v193, &v204, &v203));
          v148 = v204;
          v174 = v203;
          if (v174)
          {
            v30 = v174;
            v171 = v191;
            v175 = v192;
LABEL_162:

            v34 = 0;
            v191 = v171;
            v192 = v175;
            v10 = v185;
            v12 = v193;
            goto LABEL_163;
          }
          v176 = v173;

          v175 = v176;
          v171 = objc_msgSend(v176, "createHandler");

          v177 = _MCLogObjects[9];
          if (os_log_type_enabled(v177, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v218 = v175;
            _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEBUG, "Retrieved Final profile: %{public}@", buf, 0xCu);
          }
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMCInstallProfileOptionIsOTAInstallation);
          v202 = 0;
          v178 = objc_msgSend(v175, "mayInstallWithOptions:hasInteractionClient:outError:", v22, v193 != 0, &v202);
          v30 = v202;
          if (!v178)
            goto LABEL_162;
          if (v193 && (objc_msgSend(v193, "didBeginInstallingNextProfileData:", v148) & 1) == 0)
          {
            v179 = objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "userCancelledError"));

            v30 = (id)v179;
            goto LABEL_162;
          }

          v191 = v171;
          v192 = v175;
        }
        else
        {
          v30 = 0;
          v171 = v191;
        }
        v201 = v30;
        v172 = v171;
        v12 = v193;
        v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _installProfileHandler:options:interactionClient:source:outError:](self, "_installProfileHandler:options:interactionClient:source:outError:", v172, v22, v193, v200, &v201));
        v148 = v30;
        v30 = v201;
        v10 = v185;
        goto LABEL_163;
      }

      v12 = v193;
    }

    goto LABEL_134;
  }
  if (v18 == 2)
    v81 = 9;
  else
    v81 = 19;
  LODWORD(v189) = v81;
  v82 = objc_opt_class(MCHomeScreenLayoutPayload);
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
  v29 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:](self, "existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:", v82, v189, v83));

  if (!v29)
  {
    v27 = v192;
    if ((unint64_t)objc_msgSend(v192, "countOfPayloadsOfClass:", objc_opt_class(MCHomeScreenLayoutPayload)) >= 2)
    {
      v189 = (id)MCInstallationErrorDomain;
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "friendlyName"));
      v87 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_HOME_SCREEN_LAYOUT_P_ID"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
      v89 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v189, 4027, v88, MCErrorTypeFatal, v86, 0));

      v30 = (id)v89;
      v27 = v192;
    }
    goto LABEL_73;
  }
  v197 = MCInstallationErrorDomain;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "friendlyName"));
  v181 = v64;
  v84 = MCErrorArray(CFSTR("ERROR_PROFILE_MULTIPLE_HOME_SCREEN_LAYOUT_P_OLD_ID"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(v84);
  v67 = MCErrorTypeFatal;
  v68 = v197;
  v69 = 4027;
LABEL_70:
  v85 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v68, v69, v66, v67, v181, 0));

  v34 = 0;
  v30 = (id)v85;
LABEL_88:
  v35 = v191;
LABEL_89:
  v109 = v30;

  v30 = (id)v34;
  v29 = v109;
  v27 = v192;
LABEL_90:

LABEL_91:
  v110 = objc_msgSend(v26, "commitChanges");
  if (v30)
    MCSendProfileListChangedNotification(v110);
  if (v29)
  {
    v111 = v10;
    v112 = MCInstallationErrorDomain;
    v113 = MCErrorArray(CFSTR("ERROR_PROFILE_INSTALLATION_FAILED_TITLE"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
    v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v112, 4001, v114, v29, MCErrorTypeFatal, 0));

    v116 = _MCLogObjects[9];
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    {
      v117 = v116;
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v218 = v118;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "Installation failed. Error: %{public}@", buf, 0xCu);

    }
    v10 = v111;
    if (a7)
      *a7 = objc_retainAutorelease(v115);

    v119 = 0;
  }
  else
  {
    v119 = v30;
  }

  return v119;
}

- (id)_assumeOwnershipProfileHandler:(id)a3 options:(id)a4 source:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id *v49;
  void *v50;
  void *v51;
  os_log_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  MCProfileEventsManager *v60;
  int v62;
  void *v63;
  id v64;
  uint8_t buf[4];
  void *v66;

  v10 = a3;
  v11 = a4;
  v64 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "profile"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCInstallProfileOptionInstallationType));
  LODWORD(a5) = objc_msgSend(v14, "intValue");

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v62 = (int)a5;
  if ((_DWORD)a5 == 2)
    v15 = 2;
  else
    v15 = 1;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _installedProfileWithIdentifier:installationType:](self, "_installedProfileWithIdentifier:installationType:", v13, v15));
  v17 = kMCInstallProfileOptionsIsInstalledByDeclarativeManagement;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCInstallProfileOptionsIsInstalledByDeclarativeManagement));
  v19 = objc_msgSend(v18, "BOOLValue");

  if ((v19 & 1) == 0)
  {
    v20 = MCInstallationErrorDomain;
    v21 = MCErrorArray(CFSTR("ERROR_PROFILE_ASSUME_OWNERSHIP_NOT_ALLOWED"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v20, 4048, v22, MCErrorTypeFatal, 0));
    v24 = objc_msgSend(v23, "MCCopyAsPrimaryError");

    if (v24)
      goto LABEL_19;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "profile"));
  v26 = objc_opt_class(MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "profile"));
    v28 = objc_msgSend(v27, "isMDMProfile");

    if (v28)
    {
      v29 = MCInstallationErrorDomain;
      v30 = MCErrorArray(CFSTR("ERROR_PROFILE_ASSUME_OWNERSHIP_NOT_MDM_PROFILE"));
      v31 = a6;
      v32 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v29, 4049, v32, MCErrorTypeFatal, 0));
      v24 = objc_msgSend(v33, "MCCopyAsPrimaryError");

      a6 = v31;
      if (v24)
        goto LABEL_19;
    }
  }
  else
  {

  }
  if (v16)
    goto LABEL_12;
  v47 = MCInstallationErrorDomain;
  v48 = MCErrorArray(CFSTR("ERROR_PROFILE_ASSUME_OWNERSHIP_MISSING_P_ID"));
  v49 = a6;
  v50 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v47, 4050, v50, MCErrorTypeFatal, v13, 0));
  v24 = objc_msgSend(v51, "MCCopyAsPrimaryError");

  a6 = v49;
  if (!v24)
  {
LABEL_12:
    if ((objc_msgSend(v16, "isManagedByMDM") & 1) != 0)
    {
      v24 = 0;
    }
    else
    {
      v34 = MCInstallationErrorDomain;
      v35 = MCErrorArray(CFSTR("ERROR_PROFILE_ASSUME_OWNERSHIP_NOT_MANAGED_P_ID"));
      v36 = a6;
      v37 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v34, 4051, v37, MCErrorTypeFatal, v13, 0));
      v24 = objc_msgSend(v38, "MCCopyAsPrimaryError");

      a6 = v36;
      if (v24)
        goto LABEL_19;
    }
    if (v16)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "installOptions"));
      v40 = objc_msgSend(v39, "mutableCopy");

      v41 = kMCInstallProfileOptionManagingProfileIdentifier;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", kMCInstallProfileOptionManagingProfileIdentifier));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", 0, v41);
      v43 = kMCInstallProfileOptionInstalledBy;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCInstallProfileOptionInstalledBy));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v44, v43);

      objc_msgSend(v40, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v17);
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("RemoteManagement.UserInfo")));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v45, CFSTR("RemoteManagement.UserInfo"));

      objc_msgSend(v16, "setInstallOptions:", v40);
      if (v62 == 2)
        v46 = sub_1000443A8();
      else
        v46 = sub_1000443E4();
      v58 = (void *)objc_claimAutoreleasedReturnValue(v46);
      v55 = v63;
      v57 = v64;
      objc_msgSend(v16, "writeStubToDirectory:", v58);

      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      objc_msgSend(v63, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:", v59, v42, kMCDMManagingProfileToManagedProfileKey, kMCDMManagedProfileToManagingProfileKey, 1, 1);

      objc_msgSend(v63, "commitChanges");
      v60 = objc_opt_new(MCProfileEventsManager);
      -[MCProfileEventsManager addEventForProfile:operation:source:](v60, "addEventForProfile:operation:source:", v16, CFSTR("assume-ownership"), v64);

      v56 = v13;
      v24 = 0;
      goto LABEL_27;
    }
  }
LABEL_19:
  v52 = _MCLogObjects[9];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543362;
    v66 = v54;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Installation failed. Error: %{public}@", buf, 0xCu);

  }
  v55 = v63;
  if (a6)
  {
    v24 = objc_retainAutorelease(v24);
    v56 = 0;
    *a6 = v24;
  }
  else
  {
    v56 = 0;
  }
  v57 = v64;
LABEL_27:

  return v56;
}

- (BOOL)_allowsPasswordPoliciesFromProfile:(id)a3 outError:(id *)a4
{
  id v5;
  BOOL v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a3;
  if ((+[MCRestrictionManager mayChangePasscode](MCRestrictionManager, "mayChangePasscode") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = objc_msgSend(v5, "payloadsOfKindOfClass:", objc_opt_class(MCPasswordPolicyPayload));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v24 = a4;
      v25 = v5;
      v11 = 0;
      v12 = *(_QWORD *)v28;
LABEL_5:
      v13 = 0;
      v14 = v11;
      while (1)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "restrictions"));
        v26 = v14;
        v18 = objc_msgSend(v16, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v17, &v26);
        v11 = v26;

        if ((v18 & 1) == 0)
          break;
        v13 = (char *)v13 + 1;
        v14 = v11;
        if (v10 == v13)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v10)
            goto LABEL_5;
          v6 = 1;
          goto LABEL_15;
        }
      }
      v6 = (char)v24;
      if (v24)
      {
        v19 = MCInstallationErrorDomain;
        v5 = v25;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "friendlyName"));
        v21 = MCErrorArray(CFSTR("ERROR_PROFILE_REQUIRES_PASSCODE_CHANGE"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *v24 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v19, 4026, v22, v11, MCErrorTypeFatal, v20, 0));

        v6 = 0;
        goto LABEL_16;
      }
LABEL_15:
      v5 = v25;
    }
    else
    {
      v11 = 0;
      v6 = 1;
    }
LABEL_16:

  }
  return v6;
}

- (BOOL)_overrideProfileValidation
{
  int AppBooleanValue;
  BOOL result;
  Boolean keyExistsAndHasValidFormat;

  result = 0;
  if (os_variant_has_internal_ui("com.apple.ManagedConfiguration.OverrideProfileValidation", a2))
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(kMCInternalOverrideProfileValidationKey, kCFPreferencesAnyApplication, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && AppBooleanValue != 0)
      return 1;
  }
  return result;
}

- (id)_errorUnacceptablePayload:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = MCInstallationErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "type"));
  v5 = MCErrorArray(CFSTR("ERROR_UNNACEPTABLE_PAYLOAD_P_TYPE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 4022, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (id)_preflightProfileForInstallationOnHomePod:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];

  v4 = a3;
  if (-[MCInstaller _overrideProfileValidation](self, "_overrideProfileValidation"))
  {
    v5 = _MCLogObjects[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Overriding profile validation for HomePod", buf, 2u);
    }
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload remoteQueueableHomePodPayloadClasses](MCPayload, "remoteQueueableHomePodPayloadClasses"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloads", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v7, "containsObject:", objc_opt_class(v13)) & 1) == 0)
          {
            v14 = _MCLogObjects[9];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = v14;
              v16 = (objc_class *)objc_opt_class(v13);
              v17 = NSStringFromClass(v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
              *(_DWORD *)buf = 138543618;
              v26 = v18;
              v27 = 2114;
              v28 = v19;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Payload class %{public}@ (%{public}@) is not available on HomePod", buf, 0x16u);

            }
            v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _errorUnacceptablePayload:](self, "_errorUnacceptablePayload:", v13));
            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_17:

  }
  return v6;
}

- (id)_preflightProfileForInstallationOnWatch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  const char *v22;
  os_log_t v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  NSString *v29;
  MCInstaller *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v4 = a3;
  if (-[MCInstaller _overrideProfileValidation](self, "_overrideProfileValidation"))
  {
    v5 = _MCLogObjects[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Overriding profile validation for Watch", buf, 2u);
    }
    v6 = 0;
  }
  else
  {
    v36 = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _watchInformationOutIsCellularSupported:](self, "_watchInformationOutIsCellularSupported:", &v36));
    if (qword_1000FD930 != -1)
      dispatch_once(&qword_1000FD930, &stru_1000E3CD8);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloads"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v9)
    {
      v10 = v9;
      v31 = self;
      v11 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend((id)qword_1000FD928, "containsObject:", objc_opt_class(v13)) & 1) == 0)
          {
            v16 = _MCLogObjects[9];
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              goto LABEL_29;
            v17 = v16;
            v18 = (objc_class *)objc_opt_class(v13);
            v19 = NSStringFromClass(v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
            *(_DWORD *)buf = 138543618;
            v38 = v20;
            v39 = 2114;
            v40 = v21;
            v22 = "Payload class %{public}@ (%{public}@) is not available on Watch";
            goto LABEL_27;
          }
          if (objc_msgSend(v7, "count")
            && (objc_msgSend(v13, "isSupportedByWatchVersions:", v7) & 1) == 0)
          {
            v23 = _MCLogObjects[9];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v17 = v23;
              v24 = (objc_class *)objc_opt_class(v13);
              v25 = NSStringFromClass(v24);
              v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
              *(_DWORD *)buf = 138543874;
              v38 = v20;
              v39 = 2114;
              v40 = v21;
              v41 = 2114;
              v42 = v26;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Payload class %{public}@ (%{public}@) is not supported on any Watch version: %{public}@", buf, 0x20u);

              goto LABEL_28;
            }
LABEL_29:
            v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _errorUnacceptablePayload:](v31, "_errorUnacceptablePayload:", v13, v31));
            goto LABEL_30;
          }
          if (!v36)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload cellularRequiredPayloads](MCPayload, "cellularRequiredPayloads"));
            v15 = objc_msgSend(v14, "containsObject:", objc_opt_class(v13));

            if (v15)
            {
              v27 = _MCLogObjects[9];
              if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                goto LABEL_29;
              v17 = v27;
              v28 = (objc_class *)objc_opt_class(v13);
              v29 = NSStringFromClass(v28);
              v20 = (void *)objc_claimAutoreleasedReturnValue(v29);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
              *(_DWORD *)buf = 138543618;
              v38 = v20;
              v39 = 2114;
              v40 = v21;
              v22 = "Payload class %{public}@ (%{public}@) requires a cellular-capable Watch";
LABEL_27:
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);
LABEL_28:

              goto LABEL_29;
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
        v6 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v6 = 0;
    }
LABEL_30:

  }
  return v6;
}

- (id)_watchInformationOutIsCellularSupported:(BOOL *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  NSNumber *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  id v21;
  BOOL *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry pairedDevicesSelectorBlock](NRPairedDeviceRegistry, "pairedDevicesSelectorBlock"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v6));

  if (objc_msgSend(v7, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", NRWatchOSVersionForRemoteDevice(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i)));
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          objc_msgSend(v4, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

  }
  if (v7 && objc_msgSend(v7, "count"))
  {
    v23 = a3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      while (2)
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
          v21 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("4AA3FF3B-3224-42E6-995E-481F49AE9260"));
          LODWORD(v20) = objc_msgSend(v20, "supportsCapability:", v21);

          if ((_DWORD)v20)
          {
            *v23 = 1;
            goto LABEL_22;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v17)
          continue;
        break;
      }
    }
LABEL_22:

  }
  return v4;
}

- (id)_profileNotEligibleErrorWithProfile:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = MCInstallationErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "friendlyName"));
  v5 = MCErrorArray(CFSTR("ERROR_PROFILE_UPDATE_NOT_ELIGIBLE_P_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 4012, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 outError:(id *)a6
{
  return -[MCInstaller updateProfileWithIdentifier:interactionClient:installForSystem:source:outError:](self, "updateProfileWithIdentifier:interactionClient:installForSystem:source:outError:", a3, a4, 1, a5, a6);
}

- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 installForSystem:(BOOL)a5 source:(id)a6 outError:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  _UNKNOWN **v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  MCInstaller *v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[4];
  void *v69;

  v10 = a3;
  v11 = a4;
  v63 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allInstalledUserProfileIdentifiers"));

  v15 = objc_msgSend(v14, "containsObject:", v10);
  v16 = (int)v15;
  if ((_DWORD)v15)
    v17 = MCUserProfileStorageDirectory();
  else
    v17 = MCSystemProfileStorageDirectory(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "MCHashedFilenameWithExtension:", CFSTR("stub")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v20));
  v67 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v21, &v67));
  v23 = v67;
  if (v23)
    goto LABEL_10;
  v24 = objc_opt_class(MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
  {
    v23 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _profileNotEligibleErrorWithProfile:](self, "_profileNotEligibleErrorWithProfile:", v22));
LABEL_10:
    v27 = v23;
    v28 = 0;
    goto LABEL_11;
  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "OTAProfile"));
  if (v61)
  {
    v60 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    v26 = objc_msgSend(v25, "isDeviceLocked");

    if (v26)
    {
      v27 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _deviceLockedError](self, "_deviceLockedError"));
      v28 = 0;
      v11 = v60;
    }
    else
    {
      v37 = MCLocalizedString(CFSTR("INSTALL_STATUS_UPDATING_PROFILE"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      objc_msgSend(v60, "setDefaultStatus:", v38);

      v11 = v60;
      v65 = 0;
      v66 = 0;
      v57 = objc_msgSend(v61, "createHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "fetchFinalProfileWithClient:outProfileData:outError:", v60, &v66, &v65));
      v58 = v66;
      v39 = v65;
      if (v39)
      {
        v27 = v39;
        v28 = 0;
      }
      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "identifier"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v55 = objc_msgSend(v40, "isEqualToString:", v41);

        if ((v55 & 1) != 0)
        {
          v56 = objc_msgSend(v59, "createHandler");
          if (v56)
          {
            v11 = v60;
            if (v60 && (objc_msgSend(v60, "didBeginInstallingNextProfileData:", v58) & 1) == 0)
            {
              v47 = v56;
              v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "userCancelledError"));
              v28 = 0;
            }
            else
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
              v52 = self;
              v44 = objc_claimAutoreleasedReturnValue(-[MCInstaller _managingProfileIdentifierForProfileIdentifier:](self, "_managingProfileIdentifierForProfileIdentifier:", v43));

              v54 = (void *)v44;
              if (v44)
                objc_msgSend(v42, "setObject:forKeyedSubscript:", v44, kMCInstallProfileOptionManagingProfileIdentifier);
              if (v16)
                v45 = &off_1000ED1C0;
              else
                v45 = &off_1000ED1D8;
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, kMCInstallProfileOptionFilterFlag);
              objc_msgSend(v42, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMCInstallProfileOptionIsOTAInstallation);
              objc_msgSend(v42, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMCInstallProfileOptionIsOTAUpdate);
              v46 = +[MCProfile newProfileSignatureVersion](MCProfile, "newProfileSignatureVersion");
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v46, kMCInstallProfileOptionSignatureVersion);

              v64 = 0;
              v47 = v56;
              v11 = v60;
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _installProfileHandler:options:interactionClient:source:outError:](v52, "_installProfileHandler:options:interactionClient:source:outError:", v56, v42, v60, v63, &v64));
              v53 = v42;
              v27 = v64;

            }
          }
          else
          {
            v27 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _malformedPayloadErrorInternal:](self, "_malformedPayloadErrorInternal:", 0));
            v28 = 0;
            v11 = v60;
            v47 = 0;
          }
        }
        else
        {
          v48 = MCInstallationErrorDomain;
          v49 = MCErrorArray(CFSTR("ERROR_PROFILE_UPDATE_NOT_SAME_IDENTIFIER"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(v49);
          v27 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v48, 4010, v47, MCErrorTypeFatal, 0));
          v28 = 0;
          v11 = v60;
        }

      }
    }
  }
  else
  {
    v27 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _profileNotEligibleErrorWithProfile:](self, "_profileNotEligibleErrorWithProfile:", v22));
    v28 = 0;
  }

LABEL_11:
  v29 = objc_msgSend(v12, "commitChanges");
  if (v28)
    MCSendProfileListChangedNotification(v29);
  if (v27)
  {
    v30 = MCInstallationErrorDomain;
    if (v22)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "friendlyName"));
      v50 = v21;
      v51 = 0;
      v31 = MCErrorArray(CFSTR("ERROR_PROFILE_UPDATE_FAILED_P_ID"));
    }
    else
    {
      v50 = 0;
      v31 = MCErrorArray(CFSTR("ERROR_PROFILE_UPDATE_FAILED"));
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v30, 4013, v32, v27, MCErrorTypeFatal, v50, v51));
    if (v22)
    {

      v32 = v21;
    }

    v35 = _MCLogObjects[9];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v69 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Profile update failed: %{public}@", buf, 0xCu);
    }
    if (a7)
      *a7 = objc_retainAutorelease(v34);

    v33 = 0;
  }
  else
  {
    v33 = v28;
  }

  return v33;
}

- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  NSDictionary *currentlyInstallingRestrictions;
  unsigned int v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  id v20;

  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kMCIDResponseKey));
    if (v10)
    {
      currentlyInstallingRestrictions = self->_currentlyInstallingRestrictions;
      v20 = 0;
      v12 = +[MCPasscodeManagerWriter passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:](MCPasscodeManagerWriter, "passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:", v10, currentlyInstallingRestrictions, 1, &v20);
      v13 = v20;
      v14 = v13;
      if (a6)
      {
        if (v12)
          v15 = 1;
        else
          v15 = v13 == 0;
        if (!v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
          v17 = objc_msgSend(v16, "mutableCopy");

          objc_msgSend(v17, "setObject:forKey:", MCErrorTypeNeedsRetry, MCErrorTypeKey);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
          *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v14, "code"), v17));

        }
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)_removeOrphanedResourcesOptions:(id)a3 includingAccounts:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *k;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *m;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *n;
  const void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *ii;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  unsigned int v67;
  NSObject *v68;
  os_log_t v69;
  NSObject *v70;
  id v71;
  NSObject *v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  void *jj;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  id obj;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  CFTypeRef cf;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  CFTypeRef v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];

  v83 = a4;
  v85 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v6 = kMCDMManagedProfileToManagingProfileKey;
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orphanedParentsForDomain:", kMCDMManagedProfileToManagingProfileKey));
  if (objc_msgSend(v84, "count"))
  {
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v7 = v84;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v116 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dependentsOfParent:inSystemDomain:", v12, v6));
          v14 = objc_msgSend(v13, "count");

          if (!v14)
            v15 = -[MCInstaller _reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:](self, "_reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:", v12, 1, 0, CFSTR("Orphaned Resource Removal"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dependentsOfParent:inUserDomain:", v12, v6));
          v17 = objc_msgSend(v16, "count");

          if (!v17)
            v18 = -[MCInstaller _reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:](self, "_reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:", v12, 2, 0, CFSTR("Orphaned Resource Removal"));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
      }
      while (v9);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "effectiveUserSettings"));
    objc_msgSend(v19, "recomputeHacksAfterProfileChangesEffectiveUserSettings:sendNotifications:", v21, 1);

  }
  v22 = kMCDMProvisioningProfileToManagingProfileKey;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orphanedParentsForDomain:", kMCDMProvisioningProfileToManagingProfileKey));
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v112;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v112 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)j);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dependentsOfParent:inDomain:", v27, v22));
        v29 = objc_msgSend(v28, "count");

        if (!v29)
          v30 = -[MCInstaller removeProvisioningProfileUUID:sender:](self, "removeProvisioningProfileUUID:sender:", v27, CFSTR("MCInstaller.removeOrphanedResources"));
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
    }
    while (v24);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orphanedParentsForDomain:", kMCDMCertificateToPayloadUUIDDependencyKey));
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v108;
    do
    {
      for (k = 0; k != v33; k = (char *)k + 1)
      {
        if (*(_QWORD *)v108 != v34)
          objc_enumerationMutation(v31);
        -[MCInstaller _removeOrphanedCertificateDependencyManager:persistentID:persona:](self, "_removeOrphanedCertificateDependencyManager:persistentID:persona:", v5, *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)k), 0);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
    }
    while (v33);
  }
  v82 = v31;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orphanedParentsForDomain:", kMCDMEnterpriseCertificateToPayloadUUIDDependencyKey));
  if (objc_msgSend(v36, "count"))
  {
    v37 = kMDMPersonaKey;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", kMDMPersonaKey));
    v39 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", v37));
    else
      v40 = 0;

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v41 = v36;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v104;
      do
      {
        for (m = 0; m != v43; m = (char *)m + 1)
        {
          if (*(_QWORD *)v104 != v44)
            objc_enumerationMutation(v41);
          -[MCInstaller _removeOrphanedCertificateDependencyManager:persistentID:persona:](self, "_removeOrphanedCertificateDependencyManager:persistentID:persona:", v5, *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)m), v40);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
      }
      while (v43);
    }

  }
  v81 = v36;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v46, "removeOrphanedClientRestrictions");

  +[MCAirPlayPayloadHandler recomputeAirPlaySettings](MCAirPlayPayloadHandler, "recomputeAirPlaySettings");
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v87 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orphanedParentsForDomain:", kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey));
  v47 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v100;
    v50 = kMCAirPlayPasswordServiceKey;
    v51 = kMCAppleKeychainGroup;
    do
    {
      for (n = 0; n != v48; n = (char *)n + 1)
      {
        if (*(_QWORD *)v100 != v49)
          objc_enumerationMutation(v87);
        v53 = *(const void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)n);
        v54 = _MCLogObjects[9];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v122 = v53;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Removing AirPlay password for device name %{public}@", buf, 0xCu);
        }
        +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", v50, v53, 0, 0, 1, v51);
      }
      v48 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
    }
    while (v48);
  }
  v55 = kMCDMFontURLToProfileIdentifierKey;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orphanedParentsForDomain:", kMCDMFontURLToProfileIdentifierKey));
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v56, "count")));
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v89 = v56;
  v57 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v95, v120, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v96;
    do
    {
      for (ii = 0; ii != v58; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v96 != v59)
          objc_enumerationMutation(v89);
        v61 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)ii);
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dependentsOfParent:inDomain:", v61, v55));
        v63 = objc_msgSend(v62, "count");

        if (!v63)
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v61));
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "path"));
          v67 = objc_msgSend(v65, "fileExistsAtPath:", v66);

          if (v67)
          {
            v68 = _MCLogObjects[9];
            if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v122 = v64;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Removing font at %{public}@", buf, 0xCu);
            }
            objc_msgSend(v86, "addObject:", v64);
          }

        }
      }
      v58 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v95, v120, 16);
    }
    while (v58);
  }

  v69 = _MCLogObjects[9];
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    v70 = v69;
    v71 = objc_msgSend(v89, "count");
    *(_DWORD *)buf = 134217984;
    v122 = v71;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Unregistering %lu fonts.", buf, 0xCu);

  }
  cf = 0;
  GSFontUnregisterPersistentURLs(v86, &cf);
  v72 = _MCLogObjects[9];
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v122 = cf;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Results: %{public}@", buf, 0xCu);
  }
  if (cf)
    CFRelease(cf);
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v73 = v86;
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v90, v119, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v91;
    do
    {
      for (jj = 0; jj != v75; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v91 != v76)
          objc_enumerationMutation(v73);
        v78 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)jj);
        GSFontUnregisterURL(v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v79, "removeItemAtURL:error:", v78, 0);

      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v90, v119, 16);
    }
    while (v75);
  }

  if (v83)
  {
    v80 = _MCLogObjects[9];
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "Fixing orphaned accounts...", buf, 2u);
    }
    +[MCAccountUtilities checkAccountConsistencyAndReleaseOrphanedAccounts](MCAccountUtilities, "checkAccountConsistencyAndReleaseOrphanedAccounts");
  }

}

- (void)_removeOrphanedCertificateDependencyManager:(id)a3 persistentID:(id)a4 persona:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unsigned int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  const void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dependentsOfParent:inDomain:", v9, kMCDMCertificateToHostIdentifierDependencyKey));
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    v13 = -[MCInstaller isCertificateReference:aliasedInDependencyManager:](self, "isCertificateReference:aliasedInDependencyManager:", v9, v8);
    v14 = _MCLogObjects[9];
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping aliased certificate with persistent ID %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing certificate with persistent ID %{public}@", buf, 0xCu);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataWithHexString:](NSData, "MCDataWithHexString:", v9));
      v17 = +[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", v16, 1);
      if (v17)
      {
        v18 = v17;
        if (SecCertificateIsSelfSignedCA(v17))
        {
          v19 = SecTrustStoreForDomain(2);
          SecTrustStoreRemoveCertificate(v19, v18);
        }
        CFRelease(v18);
      }
      if (objc_msgSend(v10, "length"))
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10004ED3C;
        v21[3] = &unk_1000E2C50;
        v22 = v16;
        v20 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v10, v21);

      }
      else
      {
        +[MCKeychain removeItemWithPersistentID:useSystemKeychain:](MCKeychain, "removeItemWithPersistentID:useSystemKeychain:", v16, 1);
      }

    }
  }

}

- (id)_managingProfileIdentifierForProfileIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dependentsOfParent:inDomain:", v3, kMCDMManagedProfileToManagingProfileKey));

  if (objc_msgSend(v5, "count"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
  else
    v6 = 0;

  return v6;
}

- (void)removeAllProfilesFromInstallationQueue
{
  -[NSMutableArray removeAllObjects](self->_queuedProfiles, "removeAllObjects");
}

- (id)_reallyRemoveInstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _reallyRemoveProfileWithIdentifier:installationType:profileInstalled:targetDeviceType:options:source:](self, "_reallyRemoveProfileWithIdentifier:installationType:profileInstalled:targetDeviceType:options:source:", v12, a4, 1, +[MCProfile thisDeviceType](MCProfile, "thisDeviceType"), v11, v10));

  return v13;
}

- (id)_reallyRemoveProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 profileInstalled:(BOOL)a5 targetDeviceType:(unint64_t)a6 options:(id)a7 source:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  id v27;
  int v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  char v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  os_log_t v39;
  NSObject *v40;
  void *v41;
  MCProfileEventsManager *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  os_log_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  char v58;
  void *v59;
  id v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;

  v11 = a5;
  v14 = a3;
  v15 = a7;
  v16 = a8;
  if (!v14)
  {
    v30 = _MCLogObjects[5];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Profile identifier is nil.", buf, 2u);
    }
    goto LABEL_21;
  }
  if (v11)
  {
    v17 = objc_claimAutoreleasedReturnValue(-[MCInstaller pathToInstalledProfileByIdentifier:installationType:](self, "pathToInstalledProfileByIdentifier:installationType:", v14, a4));
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v17));
      if (!v19)
      {
        v35 = _MCLogObjects[5];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Cannot load profile to uninstall.", buf, 2u);
        }
        v27 = 0;
        v57 = 0;
        v28 = 0;
        v29 = 0;
        v58 = 1;
LABEL_30:

        -[MCInstaller _cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:](self, "_cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:", v14, a4 == 2, v29, v27);
        if (v28)
        {
          v44 = _MCLogObjects[9];
          v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
          if ((_DWORD)v45)
          {
            v46 = v44;
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "profile"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
            *(_DWORD *)buf = 138543362;
            v62 = v48;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Profile “%{public}@“ removed", buf, 0xCu);

          }
          if ((_DWORD)v57)
            v45 = notify_post((const char *)objc_msgSend(MCDefaultsDidChangeNotification, "UTF8String"));
          if (HIDWORD(v57))
            MDMSendDevicePostureChangedNotification(v45);
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          objc_msgSend(v49, "removeItemAtPath:error:", v18, 0);

        }
        v33 = v58;
        if (a4 == 2)
          goto LABEL_39;
        goto LABEL_20;
      }
      v60 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v19, &v60));
      v21 = v60;
      v55 = v21;
      v56 = v20;
      if (v21)
      {
        v22 = v21;
        v23 = _MCLogObjects[5];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "MCVerboseDescription"));
          *(_DWORD *)buf = 138543362;
          v62 = v25;
          v26 = "Cannot parse profile to uninstall. Error: %{public}@";
LABEL_8:
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);

        }
      }
      else
      {
        v36 = objc_msgSend(v20, "createHandler");
        if (v36)
        {
          v29 = v36;
          v54 = v19;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "currentRestrictions"));
          v27 = objc_msgSend(v38, "MCDeepCopy");

          v39 = _MCLogObjects[5];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "profile"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "identifier"));
            *(_DWORD *)buf = 138543618;
            v62 = v41;
            v63 = 2114;
            v64 = v16;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Removing profile “%{public}@” on behalf of “%{public}@”...", buf, 0x16u);

          }
          objc_msgSend(v29, "removeWithInstaller:options:", self, v15);
          v42 = objc_opt_new(MCProfileEventsManager);
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "profile"));
          -[MCProfileEventsManager addEventForProfile:operation:source:](v42, "addEventForProfile:operation:source:", v43, CFSTR("remove"), v16);

          LODWORD(v57) = objc_msgSend(v56, "containsPayloadOfClass:", objc_opt_class(MCDefaultsPayload));
          HIDWORD(v57) = objc_msgSend(v56, "containsPayloadOfClass:", objc_opt_class(MCMDMPayload));
          v58 = 0;
          v28 = 1;
          v19 = v54;
          goto LABEL_29;
        }
        v53 = _MCLogObjects[5];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v24 = v53;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "friendlyName"));
          *(_DWORD *)buf = 138543362;
          v62 = v25;
          v26 = "Cannot create handler for profile ‚“%{public}@”.";
          goto LABEL_8;
        }
      }
      v27 = 0;
      v57 = 0;
      v28 = 0;
      v29 = 0;
      v58 = 1;
LABEL_29:

      goto LABEL_30;
    }
    goto LABEL_16;
  }
  v31 = objc_claimAutoreleasedReturnValue(-[MCInstaller pathToUninstalledProfileByIdentifier:installationType:targetDeviceType:](self, "pathToUninstalledProfileByIdentifier:installationType:targetDeviceType:", v14, a4, a6));
  if (!v31)
  {
LABEL_16:
    v32 = _MCLogObjects[5];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v14;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Profile “%{public}@” is not installed. Ignoring.", buf, 0xCu);
    }
    if (v11)
    {
      -[MCInstaller _cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:](self, "_cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:", v14, a4 == 2, 0, 0);
      v29 = 0;
      v18 = 0;
      v27 = 0;
      v33 = 1;
      if (a4 == 2)
      {
LABEL_39:
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
        objc_msgSend(v34, "removeIdentifierFromUserManifest:flag:", v14, 3);
LABEL_40:

        if ((v33 & 1) == 0)
          goto LABEL_43;
        goto LABEL_41;
      }
LABEL_20:
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
      objc_msgSend(v34, "removeIdentifierFromSystemManifest:flag:", v14, 3);
      goto LABEL_40;
    }
LABEL_21:
    v27 = 0;
    v18 = 0;
    v29 = 0;
LABEL_41:
    v50 = _MCLogObjects[5];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v14;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Removed profile “%{public}@” from manifest anyway", buf, 0xCu);
    }
    goto LABEL_43;
  }
  v18 = (void *)v31;
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:](MCTargetDeviceResolver, "purgatorySupportedForDevice:", a6))
  {
    -[MCInstaller purgePurgatoryProfileWithIdentifier:targetDevice:](self, "purgePurgatoryProfileWithIdentifier:targetDevice:", v14, a6);
  }
  v27 = 0;
  v29 = 0;
LABEL_43:
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "profile"));

  return v51;
}

- (void)_cleanUpAfterRemovingProfileWithIdentifier:(id)a3 installedForUser:(BOOL)a4 profileHandler:(id)a5 oldRestrictions:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *i;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *j;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v43;
  void *v44;
  _BOOL4 v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v45 = a4;
  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentRestrictions"));
    v13 = objc_msgSend(v14, "MCDeepCopy");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "systemProfileRestrictions"));
  v16 = objc_msgSend(v15, "MCMutableDeepCopy");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userProfileRestrictions"));
  v18 = objc_msgSend(v17, "MCMutableDeepCopy");

  if (v45)
    v19 = v18;
  else
    v19 = v16;
  objc_msgSend(v19, "removeObjectForKey:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "profile"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "loggingID"));
  v44 = v18;
  objc_msgSend(v11, "setSystemProfileRestrictions:userProfileRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outAppWhitelistSettingsChanged:outRecomputedNag:outError:", v16, v18, v21, 0, 0, 0, 0, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentRestrictions"));
  objc_msgSend(v9, "didRemoveOldGlobalRestrictions:newGlobalRestrictions:", v13, v22);

  v23 = kMCDMManagingProfileToManagedProfileKey;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dependentsOfParent:inDomain:", v8, kMCDMManagingProfileToManagedProfileKey));
  v25 = kMCDMManagingProfileToProvisioningProfileKey;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dependentsOfParent:inDomain:", v8, kMCDMManagingProfileToProvisioningProfileKey));
  if (objc_msgSend(v24, "count") || objc_msgSend(v47, "count"))
  {
    v40 = v16;
    v41 = v13;
    v43 = v10;
    v46 = v9;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v39 = v24;
    v26 = objc_msgSend(v24, "copy");
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v53;
      v30 = kMCDMManagedProfileToManagingProfileKey;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(v12, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i), v8, v23, v30, 1, 1);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v28);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v32 = objc_msgSend(v47, "copy");
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    v16 = v40;
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v49;
      v36 = kMCDMProvisioningProfileToManagingProfileKey;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(v12, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j), v8, v25, v36, 1, 1);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v34);
    }

    v9 = v46;
    v13 = v41;
    v10 = v43;
    v24 = v39;
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _managingProfileIdentifierForProfileIdentifier:](self, "_managingProfileIdentifierForProfileIdentifier:", v8));
    if (v38)
      objc_msgSend(v12, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:", v8, v38, v23, kMCDMManagedProfileToManagingProfileKey, !v45);

  }
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5
{
  -[MCInstaller removeProfileWithIdentifier:installationType:options:source:](self, "removeProfileWithIdentifier:installationType:options:source:", a3, a4, 0, a5);
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v27 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  objc_msgSend(v27, "commitChanges");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentRestrictions"));
  v15 = objc_msgSend(v14, "MCDeepCopy");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:](self, "_reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:", v12, a4, v11, v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload accountPayloads](MCPayload, "accountPayloads"));
  v18 = objc_msgSend(v17, "setByAddingObject:", objc_opt_class(MCMDMPayload));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  -[MCInstaller _removeOrphanedResourcesOptions:includingAccounts:](self, "_removeOrphanedResourcesOptions:includingAccounts:", v11, objc_msgSend(v16, "containsAnyPayloadOfClasses:", v19));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "effectiveUserSettings"));
  objc_msgSend(v20, "recomputeHacksAfterProfileChangesEffectiveUserSettings:sendNotifications:", v22, 1);

  v23 = objc_msgSend(v20, "recomputeAccountVPNAssociations");
  LODWORD(v21) = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:](MCRestrictionManager, "isWebContentFilterUIActiveWithRestrictionDictionary:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentRestrictions"));
  LODWORD(v22) = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:](MCRestrictionManager, "isWebContentFilterUIActiveWithRestrictionDictionary:", v25);

  if ((_DWORD)v21 != (_DWORD)v22)
    MCSendWebContentFilterUIActiveChangedNotification(v26);
  MCSendProfileListChangedNotification(objc_msgSend(v27, "commitChanges"));

}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uninstalledProfileDataWithIdentifier:targetDevice:", v11, a5));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v9, 0));
  sub_10007AF48(v10, 1);
  MCSendProfileListChangedNotification(-[MCInstaller _reallyRemoveProfileWithIdentifier:installationType:profileInstalled:targetDeviceType:options:source:](self, "_reallyRemoveProfileWithIdentifier:installationType:profileInstalled:targetDeviceType:options:source:", v11, a4, 0, a5, 0, CFSTR("Uninstalled Profile Removal")));

}

- (void)removeManagedProfilesIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentsInDomain:", kMCDMManagingProfileToManagedProfileKey));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v5 = v8;
  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "installedSystemProfileWithIdentifier:", v8));

    if (!v7)
      -[MCInstaller removeProfileWithIdentifier:installationType:source:](self, "removeProfileWithIdentifier:installationType:source:", v8, 1, CFSTR("Managed Profile Removal"));

    v5 = v8;
  }

}

- (id)removeProvisioningProfileUUID:(id)a3 sender:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MCInstaller removing provisioning profile UUID %{public}@ on behalf of %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v8 = MISRemoveProvisioningProfile(v5);
  if ((_DWORD)v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  else
    v9 = 0;

  return v9;
}

- (void)removeUntrustedIdentitiesFromSender:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMProvisioningProfileTrust allTrustedSignerIdentities](MDMProvisioningProfileTrust, "allTrustedSignerIdentities"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
    v6 = MCFeatureTrustedCodeSigningIdentities;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "effectiveUnionValuesForSetting:", MCFeatureTrustedCodeSigningIdentities));
    v8 = (void *)v7;
    v9 = &__NSArray0__struct;
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v10));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    v14 = v12;
    if (v13)
    {
      v15 = v13;
      v23 = v6;
      v24 = v3;
      v16 = 0;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v12);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v4, "containsObject:", v19, v23) & 1) == 0)
          {
            v20 = _MCLogObjects[2];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v30 = v19;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Removing trusted identity '%{public}@' because it is not trusted by MIS", buf, 0xCu);
            }
            objc_msgSend(v11, "removeObject:", v19);
            ++v16;
          }
        }
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v15);

      v3 = v24;
      if (v16 < 1)
        goto LABEL_18;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
      objc_msgSend(v14, "setUnionValues:forSetting:sender:", v21, v23, v24);

    }
LABEL_18:

    goto LABEL_21;
  }
  v22 = _MCLogObjects[2];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "MCInstaller skipping untrusted identity purge after MIS get all signer identities failed", buf, 2u);
  }
LABEL_21:

}

- (id)verifiedMDMProfileIdentifierWithCleanUp
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  MCInstaller *v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  _BYTE v44[128];
  _BYTE v45[128];

  v3 = _MCLogObjects[9];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MCInstaller checking for MDM installation...", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiersOfProfilesWithFilterFlags:", 3));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = v5;
  v34 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v34)
  {

LABEL_23:
    v19 = _MCLogObjects[9];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "MCInstaller could not find an MDM installation. Removing MDM-related files...", buf, 2u);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = MDMFilePath(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v20, "removeItemAtPath:error:", v22, 0);

    v23 = MDMOutstandingActivitiesFilePath();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v20, "removeItemAtPath:error:", v24, 0);

    v25 = MDMUserFilePath();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v20, "removeItemAtPath:error:", v26, 0);

    v27 = MDMUserOutstandingActivitiesFilePath();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    objc_msgSend(v20, "removeItemAtPath:error:", v28, 0);

    -[MCInstaller removeManagedProfilesIfNecessary](self, "removeManagedProfilesIfNecessary");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
    objc_msgSend(v29, "refreshDetailsFromDisk");

    MDMSendManagingOrgInfoChangedNotification();
    v7 = 0;
    goto LABEL_26;
  }
  v32 = self;
  v7 = 0;
  v33 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v34; i = (char *)i + 1)
    {
      if (*(_QWORD *)v40 != v33)
        objc_enumerationMutation(v6);
      v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v9, v32));
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "payloads"));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v36;
        while (2)
        {
          for (j = 0; j != v13; j = (char *)j + 1)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
            v17 = objc_opt_class(MCMDMPayload);
            if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
            {
              v18 = v9;

              v7 = v18;
              goto LABEL_18;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_18:

    }
    v34 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  }
  while (v34);

  self = v32;
  if (!v7)
    goto LABEL_23;
LABEL_26:
  v30 = _MCLogObjects[9];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "MCInstaller finished checking for MDM installation", buf, 2u);
  }

  return v7;
}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *k;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  os_log_t v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(id, id);
  void *v52;
  void *v53;
  id v54;
  id obj;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];

  v51 = (void (**)(id, id))a3;
  v3 = _MCLogObjects[9];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Recomputing profile restrictions...", buf, 2u);
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allInstalledProfileIdentifiers"));

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v12 = sub_1000443E4();
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "MCHashedFilenameWithExtension:", CFSTR("stub")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v14));

        objc_msgSend(v4, "setObject:forKey:", v15, v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allInstalledUserProfileIdentifiers"));

  v67 = 0u;
  v65 = 0u;
  v66 = 0u;
  v64 = 0u;
  v54 = v17;
  v18 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v65 != v20)
          objc_enumerationMutation(v54);
        v22 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j);
        v23 = sub_1000443A8();
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "MCHashedFilenameWithExtension:", CFSTR("stub")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingPathComponent:", v25));

        objc_msgSend(v4, "setObject:forKey:", v26, v22);
      }
      v19 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    }
    while (v19);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v27 = v4;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v56 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(_QWORD *)v61 != v56)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)k);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", v32));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v33));
        if (v34)
        {
          v59 = v30;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v34, &v59));
          v36 = v59;

          if (v36)
          {
            v37 = _MCLogObjects[9];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v38 = v37;
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "MCVerboseDescription"));
              *(_DWORD *)buf = 138543618;
              v73 = v32;
              v74 = 2114;
              v75 = v39;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Error parsing stub for profile ID %{public}@. Error:%{public}@", buf, 0x16u);

            }
          }
          else
          {
            v58 = 0;
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "restrictionsWithHeuristicsAppliedOutError:", &v58));
            v36 = v58;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
            if (v41)
              objc_msgSend(v53, "setObject:forKey:", v41, v42);
            else
              objc_msgSend(v53, "removeObjectForKey:", v42);

            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "appAccessibilityParameters"));
            if (v43)
              objc_msgSend(v52, "addEntriesFromDictionary:", v43);

          }
          v30 = v36;
        }
        else
        {
          v40 = _MCLogObjects[9];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v73 = v32;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Can't read stub for profile ID %{public}@", buf, 0xCu);
          }
        }

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    }
    while (v29);
  }
  else
  {
    v30 = 0;
  }

  v44 = MCSystemAppAccessibilityParametersFilePath();
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  objc_msgSend(v52, "MCWriteToBinaryFile:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v57 = 0;
  objc_msgSend(v46, "setSystemProfileRestrictions:userProfileRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outAppWhitelistSettingsChanged:outRecomputedNag:outError:", v53, v50, CFSTR("MCInstaller.RecomputeProfileRestrictions"), 0, 0, 0, 0, &v57);
  v47 = v57;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "effectiveUserSettings"));
  objc_msgSend(v48, "recomputeHacksAfterProfileChangesEffectiveUserSettings:sendNotifications:", v49, 1);

  if (v51)
    v51[2](v51, v47);

}

+ (void)_setPathsSystemProfileStorageDirectory:(id)a3 userProfileStorageDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)qword_1000FD8F8;
  qword_1000FD8F8 = (uint64_t)v5;
  v9 = v5;

  v8 = (void *)qword_1000FD900;
  qword_1000FD900 = (uint64_t)v6;

}

+ (id)_installationFailureErrorWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v4, "isEqualToString:", ACErrorDomain))
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != (id)5)
  {
LABEL_5:
    v6 = CFSTR("INSTALLATION_FAILED");
    goto LABEL_6;
  }
  v6 = CFSTR("ACCOUNT_EXISTS");
LABEL_6:
  v7 = MCErrorArray(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCInstallationErrorDomain, 4001, v8, v3, MCErrorTypeFatal, 0));

  return v9;
}

- (id)_installedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v7 = v6;
  if (a4 == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifiersOfProfilesWithFilterFlags:", 9));

    if (objc_msgSend(v8, "containsObject:", v5))
    {
      v9 = sub_1000443A8();
      v10 = objc_claimAutoreleasedReturnValue(v9);
LABEL_6:
      v12 = (void *)v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "MCHashedFilenameWithExtension:", CFSTR("stub")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v13));

      goto LABEL_8;
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifiersOfProfilesWithFilterFlags:", 19));

    if (objc_msgSend(v8, "containsObject:", v5))
    {
      v11 = sub_1000443E4();
      v10 = objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_6;
    }
  }
  v14 = 0;
LABEL_8:

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v15, 0));

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_sendMDMEnrollmentEventWithInstallationOptions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
  objc_msgSend(v17, "refreshDetailsFromDisk");
  objc_msgSend(v4, "refreshDetailsFromDisk");
  v5 = objc_msgSend(v17, "isSupervised");
  v6 = objc_msgSend(v17, "isTeslaEnrolled");
  if (objc_msgSend(v17, "userMode") == 1)
    v7 = 1;
  else
    v7 = (uint64_t)+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personaID"));

  v9 = objc_msgSend(v4, "isUserEnrollment");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentMode"));
  if ((objc_msgSend(v10, "isEqualToString:", kMDMEnrollmentModeBYOD) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentMode"));
    v11 = (uint64_t)objc_msgSend(v12, "isEqualToString:", kMDMEnrollmentModeADDE);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMCInstallProfileOptionInstallationSource));
  v14 = objc_msgSend(v13, "isEqualToString:", kDMCProfileInstallationSourceReturnToService);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMCInstallProfileOptionIsESSOEnrollment));
  v16 = objc_msgSend(v15, "BOOLValue");

  DMCAnalyticsSendEnrollmentEvent(v5, v6 & v5, v7, v8 != 0, v9, v11, v14, v16);
}

+ (id)considerProfilesInstalledDuringBuddyForManagement
{
  void *v2;
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  NSMutableArray *v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v3 = objc_msgSend(v2, "isTeslaEnrolled");
  if ((_DWORD)v3)
  {
    v3 = objc_msgSend(v2, "isSupervised");
    v4 = (int)v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = MDMFilePath(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v6));

  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kMDMManagingProfileIdentifierKey));
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload mdmAdoptablePayloads](MCPayload, "mdmAdoptablePayloads"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v10 = objc_opt_new(NSMutableArray);
  if (v4 && objc_msgSend(v8, "length"))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100051134;
    v19[3] = &unk_1000E3D00;
    v11 = v8;
    v20 = v11;
    v21 = v9;
    v12 = objc_retainBlock(v19);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000511F4;
    v15[3] = &unk_1000E3D28;
    v16 = v11;
    v17 = v10;
    v18 = &v22;
    +[MCInstaller _enumerateProfilesWithCriteria:filterFlags:block:](MCInstaller, "_enumerateProfilesWithCriteria:filterFlags:block:", v12, 17, v15);

  }
  if (*((_BYTE *)v23 + 24))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
    objc_msgSend(v13, "commitChanges");

  }
  _Block_object_dispose(&v22, 8);

  return v10;
}

+ (void)_enumerateProfilesWithCriteria:(id)a3 filterFlags:(int)a4 block:(id)a5
{
  uint64_t v6;
  unsigned int (**v7)(id, void *);
  id v8;
  unsigned int (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = *(_QWORD *)&a4;
  v7 = (unsigned int (**)(id, void *))a3;
  v8 = a5;
  v9 = (unsigned int (**)(_QWORD, _QWORD))v8;
  if (v7 && v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifiersOfProfilesWithFilterFlags:", v6));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v18 = objc_autoreleasePoolPush();
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest", (_QWORD)v21));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "installedProfileWithIdentifier:", v17));

          if (v20 && v7[2](v7, v20) && !((unsigned int (**)(_QWORD, void *))v9)[2](v9, v20))
          {

            objc_autoreleasePoolPop(v18);
            goto LABEL_15;
          }

          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

- (BOOL)sendPurgatoryProfileData:(id)a3 identifier:(id)a4 targetDevice:(unint64_t)a5 outError:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;

  v10 = a3;
  v11 = a4;
  -[MCInstaller _replacePurgatoryProfilesForTargetDevice:](self, "_replacePurgatoryProfilesForTargetDevice:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest"));
  v19 = 0;
  v13 = objc_msgSend(v12, "addPurgatoryProfileData:identifier:targetDevice:outError:", v10, v11, a5, &v19);

  v14 = v19;
  if ((v13 & 1) != 0)
  {
    MCSendProfileListChangedNotification(-[MCInstaller _postPurgatoryFollowUpForProfileData:targetDevice:](self, "_postPurgatoryFollowUpForProfileData:targetDevice:", v10, a5));
  }
  else if (a6)
  {
    v15 = MCInstallationErrorDomain;
    v16 = MCErrorArray(CFSTR("ERROR_PROFILE_INSTALLATION_FAILED_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v15, 4043, v17, v14, MCErrorTypeFatal, 0));

  }
  return v13;
}

- (void)_postPurgatoryFollowUpForProfileData:(id)a3 targetDevice:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  unint64_t v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  uint8_t buf[4];
  id v43;

  v40 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", a3, &v40));
  v7 = v40;
  if (v7)
  {
    v8 = v7;
    v9 = _MCLogObjects[9];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Profile purgatory followUp failed to create MCProfile with error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    sub_10007AE8C(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller followUpController](self, "followUpController"));
    v39 = 0;
    v11 = objc_msgSend(v10, "clearPendingFollowUpItems:", &v39);
    v12 = v39;

    if ((v11 & 1) == 0)
    {
      v13 = _MCLogObjects[9];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Profile purgatory followUp failed to clear pending followUp items with error: %{public}@", buf, 0xCu);
      }
    }
    v14 = (void *)objc_opt_new(FLFollowUpAction);
    v15 = (void *)objc_opt_new(FLFollowUpItem);
    if (objc_msgSend(v6, "isUserEnrollmentProfile"))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organization"));
      v16 = MCLocalizedFormat(CFSTR("USER_ENROLLMENT_PROFILE_FOLLOWUP_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

      v18 = CFSTR("USER_ENROLLMENT_PROFILE_FOLLOWUP_ACTION_LABEL");
      v19 = &kMCSettingsURLOnsiteProfileInstallation;
    }
    else
    {
      v20 = MCLocalizedString(CFSTR("PURGATORY_FOLLOWUP_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v18 = CFSTR("PURGATORY_FOLLOWUP_ACTION_LABEL");
      v19 = &kMCSettingsURLProfilePurgatoryInstallation;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *v19, v34));
    objc_msgSend(v14, "setUrl:", v21);

    v22 = MCLocalizedString(v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v14, "setLabel:", v23);

    objc_msgSend(v15, "setTitle:", v17);
    objc_msgSend(v15, "setDisplayStyle:", 18);
    v41 = v14;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
    objc_msgSend(v15, "setActions:", v24);

    objc_msgSend(v15, "setGroupIdentifier:", FLGroupIdentifierDevice);
    objc_msgSend(v15, "setUniqueIdentifier:", CFSTR("com.apple.managedconfiguration.ios-purgatory"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller followUpController](self, "followUpController"));
    v38 = v12;
    v26 = objc_msgSend(v25, "postFollowUpItem:error:", v15, &v38);
    v8 = v38;

    if ((v26 & 1) == 0)
    {
      v27 = _MCLogObjects[9];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Profile purgatory followUp failed to post with error: %{public}@", buf, 0xCu);
      }
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller purgatoryTimer](self, "purgatoryTimer"));
    objc_msgSend(v28, "invalidate");

    v29 = objc_alloc((Class)NSTimer);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 480.0));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100051AB0;
    v35[3] = &unk_1000E3D78;
    v35[4] = self;
    v36 = v6;
    v37 = a4;
    v31 = objc_msgSend(v29, "initWithFireDate:interval:repeats:block:", v30, 0, v35, 0.0);
    -[MCInstaller setPurgatoryTimer:](self, "setPurgatoryTimer:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller purgatoryTimer](self, "purgatoryTimer"));
    objc_msgSend(v32, "addTimer:forMode:", v33, NSRunLoopCommonModes);

  }
}

- (void)_replacePurgatoryProfilesForTargetDevice:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uninstalledProfileIdentifiersForDevice:", a3));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uninstalledProfileDataWithIdentifier:targetDevice:", v10, a3));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v11, 0));
        v13 = v12;
        if (v12)
          sub_10007AF48(v12, 2);
        objc_msgSend(v4, "removeProfileDataWithIdentifier:fromHoldingTankForDevice:", v10, a3);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)purgePurgatoryProfilesForTargetDevice:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];

  v4 = _MCLogObjects[9];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Purging purgatory profiles", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uninstalledProfileIdentifiersForDevice:", a3));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = _MCLogObjects[9];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Purging purgatory profile data for identifier: %@", buf, 0xCu);
        }
        objc_msgSend(v5, "removeProfileDataWithIdentifier:fromHoldingTankForDevice:", v11, a3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }
  -[MCInstaller _purgatoryWorkerQueue_didPurgePurgatory:](self, "_purgatoryWorkerQueue_didPurgePurgatory:", objc_msgSend(v6, "count") != 0);

}

- (void)purgePurgatoryProfileWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  OS_dispatch_queue *purgatoryWorkerQueue;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uninstalledProfileIdentifiersForDevice:", a4));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isEqualToString:", v6))
        {
          objc_msgSend(v7, "removeProfileDataWithIdentifier:fromHoldingTankForDevice:", v13, a4);
          purgatoryWorkerQueue = self->_purgatoryWorkerQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100052038;
          block[3] = &unk_1000E2C50;
          block[4] = self;
          dispatch_sync((dispatch_queue_t)purgatoryWorkerQueue, block);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)_purgatoryWorkerQueue_didPurgePurgatory:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller purgatoryTimer](self, "purgatoryTimer"));
  objc_msgSend(v5, "invalidate");

  -[MCInstaller setPurgatoryTimer:](self, "setPurgatoryTimer:", 0);
  v6 = _MCLogObjects[9];
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Profile purgatory clearing pending follow up items...", buf, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller followUpController](self, "followUpController"));
    v13 = 0;
    v9 = objc_msgSend(v8, "clearPendingFollowUpItems:", &v13);
    v10 = v13;

    if ((v9 & 1) == 0)
    {
      v11 = _MCLogObjects[9];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Profile purgatory failed to clear pending follow up items with error: %@", buf, 0xCu);
      }
    }

    MCSendProfileListChangedNotification(v12);
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Profile purgatory is empty - skipping call to clear pending follow up items.", buf, 2u);
  }
}

- (id)peekPurgatoryProfileDataForTargetDevice:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uninstalledProfileIdentifiersForDevice:", a3));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uninstalledProfileDataWithIdentifier:targetDevice:", v6, a3));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isCertificateReference:(id)a3 aliasedInDependencyManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataWithHexString:](NSData, "MCDataWithHexString:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:](MCKeychain, "canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:", v6, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentsInDomain:", kMCDMCertificateToPayloadUUIDDependencyKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MCHexString"));
  if (objc_msgSend(v9, "containsObject:", v10))
  {
    v11 = _MCLogObjects[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MCHexString"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MCHexString"));
      *(_DWORD *)buf = 138543618;
      v36 = v13;
      v37 = 2114;
      v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Certificate ID %{public}@ is aliased to canonical ID %{public}@, which is still referenced.", buf, 0x16u);

    }
    v15 = 1;
  }
  else
  {
    v28 = v10;
    v29 = v5;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      while (2)
      {
        v20 = 0;
        v21 = v7;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataWithHexString:](NSData, "MCDataWithHexString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v20), v28, v29, (_QWORD)v30));
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:](MCKeychain, "canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:", v22, 1));

          if (objc_msgSend(v7, "isEqualToData:", v6))
          {
            v23 = _MCLogObjects[9];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = v23;
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MCHexString"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MCHexString"));
              *(_DWORD *)buf = 138543618;
              v36 = v25;
              v37 = 2114;
              v38 = v26;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Certificate ID %{public}@ is aliased to non-canonical ID %{public}@, which is still referenced.", buf, 0x16u);

            }
            v15 = 1;
            goto LABEL_17;
          }

          v20 = (char *)v20 + 1;
          v21 = v7;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v18)
          continue;
        break;
      }
    }

    v15 = 0;
LABEL_17:
    v10 = v28;
    v5 = v29;
  }

  return v15;
}

- (NSMutableDictionary)setAsideAccountIdentifiersByPayloadClass
{
  return self->_setAsideAccountIdentifiersByPayloadClass;
}

- (void)setSetAsideAccountIdentifiersByPayloadClass:(id)a3
{
  objc_storeStrong((id *)&self->_setAsideAccountIdentifiersByPayloadClass, a3);
}

- (NSMutableDictionary)setAsideDictionariesByPayloadClass
{
  return self->_setAsideDictionariesByPayloadClass;
}

- (void)setSetAsideDictionariesByPayloadClass:(id)a3
{
  objc_storeStrong((id *)&self->_setAsideDictionariesByPayloadClass, a3);
}

- (NSTimer)purgatoryTimer
{
  return self->_purgatoryTimer;
}

- (void)setPurgatoryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_purgatoryTimer, a3);
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_purgatoryTimer, 0);
  objc_storeStrong((id *)&self->_setAsideDictionariesByPayloadClass, 0);
  objc_storeStrong((id *)&self->_setAsideAccountIdentifiersByPayloadClass, 0);
  objc_storeStrong((id *)&self->_currentlyInstallingRestrictions, 0);
  objc_storeStrong((id *)&self->_purgatoryWorkerQueue, 0);
  objc_storeStrong((id *)&self->_queuedProfiles, 0);
}

@end
