@implementation NESMServer

- (NESMServer)init
{
  __assert_rtn("-[NESMServer init]", "NESMServer.m", 166, "0");
}

- (BOOL)canSleep
{
  NESMServer *v2;
  const char *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  id Property;
  void *v8;
  id v9;
  const char *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NESMServer *obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v2 = self;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  if (self)
    self = (NESMServer *)objc_getProperty(self, a2, 120, 1);
  obj = self;
  v24 = -[NESMServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v31;
    v4 = 1;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v5);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        if (v2)
          Property = objc_getProperty(v2, v3, 120, 1);
        else
          Property = 0;
        v25 = v5;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectForKeyedSubscript:", v6));
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
        {
          v11 = v9;
          v12 = *(_QWORD *)v27;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(v8);
              v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
              if (v2)
                v15 = objc_getProperty(v2, v10, 120, 1);
              else
                v15 = 0;
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v6));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v14));
              v18 = objc_msgSend(v17, "canSleep");

              v4 &= v18;
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            v11 = v19;
          }
          while (v19);
        }

        v5 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      v20 = -[NESMServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      v24 = v20;
    }
    while (v20);
  }
  else
  {
    v4 = 1;
  }

  return v4 & 1;
}

- (BOOL)handleSleep
{
  NESMServer *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  id Property;
  void *v7;
  id v8;
  const char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  NESMServer *obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v2 = self;
  if (self)
  {
    self->_sleepAckCount = 0;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    self = (NESMServer *)objc_getProperty(self, a2, 120, 1);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
  }
  obj = self;
  v23 = -[NESMServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v4);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        if (v2)
          Property = objc_getProperty(v2, v3, 120, 1);
        else
          Property = 0;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectForKeyedSubscript:", v5));
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v8)
        {
          v10 = v8;
          v11 = *(_QWORD *)v25;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v7);
              v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v12);
              if (v2)
                v14 = objc_getProperty(v2, v9, 120, 1);
              else
                v14 = 0;
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v5));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v13));
              v17 = objc_msgSend(v16, "handleSleep");

              if (v2 && v17)
                ++v2->_sleepAckCount;
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            v10 = v18;
          }
          while (v18);
        }

        v4 = (char *)v4 + 1;
      }
      while (v4 != v23);
      v19 = -[NESMServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v23 = v19;
    }
    while (v19);
  }

  return v2 && v2->_sleepAckCount > 0;
}

- (void)handleSleepTime:(double)a3
{
  NESMServer *v4;
  id v5;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id Property;
  void *v11;
  id v12;
  const char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NESMServer *obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v4 = self;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  if (self)
    self = (NESMServer *)objc_getProperty(self, a2, 120, 1);
  obj = self;
  v5 = -[NESMServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v7 = v5;
    v24 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v8);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        if (v4)
          Property = objc_getProperty(v4, v6, 120, 1);
        else
          Property = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectForKeyedSubscript:", v9));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v14 = v12;
          v15 = *(_QWORD *)v26;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v11);
              v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v16);
              if (v4)
                v18 = objc_getProperty(v4, v13, 120, 1);
              else
                v18 = 0;
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v9));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v17));
              objc_msgSend(v20, "handleSleepTime:", a3);

              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            v14 = v21;
          }
          while (v21);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v7);
      v22 = -[NESMServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v7 = v22;
    }
    while (v22);
  }

}

- (void)handleWakeup
{
  NESMServer *v2;
  id v3;
  const char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id Property;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NESMServer *obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v2 = self;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  if (self)
    self = (NESMServer *)objc_getProperty(self, a2, 120, 1);
  obj = self;
  v3 = -[NESMServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v3)
  {
    v5 = v3;
    v22 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v6);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        if (v2)
          Property = objc_getProperty(v2, v4, 120, 1);
        else
          Property = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectForKeyedSubscript:", v7));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v10)
        {
          v12 = v10;
          v13 = *(_QWORD *)v24;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v9);
              v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v14);
              if (v2)
                v16 = objc_getProperty(v2, v11, 120, 1);
              else
                v16 = 0;
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v7));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));
              objc_msgSend(v18, "handleWakeup");

              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            v12 = v19;
          }
          while (v19);
        }

        v6 = (char *)v6 + 1;
      }
      while (v6 != v5);
      v20 = -[NESMServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v5 = v20;
    }
    while (v20);
  }

}

- (void)satisfyPathForSession:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 88, 1);
  else
    Property = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004CA34;
  v8[3] = &unk_1000BEB58;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)satisfyCellularPathForSession:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 88, 1);
  else
    Property = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004C8EC;
  v8[3] = &unk_1000BEB58;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  const char *v9;
  id v10;
  NSObject *Property;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  NESMServer *v17;

  v8 = a3;
  v10 = a4;
  if (self)
    Property = objc_getProperty(self, v9, 88, 1);
  else
    Property = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B23C;
  block[3] = &unk_1000BE878;
  v15 = v8;
  v16 = v10;
  v17 = self;
  v12 = v10;
  v13 = v8;
  dispatch_async(Property, block);

}

- (void)dealloc
{
  objc_super v3;

  sub_10004AF44(self);
  sub_10004B0B4(self);
  sub_10004B188(self);
  v3.receiver = self;
  v3.super_class = (Class)NESMServer;
  -[NESMServer dealloc](&v3, "dealloc");
}

- (void)registerSession:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  id Property;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v7 = a4;
  v9 = ne_log_obj(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registering session %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  if (self)
    Property = objc_getProperty(self, v15, 88, 1);
  else
    Property = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100049550;
  v21[3] = &unk_1000BE160;
  v21[4] = self;
  v22 = v12;
  v23 = v6;
  v24 = v7;
  v18 = v7;
  v19 = v6;
  v20 = v12;
  objc_msgSend(v13, "loadConfigurationWithID:withCompletionQueue:handler:", v16, Property, v21);

}

- (void)deregisterSession:(id)a3
{
  id v4;
  NESMServer *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int isa_high;
  int v22;
  void *v23;
  id v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  id v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  int v50;
  NESMServer *v51;
  __int16 v52;
  id v53;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "type");
  if ((_DWORD)v6 == 3)
  {
    if (!v5)
    {
      if (v4)
        goto LABEL_52;
LABEL_5:
      v9 = ne_log_obj(v6, v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v50 = 138412546;
        v51 = v5;
        v52 = 2112;
        v53 = v4;
        v11 = "%@: Deregister Always-On VPN Session: %@";
LABEL_50:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v50, 0x16u);
        goto LABEL_51;
      }
      goto LABEL_51;
    }
    if (objc_getProperty(v5, v7, 176, 1) == v4)
    {
      objc_setProperty_atomic(v5, v8, 0, 176);
      goto LABEL_5;
    }
    goto LABEL_52;
  }
  v12 = objc_msgSend(v4, "type");
  if ((_DWORD)v12 == 4)
  {
    if (v5)
    {
      if (objc_getProperty(v5, v13, 224, 1) != v4)
        goto LABEL_14;
      objc_setProperty_atomic(v5, v14, 0, 224);
    }
    else if (v4)
    {
      v49 = v4;
      goto LABEL_15;
    }
    v15 = ne_log_obj(v12, v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v50 = 138412546;
      v51 = v5;
      v52 = 2112;
      v53 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: Deregister Filter Session: %@", (uint8_t *)&v50, 0x16u);
    }

LABEL_14:
    if (!v4)
    {
      v10 = 0;
      goto LABEL_51;
    }
LABEL_15:
    v10 = v4;
    v17 = objc_sync_enter(v10);
    if (HIDWORD(v10[44].isa))
    {
      v19 = ne_log_obj(v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        isa_high = HIDWORD(v10[44].isa);
        v50 = 67109120;
        LODWORD(v51) = isa_high;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "De-allocating control unit %u", (uint8_t *)&v50, 8u);
      }

      v22 = HIDWORD(v10[44].isa);
      objc_opt_self(NESMFilterSession);
      os_unfair_lock_lock(&stru_1000CF910);
      dword_1000CF914 &= ~v22 | 0xE0000000;
      os_unfair_lock_unlock(&stru_1000CF910);
      HIDWORD(v10[44].isa) = 0;
    }
    objc_sync_exit(v10);

    goto LABEL_51;
  }
  if (objc_msgSend(v4, "type") == 1)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    v24 = objc_msgSend(v23, "grade");

    if (v24 != (id)1)
    {
      if (v5)
      {
        if (objc_getProperty(v5, v26, 208, 1) != v4)
          goto LABEL_52;
        objc_setProperty_atomic(v5, v37, 0, 208);
      }
      else if (v4)
      {
        goto LABEL_52;
      }
      v38 = ne_log_obj(v25, v26);
      v10 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v50 = 138412546;
        v51 = v5;
        v52 = 2112;
        v53 = v4;
        v11 = "%@: Deregister Personal VPN Session: %@";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (v5)
    {
      if (objc_getProperty(v5, v26, 192, 1) != v4)
        goto LABEL_52;
      objc_setProperty_atomic(v5, v27, 0, 192);
    }
    else if (v4)
    {
      goto LABEL_52;
    }
    v28 = objc_msgSend(v4, "setIsDeregisteredEnterpriseVPNSession:", 1);
    v30 = ne_log_obj(v28, v29);
    v10 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v50 = 138412546;
      v51 = v5;
      v52 = 2112;
      v53 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@: Deregister Enterprise VPN Session: %@", (uint8_t *)&v50, 0x16u);
    }
    goto LABEL_51;
  }
  if (objc_msgSend(v4, "type") == 2)
  {
    v31 = objc_msgSend(v4, "setIsDeregisteredAppVPNSession:", 1);
    v33 = ne_log_obj(v31, v32);
    v10 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v50 = 138412546;
      v51 = v5;
      v52 = 2112;
      v53 = v4;
      v11 = "%@: Deregister App VPN Session: %@";
      goto LABEL_50;
    }
LABEL_51:

    goto LABEL_52;
  }
  v34 = objc_msgSend(v4, "type");
  if ((_DWORD)v34 == 5)
  {
    v36 = ne_log_obj(v34, v35);
    v10 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v50 = 138412546;
      v51 = v5;
      v52 = 2112;
      v53 = v4;
      v11 = "%@: Deregister Path Controller Session: %@";
      goto LABEL_50;
    }
    goto LABEL_51;
  }
  v39 = objc_msgSend(v4, "type");
  if ((_DWORD)v39 == 6)
  {
    if (v5)
    {
      if (objc_getProperty(v5, v40, 232, 1) != v4)
        goto LABEL_52;
      objc_setProperty_atomic(v5, v41, 0, 232);
    }
    else if (v4)
    {
      goto LABEL_52;
    }
    v42 = ne_log_obj(v39, v40);
    v10 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v50 = 138412546;
      v51 = v5;
      v52 = 2112;
      v53 = v4;
      v11 = "%@: Deregister DNS Proxy Session: %@";
      goto LABEL_50;
    }
    goto LABEL_51;
  }
  v43 = objc_msgSend(v4, "type");
  if ((_DWORD)v43 == 7)
  {
    v45 = ne_log_obj(v43, v44);
    v10 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v50 = 138412546;
      v51 = v5;
      v52 = 2112;
      v53 = v4;
      v11 = "%@: Deregister DNS Settings Session: %@";
      goto LABEL_50;
    }
    goto LABEL_51;
  }
  v46 = objc_msgSend(v4, "type");
  if ((_DWORD)v46 == 9)
  {
    v48 = ne_log_obj(v46, v47);
    v10 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v50 = 138412546;
      v51 = v5;
      v52 = 2112;
      v53 = v4;
      v11 = "%@: Deregister Relay Session: %@";
      goto LABEL_50;
    }
    goto LABEL_51;
  }
LABEL_52:
  objc_sync_exit(v5);

}

- (BOOL)requestInstallForSession:(id)a3 withParentSession:(id)a4 exclusive:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  NESMServer *v14;
  id Property;
  const char *v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  const char *v23;
  id v24;
  id v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  const char *v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  id v45;
  SEL v46;
  id v47;
  NSObject *v49;
  id v50;
  const char *v51;
  id v52;
  _BOOL4 v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  const char *v70;
  const char *v71;
  id v72;
  const char *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned __int8 v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[4];
  id v87;
  uint8_t buf[4];
  NESMServer *v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  __int16 v94;
  const char *v95;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = &stru_1000BF2E8;
    *(_DWORD *)buf = 138412802;
    v89 = self;
    v90 = 2112;
    if (v5)
      v13 = CFSTR("(exclusive)");
    v91 = v8;
    v92 = 2112;
    v93 = (id)v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Request to install session: %@ %@", buf, 0x20u);
  }

  v14 = self;
  objc_sync_enter(v14);
  if (v9)
  {
    Property = objc_msgSend(v9, "type");
    v17 = 0;
    if ((_DWORD)Property != 3 || !v14)
      goto LABEL_10;
    Property = objc_getProperty(v14, v16, 176, 1);
    if (Property != v9)
      goto LABEL_9;
    v24 = 0;
    v14->_alwaysOnVPNSessionInstallState = 3;
LABEL_43:
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_100049548;
    v86[3] = &unk_1000BEB80;
    v47 = v24;
    v87 = v47;
    objc_msgSend(v8, "installWithCompletionHandler:", v86);

    v20 = 1;
    goto LABEL_44;
  }
  if (objc_msgSend(v8, "type") == 4)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "externalIdentifier"));
    if (v22)
    {

      goto LABEL_42;
    }
    if (v14)
      v25 = objc_getProperty(v14, v23, 224, 1);
    else
      v25 = 0;
    v26 = v25 == v8;

    if (v26)
      goto LABEL_42;
  }
  if (objc_msgSend(v8, "type") != 1)
  {
    if (objc_msgSend(v8, "type") == 2 || objc_msgSend(v8, "type") == 5)
      goto LABEL_42;
    if (objc_msgSend(v8, "type") == 6)
    {
      if (v14)
      {
        v24 = 0;
        v14->_dnsProxySessionInstallState = 3;
        goto LABEL_43;
      }
      goto LABEL_42;
    }
    if (objc_msgSend(v8, "type") == 7)
    {
LABEL_42:
      v24 = 0;
      goto LABEL_43;
    }
    v63 = objc_msgSend(v8, "type");
    if ((_DWORD)v63 != 8)
    {
      Property = objc_msgSend(v8, "type");
      if ((_DWORD)Property == 9)
        goto LABEL_42;
      goto LABEL_9;
    }
    v65 = ne_log_obj(v63, v64);
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "appPush"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "pluginType"));
      *(_DWORD *)buf = 138412546;
      v89 = v14;
      v90 = 2112;
      v91 = v69;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%@ Received request to install for NESessionTypeAppPush session type, plugin type [%@]", buf, 0x16u);

    }
    if (!v14 || !objc_getProperty(v14, v70, 336, 1))
    {
      v72 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
      v74 = v72;
      if (!v14)
      {

        v75 = 0;
        goto LABEL_72;
      }
      objc_setProperty_atomic(v14, v73, v72, 336);

    }
    v75 = objc_getProperty(v14, v71, 336, 1);
LABEL_72:
    v76 = v75;
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "appPush"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "pluginType"));
    v80 = objc_msgSend(v76, "containsObject:", v79);

    if ((v80 & 1) != 0)
    {
      v17 = 1;
      goto LABEL_10;
    }
    if (v14)
      v81 = objc_getProperty(v14, v16, 336, 1);
    else
      v81 = 0;
    v82 = v81;
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "appPush"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "pluginType"));
    objc_msgSend(v82, "addObject:", v85);

    goto LABEL_42;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "VPN"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "protocol"));
  v30 = objc_msgSend(v29, "includeAllNetworks");

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  LODWORD(v29) = objc_msgSend(v31, "grade") == (id)1;

  v34 = v30 | v5;
  if (!(_DWORD)v29)
  {
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v50 = -[NSObject grade](v49, "grade");
    v17 = v50 == (id)2;
    if (v50 == (id)2)
    {
      if (v14)
        v52 = objc_getProperty(v14, v51, 208, 1);
      else
        v52 = 0;
      v53 = v52 == v8;

      if (!v53)
        goto LABEL_9;
      v54 = ne_log_obj(Property, v16);
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = "";
        v57 = " Exclusive";
        if (!v34)
          v57 = "";
        *(_DWORD *)buf = 138413058;
        v90 = 2112;
        v89 = v14;
        v91 = v8;
        v92 = 2080;
        if (v30)
          v56 = " IncludeAllNetworks";
        v93 = (id)v57;
        v94 = 2080;
        v95 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%@: Request to install Session %@ is Personal -%s%s", buf, 0x2Au);
      }

      if (!v14)
        goto LABEL_42;
      if (v14->_enterpriseVPNSessionInstallState != 4)
      {
        v24 = 0;
        v14->_personalVPNSessionInstallState = 3;
        goto LABEL_43;
      }
      v14->_personalVPNSessionInstallState = 2;
      v60 = ne_log_obj(v58, v59);
      v49 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v62 = objc_getProperty(v14, v61, 192, 1);
        *(_DWORD *)buf = 138412802;
        v89 = v14;
        v90 = 2112;
        v91 = v8;
        v92 = 2112;
        v93 = v62;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%@: Request to install personal session (%@) delayed due to exclusive enterprise session (%@)", buf, 0x20u);
      }
    }

    goto LABEL_10;
  }
  v35 = ne_log_obj(v32, v33);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = "";
    v38 = " Exclusive";
    if (!v34)
      v38 = "";
    *(_DWORD *)buf = 138413058;
    v90 = 2112;
    v89 = v14;
    v91 = v8;
    v92 = 2080;
    if (v30)
      v37 = " IncludeAllNetworks";
    v93 = (id)v38;
    v94 = 2080;
    v95 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: Request to install Session %@ is Enterprise -%s%s", buf, 0x2Au);
  }

  if (v14)
    Property = objc_getProperty(v14, v16, 192, 1);
  else
    Property = 0;
  if (Property == v8)
  {
    if (v34)
    {
      if (v14)
      {
        v14->_enterpriseVPNSessionInstallState = 4;
        v24 = objc_getProperty(v14, v16, 208, 1);
        if (!v24)
          goto LABEL_43;
        v39 = v14->_personalVPNSessionInstallState == 3;

        if (v39)
        {
          v14->_personalVPNSessionInstallState = 2;
          v42 = ne_log_obj(v40, v41);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v45 = objc_getProperty(v14, v44, 208, 1);
            *(_DWORD *)buf = 138412802;
            v89 = v14;
            v90 = 2112;
            v91 = v45;
            v92 = 2112;
            v93 = v8;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%@: Personal session %@ superceded by exclusive enterprise session %@, will uninstall personal session", buf, 0x20u);
          }

          v24 = objc_getProperty(v14, v46, 208, 1);
          goto LABEL_43;
        }
      }
    }
    else if (v14)
    {
      v24 = 0;
      v14->_enterpriseVPNSessionInstallState = 3;
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_9:
  v17 = 0;
LABEL_10:
  v18 = ne_log_obj(Property, v16);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v89 = v14;
    v90 = 2112;
    v91 = v8;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: Request to install session is superceded by registered sessions: %@", buf, 0x16u);
  }

  if (v17)
    objc_msgSend(v8, "installPendedOnQueue");
  v20 = 0;
LABEL_44:
  objc_sync_exit(v14);

  return v20;
}

- (void)requestUninstallForSession:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NESMServer *v8;
  void *v9;
  _BOOL4 v10;
  const char *v11;
  id Property;
  const char *v13;
  id v14;
  _BOOL4 v15;
  const char *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  id v30;
  const char *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  const char *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  _BOOL4 v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  NESMServer *v49;
  __int16 v50;
  id v51;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v49 = self;
    v50 = 2112;
    v51 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Request to uninstall session: %@", buf, 0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  if (objc_msgSend(v4, "type") != 1)
  {
    if (objc_msgSend(v4, "type") == 6)
    {
      if (v8)
        v8->_dnsProxySessionInstallState = 1;
    }
    else
    {
      v22 = objc_msgSend(v4, "type");
      if ((_DWORD)v22 == 8)
      {
        v24 = ne_log_obj(v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "appPush"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pluginType"));
          *(_DWORD *)buf = 138412546;
          v49 = v8;
          v50 = 2112;
          v51 = v28;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: Received request to uninstall session for plugin type [%@]", buf, 0x16u);

        }
        if (v8)
        {
          v30 = objc_getProperty(v8, v29, 336, 1);
          if (v30)
          {
            v32 = v30;
            v33 = objc_getProperty(v8, v31, 336, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "appPush"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pluginType"));
            v37 = objc_msgSend(v33, "containsObject:", v36);

            if (v37)
            {
              v39 = objc_getProperty(v8, v38, 336, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "appPush"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "pluginType"));
              objc_msgSend(v39, "removeObject:", v42);

            }
          }
        }
      }
    }
    goto LABEL_33;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v10 = objc_msgSend(v9, "grade") == (id)1;

  if (!v10)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    if (objc_msgSend(v43, "grade") == (id)2 && v8)
    {
      v45 = objc_getProperty(v8, v44, 208, 1) == v4;

      if (v45)
        v8->_personalVPNSessionInstallState = 1;
    }
    else
    {

    }
    goto LABEL_33;
  }
  if (v8)
    Property = objc_getProperty(v8, v11, 192, 1);
  else
    Property = 0;
  if (Property != v4 && !objc_msgSend(v4, "isDeregisteredEnterpriseVPNSession"))
    goto LABEL_33;
  if (v8)
    v8->_enterpriseVPNSessionInstallState = 1;
  objc_msgSend(v4, "setIsDeregisteredEnterpriseVPNSession:", 0);
  if (!v8
    || (v14 = objc_getProperty(v8, v13, 208, 1)) == 0
    || (v15 = v8->_personalVPNSessionInstallState == 2, v14, !v15)
    || (v8->_personalVPNSessionInstallState = 3, (v17 = objc_getProperty(v8, v16, 208, 1)) == 0))
  {
LABEL_33:
    objc_msgSend(v4, "uninstallOnQueue");
    goto LABEL_34;
  }
  v19 = v17;
  v20 = ne_log_obj(v17, v18);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v8;
    v50 = 2112;
    v51 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: Installing personal session because enterprise session is being uninstalled: %@", buf, 0x16u);
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100049540;
  v46[3] = &unk_1000BEB80;
  v47 = v4;
  objc_msgSend(v19, "installWithCompletionHandler:", v46);

LABEL_34:
  objc_sync_exit(v8);

}

- (NWInterface)primaryWiFiInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 352, 1);
}

- (void)setPrimaryWiFiInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NWInterface)primaryPhysicalInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 360, 1);
}

- (void)setPrimaryPhysicalInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NWInterface)primaryCellularInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 368, 1);
}

- (void)setPrimaryCellularInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCellularInterface, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalInterface, 0);
  objc_storeStrong((id *)&self->_primaryWiFiInterface, 0);
  objc_storeStrong((id *)&self->_controlPolicySession, 0);
  objc_storeStrong((id *)&self->_activeAppPushSessions, 0);
  objc_storeStrong(&self->_stopWithProviderCompletionHandler, 0);
  objc_storeStrong((id *)&self->_fallbackInterfacesDict, 0);
  objc_storeStrong((id *)&self->_handlesTimer, 0);
  objc_storeStrong(&self->_pendingStopCompletion, 0);
  objc_storeStrong((id *)&self->_sessionsWaitingForCellularNetwork, 0);
  objc_storeStrong((id *)&self->_sessionsWaitingForNetwork, 0);
  objc_storeStrong((id *)&self->_wifiInterfaceEvaluator, 0);
  objc_storeStrong((id *)&self->_cellularInterfaceEvaluator, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalInterfaceEvaluator, 0);
  objc_storeStrong((id *)&self->_dnsProxySession, 0);
  objc_storeStrong((id *)&self->_filterSession, 0);
  objc_storeStrong((id *)&self->_personalVPNSession, 0);
  objc_storeStrong((id *)&self->_enterpriseVPNSession, 0);
  objc_storeStrong((id *)&self->_alwaysOnVPNSession, 0);
  objc_storeStrong((id *)&self->_savedPrimaryPhysicalInterfaceName, 0);
  objc_storeStrong((id *)&self->_consoleUserUUID, 0);
  objc_storeStrong((id *)&self->_termSource, 0);
  objc_storeStrong((id *)&self->_powerManager, 0);
  objc_storeStrong((id *)&self->_pendingSessionRequests, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_contentFilterClientListener, 0);
  objc_storeStrong((id *)&self->_flowDivertTokenListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_savedInterfaceInfo, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalPath, 0);
}

@end
