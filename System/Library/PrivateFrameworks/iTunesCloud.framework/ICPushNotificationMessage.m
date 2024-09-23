@implementation ICPushNotificationMessage

- (ICPushNotificationMessage)initWithMessageUserInfo:(id)a3
{
  id v5;
  ICPushNotificationMessage *v6;
  ICPushNotificationMessage *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSDictionary *apsPayload;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSDictionary *v20;
  id v22;
  uint8_t buf[4];
  ICPushNotificationMessage *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[ICPushNotificationMessage init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userInfo, a3);
    v7->_accountDSID = objc_msgSend(v5, "ic_int64ValueForKey:", CFSTR("0"));
    v7->_actionType = (int)objc_msgSend(v5, "ic_intValueForKey:", CFSTR("1"));
    objc_msgSend(v5, "ic_stringValueForKey:", CFSTR("10"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && !-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("application/json")))
    {
      if (-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("application/gzip")))
      {
        objc_msgSend(v5, "ic_stringValueForKey:", CFSTR("aps"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
          if (v11)
          {
            MSVGzipDecompressData();
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v22 = 0;
              objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v12, 0, &v22);
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = v22;
              apsPayload = v7->_apsPayload;
              v7->_apsPayload = (NSDictionary *)v13;

              if (!v7->_apsPayload || (v16 = 0, v14))
              {
                _ICLogCategoryDefault();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v24 = v7;
                  v25 = 2114;
                  v26 = v14;
                  _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize aps payload data. err=%{public}@", buf, 0x16u);
                }

                v16 = v14;
              }
            }
            else
            {
              _ICLogCategoryDefault();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v24 = v7;
                _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to decompress aps payload data.", buf, 0xCu);
              }
            }

          }
          else
          {
            v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v24 = v7;
              _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to decode compressed aps payload data.", buf, 0xCu);
            }
          }

        }
        goto LABEL_17;
      }
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v7;
        v25 = 2114;
        v26 = v9;
        _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ unknown APS format %{public}@. assuming dictionary", buf, 0x16u);
      }

    }
    objc_msgSend(v5, "ic_dictionaryValueForKey:", CFSTR("aps"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v7->_apsPayload;
    v7->_apsPayload = (NSDictionary *)v19;

LABEL_17:
  }

  return v7;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (int64_t)accountDSID
{
  return self->_accountDSID;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (NSDictionary)apsPayload
{
  return self->_apsPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsPayload, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (int64_t)sagaServerRevision
{
  return -[NSDictionary ic_int64ValueForKey:](self->_userInfo, "ic_int64ValueForKey:", CFSTR("2"));
}

- (NSArray)sagaUpdatedSubscribedPlaylistIDs
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSDictionary ic_arrayValueForKey:](self->_userInfo, "ic_arrayValueForKey:", CFSTR("3"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!_NSIsNSNumber())
        {

          v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }

  v7 = v2;
LABEL_11:

  return (NSArray *)v7;
}

- (int64_t)jaliscoServerRevision
{
  return -[NSDictionary ic_int64ValueForKey:](self->_userInfo, "ic_int64ValueForKey:", CFSTR("2"));
}

- (NSArray)jaliscoChangedMediaTypes
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSDictionary ic_arrayValueForKey:](self->_userInfo, "ic_arrayValueForKey:", CFSTR("3"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!_NSIsNSString())
        {

          v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }

  v7 = v2;
LABEL_11:

  return (NSArray *)v7;
}

- (NSString)clientIdentifier
{
  return (NSString *)-[NSDictionary ic_stringValueForKey:](self->_userInfo, "ic_stringValueForKey:", CFSTR("2"));
}

- (int64_t)moduleIdentifier
{
  return -[NSDictionary ic_intValueForKey:](self->_userInfo, "ic_intValueForKey:", CFSTR("10"));
}

@end
