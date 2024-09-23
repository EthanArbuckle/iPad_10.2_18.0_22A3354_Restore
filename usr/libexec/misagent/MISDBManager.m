@implementation MISDBManager

- (BOOL)setupSchema
{
  MISProfileModel *v3;
  MISProfileModel *Profiles;
  MISEntitlementsModel *v5;
  MISEntitlementsModel *Entitlements;
  unsigned int v7;
  BOOL v8;
  id v10;
  NSObject *v11;
  _QWORD v12[7];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MISDBManager;
  if (!-[SQLDB setupSchema](&v19, "setupSchema"))
    return 0;
  if (-[SQLDB checkpoint](self, "checkpoint"))
  {
    v10 = sub_10000757C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10000AC20(v11);

    abort();
  }
  v3 = -[MISProfileModel initWithDB:]([MISProfileModel alloc], "initWithDB:", self);
  Profiles = self->Profiles;
  self->Profiles = v3;

  v5 = -[MISEntitlementsModel initWithDB:]([MISEntitlementsModel alloc], "initWithDB:", self);
  Entitlements = self->Entitlements;
  self->Entitlements = v5;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100004254;
  v13[4] = sub_100004264;
  v14 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000426C;
  v12[3] = &unk_100010788;
  v12[4] = self;
  v12[5] = v13;
  v12[6] = &v15;
  v7 = -[SQLDB transaction:immediate:](self, "transaction:immediate:", v12, 1);
  *((_DWORD *)v16 + 6) = v7;
  v8 = v7 == 0;
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5
{
  return -[MISProfileModel queryCMSBlobForProfile:forcingXML:handler:](self->Profiles, "queryCMSBlobForProfile:forcingXML:handler:", a3, a4, a5);
}

- (void)queryProfile:(id)a3
{
  return -[MISProfileModel queryProfile:](self->Profiles, "queryProfile:", a3);
}

- (BOOL)isProfileInstalled:(id)a3
{
  return -[MISProfileModel isProfileInstalled:](self->Profiles, "isProfileInstalled:", a3);
}

- (int)insertProfile:(void *)a3
{
  int v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004A58;
  v5[3] = &unk_1000107B0;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[SQLDB transaction:](self, "transaction:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)removeProfile:(id)a3
{
  id v3;
  int v4;
  _QWORD v6[4];
  MISDBManager *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004B98;
  v6[3] = &unk_1000107D8;
  v9 = &v10;
  v7 = self;
  v3 = a3;
  v8 = v3;
  -[SQLDB transaction:](v7, "transaction:", v6);
  v4 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)allCMSBlobs
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004CDC;
  v10[3] = &unk_100010800;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 20));
  v11 = v3;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("SELECT cms_blob FROM profiles WHERE is_der = 0"), 0, v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004D54;
  v8[3] = &unk_100010800;
  v4 = v3;
  v9 = v4;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("SELECT cms_blob as blob FROM xml_profiles_cache"), 0, v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (id)allProfiles
{
  id v3;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004E60;
  v5[3] = &unk_100010800;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 20));
  v6 = v3;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("SELECT uuid, team_id, name, expires, is_for_all_devices, is_apple_internal, is_local, is_beta FROM profiles"), 0, v5);

  return v3;
}

- (id)findProfilesMatchingEntitlements:(id)a3 withCertificate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 10));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MISDBManager Entitlements](self, "Entitlements"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004FA0;
  v13[3] = &unk_100010828;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "emitEntitlementPredicates:predicateHandler:", v7, v13);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MISDBManager findProfilesMatchingPredicates:withCertificate:](self, "findProfilesMatchingPredicates:withCertificate:", v10, v6));
  return v11;
}

- (id)findProfilesMatchingPredicates:(id)a3 withCertificate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  if (v7)
    v9 = CFSTR("SELECT uuid FROM certificate_provisioning_cache JOIN certificates ON certificates.pk = leaf_pk WHERE certificates.leaf = @cert");
  else
    v9 = CFSTR("SELECT uuid FROM profiles");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000515C;
  v23[3] = &unk_100010850;
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 1024));
  v10 = v24;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WITH predicates(idx, predicate) AS (VALUES %@), filteredProfileUUIDs(uuid) AS (%@) SELECT * FROM (SELECT profiles.uuid, profiles.team_id, profiles.name, profiles.expires, profiles.is_for_all_devices, profiles.is_apple_internal, profiles.is_local, profiles.is_beta, profiles.is_der, COUNT(DISTINCT predicates.idx) as matchCount FROM filteredProfileUUIDs JOIN profiles ON profiles.uuid = filteredProfileUUIDs.uuid JOIN entitlements_provisioning_cache ON entitlements_provisioning_cache.uuid = filteredProfileUUIDs.uuid CROSS JOIN predicates WHERE profiles.is_apple_internal OR ((entitlements_provisioning_cache.wildcard = 0 AND entitlements_provisioning_cache.predicate = predicates.predicate) OR (entitlements_provisioning_cache.wildcard = 1 AND glob(entitlements_provisioning_cache.predicate, predicates.predicate))) GROUP BY profiles.uuid, profiles.is_apple_internal) AS aggregated WHERE aggregated.matchCount = @totalPredicates OR aggregated.is_apple_internal ORDER BY  aggregated.is_der DESC, aggregated.is_local ASC, aggregated.is_for_all_devices ASC"), v10, v9));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000051B0;
  v20[3] = &unk_100010878;
  v21 = v7;
  v22 = v6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100005330;
  v18[3] = &unk_100010800;
  v12 = v8;
  v19 = v12;
  v13 = v6;
  v14 = v7;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", v11, v20, v18);

  v15 = v19;
  v16 = v12;

  return v16;
}

- (id)findProfilesWithCertificate:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  v6 = CFSTR("SELECT uuid FROM certificate_provisioning_cache JOIN certificates ON certificates.pk = leaf_pk WHERE certificates.leaf = @cert");
  if (!v4)
    v6 = CFSTR("SELECT uuid FROM profiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WITH filteredProfileUUIDs(uuid) AS (%@) SELECT profiles.uuid, profiles.team_id, profiles.name, profiles.expires, profiles.is_for_all_devices, profiles.is_apple_internal, profiles.is_local, profiles.is_beta, profiles.is_der FROM filteredProfileUUIDs JOIN profiles ON profiles.uuid = filteredProfileUUIDs.uuid ORDER BY  profiles.is_der DESC, profiles.is_local ASC, profiles.is_for_all_devices ASC"), v6));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000054A4;
  v15[3] = &unk_100010760;
  v16 = v4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005524;
  v13[3] = &unk_100010800;
  v8 = v5;
  v14 = v8;
  v9 = v4;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", v7, v15, v13);

  v10 = v14;
  v11 = v8;

  return v11;
}

- (MISEntitlementsModel)Entitlements
{
  return (MISEntitlementsModel *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEntitlements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MISProfileModel)Profiles
{
  return (MISProfileModel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProfiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->Profiles, 0);
  objc_storeStrong((id *)&self->Entitlements, 0);
}

@end
