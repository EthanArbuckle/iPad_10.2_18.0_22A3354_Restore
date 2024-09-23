@implementation ChromeDelegateProxy

+ (id)protocols
{
  return 0;
}

+ (BOOL)selectorIsProxiedDelegateMethod:(SEL)a3
{
  return objc_msgSend(a1, "_selectorIsProxiedDelegateMethod:protocol:isRequiredMethod:", a3, 0, 0);
}

+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 isRequiredMethod:(BOOL *)a4
{
  return objc_msgSend(a1, "_selectorIsProxiedDelegateMethod:protocol:isRequiredMethod:", a3, 0, a4);
}

+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 protocol:(id *)a4 isRequiredMethod:(BOOL *)a5
{
  return objc_msgSend(a1, "_selectorIsProxiedDelegateMethod:protocol:isRequiredMethod:methodDescription:", a3, a4, a5, 0);
}

+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 protocol:(id *)a4 isRequiredMethod:(BOOL *)a5 methodDescription:(objc_method_description *)a6
{
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  Protocol *v15;
  objc_method_description MethodDescription;
  objc_method_description v17;
  BOOL v18;
  char *types;
  const char *name;
  id *v22;
  BOOL *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "protocols"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v11)
  {
    v18 = 0;
    goto LABEL_21;
  }
  v12 = v11;
  v22 = a4;
  v23 = a5;
  v13 = *(_QWORD *)v25;
  while (2)
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v25 != v13)
        objc_enumerationMutation(v10);
      v15 = *(Protocol **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
      MethodDescription = protocol_getMethodDescription(v15, a3, 0, 1);
      if (MethodDescription.name)
      {
        types = MethodDescription.types;
        name = MethodDescription.name;
LABEL_14:
        if (v22)
          *v22 = objc_retainAutorelease(v15);
        if (v23)
          *v23 = MethodDescription.name == 0;
        if (a6)
        {
          a6->name = name;
          a6->types = types;
        }
        v18 = 1;
        goto LABEL_21;
      }
      v17 = protocol_getMethodDescription(v15, a3, 1, 1);
      if (v17.name)
      {
        name = v17.name;
        types = v17.types;
        goto LABEL_14;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v18 = 0;
    if (v12)
      continue;
    break;
  }
LABEL_21:

  return v18;
}

- (ChromeDelegateProxy)initWithChromeViewController:(id)a3
{
  NSMapTable *v4;
  NSMapTable *additionalDelegatesByProtocol;

  if (self)
  {
    objc_storeWeak((id *)&self->_chromeViewController, a3);
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    additionalDelegatesByProtocol = self->_additionalDelegatesByProtocol;
    self->_additionalDelegatesByProtocol = v4;

  }
  return self;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  unsigned int v5;
  Protocol *v6;
  NSOrderedSet *lastProxiedTargets;
  void *v8;
  id v9;
  void *v10;
  NSOrderedSet *v11;
  NSOrderedSet *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  const char *v18;
  char **v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  ChromeDelegateProxy *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSString *v32;
  void *v33;
  NSString *v34;
  void *v35;
  id v36;
  void *v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  id v44;
  id v45;
  int v46;
  id v47;
  NSObject *v48;
  void *v49;
  ChromeDelegateProxy *v50;
  objc_class *v51;
  NSString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSString *v57;
  void *v58;
  NSString *v59;
  void *v60;
  _BOOL4 v61;
  NSObject *v62;
  void *v63;
  void *v64;
  ChromeDelegateProxy *v65;
  objc_class *v66;
  NSString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSString *v72;
  void *v73;
  NSString *v74;
  void *v75;
  ChromeDelegateProxy *v76;
  objc_class *v77;
  NSString *v78;
  void *v79;
  Protocol *v80;
  void *v81;
  void *v82;
  void *v83;
  NSString *v84;
  void *v85;
  NSString *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  ChromeDelegateProxy *v91;
  objc_class *v92;
  NSString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSString *v98;
  void *v99;
  NSString *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  Protocol *v108;
  const char *v109;
  uint64_t v110;
  NSObject *v111;
  id v112;
  id v113;
  ChromeDelegateProxy *v114;
  char *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  id v121;
  unsigned __int8 v122;
  uint8_t buf[4];
  id v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  const char *v132;
  _BYTE v133[128];

  v4 = a3;
  v122 = 0;
  v121 = 0;
  v5 = objc_msgSend((id)objc_opt_class(self), "_selectorIsProxiedDelegateMethod:protocol:isRequiredMethod:", objc_msgSend(v4, "selector"), &v121, &v122);
  v6 = (Protocol *)v121;
  if (v5)
  {
    lastProxiedTargets = self->_lastProxiedTargets;
    self->_lastProxiedTargets = 0;

    v120 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy methodSignatureForSelector:targets:](self, "methodSignatureForSelector:targets:", objc_msgSend(v4, "selector"), &v120));
    v9 = v120;
    v10 = v9;
    if (!v8)
    {
LABEL_60:

      goto LABEL_61;
    }
    if (self->_forTesting)
    {
      v11 = (NSOrderedSet *)objc_msgSend(v9, "copy");
      v12 = self->_lastProxiedTargets;
      self->_lastProxiedTargets = v11;

    }
    v13 = objc_msgSend(v8, "methodReturnLength");
    v107 = v4;
    v113 = v13;
    v114 = self;
    if (objc_msgSend(v10, "count"))
    {
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v14 = v10;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v116, v133, 16);
      if (v15)
      {
        v16 = v15;
        v104 = v8;
        v105 = v10;
        v17 = *(_QWORD *)v117;
        v18 = "return";
        if (!v13)
          v18 = "no return";
        v109 = v18;
        v19 = &selRef__updateNavigationDisplayConfigurationForDisplayedStep_;
        v110 = *(_QWORD *)v117;
        v111 = v14;
        v108 = v6;
        while (1)
        {
          v20 = 0;
          v115 = v19[486];
          v112 = v16;
          do
          {
            if (*(_QWORD *)v117 != v17)
              objc_enumerationMutation(v14);
            v21 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)v20);
            v22 = sub_100AFA368();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v24 = self;
              v25 = (objc_class *)objc_opt_class(v24);
              v26 = NSStringFromClass(v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
              if ((objc_opt_respondsToSelector(v24, v115) & 1) == 0)
                goto LABEL_18;
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy performSelector:](v24, "performSelector:", v115));
              v29 = v28;
              if (v28 && !objc_msgSend(v28, "isEqualToString:", v27))
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v27, v24, v29));

              }
              else
              {

LABEL_18:
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v27, v24));
              }

              v31 = v30;
              v32 = NSStringFromProtocol(v6);
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              v34 = NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
              v36 = v21;
              v37 = v36;
              if (v36)
              {
                v38 = (objc_class *)objc_opt_class(v36);
                v39 = NSStringFromClass(v38);
                v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
                if ((objc_opt_respondsToSelector(v37, v115) & 1) == 0)
                  goto LABEL_24;
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "performSelector:", v115));
                v42 = v41;
                if (v41 && !objc_msgSend(v41, "isEqualToString:", v40))
                {
                  v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v40, v37, v42));

                  v4 = v107;
                }
                else
                {

                  v4 = v107;
LABEL_24:
                  v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v40, v37));
                }

                v6 = v108;
              }
              else
              {
                v43 = CFSTR("<nil>");
              }

              *(_DWORD *)buf = 138413314;
              v124 = v31;
              v125 = 2112;
              v126 = v33;
              v127 = 2112;
              v128 = (uint64_t)v35;
              v129 = 2112;
              v130 = v43;
              v131 = 2080;
              v132 = v109;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%@ %@ | %@ on %@ (%s)", buf, 0x34u);

              v17 = v110;
              v14 = v111;
              v13 = v113;
              self = v114;
              v16 = v112;
            }

            objc_msgSend(v4, "invokeWithTarget:", v21);
            if (v13)
              goto LABEL_34;
            v20 = (char *)v20 + 1;
          }
          while (v16 != v20);
          v44 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v116, v133, 16);
          v16 = v44;
          v19 = &selRef__updateNavigationDisplayConfigurationForDisplayedStep_;
          if (!v44)
          {
LABEL_34:
            v8 = v104;
            goto LABEL_58;
          }
        }
      }
      goto LABEL_59;
    }
    v45 = v13;
    v46 = v122;
    v47 = sub_100AFA368();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    v14 = v48;
    if (v45 && v46)
    {
      v105 = v10;
      v49 = v8;
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
        goto LABEL_52;
      v50 = v114;
      v51 = (objc_class *)objc_opt_class(v50);
      v52 = NSStringFromClass(v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      if ((objc_opt_respondsToSelector(v50, "accessibilityIdentifier") & 1) != 0)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy performSelector:](v50, "performSelector:", "accessibilityIdentifier"));
        v55 = v54;
        if (v54 && !objc_msgSend(v54, "isEqualToString:", v53))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v53, v50, v55));

          goto LABEL_43;
        }

      }
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v53, v50));
LABEL_43:

      v57 = NSStringFromProtocol(v6);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
      v59 = NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      *(_DWORD *)buf = 138412802;
      v124 = v56;
      v125 = 2112;
      v126 = v58;
      v127 = 2112;
      v128 = (uint64_t)v60;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%@ %@ | %@ (required, with return) - no targets", buf, 0x20u);

LABEL_52:
      v76 = v114;
      v77 = (objc_class *)objc_opt_class(v76);
      v78 = NSStringFromClass(v77);
      v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
      if ((objc_opt_respondsToSelector(v76, "accessibilityIdentifier") & 1) != 0)
      {
        v80 = v6;
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy performSelector:](v76, "performSelector:", "accessibilityIdentifier"));
        v82 = v81;
        if (v81 && !objc_msgSend(v81, "isEqualToString:", v79))
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v79, v76, v82));

          v6 = v80;
LABEL_57:

          v84 = NSStringFromProtocol(v6);
          v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
          v86 = NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
          v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ | %@ (required, with return) - no targets"), v83, v85, v87));
          v89 = objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v88, 0));

          v14 = v89;
          -[NSObject raise](v89, "raise");
          v8 = v49;
LABEL_58:
          v10 = v105;
          goto LABEL_59;
        }

        v6 = v80;
      }
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v79, v76));
      goto LABEL_57;
    }
    v61 = os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG);
    if (v46)
    {
      if (v61)
      {
        v62 = v14;
        v63 = v10;
        v64 = v8;
        v65 = self;
        v66 = (objc_class *)objc_opt_class(v65);
        v67 = NSStringFromClass(v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        if ((objc_opt_respondsToSelector(v65, "accessibilityIdentifier") & 1) != 0)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy performSelector:](v65, "performSelector:", "accessibilityIdentifier"));
          v70 = v69;
          if (v69 && !objc_msgSend(v69, "isEqualToString:", v68))
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v68, v65, v70));

            goto LABEL_51;
          }

        }
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v68, v65));
LABEL_51:

        v72 = NSStringFromProtocol(v6);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v74 = NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
        *(_DWORD *)buf = 138412802;
        v124 = v71;
        v125 = 2112;
        v126 = v73;
        v127 = 2112;
        v128 = (uint64_t)v75;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%@ %@ | %@ (required, no return) - no targets", buf, 0x20u);

        v8 = v64;
        v10 = v63;
LABEL_71:
        v14 = v62;
      }
LABEL_59:

      goto LABEL_60;
    }
    if (!v61)
      goto LABEL_59;
    v62 = v14;
    v106 = v10;
    v90 = v8;
    v91 = self;
    v92 = (objc_class *)objc_opt_class(v91);
    v93 = NSStringFromClass(v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
    if ((objc_opt_respondsToSelector(v91, "accessibilityIdentifier") & 1) != 0)
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy performSelector:](v91, "performSelector:", "accessibilityIdentifier"));
      v96 = v95;
      if (v95 && !objc_msgSend(v95, "isEqualToString:", v94))
      {
        v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v94, v91, v96));

        goto LABEL_68;
      }

    }
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v94, v91));
LABEL_68:

    v98 = NSStringFromProtocol(v6);
    v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
    v100 = NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
    v101 = objc_claimAutoreleasedReturnValue(v100);
    v102 = (void *)v101;
    v103 = "with return";
    *(_DWORD *)buf = 138413058;
    v124 = v97;
    v125 = 2112;
    if (!v113)
      v103 = "no return";
    v126 = v99;
    v127 = 2112;
    v128 = v101;
    v129 = 2080;
    v130 = (void *)v103;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%@ %@ | %@ (optional, %s) - no targets", buf, 0x2Au);

    v8 = v90;
    v10 = v106;
    goto LABEL_71;
  }
LABEL_61:

}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5;
  void *v6;
  id v7;
  id v9;
  char v10;

  v10 = 0;
  v5 = 0;
  if (objc_msgSend((id)objc_opt_class(self), "_selectorIsProxiedDelegateMethod:isRequiredMethod:", a3, &v10))
  {
    if (v10)
    {
      return 1;
    }
    else
    {
      v9 = 0;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy methodSignatureForSelector:targets:](self, "methodSignatureForSelector:targets:", a3, &v9));
      v7 = v9;
      v5 = v6 && !objc_msgSend(v6, "methodReturnLength") || objc_msgSend(v7, "count") != 0;

    }
  }
  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return -[ChromeDelegateProxy methodSignatureForSelector:targets:](self, "methodSignatureForSelector:targets:", a3, 0);
}

- (id)methodSignatureForSelector:(SEL)a3 targets:(id *)a4
{
  id v8;
  _QWORD *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id WeakRetained;
  uint64_t v20;
  id v21;
  char v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  SEL v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v51 = 0;
  v49 = 0;
  v50 = 0;
  if (!objc_msgSend((id)objc_opt_class(self), "_selectorIsProxiedDelegateMethod:protocol:isRequiredMethod:methodDescription:", a3, 0, &v51, &v49))return 0;
  if (!a4 && v51)
    return (id)objc_claimAutoreleasedReturnValue(+[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", v50));
  if (a4)
    v8 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", 2);
  else
    v8 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_100AFA8A4;
  v47 = sub_100AFA8B4;
  v48 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100AFA8BC;
  v39[3] = &unk_1011E27E0;
  v41 = &v43;
  v42 = a3;
  v29 = v8;
  v40 = v29;
  v9 = objc_retainBlock(v39);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy _protocolForSelector:](self, "_protocolForSelector:", a3));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[ChromeDelegateProxy delegatesForSelector:protocol:](self, "delegatesForSelector:protocol:", a3));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v10);
        ((void (*)(_QWORD *, _QWORD))v9[2])(v9, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i));
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_additionalDelegatesByProtocol, "objectForKey:", v30));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v52, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v15);
        ((void (*)(_QWORD *, _QWORD))v9[2])(v9, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j));
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v52, 16);
    }
    while (v16);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "methodSignatureForSelector:", a3));

  if (v20)
  {
    v21 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v22 = objc_opt_respondsToSelector(v21, a3);

    if ((v22 & 1) != 0)
    {
      v23 = -[ChromeDelegateProxy preferChromeForSelector:protocol:](self, "preferChromeForSelector:protocol:", a3, v30);
      v24 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      if (v23)
        objc_msgSend(v29, "insertObject:atIndex:", v24, 0);
      else
        objc_msgSend(v29, "addObject:", v24);

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v29);
  v25 = v44[5];
  if (v25)
    v26 = (void *)v44[5];
  else
    v26 = (void *)v20;
  if (!(v20 | v25))
  {
    if (v51 && !objc_msgSend(v29, "count"))
    {
      v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", v50));
      goto LABEL_39;
    }
    v26 = 0;
  }
  v27 = v26;
LABEL_39:
  v28 = v27;

  _Block_object_dispose(&v43, 8);
  return v28;
}

- (id)_protocolForSelector:(SEL)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend((id)objc_opt_class(self), "protocols", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)protocol_getMethodDescription((Protocol *)v10, a3, 0, 1).name
          || (unint64_t)protocol_getMethodDescription((Protocol *)v10, a3, 1, 1).name)
        {
          v11 = v10;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (BOOL)preferChromeForSelector:(SEL)a3 protocol:(id)a4
{
  return 0;
}

- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4
{
  return 0;
}

- (void)addAdditionalDelegate:(id)a3 forProtocol:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "protocols");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_additionalDelegatesByProtocol, "objectForKey:", v6));
  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    -[NSMapTable setObject:forKey:](self->_additionalDelegatesByProtocol, "setObject:forKey:", v9, v6);
  }
  if ((objc_msgSend(v9, "containsObject:", v10) & 1) == 0)
    objc_msgSend(v9, "addObject:", v10);

}

- (void)removeAdditionalDelegate:(id)a3 forProtocol:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "protocols");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_additionalDelegatesByProtocol, "objectForKey:", v6));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "removeObject:", v11);
    if (!objc_msgSend(v10, "count"))
      -[NSMapTable removeObjectForKey:](self->_additionalDelegatesByProtocol, "removeObjectForKey:", v6);
  }

}

- (id)initForTesting
{
  ChromeViewController *v3;
  ChromeDelegateProxy *v4;

  v3 = objc_opt_new(ChromeViewController);
  v4 = -[ChromeDelegateProxy initWithChromeViewController:](self, "initWithChromeViewController:", v3);

  if (v4)
    v4->_forTesting = 1;
  return v4;
}

- (id)lastProxiedTargets
{
  return self->_lastProxiedTargets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProxiedTargets, 0);
  objc_storeStrong((id *)&self->_additionalDelegatesByProtocol, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
