@implementation OTSOSAdapterHelpers

+ (id)peerPublicSigningKeySPKIs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  _BOOL4 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 138412290;
    v18 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicSigningKey", v18, (_QWORD)v19));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "encodeSubjectPublicKeyInfo"));

        v14 = sub_10000EF14("SecError");
        v15 = objc_claimAutoreleasedReturnValue(v14);
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v16)
          {
            *(_DWORD *)buf = v18;
            v24 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon-sos: Created SPKI for peer: %@", buf, 0xCu);
          }

          objc_msgSend(v4, "addObject:", v13);
        }
        else
        {
          if (v16)
          {
            *(_DWORD *)buf = v18;
            v24 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon-sos: Can't create SPKI for peer: %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)peerPublicSigningKeySPKIsForCircle:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  const __CFString *v16;
  const void *v17;
  NSObject *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v21 = 0;
  v7 = objc_msgSend(v6, "circleStatus:", &v21);
  v8 = v21;
  v9 = v8;
  if (v7 || v8)
  {
    v14 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 + 1 > 4)
        v16 = CFSTR("kSOSCCError");
      else
        v16 = off_1002EB7C0[v7 + 1];
      *(_DWORD *)buf = 138412546;
      v23 = v16;
      v24 = 2112;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon-sos: Not in circle; not preapproving keys: %@ (%@)",
        buf,
        0x16u);
    }

    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    v20 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchTrustedPeers:", &v20));
    v11 = (__CFString *)v20;
    v12 = v11;
    if (!v10 || v11)
    {
      v17 = sub_10000EF14("SecError");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "octagon-sos: Can't fetch trusted peer SPKIs: %@", buf, 0xCu);
      }

      v13 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "peerPublicSigningKeySPKIs:", v10));
    }

  }
  return v13;
}

@end
