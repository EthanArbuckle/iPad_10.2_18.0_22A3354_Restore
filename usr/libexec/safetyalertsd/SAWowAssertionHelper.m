@implementation SAWowAssertionHelper

- (SAWowAssertionHelper)init
{
  self->isAsserted = 0;
  return self;
}

- (void)assertWoW:(BOOL)a3
{
  int v3;
  int isAsserted;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  v3 = a3;
  isAsserted = self->isAsserted;
  v6 = SALogObjectGeneral;
  v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (isAsserted == v3)
  {
    if (v7)
    {
      v10 = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#wow,#warning,assertWoW,noChange\"}", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    if (v7)
    {
      v10 = 68289282;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 1026;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#wow,assertWoW,triggered\", \"state\":%{public}hhd}", (uint8_t *)&v10, 0x18u);
    }
    self->isAsserted = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUTWiFiManager sharedInstance](CUTWiFiManager, "sharedInstance"));
    v9 = v8;
    if (v3)
      objc_msgSend(v8, "addWoWClient:", self);
    else
      objc_msgSend(v8, "removeWoWClient:", self);

  }
}

@end
