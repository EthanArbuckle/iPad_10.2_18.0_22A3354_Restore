@implementation NEHelperInterfaceManager

- (NEHelperInterfaceManager)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  NEHelperInterfaceManager *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NEHelperInterfaceManager *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  const char *v22;

  remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  v6 = sub_10000FA04((uint64_t)NEHelperServer, v5, (uint64_t)"com.apple.private.nehelper.privileged");
  if (v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)NEHelperInterfaceManager;
    v8 = -[NEHelperInterfaceManager init](&v18, "init");
    if (v8)
    {
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = dispatch_queue_create("NEHelperInterfaceManager", v10);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v11;

    }
    self = v8;
    v13 = self;
  }
  else
  {
    v14 = ne_log_obj(v6, v7);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_10000FA60((uint64_t)NEHelperServer, v5);
      *(_DWORD *)buf = 138412546;
      v20 = v17;
      v21 = 2080;
      v22 = "com.apple.private.nehelper.privileged";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Denying interface manager connection because %@ does not have the %s entitlement", buf, 0x16u);

    }
    v13 = 0;
  }

  return v13;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
    self = (NEHelperInterfaceManager *)objc_getProperty(self, a2, 8, 1);
  return (OS_dispatch_queue *)self;
}

- (void)handleMessage:(id)a3
{
  id v3;
  int uint64;
  const char *string;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  int64_t v14;
  const char *v15;
  const void *data;
  const void *v17;
  const void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  char *v28;
  const char *v29;
  int v30;
  const void *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  int64_t v38;
  void *v39;
  const char *v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  NSObject *v68;
  uint32_t v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  NSObject *v77;
  char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  xpc_object_t v87;
  int *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  char *v94;
  char *v95;
  char *v96;
  uint64_t v97;
  __int128 v98;
  uint8_t buf[4];
  char *v100;
  size_t length[6];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  size_t *v119;

  v3 = a3;
  switch(xpc_dictionary_get_uint64(v3, "interface-command"))
  {
    case 1uLL:
      if (xpc_dictionary_get_uint64(v3, "interface-type") != 4)
        goto LABEL_59;
      v98 = 0uLL;
      uint64 = xpc_dictionary_get_uint64(v3, "interface-ftype");
      string = xpc_dictionary_get_string(v3, "interface-name");
      v97 = 535847;
      v117 = 0u;
      v118 = 0u;
      if ((uint64 - 1) >= 3)
      {
        v71 = ne_log_obj(string, v6);
        v72 = objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          LODWORD(length[0]) = 67109120;
          HIDWORD(length[0]) = uint64;
          _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "invalid functional type %u", (uint8_t *)length, 8u);
        }

        v14 = 22;
        goto LABEL_72;
      }
      v7 = dword_10002A71C[uint64 - 1];
      if (string)
        v8 = string;
      else
        v8 = "rd";
      __strlcpy_chk(&v117, v8, 16, 16);
      HIDWORD(v97) = v7;
      *(_QWORD *)&v118 = &v97;
      v9 = sub_100011380(0xC020697A, (uint64_t)&v117, 2);
      if ((_DWORD)v9)
      {
        v11 = v9;
        v12 = ne_log_obj(v9, v10);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v95 = strerror(v11);
          LODWORD(length[0]) = 136315138;
          *(size_t *)((char *)length + 4) = (size_t)v95;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "SIOCIFCREATE2 failed with, %s", (uint8_t *)length, 0xCu);
        }

        v14 = v11;
        goto LABEL_72;
      }
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v102 = 0u;
      memset(&length[2], 0, 32);
      strncpy((char *)length, (const char *)&v117, 0x10uLL);
      v73 = sub_100011380(0xC080696E, (uint64_t)length, 30);
      if ((_DWORD)v73)
      {
        v75 = v73;
        v76 = ne_log_obj(v73, v74);
        v77 = objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = strerror(v75);
          *(_DWORD *)buf = 136315138;
          v100 = v78;
          v79 = "SIOCPROTOATTACH_IN6 failed with, %s";
LABEL_88:
          _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, v79, buf, 0xCu);
          goto LABEL_79;
        }
        goto LABEL_79;
      }
      *(_QWORD *)&v103 = 0;
      v102 = 0u;
      memset(&length[2], 0, 32);
      strncpy((char *)length, (const char *)&v117, 0x10uLL);
      v83 = sub_100011380(0xC030694C, (uint64_t)length, 30);
      if ((_DWORD)v83)
      {
        v85 = v83;
        v86 = ne_log_obj(v83, v84);
        v77 = objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v96 = strerror(v85);
          *(_DWORD *)buf = 136315138;
          v100 = v96;
          v79 = "SIOCGIFINFO_IN6 failed with, %s";
          goto LABEL_88;
        }
        goto LABEL_79;
      }
      if ((HIDWORD(length[4]) & 0xFFFFFDF6) != HIDWORD(length[4]))
      {
        HIDWORD(length[4]) &= 0xFFFFFDF6;
        v90 = sub_100011380(0xC0486957, (uint64_t)length, 30);
        if ((_DWORD)v90)
        {
          v92 = v90;
          v93 = ne_log_obj(v90, v91);
          v77 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v94 = strerror(v92);
            *(_DWORD *)buf = 136315138;
            v100 = v94;
            v79 = "SIOCSIFINFO_FLAGS failed with, %s";
            goto LABEL_88;
          }
LABEL_79:

        }
      }
      __strlcpy_chk(&v98, &v117, 16, 16);
      v87 = xpc_string_create((const char *)&v98);
      sub_1000037E4((uint64_t)NEHelperServer, v3, 0, v87);

      goto LABEL_75;
    case 2uLL:
      length[0] = 0;
      *(_QWORD *)&v117 = 0;
      *(_QWORD *)&v98 = 0;
      v15 = xpc_dictionary_get_string(v3, "interface-name");
      data = xpc_dictionary_get_data(v3, "interface-address", length);
      v17 = xpc_dictionary_get_data(v3, "interface-netmask", (size_t *)&v117);
      v18 = xpc_dictionary_get_data(v3, "interface-lifetime", (size_t *)&v98);
      if (!v15)
        goto LABEL_59;
      v19 = (uint64_t)v18;
      if (!ne_is_sockaddr_valid(data, length[0]) || v17 && !ne_is_sockaddr_valid(v17, v117))
        goto LABEL_59;
      if (v19 && (_QWORD)v98 != 24)
        goto LABEL_59;
      v20 = sub_1000113F4((uint64_t)v15, (uint64_t)data, (uint64_t)v17, v19);
      if (!v20)
        goto LABEL_73;
      v14 = v20;
      goto LABEL_72;
    case 3uLL:
      v21 = xpc_dictionary_get_uint64(v3, "interface-mtu");
      v22 = xpc_dictionary_get_string(v3, "interface-name");
      if (!v22 || !v21)
        goto LABEL_59;
      memset(length, 0, 32);
      __strlcpy_chk(length, v22, 16, 16);
      LODWORD(length[2]) = v21;
      v23 = sub_100011380(0x80206934, (uint64_t)length, 2);
      if (!(_DWORD)v23)
        goto LABEL_73;
      v25 = v23;
      v26 = ne_log_obj(v23, v24);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_70;
      v28 = strerror(v25);
      LODWORD(v117) = 136315138;
      *(_QWORD *)((char *)&v117 + 4) = v28;
      v29 = "Cannot set MTU, %s";
      goto LABEL_56;
    case 4uLL:
      v30 = xpc_dictionary_dup_fd(v3, "interface-socket");
      *(_QWORD *)&v117 = 0;
      v31 = xpc_dictionary_get_data(v3, "interface-option-data", (size_t *)&v117);
      v32 = xpc_dictionary_get_uint64(v3, "interface-option");
      if (v30 < 0)
        goto LABEL_59;
      v33 = v32;
      if (!v32)
        goto LABEL_59;
      v34 = setsockopt(v30, 2, v32, v31, v117);
      if (!(_DWORD)v34)
        goto LABEL_60;
      v36 = ne_log_obj(v34, v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v88 = __error();
        v89 = strerror(*v88);
        LODWORD(length[0]) = 67109378;
        HIDWORD(length[0]) = v33;
        LOWORD(length[1]) = 2080;
        *(size_t *)((char *)&length[1] + 2) = (size_t)v89;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Couldn't set socket option %d, %s", (uint8_t *)length, 0x12u);
      }

      v38 = *__error();
      if ((_DWORD)v38)
      {
        v39 = v3;
      }
      else
      {
LABEL_60:
        v39 = v3;
        v38 = 0;
      }
      sub_1000037E4((uint64_t)NEHelperServer, v39, v38, 0);
      close(v30);
      goto LABEL_75;
    case 5uLL:
      *(_QWORD *)&v117 = 0;
      v40 = xpc_dictionary_get_string(v3, "interface-name");
      v41 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "interface-address", (size_t *)&v117);
      if (!v40)
        goto LABEL_59;
      v42 = v41;
      if (!v41 || !(_QWORD)v117 || (unint64_t)v117 < *v41)
        goto LABEL_59;
      v43 = v41[1];
      if (v43 != 30)
      {
        if (v43 != 2)
        {
          v25 = 22;
          goto LABEL_71;
        }
        memset(length, 0, 32);
        __strlcpy_chk(length, v40, 16, 16);
        *(_OWORD *)&length[2] = 0x210uLL;
        HIDWORD(length[2]) = *((_DWORD *)v42 + 1);
        v44 = sub_100011380(0x80206919, (uint64_t)length, 2);
        if ((_DWORD)v44)
        {
          v25 = v44;
          v46 = ne_log_obj(v44, v45);
          v27 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v98) = 0;
            v29 = "Couldn't remove IPv4 interface address";
            goto LABEL_86;
          }
          goto LABEL_70;
        }
LABEL_73:
        v70 = v3;
        v14 = 0;
        goto LABEL_74;
      }
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v102 = 0u;
      memset(length, 0, sizeof(length));
      __strlcpy_chk(length, v40, 16, 16);
      LOWORD(length[2]) = 7708;
      *(_OWORD *)&length[3] = *(_OWORD *)(v42 + 8);
      v80 = sub_100011380(0x81206919, (uint64_t)length, 30);
      if (!(_DWORD)v80)
        goto LABEL_73;
      v25 = v80;
      v82 = ne_log_obj(v80, v81);
      v27 = objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v98) = 0;
        v29 = "Couldn't remove IPv6 interface address";
LABEL_86:
        v54 = (uint8_t *)&v98;
        v68 = v27;
        v69 = 2;
LABEL_58:
        _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, v29, v54, v69);
      }
LABEL_70:

LABEL_71:
      v14 = v25;
LABEL_72:
      v70 = v3;
LABEL_74:
      sub_1000037E4((uint64_t)NEHelperServer, v70, v14, 0);
LABEL_75:

      return;
    case 6uLL:
      v47 = xpc_dictionary_get_uint64(v3, "interface-type");
      v48 = xpc_dictionary_get_string(v3, "interface-name");
      v49 = xpc_dictionary_get_string(v3, "interface-delegate-name");
      if (v47 != 4)
        goto LABEL_59;
      if (!v48)
        goto LABEL_59;
      v50 = v49;
      if (!v49)
        goto LABEL_59;
      v119 = 0;
      v117 = 0u;
      v118 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v102 = 0u;
      memset(length, 0, sizeof(length));
      __strlcpy_chk(&v117, v48, 16, 16);
      v118 = xmmword_10002A730;
      v119 = length;
      __strlcpy_chk(&length[4], v50, 16, 16);
      v51 = sub_100011380(0x8028697B, (uint64_t)&v117, 2);
      if (!(_DWORD)v51)
        goto LABEL_73;
      v25 = v51;
      v53 = ne_log_obj(v51, v52);
      v27 = objc_claimAutoreleasedReturnValue(v53);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_70;
      LODWORD(v98) = 136315138;
      *(_QWORD *)((char *)&v98 + 4) = strerror(v25);
      v29 = "SIOCSDRVSPEC failed with, %s";
      v54 = (uint8_t *)&v98;
      goto LABEL_57;
    case 7uLL:
      v55 = xpc_dictionary_get_string(v3, "interface-name");
      if (!v55)
        goto LABEL_59;
      memset(length, 0, 32);
      __strlcpy_chk(length, v55, 16, 16);
      v56 = sub_100011380(0x80206979, (uint64_t)length, 2);
      if (!(_DWORD)v56)
        goto LABEL_73;
      v25 = v56;
      v58 = ne_log_obj(v56, v57);
      v27 = objc_claimAutoreleasedReturnValue(v58);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_70;
      v59 = strerror(v25);
      LODWORD(v117) = 136315138;
      *(_QWORD *)((char *)&v117 + 4) = v59;
      v29 = "SIOCIFDESTROY failed with, %s";
      goto LABEL_56;
    case 8uLL:
      v60 = xpc_dictionary_get_uint64(v3, "interface-type");
      v61 = xpc_dictionary_get_string(v3, "interface-name");
      v62 = xpc_dictionary_get_string(v3, "interface-description");
      if (v60 != 4)
        goto LABEL_59;
      if (!v61)
        goto LABEL_59;
      v63 = v62;
      if (!v62)
        goto LABEL_59;
      strncpy((char *)length, v61, 0x10uLL);
      LODWORD(length[2]) = strnlen(v63, 0x80uLL);
      strncpy((char *)&length[2] + 4, v63, 0x80uLL);
      v64 = sub_100011380(0xC094698F, (uint64_t)length, 2);
      if (!(_DWORD)v64)
        goto LABEL_73;
      v25 = v64;
      v66 = ne_log_obj(v64, v65);
      v27 = objc_claimAutoreleasedReturnValue(v66);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_70;
      v67 = strerror(v25);
      LODWORD(v117) = 136315138;
      *(_QWORD *)((char *)&v117 + 4) = v67;
      v29 = "SIOCSIFDESC failed with, %s";
LABEL_56:
      v54 = (uint8_t *)&v117;
LABEL_57:
      v68 = v27;
      v69 = 12;
      goto LABEL_58;
    default:
LABEL_59:
      v70 = v3;
      v14 = 22;
      goto LABEL_74;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
