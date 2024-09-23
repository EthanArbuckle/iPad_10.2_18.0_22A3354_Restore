@implementation UAPresenceManager

- (UAPresenceManager)initWithQueue:(id)a3
{
  id v4;
  UAPresenceManager *v5;
  uint64_t v6;
  NSMutableDictionary *authRecords;
  SKPresence *v8;
  SKPresence *presence;
  id v10;
  NSObject *v11;
  UAPresenceManager *v12;
  SKPresence *v14;
  objc_super v15;
  uint8_t buf[4];
  SKPresence *v17;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UAPresenceManager;
  v5 = -[UAPresenceManager init](&v15, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    authRecords = v5->_authRecords;
    v5->_authRecords = (NSMutableDictionary *)v6;

    v8 = (SKPresence *)objc_msgSend(objc_alloc((Class)SKPresence), "initWithPresenceIdentifier:isPersonal:", CFSTR("com.apple.mDNSResponder"), 1);
    presence = v5->_presence;
    v5->_presence = v8;

    -[SKPresence addDelegate:queue:](v5->_presence, "addDelegate:queue:", v5, v4);
    v10 = _unicast_assist_cache_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = v5->_presence;
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "unicast assist StatusKit init: _presence %{public}@", buf, 0xCu);
    }

    v12 = v5;
  }

  return v5;
}

- (void)addQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4
{
  unsigned int v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager authRecords](self, "authRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (!v8)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager authRecords](self, "authRecords"));
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

  }
  if ((objc_msgSend(v8, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(v8, "addObject:", v10);
    -[UAPresenceManager assertPresence](self, "assertPresence");
  }

}

- (void)removeQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4
{
  unsigned int v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager authRecords](self, "authRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (v8 && objc_msgSend(v8, "containsObject:", v10))
  {
    objc_msgSend(v8, "removeObject:", v10);
    if (!objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager authRecords](self, "authRecords"));
      objc_msgSend(v9, "removeObjectForKey:", v6);

    }
    -[UAPresenceManager assertPresence](self, "assertPresence");
  }

}

- (void)assertPresence
{
  void *v3;
  void *v4;
  id v5;
  __objc2_prot_list **p_base_prots;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t i;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *context;
  id obj;
  uint64_t v46;
  UAPresenceManager *v47;
  id v48;
  void *v49;
  id v50;
  char v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  unsigned int v62;
  const __CFString *v63;
  void *v64;
  _BYTE buf[22];
  __int16 v66;
  unsigned int v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[2];

  context = objc_autoreleasePoolPush();
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v47 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager authRecords](self, "authRecords"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  p_base_prots = (__objc2_prot_list **)(&OS_mdns_trust__metaData + 40);
  v48 = v5;
  if (v5)
  {
    v46 = *(_QWORD *)v59;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v59 != v46)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager authRecords](v47, "authRecords"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

        if (objc_msgSend(v10, "count"))
        {
          v11 = objc_msgSend(v8, "unsignedIntegerValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          for (i = *(_QWORD *)mDNSStorage[0]; i; i = *(_QWORD *)(i + 3680))
          {
            if (strncmp((const char *)(i + 3606), "en", 2uLL) || !*(_BYTE *)(i + 3696) || !*(_BYTE *)(i + 3671))
              continue;
            if (!v11 || *(id *)(i + 3552) == v11)
            {
              v62 = 0;
              v14 = *(_DWORD *)(i + 3560);
              if (v14 == 6)
              {
                if (*(unsigned __int8 *)(i + 3564) != 254 || (*(_BYTE *)(i + 3565) & 0xC0) != 0x80)
                {
LABEL_27:
                  v17 = 0;
LABEL_28:

                  continue;
                }
                v15 = i + 3564;
                v16 = 16;
              }
              else
              {
                if (v14 != 4)
                  goto LABEL_27;
                v15 = i + 3564;
                v16 = 4;
              }
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v15, v16));
              if (!v17
                || _unicast_assist_hash_for_interface(*(_QWORD *)(i + 3552), *(_DWORD *)(i + 3560), &v62))
              {
                goto LABEL_28;
              }
              v72[0] = CFSTR("ifhash");
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v62));
              v72[1] = CFSTR("addr");
              *(_QWORD *)buf = v18;
              *(_QWORD *)&buf[8] = v17;
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v72, 2));
              objc_msgSend(v12, "addObject:", v19);

              if (!v11)
                continue;
            }
            if ((unint64_t)objc_msgSend(v12, "count") > 1)
              break;
          }
          v49 = v7;
          if (objc_msgSend(v12, "count"))
            v20 = v12;
          else
            v20 = 0;
          p_base_prots = &OS_mdns_trust__metaData.base_prots;

          if (objc_msgSend(v20, "count"))
          {
            v21 = 0;
            v22 = 16;
            v50 = v20;
            do
            {
              v51 = v21;
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472;
              v57[2] = __35__UAPresenceManager_assertPresence__block_invoke;
              v57[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
              v57[4] = v22;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "filterObjectsUsingBlock:", v57));
              v24 = v23;
              if (v23)
              {
                v55 = 0u;
                v56 = 0u;
                v53 = 0u;
                v54 = 0u;
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
                if (v25)
                {
                  v26 = v25;
                  v27 = *(_QWORD *)v54;
                  do
                  {
                    for (j = 0; j != v26; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v54 != v27)
                        objc_enumerationMutation(v24);
                      v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
                      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ifhash")));
                      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("addr")));
                      v68[0] = CFSTR("qhashes");
                      v68[1] = CFSTR("ifhash");
                      v69[0] = v10;
                      v69[1] = v30;
                      v68[2] = CFSTR("addr");
                      v69[2] = v31;
                      v32 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_prot_list dictionaryWithObjects:forKeys:count:](p_base_prots[218], "dictionaryWithObjects:forKeys:count:", v69, v68, 3));
                      objc_msgSend(v52, "addObject:", v32);

                      v33 = _unicast_assist_cache_log();
                      v34 = objc_claimAutoreleasedReturnValue(v33);
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                      {
                        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "describeQHashes"));
                        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "describeAddr"));
                        v37 = objc_msgSend(v30, "unsignedIntValue");
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)&buf[4] = v35;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v36;
                        v66 = 1024;
                        v67 = v37;
                        _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "unicast assist assertPresence qhashes %@ addr %@ ifhash %x", buf, 0x1Cu);

                        p_base_prots = (__objc2_prot_list **)(&OS_mdns_trust__metaData + 40);
                      }

                    }
                    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
                  }
                  while (v26);
                }
              }

              v21 = 1;
              v22 = 4;
              v20 = v50;
            }
            while ((v51 & 1) == 0);
          }

          v7 = v49;
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v48);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      v48 = v38;
    }
    while (v38);
  }

  v39 = objc_alloc((Class)SKPresencePayload);
  v63 = CFSTR("auth_records");
  v64 = v52;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_prot_list dictionaryWithObjects:forKeys:count:](p_base_prots[218], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
  v41 = objc_msgSend(v39, "initWithDictionary:", v40);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager presence](v47, "presence"));
  objc_msgSend(v42, "assertPresenceWithPresencePayload:completion:", v41, &__block_literal_global_4483);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager presence](v47, "presence"));
  objc_msgSend(v43, "retainTransientSubscriptionAssertionWithCompletion:", &__block_literal_global_35_4484);

  objc_autoreleasePoolPop(context);
}

- (void)updatePresenseData
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  uint64_t j;
  int v37;
  int v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id obj;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[4];
  int v71;
  __int16 v72;
  _BYTE *v73;
  _BYTE v74[128];
  _BYTE buf[22];
  __int16 v76;
  unsigned int v77;
  _BYTE v78[128];
  _BYTE v79[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAPresenceManager presence](self, "presence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentDevices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filterObjectsUsingBlock:", &__block_literal_global_37_4442));

  if (objc_msgSend(v4, "count"))
  {
    v5 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
    *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v5, v6, v7, v8, v9, v10, v11, v12);
    mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"-[UAPresenceManager updatePresenseData]", 713);
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v48 = v4;
    obj = v4;
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v51)
    {
      v50 = *(_QWORD *)v67;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v67 != v50)
            objc_enumerationMutation(obj);
          v53 = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v13), "presencePayload"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "payloadDictionary"));

          v52 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("auth_records")));
          v17 = _unicast_assist_cache_log();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = objc_msgSend(v16, "count");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "unicast assist updatePresenseData: next authRecords.count %lu", buf, 0xCu);
          }

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v54 = v16;
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
          if (v56)
          {
            v55 = *(_QWORD *)v63;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v63 != v55)
                  objc_enumerationMutation(v54);
                v57 = v20;
                v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("ifhash")));
                v23 = objc_msgSend(v22, "unsignedIntValue");

                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("qhashes")));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("addr")));
                v26 = _unicast_assist_cache_log();
                v27 = objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "describeQHashes"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "describeAddr"));
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v28;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v29;
                  v76 = 1024;
                  v77 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "unicast assist updatePresenseData: next qhashes %@ addr %@ ifhash %x", buf, 0x1Cu);

                }
                v60 = 0u;
                v61 = 0u;
                v58 = 0u;
                v59 = 0u;
                v30 = v24;
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
                if (v31)
                {
                  v32 = v31;
                  v33 = *(_QWORD *)v59;
                  do
                  {
                    for (i = 0; i != v32; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v59 != v33)
                        objc_enumerationMutation(v30);
                      v35 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
                      memset(buf, 0, 20);
                      if (!_unicast_assist_data_to_addr(v25, (int *)buf))
                      {
                        for (j = *(_QWORD *)mDNSStorage[0]; j; j = *(_QWORD *)(j + 3680))
                        {
                          if (strncmp((const char *)(j + 3606), "en", 2uLL))
                            continue;
                          if (!*(_BYTE *)(j + 3696))
                            continue;
                          if (!*(_BYTE *)(j + 3671))
                            continue;
                          *(_DWORD *)v70 = 0;
                          if (_unicast_assist_hash_for_interface(*(_QWORD *)(j + 3552), *(int *)buf, v70)
                            || *(_DWORD *)v70 != v23)
                          {
                            continue;
                          }
                          if (*(_DWORD *)buf == 4)
                          {
                            if (*(_DWORD *)(j + 3560) != 4)
                              continue;
                            v37 = *(_DWORD *)&buf[4] ^ *(_DWORD *)(j + 3564);
                            v38 = *(_DWORD *)(j + 3584);
                          }
                          else
                          {
                            if (*(_DWORD *)buf != 6
                              || *(_DWORD *)(j + 3560) != 6
                              || *(unsigned __int8 *)(j + 3564) != 254
                              || (*(_BYTE *)(j + 3565) & 0xC0) != 0x80
                              || ((*(_DWORD *)&buf[4] ^ *(_DWORD *)(j + 3564)) & *(_DWORD *)(j + 3584)) != 0
                              || ((*(_DWORD *)&buf[8] ^ *(_DWORD *)(j + 3568)) & *(_DWORD *)(j + 3588)) != 0
                              || ((*(_DWORD *)&buf[12] ^ *(_DWORD *)(j + 3572)) & *(_DWORD *)(j + 3592)) != 0)
                            {
                              continue;
                            }
                            v37 = *(_DWORD *)&buf[16] ^ *(_DWORD *)(j + 3576);
                            v38 = *(_DWORD *)(j + 3596);
                          }
                          if ((v37 & v38) == 0)
                          {
                            unicast_assist_addr_add("\x05qname", (int)objc_msgSend(v35, "unsignedIntValue"), 12, 8, (int *)buf, *(_QWORD *)(j + 3552));
                            goto LABEL_46;
                          }
                        }
                        v39 = _unicast_assist_cache_log();
                        v40 = objc_claimAutoreleasedReturnValue(v39);
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v70 = 68289026;
                          v71 = 20;
                          v72 = 2098;
                          v73 = buf;
                          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "unicast assist updatePresenseData: no subnet for addr %{public, mdnsresponder:ip_addr}.20P", v70, 0x12u);
                        }

                      }
LABEL_46:
                      ;
                    }
                    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
                  }
                  while (v32);
                }

                v20 = v57 + 1;
              }
              while ((id)(v57 + 1) != v56);
              v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
            }
            while (v56);
          }

          v13 = v53 + 1;
        }
        while ((id)(v53 + 1) != v51);
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      }
      while (v51);
    }

    mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"-[UAPresenceManager updatePresenseData]", 743);
    KQueueUnlock((uint64_t)"UAPresence updatePresenseData", v41, v42, v43, v44, v45, v46, v47);
    v4 = v48;
  }

}

- (SKPresence)presence
{
  return self->_presence;
}

- (void)setPresence:(id)a3
{
  objc_storeStrong((id *)&self->_presence, a3);
}

- (NSMutableDictionary)authRecords
{
  return self->_authRecords;
}

- (void)setAuthRecords:(id)a3
{
  objc_storeStrong((id *)&self->_authRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authRecords, 0);
  objc_storeStrong((id *)&self->_presence, 0);
}

BOOL __39__UAPresenceManager_updatePresenseData__block_invoke(id a1, SKPresentDevice *a2)
{
  return -[SKPresentDevice isSelfDevice](a2, "isSelfDevice") ^ 1;
}

BOOL __35__UAPresenceManager_assertPresence__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("addr")));
  v4 = objc_msgSend(v3, "length") == *(id *)(a1 + 32);

  return v4;
}

void __35__UAPresenceManager_assertPresence__block_invoke_34(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    v3 = _unicast_assist_cache_log();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description"));
      v6 = 138543362;
      v7 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "unicast assist StatusKit retainTransientSubscriptionAssertionWithCompletion: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __35__UAPresenceManager_assertPresence__block_invoke_32(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    v3 = _unicast_assist_cache_log();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description"));
      v6 = 138543362;
      v7 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "unicast assist StatusKit assertPresenceWithCompletion: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

@end
