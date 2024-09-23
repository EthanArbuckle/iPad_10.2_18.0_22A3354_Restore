@implementation NFSecureElementWrapper

- (id)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7 appletResult:(unsigned __int16 *)a8
{
  uint64_t v11;
  uint64_t v12;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  unsigned int v52;
  unsigned int v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *specific;
  uint64_t Logger;
  void (*v69)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  objc_class *v77;
  int v78;
  const char *v79;
  const char *v80;
  id v81;
  id v82;
  uint64_t v83;
  unsigned int v84;
  id v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  const char *v91;
  const char *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  objc_class *v98;
  int v99;
  const char *v100;
  const char *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  const char *v117;
  const char *v118;
  const char *Name;
  uint64_t v120;
  id v121;
  id v122;
  id v123;
  id v124;
  _QWORD v125[4];
  _QWORD v126[4];
  _QWORD v127[4];
  _QWORD v128[4];
  _QWORD v129[5];
  _QWORD v130[5];
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[4];
  _QWORD v135[5];
  _QWORD v136[5];
  uint8_t buf[4];
  int v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  const char *v142;
  __int16 v143;
  int v144;
  __int16 v145;
  id v146;

  v11 = a4;
  v12 = a3;
  v122 = a5;
  v15 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269978, 8);
  v124 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v15, &v124));
  v17 = v124;

  if (v16)
  {
    if (objc_msgSend(v16, "status") == 36864)
    {
      v123 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 128, 0, v12, v11, v122, &v123));
      v19 = v123;

      if (!v18)
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v69 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v73 = 45;
          if (isMetaClass)
            v73 = 43;
          v69(3, "%c[%{public}s %{public}s]:%i Nil response", v73, ClassName, Name, 47);
        }
        v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v75 = NFSharedLogGetLogger(v74);
        v76 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v77 = object_getClass(self);
          if (class_isMetaClass(v77))
            v78 = 43;
          else
            v78 = 45;
          v79 = object_getClassName(self);
          v80 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v138 = v78;
          v139 = 2082;
          v140 = v79;
          v141 = 2082;
          v142 = v80;
          v143 = 1024;
          v144 = 47;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
        }

        if (v19 && objc_msgSend(v19, "code"))
        {
          v81 = objc_alloc((Class)NSError);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v82 = objc_msgSend(v19, "code");
          v129[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)objc_msgSend(v19, "code") > 70)
            v83 = 71;
          else
            v83 = (uint64_t)objc_msgSend(v19, "code");
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v83]));
          v130[0] = v55;
          v130[1] = v19;
          v129[1] = NSUnderlyingErrorKey;
          v129[2] = CFSTR("Line");
          v130[2] = &off_1002FD938;
          v129[3] = CFSTR("Method");
          v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v130[3] = v113;
          v129[4] = NSDebugDescriptionErrorKey;
          v114 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 48);
          v130[4] = v114;
          v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v130, v129, 5));
          v66 = objc_msgSend(v81, "initWithDomain:code:userInfo:", v18, v82, v115);

        }
        else
        {
          v109 = objc_alloc((Class)NSError);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v127[0] = NSLocalizedDescriptionKey;
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
          v128[0] = v55;
          v128[1] = &off_1002FD938;
          v127[1] = CFSTR("Line");
          v127[2] = CFSTR("Method");
          v110 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v128[2] = v110;
          v127[3] = NSDebugDescriptionErrorKey;
          v111 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 48);
          v128[3] = v111;
          v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v128, v127, 4));
          v66 = objc_msgSend(v109, "initWithDomain:code:userInfo:", v18, 6, v112);

        }
        goto LABEL_60;
      }
      *a8 = (unsigned __int16)objc_msgSend(v18, "status");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));
      if ((unint64_t)objc_msgSend(v20, "length") >= 0x14)
      {
        v84 = objc_msgSend(v18, "status");

        if (v84 == 36864)
        {
          v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response")));
          *a7 = *(_DWORD *)objc_msgSend(v85, "bytes");

          *a7 = bswap32(*a7);
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));
          v66 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "subdataWithRange:", 4, 16));
LABEL_60:
          v17 = v19;
          goto LABEL_61;
        }
      }
      else
      {

      }
      v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v87 = NFLogGetLogger(v86);
      if (v87)
      {
        v88 = (void (*)(uint64_t, const char *, ...))v87;
        v89 = object_getClass(self);
        v90 = class_isMetaClass(v89);
        v91 = object_getClassName(self);
        v92 = sel_getName(a2);
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));
        v121 = objc_msgSend(v93, "length");
        v94 = 45;
        if (v90)
          v94 = 43;
        v88(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v94, v91, v92, 55, v121);

      }
      v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v96 = NFSharedLogGetLogger(v95);
      v97 = objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        v98 = object_getClass(self);
        if (class_isMetaClass(v98))
          v99 = 43;
        else
          v99 = 45;
        v100 = object_getClassName(self);
        v101 = sel_getName(a2);
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));
        v103 = objc_msgSend(v102, "length");
        *(_DWORD *)buf = 67110146;
        v138 = v99;
        v139 = 2082;
        v140 = v100;
        v141 = 2082;
        v142 = v101;
        v143 = 1024;
        v144 = 55;
        v145 = 2048;
        v146 = v103;
        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);

      }
      v104 = objc_alloc((Class)NSError);
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v125[0] = NSLocalizedDescriptionKey;
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
      v126[0] = v105;
      v126[1] = &off_1002FD950;
      v125[1] = CFSTR("Line");
      v125[2] = CFSTR("Method");
      v106 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v126[2] = v106;
      v125[3] = NSDebugDescriptionErrorKey;
      v107 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 56);
      v126[3] = v107;
      v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v126, v125, 4));
      v66 = objc_msgSend(v104, "initWithDomain:code:userInfo:", v55, 13, v108);

      goto LABEL_60;
    }
    *a8 = (unsigned __int16)objc_msgSend(v16, "status");
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    if (v38)
    {
      v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      v41 = class_isMetaClass(v40);
      v42 = object_getClassName(self);
      v43 = sel_getName(a2);
      v120 = objc_msgSend(v16, "status");
      v44 = 45;
      if (v41)
        v44 = 43;
      v39(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v44, v42, v43, 33, v120);
    }
    v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v46 = NFSharedLogGetLogger(v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = object_getClass(self);
      if (class_isMetaClass(v48))
        v49 = 43;
      else
        v49 = 45;
      v50 = object_getClassName(self);
      v51 = sel_getName(a2);
      v52 = objc_msgSend(v16, "status");
      *(_DWORD *)buf = 67110146;
      v138 = v49;
      v139 = 2082;
      v140 = v50;
      v141 = 2082;
      v142 = v51;
      v143 = 1024;
      v144 = 33;
      v145 = 1024;
      LODWORD(v146) = v52;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
    }

    v53 = objc_msgSend(v16, "status");
    v54 = objc_alloc((Class)NSError);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    if (v53 == 26277)
    {
      v133[0] = NSLocalizedDescriptionKey;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
      v134[0] = v56;
      v134[1] = &off_1002FD908;
      v133[1] = CFSTR("Line");
      v133[2] = CFSTR("Method");
      v57 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v134[2] = v57;
      v133[3] = NSDebugDescriptionErrorKey;
      v58 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 35);
      v134[3] = v58;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v134, v133, 4));
      v60 = v54;
      v61 = v55;
      v62 = 24;
    }
    else
    {
      v131[0] = NSLocalizedDescriptionKey;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
      v132[0] = v56;
      v132[1] = &off_1002FD920;
      v131[1] = CFSTR("Line");
      v131[2] = CFSTR("Method");
      v57 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v132[2] = v57;
      v131[3] = NSDebugDescriptionErrorKey;
      v58 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 37);
      v132[3] = v58;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v132, v131, 4));
      v60 = v54;
      v61 = v55;
      v62 = 16;
    }
    v66 = objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, v62, v59);

    v18 = v16;
  }
  else
  {
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFLogGetLogger(v21);
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v117 = object_getClassName(self);
      v118 = sel_getName(a2);
      v26 = 45;
      if (v25)
        v26 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v26, v117, v118, 28, v17);
    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v138 = v31;
      v139 = 2082;
      v140 = v32;
      v141 = 2082;
      v142 = v33;
      v143 = 1024;
      v144 = 28;
      v145 = 2114;
      v146 = v17;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    v34 = objc_alloc((Class)NSError);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v35 = objc_msgSend(v17, "code");
    v135[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v17, "code") > 70)
      v36 = 71;
    else
      v36 = (uint64_t)objc_msgSend(v17, "code");
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v36]));
    v136[0] = v55;
    v136[1] = v17;
    v135[1] = NSUnderlyingErrorKey;
    v135[2] = CFSTR("Line");
    v136[2] = &off_1002FD8F0;
    v135[3] = CFSTR("Method");
    v63 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v136[3] = v63;
    v135[4] = NSDebugDescriptionErrorKey;
    v64 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 29);
    v136[4] = v64;
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v136, v135, 5));
    v66 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v18, v35, v65);

  }
LABEL_61:

  return v66;
}

- (id)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7
{
  uint64_t v10;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *specific;
  uint64_t Logger;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  unsigned int v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  _BOOL4 v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  _BOOL4 v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  unsigned int v73;
  unsigned int v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void (*v89)(uint64_t, const char *, ...);
  objc_class *v90;
  _BOOL4 v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  objc_class *v97;
  int v98;
  const char *v99;
  const char *v100;
  id v101;
  id v102;
  uint64_t v103;
  unsigned int v104;
  id v105;
  void *v106;
  uint64_t v107;
  void (*v108)(uint64_t, const char *, ...);
  objc_class *v109;
  _BOOL4 v110;
  const char *v111;
  const char *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  NSObject *v117;
  objc_class *v118;
  int v119;
  const char *v120;
  const char *v121;
  void *v122;
  id v123;
  id v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  id v131;
  id v132;
  void *v133;
  const char *v135;
  const char *v136;
  const char *v137;
  id v138;
  uint64_t v139;
  id v140;
  id v141;
  id v142;
  id v143;
  _QWORD v144[4];
  _QWORD v145[4];
  _QWORD v146[4];
  _QWORD v147[4];
  _QWORD v148[5];
  _QWORD v149[5];
  _QWORD v150[4];
  _QWORD v151[4];
  _QWORD v152[4];
  _QWORD v153[4];
  _QWORD v154[5];
  _QWORD v155[5];
  uint8_t buf[4];
  int v157;
  __int16 v158;
  const char *v159;
  __int16 v160;
  const char *v161;
  __int16 v162;
  int v163;
  __int16 v164;
  id v165;
  _QWORD v166[4];
  _QWORD v167[4];

  v10 = a3;
  v13 = a4;
  v14 = v13;
  if (v13 && objc_msgSend(v13, "length") != (id)32)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v138 = objc_msgSend(v14, "length");
      v28 = 45;
      if (isMetaClass)
        v28 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Invalid user hash length : %u bytes", v28, ClassName, Name, 77, v138);
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
      v36 = objc_msgSend(v14, "length");
      *(_DWORD *)buf = 67110146;
      v157 = v33;
      v158 = 2082;
      v159 = v34;
      v160 = 2082;
      v161 = v35;
      v162 = 1024;
      v163 = 77;
      v164 = 1024;
      LODWORD(v165) = v36;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid user hash length : %u bytes", buf, 0x28u);
    }

    *a7 = 0;
    v37 = objc_alloc((Class)NSError);
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v166[0] = NSLocalizedDescriptionKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v167[0] = v18;
    v167[1] = &off_1002FD968;
    v166[1] = CFSTR("Line");
    v166[2] = CFSTR("Method");
    v38 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v167[2] = v38;
    v166[3] = NSDebugDescriptionErrorKey;
    v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 79);
    v167[3] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v167, v166, 4));
    v41 = objc_msgSend(v37, "initWithDomain:code:userInfo:", v17, 10, v40);

  }
  else
  {
    v15 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269978, 8);
    v143 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v15, &v143));
    v17 = v143;

    if (v16)
    {
      if (objc_msgSend(v16, "status") == 36864)
      {
        v142 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 128, 1, v10, 0, v14, &v142));
        v19 = v142;

        if (v18)
        {
          *a7 = (unsigned __int16)objc_msgSend(v18, "status");
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));
          if ((unint64_t)objc_msgSend(v20, "length") < 0x14)
          {

LABEL_58:
            v141 = v19;
            v106 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v107 = NFLogGetLogger(v106);
            if (v107)
            {
              v108 = (void (*)(uint64_t, const char *, ...))v107;
              v109 = object_getClass(self);
              v110 = class_isMetaClass(v109);
              v111 = object_getClassName(self);
              v112 = sel_getName(a2);
              v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));
              v140 = objc_msgSend(v113, "length");
              v114 = 45;
              if (v110)
                v114 = 43;
              v108(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v114, v111, v112, 113, v140);

            }
            v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v116 = NFSharedLogGetLogger(v115);
            v117 = objc_claimAutoreleasedReturnValue(v116);
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            {
              v118 = object_getClass(self);
              if (class_isMetaClass(v118))
                v119 = 43;
              else
                v119 = 45;
              v120 = object_getClassName(self);
              v121 = sel_getName(a2);
              v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));
              v123 = objc_msgSend(v122, "length");
              *(_DWORD *)buf = 67110146;
              v157 = v119;
              v158 = 2082;
              v159 = v120;
              v160 = 2082;
              v161 = v121;
              v162 = 1024;
              v163 = 113;
              v164 = 2048;
              v165 = v123;
              _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);

            }
            v124 = objc_alloc((Class)NSError);
            v38 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
            v144[0] = NSLocalizedDescriptionKey;
            v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
            v145[0] = v125;
            v145[1] = &off_1002FD9E0;
            v144[1] = CFSTR("Line");
            v144[2] = CFSTR("Method");
            v126 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
            v145[2] = v126;
            v144[3] = NSDebugDescriptionErrorKey;
            v127 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 114);
            v145[3] = v127;
            v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v145, v144, 4));
            v41 = objc_msgSend(v124, "initWithDomain:code:userInfo:", v38, 13, v128);

            v17 = v141;
            goto LABEL_72;
          }
          v104 = objc_msgSend(v18, "status");

          if (v104 != 36864)
            goto LABEL_58;
          v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response")));
          *a6 = *(_DWORD *)objc_msgSend(v105, "bytes");

          *a6 = bswap32(*a6);
          v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));
          v41 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "subdataWithRange:", 4, 16));
        }
        else
        {
          v86 = v19;
          v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v88 = NFLogGetLogger(v87);
          if (v88)
          {
            v89 = (void (*)(uint64_t, const char *, ...))v88;
            v90 = object_getClass(self);
            v91 = class_isMetaClass(v90);
            v92 = object_getClassName(self);
            v137 = sel_getName(a2);
            v93 = 45;
            if (v91)
              v93 = 43;
            v89(3, "%c[%{public}s %{public}s]:%i Nil response", v93, v92, v137, 105);
          }
          v94 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v95 = NFSharedLogGetLogger(v94);
          v96 = objc_claimAutoreleasedReturnValue(v95);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          {
            v97 = object_getClass(self);
            if (class_isMetaClass(v97))
              v98 = 43;
            else
              v98 = 45;
            v99 = object_getClassName(self);
            v100 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v157 = v98;
            v158 = 2082;
            v159 = v99;
            v160 = 2082;
            v161 = v100;
            v162 = 1024;
            v163 = 105;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
          }

          v101 = objc_alloc((Class)NSError);
          v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          if (!v86)
          {
            v146[0] = NSLocalizedDescriptionKey;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
            v147[0] = v18;
            v147[1] = &off_1002FD9C8;
            v146[1] = CFSTR("Line");
            v146[2] = CFSTR("Method");
            v38 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
            v147[2] = v38;
            v146[3] = NSDebugDescriptionErrorKey;
            v129 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 106);
            v147[3] = v129;
            v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v147, v146, 4));
            v41 = objc_msgSend(v101, "initWithDomain:code:userInfo:", v17, 6, v130);

            goto LABEL_72;
          }
          v19 = v86;
          v102 = objc_msgSend(v86, "code");
          v148[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)objc_msgSend(v86, "code") > 70)
            v103 = 71;
          else
            v103 = (uint64_t)objc_msgSend(v86, "code");
          v38 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v103]));
          v149[0] = v38;
          v149[1] = v86;
          v148[1] = NSUnderlyingErrorKey;
          v148[2] = CFSTR("Line");
          v149[2] = &off_1002FD9C8;
          v148[3] = CFSTR("Method");
          v131 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v149[3] = v131;
          v148[4] = NSDebugDescriptionErrorKey;
          v132 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 106);
          v149[4] = v132;
          v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v149, v148, 5));
          v41 = objc_msgSend(v101, "initWithDomain:code:userInfo:", v17, v102, v133);

          v18 = v17;
        }
        v17 = v19;
        goto LABEL_72;
      }
      *a7 = (unsigned __int16)objc_msgSend(v16, "status");
      v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v59 = NFLogGetLogger(v58);
      if (v59)
      {
        v60 = (void (*)(uint64_t, const char *, ...))v59;
        v61 = object_getClass(self);
        v62 = class_isMetaClass(v61);
        v63 = object_getClassName(self);
        v64 = sel_getName(a2);
        v139 = objc_msgSend(v16, "status");
        v65 = 45;
        if (v62)
          v65 = 43;
        v60(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v65, v63, v64, 91, v139);
      }
      v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v67 = NFSharedLogGetLogger(v66);
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = object_getClass(self);
        if (class_isMetaClass(v69))
          v70 = 43;
        else
          v70 = 45;
        v71 = object_getClassName(self);
        v72 = sel_getName(a2);
        v73 = objc_msgSend(v16, "status");
        *(_DWORD *)buf = 67110146;
        v157 = v70;
        v158 = 2082;
        v159 = v71;
        v160 = 2082;
        v161 = v72;
        v162 = 1024;
        v163 = 91;
        v164 = 1024;
        LODWORD(v165) = v73;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      v74 = objc_msgSend(v16, "status");
      v75 = objc_alloc((Class)NSError);
      v38 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v74 == 26277)
      {
        v152[0] = NSLocalizedDescriptionKey;
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
        v153[0] = v76;
        v153[1] = &off_1002FD998;
        v152[1] = CFSTR("Line");
        v152[2] = CFSTR("Method");
        v77 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v153[2] = v77;
        v152[3] = NSDebugDescriptionErrorKey;
        v78 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 93);
        v153[3] = v78;
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v153, v152, 4));
        v80 = v75;
        v81 = v38;
        v82 = 24;
      }
      else
      {
        v150[0] = NSLocalizedDescriptionKey;
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v151[0] = v76;
        v151[1] = &off_1002FD9B0;
        v150[1] = CFSTR("Line");
        v150[2] = CFSTR("Method");
        v77 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v151[2] = v77;
        v150[3] = NSDebugDescriptionErrorKey;
        v78 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 95);
        v151[3] = v78;
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v151, v150, 4));
        v80 = v75;
        v81 = v38;
        v82 = 16;
      }
      v41 = objc_msgSend(v80, "initWithDomain:code:userInfo:", v81, v82, v79);

      v18 = v16;
    }
    else
    {
      v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v43 = NFLogGetLogger(v42);
      if (v43)
      {
        v44 = (void (*)(uint64_t, const char *, ...))v43;
        v45 = object_getClass(self);
        v46 = class_isMetaClass(v45);
        v135 = object_getClassName(self);
        v136 = sel_getName(a2);
        v47 = 45;
        if (v46)
          v47 = 43;
        v44(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v47, v135, v136, 86, v17);
      }
      v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFSharedLogGetLogger(v48);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v51 = object_getClass(self);
        if (class_isMetaClass(v51))
          v52 = 43;
        else
          v52 = 45;
        v53 = object_getClassName(self);
        v54 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v157 = v52;
        v158 = 2082;
        v159 = v53;
        v160 = 2082;
        v161 = v54;
        v162 = 1024;
        v163 = 86;
        v164 = 2114;
        v165 = v17;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
      }

      v55 = objc_alloc((Class)NSError);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v56 = objc_msgSend(v17, "code");
      v154[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)objc_msgSend(v17, "code") > 70)
        v57 = 71;
      else
        v57 = (uint64_t)objc_msgSend(v17, "code");
      v38 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v57]));
      v155[0] = v38;
      v155[1] = v17;
      v154[1] = NSUnderlyingErrorKey;
      v154[2] = CFSTR("Line");
      v155[2] = &off_1002FD980;
      v154[3] = CFSTR("Method");
      v83 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v155[3] = v83;
      v154[4] = NSDebugDescriptionErrorKey;
      v84 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 87);
      v155[4] = v84;
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v155, v154, 5));
      v41 = objc_msgSend(v55, "initWithDomain:code:userInfo:", v18, v56, v85);

    }
  }
LABEL_72:

  return v41;
}

- (id)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5 appletResult:(unsigned __int16 *)a6
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *specific;
  uint64_t Logger;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  _BOOL4 v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  objc_class *v53;
  int v54;
  const char *v55;
  const char *v56;
  const char *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  int v74;
  const char *v75;
  const char *v76;
  unsigned int v77;
  unsigned int v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
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
  id v107;
  void *v108;
  id v109;
  void *v110;
  uint64_t v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  void *v117;
  id v118;
  id v119;
  void *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  id v124;
  uint64_t v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[4];
  _QWORD v135[5];
  _QWORD v136[5];
  _QWORD v137[4];
  _QWORD v138[4];
  _QWORD v139[4];
  _QWORD v140[4];
  _QWORD v141[5];
  _QWORD v142[5];
  uint8_t buf[4];
  int v144;
  __int16 v145;
  const char *v146;
  __int16 v147;
  const char *v148;
  __int16 v149;
  int v150;
  __int16 v151;
  id v152;

  v8 = a3;
  v11 = a4;
  v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269978, 8);
  v130 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v12, &v130));
  v14 = v130;

  if (v13)
  {
    if (objc_msgSend(v13, "status") == 36864)
    {
      v129 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 128, 2, v8, 0, v11, &v129));
      v16 = v129;

      if (v15)
      {
        *a6 = (unsigned __int16)objc_msgSend(v15, "status");
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response"));
        v18 = objc_msgSend(v17, "length");

        if ((unint64_t)v18 > 3)
        {
          v112 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response")));
          *a5 = *(_DWORD *)objc_msgSend(v112, "bytes");

          v43 = 0;
          *a5 = bswap32(*a5);
          v14 = v16;
        }
        else
        {
          v126 = v16;
          v127 = v11;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v21 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response"));
            v124 = objc_msgSend(v26, "length");
            v27 = 45;
            if (isMetaClass)
              v27 = 43;
            v21(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v27, ClassName, Name, 165, v124);

          }
          v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v29 = NFSharedLogGetLogger(v28);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = object_getClass(self);
            if (class_isMetaClass(v31))
              v32 = 43;
            else
              v32 = 45;
            v33 = object_getClassName(self);
            v34 = sel_getName(a2);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response"));
            v36 = objc_msgSend(v35, "length");
            *(_DWORD *)buf = 67110146;
            v144 = v32;
            v145 = 2082;
            v146 = v33;
            v147 = 2082;
            v148 = v34;
            v149 = 1024;
            v150 = 165;
            v151 = 2048;
            v152 = v36;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);

          }
          v37 = objc_alloc((Class)NSError);
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v131[0] = NSLocalizedDescriptionKey;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
          v132[0] = v39;
          v132[1] = &off_1002FDA58;
          v131[1] = CFSTR("Line");
          v131[2] = CFSTR("Method");
          v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v132[2] = v40;
          v131[3] = NSDebugDescriptionErrorKey;
          v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 166);
          v132[3] = v41;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v132, v131, 4));
          v43 = objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 13, v42);

          v14 = v126;
          v11 = v127;
        }
        goto LABEL_56;
      }
      v92 = v16;
      v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v94 = NFLogGetLogger(v93);
      if (v94)
      {
        v95 = (void (*)(uint64_t, const char *, ...))v94;
        v96 = object_getClass(self);
        v97 = class_isMetaClass(v96);
        v98 = object_getClassName(self);
        v123 = sel_getName(a2);
        v99 = 45;
        if (v97)
          v99 = 43;
        v95(3, "%c[%{public}s %{public}s]:%i Nil response", v99, v98, v123, 157);
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
        v106 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v144 = v104;
        v145 = 2082;
        v146 = v105;
        v147 = 2082;
        v148 = v106;
        v149 = 1024;
        v150 = 157;
        _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
      }

      v107 = objc_alloc((Class)NSError);
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (!v92)
      {
        v133[0] = NSLocalizedDescriptionKey;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
        v134[0] = v15;
        v134[1] = &off_1002FDA40;
        v133[1] = CFSTR("Line");
        v133[2] = CFSTR("Method");
        v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v134[2] = v113;
        v133[3] = NSDebugDescriptionErrorKey;
        v114 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 158);
        v134[3] = v114;
        v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v134, v133, 4));
        v43 = objc_msgSend(v107, "initWithDomain:code:userInfo:", v14, 6, v115);

        goto LABEL_56;
      }
      v108 = v92;
      v109 = objc_msgSend(v92, "code");
      v135[0] = NSLocalizedDescriptionKey;
      v128 = v11;
      v110 = v107;
      if ((uint64_t)objc_msgSend(v92, "code") > 70)
        v111 = 71;
      else
        v111 = (uint64_t)objc_msgSend(v92, "code");
      v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v111]));
      v136[0] = v117;
      v136[1] = v92;
      v135[1] = NSUnderlyingErrorKey;
      v135[2] = CFSTR("Line");
      v136[2] = &off_1002FDA40;
      v135[3] = CFSTR("Method");
      v118 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v136[3] = v118;
      v135[4] = NSDebugDescriptionErrorKey;
      v119 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 158);
      v136[4] = v119;
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v136, v135, 5));
      v43 = objc_msgSend(v110, "initWithDomain:code:userInfo:", v14, v109, v120);

      v15 = v14;
      v14 = v108;
    }
    else
    {
      v128 = v11;
      *a6 = (unsigned __int16)objc_msgSend(v13, "status");
      v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v63 = NFLogGetLogger(v62);
      if (v63)
      {
        v64 = (void (*)(uint64_t, const char *, ...))v63;
        v65 = object_getClass(self);
        v66 = class_isMetaClass(v65);
        v67 = object_getClassName(self);
        v68 = sel_getName(a2);
        v125 = objc_msgSend(v13, "status");
        v69 = 45;
        if (v66)
          v69 = 43;
        v64(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v69, v67, v68, 143, v125);
      }
      v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v71 = NFSharedLogGetLogger(v70);
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        v73 = object_getClass(self);
        if (class_isMetaClass(v73))
          v74 = 43;
        else
          v74 = 45;
        v75 = object_getClassName(self);
        v76 = sel_getName(a2);
        v77 = objc_msgSend(v13, "status");
        *(_DWORD *)buf = 67110146;
        v144 = v74;
        v145 = 2082;
        v146 = v75;
        v147 = 2082;
        v148 = v76;
        v149 = 1024;
        v150 = 143;
        v151 = 1024;
        LODWORD(v152) = v77;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      v78 = objc_msgSend(v13, "status");
      v79 = objc_alloc((Class)NSError);
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v78 == 26277)
      {
        v139[0] = NSLocalizedDescriptionKey;
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
        v140[0] = v81;
        v140[1] = &off_1002FDA10;
        v139[1] = CFSTR("Line");
        v139[2] = CFSTR("Method");
        v82 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v140[2] = v82;
        v139[3] = NSDebugDescriptionErrorKey;
        v83 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 145);
        v140[3] = v83;
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v140, v139, 4));
        v85 = v79;
        v86 = v80;
        v87 = 24;
      }
      else
      {
        v137[0] = NSLocalizedDescriptionKey;
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v138[0] = v81;
        v138[1] = &off_1002FDA28;
        v137[1] = CFSTR("Line");
        v137[2] = CFSTR("Method");
        v82 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v138[2] = v82;
        v137[3] = NSDebugDescriptionErrorKey;
        v83 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 147);
        v138[3] = v83;
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v138, v137, 4));
        v85 = v79;
        v86 = v80;
        v87 = 16;
      }
      v43 = objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, v87, v84);

      v15 = v13;
    }
    v11 = v128;
    goto LABEL_56;
  }
  v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v45 = NFLogGetLogger(v44);
  if (v45)
  {
    v46 = (void (*)(uint64_t, const char *, ...))v45;
    v47 = object_getClass(self);
    v48 = class_isMetaClass(v47);
    v121 = object_getClassName(self);
    v122 = sel_getName(a2);
    v49 = 45;
    if (v48)
      v49 = 43;
    v46(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v49, v121, v122, 138, v14);
  }
  v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v51 = NFSharedLogGetLogger(v50);
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v53 = object_getClass(self);
    if (class_isMetaClass(v53))
      v54 = 43;
    else
      v54 = 45;
    v55 = object_getClassName(self);
    v56 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v144 = v54;
    v145 = 2082;
    v146 = v55;
    v147 = 2082;
    v148 = v56;
    v149 = 1024;
    v150 = 138;
    v151 = 2114;
    v152 = v14;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
  }
  v57 = a2;

  v58 = objc_alloc((Class)NSError);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v59 = objc_msgSend(v14, "code");
  v141[0] = NSLocalizedDescriptionKey;
  v60 = v11;
  if ((uint64_t)objc_msgSend(v14, "code") > 70)
    v61 = 71;
  else
    v61 = (uint64_t)objc_msgSend(v14, "code");
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v61]));
  v142[0] = v88;
  v142[1] = v14;
  v141[1] = NSUnderlyingErrorKey;
  v141[2] = CFSTR("Line");
  v142[2] = &off_1002FD9F8;
  v141[3] = CFSTR("Method");
  v89 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(v57));
  v142[3] = v89;
  v141[4] = NSDebugDescriptionErrorKey;
  v90 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(v57), 139);
  v142[4] = v90;
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v142, v141, 5));
  v43 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v15, v59, v91);

  v11 = v60;
LABEL_56:

  return v43;
}

- (id)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7
{
  uint64_t v9;
  _BOOL8 v10;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *specific;
  uint64_t Logger;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
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
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void (*v63)(uint64_t, const char *, ...);
  objc_class *v64;
  _BOOL4 v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  objc_class *v72;
  int v73;
  const char *v74;
  const char *v75;
  unsigned int v76;
  unsigned int v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void (*v93)(uint64_t, const char *, ...);
  objc_class *v94;
  _BOOL4 v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  NSObject *v100;
  objc_class *v101;
  int v102;
  const char *v103;
  const char *v104;
  id v105;
  id v106;
  uint64_t v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  const char *v118;
  const char *v119;
  const char *v120;
  id v121;
  uint64_t v122;
  id v123;
  id v124;
  id v125;
  id v126;
  _QWORD v127[4];
  _QWORD v128[4];
  _QWORD v129[4];
  _QWORD v130[4];
  _QWORD v131[5];
  _QWORD v132[5];
  _QWORD v133[4];
  _QWORD v134[4];
  _QWORD v135[4];
  _QWORD v136[4];
  _QWORD v137[5];
  _QWORD v138[5];
  uint8_t buf[4];
  int v140;
  __int16 v141;
  const char *v142;
  __int16 v143;
  const char *v144;
  __int16 v145;
  int v146;
  __int16 v147;
  id v148;

  v9 = a4;
  v10 = a3;
  v124 = a5;
  v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269978, 8);
  v126 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v13, &v126));
  v15 = v126;

  if (v14)
  {
    if (objc_msgSend(v14, "status") == 36864)
    {
      v125 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 128, 3, v9, v10, v124, &v125));
      v17 = v125;

      if (v16)
      {
        *a7 = (unsigned __int16)objc_msgSend(v16, "status");
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
        v19 = objc_msgSend(v18, "length");

        if ((unint64_t)v19 > 3)
        {
          v108 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response")));
          *a6 = *(_DWORD *)objc_msgSend(v108, "bytes");

          v44 = 0;
          *a6 = bswap32(*a6);
          v15 = v17;
        }
        else
        {
          v123 = v17;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v22 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
            v121 = objc_msgSend(v27, "length");
            v28 = 45;
            if (isMetaClass)
              v28 = 43;
            v22(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v28, ClassName, Name, 215, v121);

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
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
            v37 = objc_msgSend(v36, "length");
            *(_DWORD *)buf = 67110146;
            v140 = v33;
            v141 = 2082;
            v142 = v34;
            v143 = 2082;
            v144 = v35;
            v145 = 1024;
            v146 = 215;
            v147 = 2048;
            v148 = v37;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);

          }
          v38 = objc_alloc((Class)NSError);
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v127[0] = NSLocalizedDescriptionKey;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
          v128[0] = v40;
          v128[1] = &off_1002FDAD0;
          v127[1] = CFSTR("Line");
          v127[2] = CFSTR("Method");
          v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v128[2] = v41;
          v127[3] = NSDebugDescriptionErrorKey;
          v42 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 216);
          v128[3] = v42;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v128, v127, 4));
          v44 = objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 13, v43);

          v15 = v123;
        }
      }
      else
      {
        v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v92 = NFLogGetLogger(v91);
        if (v92)
        {
          v93 = (void (*)(uint64_t, const char *, ...))v92;
          v94 = object_getClass(self);
          v95 = class_isMetaClass(v94);
          v96 = object_getClassName(self);
          v120 = sel_getName(a2);
          v97 = 45;
          if (v95)
            v97 = 43;
          v93(3, "%c[%{public}s %{public}s]:%i Nil response", v97, v96, v120, 207);
        }
        v98 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v99 = NFSharedLogGetLogger(v98);
        v100 = objc_claimAutoreleasedReturnValue(v99);
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v101 = object_getClass(self);
          if (class_isMetaClass(v101))
            v102 = 43;
          else
            v102 = 45;
          v103 = object_getClassName(self);
          v104 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v140 = v102;
          v141 = 2082;
          v142 = v103;
          v143 = 2082;
          v144 = v104;
          v145 = 1024;
          v146 = 207;
          _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
        }

        v105 = objc_alloc((Class)NSError);
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        if (v17)
        {
          v106 = objc_msgSend(v17, "code");
          v131[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)objc_msgSend(v17, "code") > 70)
            v107 = 71;
          else
            v107 = (uint64_t)objc_msgSend(v17, "code");
          v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v107]));
          v132[0] = v112;
          v132[1] = v17;
          v131[1] = NSUnderlyingErrorKey;
          v131[2] = CFSTR("Line");
          v132[2] = &off_1002FDAB8;
          v131[3] = CFSTR("Method");
          v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v132[3] = v113;
          v131[4] = NSDebugDescriptionErrorKey;
          v114 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 208);
          v132[4] = v114;
          v115 = v17;
          v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v132, v131, 5));
          v44 = objc_msgSend(v105, "initWithDomain:code:userInfo:", v15, v106, v116);

          v16 = v15;
          v15 = v115;
        }
        else
        {
          v129[0] = NSLocalizedDescriptionKey;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
          v130[0] = v16;
          v130[1] = &off_1002FDAB8;
          v129[1] = CFSTR("Line");
          v129[2] = CFSTR("Method");
          v109 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v130[2] = v109;
          v129[3] = NSDebugDescriptionErrorKey;
          v110 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 208);
          v130[3] = v110;
          v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v130, v129, 4));
          v44 = objc_msgSend(v105, "initWithDomain:code:userInfo:", v15, 6, v111);

        }
      }
    }
    else
    {
      *a7 = (unsigned __int16)objc_msgSend(v14, "status");
      v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v62 = NFLogGetLogger(v61);
      if (v62)
      {
        v63 = (void (*)(uint64_t, const char *, ...))v62;
        v64 = object_getClass(self);
        v65 = class_isMetaClass(v64);
        v66 = object_getClassName(self);
        v67 = sel_getName(a2);
        v122 = objc_msgSend(v14, "status");
        v68 = 45;
        if (v65)
          v68 = 43;
        v63(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v68, v66, v67, 193, v122);
      }
      v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v70 = NFSharedLogGetLogger(v69);
      v71 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        v72 = object_getClass(self);
        if (class_isMetaClass(v72))
          v73 = 43;
        else
          v73 = 45;
        v74 = object_getClassName(self);
        v75 = sel_getName(a2);
        v76 = objc_msgSend(v14, "status");
        *(_DWORD *)buf = 67110146;
        v140 = v73;
        v141 = 2082;
        v142 = v74;
        v143 = 2082;
        v144 = v75;
        v145 = 1024;
        v146 = 193;
        v147 = 1024;
        LODWORD(v148) = v76;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      v77 = objc_msgSend(v14, "status");
      v78 = objc_alloc((Class)NSError);
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v77 == 26277)
      {
        v135[0] = NSLocalizedDescriptionKey;
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
        v136[0] = v80;
        v136[1] = &off_1002FDA88;
        v135[1] = CFSTR("Line");
        v135[2] = CFSTR("Method");
        v81 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v136[2] = v81;
        v135[3] = NSDebugDescriptionErrorKey;
        v82 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 195);
        v136[3] = v82;
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v136, v135, 4));
        v84 = v78;
        v85 = v79;
        v86 = 24;
      }
      else
      {
        v133[0] = NSLocalizedDescriptionKey;
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v134[0] = v80;
        v134[1] = &off_1002FDAA0;
        v133[1] = CFSTR("Line");
        v133[2] = CFSTR("Method");
        v81 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v134[2] = v81;
        v133[3] = NSDebugDescriptionErrorKey;
        v82 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 197);
        v134[3] = v82;
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v134, v133, 4));
        v84 = v78;
        v85 = v79;
        v86 = 16;
      }
      v44 = objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, v86, v83);

      v16 = v14;
    }
  }
  else
  {
    v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v46 = NFLogGetLogger(v45);
    if (v46)
    {
      v47 = (void (*)(uint64_t, const char *, ...))v46;
      v48 = object_getClass(self);
      v49 = class_isMetaClass(v48);
      v118 = object_getClassName(self);
      v119 = sel_getName(a2);
      v50 = 45;
      if (v49)
        v50 = 43;
      v47(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v50, v118, v119, 188, v15);
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
      *(_DWORD *)buf = 67110146;
      v140 = v55;
      v141 = 2082;
      v142 = v56;
      v143 = 2082;
      v144 = v57;
      v145 = 1024;
      v146 = 188;
      v147 = 2114;
      v148 = v15;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    v58 = objc_alloc((Class)NSError);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v59 = objc_msgSend(v15, "code");
    v137[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v15, "code") > 70)
      v60 = 71;
    else
      v60 = (uint64_t)objc_msgSend(v15, "code");
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v60]));
    v138[0] = v87;
    v138[1] = v15;
    v137[1] = NSUnderlyingErrorKey;
    v137[2] = CFSTR("Line");
    v138[2] = &off_1002FDA70;
    v137[3] = CFSTR("Method");
    v88 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v138[3] = v88;
    v137[4] = NSDebugDescriptionErrorKey;
    v89 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 189);
    v138[4] = v89;
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v138, v137, 5));
    v44 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v16, v59, v90);

  }
  return v44;
}

- (id)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4 appletResult:(unsigned __int16 *)a5
{
  uint64_t v7;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  _BOOL4 v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  _BOOL4 v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  unsigned int v73;
  unsigned int v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  _BOOL4 v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  objc_class *v98;
  int v99;
  const char *v100;
  const char *v101;
  id v102;
  id v103;
  uint64_t v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  const char *v115;
  const char *v116;
  const char *v117;
  id v118;
  uint64_t v119;
  id v120;
  id v121;
  id v122;
  _QWORD v123[4];
  _QWORD v124[4];
  _QWORD v125[4];
  _QWORD v126[4];
  _QWORD v127[5];
  _QWORD v128[5];
  _QWORD v129[4];
  _QWORD v130[4];
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[5];
  _QWORD v134[5];
  uint8_t buf[4];
  int v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  id v144;

  v7 = a3;
  v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269978, 8);
  v122 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v10, &v122));
  v12 = v122;

  if (v11)
  {
    if (objc_msgSend(v11, "status") == 36864)
    {
      v121 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 128, 4, v7, 0, 0, &v121));
      v14 = v121;

      if (v13)
      {
        *a5 = (unsigned __int16)objc_msgSend(v13, "status");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "response"));
        v16 = objc_msgSend(v15, "length");

        if ((unint64_t)v16 > 3)
        {
          v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "response")));
          *a4 = *(_DWORD *)objc_msgSend(v105, "bytes");

          v41 = 0;
          *a4 = bswap32(*a4);
          v12 = v14;
        }
        else
        {
          v120 = v14;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v19 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "response"));
            v118 = objc_msgSend(v24, "length");
            v25 = 45;
            if (isMetaClass)
              v25 = 43;
            v19(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v25, ClassName, Name, 263, v118);

          }
          v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v27 = NFSharedLogGetLogger(v26);
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = object_getClass(self);
            if (class_isMetaClass(v29))
              v30 = 43;
            else
              v30 = 45;
            v31 = object_getClassName(self);
            v32 = sel_getName(a2);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "response"));
            v34 = objc_msgSend(v33, "length");
            *(_DWORD *)buf = 67110146;
            v136 = v30;
            v137 = 2082;
            v138 = v31;
            v139 = 2082;
            v140 = v32;
            v141 = 1024;
            v142 = 263;
            v143 = 2048;
            v144 = v34;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);

          }
          v35 = objc_alloc((Class)NSError);
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v123[0] = NSLocalizedDescriptionKey;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
          v124[0] = v37;
          v124[1] = &off_1002FDB48;
          v123[1] = CFSTR("Line");
          v123[2] = CFSTR("Method");
          v38 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v124[2] = v38;
          v123[3] = NSDebugDescriptionErrorKey;
          v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 264);
          v124[3] = v39;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v124, v123, 4));
          v41 = objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 13, v40);

          v12 = v120;
        }
      }
      else
      {
        v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v89 = NFLogGetLogger(v88);
        if (v89)
        {
          v90 = (void (*)(uint64_t, const char *, ...))v89;
          v91 = object_getClass(self);
          v92 = class_isMetaClass(v91);
          v93 = object_getClassName(self);
          v117 = sel_getName(a2);
          v94 = 45;
          if (v92)
            v94 = 43;
          v90(3, "%c[%{public}s %{public}s]:%i Nil response", v94, v93, v117, 255);
        }
        v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v96 = NFSharedLogGetLogger(v95);
        v97 = objc_claimAutoreleasedReturnValue(v96);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          v98 = object_getClass(self);
          if (class_isMetaClass(v98))
            v99 = 43;
          else
            v99 = 45;
          v100 = object_getClassName(self);
          v101 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v136 = v99;
          v137 = 2082;
          v138 = v100;
          v139 = 2082;
          v140 = v101;
          v141 = 1024;
          v142 = 255;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
        }

        v102 = objc_alloc((Class)NSError);
        v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        if (v14)
        {
          v103 = objc_msgSend(v14, "code");
          v127[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)objc_msgSend(v14, "code") > 70)
            v104 = 71;
          else
            v104 = (uint64_t)objc_msgSend(v14, "code");
          v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v104]));
          v128[0] = v109;
          v128[1] = v14;
          v127[1] = NSUnderlyingErrorKey;
          v127[2] = CFSTR("Line");
          v128[2] = &off_1002FDB30;
          v127[3] = CFSTR("Method");
          v110 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v128[3] = v110;
          v127[4] = NSDebugDescriptionErrorKey;
          v111 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 256);
          v128[4] = v111;
          v112 = v14;
          v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v128, v127, 5));
          v41 = objc_msgSend(v102, "initWithDomain:code:userInfo:", v12, v103, v113);

          v13 = v12;
          v12 = v112;
        }
        else
        {
          v125[0] = NSLocalizedDescriptionKey;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
          v126[0] = v13;
          v126[1] = &off_1002FDB30;
          v125[1] = CFSTR("Line");
          v125[2] = CFSTR("Method");
          v106 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v126[2] = v106;
          v125[3] = NSDebugDescriptionErrorKey;
          v107 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 256);
          v126[3] = v107;
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v126, v125, 4));
          v41 = objc_msgSend(v102, "initWithDomain:code:userInfo:", v12, 6, v108);

        }
      }
    }
    else
    {
      *a5 = (unsigned __int16)objc_msgSend(v11, "status");
      v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v59 = NFLogGetLogger(v58);
      if (v59)
      {
        v60 = (void (*)(uint64_t, const char *, ...))v59;
        v61 = object_getClass(self);
        v62 = class_isMetaClass(v61);
        v63 = object_getClassName(self);
        v64 = sel_getName(a2);
        v119 = objc_msgSend(v11, "status");
        v65 = 45;
        if (v62)
          v65 = 43;
        v60(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v65, v63, v64, 241, v119);
      }
      v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v67 = NFSharedLogGetLogger(v66);
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = object_getClass(self);
        if (class_isMetaClass(v69))
          v70 = 43;
        else
          v70 = 45;
        v71 = object_getClassName(self);
        v72 = sel_getName(a2);
        v73 = objc_msgSend(v11, "status");
        *(_DWORD *)buf = 67110146;
        v136 = v70;
        v137 = 2082;
        v138 = v71;
        v139 = 2082;
        v140 = v72;
        v141 = 1024;
        v142 = 241;
        v143 = 1024;
        LODWORD(v144) = v73;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      v74 = objc_msgSend(v11, "status");
      v75 = objc_alloc((Class)NSError);
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v74 == 26277)
      {
        v131[0] = NSLocalizedDescriptionKey;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
        v132[0] = v77;
        v132[1] = &off_1002FDB00;
        v131[1] = CFSTR("Line");
        v131[2] = CFSTR("Method");
        v78 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v132[2] = v78;
        v131[3] = NSDebugDescriptionErrorKey;
        v79 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 243);
        v132[3] = v79;
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v132, v131, 4));
        v81 = v75;
        v82 = v76;
        v83 = 24;
      }
      else
      {
        v129[0] = NSLocalizedDescriptionKey;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v130[0] = v77;
        v130[1] = &off_1002FDB18;
        v129[1] = CFSTR("Line");
        v129[2] = CFSTR("Method");
        v78 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v130[2] = v78;
        v129[3] = NSDebugDescriptionErrorKey;
        v79 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 245);
        v130[3] = v79;
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v130, v129, 4));
        v81 = v75;
        v82 = v76;
        v83 = 16;
      }
      v41 = objc_msgSend(v81, "initWithDomain:code:userInfo:", v82, v83, v80);

      v13 = v11;
    }
  }
  else
  {
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFLogGetLogger(v42);
    if (v43)
    {
      v44 = (void (*)(uint64_t, const char *, ...))v43;
      v45 = object_getClass(self);
      v46 = class_isMetaClass(v45);
      v115 = object_getClassName(self);
      v116 = sel_getName(a2);
      v47 = 45;
      if (v46)
        v47 = 43;
      v44(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v47, v115, v116, 236, v12);
    }
    v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = NFSharedLogGetLogger(v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = object_getClass(self);
      if (class_isMetaClass(v51))
        v52 = 43;
      else
        v52 = 45;
      v53 = object_getClassName(self);
      v54 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v136 = v52;
      v137 = 2082;
      v138 = v53;
      v139 = 2082;
      v140 = v54;
      v141 = 1024;
      v142 = 236;
      v143 = 2114;
      v144 = v12;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    v55 = objc_alloc((Class)NSError);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v56 = objc_msgSend(v12, "code");
    v133[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v12, "code") > 70)
      v57 = 71;
    else
      v57 = (uint64_t)objc_msgSend(v12, "code");
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v57]));
    v134[0] = v84;
    v134[1] = v12;
    v133[1] = NSUnderlyingErrorKey;
    v133[2] = CFSTR("Line");
    v134[2] = &off_1002FDAE8;
    v133[3] = CFSTR("Method");
    v85 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v134[3] = v85;
    v133[4] = NSDebugDescriptionErrorKey;
    v86 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 237);
    v134[4] = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v134, v133, 5));
    v41 = objc_msgSend(v55, "initWithDomain:code:userInfo:", v13, v56, v87);

  }
  return v41;
}

- (id)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *v37;
  _BOOL4 v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  unsigned int v49;
  unsigned int v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  void (*v67)(uint64_t, const char *, ...);
  objc_class *v68;
  _BOOL4 v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  objc_class *v75;
  int v76;
  const char *v77;
  const char *v78;
  id v79;
  id v80;
  uint64_t v81;
  unsigned int v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *specific;
  uint64_t Logger;
  void (*v92)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  NSObject *v101;
  objc_class *v102;
  int v103;
  const char *v104;
  const char *v105;
  void *v106;
  id v107;
  unsigned int v108;
  id v109;
  void *v110;
  void *v111;
  id v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  const char *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  id v129;
  id v131;
  id v132;
  _QWORD v133[4];
  _QWORD v134[4];
  uint8_t buf[4];
  int v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  id v144;
  __int16 v145;
  unsigned int v146;
  _QWORD v147[4];
  _QWORD v148[4];
  _QWORD v149[5];
  _QWORD v150[5];
  _QWORD v151[4];
  _QWORD v152[4];
  _QWORD v153[4];
  _QWORD v154[4];
  _QWORD v155[5];
  _QWORD v156[5];

  v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269978, 8);
  v132 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v13, &v132));
  v15 = v132;

  if (v14)
  {
    if (objc_msgSend(v14, "status") == 36864)
    {
      v131 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 128, 5, 0, 0, 0, &v131));
      v129 = v131;

      if (v16)
      {
        *a7 = (unsigned __int16)objc_msgSend(v16, "status");
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
        if ((unint64_t)objc_msgSend(v17, "length") >= 0x15)
        {
          v82 = objc_msgSend(v16, "status");

          if (v82 == 36864)
          {
            v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response")));
            *a6 = *(_DWORD *)objc_msgSend(v83, "bytes");

            v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response")));
            *a5 = *((_DWORD *)objc_msgSend(v84, "bytes") + 1);

            v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response")));
            *a4 = *((_BYTE *)objc_msgSend(v85, "bytes") + 8);

            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
            v87 = objc_msgSend(v86, "length");

            if ((unint64_t)v87 < 0xA)
            {
              *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
            }
            else
            {
              v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
              v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
              *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "subdataWithRange:", 9, (char *)objc_msgSend(v89, "length") - 9));

            }
            v64 = 0;
            *a6 = bswap32(*a6);
            *a5 = bswap32(*a5);
LABEL_62:
            v15 = v129;
            goto LABEL_63;
          }
        }
        else
        {

        }
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v92 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
          v127 = objc_msgSend(v97, "length");
          v128 = objc_msgSend(v16, "status");
          v98 = 45;
          if (isMetaClass)
            v98 = 43;
          v92(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu or status 0x%x", v98, ClassName, Name, 313, v127, v128);

        }
        v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v100 = NFSharedLogGetLogger(v99);
        v101 = objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          v102 = object_getClass(self);
          if (class_isMetaClass(v102))
            v103 = 43;
          else
            v103 = 45;
          v104 = object_getClassName(self);
          v105 = sel_getName(a2);
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "response"));
          v107 = objc_msgSend(v106, "length");
          v108 = objc_msgSend(v16, "status");
          *(_DWORD *)buf = 67110402;
          v136 = v103;
          v137 = 2082;
          v138 = v104;
          v139 = 2082;
          v140 = v105;
          v141 = 1024;
          v142 = 313;
          v143 = 2048;
          v144 = v107;
          v145 = 1024;
          v146 = v108;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu or status 0x%x", buf, 0x32u);

        }
        v109 = objc_alloc((Class)NSError);
        v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v133[0] = NSLocalizedDescriptionKey;
        v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
        v134[0] = v111;
        v134[1] = &off_1002FDBC0;
        v133[1] = CFSTR("Line");
        v133[2] = CFSTR("Method");
        v112 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v134[2] = v112;
        v133[3] = NSDebugDescriptionErrorKey;
        v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 314);
        v134[3] = v113;
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v134, v133, 4));
        v64 = objc_msgSend(v109, "initWithDomain:code:userInfo:", v110, 13, v114);

        goto LABEL_62;
      }
      v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v66 = NFLogGetLogger(v65);
      if (v66)
      {
        v67 = (void (*)(uint64_t, const char *, ...))v66;
        v68 = object_getClass(self);
        v69 = class_isMetaClass(v68);
        v70 = object_getClassName(self);
        v125 = sel_getName(a2);
        v71 = 45;
        if (v69)
          v71 = 43;
        v67(3, "%c[%{public}s %{public}s]:%i Nil response", v71, v70, v125, 305);
      }
      v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v73 = NFSharedLogGetLogger(v72);
      v74 = objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        v75 = object_getClass(self);
        if (class_isMetaClass(v75))
          v76 = 43;
        else
          v76 = 45;
        v77 = object_getClassName(self);
        v78 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v136 = v76;
        v137 = 2082;
        v138 = v77;
        v139 = 2082;
        v140 = v78;
        v141 = 1024;
        v142 = 305;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
      }

      v79 = objc_alloc((Class)NSError);
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v129)
      {
        v80 = objc_msgSend(v129, "code");
        v149[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)objc_msgSend(v129, "code") > 70)
          v81 = 71;
        else
          v81 = (uint64_t)objc_msgSend(v129, "code");
        v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v81]));
        v150[0] = v118;
        v150[1] = v129;
        v149[1] = NSUnderlyingErrorKey;
        v149[2] = CFSTR("Line");
        v150[2] = &off_1002FDBA8;
        v149[3] = CFSTR("Method");
        v119 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v150[3] = v119;
        v149[4] = NSDebugDescriptionErrorKey;
        v120 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 306);
        v150[4] = v120;
        v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v150, v149, 5));
        v64 = objc_msgSend(v79, "initWithDomain:code:userInfo:", v15, v80, v121);

        v16 = v15;
        v15 = v129;
      }
      else
      {
        v147[0] = NSLocalizedDescriptionKey;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
        v148[0] = v16;
        v148[1] = &off_1002FDBA8;
        v147[1] = CFSTR("Line");
        v147[2] = CFSTR("Method");
        v115 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v148[2] = v115;
        v147[3] = NSDebugDescriptionErrorKey;
        v116 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 306);
        v148[3] = v116;
        v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v148, v147, 4));
        v64 = objc_msgSend(v79, "initWithDomain:code:userInfo:", v15, 6, v117);

      }
    }
    else
    {
      *a7 = (unsigned __int16)objc_msgSend(v14, "status");
      v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v35 = NFLogGetLogger(v34);
      if (v35)
      {
        v36 = (void (*)(uint64_t, const char *, ...))v35;
        v37 = object_getClass(self);
        v38 = class_isMetaClass(v37);
        v39 = object_getClassName(self);
        v40 = sel_getName(a2);
        v126 = objc_msgSend(v14, "status");
        v41 = 45;
        if (v38)
          v41 = 43;
        v36(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v41, v39, v40, 291, v126);
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
        v49 = objc_msgSend(v14, "status");
        *(_DWORD *)buf = 67110146;
        v136 = v46;
        v137 = 2082;
        v138 = v47;
        v139 = 2082;
        v140 = v48;
        v141 = 1024;
        v142 = 291;
        v143 = 1024;
        LODWORD(v144) = v49;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      v50 = objc_msgSend(v14, "status");
      v51 = objc_alloc((Class)NSError);
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v50 == 26277)
      {
        v153[0] = NSLocalizedDescriptionKey;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
        v154[0] = v53;
        v154[1] = &off_1002FDB78;
        v153[1] = CFSTR("Line");
        v153[2] = CFSTR("Method");
        v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v154[2] = v54;
        v153[3] = NSDebugDescriptionErrorKey;
        v55 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 293);
        v154[3] = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v154, v153, 4));
        v57 = v51;
        v58 = v52;
        v59 = 24;
      }
      else
      {
        v151[0] = NSLocalizedDescriptionKey;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v152[0] = v53;
        v152[1] = &off_1002FDB90;
        v151[1] = CFSTR("Line");
        v151[2] = CFSTR("Method");
        v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v152[2] = v54;
        v151[3] = NSDebugDescriptionErrorKey;
        v55 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 295);
        v152[3] = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v152, v151, 4));
        v57 = v51;
        v58 = v52;
        v59 = 16;
      }
      v64 = objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, v59, v56);

      v16 = v14;
    }
  }
  else
  {
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFLogGetLogger(v18);
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      v21 = object_getClass(self);
      v22 = class_isMetaClass(v21);
      v123 = object_getClassName(self);
      v124 = sel_getName(a2);
      v23 = 45;
      if (v22)
        v23 = 43;
      v20(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v23, v123, v124, 286, v15);
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
      v136 = v28;
      v137 = 2082;
      v138 = v29;
      v139 = 2082;
      v140 = v30;
      v141 = 1024;
      v142 = 286;
      v143 = 2114;
      v144 = v15;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    v31 = objc_alloc((Class)NSError);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v32 = objc_msgSend(v15, "code");
    v155[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v15, "code") > 70)
      v33 = 71;
    else
      v33 = (uint64_t)objc_msgSend(v15, "code");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v33]));
    v156[0] = v60;
    v156[1] = v15;
    v155[1] = NSUnderlyingErrorKey;
    v155[2] = CFSTR("Line");
    v156[2] = &off_1002FDB60;
    v155[3] = CFSTR("Method");
    v61 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v156[3] = v61;
    v155[4] = NSDebugDescriptionErrorKey;
    v62 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 287);
    v156[4] = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v156, v155, 5));
    v64 = objc_msgSend(v31, "initWithDomain:code:userInfo:", v16, v32, v63);

  }
LABEL_63:

  return v64;
}

- (id)getHash:(id *)a3 appletResult:(unsigned __int16 *)a4
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *specific;
  uint64_t Logger;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void (*v42)(uint64_t, const char *, ...);
  objc_class *v43;
  _BOOL4 v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
  unsigned int v71;
  unsigned int v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *v87;
  _BOOL4 v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  objc_class *v94;
  int v95;
  const char *v96;
  const char *v97;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  const char *v108;
  const char *v109;
  const char *v110;
  id v111;
  uint64_t v112;
  id v113;
  id v114;
  id v115;
  _QWORD v116[4];
  _QWORD v117[4];
  _QWORD v118[4];
  _QWORD v119[4];
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD v122[4];
  _QWORD v123[4];
  _QWORD v124[4];
  _QWORD v125[4];
  _QWORD v126[5];
  _QWORD v127[5];
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

  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269978, 8);
  v115 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v8, &v115));
  v10 = v115;

  if (v9)
  {
    if (objc_msgSend(v9, "status") == 36864)
    {
      v114 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 128, 6, 0, 0, 0, &v114));
      v12 = v114;

      if (v11)
      {
        *a4 = (unsigned __int16)objc_msgSend(v11, "status");
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "response"));
        v14 = objc_msgSend(v13, "length");

        if ((unint64_t)v14 > 0x1F)
        {
          v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "response"));
          v39 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "subdataWithRange:", 0, 32));
          v10 = v12;
        }
        else
        {
          v113 = v12;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v17 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "response"));
            v111 = objc_msgSend(v22, "length");
            v23 = 45;
            if (isMetaClass)
              v23 = 43;
            v17(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v23, ClassName, Name, 371, v111);

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
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "response"));
            v32 = objc_msgSend(v31, "length");
            *(_DWORD *)buf = 67110146;
            v129 = v28;
            v130 = 2082;
            v131 = v29;
            v132 = 2082;
            v133 = v30;
            v134 = 1024;
            v135 = 371;
            v136 = 2048;
            v137 = v32;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);

          }
          v33 = objc_alloc((Class)NSError);
          v34 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v116[0] = NSLocalizedDescriptionKey;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
          v117[0] = v35;
          v117[1] = &off_1002FDC38;
          v116[1] = CFSTR("Line");
          v116[2] = CFSTR("Method");
          v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v117[2] = v36;
          v116[3] = NSDebugDescriptionErrorKey;
          v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 372);
          v117[3] = v37;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v117, v116, 4));
          v39 = objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 13, v38);

          v10 = v113;
        }
      }
      else
      {
        v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v85 = NFLogGetLogger(v84);
        if (v85)
        {
          v86 = (void (*)(uint64_t, const char *, ...))v85;
          v87 = object_getClass(self);
          v88 = class_isMetaClass(v87);
          v89 = object_getClassName(self);
          v110 = sel_getName(a2);
          v90 = 45;
          if (v88)
            v90 = 43;
          v86(3, "%c[%{public}s %{public}s]:%i Nil response", v90, v89, v110, 363);
        }
        v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v92 = NFSharedLogGetLogger(v91);
        v93 = objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          v94 = object_getClass(self);
          if (class_isMetaClass(v94))
            v95 = 43;
          else
            v95 = 45;
          v96 = object_getClassName(self);
          v97 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v129 = v95;
          v130 = 2082;
          v131 = v96;
          v132 = 2082;
          v133 = v97;
          v134 = 1024;
          v135 = 363;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
        }

        v98 = objc_alloc((Class)NSError);
        v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        if (v12)
        {
          v99 = objc_msgSend(v12, "code");
          v120[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)objc_msgSend(v12, "code") > 70)
            v100 = 71;
          else
            v100 = (uint64_t)objc_msgSend(v12, "code");
          v34 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v100]));
          v121[0] = v34;
          v121[1] = v12;
          v120[1] = NSUnderlyingErrorKey;
          v120[2] = CFSTR("Line");
          v121[2] = &off_1002FDC20;
          v120[3] = CFSTR("Method");
          v103 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v121[3] = v103;
          v120[4] = NSDebugDescriptionErrorKey;
          v104 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 364);
          v121[4] = v104;
          v105 = v12;
          v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v121, v120, 5));
          v39 = objc_msgSend(v98, "initWithDomain:code:userInfo:", v10, v99, v106);

          v11 = v10;
          v10 = v105;
        }
        else
        {
          v118[0] = NSLocalizedDescriptionKey;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
          v119[0] = v11;
          v119[1] = &off_1002FDC20;
          v118[1] = CFSTR("Line");
          v118[2] = CFSTR("Method");
          v34 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v119[2] = v34;
          v118[3] = NSDebugDescriptionErrorKey;
          v101 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 364);
          v119[3] = v101;
          v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v119, v118, 4));
          v39 = objc_msgSend(v98, "initWithDomain:code:userInfo:", v10, 6, v102);

        }
      }
    }
    else
    {
      *a4 = (unsigned __int16)objc_msgSend(v9, "status");
      v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = NFLogGetLogger(v56);
      if (v57)
      {
        v58 = (void (*)(uint64_t, const char *, ...))v57;
        v59 = object_getClass(self);
        v60 = class_isMetaClass(v59);
        v61 = object_getClassName(self);
        v62 = sel_getName(a2);
        v112 = objc_msgSend(v9, "status");
        v63 = 45;
        if (v60)
          v63 = 43;
        v58(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v63, v61, v62, 349, v112);
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
        v70 = sel_getName(a2);
        v71 = objc_msgSend(v9, "status");
        *(_DWORD *)buf = 67110146;
        v129 = v68;
        v130 = 2082;
        v131 = v69;
        v132 = 2082;
        v133 = v70;
        v134 = 1024;
        v135 = 349;
        v136 = 1024;
        LODWORD(v137) = v71;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      v72 = objc_msgSend(v9, "status");
      v73 = objc_alloc((Class)NSError);
      v34 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v72 == 26277)
      {
        v124[0] = NSLocalizedDescriptionKey;
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
        v125[0] = v74;
        v125[1] = &off_1002FDBF0;
        v124[1] = CFSTR("Line");
        v124[2] = CFSTR("Method");
        v75 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v125[2] = v75;
        v124[3] = NSDebugDescriptionErrorKey;
        v76 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 351);
        v125[3] = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v125, v124, 4));
        v78 = v73;
        v79 = v34;
        v80 = 24;
      }
      else
      {
        v122[0] = NSLocalizedDescriptionKey;
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v123[0] = v74;
        v123[1] = &off_1002FDC08;
        v122[1] = CFSTR("Line");
        v122[2] = CFSTR("Method");
        v75 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v123[2] = v75;
        v122[3] = NSDebugDescriptionErrorKey;
        v76 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 353);
        v123[3] = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 4));
        v78 = v73;
        v79 = v34;
        v80 = 16;
      }
      v39 = objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, v80, v77);

      v11 = v9;
    }
  }
  else
  {
    v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v41 = NFLogGetLogger(v40);
    if (v41)
    {
      v42 = (void (*)(uint64_t, const char *, ...))v41;
      v43 = object_getClass(self);
      v44 = class_isMetaClass(v43);
      v108 = object_getClassName(self);
      v109 = sel_getName(a2);
      v45 = 45;
      if (v44)
        v45 = 43;
      v42(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v45, v108, v109, 344, v10);
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
      *(_DWORD *)buf = 67110146;
      v129 = v50;
      v130 = 2082;
      v131 = v51;
      v132 = 2082;
      v133 = v52;
      v134 = 1024;
      v135 = 344;
      v136 = 2114;
      v137 = v10;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    v53 = objc_alloc((Class)NSError);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v54 = objc_msgSend(v10, "code");
    v126[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v10, "code") > 70)
      v55 = 71;
    else
      v55 = (uint64_t)objc_msgSend(v10, "code");
    v34 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v55]));
    v127[0] = v34;
    v127[1] = v10;
    v126[1] = NSUnderlyingErrorKey;
    v126[2] = CFSTR("Line");
    v127[2] = &off_1002FDBD8;
    v126[3] = CFSTR("Method");
    v81 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v127[3] = v81;
    v126[4] = NSDebugDescriptionErrorKey;
    v82 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 345);
    v127[4] = v82;
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v127, v126, 5));
    v39 = objc_msgSend(v53, "initWithDomain:code:userInfo:", v11, v54, v83);

  }
  return v39;
}

- (id)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5 appletResult:(unsigned __int16 *)a6
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *specific;
  uint64_t Logger;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  objc_class *v53;
  int v54;
  const char *v55;
  const char *v56;
  const char *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  int v74;
  const char *v75;
  const char *v76;
  unsigned int v77;
  unsigned int v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
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
  uint64_t v107;
  uint64_t v108;
  id v109;
  const char *ClassName;
  const char *Name;
  const char *v113;
  id v114;
  uint64_t v115;
  id v116;
  id v117;
  id v118;
  id v119;
  _QWORD v120[4];
  _QWORD v121[4];
  _QWORD v122[5];
  _QWORD v123[5];
  _QWORD v124[4];
  _QWORD v125[4];
  _QWORD v126[4];
  _QWORD v127[4];
  _QWORD v128[5];
  _QWORD v129[5];
  uint8_t buf[4];
  int v131;
  __int16 v132;
  const char *v133;
  __int16 v134;
  const char *v135;
  __int16 v136;
  int v137;
  __int16 v138;
  id v139;

  v8 = a3;
  v11 = a4;
  v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269978, 8);
  v119 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v12, &v119));
  v14 = v119;

  if (!v13)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v46 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v49 = 45;
      if (isMetaClass)
        v49 = 43;
      v46(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v49, ClassName, Name, 389, v14);
    }
    v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v51 = NFSharedLogGetLogger(v50);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = object_getClass(self);
      if (class_isMetaClass(v53))
        v54 = 43;
      else
        v54 = 45;
      v55 = object_getClassName(self);
      v56 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v131 = v54;
      v132 = 2082;
      v133 = v55;
      v134 = 2082;
      v135 = v56;
      v136 = 1024;
      v137 = 389;
      v138 = 2114;
      v139 = v14;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }
    v57 = a2;

    v58 = objc_alloc((Class)NSError);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v59 = objc_msgSend(v14, "code");
    v128[0] = NSLocalizedDescriptionKey;
    v60 = v11;
    if ((uint64_t)objc_msgSend(v14, "code") > 70)
      v61 = 71;
    else
      v61 = (uint64_t)objc_msgSend(v14, "code");
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v61]));
    v129[0] = v88;
    v129[1] = v14;
    v128[1] = NSUnderlyingErrorKey;
    v128[2] = CFSTR("Line");
    v129[2] = &off_1002FDC50;
    v128[3] = CFSTR("Method");
    v89 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(v57));
    v129[3] = v89;
    v128[4] = NSDebugDescriptionErrorKey;
    v90 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(v57), 390);
    v129[4] = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v129, v128, 5));
    v92 = v58;
    goto LABEL_56;
  }
  if (objc_msgSend(v13, "status") != 36864)
  {
    v116 = v11;
    *a6 = (unsigned __int16)objc_msgSend(v13, "status");
    v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = NFLogGetLogger(v62);
    if (v63)
    {
      v64 = (void (*)(uint64_t, const char *, ...))v63;
      v65 = object_getClass(self);
      v66 = class_isMetaClass(v65);
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      v115 = objc_msgSend(v13, "status");
      v69 = 45;
      if (v66)
        v69 = 43;
      v64(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v69, v67, v68, 394, v115);
    }
    v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v71 = NFSharedLogGetLogger(v70);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v73 = object_getClass(self);
      if (class_isMetaClass(v73))
        v74 = 43;
      else
        v74 = 45;
      v75 = object_getClassName(self);
      v76 = sel_getName(a2);
      v77 = objc_msgSend(v13, "status");
      *(_DWORD *)buf = 67110146;
      v131 = v74;
      v132 = 2082;
      v133 = v75;
      v134 = 2082;
      v135 = v76;
      v136 = 1024;
      v137 = 394;
      v138 = 1024;
      LODWORD(v139) = v77;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
    }

    v78 = objc_msgSend(v13, "status");
    v79 = objc_alloc((Class)NSError);
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    if (v78 == 26277)
    {
      v126[0] = NSLocalizedDescriptionKey;
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
      v127[0] = v81;
      v127[1] = &off_1002FDC68;
      v126[1] = CFSTR("Line");
      v126[2] = CFSTR("Method");
      v82 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v127[2] = v82;
      v126[3] = NSDebugDescriptionErrorKey;
      v83 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 396);
      v127[3] = v83;
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v127, v126, 4));
      v85 = v79;
      v86 = v80;
      v87 = 24;
    }
    else
    {
      v124[0] = NSLocalizedDescriptionKey;
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
      v125[0] = v81;
      v125[1] = &off_1002FDC80;
      v124[1] = CFSTR("Line");
      v124[2] = CFSTR("Method");
      v82 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v125[2] = v82;
      v124[3] = NSDebugDescriptionErrorKey;
      v83 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 398);
      v125[3] = v83;
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v125, v124, 4));
      v85 = v79;
      v86 = v80;
      v87 = 16;
    }
    v43 = objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, v87, v84);

    v15 = v13;
    goto LABEL_41;
  }
  v118 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 128, 7, v8, 0, v11, &v118));
  v16 = v118;

  if (!v15)
  {
    v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v94 = NFLogGetLogger(v93);
    if (v94)
    {
      v95 = (void (*)(uint64_t, const char *, ...))v94;
      v96 = object_getClass(self);
      v97 = class_isMetaClass(v96);
      v98 = object_getClassName(self);
      v113 = sel_getName(a2);
      v99 = 45;
      if (v97)
        v99 = 43;
      v95(3, "%c[%{public}s %{public}s]:%i Nil response", v99, v98, v113, 408);
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
      v106 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v131 = v104;
      v132 = 2082;
      v133 = v105;
      v134 = 2082;
      v135 = v106;
      v136 = 1024;
      v137 = 408;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
    }

    v117 = objc_alloc((Class)NSError);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v59 = objc_msgSend(v16, "code");
    v122[0] = NSLocalizedDescriptionKey;
    v107 = (uint64_t)objc_msgSend(v16, "code");
    v14 = v16;
    v60 = v11;
    if (v107 > 70)
      v108 = 71;
    else
      v108 = (uint64_t)objc_msgSend(v14, "code");
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E5690[v108]));
    v123[0] = v88;
    v123[1] = v14;
    v122[1] = NSUnderlyingErrorKey;
    v122[2] = CFSTR("Line");
    v123[2] = &off_1002FDC98;
    v122[3] = CFSTR("Method");
    v89 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v123[3] = v89;
    v122[4] = NSDebugDescriptionErrorKey;
    v90 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 409);
    v123[4] = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 5));
    v92 = v117;
LABEL_56:
    v43 = objc_msgSend(v92, "initWithDomain:code:userInfo:", v15, v59, v91);

    v11 = v60;
    goto LABEL_57;
  }
  *a6 = (unsigned __int16)objc_msgSend(v15, "status");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response"));
  v18 = objc_msgSend(v17, "length");

  if ((unint64_t)v18 > 3)
  {
    v109 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response")));
    *a5 = *(_DWORD *)objc_msgSend(v109, "bytes");

    v43 = 0;
    *a5 = bswap32(*a5);
    v14 = v16;
    goto LABEL_57;
  }
  v116 = v11;
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFLogGetLogger(v19);
  if (v20)
  {
    v21 = (void (*)(uint64_t, const char *, ...))v20;
    v22 = object_getClass(self);
    v23 = class_isMetaClass(v22);
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response"));
    v114 = objc_msgSend(v26, "length");
    v27 = 45;
    if (v23)
      v27 = 43;
    v21(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v27, v24, v25, 416, v114);

  }
  v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v29 = NFSharedLogGetLogger(v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = object_getClass(self);
    if (class_isMetaClass(v31))
      v32 = 43;
    else
      v32 = 45;
    v33 = object_getClassName(self);
    v34 = sel_getName(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response"));
    v36 = objc_msgSend(v35, "length");
    *(_DWORD *)buf = 67110146;
    v131 = v32;
    v132 = 2082;
    v133 = v33;
    v134 = 2082;
    v135 = v34;
    v136 = 1024;
    v137 = 416;
    v138 = 2048;
    v139 = v36;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);

  }
  v37 = objc_alloc((Class)NSError);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v120[0] = NSLocalizedDescriptionKey;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
  v121[0] = v39;
  v121[1] = &off_1002FDCB0;
  v120[1] = CFSTR("Line");
  v120[2] = CFSTR("Method");
  v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v121[2] = v40;
  v120[3] = NSDebugDescriptionErrorKey;
  v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 417);
  v121[3] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v121, v120, 4));
  v43 = objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 13, v42);

  v14 = v16;
LABEL_41:
  v11 = v116;
LABEL_57:

  return v43;
}

- (id)recoverSLAM
{
  NFSecureElementWrapper *v3;
  NFSLAMShim *v4;
  NFSLAMShim *v5;
  void *v6;

  v3 = self;
  objc_opt_self(NFSLAMShim);
  v4 = objc_opt_new(NFSLAMShim);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_se, self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SLAMObjC PerformRecovery:logSink:](SLAMObjC, "PerformRecovery:logSink:", v5, v5));
  return v6;
}

- (NFSecureElementWrapper)initWithHandle:(id)a3
{
  id v5;
  NFSecureElementWrapper *v6;
  NFSecureElementWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureElementWrapper;
  v6 = -[NFSecureElementWrapper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handle, a3);

  return v7;
}

- (id)getAuthQueue
{
  NFSecureElementWrapper *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *authQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_authQueue)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, -1);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.nfcd.authorization", v6);
    authQueue = v2->_authQueue;
    v2->_authQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_set_specific((dispatch_queue_t)v2->_authQueue, kNFLOG_DISPATCH_SPECIFIC_KEY, 0, 0);
  }
  objc_sync_exit(v2);

  return v2->_authQueue;
}

- (BOOL)isProd
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = objc_msgSend(v2, "signingKeyType") == (id)2;

  return v3;
}

- (BOOL)hasMultiOS
{
  void *v3;
  BOOL v4;

  if (-[NFSecureElementHandleInterface identifier](self->_handle, "identifier") != 1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v4 = objc_msgSend(v3, "seType") == (id)6;

  return v4;
}

- (BOOL)isOperational
{
  NFSecureElementHandleInterface *handle;
  void *v4;
  void *v5;
  id v6;

  handle = self->_handle;
  if (!handle)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](handle, "info"));
  if (objc_msgSend(v4, "OSMode") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
    v6 = objc_msgSend(v5, "migrationState");

    if (v6 == (id)1)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (NSString)serialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));

  return (NSString *)v3;
}

- (NSData)serialNumberAsData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v3));

  return (NSData *)v4;
}

- (NSString)systemOSSerialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemOSSerialNumber"));

  return (NSString *)v3;
}

- (NSData)systemOSSerialNumberAsData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemOSSerialNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v3));

  return (NSData *)v4;
}

- (BOOL)isSecureElement:(int)a3
{
  return -[NFSecureElementHandleInterface identifier](self->_handle, "identifier") == a3;
}

- (NSString)rsaCertificate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rsaCertificate"));

  return (NSString *)v3;
}

- (NSString)eccCertificate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ecdsaCertificate"));

  return (NSString *)v3;
}

- (NSString)eckaCertificate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "eckaCertificate"));

  return (NSString *)v3;
}

- (id)transceiveData:(id)a3 toOS:(int64_t)a4 error:(id *)a5
{
  return -[NFSecureElementHandleInterface transceive:toOS:error:](self->_handle, "transceive:toOS:error:", a3, a4, a5);
}

- (unint64_t)supportedTechnologies
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = objc_msgSend(v2, "supportedTechnologies");

  return (unint64_t)v3;
}

- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 expectedLength:(unsigned __int16)a8 toOS:(int64_t)a9 useExtendedLength:(BOOL)a10 error:(id *)a11
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *specific;
  uint64_t Logger;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  const char *Name;
  id v62;
  id v64;
  id v65;
  id v66;
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[4];
  uint8_t buf[4];
  int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD v82[4];
  _QWORD v83[4];

  v11 = a8;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NFCommandAPDU buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:](NFCommandAPDU, "buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:", v15, v14, v13, v12, objc_msgSend(v16, "length"), a10));
  if (!v17)
  {
    if (!a11)
    {
      v19 = 0;
      goto LABEL_25;
    }
    v23 = objc_alloc((Class)NSError);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v82[0] = NSLocalizedDescriptionKey;
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "No resources"));
    v83[0] = v25;
    v83[1] = &off_1002FFBD0;
    v82[1] = CFSTR("Line");
    v82[2] = CFSTR("Method");
    v26 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v83[2] = v26;
    v82[3] = NSDebugDescriptionErrorKey;
    v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 157);
    v83[3] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 4));
    *a11 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 34, v28);

    goto LABEL_10;
  }
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v17, "appendData:", v16);
  v18 = objc_claimAutoreleasedReturnValue(+[NFCommandAPDU appendExpectedLength:usingExtendedLength:toAPDU:](NFCommandAPDU, "appendExpectedLength:usingExtendedLength:toAPDU:", v11, a10, v17));
  if (!v18)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper transceiveData:toOS:error:](self, "transceiveData:toOS:error:", v17, a9, a11));
    v24 = v30;
    if (!v30)
      goto LABEL_31;
    if ((unint64_t)objc_msgSend(v30, "length") > 1)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v24));
      if (v52)
      {
        v53 = v52;
        if (objc_msgSend(v52, "status") == 26277)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper delegate](self, "delegate"));
          objc_msgSend(v54, "secureElementReturnedRestrictedMode:os:", self, a9);

        }
        v25 = v53;
        v19 = 0;
        v29 = v25;
        goto LABEL_28;
      }
      if (a11)
      {
        v66 = objc_alloc((Class)NSError);
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v68[0] = NSLocalizedDescriptionKey;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "No resources"));
        v69[0] = v56;
        v69[1] = &off_1002FFC18;
        v68[1] = CFSTR("Line");
        v68[2] = CFSTR("Method");
        v57 = v24;
        v58 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v69[2] = v58;
        v68[3] = NSDebugDescriptionErrorKey;
        v59 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 184);
        v69[3] = v59;
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 4));
        *a11 = objc_msgSend(v66, "initWithDomain:code:userInfo:", v55, 34, v60);

        v24 = v57;
      }
      v25 = 0;
      goto LABEL_10;
    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v33 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v37 = 45;
      if (isMetaClass)
        v37 = 43;
      v33(3, "%c[%{public}s %{public}s]:%i Not enought byte to create response", v37, ClassName, Name, 177);
    }
    v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v39 = NFSharedLogGetLogger(v38);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = object_getClass(self);
      if (class_isMetaClass(v41))
        v42 = 43;
      else
        v42 = 45;
      *(_DWORD *)buf = 67109890;
      v73 = v42;
      v74 = 2082;
      v75 = object_getClassName(self);
      v76 = 2082;
      v77 = sel_getName(a2);
      v78 = 1024;
      v79 = 177;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not enought byte to create response", buf, 0x22u);
    }

    if (!a11)
    {
LABEL_31:
      v19 = 0;
      v29 = 0;
      goto LABEL_29;
    }
    v65 = objc_alloc((Class)NSError);
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v70[0] = NSLocalizedDescriptionKey;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v71[0] = v43;
    v71[1] = &off_1002FFC00;
    v70[1] = CFSTR("Line");
    v70[2] = CFSTR("Method");
    v44 = v24;
    v45 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v71[2] = v45;
    v70[3] = NSDebugDescriptionErrorKey;
    v46 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 178);
    v71[3] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 4));
    *a11 = objc_msgSend(v65, "initWithDomain:code:userInfo:", v25, 13, v47);

    v24 = v44;
LABEL_10:
    v19 = 0;
    v29 = 0;
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  v19 = (void *)v18;
  if (a11)
  {
    v64 = objc_alloc((Class)NSError);
    v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v21 = objc_msgSend(v19, "code");
    v80[0] = NSLocalizedDescriptionKey;
    v62 = v16;
    if ((uint64_t)objc_msgSend(v19, "code") > 70)
      v22 = 71;
    else
      v22 = (uint64_t)objc_msgSend(v19, "code");
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E92C8[v22]));
    v81[0] = v25;
    v81[1] = v19;
    v80[1] = NSUnderlyingErrorKey;
    v80[2] = CFSTR("Line");
    v81[2] = &off_1002FFBE8;
    v80[3] = CFSTR("Method");
    v48 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v81[3] = v48;
    v80[4] = NSDebugDescriptionErrorKey;
    v49 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 167);
    v81[4] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 5));
    *a11 = objc_msgSend(v64, "initWithDomain:code:userInfo:", v20, v21, v50);
    v24 = (void *)v20;

    v29 = 0;
    v16 = v62;
    goto LABEL_28;
  }
LABEL_25:
  v29 = 0;
LABEL_30:

  return v29;
}

- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 error:(id *)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:useExtendedLength:error:](self, "sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:useExtendedLength:error:", a3, a4, a5, a6, a7, 0, 0, v9, a8);
}

- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 expectedLength:(unsigned __int8)a8 toOS:(int64_t)a9 error:(id *)a10
{
  uint64_t v11;

  LOBYTE(v11) = 0;
  return -[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:useExtendedLength:error:](self, "sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:useExtendedLength:error:", a3, a4, a5, a6, a7, a8, a9, v11, a10);
}

- (id)sendRepeatingExtendedCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 firstP2:(unsigned __int8)a6 nextP2:(unsigned __int8)a7 expectedLength:(unsigned __int16)a8 toOS:(int64_t)a9 error:(id *)a10
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  BOOL v18;
  id v19;
  id *p_isa;
  void *v21;
  id v22;
  NSMutableData *v23;
  NSMutableData *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  NSMutableData *v32;
  NSMutableData *v33;
  id v34;
  id v35;
  void *v36;
  void *specific;
  uint64_t Logger;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *Class;
  const char *ClassName;
  const char *Name;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  unsigned int v51;
  uint64_t v53;
  id v54;
  void *v55;
  _BOOL4 isMetaClass;
  NSMutableData *v58;
  id v59;
  unsigned __int8 v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  unsigned int v70;
  _QWORD v71[4];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[4];

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v60 = a7;
  v58 = objc_opt_new(NSMutableData);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NFCommandAPDU buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:](NFCommandAPDU, "buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:", v15, v14, v13, v12, 0, 1));
  if (v17)
  {
    v18 = v11 != (_DWORD)v12;
    v19 = +[NFCommandAPDU appendExpectedLength:usingExtendedLength:toAPDU:](NFCommandAPDU, "appendExpectedLength:usingExtendedLength:toAPDU:", v10, 1, v17);
    p_isa = (id *)&v58->super.super.isa;
    while (1)
    {
      v59 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper transceiveData:toOS:error:](self, "transceiveData:toOS:error:", v17, a9, &v59));
      v22 = v59;
      v23 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v21));
      v24 = v23;
      if (v22)
      {
        p_isa = a10;
        if (!a10)
        {
          v33 = v58;
          goto LABEL_32;
        }
        *a10 = objc_retainAutorelease(v22);
        v33 = v58;
        goto LABEL_17;
      }
      if (!v23)
        break;
      if (-[NSMutableData status](v23, "status") == 36864)
        goto LABEL_30;
      if (-[NSMutableData status](v24, "status") != 25360
        && -[NSMutableData status](v24, "status") != 37008)
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
          v53 = -[NSMutableData status](v24, "status");
          v43 = 45;
          if (isMetaClass)
            v43 = 43;
          v39(3, "%c[%{public}s %{public}s]:%i Failed to query, status word is 0x%x", v43, ClassName, Name, 276, v53);
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
          v49 = object_getClassName(self);
          v50 = sel_getName(a2);
          v51 = -[NSMutableData status](v24, "status");
          *(_DWORD *)buf = 67110146;
          v62 = v48;
          v63 = 2082;
          v64 = v49;
          v65 = 2082;
          v66 = v50;
          v67 = 1024;
          v68 = 276;
          v69 = 1024;
          v70 = v51;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query, status word is 0x%x", buf, 0x28u);
        }

        if (a10)
          *a10 = 0;
LABEL_30:
        v33 = (NSMutableData *)objc_claimAutoreleasedReturnValue(-[NSMutableData data](v24, "data"));
        -[NSMutableData appendData:](v58, "appendData:", v33);
LABEL_32:
        v32 = (NSMutableData *)p_isa;

        p_isa = (id *)&v24->super.super.isa;
        goto LABEL_33;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData response](v24, "response"));
      -[NSMutableData appendData:](v58, "appendData:", v25);

      if (v18)
        objc_msgSend(v17, "replaceBytesInRange:withBytes:length:", 3, 1, &v60, 1);

      v18 = 0;
    }
    if (a10)
    {
      v54 = objc_alloc((Class)NSError);
      v33 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v71[0] = NSLocalizedDescriptionKey;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
      v72[0] = v55;
      v72[1] = &off_1002FFC48;
      v71[1] = CFSTR("Line");
      v71[2] = CFSTR("Method");
      v34 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v72[2] = v34;
      v71[3] = NSDebugDescriptionErrorKey;
      v35 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 263);
      v72[3] = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 4));
      *a10 = objc_msgSend(v54, "initWithDomain:code:userInfo:", v33, 13, v36);

      v24 = v58;
LABEL_17:
      p_isa = 0;
      goto LABEL_32;
    }
    v22 = 0;
    v32 = 0;
LABEL_33:

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v32));
    goto LABEL_34;
  }
  if (a10)
  {
    v26 = objc_alloc((Class)NSError);
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v73[0] = NSLocalizedDescriptionKey;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "No resources"));
    v74[0] = v27;
    v74[1] = &off_1002FFC30;
    v73[1] = CFSTR("Line");
    v73[2] = CFSTR("Method");
    v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v74[2] = v28;
    v73[3] = NSDebugDescriptionErrorKey;
    v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 249);
    v74[3] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 4));
    *a10 = objc_msgSend(v26, "initWithDomain:code:userInfo:", v22, 34, v30);

    v31 = 0;
    v32 = v58;
LABEL_34:

    goto LABEL_35;
  }
  v31 = 0;
  v32 = v58;
LABEL_35:

  return v31;
}

- (id)getData:(unsigned __int8)a3 tag:(unsigned int)a4 data:(id)a5 error:(id *)a6
{
  return -[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", a3, 202, BYTE1(a4), a4, a5, a6);
}

- (id)readBinary:(unsigned __int8)a3 offset:(unsigned int)a4 tag:(unsigned int)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  __int16 v13;

  v8 = a3;
  v13 = bswap32(a5) >> 16;
  v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", v8, 176, (a4 >> 8) & 0x7F, a4, v10, a6));

  return v11;
}

- (id)selectByName:(id)a3 error:(id *)a4
{
  return -[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](self, "sendCommandWithClass:instruction:p1:p2:data:error:", 0, 164, 4, 0, a3, a4);
}

- (id)getData:(unsigned int)a3
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  int v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *Name;
  uint64_t v52;
  id v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  unsigned int v63;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper getData:tag:data:error:](self, "getData:tag:data:error:", 128, *(_QWORD *)&a3, 0, 0));
  v7 = v6;
  if (!v6)
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
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Command failed", v17, ClassName, Name, 337);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v9 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    *(_DWORD *)buf = 67109890;
    v55 = v21;
    v56 = 2082;
    v57 = object_getClassName(self);
    v58 = 2082;
    v59 = sel_getName(a2);
    v60 = 1024;
    v61 = 337;
    v22 = "%c[%{public}s %{public}s]:%i Command failed";
    v23 = v9;
    v24 = 34;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
LABEL_34:
    v10 = 0;
    goto LABEL_35;
  }
  if (objc_msgSend(v6, "status") != 36864)
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
      v52 = objc_msgSend(v7, "status");
      v32 = 45;
      if (v29)
        v32 = 43;
      v27(3, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", v32, v30, v31, 341, v52);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v9 = objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v35 = object_getClass(self);
    if (class_isMetaClass(v35))
      v36 = 43;
    else
      v36 = 45;
    *(_DWORD *)buf = 67110146;
    v55 = v36;
    v56 = 2082;
    v57 = object_getClassName(self);
    v58 = 2082;
    v59 = sel_getName(a2);
    v60 = 1024;
    v61 = 341;
    v62 = 1024;
    v63 = objc_msgSend(v7, "status");
    v22 = "%c[%{public}s %{public}s]:%i Returned error: 0x%04x";
    v23 = v9;
    v24 = 40;
    goto LABEL_23;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "response"));
  v9 = objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithData:](NFTLV, "TLVWithData:", v8));

  if (-[NSObject tag](v9, "tag") != a3)
  {
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    if (v38)
    {
      v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      v41 = class_isMetaClass(v40);
      v42 = object_getClassName(self);
      v43 = sel_getName(a2);
      v53 = -[NSObject tag](v9, "tag");
      v44 = 45;
      if (v41)
        v44 = 43;
      v39(3, "%c[%{public}s %{public}s]:%i Unexpected tag: 0x%x", v44, v42, v43, 347, v53);
    }
    v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v46 = NFSharedLogGetLogger(v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = object_getClass(self);
      if (class_isMetaClass(v48))
        v49 = 43;
      else
        v49 = 45;
      *(_DWORD *)buf = 67110146;
      v55 = v49;
      v56 = 2082;
      v57 = object_getClassName(self);
      v58 = 2082;
      v59 = sel_getName(a2);
      v60 = 1024;
      v61 = 347;
      v62 = 1024;
      v63 = -[NSObject tag](v9, "tag");
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected tag: 0x%x", buf, 0x28u);
    }

    goto LABEL_34;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject value](v9, "value"));
LABEL_35:

  return v10;
}

- (id)getData:(unsigned int)a3 subtag:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *specific;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *v33;
  _BOOL4 v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  objc_class *v40;
  int v41;
  const char *v42;
  const char *v43;
  unsigned int v44;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  unsigned int v59;
  void *v60;
  uint64_t v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  _BOOL4 v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  id v75;
  const char *Name;
  uint64_t v78;
  id v79;
  id v80;
  __int16 v81;
  uint8_t buf[4];
  int v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  id v91;

  v4 = *(_QWORD *)&a3;
  v81 = bswap32(a4) >> 16;
  v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v81, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper getData:tag:data:error:](self, "getData:tag:data:error:", 128, v4, v7, 0));

  if (!v8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v20 = 45;
      if (isMetaClass)
        v20 = 43;
      v16(3, "%c[%{public}s %{public}s]:%i Command failed", v20, ClassName, Name, 365);
    }
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFSharedLogGetLogger(v21);
    v10 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v23 = object_getClass(self);
    if (class_isMetaClass(v23))
      v24 = 43;
    else
      v24 = 45;
    v25 = object_getClassName(self);
    v26 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v83 = v24;
    v84 = 2082;
    v85 = v25;
    v86 = 2082;
    v87 = v26;
    v88 = 1024;
    v89 = 365;
    v27 = "%c[%{public}s %{public}s]:%i Command failed";
    v28 = v10;
    v29 = 34;
    goto LABEL_24;
  }
  if (objc_msgSend(v8, "status") == 36864)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
    v10 = objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithData:](NFTLV, "TLVWithData:", v9));

    if (-[NSObject tag](v10, "tag") == (_DWORD)v4)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[NSObject children](v10, "children"));
      if (-[NSObject count](v11, "count") == (id)1)
      {
        v12 = objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject value](v12, "value"));
        v10 = v12;
LABEL_46:

        goto LABEL_47;
      }
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = NFLogGetLogger(v60);
      if (v61)
      {
        v62 = (void (*)(uint64_t, const char *, ...))v61;
        v63 = object_getClass(self);
        v64 = class_isMetaClass(v63);
        v65 = object_getClassName(self);
        v66 = sel_getName(a2);
        v80 = -[NSObject count](v11, "count");
        v67 = 45;
        if (v64)
          v67 = 43;
        v62(3, "%c[%{public}s %{public}s]:%i Unexpected child count: %ld", v67, v65, v66, 381, v80);
      }
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFSharedLogGetLogger(v68);
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        v71 = object_getClass(self);
        if (class_isMetaClass(v71))
          v72 = 43;
        else
          v72 = 45;
        v73 = object_getClassName(self);
        v74 = sel_getName(a2);
        v75 = -[NSObject count](v11, "count");
        *(_DWORD *)buf = 67110146;
        v83 = v72;
        v84 = 2082;
        v85 = v73;
        v86 = 2082;
        v87 = v74;
        v88 = 1024;
        v89 = 381;
        v90 = 2048;
        v91 = v75;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected child count: %ld", buf, 0x2Cu);
      }

    }
    else
    {
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = NFLogGetLogger(v45);
      if (v46)
      {
        v47 = (void (*)(uint64_t, const char *, ...))v46;
        v48 = object_getClass(self);
        v49 = class_isMetaClass(v48);
        v50 = object_getClassName(self);
        v51 = sel_getName(a2);
        v79 = -[NSObject tag](v10, "tag");
        v52 = 45;
        if (v49)
          v52 = 43;
        v47(3, "%c[%{public}s %{public}s]:%i Unexpected tag: 0x%x", v52, v50, v51, 375, v79);
      }
      v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v54 = NFSharedLogGetLogger(v53);
      v11 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v55 = object_getClass(self);
        if (class_isMetaClass(v55))
          v56 = 43;
        else
          v56 = 45;
        v57 = object_getClassName(self);
        v58 = sel_getName(a2);
        v59 = -[NSObject tag](v10, "tag");
        *(_DWORD *)buf = 67110146;
        v83 = v56;
        v84 = 2082;
        v85 = v57;
        v86 = 2082;
        v87 = v58;
        v88 = 1024;
        v89 = 375;
        v90 = 1024;
        LODWORD(v91) = v59;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected tag: 0x%x", buf, 0x28u);
      }
    }
    v13 = 0;
    goto LABEL_46;
  }
  v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v31 = NFLogGetLogger(v30);
  if (v31)
  {
    v32 = (void (*)(uint64_t, const char *, ...))v31;
    v33 = object_getClass(self);
    v34 = class_isMetaClass(v33);
    v35 = object_getClassName(self);
    v36 = sel_getName(a2);
    v78 = objc_msgSend(v8, "status");
    v37 = 45;
    if (v34)
      v37 = 43;
    v32(3, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", v37, v35, v36, 369, v78);
  }
  v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v39 = NFSharedLogGetLogger(v38);
  v10 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v40 = object_getClass(self);
    if (class_isMetaClass(v40))
      v41 = 43;
    else
      v41 = 45;
    v42 = object_getClassName(self);
    v43 = sel_getName(a2);
    v44 = objc_msgSend(v8, "status");
    *(_DWORD *)buf = 67110146;
    v83 = v41;
    v84 = 2082;
    v85 = v42;
    v86 = 2082;
    v87 = v43;
    v88 = 1024;
    v89 = 369;
    v90 = 1024;
    LODWORD(v91) = v44;
    v27 = "%c[%{public}s %{public}s]:%i Returned error: 0x%04x";
    v28 = v10;
    v29 = 40;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
  }
LABEL_25:
  v13 = 0;
LABEL_47:

  return v13;
}

- (BOOL)select:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  const char *Name;
  uint64_t v39;
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
  unsigned int v51;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", a3));
  v8 = v7;
  if (!v7)
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
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Command failed", v15, ClassName, Name, 394);
    }
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(self);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      *(_DWORD *)buf = 67109890;
      v43 = v20;
      v44 = 2082;
      v45 = object_getClassName(self);
      v46 = 2082;
      v47 = sel_getName(a2);
      v48 = 1024;
      v49 = 394;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Command failed", buf, 0x22u);
    }
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "status") == 36864)
  {
    LOBYTE(a4) = 1;
    goto LABEL_25;
  }
  v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v22 = NFLogGetLogger(v21);
  if (v22)
  {
    v23 = (void (*)(uint64_t, const char *, ...))v22;
    v24 = object_getClass(self);
    v25 = class_isMetaClass(v24);
    v26 = object_getClassName(self);
    v27 = sel_getName(a2);
    v39 = objc_msgSend(v8, "status");
    v28 = 45;
    if (v25)
      v28 = 43;
    v23(3, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", v28, v26, v27, 399, v39);
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
    *(_DWORD *)buf = 67110146;
    v43 = v33;
    v44 = 2082;
    v45 = object_getClassName(self);
    v46 = 2082;
    v47 = sel_getName(a2);
    v48 = 1024;
    v49 = 399;
    v50 = 1024;
    v51 = objc_msgSend(v8, "status");
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", buf, 0x28u);
  }

  if (a4)
  {
    v34 = objc_alloc((Class)NSError);
    v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v40 = NSLocalizedDescriptionKey;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v41 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    *a4 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v18, 16, v36);

LABEL_24:
    LOBYTE(a4) = 0;
  }
LABEL_25:

  return (char)a4;
}

- (BOOL)selectApplet:(id)a3 error:(id *)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifierAsData"));
  LOBYTE(a4) = -[NFSecureElementWrapper select:error:](self, "select:error:", v6, a4);

  return (char)a4;
}

- (id)selectCRSWithError:(id *)a3
{
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  void *specific;
  uint64_t Logger;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  unsigned int v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  NSObject *v64;
  unsigned int v65;
  const char *v67;
  const char *v68;
  uint64_t v69;
  id *v70;
  id v71;
  NSErrorUserInfoKey v72;
  void *v73;
  NSErrorUserInfoKey v74;
  void *v75;
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  uint8_t buf[4];
  _BYTE v81[14];
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  id v87;

  v6 = NFSharedSignpostLog(self);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SELECT_CRS", "begin", buf, 2u);
  }

  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A520, 9);
  v71 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v8, &v71));
  v10 = v71;

  if (v9)
  {
    v11 = objc_msgSend(v9, "status");
    if ((_DWORD)v11 == 36864)
    {
      v12 = NFSharedSignpostLog(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SELECT_CRS", "end", buf, 2u);
      }

      v14 = v9;
    }
    else
    {
      v70 = a3;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v36 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v69 = objc_msgSend(v9, "status");
        v41 = 45;
        if (isMetaClass)
          v41 = 43;
        v36(3, "%c[%{public}s %{public}s]:%i Failed to select CRS: 0x%04x", v41, ClassName, Name, 432, v69);
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
        v49 = objc_msgSend(v9, "status");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v81 = v46;
        *(_WORD *)&v81[4] = 2082;
        *(_QWORD *)&v81[6] = v47;
        v82 = 2082;
        v83 = v48;
        v84 = 1024;
        v85 = 432;
        v86 = 1024;
        LODWORD(v87) = v49;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select CRS: 0x%04x", buf, 0x28u);
      }

      v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Received non-9000 response from SE. Response: 0x%04X"), objc_msgSend(v9, "status"));
      v76[0] = CFSTR("Applet Identifier");
      v51 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A520, 9);
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "NF_asHexString"));
      v77[0] = v52;
      v77[1] = CFSTR("Other Bug");
      v76[1] = CFSTR("Classification");
      v76[2] = CFSTR("FailureKey");
      v77[2] = CFSTR("ttrTransaction");
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 3));
      sub_100187C44((uint64_t)NFBugCapture, CFSTR("Failed to select CRS"), v50, v53);

      LODWORD(v52) = objc_msgSend(v9, "status");
      v54 = objc_alloc((Class)NSError);
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if ((_DWORD)v52 == 26277)
      {
        v74 = NSLocalizedDescriptionKey;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Restricted Mode"));
        v75 = v56;
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1));
        v58 = v54;
        v59 = v55;
        v60 = 24;
      }
      else
      {
        v72 = NSLocalizedDescriptionKey;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v73 = v56;
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1));
        v58 = v54;
        v59 = v55;
        v60 = 16;
      }
      v61 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, v60, v57);

      v62 = +[NFExceptionsCALogger postAnalyticsSEFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsSEFailureEvent:context:error:", 7, v50, v61);
      if (v70)
      {
        v62 = objc_retainAutorelease(v61);
        *v70 = v62;
      }
      v63 = NFSharedSignpostLog(v62);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_signpost_enabled(v64))
      {
        v65 = objc_msgSend(v9, "status");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v81 = v65;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SELECT_CRS", "failed; RPDU status: 0x%04x",
          buf,
          8u);
      }

      v14 = 0;
      v10 = v61;
    }
  }
  else
  {
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFLogGetLogger(v15);
    if (v16)
    {
      v17 = (void (*)(uint64_t, const char *, ...))v16;
      v18 = object_getClass(self);
      v19 = class_isMetaClass(v18);
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      v20 = 45;
      if (v19)
        v20 = 43;
      v17(3, "%c[%{public}s %{public}s]:%i Failed to select CRS: %{public}@", v20, v67, v68, 419, v10);
    }
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFSharedLogGetLogger(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v81 = v25;
      *(_WORD *)&v81[4] = 2082;
      *(_QWORD *)&v81[6] = v26;
      v82 = 2082;
      v83 = v27;
      v84 = 1024;
      v85 = 419;
      v86 = 2114;
      v87 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select CRS: %{public}@", buf, 0x2Cu);
    }

    v78[0] = CFSTR("Applet Identifier");
    v28 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A520, 9);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "NF_asHexString"));
    v79[0] = v29;
    v79[1] = CFSTR("Other Bug");
    v78[1] = CFSTR("Classification");
    v78[2] = CFSTR("FailureKey");
    v79[2] = CFSTR("ttrTransaction");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 3));
    sub_100187C44((uint64_t)NFBugCapture, CFSTR("Failed to select CRS"), CFSTR("No response from SE"), v30);

    v31 = +[NFExceptionsCALogger postAnalyticsSEFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsSEFailureEvent:context:error:", 7, CFSTR("No response from SE"), v10);
    if (a3)
    {
      v31 = objc_retainAutorelease(v10);
      *a3 = v31;
    }
    v32 = NFSharedSignpostLog(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_signpost_enabled(v33))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v81 = v10;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SELECT_CRS", "failed: %@", buf, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

- (id)readBinary:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;
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
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  int v34;
  const char *Name;
  uint64_t v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  unsigned int v47;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper readBinary:offset:tag:error:](self, "readBinary:offset:tag:error:", 0, 0, *(_QWORD *)&a3, 0));
  v6 = v5;
  if (!v5)
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
      v10(3, "%c[%{public}s %{public}s]:%i Command failed", v14, ClassName, Name, 461);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67109890;
    v39 = v19;
    v40 = 2082;
    v41 = object_getClassName(self);
    v42 = 2082;
    v43 = sel_getName(a2);
    v44 = 1024;
    v45 = 461;
    v20 = "%c[%{public}s %{public}s]:%i Command failed";
    v21 = v17;
    v22 = 34;
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "status") != 36864)
  {
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFLogGetLogger(v23);
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(self);
      v27 = class_isMetaClass(v26);
      v28 = object_getClassName(self);
      v29 = sel_getName(a2);
      v37 = objc_msgSend(v6, "status");
      v30 = 45;
      if (v27)
        v30 = 43;
      v25(3, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", v30, v28, v29, 465, v37);
    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v17 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v33 = object_getClass(self);
    if (class_isMetaClass(v33))
      v34 = 43;
    else
      v34 = 45;
    *(_DWORD *)buf = 67110146;
    v39 = v34;
    v40 = 2082;
    v41 = object_getClassName(self);
    v42 = 2082;
    v43 = sel_getName(a2);
    v44 = 1024;
    v45 = 465;
    v46 = 1024;
    v47 = objc_msgSend(v6, "status");
    v20 = "%c[%{public}s %{public}s]:%i Returned error: 0x%04x";
    v21 = v17;
    v22 = 40;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
LABEL_23:

    v7 = 0;
    goto LABEL_24;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "response"));
LABEL_24:

  return v7;
}

- (id)queryISDCounter:(id *)a3
{
  id v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  id v31;
  void *v32;
  void *v33;
  const char *Name;
  id v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;

  v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A529, 8);
  v36 = 0;
  v7 = -[NFSecureElementWrapper select:error:](self, "select:error:", v6, &v36);
  v8 = v36;

  if ((v7 & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper getData:](self, "getData:", 193));
    v10 = (void *)v9;
    if (a3 && !v9)
    {
      v11 = objc_alloc((Class)NSError);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v37[0] = NSLocalizedDescriptionKey;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Decoding Error"));
      v38[0] = v13;
      v38[1] = &off_1002FFC60;
      v37[1] = CFSTR("Line");
      v37[2] = CFSTR("Method");
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v38[2] = v14;
      v37[3] = NSDebugDescriptionErrorKey;
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 495);
      v38[3] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 4));
      *a3 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 23, v16);

LABEL_16:
      v10 = 0;
    }
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v23 = 45;
      if (isMetaClass)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Failed to select ISD", v23, ClassName, Name, 477);
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
      *(_DWORD *)buf = 67109890;
      v42 = v28;
      v43 = 2082;
      v44 = v29;
      v45 = 2082;
      v46 = v30;
      v47 = 1024;
      v48 = 477;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select ISD", buf, 0x22u);
    }

    v39[0] = CFSTR("Applet Identifier");
    v31 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A529, 8);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "NF_asHexString"));
    v40[0] = v32;
    v40[1] = CFSTR("Other Bug");
    v39[1] = CFSTR("Classification");
    v39[2] = CFSTR("FailureKey");
    v40[2] = CFSTR("ttrTransaction");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 3));
    sub_100187C44((uint64_t)NFBugCapture, CFSTR("Failed to select ISD"), CFSTR("No response from SE"), v33);

    +[NFExceptionsCALogger postAnalyticsSEFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsSEFailureEvent:context:error:", 8, CFSTR("No response from SE"), v8);
    if (!a3)
      goto LABEL_16;
    v10 = 0;
    *a3 = objc_retainAutorelease(v8);
  }

  return v10;
}

- (id)refreshISDCounter
{
  return 0;
}

- (id)checkDeepSleepTimerRunning:(unint64_t *)a3
{
  NFSecureElementWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
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
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  char v66;
  uint64_t v67;
  void *k;
  void *v69;
  void *v70;
  uint64_t v71;
  void (*v72)(uint64_t, const char *, ...);
  objc_class *v73;
  _BOOL4 v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  objc_class *v81;
  int v82;
  const char *v83;
  const char *v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  const char *v88;
  void *v89;
  char *v90;
  id v91;
  id v92;
  unint64_t v93;
  uint64_t v94;
  void *i;
  void *v96;
  void *specific;
  uint64_t Logger;
  void (*v99)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  NSObject *v107;
  objc_class *v108;
  int v109;
  const char *v110;
  const char *v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void (*v132)(uint64_t, const char *, ...);
  objc_class *v133;
  _BOOL4 v134;
  id v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  NSObject *v141;
  objc_class *v142;
  int v143;
  const char *v144;
  const char *v145;
  unsigned int v146;
  id v147;
  void *v148;
  uint64_t v149;
  void (*v150)(uint64_t, const char *, ...);
  objc_class *v151;
  _BOOL4 v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  NSObject *v158;
  objc_class *v159;
  int v160;
  const char *v161;
  const char *v162;
  unsigned int v163;
  id v164;
  id v165;
  void *v166;
  id v167;
  uint64_t v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  char *v178;
  id v179;
  id v180;
  uint64_t v181;
  void *j;
  void *v183;
  unsigned int v184;
  BOOL v185;
  void *v186;
  uint64_t v187;
  void (*v188)(uint64_t, const char *, ...);
  objc_class *v189;
  _BOOL4 v190;
  const char *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  NSObject *v196;
  objc_class *v197;
  int v198;
  const char *v199;
  const char *v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int v203;
  void *v204;
  uint64_t v205;
  void (*v206)(uint64_t, const char *, ...);
  objc_class *v207;
  _BOOL4 v208;
  const char *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  uint64_t v213;
  NSObject *v214;
  objc_class *v215;
  int v216;
  const char *v217;
  const char *v218;
  unsigned int v219;
  id v220;
  id v221;
  void *v222;
  id v223;
  uint64_t v224;
  void *v225;
  id v226;
  id v227;
  void *v228;
  void *v229;
  void *v230;
  uint64_t v231;
  id v232;
  void *v233;
  id v234;
  id v235;
  void *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  const char *v240;
  const char *v241;
  const char *v242;
  const char *v243;
  const char *v244;
  const char *v245;
  id v246;
  id v247;
  uint64_t v248;
  uint64_t v249;
  id v250;
  uint64_t v251;
  id v252;
  id v253;
  id v254;
  id v255;
  void *v256;
  void *v257;
  void *v258;
  unint64_t *v259;
  unint64_t *v260;
  void *v261;
  void *v262;
  char *sel;
  char *sela;
  SEL v265;
  NFSecureElementWrapper *v266;
  id v267;
  id v268;
  __int16 v269;
  id v270;
  NSErrorUserInfoKey v271;
  void *v272;
  uint8_t v273[8];
  __int16 v274;
  const char *v275;
  __int16 v276;
  const char *v277;
  __int16 v278;
  int v279;
  __int16 v280;
  unsigned int v281;
  __int16 v282;
  unsigned int v283;
  uint8_t v284[48];
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  uint8_t buf[8];
  _BYTE v291[32];
  uint8_t v292[48];
  __int128 v293;

  if (!a3)
  {
    v15 = objc_alloc((Class)NSError);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v271 = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v272 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v272, &v271, 1));
    v19 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 10, v18);

    return v19;
  }
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper handle](self, "handle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
  v7 = objc_msgSend(v6, "seType");

  v266 = v4;
  if (v7 == (id)6)
  {
    if (v4)
    {
      v21 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A529, 8);
      v270 = 0;
      v22 = -[NFSecureElementWrapper select:error:](v4, "select:error:", v21, &v270);
      v10 = v270;

      if ((v22 & 1) != 0)
      {
        v269 = 24543;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v269, 2));
        v268 = v10;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](v4, "sendCommandWithClass:instruction:p1:p2:data:error:", 0, 202, 0, 254, v23, &v268));
        v25 = v268;

        if (objc_msgSend(v24, "status") == 26277)
        {
          v14 = 0;
          *a3 = 87000;
        }
        else
        {
          v262 = v25;
          if (objc_msgSend(v24, "status") == 36864)
          {
            v258 = v24;
            v260 = a3;
            v293 = 0u;
            memset(v292, 0, sizeof(v292));
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "data"));
            v90 = (char *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVsWithData:](NFTLV, "TLVsWithData:", v89));

            sel = v90;
            v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", v292, buf, 16);
            if (v91)
            {
              v92 = v91;
              v93 = 0;
              v94 = **(_QWORD **)&v292[16];
              do
              {
                for (i = 0; i != v92; i = (char *)i + 1)
                {
                  if (**(_QWORD **)&v292[16] != v94)
                    objc_enumerationMutation(sel);
                  v96 = *(void **)(*(_QWORD *)&v292[8] + 8 * (_QWORD)i);
                  if (objc_msgSend(v96, "tag") == 241
                    && objc_msgSend(v96, "valueAsUnsignedLong"))
                  {
                    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    Logger = NFLogGetLogger(specific);
                    if (Logger)
                    {
                      v99 = (void (*)(uint64_t, const char *, ...))Logger;
                      Class = object_getClass(v4);
                      isMetaClass = class_isMetaClass(Class);
                      ClassName = object_getClassName(v4);
                      Name = sel_getName("_checkDeepSleepTimerRunningEOS:");
                      v247 = objc_msgSend(v96, "tag");
                      v253 = objc_msgSend(v96, "valueAsUnsignedLong");
                      v104 = 45;
                      if (isMetaClass)
                        v104 = 43;
                      v241 = ClassName;
                      v4 = v266;
                      v99(5, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v104, v241, Name, 687, v247, v253);
                    }
                    v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v106 = NFSharedLogGetLogger(v105);
                    v107 = objc_claimAutoreleasedReturnValue(v106);
                    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                    {
                      v108 = object_getClass(v4);
                      if (class_isMetaClass(v108))
                        v109 = 43;
                      else
                        v109 = 45;
                      v110 = object_getClassName(v4);
                      v111 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                      v112 = objc_msgSend(v96, "tag");
                      v113 = objc_msgSend(v96, "valueAsUnsignedLong");
                      *(_DWORD *)v284 = 67110402;
                      *(_DWORD *)&v284[4] = v109;
                      *(_WORD *)&v284[8] = 2082;
                      *(_QWORD *)&v284[10] = v110;
                      *(_WORD *)&v284[18] = 2082;
                      *(_QWORD *)&v284[20] = v111;
                      *(_WORD *)&v284[28] = 1024;
                      *(_DWORD *)&v284[30] = 687;
                      *(_WORD *)&v284[34] = 1024;
                      *(_DWORD *)&v284[36] = v112;
                      v4 = v266;
                      *(_WORD *)&v284[40] = 1024;
                      *(_DWORD *)&v284[42] = v113;
                      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v284, 0x2Eu);
                    }

                    v114 = objc_msgSend(v96, "valueAsUnsignedLong");
                    if (v93 <= v114)
                      v93 = v114;
                  }
                }
                v92 = objc_msgSend(sel, "countByEnumeratingWithState:objects:count:", v292, buf, 16);
              }
              while (v92);
            }
            else
            {
              v93 = 0;
            }

            v269 = 24287;
            v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v269, 2));
            v267 = v262;
            v176 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:](v4, "sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:", 0, 202, 0, 254, v175, 0, 2, &v267));
            v255 = v267;

            v256 = v176;
            if (objc_msgSend(v176, "status") == 36864)
            {
              v288 = 0u;
              v289 = 0u;
              v286 = 0u;
              v287 = 0u;
              v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "data"));
              v178 = (char *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVsWithData:](NFTLV, "TLVsWithData:", v177));

              sela = v178;
              v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v286, v284, 16);
              if (v179)
              {
                v180 = v179;
                v181 = *(_QWORD *)v287;
                do
                {
                  for (j = 0; j != v180; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v287 != v181)
                      objc_enumerationMutation(sela);
                    v183 = *(void **)(*((_QWORD *)&v286 + 1) + 8 * (_QWORD)j);
                    v184 = objc_msgSend(v183, "tag");
                    v185 = v184 - 128 > 0x20 || ((1 << (v184 + 0x80)) & 0x100010001) == 0;
                    if (!v185 && objc_msgSend(v183, "valueAsUnsignedLong"))
                    {
                      v186 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      v187 = NFLogGetLogger(v186);
                      if (v187)
                      {
                        v188 = (void (*)(uint64_t, const char *, ...))v187;
                        v189 = object_getClass(v4);
                        v190 = class_isMetaClass(v189);
                        v191 = object_getClassName(v4);
                        v192 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                        v250 = objc_msgSend(v183, "tag");
                        v254 = objc_msgSend(v183, "valueAsUnsignedLong");
                        v245 = v192;
                        v4 = v266;
                        v193 = 45;
                        if (v190)
                          v193 = 43;
                        v188(5, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v193, v191, v245, 725, v250, v254);
                      }
                      v194 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      v195 = NFSharedLogGetLogger(v194);
                      v196 = objc_claimAutoreleasedReturnValue(v195);
                      if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
                      {
                        v197 = object_getClass(v4);
                        if (class_isMetaClass(v197))
                          v198 = 43;
                        else
                          v198 = 45;
                        v199 = object_getClassName(v4);
                        v200 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                        v201 = objc_msgSend(v183, "tag");
                        v202 = objc_msgSend(v183, "valueAsUnsignedLong");
                        *(_DWORD *)v273 = 67110402;
                        *(_DWORD *)&v273[4] = v198;
                        v274 = 2082;
                        v275 = v199;
                        v276 = 2082;
                        v277 = v200;
                        v278 = 1024;
                        v279 = 725;
                        v280 = 1024;
                        v281 = v201;
                        v4 = v266;
                        v282 = 1024;
                        v283 = v202;
                        _os_log_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v273, 0x2Eu);
                      }

                      v203 = objc_msgSend(v183, "valueAsUnsignedLong");
                      if (v93 <= v203)
                        v93 = v203;
                    }
                  }
                  v180 = objc_msgSend(sela, "countByEnumeratingWithState:objects:count:", &v286, v284, 16);
                }
                while (v180);
              }

              v14 = 0;
              *v260 = v93;
              v25 = v255;
              v24 = v256;
            }
            else
            {
              v204 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v205 = NFLogGetLogger(v204);
              if (v205)
              {
                v206 = (void (*)(uint64_t, const char *, ...))v205;
                v207 = object_getClass(v4);
                v208 = class_isMetaClass(v207);
                v209 = object_getClassName(v4);
                v210 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                v251 = objc_msgSend(v176, "status");
                v211 = 45;
                if (v208)
                  v211 = 43;
                v206(3, "%c[%{public}s %{public}s]:%i Failed to request AC decrement timer : 0x%X", v211, v209, v210, 706, v251);
              }
              v212 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v213 = NFSharedLogGetLogger(v212);
              v214 = objc_claimAutoreleasedReturnValue(v213);
              if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
              {
                v215 = object_getClass(v4);
                if (class_isMetaClass(v215))
                  v216 = 43;
                else
                  v216 = 45;
                v217 = object_getClassName(v4);
                v218 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                v219 = objc_msgSend(v176, "status");
                *(_DWORD *)v284 = 67110146;
                *(_DWORD *)&v284[4] = v216;
                *(_WORD *)&v284[8] = 2082;
                *(_QWORD *)&v284[10] = v217;
                *(_WORD *)&v284[18] = 2082;
                *(_QWORD *)&v284[20] = v218;
                *(_WORD *)&v284[28] = 1024;
                *(_DWORD *)&v284[30] = 706;
                *(_WORD *)&v284[34] = 1024;
                *(_DWORD *)&v284[36] = v219;
                _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to request AC decrement timer : 0x%X", v284, 0x28u);
              }

              sub_100187C44((uint64_t)NFBugCapture, CFSTR("Failed to request AC decrement timer"), CFSTR("Failed to request AC decrement timer"), &off_100306970);
              v220 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to request AC decrement timer: 0x%X"), objc_msgSend(v176, "status"));
              +[NFExceptionsCALogger postAnalyticsSEFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsSEFailureEvent:context:error:", 9, v220, v255);
              v221 = objc_alloc((Class)NSError);
              v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
              if (v255)
              {
                v223 = objc_msgSend(v255, "code");
                *(_QWORD *)&v286 = NSLocalizedDescriptionKey;
                if ((uint64_t)objc_msgSend(v255, "code") > 70)
                  v224 = 71;
                else
                  v224 = (uint64_t)objc_msgSend(v255, "code");
                v233 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E92C8[v224]));
                *(_QWORD *)v284 = v233;
                *(_QWORD *)&v284[8] = v255;
                *((_QWORD *)&v286 + 1) = NSUnderlyingErrorKey;
                *(_QWORD *)&v287 = CFSTR("Line");
                *(_QWORD *)&v284[16] = &off_1002FFCD8;
                *((_QWORD *)&v287 + 1) = CFSTR("Method");
                v234 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningEOS:"));
                *(_QWORD *)&v284[24] = v234;
                *(_QWORD *)&v288 = NSDebugDescriptionErrorKey;
                v235 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningEOS:"), 713);
                *(_QWORD *)&v284[32] = v235;
                v236 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v284, &v286, 5));
                v237 = v221;
                v238 = v222;
                v239 = (uint64_t)v223;
              }
              else
              {
                *(_QWORD *)&v286 = NSLocalizedDescriptionKey;
                v233 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
                *(_QWORD *)v284 = v233;
                *(_QWORD *)&v284[8] = &off_1002FFCD8;
                *((_QWORD *)&v286 + 1) = CFSTR("Line");
                *(_QWORD *)&v287 = CFSTR("Method");
                v234 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningEOS:"));
                *(_QWORD *)&v284[16] = v234;
                *((_QWORD *)&v287 + 1) = NSDebugDescriptionErrorKey;
                v235 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningEOS:"), 713);
                *(_QWORD *)&v284[24] = v235;
                v236 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v284, &v286, 4));
                v237 = v221;
                v238 = v222;
                v239 = 6;
              }
              v14 = objc_msgSend(v237, "initWithDomain:code:userInfo:", v238, v239, v236);

              v24 = v256;
              v25 = v255;
            }
          }
          else
          {
            v148 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v149 = NFLogGetLogger(v148);
            if (v149)
            {
              v150 = (void (*)(uint64_t, const char *, ...))v149;
              v151 = object_getClass(v4);
              v152 = class_isMetaClass(v151);
              v153 = object_getClassName(v4);
              v154 = sel_getName("_checkDeepSleepTimerRunningEOS:");
              v249 = objc_msgSend(v24, "status");
              v155 = 45;
              if (v152)
                v155 = 43;
              v150(3, "%c[%{public}s %{public}s]:%i Failed to request timer running Status: 0x%X", v155, v153, v154, 671, v249);
            }
            v156 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v157 = NFSharedLogGetLogger(v156);
            v158 = objc_claimAutoreleasedReturnValue(v157);
            if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
            {
              v159 = object_getClass(v4);
              if (class_isMetaClass(v159))
                v160 = 43;
              else
                v160 = 45;
              v161 = object_getClassName(v4);
              v162 = sel_getName("_checkDeepSleepTimerRunningEOS:");
              v163 = objc_msgSend(v24, "status");
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&buf[4] = v160;
              *(_WORD *)v291 = 2082;
              *(_QWORD *)&v291[2] = v161;
              *(_WORD *)&v291[10] = 2082;
              *(_QWORD *)&v291[12] = v162;
              *(_WORD *)&v291[20] = 1024;
              *(_DWORD *)&v291[22] = 671;
              *(_WORD *)&v291[26] = 1024;
              *(_DWORD *)&v291[28] = v163;
              _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to request timer running Status: 0x%X", buf, 0x28u);
            }

            sub_100187C44((uint64_t)NFBugCapture, CFSTR("Failed to request timer running status"), CFSTR("Failed to request timer running status"), &off_100306948);
            v164 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to request timer running Status: 0x%X"), objc_msgSend(v24, "status"));
            +[NFExceptionsCALogger postAnalyticsSEFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsSEFailureEvent:context:error:", 9, v164, v25);
            v165 = objc_alloc((Class)NSError);
            v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
            if (v25)
            {
              v167 = objc_msgSend(v25, "code");
              *(_QWORD *)v284 = NSLocalizedDescriptionKey;
              if ((uint64_t)objc_msgSend(v25, "code") > 70)
                v168 = 71;
              else
                v168 = (uint64_t)objc_msgSend(v25, "code");
              v232 = v25;
              v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E92C8[v168]));
              *(_QWORD *)buf = v225;
              *(_QWORD *)v291 = v232;
              *(_QWORD *)&v284[8] = NSUnderlyingErrorKey;
              *(_QWORD *)&v284[16] = CFSTR("Line");
              *(_QWORD *)&v291[8] = &off_1002FFCC0;
              *(_QWORD *)&v284[24] = CFSTR("Method");
              v226 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningEOS:"));
              *(_QWORD *)&v291[16] = v226;
              *(_QWORD *)&v284[32] = NSDebugDescriptionErrorKey;
              v227 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningEOS:"), 678);
              *(_QWORD *)&v291[24] = v227;
              v228 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v284, 5));
              v229 = v165;
              v230 = v166;
              v231 = (uint64_t)v167;
            }
            else
            {
              *(_QWORD *)v284 = NSLocalizedDescriptionKey;
              v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
              *(_QWORD *)buf = v225;
              *(_QWORD *)v291 = &off_1002FFCC0;
              *(_QWORD *)&v284[8] = CFSTR("Line");
              *(_QWORD *)&v284[16] = CFSTR("Method");
              v226 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningEOS:"));
              *(_QWORD *)&v291[8] = v226;
              *(_QWORD *)&v284[24] = NSDebugDescriptionErrorKey;
              v227 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningEOS:"), 678);
              *(_QWORD *)&v291[16] = v227;
              v228 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v284, 4));
              v229 = v165;
              v230 = v166;
              v231 = 6;
            }
            v14 = objc_msgSend(v229, "initWithDomain:code:userInfo:", v230, v231, v228);

            v25 = v262;
          }
        }

        v10 = v25;
      }
      else
      {
        v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v45 = NFLogGetLogger(v44);
        if (v45)
        {
          v46 = (void (*)(uint64_t, const char *, ...))v45;
          v47 = object_getClass(v4);
          v48 = class_isMetaClass(v47);
          v49 = object_getClassName(v4);
          v244 = sel_getName("_checkDeepSleepTimerRunningEOS:");
          v50 = 45;
          if (v48)
            v50 = 43;
          v46(3, "%c[%{public}s %{public}s]:%i Failed to select ISD", v50, v49, v244, 653);
        }
        v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v52 = NFSharedLogGetLogger(v51);
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = object_getClass(v4);
          if (class_isMetaClass(v54))
            v55 = 43;
          else
            v55 = 45;
          v56 = object_getClassName(v4);
          v57 = sel_getName("_checkDeepSleepTimerRunningEOS:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v55;
          *(_WORD *)v291 = 2082;
          *(_QWORD *)&v291[2] = v56;
          *(_WORD *)&v291[10] = 2082;
          *(_QWORD *)&v291[12] = v57;
          *(_WORD *)&v291[20] = 1024;
          *(_DWORD *)&v291[22] = 653;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select ISD", buf, 0x22u);
        }

        v58 = objc_alloc((Class)NSError);
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        if (v10)
        {
          v60 = objc_msgSend(v10, "code");
          *(_QWORD *)v284 = NSLocalizedDescriptionKey;
          if ((uint64_t)objc_msgSend(v10, "code") > 70)
            v61 = 71;
          else
            v61 = (uint64_t)objc_msgSend(v10, "code");
          v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E92C8[v61]));
          *(_QWORD *)buf = v126;
          *(_QWORD *)v291 = v10;
          *(_QWORD *)&v284[8] = NSUnderlyingErrorKey;
          *(_QWORD *)&v284[16] = CFSTR("Line");
          *(_QWORD *)&v291[8] = &off_1002FFCA8;
          *(_QWORD *)&v284[24] = CFSTR("Method");
          v127 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningEOS:"));
          *(_QWORD *)&v291[16] = v127;
          *(_QWORD *)&v284[32] = NSDebugDescriptionErrorKey;
          v128 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningEOS:"), 654);
          *(_QWORD *)&v291[24] = v128;
          v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v284, 5));
          v14 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, v60, v129);

        }
        else
        {
          *(_QWORD *)v284 = NSLocalizedDescriptionKey;
          v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
          *(_QWORD *)buf = v118;
          *(_QWORD *)v291 = &off_1002FFCA8;
          *(_QWORD *)&v284[8] = CFSTR("Line");
          *(_QWORD *)&v284[16] = CFSTR("Method");
          v119 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningEOS:"));
          *(_QWORD *)&v291[8] = v119;
          *(_QWORD *)&v284[24] = NSDebugDescriptionErrorKey;
          v120 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningEOS:"), 654);
          *(_QWORD *)&v291[16] = v120;
          v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v284, 4));
          v14 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 6, v121);

          v10 = v59;
        }
      }
      goto LABEL_164;
    }
  }
  else
  {
    if (v7 != (id)2)
    {
      *a3 = 0;
      return 0;
    }
    if (v4)
    {
      LOWORD(v268) = 20703;
      v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A529, 8);
      *(_QWORD *)v273 = 0;
      v9 = -[NFSecureElementWrapper select:error:](v4, "select:error:", v8, v273);
      v10 = *(id *)v273;

      if ((v9 & 1) == 0)
      {
        v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v27 = NFLogGetLogger(v26);
        if (v27)
        {
          v28 = (void (*)(uint64_t, const char *, ...))v27;
          v29 = object_getClass(v4);
          v30 = class_isMetaClass(v29);
          v31 = object_getClassName(v4);
          v243 = sel_getName("_checkDeepSleepTimerRunningP73:");
          v32 = 45;
          if (v30)
            v32 = 43;
          v28(3, "%c[%{public}s %{public}s]:%i Failed to select ISD", v32, v31, v243, 593);
        }
        v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v34 = NFSharedLogGetLogger(v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = object_getClass(v4);
          if (class_isMetaClass(v36))
            v37 = 43;
          else
            v37 = 45;
          v38 = object_getClassName(v4);
          v39 = sel_getName("_checkDeepSleepTimerRunningP73:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v37;
          *(_WORD *)v291 = 2082;
          *(_QWORD *)&v291[2] = v38;
          *(_WORD *)&v291[10] = 2082;
          *(_QWORD *)&v291[12] = v39;
          *(_WORD *)&v291[20] = 1024;
          *(_DWORD *)&v291[22] = 593;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select ISD", buf, 0x22u);
        }

        v40 = objc_alloc((Class)NSError);
        v41 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        if (v10)
        {
          v42 = objc_msgSend(v10, "code");
          *(_QWORD *)v284 = NSLocalizedDescriptionKey;
          if ((uint64_t)objc_msgSend(v10, "code") > 70)
            v43 = 71;
          else
            v43 = (uint64_t)objc_msgSend(v10, "code");
          v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E92C8[v43]));
          *(_QWORD *)buf = v122;
          *(_QWORD *)v291 = v10;
          *(_QWORD *)&v284[8] = NSUnderlyingErrorKey;
          *(_QWORD *)&v284[16] = CFSTR("Line");
          *(_QWORD *)&v291[8] = &off_1002FFC78;
          *(_QWORD *)&v284[24] = CFSTR("Method");
          v123 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningP73:"));
          *(_QWORD *)&v291[16] = v123;
          *(_QWORD *)&v284[32] = NSDebugDescriptionErrorKey;
          v124 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningP73:"), 594);
          *(_QWORD *)&v291[24] = v124;
          v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v284, 5));
          v14 = objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, v42, v125);

          v12 = (void *)v41;
        }
        else
        {
          *(_QWORD *)v284 = NSLocalizedDescriptionKey;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
          *(_QWORD *)buf = v12;
          *(_QWORD *)v291 = &off_1002FFC78;
          *(_QWORD *)&v284[8] = CFSTR("Line");
          *(_QWORD *)&v284[16] = CFSTR("Method");
          v115 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningP73:"));
          *(_QWORD *)&v291[8] = v115;
          *(_QWORD *)&v284[24] = NSDebugDescriptionErrorKey;
          v116 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningP73:"), 594);
          *(_QWORD *)&v291[16] = v116;
          v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v284, 4));
          v14 = objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 6, v117);

          v10 = (id)v41;
        }
        goto LABEL_116;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v268, 2));
      v270 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:error:](v4, "sendCommandWithClass:instruction:p1:p2:data:error:", 0, 202, 0, 254, v11, &v270));
      v13 = v270;

      if (objc_msgSend(v12, "status") == 26277)
      {
        v14 = 0;
        *a3 = 87000;
        v10 = v13;
LABEL_116:

LABEL_164:
        return v14;
      }
      if (objc_msgSend(v12, "status") != 36864)
      {
        v130 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v131 = NFLogGetLogger(v130);
        if (v131)
        {
          v132 = (void (*)(uint64_t, const char *, ...))v131;
          v133 = object_getClass(v4);
          v134 = class_isMetaClass(v133);
          v135 = v13;
          v136 = object_getClassName(v4);
          v137 = sel_getName("_checkDeepSleepTimerRunningP73:");
          v248 = objc_msgSend(v12, "status");
          v242 = v136;
          v138 = 45;
          if (v134)
            v138 = 43;
          v13 = v135;
          v132(3, "%c[%{public}s %{public}s]:%i Failed to request timer running Status: 0x%X", v138, v242, v137, 610, v248);
        }
        v139 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v140 = NFSharedLogGetLogger(v139);
        v141 = objc_claimAutoreleasedReturnValue(v140);
        if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
        {
          v142 = object_getClass(v4);
          if (class_isMetaClass(v142))
            v143 = 43;
          else
            v143 = 45;
          v144 = object_getClassName(v4);
          v145 = sel_getName("_checkDeepSleepTimerRunningP73:");
          v146 = objc_msgSend(v12, "status");
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v143;
          *(_WORD *)v291 = 2082;
          *(_QWORD *)&v291[2] = v144;
          *(_WORD *)&v291[10] = 2082;
          *(_QWORD *)&v291[12] = v145;
          *(_WORD *)&v291[20] = 1024;
          *(_DWORD *)&v291[22] = 610;
          *(_WORD *)&v291[26] = 1024;
          *(_DWORD *)&v291[28] = v146;
          _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to request timer running Status: 0x%X", buf, 0x28u);
        }

        sub_100187C44((uint64_t)NFBugCapture, CFSTR("Failed to request timer running status"), CFSTR("Failed to request timer running status"), &off_100306920);
        v147 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to request timer running Status: 0x%X"), objc_msgSend(v12, "status"));
        +[NFExceptionsCALogger postAnalyticsSEFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsSEFailureEvent:context:error:", 9, v147, v13);
        v10 = v13;

        v14 = v10;
        goto LABEL_116;
      }
      v257 = v13;
      *a3 = 0;
      memset(v284, 0, sizeof(v284));
      v285 = 0u;
      v261 = v12;
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVsWithData:](NFTLV, "TLVsWithData:", v62));

      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", v284, buf, 16);
      if (v64)
      {
        v65 = v64;
        v259 = a3;
        v66 = 0;
        v265 = 0;
        v67 = **(_QWORD **)&v284[16];
        do
        {
          for (k = 0; k != v65; k = (char *)k + 1)
          {
            if (**(_QWORD **)&v284[16] != v67)
              objc_enumerationMutation(v63);
            v69 = *(void **)(*(_QWORD *)&v284[8] + 8 * (_QWORD)k);
            if (objc_msgSend(v69, "tag") - 241 <= 1)
            {
              if (objc_msgSend(v69, "valueAsUnsignedLong"))
              {
                v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v71 = NFLogGetLogger(v70);
                if (v71)
                {
                  v72 = (void (*)(uint64_t, const char *, ...))v71;
                  v73 = object_getClass(v4);
                  v74 = class_isMetaClass(v73);
                  v75 = object_getClassName(v4);
                  v76 = sel_getName("_checkDeepSleepTimerRunningP73:");
                  v246 = objc_msgSend(v69, "tag");
                  v252 = objc_msgSend(v69, "valueAsUnsignedLong");
                  v77 = 45;
                  if (v74)
                    v77 = 43;
                  v240 = v75;
                  v4 = v266;
                  v72(5, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v77, v240, v76, 634, v246, v252);
                }
                v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v79 = NFSharedLogGetLogger(v78);
                v80 = objc_claimAutoreleasedReturnValue(v79);
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  v81 = object_getClass(v4);
                  if (class_isMetaClass(v81))
                    v82 = 43;
                  else
                    v82 = 45;
                  v83 = object_getClassName(v4);
                  v84 = sel_getName("_checkDeepSleepTimerRunningP73:");
                  v85 = objc_msgSend(v69, "tag");
                  v86 = objc_msgSend(v69, "valueAsUnsignedLong");
                  *(_DWORD *)v292 = 67110402;
                  *(_DWORD *)&v292[4] = v82;
                  *(_WORD *)&v292[8] = 2082;
                  *(_QWORD *)&v292[10] = v83;
                  *(_WORD *)&v292[18] = 2082;
                  *(_QWORD *)&v292[20] = v84;
                  v4 = v266;
                  *(_WORD *)&v292[28] = 1024;
                  *(_DWORD *)&v292[30] = 634;
                  *(_WORD *)&v292[34] = 1024;
                  *(_DWORD *)&v292[36] = v85;
                  *(_WORD *)&v292[40] = 1024;
                  *(_DWORD *)&v292[42] = v86;
                  _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v292, 0x2Eu);
                }

                v87 = objc_msgSend(v69, "valueAsUnsignedLong");
                v88 = v265;
                if ((unint64_t)v265 <= v87)
                  v88 = (const char *)v87;
                v265 = v88;
              }
              v66 = 1;
            }
          }
          v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", v284, buf, 16);
        }
        while (v65);

        if ((v66 & 1) != 0)
        {
          *v259 = (unint64_t)v265;
          v10 = v257;
          v14 = v10;
LABEL_115:
          v12 = v261;
          goto LABEL_116;
        }
      }
      else
      {

      }
      v169 = objc_alloc((Class)NSError);
      v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      *(_QWORD *)&v286 = NSLocalizedDescriptionKey;
      v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
      *(_QWORD *)v292 = v171;
      *(_QWORD *)&v292[8] = &off_1002FFC90;
      *((_QWORD *)&v286 + 1) = CFSTR("Line");
      *(_QWORD *)&v287 = CFSTR("Method");
      v172 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_checkDeepSleepTimerRunningP73:"));
      *(_QWORD *)&v292[16] = v172;
      *((_QWORD *)&v287 + 1) = NSDebugDescriptionErrorKey;
      v173 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_checkDeepSleepTimerRunningP73:"), 643);
      *(_QWORD *)&v292[24] = v173;
      v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v292, &v286, 4));
      v14 = objc_msgSend(v169, "initWithDomain:code:userInfo:", v170, 13, v174);

      v10 = v257;
      goto LABEL_115;
    }
  }
  return 0;
}

- (id)powerCycleOrReset
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!self)
    goto LABEL_9;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v4 = (uint64_t)objc_msgSend(v3, "deviceType");

  if (v4 > 199)
  {
    if (v4 != 210 && v4 != 200)
      goto LABEL_9;
  }
  else if (v4 != 100 && v4 != 115)
  {
LABEL_9:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper delegate](self, "delegate"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "powerCycleSE:", self));
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper delegate](self, "delegate"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "softResetSE:", self));
LABEL_10:
  v7 = (void *)v6;

  return v7;
}

- (BOOL)jcopSupportsEntanglement
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v4 = (uint64_t)objc_msgSend(v3, "deviceType");

  v5 = 0;
  if (v4 > 199)
  {
    if (v4 != 210 && v4 != 200)
      return v5;
LABEL_7:
    v6 = 2101;
    goto LABEL_8;
  }
  if (v4 == 100)
    goto LABEL_7;
  if (v4 == 115)
  {
    v6 = 1818;
LABEL_8:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper handle](self, "handle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sequenceCounter"));
    v5 = objc_msgSend(v9, "unsignedIntValue") > v6;

  }
  return v5;
}

+ (BOOL)isAuthRandomEntangled
{
  return byte_10032AA20;
}

+ (void)setAuthRandomEntangled
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
    Class = object_getClass(a1);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 797);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(a1);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v18 = v15;
    v19 = 2082;
    v20 = object_getClassName(a1);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 797;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  byte_10032AA20 = 1;
}

- (BOOL)jcopSupportsPerBootAuthKeys
{
  void *v2;
  uint64_t v3;
  BOOL result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementHandleInterface info](self->_handle, "info"));
  v3 = (uint64_t)objc_msgSend(v2, "deviceType");

  result = 0;
  if (v3 > 199)
  {
    if (v3 != 200 && v3 != 210)
      return 1;
  }
  else if (v3 != 100 && v3 != 115)
  {
    return 1;
  }
  return result;
}

- (id)mountCOXForApplets:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  _BOOL4 v16;
  const char *v17;
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
  id v28;
  void *specific;
  uint64_t Logger;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *Class;
  const char *ClassName;
  const char *Name;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  objc_class *v40;
  int v41;
  const char *v42;
  const char *v43;
  void *v44;
  unsigned int v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  const char *v61;
  uint64_t v62;
  id v63;
  _BOOL4 isMetaClass;
  int v65;
  id obj;
  id v67;
  uint64_t v69;
  id v70;
  id v71;
  _BYTE v72[2];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  uint8_t buf[4];
  int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  unsigned int v89;
  _BYTE v90[128];
  _QWORD v91[4];
  _QWORD v92[4];
  NSErrorUserInfoKey v93;
  void *v94;
  _QWORD v95[5];
  _QWORD v96[5];

  v4 = a3;
  if (sub_1001519C4((_BOOL8)self))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A529, 8);
    v77 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v5, &v77));
    v7 = v77;

    if (v6)
    {
      if (objc_msgSend(v6, "status") == 36864)
      {
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        obj = v4;
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
        if (v70)
        {
          v63 = v4;
          v69 = *(_QWORD *)v74;
          v8 = obj;
          do
          {
            for (i = 0; i != v70; i = (char *)i + 1)
            {
              if (*(_QWORD *)v74 != v69)
                objc_enumerationMutation(v8);
              v10 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifierAsData"));
              if ((unint64_t)objc_msgSend(v11, "length") >= 5
                && (unint64_t)objc_msgSend(v11, "length") < 0x11)
              {
                v72[0] = 79;
                v72[1] = objc_msgSend(v11, "length");
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v72, 2));
                objc_msgSend(v26, "appendData:", v11);
                v71 = v7;
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:](self, "sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:", 128, 240, 16, 1, v26, 0, 0, &v71));
                v28 = v71;

                if (objc_msgSend(v27, "status") != 36864)
                {
                  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  Logger = NFLogGetLogger(specific);
                  v67 = v28;
                  if (Logger)
                  {
                    v31 = (void (*)(uint64_t, const char *, ...))Logger;
                    Class = object_getClass(self);
                    isMetaClass = class_isMetaClass(Class);
                    ClassName = object_getClassName(self);
                    Name = sel_getName(a2);
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
                    v62 = objc_msgSend(v27, "status");
                    v36 = 45;
                    if (isMetaClass)
                      v36 = 43;
                    v31(3, "%c[%{public}s %{public}s]:%i COX mount %@ error:0x%02X", v36, ClassName, Name, 867, v35, v62);

                    v28 = v67;
                  }
                  v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  v38 = NFSharedLogGetLogger(v37);
                  v39 = objc_claimAutoreleasedReturnValue(v38);
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    v40 = object_getClass(self);
                    if (class_isMetaClass(v40))
                      v41 = 43;
                    else
                      v41 = 45;
                    v65 = v41;
                    v42 = object_getClassName(self);
                    v43 = sel_getName(a2);
                    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
                    v45 = objc_msgSend(v27, "status");
                    *(_DWORD *)buf = 67110402;
                    v79 = v65;
                    v80 = 2082;
                    v81 = v42;
                    v82 = 2082;
                    v83 = v43;
                    v28 = v67;
                    v84 = 1024;
                    v85 = 867;
                    v86 = 2112;
                    v87 = v44;
                    v88 = 1024;
                    v89 = v45;
                    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i COX mount %@ error:0x%02X", buf, 0x32u);

                  }
                }

                v6 = v27;
                v7 = v28;
                v8 = obj;
              }
              else
              {
                v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v13 = NFLogGetLogger(v12);
                if (v13)
                {
                  v14 = (void (*)(uint64_t, const char *, ...))v13;
                  v15 = object_getClass(self);
                  v16 = class_isMetaClass(v15);
                  v17 = object_getClassName(self);
                  v61 = sel_getName(a2);
                  v18 = 45;
                  if (v16)
                    v18 = 43;
                  v14(4, "%c[%{public}s %{public}s]:%i Skipping invalid AID due to length", v18, v17, v61, 850);
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
                  v79 = v23;
                  v80 = 2082;
                  v81 = v24;
                  v82 = 2082;
                  v83 = v25;
                  v84 = 1024;
                  v85 = 850;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping invalid AID due to length", buf, 0x22u);
                }

              }
            }
            v70 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
          }
          while (v70);
          v46 = 0;
          v47 = v8;
          v4 = v63;
        }
        else
        {
          v46 = 0;
          v47 = obj;
        }
      }
      else
      {
        v52 = objc_alloc((Class)NSError);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v91[0] = NSLocalizedDescriptionKey;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v92[0] = v53;
        v92[1] = &off_1002FFD08;
        v91[1] = CFSTR("Line");
        v91[2] = CFSTR("Method");
        v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v92[2] = v54;
        v91[3] = NSDebugDescriptionErrorKey;
        v55 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 839);
        v92[3] = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v92, v91, 4));
        v46 = objc_msgSend(v52, "initWithDomain:code:userInfo:", v47, 16, v56);

      }
    }
    else
    {
      v48 = objc_alloc((Class)NSError);
      v49 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      if (v7)
      {
        v50 = objc_msgSend(v7, "code");
        v95[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)objc_msgSend(v7, "code") > 70)
          v51 = 71;
        else
          v51 = (uint64_t)objc_msgSend(v7, "code");
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E92C8[v51]));
        v96[0] = v47;
        v96[1] = v7;
        v95[1] = NSUnderlyingErrorKey;
        v95[2] = CFSTR("Line");
        v96[2] = &off_1002FFCF0;
        v95[3] = CFSTR("Method");
        v57 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v96[3] = v57;
        v95[4] = NSDebugDescriptionErrorKey;
        v58 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 837);
        v96[4] = v58;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v96, v95, 5));
        v46 = objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, v50, v59);

        v6 = (void *)v49;
      }
      else
      {
        v93 = NSLocalizedDescriptionKey;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
        v94 = v6;
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
        v46 = objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 16, v47);
        v7 = (id)v49;
      }
    }

  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (id)globalUnmountCOX
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *specific;
  uint64_t Logger;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  unsigned int v53;
  _QWORD v54[4];
  _QWORD v55[4];
  NSErrorUserInfoKey v56;
  void *v57;
  _QWORD v58[5];
  _QWORD v59[5];

  if (!sub_1001519C4((_BOOL8)self))
    return 0;
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A529, 8);
  v43 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", v4, &v43));
  v6 = v43;

  if (!v5)
  {
    v11 = objc_alloc((Class)NSError);
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    if (v6)
    {
      v13 = objc_msgSend(v6, "code");
      v58[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)objc_msgSend(v6, "code") > 70)
        v14 = 71;
      else
        v14 = (uint64_t)objc_msgSend(v6, "code");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E92C8[v14]));
      v59[0] = v37;
      v59[1] = v6;
      v58[1] = NSUnderlyingErrorKey;
      v58[2] = CFSTR("Line");
      v59[2] = &off_1002FFD20;
      v58[3] = CFSTR("Method");
      v38 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v59[3] = v38;
      v58[4] = NSDebugDescriptionErrorKey;
      v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 881);
      v59[4] = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 5));
      v9 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, v13, v40);

    }
    else
    {
      v56 = NSLocalizedDescriptionKey;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
      v57 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
      v9 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 16, v36);

      v6 = 0;
    }
    v5 = 0;
    goto LABEL_25;
  }
  if (objc_msgSend(v5, "status") != 36864)
  {
    v15 = objc_alloc((Class)NSError);
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v54[0] = NSLocalizedDescriptionKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v55[0] = v16;
    v55[1] = &off_1002FFD38;
    v54[1] = CFSTR("Line");
    v54[2] = CFSTR("Method");
    v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v55[2] = v17;
    v54[3] = NSDebugDescriptionErrorKey;
    v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 883);
    v55[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 4));
    v9 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v12, 16, v19);

LABEL_25:
    v8 = v6;
    v7 = v5;
    goto LABEL_26;
  }
  v42 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:](self, "sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:", 128, 240, 16, 0, 0, 0, 0, &v42));
  v8 = v42;

  if (objc_msgSend(v7, "status") != 36864)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v22 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v41 = objc_msgSend(v7, "status");
      v27 = 45;
      if (isMetaClass)
        v27 = 43;
      v22(3, "%c[%{public}s %{public}s]:%i COX unmount error:0x%02X", v27, ClassName, Name, 895, v41);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v12 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      v34 = objc_msgSend(v7, "status");
      *(_DWORD *)buf = 67110146;
      v45 = v31;
      v46 = 2082;
      v47 = v32;
      v48 = 2082;
      v49 = v33;
      v50 = 1024;
      v51 = 895;
      v52 = 1024;
      v53 = v34;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i COX unmount error:0x%02X", buf, 0x28u);
    }
    v9 = 0;
    v6 = v8;
    v5 = v7;
    goto LABEL_25;
  }
  v9 = 0;
LABEL_26:

  return v9;
}

- (BOOL)upgradeChecked
{
  return self->_upgradeChecked;
}

- (void)setUpgradeChecked:(BOOL)a3
{
  self->_upgradeChecked = a3;
}

- (NFSecureElementHandleInterface)handle
{
  return (NFSecureElementHandleInterface *)objc_getProperty(self, a2, 24, 1);
}

- (NFSecureElementWrapperDelegate)delegate
{
  return (NFSecureElementWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setActiveApplet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)cachedAppletsUnfiltered
{
  return self->_cachedAppletsUnfiltered;
}

- (void)setCachedAppletsUnfiltered:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAppletsUnfiltered, a3);
}

- (NSNumber)cachedAppletUpdateCounter
{
  return self->_cachedAppletUpdateCounter;
}

- (void)setCachedAppletUpdateCounter:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAppletUpdateCounter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAppletUpdateCounter, 0);
  objc_storeStrong((id *)&self->_cachedAppletsUnfiltered, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_authQueue, 0);
}

- (unint64_t)pairedState
{
  return qword_10032AC20;
}

- (void)setUnpairedState
{
  qword_10032AC20 = 1;
}

- (void)storePairedState
{
  qword_10032AC20 = 2;
}

- (unint64_t)_crsGetPersoState:(id *)a3
{
  void *v6;
  void *v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  const char *v34;
  const char *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  id v45;
  int v46;
  id v47;
  int v48;
  unint64_t v49;
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
  id v62;
  void *v63;
  id v64;
  id v65;
  _QWORD *v66;
  _QWORD *v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  void *v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  id v86;
  void *v87;
  uint64_t v88;
  void (*v89)(uint64_t, const char *, ...);
  objc_class *v90;
  _BOOL4 v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  objc_class *v98;
  int v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  _QWORD *v105;
  _QWORD *v106;
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
  void *v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  _QWORD v125[4];
  _QWORD v126[4];
  _QWORD v127[4];
  _QWORD v128[4];
  _QWORD v129[4];
  _QWORD v130[4];
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[4];
  uint8_t buf[4];
  int v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  id v144;

  *a3 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper getData:tag:data:error:](self, "getData:tag:data:error:", 128, 211, 0, a3));
  v7 = v6;
  if (*a3)
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
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Failed to get data: %{public}@", v15, ClassName, Name, 57, *a3);
    }
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(self);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      v21 = object_getClassName(self);
      v22 = sel_getName(a2);
      v23 = *a3;
      *(_DWORD *)buf = 67110146;
      v136 = v20;
      v137 = 2082;
      v138 = v21;
      v139 = 2082;
      v140 = v22;
      v141 = 1024;
      v142 = 57;
      v143 = 2114;
      v144 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get data: %{public}@", buf, 0x2Cu);
    }
    goto LABEL_52;
  }
  if (!v6)
  {
    v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v51 = NFLogGetLogger(v50);
    if (v51)
    {
      v52 = (void (*)(uint64_t, const char *, ...))v51;
      v53 = object_getClass(self);
      v54 = class_isMetaClass(v53);
      v55 = object_getClassName(self);
      v120 = sel_getName(a2);
      v56 = 45;
      if (v54)
        v56 = 43;
      v52(3, "%c[%{public}s %{public}s]:%i Failed to get data, expecting RAPDU", v56, v55, v120, 61);
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
      *(_DWORD *)buf = 67109890;
      v136 = v61;
      v137 = 2082;
      v138 = object_getClassName(self);
      v139 = 2082;
      v140 = sel_getName(a2);
      v141 = 1024;
      v142 = 61;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get data, expecting RAPDU", buf, 0x22u);
    }

    v62 = objc_alloc((Class)NSError);
    v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v133[0] = NSLocalizedDescriptionKey;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v134[0] = v63;
    v134[1] = &off_100303200;
    v133[1] = CFSTR("Line");
    v133[2] = CFSTR("Method");
    v64 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v134[2] = v64;
    v133[3] = NSDebugDescriptionErrorKey;
    v65 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 62);
    v134[3] = v65;
    v66 = v134;
    v67 = v133;
    goto LABEL_50;
  }
  if (objc_msgSend(v6, "status") != 36864)
  {
    v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v69 = NFLogGetLogger(v68);
    if (v69)
    {
      v70 = (void (*)(uint64_t, const char *, ...))v69;
      v71 = object_getClass(self);
      v72 = class_isMetaClass(v71);
      v73 = object_getClassName(self);
      v74 = sel_getName(a2);
      v123 = objc_msgSend(v7, "status");
      v75 = 45;
      if (v72)
        v75 = 43;
      v70(3, "%c[%{public}s %{public}s]:%i Failed to get perso request, expecting 0x9000, got 0x%x", v75, v73, v74, 66, v123);
    }
    v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v77 = NFSharedLogGetLogger(v76);
    v78 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v79 = object_getClass(self);
      if (class_isMetaClass(v79))
        v80 = 43;
      else
        v80 = 45;
      *(_DWORD *)buf = 67110146;
      v136 = v80;
      v137 = 2082;
      v138 = object_getClassName(self);
      v139 = 2082;
      v140 = sel_getName(a2);
      v141 = 1024;
      v142 = 66;
      v143 = 1024;
      LODWORD(v144) = objc_msgSend(v7, "status");
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get perso request, expecting 0x9000, got 0x%x", buf, 0x28u);
    }

    v62 = objc_alloc((Class)NSError);
    v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v131[0] = NSLocalizedDescriptionKey;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v132[0] = v63;
    v132[1] = &off_100303218;
    v131[1] = CFSTR("Line");
    v131[2] = CFSTR("Method");
    v64 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v132[2] = v64;
    v131[3] = NSDebugDescriptionErrorKey;
    v65 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 67);
    v132[3] = v65;
    v66 = v132;
    v67 = v131;
LABEL_50:
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v66, v67, 4));
    v82 = v62;
    v83 = v18;
    v84 = 16;
LABEL_51:
    *a3 = objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, v84, v81);

LABEL_52:
    v25 = 0;
LABEL_53:
    v49 = 3;
    goto LABEL_54;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "response"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithData:](NFTLV, "TLVWithData:", v24));

  if (!v25)
  {
    v86 = objc_alloc((Class)NSError);
    v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v129[0] = NSLocalizedDescriptionKey;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v130[0] = v63;
    v130[1] = &off_100303230;
    v129[1] = CFSTR("Line");
    v129[2] = CFSTR("Method");
    v64 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v130[2] = v64;
    v129[3] = NSDebugDescriptionErrorKey;
    v65 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 73);
    v130[3] = v65;
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v130, v129, 4));
    v82 = v86;
    v83 = v18;
    v84 = 13;
    goto LABEL_51;
  }
  if (objc_msgSend(v25, "tag") != 211)
  {
    v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v88 = NFLogGetLogger(v87);
    if (v88)
    {
      v89 = (void (*)(uint64_t, const char *, ...))v88;
      v90 = object_getClass(self);
      v91 = class_isMetaClass(v90);
      v92 = object_getClassName(self);
      v93 = sel_getName(a2);
      v124 = objc_msgSend(v25, "tag");
      v94 = 45;
      if (v91)
        v94 = 43;
      v89(3, "%c[%{public}s %{public}s]:%i Unexpeted tag 0x%x", v94, v92, v93, 78, v124);
    }
    v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v96 = NFSharedLogGetLogger(v95);
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      v98 = object_getClass(self);
      if (class_isMetaClass(v98))
        v99 = 43;
      else
        v99 = 45;
      *(_DWORD *)buf = 67110146;
      v136 = v99;
      v137 = 2082;
      v138 = object_getClassName(self);
      v139 = 2082;
      v140 = sel_getName(a2);
      v141 = 1024;
      v142 = 78;
      v143 = 1024;
      LODWORD(v144) = objc_msgSend(v25, "tag");
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpeted tag 0x%x", buf, 0x28u);
    }

    v100 = objc_alloc((Class)NSError);
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v127[0] = NSLocalizedDescriptionKey;
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v128[0] = v102;
    v128[1] = &off_100303248;
    v127[1] = CFSTR("Line");
    v127[2] = CFSTR("Method");
    v103 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v128[2] = v103;
    v127[3] = NSDebugDescriptionErrorKey;
    v104 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 79);
    v128[3] = v104;
    v105 = v128;
    v106 = v127;
    goto LABEL_77;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value"));
  if (!objc_msgSend(v26, "length"))
  {

    goto LABEL_67;
  }
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value")));
  v28 = objc_msgSend(v27, "bytes");

  if (!v28)
  {
LABEL_67:
    v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v108 = NFLogGetLogger(v107);
    if (v108)
    {
      v109 = (void (*)(uint64_t, const char *, ...))v108;
      v110 = object_getClass(self);
      v111 = class_isMetaClass(v110);
      v112 = object_getClassName(self);
      v121 = sel_getName(a2);
      v113 = 45;
      if (v111)
        v113 = 43;
      v109(3, "%c[%{public}s %{public}s]:%i Unexpeted zero tag length", v113, v112, v121, 83);
    }
    v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v115 = NFSharedLogGetLogger(v114);
    v116 = objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    {
      v117 = object_getClass(self);
      if (class_isMetaClass(v117))
        v118 = 43;
      else
        v118 = 45;
      *(_DWORD *)buf = 67109890;
      v136 = v118;
      v137 = 2082;
      v138 = object_getClassName(self);
      v139 = 2082;
      v140 = sel_getName(a2);
      v141 = 1024;
      v142 = 83;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpeted zero tag length", buf, 0x22u);
    }

    v100 = objc_alloc((Class)NSError);
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v125[0] = NSLocalizedDescriptionKey;
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v126[0] = v102;
    v126[1] = &off_100303260;
    v125[1] = CFSTR("Line");
    v125[2] = CFSTR("Method");
    v103 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v126[2] = v103;
    v125[3] = NSDebugDescriptionErrorKey;
    v104 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 84);
    v126[3] = v104;
    v105 = v126;
    v106 = v125;
LABEL_77:
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v105, v106, 4));
    *a3 = objc_msgSend(v100, "initWithDomain:code:userInfo:", v101, 13, v119);

    goto LABEL_53;
  }
  v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v30 = NFLogGetLogger(v29);
  if (v30)
  {
    v31 = (void (*)(uint64_t, const char *, ...))v30;
    v32 = object_getClass(self);
    v33 = class_isMetaClass(v32);
    v34 = object_getClassName(self);
    v35 = sel_getName(a2);
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value")));
    v122 = *(unsigned __int8 *)objc_msgSend(v36, "bytes");
    v37 = 45;
    if (v33)
      v37 = 43;
    v31(6, "%c[%{public}s %{public}s]:%i Perso state is %x", v37, v34, v35, 88, v122);

  }
  v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v39 = NFSharedLogGetLogger(v38);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = object_getClass(self);
    if (class_isMetaClass(v41))
      v42 = 43;
    else
      v42 = 45;
    v43 = object_getClassName(self);
    v44 = sel_getName(a2);
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value")));
    v46 = *(unsigned __int8 *)objc_msgSend(v45, "bytes");
    *(_DWORD *)buf = 67110146;
    v136 = v42;
    v137 = 2082;
    v138 = v43;
    v139 = 2082;
    v140 = v44;
    v141 = 1024;
    v142 = 88;
    v143 = 1024;
    LODWORD(v144) = v46;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Perso state is %x", buf, 0x28u);

  }
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value")));
  v48 = *(unsigned __int8 *)objc_msgSend(v47, "bytes");

  if (v48 == 90)
  {
    v49 = 0;
    goto LABEL_54;
  }
  if (v48 == 197)
  {
    v49 = 2;
    goto LABEL_54;
  }
  if (v48 != 195)
    goto LABEL_53;
  v49 = 1;
LABEL_54:

  return v49;
}

- (id)_crsGetSharingRequest:(id *)a3 signature:(id *)a4
{
  void *v8;
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
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  _BOOL4 v64;
  const char *v65;
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
  id v76;
  void *v77;
  char *v78;
  void *v79;
  const char *ClassName;
  const char *Name;
  id v83;
  uint64_t v84;
  id v85;
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[5];
  _QWORD v91[5];
  uint8_t buf[4];
  int v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  int v99;
  __int16 v100;
  id v101;

  v85 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:](self, "sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:", 128, 229, 0, 0, 0, 0, 0, &v85));
  v9 = v85;
  if (v9)
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
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i Failed to get sharing request: %{public}@", v15, ClassName, Name, 118, v9);
    }
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(self);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      v21 = object_getClassName(self);
      v22 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v93 = v20;
      v94 = 2082;
      v95 = v21;
      v96 = 2082;
      v97 = v22;
      v98 = 1024;
      v99 = 118;
      v100 = 2114;
      v101 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get sharing request: %{public}@", buf, 0x2Cu);
    }

    v23 = objc_alloc((Class)NSError);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v25 = objc_msgSend(v9, "code");
    v90[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v9, "code") > 70)
      v26 = 71;
    else
      v26 = (uint64_t)objc_msgSend(v9, "code");
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EB778[v26]));
    v91[0] = v55;
    v91[1] = v9;
    v90[1] = NSUnderlyingErrorKey;
    v90[2] = CFSTR("Line");
    v91[2] = &off_100303278;
    v90[3] = CFSTR("Method");
    v56 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v91[3] = v56;
    v90[4] = NSDebugDescriptionErrorKey;
    v57 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 119);
    v91[4] = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v91, v90, 5));
    v59 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, v25, v58);

  }
  else
  {
    if (objc_msgSend(v8, "status") == 36864)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
      v28 = objc_msgSend(v27, "length");

      if ((unint64_t)v28 > 0x41)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
        v78 = (char *)objc_msgSend(v77, "length") - 65;

        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
        *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "subdataWithRange:", 0, 65));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
        v59 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subdataWithRange:", 65, v78));
        goto LABEL_39;
      }
      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFLogGetLogger(v29);
      if (v30)
      {
        v31 = (void (*)(uint64_t, const char *, ...))v30;
        v32 = object_getClass(self);
        v33 = class_isMetaClass(v32);
        v34 = object_getClassName(self);
        v35 = sel_getName(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
        v83 = objc_msgSend(v36, "length");
        v37 = 45;
        if (v33)
          v37 = 43;
        v31(6, "%c[%{public}s %{public}s]:%i Invalid length %lu", v37, v34, v35, 129, v83);

      }
      v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v39 = NFSharedLogGetLogger(v38);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = object_getClass(self);
        if (class_isMetaClass(v41))
          v42 = 43;
        else
          v42 = 45;
        v43 = object_getClassName(self);
        v44 = sel_getName(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
        v46 = objc_msgSend(v45, "length");
        *(_DWORD *)buf = 67110146;
        v93 = v42;
        v94 = 2082;
        v95 = v43;
        v96 = 2082;
        v97 = v44;
        v98 = 1024;
        v99 = 129;
        v100 = 2048;
        v101 = v46;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid length %lu", buf, 0x2Cu);

      }
      v47 = objc_alloc((Class)NSError);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v86[0] = NSLocalizedDescriptionKey;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
      v87[0] = v48;
      v87[1] = &off_1003032A8;
      v86[1] = CFSTR("Line");
      v86[2] = CFSTR("Method");
      v49 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v87[2] = v49;
      v86[3] = NSDebugDescriptionErrorKey;
      v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 130);
      v87[3] = v50;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 4));
      v52 = v47;
      v53 = v24;
      v54 = 13;
    }
    else
    {
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = NFLogGetLogger(v60);
      if (v61)
      {
        v62 = (void (*)(uint64_t, const char *, ...))v61;
        v63 = object_getClass(self);
        v64 = class_isMetaClass(v63);
        v65 = object_getClassName(self);
        v66 = sel_getName(a2);
        v84 = objc_msgSend(v8, "status");
        v67 = 45;
        if (v64)
          v67 = 43;
        v62(3, "%c[%{public}s %{public}s]:%i Failed to get sharing request, expecting 0x9000, got 0x%x", v67, v65, v66, 123, v84);
      }
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFSharedLogGetLogger(v68);
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        v71 = object_getClass(self);
        if (class_isMetaClass(v71))
          v72 = 43;
        else
          v72 = 45;
        v73 = object_getClassName(self);
        v74 = sel_getName(a2);
        v75 = objc_msgSend(v8, "status");
        *(_DWORD *)buf = 67110146;
        v93 = v72;
        v94 = 2082;
        v95 = v73;
        v96 = 2082;
        v97 = v74;
        v98 = 1024;
        v99 = 123;
        v100 = 1024;
        LODWORD(v101) = v75;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get sharing request, expecting 0x9000, got 0x%x", buf, 0x28u);
      }

      v76 = objc_alloc((Class)NSError);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v88[0] = NSLocalizedDescriptionKey;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
      v89[0] = v48;
      v89[1] = &off_100303290;
      v88[1] = CFSTR("Line");
      v88[2] = CFSTR("Method");
      v49 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v89[2] = v49;
      v88[3] = NSDebugDescriptionErrorKey;
      v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 124);
      v89[3] = v50;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v89, v88, 4));
      v52 = v76;
      v53 = v24;
      v54 = 16;
    }
    v59 = objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, v54, v51);

  }
LABEL_39:

  return v59;
}

- (id)_crsSetSharingResult:(id)a3 signature:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
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
  _QWORD *v52;
  _QWORD *v53;
  void *v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  unsigned int v69;
  const char *ClassName;
  const char *Name;
  const char *v73;
  uint64_t v74;
  id v75;
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[4];
  _QWORD v80[5];
  _QWORD v81[5];
  uint8_t buf[4];
  int v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  id v91;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  objc_msgSend(v9, "appendData:", v8);

  objc_msgSend(v9, "appendData:", v7);
  v75 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:](self, "sendCommandWithClass:instruction:p1:p2:data:expectedLength:toOS:error:", 128, 230, 0, 0, v9, 0, 0, &v75));
  v11 = v75;
  if (v11)
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
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i Failed to set sharing result: %{public}@", v17, ClassName, Name, 158, v11);
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
      *(_DWORD *)buf = 67110146;
      v83 = v22;
      v84 = 2082;
      v85 = v23;
      v86 = 2082;
      v87 = v24;
      v88 = 1024;
      v89 = 158;
      v90 = 2114;
      v91 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set sharing result: %{public}@", buf, 0x2Cu);
    }

    v25 = objc_alloc((Class)NSError);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v27 = objc_msgSend(v11, "code");
    v80[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v11, "code") > 70)
      v28 = 71;
    else
      v28 = (uint64_t)objc_msgSend(v11, "code");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EB778[v28]));
    v81[0] = v30;
    v81[1] = v11;
    v80[1] = NSUnderlyingErrorKey;
    v80[2] = CFSTR("Line");
    v81[2] = &off_1003032C0;
    v80[3] = CFSTR("Method");
    v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v81[3] = v31;
    v80[4] = NSDebugDescriptionErrorKey;
    v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 159);
    v81[4] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 5));
    v34 = v25;
    v35 = v26;
    v36 = (uint64_t)v27;
    goto LABEL_39;
  }
  if (!v10)
  {
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    if (v38)
    {
      v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      v41 = class_isMetaClass(v40);
      v42 = object_getClassName(self);
      v73 = sel_getName(a2);
      v43 = 45;
      if (v41)
        v43 = 43;
      v39(3, "%c[%{public}s %{public}s]:%i Failed to set sharing result, expecting RAPDU", v43, v42, v73, 162);
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
      v49 = object_getClassName(self);
      v50 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v83 = v48;
      v84 = 2082;
      v85 = v49;
      v86 = 2082;
      v87 = v50;
      v88 = 1024;
      v89 = 162;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set sharing result, expecting RAPDU", buf, 0x22u);
    }

    v51 = objc_alloc((Class)NSError);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v78[0] = NSLocalizedDescriptionKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v79[0] = v30;
    v79[1] = &off_1003032D8;
    v78[1] = CFSTR("Line");
    v78[2] = CFSTR("Method");
    v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v79[2] = v31;
    v78[3] = NSDebugDescriptionErrorKey;
    v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 163);
    v79[3] = v32;
    v52 = v79;
    v53 = v78;
    goto LABEL_38;
  }
  if (objc_msgSend(v10, "status") != 36864)
  {
    v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v55 = NFLogGetLogger(v54);
    if (v55)
    {
      v56 = (void (*)(uint64_t, const char *, ...))v55;
      v57 = object_getClass(self);
      v58 = class_isMetaClass(v57);
      v59 = object_getClassName(self);
      v60 = sel_getName(a2);
      v74 = objc_msgSend(v10, "status");
      v61 = 45;
      if (v58)
        v61 = 43;
      v56(3, "%c[%{public}s %{public}s]:%i Failed to set sharing result, expecting 0x9000, got 0x%x", v61, v59, v60, 166, v74);
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
      v69 = objc_msgSend(v10, "status");
      *(_DWORD *)buf = 67110146;
      v83 = v66;
      v84 = 2082;
      v85 = v67;
      v86 = 2082;
      v87 = v68;
      v88 = 1024;
      v89 = 166;
      v90 = 1024;
      LODWORD(v91) = v69;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set sharing result, expecting 0x9000, got 0x%x", buf, 0x28u);
    }

    v51 = objc_alloc((Class)NSError);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v76[0] = NSLocalizedDescriptionKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
    v77[0] = v30;
    v77[1] = &off_1003032F0;
    v76[1] = CFSTR("Line");
    v76[2] = CFSTR("Method");
    v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v77[2] = v31;
    v76[3] = NSDebugDescriptionErrorKey;
    v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 167);
    v77[3] = v32;
    v52 = v77;
    v53 = v76;
LABEL_38:
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v53, 4));
    v34 = v51;
    v35 = v26;
    v36 = 16;
LABEL_39:
    v29 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, v36, v33);

    goto LABEL_40;
  }
  v29 = 0;
LABEL_40:

  return v29;
}

- (id)performSharing
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];

  v32 = 0;
  v33 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper _crsGetSharingRequest:signature:](self, "_crsGetSharingRequest:signature:", &v33, &v32));
  v5 = v33;
  v6 = v32;
  v29 = v6;
  if (v4)
  {
    v7 = objc_alloc((Class)NSError);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v9 = objc_msgSend(v4, "code");
    v38[0] = NSLocalizedDescriptionKey;
    v10 = v5;
    if ((uint64_t)objc_msgSend(v4, "code") > 70)
      v11 = 71;
    else
      v11 = (uint64_t)objc_msgSend(v4, "code");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EB778[v11]));
    v39[0] = v18;
    v39[1] = v4;
    v38[1] = NSUnderlyingErrorKey;
    v38[2] = CFSTR("Line");
    v39[2] = &off_100303308;
    v38[3] = CFSTR("Method");
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v39[3] = v19;
    v38[4] = NSDebugDescriptionErrorKey;
    v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 183);
    v39[4] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 5));
    v22 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, v9, v21);
    v15 = 0;
    v16 = 0;
    goto LABEL_18;
  }
  v12 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper serialNumberAsData](self, "serialNumberAsData"));
  v30 = 0;
  v31 = 0;
  v14 = sub_10020BA00((uint64_t)NFSSEWrapper, v5, v12, v13, &v31, &v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v15 = v31;
  v16 = v30;

  if (v4)
  {
    v28 = objc_alloc((Class)NSError);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v27 = objc_msgSend(v4, "code");
    v36[0] = NSLocalizedDescriptionKey;
    v10 = v5;
    if ((uint64_t)objc_msgSend(v4, "code") > 70)
      v17 = 71;
    else
      v17 = (uint64_t)objc_msgSend(v4, "code");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EB778[v17]));
    v37[0] = v18;
    v37[1] = v4;
    v36[1] = NSUnderlyingErrorKey;
    v36[2] = CFSTR("Line");
    v37[2] = &off_100303320;
    v36[3] = CFSTR("Method");
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v37[3] = v19;
    v36[4] = NSDebugDescriptionErrorKey;
    v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 192);
    v37[4] = v20;
    v24 = v37;
    v25 = v36;
LABEL_17:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v25, 5));
    v22 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v8, v27, v21);
LABEL_18:

    v5 = v10;
    v12 = v29;
    goto LABEL_19;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper _crsSetSharingResult:signature:](self, "_crsSetSharingResult:signature:", v15, v16));
  if (v4)
  {
    v28 = objc_alloc((Class)NSError);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v27 = objc_msgSend(v4, "code");
    v34[0] = NSLocalizedDescriptionKey;
    v10 = v5;
    if ((uint64_t)objc_msgSend(v4, "code") > 70)
      v23 = 71;
    else
      v23 = (uint64_t)objc_msgSend(v4, "code");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EB778[v23]));
    v35[0] = v18;
    v35[1] = v4;
    v34[1] = NSUnderlyingErrorKey;
    v34[2] = CFSTR("Line");
    v35[2] = &off_100303338;
    v34[3] = CFSTR("Method");
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v35[3] = v19;
    v34[4] = NSDebugDescriptionErrorKey;
    v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 197);
    v35[4] = v20;
    v24 = v35;
    v25 = v34;
    goto LABEL_17;
  }
  v22 = 0;
LABEL_19:

  return v22;
}

- (id)checkPairing
{
  unsigned int v4;
  unsigned int v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  _QWORD v17[4];

  v4 = sub_1001E45B4(self, 0xFFFFFFFFLL);
  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc((Class)NSError);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v8 = v5;
    v16[0] = NSLocalizedDescriptionKey;
    if (v5 >= 0x47)
      v9 = 71;
    else
      v9 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EB778[v9]));
    v17[0] = v10;
    v17[1] = &off_100303350;
    v16[1] = CFSTR("Line");
    v16[2] = CFSTR("Method");
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17[2] = v11;
    v16[3] = NSDebugDescriptionErrorKey;
    v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 216);
    v17[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
    v14 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, v8, v13);

    -[NFSecureElementWrapper setUnpairedState](self, "setUnpairedState");
    return v14;
  }
  else
  {
    -[NFSecureElementWrapper storePairedState](self, "storePairedState");
    return 0;
  }
}

- (id)checkPerBootAuthKeysAreStillPresent
{
  unint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  id v19;
  void *specific;
  uint64_t Logger;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  int v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  int v42;
  NSObject *v43;
  uint32_t v44;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  void (*v49)(uint64_t, const char *, ...);
  objc_class *v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  objc_class *v55;
  int v56;
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  objc_class *v64;
  int v65;
  id v66;
  void *v67;
  void *v68;
  const char *v69;
  const char *v70;
  const char *Name;
  const char *v72;
  const char *v73;
  const char *v74;
  NSErrorUserInfoKey v75;
  void *v76;
  uint8_t buf[4];
  int v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  unint64_t v86;

  if (!-[NFSecureElementWrapper jcopSupportsPerBootAuthKeys](self, "jcopSupportsPerBootAuthKeys"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v22 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v26 = 45;
      if (isMetaClass)
        v26 = 43;
      v22(6, "%c[%{public}s %{public}s]:%i JCOP doesn't support per boot auth keys", v26, ClassName, Name, 228);
    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v5 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    v29 = object_getClass(self);
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    *(_DWORD *)buf = 67109890;
    v78 = v30;
    v79 = 2082;
    v80 = object_getClassName(self);
    v81 = 2082;
    v82 = sel_getName(a2);
    v83 = 1024;
    v84 = 228;
    v31 = "%c[%{public}s %{public}s]:%i JCOP doesn't support per boot auth keys";
LABEL_33:
    v43 = v5;
    v44 = 34;
    goto LABEL_34;
  }
  if (!sub_10020B070((uint64_t)NFSSEWrapper))
  {
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFLogGetLogger(v32);
    if (v33)
    {
      v34 = (void (*)(uint64_t, const char *, ...))v33;
      v35 = object_getClass(self);
      v36 = class_isMetaClass(v35);
      v37 = object_getClassName(self);
      v72 = sel_getName(a2);
      v38 = 45;
      if (v36)
        v38 = 43;
      v34(6, "%c[%{public}s %{public}s]:%i SSE does not support pairing V2", v38, v37, v72, 233);
    }
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger(v39);
    v5 = objc_claimAutoreleasedReturnValue(v40);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    v41 = object_getClass(self);
    if (class_isMetaClass(v41))
      v42 = 43;
    else
      v42 = 45;
    *(_DWORD *)buf = 67109890;
    v78 = v42;
    v79 = 2082;
    v80 = object_getClassName(self);
    v81 = 2082;
    v82 = sel_getName(a2);
    v83 = 1024;
    v84 = 233;
    v31 = "%c[%{public}s %{public}s]:%i SSE does not support pairing V2";
    goto LABEL_33;
  }
  v4 = -[NFSecureElementWrapper pairedState](self, "pairedState");
  if (v4 != 2)
  {
    v46 = v4;
    v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v48 = NFLogGetLogger(v47);
    if (v48)
    {
      v49 = (void (*)(uint64_t, const char *, ...))v48;
      v50 = object_getClass(self);
      v51 = class_isMetaClass(v50);
      v69 = object_getClassName(self);
      v73 = sel_getName(a2);
      v52 = 45;
      if (v51)
        v52 = 43;
      v49(6, "%c[%{public}s %{public}s]:%i Pairing state is %lu, not re-negotiating", v52, v69, v73, 239, v46);
    }
    v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v54 = NFSharedLogGetLogger(v53);
    v5 = objc_claimAutoreleasedReturnValue(v54);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    v55 = object_getClass(self);
    if (class_isMetaClass(v55))
      v56 = 43;
    else
      v56 = 45;
    *(_DWORD *)buf = 67110146;
    v78 = v56;
    v79 = 2082;
    v80 = object_getClassName(self);
    v81 = 2082;
    v82 = sel_getName(a2);
    v83 = 1024;
    v84 = 239;
    v85 = 2048;
    v86 = v46;
    v31 = "%c[%{public}s %{public}s]:%i Pairing state is %lu, not re-negotiating";
    v43 = v5;
    v44 = 44;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v31, buf, v44);
LABEL_35:
    v19 = 0;
    goto LABEL_36;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper serialNumberAsData](self, "serialNumberAsData"));
  v6 = sub_10020B0B4((uint64_t)NFSSEWrapper, v5);
  v7 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v8 = NFLogGetLogger(v7);
  v9 = (void (*)(uint64_t, const char *, ...))v8;
  if (v6 == 3)
  {
    if (v8)
    {
      v10 = object_getClass(self);
      v11 = class_isMetaClass(v10);
      v12 = object_getClassName(self);
      v70 = sel_getName(a2);
      v13 = 45;
      if (v11)
        v13 = 43;
      v9(6, "%c[%{public}s %{public}s]:%i sharingState is %hhu", v13, v12, v70, 250, 3);
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
      *(_DWORD *)buf = 67110146;
      v78 = v18;
      v79 = 2082;
      v80 = object_getClassName(self);
      v81 = 2082;
      v82 = sel_getName(a2);
      v83 = 1024;
      v84 = 250;
      v85 = 1024;
      LODWORD(v86) = 3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sharingState is %hhu", buf, 0x28u);
    }
    v19 = 0;
  }
  else
  {
    if (v8)
    {
      v57 = object_getClass(self);
      v58 = class_isMetaClass(v57);
      v59 = object_getClassName(self);
      v74 = sel_getName(a2);
      v60 = 45;
      if (v58)
        v60 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Error : SEP lost it again...", v60, v59, v74, 246);
    }
    v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v62 = NFSharedLogGetLogger(v61);
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = object_getClass(self);
      if (class_isMetaClass(v64))
        v65 = 43;
      else
        v65 = 45;
      *(_DWORD *)buf = 67109890;
      v78 = v65;
      v79 = 2082;
      v80 = object_getClassName(self);
      v81 = 2082;
      v82 = sel_getName(a2);
      v83 = 1024;
      v84 = 246;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : SEP lost it again...", buf, 0x22u);
    }

    qword_10032AC20 = 0;
    v66 = objc_alloc((Class)NSError);
    v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v75 = NSLocalizedDescriptionKey;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v76 = v67;
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
    v19 = objc_msgSend(v66, "initWithDomain:code:userInfo:", v16, 12, v68);

  }
LABEL_36:

  return v19;
}

- (id)negotiatePerBootAuthKeys
{
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  _BOOL4 v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  unint64_t v38;
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
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  objc_class *v58;
  _BOOL4 v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  objc_class *v64;
  int v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void (*v78)(uint64_t, const char *, ...);
  objc_class *v79;
  _BOOL4 v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  objc_class *v85;
  int v86;
  const char *v87;
  const char *v88;
  void *v89;
  uint64_t v90;
  void (*v91)(uint64_t, const char *, ...);
  objc_class *v92;
  _BOOL4 v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  id v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void (*v107)(uint64_t, const char *, ...);
  objc_class *v108;
  _BOOL4 v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  NSObject *v113;
  objc_class *v114;
  int v115;
  const char *v116;
  const char *v117;
  const char *v118;
  objc_class *v119;
  _BOOL4 v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  NSObject *v125;
  objc_class *v126;
  int v127;
  const char *v128;
  const char *v129;
  id v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void (*v137)(uint64_t, const char *, ...);
  objc_class *v138;
  _BOOL4 v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  NSObject *v144;
  objc_class *v145;
  int v146;
  const char *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void (*v152)(uint64_t, const char *, ...);
  objc_class *v153;
  _BOOL4 v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  objc_class *v158;
  int v159;
  const char *v160;
  const char *v161;
  const char *v162;
  const char *v163;
  const char *v164;
  const char *v165;
  const char *Name;
  const char *v167;
  const char *v168;
  const char *v169;
  const char *v170;
  const char *v171;
  const char *v172;
  const char *v173;
  const char *v174;
  const char *v175;
  id v176;
  id v177;
  _QWORD v178[4];
  _QWORD v179[4];
  NSErrorUserInfoKey v180;
  void *v181;
  uint8_t buf[4];
  _BYTE v183[14];
  __int16 v184;
  const char *v185;
  __int16 v186;
  int v187;
  __int16 v188;
  unint64_t v189;
  _QWORD v190[5];
  _QWORD v191[5];

  if (qword_10032AC20)
    return 0;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 266);
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
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v183 = v16;
    *(_WORD *)&v183[4] = 2082;
    *(_QWORD *)&v183[6] = object_getClassName(self);
    v184 = 2082;
    v185 = sel_getName(a2);
    v186 = 1024;
    v187 = 266;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if (!-[NFSecureElementWrapper jcopSupportsPerBootAuthKeys](self, "jcopSupportsPerBootAuthKeys"))
    return (id)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper checkPairing](self, "checkPairing"));
  if (!sub_10020B070((uint64_t)NFSSEWrapper))
  {
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFLogGetLogger(v24);
    if (v25)
    {
      v26 = (void (*)(uint64_t, const char *, ...))v25;
      v27 = object_getClass(self);
      v28 = class_isMetaClass(v27);
      v29 = object_getClassName(self);
      v167 = sel_getName(a2);
      v30 = 45;
      if (v28)
        v30 = 43;
      v26(6, "%c[%{public}s %{public}s]:%i V2 pairing not supported on Eos. Forcing entanglement.", v30, v29, v167, 273);
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
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v183 = v35;
      *(_WORD *)&v183[4] = 2082;
      *(_QWORD *)&v183[6] = v36;
      v184 = 2082;
      v185 = v37;
      v186 = 1024;
      v187 = 273;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i V2 pairing not supported on Eos. Forcing entanglement.", buf, 0x22u);
    }

    +[NFSecureElementWrapper setAuthRandomEntangled](NFSecureElementWrapper, "setAuthRandomEntangled");
    return (id)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper checkPairing](self, "checkPairing"));
  }
  v177 = 0;
  v17 = -[NFSecureElementWrapper selectCRSWithError:](self, "selectCRSWithError:", &v177);
  v18 = v177;
  if (v18)
  {
    v19 = v18;
    v20 = objc_alloc((Class)NSError);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v22 = objc_msgSend(v19, "code");
    v190[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)objc_msgSend(v19, "code") > 70)
      v23 = 71;
    else
      v23 = (uint64_t)objc_msgSend(v19, "code");
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002EB778[v23]));
    v191[0] = v54;
    v191[1] = v19;
    v190[1] = NSUnderlyingErrorKey;
    v190[2] = CFSTR("Line");
    v191[2] = &off_100303368;
    v190[3] = CFSTR("Method");
    v55 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v191[3] = v55;
    v190[4] = NSDebugDescriptionErrorKey;
    v56 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 280);
    v191[4] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v191, v190, 5));
    v53 = objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, v22, v57);

LABEL_41:
LABEL_42:

    return v53;
  }
  v176 = 0;
  v38 = -[NFSecureElementWrapper _crsGetPersoState:](self, "_crsGetPersoState:", &v176);
  v19 = v176;
  v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v40 = NFLogGetLogger(v39);
  v41 = (void (*)(uint64_t, const char *, ...))v40;
  if (v19)
  {
    if (v40)
    {
      v42 = object_getClass(self);
      v43 = class_isMetaClass(v42);
      v44 = object_getClassName(self);
      v168 = sel_getName(a2);
      v45 = 45;
      if (v43)
        v45 = 43;
      v41(6, "%c[%{public}s %{public}s]:%i V2 pairing not supported on Eos. Forcing entanglement.", v45, v44, v168, 286);
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
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
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v183 = v50;
      *(_WORD *)&v183[4] = 2082;
      *(_QWORD *)&v183[6] = v51;
      v184 = 2082;
      v185 = v52;
      v186 = 1024;
      v187 = 286;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i V2 pairing not supported on Eos. Forcing entanglement.", buf, 0x22u);
    }

    +[NFSecureElementWrapper setAuthRandomEntangled](NFSecureElementWrapper, "setAuthRandomEntangled");
    v53 = (id)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper checkPairing](self, "checkPairing"));
    goto LABEL_42;
  }
  if (v40)
  {
    v58 = object_getClass(self);
    v59 = class_isMetaClass(v58);
    v162 = object_getClassName(self);
    v169 = sel_getName(a2);
    v60 = 45;
    if (v59)
      v60 = 43;
    v41(6, "%c[%{public}s %{public}s]:%i CRS Perso state is %lu", v60, v162, v169, 290, v38);
  }
  v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v62 = NFSharedLogGetLogger(v61);
  v63 = objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    v64 = object_getClass(self);
    if (class_isMetaClass(v64))
      v65 = 43;
    else
      v65 = 45;
    v66 = object_getClassName(self);
    v67 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v183 = v65;
    *(_WORD *)&v183[4] = 2082;
    *(_QWORD *)&v183[6] = v66;
    v184 = 2082;
    v185 = v67;
    v186 = 1024;
    v187 = 290;
    v188 = 2048;
    v189 = v38;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CRS Perso state is %lu", buf, 0x2Cu);
  }

  if (v38 - 1 < 2)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper serialNumberAsData](self, "serialNumberAsData"));
    v75 = sub_10020B0B4((uint64_t)NFSSEWrapper, v19);
    v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v77 = NFLogGetLogger(v76);
    v78 = (void (*)(uint64_t, const char *, ...))v77;
    if (!(_DWORD)v75)
    {
      if (v77)
      {
        v119 = object_getClass(self);
        v120 = class_isMetaClass(v119);
        v121 = object_getClassName(self);
        v173 = sel_getName(a2);
        v122 = 45;
        if (v120)
          v122 = 43;
        v78(3, "%c[%{public}s %{public}s]:%i Unknown SSE sharing state", v122, v121, v173, 309);
      }
      v123 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v124 = NFSharedLogGetLogger(v123);
      v125 = objc_claimAutoreleasedReturnValue(v124);
      if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
      {
        v126 = object_getClass(self);
        if (class_isMetaClass(v126))
          v127 = 43;
        else
          v127 = 45;
        v128 = object_getClassName(self);
        v129 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v183 = v127;
        *(_WORD *)&v183[4] = 2082;
        *(_QWORD *)&v183[6] = v128;
        v184 = 2082;
        v185 = v129;
        v186 = 1024;
        v187 = 309;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown SSE sharing state", buf, 0x22u);
      }

      -[NFSecureElementWrapper setUnpairedState](self, "setUnpairedState");
      v130 = objc_alloc((Class)NSError);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v178[0] = NSLocalizedDescriptionKey;
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
      v179[0] = v131;
      v179[1] = &off_100303380;
      v178[1] = CFSTR("Line");
      v178[2] = CFSTR("Method");
      v132 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v179[2] = v132;
      v178[3] = NSDebugDescriptionErrorKey;
      v133 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 311);
      v179[3] = v133;
      v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v179, v178, 4));
      v53 = objc_msgSend(v130, "initWithDomain:code:userInfo:", v21, 12, v134);

      goto LABEL_41;
    }
    if (v77)
    {
      v79 = object_getClass(self);
      v80 = class_isMetaClass(v79);
      v163 = object_getClassName(self);
      v170 = sel_getName(a2);
      v81 = 45;
      if (v80)
        v81 = 43;
      v78(3, "%c[%{public}s %{public}s]:%i SSE sharing state is %d", v81, v163, v170, 314, v75);
    }
    v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v83 = NFSharedLogGetLogger(v82);
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      v85 = object_getClass(self);
      if (class_isMetaClass(v85))
        v86 = 43;
      else
        v86 = 45;
      v87 = object_getClassName(self);
      v88 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v183 = v86;
      *(_WORD *)&v183[4] = 2082;
      *(_QWORD *)&v183[6] = v87;
      v184 = 2082;
      v185 = v88;
      v186 = 1024;
      v187 = 314;
      v188 = 1024;
      LODWORD(v189) = v75;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SSE sharing state is %d", buf, 0x28u);
    }

    if ((_DWORD)v75 == 1)
    {
      v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v90 = NFLogGetLogger(v89);
      if (v90)
      {
        v91 = (void (*)(uint64_t, const char *, ...))v90;
        v92 = object_getClass(self);
        v93 = class_isMetaClass(v92);
        v94 = object_getClassName(self);
        v171 = sel_getName(a2);
        v95 = 45;
        if (v93)
          v95 = 43;
        v91(6, "%c[%{public}s %{public}s]:%i Setting key", v95, v94, v171, 316);
      }
      v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v97 = NFSharedLogGetLogger(v96);
      v98 = objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        v99 = object_getClass(self);
        if (class_isMetaClass(v99))
          v100 = 43;
        else
          v100 = 45;
        v101 = object_getClassName(self);
        v102 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v183 = v100;
        *(_WORD *)&v183[4] = 2082;
        *(_QWORD *)&v183[6] = v101;
        v184 = 2082;
        v185 = v102;
        v186 = 1024;
        v187 = 316;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting key", buf, 0x22u);
      }

      v103 = sub_10020B290((uint64_t)NFSSEWrapper, v19);
      v104 = objc_claimAutoreleasedReturnValue(v103);
      if (v104)
      {
        v53 = (id)v104;
        v105 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v106 = NFLogGetLogger(v105);
        if (v106)
        {
          v107 = (void (*)(uint64_t, const char *, ...))v106;
          v108 = object_getClass(self);
          v109 = class_isMetaClass(v108);
          v164 = object_getClassName(self);
          v172 = sel_getName(a2);
          v110 = 45;
          if (v109)
            v110 = 43;
          v107(3, "%c[%{public}s %{public}s]:%i Failed to set SE public key : %{public}@", v110, v164, v172, 320, v53);
        }
        v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v112 = NFSharedLogGetLogger(v111);
        v113 = objc_claimAutoreleasedReturnValue(v112);
        if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          goto LABEL_121;
        v114 = object_getClass(self);
        if (class_isMetaClass(v114))
          v115 = 43;
        else
          v115 = 45;
        v116 = object_getClassName(self);
        v117 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v183 = v115;
        *(_WORD *)&v183[4] = 2082;
        *(_QWORD *)&v183[6] = v116;
        v184 = 2082;
        v185 = v117;
        v186 = 1024;
        v187 = 320;
        v188 = 2114;
        v189 = (unint64_t)v53;
        v118 = "%c[%{public}s %{public}s]:%i Failed to set SE public key : %{public}@";
LABEL_120:
        _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, v118, buf, 0x2Cu);
LABEL_121:

        -[NFSecureElementWrapper setUnpairedState](self, "setUnpairedState");
        goto LABEL_42;
      }
      LODWORD(v75) = sub_10020B0B4((uint64_t)NFSSEWrapper, v19);
    }
    if ((_DWORD)v75 != 2 && v38 == 2)
      goto LABEL_122;
    v135 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v136 = NFLogGetLogger(v135);
    if (v136)
    {
      v137 = (void (*)(uint64_t, const char *, ...))v136;
      v138 = object_getClass(self);
      v139 = class_isMetaClass(v138);
      v140 = object_getClassName(self);
      v174 = sel_getName(a2);
      v141 = 45;
      if (v139)
        v141 = 43;
      v137(6, "%c[%{public}s %{public}s]:%i Performing sharing", v141, v140, v174, 329);
    }
    v142 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v143 = NFSharedLogGetLogger(v142);
    v144 = objc_claimAutoreleasedReturnValue(v143);
    if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
    {
      v145 = object_getClass(self);
      if (class_isMetaClass(v145))
        v146 = 43;
      else
        v146 = 45;
      v147 = object_getClassName(self);
      v148 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v183 = v146;
      *(_WORD *)&v183[4] = 2082;
      *(_QWORD *)&v183[6] = v147;
      v184 = 2082;
      v185 = v148;
      v186 = 1024;
      v187 = 329;
      _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing sharing", buf, 0x22u);
    }

    v149 = objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper performSharing](self, "performSharing"));
    if (!v149)
    {
LABEL_122:
      -[NFSecureElementWrapper storePairedState](self, "storePairedState");
      v53 = 0;
      goto LABEL_42;
    }
    v53 = (id)v149;
    v150 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v151 = NFLogGetLogger(v150);
    if (v151)
    {
      v152 = (void (*)(uint64_t, const char *, ...))v151;
      v153 = object_getClass(self);
      v154 = class_isMetaClass(v153);
      v165 = object_getClassName(self);
      v175 = sel_getName(a2);
      v155 = 45;
      if (v154)
        v155 = 43;
      v152(3, "%c[%{public}s %{public}s]:%i Perform sharing failed : %{public}@", v155, v165, v175, 332, v53);
    }
    v156 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v157 = NFSharedLogGetLogger(v156);
    v113 = objc_claimAutoreleasedReturnValue(v157);
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      goto LABEL_121;
    v158 = object_getClass(self);
    if (class_isMetaClass(v158))
      v159 = 43;
    else
      v159 = 45;
    v160 = object_getClassName(self);
    v161 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v183 = v159;
    *(_WORD *)&v183[4] = 2082;
    *(_QWORD *)&v183[6] = v160;
    v184 = 2082;
    v185 = v161;
    v186 = 1024;
    v187 = 332;
    v188 = 2114;
    v189 = (unint64_t)v53;
    v118 = "%c[%{public}s %{public}s]:%i Perform sharing failed : %{public}@";
    goto LABEL_120;
  }
  if (v38 == 3 || !v38)
    return (id)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper checkPairing](self, "checkPairing"));
  v68 = NFSharedLogGetLogger(0);
  v69 = objc_claimAutoreleasedReturnValue(v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v183 = v38;
    _os_log_fault_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, "Unknown crsPersoState %lu", buf, 0xCu);
  }

  v70 = objc_alloc((Class)NSError);
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v180 = NSLocalizedDescriptionKey;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
  v181 = v72;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1));
  v74 = objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 10, v73);

  return v74;
}

- (unint64_t)getPairingVersion
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  id v8;
  id v9;

  v9 = 0;
  v3 = -[NFSecureElementWrapper selectCRSWithError:](self, "selectCRSWithError:", &v9);
  v4 = v9;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v8 = 0;
    v6 = -[NFSecureElementWrapper _crsGetPersoState:](self, "_crsGetPersoState:", &v8);
    v4 = v8;
    if (v6 - 1 >= 2)
      v5 = v6 == 0;
    else
      v5 = 2;
  }

  return v5;
}

- (id)transceive:(id)a3 error:(id *)a4
{
  return -[NFSecureElementWrapper transceiveData:toOS:error:](self, "transceiveData:toOS:error:", a3, 0, a4);
}

@end
