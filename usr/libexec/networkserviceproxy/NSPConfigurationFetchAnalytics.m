@implementation NSPConfigurationFetchAnalytics

- (id)eventName
{
  return CFSTR("com.apple.nsp.configuration");
}

- (id)configFetchURLToIndex
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  unsigned __int8 v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  unsigned __int8 v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  unsigned __int8 v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  unsigned __int8 v53;
  void *v54;
  unsigned int v55;
  int v56;
  const char *v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));

  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("https://mask-api.icloud.com/v1/fetchConfigFile"));

    if ((v8 & 1) != 0)
    {
      return &off_1000FF2C0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
      v11 = objc_msgSend(v10, "isEqual:", CFSTR("https://mask-api.icloud.com/v1_1/fetchConfigFile"));

      if ((v11 & 1) != 0)
      {
        return &off_1000FF2D8;
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
        v13 = objc_msgSend(v12, "isEqual:", CFSTR("https://mask-api.icloud.com/v1_2/fetchConfigFile"));

        if ((v13 & 1) != 0)
        {
          return &off_1000FF2F0;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
          v15 = objc_msgSend(v14, "isEqual:", CFSTR("https://mask-api.icloud.com/v1_3/fetchConfigFile"));

          if ((v15 & 1) != 0)
          {
            return &off_1000FF308;
          }
          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
            v17 = objc_msgSend(v16, "isEqual:", CFSTR("https://mask-api.icloud.com/v1_4/fetchConfigFile"));

            if ((v17 & 1) != 0)
            {
              return &off_1000FF320;
            }
            else
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
              v19 = objc_msgSend(v18, "isEqual:", CFSTR("https://mask-api.icloud.com/v1_5/fetchConfigFile"));

              if ((v19 & 1) != 0)
              {
                return &off_1000FF338;
              }
              else
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                v21 = objc_msgSend(v20, "isEqual:", CFSTR("https://mask-api.icloud.com/v1_6/fetchConfigFile"));

                if ((v21 & 1) != 0)
                {
                  return &off_1000FF350;
                }
                else
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                  v23 = objc_msgSend(v22, "isEqual:", CFSTR("https://mask-api.icloud.com/v2_0/fetchConfigFile"));

                  if ((v23 & 1) != 0)
                  {
                    return &off_1000FF368;
                  }
                  else
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                    v25 = objc_msgSend(v24, "isEqual:", CFSTR("https://mask-api.icloud.com/v2_1/fetchConfigFile"));

                    if ((v25 & 1) != 0)
                    {
                      return &off_1000FF380;
                    }
                    else
                    {
                      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                      v27 = objc_msgSend(v26, "isEqual:", CFSTR("https://mask-api.icloud.com/v2_2/fetchConfigFile"));

                      if ((v27 & 1) != 0)
                      {
                        return &off_1000FF398;
                      }
                      else
                      {
                        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                        v29 = objc_msgSend(v28, "isEqual:", CFSTR("https://mask-api.icloud.com/v2_3/fetchConfigFile"));

                        if ((v29 & 1) != 0)
                        {
                          return &off_1000FF3B0;
                        }
                        else
                        {
                          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                          v33 = objc_msgSend(v32, "isEqual:", CFSTR("https://mask-api.icloud.com/v3_0/fetchConfigFile"));

                          if ((v33 & 1) != 0)
                          {
                            return &off_1000FF3C8;
                          }
                          else
                          {
                            v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                            v35 = objc_msgSend(v34, "isEqual:", CFSTR("https://mask-api.icloud.com/v2_4/fetchConfigFile"));

                            if ((v35 & 1) != 0)
                            {
                              return &off_1000FF3E0;
                            }
                            else
                            {
                              v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                              v37 = objc_msgSend(v36, "isEqual:", CFSTR("https://mask-api.icloud.com/v3_1/fetchConfigFile"));

                              if ((v37 & 1) != 0)
                              {
                                return &off_1000FF3F8;
                              }
                              else
                              {
                                v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                v39 = objc_msgSend(v38, "isEqual:", CFSTR("https://mask-api.icloud.com/v3_2/fetchConfigFile"));

                                if ((v39 & 1) != 0)
                                {
                                  return &off_1000FF410;
                                }
                                else
                                {
                                  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                  v41 = objc_msgSend(v40, "isEqual:", CFSTR("https://mask-api.icloud.com/v3_3/fetchConfigFile"));

                                  if ((v41 & 1) != 0)
                                  {
                                    return &off_1000FF428;
                                  }
                                  else
                                  {
                                    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                    v43 = objc_msgSend(v42, "isEqual:", CFSTR("https://mask-api.icloud.com/v3_4/fetchConfigFile"));

                                    if ((v43 & 1) != 0)
                                    {
                                      return &off_1000FF440;
                                    }
                                    else
                                    {
                                      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                      v45 = objc_msgSend(v44, "isEqual:", CFSTR("https://mask-api.icloud.com/v3_5/fetchConfigFile"));

                                      if ((v45 & 1) != 0)
                                      {
                                        return &off_1000FF458;
                                      }
                                      else
                                      {
                                        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                        v47 = objc_msgSend(v46, "isEqual:", CFSTR("https://mask-api.icloud.com/v3_6/fetchConfigFile"));

                                        if ((v47 & 1) != 0)
                                        {
                                          return &off_1000FF470;
                                        }
                                        else
                                        {
                                          v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                          v49 = objc_msgSend(v48, "isEqual:", CFSTR("https://mask-api.icloud.com/v4_0/fetchConfigFile"));

                                          if ((v49 & 1) != 0)
                                          {
                                            return &off_1000FF488;
                                          }
                                          else
                                          {
                                            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                            v51 = objc_msgSend(v50, "isEqual:", CFSTR("https://mask-api.icloud.com/v4_1/fetchConfigFile"));

                                            if ((v51 & 1) != 0)
                                            {
                                              return &off_1000FF4A0;
                                            }
                                            else
                                            {
                                              v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                              v53 = objc_msgSend(v52, "isEqual:", CFSTR("https://mask-api.icloud.com/v4_2/fetchConfigFile"));

                                              if ((v53 & 1) != 0)
                                              {
                                                return &off_1000FF4B8;
                                              }
                                              else
                                              {
                                                v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                                v55 = objc_msgSend(v54, "isEqual:", CFSTR("https://mask-api.icloud.com/v4_3/fetchConfigFile"));

                                                if (v55)
                                                  return &off_1000FF4D0;
                                                else
                                                  return &off_1000FF4E8;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v30 = nplog_obj(v4, v5, v6);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      v56 = 136315138;
      v57 = "-[NSPConfigurationFetchAnalytics configFetchURLToIndex]";
      _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "%s called with null self.configFetchURL", (uint8_t *)&v56, 0xCu);
    }

    return 0;
  }
}

- (id)analyticsDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURLToIndex](self, "configFetchURLToIndex"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ConfigurationFetchPath"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSPConfigurationFetchAnalytics httpCode](self, "httpCode")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("HTTPCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSPConfigurationFetchAnalytics nsurlErrorCode](self, "nsurlErrorCode")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("NSURLErrorCode"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics requestedServerUUID](self, "requestedServerUUID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("RequestedServerUUID"));

  -[NSPConfigurationFetchAnalytics latency](self, "latency");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Latency"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics reason](self, "reason"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("Reason"));

  return v3;
}

- (NSString)configFetchURL
{
  return self->_configFetchURL;
}

- (void)setConfigFetchURL:(id)a3
{
  objc_storeStrong((id *)&self->_configFetchURL, a3);
}

- (int64_t)httpCode
{
  return self->_httpCode;
}

- (void)setHttpCode:(int64_t)a3
{
  self->_httpCode = a3;
}

- (int64_t)nsurlErrorCode
{
  return self->_nsurlErrorCode;
}

- (void)setNsurlErrorCode:(int64_t)a3
{
  self->_nsurlErrorCode = a3;
}

- (NSString)requestedServerUUID
{
  return self->_requestedServerUUID;
}

- (void)setRequestedServerUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestedServerUUID, a3);
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  self->_reason = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedServerUUID, 0);
  objc_storeStrong((id *)&self->_configFetchURL, 0);
}

@end
