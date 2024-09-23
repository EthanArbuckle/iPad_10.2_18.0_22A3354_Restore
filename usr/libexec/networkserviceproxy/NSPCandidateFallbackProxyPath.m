@implementation NSPCandidateFallbackProxyPath

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  v9 = (void *)v8;
  if (v8)
    v10 = *(void **)(v8 + 24);
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  v13 = (void *)v12;
  if (v12)
    v14 = *(void **)(v12 + 24);
  else
    v14 = 0;
  v15 = v14;
  v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:](NSPPrivacyProxyAgentManager, "proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:", v7, v6, v11, v15, -[NSPCandidateProxyPath proxyPathWeight](self, "proxyPathWeight"), 1);

  return v16;
}

@end
