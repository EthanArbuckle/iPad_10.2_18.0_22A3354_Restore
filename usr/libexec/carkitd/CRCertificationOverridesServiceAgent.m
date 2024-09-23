@implementation CRCertificationOverridesServiceAgent

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  int v18;
  void *v19;

  v5 = a4;
  v6 = objc_opt_class(NSNumber);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.carkit.certificationOverrides")));
  v8 = v7;
  if (v7 && (objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9 && (v10 = objc_msgSend(v9, "BOOLValue"), (v10 & 1) != 0))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRCertificationOverridesService));
    objc_msgSend(v5, "setExportedInterface:", v11);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &stru_1000B5400);
    v12 = CarCertificationOverrideLogging(objc_msgSend(v5, "setInvalidationHandler:", &stru_1000B5420));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "processIdentifier")));
      v18 = 138412290;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "receiving certification override service connection from %@", (uint8_t *)&v18, 0xCu);

    }
    objc_msgSend(v5, "resume");
    v15 = 1;
  }
  else
  {
    v16 = CarCertificationOverrideLogging(v10);
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006929C(v5, v11);
    v15 = 0;
  }

  return v15;
}

- (void)setNextSessionOverrideAirPlayFeatureStrings:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = CarCertificationOverrideLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setting next session override AirPlay feature strings: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(self), "setNextSessionOverrideAirPlayFeatureStrings:", v6);
  if (v7)
    v7[2](v7, 1, 0);

}

- (void)fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "nextSessionOverrideAirPlayFeatureStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = CarCertificationOverrideLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "returning next session override AirPlay feature strings: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
    v4[2](v4, v6, 0);

}

+ (NSArray)nextSessionOverrideAirPlayFeatureStrings
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;

  v2 = (id)CFPreferencesCopyAppValue(CFSTR("AirPlayFeatures"), CFSTR("com.apple.carplay.certification"));
  v3 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1000B5460));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filteredArrayUsingPredicate:", v4));
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v10 = v2;
      goto LABEL_7;
    }
    v8 = CarCertificationOverrideLogging(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100069334((uint64_t)v2, v9);

  }
  v10 = 0;
LABEL_7:

  return (NSArray *)v10;
}

+ (void)setNextSessionOverrideAirPlayFeatureStrings:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("AirPlayFeatures"), a3, CFSTR("com.apple.carplay.certification"));
}

@end
