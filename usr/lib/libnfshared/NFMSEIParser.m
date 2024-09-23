@implementation NFMSEIParser

+ (unsigned)parseResponseAPDU:(id)a3
{
  id v5;
  unsigned int v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  int64_t v16;
  uint64_t v17;
  int v18;
  char *v19;
  void *v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char *v49;
  void *specific;
  void (*v51)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v55;
  void *v56;
  objc_class *v57;
  int v58;
  const char *v59;
  const char *v60;
  const char *v61;
  char *v62;
  void *v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  objc_class *v70;
  int v71;
  const char *v72;
  const char *v73;
  NSObject *v74;
  uint32_t v75;
  char *v77;
  void *v78;
  void (*v79)(uint64_t, const char *, ...);
  objc_class *v80;
  _BOOL4 v81;
  uint64_t v82;
  void *v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
  char *v88;
  void *v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  _BOOL4 v92;
  uint64_t v93;
  void *v94;
  objc_class *v95;
  int v96;
  const char *v97;
  const char *v98;
  char *v99;
  void *v100;
  void (*v101)(uint64_t, const char *, ...);
  objc_class *v102;
  _BOOL4 v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  objc_class *v107;
  int v108;
  const char *v109;
  const char *v110;
  char *v111;
  void *v112;
  void (*v113)(uint64_t, const char *, ...);
  objc_class *v114;
  _BOOL4 v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  objc_class *v119;
  int v120;
  const char *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *Name;
  const char *v126;
  const char *v127;
  const char *v128;
  const char *v129;
  const char *v130;
  const char *v131;
  unint64_t v132;
  id v133;
  NSObject *obj;
  void *v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint8_t v141[128];
  uint8_t buf[4];
  int v143;
  __int16 v144;
  const char *v145;
  __int16 v146;
  const char *v147;
  __int16 v148;
  int v149;
  __int16 v150;
  int v151;
  __int16 v152;
  int v153;
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "length") < 2)
  {
    v6 = 13;
    goto LABEL_101;
  }
  objc_msgSend(v5, "subdataWithRange:", 0, objc_msgSend(v5, "length") - 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "bytes");
  v10 = *(unsigned __int8 *)(objc_msgSend(v8, "length") + v9 - 2);
  if ((*(unsigned __int8 *)(objc_msgSend(v8, "length") + v9 - 1) | (v10 << 8)) != 0x9000)
  {
    v6 = 16;
    goto LABEL_100;
  }
  v135 = v7;
  v136 = v5;
  v11 = objc_retainAutorelease(v7);
  v12 = objc_msgSend(v11, "bytes");
  if (!objc_msgSend(v11, "length"))
  {
LABEL_65:
    v6 = 0;
    goto LABEL_67;
  }
  v133 = a1;
  v13 = 0;
  v14 = 0;
  while (1)
  {
    if (objc_msgSend(v11, "length") - v13 <= 1)
    {
      v49 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4)
        goto LABEL_153;
      v51 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      v7 = v135;
      v5 = v136;
      if (v51)
      {
        Class = object_getClass(v133);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v133);
        Name = sel_getName(a2);
        v55 = 45;
        if (isMetaClass)
          v55 = 43;
        v51(5, "%c[%{public}s %{public}s]:%i Minimum length requirement not met", v55, ClassName, Name, 50);
        v49 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v56 = dispatch_get_specific(v49);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v28 = (id)_NFSharedLogClient[(_QWORD)v56];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        goto LABEL_98;
      v57 = object_getClass(v133);
      if (class_isMetaClass(v57))
        v58 = 43;
      else
        v58 = 45;
      v59 = object_getClassName(v133);
      v60 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v143 = v58;
      v144 = 2082;
      v145 = v59;
      v146 = 2082;
      v147 = v60;
      v148 = 1024;
      v149 = 50;
      v61 = "%c[%{public}s %{public}s]:%i Minimum length requirement not met";
      goto LABEL_96;
    }
    v15 = *(unsigned __int8 *)(v12 + v13);
    v16 = *(unsigned __int8 *)(v12 + v14 + 1);
    v17 = v14 + 2;
    if (objc_msgSend(v11, "length") - v17 < (unint64_t)v16)
    {
      v62 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v63 >= 4)
        goto LABEL_153;
      v64 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v63);
      v7 = v135;
      v5 = v136;
      if (v64)
      {
        v65 = object_getClass(v133);
        v66 = class_isMetaClass(v65);
        v67 = object_getClassName(v133);
        v126 = sel_getName(a2);
        v68 = 45;
        if (v66)
          v68 = 43;
        v64(5, "%c[%{public}s %{public}s]:%i Incorrect length field", v68, v67, v126, 58);
        v62 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v69 = dispatch_get_specific(v62);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v28 = (id)_NFSharedLogClient[(_QWORD)v69];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        goto LABEL_98;
      v70 = object_getClass(v133);
      if (class_isMetaClass(v70))
        v71 = 43;
      else
        v71 = 45;
      v72 = object_getClassName(v133);
      v73 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v143 = v71;
      v144 = 2082;
      v145 = v72;
      v146 = 2082;
      v147 = v73;
      v148 = 1024;
      v149 = 58;
      v61 = "%c[%{public}s %{public}s]:%i Incorrect length field";
LABEL_96:
      v74 = v28;
      v75 = 34;
      goto LABEL_97;
    }
    if (v15 <= 201)
      break;
    if (v15 == 202 || v15 == 205)
    {
      if ((_DWORD)v16 == 2)
      {
LABEL_19:
        if ((*(unsigned __int8 *)(v14 + v12 + 3) | (*(unsigned __int8 *)(v12 + v17) << 8)) == 0x6985)
          goto LABEL_66;
      }
    }
    else
    {
LABEL_25:
      v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v20 >= 4)
        goto LABEL_153;
      v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v20);
      if (v21)
      {
        v22 = object_getClass(v133);
        v23 = class_isMetaClass(v22);
        v24 = object_getClassName(v133);
        v25 = sel_getName(a2);
        v26 = 45;
        if (v23)
          v26 = 43;
        v21(5, "%c[%{public}s %{public}s]:%i Unrecognized tag: 0x%X", v26, v24, v25, 169, *(unsigned __int8 *)(v12 + v17));
        v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v27 = dispatch_get_specific(v19);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v28 = (id)_NFSharedLogClient[(_QWORD)v27];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = object_getClass(v133);
        if (class_isMetaClass(v29))
          v30 = 43;
        else
          v30 = 45;
        v31 = object_getClassName(v133);
        v32 = sel_getName(a2);
        v33 = *(unsigned __int8 *)(v12 + v17);
        *(_DWORD *)buf = 67110146;
        v143 = v30;
        v144 = 2082;
        v145 = v31;
        v146 = 2082;
        v147 = v32;
        v148 = 1024;
        v149 = 169;
        v150 = 1024;
        v151 = v33;
        _os_log_impl(&dword_1C34DB000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unrecognized tag: 0x%X", buf, 0x28u);
      }
LABEL_61:

    }
LABEL_62:
    v13 = v16 + (int)v17;
    v14 = v13;
    if (objc_msgSend(v11, "length") <= v13)
      goto LABEL_65;
  }
  switch(v15)
  {
    case 16:
      if ((_DWORD)v16 == 2)
        goto LABEL_19;
      if (!(_DWORD)v16)
        goto LABEL_66;
      v18 = *(unsigned __int8 *)(v12 + v17);
      if (*(_BYTE *)(v12 + v17))
      {
        if (v18 != 144 && v18 != 175)
          goto LABEL_66;
      }
      goto LABEL_62;
    case 17:
      if ((v16 & 1) != 0)
      {
        v77 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v78 >= 4)
          goto LABEL_153;
        v79 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v78);
        v7 = v135;
        v5 = v136;
        if (v79)
        {
          v80 = object_getClass(v133);
          v81 = class_isMetaClass(v80);
          v123 = object_getClassName(v133);
          v127 = sel_getName(a2);
          v82 = 45;
          if (v81)
            v82 = 43;
          v79(5, "%c[%{public}s %{public}s]:%i [Tag 0x11] Unexpected data length: 0x%X", v82, v123, v127, 85, v16);
          v77 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v83 = dispatch_get_specific(v77);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v28 = (id)_NFSharedLogClient[(_QWORD)v83];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          goto LABEL_98;
        v84 = object_getClass(v133);
        if (class_isMetaClass(v84))
          v85 = 43;
        else
          v85 = 45;
        v86 = object_getClassName(v133);
        v87 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v143 = v85;
        v144 = 2082;
        v145 = v86;
        v146 = 2082;
        v147 = v87;
        v148 = 1024;
        v149 = 85;
        v150 = 1024;
        v151 = v16;
        v61 = "%c[%{public}s %{public}s]:%i [Tag 0x11] Unexpected data length: 0x%X";
        goto LABEL_126;
      }
      v34 = v14 + 2;
      if ((int)v17 < (int)v16)
      {
        while (__rev16(*(unsigned __int16 *)(v12 + v34)) == 36864)
        {
          v34 += 2;
          if (v34 >= v16)
            goto LABEL_62;
        }
        goto LABEL_66;
      }
      goto LABEL_62;
    case 18:
      if ((v16 & 1) != 0)
      {
        v88 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v89 >= 4)
          goto LABEL_153;
        v90 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v89);
        v7 = v135;
        v5 = v136;
        if (v90)
        {
          v91 = object_getClass(v133);
          v92 = class_isMetaClass(v91);
          v124 = object_getClassName(v133);
          v128 = sel_getName(a2);
          v93 = 45;
          if (v92)
            v93 = 43;
          v90(5, "%c[%{public}s %{public}s]:%i [Tag 0x12] Unexpected data length: 0x%X", v93, v124, v128, 97, v16);
          v88 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v94 = dispatch_get_specific(v88);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v28 = (id)_NFSharedLogClient[(_QWORD)v94];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          goto LABEL_98;
        v95 = object_getClass(v133);
        if (class_isMetaClass(v95))
          v96 = 43;
        else
          v96 = 45;
        v97 = object_getClassName(v133);
        v98 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v143 = v96;
        v144 = 2082;
        v145 = v97;
        v146 = 2082;
        v147 = v98;
        v148 = 1024;
        v149 = 97;
        v150 = 1024;
        v151 = v16;
        v61 = "%c[%{public}s %{public}s]:%i [Tag 0x12] Unexpected data length: 0x%X";
LABEL_126:
        v74 = v28;
        v75 = 40;
        goto LABEL_97;
      }
      v35 = v14 + 2;
      if ((int)v17 < (int)v16)
      {
        while (__rev16(*(unsigned __int16 *)(v12 + v35)) == 36864)
        {
          v35 += 2;
          if (v35 >= v16)
            goto LABEL_62;
        }
LABEL_66:
        v6 = 16;
LABEL_67:
        v7 = v135;
        v5 = v136;
        goto LABEL_100;
      }
      goto LABEL_62;
    case 19:
    case 20:
      goto LABEL_25;
    case 21:
      if (v16 <= 1)
      {
        v99 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v100 < 4)
        {
          v101 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v100);
          v7 = v135;
          v5 = v136;
          if (v101)
          {
            v102 = object_getClass(v133);
            v103 = class_isMetaClass(v102);
            v104 = object_getClassName(v133);
            v129 = sel_getName(a2);
            v105 = 45;
            if (v103)
              v105 = 43;
            v101(5, "%c[%{public}s %{public}s]:%i [Tag 0x%X] Unexpected data length: 0x%X", v105, v104, v129, 125, 21, v16);
            v99 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v106 = dispatch_get_specific(v99);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v28 = (id)_NFSharedLogClient[(_QWORD)v106];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v107 = object_getClass(v133);
            if (class_isMetaClass(v107))
              v108 = 43;
            else
              v108 = 45;
            v109 = object_getClassName(v133);
            v110 = sel_getName(a2);
            *(_DWORD *)buf = 67110402;
            v143 = v108;
            v144 = 2082;
            v145 = v109;
            v146 = 2082;
            v147 = v110;
            v148 = 1024;
            v149 = 125;
            v150 = 1024;
            v151 = 21;
            v152 = 1024;
            v153 = v16;
            v61 = "%c[%{public}s %{public}s]:%i [Tag 0x%X] Unexpected data length: 0x%X";
            goto LABEL_151;
          }
          goto LABEL_98;
        }
        goto LABEL_153;
      }
      if ((*(unsigned __int8 *)(v16 + (int)v17 + v12 - 1) | (*(unsigned __int8 *)(v12 + v14 + (int)v16) << 8)) != 0x9000)
        goto LABEL_66;
      if (*(unsigned __int8 *)(v12 + v17) != 230)
        goto LABEL_66;
      v36 = *(unsigned __int8 *)(v14 + v12 + 3);
      v37 = v36 + v14 + 4;
      if (objc_msgSend(v11, "length") <= v37)
        goto LABEL_66;
      v132 = v37;
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v12 + v17, v36 + 2);
      +[NFTLV simpleTLVsWithData:](NFTLV, "simpleTLVsWithData:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      obj = v39;
      v40 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v141, 16);
      if (!v40)
        goto LABEL_60;
      v41 = v40;
      v42 = *(_QWORD *)v138;
      v131 = a2;
LABEL_53:
      v43 = 0;
      break;
    default:
      if (v15)
        goto LABEL_25;
      if (v16 <= 1)
      {
        v111 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v112 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v112 < 4)
        {
          v113 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v112);
          v7 = v135;
          v5 = v136;
          if (v113)
          {
            v114 = object_getClass(v133);
            v115 = class_isMetaClass(v114);
            v116 = object_getClassName(v133);
            v130 = sel_getName(a2);
            v117 = 45;
            if (v115)
              v117 = 43;
            v113(5, "%c[%{public}s %{public}s]:%i [Tag 0x%X] Unexpected data length: 0x%X", v117, v116, v130, 64, 0, v16);
            v111 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v118 = dispatch_get_specific(v111);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v28 = (id)_NFSharedLogClient[(_QWORD)v118];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v119 = object_getClass(v133);
            if (class_isMetaClass(v119))
              v120 = 43;
            else
              v120 = 45;
            v121 = object_getClassName(v133);
            v122 = sel_getName(a2);
            *(_DWORD *)buf = 67110402;
            v143 = v120;
            v144 = 2082;
            v145 = v121;
            v146 = 2082;
            v147 = v122;
            v148 = 1024;
            v149 = 64;
            v150 = 1024;
            v151 = 0;
            v152 = 1024;
            v153 = v16;
            v61 = "%c[%{public}s %{public}s]:%i [Tag 0x%X] Unexpected data length: 0x%X";
LABEL_151:
            v74 = v28;
            v75 = 46;
LABEL_97:
            _os_log_impl(&dword_1C34DB000, v74, OS_LOG_TYPE_DEFAULT, v61, buf, v75);
          }
LABEL_98:
          v6 = 13;
          goto LABEL_99;
        }
LABEL_153:
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      }
      if ((*(unsigned __int8 *)(v14 + v12 + 3) | (*(unsigned __int8 *)(v12 + v17) << 8)) != 0x9000)
        goto LABEL_66;
      goto LABEL_62;
  }
  while (2)
  {
    if (*(_QWORD *)v138 != v42)
      objc_enumerationMutation(obj);
    v44 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v43);
    objc_msgSend(v44, "value");
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = objc_msgSend(v45, "bytes");

    objc_msgSend(v44, "value");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "length");

    if (!v46)
    {
      v6 = 34;
LABEL_70:
      v28 = obj;

      goto LABEL_71;
    }
    if (__rev16(*(unsigned __int16 *)(v48 + v46 - 2)) != 36864)
    {
      v6 = 16;
      goto LABEL_70;
    }
    if (v41 != ++v43)
      continue;
    break;
  }
  v41 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v141, 16);
  a2 = v131;
  if (v41)
    goto LABEL_53;
LABEL_60:
  v28 = obj;

  if ((*(unsigned __int8 *)(v12 + (int)v132 + 1) | (*(unsigned __int8 *)(v12 + v132) << 8)) == 0x9000)
    goto LABEL_61;
  v6 = 16;
LABEL_71:
  v7 = v135;
  v5 = v136;
LABEL_99:

LABEL_100:
LABEL_101:

  return v6;
}

@end
