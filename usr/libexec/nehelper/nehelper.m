id sub_1000036C4(uint64_t a1, int a2)
{
  int v3;
  void *v4;
  uint64_t v5;

  objc_opt_self();
  v3 = a2 - 1;
  if ((a2 - 1) <= 0xD && ((0x3FBBu >> v3) & 1) != 0)
  {
    v5 = objc_opt_class(*off_100039040[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void sub_10000371C(os_unfair_lock_s *a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  SEL v5;

  if (a1)
  {
    v3 = a1 + 2;
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(objc_getProperty(a1, v5, 40, 1), "addObject:", v4);

    os_unfair_lock_unlock(v3);
  }
}

void sub_1000037E4(uint64_t a1, void *a2, int64_t a3, void *a4)
{
  id v7;
  xpc_object_t reply;
  void *v9;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v11;
  xpc_object_t original;

  original = a2;
  v7 = a4;
  objc_opt_self(a1);
  reply = xpc_dictionary_create_reply(original);
  v9 = reply;
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "result-code", a3);
    if (v7)
      xpc_dictionary_set_value(v9, "result-data", v7);
    remote_connection = xpc_dictionary_get_remote_connection(original);
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_connection_send_message(v11, v9);

  }
}

void sub_100003894(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  SEL v9;
  NSObject *v10;
  _xpc_connection_s *v11;
  id v12;
  _QWORD handler[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  if (v3)
  {
    v12 = v3;
    v4 = xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection;
    v3 = v12;
    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      v6 = v12;
      v7 = v6;
      if (v5)
      {
        v14 = 0;
        v15 = &v14;
        v16 = 0x3032000000;
        v17 = sub_100004620;
        v18 = sub_10000D264;
        v8 = v6;
        v19 = v8;
        v10 = objc_getProperty(v5, v9, 24, 1);
        xpc_connection_set_target_queue((xpc_connection_t)v8, v10);

        v11 = (_xpc_connection_s *)v15[5];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100003C14;
        handler[3] = &unk_100038EA8;
        handler[4] = v5;
        handler[5] = &v14;
        xpc_connection_set_event_handler(v11, handler);
        xpc_connection_resume((xpc_connection_t)v15[5]);
        _Block_object_dispose(&v14, 8);

      }
      v3 = v12;
    }
  }

}

void sub_1000039BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003C14(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _xpc_connection_s *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int uint64;
  objc_class *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  _xpc_connection_s *v22;
  NEHelperClient *v23;
  pid_t pid;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  _BOOL8 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  dispatch_queue_attr_t v36;
  NSObject *v37;
  NSObject *v38;
  SEL v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  uint32_t v47;
  uint64_t v48;
  NSString *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  NSString *v58;
  void *v59;
  pid_t v60;
  void *v61;
  const char *v62;
  id Property;
  id v64;
  uint64_t v65;
  _xpc_connection_s *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  objc_class *v77;
  NSString *v78;
  id v79;
  pid_t v80;
  objc_class *v81;
  NSString *v82;
  id v83;
  pid_t v84;
  NSString *v85;
  void *v86;
  objc_class *v87;
  NSString *v88;
  uint64_t v89;
  void *v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  _QWORD handler[6];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  objc_super v102;
  uint8_t buf[4];
  _OWORD *v104;
  __int16 v105;
  _OWORD *v106;
  __int16 v107;
  pid_t v108;
  _OWORD buffer[2];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;

  v3 = a2;
  v5 = v3;
  if (!v3 || xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v6 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      xpc_connection_cancel(v6);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

    }
    else
    {
      v9 = ne_log_obj(0, v4);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buffer[0]) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "XPC connection is nil when handling first message", (uint8_t *)buffer, 2u);
      }

    }
    goto LABEL_38;
  }
  uint64 = xpc_dictionary_get_uint64(v5, "delegate-class-id");
  if (uint64)
  {
    v12 = (objc_class *)sub_1000036C4((uint64_t)NEHelperServer, uint64);
    if (v12)
    {
      v14 = v12;
      v15 = -[objc_class conformsToProtocol:](v12, "conformsToProtocol:", &OBJC_PROTOCOL___NEHelperDelegate);
      if ((_DWORD)v15)
      {
        v17 = objc_msgSend([v14 alloc], "initWithFirstMessage:", v5);
        if (v17)
        {
          v19 = v17;
          v96 = 0;
          v97 = &v96;
          v98 = 0x3032000000;
          v99 = sub_100004620;
          v100 = sub_10000D264;
          v20 = [NEHelperClient alloc];
          v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v22 = v21;
          v91 = v19;
          if (v20)
          {
            v102.receiver = (id)v20;
            v102.super_class = (Class)NEHelperClient;
            v23 = (NEHelperClient *)objc_msgSendSuper2(&v102, "init");
            v20 = (unint64_t)v23;
            if (v23)
            {
              objc_storeStrong((id *)&v23->_connection, v21);
              objc_storeStrong((id *)(v20 + 32), v19);
              *(_DWORD *)(v20 + 8) = uint64;
              pid = xpc_connection_get_pid(v22);
              *(_QWORD *)(v20 + 16) = (32 * pid + uint64) ^ v20;
              v25 = nelog_is_debug_logging_enabled() ^ 1;
              if (uint64 == 2)
                LOBYTE(v25) = 0;
              if ((v25 & 1) == 0)
              {
                v122 = 0u;
                v123 = 0u;
                v120 = 0u;
                v121 = 0u;
                v118 = 0u;
                v119 = 0u;
                v116 = 0u;
                v117 = 0u;
                v114 = 0u;
                v115 = 0u;
                v112 = 0u;
                v113 = 0u;
                v110 = 0u;
                v111 = 0u;
                memset(buffer, 0, sizeof(buffer));
                v26 = proc_name(pid, buffer, 0x100u);
                v28 = ne_log_obj(v26, v27);
                v29 = objc_claimAutoreleasedReturnValue(v28);
                v30 = v29;
                if (uint64 == 2)
                {
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = buffer;
                    v105 = 1024;
                    LODWORD(v106) = pid;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Processing new Settings client connection from client %s pid %d", buf, 0x12u);
                  }
                }
                else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  v87 = (objc_class *)sub_1000036C4((uint64_t)NEHelperServer, uint64);
                  v88 = NSStringFromClass(v87);
                  v89 = objc_claimAutoreleasedReturnValue(v88);
                  *(_DWORD *)buf = 138412802;
                  v104 = (_OWORD *)v89;
                  v105 = 2080;
                  v106 = buffer;
                  v107 = 1024;
                  v108 = pid;
                  v90 = (void *)v89;
                  _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Processing new client connection with class %@ from client %s pid %d", buf, 0x1Cu);

                }
              }
              *(_QWORD *)&buffer[0] = _NSConcreteStackBlock;
              *((_QWORD *)&buffer[0] + 1) = 3221225472;
              *(_QWORD *)&buffer[1] = sub_10000DCC4;
              *((_QWORD *)&buffer[1] + 1) = &unk_100039000;
              *(_QWORD *)&v110 = __PAIR64__(uint64, pid);
              if (qword_100042C50 != -1)
                dispatch_once(&qword_100042C50, buffer);
            }
          }

          v101 = (id)v20;
          v61 = (void *)v97[5];
          if (v61)
          {
            sub_10000371C(*(os_unfair_lock_s **)(a1 + 32), v61);
            Property = (id)v97[5];
            if (Property)
              Property = objc_getProperty(Property, v62, 32, 1);
            v64 = Property;
            v65 = *(_QWORD *)(a1 + 32);
            v66 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_10000D26C;
            handler[3] = &unk_100038EA8;
            handler[4] = v65;
            handler[5] = &v96;
            xpc_connection_set_event_handler(v66, handler);
            v69 = ne_log_obj(v67, v68);
            v70 = objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              v77 = (objc_class *)sub_1000036C4((uint64_t)NEHelperServer, uint64);
              v78 = NSStringFromClass(v77);
              v79 = (id)objc_claimAutoreleasedReturnValue(v78);
              v80 = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
              LODWORD(buffer[0]) = 138412546;
              *(_QWORD *)((char *)buffer + 4) = v79;
              WORD6(buffer[0]) = 1024;
              *(_DWORD *)((char *)buffer + 14) = v80;
              _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "Start processing first message with class %@ from client pid %d", (uint8_t *)buffer, 0x12u);

            }
            if (v64)
            {
              if ((objc_opt_respondsToSelector(v64, "handlerQueue") & 1) != 0)
              {
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "handlerQueue"));
                v92[0] = _NSConcreteStackBlock;
                v92[1] = 3221225472;
                v92[2] = sub_10000D5D8;
                v92[3] = &unk_100039750;
                v93 = v64;
                v94 = v5;
                xpc_dictionary_handoff_reply(v94, v71, v92, v72);

              }
              else
              {
                v73 = objc_msgSend(v64, "handleMessage:", v5);
              }
            }
            else
            {
              sub_1000037E4((uint64_t)NEHelperServer, v5, 32, 0);
            }
            v75 = ne_log_obj(v73, v74);
            v76 = objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            {
              v81 = (objc_class *)sub_1000036C4((uint64_t)NEHelperServer, uint64);
              v82 = NSStringFromClass(v81);
              v83 = (id)objc_claimAutoreleasedReturnValue(v82);
              v84 = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
              LODWORD(buffer[0]) = 138412546;
              *(_QWORD *)((char *)buffer + 4) = v83;
              WORD6(buffer[0]) = 1024;
              *(_DWORD *)((char *)buffer + 14) = v84;
              _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "End processing first message with class %@ from client pid %d", (uint8_t *)buffer, 0x12u);

            }
          }
          else
          {
            sub_1000037E4((uint64_t)NEHelperServer, v5, 1, 0);
            xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          }
          _Block_object_dispose(&v96, 8);

          goto LABEL_38;
        }
        v52 = ne_log_obj(0, v18);
        v44 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v85 = NSStringFromClass(v14);
          v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
          LODWORD(buffer[0]) = 138412290;
          *(_QWORD *)((char *)buffer + 4) = v86;
          _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@ initWithConnection failed", (uint8_t *)buffer, 0xCu);

        }
      }
      else
      {
        v48 = ne_log_obj(v15, v16);
        v44 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v49 = NSStringFromClass(v14);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          LODWORD(buffer[0]) = 138412290;
          *(_QWORD *)((char *)buffer + 4) = v50;
          _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Received invalid class name \"%@\"", (uint8_t *)buffer, 0xCu);

        }
      }
      goto LABEL_35;
    }
    v43 = ne_log_obj(0, v13);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buffer[0]) = 67109120;
      DWORD1(buffer[0]) = uint64;
      v45 = "Received unknown class ID \"%d\"";
      v46 = v44;
      v47 = 8;
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, v45, (uint8_t *)buffer, v47);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  v31 = xpc_dictionary_get_BOOL(v5, "init-command");
  if (!v31)
  {
    v51 = ne_log_obj(v31, v32);
    v44 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buffer[0]) = 0;
      v45 = "Received invalid class ID";
      v46 = v44;
      v47 = 2;
      goto LABEL_32;
    }
LABEL_35:

    v55 = ne_log_obj(v53, v54);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v57 = (objc_class *)sub_1000036C4((uint64_t)NEHelperServer, uint64);
      v58 = NSStringFromClass(v57);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      v60 = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      LODWORD(buffer[0]) = 138412546;
      *(_QWORD *)((char *)buffer + 4) = v59;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v60;
      _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to create a NEHelperClient with class %@ from client pid %d", (uint8_t *)buffer, 0x12u);

    }
    sub_1000037E4((uint64_t)NEHelperServer, v5, 22, 0);
    xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    goto LABEL_38;
  }
  v33 = *(void **)(a1 + 32);
  if (v33)
  {
    v34 = ne_log_obj(v31, v32);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buffer[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Handling init command", (uint8_t *)buffer, 2u);
    }

    sub_10000D5E4();
    sub_10000D7AC(1);
    objc_opt_self(NEHelperTrackerManager);
    v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = dispatch_queue_create("Initialize tracking domain info", v37);

    dispatch_async(v38, &stru_100038CB0);
    v40 = objc_getProperty(v33, v39, 24, 1);
    objc_opt_self(NEHelperConfigurationManager);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
    *(_QWORD *)&buffer[0] = _NSConcreteStackBlock;
    *((_QWORD *)&buffer[0] + 1) = 3221225472;
    *(_QWORD *)&buffer[1] = sub_10001F890;
    *((_QWORD *)&buffer[1] + 1) = &unk_100039830;
    *(_QWORD *)&v110 = v40;
    v42 = v40;
    objc_msgSend(v41, "loadConfigurationsWithCompletionQueue:handler:", v42, buffer);

    sub_10001FB48((uint64_t)NEHelperConfigurationManager, 0);
  }
  sub_1000037E4((uint64_t)NEHelperServer, v5, 0, 0);
LABEL_38:

}

void sub_1000045EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004620(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000048D0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  char v35;
  uint64_t v36;
  void *i;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t v43;
  const __CFDictionary *v44;
  uint64_t v45;
  OSStatus v46;
  CFDataRef v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  xpc_object_t v51;
  char **v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  uint32_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const __CFDictionary *v69;
  uint64_t v70;
  uint64_t v71;
  CFTypeRef v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  void *v77;
  int64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  char *v87;
  char *v88;
  char *v89;
  void *v90;
  void *v91;
  xpc_object_t v92;
  uint64_t v93;
  NSObject *v94;
  void *v95;
  int64_t v96;
  uint64_t v97;
  NSObject *v98;
  int v99;
  uint64_t v100;
  NSObject *v101;
  int v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  NSObject *v108;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  CFTypeRef v123;
  CFTypeRef v124;
  CFTypeRef result;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[3];
  _QWORD v131[3];
  _BYTE v132[128];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[3];
  _QWORD v136[3];
  _QWORD v137[3];
  _QWORD v138[3];
  uint8_t v139[128];
  uint8_t buf[4];
  uint64_t v141;
  __int16 v142;
  void *v143;

  v5 = a2;
  v6 = a3;
  v8 = v6;
  if (v6)
  {
    v9 = ne_log_obj(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
      goto LABEL_4;
    }
    v57 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v141 = v57;
    v142 = 2112;
    v143 = v8;
    v30 = "%@ loadConfigurationWithID failed. error: %@";
    v58 = v10;
    v59 = 22;
LABEL_46:
    _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, v30, buf, v59);
    goto LABEL_3;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relay"));

  if (!v11)
  {
    v28 = ne_log_obj(v12, v13);
    v10 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v29 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v141 = v29;
    v30 = "%@ no relay found in configuration";
    goto LABEL_45;
  }
  v14 = *(_QWORD *)(a1 + 56);
  if (v14 == 2)
  {
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relay"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "relays"));

    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
    if (v33)
    {
      v34 = v33;
      v118 = v5;
      v35 = 0;
      v36 = *(_QWORD *)v120;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(_QWORD *)v120 != v36)
            objc_enumerationMutation(v32);
          v38 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "certificateReferences"));
          if (v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "certificateReferences"));
            v41 = objc_msgSend(v40, "containsObject:", *(_QWORD *)(a1 + 48));

          }
          else
          {
            v41 = 0;
          }

          v35 |= v41;
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
      }
      while (v34);

      v5 = v118;
      if ((v35 & 1) != 0)
      {
        v130[0] = kSecReturnRef;
        v130[1] = kSecClass;
        v131[0] = kCFBooleanTrue;
        v131[1] = kSecClassCertificate;
        v130[2] = kSecValuePersistentRef;
        v131[2] = *(_QWORD *)(a1 + 48);
        v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v131, v130, 3));
        result = 0;
        v46 = SecItemCopyMatching(v44, &result);
        if (result)
        {
          v47 = SecCertificateCopyData((SecCertificateRef)result);
          v124 = v47;
          v48 = myCFRelease(&result);
          if (v47)
          {
            v50 = (id)_CFXPCCreateXPCObjectFromCFObject(v47);
            myCFRelease(&v124);
            v51 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_value(v51, "relay-certificate-data", v50);
            sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 0, v51);

            goto LABEL_88;
          }
          v97 = ne_log_obj(v48, v49);
          v98 = objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            v113 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v141 = v113;
            _os_log_error_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%@ SecCertificateCopyData failed", buf, 0xCu);
          }

          v77 = *(void **)(a1 + 40);
          v78 = 22;
        }
        else
        {
          v75 = ne_log_obj(0, v45);
          v76 = objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            v111 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            v141 = v111;
            v142 = 1024;
            LODWORD(v143) = v46;
            _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching failed %d", buf, 0x12u);
          }

          v77 = *(void **)(a1 + 40);
          v78 = 2;
        }
        sub_1000037E4((uint64_t)NEHelperServer, v77, v78, 0);
LABEL_89:

        goto LABEL_4;
      }
    }
    else
    {

    }
    v60 = ne_log_obj(v42, v43);
    v10 = objc_claimAutoreleasedReturnValue(v60);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v61 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v141 = v61;
    v30 = "%@ requested certificate not found in relay configuration";
LABEL_45:
    v58 = v10;
    v59 = 12;
    goto LABEL_46;
  }
  if (v14 != 1)
    goto LABEL_4;
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v117 = v5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relay"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relays"));

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v127;
LABEL_10:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v127 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v20);
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identityReference"));
      if (v22)
      {
        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identityReference"));
        v25 = objc_msgSend(v24, "isEqualToData:", *(_QWORD *)(a1 + 48));

        if ((v25 & 1) != 0)
          break;
      }
      if (v18 == (id)++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
        if (v18)
          goto LABEL_10;
        goto LABEL_17;
      }
    }
    v44 = v21;

    if (!v44)
      goto LABEL_38;
    v52 = &selRef_loadConfigurations_withFilter_completionQueue_completionHandler_;
    if (qword_100042AA8)
    {
      v53 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100042AA8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
      if (v53)
      {
        v50 = (id)v53;
        v54 = 0;
        v5 = v117;
        goto LABEL_61;
      }
    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary identity](v44, "identity"));
    v63 = objc_msgSend(v62, "isModernSystem");

    if ((v63 & 1) == 0)
    {
      v137[0] = kSecReturnRef;
      v137[1] = kSecClass;
      v138[0] = kCFBooleanTrue;
      v138[1] = kSecClassIdentity;
      v137[2] = kSecValuePersistentRef;
      v138[2] = *(_QWORD *)(a1 + 48);
      v50 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v138, v137, 3));
      v124 = 0;
      v79 = SecItemCopyMatching((CFDictionaryRef)v50, &v124);
      v72 = v124;
      v5 = v117;
      if (!v124)
      {
        v102 = v79;
        v103 = ne_log_obj(v79, v80);
        v104 = objc_claimAutoreleasedReturnValue(v103);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          v115 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v141 = v115;
          v142 = 1024;
          LODWORD(v143) = v102;
          _os_log_error_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching for identity failed %d", buf, 0x12u);
        }

        v95 = *(void **)(a1 + 40);
        v96 = 2;
        goto LABEL_80;
      }
      result = v124;
      goto LABEL_57;
    }
    v135[0] = kSecReturnRef;
    v135[1] = kSecValuePersistentRef;
    v64 = *(_QWORD *)(a1 + 48);
    v136[0] = kCFBooleanTrue;
    v136[1] = v64;
    v135[2] = kSecClass;
    v136[2] = kSecClassCertificate;
    v50 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v136, v135, 3));
    v124 = 0;
    v65 = SecItemCopyMatching((CFDictionaryRef)v50, &v124);
    if (!v124)
    {
      v99 = v65;
      v100 = ne_log_obj(v65, v66);
      v101 = objc_claimAutoreleasedReturnValue(v100);
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        v114 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v141 = v114;
        v142 = 1024;
        LODWORD(v143) = v99;
        _os_log_error_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching for cert failed %d", buf, 0x12u);
      }

      sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
      v5 = v117;
      goto LABEL_88;
    }
    v134[0] = kCFBooleanTrue;
    v133[0] = kSecReturnRef;
    v133[1] = kSecValuePersistentRef;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary identity](v44, "identity"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "keyPersistentReference"));
    v133[2] = kSecClass;
    v134[1] = v68;
    v134[2] = kSecClassKey;
    v69 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v134, v133, 3));

    v123 = 0;
    v70 = SecItemCopyMatching(v69, &v123);
    if (v123)
    {
      v72 = (CFTypeRef)SecIdentityCreate(0, v124);
      result = v72;
      myCFRelease(&v124);
      v73 = myCFRelease(&v123);
      v5 = v117;
      if (v72)
      {
        v50 = v69;
        v52 = &selRef_loadConfigurations_withFilter_completionQueue_completionHandler_;
LABEL_57:

        v50 = objc_msgSend(objc_alloc((Class)SecKeyProxy), "initWithIdentity:", v72);
        v82 = ne_log_obj(v50, v81);
        v83 = objc_claimAutoreleasedReturnValue(v82);
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "Created new key proxy", buf, 2u);
        }

        v84 = myCFRelease(&result);
        if (!v50)
        {
LABEL_67:
          v93 = ne_log_obj(v84, v85);
          v94 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            v112 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v141 = v112;
            _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%@ key proxy creation failed ", buf, 0xCu);
          }

          v95 = *(void **)(a1 + 40);
          v96 = 12;
LABEL_80:
          sub_1000037E4((uint64_t)NEHelperServer, v95, v96, 0);
          goto LABEL_88;
        }
        v54 = 1;
LABEL_61:
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "endpoint"));

        if (v86)
        {
          if (v54)
          {
            v87 = v52[341];
            if (!v87)
            {
              v88 = (char *)objc_alloc_init((Class)NSMutableDictionary);
              v89 = v52[341];
              v52[341] = v88;

              v87 = v52[341];
            }
            objc_msgSend(v87, "setObject:forKeyedSubscript:", v50, *(_QWORD *)(a1 + 48));
          }
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "endpoint"));
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "_endpoint"));

          v92 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_value(v92, "relay-identity-xpc-endpoint", v91);
          sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 0, v92);

          goto LABEL_88;
        }
        goto LABEL_67;
      }
      v109 = ne_log_obj(v73, v74);
      v110 = objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "Failed to create identity reference", buf, 2u);
      }

      sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
    }
    else
    {
      v106 = v70;
      v107 = ne_log_obj(v70, v71);
      v108 = objc_claimAutoreleasedReturnValue(v107);
      v5 = v117;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        v116 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v141 = v116;
        v142 = 1024;
        LODWORD(v143) = v106;
        _os_log_error_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching for key failed %d", buf, 0x12u);
      }

      sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
      myCFRelease(&v124);
    }
    v50 = v69;
LABEL_88:

    goto LABEL_89;
  }
LABEL_17:

LABEL_38:
  v55 = ne_log_obj(v26, v27);
  v56 = objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
  {
    v105 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v141 = v105;
    _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%@ requested identity not found in relay configuration", buf, 0xCu);
  }

  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
  v5 = v117;
LABEL_4:

}

void sub_10000549C(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  if (qword_100042AA8)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = *(id *)(a1 + 32);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          objc_msgSend((id)qword_100042AA8, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5), (_QWORD)v6);
          v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

  }
}

void sub_100005D44(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  const void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  id v88;
  id v89;
  uint64_t v90;
  void *i;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  const char *v96;
  size_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  uint64_t has_high_ascii;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  unsigned int v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  id v116;
  id v117;
  int v118;
  unsigned int v119;
  void *v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  NSObject *v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  id v139;
  uint64_t v140;
  void *j;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  NSObject *v150;
  id v151;
  id v152;
  void *v153;
  id v154;
  id v155;
  uint64_t v156;
  void *k;
  void *v158;
  xpc_object_t v159;
  id v160;
  uint64_t v161;
  double v162;
  double v163;
  uint64_t v164;
  uint64_t v165;
  NSObject *v166;
  uint64_t v167;
  uint64_t v168;
  int v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  _BOOL4 v174;
  uint64_t v175;
  NSObject *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  NSObject *v180;
  uint64_t v181;
  NSObject *v182;
  int *v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  NSObject *v189;
  id v190;
  std::error_code *v191;
  int v192;
  int v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  NSObject *v197;
  int v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  NSObject *v202;
  uint64_t v203;
  uint64_t v204;
  int v205;
  uint64_t v206;
  NSObject *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  char v213;
  char v214;
  void *context;
  xpc_object_t v216;
  id v217;
  void *v218;
  int xdict;
  xpc_object_t xdicta;
  int v221;
  uint64_t v222;
  xpc_object_t xarray;
  uint64_t xarraya;
  id v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  id v229;
  id obj;
  id obja;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  double v244;
  double v245;
  int v246;
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[12];
  __int16 v251;
  _OWORD *v252;
  _OWORD applier[16];
  int out_token[16];
  __int128 v255;
  __int128 v256;
  __int128 v257;
  uint8_t buf[48];
  __int128 v259;

  v5 = a2;
  v6 = objc_opt_self(a1);
  v244 = 0.0;
  v245 = 0.0;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_array)
  {
    v8 = (void *)qword_100042AB8;
    qword_100042AB8 = 0;

    v9 = (void *)qword_100042AC0;
    qword_100042AC0 = 0;

    qword_100042BD8 = 0;
    qword_100042BE0 = 0;
    qword_100042AD0 = 0;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  if (!qword_100042AC0)
  {
    v213 = a3;
    v214 = v7;
    v216 = xpc_dictionary_create(0, 0, 0);
    xarray = objc_alloc_init((Class)NSMutableDictionary);
    context = objc_autoreleasePoolPush();
    v10 = objc_alloc_init((Class)NSMutableDictionary);
    v11 = v5;
    v12 = objc_opt_self(v6);
    v14 = ne_log_obj(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(applier[0]) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Adding Test domains to tracker list", (uint8_t *)applier, 2u);
    }

    if (v5 && xpc_get_type(v11) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(v11))
    {
      *(_QWORD *)&applier[0] = _NSConcreteStackBlock;
      *((_QWORD *)&applier[0] + 1) = 3221225472;
      *(_QWORD *)&applier[1] = sub_100007BF4;
      *((_QWORD *)&applier[1] + 1) = &unk_100038C90;
      *(_QWORD *)&applier[2] = v10;
      xpc_array_apply(v11, applier);

    }
    v217 = v5;

    v16 = v10;
    v17 = objc_opt_self(v6);
    v19 = ne_log_obj(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Fetching Web tracking domain info from SWC", buf, 2u);
    }

    v21 = (id)objc_claimAutoreleasedReturnValue(+[_SWCTrackingDomainInfo trackingDomainInfoWithDomains:](_SWCTrackingDomainInfo, "trackingDomainInfoWithDomains:", 0));
    v23 = v21;
    if (!v21 || (v21 = objc_msgSend(v21, "count")) == 0)
    {
      v60 = ne_log_obj(v21, v22);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "No Web tracker domain list", buf, 2u);
      }

      v64 = ne_log_obj(v62, v63);
      v65 = objc_claimAutoreleasedReturnValue(v64);
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      LOWORD(applier[0]) = 0;
      v79 = "Failed to retrieve tracker domain list for Web";
      goto LABEL_119;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCTrackingDomainInfo lastDatabaseUpdate](_SWCTrackingDomainInfo, "lastDatabaseUpdate"));
    objc_msgSend(v24, "timeIntervalSinceReferenceDate");
    v26 = v25;

    v29 = ne_log_obj(v27, v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v23, "count");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCTrackingDomainInfo lastDatabaseUpdate](_SWCTrackingDomainInfo, "lastDatabaseUpdate"));
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Tracker domain info retrieved - count %lu (last update %@)", buf, 0x16u);

    }
    v212 = v6;

    memset(out_token, 0, sizeof(out_token));
    v33 = v23;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", out_token, applier, 16);
    if (v34)
    {
      v35 = v34;
      v221 = 0;
      xdict = 0;
      v36 = **(_QWORD **)&out_token[4];
      v228 = **(_QWORD **)&out_token[4];
      obj = v33;
      do
      {
        v37 = 0;
        v225 = v35;
        do
        {
          if (**(_QWORD **)&out_token[4] != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*(_QWORD *)&out_token[2] + 8 * (_QWORD)v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v38));
          v40 = objc_msgSend(v39, "source");
          v42 = v40;
          if ((v40 & 1) != 0)
          {
            v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v38));
            if (v45)
            {
              v44 = v45;
              v46 = v39;
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", CFSTR("source")));
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v47, "unsignedIntValue") | 1));
              -[NSObject setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v48, CFSTR("source"));

            }
            else
            {
              v51 = v16;
              v44 = objc_alloc_init((Class)NSMutableDictionary);
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "ownerName"));
              -[NSObject setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v52, CFSTR("owner"));

              v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v42));
              -[NSObject setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v53, CFSTR("source"));

              v54 = v39;
              if (qword_100042BF0 != -1)
                dispatch_once(&qword_100042BF0, &stru_100038CD0);
              v46 = v39;
              if (byte_100042BEC)
                v55 = objc_msgSend(v54, "canBlockRequest");
              else
                v55 = 0;

              v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v55));
              -[NSObject setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v56, CFSTR("can-block-request"));

              v16 = v51;
              v49 = objc_msgSend(v51, "setObject:forKeyedSubscript:", v44, v38);
              v35 = v225;
            }
            v57 = ne_log_obj(v49, v50);
            v58 = objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v38));
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = ++xdict;
              v35 = v225;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v38;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v42;
              *(_WORD *)&buf[28] = 2112;
              *(_QWORD *)&buf[30] = v59;
              _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%d: Adding Web domain <%@><%lu><%@>", buf, 0x26u);

            }
            v39 = v46;

            v36 = v228;
            v33 = obj;
          }
          else
          {
            v43 = ne_log_obj(v40, v41);
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&buf[4] = ++v221;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v38;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v42;
              _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%d: Skipping non-Web domain <%@><0x%lX>", buf, 0x1Cu);
            }
          }

          v37 = (char *)v37 + 1;
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", out_token, applier, 16);
      }
      while (v35);
    }
    else
    {
      v221 = 0;
      xdict = 0;
    }

    v68 = ne_log_obj(v66, v67);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = xdict;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v221;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Added %d Web domains, skipped %d non-Web domains", buf, 0xEu);
    }

    v70 = (const void *)NEResourcesCopyAppTrackingDomainsPath();
    v5 = v217;
    if (!v70)
    {
      v80 = ne_log_obj(0, v71);
      v65 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        v79 = "No App tracker domain file found";
        goto LABEL_119;
      }
LABEL_43:

      objc_autoreleasePoolPop(context);
LABEL_44:

      goto LABEL_45;
    }
    v72 = sub_1000075E4(v212, v16, &v245, v70);
    if ((v72 & 1) == 0)
    {
      v81 = ne_log_obj(v72, v73);
      v65 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        v79 = "Failed to retrieve tracker domain list for App";
        goto LABEL_119;
      }
      goto LABEL_43;
    }
    v74 = (const void *)NEResourcesCopyTestAppTrackingDomainsPath();
    if (v74)
    {
      v76 = sub_1000075E4(v212, v16, &v244, v74);
      if ((v76 & 1) == 0)
      {
        v78 = ne_log_obj(v76, v77);
        v65 = objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          LOWORD(applier[0]) = 0;
          v79 = "Failed to retrieve tracker test domain list for App";
LABEL_119:
          _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, v79, (uint8_t *)applier, 2u);
          goto LABEL_43;
        }
        goto LABEL_43;
      }
    }
    else
    {
      v82 = ne_log_obj(0, v75);
      v83 = objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "No Test App tracker domain file found", (uint8_t *)applier, 2u);
      }

    }
    v84 = v16;
    xdicta = v216;
    v229 = xarray;
    v226 = objc_opt_self(v212);
    v86 = ne_log_obj(v226, v85);
    v87 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      v211 = objc_msgSend(v84, "count");
      LODWORD(applier[0]) = 134217984;
      *(_QWORD *)((char *)applier + 4) = v211;
      _os_log_debug_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "Processing all domains <count %lu>", (uint8_t *)applier, 0xCu);
    }

    v259 = 0u;
    memset(buf, 0, sizeof(buf));
    obja = v84;
    v88 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", buf, out_token, 16);
    if (v88)
    {
      v89 = v88;
      v90 = **(_QWORD **)&buf[16];
      do
      {
        for (i = 0; i != v89; i = (char *)i + 1)
        {
          if (**(_QWORD **)&buf[16] != v90)
            objc_enumerationMutation(obja);
          v92 = *(void **)(*(_QWORD *)&buf[8] + 8 * (_QWORD)i);
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "objectForKeyedSubscript:", v92));
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("owner")));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("source")));
          v96 = (const char *)objc_msgSend(v92, "UTF8String");
          v97 = strlen(v96);
          v99 = ne_log_obj(v97, v98);
          v100 = objc_claimAutoreleasedReturnValue(v99);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            v118 = objc_msgSend(v95, "unsignedIntValue") & 1;
            v119 = objc_msgSend(v95, "unsignedIntValue");
            LODWORD(applier[0]) = 138413570;
            *(_QWORD *)((char *)applier + 4) = v226;
            WORD6(applier[0]) = 2080;
            *(_QWORD *)((char *)applier + 14) = v96;
            WORD3(applier[1]) = 1024;
            DWORD2(applier[1]) = v97;
            WORD6(applier[1]) = 2112;
            *(_QWORD *)((char *)&applier[1] + 14) = v94;
            WORD3(applier[2]) = 1024;
            DWORD2(applier[2]) = v118;
            WORD6(applier[2]) = 1024;
            *(_DWORD *)((char *)&applier[2] + 14) = (v119 >> 1) & 1;
            _os_log_debug_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEBUG, "%@ DDG domain %s <%d> : %@ web %u app %u", (uint8_t *)applier, 0x32u);
          }

          v246 = 0;
          has_high_ascii = ne_trie_has_high_ascii(v96, (int)v97);
          if (!(_DWORD)has_high_ascii)
            goto LABEL_80;
          v103 = ne_log_obj(has_high_ascii, v102);
          v104 = objc_claimAutoreleasedReturnValue(v103);
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(applier[0]) = 136315394;
            *(_QWORD *)((char *)applier + 4) = v96;
            WORD6(applier[0]) = 1024;
            *(_DWORD *)((char *)applier + 14) = v97;
            _os_log_debug_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEBUG, "DDG domain - puny-coding %s <%d>", (uint8_t *)applier, 0x12u);
          }

          v105 = ne_tracker_validate_domain(v96, v97, sub_10000B280, applier, 253, &v246);
          if ((_DWORD)v105 && v246 >= 1 && v246 < 254)
          {
            *((_BYTE *)applier + v246) = 0;
            v107 = ne_log_obj(v105, v106);
            v108 = objc_claimAutoreleasedReturnValue(v107);
            if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v250 = 136315394;
              *(_QWORD *)&v250[4] = v96;
              v251 = 2080;
              v252 = applier;
              _os_log_debug_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEBUG, "DDG domain - puny-coded %s -> %s", v250, 0x16u);
            }

            v96 = (const char *)applier;
LABEL_80:
            v109 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_string(v109, "owner", (const char *)objc_msgSend(objc_retainAutorelease(v94), "UTF8String"));
            v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("can-block-request")));
            xpc_dictionary_set_BOOL(v109, "can-block-request", (BOOL)objc_msgSend(v110, "BOOLValue"));

            if ((objc_msgSend(v95, "unsignedIntValue") & 1) != 0)
              xpc_dictionary_set_BOOL(v109, "is-web-list", 1);
            if ((objc_msgSend(v95, "unsignedIntValue") & 2) != 0)
              xpc_dictionary_set_BOOL(v109, "is-app-list", 1);
            xpc_dictionary_set_value(xdicta, v96, v109);
            objc_opt_self(v226);
            if (v96 && (v111 = strlen(v96), v111 - 254 >= 0xFFFFFF03))
            {
              v114 = v111 - 1;
              v115 = byte_100042AD8;
              do
                *v115++ = v96[v114--];
              while (v114 != -1);
              v112 = byte_100042AD8;
              byte_100042AD8[v111] = 0;
            }
            else
            {
              v112 = 0;
            }
            v116 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v112, 4);
            v117 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v96, 4);
            objc_msgSend(v229, "setObject:forKeyedSubscript:", v117, v116);

            goto LABEL_93;
          }
          v113 = ne_log_obj(v105, v106);
          v109 = objc_claimAutoreleasedReturnValue(v113);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v250 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "Failed to puny-code domain", v250, 2u);
          }
LABEL_93:

        }
        v89 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", buf, out_token, 16);
      }
      while (v89);
    }

    v120 = v229;
    v121 = objc_alloc_init((Class)NSMutableDictionary);
    v122 = objc_alloc_init((Class)NSMutableDictionary);
    v124 = ne_log_obj(v122, v123);
    v125 = objc_claimAutoreleasedReturnValue(v124);
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = objc_msgSend(v229, "count");
      LODWORD(applier[0]) = 134217984;
      *(_QWORD *)((char *)applier + 4) = v126;
      _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "Deriving unique prefixes for %lu tracker domains", (uint8_t *)applier, 0xCu);
    }

    v242 = 0u;
    v243 = 0u;
    v240 = 0u;
    v241 = 0u;
    v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v229, "keyEnumerator"));
    v127 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v240, v249, 16);
    v227 = v121;
    if (v127)
    {
      v128 = v127;
      v129 = 0;
      v222 = 0;
      xarraya = *(_QWORD *)v241;
      do
      {
        v130 = 0;
        v131 = v129;
        do
        {
          if (*(_QWORD *)v241 != xarraya)
            objc_enumerationMutation(v218);
          v132 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * (_QWORD)v130);
          v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "objectForKeyedSubscript:", v132));

          v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "objectForKeyedSubscript:", v129));
          if (!v133)
          {
            v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "objectForKeyedSubscript:", v129));
            v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("owner")));
            v136 = objc_msgSend(v129, "length");
            v222 += (uint64_t)objc_msgSend(v135, "length") + 2 * (_QWORD)v136 + 2;
            objc_msgSend(v227, "setObject:forKeyedSubscript:", v129, v129);

          }
          v238 = 0u;
          v239 = 0u;
          v236 = 0u;
          v237 = 0u;
          v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "keyEnumerator"));
          v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v236, v248, 16);
          if (v138)
          {
            v139 = v138;
            v140 = *(_QWORD *)v237;
            do
            {
              for (j = 0; j != v139; j = (char *)j + 1)
              {
                if (*(_QWORD *)v237 != v140)
                  objc_enumerationMutation(v137);
                v142 = *(_QWORD *)(*((_QWORD *)&v236 + 1) + 8 * (_QWORD)j);
                if ((objc_msgSend(v132, "isEqual:", v142) & 1) == 0)
                {
                  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "commonPrefixWithString:options:", v142, 2));
                  if (objc_msgSend(v143, "length"))
                    objc_msgSend(v122, "setObject:forKeyedSubscript:", v143, v143);

                }
              }
              v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v236, v248, 16);
            }
            while (v139);
          }

          v130 = (char *)v130 + 1;
          v131 = v129;
          v120 = v229;
        }
        while (v130 != v128);
        v128 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v240, v249, 16);
      }
      while (v128);

      v144 = v222;
      v121 = v227;
    }
    else
    {
      v144 = 0;
    }

    v145 = objc_msgSend(v122, "count");
    if (!v145)
    {
      v145 = objc_msgSend(v120, "count");
      if (v145 == (id)1)
      {
        v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "allKeys"));
        v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectAtIndexedSubscript:", 0));

        objc_msgSend(v122, "setObject:forKeyedSubscript:", v148, v148);
      }
    }
    v149 = ne_log_obj(v145, v146);
    v150 = objc_claimAutoreleasedReturnValue(v149);
    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
    {
      v151 = objc_msgSend(v122, "count");
      v152 = objc_msgSend(v120, "count");
      LODWORD(applier[0]) = 134218240;
      *(_QWORD *)((char *)applier + 4) = v151;
      WORD6(applier[0]) = 2048;
      *(_QWORD *)((char *)applier + 14) = v152;
      _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "Derived %lu unique prefixes for %lu tracker domains", (uint8_t *)applier, 0x16u);
    }

    xarray = xpc_array_create(0, 0);
    v232 = 0u;
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "keyEnumerator"));
    v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v232, v247, 16);
    if (v154)
    {
      v155 = v154;
      v156 = *(_QWORD *)v233;
      do
      {
        for (k = 0; k != v155; k = (char *)k + 1)
        {
          if (*(_QWORD *)v233 != v156)
            objc_enumerationMutation(v153);
          v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v232 + 1) + 8 * (_QWORD)k), "lowercaseString"));
          v159 = xpc_string_create((const char *)objc_msgSend(v158, "UTF8String"));
          xpc_array_append_value(xarray, v159);

        }
        v155 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v232, v247, 16);
      }
      while (v155);
    }

    objc_autoreleasePoolPop(context);
    if ((v213 & 1) == 0)
    {
      objc_storeStrong((id *)&qword_100042AB8, v216);
      objc_storeStrong((id *)&qword_100042AC0, xarray);
      v160 = objc_msgSend(v122, "count");
      qword_100042BD8 = (uint64_t)v160;
      qword_100042BE0 = v144;
    }
    v162 = v244;
    v163 = v245;
    if (v245 <= v244)
      *(double *)&v164 = v244;
    else
      *(double *)&v164 = v245;
    if (v26 > v245)
      *(double *)&v164 = v26;
    qword_100042AD0 = v164;
    v165 = ne_log_obj(v160, v161);
    v166 = objc_claimAutoreleasedReturnValue(v165);
    v5 = v217;
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(applier[0]) = 134218752;
      *(_QWORD *)((char *)applier + 4) = qword_100042AD0;
      WORD6(applier[0]) = 2048;
      *(double *)((char *)applier + 14) = v26;
      WORD3(applier[1]) = 2048;
      *((double *)&applier[1] + 1) = v163;
      LOWORD(applier[2]) = 2048;
      *(double *)((char *)&applier[2] + 2) = v162;
      _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEFAULT, "Domain list g_lastUpdateTimeInterval %f <lastUpdateTimeInterval %f lastUpdateTimeIntervalApp %f lastUpdateTimeIntervalAppTest %f>", (uint8_t *)applier, 0x2Au);
    }

    *(_QWORD *)v250 = 0;
    if ((v214 & 1) == 0)
    {
      v167 = open("/private/var/db/com.apple.networkextension.tracker-info", 0);
      if ((v167 & 0x80000000) != 0)
      {
        v181 = ne_log_obj(v167, v168);
        v182 = objc_claimAutoreleasedReturnValue(v181);
        if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
        {
          v183 = __error();
          v184 = strerror(*v183);
          LODWORD(applier[0]) = 136315650;
          *(_QWORD *)((char *)applier + 4) = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
          WORD6(applier[0]) = 2080;
          *(_QWORD *)((char *)applier + 14) = "/private/var/db/com.apple.networkextension.tracker-info";
          WORD3(applier[1]) = 2080;
          *((_QWORD *)&applier[1] + 1) = v184;
          _os_log_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_DEFAULT, "%s: failed to open mmap file %s: %s", (uint8_t *)applier, 0x20u);
        }

      }
      else
      {
        v169 = v167;
        memset(applier, 0, 112);
        v170 = ne_trie_init_from_file(applier, v167, v250);
        v172 = v170;
        v174 = *(double *)v250 != *(double *)&qword_100042AD0 || (_DWORD)v170 == 0;
        v175 = ne_log_obj(v170, v171);
        v176 = objc_claimAutoreleasedReturnValue(v175);
        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
        {
          out_token[0] = 136316674;
          *(_QWORD *)&out_token[1] = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
          LOWORD(out_token[3]) = 2080;
          *(_QWORD *)((char *)&out_token[3] + 2) = "/private/var/db/com.apple.networkextension.tracker-info";
          HIWORD(out_token[5]) = 1024;
          out_token[6] = v169;
          LOWORD(out_token[7]) = 1024;
          *(int *)((char *)&out_token[7] + 2) = v172 != 0;
          HIWORD(out_token[8]) = 2048;
          *(_QWORD *)&out_token[9] = *(_QWORD *)v250;
          LOWORD(out_token[11]) = 2048;
          *(_QWORD *)((char *)&out_token[11] + 2) = qword_100042AD0;
          HIWORD(out_token[13]) = 1024;
          out_token[14] = v174;
          _os_log_debug_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEBUG, "%s: opened mmap file %s <fd %d> trie_ok %d file timestamp %f g_lastUpdateTimeInterval %f do_rebuild %d", (uint8_t *)out_token, 0x3Cu);
        }

        if (v172)
          ne_trie_free(applier);
        v177 = close(v169);
        v5 = v217;
        if (!v174)
        {
          v179 = ne_log_obj(v177, v178);
          v180 = objc_claimAutoreleasedReturnValue(v179);
          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(applier[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v180, OS_LOG_TYPE_DEFAULT, "No need to re-build the tracker domain trie", (uint8_t *)applier, 2u);
          }

LABEL_170:
          objc_opt_self(NEHelperTrackerManager);
          v198 = dword_1000429E0;
          if (dword_1000429E0 != -1)
            goto LABEL_177;
          out_token[0] = -1;
          v199 = notify_register_check("com.apple.nehelper.tracker-info-ready", out_token);
          if ((_DWORD)v199)
          {
            v201 = ne_log_obj(v199, v200);
            v202 = objc_claimAutoreleasedReturnValue(v201);
            if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
            {
              LODWORD(applier[0]) = 136315138;
              *(_QWORD *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
              _os_log_error_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification", (uint8_t *)applier, 0xCu);
            }

            v198 = dword_1000429E0;
          }
          else
          {
            v198 = out_token[0];
            dword_1000429E0 = out_token[0];
          }
          if (v198 != -1)
          {
LABEL_177:
            v203 = notify_set_state(v198, (unint64_t)*(double *)&qword_100042AD0);
            if ((_DWORD)v203)
            {
              v205 = v203;
              v206 = ne_log_obj(v203, v204);
              v207 = objc_claimAutoreleasedReturnValue(v206);
              if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
              {
                LODWORD(applier[0]) = 136315394;
                *(_QWORD *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
                WORD6(applier[0]) = 1024;
                *(_DWORD *)((char *)applier + 14) = v205;
                _os_log_error_impl((void *)&_mh_execute_header, v207, OS_LOG_TYPE_ERROR, "Failed to set the state for the %s notification (status %d)", (uint8_t *)applier, 0x12u);
              }
            }
            else
            {
              v208 = notify_post("com.apple.nehelper.tracker-info-ready");
              v210 = ne_log_obj(v208, v209);
              v207 = objc_claimAutoreleasedReturnValue(v210);
              if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(applier[0]) = 136315138;
                *(_QWORD *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
                _os_log_impl((void *)&_mh_execute_header, v207, OS_LOG_TYPE_DEFAULT, "Posted to %s", (uint8_t *)applier, 0xCu);
              }
            }

          }
          goto LABEL_44;
        }
      }
    }
    v185 = open("/private/var/db/com.apple.networkextension.tracker-info.temp", 518, 420);
    if ((int)v185 >= 1)
    {
      v187 = v185;
      v257 = 0u;
      v256 = 0u;
      v255 = 0u;
      memset(out_token, 0, sizeof(out_token));
      v188 = ne_log_obj(v185, v186);
      v189 = objc_claimAutoreleasedReturnValue(v188);
      if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(applier[0]) = 136315906;
        *(_QWORD *)((char *)applier + 4) = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
        WORD6(applier[0]) = 2080;
        *(_QWORD *)((char *)applier + 14) = "/private/var/db/com.apple.networkextension.tracker-info.temp";
        WORD3(applier[1]) = 2048;
        *((_QWORD *)&applier[1] + 1) = (unint64_t)*(double *)v250;
        LOWORD(applier[2]) = 2048;
        *(_QWORD *)((char *)&applier[2] + 2) = (unint64_t)*(double *)&qword_100042AD0;
        _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_DEFAULT, "%s: Created new mmap file %s (old ts %llu new ts %llu)", (uint8_t *)applier, 0x2Au);
      }

      v190 = objc_msgSend(v122, "count");
      ne_tracker_build_trie(out_token, xarray, xdicta, v190, v144, v187, *(double *)&qword_100042AD0);
      ne_trie_free(out_token);
      close(v187);
      rename((const std::__fs::filesystem::path *)"/private/var/db/com.apple.networkextension.tracker-info.temp", (const std::__fs::filesystem::path *)"/private/var/db/com.apple.networkextension.tracker-info", v191);
      if (v192 < 0)
      {
        v193 = *__error();
        v194 = strerror_r(v193, (char *)applier, 0x80uLL);
        if ((_DWORD)v194)
          LOBYTE(applier[0]) = 0;
        v196 = ne_log_obj(v194, v195);
        v197 = objc_claimAutoreleasedReturnValue(v196);
        if (os_log_type_enabled(v197, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "/private/var/db/com.apple.networkextension.tracker-info.temp";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "/private/var/db/com.apple.networkextension.tracker-info";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v193;
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = applier;
          _os_log_fault_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_FAULT, "Failed to move %s to %s: [%d] %s", buf, 0x26u);
        }

        v5 = v217;
      }
    }
    goto LABEL_170;
  }
LABEL_45:

}

uint64_t sub_1000075E4(uint64_t a1, void *a2, _QWORD *a3, const void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  const __CFString *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  _BYTE v67[30];
  _BYTE v68[128];

  v61 = a2;
  v7 = objc_opt_self(a1);
  v9 = ne_log_obj(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v67 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Fetching from App domain file url %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributesOfItemAtPath:error:", a4, 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", a4));
  CFRelease(a4);
  if (v12)
  {
    if (v13)
    {
      v14 = objc_msgSend(v13, "length");
      if (v14)
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSFileCreationDate));
        v18 = v16;
        if (v16)
        {
          -[NSObject timeIntervalSinceReferenceDate](v16, "timeIntervalSinceReferenceDate");
          *a3 = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v13, 0, 0));
          v22 = ne_log_obj(v20, v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          v24 = v23;
          if (v20)
          {
            v55 = v13;
            v56 = v12;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v25 = objc_msgSend(v20, "count");
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)v67 = v25;
              *(_WORD *)&v67[8] = 2112;
              *(_QWORD *)&v67[10] = v18;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Fetched App domain list <count %lu, %@>", buf, 0x16u);
            }
            v54 = v18;

            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v26 = v20;
            v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
            if (v27)
            {
              v28 = v27;
              v58 = 0;
              v29 = *(_QWORD *)v63;
              v30 = CFSTR("s");
              v59 = v26;
              do
              {
                v31 = 0;
                v60 = v28;
                do
                {
                  if (*(_QWORD *)v63 != v29)
                    objc_enumerationMutation(v26);
                  v32 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v31);
                  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v32));
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v30));
                  v35 = objc_msgSend(v34, "unsignedIntValue");
                  if ((v35 & 2) != 0)
                  {
                    v39 = v29;
                    v40 = v30;
                    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", v32));
                    if (v41)
                    {
                      v38 = v41;
                      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", CFSTR("source")));
                      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v42, "unsignedIntValue") | 2));
                      -[NSObject setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v43, CFSTR("source"));

                    }
                    else
                    {
                      v38 = objc_alloc_init((Class)NSMutableDictionary);
                      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("n")));
                      -[NSObject setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v46, CFSTR("owner"));

                      -[NSObject setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v34, CFSTR("source"));
                      v44 = objc_msgSend(v61, "setObject:forKeyedSubscript:", v38, v32);
                    }
                    v47 = ne_log_obj(v44, v45);
                    v48 = objc_claimAutoreleasedReturnValue(v47);
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                    {
                      v57 = objc_msgSend(v34, "unsignedIntValue");
                      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", v32));
                      *(_DWORD *)buf = 67109890;
                      *(_DWORD *)v67 = ++HIDWORD(v58);
                      *(_WORD *)&v67[4] = 2112;
                      *(_QWORD *)&v67[6] = v32;
                      *(_WORD *)&v67[14] = 1024;
                      *(_DWORD *)&v67[16] = v57;
                      *(_WORD *)&v67[20] = 2112;
                      *(_QWORD *)&v67[22] = v49;
                      _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%d: Adding App domain <%@><%u><%@>", buf, 0x22u);

                    }
                    v30 = v40;
                    v29 = v39;
                    v26 = v59;
                    v28 = v60;
                  }
                  else
                  {
                    v37 = ne_log_obj(v35, v36);
                    v38 = objc_claimAutoreleasedReturnValue(v37);
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 67109634;
                      LODWORD(v58) = v58 + 1;
                      *(_DWORD *)v67 = v58;
                      *(_WORD *)&v67[4] = 2112;
                      *(_QWORD *)&v67[6] = v32;
                      *(_WORD *)&v67[14] = 2048;
                      *(_QWORD *)&v67[16] = v34;
                      _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%d: Skipping App domain <%@><0x%lX>", buf, 0x1Cu);
                    }
                  }

                  v31 = (char *)v31 + 1;
                }
                while (v28 != v31);
                v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
              }
              while (v28);
            }

            v50 = 1;
            v13 = v55;
            v12 = v56;
            v18 = v54;
            goto LABEL_36;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "App tracker domain list invalid", buf, 2u);
          }

          v26 = 0;
        }
        else
        {
          v52 = ne_log_obj(0, v17);
          v26 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "No App tracker domain file creation date", buf, 2u);
          }
        }
        v50 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
  }
  v51 = ne_log_obj(v14, v15);
  v18 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "No App tracker domain file metadata or data", buf, 2u);
  }
  v50 = 0;
LABEL_37:

  return v50;
}

void sub_100007BC8(id a1)
{
  byte_100042BEC = +[_SWCTrackingDomainInfo instancesRespondToSelector:](_SWCTrackingDomainInfo, "instancesRespondToSelector:", "canBlockRequest");
}

uint64_t sub_100007BF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *string_ptr;
  const char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      if (string_ptr)
      {
        v7 = string_ptr;
        v8 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("<Test Owner>"), CFSTR("owner"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 3));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("source"));

        v10 = *(void **)(a1 + 32);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v11);

        v14 = ne_log_obj(v12, v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v17 = *(void **)(a1 + 32);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));
          v20 = 136315394;
          v21 = v7;
          v22 = 2112;
          v23 = v19;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Adding test domain <%s><%@>", (uint8_t *)&v20, 0x16u);

        }
      }
    }
  }

  return 1;
}

void sub_100007DB4(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("NEHelperTrackerManagerQueue", v4);
  v3 = (void *)qword_100042AB0;
  qword_100042AB0 = (uint64_t)v2;

}

void sub_100007E04(id a1)
{
  os_unfair_lock_lock(&stru_100042BE8);
  sub_100005D44((uint64_t)NEHelperTrackerManager, 0, 1);
  os_unfair_lock_unlock(&stru_100042BE8);
}

BOOL sub_10000826C(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t uint64;
  id v7;
  const void *data;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t isKindOfClass;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFArray *v28;
  const __CFArray *v29;
  CFIndex Count;
  uint64_t v31;
  id v32;
  CFIndex v33;
  BOOL v34;
  const void *ValueAtIndex;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *string;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const void *BundleIdentifier;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  const __CFArray *v54;
  uint64_t v55;
  const __CFArray *v56;
  const void *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  id v64;
  const char *v65;
  NSObject *v66;
  uint32_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  id v83;
  const __CFArray *v84;
  uint64_t v85;
  const __CFArray *v86;
  CFIndex v87;
  CFIndex v88;
  CFIndex v89;
  const void *v90;
  const void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  int64_t v96;
  uint64_t v97;
  NSObject *v98;
  xpc_object_t v99;
  uint64_t v100;
  uint64_t v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  BOOL v108;
  void *v109;
  double v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  const char *v117;
  uint64_t v118;
  NSObject *v119;
  const __CFArray *v120;
  uint64_t v121;
  const __CFArray *v122;
  const void *v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  NSObject *v128;
  void *v129;
  id v130;
  const char *v131;
  NSObject *v132;
  uint32_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  unsigned int v158;
  unint64_t v159;
  const __CFString *v160;
  uint64_t v161;
  id v162;
  void *v163;
  void *v164;
  id v165;
  id v166;
  void *v167;
  uint64_t v168;
  id v169;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  const __CFString *v177;
  const __CFString *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  uint64_t v182;
  void *v183;
  CFBooleanRef v184;
  void *v185;
  void *v186;
  id v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  id v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  id v207;
  id v208;
  id v209;
  NEHelperHotspotConfigurationTask *v210;
  id v211;
  id v212;
  id v213;
  NEHelperHotspotConfigurationTask *v214;
  id v215;
  NSNumber *v216;
  void *v217;
  void *v218;
  id v219;
  uint64_t v220;
  uint64_t v221;
  NSObject *v222;
  void *v223;
  id v224;
  void *v225;
  id v226;
  uint64_t v227;
  uint64_t v228;
  NSObject *v229;
  void *v230;
  id v231;
  void *v232;
  id v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  NSObject *v237;
  void *v238;
  id v239;
  int v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  NSObject *v244;
  uint64_t v245;
  NSObject *v246;
  void *v247;
  id v248;
  void *v249;
  id v250;
  void *v251;
  id v252;
  void *v253;
  unsigned __int8 v254;
  id obj;
  void *v256;
  unsigned __int8 v257;
  id v258;
  id v259;
  id v260;
  id v261;
  uint64_t v262;
  id v263;
  id v264;
  id v265;
  id v266;
  void *v267;
  uint64_t v268;
  size_t length;
  _BYTE buf[22];

  v4 = a2;
  v5 = v4;
  if (!a1)
  {
    v34 = 0;
    goto LABEL_75;
  }
  uint64 = xpc_dictionary_get_uint64(v4, "MessageType");
  if (uint64 == 1003)
  {
    v24 = v5;
    v25 = sub_100009A6C(0);
    if (v25)
    {
      v27 = v25;
      v10 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v10, "MessageType", 0x3EDuLL);
      v28 = (const __CFArray *)WiFiManagerClientCopyNetworksWithBundleIdentifier(v27, *(_QWORD *)(a1 + 8));
      length = (size_t)v28;
      if (v28)
      {
        v29 = v28;
        Count = CFArrayGetCount(v28);
        if (Count)
        {
          v31 = Count;
          v32 = objc_alloc_init((Class)NSMutableArray);
          if (v31 < 1)
          {
            v34 = 1;
LABEL_57:
            v82 = _CFXPCCreateXPCObjectFromCFObject(v32);
            xpc_dictionary_set_value(v10, "QueryResult", v82);
            sub_1000037E4((uint64_t)NEHelperServer, v24, 100, v10);
          }
          else
          {
            v33 = 0;
            v34 = 0;
            while (1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v29, v33);
              v36 = sub_100009B2C((uint64_t)ValueAtIndex);
              v37 = objc_claimAutoreleasedReturnValue(v36);
              if (!v37)
                break;
              v39 = (void *)v37;
              objc_msgSend(v32, "addObject:", v37);

              v34 = v31 <= ++v33;
              if (v31 == v33)
                goto LABEL_57;
            }
            v100 = ne_log_obj(0, v38);
            v82 = objc_claimAutoreleasedReturnValue(v100);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = objc_opt_class(a1);
              v166 = *(id *)&buf[4];
              _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%@ received invalid network object from WiFiManager.", buf, 0xCu);

            }
          }

          myCFRelease(&length);
LABEL_73:

          goto LABEL_74;
        }
        sub_1000037E4((uint64_t)NEHelperServer, v24, 100, v10);
        myCFRelease(&length);
      }
      else
      {
        sub_1000037E4((uint64_t)NEHelperServer, v24, 100, v10);
      }
      v34 = 1;
      goto LABEL_73;
    }
    v72 = ne_log_obj(0, v26);
    v10 = objc_claimAutoreleasedReturnValue(v72);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_39:
      v34 = 0;
      goto LABEL_73;
    }
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = objc_opt_class(a1);
    v70 = *(id *)&buf[4];
    v71 = "%@ failed to get WiFiManager client.";
LABEL_106:
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v71, buf, 0xCu);

    goto LABEL_39;
  }
  if (uint64 != 1002)
  {
    if (uint64 != 1001)
    {
      v34 = 1;
      goto LABEL_75;
    }
    v7 = v5;
    length = 0;
    data = xpc_dictionary_get_data(v7, "AddParameter", &length);
    if (data && length)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0));
      v11 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v10, 0);
      v12 = objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(NEHotspotConfiguration), CFSTR("NEHotspotConfigurationKey"));
      isKindOfClass = objc_claimAutoreleasedReturnValue(v12);
      v15 = (void *)isKindOfClass;
      if (isKindOfClass
        && (v16 = objc_opt_class(NEHotspotConfiguration),
            isKindOfClass = objc_opt_isKindOfClass(v15, v16),
            (isKindOfClass & 1) != 0))
      {
        v17 = objc_msgSend(v15, "validate");
        if (v17 != (id)100)
        {
          v96 = (int64_t)v17;
          v97 = ne_log_obj(v17, v18);
          v98 = objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            v164 = (void *)objc_opt_class(a1);
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v164;
            v165 = v164;
            _os_log_error_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%@ failed to validate the configuration data for add/update request.", buf, 0xCu);

          }
          v99 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v99, "MessageType", 0x3ECuLL);
          sub_1000037E4((uint64_t)NEHelperServer, v7, v96, v99);

          v34 = 1;
          goto LABEL_45;
        }
        v19 = v15;
        v20 = WiFiNetworkCreate(kCFAllocatorDefault, 0);
        if (v20)
        {
          v21 = (id)v20;
          if ((objc_msgSend(v19, "useSSIDPrefix") & 1) != 0
            || (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "SSID")), v22, !v22))
          {
            if (!objc_msgSend(v19, "useSSIDPrefix")
              || (v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "SSIDPrefix")),
                  v104,
                  !v104)
              || (v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "SSIDPrefix")),
                  WiFiNetworkSetProperty(v21, CFSTR("SSID_STR"), v105),
                  v105,
                  !objc_msgSend(v19, "hidden")))
            {
LABEL_84:
              v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lifeTimeInDays"));
              if (v106 && (sub_100009CD4(a1) & 1) == 0 && objc_msgSend(v19, "securityType") != (id)3)
              {
                v258 = v21;
                v107 = objc_msgSend(v19, "securityType");

                v108 = v107 == (id)4;
                v21 = v258;
                if (v108)
                  goto LABEL_90;
                v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lifeTimeInDays"));
                objc_msgSend(v109, "doubleValue");
                v111 = v110 * 86400.0;

                v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                WiFiNetworkSetExpireDate(v258, objc_msgSend(v106, "dateByAddingTimeInterval:", v111));
              }

LABEL_90:
              WiFiNetworkSetProperty(v21, CFSTR("AP_MODE"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
              v267 = v19;
              if (objc_msgSend(v19, "securityType") == (id)1)
              {
                WiFiNetworkSetWEP(v21, 1);
              }
              else
              {
                if (objc_msgSend(v19, "securityType") != (id)2)
                {
                  if (objc_msgSend(v19, "securityType") != (id)3 && objc_msgSend(v19, "securityType") != (id)4)
                    goto LABEL_160;
                  v259 = v21;
                  v139 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eapSettings"));
                  v261 = objc_alloc_init((Class)NSMutableDictionary);
                  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "username"));
                  v141 = objc_msgSend(v140, "length");

                  if (v141)
                  {
                    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "username"));
                    objc_msgSend(v261, "setObject:forKey:", v142, CFSTR("UserName"));

                  }
                  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "password"));
                  v144 = objc_msgSend(v143, "length");

                  if (v144)
                  {
                    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "password"));
                    objc_msgSend(v261, "setObject:forKey:", v145, CFSTR("UserPassword"));

                  }
                  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "supportedEAPTypes"));
                  v147 = objc_msgSend(v146, "count");

                  if (v147)
                  {
                    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "supportedEAPTypes"));
                    objc_msgSend(v261, "setObject:forKey:", v148, CFSTR("AcceptEAPTypes"));

                  }
                  if (objc_msgSend(v139, "isTLSClientCertificateRequired"))
                  {
                    v263 = objc_alloc_init((Class)NSMutableDictionary);
                    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "identityReference"));
                    objc_msgSend(v263, "setObject:forKeyedSubscript:", v149, CFSTR("TLSClientIdentityData"));

                    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "clientTrustChainReference"));
                    v151 = objc_msgSend(v150, "count");

                    if (v151)
                    {
                      v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "clientTrustChainReference"));
                      objc_msgSend(v263, "setObject:forKeyedSubscript:", v152, CFSTR("TLSClientIdentityTrustChain"));

                    }
                    objc_msgSend(v261, "setObject:forKeyedSubscript:", v263, CFSTR("TLSIdentityHandle"));

                  }
                  v264 = v11;
                  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "trustedServerCertificateReferences"));
                  v154 = objc_msgSend(v153, "count");

                  if (v154)
                  {
                    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "trustedServerCertificateReferences"));
                    objc_msgSend(v261, "setObject:forKeyedSubscript:", v155, CFSTR("TLSTrustedCertificates"));

                  }
                  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "supportedEAPTypes"));
                  v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 21));
                  v158 = objc_msgSend(v156, "containsObject:", v157);

                  if (v158)
                  {
                    v159 = (unint64_t)objc_msgSend(v139, "ttlsInnerAuthenticationType");
                    if (v159 > 3)
                      v160 = CFSTR("EAP");
                    else
                      v160 = off_100038DC8[v159];
                    objc_msgSend(v261, "setObject:forKeyedSubscript:", v160, CFSTR("TTLSInnerAuthentication"));
                  }
                  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "outerIdentity"));
                  v171 = objc_msgSend(v170, "length");

                  if (v171)
                  {
                    v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "outerIdentity"));
                    objc_msgSend(v261, "setObject:forKeyedSubscript:", v172, CFSTR("OuterIdentity"));

                  }
                  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "trustedServerNames"));
                  v174 = objc_msgSend(v173, "count");

                  if (v174)
                  {
                    v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "trustedServerNames"));
                    objc_msgSend(v261, "setObject:forKeyedSubscript:", v175, CFSTR("TLSTrustedServerNames"));

                  }
                  v176 = objc_msgSend(v139, "preferredTLSVersion");
                  v177 = CFSTR("1.2");
                  if (v176 == (id)1)
                    v177 = CFSTR("1.1");
                  if (v176)
                    v178 = v177;
                  else
                    v178 = CFSTR("1.0");
                  objc_msgSend(v261, "setObject:forKeyedSubscript:", v178, CFSTR("TLSMaximumVersion"));

                  v256 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v261, CFSTR("EAPClientConfiguration")));
                  WiFiNetworkSetProperty(v259, kWiFiNetworkEnterpriseProfile, v256);
                  WiFiNetworkSetWPA(v259, 1);
                  v19 = v267;
                  if (objc_msgSend(v267, "securityType") == (id)4)
                  {
                    WiFiNetworkSetProperty(v259, kWiFiIsHotspot, kCFBooleanTrue);
                    v179 = kWiFiDomainName;
                    v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "hs20Settings"));
                    v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "domainName"));
                    WiFiNetworkSetProperty(v259, v179, v181);

                    v182 = kWiFiSPRoaming;
                    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "hs20Settings"));
                    if (objc_msgSend(v183, "isRoamingEnabled"))
                      v184 = kCFBooleanTrue;
                    else
                      v184 = kCFBooleanFalse;
                    v19 = v267;
                    WiFiNetworkSetProperty(v259, v182, v184);

                    v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "hs20Settings"));
                    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "roamingConsortiumOIs"));
                    v187 = objc_msgSend(v186, "count");

                    if (v187)
                    {
                      v188 = kWiFiRoamingConsortiumOIs;
                      v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "hs20Settings"));
                      v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "roamingConsortiumOIs"));
                      WiFiNetworkSetProperty(v259, v188, v190);

                    }
                    v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "hs20Settings"));
                    v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "naiRealmNames"));
                    v193 = objc_msgSend(v192, "count");

                    if (v193)
                    {
                      v194 = kWiFiNaiRealmName;
                      v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "hs20Settings"));
                      v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "naiRealmNames"));
                      WiFiNetworkSetProperty(v259, v194, v196);

                    }
                  }
                  v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eapSettings"));
                  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "password"));
                  v199 = objc_msgSend(v198, "length");

                  if (v199)
                  {
                    v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eapSettings"));
                    v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "password"));
                    WiFiNetworkSetPassword(v259, v201);

                  }
                  v137 = v261;
                  v11 = v264;
                  v21 = v259;
LABEL_159:

LABEL_160:
                  v268 = (uint64_t)v21;
                  v202 = sub_100009A6C(0);
                  if (v202)
                  {
                    v262 = v202;
                    v265 = v11;
                    v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                    v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "UUIDString"));

                    v206 = *(void **)(a1 + 8);
                    v257 = objc_msgSend(v19, "joinOnce");
                    v254 = objc_msgSend(v19, "isAccessory");
                    v260 = v206;
                    v207 = v206;
                    v208 = v7;
                    obj = v205;
                    v209 = v205;
                    objc_opt_self(NEHelperHotspotConfigurationTask);
                    v210 = [NEHelperHotspotConfigurationTask alloc];
                    v211 = v209;
                    v212 = v208;
                    v213 = v207;
                    if (v210)
                    {
                      *(_QWORD *)buf = v210;
                      *(_QWORD *)&buf[8] = NEHelperHotspotConfigurationTask;
                      v214 = (NEHelperHotspotConfigurationTask *)objc_msgSendSuper2((objc_super *)buf, "init");
                      v210 = v214;
                      if (v214)
                      {
                        objc_storeStrong((id *)&v214->_taskIdentifier, obj);
                        objc_storeStrong((id *)&v210->_requestMessage, a2);
                        objc_storeStrong((id *)&v210->_bundleID, v260);
                        v210->_joinOnce = v257;
                        v210->_isAccessory = v254;
                      }
                    }
                    v11 = v265;

                    objc_msgSend((id)qword_100042C00, "setObject:forKeyedSubscript:", v210, v211);
                    v266 = v211;

                    v215 = objc_alloc_init((Class)NSMutableDictionary);
                    objc_msgSend(v215, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 8), kWiFiNetworkBundleIdentifierKey);
                    v216 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_100009CD4(a1) ^ 1);
                    v217 = (void *)objc_claimAutoreleasedReturnValue(v216);
                    objc_msgSend(v215, "setObject:forKeyedSubscript:", v217, kWiFiAddNetworkOriginatorKey);

                    v218 = v267;
                    v219 = objc_msgSend(v267, "joinOnce");
                    if ((_DWORD)v219)
                    {
                      v221 = ne_log_obj(v219, v220);
                      v222 = objc_claimAutoreleasedReturnValue(v221);
                      if (os_log_type_enabled(v222, OS_LOG_TYPE_INFO))
                      {
                        v223 = (void *)objc_opt_class(a1);
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v223;
                        v224 = v223;
                        _os_log_impl((void *)&_mh_execute_header, v222, OS_LOG_TYPE_INFO, "%@ setting kWiFiAddNetworkDisassociateOnSessionEndKey option", buf, 0xCu);

                      }
                      v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
                      objc_msgSend(v215, "setObject:forKeyedSubscript:", v225, kWiFiAddNetworkDisassociateOnSessionEndKey);

                      v218 = v267;
                    }
                    v226 = objc_msgSend(v218, "useSSIDPrefix");
                    if ((_DWORD)v226)
                    {
                      v228 = ne_log_obj(v226, v227);
                      v229 = objc_claimAutoreleasedReturnValue(v228);
                      if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
                      {
                        v230 = (void *)objc_opt_class(a1);
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v230;
                        v231 = v230;
                        _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_INFO, "%@ setting kWiFiAddNetworkUseSSIDPrefixKey option", buf, 0xCu);

                      }
                      v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
                      objc_msgSend(v215, "setObject:forKeyedSubscript:", v232, kWiFiAddNetworkUseSSIDPrefixKey);

                      v218 = v267;
                    }
                    v233 = objc_msgSend(v218, "isAccessory");
                    v235 = v266;
                    if ((_DWORD)v233)
                    {
                      v236 = ne_log_obj(v233, v234);
                      v237 = objc_claimAutoreleasedReturnValue(v236);
                      if (os_log_type_enabled(v237, OS_LOG_TYPE_INFO))
                      {
                        v238 = (void *)objc_opt_class(a1);
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v238;
                        v239 = v238;
                        _os_log_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_INFO, "%@ setting isAccessory option", buf, 0xCu);

                        v235 = v266;
                      }

                      objc_msgSend(v215, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("isAccessory"));
                    }
                    v240 = WiFiManagerClientAddNetworkAsync(v262, v268, v215, sub_100009DB8, v235);
                    v241 = myCFRelease(&v268);
                    v34 = v240 == 0;
                    if (v240)
                    {
                      v243 = ne_log_obj(v241, v242);
                      v244 = objc_claimAutoreleasedReturnValue(v243);
                      if (os_log_type_enabled(v244, OS_LOG_TYPE_ERROR))
                      {
                        v249 = (void *)objc_opt_class(a1);
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)&buf[4] = v249;
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v240;
                        v250 = v249;
                        _os_log_error_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_ERROR, "%@ WiFiManagerClientAddNetworkAsync() failed: %d", buf, 0x12u);

                      }
                    }

                    goto LABEL_45;
                  }
                  v245 = ne_log_obj(0, v203);
                  v246 = objc_claimAutoreleasedReturnValue(v245);
                  if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
                  {
                    v251 = (void *)objc_opt_class(a1);
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v251;
                    v252 = v251;
                    _os_log_error_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_ERROR, "%@ failed to get WiFiManager client.", buf, 0xCu);

                  }
                  myCFRelease(&v268);
LABEL_44:
                  v34 = 0;
LABEL_45:

                  goto LABEL_73;
                }
                WiFiNetworkSetWPA(v21, 1);
              }
              v134 = kWiFiNetworkPasswordStringKey;
              v135 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "passphrase"));
              v136 = v134;
              v137 = (void *)v135;
              WiFiNetworkSetProperty(v21, v136, v135);
              goto LABEL_159;
            }
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "SSID"));
            WiFiNetworkSetProperty(v21, CFSTR("SSID_STR"), v23);

            if ((objc_msgSend(v19, "hidden") & 1) == 0)
              goto LABEL_84;
          }
          WiFiNetworkSetProperty(v21, CFSTR("HIDDEN_NETWORK"), kCFBooleanTrue);
          goto LABEL_84;
        }

        v114 = ne_log_obj(v112, v113);
        v78 = objc_claimAutoreleasedReturnValue(v114);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v115 = (void *)objc_opt_class(a1);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v115;
          v116 = v115;
          v117 = "%@ failed to convert input configuration into wifi network dictionary for add/update request";
LABEL_108:
          _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, v117, buf, 0xCu);

        }
      }
      else
      {
        v77 = ne_log_obj(isKindOfClass, v14);
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v138 = (void *)objc_opt_class(a1);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v138;
          v116 = v138;
          v117 = "%@ received invalid configuration object for add/update request.";
          goto LABEL_108;
        }
      }

      goto LABEL_44;
    }
    v68 = ne_log_obj(data, v9);
    v10 = objc_claimAutoreleasedReturnValue(v68);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    v69 = (void *)objc_opt_class(a1);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v69;
    v70 = v69;
    v71 = "%@ failed to get input configuration for add/update request.";
    goto LABEL_106;
  }
  string = xpc_dictionary_get_string(v5, "NetworkToRemove");
  if (!string)
  {
    v73 = ne_log_obj(0, v41);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
LABEL_48:

      v34 = 0;
      goto LABEL_74;
    }
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = objc_opt_class(a1);
    v75 = *(id *)&buf[4];
    v76 = "%@ failed to get input data for configuration remove request.";
LABEL_110:
    _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, v76, buf, 0xCu);

    goto LABEL_48;
  }
  v42 = string;
  v43 = sub_100009A6C(0);
  if (!v43)
  {
    v79 = ne_log_obj(0, v44);
    v74 = objc_claimAutoreleasedReturnValue(v79);
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = objc_opt_class(a1);
    v75 = *(id *)&buf[4];
    v76 = "%@ failed to get WiFiManager client.";
    goto LABEL_110;
  }
  v45 = v43;
  length = 0;
  v46 = WiFiManagerClientCopyCurrentSessionBasedNetwork();
  v48 = v46;
  v268 = v46;
  if (!v46)
  {
    v80 = ne_log_obj(0, v47);
    v62 = objc_claimAutoreleasedReturnValue(v80);
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      goto LABEL_54;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = objc_opt_class(a1);
    v64 = *(id *)&buf[4];
    _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%@ The currently associated Wi-Fi network is not a JoinOnce network.", buf, 0xCu);
    goto LABEL_136;
  }
  BundleIdentifier = (const void *)WiFiNetworkGetBundleIdentifier(v46);
  v50 = CFEqual(BundleIdentifier, *(CFTypeRef *)(a1 + 8));
  if ((_DWORD)v50)
  {
    v52 = ne_log_obj(v50, v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = objc_opt_class(a1);
      v162 = *(id *)&buf[4];
      _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "%@ disassociating (JoinOnce)Wi-Fi network.", buf, 0xCu);

    }
    v54 = (const __CFArray *)WiFiManagerClientCopyDevices(v45);
    length = (size_t)v54;
    if (v54 && (v56 = v54, (v54 = (const __CFArray *)CFArrayGetCount(v54)) != 0))
    {
      v57 = CFArrayGetValueAtIndex(v56, 0);
      if (!v57 || (v58 = WiFiDeviceClientDisassociate(v57, 0), !(_DWORD)v58))
      {
        myCFRelease(&length);
        myCFRelease(&v268);
        goto LABEL_133;
      }
      v60 = v58;
      v61 = ne_log_obj(v58, v59);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      v63 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v63;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v60;
      v64 = v63;
      v65 = "%@ WiFiDeviceClientDisassociate failed: %d";
      v66 = v62;
      v67 = 18;
    }
    else
    {
      v81 = ne_log_obj(v54, v55);
      v62 = objc_claimAutoreleasedReturnValue(v81);
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      v163 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v163;
      v64 = v163;
      v65 = "%@ WiFiManagerClientCopyDevices() failed(No Wi-Fi devices found).";
      v66 = v62;
      v67 = 12;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v65, buf, v67);
LABEL_136:

LABEL_54:
    myCFRelease(&length);
    myCFRelease(&v268);
    if (v48)
      goto LABEL_133;
    goto LABEL_59;
  }
  myCFRelease(&length);
  myCFRelease(&v268);
LABEL_59:
  v83 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v42));
  v268 = 0;
  v84 = (const __CFArray *)WiFiManagerClientCopyNetworksWithBundleIdentifier(v45, *(_QWORD *)(a1 + 8));
  length = (size_t)v84;
  if (!v84)
  {
    v102 = ne_log_obj(0, v85);
    v103 = objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
    {
      v167 = (void *)objc_opt_class(a1);
      v168 = *(_QWORD *)(a1 + 8);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v167;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v168;
      v169 = v167;
      _os_log_debug_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEBUG, "%@ %@ does not own any networks", buf, 0x16u);

    }
    goto LABEL_132;
  }
  v86 = v84;
  v87 = CFArrayGetCount(v84);
  if (v87 < 1)
    goto LABEL_131;
  v88 = v87;
  v89 = 0;
  while (1)
  {
    v90 = CFArrayGetValueAtIndex(v86, v89);
    if (v90)
      break;
LABEL_65:
    if (v88 == ++v89)
      goto LABEL_131;
  }
  v91 = v90;
  v92 = sub_100009B2C((uint64_t)v90);
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  v94 = objc_msgSend(v83, "isEqualToString:", v93);
  if (!(_DWORD)v94)
  {

    goto LABEL_65;
  }
  v118 = ne_log_obj(v94, v95);
  v119 = objc_claimAutoreleasedReturnValue(v118);
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
  {
    v247 = (void *)objc_opt_class(a1);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v247;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v83;
    v248 = v247;
    _os_log_debug_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEBUG, "%@ removing configuration for network [%@]", buf, 0x16u);

  }
  WiFiManagerClientRemoveNetwork(v45, v91);
  if (WiFiNetworkIsHotspot(v91))
  {
    v120 = (const __CFArray *)WiFiManagerClientCopyDevices(v45);
    v268 = (uint64_t)v120;
    if (v120 && (v122 = v120, (v120 = (const __CFArray *)CFArrayGetCount(v120)) != 0))
    {
      v123 = CFArrayGetValueAtIndex(v122, 0);
      v124 = WiFiDeviceClientDisassociate(v123, 0);
      if ((_DWORD)v124)
      {
        v126 = v124;
        v127 = ne_log_obj(v124, v125);
        v128 = objc_claimAutoreleasedReturnValue(v127);
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          v129 = (void *)objc_opt_class(a1);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v129;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v126;
          v130 = v129;
          v131 = "%@ WiFiDeviceClientDisassociate failed: %d";
          v132 = v128;
          v133 = 18;
          goto LABEL_185;
        }
        goto LABEL_129;
      }
    }
    else
    {
      v161 = ne_log_obj(v120, v121);
      v128 = objc_claimAutoreleasedReturnValue(v161);
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
      {
        v253 = (void *)objc_opt_class(a1);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v253;
        v130 = v253;
        v131 = "%@ WiFiManagerClientCopyDevices() failed (No Wi-Fi devices found).";
        v132 = v128;
        v133 = 12;
LABEL_185:
        _os_log_error_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_ERROR, v131, buf, v133);

      }
LABEL_129:

    }
  }

LABEL_131:
  myCFRelease(&v268);
  myCFRelease(&length);
LABEL_132:

LABEL_133:
  v34 = 1;
LABEL_74:

LABEL_75:
  return v34;
}

uint64_t sub_100009A6C(int a1)
{
  uint64_t v1;
  CFRunLoopRef Main;
  uint64_t v3;
  CFRunLoopRef v4;

  v1 = qword_100042C10;
  if (a1 || !qword_100042C10)
  {
    if (qword_100042C10)
    {
      WiFiManagerClientRegisterServerRestartCallback(qword_100042C10, 0, 0);
      Main = CFRunLoopGetMain();
      WiFiManagerClientUnscheduleFromRunLoop(v1, Main, kCFRunLoopDefaultMode);
    }
    myCFRelease(&qword_100042C10);
    v3 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
    v1 = v3;
    qword_100042C10 = v3;
    if (v3)
    {
      WiFiManagerClientRegisterServerRestartCallback(v3, sub_100009B88, 0);
      v4 = CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop(v1, v4, kCFRunLoopDefaultMode);
      return qword_100042C10;
    }
  }
  return v1;
}

uint64_t sub_100009B2C(uint64_t a1)
{
  uint64_t result;

  if (!WiFiNetworkIsHotspot())
    return WiFiNetworkGetSSID(a1);
  result = WiFiNetworkGetHS20DomainName(a1);
  if (!result)
    return WiFiNetworkGetProperty(a1, kWiFiDomainName);
  return result;
}

id sub_100009B88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  id result;
  uint8_t v5[16];

  v2 = ne_log_obj(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[NEHelperHotspotConfigurationManager] WiFiManager restarted", v5, 2u);
  }

  sub_100009A6C(1);
  result = objc_msgSend((id)qword_100042C00, "count");
  if (result)
  {
    objc_msgSend((id)qword_100042C00, "enumerateKeysAndObjectsUsingBlock:", &stru_100038DA8);
    return objc_msgSend((id)qword_100042C00, "removeAllObjects");
  }
  return result;
}

void sub_100009C1C(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  const char *v7;
  id Property;
  id v9;
  xpc_object_t v10;
  id v11;

  v5 = a3;
  v11 = a2;
  v6 = a2;
  myCFRelease(&v11);
  if (v5)
    Property = objc_getProperty(v5, v7, 24, 1);
  else
    Property = 0;
  v9 = Property;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "MessageType", 0x3ECuLL);
  sub_1000037E4((uint64_t)NEHelperServer, v9, 107, v10);

}

uint64_t sub_100009CD4(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", *(_QWORD *)(a1 + 8)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appState"));
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationType"));
    v6 = objc_msgSend(v5, "isEqualToString:", LSSystemApplicationType);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationType"));
      objc_msgSend(v7, "isEqualToString:", LSUserApplicationType);

LABEL_7:
      v8 = 0;
      goto LABEL_8;
    }
  }
  else if (!objc_msgSend(*(id *)(a1 + 8), "length")
         || (objc_msgSend(*(id *)(a1 + 8), "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
  {
    goto LABEL_7;
  }
  v8 = 1;
LABEL_8:

  return v8;
}

void sub_100009DB8(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  xpc_object_t v17;
  const char *v18;
  id Property;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SEL v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  id v36;
  int v37;
  void *v38;
  uint8_t buf[8];
  __int128 v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v7 = ne_log_obj(a1, a2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("User has given consent, network added and joined successfully.");
    switch(a3)
    {
      case 0u:
        break;
      case 1u:
        v9 = CFSTR("User did NOT given consent.");
        break;
      case 2u:
        v9 = CFSTR("System has cancelled the popup or it timed out.");
        break;
      case 3u:
        v9 = CFSTR("Request failed, already asking the user for consent.");
        break;
      case 4u:
        v9 = CFSTR("Request failed, invalid bundle ID.");
        break;
      case 5u:
        v9 = CFSTR("Request failed, existing network that cannot be overwritten.");
        break;
      case 6u:
        v9 = CFSTR("Request succeed, already associated to that network.");
        break;
      case 7u:
        v9 = CFSTR("Added to known networks, but association failed.");
        break;
      case 8u:
        v9 = CFSTR("Session based add failed, application is not in foreground.");
        break;
      case 9u:
        v9 = CFSTR("Request failed, network not found.");
        break;
      default:
        if (a3 == 0x7FFFFFFF)
          v9 = CFSTR("Request failed, unknown error.");
        else
          v9 = CFSTR("unknown");
        break;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a3;
    LOWORD(v40) = 2112;
    *(_QWORD *)((char *)&v40 + 2) = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[NEHelperHotspotConfigurationManager] add network callback callled, result: [%d][%@]", buf, 0x12u);
  }

  if (objc_msgSend((id)qword_100042C00, "count"))
  {
    v38 = a4;
    v11 = a4;
    objc_opt_self(NEHelperHotspotConfigurationTask);
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100042C00, "objectForKeyedSubscript:", v11));
      objc_msgSend((id)qword_100042C00, "removeObjectForKey:", v11);
    }
    else
    {
      v12 = 0;
    }

    v14 = myCFRelease(&v38);
    if (!v12)
    {
      v20 = ne_log_obj(v14, v15);
      v16 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[NEHelperHotspotConfigurationManager] failed to find the task object", buf, 2u);
      }
      goto LABEL_33;
    }
    v16 = objc_getProperty((id)v12, v15, 24, 1);
    v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v17, "MessageType", 0x3ECuLL);
    if (a3 == 7)
      goto LABEL_26;
    if (a3)
    {
      sub_1000037E4((uint64_t)NEHelperServer, v16, a3, v17);
    }
    else
    {
      if ((*(_BYTE *)(v12 + 9) & 1) == 0)
      {
LABEL_26:
        sub_1000037E4((uint64_t)NEHelperServer, v16, 0, v17);
        if ((*(_BYTE *)(v12 + 8) & 1) == 0)
        {
          Property = objc_getProperty((id)v12, v18, 32, 1);
          sub_10000A39C((uint64_t)NEHelperHotspotConfigurationTask, Property);
        }
        goto LABEL_32;
      }
      v21 = sub_100009B2C(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v24 = objc_getProperty((id)v12, v23, 32, 1);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10000A26C;
      v33[3] = &unk_100038D68;
      v37 = 0;
      v34 = v16;
      v35 = v17;
      v36 = (id)v12;
      v25 = v22;
      v26 = v24;
      v27 = v33;
      objc_opt_self(NEHelperHotspotConfigurationTask);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&v40 = 3221225472;
      *((_QWORD *)&v40 + 1) = sub_10000A614;
      v41 = &unk_100038CF8;
      v42 = v26;
      v43 = v25;
      v44 = v28;
      v45 = v27;
      v29 = v28;
      v30 = v25;
      v31 = v26;
      v32 = v27;
      objc_msgSend(v29, "loadConfigurationsWithCompletionQueue:handler:", &_dispatch_main_q, buf);

    }
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  v13 = ne_log_obj(0, v10);
  v12 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_INFO, "[NEHelperHotspotConfigurationManager] there are no pending tasks", buf, 2u);
  }
LABEL_34:

}

void sub_10000A26C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int64_t v8;
  const char *v10;
  _BYTE *v11;
  id Property;
  int v13;
  void *v14;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = ne_log_obj(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to update configuration to allow SSID, error %@", (uint8_t *)&v13, 0xCu);
    }

  }
  v8 = *(unsigned int *)(a1 + 56);
  if ((_DWORD)v8 == 7 || (_DWORD)v8 == 0)
  {
    sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, *(void **)(a1 + 40));
    v11 = *(_BYTE **)(a1 + 48);
    if (v11)
    {
      if ((v11[8] & 1) != 0)
        goto LABEL_14;
      Property = objc_getProperty(v11, v10, 32, 1);
    }
    else
    {
      Property = 0;
    }
    sub_10000A39C((uint64_t)NEHelperHotspotConfigurationTask, Property);
    goto LABEL_14;
  }
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), v8, *(void **)(a1 + 40));
LABEL_14:

}

void sub_10000A39C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const __SCPreferences *v5;
  uint64_t v6;
  const __SCPreferences *v7;
  CFPropertyListRef Value;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  int v25;
  const __SCPreferences *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const char *v30;

  v3 = a2;
  v4 = objc_opt_self(a1);
  v5 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("nehelper"), CFSTR("/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist"));
  v26 = v5;
  if (!v5)
  {
    v10 = ne_log_obj(0, v6);
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v28 = (id)objc_opt_class(v4);
    v11 = v28;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ failed to create hotspot configuration preference file.", buf, 0xCu);
LABEL_16:

    goto LABEL_17;
  }
  v7 = v5;
  Value = SCPreferencesGetValue(v5, CFSTR("bundle-ids"));
  v9 = objc_claimAutoreleasedReturnValue(Value);
  if (!isa_nsarray())
  {
    v12 = objc_alloc_init((Class)NSMutableArray);
    goto LABEL_9;
  }
  if (!-[NSObject containsObject:](v9, "containsObject:", v3))
  {
    v12 = -[NSObject mutableCopy](v9, "mutableCopy");
LABEL_9:
    v11 = v12;
    objc_msgSend(v12, "addObject:", v3);
    v13 = SCPreferencesSetValue(v7, CFSTR("bundle-ids"), v11);
    if ((_DWORD)v13)
    {
      v15 = SCPreferencesCommitChanges(v7);
      if ((_DWORD)v15)
      {
LABEL_15:
        myCFRelease(&v26);
        goto LABEL_16;
      }
      v17 = ne_log_obj(v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_opt_class(v4);
        v20 = v19;
        v21 = SCError();
        *(_DWORD *)buf = 138412546;
        v28 = v19;
        v29 = 2080;
        v30 = SCErrorString(v21);
        v22 = "%@ SCPreferencesCommitChanges failed: %s";
LABEL_19:
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);

      }
    }
    else
    {
      v23 = ne_log_obj(v13, v14);
      v18 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_opt_class(v4);
        v20 = v24;
        v25 = SCError();
        *(_DWORD *)buf = 138412546;
        v28 = v24;
        v29 = 2080;
        v30 = SCErrorString(v25);
        v22 = "%@ SCPreferencesSetValue failed: %s";
        goto LABEL_19;
      }
    }

    goto LABEL_15;
  }
  myCFRelease(&v26);
LABEL_17:

}

void sub_10000A614(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager networkPrivacyConfigurationName](NEConfigurationManager, "networkPrivacyConfigurationName"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
          {
            v17 = v14;

            v11 = v17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathController"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathRules"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v20)
    {
      v21 = v20;
      v28 = v18;
      v30 = 0;
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "matchSigningIdentifier"));
          if (objc_msgSend(v25, "isEqualToString:", *(_QWORD *)(a1 + 32)))
          {
            v26 = objc_msgSend(v24, "multicastPreferenceSet");

            if ((v26 & 1) == 0)
            {
              objc_msgSend(v24, "setDenyMulticast:", 0);
              objc_msgSend(v24, "setTemporaryAllowMulticastNetworkName:", *(_QWORD *)(a1 + 40));
              v30 = 1;
            }
          }
          else
          {

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v21);

      v18 = v28;
      if ((v30 & 1) != 0)
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10000A924;
        v31[3] = &unk_100039160;
        v27 = *(void **)(a1 + 48);
        v32 = *(id *)(a1 + 56);
        objc_msgSend(v27, "saveConfiguration:withCompletionQueue:handler:", v11, &_dispatch_main_q, v31);

LABEL_29:
        v6 = 0;

        v5 = v29;
        goto LABEL_30;
      }
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_29;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_30:

}

void sub_10000A924(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to save configuration with allowed SSID: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Saved configuration with allowed SSID", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000AA28(id a1)
{
  id v1;
  void *v2;

  objc_storeStrong((id *)&qword_100042BF8, &_dispatch_main_q);
  v1 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = (void *)qword_100042C00;
  qword_100042C00 = (uint64_t)v1;

}

void sub_10000AA64(uint64_t a1)
{
  uint64_t v2;
  const __SCPreferences *v3;
  uint64_t v4;
  CFPropertyListRef Value;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  const __SCPreferences *v13;
  uint64_t v14;
  const __SCPreferences *v15;
  CFPropertyListRef v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  int v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  const char *v46;
  id v47;
  void *v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  const char *v55;

  v2 = objc_opt_self(NEHelperHotspotConfigurationTask);
  v3 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("nehelper"), CFSTR("/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist"));
  v51 = (uint64_t)v3;
  if (v3)
  {
    Value = SCPreferencesGetValue(v3, CFSTR("bundle-ids"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
    if (isa_nsarray(v6))
      v7 = objc_msgSend(v6, "copy");
    else
      v7 = 0;
    myCFRelease(&v51);
    v10 = v7;

    if (!v10 || !objc_msgSend(v10, "containsObject:", *(_QWORD *)(a1 + 32)))
      goto LABEL_31;
    v11 = *(id *)(a1 + 32);
    v12 = objc_opt_self(NEHelperHotspotConfigurationTask);
    v13 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("nehelper"), CFSTR("/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist"));
    v51 = (uint64_t)v13;
    if (!v13)
    {
      v30 = ne_log_obj(0, v14);
      v17 = objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v31 = (void *)objc_opt_class(v12);
      *(_DWORD *)buf = 138412290;
      v53 = v31;
      v18 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ failed to create hotspot configuration preference file.", buf, 0xCu);
LABEL_23:

LABEL_24:
      v34 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
      v51 = v34;
      if (v34)
      {
        v36 = WiFiManagerClientRemoveNetworksWithBundleIdentifier(v34, *(_QWORD *)(a1 + 32));
        v38 = ne_log_obj(v36, v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v40 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
          v41 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v53 = v40;
          v54 = 2112;
          v55 = v41;
          v42 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%@ removed all networks matching the bundle identifier [%@]", buf, 0x16u);

        }
        myCFRelease(&v51);
      }
      else
      {
        v43 = ne_log_obj(0, v35);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
          v46 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v53 = v45;
          v54 = 2112;
          v55 = v46;
          v47 = v45;
          _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@ failed to get WiFiManager client, unable to remove networks matching bundle identifier [%@]", buf, 0x16u);

        }
      }
      goto LABEL_31;
    }
    v15 = v13;
    v16 = SCPreferencesGetValue(v13, CFSTR("bundle-ids"));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!isa_nsarray(v17) || !-[NSObject containsObject:](v17, "containsObject:", v11))
    {
      myCFRelease(&v51);
      goto LABEL_24;
    }
    v18 = -[NSObject mutableCopy](v17, "mutableCopy");
    objc_msgSend(v18, "removeObject:", v11);
    v19 = SCPreferencesSetValue(v15, CFSTR("bundle-ids"), v18);
    if ((_DWORD)v19)
    {
      v21 = SCPreferencesCommitChanges(v15);
      if ((_DWORD)v21)
      {
LABEL_22:
        myCFRelease(&v51);
        goto LABEL_23;
      }
      v23 = ne_log_obj(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_opt_class(v12);
        v26 = v25;
        v27 = SCError();
        v28 = SCErrorString(v27);
        *(_DWORD *)buf = 138412546;
        v53 = v25;
        v54 = 2080;
        v55 = v28;
        v29 = "%@ SCPreferencesCommitChanges failed: %s";
LABEL_33:
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);

      }
    }
    else
    {
      v33 = ne_log_obj(v19, v20);
      v24 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v48 = (void *)objc_opt_class(v12);
        v26 = v48;
        v49 = SCError();
        v50 = SCErrorString(v49);
        *(_DWORD *)buf = 138412546;
        v53 = v48;
        v54 = 2080;
        v55 = v50;
        v29 = "%@ SCPreferencesSetValue failed: %s";
        goto LABEL_33;
      }
    }

    goto LABEL_22;
  }
  v8 = ne_log_obj(0, v4);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v53 = (id)objc_opt_class(v2);
    v32 = v53;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ failed to create hotspot configuration preference file.", buf, 0xCu);

  }
  v10 = 0;
LABEL_31:

}

uint64_t sub_10000B280(const char *a1, int32_t a2, char *a3, int32_t a4)
{
  UIDNA *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  UIDNAInfo v15;
  UErrorCode pErrorCode;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unsigned __int32 errors;

  pErrorCode = U_ZERO_ERROR;
  v15 = (UIDNAInfo)xmmword_10002A740;
  v8 = uidna_openUTS46(0x22u, &pErrorCode);
  v9 = uidna_nameToASCII_UTF8(v8, a1, a2, a3, a4, &v15, &pErrorCode);
  uidna_close(v8);
  if (pErrorCode)
  {
    v12 = ne_log_obj(v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = a1;
      v19 = 1024;
      errors = pErrorCode;
      v13 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed errorCode %d";
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
      return 0;
    }
    return 0;
  }
  if (v15.errors)
  {
    v12 = ne_log_obj(v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = a1;
      v19 = 1024;
      errors = v15.errors;
      v13 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed info.errors 0x%08X";
      goto LABEL_9;
    }
    return 0;
  }
  return v9;
}

void sub_10000C2D8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *Property;
  void *SSIDData;
  void *SSID;
  int v9;
  CFNumberRef v10;
  CFIndex v11;
  uint64_t v12;
  uint64_t v13;
  CFDictionaryRef v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  CFNumberRef v21;
  void *values[3];
  CFNumberRef v23;
  _BYTE valuePtr[24];
  const __CFString *v25;

  if (a1 && a2)
  {
    v3 = a2;
    v4 = *(_QWORD *)(a1 + 16);
    if (!v4)
    {
      sub_10000CAB0(a1, v3, 0);
LABEL_26:

      myCFRelease(a1 + 16);
      v20 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      return;
    }
    v5 = *(unsigned __int8 *)(a1 + 24);
    v21 = 0;
    Property = (void *)WiFiNetworkGetProperty(v4, CFSTR("BSSID"));
    SSIDData = (void *)WiFiNetworkGetSSIDData(v4);
    SSID = (void *)WiFiNetworkGetSSID(v4);
    if (v5)
    {
      if (WiFiNetworkIsEAP(v4))
      {
        v9 = 3;
      }
      else if (WiFiNetworkIsWPAWPA2PSK(v4) || WiFiNetworkIsSAE(v4))
      {
        v9 = 2;
      }
      else if (WiFiNetworkIsWEP(v4))
      {
        v9 = 1;
      }
      else
      {
        v9 = 4 * (WiFiNetworkIsOpen(v4) == 0);
      }
      *(_DWORD *)valuePtr = v9;
      v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, valuePtr);
      v21 = v10;
      if (!Property)
        goto LABEL_19;
    }
    else
    {
      v10 = 0;
      if (!Property)
        goto LABEL_19;
    }
    if (SSIDData && SSID)
    {
      *(_QWORD *)valuePtr = kCNNetworkInfoKeySSIDData;
      *(_QWORD *)&valuePtr[8] = kCNNetworkInfoKeySSID;
      *(_QWORD *)&valuePtr[16] = kCNNetworkInfoKeyBSSID;
      v25 = 0;
      values[0] = SSIDData;
      values[1] = SSID;
      values[2] = Property;
      v23 = 0;
      if (v10)
      {
        v25 = CFSTR("wifi-security-type");
        v23 = v10;
        v11 = 4;
      }
      else
      {
        v11 = 3;
      }
      v14 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)valuePtr, (const void **)values, v11, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v12 = myCFRelease(&v21);
      values[0] = v14;
      if (v14)
      {
        v14 = (CFDictionaryRef)_CFXPCCreateXPCObjectFromCFObject(v14);
        v12 = myCFRelease(values);
      }
      goto LABEL_23;
    }
LABEL_19:
    v12 = myCFRelease(&v21);
    v14 = 0;
    values[0] = 0;
LABEL_23:
    v15 = ne_log_obj(v12, v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_opt_class(a1);
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)valuePtr = 138412546;
      *(_QWORD *)&valuePtr[4] = v17;
      *(_WORD *)&valuePtr[12] = 2112;
      *(_QWORD *)&valuePtr[14] = v18;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ sending actual Wi-Fi info to [%@]", valuePtr, 0x16u);

    }
    sub_1000037E4((uint64_t)NEHelperServer, v3, 0, v14);

    goto LABEL_26;
  }
}

void sub_10000C5D0(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  id v8;
  id Property;
  const char *v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  id v21;
  id v22;
  const char *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const __CFString *v34;
  CFDataRef ExternalRepresentation;
  CFDataRef v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *values[3];
  _BYTE buf[24];

  v2 = a2;
  v4 = ne_log_obj(a1, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      v8 = (id)objc_opt_class(*(_QWORD *)(a1 + 32));
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v7, 32, 1);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = Property;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ [%@] has an active VPN or DNS configuration", buf, 0x16u);

    }
    sub_10000C2D8(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    if (v6)
    {
      v11 = (id)objc_opt_class(*(_QWORD *)(a1 + 32));
      v12 = *(id *)(a1 + 32);
      if (v12)
        v12 = objc_getProperty(v12, v10, 32, 1);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ [%@] has no active VPN or DNS configuration", buf, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v14 = objc_msgSend(v13, "isVersion:greaterThanOrEqualToVersion:", *(_QWORD *)(a1 + 48), CFSTR("13.0"));

    v17 = ne_log_obj(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v19)
      {
        v21 = (id)objc_opt_class(*(_QWORD *)(a1 + 32));
        v22 = *(id *)(a1 + 32);
        if (v22)
          v22 = objc_getProperty(v22, v20, 32, 1);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ [%@] is linked on or above iOS 13.0, retuning nil", buf, 0x16u);

      }
      sub_10000CAB0(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 1);
    }
    else
    {
      if (v19)
      {
        v24 = (id)objc_opt_class(*(_QWORD *)(a1 + 32));
        v25 = *(id *)(a1 + 32);
        if (v25)
          v25 = objc_getProperty(v25, v23, 32, 1);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v25;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ returning pseudo Wi-Fi information to [%@]", buf, 0x16u);

      }
      v26 = *(_QWORD *)(a1 + 32);
      v27 = (uint64_t)*(id *)(a1 + 40);
      v29 = (void *)v27;
      if (v26)
      {
        if (!qword_100042C20)
        {
          if ((byte_100042C18 & 1) == 0)
          {
            byte_100042C18 = 1;
            v30 = &_CPGetDeviceRegionCode;
            if (&_CPGetDeviceRegionCode)
            {
              v27 = CPGetDeviceRegionCode();
              v31 = v27;
              if (v27)
              {
                v27 = CFEqual((CFTypeRef)v27, CFSTR("CH"));
                LOBYTE(v30) = (_DWORD)v27 != 0;
              }
              else
              {
                LOBYTE(v30) = 0;
              }
            }
            else
            {
              v31 = 0;
            }
            byte_100042C19 = (char)v30;
            v32 = ne_log_obj(v27, v28);
            v33 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v31;
              _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "region code is %@", buf, 0xCu);
            }

          }
          if (byte_100042C19)
            v34 = CFSTR("WLAN");
          else
            v34 = CFSTR("Wi-Fi");
          ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, v34, 0x8000100u, 0);
          if (ExternalRepresentation)
          {
            v36 = ExternalRepresentation;
            *(_QWORD *)buf = kCNNetworkInfoKeySSIDData;
            *(_QWORD *)&buf[8] = kCNNetworkInfoKeySSID;
            *(_QWORD *)&buf[16] = kCNNetworkInfoKeyBSSID;
            values[0] = ExternalRepresentation;
            values[1] = (void *)v34;
            values[2] = CFSTR("00:00:00:00:00:00");
            qword_100042C20 = (uint64_t)CFDictionaryCreate(kCFAllocatorDefault, (const void **)buf, (const void **)values, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            CFRelease(v36);
          }
        }
        v37 = (void *)_CFXPCCreateXPCObjectFromCFObject(qword_100042C20);
        v39 = ne_log_obj(v37, v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = (void *)objc_opt_class(v26);
          v42 = *(_QWORD *)(v26 + 32);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v42;
          v43 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%@ sending pseudo Wi-Fi info to [%@]", buf, 0x16u);

        }
        sub_1000037E4((uint64_t)NEHelperServer, v29, 0, v37);
        myCFRelease(v26 + 16);
        v44 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = 0;

      }
    }
  }
}

void sub_10000CAB0(uint64_t a1, void *a2, int64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  uint64_t v19;

  v5 = a2;
  v7 = v5;
  if (a1)
  {
    if (v5)
    {
      v8 = ne_log_obj(v5, v6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (void *)objc_opt_class(a1);
        v11 = *(_QWORD *)(a1 + 32);
        v14 = 138412802;
        v15 = v10;
        v16 = 2048;
        v17 = a3;
        v18 = 2112;
        v19 = v11;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ sending result code %lld to [%@]", (uint8_t *)&v14, 0x20u);

      }
      sub_1000037E4((uint64_t)NEHelperServer, v7, a3, 0);
    }
    myCFRelease(a1 + 16);
    v13 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

  }
}

void sub_10000CBD4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v6;
  void *v7;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  id Property;
  unsigned int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v10 = a2;
  v27 = a3;
  v26 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v12)
    goto LABEL_29;
  v13 = v12;
  v14 = *(_QWORD *)v31;
  v28 = v11;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v31 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "VPN", v26, v27));
      if (v17
        && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "VPN")),
            (objc_msgSend(v5, "isEnabled") & 1) != 0))
      {
        v18 = 0;
      }
      else
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dnsSettings"));
        if (!v19)
        {
          if (v17)

          v7 = 0;
          goto LABEL_25;
        }
        v7 = (void *)v19;
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dnsSettings"));
        if (!objc_msgSend(v6, "isEnabled"))
        {
          v24 = 0;
          goto LABEL_23;
        }
        v18 = 1;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "applicationIdentifier"));
      v22 = *(void **)(a1 + 32);
      if (v22)
        Property = objc_getProperty(v22, v20, 32, 1);
      else
        Property = 0;
      v24 = objc_msgSend(v21, "isEqual:", Property);

      if (!v18)
      {
        v11 = v28;
        if (!v17)
          goto LABEL_17;
        goto LABEL_24;
      }
      v11 = v28;
LABEL_23:

      if (!v17)
      {
LABEL_17:

        if (v24)
          goto LABEL_30;
        goto LABEL_25;
      }
LABEL_24:

      if ((v24 & 1) != 0)
      {
LABEL_30:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        goto LABEL_31;
      }
LABEL_25:
      v15 = (char *)v15 + 1;
    }
    while (v13 != v15);
    v25 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v13 = v25;
  }
  while (v25);
LABEL_29:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_31:

}

void sub_10000CE2C(id a1)
{
  byte_100042C30 = os_variant_has_internal_diagnostics("com.apple.captive");
}

void sub_10000CE50(uint64_t a1, const char *a2)
{
  id Property;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t Device;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFArray *v19;
  const __CFArray *v20;
  const void *ValueAtIndex;
  uint64_t v22;
  const char *v23;
  uint8_t *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int16 v31;
  uint8_t buf[24];

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 40, 1);
  v4 = Property;
  v5 = sub_10000D0A4(0);
  if (!v5)
  {
    v13 = ne_log_obj(0, v6);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "[NEHelperWiFiInfoManager] Failed to get WiFi Manager Client instance";
      v24 = buf;
      goto LABEL_26;
    }
    goto LABEL_9;
  }
  v7 = v5;
  v8 = WiFiManagerClientCopyCurrentSessionBasedNetwork();
  if (!v8)
  {
    if (v4)
    {
      Device = WiFiManagerClientGetDevice(v7, v4);
      if (Device)
      {
        v10 = WiFiDeviceClientCopyCurrentNetwork(Device);
        goto LABEL_10;
      }
      v22 = ne_log_obj(0, v16);
      v14 = objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      v23 = "[NEHelperWiFiInfoManager] WiFiManagerClientGetDevice for %@ returned NULL";
      v24 = buf;
      v25 = v14;
      v26 = 12;
      goto LABEL_27;
    }
    v17 = sub_10000D0A4(0);
    if (v17)
    {
      v19 = (const __CFArray *)WiFiManagerClientCopyDevices(v17);
      *(_QWORD *)buf = v19;
      if (v19)
      {
        v20 = v19;
        if (CFArrayGetCount(v19))
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v20, 0);
          v10 = WiFiDeviceClientCopyCurrentNetwork(ValueAtIndex);
          CFRelease(v20);
          goto LABEL_10;
        }
      }
      v27 = myCFRelease(buf);
      v29 = ne_log_obj(v27, v28);
      v14 = objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v31 = 0;
      v23 = "[NEHelperWiFiInfoManager] WiFiManagerClientCopyDevices() returned no devices";
      goto LABEL_24;
    }
    v30 = ne_log_obj(0, v18);
    v14 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v31 = 0;
      v23 = "[NEHelperWiFiInfoManager] Failed to get WiFi Manager Client instance";
LABEL_24:
      v24 = (uint8_t *)&v31;
LABEL_26:
      v25 = v14;
      v26 = 2;
LABEL_27:
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v23, v24, v26);
    }
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }
  v10 = v8;
  v11 = ne_log_obj(v8, v9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[NEHelperWiFiInfoManager] currently associated to a session based Wi-Fi network", buf, 2u);
  }

LABEL_10:
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v10;

}

uint64_t sub_10000D0A4(int a1)
{
  uint64_t v1;
  CFRunLoopRef Main;
  uint64_t v3;
  CFRunLoopRef v4;

  v1 = qword_100042C28;
  if (a1 || !qword_100042C28)
  {
    if (qword_100042C28)
    {
      WiFiManagerClientRegisterServerRestartCallback(qword_100042C28, 0, 0);
      Main = CFRunLoopGetMain();
      WiFiManagerClientUnscheduleFromRunLoop(v1, Main, kCFRunLoopDefaultMode);
    }
    myCFRelease(&qword_100042C28);
    v3 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
    v1 = v3;
    qword_100042C28 = v3;
    if (v3)
    {
      WiFiManagerClientRegisterServerRestartCallback(v3, sub_10000D164, 0);
      v4 = CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop(v1, v4, kCFRunLoopDefaultMode);
      return qword_100042C28;
    }
  }
  return v1;
}

uint64_t sub_10000D164(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = ne_log_obj(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[NEHelperWiFiInfoManager] WiFiManager restarted", v5, 2u);
  }

  return sub_10000D0A4(1);
}

void sub_10000D264(uint64_t a1)
{

}

void sub_10000D26C(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  _xpc_connection_s *Property;
  xpc_type_t type;
  os_unfair_lock_s *v7;
  id v8;
  SEL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  objc_class *v26;
  NSString *v27;
  const char *v28;
  void *v29;
  id v30;
  uint64_t v31;
  int v32;
  objc_class *v33;
  NSString *v34;
  const char *v35;
  void *v36;
  id v37;
  pid_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  pid_t pid;

  v4 = a2;
  Property = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!Property)
    goto LABEL_18;
  if (!v4)
    goto LABEL_5;
  type = xpc_get_type(v4);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    Property = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!Property)
    {
LABEL_6:
      xpc_connection_cancel(Property);
      v7 = *(os_unfair_lock_s **)(a1 + 32);
      if (v7)
      {
        v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        os_unfair_lock_lock(v7 + 2);
        objc_msgSend(objc_getProperty(v7, v9, 40, 1), "removeObject:", v8);

        os_unfair_lock_unlock(v7 + 2);
      }
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;

      goto LABEL_18;
    }
LABEL_5:
    Property = (_xpc_connection_s *)objc_getProperty(Property, v3, 24, 1);
    goto LABEL_6;
  }
  v12 = ne_log_obj(type, v3);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v24)
      v25 = *(_DWORD *)(v24 + 8);
    else
      v25 = 0;
    v26 = (objc_class *)sub_1000036C4((uint64_t)NEHelperServer, v25);
    v27 = NSStringFromClass(v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v30 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v30)
      v30 = objc_getProperty(v30, v28, 24, 1);
    *(_DWORD *)buf = 138412546;
    v43 = v29;
    v44 = 1024;
    pid = xpc_connection_get_pid((xpc_connection_t)v30);
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Start processing new message with class %@ from client pid %d", buf, 0x12u);

  }
  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v15 && (v16 = objc_getProperty(v15, v14, 32, 1)) != 0)
  {
    v17 = v16;
    if ((objc_opt_respondsToSelector(v16, "handlerQueue") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "handlerQueue"));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10000DCB8;
      v39[3] = &unk_100039750;
      v17 = v17;
      v40 = v17;
      v41 = v4;
      xpc_dictionary_handoff_reply(v41, v18, v39, v19);

    }
    else
    {
      v20 = objc_msgSend(v17, "handleMessage:", v4);
    }
  }
  else
  {
    sub_1000037E4((uint64_t)NEHelperServer, v4, 32, 0);
    v17 = 0;
  }
  v22 = ne_log_obj(v20, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v31)
      v32 = *(_DWORD *)(v31 + 8);
    else
      v32 = 0;
    v33 = (objc_class *)sub_1000036C4((uint64_t)NEHelperServer, v32);
    v34 = NSStringFromClass(v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v37 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v37)
      v37 = objc_getProperty(v37, v35, 24, 1);
    v38 = xpc_connection_get_pid((xpc_connection_t)v37);
    *(_DWORD *)buf = 138412546;
    v43 = v36;
    v44 = 1024;
    pid = v38;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "End processing new message with class %@ from client pid %d", buf, 0x12u);

  }
LABEL_18:

}

id sub_10000D5D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleMessage:", *(_QWORD *)(a1 + 40));
}

void sub_10000D5E4()
{
  const __SCPreferences *v0;
  const __SCPreferences *v1;
  CFPropertyListRef Value;
  CFTypeID TypeID;
  BOOL v4;
  CFPropertyListRef v5;
  CFTypeID v6;
  BOOL v7;
  CFPropertyListRef v8;
  CFTypeID v9;
  _QWORD v10[4];
  int v11;
  BOOL v12;
  BOOL v13;
  char v14;
  int valuePtr;

  valuePtr = 0;
  v0 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("NEHelper control settings"), CFSTR("/Library/Preferences/com.apple.networkextension.control.plist"));
  if (v0)
  {
    v1 = v0;
    Value = SCPreferencesGetValue(v0, CFSTR("DisableRestrictions"));
    TypeID = CFBooleanGetTypeID();
    v4 = Value && CFGetTypeID(Value) == TypeID && CFBooleanGetValue((CFBooleanRef)Value) != 0;
    v5 = SCPreferencesGetValue(v1, CFSTR("DisableNexus"));
    v6 = CFBooleanGetTypeID();
    v7 = v5 && CFGetTypeID(v5) == v6 && CFBooleanGetValue((CFBooleanRef)v5) != 0;
    v8 = SCPreferencesGetValue(v1, CFSTR("FallbackDefault"));
    v9 = CFNumberGetTypeID();
    if (v8)
      LOBYTE(v8) = CFGetTypeID(v8) == v9 && CFNumberGetValue((CFNumberRef)v8, kCFNumberIntType, &valuePtr) != 0;
    CFRelease(v1);
  }
  else
  {
    v4 = 0;
    v7 = 0;
    LOBYTE(v8) = 0;
  }
  if (qword_100042C60 != -1)
    dispatch_once(&qword_100042C60, &stru_100039020);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000DB54;
  v10[3] = &unk_100038EE0;
  v12 = v4;
  v13 = v7;
  v14 = (char)v8;
  v11 = valuePtr;
  dispatch_async((dispatch_queue_t)qword_100042C58, v10);
}

void sub_10000D7AC(uint64_t a1)
{
  const __SCPreferences *v2;
  const __SCPreferences *v3;
  const __SCPreferences *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString **v9;
  const __CFString *v10;
  void *Value;
  id v12;
  CFPropertyListRef v13;
  void *v14;
  __CFString **v15;
  uint64_t v16;
  id v17;
  __CFError *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  CFErrorRef Error;
  int v33;
  const char *v34;
  CFErrorRef v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  CFErrorRef v39;

  v2 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("NEHelper managed preferences"), CFSTR("/Library/Managed Preferences/mobile/com.apple.networkextension.control.plist"));
  v3 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("NEHelper control settings"), CFSTR("/Library/Preferences/com.apple.networkextension.control.plist"));
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = SCPreferencesLock(v3, 1u);
    if (!(_DWORD)v6)
    {
      v30 = ne_log_obj(v6, v7);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        Error = SCCopyLastError();
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Preferences/com.apple.networkextension.control.plist";
        v38 = 2112;
        v39 = Error;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[Managed] Failed to lock SCPreferences for %s: %@", buf, 0x16u);

      }
      goto LABEL_34;
    }
    v8 = 0;
    v9 = off_100038EC8;
    do
    {
      v10 = v9[v8];
      Value = (void *)SCPreferencesGetValue(v2, v10);
      if (CFStringCompare(v10, CFSTR("CriticalDomains"), 0))
      {
        if (Value)
        {
          SCPreferencesSetValue(v4, v10, Value);
        }
        else if ((a1 & 1) == 0)
        {
          SCPreferencesRemoveValue(v4, v10);
        }
      }
      else
      {
        v12 = Value;
        v13 = SCPreferencesGetValue(v4, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (isa_nsarray(v12) && objc_msgSend(v12, "count"))
        {
          v15 = v9;
          v16 = a1;
          v17 = sub_100010548((uint64_t)NEHelperSettingsManager, v14, v12);
          v18 = (__CFError *)objc_claimAutoreleasedReturnValue(v17);
          v20 = ne_log_obj(v18, v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v37 = (const char *)v10;
            v38 = 2112;
            v39 = v18;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[Managed] setting %@ to %@", buf, 0x16u);
          }

          SCPreferencesSetValue(v4, v10, v18);
          a1 = v16;
          v9 = v15;
        }

      }
      ++v8;
    }
    while (v8 != 3);
    v22 = SCPreferencesCommitChanges(v4);
    if (!(_DWORD)v22)
    {
      v24 = ne_log_obj(v22, v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v33 = SCError();
        v34 = SCErrorString(v33);
        *(_DWORD *)buf = 136315138;
        v37 = v34;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[Managed] Failed to save the control settings: %s", buf, 0xCu);
      }

    }
    v26 = SCPreferencesUnlock(v4);
    if (!(_DWORD)v26)
    {
      v28 = ne_log_obj(v26, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v35 = SCCopyLastError();
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Preferences/com.apple.networkextension.control.plist";
        v38 = 2112;
        v39 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[Managed] Failed to unlock preferences for %s: %@", buf, 0x16u);

      }
    }
  }
  if (!v2)
  {
    if (!v4)
      return;
    goto LABEL_29;
  }
LABEL_34:
  CFRelease(v2);
  if (!v4)
    return;
LABEL_29:
  CFRelease(v4);
}

uint64_t sub_10000DB54(uint64_t a1)
{
  uint64_t result;

  sub_10000DBB0("com.apple.networkextension.disable-restrictions", *(unsigned __int8 *)(a1 + 36));
  result = sub_10000DBB0("com.apple.networkextension.disable-nexus", *(unsigned __int8 *)(a1 + 37));
  if (*(_BYTE *)(a1 + 38))
    return sub_10000DBB0("com.apple.networkextension.fallback-default", *(int *)(a1 + 32));
  return result;
}

uint64_t sub_10000DBB0(const char *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  int out_token;

  if (qword_100042C60 != -1)
    dispatch_once(&qword_100042C60, &stru_100039020);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100042C58);
  out_token = -1;
  result = notify_register_check(a1, &out_token);
  if (!(_DWORD)result)
  {
    v5 = 0;
    if (notify_get_state(out_token, &v5) || v5 != a2)
    {
      v5 = a2;
      if (!notify_set_state(out_token, a2))
        notify_post(a1);
    }
    return notify_cancel(out_token);
  }
  return result;
}

void sub_10000DC68(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("NEHelperServerNotificationQueue", v4);
  v3 = (void *)qword_100042C58;
  qword_100042C58 = (uint64_t)v2;

}

id sub_10000DCB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleMessage:", *(_QWORD *)(a1 + 40));
}

void sub_10000DCC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  _OWORD *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  _OWORD buffer[16];

  memset(buffer, 0, sizeof(buffer));
  v2 = proc_name(*(_DWORD *)(a1 + 32), buffer, 0x100u);
  if ((int)v2 >= 1)
  {
    v4 = ne_log_obj(v2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(a1 + 32);
      v7 = (objc_class *)sub_1000036C4((uint64_t)NEHelperServer, *(_DWORD *)(a1 + 36));
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = 136315650;
      v11 = buffer;
      v12 = 1024;
      v13 = v6;
      v14 = 2112;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Launched by %s (pid %d) using class %@", (uint8_t *)&v10, 0x1Cu);

    }
  }
}

id sub_10000DDE4(uint64_t a1)
{
  objc_opt_self(a1);
  if (qword_100042C48 != -1)
    dispatch_once(&qword_100042C48, &stru_100038E30);
  return (id)qword_100042C40;
}

void sub_10000DE28(id a1)
{
  NEHelperServer *v1;
  id v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  xpc_connection_t mach_service;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  void *v14;
  _QWORD handler[4];
  id v16;
  objc_super v17;

  NEInitCFTypes(a1);
  v1 = [NEHelperServer alloc];
  if (v1)
  {
    v17.receiver = v1;
    v17.super_class = (Class)NEHelperServer;
    v2 = objc_msgSendSuper2(&v17, "init");
    if (v2)
    {
      v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4 = objc_claimAutoreleasedReturnValue(v3);
      v5 = dispatch_queue_create("NEHelperServer queue", v4);
      v6 = (void *)*((_QWORD *)v2 + 3);
      *((_QWORD *)v2 + 3) = v5;

      mach_service = xpc_connection_create_mach_service("com.apple.nehelper", 0, 1uLL);
      v8 = (void *)*((_QWORD *)v2 + 4);
      *((_QWORD *)v2 + 4) = mach_service;

      v9 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
      v10 = (void *)*((_QWORD *)v2 + 5);
      *((_QWORD *)v2 + 5) = v9;

      *((_DWORD *)v2 + 2) = 0;
      v11 = (void *)*((_QWORD *)v2 + 4);
      if (!v11 || xpc_get_type(v11) != (xpc_type_t)&_xpc_type_connection)
        goto LABEL_5;
      xpc_connection_set_target_queue(*((xpc_connection_t *)v2 + 4), *((dispatch_queue_t *)v2 + 3));
      v13 = (_xpc_connection_s *)*((_QWORD *)v2 + 4);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100003894;
      handler[3] = &unk_1000394A8;
      v16 = v2;
      xpc_connection_set_event_handler(v13, handler);

    }
    v2 = v2;
    v12 = (uint64_t)v2;
    goto LABEL_8;
  }
  v2 = 0;
LABEL_5:
  v12 = 0;
LABEL_8:

  v14 = (void *)qword_100042C40;
  qword_100042C40 = v12;

}

void sub_10000DF94(uint64_t a1, void *a2)
{
  sub_10000E350(*(void **)(a1 + 32), a2, "com.apple.fsevents.matching");
}

void sub_10000DFA4(uint64_t a1, void *a2)
{
  sub_10000E350(*(void **)(a1 + 32), a2, "com.apple.distnoted.matching");
}

void sub_10000DFB4(uint64_t a1)
{
  sub_10000E228(*(_QWORD *)(a1 + 32));
}

void sub_10000DFBC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v8 = ne_log_obj(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received effective settings change for event: %{public}@, groups: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (objc_msgSend(v6, "containsObject:", MOEffectiveSettingsGroupAllowedClient))
    sub_10000E228(*(_QWORD *)(a1 + 32));

}

void sub_10000E0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id v6;
  NSObject *Property;
  uint64_t v8;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = ne_log_obj(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Querying LaunchServices", buf, 2u);
  }

  v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilesafari"), 0, 0);
  Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, v5, 24, 1);
    v8 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v8 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E194;
  block[3] = &unk_1000397A0;
  block[4] = v8;
  dispatch_async(Property, block);

}

void sub_10000E194(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint8_t v9[16];

  v3 = ne_log_obj(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LaunchServices is available", v9, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    *(_BYTE *)(v5 + 12) = 1;
  v6 = sub_100020DBC((uint64_t)NEHelperCacheManager);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100025568(v7, v8);

}

void sub_10000E228(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  if (a1)
  {
    v1 = (void *)objc_opt_new(MOEffectiveSettings);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "allowedClient"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allowedClient"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));

    v7 = ne_log_obj(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
      v11 = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "The current Managed Settings allowed client is now %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    sub_100020368((uint64_t)NEHelperConfigurationManager, v10);

  }
}

void sub_10000E350(void *a1, void *a2, const char *a3)
{
  id v5;
  void *v6;
  const char *string;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  unsigned int v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  SEL v30;
  id v31;
  id v32;
  void *v33;
  const char *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  const char *v39;
  id v40;
  void *v41;
  NSObject *Property;
  id v43;
  id v44;
  _QWORD *v45;
  id v46;
  void *v47;
  _QWORD *v48;
  unsigned __int8 v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[5];
  _QWORD block[6];
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[4];
  NSObject *v64;
  _QWORD v65[4];
  NSObject *v66;
  stat buf;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = xpc_dictionary_get_string(v6, _xpc_event_key_name);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000EB04;
      block[3] = &unk_100038FB8;
      block[4] = a3;
      block[5] = string;
      if (qword_100042C50 != -1)
        dispatch_once(&qword_100042C50, block);
      if (!strcmp(a3, "com.apple.fsevents.matching"))
      {
        if (!strcmp(string, "ConfigFileChanged"))
        {
          memset(&buf, 0, sizeof(buf));
          if (stat("/Library/Preferences/com.apple.networkextension.plist", &buf) && *__error() == 2)
          {
            v57 = 0;
            v58 = &v57;
            v59 = 0x3032000000;
            v60 = sub_100004620;
            v61 = sub_10000D264;
            v62 = (id)os_transaction_create("com.apple.nehelper.handleConfigFileRemoved");
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
            v31 = objc_getProperty(a1, v30, 24, 1);
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_10000EBB4;
            v54[3] = &unk_100038F08;
            v54[4] = &v57;
            objc_msgSend(v29, "handleFileRemovedWithCompletionQueue:completionHandler:", v31, v54);

            v32 = sub_100020DBC((uint64_t)NEHelperCacheManager);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            sub_100025E74(v33, v34);

            _Block_object_dispose(&v57, 8);
          }
        }
        else if (!strcmp(string, "ControlSettingsChanged"))
        {
          sub_10000D5E4();
        }
        else
        {
          v15 = strcmp(string, "ManagedPreferencesChanged");
          if (!(_DWORD)v15)
            sub_10000D7AC(v15);
        }
      }
      else if (!strcmp(a3, "com.apple.distnoted.matching"))
      {
        if (!strcmp(string, "ApplicationInstalled") || !strcmp(string, "ApplicationUninstalled"))
        {
          v16 = (id)_CFXPCCreateCFObjectFromXPCObject(v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", _xpc_event_key_name));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("UserInfo")));
          if (isa_nsdictionary() && isa_nsstring(v18))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("bundleIDs")));
            if (isa_nsarray(v53))
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100038F98));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "filteredArrayUsingPredicate:", v20));

              LODWORD(v20) = objc_msgSend(v18, "isEqualToString:", CFSTR("ApplicationInstalled"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("isPlaceholder")));
              v22 = ne_log_obj(v50, v21);
              v23 = objc_claimAutoreleasedReturnValue(v22);
              v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
              if ((_DWORD)v20)
              {
                if (v24)
                {
                  v25 = objc_msgSend(v50, "BOOLValue");
                  v26 = "";
                  if (v25)
                    v26 = "placeholder ";
                  buf.st_dev = 136446466;
                  *(_QWORD *)&buf.st_mode = v26;
                  WORD2(buf.st_ino) = 2112;
                  v27 = v51;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v51;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received an apps installed notification with %{public}sbundle IDs %@", (uint8_t *)&buf, 0x16u);
                  v28 = 0;
                }
                else
                {
                  v28 = 0;
                  v27 = v51;
                }
              }
              else if (v24)
              {
                buf.st_dev = 138412290;
                v28 = v51;
                *(_QWORD *)&buf.st_mode = v51;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received an apps uninstalled notification with bundle IDs %@", (uint8_t *)&buf, 0xCu);
                v27 = 0;
              }
              else
              {
                v27 = 0;
                v28 = v51;
              }

              v46 = v51;
              v57 = 0;
              v58 = &v57;
              v59 = 0x3032000000;
              v60 = sub_100004620;
              v61 = sub_10000D264;
              v62 = (id)os_transaction_create("com.apple.nehelper.handleAppEvent");
              v49 = objc_msgSend(v50, "BOOLValue");
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472;
              v56[2] = sub_10000EBC8;
              v56[3] = &unk_100038F08;
              v56[4] = &v57;
              v35 = v27;
              v52 = v28;
              v48 = v56;
              v36 = dispatch_group_create();
              if (objc_msgSend(v35, "count"))
              {
                dispatch_group_enter(v36);
                v37 = sub_100020DBC((uint64_t)NEHelperCacheManager);
                v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
                v65[0] = _NSConcreteStackBlock;
                v65[1] = 3221225472;
                v65[2] = sub_10000EBDC;
                v65[3] = &unk_1000397A0;
                v66 = v36;
                sub_100025F4C(v38, v35, v65);

              }
              if (objc_msgSend(v52, "count", v46))
              {
                dispatch_group_enter(v36);
                v40 = sub_100020DBC((uint64_t)NEHelperCacheManager);
                v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
                v63[0] = _NSConcreteStackBlock;
                v63[1] = 3221225472;
                v63[2] = sub_10000EBE4;
                v63[3] = &unk_1000397A0;
                v64 = v36;
                sub_100025F4C(v41, v52, v63);

              }
              Property = objc_getProperty(a1, v39, 24, 1);
              *(_QWORD *)&buf.st_dev = _NSConcreteStackBlock;
              buf.st_ino = 3221225472;
              *(_QWORD *)&buf.st_uid = sub_10000EBEC;
              *(_QWORD *)&buf.st_rdev = &unk_100038F78;
              LOBYTE(buf.st_ctimespec.tv_sec) = v49;
              v43 = v35;
              buf.st_atimespec.tv_sec = (__darwin_time_t)v43;
              v44 = v52;
              buf.st_atimespec.tv_nsec = (uint64_t)v44;
              buf.st_mtimespec.tv_sec = (__darwin_time_t)a1;
              v45 = v48;
              buf.st_mtimespec.tv_nsec = (uint64_t)v45;
              dispatch_group_notify(v36, Property, &buf);

              _Block_object_dispose(&v57, 8);
            }

          }
        }
        else
        {
          v8 = strcmp(string, "ApplicationDatabaseUpdated");
          if (!(_DWORD)v8)
          {
            v10 = ne_log_obj(v8, v9);
            v11 = objc_claimAutoreleasedReturnValue(v10);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handling an application database updated notification", (uint8_t *)&buf, 2u);
            }

            v12 = sub_100020DBC((uint64_t)NEHelperCacheManager);
            v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            sub_100025E00(v13, v14);

            notify_post("com.apple.networkextension.apps-changed");
          }
        }
      }
    }
    NWPrivilegedHelperHandleEvent(v6, a3);
  }

}

void sub_10000EAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_10000EB04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v3 = ne_log_obj(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 136315394;
    v8 = v5;
    v9 = 2080;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Launched by event of type %s and name %s", (uint8_t *)&v7, 0x16u);
  }

}

void sub_10000EBB4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void sub_10000EBC8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void sub_10000EBDC(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000EBE4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000EBEC(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  id (*v19)(void *, const char *, ...);
  id v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  SEL v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  _QWORD *v50;
  void *v51;
  SEL v52;
  id Property;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  _QWORD v69[5];
  id v70;
  _QWORD block[4];
  id v72;
  uint64_t v73;
  uint8_t v74[128];
  __int128 buf;
  void (*v76)(uint64_t, void *);
  void *v77;
  id v78;
  _QWORD *v79;

  v2 = objc_alloc_init((Class)NSArray);
  if (*(_BYTE *)(a1 + 64) || !objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v55 = v2;
    goto LABEL_18;
  }
  v3 = a1;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = v4 == (id)1;
  v7 = ne_log_obj(v4, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(v3 + 32);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      v11 = "Handling an apps installed notification with bundle IDs %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v9)
  {
    v12 = objc_msgSend(*(id *)(v3 + 32), "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    v11 = "Handling an apps installed notification with %lu bundle IDs";
    goto LABEL_9;
  }

  sub_100017040((uint64_t)NEHelperConfigurationManager, 0, *(void **)(v3 + 32), 0);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v13 = *(id *)(v3 + 32);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v15)
          objc_enumerationMutation(v13);
        sub_100016310((uint64_t)NEHelperConfigurationManager, *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i), 0);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    }
    while (v14);
  }

  sub_10001FB48((uint64_t)NEHelperConfigurationManager, *(void **)(v3 + 32));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayByAddingObjectsFromArray:", *(_QWORD *)(v3 + 32)));

  v55 = (void *)v17;
  a1 = v3;
LABEL_18:
  v57 = a1;
  v18 = objc_msgSend(*(id *)(a1 + 40), "count");
  v19 = objc_msgSend_stringWithUTF8String_;
  if (!v18)
  {
    v28 = a1;
    v29 = v55;
    goto LABEL_39;
  }
  v20 = objc_msgSend(*(id *)(a1 + 40), "count");
  v21 = v20 == (id)1;
  v23 = ne_log_obj(v20, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v25)
    {
      v26 = *(_QWORD *)(v57 + 40);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v26;
      v27 = "Handling an apps uninstalled notification with bundle IDs %@";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v25)
  {
    v30 = objc_msgSend(*(id *)(v57 + 40), "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v30;
    v27 = "Handling an apps uninstalled notification with %lu bundle IDs";
    goto LABEL_25;
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100038F28));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v57 + 40), "filteredArrayUsingPredicate:", v54));
  v32 = *(void **)(v57 + 48);
  v33 = v31;
  v56 = v33;
  if (v32)
  {
    v35 = ne_log_obj(v33, v34);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v56;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Removing configurations for apps with bundle IDs %@", (uint8_t *)&buf, 0xCu);
    }

    if (objc_msgSend(v56, "count"))
    {
      sub_100017040((uint64_t)NEHelperConfigurationManager, 0, 0, v56);
      v69[0] = 0;
      v69[1] = v69;
      v69[2] = 0x3032000000;
      v69[3] = sub_100004620;
      v69[4] = sub_10000D264;
      v70 = (id)os_transaction_create("com.apple.nehelper.handleAppsRemoved");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
      v39 = objc_getProperty(v32, v38, 24, 1);
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_10000F960;
      v68[3] = &unk_100038F08;
      v68[4] = v69;
      objc_msgSend(v37, "handleApplicationsRemoved:completionQueue:withCompletionHandler:", v56, v39, v68);

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v40 = v56;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, &buf, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v41; j = (char *)j + 1)
          {
            if (*(_QWORD *)v65 != v42)
              objc_enumerationMutation(v40);
            v44 = *(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j);
            v45 = objc_opt_self(NEHelperHotspotConfigurationManager);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000AA64;
            block[3] = &unk_100038D40;
            v72 = v44;
            v73 = v45;
            v46 = v44;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, &buf, 16);
        }
        while (v41);
      }

      _Block_object_dispose(v69, 8);
    }
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "arrayByAddingObjectsFromArray:", *(_QWORD *)(v57 + 40)));
  v28 = v57;
  v19 = objc_msgSend_stringWithUTF8String_;
LABEL_39:
  v58[0] = _NSConcreteStackBlock;
  v47 = *((_QWORD *)v19 + 195);
  v58[1] = v47;
  v58[2] = sub_10000F2A8;
  v58[3] = &unk_100038F50;
  v48 = *(void **)(v28 + 48);
  v59 = *(id *)(v28 + 56);
  v49 = v29;
  v50 = v58;
  if (v48)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
    Property = objc_getProperty(v48, v52, 24, 1);
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = v47;
    v76 = sub_10000F2DC;
    v77 = &unk_100038FE0;
    v78 = v49;
    v79 = v50;
    objc_msgSend(v51, "loadConfigurationsWithCompletionQueue:handler:", Property, &buf);

  }
}

void sub_10000F27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F2A8(uint64_t a1, int a2)
{
  if (a2)
    notify_post("com.apple.networkextension.apps-changed");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000F2DC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char v50;
  uint64_t v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  uint64_t v55;
  void *v56;
  void *v57;
  unsigned __int8 v58;
  void *v59;
  void *v60;
  unsigned int v61;
  id v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  int v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];

  v3 = a2;
  v63 = ne_session_fallback_advisory();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v3;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  if (v74)
  {
    v68 = 0;
    v73 = *(_QWORD *)v82;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v82 != v73)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pluginType"));
        if (v6)
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
          if ((_DWORD)v7)
          {
            v9 = ne_log_obj(v7, v8);
            v10 = objc_claimAutoreleasedReturnValue(v9);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
              *(_DWORD *)buf = 138412546;
              v87 = v11;
              v88 = 2112;
              v89 = v6;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "App for configuration %@ (%@) changed", buf, 0x16u);

            }
            v12 = 1;
            goto LABEL_11;
          }
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appVPN"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appRules"));
        if (objc_msgSend(v14, "count"))
          goto LABEL_17;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentFilter"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "perApp"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appRules"));
        if (objc_msgSend(v17, "count"))
          goto LABEL_16;
        v75 = v6;
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dnsProxy"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "perApp"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appRules"));
        if (objc_msgSend(v19, "count"))
        {

          v6 = v75;
LABEL_16:

LABEL_17:
LABEL_18:
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appVPN"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentFilter"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "perApp"));

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentFilter"));
            goto LABEL_24;
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dnsProxy"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "perApp"));

          if (v25)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dnsProxy"));
            goto LABEL_24;
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relay"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "perApp"));

          if (v27)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relay"));
LABEL_24:
            v28 = v23;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "perApp"));

            if (v20)
            {
              v29 = v20;
              goto LABEL_27;
            }
            v29 = v27;
            if (v27)
LABEL_27:
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "appRules"));
            else
              v30 = 0;
          }
          else
          {
            v30 = 0;
            v29 = v20;
            if (v20)
              goto LABEL_27;
          }
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v31 = v30;
          v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
          if (v32)
          {
            v33 = v32;
            v69 = v27;
            v72 = v20;
            v76 = v6;
            v34 = *(_QWORD *)v78;
            while (2)
            {
              for (i = 0; i != v33; i = (char *)i + 1)
              {
                if (*(_QWORD *)v78 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
                v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "matchSigningIdentifier"));
                if (v37)
                {
                  v38 = (void *)v37;
                  v39 = *(void **)(a1 + 32);
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "matchSigningIdentifier"));
                  LOBYTE(v39) = objc_msgSend(v39, "containsObject:", v40);

                  if ((v39 & 1) != 0)
                  {

                    v44 = ne_log_obj(v42, v43);
                    v41 = objc_claimAutoreleasedReturnValue(v44);
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                    {
                      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
                      v46 = *(void **)(a1 + 32);
                      *(_DWORD *)buf = 138412546;
                      v87 = v45;
                      v88 = 2112;
                      v89 = v46;
                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "One or more apps in the per-app rules for configuration %@ changed: %@", buf, 0x16u);

                    }
                    v68 = 1;
                    goto LABEL_41;
                  }
                }
              }
              v33 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
              if (v33)
                continue;
              break;
            }
            v41 = v31;
LABEL_41:
            v6 = v76;
            v27 = v69;
            v20 = v72;
          }
          else
          {
            v41 = v31;
          }

          goto LABEL_44;
        }
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relay"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "perApp"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "appRules"));
        v70 = objc_msgSend(v64, "count");

        v6 = v75;
        if (v70)
          goto LABEL_18;
        v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathController"));
        if (!v47
          || (v48 = (void *)v47,
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathController")),
              v50 = objc_msgSend(v49, "hasNonDefaultRules") | v63,
              v49,
              v48,
              (v50 & 1) == 0))
        {
          v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alwaysOnVPN"));
          if (!v51
            || (v52 = (void *)v51,
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alwaysOnVPN")),
                v54 = objc_msgSend(v53, "isEnabled"),
                v53,
                v52,
                (v54 & 1) == 0))
          {
            v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dnsProxy"));
            if (!v55
              || (v56 = (void *)v55,
                  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dnsProxy")),
                  v58 = objc_msgSend(v57, "isEnabled"),
                  v57,
                  v56,
                  (v58 & 1) == 0))
            {
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appPush"));
              if (v59)
              {
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appPush"));
                v61 = objc_msgSend(v60, "isEnabled");

              }
              else
              {
                v61 = 0;
              }
              v6 = v75;

              v12 = v61 | v68;
LABEL_11:
              v68 = v12;
              goto LABEL_44;
            }
          }
        }
        v68 = 1;
        v6 = v75;
LABEL_44:

        v4 = (char *)v4 + 1;
      }
      while (v4 != v74);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      v74 = v62;
    }
    while (v62);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10000F960(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

BOOL sub_10000F974(id a1, id a2, NSDictionary *a3)
{
  id v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (isa_nsstring(v3))
  {
    LOBYTE(v4) = 1;
    v5 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationState"));
      v4 = objc_msgSend(v7, "isInstalled") ^ 1;

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

BOOL sub_10000F9FC(id a1, id a2, NSDictionary *a3)
{
  return isa_nsstring(a2);
}

BOOL sub_10000FA04(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  objc_opt_self(a1);
  v6 = (void *)xpc_connection_copy_entitlement_value(v5, a3);

  return v6 != 0;
}

id sub_10000FA60(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  uint64_t pid;
  id v5;
  _BYTE buffer[256];

  v3 = a2;
  objc_opt_self(a1);
  pid = xpc_connection_get_pid(v3);

  LODWORD(v3) = proc_name(pid, buffer, 0x100u);
  v5 = objc_alloc((Class)NSString);
  if ((int)v3 < 1)
    return objc_msgSend(v5, "initWithFormat:", CFSTR("process%d"), pid);
  else
    return objc_msgSend(v5, "initWithCString:encoding:", buffer, 4);
}

id sub_10000FB20(os_unfair_lock_s *a1, void *a2)
{
  id v3;
  id v4;
  SEL v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _DWORD *v12;
  id Property;
  id v14;
  void *v15;
  unsigned int v16;
  os_unfair_lock_s *lock;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    lock = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = objc_getProperty(a1, v5, 40, 1);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_DWORD **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11);
          if (v12)
          {
            if (v12[2] == 6)
            {
              Property = objc_getProperty(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11), v8, 32, 1);
              if ((objc_opt_respondsToSelector(Property, "name") & 1) != 0)
              {
                v14 = objc_msgSend(objc_getProperty(v12, v8, 32, 1), "name");
                v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
                v16 = objc_msgSend(v3, "isEqualToString:", v15);

                if (v16)
                  objc_msgSend(v4, "addObject:", v12);
              }
            }
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    os_unfair_lock_unlock(lock);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id sub_100010548(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a2;
  v6 = a3;
  objc_opt_self(a1);
  if (isa_nsarray(v5) && objc_msgSend(v5, "count"))
  {
    v7 = objc_msgSend(v5, "mutableCopy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v7, "indexOfObject:", v13, (_QWORD)v16) == (id)0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v14 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v7);
  }
  else
  {
    v14 = v6;
  }

  return v14;
}

uint64_t sub_100011380(unsigned int a1, uint64_t a2, int a3)
{
  int v5;
  int v6;
  int v7;

  v5 = socket(a3, 2, 0);
  if (v5 < 0)
    return *__error();
  v6 = v5;
  v7 = ioctl(v5, a1, a2);
  close(v6);
  if (v7 < 0)
    return *__error();
  else
    return 0;
}

uint64_t sub_1000113F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  int v26;
  char *v27;
  __int128 v28;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v6 = *(unsigned __int8 *)(a2 + 1);
  if (v6 == 30)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    v28 = 0u;
    memset(v29, 0, sizeof(v29));
    __strlcpy_chk(&v28, a1, 16, 16);
    LOWORD(v29[0]) = 7708;
    *(_OWORD *)((char *)v29 + 8) = *(_OWORD *)(a2 + 8);
    if (a3)
    {
      WORD4(v31) = 7708;
      v32 = *(_OWORD *)(a3 + 8);
    }
    if (a4)
      v13 = *(_QWORD *)(a4 + 16);
    else
      v13 = -1;
    *((_QWORD *)&v34 + 1) = v13;
    if (*(unsigned __int8 *)(a2 + 8) == 254 && (*(_BYTE *)(a2 + 9) & 0xC0) == 0x80)
    {
      v14 = sub_100011380(0xC0806982, (uint64_t)&v28, 30);
      if ((_DWORD)v14)
      {
        v9 = v14;
        v16 = ne_log_obj(v14, v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v26 = 136315138;
        v27 = strerror(v9);
        v18 = "Couldn't set link-local IPv6 address, %s";
        goto LABEL_24;
      }
    }
    else
    {
      v19 = sub_100011380(0x8080691A, (uint64_t)&v28, 30);
      if ((_DWORD)v19)
      {
        v9 = v19;
        v21 = ne_log_obj(v19, v20);
        v17 = objc_claimAutoreleasedReturnValue(v21);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v26 = 136315138;
        v27 = strerror(v9);
        v18 = "Couldn't set IPv6 address, %s";
LABEL_24:
        v22 = v17;
        v23 = 12;
        goto LABEL_30;
      }
    }
    return 0;
  }
  if (v6 == 2)
  {
    v30 = 0u;
    v28 = 0u;
    memset(v29, 0, sizeof(v29));
    __strlcpy_chk(&v28, a1, 16, 16);
    v29[0] = 0x210uLL;
    DWORD1(v29[0]) = *(_DWORD *)(a2 + 4);
    v29[1] = __PAIR64__(DWORD1(v29[0]), 528);
    v30 = 0uLL;
    if (a3)
    {
      LOWORD(v30) = 528;
      DWORD1(v30) = *(_DWORD *)(a3 + 4);
    }
    v7 = sub_100011380(0x8040691A, (uint64_t)&v28, 2);
    if (!(_DWORD)v7)
      return 0;
    v9 = v7;
    if ((_DWORD)v7 == 17)
    {
      v10 = ne_log_obj(v7, v8);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Couldn't set interface address, already exists", (uint8_t *)&v26, 2u);
      }

      return 0;
    }
    v24 = ne_log_obj(v7, v8);
    v17 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      return v9;
    }
    LOWORD(v26) = 0;
    v18 = "Couldn't set interface address";
    v22 = v17;
    v23 = 2;
LABEL_30:
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v26, v23);
    goto LABEL_27;
  }
  return 22;
}

void sub_100012EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012F68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const void *data;
  uint64_t uint64;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v15;
  uint64_t v16;
  _xpc_connection_s *v17;
  uint64_t pid;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint8_t *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  const uint8_t *uuid;
  const uint8_t *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *CStringPtr;
  uint64_t v42;
  int v43;
  size_t length;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  char *v50;
  char __strerrbuf[4];
  uint64_t v52;

  v4 = a3;
  v5 = v4;
  if (!v4 || xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
    goto LABEL_35;
  length = 0;
  data = xpc_dictionary_get_data(v5, "interface-option-data", &length);
  uint64 = xpc_dictionary_get_uint64(v5, "interface-option");
  if (uint64)
  {
    v8 = uint64;
    if (setsockopt(*(_DWORD *)(a1 + 56), 2, uint64, data, length))
    {
      v9 = *__error();
      v10 = strerror_r(v9, __strerrbuf, 0x80uLL);
      if ((_DWORD)v10)
        __strerrbuf[0] = 0;
      v12 = ne_log_obj(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        v46 = v8;
        v47 = 1024;
        v48 = v9;
        v49 = 2080;
        v50 = __strerrbuf;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to set socket option %d on kernel control socket: [%d] %s", buf, 0x18u);
      }

    }
  }
  if (xpc_dictionary_get_BOOL(v5, "interface-bind-channel-pid") && xpc_dictionary_get_uint64(v5, "interface-type") == 2)
  {
    remote_connection = xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    v17 = v15;
    if (v15)
    {
      pid = xpc_connection_get_pid(v15);
      v19 = pid;
      v43 = pid;
      v21 = ne_log_obj(pid, v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__strerrbuf = 67109120;
        LODWORD(v52) = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "binding ipsec channel to pid: %d", (uint8_t *)__strerrbuf, 8u);
      }

      if (!setsockopt(*(_DWORD *)(a1 + 56), 2, 17, &v43, 4u))
        goto LABEL_22;
      v23 = *__error();
      v24 = strerror_r(v23, __strerrbuf, 0x80uLL);
      if ((_DWORD)v24)
        __strerrbuf[0] = 0;
      v26 = ne_log_obj(v24, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        v46 = 17;
        v47 = 1024;
        v48 = v23;
        v49 = 2080;
        v50 = __strerrbuf;
        v28 = "Failed to set socket option %d on kernel control socket: [%d] %s";
        v29 = buf;
        v30 = v27;
        v31 = 24;
LABEL_37:
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v28, v29, v31);
      }
    }
    else
    {
      v32 = ne_log_obj(0, v16);
      v27 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v42 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)__strerrbuf = 138412290;
        v52 = v42;
        v28 = "Could not get remote connection for message: %@";
        v29 = (uint8_t *)__strerrbuf;
        v30 = v27;
        v31 = 12;
        goto LABEL_37;
      }
    }

LABEL_22:
  }
  uuid = xpc_dictionary_get_uuid(v5, "interface-bind-channel-exec-uuid");
  if (uuid)
  {
    v34 = uuid;
    if (xpc_dictionary_get_uint64(v5, "interface-type") == 2)
    {
      if (setsockopt(*(_DWORD *)(a1 + 56), 2, 20, v34, 0x10u))
      {
        v35 = *__error();
        v36 = strerror_r(v35, __strerrbuf, 0x80uLL);
        if ((_DWORD)v36)
          __strerrbuf[0] = 0;
        v38 = ne_log_obj(v36, v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          v46 = 20;
          v47 = 1024;
          v48 = v35;
          v49 = 2080;
          v50 = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to set socket option %d on kernel control socket: [%d] %s", buf, 0x18u);
        }

      }
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    CStringPtr = CFStringGetCStringPtr(CFSTR("DisableTrafficShaping"), 0x8000100u);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(v5, CStringPtr);
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_BOOL(v5, "interface-direct-link");
LABEL_35:

  return 1;
}

void sub_100015DB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100015EA0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  xpc_object_t v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  if (v8)
    objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("config-index"));
  objc_msgSend(v5, "encodeInt64:forKey:", a3, CFSTR("config-generation"));
  objc_msgSend(v5, "finishEncoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encodedData"));
  v7 = xpc_data_create(objc_msgSend(v6, "bytes"), (size_t)objc_msgSend(v6, "length"));
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, v7);

}

void sub_100015F80(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  xpc_object_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a2;
  v9 = a3;
  v10 = a5;
  if (v8)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v8, 1);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), "copyPasswordsFromSystemKeychain", (_QWORD)v20);
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    v17 = v12;
    objc_msgSend(v11, "encodeObject:forKey:", v17, CFSTR("config-objects"));

    objc_msgSend(v11, "finishEncoding");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "encodedData"));
    v8 = xpc_data_create(objc_msgSend(v18, "bytes"), (size_t)objc_msgSend(v18, "length"));

    if (v9)
      goto LABEL_10;
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  v17 = 0;
  if (!v9)
    goto LABEL_12;
LABEL_10:
  v19 = objc_msgSend(v9, "code", (_QWORD)v20);
LABEL_13:
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), (int64_t)v19, v8);

}

id sub_100016174(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_opt_self(a1);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100042CB0);
  v4 = 0;
  if (v3 && qword_100042C68)
    v4 = objc_msgSend((id)qword_100042C68, "isEqualToString:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042CB0);

  return v4;
}

void sub_1000161E0(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  SEL v11;
  id v12;
  SEL v13;
  id Property;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  void *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v12 = objc_getProperty(a1, v11, 56, 1);
  Property = objc_getProperty(a1, v13, 32, 1);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001E438;
  v18[3] = &unk_100039228;
  v15 = v9;
  v19 = v15;
  v16 = v7;
  v20 = v16;
  v17 = v8;
  v21 = v17;
  v22 = a1;
  objc_msgSend(v10, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, v12, Property, v18);

}

void sub_100016310(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  id v7;
  _BYTE *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *log;
  os_log_t loga;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  NSObject *v46;

  v5 = a2;
  v6 = a3;
  objc_opt_self(a1);
  v7 = sub_10000DDE4((uint64_t)NEHelperServer);
  v8 = (_BYTE *)objc_claimAutoreleasedReturnValue(v7);
  if (v8 && (v10 = v8[12], v8, (v10 & 1) != 0))
  {
    v40 = 0;
    v13 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, &v40);
    v14 = v40;
    v12 = v14;
    if (v14 || !v13)
    {
      v32 = ne_log_obj(v14, v15);
      v18 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v5;
        v45 = 2112;
        v46 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Did not find an app with bundle ID %@, cannot add app rules from app mapping: %@", buf, 0x16u);
      }
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entitlements"));
      v17 = objc_msgSend(v16, "objectForKey:ofClass:", CFSTR("com.apple.developer.networking.networkextension"), objc_opt_class(NSArray));
      v18 = objc_claimAutoreleasedReturnValue(v17);

      if (-[NSObject count](v18, "count"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entitlements"));
        v20 = objc_msgSend(v19, "objectForKey:ofClass:", CFSTR("get-task-allow"), objc_opt_class(NSNumber));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entitlements"));
        v23 = objc_msgSend(v22, "objectForKey:ofClass:", CFSTR("com.apple.private.networkextension.test-control"), objc_opt_class(NSNumber));
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

        if ((objc_msgSend(v21, "BOOLValue") & 1) != 0 || objc_msgSend(v24, "BOOLValue"))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v25));

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "infoDictionary"));
          if (isa_nsdictionary())
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NETestAppMapping")));
            if (isa_nsdictionary())
            {
              v29 = objc_msgSend(v28, "count");
              if (v29)
              {
                v31 = ne_log_obj(v29, v30);
                log = objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v44 = CFSTR("NETestAppMapping");
                  v45 = 2112;
                  v46 = v5;
                  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Setting app rules from the %@ for %@", buf, 0x16u);
                }

                if (v6)
                {
                  sub_10001DCBC((uint64_t)NEHelperConfigurationManager, v28, v6);
                }
                else
                {
                  v41[0] = CFSTR("user-uuid");
                  v33 = NECopyConsoleUserUUID();
                  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                  v41[1] = CFSTR("application-id");
                  v42[0] = v34;
                  v42[1] = v5;
                  loga = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));

                  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
                  v38[0] = _NSConcreteStackBlock;
                  v38[1] = 3221225472;
                  v38[2] = sub_10001DAAC;
                  v38[3] = &unk_100039278;
                  v39 = v28;
                  objc_msgSend(v35, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, loga, &_dispatch_main_q, v38);

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
    v11 = ne_log_obj(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "LaunchServices is not available, cannot add app rules from app mapping from app %@", buf, 0xCu);
    }
  }

}

void sub_100016760(uint64_t a1, void *a2)
{
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), (int64_t)objc_msgSend(a2, "code"), 0);
}

void sub_10001679C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  int64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id Property;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v15 = *(void **)(a1 + 40);
    v16 = 7;
LABEL_13:
    sub_1000037E4((uint64_t)NEHelperServer, v15, v16, 0);
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pluginType"));
  if (!v7 || (v8 = *(_QWORD *)(a1 + 32)) != 0 && (*(_BYTE *)(v8 + 14) & 1) != 0)
  {

  }
  else
  {
    v9 = *(unsigned __int8 *)(a1 + 56);

    if (!v9)
    {
      v12 = ne_log_obj(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        Property = *(id *)(a1 + 32);
        if (Property)
          Property = objc_getProperty(Property, v14, 64, 1);
        *(_DWORD *)buf = 138412290;
        v28 = Property;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ is not allowed to remove provider-based configurations", buf, 0xCu);
      }

      v15 = *(void **)(a1 + 40);
      v16 = 10;
      goto LABEL_13;
    }
  }
  sub_10001CBA8(*(_QWORD *)(a1 + 32), v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(void **)(a1 + 32);
  if (v20)
    v21 = objc_getProperty(v20, v17, 32, 1);
  else
    v21 = 0;
  v22 = *(void **)(a1 + 48);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001D9C0;
  v24[3] = &unk_1000392C8;
  v25 = v22;
  v26 = *(id *)(a1 + 40);
  objc_msgSend(v18, "removeConfigurationFromDisk:completionQueue:completionHandler:", v19, v21, v24);

LABEL_14:
}

void sub_100016998(void *a1, void *a2)
{
  id v3;
  void *v4;
  SEL v5;
  id Property;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  Property = objc_getProperty(a1, v5, 32, 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D514;
  v8[3] = &unk_100039278;
  v7 = v3;
  v9 = v7;
  objc_msgSend(v4, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, 0, Property, v8);

}

void sub_100016A54(void *a1, void *a2)
{
  id v3;
  void *v4;
  SEL v5;
  id Property;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  Property = objc_getProperty(a1, v5, 32, 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D248;
  v8[3] = &unk_100039278;
  v7 = v3;
  v9 = v7;
  objc_msgSend(v4, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, 0, Property, v8);

}

id sub_100016B10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  objc_opt_self(a1);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100018440;
  v15 = sub_100018450;
  v16 = 0;
  sub_10001D10C((uint64_t)NEHelperPendingOperation);
  v4 = qword_100042CC0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D148;
  v8[3] = &unk_1000396E0;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_100016C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016C1C(uint64_t a1, const char *a2)
{
  _BYTE *v3;
  char v4;
  uint64_t v5;
  unsigned __int8 *v6;
  const char *v7;
  _BYTE *v8;
  void *v9;
  id Property;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  if ((_DWORD)a2)
  {
    v3 = *(_BYTE **)(a1 + 40);
    if (v3)
      v4 = v3[8] & 1;
    else
      v4 = 0;
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      *(_BYTE *)(v5 + 16) = v4;
      v6 = *(unsigned __int8 **)(a1 + 32);
      v3 = *(_BYTE **)(a1 + 40);
      if (!v3)
      {
LABEL_7:
        v8 = v3;
        v9 = *(void **)(a1 + 40);
        if (v9)
        {
          Property = objc_getProperty(v9, v7, 40, 1);
          v11 = *(void **)(a1 + 40);
        }
        else
        {
          v11 = 0;
          Property = 0;
        }
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001C66C;
        v14[3] = &unk_100039318;
        v15 = v11;
        v16 = *(id *)(a1 + 48);
        sub_10001C6DC(v6, v8, Property, v14);

        return;
      }
    }
    else
    {
      v6 = 0;
      if (!v3)
        goto LABEL_7;
    }
    v3 = objc_getProperty(v3, a2, 32, 1);
    goto LABEL_7;
  }
  v12 = *(void **)(a1 + 40);
  if (v12)
    v13 = objc_getProperty(v12, a2, 48, 1);
  else
    v13 = 0;
  sub_1000037E4((uint64_t)NEHelperServer, v13, 10, 0);
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 48), 0, 0);
}

id sub_100016D84(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_100016DAC(uint64_t a1)
{

}

void sub_100016DB4(uint64_t a1, void *a2, id a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  xpc_object_t v9;
  const char *v10;
  id Property;
  const char *v12;
  _xpc_connection_s *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;

  v5 = a2;
  if (objc_msgSend(v5, "count") == a3)
  {
    sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), 22, 0);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "config-operation", 8);
    if (v8)
      Property = objc_getProperty(v8, v10, 24, 1);
    else
      Property = 0;
    v13 = (_xpc_connection_s *)Property;
    v14 = *(void **)(a1 + 40);
    if (v14)
      v15 = objc_getProperty(v14, v12, 32, 1);
    else
      v15 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001C57C;
    v18[3] = &unk_100039368;
    v16 = *(id *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 48);
    v19 = v16;
    v21 = v17;
    v20 = v5;
    v22 = a3;
    xpc_connection_send_message_with_reply(v13, v9, v15, v18);

  }
}

id sub_100016F34(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100018440;
  v13 = sub_100018450;
  v14 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001C234;
  v6[3] = &unk_100039570;
  v8 = &v9;
  v3 = v1;
  v7 = v3;
  objc_msgSend(v2, "enumerateApplicationsOfType:block:", 0, v6);

  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_100017028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017040(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  objc_opt_self(a1);
  if (qword_100042CA8 != -1)
    dispatch_once(&qword_100042CA8, &stru_1000395D0);
  v9 = sub_100017134((uint64_t)NEHelperConfigurationManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ADA4;
  block[3] = &unk_100039620;
  v16 = a2;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, block);

}

id sub_100017134(uint64_t a1)
{
  objc_opt_self(a1);
  if (qword_100042C78 != -1)
    dispatch_once(&qword_100042C78, &stru_1000390D8);
  return (id)qword_100042C70;
}

void sub_100017178(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  __CFString *v34;
  id v35;
  uint64_t v36;
  void *v37;
  double v38;
  BOOL v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  char v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  __CFString *v79;
  int v80;
  uint64_t v81;
  unsigned int v82;
  uint64_t v83;
  id v84;
  id v85;
  _QWORD v86[5];
  id v87;
  NSObject *v88;
  id v89;
  id v90;
  __CFString *v91;
  __CFString *v92;
  id v93;
  __int128 *p_buf;
  int v95;
  char v96;
  id v97;
  _BYTE v98[12];
  __int16 v99;
  __CFString *v100;
  __int16 v101;
  __CFString *v102;
  __int16 v103;
  void *v104;
  __int128 buf;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;

  v85 = objc_alloc_init((Class)MOEffectiveSettingsStore);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "user"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sharingPolicy"));
  v4 = objc_msgSend(v3, "isEqualToString:", MOUserSharingPolicyRestricted);

  if (!v4)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v106 = 0x3032000000;
    v107 = sub_100018440;
    v108 = sub_100018450;
    v109 = 0;
    v10 = *(_QWORD *)(a1 + 48);
    v82 = *(_DWORD *)(a1 + 72);
    v11 = *(id *)(a1 + 32);
    if (!v10)
    {
      v83 = 0;
      v84 = 0;
      v27 = 0;
      v14 = 0;
      v23 = 0;
      goto LABEL_23;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v11, 0, 0));
    v13 = v12;
    if (v12)
    {
      v84 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "teamIdentifier"));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "SDKVersion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "infoDictionary"));
      v16 = objc_msgSend(v15, "objectForKey:ofClass:", CFSTR("NSBonjourServices"), objc_opt_class(NSObject));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      HIDWORD(v83) = v17 != 0;

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entitlements"));
      v19 = objc_msgSend(v18, "objectForKey:ofClass:", CFSTR("com.apple.developer.networking.multicast"), objc_opt_class(NSObject));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      LODWORD(v83) = v20 != 0;

      v21 = NEResourcesCopyDevicePreferredLocalizations();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedNameWithPreferredLocalizations:", v22));

    }
    else
    {
      v83 = 0;
      v84 = 0;
      v14 = 0;
      v23 = 0;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v11, 0));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("NSLocalNetworkUsageDescription")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedValuesForKeys:fromTable:", v25, 0));

      if (!v26
        || (v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringForKey:", CFSTR("NSLocalNetworkUsageDescription")))) == 0)
      {
        v28 = objc_msgSend(v24, "objectForInfoDictionaryKey:ofClass:", CFSTR("NSLocalNetworkUsageDescription"), objc_opt_class(NSString));
        v27 = (id)objc_claimAutoreleasedReturnValue(v28);
      }

      if (v23)
        goto LABEL_22;
    }
    else
    {
      v27 = 0;
      if (v23)
      {
LABEL_22:

LABEL_23:
        v34 = (__CFString *)v84;
        objc_storeStrong(&v109, v27);
        v35 = v14;
        v37 = v35;
        if (!*(_QWORD *)(a1 + 32) || !v23)
        {
          v40 = ne_log_obj(v35, v36);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v78 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v98 = 138412802;
            *(_QWORD *)&v98[4] = v78;
            v99 = 2112;
            v100 = v23;
            v101 = 2112;
            v102 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Could not find bundle ID or display name for app: (bundleID: %@, name: %@, teamID: %@)", v98, 0x20u);
          }

          sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 22, 0);
          goto LABEL_58;
        }
        if (v35)
        {
          v35 = objc_msgSend(v35, "doubleValue");
          v39 = v38 < 18.0;
        }
        else
        {
          v39 = 0;
        }
        if (v83 && !v39 && !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          v76 = ne_log_obj(v35, v36);
          v77 = objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v81 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v98 = 138413058;
            *(_QWORD *)&v98[4] = v81;
            v99 = 2112;
            v100 = v23;
            v101 = 2112;
            v102 = v34;
            v103 = 2112;
            v104 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "App did not provide a local network usage string, not prompting: (bundleID: %@, name: %@, teamID: %@, sdkVersion: %@)", v98, 0x2Au);
          }

          sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 1, 0);
          goto LABEL_58;
        }
        if (!v34)
        {
          v42 = ne_log_obj(v35, v36);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v98 = 138412546;
            *(_QWORD *)&v98[4] = v44;
            v99 = 2112;
            v100 = v23;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "No team ID found for (bundleID: %@, name: %@)", v98, 0x16u);
          }

          v34 = CFSTR("TEAMID");
        }
        v45 = ne_log_obj(v35, v36);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v79 = *(__CFString **)(a1 + 32);
          v80 = *(_DWORD *)(a1 + 72);
          *(_DWORD *)v98 = 138413058;
          *(_QWORD *)&v98[4] = v23;
          v99 = 2112;
          v100 = v34;
          v101 = 2112;
          v102 = v79;
          v103 = 1024;
          LODWORD(v104) = v80;
          _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Got message for: %@ (%@.%@ PID %d)", v98, 0x26u);
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v34, *(_QWORD *)(a1 + 32)));
        v48 = *(_QWORD *)(a1 + 48);
        v49 = *(id *)(a1 + 40);
        v50 = v47;
        v51 = v50;
        if (v48)
        {
          if (qword_100042C90)
          {
            v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100042C90, "objectForKeyedSubscript:", v50));
            v54 = v52;
            if (v52 && (v52 = objc_msgSend(v52, "count")) != 0)
            {
              v55 = ne_log_obj(v52, v53);
              v56 = objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v98 = 138412290;
                *(_QWORD *)&v98[4] = v51;
                _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "We've already got a prompt outstanding for %@, joining queue", v98, 0xCu);
              }

              objc_msgSend(v54, "addObject:", v49);
              v57 = 0;
            }
            else
            {
              v58 = ne_log_obj(v52, v53);
              v59 = objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v98 = 138412290;
                *(_QWORD *)&v98[4] = v51;
                _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "No prompts for %@, starting queue and prompting", v98, 0xCu);
              }

              v60 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v49, 0);
              v57 = 1;
              v54 = v60;
            }
            objc_msgSend((id)qword_100042C90, "setObject:forKeyedSubscript:", v54, v51);

            if ((v57 & 1) == 0)
              goto LABEL_51;
          }
          else
          {
            v65 = objc_alloc_init((Class)NSMutableDictionary);
            v66 = (void *)qword_100042C90;
            qword_100042C90 = (uint64_t)v65;

            v67 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v49, 0);
            v68 = objc_msgSend((id)qword_100042C90, "setObject:forKeyedSubscript:", v67, v51);
            v70 = ne_log_obj(v68, v69);
            v71 = objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v98 = 138412290;
              *(_QWORD *)&v98[4] = v51;
              _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "First prompt, starting the queue with %@ and prompting", v98, 0xCu);
            }

          }
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
          v73 = sub_100017134((uint64_t)NEHelperConfigurationManager);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
          v86[0] = _NSConcreteStackBlock;
          v86[1] = 3221225472;
          v86[2] = sub_100018458;
          v86[3] = &unk_100039458;
          v86[4] = *(_QWORD *)(a1 + 48);
          v87 = v51;
          v64 = v72;
          v88 = v64;
          v89 = *(id *)(a1 + 56);
          v90 = *(id *)(a1 + 32);
          v95 = *(_DWORD *)(a1 + 72);
          v91 = v23;
          v92 = v34;
          v75 = *(id *)(a1 + 64);
          v96 = *(_BYTE *)(a1 + 76);
          v93 = v75;
          p_buf = &buf;
          -[NSObject loadConfigurations:withFilter:completionQueue:completionHandler:](v64, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, 0, v74, v86);

LABEL_57:
LABEL_58:

          _Block_object_dispose(&buf, 8);
          goto LABEL_59;
        }

LABEL_51:
        v63 = ne_log_obj(v61, v62);
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v98 = 138412290;
          *(_QWORD *)&v98[4] = v51;
          _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Prompt for %@ enqueued, stopping", v98, 0xCu);
        }
        goto LABEL_57;
      }
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v11));
    *(_QWORD *)v98 = 0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v29, v98));
    v31 = *(id *)v98;

    if (v30)
    {
      if (v31)
      {
LABEL_18:
        v23 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", v82));
      v97 = 0;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v32, &v97));
      v33 = v97;

      v31 = v33;
      if (v33)
        goto LABEL_18;
    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
    goto LABEL_21;
  }
  v7 = ne_log_obj(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Prompt for %@ occurred in restricted (guest) mode, suppressing alert", (uint8_t *)&buf, 0xCu);
  }

  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 1, 0);
LABEL_59:

}

void sub_100017BC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100017C0C(uint64_t a1, void *a2)
{
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, a2);
}

void sub_100017C28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id Property;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  uint64_t v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Signature")));
  v6 = isa_nsdata(v5);
  if ((v6 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 48);
    if (v11)
      Property = objc_getProperty(v11, v8, 32, 1);
    else
      Property = 0;
    v13 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001807C;
    v19[3] = &unk_1000394D0;
    v20 = v13;
    v21 = *(id *)(a1 + 40);
    v24 = *(_BYTE *)(a1 + 56);
    v14 = v5;
    v15 = *(_QWORD *)(a1 + 48);
    v22 = v14;
    v23 = v15;
    objc_msgSend(v9, "loadConfigurationWithID:withCompletionQueue:handler:", v10, Property, v19);

  }
  else
  {
    v16 = ne_log_obj(v6, v7);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "No signature found for configuration identifier %@", buf, 0xCu);
    }

    sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 22, 0);
  }

}

void sub_100017E14(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  void *v5;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  const __CFString *v31;
  id v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const __CFString *v44;
  _BYTE v45[128];

  v9 = a2;
  v10 = a3;
  v11 = a5;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v12)
  {
    v13 = v12;
    v32 = v11;
    v33 = v10;
    v14 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "VPN"));
        if (v17)
        {
          v18 = (void *)v17;
          v19 = *(unsigned __int8 *)(a1 + 56);
          if (*(_BYTE *)(a1 + 56)
            && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "VPN")),
                (objc_msgSend(v5, "isEnabled") & 1) == 0))
          {

          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "applicationIdentifier"));
            v21 = objc_msgSend(v20, "isEqual:", *(_QWORD *)(a1 + 32));

            if (v19)
            {

              if ((v21 & 1) != 0)
                goto LABEL_18;
            }
            else
            {

              if (v21)
              {
LABEL_18:
                v25 = ne_log_obj(v22, v23);
                v26 = objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  v27 = *(_QWORD *)(a1 + 40);
                  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "applicationIdentifier"));
                  v29 = (void *)v28;
                  v30 = *(unsigned __int8 *)(a1 + 56);
                  *(_DWORD *)buf = 138412802;
                  v40 = v27;
                  if (v30)
                    v31 = CFSTR(" (enabled)");
                  else
                    v31 = &stru_10003A6B8;
                  v41 = 2112;
                  v42 = v28;
                  v43 = 2112;
                  v44 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@ Bundle id %@ has VPN configuration%@", buf, 0x20u);

                }
                v24 = 0;
                v11 = v32;
                v10 = v33;
                goto LABEL_24;
              }
            }
          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v13)
        continue;
      break;
    }
    v11 = v32;
    v10 = v33;
  }
  v24 = 7;
LABEL_24:

  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 48), v24, 0);
}

void sub_10001807C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  int v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  id Property;
  uint64_t v26;
  const char *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;

  v5 = a2;
  v6 = a3;
  v8 = v6;
  if (!v5 || v6)
  {
    v17 = ne_log_obj(v6, v7);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v31 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v37 = v31;
      v38 = 2112;
      v39 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to load configuration with ID %@: %@", buf, 0x16u);
    }

    v15 = *(void **)(a1 + 40);
    v16 = 3;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPN"));

  if (!v9)
  {
    v19 = ne_log_obj(v10, v11);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      *(_DWORD *)buf = 138412290;
      v37 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Configuration %@ is not a VPN configuration", buf, 0xCu);

    }
    v15 = *(void **)(a1 + 40);
    v16 = 22;
    goto LABEL_12;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPN"));
  v13 = objc_msgSend(v12, "isEnabled");
  v14 = *(unsigned __int8 *)(a1 + 64);

  if (v14 == v13)
  {
    v15 = *(void **)(a1 + 40);
    v16 = 0;
LABEL_12:
    sub_1000037E4((uint64_t)NEHelperServer, v15, v16, 0);
    goto LABEL_13;
  }
  v21 = *(unsigned __int8 *)(a1 + 64);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPN"));
  objc_msgSend(v22, "setEnabled:", v21);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v26 = *(_QWORD *)(a1 + 48);
  Property = *(id *)(a1 + 56);
  if (Property)
    Property = objc_getProperty(Property, v23, 48, 1);
  v28 = Property;
  v29 = *(void **)(a1 + 56);
  if (v29)
    v30 = objc_getProperty(v29, v27, 32, 1);
  else
    v30 = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100018344;
  v33[3] = &unk_1000392C8;
  v34 = v5;
  v35 = *(id *)(a1 + 40);
  objc_msgSend(v24, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:", v34, v26, v28, 0, v30, v33);

LABEL_13:
}

void sub_100018344(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = ne_log_obj(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to enable configuration %@: %@", (uint8_t *)&v10, 0x16u);

    }
    v8 = 22;
  }
  else
  {
    v8 = 0;
  }
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), v8, 0);

}

uint64_t sub_100018440(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100018450(uint64_t a1)
{

}

void sub_100018458(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  id Property;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *j;
  void *v60;
  void *v61;
  unsigned int v62;
  id v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  unsigned int v81;
  void *v82;
  void *v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  uint64_t v110;
  void *v111;
  id v112;
  uint64_t v113;
  void *v114;
  id v115;
  id v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  void *k;
  void *v121;
  uint64_t v122;
  NSObject *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  __CFString *v134;
  __CFString *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  id v139;
  void *v140;
  const __CFString *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSObject *v150;
  uint64_t v151;
  id v152;
  NSObject *v153;
  id v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  id v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  NSObject *v163;
  uint64_t v164;
  NSObject *v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  NSObject *v176;
  void *v177;
  void *v178;
  _UNKNOWN **v179;
  void *v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  id v188;
  void *v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  NSObject *v194;
  uint64_t v195;
  NSObject *v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  uint64_t v216;
  void *v217;
  char v218;
  id v219;
  id obj;
  uint64_t v221;
  id v222;
  id v223;
  uint64_t v224;
  char v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  void *v229;
  id v230;
  void *v231;
  _QWORD block[4];
  id v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  _QWORD v238[5];
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  _BYTE *v249;
  int v250;
  char v251;
  char v252;
  char v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  _QWORD v258[4];
  id v259;
  id v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  id v265;
  id v266;
  _QWORD v267[4];
  _QWORD v268[4];
  const __CFString *v269;
  void *v270;
  _QWORD v271[2];
  _QWORD v272[2];
  _BYTE v273[128];
  uint8_t v274[128];
  _BYTE buf[24];
  uint64_t (*v276)(uint64_t, uint64_t);
  void (*v277)(uint64_t);
  id v278;
  uint8_t v279[128];
  uint8_t v280[4];
  uint64_t v281;
  __int16 v282;
  uint64_t v283;
  __int16 v284;
  const char *v285;

  v219 = a2;
  v8 = a3;
  v9 = a5;
  v227 = v9;
  v228 = a1;
  v217 = v8;
  if (v8)
  {
    v11 = ne_log_obj(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to load configurations with error %{public}@", buf, 0xCu);
    }

    sub_100019C0C(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, 22);
    goto LABEL_153;
  }
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v10, 48, 1);
  v215 = Property;
  v231 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager networkPrivacyConfigurationName](NEConfigurationManager, "networkPrivacyConfigurationName"));
  v263 = 0u;
  v264 = 0u;
  v261 = 0u;
  v262 = 0u;
  v14 = v219;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v261, v279, 16);
  if (v15)
  {
    v229 = 0;
    v230 = 0;
    v16 = *(_QWORD *)v262;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v262 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v261 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        v20 = objc_msgSend(v19, "isEqualToString:", v231);

        if (v20)
        {
          if (v230)
          {
            v23 = ne_log_obj(v21, v22);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v231;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v33;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Found a duplicate %{public}@ configuration %{public}@, removing", buf, 0x16u);

            }
            v25 = *(void **)(v228 + 48);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
            v27 = sub_100017134((uint64_t)NEHelperConfigurationManager);
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            v258[0] = _NSConcreteStackBlock;
            v258[1] = 3221225472;
            v258[2] = sub_100019E4C;
            v258[3] = &unk_1000392C8;
            v259 = v231;
            v260 = 0;
            objc_msgSend(v25, "removeConfigurationFromDisk:completionQueue:completionHandler:", v26, v28, v258);

            v29 = v259;
          }
          else
          {
            v230 = v18;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties")));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "identifier"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", v30));
            v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Signature")));

            v229 = (void *)v32;
          }

        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v261, v279, 16);
    }
    while (v15);

    if (v230)
    {
      v225 = 0;
      goto LABEL_25;
    }
  }
  else
  {

    v229 = 0;
  }
  v230 = objc_msgSend(objc_alloc((Class)NEConfiguration), "initWithName:grade:", v231, 2);
  v225 = 1;
LABEL_25:
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "pathController"));
  v35 = v34 == 0;

  if (v35)
  {
    v36 = objc_alloc_init((Class)NEPathController);
    objc_msgSend(v230, "setPathController:", v36);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "pathController"));
  objc_msgSend(v37, "setEnabled:", 1);

  if (*(_QWORD *)(v228 + 56))
  {
    v38 = +[NEProcessInfo copyUUIDsForBundleID:uid:](NEProcessInfo, "copyUUIDsForBundleID:uid:", *(_QWORD *)(v228 + 64), 0);
    v39 = objc_msgSend(v38, "containsObject:", *(_QWORD *)(v228 + 56));
    if ((v39 & 1) == 0)
    {
      v41 = ne_log_obj(v39, v40);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = *(_QWORD *)(v228 + 56);
        v44 = *(_QWORD *)(v228 + 64);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2112;
        v276 = (uint64_t (*)(uint64_t, uint64_t))v38;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Received UUID %@ for %@ does not match cached UUIDs %@", buf, 0x20u);
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NELaunchServices bundleProxyForIdentifier:uid:plugins:](NELaunchServices, "bundleProxyForIdentifier:uid:plugins:", *(_QWORD *)(v228 + 64), 0, 0));
      v46 = v45;
      if (v45)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "machOUUIDs"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "machOUUIDs"));
        v49 = objc_msgSend(v48, "containsObject:", *(_QWORD *)(v228 + 56));

        if (v49)
        {
          v52 = ne_log_obj(v50, v51);
          v53 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            v54 = *(_QWORD *)(v228 + 56);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v54;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v47;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Received UUID %@ does match launch services UUIDs %@", buf, 0x16u);
          }

        }
      }

    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v276 = sub_100018440;
  v277 = sub_100018450;
  v278 = 0;
  v254 = 0u;
  v255 = 0u;
  v256 = 0u;
  v257 = 0u;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "pathController"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "pathRules"));

  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v254, v274, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v255;
    while (2)
    {
      for (j = 0; j != v57; j = (char *)j + 1)
      {
        if (*(_QWORD *)v255 != v58)
          objc_enumerationMutation(v56);
        v60 = *(void **)(*((_QWORD *)&v254 + 1) + 8 * (_QWORD)j);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "matchSigningIdentifier"));
        v62 = objc_msgSend(v61, "isEqualToString:", *(_QWORD *)(v228 + 64));

        if (v62)
        {
          objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v60);
          goto LABEL_49;
        }
      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v254, v274, 16);
      if (v57)
        continue;
      break;
    }
  }
LABEL_49:

  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "multicastPreferenceSet"))
  {
    v63 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "denyMulticast");
    v65 = (int)v63;
    if ((_DWORD)v63)
    {
      v66 = ne_log_obj(v63, v64);
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        v69 = *(_QWORD *)(v228 + 64);
        v68 = *(_QWORD *)(v228 + 72);
        *(_DWORD *)v280 = 138412546;
        v281 = v68;
        v282 = 2112;
        v283 = v69;
        v70 = "Local network denied by preference for %@ (%@)";
LABEL_60:
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, v70, v280, 0x16u);
      }
    }
    else
    {
      v85 = ne_log_obj(v63, v64);
      v67 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        v87 = *(_QWORD *)(v228 + 64);
        v86 = *(_QWORD *)(v228 + 72);
        *(_DWORD *)v280 = 138412546;
        v281 = v86;
        v282 = 2112;
        v283 = v87;
        v70 = "Local network allowed by preference for %@ (%@)";
        goto LABEL_60;
      }
    }

    sub_100019C0C(*(_QWORD *)(v228 + 32), *(void **)(v228 + 40), v65 != 1, 0);
    goto LABEL_152;
  }
  v71 = *(_QWORD *)(v228 + 32);
  v72 = *(unsigned int *)(v228 + 104);
  v73 = *(id *)(v228 + 64);
  v74 = v73;
  if (!v71)
  {

    goto LABEL_116;
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v73));
  v266 = 0;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v75, &v266));
  v77 = v266;

  if (!v76)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", v72));
    v265 = 0;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v78, &v265));
    v79 = v265;

    v77 = v79;
  }
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "currentState"));
  v81 = objc_msgSend(v80, "isRunning");

  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "currentState"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "endowmentNamespaces"));
  if ((objc_msgSend(v83, "containsObject:", CFSTR("com.apple.frontboard.visibility")) & 1) != 0)
  {
    v84 = 1;
  }
  else
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "currentState"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "endowmentNamespaces"));
    v84 = objc_msgSend(v89, "containsObject:", CFSTR("com.apple.launchservices.userfacing"));

  }
  v92 = ne_log_obj(v90, v91);
  v93 = objc_claimAutoreleasedReturnValue(v92);
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    v166 = "not ";
    if (v81)
      v167 = "";
    else
      v167 = "not ";
    *(_DWORD *)v280 = 138412802;
    v281 = (uint64_t)v74;
    v283 = (uint64_t)v167;
    v282 = 2080;
    if (v84)
      v166 = "";
    v284 = 2080;
    v285 = v166;
    _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "%@ is %srunning, is %sforeground", v280, 0x20u);
  }

  if ((v81 & v84) != 1)
  {

LABEL_116:
    v149 = ne_log_obj(v147, v148);
    v150 = objc_claimAutoreleasedReturnValue(v149);
    if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
    {
      v151 = *(_QWORD *)(v228 + 64);
      *(_DWORD *)v280 = 138412290;
      v281 = v151;
      _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_INFO, "Prompt for %@ denied because app is not in foreground, stopping", v280, 0xCu);
    }

    sub_100019C0C(*(_QWORD *)(v228 + 32), *(void **)(v228 + 40), 0, 16);
    goto LABEL_152;
  }
  v96 = ne_log_obj(v94, v95);
  v97 = objc_claimAutoreleasedReturnValue(v96);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v280 = 138412290;
    v281 = (uint64_t)v74;
    _os_log_debug_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "Allowing alert for %@ that is in foreground", v280, 0xCu);
  }

  v238[0] = _NSConcreteStackBlock;
  v238[1] = 3221225472;
  v238[2] = sub_100019F54;
  v238[3] = &unk_100039408;
  v238[4] = *(_QWORD *)(v228 + 32);
  v239 = *(id *)(v228 + 40);
  v240 = *(id *)(v228 + 80);
  v241 = *(id *)(v228 + 64);
  v242 = *(id *)(v228 + 88);
  v251 = *(_BYTE *)(v228 + 108);
  v243 = *(id *)(v228 + 48);
  v244 = 0;
  v245 = v230;
  v252 = v225;
  v253 = 0;
  v246 = v229;
  v247 = 0;
  v249 = buf;
  v250 = *(_DWORD *)(v228 + 104);
  v248 = v215;
  v98 = objc_retainBlock(v238);
  v214 = v98;
  v100 = *(_QWORD *)(v228 + 32);
  if (v100 && (*(_BYTE *)(v100 + 15) & 1) != 0)
  {
    v152 = sub_100017134((uint64_t)NEHelperConfigurationManager);
    v153 = objc_claimAutoreleasedReturnValue(v152);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A548;
    block[3] = &unk_100039430;
    v233 = v214;
    dispatch_async(v153, block);

    v154 = v233;
    goto LABEL_151;
  }
  v101 = ne_log_obj(v98, v99);
  v102 = objc_claimAutoreleasedReturnValue(v101);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    v104 = *(_QWORD *)(v228 + 64);
    v103 = *(_QWORD *)(v228 + 72);
    *(_DWORD *)v280 = 138412546;
    v281 = v103;
    v282 = 2112;
    v283 = v104;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "Local network preference not yet set, prompting for %@ (%@)", v280, 0x16u);
  }

  if (!objc_opt_class(CWFInterface)
    || !_os_feature_enabled_impl("DeviceAccess", "AccessorySetupKit"))
  {
    v155 = objc_alloc((Class)NEUserNotification);
    v156 = *(_QWORD *)(v228 + 72);
    v157 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v228 + 96) + 8) + 40);
    v158 = sub_100017134((uint64_t)NEHelperConfigurationManager);
    v159 = (void *)objc_claimAutoreleasedReturnValue(v158);
    v154 = objc_msgSend(v155, "initAndShowLocalNetworkAlertWithAppName:reasonString:extensionItem:callbackQueue:callbackHandler:", v156, v157, 0, v159, v214);

    if (v154)
    {
      v162 = ne_log_obj(v160, v161);
      v163 = objc_claimAutoreleasedReturnValue(v162);
      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
      {
        v198 = *(_QWORD *)(v228 + 72);
        v197 = *(_QWORD *)(v228 + 80);
        v199 = *(const char **)(v228 + 64);
        *(_DWORD *)v280 = 138412802;
        v281 = v198;
        v282 = 2112;
        v283 = v197;
        v284 = 2112;
        v285 = v199;
        _os_log_debug_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEBUG, "Displayed prompt for %@ (%@.%@)", v280, 0x20u);
      }

    }
    else
    {
      v164 = ne_log_obj(v160, v161);
      v165 = objc_claimAutoreleasedReturnValue(v164);
      if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
      {
        v201 = *(_QWORD *)(v228 + 72);
        v200 = *(_QWORD *)(v228 + 80);
        v202 = *(const char **)(v228 + 64);
        *(_DWORD *)v280 = 138412802;
        v281 = v201;
        v282 = 2112;
        v283 = v200;
        v284 = 2112;
        v285 = v202;
        _os_log_error_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_ERROR, "Failed to display prompt for %@ (%@.%@), prompt already in progress or not supported", v280, 0x20u);
      }

      sub_100019C0C(*(_QWORD *)(v228 + 32), *(void **)(v228 + 40), 0, 36);
      v154 = 0;
    }
    goto LABEL_151;
  }
  v105 = objc_alloc_init((Class)CWFInterface);
  objc_msgSend(v105, "activate");
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "knownNetworkInfoForLocalNetworkPromptWithOptions:", 0));
  v108 = ne_log_obj(v106, v107);
  v109 = objc_claimAutoreleasedReturnValue(v108);
  v211 = v105;
  if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v280 = 138412290;
    v281 = (uint64_t)v106;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "local network wifiInfo: %@", v280, 0xCu);
  }
  v213 = v106;

  v110 = NEResourcesCopyDeviceLocalizedNSString(CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_MESSAGE"), CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_MESSAGE"));
  v212 = (void *)objc_claimAutoreleasedReturnValue(v110);
  v111 = v106;
  if (!v106)
  {
    v168 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\n%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v228 + 96) + 8) + 40), v212));
    v154 = 0;
    v169 = *(_QWORD *)(*(_QWORD *)(v228 + 96) + 8);
    v170 = *(void **)(v169 + 40);
    *(_QWORD *)(v169 + 40) = v168;
    goto LABEL_143;
  }
  v112 = objc_msgSend(v106, "mutableCopy");
  v113 = CWFLocalNetworkMapCalloutsKey;
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKeyedSubscript:", CWFLocalNetworkMapCalloutsKey));
  v222 = objc_msgSend(v114, "mutableCopy");
  v236 = 0u;
  v237 = 0u;
  v234 = 0u;
  v235 = 0u;
  v115 = v114;
  v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v234, v273, 16);
  obj = v115;
  v209 = v113;
  v210 = v112;
  if (!v116)
  {
    v218 = 0;
    v118 = 0;
    v119 = 0;
    goto LABEL_135;
  }
  v218 = 0;
  v118 = 0;
  v119 = 0;
  v221 = *(_QWORD *)v235;
  v226 = CWFLocalNetworkMapDeviceCountKey;
  v224 = CWFLocalNetworkMapDeviceNamesKey;
  v216 = CWFLocalNetworkMapTitleKey;
  do
  {
    v223 = v116;
    for (k = 0; k != v223; k = (char *)k + 1)
    {
      if (*(_QWORD *)v235 != v221)
        objc_enumerationMutation(obj);
      v121 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * (_QWORD)k);
      v122 = ne_log_obj(v116, v117);
      v123 = objc_claimAutoreleasedReturnValue(v122);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v280 = 138412290;
        v281 = (uint64_t)v121;
        _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "callout: %@", v280, 0xCu);
      }

      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", v226));
      if (v124)
      {
        v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", v226));
        v126 = (uint64_t)objc_msgSend(v125, "integerValue");
        if (v126 >= 50)
          v127 = 50;
        else
          v127 = v126;

      }
      else
      {
        v127 = 0;
      }
      v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", v224));

      if (v128
        && (v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", v224)),
            v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "firstObject")),
            v129,
            v130))
      {
        v131 = NEResourcesCopyDeviceLocalizedFormatString(0, CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES"));
        v132 = (void *)objc_claimAutoreleasedReturnValue(v131);
        v133 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v132, v130));

        if (v127 <= 0)
        {
          v138 = 0;
          v218 = 1;
          goto LABEL_103;
        }
        v134 = CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_COUNT_AND_PLURAL");
        if (v127 == 1)
          v134 = CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_COUNT_AND");
        v218 = 1;
      }
      else
      {
        if (v127 <= 0)
        {
          v133 = 0;
          v130 = 0;
          v138 = 0;
          goto LABEL_103;
        }
        v130 = 0;
        v133 = 0;
        v134 = CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_COUNT_PLURAL");
        if (v127 == 1)
          v134 = CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_COUNT");
      }
      v135 = v134;
      v136 = NEResourcesCopyDeviceLocalizedFormatString(0, v135);
      v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
      v138 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v137, v127));
      if (v127 > v119)
        v119 = v127;

      v118 = 1;
LABEL_103:
      if (!(v133 | v138))
        goto LABEL_112;
      v139 = objc_msgSend(v121, "mutableCopy");
      v140 = v139;
      if (v133)
      {
        objc_msgSend(v139, "setObject:forKey:", v133, CFSTR("mapLabelCalloutSubtitleKey"));
        v141 = CFSTR("mapLabelCalloutSubtitle2Key");
        if (!v138)
          goto LABEL_109;
LABEL_108:
        objc_msgSend(v140, "setObject:forKey:", v138, v141);
        goto LABEL_109;
      }
      v141 = CFSTR("mapLabelCalloutSubtitleKey");
      if (v138)
        goto LABEL_108;
LABEL_109:
      objc_msgSend(v222, "removeObject:", v121, v141);
      v142 = objc_msgSend(v222, "addObject:", v140);
      v144 = ne_log_obj(v142, v143);
      v145 = objc_claimAutoreleasedReturnValue(v144);
      if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
      {
        v146 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", v216));
        *(_DWORD *)v280 = 138412802;
        v281 = v133;
        v282 = 2112;
        v283 = v138;
        v284 = 2112;
        v285 = v146;
        _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_INFO, "local network name='%@' count='%@' for title='%@'", v280, 0x20u);

      }
LABEL_112:

    }
    v115 = obj;
    v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v234, v273, 16);
  }
  while (v116);
LABEL_135:

  objc_msgSend(v210, "setObject:forKey:", v222, v209);
  v272[0] = v210;
  v271[0] = CFSTR("kTCCNotificationExtensionClientDataKey");
  v271[1] = CFSTR("kTCCNotificationExtensionDaemonDataKey");
  v269 = CFSTR("kTCCNotificationExtensionDaemonDataInfoString");
  v270 = v212;
  v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v270, &v269, 1));
  v272[1] = v171;
  v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v272, v271, 2));

  v154 = objc_alloc_init((Class)NSExtensionItem);
  v173 = objc_msgSend(v154, "setUserInfo:", v172);
  v175 = ne_log_obj(v173, v174);
  v176 = objc_claimAutoreleasedReturnValue(v175);
  if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
  {
    v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "userInfo"));
    *(_DWORD *)v280 = 138412546;
    v281 = (uint64_t)v154;
    v282 = 2112;
    v283 = (uint64_t)v177;
    _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_INFO, "created extensionItem='%@' with userInfo='%@'", v280, 0x16u);

  }
  v267[0] = CFSTR("deviceCount");
  v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v119));
  v268[0] = v178;
  v267[1] = CFSTR("networkCount");
  if (obj)
    v179 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count")));
  else
    v179 = &off_10003E9D8;
  v268[1] = v179;
  v267[2] = CFSTR("deviceNamesPresent");
  v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v218 & 1));
  v268[2] = v180;
  v267[3] = CFSTR("deviceCountsPresent");
  v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v118 & 1));
  v268[3] = v181;
  v182 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v268, v267, 4));
  v183 = *(_QWORD *)(v228 + 32);
  v184 = *(void **)(v183 + 88);
  *(_QWORD *)(v183 + 88) = v182;

  if (obj)
  v170 = v210;
LABEL_143:

  v185 = objc_alloc((Class)NEUserNotification);
  v186 = *(_QWORD *)(v228 + 72);
  v187 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v228 + 96) + 8) + 40);
  v188 = sub_100017134((uint64_t)NEHelperConfigurationManager);
  v189 = (void *)objc_claimAutoreleasedReturnValue(v188);
  v190 = objc_msgSend(v185, "initAndShowLocalNetworkAlertWithAppName:reasonString:extensionItem:callbackQueue:callbackHandler:", v186, v187, v154, v189, v214);

  if (v190)
  {
    v193 = ne_log_obj(v191, v192);
    v194 = objc_claimAutoreleasedReturnValue(v193);
    if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG))
    {
      v204 = *(_QWORD *)(v228 + 72);
      v203 = *(_QWORD *)(v228 + 80);
      v205 = *(const char **)(v228 + 64);
      *(_DWORD *)v280 = 138412802;
      v281 = v204;
      v282 = 2112;
      v283 = v203;
      v284 = 2112;
      v285 = v205;
      _os_log_debug_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_DEBUG, "Displayed prompt for %@ (%@.%@)", v280, 0x20u);
    }

  }
  else
  {
    v195 = ne_log_obj(v191, v192);
    v196 = objc_claimAutoreleasedReturnValue(v195);
    if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
    {
      v207 = *(_QWORD *)(v228 + 72);
      v206 = *(_QWORD *)(v228 + 80);
      v208 = *(const char **)(v228 + 64);
      *(_DWORD *)v280 = 138412802;
      v281 = v207;
      v282 = 2112;
      v283 = v206;
      v284 = 2112;
      v285 = v208;
      _os_log_error_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_ERROR, "Failed to display prompt for %@ (%@.%@), prompt already in progress or not supported", v280, 0x20u);
    }

    sub_100019C0C(*(_QWORD *)(v228 + 32), *(void **)(v228 + 40), 0, 36);
  }

LABEL_151:
LABEL_152:
  _Block_object_dispose(buf, 8);

LABEL_153:
}

void sub_100019B50(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x420], 8);
  _Unwind_Resume(a1);
}

void sub_100019C0C(uint64_t a1, void *a2, _BOOL4 a3, int64_t a4)
{
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *i;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  char *v30;
  _BYTE v31[128];

  v7 = a2;
  v9 = v7;
  if (a1)
  {
    if (a4)
    {
      v10 = 0;
    }
    else
    {
      v7 = (char *)xpc_BOOL_create(a3);
      v10 = v7;
    }
    v11 = ne_log_obj(v7, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v9;
      v29 = 1024;
      LODWORD(v30) = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Draining local network replies for %@ with allowed: %u", buf, 0x12u);
    }

    v14 = qword_100042C90;
    if (qword_100042C90)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100042C90, "objectForKeyedSubscript:", v9));
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = (char *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v15);
            sub_1000037E4((uint64_t)NEHelperServer, *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), a4, v10);
          }
          v18 = &v17[(_QWORD)v18];
          v17 = (char *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v15, "removeAllObjects");
      objc_msgSend((id)qword_100042C90, "setObject:forKeyedSubscript:", 0, v9);

    }
    else
    {
      v18 = 0;
    }
    v21 = ne_log_obj(v14, v13);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v28 = v18;
      v29 = 2112;
      v30 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Drained %llu local network replies for %@", buf, 0x16u);
    }

  }
}

void sub_100019E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v4 = ne_log_obj(a1, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to remove duplicate %{public}@ configuration with error %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removed duplicate %{public}@ configuration", (uint8_t *)&v10, 0xCu);
  }

}

void sub_100019F54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  id v7;
  id v8;
  void *v9;
  id Property;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  void *v19;
  const char *v20;
  id v21;
  _QWORD *v22;
  void *v23;
  id v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  BOOL v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  int v71;
  char v72;
  char v73;
  BOOL v74;
  uint8_t buf[4];
  id v76;

  v2 = a2;
  v4 = ne_log_obj(a1, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v76) = v2 == 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User responded with local network: %u", buf, 8u);
  }

  v7 = *(id *)(a1 + 32);
  if (!v7)
  {
    v59 = 0;
LABEL_15:
    v58 = 0;
    goto LABEL_16;
  }
  v8 = objc_getProperty(v7, v6, 88, 1);
  if (v8)
  {
    v9 = v8;
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v6, 88, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectForKey:", CFSTR("deviceCount")));
    v12 = objc_msgSend(v11, "integerValue");

  }
  else
  {
    v12 = 0;
  }
  v7 = *(id *)(a1 + 32);
  v59 = v12;
  if (!v7)
    goto LABEL_15;
  v13 = objc_getProperty(v7, v6, 88, 1);
  v7 = *(id *)(a1 + 32);
  if (!v13)
    goto LABEL_15;
  if (v7)
    v7 = objc_getProperty(v7, v6, 88, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("networkCount")));
  v58 = objc_msgSend(v14, "integerValue");

  v7 = *(id *)(a1 + 32);
LABEL_16:
  v15 = objc_getProperty(v7, v6, 88, 1);
  if (v15)
  {
    v17 = v15;
    v18 = *(id *)(a1 + 32);
    if (v18)
      v18 = objc_getProperty(v18, v16, 88, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("deviceNamesPresent")));
    v57 = objc_msgSend(v19, "BOOLValue");

  }
  else
  {
    v57 = 0;
  }
  v21 = objc_getProperty(*(id *)(a1 + 32), v16, 88, 1);
  v22 = *(_QWORD **)(a1 + 32);
  if (v21)
  {
    if (v22)
      v22 = objc_getProperty(v22, v20, 88, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("deviceCountsPresent")));
    v24 = objc_msgSend(v23, "BOOLValue");

    v22 = *(_QWORD **)(a1 + 32);
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)v22[11];
  v22[11] = 0;

  if (*(_QWORD *)(a1 + 32))
  {
    v56 = v2;
    v26 = v2 == 0;
    v27 = *(unsigned __int8 *)(a1 + 132);
    v28 = *(void **)(a1 + 56);
    v30 = *(void **)(a1 + 40);
    v29 = *(void **)(a1 + 48);
    v31 = *(id *)(a1 + 64);
    v32 = v28;
    v33 = v29;
    v34 = v30;
    v35 = objc_alloc_init((Class)NSMutableDictionary);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v26));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, CFSTR("allowed"));

    objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("identifier"));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, CFSTR("teamID"));

    objc_msgSend(v35, "setObject:forKeyedSubscript:", v32, CFSTR("bundleID"));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v31, CFSTR("query"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v31 != 0));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("hasQuery"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v27));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, CFSTR("hasEntitlement"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v59));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v39, CFSTR("nearbyGenericBonjourDeviceCount"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v58));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, CFSTR("networkCount"));

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v57));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v41, CFSTR("deviceNamesPresent"));

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v24));
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, CFSTR("deviceCountsPresent"));

    v45 = ne_log_obj(v43, v44);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v35;
      _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Local network decision: %@", buf, 0xCu);
    }

    AnalyticsSendEvent(CFSTR("com.apple.network.localnetworkdecision"), v35);
    v2 = v56;
  }
  v47 = v2 == 0;
  v48 = *(void **)(a1 + 72);
  v49 = sub_100017134((uint64_t)NEHelperConfigurationManager);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10001A55C;
  v60[3] = &unk_1000393E0;
  v51 = *(id *)(a1 + 80);
  v52 = *(_QWORD *)(a1 + 32);
  v53 = *(void **)(a1 + 40);
  v61 = v51;
  v62 = v52;
  v63 = v53;
  v64 = *(id *)(a1 + 88);
  v72 = *(_BYTE *)(a1 + 133);
  v65 = *(id *)(a1 + 96);
  v66 = *(id *)(a1 + 56);
  v73 = *(_BYTE *)(a1 + 134);
  v54 = *(id *)(a1 + 104);
  v55 = *(_QWORD *)(a1 + 120);
  v67 = v54;
  v70 = v55;
  v71 = *(_DWORD *)(a1 + 128);
  v74 = v47;
  v68 = *(id *)(a1 + 72);
  v69 = *(id *)(a1 + 112);
  objc_msgSend(v48, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, 0, v50, v60);

}

uint64_t sub_10001A548(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001A55C(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  uint64_t v74;
  id v75;
  char v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  int v88;
  int buffer;
  id v90;
  id v91;
  _BYTE v92[128];
  _BYTE v93[128];

  v8 = a2;
  v9 = a3;
  v10 = a5;
  v12 = v10;
  v71 = a1;
  if (*(_QWORD *)(a1 + 32))
  {
    v13 = ne_log_obj(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      buffer = 138543362;
      v90 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to re-load configurations with error %{public}@", (uint8_t *)&buffer, 0xCu);
    }

    sub_100019C0C(*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), 0, 22);
    goto LABEL_49;
  }
  v15 = *(id *)(a1 + 56);
  v65 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Signature")));

  v66 = v9;
  v67 = v8;
  v64 = v19;
  if (!*(_BYTE *)(a1 + 116) && (objc_msgSend(v19, "isEqualToData:", *(_QWORD *)(a1 + 64)) & 1) == 0)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    if (v21)
    {
      v22 = v21;
      v68 = v15;
      v8 = *(id *)v82;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(id *)v82 != v8)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "identifier"));
          v27 = objc_msgSend(v25, "isEqual:", v26);

          if (v27)
          {
            v15 = v24;

            goto LABEL_17;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
        if (v22)
          continue;
        break;
      }
      v15 = v68;
    }
LABEL_17:

  }
  v69 = v15;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pathController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "pathRules"));
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
  if (!v29)
    goto LABEL_41;
  v30 = v29;
  v31 = *(_QWORD *)v78;
  v70 = *(_QWORD *)v78;
  while (2)
  {
    for (j = 0; j != v30; j = (char *)j + 1)
    {
      if (*(_QWORD *)v78 != v31)
        objc_enumerationMutation(v28);
      v33 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "matchSigningIdentifier"));
      if (!objc_msgSend(v34, "isEqualToString:", *(_QWORD *)(v71 + 72)))
        goto LABEL_28;
      v35 = *(unsigned __int8 *)(v71 + 117);
      if (*(_BYTE *)(v71 + 117))
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "matchPath"));
        if ((objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(v71 + 80)) & 1) != 0)
          goto LABEL_38;
        if (*(_BYTE *)(v71 + 117))
        {

LABEL_28:
          continue;
        }
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "matchPath"));
      v37 = v36;
      if (!v36 || !*(_QWORD *)(v71 + 80))
      {

        if (v35)
LABEL_38:

LABEL_40:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v71 + 104) + 8) + 40), v33);
        goto LABEL_41;
      }
      v38 = v28;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "matchPath"));
      v40 = objc_msgSend(v39, "isEqualToString:", *(_QWORD *)(v71 + 80));

      if (v35)
      v28 = v38;
      v31 = v70;
      if ((v40 & 1) != 0)
        goto LABEL_40;
    }
    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    if (v30)
      continue;
    break;
  }
LABEL_41:

  v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(v71 + 104) + 8) + 40);
  v9 = v66;
  if (!v41)
  {
    v42 = objc_msgSend(objc_alloc((Class)NEPathRule), "initWithSigningIdentifier:", *(_QWORD *)(v71 + 72));
    objc_msgSend(v42, "setAllowEmptyDesignatedRequirement:", 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "pathRules"));

    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "pathRules"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "arrayByAddingObject:", v42));
      objc_msgSend(v63, "setPathRules:", v45);

    }
    else
    {
      v91 = v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v91, 1));
      objc_msgSend(v63, "setPathRules:", v44);
    }

    if (*(_QWORD *)(v71 + 80))
    {
      objc_msgSend(v42, "setMatchPath:");
    }
    else
    {
      v55 = *(_DWORD *)(v71 + 112);
      if (v55)
      {
        bzero(&buffer, 0x400uLL);
        if ((proc_pidpath(v55, &buffer, 0x400u) & 0x80000000) == 0)
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &buffer));
          objc_msgSend(v42, "setMatchPath:", v56);

          v59 = ne_log_obj(v57, v58);
          v60 = objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "matchPath"));
            v62 = *(_DWORD *)(v71 + 112);
            *(_DWORD *)buf = 138412546;
            v86 = v61;
            v87 = 1024;
            v88 = v62;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Found path %@ for PID %d", buf, 0x12u);

          }
        }
      }
    }
    v46 = *(_QWORD *)(*(_QWORD *)(v71 + 104) + 8);
    v47 = *(void **)(v46 + 40);
    *(_QWORD *)(v46 + 40) = v42;

    v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(v71 + 104) + 8) + 40);
  }
  objc_msgSend(v41, "setDenyMulticast:", *(_BYTE *)(v71 + 118) == 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v71 + 104) + 8) + 40), "setMulticastPreferenceSet:", 1);
  v48 = *(void **)(v71 + 88);
  v49 = *(_QWORD *)(v71 + 96);
  v50 = sub_100017134((uint64_t)NEHelperConfigurationManager);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10001AC20;
  v72[3] = &unk_1000393B8;
  v52 = *(_QWORD *)(v71 + 40);
  v53 = *(void **)(v71 + 48);
  v73 = v69;
  v74 = v52;
  v75 = v53;
  v76 = *(_BYTE *)(v71 + 118);
  v54 = v69;
  objc_msgSend(v48, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:", v54, v64, v49, 0, v51, v72);

  v8 = v67;
  v12 = v65;
LABEL_49:

}

void sub_10001AC20(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;

  v3 = a2;
  v5 = ne_log_obj(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v3;
      v16 = 2114;
      v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to save configuration with error %{public}@ for %{public}@", (uint8_t *)&v14, 0x16u);
    }

    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v10 = 0;
    v11 = 94;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v12 = *(unsigned __int8 *)(a1 + 56);
      v14 = 67109120;
      LODWORD(v15) = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Got local network response: %u, delivering reply", (uint8_t *)&v14, 8u);
    }

    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v10 = *(unsigned __int8 *)(a1 + 56);
    v11 = 0;
  }
  sub_100019C0C(v8, v9, v10, v11);

}

void sub_10001AD54(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("show-local-network-alert", v4);
  v3 = (void *)qword_100042C70;
  qword_100042C70 = (uint64_t)v2;

}

void sub_10001ADA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  unint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  unint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  BOOL v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  char v62;
  BOOL v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  unint64_t v80;

  v3 = ne_log_obj(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Installing default local network access policies", buf, 2u);
  }

  v55 = a1;
  if (*(_BYTE *)(a1 + 48))
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v6 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    v5 = (unint64_t)*(id *)(a1 + 40);
  }
  v54 = (void *)v5;
  v53 = (v6 | v5) == 0;
  if (!(v6 | v5))
  {
    objc_opt_self(NEHelperConfigurationManager);
    v6 = (unint64_t)objc_alloc_init((Class)NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
    if (!v8)
      goto LABEL_25;
    v9 = v8;
    v10 = *(_QWORD *)v74;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v74 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v11);
        if (objc_msgSend(v12, "developerType") == 1)
        {
          v13 = objc_msgSend(v12, "isAppStoreVendable");
          if (objc_msgSend(v12, "developerType") != 1)
          {
            if (v13)
              goto LABEL_19;
            goto LABEL_20;
          }
          v14 = v13 ^ 1;
        }
        else
        {
          if (objc_msgSend(v12, "developerType") != 1)
            goto LABEL_19;
          v14 = 0;
        }
        if ((objc_msgSend(v12, "isDeletableSystemApplication") & 1) == 0 && (v14 & 1) == 0)
        {
LABEL_19:
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
          objc_msgSend((id)v6, "addObject:", v15);

        }
LABEL_20:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
      v9 = v16;
      if (!v16)
      {
LABEL_25:

        v17 = ne_log_large_obj();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v6;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "All user apps: %@", buf, 0xCu);
        }

        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v19 = (id)qword_100042CA0;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(_QWORD *)v70 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend((id)v6, "containsObject:", v24) & 1) == 0)
              {
                v25 = objc_alloc((Class)LSApplicationRecord);
                v68 = 0;
                v26 = objc_msgSend(v25, "initWithBundleIdentifier:allowPlaceholder:error:", v24, 0, &v68);
                v27 = v68;
                v29 = ne_log_obj(v27, v28);
                v30 = objc_claimAutoreleasedReturnValue(v29);
                v31 = v30;
                if (v26)
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v80 = v24;
                    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Deny-listing %@", buf, 0xCu);
                  }

                  objc_msgSend((id)v6, "addObject:", v24);
                }
                else
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v80 = v24;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Not deny-listing %@, not installed yet", buf, 0xCu);
                  }

                }
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
          }
          while (v21);
        }

        break;
      }
    }
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v32 = (id)qword_100042C98;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(_QWORD *)v65 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j);
        v38 = objc_msgSend((id)v6, "containsObject:", v37);
        if ((_DWORD)v38)
        {
          v40 = ne_log_obj(v38, v39);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v37;
            _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Allow-listing %@", buf, 0xCu);
          }

          objc_msgSend((id)v6, "removeObject:", v37);
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    }
    while (v34);
  }

  v42 = NEGetRootUUID();
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager networkPrivacyConfigurationName](NEConfigurationManager, "networkPrivacyConfigurationName"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v46 = sub_100017134((uint64_t)NEHelperConfigurationManager);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10001B3DC;
  v56[3] = &unk_1000395F8;
  v57 = v44;
  v58 = v45;
  v62 = *(_BYTE *)(v55 + 48);
  v63 = v53;
  v59 = (id)v6;
  v60 = v54;
  v61 = v43;
  v48 = v43;
  v49 = v54;
  v50 = (id)v6;
  v51 = v45;
  v52 = v44;
  objc_msgSend(v51, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, 0, v47, v56);

}

void sub_10001B3DC(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _UNKNOWN **v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  const char *v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  NSObject *v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  unsigned __int8 v83;
  id v84;
  uint64_t v85;
  char v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  NSObject *v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  void *v98;
  id v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  NSObject *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  id v113;
  NSObject *log;
  id obj;
  void *v116;
  uint64_t v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  uint64_t v122;
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[4];
  id v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint8_t v151[128];
  uint8_t buf[4];
  id v153;
  __int16 v154;
  id v155;
  _BYTE v156[128];

  v8 = a2;
  v9 = a3;
  v10 = a5;
  v118 = v10;
  if (!v9)
  {
    v111 = 0;
    v13 = objc_alloc_init((Class)NSMutableArray);
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v113 = v8;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v144, v156, 16);
    if (v15)
    {
      v16 = v15;
      v123 = v13;
      v17 = 0;
      v18 = *(_QWORD *)v145;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v145 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name", v111));
          v22 = objc_msgSend(v21, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v22)
          {
            if (v17)
            {
              v25 = ne_log_obj(v23, v24);
              v26 = objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v31 = *(void **)(a1 + 32);
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
                *(_DWORD *)buf = 138543618;
                v153 = v31;
                v154 = 2114;
                v155 = v32;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Found a duplicate %{public}@ configuration %{public}@, removing", buf, 0x16u);

              }
              v27 = *(void **)(a1 + 40);
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
              v29 = sub_100017134((uint64_t)NEHelperConfigurationManager);
              v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              v141[0] = _NSConcreteStackBlock;
              v141[1] = 3221225472;
              v141[2] = sub_10001BFE8;
              v141[3] = &unk_1000392C8;
              v142 = *(id *)(a1 + 32);
              v143 = 0;
              objc_msgSend(v27, "removeConfigurationFromDisk:completionQueue:completionHandler:", v28, v30, v141);

            }
            else
            {
              v17 = v20;
            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v144, v156, 16);
      }
      while (v16);

      v13 = v123;
      if (v17)
        goto LABEL_21;
    }
    else
    {

    }
    v17 = objc_msgSend(objc_alloc((Class)NEConfiguration), "initWithName:grade:", *(_QWORD *)(a1 + 32), 2);
    if (!v17)
    {
LABEL_22:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathController](v17, "pathController", v111));

      if (!v33)
      {
        v34 = objc_alloc_init((Class)NEPathController);
        -[NSObject setPathController:](v17, "setPathController:", v34);

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathController](v17, "pathController"));
      objc_msgSend(v35, "setEnabled:", 1);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathController](v17, "pathController"));
      objc_msgSend(v36, "setIgnoreRouteRules:", 1);

      log = v17;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathController](v17, "pathController"));
      objc_msgSend(v37, "setIgnoreFallback:", 1);

      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      obj = v13;
      v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v151, 16);
      if (!v119)
      {
LABEL_95:

        v9 = v112;
        v8 = v113;
        goto LABEL_96;
      }
      v117 = *(_QWORD *)v138;
      v38 = &AnalyticsSendEvent_ptr;
LABEL_26:
      v39 = 0;
      while (1)
      {
        if (*(_QWORD *)v138 != v117)
          objc_enumerationMutation(obj);
        v122 = v39;
        v40 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties")));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", v42));
        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Signature")));

        v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pathController"));
        v44 = objc_alloc_init((Class)NSMutableArray);
        if (!*(_BYTE *)(a1 + 72))
        {
          v45 = objc_alloc_init((Class)NSMutableArray);
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pathController"));
          v133 = 0u;
          v134 = 0u;
          v135 = 0u;
          v136 = 0u;
          v116 = v46;
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "pathRules"));
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v133, v150, 16);
          if (!v48)
            goto LABEL_52;
          v49 = v48;
          v50 = *(_QWORD *)v134;
          while (1)
          {
            v51 = 0;
            do
            {
              if (*(_QWORD *)v134 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)v51);
              if (objc_msgSend(v52, "isDefaultPathRule"))
              {
                objc_msgSend(v44, "addObject:", v52);
                goto LABEL_47;
              }
              if (*(_BYTE *)(a1 + 73))
              {
                v53 = *(void **)(a1 + 48);
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "matchSigningIdentifier"));
                LOBYTE(v53) = objc_msgSend(v53, "containsObject:", v54);

                if ((v53 & 1) == 0)
                {
                  v68 = ne_log_obj(v55, v56);
                  v63 = objc_claimAutoreleasedReturnValue(v68);
                  if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                    goto LABEL_45;
                  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "matchSigningIdentifier"));
                  *(_DWORD *)buf = 138412290;
                  v153 = v64;
                  v65 = v63;
                  v66 = "Removing rule for %@, not found";
                  goto LABEL_50;
                }
              }
              v57 = *(void **)(a1 + 56);
              if (v57)
              {
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "matchSigningIdentifier"));
                v59 = objc_msgSend(v57, "containsObject:", v58);

                if (v59)
                {
                  v62 = ne_log_obj(v60, v61);
                  v63 = objc_claimAutoreleasedReturnValue(v62);
                  if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                  {
LABEL_45:

                    goto LABEL_46;
                  }
                  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "matchSigningIdentifier"));
                  *(_DWORD *)buf = 138412290;
                  v153 = v64;
                  v65 = v63;
                  v66 = "Removing rule for %@, uninstalled";
LABEL_50:
                  _os_log_debug_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, v66, buf, 0xCu);

                  goto LABEL_45;
                }
              }
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "matchSigningIdentifier"));
              objc_msgSend(v45, "addObject:", v67);

              objc_msgSend(v44, "addObject:", v52);
LABEL_46:
              v38 = &AnalyticsSendEvent_ptr;
LABEL_47:
              v51 = (char *)v51 + 1;
            }
            while (v49 != v51);
            v69 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v133, v150, 16);
            v49 = v69;
            if (!v69)
            {
LABEL_52:

              v70 = ne_log_large_obj();
              v71 = objc_claimAutoreleasedReturnValue(v70);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v153 = v45;
                _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Existing apps: %@", buf, 0xCu);
              }

              objc_msgSend(*(id *)(a1 + 48), "removeObjectsInArray:", v45);
              break;
            }
          }
        }
        v72 = ne_log_large_obj();
        v73 = objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          v110 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412290;
          v153 = v110;
          _os_log_debug_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "Apps for which we need a policy: %@", buf, 0xCu);
        }

        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        v74 = *(id *)(a1 + 48);
        v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v129, v149, 16);
        if (v75)
          break;
LABEL_82:

        v94 = objc_msgSend(v120, "setPathRules:", v44);
        v96 = ne_log_obj(v94, v95);
        v97 = objc_claimAutoreleasedReturnValue(v96);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "Final rule list:", buf, 2u);
        }

        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "pathRules"));
        v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
        if (v99)
        {
          v101 = v99;
          v102 = *(_QWORD *)v125;
          do
          {
            v103 = 0;
            do
            {
              if (*(_QWORD *)v125 != v102)
                objc_enumerationMutation(v98);
              v104 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)v103);
              v105 = ne_log_obj(v99, v100);
              v106 = objc_claimAutoreleasedReturnValue(v105);
              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v153 = v104;
                _os_log_debug_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v103 = (char *)v103 + 1;
            }
            while (v101 != v103);
            v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
            v101 = v99;
          }
          while (v99);
        }

        v107 = *(void **)(a1 + 40);
        v108 = sub_100017134((uint64_t)NEHelperConfigurationManager);
        v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
        objc_msgSend(v107, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:");

        v39 = v122 + 1;
        v38 = &AnalyticsSendEvent_ptr;
        if ((id)(v122 + 1) == v119)
        {
          v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v151, 16);
          if (!v119)
            goto LABEL_95;
          goto LABEL_26;
        }
      }
      v76 = v75;
      v77 = *(_QWORD *)v130;
LABEL_59:
      v78 = 0;
      while (1)
      {
        if (*(_QWORD *)v130 != v77)
          objc_enumerationMutation(v74);
        v79 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v78);
        if (*(_BYTE *)(a1 + 73)
          || (objc_msgSend((id)qword_100042CA0, "containsObject:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * v78)) & 1) != 0)
        {
          goto LABEL_72;
        }
        v80 = objc_alloc((Class)LSApplicationRecord);
        v128 = 0;
        v81 = objc_msgSend(v80, "initWithBundleIdentifier:allowPlaceholder:error:", v79, 0, &v128);
        v82 = v128;
        if (objc_msgSend(v81, "developerType") == 1)
        {
          v83 = objc_msgSend(v81, "isAppStoreVendable");
          v84 = objc_msgSend(v81, "developerType");
          if ((_DWORD)v84 == 1)
          {
            v86 = v83 ^ 1;
LABEL_69:
            v84 = objc_msgSend(v81, "isDeletableSystemApplication");
            if ((v84 & 1) != 0 || (v86 & 1) != 0)
            {
LABEL_78:
              v91 = ne_log_obj(v84, v85);
              v92 = objc_claimAutoreleasedReturnValue(v91);
              if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v153 = v79;
                _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "Ignoring local network rule for %@, not eligible", buf, 0xCu);
              }

              v38 = &AnalyticsSendEvent_ptr;
              goto LABEL_75;
            }
            goto LABEL_71;
          }
          if ((v83 & 1) == 0)
            goto LABEL_78;
        }
        else if (objc_msgSend(v81, "developerType") == 1)
        {
          v86 = 0;
          goto LABEL_69;
        }
LABEL_71:

        v38 = &AnalyticsSendEvent_ptr;
LABEL_72:
        v82 = objc_msgSend(objc_alloc((Class)v38[77]), "initWithSigningIdentifier:", v79);
        objc_msgSend(v82, "setAllowEmptyDesignatedRequirement:", 1);
        objc_msgSend(v82, "setDenyMulticast:", 1);
        v87 = objc_msgSend(v82, "setMulticastPreferenceSet:", 0);
        v89 = ne_log_obj(v87, v88);
        v90 = objc_claimAutoreleasedReturnValue(v89);
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v153 = v79;
          v154 = 2112;
          v155 = v82;
          _os_log_debug_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEBUG, "Created path rule for %@: %@", buf, 0x16u);
        }

        objc_msgSend(v44, "addObject:", v82);
LABEL_75:

        if (v76 == (id)++v78)
        {
          v93 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v129, v149, 16);
          v76 = v93;
          if (!v93)
            goto LABEL_82;
          goto LABEL_59;
        }
      }
    }
LABEL_21:
    objc_msgSend(v13, "insertObject:atIndex:", v17, 0, v111);
    goto LABEL_22;
  }
  v12 = ne_log_obj(v10, v11);
  log = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v153 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to load configurations with error %@", buf, 0xCu);
  }
LABEL_96:

}

void sub_10001BFE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v4 = ne_log_obj(a1, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to remove duplicate %{public}@ configuration with error %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removed duplicate %{public}@ configuration", (uint8_t *)&v10, 0xCu);
  }

}

void sub_10001C0F0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = ne_log_obj(v3, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save configuration with error %@ for %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Saved configuration successfully", (uint8_t *)&v10, 2u);
  }

}

void sub_10001C1F8(id a1)
{
  void *v1;
  void *v2;

  v1 = (void *)qword_100042C98;
  qword_100042C98 = (uint64_t)&off_10003FD00;

  v2 = (void *)qword_100042CA0;
  qword_100042CA0 = (uint64_t)&off_10003FD18;

}

void sub_10001C234(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  const __CFString *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  BOOL *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v36 = a2;
  v5 = objc_opt_class(LSApplicationProxy);
  if ((objc_opt_isKindOfClass(v36, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "plugInKitPlugins"));
    v7 = *(void **)(a1 + 32);
    v8 = v36;
    v9 = v6;
    v10 = v7;
    objc_opt_self(NEHelperConfigurationManager);
    v11 = objc_msgSend(v8, "entitlementValueForKey:ofClass:", CFSTR("com.apple.networking.vpn.configuration"), objc_opt_class(NSArray));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (isa_nsarray(v12)
      && objc_msgSend(v12, "count")
      && (!v10 || objc_msgSend(v12, "containsObject:", v10)))
    {
      v30 = v12;
      v31 = v10;
      v32 = v8;
      v34 = a1;
      v35 = a3;
      v29 = objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple."));
      v13 = objc_alloc_init((Class)NSMutableDictionary);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v33 = v9;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "protocol"));
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.networkextension.app-proxy"));

            v22 = CFSTR("HasAppProxy");
            if ((v21 & 1) == 0)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "protocol"));
              v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.networkextension.packet-tunnel"));

              v22 = CFSTR("HasPacketTunnel");
              if (!v24)
                continue;
            }
            objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v22);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v16);
      }

      if (v29 && !objc_msgSend(v13, "count"))
      {
        v26 = v13;
        v13 = 0;
        a1 = v34;
        a3 = v35;
        v8 = v32;
        v9 = v33;
        v12 = v30;
      }
      else
      {
        v8 = v32;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bundleIdentifier"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("PluginType"));

        v12 = v30;
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("LegacyPluginTypes"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedName"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("AppName"));
        a1 = v34;
        a3 = v35;
        v9 = v33;
      }

      v10 = v31;
    }
    else
    {
      v13 = 0;
    }

    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v13;

  }
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;

}

void sub_10001C57C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int64_t int64;
  xpc_object_t value;
  void *v7;
  uint64_t v8;
  void *v9;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64 = xpc_dictionary_get_int64(xdict, "result-code");
    value = xpc_dictionary_get_value(xdict, "result-data");
    v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    v4 = v7;
    if (!int64 && v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_endpoint)
    {
      sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, v4);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

      goto LABEL_5;
    }
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
LABEL_5:

}

void sub_10001C66C(uint64_t a1, const char *a2)
{
  void *v4;
  id Property;

  v4 = *(void **)(a1 + 32);
  if (v4)
    Property = objc_getProperty(v4, a2, 48, 1);
  else
    Property = 0;
  sub_1000037E4((uint64_t)NEHelperServer, Property, (int64_t)a2, 0);
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), 0, 0);
}

void sub_10001C6DC(unsigned __int8 *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  NSObject *v39;
  id *v40;
  void *v41;
  SEL v42;
  id v43;
  SEL v44;
  id Property;
  void *v46;
  void *v47;
  unsigned __int8 *v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD block[4];
  id v55;
  id v56;
  unsigned __int8 *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    v48 = a1;
    v49 = v9;
    v11 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "VPN"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "protocol"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identityData"));
    v50 = v8;
    v51 = v7;
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identityData"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identityDataPassword"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NEIdentityKeychainItem importPKCS12Data:passphrase:](NEIdentityKeychainItem, "importPKCS12Data:passphrase:", v15, v16));

      if (v14)
      {
        if (objc_msgSend(v14, "count"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
          objc_msgSend(v13, "setIdentityReferenceInternal:", v17);

        }
      }
    }
    v46 = v13;
    v47 = v11;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "relay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "relays"));

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identityData"));

          if (v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identityData"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identityDataPassword"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NEIdentityKeychainItem importPKCS12Data:passphrase:](NEIdentityKeychainItem, "importPKCS12Data:passphrase:", v26, v27));

            if (v28)
            {
              if (objc_msgSend(v28, "count"))
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
                objc_msgSend(v24, "setIdentityReferenceInternal:", v29);

              }
              if ((unint64_t)objc_msgSend(v28, "count") >= 2)
              {
                v30 = objc_msgSend(v28, "mutableCopy");
                objc_msgSend(v30, "removeObjectAtIndex:", 0);
                objc_msgSend(v24, "setCertificateReferences:", v30);

              }
              v14 = v28;
            }
            else
            {
              v14 = 0;
            }
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v21);
    }

    sub_10001CBA8((uint64_t)v48, v47);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "VPN"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "protocol"));
    v33 = objc_msgSend(v32, "type");

    v8 = v50;
    v7 = v51;
    v10 = v49;
    if (v33 == (id)1)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "VPN"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "protocol"));

      if (objc_msgSend(v35, "authenticationMethod") == (id)1)
        objc_msgSend(v35, "setLocalIdentifier:", 0);
      else
        objc_msgSend(v35, "setIdentityReferenceInternal:", 0);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "contentFilter"));
    if (v36 && (v37 = v48[16], v36, v37))
    {
      v38 = sub_10001CDDC((uint64_t)NEHelperConfigurationManager);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001CE20;
      block[3] = &unk_100039778;
      v40 = &v55;
      v55 = v47;
      v58 = v49;
      v56 = v50;
      v57 = v48;
      dispatch_async(v39, block);

      v41 = v58;
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
      v43 = objc_getProperty(v48, v42, 48, 1);
      Property = objc_getProperty(v48, v44, 32, 1);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10001D020;
      v52[3] = &unk_100039160;
      v40 = &v53;
      v53 = v49;
      objc_msgSend(v41, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:", v47, v50, v43, 0, Property, v52);

    }
  }

}

void sub_10001CBA8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[4];
  id v20;
  void *v21;
  _BYTE v22[128];

  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "relay", 0));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "relays"));

    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identityReferenceInternal"));

          if (v9)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "certificateReferences"));

            if (v10)
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "certificateReferences"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identityReferenceInternal"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrayByAddingObject:", v12));

            }
            else
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identityReferenceInternal"));
              v21 = v11;
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
            }

            v14 = v13;
            objc_opt_self(NEHelperRelayManager);
            if (objc_msgSend(v14, "count"))
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10000549C;
              block[3] = &unk_1000397A0;
              v20 = v14;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      }
      while (v5);
    }

  }
}

id sub_10001CDDC(uint64_t a1)
{
  objc_opt_self(a1);
  if (qword_100042C88 != -1)
    dispatch_once(&qword_100042C88, &stru_1000390F8);
  return (id)qword_100042C80;
}

void sub_10001CE20(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id Property;
  const char *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier"));
  v3 = sub_100016174((uint64_t)NEHelperConfigurationManager, v2);

  if ((v3 & 1) != 0)
  {
    v6 = sub_10001CDDC((uint64_t)NEHelperConfigurationManager);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    dispatch_suspend(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    Property = *(id *)(a1 + 48);
    if (Property)
      Property = objc_getProperty(Property, v8, 48, 1);
    v14 = Property;
    v15 = *(void **)(a1 + 48);
    if (v15)
      v16 = objc_getProperty(v15, v13, 32, 1);
    else
      v16 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10001D050;
    v21[3] = &unk_100039160;
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v9, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:", v10, v11, v14, 0, v16, v21);

  }
  else
  {
    v17 = ne_log_obj(v4, v5);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      *(_DWORD *)buf = 138412546;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@ is no longer the current allowed content filter app, cannot save configuration %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t sub_10001D020(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t sub_10001D050(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = sub_10001CDDC((uint64_t)NEHelperConfigurationManager);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  dispatch_resume(v5);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend(v3, "code");

  return (*(uint64_t (**)(uint64_t, id))(v6 + 16))(v6, v7);
}

void sub_10001D0BC(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("allowed-content-filter", v4);
  v3 = (void *)qword_100042C80;
  qword_100042C80 = (uint64_t)v2;

}

void sub_10001D10C(uint64_t a1)
{
  objc_opt_self(a1);
  if (qword_100042CC8 != -1)
    dispatch_once(&qword_100042CC8, &stru_1000396B8);
}

id sub_10001D148(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100042CB8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend((id)qword_100042CB8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

void sub_10001D194(id a1)
{
  id v1;
  void *v2;
  dispatch_queue_attr_t v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;

  v1 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = (void *)qword_100042CB8;
  qword_100042CB8 = (uint64_t)v1;

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v3);
  v4 = dispatch_queue_create("pending operations", v6);
  v5 = (void *)qword_100042CC0;
  qword_100042CC0 = (uint64_t)v4;

}

void sub_10001D248(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *string;
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  uint64_t v26;
  id v27;
  _BOOL4 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "bundle-id");
  v28 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "one-per-configuration");
  if (string)
  {
    v26 = a1;
    v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", string);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v3;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    v8 = v28;
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appVPN", v26));
          if (v13)
          {
            v14 = (void *)v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appVPN"));
            v16 = objc_msgSend(v15, "isEnabled");

            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appVPN"));
              v18 = objc_msgSend(v17, "copyAppRuleBySigningIdentifier:", v29);

              if (v18)
              {
                if (v8)
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "matchDomains"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

                  if (v20)
                    objc_msgSend(v4, "addObject:", v20);
                }
                else
                {
                  v32 = 0u;
                  v33 = 0u;
                  v30 = 0u;
                  v31 = 0u;
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "matchDomains"));
                  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
                  if (v21)
                  {
                    v22 = v21;
                    v23 = *(_QWORD *)v31;
                    do
                    {
                      for (j = 0; j != v22; j = (char *)j + 1)
                      {
                        if (*(_QWORD *)v31 != v23)
                          objc_enumerationMutation(v20);
                        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j));
                      }
                      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
                    }
                    while (v22);
                    v8 = v28;
                  }
                }

              }
            }
          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v9);
    }

    a1 = v26;
    v3 = v27;
  }
  v25 = (void *)_CFXPCCreateXPCObjectFromCFObject(v4);
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, v25);

}

void sub_10001D514(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  xpc_object_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id obj;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];

  v39 = a1;
  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v55;
    v41 = *(_QWORD *)v55;
    do
    {
      v7 = 0;
      v42 = v5;
      do
      {
        if (*(_QWORD *)v55 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v7);
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathController", v39));
        if (v9)
        {
          v10 = (void *)v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathController"));
          v12 = objc_msgSend(v11, "isEnabled");

          if (v12)
          {
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathController"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathRules"));

            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
            v45 = v7;
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v51;
              while (2)
              {
                for (i = 0; i != v16; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v51 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
                  if (objc_msgSend(v19, "isDefaultPathRule"))
                  {
                    v44 = v19;
                    goto LABEL_18;
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
                if (v16)
                  continue;
                break;
              }
            }
            v44 = 0;
LABEL_18:

            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathController"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathRules"));

            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v47;
              do
              {
                for (j = 0; j != v23; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v47 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "matchSigningIdentifier"));
                  v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v27));

                  if (!v28)
                  {
                    v29 = objc_alloc((Class)NEPathRule);
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "matchSigningIdentifier"));
                    v28 = objc_msgSend(v29, "initWithSigningIdentifier:", v30);

                  }
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathController"));
                  v32 = objc_msgSend(v31, "ignoreRouteRules");

                  if ((v32 & 1) == 0)
                  {
                    objc_msgSend(v28, "addCellularBehavior:grade:", objc_msgSend(v26, "cellularBehavior"), objc_msgSend(v8, "grade"));
                    objc_msgSend(v28, "addWiFiBehavior:grade:", objc_msgSend(v26, "wifiBehavior"), objc_msgSend(v8, "grade"));
                  }
                  if (objc_msgSend(v26, "denyCellularFallback"))
                    objc_msgSend(v28, "setDenyCellularFallback:", 1);
                  if (objc_msgSend(v26, "denyMulticast"))
                    objc_msgSend(v28, "setDenyMulticast:", 1);
                  if (objc_msgSend(v26, "multicastPreferenceSet"))
                    objc_msgSend(v28, "setMulticastPreferenceSet:", 1);
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "matchSigningIdentifier"));
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, v33);

                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
              }
              while (v23);
            }

            v6 = v41;
            v5 = v42;
            v7 = v45;
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v5);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  v35 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  v36 = v35;
  if (v34)
    objc_msgSend(v35, "encodeObject:forKey:", v34, CFSTR("config-aggregate-rules"));
  objc_msgSend(v36, "finishEncoding", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "encodedData"));
  v38 = xpc_data_create(objc_msgSend(v37, "bytes"), (size_t)objc_msgSend(v37, "length"));
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(v40 + 32), 0, v38);

}

void sub_10001D9C0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  const char *v6;
  id v7;
  NSObject *Property;
  _QWORD v9[5];
  id v10;

  if (a2)
  {
    v3 = objc_msgSend(a2, "code");
  }
  else
  {
    v4 = sub_100020DBC((uint64_t)NEHelperCacheManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
    if (v5)
    {
      Property = objc_getProperty(v5, v6, 8, 1);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100025CB4;
      v9[3] = &unk_100039750;
      v9[4] = v5;
      v10 = v7;
      dispatch_async(Property, v9);

    }
    v3 = 0;
  }
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 40), (int64_t)v3, 0);
}

void sub_10001DAAC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id obj;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v7 = a2;
  v8 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Signature")));

        if (v17 && sub_10001DCBC((uint64_t)NEHelperConfigurationManager, *(void **)(a1 + 32), v13))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
          v19 = NECopyConsoleUserUUID();
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10001E35C;
          v22[3] = &unk_1000392A0;
          v22[4] = v13;
          objc_msgSend(v18, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:", v13, v17, v20, 0, &_dispatch_main_q, v22);

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

}

BOOL sub_10001DCBC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
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
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  _UNKNOWN **v31;
  _UNKNOWN **v32;
  void **v33;
  id (*v34)(uint64_t, void *);
  void *i;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  id (*v41)(uint64_t, void *);
  void **v42;
  _UNKNOWN **v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  const __CFString *v81;
  uint8_t v82[4];
  void *v83;
  __int16 v84;
  const __CFString *v85;

  v5 = a3;
  v6 = a2;
  objc_opt_self(a1);
  v7 = v6;
  v8 = v5;
  objc_opt_self(NEHelperConfigurationManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appVPN"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentFilter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "perApp"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentFilter"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dnsProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "perApp"));

    if (v14)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dnsProxy"));
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relay"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "perApp"));

      if (!v16)
      {
        v18 = 0;
        v21 = 0;
        v19 = v9;
        if (v9)
          goto LABEL_10;
        goto LABEL_11;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relay"));
    }
  }
  v17 = v12;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "perApp"));

  if (v9)
  {
    v19 = v9;
LABEL_10:
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "appRules"));
    v21 = objc_msgSend(v20, "mutableCopy");

    goto LABEL_11;
  }
  v19 = v18;
  if (v18)
    goto LABEL_10;
  v21 = 0;
LABEL_11:
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "externalIdentifier"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "externalIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v23));

    v25 = (id)isa_nsarray(v24);
    if ((_DWORD)v25)
    {
      v25 = objc_msgSend(v24, "count");
      if (v25)
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v27 = v24;
        v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
        if (!v28)
          goto LABEL_33;
        v29 = v28;
        v68 = v24;
        v69 = v18;
        v70 = v9;
        v71 = v7;
        v72 = v8;
        v30 = *(_QWORD *)v75;
        v31 = &AnalyticsSendEvent_ptr;
        v32 = &AnalyticsSendEvent_ptr;
        v33 = _NSConcreteStackBlock;
        v34 = sub_10001E31C;
        while (1)
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(_QWORD *)v75 != v30)
              objc_enumerationMutation(v27);
            v36 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
            v37 = isa_nsstring(v36);
            if (!(_DWORD)v37)
            {
              v39 = ne_log_obj(v37, v38);
              v40 = objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v41 = v34;
                v42 = v33;
                v43 = v31;
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "externalIdentifier"));
                *(_DWORD *)buf = 138412546;
                v79 = v44;
                v80 = 2112;
                v81 = CFSTR("NETestAppMapping");
                _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Value of %@ in %@ in the Info.plist contains a non-string object, skipping", buf, 0x16u);

                v31 = v43;
                v33 = v42;
                v34 = v41;
                v32 = &AnalyticsSendEvent_ptr;
              }
              goto LABEL_27;
            }
            if (!v21)
            {
              v21 = objc_alloc_init((Class)v31[94]);
LABEL_26:
              v40 = objc_msgSend(objc_alloc((Class)v32[58]), "initWithSigningIdentifier:", v36);
              objc_msgSend(v21, "addObject:", v40);
LABEL_27:

              continue;
            }
            v73[0] = v33;
            v73[1] = 3221225472;
            v73[2] = v34;
            v73[3] = &unk_100039548;
            v73[4] = v36;
            if (objc_msgSend(v21, "indexOfObjectPassingTest:", v73) == (id)0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_26;
          }
          v29 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
          if (!v29)
          {
            v8 = v72;
            v9 = v70;
            v7 = v71;
            v24 = v68;
            v18 = v69;
            goto LABEL_33;
          }
        }
      }
    }
    v45 = ne_log_obj(v25, v26);
    v27 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "externalIdentifier"));
      *(_DWORD *)v82 = 138412546;
      v83 = v67;
      v84 = 2112;
      v85 = CFSTR("NETestAppMapping");
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Value of %@ in %@ in the Info.plist is not an array or is empty", v82, 0x16u);

    }
LABEL_33:

  }
  v46 = objc_msgSend(v21, "count");
  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appVPN"));

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appVPN"));
      objc_msgSend(v48, "setAppRules:", v21);
LABEL_53:

      goto LABEL_54;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentFilter"));

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentFilter"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "perApp"));

      if (!v51)
      {
        v52 = objc_alloc_init((Class)NEPerApp);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentFilter"));
        objc_msgSend(v53, "setPerApp:", v52);

      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentFilter", v68, v69, v70, v71));
LABEL_52:
      v48 = v54;
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "perApp"));
      objc_msgSend(v65, "setAppRules:", v21);

      goto LABEL_53;
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dnsProxy"));

    if (v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dnsProxy"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "perApp"));

      if (!v57)
      {
        v58 = objc_alloc_init((Class)NEPerApp);
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dnsProxy"));
        objc_msgSend(v59, "setPerApp:", v58);

      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dnsProxy", v68, v69, v70, v71));
      goto LABEL_52;
    }
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relay"));

    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relay"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "perApp"));

      if (!v62)
      {
        v63 = objc_alloc_init((Class)NEPerApp);
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relay"));
        objc_msgSend(v64, "setPerApp:", v63);

      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relay", v68, v69, v70, v71));
      goto LABEL_52;
    }
  }
LABEL_54:

  return v46 != 0;
}

id sub_10001E31C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "matchSigningIdentifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_10001E35C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = ne_log_obj(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to add app rules to %@: %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

void sub_10001E438(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  int64_t int64;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  const __CFString *v14;
  uint64_t v15;
  char v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _BYTE *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t isKindOfClass;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  const __CFString *v46;
  uint64_t v47;
  void *j;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  int64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  void *v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  const __CFString *v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  void *k;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  BOOL v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  unsigned __int8 *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  NSObject *v114;
  const char *v115;
  const char *v116;
  SEL v117;
  id v118;
  id Property;
  id v120;
  __CFString *v121;
  const char *v122;
  void *v123;
  id v124;
  const char *v125;
  id v126;
  const __CFString *v127;
  id v128;
  const char *v129;
  void *v130;
  id v131;
  void *v132;
  unsigned __int8 *v133;
  void *v134;
  void *v135;
  void *v136;
  const char *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  const char *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  id v146;
  void *v147;
  id self;
  id selfa;
  const char *v150;
  const char *v151;
  id v152;
  id v153;
  _QWORD v154[4];
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _QWORD v160[5];
  id v161;
  id v162;
  id v163;
  const char *v164;
  const char *v165;
  _QWORD v166[4];
  id v167;
  _QWORD v168[4];
  id v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _BYTE v178[128];
  uint8_t v179[128];
  uint8_t buf[4];
  const char *v181;
  __int16 v182;
  uint64_t v183;
  __int16 v184;
  id v185;
  uint8_t v186[4];
  id v187;
  __int16 v188;
  const __CFString *v189;
  __int16 v190;
  void *v191;
  __int16 v192;
  id v193;
  __int16 v194;
  id v195;

  v7 = a2;
  v8 = a5;
  int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "permission-type");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contentFilter"));
  v153 = v8;
  if (!v10 || *(_QWORD *)(a1 + 48))
  {

    goto LABEL_4;
  }
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
  {
    v16 = *(_BYTE *)(v15 + 12);

    if ((v16 & 1) != 0)
      goto LABEL_4;
  }
  else
  {

  }
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v171;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v171 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contentFilter"));

        if (v23)
        {
          v55 = ne_log_obj(v24, v25);
          v56 = objc_claimAutoreleasedReturnValue(v55);
          v54 = v153;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            Property = *(id *)(a1 + 56);
            if (Property)
              Property = objc_getProperty(Property, v57, 64, 1);
            v120 = Property;
            v121 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
            v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
            v124 = *(id *)(a1 + 56);
            if (v124)
              v124 = objc_getProperty(v124, v122, 40, 1);
            *(_DWORD *)v186 = 138413058;
            v187 = v120;
            v188 = 2112;
            v189 = v121;
            v190 = 2112;
            v191 = v123;
            v192 = 2112;
            v193 = v124;
            _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%@ trying to save a new content filter configuration with identifier %@, but a configuration (%@) already exists for application identifier %@", v186, 0x2Au);

          }
          sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), 10, 0);

          goto LABEL_145;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
      if (v19)
        continue;
      break;
    }
  }

LABEL_4:
  if (int64 != 3)
  {
    if (int64)
    {
      v14 = 0;
      v13 = 0;
      v12 = 0;
      goto LABEL_9;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dnsProxy"));

    if (!v11)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_25;
    }
  }
  v12 = "APP_WARNING_HEADER_DNS_PROXY";
  v13 = "APP_WARNING_DNS_PROXY";
  v14 = CFSTR("DNS Proxy");
LABEL_9:
  if (int64 == 1)
  {
    v12 = "APP_WARNING_HEADER_FILTER";
    v13 = "APP_WARNING_FILTER";
    v14 = CFSTR("content filter");
    goto LABEL_30;
  }
  if (int64)
    goto LABEL_30;
LABEL_25:
  v26 = v13;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contentFilter"));

  if (v27)
  {
    v12 = "APP_WARNING_HEADER_FILTER";
    v26 = "APP_WARNING_FILTER";
    v14 = CFSTR("content filter");
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "relay"));

  if (v28)
  {
    v12 = "APP_WARNING_HEADER_RELAY";
    v13 = "APP_WARNING_RELAY";
    v14 = CFSTR("Relay");
  }
  else
  {
    v13 = v26;
  }
LABEL_30:
  if (int64 == 2 || !v14)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "VPN"));
    v30 = objc_msgSend(v29, "tunnelType");

    if (v30 == (id)2)
      v14 = CFSTR("Transparent Proxy");
    else
      v14 = CFSTR("VPN");
    if (v30 == (id)2)
      v13 = "APP_WARNING_FILTER";
    else
      v13 = "APP_WARNING_VPN";
    if (v30 == (id)2)
      v12 = "APP_WARNING_HEADER_TRANSPARENT_PROXY";
    else
      v12 = "APP_WARNING_HEADER_VPN";
  }
  v142 = v13;
  v152 = v7;
  if (objc_msgSend(*(id *)(a1 + 40), "isTransparentProxy"))
  {
    v31 = *(_BYTE **)(a1 + 56);
    v32 = *(id *)(a1 + 40);
    v33 = v7;
    v35 = v33;
    if (v31)
    {
      v36 = ne_log_obj(v33, v34);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        if ((v31[10] & 1) != 0)
          v60 = "Enabled";
        else
          v60 = "Disabled";
        v61 = "Yes";
        if ((v31[13] & 1) == 0)
          v61 = "No";
        *(_DWORD *)buf = 136315394;
        v181 = v60;
        v182 = 2080;
        v183 = (uint64_t)v61;
        _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "platform entitled: %s isDevelopment: %s", buf, 0x16u);
      }

      if ((v31[10] & 1) == 0)
      {
        self = v31;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "VPN"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "protocol"));

        if (!v39)
        {
          v53 = 2;
          v54 = v153;
LABEL_77:

          sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), v53, 0);
          goto LABEL_145;
        }
        v40 = objc_opt_class(NETransparentProxyProviderProtocol);
        isKindOfClass = objc_opt_isKindOfClass(v39, v40);
        if ((isKindOfClass & 1) != 0)
        {
          if (v35)
          {
            v150 = v12;
            v176 = 0u;
            v177 = 0u;
            v174 = 0u;
            v175 = 0u;
            v43 = v35;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v174, v186, 16);
            if (v44)
            {
              v45 = v44;
              v141 = v39;
              v143 = v35;
              v145 = a1;
              v46 = v14;
              v47 = *(_QWORD *)v175;
              while (2)
              {
                for (j = 0; j != v45; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v175 != v47)
                    objc_enumerationMutation(v43);
                  v49 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * (_QWORD)j);
                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "identifier"));
                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));

                  if (v50 == v51)
                  {
                    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "VPN"));
                    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "protocol"));

                    v52 = (uint64_t)objc_msgSend(v59, "order");
                    v14 = v46;
                    v35 = v143;
                    a1 = v145;
                    v39 = v141;
                    goto LABEL_62;
                  }
                }
                v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v174, v186, 16);
                if (v45)
                  continue;
                break;
              }
              v14 = v46;
              v35 = v143;
              a1 = v145;
              v39 = v141;
            }
            v52 = 0x7FFFFFFFLL;
LABEL_62:

            v12 = v150;
          }
          else
          {
            v52 = 0x7FFFFFFFLL;
          }
          v62 = ne_log_obj(isKindOfClass, v42);
          v63 = objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            v116 = (const char *)objc_msgSend(v39, "order");
            v118 = objc_getProperty(self, v117, 40, 1);
            *(_DWORD *)buf = 134218498;
            v181 = v116;
            v182 = 2048;
            v183 = v52;
            v184 = 2112;
            v185 = v118;
            _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "protocol.order %lu, allowed_order %lu, applicationID: %@", buf, 0x20u);
          }

          v7 = v152;
          if (objc_msgSend(v39, "order") != (id)v52)
          {
            v65 = objc_getProperty(self, v64, 40, 1);
            if (v65)
            {
              v67 = ne_log_obj(v65, v66);
              v68 = objc_claimAutoreleasedReturnValue(v67);
              v54 = v153;
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                v125 = (const char *)objc_getProperty(self, v69, 64, 1);
                *(_DWORD *)buf = 138412290;
                v181 = v125;
                _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%@ trying to modify transparent proxy order through an app. Modifying transparent proxy order is only allowed through profile.", buf, 0xCu);
              }

              v53 = 10;
              goto LABEL_77;
            }
          }
        }

      }
    }

  }
  v70 = *(_QWORD *)(a1 + 56);
  v71 = *(void **)(a1 + 40);
  v72 = v7;
  v73 = v71;
  v74 = v73;
  if (!v70)
  {

    v98 = *(void **)(a1 + 40);
    v7 = v152;
    goto LABEL_139;
  }
  selfa = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100039138));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "filteredArrayUsingPredicate:"));
  if (!int64)
    goto LABEL_91;
  v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "contentFilter"));
  v77 = (void *)v76;
  if (int64 >= 2 && v76)
    goto LABEL_90;
  v78 = v12;
  v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "VPN"));
  v80 = (void *)v79;
  if (int64 > 2 && v79)
  {
LABEL_89:

    v12 = v78;
LABEL_90:

    goto LABEL_91;
  }
  v81 = v75;
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "appVPN"));
  v83 = v82;
  if (int64 >= 3 && v82)
  {

    v75 = v81;
    goto LABEL_89;
  }
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "dnsProxy"));

  v12 = v78;
  v75 = v81;
  if (int64 <= 3 || !v147)
  {
    v97 = objc_msgSend(v81, "count") != 0;
    goto LABEL_106;
  }
LABEL_91:
  v144 = v75;
  v146 = v72;
  v151 = v12;
  v84 = a1;
  v85 = v14;
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v86 = v75;
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v174, v186, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v175;
    while (2)
    {
      for (k = 0; k != v88; k = (char *)k + 1)
      {
        if (*(_QWORD *)v175 != v89)
          objc_enumerationMutation(v86);
        v91 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * (_QWORD)k);
        v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "contentFilter"));
        if (v92)
        {
          v93 = (void *)v92;
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "contentFilter"));

          if (v94)
          {
LABEL_104:

            v97 = 1;
            goto LABEL_105;
          }
        }
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "contentFilter"));
        if (v95)
        {

        }
        else
        {
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "contentFilter"));

          if (!v96)
            goto LABEL_104;
        }
      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v174, v186, 16);
      if (v88)
        continue;
      break;
    }
  }

  v97 = 0;
LABEL_105:
  v14 = v85;
  a1 = v84;
  v12 = v151;
  v75 = v144;
  v72 = v146;
LABEL_106:

  v98 = *(void **)(a1 + 40);
  v7 = v152;
  if (!v97)
  {
LABEL_139:
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "appPush"));

    if (v132)
    {
      v134 = *(void **)(a1 + 48);
      v133 = *(unsigned __int8 **)(a1 + 56);
      v168[0] = _NSConcreteStackBlock;
      v168[1] = 3221225472;
      v168[2] = sub_10001F1E8;
      v168[3] = &unk_100039188;
      v135 = *(void **)(a1 + 40);
      v169 = *(id *)(a1 + 32);
      sub_10001C6DC(v133, v135, v134, v168);
      v136 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "application"));
      v139 = *(void **)(a1 + 56);
      if (v139)
        v140 = objc_getProperty(v139, v137, 32, 1);
      else
        v140 = 0;
      v54 = v153;
      v166[0] = _NSConcreteStackBlock;
      v166[1] = 3221225472;
      v166[2] = sub_10001F204;
      v166[3] = &unk_1000391B0;
      v167 = *(id *)(a1 + 40);
      objc_msgSend(v136, "showLocalNetworkAlertForApp:withCompletionQueue:handler:", v138, v140, v166);

      goto LABEL_145;
    }
    v160[0] = _NSConcreteStackBlock;
    v160[1] = 3221225472;
    v160[2] = sub_10001F2E8;
    v160[3] = &unk_100039200;
    v160[4] = *(_QWORD *)(a1 + 56);
    v161 = *(id *)(a1 + 40);
    v164 = v12;
    v165 = v142;
    v162 = *(id *)(a1 + 48);
    v163 = *(id *)(a1 + 32);
    +[NEUserNotification cancelCurrentNotificationWithResponse:queue:completionHandler:](NEUserNotification, "cancelCurrentNotificationWithResponse:queue:completionHandler:", 2, &_dispatch_main_q, v160);

    v112 = v161;
LABEL_144:

    v54 = v153;
    goto LABEL_145;
  }
  if (objc_msgSend(v98, "grade") != (id)2
    || (v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "relay")), v99, v99))
  {
LABEL_125:
    v110 = *(void **)(a1 + 48);
    v109 = *(unsigned __int8 **)(a1 + 56);
    v154[0] = _NSConcreteStackBlock;
    v154[1] = 3221225472;
    v154[2] = sub_10001F408;
    v154[3] = &unk_100039188;
    v111 = *(void **)(a1 + 40);
    v155 = *(id *)(a1 + 32);
    sub_10001C6DC(v109, v111, v110, v154);
    v112 = v155;
    goto LABEL_144;
  }
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v100 = v72;
  v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v156, v178, 16);
  if (!v101)
  {
LABEL_117:
    v106 = v100;
LABEL_124:

    goto LABEL_125;
  }
  v102 = v101;
  v103 = *(_QWORD *)v157;
LABEL_111:
  v104 = 0;
  while (1)
  {
    if (*(_QWORD *)v157 != v103)
      objc_enumerationMutation(v100);
    v105 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v104);
    if (objc_msgSend(v105, "grade") == (id)2)
      break;
    if (v102 == (id)++v104)
    {
      v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v156, v178, 16);
      if (v102)
        goto LABEL_111;
      goto LABEL_117;
    }
  }
  v106 = v105;

  if (!v106)
    goto LABEL_125;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v106, "clearSystemKeychain");
    goto LABEL_124;
  }
  v113 = ne_log_obj(v107, v108);
  v114 = objc_claimAutoreleasedReturnValue(v113);
  v54 = v153;
  if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
  {
    v126 = *(id *)(a1 + 56);
    v127 = v14;
    if (v126)
      v126 = objc_getProperty(v126, v115, 64, 1);
    v128 = v126;
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    v131 = *(id *)(a1 + 56);
    if (v131)
      v131 = objc_getProperty(v131, v129, 40, 1);
    *(_DWORD *)v186 = 138413314;
    v187 = v128;
    v188 = 2112;
    v189 = v127;
    v190 = 2112;
    v191 = v130;
    v192 = 2112;
    v193 = v153;
    v194 = 2112;
    v195 = v131;
    _os_log_error_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "%@ trying to save a new personal %@ configuration with identifier %@, but a configuration (%@) already exists for application identifier %@", v186, 0x34u);

  }
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), 10, 0);

LABEL_145:
}

void sub_10001F1E8(uint64_t a1, int64_t a2)
{
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), a2, 0);
}

void sub_10001F204(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;

  v2 = a2;
  v4 = ne_log_obj(a1, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (v2)
      v6 = "granted";
    else
      v6 = "denied";
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "application"));
    v8 = 136315394;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "user %s local network access for %@", (uint8_t *)&v8, 0x16u);

  }
}

void sub_10001F2E8(uint64_t a1)
{
  id v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id Property;
  id v9;
  uint64_t v10;
  const char *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v2 = objc_alloc((Class)NEUserNotification);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "applicationName"));
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(void **)(a1 + 32);
  if (v7)
    Property = objc_getProperty(v7, v3, 32, 1);
  else
    Property = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001F424;
  v14[3] = &unk_1000391D8;
  v15 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v18 = *(id *)(a1 + 56);
  v12 = objc_msgSend(v2, "initAndShowAddConfigurationsForApp:warningHeader:warning:callbackQueue:callbackHandler:", v4, v5, v6, Property, v14);
  v13 = *(void **)(a1 + 32);
  if (v13)
    objc_setProperty_atomic(v13, v11, v12, 80);

}

void sub_10001F408(uint64_t a1, int64_t a2)
{
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), a2, 0);
}

void sub_10001F424(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NEHelperPendingOperation *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NEHelperPendingOperation *v18;
  NSObject *v19;
  NEHelperPendingOperation *v20;
  id v21;
  void *v22;
  id v23;
  SEL v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 *v32;
  BOOL v33;
  id obj;
  id obja;
  _QWORD v36[4];
  id v37;
  objc_super block;
  id (*v39)(uint64_t);
  void *v40;
  id v41;
  NEHelperPendingOperation *v42;

  if (a2 == 1)
  {
    if (+[NEUserNotification shouldPromptForLocalAuthentication](NEUserNotification, "shouldPromptForLocalAuthentication"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      v4 = v3;
      v6 = *(void **)(a1 + 32);
      v5 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        v33 = *(_BYTE *)(v7 + 16) != 0;
      else
        v33 = 0;
      v8 = *(void **)(a1 + 56);
      v9 = v3;
      v10 = v8;
      obj = v5;
      v11 = v5;
      v12 = v6;
      objc_opt_self(NEHelperPendingOperation);
      v13 = [NEHelperPendingOperation alloc];
      v14 = v9;
      v15 = v12;
      v16 = v11;
      v17 = v10;
      if (v13)
      {
        block.receiver = v13;
        block.super_class = (Class)NEHelperPendingOperation;
        v18 = (NEHelperPendingOperation *)objc_msgSendSuper2(&block, "init");
        v13 = v18;
        if (v18)
        {
          v18->_operation = 3;
          objc_storeStrong((id *)&v18->_configurationIdentifier, v4);
          objc_storeStrong((id *)&v13->_configuration, v6);
          objc_storeStrong((id *)&v13->_signature, obj);
          v13->_isAllowedContentFilterApp = v33;
          objc_storeStrong((id *)&v13->_requestMessage, v8);
        }
      }

      sub_10001D10C((uint64_t)NEHelperPendingOperation);
      v19 = qword_100042CC0;
      block.receiver = _NSConcreteStackBlock;
      block.super_class = (Class)3221225472;
      v39 = sub_10001F7A8;
      v40 = &unk_100039750;
      v41 = v14;
      v42 = v13;
      v20 = v13;
      v21 = v14;
      dispatch_sync(v19, &block);

      v22 = *(void **)(a1 + 48);
      if (v22)
      {
        v23 = *(id *)(a1 + 32);
        v25 = objc_getProperty(v22, v24, 72, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
        obja = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefs:root=General&path=ManagedConfigurationList/VPN/LocalAuthenticationTrigger&sender=%@&configID=%@"), v25, v27));

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", obja));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        objc_msgSend(v29, "openSensitiveURL:withOptions:", v28, 0);

      }
    }
    else
    {
      v30 = *(void **)(a1 + 32);
      v31 = *(void **)(a1 + 40);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10001F78C;
      v36[3] = &unk_100039188;
      v32 = *(unsigned __int8 **)(a1 + 48);
      v37 = *(id *)(a1 + 56);
      sub_10001C6DC(v32, v30, v31, v36);

    }
  }
  else
  {
    sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 56), 10, 0);
  }
}

void sub_10001F78C(uint64_t a1, int64_t a2)
{
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 32), a2, 0);
}

id sub_10001F7A8(uint64_t a1)
{
  return objc_msgSend((id)qword_100042CB8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

BOOL sub_10001F7BC(id a1, id a2, NSDictionary *a3)
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentFilter"));
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "VPN"));
    if (v6)
    {
      v5 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appVPN"));
      if (v7)
      {
        v5 = 1;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dnsProxy"));
        if (v8)
        {
          v5 = 1;
        }
        else
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relay"));
          v5 = v9 != 0;

        }
      }

    }
  }

  return v5;
}

void sub_10001F890(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    if (!a3)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v7)
      {
        v9 = v7;
        v10 = *(_QWORD *)v24;
        *(_QWORD *)&v8 = 136315394;
        v22 = v8;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "VPN", v22));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "protocol"));
            v15 = objc_msgSend(v14, "type");

            if (v15 == (id)3)
            {
              v18 = ne_log_obj(v16, v17);
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v22;
                v28 = "+[NEHelperConfigurationManager handleUnsupportedConfiguration:]_block_invoke";
                v29 = 2112;
                v30 = v12;
                _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s: removing configuration %@", buf, 0x16u);
              }

              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
              objc_msgSend(v20, "removeConfigurationFromDisk:completionQueue:completionHandler:", v21, *(_QWORD *)(a1 + 32), &stru_1000395B0);

            }
          }
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v9);
      }
    }
  }

}

void sub_10001FA84(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  NSError *v10;

  v2 = a2;
  v4 = v2;
  if (v2)
  {
    v5 = ne_log_obj(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "+[NEHelperConfigurationManager handleUnsupportedConfiguration:]_block_invoke";
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void sub_10001FB48(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  dispatch_queue_t v10;

  v3 = a2;
  objc_opt_self(a1);
  v4 = dispatch_queue_create("upgrade-app-groups", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001FC20;
  v8[3] = &unk_100039648;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, 0, v6, v8);

}

void sub_10001FC20(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  _QWORD v72[4];
  NSObject *v73;
  char v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];

  v8 = a2;
  v66 = a3;
  v68 = a5;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
  if (v9)
  {
    v10 = v9;
    v67 = 0;
    v70 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v76;
    v69 = v8;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v76 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v13);
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
        if (v15)
        {
          v16 = (void *)v15;
          if (!objc_msgSend(*(id *)(a1 + 32), "count"))
          {

LABEL_11:
            v21 = ne_log_obj(v19, v20);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
              *(_DWORD *)buf = 138412290;
              v80 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Upgrading app groups for app %@", buf, 0xCu);

            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NELaunchServices bundleProxyForIdentifier:uid:plugins:](NELaunchServices, "bundleProxyForIdentifier:uid:plugins:", v24, 0, 0));

            if (v25)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "appGroups"));
              v29 = objc_msgSend(v28, "count");

              v32 = ne_log_obj(v30, v31);
              v33 = objc_claimAutoreleasedReturnValue(v32);
              v34 = v33;
              if (v29)
              {
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "appGroups"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
                  *(_DWORD *)buf = 138412546;
                  v80 = v35;
                  v81 = 2112;
                  v82 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Adding app groups %@ for app %@", buf, 0x16u);

                }
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "appGroups"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
                objc_msgSend(v37, "addGroups:forApp:", v38, v39);

                if (v11)
                {
                  v8 = v69;
LABEL_26:

                  goto LABEL_27;
                }
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties")));
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
                v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v46));

                v44 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", CFSTR("Signature")));
                v47 = isa_nsdata(v44);
                if ((v47 & 1) != 0)
                {
                  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
                  v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "getCurrentUserUUIDForConfigurationID:fromIndex:", v50, v68));

                  v11 = v14;
                  v67 = (void *)v71;
                }
                else
                {
                  v51 = ne_log_obj(v47, v48);
                  v52 = objc_claimAutoreleasedReturnValue(v51);
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
                    *(_DWORD *)buf = 138412290;
                    v80 = v53;
                    _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "No signature found for AppleConnect configuration %@", buf, 0xCu);

                  }
                  v11 = 0;
                }
                v8 = v69;
LABEL_25:

                v70 = (void *)v44;
                goto LABEL_26;
              }
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
                *(_DWORD *)buf = 138412290;
                v80 = v41;
                v42 = v34;
                v43 = "App %@ does not have any app groups";
LABEL_23:
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);

              }
            }
            else
            {
              v40 = ne_log_obj(v26, v27);
              v34 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
                *(_DWORD *)buf = 138412290;
                v80 = v41;
                v42 = v34;
                v43 = "Did not find %@ while upgrading app groups";
                goto LABEL_23;
              }
            }
            v44 = (uint64_t)v70;
            goto LABEL_25;
          }
          v17 = *(void **)(a1 + 32);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
          LODWORD(v17) = objc_msgSend(v17, "containsObject:", v18);

          if ((_DWORD)v17)
            goto LABEL_11;
        }
LABEL_27:
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v54 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      v10 = v54;
      if (!v54)
        goto LABEL_38;
    }
  }
  v67 = 0;
  v70 = 0;
  v11 = 0;
LABEL_38:
  v74 = 0;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v56 = objc_msgSend(v55, "copyAppGroupMapDidChange:", &v74);

  if (v56)
    v59 = v74 == 0;
  else
    v59 = 1;
  if (v59)
  {
    v60 = ne_log_obj(v57, v58);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    v62 = v67;
    v63 = v70;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "App group map did not change", buf, 2u);
    }
    goto LABEL_47;
  }
  v62 = v67;
  v63 = v70;
  if (v11)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
    v65 = *(_QWORD *)(a1 + 40);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10002027C;
    v72[3] = &unk_1000392A0;
    v73 = v11;
    objc_msgSend(v64, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:", v73, v70, v67, 0, v65, v72);

    v61 = v73;
LABEL_47:

  }
}

void sub_10002027C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "code");
    if (v5 != (id)9)
    {
      v7 = ne_log_obj(v5, v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
        v10 = 138412546;
        v11 = v9;
        v12 = 2112;
        v13 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save %@ while upgrading app groups: %@", (uint8_t *)&v10, 0x16u);

      }
    }
  }

}

void sub_100020368(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  objc_opt_self(a1);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100018440;
  v10[4] = sub_100018450;
  v11 = (id)os_transaction_create("set-current-allowed-client");
  v4 = sub_10001CDDC((uint64_t)NEHelperConfigurationManager);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020470;
  v7[3] = &unk_1000396E0;
  v8 = v3;
  v9 = v10;
  v6 = v3;
  dispatch_async(v5, v7);

  _Block_object_dispose(v10, 8);
}

void sub_100020458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020470(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[4];
  dispatch_queue_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;

  v3 = ne_log_obj(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current allowed content filter app is now %@", buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&unk_100042CB0);
  v6 = qword_100042C68;
  if (qword_100042C68)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      LODWORD(v7) = objc_msgSend((id)qword_100042C68, "isEqualToString:") ^ 1;
      v6 = qword_100042C68;
    }
    else
    {
      LODWORD(v7) = 1;
    }
    v33 = CFSTR("application-id");
    v34 = v6;
    v9 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v8 = (void *)v9;
    if ((_DWORD)v7)
    {
      v11 = ne_log_obj(v9, v10);
      v7 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v28 = qword_100042C68;
        v29 = 2112;
        v30 = v12;
        v31 = 2112;
        v32 = qword_100042C68;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current allowed content filter app changed from %@ to %@, removing content filter configurations created by %@", buf, 0x20u);
      }

      LOBYTE(v7) = 1;
    }
  }
  else
  {
    v8 = 0;
    LOBYTE(v7) = 0;
  }
  v13 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v14 = (void *)qword_100042C68;
  qword_100042C68 = (uint64_t)v13;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042CB0);
  if ((v7 & 1) != 0)
  {
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("Remove filters queue", v16);

    v18 = sub_10001CDDC((uint64_t)NEHelperConfigurationManager);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    dispatch_suspend(v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000206F8;
    v24[3] = &unk_100039698;
    v21 = *(_QWORD *)(a1 + 40);
    v25 = v17;
    v26 = v21;
    v22 = v17;
    objc_msgSend(v20, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, v8, v22, v24);

  }
  else
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = *(NSObject **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = 0;
  }

}

void sub_1000206F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];

  v5 = a2;
  v6 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentFilter"));

      if (v13)
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v12;

    if (!v14)
      goto LABEL_14;
    v17 = ne_log_obj(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      *(_DWORD *)buf = 138412290;
      v38 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removing %@ content filter configuration", buf, 0xCu);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v22 = *(_QWORD *)(a1 + 32);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100020964;
    v29[3] = &unk_100039670;
    v30 = v14;
    v23 = v6;
    v24 = *(_QWORD *)(a1 + 40);
    v31 = v23;
    v32 = v24;
    v25 = v14;
    objc_msgSend(v20, "removeConfigurationFromDisk:completionQueue:completionHandler:", v21, v22, v29);

  }
  else
  {
LABEL_9:

LABEL_14:
    v26 = sub_10001CDDC((uint64_t)NEHelperConfigurationManager);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    dispatch_resume(v27);

    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v25 = *(id *)(v28 + 40);
    *(_QWORD *)(v28 + 40) = 0;
  }

}

void sub_100020964(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;

  if (a2)
  {
    v3 = ne_log_obj(a1, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to remove content filter configuration %@: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  v5 = sub_10001CDDC((uint64_t)NEHelperConfigurationManager);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  dispatch_resume(v6);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

id sub_100020DBC(uint64_t a1)
{
  objc_opt_self(a1);
  if (qword_100042CF8 != -1)
    dispatch_once(&qword_100042CF8, &stru_100039700);
  return (id)qword_100042D00;
}

void sub_100020E00(SCPreferencesRef *a1, void *a2)
{
  const char *v3;
  id v4;
  NSObject *Property;
  NSObject *v6;
  NSObject *v7;
  CFPropertyListRef Value;
  void *v9;
  void *v10;
  CFPropertyListRef v11;
  void *v12;
  void *v13;
  xpc_connection_t remote_connection;
  void *v15;
  BOOL v16;
  const char *string;
  xpc_object_t v18;
  NSObject *v19;
  xpc_type_t type;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  xpc_connection_t v25;
  void *v26;
  BOOL v27;
  xpc_connection_t v28;
  void *v29;
  BOOL v30;
  const char *v31;
  xpc_object_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  xpc_connection_t v40;
  void *v41;
  BOOL v42;
  xpc_object_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int8 *bytes_ptr;
  size_t v49;
  xpc_connection_t v50;
  void *v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  xpc_connection_t v60;
  void *v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  xpc_object_t v66;
  NSObject *v67;
  void *v68;
  void *v69;
  const uint8_t *uuid;
  uint64_t v71;
  const uint8_t *v72;
  int v73;
  id v74;
  void *v75;
  SEL v76;
  id v77;
  id v78;
  const char *v79;
  const char *v80;
  const char *v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  NSObject *v89;
  unsigned int int64;
  void *v91;
  _BOOL4 v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  NSObject *v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  void *i;
  void *v104;
  uint64_t v105;
  NSObject *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  void *v113;
  char v114;
  uint64_t v115;
  const char *v116;
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  SCPreferencesRef *v121;
  int v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  void *v129;
  _BYTE v130[128];
  uint8_t buf[40];

  v4 = a2;
  if (!a1)
    goto LABEL_102;
  Property = objc_getProperty(a1, v3, 8, 1);
  dispatch_assert_queue_V2(Property);
  if (!a1[2])
  {
LABEL_101:
    sub_1000037E4((uint64_t)NEHelperServer, v4, 22, 0);
    goto LABEL_102;
  }
  switch(xpc_dictionary_get_uint64(v4, "cache-command"))
  {
    case 1uLL:
      v6 = xpc_dictionary_create(0, 0, 0);
      if (!v6)
        goto LABEL_101;
      v7 = v6;
      Value = SCPreferencesGetValue(a1[2], CFSTR("redirected-addresses"));
      if (Value)
      {
        v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(Value);
        v10 = v9;
        if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
          xpc_dictionary_set_value(v7, "redirected-addresses", v10);

      }
      v11 = SCPreferencesGetValue(a1[2], CFSTR("services"));
      if (v11)
      {
        v12 = (void *)_CFXPCCreateXPCObjectFromCFObject(v11);
        v13 = v12;
        if (v12 && xpc_get_type(v12) == (xpc_type_t)&_xpc_type_dictionary)
          xpc_dictionary_set_value(v7, "services", v13);

      }
      goto LABEL_91;
    case 2uLL:
      remote_connection = xpc_dictionary_get_remote_connection(v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
      v16 = sub_10000FA04((uint64_t)NEHelperServer, v15, (uint64_t)"com.apple.private.nehelper.privileged");

      string = xpc_dictionary_get_string(v4, "cache-service");
      v18 = xpc_dictionary_get_value(v4, "cache-routes");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v7 = v19;
      if (!string)
        goto LABEL_100;
      if (!v19)
        goto LABEL_100;
      type = xpc_get_type(v19);
      if (type != (xpc_type_t)&_xpc_type_dictionary)
        goto LABEL_100;
      if (v16)
      {
        v22 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
        v24 = sub_10002303C(a1, v22, v23);

        if (v24)
          goto LABEL_65;
        goto LABEL_101;
      }
      v111 = ne_log_obj(type, v21);
      v106 = objc_claimAutoreleasedReturnValue(v111);
      if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        goto LABEL_99;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = objc_getProperty(a1, v112, 24, 1);
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "com.apple.private.nehelper.privileged";
      v108 = "Denying set routes command because %@ does not have the %s entitlement";
      goto LABEL_98;
    case 3uLL:
      v25 = xpc_dictionary_get_remote_connection(v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = sub_10000FA04((uint64_t)NEHelperServer, v26, (uint64_t)"com.apple.private.network.socket-delegate")|| sub_10000FA04((uint64_t)NEHelperServer, v26, (uint64_t)"com.apple.private.necp.policies");
      v7 = xpc_dictionary_create(0, 0, 0);
      if (!v7 || (v79 = xpc_dictionary_get_string(v4, "cache-signing-identifier")) == 0)
      {

        goto LABEL_100;
      }
      v80 = v79;
      v81 = xpc_dictionary_get_string(v4, "cache-executable-path");
      if (v81)
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v81));
      else
        v82 = 0;
      int64 = xpc_dictionary_get_int64(v4, "cache-user-uid");
      if (!int64)
      {
        memset(buf, 0, 32);
        xpc_dictionary_get_audit_token(v4, buf);
        v127 = *(_OWORD *)buf;
        v128 = *(_OWORD *)&buf[16];
        int64 = NEUIDForAuditToken(&v127);
      }
      LOBYTE(v127) = 0;
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v80));
      v92 = xpc_dictionary_get_BOOL(v4, "cache-allow-synthesis");
      v93 = sub_100022780(a1, v91, v82, v92, int64, &v127);
      v94 = (void *)objc_claimAutoreleasedReturnValue(v93);

      v95 = isa_nsarray(v94);
      if ((_DWORD)v95)
      {
        if ((_BYTE)v127)
          v97 = v27;
        else
          v97 = 1;
        if ((v97 & 1) != 0)
        {
          v98 = xpc_array_create(0, 0);
          v123 = 0u;
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          v99 = v94;
          v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
          if (v100)
          {
            v101 = v100;
            v102 = *(_QWORD *)v124;
            do
            {
              for (i = 0; i != v101; i = (char *)i + 1)
              {
                if (*(_QWORD *)v124 != v102)
                  objc_enumerationMutation(v99);
                v104 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)i);
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = 0;
                objc_msgSend(v104, "getUUIDBytes:", buf);
                xpc_array_set_uuid(v98, 0xFFFFFFFFFFFFFFFFLL, buf);
              }
              v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
            }
            while (v101);
          }

          xpc_dictionary_set_value(v7, "cache-app-uuid", v98);
        }
        else
        {
          v109 = ne_log_obj(v95, v96);
          v98 = objc_claimAutoreleasedReturnValue(v109);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
          {
            v117 = objc_getProperty(a1, v110, 24, 1);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v117;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v80;
            _os_log_fault_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_FAULT, "%@ is trying to access information for %s but is not entitled to do so. Please add the com.apple.private.network.socket-delegate or the com.apple.private.necp.policies entitlement", buf, 0x16u);
          }
        }

      }
      goto LABEL_91;
    case 4uLL:
      v28 = xpc_dictionary_get_remote_connection(v4);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = sub_10000FA04((uint64_t)NEHelperServer, v29, (uint64_t)"com.apple.private.nehelper.privileged");

      v31 = xpc_dictionary_get_string(v4, "cache-service");
      v32 = xpc_dictionary_get_value(v4, "cache-domain-dictionaries");
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v7 = v33;
      if (!v31 || v33 && xpc_get_type(v33) != (xpc_type_t)&_xpc_type_array)
        goto LABEL_100;
      v34 = xpc_dictionary_get_string(v4, "cache-interface-name");
      if (!v34)
        goto LABEL_100;
      if (!v30)
      {
        v105 = ne_log_obj(v34, v35);
        v106 = objc_claimAutoreleasedReturnValue(v105);
        if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          goto LABEL_99;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = objc_getProperty(a1, v107, 24, 1);
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "com.apple.private.nehelper.privileged";
        v108 = "Denying set domain dictionary command because %@ does not have the %s entitlement";
        goto LABEL_98;
      }
      v36 = (uint64_t)v34;
      if (v7)
      {
        v37 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31));
        v39 = sub_100021D38(a1, v37, v38, v36);

        goto LABEL_47;
      }
      v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31));
      v114 = sub_100021FDC(a1, v113, v36);

      v7 = 0;
      if ((v114 & 1) != 0)
        goto LABEL_91;
      goto LABEL_101;
    case 5uLL:
      v40 = xpc_dictionary_get_remote_connection(v4);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = sub_10000FA04((uint64_t)NEHelperServer, v41, (uint64_t)"com.apple.private.nehelper.privileged");

      v43 = xpc_dictionary_get_value(v4, "cache-redirected-address");
      v44 = objc_claimAutoreleasedReturnValue(v43);
      v7 = v44;
      if (!v44)
        goto LABEL_100;
      if (xpc_get_type(v44) != (xpc_type_t)&_xpc_type_data)
        goto LABEL_100;
      if (xpc_data_get_length(v7) < 0x10)
        goto LABEL_100;
      v45 = xpc_dictionary_get_string(v4, "cache-interface-name");
      if (!v45)
        goto LABEL_100;
      if (!v42)
      {
        v115 = ne_log_obj(v45, v46);
        v106 = objc_claimAutoreleasedReturnValue(v115);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = objc_getProperty(a1, v116, 24, 1);
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "com.apple.private.nehelper.privileged";
          v108 = "Denying add redirected address command because %@ does not have the %s entitlement";
LABEL_98:
          _os_log_error_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, v108, buf, 0x16u);
        }
LABEL_99:

        goto LABEL_100;
      }
      v47 = (uint64_t)v45;
      bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(v7);
      v49 = *bytes_ptr;
      if (xpc_data_get_length(v7) < v49)
        goto LABEL_100;
      v39 = sub_100022250(a1, (uint64_t)bytes_ptr, v47);
      goto LABEL_47;
    case 7uLL:
      v50 = xpc_dictionary_get_remote_connection(v4);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      v52 = sub_10000FA04((uint64_t)NEHelperServer, v51, (uint64_t)"com.apple.private.nehelper.privileged");

      if (v52)
      {
        v55 = xpc_dictionary_get_string(v4, "cache-interface-name");
        if (!v55)
          goto LABEL_101;
        sub_100022654(a1, v55);
        goto LABEL_65;
      }
      v83 = ne_log_obj(v53, v54);
      v7 = objc_claimAutoreleasedReturnValue(v83);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_100;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = objc_getProperty(a1, v84, 24, 1);
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "com.apple.private.nehelper.privileged";
      v85 = "Denying clear redirected addresses command because %@ does not have the %s entitlement";
      goto LABEL_63;
    case 8uLL:
      v56 = xpc_dictionary_get_string(v4, "cache-app-bundle-id");
      if (v56)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v56));
        v129 = v58;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v129, 1));
        sub_100022B58((uint64_t)a1, v59);

      }
      else
      {
        sub_100022D54(a1, v57);
      }
      goto LABEL_65;
    case 9uLL:
      v60 = xpc_dictionary_get_remote_connection(v4);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      v62 = sub_10000FA04((uint64_t)NEHelperServer, v61, (uint64_t)"com.apple.private.nehelper.privileged");

      if (!v62)
      {
        v86 = ne_log_obj(v63, v64);
        v7 = objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = objc_getProperty(a1, v87, 24, 1);
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "com.apple.private.nehelper.privileged";
          v85 = "Denying set match domains command because %@ does not have the %s entitlement";
LABEL_63:
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v85, buf, 0x16u);
        }
        goto LABEL_100;
      }
      v65 = xpc_dictionary_get_string(v4, "cache-service");
      v66 = xpc_dictionary_get_value(v4, "cache-match-domains");
      v67 = objc_claimAutoreleasedReturnValue(v66);
      v7 = v67;
      if (!v65 || !v67 || xpc_get_type(v67) != (xpc_type_t)&_xpc_type_array)
      {
LABEL_100:

        goto LABEL_101;
      }
      v68 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v65));
      v39 = sub_100021A24(a1, v68, v69);

LABEL_47:
      if ((v39 & 1) == 0)
        goto LABEL_101;
LABEL_65:
      v7 = 0;
LABEL_91:
      sub_1000037E4((uint64_t)NEHelperServer, v4, 0, v7);

LABEL_102:
      return;
    case 0xAuLL:
      uuid = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (uuid)
      {
        v72 = uuid;
        v73 = xpc_dictionary_get_int64(v4, "cache-user-uid");
        if (!v73)
        {
          memset(buf, 0, 32);
          xpc_dictionary_get_audit_token(v4, buf);
          v127 = *(_OWORD *)buf;
          v128 = *(_OWORD *)&buf[16];
          v73 = NEUIDForAuditToken(&v127);
        }
        v74 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v72);
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
        v77 = objc_getProperty(a1, v76, 8, 1);
        v118[0] = _NSConcreteStackBlock;
        v118[1] = 3221225472;
        v118[2] = sub_100022E60;
        v118[3] = &unk_100039728;
        v119 = v74;
        v120 = v4;
        v121 = a1;
        v122 = v73;
        v78 = v74;
        objc_msgSend(v75, "loadConfigurationWithID:withCompletionQueue:handler:", v78, v77, v118);

        goto LABEL_102;
      }
      v88 = ne_log_obj(0, v71);
      v89 = objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "No configuration ID provided for populating the cache", buf, 2u);
      }

      goto LABEL_101;
    default:
      goto LABEL_101;
  }
}

uint64_t sub_100021A24(SCPreferencesRef *a1, void *a2, void *a3)
{
  id v5;
  SEL v6;
  NSObject *Property;
  CFPropertyListRef Value;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v26 = a2;
  v5 = a3;
  Property = objc_getProperty(a1, v6, 8, 1);
  dispatch_assert_queue_V2(Property);
  Value = SCPreferencesGetValue(a1[2], CFSTR("services"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(Value);
  if (isa_nsdictionary(v9))
    v10 = objc_msgSend(v9, "mutableCopy");
  else
    v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v5, v26));
  if (isa_nsdictionary(v12))
    v13 = objc_msgSend(v12, "mutableCopy");
  else
    v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = v13;
  v15 = ne_session_type_to_string(1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v16));

  if (isa_nsdictionary(v17))
  {
    v18 = objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v18, "removeObjectForKey:", CFSTR("match-domains"));
  }
  else
  {
    v18 = objc_alloc_init((Class)NSMutableDictionary);
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, CFSTR("match-domains"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v19);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v5);
  if (SCPreferencesSetValue(a1[2], CFSTR("services"), v11) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_1000235F8(a1, v20);
    if ((nelog_is_extra_vpn_logging_enabled() & 1) == 0)
    {
      v23 = 1;
      goto LABEL_23;
    }
    v21 = ne_log_large_obj();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v5;
      v30 = 2112;
      v31 = v27;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Set match domains for service %@:%@", buf, 0x16u);
    }
    v23 = 1;
  }
  else
  {
    if ((nelog_is_extra_vpn_logging_enabled() & 1) == 0)
    {
      v23 = 0;
      goto LABEL_23;
    }
    v24 = ne_log_large_obj();
    v22 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v5;
      v30 = 2112;
      v31 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to set match domains for service %@:%@", buf, 0x16u);
    }
    v23 = 0;
  }

LABEL_23:
  return v23;
}

uint64_t sub_100021D38(SCPreferencesRef *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  SEL v9;
  NSObject *Property;
  CFPropertyListRef Value;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  const char *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v7 = a2;
  v8 = a3;
  Property = objc_getProperty(a1, v9, 8, 1);
  dispatch_assert_queue_V2(Property);
  if (isa_nsarray(v7))
  {
    Value = SCPreferencesGetValue(a1[2], CFSTR("services"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(Value);
    if (isa_nsdictionary(v12))
      v13 = objc_msgSend(v12, "mutableCopy");
    else
      v13 = objc_alloc_init((Class)NSMutableDictionary);
    v15 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v8));
    v34 = v16;
    v35 = v12;
    if (isa_nsdictionary(v16))
      v17 = objc_msgSend(v16, "mutableCopy");
    else
      v17 = objc_alloc_init((Class)NSMutableDictionary);
    v18 = v17;
    v19 = ne_session_type_to_string(1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v20));

    v33 = v21;
    if (isa_nsdictionary(v21))
      v22 = objc_msgSend(v21, "mutableCopy");
    else
      v22 = objc_alloc_init((Class)NSMutableDictionary);
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4, v8));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v24));
    v26 = isa_nsdictionary(v25);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v24));
      v28 = objc_msgSend(v27, "mutableCopy");

    }
    else
    {
      v28 = objc_alloc_init((Class)NSMutableDictionary);
    }
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v7, CFSTR("service-domain-info"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, v29);

    v8 = v32;
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, v32);
    if (SCPreferencesSetValue(a1[2], CFSTR("services"), v15) && SCPreferencesCommitChanges(a1[2]))
    {
      sub_1000235F8(a1, v30);
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t sub_100021FDC(SCPreferencesRef *a1, void *a2, uint64_t a3)
{
  id v5;
  SEL v6;
  NSObject *Property;
  CFPropertyListRef Value;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v5 = a2;
  Property = objc_getProperty(a1, v6, 8, 1);
  dispatch_assert_queue_V2(Property);
  Value = SCPreferencesGetValue(a1[2], CFSTR("services"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(Value);
  if (isa_nsdictionary(v9))
  {
    v10 = objc_msgSend(v9, "mutableCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v5));
    if (isa_nsdictionary(v11))
    {
      v12 = objc_msgSend(v11, "mutableCopy");
      v13 = ne_session_type_to_string(1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
      v30 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v14));

      if (isa_nsdictionary(v15))
      {
        v16 = objc_msgSend(v15, "mutableCopy");
        v17 = a3;
        v18 = v16;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:"));
        if (isa_nsdictionary(v19))
        {
          v27 = v19;
          v28 = v18;
          v20 = objc_msgSend(v19, "mutableCopy");
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("service-domains")));

          if (v21)
          {
            objc_msgSend(v20, "removeObjectForKey:", CFSTR("service-domains"));
            v18 = v28;
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, v29);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
            v23 = v30;
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, v22);

            objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, v5);
            if (SCPreferencesSetValue(a1[2], CFSTR("services"), v10) && SCPreferencesCommitChanges(a1[2]))
            {
              sub_1000235F8(a1, v24);
              v25 = 1;
            }
            else
            {
              v25 = 0;
            }
          }
          else
          {
            v25 = 0;
            v18 = v28;
            v23 = v30;
          }

          v19 = v27;
        }
        else
        {
          v25 = 0;
          v23 = v30;
        }

      }
      else
      {
        v25 = 0;
        v23 = v30;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

uint64_t sub_100022250(SCPreferencesRef *a1, uint64_t a2, uint64_t a3)
{
  NSObject *Property;
  int v7;
  CFPropertyListRef Value;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const char *v37;

  Property = objc_getProperty(a1, (SEL)a2, 8, 1);
  dispatch_assert_queue_V2(Property);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(a2 + 1);
  if (v7 != 30 && v7 != 2)
    return 0;
  Value = SCPreferencesGetValue(a1[2], CFSTR("redirected-addresses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(Value);
  if (isa_nsdictionary(v10))
    v11 = objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
  v16 = isa_nsdictionary(v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
    v18 = objc_msgSend(v17, "mutableCopy");

  }
  else
  {
    v18 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v19 = *(unsigned __int8 *)(a2 + 1);
  if (v19 == 30)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ipv6-subnets")));
    v25 = isa_nsdictionary(v24);

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ipv6-subnets")));
      v23 = objc_msgSend(v26, "mutableCopy");

    }
    else
    {
      v23 = objc_alloc_init((Class)NSMutableDictionary);
    }
    if (!isa_nsdictionary(v23))
      goto LABEL_41;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("subnet-addresses")));
    v32 = isa_nsarray(v31);

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("subnet-addresses")));
      v30 = objc_msgSend(v33, "mutableCopy");

    }
    else
    {
      v30 = objc_alloc_init((Class)NSMutableArray);
    }
    if (isa_nsarray(v30))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a2 + 8, 16));
      if ((objc_msgSend(v30, "containsObject:", v36) & 1) == 0)
        objc_msgSend(v30, "addObject:", v36);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, CFSTR("subnet-addresses"));

    }
    v35 = CFSTR("ipv6-subnets");
    goto LABEL_40;
  }
  if (v19 != 2)
    goto LABEL_42;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ipv4-subnets")));
  v21 = isa_nsdictionary(v20);

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ipv4-subnets")));
    v23 = objc_msgSend(v22, "mutableCopy");

  }
  else
  {
    v23 = objc_alloc_init((Class)NSMutableDictionary);
  }
  if (isa_nsdictionary(v23))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("subnet-addresses")));
    v28 = isa_nsarray(v27);

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("subnet-addresses")));
      v30 = objc_msgSend(v29, "mutableCopy");

    }
    else
    {
      v30 = objc_alloc_init((Class)NSMutableArray);
    }
    if (isa_nsarray(v30))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a2 + 4, 4));
      if ((objc_msgSend(v30, "containsObject:", v34) & 1) == 0)
        objc_msgSend(v30, "addObject:", v34);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, CFSTR("subnet-addresses"));

    }
    v35 = CFSTR("ipv4-subnets");
LABEL_40:
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, v35);

  }
LABEL_41:

LABEL_42:
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v14);
  if (SCPreferencesSetValue(a1[2], CFSTR("redirected-addresses"), v13) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_1000235F8(a1, v37);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_100022654(SCPreferencesRef *a1, const char *a2)
{
  NSObject *Property;
  CFPropertyListRef Value;
  id v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  id v11;

  Property = objc_getProperty(a1, a2, 8, 1);
  dispatch_assert_queue_V2(Property);
  Value = SCPreferencesGetValue(a1[2], CFSTR("redirected-addresses"));
  v11 = (id)objc_claimAutoreleasedReturnValue(Value);
  if (isa_nsdictionary(v11))
  {
    v6 = objc_msgSend(v11, "mutableCopy");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
    v9 = isa_nsdictionary(v8);

    if (v9)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

    if (v6)
    {
      if (!SCPreferencesSetValue(a1[2], CFSTR("redirected-addresses"), v6) || !SCPreferencesCommitChanges(a1[2]))
        goto LABEL_12;
LABEL_10:
      sub_1000235F8(a1, v10);
      goto LABEL_12;
    }
  }
  if (!SCPreferencesRemoveValue(a1[2], CFSTR("redirected-addresses")))
  {
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
  if (SCPreferencesCommitChanges(a1[2]))
    goto LABEL_10;
LABEL_12:

}

id sub_100022780(void *a1, void *a2, void *a3, int a4, unsigned int a5, _BYTE *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v46;
  char v47;
  id v48;
  id v49;
  unsigned __int8 v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;

  v11 = a2;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_26;
  }
  v50 = 0;
  v12 = sub_100024234(a1, v11, a3, a4, a5, 0, a6, &v50);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!byte_100042D08)
  {
    v15 = v50;
    v16 = v13;
    v17 = v11;
    v18 = sub_100024EC4(v16);
    v19 = v18;
    if (v15)
    {
      v20 = objc_msgSend(v18, "count");
      if (v20 != (id)1)
      {
        v42 = ne_log_obj(v20, v21);
        v22 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v43 = objc_msgSend(v19, "count");
          *(_DWORD *)buf = 134217984;
          v52 = v43;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Synthentic UUID count is wrong (%lu)", buf, 0xCu);
        }
        goto LABEL_25;
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100042D18);
    v22 = sub_100023FBC();
    v48 = sub_100024198(v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", v17));
    v24 = objc_msgSend(v23, "isEqualToArray:", v19);
    v25 = (char)v24;
    v27 = ne_log_obj(v24, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    v47 = v25;
    if ((v25 & 1) != 0)
    {
      if (v29)
      {
        v30 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 134218242;
        v52 = v30;
        v53 = 2112;
        v54 = v17;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%lu UUIDs for %@ are already in the cache", buf, 0x16u);
      }

      v31 = v48;
      if (!v15)
        goto LABEL_24;
    }
    else
    {
      if (v29)
      {
        v32 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 134218242;
        v52 = v32;
        v53 = 2112;
        v54 = v17;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Caching %lu UUID(s) for %@", buf, 0x16u);
      }

      v31 = v48;
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v19, v17);
      if (!v15)
        goto LABEL_23;
    }
    v46 = v23;
    v49 = v16;
    v33 = sub_100024198(v22, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v17));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
    v36 = objc_msgSend(v34, "isEqualToData:", v35);

    v39 = ne_log_obj(v37, v38);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    if ((v36 & 1) != 0)
    {
      if (v41)
      {
        *(_DWORD *)buf = 138412290;
        v52 = v17;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "A synthetic UUID for %@ is already in the cache", buf, 0xCu);
      }

      v16 = v49;
      v23 = v46;
      if ((v47 & 1) != 0)
        goto LABEL_24;
    }
    else
    {
      if (v41)
      {
        *(_DWORD *)buf = 138412290;
        v52 = v17;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Caching a synthetic UUID for %@", buf, 0xCu);
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v44, v17);

      v16 = v49;
      v23 = v46;
    }
LABEL_23:
    sub_100025014((uint64_t)v22);
LABEL_24:
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042D18);

LABEL_25:
  }
LABEL_26:

  return v14;
}

void sub_100022B58(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100042D18);
    v6 = ne_log_obj(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing UUIDs for %@", buf, 0xCu);
    }

    v8 = (void *)sub_100025528();
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid-mappings")));
      if (v10)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = v3;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), (_QWORD)v19));

              if (v16)
              {

                v17 = objc_msgSend(v10, "mutableCopy");
                objc_msgSend(v17, "removeObjectsForKeys:", v11);
                v18 = objc_msgSend(v9, "mutableCopy");
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("uuid-mappings"));
                sub_100025014((uint64_t)v18);

                v11 = v17;
                goto LABEL_16;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_16:

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042D18);

  }
}

void sub_100022D54(void *a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _BYTE *v10;
  char v11;
  const char *v12;
  uint8_t v13[16];

  if (a1)
  {
    v3 = ne_log_obj(a1, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing the UUID cache", v13, 2u);
    }

    +[NEProcessInfo clearUUIDCache](NEProcessInfo, "clearUUIDCache");
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100042D18);
    v5 = (void *)sub_100025528();
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "mutableCopy");
    else
      v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = v7;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("uuid-mappings"));
    sub_100025014((uint64_t)v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042D18);
    v9 = sub_10000DDE4((uint64_t)NEHelperServer);
    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      v11 = v10[12];

      if ((v11 & 1) != 0)
        sub_100025568(a1, v12);
    }

  }
}

void sub_100022E60(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v5 = a2;
  v7 = v5;
  if (!a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appVPN"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appVPN"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appRules"));
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathController"));

      if (!v15)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relay"));

        if (!v20)
        {
LABEL_12:
          v10 = *(void **)(a1 + 40);
          v11 = 0;
          goto LABEL_13;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relay"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "perApp"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "appRules"));

LABEL_10:
        if (v16)
        {
          v17 = *(void **)(a1 + 48);
          v18 = *(unsigned int *)(a1 + 56);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
          sub_100023A40(v17, v16, v18, v19);

        }
        goto LABEL_12;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathController"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathRules"));
    }
    v16 = (void *)v14;
    goto LABEL_10;
  }
  v8 = ne_log_obj(v5, v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = 138412290;
    v24 = v22;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to load configuration %@", (uint8_t *)&v23, 0xCu);
  }

  v10 = *(void **)(a1 + 40);
  v11 = 2;
LABEL_13:
  sub_1000037E4((uint64_t)NEHelperServer, v10, v11, 0);

}

uint64_t sub_10002303C(SCPreferencesRef *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SEL v7;
  NSObject *Property;
  CFPropertyListRef Value;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __CFString *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __CFString *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  unsigned int v53;
  void *v54;
  id v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  __CFString *v64;

  v5 = a2;
  v6 = a3;
  Property = objc_getProperty(a1, v7, 8, 1);
  dispatch_assert_queue_V2(Property);
  Value = SCPreferencesGetValue(a1[2], CFSTR("services"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v60 = v10;
  if (isa_nsdictionary(v10))
    v11 = objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));
  v59 = v13;
  if (isa_nsdictionary(v13))
    v14 = objc_msgSend(v13, "mutableCopy");
  else
    v14 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = v14;
  v16 = ne_session_type_to_string(1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v17));

  v58 = v18;
  if (isa_nsdictionary(v18))
  {
    v19 = objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("included-routes"));
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("excluded-routes"));
  }
  else
  {
    v19 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("included-routes")));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("included-routes")));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("included-routes"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("excluded-routes")));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("excluded-routes")));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("excluded-routes"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v24);

  v25 = v6;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v6);
  if (SCPreferencesSetValue(a1[2], CFSTR("services"), v12) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_1000235F8(a1, v26);
    v27 = 1;
  }
  else
  {
    v27 = 0;
  }
  if (nelog_is_extra_vpn_logging_enabled())
  {
    v28 = v5;
    v29 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
    {
      v30 = (__CFString *)objc_alloc_init((Class)NSMutableString);
      v31 = objc_msgSend(v28, "mutableCopy");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("included-routes")));
      v54 = v25;
      if (v57)
      {
        v55 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("ipv4-subnets")));
        v33 = v32;
        if (v32)
        {
          v34 = v25;
          v35 = sub_1000236D8(v32);
          -[__CFString appendFormat:](v30, "appendFormat:", CFSTR("\nIPv4: %@"), v35);

          v25 = v34;
        }
        v36 = v30;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("ipv6-subnets")));
        v38 = v37;
        if (v37)
        {
          v39 = sub_1000236D8(v37);
          -[__CFString appendFormat:](v36, "appendFormat:", CFSTR("\nIPv6: %@"), v39);

          v25 = v54;
        }

        v30 = v36;
        v31 = v55;
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("excluded-routes")));
      v41 = v40;
      if (v40)
      {
        v56 = v30;
        v53 = v27;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("ipv4-subnets")));
        v43 = v42;
        if (v42)
        {
          v44 = sub_1000236D8(v42);
          -[__CFString appendFormat:](v56, "appendFormat:", CFSTR("\nIPv4 excluded: %@"), v44);

        }
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ipv6-subnets")));
        v46 = v45;
        if (v45)
        {
          v47 = v31;
          v48 = sub_1000236D8(v45);
          -[__CFString appendFormat:](v56, "appendFormat:", CFSTR("\nIPv6 excluded: %@"), v48);

          v31 = v47;
        }

        v25 = v54;
        v30 = v56;
        v27 = v53;
      }
      objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("included-routes"));
      objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("excluded-routes"));
      if (objc_msgSend(v31, "count"))
        -[__CFString appendFormat:](v30, "appendFormat:", CFSTR("\nextra: %@"), v31);

    }
    else
    {
      v30 = CFSTR("NULL");
    }

    v49 = ne_log_large_obj();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    v51 = v50;
    if ((v27 & 1) != 0)
    {
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v25;
        v63 = 2112;
        v64 = v30;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Set routes for service %@:%@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v25;
      v63 = 2112;
      v64 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to set routes for service %@:%@", buf, 0x16u);
    }

  }
  return v27;
}

void sub_1000235F8(void *a1, const char *a2)
{
  NSObject *Property;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 8, 1);
    dispatch_assert_queue_V2(Property);
    v3 = notify_post("com.apple.networkextension.ondemandcachechanged");
    if ((_DWORD)v3)
    {
      v5 = v3;
      v6 = ne_log_obj(v3, v4);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315394;
        v9 = "com.apple.networkextension.ondemandcachechanged";
        v10 = 1024;
        v11 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to post the %s notification: %u", (uint8_t *)&v8, 0x12u);
      }

    }
  }
}

id sub_1000236D8(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  id v8;
  char *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unsigned __int8 *v18;
  uint64_t v19;
  int v20;
  char v21;
  unsigned __int8 v22;
  BOOL v23;
  int v24;
  int v25;
  BOOL v26;
  id v27;
  id v28;
  char *v30;
  char v31[46];

  v1 = a1;
  v2 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) == 0 || objc_msgSend(v1, "count") != (id)2)
    goto LABEL_40;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("subnet-addresses")));
  v4 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
LABEL_39:

LABEL_40:
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
    goto LABEL_41;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("subnet-masks")));
  v6 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0
    || (v7 = (char *)objc_msgSend(v3, "count"), v7 != objc_msgSend(v5, "count")))
  {

    goto LABEL_39;
  }
  v8 = objc_alloc_init((Class)NSMutableString);
  if (v7)
  {
    v9 = 0;
    v10 = 0;
    v30 = v7;
    do
    {
      if ((v10 & 1) != 0)
        objc_msgSend(v8, "appendString:", CFSTR(", "));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v9));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v9));
      v13 = v11;
      v14 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        v15 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
        {
          v16 = (unint64_t)objc_msgSend(v13, "length");
          if ((id)v16 == objc_msgSend(v12, "length") && (v16 == 16 || v16 == 4))
          {
            if (v16 == 16)
              v17 = 30;
            else
              v17 = 2;
            if (inet_ntop(v17, objc_msgSend(v13, "bytes"), v31, 0x2Eu))
            {
              v18 = (unsigned __int8 *)objc_msgSend(v12, "bytes");
              v19 = 0;
              v20 = 0;
              v21 = 0;
              v22 = 0;
LABEL_20:
              v23 = v21;
              while (2)
              {
                v24 = v18[v19];
                v25 = 7;
                v26 = v23;
                do
                {
                  v23 = ((1 << v25) & v24) == 0;
                  if (((1 << v25) & v24) != 0)
                  {
                    ++v22;
                    if (v26)
                    {
                      v19 = ++v20;
                      v21 = 1;
                      if (v16 > v20)
                        goto LABEL_20;
                      goto LABEL_30;
                    }
                  }
                  --v25;
                  v26 = v23;
                }
                while (v25 != -1);
                v19 = ++v20;
                if (v16 > v20)
                  continue;
                break;
              }
              if ((v21 & 1) == 0)
              {
                if (8 * v16 == v22)
                  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31));
                else
                  v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s/%u"), v31, v22);
                v27 = v28;
                v7 = v30;
                goto LABEL_32;
              }
            }
LABEL_30:
            v7 = v30;
          }
        }
      }
      v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("[%@/%@]"), v13, v12);
LABEL_32:

      objc_msgSend(v8, "appendString:", v27);
      ++v9;
      v10 = 1;
    }
    while (v9 != v7);
  }

LABEL_41:
  return v8;
}

void sub_100023A40(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  char v14;
  void *i;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  char v60;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];

  v7 = a2;
  v56 = a4;
  if (!a1)
    goto LABEL_40;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100042D18);
  v8 = sub_100023FBC();
  v9 = sub_100024198(v8, 0);
  v53 = sub_100024198(v8, 1);
  v11 = ne_log_obj(v53, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v67 = v56;
    v68 = 2048;
    v69 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Populating the cache with UUIDs for %lu app rules", buf, 0x16u);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v13 = v7;
  v59 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (!v59)
  {

    goto LABEL_36;
  }
  v51 = (uint64_t)v8;
  v52 = v7;
  v14 = 0;
  v58 = *(_QWORD *)v63;
  v55 = v13;
  v54 = a1;
  do
  {
    for (i = 0; i != v59; i = (char *)i + 1)
    {
      if (*(_QWORD *)v63 != v58)
        objc_enumerationMutation(v13);
      v16 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
      v17 = objc_opt_class(NEPathRule);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        v18 = v16;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "matchSigningIdentifier"));
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("PathRuleDefaultIdentifier"));

        if ((v20 & 1) != 0)
          goto LABEL_29;
      }
      else
      {
        v18 = 0;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchSigningIdentifier", v51, v52));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v21));

      if (!v22)
      {
        v61 = 0;
        if (v18)
          v23 = objc_msgSend(v18, "isIdentifierExternal");
        else
          v23 = 0;
        v60 = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchSigningIdentifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchPath"));
        v26 = sub_100024234(a1, v24, v25, v23, a3, 0, &v61, &v60);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

        v28 = sub_100024EC4(v27);
        v30 = ne_log_obj(v28, v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v9;
          v33 = objc_msgSend(v27, "count");
          v57 = v28;
          v34 = v27;
          v35 = a3;
          if (v60)
            v36 = CFSTR("synthetic ");
          else
            v36 = &stru_10003A6B8;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchSigningIdentifier"));
          *(_DWORD *)buf = 138413058;
          v67 = v56;
          v68 = 2048;
          v69 = v33;
          v9 = v32;
          a1 = v54;
          v70 = 2112;
          v71 = v36;
          a3 = v35;
          v27 = v34;
          v28 = v57;
          v72 = 2112;
          v73 = v37;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: Populating the cache with %lu %@UUID(s) for %@", buf, 0x2Au);

          v13 = v55;
        }

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchSigningIdentifier"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, v38);

        if (v60)
        {
          v39 = objc_msgSend(v28, "count");
          if (v39 == (id)1)
          {
            v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchSigningIdentifier"));
            objc_msgSend(v53, "setObject:forKeyedSubscript:", v41, v42);

          }
          else
          {
            v43 = ne_log_obj(v39, v40);
            v41 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v44 = objc_msgSend(v28, "count");
              *(_DWORD *)buf = 138412546;
              v67 = v56;
              v68 = 2048;
              v69 = v44;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%@: Cannot populate synthesized UUID, count is wrong (%lu)", buf, 0x16u);
            }
          }

        }
        v14 = 1;
      }
LABEL_29:

    }
    v59 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  }
  while (v59);

  v8 = (void *)v51;
  v7 = v52;
  if ((v14 & 1) != 0)
  {
    v47 = ne_log_obj(v45, v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v56;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@: Saving the cache", buf, 0xCu);
    }

    sub_100025014(v51);
    goto LABEL_39;
  }
LABEL_36:
  v49 = ne_log_obj(v45, v46);
  v50 = objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v56;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%@: Cache was already fully populated", buf, 0xCu);
  }

LABEL_39:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042D18);

LABEL_40:
}

void *sub_100023FBC()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t boot_session_uuid;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t v16[16];
  uint8_t buf[8];
  uint64_t v18;

  v0 = (void *)sub_100025528();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "mutableCopy");
  else
    v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("os-version")));

  if (!v4)
  {
    v5 = ne_session_copy_os_version_string();
    if (v5)
    {
      v7 = (void *)v5;
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v5, 4);
      free(v7);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("os-version"));
    }
    else
    {
      v9 = ne_log_obj(0, v6);
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get the current OS version", buf, 2u);
      }
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("boot-uuid")));

  if (!v10)
  {
    *(_QWORD *)buf = 0;
    v18 = 0;
    boot_session_uuid = ne_session_get_boot_session_uuid(buf);
    if ((_DWORD)boot_session_uuid)
    {
      v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 16);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("boot-uuid"));
    }
    else
    {
      v14 = ne_log_obj(boot_session_uuid, v12);
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to get the current boot session UUID", v16, 2u);
      }
    }

  }
  return v3;
}

id sub_100024198(void *a1, int a2)
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = CFSTR("uuid-mappings");
  if (a2)
    v3 = CFSTR("synthesized-uuid-mappings");
  v4 = v3;
  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "mutableCopy");
  else
    v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = v8;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v4);

  return v9;
}

id sub_100024234(void *a1, void *a2, void *a3, int a4, unsigned int a5, unint64_t a6, _BYTE *a7, _BYTE *a8)
{
  id v13;
  id v14;
  SEL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  id v30;
  SEL v31;
  NSObject *Property;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  SEL v44;
  NSObject *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  _BYTE *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  SEL v58;
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *i;
  void *v65;
  void *v66;
  unsigned __int8 v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  unint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  unsigned int v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  id v106;
  _BYTE *v108;
  _BYTE *v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  int v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  unint64_t v120;
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  void *v129;
  uint64_t v130;
  id v131;
  _BYTE buf[24];
  void *v133;

  v13 = a2;
  v14 = a3;
  v16 = objc_getProperty(a1, v15, 8, 1);
  dispatch_assert_queue_V2(v16);

  if (a6 < 0xB)
  {
    if (v14)
    {
      v131 = v14;
      v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v131, 1));
    }
    else
    {
      v22 = 0;
    }
    v114 = a4;
    v119 = v22;
    if (isa_nsarray(v22))
    {
      v23 = sub_100025290(a1, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (isa_nsarray(v24))
      {
        v25 = objc_msgSend(v24, "count") == 0;
LABEL_13:
        v120 = a6;
        if (!v14 && v25)
        {
          v123 = 0;
          v26 = objc_claimAutoreleasedReturnValue(+[NELaunchServices bundleProxyForIdentifier:uid:plugins:](NELaunchServices, "bundleProxyForIdentifier:uid:plugins:", v13, a5, &v123));
          v27 = (unint64_t)v123;
          if (objc_msgSend((id)v27, "count") && objc_msgSend((id)v26, "isWatchKitApp"))
          {

            v26 = 0;
          }
          if (v26 | v27)
          {
            v108 = a8;
            v111 = v13;
            *a7 = 1;
            v28 = (id)v26;
            v29 = (id)v27;
            v30 = v24;
            Property = objc_getProperty(a1, v31, 8, 1);
            dispatch_assert_queue_V2(Property);
            v117 = v28;
            v33 = sub_100025420(a1, v28, v30);
            v24 = (void *)objc_claimAutoreleasedReturnValue(v33);
            v124 = 0u;
            v125 = 0u;
            v126 = 0u;
            v127 = 0u;
            v34 = v29;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v125;
              do
              {
                v38 = 0;
                v39 = v24;
                do
                {
                  if (*(_QWORD *)v125 != v37)
                    objc_enumerationMutation(v34);
                  v40 = sub_100025420(a1, *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)v38), v39);
                  v24 = (void *)objc_claimAutoreleasedReturnValue(v40);

                  v38 = (char *)v38 + 1;
                  v39 = v24;
                }
                while (v36 != v38);
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
              }
              while (v36);
            }

            v14 = 0;
            v13 = v111;
            a8 = v108;
          }

        }
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100042CD8, "objectForKeyedSubscript:", v13));
        v118 = (void *)v41;
        if (isa_nsstring(v41))
        {
          v130 = v41;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v130, 1));
        }
        else if (*a7)
        {
          v42 = 0;
        }
        else
        {
          v43 = v13;
          v45 = objc_getProperty(a1, v44, 8, 1);
          dispatch_assert_queue_V2(v45);
          v46 = v43;
          v47 = v46;
          if (objc_msgSend(v46, "hasPrefix:", CFSTR("com.apple.")))
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "substringFromIndex:", 10));

            if (objc_msgSend(v47, "hasPrefix:", CFSTR("icloud.")))
            {
              v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "substringFromIndex:", 7));

              v47 = (void *)v48;
            }
          }
          if (objc_msgSend(v47, "rangeOfCharacterFromSet:", qword_100042CE8) == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/usr/libexec/"), "stringByAppendingString:", v47));
            *(_QWORD *)buf = v115;
            v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/usr/sbin/"), "stringByAppendingString:", v47));
            *(_QWORD *)&buf[8] = v112;
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/usr/local/bin/"), "stringByAppendingString:", v47));
            *(_QWORD *)&buf[16] = v49;
            v50 = a8;
            v51 = v14;
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/usr/bin/"), "stringByAppendingString:", v47));
            v133 = v52;
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 4));

            v14 = v51;
            a8 = v50;

          }
          else
          {
            v42 = 0;
          }

        }
        v116 = v42;
        if (isa_nsarray(v42))
        {
          v53 = sub_100025290(a1, v42);
          v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          if (isa_nsarray(v54) && objc_msgSend(v54, "count"))
          {
            if (isa_nsarray(v24) && objc_msgSend(v24, "count"))
              v55 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v54));
            else
              v55 = v54;
            v56 = v55;

            v24 = v56;
          }

        }
        v57 = v13;
        v59 = objc_getProperty(a1, v58, 8, 1);
        dispatch_assert_queue_V2(v59);
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v60 = (id)qword_100042CD0;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
        if (v61)
        {
          v62 = v61;
          v109 = a8;
          v110 = v14;
          v113 = v13;
          v63 = *(_QWORD *)v125;
          while (2)
          {
            for (i = 0; i != v62; i = (char *)i + 1)
            {
              if (*(_QWORD *)v125 != v63)
                objc_enumerationMutation(v60);
              v65 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i);
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndexedSubscript:", 0));
              v67 = objc_msgSend(v57, "isEqualToString:", v66);

              if ((v67 & 1) != 0)
              {
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndexedSubscript:", 1));
                goto LABEL_58;
              }
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
            if (v62)
              continue;
            break;
          }
          v68 = 0;
LABEL_58:
          v14 = v110;
          v13 = v113;
          a8 = v109;
        }
        else
        {
          v68 = 0;
        }

        if (isa_nsuuid(v68))
        {
          v69 = v120;
          if (isa_nsarray(v24) && objc_msgSend(v24, "count"))
          {
            v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arrayByAddingObject:", v68));
          }
          else
          {
            v129 = v68;
            v70 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v129, 1));
          }
          v71 = (void *)v70;

          v24 = v71;
        }
        else
        {
          v69 = v120;
        }
        if ((!isa_nsarray(v24) || !objc_msgSend(v24, "count"))
          && objc_msgSend(v57, "hasPrefix:", CFSTR("com.apple.webapp-")))
        {
          v72 = sub_100024234(a1, CFSTR("com.apple.webapp"), v14, 0, a5, v69 + 1, a7, a8);
          v73 = objc_claimAutoreleasedReturnValue(v72);

          v24 = (void *)v73;
        }
        if (!isa_nsarray(v24) || !objc_msgSend(v24, "count"))
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100042CE0, "objectForKeyedSubscript:", v57));
          if (isa_nsstring(v74))
          {
            v75 = sub_100024234(a1, v74, v14, 0, a5, v69 + 1, a7, a8);
            v76 = objc_claimAutoreleasedReturnValue(v75);

            v24 = (void *)v76;
          }

        }
        if (isa_nsarray(v24))
        {
          if ((unint64_t)objc_msgSend(v24, "count") | v69)
            goto LABEL_85;
        }
        else if (v69)
        {
          goto LABEL_85;
        }
        if (objc_msgSend(v57, "hasPrefix:", CFSTR("iCloud.")))
        {
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "substringFromIndex:", 7));
          v78 = v69 + 1;
          v79 = sub_100024234(a1, v77, v14, 0, a5, v78, a7, a8);
          v80 = (void *)objc_claimAutoreleasedReturnValue(v79);

          if (!isa_nsarray(v80) || !objc_msgSend(v80, "count"))
          {
            v81 = sub_100024234(a1, CFSTR("com.apple.bird"), v14, 0, a5, v78, a7, a8);
            v82 = objc_claimAutoreleasedReturnValue(v81);

            v80 = (void *)v82;
          }

          v24 = v80;
          v69 = v120;
        }
LABEL_85:
        if (isa_nsarray(v24))
        {
          if ((unint64_t)objc_msgSend(v24, "count") | v69)
            goto LABEL_94;
        }
        else if (v69)
        {
          goto LABEL_94;
        }
        if (objc_msgSend(v57, "hasPrefix:", CFSTR("com.apple.clouddocs.")))
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "substringFromIndex:", 20));
          v84 = v69 + 1;
          v85 = sub_100024234(a1, v83, v14, 0, a5, v84, a7, a8);
          v86 = (void *)objc_claimAutoreleasedReturnValue(v85);

          if (!isa_nsarray(v86) || !objc_msgSend(v86, "count"))
          {
            v87 = sub_100024234(a1, CFSTR("com.apple.bird"), v14, 0, a5, v84, a7, a8);
            v88 = objc_claimAutoreleasedReturnValue(v87);

            v86 = (void *)v88;
          }

          v24 = v86;
          v69 = v120;
        }
LABEL_94:
        if ((!isa_nsarray(v24) || !objc_msgSend(v24, "count"))
          && objc_msgSend(v57, "hasPrefix:", CFSTR("com.apple.CloudDocs")))
        {
          v89 = sub_100024234(a1, CFSTR("com.apple.bird"), v14, 0, a5, v69 + 1, a7, a8);
          v90 = objc_claimAutoreleasedReturnValue(v89);

          v24 = (void *)v90;
        }
        if (isa_nsarray(v24))
        {
          if ((unint64_t)objc_msgSend(v24, "count") | v69)
            goto LABEL_104;
        }
        else if (v69)
        {
          goto LABEL_104;
        }
        if (objc_msgSend(v57, "hasPrefix:", CFSTR("com.apple.cloudkit.")))
        {
          v91 = sub_100024234(a1, CFSTR("com.apple.cloudd"), v14, 0, a5, v69 + 1, a7, a8);
          v92 = objc_claimAutoreleasedReturnValue(v91);

          v24 = (void *)v92;
        }
LABEL_104:
        if (isa_nsarray(v24))
        {
          if ((unint64_t)objc_msgSend(v24, "count") | v69)
            goto LABEL_112;
        }
        else if (v69)
        {
          goto LABEL_112;
        }
        if ((objc_msgSend(v57, "hasPrefix:", CFSTR("com.automation.")) & 1) != 0
          || (objc_msgSend(v57, "hasPrefix:", CFSTR("com.iosframeworksqa.")) & 1) != 0
          || objc_msgSend(v57, "hasPrefix:", CFSTR("com.atvqa.")))
        {
          v93 = sub_100024234(a1, CFSTR("com.apple.coreautomationd"), v14, 0, a5, v69 + 1, a7, a8);
          v94 = objc_claimAutoreleasedReturnValue(v93);

          v24 = (void *)v94;
        }
LABEL_112:
        if (isa_nsarray(v24))
        {
          if ((unint64_t)objc_msgSend(v24, "count") | v69)
            goto LABEL_120;
        }
        else if (v69)
        {
          goto LABEL_120;
        }
        if ((unint64_t)objc_msgSend(v57, "length") >= 0xC
          && objc_msgSend(v57, "rangeOfCharacterFromSet:", qword_100042CF0) == (id)10)
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "substringWithRange:", 10, 1));
          v96 = objc_msgSend(v95, "isEqualToString:", CFSTR("."));

          if (v96)
          {
            v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "substringFromIndex:", 11));
            v98 = sub_100024234(a1, v97, v14, 0, a5, v69 + 1, a7, a8);
            v99 = objc_claimAutoreleasedReturnValue(v98);

            v24 = (void *)v99;
          }
        }
LABEL_120:
        if (isa_nsarray(v24))
        {
          if ((unint64_t)objc_msgSend(v24, "count") | v69 || (v114 & 1) == 0)
          {
LABEL_129:
            v21 = v24;

            v20 = v119;
            goto LABEL_130;
          }
        }
        else if (v69 || !v114)
        {
          goto LABEL_129;
        }
        v100 = objc_alloc_init((Class)NSUUID);
        v128 = v100;
        v101 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v128, 1));

        v104 = ne_log_obj(v102, v103);
        v105 = objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          v106 = objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v100;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v106;
          _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "Synthesized UUID %@ for bundle ID %s", buf, 0x16u);
        }

        *a8 = 1;
        v24 = (void *)v101;
        goto LABEL_129;
      }
    }
    else
    {
      v24 = 0;
    }
    v25 = 1;
    goto LABEL_13;
  }
  v19 = ne_log_obj(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "we are out of our depths!", buf, 2u);
  }
  v21 = 0;
LABEL_130:

  return v21;
}

id sub_100024EC4(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];
  _BYTE v16[128];

  v1 = a1;
  v2 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (isa_nsuuid(v8))
        {
          v15[0] = 0;
          v15[1] = 0;
          objc_msgSend(v8, "getUUIDBytes:", v15, (_QWORD)v11);
          v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v15, 16);
          objc_msgSend(v2, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_100025014(uint64_t a1)
{
  void *v1;
  char *v2;
  uint64_t v3;
  char *v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;

  v21 = 0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a1, 200, 0, &v21));
  v2 = (char *)v21;
  v4 = v2;
  if (v1)
    v5 = v2 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    v6 = ne_log_obj(v2, v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      v8 = "Failed to serialize the cache plist: %@";
      v9 = v7;
      v10 = 12;
LABEL_22:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v11 = objc_msgSend(v1, "writeToFile:atomically:", CFSTR("/Library/Preferences/com.apple.networkextension.uuidcache.plist"), 1);
  if ((v11 & 1) == 0)
  {
    v20 = ne_log_obj(v11, v12);
    v7 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "Failed to write the serialized cache to disk";
      v9 = v7;
      v10 = 2;
      goto LABEL_22;
    }
LABEL_19:

    goto LABEL_20;
  }
  v13 = ne_force_reset_uuid_cache();
  if (dword_1000429E4 != -1)
    goto LABEL_14;
  v13 = notify_register_check("com.apple.networkextension.uuidcache", &dword_1000429E4);
  if ((_DWORD)v13)
  {
    v15 = v13;
    dword_1000429E4 = -1;
    v16 = ne_log_obj(v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "com.apple.networkextension.uuidcache";
      v24 = 1024;
      v25 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", buf, 0x12u);
    }

  }
  if (dword_1000429E4 != -1)
  {
LABEL_14:
    ++qword_100042D10;
    v18 = ne_log_obj(v13, v14);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = (const char *)qword_100042D10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting UUID cache generation to %llu", buf, 0xCu);
    }

    if (!notify_set_state(dword_1000429E4, qword_100042D10))
      notify_post("com.apple.networkextension.uuidcache");
  }
LABEL_20:

}

id sub_100025290(void *a1, void *a2)
{
  id v3;
  SEL v4;
  NSObject *Property;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a2;
  Property = objc_getProperty(a1, v4, 8, 1);
  dispatch_assert_queue_V2(Property);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", (_QWORD)v17));
        v14 = objc_msgSend(v13, "isReadableFileAtPath:", v12);

        if (v14)
        {
          v15 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", v12);
          if (v9)
            objc_msgSend(v9, "addObjectsFromArray:", v15);
          else
            v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id sub_100025420(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SEL v7;
  NSObject *Property;
  void *v9;
  id v10;
  uint64_t v12;

  v5 = a3;
  v6 = a2;
  Property = objc_getProperty(a1, v7, 8, 1);
  dispatch_assert_queue_V2(Property);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "machOUUIDs"));

  if (!isa_nsarray(v9) || !objc_msgSend(v9, "count"))
    goto LABEL_6;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2
    && +[NEProcessInfo is64bitCapable](NEProcessInfo, "is64bitCapable"))
  {
    v10 = objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v10, "exchangeObjectAtIndex:withObjectAtIndex:", (char *)objc_msgSend(v9, "count") - 1, 0);
    if (!v10)
    {
LABEL_6:
      v10 = v5;
      goto LABEL_7;
    }
  }
  else
  {
    v10 = objc_msgSend(v9, "copy");
    if (!v10)
      goto LABEL_6;
  }
  if (v5)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v10));

    v10 = (id)v12;
  }
LABEL_7:

  return v10;
}

uint64_t sub_100025528()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v0 = ne_copy_uuid_cache();
  v1 = (void *)v0;
  if (v0)
    v2 = _CFXPCCreateCFObjectFromXPCObject(v0);
  else
    v2 = 0;

  return v2;
}

void sub_100025568(void *a1, const char *a2)
{
  NSObject *Property;
  _QWORD block[5];

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 8, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000255D4;
    block[3] = &unk_1000397A0;
    block[4] = a1;
    dispatch_async(Property, block);
  }
}

void sub_1000255D4(uint64_t a1)
{
  const char *v2;
  void *v3;
  void *v4;
  id Property;
  uint64_t v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    Property = objc_getProperty(v4, v2, 8, 1);
    v6 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 0;
    Property = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025674;
  v7[3] = &unk_100039830;
  v7[4] = v6;
  objc_msgSend(v3, "loadConfigurationsWithCompletionQueue:handler:", Property, v7);

}

void sub_100025674(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(v13, "count"))
  {
    v3 = objc_msgSend(v13, "indexOfObjectPassingTest:", &stru_100039808);
    if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v3));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appVPN"));

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appVPN"));
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appRules"));
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathController"));

        if (!v8)
        {
LABEL_9:

          goto LABEL_10;
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathController"));
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathRules"));
      }
      v9 = (void *)v7;

      if (v9)
      {
        v10 = *(void **)(a1 + 32);
        v11 = NEGetConsoleUserUID();
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        sub_100023A40(v10, v9, v11, v12);

      }
      goto LABEL_9;
    }
  }
LABEL_10:

}

BOOL sub_100025790(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a2;
  v5 = objc_opt_class(NEConfiguration);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.commcenter.ne.cellularusage"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_100025808(id a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __SCPreferences *v19;
  const __SCPreferences *v20;
  const __CFNumber *Value;
  NEHelperCacheManager *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  int valuePtr;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[9];

  v43[0] = CFSTR("com.apple.datausage.dataaccess.activesync");
  v33 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("D61963E5-13EC-4EAB-A9EB-E6C9BF4D266B"));
  v43[1] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
  v44[0] = v32;
  v42[0] = CFSTR("com.apple.datausage.telephony.mms");
  v31 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("569F2700-CAF9-483D-B19D-7AF406DCE15E"));
  v42[1] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
  v44[1] = v30;
  v41[0] = CFSTR("com.apple.datausage.atc");
  v29 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("B3F98213-9C65-405E-BB33-55FA02C7E003"));
  v41[1] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
  v44[2] = v28;
  v40[0] = CFSTR("com.apple.datausage.telephony.ims");
  v27 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("67A03811-DB0A-594E-C2AE-8B0517EDF26F"));
  v40[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
  v44[3] = v26;
  v39[0] = CFSTR("com.apple.icloud.restore");
  v25 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("D444877C-8E3A-461F-97E2-17A8C4B9924E"));
  v39[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
  v44[4] = v24;
  v38[0] = CFSTR("com.apple.datausage.airdrop");
  v1 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("9CE8B501-90E7-456E-952B-4937ED29C7BD"));
  v38[1] = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
  v44[5] = v2;
  v37[0] = CFSTR("com.apple.datausage.dns.multicast");
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("979C0A62-49FE-4739-BDCB-CAC584AC832D"));
  v37[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
  v44[6] = v4;
  v36[0] = CFSTR("com.apple.datausage.telephony.rcs");
  v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("CE95569A-401E-4586-ABCF-1231D42E1D3C"));
  v36[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
  v44[7] = v6;
  v35[0] = CFSTR("com.apple.mobileassetd.client.auto-asset-client");
  v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("5C5BCB61-2C52-4D1F-9C1B-A5049F4998E8"));
  v35[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  v44[8] = v8;
  v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 9));
  v10 = (void *)qword_100042CD0;
  qword_100042CD0 = v9;

  v11 = (void *)qword_100042CD8;
  qword_100042CD8 = (uint64_t)&off_10003FD30;

  v12 = (void *)qword_100042CE0;
  qword_100042CE0 = (uint64_t)&off_10003FD58;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-+")));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "invertedSet"));
  v15 = (void *)qword_100042CE8;
  qword_100042CE8 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "invertedSet"));
  v18 = (void *)qword_100042CF0;
  qword_100042CF0 = v17;

  v19 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("NEHelper control settings"), CFSTR("/Library/Preferences/com.apple.networkextension.control.plist"));
  if (v19)
  {
    v20 = v19;
    Value = (const __CFNumber *)SCPreferencesGetValue(v19, CFSTR("DisableUUIDDiskCache"));
    NEInitCFTypes(Value);
    if (NEIsValidCFType(Value, CFNUMBER_TYPE))
    {
      valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      byte_100042D08 = valuePtr != 0;
    }
    CFRelease(v20);
  }
  v22 = objc_alloc_init(NEHelperCacheManager);
  v23 = (void *)qword_100042D00;
  qword_100042D00 = (uint64_t)v22;

}

void sub_100025CB4(uint64_t a1)
{
  uint64_t v2;
  const __SCPreferences *v3;
  CFPropertyListRef Value;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __SCPreferences *v9;
  uint64_t v10;
  const __SCPreferences *v11;
  const char *v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(const __SCPreferences **)(v2 + 16);
  else
    v3 = 0;
  Value = SCPreferencesGetValue(v3, CFSTR("services"));
  v13 = (id)objc_claimAutoreleasedReturnValue(Value);
  if (isa_nsdictionary())
    v5 = objc_msgSend(v13, "mutableCopy");
  else
    v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  if (v7)
  {
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v8 ? *(const __SCPreferences **)(v8 + 16) : 0;
    if (SCPreferencesSetValue(v9, CFSTR("services"), v6))
    {
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        v11 = *(const __SCPreferences **)(v10 + 16);
      else
        v11 = 0;
      if (SCPreferencesCommitChanges(v11))
        sub_1000235F8(*(void **)(a1 + 32), v12);
    }
  }

}

void sub_100025DA4(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;

  v4 = 0;
  v2 = sub_100022780(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 0, 0, &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_100025E00(void *a1, const char *a2)
{
  NSObject *Property;
  _QWORD block[5];

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 8, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025E6C;
    block[3] = &unk_1000397A0;
    block[4] = a1;
    dispatch_async(Property, block);
  }
}

void sub_100025E6C(uint64_t a1, uint64_t a2)
{
  sub_100022D54(*(void **)(a1 + 32), a2);
}

void sub_100025E74(void *a1, const char *a2)
{
  NSObject *Property;
  _QWORD block[5];

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 8, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025EE0;
    block[3] = &unk_1000397A0;
    block[4] = a1;
    dispatch_async(Property, block);
  }
}

void sub_100025EE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const __SCPreferences *v6;

  +[NEProcessInfo clearUUIDCache](NEProcessInfo, "clearUUIDCache");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 16);
  else
    v3 = 0;
  if (SCPreferencesRemoveAllValues(v3))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(const __SCPreferences **)(v5 + 16);
    else
      v6 = 0;
    if (SCPreferencesCommitChanges(v6))
      sub_1000235F8(*(void **)(a1 + 32), v4);
  }
  sub_100022D54(*(void **)(a1 + 32), (uint64_t)v4);
}

void sub_100025F4C(void *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  NSObject *Property;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 8, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026008;
    block[3] = &unk_1000397C8;
    block[4] = a1;
    v10 = v5;
    v11 = v7;
    dispatch_async(Property, block);

  }
}

uint64_t sub_100026008(uint64_t a1)
{
  sub_100022B58(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_100026970(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
    if (v5)
    {
      v7 = ne_log_obj(v5, v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v14 = objc_msgSend(v4, "count");
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Found %lu UUID(s) by lookup for bundle id: %@", buf, 0x16u);
      }

      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject", 0, 0));
      v11 = v9;
      if (v9)
        v9 = objc_msgSend(v9, "getUUIDBytes:", &v17);
      v12 = ne_log_obj(v9, v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        v20 = 2112;
        v21 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Found UUID: %@ for bundleID: %@", buf, 0x16u);
      }

      if (!uuid_is_null((const unsigned __int8 *)&v17))
        xpc_dictionary_set_uuid(*(xpc_object_t *)(a1 + 40), "app-euuid", (const unsigned __int8 *)&v17);

    }
  }
  sub_1000037E4((uint64_t)NEHelperServer, *(void **)(a1 + 48), 0, *(void **)(a1 + 40));

}

uint64_t start()
{
  void *v0;
  id v1;
  int *v2;
  void *v3;
  SEL v4;
  NSObject *Property;
  SEL v6;
  NSObject *v7;
  SEL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  SEL v14;
  _xpc_connection_s *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD handler[5];
  __int128 block;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  int *v28;

  v0 = objc_autoreleasePoolPush();
  if (qword_100042D20 != -1)
    dispatch_once(&qword_100042D20, &stru_100039898);
  v1 = sub_10000DDE4((uint64_t)NEHelperServer);
  v2 = (int *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
    objc_msgSend(v3, "postGeneration");

    Property = objc_getProperty(v2, v4, 24, 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000DF94;
    handler[3] = &unk_1000394A8;
    handler[4] = v2;
    xpc_set_event_stream_handler("com.apple.fsevents.matching", Property, handler);
    v7 = objc_getProperty(v2, v6, 24, 1);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000DFA4;
    v23[3] = &unk_1000394A8;
    v23[4] = v2;
    xpc_set_event_stream_handler("com.apple.distnoted.matching", v7, v23);
    v9 = objc_getProperty(v2, v8, 24, 1);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000DFB4;
    v22[3] = &unk_100038E58;
    v22[4] = v2;
    v10 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", v2 + 4, v9, v22);
    if ((_DWORD)v10)
    {
      v12 = ne_log_obj(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 136315138;
        *(_QWORD *)((char *)&block + 4) = "com.apple.mobile.keybagd.first_unlock";
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification", (uint8_t *)&block, 0xCu);
      }

    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000DFBC;
    v21[3] = &unk_100038E80;
    v21[4] = v2;
    +[MOEffectiveSettings startObservingChangesWithHandler:](MOEffectiveSettings, "startObservingChangesWithHandler:", v21);
    v15 = (_xpc_connection_s *)objc_getProperty(v2, v14, 32, 1);
    xpc_connection_resume(v15);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create("check launch services", v17);

    *(_QWORD *)&block = _NSConcreteStackBlock;
    *((_QWORD *)&block + 1) = 3221225472;
    v26 = sub_10000E0AC;
    v27 = &unk_1000397A0;
    v28 = v2;
    dispatch_async(v18, &block);

  }
  objc_autoreleasePoolPop(v0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v19, "run");

  return 0;
}

void sub_100026DDC(id a1)
{
  dispatch_queue_attr_t v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = dispatch_queue_create("nw_privileged_queue", v2);
  v4 = (void *)qword_100042D28;
  qword_100042D28 = (uint64_t)v3;

  NWPrivilegedHelperStart(qword_100042D28);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SDKVersion");
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SSID");
}

id objc_msgSend_SSIDPrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SSIDPrefix");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_VPN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "VPN");
}

id objc_msgSend__checkAndExerciseAuthorizationForBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkAndExerciseAuthorizationForBundleID:error:");
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endpoint");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_addCellularBehavior_grade_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCellularBehavior:grade:");
}

id objc_msgSend_addGroups_forApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGroups:forApp:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addWiFiBehavior_grade_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addWiFiBehavior:grade:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowedClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedClient");
}

id objc_msgSend_alwaysOnVPN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alwaysOnVPN");
}

id objc_msgSend_appGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appGroups");
}

id objc_msgSend_appPush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appPush");
}

id objc_msgSend_appRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appRules");
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appState");
}

id objc_msgSend_appVPN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appVPN");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "application");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIdentifier");
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationName");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationProxyForIdentifier_placeholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationProxyForIdentifier:placeholder:");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationState");
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationType");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleProxyForIdentifier_uid_plugins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleProxyForIdentifier:uid:plugins:");
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_canBlockRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canBlockRequest");
}

id objc_msgSend_cancelCurrentNotificationWithResponse_queue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelCurrentNotificationWithResponse:queue:completionHandler:");
}

id objc_msgSend_cellularBehavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellularBehavior");
}

id objc_msgSend_certificateReferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateReferences");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_clearSystemKeychain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearSystemKeychain");
}

id objc_msgSend_clearUUIDCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearUUIDCache");
}

id objc_msgSend_clientTrustChainReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientTrustChainReference");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_commonPrefixWithString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commonPrefixWithString:options:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingBundle");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentFilter");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyAppGroupMapDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyAppGroupMapDidChange:");
}

id objc_msgSend_copyAppRuleBySigningIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyAppRuleBySigningIdentifier:");
}

id objc_msgSend_copyIdentities_fromDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyIdentities:fromDomain:");
}

id objc_msgSend_copyPasswordsFromSystemKeychain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPasswordsFromSystemKeychain");
}

id objc_msgSend_copyUUIDsForBundleID_uid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyUUIDsForBundleID:uid:");
}

id objc_msgSend_copyUUIDsForExecutable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyUUIDsForExecutable:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_denyCellularFallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denyCellularFallback");
}

id objc_msgSend_denyMulticast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denyMulticast");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "developerType");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dnsProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dnsProxy");
}

id objc_msgSend_dnsSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dnsSettings");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainName");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_eapSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eapSettings");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endowmentNamespaces");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_entitlementValueForKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlementValueForKey:ofClass:");
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlements");
}

id objc_msgSend_enumerateApplicationsOfType_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateApplicationsOfType:block:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_externalIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalIdentifier");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishEncoding");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getCurrentUserUUIDForConfigurationID_fromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentUserUUIDForConfigurationID:fromIndex:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_grade(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "grade");
}

id objc_msgSend_handleApplicationsRemoved_completionQueue_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleApplicationsRemoved:completionQueue:withCompletionHandler:");
}

id objc_msgSend_handleFileRemovedWithCompletionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFileRemovedWithCompletionQueue:completionHandler:");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForPredicate:error:");
}

id objc_msgSend_handleMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMessage:");
}

id objc_msgSend_handlerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlerQueue");
}

id objc_msgSend_hasNonDefaultRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasNonDefaultRules");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidden");
}

id objc_msgSend_hs20Settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hs20Settings");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identity");
}

id objc_msgSend_identityData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityData");
}

id objc_msgSend_identityDataPassword(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityDataPassword");
}

id objc_msgSend_identityReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityReference");
}

id objc_msgSend_identityReferenceInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityReferenceInternal");
}

id objc_msgSend_ignoreRouteRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoreRouteRules");
}

id objc_msgSend_importPKCS12Data_passphrase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "importPKCS12Data:passphrase:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_initAndShowAddConfigurationsForApp_warningHeader_warning_callbackQueue_callbackHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAndShowAddConfigurationsForApp:warningHeader:warning:callbackQueue:callbackHandler:");
}

id objc_msgSend_initAndShowLocalNetworkAlertWithAppName_reasonString_extensionItem_callbackQueue_callbackHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAndShowLocalNetworkAlertWithAppName:reasonString:extensionItem:callbackQueue:callbackHandler:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:copyItems:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithFirstMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFirstMessage:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentity:");
}

id objc_msgSend_initWithName_grade_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:grade:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithServiceType_applicationIdentifier_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceType:applicationIdentifier:domain:");
}

id objc_msgSend_initWithSigningIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSigningIdentifier:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_is64bitCapable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is64bitCapable");
}

id objc_msgSend_isAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessory");
}

id objc_msgSend_isAppManaged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppManaged:");
}

id objc_msgSend_isAppStoreVendable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppStoreVendable");
}

id objc_msgSend_isApproved(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApproved");
}

id objc_msgSend_isDefaultPathRule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDefaultPathRule");
}

id objc_msgSend_isDeletableSystemApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeletableSystemApplication");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isIdentifierExternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIdentifierExternal");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalled");
}

id objc_msgSend_isLegacyPluginType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLegacyPluginType:");
}

id objc_msgSend_isModernSystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isModernSystem");
}

id objc_msgSend_isReadableFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReadableFileAtPath:");
}

id objc_msgSend_isRoamingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRoamingEnabled");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isSupervised(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSupervised");
}

id objc_msgSend_isTLSClientCertificateRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTLSClientCertificateRequired");
}

id objc_msgSend_isTransparentProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTransparentProxy");
}

id objc_msgSend_isVPNCreationAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVPNCreationAllowed");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isVersion_greaterThanOrEqualToVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVersion:greaterThanOrEqualToVersion:");
}

id objc_msgSend_isWatchKitApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWatchKitApp");
}

id objc_msgSend_joinOnce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinOnce");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_keyPersistentReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPersistentReference");
}

id objc_msgSend_knownNetworkInfoForLocalNetworkPromptWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownNetworkInfoForLocalNetworkPromptWithOptions:");
}

id objc_msgSend_lastDatabaseUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDatabaseUpdate");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lifeTimeInDays(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lifeTimeInDays");
}

id objc_msgSend_loadConfigurationWithID_withCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadConfigurationWithID:withCompletionQueue:handler:");
}

id objc_msgSend_loadConfigurations_withFilter_completionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadConfigurations:withFilter:completionQueue:completionHandler:");
}

id objc_msgSend_loadConfigurationsWithCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadConfigurationsWithCompletionQueue:handler:");
}

id objc_msgSend_loadIndexWithFilter_completionQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadIndexWithFilter:completionQueue:handler:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedNameWithPreferredLocalizations:");
}

id objc_msgSend_localizedValuesForKeys_fromTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedValuesForKeys:fromTable:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_machOUUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machOUUIDs");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_matchDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchDomains");
}

id objc_msgSend_matchPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchPath");
}

id objc_msgSend_matchSigningIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchSigningIdentifier");
}

id objc_msgSend_multicastPreferenceSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multicastPreferenceSet");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_naiRealmNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "naiRealmNames");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_networkPrivacyConfigurationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkPrivacyConfigurationName");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:ofClass:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_order(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "order");
}

id objc_msgSend_outerIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outerIdentity");
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ownerName");
}

id objc_msgSend_passphrase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passphrase");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "password");
}

id objc_msgSend_pathController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathController");
}

id objc_msgSend_pathRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathRules");
}

id objc_msgSend_payloadInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadInfo");
}

id objc_msgSend_perApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "perApp");
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plugInKitPlugins");
}

id objc_msgSend_pluginKitProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginKitProxyForIdentifier:");
}

id objc_msgSend_pluginType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginType");
}

id objc_msgSend_postGeneration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postGeneration");
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_preferredTLSVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredTLSVersion");
}

id objc_msgSend_privacyTrackingDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privacyTrackingDomains");
}

id objc_msgSend_profileSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileSource");
}

id objc_msgSend_promptForLocalAuthenticationWithReason_completionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptForLocalAuthenticationWithReason:completionQueue:completionHandler:");
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocol");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_relay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relay");
}

id objc_msgSend_relays(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relays");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeConfigurationFromDisk_completionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeConfigurationFromDisk:completionQueue:completionHandler:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_roamingConsortiumOIs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roamingConsortiumOIs");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_saveConfiguration_withCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveConfiguration:withCompletionQueue:handler:");
}

id objc_msgSend_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:");
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityType");
}

id objc_msgSend_serviceDetailsWithServiceSpecifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceDetailsWithServiceSpecifier:error:");
}

id objc_msgSend_serviceSpecifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceSpecifier");
}

id objc_msgSend_setAllowEmptyDesignatedRequirement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowEmptyDesignatedRequirement:");
}

id objc_msgSend_setAppRules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppRules:");
}

id objc_msgSend_setApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplication:");
}

id objc_msgSend_setApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationIdentifier:");
}

id objc_msgSend_setApplicationName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationName:");
}

id objc_msgSend_setCertificateReferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCertificateReferences:");
}

id objc_msgSend_setDenyCellularFallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDenyCellularFallback:");
}

id objc_msgSend_setDenyMulticast_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDenyMulticast:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setIdentityReferenceInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentityReferenceInternal:");
}

id objc_msgSend_setIgnoreFallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreFallback:");
}

id objc_msgSend_setIgnoreRouteRules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreRouteRules:");
}

id objc_msgSend_setLocalIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalIdentifier:");
}

id objc_msgSend_setMatchPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatchPath:");
}

id objc_msgSend_setMulticastPreferenceSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMulticastPreferenceSet:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPathController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPathController:");
}

id objc_msgSend_setPathRules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPathRules:");
}

id objc_msgSend_setPerApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerApp:");
}

id objc_msgSend_setTemporaryAllowMulticastNetworkName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTemporaryAllowMulticastNetworkName:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedManagerForAllUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManagerForAllUsers");
}

id objc_msgSend_sharingPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharingPolicy");
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortVersionString");
}

id objc_msgSend_shouldPromptForLocalAuthentication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPromptForLocalAuthentication");
}

id objc_msgSend_showLocalNetworkAlertForApp_withCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showLocalNetworkAlertForApp:withCompletionQueue:handler:");
}

id objc_msgSend_sortUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingSelector:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_startObservingChangesWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startObservingChangesWithHandler:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportedEAPTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedEAPTypes");
}

id objc_msgSend_syncConfigurationsWithSC_completionQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncConfigurationsWithSC:completionQueue:completionHandler:");
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teamID");
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teamIdentifier");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_trackingDomainInfoWithDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackingDomainInfoWithDomains:");
}

id objc_msgSend_trustedServerCertificateReferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trustedServerCertificateReferences");
}

id objc_msgSend_trustedServerNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trustedServerNames");
}

id objc_msgSend_ttlsInnerAuthenticationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ttlsInnerAuthenticationType");
}

id objc_msgSend_tunnelType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tunnelType");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_useSSIDPrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useSSIDPrefix");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "user");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validate");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_verifyEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyEntitlement:");
}

id objc_msgSend_wifiBehavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiBehavior");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
