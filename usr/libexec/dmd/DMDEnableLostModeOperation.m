@implementation DMDEnableLostModeOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFEnableLostModeRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2B80;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v6 = objc_msgSend(v5, "isManagedLostModeActive");

  if (v6)
  {
    -[DMDEnableLostModeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDLostDeviceLocationManager sharedManager](DMDLostDeviceLocationManager, "sharedManager"));
    objc_msgSend(v7, "clearLastLocationRequestedDate");

    +[DMDLockUtilities lockDevice](DMDLockUtilities, "lockDevice");
    v8 = (void *)objc_opt_new(FMDLostModeInfo);
    objc_msgSend(v8, "setLostModeEnabled:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
    objc_msgSend(v8, "setMessage:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phoneNumber"));
    objc_msgSend(v8, "setPhoneNumber:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "footnote"));
    objc_msgSend(v8, "setFootnoteText:", v11);

    objc_msgSend(v8, "setDisableSlideToUnlock:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003913C;
    v13[3] = &unk_1000BAD98;
    v13[4] = self;
    objc_msgSend(v12, "enableManagedLostModeWithInfo:completion:", v8, v13);

  }
}

@end
