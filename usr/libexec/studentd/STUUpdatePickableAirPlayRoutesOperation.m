@implementation STUUpdatePickableAirPlayRoutesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___STUUpdatePickableAirPlayRoutesOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_opt_class(CRKUpdatePickableAirPlayRoutesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(DMFUpdatePickableAirPlayRoutesRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D3920);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
        goto LABEL_8;
      }
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  STUUpdatePickableAirPlayRoutesOperation *v9;

  v4 = a3;
  if (qword_1000FC3C8 != -1)
    dispatch_once(&qword_1000FC3C8, &stru_1000CAC90);
  v5 = qword_1000FC3C0;
  if (os_log_type_enabled((os_log_t)qword_1000FC3C0, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: Browsing for AirPlay routes", (uint8_t *)&v8, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  objc_msgSend(v7, "browseForPickableAirPlayRoutes");

  -[STUUpdatePickableAirPlayRoutesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
