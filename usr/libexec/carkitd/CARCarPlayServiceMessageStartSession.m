@implementation CARCarPlayServiceMessageStartSession

- (CARCarPlayServiceMessageStartSession)initWithSSID:(id)a3 passphrase:(id)a4 channel:(id)a5 securityType:(id)a6 wirelessIPs:(id)a7 wiredIPs:(id)a8 port:(id)a9 deviceID:(id)a10 publicKey:(id)a11 sourceVersion:(id)a12 sdkVersion:(id)a13 assetIdentifier:(id)a14 assetVersion:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  CARCarPlayServiceMessageStartSession *v25;
  CARCarPlayServiceMessageStartSession *v26;
  id v29;
  id v30;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v40 = a3;
  v29 = a4;
  v39 = a4;
  v30 = a5;
  v38 = a5;
  v31 = a6;
  v37 = a6;
  v36 = a7;
  v35 = a8;
  v34 = a9;
  v33 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v41.receiver = self;
  v41.super_class = (Class)CARCarPlayServiceMessageStartSession;
  v25 = -[CARCarPlayServiceMessageStartSession init](&v41, "init");
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_SSID, a3);
    objc_storeStrong((id *)&v26->_passphrase, v29);
    objc_storeStrong((id *)&v26->_channel, v30);
    objc_storeStrong((id *)&v26->_securityType, v31);
    objc_storeStrong((id *)&v26->_wirelessIPs, a7);
    objc_storeStrong((id *)&v26->_wiredIPs, a8);
    objc_storeStrong((id *)&v26->_port, a9);
    objc_storeStrong((id *)&v26->_deviceID, a10);
    objc_storeStrong((id *)&v26->_publicKey, a11);
    objc_storeStrong((id *)&v26->_sourceVersion, a12);
    objc_storeStrong((id *)&v26->_sdkVersion, a13);
    objc_storeStrong((id *)&v26->_assetIdentifier, a14);
    objc_storeStrong((id *)&v26->_assetVersion, a15);
  }

  return v26;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CARCarPlayServiceMessageStartSession;
  v3 = -[CARCarPlayServiceMessageStartSession description](&v20, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession SSID](self, "SSID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession passphrase](self, "passphrase"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession channel](self, "channel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession securityType](self, "securityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession wirelessIPs](self, "wirelessIPs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession wiredIPs](self, "wiredIPs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession port](self, "port"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession deviceID](self, "deviceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession publicKey](self, "publicKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession sourceVersion](self, "sourceVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession sdkVersion](self, "sdkVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession assetIdentifier](self, "assetIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession assetVersion](self, "assetVersion"));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {ssid: %@, pass: %@, channel: %@, security: %@, wirelessIPs: %@, wiredIPs: %@, port: %@, deviceID: %@, publicKey: %@, srcVersion: %@, sdkVersion: %@, assetID: %@, assetVersion: %@}"), v19, v15, v18, v17, v4, v5, v6, v14, v7, v8, v9, v10, v11, v12));

  return (NSString *)v16;
}

+ (unint64_t)identifier
{
  return 3;
}

- (CARCarPlayServiceMessageStartSession)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  CARCarPlayServiceMessageStartSession *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *j;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  NSObject *v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  NSObject *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  id v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *obj;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(NSDictionary);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("wireless")));
    v7 = v6;
    if (v6 && (objc_opt_isKindOfClass(v6, v5) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (!v8)
    {
      v18 = sub_100056C84(2uLL);
      v12 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10006BD94();
      v13 = 0;
      goto LABEL_127;
    }
    v9 = objc_opt_class(NSString);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("SSID")));
    v11 = v10;
    if (v10 && (objc_opt_isKindOfClass(v10, v9) & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (!v12)
    {
      v23 = sub_100056C84(2uLL);
      v17 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10006BED8();
      v13 = 0;
      goto LABEL_126;
    }
    v14 = objc_opt_class(NSString);
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("passphrase")));
    v16 = v15;
    if (v15 && (objc_opt_isKindOfClass(v15, v14) & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    if (!v17)
    {
      v28 = sub_100056C84(2uLL);
      v22 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10006BF44();
      v13 = 0;
      goto LABEL_125;
    }
    v19 = objc_opt_class(NSNumber);
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("channel")));
    v21 = v20;
    if (v20 && (objc_opt_isKindOfClass(v20, v19) & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    if (!v22)
    {
      v33 = sub_100056C84(2uLL);
      v27 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10006BFB0();
      v13 = 0;
      goto LABEL_124;
    }
    v24 = objc_opt_class(NSNumber);
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("securityType")));
    v26 = v25;
    if (v25 && (objc_opt_isKindOfClass(v25, v24) & 1) != 0)
      v27 = v26;
    else
      v27 = 0;

    if (v27)
    {
      v29 = objc_opt_class(NSArray);
      v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ipAddresses")));
      v31 = v30;
      if (v30 && (objc_opt_isKindOfClass(v30, v29) & 1) != 0)
        v32 = v31;
      else
        v32 = 0;

      if (v32)
      {
        v114 = v27;
        v115 = v22;
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        obj = v32;
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v121, v126, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v122;
          while (2)
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(_QWORD *)v122 != v36)
                objc_enumerationMutation(obj);
              v38 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i);
              v39 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v38, v39) & 1) == 0)
              {
                v32 = obj;

                v13 = 0;
                v27 = v114;
                v22 = v115;
                goto LABEL_123;
              }
            }
            v35 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v121, v126, 16);
            if (v35)
              continue;
            break;
          }
        }

        v40 = objc_opt_class(NSDictionary);
        v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("wired")));
        v42 = v41;
        if (v41 && (objc_opt_isKindOfClass(v41, v40) & 1) != 0)
          v43 = v42;
        else
          v43 = 0;

        v47 = objc_opt_class(NSArray);
        v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("ipAddresses")));
        v49 = v48;
        if (v48 && (objc_opt_isKindOfClass(v48, v47) & 1) != 0)
          v50 = v49;
        else
          v50 = 0;

        v112 = v50;
        v113 = v43;
        if (!v50 && v43)
        {
          v51 = sub_100056C84(2uLL);
          v52 = objc_claimAutoreleasedReturnValue(v51);
          v27 = v114;
          v22 = v115;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            sub_10006C088();
          v13 = 0;
          v32 = obj;
          goto LABEL_121;
        }
        v111 = v17;
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v53 = v50;
        v54 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v118;
          while (2)
          {
            for (j = 0; j != v55; j = (char *)j + 1)
            {
              if (*(_QWORD *)v118 != v56)
                objc_enumerationMutation(v53);
              v58 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)j);
              v59 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v58, v59) & 1) == 0)
              {
                v13 = 0;
                v52 = v53;
                v27 = v114;
                v22 = v115;
                v32 = obj;
                v17 = v111;
                goto LABEL_121;
              }
            }
            v55 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
            if (v55)
              continue;
            break;
          }
        }

        if (v113 && !-[NSObject count](v53, "count"))
        {
          v13 = 0;
          v27 = v114;
          v22 = v115;
          v32 = obj;
          v17 = v111;
LABEL_122:

          goto LABEL_123;
        }
        v106 = v53;
        v60 = objc_opt_class(NSNumber);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("port")));
        v62 = sub_10002FC18(v60, v61);
        v63 = objc_claimAutoreleasedReturnValue(v62);

        v52 = v63;
        v22 = v115;
        v17 = v111;
        if (!v63)
        {
          v93 = sub_100056C84(2uLL);
          v110 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            sub_10006C0F4();
          v13 = 0;
          v27 = v114;
          v32 = obj;
          goto LABEL_120;
        }
        v108 = v63;
        v64 = objc_opt_class(NSString);
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("deviceID")));
        v66 = sub_10002FC18(v64, v65);
        v67 = objc_claimAutoreleasedReturnValue(v66);

        v110 = v67;
        if (!v67)
        {
          v94 = sub_100056C84(2uLL);
          v109 = objc_claimAutoreleasedReturnValue(v94);
          v27 = v114;
          if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
            sub_10006C160();
          v13 = 0;
          v32 = obj;
          v52 = v108;
          goto LABEL_119;
        }
        v68 = objc_opt_class(NSString);
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("publicKey")));
        v70 = sub_10002FC18(v68, v69);
        v71 = objc_claimAutoreleasedReturnValue(v70);

        v109 = v71;
        if (!v71)
        {
          v95 = sub_100056C84(2uLL);
          v105 = objc_claimAutoreleasedReturnValue(v95);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            sub_10006C1CC();
          v13 = 0;
          v27 = v114;
          v32 = obj;
          v52 = v108;
          goto LABEL_118;
        }
        v72 = objc_opt_class(NSString);
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sourceVersion")));
        v74 = sub_10002FC18(v72, v73);
        v75 = objc_claimAutoreleasedReturnValue(v74);

        v105 = v75;
        if (!v75)
        {
          v96 = sub_100056C84(2uLL);
          v104 = objc_claimAutoreleasedReturnValue(v96);
          v27 = v114;
          v32 = obj;
          v52 = v108;
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            sub_10006C238();
          v13 = 0;
          goto LABEL_117;
        }
        v76 = objc_opt_class(NSString);
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sdkVersion")));
        v78 = sub_10002FC18(v76, v77);
        v79 = objc_claimAutoreleasedReturnValue(v78);

        v104 = v79;
        if (!v79)
        {
          v97 = sub_100056C84(2uLL);
          v103 = objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            sub_10006C2A4();
          v13 = 0;
          v27 = v114;
          v32 = obj;
          v52 = v108;
          goto LABEL_116;
        }
        v80 = objc_opt_class(NSDictionary);
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("asset")));
        v82 = sub_10002FC18(v80, v81);
        v83 = objc_claimAutoreleasedReturnValue(v82);

        v103 = v83;
        if (v83)
        {
          v84 = objc_opt_class(NSString);
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v83, "objectForKey:", CFSTR("id")));
          v86 = sub_10002FC18(v84, v85);
          v87 = objc_claimAutoreleasedReturnValue(v86);

          v102 = v87;
          if (!v87)
          {
            v99 = sub_100056C84(2uLL);
            v102 = objc_claimAutoreleasedReturnValue(v99);
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              sub_10006C310();
            v13 = 0;
            v27 = v114;
            v22 = v115;
            v32 = obj;
            v52 = v108;
            v17 = v111;
            goto LABEL_115;
          }
          v88 = objc_opt_class(NSNumber);
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v83, "objectForKey:", CFSTR("version")));
          v90 = sub_10002FC18(v88, v89);
          v91 = objc_claimAutoreleasedReturnValue(v90);

          if (!v91)
          {
            v101 = sub_100056C84(2uLL);
            v107 = objc_claimAutoreleasedReturnValue(v101);
            if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
            {
              sub_10006C37C();
              v98 = v107;
              v13 = 0;
              v27 = v114;
              v22 = v115;
              v32 = obj;
              v52 = v108;
            }
            else
            {
              v13 = 0;
              v27 = v114;
              v22 = v115;
              v32 = obj;
              v98 = v107;
              v52 = v108;
            }
            v17 = v111;
            goto LABEL_111;
          }
          v27 = v114;
          v32 = obj;
          v52 = v108;
          v92 = v102;
        }
        else
        {
          v92 = 0;
          v91 = 0;
          v27 = v114;
          v32 = obj;
          v52 = v108;
        }
        v102 = v92;
        self = -[CARCarPlayServiceMessageStartSession initWithSSID:passphrase:channel:securityType:wirelessIPs:wiredIPs:port:deviceID:publicKey:sourceVersion:sdkVersion:assetIdentifier:assetVersion:](self, "initWithSSID:passphrase:channel:securityType:wirelessIPs:wiredIPs:port:deviceID:publicKey:sourceVersion:sdkVersion:assetIdentifier:assetVersion:", v12, v111, v115, v27, v32, v106, v52, v110, v109, v105, v104, v92, v91);
        v98 = (void *)v91;
        v13 = self;
LABEL_111:

LABEL_115:
LABEL_116:

LABEL_117:
LABEL_118:

LABEL_119:
LABEL_120:

LABEL_121:
        goto LABEL_122;
      }
      v45 = sub_100056C84(2uLL);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_10006C088();

    }
    else
    {
      v44 = sub_100056C84(2uLL);
      v32 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10006C01C();
    }
    v13 = 0;
LABEL_123:

LABEL_124:
LABEL_125:

LABEL_126:
LABEL_127:

    goto LABEL_128;
  }
  v13 = 0;
LABEL_128:

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v23;
  uint64_t v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession SSID](self, "SSID"));
  objc_msgSend(v4, "cr_setSafeObject:forKey:", v5, CFSTR("SSID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession passphrase](self, "passphrase"));
  objc_msgSend(v4, "cr_setSafeObject:forKey:", v6, CFSTR("passphrase"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession channel](self, "channel"));
  objc_msgSend(v4, "cr_setSafeObject:forKey:", v7, CFSTR("channel"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession securityType](self, "securityType"));
  objc_msgSend(v4, "cr_setSafeObject:forKey:", v8, CFSTR("securityType"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession wirelessIPs](self, "wirelessIPs"));
  objc_msgSend(v4, "cr_setSafeObject:forKey:", v9, CFSTR("ipAddresses"));

  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("wireless"));
  v10 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession wiredIPs](self, "wiredIPs"));
  v11 = (void *)v10;
  if (v10)
  {
    v23 = CFSTR("ipAddresses");
    v24 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("wired"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession port](self, "port"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v13, CFSTR("port"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession deviceID](self, "deviceID"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v14, CFSTR("deviceID"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession publicKey](self, "publicKey"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v15, CFSTR("publicKey"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession sourceVersion](self, "sourceVersion"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v16, CFSTR("sourceVersion"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession sdkVersion](self, "sdkVersion"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v17, CFSTR("sdkVersion"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession assetIdentifier](self, "assetIdentifier"));
  v19 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageStartSession assetVersion](self, "assetVersion"));
  v20 = (void *)v19;
  if (v18 && v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v21, "setObject:forKey:", v18, CFSTR("id"));
    objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("version"));
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("asset"));

  }
  return v3;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (NSNumber)securityType
{
  return self->_securityType;
}

- (NSArray)wirelessIPs
{
  return self->_wirelessIPs;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (NSArray)wiredIPs
{
  return self->_wiredIPs;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSNumber)assetVersion
{
  return self->_assetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_wiredIPs, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_wirelessIPs, 0);
  objc_storeStrong((id *)&self->_securityType, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
}

@end
