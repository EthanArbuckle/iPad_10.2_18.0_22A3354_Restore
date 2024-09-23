@implementation NFNdefTagAgent

- (NFNdefTagAgent)init
{
  char *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFNdefTagAgent;
  v2 = -[NFNdefTagAgent init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    *((_WORD *)v2 + 12) = -28672;
    *(_DWORD *)(v2 + 30) = 0x2000;
  }
  return (NFNdefTagAgent *)v2;
}

- (id)handleSelect:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
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

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", CFSTR("D2760000850101")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payload"));

  LODWORD(v5) = objc_msgSend(v6, "isEqualToData:", v7);
  if ((_DWORD)v5)
  {
    *(_WORD *)&self->_isSelected = 1;
    self->_tagWritten = 0;
    *(_WORD *)buf = 144;
    self->_lastStatus = 144;
    v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v8));

  }
  else
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
      v12(3, "%c[%{public}s %{public}s]:%i unhandled AID", v16, ClassName, Name, 91);
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
      *(_DWORD *)buf = 67109890;
      v25 = v21;
      v26 = 2082;
      v27 = object_getClassName(self);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 91;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i unhandled AID", buf, 0x22u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)handleAPDU:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  unsigned int v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  void *v15;
  NSMutableData *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  NSString *selectedFile;
  unsigned int v24;
  unsigned int v25;
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
  void *v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  NSMutableData *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void (*v55)(uint64_t, const char *, ...);
  objc_class *v56;
  _BOOL4 v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  objc_class *v64;
  int v65;
  const char *v66;
  const char *v67;
  int maxTagSize;
  id v69;
  unsigned int v70;
  id v71;
  unint64_t v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *v87;
  _BOOL4 v88;
  const char *v89;
  const char *v90;
  BOOL v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  objc_class *v96;
  int v97;
  const char *v98;
  const char *v99;
  int v100;
  void *specific;
  uint64_t Logger;
  void (*v104)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  objc_class *v112;
  int v113;
  id v114;
  const char *v115;
  const char *v116;
  const char *v117;
  const char *Name;
  void *v119;
  __int16 v120;
  uint8_t buf[4];
  int v122;
  __int16 v123;
  const char *v124;
  __int16 v125;
  const char *v126;
  __int16 v127;
  int v128;
  __int16 v129;
  _QWORD v130[2];

  v5 = a3;
  self->_lastStatus = -28672;
  v6 = v5;
  if (!objc_msgSend(v6, "clss")
    && objc_msgSend(v6, "instruction") == 164
    && !objc_msgSend(v6, "p1")
    && objc_msgSend(v6, "p2") == 12)
  {

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_asHexString"));

    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("E103")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("E104")))
    {
      objc_storeStrong((id *)&self->_selectedFile, v8);
      v9 = 36864;
    }
    else
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v104 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName("_handleSelectCommand:");
        v108 = 45;
        if (isMetaClass)
          v108 = 43;
        v104(4, "%c[%{public}s %{public}s]:%i Unsupported file id requested", v108, ClassName, Name, 144);
      }
      v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v110 = NFSharedLogGetLogger(v109);
      v111 = objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      {
        v112 = object_getClass(self);
        if (class_isMetaClass(v112))
          v113 = 43;
        else
          v113 = 45;
        *(_DWORD *)buf = 67109890;
        v122 = v113;
        v123 = 2082;
        v124 = object_getClassName(self);
        v125 = 2082;
        v126 = sel_getName("_handleSelectCommand:");
        v127 = 1024;
        v128 = 144;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unsupported file id requested", buf, 0x22u);
      }

      v9 = 27266;
    }
    self->_lastStatus = v9;
    *(_WORD *)buf = __rev16(v9);
    v114 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v114));

    goto LABEL_79;
  }

  v10 = v6;
  if (!objc_msgSend(v10, "clss") && objc_msgSend(v10, "instruction") == 176)
  {

    v8 = v10;
    v120 = -28672;
    v11 = objc_msgSend(v8, "p1");
    v12 = objc_msgSend(v8, "p2");
    v13 = (unsigned __int16)objc_msgSend(v8, "lengthExpected");
    if (self->_selectedFile)
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:"));
      v16 = objc_opt_new(NSMutableData);
      if (v15)
      {
        v17 = v12 | (v11 << 8);
        if ((unint64_t)objc_msgSend(v15, "length") > v17
          && (unint64_t)objc_msgSend(v15, "length") < v17 + v14)
        {
          v14 = (unsigned __int16)objc_msgSend(v15, "length") - v17;
        }
        if (v14)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subdataWithRange:", v17, v14));
          -[NSMutableData appendData:](v16, "appendData:", v18);

          if (-[NSString isEqualToString:](self->_selectedFile, "isEqualToString:", CFSTR("E104")))
          {
            self->_tagRead = 1;
            if (v14 + v17 >= self->_ndefPayloadSize)
              -[NFNdefTagAgentDelegate handleNdefTagRead](self->_delegate, "handleNdefTagRead");
          }
        }
        v19 = 36864;
LABEL_46:
        self->_lastStatus = v19;
        v120 = __rev16(v19);
        -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v120, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v16));

        goto LABEL_79;
      }
    }
    else
    {
      v16 = objc_opt_new(NSMutableData);
    }
    v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v39 = NFLogGetLogger(v38);
    if (v39)
    {
      v40 = (void (*)(uint64_t, const char *, ...))v39;
      v41 = object_getClass(self);
      v42 = class_isMetaClass(v41);
      v43 = object_getClassName(self);
      v117 = sel_getName("_handleReadBinaryCommand:");
      v44 = 45;
      if (v42)
        v44 = 43;
      v40(3, "%c[%{public}s %{public}s]:%i no file selected", v44, v43, v117, 176);
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
      *(_DWORD *)buf = 67109890;
      v122 = v49;
      v123 = 2082;
      v124 = object_getClassName(self);
      v125 = 2082;
      v126 = sel_getName("_handleReadBinaryCommand:");
      v127 = 1024;
      v128 = 176;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i no file selected", buf, 0x22u);
    }

    v15 = 0;
    v19 = 27266;
    goto LABEL_46;
  }

  v20 = v10;
  if (!objc_msgSend(v20, "clss") && objc_msgSend(v20, "instruction") == 214)
  {

    v8 = v20;
    v120 = -28672;
    v21 = objc_msgSend(v8, "p1");
    v22 = objc_msgSend(v8, "p2");
    selectedFile = self->_selectedFile;
    if (selectedFile)
    {
      v24 = -[NSString isEqualToString:](selectedFile, "isEqualToString:", CFSTR("E104"));
      if ((v24 & 1) != 0)
      {
        v25 = 36864;
      }
      else
      {
        v25 = 27266;
        v120 = 27266;
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:", self->_selectedFile));
      v50 = objc_opt_new(NSMutableData);
      if (!v24)
        goto LABEL_78;
    }
    else
    {
      v50 = objc_opt_new(NSMutableData);
      v51 = 0;
      v25 = 36864;
    }
    v52 = v22 | (v21 << 8);
    if (objc_msgSend(v8, "payloadLength") + v52 > self->_maxTagSize)
    {
      v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v54 = NFLogGetLogger(v53);
      if (v54)
      {
        v55 = (void (*)(uint64_t, const char *, ...))v54;
        v56 = object_getClass(self);
        v57 = class_isMetaClass(v56);
        v58 = object_getClassName(self);
        v59 = sel_getName("_handleUpdateBinaryCommand:");
        v60 = 45;
        if (v57)
          v60 = 43;
        v55(3, "%c[%{public}s %{public}s]:%i Payload exceeds max tag size: %d", v60, v58, v59, 233, self->_maxTagSize);
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
        v66 = object_getClassName(self);
        v67 = sel_getName("_handleUpdateBinaryCommand:");
        maxTagSize = self->_maxTagSize;
        *(_DWORD *)buf = 67110146;
        v122 = v65;
        v123 = 2082;
        v124 = v66;
        v125 = 2082;
        v126 = v67;
        v127 = 1024;
        v128 = 233;
        v129 = 1024;
        LODWORD(v130[0]) = maxTagSize;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Payload exceeds max tag size: %d", buf, 0x28u);
      }
LABEL_77:

      v25 = 27264;
LABEL_78:
      self->_lastStatus = v25;
      v120 = __rev16(v25);
      -[NSMutableData appendBytes:length:](v50, "appendBytes:length:", &v120, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v50));

      goto LABEL_79;
    }
    v69 = objc_msgSend(v51, "length");
    v70 = objc_msgSend(v8, "payloadLength");
    v119 = v51;
    if ((unint64_t)v69 >= v52)
    {
      v72 = v70 + v52;
      v73 = objc_msgSend(v51, "length");
      v74 = objc_alloc((Class)NSMutableData);
      v75 = v74;
      if ((unint64_t)v73 <= v72)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "subdataWithRange:", 0, v52));
        v71 = objc_msgSend(v75, "initWithData:", v80);

        v77 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payload"));
        objc_msgSend(v71, "appendData:", v77);
        goto LABEL_66;
      }
      v71 = objc_msgSend(v74, "initWithData:", v51);
    }
    else
    {
      v71 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", (unsigned __int16)(v52 + v70));
      objc_msgSend(v71, "replaceBytesInRange:withBytes:", 0, objc_msgSend(v51, "length"), objc_msgSend(objc_retainAutorelease(v51), "bytes"));
    }
    v76 = objc_msgSend(v8, "payloadLength");
    v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payload")));
    v78 = objc_msgSend(v77, "bytes");
    v79 = v76;
    v51 = v119;
    objc_msgSend(v71, "replaceBytesInRange:withBytes:", v52, v79, v78);
LABEL_66:

    -[NSMutableDictionary setObject:forKey:](self->_files, "setObject:forKey:", v71, CFSTR("E104"));
    v81 = objc_alloc((Class)NSData);
    v63 = objc_retainAutorelease(v71);
    v82 = objc_retainAutorelease(objc_msgSend(v81, "initWithBytes:length:", -[NSObject bytes](v63, "bytes"), 2));
    v83 = __rev16(*(unsigned __int16 *)objc_msgSend(v82, "bytes"));
    if (v83 <= self->_maxTagSize)
    {
      self->_ndefPayloadSize = v83;

      if (v25 == 36864)
        self->_tagWritten = 1;
      goto LABEL_78;
    }
    v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v85 = NFLogGetLogger(v84);
    if (v85)
    {
      v86 = (void (*)(uint64_t, const char *, ...))v85;
      v87 = object_getClass(self);
      v88 = class_isMetaClass(v87);
      v89 = object_getClassName(self);
      v90 = sel_getName("_handleUpdateBinaryCommand:");
      v91 = !v88;
      v51 = v119;
      v92 = 45;
      if (!v91)
        v92 = 43;
      v86(3, "%c[%{public}s %{public}s]:%i Payload length %d exceeds max tag size: %d", v92, v89, v90, 276, v83, self->_maxTagSize);
    }
    v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v94 = NFSharedLogGetLogger(v93);
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      v96 = object_getClass(self);
      if (class_isMetaClass(v96))
        v97 = 43;
      else
        v97 = 45;
      v98 = object_getClassName(self);
      v99 = sel_getName("_handleUpdateBinaryCommand:");
      v100 = self->_maxTagSize;
      *(_DWORD *)buf = 67110402;
      v122 = v97;
      v51 = v119;
      v123 = 2082;
      v124 = v98;
      v125 = 2082;
      v126 = v99;
      v127 = 1024;
      v128 = 276;
      v129 = 1024;
      LODWORD(v130[0]) = v83;
      WORD2(v130[0]) = 1024;
      *(_DWORD *)((char *)v130 + 6) = v100;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Payload length %d exceeds max tag size: %d", buf, 0x2Eu);
    }

    self->_ndefPayloadSize = 0;
    goto LABEL_77;
  }

  v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v27 = NFLogGetLogger(v26);
  if (v27)
  {
    v28 = (void (*)(uint64_t, const char *, ...))v27;
    v29 = object_getClass(self);
    v30 = class_isMetaClass(v29);
    v115 = object_getClassName(self);
    v116 = sel_getName(a2);
    v31 = 45;
    if (v30)
      v31 = 43;
    v28(3, "%c[%{public}s %{public}s]:%i Unhandled command: %{public}@", v31, v115, v116, 109, v20);
  }
  v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v33 = NFSharedLogGetLogger(v32);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = object_getClass(self);
    if (class_isMetaClass(v35))
      v36 = 43;
    else
      v36 = 45;
    *(_DWORD *)buf = 67110146;
    v122 = v36;
    v123 = 2082;
    v124 = object_getClassName(self);
    v125 = 2082;
    v126 = sel_getName(a2);
    v127 = 1024;
    v128 = 109;
    v129 = 2114;
    v130[0] = v20;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unhandled command: %{public}@", buf, 0x2Cu);
  }

  *(_WORD *)buf = -32406;
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NFResponseAPDU responseWithData:](NFResponseAPDU, "responseWithData:", v8));
LABEL_79:

  return v37;
}

- (void)handleDeselect
{
  self->_isSelected = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_selectedFile, 0);
}

@end
