@implementation APJourneySettings

- (id)eCServerURL
{
  id v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
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
  void *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  void *v25;
  void *v26;

  v2 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APECSettingsConfig));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = CFSTR("/1/events");
  v5 = CFSTR("pcms.apple.com");
  v6 = CFSTR("ec");
  v7 = CFSTR("https");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@.%@%@"), CFSTR("https"), CFSTR("ec"), CFSTR("pcms.apple.com"), CFSTR("/1/events")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
  if (!v3)
    goto LABEL_13;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("protocol")));
  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverSettings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("host")));
    if (!v12)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverSettings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("prefix")));
      if (!v13)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverSettings"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("path")));

        if (!v25)
        {
          v7 = CFSTR("https");
          v6 = CFSTR("ec");
          v4 = CFSTR("/1/events");
          v5 = CFSTR("pcms.apple.com");
          goto LABEL_13;
        }
        goto LABEL_8;
      }

    }
  }

LABEL_8:
  v26 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverSettings"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("protocol")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverSettings"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("host")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("prefix")));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverSettings"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("path")));

  v19 = CFSTR("production");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("production")));
  if ((!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")|| (v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverEnvironment"))) != 0)&& (-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("production")) & 1) == 0)
  {
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v19));

    v6 = (__CFString *)v20;
  }
  v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@.%@%@"), v7, v6, v5, v4));

  v22 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v21));
  v8 = (void *)v21;
  v9 = (void *)v22;
LABEL_13:

  return v9;
}

@end
