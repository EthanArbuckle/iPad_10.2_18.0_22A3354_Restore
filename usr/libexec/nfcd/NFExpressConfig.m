@implementation NFExpressConfig

+ (id)atlConfigKeyForType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (qword_10032AA08 != -1)
    dispatch_once(&qword_10032AA08, &stru_1002E8AD8);
  v4 = (void *)qword_10032AA00;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

+ (unsigned)expressTypeForATLConfigKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  if (qword_10032AA18 != -1)
    dispatch_once(&qword_10032AA18, &stru_1002E8AF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10032AA10, "objectForKeyedSubscript:", v3));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntValue");
  else
    v6 = 0;

  return v6;
}

- (void)dumpConfig:(id)a3 logLevel:(int)a4 prefix:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  uint64_t Logger;
  unsigned int v12;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  os_log_type_t v21;
  objc_class *v22;
  int v23;
  id v24;
  id v25;
  uint64_t v26;
  os_log_type_t v27;
  void *i;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  unint64_t v51;
  os_log_type_t v52;
  objc_class *v53;
  int v54;
  const char *v55;
  const char *v56;
  const char *ClassName;
  const char *v58;
  const char *Name;
  const char *v60;
  const char *v61;
  void *v62;
  id v63;
  uint64_t v64;
  id obj;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  void *v81;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if ((int)v6 <= 6)
  {
    v64 = v6;
    if (v9)
    {
      Logger = NFLogGetLogger(0);
      v12 = v6;
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
        v13(v6, "%c[%{public}s %{public}s]:%i %@: [", v16, ClassName, Name, 137, v10);
      }
      v17 = NFSharedLogGetLogger(0);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = v18;
      v20 = 0x1010000000uLL >> (8 * v12);
      if (v12 >= 7)
        LOBYTE(v20) = 0;
      v21 = v20;
      if (os_log_type_enabled(v18, (os_log_type_t)v20))
      {
        v22 = object_getClass(self);
        if (class_isMetaClass(v22))
          v23 = 43;
        else
          v23 = 45;
        *(_DWORD *)buf = 67110146;
        v73 = v23;
        v74 = 2082;
        v75 = object_getClassName(self);
        v76 = 2082;
        v77 = sel_getName(a2);
        v78 = 1024;
        v79 = 137;
        v80 = 2112;
        v81 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, v21, "%c[%{public}s %{public}s]:%i %@: [", buf, 0x2Cu);
      }

      v6 = v64;
    }
    v62 = v10;
    v63 = v8;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v8;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v68;
      if (v6 >= 7)
        v27 = OS_LOG_TYPE_DEFAULT;
      else
        v27 = (0x1010000000uLL >> (8 * v6));
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v26)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
          v30 = NFLogGetLogger(0);
          if (v30)
          {
            v31 = (void (*)(uint64_t, const char *, ...))v30;
            v32 = object_getClass(self);
            v33 = class_isMetaClass(v32);
            v58 = object_getClassName(self);
            v60 = sel_getName(a2);
            v34 = 45;
            if (v33)
              v34 = 43;
            v31(v6, "%c[%{public}s %{public}s]:%i   %@", v34, v58, v60, 140, v29);
          }
          v35 = NFSharedLogGetLogger(0);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, v27))
          {
            v37 = object_getClass(self);
            if (class_isMetaClass(v37))
              v38 = 43;
            else
              v38 = 45;
            v39 = object_getClassName(self);
            v40 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v73 = v38;
            v6 = v64;
            v74 = 2082;
            v75 = v39;
            v76 = 2082;
            v77 = v40;
            v78 = 1024;
            v79 = 140;
            v80 = 2112;
            v81 = v29;
            _os_log_impl((void *)&_mh_execute_header, v36, v27, "%c[%{public}s %{public}s]:%i   %@", buf, 0x2Cu);
          }

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v25);
    }

    v41 = NFLogGetLogger(0);
    v42 = v6;
    if (v41)
    {
      v43 = (void (*)(uint64_t, const char *, ...))v41;
      v44 = object_getClass(self);
      v45 = class_isMetaClass(v44);
      v46 = object_getClassName(self);
      v61 = sel_getName(a2);
      v47 = 45;
      if (v45)
        v47 = 43;
      v43(v42, "%c[%{public}s %{public}s]:%i ]", v47, v46, v61, 142);
    }
    v48 = NFSharedLogGetLogger(0);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    v50 = v49;
    v51 = 0x1010000000uLL >> (8 * v42);
    if (v42 >= 7)
      LOBYTE(v51) = 0;
    v52 = v51;
    v8 = v63;
    if (os_log_type_enabled(v49, (os_log_type_t)v51))
    {
      v53 = object_getClass(self);
      if (class_isMetaClass(v53))
        v54 = 43;
      else
        v54 = 45;
      v55 = object_getClassName(self);
      v56 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v73 = v54;
      v74 = 2082;
      v75 = v55;
      v76 = 2082;
      v77 = v56;
      v78 = 1024;
      v79 = 142;
      _os_log_impl((void *)&_mh_execute_header, v50, v52, "%c[%{public}s %{public}s]:%i ]", buf, 0x22u);
    }

    v10 = v62;
  }

}

- (void)updateExpressAppletNumbers
{
  unint64_t *p_numberOfExpressFelicaTransitApplets;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
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
  void *v32;
  void *v33;
  uint64_t v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  _BOOL4 v37;
  const char *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  void *v49;
  unint64_t numberOfExpressFelicaTransitApplets;
  unint64_t numberOfExpressCathayTransitApplets;
  unint64_t numberOfExpressECPAccessApplets;
  unint64_t numberOfExpressGenericAApplets;
  unint64_t numberOfExpressECP2Applets;
  unint64_t numberOfExpressSinglePollApplets;
  NSArray *allAids;
  const char *v57;
  const char *v58;
  unint64_t *v59;
  id v60;
  NSMutableArray *v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  _BYTE v89[128];

  *(_OWORD *)&self->_numberOfExpressFelicaTransitApplets = 0u;
  p_numberOfExpressFelicaTransitApplets = &self->_numberOfExpressFelicaTransitApplets;
  *(_OWORD *)&self->_numberOfExpressECPAccessApplets = 0u;
  *(_OWORD *)&self->_numberOfExpressECP2Applets = 0u;
  v4 = objc_opt_new(NSMutableArray);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v59 = p_numberOfExpressFelicaTransitApplets;
  v5 = (id)*(p_numberOfExpressFelicaTransitApplets - 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v89, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v64;
    v60 = v5;
    v61 = v4;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("expressEnabled")));
        v12 = objc_msgSend(v11, "BOOLValue");

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ExpressType")));
          v14 = +[NFExpressConfig expressTypeForATLConfigKey:](NFExpressConfig, "expressTypeForATLConfigKey:", v13);

          switch(v14)
          {
            case 1u:
              ++*v59;
              break;
            case 2u:
              ++self->_numberOfExpressECPAccessApplets;
              break;
            case 3u:
              ++self->_numberOfExpressGenericAApplets;
              break;
            case 4u:
              ++self->_numberOfExpressECP2Applets;
              break;
            case 5u:
              ++self->_numberOfExpressCathayTransitApplets;
              break;
            case 6u:
              ++self->_numberOfExpressSinglePollApplets;
              break;
            default:
              specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              Logger = NFLogGetLogger(specific);
              if (Logger)
              {
                v17 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(self);
                isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(self);
                Name = sel_getName(a2);
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ExpressType")));
                v57 = ClassName;
                v58 = Name;
                v5 = v60;
                v4 = v61;
                v23 = 45;
                if (isMetaClass)
                  v23 = 43;
                v17(4, "%c[%{public}s %{public}s]:%i unknown express type %{public}@", v23, v57, v58, 184, v22);

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
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ExpressType")));
                *(_DWORD *)buf = 67110146;
                v68 = v28;
                v5 = v60;
                v69 = 2082;
                v70 = v29;
                v71 = 2082;
                v72 = v30;
                v73 = 1024;
                v74 = 184;
                v75 = 2114;
                v76 = v31;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i unknown express type %{public}@", buf, 0x2Cu);

                v4 = v61;
              }

              break;
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
          -[NSMutableArray addObject:](v4, "addObject:", v32);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v89, 16);
    }
    while (v7);
  }

  v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v34 = NFLogGetLogger(v33);
  if (v34)
  {
    v35 = (void (*)(uint64_t, const char *, ...))v34;
    v36 = object_getClass(self);
    v37 = class_isMetaClass(v36);
    v38 = object_getClassName(self);
    v39 = sel_getName(a2);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig seName](self, "seName"));
    v41 = 43;
    if (!v37)
      v41 = 45;
    v35(6, "%c[%{public}s %{public}s]:%i %{public}@: num suica = %d, num cathay = %d, num access = %d, num generic-A = %d, num ecp2 = %d, num single poll = %d", v41, v38, v39, 196, v40, *(_OWORD *)&self->_numberOfExpressFelicaTransitApplets, *(_OWORD *)&self->_numberOfExpressECPAccessApplets, self->_numberOfExpressECP2Applets, self->_numberOfExpressSinglePollApplets);

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
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig seName](self, "seName"));
    numberOfExpressFelicaTransitApplets = self->_numberOfExpressFelicaTransitApplets;
    numberOfExpressCathayTransitApplets = self->_numberOfExpressCathayTransitApplets;
    numberOfExpressECPAccessApplets = self->_numberOfExpressECPAccessApplets;
    numberOfExpressGenericAApplets = self->_numberOfExpressGenericAApplets;
    numberOfExpressECP2Applets = self->_numberOfExpressECP2Applets;
    numberOfExpressSinglePollApplets = self->_numberOfExpressSinglePollApplets;
    *(_DWORD *)buf = 67111682;
    v68 = v46;
    v69 = 2082;
    v70 = v47;
    v71 = 2082;
    v72 = v48;
    v73 = 1024;
    v74 = 196;
    v75 = 2114;
    v76 = v49;
    v77 = 1024;
    v78 = numberOfExpressFelicaTransitApplets;
    v79 = 1024;
    v80 = numberOfExpressCathayTransitApplets;
    v81 = 1024;
    v82 = numberOfExpressECPAccessApplets;
    v83 = 1024;
    v84 = numberOfExpressGenericAApplets;
    v85 = 1024;
    v86 = numberOfExpressECP2Applets;
    v87 = 1024;
    v88 = numberOfExpressSinglePollApplets;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@: num suica = %d, num cathay = %d, num access = %d, num generic-A = %d, num ecp2 = %d, num single poll = %d", buf, 0x50u);

  }
  allAids = self->_allAids;
  self->_allAids = &v4->super;

}

- (void)updateAppletCountOnMap:(id)a3
{
  id v4;
  NSMutableArray *passes;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  BOOL v23;
  void *specific;
  uint64_t Logger;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  void *v40;
  id v41;
  void *v42;
  const char *v43;
  const char *v44;
  id v45;
  NSMutableArray *v46;
  NFExpressConfig *v47;
  void *v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
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
  __int16 v66;
  int v67;
  _BYTE v68[128];

  v4 = a3;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  if (self)
    passes = self->_passes;
  else
    passes = 0;
  v6 = passes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v53;
    v10 = CFSTR("expressEnabled");
    v46 = v6;
    v47 = self;
    v49 = v4;
    v50 = *(_QWORD *)v53;
    do
    {
      v11 = 0;
      v51 = v8;
      do
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));
        v14 = objc_msgSend(v13, "BOOLValue");

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ExpressType")));
          v17 = +[NFExpressConfig expressTypeForATLConfigKey:](NFExpressConfig, "expressTypeForATLConfigKey:", v16);

          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v15));
          if (v18)
          {
            v19 = (void *)v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v15));
            v21 = v10;
            v22 = objc_msgSend(v20, "integerValue");

            v9 = v50;
            v23 = v22 == (id)v17;
            v10 = v21;
            if (!v23)
            {
              specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              Logger = NFLogGetLogger(specific);
              if (Logger)
              {
                v26 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(self);
                isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(self);
                Name = sel_getName(a2);
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v15));
                v45 = objc_msgSend(v31, "integerValue");
                v44 = Name;
                self = v47;
                v23 = !isMetaClass;
                v9 = v50;
                v32 = 45;
                if (!v23)
                  v32 = 43;
                v43 = ClassName;
                v10 = v21;
                v26(4, "%c[%{public}s %{public}s]:%i same aid has different express types?! (%ld vs %d)", v32, v43, v44, 212, v45, v17);

                v6 = v46;
              }
              v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v34 = NFSharedLogGetLogger(v33);
              v35 = objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                v36 = object_getClass(self);
                if (class_isMetaClass(v36))
                  v37 = 43;
                else
                  v37 = 45;
                v38 = object_getClassName(self);
                v39 = sel_getName(a2);
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v15));
                v41 = objc_msgSend(v40, "integerValue");
                *(_DWORD *)buf = 67110402;
                v57 = v37;
                v10 = v21;
                v58 = 2082;
                v59 = v38;
                v60 = 2082;
                v61 = v39;
                v6 = v46;
                self = v47;
                v62 = 1024;
                v63 = 212;
                v64 = 2048;
                v65 = v41;
                v66 = 1024;
                v67 = v17;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i same aid has different express types?! (%ld vs %d)", buf, 0x32u);

                v9 = v50;
              }

              v4 = v49;
            }
          }
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v17));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, v15);

          v8 = v51;
        }
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    }
    while (v8);
  }

}

- (id)initFromStorageWithDriverWrapper:(id)a3
{
  id v6;
  NFExpressConfig *v7;
  NFExpressConfig *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL8 v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
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
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  _BOOL4 v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
  NSObject *v56;
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  _BOOL4 v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  void *v82;
  uint64_t v83;
  void (*v84)(uint64_t, const char *, ...);
  objc_class *v85;
  _BOOL4 v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  objc_class *v92;
  int v93;
  const char *v94;
  const char *v95;
  void *v96;
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
  void *v110;
  uint64_t v111;
  void (*v112)(uint64_t, const char *, ...);
  objc_class *v113;
  _BOOL4 v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  NSObject *v119;
  objc_class *v120;
  int v121;
  const char *v122;
  const char *v123;
  NFExpressConfig *v124;
  const char *v126;
  const char *v127;
  const char *Name;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  objc_super v136;
  uint8_t buf[4];
  int v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  const char *v142;
  __int16 v143;
  int v144;
  __int16 v145;
  void *v146;

  v6 = a3;
  v136.receiver = self;
  v136.super_class = (Class)NFExpressConfig;
  v7 = -[NFExpressConfig init](&v136, "init");
  v8 = v7;
  if (!v7)
    goto LABEL_87;
  objc_storeStrong((id *)&v7->_driverWrapper, a3);
  v9 = objc_claimAutoreleasedReturnValue(-[NFExpressConfig fetchFromStorage](v8, "fetchFromStorage"));
  if (!v9)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v8);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v8);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v14(6, "%c[%{public}s %{public}s]:%i Failed to read expressConfig from storage", v18, ClassName, Name, 230);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v10 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v21 = object_getClass(v8);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(v8);
      v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v138 = v22;
      v139 = 2082;
      v140 = v23;
      v141 = 2082;
      v142 = v24;
      v143 = 1024;
      v144 = 230;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to read expressConfig from storage", buf, 0x22u);
    }
    goto LABEL_85;
  }
  v10 = v9;
  if (-[NSObject count](v9, "count"))
  {
    v11 = 0;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig migrateFromDefaults](v8, "migrateFromDefaults"));
    v11 = v25 == 0;
    if (!v25)
    {
      v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v27 = NFLogGetLogger(v26);
      if (v27)
      {
        v28 = (void (*)(uint64_t, const char *, ...))v27;
        v29 = object_getClass(v8);
        v30 = class_isMetaClass(v29);
        v31 = object_getClassName(v8);
        v129 = sel_getName(a2);
        v32 = 45;
        if (v30)
          v32 = 43;
        v28(3, "%c[%{public}s %{public}s]:%i Failed to migrate config from defaults - init with epmty config", v32, v31, v129, 239);
      }
      v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v34 = NFSharedLogGetLogger(v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = object_getClass(v8);
        if (class_isMetaClass(v36))
          v37 = 43;
        else
          v37 = 45;
        v38 = object_getClassName(v8);
        v39 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v138 = v37;
        v139 = 2082;
        v140 = v38;
        v141 = 2082;
        v142 = v39;
        v143 = 1024;
        v144 = 239;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to migrate config from defaults - init with epmty config", buf, 0x22u);
      }

      v40 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v10 = v40;
    }
    v41 = objc_msgSend(v25, "count");
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFLogGetLogger(v42);
    v44 = (void (*)(uint64_t, const char *, ...))v43;
    if (v41)
    {
      if (v43)
      {
        v45 = object_getClass(v8);
        v46 = class_isMetaClass(v45);
        v47 = object_getClassName(v8);
        v130 = sel_getName(a2);
        v48 = 45;
        if (v46)
          v48 = 43;
        v44(6, "%c[%{public}s %{public}s]:%i Successfully migrated from defaults", v48, v47, v130, 244);
      }
      v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v50 = NFSharedLogGetLogger(v49);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = object_getClass(v8);
        if (class_isMetaClass(v52))
          v53 = 43;
        else
          v53 = 45;
        v54 = object_getClassName(v8);
        v55 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v138 = v53;
        v139 = 2082;
        v140 = v54;
        v141 = 2082;
        v142 = v55;
        v143 = 1024;
        v144 = 244;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Successfully migrated from defaults", buf, 0x22u);
      }

      v56 = v10;
      v11 = 1;
      v10 = v25;
    }
    else
    {
      if (v43)
      {
        v57 = object_getClass(v8);
        v58 = class_isMetaClass(v57);
        v59 = object_getClassName(v8);
        v131 = sel_getName(a2);
        v60 = 45;
        if (v58)
          v60 = 43;
        v44(6, "%c[%{public}s %{public}s]:%i No express aids in defaults", v60, v59, v131, 249);
      }
      v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v62 = NFSharedLogGetLogger(v61);
      v56 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v63 = object_getClass(v8);
        if (class_isMetaClass(v63))
          v64 = 43;
        else
          v64 = 45;
        v65 = object_getClassName(v8);
        v66 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v138 = v64;
        v139 = 2082;
        v140 = v65;
        v141 = 2082;
        v142 = v66;
        v143 = 1024;
        v144 = 249;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No express aids in defaults", buf, 0x22u);
      }
    }

  }
  -[NFExpressConfig dumpConfig:logLevel:prefix:](v8, "dumpConfig:logLevel:prefix:", v10, 6, CFSTR("init config"));
  v67 = objc_claimAutoreleasedReturnValue(-[NFExpressConfig reconfigureWithArray:updateStorage:avoidChangingRouting:restoreAuthorization:](v8, "reconfigureWithArray:updateStorage:avoidChangingRouting:restoreAuthorization:", v10, v11, 1, 0));
  if (!v67)
    goto LABEL_86;
  v68 = (void *)v67;
  v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v70 = NFLogGetLogger(v69);
  if (v70)
  {
    v71 = (void (*)(uint64_t, const char *, ...))v70;
    v72 = object_getClass(v8);
    v73 = class_isMetaClass(v72);
    v126 = object_getClassName(v8);
    v132 = sel_getName(a2);
    v74 = 45;
    if (v73)
      v74 = 43;
    v71(3, "%c[%{public}s %{public}s]:%i failed to initialize with stored config - %{public}@", v74, v126, v132, 257, v68);
  }
  v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v76 = NFSharedLogGetLogger(v75);
  v77 = objc_claimAutoreleasedReturnValue(v76);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
  {
    v78 = object_getClass(v8);
    if (class_isMetaClass(v78))
      v79 = 43;
    else
      v79 = 45;
    v80 = object_getClassName(v8);
    v81 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v138 = v79;
    v139 = 2082;
    v140 = v80;
    v141 = 2082;
    v142 = v81;
    v143 = 1024;
    v144 = 257;
    v145 = 2114;
    v146 = v68;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i failed to initialize with stored config - %{public}@", buf, 0x2Cu);
  }

  v82 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v83 = NFLogGetLogger(v82);
  if (v83)
  {
    v84 = (void (*)(uint64_t, const char *, ...))v83;
    v85 = object_getClass(v8);
    v86 = class_isMetaClass(v85);
    v87 = object_getClassName(v8);
    v133 = sel_getName(a2);
    v88 = 45;
    if (v86)
      v88 = 43;
    v84(3, "%c[%{public}s %{public}s]:%i init with empty config instead", v88, v87, v133, 258);
  }
  v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v90 = NFSharedLogGetLogger(v89);
  v91 = objc_claimAutoreleasedReturnValue(v90);
  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
  {
    v92 = object_getClass(v8);
    if (class_isMetaClass(v92))
      v93 = 43;
    else
      v93 = 45;
    v94 = object_getClassName(v8);
    v95 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v138 = v93;
    v139 = 2082;
    v140 = v94;
    v141 = 2082;
    v142 = v95;
    v143 = 1024;
    v144 = 258;
    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i init with empty config instead", buf, 0x22u);
  }

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig reconfigureWithArray:updateStorage:avoidChangingRouting:restoreAuthorization:](v8, "reconfigureWithArray:updateStorage:avoidChangingRouting:restoreAuthorization:", &__NSArray0__struct, 1, 1, 0));
  if (!v96)
  {
LABEL_86:

LABEL_87:
    v124 = v8;
    goto LABEL_88;
  }
  v97 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v98 = NFLogGetLogger(v97);
  if (v98)
  {
    v99 = (void (*)(uint64_t, const char *, ...))v98;
    v100 = object_getClass(v8);
    v101 = class_isMetaClass(v100);
    v127 = object_getClassName(v8);
    v134 = sel_getName(a2);
    v102 = 45;
    if (v101)
      v102 = 43;
    v99(3, "%c[%{public}s %{public}s]:%i failed to initialize with empty config - %{public}@", v102, v127, v134, 261, v96);
  }
  v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v104 = NFSharedLogGetLogger(v103);
  v105 = objc_claimAutoreleasedReturnValue(v104);
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    v106 = object_getClass(v8);
    if (class_isMetaClass(v106))
      v107 = 43;
    else
      v107 = 45;
    v108 = object_getClassName(v8);
    v109 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v138 = v107;
    v139 = 2082;
    v140 = v108;
    v141 = 2082;
    v142 = v109;
    v143 = 1024;
    v144 = 261;
    v145 = 2114;
    v146 = v96;
    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i failed to initialize with empty config - %{public}@", buf, 0x2Cu);
  }

  v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v111 = NFLogGetLogger(v110);
  if (v111)
  {
    v112 = (void (*)(uint64_t, const char *, ...))v111;
    v113 = object_getClass(v8);
    v114 = class_isMetaClass(v113);
    v115 = object_getClassName(v8);
    v135 = sel_getName(a2);
    v116 = 45;
    if (v114)
      v116 = 43;
    v112(3, "%c[%{public}s %{public}s]:%i Express Mode is disabled", v116, v115, v135, 262);
  }
  v117 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v118 = NFSharedLogGetLogger(v117);
  v119 = objc_claimAutoreleasedReturnValue(v118);
  if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
  {
    v120 = object_getClass(v8);
    if (class_isMetaClass(v120))
      v121 = 43;
    else
      v121 = 45;
    v122 = object_getClassName(v8);
    v123 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v138 = v121;
    v139 = 2082;
    v140 = v122;
    v141 = 2082;
    v142 = v123;
    v143 = 1024;
    v144 = 262;
    _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Express Mode is disabled", buf, 0x22u);
  }

LABEL_85:
  v124 = 0;
LABEL_88:

  return v124;
}

- (id)arrayConfigFromDictionary:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  _QWORD v10[5];
  NSMutableArray *v11;
  SEL v12;

  v5 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10013CDCC;
  v10[3] = &unk_1002E8B20;
  v10[4] = self;
  v6 = objc_opt_new(NSMutableArray);
  v11 = v6;
  v12 = a2;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)restoreAuthForApplet:(id)a3
{
  id v5;
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
  void *v19;
  unsigned int v20;
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
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  id v39;
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
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  const char *v64;
  const char *Name;
  const char *v66;
  const char *v67;
  id v68;
  _QWORD v69[5];
  _QWORD v70[5];
  id v71;
  _QWORD v72[5];
  _QWORD v73[5];
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

  v5 = a3;
  if (objc_msgSend(v5, "authTransientSupport"))
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
      v8(6, "%c[%{public}s %{public}s]:%i Applet already requires auth", v12, ClassName, Name, 388);
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
      v75 = v17;
      v76 = 2082;
      v77 = object_getClassName(self);
      v78 = 2082;
      v79 = sel_getName(a2);
      v80 = 1024;
      v81 = 388;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet already requires auth", buf, 0x22u);
    }
    goto LABEL_37;
  }
  v18 = objc_claimAutoreleasedReturnValue(-[NFExpressConfig getSecureElementWrapperAndSetRouting](self, "getSecureElementWrapperAndSetRouting"));
  if (v18)
  {
    v15 = v18;
    v71 = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1));
    v20 = sub_1001E8534(v15, 1, 0xFFFFFFFF, v19, 0);

    if (!v20)
    {
      v62 = sub_10022BED0(v15);
LABEL_37:
      v43 = 0;
      goto LABEL_38;
    }
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFLogGetLogger(v21);
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v26 = object_getClassName(self);
      v66 = sel_getName(a2);
      v27 = 45;
      if (v25)
        v27 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Failed to restore authorization on applet", v27, v26, v66, 403);
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
      *(_DWORD *)buf = 67109890;
      v75 = v32;
      v76 = 2082;
      v77 = v33;
      v78 = 2082;
      v79 = v34;
      v80 = 1024;
      v81 = 403;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore authorization on applet", buf, 0x22u);
    }

    v68 = objc_alloc((Class)NSError);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v36 = v20;
    v69[0] = NSLocalizedDescriptionKey;
    if (v20 >= 0x47)
      v37 = 71;
    else
      v37 = v20;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E8B40[v37]));
    v70[0] = v38;
    v70[1] = &off_1002FFA38;
    v69[1] = CFSTR("Line");
    v69[2] = CFSTR("Method");
    v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v70[2] = v39;
    v69[3] = NSDebugDescriptionErrorKey;
    v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 404);
    v70[3] = v40;
    v69[4] = NSLocalizedFailureReasonErrorKey;
    v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to restore transient auth"));
    v70[4] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69, 5));
    v43 = objc_msgSend(v68, "initWithDomain:code:userInfo:", v35, v36, v42);

  }
  else
  {
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFLogGetLogger(v44);
    if (v45)
    {
      v46 = (void (*)(uint64_t, const char *, ...))v45;
      v47 = object_getClass(self);
      v48 = class_isMetaClass(v47);
      v64 = object_getClassName(self);
      v67 = sel_getName(a2);
      v49 = 45;
      if (v48)
        v49 = 43;
      v46(3, "%c[%{public}s %{public}s]:%i Failed to load SE for applet: %{public}@", v49, v64, v67, 394, v5);
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
      *(_DWORD *)buf = 67110146;
      v75 = v54;
      v76 = 2082;
      v77 = object_getClassName(self);
      v78 = 2082;
      v79 = sel_getName(a2);
      v80 = 1024;
      v81 = 394;
      v82 = 2114;
      v83 = v5;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to load SE for applet: %{public}@", buf, 0x2Cu);
    }

    v55 = objc_alloc((Class)NSError);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v72[0] = NSLocalizedDescriptionKey;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v73[0] = v57;
    v73[1] = &off_1002FFA20;
    v72[1] = CFSTR("Line");
    v72[2] = CFSTR("Method");
    v58 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v73[2] = v58;
    v72[3] = NSDebugDescriptionErrorKey;
    v59 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 395);
    v73[3] = v59;
    v72[4] = NSLocalizedFailureReasonErrorKey;
    v60 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to initialize SE wrapper"));
    v73[4] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 5));
    v43 = objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 15, v61);

    v15 = 0;
  }
LABEL_38:

  return v43;
}

- (id)passForAid:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_passes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appletIdentifier"), (_QWORD)v15));
        v12 = objc_msgSend(v4, "caseInsensitiveCompare:", v11);

        if (!v12)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)removeAppletsFromConfig:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
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
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
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

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig getSecureElementWrapperAndSetRouting](self, "getSecureElementWrapperAndSetRouting"));
  if (v6)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (!v8)
    {

      goto LABEL_31;
    }
    v9 = v8;
    v36 = v6;
    v37 = v5;
    v10 = 0;
    v11 = *(_QWORD *)v39;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(NFApplet);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = v13;
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          if (!v16)
            goto LABEL_16;
        }
        else
        {
          v17 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v13, v17) & 1) == 0)
          {
            v15 = 0;
            goto LABEL_16;
          }
          v16 = v13;
          v15 = 0;
          if (!v16)
            goto LABEL_16;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig passForAid:](self, "passForAid:", v16));
        if (v18)
        {
          -[NSMutableArray removeObject:](self->_passes, "removeObject:", v18);
          v10 = 1;
        }

LABEL_16:
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (!v9)
      {

        v6 = v36;
        v5 = v37;
        if ((v10 & 1) != 0)
        {
          -[NFExpressConfig updateExpressAppletNumbers](self, "updateExpressAppletNumbers");
          -[NFExpressConfig updateStorage](self, "updateStorage");
        }
        goto LABEL_31;
      }
    }
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v21 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig seName](self, "seName"));
    v27 = 45;
    if (isMetaClass)
      v27 = 43;
    v21(3, "%c[%{public}s %{public}s]:%i Failed to initialize %{public}@ wrapper", v27, ClassName, Name, 429, v26);

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
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig seName](self, "seName"));
    *(_DWORD *)buf = 67110146;
    v44 = v32;
    v6 = 0;
    v45 = 2082;
    v46 = v33;
    v47 = 2082;
    v48 = v34;
    v49 = 1024;
    v50 = 429;
    v51 = 2114;
    v52 = v35;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize %{public}@ wrapper", buf, 0x2Cu);

  }
LABEL_31:

}

- (id)reconfigureWithArray:(id)a3 updateStorage:(BOOL)a4 avoidChangingRouting:(BOOL)a5 restoreAuthorization:(BOOL)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  NSMutableArray *passes;
  NFExpressConfig *v12;
  void *v13;
  uint64_t v14;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *v16;
  _BOOL4 v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  id v25;
  double v26;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  id v30;
  void *v31;
  id v32;
  NSMutableArray *v33;
  NSMutableArray *v34;
  id v35;
  void *v36;
  id v37;
  NFExpressConfig *v38;
  NSMutableArray *v39;
  id v40;
  uint64_t v41;
  void *i;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  BOOL v48;
  void *v49;
  _BOOL4 v50;
  NSMutableArray *v51;
  void *v52;
  NFExpressConfig *v53;
  uint64_t v54;
  void *v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  objc_class *v64;
  int v65;
  const char *v66;
  const char *v67;
  id v68;
  void *v69;
  int v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  void *j;
  uint64_t v83;
  void *v84;
  void (*v85)(uint64_t, const char *, ...);
  objc_class *v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  void *v90;
  uint64_t v91;
  NSObject *v92;
  objc_class *v93;
  int v94;
  const char *v95;
  const char *v96;
  void *v97;
  void *v98;
  id v99;
  void *specific;
  uint64_t Logger;
  void (*v102)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  objc_class *v110;
  int v111;
  id v112;
  id v113;
  void *v114;
  uint64_t v115;
  void (*v116)(uint64_t, const char *, ...);
  objc_class *v117;
  _BOOL4 v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  NSObject *v123;
  objc_class *v124;
  int v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  void (*v130)(uint64_t, const char *, ...);
  objc_class *v131;
  uint64_t v132;
  const char *v133;
  const char *v134;
  void *v135;
  uint64_t v136;
  NSObject *v137;
  objc_class *v138;
  int v139;
  const char *v140;
  const char *v141;
  id v142;
  void *v143;
  const char *v145;
  const char *Name;
  const char *v147;
  NSMutableArray *v148;
  id v149;
  id v150;
  NSMutableArray *v151;
  void *v152;
  NSMutableArray *v153;
  NSMutableDictionary *v154;
  id obj;
  id obja;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t (*v170)(uint64_t, uint64_t);
  void (*v171)(uint64_t);
  id v172;
  _BYTE v173[128];
  _QWORD v174[5];
  _QWORD v175[5];
  _QWORD v176[4];
  _QWORD v177[4];
  _QWORD v178[4];
  _QWORD v179[4];
  uint8_t v180[8];
  _BYTE v181[32];
  NFExpressConfig *v182;
  uint64_t *v183;
  _QWORD v184[5];
  _QWORD v185[5];
  uint8_t buf[4];
  int v187;
  __int16 v188;
  const char *v189;
  __int16 v190;
  const char *v191;
  __int16 v192;
  int v193;
  __int16 v194;
  uint64_t v195;

  if (!a3)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v102 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v106 = 45;
      if (isMetaClass)
        v106 = 43;
      v102(3, "%c[%{public}s %{public}s]:%i no array supplied", v106, ClassName, Name, 520);
    }
    v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v108 = NFSharedLogGetLogger(v107);
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      v110 = object_getClass(self);
      if (class_isMetaClass(v110))
        v111 = 43;
      else
        v111 = 45;
      *(_DWORD *)buf = 67109890;
      v187 = v111;
      v188 = 2082;
      v189 = object_getClassName(self);
      v190 = 2082;
      v191 = sel_getName(a2);
      v192 = 1024;
      v193 = 520;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i no array supplied", buf, 0x22u);
    }

    v112 = objc_alloc((Class)NSError);
    v151 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v178[0] = NSLocalizedDescriptionKey;
    v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v179[0] = v152;
    v179[1] = &off_1002FFA68;
    v178[1] = CFSTR("Line");
    v178[2] = CFSTR("Method");
    v99 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v179[2] = v99;
    v178[3] = NSDebugDescriptionErrorKey;
    obja = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 521);
    v179[3] = obja;
    v113 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v179, v178, 4));
    v150 = objc_msgSend(v112, "initWithDomain:code:userInfo:", v151, 10, v113);
    goto LABEL_113;
  }
  v7 = a6;
  v8 = a5;
  v9 = a4;
  if (self)
    passes = self->_passes;
  else
    passes = 0;
  v151 = passes;
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig extractConfigFrom:](self, "extractConfigFrom:", a3));
  if (!v152)
  {
    v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v115 = NFLogGetLogger(v114);
    if (v115)
    {
      v116 = (void (*)(uint64_t, const char *, ...))v115;
      v117 = object_getClass(self);
      v118 = class_isMetaClass(v117);
      v119 = object_getClassName(self);
      v147 = sel_getName(a2);
      v120 = 45;
      if (v118)
        v120 = 43;
      v116(3, "%c[%{public}s %{public}s]:%i Failed to create expressConfig", v120, v119, v147, 529);
    }
    v121 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v122 = NFSharedLogGetLogger(v121);
    v123 = objc_claimAutoreleasedReturnValue(v122);
    if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
    {
      v124 = object_getClass(self);
      if (class_isMetaClass(v124))
        v125 = 43;
      else
        v125 = 45;
      *(_DWORD *)buf = 67109890;
      v187 = v125;
      v188 = 2082;
      v189 = object_getClassName(self);
      v190 = 2082;
      v191 = sel_getName(a2);
      v192 = 1024;
      v193 = 529;
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create expressConfig", buf, 0x22u);
    }

    v126 = objc_alloc((Class)NSError);
    v99 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v176[0] = NSLocalizedDescriptionKey;
    obja = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v177[0] = obja;
    v177[1] = &off_1002FFA80;
    v176[1] = CFSTR("Line");
    v176[2] = CFSTR("Method");
    v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v177[2] = v113;
    v176[3] = NSDebugDescriptionErrorKey;
    v127 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 530);
    v177[3] = v127;
    v128 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v177, v176, 4));
    v150 = objc_msgSend(v126, "initWithDomain:code:userInfo:", v99, 6, v128);
    goto LABEL_112;
  }
  v12 = self;
  if (-[NSMutableArray count](v151, "count") && !objc_msgSend(v152, "count"))
  {
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFLogGetLogger(v13);
    if (v14)
    {
      v15 = (void (*)(uint64_t, const char *, ...))v14;
      v16 = object_getClass(self);
      v17 = class_isMetaClass(v16);
      v18 = object_getClassName(self);
      v145 = sel_getName(a2);
      v19 = 45;
      if (v17)
        v19 = 43;
      v15(6, "%c[%{public}s %{public}s]:%i Config is now empty! Need to deselect all", v19, v18, v145, 534);
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
      *(_DWORD *)buf = 67109890;
      v187 = v24;
      v188 = 2082;
      v189 = object_getClassName(self);
      v190 = 2082;
      v191 = sel_getName(a2);
      v192 = 1024;
      v193 = 534;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Config is now empty! Need to deselect all", buf, 0x22u);
    }

    v25 = -[NFExpressConfig deactivateExpressConfig](self, "deactivateExpressConfig");
    v12 = self;
  }
  if ((-[NFExpressConfig validateAndUpdateExpressConfig:avoidChangingRouting:](v12, "validateAndUpdateExpressConfig:avoidChangingRouting:", v152, v8) & 1) == 0)
  {
    v129 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v130 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v129);
    if (v130)
    {
      v131 = object_getClass(self);
      if (class_isMetaClass(v131))
        v132 = 43;
      else
        v132 = 45;
      v133 = object_getClassName(self);
      v134 = sel_getName(a2);
      v130(3, "%c[%{public}s %{public}s]:%i Validation of express config failed", v132, v133, v134, 539);
    }
    v135 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v136 = NFSharedLogGetLogger(v135);
    v137 = objc_claimAutoreleasedReturnValue(v136);
    if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
    {
      v138 = object_getClass(self);
      if (class_isMetaClass(v138))
        v139 = 43;
      else
        v139 = 45;
      v140 = object_getClassName(self);
      v141 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v187 = v139;
      v188 = 2082;
      v189 = v140;
      v190 = 2082;
      v191 = v141;
      v192 = 1024;
      v193 = 539;
      _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation of express config failed", buf, 0x22u);
    }

    v142 = objc_alloc((Class)NSError);
    v99 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v174[0] = NSLocalizedDescriptionKey;
    obja = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v175[0] = obja;
    v175[1] = &off_1002FFA98;
    v174[1] = CFSTR("Line");
    v174[2] = CFSTR("Method");
    v113 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v175[2] = v113;
    v174[3] = NSDebugDescriptionErrorKey;
    v127 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 540);
    v175[3] = v127;
    v174[4] = NSLocalizedFailureReasonErrorKey;
    v128 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Validation failed for express config"));
    v175[4] = v128;
    v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v175, v174, 5));
    v150 = objc_msgSend(v142, "initWithDomain:code:userInfo:", v99, 10, v143);

LABEL_112:
LABEL_113:

    goto LABEL_114;
  }
  if (self)
  {
    sub_100254C38(v26);
    v28 = *(void **)(v27 + 2232);
    v29 = self->_passes;
    v30 = v152;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "processConfigurationChange:newConfiguration:", v29, v30));

    v32 = objc_retainAutorelease(v31);
    v33 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v30);
    v34 = self->_passes;
    self->_passes = v33;

    -[NFExpressConfig updateExpressAppletNumbers](self, "updateExpressAppletNumbers");
    v35 = objc_alloc((Class)NSString);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig seName](self, "seName"));
    v37 = objc_msgSend(v35, "initWithFormat:", CFSTR("%@: new config"), v36);
    -[NFExpressConfig dumpConfig:logLevel:prefix:](self, "dumpConfig:logLevel:prefix:", v30, 7, v37);

    self->_expressConfigUpdateRequired = 1;
  }
  else
  {
    v32 = 0;
  }
  v149 = v32;
  v38 = self;
  if (v9)
  {
    -[NFExpressConfig updateStorage](self, "updateStorage");
    v38 = self;
  }
  v150 = 0;
  if (v7 && !v8)
  {
    v148 = v151;
    if (v38)
    {
      obj = (id)objc_claimAutoreleasedReturnValue(-[NFExpressConfig getSecureElementWrapperAndSetRouting](v38, "getSecureElementWrapperAndSetRouting"));
      v153 = objc_opt_new(NSMutableArray);
      v154 = objc_opt_new(NSMutableDictionary);
      v167 = 0;
      v168 = &v167;
      v169 = 0x3032000000;
      v170 = sub_10013DF30;
      v171 = sub_10013DF40;
      v172 = 0;
      v163 = 0u;
      v164 = 0u;
      v165 = 0u;
      v166 = 0u;
      v39 = v148;
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v163, buf, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v164;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(_QWORD *)v164 != v41)
              objc_enumerationMutation(v39);
            v43 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)i);
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("keyIdentifier")));
            v46 = sub_10022F2F0(obj, v44);
            v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
            if ((-[NSMutableArray containsObject:](self->_passes, "containsObject:", v43) & 1) == 0)
            {
              if (v45)
                v48 = v47 == 0;
              else
                v48 = 1;
              if (v48)
              {
                if (v47 && (objc_msgSend(v47, "authTransientSupport") & 1) == 0)
                  -[NSMutableArray addObject:](v153, "addObject:", v47);
              }
              else
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v154, "objectForKeyedSubscript:", v44));
                v50 = v49 == 0;

                if (v50)
                {
                  v51 = objc_opt_new(NSMutableArray);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v154, "setObject:forKeyedSubscript:", v51, v44);

                }
                v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v154, "objectForKeyedSubscript:", v44));
                objc_msgSend(v52, "addObject:", v45);

              }
            }

          }
          v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v163, buf, 16);
        }
        while (v40);
      }

      v53 = self;
      if (-[NSMutableArray count](v153, "count"))
      {
        v54 = sub_1001E8534(obj, 1, 0xFFFFFFFF, v153, 0);
        if ((_DWORD)v54)
        {
          v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v56 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v55);
          if (v56)
          {
            v57 = object_getClass(self);
            if (class_isMetaClass(v57))
              v58 = 43;
            else
              v58 = 45;
            v59 = object_getClassName(self);
            v60 = sel_getName("_restoreAuthorizationOnRemovedAppletsAndKeysWithOldConfig:");
            v56(3, "%c[%{public}s %{public}s]:%i Failed to restore authorization on applet (%d)", v58, v59, v60, 495, v54);
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
            v67 = sel_getName("_restoreAuthorizationOnRemovedAppletsAndKeysWithOldConfig:");
            *(_DWORD *)v180 = 67110146;
            *(_DWORD *)&v180[4] = v65;
            *(_WORD *)v181 = 2082;
            *(_QWORD *)&v181[2] = v66;
            *(_WORD *)&v181[10] = 2082;
            *(_QWORD *)&v181[12] = v67;
            *(_WORD *)&v181[20] = 1024;
            *(_DWORD *)&v181[22] = 495;
            *(_WORD *)&v181[26] = 1024;
            *(_DWORD *)&v181[28] = v54;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore authorization on applet (%d)", v180, 0x28u);
          }

          v68 = objc_alloc((Class)NSError);
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v184[0] = NSLocalizedDescriptionKey;
          if (v54 >= 0x47)
            v70 = 71;
          else
            v70 = v54;
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E8B40[v70]));
          v185[0] = v71;
          v185[1] = &off_1002FFA50;
          v184[1] = CFSTR("Line");
          v184[2] = CFSTR("Method");
          v72 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName("_restoreAuthorizationOnRemovedAppletsAndKeysWithOldConfig:"));
          v185[2] = v72;
          v184[3] = NSDebugDescriptionErrorKey;
          v73 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName("_restoreAuthorizationOnRemovedAppletsAndKeysWithOldConfig:"), 496);
          v185[3] = v73;
          v184[4] = NSLocalizedFailureReasonErrorKey;
          v74 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Restoring authorization failed"));
          v185[4] = v74;
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v185, v184, 5));
          v76 = objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, v54, v75);
          v77 = (void *)v168[5];
          v168[5] = (uint64_t)v76;

          v53 = self;
        }
        v78 = sub_10022BED0(obj);
      }
      *(_QWORD *)v180 = _NSConcreteStackBlock;
      *(_QWORD *)v181 = 3221225472;
      *(_QWORD *)&v181[8] = sub_10013DF48;
      *(_QWORD *)&v181[16] = &unk_1002E8D88;
      v79 = obj;
      *(_QWORD *)&v181[24] = v79;
      v182 = v53;
      v183 = &v167;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v154, "enumerateKeysAndObjectsUsingBlock:", v180);
      v150 = (id)v168[5];

      _Block_object_dispose(&v167, 8);
    }
    else
    {
      v150 = 0;
    }

  }
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  obja = v149;
  v80 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v159, v173, 16);
  if (v80)
  {
    v81 = *(_QWORD *)v160;
    do
    {
      for (j = 0; j != v80; j = (char *)j + 1)
      {
        if (*(_QWORD *)v160 != v81)
          objc_enumerationMutation(obja);
        v83 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)j);
        v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v85 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v84);
        if (v85)
        {
          v86 = object_getClass(self);
          if (class_isMetaClass(v86))
            v87 = 43;
          else
            v87 = 45;
          v88 = object_getClassName(self);
          v89 = sel_getName(a2);
          v85(6, "%c[%{public}s %{public}s]:%i posting %{public}@ to SESD", v87, v88, v89, 559, v83);
        }
        v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v91 = NFSharedLogGetLogger(v90);
        v92 = objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          v93 = object_getClass(self);
          if (class_isMetaClass(v93))
            v94 = 43;
          else
            v94 = 45;
          v95 = object_getClassName(self);
          v96 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v187 = v94;
          v188 = 2082;
          v189 = v95;
          v190 = 2082;
          v191 = v96;
          v192 = 1024;
          v193 = 559;
          v194 = 2114;
          v195 = v83;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i posting %{public}@ to SESD", buf, 0x2Cu);
        }

        v97 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "sesdEventPublisher"));
        objc_msgSend(v98, "sendXpcNotificationEventWithDictionary:", v83);

      }
      v80 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v159, v173, 16);
    }
    while (v80);
  }
  v99 = obja;
LABEL_114:

  return v150;
}

- (id)reconfigureWithArray:(id)a3 restoreAuthorization:(BOOL)a4 updateStorage:(BOOL)a5
{
  return -[NFExpressConfig reconfigureWithArray:updateStorage:avoidChangingRouting:restoreAuthorization:](self, "reconfigureWithArray:updateStorage:avoidChangingRouting:restoreAuthorization:", a3, a5, 0, a4);
}

- (id)getExpressAidsForType:(unsigned __int8)a3 onlyInExpress:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSMutableArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a4;
  v5 = a3;
  v19 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_passes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
        if (!v4
          || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11), "objectForKeyedSubscript:", CFSTR("expressEnabled"))), v14 = objc_msgSend(v13, "BOOLValue"), v13, v14))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ExpressType")));
          v17 = +[NFExpressConfig expressTypeForATLConfigKey:](NFExpressConfig, "expressTypeForATLConfigKey:", v16);

          if (v17 == v5)
            -[NSMutableArray addObject:](v19, "addObject:", v15);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v19;
}

- (id)getExpressAidsForType:(unsigned __int8)a3
{
  return -[NFExpressConfig getExpressAidsForType:onlyInExpress:](self, "getExpressAidsForType:onlyInExpress:", a3, 1);
}

- (unint64_t)getNumberOfExpressAidsForType:(unsigned __int8)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig getExpressAidsForType:](self, "getExpressAidsForType:", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)deactivateExpressConfig
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
  void *v16;
  id v17;
  void *v18;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 626);
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
    v22 = v15;
    v23 = 2082;
    v24 = object_getClassName(self);
    v25 = 2082;
    v26 = sel_getName(a2);
    v27 = 1024;
    v28 = 626;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig getSecureElementWrapperAndSetRouting](self, "getSecureElementWrapperAndSetRouting"));
  v17 = sub_10022DE7C(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  return v18;
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_passes, "count") == 0;
}

- (BOOL)isSEOperational
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFExpressConfig getSecureElementWrapper](self, "getSecureElementWrapper"));
  v3 = objc_msgSend(v2, "isOperational");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_allAids, 0);
  objc_storeStrong((id *)&self->_passes, 0);
}

@end
