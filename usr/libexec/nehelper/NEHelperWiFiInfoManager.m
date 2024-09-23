@implementation NEHelperWiFiInfoManager

- (NEHelperWiFiInfoManager)initWithFirstMessage:(id)a3
{
  id v4;
  NEHelperWiFiInfoManager *v5;
  uint64_t v6;
  NSString *bundleID;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  xpc_connection_t remote_connection;
  uint64_t v13;
  OS_xpc_object *connection;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSString *v20;
  id v21;
  NEHelperWiFiInfoManager *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  NSString *v28;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NEHelperWiFiInfoManager;
  v5 = -[NEHelperWiFiInfoManager init](&v24, "init");
  if (v5)
  {
    v6 = NECopySigningIdentifierForXPCMessage(v4);
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("NEHelperWiFiInfoManagerMainTaskQueue", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    remote_connection = xpc_dictionary_get_remote_connection(v4);
    v13 = objc_claimAutoreleasedReturnValue(remote_connection);
    connection = v5->_connection;
    v5->_connection = (OS_xpc_object *)v13;

    v17 = ne_log_obj(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_opt_class(v5);
      v20 = v5->_bundleID;
      *(_DWORD *)buf = 138412546;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ Created new WiFi Info Helper delegate for [%@]", buf, 0x16u);

    }
    v22 = v5;
  }

  return v5;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
    self = (NEHelperWiFiInfoManager *)objc_getProperty(self, a2, 48, 1);
  return (OS_dispatch_queue *)self;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = (id)objc_opt_class(self);
    v5 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ dealloc()", buf, 0xCu);

  }
  myCFRelease(&self->_network);
  v6.receiver = self;
  v6.super_class = (Class)NEHelperWiFiInfoManager;
  -[NEHelperWiFiInfoManager dealloc](&v6, "dealloc");
}

- (void)handleMessage:(id)a3
{
  id v4;
  const char *string;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  const char *v16;
  NSString *v17;
  NSString *interfaceName;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  OS_xpc_object *v25;
  pid_t pid;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  unsigned __int8 v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  NSString *v62;
  id v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  NSString *v67;
  id v68;
  uint64_t v69;
  void *v70;
  NSString *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  void *v77;
  NSString *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  NSString *v82;
  unsigned int v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  NSString *v90;
  id v91;
  uint64_t v92;
  NSObject *v93;
  _BOOL4 v94;
  void *v95;
  NSString *v96;
  id v97;
  const char *v98;
  void *v99;
  NSString *v100;
  id v101;
  uint64_t v102;
  id network;
  int v104;
  uint64_t v105;
  _BOOL4 v106;
  void *v107;
  NSString *v108;
  void *v109;
  NSString *v110;
  id v111;
  void *v112;
  const char *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  _BOOL4 v118;
  void *v119;
  NSString *bundleID;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _BOOL4 v125;
  void *v126;
  NSString *v127;
  void *v128;
  NSString *v129;
  id v130;
  uint8_t *v131;
  void *v132;
  OS_dispatch_queue *queue;
  uint8_t *v134;
  void *v135;
  id v136;
  id v137;
  uint8_t buf[32];
  NEHelperWiFiInfoManager *v139;
  id v140;
  id v141;
  _BYTE v142[32];
  NEHelperWiFiInfoManager *v143;
  uint8_t *v144;

  v4 = a3;
  string = xpc_dictionary_get_string(v4, "interface-name");
  v7 = ne_log_obj(string, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_opt_class(self);
    v10 = "(nil)";
    if (string)
      v10 = string;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v10;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ processing Wi-Fi information request for %s", buf, 0x16u);

  }
  v12 = v4;
  v13 = v12;
  if (self)
  {
    v14 = v12;
    v15 = v14;
    if (v14)
    {
      v16 = xpc_dictionary_get_string(v14, "interface-name");
      if (v16)
      {
        v17 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16));
        interfaceName = self->_interfaceName;
        self->_interfaceName = v17;

      }
      self->_isSecurityTypeRequested = xpc_dictionary_get_BOOL(v15, "security-type-requested");
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_10000CE50;
      *(_QWORD *)&buf[24] = &unk_1000397A0;
      v139 = self;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, buf);
      if (!self->_network)
      {
        v21 = ne_log_obj(v19, v20);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)objc_opt_class(self);
          *(_DWORD *)v142 = 138412290;
          *(_QWORD *)&v142[4] = v23;
          v24 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@ device is not associated to Wi-Fi network", v142, 0xCu);

        }
      }
    }

    v25 = self->_connection;
    if (qword_100042C38 != -1)
      dispatch_once(&qword_100042C38, &stru_100038E10);
    if (byte_100042C30)
    {
      if (nelog_is_debug_logging_enabled())
      {
        pid = xpc_connection_get_pid(v25);
        v27 = proc_name(pid, buf, 0x40u);
        v29 = ne_log_obj(v27, v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v142 = 136315138;
          *(_QWORD *)&v142[4] = buf;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Process [%s] is requesting current Wi-Fi network information", v142, 0xCu);
        }

      }
      v31 = (void *)xpc_connection_copy_entitlement_value(v25, "com.apple.captive.private");
      v32 = v31;
      if (v31 && xpc_get_type(v31) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v32))
      {

        v35 = ne_log_obj(v33, v34);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v135 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v135;
          v136 = v135;
          _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%@ calling process has private entitlement", buf, 0xCu);

        }
        sub_10000C2D8((uint64_t)self, v15);
        goto LABEL_86;
      }

    }
    memset(buf, 0, sizeof(buf));
    xpc_dictionary_get_audit_token(v15, buf);
    v137 = 0;
    *(_OWORD *)v142 = *(_OWORD *)buf;
    *(_OWORD *)&v142[16] = *(_OWORD *)&buf[16];
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v142, &v137));
    v38 = v137;
    v40 = v38;
    if (v37)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "SDKVersion"));
    }
    else
    {
      v42 = ne_log_obj(v38, v39);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v142 = 138412546;
        *(_QWORD *)&v142[4] = self;
        *(_WORD *)&v142[12] = 2112;
        *(_QWORD *)&v142[14] = v40;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@ failed to get bundle record, error: %@", v142, 0x16u);
      }

      v41 = 0;
    }

    v46 = ne_log_obj(v44, v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v119 = (void *)objc_opt_class(self);
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v119;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = bundleID;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v41;
      v121 = v119;
      _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%@ [%@] is built with SDK version [%@]", buf, 0x20u);

    }
    if (!v41)
      goto LABEL_42;
    v50 = v41;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v52 = objc_msgSend(v51, "isVersion:greaterThanOrEqualToVersion:", v50, CFSTR("12.0"));

    if ((v52 & 1) != 0)
    {
      v55 = xpc_connection_copy_entitlement_value(self->_connection, "com.apple.developer.networking.wifi-info");
      v56 = v55;
      if (!v55 || xpc_get_type(v55) != (xpc_type_t)&_xpc_type_BOOL || !xpc_BOOL_get_value(v56))
      {

        v59 = ne_log_obj(v57, v58);
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          v61 = (void *)objc_opt_class(self);
          v62 = self->_bundleID;
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v61;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v62;
          *(_WORD *)&buf[22] = 2080;
          *(_QWORD *)&buf[24] = "com.apple.developer.networking.wifi-info";
          v63 = v61;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "%@ [%@] missing \"%s\" entitlement", buf, 0x20u);

        }
LABEL_42:
        v64 = ne_log_obj(v48, v49);
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          v66 = (void *)objc_opt_class(self);
          v67 = self->_bundleID;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v66;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v67;
          v68 = v66;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "%@ [%@] is not entitled", buf, 0x16u);

        }
        sub_10000CAB0((uint64_t)self, v15, 1);
        goto LABEL_85;
      }
    }
    else
    {
      v69 = ne_log_obj(v53, v54);
      v56 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v70 = (void *)objc_opt_class(self);
        v71 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v70;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v71;
        v72 = v70;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%@ [%@] linked before iOS 12.0", buf, 0x16u);

      }
    }

    v75 = ne_log_obj(v73, v74);
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      v77 = (void *)objc_opt_class(self);
      v78 = self->_bundleID;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v77;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v78;
      v79 = v77;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%@ [%@] is entitled", buf, 0x16u);

    }
    v80 = objc_opt_class(CLLocationManager);
    if (v80)
    {
      v82 = self->_bundleID;
      *(_QWORD *)v142 = 0;
      v83 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:error:](CLLocationManager, "_checkAndExerciseAuthorizationForBundleID:error:", v82, v142);
      v84 = *(id *)v142;
      v86 = v84;
      if (v84)
      {
        v87 = ne_log_obj(v84, v85);
        v88 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          v89 = (void *)objc_opt_class(self);
          v90 = self->_bundleID;
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v89;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v90;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v86;
          v91 = v89;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "%@ failed to find location authorization for [%@] [%@]", buf, 0x20u);

        }
        v83 = 0;
      }

    }
    else
    {
      v83 = 0;
    }
    v92 = ne_log_obj(v80, v81);
    v93 = objc_claimAutoreleasedReturnValue(v92);
    v94 = os_log_type_enabled(v93, OS_LOG_TYPE_INFO);
    if (v83)
    {
      if (v94)
      {
        v95 = (void *)objc_opt_class(self);
        v96 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v95;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v96;
        v97 = v95;
        v98 = "%@ [%@] is authorized to access the location";
LABEL_83:
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, v98, buf, 0x16u);

      }
    }
    else
    {
      if (v94)
      {
        v99 = (void *)objc_opt_class(self);
        v100 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v99;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v100;
        v101 = v99;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "%@ [%@] is not authorized to access the location", buf, 0x16u);

      }
      network = self->_network;
      if (network && (network = (id)WiFiNetworkGetBundleIdentifier(network)) != 0)
      {
        network = -[NSString isEqual:](self->_bundleID, "isEqual:", network);
        v104 = (int)network;
      }
      else
      {
        v104 = 0;
      }
      v105 = ne_log_obj(network, v102);
      v93 = objc_claimAutoreleasedReturnValue(v105);
      v106 = os_log_type_enabled(v93, OS_LOG_TYPE_INFO);
      if (!v104)
      {
        if (v106)
        {
          v109 = (void *)objc_opt_class(self);
          v110 = self->_bundleID;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v109;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v110;
          v111 = v109;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "%@ [%@] has not configured the current network", buf, 0x16u);

        }
        v112 = (void *)xpc_connection_copy_entitlement_value(self->_connection, "com.apple.developer.networking.networkextension");
        if ((NEGetEntitlement() & 3) != 0)
        {
          v114 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:](LSPlugInKitProxy, "pluginKitProxyForIdentifier:", objc_getProperty(self, v113, 32, 1));
          v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
          v116 = v115;
          if (v115)
          {
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "protocol"));
            v118 = (objc_msgSend(v117, "isEqualToString:", CFSTR("com.apple.networkextension.app-proxy")) & 1) != 0
                || objc_msgSend(v117, "isEqualToString:", CFSTR("com.apple.networkextension.packet-tunnel"));

          }
          else
          {
            v118 = 0;
          }

        }
        else
        {
          v118 = 0;
        }

        v124 = ne_log_obj(v122, v123);
        v93 = objc_claimAutoreleasedReturnValue(v124);
        v125 = os_log_type_enabled(v93, OS_LOG_TYPE_INFO);
        if (!v118)
        {
          if (v125)
          {
            v128 = (void *)objc_opt_class(self);
            v129 = self->_bundleID;
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v128;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v129;
            v130 = v128;
            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "%@ [%@] is not a VPN provider", buf, 0x16u);

          }
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_10000C5D0;
          *(_QWORD *)&buf[24] = &unk_100039340;
          v139 = self;
          v140 = v15;
          v141 = v50;
          v131 = buf;
          v132 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
          queue = self->_queue;
          *(_QWORD *)v142 = _NSConcreteStackBlock;
          *(_QWORD *)&v142[8] = 3221225472;
          *(_QWORD *)&v142[16] = sub_10000CBD4;
          *(_QWORD *)&v142[24] = &unk_100038DF0;
          v143 = self;
          v134 = v131;
          v144 = v134;
          objc_msgSend(v132, "loadConfigurations:withFilter:completionQueue:completionHandler:", 0, 0, queue, v142);

          goto LABEL_85;
        }
        if (!v125)
          goto LABEL_84;
        v126 = (void *)objc_opt_class(self);
        v127 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v126;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v127;
        v97 = v126;
        v98 = "%@ [%@] is a VPN provider";
        goto LABEL_83;
      }
      if (v106)
      {
        v107 = (void *)objc_opt_class(self);
        v108 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v107;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v108;
        v97 = v107;
        v98 = "%@ [%@] has configured the current network";
        goto LABEL_83;
      }
    }
LABEL_84:

    sub_10000C2D8((uint64_t)self, v15);
LABEL_85:

  }
LABEL_86:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
