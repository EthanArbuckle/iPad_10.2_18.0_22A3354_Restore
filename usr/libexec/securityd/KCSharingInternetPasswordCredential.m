@implementation KCSharingInternetPasswordCredential

- (KCSharingInternetPasswordCredential)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  KCSharingInternetPasswordCredential *v6;
  id v7;
  const __CFSet *v8;
  const __CFDictionary *v9;
  void *v10;
  KCSharingInternetPasswordCredential *v11;

  v6 = self;
  v7 = objc_msgSend((id)objc_opt_class(self), "requiredAttributeKeys");
  v8 = (const __CFSet *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10000A15C(a3, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v6 = -[KCSharingInternetPasswordCredential initWithAttributes:error:](v6, "initWithAttributes:error:", v10, a4);
    v11 = v6;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (KCSharingInternetPasswordCredential)initWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  KCSharingInternetPasswordCredential *v9;
  NSString *v10;
  NSString *sharingGroup;
  void *v12;
  NSString *v13;
  NSString *accessGroup;
  void *v15;
  NSString *v16;
  NSString *account;
  void *v18;
  NSString *v19;
  NSString *protocol;
  void *v21;
  NSString *v22;
  NSString *server;
  uint64_t v24;
  NSNumber *port;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  NSString *v31;
  NSString *authenticationType;
  void *v33;
  NSData *v34;
  NSData *data;
  uint64_t v36;
  NSDate *creationDate;
  uint64_t v38;
  NSDate *modificationDate;
  void *v40;
  NSString *v41;
  NSString *comment;
  void *v43;
  NSString *v44;
  NSString *label;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  void *v50;
  NSString *v51;
  NSString *viewHint;
  void *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  void *v57;
  NSData *v58;
  NSData *notes;
  void *v60;
  NSData *v61;
  NSData *history;
  void *v63;
  NSData *v64;
  NSData *clientDefined0;
  void *v66;
  NSData *v67;
  NSData *clientDefined1;
  void *v69;
  NSData *v70;
  NSData *clientDefined2;
  void *v72;
  NSData *v73;
  NSData *clientDefined3;
  objc_super v76;

  v7 = a3;
  v8 = a4;
  v76.receiver = self;
  v76.super_class = (Class)KCSharingInternetPasswordCredential;
  v9 = -[KCSharingInternetPasswordCredential init](&v76, "init");
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    sharingGroup = v9->_sharingGroup;
    v9->_sharingGroup = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessGroup"));
    v13 = (NSString *)objc_msgSend(v12, "copy");
    accessGroup = v9->_accessGroup;
    v9->_accessGroup = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
    v16 = (NSString *)objc_msgSend(v15, "copy");
    account = v9->_account;
    v9->_account = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocol"));
    v19 = (NSString *)objc_msgSend(v18, "copy");
    protocol = v9->_protocol;
    v9->_protocol = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "server"));
    v22 = (NSString *)objc_msgSend(v21, "copy");
    server = v9->_server;
    v9->_server = v22;

    v24 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "port")));
    port = v9->_port;
    v9->_port = (NSNumber *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v27 = (__CFString *)objc_msgSend(v26, "copy");
    v28 = v27;
    if (v27)
      v29 = v27;
    else
      v29 = &stru_1002EE888;
    objc_storeStrong((id *)&v9->_path, v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "authenticationType"));
    v31 = (NSString *)objc_msgSend(v30, "copy");
    authenticationType = v9->_authenticationType;
    v9->_authenticationType = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
    v34 = (NSData *)objc_msgSend(v33, "copy");
    data = v9->_data;
    v9->_data = v34;

    objc_msgSend(v7, "creationDate");
    v36 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v36;

    objc_msgSend(v7, "modificationDate");
    v38 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    modificationDate = v9->_modificationDate;
    v9->_modificationDate = (NSDate *)v38;

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "comment"));
    v41 = (NSString *)objc_msgSend(v40, "copy");
    comment = v9->_comment;
    v9->_comment = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "label"));
    v44 = (NSString *)objc_msgSend(v43, "copy");
    label = v9->_label;
    v9->_label = v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibility"));
    v47 = (__CFString *)objc_msgSend(v46, "copy");
    v48 = v47;
    if (v47)
      v49 = v47;
    else
      v49 = (__CFString *)kSecAttrAccessibleWhenUnlocked;
    objc_storeStrong((id *)&v9->_accessibility, v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewHint"));
    v51 = (NSString *)objc_msgSend(v50, "copy");
    viewHint = v9->_viewHint;
    v9->_viewHint = v51;

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "securityDomain"));
    v54 = (__CFString *)objc_msgSend(v53, "copy");
    v55 = v54;
    if (v54)
      v56 = v54;
    else
      v56 = &stru_1002EE888;
    objc_storeStrong((id *)&v9->_securityDomain, v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notes"));
    v58 = (NSData *)objc_msgSend(v57, "copy");
    notes = v9->_notes;
    v9->_notes = v58;

    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "history"));
    v61 = (NSData *)objc_msgSend(v60, "copy");
    history = v9->_history;
    v9->_history = v61;

    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientDefined0"));
    v64 = (NSData *)objc_msgSend(v63, "copy");
    clientDefined0 = v9->_clientDefined0;
    v9->_clientDefined0 = v64;

    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientDefined1"));
    v67 = (NSData *)objc_msgSend(v66, "copy");
    clientDefined1 = v9->_clientDefined1;
    v9->_clientDefined1 = v67;

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientDefined2"));
    v70 = (NSData *)objc_msgSend(v69, "copy");
    clientDefined2 = v9->_clientDefined2;
    v9->_clientDefined2 = v70;

    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientDefined3"));
    v73 = (NSData *)objc_msgSend(v72, "copy");
    clientDefined3 = v9->_clientDefined3;
    v9->_clientDefined3 = v73;

  }
  return v9;
}

- (KCSharingInternetPasswordCredential)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingInternetPasswordCredential *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  KCSharingInternetPasswordCredential *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSString *v44;
  NSString *sharingGroup;
  NSString *v46;
  NSString *accessGroup;
  NSString *v48;
  NSString *account;
  NSString *v50;
  NSString *protocol;
  NSString *v52;
  NSString *server;
  NSNumber *v54;
  NSNumber *port;
  NSString *v56;
  NSString *path;
  NSString *v58;
  NSString *authenticationType;
  NSData *v60;
  NSData *data;
  NSDate *v62;
  NSDate *creationDate;
  NSDate *v64;
  NSDate *modificationDate;
  NSString *v66;
  NSString *comment;
  void *v68;
  uint64_t v69;
  id *v70;
  void *v71;
  void *v72;
  id *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSString *v89;
  NSString *label;
  NSString *v91;
  NSString *accessibility;
  NSString *v93;
  NSString *viewHint;
  NSString *v95;
  NSString *securityDomain;
  NSData *v97;
  NSData *notes;
  NSData *v99;
  NSData *history;
  NSData *v101;
  NSData *clientDefined0;
  NSData *v103;
  NSData *clientDefined1;
  NSData *v105;
  NSData *clientDefined2;
  NSData *v107;
  NSData *clientDefined3;
  void *v110;
  id v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  objc_super v129;
  CFStringRef v130;
  id v131;
  const __CFString *v132;
  void *v133;
  const __CFString *v134;
  CFStringRef v135;
  CFStringRef v136;
  id v137;
  const __CFString *v138;
  id v139;
  CFStringRef v140;
  id v141;
  const __CFString *v142;
  void *v143;
  const __CFString *v144;
  CFStringRef v145;
  CFStringRef v146;
  id v147;
  const __CFString *v148;
  void *v149;
  const __CFString *v150;
  CFStringRef v151;
  CFStringRef v152;
  id v153;
  const __CFString *v154;
  void *v155;
  const __CFString *v156;
  CFStringRef v157;
  CFStringRef v158;
  id v159;
  const __CFString *v160;
  void *v161;
  const __CFString *v162;
  CFStringRef v163;
  CFStringRef v164;
  id v165;
  const __CFString *v166;
  void *v167;
  const __CFString *v168;
  CFStringRef v169;
  CFStringRef v170;
  id v171;
  const __CFString *v172;
  void *v173;
  const __CFString *v174;
  CFStringRef v175;
  CFStringRef v176;
  id v177;
  const __CFString *v178;
  uint64_t v179;
  const __CFString *v180;
  CFStringRef v181;
  CFStringRef v182;
  id v183;
  const __CFString *v184;
  void *v185;
  const __CFString *v186;
  CFStringRef v187;
  CFStringRef v188;
  id v189;
  const __CFString *v190;
  void *v191;
  const __CFString *v192;
  CFStringRef v193;
  CFStringRef v194;
  id v195;
  const __CFString *v196;
  void *v197;
  const __CFString *v198;
  CFStringRef v199;
  CFStringRef v200;
  id v201;
  const __CFString *v202;
  void *v203;
  const __CFString *v204;
  CFStringRef v205;
  uint64_t v206;
  id v207;
  const __CFString *v208;
  id v209;
  const __CFString *v210;
  uint64_t v211;

  v6 = a3;
  v129.receiver = self;
  v129.super_class = (Class)KCSharingInternetPasswordCredential;
  v7 = -[KCSharingInternetPasswordCredential init](&v129, "init");
  if (!v7)
    goto LABEL_102;
  v8 = kSecAttrSharingGroup;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrSharingGroup));
  v10 = (void *)v9;
  if (!v9)
  {
    v210 = CFSTR("KCSharingMissingAttribute");
    v211 = v8;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v12);
LABEL_21:

    goto LABEL_22;
  }
  if ((_NSIsNSString(v9) & 1) == 0)
  {
    v208 = CFSTR("KCSharingInvalidAttribute");
    v206 = v8;
    v12 = objc_msgSend(v10, "copy");
    v207 = v12;
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1));
    v209 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v23);
LABEL_19:

    goto LABEL_20;
  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrAccessGroup));
  v12 = (id)v11;
  if (!v11)
  {
    v204 = CFSTR("KCSharingMissingAttribute");
    v205 = kSecAttrAccessGroup;
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v22);
LABEL_20:

    goto LABEL_21;
  }
  if ((_NSIsNSString(v11) & 1) == 0)
  {
    v202 = CFSTR("KCSharingInvalidAttribute");
    v200 = kSecAttrAccessGroup;
    v22 = objc_msgSend(v12, "copy");
    v201 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1));
    v203 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v24);

    goto LABEL_19;
  }
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrAccount));
  v14 = (void *)v13;
  if (!v13)
  {
    v198 = CFSTR("KCSharingMissingAttribute");
    v199 = kSecAttrAccount;
    v26 = 1;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v16);
    goto LABEL_101;
  }
  if ((_NSIsNSString(v13) & 1) == 0)
  {
    v196 = CFSTR("KCSharingInvalidAttribute");
    v194 = kSecAttrAccount;
    v16 = objc_msgSend(v14, "copy");
    v195 = v16;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v195, &v194, 1));
    v197 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v28);

    v26 = 1;
    goto LABEL_101;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrProtocol));
  v16 = (id)v15;
  if (v15)
  {
    if ((_NSIsNSString(v15) & 1) != 0)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrServer));
      v18 = (id)v17;
      v128 = v16;
      if (v17)
      {
        if ((_NSIsNSString(v17) & 1) != 0)
        {
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrPort));
          v127 = (void *)v19;
          if (!v19)
          {
            v180 = CFSTR("KCSharingMissingAttribute");
            v181 = kSecAttrPort;
            v26 = 1;
            v34 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1));
            sub_10004D4E8(a4, 22, (uint64_t)v34);
LABEL_98:

            v31 = v127;
            goto LABEL_99;
          }
          v20 = (void *)v19;
          if (_NSIsNSNumber(v19))
          {
            v21 = v20;
          }
          else
          {
            if (!_NSIsNSString(v20))
            {
              v178 = CFSTR("KCSharingInvalidAttribute");
              v176 = kSecAttrPort;
              v34 = objc_msgSend(v20, "copy");
              v177 = v34;
              v69 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1));
              v179 = v69;
              v37 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1));
              v70 = a4;
              v68 = (void *)v69;
              sub_10004D4E8(v70, 1, (uint64_t)v37);
              v26 = 1;
              goto LABEL_97;
            }
            v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v20, "intValue")));
          }
          v126 = v21;
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrPath));
          if (v35)
          {
            v125 = (void *)v35;
            if ((_NSIsNSString(v35) & 1) != 0)
            {
              v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrAuthenticationType));
              v37 = (id)v36;
              if (v36)
              {
                v124 = v18;
                v123 = (void *)v36;
                if ((_NSIsNSString(v36) & 1) != 0)
                {
                  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecValueData));
                  if (v122)
                  {
                    if ((_NSIsNSData(v122) & 1) != 0)
                    {
                      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrCreationDate));
                      v39 = (id)v38;
                      if (v38)
                      {
                        if ((_NSIsNSDate(v38) & 1) != 0)
                        {
                          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrModificationDate));
                          if (v119)
                          {
                            if ((_NSIsNSDate(v119) & 1) != 0)
                            {
                              v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrComment));
                              v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrLabel));
                              v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrAccessible));
                              if (v115)
                              {
                                if (_NSIsNSString(v115) && objc_msgSend(v115, "length"))
                                {
                                  v114 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrSyncViewHint));
                                  if (v114 && (_NSIsNSString(v114) & 1) == 0)
                                  {
                                    v138 = CFSTR("KCSharingInvalidAttribute");
                                    v136 = kSecAttrSyncViewHint;
                                    v112 = objc_msgSend(v114, "copy");
                                    v137 = v112;
                                    v111 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1));
                                    v139 = v111;
                                    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1));
                                    sub_10004D4E8(a4, 1, (uint64_t)v86);

                                    v26 = 1;
                                  }
                                  else
                                  {
                                    v112 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrSecurityDomain));
                                    if (v112)
                                    {
                                      if ((_NSIsNSString(v112) & 1) != 0)
                                      {
                                        v111 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecDataInetExtraNotes));
                                        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecDataInetExtraHistory));
                                        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecDataInetExtraClientDefined0));
                                        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecDataInetExtraClientDefined1));
                                        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecDataInetExtraClientDefined2));
                                        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecDataInetExtraClientDefined3));
                                        v44 = (NSString *)objc_msgSend(v10, "copy");
                                        sharingGroup = v7->_sharingGroup;
                                        v7->_sharingGroup = v44;

                                        v46 = (NSString *)objc_msgSend(v12, "copy");
                                        accessGroup = v7->_accessGroup;
                                        v7->_accessGroup = v46;

                                        v48 = (NSString *)objc_msgSend(v14, "copy");
                                        account = v7->_account;
                                        v7->_account = v48;

                                        v50 = (NSString *)objc_msgSend(v128, "copy");
                                        protocol = v7->_protocol;
                                        v7->_protocol = v50;

                                        v52 = (NSString *)objc_msgSend(v124, "copy");
                                        server = v7->_server;
                                        v7->_server = v52;

                                        v54 = (NSNumber *)objc_msgSend(v126, "copy");
                                        port = v7->_port;
                                        v7->_port = v54;

                                        v56 = (NSString *)objc_msgSend(v125, "copy");
                                        path = v7->_path;
                                        v7->_path = v56;

                                        v58 = (NSString *)objc_msgSend(v123, "copy");
                                        authenticationType = v7->_authenticationType;
                                        v7->_authenticationType = v58;

                                        v60 = (NSData *)objc_msgSend(v122, "copy");
                                        data = v7->_data;
                                        v7->_data = v60;

                                        v62 = (NSDate *)objc_msgSend(v39, "copy");
                                        creationDate = v7->_creationDate;
                                        v7->_creationDate = v62;

                                        v64 = (NSDate *)objc_msgSend(v119, "copy");
                                        modificationDate = v7->_modificationDate;
                                        v7->_modificationDate = v64;

                                        if ((_NSIsNSString(v116) & 1) != 0)
                                        {
                                          v66 = (NSString *)objc_msgSend(v116, "copy");
                                          comment = v7->_comment;
                                          v7->_comment = v66;
                                        }
                                        else
                                        {
                                          comment = v7->_comment;
                                          v7->_comment = 0;
                                        }

                                        if ((_NSIsNSString(v113) & 1) != 0)
                                        {
                                          v89 = (NSString *)objc_msgSend(v113, "copy");
                                          label = v7->_label;
                                          v7->_label = v89;
                                        }
                                        else
                                        {
                                          label = v7->_label;
                                          v7->_label = 0;
                                        }

                                        v91 = (NSString *)objc_msgSend(v115, "copy");
                                        accessibility = v7->_accessibility;
                                        v7->_accessibility = v91;

                                        v93 = (NSString *)objc_msgSend(v114, "copy");
                                        viewHint = v7->_viewHint;
                                        v7->_viewHint = v93;

                                        v95 = (NSString *)objc_msgSend(v112, "copy");
                                        securityDomain = v7->_securityDomain;
                                        v7->_securityDomain = v95;

                                        if ((_NSIsNSData(v111) & 1) != 0)
                                        {
                                          v97 = (NSData *)objc_msgSend(v111, "copy");
                                          notes = v7->_notes;
                                          v7->_notes = v97;
                                        }
                                        else
                                        {
                                          notes = v7->_notes;
                                          v7->_notes = 0;
                                        }

                                        if ((_NSIsNSData(v40) & 1) != 0)
                                        {
                                          v99 = (NSData *)objc_msgSend(v40, "copy");
                                          history = v7->_history;
                                          v7->_history = v99;
                                        }
                                        else
                                        {
                                          history = v7->_history;
                                          v7->_history = 0;
                                        }

                                        if ((_NSIsNSData(v41) & 1) != 0)
                                        {
                                          v101 = (NSData *)objc_msgSend(v41, "copy");
                                          clientDefined0 = v7->_clientDefined0;
                                          v7->_clientDefined0 = v101;
                                        }
                                        else
                                        {
                                          clientDefined0 = v7->_clientDefined0;
                                          v7->_clientDefined0 = 0;
                                        }

                                        if ((_NSIsNSData(v42) & 1) != 0)
                                        {
                                          v103 = (NSData *)objc_msgSend(v42, "copy");
                                          clientDefined1 = v7->_clientDefined1;
                                          v7->_clientDefined1 = v103;
                                        }
                                        else
                                        {
                                          clientDefined1 = v7->_clientDefined1;
                                          v7->_clientDefined1 = 0;
                                        }

                                        if ((_NSIsNSData(v110) & 1) != 0)
                                        {
                                          v105 = (NSData *)objc_msgSend(v110, "copy");
                                          clientDefined2 = v7->_clientDefined2;
                                          v7->_clientDefined2 = v105;
                                        }
                                        else
                                        {
                                          clientDefined2 = v7->_clientDefined2;
                                          v7->_clientDefined2 = 0;
                                        }

                                        if ((_NSIsNSData(v43) & 1) != 0)
                                        {
                                          v107 = (NSData *)objc_msgSend(v43, "copy");
                                          clientDefined3 = v7->_clientDefined3;
                                          v7->_clientDefined3 = v107;
                                        }
                                        else
                                        {
                                          clientDefined3 = v7->_clientDefined3;
                                          v7->_clientDefined3 = 0;
                                        }

                                        v26 = 0;
                                      }
                                      else
                                      {
                                        v132 = CFSTR("KCSharingInvalidAttribute");
                                        v130 = kSecAttrSecurityDomain;
                                        v111 = objc_msgSend(v112, "copy");
                                        v131 = v111;
                                        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
                                        v133 = v87;
                                        v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1));
                                        sub_10004D4E8(a4, 1, (uint64_t)v88);

                                        v26 = 1;
                                      }
                                    }
                                    else
                                    {
                                      v134 = CFSTR("KCSharingMissingAttribute");
                                      v135 = kSecAttrSecurityDomain;
                                      v26 = 1;
                                      v111 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1));
                                      sub_10004D4E8(a4, 22, (uint64_t)v111);
                                      v112 = 0;
                                    }
                                  }

                                }
                                else
                                {
                                  v142 = CFSTR("KCSharingInvalidAttribute");
                                  v140 = kSecAttrAccessible;
                                  v114 = objc_msgSend(v115, "copy");
                                  v141 = v114;
                                  v26 = 1;
                                  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
                                  v143 = v84;
                                  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1));
                                  sub_10004D4E8(a4, 1, (uint64_t)v85);

                                }
                              }
                              else
                              {
                                v144 = CFSTR("KCSharingMissingAttribute");
                                v145 = kSecAttrAccessible;
                                v26 = 1;
                                v114 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1));
                                sub_10004D4E8(a4, 22, (uint64_t)v114);
                              }

                            }
                            else
                            {
                              v148 = CFSTR("KCSharingInvalidAttribute");
                              v146 = kSecAttrModificationDate;
                              v118 = objc_msgSend(v119, "copy");
                              v147 = v118;
                              v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
                              v149 = v82;
                              v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1));
                              sub_10004D4E8(a4, 1, (uint64_t)v83);

                              v26 = 1;
                            }
                          }
                          else
                          {
                            v150 = CFSTR("KCSharingMissingAttribute");
                            v151 = kSecAttrModificationDate;
                            v26 = 1;
                            v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1));
                            sub_10004D4E8(a4, 22, (uint64_t)v117);

                          }
                        }
                        else
                        {
                          v154 = CFSTR("KCSharingInvalidAttribute");
                          v152 = kSecAttrCreationDate;
                          v121 = objc_msgSend(v39, "copy");
                          v153 = v121;
                          v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1));
                          v155 = v80;
                          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));
                          sub_10004D4E8(a4, 1, (uint64_t)v81);

                          v26 = 1;
                        }
                      }
                      else
                      {
                        v156 = CFSTR("KCSharingMissingAttribute");
                        v157 = kSecAttrCreationDate;
                        v26 = 1;
                        v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1));
                        sub_10004D4E8(a4, 22, (uint64_t)v120);

                      }
                    }
                    else
                    {
                      v160 = CFSTR("KCSharingInvalidAttribute");
                      v158 = kSecValueData;
                      v39 = objc_msgSend(v122, "copy");
                      v159 = v39;
                      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1));
                      v161 = v78;
                      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1));
                      sub_10004D4E8(a4, 1, (uint64_t)v79);

                      v26 = 1;
                    }
                  }
                  else
                  {
                    v162 = CFSTR("KCSharingMissingAttribute");
                    v163 = kSecValueData;
                    v26 = 1;
                    v39 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1));
                    sub_10004D4E8(a4, 22, (uint64_t)v39);
                  }

                  v37 = v123;
                  v18 = v124;
                  v74 = v122;
                }
                else
                {
                  v166 = CFSTR("KCSharingInvalidAttribute");
                  v164 = kSecAttrAuthenticationType;
                  v75 = objc_msgSend(v37, "copy");
                  v165 = v75;
                  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1));
                  v167 = v76;
                  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1));
                  sub_10004D4E8(a4, 1, (uint64_t)v77);

                  v74 = v75;
                  v37 = v123;

                  v26 = 1;
                }
              }
              else
              {
                v168 = CFSTR("KCSharingMissingAttribute");
                v169 = kSecAttrAuthenticationType;
                v26 = 1;
                v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1));
                sub_10004D4E8(a4, 22, (uint64_t)v74);
              }

              v68 = v125;
              v34 = v126;
              goto LABEL_97;
            }
            v172 = CFSTR("KCSharingInvalidAttribute");
            v170 = kSecAttrPath;
            v37 = objc_msgSend(v125, "copy");
            v171 = v37;
            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1));
            v173 = v71;
            v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1));
            v73 = a4;
            v68 = v125;
            sub_10004D4E8(v73, 1, (uint64_t)v72);

            v26 = 1;
          }
          else
          {
            v174 = CFSTR("KCSharingMissingAttribute");
            v175 = kSecAttrPath;
            v26 = 1;
            v37 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1));
            sub_10004D4E8(a4, 22, (uint64_t)v37);
            v68 = 0;
          }
          v34 = v126;
LABEL_97:

          goto LABEL_98;
        }
        v184 = CFSTR("KCSharingInvalidAttribute");
        v182 = kSecAttrServer;
        v31 = objc_msgSend(v18, "copy");
        v183 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1));
        v185 = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1));
        sub_10004D4E8(a4, 1, (uint64_t)v33);

        v26 = 1;
      }
      else
      {
        v186 = CFSTR("KCSharingMissingAttribute");
        v187 = kSecAttrServer;
        v26 = 1;
        v31 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1));
        sub_10004D4E8(a4, 22, (uint64_t)v31);
      }
LABEL_99:

      v16 = v128;
      goto LABEL_100;
    }
    v190 = CFSTR("KCSharingInvalidAttribute");
    v188 = kSecAttrProtocol;
    v18 = objc_msgSend(v16, "copy");
    v189 = v18;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1));
    v191 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v30);

    v26 = 1;
  }
  else
  {
    v192 = CFSTR("KCSharingMissingAttribute");
    v193 = kSecAttrProtocol;
    v26 = 1;
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v18);
  }
LABEL_100:

LABEL_101:
  if (!v26)
  {
LABEL_102:
    v25 = v7;
    goto LABEL_103;
  }
LABEL_22:
  v25 = 0;
LABEL_103:

  return v25;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  int64_t v16;
  void *v17;
  int64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  int64_t v22;
  void *v23;
  int64_t v24;
  void *v25;
  int64_t v26;
  void *v27;
  int64_t v28;
  void *v29;
  int64_t v30;
  void *v31;
  int64_t v32;
  void *v33;
  int64_t v34;
  void *v35;
  int64_t v36;
  void *v37;
  int64_t v38;
  void *v39;
  int64_t v40;
  void *v41;
  int64_t v42;
  void *v43;
  int64_t v44;
  void *v45;
  char *v46;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential sharingGroup](self, "sharingGroup"));
  v4 = objc_msgSend(v3, "hash");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessGroup](self, "accessGroup"));
  v6 = (_BYTE *)objc_msgSend(v5, "hash") - (_BYTE *)v4 + 32 * (_QWORD)v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential account](self, "account"));
  v8 = (int64_t)objc_msgSend(v7, "hash") + 32 * v6 - v6;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential protocol](self, "protocol"));
  v10 = (int64_t)objc_msgSend(v9, "hash") + 32 * v8 - v8;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential server](self, "server"));
  v12 = (int64_t)objc_msgSend(v11, "hash") + 32 * v10 - v10;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential port](self, "port"));
  v14 = (int64_t)objc_msgSend(v13, "hash") + 32 * v12 - v12;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential path](self, "path"));
  v16 = (int64_t)objc_msgSend(v15, "hash") + 32 * v14 - v14;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential authenticationType](self, "authenticationType"));
  v18 = (int64_t)objc_msgSend(v17, "hash") + 32 * v16 - v16;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential data](self, "data"));
  v20 = (int64_t)objc_msgSend(v19, "hash") + 32 * v18 - v18;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential creationDate](self, "creationDate"));
  v22 = (int64_t)objc_msgSend(v21, "hash") + 32 * v20 - v20;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential modificationDate](self, "modificationDate"));
  v24 = (int64_t)objc_msgSend(v23, "hash") + 32 * v22 - v22;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential comment](self, "comment"));
  v26 = (int64_t)objc_msgSend(v25, "hash") + 32 * v24 - v24;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential label](self, "label"));
  v28 = (int64_t)objc_msgSend(v27, "hash") + 32 * v26 - v26;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessibility](self, "accessibility"));
  v30 = (int64_t)objc_msgSend(v29, "hash") + 32 * v28 - v28;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential viewHint](self, "viewHint"));
  v32 = (int64_t)objc_msgSend(v31, "hash") + 32 * v30 - v30;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential securityDomain](self, "securityDomain"));
  v34 = (int64_t)objc_msgSend(v33, "hash") + 32 * v32 - v32;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential notes](self, "notes"));
  v36 = (int64_t)objc_msgSend(v35, "hash") + 32 * v34 - v34;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential history](self, "history"));
  v38 = (int64_t)objc_msgSend(v37, "hash") + 32 * v36 - v36;

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined0](self, "clientDefined0"));
  v40 = (int64_t)objc_msgSend(v39, "hash") + 32 * v38 - v38;

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined1](self, "clientDefined1"));
  v42 = (int64_t)objc_msgSend(v41, "hash") + 32 * v40 - v40;

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined2](self, "clientDefined2"));
  v44 = (int64_t)objc_msgSend(v43, "hash") + 32 * v42 - v42;

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined3](self, "clientDefined3"));
  v46 = (char *)objc_msgSend(v45, "hash") + 32 * v44 - v44;

  return (unint64_t)v46;
}

- (BOOL)isEqual:(id)a3
{
  KCSharingInternetPasswordCredential *v4;
  KCSharingInternetPasswordCredential *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned __int8 v28;
  int v29;
  KCSharingInternetPasswordCredential *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  KCSharingInternetPasswordCredential *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  _BYTE v116[20];
  _QWORD v117[4];
  unsigned int v118;
  id v119;
  id v120;
  _QWORD v121[4];

  v4 = (KCSharingInternetPasswordCredential *)a3;
  if (v4 == self)
  {
    v28 = 1;
    goto LABEL_82;
  }
  if (!-[KCSharingInternetPasswordCredential isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v28 = 0;
    goto LABEL_82;
  }
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential sharingGroup](self, "sharingGroup"));
  v119 = (id)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential sharingGroup](v5, "sharingGroup"));
  v120 = v6;
  v118 = objc_msgSend(v6, "isEqualToString:", v119);
  if (v118)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessGroup](self, "accessGroup"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessGroup](v5, "accessGroup"));
    v115 = v8;
    if (objc_msgSend(v8, "isEqualToString:"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential account](self, "account"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential account](v5, "account"));
      v113 = v9;
      if (objc_msgSend(v9, "isEqualToString:"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential protocol](self, "protocol"));
        v110 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential protocol](v5, "protocol"));
        v111 = v10;
        if (objc_msgSend(v10, "isEqualToString:"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential server](self, "server"));
          v108 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential server](v5, "server"));
          v109 = v11;
          if (objc_msgSend(v11, "isEqualToString:"))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential port](self, "port"));
            v106 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential port](v5, "port"));
            v107 = v12;
            if (objc_msgSend(v12, "isEqualToNumber:"))
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential path](self, "path"));
              v104 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential path](v5, "path"));
              v105 = v13;
              if (objc_msgSend(v13, "isEqualToString:"))
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential authenticationType](self, "authenticationType"));
                v102 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential authenticationType](v5, "authenticationType"));
                v103 = v14;
                if (objc_msgSend(v14, "isEqualToString:"))
                {
                  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential data](self, "data"));
                  v100 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential data](v5, "data"));
                  v101 = v15;
                  if (objc_msgSend(v15, "isEqualToData:"))
                  {
                    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential creationDate](self, "creationDate"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential creationDate](v5, "creationDate"));
                    v99 = v16;
                    if (objc_msgSend(v16, "isEqualToDate:"))
                    {
                      v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential modificationDate](self, "modificationDate"));
                      v96 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential modificationDate](v5, "modificationDate"));
                      v97 = v17;
                      if (objc_msgSend(v17, "isEqualToDate:"))
                      {
                        v18 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential comment](self, "comment"));
                        v94 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential comment](v5, "comment"));
                        v95 = (void *)v18;
                        HIDWORD(v121[3]) = v18 != (_QWORD)v94;
                        if ((void *)v18 == v94
                          || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential comment](self, "comment")),
                              v90 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential comment](v5, "comment")),
                              v91 = v19,
                              objc_msgSend(v19, "isEqualToString:")))
                        {
                          v37 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential label](self, "label"));
                          v92 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential label](v5, "label"));
                          v93 = (void *)v37;
                          LODWORD(v121[3]) = v37 != (_QWORD)v92;
                          v56 = v5;
                          if ((void *)v37 == v92
                            || (v38 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential label](self, "label")),
                                v86 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential label](v5, "label")),
                                v87 = v38,
                                objc_msgSend(v38, "isEqualToString:")))
                          {
                            v39 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessibility](self, "accessibility", v5));
                            v5 = v56;
                            v88 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessibility](v56, "accessibility"));
                            v89 = v39;
                            if (!objc_msgSend(v39, "isEqualToString:"))
                            {
                              *(_QWORD *)v116 = 0;
                              v21 = 0;
                              v22 = 0;
                              v23 = 0;
                              v24 = 0;
                              memset(v121, 0, 24);
                              v25 = 0;
                              v26 = 0;
                              v27 = 0;
                              v28 = 0;
                              v117[3] = 0x100000001;
                              v117[2] = 0x100000001;
                              v117[1] = 0x100000001;
                              v117[0] = 0x100000001;
                              *(_QWORD *)&v116[12] = 0x100000001;
                              *(_DWORD *)&v116[8] = 1;
                              v20 = 1;
                              goto LABEL_21;
                            }
                            v40 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential viewHint](self, "viewHint"));
                            v84 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential viewHint](v56, "viewHint"));
                            v85 = (void *)v40;
                            HIDWORD(v121[2]) = v40 != (_QWORD)v84;
                            if ((void *)v40 == v84
                              || (v41 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential viewHint](self, "viewHint")),
                                  v80 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential viewHint](v56, "viewHint")),
                                  v81 = v41,
                                  objc_msgSend(v41, "isEqualToString:")))
                            {
                              v42 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential securityDomain](self, "securityDomain"));
                              v82 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential securityDomain](v56, "securityDomain"));
                              v83 = v42;
                              if (objc_msgSend(v42, "isEqualToString:"))
                              {
                                v43 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential notes](self, "notes"));
                                v78 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential notes](v56, "notes"));
                                v79 = (void *)v43;
                                LODWORD(v121[2]) = v43 != (_QWORD)v78;
                                if ((void *)v43 == v78
                                  || (v44 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential notes](self, "notes")),
                                      v74 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential notes](v56, "notes")),
                                      v75 = v44,
                                      objc_msgSend(v44, "isEqualToData:")))
                                {
                                  v45 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential history](self, "history"));
                                  v76 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential history](v56, "history"));
                                  v77 = (void *)v45;
                                  HIDWORD(v121[1]) = v45 != (_QWORD)v76;
                                  if ((void *)v45 == v76
                                    || (v46 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential history](self, "history")),
                                        v70 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential history](v56, "history")),
                                        v71 = v46,
                                        objc_msgSend(v46, "isEqualToData:")))
                                  {
                                    v47 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined0](self, "clientDefined0"));
                                    v72 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined0](v56, "clientDefined0"));
                                    v73 = (void *)v47;
                                    LODWORD(v121[1]) = v47 != (_QWORD)v72;
                                    if ((void *)v47 == v72
                                      || (v48 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined0](self, "clientDefined0")), v66 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined0](v56, "clientDefined0")), v67 = v48, objc_msgSend(v48, "isEqualToData:")))
                                    {
                                      v49 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined1](self, "clientDefined1"));
                                      v68 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined1](v56, "clientDefined1"));
                                      v69 = (void *)v49;
                                      HIDWORD(v121[0]) = v49 != (_QWORD)v68;
                                      if ((void *)v49 == v68
                                        || (v50 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined1](self, "clientDefined1")), v60 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined1](v56, "clientDefined1")), v61 = v50, objc_msgSend(v50, "isEqualToData:")))
                                      {
                                        v51 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined2](self, "clientDefined2"));
                                        v64 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined2](v56, "clientDefined2"));
                                        v65 = (void *)v51;
                                        LODWORD(v121[0]) = v51 != (_QWORD)v64;
                                        if ((void *)v51 == v64
                                          || (v52 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined2](self, "clientDefined2")), v58 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined2](v56, "clientDefined2")), v59 = v52, objc_msgSend(v52, "isEqualToData:")))
                                        {
                                          v53 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined3](self, "clientDefined3"));
                                          v62 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined3](v56, "clientDefined3"));
                                          v63 = (void *)v53;
                                          if ((void *)v53 != v62)
                                          {
                                            v54 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined3](self, "clientDefined3"));
                                            v5 = v56;
                                            v55 = objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined3](v56, "clientDefined3"));
                                            v57 = v54;
                                            v28 = objc_msgSend(v54, "isEqualToData:", v55);
                                            v7 = (void *)v55;
                                            v27 = 1;
                                            v117[3] = 0x100000001;
                                            v117[2] = 0x100000001;
                                            v117[1] = 0x100000001;
                                            v117[0] = 0x100000001;
                                            *(_QWORD *)&v116[12] = 0x100000001;
                                            *(_DWORD *)&v116[8] = 1;
                                            v20 = 1;
                                            v21 = 1;
                                            *(_QWORD *)v116 = 0x100000001;
                                            v22 = 1;
                                            v23 = 1;
                                            v24 = 1;
                                            v25 = 1;
                                            v26 = 1;
                                            goto LABEL_21;
                                          }
                                          v27 = 0;
                                          v117[3] = 0x100000001;
                                          v117[2] = 0x100000001;
                                          v117[1] = 0x100000001;
                                          v117[0] = 0x100000001;
                                          *(_QWORD *)&v116[12] = 0x100000001;
                                          *(_DWORD *)&v116[8] = 1;
                                          v20 = 1;
                                          v21 = 1;
                                          *(_QWORD *)v116 = 0x100000001;
                                          v22 = 1;
                                          v23 = 1;
                                          v24 = 1;
                                          v25 = 1;
                                          v62 = (void *)v53;
                                          v26 = 1;
                                          v28 = 1;
                                        }
                                        else
                                        {
                                          v26 = 0;
                                          v27 = 0;
                                          v28 = 0;
                                          v117[3] = 0x100000001;
                                          v117[2] = 0x100000001;
                                          v117[1] = 0x100000001;
                                          v117[0] = 0x100000001;
                                          *(_QWORD *)&v116[12] = 0x100000001;
                                          *(_DWORD *)&v116[8] = 1;
                                          v20 = 1;
                                          v21 = 1;
                                          *(_QWORD *)v116 = 0x100000001;
                                          v22 = 1;
                                          v23 = 1;
                                          v24 = 1;
                                          v25 = 1;
                                          LODWORD(v121[0]) = 1;
                                        }
                                      }
                                      else
                                      {
                                        v25 = 0;
                                        v121[0] = 0x100000000;
                                        v26 = 0;
                                        v27 = 0;
                                        v28 = 0;
                                        v117[3] = 0x100000001;
                                        v117[2] = 0x100000001;
                                        v117[1] = 0x100000001;
                                        v117[0] = 0x100000001;
                                        *(_QWORD *)&v116[12] = 0x100000001;
                                        *(_DWORD *)&v116[8] = 1;
                                        v20 = 1;
                                        v21 = 1;
                                        *(_QWORD *)v116 = 0x100000001;
                                        v22 = 1;
                                        v23 = 1;
                                        v24 = 1;
                                      }
                                    }
                                    else
                                    {
                                      v24 = 0;
                                      v121[0] = 0;
                                      v25 = 0;
                                      v26 = 0;
                                      v27 = 0;
                                      v28 = 0;
                                      v117[3] = 0x100000001;
                                      v117[2] = 0x100000001;
                                      v117[1] = 0x100000001;
                                      v117[0] = 0x100000001;
                                      *(_QWORD *)&v116[12] = 0x100000001;
                                      *(_DWORD *)&v116[8] = 1;
                                      v20 = 1;
                                      v21 = 1;
                                      *(_QWORD *)v116 = 0x100000001;
                                      v22 = 1;
                                      v23 = 1;
                                      LODWORD(v121[1]) = 1;
                                    }
                                  }
                                  else
                                  {
                                    v23 = 0;
                                    *(_QWORD *)((char *)v121 + 4) = 0;
                                    v24 = 0;
                                    v25 = 0;
                                    LODWORD(v121[0]) = 0;
                                    v26 = 0;
                                    v27 = 0;
                                    v28 = 0;
                                    v117[3] = 0x100000001;
                                    v117[2] = 0x100000001;
                                    v117[1] = 0x100000001;
                                    v117[0] = 0x100000001;
                                    *(_QWORD *)&v116[12] = 0x100000001;
                                    *(_DWORD *)&v116[8] = 1;
                                    v20 = 1;
                                    v21 = 1;
                                    *(_QWORD *)v116 = 0x100000001;
                                    v22 = 1;
                                    HIDWORD(v121[1]) = 1;
                                  }
                                }
                                else
                                {
                                  v22 = 0;
                                  v121[0] = 0;
                                  v121[1] = 0;
                                  v23 = 0;
                                  v24 = 0;
                                  v25 = 0;
                                  v26 = 0;
                                  v27 = 0;
                                  v28 = 0;
                                  v117[3] = 0x100000001;
                                  v117[2] = 0x100000001;
                                  v117[1] = 0x100000001;
                                  v117[0] = 0x100000001;
                                  *(_QWORD *)&v116[12] = 0x100000001;
                                  *(_DWORD *)&v116[8] = 1;
                                  v20 = 1;
                                  v21 = 1;
                                  *(_QWORD *)v116 = 0x100000001;
                                  LODWORD(v121[2]) = 1;
                                }
                              }
                              else
                              {
                                *(_QWORD *)v116 = 0x100000000;
                                v22 = 0;
                                v23 = 0;
                                v24 = 0;
                                v25 = 0;
                                memset(v121, 0, 20);
                                v26 = 0;
                                v27 = 0;
                                v28 = 0;
                                v117[3] = 0x100000001;
                                v117[2] = 0x100000001;
                                v117[1] = 0x100000001;
                                v117[0] = 0x100000001;
                                *(_QWORD *)&v116[12] = 0x100000001;
                                *(_DWORD *)&v116[8] = 1;
                                v20 = 1;
                                v21 = 1;
                              }
                            }
                            else
                            {
                              v21 = 0;
                              *(_QWORD *)v116 = 0x100000000;
                              v22 = 0;
                              v23 = 0;
                              v24 = 0;
                              v25 = 0;
                              memset(v121, 0, 20);
                              v26 = 0;
                              v27 = 0;
                              v28 = 0;
                              v117[3] = 0x100000001;
                              v117[2] = 0x100000001;
                              v117[1] = 0x100000001;
                              v117[0] = 0x100000001;
                              *(_QWORD *)&v116[12] = 0x100000001;
                              *(_DWORD *)&v116[8] = 1;
                              v20 = 1;
                              HIDWORD(v121[2]) = 1;
                            }
                          }
                          else
                          {
                            v20 = 0;
                            *(_QWORD *)v116 = 0;
                            v21 = 0;
                            v22 = 0;
                            v23 = 0;
                            v24 = 0;
                            memset(v121, 0, 24);
                            v25 = 0;
                            v26 = 0;
                            v27 = 0;
                            v28 = 0;
                            v117[3] = 0x100000001;
                            v117[2] = 0x100000001;
                            v117[1] = 0x100000001;
                            v117[0] = 0x100000001;
                            *(_QWORD *)&v116[12] = 0x100000001;
                            *(_DWORD *)&v116[8] = 1;
                            LODWORD(v121[3]) = 1;
                          }
                          v5 = v56;
                          goto LABEL_21;
                        }
                        *(_QWORD *)&v116[4] = 0;
                        v20 = 0;
                        v21 = 0;
                        *(_DWORD *)v116 = 0;
                        v22 = 0;
                        v23 = 0;
                        v24 = 0;
                        v25 = 0;
                        memset(v121, 0, 28);
                        v26 = 0;
                        v27 = 0;
                        v28 = 0;
                        v117[3] = 0x100000001;
                        v117[2] = 0x100000001;
                        v117[1] = 0x100000001;
                        v117[0] = 0x100000001;
                        *(_QWORD *)&v116[12] = 0x100000001;
                        HIDWORD(v121[3]) = 1;
                      }
                      else
                      {
                        v117[0] = 0x100000000;
                        *(_QWORD *)&v116[4] = 0;
                        v20 = 0;
                        v21 = 0;
                        *(_DWORD *)v116 = 0;
                        v22 = 0;
                        memset(v121, 0, sizeof(v121));
                        v23 = 0;
                        v24 = 0;
                        v25 = 0;
                        v26 = 0;
                        v27 = 0;
                        v28 = 0;
                        v117[3] = 0x100000001;
                        v117[2] = 0x100000001;
                        v117[1] = 0x100000001;
                        *(_QWORD *)&v116[12] = 0x100000001;
                      }
                    }
                    else
                    {
                      *(_QWORD *)v116 = 0;
                      *(_QWORD *)&v116[8] = 0;
                      v117[0] = 0x100000000;
                      v20 = 0;
                      v21 = 0;
                      v22 = 0;
                      memset(v121, 0, sizeof(v121));
                      v23 = 0;
                      v24 = 0;
                      v25 = 0;
                      v26 = 0;
                      v27 = 0;
                      v28 = 0;
                      v117[3] = 0x100000001;
                      v117[2] = 0x100000001;
                      v117[1] = 0x100000001;
                      *(_DWORD *)&v116[16] = 1;
                    }
                  }
                  else
                  {
                    v117[0] = 0x100000000;
                    v20 = 0;
                    v21 = 0;
                    memset(v116, 0, sizeof(v116));
                    v22 = 0;
                    memset(v121, 0, sizeof(v121));
                    v23 = 0;
                    v24 = 0;
                    v25 = 0;
                    v26 = 0;
                    v27 = 0;
                    v28 = 0;
                    v117[3] = 0x100000001;
                    v117[2] = 0x100000001;
                    v117[1] = 0x100000001;
                  }
                }
                else
                {
                  v117[0] = 0;
                  v20 = 0;
                  v21 = 0;
                  memset(v116, 0, sizeof(v116));
                  v22 = 0;
                  memset(v121, 0, sizeof(v121));
                  v23 = 0;
                  v24 = 0;
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  v28 = 0;
                  v117[3] = 0x100000001;
                  v117[2] = 0x100000001;
                  v117[1] = 0x100000001;
                }
              }
              else
              {
                *(_QWORD *)((char *)v117 + 4) = 0;
                LODWORD(v117[0]) = 0;
                v20 = 0;
                v21 = 0;
                memset(v116, 0, sizeof(v116));
                v22 = 0;
                memset(v121, 0, sizeof(v121));
                v23 = 0;
                v24 = 0;
                v25 = 0;
                v26 = 0;
                v27 = 0;
                v28 = 0;
                v117[3] = 0x100000001;
                v117[2] = 0x100000001;
                HIDWORD(v117[1]) = 1;
              }
            }
            else
            {
              v117[1] = 0;
              v117[0] = 0;
              v20 = 0;
              v21 = 0;
              memset(v116, 0, sizeof(v116));
              v22 = 0;
              memset(v121, 0, sizeof(v121));
              v23 = 0;
              v24 = 0;
              v25 = 0;
              v26 = 0;
              v27 = 0;
              v28 = 0;
              v117[3] = 0x100000001;
              v117[2] = 0x100000001;
            }
          }
          else
          {
            memset(v117, 0, 20);
            v20 = 0;
            v21 = 0;
            memset(v116, 0, sizeof(v116));
            v22 = 0;
            memset(v121, 0, sizeof(v121));
            v23 = 0;
            v24 = 0;
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v28 = 0;
            v117[3] = 0x100000001;
            HIDWORD(v117[2]) = 1;
          }
        }
        else
        {
          memset(v117, 0, 24);
          v20 = 0;
          v21 = 0;
          memset(v116, 0, sizeof(v116));
          v22 = 0;
          memset(v121, 0, sizeof(v121));
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v117[3] = 0x100000001;
        }
      }
      else
      {
        memset(v117, 0, 28);
        v20 = 0;
        v21 = 0;
        memset(v116, 0, sizeof(v116));
        v22 = 0;
        memset(v121, 0, sizeof(v121));
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v27 = 0;
        v28 = 0;
        HIDWORD(v117[3]) = 1;
      }
    }
    else
    {
      memset(v117, 0, sizeof(v117));
      v20 = 0;
      v21 = 0;
      memset(v116, 0, sizeof(v116));
      v22 = 0;
      memset(v121, 0, sizeof(v121));
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
    }
  }
  else
  {
    v23 = 0;
    memset(v117, 0, sizeof(v117));
    v20 = 0;
    v21 = 0;
    memset(v116, 0, sizeof(v116));
    v22 = 0;
    memset(v121, 0, sizeof(v121));
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
  }
LABEL_21:
  if (v27)
  {
    v29 = v20;
    v30 = v5;
    v31 = v23;
    v32 = v22;
    v33 = v24;
    v34 = v25;
    v35 = v26;

    v26 = v35;
    v25 = v34;
    v24 = v33;
    v22 = v32;
    v23 = v31;
    v5 = v30;
    v20 = v29;
  }
  if (v26)
  {

  }
  if (LODWORD(v121[0]))
  {

  }
  if (v25)
  {

  }
  if (HIDWORD(v121[0]))
  {

  }
  if (v24)
  {

  }
  if (LODWORD(v121[1]))
  {

  }
  if (v23)
  {

  }
  if (HIDWORD(v121[1]))
  {

  }
  if (v22)
  {

  }
  if (LODWORD(v121[2]))
  {

  }
  if (*(_DWORD *)v116)
  {

  }
  if (v21)
  {

  }
  if (HIDWORD(v121[2]))
  {

  }
  if (*(_DWORD *)&v116[4])
  {

  }
  if (v20)
  {

  }
  if (LODWORD(v121[3]))
  {

  }
  if (*(_DWORD *)&v116[8])
  {

  }
  if (HIDWORD(v121[3]))
  {

  }
  if (LODWORD(v117[0]))
  {

  }
  if (*(_DWORD *)&v116[12])
  {

  }
  if (*(_DWORD *)&v116[16])
  {

  }
  if (HIDWORD(v117[0]))
  {

  }
  if (LODWORD(v117[1]))
  {

  }
  if (HIDWORD(v117[1]))
  {

  }
  if (LODWORD(v117[2]))
  {

  }
  if (HIDWORD(v117[2]))
  {

  }
  if (LODWORD(v117[3]))
  {

  }
  if (HIDWORD(v117[3]))
  {

  }
  if (v118)
  {

  }
LABEL_82:

  return v28;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential sharingGroup](self, "sharingGroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessGroup](self, "accessGroup"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential account](self, "account"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential protocol](self, "protocol"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential server](self, "server"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential port](self, "port"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential path](self, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential authenticationType](self, "authenticationType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential creationDate](self, "creationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential modificationDate](self, "modificationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential comment](self, "comment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential label](self, "label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessibility](self, "accessibility"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential viewHint](self, "viewHint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential securityDomain](self, "securityDomain"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KCSharingInternetPasswordCredential(sharingGroup:%@ accessGroup:%@ account:%@ protocol:%@ server:%@ port:%@ path:%@ authenticationType:%@ creationDate:%@ modificationDate:%@ comment:%@ label:%@ accessibility:%@ viewHint:%@ securityDomain:%@)"), v14, v13, v19, v18, v17, v16, v3, v4, v5, v6, v12, v7, v8, v9, v10));

  return (NSString *)v15;
}

- (id)proto
{
  KCSharingPBInternetPasswordCredential *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = objc_opt_new(KCSharingPBInternetPasswordCredential);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessGroup](self, "accessGroup"));
  -[KCSharingPBInternetPasswordCredential setAccessGroup:](v3, "setAccessGroup:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential account](self, "account"));
  -[KCSharingPBInternetPasswordCredential setAccount:](v3, "setAccount:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential protocol](self, "protocol"));
  -[KCSharingPBInternetPasswordCredential setProtocol:](v3, "setProtocol:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential server](self, "server"));
  -[KCSharingPBInternetPasswordCredential setServer:](v3, "setServer:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential port](self, "port"));
  -[KCSharingPBInternetPasswordCredential setPort:](v3, "setPort:", objc_msgSend(v8, "intValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential path](self, "path"));
  -[KCSharingPBInternetPasswordCredential setPath:](v3, "setPath:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential authenticationType](self, "authenticationType"));
  -[KCSharingPBInternetPasswordCredential setAuthenticationType:](v3, "setAuthenticationType:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential data](self, "data"));
  -[KCSharingPBInternetPasswordCredential setData:](v3, "setData:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential creationDate](self, "creationDate"));
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  -[KCSharingPBInternetPasswordCredential setCreationDate:](v3, "setCreationDate:");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential modificationDate](self, "modificationDate"));
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  -[KCSharingPBInternetPasswordCredential setModificationDate:](v3, "setModificationDate:");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential comment](self, "comment"));
  -[KCSharingPBInternetPasswordCredential setComment:](v3, "setComment:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential label](self, "label"));
  -[KCSharingPBInternetPasswordCredential setLabel:](v3, "setLabel:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessibility](self, "accessibility"));
  -[KCSharingPBInternetPasswordCredential setAccessibility:](v3, "setAccessibility:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential viewHint](self, "viewHint"));
  -[KCSharingPBInternetPasswordCredential setViewHint:](v3, "setViewHint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential securityDomain](self, "securityDomain"));
  -[KCSharingPBInternetPasswordCredential setSecurityDomain:](v3, "setSecurityDomain:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential notes](self, "notes"));
  -[KCSharingPBInternetPasswordCredential setNotes:](v3, "setNotes:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential history](self, "history"));
  -[KCSharingPBInternetPasswordCredential setHistory:](v3, "setHistory:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined0](self, "clientDefined0"));
  -[KCSharingPBInternetPasswordCredential setClientDefined0:](v3, "setClientDefined0:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined1](self, "clientDefined1"));
  -[KCSharingPBInternetPasswordCredential setClientDefined1:](v3, "setClientDefined1:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined2](self, "clientDefined2"));
  -[KCSharingPBInternetPasswordCredential setClientDefined2:](v3, "setClientDefined2:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined3](self, "clientDefined3"));
  -[KCSharingPBInternetPasswordCredential setClientDefined3:](v3, "setClientDefined3:", v24);

  return v3;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[14];
  _QWORD v32[14];

  v31[0] = kSecAttrSharingGroup;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential sharingGroup](self, "sharingGroup", a3, a4));
  v32[0] = v30;
  v31[1] = kSecAttrAccount;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential account](self, "account"));
  v32[1] = v29;
  v31[2] = kSecAttrProtocol;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential protocol](self, "protocol"));
  v32[2] = v28;
  v31[3] = kSecAttrServer;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential server](self, "server"));
  v32[3] = v27;
  v31[4] = kSecAttrPort;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential port](self, "port"));
  v32[4] = v26;
  v31[5] = kSecAttrPath;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential path](self, "path"));
  v32[5] = v25;
  v31[6] = kSecAttrAuthenticationType;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential authenticationType](self, "authenticationType"));
  v32[6] = v5;
  v31[7] = kSecValueData;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential data](self, "data"));
  v32[7] = v6;
  v31[8] = kSecAttrCreationDate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential creationDate](self, "creationDate"));
  v32[8] = v7;
  v31[9] = kSecAttrModificationDate;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential modificationDate](self, "modificationDate"));
  v32[9] = v8;
  v31[10] = kSecAttrSecurityDomain;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential securityDomain](self, "securityDomain"));
  v32[10] = v9;
  v32[11] = &__kCFBooleanFalse;
  v31[11] = kSecAttrSynchronizable;
  v31[12] = kSecAttrAccessible;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessibility](self, "accessibility"));
  v32[12] = v10;
  v31[13] = kSecAttrAccessGroup;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential accessGroup](self, "accessGroup"));
  v32[13] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 14));
  v13 = objc_msgSend(v12, "mutableCopy");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential comment](self, "comment"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, kSecAttrComment);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential label](self, "label"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, kSecAttrLabel);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential viewHint](self, "viewHint"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, kSecAttrSyncViewHint);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential notes](self, "notes"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, kSecDataInetExtraNotes);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential history](self, "history"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, kSecDataInetExtraHistory);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined0](self, "clientDefined0"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, kSecDataInetExtraClientDefined0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined1](self, "clientDefined1"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, kSecDataInetExtraClientDefined1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined2](self, "clientDefined2"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, kSecDataInetExtraClientDefined2);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential clientDefined3](self, "clientDefined3"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, kSecDataInetExtraClientDefined3);

  v23 = objc_msgSend(v13, "copy");
  return v23;
}

- (NSString)sharingGroup
{
  return self->_sharingGroup;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (NSString)account
{
  return self->_account;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSString)server
{
  return self->_server;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (NSData)data
{
  return self->_data;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)accessibility
{
  return self->_accessibility;
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (NSString)securityDomain
{
  return self->_securityDomain;
}

- (NSData)notes
{
  return self->_notes;
}

- (NSData)history
{
  return self->_history;
}

- (NSData)clientDefined0
{
  return self->_clientDefined0;
}

- (NSData)clientDefined1
{
  return self->_clientDefined1;
}

- (NSData)clientDefined2
{
  return self->_clientDefined2;
}

- (NSData)clientDefined3
{
  return self->_clientDefined3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDefined3, 0);
  objc_storeStrong((id *)&self->_clientDefined2, 0);
  objc_storeStrong((id *)&self->_clientDefined1, 0);
  objc_storeStrong((id *)&self->_clientDefined0, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_viewHint, 0);
  objc_storeStrong((id *)&self->_accessibility, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_sharingGroup, 0);
}

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_1000119B8((uint64_t)CFSTR("inet"), &qword_100341250, (uint64_t)&unk_100341248);
}

+ (NSSet)requiredAttributeKeys
{
  if (qword_100341490 != -1)
    dispatch_once(&qword_100341490, &stru_1002EAB00);
  return (NSSet *)(id)qword_100341488;
}

@end
