@implementation NEHelperSocketFactory

- (NEHelperSocketFactory)initWithFirstMessage:(id)a3
{
  id v4;
  NEHelperSocketFactory *v5;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  pid_t pid;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  NEHelperSocketFactory *v26;
  objc_super v28;
  uint8_t buf[4];
  _BYTE v30[14];
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  _BYTE buffer[256];

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NEHelperSocketFactory;
  v5 = -[NEHelperSocketFactory init](&v28, "init");
  if (v5)
  {
    remote_connection = xpc_dictionary_get_remote_connection(v4);
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    v8 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.nehelper.privileged");
    v9 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.neagent");
    v10 = v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v8);
    v5->_privileged = v10;
    v11 = v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("NEHelperSocketFactory", v13);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;

    if (!v5->_privileged && !v11)
    {
      pid = xpc_connection_get_pid(v7);
      v17 = proc_name(pid, buffer, 0x100u);
      v18 = v17;
      v20 = ne_log_obj(v17, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      if (v18 < 1)
      {
        if (v22)
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v30 = pid;
          *(_WORD *)&v30[4] = 2080;
          *(_QWORD *)&v30[6] = "com.apple.private.nehelper.privileged";
          v31 = 2080;
          v32 = "com.apple.private.neagent";
          v23 = "Denying connection from process %d because it is missing the %s entitlement and the %s entitlement";
          v24 = v21;
          v25 = 28;
          goto LABEL_21;
        }
      }
      else if (v22)
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v30 = buffer;
        *(_WORD *)&v30[8] = 1024;
        *(_DWORD *)&v30[10] = pid;
        v31 = 2080;
        v32 = "com.apple.private.nehelper.privileged";
        v33 = 2080;
        v34 = "com.apple.private.neagent";
        v23 = "Denying connection from %s (%d) because it is missing the %s entitlement and the %s entitlement";
        v24 = v21;
        v25 = 38;
LABEL_21:
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
      }

      v26 = 0;
      goto LABEL_19;
    }

  }
  v26 = v5;
LABEL_19:

  return v26;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
    self = (NEHelperSocketFactory *)objc_getProperty(self, a2, 16, 1);
  return (OS_dispatch_queue *)self;
}

- (void)handleMessage:(id)a3
{
  id v4;
  uint64_t uint64;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  xpc_object_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  xpc_object_t v17;
  const sockaddr *data;
  const sockaddr *v19;
  const char *string;
  int v21;
  uint64_t is_sockaddr_valid;
  uint64_t v23;
  int sa_family;
  BOOL v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  xpc_object_t v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  int64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  xpc_object_t array;
  void *v76;
  void *v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  nw_endpoint_t v104;
  nw_endpoint_t v105;
  nw_endpoint_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  xpc_object_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  nw_endpoint_t v131;
  nw_endpoint_t v132;
  uint64_t v133;
  uint64_t v134;
  unsigned int v135;
  nw_endpoint_t address;
  _QWORD applier[4];
  id v138;
  size_t *v139;
  size_t *v140;
  int v141;
  size_t v142;
  size_t *v143;
  uint64_t v144;
  char v145;
  size_t length;
  size_t *p_length;
  uint64_t v148;
  char v149;
  sa_endpoints_t v150;
  socklen_t v151;
  uint8_t v152[4];
  _BYTE v153[14];
  __int16 v154;
  char *v155;
  uint8_t v156[32];
  uint8_t buf[32];
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  int v162;
  char __strerrbuf[4];
  const char *v164;
  __int16 v165;
  nw_endpoint_t v166;
  __int16 v167;
  const char *v168;
  __int16 v169;
  int v170;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "socket-type");
  switch(uint64)
  {
    case 1uLL:
      v7 = socket(29, 3, 2);
      if ((v7 & 0x80000000) != 0)
      {
        v59 = ne_log_obj(v7, v8);
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v94 = *__error();
          *(_DWORD *)__strerrbuf = 67109120;
          LODWORD(v164) = v94;
          _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "socket(PF_KEY, SOCK_RAW, PF_KEY_V2) failed: %d", (uint8_t *)__strerrbuf, 8u);
        }

        if (*__error())
          v61 = *__error();
        else
          v61 = 22;
        sub_1000037E4((uint64_t)NEHelperServer, v4, v61, 0);
      }
      else
      {
        v9 = v7;
        v10 = xpc_fd_create(v7);
        close(v9);
        *(_DWORD *)__strerrbuf = 4500;
        sysctlbyname("net.inet.ipsec.esp_port", 0, 0, __strerrbuf, 4uLL);
        sub_1000037E4((uint64_t)NEHelperServer, v4, 0, v10);

      }
      goto LABEL_151;
    case 2uLL:
      length = 0;
      v142 = 0;
      data = (const sockaddr *)xpc_dictionary_get_data(v4, "socket-localaddr", &length);
      v19 = (const sockaddr *)xpc_dictionary_get_data(v4, "socket-remoteaddr", &v142);
      string = xpc_dictionary_get_string(v4, "socket-interface");
      v21 = xpc_dictionary_get_uint64(v4, "socket-effective-pid");
      is_sockaddr_valid = ne_is_sockaddr_valid(v19, v142);
      if ((_DWORD)is_sockaddr_valid)
      {
        is_sockaddr_valid = ne_is_sockaddr_valid(data, length);
        if ((is_sockaddr_valid & 1) != 0)
        {
          *(_DWORD *)v156 = v21;
          if (data)
          {
            if (v19)
            {
              sa_family = v19->sa_family;
              v25 = data->sa_family == sa_family;
              v26 = ne_log_obj(is_sockaddr_valid, v23);
              v27 = objc_claimAutoreleasedReturnValue(v26);
              v28 = v27;
              if (v25)
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  address = nw_endpoint_create_address(data);
                  v104 = nw_endpoint_create_address(v19);
                  *(_DWORD *)__strerrbuf = 138413058;
                  v164 = (const char *)address;
                  v165 = 2112;
                  v166 = v104;
                  v167 = 2080;
                  v168 = string;
                  v169 = 1024;
                  v170 = v21;
                  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Creating IKE socket to (%@, %@, \"%s\", %d)", (uint8_t *)__strerrbuf, 0x26u);

                }
                if (string)
                {
                  v135 = if_nametoindex(string);
                  if (v135)
                    goto LABEL_26;
                  v29 = *__error();
                  v30 = strerror_r(v29, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v30)
                    __strerrbuf[0] = 0;
                  v32 = ne_log_obj(v30, v31);
                  v33 = objc_claimAutoreleasedReturnValue(v32);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(_QWORD *)&buf[4] = string;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v29;
                    *(_WORD *)&buf[18] = 2080;
                    *(_QWORD *)&buf[20] = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to find interface \"%s\": [%d] %s", buf, 0x1Cu);
                  }

                }
                v135 = 0;
LABEL_26:
                v34 = socket(sa_family, 2, 0);
                v35 = v34;
                if (v34 < 0)
                {
                  v74 = *__error();
                  v86 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v86)
                    __strerrbuf[0] = 0;
                  v88 = ne_log_obj(v86, v87);
                  v89 = objc_claimAutoreleasedReturnValue(v88);
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)&buf[4] = sa_family;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = v74;
                    *(_WORD *)&buf[14] = 2080;
                    *(_QWORD *)&buf[16] = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Failed to create socket(%u, SOCK_DGRAM, 0): [%d] %s", buf, 0x18u);
                  }

                  if (v35 == -1)
                    goto LABEL_158;
                  goto LABEL_157;
                }
                if (fcntl(v34, 4, 4) == -1)
                {
                  v36 = *__error();
                  v37 = strerror_r(v36, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v37)
                    __strerrbuf[0] = 0;
                  v39 = ne_log_obj(v37, v38);
                  v40 = objc_claimAutoreleasedReturnValue(v39);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v36;
                    *(_WORD *)&buf[8] = 2080;
                    *(_QWORD *)&buf[10] = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to put socket in non-blocking mode: [%d] %s", buf, 0x12u);
                  }

                }
                if (fcntl(v35, 73, 1) == -1)
                {
                  v41 = *__error();
                  v42 = strerror_r(v41, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v42)
                    __strerrbuf[0] = 0;
                  v44 = ne_log_obj(v42, v43);
                  v45 = objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v41;
                    *(_WORD *)&buf[8] = 2080;
                    *(_QWORD *)&buf[10] = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to set NOSIGPIPE option: [%d] %s", buf, 0x12u);
                  }

                }
                *(_DWORD *)v152 = 1;
                if (setsockopt(v35, 0xFFFF, 4, v152, 4u) < 0)
                {
                  v74 = *__error();
                  v90 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v90)
                    __strerrbuf[0] = 0;
                  v92 = ne_log_obj(v90, v91);
                  v93 = objc_claimAutoreleasedReturnValue(v92);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v74;
                    *(_WORD *)&buf[8] = 2080;
                    *(_QWORD *)&buf[10] = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "setsockopt SO_REUSEADDR failed: [%d] %s", buf, 0x12u);
                  }
                }
                else if (setsockopt(v35, 0xFFFF, 512, v152, 4u) < 0)
                {
                  v74 = *__error();
                  v95 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v95)
                    __strerrbuf[0] = 0;
                  v97 = ne_log_obj(v95, v96);
                  v93 = objc_claimAutoreleasedReturnValue(v97);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v74;
                    *(_WORD *)&buf[8] = 2080;
                    *(_QWORD *)&buf[10] = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "setsockopt SO_REUSEPORT failed: [%d] %s", buf, 0x12u);
                  }
                }
                else if (v21 && setsockopt(v35, 0xFFFF, 4359, v156, 4u) < 0)
                {
                  v74 = *__error();
                  v107 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v107)
                    __strerrbuf[0] = 0;
                  v109 = ne_log_obj(v107, v108);
                  v93 = objc_claimAutoreleasedReturnValue(v109);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v74;
                    *(_WORD *)&buf[8] = 2080;
                    *(_QWORD *)&buf[10] = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "setsockopt SO_DELEGATED failed: [%d] %s", buf, 0x12u);
                  }
                }
                else
                {
                  if (sa_family != 30 || (v151 = 0, (setsockopt(v35, 41, 63, &v151, 4u) & 0x80000000) == 0))
                  {
                    *(_QWORD *)&v150.sae_srcif = 0;
                    memset(&v150.sae_srcaddrlen, 0, 24);
                    v150.sae_srcaddr = data;
                    v150.sae_srcaddrlen = data->sa_len;
                    v150.sae_srcif = v135;
                    v150.sae_dstaddr = v19;
                    v150.sae_dstaddrlen = v19->sa_len;
                    if ((connectx(v35, &v150, 0, 0, 0, 0, 0, 0) & 0x80000000) == 0)
                    {
                      v46 = xpc_fd_create(v35);
                      close(v35);
                      sub_1000037E4((uint64_t)NEHelperServer, v4, 0, v46);

                      goto LABEL_151;
                    }
                    v74 = *__error();
                    v110 = strerror_r(v74, __strerrbuf, 0x80uLL);
                    if ((_DWORD)v110)
                      __strerrbuf[0] = 0;
                    v112 = ne_log_obj(v110, v111);
                    v113 = objc_claimAutoreleasedReturnValue(v112);
                    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                    {
                      v131 = nw_endpoint_create_address(data);
                      v132 = nw_endpoint_create_address(v19);
                      *(_DWORD *)buf = 138413314;
                      *(_QWORD *)&buf[4] = v131;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v132;
                      *(_WORD *)&buf[22] = 2080;
                      *(_QWORD *)&buf[24] = string;
                      LOWORD(v158) = 1024;
                      *(_DWORD *)((char *)&v158 + 2) = v74;
                      WORD3(v158) = 2080;
                      *((_QWORD *)&v158 + 1) = __strerrbuf;
                      _os_log_error_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "connectx(%@, %@, \"%s\") failed: [%d] %s", buf, 0x30u);

                    }
                    goto LABEL_157;
                  }
                  v74 = *__error();
                  v126 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v126)
                    __strerrbuf[0] = 0;
                  v128 = ne_log_obj(v126, v127);
                  v93 = objc_claimAutoreleasedReturnValue(v128);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v74;
                    *(_WORD *)&buf[8] = 2080;
                    *(_QWORD *)&buf[10] = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "setsockopt IPV6_PREFER_TEMPADDR failed: [%d] %s", buf, 0x12u);
                  }
                }

LABEL_157:
                v72 = close(v35);
                goto LABEL_158;
              }
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v105 = nw_endpoint_create_address(data);
                v106 = nw_endpoint_create_address(v19);
                *(_DWORD *)__strerrbuf = 138412546;
                v164 = (const char *)v105;
                v165 = 2112;
                v166 = v106;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Mismatched AF %@ %@", (uint8_t *)__strerrbuf, 0x16u);

              }
            }
            else
            {
              v134 = ne_log_obj(is_sockaddr_valid, v23);
              v28 = objc_claimAutoreleasedReturnValue(v134);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)__strerrbuf = 136315138;
                v164 = "connect_udp_ike_socket";
                _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "%s called with null remote", (uint8_t *)__strerrbuf, 0xCu);
              }
            }
          }
          else
          {
            v133 = ne_log_obj(is_sockaddr_valid, v23);
            v28 = objc_claimAutoreleasedReturnValue(v133);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)__strerrbuf = 136315138;
              v164 = "connect_udp_ike_socket";
              _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "%s called with null local", (uint8_t *)__strerrbuf, 0xCu);
            }
          }

          v74 = 22;
LABEL_158:
          v129 = ne_log_obj(v72, v73);
          v130 = objc_claimAutoreleasedReturnValue(v129);
          if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__strerrbuf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "kNEHelperMessageSocketTypeIKE connect_udp_ike_socket failed", (uint8_t *)__strerrbuf, 2u);
          }

          sub_1000037E4((uint64_t)NEHelperServer, v4, v74, 0);
          goto LABEL_151;
        }
      }
      v50 = ne_log_obj(is_sockaddr_valid, v23);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__strerrbuf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "kNEHelperMessageSocketTypeIKE received invalid parameters", (uint8_t *)__strerrbuf, 2u);
      }

      sub_1000037E4((uint64_t)NEHelperServer, v4, 22, 0);
LABEL_151:

      return;
    case 3uLL:
      v162 = 0;
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      memset(buf, 0, sizeof(buf));
      memset(&v150, 0, 32);
      v11 = xpc_dictionary_get_string(v4, "socket-control-name");
      length = 0;
      p_length = &length;
      v148 = 0x2020000000;
      v149 = 0;
      v142 = 0;
      v143 = &v142;
      v144 = 0x2020000000;
      v145 = 0;
      if (!self || !self->_privileged)
      {
        v13 = ne_log_obj(v11, v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__strerrbuf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Rejecting kernel control socket request from un-privileged client", (uint8_t *)__strerrbuf, 2u);
        }

        sub_1000037E4((uint64_t)NEHelperServer, v4, 1, 0);
        goto LABEL_150;
      }
      v52 = v11;
      v53 = socket(32, 2, 2);
      if (v53 < 0)
      {
        v67 = *__error();
        v68 = strerror_r(v67, __strerrbuf, 0x80uLL);
        if ((_DWORD)v68)
          __strerrbuf[0] = 0;
        v70 = ne_log_obj(v68, v69);
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v156 = 67109378;
          *(_DWORD *)&v156[4] = v67;
          *(_WORD *)&v156[8] = 2080;
          *(_QWORD *)&v156[10] = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Cannot create kernel control socket: [%d] %s", v156, 0x12u);
        }

        sub_1000037E4((uint64_t)NEHelperServer, v4, v67, 0);
        goto LABEL_150;
      }
      v162 = 0;
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      memset(buf, 0, sizeof(buf));
      __strlcpy_chk(&buf[4], v52, 96, 96);
      if (ioctl(v53, 0xC0644E03uLL, buf))
      {
        v54 = *__error();
        v55 = strerror_r(v54, __strerrbuf, 0x80uLL);
        if ((_DWORD)v55)
          __strerrbuf[0] = 0;
        v57 = ne_log_obj(v55, v56);
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v156 = 67109378;
          *(_DWORD *)&v156[4] = v54;
          *(_WORD *)&v156[8] = 2080;
          *(_QWORD *)&v156[10] = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "ioctl(CTLIOCGINFO) failed: [%d] %s", v156, 0x12u);
        }

        close(v53);
        sub_1000037E4((uint64_t)NEHelperServer, v4, v54, 0);
        goto LABEL_150;
      }
      v150.sae_srcif = 139296;
      *(&v150.sae_srcif + 1) = *(_DWORD *)buf;
      memset(&v150.sae_srcaddr, 0, 24);
      array = xpc_dictionary_get_array(v4, "socket-options");
      v76 = (void *)objc_claimAutoreleasedReturnValue(array);
      v77 = v76;
      if (v76 && xpc_array_get_count(v76))
      {
        if (bind(v53, (const sockaddr *)&v150, 0x20u))
        {
          v78 = *__error();
          v79 = strerror_r(v78, __strerrbuf, 0x80uLL);
          if ((_DWORD)v79)
            __strerrbuf[0] = 0;
          v81 = ne_log_obj(v79, v80);
          v82 = objc_claimAutoreleasedReturnValue(v81);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v156 = 67109378;
            *(_DWORD *)&v156[4] = v78;
            *(_WORD *)&v156[8] = 2080;
            *(_QWORD *)&v156[10] = __strerrbuf;
            _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "bind failed on kernel control socket: [%d] %s", v156, 0x12u);
          }
LABEL_86:

          close(v53);
          sub_1000037E4((uint64_t)NEHelperServer, v4, v78, 0);
LABEL_149:

LABEL_150:
          _Block_object_dispose(&v142, 8);
          _Block_object_dispose(&length, 8);
          goto LABEL_151;
        }
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = sub_100012F68;
        applier[3] = &unk_1000390B8;
        v141 = v53;
        v98 = v4;
        v138 = v98;
        v139 = &length;
        v140 = &v142;
        xpc_array_apply(v77, applier);
        if (connect(v53, (const sockaddr *)&v150, 0x20u))
        {
          v99 = *__error();
          v100 = strerror_r(v99, __strerrbuf, 0x80uLL);
          if ((_DWORD)v100)
            __strerrbuf[0] = 0;
          v102 = ne_log_obj(v100, v101);
          v103 = objc_claimAutoreleasedReturnValue(v102);
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v156 = 67109378;
            *(_DWORD *)&v156[4] = v99;
            *(_WORD *)&v156[8] = 2080;
            *(_QWORD *)&v156[10] = __strerrbuf;
            _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "connect failed on kernel control socket: [%d] %s", v156, 0x12u);
          }

          close(v53);
          sub_1000037E4((uint64_t)NEHelperServer, v98, v99, 0);

          goto LABEL_149;
        }

      }
      else if (connect(v53, (const sockaddr *)&v150, 0x20u))
      {
        v78 = *__error();
        v83 = strerror_r(v78, __strerrbuf, 0x80uLL);
        if ((_DWORD)v83)
          __strerrbuf[0] = 0;
        v85 = ne_log_obj(v83, v84);
        v82 = objc_claimAutoreleasedReturnValue(v85);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v156 = 67109378;
          *(_DWORD *)&v156[4] = v78;
          *(_WORD *)&v156[8] = 2080;
          *(_QWORD *)&v156[10] = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "connect failed on kernel control socket: [%d] %s", v156, 0x12u);
        }
        goto LABEL_86;
      }
      if (!*((_BYTE *)p_length + 24) && !*((_BYTE *)v143 + 24))
        goto LABEL_148;
      memset(v156, 0, sizeof(v156));
      v151 = 16;
      if (getsockopt(v53, 2, 2, v156, &v151))
      {
        v114 = *__error();
        v115 = strerror_r(v114, __strerrbuf, 0x80uLL);
        if ((_DWORD)v115)
          __strerrbuf[0] = 0;
        v117 = ne_log_obj(v115, v116);
        v118 = objc_claimAutoreleasedReturnValue(v117);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v152 = 67109378;
          *(_DWORD *)v153 = v114;
          *(_WORD *)&v153[4] = 2080;
          *(_QWORD *)&v153[6] = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "Failed to get the name of the new virtual interface: [%d] %s", v152, 0x12u);
        }
      }
      else if (*((_BYTE *)p_length + 24) && (*(_DWORD *)&v156[16] = 1, ioctl(v53, 0xC02069D7uLL, v156)))
      {
        v114 = *__error();
        v119 = strerror_r(v114, __strerrbuf, 0x80uLL);
        if ((_DWORD)v119)
          __strerrbuf[0] = 0;
        v121 = ne_log_obj(v119, v120);
        v118 = objc_claimAutoreleasedReturnValue(v121);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v152 = 136315650;
          *(_QWORD *)v153 = v156;
          *(_WORD *)&v153[8] = 1024;
          *(_DWORD *)&v153[10] = v114;
          v154 = 2080;
          v155 = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "Failed to set SIOCSIFNOTRAFFICSHAPING to 1 for %s: [%d] %s", v152, 0x1Cu);
        }
      }
      else
      {
        if (!*((_BYTE *)v143 + 24) || (v156[16] = 1, !ioctl(v53, 0xC02069DDuLL, v156)))
        {
LABEL_148:
          v125 = xpc_fd_create(v53);
          close(v53);
          sub_1000037E4((uint64_t)NEHelperServer, v4, 0, v125);

          goto LABEL_149;
        }
        v114 = *__error();
        v122 = strerror_r(v114, __strerrbuf, 0x80uLL);
        if ((_DWORD)v122)
          __strerrbuf[0] = 0;
        v124 = ne_log_obj(v122, v123);
        v118 = objc_claimAutoreleasedReturnValue(v124);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v152 = 136315650;
          *(_QWORD *)v153 = v156;
          *(_WORD *)&v153[8] = 1024;
          *(_DWORD *)&v153[10] = v114;
          v154 = 2080;
          v155 = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "Failed to set SIOCSIFDIRECTLINK to 1 for %s: [%d] %s", v152, 0x1Cu);
        }
      }

      close(v53);
      sub_1000037E4((uint64_t)NEHelperServer, v4, v114, 0);
      goto LABEL_149;
    case 4uLL:
      v15 = necp_session_open(0);
      if (v15 < 0)
      {
        v62 = *__error();
        v63 = strerror_r(v62, __strerrbuf, 0x80uLL);
        if ((_DWORD)v63)
          __strerrbuf[0] = 0;
        v65 = ne_log_obj(v63, v64);
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v62;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = __strerrbuf;
          _os_log_fault_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_FAULT, "Cannot create necp session fd: [%d] %s", buf, 0x12u);
        }

        sub_1000037E4((uint64_t)NEHelperServer, v4, v62, 0);
      }
      else
      {
        v16 = v15;
        v17 = xpc_fd_create(v15);
        close(v16);
        sub_1000037E4((uint64_t)NEHelperServer, v4, 0, v17);

      }
      goto LABEL_151;
    default:
      v47 = (const char *)uint64;
      v48 = ne_log_obj(uint64, v6);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        v164 = v47;
        _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "NEHelperSocketFactory received invalid socketType %llu", (uint8_t *)__strerrbuf, 0xCu);
      }

      sub_1000037E4((uint64_t)NEHelperServer, v4, 22, 0);
      goto LABEL_151;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
