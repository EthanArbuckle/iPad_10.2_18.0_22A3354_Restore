@implementation NSPPrivacyProxyAgentManager

+ (id)multiHopProxyAgentUUID
{
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_1000C01C0);
}

+ (id)singleHopProxyAgentUUID
{
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_1000C01D0);
}

+ (id)multiHopFallbackProxyAgentUUID
{
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_1000C01E0);
}

+ (id)singleHopFallbackProxyAgentUUID
{
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_1000C01F0);
}

+ (BOOL)proxiesMatch:(id)a3 proxyPathList:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 pathWeight:(unint64_t)a7 supportsFallback:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _BOOL4 v38;
  void *v39;
  NSObject *obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;

  v38 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v39 = v16;
  if (!v13)
  {
    v33 = nplog_obj(v16, v17, v18);
    obj = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 136315138;
    v47 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v34 = "%s called with null proxyInfoArray";
LABEL_34:
    _os_log_fault_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_FAULT, v34, buf, 0xCu);
    goto LABEL_26;
  }
  if (!v15)
  {
    v35 = nplog_obj(v16, v17, v18);
    obj = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 136315138;
    v47 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v34 = "%s called with null matchIngressProxy";
    goto LABEL_34;
  }
  if (!v16)
  {
    v36 = nplog_obj(0, v17, v18);
    obj = objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 136315138;
    v47 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v34 = "%s called with null matchEgressProxy";
    goto LABEL_34;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v14;
  v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v19)
  {
    v20 = v19;
    v37 = v14;
    v21 = *(_QWORD *)v42;
LABEL_6:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v22);
      if (!a7 || objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v22), "weight") == a7)
      {
        v24 = objc_msgSend(v23, "proxiesCount", v37);
        if (v24 != (id)2)
        {
          v30 = nplog_obj(v24, v25, v26);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          v14 = v37;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
            _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "%s called with null (proxyPath.proxiesCount == MAX_PROXIES_ON_PATH)", buf, 0xCu);
          }

          break;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", *(unsigned int *)objc_msgSend(v23, "proxies")));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", *((unsigned int *)objc_msgSend(v23, "proxies")
                                                                                            + 1)));
        if (sub_1000206D8((uint64_t)NSPPrivacyProxyAgentManager, v27, v15)
          && sub_1000206D8((uint64_t)a1, v28, v39)
          && (!v38
           || objc_msgSend(v27, "supportsFallback") && objc_msgSend(v28, "supportsFallback")))
        {

          v29 = 1;
LABEL_22:
          v14 = v37;
          goto LABEL_27;
        }

      }
      if (v20 == (id)++v22)
      {
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v20)
          goto LABEL_6;
        v29 = 0;
        goto LABEL_22;
      }
    }
  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
    sub_1000418A4(v3, self->_quicProxyPath, CFSTR("Quic proxy path"), 0, 14);
    sub_1000418A4(v3, self->_fallbackProxyPath, CFSTR("Fallback proxy path"), 0, 14);
    sub_1000418A4(v3, self->_preferredQUICProxyPaths, CFSTR("Preferred proxy paths"), 0, 14);
    sub_1000418A4(v3, self->_candidateQuicProxyPath, CFSTR("Candidate quic proxy path"), 0, 14);
    sub_1000418A4(v3, self->_candidateFallbackProxyPath, CFSTR("Candidate fallback proxy path"), 0, 14);
    sub_1000418A4(v3, self->_candidatePreferredQUICProxyPaths, CFSTR("Candidate preferred proxy paths"), 0, 14);
    sub_1000418A4(v3, self->_proxiedContentPaths, CFSTR("Proxied content paths"), 0, 14);
    sub_1000418A4(v3, self->_networkSpecificQUICProxyPaths, CFSTR("Network specific proxied paths"), 0, 14);
    sub_1000418A4(v3, self->_networkDiscoveredProxyInfos, CFSTR("Network discovered proxy ingree"), 0, 14);
    sub_1000418A4(v3, self->_obliviousPaths, CFSTR("Oblivious paths"), 0, 14);
    sub_1000418A4(v3, self->_proxyPathCustomEnumerator, CFSTR("Proxy path enumerator"), 0, 14);
    sub_1000418A4(v3, self->_fallbackProxyPathCustomEnumerator, CFSTR("Fallback proxy path enumerator"), 0, 14);
    sub_1000418A4(v3, self->_obliviousConfigs, CFSTR("Oblivious configs"), 0, 14);
    sub_1000418A4(v3, self->_penalizedObliviousProxyIndices, CFSTR("Penalized oblivious proxy indicies"), 0, 14);
    sub_1000418A4(v3, self->_proxiedContentMaps, CFSTR("Proxied content maps"), 0, 14);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v4, 1, 2));
    sub_1000418A4(v3, v5, CFSTR("Token issuance restricted"), 0, 14);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredProxy](self, "overridePreferredProxy"));
    sub_1000418A4(v3, v6, CFSTR("Override preferred proxy"), 0, 14);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredObliviousProxy](self, "overridePreferredObliviousProxy"));
    sub_1000418A4(v3, v7, CFSTR("Override preferred oblivious proxy"), 0, 14);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](self, "overrideIngressProxy"));
    sub_1000418A4(v3, v8, CFSTR("Override ingress proxy"), 0, 14);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideFallbackIngressProxy](self, "overrideFallbackIngressProxy"));
    sub_1000418A4(v3, v9, CFSTR("Override fallback ingress proxy"), 0, 14);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](self, "overrideIngressProxyKey"));
    sub_1000418A4(v3, v10, CFSTR("Override ingress proxy key"), 0, 14);

    sub_1000418A4(v3, self->_overrideEnabledMaps, CFSTR("Override enabled maps"), 0, 14);
    sub_1000420E0(v3, self->_disableProxiedContentDoHBootstrap, (uint64_t)CFSTR("Disable proxied content maps DoH bootstrap"), 0, 14);
    sub_1000420E0(v3, -[NSPPrivacyProxyAgentManager forceFallback](self, "forceFallback"), (uint64_t)CFSTR("Force fallback"), 0, 14);
    sub_100042144(v3, self->_networkProxiesRotated, (uint64_t)CFSTR("Network proxies rotated"), 0, 14);
    sub_100042144(v3, self->_networkFallbackProxiesRotated, (uint64_t)CFSTR("Network fallback proxies rotated"), 0, 14);
    sub_100042144(v3, self->_proxiesRotated, (uint64_t)CFSTR("Proxies rotated"), 0, 14);
    sub_1000418A4(v3, self->_proxyPathProber, CFSTR("Proxy path prober"), 0, 14);
    sub_1000418A4(v3, self->_directPathProber, CFSTR("Direct path prober"), 0, 14);
    sub_1000418A4(v3, self->_pvdConfigurationFetcher, CFSTR("Fetch PvD Options Configuration"), 0, 14);
    sub_100042144(v3, self->_probingReason, (uint64_t)CFSTR("Probing reason"), 0, 14);
    sub_1000420E0(v3, self->_reportedTokenOutage, (uint64_t)CFSTR("Reported token outage"), 0, 14);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPPrivacyProxyAgentManager)initWithCoder:(id)a3
{
  id v4;
  NSPPrivacyProxyAgentManager *v5;
  id v6;
  uint64_t v7;
  NSArray *proxyArray;
  id v9;
  uint64_t v10;
  NSArray *resolverArray;
  id v12;
  uint64_t v13;
  NSArray *proxyPathList;
  id v15;
  uint64_t v16;
  NSArray *fallbackProxyPathList;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  uint64_t v21;
  NSArray *obliviousConfigs;
  uint64_t v23;
  NSSet *v24;
  void *v25;
  uint64_t v26;
  NSArray *proxiedContentMaps;
  id v28;
  uint64_t v29;
  NSString *overridePreferredProxy;
  id v31;
  uint64_t v32;
  NSString *overridePreferredObliviousProxy;
  id v34;
  uint64_t v35;
  NSString *overrideIngressProxy;
  id v37;
  uint64_t v38;
  NSString *overrideFallbackIngressProxy;
  id v40;
  uint64_t v41;
  NSData *overrideIngressProxyKey;
  uint64_t v43;
  uint64_t v44;
  NSSet *v45;
  void *v46;
  void *v47;
  NSMutableArray *v48;
  NSMutableArray *overrideEnabledMaps;
  id v50;
  uint64_t v51;
  NSPQuicProxyPath *quicProxyPath;
  id v53;
  uint64_t v54;
  NSPFallbackProxyPath *fallbackProxyPath;
  uint64_t v56;
  uint64_t v57;
  NSSet *v58;
  void *v59;
  uint64_t v60;
  NSMutableDictionary *preferredQUICProxyPaths;
  id v62;
  uint64_t v63;
  NSPCandidateQuicProxyPath *candidateQuicProxyPath;
  id v65;
  uint64_t v66;
  NSPCandidateFallbackProxyPath *candidateFallbackProxyPath;
  uint64_t v68;
  uint64_t v69;
  NSSet *v70;
  void *v71;
  uint64_t v72;
  NSMutableDictionary *candidatePreferredQUICProxyPaths;
  uint64_t v74;
  NSSet *v75;
  void *v76;
  uint64_t v77;
  NSMutableArray *proxiedContentPaths;
  uint64_t v79;
  uint64_t v80;
  NSSet *v81;
  void *v82;
  uint64_t v83;
  NSMutableDictionary *networkSpecificQUICProxyPaths;
  uint64_t v85;
  uint64_t v86;
  NSSet *v87;
  void *v88;
  uint64_t v89;
  NSMutableDictionary *networkDiscoveredProxyInfos;
  uint64_t v91;
  NSSet *v92;
  void *v93;
  uint64_t v94;
  NSMutableArray *obliviousPaths;
  id v96;
  uint64_t v97;
  NSDate *lastQuicProxySwitchedDate;
  id v99;
  uint64_t v100;
  NSDate *lastFallbackProxySwitchedDate;
  id v102;
  uint64_t v103;
  NSDate *probeStartTime;
  id v105;
  uint64_t v106;
  NSDate *probeEndTime;
  id v108;
  void *v109;
  uint64_t v110;
  NSMutableArray *proxyTokenInfoArray;
  id v112;
  uint64_t v113;
  NSDate *tokenIssuanceRestrictedUntilDate;
  id v115;
  uint64_t v116;
  NSDate *lastPathUnsatisfiedDate;
  id v118;
  uint64_t v119;
  NSDate *lastPrimaryInterfaceChangedDate;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  NSSet *v124;
  void *v125;
  uint64_t v126;
  NSDictionary *networkCharacteristics;
  id v128;
  void *v129;
  id v130;
  uint64_t v131;
  NSPProber *proxyPathProber;
  id v133;
  uint64_t v134;
  NSPProber *directPathProber;
  id v136;
  uint64_t v137;
  NSPOutageReasonStats *lastProxyOutageReasonStats;
  id v139;
  uint64_t v140;
  NSPOutageReasonStats *lastTokenOutageReasonStats;
  id v142;
  uint64_t v143;
  NSNumber *configEpoch;
  id v145;
  uint64_t v146;
  NSNumber *reportedEpoch;
  objc_super v149;

  v4 = a3;
  v149.receiver = self;
  v149.super_class = (Class)NSPPrivacyProxyAgentManager;
  v5 = -[NSPPrivacyProxyAgentManager init](&v149, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSPPrivacyProxyProxyInfo), CFSTR("proxyAgentProxyArray"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    proxyArray = v5->_proxyArray;
    v5->_proxyArray = (NSArray *)v7;

    v9 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSPPrivacyProxyResolverInfo), CFSTR("proxyAgentResolverArray"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    resolverArray = v5->_resolverArray;
    v5->_resolverArray = (NSArray *)v10;

    v12 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSPPrivacyProxyProxyPathWeight), CFSTR("proxyAgentProxyPathList"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    proxyPathList = v5->_proxyPathList;
    v5->_proxyPathList = (NSArray *)v13;

    v15 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSPPrivacyProxyProxyPathWeight), CFSTR("proxyAgentFallbackProxyPathList"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    fallbackProxyPathList = v5->_fallbackProxyPathList;
    v5->_fallbackProxyPathList = (NSArray *)v16;

    v18 = objc_opt_class(NSArray);
    v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(NSPPrivacyProxyObliviousHTTPConfig), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("proxyAgentObliviousConfigs")));
    obliviousConfigs = v5->_obliviousConfigs;
    v5->_obliviousConfigs = (NSArray *)v21;

    v23 = objc_opt_class(NSArray);
    v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, objc_opt_class(NSPPrivacyProxyProxiedContentMap), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("proxyAgentProxiedContentMaps")));
    proxiedContentMaps = v5->_proxiedContentMaps;
    v5->_proxiedContentMaps = (NSArray *)v26;

    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("proxyAgentOverridePreferredProxy"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    overridePreferredProxy = v5->_overridePreferredProxy;
    v5->_overridePreferredProxy = (NSString *)v29;

    v31 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("proxyAgentOverridePreferredObliviousProxy"));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    overridePreferredObliviousProxy = v5->_overridePreferredObliviousProxy;
    v5->_overridePreferredObliviousProxy = (NSString *)v32;

    v34 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("proxyAgentOverrideIngressProxy"));
    v35 = objc_claimAutoreleasedReturnValue(v34);
    overrideIngressProxy = v5->_overrideIngressProxy;
    v5->_overrideIngressProxy = (NSString *)v35;

    v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("proxyAgentOverrideFallbackIngressProxy"));
    v38 = objc_claimAutoreleasedReturnValue(v37);
    overrideFallbackIngressProxy = v5->_overrideFallbackIngressProxy;
    v5->_overrideFallbackIngressProxy = (NSString *)v38;

    v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("proxyAgentOverrideIngressProxyKey"));
    v41 = objc_claimAutoreleasedReturnValue(v40);
    overrideIngressProxyKey = v5->_overrideIngressProxyKey;
    v5->_overrideIngressProxyKey = (NSData *)v41;

    v43 = objc_opt_class(NSArray);
    v44 = objc_opt_class(NSString);
    v45 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v43, v44, objc_opt_class(NSPQuicProxyPath), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("proxyAgentOverrideEnabledMaps")));
    v48 = (NSMutableArray *)objc_msgSend(v47, "mutableCopy");
    overrideEnabledMaps = v5->_overrideEnabledMaps;
    v5->_overrideEnabledMaps = v48;

    v5->_disableProxiedContentDoHBootstrap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyAgentDisableProxiedContentDoHBootstrap"));
    v5->_forceFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyAgentForceFallbackKey"));
    v50 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPQuicProxyPath), CFSTR("proxyAgentQuicProxyPath"));
    v51 = objc_claimAutoreleasedReturnValue(v50);
    quicProxyPath = v5->_quicProxyPath;
    v5->_quicProxyPath = (NSPQuicProxyPath *)v51;

    v53 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPFallbackProxyPath), CFSTR("proxyAgentFallbackProxyPath"));
    v54 = objc_claimAutoreleasedReturnValue(v53);
    fallbackProxyPath = v5->_fallbackProxyPath;
    v5->_fallbackProxyPath = (NSPFallbackProxyPath *)v54;

    v56 = objc_opt_class(NSDictionary);
    v57 = objc_opt_class(NSString);
    v58 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v56, v57, objc_opt_class(NSPQuicProxyPath), 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v59, CFSTR("proxyAgentPreferredQuicProxyPaths")));
    preferredQUICProxyPaths = v5->_preferredQUICProxyPaths;
    v5->_preferredQUICProxyPaths = (NSMutableDictionary *)v60;

    v62 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPCandidateQuicProxyPath), CFSTR("proxyAgentCandidateQuicProxyPath"));
    v63 = objc_claimAutoreleasedReturnValue(v62);
    candidateQuicProxyPath = v5->_candidateQuicProxyPath;
    v5->_candidateQuicProxyPath = (NSPCandidateQuicProxyPath *)v63;

    v65 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPCandidateFallbackProxyPath), CFSTR("proxyAgentCandidateFallbackProxyPath"));
    v66 = objc_claimAutoreleasedReturnValue(v65);
    candidateFallbackProxyPath = v5->_candidateFallbackProxyPath;
    v5->_candidateFallbackProxyPath = (NSPCandidateFallbackProxyPath *)v66;

    v68 = objc_opt_class(NSDictionary);
    v69 = objc_opt_class(NSString);
    v70 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v68, v69, objc_opt_class(NSPCandidateQuicProxyPath), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, CFSTR("proxyAgentCandidatePreferredQuicProxyPaths")));
    candidatePreferredQUICProxyPaths = v5->_candidatePreferredQUICProxyPaths;
    v5->_candidatePreferredQUICProxyPaths = (NSMutableDictionary *)v72;

    v74 = objc_opt_class(NSArray);
    v75 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v74, objc_opt_class(NSPProxiedContentPath), 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
    v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v76, CFSTR("proxyAgentProxiedContentPaths")));
    proxiedContentPaths = v5->_proxiedContentPaths;
    v5->_proxiedContentPaths = (NSMutableArray *)v77;

    v79 = objc_opt_class(NSDictionary);
    v80 = objc_opt_class(NSString);
    v81 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v79, v80, objc_opt_class(NSPQuicProxyPath), 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
    v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v82, CFSTR("proxyAgentNetworkQuicProxyPaths")));
    networkSpecificQUICProxyPaths = v5->_networkSpecificQUICProxyPaths;
    v5->_networkSpecificQUICProxyPaths = (NSMutableDictionary *)v83;

    v85 = objc_opt_class(NSDictionary);
    v86 = objc_opt_class(NSString);
    v87 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v85, v86, objc_opt_class(NSPPrivacyProxyProxyInfo), 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
    v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v88, CFSTR("proxyAgentNetworkDiscoveredProxyInfos")));
    networkDiscoveredProxyInfos = v5->_networkDiscoveredProxyInfos;
    v5->_networkDiscoveredProxyInfos = (NSMutableDictionary *)v89;

    v91 = objc_opt_class(NSArray);
    v92 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v91, objc_opt_class(NSPObliviousPath), 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
    v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v93, CFSTR("proxyAgentObliviousPaths")));
    obliviousPaths = v5->_obliviousPaths;
    v5->_obliviousPaths = (NSMutableArray *)v94;

    v96 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proxyAgentLastQuicProxySwitchedDate"));
    v97 = objc_claimAutoreleasedReturnValue(v96);
    lastQuicProxySwitchedDate = v5->_lastQuicProxySwitchedDate;
    v5->_lastQuicProxySwitchedDate = (NSDate *)v97;

    v99 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proxyAgentLastFallbackProxySwitchedDate"));
    v100 = objc_claimAutoreleasedReturnValue(v99);
    lastFallbackProxySwitchedDate = v5->_lastFallbackProxySwitchedDate;
    v5->_lastFallbackProxySwitchedDate = (NSDate *)v100;

    v102 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proxyAgentProbeStartTime"));
    v103 = objc_claimAutoreleasedReturnValue(v102);
    probeStartTime = v5->_probeStartTime;
    v5->_probeStartTime = (NSDate *)v103;

    v105 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proxyAgentProbeEndTime"));
    v106 = objc_claimAutoreleasedReturnValue(v105);
    probeEndTime = v5->_probeEndTime;
    v5->_probeEndTime = (NSDate *)v106;

    v108 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSPProxyTokenInfo), CFSTR("proxyAgentProxyTokenInfoArray"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
    if (v109)
    {
      v110 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v109));
      proxyTokenInfoArray = v5->_proxyTokenInfoArray;
      v5->_proxyTokenInfoArray = (NSMutableArray *)v110;

    }
    v112 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proxyAgentTokenIssuanceRestrictedUntilDate"));
    v113 = objc_claimAutoreleasedReturnValue(v112);
    tokenIssuanceRestrictedUntilDate = v5->_tokenIssuanceRestrictedUntilDate;
    v5->_tokenIssuanceRestrictedUntilDate = (NSDate *)v113;

    v115 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proxyAgentLastPathUnsatisfiedDate"));
    v116 = objc_claimAutoreleasedReturnValue(v115);
    lastPathUnsatisfiedDate = v5->_lastPathUnsatisfiedDate;
    v5->_lastPathUnsatisfiedDate = (NSDate *)v116;

    v118 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proxyAgentLastPrimaryInterfaceChangeDate"));
    v119 = objc_claimAutoreleasedReturnValue(v118);
    lastPrimaryInterfaceChangedDate = v5->_lastPrimaryInterfaceChangedDate;
    v5->_lastPrimaryInterfaceChangedDate = (NSDate *)v119;

    v121 = objc_opt_class(NSDictionary);
    v122 = objc_opt_class(NSNumber);
    v123 = objc_opt_class(NSString);
    v124 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v121, v122, v123, objc_opt_class(NSData), 0);
    v125 = (void *)objc_claimAutoreleasedReturnValue(v124);
    v126 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v125, CFSTR("proxyAgentNetworkCharacteristics")));
    networkCharacteristics = v5->_networkCharacteristics;
    v5->_networkCharacteristics = (NSDictionary *)v126;

    v5->_useDefaultInterface = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyAgentUseDefaultInterface"));
    v5->_subscriber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyAgentSubscriber"));
    v5->_unlimited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyAgentUnlimited"));
    v5->_geohashSharingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyAgentGeohashSharingEnabled"));
    v128 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("proxyAgentGeohashOverride"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
    -[NSPPrivacyProxyAgentManager setGeohashOverride:](v5, "setGeohashOverride:", v129);

    -[NSPPrivacyProxyAgentManager setDnsFilteringHintEnabled:](v5, "setDnsFilteringHintEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyAgentDNSFilteringHintEnabled")));
    v5->_networkProxiesRotated = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proxyAgentNetworkProxiesRotated"));
    v5->_networkFallbackProxiesRotated = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proxyAgentNetworkFallbackProxiesRotated"));
    v5->_proxiesRotated = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proxyAgentProxiesRotated"));
    v130 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProber), CFSTR("proxyAgentProxyPathProber"));
    v131 = objc_claimAutoreleasedReturnValue(v130);
    proxyPathProber = v5->_proxyPathProber;
    v5->_proxyPathProber = (NSPProber *)v131;

    v133 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProber), CFSTR("proxyAgentDirectPathProber"));
    v134 = objc_claimAutoreleasedReturnValue(v133);
    directPathProber = v5->_directPathProber;
    v5->_directPathProber = (NSPProber *)v134;

    v136 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPOutageReasonStats), CFSTR("proxyAgentLastProxyOutageReasonStats"));
    v137 = objc_claimAutoreleasedReturnValue(v136);
    lastProxyOutageReasonStats = v5->_lastProxyOutageReasonStats;
    v5->_lastProxyOutageReasonStats = (NSPOutageReasonStats *)v137;

    v139 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPOutageReasonStats), CFSTR("proxyAgentLastTokenOutageReasonStats"));
    v140 = objc_claimAutoreleasedReturnValue(v139);
    lastTokenOutageReasonStats = v5->_lastTokenOutageReasonStats;
    v5->_lastTokenOutageReasonStats = (NSPOutageReasonStats *)v140;

    v5->_probingReason = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proxyAgentProbingReason"));
    v5->_reportedTokenOutage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyAgentReportedTokenOutage"));
    v142 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("proxyAgentConfigEpoch"));
    v143 = objc_claimAutoreleasedReturnValue(v142);
    configEpoch = v5->_configEpoch;
    v5->_configEpoch = (NSNumber *)v143;

    v145 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("proxyAgentReportedEpoch"));
    v146 = objc_claimAutoreleasedReturnValue(v145);
    reportedEpoch = v5->_reportedEpoch;
    v5->_reportedEpoch = (NSNumber *)v146;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *proxiedContentMaps;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *proxyTokenInfoArray;
  void *v11;
  _BOOL8 geohashSharingEnabled;
  void *v13;
  NSNumber *reportedEpoch;
  id v15;

  v15 = a3;
  if (self)
  {
    objc_msgSend(v15, "encodeObject:forKey:", self->_proxyArray, CFSTR("proxyAgentProxyArray"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_resolverArray, CFSTR("proxyAgentResolverArray"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_proxyPathList, CFSTR("proxyAgentProxyPathList"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_fallbackProxyPathList, CFSTR("proxyAgentFallbackProxyPathList"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_obliviousConfigs, CFSTR("proxyAgentObliviousConfigs"));
    proxiedContentMaps = self->_proxiedContentMaps;
  }
  else
  {
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentProxyArray"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentResolverArray"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentProxyPathList"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentFallbackProxyPathList"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentObliviousConfigs"));
    proxiedContentMaps = 0;
  }
  objc_msgSend(v15, "encodeObject:forKey:", proxiedContentMaps, CFSTR("proxyAgentProxiedContentMaps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredProxy](self, "overridePreferredProxy"));
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("proxyAgentOverridePreferredProxy"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredObliviousProxy](self, "overridePreferredObliviousProxy"));
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("proxyAgentOverridePreferredObliviousProxy"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](self, "overrideIngressProxy"));
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("proxyAgentOverrideIngressProxy"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideFallbackIngressProxy](self, "overrideFallbackIngressProxy"));
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("proxyAgentOverrideFallbackIngressProxy"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](self, "overrideIngressProxyKey"));
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("proxyAgentOverrideIngressProxyKey"));

  if (self)
  {
    objc_msgSend(v15, "encodeObject:forKey:", self->_overrideEnabledMaps, CFSTR("proxyAgentOverrideEnabledMaps"));
    objc_msgSend(v15, "encodeBool:forKey:", self->_disableProxiedContentDoHBootstrap, CFSTR("proxyAgentDisableProxiedContentDoHBootstrap"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_quicProxyPath, CFSTR("proxyAgentQuicProxyPath"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_fallbackProxyPath, CFSTR("proxyAgentFallbackProxyPath"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_preferredQUICProxyPaths, CFSTR("proxyAgentPreferredQuicProxyPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_candidateQuicProxyPath, CFSTR("proxyAgentCandidateQuicProxyPath"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_candidateFallbackProxyPath, CFSTR("proxyAgentCandidateFallbackProxyPath"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_candidatePreferredQUICProxyPaths, CFSTR("proxyAgentCandidatePreferredQuicProxyPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_proxiedContentPaths, CFSTR("proxyAgentProxiedContentPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_networkSpecificQUICProxyPaths, CFSTR("proxyAgentNetworkQuicProxyPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_networkDiscoveredProxyInfos, CFSTR("proxyAgentNetworkDiscoveredProxyInfos"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_obliviousPaths, CFSTR("proxyAgentObliviousPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_lastQuicProxySwitchedDate, CFSTR("proxyAgentLastQuicProxySwitchedDate"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_lastFallbackProxySwitchedDate, CFSTR("proxyAgentLastFallbackProxySwitchedDate"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_probeStartTime, CFSTR("proxyAgentProbeStartTime"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_probeEndTime, CFSTR("proxyAgentProbeEndTime"));
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else
  {
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentOverrideEnabledMaps"));
    objc_msgSend(v15, "encodeBool:forKey:", 0, CFSTR("proxyAgentDisableProxiedContentDoHBootstrap"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentQuicProxyPath"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentFallbackProxyPath"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentPreferredQuicProxyPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentCandidateQuicProxyPath"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentCandidateFallbackProxyPath"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentCandidatePreferredQuicProxyPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentProxiedContentPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentNetworkQuicProxyPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentNetworkDiscoveredProxyInfos"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentObliviousPaths"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentLastQuicProxySwitchedDate"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentLastFallbackProxySwitchedDate"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentProbeStartTime"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentProbeEndTime"));
    proxyTokenInfoArray = 0;
  }
  objc_msgSend(v15, "encodeObject:forKey:", proxyTokenInfoArray, CFSTR("proxyAgentProxyTokenInfoArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("proxyAgentTokenIssuanceRestrictedUntilDate"));

  if (self)
  {
    objc_msgSend(v15, "encodeObject:forKey:", self->_lastPathUnsatisfiedDate, CFSTR("proxyAgentLastPathUnsatisfiedDate"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_lastPrimaryInterfaceChangedDate, CFSTR("proxyAgentLastPrimaryInterfaceChangeDate"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_networkCharacteristics, CFSTR("proxyAgentNetworkCharacteristics"));
    objc_msgSend(v15, "encodeBool:forKey:", self->_useDefaultInterface, CFSTR("proxyAgentUseDefaultInterface"));
    objc_msgSend(v15, "encodeBool:forKey:", self->_subscriber, CFSTR("proxyAgentSubscriber"));
    objc_msgSend(v15, "encodeBool:forKey:", self->_unlimited, CFSTR("proxyAgentUnlimited"));
    geohashSharingEnabled = self->_geohashSharingEnabled;
  }
  else
  {
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentLastPathUnsatisfiedDate"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentLastPrimaryInterfaceChangeDate"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentNetworkCharacteristics"));
    objc_msgSend(v15, "encodeBool:forKey:", 0, CFSTR("proxyAgentUseDefaultInterface"));
    objc_msgSend(v15, "encodeBool:forKey:", 0, CFSTR("proxyAgentSubscriber"));
    objc_msgSend(v15, "encodeBool:forKey:", 0, CFSTR("proxyAgentUnlimited"));
    geohashSharingEnabled = 0;
  }
  objc_msgSend(v15, "encodeBool:forKey:", geohashSharingEnabled, CFSTR("proxyAgentGeohashSharingEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager geohashOverride](self, "geohashOverride"));
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("proxyAgentGeohashOverride"));

  objc_msgSend(v15, "encodeBool:forKey:", -[NSPPrivacyProxyAgentManager dnsFilteringHintEnabled](self, "dnsFilteringHintEnabled"), CFSTR("proxyAgentDNSFilteringHintEnabled"));
  if (self)
  {
    objc_msgSend(v15, "encodeInteger:forKey:", self->_networkProxiesRotated, CFSTR("proxyAgentNetworkProxiesRotated"));
    objc_msgSend(v15, "encodeInteger:forKey:", self->_networkFallbackProxiesRotated, CFSTR("proxyAgentNetworkFallbackProxiesRotated"));
    objc_msgSend(v15, "encodeInteger:forKey:", self->_proxiesRotated, CFSTR("proxyAgentProxiesRotated"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_proxyPathProber, CFSTR("proxyAgentProxyPathProber"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_directPathProber, CFSTR("proxyAgentDirectPathProber"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_lastProxyOutageReasonStats, CFSTR("proxyAgentLastProxyOutageReasonStats"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_lastTokenOutageReasonStats, CFSTR("proxyAgentLastTokenOutageReasonStats"));
    objc_msgSend(v15, "encodeInteger:forKey:", self->_probingReason, CFSTR("proxyAgentProbingReason"));
    objc_msgSend(v15, "encodeBool:forKey:", self->_reportedTokenOutage, CFSTR("proxyAgentReportedTokenOutage"));
    objc_msgSend(v15, "encodeObject:forKey:", self->_configEpoch, CFSTR("proxyAgentConfigEpoch"));
    reportedEpoch = self->_reportedEpoch;
  }
  else
  {
    objc_msgSend(v15, "encodeInteger:forKey:", 0, CFSTR("proxyAgentNetworkProxiesRotated"));
    objc_msgSend(v15, "encodeInteger:forKey:", 0, CFSTR("proxyAgentNetworkFallbackProxiesRotated"));
    objc_msgSend(v15, "encodeInteger:forKey:", 0, CFSTR("proxyAgentProxiesRotated"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentProxyPathProber"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentDirectPathProber"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentLastProxyOutageReasonStats"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentLastTokenOutageReasonStats"));
    objc_msgSend(v15, "encodeInteger:forKey:", 0, CFSTR("proxyAgentProbingReason"));
    objc_msgSend(v15, "encodeBool:forKey:", 0, CFSTR("proxyAgentReportedTokenOutage"));
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("proxyAgentConfigEpoch"));
    reportedEpoch = 0;
  }
  objc_msgSend(v15, "encodeObject:forKey:", reportedEpoch, CFSTR("proxyAgentReportedEpoch"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPPrivacyProxyAgentManager *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *resolverArray;
  NSArray *v8;
  NSArray *v9;
  NSMutableArray *proxyPathCustomEnumerator;
  NSMutableArray *v11;
  NSArray *v12;
  NSMutableArray *fallbackProxyPathCustomEnumerator;
  NSMutableArray *v14;
  NSArray *v15;
  NSMutableArray *penalizedObliviousProxyIndices;
  NSMutableArray *v17;
  NSArray *v18;
  NSMutableDictionary *networkSpecificQUICProxyPaths;
  NSMutableDictionary *v20;
  NSMutableDictionary *networkDiscoveredProxyInfos;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  id v29;
  BOOL disableProxiedContentDoHBootstrap;
  NSPQuicProxyPath *v31;
  NSPFallbackProxyPath *fallbackProxyPath;
  NSPFallbackProxyPath *v33;
  NSPCandidateQuicProxyPath *v34;
  NSPCandidateFallbackProxyPath *candidateFallbackProxyPath;
  NSPCandidateFallbackProxyPath *v36;
  NSDate *v37;
  NSDate *lastFallbackProxySwitchedDate;
  NSDate *v39;
  NSMutableArray *v40;
  void *v41;
  NWPath *path;
  NWPath *v43;
  NSDate *v44;
  NSDate *lastPrimaryInterfaceChangedDate;
  NSDate *v46;
  NSDate *v47;
  NSDate *probeEndTime;
  NSDate *v49;
  NSDictionary *v50;
  BOOL useDefaultInterface;
  BOOL subscriber;
  BOOL unlimited;
  BOOL geohashSharingEnabled;
  void *v55;
  BOOL proxyConnectivityCheckActive;
  unint64_t tokenFetchSuccessCount;
  unint64_t tokenFetchFailedCount;
  unint64_t tokenConsumedCount;
  unint64_t tokenExpiredCount;
  unint64_t agentLowWaterMarkHitCount;
  unint64_t cacheLowWaterMarkHitCount;
  unint64_t networkProxiesRotated;
  unint64_t networkFallbackProxiesRotated;
  unint64_t proxiesRotated;
  unint64_t generation;
  NSPProber *v67;
  NSPProber *directPathProber;
  NSPProber *v69;
  NSPPvDConfigurationFetcher *v70;
  NSPOutageReasonStats *lastProxyOutageReasonStats;
  NSPOutageReasonStats *v72;
  NSPOutageReasonStats *v73;
  int64_t probingReason;
  BOOL reportedTokenOutage;
  NSNumber *v76;
  NSNumber *reportedEpoch;
  NSNumber *v78;
  id v79;
  id v81;
  void *v82;

  v4 = -[NSPPrivacyProxyAgentManager init](+[NSPPrivacyProxyAgentManager allocWithZone:](NSPPrivacyProxyAgentManager, "allocWithZone:", a3), "init");
  v5 = (uint64_t)v4;
  if (self)
  {
    v6 = self->_proxyArray;
    sub_10002304C(v5, v6);

    resolverArray = self->_resolverArray;
  }
  else
  {
    sub_10002304C((uint64_t)v4, 0);
    resolverArray = 0;
  }
  v8 = resolverArray;
  sub_10002305C(v5, v8);

  if (self)
  {
    v9 = self->_proxyPathList;
    sub_10002306C(v5, v9);

    proxyPathCustomEnumerator = self->_proxyPathCustomEnumerator;
  }
  else
  {
    sub_10002306C(v5, 0);
    proxyPathCustomEnumerator = 0;
  }
  v11 = proxyPathCustomEnumerator;
  sub_10002307C(v5, v11);

  if (self)
  {
    v12 = self->_fallbackProxyPathList;
    sub_10002308C(v5, v12);

    fallbackProxyPathCustomEnumerator = self->_fallbackProxyPathCustomEnumerator;
  }
  else
  {
    sub_10002308C(v5, 0);
    fallbackProxyPathCustomEnumerator = 0;
  }
  v14 = fallbackProxyPathCustomEnumerator;
  sub_10002309C(v5, v14);

  if (self)
  {
    v15 = self->_obliviousConfigs;
    sub_1000230AC(v5, v15);

    penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
  }
  else
  {
    sub_1000230AC(v5, 0);
    penalizedObliviousProxyIndices = 0;
  }
  v17 = penalizedObliviousProxyIndices;
  sub_1000230BC(v5, v17);

  if (self)
  {
    v18 = self->_proxiedContentMaps;
    sub_1000230CC(v5, v18);

    networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
  }
  else
  {
    sub_1000230CC(v5, 0);
    networkSpecificQUICProxyPaths = 0;
  }
  v20 = networkSpecificQUICProxyPaths;
  if (v5)
    objc_storeStrong((id *)(v5 + 328), networkSpecificQUICProxyPaths);

  if (self)
    networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
  else
    networkDiscoveredProxyInfos = 0;
  v22 = networkDiscoveredProxyInfos;
  sub_1000230DC(v5, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredProxy](self, "overridePreferredProxy"));
  sub_10000D354(v5, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredObliviousProxy](self, "overridePreferredObliviousProxy"));
  sub_1000062B8(v5, v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](self, "overrideIngressProxy"));
  sub_10000D364(v5, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideFallbackIngressProxy](self, "overrideFallbackIngressProxy"));
  sub_10000BB1C(v5, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](self, "overrideIngressProxyKey"));
  sub_1000230EC(v5, v27);

  if (self)
  {
    v28 = self->_overrideEnabledMaps;
    v29 = -[NSMutableArray copy](v28, "copy");
    sub_1000230FC(v5, v29);

    disableProxiedContentDoHBootstrap = self->_disableProxiedContentDoHBootstrap;
    if (!v5)
      goto LABEL_18;
    goto LABEL_17;
  }
  v81 = objc_msgSend(0, "copy");
  sub_1000230FC(v5, v81);

  disableProxiedContentDoHBootstrap = 0;
  if (v5)
LABEL_17:
    *(_BYTE *)(v5 + 11) = disableProxiedContentDoHBootstrap;
LABEL_18:
  if (self)
  {
    v31 = self->_quicProxyPath;
    sub_10002310C(v5, v31);

    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else
  {
    sub_10002310C(v5, 0);
    fallbackProxyPath = 0;
  }
  v33 = fallbackProxyPath;
  sub_10002311C(v5, v33);

  if (self)
  {
    v34 = self->_candidateQuicProxyPath;
    sub_10002312C(v5, v34);

    candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
  }
  else
  {
    sub_10002312C(v5, 0);
    candidateFallbackProxyPath = 0;
  }
  v36 = candidateFallbackProxyPath;
  sub_10002313C(v5, v36);

  if (self)
  {
    v37 = self->_lastQuicProxySwitchedDate;
    sub_10002314C(v5, v37);

    lastFallbackProxySwitchedDate = self->_lastFallbackProxySwitchedDate;
  }
  else
  {
    sub_10002314C(v5, 0);
    lastFallbackProxySwitchedDate = 0;
  }
  v39 = lastFallbackProxySwitchedDate;
  if (v5)
    objc_storeStrong((id *)(v5 + 296), lastFallbackProxySwitchedDate);

  if (self)
  {
    v40 = self->_proxyTokenInfoArray;
    sub_10002315C(v5, v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));
    sub_10001EC38(v5, v41);

    path = self->_path;
  }
  else
  {
    sub_10002315C(v5, 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "tokenIssuanceRestrictedUntilDate"));
    sub_10001EC38(v5, v82);

    path = 0;
  }
  v43 = path;
  sub_10002316C(v5, v43);

  if (self)
  {
    v44 = self->_lastPathUnsatisfiedDate;
    sub_10002317C(v5, v44);

    lastPrimaryInterfaceChangedDate = self->_lastPrimaryInterfaceChangedDate;
  }
  else
  {
    sub_10002317C(v5, 0);
    lastPrimaryInterfaceChangedDate = 0;
  }
  v46 = lastPrimaryInterfaceChangedDate;
  sub_10002318C(v5, v46);

  if (self)
  {
    v47 = self->_probeStartTime;
    sub_10002319C(v5, v47);

    probeEndTime = self->_probeEndTime;
  }
  else
  {
    sub_10002319C(v5, 0);
    probeEndTime = 0;
  }
  v49 = probeEndTime;
  if (v5)
    objc_storeStrong((id *)(v5 + 280), probeEndTime);

  if (self)
  {
    v50 = self->_networkCharacteristics;
    sub_1000231AC(v5, v50);

    useDefaultInterface = self->_useDefaultInterface;
    if (!v5)
      goto LABEL_37;
    goto LABEL_36;
  }
  sub_1000231AC(v5, 0);
  useDefaultInterface = 0;
  if (v5)
LABEL_36:
    *(_BYTE *)(v5 + 12) = useDefaultInterface;
LABEL_37:
  if (self)
  {
    subscriber = self->_subscriber;
    if (!v5)
      goto LABEL_40;
    goto LABEL_39;
  }
  subscriber = 0;
  if (v5)
LABEL_39:
    *(_BYTE *)(v5 + 13) = subscriber;
LABEL_40:
  if (self)
  {
    unlimited = self->_unlimited;
    if (!v5)
      goto LABEL_43;
    goto LABEL_42;
  }
  unlimited = 0;
  if (v5)
LABEL_42:
    *(_BYTE *)(v5 + 14) = unlimited;
LABEL_43:
  if (self)
  {
    geohashSharingEnabled = self->_geohashSharingEnabled;
    if (!v5)
      goto LABEL_46;
    goto LABEL_45;
  }
  geohashSharingEnabled = 0;
  if (v5)
LABEL_45:
    *(_BYTE *)(v5 + 15) = geohashSharingEnabled;
LABEL_46:
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager geohashOverride](self, "geohashOverride"));
  objc_msgSend((id)v5, "setGeohashOverride:", v55);

  objc_msgSend((id)v5, "setDnsFilteringHintEnabled:", -[NSPPrivacyProxyAgentManager dnsFilteringHintEnabled](self, "dnsFilteringHintEnabled"));
  if (self)
  {
    proxyConnectivityCheckActive = self->_proxyConnectivityCheckActive;
    if (!v5)
      goto LABEL_49;
    goto LABEL_48;
  }
  proxyConnectivityCheckActive = 0;
  if (v5)
LABEL_48:
    *(_BYTE *)(v5 + 16) = proxyConnectivityCheckActive;
LABEL_49:
  if (self)
  {
    tokenFetchSuccessCount = self->_tokenFetchSuccessCount;
    if (!v5)
      goto LABEL_52;
    goto LABEL_51;
  }
  tokenFetchSuccessCount = 0;
  if (v5)
LABEL_51:
    *(_QWORD *)(v5 + 416) = tokenFetchSuccessCount;
LABEL_52:
  if (self)
  {
    tokenFetchFailedCount = self->_tokenFetchFailedCount;
    if (!v5)
      goto LABEL_55;
    goto LABEL_54;
  }
  tokenFetchFailedCount = 0;
  if (v5)
LABEL_54:
    *(_QWORD *)(v5 + 424) = tokenFetchFailedCount;
LABEL_55:
  if (self)
  {
    tokenConsumedCount = self->_tokenConsumedCount;
    if (!v5)
      goto LABEL_58;
    goto LABEL_57;
  }
  tokenConsumedCount = 0;
  if (v5)
LABEL_57:
    *(_QWORD *)(v5 + 432) = tokenConsumedCount;
LABEL_58:
  if (self)
  {
    tokenExpiredCount = self->_tokenExpiredCount;
    if (!v5)
      goto LABEL_61;
    goto LABEL_60;
  }
  tokenExpiredCount = 0;
  if (v5)
LABEL_60:
    *(_QWORD *)(v5 + 440) = tokenExpiredCount;
LABEL_61:
  if (self)
  {
    agentLowWaterMarkHitCount = self->_agentLowWaterMarkHitCount;
    if (!v5)
      goto LABEL_64;
    goto LABEL_63;
  }
  agentLowWaterMarkHitCount = 0;
  if (v5)
LABEL_63:
    *(_QWORD *)(v5 + 448) = agentLowWaterMarkHitCount;
LABEL_64:
  if (self)
  {
    cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    if (!v5)
      goto LABEL_67;
    goto LABEL_66;
  }
  cacheLowWaterMarkHitCount = 0;
  if (v5)
LABEL_66:
    *(_QWORD *)(v5 + 456) = cacheLowWaterMarkHitCount;
LABEL_67:
  if (self)
  {
    networkProxiesRotated = self->_networkProxiesRotated;
    if (!v5)
      goto LABEL_70;
    goto LABEL_69;
  }
  networkProxiesRotated = 0;
  if (v5)
LABEL_69:
    *(_QWORD *)(v5 + 480) = networkProxiesRotated;
LABEL_70:
  if (self)
  {
    networkFallbackProxiesRotated = self->_networkFallbackProxiesRotated;
    if (!v5)
      goto LABEL_73;
    goto LABEL_72;
  }
  networkFallbackProxiesRotated = 0;
  if (v5)
LABEL_72:
    *(_QWORD *)(v5 + 488) = networkFallbackProxiesRotated;
LABEL_73:
  if (self)
  {
    proxiesRotated = self->_proxiesRotated;
    if (!v5)
      goto LABEL_76;
    goto LABEL_75;
  }
  proxiesRotated = 0;
  if (v5)
LABEL_75:
    *(_QWORD *)(v5 + 496) = proxiesRotated;
LABEL_76:
  if (self)
  {
    generation = self->_generation;
    if (!v5)
      goto LABEL_79;
    goto LABEL_78;
  }
  generation = 0;
  if (v5)
LABEL_78:
    *(_QWORD *)(v5 + 544) = generation;
LABEL_79:
  if (self)
  {
    v67 = self->_proxyPathProber;
    sub_1000231BC(v5, v67);

    directPathProber = self->_directPathProber;
  }
  else
  {
    sub_1000231BC(v5, 0);
    directPathProber = 0;
  }
  v69 = directPathProber;
  if (v5)
    objc_storeStrong((id *)(v5 + 248), directPathProber);

  if (self)
  {
    v70 = self->_pvdConfigurationFetcher;
    sub_1000231CC(v5, v70);

    lastProxyOutageReasonStats = self->_lastProxyOutageReasonStats;
  }
  else
  {
    sub_1000231CC(v5, 0);
    lastProxyOutageReasonStats = 0;
  }
  v72 = lastProxyOutageReasonStats;
  if (v5)
    objc_storeStrong((id *)(v5 + 504), lastProxyOutageReasonStats);

  if (self)
  {
    v73 = self->_lastTokenOutageReasonStats;
    sub_1000231DC(v5, v73);

    probingReason = self->_probingReason;
    if (!v5)
      goto LABEL_90;
    goto LABEL_89;
  }
  sub_1000231DC(v5, 0);
  probingReason = 0;
  if (v5)
LABEL_89:
    *(_QWORD *)(v5 + 520) = probingReason;
LABEL_90:
  if (self)
  {
    reportedTokenOutage = self->_reportedTokenOutage;
    if (!v5)
      goto LABEL_93;
    goto LABEL_92;
  }
  reportedTokenOutage = 0;
  if (v5)
LABEL_92:
    *(_BYTE *)(v5 + 17) = reportedTokenOutage;
LABEL_93:
  if (self)
  {
    v76 = self->_configEpoch;
    sub_1000231EC(v5, v76);

    reportedEpoch = self->_reportedEpoch;
  }
  else
  {
    sub_1000231EC(v5, 0);
    reportedEpoch = 0;
  }
  v78 = reportedEpoch;
  sub_1000231FC(v5, v78);

  v79 = (id)v5;
  return v79;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  NSObject *tokenIssuanceRestrictedUntilTimer;
  NSObject *proxyPathRestoreTimer;
  NSObject *replenishTokenTimer;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  id v24;
  id v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  NSPPrivacyProxyAgentManager *v29;

  v4 = nplog_obj(self, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dealloc: \nProxy Agent Manager: %@", buf, 0xCu);
  }

  if (self)
  {
    tokenIssuanceRestrictedUntilTimer = self->_tokenIssuanceRestrictedUntilTimer;
    if (tokenIssuanceRestrictedUntilTimer)
    {
      dispatch_source_cancel(tokenIssuanceRestrictedUntilTimer);
      sub_100023568((uint64_t)self);
    }
    proxyPathRestoreTimer = self->_proxyPathRestoreTimer;
    if (proxyPathRestoreTimer)
    {
      dispatch_source_cancel(proxyPathRestoreTimer);
      objc_storeStrong((id *)&self->_proxyPathRestoreTimer, 0);
    }
    replenishTokenTimer = self->_replenishTokenTimer;
    if (replenishTokenTimer)
    {
      dispatch_source_cancel(replenishTokenTimer);
      objc_storeStrong((id *)&self->_replenishTokenTimer, 0);
    }
  }
  +[NSPPrivacyProxyAgentManager removeProxyInfoFromKeychain](NSPPrivacyProxyAgentManager, "removeProxyInfoFromKeychain");
  objc_opt_self(NSPPrivacyProxyAgentManager);
  _CFPreferencesSetFileProtectionClass(kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost, 0, 3);
  CFPreferencesSetAppValue(CFSTR("NSPProxyAgentManagerPreferences"), 0, kCFPreferencesCurrentApplication);
  v9 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  v10 = v9;
  v13 = nplog_obj(v9, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v10)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removed proxy agent info from preference file", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to remove proxy agent data from preference file", buf, 2u);
  }

  v16 = objc_opt_self(NSPPrivacyProxyAgentManager);
  v19 = nplog_obj(v16, v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "remove userevent agent data", buf, 2u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
  objc_msgSend(v21, "setAuxiliaryData:forKey:", CFSTR("NIL"), CFSTR("NSPProxyAgentManagerAuxilaryData"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
  objc_msgSend(v22, "commit");

  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "multiHopProxyAgentRegistered:", 0);

    v24 = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    objc_msgSend(0, "multiHopProxyAgentRegistered:", 0);
    v24 = 0;
  }
  objc_msgSend(v24, "singleHopProxyAgentRegistered:", 0);

  if (self)
  {
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "multiHopFallbackProxyAgentRegistered:", 0);

    v26 = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    objc_msgSend(0, "multiHopFallbackProxyAgentRegistered:", 0);
    v26 = 0;
  }
  objc_msgSend(v26, "singleHopFallbackProxyAgentRegistered:", 0);

  if (self)
    ++self->_generation;
  +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-path-changed"));
  v27.receiver = self;
  v27.super_class = (Class)NSPPrivacyProxyAgentManager;
  -[NSPPrivacyProxyAgentManager dealloc](&v27, "dealloc");
}

- (id)copyDomainFiltersDictionary
{
  id v3;
  NSMutableDictionary *candidatePreferredQUICProxyPaths;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (self)
    candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
  else
    candidatePreferredQUICProxyPaths = 0;
  v5 = candidatePreferredQUICProxyPaths;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9);
        if (self)
          v11 = self->_candidatePreferredQUICProxyPaths;
        else
          v11 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9), (_QWORD)v17));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domainFilter"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domainFilter"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v10);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 = v15;
    }
    while (v15);
  }

  return v3;
}

- (NSPPrivacyProxyAgentManager)initWithDelegate:(id)a3 toggleStats:(id)a4
{
  id v6;
  id v7;
  NSPPrivacyProxyAgentManager *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSPPrivacyProxyAgentManager *v18;
  uint64_t v19;
  uint64_t v20;
  NSPProber *proxyPathProber;
  NSPProber *directPathProber;
  NSMutableDictionary *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSPPrivacyProxyAgentManager *v46;
  NSArray *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *k;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  NSMutableArray *v65;
  NSMutableArray *proxyTokenInfoArray;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  NSMutableDictionary *v70;
  NSMutableDictionary *savedConfiguredProxies;
  void *v72;
  uint64_t v73;
  NSMutableArray *v74;
  NSMutableArray *savedConfiguredPreferredPaths;
  id v76;
  uint64_t v77;
  id v78;
  NSPPrivacyProxyAgentManager *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  uint64_t v89;
  NSMutableArray *v90;
  NSPPrivacyProxyAgentManager *v91;
  NSMutableArray *overrideEnabledMaps;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  NSPPrivacyProxyAgentManager *v96;
  NSString *v97;
  NSString *overridePreferredProxy;
  NSString *v99;
  NSString *overridePreferredObliviousProxy;
  NSString *v101;
  NSString *overrideIngressProxy;
  NSString *v103;
  NSString *overrideFallbackIngressProxy;
  NSData *v105;
  NSData *overrideIngressProxyKey;
  id v107;
  NSMutableArray *v108;
  NSMutableArray *v109;
  unsigned __int8 v110;
  void *v111;
  uint64_t v112;
  unsigned __int8 v113;
  void *v114;
  uint64_t v115;
  void *v117;
  NSObject *v118;
  void *v119;
  NSObject *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id obj;
  uint64_t v127;
  id v128;
  uint64_t v129;
  void *v130;
  void *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  id v140;
  objc_super v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  uint8_t v151[128];
  uint8_t buf[4];
  void *v153;
  uint8_t v154[128];
  uint8_t v155[4];
  NSObject *v156;

  v6 = a3;
  v7 = a4;
  v141.receiver = self;
  v141.super_class = (Class)NSPPrivacyProxyAgentManager;
  v8 = -[NSPPrivacyProxyAgentManager init](&v141, "init");
  if (!v8)
    goto LABEL_114;
  objc_opt_self(NSPPrivacyProxyAgentManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
  v10 = objc_msgSend(v9, "copyAuxiliaryDataForKey:", CFSTR("NSPProxyAgentManagerAuxilaryData"));

  v11 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = 0;
  else
    v12 = v10;

  objc_storeStrong((id *)&v8->_toggleStats, a4);
  if (!v12)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v65 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    proxyTokenInfoArray = v8->_proxyTokenInfoArray;
    v8->_proxyTokenInfoArray = v65;

    v8->_proxyPathRestoreIntervalSec = (unint64_t)sub_10002357C((uint64_t)NSPPrivacyProxyAgentManager);
    v67 = sub_100023FC0((uint64_t)NSPPrivacyProxyAgentManager);
    v37 = v67;
    if (v67)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v67, "objectForKeyedSubscript:", CFSTR("ConfiguredProxies")));
      if (v68)
      {
        v69 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v68, v69) & 1) != 0)
        {
          v70 = (NSMutableDictionary *)objc_msgSend(v68, "mutableCopy");
          savedConfiguredProxies = v8->_savedConfiguredProxies;
          v8->_savedConfiguredProxies = v70;

        }
      }
      v124 = v6;
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", CFSTR("PreferredPaths")));
      if (v72)
      {
        v73 = objc_opt_class(NSArray);
        if ((objc_opt_isKindOfClass(v72, v73) & 1) != 0)
        {
          v74 = (NSMutableArray *)objc_msgSend(v72, "mutableCopy");
          savedConfiguredPreferredPaths = v8->_savedConfiguredPreferredPaths;
          v8->_savedConfiguredPreferredPaths = v74;

        }
      }
      v76 = sub_100023690();
      v122 = v7;
      if (v76
        || (v76 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", CFSTR("OverridePreferredProxy")))) != 0)
      {
        v77 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v76, v77) & 1) != 0)
          objc_storeStrong((id *)&v8->_overridePreferredProxy, v76);
      }
      v78 = sub_100023784();
      v79 = v8;
      if (v78
        || (v78 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", CFSTR("OverridePreferredObliviousProxy")))) != 0)
      {
        v80 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v78, v80) & 1) != 0)
          objc_storeStrong((id *)&v8->_overridePreferredObliviousProxy, v78);
      }
      v81 = sub_100023878();
      v131 = v68;
      if (v81
        || (v81 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", CFSTR("OverrideIngressProxy")))) != 0)
      {
        v82 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v81, v82) & 1) != 0)
          objc_storeStrong((id *)&v79->_overrideIngressProxy, v81);
      }
      v83 = sub_10002396C();
      if (v83
        || (v83 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", CFSTR("OverrideFallbackIngressProxy")))) != 0)
      {
        v84 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v83, v84) & 1) != 0)
          objc_storeStrong((id *)&v79->_overrideFallbackIngressProxy, v83);
      }
      v85 = sub_100023A60();
      if (v85
        || (v85 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", CFSTR("OverrideIngressProxyKey")))) != 0)
      {
        v86 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v85, v86) & 1) != 0)
          objc_storeStrong((id *)&v79->_overrideIngressProxyKey, v85);
      }
      v87 = sub_100023B54();
      v88 = v37;
      if ((v87
         || (v87 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", CFSTR("OverrideEnabledMaps")))) != 0)&& (v89 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v87, v89) & 1) != 0))
      {
        v90 = (NSMutableArray *)objc_msgSend(v87, "mutableCopy");
        v91 = v79;
        overrideEnabledMaps = v79->_overrideEnabledMaps;
        v79->_overrideEnabledMaps = v90;

      }
      else
      {
        v91 = v79;
      }
      v110 = sub_100023C48();
      v91->_disableProxiedContentDoHBootstrap = v110;
      if ((v110 & 1) == 0)
      {
        v111 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("DisableProxiedContentDoHBootstrap")));
        if (v111)
        {
          v112 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v111, v112) & 1) != 0)
            v79->_disableProxiedContentDoHBootstrap = objc_msgSend(v111, "BOOLValue");
        }

      }
      v113 = sub_100023D48();
      v79->_forceFallback = v113;
      v37 = v88;
      if ((v113 & 1) == 0)
      {
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("ForceFallback")));
        if (v114)
        {
          v115 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v114, v115) & 1) != 0)
            v79->_forceFallback = objc_msgSend(v114, "BOOLValue");
        }

        v37 = v88;
      }

      v7 = v122;
      v6 = v124;
      v8 = v79;
      v12 = 0;
    }
    else
    {
      v97 = (NSString *)sub_100023690();
      overridePreferredProxy = v8->_overridePreferredProxy;
      v8->_overridePreferredProxy = v97;

      v99 = (NSString *)sub_100023784();
      overridePreferredObliviousProxy = v8->_overridePreferredObliviousProxy;
      v8->_overridePreferredObliviousProxy = v99;

      v101 = (NSString *)sub_100023878();
      overrideIngressProxy = v8->_overrideIngressProxy;
      v8->_overrideIngressProxy = v101;

      v103 = (NSString *)sub_10002396C();
      overrideFallbackIngressProxy = v8->_overrideFallbackIngressProxy;
      v8->_overrideFallbackIngressProxy = v103;

      v105 = (NSData *)sub_100023A60();
      overrideIngressProxyKey = v8->_overrideIngressProxyKey;
      v8->_overrideIngressProxyKey = v105;

      v107 = sub_100023B54();
      v108 = (NSMutableArray *)objc_msgSend(v107, "mutableCopy");
      v109 = v8->_overrideEnabledMaps;
      v8->_overrideEnabledMaps = v108;

      v8->_disableProxiedContentDoHBootstrap = sub_100023C48();
      v8->_forceFallback = sub_100023D48();
    }
    goto LABEL_113;
  }
  v140 = 0;
  v13 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v12, &v140);
  v14 = v140;
  v17 = v14;
  if (v13)
  {
    v18 = -[NSPPrivacyProxyAgentManager initWithCoder:](v8, "initWithCoder:", v13);
    if (v18)
    {
      v8 = v18;
      objc_storeWeak((id *)&v18->_delegate, v6);
      -[NSPProxyPath setDelegate:](v8->_quicProxyPath, "setDelegate:", v8);
      -[NSPProxyPath setDelegate:](v8->_fallbackProxyPath, "setDelegate:", v8);
      -[NSPQuicProxyPath setQuicProxyPathDelegate:](v8->_quicProxyPath, "setQuicProxyPathDelegate:", v8);
      proxyPathProber = v8->_proxyPathProber;
      if (proxyPathProber)
        objc_storeWeak((id *)&proxyPathProber->_delegate, v8);
      v119 = v13;
      v120 = v17;
      directPathProber = v8->_directPathProber;
      if (directPathProber)
        objc_storeWeak((id *)&directPathProber->_delegate, v8);
      v125 = v12;
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      v23 = v8->_preferredQUICProxyPaths;
      v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v137;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v137 != v26)
              objc_enumerationMutation(v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_preferredQUICProxyPaths, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)i)));
            objc_msgSend(v28, "setDelegate:", v8);
            objc_msgSend(v28, "setQuicProxyPathDelegate:", v8);

          }
          v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
        }
        while (v25);
      }

      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v29 = v8->_obliviousPaths;
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v133;
        do
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(_QWORD *)v133 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v34, "setDelegate:", v8);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fallbackAgentUUID"));

            if (v35)
              objc_msgSend(v34, "resetFallbackProxyAgent");
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "quicAgentUUID"));

            if (v36)
              objc_msgSend(v34, "resetQUICProxyAgentForceUpdateDelegate:", 0);
          }
          v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
        }
        while (v31);
      }

      v8->_proxyPathRestoreIntervalSec = (unint64_t)sub_10002357C((uint64_t)NSPPrivacyProxyAgentManager);
      v12 = v125;
      v37 = v120;
      if (v8->_candidatePreferredQUICProxyPaths)
      {
        v38 = sub_100023FC0((uint64_t)NSPPrivacyProxyAgentManager);
        v39 = v38;
        if (v38)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", CFSTR("PreferredPaths")));
          if (v40)
          {
            v41 = objc_opt_class(NSArray);
            if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
            {
              v117 = v40;
              v118 = v39;
              v121 = v7;
              v123 = v6;
              v148 = 0u;
              v149 = 0u;
              v146 = 0u;
              v147 = 0u;
              obj = v40;
              v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
              if (v128)
              {
                v127 = *(_QWORD *)v147;
                do
                {
                  v42 = 0;
                  do
                  {
                    if (*(_QWORD *)v147 != v127)
                      objc_enumerationMutation(obj);
                    v129 = v42;
                    v43 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v42);
                    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("Vendor"), v117, v118, v119));
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("PreferredPathConfigURL")));
                    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("DomainFilter")));
                    v142 = 0u;
                    v143 = 0u;
                    v144 = 0u;
                    v145 = 0u;
                    v46 = v8;
                    v47 = v8->_proxyArray;
                    v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v142, v154, 16);
                    if (v48)
                    {
                      v49 = v48;
                      v50 = *(_QWORD *)v143;
                      do
                      {
                        for (k = 0; k != v49; k = (char *)k + 1)
                        {
                          if (*(_QWORD *)v143 != v50)
                            objc_enumerationMutation(v47);
                          v52 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)k);
                          if (objc_msgSend(v52, "hasPreferredPathConfigUri"))
                          {
                            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "preferredPathConfigUri"));
                            v54 = objc_msgSend(v53, "isEqualToString:", v45);

                            if (v54)
                            {
                              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "vendor"));
                              v56 = v55;
                              if (v55 && objc_msgSend(v55, "isEqualToString:", v44))
                              {
                                v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v46->_candidatePreferredQUICProxyPaths, "objectForKeyedSubscript:", v56));
                                v58 = v57;
                                if (v57)
                                {
                                  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "domainFilter"));

                                  if (!v59)
                                  {
                                    v60 = objc_msgSend(v58, "setDomainFilter:", v130);
                                    v63 = nplog_obj(v60, v61, v62);
                                    v64 = objc_claimAutoreleasedReturnValue(v63);
                                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)buf = 138412290;
                                      v153 = v56;
                                      _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Filled in domain filter for %@", buf, 0xCu);
                                    }

                                  }
                                }

                              }
                            }
                          }
                        }
                        v49 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v142, v154, 16);
                      }
                      while (v49);
                    }

                    v42 = v129 + 1;
                    v8 = v46;
                  }
                  while ((id)(v129 + 1) != v128);
                  v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
                }
                while (v128);
              }

              v7 = v121;
              v6 = v123;
              v12 = v125;
              v37 = v120;
              v40 = v117;
              v39 = v118;
            }
          }

        }
      }

LABEL_113:
LABEL_114:
      v8 = v8;
      v96 = v8;
      goto LABEL_115;
    }
    v95 = nplog_obj(0, v19, v20);
    v94 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v155 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "Failed to decode the NSP proxy token info from the keychain", v155, 2u);
    }
    v8 = 0;
  }
  else
  {
    v93 = nplog_obj(v14, v15, v16);
    v94 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v155 = 138412290;
      v156 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP proxy agent manager: %@", v155, 0xCu);
    }
  }

  v96 = 0;
LABEL_115:

  return v96;
}

- (void)setupWithPath:(id)a3 subscriber:(BOOL)a4 unlimited:(BOOL)a5 geohashSharingEnabled:(BOOL)a6 geohashOverride:(id)a7 configEpoch:(id)a8 linkQuality:(int)a9
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *proxyPathRestoreTimer;
  OS_dispatch_source *v24;
  unint64_t proxyPathRestoreIntervalSec;
  uint64_t v26;
  NSObject *v27;
  OS_dispatch_source *v28;
  OS_dispatch_source *v29;
  OS_dispatch_source *v30;
  uint64_t v31;
  NSObject *v32;
  dispatch_time_t v33;
  OS_dispatch_source *v34;
  NSObject *v35;
  NSMutableArray *proxyTokenInfoArray;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  uint64_t v41;
  NSPQuicProxyPath *quicProxyPath;
  NSMutableDictionary *preferredQUICProxyPaths;
  NSMutableDictionary *v44;
  id v45;
  uint64_t v46;
  void *v47;
  NSMutableDictionary *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *j;
  _BOOL4 v55;
  _BOOL4 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD block[6];
  void **handler;
  uint64_t p_handler;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  id location;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];

  v55 = a6;
  v56 = a4;
  v11 = a5;
  v13 = a3;
  v14 = a7;
  v15 = a8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));
    objc_msgSend(v17, "timeIntervalSinceNow");
    v19 = v18;

    if (v19 <= 0.0)
    {
      handler = 0;
      p_handler = (uint64_t)&handler;
      v72 = 0x3032000000;
      v73 = sub_1000030EC;
      v74 = sub_10000C20C;
      v75 = (id)os_transaction_create("com.apple.networkserviceproxy.tokenIssuanceTimerReached");
      sub_10001EC38((uint64_t)self, 0);
      v21 = NPGetInternalQueue(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000254A0;
      block[3] = &unk_1000F5428;
      block[4] = self;
      block[5] = &handler;
      dispatch_async(v22, block);

      _Block_object_dispose(&handler, 8);
    }
    else
    {
      sub_10002531C((uint64_t)self, (unint64_t)v19);
    }
  }
  -[NSPPrivacyProxyAgentManager handleUnlimitedChange:](self, "handleUnlimitedChange:", v11);
  if (self)
  {
    proxyPathRestoreTimer = self->_proxyPathRestoreTimer;
    if (proxyPathRestoreTimer)
    {
      dispatch_source_cancel(proxyPathRestoreTimer);
      v24 = self->_proxyPathRestoreTimer;
      self->_proxyPathRestoreTimer = 0;

    }
    proxyPathRestoreIntervalSec = self->_proxyPathRestoreIntervalSec;
    v26 = NPGetInternalQueue(proxyPathRestoreTimer);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v27);
    v29 = self->_proxyPathRestoreTimer;
    self->_proxyPathRestoreTimer = v28;

    v30 = self->_proxyPathRestoreTimer;
    if (v30)
    {
      if (proxyPathRestoreIntervalSec)
        v31 = 1000000000 * proxyPathRestoreIntervalSec;
      else
        v31 = 1800000000000;
      v32 = v30;
      v33 = dispatch_time(0x8000000000000000, v31);
      dispatch_source_set_timer(v32, v33, v31, 0);

      objc_initWeak(&location, self);
      v34 = self->_proxyPathRestoreTimer;
      handler = _NSConcreteStackBlock;
      p_handler = 3221225472;
      v72 = (uint64_t)sub_100028C34;
      v73 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F57C0;
      v35 = v34;
      objc_copyWeak((id *)&v74, &location);
      dispatch_source_set_event_handler(v35, &handler);

      dispatch_resume((dispatch_object_t)self->_proxyPathRestoreTimer);
      objc_destroyWeak((id *)&v74);
      objc_destroyWeak(&location);
    }
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else
  {
    proxyTokenInfoArray = 0;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v37 = -[NSMutableArray copy](proxyTokenInfoArray, "copy");
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v39)
          objc_enumerationMutation(v37);
        v41 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        if (v41)
          objc_storeWeak((id *)(v41 + 16), self);
        sub_10000BDEC(v41);
      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    }
    while (v38);
  }

  if (self)
  {
    sub_10001EE08((uint64_t)self->_proxyPathProber);
    sub_10001EE08((uint64_t)self->_directPathProber);
    -[NSPFallbackProxyPath resetSingleHopProxyAgent](self->_fallbackProxyPath, "resetSingleHopProxyAgent");
    -[NSPFallbackProxyPath resetMultiHopProxyAgent](self->_fallbackProxyPath, "resetMultiHopProxyAgent");
    -[NSPQuicProxyPath resetSingleHopProxyAgent](self->_quicProxyPath, "resetSingleHopProxyAgent");
    quicProxyPath = self->_quicProxyPath;
  }
  else
  {
    sub_10001EE08(0);
    objc_msgSend(0, "resetSingleHopProxyAgent");
    objc_msgSend(0, "resetMultiHopProxyAgent");
    objc_msgSend(0, "resetSingleHopProxyAgent");
    quicProxyPath = 0;
  }
  -[NSPQuicProxyPath resetMultiHopProxyAgent](quicProxyPath, "resetMultiHopProxyAgent");
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  if (self)
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
  else
    preferredQUICProxyPaths = 0;
  v44 = preferredQUICProxyPaths;
  v45 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v62;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v62 != v46)
          objc_enumerationMutation(v44);
        if (self)
          v48 = self->_preferredQUICProxyPaths;
        else
          v48 = 0;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v47)));
        objc_msgSend(v49, "resetMultiHopProxyAgent");

        v47 = (char *)v47 + 1;
      }
      while (v45 != v47);
      v50 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
      v45 = v50;
    }
    while (v50);
  }

  -[NSPPrivacyProxyAgentManager handlePathChange:](self, "handlePathChange:", v13);
  -[NSPPrivacyProxyAgentManager handleTierChange:](self, "handleTierChange:", v56);
  -[NSPPrivacyProxyAgentManager updateGeohashSharingPreference:geohashOverride:](self, "updateGeohashSharingPreference:geohashOverride:", v55, v14);
  -[NSPPrivacyProxyAgentManager updateConfigEpoch:](self, "updateConfigEpoch:", v15);
  -[NSPPrivacyProxyAgentManager handleLinkQualityChange:](self, "handleLinkQualityChange:", a9);
  if (self)
  {
    if (self->_candidateQuicProxyPath)
      sub_1000254F4((uint64_t)self, 0);
    if (self->_candidateFallbackProxyPath)
      sub_10002603C((id *)&self->super.isa, 0);
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v51 = v37;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(_QWORD *)v58 != v53)
          objc_enumerationMutation(v51);
        sub_10000E8D0(*(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j));
      }
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
    }
    while (v52);
  }

}

- (void)handlePathChange:(id)a3
{
  id v4;
  NWPath *path;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  NWPath *v13;
  id v14;
  void *v15;
  NSDictionary *networkCharacteristics;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id WeakRetained;
  NSMutableArray *proxyTokenInfoArray;
  void *i;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t *v43;
  NSMutableArray *obj;
  uint64_t v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[16];
  _BYTE v53[128];

  v4 = a3;
  if (self)
    path = self->_path;
  else
    path = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](path, "interface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interfaceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interfaceName"));
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    sub_10002318C((uint64_t)self, v11);

  }
  if (objc_msgSend(v4, "status") == (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    sub_10002317C((uint64_t)self, v12);

  }
  sub_10002316C((uint64_t)self, v4);
  if (self)
    v13 = self->_path;
  else
    v13 = 0;
  v14 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:](NPUtilities, "copyCurrentNetworkCharacteristicsForPath:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Signature")));
  if (self)
    networkCharacteristics = self->_networkCharacteristics;
  else
    networkCharacteristics = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](networkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature")));
  v18 = v15;
  v19 = v17;
  v20 = (void *)v19;
  if (!(v18 | v19) || v18 && v19 && objc_msgSend((id)v18, "isEqual:", v19))
  {

  }
  else
  {

    v24 = nplog_obj(v21, v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "proxy agent: network signature changed", buf, 2u);
    }

    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "networkSignatureChanged");

      -[NSPProxyPath handleNetworkCharacteristicsChange:](self->_quicProxyPath, "handleNetworkCharacteristicsChange:", v14);
      -[NSPProxyPath handleNetworkCharacteristicsChange:](self->_fallbackProxyPath, "handleNetworkCharacteristicsChange:", v14);
      -[NSPPrivacyProxyAgentManager resetProxyErrors](self, "resetProxyErrors");
      self->_networkProxiesRotated = 0;
      self->_networkFallbackProxiesRotated = 0;
      objc_storeStrong((id *)&self->_networkCharacteristics, v14);
      if (self->_probingReason == 2)
        sub_100026F10((uint64_t)self);
    }
    else
    {
      objc_msgSend(0, "networkSignatureChanged");
      objc_msgSend(0, "handleNetworkCharacteristicsChange:", v14);
      objc_msgSend(0, "handleNetworkCharacteristicsChange:", v14);
      objc_msgSend(0, "resetProxyErrors");
    }
    sub_100027130((uint64_t)self, 0);
    sub_100027140((uint64_t)self, v14);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v42 = v14;
  v43 = (uint64_t *)self;
  v41 = (void *)v18;
  if (self)
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  else
    proxyTokenInfoArray = 0;
  obj = proxyTokenInfoArray;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v45)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v30 = v4;
        if (v29)
        {
          objc_storeStrong((id *)(v29 + 56), a3);
          v31 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:](NPUtilities, "copyCurrentNetworkCharacteristicsForPath:", *(_QWORD *)(v29 + 56));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Signature")));
          v33 = *(id *)(v29 + 152);
          v34 = v32;
          v35 = (unint64_t)v33;
          v36 = (void *)v35;
          if (v34 | v35
            && (v34 ? (v37 = v35 == 0) : (v37 = 1), v37 || !objc_msgSend((id)v34, "isEqual:", v35)))
          {

            objc_storeStrong((id *)(v29 + 152), v32);
            if (objc_msgSend(*(id *)(v29 + 56), "status") == (id)1)
              sub_10000EB68(v29, v38, v39);
          }
          else
          {

          }
        }

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v47);
  }

  if (v43)
  {
    sub_100020434(v43[30], v4);
    v40 = v43[31];
  }
  else
  {
    sub_100020434(0, v4);
    v40 = 0;
  }
  sub_100020434(v40, v4);
  objc_msgSend(v43, "updateUserEventAgentData");

}

- (void)handleTierChange:(BOOL)a3
{
  _BOOL4 v3;
  NSPQuicProxyPath *v5;
  _BOOL8 v6;
  NSMutableArray *obliviousPaths;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _BOOL4 subscriber;
  id v14;
  NSMutableArray *proxyTokenInfoArray;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v3 = a3;
  if (self)
  {
    if (((self->_subscriber ^ a3) & 1) == 0)
      return;
    self->_subscriber = a3;
    -[NSPProxyPath enableFailOpen:](self->_fallbackProxyPath, "enableFailOpen:", !a3);
    v5 = self->_quicProxyPath;
    v6 = !self->_subscriber;
  }
  else
  {
    if (!a3)
      return;
    v6 = 1;
    objc_msgSend(0, "enableFailOpen:", 1);
    v5 = 0;
  }
  -[NSPProxyPath enableFailOpen:](v5, "enableFailOpen:", v6);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  if (self)
    obliviousPaths = self->_obliviousPaths;
  else
    obliviousPaths = 0;
  v8 = obliviousPaths;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        if (self)
          subscriber = self->_subscriber;
        else
          subscriber = 0;
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v12), "enableFailOpen:", !subscriber);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v10 = v14;
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  if (self)
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  else
    proxyTokenInfoArray = 0;
  v16 = proxyTokenInfoArray;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (v21)
        {
          if ((*(_BYTE *)(v21 + 11) != 0) != v3)
            *(_BYTE *)(v21 + 11) = v3;
        }
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData", (_QWORD)v22);
}

- (void)handleUnlimitedChange:(BOOL)a3
{
  if (self)
  {
    if (self->_unlimited != a3)
      self->_unlimited = a3;
  }
}

- (void)handleConfigChange
{
  NSPFallbackProxyPath *fallbackProxyPath;
  NSMutableArray *obliviousPaths;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self)
  {
    -[NSPProxyPath resetStats](self->_quicProxyPath, "resetStats");
    -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
    -[NSPProxyPath resetStats](self->_fallbackProxyPath, "resetStats");
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else
  {
    objc_msgSend(0, "resetStats");
    objc_msgSend(0, "resetError");
    objc_msgSend(0, "resetStats");
    fallbackProxyPath = 0;
  }
  -[NSPProxyPath resetError](fallbackProxyPath, "resetError");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  if (self)
    obliviousPaths = self->_obliviousPaths;
  else
    obliviousPaths = 0;
  v5 = obliviousPaths;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "resetStats", (_QWORD)v11);
        objc_msgSend(v10, "resetError");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
}

- (void)handleLinkQualityChange:(int)a3
{
  NSPProber *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSPProber *v9;
  NSPProber *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSPProber *v14;

  if (self)
  {
    if (self->_linkQuality == a3)
      return;
    self->_linkQuality = a3;
    v5 = self->_proxyPathProber;
    v9 = v5;
    if (v5 && v5->_linkQuality != a3)
    {
      v5->_linkQuality = a3;
      sub_10001EC48((uint64_t)v5, v6, v7, v8);
    }

    v10 = self->_directPathProber;
    v14 = v10;
    if (v10)
    {
      if (v10->_linkQuality != a3)
      {
        v10->_linkQuality = a3;
        sub_10001EC48((uint64_t)v10, v11, v12, v13);
      }
    }
LABEL_10:

    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    return;
  }
  if (a3)
  {
    v14 = 0;
    goto LABEL_10;
  }
}

- (void)resetProxyErrors
{
  NSPFallbackProxyPath *fallbackProxyPath;
  NSMutableArray *obliviousPaths;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self)
  {
    -[NSPProxyPath resetStats](self->_quicProxyPath, "resetStats");
    -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
    -[NSPProxyPath resetStats](self->_fallbackProxyPath, "resetStats");
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else
  {
    objc_msgSend(0, "resetStats");
    objc_msgSend(0, "resetError");
    objc_msgSend(0, "resetStats");
    fallbackProxyPath = 0;
  }
  -[NSPProxyPath resetError](fallbackProxyPath, "resetError");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  if (self)
    obliviousPaths = self->_obliviousPaths;
  else
    obliviousPaths = 0;
  v5 = obliviousPaths;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "resetStats", (_QWORD)v11);
        objc_msgSend(v10, "resetError");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
}

- (void)useDefaultNetworkInterface:(BOOL)a3
{
  NSMutableArray *proxyTokenInfoArray;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self)
  {
    if (self->_useDefaultInterface == a3)
      return;
    self->_useDefaultInterface = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else
  {
    if (!a3)
      return;
    proxyTokenInfoArray = 0;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
  }
  v5 = proxyTokenInfoArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
        if (v10)
          *(_BYTE *)(v10 + 10) = a3;
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

+ (void)removeProxyInfoFromKeychain
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = nplog_obj(a1, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing proxy info keychain", v5, 2u);
  }

  +[NPUtilities removeDataFromKeychainWithIdentifier:](NPUtilities, "removeDataFromKeychainWithIdentifier:", CFSTR("com.apple.NetworkServiceProxy.ProxyToken"));
}

- (void)tearDownNetworkDiscoveredProxy
{
  NSPPrivacyProxyAgentManager *v2;
  NSMutableDictionary *networkSpecificQUICProxyPaths;
  NSMutableDictionary *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSMutableDictionary *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];

  v2 = self;
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_networkSpecificQUICProxyPaths;
  if (-[NSPPrivacyProxyAgentManager count](self, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    if (v2)
      networkSpecificQUICProxyPaths = v2->_networkSpecificQUICProxyPaths;
    else
      networkSpecificQUICProxyPaths = 0;
    v4 = networkSpecificQUICProxyPaths;
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v25;
      *(_QWORD *)&v6 = 138412290;
      v23 = v6;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v4);
          if (v2)
            v10 = v2->_networkSpecificQUICProxyPaths;
          else
            v10 = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v9), v23, (_QWORD)v24));
          v14 = nplog_obj(v11, v12, v13);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ingressProxy"));
            v17 = (void *)v16;
            if (v16)
              v18 = *(void **)(v16 + 24);
            else
              v18 = 0;
            v19 = v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "vendor"));
            *(_DWORD *)buf = v23;
            v29 = v20;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tearing down existing network discovered proxy: %@", buf, 0xCu);

          }
          objc_msgSend(v11, "tearDownMultiHopRegistration");
          -[NSPPrivacyProxyAgentManager multiHopAgentUnregistered:](v2, "multiHopAgentUnregistered:", v11);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        v7 = v21;
      }
      while (v21);
    }

    if (v2)
      v22 = v2->_networkSpecificQUICProxyPaths;
    else
      v22 = 0;
    -[NSMutableDictionary removeAllObjects](v22, "removeAllObjects");
  }
}

- (BOOL)deferCommit
{
  if (self)
    LOBYTE(self) = self->_deferAgentCommit;
  return (char)self;
}

- (void)updateProxyInfo:(id)a3 resolverInfo:(id)a4 proxyPathList:(id)a5 fallbackProxyPathList:(id)a6 obliviousConfigs:(id)a7 proxiedContentMaps:(id)a8
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *obliviousConfigs;
  void *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  char *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  void *v56;
  char v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  __int128 *p_block;
  uint64_t v69;
  uint64_t v70;
  id v71;
  NSPFallbackProxyPath *v72;
  NSArray *v73;
  NSArray *fallbackProxyPathList;
  NSArray *v75;
  unsigned __int8 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSPFallbackProxyPath *fallbackProxyPath;
  uint64_t v81;
  NSObject *v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id v88;
  char *v89;
  NSPFallbackProxyPath *v90;
  NSPFallbackProxyPath *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  BOOL v99;
  NSPPrivacyProxyAgentManager *v100;
  NSPQuicProxyPath *v101;
  NSArray *v102;
  NSArray *proxyPathList;
  NSArray *v104;
  unsigned __int8 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSPQuicProxyPath *quicProxyPath;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  id v113;
  uint64_t v114;
  void *v115;
  void *v116;
  id v117;
  char *v118;
  NSPQuicProxyPath *v119;
  NSPQuicProxyPath *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *candidateQuicProxyPath;
  id v127;
  BOOL v128;
  NSPCandidateQuicProxyPath *v129;
  NSArray *v130;
  NSArray *v131;
  NSArray *v132;
  unsigned __int8 v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  void *v139;
  id v140;
  uint64_t v141;
  void *v142;
  void *v143;
  id v144;
  char *v145;
  NSPCandidateQuicProxyPath *v146;
  NSPCandidateQuicProxyPath *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *candidateFallbackProxyPath;
  id v154;
  BOOL v155;
  NSPCandidateFallbackProxyPath *v156;
  NSArray *v157;
  NSArray *v158;
  NSArray *v159;
  unsigned __int8 v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSObject *v165;
  void *v166;
  id v167;
  uint64_t v168;
  void *v169;
  void *v170;
  id v171;
  char *v172;
  NSPCandidateFallbackProxyPath *v173;
  NSPCandidateFallbackProxyPath *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  void *preferredQUICProxyPaths;
  id v181;
  id v182;
  uint64_t v183;
  void *v184;
  NSMutableDictionary *v185;
  uint64_t v186;
  NSMutableDictionary *v187;
  void *v188;
  NSArray *v189;
  NSArray *v190;
  NSArray *v191;
  unsigned int v192;
  id v193;
  id v194;
  void *v195;
  void *v196;
  NSArray *v197;
  NSArray *v198;
  unsigned __int8 v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  void *v204;
  unint64_t WeakRetained;
  unint64_t v206;
  void *v207;
  void *v208;
  void *v209;
  unint64_t v210;
  unint64_t v211;
  void *v212;
  uint64_t v213;
  NSObject *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  id v223;
  void *v224;
  NSArray *v225;
  id v226;
  uint64_t v227;
  void *i;
  void *v229;
  NSArray *v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  NSArray *v235;
  void *v236;
  void *v237;
  uint64_t v238;
  NSObject *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  NSObject *v244;
  uint64_t v245;
  void *v246;
  void *v247;
  id v248;
  void *v249;
  uint64_t v250;
  void *v251;
  void *v252;
  id v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  BOOL v258;
  void *v259;
  BOOL v260;
  void *v261;
  void *v262;
  BOOL v263;
  void *v264;
  NSPProxyTokenInfo *v265;
  NSPProxyTokenInfo *v266;
  NSPCandidateQuicProxyPath *v267;
  unsigned int v268;
  void *v269;
  void *v270;
  NSMutableArray *v271;
  id v272;
  uint64_t v273;
  void *j;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  unsigned int v283;
  id *v284;
  void *v285;
  uint64_t v286;
  void *v287;
  void *v288;
  id v289;
  uint64_t v290;
  uint64_t v291;
  id v292;
  NSArray *v293;
  NSArray *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  NSObject *v299;
  uint64_t v300;
  void *v301;
  id v302;
  void *v303;
  uint64_t v304;
  void *v305;
  void *v306;
  id v307;
  void *v308;
  uint64_t v309;
  NSObject *v310;
  uint64_t v311;
  void *v312;
  void *v313;
  id v314;
  void *v315;
  uint64_t v316;
  void *v317;
  void *v318;
  id v319;
  void *v320;
  uint64_t v321;
  void *v322;
  void *v323;
  id v324;
  uint64_t v325;
  void *v326;
  void *v327;
  id v328;
  void *v329;
  void *v330;
  id v331;
  id v332;
  id v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  id v337;
  id v338;
  id v339;
  void *v340;
  id v341;
  void *v342;
  void *v343;
  void *v344;
  id v345;
  NSArray *v346;
  NSObject *v347;
  void *v348;
  NSPCandidateQuicProxyPath *v349;
  id *to;
  id *v351;
  id v352;
  void *v353;
  NSMutableArray *obj;
  id *obja;
  id v356;
  id v357;
  id v358;
  id v359;
  id *v360;
  uint64_t v361;
  id v362;
  uint64_t v363;
  id v364;
  NSPPrivacyProxyAgentManager *val;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  _QWORD v370[4];
  id v371;
  void *v372;
  id v373;
  _QWORD v374[4];
  id v375;
  _QWORD v376[4];
  id v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 block;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  uint8_t v394[128];
  uint8_t v395[4];
  void *v396;
  __int16 v397;
  void *v398;
  __int16 v399;
  void *v400;
  uint8_t v401[32];
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  uint8_t v408[128];
  uint8_t buf[4];
  const char *v410;
  __int16 v411;
  void *v412;

  v14 = a3;
  v337 = a4;
  v341 = a5;
  v338 = a6;
  v339 = a7;
  v15 = a8;
  v340 = v15;
  v342 = v14;
  if (!v14)
  {
    v334 = nplog_obj(v15, v16, v17);
    v35 = objc_claimAutoreleasedReturnValue(v334);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v410 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "%s called with null proxyInfoArray", buf, 0xCu);
    }
    goto LABEL_285;
  }
  v18 = objc_msgSend(v14, "count");
  if (!v18)
  {
    v335 = nplog_obj(0, v19, v20);
    v35 = objc_claimAutoreleasedReturnValue(v335);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v410 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "%s called with null (proxyInfoArray.count > 0)", buf, 0xCu);
    }
    goto LABEL_285;
  }
  if (!v341)
  {
    v336 = nplog_obj(v18, v19, v20);
    v35 = objc_claimAutoreleasedReturnValue(v336);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v410 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "%s called with null proxyPathList", buf, 0xCu);
    }
    goto LABEL_285;
  }
  sub_10002304C((uint64_t)self, v14);
  sub_10002305C((uint64_t)self, v337);
  sub_10002306C((uint64_t)self, v341);
  v21 = objc_msgSend(v341, "mutableCopy");
  sub_10002307C((uint64_t)self, v21);

  sub_10002308C((uint64_t)self, v338);
  v22 = objc_msgSend(v338, "mutableCopy");
  sub_10002309C((uint64_t)self, v22);

  sub_1000230AC((uint64_t)self, v339);
  sub_1000230BC((uint64_t)self, 0);
  val = self;
  sub_1000230CC((uint64_t)self, v340);
  v26 = nplog_obj(v23, v24, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    obliviousConfigs = (const char *)self;
    if (self)
      obliviousConfigs = (const char *)self->_obliviousConfigs;
    *(_DWORD *)buf = 138412290;
    v410 = obliviousConfigs;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "updateProxyInfo self.obliviousConfigs %@", buf, 0xCu);
  }

  if (self)
    self->_deferAgentCommit = 1;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));
  v30 = v29 == 0;

  if (!v30)
  {
    v34 = nplog_obj(v31, v32, v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate](self, "tokenIssuanceRestrictedUntilDate"));
      v37 = (char *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v36, 1, 2));
      *(_DWORD *)buf = 138412290;
      v410 = v37;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "deferring setting up of proxy agent until %@", buf, 0xCu);

    }
LABEL_285:

    goto LABEL_274;
  }
  v359 = v14;
  if (self)
  {
    v352 = objc_alloc_init((Class)NSMutableArray);
    v406 = 0u;
    v407 = 0u;
    v404 = 0u;
    v405 = 0u;
    obj = self->_proxyTokenInfoArray;
    v362 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v404, buf, 16);
    if (!v362)
      goto LABEL_57;
    v356 = *(id *)v405;
    while (1)
    {
      v38 = 0;
      do
      {
        if (*(id *)v405 != v356)
          objc_enumerationMutation(obj);
        v39 = *(_QWORD *)(*((_QWORD *)&v404 + 1) + 8 * (_QWORD)v38);
        memset(v401, 0, sizeof(v401));
        v402 = 0u;
        v403 = 0u;
        v40 = v359;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", v401, v408, 16);
        if (!v41)
          goto LABEL_32;
        v42 = **(_QWORD **)&v401[16];
        do
        {
          v43 = 0;
          do
          {
            if (**(_QWORD **)&v401[16] != v42)
              objc_enumerationMutation(v40);
            if (v39)
              v44 = *(void **)(v39 + 24);
            else
              v44 = 0;
            v45 = *(void **)(*(_QWORD *)&v401[8] + 8 * (_QWORD)v43);
            v46 = v44;
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "vendor"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "vendor"));

            LODWORD(v46) = objc_msgSend(v47, "isEqualToString:", v48);
            if ((_DWORD)v46)
            {
              if (v39)
                v50 = *(void **)(v39 + 24);
              else
                v50 = 0;
              v51 = v50;
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "tokenKeyInfo"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "tokenKeyInfo"));

              v54 = v52;
              v55 = v53;
              v56 = (void *)v55;
              if (!(v54 | v55) || (v57 = 1, v54) && v55 && objc_msgSend((id)v54, "isEqual:", v55))
                v57 = 0;

              if (v39)
                v58 = *(void **)(v39 + 24);
              else
                v58 = 0;
              v59 = v58;
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "tokenChallenge"));
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "tokenChallenge"));

              v62 = v60;
              v63 = v61;
              v64 = (void *)v63;
              if (!(v62 | v63) || v62 && v63 && objc_msgSend((id)v62, "isEqual:", v63))
              {

                sub_10000D344(v39, v45);
                if ((v57 & 1) != 0)
                {
                  v66 = NPGetInternalQueue(v65);
                  v67 = objc_claimAutoreleasedReturnValue(v66);
                  *(_QWORD *)&v386 = _NSConcreteStackBlock;
                  *((_QWORD *)&v386 + 1) = 3221225472;
                  *(_QWORD *)&v387 = sub_100020FEC;
                  *((_QWORD *)&v387 + 1) = &unk_1000F5A80;
                  *(_QWORD *)&v388 = v45;
                  *((_QWORD *)&v388 + 1) = v39;
                  p_block = &v386;
                  goto LABEL_50;
                }
              }
              else
              {

                sub_10000D344(v39, v45);
                v70 = NPGetInternalQueue(v69);
                v67 = objc_claimAutoreleasedReturnValue(v70);
                *(_QWORD *)&block = _NSConcreteStackBlock;
                *((_QWORD *)&block + 1) = 3221225472;
                *(_QWORD *)&v391 = sub_100020F10;
                *((_QWORD *)&v391 + 1) = &unk_1000F5A80;
                *(_QWORD *)&v392 = v45;
                *((_QWORD *)&v392 + 1) = v39;
                p_block = &block;
LABEL_50:
                dispatch_async(v67, p_block);

              }
              goto LABEL_52;
            }
            v43 = (char *)v43 + 1;
          }
          while (v41 != v43);
          v49 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", v401, v408, 16);
          v41 = v49;
        }
        while (v49);
LABEL_32:

        objc_msgSend(v352, "addObject:", v39);
LABEL_52:
        v38 = (char *)v38 + 1;
      }
      while (v38 != v362);
      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v404, buf, 16);
      v362 = v71;
      if (!v71)
      {
LABEL_57:

        -[NSMutableArray removeObjectsInArray:](val->_proxyTokenInfoArray, "removeObjectsInArray:", v352);
        v72 = val->_fallbackProxyPath;
        v73 = val->_proxyArray;
        fallbackProxyPathList = val->_fallbackProxyPathList;
        goto LABEL_58;
      }
    }
  }

  v73 = 0;
  v72 = 0;
  fallbackProxyPathList = 0;
LABEL_58:
  v75 = fallbackProxyPathList;
  v76 = -[NSPFallbackProxyPath proxyPathIsValid:proxyPathList:](v72, "proxyPathIsValid:proxyPathList:", v73, v75);

  if ((v76 & 1) != 0)
  {
    if (val)
    {
      -[NSPFallbackProxyPath resetSingleHopProxyAgent](val->_fallbackProxyPath, "resetSingleHopProxyAgent");
      fallbackProxyPath = val->_fallbackProxyPath;
    }
    else
    {
      objc_msgSend(0, "resetSingleHopProxyAgent");
      fallbackProxyPath = 0;
    }
    -[NSPFallbackProxyPath resetMultiHopProxyAgent](fallbackProxyPath, "resetMultiHopProxyAgent");
  }
  else
  {
    v81 = nplog_obj(v77, v78, v79);
    v82 = objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      v83 = val;
      if (val)
        v83 = val->_fallbackProxyPath;
      v84 = v83;
      v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "ingressProxy"));
      v86 = (void *)v85;
      if (v85)
        v87 = *(void **)(v85 + 24);
      else
        v87 = 0;
      v88 = v87;
      v89 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "tcpProxyFqdn"));
      if (val)
        v90 = val->_fallbackProxyPath;
      else
        v90 = 0;
      v91 = v90;
      v92 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v91, "egressProxy"));
      v93 = (void *)v92;
      if (v92)
        v94 = *(void **)(v92 + 24);
      else
        v94 = 0;
      v95 = v94;
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "tcpProxyFqdn"));
      *(_DWORD *)buf = 138412546;
      v410 = v89;
      v411 = 2112;
      v412 = v96;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Fallback proxy path (%@-%@) is not valid", buf, 0x16u);

    }
    v97 = sub_100028484((id *)&val->super.isa);
    v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
    v99 = v98 == 0;

    if (v99)
    {
      v100 = val;
      sub_10002311C((uint64_t)val, 0);
      if (val)
        goto LABEL_75;
      goto LABEL_276;
    }
    sub_10002603C((id *)&val->super.isa, 0);
  }
  v100 = val;
  if (val)
  {
LABEL_75:
    v101 = v100->_quicProxyPath;
    v102 = v100->_proxyArray;
    proxyPathList = v100->_proxyPathList;
    goto LABEL_76;
  }
LABEL_276:
  v102 = 0;
  v101 = 0;
  proxyPathList = 0;
LABEL_76:
  v104 = proxyPathList;
  v105 = -[NSPQuicProxyPath proxyPathIsValid:proxyPathList:](v101, "proxyPathIsValid:proxyPathList:", v102, v104);

  if ((v105 & 1) != 0)
  {
    if (val)
    {
      -[NSPQuicProxyPath resetSingleHopProxyAgent](val->_quicProxyPath, "resetSingleHopProxyAgent");
      quicProxyPath = val->_quicProxyPath;
    }
    else
    {
      objc_msgSend(0, "resetSingleHopProxyAgent");
      quicProxyPath = 0;
    }
    -[NSPQuicProxyPath resetMultiHopProxyAgent](quicProxyPath, "resetMultiHopProxyAgent");
  }
  else
  {
    v110 = nplog_obj(v106, v107, v108);
    v111 = objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v112 = val;
      if (val)
        v112 = val->_quicProxyPath;
      v113 = v112;
      v114 = objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "ingressProxy"));
      v115 = (void *)v114;
      if (v114)
        v116 = *(void **)(v114 + 24);
      else
        v116 = 0;
      v117 = v116;
      v118 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "vendor"));
      if (val)
        v119 = val->_quicProxyPath;
      else
        v119 = 0;
      v120 = v119;
      v121 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v120, "egressProxy"));
      v122 = (void *)v121;
      if (v121)
        v123 = *(void **)(v121 + 24);
      else
        v123 = 0;
      v124 = v123;
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "vendor"));
      *(_DWORD *)buf = 138412546;
      v410 = v118;
      v411 = 2112;
      v412 = v125;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Quic proxy path (%@-%@) is not valid", buf, 0x16u);

    }
    sub_1000254F4((uint64_t)val, 0);
  }
  candidateQuicProxyPath = val;
  if (val)
    candidateQuicProxyPath = val->_candidateQuicProxyPath;
  v127 = candidateQuicProxyPath;
  v128 = v127 == 0;

  if (!v128)
  {
    if (val)
    {
      v129 = val->_candidateQuicProxyPath;
      v130 = val->_proxyArray;
      v131 = val->_proxyPathList;
    }
    else
    {
      v130 = 0;
      v129 = 0;
      v131 = 0;
    }
    v132 = v131;
    v133 = -[NSPCandidateQuicProxyPath proxyPathIsValid:proxyPathList:](v129, "proxyPathIsValid:proxyPathList:", v130, v132);

    if ((v133 & 1) == 0)
    {
      v137 = nplog_obj(v134, v135, v136);
      v138 = objc_claimAutoreleasedReturnValue(v137);
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
      {
        v139 = val;
        if (val)
          v139 = val->_candidateQuicProxyPath;
        v140 = v139;
        v141 = objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "ingressProxy"));
        v142 = (void *)v141;
        if (v141)
          v143 = *(void **)(v141 + 24);
        else
          v143 = 0;
        v144 = v143;
        v145 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "vendor"));
        if (val)
          v146 = val->_candidateQuicProxyPath;
        else
          v146 = 0;
        v147 = v146;
        v148 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](v147, "egressProxy"));
        v149 = (void *)v148;
        if (v148)
          v150 = *(void **)(v148 + 24);
        else
          v150 = 0;
        v151 = v150;
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "vendor"));
        *(_DWORD *)buf = 138412546;
        v410 = v145;
        v411 = 2112;
        v412 = v152;
        _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "Candidate Quic proxy path (%@-%@) is not valid", buf, 0x16u);

      }
      sub_10002312C((uint64_t)val, 0);
      sub_1000254F4((uint64_t)val, 0);
    }
  }
  candidateFallbackProxyPath = val;
  if (val)
    candidateFallbackProxyPath = val->_candidateFallbackProxyPath;
  v154 = candidateFallbackProxyPath;
  v155 = v154 == 0;

  if (!v155)
  {
    if (val)
    {
      v156 = val->_candidateFallbackProxyPath;
      v157 = val->_proxyArray;
      v158 = val->_fallbackProxyPathList;
    }
    else
    {
      v157 = 0;
      v156 = 0;
      v158 = 0;
    }
    v159 = v158;
    v160 = -[NSPCandidateFallbackProxyPath proxyPathIsValid:proxyPathList:](v156, "proxyPathIsValid:proxyPathList:", v157, v159);

    if ((v160 & 1) == 0)
    {
      v164 = nplog_obj(v161, v162, v163);
      v165 = objc_claimAutoreleasedReturnValue(v164);
      if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
      {
        v166 = val;
        if (val)
          v166 = val->_candidateFallbackProxyPath;
        v167 = v166;
        v168 = objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "ingressProxy"));
        v169 = (void *)v168;
        if (v168)
          v170 = *(void **)(v168 + 24);
        else
          v170 = 0;
        v171 = v170;
        v172 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "tcpProxyFqdn"));
        if (val)
          v173 = val->_candidateFallbackProxyPath;
        else
          v173 = 0;
        v174 = v173;
        v175 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](v174, "egressProxy"));
        v176 = (void *)v175;
        if (v175)
          v177 = *(void **)(v175 + 24);
        else
          v177 = 0;
        v178 = v177;
        v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "tcpProxyFqdn"));
        *(_DWORD *)buf = 138412546;
        v410 = v172;
        v411 = 2112;
        v412 = v179;
        _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_DEFAULT, "Candidate Fallback proxy path (%@-%@) is not valid", buf, 0x16u);

      }
      sub_10002313C((uint64_t)val, 0);
      sub_10002603C((id *)&val->super.isa, 0);
    }
  }
  v368 = 0u;
  v369 = 0u;
  v366 = 0u;
  v367 = 0u;
  preferredQUICProxyPaths = val;
  if (val)
    preferredQUICProxyPaths = val->_preferredQUICProxyPaths;
  v181 = preferredQUICProxyPaths;
  v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v366, v394, 16);
  if (v182)
  {
    v183 = *(_QWORD *)v367;
    do
    {
      v184 = 0;
      do
      {
        if (*(_QWORD *)v367 != v183)
          objc_enumerationMutation(v181);
        if (val)
          v185 = val->_preferredQUICProxyPaths;
        else
          v185 = 0;
        v186 = *(_QWORD *)(*((_QWORD *)&v366 + 1) + 8 * (_QWORD)v184);
        v187 = v185;
        v188 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v186));

        if (val)
        {
          v189 = val->_proxyArray;
          v190 = val->_proxyPathList;
        }
        else
        {
          v189 = 0;
          v190 = 0;
        }
        v191 = v190;
        v192 = objc_msgSend(v188, "proxyPathIsValid:proxyPathList:", v189, v191);

        if (v192)
          objc_msgSend(v188, "resetMultiHopProxyAgent");

        v184 = (char *)v184 + 1;
      }
      while (v182 != v184);
      v193 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v366, v394, 16);
      v182 = v193;
    }
    while (v193);
  }

  if (val && !-[NSPPrivacyProxyAgentManager forceFallback](val, "forceFallback"))
  {
    obja = (id *)&val->_candidatePreferredQUICProxyPaths;
    if (!val->_candidatePreferredQUICProxyPaths)
    {
      v194 = objc_alloc_init((Class)NSMutableDictionary);
      objc_storeStrong(obja, v194);

    }
    v353 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v392 = 0u;
    v393 = 0u;
    block = 0u;
    v391 = 0u;
    v346 = val->_proxyArray;
    v351 = (id *)-[NSArray countByEnumeratingWithState:objects:count:](v346, "countByEnumeratingWithState:objects:count:", &block, buf, 16);
    if (v351)
    {
      to = *(id **)v391;
      do
      {
        v360 = 0;
        do
        {
          if (*(id **)v391 != to)
            objc_enumerationMutation(v346);
          v195 = *(void **)(*((_QWORD *)&block + 1) + 8 * (_QWORD)v360);
          if ((objc_msgSend(v195, "hasPreferredPathConfigUri") & 1) == 0
            && !objc_msgSend(v195, "preferredPathPatternsCount"))
          {
            goto LABEL_226;
          }
          v363 = objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "vendor"));
          v196 = (void *)v363;
          if (!v363)
            goto LABEL_225;
          v357 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*obja, "objectForKeyedSubscript:"));
          if (v357)
          {
            v197 = val->_proxyPathList;
            v198 = val->_proxyArray;
            v199 = objc_msgSend(v357, "proxyPathIsValid:proxyPathList:", v198, v197);

            if ((v199 & 1) != 0)
            {
              v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "preferredPathConfigURI"));
              v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "preferredPathConfigUri"));
              WeakRetained = v203;
              v206 = v204;
              v207 = (void *)v206;
              if (!(WeakRetained | v206)
                || (v212 = (void *)v206, (v210 = WeakRetained) != 0)
                && (v212 = (void *)v206, v210 = WeakRetained, v206)
                && (v212 = (void *)v206,
                    v210 = WeakRetained,
                    objc_msgSend((id)WeakRetained, "isEqual:", v206)))
              {

                v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "preferredPathPatterns"));
                v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "preferredPathPatterns"));
                v210 = v208;
                v211 = v209;
                v212 = (void *)v211;
                if (v210 | v211 && (!v210 || !v211 || !objc_msgSend((id)v210, "isEqual:", v211)))
                {

                  goto LABEL_190;
                }

              }
              else
              {
LABEL_190:

                v243 = nplog_obj(v240, v241, v242);
                v244 = objc_claimAutoreleasedReturnValue(v243);
                if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                {
                  v245 = objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "ingressProxy"));
                  v246 = (void *)v245;
                  if (v245)
                    v247 = *(void **)(v245 + 24);
                  else
                    v247 = 0;
                  v248 = v247;
                  v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "vendor"));
                  v250 = objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "egressProxy"));
                  v251 = (void *)v250;
                  if (v250)
                    v252 = *(void **)(v250 + 24);
                  else
                    v252 = 0;
                  v253 = v252;
                  v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "vendor"));
                  *(_DWORD *)v401 = 138412802;
                  *(_QWORD *)&v401[4] = v363;
                  *(_WORD *)&v401[12] = 2112;
                  *(_QWORD *)&v401[14] = v249;
                  *(_WORD *)&v401[22] = 2112;
                  *(_QWORD *)&v401[24] = v254;
                  _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "Candidate preferred proxy path for vendor %@ (%@-%@) has new matching rules, updating", v401, 0x20u);

                }
                v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "preferredPathConfigUri"));
                objc_msgSend(v357, "setPreferredPathConfigURI:", v255);

                objc_msgSend(v357, "setDomainFilter:", 0);
                v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "preferredPathPatterns"));
                objc_msgSend(v357, "setPreferredPathPatterns:", v256);

                -[NSMutableDictionary setObject:forKeyedSubscript:](val->_preferredQUICProxyPaths, "setObject:forKeyedSubscript:", 0, v363);
                WeakRetained = (unint64_t)objc_loadWeakRetained((id *)&val->_delegate);
                objc_msgSend((id)WeakRetained, "preferredProxyAgentUnregistered:", v363);
              }

              objc_msgSend(v353, "addObject:", v363);
              goto LABEL_224;
            }
            v213 = nplog_obj(v200, v201, v202);
            v214 = objc_claimAutoreleasedReturnValue(v213);
            if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
            {
              v215 = objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "ingressProxy"));
              v216 = (void *)v215;
              if (v215)
                v217 = *(void **)(v215 + 24);
              else
                v217 = 0;
              v218 = v217;
              v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "vendor"));
              v220 = objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "egressProxy"));
              v221 = (void *)v220;
              if (v220)
                v222 = *(void **)(v220 + 24);
              else
                v222 = 0;
              v223 = v222;
              v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "vendor"));
              *(_DWORD *)v401 = 138412802;
              *(_QWORD *)&v401[4] = v363;
              *(_WORD *)&v401[12] = 2112;
              *(_QWORD *)&v401[14] = v219;
              *(_WORD *)&v401[22] = 2112;
              *(_QWORD *)&v401[24] = v224;
              _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_DEFAULT, "Candidate preferred proxy path for vendor %@ (%@-%@) is not valid", v401, 0x20u);

            }
            objc_msgSend(*obja, "setObject:forKeyedSubscript:", 0, v363);
          }
          v388 = 0u;
          v389 = 0u;
          v386 = 0u;
          v387 = 0u;
          v225 = val->_proxyPathList;
          v226 = -[NSArray countByEnumeratingWithState:objects:count:](v225, "countByEnumeratingWithState:objects:count:", &v386, v408, 16);
          if (!v226)
            goto LABEL_175;
          v227 = *(_QWORD *)v387;
          do
          {
            for (i = 0; i != v226; i = (char *)i + 1)
            {
              if (*(_QWORD *)v387 != v227)
                objc_enumerationMutation(v225);
              v229 = *(void **)(*((_QWORD *)&v386 + 1) + 8 * (_QWORD)i);
              v230 = val->_proxyArray;
              v231 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v230, "objectAtIndex:", *((unsigned int *)objc_msgSend(v229, "proxies") + 1)));

              if ((objc_msgSend(v231, "isEqual:", v195) & 1) != 0)
              {
                v347 = v229;

                if (!v347)
                  goto LABEL_180;
                v235 = val->_proxyArray;
                v236 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v235, "objectAtIndex:", *(unsigned int *)-[NSObject proxies](v347, "proxies")));

                if (v236)
                {
                  v237 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](val, "overrideIngressProxy"));
                  if (v237)
                  {

                    goto LABEL_199;
                  }
                  v257 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](val, "overrideIngressProxyKey"));
                  v258 = v257 == 0;

                  if (v258)
                  {
                    v345 = v236;
                  }
                  else
                  {
LABEL_199:
                    v345 = objc_msgSend(v236, "copy");

                    v259 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](val, "overrideIngressProxy"));
                    v260 = v259 == 0;

                    if (!v260)
                    {
                      v261 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](val, "overrideIngressProxy"));
                      objc_msgSend(v345, "setProxyURL:", v261);

                    }
                    v262 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](val, "overrideIngressProxyKey"));
                    v263 = v262 == 0;

                    if (!v263)
                    {
                      objc_msgSend(v345, "clearProxyKeyInfos");
                      v264 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](val, "overrideIngressProxyKey"));
                      objc_msgSend(v345, "addProxyKeyInfo:", v264);

                    }
                  }
                  v265 = sub_100028CFC((uint64_t)val, v345);
                  v344 = (void *)objc_claimAutoreleasedReturnValue(v265);
                  v266 = sub_100028CFC((uint64_t)val, v195);
                  v343 = (void *)objc_claimAutoreleasedReturnValue(v266);
                  if (v344 && v343)
                  {
                    v267 = [NSPCandidateQuicProxyPath alloc];
                    v268 = -[NSObject weight](v347, "weight");
                    v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "preferredPathConfigUri"));
                    v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "preferredPathPatterns"));
                    v349 = -[NSPCandidateProxyPath initWithIngressProxy:egressProxy:proxyPathWeight:preferredPathConfigURI:preferredPathPatterns:](v267, "initWithIngressProxy:egressProxy:proxyPathWeight:preferredPathConfigURI:preferredPathPatterns:", v344, v343, v268, v269, v270);

                    v384 = 0u;
                    v385 = 0u;
                    v382 = 0u;
                    v383 = 0u;
                    v271 = val->_savedConfiguredPreferredPaths;
                    v272 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v271, "countByEnumeratingWithState:objects:count:", &v382, &v404, 16);
                    if (v272)
                    {
                      v273 = *(_QWORD *)v383;
                      do
                      {
                        for (j = 0; j != v272; j = (char *)j + 1)
                        {
                          if (*(_QWORD *)v383 != v273)
                            objc_enumerationMutation(v271);
                          v275 = *(void **)(*((_QWORD *)&v382 + 1) + 8 * (_QWORD)j);
                          v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "objectForKey:", CFSTR("Vendor")));
                          v277 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "objectForKey:", CFSTR("PreferredPathConfigURL")));
                          v278 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "objectForKey:", CFSTR("DomainFilter")));
                          if (v276)
                          {
                            v279 = objc_opt_class(NSString);
                            if ((objc_opt_isKindOfClass(v276, v279) & (v277 != 0)) == 1)
                            {
                              v280 = objc_opt_class(NSString);
                              if ((objc_opt_isKindOfClass(v277, v280) & (v278 != 0)) == 1)
                              {
                                v281 = objc_opt_class(NSData);
                                if ((objc_opt_isKindOfClass(v278, v281) & 1) != 0)
                                {
                                  if (objc_msgSend(v276, "isEqualToString:", v363))
                                  {
                                    v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "preferredPathConfigUri"));
                                    v283 = objc_msgSend(v282, "isEqualToString:", v277);

                                    if (v283)
                                      -[NSPCandidateProxyPath setDomainFilter:](v349, "setDomainFilter:", v278);
                                  }
                                }
                              }
                            }
                          }

                        }
                        v272 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v271, "countByEnumeratingWithState:objects:count:", &v382, &v404, 16);
                      }
                      while (v272);
                    }

                    objc_msgSend(*obja, "setObject:forKeyedSubscript:", v349, v363);
                    objc_msgSend(v353, "addObject:", v363);

                  }
                }
                v239 = v347;
                goto LABEL_223;
              }

            }
            v226 = -[NSArray countByEnumeratingWithState:objects:count:](v225, "countByEnumeratingWithState:objects:count:", &v386, v408, 16);
          }
          while (v226);
LABEL_175:

LABEL_180:
          v238 = nplog_obj(v232, v233, v234);
          v239 = objc_claimAutoreleasedReturnValue(v238);
          if (os_log_type_enabled(v239, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v401 = 138412290;
            *(_QWORD *)&v401[4] = v363;
            _os_log_impl((void *)&_mh_execute_header, v239, OS_LOG_TYPE_INFO, "No preferred path found for vendor \"%@\", v401, 0xCu);
          }
LABEL_223:

LABEL_224:
          v196 = (void *)v363;
LABEL_225:

LABEL_226:
          v360 = (id *)((char *)v360 + 1);
        }
        while (v360 != v351);
        v284 = (id *)-[NSArray countByEnumeratingWithState:objects:count:](v346, "countByEnumeratingWithState:objects:count:", &block, buf, 16);
        v351 = v284;
      }
      while (v284);
    }

    objc_storeStrong((id *)&val->_savedConfiguredPreferredPaths, 0);
    v285 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](val->_candidatePreferredQUICProxyPaths, "allKeys"));
    v380 = 0u;
    v381 = 0u;
    v378 = 0u;
    v379 = 0u;
    v358 = v285;
    v364 = objc_msgSend(v358, "countByEnumeratingWithState:objects:count:", &v378, v401, 16);
    if (!v364)
      goto LABEL_270;
    v361 = *(_QWORD *)v379;
LABEL_235:
    v286 = 0;
    while (1)
    {
      if (*(_QWORD *)v379 != v361)
        objc_enumerationMutation(v358);
      v287 = *(void **)(*((_QWORD *)&v378 + 1) + 8 * v286);
      v288 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*obja, "objectForKeyedSubscript:", v287));
      v289 = objc_msgSend(v353, "containsObject:", v287);
      if ((v289 & 1) == 0)
      {
        v309 = nplog_obj(v289, v290, v291);
        v310 = objc_claimAutoreleasedReturnValue(v309);
        if (os_log_type_enabled(v310, OS_LOG_TYPE_DEFAULT))
        {
          v311 = objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "ingressProxy"));
          v312 = (void *)v311;
          if (v311)
            v313 = *(void **)(v311 + 24);
          else
            v313 = 0;
          v314 = v313;
          v315 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v314, "vendor"));
          v316 = objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "egressProxy"));
          v317 = (void *)v316;
          if (v316)
            v318 = *(void **)(v316 + 24);
          else
            v318 = 0;
          v319 = v318;
          v320 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v319, "vendor"));
          *(_DWORD *)v395 = 138412802;
          v396 = v287;
          v397 = 2112;
          v398 = v315;
          v399 = 2112;
          v400 = v320;
          _os_log_impl((void *)&_mh_execute_header, v310, OS_LOG_TYPE_DEFAULT, "Preferred proxy path for vendor %@ (%@-%@) has been removed", v395, 0x20u);

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](val->_candidatePreferredQUICProxyPaths, "setObject:forKeyedSubscript:", 0, v287);
        -[NSMutableDictionary setObject:forKeyedSubscript:](val->_preferredQUICProxyPaths, "setObject:forKeyedSubscript:", 0, v287);
        v292 = objc_loadWeakRetained((id *)&val->_delegate);
        objc_msgSend(v292, "preferredProxyAgentUnregistered:", v287);
        goto LABEL_262;
      }
      if (!objc_msgSend(v288, "proxyPathReady"))
      {
        v321 = objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "ingressProxy"));
        v322 = (void *)v321;
        if (v321)
          v323 = *(void **)(v321 + 24);
        else
          v323 = 0;
        v324 = v323;

        v325 = objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "egressProxy"));
        v326 = (void *)v325;
        if (v325)
          v327 = *(void **)(v325 + 24);
        else
          v327 = 0;
        v328 = v327;

        v329 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "ingressProxy"));
        v376[0] = _NSConcreteStackBlock;
        v376[1] = 3221225472;
        v376[2] = sub_10002AA78;
        v376[3] = &unk_1000F5720;
        v292 = v324;
        v377 = v292;
        sub_10000C280((uint64_t)v329, v376);

        v330 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "egressProxy"));
        v374[0] = _NSConcreteStackBlock;
        v374[1] = 3221225472;
        v374[2] = sub_10002AB5C;
        v374[3] = &unk_1000F5720;
        v331 = v328;
        v375 = v331;
        sub_10000C280((uint64_t)v330, v374);

        objc_initWeak((id *)v395, val);
        v370[0] = _NSConcreteStackBlock;
        v370[1] = 3221225472;
        v370[2] = sub_10002AC40;
        v370[3] = &unk_1000F5AD0;
        v332 = v331;
        v371 = v332;
        objc_copyWeak(&v373, (id *)v395);
        v372 = v287;
        objc_msgSend(v288, "fetchDomainFilter:", v370);
        objc_destroyWeak(&v373);

        objc_destroyWeak((id *)v395);
        goto LABEL_262;
      }
      v292 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](val->_preferredQUICProxyPaths, "objectForKeyedSubscript:", v287));
      if (!v292)
        goto LABEL_249;
      v293 = val->_proxyPathList;
      v294 = val->_proxyArray;
      LOBYTE(v293) = objc_msgSend(v292, "proxyPathIsValid:proxyPathList:", v294, v293);

      if ((v293 & 1) == 0)
        break;
LABEL_262:

      if (v364 == (id)++v286)
      {
        v333 = objc_msgSend(v358, "countByEnumeratingWithState:objects:count:", &v378, v401, 16);
        v364 = v333;
        if (!v333)
        {
LABEL_270:

          sub_1000291A4((id *)&val->super.isa);
          -[NSPPrivacyProxyAgentManager updateUserEventAgentData](val, "updateUserEventAgentData");
          sub_100029EE4((uint64_t)val);

          goto LABEL_271;
        }
        goto LABEL_235;
      }
    }
    v298 = nplog_obj(v295, v296, v297);
    v299 = objc_claimAutoreleasedReturnValue(v298);
    if (os_log_type_enabled(v299, OS_LOG_TYPE_DEFAULT))
    {
      v300 = objc_claimAutoreleasedReturnValue(objc_msgSend(v292, "ingressProxy"));
      v348 = (void *)v300;
      v301 = (void *)v300;
      if (v300)
        v301 = *(void **)(v300 + 24);
      v302 = v301;
      v303 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v302, "vendor"));
      v304 = objc_claimAutoreleasedReturnValue(objc_msgSend(v292, "egressProxy"));
      v305 = (void *)v304;
      if (v304)
        v306 = *(void **)(v304 + 24);
      else
        v306 = 0;
      v307 = v306;
      v308 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v307, "vendor"));
      *(_DWORD *)v395 = 138412802;
      v396 = v287;
      v397 = 2112;
      v398 = v303;
      v399 = 2112;
      v400 = v308;
      _os_log_impl((void *)&_mh_execute_header, v299, OS_LOG_TYPE_DEFAULT, "Preferred proxy path for vendor %@ (%@-%@) is not valid", v395, 0x20u);

    }
LABEL_249:
    sub_10002A778((uint64_t)val, v287);
    v292 = 0;
    goto LABEL_262;
  }
LABEL_271:
  sub_10002B564((id *)&val->super.isa);
  sub_10002C510((uint64_t)val);
  if (val)
    val->_deferAgentCommit = 0;
  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](val, "updateUserEventAgentData");
LABEL_274:

}

- (void)overrideProxiedContentMap:(id)a3 enabled:(BOOL)a4
{
  int v4;
  id v6;
  NSMutableArray *overrideEnabledMaps;
  id v8;
  NSMutableArray *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  id v13;

  v4 = a4;
  v6 = a3;
  if (self)
    overrideEnabledMaps = self->_overrideEnabledMaps;
  else
    overrideEnabledMaps = 0;
  v13 = v6;
  if (-[NSMutableArray containsObject:](overrideEnabledMaps, "containsObject:", v6) != v4)
  {
    v8 = v13;
    if (v4)
    {
      if (self)
      {
        v9 = self->_overrideEnabledMaps;
        if (!v9)
        {
          v10 = objc_alloc_init((Class)NSMutableArray);
          sub_1000230FC((uint64_t)self, v10);

          v9 = self->_overrideEnabledMaps;
          v8 = v13;
        }
      }
      else
      {
        v12 = objc_alloc_init((Class)NSMutableArray);
        sub_1000230FC(0, v12);

        v8 = v13;
        v9 = 0;
      }
      -[NSMutableArray addObject:](v9, "addObject:", v8);
    }
    else
    {
      if (self)
        v11 = self->_overrideEnabledMaps;
      else
        v11 = 0;
      -[NSMutableArray removeObject:](v11, "removeObject:", v13);
    }
    sub_10002B564((id *)&self->super.isa);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    sub_100029EE4((uint64_t)self);
  }

}

- (BOOL)proxiedContentMapIsOverrideEnabled:(id)a3
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_overrideEnabledMaps;
  return -[NSPPrivacyProxyAgentManager containsObject:](self, "containsObject:", a3);
}

- (BOOL)disableDoHBootstrapResults
{
  if (self)
    LOBYTE(self) = self->_disableProxiedContentDoHBootstrap;
  return (char)self;
}

- (void)setProxiedContentMapDoHBootstrapEnabled:(BOOL)a3
{
  if (self)
  {
    if (((self->_disableProxiedContentDoHBootstrap ^ a3) & 1) != 0)
      return;
    self->_disableProxiedContentDoHBootstrap = !a3;
LABEL_5:
    sub_10002B564((id *)&self->super.isa);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    sub_100029EE4((uint64_t)self);
    return;
  }
  if (!a3)
    goto LABEL_5;
}

- (void)overridePreferredProxy:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *proxiedContentMaps;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredProxy](self, "overridePreferredProxy"));
  v5 = objc_msgSend(v13, "isEqualToString:", v4);

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    sub_10000D354((uint64_t)self, v13);
    sub_10002312C((uint64_t)self, 0);
    sub_10002313C((uint64_t)self, 0);
    sub_10002310C((uint64_t)self, 0);
    sub_10002311C((uint64_t)self, 0);
    if (self)
    {
      v7 = self->_proxyArray;
      v8 = self->_resolverArray;
      v9 = self->_proxyPathList;
      v10 = self->_fallbackProxyPathList;
      v11 = self->_obliviousConfigs;
      proxiedContentMaps = self->_proxiedContentMaps;
    }
    else
    {
      v11 = 0;
      v9 = 0;
      v7 = 0;
      v8 = 0;
      v10 = 0;
      proxiedContentMaps = 0;
    }
    -[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:](self, "updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:", v7, v8, v9, v10, v11, proxiedContentMaps);

    sub_100029EE4((uint64_t)self);
    v6 = v13;
  }

}

- (void)overridePreferredObliviousProxy:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredObliviousProxy](self, "overridePreferredObliviousProxy"));
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    sub_1000062B8((uint64_t)self, v6);
    sub_10002C510((uint64_t)self);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    sub_100029EE4((uint64_t)self);
  }

}

- (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *proxiedContentMaps;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](self, "overrideIngressProxy"));
  if (objc_msgSend(v20, "isEqualToString:", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideFallbackIngressProxy](self, "overrideFallbackIngressProxy"));
    if ((objc_msgSend(v8, "isEqualToString:", v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](self, "overrideIngressProxyKey"));
      v13 = objc_msgSend(v9, "isEqualToData:", v12);

      if ((v13 & 1) != 0)
        goto LABEL_10;
      goto LABEL_7;
    }

  }
LABEL_7:
  sub_10000D364((uint64_t)self, v20);
  sub_10000BB1C((uint64_t)self, v8);
  sub_1000230EC((uint64_t)self, v9);
  sub_10002312C((uint64_t)self, 0);
  sub_10002313C((uint64_t)self, 0);
  sub_10002310C((uint64_t)self, 0);
  sub_10002311C((uint64_t)self, 0);
  if (self)
  {
    v14 = self->_proxyArray;
    v15 = self->_resolverArray;
    v16 = self->_proxyPathList;
    v17 = self->_fallbackProxyPathList;
    v18 = self->_obliviousConfigs;
    proxiedContentMaps = self->_proxiedContentMaps;
  }
  else
  {
    v18 = 0;
    v16 = 0;
    v14 = 0;
    v15 = 0;
    v17 = 0;
    proxiedContentMaps = 0;
  }
  -[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:](self, "updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:", v14, v15, v16, v17, v18, proxiedContentMaps);

  sub_100029EE4((uint64_t)self);
LABEL_10:

}

- (void)forceFallback:(BOOL)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *proxiedContentMaps;

  if (self)
  {
    self->_forceFallback = a3;
    objc_storeStrong((id *)&self->_candidateQuicProxyPath, 0);
    objc_storeStrong((id *)&self->_candidateFallbackProxyPath, 0);
    objc_storeStrong((id *)&self->_quicProxyPath, 0);
    objc_storeStrong((id *)&self->_fallbackProxyPath, 0);
    v4 = self->_proxyArray;
    v5 = self->_resolverArray;
    v6 = self->_proxyPathList;
    v7 = self->_fallbackProxyPathList;
    v8 = self->_obliviousConfigs;
    proxiedContentMaps = self->_proxiedContentMaps;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v4 = 0;
    v5 = 0;
    v7 = 0;
    proxiedContentMaps = 0;
  }
  -[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:](self, "updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:", v4, v5, v6, v7, v8, proxiedContentMaps);

  sub_100029EE4((uint64_t)self);
}

- (void)removeExpiredTokens
{
  NSMutableArray *proxyTokenInfoArray;
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  if (self)
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  else
    proxyTokenInfoArray = 0;
  v3 = proxyTokenInfoArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        sub_10000D374(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)updateGeohashSharingPreference:(BOOL)a3 geohashOverride:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  NSMutableDictionary *preferredQUICProxyPaths;
  NSMutableDictionary *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v6 = a4;
  if (!self)
  {
    if (v4)
      goto LABEL_20;
    goto LABEL_3;
  }
  if (self->_geohashSharingEnabled == v4)
  {
LABEL_3:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager geohashOverride](self, "geohashOverride"));
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if ((v8 & 1) != 0)
      goto LABEL_18;
    if (self)
      goto LABEL_5;
LABEL_20:
    -[NSPPrivacyProxyAgentManager setGeohashOverride:](self, "setGeohashOverride:", v6);
    objc_msgSend(0, "updateGeohashSharing:", v4);
    objc_msgSend(0, "updateGeohashSharing:", v4);
    preferredQUICProxyPaths = 0;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    goto LABEL_6;
  }
LABEL_5:
  self->_geohashSharingEnabled = v4;
  -[NSPPrivacyProxyAgentManager setGeohashOverride:](self, "setGeohashOverride:", v6);
  -[NSPProxyPath updateGeohashSharing:](self->_fallbackProxyPath, "updateGeohashSharing:", v4);
  -[NSPProxyPath updateGeohashSharing:](self->_quicProxyPath, "updateGeohashSharing:", v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
LABEL_6:
  v10 = preferredQUICProxyPaths;
  v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        if (self)
          v15 = self->_preferredQUICProxyPaths;
        else
          v15 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14), (_QWORD)v18));
        objc_msgSend(v16, "updateGeohashSharing:", v4);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v12 = v17;
    }
    while (v17);
  }

  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
LABEL_18:

}

- (void)updateConfigEpoch:(id)a3
{
  id v4;
  NSNumber *configEpoch;
  NSPQuicProxyPath *quicProxyPath;
  NSMutableDictionary *preferredQUICProxyPaths;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  if (self)
    configEpoch = self->_configEpoch;
  else
    configEpoch = 0;
  if ((-[NSNumber isEqual:](configEpoch, "isEqual:", v4) & 1) == 0)
  {
    sub_1000231EC((uint64_t)self, v4);
    sub_1000231FC((uint64_t)self, 0);
    if (self)
    {
      -[NSPProxyPath updateConfigEpoch:](self->_fallbackProxyPath, "updateConfigEpoch:", v4);
      quicProxyPath = self->_quicProxyPath;
    }
    else
    {
      objc_msgSend(0, "updateConfigEpoch:", v4);
      quicProxyPath = 0;
    }
    -[NSPProxyPath updateConfigEpoch:](quicProxyPath, "updateConfigEpoch:", v4);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    if (self)
      preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
    else
      preferredQUICProxyPaths = 0;
    v8 = preferredQUICProxyPaths;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          if (self)
            v13 = self->_preferredQUICProxyPaths;
          else
            v13 = 0;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12), (_QWORD)v16));
          objc_msgSend(v14, "updateConfigEpoch:", v4);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v10 = v15;
      }
      while (v15);
    }

    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
  }

}

- (void)updateDNSFilteringHint:(BOOL)a3
{
  _BOOL8 v3;
  NSPQuicProxyPath *quicProxyPath;
  NSMutableDictionary *preferredQUICProxyPaths;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  if (-[NSPPrivacyProxyAgentManager dnsFilteringHintEnabled](self, "dnsFilteringHintEnabled") != a3)
  {
    -[NSPPrivacyProxyAgentManager setDnsFilteringHintEnabled:](self, "setDnsFilteringHintEnabled:", v3);
    if (self)
    {
      -[NSPFallbackProxyPath resetMultiHopProxyAgent](self->_fallbackProxyPath, "resetMultiHopProxyAgent");
      quicProxyPath = self->_quicProxyPath;
    }
    else
    {
      objc_msgSend(0, "resetMultiHopProxyAgent");
      quicProxyPath = 0;
    }
    -[NSPQuicProxyPath resetMultiHopProxyAgent](quicProxyPath, "resetMultiHopProxyAgent");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    if (self)
      preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
    else
      preferredQUICProxyPaths = 0;
    v7 = preferredQUICProxyPaths;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          if (self)
            v12 = self->_preferredQUICProxyPaths;
          else
            v12 = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), (_QWORD)v15));
          objc_msgSend(v13, "resetMultiHopProxyAgent");

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v9 = v14;
      }
      while (v14);
    }

    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
  }
}

- (id)tierString
{
  if (!self || !self->_subscriber)
    return CFSTR("FREE");
  if (self->_unlimited)
    return CFSTR("SUBSCRIBER_UNLIMITED");
  return CFSTR("SUBSCRIBER");
}

- (void)tokenLowWaterMarkReached:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  char *v11;
  id v12;
  unsigned int v13;
  NSPQuicProxyPath *quicProxyPath;
  NSPFallbackProxyPath *fallbackProxyPath;
  NSPCandidateQuicProxyPath *candidateQuicProxyPath;
  NSPCandidateFallbackProxyPath *candidateFallbackProxyPath;
  NSMutableDictionary *candidatePreferredQUICProxyPaths;
  NSMutableDictionary *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  id v26;
  NSMutableArray *proxiedContentPaths;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  _QWORD v32[4];
  id *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id *v45;
  _QWORD v46[4];
  id *v47;
  _QWORD v48[4];
  NSObject *v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;

  v4 = (id *)a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[NSPPrivacyProxyAgentManager tokenLowWaterMarkReached:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v4[3];
    v11 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vendor"));
    *(_DWORD *)buf = 138412290;
    v53 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: token cache low water mark hit", buf, 0xCu);

  }
  v12 = v4[3];
  if (objc_msgSend(v12, "proxyHop") == 1)
  {

LABEL_7:
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100030C70;
    v48[3] = &unk_1000F5720;
    v49 = v4;
    sub_10000C280((uint64_t)v49, v48);
    v9 = v49;
    goto LABEL_8;
  }
  v13 = objc_msgSend(v4[3], "proxyHop");

  if (v13 == 3)
    goto LABEL_7;
  if (objc_msgSend(v4[3], "proxyHop") != 2)
    goto LABEL_9;
  if (self)
    quicProxyPath = self->_quicProxyPath;
  else
    quicProxyPath = 0;
  if (-[NSPProxyPath matchEgress:](quicProxyPath, "matchEgress:", v4))
    sub_1000254F4((uint64_t)self, 0);
  if (self)
    fallbackProxyPath = self->_fallbackProxyPath;
  else
    fallbackProxyPath = 0;
  if (-[NSPProxyPath matchEgress:](fallbackProxyPath, "matchEgress:", v4))
    sub_10002603C((id *)&self->super.isa, 0);
  if (self)
    candidateQuicProxyPath = self->_candidateQuicProxyPath;
  else
    candidateQuicProxyPath = 0;
  if (-[NSPCandidateProxyPath matchEgress:](candidateQuicProxyPath, "matchEgress:", v4))
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100030D68;
    v46[3] = &unk_1000F5720;
    v47 = v4;
    sub_10000C280((uint64_t)v47, v46);

  }
  if (self)
    candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
  else
    candidateFallbackProxyPath = 0;
  if (-[NSPCandidateProxyPath matchEgress:](candidateFallbackProxyPath, "matchEgress:", v4))
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100030E60;
    v44[3] = &unk_1000F5720;
    v45 = v4;
    sub_10000C280((uint64_t)v45, v44);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  if (self)
    candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
  else
    candidatePreferredQUICProxyPaths = 0;
  v19 = candidatePreferredQUICProxyPaths;
  v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        if (self)
          v24 = self->_candidatePreferredQUICProxyPaths;
        else
          v24 = 0;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v23)));
        if (objc_msgSend(v25, "matchEgress:", v4))
        {
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100030F58;
          v38[3] = &unk_1000F5720;
          v39 = v4;
          sub_10000C280((uint64_t)v39, v38);

        }
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      v21 = v26;
    }
    while (v26);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  if (self)
    proxiedContentPaths = self->_proxiedContentPaths;
  else
    proxiedContentPaths = 0;
  v9 = proxiedContentPaths;
  v28 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v9);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "matchEgress:", v4))
        {
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_100031050;
          v32[3] = &unk_1000F5720;
          v33 = v4;
          sub_10000C280((uint64_t)v33, v32);

        }
      }
      v29 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v29);
  }
LABEL_8:

LABEL_9:
}

- (void)tokenFetched
{
  sub_100031148((uint64_t)self);
  if (self)
    -[NSPPrivacyProxyAgentManager tokensEmpty](self, "tokensEmpty");
}

- (void)tokenAdded
{
  sub_100031148((uint64_t)self);
  if (self)
    -[NSPPrivacyProxyAgentManager tokensEmpty](self, "tokensEmpty");
}

- (void)tokensEmpty
{
  NSPQuicProxyPath *quicProxyPath;
  NSPQuicProxyPath *v4;
  void *v5;
  NSPFallbackProxyPath *fallbackProxyPath;
  void *v7;
  uint64_t v8;
  NSPQuicProxyPath *v9;
  void *v10;
  uint64_t v11;
  NSPFallbackProxyPath *v12;
  void *v13;
  uint64_t v14;
  NSObject *replenishTokenTimer;
  OS_dispatch_source *v16;
  id WeakRetained;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  NSPQuicProxyPath *v21;
  NSPQuicProxyPath *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id *v42;
  NSPFallbackProxyPath *v43;
  NSPFallbackProxyPath *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  id *v64;
  uint8_t buf[4];
  void *v66;

  if (self)
    quicProxyPath = self->_quicProxyPath;
  else
    quicProxyPath = 0;
  v4 = quicProxyPath;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v4, "ingressProxy"));
  if (!sub_10000D9B0((uint64_t)v5))
  {

LABEL_18:
    sub_100032040((uint64_t)self);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    return;
  }
  if (self)
    fallbackProxyPath = self->_fallbackProxyPath;
  else
    fallbackProxyPath = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](fallbackProxyPath, "ingressProxy"));
  v8 = sub_10000D9B0((uint64_t)v7);

  if (!v8)
    goto LABEL_18;
  if (self)
    v9 = self->_quicProxyPath;
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v9, "egressProxy"));
  v11 = sub_10000D9B0((uint64_t)v10);

  if (v11)
  {
    if (self)
    {
LABEL_11:
      v12 = self->_fallbackProxyPath;
      goto LABEL_12;
    }
  }
  else
  {
    v18 = sub_100029008((uint64_t)self, 0);
    v64 = (id *)objc_claimAutoreleasedReturnValue(v18);
    if (!v64)
    {
      v60 = nplog_obj(0, v19, v20);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v62 = "No egress proxy with availabe tokens for quic proxy path";
LABEL_43:
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, v62, buf, 2u);
      }
LABEL_44:

      sub_100032040((uint64_t)self);
      goto LABEL_45;
    }
    if (self)
      v21 = self->_quicProxyPath;
    else
      v21 = 0;
    v22 = v21;
    v23 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v22, "ingressProxy"));
    v24 = (void *)v23;
    if (v23)
      v25 = *(void **)(v23 + 24);
    else
      v25 = 0;
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "proxyURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64[3], "proxyURL"));
    v29 = sub_1000286BC((id *)&self->super.isa, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    if (!v30)
    {
      sub_100032040((uint64_t)self);
      -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");

      return;
    }
    v34 = nplog_obj(v31, v32, v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = v64[3];
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "vendor"));
      *(_DWORD *)buf = 138412290;
      v66 = v37;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Selected %@ egress proxy to switch QUIC proxy path", buf, 0xCu);

    }
    sub_1000254F4((uint64_t)self, v30);

    if (self)
      goto LABEL_11;
  }
  v12 = 0;
LABEL_12:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v12, "egressProxy"));
  v14 = sub_10000D9B0((uint64_t)v13);

  if (v14)
  {
    if (self)
    {
LABEL_14:
      replenishTokenTimer = self->_replenishTokenTimer;
      if (replenishTokenTimer)
      {
        dispatch_source_cancel(replenishTokenTimer);
        v16 = self->_replenishTokenTimer;
        self->_replenishTokenTimer = 0;

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "tokenFetchActive");

      self->_reportedTokenOutage = 0;
      goto LABEL_45;
    }
    goto LABEL_38;
  }
  v38 = sub_100029008((uint64_t)self, 1);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (!v39)
  {
    v63 = nplog_obj(0, v40, v41);
    v61 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v62 = "No egress proxy with available tokens for fallback proxy path";
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  v42 = (id *)v39;
  if (self)
    v43 = self->_fallbackProxyPath;
  else
    v43 = 0;
  v44 = v43;
  v45 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v44, "ingressProxy"));
  v46 = (void *)v45;
  if (v45)
    v47 = *(void **)(v45 + 24);
  else
    v47 = 0;
  v48 = v47;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "proxyURL"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42[3], "proxyURL"));
  v51 = sub_100028978((id *)&self->super.isa, v49, v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

  if (!v52)
  {
    sub_100032040((uint64_t)self);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");

    return;
  }
  v56 = nplog_obj(v53, v54, v55);
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    v58 = v42[3];
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "vendor"));
    *(_DWORD *)buf = 138412290;
    v66 = v59;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Selected %@ egress proxy to switch Fallback proxy path", buf, 0xCu);

  }
  sub_10002603C((id *)&self->super.isa, v52);

  if (self)
    goto LABEL_14;
LABEL_38:
  objc_msgSend(0, "tokenFetchActive");
LABEL_45:
  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
}

- (id)lastTokenOutageReason
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_lastTokenOutageReasonStats;
  return self;
}

- (void)switchProxy:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  char *v16;
  NSPCandidateQuicProxyPath *candidateQuicProxyPath;
  NSPCandidateFallbackProxyPath *candidateFallbackProxyPath;
  NSPQuicProxyPath *quicProxyPath;
  NSPFallbackProxyPath *fallbackProxyPath;
  uint64_t v21;
  NSObject *v22;
  int v23;
  const char *v24;

  v4 = (id *)a3;
  v7 = v4;
  if (v4)
  {
    v8 = objc_msgSend(v4[3], "proxyHop");
    v9 = (int)v8;
    v12 = nplog_obj(v8, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v9 == 2)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v7[3];
        v16 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "vendor"));
        v23 = 138412290;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "\"%@\": switch proxy", (uint8_t *)&v23, 0xCu);

      }
      if (self)
        candidateQuicProxyPath = self->_candidateQuicProxyPath;
      else
        candidateQuicProxyPath = 0;
      if (-[NSPCandidateProxyPath matchEgress:](candidateQuicProxyPath, "matchEgress:", v7))
      {
        sub_10002312C((uint64_t)self, 0);
        sub_100027E98((id *)&self->super.isa, v7);
        sub_1000254F4((uint64_t)self, 0);
      }
      if (self)
        candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
      else
        candidateFallbackProxyPath = 0;
      if (-[NSPCandidateProxyPath matchEgress:](candidateFallbackProxyPath, "matchEgress:", v7))
      {
        sub_10002313C((uint64_t)self, 0);
        sub_1000280A8((id *)&self->super.isa, v7);
        sub_10002603C((id *)&self->super.isa, 0);
      }
      if (self)
        quicProxyPath = self->_quicProxyPath;
      else
        quicProxyPath = 0;
      if (-[NSPProxyPath matchEgress:](quicProxyPath, "matchEgress:", v7))
      {
        sub_100027E98((id *)&self->super.isa, v7);
        sub_1000254F4((uint64_t)self, 0);
        sub_100032BD8(self, v7, 0);
      }
      if (self)
        fallbackProxyPath = self->_fallbackProxyPath;
      else
        fallbackProxyPath = 0;
      if (-[NSPProxyPath matchEgress:](fallbackProxyPath, "matchEgress:", v7))
      {
        sub_1000280A8((id *)&self->super.isa, v7);
        sub_10002603C((id *)&self->super.isa, 0);
        sub_100032BD8(self, v7, 1);
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v23 = 136315138;
        v24 = "-[NSPPrivacyProxyAgentManager switchProxy:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s called with null (proxyTokenInfo.proxyInfo.proxyHop == NSPPrivacyProxyProxyInfo_ProxyHop_EGRESS_ONLY)", (uint8_t *)&v23, 0xCu);
      }

    }
  }
  else
  {
    v21 = nplog_obj(0, v5, v6);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v23 = 136315138;
      v24 = "-[NSPPrivacyProxyAgentManager switchProxy:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&v23, 0xCu);
    }

  }
}

- (void)tokenInfoInvalid:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id inited;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id *v16;
  __int128 *p_buf;
  id v18;
  id location;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = (id *)a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v4[3];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vendor"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "\"%@\": token info invalid", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = sub_1000030EC;
    v23 = sub_10000C20C;
    v24 = (id)os_transaction_create("com.apple.networkserviceproxy.tokenInfoInvalid");
    inited = objc_initWeak(&location, self);
    v13 = NPGetInternalQueue(inited);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100033184;
    v15[3] = &unk_1000F5AF8;
    objc_copyWeak(&v18, &location);
    v16 = v4;
    p_buf = &buf;
    dispatch_async(v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPPrivacyProxyAgentManager tokenInfoInvalid:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)tokenRateLimited:(id)a3 untilDate:(double)a4
{
  id *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id inited;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id location;
  _BYTE buf[24];
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = (id *)a3;
  v9 = nplog_obj(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v6[3];
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vendor"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: token rate limited for %f", buf, 0x16u);

    }
    sub_10002310C((uint64_t)self, 0);
    sub_10002311C((uint64_t)self, 0);
    sub_10002312C((uint64_t)self, 0);
    sub_10002313C((uint64_t)self, 0);
    sub_1000291A4((id *)&self->super.isa);
    sub_10002531C((uint64_t)self, (unint64_t)a4);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v21 = sub_1000030EC;
    v22 = sub_10000C20C;
    v23 = (id)os_transaction_create("com.apple.networkserviceproxy.tokenIssuanceLimitReached");
    inited = objc_initWeak(&location, self);
    v15 = NPGetInternalQueue(inited);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100033494;
    block[3] = &unk_1000F5B20;
    objc_copyWeak(&v18, &location);
    block[4] = buf;
    dispatch_async(v16, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[NSPPrivacyProxyAgentManager tokenRateLimited:untilDate:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", buf, 0xCu);
    }

  }
}

- (void)requestAccessTokenWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
  objc_msgSend(v4, "refreshCountryPlusTimezone:", &stru_1000F5B40);

  if (self)
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSPPrivacyProxyAgentManager requestAccessTokenWithCompletionHandler:](self, "requestAccessTokenWithCompletionHandler:", v5);

}

- (void)mergeTokenStats:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t tokenFetchFailedCount;
  unint64_t tokenExpiredCount;
  unint64_t cacheLowWaterMarkHitCount;
  unint64_t missingTokenCount;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    if (self)
    {
      tokenFetchFailedCount = self->_tokenFetchFailedCount;
      self->_tokenFetchSuccessCount += v4[11];
      self->_tokenFetchFailedCount = tokenFetchFailedCount + v4[14];
      tokenExpiredCount = self->_tokenExpiredCount;
      self->_tokenConsumedCount += v4[12];
      self->_tokenExpiredCount = tokenExpiredCount + v4[13];
      cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
      self->_agentLowWaterMarkHitCount += v4[15];
      self->_cacheLowWaterMarkHitCount = cacheLowWaterMarkHitCount + v4[16];
      missingTokenCount = self->_missingTokenCount;
      self->_badTokenCount += v4[17];
      self->_missingTokenCount = missingTokenCount + v4[18];
    }
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
  }
  else
  {
    v12 = nplog_obj(0, v5, v6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = 136315138;
      v15 = "-[NSPPrivacyProxyAgentManager mergeTokenStats:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (BOOL)isMultiHopProxyAgentRegistered
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  return -[NSPPrivacyProxyAgentManager isMultiHopRegistered](self, "isMultiHopRegistered");
}

- (void)sendRTCReportWithFailureType:(int64_t)a3 errorCode:(int)a4 url:(id)a5 ingressProxy:(id)a6 egressProxy:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id *v20;
  id *v21;
  id v22;
  const __CFString *v23;
  __CFString *v24;
  int v25;
  uint64_t v26;
  void *v27;
  char *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _BOOL4 v41;
  NSPPrivacyProxyAgentManager *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  __CFString *v70;
  const __CFString *v71;
  uint64_t v72;
  __CFString *v73;
  void *v74;
  unsigned __int8 v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  NSObject *v81;
  NSPPrivacyProxyAgentManager *v82;
  id v83;
  uint8_t buf[4];
  int64_t v85;
  __int16 v86;
  id v87;
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[5];
  _QWORD v91[5];

  v9 = *(_QWORD *)&a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v17 = nplog_obj(v14, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v85 = a3;
    v86 = 1024;
    LODWORD(v87) = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received RTC report request for type: %ld, errorcode: %d", buf, 0x12u);
  }

  v19 = v14;
  v20 = (id *)v13;
  v21 = (id *)v12;
  v82 = self;
  if (self)
  {
    v22 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("Mosaic"), CFSTR("eventType"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("counter"), CFSTR("type"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_1000FF200, CFSTR("value"));
    v23 = CFSTR("privacy_proxy_quic_proxy_failure");
    switch(a3)
    {
      case 1000:
        goto LABEL_11;
      case 1001:
        v23 = CFSTR("privacy_proxy_fallback_proxy_failure");
        goto LABEL_11;
      case 1002:
        v23 = CFSTR("privacy_proxy_odoh_failure");
        goto LABEL_11;
      case 1003:
        objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("privacy_proxy_token_fetch_failure"), CFSTR("name"));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("label_privacy-proxy-report-reason-code"));
        v25 = 1;
        goto LABEL_46;
      case 1004:
        v23 = CFSTR("privacy_proxy_configuration_fetch_failure");
        goto LABEL_11;
      case 1007:
        v23 = CFSTR("privacy_proxy_ohttp_failure");
        goto LABEL_11;
      default:
        v23 = CFSTR("privacy_proxy_unknown_failure");
LABEL_11:
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("name"));
        if ((int)v9 > 1199)
        {
          switch((int)v9)
          {
            case 1200:
              v26 = 3009;
              break;
            case 1201:
              v26 = 3013;
              break;
            case 1202:
            case 1203:
              goto LABEL_37;
            case 1204:
              v26 = 3010;
              break;
            case 1205:
              v26 = 3014;
              break;
            case 1206:
              v26 = 3016;
              break;
            case 1207:
              v26 = 3018;
              break;
            default:
              if ((_DWORD)v9 == 1301)
              {
                v26 = 3019;
              }
              else if ((_DWORD)v9 == 1302)
              {
                v26 = 3020;
              }
              else
              {
LABEL_37:
                v26 = (int)v9;
              }
              break;
          }
        }
        else if ((int)v9 > 1099)
        {
          switch((int)v9)
          {
            case 1100:
              v26 = 3006;
              break;
            case 1101:
              v26 = 3005;
              break;
            case 1104:
              v26 = 3007;
              break;
            case 1105:
              v26 = 3008;
              break;
            case 1106:
              v26 = 3015;
              break;
            case 1107:
              v26 = 3017;
              break;
            default:
              goto LABEL_37;
          }
        }
        else
        {
          v26 = 3001;
          switch((int)v9)
          {
            case '<':
              break;
            case '=':
              v26 = 3004;
              break;
            case '>':
            case '?':
              goto LABEL_37;
            case '@':
              v26 = 3003;
              break;
            case 'A':
              v26 = 3002;
              break;
            default:
              if ((_DWORD)v9 == 80)
              {
                v26 = 3011;
              }
              else
              {
                if ((_DWORD)v9 != 94)
                  goto LABEL_37;
                v26 = 3012;
              }
              break;
          }
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v26));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("label_privacy-proxy-report-reason-code"));

        if ((unint64_t)(v26 - 3001) >= 0x14)
        {
          v28 = strerror(v26);
          if (v28)
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4));
          else
            v24 = CFSTR("unknown");
        }
        else
        {
          v24 = *(&off_1000F5BF0 + v26 - 3001);
        }
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("label_privacy-proxy-report-reason-description"));
        v25 = 0;
LABEL_46:

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v29, "timeIntervalSince1970");
        v31 = v30 * 1000.0;

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("label_privacy-proxy-report-time"));

        if (a3 == 1000 && v20)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[3], "proxyURL"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v33));
          v35 = sub_1000336B8(v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

          objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, CFSTR("label_privacy-proxy-ingress-proxy"));
        }
        if (a3 == 1000 && v21)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21[3], "proxyURL"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v37));
          v39 = sub_1000336B8(v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

          objc_msgSend(v22, "setObject:forKeyedSubscript:", v40, CFSTR("label_privacy-proxy-egress-proxy"));
          v41 = v19 != 0;
          v42 = v82;
          goto LABEL_65;
        }
        v43 = a3 == 1001;
        if (a3 == 1001 && v20)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[3], "tcpProxyFqdn"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v44));
          v46 = sub_1000336B8(v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

          objc_msgSend(v22, "setObject:forKeyedSubscript:", v47, CFSTR("label_privacy-proxy-ingress-proxy"));
          v43 = 1;
        }
        if (v21 && v43)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21[3], "tcpProxyFqdn"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v48));
          v50 = sub_1000336B8(v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);

          objc_msgSend(v22, "setObject:forKeyedSubscript:", v51, CFSTR("label_privacy-proxy-egress-proxy"));
        }
        v41 = v19 != 0;
        v42 = v82;
        if (a3 == 1002 && v19)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v19));
          v53 = sub_1000336B8(v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

          objc_msgSend(v22, "setObject:forKeyedSubscript:", v54, CFSTR("label_privacy-proxy-odoh-resolver"));
LABEL_64:
          v41 = 1;
          goto LABEL_65;
        }
        if (a3 == 1007 && v19)
        {
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, CFSTR("label_privacy-proxy-ohttp-relay"));
          goto LABEL_64;
        }
LABEL_65:
        if ((v25 & v41) == 1)
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v19));
          v56 = sub_1000336B8(v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

          objc_msgSend(v22, "setObject:forKeyedSubscript:", v57, CFSTR("label_privacy-proxy-token-fetch-failure-proxy"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyTokenManager sharedTokenManager](NSPPrivacyTokenManager, "sharedTokenManager"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "tokenFetchURL"));

          if (v59)
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v59));
            v61 = sub_1000336B8(v60);
            v62 = (void *)objc_claimAutoreleasedReturnValue(v61);

            objc_msgSend(v22, "setObject:forKeyedSubscript:", v62, CFSTR("label_privacy-proxy-token-fetch-server"));
          }

          v42 = v82;
        }
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tierString](v42, "tierString"));
        if (v63)
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v63, CFSTR("label_privacy-proxy-tier-type"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "currentCountryPlusTimezone"));

        if (v65)
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v65, CFSTR("label_privacy-proxy-report-region"));

        break;
    }
  }
  else
  {
    v22 = 0;
    v42 = 0;
  }

  if (v22)
  {
    v90[0] = kRTCReportingSessionInfoClientType;
    v90[1] = kRTCReportingSessionInfoClientVersion;
    v91[0] = &off_1000FF218;
    v91[1] = &off_1000FF200;
    v90[2] = kRTCReportingSessionInfoSessionID;
    v90[3] = kRTCReportingSessionInfoBatchEvent;
    v91[2] = &off_1000FF1E8;
    v91[3] = &__kCFBooleanFalse;
    v90[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
    v91[4] = &__kCFBooleanTrue;
    v69 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v91, v90, 5));
    v70 = CFSTR("network-service-proxy-free");
    if (v42)
    {
      if ((unint64_t)(a3 - 1000) > 7)
        v71 = CFSTR("privacy-proxy-unknown-failure");
      else
        v71 = *(&off_1000F5C90 + a3 - 1000);
      if (v42->_subscriber)
        v70 = CFSTR("network-service-proxy-subscriber");
    }
    else
    {
      v71 = 0;
    }
    v73 = v70;
    v88[0] = kRTCReportingUserInfoClientName;
    v88[1] = kRTCReportingUserInfoServiceName;
    v89[0] = v73;
    v89[1] = v71;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v89, v88, 2));
    v83 = 0;
    v75 = +[RTCReporting sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:](RTCReporting, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v69, v74, (unsigned __int16)a3, 0, v22, &v83);
    v76 = v83;
    v79 = nplog_obj(v76, v77, v78);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    v81 = v80;
    if ((v75 & 1) != 0)
    {
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v85 = (int64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "sent RTC report %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v85 = a3;
      v86 = 2112;
      v87 = v76;
      _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "failed to send RTC report type: %ld error: %@", buf, 0x16u);
    }

  }
  else
  {
    v72 = nplog_obj(v66, v67, v68);
    v69 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v85 = a3;
      v86 = 1024;
      LODWORD(v87) = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "failed to create RTC report payload for type [%ld], error code [%d]", buf, 0x12u);
    }
  }

}

- (void)sendRTCReportForServiceOutage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  unsigned __int8 v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  id v73;
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  id v77;
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[5];
  _QWORD v81[5];

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outageReasonType"));
    *(_DWORD *)buf = 138412290;
    v75 = (uint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received RTC report request with service outage stats: %@", buf, 0xCu);

  }
  v10 = v4;
  v11 = v10;
  if (!self || !v10)
  {

    goto LABEL_86;
  }
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Mosaic"), CFSTR("eventType"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("counter"), CFSTR("type"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_1000FF200, CFSTR("value"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("privacy_proxy_outage_notification"), CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "outageReasonType"));

  if (v13)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "outageReasonType"));
    if ((objc_msgSend(v14, "isEqual:", CFSTR("Token")) & 1) != 0)
    {
      v15 = 4001;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("Captive")) & 1) != 0)
    {
      v15 = 4002;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("Proxy")) & 1) != 0)
    {
      v15 = 4003;
    }
    else if (objc_msgSend(v14, "isEqual:", CFSTR("DNS")))
    {
      v15 = 4004;
    }
    else
    {
      v15 = 4000;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("label_privacy-proxy-report-reason-code"));

  }
  else
  {
    v15 = 4000;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "outageReasonSubType"));

  if (v20)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "outageReasonSubType"));
    if ((objc_msgSend(v21, "isEqual:", CFSTR("TokenFetchFailure")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_token_fetch_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("CaptiveProbeTimeout")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_captive_probe_time_out");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("CaptiveProbeRedirected")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_captive_probe_redirect");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyConnectionTimeout")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_connection_time_out");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyConnectionRefused")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_connection_refused");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyConnectionDNSTimeout")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_dns_time_out");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyPrimaryEgressError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_primary_egress_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyFallbackEgressError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_fallback_egress_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyPrimaryOriginError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_primary_origin_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyFallbackOriginError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_fallback_origin_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyProbeRedirected")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_probe_redirect");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyProbeTCPConnected")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_probe_tcp_connected");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyProbeServerError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_probe_server_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyProbeForbidden")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_probe_forbidden");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyCertError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_cert_error");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyConnectionDNSError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_dns_error");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyPrimaryEgressUnavailableError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_primary_egress_unavailable_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ProxyFallbackEgressUnavailableError")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_fallback_egress_unavailable_failure");
    }
    else if ((objc_msgSend(v21, "isEqual:", CFSTR("ODoHAuthFailure")) & 1) != 0)
    {
      v22 = CFSTR("private_relay_proxy_odoh_auth_failure");
    }
    else if (objc_msgSend(v21, "isEqual:", CFSTR("ODoHBadMessage")))
    {
      v22 = CFSTR("private_relay_proxy_odoh_bad_message");
    }
    else
    {
      v22 = CFSTR("unknown");
    }

    v23 = v22;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("label_privacy-proxy-report-reason-description"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v24, "timeIntervalSince1970");
  v26 = v25 * 1000.0;

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("label_privacy-proxy-report-time"));

  switch(v15)
  {
    case 4001:
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tokenProxy"));

      if (!v50)
        break;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tokenProxy"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v51));
      v53 = sub_1000336B8(v52);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v53);

      v54 = CFSTR("label_privacy-proxy-token-fetch-server");
LABEL_76:
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v45, v54);
      goto LABEL_77;
    case 4004:
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "odohProxy"));

      if (!v55)
        break;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "odohProxy"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v56));
      v58 = sub_1000336B8(v57);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v58);

      v54 = CFSTR("label_privacy-proxy-odoh-resolver");
      goto LABEL_76;
    case 4003:
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryIngressProxy"));
      if (v28)
      {
        v29 = (void *)v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryEgressProxy"));

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryIngressProxy"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v31));
          v33 = sub_1000336B8(v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryEgressProxy"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v35));
          v37 = sub_1000336B8(v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

          objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, CFSTR("label_privacy-proxy-ingress-proxy"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v38, CFSTR("label_privacy-proxy-egress-proxy"));

        }
      }
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fallbackIngressProxy"));
      if (v39)
      {
        v40 = (void *)v39;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fallbackEgressProxy"));

        if (v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fallbackIngressProxy"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v42));
          v44 = sub_1000336B8(v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fallbackEgressProxy"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v46));
          v48 = sub_1000336B8(v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

          objc_msgSend(v12, "setObject:forKeyedSubscript:", v45, CFSTR("label_privacy-proxy-fallback-ingress-proxy"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v49, CFSTR("label_privacy-proxy-fallback-egress-proxy"));

LABEL_77:
        }
      }
      break;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tierString](self, "tierString"));
  if (v59)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v59, CFSTR("label_privacy-proxy-tier-type"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "currentCountryPlusTimezone"));

  if (v61)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v61, CFSTR("label_privacy-proxy-report-region"));

  if (v12)
  {
    v80[0] = kRTCReportingSessionInfoClientType;
    v80[1] = kRTCReportingSessionInfoClientVersion;
    v81[0] = &off_1000FF218;
    v81[1] = &off_1000FF200;
    v80[2] = kRTCReportingSessionInfoSessionID;
    v80[3] = kRTCReportingSessionInfoBatchEvent;
    v81[2] = &off_1000FF1E8;
    v81[3] = &__kCFBooleanFalse;
    v80[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
    v81[4] = &__kCFBooleanTrue;
    v62 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 5));
    v78[0] = kRTCReportingUserInfoClientName;
    v78[1] = kRTCReportingUserInfoServiceName;
    v79[0] = CFSTR("network-service-proxy");
    v79[1] = CFSTR("privacy-proxy-outage-notification");
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 2));
    v73 = 0;
    v64 = +[RTCReporting sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:](RTCReporting, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v62, v63, 1005, 0, v12, &v73);
    v65 = v73;
    v68 = nplog_obj(v65, v66, v67);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    v70 = v69;
    if ((v64 & 1) != 0)
    {
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v75 = (uint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "sent service outage RTC report %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v75 = 1005;
      v76 = 2112;
      v77 = v65;
      _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "failed to send RTC report type: %ld error: %@", buf, 0x16u);
    }

    goto LABEL_92;
  }
LABEL_86:
  v71 = nplog_obj(v16, v17, v18);
  v62 = objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "outageReasonType"));
    *(_DWORD *)buf = 138412290;
    v75 = (uint64_t)v72;
    _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "failed to create RTC report payload for service outage type %@", buf, 0xCu);

  }
  v12 = 0;
LABEL_92:

}

- (BOOL)proxyInfo:(id)a3 matchesProxyIndex:(unint64_t)a4
{
  id v6;
  NSArray *proxyArray;
  NSArray *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v6 = a3;
  if (self)
    proxyArray = self->_proxyArray;
  else
    proxyArray = 0;
  if (-[NSArray count](proxyArray, "count") <= a4)
  {
    v12 = 0;
  }
  else
  {
    if (self)
      v8 = self->_proxyArray;
    else
      v8 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v8, "objectAtIndex:", a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "proxyURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "proxyURL"));
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

  }
  return v12;
}

- (void)sendRTCReportForPrivacyProxyToggleState:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[5];
  _QWORD v34[5];

  v3 = a3;
  v5 = nplog_obj(self, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received RTC report request for toggle state: %u", buf, 8u);
  }

  if (!self)
    goto LABEL_8;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Mosaic"), CFSTR("eventType"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("counter"), CFSTR("type"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &off_1000FF200, CFSTR("value"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("privacy_proxy_toggle_state"), CFSTR("name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("label_privacy-proxy-toggle-state"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13 * 1000.0;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("label_privacy-proxy-report-time"));

  if (v10)
  {
    v33[0] = kRTCReportingSessionInfoClientType;
    v33[1] = kRTCReportingSessionInfoClientVersion;
    v34[0] = &off_1000FF218;
    v34[1] = &off_1000FF200;
    v33[2] = kRTCReportingSessionInfoSessionID;
    v33[3] = kRTCReportingSessionInfoBatchEvent;
    v34[2] = &off_1000FF1E8;
    v34[3] = &__kCFBooleanFalse;
    v33[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
    v34[4] = &__kCFBooleanTrue;
    v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 5));
    v31[0] = kRTCReportingUserInfoClientName;
    v31[1] = kRTCReportingUserInfoServiceName;
    v32[0] = CFSTR("network-service-proxy");
    v32[1] = CFSTR("privacy-proxy-toggle");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    v26 = 0;
    v18 = +[RTCReporting sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:](RTCReporting, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v16, v17, 1006, 0, v10, &v26);
    v19 = v26;
    v22 = nplog_obj(v19, v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = v23;
    if ((v18 & 1) != 0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (uint64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "sent privacy proxy toggle report %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v28 = 1006;
      v29 = 2112;
      v30 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to send RTC report type: %ld error: %@", buf, 0x16u);
    }

  }
  else
  {
LABEL_8:
    v25 = nplog_obj(v7, v8, v9);
    v16 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to create RTC report payload for toggle state", buf, 2u);
    }
    v10 = 0;
  }

}

- (BOOL)isSingleHopProxyAgentRegistered
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  return -[NSPPrivacyProxyAgentManager isSingleHopRegistered](self, "isSingleHopRegistered");
}

- (BOOL)isMultiHopFallbackProxyAgentRegistered
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  return -[NSPPrivacyProxyAgentManager isMultiHopRegistered](self, "isMultiHopRegistered");
}

- (BOOL)isSingleHopFallbackProxyAgentRegistered
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  return -[NSPPrivacyProxyAgentManager isSingleHopRegistered](self, "isSingleHopRegistered");
}

- (void)multiHopAgentRegistered:(id)a3
{
  NSPQuicProxyPath *v4;
  uint64_t v5;
  uint64_t v6;
  NSPQuicProxyPath *v7;
  NSMutableDictionary *preferredQUICProxyPaths;
  NSMutableDictionary *v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  NSPQuicProxyPath *v17;
  NSMutableDictionary *candidatePreferredQUICProxyPaths;
  void *v19;
  void *v20;
  id v21;
  NSPQuicProxyPath *quicProxyPath;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  NSMutableDictionary *networkSpecificQUICProxyPaths;
  NSMutableDictionary *WeakRetained;
  id v34;
  id v35;
  uint64_t v36;
  int *v37;
  void *v38;
  uint64_t v39;
  NSMutableDictionary *v40;
  uint64_t v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  uint64_t isKindOfClass;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  __int128 v57;
  id *p_isa;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  uint64_t v69;
  _BYTE v70[128];

  v4 = (NSPQuicProxyPath *)a3;
  v7 = v4;
  if (!self)
  {
    if (v4)
    {
      preferredQUICProxyPaths = 0;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      goto LABEL_5;
    }
    goto LABEL_64;
  }
  if (self->_quicProxyPath == v4)
  {
LABEL_64:
    v55 = nplog_obj(v4, v5, v6);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "quic proxy path, multi hop agent registered", buf, 2u);
    }

    if (self)
      WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
    else
      WeakRetained = 0;
    -[NSMutableDictionary multiHopProxyAgentRegistered:](WeakRetained, "multiHopProxyAgentRegistered:", 1);
    goto LABEL_69;
  }
  if ((NSPQuicProxyPath *)self->_fallbackProxyPath != v4)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
LABEL_5:
    v9 = preferredQUICProxyPaths;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v64;
      *(_QWORD *)&v11 = 138412290;
      v57 = v11;
      p_isa = (id *)&v9->super.super.isa;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v64 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v14);
          if (self)
            v16 = self->_preferredQUICProxyPaths;
          else
            v16 = 0;
          v17 = (NSPQuicProxyPath *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v14), v57));

          if (v17 == v7)
          {
            if (self)
              candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
            else
              candidatePreferredQUICProxyPaths = 0;
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](candidatePreferredQUICProxyPaths, "objectForKeyedSubscript:", v15));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preferredPathPatterns"));
            v21 = objc_msgSend(v20, "count");

            if (v21)
            {
              if (self)
                quicProxyPath = self->_quicProxyPath;
              else
                quicProxyPath = 0;
              -[NSPQuicProxyPath resetMultiHopProxyAgent](quicProxyPath, "resetMultiHopProxyAgent");
            }
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "domainFilter"));
            v26 = (void *)v23;
            if (v23)
            {
              v27 = nplog_obj(v23, v24, v25);
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v57;
                v69 = v15;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Preferred QUIC proxy path for \"%@\", multi hop agent registered", buf, 0xCu);
              }

              if (self)
                v29 = objc_loadWeakRetained((id *)&self->_delegate);
              else
                v29 = 0;
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](v7, "nonDefaultAgentUUID"));
              objc_msgSend(v29, "preferredProxyAgentRegistered:agentUUID:domainFilter:", v15, v30, v26);

              v9 = (NSMutableDictionary *)p_isa;
            }

          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v31 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        v12 = v31;
      }
      while (v31);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    if (self)
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
    else
      networkSpecificQUICProxyPaths = 0;
    WeakRetained = networkSpecificQUICProxyPaths;
    v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](WeakRetained, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v60;
      v37 = &OBJC_IVAR___NSPPrivacyProxyAgentManager__badTokenCount;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v60 != v36)
            objc_enumerationMutation(WeakRetained);
          v39 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v38);
          if (self)
            v40 = self->_networkSpecificQUICProxyPaths;
          else
            v40 = 0;
          v41 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v40, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v38)));
          v42 = (void *)v41;
          if (v41)
            v43 = v41 == (_QWORD)v7;
          else
            v43 = 0;
          if (v43)
          {
            v44 = objc_opt_class(v37 + 590);
            isKindOfClass = objc_opt_isKindOfClass(v7, v44);
            if ((isKindOfClass & 1) != 0)
            {
              v48 = nplog_obj(isKindOfClass, v46, v47);
              v49 = objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Network discovered QUIC proxy path registered", buf, 2u);
              }

              if (self)
                v50 = objc_loadWeakRetained((id *)&self->_delegate);
              else
                v50 = 0;
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](v7, "nonDefaultAgentUUID"));
              objc_msgSend(v50, "networkDiscoveredProxyPaths:registeredForAgentUUID:", v39, v51);

              v37 = &OBJC_IVAR___NSPPrivacyProxyAgentManager__badTokenCount;
            }
          }

          v38 = (char *)v38 + 1;
        }
        while (v35 != v38);
        v52 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](WeakRetained, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        v35 = v52;
      }
      while (v52);
    }
    goto LABEL_69;
  }
  v53 = nplog_obj(v4, v5, v6);
  v54 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "fallback proxy path, multi hop agent registered", buf, 2u);
  }

  WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSMutableDictionary multiHopFallbackProxyAgentRegistered:](WeakRetained, "multiHopFallbackProxyAgentRegistered:", 1);
LABEL_69:

}

- (void)singleHopAgentRegistered:(id)a3
{
  NSPQuicProxyPath *v4;
  uint64_t v5;
  uint64_t v6;
  NSPQuicProxyPath *v7;
  NSPFallbackProxyPath *fallbackProxyPath;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = (NSPQuicProxyPath *)a3;
  v7 = v4;
  if (self)
  {
    if (self->_quicProxyPath != v4)
    {
      fallbackProxyPath = self->_fallbackProxyPath;
      goto LABEL_4;
    }
LABEL_12:
    v11 = nplog_obj(v4, v5, v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "quic proxy path, single hop agent registered", buf, 2u);
    }

    if (self)
      self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
    -[NSPPrivacyProxyAgentManager singleHopProxyAgentRegistered:](self, "singleHopProxyAgentRegistered:", 1);
    goto LABEL_17;
  }
  if (!v4)
    goto LABEL_12;
  fallbackProxyPath = 0;
LABEL_4:
  if (fallbackProxyPath == (NSPFallbackProxyPath *)v4)
  {
    v9 = nplog_obj(v4, v5, v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "fallback proxy path, single hop agent registered", v13, 2u);
    }

    if (self)
      self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
    -[NSPPrivacyProxyAgentManager singleHopFallbackProxyAgentRegistered:](self, "singleHopFallbackProxyAgentRegistered:", 1);
LABEL_17:

  }
}

- (void)obliviousHopAgentRegistered:(id)a3 hostname:(id)a4 processes:(id)a5 agentUUID:(id)a6
{
  id v9;
  id v10;
  id v11;

  v11 = a4;
  v9 = a5;
  v10 = a6;
  if (self)
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSPPrivacyProxyAgentManager obliviousHopAgentRegisteredForHostname:processes:agentUUID:](self, "obliviousHopAgentRegisteredForHostname:processes:agentUUID:", v11, v9, v10);

}

- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (self)
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  v8 = -[NSPPrivacyProxyAgentManager configurationFetchDateIsWithinStart:end:](self, "configurationFetchDateIsWithinStart:end:", v6, v7);

  return v8;
}

- (void)proxiedContentAgentRegistered:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolverAgentUUID"));
  if (v4)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolverAgentUUID"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "quicAgentUUID"));
  v6 = (void *)v5;

  if (self)
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "associatedMaps"));
  -[NSPPrivacyProxyAgentManager proxiedContentMaps:registeredForAgentUUID:](self, "proxiedContentMaps:registeredForAgentUUID:", v7, v6);

}

- (void)multiHopAgentUnregistered:(id)a3
{
  NSPQuicProxyPath *v4;
  uint64_t v5;
  uint64_t v6;
  NSPQuicProxyPath *v7;
  NSMutableDictionary *preferredQUICProxyPaths;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSPQuicProxyPath *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  NSMutableDictionary *networkSpecificQUICProxyPaths;
  NSMutableDictionary *WeakRetained;
  id v26;
  id v27;
  uint64_t v28;
  int *v29;
  void *v30;
  uint64_t v31;
  NSMutableDictionary *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSMutableDictionary *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  _BYTE v67[128];

  v4 = (NSPQuicProxyPath *)a3;
  v7 = v4;
  if (!self)
  {
    if (v4)
    {
      preferredQUICProxyPaths = 0;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      goto LABEL_5;
    }
    goto LABEL_57;
  }
  if (self->_quicProxyPath == v4)
  {
LABEL_57:
    v52 = nplog_obj(v4, v5, v6);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "quic proxy path, multihop agent unregistered", buf, 2u);
    }

    if (self)
      WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
    else
      WeakRetained = 0;
    -[NSMutableDictionary multiHopProxyAgentRegistered:](WeakRetained, "multiHopProxyAgentRegistered:", 0);
    goto LABEL_62;
  }
  if ((NSPQuicProxyPath *)self->_fallbackProxyPath != v4)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
LABEL_5:
    v9 = preferredQUICProxyPaths;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v61;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v61 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v13);
          if (self)
            v15 = self->_preferredQUICProxyPaths;
          else
            v15 = 0;
          v16 = (NSPQuicProxyPath *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v13)));

          if (v16 == v7)
          {
            v20 = nplog_obj(v17, v18, v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v14;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Preferred QUIC proxy path for \"%@\", multi hop agent unregistered", buf, 0xCu);
            }

            if (self)
              v22 = objc_loadWeakRetained((id *)&self->_delegate);
            else
              v22 = 0;
            objc_msgSend(v22, "preferredProxyAgentUnregistered:", v14);

          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        v11 = v23;
      }
      while (v23);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    if (self)
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
    else
      networkSpecificQUICProxyPaths = 0;
    WeakRetained = networkSpecificQUICProxyPaths;
    v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](WeakRetained, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v57;
      v29 = &OBJC_IVAR___NSPPrivacyProxyAgentManager__badTokenCount;
      v54 = *(_QWORD *)v57;
      v55 = WeakRetained;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v57 != v28)
            objc_enumerationMutation(WeakRetained);
          v31 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v30);
          if (self)
            v32 = self->_networkSpecificQUICProxyPaths;
          else
            v32 = 0;
          v33 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v32, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v30)));
          v34 = (void *)v33;
          if (v33)
            v35 = v33 == (_QWORD)v7;
          else
            v35 = 0;
          if (v35)
          {
            v36 = objc_opt_class(v29 + 590);
            if ((objc_opt_isKindOfClass(v7, v36) & 1) != 0)
            {
              v37 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v7, "ingressProxy"));
              v38 = (void *)v37;
              if (v37)
                v39 = *(void **)(v37 + 24);
              else
                v39 = 0;
              v40 = v39;
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "vendor"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Agent_%@_%@"), v31, v41));

              v46 = nplog_obj(v43, v44, v45);
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v66 = v42;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Network Discovered QUIC proxy path for \"%@\", multi hop agent unregistered", buf, 0xCu);
              }

              v28 = v54;
              WeakRetained = v55;
              if (self)
                v48 = objc_loadWeakRetained((id *)&self->_delegate);
              else
                v48 = 0;
              objc_msgSend(v48, "preferredProxyAgentUnregistered:", v42);

              v29 = &OBJC_IVAR___NSPPrivacyProxyAgentManager__badTokenCount;
            }
          }

          v30 = (char *)v30 + 1;
        }
        while (v27 != v30);
        v49 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](WeakRetained, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        v27 = v49;
      }
      while (v49);
    }
    goto LABEL_62;
  }
  v50 = nplog_obj(v4, v5, v6);
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "fallback proxy path, multihop agent unregistered", buf, 2u);
  }

  WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSMutableDictionary multiHopFallbackProxyAgentRegistered:](WeakRetained, "multiHopFallbackProxyAgentRegistered:", 0);
LABEL_62:

}

- (void)singleHopAgentUnregistered:(id)a3
{
  NSPQuicProxyPath *v4;
  uint64_t v5;
  uint64_t v6;
  NSPQuicProxyPath *v7;
  NSPFallbackProxyPath *fallbackProxyPath;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = (NSPQuicProxyPath *)a3;
  v7 = v4;
  if (self)
  {
    if (self->_quicProxyPath != v4)
    {
      fallbackProxyPath = self->_fallbackProxyPath;
      goto LABEL_4;
    }
LABEL_12:
    v11 = nplog_obj(v4, v5, v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "quic proxy path, single hop agent unregistered", buf, 2u);
    }

    if (self)
      self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
    -[NSPPrivacyProxyAgentManager singleHopProxyAgentRegistered:](self, "singleHopProxyAgentRegistered:", 0);
    goto LABEL_17;
  }
  if (!v4)
    goto LABEL_12;
  fallbackProxyPath = 0;
LABEL_4:
  if (fallbackProxyPath == (NSPFallbackProxyPath *)v4)
  {
    v9 = nplog_obj(v4, v5, v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "fallback proxy path, single hop agent unregistered", v13, 2u);
    }

    if (self)
      self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
    -[NSPPrivacyProxyAgentManager singleHopFallbackProxyAgentRegistered:](self, "singleHopFallbackProxyAgentRegistered:", 0);
LABEL_17:

  }
}

- (void)obliviousHopAgentUnregistered:(id)a3 hostname:(id)a4 agentUUID:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if (self)
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSPPrivacyProxyAgentManager obliviousHopAgentUnregisteredForHostname:agentUUID:](self, "obliviousHopAgentUnregisteredForHostname:agentUUID:", v8, v7);

}

- (void)proxiedContentAgentUnregistered:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolverAgentUUID"));
  if (v5)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolverAgentUUID"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "quicAgentUUID"));
  v7 = (id)v6;

  if (self)
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSPPrivacyProxyAgentManager proxiedContentMapsUnregisteredForAgentUUID:](self, "proxiedContentMapsUnregisteredForAgentUUID:", v7);

}

- (void)reportProxySuccessOnInterface:(id)a3 proxyPath:(id)a4
{
  NSPQuicProxyPath *v6;
  NSPQuicProxyPath *v7;
  NSPToggleStats *v8;
  _QWORD *v9;
  NSPToggleStats *toggleStats;
  id WeakRetained;
  id v12;

  v12 = a3;
  v6 = (NSPQuicProxyPath *)a4;
  v7 = v6;
  if (!self)
  {
    toggleStats = 0;
    WeakRetained = 0;
    if (v6)
      goto LABEL_13;
LABEL_9:
    v8 = toggleStats;
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats primaryPathStatistics](v8, "primaryPathStatistics"));
    if (!v9)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (self->_probingReason == 2)
  {
    sub_100026F10((uint64_t)self);
    -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
    -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
  }
  if (self->_quicProxyPath == v7)
  {
    toggleStats = self->_toggleStats;
    goto LABEL_9;
  }
  if ((NSPQuicProxyPath *)self->_fallbackProxyPath == v7)
  {
    v8 = self->_toggleStats;
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats fallbackPathStatistics](v8, "fallbackPathStatistics"));
    if (!v9)
    {

      goto LABEL_12;
    }
LABEL_10:
    ++v9[2];
LABEL_11:

    if (!self)
    {
      WeakRetained = 0;
      goto LABEL_13;
    }
  }
LABEL_12:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
LABEL_13:
  objc_msgSend(WeakRetained, "reportPrivacyProxySuccessOnInterface:", v12);

  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
}

- (id)lastProxyOutageReason
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_lastProxyOutageReasonStats;
  return self;
}

- (void)reportObliviousPathError:(int)a3 interface:(id)a4 obliviousPath:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  void *v27;
  NWInterface *proberInterface;
  id v29;
  void *v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  NSMutableArray *penalizedObliviousProxyIndices;
  NSMutableArray *v48;
  NSMutableArray *v49;
  NSMutableArray *v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  void *v54;

  v6 = *(_QWORD *)&a3;
  v52 = a4;
  v8 = a5;
  v9 = v8;
  if ((_DWORD)v6)
  {
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "proxyInfo"));
    v11 = v10;
    if (v10)
      v10 = (_QWORD *)v10[3];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "proxyURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));

    v14 = objc_alloc_init((Class)NSURLComponents);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scheme"));
    objc_msgSend(v14, "setScheme:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "host"));
    objc_msgSend(v14, "setHost:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "port"));
    objc_msgSend(v14, "setPort:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "obliviousTarget"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "proxyURLPath"));
    objc_msgSend(v14, "setPath:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));
    -[NSPPrivacyProxyAgentManager sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:](self, "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:", 1007, v6, v21, 0, 0);

    if ((int)v6 > 60)
    {
      if ((int)v6 > 1105)
      {
        switch((_DWORD)v6)
        {
          case 0x452:
            v22 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
            if (v22)
              ++v22[10];
            goto LABEL_41;
          case 0x515:
            v22 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
            if (v22)
              ++v22[14];
            goto LABEL_41;
          case 0x516:
            v22 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
            if (v22)
              ++v22[15];
            goto LABEL_41;
        }
      }
      else
      {
        if ((_DWORD)v6 == 61)
        {
          v22 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
          if (v22)
            ++v22[4];
          goto LABEL_41;
        }
        if ((_DWORD)v6 == 80 || (_DWORD)v6 == 1104)
        {
          v24 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
          if (v24)
            ++v24[7];

          v25 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
          if (v25)
          {
            v26 = v25[7];

            if (v26 >= 2)
            {
              if (self)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](self->_path, "interface"));
                objc_storeStrong((id *)&self->_proberInterface, v27);

                proberInterface = self->_proberInterface;
              }
              else
              {

                proberInterface = 0;
              }
              sub_100036084((uint64_t)self, proberInterface, 6);
            }
          }
          goto LABEL_42;
        }
      }
    }
    else
    {
      if ((v6 + 65568) <= 0x1E)
      {
        if (((1 << (v6 + 32)) & 0x4004C000) != 0)
        {
          v22 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
          if (v22)
            ++v22[9];
LABEL_41:

LABEL_42:
          goto LABEL_43;
        }
        if ((_DWORD)v6 == -65568)
        {
          v22 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
          if (v22)
            ++v22[8];
          goto LABEL_41;
        }
      }
      if ((_DWORD)v6 == 60)
      {
        v22 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
        if (v22)
          ++v22[3];
        goto LABEL_41;
      }
    }
    v22 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statistics"));
    if (v22)
      ++v22[7];
    goto LABEL_41;
  }
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statistics"));
  v13 = (void *)v23;
  if (v23)
    ++*(_QWORD *)(v23 + 16);
LABEL_43:

  if (objc_msgSend(v9, "shouldBePenalized"))
  {
    v29 = v9;
    v30 = v29;
    if (self)
    {
      if (v29)
      {
        v31 = -[NSArray count](self->_proxyArray, "count");
        if (v31)
        {
          v32 = v31;
          v33 = 0;
          v34 = 0;
          while (1)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_proxyArray, "objectAtIndex:", v33));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "proxyURL"));
            v37 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "proxyInfo"));
            v38 = v37;
            if (v37)
              v37 = (_QWORD *)v37[3];
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "proxyURL"));
            v40 = objc_msgSend(v36, "isEqualToString:", v39);

            if ((v40 & 1) != 0)
              break;
            v33 = (v34 + 1);
            v34 = v33;
            if (v32 <= v33)
              goto LABEL_58;
          }
          v44 = nplog_obj(v41, v42, v43);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "shortName"));
            *(_DWORD *)buf = 138412290;
            v54 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Penalizing oblivious path %@", buf, 0xCu);

          }
          penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
          if (!penalizedObliviousProxyIndices)
          {
            v48 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
            v49 = self->_penalizedObliviousProxyIndices;
            self->_penalizedObliviousProxyIndices = v48;

            penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
          }
          v50 = penalizedObliviousProxyIndices;
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v34));
          -[NSMutableArray addObject:](v50, "addObject:", v51);

          sub_10002C510((uint64_t)self);
        }
      }
    }
LABEL_58:

  }
}

- (void)reportProxiedContentPathError:(int)a3 interface:(id)a4 proxiedContentPath:(id)a5 registration:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSPPrivacyProxyAgentManager *v16;
  uint64_t v17;
  id v18;

  v8 = *(_QWORD *)&a3;
  v18 = a4;
  v10 = a5;
  v11 = a6;
  if ((_DWORD)v8)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "quicRegistration"));

    if (v12 == v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ingressProxy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "egressProxy"));
      v16 = self;
      v17 = 1000;
      goto LABEL_6;
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fallbackRegistration"));

    if (v13 == v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ingressProxy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "egressProxy"));
      v16 = self;
      v17 = 1001;
LABEL_6:
      -[NSPPrivacyProxyAgentManager sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:](v16, "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:", v17, v8, 0, v14, v15);

    }
  }

}

- (void)reportProxyError:(int)a3 interface:(id)a4 proxyPath:(id)a5
{
  void *v5;
  NSDate *v6;
  uint64_t v8;
  NSDate *v10;
  NSPFallbackProxyPath *v11;
  NSDate *v12;
  uint64_t v13;
  NSMutableDictionary *networkSpecificQUICProxyPaths;
  NSMutableDictionary *v15;
  id v16;
  void *v17;
  NSMutableDictionary *v18;
  NSDate *v19;
  id v20;
  _QWORD *v21;
  NSPToggleStats *toggleStats;
  uint64_t v23;
  NSDate *v24;
  NSDate *v25;
  NWPath *v26;
  NSDate *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  NWPath *v35;
  void *v36;
  void *v37;
  NSDate *v38;
  void *v39;
  NSDate *v40;
  void *v41;
  int v42;
  NSPQuicProxyPath *v43;
  NSDate *v44;
  NSDate *v45;
  NSDate *v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  NSPFallbackProxyPath *v60;
  void *v61;
  int v62;
  void *v63;
  _QWORD *v64;
  void *quicProxyPath;
  NSPQuicProxyPath *v66;
  NSDate *v67;
  NSDate *v68;
  NSDate *v69;
  void *v70;
  double v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  NSPFallbackProxyPath *v83;
  void *v84;
  int v85;
  void *v86;
  _QWORD *v87;
  void *v88;
  NSDate *v89;
  NSDate *v90;
  void *v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  NSPQuicProxyPath *v104;
  void *v105;
  int v106;
  void *v107;
  _QWORD *v108;
  _QWORD *v109;
  uint64_t v110;
  NSPFallbackProxyPath *v111;
  NSDate *v112;
  NSDate *v113;
  NSDate *v114;
  void *v115;
  double v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  NSPFallbackProxyPath *v122;
  void *v123;
  int v124;
  NSPFallbackProxyPath *v125;
  void *v126;
  _QWORD *v127;
  void *v128;
  NSDate *v129;
  NSDate *v130;
  NWPath *v131;
  int v132;
  NSDate *v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  NSDate *v144;
  void *v145;
  NSDate *v146;
  void *v147;
  NSDate *v148;
  NSDate *v149;
  NWPath *v150;
  NSDate *v151;
  NSDate *v152;
  double v153;
  NSDate *v154;
  NSDate *v155;
  void *v156;
  double v157;
  double v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  _QWORD *v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  NSObject *v168;
  NSPQuicProxyPath *v169;
  void *v170;
  int v171;
  void *v172;
  _QWORD *v173;
  _QWORD *v174;
  NSDate *v175;
  NSDate *v176;
  NWPathStatus v177;
  uint64_t v178;
  uint64_t v179;
  NSPQuicProxyPath *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  NSPQuicProxyPath *v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  NSDate *v188;
  uint64_t v189;
  uint64_t v190;
  NSPFallbackProxyPath *v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  _QWORD *v196;
  uint64_t v197;
  unint64_t v198;
  BOOL v199;
  int64_t v200;
  uint64_t v201;
  _QWORD *v202;
  _QWORD *v203;
  _QWORD *v204;
  _QWORD *v205;
  NSDate *v206;
  NSDate *v207;
  NWPath *v208;
  int v209;
  NSDate *v210;
  NSDate *v211;
  double v212;
  NSDate *v213;
  NSDate *v214;
  NWPath *v215;
  int linkQuality;
  NSDate *v217;
  NSDate *v218;
  double v219;
  uint64_t v220;
  NSObject *v221;
  NSDate *v222;
  void *v223;
  const char *v224;
  NSDate *v225;
  double v226;
  NSDate *v227;
  id v228;
  void *v229;
  BOOL v230;
  uint64_t v231;
  uint64_t v232;
  NSObject *v233;
  NWPathStatus v234;
  int64_t v235;
  uint64_t v236;
  _QWORD *v237;
  void *v238;
  NSDate *v239;
  NSDate *v240;
  void *v241;
  double v242;
  double v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  NSPQuicProxyPath *v247;
  void *v248;
  int v249;
  NSPQuicProxyPath *v250;
  void *v251;
  _QWORD *v252;
  _QWORD *v253;
  uint64_t v254;
  NSObject *v255;
  NSDate *v256;
  void *v257;
  const char *v258;
  int64_t v259;
  uint64_t v260;
  _QWORD *v261;
  uint64_t v262;
  int64_t probingReason;
  uint64_t v264;
  _QWORD *v265;
  void *fallbackProxyPath;
  NSDate *v267;
  double v268;
  BOOL v269;
  NSPQuicProxyPath *v270;
  uint64_t v271;
  void *v272;
  uint64_t v273;
  NSPQuicProxyPath *v274;
  _QWORD *v275;
  void *v276;
  uint64_t v277;
  NSPFallbackProxyPath *v278;
  NSPFallbackProxyPath *v279;
  NSDate *v280;
  NSPFallbackProxyPath *v281;
  uint64_t v282;
  void *v283;
  uint64_t v284;
  _QWORD *v285;
  uint64_t v286;
  unint64_t v287;
  BOOL v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  NSObject *v293;
  NSDate *v294;
  void *v295;
  void *v296;
  void *v297;
  NSDate *v298;
  void *v299;
  NSDate *v300;
  void *v301;
  void *v302;
  int64_t v303;
  NSPQuicProxyPath *v304;
  uint64_t v305;
  void *v306;
  uint64_t v307;
  NSPQuicProxyPath *v308;
  uint64_t v309;
  void *v310;
  uint64_t v311;
  uint64_t v312;
  NSPFallbackProxyPath *v313;
  uint64_t v314;
  void *v315;
  uint64_t v316;
  uint64_t v317;
  _QWORD *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  _QWORD *v322;
  _QWORD *v323;
  _QWORD *v324;
  _QWORD *v325;
  _QWORD *v326;
  unint64_t v327;
  int64_t v328;
  uint64_t v329;
  _QWORD *v330;
  void *v331;
  id v332;
  void *v333;
  int64_t v334;
  uint64_t v335;
  _QWORD *v336;
  uint64_t v337;
  NSObject *v338;
  uint64_t v339;
  NSDate *v340;
  void *v341;
  const char *v342;
  _QWORD *v343;
  unint64_t v344;
  int64_t v345;
  uint64_t v346;
  _QWORD *v347;
  _QWORD *v348;
  uint64_t v349;
  void *v350;
  NSDate *v351;
  double v352;
  BOOL v353;
  NSDate *v354;
  double v355;
  BOOL v356;
  NSDate *v357;
  double v358;
  BOOL v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  NSObject *v364;
  void *v365;
  void *v366;
  NSDate *v367;
  uint64_t v368;
  NSDate *v369;
  void *v370;
  void *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  NSObject *v376;
  void *v377;
  void *v378;
  NSDate *v379;
  uint64_t v380;
  NSDate *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  NSPFallbackProxyPath *v386;
  uint64_t v387;
  void *v388;
  uint64_t v389;
  _QWORD *v390;
  uint64_t v391;
  unint64_t v392;
  int64_t v393;
  uint64_t v394;
  _QWORD *v395;
  _QWORD *v396;
  NSMutableDictionary *v397;
  id v398;
  id v399;
  uint64_t v400;
  void *v401;
  NSDate *v402;
  _QWORD *v403;
  unint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  NSObject *v409;
  NSDate *v410;
  uint64_t v411;
  void *v412;
  void *v413;
  id v414;
  void *v415;
  id v416;
  id v417;
  void *v418;
  id v419;
  id v420;
  void *v421;
  id v422;
  id v423;
  void *v424;
  id v425;
  void *v426;
  BOOL v427;
  NSPQuicProxyPath *v428;
  uint64_t v429;
  void *v430;
  uint64_t v431;
  NSPQuicProxyPath *v432;
  uint64_t v433;
  void *v434;
  uint64_t v435;
  uint64_t v436;
  NSPFallbackProxyPath *v437;
  uint64_t v438;
  void *v439;
  uint64_t v440;
  uint64_t v441;
  _QWORD *v442;
  uint64_t v443;
  unint64_t v444;
  int64_t v445;
  uint64_t v446;
  _QWORD *v447;
  _QWORD *v448;
  _QWORD *v449;
  _QWORD *v450;
  NSPFallbackProxyPath *v451;
  uint64_t v452;
  void *v453;
  uint64_t v454;
  NSPFallbackProxyPath *v455;
  _QWORD *v456;
  void *v457;
  uint64_t v458;
  NSPFallbackProxyPath *v459;
  int64_t v460;
  uint64_t v461;
  _QWORD *v462;
  _QWORD *v463;
  _QWORD *v464;
  _QWORD *v465;
  NSPFallbackProxyPath *v466;
  uint64_t v467;
  void *v468;
  uint64_t v469;
  NSPFallbackProxyPath *v470;
  _QWORD *v471;
  void *v472;
  uint64_t v473;
  NSPFallbackProxyPath *v474;
  int64_t v475;
  uint64_t v476;
  _QWORD *v477;
  _QWORD *v478;
  _QWORD *v479;
  _QWORD *v480;
  uint64_t v481;
  NSPQuicProxyPath *v482;
  uint64_t v483;
  void *v484;
  uint64_t v485;
  _QWORD *v486;
  uint64_t v487;
  unint64_t v488;
  NSMutableDictionary *v489;
  id v490;
  id v491;
  uint64_t v492;
  void *v493;
  NSDate *v494;
  _QWORD *v495;
  unint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  NSObject *v501;
  uint64_t v502;
  void *v503;
  uint64_t v504;
  void *v505;
  id v506;
  void *v507;
  id v508;
  uint64_t v509;
  NSPQuicProxyPath *v510;
  uint64_t v511;
  void *v512;
  uint64_t v513;
  _QWORD *v514;
  uint64_t v515;
  unint64_t v516;
  NSMutableDictionary *v517;
  id v518;
  id v519;
  uint64_t v520;
  void *v521;
  NSDate *v522;
  _QWORD *v523;
  unint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  NSObject *v529;
  uint64_t v530;
  void *v531;
  uint64_t v532;
  void *v533;
  id v534;
  void *v535;
  id v536;
  void *v537;
  void *v538;
  void *v539;
  void *v540;
  NWPathStatus v541;
  NWPathStatus v542;
  NWPathStatus v543;
  NSDate *v544;
  NWPath *v545;
  NWPath *v546;
  NWPath *v547;
  id v548;
  NWPathStatus v549;
  NSDate *v550;
  NSDate *v551;
  NWPath *v552;
  NWPath *v553;
  NSDate *v554;
  NSMutableDictionary *v555;
  NSMutableDictionary *v556;
  NSPPrivacyProxyAgentManager *v557;
  NWPathStatus v558;
  NWPath *v559;
  NSDate *v560;
  NSDate *v561;
  NSDate *v562;
  NSDate *v563;
  NSDate *v564;
  NSDate *v565;
  NSDate *v566;
  NSDate *v567;
  NSDate *v568;
  NSDate *v569;
  NSDate *v570;
  id v571;
  NWPath *v572;
  NSDate *v573;
  NWPath *v574;
  NSDate *v575;
  NWPath *v576;
  NSDate *v577;
  void *v578;
  NSDate *v579;
  NSDate *v580;
  NSDate *v581;
  NSDate *v582;
  NSDate *v583;
  NSDate *v584;
  NSDate *v585;
  NSDate *v586;
  NSDate *v587;
  NSDate *v588;
  unsigned int v589;
  NSDate *v590;
  NSDate *v591;
  NSDate *v592;
  unsigned int v593;
  unsigned int v594;
  unsigned int v595;
  NSDate *v596;
  NSDate *v597;
  NSDate *v598;
  NSDate *v599;
  NSDate *v600;
  NSDate *v601;
  NSDate *v602;
  NSDate *v603;
  uint64_t v604;
  uint64_t v605;
  NSDate *v606;
  uint64_t v607;
  NSDate *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  NSDate *v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  NSDate *v617;
  NSDate *v618;
  NSDate *v619;
  _QWORD *v620;
  _QWORD *v621;
  _QWORD *v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  uint8_t v631[128];
  uint8_t v632[4];
  void *v633;
  uint8_t buf[4];
  NWPathStatus v635;
  __int16 v636;
  void *v637;
  __int16 v638;
  void *v639;
  __int16 v640;
  void *v641;
  __int16 v642;
  uint64_t v643;
  __int16 v644;
  void *v645;

  v8 = *(_QWORD *)&a3;
  v10 = (NSDate *)a4;
  v11 = (NSPFallbackProxyPath *)a5;
  v12 = (NSDate *)v11;
  if (self)
  {
    if ((NSPFallbackProxyPath *)self->_quicProxyPath != v11)
    {
      if (self->_fallbackProxyPath == v11)
      {
        a5 = self->_toggleStats;
        v21 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "fallbackPathStatistics"));

        v23 = 1001;
        goto LABEL_26;
      }
      if (!-[NSPPrivacyProxyAgentManager networkDiscoveredProxyPresentInAgentManager](self, "networkDiscoveredProxyPresentInAgentManager"))
      {
        v21 = 0;
        v23 = 0;
        goto LABEL_26;
      }
      v13 = v8;
      v625 = 0u;
      v626 = 0u;
      v623 = 0u;
      v624 = 0u;
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
      goto LABEL_6;
    }
    toggleStats = self->_toggleStats;
LABEL_20:
    a5 = toggleStats;
    v21 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "primaryPathStatistics"));

    v23 = 1000;
    goto LABEL_26;
  }
  v13 = v8;
  a5 = v11;
  if (!v11)
  {
    toggleStats = 0;
    v12 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(0, "networkDiscoveredProxyPresentInAgentManager") & 1) != 0)
  {
    networkSpecificQUICProxyPaths = 0;
    v625 = 0u;
    v626 = 0u;
    v623 = 0u;
    v624 = 0u;
LABEL_6:
    v15 = networkSpecificQUICProxyPaths;
    v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v623, v631, 16);
    if (v16)
    {
      a5 = v16;
      v5 = *(void **)v624;
      do
      {
        v17 = 0;
        do
        {
          if (*(void **)v624 != v5)
            objc_enumerationMutation(v15);
          if (self)
            v18 = self->_networkSpecificQUICProxyPaths;
          else
            v18 = 0;
          v19 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v18, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v623 + 1) + 8 * (_QWORD)v17)));
          if (v19 == v12)
          {
            v21 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSDate networkMultiHopAgentStatistics](v12, "networkMultiHopAgentStatistics"));

            goto LABEL_24;
          }

          v17 = (char *)v17 + 1;
        }
        while (a5 != v17);
        v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v623, v631, 16);
        a5 = v20;
      }
      while (v20);
    }
    v21 = 0;
LABEL_24:

    v23 = 0;
    goto LABEL_25;
  }
  v21 = 0;
  v23 = 0;
LABEL_25:
  v8 = v13;
LABEL_26:
  if ((int)v8 > 1199)
  {
    if ((v8 - 1200) > 7)
      goto LABEL_86;
    v42 = 1 << (v8 + 80);
    if ((v42 & 0x51) != 0)
      goto LABEL_60;
    if ((v42 & 0xA2) == 0)
    {
LABEL_86:
      if ((_DWORD)v8 == 1301)
      {
        if (!v21)
          goto LABEL_361;
        v110 = 14;
      }
      else
      {
        if ((_DWORD)v8 != 1302)
          goto LABEL_168;
        if (!v21)
          goto LABEL_361;
        v110 = 15;
      }
LABEL_360:
      ++v21[v110];
      goto LABEL_361;
    }
    v43 = v12;
    v44 = v10;
    if (self)
    {
      if (self->_quicProxyPath == v43)
      {
        v154 = self->_lastQuicProxySwitchedDate;
        if (!v154
          || (v155 = v154,
              v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
              objc_msgSend(v156, "timeIntervalSinceDate:", self->_lastQuicProxySwitchedDate),
              v158 = v157,
              v156,
              v155,
              v158 > 30.0))
        {
          v162 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
          if (!v162)
            goto LABEL_226;
          v163 = v162[12];

          if (v163 < 6)
            goto LABEL_226;
          v604 = v23;
          v167 = nplog_obj(v164, v165, v166);
          v168 = objc_claimAutoreleasedReturnValue(v167);
          if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_INFO, "Quic proxy multihop path is reporting origin proxy error", buf, 2u);
          }

          v169 = self->_quicProxyPath;
          v170 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v169, "egressProxy"));
          v171 = sub_100027C1C((id *)&self->super.isa, v170, self->_proxyPathCustomEnumerator);

          if (v171)
          {
            v172 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self->_quicProxyPath, "egressProxy"));
            -[NSPPrivacyProxyAgentManager switchProxy:](self, "switchProxy:", v172);

            v173 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
            if (v173)
              v173[12] = 0;

            quicProxyPath = self->_quicProxyPath;
LABEL_133:
            v174 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(quicProxyPath, "networkSingleHopAgentStatistics"));
            v23 = v604;
            if (!v174)
            {
LABEL_135:

              goto LABEL_226;
            }
LABEL_134:
            v174[12] = 0;
            goto LABEL_135;
          }
          probingReason = self->_probingReason;
          v23 = v604;
          if (probingReason == 1)
            goto LABEL_226;
          if (!probingReason)
          {
            sub_100036224((id *)&self->super.isa, CFSTR("ProxyPrimaryOriginError"));
            sub_1000364B4((uint64_t)self, 1, v264);
            v265 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
            if (v265)
              v265[12] = 0;

            fallbackProxyPath = self->_quicProxyPath;
LABEL_304:
            v174 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(fallbackProxyPath, "networkSingleHopAgentStatistics"));
            if (!v174)
              goto LABEL_135;
            goto LABEL_134;
          }
          v350 = self->_quicProxyPath;
LABEL_407:
          objc_msgSend(v350, "resetError");
          goto LABEL_226;
        }
        v254 = nplog_obj(v159, v160, v161);
        v255 = objc_claimAutoreleasedReturnValue(v254);
        if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
        {
          v609 = v23;
          v256 = self->_lastQuicProxySwitchedDate;
          v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v256, 1, 2));
          *(_DWORD *)buf = 138412290;
          v635 = (NWPathStatus)v257;
          v258 = "ignoring origin quic proxy error, last quic proxy switched date %@";
LABEL_224:
          _os_log_impl((void *)&_mh_execute_header, v255, OS_LOG_TYPE_INFO, v258, buf, 0xCu);

          v23 = v609;
        }
LABEL_225:

        goto LABEL_226;
      }
      if ((NSPQuicProxyPath *)self->_fallbackProxyPath == v43)
      {
        v45 = self->_lastFallbackProxySwitchedDate;
        if (!v45
          || (v46 = v45,
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
              objc_msgSend(v47, "timeIntervalSinceDate:", self->_lastFallbackProxySwitchedDate),
              v49 = v48,
              v47,
              v46,
              v49 > 30.0))
        {
          v53 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
          if (!v53)
            goto LABEL_226;
          v54 = v53[12];

          if (v54 < 6)
            goto LABEL_226;
          v604 = v23;
          v58 = nplog_obj(v55, v56, v57);
          v59 = objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Fallback proxy multihop path is reporting origin proxy error", buf, 2u);
          }

          v60 = self->_fallbackProxyPath;
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v60, "egressProxy"));
          v62 = sub_100027C1C((id *)&self->super.isa, v61, self->_fallbackProxyPathCustomEnumerator);

          if (v62)
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self->_fallbackProxyPath, "egressProxy"));
            -[NSPPrivacyProxyAgentManager switchProxy:](self, "switchProxy:", v63);

            v64 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
            if (v64)
              v64[12] = 0;

            quicProxyPath = self->_fallbackProxyPath;
            goto LABEL_133;
          }
          v334 = self->_probingReason;
          v23 = v604;
          if (v334 == 1)
            goto LABEL_226;
          if (!v334)
          {
            sub_100036224((id *)&self->super.isa, CFSTR("ProxyFallbackOriginError"));
            sub_1000364B4((uint64_t)self, 1, v335);
            v336 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
            if (v336)
              v336[12] = 0;

            fallbackProxyPath = self->_fallbackProxyPath;
            goto LABEL_304;
          }
          v350 = self->_fallbackProxyPath;
          goto LABEL_407;
        }
        v262 = nplog_obj(v50, v51, v52);
        v255 = objc_claimAutoreleasedReturnValue(v262);
        if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
        {
          v609 = v23;
          v256 = self->_lastFallbackProxySwitchedDate;
          v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v256, 1, 2));
          *(_DWORD *)buf = 138412290;
          v635 = (NWPathStatus)v257;
          v258 = "ignoring origin fallback proxy error, last fallback proxy switched date %@";
          goto LABEL_224;
        }
        goto LABEL_225;
      }
    }
LABEL_226:

    if (!v21)
      goto LABEL_361;
    v110 = 12;
    goto LABEL_360;
  }
  if ((int)v8 > 1099)
  {
    if ((v8 - 1100) > 7)
      goto LABEL_168;
    if (((1 << (v8 - 76)) & 0x33) != 0)
    {
LABEL_60:
      v66 = v12;
      v67 = v10;
      if (self)
      {
        if (self->_quicProxyPath == v66)
        {
          v89 = self->_lastQuicProxySwitchedDate;
          if (!v89
            || (v90 = v89,
                v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
                objc_msgSend(v91, "timeIntervalSinceDate:", self->_lastQuicProxySwitchedDate),
                v93 = v92,
                v91,
                v90,
                v93 > 30.0))
          {
            v97 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
            if (!v97)
              goto LABEL_188;
            v98 = v97[11];

            if (v98 < 3)
              goto LABEL_188;
            v605 = v23;
            v102 = nplog_obj(v99, v100, v101);
            v103 = objc_claimAutoreleasedReturnValue(v102);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "Quic proxy multihop path is reporting egress proxy error", buf, 2u);
            }

            v104 = self->_quicProxyPath;
            v105 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v104, "egressProxy"));
            v106 = sub_100027C1C((id *)&self->super.isa, v105, self->_proxyPathCustomEnumerator);

            if (v106)
            {
              v107 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self->_quicProxyPath, "egressProxy"));
              -[NSPPrivacyProxyAgentManager switchProxy:](self, "switchProxy:", v107);

              v108 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
              if (v108)
                v108[11] = 0;

              v88 = self->_quicProxyPath;
LABEL_83:
              v109 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "networkSingleHopAgentStatistics"));
              v23 = v605;
              if (!v109)
              {
LABEL_85:

                goto LABEL_188;
              }
LABEL_84:
              v109[11] = 0;
              goto LABEL_85;
            }
            v235 = self->_probingReason;
            v23 = v605;
            if (v235 == 1)
              goto LABEL_188;
            if (!v235)
            {
              sub_100036224((id *)&self->super.isa, CFSTR("ProxyPrimaryEgressError"));
              sub_1000364B4((uint64_t)self, 1, v236);
              v237 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
              if (v237)
                v237[11] = 0;

              v238 = self->_quicProxyPath;
LABEL_218:
              v109 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "networkSingleHopAgentStatistics"));
              if (!v109)
                goto LABEL_85;
              goto LABEL_84;
            }
            v302 = self->_quicProxyPath;
LABEL_314:
            objc_msgSend(v302, "resetError");
            goto LABEL_188;
          }
          v220 = nplog_obj(v94, v95, v96);
          v221 = objc_claimAutoreleasedReturnValue(v220);
          if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
          {
            v607 = v23;
            v222 = self->_lastQuicProxySwitchedDate;
            v223 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v222, 1, 2));
            *(_DWORD *)buf = 138412290;
            v635 = (NWPathStatus)v223;
            v224 = "ignoring egress quic proxy error, last quic proxy switched date %@";
LABEL_186:
            _os_log_impl((void *)&_mh_execute_header, v221, OS_LOG_TYPE_INFO, v224, buf, 0xCu);

            v23 = v607;
          }
LABEL_187:

          goto LABEL_188;
        }
        if ((NSPQuicProxyPath *)self->_fallbackProxyPath == v66)
        {
          v68 = self->_lastFallbackProxySwitchedDate;
          if (!v68
            || (v69 = v68,
                v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
                objc_msgSend(v70, "timeIntervalSinceDate:", self->_lastFallbackProxySwitchedDate),
                v72 = v71,
                v70,
                v69,
                v72 > 30.0))
          {
            v76 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
            if (!v76)
              goto LABEL_188;
            v77 = v76[11];

            if (v77 < 3)
              goto LABEL_188;
            v605 = v23;
            v81 = nplog_obj(v78, v79, v80);
            v82 = objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Fallback proxy multihop path is reporting egress proxy error", buf, 2u);
            }

            v83 = self->_fallbackProxyPath;
            v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v83, "egressProxy"));
            v85 = sub_100027C1C((id *)&self->super.isa, v84, self->_fallbackProxyPathCustomEnumerator);

            if (v85)
            {
              v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self->_fallbackProxyPath, "egressProxy"));
              -[NSPPrivacyProxyAgentManager switchProxy:](self, "switchProxy:", v86);

              v87 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
              if (v87)
                v87[11] = 0;

              v88 = self->_fallbackProxyPath;
              goto LABEL_83;
            }
            v259 = self->_probingReason;
            v23 = v605;
            if (v259 == 1)
              goto LABEL_188;
            if (!v259)
            {
              sub_100036224((id *)&self->super.isa, CFSTR("ProxyFallbackEgressError"));
              sub_1000364B4((uint64_t)self, 1, v260);
              v261 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
              if (v261)
                v261[11] = 0;

              v238 = self->_fallbackProxyPath;
              goto LABEL_218;
            }
            v302 = self->_fallbackProxyPath;
            goto LABEL_314;
          }
          v231 = nplog_obj(v73, v74, v75);
          v221 = objc_claimAutoreleasedReturnValue(v231);
          if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
          {
            v607 = v23;
            v222 = self->_lastFallbackProxySwitchedDate;
            v223 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v222, 1, 2));
            *(_DWORD *)buf = 138412290;
            v635 = (NWPathStatus)v223;
            v224 = "ignoring egress fallback proxy error, last fallback proxy switched date %@";
            goto LABEL_186;
          }
          goto LABEL_187;
        }
      }
LABEL_188:

      if (!v21)
        goto LABEL_361;
      v110 = 11;
      goto LABEL_360;
    }
    if ((_DWORD)v8 != 1106)
    {
      if ((_DWORD)v8 != 1107)
        goto LABEL_168;
      v111 = v12;
      v112 = v10;
      if (!self)
      {
LABEL_329:

        if (v21)
        {
          v110 = 13;
          goto LABEL_360;
        }
        goto LABEL_361;
      }
      if ((NSPFallbackProxyPath *)self->_quicProxyPath == v111)
      {
        v239 = self->_lastQuicProxySwitchedDate;
        if (!v239
          || (v240 = v239,
              v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
              objc_msgSend(v241, "timeIntervalSinceDate:", self->_lastQuicProxySwitchedDate),
              v243 = v242,
              v241,
              v240,
              v243 > 30.0))
        {
          v573 = v112;
          v121 = v23;
          v247 = self->_quicProxyPath;
          v248 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v247, "egressProxy"));
          v249 = sub_100027C1C((id *)&self->super.isa, v248, self->_proxyPathCustomEnumerator);

          v250 = self->_quicProxyPath;
          if (v249)
          {
            v251 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v250, "egressProxy"));
            -[NSPPrivacyProxyAgentManager switchProxy:](self, "switchProxy:", v251);

            v252 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
            if (v252)
              v252[13] = 0;

            v128 = self->_quicProxyPath;
            goto LABEL_208;
          }
          v326 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v250, "networkMultiHopAgentStatistics"));
          v23 = v121;
          v112 = v573;
          if (!v326)
            goto LABEL_329;
          v327 = v326[13];

          if (v327 < 3)
            goto LABEL_329;
          v328 = self->_probingReason;
          if (v328 == 1)
            goto LABEL_329;
          if (!v328)
          {
            sub_100036224((id *)&self->super.isa, CFSTR("ProxyPrimaryEgressUnavailableError"));
            sub_1000364B4((uint64_t)self, 1, v329);
            v330 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
            if (v330)
              v330[13] = 0;

            v331 = self->_quicProxyPath;
            goto LABEL_322;
          }
          v426 = self->_quicProxyPath;
LABEL_509:
          objc_msgSend(v426, "resetError");
          goto LABEL_329;
        }
        v337 = nplog_obj(v244, v245, v246);
        v338 = objc_claimAutoreleasedReturnValue(v337);
        if (os_log_type_enabled(v338, OS_LOG_TYPE_INFO))
        {
          v577 = v112;
          v339 = v23;
          v340 = self->_lastQuicProxySwitchedDate;
          v341 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v340, 1, 2));
          *(_DWORD *)buf = 138412290;
          v635 = (NWPathStatus)v341;
          v342 = "ignoring unavailable quic proxy error, last quic proxy switched date %@";
LABEL_327:
          _os_log_impl((void *)&_mh_execute_header, v338, OS_LOG_TYPE_INFO, v342, buf, 0xCu);

          v23 = v339;
          v112 = v577;

        }
      }
      else
      {
        if (self->_fallbackProxyPath != v111)
          goto LABEL_329;
        v113 = self->_lastFallbackProxySwitchedDate;
        if (!v113
          || (v114 = v113,
              v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
              objc_msgSend(v115, "timeIntervalSinceDate:", self->_lastFallbackProxySwitchedDate),
              v117 = v116,
              v115,
              v114,
              v117 > 30.0))
        {
          v573 = v112;
          v121 = v23;
          v122 = self->_fallbackProxyPath;
          v123 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v122, "egressProxy"));
          v124 = sub_100027C1C((id *)&self->super.isa, v123, self->_fallbackProxyPathCustomEnumerator);

          v125 = self->_fallbackProxyPath;
          if (v124)
          {
            v126 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v125, "egressProxy"));
            -[NSPPrivacyProxyAgentManager switchProxy:](self, "switchProxy:", v126);

            v127 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
            if (v127)
              v127[13] = 0;

            v128 = self->_fallbackProxyPath;
LABEL_208:
            v253 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "networkSingleHopAgentStatistics"));
            v23 = v121;
            if (v253)
              v253[13] = 0;

            v112 = v573;
            goto LABEL_329;
          }
          v343 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v125, "networkMultiHopAgentStatistics"));
          v23 = v121;
          v112 = v573;
          if (!v343)
            goto LABEL_329;
          v344 = v343[13];

          if (v344 < 3)
            goto LABEL_329;
          v345 = self->_probingReason;
          if (v345 == 1)
            goto LABEL_329;
          if (!v345)
          {
            sub_100036224((id *)&self->super.isa, CFSTR("ProxyFallbackEgressUnavailableError"));
            sub_1000364B4((uint64_t)self, 1, v346);
            v347 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
            if (v347)
              v347[13] = 0;

            v331 = self->_fallbackProxyPath;
LABEL_322:
            v348 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v331, "networkSingleHopAgentStatistics"));
            if (v348)
              v348[13] = 0;

            goto LABEL_329;
          }
          v426 = self->_fallbackProxyPath;
          goto LABEL_509;
        }
        v349 = nplog_obj(v118, v119, v120);
        v338 = objc_claimAutoreleasedReturnValue(v349);
        if (os_log_type_enabled(v338, OS_LOG_TYPE_INFO))
        {
          v577 = v112;
          v339 = v23;
          v340 = self->_lastFallbackProxySwitchedDate;
          v341 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v340, 1, 2));
          *(_DWORD *)buf = 138412290;
          v635 = (NWPathStatus)v341;
          v342 = "ignoring unavailable fallback proxy error, last fallback proxy switched date %@";
          goto LABEL_327;
        }
      }

      goto LABEL_329;
    }
    v175 = v12;
    v176 = v10;
    if (self)
    {
      v177 = -[NWPath status](self->_path, "status");
      if (v177 == NWPathStatusSatisfied)
      {
        v575 = v175;
        v589 = v8;
        v621 = v21;
        v180 = self->_quicProxyPath;
        v181 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v180, "networkMultiHopAgentStatistics"));
        v182 = (void *)v181;
        v618 = v12;
        if (v181)
          v183 = *(_QWORD *)(v181 + 80);
        else
          v183 = 0;
        v561 = v176;
        v184 = self->_quicProxyPath;
        v185 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](v184, "networkSingleHopAgentStatistics"));
        v186 = (void *)v185;
        v187 = v23;
        v188 = v10;
        if (v185)
          v189 = *(_QWORD *)(v185 + 80);
        else
          v189 = 0;
        v190 = v189 + v183;
        v191 = self->_fallbackProxyPath;
        v192 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v191, "networkMultiHopAgentStatistics"));
        v193 = (void *)v192;
        if (v192)
          v194 = *(_QWORD *)(v192 + 80);
        else
          v194 = 0;
        v195 = v190 + v194;
        v196 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
        if (v196)
          v197 = v196[10];
        else
          v197 = 0;
        v198 = v195 + v197;

        v199 = v198 >= 3;
        v10 = v188;
        v12 = v618;
        v21 = v621;
        v8 = v589;
        v23 = v187;
        v176 = v561;
        v175 = v575;
        if (!v199)
          goto LABEL_194;
        v200 = self->_probingReason;
        if (v200 == 1)
          goto LABEL_194;
        if (!v200)
        {
          sub_100036224((id *)&self->super.isa, CFSTR("ProxyCertError"));
          sub_1000364B4((uint64_t)self, 1, v201);
          v202 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
          if (v202)
            v202[10] = 0;

          v203 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_quicProxyPath, "networkSingleHopAgentStatistics"));
          if (v203)
            v203[10] = 0;

          v204 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
          if (v204)
            v204[10] = 0;

          v205 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
          if (v205)
            v205[10] = 0;

          goto LABEL_194;
        }
      }
      else
      {
        v232 = nplog_obj(v177, v178, v179);
        v233 = objc_claimAutoreleasedReturnValue(v232);
        if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
        {
          v234 = -[NWPath status](self->_path, "status");
          *(_DWORD *)buf = 134217984;
          v635 = v234;
          _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_DEFAULT, "ignoring connection cert error, path status %ld", buf, 0xCu);
        }

      }
      -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
      -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
    }
LABEL_194:

    if (!v21)
      goto LABEL_361;
    v110 = 10;
    goto LABEL_360;
  }
  v617 = v12;
  v620 = v21;
  if ((v8 + 65568) > 0x1E)
    goto LABEL_116;
  if (((1 << (v8 + 32)) & 0x4004C000) != 0)
  {
    v24 = v12;
    v25 = v10;
    if (!self)
      goto LABEL_40;
    v26 = self->_path;
    if ((id)-[NWPath status](v26, "status") != (id)1)
      goto LABEL_35;
    v27 = self->_lastPathUnsatisfiedDate;
    if (v27)
    {
      v21 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v12 = self->_lastPathUnsatisfiedDate;
      objc_msgSend(v21, "timeIntervalSinceDate:", v12);
      if (v28 <= 5.0)
      {

        v12 = v617;
        v21 = v620;
LABEL_35:

LABEL_36:
        v32 = nplog_obj(v29, v30, v31);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v572 = self->_path;
          v558 = -[NWPath status](v572, "status");
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate interfaceName](v25, "interfaceName"));
          v35 = self->_path;
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v35, "interface"));
          v596 = v10;
          v603 = v25;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "interfaceName"));
          v587 = v24;
          v38 = self->_lastPathUnsatisfiedDate;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v38, 1, 2));
          v40 = self->_lastPrimaryInterfaceChangedDate;
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v40, 1, 2));
          *(_DWORD *)buf = 134219010;
          v635 = v558;
          v636 = 2112;
          v637 = v34;
          v638 = 2112;
          v639 = v37;
          v640 = 2112;
          v641 = v39;
          v642 = 2112;
          v643 = (uint64_t)v41;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "ignoring dns blocked error, path status %ld reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x34u);

          v24 = v587;
          v25 = v603;

          v12 = v617;
          v21 = v620;

          v10 = v596;
        }

LABEL_39:
        -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
        -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
        goto LABEL_40;
      }
    }
    v600 = v10;
    v608 = v25;
    v225 = self->_lastPrimaryInterfaceChangedDate;
    if (v225)
    {
      v10 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v25 = self->_lastPrimaryInterfaceChangedDate;
      -[NSDate timeIntervalSinceDate:](v10, "timeIntervalSinceDate:", v25);
      if (v226 <= 5.0)
      {
        v230 = 0;
        goto LABEL_241;
      }
      if (!v608)
      {
        v230 = 1;
        goto LABEL_241;
      }
      v227 = v608;
    }
    else
    {
      v227 = v25;
      if (!v25)
      {
        if (v27)
        {

        }
        v25 = 0;
        goto LABEL_244;
      }
    }
    v590 = v24;
    v228 = -[NSDate interfaceIndex](v227, "interfaceIndex");
    v229 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](self->_path, "interface"));
    v230 = v228 == objc_msgSend(v229, "interfaceIndex");

    if (!v225)
    {
      v24 = v590;
      if (!v27)
      {
LABEL_243:

        v10 = v600;
        v25 = v608;
        v12 = v617;
        v21 = v620;
        if (!v230)
          goto LABEL_36;
LABEL_244:
        v270 = self->_quicProxyPath;
        v271 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v270, "networkMultiHopAgentStatistics"));
        v272 = (void *)v271;
        if (v271)
          v273 = *(_QWORD *)(v271 + 72);
        else
          v273 = 0;
        v274 = self->_quicProxyPath;
        v275 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](v274, "networkSingleHopAgentStatistics"));
        v276 = v275;
        if (v275)
          v277 = v275[9];
        else
          v277 = 0;
        if ((unint64_t)(v277 + v273) < 3)
        {

          v12 = v617;
          v21 = v620;
        }
        else
        {
          v278 = self->_fallbackProxyPath;
          if (v278)
          {
            v279 = v278;
            v280 = v24;
            v281 = self->_fallbackProxyPath;
            v282 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v281, "networkMultiHopAgentStatistics"));
            v283 = (void *)v282;
            if (v282)
              v284 = *(_QWORD *)(v282 + 72);
            else
              v284 = 0;
            v285 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
            if (v285)
              v286 = v285[9];
            else
              v286 = 0;
            v287 = v286 + v284;

            v288 = v287 > 2;
            v12 = v617;
            v21 = v620;
            v24 = v280;
            v10 = v600;
            v25 = v608;
            if (!v288)
              goto LABEL_40;
          }
          else
          {

            v12 = v617;
            v21 = v620;
          }
          v303 = self->_probingReason;
          if (v303 != 2)
          {
            if (!v303)
            {
              sub_100036224((id *)&self->super.isa, CFSTR("ProxyConnectionDNSError"));
              v304 = self->_quicProxyPath;
              v305 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v304, "networkMultiHopAgentStatistics"));
              v306 = (void *)v305;
              if (v305)
                v307 = *(_QWORD *)(v305 + 16);
              else
                v307 = 0;
              v308 = self->_quicProxyPath;
              v309 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](v308, "networkSingleHopAgentStatistics"));
              v310 = (void *)v309;
              v591 = v24;
              if (v309)
                v311 = *(_QWORD *)(v309 + 16);
              else
                v311 = 0;
              v312 = v311 + v307;
              v313 = self->_fallbackProxyPath;
              v314 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v313, "networkMultiHopAgentStatistics"));
              v315 = (void *)v314;
              if (v314)
                v316 = *(_QWORD *)(v314 + 16);
              else
                v316 = 0;
              v317 = v312 + v316;
              v318 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
              if (v318)
                v319 = v318[2];
              else
                v319 = 0;

              if (v317 + v319)
                v321 = 1;
              else
                v321 = 2;
              sub_1000364B4((uint64_t)self, v321, v320);
              v322 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
              if (v322)
                v322[9] = 0;

              v323 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_quicProxyPath, "networkSingleHopAgentStatistics"));
              v24 = v591;
              v10 = v600;
              v21 = v620;
              v25 = v608;
              if (v323)
                v323[9] = 0;

              v324 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
              if (v324)
                v324[9] = 0;

              v325 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
              if (v325)
                v325[9] = 0;

              goto LABEL_40;
            }
            goto LABEL_39;
          }
        }
LABEL_40:

        if (v21)
          ++v21[9];
        goto LABEL_362;
      }
LABEL_242:

      goto LABEL_243;
    }
    v24 = v590;
LABEL_241:

    if (!v27)
      goto LABEL_243;
    goto LABEL_242;
  }
  if ((_DWORD)v8 != -65568)
  {
LABEL_116:
    if ((_DWORD)v8 != 60)
    {
      if ((_DWORD)v8 == 61)
      {
        v148 = v12;
        v149 = v10;
        if (!self)
          goto LABEL_263;
        v150 = self->_path;
        v560 = v148;
        if ((id)-[NWPath status](v150, "status") == (id)1)
        {
          v151 = self->_lastPathUnsatisfiedDate;
          if (!v151)
            goto LABEL_236;
          a5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          v152 = self->_lastPathUnsatisfiedDate;
          objc_msgSend(a5, "timeIntervalSinceDate:", v152);
          if (v153 > 30.0)
          {
            v548 = v152;
            v571 = a5;
LABEL_236:
            v267 = self->_lastPrimaryInterfaceChangedDate;
            v610 = v23;
            if (v267)
            {
              a5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
              v8 = self->_lastPrimaryInterfaceChangedDate;
              objc_msgSend(a5, "timeIntervalSinceDate:", v8);
              if (v268 <= 30.0)
              {
                v269 = 0;
                goto LABEL_309;
              }
              if (!v149)
              {
                v269 = 1;
                goto LABEL_309;
              }
            }
            else if (!v149)
            {
              if (v151)
              {

              }
              v12 = v617;
              v8 = v8;
              goto LABEL_366;
            }
            v332 = -[NSDate interfaceIndex](v149, "interfaceIndex");
            v333 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](self->_path, "interface"));
            v269 = v332 == objc_msgSend(v333, "interfaceIndex");

            if (!v267)
            {
              v23 = v610;
              if (!v151)
              {
LABEL_311:

                v12 = v617;
                v8 = 61;
                if (v269)
                {
LABEL_366:
                  v386 = self->_fallbackProxyPath;
                  v387 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v386, "networkMultiHopAgentStatistics"));
                  v388 = (void *)v387;
                  v21 = v620;
                  if (v387)
                    v389 = *(_QWORD *)(v387 + 32);
                  else
                    v389 = 0;
                  v390 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
                  if (v390)
                    v391 = v390[4];
                  else
                    v391 = 0;
                  v392 = v391 + v389;

                  if (v392 < 3)
                  {
                    v23 = v610;
                    v148 = v560;
                    if (-[NSPPrivacyProxyAgentManager networkDiscoveredProxyPresentInAgentManager](self, "networkDiscoveredProxyPresentInAgentManager"))
                    {
                      v554 = v149;
                      v602 = v10;
                      v629 = 0u;
                      v630 = 0u;
                      v627 = 0u;
                      v628 = 0u;
                      v397 = self->_networkSpecificQUICProxyPaths;
                      v398 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v397, "countByEnumeratingWithState:objects:count:", &v627, buf, 16);
                      if (v398)
                      {
                        v399 = v398;
                        v400 = *(_QWORD *)v628;
                        v557 = self;
                        do
                        {
                          v401 = 0;
                          do
                          {
                            if (*(_QWORD *)v628 != v400)
                              objc_enumerationMutation(v397);
                            v402 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_networkSpecificQUICProxyPaths, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v627 + 1) + 8 * (_QWORD)v401)));
                            if (v402 == v148)
                            {
                              v403 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSDate networkMultiHopAgentStatistics](v148, "networkMultiHopAgentStatistics"));
                              if (v403)
                              {
                                v404 = v403[4];

                                if (v404 >= 3)
                                {
                                  v408 = nplog_obj(v405, v406, v407);
                                  v409 = objc_claimAutoreleasedReturnValue(v408);
                                  if (os_log_type_enabled(v409, OS_LOG_TYPE_INFO))
                                  {
                                    v410 = v148;
                                    v411 = objc_claimAutoreleasedReturnValue(-[NSDate ingressProxy](v148, "ingressProxy"));
                                    v412 = (void *)v411;
                                    if (v411)
                                      v413 = *(void **)(v411 + 24);
                                    else
                                      v413 = 0;
                                    v414 = v413;
                                    v415 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v414, "vendor"));
                                    *(_DWORD *)v632 = 138412290;
                                    v633 = v415;
                                    _os_log_impl((void *)&_mh_execute_header, v409, OS_LOG_TYPE_INFO, "Network discovered proxy: %@ exceeded the connection refused count, removing registration", v632, 0xCu);

                                    v8 = 61;
                                    v23 = v610;
                                    v148 = v410;
                                    self = v557;
                                  }

                                  -[NSPPrivacyProxyAgentManager tearDownNetworkDiscoveredProxy](self, "tearDownNetworkDiscoveredProxy");
                                }
                              }
                            }

                            v401 = (char *)v401 + 1;
                          }
                          while (v399 != v401);
                          v416 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v397, "countByEnumeratingWithState:objects:count:", &v627, buf, 16);
                          v399 = v416;
                        }
                        while (v416);
                      }

                      v10 = v602;
                      v12 = v617;
                      v21 = v620;
                      v149 = v554;
                    }
                  }
                  else
                  {
                    v393 = self->_probingReason;
                    v23 = v610;
                    v148 = v560;
                    if (v393 != 1)
                    {
                      if (v393)
                      {
                        -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
                        -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
                      }
                      else
                      {
                        sub_100036224((id *)&self->super.isa, CFSTR("ProxyConnectionRefused"));
                        sub_1000364B4((uint64_t)self, 1, v394);
                        v395 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
                        if (v395)
                          v395[4] = 0;

                        v396 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
                        if (v396)
                          v396[4] = 0;

                      }
                    }
                  }
                  goto LABEL_263;
                }
LABEL_260:
                v292 = nplog_obj(v289, v290, v291);
                v293 = objc_claimAutoreleasedReturnValue(v292);
                if (os_log_type_enabled(v293, OS_LOG_TYPE_DEFAULT))
                {
                  v576 = self->_path;
                  v541 = -[NWPath status](v576, "status");
                  v294 = v149;
                  v295 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate interfaceName](v149, "interfaceName"));
                  v545 = self->_path;
                  v296 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v545, "interface"));
                  v297 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v296, "interfaceName"));
                  v550 = v294;
                  v611 = v23;
                  v298 = self->_lastPathUnsatisfiedDate;
                  v299 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v298, 1, 2));
                  v300 = self->_lastPrimaryInterfaceChangedDate;
                  v301 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v300, 1, 2));
                  *(_DWORD *)buf = 134219010;
                  v635 = v541;
                  v636 = 2112;
                  v637 = v295;
                  v638 = 2112;
                  v639 = v297;
                  v640 = 2112;
                  v641 = v299;
                  v642 = 2112;
                  v643 = (uint64_t)v301;
                  _os_log_impl((void *)&_mh_execute_header, v293, OS_LOG_TYPE_DEFAULT, "ignoring connection refused error, path status %ld reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x34u);

                  v23 = v611;
                  v12 = v617;

                  v149 = v550;
                }

                -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
                -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
                v21 = v620;
                v8 = 61;
                v148 = v560;
LABEL_263:

                if (v21)
                {
                  v110 = 4;
                  goto LABEL_360;
                }
LABEL_361:
                v384 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate ingressProxy](v12, "ingressProxy"));
                v385 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate egressProxy](v12, "egressProxy"));
                -[NSPPrivacyProxyAgentManager sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:](self, "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:", v23, v8, 0, v384, v385);

                goto LABEL_362;
              }
LABEL_310:

              goto LABEL_311;
            }
            v23 = v610;
LABEL_309:

            if (!v151)
              goto LABEL_311;
            goto LABEL_310;
          }

          v12 = v617;
        }

        goto LABEL_260;
      }
LABEL_168:
      v213 = v12;
      v214 = v10;
      if (!self)
        goto LABEL_358;
      v622 = v21;
      v215 = self->_path;
      v599 = v10;
      if ((id)-[NWPath status](v215, "status") == (id)1)
      {
        linkQuality = self->_linkQuality;
        if (linkQuality != 10 && linkQuality != 20)
        {
          v619 = v12;
          v217 = self->_lastPathUnsatisfiedDate;
          if (!v217)
            goto LABEL_340;
          v218 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          v6 = self->_lastPathUnsatisfiedDate;
          -[NSDate timeIntervalSinceDate:](v218, "timeIntervalSinceDate:", v6);
          if (v219 > 30.0)
          {
            v544 = v218;
LABEL_340:
            v551 = v6;
            v593 = v8;
            v357 = self->_lastPrimaryInterfaceChangedDate;
            if (v357)
            {
              v6 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
              v8 = self->_lastPrimaryInterfaceChangedDate;
              -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:", v8);
              if (v358 <= 30.0)
              {
                v359 = 0;
                goto LABEL_419;
              }
              if (!v214)
              {
                v359 = 1;
                goto LABEL_419;
              }
            }
            else if (!v214)
            {
              if (v217)
              {

              }
              goto LABEL_489;
            }
            v566 = v214;
            v582 = v213;
            v616 = v23;
            v423 = -[NSDate interfaceIndex](v214, "interfaceIndex");
            v424 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](self->_path, "interface"));
            v425 = objc_msgSend(v424, "interfaceIndex");
            v359 = v423 == v425;

            if (!v357)
            {
              v213 = v582;
              if (v217)
              {

              }
              v427 = v423 == v425;
              v23 = v616;
              v12 = v619;
              v8 = v593;
              v214 = v566;
              if (v427)
                goto LABEL_489;
              goto LABEL_355;
            }
            v23 = v616;
            v214 = v566;
            v213 = v582;
LABEL_419:

            if (v217)
            {

            }
            v12 = v619;
            v8 = v593;
            if (v359)
            {
LABEL_489:
              v466 = self->_fallbackProxyPath;
              v467 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v466, "networkMultiHopAgentStatistics"));
              v468 = (void *)v467;
              if (v467)
                v469 = *(_QWORD *)(v467 + 56);
              else
                v469 = 0;
              v470 = self->_fallbackProxyPath;
              v471 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](v470, "networkSingleHopAgentStatistics"));
              v472 = v471;
              if (v471)
                v473 = v471[7];
              else
                v473 = 0;
              v10 = v599;
              if ((unint64_t)(v473 + v469) > 9)
              {

              }
              else
              {
                v474 = self->_fallbackProxyPath;
                if (v474)
                {

                  goto LABEL_541;
                }
                v569 = v214;
                v585 = v213;
                v509 = v23;
                v510 = self->_quicProxyPath;
                v511 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v510, "networkMultiHopAgentStatistics"));
                v512 = (void *)v511;
                if (v511)
                  v513 = *(_QWORD *)(v511 + 56);
                else
                  v513 = 0;
                v514 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_quicProxyPath, "networkSingleHopAgentStatistics"));
                if (v514)
                  v515 = v514[7];
                else
                  v515 = 0;
                v516 = v515 + v513;

                v288 = v516 > 9;
                v23 = v509;
                v214 = v569;
                v213 = v585;
                if (!v288)
                {
LABEL_541:
                  v12 = v619;
                  v21 = v622;
                  v8 = v593;
                  if (-[NSPPrivacyProxyAgentManager networkDiscoveredProxyPresentInAgentManager](self, "networkDiscoveredProxyPresentInAgentManager"))
                  {
                    v570 = v214;
                    v629 = 0u;
                    v630 = 0u;
                    v627 = 0u;
                    v628 = 0u;
                    v517 = self->_networkSpecificQUICProxyPaths;
                    v518 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v517, "countByEnumeratingWithState:objects:count:", &v627, buf, 16);
                    if (v518)
                    {
                      v519 = v518;
                      v520 = *(_QWORD *)v628;
                      v586 = v213;
                      v556 = v517;
                      do
                      {
                        v521 = 0;
                        do
                        {
                          if (*(_QWORD *)v628 != v520)
                            objc_enumerationMutation(v517);
                          v522 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_networkSpecificQUICProxyPaths, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v627 + 1) + 8 * (_QWORD)v521)));
                          if (v522 == v213)
                          {
                            v523 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSDate networkMultiHopAgentStatistics](v213, "networkMultiHopAgentStatistics"));
                            if (v523)
                            {
                              v524 = v523[7];

                              if (v524 >= 0xA)
                              {
                                v528 = nplog_obj(v525, v526, v527);
                                v529 = objc_claimAutoreleasedReturnValue(v528);
                                if (os_log_type_enabled(v529, OS_LOG_TYPE_INFO))
                                {
                                  v530 = objc_claimAutoreleasedReturnValue(-[NSDate ingressProxy](v213, "ingressProxy"));
                                  v531 = (void *)v530;
                                  v532 = v23;
                                  if (v530)
                                    v533 = *(void **)(v530 + 24);
                                  else
                                    v533 = 0;
                                  v534 = v533;
                                  v535 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v534, "vendor"));
                                  *(_DWORD *)v632 = 138412290;
                                  v633 = v535;
                                  _os_log_impl((void *)&_mh_execute_header, v529, OS_LOG_TYPE_INFO, "Network discovered proxy: %@ exceeded the connection error count, removing registration", v632, 0xCu);

                                  v8 = v593;
                                  v23 = v532;
                                  v213 = v586;
                                  v517 = v556;
                                }

                                -[NSPPrivacyProxyAgentManager tearDownNetworkDiscoveredProxy](self, "tearDownNetworkDiscoveredProxy");
                              }
                            }
                          }

                          v521 = (char *)v521 + 1;
                        }
                        while (v519 != v521);
                        v536 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v517, "countByEnumeratingWithState:objects:count:", &v627, buf, 16);
                        v519 = v536;
                      }
                      while (v536);
                    }

                    v10 = v599;
                    v12 = v619;
                    v21 = v622;
                    v214 = v570;
                  }
                  goto LABEL_358;
                }
              }
              v475 = self->_probingReason;
              v12 = v619;
              v21 = v622;
              v8 = v593;
              if (v475 != 1)
              {
                if (v475)
                {
                  -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
                  -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
                }
                else
                {
                  sub_100036224((id *)&self->super.isa, CFSTR("ProxyError"));
                  sub_1000364B4((uint64_t)self, 1, v476);
                  v477 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
                  if (v477)
                    v477[7] = 0;

                  v478 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_quicProxyPath, "networkSingleHopAgentStatistics"));
                  if (v478)
                    v478[7] = 0;

                  v479 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
                  if (v479)
                    v479[7] = 0;

                  v480 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
                  if (v480)
                    v480[7] = 0;

                }
              }
LABEL_358:

              if (v21)
              {
                v110 = 7;
                goto LABEL_360;
              }
              goto LABEL_361;
            }
LABEL_355:
            v375 = nplog_obj(v372, v373, v374);
            v376 = objc_claimAutoreleasedReturnValue(v375);
            if (os_log_type_enabled(v376, OS_LOG_TYPE_DEFAULT))
            {
              v553 = self->_path;
              v543 = -[NWPath status](v553, "status");
              v538 = (void *)objc_claimAutoreleasedReturnValue(+[NPUtilities stringFromLinkQualityValue:](NPUtilities, "stringFromLinkQualityValue:", self->_linkQuality));
              v540 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate interfaceName](v214, "interfaceName"));
              v547 = self->_path;
              v595 = v8;
              v377 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v547, "interface"));
              v378 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v377, "interfaceName"));
              v563 = v214;
              v580 = v213;
              v614 = v23;
              v379 = self->_lastPathUnsatisfiedDate;
              v380 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v379, 1, 2));
              v381 = self->_lastPrimaryInterfaceChangedDate;
              v382 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v381, 1, 2));
              *(_DWORD *)buf = 134219266;
              v635 = v543;
              v636 = 2112;
              v637 = v538;
              v638 = 2112;
              v639 = v540;
              v640 = 2112;
              v641 = v378;
              v642 = 2112;
              v643 = v380;
              v383 = (void *)v380;
              v644 = 2112;
              v645 = v382;
              _os_log_impl((void *)&_mh_execute_header, v376, OS_LOG_TYPE_DEFAULT, "ignoring connection error, path status %ld link quality %@ reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x3Eu);

              v23 = v614;
              v214 = v563;

              v8 = v595;
              v213 = v580;

            }
            -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
            -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
            v10 = v599;
            v21 = v622;
            goto LABEL_358;
          }

          v12 = v619;
        }
      }

      goto LABEL_355;
    }
    v206 = v12;
    v207 = v10;
    if (!self)
      goto LABEL_351;
    v208 = self->_path;
    v598 = v10;
    if ((id)-[NWPath status](v208, "status") == (id)1)
    {
      v209 = self->_linkQuality;
      if (v209 != 10 && v209 != 20)
      {
        v210 = self->_lastPathUnsatisfiedDate;
        if (!v210)
          goto LABEL_336;
        a5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v211 = self->_lastPathUnsatisfiedDate;
        objc_msgSend(a5, "timeIntervalSinceDate:", v211);
        if (v212 > 30.0)
        {
          v544 = v211;
          v548 = a5;
LABEL_336:
          v354 = self->_lastPrimaryInterfaceChangedDate;
          if (v354)
          {
            a5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            v8 = self->_lastPrimaryInterfaceChangedDate;
            objc_msgSend(a5, "timeIntervalSinceDate:", v8);
            if (v355 <= 30.0)
            {
              v356 = 0;
              goto LABEL_414;
            }
            if (!v207)
            {
              v356 = 1;
              goto LABEL_414;
            }
          }
          else if (!v207)
          {
            if (v210)
            {

            }
            goto LABEL_467;
          }
          v565 = v207;
          v581 = v206;
          v615 = v23;
          v420 = -[NSDate interfaceIndex](v207, "interfaceIndex");
          v421 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](self->_path, "interface"));
          v422 = objc_msgSend(v421, "interfaceIndex");
          v356 = v420 == v422;

          if (!v354)
          {
            v206 = v581;
            if (v210)
            {

            }
            v427 = v420 == v422;
            v23 = v615;
            v12 = v617;
            v8 = 60;
            v207 = v565;
            if (v427)
              goto LABEL_467;
            goto LABEL_348;
          }
          v23 = v615;
          v207 = v565;
          v206 = v581;
LABEL_414:

          if (v210)
          {

          }
          v12 = v617;
          v8 = 60;
          if (v356)
          {
LABEL_467:
            v451 = self->_fallbackProxyPath;
            v452 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v451, "networkMultiHopAgentStatistics"));
            v453 = (void *)v452;
            if (v452)
              v454 = *(_QWORD *)(v452 + 24);
            else
              v454 = 0;
            v455 = self->_fallbackProxyPath;
            v456 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](v455, "networkSingleHopAgentStatistics"));
            v457 = v456;
            if (v456)
              v458 = v456[3];
            else
              v458 = 0;
            v10 = v598;
            if ((unint64_t)(v458 + v454) > 9)
            {

            }
            else
            {
              v459 = self->_fallbackProxyPath;
              if (v459)
              {

                goto LABEL_517;
              }
              v567 = v207;
              v583 = v206;
              v481 = v23;
              v482 = self->_quicProxyPath;
              v483 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v482, "networkMultiHopAgentStatistics"));
              v484 = (void *)v483;
              if (v483)
                v485 = *(_QWORD *)(v483 + 24);
              else
                v485 = 0;
              v486 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_quicProxyPath, "networkSingleHopAgentStatistics"));
              if (v486)
                v487 = v486[3];
              else
                v487 = 0;
              v488 = v487 + v485;

              v288 = v488 > 9;
              v23 = v481;
              v207 = v567;
              v206 = v583;
              if (!v288)
              {
LABEL_517:
                v12 = v617;
                v21 = v620;
                v8 = 60;
                if (-[NSPPrivacyProxyAgentManager networkDiscoveredProxyPresentInAgentManager](self, "networkDiscoveredProxyPresentInAgentManager"))
                {
                  v568 = v207;
                  v629 = 0u;
                  v630 = 0u;
                  v627 = 0u;
                  v628 = 0u;
                  v489 = self->_networkSpecificQUICProxyPaths;
                  v490 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v489, "countByEnumeratingWithState:objects:count:", &v627, buf, 16);
                  if (v490)
                  {
                    v491 = v490;
                    v492 = *(_QWORD *)v628;
                    v584 = v206;
                    v555 = v489;
                    do
                    {
                      v493 = 0;
                      do
                      {
                        if (*(_QWORD *)v628 != v492)
                          objc_enumerationMutation(v489);
                        v494 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_networkSpecificQUICProxyPaths, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v627 + 1) + 8 * (_QWORD)v493)));
                        if (v494 == v206)
                        {
                          v495 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSDate networkMultiHopAgentStatistics](v206, "networkMultiHopAgentStatistics"));
                          if (v495)
                          {
                            v496 = v495[3];

                            if (v496 >= 0xA)
                            {
                              v500 = nplog_obj(v497, v498, v499);
                              v501 = objc_claimAutoreleasedReturnValue(v500);
                              if (os_log_type_enabled(v501, OS_LOG_TYPE_INFO))
                              {
                                v502 = objc_claimAutoreleasedReturnValue(-[NSDate ingressProxy](v206, "ingressProxy"));
                                v503 = (void *)v502;
                                v504 = v23;
                                if (v502)
                                  v505 = *(void **)(v502 + 24);
                                else
                                  v505 = 0;
                                v506 = v505;
                                v507 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v506, "vendor"));
                                *(_DWORD *)v632 = 138412290;
                                v633 = v507;
                                _os_log_impl((void *)&_mh_execute_header, v501, OS_LOG_TYPE_INFO, "Network discovered proxy: %@ exceeded the timeout count, removing registration", v632, 0xCu);

                                v8 = 60;
                                v23 = v504;
                                v206 = v584;
                                v489 = v555;
                              }

                              -[NSPPrivacyProxyAgentManager tearDownNetworkDiscoveredProxy](self, "tearDownNetworkDiscoveredProxy");
                            }
                          }
                        }

                        v493 = (char *)v493 + 1;
                      }
                      while (v491 != v493);
                      v508 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v489, "countByEnumeratingWithState:objects:count:", &v627, buf, 16);
                      v491 = v508;
                    }
                    while (v508);
                  }

                  v10 = v598;
                  v12 = v617;
                  v21 = v620;
                  v207 = v568;
                }
                goto LABEL_351;
              }
            }
            v460 = self->_probingReason;
            v12 = v617;
            v21 = v620;
            v8 = 60;
            if (v460 != 1)
            {
              if (v460)
              {
                -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
                -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
              }
              else
              {
                sub_100036224((id *)&self->super.isa, CFSTR("ProxyConnectionTimeout"));
                sub_1000364B4((uint64_t)self, 1, v461);
                v462 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
                if (v462)
                  v462[3] = 0;

                v463 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_quicProxyPath, "networkSingleHopAgentStatistics"));
                if (v463)
                  v463[3] = 0;

                v464 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
                if (v464)
                  v464[3] = 0;

                v465 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
                if (v465)
                  v465[3] = 0;

              }
            }
LABEL_351:

            if (v21)
            {
              v110 = 3;
              goto LABEL_360;
            }
            goto LABEL_361;
          }
LABEL_348:
          v363 = nplog_obj(v360, v361, v362);
          v364 = objc_claimAutoreleasedReturnValue(v363);
          if (os_log_type_enabled(v364, OS_LOG_TYPE_DEFAULT))
          {
            v552 = self->_path;
            v542 = -[NWPath status](v552, "status");
            v537 = (void *)objc_claimAutoreleasedReturnValue(+[NPUtilities stringFromLinkQualityValue:](NPUtilities, "stringFromLinkQualityValue:", self->_linkQuality));
            v539 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate interfaceName](v207, "interfaceName"));
            v546 = self->_path;
            v594 = v8;
            v365 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v546, "interface"));
            v366 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v365, "interfaceName"));
            v562 = v207;
            v579 = v206;
            v613 = v23;
            v367 = self->_lastPathUnsatisfiedDate;
            v368 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v367, 1, 2));
            v369 = self->_lastPrimaryInterfaceChangedDate;
            v370 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v369, 1, 2));
            *(_DWORD *)buf = 134219266;
            v635 = v542;
            v636 = 2112;
            v637 = v537;
            v638 = 2112;
            v639 = v539;
            v640 = 2112;
            v641 = v366;
            v642 = 2112;
            v643 = v368;
            v371 = (void *)v368;
            v644 = 2112;
            v645 = v370;
            _os_log_impl((void *)&_mh_execute_header, v364, OS_LOG_TYPE_DEFAULT, "ignoring connection timeout error, path status %ld link quality %@ reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x3Eu);

            v23 = v613;
            v207 = v562;

            v8 = v594;
            v206 = v579;

            v12 = v617;
          }

          -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
          -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
          v10 = v598;
          v21 = v620;
          goto LABEL_351;
        }

        v12 = v617;
      }
    }

    goto LABEL_348;
  }
  v129 = v12;
  v130 = v10;
  if (!self)
    goto LABEL_114;
  v131 = self->_path;
  if ((id)-[NWPath status](v131, "status") != (id)1)
    goto LABEL_109;
  v132 = self->_linkQuality;
  if (v132 == 10 || v132 == 20)
    goto LABEL_109;
  v133 = self->_lastPathUnsatisfiedDate;
  if (v133)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v12 = self->_lastPathUnsatisfiedDate;
    objc_msgSend(v5, "timeIntervalSinceDate:", v12);
    if (v134 <= 30.0)
    {

      v12 = v617;
LABEL_109:

LABEL_110:
      v138 = nplog_obj(v135, v136, v137);
      v139 = objc_claimAutoreleasedReturnValue(v138);
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        v574 = self->_path;
        v549 = -[NWPath status](v574, "status");
        v140 = (void *)objc_claimAutoreleasedReturnValue(+[NPUtilities stringFromLinkQualityValue:](NPUtilities, "stringFromLinkQualityValue:", self->_linkQuality));
        v141 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate interfaceName](v130, "interfaceName"));
        v559 = self->_path;
        v597 = v10;
        v142 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v559, "interface"));
        v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "interfaceName"));
        v606 = v129;
        v144 = self->_lastPathUnsatisfiedDate;
        v588 = v130;
        v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v144, 1, 2));
        v146 = self->_lastPrimaryInterfaceChangedDate;
        v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v146, 1, 2));
        *(_DWORD *)buf = 134219266;
        v635 = v549;
        v636 = 2112;
        v637 = v140;
        v638 = 2112;
        v639 = v141;
        v640 = 2112;
        v641 = v143;
        v642 = 2112;
        v643 = (uint64_t)v145;
        v644 = 2112;
        v645 = v147;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "ignoring DNS timeout error, path status %ld link quality %@ reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x3Eu);

        v129 = v606;
        v21 = v620;

        v10 = v597;
        v12 = v617;

        v130 = v588;
      }

LABEL_113:
      -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
      -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
      goto LABEL_114;
    }
  }
  v601 = v10;
  v351 = self->_lastPrimaryInterfaceChangedDate;
  v612 = v129;
  v592 = v130;
  if (v351)
  {
    a5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v10 = self->_lastPrimaryInterfaceChangedDate;
    objc_msgSend(a5, "timeIntervalSinceDate:", v10);
    if (v352 <= 30.0)
    {
      v578 = v5;
      v353 = 0;
      goto LABEL_409;
    }
    if (!v130)
    {
      v578 = v5;
      v353 = 1;
      goto LABEL_409;
    }
  }
  else if (!v130)
  {
    if (v133)
    {

    }
    v12 = v617;
    v21 = v620;
    goto LABEL_443;
  }
  v564 = v12;
  v578 = v5;
  v417 = -[NSDate interfaceIndex](v130, "interfaceIndex");
  v418 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](self->_path, "interface"));
  v419 = objc_msgSend(v418, "interfaceIndex");
  v353 = v417 == v419;

  if (!v351)
  {
    if (v133)
    {

    }
    v427 = v417 == v419;
    v10 = v601;
    v129 = v612;
    v12 = v617;
    v21 = v620;
    v130 = v592;
    if (!v427)
      goto LABEL_110;
    goto LABEL_443;
  }
  v129 = v612;
  v130 = v592;
  v12 = v564;
LABEL_409:

  if (v133)
  {

  }
  v10 = v601;
  v12 = v617;
  v21 = v620;
  if (!v353)
    goto LABEL_110;
LABEL_443:
  v428 = self->_quicProxyPath;
  v429 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v428, "networkMultiHopAgentStatistics"));
  v430 = (void *)v429;
  if (v429)
    v431 = *(_QWORD *)(v429 + 64);
  else
    v431 = 0;
  v432 = self->_quicProxyPath;
  v433 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](v432, "networkSingleHopAgentStatistics"));
  v434 = (void *)v433;
  if (v433)
    v435 = *(_QWORD *)(v433 + 64);
  else
    v435 = 0;
  v436 = v435 + v431;
  v437 = self->_fallbackProxyPath;
  v438 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](v437, "networkMultiHopAgentStatistics"));
  v439 = (void *)v438;
  if (v438)
    v440 = *(_QWORD *)(v438 + 64);
  else
    v440 = 0;
  v441 = v436 + v440;
  v442 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
  if (v442)
    v443 = v442[8];
  else
    v443 = 0;
  v444 = v441 + v443;

  v199 = v444 >= 3;
  v10 = v601;
  v129 = v612;
  v130 = v592;
  if (v199)
  {
    v445 = self->_probingReason;
    if (v445 != 1)
    {
      if (!v445)
      {
        sub_100036224((id *)&self->super.isa, CFSTR("ProxyConnectionDNSTimeout"));
        sub_1000364B4((uint64_t)self, 1, v446);
        v447 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_quicProxyPath, "networkMultiHopAgentStatistics"));
        if (v447)
          v447[8] = 0;

        v448 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_quicProxyPath, "networkSingleHopAgentStatistics"));
        if (v448)
          v448[8] = 0;

        v449 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self->_fallbackProxyPath, "networkMultiHopAgentStatistics"));
        if (v449)
          v449[8] = 0;

        v450 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self->_fallbackProxyPath, "networkSingleHopAgentStatistics"));
        if (v450)
          v450[8] = 0;

        goto LABEL_114;
      }
      goto LABEL_113;
    }
  }
LABEL_114:

  if (v21)
    ++v21[8];
LABEL_362:
  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");

}

- (void)reportEpoch:(unsigned __int16)a3
{
  uint64_t v3;
  unsigned int v5;
  NSNumber *reportedEpoch;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  NSObject *v12;
  NSNumber *v13;
  NSNumber *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[6];
  uint8_t buf[8];
  _BYTE v20[24];
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  if (self)
  {
    v5 = -[NSNumber unsignedShortValue](self->_configEpoch, "unsignedShortValue");
    reportedEpoch = self->_reportedEpoch;
  }
  else
  {
    v5 = objc_msgSend(0, "unsignedShortValue");
    reportedEpoch = 0;
  }
  v7 = (id)-[NSNumber unsignedShortValue](reportedEpoch, "unsignedShortValue");
  if (v5 < v3 && v7 < v3)
  {
    v11 = nplog_obj(v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v13 = self->_configEpoch;
        v14 = self->_reportedEpoch;
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v3;
      *(_WORD *)v20 = 2112;
      *(_QWORD *)&v20[2] = v13;
      *(_WORD *)&v20[10] = 2112;
      *(_QWORD *)&v20[12] = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "New epoch (%u) is larger than config epoch (%@) and previous reported epoch (%@), triggering config fetch", buf, 0x1Cu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v3));
    sub_1000231FC((uint64_t)self, v15);

    *(_QWORD *)buf = 0;
    *(_QWORD *)v20 = buf;
    *(_QWORD *)&v20[8] = 0x3032000000;
    *(_QWORD *)&v20[16] = sub_1000030EC;
    v21 = sub_10000C20C;
    v22 = (id)os_transaction_create("com.apple.networkserviceproxy.reportEpoch");
    v16 = NPGetInternalQueue(v22);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003A0E0;
    v18[3] = &unk_1000F5428;
    v18[4] = self;
    v18[5] = buf;
    dispatch_async(v17, v18);

    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    _Block_object_dispose(buf, 8);

  }
}

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (self)
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSPPrivacyProxyAgentManager reportActivityForApp:path:](self, "reportActivityForApp:path:", v7, v6);

}

- (void)probeSuccess:(id)a3
{
  NSPProber *v4;
  uint64_t v5;
  uint64_t v6;
  NSPProber *v7;
  int64_t probingReason;
  NSPProber *v9;
  unint64_t probeSuccessCount;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;
  const __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  NSPProber *directPathProber;
  uint64_t v22;
  NSObject *v23;
  int64_t v24;
  const __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  BOOL v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  int64_t v32;
  const __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  NSPProber *v37;
  NSPProber *v38;
  NSPProber *v39;
  NSPProber *v40;
  NSPProber *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  int64_t v45;
  const __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  NSPProber *v52;
  BOOL v53;
  NSPProber *v54;
  _BOOL4 v55;
  NWPath *v56;
  void *v57;
  void *v58;
  _QWORD v59[6];
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v4 = (NSPProber *)a3;
  v7 = v4;
  if (!self)
    goto LABEL_18;
  probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_proxyPathProber == v4)
      {
        v43 = nplog_obj(v4, v5, v6);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = self->_probingReason;
          v46 = CFSTR("Unknown");
          if (v45 == 2)
            v46 = CFSTR("DNS");
          if (v45 == 1)
            v47 = CFSTR("Proxy");
          else
            v47 = (__CFString *)v46;
          v48 = v47;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v48;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Probing(%@): Proxy path probe successful", buf, 0xCu);

        }
        -[NSPProxyPath resetStats](self->_quicProxyPath, "resetStats");
        -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
        -[NSPProxyPath resetStats](self->_fallbackProxyPath, "resetStats");
        -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        objc_storeStrong((id *)&self->_probeEndTime, v49);

        sub_100026F10((uint64_t)self);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v61 = sub_1000030EC;
        v62 = sub_10000C20C;
        v63 = (id)os_transaction_create("com.apple.networkserviceproxy.probeSuccess");
        v50 = NPGetInternalQueue(v63);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_10003A784;
        v59[3] = &unk_1000F5428;
        v59[4] = self;
        v59[5] = buf;
        dispatch_async(v51, v59);

        _Block_object_dispose(buf, 8);
      }
      else if (self->_directPathProber == v4)
      {
        v9 = v4;
        if (v9)
        {
          probeSuccessCount = v9->_probeSuccessCount;

          if (probeSuccessCount >= 2)
          {
            v14 = nplog_obj(v11, v12, v13);
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = self->_probingReason;
              v17 = CFSTR("Unknown");
              if (v16 == 2)
                v17 = CFSTR("DNS");
              if (v16 == 1)
                v18 = CFSTR("Proxy");
              else
                v18 = (__CFString *)v17;
              v19 = v18;
              v20 = v19;
              directPathProber = self->_directPathProber;
              if (directPathProber)
                directPathProber = (NSPProber *)directPathProber->_probeSuccessCount;
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v19;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = directPathProber;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe successful %lu times", buf, 0x16u);

            }
            objc_storeStrong((id *)&self->_directPathProber, 0);
          }
        }
      }
      goto LABEL_52;
    }
LABEL_18:
    v22 = nplog_obj(v4, v5, v6);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        v24 = self->_probingReason;
        v25 = CFSTR("Unknown");
        if (v24 == 2)
          v25 = CFSTR("DNS");
        if (v24 == 1)
          v26 = CFSTR("Proxy");
        else
          v26 = (__CFString *)v25;
      }
      else
      {
        v26 = 0;
      }
      v27 = v26;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Invalid probing reason: %@", buf, 0xCu);

    }
    goto LABEL_52;
  }
  v28 = self->_directPathProber == v4;
  v29 = nplog_obj(v4, v5, v6);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  v31 = v30;
  if (v28)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v32 = self->_probingReason;
      v33 = CFSTR("Unknown");
      if (v32 == 2)
        v33 = CFSTR("DNS");
      if (v32 == 1)
        v34 = CFSTR("Proxy");
      else
        v34 = (__CFString *)v33;
      v35 = v34;
      v36 = v35;
      v37 = self->_directPathProber;
      if (v37)
        v37 = (NSPProber *)v37->_probeSuccessCount;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v37;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe successful %lu times", buf, 0x16u);

    }
    v38 = self->_directPathProber;
    v39 = v38;
    if (!v38 || !v38->_probeFailedCount)
    {
      v40 = self->_directPathProber;
      v41 = v40;
      if (!v40 || !v40->_probeRedirectedCount)
      {
        v52 = self->_directPathProber;
        if (v52)
        {
          v53 = v52->_probeServerErrorCount == 0;

          if (!v53)
            goto LABEL_43;
        }
        else
        {

        }
        v54 = self->_directPathProber;
        if (v54)
        {
          v55 = v54->_probeSuccessCount > 1;

          if (v55)
          {
            v56 = self->_path;
            v57 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v56, "interface"));
            sub_100036084((uint64_t)self, v57, 1);

            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            objc_storeStrong((id *)&self->_probeEndTime, v58);

            sub_100026F10((uint64_t)self);
          }
        }
        goto LABEL_52;
      }

    }
LABEL_43:
    -[NSPProxyPath resetStats](self->_quicProxyPath, "resetStats");
    -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
    -[NSPProxyPath resetStats](self->_fallbackProxyPath, "resetStats");
    -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_storeStrong((id *)&self->_probeEndTime, v42);

    sub_100026F10((uint64_t)self);
LABEL_52:
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    goto LABEL_53;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[NSPPrivacyProxyAgentManager probeSuccess:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "%s called with null (prober == self.directPathProber)", buf, 0xCu);
  }

LABEL_53:
}

- (void)probeFailed:(id)a3
{
  NSPProber *v4;
  uint64_t v5;
  uint64_t v6;
  NSPProber *v7;
  int64_t probingReason;
  NSPProber *v9;
  NSPProber *directPathProber;
  NWPath *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int64_t v15;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  __CFString *v20;

  v4 = (NSPProber *)a3;
  v7 = v4;
  if (!self)
    goto LABEL_9;
  probingReason = self->_probingReason;
  if (probingReason == 2)
    goto LABEL_11;
  if (probingReason == 1)
  {
    if (self->_proxyPathProber == v4)
    {
      v9 = v4;
      if (v9 && v9->_probeFailedCount > 1)
      {
        directPathProber = self->_directPathProber;

        if (!directPathProber)
        {
          v11 = self->_path;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v11, "interface"));
          objc_storeStrong((id *)&self->_proberInterface, v12);

          sub_100036084((uint64_t)self, self->_proberInterface, 2);
        }
      }
      else
      {

      }
    }
  }
  else
  {
LABEL_9:
    v13 = nplog_obj(v4, v5, v6);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v15 = self->_probingReason;
        v16 = CFSTR("Unknown");
        if (v15 == 2)
          v16 = CFSTR("DNS");
        if (v15 == 1)
          v17 = CFSTR("Proxy");
        else
          v17 = (__CFString *)v16;
      }
      else
      {
        v17 = 0;
      }
      v18 = v17;
      v19 = 138412290;
      v20 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid probing reason: %@", (uint8_t *)&v19, 0xCu);

    }
  }
LABEL_11:
  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");

}

- (void)probeRedirected:(id)a3
{
  NSPProber *v4;
  uint64_t v5;
  uint64_t v6;
  NSPProber *v7;
  int64_t probingReason;
  uint64_t v9;
  NSObject *v10;
  int64_t v11;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *WeakRetained;
  uint64_t v16;
  NSPProber *directPathProber;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int64_t v21;
  const __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  int64_t v25;
  const __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  int v29;
  const char *v30;

  v4 = (NSPProber *)a3;
  v7 = v4;
  if (!self)
    goto LABEL_13;
  probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_directPathProber != v4)
      {
LABEL_24:
        -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
        goto LABEL_25;
      }
      v9 = nplog_obj(v4, v5, v6);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_probingReason;
        v12 = CFSTR("Unknown");
        if (v11 == 2)
          v12 = CFSTR("DNS");
        if (v11 == 1)
          v13 = CFSTR("Proxy");
        else
          v13 = (__CFString *)v12;
        v14 = v13;
        v29 = 138412290;
        v30 = (const char *)v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe redirected", (uint8_t *)&v29, 0xCu);

      }
      -[NSPOutageReasonStats setOutageReasonSubType:](self->_lastProxyOutageReasonStats, "setOutageReasonSubType:", CFSTR("CaptiveProbeRedirected"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject proxyConnectivityNetworkOutage](WeakRetained, "proxyConnectivityNetworkOutage");
LABEL_14:

      goto LABEL_24;
    }
LABEL_13:
    v16 = nplog_obj(v4, v5, v6);
    WeakRetained = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v25 = self->_probingReason;
        v26 = CFSTR("Unknown");
        if (v25 == 2)
          v26 = CFSTR("DNS");
        if (v25 == 1)
          v27 = CFSTR("Proxy");
        else
          v27 = (__CFString *)v26;
      }
      else
      {
        v27 = 0;
      }
      v28 = v27;
      v29 = 138412290;
      v30 = (const char *)v28;
      _os_log_error_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Invalid probing reason: %@", (uint8_t *)&v29, 0xCu);

    }
    goto LABEL_14;
  }
  directPathProber = self->_directPathProber;
  v18 = nplog_obj(v4, v5, v6);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (directPathProber == v7)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = self->_probingReason;
      v22 = CFSTR("Unknown");
      if (v21 == 2)
        v22 = CFSTR("DNS");
      if (v21 == 1)
        v23 = CFSTR("Proxy");
      else
        v23 = (__CFString *)v22;
      v24 = v23;
      v29 = 138412290;
      v30 = (const char *)v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe redirected", (uint8_t *)&v29, 0xCu);

    }
    sub_100026F10((uint64_t)self);
    goto LABEL_24;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    v29 = 136315138;
    v30 = "-[NSPPrivacyProxyAgentManager probeRedirected:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null (prober == self.directPathProber)", (uint8_t *)&v29, 0xCu);
  }

LABEL_25:
}

- (void)probeServerError:(id)a3 httpStatusCode:(int64_t)a4
{
  NSPProber *v6;
  uint64_t v7;
  uint64_t v8;
  NSPProber *v9;
  int64_t probingReason;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  const __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  NSPOutageReasonStats *lastProxyOutageReasonStats;
  NSObject *WeakRetained;
  uint64_t v19;
  NSPProber *directPathProber;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  int64_t v24;
  const __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  int64_t v28;
  const __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  int v32;
  const char *v33;

  v6 = (NSPProber *)a3;
  v9 = v6;
  if (!self)
    goto LABEL_14;
  probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_directPathProber != v6)
      {
LABEL_25:
        -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
        goto LABEL_26;
      }
      v11 = nplog_obj(v6, v7, v8);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = self->_probingReason;
        v14 = CFSTR("Unknown");
        if (v13 == 2)
          v14 = CFSTR("DNS");
        if (v13 == 1)
          v15 = CFSTR("Proxy");
        else
          v15 = (__CFString *)v14;
        v16 = v15;
        v32 = 138412290;
        v33 = (const char *)v16;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe received server error", (uint8_t *)&v32, 0xCu);

      }
      lastProxyOutageReasonStats = self->_lastProxyOutageReasonStats;
      if (a4 == 403)
      {
        -[NSPOutageReasonStats setOutageReasonSubType:](lastProxyOutageReasonStats, "setOutageReasonSubType:", CFSTR("ProxyProbeForbidden"));
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject proxyConnectivityNetworkOutage](WeakRetained, "proxyConnectivityNetworkOutage");
      }
      else
      {
        -[NSPOutageReasonStats setOutageReasonSubType:](lastProxyOutageReasonStats, "setOutageReasonSubType:", CFSTR("ProxyProbeServerError"));
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject proxyConnectivityOutage](WeakRetained, "proxyConnectivityOutage");
      }
LABEL_15:

      goto LABEL_25;
    }
LABEL_14:
    v19 = nplog_obj(v6, v7, v8);
    WeakRetained = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v28 = self->_probingReason;
        v29 = CFSTR("Unknown");
        if (v28 == 2)
          v29 = CFSTR("DNS");
        if (v28 == 1)
          v30 = CFSTR("Proxy");
        else
          v30 = (__CFString *)v29;
      }
      else
      {
        v30 = 0;
      }
      v31 = v30;
      v32 = 138412290;
      v33 = (const char *)v31;
      _os_log_error_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Invalid probing reason: %@", (uint8_t *)&v32, 0xCu);

    }
    goto LABEL_15;
  }
  directPathProber = self->_directPathProber;
  v21 = nplog_obj(v6, v7, v8);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (directPathProber == v9)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v24 = self->_probingReason;
      v25 = CFSTR("Unknown");
      if (v24 == 2)
        v25 = CFSTR("DNS");
      if (v24 == 1)
        v26 = CFSTR("Proxy");
      else
        v26 = (__CFString *)v25;
      v27 = v26;
      v32 = 138412290;
      v33 = (const char *)v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe received server error", (uint8_t *)&v32, 0xCu);

    }
    sub_100026F10((uint64_t)self);
    goto LABEL_25;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    v32 = 136315138;
    v33 = "-[NSPPrivacyProxyAgentManager probeServerError:httpStatusCode:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null (prober == self.directPathProber)", (uint8_t *)&v32, 0xCu);
  }

LABEL_26:
}

- (id)ingressProxyURL
{
  NSPQuicProxyPath *quicProxyPath;
  NSPQuicProxyPath *v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  if (self)
    quicProxyPath = self->_quicProxyPath;
  else
    quicProxyPath = 0;
  v3 = quicProxyPath;
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v3, "ingressProxy"));
  v5 = v4;
  if (v4)
    v4 = (_QWORD *)v4[3];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "proxyURL"));

  return v6;
}

- (id)ingressFallbackProxyURL
{
  NSPFallbackProxyPath *fallbackProxyPath;
  NSPFallbackProxyPath *v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  if (self)
    fallbackProxyPath = self->_fallbackProxyPath;
  else
    fallbackProxyPath = 0;
  v3 = fallbackProxyPath;
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v3, "ingressProxy"));
  v5 = v4;
  if (v4)
    v4 = (_QWORD *)v4[3];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tcpProxyFqdn"));

  return v6;
}

- (void)copyProxyInfo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSPQuicProxyPath *quicProxyPath;
  NSPQuicProxyPath *v8;
  NSPQuicProxyPath *v9;
  NSPQuicProxyPath *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSPQuicProxyPath *v16;
  NSPQuicProxyPath *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSPFallbackProxyPath *fallbackProxyPath;
  NSPFallbackProxyPath *v24;
  NSPFallbackProxyPath *v25;
  NSPFallbackProxyPath *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSPFallbackProxyPath *v32;
  NSPFallbackProxyPath *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  unint64_t tokenFetchFailedCount;
  unint64_t tokenExpiredCount;
  unint64_t cacheLowWaterMarkHitCount;
  unint64_t missingTokenCount;
  unint64_t networkFallbackProxiesRotated;
  unint64_t proxiesRotated;
  NSMutableArray *proxyTokenInfoArray;
  NSMutableArray *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  void *proxiedContentPaths;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  void *i;
  void *v75;
  void *v76;
  _QWORD *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  id obj;
  id v87;
  os_log_t log;
  NSPPrivacyProxyAgentManager *v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint8_t v105[128];
  uint8_t buf[4];
  const char *v107;

  v6 = a3;
  if (v6)
  {
    if (self)
      quicProxyPath = self->_quicProxyPath;
    else
      quicProxyPath = 0;
    v8 = quicProxyPath;

    if (v8)
    {
      if (self)
        v9 = self->_quicProxyPath;
      else
        v9 = 0;
      v10 = v9;
      v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v10, "ingressProxy"));
      v12 = (void *)v11;
      if (v11)
        v13 = *(void **)(v11 + 24);
      else
        v13 = 0;
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "proxyURL"));
      objc_msgSend(v6, "setIngressProxyURL:", v15);

      if (self)
        v16 = self->_quicProxyPath;
      else
        v16 = 0;
      v17 = v16;
      v18 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v17, "egressProxy"));
      v19 = (void *)v18;
      if (v18)
        v20 = *(void **)(v18 + 24);
      else
        v20 = 0;
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "proxyURL"));
      objc_msgSend(v6, "setEgressProxyURL:", v22);

    }
    if (self)
      fallbackProxyPath = self->_fallbackProxyPath;
    else
      fallbackProxyPath = 0;
    v24 = fallbackProxyPath;

    if (v24)
    {
      if (self)
        v25 = self->_fallbackProxyPath;
      else
        v25 = 0;
      v26 = v25;
      v27 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v26, "ingressProxy"));
      v28 = (void *)v27;
      if (v27)
        v29 = *(void **)(v27 + 24);
      else
        v29 = 0;
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tcpProxyFqdn"));
      objc_msgSend(v6, "setIngressFallbackProxyURL:", v31);

      if (self)
        v32 = self->_fallbackProxyPath;
      else
        v32 = 0;
      v33 = v32;
      v34 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v33, "egressProxy"));
      v35 = (void *)v34;
      if (v34)
        v36 = *(void **)(v34 + 24);
      else
        v36 = 0;
      v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "tcpProxyFqdn"));
      objc_msgSend(v6, "setEgressFallbackProxyURL:", v38);

    }
    if (self)
    {
      objc_msgSend(v6, "setProxyTokenFetchSuccessCount:", (char *)objc_msgSend(v6, "proxyTokenFetchSuccessCount") + self->_tokenFetchSuccessCount);
      tokenFetchFailedCount = self->_tokenFetchFailedCount;
    }
    else
    {
      objc_msgSend(v6, "setProxyTokenFetchSuccessCount:", objc_msgSend(v6, "proxyTokenFetchSuccessCount"));
      tokenFetchFailedCount = 0;
    }
    objc_msgSend(v6, "setProxyTokenFetchFailedCount:", (char *)objc_msgSend(v6, "proxyTokenFetchFailedCount") + tokenFetchFailedCount);
    if (self)
    {
      objc_msgSend(v6, "setProxyTokenConsumedCount:", (char *)objc_msgSend(v6, "proxyTokenConsumedCount") + self->_tokenConsumedCount);
      tokenExpiredCount = self->_tokenExpiredCount;
    }
    else
    {
      objc_msgSend(v6, "setProxyTokenConsumedCount:", objc_msgSend(v6, "proxyTokenConsumedCount"));
      tokenExpiredCount = 0;
    }
    objc_msgSend(v6, "setProxyTokenExpiredCount:", (char *)objc_msgSend(v6, "proxyTokenExpiredCount") + tokenExpiredCount);
    if (self)
    {
      objc_msgSend(v6, "setProxyAgentLowWaterMarkHitCount:", (char *)objc_msgSend(v6, "proxyAgentLowWaterMarkHitCount") + self->_agentLowWaterMarkHitCount);
      cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    }
    else
    {
      objc_msgSend(v6, "setProxyAgentLowWaterMarkHitCount:", objc_msgSend(v6, "proxyAgentLowWaterMarkHitCount"));
      cacheLowWaterMarkHitCount = 0;
    }
    objc_msgSend(v6, "setProxyCacheLowWaterMarkHitCount:", (char *)objc_msgSend(v6, "proxyCacheLowWaterMarkHitCount") + cacheLowWaterMarkHitCount);
    if (self)
    {
      objc_msgSend(v6, "setBadTokenCount:", (char *)objc_msgSend(v6, "badTokenCount") + self->_badTokenCount);
      missingTokenCount = self->_missingTokenCount;
    }
    else
    {
      objc_msgSend(v6, "setBadTokenCount:", objc_msgSend(v6, "badTokenCount"));
      missingTokenCount = 0;
    }
    objc_msgSend(v6, "setMissingTokenCount:", (char *)objc_msgSend(v6, "missingTokenCount") + missingTokenCount);
    if (self)
    {
      objc_msgSend(v6, "setNetworkProxiesRotated:", (char *)objc_msgSend(v6, "networkProxiesRotated") + self->_networkProxiesRotated);
      networkFallbackProxiesRotated = self->_networkFallbackProxiesRotated;
    }
    else
    {
      objc_msgSend(v6, "setNetworkProxiesRotated:", objc_msgSend(v6, "networkProxiesRotated"));
      networkFallbackProxiesRotated = 0;
    }
    objc_msgSend(v6, "setNetworkFallbackProxiesRotated:", (char *)objc_msgSend(v6, "networkFallbackProxiesRotated") + networkFallbackProxiesRotated);
    if (self)
      proxiesRotated = self->_proxiesRotated;
    else
      proxiesRotated = 0;
    objc_msgSend(v6, "setProxiesRotated:", (char *)objc_msgSend(v6, "proxiesRotated") + proxiesRotated);
    log = (os_log_t)objc_alloc_init((Class)NSMutableDictionary);
    v89 = self;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    if (self)
      proxyTokenInfoArray = self->_proxyTokenInfoArray;
    else
      proxyTokenInfoArray = 0;
    v46 = proxyTokenInfoArray;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v100;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v100 != v49)
            objc_enumerationMutation(v46);
          v51 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v50);
          if (v51)
            v52 = *(void **)(v51 + 24);
          else
            v52 = 0;
          v53 = v52;
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "vendor"));

          if (v54)
          {
            v55 = objc_alloc_init((Class)PrivacyProxyTokenInfo);
            v56 = v55;
            if (v51)
            {
              objc_msgSend(v55, "setCachedTokens:", *(_QWORD *)(v51 + 32));
              v57 = *(_QWORD *)(v51 + 40);
              if (v57)
                v58 = objc_msgSend(*(id *)(v57 + 24), "tokenCount");
              else
                v58 = 0;
              objc_msgSend(v56, "setAgentTokens:", v58);
              if (*(_BYTE *)(v51 + 11))
                v59 = 30;
              else
                v59 = 10;
            }
            else
            {
              objc_msgSend(v55, "setCachedTokens:", 0);
              objc_msgSend(v56, "setAgentTokens:", 0);
              v59 = 0;
            }
            objc_msgSend(v56, "setCacheLowWaterMark:", v59);
            objc_msgSend(v56, "setAgentLowWaterMark:", sub_10000E610(v51));
            -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v56, v54);

          }
          if (v51)
          {
            objc_msgSend(v6, "setProxyTokenFetchSuccessCount:", (char *)objc_msgSend(v6, "proxyTokenFetchSuccessCount") + *(_QWORD *)(v51 + 88));
            v60 = *(_QWORD *)(v51 + 112);
          }
          else
          {
            objc_msgSend(v6, "setProxyTokenFetchSuccessCount:", objc_msgSend(v6, "proxyTokenFetchSuccessCount"));
            v60 = 0;
          }
          objc_msgSend(v6, "setProxyTokenFetchFailedCount:", (char *)objc_msgSend(v6, "proxyTokenFetchFailedCount") + v60);
          if (v51)
          {
            objc_msgSend(v6, "setProxyTokenConsumedCount:", (char *)objc_msgSend(v6, "proxyTokenConsumedCount") + *(_QWORD *)(v51 + 96));
            v61 = *(_QWORD *)(v51 + 104);
          }
          else
          {
            objc_msgSend(v6, "setProxyTokenConsumedCount:", objc_msgSend(v6, "proxyTokenConsumedCount"));
            v61 = 0;
          }
          objc_msgSend(v6, "setProxyTokenExpiredCount:", (char *)objc_msgSend(v6, "proxyTokenExpiredCount") + v61);
          if (v51)
          {
            objc_msgSend(v6, "setProxyAgentLowWaterMarkHitCount:", (char *)objc_msgSend(v6, "proxyAgentLowWaterMarkHitCount") + *(_QWORD *)(v51 + 120));
            v62 = *(_QWORD *)(v51 + 128);
          }
          else
          {
            objc_msgSend(v6, "setProxyAgentLowWaterMarkHitCount:", objc_msgSend(v6, "proxyAgentLowWaterMarkHitCount"));
            v62 = 0;
          }
          objc_msgSend(v6, "setProxyCacheLowWaterMarkHitCount:", (char *)objc_msgSend(v6, "proxyCacheLowWaterMarkHitCount") + v62);
          if (v51)
          {
            objc_msgSend(v6, "setBadTokenCount:", (char *)objc_msgSend(v6, "badTokenCount") + *(_QWORD *)(v51 + 136));
            v51 = *(_QWORD *)(v51 + 144);
          }
          else
          {
            objc_msgSend(v6, "setBadTokenCount:", objc_msgSend(v6, "badTokenCount"));
          }
          objc_msgSend(v6, "setMissingTokenCount:", (char *)objc_msgSend(v6, "missingTokenCount") + v51);

          v50 = (char *)v50 + 1;
        }
        while (v48 != v50);
        v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
        v48 = v63;
      }
      while (v63);
    }

    objc_msgSend(v6, "setTokenCounts:", log);
    v64 = objc_alloc_init((Class)NSMutableArray);
    v87 = objc_alloc_init((Class)NSMutableDictionary);
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    proxiedContentPaths = v89;
    if (v89)
      proxiedContentPaths = v89->_proxiedContentPaths;
    obj = proxiedContentPaths;
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
    if (v66)
    {
      v67 = v66;
      v90 = *(_QWORD *)v96;
      do
      {
        v68 = 0;
        do
        {
          if (*(_QWORD *)v96 != v90)
            objc_enumerationMutation(obj);
          v69 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)v68);
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "associatedMaps"));
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
          if (v71)
          {
            v72 = v71;
            v73 = *(_QWORD *)v92;
            do
            {
              for (i = 0; i != v72; i = (char *)i + 1)
              {
                if (*(_QWORD *)v92 != v73)
                  objc_enumerationMutation(v70);
                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1)
                                                                                   + 8 * (_QWORD)i), "identifier"));
                objc_msgSend(v64, "addObject:", v75);

              }
              v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
            }
            while (v72);
          }

          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "ingressProxy"));
          if (v76)
            v77 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "ingressProxy"));
          else
            v77 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "egressProxy"));
          v78 = v77;
          if (v77)
            v77 = (_QWORD *)v77[3];
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "vendor"));

          if (v79)
          {
            v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "quicRegistration"));
            v81 = (void *)v80;
            if (v80)
              v82 = objc_msgSend(*(id *)(v80 + 24), "tokenCount");
            else
              v82 = 0;

            v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v82));
            objc_msgSend(v87, "setObject:forKeyedSubscript:", v83, v79);

          }
          v68 = (char *)v68 + 1;
        }
        while (v68 != v67);
        v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
        v67 = v84;
      }
      while (v84);
    }

    objc_msgSend(v6, "setResumableSessionCounts:", v87);
    objc_msgSend(v6, "setEnabledProxiedContentMaps:", v64);

  }
  else
  {
    v85 = nplog_obj(0, v4, v5);
    log = (os_log_t)objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v107 = "-[NSPPrivacyProxyAgentManager copyProxyInfo:]";
      _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s called with null proxyInfo", buf, 0xCu);
    }
  }

}

- (void)updateUserEventAgentData
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = -[NSPPrivacyProxyAgentManager deferCommit](self, "deferCommit");
  if (!v3)
  {
    v6 = nplog_obj(v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Updating userevent agent data", v12, 2u);
    }

    v8 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    -[NSPPrivacyProxyAgentManager encodeWithCoder:](self, "encodeWithCoder:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encodedData"));
    objc_msgSend(v9, "setAuxiliaryData:forKey:", v10, CFSTR("NSPProxyAgentManagerAuxilaryData"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
    objc_msgSend(v11, "commit");

  }
}

- (void)setUserEventAgentTokenFetchParameters
{
  NSMutableArray *proxyTokenInfoArray;
  NSMutableArray *v3;
  char v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  id v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  char v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  if (self)
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  else
    proxyTokenInfoArray = 0;
  v3 = proxyTokenInfoArray;
  v4 = 0;
  v5 = 0;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v8);
        if (v5)
        {
          if (v9)
          {
            v10 = *(id *)(v9 + 80);
            if (v10)
            {
              v11 = v10;
              objc_msgSend(*(id *)(v9 + 80), "timeIntervalSinceDate:", v5);
              v13 = v12 < 0.0;

              if (v13)
              {
                v14 = *(id *)(v9 + 80);

                v5 = v14;
              }
            }
            goto LABEL_15;
          }
        }
        else
        {
          if (v9)
          {
            v5 = *(id *)(v9 + 80);
LABEL_15:
            v15 = *(_BYTE *)(v9 + 9) != 0;
            goto LABEL_16;
          }
          v5 = 0;
        }
        v15 = 0;
LABEL_16:
        v4 |= v15;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v6 = v16;
    }
    while (v16);
  }

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_1000030EC;
  v24[4] = sub_10000C20C;
  v25 = (id)os_transaction_create("com.apple.networkserviceproxy.setUserEventAgentTokenFetchParameters");
  v17 = NPGetInternalQueue(v25);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BD04;
  block[3] = &unk_1000F5B90;
  v23 = v4 & 1;
  v21 = v5;
  v22 = v24;
  v19 = v5;
  dispatch_async(v18, block);

  _Block_object_dispose(v24, 8);
}

- (void)setUserEventAgentProberParameters
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1000030EC;
  v6[4] = sub_10000C20C;
  v7 = (id)os_transaction_create("com.apple.networkserviceproxy.setUserEventAgentProberParameters");
  v3 = NPGetInternalQueue(v7);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003BE8C;
  v5[3] = &unk_1000F5428;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(v4, v5);

  _Block_object_dispose(v6, 8);
}

- (void)reportTokenFetchFailure:(id)a3 statusCode:(int64_t)a4
{
  NSPTokenServerStats *v5;
  void *v6;
  void *v7;
  NWPath *path;
  NWPath *v9;
  void *v10;
  NSPTokenServerStats *v11;
  _QWORD v12[5];
  NSPTokenServerStats *v13;

  -[NSPPrivacyProxyAgentManager sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:](self, "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:", 1003, a4, a3, 0, 0);
  v5 = objc_alloc_init(NSPTokenServerStats);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tierString](self, "tierString"));
  -[NSPTokenServerStats setTierType:](v5, "setTierType:", v6);

  if (self && self->_tokenServerMaskedAddress)
  {
    -[NSPTokenServerStats setTokenServerAddress:](v5, "setTokenServerAddress:");
    -[NSPProxyAnalytics sendAnalytics](v5, "sendAnalytics");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyTokenManager sharedTokenManager](NSPPrivacyTokenManager, "sharedTokenManager"));
    if (self)
      path = self->_path;
    else
      path = 0;
    v9 = path;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v9, "interface"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003C198;
    v12[3] = &unk_1000F5BB8;
    v12[4] = self;
    v11 = v5;

    v13 = v11;
    objc_msgSend(v7, "getTokenServerIPWithInterface:completionHandler:", v10, v12);

  }
}

- (id)singleHopQUICProxyConfigHash:(id)a3
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  return -[NSPPrivacyProxyAgentManager multiHopConfigurationHash](self, "multiHopConfigurationHash", a3);
}

- (id)multiHopQUICProxyConfigHash:(id)a3
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  return -[NSPPrivacyProxyAgentManager singleHopConfigurationHash](self, "singleHopConfigurationHash", a3);
}

- (id)multiHopFallbackProxyConfigHash:(id)a3
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  return -[NSPPrivacyProxyAgentManager multiHopConfigurationHash](self, "multiHopConfigurationHash", a3);
}

- (id)singleHopFallbackProxyConfigHash:(id)a3
{
  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  return -[NSPPrivacyProxyAgentManager singleHopConfigurationHash](self, "singleHopConfigurationHash", a3);
}

- (id)alternatePreferredPathAgentUUIDs:(id)a3
{
  NSMutableDictionary *preferredQUICProxyPaths;
  id v5;
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v26;
  NSMutableDictionary *obj;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v29 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  if (self)
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
  else
    preferredQUICProxyPaths = 0;
  obj = preferredQUICProxyPaths;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v5)
  {
    v26 = 0;
    goto LABEL_31;
  }
  v6 = v5;
  v26 = 0;
  v28 = *(_QWORD *)v31;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v31 != v28)
        objc_enumerationMutation(obj);
      if (self)
        v8 = self->_preferredQUICProxyPaths;
      else
        v8 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v7), v26));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "egressProxy"));
      v11 = (void *)v10;
      if (v10)
        v12 = *(void **)(v10 + 24);
      else
        v12 = 0;
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vendor"));
      v15 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "egressProxy"));
      v16 = v15;
      if (v15)
        v15 = (_QWORD *)v15[3];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "vendor"));
      v18 = objc_msgSend(v14, "isEqualToString:", v17);

      if ((v18 & 1) == 0)
      {
        v19 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "egressProxy"));
        v20 = v19;
        if (v19)
          v19 = (_QWORD *)v19[3];
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preferredPathPatterns"));
        if (objc_msgSend(v21, "count"))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nonDefaultAgentUUID"));

          if (!v22)
            goto LABEL_24;
          v23 = v26;
          if (!v26)
            v23 = objc_alloc_init((Class)NSMutableArray);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nonDefaultAgentUUID"));
          v26 = v23;
          objc_msgSend(v23, "addObject:", v20);
        }
        else
        {

        }
      }
LABEL_24:

      v7 = (char *)v7 + 1;
    }
    while (v6 != v7);
    v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v6 = v24;
  }
  while (v24);
LABEL_31:

  return v26;
}

- (void)didReceiveUpdatedPvDOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t isKindOfClass;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSPPvDConfigurationFetcher *pvdConfigurationFetcher;
  NSPPvDConfigurationFetcher *v29;
  id WeakRetained;
  id *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint8_t *v36;
  uint64_t v37;
  __int16 v38;
  __int16 v39;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = kSCPropNetPvDHTTPSupported;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kSCPropNetPvDHTTPSupported));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = kSCPropNetPvDIdentifier;
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kSCPropNetPvDIdentifier));
      if (!v10)
      {
LABEL_21:

        goto LABEL_22;
      }
      v11 = (void *)v10;
      v12 = kSCPropNetPvDAdditionalInformation;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kSCPropNetPvDAdditionalInformation));

      if (v13)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v12));
        v14 = objc_opt_class(NSDictionary);
        isKindOfClass = objc_opt_isKindOfClass(v8, v14);
        if ((isKindOfClass & 1) == 0)
        {
          v32 = nplog_obj(isKindOfClass, v16, v17);
          v23 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "PvD additional info not in the correct format", buf, 2u);
          }
          goto LABEL_20;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));
        v19 = objc_msgSend(v18, "intValue");

        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v9));
        v23 = v20;
        if (v19 == 1)
        {
          if (-[NSObject length](v20, "length"))
          {
            v26 = objc_alloc_init((Class)NSURLComponents);
            objc_msgSend(v26, "setPath:", CFSTR("/.well-known/pvd"));
            objc_msgSend(v26, "setScheme:", CFSTR("https"));
            objc_msgSend(v26, "setHost:", v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "URL"));
            if (self)
            {
              pvdConfigurationFetcher = self->_pvdConfigurationFetcher;
              if (pvdConfigurationFetcher)
              {
LABEL_13:
                sub_100049734(pvdConfigurationFetcher, v8, v27);

LABEL_20:
                goto LABEL_21;
              }
              v29 = [NSPPvDConfigurationFetcher alloc];
              WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            }
            else
            {
              v29 = [NSPPvDConfigurationFetcher alloc];
              WeakRetained = 0;
            }
            v31 = sub_1000486F4((id *)&v29->super.isa, self, WeakRetained);
            sub_1000231CC((uint64_t)self, v31);

            if (self)
              pvdConfigurationFetcher = self->_pvdConfigurationFetcher;
            else
              pvdConfigurationFetcher = 0;
            goto LABEL_13;
          }
          v37 = nplog_obj(0, v24, v25);
          v34 = objc_claimAutoreleasedReturnValue(v37);
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
LABEL_19:

            goto LABEL_20;
          }
          v38 = 0;
          v35 = "Identifier was not found in PvD options";
          v36 = (uint8_t *)&v38;
        }
        else
        {
          v33 = nplog_obj(v20, v21, v22);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          v39 = 0;
          v35 = "HTTP over TLS is not supported";
          v36 = (uint8_t *)&v39;
        }
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, v36, 2u);
        goto LABEL_19;
      }
    }
  }
LABEL_22:

}

- (BOOL)networkDiscoveredProxyPresentInAgentManager
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  if (self)
    self = (NSPPrivacyProxyAgentManager *)self->_networkSpecificQUICProxyPaths;
  v2 = -[NSPPrivacyProxyAgentManager count](self, "count");
  v5 = v2;
  if (v2)
  {
    v6 = nplog_obj(v2, v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Network discovered proxy was found to be present", v9, 2u);
    }

  }
  return v5 != 0;
}

- (void)setupMasqueProxyWith:(id)a3
{
  NWPath *v4;
  void *v5;
  NSMutableDictionary *networkDiscoveredProxyInfos;
  id v7;
  NSMutableDictionary *v8;
  NWPath *path;
  NWPath *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  if (v14)
  {
    v4 = self ? self->_path : 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v4, "interface"));

    if (v5)
    {
      if (self)
      {
        networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
        if (!networkDiscoveredProxyInfos)
        {
          v7 = objc_alloc_init((Class)NSMutableDictionary);
          sub_1000230DC((uint64_t)self, v7);

          networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
        }
        v8 = networkDiscoveredProxyInfos;
        path = self->_path;
      }
      else
      {
        v13 = objc_alloc_init((Class)NSMutableDictionary);
        sub_1000230DC(0, v13);

        v8 = 0;
        path = 0;
      }
      v10 = path;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v10, "interface"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interfaceName"));
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v14, v12);

      sub_100031148((uint64_t)self);
    }
  }

}

- (BOOL)dnsFilteringHintEnabled
{
  return self->dnsFilteringHintEnabled;
}

- (void)setDnsFilteringHintEnabled:(BOOL)a3
{
  self->dnsFilteringHintEnabled = a3;
}

- (NSString)geohashOverride
{
  return self->geohashOverride;
}

- (void)setGeohashOverride:(id)a3
{
  objc_storeStrong((id *)&self->geohashOverride, a3);
}

- (NSDate)tokenIssuanceRestrictedUntilDate
{
  return self->_tokenIssuanceRestrictedUntilDate;
}

- (NSString)overridePreferredProxy
{
  return self->_overridePreferredProxy;
}

- (NSString)overridePreferredObliviousProxy
{
  return self->_overridePreferredObliviousProxy;
}

- (NSString)overrideIngressProxy
{
  return self->_overrideIngressProxy;
}

- (NSString)overrideFallbackIngressProxy
{
  return self->_overrideFallbackIngressProxy;
}

- (NSData)overrideIngressProxyKey
{
  return self->_overrideIngressProxyKey;
}

- (BOOL)forceFallback
{
  return self->_forceFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenServerMaskedAddress, 0);
  objc_storeStrong((id *)&self->_toggleStats, 0);
  objc_storeStrong((id *)&self->_lastTokenOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_lastProxyOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_reportedEpoch, 0);
  objc_storeStrong((id *)&self->_configEpoch, 0);
  objc_storeStrong((id *)&self->_networkCharacteristics, 0);
  objc_storeStrong((id *)&self->_lastPrimaryInterfaceChangedDate, 0);
  objc_storeStrong((id *)&self->_lastPathUnsatisfiedDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_tokenIssuanceRestrictedUntilTimer, 0);
  objc_storeStrong((id *)&self->_proxyTokenInfoArray, 0);
  objc_storeStrong((id *)&self->_obliviousPaths, 0);
  objc_storeStrong((id *)&self->_networkDiscoveredProxyInfos, 0);
  objc_storeStrong((id *)&self->_networkSpecificQUICProxyPaths, 0);
  objc_storeStrong((id *)&self->_proxiedContentPaths, 0);
  objc_storeStrong((id *)&self->_candidatePreferredQUICProxyPaths, 0);
  objc_storeStrong((id *)&self->_preferredQUICProxyPaths, 0);
  objc_storeStrong((id *)&self->_lastFallbackProxySwitchedDate, 0);
  objc_storeStrong((id *)&self->_lastQuicProxySwitchedDate, 0);
  objc_storeStrong((id *)&self->_probeEndTime, 0);
  objc_storeStrong((id *)&self->_probeStartTime, 0);
  objc_storeStrong((id *)&self->_proberInterface, 0);
  objc_storeStrong((id *)&self->_pvdConfigurationFetcher, 0);
  objc_storeStrong((id *)&self->_directPathProber, 0);
  objc_storeStrong((id *)&self->_proxyPathProber, 0);
  objc_storeStrong((id *)&self->_candidateFallbackProxyPath, 0);
  objc_storeStrong((id *)&self->_candidateQuicProxyPath, 0);
  objc_storeStrong((id *)&self->_fallbackProxyPath, 0);
  objc_storeStrong((id *)&self->_quicProxyPath, 0);
  objc_storeStrong((id *)&self->_replenishTokenTimer, 0);
  objc_storeStrong((id *)&self->_proxyPathRestoreTimer, 0);
  objc_storeStrong((id *)&self->_savedConfiguredPreferredPaths, 0);
  objc_storeStrong((id *)&self->_savedConfiguredProxies, 0);
  objc_storeStrong((id *)&self->_overrideEnabledMaps, 0);
  objc_storeStrong((id *)&self->_proxiedContentMaps, 0);
  objc_storeStrong((id *)&self->_penalizedObliviousProxyIndices, 0);
  objc_storeStrong((id *)&self->_obliviousConfigs, 0);
  objc_storeStrong((id *)&self->_fallbackProxyPathCustomEnumerator, 0);
  objc_storeStrong((id *)&self->_fallbackProxyPathList, 0);
  objc_storeStrong((id *)&self->_proxyPathCustomEnumerator, 0);
  objc_storeStrong((id *)&self->_proxyPathList, 0);
  objc_storeStrong((id *)&self->_resolverArray, 0);
  objc_storeStrong((id *)&self->_proxyArray, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideIngressProxyKey, 0);
  objc_storeStrong((id *)&self->_overrideFallbackIngressProxy, 0);
  objc_storeStrong((id *)&self->_overrideIngressProxy, 0);
  objc_storeStrong((id *)&self->_overridePreferredObliviousProxy, 0);
  objc_storeStrong((id *)&self->_overridePreferredProxy, 0);
  objc_storeStrong((id *)&self->_tokenIssuanceRestrictedUntilDate, 0);
  objc_storeStrong((id *)&self->geohashOverride, 0);
}

@end
