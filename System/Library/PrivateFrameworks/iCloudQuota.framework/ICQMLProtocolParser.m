@implementation ICQMLProtocolParser

+ (BOOL)shouldCallMlDaemonForPushNotification:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  objc_msgSend(a3, "objectForKey:", CFSTR("callSubD"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_class();
      if (v6 == objc_opt_class())
      {
        v8 = objc_msgSend(v4, "BOOLValue");

        if (v8)
        {
          _ICQGetLogSystem();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "[SUBD] IND will now use the new code path calling into ML Subscription Daemon.", buf, 2u);
          }
          v7 = 1;
          goto LABEL_13;
        }
      }
      else
      {

      }
      _ICQGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "[SUBD] IND will use the original codepath. ML Subscription Daemon will not be called.", v11, 2u);
      }
      v7 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v7 = 0;
LABEL_14:

  return v7;
}

+ (BOOL)shouldCallMlDaemonForFetchOfferStub:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("subdContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(a1, "shouldCallMlDaemonForPushNotification:", v4);
  else
    v5 = 0;

  return v5;
}

+ (id)parseMaxDelaySecsFromPushNotification:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("maxDelayInSecs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (id)parseMaxDelaySecsFromFetchOffersResponse:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("subdContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(a1, "parseMaxDelaySecsFromPushNotification:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
