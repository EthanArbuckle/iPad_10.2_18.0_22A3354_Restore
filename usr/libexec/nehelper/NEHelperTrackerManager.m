@implementation NEHelperTrackerManager

- (NEHelperTrackerManager)initWithFirstMessage:(id)a3
{
  id v4;
  NEHelperTrackerManager *v5;
  xpc_connection_t remote_connection;
  uint64_t v7;
  OS_xpc_object *connection;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  NEHelperTrackerManager *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;

  v4 = a3;
  objc_opt_self(NEHelperTrackerManager);
  if (qword_100042AC8 != -1)
    dispatch_once(&qword_100042AC8, &stru_100038C68);
  v15.receiver = self;
  v15.super_class = (Class)NEHelperTrackerManager;
  v5 = -[NEHelperTrackerManager init](&v15, "init");
  if (v5)
  {
    remote_connection = xpc_dictionary_get_remote_connection(v4);
    v7 = objc_claimAutoreleasedReturnValue(remote_connection);
    connection = v5->_connection;
    v5->_connection = (OS_xpc_object *)v7;

    v9 = ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_opt_class(v5);
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ Created new NEHelperTrackerManager", buf, 0xCu);

    }
    v13 = v5;
  }

  return v5;
}

- (OS_dispatch_queue)handlerQueue
{
  return (OS_dispatch_queue *)(id)qword_100042AB0;
}

- (void)handleMessage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  xpc_object_t reply;
  uint64_t uint64;
  xpc_object_t value;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  size_t count;
  int64_t v17;
  const char *v18;
  void *v19;
  const char *string;
  const char *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NEHelperTrackerManager *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  char v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NEHelperTrackerManager *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  xpc_object_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *j;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v54;
  const char *v55;
  NEHelperTrackerManager *v56;
  id v57;
  NEHelperTrackerManager *v58;
  id v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  uint8_t v71[128];
  uint8_t buf[4];
  NEHelperTrackerManager *v73;
  __int16 v74;
  size_t v75;
  __int16 v76;
  id v77;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v73 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ processing Tracker Manager request", buf, 0xCu);
  }

  reply = xpc_dictionary_create_reply(v4);
  if (reply)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "tracker-command");
    if (uint64 != 2)
    {
      if (uint64 == 1)
      {
        value = xpc_dictionary_get_value(v4, "test-domains");
        v11 = (void *)objc_claimAutoreleasedReturnValue(value);
        os_unfair_lock_lock(&stru_100042BE8);
        if (!v11 && qword_100042AC0
          || (sub_100005D44((uint64_t)NEHelperTrackerManager, v11, 0), qword_100042AC0))
        {
          v14 = ne_log_obj(v12, v13);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            count = xpc_array_get_count((xpc_object_t)qword_100042AC0);
            *(_DWORD *)buf = 138412546;
            v73 = self;
            v74 = 2048;
            v75 = count;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ sending back domain list of %zu items", buf, 0x16u);
          }

          xpc_dictionary_set_int64(reply, "result-code", 0);
          xpc_dictionary_set_value(reply, "domain-dictionary", (xpc_object_t)qword_100042AB8);
          xpc_dictionary_set_value(reply, "sorted-domains", (xpc_object_t)qword_100042AC0);
          xpc_dictionary_set_int64(reply, "unique-prefix-count", qword_100042BD8);
          v17 = qword_100042BE0;
          v18 = "total-byte-count";
          v19 = reply;
        }
        else
        {
          v18 = "result-code";
          v19 = reply;
          v17 = 2;
        }
        xpc_dictionary_set_int64(v19, v18, v17);
        os_unfair_lock_unlock(&stru_100042BE8);

        goto LABEL_54;
      }
LABEL_30:
      xpc_dictionary_set_int64(reply, "result-code", 22);
LABEL_54:
      remote_connection = xpc_dictionary_get_remote_connection(v4);
      v54 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      xpc_connection_send_message(v54, reply);

      goto LABEL_55;
    }
    string = xpc_dictionary_get_string(v4, "bundle-id");
    if (!string)
      goto LABEL_30;
    v21 = string;
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    v55 = v21;
    v56 = self;
    if (!self)
    {
      v42 = 0;
      goto LABEL_41;
    }
    v23 = objc_msgSend(objc_alloc((Class)_SWCServiceSpecifier), "initWithServiceType:applicationIdentifier:domain:", 0, v22, 0);
    v24 = objc_alloc_init((Class)NSMutableArray);
    v70 = 0;
    v59 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCServiceDetails serviceDetailsWithServiceSpecifier:error:](_SWCServiceDetails, "serviceDetailsWithServiceSpecifier:error:", v23, &v70));
    v26 = (NEHelperTrackerManager *)v70;
    v58 = v26;
    v60 = v25;
    v61 = v22;
    if (v25)
    {
      v57 = v4;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v28 = v25;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(_QWORD *)v67 != v32)
              objc_enumerationMutation(v28);
            v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v34, "isApproved"))
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "serviceSpecifier"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "domain"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "lowercaseString"));

              if (v37 && (objc_msgSend(v24, "containsObject:", v37) & 1) == 0)
                objc_msgSend(v24, "addObject:", v37);

            }
            else
            {
              v31 = 1;
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
        }
        while (v30);
      }
      else
      {
        v31 = 0;
      }

      objc_msgSend(v24, "sortUsingSelector:", NSSelectorFromString(CFSTR("compare:")));
      v4 = v57;
      v40 = v58;
      v41 = v59;
      if (!objc_msgSend(v24, "count") && (v31 & 1) != 0)
      {
        v42 = 0;
LABEL_40:

        v22 = v61;
LABEL_41:

        v45 = ne_log_obj(v43, v44);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v73 = v56;
          v74 = 2080;
          v75 = (size_t)v55;
          v76 = 2112;
          v77 = v42;
          _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@ sending back approved domain list for %s: %@", buf, 0x20u);
        }

        if (v42)
        {
          v47 = xpc_array_create(0, 0);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v48 = v42;
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v50; j = (char *)j + 1)
              {
                if (*(_QWORD *)v63 != v51)
                  objc_enumerationMutation(v48);
                xpc_array_set_string(v47, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j), "UTF8String"));
              }
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
            }
            while (v50);
          }

        }
        else
        {
          v47 = 0;
        }
        xpc_dictionary_set_int64(reply, "result-code", 0);
        xpc_dictionary_set_value(reply, "sorted-domains", v47);

        goto LABEL_54;
      }
    }
    else
    {
      v38 = ne_log_obj(v26, v27);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = v58;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v58;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Error getting info: %@\n", buf, 0xCu);
      }

      objc_msgSend(v24, "count");
      v41 = v59;
    }
    v42 = v24;
    goto LABEL_40;
  }
LABEL_55:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
