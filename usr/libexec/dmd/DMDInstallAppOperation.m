@implementation DMDInstallAppOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_super v13;
  uint64_t v14;
  const __CFString *v15;

  v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___DMDInstallAppOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeItemIdentifier"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_msgSend(v6, "licenseType");

    if (!v9)
    {
      if (!a4)
        goto LABEL_8;
      v14 = DMFInvalidParameterErrorKey;
      v15 = CFSTR("request.licenseType");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v11 = DMFErrorWithCodeAndUserInfo(1, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v11);

LABEL_7:
      LOBYTE(a4) = 0;
      goto LABEL_8;
    }
  }
  LOBYTE(a4) = 1;
LABEL_8:

  return (char)a4;
}

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFInstallAppRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2DC0;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047D4C;
  v7[3] = &unk_1000BB1F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getMetadataForAppRequest:completion:", v6, v7);

}

- (BOOL)appCoordinatorExistsForBundleIdentifier:(id)a3 persona:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  unsigned int v15;
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(self), "appIdentityForBundleIdentifier:persona:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v17 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IXAppInstallCoordinator existingCoordinatorForAppWithIdentity:error:](IXAppInstallCoordinator, "existingCoordinatorForAppWithIdentity:error:", v9, &v17));
  v11 = v17;
  v12 = v11;
  if (v10)
    goto LABEL_2;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
  v15 = objc_msgSend(v14, "isEqualToString:", IXErrorDomain);

  if (!v15)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v12, "code") != (id)48)
  {
    if (objc_msgSend(v12, "code") != (id)46)
      objc_msgSend(v12, "code");
    goto LABEL_7;
  }
LABEL_2:
  v13 = 1;
LABEL_8:

  return v13;
}

+ (id)appIdentityForBundleIdentifier:(id)a3 persona:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)IXApplicationIdentity);
  if (v5)
    v8 = objc_msgSend(v7, "initWithBundleIdentifier:personaUniqueString:", v6, v5);
  else
    v8 = objc_msgSend(v7, "initWithBundleIdentifier:", v6);
  v9 = v8;

  return v9;
}

- (void)installAppForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifestURL"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000481D8;
  v13[3] = &unk_1000BAD98;
  v13[4] = self;
  v7 = objc_retainBlock(v13);
  v9 = DMFAppLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Start installing enterprise app with manifest URL from: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v5, "startInstallingEnterpriseAppWithManifestURL:completion:", v6, v7);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Start installing non-enterprise app for request: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v5, "startInstallingNonEnterpriseAppForRequest:completion:", v4, v7);
  }

}

- (void)_runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lifeCycle"));
  v7 = (char *)objc_msgSend(v6, "currentState");

  if ((unint64_t)(v7 - 4) < 4)
  {
    v14 = DMFBundleIdentifierErrorKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    v15 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v11 = 2600;
LABEL_5:
    v12 = DMFErrorWithCodeAndUserInfo(v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[DMDInstallAppOperation endOperationWithError:](self, "endOperationWithError:", v13);

    goto LABEL_6;
  }
  if ((unint64_t)(v7 - 1) < 2)
  {
    v16 = DMFBundleIdentifierErrorKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    v17 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v11 = 2603;
    goto LABEL_5;
  }
  if (v7 == (char *)3)
    -[DMDInstallAppOperation _resumeInstallationForRequest:](self, "_resumeInstallationForRequest:", v4);
  else
    -[DMDInstallAppOperation installAppForRequest:](self, "installAppForRequest:", v4);
LABEL_6:

}

- (void)_resumeInstallationForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048438;
  v7[3] = &unk_1000BAD98;
  v7[4] = self;
  objc_msgSend(v6, "resumeAppInstallationWithBundleIdentifier:completion:", v5, v7);

}

- (DMDAppMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
