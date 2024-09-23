@implementation MIAppReferenceTracker

+ (id)managerForInstallationDomain:(unint64_t)a3
{
  void *v4;
  id v5;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CFD8;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009E020 != -1)
    dispatch_once(&qword_10009E020, block);
  if (a3 == 2)
  {
    v4 = (void *)qword_10009E010;
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    v4 = (void *)qword_10009E018;
LABEL_7:
    v5 = v4;
    return v5;
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "+[MIAppReferenceTracker managerForInstallationDomain:]", CFSTR("Request for manager for unknown domain: %lu"));
  v5 = 0;
  return v5;
}

- (id)initForInstallationDomain:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIAppReferenceTracker;
  result = -[MIAppReferenceTracker init](&v5, "init");
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (BOOL)referenceExists:(BOOL *)a3 forIdentity:(id)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v7 = sub_100010E50((uint64_t)"-[MIAppReferenceTracker referenceExists:forIdentity:error:]", 59, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v5, (uint64_t)"-[MIAppReferenceTracker referenceExists:forIdentity:error:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (a5)
    *a5 = objc_retainAutorelease(v8);

  return 0;
}

- (BOOL)addReferenceForIdentity:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v6 = sub_100010E50((uint64_t)"-[MIAppReferenceTracker addReferenceForIdentity:error:]", 68, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v4, (uint64_t)"-[MIAppReferenceTracker addReferenceForIdentity:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (BOOL)removeReferenceForIdentity:(id)a3 waitingForSpaceReclaimation:(BOOL)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v7 = sub_100010E50((uint64_t)"-[MIAppReferenceTracker removeReferenceForIdentity:waitingForSpaceReclaimation:error:]", 77, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v5, (uint64_t)"-[MIAppReferenceTracker removeReferenceForIdentity:waitingForSpaceReclaimation:error:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (a5)
    *a5 = objc_retainAutorelease(v8);

  return 0;
}

- (id)addTemporaryReferenceForIdentity:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v6 = sub_100010E50((uint64_t)"-[MIAppReferenceTracker addTemporaryReferenceForIdentity:error:]", 86, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v4, (uint64_t)"-[MIAppReferenceTracker addTemporaryReferenceForIdentity:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (BOOL)finalizeTemporaryReference:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v6 = sub_100010E50((uint64_t)"-[MIAppReferenceTracker finalizeTemporaryReference:error:]", 95, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v4, (uint64_t)"-[MIAppReferenceTracker finalizeTemporaryReference:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (BOOL)revokeTemporaryReference:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v6 = sub_100010E50((uint64_t)"-[MIAppReferenceTracker revokeTemporaryReference:error:]", 104, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v4, (uint64_t)"-[MIAppReferenceTracker revokeTemporaryReference:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (void)enumerateAppReferencesWithBlock:(id)a3
{
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIAppReferenceTracker enumerateAppReferencesWithBlock:]", CFSTR("%s is not yet implemented"));
}

- (unint64_t)domain
{
  return self->_domain;
}

@end
