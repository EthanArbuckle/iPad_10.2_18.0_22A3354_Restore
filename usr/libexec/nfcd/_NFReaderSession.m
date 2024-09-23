@implementation _NFReaderSession

- (BOOL)isPRCIDSupported:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "NF_asHexString"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("F049442E43484E"));

  return v4;
}

- (BOOL)selectPRCIDApp:(id)a3 fromTag:(id)a4 resolvedAid:(id *)a5 outError:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  unsigned int v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  void *specific;
  uint64_t Logger;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  id *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  _QWORD *v55;
  _QWORD *v56;
  void *v57;
  uint64_t v58;
  void (*v59)(uint64_t, const char *, ...);
  objc_class *v60;
  _BOOL4 v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
  id v71;
  void *v72;
  void *v73;
  NSMutableArray *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  void *i;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  NSMutableArray *v86;
  id v87;
  NSMutableArray *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  double v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  id *v105;
  id v106;
  id v107;
  uint64_t v108;
  id v109;
  id v110;
  uint64_t v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  _QWORD *v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  const char *Name;
  const char *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  NSMutableArray *obj;
  void *v130;
  void *v131;
  id v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  id v137;
  void *v138;
  id v139;
  id *v140;
  const char *sel;
  id v142;
  int v143;
  unsigned __int8 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  id v153;
  _QWORD v154[4];
  _QWORD v155[4];
  _QWORD v156[5];
  _QWORD v157[5];
  _QWORD v158[5];
  _QWORD v159[5];
  _BYTE v160[128];
  _BYTE v161[128];
  _QWORD v162[4];
  _QWORD v163[2];
  id v164;
  NSMutableArray *v165;
  _QWORD v166[5];
  _QWORD v167[5];
  _QWORD v168[5];
  _QWORD v169[5];
  _QWORD v170[4];
  _QWORD v171[4];
  _QWORD v172[4];
  _QWORD v173[4];
  uint8_t buf[8];
  __int16 v175;
  const char *v176;
  __int16 v177;
  const char *v178;
  __int16 v179;
  int v180;

  v11 = a3;
  v12 = a4;
  if ((unint64_t)objc_msgSend(v11, "length") > 0xFF)
    goto LABEL_12;
  v13 = v12;
  if (objc_msgSend(v13, "type") != 5)
  {

    goto LABEL_12;
  }
  v140 = a6;
  sel = a2;
  *(_DWORD *)buf = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tagB"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pupi"));
  v16 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 4);
  v17 = objc_msgSend(v15, "isEqualToData:", v16);

  if (!v17)
  {
LABEL_12:
    v33 = 0;
    goto LABEL_13;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_asHexString"));
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("F049442E43484E"));

  if ((v19 & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v37 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(sel);
      v41 = 45;
      if (isMetaClass)
        v41 = 43;
      v37(3, "%c[%{public}s %{public}s]:%i Unexpected AID value", v41, ClassName, Name, 39);
    }
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger(v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    v45 = v140;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v46 = object_getClass(self);
      if (class_isMetaClass(v46))
        v47 = 43;
      else
        v47 = 45;
      v48 = object_getClassName(self);
      v49 = sel_getName(sel);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v47;
      v175 = 2082;
      v176 = v48;
      v177 = 2082;
      v178 = v49;
      v179 = 1024;
      v180 = 39;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected AID value", buf, 0x22u);
    }

    if (!v140)
      goto LABEL_12;
    v50 = objc_alloc((Class)NSError);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v172[0] = NSLocalizedDescriptionKey;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v173[0] = v52;
    v173[1] = &off_1002FF600;
    v172[1] = CFSTR("Line");
    v172[2] = CFSTR("Method");
    v53 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
    v173[2] = v53;
    v172[3] = NSDebugDescriptionErrorKey;
    v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 40);
    v173[3] = v54;
    v55 = v173;
    v56 = v172;
LABEL_36:
    v71 = v11;
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v56, 4));
    *v45 = objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 12, v72);

    v11 = v71;
    goto LABEL_12;
  }
  v139 = v12;
  if ((objc_opt_respondsToSelector(AppletTranslator, "getNFCSettings") & 1) == 0)
  {
    v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v58 = NFLogGetLogger(v57);
    if (v58)
    {
      v59 = (void (*)(uint64_t, const char *, ...))v58;
      v60 = object_getClass(self);
      v61 = class_isMetaClass(v60);
      v62 = object_getClassName(self);
      v125 = sel_getName(sel);
      v63 = 45;
      if (v61)
        v63 = 43;
      v59(3, "%c[%{public}s %{public}s]:%i Unable to read NFC settings from ATL", v63, v62, v125, 46);
    }
    v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = NFSharedLogGetLogger(v64);
    v66 = objc_claimAutoreleasedReturnValue(v65);
    v45 = v140;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v67 = object_getClass(self);
      if (class_isMetaClass(v67))
        v68 = 43;
      else
        v68 = 45;
      v69 = object_getClassName(self);
      v70 = sel_getName(sel);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v68;
      v175 = 2082;
      v176 = v69;
      v177 = 2082;
      v178 = v70;
      v179 = 1024;
      v180 = 46;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to read NFC settings from ATL", buf, 0x22u);
    }

    if (!v140)
      goto LABEL_12;
    v50 = objc_alloc((Class)NSError);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v170[0] = NSLocalizedDescriptionKey;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v171[0] = v52;
    v171[1] = &off_1002FF618;
    v170[1] = CFSTR("Line");
    v170[2] = CFSTR("Method");
    v53 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
    v171[2] = v53;
    v170[3] = NSDebugDescriptionErrorKey;
    v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 47);
    v171[3] = v54;
    v55 = v171;
    v56 = v170;
    goto LABEL_36;
  }
  LOBYTE(v175) = 8;
  *(_QWORD *)buf = 0x10800000000001DLL;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
  v21 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
  objc_msgSend(v22, "sessionTimeLimit");
  v153 = 0;
  v24 = sub_1001847DC(v20, v21, v13, &v153, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = v153;

  if (!v26)
  {
    if (!objc_msgSend(v25, "length"))
    {
      if (v140)
      {
        v101 = objc_alloc((Class)NSError);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v162[0] = NSLocalizedDescriptionKey;
        v86 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
        v163[0] = v86;
        v163[1] = &off_1002FF660;
        v162[1] = CFSTR("Line");
        v162[2] = CFSTR("Method");
        v164 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
        v162[3] = NSDebugDescriptionErrorKey;
        v90 = v164;
        v88 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 68);
        v165 = v88;
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v163, v162, 4));
        *v140 = objc_msgSend(v101, "initWithDomain:code:userInfo:", v30, 29, v102);

        v26 = 0;
        v33 = 0;
        v12 = v139;
        goto LABEL_89;
      }
      v26 = 0;
      v33 = 0;
      goto LABEL_90;
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[AppletTranslator getNFCSettings](AppletTranslator, "getNFCSettings"));
    v74 = objc_opt_new(NSMutableArray);
    v127 = v73;
    v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("PRCID_SELECT_APP_LIST")));
    v128 = (void *)v75;
    if (v75
      && (v76 = (void *)v75, v77 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v76, v77) & 1) != 0))
    {
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      v78 = v76;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
      if (v79)
      {
        v80 = v79;
        v134 = v11;
        v81 = *(_QWORD *)v150;
        do
        {
          for (i = 0; i != v80; i = (char *)i + 1)
          {
            if (*(_QWORD *)v150 != v81)
              objc_enumerationMutation(v78);
            v83 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)i);
            v84 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v83, v84) & 1) != 0)
            {
              v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v83));
              -[NSMutableArray addObject:](v74, "addObject:", v85);

            }
          }
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
        }
        while (v80);
        v12 = v139;
        v11 = v134;
      }
    }
    else
    {
      v78 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A488, 2);
      -[NSMutableArray addObject:](v74, "addObject:", v78);
    }

    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v88 = v74;
    v132 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v88, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
    if (!v132)
      goto LABEL_63;
    v135 = *(_QWORD *)v146;
    obj = v88;
LABEL_55:
    v91 = 0;
    v92 = v25;
    v93 = v11;
    while (1)
    {
      if (*(_QWORD *)v146 != v135)
        objc_enumerationMutation(obj);
      v11 = *(id *)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)v91);

      v143 = 41984;
      v144 = objc_msgSend(v11, "length");
      v94 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &v143, 5);
      objc_msgSend(v94, "appendData:", v11);
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
      objc_msgSend(v96, "sessionTimeLimit");
      v142 = 0;
      v138 = v94;
      v98 = sub_1001847DC(v95, v94, v13, &v142, v97);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v98);
      v26 = v142;

      if (v26)
        break;
      if (!objc_msgSend(v25, "length"))
      {
        v12 = v139;
        v105 = v140;
        if (v140)
        {
          v109 = 0;
          v131 = v25;
          v136 = v11;
          v110 = objc_alloc((Class)NSError);
          v111 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v154[0] = NSLocalizedDescriptionKey;
          v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
          v155[0] = v112;
          v155[1] = &off_1002FF6A8;
          v154[1] = CFSTR("Line");
          v154[2] = CFSTR("Method");
          v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
          v155[2] = v113;
          v154[3] = NSDebugDescriptionErrorKey;
          v114 = (void *)v111;
          v115 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 106);
          v155[3] = v115;
          v116 = v155;
          v117 = v154;
          v118 = 4;
          goto LABEL_81;
        }
        v26 = 0;
LABEL_83:
        v30 = v127;
        goto LABEL_87;
      }
      v99 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v25));
      v12 = v139;
      if (objc_msgSend(v99, "status") == 36864)
      {
        if (a5)
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", CFSTR("F049442E43484E")));

        v26 = 0;
        v33 = 1;
        v88 = obj;
        goto LABEL_78;
      }

      v91 = (char *)v91 + 1;
      v92 = v25;
      v100 = v25;
      v93 = v11;
      if (v132 == v91)
      {
        v88 = obj;
        v25 = v100;
        v132 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
        if (v132)
          goto LABEL_55;
LABEL_63:

        v26 = 0;
        v11 = 0;
        v33 = 0;
LABEL_78:
        v86 = v88;
        v30 = v127;
LABEL_88:
        v90 = v128;
LABEL_89:

        goto LABEL_90;
      }
    }
    if (objc_msgSend(v26, "code") == (id)64)
    {
      v12 = v139;
      v105 = v140;
      if (!v140)
        goto LABEL_83;
      v136 = v11;
      v106 = objc_alloc((Class)NSError);
      v133 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v107 = objc_msgSend(v26, "code");
      v158[0] = NSLocalizedDescriptionKey;
      v131 = v25;
      v126 = (uint64_t)v107;
      if ((uint64_t)objc_msgSend(v26, "code") > 70)
        v108 = 71;
      else
        v108 = (uint64_t)objc_msgSend(v26, "code");
      v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E8788[v108]));
      v159[0] = v112;
      v159[1] = v26;
      v109 = v26;
      v158[1] = NSUnderlyingErrorKey;
      v158[2] = CFSTR("Line");
      v159[2] = &off_1002FF678;
      v158[3] = CFSTR("Method");
      v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
      v159[3] = v113;
      v158[4] = NSDebugDescriptionErrorKey;
      v115 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 100);
      v159[4] = v115;
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v159, v158, 5));
      v121 = v106;
      v114 = (void *)v133;
      v122 = (void *)v133;
      v123 = v126;
    }
    else
    {
      v12 = v139;
      v105 = v140;
      if (!v140)
        goto LABEL_83;
      v131 = v25;
      v136 = v11;
      v110 = objc_alloc((Class)NSError);
      v119 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v156[0] = NSLocalizedDescriptionKey;
      v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v157[0] = v112;
      v157[1] = v26;
      v109 = v26;
      v156[1] = NSUnderlyingErrorKey;
      v156[2] = CFSTR("Line");
      v157[2] = &off_1002FF690;
      v156[3] = CFSTR("Method");
      v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
      v157[3] = v113;
      v156[4] = NSDebugDescriptionErrorKey;
      v114 = (void *)v119;
      v115 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 102);
      v157[4] = v115;
      v116 = v157;
      v117 = v156;
      v118 = 5;
LABEL_81:
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v116, v117, v118));
      v121 = v110;
      v122 = v114;
      v123 = 29;
    }
    *v105 = objc_msgSend(v121, "initWithDomain:code:userInfo:", v122, v123, v120);

    v11 = v136;
    v25 = v131;
    v30 = v127;
    v26 = v109;
LABEL_87:

    v33 = 0;
    v88 = obj;
    v86 = obj;
    goto LABEL_88;
  }
  if (v140)
  {
    v130 = v25;
    v27 = v26;
    v28 = objc_msgSend(v26, "code");
    v29 = objc_alloc((Class)NSError);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    if (v28 == (id)64)
    {
      v137 = objc_msgSend(v27, "code");
      v168[0] = NSLocalizedDescriptionKey;
      v31 = v29;
      if ((uint64_t)objc_msgSend(v27, "code") > 70)
        v32 = 71;
      else
        v32 = (uint64_t)objc_msgSend(v27, "code");
      v86 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E8788[v32]));
      v169[0] = v86;
      v169[1] = v27;
      v168[1] = NSUnderlyingErrorKey;
      v168[2] = CFSTR("Line");
      v169[2] = &off_1002FF630;
      v168[3] = CFSTR("Method");
      v103 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
      v169[3] = v103;
      v168[4] = NSDebugDescriptionErrorKey;
      v88 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 63);
      v169[4] = v88;
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v169, v168, 5));
      *v140 = objc_msgSend(v31, "initWithDomain:code:userInfo:", v30, v137, v104);
      v90 = v103;

      v26 = v27;
      v33 = 0;
      v25 = v130;
    }
    else
    {
      v166[0] = NSLocalizedDescriptionKey;
      v86 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v167[0] = v86;
      v167[1] = v27;
      v166[1] = NSUnderlyingErrorKey;
      v166[2] = CFSTR("Line");
      v167[2] = &off_1002FF648;
      v166[3] = CFSTR("Method");
      v87 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
      v167[3] = v87;
      v166[4] = NSDebugDescriptionErrorKey;
      v88 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 65);
      v167[4] = v88;
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v167, v166, 5));
      *v140 = objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 29, v89);
      v90 = v87;

      v33 = 0;
      v25 = v130;
      v26 = v27;
    }
    goto LABEL_89;
  }
  v33 = 0;
LABEL_90:

LABEL_13:
  return v33;
}

- (BOOL)activateTag:(id)a3 outError:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];

  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &qword_10026A47F, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
  objc_msgSend(v10, "sessionTimeLimit");
  v33 = 0;
  v12 = sub_1001847DC(v9, v8, v7, &v33, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = v33;
  if (v14)
  {
    if (a4)
    {
      v15 = objc_msgSend(v14, "code");
      v16 = objc_alloc((Class)NSError);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v15 == (id)64)
      {
        v32 = objc_msgSend(v14, "code");
        v40[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)objc_msgSend(v14, "code") > 70)
          v18 = 71;
        else
          v18 = (uint64_t)objc_msgSend(v14, "code");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E8788[v18]));
        v41[0] = v21;
        v41[1] = v14;
        v40[1] = NSUnderlyingErrorKey;
        v40[2] = CFSTR("Line");
        v41[2] = &off_1002FF6C0;
        v40[3] = CFSTR("Method");
        v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v41[3] = v22;
        v40[4] = NSDebugDescriptionErrorKey;
        v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 138);
        v41[4] = v23;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 5));
        v28 = v16;
        v29 = v17;
        v30 = (uint64_t)v32;
        goto LABEL_17;
      }
      v38[0] = NSLocalizedDescriptionKey;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v39[0] = v21;
      v39[1] = v14;
      v38[1] = NSUnderlyingErrorKey;
      v38[2] = CFSTR("Line");
      v39[2] = &off_1002FF6D8;
      v38[3] = CFSTR("Method");
      v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v39[3] = v22;
      v38[4] = NSDebugDescriptionErrorKey;
      v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 140);
      v39[4] = v23;
      v24 = v39;
      v25 = v38;
      v26 = 5;
LABEL_14:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v25, v26));
      v28 = v16;
      v29 = v17;
      v30 = 29;
LABEL_17:
      *a4 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, v30, v27);

    }
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v13, "length"))
  {
    if (!a4)
      goto LABEL_18;
    v16 = objc_alloc((Class)NSError);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v36[0] = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
    v37[0] = v21;
    v37[1] = &off_1002FF6F0;
    v36[1] = CFSTR("Line");
    v36[2] = CFSTR("Method");
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v37[2] = v22;
    v36[3] = NSDebugDescriptionErrorKey;
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 143);
    v37[3] = v23;
    v24 = v37;
    v25 = v36;
LABEL_13:
    v26 = 4;
    goto LABEL_14;
  }
  v19 = *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
  v20 = v19 == 8;
  if (a4 && v19 != 8)
  {
    v16 = objc_alloc((Class)NSError);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v34[0] = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
    v35[0] = v21;
    v35[1] = &off_1002FF708;
    v34[1] = CFSTR("Line");
    v34[2] = CFSTR("Method");
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v35[2] = v22;
    v34[3] = NSDebugDescriptionErrorKey;
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 152);
    v35[3] = v23;
    v24 = v35;
    v25 = v34;
    goto LABEL_13;
  }
LABEL_19:

  return v20;
}

- (id)getPermissible7816AppsFromInfoPlist:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _UNKNOWN **v9;
  uint64_t v10;
  __objc2_class *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *specific;
  uint64_t Logger;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  objc_class *v43;
  int v44;
  const char *v45;
  const char *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  int v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void (*v67)(uint64_t, const char *, ...);
  objc_class *v68;
  _BOOL4 v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  objc_class *v74;
  int v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void (*v82)(uint64_t, const char *, ...);
  objc_class *v83;
  _BOOL4 v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  objc_class *v89;
  int v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void (*v97)(uint64_t, const char *, ...);
  objc_class *v98;
  _BOOL4 v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  NSObject *v103;
  objc_class *v104;
  int v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  unsigned int v110;
  void *v111;
  uint64_t v112;
  void (*v113)(uint64_t, const char *, ...);
  objc_class *v114;
  _BOOL4 v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  NSObject *v119;
  objc_class *v120;
  int v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  objc_class *v126;
  _BOOL4 v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  NSObject *v132;
  objc_class *v133;
  int v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  const char *v141;
  const char *ClassName;
  const char *v143;
  const char *v144;
  const char *v145;
  const char *v146;
  const char *v147;
  const char *v148;
  const char *v149;
  const char *Name;
  const char *v151;
  const char *v152;
  const char *v153;
  const char *v154;
  const char *v155;
  const char *v156;
  void *v157;
  NSMutableArray *v158;
  id obj;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint8_t v165[128];
  uint8_t buf[4];
  int v167;
  __int16 v168;
  const char *v169;
  __int16 v170;
  const char *v171;
  __int16 v172;
  int v173;
  __int16 v174;
  NSObject *v175;

  v4 = a3;
  v158 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("com.apple.developer.nfc.readersession.iso7816.select-identifiers")));
  if (v5)
  {
    v6 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v157 = v5;
      v161 = 0u;
      v162 = 0u;
      v163 = 0u;
      v164 = 0u;
      obj = v5;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v165, 16);
      if (!v7)
        goto LABEL_115;
      v8 = v7;
      v9 = &AMFDRSealingMapCopyLocalData_ptr;
      v10 = *(_QWORD *)v162;
      v11 = NFTagAppLauncher;
      while (1)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v162 != v10)
            objc_enumerationMutation(obj);
          v13 = *(NSObject **)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_class(v9[267]);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v37 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v40 = 45;
              if (isMetaClass)
                v40 = 43;
              v37(5, "%c[%{public}s %{public}s]:%i Invalid identifier type: %{public}@", v40, ClassName, Name, 78, v13);
            }
            v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v42 = NFSharedLogGetLogger(v41);
            v16 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v43 = object_getClass(self);
              if (class_isMetaClass(v43))
                v44 = 43;
              else
                v44 = 45;
              v45 = object_getClassName(self);
              v46 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v167 = v44;
              v168 = 2082;
              v169 = v45;
              v170 = 2082;
              v171 = v46;
              v172 = 1024;
              v173 = 78;
              v174 = 2114;
              v175 = v13;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid identifier type: %{public}@", buf, 0x2Cu);
            }
            goto LABEL_99;
          }
          v15 = v13;
          v16 = v15;
          if (self)
          {
            v17 = NFSharedSignpostLog(v15);
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_signpost_enabled(v18))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", ", buf, 2u);
            }

            if ((char *)-[NSObject lengthOfBytesUsingEncoding:](v16, "lengthOfBytesUsingEncoding:", 4) - 33 <= (char *)0xFFFFFFFFFFFFFFDFLL)
            {
              v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v20 = NFLogGetLogger(v19);
              if (v20)
              {
                v21 = (void (*)(uint64_t, const char *, ...))v20;
                v22 = object_getClass(self);
                v23 = class_isMetaClass(v22);
                v141 = object_getClassName(self);
                v149 = sel_getName("_validateInfoPlistSelectIdentifier:");
                v24 = 45;
                if (v23)
                  v24 = 43;
                v21(5, "%c[%{public}s %{public}s]:%i Invalid AID length: %{public}@", v24, v141, v149, 164, v16);
              }
              v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v26 = NFSharedLogGetLogger(v25);
              v27 = objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v28 = object_getClass(self);
                if (class_isMetaClass(v28))
                  v29 = 43;
                else
                  v29 = 45;
                v30 = object_getClassName(self);
                v31 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                v167 = v29;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v168 = 2082;
                v169 = v30;
                v170 = 2082;
                v171 = v31;
                v172 = 1024;
                v173 = 164;
                v174 = 2114;
                v175 = v16;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid AID length: %{public}@", buf, 0x2Cu);
              }

              v33 = NFSharedSignpostLog(v32);
              v34 = objc_claimAutoreleasedReturnValue(v33);
              if (os_signpost_enabled(v34))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", ", buf, 2u);
              }
              goto LABEL_98;
            }
            v47 = objc_claimAutoreleasedReturnValue(-[NSObject uppercaseString](v16, "uppercaseString"));

            if (objc_msgSend(&v11[19], "findAID:filterType:", v47, 3))
            {
              v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v49 = NFLogGetLogger(v48);
              if (v49)
              {
                v50 = (void (*)(uint64_t, const char *, ...))v49;
                v51 = object_getClass(self);
                v52 = class_isMetaClass(v51);
                v143 = object_getClassName(self);
                v151 = sel_getName("_validateInfoPlistSelectIdentifier:");
                v53 = 45;
                if (v52)
                  v53 = 43;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v50(5, "%c[%{public}s %{public}s]:%i PACE app identifier: %{public}@", v53, v143, v151, 174, v47);
              }
              v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v55 = NFSharedLogGetLogger(v54);
              v56 = objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                v57 = object_getClass(self);
                if (class_isMetaClass(v57))
                  v58 = 43;
                else
                  v58 = 45;
                v59 = object_getClassName(self);
                v60 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                v167 = v58;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v168 = 2082;
                v169 = v59;
                v170 = 2082;
                v171 = v60;
                v172 = 1024;
                v173 = 174;
                v174 = 2114;
                v175 = v47;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE app identifier: %{public}@", buf, 0x2Cu);
              }

              v62 = NFSharedSignpostLog(v61);
              v63 = objc_claimAutoreleasedReturnValue(v62);
              if (os_signpost_enabled(v63))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", ", buf, 2u);
              }
              v64 = 2;
LABEL_59:

              if (!-[_NFReaderSession _isAIDStringValid:](self, "_isAIDStringValid:", v16))
                goto LABEL_100;
              v16 = objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v16));
              v34 = objc_claimAutoreleasedReturnValue(+[NF7816App appWithAid:type:](NF7816App, "appWithAid:type:", v16, v64));
              -[NSMutableArray addObject:](v158, "addObject:", v34);
              goto LABEL_98;
            }
            if (objc_msgSend(&v11[19], "findAID:filterType:", v47, 4))
            {
              v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v66 = NFLogGetLogger(v65);
              if (v66)
              {
                v67 = (void (*)(uint64_t, const char *, ...))v66;
                v68 = object_getClass(self);
                v69 = class_isMetaClass(v68);
                v144 = object_getClassName(self);
                v152 = sel_getName("_validateInfoPlistSelectIdentifier:");
                v70 = 45;
                if (v69)
                  v70 = 43;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v67(5, "%c[%{public}s %{public}s]:%i PRCID app identifier: %{public}@", v70, v144, v152, 181, v47);
              }
              v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v72 = NFSharedLogGetLogger(v71);
              v73 = objc_claimAutoreleasedReturnValue(v72);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                v74 = object_getClass(self);
                if (class_isMetaClass(v74))
                  v75 = 43;
                else
                  v75 = 45;
                v76 = object_getClassName(self);
                v77 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                v167 = v75;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v168 = 2082;
                v169 = v76;
                v170 = 2082;
                v171 = v77;
                v172 = 1024;
                v173 = 181;
                v174 = 2114;
                v175 = v47;
                _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PRCID app identifier: %{public}@", buf, 0x2Cu);
              }

              v79 = NFSharedSignpostLog(v78);
              v63 = objc_claimAutoreleasedReturnValue(v79);
              if (os_signpost_enabled(v63))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", ", buf, 2u);
              }
              v64 = 3;
              goto LABEL_59;
            }
            if (objc_msgSend(&v11[19], "findAID:filterType:", v47, 0))
            {
              v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v81 = NFLogGetLogger(v80);
              if (v81)
              {
                v82 = (void (*)(uint64_t, const char *, ...))v81;
                v83 = object_getClass(self);
                v84 = class_isMetaClass(v83);
                v145 = object_getClassName(self);
                v153 = sel_getName("_validateInfoPlistSelectIdentifier:");
                v85 = 45;
                if (v84)
                  v85 = 43;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v82(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v85, v145, v153, 188, v47);
              }
              v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v87 = NFSharedLogGetLogger(v86);
              v88 = objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              {
                v89 = object_getClass(self);
                if (class_isMetaClass(v89))
                  v90 = 43;
                else
                  v90 = 45;
                v91 = object_getClassName(self);
                v92 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                v167 = v90;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v168 = 2082;
                v169 = v91;
                v170 = 2082;
                v171 = v92;
                v172 = 1024;
                v173 = 188;
                v174 = 2114;
                v175 = v47;
                _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
              }

              v94 = NFSharedSignpostLog(v93);
              v34 = objc_claimAutoreleasedReturnValue(v94);
              if (os_signpost_enabled(v34))
                goto LABEL_96;
LABEL_97:
              v16 = v47;
LABEL_98:

              goto LABEL_99;
            }
            if (objc_msgSend(&v11[19], "findAID:filterType:", v47, 1))
            {
              v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v96 = NFLogGetLogger(v95);
              if (v96)
              {
                v97 = (void (*)(uint64_t, const char *, ...))v96;
                v98 = object_getClass(self);
                v99 = class_isMetaClass(v98);
                v146 = object_getClassName(self);
                v154 = sel_getName("_validateInfoPlistSelectIdentifier:");
                v100 = 45;
                if (v99)
                  v100 = 43;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v97(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v100, v146, v154, 194, v47);
              }
              v101 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v102 = NFSharedLogGetLogger(v101);
              v103 = objc_claimAutoreleasedReturnValue(v102);
              if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
              {
                v104 = object_getClass(self);
                if (class_isMetaClass(v104))
                  v105 = 43;
                else
                  v105 = 45;
                v106 = object_getClassName(self);
                v107 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                v167 = v105;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v168 = 2082;
                v169 = v106;
                v170 = 2082;
                v171 = v107;
                v172 = 1024;
                v173 = 194;
                v174 = 2114;
                v175 = v47;
                _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
              }

              v109 = NFSharedSignpostLog(v108);
              v34 = objc_claimAutoreleasedReturnValue(v109);
              if (!os_signpost_enabled(v34))
                goto LABEL_97;
            }
            else
            {
              v110 = objc_msgSend(&v11[19], "findAID:filterType:", v47, 2);
              v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v112 = NFLogGetLogger(v111);
              v113 = (void (*)(uint64_t, const char *, ...))v112;
              if (!v110)
              {
                if (v112)
                {
                  v126 = object_getClass(self);
                  v127 = class_isMetaClass(v126);
                  v128 = object_getClassName(self);
                  v156 = sel_getName("_validateInfoPlistSelectIdentifier:");
                  v129 = 45;
                  if (v127)
                    v129 = 43;
                  v148 = v128;
                  v9 = &AMFDRSealingMapCopyLocalData_ptr;
                  v113(5, "%c[%{public}s %{public}s]:%i Regular", v129, v148, v156, 207);
                }
                v130 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v131 = NFSharedLogGetLogger(v130);
                v132 = objc_claimAutoreleasedReturnValue(v131);
                if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                {
                  v133 = object_getClass(self);
                  if (class_isMetaClass(v133))
                    v134 = 43;
                  else
                    v134 = 45;
                  v135 = object_getClassName(self);
                  v136 = sel_getName("_validateInfoPlistSelectIdentifier:");
                  *(_DWORD *)buf = 67109890;
                  v167 = v134;
                  v9 = &AMFDRSealingMapCopyLocalData_ptr;
                  v168 = 2082;
                  v169 = v135;
                  v170 = 2082;
                  v171 = v136;
                  v172 = 1024;
                  v173 = 207;
                  _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Regular", buf, 0x22u);
                }

                v138 = NFSharedSignpostLog(v137);
                v63 = objc_claimAutoreleasedReturnValue(v138);
                if (os_signpost_enabled(v63))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", ", buf, 2u);
                }
                v64 = 1;
                goto LABEL_59;
              }
              if (v112)
              {
                v114 = object_getClass(self);
                v115 = class_isMetaClass(v114);
                v147 = object_getClassName(self);
                v155 = sel_getName("_validateInfoPlistSelectIdentifier:");
                v116 = 45;
                if (v115)
                  v116 = 43;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v113(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v116, v147, v155, 201, v47);
              }
              v117 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v118 = NFSharedLogGetLogger(v117);
              v119 = objc_claimAutoreleasedReturnValue(v118);
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                v120 = object_getClass(self);
                if (class_isMetaClass(v120))
                  v121 = 43;
                else
                  v121 = 45;
                v122 = object_getClassName(self);
                v123 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                v167 = v121;
                v9 = &AMFDRSealingMapCopyLocalData_ptr;
                v168 = 2082;
                v169 = v122;
                v170 = 2082;
                v171 = v123;
                v172 = 1024;
                v173 = 201;
                v174 = 2114;
                v175 = v47;
                _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
              }

              v125 = NFSharedSignpostLog(v124);
              v34 = objc_claimAutoreleasedReturnValue(v125);
              if (!os_signpost_enabled(v34))
                goto LABEL_97;
            }
LABEL_96:
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", ", buf, 2u);
            goto LABEL_97;
          }
LABEL_99:

LABEL_100:
          v12 = (char *)v12 + 1;
          v11 = NFTagAppLauncher;
        }
        while (v8 != v12);
        v139 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v165, 16);
        v8 = v139;
        if (!v139)
        {
LABEL_115:

          v5 = v157;
          break;
        }
      }
    }
  }

  return v158;
}

- (id)getPermissibleFelicaSystemCodeFromInfoPlist:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  void *specific;
  uint64_t Logger;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  id v54;
  const char *v56;
  const char *v57;
  const char *ClassName;
  const char *v59;
  const char *v60;
  const char *Name;
  void *v62;
  id v63;
  NSMutableArray *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  NSObject *v79;
  _BYTE v80[128];

  v5 = a3;
  v64 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.developer.nfc.readersession.felica.systemcodes")));
  v7 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v62 = v6;
    v63 = v5;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v67;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v67 != v10)
            objc_enumerationMutation(obj);
          v12 = *(NSObject **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v11);
          v13 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            v14 = v12;
            if ((-[NSObject length](v14, "length") & 1) == 0
              && -[NSObject length](v14, "length") == (id)4
              && -[NSObject compare:options:range:](v14, "compare:options:range:", CFSTR("FF"), 1, 0, 2)
              && -[NSObject compare:options:range:](v14, "compare:options:range:", CFSTR("FF"), 1, 2, 2))
            {
              v15 = objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v14));
              if (v15)
              {
                v16 = v15;
                -[NSMutableArray addObject:](v64, "addObject:", v15);
              }
              else
              {
                specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                Logger = NFLogGetLogger(specific);
                if (Logger)
                {
                  v43 = (void (*)(uint64_t, const char *, ...))Logger;
                  Class = object_getClass(self);
                  isMetaClass = class_isMetaClass(Class);
                  ClassName = object_getClassName(self);
                  Name = sel_getName(a2);
                  v46 = 45;
                  if (isMetaClass)
                    v46 = 43;
                  v43(3, "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@", v46, ClassName, Name, 120, 0);
                }
                v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v48 = NFSharedLogGetLogger(v47);
                v49 = objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  v50 = object_getClass(self);
                  if (class_isMetaClass(v50))
                    v51 = 43;
                  else
                    v51 = 45;
                  v52 = object_getClassName(self);
                  v53 = sel_getName(a2);
                  *(_DWORD *)buf = 67110146;
                  v71 = v51;
                  v72 = 2082;
                  v73 = v52;
                  v74 = 2082;
                  v75 = v53;
                  v76 = 1024;
                  v77 = 120;
                  v78 = 2114;
                  v79 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@", buf, 0x2Cu);
                }

                v16 = 0;
              }
            }
            else
            {
              v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v30 = NFLogGetLogger(v29);
              if (v30)
              {
                v31 = (void (*)(uint64_t, const char *, ...))v30;
                v32 = object_getClass(self);
                v33 = class_isMetaClass(v32);
                v57 = object_getClassName(self);
                v60 = sel_getName(a2);
                v34 = 45;
                if (v33)
                  v34 = 43;
                v31(3, "%c[%{public}s %{public}s]:%i Invalid system code entry: %{public}@", v34, v57, v60, 112, v14);
              }
              v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v36 = NFSharedLogGetLogger(v35);
              v16 = objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v37 = object_getClass(self);
                if (class_isMetaClass(v37))
                  v38 = 43;
                else
                  v38 = 45;
                v39 = object_getClassName(self);
                v40 = sel_getName(a2);
                *(_DWORD *)buf = 67110146;
                v71 = v38;
                v72 = 2082;
                v73 = v39;
                v74 = 2082;
                v75 = v40;
                v76 = 1024;
                v77 = 112;
                v78 = 2114;
                v79 = v14;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid system code entry: %{public}@", buf, 0x2Cu);
              }
            }

          }
          else
          {
            v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v18 = NFLogGetLogger(v17);
            if (v18)
            {
              v19 = (void (*)(uint64_t, const char *, ...))v18;
              v20 = object_getClass(self);
              v21 = class_isMetaClass(v20);
              v56 = object_getClassName(self);
              v59 = sel_getName(a2);
              v22 = 45;
              if (v21)
                v22 = 43;
              v19(5, "%c[%{public}s %{public}s]:%i Invalid identifier type: %{public}@", v22, v56, v59, 101, v12);
            }
            v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v24 = NFSharedLogGetLogger(v23);
            v14 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v25 = object_getClass(self);
              if (class_isMetaClass(v25))
                v26 = 43;
              else
                v26 = 45;
              v27 = object_getClassName(self);
              v28 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v71 = v26;
              v72 = 2082;
              v73 = v27;
              v74 = 2082;
              v75 = v28;
              v76 = 1024;
              v77 = 101;
              v78 = 2114;
              v79 = v12;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid identifier type: %{public}@", buf, 0x2Cu);
            }
          }

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        v9 = v54;
      }
      while (v54);
    }

    v6 = v62;
    v5 = v63;
  }

  return v64;
}

- (BOOL)_isAIDStringValid:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  int v29;
  unint64_t v30;
  unsigned __int8 v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  objc_class *v40;
  int v41;
  const char *ClassName;
  const char *v44;
  const char *v45;
  const char *Name;
  const char *v47;
  const char *v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  void *v58;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEF")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uppercaseString"));

  if ((unint64_t)objc_msgSend(v7, "length") <= 9)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(5, "%c[%{public}s %{public}s]:%i Identifier string does not meet the minimum required length, %{public}@", v13, ClassName, Name, 137, v7);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67110146;
    v50 = v18;
    v51 = 2082;
    v52 = object_getClassName(self);
    v53 = 2082;
    v54 = sel_getName(a2);
    v55 = 1024;
    v56 = 137;
    v57 = 2114;
    v58 = v7;
    v19 = "%c[%{public}s %{public}s]:%i Identifier string does not meet the minimum required length, %{public}@";
LABEL_36:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x2Cu);
LABEL_37:

    v31 = 0;
    goto LABEL_38;
  }
  if ((unint64_t)objc_msgSend(v7, "length") >= 0x21)
  {
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFLogGetLogger(v20);
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      v24 = class_isMetaClass(v23);
      v44 = object_getClassName(self);
      v47 = sel_getName(a2);
      v25 = 45;
      if (v24)
        v25 = 43;
      v22(5, "%c[%{public}s %{public}s]:%i Identifier string exceeds the maximum length, %{public}@", v25, v44, v47, 140, v7);
    }
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger(v26);
    v16 = objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    *(_DWORD *)buf = 67110146;
    v50 = v29;
    v51 = 2082;
    v52 = object_getClassName(self);
    v53 = 2082;
    v54 = sel_getName(a2);
    v55 = 1024;
    v56 = 140;
    v57 = 2114;
    v58 = v7;
    v19 = "%c[%{public}s %{public}s]:%i Identifier string exceeds the maximum length, %{public}@";
    goto LABEL_36;
  }
  if ((objc_msgSend(v7, "length") & 1) != 0)
  {
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFLogGetLogger(v32);
    if (v33)
    {
      v34 = (void (*)(uint64_t, const char *, ...))v33;
      v35 = object_getClass(self);
      v36 = class_isMetaClass(v35);
      v45 = object_getClassName(self);
      v48 = sel_getName(a2);
      v37 = 45;
      if (v36)
        v37 = 43;
      v34(5, "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@", v37, v45, v48, 143, v7);
    }
    v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v39 = NFSharedLogGetLogger(v38);
    v16 = objc_claimAutoreleasedReturnValue(v39);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v40 = object_getClass(self);
    if (class_isMetaClass(v40))
      v41 = 43;
    else
      v41 = 45;
    *(_DWORD *)buf = 67110146;
    v50 = v41;
    v51 = 2082;
    v52 = object_getClassName(self);
    v53 = 2082;
    v54 = sel_getName(a2);
    v55 = 1024;
    v56 = 143;
    v57 = 2114;
    v58 = v7;
    v19 = "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@";
    goto LABEL_36;
  }
  if (objc_msgSend(v7, "length"))
  {
    v30 = 0;
    do
    {
      v31 = objc_msgSend(v6, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", v30));
      if ((v31 & 1) == 0)
        break;
      ++v30;
    }
    while (v30 < (unint64_t)objc_msgSend(v7, "length"));
  }
  else
  {
    v31 = 1;
  }
LABEL_38:

  return v31;
}

- (int64_t)validateAID:(id)a3 allowsPrefixMatch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  int v45;
  void *specific;
  uint64_t Logger;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void *v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void (*v79)(uint64_t, const char *, ...);
  objc_class *v80;
  _BOOL4 v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  NSObject *v85;
  objc_class *v86;
  int v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  _BOOL8 v92;
  void *v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  objc_class *v96;
  _BOOL4 v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  NSObject *v101;
  objc_class *v102;
  int v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  int64_t v108;
  void *v109;
  uint64_t v110;
  void (*v111)(uint64_t, const char *, ...);
  objc_class *v112;
  _BOOL4 v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  NSObject *v117;
  objc_class *v118;
  int v119;
  const char *v120;
  const char *v121;
  uint64_t v123;
  const char *v124;
  const char *ClassName;
  const char *v126;
  const char *v127;
  const char *v128;
  const char *v129;
  const char *v130;
  const char *Name;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  id v136;
  _NFReaderSession *v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint8_t v143[128];
  uint8_t buf[4];
  int v145;
  __int16 v146;
  const char *v147;
  __int16 v148;
  const char *v149;
  __int16 v150;
  int v151;
  __int16 v152;
  void *v153;

  v4 = a4;
  v6 = a3;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession iso7816AppList](self, "iso7816AppList"));
  v8 = (int64_t)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v139, v143, 16);
  v138 = self;
  if (!v8)
  {
    v21 = 0;
    goto LABEL_18;
  }
  v9 = *(_QWORD *)v140;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v140 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aid"));
      v13 = objc_msgSend(v12, "isEqualToData:", v6);

      if (v13)
      {
        v8 = (int64_t)objc_msgSend(v11, "type");
        goto LABEL_15;
      }
      if (v4)
      {
        v14 = objc_msgSend(v6, "length");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aid"));
        v16 = objc_msgSend(v15, "length");

        if (v14 > v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aid"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 0, objc_msgSend(v17, "length")));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aid"));
          v20 = objc_msgSend(v19, "isEqualToData:", v18);

          if (!v20)
          {

            continue;
          }
          v8 = (int64_t)objc_msgSend(v11, "type");

LABEL_15:
          v21 = 1;
          goto LABEL_16;
        }
      }
    }
    v8 = (int64_t)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v139, v143, 16);
    if (v8)
      continue;
    break;
  }
  v21 = 0;
LABEL_16:
  self = v138;
LABEL_18:

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_asHexString"));
  if (!-[_NFReaderSession _isAIDStringValid:](self, "_isAIDStringValid:", v22))
  {
LABEL_105:
    v8 = 0;
    goto LABEL_106;
  }
  v23 = v22;
  v24 = v23;
  v136 = v23;
  if (!self)
  {

    if ((v21 & 1) == 0)
      goto LABEL_95;
    goto LABEL_106;
  }
  v25 = NFSharedSignpostLog(v23);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "isIdentifierPermissible", ", buf, 2u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uppercaseString"));
  if (!+[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v27, 3))
  {
    if (+[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v27, 4))
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v48 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v138);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v138);
        Name = sel_getName("_isIdentifierPermissible:");
        v51 = 45;
        if (isMetaClass)
          v51 = 43;
        v48(5, "%c[%{public}s %{public}s]:%i PRCID app identifier: %{public}@", v51, ClassName, Name, 226, v27);
      }
      v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v53 = NFSharedLogGetLogger(v52);
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = object_getClass(v138);
        if (class_isMetaClass(v55))
          v56 = 43;
        else
          v56 = 45;
        v57 = object_getClassName(v138);
        v58 = sel_getName("_isIdentifierPermissible:");
        *(_DWORD *)buf = 67110146;
        v145 = v56;
        v146 = 2082;
        v147 = v57;
        v148 = 2082;
        v149 = v58;
        v150 = 1024;
        v151 = 226;
        v152 = 2114;
        v153 = v27;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PRCID app identifier: %{public}@", buf, 0x2Cu);
      }

      v60 = NFSharedSignpostLog(v59);
      v43 = objc_claimAutoreleasedReturnValue(v60);
      if (os_signpost_enabled(v43))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "isIdentifierPermissible", ", buf, 2u);
      }
      v45 = 0;
      v61 = 1;
      v44 = 3;
      goto LABEL_88;
    }
    if (+[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v27, 0))
    {
      v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v63 = NFLogGetLogger(v62);
      if (v63)
      {
        v64 = (void (*)(uint64_t, const char *, ...))v63;
        v65 = object_getClass(v138);
        v66 = class_isMetaClass(v65);
        v126 = object_getClassName(v138);
        v132 = sel_getName("_isIdentifierPermissible:");
        v67 = 45;
        if (v66)
          v67 = 43;
        v64(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v67, v126, v132, 234, v27);
      }
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFSharedLogGetLogger(v68);
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = object_getClass(v138);
        if (class_isMetaClass(v71))
          v72 = 43;
        else
          v72 = 45;
        v73 = object_getClassName(v138);
        v74 = sel_getName("_isIdentifierPermissible:");
        *(_DWORD *)buf = 67110146;
        v145 = v72;
        v146 = 2082;
        v147 = v73;
        v148 = 2082;
        v149 = v74;
        v150 = 1024;
        v151 = 234;
        v152 = 2114;
        v153 = v27;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
      }

      v76 = NFSharedSignpostLog(v75);
      v43 = objc_claimAutoreleasedReturnValue(v76);
      if (os_signpost_enabled(v43))
      {
        *(_WORD *)buf = 0;
LABEL_85:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", ", buf, 2u);
      }
    }
    else
    {
      if (!+[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v27, 1))
      {
        v92 = +[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v27, 2);
        if (!v92)
        {
          v123 = NFSharedSignpostLog(v92);
          v43 = objc_claimAutoreleasedReturnValue(v123);
          if (os_signpost_enabled(v43))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "isIdentifierPermissible", ", buf, 2u);
          }
          v45 = 0;
          v61 = 0;
          v44 = 0;
          goto LABEL_88;
        }
        v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v94 = NFLogGetLogger(v93);
        if (v94)
        {
          v95 = (void (*)(uint64_t, const char *, ...))v94;
          v96 = object_getClass(v138);
          v97 = class_isMetaClass(v96);
          v128 = object_getClassName(v138);
          v134 = sel_getName("_isIdentifierPermissible:");
          v98 = 45;
          if (v97)
            v98 = 43;
          v95(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v98, v128, v134, 247, v27);
        }
        v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v100 = NFSharedLogGetLogger(v99);
        v101 = objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          v102 = object_getClass(v138);
          if (class_isMetaClass(v102))
            v103 = 43;
          else
            v103 = 45;
          v104 = object_getClassName(v138);
          v105 = sel_getName("_isIdentifierPermissible:");
          *(_DWORD *)buf = 67110146;
          v145 = v103;
          v146 = 2082;
          v147 = v104;
          v148 = 2082;
          v149 = v105;
          v150 = 1024;
          v151 = 247;
          v152 = 2114;
          v153 = v27;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
        }

        v107 = NFSharedSignpostLog(v106);
        v43 = objc_claimAutoreleasedReturnValue(v107);
        if (!os_signpost_enabled(v43))
          goto LABEL_86;
        *(_WORD *)buf = 0;
        goto LABEL_85;
      }
      v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v78 = NFLogGetLogger(v77);
      if (v78)
      {
        v79 = (void (*)(uint64_t, const char *, ...))v78;
        v80 = object_getClass(v138);
        v81 = class_isMetaClass(v80);
        v127 = object_getClassName(v138);
        v133 = sel_getName("_isIdentifierPermissible:");
        v82 = 45;
        if (v81)
          v82 = 43;
        v79(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v82, v127, v133, 240, v27);
      }
      v83 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v84 = NFSharedLogGetLogger(v83);
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = object_getClass(v138);
        if (class_isMetaClass(v86))
          v87 = 43;
        else
          v87 = 45;
        v88 = object_getClassName(v138);
        v89 = sel_getName("_isIdentifierPermissible:");
        *(_DWORD *)buf = 67110146;
        v145 = v87;
        v146 = 2082;
        v147 = v88;
        v148 = 2082;
        v149 = v89;
        v150 = 1024;
        v151 = 240;
        v152 = 2114;
        v153 = v27;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
      }

      v91 = NFSharedSignpostLog(v90);
      v43 = objc_claimAutoreleasedReturnValue(v91);
      if (os_signpost_enabled(v43))
      {
        *(_WORD *)buf = 0;
        goto LABEL_85;
      }
    }
LABEL_86:
    v45 = 1;
    v44 = 4;
LABEL_87:
    v61 = 1;
    goto LABEL_88;
  }
  v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v29 = NFLogGetLogger(v28);
  if (v29)
  {
    v30 = (void (*)(uint64_t, const char *, ...))v29;
    v31 = object_getClass(v138);
    v32 = class_isMetaClass(v31);
    v124 = object_getClassName(v138);
    v130 = sel_getName("_isIdentifierPermissible:");
    v33 = 45;
    if (v32)
      v33 = 43;
    v30(5, "%c[%{public}s %{public}s]:%i PACE app identifier: %{public}@", v33, v124, v130, 219, v27);
  }
  v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v35 = NFSharedLogGetLogger(v34);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = object_getClass(v138);
    if (class_isMetaClass(v37))
      v38 = 43;
    else
      v38 = 45;
    v39 = object_getClassName(v138);
    v40 = sel_getName("_isIdentifierPermissible:");
    *(_DWORD *)buf = 67110146;
    v145 = v38;
    v146 = 2082;
    v147 = v39;
    v148 = 2082;
    v149 = v40;
    v150 = 1024;
    v151 = 219;
    v152 = 2114;
    v153 = v27;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE app identifier: %{public}@", buf, 0x2Cu);
  }

  v42 = NFSharedSignpostLog(v41);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    v44 = 2;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "isIdentifierPermissible", ", buf, 2u);
    v45 = 0;
    goto LABEL_87;
  }
  v45 = 0;
  v61 = 1;
  v44 = 2;
LABEL_88:

  if (v21)
    v108 = v8;
  else
    v108 = v44;
  if (v45)
    v8 = 4;
  else
    v8 = v108;
  if (((v45 | (v61 | v21)) & 1) == 0)
  {
LABEL_95:
    v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v110 = NFLogGetLogger(v109);
    if (v110)
    {
      v111 = (void (*)(uint64_t, const char *, ...))v110;
      v112 = object_getClass(v138);
      v113 = class_isMetaClass(v112);
      v129 = object_getClassName(v138);
      v135 = sel_getName(a2);
      v114 = 45;
      if (v113)
        v114 = 43;
      v111(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v114, v129, v135, 298, v136);
    }
    v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v116 = NFSharedLogGetLogger(v115);
    v117 = objc_claimAutoreleasedReturnValue(v116);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      v118 = object_getClass(v138);
      if (class_isMetaClass(v118))
        v119 = 43;
      else
        v119 = 45;
      v120 = object_getClassName(v138);
      v121 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v145 = v119;
      v146 = 2082;
      v147 = v120;
      v148 = 2082;
      v149 = v121;
      v150 = 1024;
      v151 = 298;
      v152 = 2114;
      v153 = v136;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
    }

    goto LABEL_105;
  }
LABEL_106:

  return v8;
}

- (BOOL)validateSystemCode:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession feliCaSystemCodeList](self, "feliCaSystemCodeList"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)_getFCITemplate:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithData:](NFTLV, "TLVWithData:", a3));
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "tag") == 111)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (id)_getApplicationNameFromFciTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "childWithTag:", 132));
  v4 = v3;
  if (v3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value")),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)validateAID:(id)a3 withSelectResponse:(id)a4 outRealAid:(id *)a5
{
  id v9;
  id v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  BOOL v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;

  v9 = a3;
  v10 = a4;
  if ((unint64_t)objc_msgSend(v9, "length") > 4)
  {
    if ((unint64_t)objc_msgSend(v10, "length") >= 2)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v10));
      if (objc_msgSend(v23, "status") == 36864
        && (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "response")),
            v25 = objc_msgSend(v24, "length"),
            v24,
            v25))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "response"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getFCITemplate:](self, "_getFCITemplate:", v26));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getApplicationNameFromFciTemplate:](self, "_getApplicationNameFromFciTemplate:", v27));
        if (objc_msgSend(v28, "length"))
        {
          if (a5)
            *a5 = objc_retainAutorelease(v28);
          v22 = (-[_NFReaderSession validateAID:allowsPrefixMatch:](self, "validateAID:allowsPrefixMatch:", v28, 1) & 0xFFFFFFFFFFFFFFFBLL) != 0;
        }
        else
        {
          v22 = 1;
        }

      }
      else
      {
        v22 = 1;
      }

    }
    else
    {
      v22 = 1;
    }
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Incorrect length aid=%{public}@", v16, ClassName, Name, 331, v9);
    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      *(_DWORD *)buf = 67110146;
      v33 = v21;
      v34 = 2082;
      v35 = object_getClassName(self);
      v36 = 2082;
      v37 = sel_getName(a2);
      v38 = 1024;
      v39 = 331;
      v40 = 2114;
      v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Incorrect length aid=%{public}@", buf, 0x2Cu);
    }

    v22 = 0;
  }

  return v22;
}

- (_NFReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{

  return 0;
}

- (_NFReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 whitelist:(id)a5 serviceType:(unint64_t)a6 showSharingUI:(unint64_t)a7 coreNFCSessionType:(unint64_t)a8 scanText:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _NFReaderSession *v20;
  NFServiceWhitelistChecker *v21;
  NFServiceWhitelistChecker *tagWhiteList;
  void *v23;
  uint64_t v24;
  NSData *sessionUUID;
  void *v26;
  id v27;
  void *v28;
  NSMutableArray *v29;
  NSMutableArray *feliCaSystemCodeList;
  NSMutableArray *v31;
  NSMutableArray *nonstandard7816TagsFound;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  if (objc_msgSend(v17, "internalAccess"))
    v19 = objc_msgSend(v17, "allowBackgroundedSession");
  else
    v19 = 0;
  v34.receiver = self;
  v34.super_class = (Class)_NFReaderSession;
  v20 = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](&v34, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", v15, v16, 0, v19);
  if (v20)
  {
    v21 = (NFServiceWhitelistChecker *)objc_msgSend(v17, "copy");
    tagWhiteList = v20->_tagWhiteList;
    v20->_tagWhiteList = v21;

    v20->_uiStateOnInvalidation = 0;
    v20->_sharingUIMode = a7;
    objc_storeStrong((id *)&v20->_initialScanText, a9);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "generateUUID"));
    sessionUUID = v20->_sessionUUID;
    v20->_sessionUUID = (NSData *)v24;

    v20->_sessionType = a8;
    v20->_exitReason = 0;
    v20->_serviceType = a6;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getAppInfoDictionary"));
    -[_NFReaderSession _initialize7816AidList:](v20, "_initialize7816AidList:", v26);
    v27 = objc_alloc((Class)NSMutableArray);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession getPermissibleFelicaSystemCodeFromInfoPlist:](v20, "getPermissibleFelicaSystemCodeFromInfoPlist:", v26));
    v29 = (NSMutableArray *)objc_msgSend(v27, "initWithArray:", v28);
    feliCaSystemCodeList = v20->_feliCaSystemCodeList;
    v20->_feliCaSystemCodeList = v29;

    v31 = objc_opt_new(NSMutableArray);
    nonstandard7816TagsFound = v20->_nonstandard7816TagsFound;
    v20->_nonstandard7816TagsFound = v31;

    v20->_continuousWaveState = 0;
  }

  return v20;
}

- (void)_initialize7816AidList:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *iso7816AppList;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableOrderedSet);
  iso7816AppList = self->_iso7816AppList;
  self->_iso7816AppList = v5;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFServiceWhitelistChecker trustedISO7816AidList](self->_tagWhiteList, "trustedISO7816AidList", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (!-[_NFReaderSession isPRCIDSupported:](self, "isPRCIDSupported:", v12))
        {
          if (-[_NFReaderSession isPaceSupported:](self, "isPaceSupported:", v12))
            v13 = 2;
          else
            v13 = 1;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NF7816App appWithAid:type:](NF7816App, "appWithAid:type:", v12, v13));
          if (v14)
            -[NSMutableOrderedSet addObject:](self->_iso7816AppList, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession getPermissible7816AppsFromInfoPlist:](self, "getPermissible7816AppsFromInfoPlist:", v4));
  -[NSMutableOrderedSet addObjectsFromArray:](self->_iso7816AppList, "addObjectsFromArray:", v15);

}

- (BOOL)uiShown
{
  return self->_uiService != 0;
}

- (void)setUiInvalidationHandler:(id)a3
{
  id v4;
  id uiInvalidationHandler;

  v4 = objc_retainBlock(a3);
  uiInvalidationHandler = self->_uiInvalidationHandler;
  self->_uiInvalidationHandler = v4;

}

- (void)clearUIControllerInvalidationHandler
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  void *v20;
  id uiInvalidationHandler;
  NFUIService *uiService;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Clearing Invalidation Handler on session %@", v12, ClassName, Name, 179, v11);

  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    v18 = object_getClassName(self);
    v19 = sel_getName(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110146;
    v24 = v17;
    v25 = 2082;
    v26 = v18;
    v27 = 2082;
    v28 = v19;
    v29 = 1024;
    v30 = 179;
    v31 = 2112;
    v32 = v20;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Clearing Invalidation Handler on session %@", buf, 0x2Cu);

  }
  uiInvalidationHandler = self->_uiInvalidationHandler;
  self->_uiInvalidationHandler = 0;

  -[NFUIService coreNFCUISetInvalidationHandler:](self->_uiService, "coreNFCUISetInvalidationHandler:", 0);
  -[NFUIService disconnect](self->_uiService, "disconnect");
  uiService = self->_uiService;
  self->_uiService = 0;

  self->_uiControllerStarted = 0;
}

- (void)activateUIControllerWithCompletion:(id)a3
{
  id v5;
  _NFReaderSession *v6;
  void *v7;
  NFUIService *uiService;
  _NFReaderSession *v9;
  id v10;
  NFUIService *v11;
  _NFReaderSession *v12;
  _NFReaderSession *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  _NFReaderSession *v17;
  _NFReaderSession *v18;
  id v19;
  SEL v20;
  _QWORD v21[4];
  _NFReaderSession *v22;
  _NFReaderSession *v23;
  id v24;
  SEL v25;
  NSErrorUserInfoKey v26;
  _NFReaderSession *v27;

  v5 = a3;
  if (self->_uiService && self->_uiInvalidationHandler)
  {
    v6 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](v6, "remoteObject"));
    uiService = self->_uiService;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10019F4C8;
    v21[3] = &unk_1002EA828;
    v9 = v6;
    v22 = v9;
    v23 = v9;
    v24 = v7;
    v25 = a2;
    v10 = v7;
    -[NFUIService coreNFCUISetInvalidationHandler:](uiService, "coreNFCUISetInvalidationHandler:", v21);
    v11 = self->_uiService;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10019FD88;
    v16[3] = &unk_1002EA878;
    v20 = a2;
    v17 = v9;
    v18 = v9;
    v19 = v5;
    v12 = v9;
    -[NFUIService coreNFCUIActivateWithCompletion:](v11, "coreNFCUIActivateWithCompletion:", v16);

    v13 = v22;
  }
  else
  {
    v14 = objc_alloc((Class)NSError);
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v26 = NSLocalizedDescriptionKey;
    v12 = (_NFReaderSession *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v27 = v12;
    v13 = (_NFReaderSession *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v15 = objc_msgSend(v14, "initWithDomain:code:userInfo:", v10, 13, v13);
    (*((void (**)(id, id))v5 + 2))(v5, v15);

  }
}

- (BOOL)uiActivated
{
  return self->_uiInvalidationHandler && self->_uiControllerStarted && self->_uiService != 0;
}

- (NFServiceWhitelistChecker)whitelistChecker
{
  return self->_tagWhiteList;
}

- (BOOL)timeLimitedSession
{
  double v2;

  -[NFServiceWhitelistChecker sessionTimeLimit](self->_tagWhiteList, "sessionTimeLimit");
  return v2 > 0.0;
}

- (BOOL)willStartSession
{
  NFUIService *v3;
  NFUIService *uiService;
  void *v5;
  unint64_t sharingUIMode;
  NFUIService *v7;
  uint64_t v8;
  objc_super v10;

  sub_10023B69C((uint64_t)NFSecureElementWrapper);
  if (self->_sharingUIMode)
  {
    v3 = objc_opt_new(NFUIService);
    uiService = self->_uiService;
    self->_uiService = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    -[NFUIService setDebugContext:](self->_uiService, "setDebugContext:", v5);

    sharingUIMode = self->_sharingUIMode;
    switch(sharingUIMode)
    {
      case 3uLL:
        -[NFUIService coreNFCUISetMode:](self->_uiService, "coreNFCUISetMode:", 1);
        self->_uiStateOnInvalidation = 1;
        break;
      case 2uLL:
        v7 = self->_uiService;
        v8 = 2;
        goto LABEL_8;
      case 1uLL:
        v7 = self->_uiService;
        v8 = 1;
LABEL_8:
        -[NFUIService coreNFCUISetMode:](v7, "coreNFCUISetMode:", v8);
        break;
    }
    -[NFUIService coreNFCUISetScanText:](self->_uiService, "coreNFCUISetScanText:", self->_initialScanText);
  }
  v10.receiver = self;
  v10.super_class = (Class)_NFReaderSession;
  return -[_NFSession willStartSession](&v10, "willStartSession");
}

- (void)didStartSession:(id)a3
{
  id v5;
  id v6;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v10;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  id v20;
  void *v21;
  NFTimer *v22;
  NFTimer *sessionTimer;
  NFTimer *v24;
  void *v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43[2];
  objc_super v44;
  id buf;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;

  v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)_NFReaderSession;
  -[_NFSession didStartSession:](&v44, "didStartSession:", v5);
  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v6, "didStartSession:", v5);
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm"));
    if (objc_msgSend(v6, "BOOLForKey:", CFSTR("skipMifareDetection")))
    {
      self->_skipMifareClassification = 1;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v10 = 43;
        else
          v10 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(5, "%c[%{public}s %{public}s]:%i disabling mifare detection", v10, ClassName, Name, 326);
      }
      v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFSharedLogGetLogger(v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v17;
        v46 = 2082;
        v47 = v18;
        v48 = 2082;
        v49 = v19;
        v50 = 1024;
        v51 = 326;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i disabling mifare detection", (uint8_t *)&buf, 0x22u);
      }

    }
    if (-[_NFReaderSession timeLimitedSession](self, "timeLimitedSession"))
    {
      objc_initWeak(&buf, self);
      v20 = objc_alloc((Class)NFTimer);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1001A0874;
      v42[3] = &unk_1002E6290;
      objc_copyWeak(v43, &buf);
      v43[1] = (id)a2;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
      v22 = (NFTimer *)objc_msgSend(v20, "initWithCallback:queue:", v42, v21);
      sessionTimer = self->_sessionTimer;
      self->_sessionTimer = v22;

      v24 = self->_sessionTimer;
      -[NFServiceWhitelistChecker sessionTimeLimit](self->_tagWhiteList, "sessionTimeLimit");
      -[NFTimer startTimer:leeway:](v24, "startTimer:leeway:");
      objc_destroyWeak(v43);
      objc_destroyWeak(&buf);
    }
    else
    {
      v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v25);
      if (v26)
      {
        v27 = object_getClass(self);
        if (class_isMetaClass(v27))
          v28 = 43;
        else
          v28 = 45;
        v29 = object_getClassName(self);
        v30 = sel_getName(a2);
        v26(5, "%c[%{public}s %{public}s]:%i Session is not time limited!", v28, v29, v30, 353);
      }
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFSharedLogGetLogger(v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = object_getClass(self);
        if (class_isMetaClass(v34))
          v35 = 43;
        else
          v35 = 45;
        v36 = object_getClassName(self);
        v37 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v35;
        v46 = 2082;
        v47 = v36;
        v48 = 2082;
        v49 = v37;
        v50 = 1024;
        v51 = 353;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session is not time limited!", (uint8_t *)&buf, 0x22u);
      }

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v38, "didStartSession:", 0);

    v39 = sub_100226308((uint64_t)NFTagReadCALogger);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_sessionUUID, "NF_asHexString"));
    sub_100226A6C((uint64_t)v40, v41, self->_sessionType);

  }
}

- (void)cleanupUI
{
  uint64_t v3;
  NSObject *v4;
  int64_t uiStateOnInvalidation;
  int64_t v6;
  NFUIService *uiService;
  uint64_t v8;
  int v9;
  int64_t v10;

  if (self->_uiControllerStarted)
  {
    v3 = NFSharedSignpostLog(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_signpost_enabled(v4))
    {
      uiStateOnInvalidation = self->_uiStateOnInvalidation;
      v9 = 134349056;
      v10 = uiStateOnInvalidation;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UIControllerInvalidation", "state=%{public,signpost.description:attribute}ld", (uint8_t *)&v9, 0xCu);
    }

    v6 = self->_uiStateOnInvalidation;
    if (v6 == 1)
    {
      uiService = self->_uiService;
      v8 = 1;
    }
    else
    {
      if (v6 != 2)
      {
LABEL_9:
        -[NFUIService coreNFCUIInvalidate](self->_uiService, "coreNFCUIInvalidate");
        return;
      }
      uiService = self->_uiService;
      v8 = 0;
    }
    -[NFUIService coreNFCUITagScannedCount:](uiService, "coreNFCUITagScannedCount:", v8);
    goto LABEL_9;
  }
}

- (void)cleanup
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NFTag *currentTag;
  unsigned int v9;
  unsigned int v10;
  id v11;
  void *v12;
  NFTag *v13;
  id v14;
  void *v15;
  id v16;
  id WeakRetained;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  void *v32;
  void *v33;
  id v34;
  void *specific;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  objc_class *v74;
  int v75;
  const char *v76;
  const char *v77;
  id v78;
  uint64_t v79;
  NSObject *v80;
  id v81;
  uint64_t v82;
  NSObject *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  objc_super v87;
  uint8_t buf[4];
  int v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  void *v97;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFReaderSession", buf, 2u);
  }

  if (-[_NFSession needsCleanup](self, "needsCleanup") && !-[_NFSession isSuspended](self, "isSuspended"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v7 = sub_10011B638(v6);
    currentTag = self->_currentTag;
    if (currentTag)
    {
      sub_10017EF78(self->_driverWrapper, currentTag, 0);
      if (-[NFTag type](self->_currentTag, "type"))
        v9 = -[NFTag type](self->_currentTag, "type");
      else
        v9 = sub_10017E740((uint64_t)self->_driverWrapper, self->_currentTag);
      v10 = v9;
      v11 = sub_100226308((uint64_t)NFTagReadCALogger);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      sub_100226434((uint64_t)v12, self->_currentTag, v10);

      v13 = self->_currentTag;
      self->_currentTag = 0;

    }
    v14 = sub_100226308((uint64_t)NFTagReadCALogger);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    sub_100226B10((uint64_t)v15, self->_exitReason);

    if (self->_continuousWaveState)
    {
      v16 = sub_1001D6A14(self->_driverWrapper, 0, 0);
      self->_continuousWaveState = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
    sub_10019D694((uint64_t)WeakRetained, self);

    objc_msgSend(v6, "notifyReaderModeActivityEnd");
    Logger = NFLogGetLogger(2);
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v25 = 45;
      if (isMetaClass)
        v25 = 43;
      v19(6, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", v25, ClassName, Name, 409, v24);

    }
    v26 = NFSharedLogGetLogger(2);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      *(_DWORD *)buf = 67110146;
      v89 = v29;
      v90 = 2082;
      v91 = v30;
      v92 = 2082;
      v93 = v31;
      v94 = 1024;
      v95 = 409;
      v96 = 2112;
      v97 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", buf, 0x2Cu);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
    v34 = objc_msgSend(v6, "setRoutingConfig:", v33);

    if (self->_didEnableDynamicBBA)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFLogGetLogger(specific);
      if (v36)
      {
        v37 = (void (*)(uint64_t, const char *, ...))v36;
        v38 = object_getClass(self);
        v39 = class_isMetaClass(v38);
        v40 = object_getClassName(self);
        v84 = sel_getName(a2);
        v41 = 45;
        if (v39)
          v41 = 43;
        v37(6, "%c[%{public}s %{public}s]:%i Disabling dynamic BBA", v41, v40, v84, 417);
      }
      v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v43 = NFSharedLogGetLogger(v42);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = object_getClass(self);
        if (class_isMetaClass(v45))
          v46 = 43;
        else
          v46 = 45;
        v47 = object_getClassName(self);
        v48 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v89 = v46;
        v90 = 2082;
        v91 = v47;
        v92 = 2082;
        v93 = v48;
        v94 = 1024;
        v95 = 417;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disabling dynamic BBA", buf, 0x22u);
      }

      v49 = sub_1001CBBE8(self->_driverWrapper, 0);
      self->_didEnableDynamicBBA = 0;
    }
    self->_vasECP = 0;
    self->_isConnectionHandover = 0;
    if ((objc_msgSend(v6, "configureECPPolling:", 0) & 1) == 0)
    {
      v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v51 = NFLogGetLogger(v50);
      if (v51)
      {
        v52 = (void (*)(uint64_t, const char *, ...))v51;
        v53 = object_getClass(self);
        v54 = class_isMetaClass(v53);
        v55 = object_getClassName(self);
        v85 = sel_getName(a2);
        v56 = 45;
        if (v54)
          v56 = 43;
        v52(3, "%c[%{public}s %{public}s]:%i Failed to restore ECP", v56, v55, v85, 427);
      }
      v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = NFSharedLogGetLogger(v57);
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v60 = object_getClass(self);
        if (class_isMetaClass(v60))
          v61 = 43;
        else
          v61 = 45;
        v62 = object_getClassName(self);
        v63 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v89 = v61;
        v90 = 2082;
        v91 = v62;
        v92 = 2082;
        v93 = v63;
        v94 = 1024;
        v95 = 427;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore ECP", buf, 0x22u);
      }

    }
    if (-[NFServiceWhitelistChecker pollingProfileUpdate](self->_tagWhiteList, "pollingProfileUpdate")
      && self->_pollingProfile)
    {
      v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v65 = NFLogGetLogger(v64);
      if (v65)
      {
        v66 = (void (*)(uint64_t, const char *, ...))v65;
        v67 = object_getClass(self);
        v68 = class_isMetaClass(v67);
        v69 = object_getClassName(self);
        v86 = sel_getName(a2);
        v70 = 45;
        if (v68)
          v70 = 43;
        v66(6, "%c[%{public}s %{public}s]:%i Reset default", v70, v69, v86, 432);
      }
      v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v72 = NFSharedLogGetLogger(v71);
      v73 = objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        v74 = object_getClass(self);
        if (class_isMetaClass(v74))
          v75 = 43;
        else
          v75 = 45;
        v76 = object_getClassName(self);
        v77 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v89 = v75;
        v90 = 2082;
        v91 = v76;
        v92 = 2082;
        v93 = v77;
        v94 = 1024;
        v95 = 432;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reset default", buf, 0x22u);
      }

      sub_1001CB354(self->_driverWrapper, 0);
    }
    -[_NFReaderSession cleanupUI](self, "cleanupUI");
    v78 = -[NFTimer stopTimer](self->_sessionTimer, "stopTimer");
    if (v7)
    {
      v79 = NFSharedSignpostLog(v78);
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (os_signpost_enabled(v80))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Polling", ", buf, 2u);
      }

    }
  }
  v87.receiver = self;
  v87.super_class = (Class)_NFReaderSession;
  v81 = -[_NFSession cleanup](&v87, "cleanup");
  v82 = NFSharedSignpostLog(v81);
  v83 = objc_claimAutoreleasedReturnValue(v82);
  if (os_signpost_enabled(v83))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFReaderSession", buf, 2u);
  }

}

- (void)coreDuetActivityRevoked
{
  OS_dispatch_queue *v4;
  NSObject *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NFReaderSession;
  v4 = -[_NFSession workQueue](&v7, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001A161C;
  v6[3] = &unk_1002E5C30;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(v5, v6);

}

- (BOOL)shouldHandleSecureElementTransactionData
{
  return 1;
}

- (void)handleRemoteTagsDetected:(id)a3
{
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  id v19;
  void *v20;
  void *v21;
  const char *v22;
  id v23;
  int v24;
  int v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  NSMutableArray *v30;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  id v46;
  const char *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void (*v51)(uint64_t, const char *, ...);
  objc_class *v52;
  _BOOL4 v53;
  NSMutableArray *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  objc_class *v61;
  NSMutableArray *v62;
  int v63;
  const char *v64;
  const char *v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  void (*v72)(uint64_t, const char *, ...);
  objc_class *v73;
  _BOOL4 v74;
  NSMutableArray *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  objc_class *v81;
  NSMutableArray *v82;
  int v83;
  const char *v84;
  const char *v85;
  id v86;
  NSObject *v87;
  os_log_type_t v88;
  uint32_t v89;
  void *v90;
  id v91;
  uint64_t v92;
  id v93;
  void *v94;
  id v95;
  _BYTE *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  NSMutableArray *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  char v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  void *i;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  objc_class *v116;
  _BOOL4 v117;
  NSMutableArray *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  objc_class *v123;
  NSMutableArray *v124;
  int v125;
  const char *v126;
  const char *v127;
  const char *ClassName;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *Name;
  const char *v133;
  id v134;
  id v135;
  id v136;
  int v137;
  void *v138;
  char v139;
  NSMutableArray *v140;
  NSMutableArray *v141;
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _QWORD v147[5];
  NSMutableArray *v148;
  id v149;
  id v150;
  id v151;
  uint64_t v152;
  BOOL v153;
  _BYTE v154[128];
  NSErrorUserInfoKey v155;
  void *v156;
  uint8_t buf[4];
  int v158;
  __int16 v159;
  const char *v160;
  __int16 v161;
  const char *v162;
  __int16 v163;
  int v164;
  __int16 v165;
  id v166;

  v142 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i tags: %{public}@", v10, ClassName, Name, 477, v142);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67110146;
    v158 = v15;
    v159 = 2082;
    v160 = object_getClassName(self);
    v161 = 2082;
    v162 = sel_getName(a2);
    v163 = 1024;
    v164 = 477;
    v165 = 2114;
    v166 = v142;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tags: %{public}@", buf, 0x2Cu);
  }

  v16 = objc_opt_new(NSMutableArray);
  v17 = objc_opt_new(NSMutableArray);
  v18 = objc_opt_new(NSMutableArray);
  v153 = 0;
  v152 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = sub_100226308((uint64_t)NFTagReadCALogger);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  sub_100226F94((uint64_t)v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  objc_msgSend(v21, "notifyReaderModeActivityStart");

  v141 = v18;
  if (-[_NFReaderSession _isCoreNFCSession](self, "_isCoreNFCSession")
    || !-[NFServiceWhitelistChecker internalAccess](self->_tagWhiteList, "internalAccess"))
  {
    if ((self->_pollOption & 2) != 0
      && -[NFServiceWhitelistChecker nfcNDEFReaderAccess](self->_tagWhiteList, "nfcNDEFReaderAccess")
      && (self->_sessionConfig & 0x10) == 0)
    {
      v22 = a2;
      v150 = 0;
      -[_NFReaderSession _processRawTagsForNDEF:ndefMessages:supportedTags:caEvents:outError:](self, "_processRawTagsForNDEF:ndefMessages:supportedTags:caEvents:outError:", v142, v17, v16, v18, &v150);
      v23 = v150;
      v24 = -[NSMutableArray count](v17, "count") != 0;
      v25 = 1;
      goto LABEL_20;
    }
    v22 = a2;
    v149 = 0;
    -[_NFReaderSession _processRawTagsForCoreNFC:requireDiscoveryRestart:supportedTags:caEvents:outError:outConnectedTagIndex:](self, "_processRawTagsForCoreNFC:requireDiscoveryRestart:supportedTags:caEvents:outError:outConnectedTagIndex:", v142, &v153, v16, v18, &v149, &v152);
    v23 = v149;
    if (-[NSMutableArray count](v16, "count"))
    {
      v25 = 0;
      v24 = (LOBYTE(self->_pollOption) >> 1) & 1;
      goto LABEL_20;
    }
  }
  else
  {
    v22 = a2;
    v151 = 0;
    -[_NFReaderSession _processRawTagsForInternalSession:supportedTags:outError:](self, "_processRawTagsForInternalSession:supportedTags:outError:", v142, v16, &v151);
    v23 = v151;
  }
  v25 = 0;
  v24 = 0;
LABEL_20:
  v138 = v23;
  v26 = objc_msgSend(v23, "code");
  v153 = v26 == (id)51;
  v27 = NFSharedSignpostLog(v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_signpost_enabled(v28))
  {
    v29 = -[NSMutableArray count](v16, "count") != 0;
    *(_DWORD *)buf = 67240448;
    v158 = v24;
    v159 = 1026;
    LODWORD(v160) = v29;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "handleRemoteTagsDetected", "didDetectNDEF=%{public,signpost.description:attribute}u didDetectTags=%{public,signpost.description:attribute}u", buf, 0xEu);
  }

  v139 = v24;
  if (v24)
  {
    v137 = v25;
    if (-[NSMutableArray count](v17, "count"))
    {
      v30 = v17;
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFLogGetLogger(v31);
      if (v32)
      {
        v33 = (void (*)(uint64_t, const char *, ...))v32;
        v34 = object_getClass(self);
        v35 = class_isMetaClass(v34);
        v36 = object_getClassName(self);
        v37 = sel_getName(v22);
        v134 = -[NSMutableArray count](v30, "count");
        v38 = 45;
        if (v35)
          v38 = 43;
        v33(6, "%c[%{public}s %{public}s]:%i %lu NDEF messages found", v38, v36, v37, 529, v134);
      }
      v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFSharedLogGetLogger(v39);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v30;
        goto LABEL_58;
      }
      v42 = object_getClass(self);
      if (class_isMetaClass(v42))
        v43 = 43;
      else
        v43 = 45;
      v44 = object_getClassName(self);
      v45 = sel_getName(v22);
      v46 = -[NSMutableArray count](v30, "count");
      *(_DWORD *)buf = 67110146;
      v158 = v43;
      v17 = v30;
      v159 = 2082;
      v160 = v44;
      v161 = 2082;
      v162 = v45;
      v163 = 1024;
      v164 = 529;
      v165 = 2048;
      v166 = v46;
      v47 = "%c[%{public}s %{public}s]:%i %lu NDEF messages found";
    }
    else
    {
      v69 = -[NSMutableArray count](v16, "count");
      v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v71 = NFLogGetLogger(v70);
      v72 = (void (*)(uint64_t, const char *, ...))v71;
      if (!v69)
      {
        if (v71)
        {
          v116 = object_getClass(self);
          v117 = class_isMetaClass(v116);
          v118 = v17;
          v119 = object_getClassName(self);
          v133 = sel_getName(v22);
          v120 = 45;
          if (v117)
            v120 = 43;
          v131 = v119;
          v17 = v118;
          v72(3, "%c[%{public}s %{public}s]:%i Unexpected state", v120, v131, v133, 533);
        }
        v121 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v122 = NFSharedLogGetLogger(v121);
        v41 = objc_claimAutoreleasedReturnValue(v122);
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v123 = object_getClass(self);
        v124 = v17;
        if (class_isMetaClass(v123))
          v125 = 43;
        else
          v125 = 45;
        v126 = object_getClassName(self);
        v127 = sel_getName(v22);
        *(_DWORD *)buf = 67109890;
        v158 = v125;
        v17 = v124;
        v159 = 2082;
        v160 = v126;
        v161 = 2082;
        v162 = v127;
        v163 = 1024;
        v164 = 533;
        v47 = "%c[%{public}s %{public}s]:%i Unexpected state";
        v87 = v41;
        v88 = OS_LOG_TYPE_ERROR;
        v89 = 34;
        goto LABEL_56;
      }
      if (v71)
      {
        v73 = object_getClass(self);
        v74 = class_isMetaClass(v73);
        v75 = v17;
        v76 = object_getClassName(self);
        v77 = sel_getName(v22);
        v136 = -[NSMutableArray count](v16, "count");
        v130 = v76;
        v78 = 45;
        if (v74)
          v78 = 43;
        v17 = v75;
        v72(6, "%c[%{public}s %{public}s]:%i %lu NDEF tags found", v78, v130, v77, 531, v136);
      }
      v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v80 = NFSharedLogGetLogger(v79);
      v41 = objc_claimAutoreleasedReturnValue(v80);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        goto LABEL_58;
      v81 = object_getClass(self);
      v82 = v17;
      if (class_isMetaClass(v81))
        v83 = 43;
      else
        v83 = 45;
      v84 = object_getClassName(self);
      v85 = sel_getName(v22);
      v86 = -[NSMutableArray count](v16, "count");
      *(_DWORD *)buf = 67110146;
      v158 = v83;
      v17 = v82;
      v159 = 2082;
      v160 = v84;
      v161 = 2082;
      v162 = v85;
      v163 = 1024;
      v164 = 531;
      v165 = 2048;
      v166 = v86;
      v47 = "%c[%{public}s %{public}s]:%i %lu NDEF tags found";
    }
    v87 = v41;
    v88 = OS_LOG_TYPE_DEFAULT;
    v89 = 44;
LABEL_56:
    _os_log_impl((void *)&_mh_execute_header, v87, v88, v47, buf, v89);
LABEL_58:

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    v91 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v17);
    v92 = v152;
    v147[0] = _NSConcreteStackBlock;
    v147[1] = 3221225472;
    v147[2] = sub_1001A24F8;
    v147[3] = &unk_1002EA8A0;
    v147[4] = self;
    v148 = v17;
    objc_msgSend(v90, "didDetectNDEFMessages:fromTags:connectedTagIndex:updateUICallback:", v91, v16, v92, v147);

LABEL_59:
    v48 = v137;
    goto LABEL_60;
  }
  v48 = 1;
  if (-[NSMutableArray count](v16, "count") && !v153)
  {
    v137 = v25;
    v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v50 = NFLogGetLogger(v49);
    if (v50)
    {
      v51 = (void (*)(uint64_t, const char *, ...))v50;
      v52 = object_getClass(self);
      v53 = class_isMetaClass(v52);
      v54 = v17;
      v55 = object_getClassName(self);
      v56 = sel_getName(v22);
      v135 = -[NSMutableArray count](v16, "count");
      v129 = v55;
      v57 = 45;
      if (v53)
        v57 = 43;
      v17 = v54;
      v51(6, "%c[%{public}s %{public}s]:%i %lu tags found", v57, v129, v56, 546, v135);
    }
    v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v59 = NFSharedLogGetLogger(v58);
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = object_getClass(self);
      v62 = v17;
      if (class_isMetaClass(v61))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(self);
      v65 = sel_getName(v22);
      v66 = -[NSMutableArray count](v16, "count");
      *(_DWORD *)buf = 67110146;
      v158 = v63;
      v17 = v62;
      v159 = 2082;
      v160 = v64;
      v161 = 2082;
      v162 = v65;
      v163 = 1024;
      v164 = 546;
      v165 = 2048;
      v166 = v66;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %lu tags found", buf, 0x2Cu);
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    v68 = -[NSMutableArray copy](v16, "copy");
    objc_msgSend(v67, "didDetectTags:connectedTagIndex:", v68, v152);

    goto LABEL_59;
  }
LABEL_60:
  if (self->_currentTag)
  {
    v93 = sub_100226308((uint64_t)NFTagReadCALogger);
    v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
    sub_100226374((uint64_t)v94, self->_currentTag);

    if (self->_isConnectionHandover)
    {
      v95 = sub_100226308((uint64_t)NFTagReadCALogger);
      v96 = (_BYTE *)objc_claimAutoreleasedReturnValue(v95);
      if (v96)
        v96[157] = 1;

    }
  }
  if (v138 && objc_msgSend(v138, "code") == (id)64)
  {
    -[_NFXPCSession endSession:](self, "endSession:", 0);
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    v98 = objc_alloc((Class)NSError);
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v155 = NSLocalizedDescriptionKey;
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Reader mode prohibit timer"));
    v156 = v100;
    v101 = v17;
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1));
    v103 = objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 64, v102);
    objc_msgSend(v97, "didTerminate:", v103);

    v17 = v101;
    v104 = sub_100226308((uint64_t)NFTagReadCALogger);
    v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
    sub_1002269C8((uint64_t)v105, v138);

LABEL_70:
    v106 = v139;
    goto LABEL_71;
  }
  if (v153)
  {
    sub_1001FBF60(self->_driverWrapper);
    goto LABEL_70;
  }
  v106 = v139;
  if (v48)
  {
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "firstObject"));
    -[_NFReaderSession _tagRemovalDetect:](self, "_tagRemovalDetect:", v115);

  }
LABEL_71:
  if ((v106 & 1) == 0 && !-[NSMutableArray count](v16, "count"))
  {
    v140 = v17;
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v107 = v142;
    v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v143, v154, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v144;
      do
      {
        for (i = 0; i != v109; i = (char *)i + 1)
        {
          if (*(_QWORD *)v144 != v110)
            objc_enumerationMutation(v107);
          v112 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * (_QWORD)i);
          v113 = sub_100226308((uint64_t)NFTagReadCALogger);
          v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
          sub_1002268C8((uint64_t)v114, v112);

        }
        v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v143, v154, 16);
      }
      while (v109);
    }

    v17 = v140;
  }

}

- (void)handleReaderBurnoutTimer
{
  NSObject *v3;
  id v4;
  _BYTE *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t v15[8];
  NSErrorUserInfoKey v16;
  void *v17;

  v3 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  if (self->_currentTag)
  {
    v4 = sub_100226308((uint64_t)NFTagReadCALogger);
    v5 = (_BYTE *)objc_claimAutoreleasedReturnValue(v4);
    if (v5)
      v5[155] = 1;

  }
  v6 = -[_NFReaderSession _disconnectWithCardRemoval:](self, "_disconnectWithCardRemoval:", 0);
  self->_exitReason = 1;
  self->_uiStateOnInvalidation = 0;
  v7 = NFSharedSignpostLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "handleReaderBurnoutTimer", ", v15, 2u);
  }

  -[_NFXPCSession endSession:](self, "endSession:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  v10 = objc_alloc((Class)NSError);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v16 = NSLocalizedDescriptionKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Reader mode temporarily disabled"));
  v17 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v14 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 47, v13);
  objc_msgSend(v9, "didTerminate:", v14);

}

- (void)handleReaderBurnoutCleared
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", v10, ClassName, Name, 600);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v18 = v15;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 600;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", buf, 0x22u);
  }

}

- (void)handleFilteredFieldNotification:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  const char *ClassName;
  const char *Name;
  const char *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 615, v5);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67110146;
    v36 = v16;
    v37 = 2082;
    v38 = object_getClassName(self);
    v39 = 2082;
    v40 = sel_getName(a2);
    v41 = 1024;
    v42 = 615;
    v43 = 2114;
    v44 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (!-[_NFReaderSession _isCoreNFCSession](self, "_isCoreNFCSession")
    || (self->_sessionConfig & 8) == 0
    || objc_msgSend(v5, "notificationType") != (id)2)
  {
    goto LABEL_26;
  }
  v17 = v5;
  if (objc_msgSend(v17, "terminalMode") != 4 || objc_msgSend(v17, "terminalType") != 15)
  {

LABEL_26:
    v17 = (id)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v17, "didDetectExternalReaderWithNotification:", v5);
    goto LABEL_27;
  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFLogGetLogger(v18);
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(self);
    v22 = class_isMetaClass(v21);
    v23 = object_getClassName(self);
    v34 = sel_getName(a2);
    v24 = 45;
    if (v22)
      v24 = 43;
    v20(5, "%c[%{public}s %{public}s]:%i Ignoring non ECP/VAS/Payment reader field", v24, v23, v34, 623);
  }
  v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v26 = NFSharedLogGetLogger(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    v30 = object_getClassName(self);
    v31 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v36 = v29;
    v37 = 2082;
    v38 = v30;
    v39 = 2082;
    v40 = v31;
    v41 = 1024;
    v42 = 623;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring non ECP/VAS/Payment reader field", buf, 0x22u);
  }

LABEL_27:
}

- (void)handleInvalidatedXPCWithConnectionUserInfo:(id)a3
{
  NFTag *currentTag;

  self->_exitReason = 2;
  currentTag = self->_currentTag;
  self->_currentTag = 0;

}

- (id)_activateAppOnConnect:(id)a3
{
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *specific;
  uint64_t Logger;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSErrorUserInfoKey v72;
  void *v73;
  NSErrorUserInfoKey v74;
  void *v75;
  uint8_t buf[4];
  int v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;

  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  v7 = objc_msgSend(v5, "type");
  v8 = objc_msgSend(v5, "type");
  if ((v6 == 3 || v7 == 6) && (self->_pollOption & 8) != 0)
  {
    if (v6 == 3)
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagA"));
    else
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagB"));
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectedAID"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _performType4AppSelect:tag:](self, "_performType4AppSelect:tag:", v21, v5));
    if (!v22)
    {

      goto LABEL_16;
    }
    v23 = v22;

  }
  else
  {
    if (v8 != 7 || (self->_pollOption & 0x10) == 0)
      goto LABEL_16;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagF"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "SystemCode"));
    v11 = -[_NFReaderSession validateSystemCode:](self, "validateSystemCode:", v10);

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagF"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "SystemCode"));
      v71 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getIDMFromTag:systemCode:outIdm:outPmm:](self, "_getIDMFromTag:systemCode:outIdm:outPmm:", v5, v13, &v71, 0));
      v15 = v71;

      if (v14
        || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagF")),
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "IDm")),
            v18 = objc_msgSend(v15, "isEqual:", v17),
            v17,
            v16,
            (v18 & 1) != 0))
      {

LABEL_16:
        v23 = 0;
        goto LABEL_17;
      }
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v52 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "NF_asHexString"));
        v58 = 45;
        if (isMetaClass)
          v58 = 43;
        v52(6, "%c[%{public}s %{public}s]:%i IDm of requested tag (%{public}@) does not match physical card", v58, ClassName, Name, 664, v57);

      }
      v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v60 = NFSharedLogGetLogger(v59);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = object_getClass(self);
        if (class_isMetaClass(v62))
          v63 = 43;
        else
          v63 = 45;
        v64 = object_getClassName(self);
        v65 = sel_getName(a2);
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "NF_asHexString"));
        *(_DWORD *)buf = 67110146;
        v77 = v63;
        v78 = 2082;
        v79 = v64;
        v80 = 2082;
        v81 = v65;
        v82 = 1024;
        v83 = 664;
        v84 = 2114;
        v85 = v66;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i IDm of requested tag (%{public}@) does not match physical card", buf, 0x2Cu);

      }
      v67 = objc_alloc((Class)NSError);
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v72 = NSLocalizedDescriptionKey;
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Not Found"));
      v73 = v69;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1));
      v23 = objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 28, v70);

    }
    else
    {
      v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v26 = NFLogGetLogger(v25);
      if (v26)
      {
        v27 = (void (*)(uint64_t, const char *, ...))v26;
        v28 = object_getClass(self);
        v29 = class_isMetaClass(v28);
        v30 = object_getClassName(self);
        v31 = sel_getName(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagF"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "SystemCode"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "NF_asHexString"));
        v35 = 45;
        if (v29)
          v35 = 43;
        v27(6, "%c[%{public}s %{public}s]:%i Service code (%{public}@) not in the whitelist", v35, v30, v31, 656, v34);

      }
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v37 = NFSharedLogGetLogger(v36);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = object_getClass(self);
        if (class_isMetaClass(v39))
          v40 = 43;
        else
          v40 = 45;
        v41 = object_getClassName(self);
        v42 = sel_getName(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagF"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "SystemCode"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "NF_asHexString"));
        *(_DWORD *)buf = 67110146;
        v77 = v40;
        v78 = 2082;
        v79 = v41;
        v80 = 2082;
        v81 = v42;
        v82 = 1024;
        v83 = 656;
        v84 = 2114;
        v85 = v45;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Service code (%{public}@) not in the whitelist", buf, 0x2Cu);

      }
      v46 = objc_alloc((Class)NSError);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v74 = NSLocalizedDescriptionKey;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
      v75 = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1));
      v23 = objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 32, v49);

    }
  }
LABEL_17:

  return v23;
}

- (id)_performType4AppSelect:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  int64_t v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  int64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  unsigned __int8 v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  void *v72;
  uint64_t v73;
  void (*v74)(uint64_t, const char *, ...);
  objc_class *v75;
  _BOOL4 v76;
  const char *v77;
  const char *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  objc_class *v96;
  _BOOL4 v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  objc_class *v101;
  int v102;
  const char *v103;
  const char *v104;
  const char *v106;
  const char *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  id v113;
  _NFReaderSession *v114;
  NSMutableArray *obj;
  id v116;
  id v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  NSErrorUserInfoKey v123;
  void *v124;
  _BYTE v125[128];
  NSErrorUserInfoKey v126;
  void *v127;
  uint8_t buf[4];
  int v129;
  __int16 v130;
  const char *v131;
  __int16 v132;
  const char *v133;
  __int16 v134;
  int v135;
  __int16 v136;
  id v137;

  v7 = a3;
  v8 = a4;
  v9 = -[_NFReaderSession validateAID:allowsPrefixMatch:](self, "validateAID:allowsPrefixMatch:", v7, 0);
  if (v9 == 4)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v17 = a2;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_asHexString"));
      v19 = 45;
      if (isMetaClass)
        v19 = 43;
      v12(6, "%c[%{public}s %{public}s]:%i Application (%{public}@) not in the allowedlist", v19, ClassName, Name, 678, v18);

      a2 = v17;
    }
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFSharedLogGetLogger(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = object_getClass(self);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      v25 = object_getClassName(self);
      v26 = sel_getName(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_asHexString"));
      *(_DWORD *)buf = 67110146;
      v129 = v24;
      v130 = 2082;
      v131 = v25;
      v132 = 2082;
      v133 = v26;
      v134 = 1024;
      v135 = 678;
      v136 = 2114;
      v137 = v27;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Application (%{public}@) not in the allowedlist", buf, 0x2Cu);

    }
    v28 = objc_alloc((Class)NSError);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v126 = NSLocalizedDescriptionKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v127 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1));
    v32 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 32, v31);

    goto LABEL_72;
  }
  v33 = v9;
  v114 = self;
  if (-[NSMutableArray count](self->_nonstandard7816TagsFound, "count"))
  {
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    obj = self->_nonstandard7816TagsFound;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v119, v125, 16);
    if (v34)
    {
      v35 = v34;
      v112 = a2;
      v113 = v7;
      v36 = *(_QWORD *)v120;
LABEL_15:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v120 != v36)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("uid")));
        v41 = objc_msgSend(v39, "isEqualToData:", v40);

        if (v41)
          break;
        if (v35 == (id)++v37)
        {
          v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v119, v125, 16);
          if (v35)
            goto LABEL_15;
          a2 = v112;
          v7 = v113;
          goto LABEL_46;
        }
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("type")));
      v33 = (int64_t)objc_msgSend(v42, "integerValue");

      v7 = v113;
      if (v33 == 3)
      {
        v117 = 0;
        v58 = -[_NFReaderSession selectPRCIDApp:fromTag:resolvedAid:outError:](v114, "selectPRCIDApp:fromTag:resolvedAid:outError:", v113, v8, 0, &v117);
        v44 = v117;
        if ((v58 & 1) == 0)
        {
          v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v94 = NFLogGetLogger(v93);
          if (v94)
          {
            v95 = (void (*)(uint64_t, const char *, ...))v94;
            v96 = object_getClass(v114);
            v97 = class_isMetaClass(v96);
            v108 = object_getClassName(v114);
            v111 = sel_getName(v112);
            v98 = 45;
            if (v97)
              v98 = 43;
            v95(3, "%c[%{public}s %{public}s]:%i %{public}@", v98, v108, v111, 702, v44);
          }
          v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v100 = NFSharedLogGetLogger(v99);
          v53 = objc_claimAutoreleasedReturnValue(v100);
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            goto LABEL_70;
          v101 = object_getClass(v114);
          if (class_isMetaClass(v101))
            v102 = 43;
          else
            v102 = 45;
          v103 = object_getClassName(v114);
          v104 = sel_getName(v112);
          *(_DWORD *)buf = 67110146;
          v129 = v102;
          v130 = 2082;
          v131 = v103;
          v132 = 2082;
          v133 = v104;
          v134 = 1024;
          v135 = 702;
          v136 = 2114;
          v137 = v44;
          goto LABEL_69;
        }
      }
      else
      {
        a2 = v112;
        if (v33 != 2)
        {
          v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v60 = NFLogGetLogger(v59);
          if (v60)
          {
            v61 = (void (*)(uint64_t, const char *, ...))v60;
            v62 = object_getClass(v114);
            v63 = class_isMetaClass(v62);
            v107 = object_getClassName(v114);
            v110 = sel_getName(v112);
            v64 = 45;
            if (v63)
              v64 = 43;
            v61(4, "%c[%{public}s %{public}s]:%i Unexpected tag type found: %{public}@", v64, v107, v110, 708, v8);
          }
          v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v66 = NFSharedLogGetLogger(v65);
          v67 = objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            v68 = object_getClass(v114);
            if (class_isMetaClass(v68))
              v69 = 43;
            else
              v69 = 45;
            v70 = object_getClassName(v114);
            v71 = sel_getName(v112);
            *(_DWORD *)buf = 67110146;
            v129 = v69;
            v130 = 2082;
            v131 = v70;
            v132 = 2082;
            v133 = v71;
            v134 = 1024;
            v135 = 708;
            v136 = 2114;
            v137 = v8;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected tag type found: %{public}@", buf, 0x2Cu);
          }

LABEL_46:
          self = v114;
          goto LABEL_47;
        }
        v118 = 0;
        v43 = -[_NFReaderSession selectPaceApp:fromTag:outError:](v114, "selectPaceApp:fromTag:outError:", v113, v8, &v118);
        v44 = v118;
        if ((v43 & 1) == 0)
        {
          v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v46 = NFLogGetLogger(v45);
          if (v46)
          {
            v47 = (void (*)(uint64_t, const char *, ...))v46;
            v48 = object_getClass(v114);
            v49 = class_isMetaClass(v48);
            v106 = object_getClassName(v114);
            v109 = sel_getName(v112);
            v50 = 45;
            if (v49)
              v50 = 43;
            v47(3, "%c[%{public}s %{public}s]:%i %{public}@", v50, v106, v109, 696, v44);
          }
          v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v52 = NFSharedLogGetLogger(v51);
          v53 = objc_claimAutoreleasedReturnValue(v52);
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            goto LABEL_70;
          v54 = object_getClass(v114);
          if (class_isMetaClass(v54))
            v55 = 43;
          else
            v55 = 45;
          v56 = object_getClassName(v114);
          v57 = sel_getName(v112);
          *(_DWORD *)buf = 67110146;
          v129 = v55;
          v130 = 2082;
          v131 = v56;
          v132 = 2082;
          v133 = v57;
          v134 = 1024;
          v135 = 696;
          v136 = 2114;
          v137 = v44;
LABEL_69:
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
LABEL_70:

          v44 = v44;
          v32 = v44;
          goto LABEL_71;
        }
      }
      v32 = 0;
LABEL_71:

      goto LABEL_72;
    }
LABEL_47:

  }
  if ((v33 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    v116 = 0;
    -[_NFReaderSession _selectFromTag:aid:resolvedAid:error:](self, "_selectFromTag:aid:resolvedAid:error:", v8, v7, 0, &v116);
    v32 = v116;
  }
  else
  {
    v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v73 = NFLogGetLogger(v72);
    if (v73)
    {
      v74 = (void (*)(uint64_t, const char *, ...))v73;
      v75 = object_getClass(v114);
      v76 = class_isMetaClass(v75);
      v77 = object_getClassName(v114);
      v78 = sel_getName(a2);
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_asHexString"));
      v80 = 45;
      if (v76)
        v80 = 43;
      v74(6, "%c[%{public}s %{public}s]:%i Application (%{public}@) not in the allowedlist", v80, v77, v78, 715, v79);

    }
    v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v82 = NFSharedLogGetLogger(v81);
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = object_getClass(v114);
      if (class_isMetaClass(v84))
        v85 = 43;
      else
        v85 = 45;
      v86 = object_getClassName(v114);
      v87 = sel_getName(a2);
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_asHexString"));
      *(_DWORD *)buf = 67110146;
      v129 = v85;
      v130 = 2082;
      v131 = v86;
      v132 = 2082;
      v133 = v87;
      v134 = 1024;
      v135 = 715;
      v136 = 2114;
      v137 = v88;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Application (%{public}@) not in the allowedlist", buf, 0x2Cu);

    }
    v89 = objc_alloc((Class)NSError);
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v123 = NSLocalizedDescriptionKey;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v124 = v91;
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
    v32 = objc_msgSend(v89, "initWithDomain:code:userInfo:", v90, 32, v92);

  }
LABEL_72:

  return v32;
}

- (void)_sync_connect:(id)a3 completion:(id)a4
{
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unint64_t pollOption;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned __int8 v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  _BYTE *v63;
  NFDriverWrapper *driverWrapper;
  unsigned int v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  int v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  id v77;
  void *v78;
  unsigned int v79;
  unsigned int v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  const char *v92;
  void (**v94)(id, _QWORD, id);
  id v95;
  id v96;
  NSErrorUserInfoKey v97;
  void *v98;
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[4];
  uint8_t buf[4];
  int v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  int v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  unsigned int v114;
  __int16 v115;
  void *v116;

  v95 = a3;
  v94 = (void (**)(id, _QWORD, id))a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v16 = objc_msgSend(v15, "processIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v18 = 43;
    if (!isMetaClass)
      v18 = 45;
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v18, ClassName, Name, 726, v14, v16, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v28 = objc_msgSend(v27, "processIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110658;
    v104 = v23;
    v105 = 2082;
    v106 = v24;
    v107 = 2082;
    v108 = v25;
    v109 = 1024;
    v110 = 726;
    v111 = 2114;
    v112 = v26;
    v113 = 1024;
    v114 = v28;
    v115 = 2114;
    v116 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);

  }
  pollOption = self->_pollOption;
  if ((pollOption & 2) == 0)
  {
    v31 = 0;
    if ((pollOption & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v33 = 0;
    v32 = 0;
    goto LABEL_17;
  }
  v31 = -[NFServiceWhitelistChecker nfcNDEFReaderAccess](self->_tagWhiteList, "nfcNDEFReaderAccess");
  pollOption = self->_pollOption;
  if ((pollOption & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v32 = -[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess");
  pollOption = self->_pollOption;
  if ((pollOption & 8) == 0)
  {
    v33 = 0;
    goto LABEL_17;
  }
  v33 = -[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess");
  pollOption = self->_pollOption;
  if ((pollOption & 8) == 0)
  {
LABEL_17:
    v34 = 0;
    if ((pollOption & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_23;
  }
  v34 = -[NFServiceWhitelistChecker nfcVASReaderAccess](self->_tagWhiteList, "nfcVASReaderAccess");
  pollOption = self->_pollOption;
  if ((pollOption & 0x10) == 0)
  {
LABEL_18:
    v35 = 0;
    if ((pollOption & 4) != 0)
      goto LABEL_19;
LABEL_24:
    v36 = 0;
    goto LABEL_25;
  }
LABEL_23:
  v35 = -[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess");
  if ((self->_pollOption & 4) == 0)
    goto LABEL_24;
LABEL_19:
  if ((-[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess") & 1) != 0)
    v36 = 1;
  else
    v36 = -[NFServiceWhitelistChecker nfcISO15693ReaderAccess](self->_tagWhiteList, "nfcISO15693ReaderAccess");
LABEL_25:
  if (((-[NFServiceWhitelistChecker internalAccess](self->_tagWhiteList, "internalAccess") | v31 | v32 | v33 | v34 | v35) & 1) != 0
    || (v36 & 1) != 0)
  {
    v60 = sub_100226308((uint64_t)NFTagReadCALogger);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    sub_100226374((uint64_t)v61, v95);

    if (self->_isConnectionHandover)
    {
      v62 = sub_100226308((uint64_t)NFTagReadCALogger);
      v63 = (_BYTE *)objc_claimAutoreleasedReturnValue(v62);
      if (v63)
        v63[157] = 1;

      +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100306B00);
    }
    driverWrapper = self->_driverWrapper;
    v96 = 0;
    v65 = sub_10017E9A4(driverWrapper, v95, &v96);
    v66 = v96;
    if (v65)
    {
      v67 = objc_alloc((Class)NSError);
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v69 = v65;
      v99[0] = NSLocalizedDescriptionKey;
      if (v65 >= 0x47)
        v70 = 71;
      else
        v70 = v65;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v70]));
      v100[0] = v71;
      v100[1] = &off_100300ED8;
      v99[1] = CFSTR("Line");
      v99[2] = CFSTR("Method");
      v72 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v100[2] = v72;
      v99[3] = NSDebugDescriptionErrorKey;
      v73 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 758);
      v100[3] = v73;
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v100, v99, 4));
      v75 = objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, v69, v74);
      v94[2](v94, 0, v75);

      v57 = 0;
    }
    else if ((self->_sessionConfig & 2) != 0
           && (v76 = objc_claimAutoreleasedReturnValue(-[_NFReaderSession _activateAppOnConnect:](self, "_activateAppOnConnect:", v95))) != 0)
    {
      v57 = (id)v76;
      v94[2](v94, 0, (id)v76);
      +[NFExceptionsCALogger postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:](NFExceptionsCALogger, "postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:", 1, -[_NFReaderSession _getTagTypeFromTag:](self, "_getTagTypeFromTag:", v95), (self->_pollingConfig >> 12) & 1, objc_msgSend(v57, "code"));
      sub_10020CAC8((uint64_t)NFDailyStatisticsCALogger, CFSTR("readerModeConnectErrorCount"));
      v77 = sub_100226308((uint64_t)NFTagReadCALogger);
      v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
      sub_1002269C8((uint64_t)v78, v57);

      if (objc_msgSend(v95, "type"))
        v79 = objc_msgSend(v95, "type");
      else
        v79 = sub_10017E740((uint64_t)self->_driverWrapper, v95);
      v80 = v79;
      v81 = sub_100226308((uint64_t)NFTagReadCALogger);
      v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
      sub_100226434((uint64_t)v82, v95, v80);

      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "domain"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (objc_msgSend(v83, "isEqualToString:", v84))
      {
        v85 = objc_msgSend(v57, "code");

        if (v85 == (id)32)
        {
          -[_NFXPCSession endSession:](self, "endSession:", 0);
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
          v87 = objc_alloc((Class)NSError);
          v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v97 = NSLocalizedDescriptionKey;
          v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
          v98 = v89;
          v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1));
          v91 = objc_msgSend(v87, "initWithDomain:code:userInfo:", v88, 32, v90);
          objc_msgSend(v86, "didTerminate:", v91);

        }
      }
      else
      {

      }
    }
    else
    {
      objc_storeStrong((id *)&self->_currentTag, a3);
      ((void (**)(id, id, id))v94)[2](v94, v66, 0);
      v57 = 0;
      ++self->_totalTagRead;
      self->_uiStateOnInvalidation = 1;
    }

    v58 = v94;
    v59 = v95;
  }
  else
  {
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    if (v38)
    {
      v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      v41 = class_isMetaClass(v40);
      v42 = object_getClassName(self);
      v92 = sel_getName(a2);
      v43 = 45;
      if (v41)
        v43 = 43;
      v39(6, "%c[%{public}s %{public}s]:%i Missing required entitlements", v43, v42, v92, 739);
    }
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFSharedLogGetLogger(v44);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = object_getClass(self);
      if (class_isMetaClass(v47))
        v48 = 43;
      else
        v48 = 45;
      v49 = object_getClassName(self);
      v50 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v104 = v48;
      v105 = 2082;
      v106 = v49;
      v107 = 2082;
      v108 = v50;
      v109 = 1024;
      v110 = 739;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing required entitlements", buf, 0x22u);
    }

    v51 = objc_alloc((Class)NSError);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v101[0] = NSLocalizedDescriptionKey;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v102[0] = v53;
    v102[1] = &off_100300EA8;
    v101[1] = CFSTR("Line");
    v101[2] = CFSTR("Method");
    v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v102[2] = v54;
    v101[3] = NSDebugDescriptionErrorKey;
    v55 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 740);
    v102[3] = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v102, v101, 4));
    v57 = objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 32, v56);

    v58 = v94;
    v94[2](v94, 0, v57);
    v59 = v95;
    +[NFExceptionsCALogger postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:](NFExceptionsCALogger, "postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:", 1, -[_NFReaderSession _getTagTypeFromTag:](self, "_getTagTypeFromTag:", v95), (self->_pollingConfig >> 12) & 1, objc_msgSend(v57, "code"));
  }

}

- (void)connect:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A4810;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (id)_disconnectWithCardRemoval:(BOOL)a3
{
  NFTag *currentTag;
  _BOOL8 v5;
  unsigned int v6;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unsigned int v27;
  id v28;
  void *v29;
  unsigned int v30;
  NFTag *v31;
  id v32;
  uint64_t v33;
  int v34;
  id v35;
  const char *Name;
  NSErrorUserInfoKey v38;
  void *v39;
  NSErrorUserInfoKey v40;
  void *v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;

  currentTag = self->_currentTag;
  if (!currentTag)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Invalid tag state", v14, ClassName, Name, 820);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      *(_DWORD *)buf = 67109890;
      v43 = v19;
      v44 = 2082;
      v45 = object_getClassName(self);
      v46 = 2082;
      v47 = sel_getName(a2);
      v48 = 1024;
      v49 = 820;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag state", buf, 0x22u);
    }

    v20 = objc_alloc((Class)NSError);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v40 = NSLocalizedDescriptionKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v41 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v24 = v20;
    v25 = v21;
    v26 = 12;
    goto LABEL_20;
  }
  v5 = a3;
  if (-[NFTag type](currentTag, "type"))
    v6 = -[NFTag type](self->_currentTag, "type");
  else
    v6 = sub_10017E740((uint64_t)self->_driverWrapper, self->_currentTag);
  v27 = v6;
  v28 = sub_100226308((uint64_t)NFTagReadCALogger);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  sub_100226434((uint64_t)v29, self->_currentTag, v27);

  v30 = sub_10017EF78(self->_driverWrapper, self->_currentTag, v5);
  v31 = self->_currentTag;
  self->_currentTag = 0;

  if (v30)
  {
    v32 = objc_alloc((Class)NSError);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v33 = v30;
    v38 = NSLocalizedDescriptionKey;
    if (v30 >= 0x47)
      v34 = 71;
    else
      v34 = v30;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v34]));
    v39 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v24 = v32;
    v25 = v21;
    v26 = v33;
LABEL_20:
    v35 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, v26, v23);

    return v35;
  }
  return 0;
}

- (void)disconnectWithCardRemoval:(BOOL)a3 completion:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  BOOL v14;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_NFReaderSession;
  v8 = -[_NFSession workQueue](&v15, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A4EFC;
  v11[3] = &unk_1002E7E90;
  v12 = v7;
  v13 = a2;
  v11[4] = self;
  v14 = a3;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)_sync_transceive:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, NFTag *, _QWORD, id);
  id v9;
  unsigned int v10;
  NFServiceWhitelistChecker *tagWhiteList;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _BOOL8 v29;
  _QWORD *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NFDriverWrapper *driverWrapper;
  NFTag *currentTag;
  double v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  char *v47;
  void *v48;
  uint64_t v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  objc_class *v58;
  int v59;
  const char *v60;
  const char *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  char *v68;
  unsigned int v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  NFTag *v74;
  void *v75;
  uint64_t v76;
  void (*v77)(uint64_t, const char *, ...);
  objc_class *v78;
  _BOOL4 v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  const char *v94;
  const char *Name;
  const char *v96;
  const char *v97;
  const char *sel;
  id v99;
  id v100;
  _QWORD v101[5];
  void (**v102)(id, NFTag *, _QWORD, id);
  char v103;
  NSErrorUserInfoKey v104;
  void *v105;
  uint8_t buf[4];
  _BYTE v107[24];
  __int16 v108;
  int v109;
  __int16 v110;
  id v111;
  NSErrorUserInfoKey v112;
  void *v113;
  NSErrorUserInfoKey v114;
  void *v115;

  v7 = a3;
  v8 = (void (**)(id, NFTag *, _QWORD, id))a4;
  v9 = v7;
  v10 = -[_NFReaderSession _isCoreNFCSession](self, "_isCoreNFCSession");
  tagWhiteList = self->_tagWhiteList;
  if (v10)
  {
    if ((-[NFServiceWhitelistChecker nfcTagReaderAccess](tagWhiteList, "nfcTagReaderAccess") & 1) == 0
      && (-[NFServiceWhitelistChecker nfcISO15693ReaderAccess](self->_tagWhiteList, "nfcISO15693ReaderAccess") & 1) == 0&& (-[NFServiceWhitelistChecker nfcVASReaderAccess](self->_tagWhiteList, "nfcVASReaderAccess") & 1) == 0)
    {
      goto LABEL_5;
    }
  }
  else if ((-[NFServiceWhitelistChecker internalAccess](tagWhiteList, "internalAccess") & 1) == 0)
  {
LABEL_5:
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i Invalid entitlement configuration.", v18, ClassName, Name, 870);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v107 = v23;
      *(_WORD *)&v107[4] = 2082;
      *(_QWORD *)&v107[6] = object_getClassName(self);
      *(_WORD *)&v107[14] = 2082;
      *(_QWORD *)&v107[16] = sel_getName(a2);
      v108 = 1024;
      v109 = 870;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlement configuration.", buf, 0x22u);
    }

    v24 = objc_alloc((Class)NSError);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v114 = NSLocalizedDescriptionKey;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v115 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1));
    v28 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 32, v27);

    v8[2](v8, self->_currentTag, 0, v28);
    +[NFExceptionsCALogger postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:](NFExceptionsCALogger, "postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:", 3, -[_NFReaderSession _getTagTypeFromTag:](self, "_getTagTypeFromTag:", self->_currentTag), (self->_pollingConfig >> 12) & 1, objc_msgSend(v28, "code"));
    sub_10020CAC8((uint64_t)NFDailyStatisticsCALogger, CFSTR("readerModeTransceiveErrorCount"));
    goto LABEL_77;
  }
  v103 = 0;
  v29 = -[_NFReaderSession _isCoreNFCSession](self, "_isCoreNFCSession");
  if (v29)
  {
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_1001A5F48;
    v101[3] = &unk_1002EA8C8;
    v101[4] = self;
    v102 = v8;
    v30 = objc_retainBlock(v101);
    if (-[NFTag type](self->_currentTag, "type") == 8)
    {
      v31 = -[_NFReaderSession _validateISO15693Packet:](self, "_validateISO15693Packet:", v9);
      if ((_DWORD)v31)
      {
LABEL_19:
        ((void (*)(_QWORD *, uint64_t))v30[2])(v30, v31);
LABEL_25:

        v28 = 0;
        goto LABEL_77;
      }
    }
    else if (-[NFTag type](self->_currentTag, "type") == 3
           || -[NFTag type](self->_currentTag, "type") == 6)
    {
      v32 = objc_msgSend(objc_alloc((Class)NFCommandAPDU), "initWithData:", v9);
      v33 = -[_NFReaderSession _validateAPDU:outCheckFciResponse:](self, "_validateAPDU:outCheckFciResponse:", v32, &v103);
      if ((_DWORD)v33)
      {
        ((void (*)(_QWORD *, uint64_t))v30[2])(v30, v33);

        goto LABEL_25;
      }

    }
    else if (-[NFTag type](self->_currentTag, "type") == 7)
    {
      v31 = -[_NFReaderSession _validateFelicaCommand:](self, "_validateFelicaCommand:", v9);
      if ((_DWORD)v31)
        goto LABEL_19;
    }

  }
  if (self->_currentTag)
  {
    v34 = NFSharedSignpostLog(v29);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TRANSCEIVE", ", buf, 2u);
    }
    sel = a2;

    driverWrapper = self->_driverWrapper;
    currentTag = self->_currentTag;
    -[NFServiceWhitelistChecker sessionTimeLimit](self->_tagWhiteList, "sessionTimeLimit");
    v100 = 0;
    v39 = sub_1001847DC(driverWrapper, v9, currentTag, &v100, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v28 = v100;
    v41 = NFSharedSignpostLog(v28);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_signpost_enabled(v42))
    {
      v43 = objc_msgSend(v9, "length");
      v44 = objc_msgSend(v40, "length");
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)v107 = v43;
      *(_WORD *)&v107[8] = 2050;
      *(_QWORD *)&v107[10] = v44;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TRANSCEIVE", "send=%{public,signpost.description:attribute}lu, receive=%{public,signpost.description:attribute}lu", buf, 0x16u);
    }

    v45 = objc_msgSend(v28, "code");
    if (v9)
    {
      v46 = objc_msgSend(v9, "length");
      if (v40)
      {
LABEL_37:
        v47 = (char *)objc_msgSend(v40, "length");
LABEL_50:
        v66 = sub_100226308((uint64_t)NFTagReadCALogger);
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (v67 && *(_QWORD *)(v67 + 40))
        {
          ++*(_DWORD *)(v67 + 24);
          v68 = &v47[*(_QWORD *)(v67 + 16)];
          *(_QWORD *)(v67 + 8) += v46;
          *(_QWORD *)(v67 + 16) = v68;
        }

        if ((-[NFServiceWhitelistChecker internalAccess](self->_tagWhiteList, "internalAccess") & 1) == 0
          && -[NFTag type](self->_currentTag, "type") == 7)
        {
          v99 = 0;
          v69 = -[_NFReaderSession _isFelicaPollingCommand:systemCode:](self, "_isFelicaPollingCommand:systemCode:", v9, &v99);
          v70 = v99;
          if (v69 && (unint64_t)objc_msgSend(v40, "length") >= 0x12)
          {
            v71 = objc_msgSend(objc_alloc((Class)NFTagInternal), "initWithNFTag:", self->_currentTag);
            objc_msgSend(v71, "_setSystemCode:", v70);
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "subdataWithRange:", 2, 8));
            objc_msgSend(v71, "_setIDm:", v72);

            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "subdataWithRange:", 10, 8));
            objc_msgSend(v71, "_setPMm:", v73);

            v74 = self->_currentTag;
            self->_currentTag = (NFTag *)v71;

          }
        }
        if (v45 == (id)64)
          goto LABEL_63;
        if (-[NFTag type](self->_currentTag, "type") == 15
          || -[NFTag type](self->_currentTag, "type") == 16)
        {
          if (-[_NFReaderSession _validateMifareAPDU:response:](self, "_validateMifareAPDU:response:", v9, v40))
          {
LABEL_63:
            ((void (**)(id, NFTag *, void *, id))v8)[2](v8, self->_currentTag, v40, v28);
LABEL_76:

            goto LABEL_77;
          }
        }
        else if (!v103
               || -[_NFReaderSession validateAID:withSelectResponse:outRealAid:](self, "validateAID:withSelectResponse:outRealAid:", v9, v40, 0))
        {
          goto LABEL_63;
        }
        v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v76 = NFLogGetLogger(v75);
        if (v76)
        {
          v77 = (void (*)(uint64_t, const char *, ...))v76;
          v78 = object_getClass(self);
          v79 = class_isMetaClass(v78);
          v94 = object_getClassName(self);
          v97 = sel_getName(sel);
          v80 = 45;
          if (v79)
            v80 = 43;
          v77(3, "%c[%{public}s %{public}s]:%i Invalid AID selection: %{public}@, forcing disconnect", v80, v94, v97, 978, v9);
        }
        v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v82 = NFSharedLogGetLogger(v81);
        v83 = objc_claimAutoreleasedReturnValue(v82);
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          v84 = object_getClass(self);
          if (class_isMetaClass(v84))
            v85 = 43;
          else
            v85 = 45;
          v86 = object_getClassName(self);
          v87 = sel_getName(sel);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v107 = v85;
          *(_WORD *)&v107[4] = 2082;
          *(_QWORD *)&v107[6] = v86;
          *(_WORD *)&v107[14] = 2082;
          *(_QWORD *)&v107[16] = v87;
          v108 = 1024;
          v109 = 978;
          v110 = 2114;
          v111 = v9;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AID selection: %{public}@, forcing disconnect", buf, 0x2Cu);
        }

        v88 = -[_NFReaderSession _disconnectWithCardRemoval:](self, "_disconnectWithCardRemoval:", 0);
        v89 = objc_alloc((Class)NSError);
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v104 = NSLocalizedDescriptionKey;
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
        v105 = v91;
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
        v93 = objc_msgSend(v89, "initWithDomain:code:userInfo:", v90, 32, v92);
        v8[2](v8, 0, 0, v93);

        +[NFExceptionsCALogger postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:](NFExceptionsCALogger, "postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:", 3, -[_NFReaderSession _getTagTypeFromTag:](self, "_getTagTypeFromTag:", self->_currentTag), (self->_pollingConfig >> 12) & 1, 8);
        sub_10020CAC8((uint64_t)NFDailyStatisticsCALogger, CFSTR("readerModeTransceiveErrorCount"));
        goto LABEL_76;
      }
    }
    else
    {
      v46 = 0;
      if (v40)
        goto LABEL_37;
    }
    v47 = 0;
    goto LABEL_50;
  }
  v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v49 = NFLogGetLogger(v48);
  if (v49)
  {
    v50 = (void (*)(uint64_t, const char *, ...))v49;
    v51 = object_getClass(self);
    v52 = class_isMetaClass(v51);
    v53 = object_getClassName(self);
    v96 = sel_getName(a2);
    v54 = 45;
    if (v52)
      v54 = 43;
    v50(3, "%c[%{public}s %{public}s]:%i No tag is connected", v54, v53, v96, 938);
  }
  v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v56 = NFSharedLogGetLogger(v55);
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
  {
    v58 = object_getClass(self);
    if (class_isMetaClass(v58))
      v59 = 43;
    else
      v59 = 45;
    v60 = object_getClassName(self);
    v61 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v107 = v59;
    *(_WORD *)&v107[4] = 2082;
    *(_QWORD *)&v107[6] = v60;
    *(_WORD *)&v107[14] = 2082;
    *(_QWORD *)&v107[16] = v61;
    v108 = 1024;
    v109 = 938;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No tag is connected", buf, 0x22u);
  }

  v62 = objc_alloc((Class)NSError);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v112 = NSLocalizedDescriptionKey;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Not Found"));
  v113 = v64;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
  v28 = objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 28, v65);

  v8[2](v8, self->_currentTag, 0, v28);
LABEL_77:

}

- (void)transceive:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A629C;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)checkNdefSupportWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A6630;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)ndefReadWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A6D7C;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)ndefWrite:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A7AA8;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)formatNdefWithKey:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A88A8;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)checkPresenceWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A9124;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)_updateReaderSettingsBasedOnConfig:(unint64_t)a3
{
  unint64_t sessionConfig;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  NSMutableOrderedSet *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  void *v55;
  uint64_t v56;
  void (*v57)(uint64_t, const char *, ...);
  objc_class *v58;
  _BOOL4 v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  id v69;
  void *v70;
  const char *Name;
  const char *v72;
  const char *v73;
  const char *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  int v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  int v88;

  sessionConfig = self->_sessionConfig;
  if ((sessionConfig & 0x400) != 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i PACE support declared by SessionConfig", v12, ClassName, Name, 1210);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      *(_DWORD *)buf = 67109890;
      v82 = v17;
      v83 = 2082;
      v84 = object_getClassName(self);
      v85 = 2082;
      v86 = sel_getName(a2);
      v87 = 1024;
      v88 = 1210;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE support declared by SessionConfig", buf, 0x22u);
    }

  }
  v18 = (sessionConfig >> 10) & 1;
  v19 = (a3 & 8) != 0 || a3 == 1;
  v20 = !v19;
  if (v19)
  {
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFLogGetLogger(v21);
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v26 = object_getClassName(self);
      v72 = sel_getName(a2);
      v27 = 45;
      if (v25)
        v27 = 43;
      v23(6, "%c[%{public}s %{public}s]:%i Polling options are PACE compatible", v27, v26, v72, 1217);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v82 = v32;
      v83 = 2082;
      v84 = v33;
      v85 = 2082;
      v86 = v34;
      v87 = 1024;
      v88 = 1217;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Polling options are PACE compatible", buf, 0x22u);
    }

  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v35 = self->_iso7816AppList;
  v36 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v77 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v40, "type") == (id)2)
        {
          if (((v20 | v18) & 1) == 0)
          {
            v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v42 = NFLogGetLogger(v41);
            if (v42)
            {
              v43 = (void (*)(uint64_t, const char *, ...))v42;
              v44 = object_getClass(self);
              v45 = class_isMetaClass(v44);
              v46 = object_getClassName(self);
              v73 = sel_getName(a2);
              v47 = 45;
              if (v45)
                v47 = 43;
              v43(6, "%c[%{public}s %{public}s]:%i PACE support enabled by polling compatibility and AID list in app", v47, v46, v73, 1223);
            }
            v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v49 = NFSharedLogGetLogger(v48);
            v50 = objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = object_getClass(self);
              if (class_isMetaClass(v51))
                v52 = 43;
              else
                v52 = 45;
              v53 = object_getClassName(self);
              v54 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v82 = v52;
              v83 = 2082;
              v84 = v53;
              v85 = 2082;
              v86 = v54;
              v87 = 1024;
              v88 = 1223;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE support enabled by polling compatibility and AID list in app", buf, 0x22u);
            }

            LODWORD(v18) = 1;
          }
        }
        else if (objc_msgSend(v40, "type") == (id)3)
        {
          self->_sessionConfig |= 0x100uLL;
        }
      }
      v37 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v37);
  }

  if ((v18 & 1) != 0)
  {
    v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v56 = NFLogGetLogger(v55);
    if (v56)
    {
      v57 = (void (*)(uint64_t, const char *, ...))v56;
      v58 = object_getClass(self);
      v59 = class_isMetaClass(v58);
      v60 = object_getClassName(self);
      v74 = sel_getName(a2);
      v61 = 45;
      if (v59)
        v61 = 43;
      v57(6, "%c[%{public}s %{public}s]:%i Enabling dynamic bba for PACE", v61, v60, v74, 1235);
    }
    v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = NFSharedLogGetLogger(v62);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = object_getClass(self);
      if (class_isMetaClass(v65))
        v66 = 43;
      else
        v66 = 45;
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v82 = v66;
      v83 = 2082;
      v84 = v67;
      v85 = 2082;
      v86 = v68;
      v87 = 1024;
      v88 = 1235;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling dynamic bba for PACE", buf, 0x22u);
    }

    v69 = sub_1001CBBE8(self->_driverWrapper, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue(v69);

    if (!v70)
      self->_didEnableDynamicBBA = 1;
  }
}

- (void)_sync_startPollingForTags:(unint64_t)a3 sessionConfig:(unint64_t)a4 completion:(id)a5
{
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  _NFReaderSession *v14;
  const char *Name;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  unint64_t v28;
  const char *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *v37;
  _BOOL4 v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void (**v44)(_QWORD, _QWORD);
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  id v49;
  void *v50;
  void *v51;
  void **v52;
  NSErrorUserInfoKey *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  unsigned __int8 v59;
  _BOOL4 vasECP;
  void *v61;
  uint64_t v62;
  void (*v63)(uint64_t, const char *, ...);
  objc_class *v64;
  _BOOL4 v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  unsigned int v75;
  void *v76;
  uint64_t v77;
  void (*v78)(uint64_t, const char *, ...);
  objc_class *v79;
  _BOOL4 v80;
  unint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  objc_class *v87;
  unint64_t v88;
  int v89;
  const char *v90;
  const char *v91;
  char v92;
  objc_class *v93;
  _BOOL4 v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  NSObject *v99;
  objc_class *v100;
  unint64_t v101;
  int v102;
  const char *v103;
  const char *v104;
  _QWORD *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void (*v109)(uint64_t, const char *, ...);
  objc_class *v110;
  _BOOL4 v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  NSObject *v116;
  objc_class *v117;
  int v118;
  const char *v119;
  const char *v120;
  id v121;
  void **v122;
  NSErrorUserInfoKey *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void (*v128)(uint64_t, const char *, ...);
  objc_class *v129;
  _BOOL4 v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  NSObject *v135;
  objc_class *v136;
  int v137;
  const char *v138;
  const char *v139;
  const char *v140;
  const char *v141;
  const char *v142;
  const char *v143;
  const char *v144;
  const char *v145;
  const char *v146;
  const char *v147;
  const char *v148;
  const char *v149;
  id v150;
  _NFReaderSession *v151;
  id v152;
  unint64_t v153;
  _QWORD v155[5];
  id v156;
  id v157;
  SEL v158;
  _QWORD v159[8];
  char v160;
  NSErrorUserInfoKey v161;
  void *v162;
  NSErrorUserInfoKey v163;
  void *v164;
  NSErrorUserInfoKey v165;
  void *v166;
  NSErrorUserInfoKey v167;
  void *v168;
  uint8_t buf[4];
  int v170;
  __int16 v171;
  const char *v172;
  __int16 v173;
  const char *v174;
  __int16 v175;
  int v176;
  __int16 v177;
  void *v178;
  __int16 v179;
  unsigned int v180;
  __int16 v181;
  void *v182;

  v152 = a5;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v153 = a4;
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v14 = self;
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](v14, "clientName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](v14, "connection"));
    v18 = a3;
    v19 = objc_msgSend(v17, "processIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](v14, "sessionUID"));
    v150 = v19;
    a3 = v18;
    v143 = Name;
    self = v14;
    v21 = 43;
    if (!isMetaClass)
      v21 = 45;
    v140 = ClassName;
    a4 = v153;
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v21, v140, v143, 1244, v16, v150, v20);

  }
  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v23 = NFSharedLogGetLogger(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    v27 = object_getClassName(self);
    v28 = a3;
    v29 = sel_getName(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v32 = objc_msgSend(v31, "processIdentifier");
    v151 = self;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110658;
    v170 = v26;
    v171 = 2082;
    v172 = v27;
    v173 = 2082;
    v174 = v29;
    a3 = v28;
    v175 = 1024;
    v176 = 1244;
    v177 = 2114;
    v178 = v30;
    v179 = 1024;
    v180 = v32;
    v181 = 2114;
    v182 = v33;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);

    self = v151;
    a4 = v153;

  }
  self->_pollingConfig = 0;
  if (a4 & 0xFFFFFFFFFFFFF380 | a3 & 0xFFFFFFFFFFFFFFE2)
  {
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v35 = NFLogGetLogger(v34);
    if (v35)
    {
      v36 = (void (*)(uint64_t, const char *, ...))v35;
      v37 = object_getClass(self);
      v38 = class_isMetaClass(v37);
      v39 = object_getClassName(self);
      v144 = sel_getName(a2);
      v40 = 45;
      if (v38)
        v40 = 43;
      v36(4, "%c[%{public}s %{public}s]:%i Invalid parameters", v40, v39, v144, 1251);
    }
    v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = NFSharedLogGetLogger(v41);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    v44 = (void (**)(_QWORD, _QWORD))v152;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v45 = object_getClass(self);
      if (class_isMetaClass(v45))
        v46 = 43;
      else
        v46 = 45;
      v47 = object_getClassName(self);
      v48 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v170 = v46;
      v171 = 2082;
      v172 = v47;
      v173 = 2082;
      v174 = v48;
      v175 = 1024;
      v176 = 1251;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid parameters", buf, 0x22u);
    }

    v49 = objc_alloc((Class)NSError);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v167 = NSLocalizedDescriptionKey;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v168 = v51;
    v52 = &v168;
    v53 = &v167;
LABEL_21:
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v53, 1));
    v55 = v49;
    v56 = v50;
    v57 = 10;
LABEL_22:
    v58 = objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, v57, v54);
    ((void (**)(_QWORD, id))v44)[2](v44, v58);

    goto LABEL_99;
  }
  v59 = -[_NFReaderSession _isCoreNFCSession](self, "_isCoreNFCSession");
  if (a3 != 1
    || (v59 & 1) != 0
    || !-[NFServiceWhitelistChecker internalAccess](self->_tagWhiteList, "internalAccess"))
  {
    if (!-[_NFReaderSession _isCoreNFCSession](self, "_isCoreNFCSession"))
      goto LABEL_69;
    if ((a3 & 4) != 0
      && ((a4 & 0x20) != 0
       && (-[NFServiceWhitelistChecker nfcISO15693ReaderAccess](self->_tagWhiteList, "nfcISO15693ReaderAccess") & 1) != 0|| -[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess")))
    {
      self->_pollingConfig |= 8u;
    }
    if ((a4 & 0x400) != 0)
    {
      v75 = -[NFServiceWhitelistChecker nfcTagReaderPACEPollingAllow](self->_tagWhiteList, "nfcTagReaderPACEPollingAllow");
      if ((a3 & 8) == 0)
        goto LABEL_51;
    }
    else
    {
      v75 = 1;
      if ((a3 & 8) == 0)
        goto LABEL_51;
    }
    if (-[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess") && v75)
      self->_pollingConfig |= 3u;
LABEL_51:
    if ((a3 & 0x10) != 0
      && -[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess"))
    {
      if (!-[NSMutableArray count](self->_feliCaSystemCodeList, "count"))
      {
        v126 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v127 = NFLogGetLogger(v126);
        if (v127)
        {
          v128 = (void (*)(uint64_t, const char *, ...))v127;
          v129 = object_getClass(self);
          v130 = class_isMetaClass(v129);
          v131 = object_getClassName(self);
          v149 = sel_getName(a2);
          v132 = 45;
          if (v130)
            v132 = 43;
          v128(6, "%c[%{public}s %{public}s]:%i \"com.apple.developer.nfc.readersession.felica.systemcodes\" must contain at least 1 valid entry", v132, v131, v149, 1298);
        }
        v133 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v134 = NFSharedLogGetLogger(v133);
        v135 = objc_claimAutoreleasedReturnValue(v134);
        v44 = (void (**)(_QWORD, _QWORD))v152;
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          v136 = object_getClass(self);
          if (class_isMetaClass(v136))
            v137 = 43;
          else
            v137 = 45;
          v138 = object_getClassName(self);
          v139 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v170 = v137;
          v171 = 2082;
          v172 = v138;
          v173 = 2082;
          v174 = v139;
          v175 = 1024;
          v176 = 1298;
          _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i \"com.apple.developer.nfc.readersession.felica.systemcodes\" must contain at least 1 valid entry", buf, 0x22u);
        }

        v121 = objc_alloc((Class)NSError);
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v163 = NSLocalizedDescriptionKey;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
        v164 = v51;
        v122 = &v164;
        v123 = &v163;
        goto LABEL_96;
      }
      self->_pollingConfig |= 4u;
    }
    self->_sessionConfig = a4;
    -[_NFReaderSession _updateReaderSettingsBasedOnConfig:](self, "_updateReaderSettingsBasedOnConfig:", a3);
    if ((a3 & 8) != 0
      && (self->_sessionConfig & 8) != 0
      && ((-[NFServiceWhitelistChecker internalAccess](self->_tagWhiteList, "internalAccess") & 1) != 0
       || -[NFServiceWhitelistChecker nfcVASReaderAccess](self->_tagWhiteList, "nfcVASReaderAccess")))
    {
      self->_pollingConfig |= 0x10u;
      v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v77 = NFLogGetLogger(v76);
      if (v77)
      {
        v78 = (void (*)(uint64_t, const char *, ...))v77;
        v79 = object_getClass(self);
        v80 = class_isMetaClass(v79);
        v81 = a3;
        v82 = object_getClassName(self);
        v146 = sel_getName(a2);
        v83 = 45;
        if (v80)
          v83 = 43;
        v141 = v82;
        a3 = v81;
        v78(6, "%c[%{public}s %{public}s]:%i Enabling VAS polling", v83, v141, v146, 1313);
      }
      v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v85 = NFSharedLogGetLogger(v84);
      v86 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        v87 = object_getClass(self);
        v88 = a3;
        if (class_isMetaClass(v87))
          v89 = 43;
        else
          v89 = 45;
        v90 = object_getClassName(self);
        v91 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v170 = v89;
        a3 = v88;
        v171 = 2082;
        v172 = v90;
        v173 = 2082;
        v174 = v91;
        v175 = 1024;
        v176 = 1313;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling VAS polling", buf, 0x22u);
      }

      v92 = 1;
      goto LABEL_83;
    }
LABEL_69:
    v92 = 0;
    goto LABEL_83;
  }
  self->_pollingConfig = 15;
  vasECP = self->_vasECP;
  if (self->_pollingProfile == 4)
  {
    v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v62 = NFLogGetLogger(v61);
    v63 = (void (*)(uint64_t, const char *, ...))v62;
    if (vasECP)
    {
      if (v62)
      {
        v64 = object_getClass(self);
        v65 = class_isMetaClass(v64);
        v66 = object_getClassName(self);
        v145 = sel_getName(a2);
        v67 = 45;
        if (v65)
          v67 = 43;
        v63(6, "%c[%{public}s %{public}s]:%i Can't use ECP and non ecp profile", v67, v66, v145, 1264);
      }
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFSharedLogGetLogger(v68);
      v70 = objc_claimAutoreleasedReturnValue(v69);
      v44 = (void (**)(_QWORD, _QWORD))v152;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = object_getClass(self);
        if (class_isMetaClass(v71))
          v72 = 43;
        else
          v72 = 45;
        v73 = object_getClassName(self);
        v74 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v170 = v72;
        v171 = 2082;
        v172 = v73;
        v173 = 2082;
        v174 = v74;
        v175 = 1024;
        v176 = 1264;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Can't use ECP and non ecp profile", buf, 0x22u);
      }

      v49 = objc_alloc((Class)NSError);
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v165 = NSLocalizedDescriptionKey;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
      v166 = v51;
      v52 = &v166;
      v53 = &v165;
      goto LABEL_21;
    }
    if (v62)
    {
      v93 = object_getClass(self);
      v94 = class_isMetaClass(v93);
      v95 = object_getClassName(self);
      v147 = sel_getName(a2);
      v96 = 45;
      if (v94)
        v96 = 43;
      v142 = v95;
      a3 = 1;
      v63(6, "%c[%{public}s %{public}s]:%i Using non ecp polling", v96, v142, v147, 1268);
    }
    v97 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v98 = NFSharedLogGetLogger(v97);
    v99 = objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      v100 = object_getClass(self);
      v101 = a3;
      if (class_isMetaClass(v100))
        v102 = 43;
      else
        v102 = 45;
      v103 = object_getClassName(self);
      v104 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v170 = v102;
      a3 = v101;
      v171 = 2082;
      v172 = v103;
      v173 = 2082;
      v174 = v104;
      v175 = 1024;
      v176 = 1268;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using non ecp polling", buf, 0x22u);
    }

    sub_1001CB354(self->_driverWrapper, self->_pollingProfile);
  }
  else if (self->_vasECP)
  {
    self->_pollingConfig = 31;
  }
  v92 = 0;
  self->_sessionConfig = a4 | 1;
LABEL_83:
  if (!self->_pollingConfig)
  {
    v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v108 = NFLogGetLogger(v107);
    if (v108)
    {
      v109 = (void (*)(uint64_t, const char *, ...))v108;
      v110 = object_getClass(self);
      v111 = class_isMetaClass(v110);
      v112 = object_getClassName(self);
      v148 = sel_getName(a2);
      v113 = 45;
      if (v111)
        v113 = 43;
      v109(6, "%c[%{public}s %{public}s]:%i Missing required entitlements", v113, v112, v148, 1328);
    }
    v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v115 = NFSharedLogGetLogger(v114);
    v116 = objc_claimAutoreleasedReturnValue(v115);
    v44 = (void (**)(_QWORD, _QWORD))v152;
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      v117 = object_getClass(self);
      if (class_isMetaClass(v117))
        v118 = 43;
      else
        v118 = 45;
      v119 = object_getClassName(self);
      v120 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v170 = v118;
      v171 = 2082;
      v172 = v119;
      v173 = 2082;
      v174 = v120;
      v175 = 1024;
      v176 = 1328;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing required entitlements", buf, 0x22u);
    }

    v121 = objc_alloc((Class)NSError);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v161 = NSLocalizedDescriptionKey;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v162 = v51;
    v122 = &v162;
    v123 = &v161;
LABEL_96:
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v122, v123, 1));
    v55 = v121;
    v56 = v50;
    v57 = 32;
    goto LABEL_22;
  }
  v159[0] = _NSConcreteStackBlock;
  v159[1] = 3221225472;
  v159[2] = sub_1001AAE8C;
  v159[3] = &unk_1002EA8F0;
  v159[4] = self;
  v159[5] = a2;
  v159[6] = a3;
  v159[7] = a4;
  v160 = v92;
  v105 = objc_retainBlock(v159);
  v106 = v105;
  if (self->_uiService)
  {
    v155[0] = _NSConcreteStackBlock;
    v155[1] = 3221225472;
    v155[2] = sub_1001AB3F4;
    v155[3] = &unk_1002E61C8;
    v155[4] = self;
    v158 = a2;
    v44 = (void (**)(_QWORD, _QWORD))v152;
    v156 = v152;
    v157 = v106;
    -[_NFReaderSession activateUIControllerWithCompletion:](self, "activateUIControllerWithCompletion:", v155);

  }
  else
  {
    v124 = ((uint64_t (*)(_QWORD *))v105[2])(v105);
    v125 = (void *)objc_claimAutoreleasedReturnValue(v124);
    v44 = (void (**)(_QWORD, _QWORD))v152;
    (*((void (**)(id, void *))v152 + 2))(v152, v125);

  }
LABEL_99:

}

- (void)_sync_setECPPayload:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  unsigned __int8 v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  const char *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  NSErrorUserInfoKey v43;
  void *v44;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v10 = objc_msgSend(v9, "configureECPPolling:", v7);

  if ((v10 & 1) != 0)
  {
    if (-[_NFReaderSession _isPayloadConnectionHandover:](self, "_isPayloadConnectionHandover:", v7))
      self->_isConnectionHandover = 1;
    self->_vasECP = objc_msgSend(v7, "length") != 0;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      if (self->_vasECP)
        v18 = "VAS ECP set";
      else
        v18 = "VAS ECP not set";
      v19 = 45;
      if (isMetaClass)
        v19 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i %s", v19, ClassName, Name, 1407, v18);
    }
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFSharedLogGetLogger(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = object_getClass(self);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      v25 = object_getClassName(self);
      v26 = sel_getName(a2);
      v27 = "VAS ECP not set";
      if (self->_vasECP)
        v27 = "VAS ECP set";
      *(_DWORD *)buf = 67110146;
      v34 = v24;
      v35 = 2082;
      v36 = v25;
      v37 = 2082;
      v38 = v26;
      v39 = 1024;
      v40 = 1407;
      v41 = 2080;
      v42 = v27;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s", buf, 0x2Cu);
    }

    v8[2](v8, 0);
  }
  else
  {
    self->_vasECP = 0;
    self->_isConnectionHandover = 0;
    v28 = objc_alloc((Class)NSError);
    v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v43 = NSLocalizedDescriptionKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v44 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v32 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 15, v31);
    ((void (**)(id, id))v8)[2](v8, v32);

    v8 = (void (**)(id, _QWORD))v29;
  }

}

- (void)setECPPayload:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001ABA78;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (BOOL)_isPayloadConnectionHandover:(id)a3
{
  _BYTE *v3;
  BOOL v4;
  BOOL v5;

  v3 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v4 = *v3 == 106 && v3[1] == 2;
  v5 = v3[3] == 5 && !v3[4] && v3[5] == 1;
  return v4 && v5;
}

- (void)startPollingForTags:(unint64_t)a3 sessionConfig:(unint64_t)a4 completion:(id)a5
{
  id v9;
  OS_dispatch_queue *v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  SEL v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v18;

  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_NFReaderSession;
  v10 = -[_NFSession workQueue](&v18, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001ABE80;
  block[3] = &unk_1002EA918;
  block[4] = self;
  v14 = v9;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v12 = v9;
  dispatch_async(v11, block);

}

- (void)skipMifareClassificationWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AC20C;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)startPollingWithConfig:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001AC6BC;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_sync_startPollingWithConfig:(id)a3 completion:(id)a4
{
  id v7;
  int v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  const char *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void (*v57)(uint64_t, const char *, ...);
  objc_class *v58;
  _BOOL4 v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  id v69;
  id v70;
  void (**v71)(id, id);
  id v72;
  id v73;
  void *v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  id WeakRetained;
  void *v79;
  uint64_t pollingProfile;
  void *v81;
  uint64_t v82;
  void (*v83)(uint64_t, const char *, ...);
  objc_class *v84;
  _BOOL4 v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  NSObject *v90;
  objc_class *v91;
  int v92;
  const char *v93;
  const char *v94;
  void *v95;
  uint64_t v96;
  void (*v97)(uint64_t, const char *, ...);
  objc_class *v98;
  _BOOL4 v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  objc_class *v105;
  int v106;
  const char *v107;
  const char *v108;
  void *v109;
  uint64_t v110;
  void (*v111)(uint64_t, const char *, ...);
  objc_class *v112;
  _BOOL4 v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  NSObject *v118;
  objc_class *v119;
  int v120;
  const char *v121;
  const char *v122;
  void *v123;
  uint64_t v124;
  void (*v125)(uint64_t, const char *, ...);
  objc_class *v126;
  _BOOL4 v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  NSObject *v132;
  objc_class *v133;
  int v134;
  const char *v135;
  const char *v136;
  void *v137;
  void *v138;
  id v139;
  _QWORD *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void (*v146)(uint64_t, const char *, ...);
  objc_class *v147;
  _BOOL4 v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  NSObject *v153;
  objc_class *v154;
  int v155;
  const char *v156;
  const char *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  const char *v163;
  const char *v164;
  const char *v165;
  const char *v166;
  const char *v167;
  const char *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void (**v173)(id, id);
  const char *sel;
  _QWORD v175[5];
  void (**v176)(id, id);
  id v177;
  const char *v178;
  _QWORD v179[5];
  id v180;
  id v181;
  id v182;
  const char *v183;
  uint64_t v184;
  NSErrorUserInfoKey v185;
  void *v186;
  NSErrorUserInfoKey v187;
  void *v188;
  NSErrorUserInfoKey v189;
  void *v190;
  uint8_t buf[4];
  int v192;
  __int16 v193;
  const char *v194;
  __int16 v195;
  const char *v196;
  __int16 v197;
  int v198;
  __int16 v199;
  void *v200;
  __int16 v201;
  unsigned int v202;
  __int16 v203;
  void *v204;
  __int16 v205;
  id v206;

  v7 = a3;
  v173 = (void (**)(id, id))a4;
  v8 = NFIsInternalBuild(v173);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v11 = (void (*)(uint64_t, const char *, ...))Logger;
  sel = a2;
  if (v8)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
      v18 = objc_msgSend(v17, "processIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v163 = Name;
      a2 = sel;
      v20 = 43;
      if (!isMetaClass)
        v20 = 45;
      v11(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@, config=%{public}@", v20, ClassName, v163, 1476, v16, v18, v19, v7);

    }
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFSharedLogGetLogger(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
      v30 = objc_msgSend(v29, "processIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      *(_DWORD *)buf = 67110914;
      v192 = v25;
      v193 = 2082;
      v194 = v26;
      v195 = 2082;
      v196 = v27;
      v197 = 1024;
      v198 = 1476;
      v199 = 2114;
      v200 = v28;
      v201 = 1024;
      v202 = v30;
      a2 = sel;
      v203 = 2114;
      v204 = v31;
      v205 = 2114;
      v206 = v7;
      v32 = "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@, config=%{public}@";
      v33 = v23;
      v34 = 70;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);

    }
  }
  else
  {
    if (Logger)
    {
      v35 = object_getClass(self);
      v36 = class_isMetaClass(v35);
      v37 = object_getClassName(self);
      v38 = sel_getName(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
      v41 = objc_msgSend(v40, "processIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v43 = 43;
      if (!v36)
        v43 = 45;
      v11(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v43, v37, v38, 1479, v39, v41, v42);

      a2 = sel;
    }
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFSharedLogGetLogger(v44);
    v23 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v46 = object_getClass(self);
      if (class_isMetaClass(v46))
        v47 = 43;
      else
        v47 = 45;
      v48 = object_getClassName(self);
      v49 = sel_getName(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
      v50 = objc_msgSend(v29, "processIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      *(_DWORD *)buf = 67110658;
      v192 = v47;
      v193 = 2082;
      v194 = v48;
      v195 = 2082;
      v196 = v49;
      v197 = 1024;
      v198 = 1479;
      v199 = 2114;
      v200 = v28;
      v201 = 1024;
      v202 = v50;
      a2 = sel;
      v203 = 2114;
      v204 = v31;
      v32 = "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@";
      v33 = v23;
      v34 = 60;
      goto LABEL_20;
    }
  }

  if ((-[NFServiceWhitelistChecker internalAccess](self->_tagWhiteList, "internalAccess") & 1) != 0)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_numberForKey:", CFSTR("tech")));
    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_numberForKey:", CFSTR("pollDuration")));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_dataForKey:", CFSTR("ecp")));
      v54 = v53;
      if (v53)
      {
        if (objc_msgSend(v53, "length"))
        {
          self->_vasECP = 1;
          self->_isConnectionHandover = -[_NFReaderSession _isPayloadConnectionHandover:](self, "_isPayloadConnectionHandover:", v54);
        }
        else
        {
          self->_vasECP = 0;
          self->_isConnectionHandover = 0;
        }
      }
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_numberForKey:", CFSTR("skipMifareClassify")));
      v70 = v74;
      if (v74)
        self->_skipMifareClassification = objc_msgSend(v74, "BOOLValue");
      v172 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_numberForKey:", CFSTR("lpcd")));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_numberForKey:", CFSTR("fd")));
      v171 = v75;
      if (v75)
      {
        v76 = objc_msgSend(v75, "BOOLValue");
        v77 = 2;
        if (!v76)
          v77 = 0;
      }
      else
      {
        v77 = 2;
      }
      v170 = v77;
      self->_pollOption = 1;
      self->_sessionConfig = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
      sub_10019E124((uint64_t)WeakRetained, self);

      v79 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
      objc_msgSend(v79, "notifyReaderModeActivityEnd");

      self->_pollingConfig = 0;
      if ((objc_msgSend(v51, "unsignedIntValue") & 1) != 0)
        self->_pollingConfig |= 1u;
      if ((objc_msgSend(v51, "unsignedIntValue") & 2) != 0)
        self->_pollingConfig |= 2u;
      v73 = (id)v172;
      if ((objc_msgSend(v51, "unsignedIntValue") & 4) != 0)
        self->_pollingConfig |= 4u;
      if ((objc_msgSend(v51, "unsignedIntValue") & 0x10) != 0)
        self->_pollingConfig |= 8u;
      if (self->_vasECP)
        self->_pollingConfig |= 0x10u;
      if (-[NFServiceWhitelistChecker pollingProfileUpdate](self->_tagWhiteList, "pollingProfileUpdate"))
      {
        pollingProfile = self->_pollingProfile;
        switch((int)pollingProfile)
        {
          case 0:
            goto LABEL_99;
          case 1:
            if ((self->_pollingConfig & 0x13) == 0)
            {
              v144 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v145 = NFLogGetLogger(v144);
              if (v145)
              {
                v146 = (void (*)(uint64_t, const char *, ...))v145;
                v147 = object_getClass(self);
                v148 = class_isMetaClass(v147);
                v149 = object_getClassName(self);
                v169 = sel_getName(sel);
                v150 = 45;
                if (v148)
                  v150 = 43;
                v146(3, "%c[%{public}s %{public}s]:%i Invalid technology for the specific polling profile", v150, v149, v169, 1535);
              }
              v151 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v152 = NFSharedLogGetLogger(v151);
              v153 = objc_claimAutoreleasedReturnValue(v152);
              if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
              {
                v154 = object_getClass(self);
                if (class_isMetaClass(v154))
                  v155 = 43;
                else
                  v155 = 45;
                v156 = object_getClassName(self);
                v157 = sel_getName(sel);
                *(_DWORD *)buf = 67109890;
                v192 = v155;
                v193 = 2082;
                v194 = v156;
                v195 = 2082;
                v196 = v157;
                v197 = 1024;
                v198 = 1535;
                _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid technology for the specific polling profile", buf, 0x22u);
              }

              v158 = objc_alloc((Class)NSError);
              v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
              v185 = NSLocalizedDescriptionKey;
              v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
              v186 = v160;
              v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1));
              v162 = objc_msgSend(v158, "initWithDomain:code:userInfo:", v159, 10, v161);
              v173[2](v173, v162);

              v73 = (id)v172;
              goto LABEL_104;
            }
            pollingProfile = 1;
LABEL_89:
            v123 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v124 = NFLogGetLogger(v123);
            if (v124)
            {
              v125 = (void (*)(uint64_t, const char *, ...))v124;
              v126 = object_getClass(self);
              v127 = class_isMetaClass(v126);
              v128 = object_getClassName(self);
              v168 = sel_getName(sel);
              v129 = 45;
              if (v127)
                v129 = 43;
              v125(6, "%c[%{public}s %{public}s]:%i pollingProfile=%u", v129, v128, v168, 1552, pollingProfile);
            }
            v130 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v131 = NFSharedLogGetLogger(v130);
            v132 = objc_claimAutoreleasedReturnValue(v131);
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
            {
              v133 = object_getClass(self);
              if (class_isMetaClass(v133))
                v134 = 43;
              else
                v134 = 45;
              v135 = object_getClassName(self);
              v136 = sel_getName(sel);
              *(_DWORD *)buf = 67110146;
              v192 = v134;
              v193 = 2082;
              v194 = v135;
              v195 = 2082;
              v196 = v136;
              v197 = 1024;
              v198 = 1552;
              v199 = 1024;
              LODWORD(v200) = pollingProfile;
              _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i pollingProfile=%u", buf, 0x28u);
            }

LABEL_99:
            v137 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
            v138 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
            v139 = objc_msgSend(v137, "setRoutingConfig:", v138);

            sub_1001CB354(self->_driverWrapper, pollingProfile);
            v73 = (id)v172;
            break;
          case 2:
            v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v82 = NFLogGetLogger(v81);
            if (v82)
            {
              v83 = (void (*)(uint64_t, const char *, ...))v82;
              v84 = object_getClass(self);
              v85 = class_isMetaClass(v84);
              v86 = object_getClassName(self);
              v165 = sel_getName(sel);
              v87 = 45;
              if (v85)
                v87 = 43;
              v83(6, "%c[%{public}s %{public}s]:%i Forcing TRANSAC_B", v87, v86, v165, 1541);
            }
            v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v89 = NFSharedLogGetLogger(v88);
            v90 = objc_claimAutoreleasedReturnValue(v89);
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              v91 = object_getClass(self);
              if (class_isMetaClass(v91))
                v92 = 43;
              else
                v92 = 45;
              v93 = object_getClassName(self);
              v94 = sel_getName(sel);
              *(_DWORD *)buf = 67109890;
              v192 = v92;
              v193 = 2082;
              v194 = v93;
              v195 = 2082;
              v196 = v94;
              v197 = 1024;
              v198 = 1541;
              _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Forcing TRANSAC_B", buf, 0x22u);
            }

            pollingProfile = 2;
            self->_pollingConfig = 2;
            goto LABEL_89;
          case 3:
            v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v96 = NFLogGetLogger(v95);
            if (v96)
            {
              v97 = (void (*)(uint64_t, const char *, ...))v96;
              v98 = object_getClass(self);
              v99 = class_isMetaClass(v98);
              v100 = object_getClassName(self);
              v166 = sel_getName(sel);
              v101 = 45;
              if (v99)
                v101 = 43;
              v97(6, "%c[%{public}s %{public}s]:%i Forcing TRANSAC_A", v101, v100, v166, 1545);
            }
            v102 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v103 = NFSharedLogGetLogger(v102);
            v104 = objc_claimAutoreleasedReturnValue(v103);
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
            {
              v105 = object_getClass(self);
              if (class_isMetaClass(v105))
                v106 = 43;
              else
                v106 = 45;
              v107 = object_getClassName(self);
              v108 = sel_getName(sel);
              *(_DWORD *)buf = 67109890;
              v192 = v106;
              v193 = 2082;
              v194 = v107;
              v195 = 2082;
              v196 = v108;
              v197 = 1024;
              v198 = 1545;
              _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Forcing TRANSAC_A", buf, 0x22u);
            }

            pollingProfile = 3;
            goto LABEL_89;
          default:
            v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v110 = NFLogGetLogger(v109);
            if (v110)
            {
              v111 = (void (*)(uint64_t, const char *, ...))v110;
              v112 = object_getClass(self);
              v113 = class_isMetaClass(v112);
              v114 = object_getClassName(self);
              v167 = sel_getName(sel);
              v115 = 45;
              if (v113)
                v115 = 43;
              v111(6, "%c[%{public}s %{public}s]:%i Forcing No ECP", v115, v114, v167, 1548);
            }
            v116 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v117 = NFSharedLogGetLogger(v116);
            v118 = objc_claimAutoreleasedReturnValue(v117);
            if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
            {
              v119 = object_getClass(self);
              if (class_isMetaClass(v119))
                v120 = 43;
              else
                v120 = 45;
              v121 = object_getClassName(self);
              v122 = sel_getName(sel);
              *(_DWORD *)buf = 67109890;
              v192 = v120;
              v193 = 2082;
              v194 = v121;
              v195 = 2082;
              v196 = v122;
              v197 = 1024;
              v198 = 1548;
              _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Forcing No ECP", buf, 0x22u);
            }

            pollingProfile = 4;
            goto LABEL_89;
        }
      }
      v179[0] = _NSConcreteStackBlock;
      v179[1] = 3221225472;
      v179[2] = sub_1001ADAA8;
      v179[3] = &unk_1002EA940;
      v179[4] = self;
      v183 = sel;
      v180 = v73;
      v184 = v170;
      v181 = v52;
      v182 = v54;
      v140 = objc_retainBlock(v179);
      v141 = v140;
      if (self->_uiService)
      {
        v175[0] = _NSConcreteStackBlock;
        v175[1] = 3221225472;
        v175[2] = sub_1001ADF5C;
        v175[3] = &unk_1002E61C8;
        v175[4] = self;
        v178 = sel;
        v176 = v173;
        v177 = v141;
        -[_NFReaderSession activateUIControllerWithCompletion:](self, "activateUIControllerWithCompletion:", v175);

      }
      else
      {
        v142 = ((uint64_t (*)(_QWORD *))v140[2])(v140);
        v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
        v173[2](v173, v143);

      }
LABEL_104:

      v71 = v173;
    }
    else
    {
      v72 = objc_alloc((Class)NSError);
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v187 = NSLocalizedDescriptionKey;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
      v188 = v54;
      v70 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1));
      v73 = objc_msgSend(v72, "initWithDomain:code:userInfo:", v52, 10, v70);
      v71 = v173;
      v173[2](v173, v73);
    }

  }
  else
  {
    v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v56 = NFLogGetLogger(v55);
    if (v56)
    {
      v57 = (void (*)(uint64_t, const char *, ...))v56;
      v58 = object_getClass(self);
      v59 = class_isMetaClass(v58);
      v60 = object_getClassName(self);
      v164 = sel_getName(a2);
      v61 = 45;
      if (v59)
        v61 = 43;
      v57(6, "%c[%{public}s %{public}s]:%i Missing required entitlements", v61, v60, v164, 1483);
    }
    v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = NFSharedLogGetLogger(v62);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = object_getClass(self);
      if (class_isMetaClass(v65))
        v66 = 43;
      else
        v66 = 45;
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v192 = v66;
      v193 = 2082;
      v194 = v67;
      v195 = 2082;
      v196 = v68;
      v197 = 1024;
      v198 = 1483;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing required entitlements", buf, 0x22u);
    }

    v69 = objc_alloc((Class)NSError);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v189 = NSLocalizedDescriptionKey;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v190 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v190, &v189, 1));
    v70 = objc_msgSend(v69, "initWithDomain:code:userInfo:", v51, 32, v54);
    v71 = v173;
    v173[2](v173, v70);
  }

}

- (void)startPollingForNDEFMessagesWithSessionConfig:(unint64_t)a3 completion:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  unint64_t v14;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_NFReaderSession;
  v8 = -[_NFSession workQueue](&v15, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001AE290;
  v11[3] = &unk_1002E6638;
  v11[4] = self;
  v12 = v7;
  v13 = a2;
  v14 = a3;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)_sync_startPollingForNDEFMessagesWithSessionConfig:(unint64_t)a3 completion:(id)a4
{
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *v12;
  const char *Name;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  unsigned int v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  id v57;
  _QWORD v58[5];
  id v59;
  _QWORD *v60;
  SEL v61;
  _QWORD v62[7];
  NSErrorUserInfoKey v63;
  void *v64;
  uint8_t buf[4];
  int v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  int v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  unsigned int v76;
  __int16 v77;
  void *v78;

  v57 = a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v12 = a2;
    Name = sel_getName(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v16 = objc_msgSend(v15, "processIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v53 = Name;
    a2 = v12;
    v18 = 43;
    if (!isMetaClass)
      v18 = 45;
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v18, ClassName, v53, 1615, v14, v16, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v55 = object_getClassName(self);
    v24 = sel_getName(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v27 = a2;
    v28 = objc_msgSend(v26, "processIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110658;
    v66 = v23;
    v67 = 2082;
    v68 = v55;
    v69 = 2082;
    v70 = v24;
    v71 = 1024;
    v72 = 1615;
    v73 = 2114;
    v74 = v25;
    v75 = 1024;
    v76 = v28;
    a2 = v27;
    v77 = 2114;
    v78 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);

  }
  if ((-[NFServiceWhitelistChecker nfcNDEFReaderAccess](self->_tagWhiteList, "nfcNDEFReaderAccess") & 1) != 0)
  {
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1001AEAB4;
    v62[3] = &unk_1002EA968;
    v62[4] = self;
    v62[5] = a2;
    v62[6] = a3;
    v30 = objc_retainBlock(v62);
    if (-[_NFReaderSession _isCoreNFCSession](self, "_isCoreNFCSession") && self->_uiService)
    {
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1001AEFB8;
      v58[3] = &unk_1002E61C8;
      v58[4] = self;
      v61 = a2;
      v31 = v57;
      v59 = v57;
      v60 = v30;
      -[_NFReaderSession activateUIControllerWithCompletion:](self, "activateUIControllerWithCompletion:", v58);

    }
    else
    {
      v51 = ((uint64_t (*)(_QWORD *))v30[2])(v30);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      v31 = v57;
      (*((void (**)(id, void *))v57 + 2))(v57, v52);

    }
  }
  else
  {
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFLogGetLogger(v32);
    if (v33)
    {
      v34 = (void (*)(uint64_t, const char *, ...))v33;
      v35 = object_getClass(self);
      v36 = class_isMetaClass(v35);
      v37 = object_getClassName(self);
      v54 = sel_getName(a2);
      v38 = 45;
      if (v36)
        v38 = 43;
      v34(6, "%c[%{public}s %{public}s]:%i Missing required entitlements", v38, v37, v54, 1619);
    }
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger(v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = object_getClass(self);
      if (class_isMetaClass(v42))
        v43 = 43;
      else
        v43 = 45;
      v44 = object_getClassName(self);
      v45 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v66 = v43;
      v67 = 2082;
      v68 = v44;
      v69 = 2082;
      v70 = v45;
      v71 = 1024;
      v72 = 1619;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing required entitlements", buf, 0x22u);
    }

    v46 = objc_alloc((Class)NSError);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v63 = NSLocalizedDescriptionKey;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v64 = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
    v50 = objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 32, v49);
    v31 = v57;
    (*((void (**)(id, id))v57 + 2))(v57, v50);

  }
}

- (void)stopPollingWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AF2E0;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)_sync_stopPolling:(id)a3
{
  id v5;
  void *v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  NFTag *currentTag;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  const char *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id WeakRetained;
  const char *v57;
  void (**v58)(id, id);
  NSErrorUserInfoKey v59;
  void *v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  unsigned int v72;
  __int16 v73;
  void *v74;

  v58 = (void (**)(id, id))a3;
  v5 = sub_100226308((uint64_t)NFTagReadCALogger);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100226F94((uint64_t)v6);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v57 = a2;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v16 = objc_msgSend(v15, "processIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v18 = 43;
    if (!isMetaClass)
      v18 = 45;
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v18, ClassName, Name, 1691, v14, v16, v17);

    a2 = v57;
  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v28 = objc_msgSend(v27, "processIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110658;
    v62 = v23;
    v63 = 2082;
    v64 = v24;
    v65 = 2082;
    v66 = v25;
    v67 = 1024;
    v68 = 1691;
    v69 = 2114;
    v70 = v26;
    v71 = 1024;
    v72 = v28;
    v73 = 2114;
    v74 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);

  }
  currentTag = self->_currentTag;
  self->_currentTag = 0;

  -[NSMutableArray removeAllObjects](self->_nonstandard7816TagsFound, "removeAllObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "setRoutingConfig:", v32));

  if (v33)
  {
    v34 = objc_alloc((Class)NSError);
    v35 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v59 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v60 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
    v38 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 15, v37);
    v58[2](v58, v38);

  }
  else
  {
    v58[2](v58, 0);
    v39 = NFLogGetLogger(2);
    if (v39)
    {
      v40 = (void (*)(uint64_t, const char *, ...))v39;
      v41 = object_getClass(self);
      v42 = class_isMetaClass(v41);
      v43 = object_getClassName(self);
      v44 = sel_getName(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v46 = 45;
      if (v42)
        v46 = 43;
      v40(6, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", v46, v43, v44, 1697, v45);

    }
    v47 = NFSharedLogGetLogger(2);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = object_getClass(self);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(self);
      v52 = sel_getName(a2);
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      *(_DWORD *)buf = 67110146;
      v62 = v50;
      v63 = 2082;
      v64 = v51;
      v65 = 2082;
      v66 = v52;
      v67 = 1024;
      v68 = 1697;
      v69 = 2112;
      v70 = v53;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", buf, 0x2Cu);

    }
    v55 = NFSharedSignpostLog(v54);
    v35 = objc_claimAutoreleasedReturnValue(v55);
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Polling", ", buf, 2u);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
  sub_10019D694((uint64_t)WeakRetained, self);

}

- (void)restartPollingWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AFBC8;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)_sync_restartPolling:(id)a3
{
  void (**v5)(id, id);
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *Name;
  void *v12;
  void *v13;
  void (**v14)(id, id);
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  NFTag *currentTag;
  void *v30;
  void *v31;
  id v32;
  int pollingConfig;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  const char *ClassName;
  NSErrorUserInfoKey v41;
  void *v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  void *v56;

  v5 = (void (**)(id, id))a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v14 = v5;
    v15 = objc_msgSend(v13, "processIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v39 = v15;
    v5 = v14;
    v17 = 43;
    if (!isMetaClass)
      v17 = 45;
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v17, ClassName, Name, 1717, v12, v39, v16);

  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = object_getClass(self);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    v23 = object_getClassName(self);
    v24 = sel_getName(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v27 = objc_msgSend(v26, "processIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110658;
    v44 = v22;
    v45 = 2082;
    v46 = v23;
    v47 = 2082;
    v48 = v24;
    v49 = 1024;
    v50 = 1717;
    v51 = 2114;
    v52 = v25;
    v53 = 1024;
    v54 = v27;
    v55 = 2114;
    v56 = v28;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);

  }
  if (-[_NFReaderSession _isCoreNFCSession](self, "_isCoreNFCSession"))
  {
    currentTag = self->_currentTag;
    self->_currentTag = 0;

    -[NSMutableArray removeAllObjects](self->_nonstandard7816TagsFound, "removeAllObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
    v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "setRoutingConfig:", v31));

    if (!v32)
    {
      if ((self->_sessionConfig & 0x100) != 0)
      {
        pollingConfig = self->_pollingConfig;
        if ((pollingConfig & 0x1000) != 0)
        {
          v34 = pollingConfig & 0xFFFFEFFF;
          self->_pollingConfig = v34;
          sub_1001CB2CC(self->_driverWrapper, v34, -[_NFReaderSession _getTagNotificationConfig](self, "_getTagNotificationConfig"));
        }
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig readerModeWithFD:](NFRoutingConfig, "readerModeWithFD:", 2));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
      v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "setRoutingConfig:", v35));
      goto LABEL_19;
    }
  }
  else
  {
    if ((sub_1001FBF60(self->_driverWrapper) & 1) == 0)
    {
      v37 = objc_alloc((Class)NSError);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v41 = NSLocalizedDescriptionKey;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v42 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
      v32 = objc_msgSend(v37, "initWithDomain:code:userInfo:", v35, 15, v38);

LABEL_19:
      goto LABEL_20;
    }
    v32 = 0;
  }
LABEL_20:
  v5[2](v5, v32);

}

- (void)execRemoteAdminScript:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B03A4;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_sync_execRemoteAdminScript:(id)a3 completion:(id)a4
{
  id v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  id v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _UNKNOWN **v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  void *v64;
  int v65;
  uint64_t v67;
  NFDriverWrapper *driverWrapper;
  NFTag *currentTag;
  double v70;
  id v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void (*v77)(uint64_t, const char *, ...);
  objc_class *v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  const char *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  objc_class *v87;
  int v88;
  const char *v89;
  const char *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  BOOL v95;
  int v96;
  void *v97;
  uint64_t v98;
  void (*v99)(uint64_t, const char *, ...);
  objc_class *v100;
  _BOOL4 v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  objc_class *v106;
  int v107;
  const char *v108;
  const char *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void (*v117)(uint64_t, const char *, ...);
  objc_class *v118;
  _BOOL4 v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  NSObject *v123;
  objc_class *v124;
  int v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void (*v134)(uint64_t, const char *, ...);
  objc_class *v135;
  _BOOL4 v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  NSObject *v141;
  objc_class *v142;
  int v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  id v149;
  void *v150;
  NSMutableArray *v151;
  NSMutableArray **v152;
  NSErrorUserInfoKey *v153;
  void *v154;
  uint64_t v155;
  void (*v156)(uint64_t, const char *, ...);
  objc_class *v157;
  _BOOL4 v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  NSObject *v163;
  objc_class *v164;
  int v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  NSObject *v170;
  void *v171;
  id v172;
  void (**v173)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  void *v174;
  uint64_t v175;
  void (*v176)(uint64_t, const char *, ...);
  objc_class *v177;
  _BOOL4 v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  NSObject *v183;
  objc_class *v184;
  int v185;
  const char *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  NSObject *v190;
  id v191;
  id v192;
  void *v193;
  uint64_t v194;
  void (*v195)(uint64_t, const char *, ...);
  objc_class *v196;
  _BOOL4 v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  NSObject *v202;
  objc_class *v203;
  int v204;
  const char *v205;
  const char *v206;
  id v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void (*v216)(uint64_t, const char *, ...);
  objc_class *v217;
  _BOOL4 v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  NSObject *v223;
  objc_class *v224;
  int v225;
  const char *v226;
  const char *v227;
  id v228;
  id v229;
  id v230;
  void *v231;
  uint64_t v232;
  void (*v233)(uint64_t, const char *, ...);
  objc_class *v234;
  _BOOL4 v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  uint64_t v239;
  NSObject *v240;
  objc_class *v241;
  int v242;
  const char *v243;
  const char *v244;
  id v245;
  uint64_t v246;
  void *v247;
  uint64_t v248;
  void (*v249)(uint64_t, const char *, ...);
  objc_class *v250;
  _BOOL4 v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  void *v255;
  uint64_t v256;
  NSObject *v257;
  objc_class *v258;
  int v259;
  const char *v260;
  const char *v261;
  id v262;
  uint64_t v263;
  void *v264;
  uint64_t v265;
  uint64_t v266;
  id v267;
  void *v268;
  void *v269;
  id v270;
  id v271;
  uint64_t v272;
  NSObject *v273;
  const char *v274;
  const char *v275;
  const char *v276;
  const char *v277;
  const char *v278;
  const char *v279;
  const char *v280;
  const char *v281;
  const char *v282;
  const char *v283;
  const char *v284;
  const char *v285;
  const char *v286;
  void *v287;
  NSMutableArray *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  id v293;
  uint64_t v294;
  id obj;
  uint64_t v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  id v301;
  id v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  _QWORD v308[4];
  _QWORD v309[4];
  _QWORD v310[2];
  _QWORD v311[2];
  NSErrorUserInfoKey v312;
  void *v313;
  NSErrorUserInfoKey v314;
  uint64_t v315;
  NSErrorUserInfoKey v316;
  void *v317;
  NSErrorUserInfoKey v318;
  void *v319;
  NSErrorUserInfoKey v320;
  void *v321;
  NSErrorUserInfoKey v322;
  void *v323;
  _BYTE v324[128];
  NSErrorUserInfoKey v325;
  void *v326;
  NSErrorUserInfoKey v327;
  NSMutableArray *v328;
  NSErrorUserInfoKey v329;
  NSMutableArray *v330;
  uint8_t buf[4];
  int v332;
  __int16 v333;
  const char *v334;
  __int16 v335;
  const char *v336;
  __int16 v337;
  int v338;
  __int16 v339;
  void *v340;
  __int16 v341;
  _BYTE v342[14];

  v6 = a3;
  v301 = a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v16 = objc_msgSend(v15, "processIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v18 = 43;
    if (!isMetaClass)
      v18 = 45;
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v18, ClassName, Name, 1763, v14, v16, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    v23 = v6;
    if (class_isMetaClass(v22))
      v24 = 43;
    else
      v24 = 45;
    v25 = object_getClassName(self);
    v26 = sel_getName(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
    v29 = objc_msgSend(v28, "processIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110658;
    v332 = v24;
    v6 = v23;
    v333 = 2082;
    v334 = v25;
    v335 = 2082;
    v336 = v26;
    v337 = 1024;
    v338 = 1763;
    v339 = 2114;
    v340 = v27;
    v341 = 1024;
    *(_DWORD *)v342 = v29;
    *(_WORD *)&v342[4] = 2114;
    *(_QWORD *)&v342[6] = v30;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);

  }
  v32 = NFSharedSignpostLog(v31);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", ", buf, 2u);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("kBatchId")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("kCommands")));
  v36 = &AMFDRSealingMapCopyLocalData_ptr;
  if (!v34 || (v37 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v34, v37) & 1) == 0))
  {
    v132 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v133 = NFLogGetLogger(v132);
    if (v133)
    {
      v134 = (void (*)(uint64_t, const char *, ...))v133;
      v135 = object_getClass(self);
      v136 = class_isMetaClass(v135);
      v137 = object_getClassName(self);
      v280 = sel_getName(a2);
      v138 = 45;
      if (v136)
        v138 = 43;
      v134(3, "%c[%{public}s %{public}s]:%i Missing batch ID", v138, v137, v280, 1771);
    }
    v139 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v140 = NFSharedLogGetLogger(v139);
    v141 = objc_claimAutoreleasedReturnValue(v140);
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      v142 = object_getClass(self);
      if (class_isMetaClass(v142))
        v143 = 43;
      else
        v143 = 45;
      v144 = object_getClassName(self);
      v145 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v332 = v143;
      v333 = 2082;
      v334 = v144;
      v335 = 2082;
      v336 = v145;
      v337 = 1024;
      v338 = 1771;
      _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing batch ID", buf, 0x22u);
    }

    v147 = NFSharedSignpostLog(v146);
    v148 = objc_claimAutoreleasedReturnValue(v147);
    if (os_signpost_enabled(v148))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v148, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", ", buf, 2u);
    }

    v149 = objc_alloc((Class)NSError);
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v329 = NSLocalizedDescriptionKey;
    v151 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Missing Parameter"));
    v330 = v151;
    v152 = &v330;
    v153 = &v329;
    goto LABEL_120;
  }
  if (!v35 || (v38 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v35, v38) & 1) == 0))
  {
    v154 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v155 = NFLogGetLogger(v154);
    if (v155)
    {
      v156 = (void (*)(uint64_t, const char *, ...))v155;
      v157 = object_getClass(self);
      v158 = class_isMetaClass(v157);
      v159 = object_getClassName(self);
      v281 = sel_getName(a2);
      v160 = 45;
      if (v158)
        v160 = 43;
      v156(3, "%c[%{public}s %{public}s]:%i Missing commands", v160, v159, v281, 1779);
    }
    v161 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v162 = NFSharedLogGetLogger(v161);
    v163 = objc_claimAutoreleasedReturnValue(v162);
    if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
    {
      v164 = object_getClass(self);
      if (class_isMetaClass(v164))
        v165 = 43;
      else
        v165 = 45;
      v166 = object_getClassName(self);
      v167 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v332 = v165;
      v333 = 2082;
      v334 = v166;
      v335 = 2082;
      v336 = v167;
      v337 = 1024;
      v338 = 1779;
      _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing commands", buf, 0x22u);
    }

    v169 = NFSharedSignpostLog(v168);
    v170 = objc_claimAutoreleasedReturnValue(v169);
    if (os_signpost_enabled(v170))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v170, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", ", buf, 2u);
    }

    v149 = objc_alloc((Class)NSError);
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v327 = NSLocalizedDescriptionKey;
    v151 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Missing Parameter"));
    v328 = v151;
    v152 = &v328;
    v153 = &v327;
LABEL_120:
    v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v152, v153, 1));
    v172 = objc_msgSend(v149, "initWithDomain:code:userInfo:", v150, 9, v171);
    v173 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))v301;
    (*((void (**)(id, _QWORD, _QWORD, id, double))v301 + 2))(v301, 0, 0, v172, 0.0);
    v41 = 0;
    goto LABEL_121;
  }
  v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("kTaskId")));
  v40 = objc_opt_class(NSString);
  v292 = (void *)v39;
  if ((objc_opt_isKindOfClass(v39, v40) & 1) == 0)
  {
    v174 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v175 = NFLogGetLogger(v174);
    if (v175)
    {
      v176 = (void (*)(uint64_t, const char *, ...))v175;
      v177 = object_getClass(self);
      v178 = class_isMetaClass(v177);
      v179 = object_getClassName(self);
      v282 = sel_getName(a2);
      v180 = 45;
      if (v178)
        v180 = 43;
      v176(3, "%c[%{public}s %{public}s]:%i Invalide parameter type : Task ID", v180, v179, v282, 1788);
    }
    v181 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v182 = NFSharedLogGetLogger(v181);
    v183 = objc_claimAutoreleasedReturnValue(v182);
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      v184 = object_getClass(self);
      if (class_isMetaClass(v184))
        v185 = 43;
      else
        v185 = 45;
      v186 = object_getClassName(self);
      v187 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v332 = v185;
      v333 = 2082;
      v334 = v186;
      v335 = 2082;
      v336 = v187;
      v337 = 1024;
      v338 = 1788;
      _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalide parameter type : Task ID", buf, 0x22u);
    }

    v189 = NFSharedSignpostLog(v188);
    v190 = objc_claimAutoreleasedReturnValue(v189);
    if (os_signpost_enabled(v190))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v190, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", ", buf, 2u);
    }

    v191 = objc_alloc((Class)NSError);
    v151 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v325 = NSLocalizedDescriptionKey;
    v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v326 = v171;
    v172 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v326, &v325, 1));
    v192 = objc_msgSend(v191, "initWithDomain:code:userInfo:", v151, 10, v172);
    v173 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))v301;
    (*((void (**)(id, _QWORD, _QWORD, id, double))v301 + 2))(v301, 0, 0, v192, 0.0);

    v41 = 0;
    v150 = v292;
    goto LABEL_121;
  }
  v290 = v6;
  v288 = objc_opt_new(NSMutableArray);
  v304 = 0u;
  v305 = 0u;
  v306 = 0u;
  v307 = 0u;
  obj = v35;
  v289 = v34;
  v287 = v35;
  v293 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v304, v324, 16);
  v41 = 0;
  v42 = 0;
  if (!v293)
    goto LABEL_177;
  v294 = *(_QWORD *)v305;
  while (2)
  {
    v43 = 0;
    do
    {
      if (*(_QWORD *)v305 != v294)
        objc_enumerationMutation(obj);
      v44 = *(void **)(*((_QWORD *)&v304 + 1) + 8 * v43);
      v45 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v44, v45) & 1) == 0)
      {
        v193 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v194 = NFLogGetLogger(v193);
        if (v194)
        {
          v195 = (void (*)(uint64_t, const char *, ...))v194;
          v196 = object_getClass(self);
          v197 = class_isMetaClass(v196);
          v198 = object_getClassName(self);
          v283 = sel_getName(a2);
          v199 = 45;
          if (v197)
            v199 = 43;
          v195(5, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting dictionary", v199, v198, v283, 1800);
        }
        v200 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v201 = NFSharedLogGetLogger(v200);
        v202 = objc_claimAutoreleasedReturnValue(v201);
        if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
        {
          v203 = object_getClass(self);
          if (class_isMetaClass(v203))
            v204 = 43;
          else
            v204 = 45;
          v205 = object_getClassName(self);
          v206 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v332 = v204;
          v333 = 2082;
          v334 = v205;
          v335 = 2082;
          v336 = v206;
          v337 = 1024;
          v338 = 1800;
          _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting dictionary", buf, 0x22u);
        }

        v207 = objc_alloc((Class)NSError);
        v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "nfcd"));
        v322 = NSLocalizedDescriptionKey;
        v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "Invalid Parameter"));
        v323 = v209;
        v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v323, &v322, 1));
        v211 = v207;
        v212 = v208;
        v213 = 10;
        goto LABEL_155;
      }
      if (-[_NFSession didEnd](self, "didEnd"))
      {
        v214 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v215 = NFLogGetLogger(v214);
        if (v215)
        {
          v216 = (void (*)(uint64_t, const char *, ...))v215;
          v217 = object_getClass(self);
          v218 = class_isMetaClass(v217);
          v219 = object_getClassName(self);
          v284 = sel_getName(a2);
          v220 = 45;
          if (v218)
            v220 = 43;
          v216(5, "%c[%{public}s %{public}s]:%i Aborted", v220, v219, v284, 1807);
        }
        v221 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v222 = NFSharedLogGetLogger(v221);
        v223 = objc_claimAutoreleasedReturnValue(v222);
        if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
        {
          v224 = object_getClass(self);
          if (class_isMetaClass(v224))
            v225 = 43;
          else
            v225 = 45;
          v226 = object_getClassName(self);
          v227 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v332 = v225;
          v333 = 2082;
          v334 = v226;
          v335 = 2082;
          v336 = v227;
          v337 = 1024;
          v338 = 1807;
          _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborted", buf, 0x22u);
        }

        v228 = objc_alloc((Class)NSError);
        v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "nfcd"));
        v320 = NSLocalizedDescriptionKey;
        v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "Aborted"));
        v321 = v209;
        v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v321, &v320, 1));
        v211 = v228;
        v212 = v208;
        v213 = 3;
        goto LABEL_155;
      }
      if (!self->_currentTag)
      {
        v229 = objc_alloc((Class)NSError);
        v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "nfcd"));
        v318 = NSLocalizedDescriptionKey;
        v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "Tag Not Found"));
        v319 = v209;
        v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v319, &v318, 1));
        v211 = v229;
        v212 = v208;
        v213 = 28;
LABEL_155:
        v230 = objc_msgSend(v211, "initWithDomain:code:userInfo:", v212, v213, v210);
LABEL_176:

        v41 = v230;
        goto LABEL_177;
      }
      v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", CFSTR("kMessageName")));
      v47 = objc_opt_class(v36[267]);
      v299 = (void *)v46;
      if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0)
      {
        v231 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v232 = NFLogGetLogger(v231);
        if (v232)
        {
          v233 = (void (*)(uint64_t, const char *, ...))v232;
          v234 = object_getClass(self);
          v235 = class_isMetaClass(v234);
          v236 = object_getClassName(self);
          v285 = sel_getName(a2);
          v237 = 45;
          if (v235)
            v237 = 43;
          v233(5, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting String name", v237, v236, v285, 1820);
        }
        v238 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v239 = NFSharedLogGetLogger(v238);
        v240 = objc_claimAutoreleasedReturnValue(v239);
        if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
        {
          v241 = object_getClass(self);
          if (class_isMetaClass(v241))
            v242 = 43;
          else
            v242 = 45;
          v243 = object_getClassName(self);
          v244 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v332 = v242;
          v333 = 2082;
          v334 = v243;
          v335 = 2082;
          v336 = v244;
          v337 = 1024;
          v338 = 1820;
          _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting String name", buf, 0x22u);
        }

        v245 = objc_alloc((Class)NSError);
        v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "nfcd"));
        v316 = NSLocalizedDescriptionKey;
        v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "Invalid Parameter"));
        v317 = v210;
        v246 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v317, &v316, 1));
        v230 = objc_msgSend(v245, "initWithDomain:code:userInfo:", v209, 10, v246);

        v41 = (void *)v246;
        v208 = v299;
        goto LABEL_176;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", CFSTR("kData")));
      v49 = objc_opt_class(v36[267]);
      if ((objc_opt_isKindOfClass(v48, v49) & 1) == 0)
      {
        v247 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v248 = NFLogGetLogger(v247);
        if (v248)
        {
          v249 = (void (*)(uint64_t, const char *, ...))v248;
          v250 = object_getClass(self);
          v251 = class_isMetaClass(v250);
          v252 = object_getClassName(self);
          v286 = sel_getName(a2);
          v253 = 45;
          if (v251)
            v253 = 43;
          v249(5, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting String capdu", v253, v252, v286, 1829);
        }
        v254 = v48;
        v255 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v256 = NFSharedLogGetLogger(v255);
        v257 = objc_claimAutoreleasedReturnValue(v256);
        if (os_log_type_enabled(v257, OS_LOG_TYPE_DEFAULT))
        {
          v258 = object_getClass(self);
          if (class_isMetaClass(v258))
            v259 = 43;
          else
            v259 = 45;
          v260 = object_getClassName(self);
          v261 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v332 = v259;
          v333 = 2082;
          v334 = v260;
          v335 = 2082;
          v336 = v261;
          v337 = 1024;
          v338 = 1829;
          _os_log_impl((void *)&_mh_execute_header, v257, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting String capdu", buf, 0x22u);
        }

        v262 = objc_alloc((Class)NSError);
        v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "nfcd"));
        v314 = NSLocalizedDescriptionKey;
        v263 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "Invalid Parameter"));
        v315 = v263;
        v264 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v315, &v314, 1));
        v230 = objc_msgSend(v262, "initWithDomain:code:userInfo:", v210, 10, v264);

        v41 = (void *)v263;
        v208 = v299;
        v209 = v254;
        goto LABEL_176;
      }
      v296 = v43;
      if ((-[NFTag technology](self->_currentTag, "technology") & 4) != 0)
      {
        v50 = objc_msgSend(objc_alloc((Class)v36[267]), "initWithFormat:", CFSTR("%02X%@"), ((unint64_t)objc_msgSend(v48, "lengthOfBytesUsingEncoding:", 4) >> 1) + 1, v48);

        v48 = v50;
      }
      v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v52 = NFLogGetLogger(v51);
      if (v52)
      {
        v53 = (void (*)(uint64_t, const char *, ...))v52;
        v54 = object_getClass(self);
        v55 = class_isMetaClass(v54);
        v274 = object_getClassName(self);
        v277 = sel_getName(a2);
        v56 = 45;
        if (v55)
          v56 = 43;
        v53(6, "%c[%{public}s %{public}s]:%i C-APDU > %{public}@", v56, v274, v277, 1841, v48);
      }
      v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = NFSharedLogGetLogger(v57);
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = object_getClass(self);
        if (class_isMetaClass(v60))
          v61 = 43;
        else
          v61 = 45;
        v62 = object_getClassName(self);
        v63 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v332 = v61;
        v333 = 2082;
        v334 = v62;
        v335 = 2082;
        v336 = v63;
        v337 = 1024;
        v338 = 1841;
        v339 = 2114;
        v340 = v48;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i C-APDU > %{public}@", buf, 0x2Cu);
      }

      v300 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v48));
      v297 = v48;
      if (v300)
      {
        v291 = v44;
        v64 = 0;
        v65 = -4;
        while (!__CFADD__(v65++, 1))
        {
          v67 = mach_continuous_time();
          driverWrapper = self->_driverWrapper;
          currentTag = self->_currentTag;
          -[NFServiceWhitelistChecker sessionTimeLimit](self->_tagWhiteList, "sessionTimeLimit");
          v303 = v41;
          v71 = sub_1001847DC(driverWrapper, v300, currentTag, &v303, v70);
          v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
          v73 = v303;

          v74 = mach_continuous_time();
          v42 += GetElapsedTimeInMillisecondsFromMachTime(v74, v67);
          if (!v73)
            goto LABEL_77;
          v41 = v73;
          v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v76 = NFLogGetLogger(v75);
          if (v76)
          {
            v77 = (void (*)(uint64_t, const char *, ...))v76;
            v78 = object_getClass(self);
            if (class_isMetaClass(v78))
              v79 = 43;
            else
              v79 = 45;
            v80 = object_getClassName(self);
            v81 = sel_getName(a2);
            v82 = v81;
            if (v299)
            {
              v77(3, "%c[%{public}s %{public}s]:%i Failed to execute C-APDU %{public}@, error %{public}@", v79, v80, v81, 1864, v299, v41);
            }
            else
            {
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v300, "description"));
              v77(3, "%c[%{public}s %{public}s]:%i Failed to execute C-APDU %{public}@, error %{public}@", v79, v80, v82, 1864, v83, v41);

            }
          }
          v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v85 = NFSharedLogGetLogger(v84);
          v86 = objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            v87 = object_getClass(self);
            if (class_isMetaClass(v87))
              v88 = 43;
            else
              v88 = 45;
            v89 = object_getClassName(self);
            v90 = sel_getName(a2);
            v91 = v299;
            if (!v299)
            {
              v298 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v300, "description"));
              v91 = v298;
            }
            *(_DWORD *)buf = 67110402;
            v332 = v88;
            v333 = 2082;
            v334 = v89;
            v335 = 2082;
            v336 = v90;
            v337 = 1024;
            v338 = 1864;
            v339 = 2114;
            v340 = v91;
            v341 = 2114;
            *(_QWORD *)v342 = v41;
            _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute C-APDU %{public}@, error %{public}@", buf, 0x36u);
            if (!v299)

          }
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "userInfo"));
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

          v94 = objc_msgSend(v41, "code");
          v95 = 0;
          if (objc_msgSend(v41, "code") == (id)29 && v93)
            v95 = objc_msgSend(v93, "code") == (id)20;

          v64 = v72;
          if (v94 != (id)28)
          {
            v64 = v72;
            if (!v95)
            {
              v96 = 2;
LABEL_75:
              v36 = &AMFDRSealingMapCopyLocalData_ptr;
              goto LABEL_92;
            }
          }
        }
        if (v41)
        {
          v96 = 2;
          v72 = v64;
          goto LABEL_75;
        }
        v72 = v64;
LABEL_77:
        v114 = v291;
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "NF_asHexString"));
        v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v116 = NFLogGetLogger(v115);
        if (v116)
        {
          v117 = (void (*)(uint64_t, const char *, ...))v116;
          v118 = object_getClass(self);
          v119 = class_isMetaClass(v118);
          v276 = object_getClassName(self);
          v279 = sel_getName(a2);
          v120 = 45;
          if (v119)
            v120 = 43;
          v114 = v291;
          v117(6, "%c[%{public}s %{public}s]:%i R-APDU < %{public}@", v120, v276, v279, 1881, v111);
        }
        v121 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v122 = NFSharedLogGetLogger(v121);
        v123 = objc_claimAutoreleasedReturnValue(v122);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          v124 = object_getClass(self);
          if (class_isMetaClass(v124))
            v125 = 43;
          else
            v125 = 45;
          v126 = object_getClassName(self);
          v127 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v332 = v125;
          v333 = 2082;
          v334 = v126;
          v335 = 2082;
          v336 = v127;
          v337 = 1024;
          v338 = 1881;
          v339 = 2114;
          v340 = v111;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i R-APDU < %{public}@", buf, 0x2Cu);
        }

        if ((-[NFTag technology](self->_currentTag, "technology") & 4) != 0)
        {
          v128 = objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "substringFromIndex:", 2));

          v111 = (void *)v128;
        }
        v310[0] = CFSTR("kData");
        v310[1] = CFSTR("kMessageId");
        v311[0] = v111;
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "objectForKeyedSubscript:"));
        v311[1] = v129;
        v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v311, v310, 2));
        v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v130));

        if (v299)
        {
          v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v299, "stringByAppendingString:", CFSTR("_RESP")));
          objc_msgSend(v112, "setObject:forKeyedSubscript:", v131, CFSTR("kMessageName"));

        }
        -[NSMutableArray addObject:](v288, "addObject:", v112);
        v96 = 0;
        v113 = 0;
        v36 = &AMFDRSealingMapCopyLocalData_ptr;
      }
      else
      {
        v97 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v98 = NFLogGetLogger(v97);
        if (v98)
        {
          v99 = (void (*)(uint64_t, const char *, ...))v98;
          v100 = object_getClass(self);
          v101 = class_isMetaClass(v100);
          v275 = object_getClassName(self);
          v278 = sel_getName(a2);
          v102 = 45;
          if (v101)
            v102 = 43;
          v99(3, "%c[%{public}s %{public}s]:%i Invalid C-APDU %{public}@", v102, v275, v278, 1844, v299);
        }
        v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v104 = NFSharedLogGetLogger(v103);
        v105 = objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          v106 = object_getClass(self);
          if (class_isMetaClass(v106))
            v107 = 43;
          else
            v107 = 45;
          v108 = object_getClassName(self);
          v109 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v332 = v107;
          v333 = 2082;
          v334 = v108;
          v335 = 2082;
          v336 = v109;
          v337 = 1024;
          v338 = 1844;
          v339 = 2114;
          v340 = v299;
          _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid C-APDU %{public}@", buf, 0x2Cu);
        }

        v110 = objc_alloc((Class)NSError);
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "nfcd"));
        v312 = NSLocalizedDescriptionKey;
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[267], "stringWithUTF8String:", "Decoding Error"));
        v313 = v111;
        v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v313, &v312, 1));
        v113 = objc_msgSend(v110, "initWithDomain:code:userInfo:", v72, 23, v112);

        v96 = 2;
      }

      v41 = v113;
LABEL_92:

      if (v96)
        goto LABEL_177;
      v43 = v296 + 1;
    }
    while ((id)(v296 + 1) != v293);
    v293 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v304, v324, 16);
    if (v293)
      continue;
    break;
  }
LABEL_177:

  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("kVersion")));
  if (v171)
  {
    v265 = objc_opt_class(NSNumber);
    v173 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))v301;
    v150 = v292;
    v151 = v288;
    if ((objc_opt_isKindOfClass(v171, v265) & 1) != 0 || (uint64_t)objc_msgSend(v171, "integerValue") < 3)
      v266 = 2;
    else
      v266 = (uint64_t)objc_msgSend(v171, "integerValue");
  }
  else
  {
    v266 = 2;
    v173 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))v301;
    v150 = v292;
    v151 = v288;
  }
  v267 = objc_alloc((Class)NSMutableDictionary);
  v308[0] = CFSTR("kVersion");
  v268 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v266));
  v309[0] = v268;
  v309[1] = v289;
  v308[1] = CFSTR("kBatchId");
  v308[2] = CFSTR("kTaskId");
  v308[3] = CFSTR("kCommandsResponse");
  v309[2] = v150;
  v309[3] = v151;
  v269 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v309, v308, 4));
  v172 = objc_msgSend(v267, "initWithDictionary:", v269);

  v270 = -[NSMutableArray count](v151, "count");
  v271 = objc_msgSend(obj, "count");
  if (v270 != v271)
    v271 = objc_msgSend(v172, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("incompletedExecution"));
  v272 = NFSharedSignpostLog(v271);
  v273 = objc_claimAutoreleasedReturnValue(v272);
  v35 = v287;
  if (os_signpost_enabled(v273))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v273, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", ", buf, 2u);
  }

  ((void (**)(_QWORD, id, _QWORD, void *, double))v173)[2](v173, v172, 0, v41, (double)v42 / 1000.0);
  v34 = v289;
  v6 = v290;
LABEL_121:

}

- (void)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 performSearchServiceCode:(BOOL)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  BOOL v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_NFReaderSession;
  v14 = -[_NFSession workQueue](&v25, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001B2494;
  v19[3] = &unk_1002EA990;
  v22 = v13;
  v23 = a2;
  v19[4] = self;
  v20 = v11;
  v21 = v12;
  v24 = a5;
  v16 = v12;
  v17 = v11;
  v18 = v13;
  dispatch_async(v15, v19);

}

- (void)_sync_felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 performSearchServiceCode:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  NFTag *currentTag;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  NSMutableDictionary *v22;
  id v23;
  NSMutableDictionary *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  NFTag *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  unint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id *v50;
  uint64_t *v51;
  _NFReaderSession *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void (**v61)(id, _QWORD, id);
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  NSErrorUserInfoKey v76;
  NSMutableDictionary *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  NSErrorUserInfoKey v80;
  NSMutableDictionary *v81;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, id))a6;
  currentTag = self->_currentTag;
  if (currentTag
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[NFTag tagF](currentTag, "tagF")), v14, v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFTag tagF](self->_currentTag, "tagF"));
    v16 = v15;
    if (!v7)
    {
      v63 = v11;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allSystemCodes"));
      v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v67;
        while (2)
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v67 != v28)
              objc_enumerationMutation(v22);
            v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v30, "isEqualToData:", v10))
            {
              v61 = v12;
              v24 = objc_opt_new(NSMutableDictionary);
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "NF_asHexString"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v31, CFSTR("systemCode"));

              v32 = self->_currentTag;
              v64 = 0;
              v65 = 0;
              v33 = objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getIDMFromTag:systemCode:outIdm:outPmm:](self, "_getIDMFromTag:systemCode:outIdm:outPmm:", v32, v30, &v65, &v64));
              v34 = v65;
              v35 = v64;
              v59 = (void *)v33;
              v60 = v16;
              if (v33)
              {
                v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "IDm"));

                v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "PMm"));
                v38 = v35;
                v35 = (id)v37;

                v34 = (id)v36;
              }
              v11 = v63;
              v58 = v34;
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "NF_asHexString"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v39, CFSTR("idm"));

              v57 = v35;
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "NF_asHexString"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v40, CFSTR("pmm"));

              v62 = v10;
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _RequestService:forSystemCode:](self, "_RequestService:forSystemCode:", v63, v10));
              v42 = objc_opt_new(NSMutableArray);
              if (objc_msgSend(v41, "count"))
              {
                v43 = 0;
                do
                {
                  v44 = objc_alloc((Class)NSDictionary);
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v43));
                  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "NF_asHexString"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndex:", v43));
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "NF_asHexString"));
                  v49 = objc_msgSend(v44, "initWithObjectsAndKeys:", v46, CFSTR("areaCode"), v48, CFSTR("keyVersion"), 0);
                  -[NSMutableArray addObject:](v42, "addObject:", v49);

                  v11 = v63;
                  ++v43;
                }
                while ((unint64_t)objc_msgSend(v41, "count") > v43);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v42, CFSTR("areaCodeList"));
              v12 = v61;
              ((void (**)(id, NSMutableDictionary *, id))v61)[2](v61, v24, 0);

              v10 = v62;
              v16 = v60;
              goto LABEL_36;
            }
          }
          v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
          if (v27)
            continue;
          break;
        }
      }
      v11 = v63;
      goto LABEL_35;
    }
    if (v10)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allSystemCodes"));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v72;
        while (2)
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(_QWORD *)v72 != v20)
              objc_enumerationMutation(v17);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)j), "isEqualToData:", v10))
            {
              v70 = 0;
              v50 = (id *)&v70;
              v51 = &v70;
              v52 = self;
              v53 = v10;
              goto LABEL_32;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
          if (v19)
            continue;
          break;
        }
      }

      v22 = 0;
      goto LABEL_35;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "SystemCode"));
    v75 = 0;
    v50 = (id *)&v75;
    v51 = &v75;
    v52 = self;
    v53 = v17;
LABEL_32:
    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getSystemInfo:outError:](v52, "_getSystemInfo:outError:", v53, v51));
    v24 = (NSMutableDictionary *)*v50;

    if (!v22)
    {
      v22 = v24;
LABEL_35:

      v54 = objc_alloc((Class)NSError);
      v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v76 = NSLocalizedDescriptionKey;
      v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Not Found"));
      v77 = v24;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1));
      v56 = objc_msgSend(v54, "initWithDomain:code:userInfo:", v22, 28, v55);
      v12[2](v12, 0, v56);

      goto LABEL_36;
    }
    ((void (**)(id, NSMutableDictionary *, id))v12)[2](v12, v22, v24);
  }
  else
  {
    v23 = objc_alloc((Class)NSError);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v80 = NSLocalizedDescriptionKey;
    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v81 = v22;
    v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1));
    v25 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v16, 12, v24);
    v12[2](v12, 0, v25);

  }
LABEL_36:

}

- (void)updateSharingUIScanText:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, id);
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSErrorUserInfoKey v31;
  void *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;

  v7 = a3;
  v8 = (void (**)(id, id))a4;
  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v17, ClassName, Name, 2009, v16);

    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(self);
      v24 = sel_getName(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      *(_DWORD *)buf = 67110146;
      v34 = v22;
      v35 = 2082;
      v36 = v23;
      v37 = 2082;
      v38 = v24;
      v39 = 1024;
      v40 = 2009;
      v41 = 2114;
      v42 = v25;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

    }
    if (v8)
    {
      v26 = objc_alloc((Class)NSError);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v31 = NSLocalizedDescriptionKey;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
      v32 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v30 = objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 54, v29);
      v8[2](v8, v30);

    }
  }
  else
  {
    -[NFUIService coreNFCUISetScanText:](self->_uiService, "coreNFCUISetScanText:", v7);
    v8[2](v8, 0);
  }

}

- (void)updateSharingUIStateOnInvalidation:(int64_t)a3 completion:(id)a4
{
  void (**v7)(id, id);
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSErrorUserInfoKey v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;

  v7 = (void (**)(id, id))a4;
  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v16, ClassName, Name, 2023, v15);

    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(self);
      v23 = sel_getName(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      *(_DWORD *)buf = 67110146;
      v33 = v21;
      v34 = 2082;
      v35 = v22;
      v36 = 2082;
      v37 = v23;
      v38 = 1024;
      v39 = 2023;
      v40 = 2114;
      v41 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

    }
    if (v7)
    {
      v25 = objc_alloc((Class)NSError);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v30 = NSLocalizedDescriptionKey;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
      v31 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      v29 = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 54, v28);
      v7[2](v7, v29);

    }
  }
  else
  {
    self->_uiStateOnInvalidation = a3;
    v7[2](v7, 0);
  }

}

- (void)felicaRequestService:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B3468;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)felicaRequestService:(id)a3 forSystemCode:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  SEL v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_NFReaderSession;
  v12 = -[_NFSession workQueue](&v22, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B3904;
  block[3] = &unk_1002E6240;
  v20 = v11;
  v21 = a2;
  block[4] = self;
  v18 = v9;
  v19 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v11;
  dispatch_async(v13, block);

}

- (void)writeProtectNDEFTagWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFReaderSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B3D58;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)performVAS:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B4408;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)configurePollingProfile:(int64_t)a3 completion:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  int64_t v14;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_NFReaderSession;
  v8 = -[_NFSession workQueue](&v15, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B5048;
  v11[3] = &unk_1002E6638;
  v11[4] = self;
  v12 = v7;
  v13 = a2;
  v14 = a3;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4 completion:(id)a5
{
  void (**v9)(id, id);
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  OS_dispatch_queue *v32;
  NSObject *v33;
  _QWORD block[5];
  void (**v35)(id, id);
  SEL v36;
  BOOL v37;
  BOOL v38;
  objc_super v39;
  NSErrorUserInfoKey v40;
  void *v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;

  v9 = (void (**)(id, id))a5;
  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v18, ClassName, Name, 2176, v17);

    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      *(_DWORD *)buf = 67110146;
      v43 = v23;
      v44 = 2082;
      v45 = v24;
      v46 = 2082;
      v47 = v25;
      v48 = 1024;
      v49 = 2176;
      v50 = 2114;
      v51 = v26;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

    }
    if (v9)
    {
      v27 = objc_alloc((Class)NSError);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v40 = NSLocalizedDescriptionKey;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
      v41 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
      v31 = objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 54, v30);
      v9[2](v9, v31);

    }
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)_NFReaderSession;
    v32 = -[_NFSession workQueue](&v39, "workQueue");
    v33 = objc_claimAutoreleasedReturnValue(v32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B5AC8;
    block[3] = &unk_1002E6358;
    block[4] = self;
    v36 = a2;
    v35 = v9;
    v37 = a3;
    v38 = a4;
    dispatch_async(v33, block);

  }
}

- (BOOL)suspendWithInfo:(id)a3
{
  id v4;
  _BOOL4 v5;
  NFTag *currentTag;
  NFTag *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_NFReaderSession;
  v5 = -[_NFXPCSession suspendWithInfo:](&v19, "suspendWithInfo:", v4);
  if (v5)
  {
    currentTag = self->_currentTag;
    if (currentTag)
    {
      sub_10017EF78(self->_driverWrapper, currentTag, 0);
      v7 = self->_currentTag;
      self->_currentTag = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
    sub_10019D694((uint64_t)WeakRetained, self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    objc_msgSend(v9, "notifyReaderModeActivityEnd");

    self->_pollingConfig = 0;
    if (self->_continuousWaveState)
      v10 = sub_1001D6A14(self->_driverWrapper, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_numberForKey:", CFSTR("ReasonCode")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession suspendOnFieldList](self, "suspendOnFieldList"));
    if (objc_msgSend(v12, "count") && v11 && objc_msgSend(v11, "integerValue") == (id)2)
    {
      v13 = sub_1001F8494(self->_driverWrapper);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_msgSend(v14, "wantsReader");

      if (!v15)
      {
LABEL_12:
        -[_NFReaderSession cleanupUI](self, "cleanupUI");

        goto LABEL_13;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
      v17 = objc_msgSend(v12, "setRoutingConfig:", v16);

    }
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (void)resume
{
  unint64_t continuousWaveState;
  void *v5;
  void *v6;
  char *v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  const char *v34;
  id v35;
  const char *ClassName;
  const char *Name;
  objc_super v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;

  v38.receiver = self;
  v38.super_class = (Class)_NFReaderSession;
  -[_NFXPCSession resume](&v38, "resume");
  continuousWaveState = self->_continuousWaveState;
  if (continuousWaveState)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
    v7 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setRoutingConfig:", v6));

    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    if (v7)
    {
      if (Logger)
      {
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v13 = 45;
        if (isMetaClass)
          v13 = 43;
        v10(3, "%c[%{public}s %{public}s]:%i Failed to resume Continous Wave - %{public}@", v13, ClassName, Name, 2250, v7);
      }
      v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v15 = NFSharedLogGetLogger(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = object_getClass(self);
        if (class_isMetaClass(v17))
          v18 = 43;
        else
          v18 = 45;
        v19 = object_getClassName(self);
        v20 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v40 = v18;
        v41 = 2082;
        v42 = v19;
        v43 = 2082;
        v44 = v20;
        v45 = 1024;
        v46 = 2250;
        v47 = 2114;
        v48 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to resume Continous Wave - %{public}@", buf, 0x2Cu);
      }

    }
    else
    {
      if (Logger)
      {
        v21 = object_getClass(self);
        v22 = class_isMetaClass(v21);
        v23 = object_getClassName(self);
        v24 = sel_getName(a2);
        if (continuousWaveState == 2)
          v25 = "with";
        else
          v25 = "without";
        v26 = 45;
        if (v22)
          v26 = 43;
        v10(6, "%c[%{public}s %{public}s]:%i Resuming ContinuousWave %s freq sweep", v26, v23, v24, 2252, v25);
      }
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = NFSharedLogGetLogger(v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = object_getClass(self);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        v32 = object_getClassName(self);
        v33 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        if (continuousWaveState == 2)
          v34 = "with";
        else
          v34 = "without";
        v40 = v31;
        v41 = 2082;
        v42 = v32;
        v43 = 2082;
        v44 = v33;
        v45 = 1024;
        v46 = 2252;
        v47 = 2080;
        v48 = v34;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resuming ContinuousWave %s freq sweep", buf, 0x2Cu);
      }

      v35 = sub_1001D6A14(self->_driverWrapper, 1, continuousWaveState == 2);
    }

  }
}

- (void)_tagRemovalDetect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NFDriverWrapper *driverWrapper;
  int v12;
  NFDriverWrapper *v13;
  int v14;
  id v15;
  OS_dispatch_queue *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v20;
  _QWORD v21[6];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "controllerInfo"));
  v7 = objc_msgSend(v6, "siliconName");

  if ((unint64_t)v7 >= 7)
  {
    v9 = NFSharedSignpostLog(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "tagRemovalDetect", ", buf, 2u);
    }

    driverWrapper = self->_driverWrapper;
    if (driverWrapper)
    {
      v12 = sub_10017E9A4(driverWrapper, v4, 0);
      if (v12)
        goto LABEL_8;
      driverWrapper = self->_driverWrapper;
    }
    v12 = sub_10017EF78(driverWrapper, v4, 1);
LABEL_8:
    if (v12 != 51)
      goto LABEL_15;
    goto LABEL_14;
  }
  v13 = self->_driverWrapper;
  if (!v13)
    goto LABEL_13;
  v14 = sub_10017E9A4(v13, v4, 0);
  if (v14 == 51)
  {
LABEL_14:
    sub_1001FBF60(self->_driverWrapper);
    goto LABEL_15;
  }
  if (!v14)
  {
LABEL_13:
    objc_initWeak(&location, self);
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x3032000000;
    v32 = sub_1001B6950;
    v33 = sub_1001B6960;
    v34 = v4;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = sub_1001B6950;
    v27 = sub_1001B6960;
    v28 = 0;
    v15 = objc_alloc((Class)NFTimer);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001B6968;
    v21[3] = &unk_1002EA9B8;
    objc_copyWeak(&v22, &location);
    v21[4] = buf;
    v21[5] = &v23;
    v20.receiver = self;
    v20.super_class = (Class)_NFReaderSession;
    v16 = -[_NFSession workQueue](&v20, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v15, "initWithCallback:queue:", v21, v17);
    v19 = (void *)v24[5];
    v24[5] = (uint64_t)v18;

    objc_msgSend((id)v24[5], "startTimer:", 0.5);
    _Block_object_dispose(&v23, 8);

    objc_destroyWeak(&v22);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&location);
  }
LABEL_15:

}

- (unsigned)_getTagTypeFromTag:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "type");
  if (v3 > 0x10)
    return 0;
  else
    return dword_10026A844[v3];
}

- (BOOL)_isCoreNFCSession
{
  return self->_serviceType == 2;
}

- (_NFDriverTagDiscoveryNtf)_getTagNotificationConfig
{
  return (_NFDriverTagDiscoveryNtf)(((self->_sessionConfig & 4) == 0) | 0x6FE);
}

- (BOOL)_processRawTagsForInternalSession:(id)a3 supportedTags:(id)a4 outError:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NFDriverWrapper *driverWrapper;
  unsigned int v20;
  BOOL v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v35;
  const char *sel;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[4];
  _BYTE v47[128];

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if ((self->_pollingProfile - 1) <= 2)
  {
    objc_msgSend(v10, "addObjectsFromArray:", v9);
    v12 = 1;
    goto LABEL_38;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  v12 = 1;
  if (!v14)
    goto LABEL_37;
  v15 = v14;
  sel = a2;
  v37 = v9;
  v16 = *(_QWORD *)v40;
  v38 = v11;
LABEL_5:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v40 != v16)
      objc_enumerationMutation(v13);
    v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v17);
    if (objc_msgSend(v18, "type"))
    {
      if (objc_msgSend(v18, "type") != 10)
        break;
    }
LABEL_28:
    if (v15 == (id)++v17)
    {
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v15)
        goto LABEL_5;
LABEL_30:
      v12 = 1;
LABEL_34:
      v9 = v37;
      goto LABEL_37;
    }
  }
  if (!-[_NFReaderSession _requiresTypeFUpdate:](self, "_requiresTypeFUpdate:", v18)
    && !-[_NFReaderSession _requiresMifareUpdate:](self, "_requiresMifareUpdate:", v18))
  {
    objc_msgSend(v11, "addObject:", v18);
LABEL_26:
    if (objc_msgSend(v11, "count") && (self->_sessionConfig & 0x40) != 0)
      goto LABEL_30;
    goto LABEL_28;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper
    || ((v20 = sub_10017E9A4(driverWrapper, v18, 0), v20 - 35 <= 0x1D)
      ? (v21 = ((1 << (v20 - 35)) & 0x20010001) == 0)
      : (v21 = 1),
        v21))
  {
    v11 = v38;
    if (-[_NFReaderSession _updateFelicaTagInfo:outError:](self, "_updateFelicaTagInfo:outError:", v18, a5)
      && -[_NFReaderSession _updateMifareTagInfo:outError:](self, "_updateMifareTagInfo:outError:", v18, a5))
    {
      objc_msgSend(v38, "addObject:", v18);
    }
    if (objc_msgSend(*a5, "code") == (id)51 || objc_msgSend(*a5, "code") == (id)64)
    {
      v12 = 0;
      goto LABEL_34;
    }
    if (sub_10017EF78(self->_driverWrapper, v18, 0) == 51)
    {
      v24 = objc_alloc((Class)NSError);
      v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v43[0] = NSLocalizedDescriptionKey;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "RF Deactivated"));
      v44[0] = v26;
      v44[1] = &off_100300F80;
      v43[1] = CFSTR("Line");
      v43[2] = CFSTR("Method");
      v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
      v44[2] = v27;
      v43[3] = NSDebugDescriptionErrorKey;
      v28 = (void *)v25;
      v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 2403);
      v44[3] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 4));
      v31 = v24;
      v32 = v28;
      v33 = 51;
      goto LABEL_35;
    }
    goto LABEL_26;
  }
  if (!a5)
    goto LABEL_36;
  v22 = v20;
  v35 = objc_alloc((Class)NSError);
  v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v45[0] = NSLocalizedDescriptionKey;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v22]));
  v46[0] = v26;
  v46[1] = &off_100300F68;
  v45[1] = CFSTR("Line");
  v45[2] = CFSTR("Method");
  v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
  v46[2] = v27;
  v45[3] = NSDebugDescriptionErrorKey;
  v28 = (void *)v23;
  v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 2389);
  v46[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 4));
  v31 = v35;
  v32 = v28;
  v33 = v22;
LABEL_35:
  *a5 = objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, v33, v30);

LABEL_36:
  v12 = 0;
  v9 = v37;
  v11 = v38;
LABEL_37:

LABEL_38:
  return v12;
}

- (BOOL)_processRawTagsForNDEF:(id)a3 ndefMessages:(id)a4 supportedTags:(id)a5 caEvents:(id)a6 outError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  NFDriverWrapper *driverWrapper;
  unsigned int v21;
  unsigned int v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  int v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  const char *sel;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  BOOL v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[4];
  _BYTE v75[128];

  v12 = a3;
  v61 = a4;
  v59 = a5;
  v58 = a6;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (!v14)
  {
    v39 = 0;
    v40 = v13;
    v41 = a7;
    goto LABEL_51;
  }
  v15 = v14;
  sel = a2;
  v62 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v68;
  v63 = v13;
  v60 = *(_QWORD *)v68;
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(_QWORD *)v68 != v17)
        objc_enumerationMutation(v13);
      v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v19, "type") && objc_msgSend(v19, "type") != 10)
      {
        driverWrapper = self->_driverWrapper;
        if (driverWrapper)
        {
          v21 = sub_10017E9A4(driverWrapper, v19, 0);
          v22 = v21;
          switch(v21)
          {
            case '@':
              goto LABEL_41;
            case '3':
              goto LABEL_46;
            case '#':
LABEL_41:
              v42 = objc_alloc((Class)NSError);
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
              v44 = v22;
              v73[0] = NSLocalizedDescriptionKey;
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v22]));
              v74[0] = v45;
              v74[1] = &off_100300F98;
              v73[1] = CFSTR("Line");
              v73[2] = CFSTR("Method");
              v46 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
              v74[2] = v46;
              v73[3] = NSDebugDescriptionErrorKey;
              v47 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 2437);
              v74[3] = v47;
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 4));
              v49 = objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, v44, v48);

              v13 = v63;
              v16 = v49;
              goto LABEL_49;
          }
        }
        v66 = v16;
        -[_NFReaderSession _updateFelicaTagInfo:outError:](self, "_updateFelicaTagInfo:outError:", v19, &v66);
        v23 = v66;

        if (v23)
        {
          if (objc_msgSend(v23, "code") == (id)51)
          {
            v16 = v23;
LABEL_46:
            v13 = v63;
            goto LABEL_47;
          }
          if (objc_msgSend(v23, "code") == (id)64)
          {
            v13 = v63;

            v16 = v23;
            goto LABEL_49;
          }
        }
        v24 = sub_100226308((uint64_t)NFTagReadCALogger);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        sub_100226374((uint64_t)v25, v19);

        v64 = v23;
        v65 = 0;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _readNdefMessageFromTag:rawLength:error:](self, "_readNdefMessageFromTag:rawLength:error:", v19, &v65, &v64));
        v16 = v64;

        if (v26)
          v27 = v16 == 0;
        else
          v27 = 0;
        v28 = v27;
        if (v16 && objc_msgSend(v16, "code") == (id)64)
        {
LABEL_42:

          v13 = v63;
          goto LABEL_43;
        }
        if (v26)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "asData"));
          v30 = objc_msgSend(v29, "length");

          v31 = sub_100226308((uint64_t)NFTagReadCALogger);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          sub_10022684C((uint64_t)v32, (uint64_t)v30);

        }
        v33 = sub_10017EF78(self->_driverWrapper, v19, 0);
        if (objc_msgSend(v19, "type"))
          v34 = objc_msgSend(v19, "type");
        else
          v34 = sub_10017E740((uint64_t)self->_driverWrapper, v19);
        v35 = v34;
        v36 = sub_100226308((uint64_t)NFTagReadCALogger);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        sub_100226434((uint64_t)v37, v19, v35);

        v62 = v33 == 51;
        v13 = v63;
        if (v26)
        {
          ++self->_totalTagRead;
          objc_msgSend(v61, "addObject:", v26);
          v38 = objc_msgSend(objc_alloc((Class)NFTagInternal), "initWithNFTagForUIDOnly:", v19);
          if (v38)
            objc_msgSend(v59, "addObject:", v38);

          if (v28)
          {
            if ((self->_sessionConfig & 0x40) != 0 || v33 == 51)
              goto LABEL_42;
            goto LABEL_36;
          }
        }
        if (v33 != 51)
        {
LABEL_36:

          v17 = v60;
          continue;
        }

LABEL_47:
        v41 = a7;
        goto LABEL_50;
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    if (v15)
      continue;
    break;
  }
LABEL_43:

LABEL_49:
  v41 = a7;
  if (!v62)
    goto LABEL_52;
LABEL_50:
  v50 = objc_alloc((Class)NSError);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v71[0] = NSLocalizedDescriptionKey;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "RF Deactivated"));
  v72[0] = v51;
  v72[1] = &off_100300FB0;
  v71[1] = CFSTR("Line");
  v71[2] = CFSTR("Method");
  v52 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
  v72[2] = v52;
  v71[3] = NSDebugDescriptionErrorKey;
  v53 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 2490);
  v72[3] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 4));
  v39 = objc_msgSend(v50, "initWithDomain:code:userInfo:", v40, 51, v54);

  v13 = v63;
LABEL_51:

  v16 = v39;
LABEL_52:
  if (v41)
    *v41 = objc_retainAutorelease(v16);

  return v16 == 0;
}

- (BOOL)_processRawTagsForCoreNFC:(id)a3 requireDiscoveryRestart:(BOOL *)a4 supportedTags:(id)a5 caEvents:(id)a6 outError:(id *)a7 outConnectedTagIndex:(unint64_t *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *specific;
  uint64_t Logger;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  unint64_t pollOption;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  objc_class *v72;
  int v73;
  const char *v74;
  const char *v75;
  NFTag *currentTag;
  void *v77;
  BOOL v78;
  void *v79;
  uint64_t v80;
  void (*v81)(uint64_t, const char *, ...);
  objc_class *v82;
  _BOOL4 v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  objc_class *v89;
  int v90;
  const char *v91;
  const char *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  const char *ClassName;
  const char *v101;
  const char *Name;
  const char *v103;
  const char *v104;
  const char *v105;
  id v107;
  id *v108;
  id v109;
  id v110;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[3];
  _QWORD v121[3];
  _QWORD v122[4];
  _QWORD v123[4];
  uint8_t buf[4];
  int v125;
  __int16 v126;
  const char *v127;
  __int16 v128;
  const char *v129;
  __int16 v130;
  int v131;
  __int16 v132;
  void *v133;
  _BYTE v134[128];

  v12 = a3;
  v109 = a5;
  v13 = a6;
  if (a7)
    *a7 = 0;
  v107 = v13;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
  v110 = v14;
  if (!v15)
  {
    v17 = 0;
    goto LABEL_79;
  }
  v16 = v15;
  v108 = a7;
  v17 = 0;
  v18 = *(_QWORD *)v117;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(_QWORD *)v117 != v18)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)i);
      if (!objc_msgSend(v20, "type") || objc_msgSend(v20, "type") == 10)
        continue;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v23 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v26 = 45;
        if (isMetaClass)
          v26 = 43;
        v23(6, "%c[%{public}s %{public}s]:%i tag: %{public}@", v26, ClassName, Name, 2514, v20);
      }
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = NFSharedLogGetLogger(v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = object_getClass(self);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        v32 = object_getClassName(self);
        v33 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v125 = v31;
        v14 = v110;
        v126 = 2082;
        v127 = v32;
        v128 = 2082;
        v129 = v33;
        v130 = 1024;
        v131 = 2514;
        v132 = 2114;
        v133 = v20;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag: %{public}@", buf, 0x2Cu);
      }

      if (v17)
      {
        v34 = sub_10017EF78(self->_driverWrapper, v17, 0);
        if (v34)
        {
          if (v34 == 51)
          {
            v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v80 = NFLogGetLogger(v79);
            if (v80)
            {
              v81 = (void (*)(uint64_t, const char *, ...))v80;
              v82 = object_getClass(self);
              v83 = class_isMetaClass(v82);
              v84 = object_getClassName(self);
              v105 = sel_getName(a2);
              v85 = 45;
              if (v83)
                v85 = 43;
              v81(6, "%c[%{public}s %{public}s]:%i Tag deactivated", v85, v84, v105, 2521);
            }
            v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v87 = NFSharedLogGetLogger(v86);
            v88 = objc_claimAutoreleasedReturnValue(v87);
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              v89 = object_getClass(self);
              if (class_isMetaClass(v89))
                v90 = 43;
              else
                v90 = 45;
              v91 = object_getClassName(self);
              v92 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v125 = v90;
              v126 = 2082;
              v127 = v91;
              v128 = 2082;
              v129 = v92;
              v130 = 1024;
              v131 = 2521;
              _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag deactivated", buf, 0x22u);
            }

            if (v108)
            {
              v93 = objc_alloc((Class)NSError);
              v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
              v122[0] = NSLocalizedDescriptionKey;
              v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "RF Deactivated"));
              v123[0] = v95;
              v123[1] = &off_100300FC8;
              v122[1] = CFSTR("Line");
              v122[2] = CFSTR("Method");
              v96 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
              v123[2] = v96;
              v122[3] = NSDebugDescriptionErrorKey;
              v97 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2522);
              v123[3] = v97;
              v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 4));
              *v108 = objc_msgSend(v93, "initWithDomain:code:userInfo:", v94, 51, v98);

            }
            goto LABEL_109;
          }
          v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v36 = NFLogGetLogger(v35);
          if (v36)
          {
            v37 = (void (*)(uint64_t, const char *, ...))v36;
            v38 = object_getClass(self);
            v39 = class_isMetaClass(v38);
            v40 = object_getClassName(self);
            v103 = sel_getName(a2);
            v41 = 45;
            if (v39)
              v41 = 43;
            v37(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v41, v40, v103, 2526);
          }
          v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v43 = NFSharedLogGetLogger(v42);
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = object_getClass(self);
            if (class_isMetaClass(v45))
              v46 = 43;
            else
              v46 = 45;
            v47 = object_getClassName(self);
            v48 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v125 = v46;
            v14 = v110;
            v126 = 2082;
            v127 = v47;
            v128 = 2082;
            v129 = v48;
            v130 = 1024;
            v131 = 2526;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
          }

        }
      }
      buf[0] = 0;
      pollOption = self->_pollOption;
      if ((pollOption & 4) != 0)
      {
        if (objc_msgSend(v20, "type") == 8)
        {
          v115 = 0;
          v50 = (id)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _processISO15693TagForCoreNFC:outError:](self, "_processISO15693TagForCoreNFC:outError:", v20, &v115));
          v51 = v115;
          goto LABEL_60;
        }
        pollOption = self->_pollOption;
      }
      if ((pollOption & 8) != 0
        && -[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess")
        && (objc_msgSend(v20, "type") == 3
         || objc_msgSend(v20, "type") == 6
         || objc_msgSend(v20, "type") == 2
         || objc_msgSend(v20, "type") == 5
         || objc_msgSend(v20, "type") == 9)
        && (self->_sessionConfig & 8) == 0)
      {
        v114 = 0;
        v50 = (id)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _processISO14443TagForCoreNFC:tagIsConnected:outError:](self, "_processISO14443TagForCoreNFC:tagIsConnected:outError:", v20, buf, &v114));
        v52 = v114;
        if (!v50)
          goto LABEL_72;
        goto LABEL_61;
      }
      if ((self->_pollOption & 0x10) != 0
        && -[NFServiceWhitelistChecker nfcTagReaderAccess](self->_tagWhiteList, "nfcTagReaderAccess")
        && objc_msgSend(v20, "type") == 7)
      {
        v113 = 0;
        v50 = (id)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _processFelicaTagForCoreNFC:outError:](self, "_processFelicaTagForCoreNFC:outError:", v20, &v113));
        v51 = v113;
        goto LABEL_60;
      }
      if ((self->_pollOption & 8) == 0
        || !-[NFServiceWhitelistChecker nfcVASReaderAccess](self->_tagWhiteList, "nfcVASReaderAccess")
        || objc_msgSend(v20, "type") != 3
        || (self->_sessionConfig & 8) == 0)
      {
        if ((self->_pollOption & 2) == 0
          || !-[NFServiceWhitelistChecker nfcNDEFReaderAccess](self->_tagWhiteList, "nfcNDEFReaderAccess")
          || (self->_sessionConfig & 0x10) == 0)
        {
          v50 = 0;
          v17 = 0;
LABEL_73:

          continue;
        }
        v112 = 0;
        v50 = (id)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _processNDEFTagForCoreNFC:outError:](self, "_processNDEFTagForCoreNFC:outError:", v20, &v112));
        v51 = v112;
LABEL_60:
        v52 = v51;
        buf[0] = v50 != 0;
        if (!v50)
          goto LABEL_72;
        goto LABEL_61;
      }
      v56 = objc_alloc((Class)NFTagInternal);
      v120[0] = CFSTR("type");
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "type")));
      v121[0] = v57;
      v120[1] = CFSTR("technology");
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "technology")));
      v121[1] = v58;
      v120[2] = CFSTR("UID");
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UID"));
      v121[2] = v59;
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v121, v120, 3));
      v50 = objc_msgSend(v56, "initWithDictionary:", v60);

      v14 = v110;
      v52 = 0;
      if (!v50)
      {
LABEL_72:
        v17 = 0;
        if (!v52)
          goto LABEL_73;
        goto LABEL_66;
      }
LABEL_61:
      if (buf[0])
        v53 = v50;
      else
        v53 = 0;
      v17 = v53;
      objc_msgSend(v109, "addObject:", v50);
      if ((self->_sessionConfig & 0x40) != 0)
      {

        goto LABEL_79;
      }
      if (!v52)
        goto LABEL_73;
LABEL_66:
      if (objc_msgSend(v52, "code") == (id)51)
      {
        if (v108)
LABEL_96:
          *v108 = objc_retainAutorelease(v52);

LABEL_109:
        v78 = 0;
        v77 = v107;
        goto LABEL_110;
      }
      v54 = objc_msgSend(v52, "code");
      v55 = v54;
      if (v108 && v54 == (id)64)
        goto LABEL_96;

      if (v55 == (id)64)
        goto LABEL_109;
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
    if (v16)
      continue;
    break;
  }
LABEL_79:

  if (!objc_msgSend(v109, "count"))
  {
    v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = NFLogGetLogger(v62);
    if (v63)
    {
      v64 = (void (*)(uint64_t, const char *, ...))v63;
      v65 = object_getClass(self);
      v66 = class_isMetaClass(v65);
      v67 = object_getClassName(self);
      v104 = sel_getName(a2);
      v68 = 45;
      if (v66)
        v68 = 43;
      v101 = v67;
      v14 = v110;
      v64(6, "%c[%{public}s %{public}s]:%i No supported tag found", v68, v101, v104, 2586);
    }
    v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v70 = NFSharedLogGetLogger(v69);
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = object_getClass(self);
      if (class_isMetaClass(v72))
        v73 = 43;
      else
        v73 = 45;
      v74 = object_getClassName(self);
      v75 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v125 = v73;
      v126 = 2082;
      v127 = v74;
      v128 = 2082;
      v129 = v75;
      v130 = 1024;
      v131 = 2586;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No supported tag found", buf, 0x22u);
    }

    goto LABEL_93;
  }
  if (!v17)
  {
    currentTag = self->_currentTag;
    self->_currentTag = 0;

LABEL_93:
    v61 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_94;
  }
  ++self->_totalTagRead;
  self->_uiStateOnInvalidation = 1;
  objc_storeStrong((id *)&self->_currentTag, v17);
  v61 = (unint64_t)objc_msgSend(v109, "indexOfObject:", v17);
LABEL_94:
  v77 = v107;
  *a8 = v61;
  v78 = 1;
LABEL_110:

  return v78;
}

- (id)_processISO15693TagForCoreNFC:(id)a3 outError:(id *)a4
{
  id v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  NFDriverWrapper *driverWrapper;
  unsigned int v21;
  unsigned int v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  NFServiceWhitelistChecker *tagWhiteList;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  NFServiceWhitelistChecker *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  const char *v55;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  void *v69;
  id v70;
  unsigned int v71;
  unsigned int v72;
  void *v73;
  uint64_t v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  _BOOL4 v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  objc_class *v83;
  int v84;
  const char *v85;
  const char *v86;
  int v87;
  void *v88;
  const char *Name;
  const char *v91;
  const char *v92;
  const char *v93;
  id *v94;
  _QWORD v95[4];
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[4];
  uint8_t buf[4];
  int v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  int v110;

  v7 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 2604);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67109890;
    v104 = v19;
    v105 = 2082;
    v106 = object_getClassName(self);
    v107 = 2082;
    v108 = sel_getName(a2);
    v109 = 1024;
    v110 = 2604;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  driverWrapper = self->_driverWrapper;
  if (driverWrapper)
  {
    v21 = sub_10017E9A4(driverWrapper, v7, 0);
    if (v21)
    {
      if (!a4)
      {
LABEL_57:
        v70 = 0;
        goto LABEL_58;
      }
      v22 = v21;
      v23 = objc_alloc((Class)NSError);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v25 = v22;
      v101[0] = NSLocalizedDescriptionKey;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v22]));
      v102[0] = v26;
      v102[1] = &off_100300FE0;
      v101[1] = CFSTR("Line");
      v101[2] = CFSTR("Method");
      v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v102[2] = v27;
      v101[3] = NSDebugDescriptionErrorKey;
      v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2608);
      v102[3] = v28;
      v29 = v102;
      v30 = v101;
LABEL_56:
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v30, 4));
      *a4 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, v25, v88);

      goto LABEL_57;
    }
  }
  tagWhiteList = self->_tagWhiteList;
  if ((self->_sessionConfig & 0x20) != 0)
  {
    if (-[NFServiceWhitelistChecker nfcISO15693ReaderAccess](tagWhiteList, "nfcISO15693ReaderAccess"))
    {
      v39 = self->_tagWhiteList;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tagID"));
      LODWORD(v39) = -[NFServiceWhitelistChecker validateISO15693TagAcesssWithUID:](v39, "validateISO15693TagAcesssWithUID:", v40);

      if (!(_DWORD)v39)
      {
        v94 = a4;
        v32 = objc_alloc((Class)NFTagInternal);
        v99[0] = CFSTR("type");
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "type")));
        v100[0] = v33;
        v99[1] = CFSTR("technology");
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "technology")));
        v100[1] = v34;
        v99[2] = CFSTR("identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tagID"));
        v100[2] = v35;
        v99[3] = CFSTR("UID");
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UID"));
        v100[3] = v36;
        v37 = v100;
        v38 = v99;
        goto LABEL_40;
      }
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFLogGetLogger(v41);
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(self);
        v45 = class_isMetaClass(v44);
        v46 = object_getClassName(self);
        v91 = sel_getName(a2);
        v47 = 45;
        if (v45)
          v47 = 43;
        v43(3, "%c[%{public}s %{public}s]:%i Tag and entitlement value do not match", v47, v46, v91, 2624);
      }
      v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFSharedLogGetLogger(v48);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
LABEL_38:

        goto LABEL_41;
      }
      v51 = object_getClass(self);
      if (class_isMetaClass(v51))
        v52 = 43;
      else
        v52 = 45;
      v53 = object_getClassName(self);
      v54 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v104 = v52;
      v105 = 2082;
      v106 = v53;
      v107 = 2082;
      v108 = v54;
      v109 = 1024;
      v110 = 2624;
      v55 = "%c[%{public}s %{public}s]:%i Tag and entitlement value do not match";
    }
    else
    {
      v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = NFLogGetLogger(v56);
      if (v57)
      {
        v58 = (void (*)(uint64_t, const char *, ...))v57;
        v59 = object_getClass(self);
        v60 = class_isMetaClass(v59);
        v61 = object_getClassName(self);
        v92 = sel_getName(a2);
        v62 = 45;
        if (v60)
          v62 = 43;
        v58(3, "%c[%{public}s %{public}s]:%i Missing required entitlement for NFCISO15693ReaderSession", v62, v61, v92, 2627);
      }
      v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v64 = NFSharedLogGetLogger(v63);
      v50 = objc_claimAutoreleasedReturnValue(v64);
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      v65 = object_getClass(self);
      if (class_isMetaClass(v65))
        v66 = 43;
      else
        v66 = 45;
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v104 = v66;
      v105 = 2082;
      v106 = v67;
      v107 = 2082;
      v108 = v68;
      v109 = 1024;
      v110 = 2627;
      v55 = "%c[%{public}s %{public}s]:%i Missing required entitlement for NFCISO15693ReaderSession";
    }
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v55, buf, 0x22u);
    goto LABEL_38;
  }
  if (!-[NFServiceWhitelistChecker nfcTagReaderAccess](tagWhiteList, "nfcTagReaderAccess"))
    goto LABEL_41;
  v94 = a4;
  v32 = objc_alloc((Class)NFTagInternal);
  v97[0] = CFSTR("type");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "type")));
  v98[0] = v33;
  v97[1] = CFSTR("technology");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "technology")));
  v98[1] = v34;
  v97[2] = CFSTR("identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tagID"));
  v98[2] = v35;
  v97[3] = CFSTR("UID");
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UID"));
  v98[3] = v36;
  v37 = v98;
  v38 = v97;
LABEL_40:
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v38, 4));
  v70 = objc_msgSend(v32, "initWithDictionary:", v69);

  a4 = v94;
  if (!v70)
  {
LABEL_41:
    v71 = sub_10017EF78(self->_driverWrapper, v7, 0);
    if (!v71)
      goto LABEL_57;
    v72 = v71;
    v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v74 = NFLogGetLogger(v73);
    if (v74)
    {
      v75 = (void (*)(uint64_t, const char *, ...))v74;
      v76 = object_getClass(self);
      v77 = class_isMetaClass(v76);
      v78 = object_getClassName(self);
      v93 = sel_getName(a2);
      v79 = 45;
      if (v77)
        v79 = 43;
      v75(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v79, v78, v93, 2640);
    }
    v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v81 = NFSharedLogGetLogger(v80);
    v82 = objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      v83 = object_getClass(self);
      if (class_isMetaClass(v83))
        v84 = 43;
      else
        v84 = 45;
      v85 = object_getClassName(self);
      v86 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v104 = v84;
      v105 = 2082;
      v106 = v85;
      v107 = 2082;
      v108 = v86;
      v109 = 1024;
      v110 = 2640;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
    }

    if (!a4)
      goto LABEL_57;
    v23 = objc_alloc((Class)NSError);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v25 = v72;
    v95[0] = NSLocalizedDescriptionKey;
    if (v72 >= 0x47)
      v87 = 71;
    else
      v87 = v72;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v87]));
    v96[0] = v26;
    v96[1] = &off_100300FF8;
    v95[1] = CFSTR("Line");
    v95[2] = CFSTR("Method");
    v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v96[2] = v27;
    v95[3] = NSDebugDescriptionErrorKey;
    v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2641);
    v96[3] = v28;
    v29 = v96;
    v30 = v95;
    goto LABEL_56;
  }
LABEL_58:

  return v70;
}

- (id)_processIso14Tag:(id)a3 connected:(BOOL *)a4 appFound:(id *)a5 updatedTag:(id *)a6
{
  id v10;
  NSMutableOrderedSet *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  int pollingConfig;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  Block_layout *v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  objc_class *v61;
  _BOOL4 v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  void *v72;
  unsigned int v73;
  unsigned int v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  id v83;
  void *specific;
  uint64_t Logger;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  objc_class *v94;
  int v95;
  const char *v96;
  const char *v97;
  id v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *Name;
  NSMutableOrderedSet *v103;
  id v105;
  NSErrorUserInfoKey v106;
  void *v107;
  _QWORD v108[4];
  _QWORD v109[4];
  NSErrorUserInfoKey v110;
  void *v111;
  NSErrorUserInfoKey v112;
  void *v113;
  uint8_t buf[4];
  int v115;
  __int16 v116;
  const char *v117;
  __int16 v118;
  const char *v119;
  __int16 v120;
  int v121;

  v10 = a3;
  *a4 = 0;
  v11 = self->_iso7816AppList;
  v12 = 0;
  if ((self->_sessionConfig & 0x100) == 0)
  {
LABEL_39:
    v73 = sub_10017E9A4(self->_driverWrapper, v10, a6);
    if (v73 - 35 <= 0x1D && ((1 << (v73 - 35)) & 0x20010001) != 0)
    {
      v75 = v73;
      v76 = objc_alloc((Class)NSError);
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v77 = v75;
      v108[0] = NSLocalizedDescriptionKey;
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v75]));
      v109[0] = v78;
      v109[1] = &off_100301010;
      v108[1] = CFSTR("Line");
      v108[2] = CFSTR("Method");
      v79 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v109[2] = v79;
      v108[3] = NSDebugDescriptionErrorKey;
      v80 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2688);
      v109[3] = v80;
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v109, v108, 4));
      v37 = objc_msgSend(v76, "initWithDomain:code:userInfo:", v55, v77, v81);

      goto LABEL_44;
    }
    *a4 = 1;
    if ((v12 & 1) != 0 || (self->_sessionConfig & 0x400) == 0)
    {
      v105 = 0;
      -[_NFReaderSession _findAppFromSet:tag:foundApp:outError:](self, "_findAppFromSet:tag:foundApp:outError:", v11, v10, a5, &v105);
      v83 = v105;
LABEL_52:
      v37 = v83;
      goto LABEL_45;
    }
    if (objc_msgSend(v10, "type") == 3 || objc_msgSend(v10, "type") == 6)
    {
      v83 = (id)objc_claimAutoreleasedReturnValue(-[_NFReaderSession detectPaceAppOnTag:appFound:](self, "detectPaceAppOnTag:appFound:", v10, a5));
      goto LABEL_52;
    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v86 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v90 = 45;
      if (isMetaClass)
        v90 = 43;
      v86(6, "%c[%{public}s %{public}s]:%i Only ISODEP tag supports PACE", v90, ClassName, Name, 2698);
    }
    v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v92 = NFSharedLogGetLogger(v91);
    v93 = objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      v94 = object_getClass(self);
      if (class_isMetaClass(v94))
        v95 = 43;
      else
        v95 = 45;
      v96 = object_getClassName(self);
      v97 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v115 = v95;
      v116 = 2082;
      v117 = v96;
      v118 = 2082;
      v119 = v97;
      v120 = 1024;
      v121 = 2698;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Only ISODEP tag supports PACE", buf, 0x22u);
    }

    v98 = objc_alloc((Class)NSError);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v106 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Not Found"));
    v107 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));
    v58 = v98;
    v59 = v55;
    v60 = 28;
LABEL_27:
    v37 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, v60, v57);

LABEL_44:
    goto LABEL_45;
  }
  if (objc_msgSend(v10, "type") != 5)
    goto LABEL_15;
  *(_DWORD *)buf = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tagB"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pupi"));
  v103 = v11;
  v15 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 4);
  v16 = objc_msgSend(v14, "isEqualToData:", v15);

  v11 = v103;
  if (!v16)
  {
LABEL_15:
    if ((self->_pollingConfig & 0x1000) != 0)
    {
      v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFLogGetLogger(v39);
      if (v40)
      {
        v41 = (void (*)(uint64_t, const char *, ...))v40;
        v42 = object_getClass(self);
        v43 = class_isMetaClass(v42);
        v44 = object_getClassName(self);
        v100 = sel_getName(a2);
        v45 = 45;
        if (v43)
          v45 = 43;
        v41(4, "%c[%{public}s %{public}s]:%i Expected a different tag type.  Removing RF frame from polling config.", v45, v44, v100, 2672);
      }
      v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v47 = NFSharedLogGetLogger(v46);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = object_getClass(self);
        if (class_isMetaClass(v49))
          v50 = 43;
        else
          v50 = 45;
        v51 = object_getClassName(self);
        v52 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v115 = v50;
        v116 = 2082;
        v117 = v51;
        v118 = 2082;
        v119 = v52;
        v120 = 1024;
        v121 = 2672;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Expected a different tag type.  Removing RF frame from polling config.", buf, 0x22u);
      }

      v53 = self->_pollingConfig & 0xFFFFEFFF;
      self->_pollingConfig = v53;
      sub_1001CB2CC(self->_driverWrapper, v53, -[_NFReaderSession _getTagNotificationConfig](self, "_getTagNotificationConfig"));
      v54 = objc_alloc((Class)NSError);
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v110 = NSLocalizedDescriptionKey;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "RF Deactivated"));
      v111 = v56;
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1));
      v58 = v54;
      v59 = v55;
      v60 = 51;
      goto LABEL_27;
    }
    v12 = 0;
    v38 = &stru_1002EAA18;
    goto LABEL_38;
  }
  pollingConfig = self->_pollingConfig;
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFLogGetLogger(v18);
  v20 = (void (*)(uint64_t, const char *, ...))v19;
  if ((pollingConfig & 0x1000) != 0)
  {
    if (v19)
    {
      v61 = object_getClass(self);
      v62 = class_isMetaClass(v61);
      v63 = object_getClassName(self);
      v101 = sel_getName(a2);
      v64 = 45;
      if (v62)
        v64 = 43;
      v20(5, "%c[%{public}s %{public}s]:%i Found zeros PUPI tag", v64, v63, v101, 2664);
    }
    v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v66 = NFSharedLogGetLogger(v65);
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = object_getClass(self);
      if (class_isMetaClass(v68))
        v69 = 43;
      else
        v69 = 45;
      v70 = object_getClassName(self);
      v71 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v115 = v69;
      v116 = 2082;
      v117 = v70;
      v118 = 2082;
      v119 = v71;
      v120 = 1024;
      v121 = 2664;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found zeros PUPI tag", buf, 0x22u);
    }

    v12 = 1;
    v38 = &stru_1002EA9F8;
    v11 = v103;
LABEL_38:
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v38));
    -[NSMutableOrderedSet filterUsingPredicate:](v11, "filterUsingPredicate:", v72);

    goto LABEL_39;
  }
  if (v19)
  {
    v21 = object_getClass(self);
    v22 = class_isMetaClass(v21);
    v23 = object_getClassName(self);
    v99 = sel_getName(a2);
    v24 = 45;
    if (v22)
      v24 = 43;
    v20(5, "%c[%{public}s %{public}s]:%i Switching to RF frame", v24, v23, v99, 2658);
  }
  v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v26 = NFSharedLogGetLogger(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    v30 = object_getClassName(self);
    v31 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v115 = v29;
    v116 = 2082;
    v117 = v30;
    v118 = 2082;
    v119 = v31;
    v120 = 1024;
    v121 = 2658;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Switching to RF frame", buf, 0x22u);
  }

  v32 = self->_pollingConfig | 0x1000u;
  self->_pollingConfig = v32;
  sub_1001CB2CC(self->_driverWrapper, v32, -[_NFReaderSession _getTagNotificationConfig](self, "_getTagNotificationConfig"));
  v33 = objc_alloc((Class)NSError);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v112 = NSLocalizedDescriptionKey;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "RF Deactivated"));
  v113 = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
  v37 = objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 51, v36);

  v11 = v103;
LABEL_45:

  return v37;
}

- (id)_processMifareTag:(id)a3 connected:(BOOL *)a4 isMifare:(BOOL *)a5
{
  id v9;
  unsigned int v10;
  unsigned int v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  NFDriverWrapper *driverWrapper;
  int v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  id v48;
  id v50;
  id v51;
  void *v52;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *Name;
  const char *v71;
  const char *v72;
  id v73;
  uint8_t buf[4];
  int v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  id v83;
  _QWORD v84[4];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[4];

  v9 = a3;
  if (*a4)
  {
    v10 = sub_10017EF78(self->_driverWrapper, v9, 0);
    *a4 = 0;
    if (v10)
    {
      v11 = v10;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v14 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v18 = 45;
        if (isMetaClass)
          v18 = 43;
        v14(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v18, ClassName, Name, 2719);
      }
      v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v20 = NFSharedLogGetLogger(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = object_getClass(self);
        if (class_isMetaClass(v22))
          v23 = 43;
        else
          v23 = 45;
        *(_DWORD *)buf = 67109890;
        v75 = v23;
        v76 = 2082;
        v77 = object_getClassName(self);
        v78 = 2082;
        v79 = sel_getName(a2);
        v80 = 1024;
        v81 = 2719;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
      }

      v24 = objc_alloc((Class)NSError);
      v25 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v26 = v11;
      v86[0] = NSLocalizedDescriptionKey;
      if (v11 >= 0x47)
        v27 = 71;
      else
        v27 = v11;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v27]));
      v87[0] = v28;
      v87[1] = &off_100301028;
      v86[1] = CFSTR("Line");
      v86[2] = CFSTR("Method");
      v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v87[2] = v29;
      v86[3] = NSDebugDescriptionErrorKey;
      v30 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2720);
      v87[3] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 4));
      v32 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, v26, v31);

LABEL_34:
      goto LABEL_35;
    }
  }
  driverWrapper = self->_driverWrapper;
  if (driverWrapper)
  {
    v34 = sub_10017E9A4(driverWrapper, v9, 0);
    if (v34)
    {
      LODWORD(v35) = v34;
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v37 = NFLogGetLogger(v36);
      if (v37)
      {
        v38 = (void (*)(uint64_t, const char *, ...))v37;
        v39 = object_getClass(self);
        v40 = class_isMetaClass(v39);
        v41 = object_getClassName(self);
        v71 = sel_getName(a2);
        v42 = 45;
        if (v40)
          v42 = 43;
        v38(3, "%c[%{public}s %{public}s]:%i Failed to reconnect tag after check", v42, v41, v71, 2727);
      }
      v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = object_getClass(self);
        if (class_isMetaClass(v46))
          v47 = 43;
        else
          v47 = 45;
        *(_DWORD *)buf = 67109890;
        v75 = v47;
        v76 = 2082;
        v77 = object_getClassName(self);
        v78 = 2082;
        v79 = sel_getName(a2);
        v80 = 1024;
        v81 = 2727;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to reconnect tag after check", buf, 0x22u);
      }

      *a4 = 0;
      v48 = objc_alloc((Class)NSError);
      v25 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if ((_DWORD)v35 == 35 || (_DWORD)v35 == 64)
        v35 = v35;
      else
        v35 = 51;
      v84[0] = NSLocalizedDescriptionKey;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v35]));
      v85[0] = v28;
      v85[1] = &off_100301040;
      v84[1] = CFSTR("Line");
      v84[2] = CFSTR("Method");
      v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v85[2] = v50;
      v84[3] = NSDebugDescriptionErrorKey;
      v51 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2732);
      v85[3] = v51;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 4));
      v32 = objc_msgSend(v48, "initWithDomain:code:userInfo:", v25, v35, v52);

      goto LABEL_34;
    }
  }
  *a4 = 1;
  v73 = 0;
  v54 = -[_NFReaderSession _queryMifareType:outError:](self, "_queryMifareType:outError:", v9, &v73);
  v55 = v73;
  v25 = v55;
  if (v55 && objc_msgSend(v55, "code"))
  {
    v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v57 = NFLogGetLogger(v56);
    if (v57)
    {
      v58 = (void (*)(uint64_t, const char *, ...))v57;
      v59 = object_getClass(self);
      v60 = class_isMetaClass(v59);
      v69 = object_getClassName(self);
      v72 = sel_getName(a2);
      v61 = 45;
      if (v60)
        v61 = 43;
      v58(4, "%c[%{public}s %{public}s]:%i Failed to query for MiFare tag.  Will assume it isnt one - error=%{public}@", v61, v69, v72, 2740, v25);
    }
    v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = NFSharedLogGetLogger(v62);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v65 = object_getClass(self);
      if (class_isMetaClass(v65))
        v66 = 43;
      else
        v66 = 45;
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v75 = v66;
      v76 = 2082;
      v77 = v67;
      v78 = 2082;
      v79 = v68;
      v80 = 1024;
      v81 = 2740;
      v82 = 2114;
      v83 = v25;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query for MiFare tag.  Will assume it isnt one - error=%{public}@", buf, 0x2Cu);
    }

    if (objc_msgSend(v25, "code") != (id)51)
    {
      sub_10017EF78(self->_driverWrapper, v9, 0);
      *a4 = 0;
    }
    v25 = v25;
    v32 = v25;
  }
  else if ((_DWORD)v54 && (objc_msgSend(v9, "_setType:", v54), (_DWORD)v54 == 13))
  {
    v32 = 0;
  }
  else
  {
    v32 = 0;
    *a5 = 1;
  }
LABEL_35:

  return v32;
}

- (id)_processISO14443TagForCoreNFC:(id)a3 tagIsConnected:(BOOL *)a4 outError:(id *)a5
{
  id v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  unint64_t sessionConfig;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  objc_class *v58;
  int v59;
  const char *v60;
  const char *v61;
  void *v62;
  uint64_t v63;
  int v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  const char *Name;
  const char *v71;
  id v72;
  id v73;
  const char *sel;
  id *v75;
  id *v76;
  id *v77;
  id v78;
  id v79;
  char v80;
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[5];
  _QWORD v84[5];
  uint8_t buf[4];
  int v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  int v92;

  v9 = a3;
  v80 = 0;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v12(6, "%c[%{public}s %{public}s]:%i ", v16, ClassName, Name, 2765);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    *(_DWORD *)buf = 67109890;
    v86 = v21;
    v87 = 2082;
    v88 = object_getClassName(self);
    v89 = 2082;
    v90 = sel_getName(a2);
    v91 = 1024;
    v92 = 2765;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  *a4 = 0;
  sessionConfig = self->_sessionConfig;
  if (objc_msgSend(v9, "type") == 9)
  {
    v23 = 0;
LABEL_19:
    if ((sessionConfig & 0x400) == 0)
    {
      if (objc_msgSend(v9, "type") == 3 || objc_msgSend(v9, "type") == 9)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _processMifareTag:connected:isMifare:](self, "_processMifareTag:connected:isMifare:", v9, a4, &v80));
        if (v29)
        {
          v30 = v29;
          v27 = 0;
          if (a5)
            *a5 = objc_retainAutorelease(v29);
          v23 = v30;
          goto LABEL_53;
        }
      }
LABEL_32:
      sel = a2;
      if (v80)
      {
        v73 = v23;
        v38 = objc_alloc((Class)NFTagInternal);
        v83[0] = CFSTR("type");
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "type")));
        v84[0] = v39;
        v83[1] = CFSTR("technology");
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "technology")));
        v84[1] = v40;
        v83[2] = CFSTR("identifier");
        v76 = a5;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tagID"));
        v84[2] = v41;
        v83[3] = CFSTR("UID");
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UID"));
        v84[3] = v42;
        v83[4] = CFSTR("historicalBytes");
        v43 = a4;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "historicalBytes"));
        v84[4] = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v84, v83, 5));
        v27 = objc_msgSend(v38, "initWithDictionary:", v45);

        a4 = v43;
        a5 = v76;

        goto LABEL_35;
      }
LABEL_34:
      v73 = v23;
      v27 = 0;
      if (!*a4)
      {
LABEL_51:
        v23 = v73;
        goto LABEL_53;
      }
LABEL_35:
      v46 = sub_10017EF78(self->_driverWrapper, v9, 0);
      if (v46)
      {
        v47 = v46;
        v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v49 = NFLogGetLogger(v48);
        if (v49)
        {
          v50 = (void (*)(uint64_t, const char *, ...))v49;
          v51 = object_getClass(self);
          v52 = class_isMetaClass(v51);
          v53 = object_getClassName(self);
          v71 = sel_getName(sel);
          v54 = 45;
          if (v52)
            v54 = 43;
          v50(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v54, v53, v71, 2816);
        }
        v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v56 = NFSharedLogGetLogger(v55);
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v58 = object_getClass(self);
          if (class_isMetaClass(v58))
            v59 = 43;
          else
            v59 = 45;
          v60 = object_getClassName(self);
          v61 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          v86 = v59;
          v87 = 2082;
          v88 = v60;
          v89 = 2082;
          v90 = v61;
          v91 = 1024;
          v92 = 2816;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
        }

        if (a5)
        {
          v72 = objc_alloc((Class)NSError);
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v77 = a5;
          v63 = v47;
          v81[0] = NSLocalizedDescriptionKey;
          if (v47 >= 0x47)
            v64 = 71;
          else
            v64 = v47;
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v64]));
          v82[0] = v65;
          v82[1] = &off_100301058;
          v81[1] = CFSTR("Line");
          v81[2] = CFSTR("Method");
          v66 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
          v82[2] = v66;
          v81[3] = NSDebugDescriptionErrorKey;
          v67 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 2817);
          v82[3] = v67;
          v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v82, v81, 4));
          *v77 = objc_msgSend(v72, "initWithDomain:code:userInfo:", v62, v63, v68);

        }
      }
      *a4 = 0;
      goto LABEL_51;
    }
    goto LABEL_25;
  }
  v78 = 0;
  v79 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _processIso14Tag:connected:appFound:updatedTag:](self, "_processIso14Tag:connected:appFound:updatedTag:", v9, a4, &v79, &v78));
  v23 = v79;
  v25 = v78;
  v26 = v25;
  if (v24)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v24);

    v27 = 0;
    goto LABEL_53;
  }
  if (v25)
  {
    v28 = v25;

    v9 = v28;
  }

  if (!v23)
    goto LABEL_19;
LABEL_25:
  if (!v23)
    goto LABEL_32;
  sel = a2;
  v75 = a5;
  v31 = objc_alloc((Class)NSMutableDictionary);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "type")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "technology")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tagID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UID"));
  v36 = objc_msgSend(v31, "initWithObjectsAndKeys:", v32, CFSTR("type"), v33, CFSTR("technology"), v34, CFSTR("identifier"), v35, CFSTR("UID"), 0);

  objc_msgSend(v36, "setObject:forKey:", v23, CFSTR("selectedAID"));
  if (objc_msgSend(v9, "type") == 3
    || objc_msgSend(v9, "type") == 2
    || objc_msgSend(v9, "type") == 1)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "historicalBytes"));
    objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("historicalBytes"));

  }
  v27 = objc_msgSend(objc_alloc((Class)NFTagInternal), "initWithDictionary:", v36);

  a5 = v75;
  if (!v27)
    goto LABEL_34;
LABEL_53:

  return v27;
}

- (id)_processFelicaTagForCoreNFC:(id)a3 outError:(id *)a4
{
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  NFDriverWrapper *driverWrapper;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  _BOOL4 v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  BOOL v70;
  void *v72;
  uint64_t v73;
  void (*v74)(uint64_t, const char *, ...);
  objc_class *v75;
  _BOOL4 v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  objc_class *v82;
  int v83;
  const char *v84;
  const char *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unsigned int v91;
  unsigned int v92;
  void *v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  objc_class *v96;
  _BOOL4 v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  NSObject *v102;
  objc_class *v103;
  int v104;
  const char *v105;
  const char *v106;
  int v107;
  _QWORD *v108;
  _QWORD *v109;
  uint64_t v110;
  void *v111;
  const char *Name;
  const char *v114;
  const char *v115;
  const char *v116;
  const char *v117;
  NSMutableArray *obj;
  id *v119;
  const char *sel;
  id v121;
  id v122;
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  _QWORD v129[4];
  _QWORD v130[4];
  _QWORD v131[6];
  _QWORD v132[6];
  _BYTE v133[128];
  _QWORD v134[5];
  _QWORD v135[5];
  _QWORD v136[4];
  _QWORD v137[4];
  uint8_t buf[4];
  int v139;
  __int16 v140;
  const char *v141;
  __int16 v142;
  const char *v143;
  __int16 v144;
  int v145;

  v121 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 2826);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67109890;
    v139 = v18;
    v140 = 2082;
    v141 = object_getClassName(self);
    v142 = 2082;
    v143 = sel_getName(a2);
    v144 = 1024;
    v145 = 2826;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  driverWrapper = self->_driverWrapper;
  if (driverWrapper)
  {
    v20 = sub_10017E9A4(driverWrapper, v121, 0);
    if (v20)
    {
      v21 = v20;
      v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v23 = NFLogGetLogger(v22);
      if (v23)
      {
        v24 = (void (*)(uint64_t, const char *, ...))v23;
        v25 = object_getClass(self);
        v26 = class_isMetaClass(v25);
        v27 = object_getClassName(self);
        v114 = sel_getName(a2);
        v28 = 45;
        if (v26)
          v28 = 43;
        v24(3, "%c[%{public}s %{public}s]:%i Failed to connect tag", v28, v27, v114, 2830);
      }
      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFSharedLogGetLogger(v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = object_getClass(self);
        if (class_isMetaClass(v32))
          v33 = 43;
        else
          v33 = 45;
        v34 = object_getClassName(self);
        v35 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v139 = v33;
        v140 = 2082;
        v141 = v34;
        v142 = 2082;
        v143 = v35;
        v144 = 1024;
        v145 = 2830;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect tag", buf, 0x22u);
      }

      if (!a4)
      {
        v61 = 0;
        goto LABEL_88;
      }
      v36 = objc_alloc((Class)NSError);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v38 = v21;
      v136[0] = NSLocalizedDescriptionKey;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v21]));
      v137[0] = v39;
      v137[1] = &off_100301070;
      v136[1] = CFSTR("Line");
      v136[2] = CFSTR("Method");
      v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v137[2] = v40;
      v136[3] = NSDebugDescriptionErrorKey;
      v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2831);
      v137[3] = v41;
      v42 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v137, v136, 4));
      *a4 = objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, v38, v42);
      goto LABEL_85;
    }
  }
  v128 = 0;
  -[_NFReaderSession _updateFelicaTagInfo:outError:](self, "_updateFelicaTagInfo:outError:", v121, &v128);
  v43 = v128;
  v37 = v43;
  if (!v43 || objc_msgSend(v43, "code") != (id)51 && objc_msgSend(v37, "code") != (id)64)
  {
    sel = a2;
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    obj = self->_feliCaSystemCodeList;
    v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
    v119 = a4;
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v125;
LABEL_41:
      v65 = 0;
      v66 = v37;
      while (1)
      {
        if (*(_QWORD *)v125 != v64)
          objc_enumerationMutation(obj);
        v67 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)v65);
        v122 = 0;
        v123 = 0;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getIDMFromTag:systemCode:outIdm:outPmm:](self, "_getIDMFromTag:systemCode:outIdm:outPmm:", v121, v67, &v123, &v122));
        v68 = v123;
        v69 = v122;

        v70 = v37 || v69 == 0;
        if (!v70 && v68 != 0)
          break;
        v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v73 = NFLogGetLogger(v72);
        if (v73)
        {
          v74 = (void (*)(uint64_t, const char *, ...))v73;
          v75 = object_getClass(self);
          v76 = class_isMetaClass(v75);
          v77 = object_getClassName(self);
          v116 = sel_getName(sel);
          v78 = 45;
          if (v76)
            v78 = 43;
          v74(3, "%c[%{public}s %{public}s]:%i Failed to read IDM info", v78, v77, v116, 2862);
        }
        v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v80 = NFSharedLogGetLogger(v79);
        v81 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          v82 = object_getClass(self);
          if (class_isMetaClass(v82))
            v83 = 43;
          else
            v83 = 45;
          v84 = object_getClassName(self);
          v85 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          v139 = v83;
          v140 = 2082;
          v141 = v84;
          v142 = 2082;
          v143 = v85;
          v144 = 1024;
          v145 = 2862;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to read IDM info", buf, 0x22u);
        }

        if (v119)
          *v119 = objc_retainAutorelease(v37);

        v65 = (char *)v65 + 1;
        v66 = v37;
        if (v63 == v65)
        {
          v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
          if (v63)
            goto LABEL_41;
          goto LABEL_65;
        }
      }
      v86 = objc_alloc((Class)NFTagInternal);
      v131[0] = CFSTR("type");
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v121, "type")));
      v132[0] = v87;
      v131[1] = CFSTR("technology");
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v121, "technology")));
      v132[1] = v88;
      v132[2] = v68;
      v131[2] = CFSTR("identifier");
      v131[3] = CFSTR("PMm");
      v132[3] = v69;
      v131[4] = CFSTR("UID");
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "UID"));
      v131[5] = CFSTR("SystemCode");
      v132[4] = v89;
      v132[5] = v67;
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v132, v131, 6));
      v61 = objc_msgSend(v86, "initWithDictionary:", v90);

      v37 = 0;
      if (v61)
        goto LABEL_87;
    }
    else
    {
LABEL_65:

    }
    v91 = sub_10017EF78(self->_driverWrapper, v121, 0);
    if (!v91)
      goto LABEL_86;
    v92 = v91;
    v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v94 = NFLogGetLogger(v93);
    if (v94)
    {
      v95 = (void (*)(uint64_t, const char *, ...))v94;
      v96 = object_getClass(self);
      v97 = class_isMetaClass(v96);
      v98 = object_getClassName(self);
      v117 = sel_getName(sel);
      v99 = 45;
      if (v97)
        v99 = 43;
      v95(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v99, v98, v117, 2870);
    }
    v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v101 = NFSharedLogGetLogger(v100);
    v102 = objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      v103 = object_getClass(self);
      if (class_isMetaClass(v103))
        v104 = 43;
      else
        v104 = 45;
      v105 = object_getClassName(self);
      v106 = sel_getName(sel);
      *(_DWORD *)buf = 67109890;
      v139 = v104;
      v140 = 2082;
      v141 = v105;
      v142 = 2082;
      v143 = v106;
      v144 = 1024;
      v145 = 2870;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
    }

    if (!v119)
      goto LABEL_86;
    v58 = objc_alloc((Class)NSError);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v59 = (id)v92;
    v129[0] = NSLocalizedDescriptionKey;
    if (v92 >= 0x47)
      v107 = 71;
    else
      v107 = v92;
    v40 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v107]));
    v130[0] = v40;
    v130[1] = &off_1003010A0;
    v129[1] = CFSTR("Line");
    v129[2] = CFSTR("Method");
    v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sel));
    v130[2] = v41;
    v129[3] = NSDebugDescriptionErrorKey;
    a4 = v119;
    v42 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 2871);
    v130[3] = v42;
    v108 = v130;
    v109 = v129;
    v110 = 4;
    goto LABEL_84;
  }
  v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v45 = NFLogGetLogger(v44);
  if (v45)
  {
    v46 = (void (*)(uint64_t, const char *, ...))v45;
    v47 = object_getClass(self);
    v48 = class_isMetaClass(v47);
    v49 = object_getClassName(self);
    v115 = sel_getName(a2);
    v50 = 45;
    if (v48)
      v50 = 43;
    v46(3, "%c[%{public}s %{public}s]:%i Tag deactivated or failed to retrieve info", v50, v49, v115, 2841);
  }
  v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v52 = NFSharedLogGetLogger(v51);
  v53 = objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    v54 = object_getClass(self);
    if (class_isMetaClass(v54))
      v55 = 43;
    else
      v55 = 45;
    v56 = object_getClassName(self);
    v57 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v139 = v55;
    v140 = 2082;
    v141 = v56;
    v142 = 2082;
    v143 = v57;
    v144 = 1024;
    v145 = 2841;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag deactivated or failed to retrieve info", buf, 0x22u);
  }

  if (a4)
  {
    v58 = objc_alloc((Class)NSError);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v59 = objc_msgSend(v37, "code");
    v134[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v37, "code") > 70)
      v60 = 71;
    else
      v60 = (uint64_t)objc_msgSend(v37, "code");
    v40 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v60]));
    v135[0] = v40;
    v135[1] = v37;
    v134[1] = NSUnderlyingErrorKey;
    v134[2] = CFSTR("Line");
    v135[2] = &off_100301088;
    v134[3] = CFSTR("Method");
    v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v135[3] = v41;
    v134[4] = NSDebugDescriptionErrorKey;
    v42 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2842);
    v135[4] = v42;
    v108 = v135;
    v109 = v134;
    v110 = 5;
LABEL_84:
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v108, v109, v110));
    *a4 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v39, v59, v111);

LABEL_85:
  }
LABEL_86:
  v61 = 0;
LABEL_87:

LABEL_88:
  return v61;
}

- (id)_processNDEFTagForCoreNFC:(id)a3 outError:(id *)a4
{
  id v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  NFDriverWrapper *driverWrapper;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  objc_class *v58;
  int v59;
  const char *v60;
  const char *v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  _BOOL4 v68;
  int v69;
  int v70;
  unsigned int v71;
  uint64_t v72;
  unsigned int v73;
  unsigned int v74;
  void *v75;
  uint64_t v76;
  void (*v77)(uint64_t, const char *, ...);
  objc_class *v78;
  _BOOL4 v79;
  void *v80;
  id *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  objc_class *v87;
  int v88;
  const char *v89;
  const char *v90;
  int v91;
  void *v92;
  id v93;
  id v94;
  _QWORD *v95;
  _QWORD *v96;
  uint64_t v97;
  void *v98;
  const char *v100;
  const char *Name;
  const char *v102;
  const char *v103;
  const char *v104;
  id *v105;
  unsigned int v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD v111[4];
  _QWORD v112[4];
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[4];
  _QWORD v116[4];
  uint8_t buf[4];
  int v118;
  __int16 v119;
  const char *v120;
  __int16 v121;
  const char *v122;
  __int16 v123;
  int v124;

  v7 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 2879);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67109890;
    v118 = v19;
    v119 = 2082;
    v120 = object_getClassName(self);
    v121 = 2082;
    v122 = sel_getName(a2);
    v123 = 1024;
    v124 = 2879;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || (v21 = sub_10017E9A4(driverWrapper, v7, 0)) == 0)
  {
    v108 = 0;
    v109 = 0;
    v110 = 0;
    v107 = 0;
    -[_NFReaderSession _updateFelicaTagInfo:outError:](self, "_updateFelicaTagInfo:outError:", v7, &v107);
    v46 = v107;
    v47 = v46;
    if (v46 && (objc_msgSend(v46, "code") == (id)51 || objc_msgSend(v47, "code") == (id)64))
    {
      v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFLogGetLogger(v48);
      if (v49)
      {
        v50 = (void (*)(uint64_t, const char *, ...))v49;
        v51 = object_getClass(self);
        v52 = class_isMetaClass(v51);
        v53 = object_getClassName(self);
        v103 = sel_getName(a2);
        v54 = 45;
        if (v52)
          v54 = 43;
        v50(3, "%c[%{public}s %{public}s]:%i Tag deactivated or failed to retrieve info", v54, v53, v103, 2895);
      }
      v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v56 = NFSharedLogGetLogger(v55);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = object_getClass(self);
        if (class_isMetaClass(v58))
          v59 = 43;
        else
          v59 = 45;
        v60 = object_getClassName(self);
        v61 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v118 = v59;
        v119 = 2082;
        v120 = v60;
        v121 = 2082;
        v122 = v61;
        v123 = 1024;
        v124 = 2895;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag deactivated or failed to retrieve info", buf, 0x22u);
      }

      if (!a4)
        goto LABEL_74;
      v105 = a4;
      v62 = objc_alloc((Class)NSError);
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v64 = objc_msgSend(v47, "code");
      v113[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)objc_msgSend(v47, "code") > 70)
        v65 = 71;
      else
        v65 = (uint64_t)objc_msgSend(v47, "code");
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v65]));
      v114[0] = v92;
      v114[1] = v47;
      v113[1] = NSUnderlyingErrorKey;
      v113[2] = CFSTR("Line");
      v114[2] = &off_1003010D0;
      v113[3] = CFSTR("Method");
      v93 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v114[3] = v93;
      v113[4] = NSDebugDescriptionErrorKey;
      v94 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2896);
      v114[4] = v94;
      v95 = v114;
      v96 = v113;
      v97 = 5;
    }
    else
    {
      v66 = sub_100226308((uint64_t)NFTagReadCALogger);
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      sub_100226374((uint64_t)v67, v7);

      if (sub_10017F4D4(self->_driverWrapper, v7, &v108, (uint64_t)a4))
      {
        v68 = v108 != 0;
        v69 = v110;
        if (!(_BYTE)v110)
          v68 = 1;
        if (BYTE1(v110))
          v70 = v68;
        else
          v70 = 1;
        if (BYTE1(v110))
          v71 = 4;
        else
          v71 = 3;
        if (!(_BYTE)v110)
          v71 = 0;
        v72 = v70 ? v71 : 2;
        objc_msgSend(v7, "_setNDEFAvailability:", v72);
        objc_msgSend(v7, "_setNDEFContainerSize:", v109);
        objc_msgSend(v7, "_setNDEFMessageSize:", v108);
        if (v70 != 1 || v69)
        {
          v45 = objc_msgSend(objc_alloc((Class)NFTagInternal), "initWithNFTagForUIDOnly:", v7);
          if (v45)
            goto LABEL_75;
        }
      }
      v73 = sub_10017EF78(self->_driverWrapper, v7, 0);
      if (!v73)
        goto LABEL_74;
      v74 = v73;
      v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v76 = NFLogGetLogger(v75);
      if (v76)
      {
        v77 = (void (*)(uint64_t, const char *, ...))v76;
        v78 = object_getClass(self);
        v79 = class_isMetaClass(v78);
        v106 = v74;
        v80 = v47;
        v81 = a4;
        v82 = object_getClassName(self);
        v104 = sel_getName(a2);
        v83 = 45;
        if (v79)
          v83 = 43;
        v100 = v82;
        a4 = v81;
        v47 = v80;
        v74 = v106;
        v77(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v83, v100, v104, 2925);
      }
      v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v85 = NFSharedLogGetLogger(v84);
      v86 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v87 = object_getClass(self);
        if (class_isMetaClass(v87))
          v88 = 43;
        else
          v88 = 45;
        v89 = object_getClassName(self);
        v90 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v118 = v88;
        v119 = 2082;
        v120 = v89;
        v121 = 2082;
        v122 = v90;
        v123 = 1024;
        v124 = 2925;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
      }

      if (!a4)
      {
LABEL_74:
        v45 = 0;
LABEL_75:

        goto LABEL_76;
      }
      v105 = a4;
      v62 = objc_alloc((Class)NSError);
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v64 = (id)v74;
      v111[0] = NSLocalizedDescriptionKey;
      if (v74 >= 0x47)
        v91 = 71;
      else
        v91 = v74;
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v91]));
      v112[0] = v92;
      v112[1] = &off_1003010E8;
      v111[1] = CFSTR("Line");
      v111[2] = CFSTR("Method");
      v93 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v112[2] = v93;
      v111[3] = NSDebugDescriptionErrorKey;
      v94 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2926);
      v112[3] = v94;
      v95 = v112;
      v96 = v111;
      v97 = 4;
    }
    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v95, v96, v97));
    *v105 = objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, v64, v98);

    goto LABEL_74;
  }
  v22 = v21;
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFLogGetLogger(v23);
  if (v24)
  {
    v25 = (void (*)(uint64_t, const char *, ...))v24;
    v26 = object_getClass(self);
    v27 = class_isMetaClass(v26);
    v28 = object_getClassName(self);
    v102 = sel_getName(a2);
    v29 = 45;
    if (v27)
      v29 = 43;
    v25(3, "%c[%{public}s %{public}s]:%i Failed to connect tag", v29, v28, v102, 2883);
  }
  v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v31 = NFSharedLogGetLogger(v30);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = object_getClass(self);
    if (class_isMetaClass(v33))
      v34 = 43;
    else
      v34 = 45;
    v35 = object_getClassName(self);
    v36 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v118 = v34;
    v119 = 2082;
    v120 = v35;
    v121 = 2082;
    v122 = v36;
    v123 = 1024;
    v124 = 2883;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect tag", buf, 0x22u);
  }

  if (a4)
  {
    v37 = objc_alloc((Class)NSError);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v39 = v22;
    v115[0] = NSLocalizedDescriptionKey;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v22]));
    v116[0] = v40;
    v116[1] = &off_1003010B8;
    v115[1] = CFSTR("Line");
    v115[2] = CFSTR("Method");
    v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v116[2] = v41;
    v115[3] = NSDebugDescriptionErrorKey;
    v42 = a4;
    v43 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2884);
    v116[3] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v116, v115, 4));
    *v42 = objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, v39, v44);

  }
  v45 = 0;
LABEL_76:

  return v45;
}

- (id)_getNodeList
{
  _NFReaderSession *v2;
  unsigned int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unsigned __int16 *v15;
  uint64_t v16;
  unsigned __int16 *v17;
  NSMutableDictionary *v18;
  id v19;
  NSMutableDictionary *v20;
  id v21;
  const __CFString *v22;
  id v23;
  void *v24;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  void *v39;
  NSMutableDictionary *v40;
  void *specific;
  uint64_t Logger;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  const char *v56;
  const char *v57;
  const char *Name;
  NSMutableDictionary *v61;
  id v62;
  _BYTE v63[2];
  uint8_t buf[4];
  int v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  id v73;

  v2 = self;
  v61 = objc_opt_new(NSMutableDictionary);
  v3 = 0;
  while (1)
  {
    v63[0] = v3;
    v63[1] = 0;
    v4 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &unk_10026A835, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](v2, "currentTag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagID"));
    objc_msgSend(v4, "appendData:", v6);

    objc_msgSend(v4, "appendBytes:length:", v63, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](v2, "driverWrapper"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](v2, "currentTag"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](v2, "whitelistChecker"));
    objc_msgSend(v9, "sessionTimeLimit");
    v62 = 0;
    v11 = sub_1001847DC(v7, v4, v8, &v62, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v62;

    if (v13 || !v12)
      break;
    if (!objc_msgSend(v12, "length"))
    {
      v13 = 0;
      break;
    }
    v14 = objc_retainAutorelease(v12);
    v15 = (unsigned __int16 *)objc_msgSend(v14, "bytes");
    v16 = v15[5];
    if ((_DWORD)v16 == 0xFFFF)
    {

LABEL_26:
      v40 = v61;
      if (-[_NFReaderSession _getKeyVersionForNodes:](v2, "_getKeyVersionForNodes:", v61))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v61, "allValues"));
      }
      else
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v43 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v2);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v2);
          Name = sel_getName(a2);
          v47 = 45;
          if (isMetaClass)
            v47 = 43;
          v43(3, "%c[%{public}s %{public}s]:%i Failed to get key version for nodes", v47, ClassName, Name, 2991);
        }
        v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v49 = NFSharedLogGetLogger(v48);
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = object_getClass(v2);
          if (class_isMetaClass(v51))
            v52 = 43;
          else
            v52 = 45;
          v53 = object_getClassName(v2);
          v54 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v65 = v52;
          v66 = 2082;
          v67 = v53;
          v68 = 2082;
          v69 = v54;
          v70 = 1024;
          v71 = 2991;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get key version for nodes", buf, 0x22u);
        }

        v39 = 0;
      }
      goto LABEL_38;
    }
    v17 = v15;
    if (objc_msgSend(v14, "length") == (id)12)
    {
      v18 = objc_opt_new(NSMutableDictionary);
      v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%04X"), __rev16(v16));
      v20 = v18;
      v21 = v19;
      v22 = CFSTR("areaCode");
LABEL_10:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, v22);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v16));
      -[NSMutableDictionary setObject:forKey:](v61, "setObject:forKey:", v18, v24);

      goto LABEL_11;
    }
    if (objc_msgSend(v14, "length") == (id)14)
    {
      v18 = objc_opt_new(NSMutableDictionary);
      v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%04X"), __rev16(v16));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v23, CFSTR("areaCode"));

      v2 = self;
      v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%04X"), __rev16(v17[6]));
      v20 = v18;
      v21 = v19;
      v22 = CFSTR("endServiceCode");
      goto LABEL_10;
    }
LABEL_11:

    if (v3++ >= 0xFE)
      goto LABEL_26;
  }
  v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v27 = NFLogGetLogger(v26);
  if (v27)
  {
    v28 = (void (*)(uint64_t, const char *, ...))v27;
    v29 = object_getClass(v2);
    v30 = class_isMetaClass(v29);
    v56 = object_getClassName(v2);
    v57 = sel_getName(a2);
    v31 = 45;
    if (v30)
      v31 = 43;
    v28(3, "%c[%{public}s %{public}s]:%i Failed to search service codes, error %{public}@", v31, v56, v57, 2962, v13);
  }
  v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v33 = NFSharedLogGetLogger(v32);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = object_getClass(v2);
    if (class_isMetaClass(v35))
      v36 = 43;
    else
      v36 = 45;
    v37 = object_getClassName(v2);
    v38 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v65 = v36;
    v66 = 2082;
    v67 = v37;
    v68 = 2082;
    v69 = v38;
    v70 = 1024;
    v71 = 2962;
    v72 = 2114;
    v73 = v13;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to search service codes, error %{public}@", buf, 0x2Cu);
  }

  v39 = 0;
  v40 = v61;
LABEL_38:

  return v39;
}

- (BOOL)_getKeyVersionForNodes:(id)a3
{
  id v4;
  NSMutableData *v5;
  NSMutableData *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableData *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  id v23;
  unsigned __int8 *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned __int16 *v27;
  uint64_t v28;
  unsigned int v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  NSMutableData *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  id v43;
  void *v44;
  id v45;
  unsigned __int8 *v46;
  unsigned int v47;
  void *v48;
  NSMutableData *v49;
  unsigned int v50;
  unsigned __int16 *v51;
  int v52;
  int v53;
  unsigned int v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  BOOL v60;
  id v61;
  void *specific;
  uint64_t Logger;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  const char *ClassName;
  const char *Name;
  const char *v78;
  uint64_t v79;
  id v80;
  id v82;
  void *v83;
  id v84;
  void *v85;
  NSMutableData *v86;
  void *v87;
  NSMutableData *v88;
  id v89;
  id v90;
  char v91;
  _BYTE v92[2];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  char v97;
  uint8_t buf[4];
  int v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  int v105;
  __int16 v106;
  id v107;
  _BYTE v108[128];

  v4 = a3;
  v97 = 0;
  v5 = objc_opt_new(NSMutableData);
  v87 = v4;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v6 = (NSMutableData *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v7 = -[NSMutableData countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v94;
    v78 = a2;
    v79 = *(_QWORD *)v94;
    v88 = v6;
    while (2)
    {
      v11 = 0;
      v80 = v8;
      do
      {
        if (*(_QWORD *)v94 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v11);
        if (!v5)
          v5 = objc_opt_new(NSMutableData);
        v92[0] = objc_msgSend(v12, "unsignedShortValue");
        v92[1] = (unsigned __int16)objc_msgSend(v12, "unsignedShortValue") >> 8;
        -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", v92, 2);
        if (++v97 >= 0x1Eu)
        {
          v83 = v11;
          v13 = objc_opt_new(NSMutableData);
          v91 = 2;
          -[NSMutableData appendBytes:length:](v13, "appendBytes:length:", &v91, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tagID"));
          -[NSMutableData appendData:](v13, "appendData:", v15);

          -[NSMutableData appendBytes:length:](v13, "appendBytes:length:", &v97, 1);
          -[NSMutableData appendData:](v13, "appendData:", v5);
          v91 = -[NSMutableData length](v13, "length") + 1;
          v16 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &v91, 1);
          objc_msgSend(v16, "appendData:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
          objc_msgSend(v19, "sessionTimeLimit");
          v90 = 0;
          v21 = sub_1001847DC(v17, v16, v18, &v90, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = v90;

          v85 = v16;
          v86 = v5;
          if (v23 || !v22)
            goto LABEL_31;
          if (!objc_msgSend(v22, "length"))
          {
            v23 = 0;
LABEL_31:
            v61 = v23;
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v64 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(v78);
              v67 = 45;
              if (isMetaClass)
                v67 = 43;
              v64(3, "%c[%{public}s %{public}s]:%i Failed to get key versions, error %{public}@", v67, ClassName, Name, 3035, v23);
            }
            v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v69 = NFSharedLogGetLogger(v68);
            v70 = objc_claimAutoreleasedReturnValue(v69);
            v48 = v87;
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v71 = object_getClass(self);
              if (class_isMetaClass(v71))
                v72 = 43;
              else
                v72 = 45;
              v73 = object_getClassName(self);
              v74 = sel_getName(v78);
              *(_DWORD *)buf = 67110146;
              v99 = v72;
              v100 = 2082;
              v101 = v73;
              v102 = 2082;
              v103 = v74;
              v104 = 1024;
              v105 = 3035;
              v106 = 2114;
              v107 = v61;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get key versions, error %{public}@", buf, 0x2Cu);
            }

            v60 = 0;
            v35 = v6;
            v45 = v61;
            goto LABEL_42;
          }
          v82 = objc_retainAutorelease(v22);
          v24 = (unsigned __int8 *)objc_msgSend(v82, "bytes");
          v25 = v24[10];
          if (v24[10])
          {
            v26 = 0;
            v27 = (unsigned __int16 *)(v24 + 11);
            do
            {
              v28 = (v9 + 1);
              v29 = *v27++;
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData objectAtIndex:](v88, "objectAtIndex:", v9));
              v31 = objc_msgSend(v30, "unsignedShortValue");

              v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v31));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKey:", v32));

              v34 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%04X"), __rev16(v29));
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("keyVersion"));

              ++v26;
              LODWORD(v9) = v9 + 1;
            }
            while (v26 < v25);
          }
          else
          {
            v28 = v9;
          }
          v97 = 0;
          v5 = objc_opt_new(NSMutableData);

          v9 = v28;
          v6 = v88;
          v10 = v79;
          v8 = v80;
          v11 = v83;
        }
        v11 = (char *)v11 + 1;
      }
      while (v11 != v8);
      v8 = -[NSMutableData countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    LODWORD(v9) = 0;
  }

  if (v97)
  {
    v35 = objc_opt_new(NSMutableData);
    buf[0] = 2;
    -[NSMutableData appendBytes:length:](v35, "appendBytes:length:", buf, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "tagID"));
    -[NSMutableData appendData:](v35, "appendData:", v37);

    -[NSMutableData appendBytes:length:](v35, "appendBytes:length:", &v97, 1);
    v86 = v5;
    -[NSMutableData appendData:](v35, "appendData:", v5);
    buf[0] = -[NSMutableData length](v35, "length") + 1;
    v38 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", buf, 1);
    objc_msgSend(v38, "appendData:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
    objc_msgSend(v41, "sessionTimeLimit");
    v89 = 0;
    v43 = sub_1001847DC(v39, v38, v40, &v89, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = v89;

    if (!v45 && v44 && objc_msgSend(v44, "length"))
    {
      v84 = objc_retainAutorelease(v44);
      v46 = (unsigned __int8 *)objc_msgSend(v84, "bytes");
      v47 = v46[10];
      v48 = v87;
      v49 = v6;
      if (v46[10])
      {
        v50 = 0;
        v51 = (unsigned __int16 *)(v46 + 11);
        v52 = v9;
        do
        {
          v53 = v52 + 1;
          v54 = *v51++;
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData objectAtIndex:](v49, "objectAtIndex:", v52));
          v56 = objc_msgSend(v55, "unsignedShortValue");

          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v56));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKey:", v57));

          v59 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%04X"), __rev16(v54));
          objc_msgSend(v58, "setObject:forKeyedSubscript:", v59, CFSTR("keyVersion"));

          ++v50;
          v52 = v53;
        }
        while (v50 < v47);
      }
      v97 = 0;

      v45 = 0;
      v60 = 1;
      v6 = v49;
    }
    else
    {

      v60 = 0;
      v48 = v87;
    }
LABEL_42:

    v5 = v86;
  }
  else
  {
    v45 = 0;
    v60 = 1;
    v48 = v87;
  }

  return v60;
}

- (id)_getSystemCodeListFromTag:(id)a3 outError:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  unsigned __int8 *v20;
  int v21;
  id v22;
  id v23;
  unint64_t v24;
  char *v25;
  id v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *specific;
  uint64_t Logger;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  const char *Name;
  id v64;
  char *sel;
  const char *sela;
  id *v67;
  id *v68;
  NSMutableArray *v69;
  id v70;
  int v71;
  __int16 v72;
  id v73;
  char v74;
  _QWORD v75[5];
  _QWORD v76[5];
  uint8_t buf[4];
  int v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  int v84;
  _QWORD v85[5];
  _QWORD v86[5];

  v7 = a3;
  v69 = objc_opt_new(NSMutableArray);
  v74 = 10;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &v74, 1);
  v74 = 12;
  objc_msgSend(v8, "appendBytes:length:", &v74, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tagID"));
  objc_msgSend(v8, "appendData:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
  objc_msgSend(v11, "sessionTimeLimit");
  v73 = 0;
  v13 = sub_1001847DC(v10, v8, v7, &v73, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  v15 = v73;

  if (objc_msgSend(v15, "code") != (id)64)
  {
    if (!v15 && (unint64_t)objc_msgSend(v14, "length") >= 0xB)
    {
      v19 = objc_retainAutorelease(v14);
      v20 = (unsigned __int8 *)objc_msgSend(v19, "bytes");
      v21 = v20[10];
      v14 = objc_retainAutorelease(v19);
      v22 = objc_msgSend(v14, "bytes");
      v23 = objc_msgSend(v14, "length");
      v15 = 0;
      if (!v21)
        goto LABEL_36;
      v24 = (unint64_t)v23 + (_QWORD)v22;
      if ((unint64_t)(v20 + 12) >= v24)
        goto LABEL_36;
      v25 = (char *)(v20 + 11);
      do
      {
        v26 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v25, 2);
        -[NSMutableArray addObject:](v69, "addObject:", v26);

        if (!(_BYTE)--v21)
          break;
        v27 = (unint64_t)(v25 + 3);
        v25 += 2;
      }
      while (v27 < v24);
LABEL_16:
      v15 = 0;
      goto LABEL_36;
    }
    sela = a2;
    v68 = a4;
    v72 = 1;
    v71 = -65530;
    v28 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v71, 6);
    objc_msgSend(v8, "setData:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
    objc_msgSend(v30, "sessionTimeLimit");
    v70 = v15;
    v32 = sub_1001847DC(v29, v8, v7, &v70, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = v70;

    if (!v34 && objc_msgSend(v33, "length") == (id)20)
    {
      v14 = objc_retainAutorelease(v33);
      v35 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", (char *)objc_msgSend(v14, "bytes") + 18, 2);
      -[NSMutableArray addObject:](v69, "addObject:", v35);

      goto LABEL_16;
    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v38 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(sela);
      v42 = 45;
      if (isMetaClass)
        v42 = 43;
      v38(5, "%c[%{public}s %{public}s]:%i Unable to identify tag's system code", v42, ClassName, Name, 3147);
    }
    v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v44 = NFSharedLogGetLogger(v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = object_getClass(self);
      if (class_isMetaClass(v46))
        v47 = 43;
      else
        v47 = 45;
      v48 = object_getClassName(self);
      v49 = sel_getName(sela);
      *(_DWORD *)buf = 67109890;
      v78 = v47;
      v79 = 2082;
      v80 = v48;
      v81 = 2082;
      v82 = v49;
      v83 = 1024;
      v84 = 3147;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unable to identify tag's system code", buf, 0x22u);
    }

    if (v68)
    {
      v14 = v33;
      if (!v34)
      {
LABEL_35:
        v15 = v34;
        goto LABEL_36;
      }
      v50 = objc_alloc((Class)NSError);
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v52 = objc_msgSend(v34, "code");
      v75[0] = NSLocalizedDescriptionKey;
      v64 = v52;
      if ((uint64_t)objc_msgSend(v34, "code") > 70)
        v53 = 71;
      else
        v53 = (uint64_t)objc_msgSend(v34, "code");
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v53]));
      v76[0] = v58;
      v76[1] = v34;
      v75[1] = NSUnderlyingErrorKey;
      v75[2] = CFSTR("Line");
      v76[2] = &off_100301118;
      v75[3] = CFSTR("Method");
      v59 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(sela));
      v76[3] = v59;
      v75[4] = NSDebugDescriptionErrorKey;
      v60 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(sela), 3155);
      v76[4] = v60;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v76, v75, 5));
      *v68 = objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, v64, v61);

    }
    v14 = v33;
    goto LABEL_35;
  }
  if (a4)
  {
    v67 = a4;
    sel = (char *)objc_alloc((Class)NSError);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v17 = objc_msgSend(v15, "code");
    v85[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v15, "code") > 70)
      v18 = 71;
    else
      v18 = (uint64_t)objc_msgSend(v15, "code");
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v18]));
    v86[0] = v54;
    v86[1] = v15;
    v85[1] = NSUnderlyingErrorKey;
    v85[2] = CFSTR("Line");
    v86[2] = &off_100301100;
    v85[3] = CFSTR("Method");
    v55 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v86[3] = v55;
    v85[4] = NSDebugDescriptionErrorKey;
    v56 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3120);
    v86[4] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 5));
    *v67 = objc_msgSend(sel, "initWithDomain:code:userInfo:", v16, v17, v57);

  }
LABEL_36:

  return v69;
}

- (id)_RequestService:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  unsigned __int8 *v22;
  int v23;
  id v24;
  id v25;
  char *v26;
  char *v27;
  char *v28;
  id v29;
  char *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  unsigned __int8 v37;
  _BYTE v38[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v37 = 0;
    v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &v37, 1);
    v37 = 2;
    objc_msgSend(v5, "appendBytes:length:", &v37, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tagID"));
    objc_msgSend(v5, "appendData:", v7);

    v37 = objc_msgSend(v4, "count");
    objc_msgSend(v5, "appendBytes:length:", &v37, 1);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v5, "appendData:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v12));
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v10);
    }

    v37 = objc_msgSend(v5, "length");
    objc_msgSend(v5, "replaceBytesInRange:withBytes:length:", 0, 1, &v37, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
    objc_msgSend(v15, "sessionTimeLimit");
    v32 = 0;
    v17 = sub_1001847DC(v13, v5, v14, &v32, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v32;

    v20 = objc_opt_new(NSMutableArray);
    if (!v19 && (unint64_t)objc_msgSend(v18, "length") >= 0xB)
    {
      v21 = objc_retainAutorelease(v18);
      v22 = (unsigned __int8 *)objc_msgSend(v21, "bytes");
      v23 = v22[10];
      v24 = objc_retainAutorelease(v21);
      v25 = objc_msgSend(v24, "bytes");
      v26 = (char *)objc_msgSend(v24, "length");
      if (v23)
      {
        v27 = &v26[(_QWORD)v25];
        if ((char *)(v22 + 12) < &v26[(_QWORD)v25])
        {
          v28 = (char *)(v22 + 11);
          do
          {
            v29 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v28, 2);
            -[NSMutableArray addObject:](v20, "addObject:", v29);

            if (!(_BYTE)--v23)
              break;
            v30 = v28 + 3;
            v28 += 2;
          }
          while (v30 < v27);
        }
      }
    }

  }
  else
  {
    v20 = objc_opt_new(NSArray);
  }

  return v20;
}

- (id)_RequestService:(id)a3 forSystemCode:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  id v25;
  NSMutableArray *v26;
  id v27;
  unsigned __int8 *v28;
  int v29;
  id v30;
  id v31;
  char *v32;
  char *v33;
  char *v34;
  id v35;
  char *v36;
  void *specific;
  uint64_t Logger;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *Name;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  int v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "length") == (id)2)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
      v58 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getIDMFromTag:systemCode:outIdm:outPmm:](self, "_getIDMFromTag:systemCode:outIdm:outPmm:", v9, v8, &v58, 0));
      v11 = v58;

      if (v10)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tagID"));

        v11 = (id)v13;
      }
      buf[0] = 0;
      v14 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", buf, 1);
      buf[0] = 2;
      objc_msgSend(v14, "appendBytes:length:", buf, 1);
      v51 = v11;
      objc_msgSend(v14, "appendData:", v11);
      buf[0] = objc_msgSend(v7, "count");
      objc_msgSend(v14, "appendBytes:length:", buf, 1);
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v15 = v7;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v55 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v14, "appendData:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i));
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v17);
      }

      buf[0] = objc_msgSend(v14, "length");
      objc_msgSend(v14, "replaceBytesInRange:withBytes:length:", 0, 1, buf, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
      objc_msgSend(v22, "sessionTimeLimit");
      v53 = v10;
      v24 = sub_1001847DC(v20, v14, v21, &v53, v23);
      v52 = (id)objc_claimAutoreleasedReturnValue(v24);
      v25 = v53;

      v26 = objc_opt_new(NSMutableArray);
      if (!v25 && (unint64_t)objc_msgSend(v52, "length") >= 0xC)
      {
        v27 = objc_retainAutorelease(v52);
        v28 = (unsigned __int8 *)objc_msgSend(v27, "bytes");
        v29 = v28[10];
        v30 = objc_retainAutorelease(v27);
        v31 = objc_msgSend(v30, "bytes");
        v32 = (char *)objc_msgSend(v30, "length");
        if (v29)
        {
          v33 = &v32[(_QWORD)v31];
          if ((char *)(v28 + 12) < &v32[(_QWORD)v31])
          {
            v34 = (char *)(v28 + 11);
            do
            {
              v35 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v34, 2);
              -[NSMutableArray addObject:](v26, "addObject:", v35);

              if (!(_BYTE)--v29)
                break;
              v36 = v34 + 3;
              v34 += 2;
            }
            while (v36 < v33);
          }
        }
      }

    }
    else
    {
      v26 = objc_opt_new(NSArray);
    }
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v39 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v43 = 45;
      if (isMetaClass)
        v43 = 43;
      v39(3, "%c[%{public}s %{public}s]:%i Invalid systemCode. ", v43, ClassName, Name, 3208);
    }
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFSharedLogGetLogger(v44);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = object_getClass(self);
      if (class_isMetaClass(v47))
        v48 = 43;
      else
        v48 = 45;
      *(_DWORD *)buf = 67109890;
      v61 = v48;
      v62 = 2082;
      v63 = object_getClassName(self);
      v64 = 2082;
      v65 = sel_getName(a2);
      v66 = 1024;
      v67 = 3208;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid systemCode. ", buf, 0x22u);
    }

    v26 = 0;
  }

  return v26;
}

- (id)_getIDMFromTag:(id)a3 systemCode:(id)a4 outIdm:(id *)a5 outPmm:(id *)a6
{
  id v10;
  id v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _BYTE *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  __int16 v33;
  char v34;
  char v35;
  __int16 v36;
  NSErrorUserInfoKey v37;
  void *v38;
  NSErrorUserInfoKey v39;
  void *v40;

  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "length") == (id)2)
  {
    v12 = (char *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
    v33 = 6;
    v34 = *v12;
    v35 = v12[1];
    v36 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
    v14 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v33, 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
    objc_msgSend(v15, "sessionTimeLimit");
    v32 = 0;
    v17 = sub_1001847DC(v13, v14, v10, &v32, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v32;

    if (v19)
    {
      v20 = v19;
    }
    else
    {
      v25 = objc_retainAutorelease(v18);
      v26 = objc_msgSend(v25, "bytes");
      if (objc_msgSend(v25, "length") == (id)18 && *v26 == 18 && v26[1] == 1)
      {
        if (a5)
          *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "subdataWithRange:", 2, 8));
        v20 = 0;
        if (a6)
          *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "subdataWithRange:", 10, 8));
      }
      else
      {
        v27 = objc_alloc((Class)NSError);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v37 = NSLocalizedDescriptionKey;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
        v38 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
        v20 = objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 13, v30);

      }
    }

  }
  else
  {
    v21 = objc_alloc((Class)NSError);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v39 = NSLocalizedDescriptionKey;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v40 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    v20 = objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 10, v24);

  }
  return v20;
}

- (id)_getSystemInfo:(id)a3 outError:(id *)a4
{
  id v7;
  id v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  void *specific;
  uint64_t Logger;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  NSMutableDictionary *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  const char *ClassName;
  const char *Name;
  id *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  int v54;
  __int16 v55;
  uint8_t buf[4];
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  id v65;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v48 = a4;
    v55 = 1;
    v54 = 6;
    v8 = objc_retainAutorelease(v7);
    v9 = (unsigned __int8 *)objc_msgSend(v8, "bytes");
    v10 = *v9;
    BYTE2(v54) = *v9;
    v11 = v9[1];
    HIBYTE(v54) = v9[1];
    v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v54, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
    objc_msgSend(v15, "sessionTimeLimit");
    v53 = 0;
    v50 = v12;
    v17 = sub_1001847DC(v13, v12, v14, &v53, v16);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v18 = v53;

    if (v18)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v21 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v24 = 45;
        if (isMetaClass)
          v24 = 43;
        v21(3, "%c[%{public}s %{public}s]:%i System switch error: %{public}@", v24, ClassName, Name, 3323, v18);
      }
      v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v26 = NFSharedLogGetLogger(v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = object_getClass(self);
        if (class_isMetaClass(v28))
          v29 = 43;
        else
          v29 = 45;
        v30 = object_getClassName(self);
        v31 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v57 = v29;
        v58 = 2082;
        v59 = v30;
        v60 = 2082;
        v61 = v31;
        v62 = 1024;
        v63 = 3323;
        v64 = 2114;
        v65 = v18;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i System switch error: %{public}@", buf, 0x2Cu);
      }

      if (v48)
      {
        v18 = objc_retainAutorelease(v18);
        v32 = 0;
        *v48 = v18;
      }
      else
      {
        v32 = 0;
      }
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getNodeList](self, "_getNodeList"));
      if (v33)
      {
        v32 = objc_opt_new(NSMutableDictionary);
        v34 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%04x"), v11 | (v10 << 8));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v34, CFSTR("systemCode"));

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
        v51 = 0;
        v52 = 0;
        v18 = (id)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getIDMFromTag:systemCode:outIdm:outPmm:](self, "_getIDMFromTag:systemCode:outIdm:outPmm:", v35, v8, &v52, &v51));
        v36 = v52;
        v37 = v51;

        if (v18)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
          v39 = v33;
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "tagF"));
          v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "IDm"));

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "tagF"));
          v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "PMm"));

          v36 = (id)v41;
          v37 = (id)v44;
          v33 = v39;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v36, CFSTR("idm"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v37, CFSTR("pmm"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v33, CFSTR("areaCodeList"));

      }
      else
      {
        v18 = 0;
        v32 = 0;
      }

    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)_isFelicaPollingCommand:(id)a3 systemCode:(id *)a4
{
  id v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  id v8;
  BOOL v9;

  v5 = objc_retainAutorelease(a3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  if (v6 && (v7 = v6, v8 = (id)*v6, objc_msgSend(v5, "length") == v8) && !v7[1])
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subdataWithRange:", 2, 2));
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unsigned)_validateFelicaCommand:(id)a3
{
  id v5;
  unsigned __int8 *v6;
  id v7;
  unsigned int v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  uint64_t v28;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  int v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  _BOOL4 v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  objc_class *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  objc_class *v60;
  int v61;
  const char *ClassName;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *Name;
  const char *v68;
  const char *v69;
  const char *v70;
  uint8_t buf[4];
  int v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  int v78;
  __int16 v79;
  id v80;

  v5 = objc_retainAutorelease(a3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  v7 = (id)*v6;
  if (objc_msgSend(v5, "length") == v7)
  {
    if (v6[1])
    {
      HIDWORD(v9) = v6[1];
      LODWORD(v9) = HIDWORD(v9) - 2;
      v8 = v9 >> 1;
      v10 = v8 > 0x20;
      v11 = (1 << v8) & 0x1F90001BFLL;
      if (!v10 && v11 != 0)
      {
        if ((unint64_t)objc_msgSend(v5, "length") <= 8)
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v15 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v18 = 45;
            if (isMetaClass)
              v18 = 43;
            v15(3, "%c[%{public}s %{public}s]:%i Invalid minimum length, packet: %{public}@", v18, ClassName, Name, 3404, v5);
          }
          v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v20 = NFSharedLogGetLogger(v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          v22 = object_getClass(self);
          if (class_isMetaClass(v22))
            v23 = 43;
          else
            v23 = 45;
          *(_DWORD *)buf = 67110146;
          v72 = v23;
          v73 = 2082;
          v74 = object_getClassName(self);
          v75 = 2082;
          v76 = sel_getName(a2);
          v77 = 1024;
          v78 = 3404;
          v79 = 2114;
          v80 = v5;
          v24 = "%c[%{public}s %{public}s]:%i Invalid minimum length, packet: %{public}@";
LABEL_49:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v24, buf, 0x2Cu);
LABEL_50:
          v37 = 10;
LABEL_51:

          goto LABEL_52;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "tagID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subdataWithRange:", 2, 8));
        v41 = objc_msgSend(v39, "isEqualToData:", v40);

        if ((v41 & 1) == 0)
        {
          v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v53 = NFLogGetLogger(v52);
          if (v53)
          {
            v54 = (void (*)(uint64_t, const char *, ...))v53;
            v55 = object_getClass(self);
            v56 = class_isMetaClass(v55);
            v66 = object_getClassName(self);
            v70 = sel_getName(a2);
            v57 = 45;
            if (v56)
              v57 = 43;
            v54(3, "%c[%{public}s %{public}s]:%i Invalid IDM, packet: %{public}@", v57, v66, v70, 3409, v5);
          }
          v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v59 = NFSharedLogGetLogger(v58);
          v21 = objc_claimAutoreleasedReturnValue(v59);
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          v60 = object_getClass(self);
          if (class_isMetaClass(v60))
            v61 = 43;
          else
            v61 = 45;
          *(_DWORD *)buf = 67110146;
          v72 = v61;
          v73 = 2082;
          v74 = object_getClassName(self);
          v75 = 2082;
          v76 = sel_getName(a2);
          v77 = 1024;
          v78 = 3409;
          v79 = 2114;
          v80 = v5;
          v24 = "%c[%{public}s %{public}s]:%i Invalid IDM, packet: %{public}@";
          goto LABEL_49;
        }
      }
    }
    else
    {
      if (objc_msgSend(v5, "length") != (id)6)
      {
        v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v43 = NFLogGetLogger(v42);
        if (v43)
        {
          v44 = (void (*)(uint64_t, const char *, ...))v43;
          v45 = object_getClass(self);
          v46 = class_isMetaClass(v45);
          v65 = object_getClassName(self);
          v69 = sel_getName(a2);
          v47 = 45;
          if (v46)
            v47 = 43;
          v44(3, "%c[%{public}s %{public}s]:%i Invalid length, packet: %{public}@", v47, v65, v69, 3377, v5);
        }
        v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v49 = NFSharedLogGetLogger(v48);
        v21 = objc_claimAutoreleasedReturnValue(v49);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_50;
        v50 = object_getClass(self);
        if (class_isMetaClass(v50))
          v51 = 43;
        else
          v51 = 45;
        *(_DWORD *)buf = 67110146;
        v72 = v51;
        v73 = 2082;
        v74 = object_getClassName(self);
        v75 = 2082;
        v76 = sel_getName(a2);
        v77 = 1024;
        v78 = 3377;
        v79 = 2114;
        v80 = v5;
        v24 = "%c[%{public}s %{public}s]:%i Invalid length, packet: %{public}@";
        goto LABEL_49;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subdataWithRange:", 2, 2));
      v26 = -[_NFReaderSession validateSystemCode:](self, "validateSystemCode:", v25);

      if ((v26 & 1) == 0)
      {
        v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v28 = NFLogGetLogger(v27);
        if (v28)
        {
          v29 = (void (*)(uint64_t, const char *, ...))v28;
          v30 = object_getClass(self);
          v31 = class_isMetaClass(v30);
          v64 = object_getClassName(self);
          v68 = sel_getName(a2);
          v32 = 45;
          if (v31)
            v32 = 43;
          v29(3, "%c[%{public}s %{public}s]:%i Invalid system code, packet: %{public}@", v32, v64, v68, 3382, v5);
        }
        v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v34 = NFSharedLogGetLogger(v33);
        v21 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v35 = object_getClass(self);
          if (class_isMetaClass(v35))
            v36 = 43;
          else
            v36 = 45;
          *(_DWORD *)buf = 67110146;
          v72 = v36;
          v73 = 2082;
          v74 = object_getClassName(self);
          v75 = 2082;
          v76 = sel_getName(a2);
          v77 = 1024;
          v78 = 3382;
          v79 = 2114;
          v80 = v5;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid system code, packet: %{public}@", buf, 0x2Cu);
        }
        v37 = 32;
        goto LABEL_51;
      }
    }
  }
  v37 = 0;
LABEL_52:

  return v37;
}

- (BOOL)_requiresTypeFUpdate:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if ((-[_NFReaderSession sessionConfig](self, "sessionConfig") & 1) != 0)
    v5 = (objc_msgSend(v4, "technology") >> 2) & 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_updateFelicaTagInfo:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (-[_NFReaderSession _requiresTypeFUpdate:](self, "_requiresTypeFUpdate:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _getSystemCodeListFromTag:outError:](self, "_getSystemCodeListFromTag:outError:", v6, a4));
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "_setSystemCodes:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      objc_msgSend(v6, "_setSystemCode:", v8);

    }
    if (a4)
      LOBYTE(a4) = *a4 == 0;

  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (unsigned)_refreshNdefTagConnection
{
  unsigned int v3;
  NFDriverWrapper *driverWrapper;

  v3 = sub_10017E740((uint64_t)self->_driverWrapper, self->_currentTag);
  if (v3 > 9 || ((1 << v3) & 0x248) == 0)
  {
    LODWORD(driverWrapper) = 0;
  }
  else
  {
    LODWORD(driverWrapper) = sub_10017EF78(self->_driverWrapper, self->_currentTag, 0);
    if (!(_DWORD)driverWrapper)
    {
      driverWrapper = self->_driverWrapper;
      if (driverWrapper)
        LODWORD(driverWrapper) = sub_10017E9A4(driverWrapper, self->_currentTag, 0);
    }
  }
  return driverWrapper;
}

- (id)_readNdefMessageFromTag:(id)a3 rawLength:(unint64_t *)a4 error:(id *)a5
{
  id v9;
  NFDriverWrapper *driverWrapper;
  int v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  int v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[4];
  _QWORD v48[4];

  v9 = a3;
  if (a5)
    *a5 = 0;
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper)
  {
LABEL_14:
    v42 = 0;
    v43 = 0;
    v44 = 0;
    if (sub_10017F4D4(driverWrapper, v9, &v42, (uint64_t)a5))
    {
      if ((_BYTE)v44)
      {
        v21 = sub_100180CAC(self->_driverWrapper, v9, v42, a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v21);
      }
      else
      {
        v15 = 0;
      }
      v23 = v42;
      v24 = v42 == 0;
      if (v42 && a5)
      {
        v24 = objc_msgSend(*a5, "code") == (id)49;
        v23 = v42;
      }
      v25 = !v24;
      if (!(_BYTE)v44)
        v25 = 1;
      if (BYTE1(v44))
      {
        v26 = 4;
      }
      else
      {
        v25 = 1;
        v26 = 3;
      }
      if ((_BYTE)v44)
        v27 = v26;
      else
        v27 = 1;
      if (v25)
        v22 = v27;
      else
        v22 = 2;
      if (v24)
        v28 = 0;
      else
        v28 = v23;
      objc_msgSend(v9, "_setNDEFMessageSize:", v28);
      objc_msgSend(v9, "_setNDEFContainerSize:", v43);
    }
    else
    {
      v15 = 0;
      v22 = 0;
    }
    objc_msgSend(v9, "_setNDEFAvailability:", v22);
    if (!a5 || objc_msgSend(*a5, "code") != 51)
    {
      v29 = sub_10017EF78(self->_driverWrapper, v9, 0);
      if (a5)
      {
        v30 = v29;
        if (v29)
        {
          v41 = objc_alloc((Class)NSError);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v32 = v30;
          v45[0] = NSLocalizedDescriptionKey;
          if (v30 >= 0x47)
            v33 = 71;
          else
            v33 = v30;
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v33]));
          v46[0] = v34;
          v46[1] = &off_100301148;
          v45[1] = CFSTR("Line");
          v45[2] = CFSTR("Method");
          v35 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v46[2] = v35;
          v45[3] = NSDebugDescriptionErrorKey;
          v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3500);
          v46[3] = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 4));
          *a5 = objc_msgSend(v41, "initWithDomain:code:userInfo:", v31, v32, v37);

        }
      }
    }
    if (v15)
    {
      v38 = objc_alloc((Class)NFNdefMessageInternal);
      v39 = objc_retainAutorelease(v15);
      a5 = (id *)objc_msgSend(v38, "initWithBytes:length:", objc_msgSend(v39, "bytes"), objc_msgSend(v39, "length"));
      if (a4)
        *a4 = (unint64_t)objc_msgSend(v39, "length");
      goto LABEL_49;
    }
LABEL_48:
    a5 = 0;
LABEL_49:

    goto LABEL_50;
  }
  v11 = sub_10017E9A4(driverWrapper, v9, 0);
  if (!v11)
  {
    driverWrapper = self->_driverWrapper;
    goto LABEL_14;
  }
  if (a5)
  {
    LODWORD(v12) = v11;
    v13 = v11 & 0x6F;
    v14 = objc_alloc((Class)NSError);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    if (v13 == 35 || (_DWORD)v12 == 64)
      v12 = v12;
    else
      v12 = 21;
    v47[0] = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v12]));
    v48[0] = v17;
    v48[1] = &off_100301130;
    v47[1] = CFSTR("Line");
    v47[2] = CFSTR("Method");
    v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v48[2] = v18;
    v47[3] = NSDebugDescriptionErrorKey;
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3466);
    v48[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 4));
    *a5 = objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, v12, v20);

    goto LABEL_48;
  }
LABEL_50:

  return a5;
}

- (BOOL)_selectFromTag:(id)a3 aid:(id)a4 resolvedAid:(id *)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  BOOL v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id *v73;
  id v74;
  id v75;
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[4];
  _QWORD v80[4];
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[4];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];

  v11 = a3;
  v12 = a4;
  if (a6)
    *a6 = 0;
  v75 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _selectTag:aid:p1:p2:shortLe:error:](self, "_selectTag:aid:p1:p2:shortLe:error:", v11, v12, 4, 0, 0, &v75));
  v14 = v75;
  v15 = v14;
  v73 = a5;
  if (!v13 || v14)
  {
    v69 = v12;
    v72 = v11;
    if (v14)
    {
      v65 = a6;
      v21 = objc_msgSend(v14, "code");
      v22 = objc_alloc((Class)NSError);
      v23 = v15;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v21 == (id)64)
      {
        v63 = v22;
        v25 = objc_msgSend(v23, "code");
        v86[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)objc_msgSend(v23, "code") > 70)
          v26 = 71;
        else
          v26 = (uint64_t)objc_msgSend(v23, "code");
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v26]));
        v87[0] = v53;
        v87[1] = v23;
        v86[1] = NSUnderlyingErrorKey;
        v86[2] = CFSTR("Line");
        v87[2] = &off_100301160;
        v86[3] = CFSTR("Method");
        v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v87[3] = v54;
        v86[4] = NSDebugDescriptionErrorKey;
        v55 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3528);
        v87[4] = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 5));
        v20 = objc_msgSend(v63, "initWithDomain:code:userInfo:", v24, v25, v56);

        v17 = 0;
        v12 = v69;
        v35 = v73;
      }
      else
      {
        v84[0] = NSLocalizedDescriptionKey;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
        v85[0] = v43;
        v85[1] = v23;
        v84[1] = NSUnderlyingErrorKey;
        v84[2] = CFSTR("Line");
        v85[2] = &off_100301178;
        v84[3] = CFSTR("Method");
        v44 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v85[3] = v44;
        v84[4] = NSDebugDescriptionErrorKey;
        v45 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3530);
        v85[4] = v45;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 5));
        v20 = objc_msgSend(v22, "initWithDomain:code:userInfo:", v24, 29, v46);

        v35 = v73;
        v12 = v69;

        v17 = 0;
      }
      v15 = v23;
      a6 = v65;
    }
    else
    {
      v36 = objc_alloc((Class)NSError);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v82[0] = NSLocalizedDescriptionKey;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v83[0] = v38;
      v83[1] = &off_100301190;
      v82[1] = CFSTR("Line");
      v82[2] = CFSTR("Method");
      v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v83[2] = v39;
      v82[3] = NSDebugDescriptionErrorKey;
      v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3533);
      v83[3] = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 4));
      v42 = v36;
      v12 = v69;
      v20 = objc_msgSend(v42, "initWithDomain:code:userInfo:", v37, 29, v41);

      v35 = v73;
      v17 = 0;
    }
    goto LABEL_26;
  }
  if ((unint64_t)objc_msgSend(v13, "length") < 2)
  {
    v72 = v11;
    v66 = v13;
    v27 = v12;
    v28 = objc_alloc((Class)NSError);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v76[0] = NSLocalizedDescriptionKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
    v77[0] = v30;
    v77[1] = &off_1003011D8;
    v76[1] = CFSTR("Line");
    v76[2] = CFSTR("Method");
    v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v77[2] = v31;
    v76[3] = NSDebugDescriptionErrorKey;
    v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3552);
    v77[3] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 4));
    v34 = v28;
    v12 = v27;
    v13 = v66;
    v20 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v29, 29, v33);

    v17 = 0;
LABEL_16:
    v35 = v73;
LABEL_26:
    if (v35)
      *v35 = objc_retainAutorelease(v17);
    v11 = v72;
    if (a6)
      *a6 = objc_retainAutorelease(v20);
    v52 = v20 == 0;
    goto LABEL_31;
  }
  v74 = 0;
  v16 = -[_NFReaderSession validateAID:withSelectResponse:outRealAid:](self, "validateAID:withSelectResponse:outRealAid:", v12, v13, &v74);
  v17 = v74;
  if ((v16 & 1) != 0)
  {
    v18 = objc_retainAutorelease(v13);
    v19 = (char *)objc_msgSend(v18, "bytes");
    v72 = v11;
    if (*(_WORD *)&v19[(_QWORD)objc_msgSend(v18, "length") - 2] == 144)
    {
      if (!v17)
        v17 = v12;
      v20 = 0;
    }
    else
    {
      v68 = objc_alloc((Class)NSError);
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v78[0] = NSLocalizedDescriptionKey;
      v71 = v12;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Not Found"));
      v79[0] = v59;
      v79[1] = &off_1003011C0;
      v78[1] = CFSTR("Line");
      v78[2] = CFSTR("Method");
      v60 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v79[2] = v60;
      v78[3] = NSDebugDescriptionErrorKey;
      v61 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3547);
      v79[3] = v61;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 4));
      v20 = objc_msgSend(v68, "initWithDomain:code:userInfo:", v58, 28, v62);

      v12 = v71;
    }
    goto LABEL_16;
  }
  if (a6)
  {
    v67 = objc_alloc((Class)NSError);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v80[0] = NSLocalizedDescriptionKey;
    v70 = v12;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Security Violation"));
    v81[0] = v47;
    v81[1] = &off_1003011A8;
    v80[1] = CFSTR("Line");
    v80[2] = CFSTR("Method");
    v48 = v11;
    v49 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v81[2] = v49;
    v80[3] = NSDebugDescriptionErrorKey;
    v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3539);
    v81[3] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 4));
    *a6 = objc_msgSend(v67, "initWithDomain:code:userInfo:", v64, 8, v51);

    v11 = v48;
    v12 = v70;

  }
  if (v73)
  {
    v17 = objc_retainAutorelease(v17);
    v20 = 0;
    v52 = 0;
    *v73 = v17;
  }
  else
  {
    v20 = 0;
    v52 = 0;
  }
LABEL_31:

  return v52;
}

- (id)_selectTag:(id)a3 aid:(id)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 shortLe:(char)a7 error:(id *)a8
{
  int v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v37;
  id v38;
  char v39;
  __int16 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];

  v9 = a7;
  if (a8)
    *a8 = 0;
  v40 = -23552;
  v41 = a5;
  v42 = a6;
  v13 = a4;
  v14 = a3;
  v43 = objc_msgSend(v13, "length");
  v15 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &v40, 5);
  objc_msgSend(v15, "appendData:", v13);

  if ((v9 & 0x80000000) == 0)
  {
    v39 = v9;
    objc_msgSend(v15, "appendBytes:length:", &v39, 1);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
  objc_msgSend(v17, "sessionTimeLimit");
  v38 = 0;
  v19 = sub_1001847DC(v16, v15, v14, &v38, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = v38;
  if (a8 && (!v20 || v21))
  {
    if (v21)
    {
      v22 = objc_msgSend(v21, "code");
      v23 = objc_alloc((Class)NSError);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v22 == (id)64)
      {
        v37 = objc_msgSend(v21, "code");
        v48[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)objc_msgSend(v21, "code") > 70)
          v25 = 71;
        else
          v25 = (uint64_t)objc_msgSend(v21, "code");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EA5E0[v25]));
        v49[0] = v26;
        v49[1] = v21;
        v48[1] = NSUnderlyingErrorKey;
        v48[2] = CFSTR("Line");
        v49[2] = &off_1003011F0;
        v48[3] = CFSTR("Method");
        v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v49[3] = v27;
        v48[4] = NSDebugDescriptionErrorKey;
        v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3589);
        v49[4] = v28;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 5));
        v33 = v23;
        v34 = v24;
        v35 = (uint64_t)v37;
        goto LABEL_17;
      }
      v46[0] = NSLocalizedDescriptionKey;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v47[0] = v26;
      v47[1] = v21;
      v46[1] = NSUnderlyingErrorKey;
      v46[2] = CFSTR("Line");
      v47[2] = &off_100301208;
      v46[3] = CFSTR("Method");
      v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v47[3] = v27;
      v46[4] = NSDebugDescriptionErrorKey;
      v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3591);
      v47[4] = v28;
      v29 = v47;
      v30 = v46;
      v31 = 5;
    }
    else
    {
      v23 = objc_alloc((Class)NSError);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v44[0] = NSLocalizedDescriptionKey;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v45[0] = v26;
      v45[1] = &off_100301220;
      v44[1] = CFSTR("Line");
      v44[2] = CFSTR("Method");
      v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v45[2] = v27;
      v44[3] = NSDebugDescriptionErrorKey;
      v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3594);
      v45[3] = v28;
      v29 = v45;
      v30 = v44;
      v31 = 4;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v30, v31));
    v33 = v23;
    v34 = v24;
    v35 = 29;
LABEL_17:
    *a8 = objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, v35, v32);

  }
  return v20;
}

- (unsigned)_validateAPDU:(id)a3 outCheckFciResponse:(BOOL *)a4
{
  id v7;
  unsigned __int8 v8;
  unsigned int v9;
  char v10;
  unsigned int v11;
  int v12;
  void *v13;
  int64_t v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  void *specific;
  uint64_t Logger;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  NSObject *v49;
  const char *v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  void (*v68)(uint64_t, const char *, ...);
  objc_class *v69;
  _BOOL4 v70;
  const char *v71;
  const char *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  objc_class *v77;
  int v78;
  const char *v79;
  const char *v80;
  void *v81;
  uint64_t v82;
  void (*v83)(uint64_t, const char *, ...);
  objc_class *v84;
  _BOOL4 v85;
  const char *v86;
  const char *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  objc_class *v92;
  int v93;
  const char *v94;
  const char *v95;
  void *v96;
  uint64_t v97;
  void (*v98)(uint64_t, const char *, ...);
  objc_class *v99;
  _BOOL4 v100;
  const char *v101;
  const char *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  objc_class *v107;
  int v108;
  const char *v109;
  const char *v110;
  void *v111;
  uint64_t v112;
  void (*v113)(uint64_t, const char *, ...);
  objc_class *v114;
  _BOOL4 v115;
  const char *v116;
  const char *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  objc_class *v122;
  int v123;
  const char *v124;
  const char *v125;
  void *v126;
  unsigned __int8 v127;
  void *v129;
  uint64_t v130;
  void (*v131)(uint64_t, const char *, ...);
  objc_class *v132;
  _BOOL4 v133;
  const char *v134;
  const char *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  objc_class *v140;
  int v141;
  const char *v142;
  const char *v143;
  NSObject *v144;
  uint64_t v145;
  __int16 v146;
  uint8_t buf[4];
  int v148;
  __int16 v149;
  const char *v150;
  __int16 v151;
  const char *v152;
  __int16 v153;
  int v154;
  __int16 v155;
  NSObject *v156;

  v7 = a3;
  if (!v7)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v35 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "description"));
      v41 = 45;
      if (isMetaClass)
        v41 = 43;
      v35(3, "%c[%{public}s %{public}s]:%i Invalid APDU: %{public}@", v41, ClassName, Name, 3606, v40);

    }
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger(v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_69;
    v45 = object_getClass(self);
    if (class_isMetaClass(v45))
      v46 = 43;
    else
      v46 = 45;
    v47 = object_getClassName(self);
    v48 = sel_getName(a2);
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(0, "description"));
    *(_DWORD *)buf = 67110146;
    v148 = v46;
    v149 = 2082;
    v150 = v47;
    v151 = 2082;
    v152 = v48;
    v153 = 1024;
    v154 = 3606;
    v155 = 2114;
    v156 = v49;
    v50 = "%c[%{public}s %{public}s]:%i Invalid APDU: %{public}@";
    goto LABEL_67;
  }
  v8 = -[_NFReaderSession sessionConfig](self, "sessionConfig");
  v9 = objc_msgSend(v7, "clss");
  v10 = v9;
  if ((v8 & 8) != 0)
  {
    if (v9 || objc_msgSend(v7, "instruction") != 164)
    {
      if (objc_msgSend(v7, "clss") == 128 && objc_msgSend(v7, "instruction") == 202)
      {
        if (objc_msgSend(v7, "p1") == 1)
        {
          if (!objc_msgSend(v7, "p2") || objc_msgSend(v7, "p2") == 1)
            goto LABEL_90;
          v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v67 = NFLogGetLogger(v66);
          if (v67)
          {
            v68 = (void (*)(uint64_t, const char *, ...))v67;
            v69 = object_getClass(self);
            v70 = class_isMetaClass(v69);
            v71 = object_getClassName(self);
            v72 = sel_getName(a2);
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
            v74 = 45;
            if (v70)
              v74 = 43;
            v68(3, "%c[%{public}s %{public}s]:%i Invalid P2 parameter: %{public}@", v74, v71, v72, 3634, v73);

          }
          v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v76 = NFSharedLogGetLogger(v75);
          v44 = objc_claimAutoreleasedReturnValue(v76);
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            goto LABEL_69;
          v77 = object_getClass(self);
          if (class_isMetaClass(v77))
            v78 = 43;
          else
            v78 = 45;
          v79 = object_getClassName(self);
          v80 = sel_getName(a2);
          v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
          *(_DWORD *)buf = 67110146;
          v148 = v78;
          v149 = 2082;
          v150 = v79;
          v151 = 2082;
          v152 = v80;
          v153 = 1024;
          v154 = 3634;
          v155 = 2114;
          v156 = v49;
          v50 = "%c[%{public}s %{public}s]:%i Invalid P2 parameter: %{public}@";
        }
        else
        {
          v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v97 = NFLogGetLogger(v96);
          if (v97)
          {
            v98 = (void (*)(uint64_t, const char *, ...))v97;
            v99 = object_getClass(self);
            v100 = class_isMetaClass(v99);
            v101 = object_getClassName(self);
            v102 = sel_getName(a2);
            v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
            v104 = 45;
            if (v100)
              v104 = 43;
            v98(3, "%c[%{public}s %{public}s]:%i Invalid P1 parameter: %{public}@", v104, v101, v102, 3630, v103);

          }
          v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v106 = NFSharedLogGetLogger(v105);
          v44 = objc_claimAutoreleasedReturnValue(v106);
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            goto LABEL_69;
          v107 = object_getClass(self);
          if (class_isMetaClass(v107))
            v108 = 43;
          else
            v108 = 45;
          v109 = object_getClassName(self);
          v110 = sel_getName(a2);
          v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
          *(_DWORD *)buf = 67110146;
          v148 = v108;
          v149 = 2082;
          v150 = v109;
          v151 = 2082;
          v152 = v110;
          v153 = 1024;
          v154 = 3630;
          v155 = 2114;
          v156 = v49;
          v50 = "%c[%{public}s %{public}s]:%i Invalid P1 parameter: %{public}@";
        }
      }
      else
      {
        v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v82 = NFLogGetLogger(v81);
        if (v82)
        {
          v83 = (void (*)(uint64_t, const char *, ...))v82;
          v84 = object_getClass(self);
          v85 = class_isMetaClass(v84);
          v86 = object_getClassName(self);
          v87 = sel_getName(a2);
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
          v89 = 45;
          if (v85)
            v89 = 43;
          v83(3, "%c[%{public}s %{public}s]:%i Invalid APDU: %{public}@", v89, v86, v87, 3638, v88);

        }
        v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v91 = NFSharedLogGetLogger(v90);
        v44 = objc_claimAutoreleasedReturnValue(v91);
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        v92 = object_getClass(self);
        if (class_isMetaClass(v92))
          v93 = 43;
        else
          v93 = 45;
        v94 = object_getClassName(self);
        v95 = sel_getName(a2);
        v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
        *(_DWORD *)buf = 67110146;
        v148 = v93;
        v149 = 2082;
        v150 = v94;
        v151 = 2082;
        v152 = v95;
        v153 = 1024;
        v154 = 3638;
        v155 = 2114;
        v156 = v49;
        v50 = "%c[%{public}s %{public}s]:%i Invalid APDU: %{public}@";
      }
    }
    else
    {
      if (objc_msgSend(v7, "p1") == 4)
      {
        if (objc_msgSend(v7, "p2"))
        {
          v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v52 = NFLogGetLogger(v51);
          if (v52)
          {
            v53 = (void (*)(uint64_t, const char *, ...))v52;
            v54 = object_getClass(self);
            v55 = class_isMetaClass(v54);
            v56 = object_getClassName(self);
            v57 = sel_getName(a2);
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
            v59 = 45;
            if (v55)
              v59 = 43;
            v53(3, "%c[%{public}s %{public}s]:%i Invalid P2 parameter: %{public}@", v59, v56, v57, 3617, v58);

          }
          v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v61 = NFSharedLogGetLogger(v60);
          v44 = objc_claimAutoreleasedReturnValue(v61);
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            goto LABEL_69;
          v62 = object_getClass(self);
          if (class_isMetaClass(v62))
            v63 = 43;
          else
            v63 = 45;
          v64 = object_getClassName(self);
          v65 = sel_getName(a2);
          v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
          *(_DWORD *)buf = 67110146;
          v148 = v63;
          v149 = 2082;
          v150 = v64;
          v151 = 2082;
          v152 = v65;
          v153 = 1024;
          v154 = 3617;
          v155 = 2114;
          v156 = v49;
          v50 = "%c[%{public}s %{public}s]:%i Invalid P2 parameter: %{public}@";
          goto LABEL_67;
        }
        v146 = 12592;
        v145 = *(_QWORD *)"OSE.VAS.01";
        v44 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v145, 10);
        v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload"));
        v127 = objc_msgSend(v126, "isEqualToData:", v44);

        if ((v127 & 1) == 0)
        {
          v129 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v130 = NFLogGetLogger(v129);
          if (v130)
          {
            v131 = (void (*)(uint64_t, const char *, ...))v130;
            v132 = object_getClass(self);
            v133 = class_isMetaClass(v132);
            v134 = object_getClassName(self);
            v135 = sel_getName(a2);
            v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
            v137 = 45;
            if (v133)
              v137 = 43;
            v131(3, "%c[%{public}s %{public}s]:%i Invalid AID for selection: %{public}@", v137, v134, v135, 3625, v136);

          }
          v138 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v139 = NFSharedLogGetLogger(v138);
          v49 = objc_claimAutoreleasedReturnValue(v139);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v140 = object_getClass(self);
            if (class_isMetaClass(v140))
              v141 = 43;
            else
              v141 = 45;
            v142 = object_getClassName(self);
            v143 = sel_getName(a2);
            v144 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
            *(_DWORD *)buf = 67110146;
            v148 = v141;
            v149 = 2082;
            v150 = v142;
            v151 = 2082;
            v152 = v143;
            v153 = 1024;
            v154 = 3625;
            v155 = 2114;
            v156 = v144;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AID for selection: %{public}@", buf, 0x2Cu);

          }
          goto LABEL_68;
        }

LABEL_90:
        v15 = 0;
        goto LABEL_91;
      }
      v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v112 = NFLogGetLogger(v111);
      if (v112)
      {
        v113 = (void (*)(uint64_t, const char *, ...))v112;
        v114 = object_getClass(self);
        v115 = class_isMetaClass(v114);
        v116 = object_getClassName(self);
        v117 = sel_getName(a2);
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
        v119 = 45;
        if (v115)
          v119 = 43;
        v113(3, "%c[%{public}s %{public}s]:%i Invalid P1 parameter: %{public}@", v119, v116, v117, 3613, v118);

      }
      v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v121 = NFSharedLogGetLogger(v120);
      v44 = objc_claimAutoreleasedReturnValue(v121);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        goto LABEL_69;
      v122 = object_getClass(self);
      if (class_isMetaClass(v122))
        v123 = 43;
      else
        v123 = 45;
      v124 = object_getClassName(self);
      v125 = sel_getName(a2);
      v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
      *(_DWORD *)buf = 67110146;
      v148 = v123;
      v149 = 2082;
      v150 = v124;
      v151 = 2082;
      v152 = v125;
      v153 = 1024;
      v154 = 3613;
      v155 = 2114;
      v156 = v49;
      v50 = "%c[%{public}s %{public}s]:%i Invalid P1 parameter: %{public}@";
    }
LABEL_67:
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v50, buf, 0x2Cu);
LABEL_68:

LABEL_69:
    v15 = 10;
    goto LABEL_91;
  }
  v11 = objc_msgSend(v7, "clss");
  if ((v10 & 0x40) != 0)
    v12 = 32;
  else
    v12 = 12;
  if ((v11 & v12) != 0
    || objc_msgSend(v7, "instruction") != 164
    || objc_msgSend(v7, "p1") != 4)
  {
    goto LABEL_90;
  }
  if (a4)
    *a4 = (objc_msgSend(v7, "p2") & 0xC) == 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload"));
  v14 = -[_NFReaderSession validateAID:allowsPrefixMatch:](self, "validateAID:allowsPrefixMatch:", v13, 0);

  v15 = 0;
  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFLogGetLogger(v16);
    if (v17)
    {
      v18 = (void (*)(uint64_t, const char *, ...))v17;
      v19 = object_getClass(self);
      v20 = class_isMetaClass(v19);
      v21 = object_getClassName(self);
      v22 = sel_getName(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
      v24 = 45;
      if (v20)
        v24 = 43;
      v18(3, "%c[%{public}s %{public}s]:%i Invalid AID selection: %{public}@", v24, v21, v22, 3666, v23);

    }
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFSharedLogGetLogger(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
      *(_DWORD *)buf = 67110146;
      v148 = v29;
      v149 = 2082;
      v150 = v30;
      v151 = 2082;
      v152 = v31;
      v153 = 1024;
      v154 = 3666;
      v155 = 2114;
      v156 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AID selection: %{public}@", buf, 0x2Cu);

    }
    v15 = 32;
  }
LABEL_91:

  return v15;
}

- (BOOL)_findAppFromSet:(id)a3 tag:(id)a4 foundApp:(id *)a5 outError:(id *)a6
{
  id v11;
  id v12;
  _BOOL4 v13;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;
  id v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  NSMutableArray *nonstandard7816TagsFound;
  void *v36;
  NSObject *v37;
  void *specific;
  uint64_t Logger;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  void *v66;
  const char *Name;
  id *v68;
  const char *sel;
  id *v70;
  id obj;
  uint64_t v72;
  const char *v73;
  _NFReaderSession *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  int v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  void *v94;
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _BYTE v99[128];

  v11 = a3;
  v12 = a4;
  if (!objc_msgSend(v11, "count")
    || objc_msgSend(v12, "type") == 14
    || objc_msgSend(v12, "type") == 13
    || objc_msgSend(v12, "type") == 9)
  {
    LOBYTE(v13) = 0;
    goto LABEL_6;
  }
  sel = a2;
  v70 = a6;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
  v13 = v15 != 0;
  v74 = self;
  if (!v15)
  {
    v23 = 0;
LABEL_34:

    goto LABEL_40;
  }
  v16 = v15;
  v68 = a5;
  v17 = 0;
  v72 = *(_QWORD *)v82;
LABEL_9:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v82 != v72)
      objc_enumerationMutation(obj);
    v19 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v18);
    if (objc_msgSend(v19, "type") == (id)2)
      break;
    if (objc_msgSend(v19, "type") == (id)3)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "aid"));
      v77 = 0;
      v78 = v17;
      v25 = -[_NFReaderSession selectPRCIDApp:fromTag:resolvedAid:outError:](self, "selectPRCIDApp:fromTag:resolvedAid:outError:", v24, v12, &v78, &v77);
      v22 = v78;

      v23 = v77;
      if (v25)
      {
        nonstandard7816TagsFound = v74->_nonstandard7816TagsFound;
        v95[0] = CFSTR("type");
        v95[1] = CFSTR("uid");
        v96[0] = &off_100301250;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UID"));
        v96[1] = v34;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v96, v95, 2));
        -[NSMutableArray addObject:](nonstandard7816TagsFound, "addObject:", v36);

        goto LABEL_38;
      }
      goto LABEL_17;
    }
    if (objc_msgSend(v19, "type") == (id)1)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "aid"));
      v75 = 0;
      v76 = v17;
      v27 = -[_NFReaderSession _selectFromTag:aid:resolvedAid:error:](self, "_selectFromTag:aid:resolvedAid:error:", v12, v26, &v76, &v75);
      v22 = v76;

      v23 = v75;
      if (v27 && !v23)
      {
        v13 = 1;
        goto LABEL_32;
      }

      if ((v27 & 1) != 0)
      {
        a5 = v68;
        goto LABEL_34;
      }
      v17 = 0;
      goto LABEL_18;
    }
    v23 = 0;
LABEL_19:
    if (-[NSObject code](v23, "code") == (id)51 || -[NSObject code](v23, "code") == (id)64)
      goto LABEL_31;

    if (v16 == (id)++v18)
    {
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
      v16 = v28;
      if (!v28)
      {
        v23 = 0;
LABEL_31:
        v13 = 0;
        v22 = v17;
LABEL_32:
        a5 = v68;
        goto LABEL_39;
      }
      goto LABEL_9;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "aid"));
  v79 = 0;
  v80 = v17;
  v21 = -[_NFReaderSession selectPaceApp:fromTag:resolvedAid:outError:](self, "selectPaceApp:fromTag:resolvedAid:outError:", v20, v12, &v80, &v79);
  v22 = v80;

  v23 = v79;
  if (!v21)
  {
LABEL_17:
    v17 = v22;
LABEL_18:
    self = v74;
    goto LABEL_19;
  }
  v29 = v74->_nonstandard7816TagsFound;
  v98[0] = &off_100301238;
  v97[0] = CFSTR("type");
  v97[1] = CFSTR("uid");
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UID"));
  v98[1] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v98, v97, 2));
  -[NSMutableArray addObject:](v29, "addObject:", v31);

  v32 = sub_100226308((uint64_t)NFTagReadCALogger);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)v33;
  if (v33)
    *(_BYTE *)(v33 + 156) = 1;
LABEL_38:
  a5 = v68;

  v13 = 1;
LABEL_39:

  v37 = v23;
  if (v22)
    goto LABEL_52;
LABEL_40:
  if (-[NSObject code](v23, "code") == (id)28)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v40 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v74);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v74);
      Name = sel_getName(sel);
      v44 = 45;
      if (isMetaClass)
        v44 = 43;
      v40(6, "%c[%{public}s %{public}s]:%i Application(s) not found", v44, ClassName, Name, 3723);
    }
    v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v46 = NFSharedLogGetLogger(v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = object_getClass(v74);
      if (class_isMetaClass(v48))
        v49 = 43;
      else
        v49 = 45;
      v50 = object_getClassName(v74);
      v51 = sel_getName(sel);
      *(_DWORD *)buf = 67109890;
      v86 = v49;
      v87 = 2082;
      v88 = v50;
      v89 = 2082;
      v90 = v51;
      v91 = 1024;
      v92 = 3723;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Application(s) not found", buf, 0x22u);
    }

    v22 = 0;
    v37 = 0;
    goto LABEL_63;
  }
  v22 = 0;
  v37 = v23;
LABEL_52:
  if (v13)
  {
    v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v53 = NFLogGetLogger(v52);
    if (v53)
    {
      v54 = (void (*)(uint64_t, const char *, ...))v53;
      v55 = object_getClass(v74);
      v56 = class_isMetaClass(v55);
      v73 = object_getClassName(v74);
      v57 = sel_getName(sel);
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "NF_asHexString"));
      v59 = 45;
      if (v56)
        v59 = 43;
      v54(6, "%c[%{public}s %{public}s]:%i Found app: %{public}@", v59, v73, v57, 3726, v58);

    }
    v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v61 = NFSharedLogGetLogger(v60);
    v23 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v62 = object_getClass(v74);
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(v74);
      v65 = sel_getName(sel);
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "NF_asHexString"));
      *(_DWORD *)buf = 67110146;
      v86 = v63;
      v87 = 2082;
      v88 = v64;
      v89 = 2082;
      v90 = v65;
      v91 = 1024;
      v92 = 3726;
      v93 = 2114;
      v94 = v66;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found app: %{public}@", buf, 0x2Cu);

    }
    LOBYTE(v13) = 1;
LABEL_63:

  }
  if (v70)
    *v70 = objc_retainAutorelease(v37);
  if (a5)
    *a5 = objc_retainAutorelease(v22);

LABEL_6:
  return v13;
}

- (unsigned)_validateISO15693Packet:(id)a3
{
  id v5;
  char *v6;
  unsigned int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  objc_class *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  objc_class *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  _BOOL4 v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  objc_class *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  _BOOL4 v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  objc_class *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  objc_class *v72;
  int v73;
  void *specific;
  uint64_t Logger;
  void (*v76)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  objc_class *v82;
  int v83;
  void *v84;
  unsigned int v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  objc_class *v95;
  int v96;
  NSObject *v97;
  uint32_t v98;
  void *v99;
  uint64_t v100;
  void (*v101)(uint64_t, const char *, ...);
  objc_class *v102;
  _BOOL4 v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  objc_class *v107;
  int v108;
  void *v109;
  uint64_t v110;
  void (*v111)(uint64_t, const char *, ...);
  objc_class *v112;
  _BOOL4 v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  objc_class *v117;
  int v118;
  void *v119;
  uint64_t v120;
  void (*v121)(uint64_t, const char *, ...);
  objc_class *v122;
  _BOOL4 v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  objc_class *v127;
  int v128;
  void *v129;
  unsigned int v130;
  void *v131;
  uint64_t v132;
  void (*v133)(uint64_t, const char *, ...);
  objc_class *v134;
  _BOOL4 v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  NSObject *v139;
  objc_class *v140;
  int v141;
  void *v142;
  void *v143;
  unsigned __int8 v144;
  void *v145;
  uint64_t v146;
  void (*v147)(uint64_t, const char *, ...);
  objc_class *v148;
  _BOOL4 v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  NSObject *v154;
  objc_class *v155;
  int v156;
  const char *v158;
  const char *v159;
  const char *v160;
  const char *v161;
  const char *v162;
  const char *v163;
  const char *ClassName;
  const char *v165;
  const char *v166;
  const char *v167;
  const char *v168;
  const char *v169;
  const char *v170;
  const char *v171;
  const char *v172;
  const char *v173;
  const char *v174;
  const char *Name;
  const char *v176;
  const char *v177;
  const char *v178;
  const char *v179;
  const char *v180;
  const char *v181;
  uint8_t buf[4];
  int v183;
  __int16 v184;
  const char *v185;
  __int16 v186;
  const char *v187;
  __int16 v188;
  int v189;
  __int16 v190;
  _BYTE v191[18];

  v5 = objc_retainAutorelease(a3);
  v6 = (char *)objc_msgSend(v5, "bytes");
  if ((unint64_t)objc_msgSend(v5, "length") < 2)
  {
LABEL_2:
    v7 = 0;
    goto LABEL_146;
  }
  v8 = *v6;
  v9 = v6[1];
  v10 = v6[2];
  v11 = 8 * ((*v6 & 0x24) == 32);
  switch(v6[1])
  {
    case 1:
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
      v85 = objc_msgSend(v84, "nfcISO15693ReaderAccess");

      if (v85)
        v7 = 0;
      else
        v7 = 32;
      goto LABEL_146;
    case 2:
    case 37:
      if (objc_msgSend(v5, "length") == (id)10)
        goto LABEL_132;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v76 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v79 = 45;
        if (isMetaClass)
          v79 = 43;
        v76(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v79, ClassName, Name, 3801, v5);
      }
      v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v81 = NFSharedLogGetLogger(v80);
      v20 = objc_claimAutoreleasedReturnValue(v81);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v82 = object_getClass(self);
      if (class_isMetaClass(v82))
        v83 = 43;
      else
        v83 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v83;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3801;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 32:
    case 34:
    case 39:
    case 41:
      if (objc_msgSend(v5, "length") == (id)(v11 | 3))
        goto LABEL_132;
      v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v35 = NFLogGetLogger(v34);
      if (v35)
      {
        v36 = (void (*)(uint64_t, const char *, ...))v35;
        v37 = object_getClass(self);
        v38 = class_isMetaClass(v37);
        v160 = object_getClassName(self);
        v171 = sel_getName(a2);
        v39 = 45;
        if (v38)
          v39 = 43;
        v36(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v39, v160, v171, 3835, v5);
      }
      v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v41 = NFSharedLogGetLogger(v40);
      v20 = objc_claimAutoreleasedReturnValue(v41);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v42 = object_getClass(self);
      if (class_isMetaClass(v42))
        v43 = 43;
      else
        v43 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v43;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3835;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 33:
    case 53:
    case 54:
    case 57:
      if ((unint64_t)objc_msgSend(v5, "length") >= (v11 | 3uLL))
        goto LABEL_132;
      v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v45 = NFLogGetLogger(v44);
      if (v45)
      {
        v46 = (void (*)(uint64_t, const char *, ...))v45;
        v47 = object_getClass(self);
        v48 = class_isMetaClass(v47);
        v161 = object_getClassName(self);
        v172 = sel_getName(a2);
        v49 = 45;
        if (v48)
          v49 = 43;
        v46(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v49, v161, v172, 3847, v5);
      }
      v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v51 = NFSharedLogGetLogger(v50);
      v20 = objc_claimAutoreleasedReturnValue(v51);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v52 = object_getClass(self);
      if (class_isMetaClass(v52))
        v53 = 43;
      else
        v53 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v53;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3847;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 35:
    case 44:
    case 45:
    case 48:
    case 50:
      if (objc_msgSend(v5, "length") == (id)(v11 | 4))
        goto LABEL_132;
      v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v13 = NFLogGetLogger(v12);
      if (v13)
      {
        v14 = (void (*)(uint64_t, const char *, ...))v13;
        v15 = object_getClass(self);
        v16 = class_isMetaClass(v15);
        v158 = object_getClassName(self);
        v169 = sel_getName(a2);
        v17 = 45;
        if (v16)
          v17 = 43;
        v14(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v17, v158, v169, 3860, v5);
      }
      v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v19 = NFSharedLogGetLogger(v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v22;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3860;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 36:
    case 49:
    case 56:
      if ((unint64_t)objc_msgSend(v5, "length") >= (v11 | 4uLL))
        goto LABEL_132;
      v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v55 = NFLogGetLogger(v54);
      if (v55)
      {
        v56 = (void (*)(uint64_t, const char *, ...))v55;
        v57 = object_getClass(self);
        v58 = class_isMetaClass(v57);
        v162 = object_getClassName(self);
        v173 = sel_getName(a2);
        v59 = 45;
        if (v58)
          v59 = 43;
        v56(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v59, v162, v173, 3871, v5);
      }
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = NFSharedLogGetLogger(v60);
      v20 = objc_claimAutoreleasedReturnValue(v61);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v62 = object_getClass(self);
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v63;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3871;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 38:
    case 40:
    case 42:
    case 43:
    case 58:
      if (objc_msgSend(v5, "length") == (id)(v11 | 2))
        goto LABEL_132;
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFLogGetLogger(v24);
      if (v25)
      {
        v26 = (void (*)(uint64_t, const char *, ...))v25;
        v27 = object_getClass(self);
        v28 = class_isMetaClass(v27);
        v159 = object_getClassName(self);
        v170 = sel_getName(a2);
        v29 = 45;
        if (v28)
          v29 = 43;
        v26(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v29, v159, v170, 3814, v5);
      }
      v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v31 = NFSharedLogGetLogger(v30);
      v20 = objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v32 = object_getClass(self);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v33;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3814;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 51:
    case 60:
    case 61:
      if (objc_msgSend(v5, "length") == (id)(v11 | 6))
        goto LABEL_132;
      v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v65 = NFLogGetLogger(v64);
      if (v65)
      {
        v66 = (void (*)(uint64_t, const char *, ...))v65;
        v67 = object_getClass(self);
        v68 = class_isMetaClass(v67);
        v163 = object_getClassName(self);
        v174 = sel_getName(a2);
        v69 = 45;
        if (v68)
          v69 = 43;
        v66(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v69, v163, v174, 3882, v5);
      }
      v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v71 = NFSharedLogGetLogger(v70);
      v20 = objc_claimAutoreleasedReturnValue(v71);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v72 = object_getClass(self);
      if (class_isMetaClass(v72))
        v73 = 43;
      else
        v73 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v73;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3882;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 52:
      if ((unint64_t)objc_msgSend(v5, "length") >= (v11 | 6uLL))
        goto LABEL_132;
      v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v100 = NFLogGetLogger(v99);
      if (v100)
      {
        v101 = (void (*)(uint64_t, const char *, ...))v100;
        v102 = object_getClass(self);
        v103 = class_isMetaClass(v102);
        v165 = object_getClassName(self);
        v177 = sel_getName(a2);
        v104 = 45;
        if (v103)
          v104 = 43;
        v101(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v104, v165, v177, 3891, v5);
      }
      v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v106 = NFSharedLogGetLogger(v105);
      v20 = objc_claimAutoreleasedReturnValue(v106);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v107 = object_getClass(self);
      if (class_isMetaClass(v107))
        v108 = 43;
      else
        v108 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v108;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3891;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 55:
      if ((unint64_t)objc_msgSend(v5, "length") >= (v11 | 2uLL))
        goto LABEL_132;
      v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v110 = NFLogGetLogger(v109);
      if (v110)
      {
        v111 = (void (*)(uint64_t, const char *, ...))v110;
        v112 = object_getClass(self);
        v113 = class_isMetaClass(v112);
        v166 = object_getClassName(self);
        v178 = sel_getName(a2);
        v114 = 45;
        if (v113)
          v114 = 43;
        v111(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v114, v166, v178, 3823, v5);
      }
      v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v116 = NFSharedLogGetLogger(v115);
      v20 = objc_claimAutoreleasedReturnValue(v116);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v117 = object_getClass(self);
      if (class_isMetaClass(v117))
        v118 = 43;
      else
        v118 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v118;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3823;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 59:
      if (objc_msgSend(v5, "length") == (id)(v11 | 3) || objc_msgSend(v5, "length") == (id)(v11 | 4))
        goto LABEL_132;
      v119 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v120 = NFLogGetLogger(v119);
      if (v120)
      {
        v121 = (void (*)(uint64_t, const char *, ...))v120;
        v122 = object_getClass(self);
        v123 = class_isMetaClass(v122);
        v167 = object_getClassName(self);
        v179 = sel_getName(a2);
        v124 = 45;
        if (v123)
          v124 = 43;
        v121(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v124, v167, v179, 3906, v5);
      }
      v125 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v126 = NFSharedLogGetLogger(v125);
      v20 = objc_claimAutoreleasedReturnValue(v126);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_145;
      v127 = object_getClass(self);
      if (class_isMetaClass(v127))
        v128 = 43;
      else
        v128 = 45;
      *(_DWORD *)buf = 67110146;
      v183 = v128;
      v184 = 2082;
      v185 = object_getClassName(self);
      v186 = 2082;
      v187 = sel_getName(a2);
      v188 = 1024;
      v189 = 3906;
      v190 = 2114;
      *(_QWORD *)v191 = v5;
      v23 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
LABEL_118:
      v97 = v20;
      v98 = 44;
      goto LABEL_119;
    default:
      if ((v9 + 32) <= 0xBFu)
      {
        v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v87 = NFLogGetLogger(v86);
        if (v87)
        {
          v88 = (void (*)(uint64_t, const char *, ...))v87;
          v89 = object_getClass(self);
          v90 = class_isMetaClass(v89);
          v91 = object_getClassName(self);
          v176 = sel_getName(a2);
          v92 = 45;
          if (v90)
            v92 = 43;
          v88(3, "%c[%{public}s %{public}s]:%i Invalid custom command code: 0x%X ,packet: %{public}@", v92, v91, v176, 3914, v9, v5);
        }
        v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v94 = NFSharedLogGetLogger(v93);
        v20 = objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v95 = object_getClass(self);
          if (class_isMetaClass(v95))
            v96 = 43;
          else
            v96 = 45;
          *(_DWORD *)buf = 67110402;
          v183 = v96;
          v184 = 2082;
          v185 = object_getClassName(self);
          v186 = 2082;
          v187 = sel_getName(a2);
          v188 = 1024;
          v189 = 3914;
          v190 = 1024;
          *(_DWORD *)v191 = v9;
          *(_WORD *)&v191[4] = 2114;
          *(_QWORD *)&v191[6] = v5;
          v23 = "%c[%{public}s %{public}s]:%i Invalid custom command code: 0x%X ,packet: %{public}@";
          v97 = v20;
          v98 = 50;
LABEL_119:
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, v23, buf, v98);
        }
LABEL_145:

        v7 = 10;
        goto LABEL_146;
      }
      if ((id)-[_NFReaderSession sessionType](self, "sessionType") != (id)1
        || (v129 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker")),
            v130 = objc_msgSend(v129, "validateISO15693TagAccessWithManufacturerCode:", v10),
            v129,
            !v130))
      {
LABEL_132:
        if ((v8 & 0x20) == 0)
          goto LABEL_2;
        v20 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v6 + 2, 8);
        v142 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession currentTag](self, "currentTag"));
        v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "tagID"));
        v144 = objc_msgSend(v143, "isEqual:", v20);

        if ((v144 & 1) != 0)
        {

          goto LABEL_2;
        }
        v145 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v146 = NFLogGetLogger(v145);
        if (v146)
        {
          v147 = (void (*)(uint64_t, const char *, ...))v146;
          v148 = object_getClass(self);
          v149 = class_isMetaClass(v148);
          v150 = object_getClassName(self);
          v181 = sel_getName(a2);
          v151 = 45;
          if (v149)
            v151 = 43;
          v147(3, "%c[%{public}s %{public}s]:%i Invalid tag ID: %{public}@, packet: %{public}@", v151, v150, v181, 3926, v20, v5);
        }
        v152 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v153 = NFSharedLogGetLogger(v152);
        v154 = objc_claimAutoreleasedReturnValue(v153);
        if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
        {
          v155 = object_getClass(self);
          if (class_isMetaClass(v155))
            v156 = 43;
          else
            v156 = 45;
          *(_DWORD *)buf = 67110402;
          v183 = v156;
          v184 = 2082;
          v185 = object_getClassName(self);
          v186 = 2082;
          v187 = sel_getName(a2);
          v188 = 1024;
          v189 = 3926;
          v190 = 2114;
          *(_QWORD *)v191 = v20;
          *(_WORD *)&v191[8] = 2114;
          *(_QWORD *)&v191[10] = v5;
          _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag ID: %{public}@, packet: %{public}@", buf, 0x36u);
        }

        goto LABEL_145;
      }
      v131 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v132 = NFLogGetLogger(v131);
      if (v132)
      {
        v133 = (void (*)(uint64_t, const char *, ...))v132;
        v134 = object_getClass(self);
        v135 = class_isMetaClass(v134);
        v168 = object_getClassName(self);
        v180 = sel_getName(a2);
        v136 = 45;
        if (v135)
          v136 = 43;
        v133(3, "%c[%{public}s %{public}s]:%i Invalid manufacturer code, packet: %{public}@", v136, v168, v180, 3917, v5);
      }
      v137 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v138 = NFSharedLogGetLogger(v137);
      v139 = objc_claimAutoreleasedReturnValue(v138);
      if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      {
        v140 = object_getClass(self);
        if (class_isMetaClass(v140))
          v141 = 43;
        else
          v141 = 45;
        *(_DWORD *)buf = 67110146;
        v183 = v141;
        v184 = 2082;
        v185 = object_getClassName(self);
        v186 = 2082;
        v187 = sel_getName(a2);
        v188 = 1024;
        v189 = 3917;
        v190 = 2114;
        *(_QWORD *)v191 = v5;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid manufacturer code, packet: %{public}@", buf, 0x2Cu);
      }

      v7 = 32;
LABEL_146:

      return v7;
  }
}

- (BOOL)_mifareCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  BOOL v18;
  int v19;
  void *v21;
  id v23;
  char v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
  if (!v5 || (v6 = v5, v7 = sub_10017E9A4(v5, v4, 0), v6, !v7))
  {
    v24 = 96;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
      v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v24, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
      objc_msgSend(v11, "sessionTimeLimit");
      v23 = 0;
      v13 = sub_1001847DC(v9, v10, v4, &v23, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = v23;

      if (v15 || !objc_msgSend(v14, "length"))
        goto LABEL_22;
      v16 = objc_retainAutorelease(v14);
      v17 = *(unsigned __int8 *)objc_msgSend(v16, "bytes");
      if (v17 != 175)
        break;
      v24 = -81;

    }
    v8 = 1;
    if (v17 <= 125)
    {
      v18 = v17 > 0x1E;
      v19 = (1 << v17) & 0x40001901;
      if (!v18 && v19 != 0)
        goto LABEL_23;
LABEL_22:
      v8 = 0;
      goto LABEL_23;
    }
    if (v17 > 201)
    {
      if (v17 != 202 && v17 != 238)
        goto LABEL_22;
    }
    else if (v17 != 126 && v17 != 144)
    {
      goto LABEL_22;
    }
LABEL_23:

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
    sub_10017EF78(v21, v4, 0);

    goto LABEL_24;
  }
  v8 = 0;
LABEL_24:

  return v8;
}

- (unsigned)_queryMifareType:(id)a3 outError:(id *)a4
{
  id v7;
  void *v8;
  unsigned int v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *Name;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v7 = a3;
  if (-[_NFReaderSession skipMifareClassification](self, "skipMifareClassification") || (self->_pollOption & 0x20) != 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v12(6, "%c[%{public}s %{public}s]:%i Skipping mifare classification", v16, ClassName, Name, 3975);
    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      *(_DWORD *)buf = 67109890;
      v25 = v21;
      v26 = 2082;
      v27 = object_getClassName(self);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 3975;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Skipping mifare classification", buf, 0x22u);
    }

    goto LABEL_16;
  }
  if (objc_msgSend(v7, "type") != 9 && objc_msgSend(v7, "type") != 3)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
  v9 = sub_1001801F8(v8, v7, (unint64_t)a4);

LABEL_17:
  return v9;
}

- (BOOL)_validateMifareAPDU:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NFCommandAPDU), "initWithData:", v7);

  if (v8
    && objc_msgSend(v8, "clss") != 144
    && objc_msgSend(v8, "instruction") == 164
    && objc_msgSend(v8, "p1") == 4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payload"));
    v10 = -[_NFReaderSession validateAID:withSelectResponse:outRealAid:](self, "validateAID:withSelectResponse:outRealAid:", v9, v6, 0);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)_requiresMifareUpdate:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_msgSend(v4, "type") == 3 || objc_msgSend(v4, "type") == 9)
    && !self->_skipMifareClassification;

  return v5;
}

- (BOOL)_updateMifareTagInfo:(id)a3 outError:(id *)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  BOOL v23;
  const char *ClassName;
  const char *Name;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;

  v7 = a3;
  if (-[_NFReaderSession _requiresMifareUpdate:](self, "_requiresMifareUpdate:", v7))
  {
    v27 = 0;
    v8 = -[_NFReaderSession _queryMifareType:outError:](self, "_queryMifareType:outError:", v7, &v27);
    v9 = v27;
    if ((v8 - 13) <= 3)
    {
      objc_msgSend(v7, "_setType:", v8);
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v15 = 45;
        if (isMetaClass)
          v15 = 43;
        v12(6, "%c[%{public}s %{public}s]:%i Resetting tag to %{public}@", v15, ClassName, Name, 4025, v7);
      }
      v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v17 = NFSharedLogGetLogger(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = object_getClass(self);
        if (class_isMetaClass(v19))
          v20 = 43;
        else
          v20 = 45;
        v21 = object_getClassName(self);
        v22 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v29 = v20;
        v30 = 2082;
        v31 = v21;
        v32 = 2082;
        v33 = v22;
        v34 = 1024;
        v35 = 4025;
        v36 = 2114;
        v37 = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting tag to %{public}@", buf, 0x2Cu);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    v23 = objc_msgSend(v9, "code") != (id)51 && objc_msgSend(v9, "code") != (id)64;

  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 312, 1);
}

- (void)setDriverWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter
{
  return (NFSystemPowerConsumptionMonitor *)objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
}

- (void)setPowerConsumptionReporter:(id)a3
{
  objc_storeWeak((id *)&self->_powerConsumptionReporter, a3);
}

- (id)uiInvalidationHandler
{
  return self->_uiInvalidationHandler;
}

- (NSMutableArray)feliCaSystemCodeList
{
  return self->_feliCaSystemCodeList;
}

- (void)setFeliCaSystemCodeList:(id)a3
{
  objc_storeStrong((id *)&self->_feliCaSystemCodeList, a3);
}

- (NSMutableOrderedSet)iso7816AppList
{
  return self->_iso7816AppList;
}

- (void)setIso7816AppList:(id)a3
{
  objc_storeStrong((id *)&self->_iso7816AppList, a3);
}

- (NFTag)currentTag
{
  return self->_currentTag;
}

- (void)setCurrentTag:(id)a3
{
  objc_storeStrong((id *)&self->_currentTag, a3);
}

- (unint64_t)sessionConfig
{
  return self->_sessionConfig;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (BOOL)skipMifareClassification
{
  return self->_skipMifareClassification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTag, 0);
  objc_storeStrong((id *)&self->_iso7816AppList, 0);
  objc_storeStrong((id *)&self->_feliCaSystemCodeList, 0);
  objc_destroyWeak((id *)&self->_powerConsumptionReporter);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_nonstandard7816TagsFound, 0);
  objc_storeStrong((id *)&self->_initialScanText, 0);
  objc_storeStrong(&self->_uiInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_uiService, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_tagWhiteList, 0);
}

- (id)_readFromTag:(id)a3 offset:(unsigned __int16)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  id v33;
  int v34;
  char v35;
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];

  v35 = 0;
  v34 = 45056;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v34, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession driverWrapper](self, "driverWrapper"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession whitelistChecker](self, "whitelistChecker"));
  objc_msgSend(v11, "sessionTimeLimit");
  v33 = 0;
  v13 = sub_1001847DC(v10, v9, v8, &v33, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = v33;
  if (a5 && !v14)
  {
    if (v15)
    {
      v16 = objc_msgSend(v15, "code");
      v17 = objc_alloc((Class)NSError);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v16 == (id)64)
      {
        v19 = objc_msgSend(v15, "code");
        v40[0] = NSLocalizedDescriptionKey;
        v32 = (uint64_t)v19;
        if ((uint64_t)objc_msgSend(v15, "code") > 70)
          v20 = 71;
        else
          v20 = (uint64_t)objc_msgSend(v15, "code");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EB248[v20]));
        v41[0] = v21;
        v41[1] = v15;
        v40[1] = NSUnderlyingErrorKey;
        v40[2] = CFSTR("Line");
        v41[2] = &off_100302EE8;
        v40[3] = CFSTR("Method");
        v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v41[3] = v22;
        v40[4] = NSDebugDescriptionErrorKey;
        v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 112);
        v41[4] = v23;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 5));
        v28 = v17;
        v29 = v18;
        v30 = v32;
        goto LABEL_12;
      }
      v38[0] = NSLocalizedDescriptionKey;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v39[0] = v21;
      v39[1] = v15;
      v38[1] = NSUnderlyingErrorKey;
      v38[2] = CFSTR("Line");
      v39[2] = &off_100302F00;
      v38[3] = CFSTR("Method");
      v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v39[3] = v22;
      v38[4] = NSDebugDescriptionErrorKey;
      v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 114);
      v39[4] = v23;
      v24 = v39;
      v25 = v38;
      v26 = 5;
    }
    else
    {
      v17 = objc_alloc((Class)NSError);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v36[0] = NSLocalizedDescriptionKey;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Error"));
      v37[0] = v21;
      v37[1] = &off_100302F18;
      v36[1] = CFSTR("Line");
      v36[2] = CFSTR("Method");
      v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v37[2] = v22;
      v36[3] = NSDebugDescriptionErrorKey;
      v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 117);
      v37[3] = v23;
      v24 = v37;
      v25 = v36;
      v26 = 4;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v25, v26));
    v28 = v17;
    v29 = v18;
    v30 = 29;
LABEL_12:
    *a5 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, v30, v27);

  }
  return v14;
}

- (BOOL)_selectMFFromTag:(id)a3 outError:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  const char *Name;
  id v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A9C5, 2);
  v28 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _selectTag:aid:p1:p2:shortLe:error:](self, "_selectTag:aid:p1:p2:shortLe:error:", v7, v8, 0, 12, 0xFFFFFFFFLL, &v28));

  v10 = v28;
  if (v10 || (sub_1001F4F14(v9) & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v14(4, "%c[%{public}s %{public}s]:%i SELECT MF failed", v18, ClassName, Name, 131);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v30 = v23;
      v31 = 2082;
      v32 = v24;
      v33 = 2082;
      v34 = v25;
      v35 = 1024;
      v36 = 131;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SELECT MF failed", buf, 0x22u);
    }

    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)_selectEF:(unsigned __int16)a3 tag:(id)a4 outError:(id *)a5
{
  return -[_NFReaderSession _selectEF:p2:tag:outResponse:outError:](self, "_selectEF:p2:tag:outResponse:outError:", a3, 12, a4, 0, a5);
}

- (BOOL)_selectEF:(unsigned __int16)a3 p2:(unsigned __int8)a4 tag:(id)a5 outResponse:(id *)a6 outError:(id *)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  BOOL v17;
  void *specific;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  const char *ClassName;
  const char *Name;
  id v35;
  __int16 v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;

  v9 = a4;
  v10 = a3;
  v12 = a5;
  v36 = __rev16(v10);
  v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v36, 2);
  v35 = 0;
  if ((_DWORD)v9 == 12)
    v14 = 0xFFFFFFFFLL;
  else
    v14 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _selectTag:aid:p1:p2:shortLe:error:](self, "_selectTag:aid:p1:p2:shortLe:error:", v12, v13, 2, v9, v14, &v35));

  v16 = v35;
  if (a6)
    *a6 = objc_retainAutorelease(v15);
  if (v16 || (sub_1001F4F14(v15) & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v23 = 45;
      if (isMetaClass)
        v23 = 43;
      v20(4, "%c[%{public}s %{public}s]:%i SELECT EF(0x%x) failed", v23, ClassName, Name, 157, v10);
    }
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFSharedLogGetLogger(v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      v29 = object_getClassName(self);
      v30 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v38 = v28;
      v39 = 2082;
      v40 = v29;
      v41 = 2082;
      v42 = v30;
      v43 = 1024;
      v44 = 157;
      v45 = 1024;
      v46 = v10;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SELECT EF(0x%x) failed", buf, 0x28u);
    }

    v17 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v16);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)_readEFCardAccessFromTag:(id)a3 buffer:(id)a4 outError:(id *)a5
{
  id v9;
  id v10;
  unsigned int v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  unint64_t j;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  unsigned __int8 *v32;
  void *v33;
  char *v34;
  unsigned int v35;
  unsigned __int16 v36;
  id v37;
  void *v38;
  void *v39;
  char *v40;
  unint64_t v41;
  id v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  const char *v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  void *v75;
  uint64_t v76;
  NSObject *v77;
  const char *Name;
  const char *v79;
  void *v80;
  void *v81;
  id v82;
  id *v83;
  const char *sel;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  _BYTE v93[14];
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;

  v9 = a3;
  v10 = a4;
  v87 = 0;
  v11 = -[_NFReaderSession _selectEF:p2:tag:outResponse:outError:](self, "_selectEF:p2:tag:outResponse:outError:", 284, 0, v9, &v87, a5);
  v12 = v87;
  v13 = 0;
  if (v11)
  {
    sel = a2;
    v85 = v12;
    v14 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithData:](NFTLV, "TLVWithData:", v14));
    v16 = v15;
    v83 = a5;
    if (v15
      && (objc_msgSend(v15, "tag") == 111 || objc_msgSend(v16, "tag") == 98)
      && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "children")),
          v18 = objc_msgSend(v17, "count"),
          v17,
          v18))
    {
      v81 = v14;
      v82 = v10;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v80 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "children"));
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v88, buf, 16);
      if (v20)
      {
        v21 = v20;
        j = 0;
        v23 = *(_QWORD *)v89;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v89 != v23)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v25, "tag") == 131)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value"));
              v27 = objc_msgSend(v26, "length");

              if (v27 == (id)2)
              {
                v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value")));
                objc_msgSend(v28, "bytes");

              }
            }
            if (objc_msgSend(v25, "tag") == 128)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value"));
              v30 = objc_msgSend(v29, "length");

              if (v30)
              {
                v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value")));
                v32 = (unsigned __int8 *)objc_msgSend(v31, "bytes");

                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value"));
                v34 = (char *)objc_msgSend(v33, "length");

                for (j = 0; v34; --v34)
                {
                  v35 = *v32++;
                  j = v35 | (j << 8);
                }
              }
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v88, buf, 16);
        }
        while (v21);
      }
      else
      {
        j = 0;
      }

      if (j)
      {
        v10 = v82;
        if (j >= 0x10000)
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
          if (Logger)
            Logger(3, "%s:%i File size > UINT16_MAX; apply limit",
              "-[_NFReaderSession(PACE) _readEFCardAccessFromTag:buffer:outError:]",
              180);
          v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v76 = NFSharedLogGetLogger(v75);
          v77 = objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)v93 = "-[_NFReaderSession(PACE) _readEFCardAccessFromTag:buffer:outError:]";
            *(_WORD *)&v93[8] = 1024;
            *(_DWORD *)&v93[10] = 180;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%{public}s:%i File size > UINT16_MAX; apply limit",
              buf,
              0x12u);
          }

          j = 0xFFFFLL;
        }
      }
      else
      {
        j = 1;
        v10 = v82;
      }
    }
    else
    {

      j = 1;
    }
    v36 = 0;
    v37 = 0;
    while (1)
    {
      v38 = v37;
      v86 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _readFromTag:offset:outError:](self, "_readFromTag:offset:outError:", v9, v36, &v86));
      v37 = v86;

      v13 = sub_1001F4F14(v39);
      if ((v13 & 1) == 0)
        break;
      v40 = (char *)objc_msgSend(v39, "length");
      v41 = (unint64_t)(v40 - 2);
      if (v40 == (char *)2)
      {
        v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v45 = NFLogGetLogger(v44);
        if (v45)
        {
          v46 = (void (*)(uint64_t, const char *, ...))v45;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(sel);
          v50 = 45;
          if (isMetaClass)
            v50 = 43;
          v46(4, "%c[%{public}s %{public}s]:%i error: missing data", v50, ClassName, Name, 195);
        }
        v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v52 = NFSharedLogGetLogger(v51);
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = object_getClass(self);
          if (class_isMetaClass(v54))
            v55 = 43;
          else
            v55 = 45;
          v56 = object_getClassName(self);
          v57 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v93 = v55;
          *(_WORD *)&v93[4] = 2082;
          *(_QWORD *)&v93[6] = v56;
          v94 = 2082;
          v95 = v57;
          v96 = 1024;
          v97 = 195;
          v58 = "%c[%{public}s %{public}s]:%i error: missing data";
LABEL_49:
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, v58, buf, 0x22u);
        }
LABEL_50:

        goto LABEL_51;
      }
      v42 = objc_retainAutorelease(v39);
      objc_msgSend(v10, "appendBytes:length:", objc_msgSend(v42, "bytes"), v41);
      v43 = j >= v41;
      j -= v41;
      if (!v43)
      {
        v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v60 = NFLogGetLogger(v59);
        if (v60)
        {
          v61 = (void (*)(uint64_t, const char *, ...))v60;
          v62 = object_getClass(self);
          v63 = class_isMetaClass(v62);
          v64 = object_getClassName(self);
          v79 = sel_getName(sel);
          v65 = 45;
          if (v63)
            v65 = 43;
          v61(4, "%c[%{public}s %{public}s]:%i Excess data returned from tag", v65, v64, v79, 200);
        }
        v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v67 = NFSharedLogGetLogger(v66);
        v53 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v68 = object_getClass(self);
          if (class_isMetaClass(v68))
            v69 = 43;
          else
            v69 = 45;
          v70 = object_getClassName(self);
          v71 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v93 = v69;
          *(_WORD *)&v93[4] = 2082;
          *(_QWORD *)&v93[6] = v70;
          v94 = 2082;
          v95 = v71;
          v96 = 1024;
          v97 = 200;
          v58 = "%c[%{public}s %{public}s]:%i Excess data returned from tag";
          goto LABEL_49;
        }
        goto LABEL_50;
      }
      v36 += v41;

      if (!j)
        goto LABEL_52;
    }
    if (v83)
      *v83 = objc_retainAutorelease(v37);
LABEL_51:

LABEL_52:
    v12 = v85;
  }

  return v13;
}

- (BOOL)isPaceSupported:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "NF_asHexString"));
  if (v3)
    v4 = +[NFATLMobileSettings findAID:filterType:](NFATLMobileSettings, "findAID:filterType:", v3, 3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)selectPaceApp:(id)a3 fromTag:(id)a4 resolvedAid:(id *)a5 outError:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  unsigned int v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  unsigned int v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  void (*v42)(uint64_t, const char *, ...);
  objc_class *v43;
  _BOOL4 v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  id *v54;
  void *v55;
  const char *v56;
  void *specific;
  uint64_t Logger;
  void (*v59)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
  id *v71;
  unsigned __int8 v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  void (*v78)(uint64_t, const char *, ...);
  objc_class *v79;
  _BOOL4 v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  objc_class *v87;
  int v88;
  const char *v89;
  const char *v90;
  const char *v92;
  const char *v93;
  const char *Name;
  const char *v95;
  uint64_t v96;
  id *v97;
  const char *sel;
  id v99;
  void *v100;
  id obj;
  void *v102;
  void *v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  id v115;
  id v116;
  id v117;
  _BYTE v118[128];
  uint8_t v119[128];
  uint8_t buf[4];
  int v121;
  __int16 v122;
  const char *v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  int v127;

  v11 = a3;
  v12 = a4;
  if (a5)
    *a5 = 0;
  v117 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _selectTag:aid:p1:p2:shortLe:error:](self, "_selectTag:aid:p1:p2:shortLe:error:", v12, v11, 4, 12, 0xFFFFFFFFLL, &v117));
  v14 = v117;
  v15 = v14;
  if (!v13 || v14)
    goto LABEL_45;
  v16 = sub_1001F6284(v13, 0);
  if (v16 == 27266)
  {
    v15 = 0;
    goto LABEL_48;
  }
  if (v16 == 36864)
  {
    v15 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
    LOBYTE(v54) = 1;
    goto LABEL_89;
  }
  v116 = 0;
  -[_NFReaderSession _selectMFFromTag:outError:](self, "_selectMFFromTag:outError:", v12, &v116);
  v17 = v116;
  v15 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "code") != (id)28)
    {
LABEL_45:
      if (a6)
      {
        v55 = v15;
LABEL_47:
        v15 = objc_retainAutorelease(v55);
        LOBYTE(v54) = 0;
        *a6 = v15;
        goto LABEL_89;
      }
LABEL_48:
      LOBYTE(v54) = 0;
      goto LABEL_89;
    }
  }
  v115 = v15;
  v18 = -[_NFReaderSession _selectEF:tag:outError:](self, "_selectEF:tag:outError:", 12032, v12, &v115);
  v19 = v115;

  if ((v18 & 1) == 0)
  {
    if (!a6)
    {
      LOBYTE(v54) = 0;
      v15 = v19;
      goto LABEL_89;
    }
    v55 = v19;
    goto LABEL_47;
  }
  v114 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _readFromTag:offset:outError:](self, "_readFromTag:offset:outError:", v12, 0, &v114));
  v15 = v114;

  v102 = v20;
  if (v15 || (sub_1001F4F14(v20) & 1) == 0)
  {
    v56 = a2;
    v54 = a6;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v59 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(v56);
      v63 = 45;
      if (isMetaClass)
        v63 = 43;
      v59(4, "%c[%{public}s %{public}s]:%i Read EF.DIR failed", v63, ClassName, Name, 255);
    }
    v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = NFSharedLogGetLogger(v64);
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v67 = object_getClass(self);
      if (class_isMetaClass(v67))
        v68 = 43;
      else
        v68 = 45;
      v69 = object_getClassName(self);
      v70 = sel_getName(v56);
      *(_DWORD *)buf = 67109890;
      v121 = v68;
      v122 = 2082;
      v123 = v69;
      v124 = 2082;
      v125 = v70;
      v126 = 1024;
      v127 = 255;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Read EF.DIR failed", buf, 0x22u);
    }

    if (v54)
    {
      v71 = v54;
      v15 = objc_retainAutorelease(v15);
      LOBYTE(v54) = 0;
      *v71 = v15;
    }
    v13 = v102;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subdataWithRange:", 0, (char *)objc_msgSend(v20, "length") - 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVsWithData:](NFTLV, "TLVsWithData:", v21));

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    obj = v22;
    v103 = v11;
    v23 = v20;
    v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
    if (v99)
    {
      v24 = *(_QWORD *)v111;
      v97 = a6;
      sel = a2;
      v96 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v99; i = (char *)i + 1)
        {
          if (*(_QWORD *)v111 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v26, "tag") == 97)
          {
            v100 = i;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "children"));
            v28 = objc_msgSend(v27, "count");

            i = v100;
            if (v28)
            {
              v108 = 0u;
              v109 = 0u;
              v106 = 0u;
              v107 = 0u;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "children"));
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v107;
                while (2)
                {
                  for (j = 0; j != v31; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v107 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)j);
                    if (objc_msgSend(v34, "tag") == 79)
                    {
                      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "value"));
                      v36 = objc_msgSend(v35, "length");

                      if (v36)
                      {
                        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "value"));
                        v38 = objc_msgSend(v103, "isEqualToData:", v37);

                        if (v38)
                        {

                          v105 = 0;
                          v72 = -[_NFReaderSession _selectEF:tag:outError:](self, "_selectEF:tag:outError:", 284, v12, &v105);
                          v73 = v105;
                          v15 = v73;
                          if ((v72 & 1) != 0)
                          {
                            v104 = v73;
                            v74 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _readFromTag:offset:outError:](self, "_readFromTag:offset:outError:", v12, 0, &v104));
                            v75 = v104;

                            v11 = v103;
                            if (v75 || (sub_1001F4F14(v74) & 1) == 0)
                            {
                              v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                              v77 = NFLogGetLogger(v76);
                              if (v77)
                              {
                                v78 = (void (*)(uint64_t, const char *, ...))v77;
                                v79 = object_getClass(self);
                                v80 = class_isMetaClass(v79);
                                v81 = v74;
                                v82 = object_getClassName(self);
                                v95 = sel_getName(sel);
                                v83 = 45;
                                if (v80)
                                  v83 = 43;
                                v92 = v82;
                                v74 = v81;
                                v78(4, "%c[%{public}s %{public}s]:%i Read EF.CardAccess failed", v83, v92, v95, 292);
                              }
                              v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                              v85 = NFSharedLogGetLogger(v84);
                              v86 = objc_claimAutoreleasedReturnValue(v85);
                              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                              {
                                v87 = object_getClass(self);
                                if (class_isMetaClass(v87))
                                  v88 = 43;
                                else
                                  v88 = 45;
                                v89 = object_getClassName(self);
                                v90 = sel_getName(sel);
                                *(_DWORD *)buf = 67109890;
                                v121 = v88;
                                v122 = 2082;
                                v123 = v89;
                                v124 = 2082;
                                v125 = v90;
                                v126 = 1024;
                                v127 = 292;
                                _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Read EF.CardAccess failed", buf, 0x22u);
                              }

                              if (v97)
                              {
                                v15 = objc_retainAutorelease(v75);
                                LOBYTE(v54) = 0;
                                *v97 = v15;
                              }
                              else
                              {
                                LOBYTE(v54) = 0;
                                v15 = v75;
                              }
                            }
                            else
                            {
                              v15 = 0;
                              if (a5)
                                *a5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A9C5, 2);
                              LOBYTE(v54) = 1;
                            }
                            v23 = v74;
                          }
                          else
                          {
                            v11 = v103;
                            if (v97)
                            {
                              v15 = objc_retainAutorelease(v73);
                              LOBYTE(v54) = 0;
                              *v97 = v15;
                            }
                            else
                            {
                              LOBYTE(v54) = 0;
                            }
                            v23 = v102;
                          }
                          goto LABEL_88;
                        }
                      }
                    }
                  }
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
                  if (v31)
                    continue;
                  break;
                }
              }

              a2 = sel;
              v24 = v96;
              i = v100;
            }
          }
        }
        v23 = v102;
        v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
      }
      while (v99);
    }
    v39 = a2;

    v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v41 = NFLogGetLogger(v40);
    if (v41)
    {
      v42 = (void (*)(uint64_t, const char *, ...))v41;
      v43 = object_getClass(self);
      v44 = class_isMetaClass(v43);
      v45 = object_getClassName(self);
      v93 = sel_getName(v39);
      v46 = 45;
      if (v44)
        v46 = 43;
      v42(4, "%c[%{public}s %{public}s]:%i Requested app not found in EF.DIR", v46, v45, v93, 279);
    }
    v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v48 = NFSharedLogGetLogger(v47);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = object_getClass(self);
      if (class_isMetaClass(v50))
        v51 = 43;
      else
        v51 = 45;
      v52 = object_getClassName(self);
      v53 = sel_getName(v39);
      *(_DWORD *)buf = 67109890;
      v121 = v51;
      v122 = 2082;
      v123 = v52;
      v124 = 2082;
      v125 = v53;
      v126 = 1024;
      v127 = 279;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Requested app not found in EF.DIR", buf, 0x22u);
    }

    v15 = 0;
    LOBYTE(v54) = 0;
    v11 = v103;
LABEL_88:

    v13 = v23;
  }
LABEL_89:

  return (char)v54;
}

- (BOOL)selectPaceApp:(id)a3 fromTag:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  uint64_t *v12;
  _NFReaderSession *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A9C5, 2);
  if (objc_msgSend(v9, "isEqualToData:", v10))
  {
    v23 = 0;
    v11 = (id *)&v23;
    v12 = &v23;
    v13 = self;
    v14 = v8;
    v15 = v9;
    v16 = 0;
  }
  else
  {
    v22 = 0;
    v11 = (id *)&v22;
    v12 = &v22;
    v13 = self;
    v14 = v8;
    v15 = v9;
    v16 = 4;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFReaderSession _selectTag:aid:p1:p2:shortLe:error:](v13, "_selectTag:aid:p1:p2:shortLe:error:", v14, v15, v16, 12, 0xFFFFFFFFLL, v12, v22, v23));

  v18 = *v11;
  v19 = v18;
  if (v17 && !v18 && (sub_1001F4F14(v17) & 1) != 0)
  {
    v20 = 1;
  }
  else
  {
    v20 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v19);
  }

  return v20;
}

- (id)detectPaceAppOnTag:(id)a3 appFound:(id *)a4
{
  id v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSMutableData *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *specific;
  uint64_t Logger;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  id v43;
  _BYTE *v44;
  const char *Name;
  id v47;
  NSMutableData *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  _QWORD v57[4];
  uint8_t buf[4];
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  _BYTE v66[128];

  v7 = a3;
  v55 = 0;
  v8 = -[_NFReaderSession _selectMFFromTag:outError:](self, "_selectMFFromTag:outError:", v7, &v55);
  v9 = v55;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    v28 = v9;
LABEL_16:
    v15 = v28;
    v27 = v28;
    goto LABEL_34;
  }
  v54 = v9;
  v11 = -[_NFReaderSession _selectEF:tag:outError:](self, "_selectEF:tag:outError:", 284, v7, &v54);
  v12 = v54;

  if ((v11 & 1) == 0)
  {
    v28 = v12;
    goto LABEL_16;
  }
  v13 = objc_opt_new(NSMutableData);
  v53 = v12;
  v14 = -[_NFReaderSession _readEFCardAccessFromTag:buffer:outError:](self, "_readEFCardAccessFromTag:buffer:outError:", v7, v13, &v53);
  v15 = v53;

  if ((v14 & 1) != 0)
  {
    v48 = v13;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[SecurityInfo securityInfoArrayFromData:](SecurityInfo, "securityInfoArrayFromData:", v13));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
          if (!objc_msgSend(v21, "type") || objc_msgSend(v21, "type") == (id)1)
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v31 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v35 = 45;
              if (isMetaClass)
                v35 = 43;
              v31(6, "%c[%{public}s %{public}s]:%i PACE tag found!", v35, ClassName, Name, 348);
            }
            v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v37 = NFSharedLogGetLogger(v36);
            v38 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = object_getClass(self);
              if (class_isMetaClass(v39))
                v40 = 43;
              else
                v40 = 45;
              v41 = object_getClassName(self);
              v42 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v59 = v40;
              v60 = 2082;
              v61 = v41;
              v62 = 2082;
              v63 = v42;
              v64 = 1024;
              v65 = 348;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE tag found!", buf, 0x22u);
            }

            v43 = sub_100226308((uint64_t)NFTagReadCALogger);
            v44 = (_BYTE *)objc_claimAutoreleasedReturnValue(v43);
            v13 = v48;
            if (v44)
              v44[156] = 1;

            v27 = 0;
            if (a4)
              *a4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A9C5, 2);
            v22 = v16;
            goto LABEL_32;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
        if (v18)
          continue;
        break;
      }
    }

    v47 = objc_alloc((Class)NSError);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v56[0] = NSLocalizedDescriptionKey;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Tag Not Found"));
    v57[0] = v23;
    v57[1] = &off_100302F30;
    v56[1] = CFSTR("Line");
    v56[2] = CFSTR("Method");
    v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v57[2] = v24;
    v56[3] = NSDebugDescriptionErrorKey;
    v25 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 356);
    v57[3] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 4));
    v27 = objc_msgSend(v47, "initWithDomain:code:userInfo:", v22, 28, v26);

    v13 = v48;
LABEL_32:

  }
  else
  {
    v27 = v15;
  }

LABEL_34:
  return v27;
}

@end
