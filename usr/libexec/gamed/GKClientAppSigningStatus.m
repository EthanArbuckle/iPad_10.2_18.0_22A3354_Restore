@implementation GKClientAppSigningStatus

+ (id)hashForAuditToken:(id *)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d%d%d%d%d%d%d%d"), a3->var0[0], a3->var0[1], a3->var0[2], a3->var0[3], a3->var0[4], a3->var0[5], a3->var0[6], a3->var0[7]);
}

+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4
{
  __int128 v4;
  _OWORD v6[2];

  v4 = *(_OWORD *)&a4->var0[4];
  v6[0] = *(_OWORD *)a4->var0;
  v6[1] = v4;
  return +[GKClientAppSigningStatus appIsDevSigned:auditToken:csopsFnValidCat:csopsFnStatus:](GKClientAppSigningStatus, "appIsDevSigned:auditToken:csopsFnValidCat:csopsFnStatus:", *(_QWORD *)&a3, v6, &csops_audittoken, &csops_audittoken);
}

+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4
{
  __int128 v4;
  _OWORD v6[2];

  v4 = *(_OWORD *)&a4->var0[4];
  v6[0] = *(_OWORD *)a4->var0;
  v6[1] = v4;
  return +[GKClientAppSigningStatus appSignatureType:auditToken:csopsFnValidCat:csopsFnStatus:](GKClientAppSigningStatus, "appSignatureType:auditToken:csopsFnValidCat:csopsFnStatus:", *(_QWORD *)&a3, v6, &csops_audittoken, &csops_audittoken);
}

+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  __int128 v6;
  void *v7;
  unsigned int v8;
  _BOOL4 v9;
  unint64_t v10;
  _OWORD v12[2];

  v6 = *(_OWORD *)&a4->var0[4];
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientAppSigningStatus opsValidationCategoryAndStatus:auditToken:csopsFnValidCat:csopsFnStatus:](GKClientAppSigningStatus, "opsValidationCategoryAndStatus:auditToken:csopsFnValidCat:csopsFnStatus:", *(_QWORD *)&a3, v12, a5, a6));
  if (objc_msgSend(v7, "category") && objc_msgSend(v7, "status"))
  {
    if (objc_msgSend(v7, "category") == 3)
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      v9 = objc_msgSend(v7, "category") == 10 || objc_msgSend(v7, "category") == 1;
      v10 = (unint64_t)objc_msgSend(v7, "status") & 4;
      objc_msgSend(v7, "setStatus:", v10);
      v8 = v9 & (v10 >> 2);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  __int128 v6;
  void *v7;
  unsigned int v8;
  int64_t v9;
  _OWORD v11[2];

  v6 = *(_OWORD *)&a4->var0[4];
  v11[0] = *(_OWORD *)a4->var0;
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientAppSigningStatus opsValidationCategoryAndStatus:auditToken:csopsFnValidCat:csopsFnStatus:](GKClientAppSigningStatus, "opsValidationCategoryAndStatus:auditToken:csopsFnValidCat:csopsFnStatus:", *(_QWORD *)&a3, v11, a5, a6));
  v8 = objc_msgSend(v7, "category") - 2;
  if (v8 > 8)
    v9 = 0;
  else
    v9 = qword_1002329D8[v8];

  return v9;
}

+ (id)opsValidationCategoryAndStatus:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  uint64_t v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  OpsValidationCategoryAndStatus *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  OpsValidationCategoryAndStatus *v21;
  OpsValidationCategoryAndStatus *v22;
  void *v23;
  OpsValidationCategoryAndStatus *v24;
  unsigned int v26;
  _OWORD v27[2];

  v9 = *(_QWORD *)&a3;
  v10 = *(_OWORD *)&a4->var0[4];
  v27[0] = *(_OWORD *)a4->var0;
  v27[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientAppSigningStatus hashForAuditToken:](GKClientAppSigningStatus, "hashForAuditToken:", v27));
  v12 = objc_claimAutoreleasedReturnValue(+[SigningStatusCache getValue:](SigningStatusCache, "getValue:", v11));
  if (v12)
  {
    v13 = (void *)v12;
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v12);
    if (os_log_type_enabled(os_log_GKLRUCache, OS_LOG_TYPE_DEBUG))
      sub_100133930();
    v15 = v13;
  }
  else
  {
    if (!os_log_GKGeneral)
      v16 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKLRUCache, OS_LOG_TYPE_DEBUG))
      sub_1001338D0();
    LODWORD(v27[0]) = 0;
    v17 = ((uint64_t (*)(uint64_t, uint64_t, _OWORD *, uint64_t, $115C4C562B26FF47E01F9F4EA65B5887 *))a5)(v9, 17, v27, 4, a4);
    if ((_DWORD)v17)
    {
      if (!os_log_GKGeneral)
        v18 = (id)GKOSLoggers(v17);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_100133870();
      LODWORD(v27[0]) = 0;
    }
    v26 = 0;
    v19 = ((uint64_t (*)(uint64_t, _QWORD, unsigned int *, uint64_t, $115C4C562B26FF47E01F9F4EA65B5887 *))a6)(v9, 0, &v26, 4, a4);
    if ((_DWORD)v19)
    {
      if (!os_log_GKGeneral)
        v20 = (id)GKOSLoggers(v19);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_100133810();
      v26 = 0;
    }
    v21 = [OpsValidationCategoryAndStatus alloc];
    v22 = -[OpsValidationCategoryAndStatus initWithOpsValidationCategory:status:](v21, "initWithOpsValidationCategory:status:", LODWORD(v27[0]), v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SigningStatusCache sharedInstance](SigningStatusCache, "sharedInstance"));
    objc_msgSend(v23, "insertValue:forKey:", v22, v11);

    v15 = v22;
  }
  v24 = v15;

  return v24;
}

+ (id)headerValueForSignatureType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("unknown");
  else
    return *(&off_1002C4A38 + a3 - 1);
}

@end
