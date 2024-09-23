@implementation DMDInviteUserToVPPOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFInviteUserToVPPRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2E38;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDInviteUserToVPPOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_11;
    v17 = DMFInvalidParameterErrorKey;
    v18 = CFSTR("request.URL");
    v9 = &v18;
    v10 = &v17;
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originator"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_11;
    v15 = DMFInvalidParameterErrorKey;
    v16 = CFSTR("request.originator");
    v9 = &v16;
    v10 = &v15;
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v10, 1));
    v12 = DMFErrorWithCodeAndUserInfo(1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  DMDInviteUserToVPPOperation *v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSBundle *v28;
  void *v29;
  NSBundle *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSBundle *v35;
  void *v36;
  void *v37;
  NSBundle *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  DMDUserNotification *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  DMDInviteUserToVPPOperation *v48;
  id v49;
  uint8_t buf[4];
  void *v51;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v51 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invite user to VPP: %{private}@", buf, 0xCu);
  }
  if ((objc_msgSend(v5, "conformsToOverridePatternWithKey:", CFSTR("vpp-licensing-invitation-url-pattern")) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "restrictedAppBundleIDs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "effectiveWhitelistedAppBundleIDs"));
    v9 = MCAppStoreBundleIdentifier;
    if ((objc_msgSend(v7, "containsObject:", MCAppStoreBundleIdentifier) & 1) != 0
      || v8 && (objc_msgSend(v8, "containsObject:", v9) & 1) == 0)
    {
      v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v20)
        sub_10007734C(v20, v21, v22, v23, v24, v25, v26, v27);
      v10 = self;
      v11 = 1400;
    }
    else
    {
      if (byte_1000EB8D0 != 1)
      {
        byte_1000EB8D0 = 1;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPowerAssertion assertionForOperation:](DMDPowerAssertion, "assertionForOperation:", CFSTR("DMDInviteUserToVPPOperation: run")));
        v43 = objc_opt_new(DMDUserNotification);
        v28 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("%@ would like to assign apps and books to you."), &stru_1000BC2E0, CFSTR("DMFNotifications")));

        v30 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Allow App and Book Assignment?"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
        -[DMDUserNotification setHeader:](v43, "setHeader:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originator"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v44, v33));
        -[DMDUserNotification setMessage:](v43, "setMessage:", v34);

        v35 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
        -[DMDUserNotification setDefaultButtonTitle:](v43, "setDefaultButtonTitle:", v37);

        v38 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
        -[DMDUserNotification setAlternateButtonTitle:](v43, "setAlternateButtonTitle:", v40);

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10004B658;
        v46[3] = &unk_1000BB298;
        v47 = v5;
        v48 = self;
        v49 = v45;
        v42 = v45;
        objc_msgSend(v41, "showNotification:completion:", v43, v46);

        goto LABEL_16;
      }
      v10 = self;
      v11 = 1407;
    }
    -[DMDTaskOperation endOperationWithDMFErrorCode:](v10, "endOperationWithDMFErrorCode:", v11);
LABEL_16:

    goto LABEL_17;
  }
  v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v12)
    sub_100077384(v12, v13, v14, v15, v16, v17, v18, v19);
  -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1402);
LABEL_17:

}

@end
