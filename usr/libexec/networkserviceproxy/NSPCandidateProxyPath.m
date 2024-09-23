@implementation NSPCandidateProxyPath

- (NSPCandidateProxyPath)initWithIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5 preferredPathConfigURI:(id)a6 preferredPathPatterns:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSPCandidateProxyPath *v21;
  NSPCandidateProxyPath *v22;
  NSData *domainFilter;
  NSPCandidateProxyPath *v24;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20 = v16;
  if (!v13)
  {
    v26 = nplog_obj(v16, v17, v18, v19);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v24 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v32 = "-[NSPCandidateProxyPath initWithIngressProxy:egressProxy:proxyPathWeight:preferredPathConfigURI:preferredPathPatterns:]";
    v28 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v14)
  {
    v29 = nplog_obj(v16, v17, v18, v19);
    v27 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    v32 = "-[NSPCandidateProxyPath initWithIngressProxy:egressProxy:proxyPathWeight:preferredPathConfigURI:preferredPathPatterns:]";
    v28 = "%s called with null egressProxy";
    goto LABEL_12;
  }
  v30.receiver = self;
  v30.super_class = (Class)NSPCandidateProxyPath;
  v21 = -[NSPCandidateProxyPath init](&v30, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_ingressProxy, a3);
    objc_storeStrong((id *)&v22->_egressProxy, a4);
    v22->_proxyPathWeight = a5;
    objc_storeStrong((id *)&v22->_preferredPathConfigURI, a6);
    objc_storeStrong((id *)&v22->_preferredPathPatterns, a7);
    domainFilter = v22->_domainFilter;
    v22->_domainFilter = 0;

  }
  self = v22;
  v24 = self;
LABEL_6:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPCandidateProxyPath)initWithCoder:(id)a3
{
  id v4;
  NSPCandidateProxyPath *v5;
  id v6;
  uint64_t v7;
  NSPProxyTokenInfo *ingressProxy;
  id v9;
  uint64_t v10;
  NSPProxyTokenInfo *egressProxy;
  id v12;
  uint64_t v13;
  NSString *preferredPathConfigURI;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  NSArray *preferredPathPatterns;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NSPCandidateProxyPath;
  v5 = -[NSPCandidateProxyPath init](&v21, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProxyTokenInfo), CFSTR("candidateProxyPathIngressProxy"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    ingressProxy = v5->_ingressProxy;
    v5->_ingressProxy = (NSPProxyTokenInfo *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProxyTokenInfo), CFSTR("candidateProxyPathEgressProxy"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    egressProxy = v5->_egressProxy;
    v5->_egressProxy = (NSPProxyTokenInfo *)v10;

    v5->_proxyPathWeight = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("candidateProxyPathWeight"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("candidateProxyPreferredPathConfigURI"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    preferredPathConfigURI = v5->_preferredPathConfigURI;
    v5->_preferredPathConfigURI = (NSString *)v13;

    v15 = objc_opt_class(NSArray);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(NSString), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("candidateProxyPreferredPathPatterns")));
    preferredPathPatterns = v5->_preferredPathPatterns;
    v5->_preferredPathPatterns = (NSArray *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("candidateProxyPathIngressProxy"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("candidateProxyPathEgressProxy"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NSPCandidateProxyPath proxyPathWeight](self, "proxyPathWeight"), CFSTR("candidateProxyPathWeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("candidateProxyPreferredPathConfigURI"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathPatterns](self, "preferredPathPatterns"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("candidateProxyPreferredPathPatterns"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPCandidateProxyPath *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[NSPCandidateProxyPath init](+[NSPCandidateProxyPath allocWithZone:](NSPCandidateProxyPath, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  -[NSPCandidateProxyPath setIngressProxy:](v4, "setIngressProxy:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  -[NSPCandidateProxyPath setEgressProxy:](v4, "setEgressProxy:", v6);

  -[NSPCandidateProxyPath setProxyPathWeight:](v4, "setProxyPathWeight:", -[NSPCandidateProxyPath proxyPathWeight](self, "proxyPathWeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
  -[NSPCandidateProxyPath setPreferredPathConfigURI:](v4, "setPreferredPathConfigURI:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathPatterns](self, "preferredPathPatterns"));
  -[NSPCandidateProxyPath setPreferredPathPatterns:](v4, "setPreferredPathPatterns:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath domainFilter](self, "domainFilter"));
  -[NSPCandidateProxyPath setDomainFilter:](v4, "setDomainFilter:", v9);

  return v4;
}

- (BOOL)proxyPathReady
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  int v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;

  v3 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath domainFilter](self, "domainFilter"));

    if (!v5)
    {
      v52 = nplog_obj(v6, v7, v8);
      v18 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v54) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "proxy path is not ready due to absent domain filter", (uint8_t *)&v54, 2u);
      }
      goto LABEL_26;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  if (sub_10000B9B4((uint64_t)v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
    v11 = sub_10000D9B0((uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
    v13 = sub_10000E610((uint64_t)v12);

    if (v11 <= v13)
    {
      v17 = nplog_obj(v14, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
        v20 = sub_10000D9B0((uint64_t)v19);
        v21 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
        v22 = (void *)v21;
        if (v21)
          v23 = *(void **)(v21 + 24);
        else
          v23 = 0;
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "vendor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
        v54 = 134218498;
        v55 = v20;
        v56 = 2112;
        v57 = v25;
        v58 = 2048;
        v59 = sub_10000E610((uint64_t)v26);
        v27 = "proxy path is not ready due to insufficient ingress proxy tokens (cache+agent: %lu) for [%@], (ingress pro"
              "xy low-water mark: %lu)";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v54, 0x20u);

        goto LABEL_26;
      }
      goto LABEL_26;
    }
  }
  else
  {

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  if (sub_10000B9B4((uint64_t)v28))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
    v30 = sub_10000D9B0((uint64_t)v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
    v32 = sub_10000E610((uint64_t)v31);

    if (v30 <= v32)
    {
      v36 = nplog_obj(v33, v34, v35);
      v18 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
        v37 = sub_10000D9B0((uint64_t)v19);
        v38 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
        v22 = (void *)v38;
        if (v38)
          v39 = *(void **)(v38 + 24);
        else
          v39 = 0;
        v24 = v39;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "vendor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
        v54 = 134218498;
        v55 = v37;
        v56 = 2112;
        v57 = v25;
        v58 = 2048;
        v59 = sub_10000E610((uint64_t)v26);
        v27 = "proxy path is not ready due to insufficient egress proxy tokens (cache+agent: %lu) for [%@], (egress proxy"
              " low-water mark: %lu)";
        goto LABEL_16;
      }
LABEL_26:
      v41 = 0;
      goto LABEL_27;
    }
  }
  else
  {

  }
  v40 = nplog_obj(v33, v34, v35);
  v18 = objc_claimAutoreleasedReturnValue(v40);
  v41 = 1;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v42 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
    v43 = (void *)v42;
    if (v42)
      v44 = *(void **)(v42 + 24);
    else
      v44 = 0;
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "vendor"));
    v47 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
    v48 = (void *)v47;
    if (v47)
      v49 = *(void **)(v47 + 24);
    else
      v49 = 0;
    v50 = v49;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "vendor"));
    v54 = 138412546;
    v55 = (uint64_t)v46;
    v56 = 2112;
    v57 = v51;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "proxy path [%@:%@] is ready", (uint8_t *)&v54, 0x16u);

  }
LABEL_27:

  return v41;
}

- (BOOL)matchIngress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;

  v6 = (id *)a3;
  if (!v6)
  {
    v19 = nplog_obj(0, v4, v5);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v17 = 0;
      goto LABEL_6;
    }
    v23 = 136315138;
    v24 = "-[NSPCandidateProxyPath matchIngress:]";
    v21 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, v21, (uint8_t *)&v23, 0xCu);
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));

  if (!v7)
  {
    v22 = nplog_obj(v8, v9, v10);
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    v23 = 136315138;
    v24 = "-[NSPCandidateProxyPath matchIngress:]";
    v21 = "%s called with null self.ingressProxy";
    goto LABEL_12;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 24);
  else
    v13 = 0;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "proxyURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[3], "proxyURL"));
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

LABEL_6:
  return v17;
}

- (BOOL)matchEgress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;

  v6 = (id *)a3;
  if (!v6)
  {
    v19 = nplog_obj(0, v4, v5);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v17 = 0;
      goto LABEL_6;
    }
    v23 = 136315138;
    v24 = "-[NSPCandidateProxyPath matchEgress:]";
    v21 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, v21, (uint8_t *)&v23, 0xCu);
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));

  if (!v7)
  {
    v22 = nplog_obj(v8, v9, v10);
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    v23 = 136315138;
    v24 = "-[NSPCandidateProxyPath matchEgress:]";
    v21 = "%s called with null self.egressProxy";
    goto LABEL_12;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 24);
  else
    v13 = 0;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "proxyURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[3], "proxyURL"));
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

LABEL_6:
  return v17;
}

- (void)fetchDomainFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int has_internal_diagnostics;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id inited;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  __int128 *v38;
  id v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  id location;
  uint8_t buf[4];
  void *v48;
  __int128 v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath domainFilter](self, "domainFilter")),
        v6,
        v5,
        !v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v8));
    if (v11)
    {
      has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.networkserviceproxy");
      v13 = copyProductTypeString();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = copyOSNameString();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = copyOSVersionString();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = copyOSBuildString();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)v20;
      if (has_internal_diagnostics)
        v22 = CFSTR("<%@> <%@;%@;%@;internal>");
      else
        v22 = CFSTR("<%@> <%@;%@;%@>");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v14, v16, v18, v20));

      if (v23)
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", v23, CFSTR("X-Mask-Client-Info"));
      *(_QWORD *)&v49 = 0;
      *((_QWORD *)&v49 + 1) = &v49;
      v50 = 0x3032000000;
      v51 = sub_1000030EC;
      v52 = sub_10000C20C;
      v53 = (id)os_transaction_create("com.apple.networkserviceproxy.fetchDomainFilter");
      inited = objc_initWeak(&location, self);
      v40 = 0;
      v41 = (id *)&v40;
      v42 = 0x3032000000;
      v43 = sub_1000030EC;
      v44 = sub_10000C20C;
      v45 = 0;
      v27 = nplog_obj(inited, v25, v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v8;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sending request for %@", buf, 0xCu);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NPUtilities sharedEmphemeralSession](NPUtilities, "sharedEmphemeralSession"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10001DFF8;
      v34[3] = &unk_1000F5A30;
      v37 = &v40;
      objc_copyWeak(&v39, &location);
      v35 = v8;
      v36 = v4;
      v38 = &v49;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dataTaskWithRequest:completionHandler:", v11, v34));

      objc_storeStrong(v41 + 5, v30);
      objc_msgSend(v41[5], "resume");

      objc_destroyWeak(&v39);
      _Block_object_dispose(&v40, 8);

      objc_destroyWeak(&location);
      _Block_object_dispose(&v49, 8);

    }
    else
    {
      v31 = nplog_obj(0, v9, v10);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
        LODWORD(v49) = 138412290;
        *(_QWORD *)((char *)&v49 + 4) = v33;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to create request for preferred path URL %@", (uint8_t *)&v49, 0xCu);

      }
      if (v4)
        (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

- (NSPProxyTokenInfo)ingressProxy
{
  return self->_ingressProxy;
}

- (void)setIngressProxy:(id)a3
{
  objc_storeStrong((id *)&self->_ingressProxy, a3);
}

- (NSPProxyTokenInfo)egressProxy
{
  return self->_egressProxy;
}

- (void)setEgressProxy:(id)a3
{
  objc_storeStrong((id *)&self->_egressProxy, a3);
}

- (unint64_t)proxyPathWeight
{
  return self->_proxyPathWeight;
}

- (void)setProxyPathWeight:(unint64_t)a3
{
  self->_proxyPathWeight = a3;
}

- (NSString)preferredPathConfigURI
{
  return self->_preferredPathConfigURI;
}

- (void)setPreferredPathConfigURI:(id)a3
{
  objc_storeStrong((id *)&self->_preferredPathConfigURI, a3);
}

- (NSArray)preferredPathPatterns
{
  return self->_preferredPathPatterns;
}

- (void)setPreferredPathPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_preferredPathPatterns, a3);
}

- (NSData)domainFilter
{
  return self->_domainFilter;
}

- (void)setDomainFilter:(id)a3
{
  objc_storeStrong((id *)&self->_domainFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainFilter, 0);
  objc_storeStrong((id *)&self->_preferredPathPatterns, 0);
  objc_storeStrong((id *)&self->_preferredPathConfigURI, 0);
  objc_storeStrong((id *)&self->_egressProxy, 0);
  objc_storeStrong((id *)&self->_ingressProxy, 0);
}

@end
