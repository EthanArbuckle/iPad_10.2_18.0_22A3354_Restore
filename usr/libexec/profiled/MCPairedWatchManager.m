@implementation MCPairedWatchManager

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD);
  NSObject *v20;
  void *v21;
  unsigned __int8 v22;
  NSMutableDictionary *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint8_t v35[16];
  uint8_t v36[16];
  uint8_t v37[16];
  uint8_t buf[16];

  v11 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = (void (**)(id, _QWORD))a9;
  v20 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.stageMDMEnrollmentInfoForPairingWatchWithProfileData", buf, 2u);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v22 = objc_msgSend(v21, "isSupervised");

  if ((v22 & 1) != 0
    || (+[MCFeatureOverrides allowUnsupervisedWatchEnrollment](MCFeatureOverrides, "allowUnsupervisedWatchEnrollment") & 1) != 0)
  {
    v23 = objc_opt_new(NSMutableDictionary);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v24, kMCWatchEnrollmentSupervisionKey);

    v25 = +[DMCFeatureOverrides watchEnrollmentAllowLocalProfile](DMCFeatureOverrides, "watchEnrollmentAllowLocalProfile");
    if (v14 && (_DWORD)v25)
      v25 = -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v14, kMCWatchEnrollmentProfileDataKey);
    if (v15)
      v25 = -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v15, kMCWatchEnrollmentServiceURLKey);
    if (v16)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _derCertificatesFromPersistentRefArray:](self, "_derCertificatesFromPersistentRefArray:", v16));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v26, kMCWatchEnrollmentAnchorCertificatesKey);

    }
    if (v17)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v27, kMCWatchEnrollmentDeclarationKeysKey);

    }
    if (v18)
      v25 = -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v18, kMCWatchEnrollmentDeclarationConfigurationKey);
    v28 = MCSystemWatchEnrollmentDataFilePath(v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = -[NSMutableDictionary DMCWriteToBinaryFile:](v23, "DMCWriteToBinaryFile:", v29);

    v31 = _MCLogObjects[0];
    if (v30)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Watch enrollment successfully staged", v36, 2u);
      }
      v19[2](v19, 0);
    }
    else
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Watch enrollment could not be staged", v35, 2u);
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorEnrollmentCannotBeStaged](self, "_errorEnrollmentCannotBeStaged"));
      ((void (**)(id, void *))v19)[2](v19, v32);

    }
  }
  else
  {
    v33 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Watch enrollment could not be staged because phone is unsupervised", v37, 2u);
    }
    v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorPhoneUnsupervised](self, "_errorPhoneUnsupervised"));
    ((void (**)(id, NSMutableDictionary *))v19)[2](v19, v23);
  }

}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  NSObject *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v3 = (void (**)(id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = _MCLogObjects[0];
  v6 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.unstageMDMEnrollmentInfoForPairingWatchWithCompletion", buf, 2u);
  }
  v7 = MCSystemWatchEnrollmentDataFilePath(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ((objc_msgSend(v4, "fileExistsAtPath:", v8) & 1) != 0)
  {
    v12 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", v8, &v12);
    v9 = v12;
    if (v9)
    {
      v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Watch enrollment failed to unstage with error: %{public}@", buf, 0xCu);
      }
    }
    v3[2](v3, v9);

  }
  else
  {
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Watch enrollment could not be unstaged because it does not exist", buf, 2u);
    }
    v3[2](v3, 0);
  }

}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = _MCLogObjects[0];
  v5 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion", v9, 2u);
  }
  v6 = MCSystemWatchEnrollmentDataFilePath(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataFromFile:](NSData, "MCDataFromFile:", v7));

  v3[2](v3, v8, 0);
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v8 = _MCLogObjects[0];
  v9 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken", buf, 2u);
  }
  v10 = MCSystemWatchEnrollmentDataFilePath(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataFromFile:](NSData, "MCDataFromFile:", v11));

  if (v12)
  {
    v22 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v12, 1, 0, &v22));
    v14 = v22;
    if (v13 && (v15 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, kMCWatchEnrollmentPairingTokenKey);
      v21 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v13, 200, 0, &v21));
      v17 = v21;

      if (v16)
      {
        v18 = v16;
        v19 = 0;
      }
      else
      {
        v18 = 0;
        v19 = v17;
      }
      v7[2](v7, v18, v19);
      v14 = v17;
    }
    else
    {
      v20 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Watch enrollment is malformed: %{public}@", buf, 0xCu);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorEnrollmentMalformed](self, "_errorEnrollmentMalformed"));
      v7[2](v7, 0, v16);
    }

  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = _MCLogObjects[0];
  v6 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion", buf, 2u);
  }
  v7 = MCSystemWatchEnrollmentDataFilePath(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataFromFile:](NSData, "MCDataFromFile:", v8));

  if (v9)
  {
    v17 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v9, 0, 0, &v17));
    v11 = v17;
    if (v10 && (v12 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v10, v12) & 1) != 0))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMCWatchEnrollmentDeclarationKeysKey));
      if (v13 && (v14 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
        v4[2](v4, v15, 0);

      }
      else
      {
        v4[2](v4, 0, 0);
      }
    }
    else
    {
      v16 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Watch enrollment is malformed: %{public}@", buf, 0xCu);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorEnrollmentMalformed](self, "_errorEnrollmentMalformed"));
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v13);
    }

  }
  else
  {
    v4[2](v4, 0, 0);
  }

}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 usingProfileInstaller:(id)a5 cloudConfigReader:(id)a6 cloudConfigWriter:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, id);
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  id v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  void (**v60)(id, id);
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;

  v14 = a3;
  v54 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, id))a8;
  v19 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.applyPairingWatchMDMEnrollmentData", buf, 2u);
  }
  v63 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v14, 0, 0, &v63));
  v21 = v63;
  if (!v20 || (v22 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v20, v22) & 1) == 0))
  {
    v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v65 = v20;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Watch enrollment is malformed: %{public}@", buf, 0xCu);
    }
    v25 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorEnrollmentMalformed](self, "_errorEnrollmentMalformed"));
    goto LABEL_11;
  }
  if (+[DMCFeatureOverrides watchEnrollmentAllowLocalProfile](DMCFeatureOverrides, "watchEnrollmentAllowLocalProfile")&& (v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kMCWatchEnrollmentProfileDataKey))) != 0)
  {
    v47 = 0;
    v51 = 0;
  }
  else
  {
    v52 = v14;
    v27 = v17;
    v28 = v16;
    v29 = v15;
    v62 = v21;
    v30 = objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _serviceURLFromEnrollmentDictionary:outError:](self, "_serviceURLFromEnrollmentDictionary:outError:", v20, &v62));
    v25 = v62;

    if (v25)
    {
      v21 = (id)v30;
      v15 = v29;
      v16 = v28;
      v17 = v27;
      v14 = v52;
LABEL_11:

      v18[2](v18, v25);
      v26 = v54;
      goto LABEL_12;
    }
    v51 = (void *)v30;
    v23 = 0;
    v21 = 0;
    v47 = 1;
    v15 = v29;
    v16 = v28;
    v17 = v27;
    v14 = v52;
  }
  v53 = (void *)v23;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kMCWatchEnrollmentAnchorCertificatesKey));
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kMCWatchEnrollmentPairingTokenKey));
  v49 = (void *)v31;
  if (v31)
  {
    -[MCPairedWatchManager setPairingToken:](self, "setPairingToken:", v31);
    v32 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v33 = "applyPairingWatchMDMEnrollmentData: pairingToken extracted from enrollmentDictionary";
  }
  else
  {
    v32 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v33 = "applyPairingWatchMDMEnrollmentData: pairingToken in enrollmentDictionary is nil";
  }
  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, v33, buf, 2u);
LABEL_22:
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kMCWatchEnrollmentSupervisionKey));
  v35 = objc_opt_class(NSNumber);
  v48 = v34;
  if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
    v36 = objc_msgSend(v34, "BOOLValue");
  else
    v36 = 0;
  v61 = v21;
  -[MCPairedWatchManager _updateSupervision:cloudConfigReader:cloudConfigWriter:outError:](self, "_updateSupervision:cloudConfigReader:cloudConfigWriter:outError:", v36, v16, v17, &v61);
  v25 = v61;

  if (v25)
  {

    v21 = v53;
    goto LABEL_11;
  }
  v46 = v15;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10001BF04;
  v59[3] = &unk_1000E3460;
  v60 = v18;
  v37 = objc_retainBlock(v59);
  v38 = v37;
  if ((v47 & 1) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:managedConfigurationHelper:](DMCEnrollmentFlowController, "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:", 0, self));
    -[MCPairedWatchManager setEnrollmentController:](self, "setEnrollmentController:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager enrollmentController](self, "enrollmentController"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_10001BFDC;
    v55[3] = &unk_1000E36A0;
    v55[4] = self;
    v56 = v38;
    v41 = v38;
    v42 = v50;
    v43 = v51;
    objc_msgSend(v40, "startWatchEnrollmentFlowWithServiceURL:anchorCertificates:restartIfFail:completionHandler:", v51, v50, 0, v55);

    v44 = v53;
    v26 = v54;
  }
  else
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10001BFCC;
    v57[3] = &unk_1000E3678;
    v58 = v37;
    v45 = v37;
    v44 = v53;
    v26 = v54;
    objc_msgSend(v46, "installProfileData:interactionClient:options:source:completion:", v53, 0, 0, v54, v57);

    v42 = v50;
    v43 = v51;
  }

  v25 = 0;
  v15 = v46;
LABEL_12:

}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, id);
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v5 = (void (**)(id, void *, id))a4;
  v6 = kDMCPairingParametersSecurityTokenKey;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMobileGestalt deviceUDID](DMCMobileGestalt, "deviceUDID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kDMCPairingParametersWatchUDIDKey));

  v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.updateMDMEnrollmentInfoForPairingWatch security token: %@ ; deviceID : %@ ; watchID : %@",
      buf,
      0x20u);
  }
  v16 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration getWatchPairingTokenForPhoneID:watchID:securityToken:outError:](MDMConfiguration, "getWatchPairingTokenForPhoneID:watchID:securityToken:outError:", v9, v10, v8, &v16));
  v13 = v16;
  if (v13)
  {
    v14 = 0;
    v15 = v13;
  }
  else
  {
    v14 = v12;
    v15 = 0;
  }
  v5[2](v5, v14, v15);

}

- (id)getMachineInfoForEnrollmentType:(unint64_t)a3 enrollmentMethod:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[8];
  const __CFString *v13;
  void *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager pairingToken](self, "pairingToken"));

  if (v6)
  {
    v13 = CFSTR("PAIRING_TOKEN");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager pairingToken](self, "pairingToken"));
    v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudConfigurationMachineInfoDataWithAdditionalInfo:", v8));
  }
  else
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.getMachineIfoForEnrollmentType self.pairingToken==nil", v12, 2u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudConfigurationMachineInfo"));
  }

  return v9;
}

- (id)detailsFromMDMProfile:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", a3));
  if (v6)
  {
    v7 = objc_msgSend(v6, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 7));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, kMCBridgeProfileIdentifierKey);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedAppleID"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, kMCBridgeManagedAppleIDKey);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assignedManagedAppleID"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, kMCBridgeAssignedManagedAppleIDKey);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "friendlyName"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, kMCBridgeFriendlyNameKey);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _organizationNameFromProfile:payload:](self, "_organizationNameFromProfile:payload:", v6, v9));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, kMCBridgeOrganizationNameKey);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enrollmentMode"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, kMCBridgeEnrollmentModeKey);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverCapabilities"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, kMCBridgeServerCapabilitiesKey);

      v18 = objc_msgSend(v10, "copy");
    }
    else if (a4)
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorMissingMDMPayload](self, "_errorMissingMDMPayload"));
      v18 = 0;
      *a4 = v20;
    }
    else
    {
      v18 = 0;
    }

  }
  else if (a4)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorBadProfile](self, "_errorBadProfile"));
    v18 = 0;
    *a4 = v19;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_organizationNameFromProfile:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organization"));

  if (v7)
  {
    v8 = v6;
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "organization"));
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organization"));

  if (v9)
  {
    v8 = v5;
    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverURLString"));

  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverURLString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));

    if (v13)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "host"));

    }
    else
    {
      v10 = 0;
    }
  }
LABEL_6:

  return v10;
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v12, kMCInstallProfileOptionPersonaID);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, kMCInstallProfileOptionRMAccountIdentifier);
  if (v12)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", kDMCProfileInstallationSourceAccountDrivenUserEnrollment, kMCInstallProfileOptionInstallationSource);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMCInstallProfileOptionIsCloudLocked);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMCInstallProfileOptionIsCloudProfile);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001C7C8;
  v17[3] = &unk_1000E3678;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "installProfileData:interactionClient:options:source:completion:", v13, 0, v14, CFSTR("MCPairedWatchManager"), v17);

}

- (id)_derCertificatesFromPersistentRefArray:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  CFDataRef v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];

  v3 = a3;
  if (v3)
  {
    v15 = v3;
    v4 = objc_msgSend((id)objc_opt_class(DMCKeychain), "copyCertificatesWithPersistentIDs:useSystemKeychain:enforcePersonalPersona:", v3, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i));
          objc_msgSend(v5, "addObject:", v11);
          v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "_derCertificatesFromPersistentRefArray :: converted persistentRef to der NSData", buf, 2u);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v8);
    }

    v3 = v15;
  }
  else
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
    }
    v5 = 0;
  }

  return v5;
}

- (id)_serviceURLFromEnrollmentDictionary:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  id v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kMCWatchEnrollmentServiceURLKey));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v14 = 138543362;
        v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Watch enrollment service URL is invalid: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorInvalidServiceURL](self, "_errorInvalidServiceURL"));
    }

  }
  else
  {
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Watch enrollment is missing a profile service URL: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v9 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorMissingServiceURL](self, "_errorMissingServiceURL"));
  }

  return v9;
}

- (BOOL)_updateSupervision:(BOOL)a3 cloudConfigReader:(id)a4 cloudConfigWriter:(id)a5 outError:(id *)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  NSObject *v16;
  id v17;
  int v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "refreshDetailsFromDisk");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "details"));
  v12 = objc_msgSend(v11, "mutableCopy");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, kMCCCIsSupervisedKey);

  }
  else
  {
    v14 = objc_msgSend((id)objc_opt_class(v9), "canonicalConfigurationWithSupervision:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue(v14);
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_1000ED0D0, kCCConfigurationSourceKey);
  v15 = objc_msgSend(v10, "saveCloudConfigurationDetails:outError:", v12, a6);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v10, "finalizeCloudConfigurationOutError:", 0);
  }
  else
  {
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v17 = *a6;
      v19 = 138543362;
      v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Watch enrollment failed to apply supervision state: %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }

  return v15;
}

- (id)_errorEnrollmentCannotBeStaged
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MDMErrorDomain;
  v3 = DMCErrorArray(CFSTR("MDM_ERROR_WATCH_ENROLLMENT_CANNOT_BE_STAGED"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12116, v4, DMCErrorTypeFatal));

  return v5;
}

- (id)_errorPhoneUnsupervised
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MDMErrorDomain;
  v3 = DMCErrorArray(CFSTR("MDM_ERROR_WATCH_ENROLLMENT_PHONE_UNSUPERVISED"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12121, v4, DMCErrorTypeFatal, 0));

  return v5;
}

- (id)_errorEnrollmentMalformed
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MDMErrorDomain;
  v3 = DMCErrorArray(CFSTR("MDM_ERROR_WATCH_ENROLLMENT_MALFORMED"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12008, v4, DMCErrorTypeFatal, 0));

  return v5;
}

- (id)_errorMissingServiceURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MDMErrorDomain;
  v3 = DMCErrorArray(CFSTR("MDM_ERROR_WATCH_ENROLLMENT_MISSING_SERVICE_URL"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12117, v4, DMCErrorTypeFatal, 0));

  return v5;
}

- (id)_errorInvalidServiceURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MDMErrorDomain;
  v3 = DMCErrorArray(CFSTR("MDM_ERROR_WATCH_ENROLLMENT_INVALID_SERVICE_URL"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12118, v4, DMCErrorTypeFatal, 0));

  return v5;
}

- (id)_errorBadProfile
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MDMErrorDomain;
  v3 = DMCErrorArray(CFSTR("MDM_ERROR_WATCH_ENROLLMENT_BAD_PROFILE"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12119, v4, DMCErrorTypeFatal, 0));

  return v5;
}

- (id)_errorMissingMDMPayload
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MDMErrorDomain;
  v3 = DMCErrorArray(CFSTR("MDM_ERROR_WATCH_ENROLLMENT_MISSING_MDM_PAYLOAD"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12120, v4, DMCErrorTypeFatal, 0));

  return v5;
}

- (DMCEnrollmentFlowController)enrollmentController
{
  return self->_enrollmentController;
}

- (void)setEnrollmentController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentController, a3);
}

- (NSData)pairingToken
{
  return self->_pairingToken;
}

- (void)setPairingToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingToken, 0);
  objc_storeStrong((id *)&self->_enrollmentController, 0);
}

@end
