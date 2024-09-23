@implementation MSDS3SessionTaskInfo

- (id)getRequestForTimeout:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo s3url](self, "s3url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v6, 1, a3));
  -[MSDSessionTaskInfo setRequest:](self, "setRequest:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
    objc_msgSend(v9, "setHTTPMethod:", CFSTR("PUT"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo httpHeaders](self, "httpHeaders"));
    if (v10)
    {
      v11 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received custom http headers to use.", buf, 2u);
      }

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo httpHeaders](self, "httpHeaders"));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v32;
        do
        {
          v18 = 0;
          v19 = v16;
          do
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v13);
            v16 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v18);

            v20 = sub_1000604F0();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo httpHeaders](self, "httpHeaders"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v16));
              *(_DWORD *)buf = 138412546;
              v36 = v16;
              v37 = 2112;
              v38 = v26;
              _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Http Header: %@, Value: %@", buf, 0x16u);

            }
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo httpHeaders](self, "httpHeaders"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v16));
            objc_msgSend(v22, "setValue:forHTTPHeaderField:", v24, v16);

            v18 = (char *)v18 + 1;
            v19 = v16;
          }
          while (v15 != v18);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v15);

      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/gzip"), CFSTR("Content-Type"));
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  }
  else
  {
    v29 = sub_1000604F0();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_1000BDF3C();

    v27 = 0;
  }
  return v27;
}

- (NSString)s3url
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setS3url:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHttpHeaders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_s3url, 0);
}

@end
