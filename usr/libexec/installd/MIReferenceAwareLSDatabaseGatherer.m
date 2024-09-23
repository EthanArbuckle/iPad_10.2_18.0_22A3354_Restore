@implementation MIReferenceAwareLSDatabaseGatherer

- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled"))
    goto LABEL_16;
  if (-[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID")
    || objc_msgSend(v11, "containerClass") != (id)14)
  {
    if ((objc_msgSend(v10, "isRemovableSystemApp") & 1) != 0
      || !-[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID"))
    {
      goto LABEL_16;
    }
    if (objc_msgSend(v11, "containerClass") == (id)14)
      v15 = 3;
    else
      v15 = 2;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v27 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:", v17, v15, -[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID"), &v27));
    v19 = v27;

    v14 = v18 != 0;
    if (v18)
    {
      if (objc_msgSend(v18, "count"))
      {

LABEL_16:
        v26.receiver = self;
        v26.super_class = (Class)MIReferenceAwareLSDatabaseGatherer;
        v14 = -[MIReferenceAwareLSDatabaseGatherer scanExecutableBundle:inContainer:forPersona:withError:](&v26, "scanExecutableBundle:inContainer:forPersona:withError:", v10, v11, v12, a6);
        goto LABEL_17;
      }
      v22 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        -[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID");
        MOLogWrite(v22, 5, "-[MIReferenceAwareLSDatabaseGatherer scanExecutableBundle:inContainer:forPersona:withError:]", CFSTR("Skipping registration for %@ because user with uid %u does not have any references for it"));

      }
    }
    else
    {
      v21 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        MOLogWrite(v21, 3, "-[MIReferenceAwareLSDatabaseGatherer scanExecutableBundle:inContainer:forPersona:withError:]", CFSTR("Skipping registration for %@ due to %@"));

      }
      if (a6)
        *a6 = objc_retainAutorelease(v19);
    }

    goto LABEL_17;
  }
  v13 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    MOLogWrite(v13, 5, "-[MIReferenceAwareLSDatabaseGatherer scanExecutableBundle:inContainer:forPersona:withError:]", CFSTR("Skipping registration of %@ in the system session because its installed in per user bundle container"));

  }
  v14 = 1;
LABEL_17:

  return v14;
}

- (MIReferenceAwareLSDatabaseGatherer)initWithOptions:(unint64_t)a3 forTargetUID:(unsigned int)a4 enumerator:(id)a5
{
  uint64_t v5;
  MIReferenceAwareLSDatabaseGatherer *v6;
  MIReferenceAwareLSDatabaseGatherer *v7;
  objc_super v9;

  v5 = *(_QWORD *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)MIReferenceAwareLSDatabaseGatherer;
  v6 = -[MIReferenceAwareLSDatabaseGatherer initWithOptions:enumerator:](&v9, "initWithOptions:enumerator:", a3, a5);
  v7 = v6;
  if (v6)
    -[MIReferenceAwareLSDatabaseGatherer setTargetUID:](v6, "setTargetUID:", v5);
  return v7;
}

- (BOOL)performGatherWithError:(id *)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  objc_super v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForCurrentUser](MILaunchServicesOperationManager, "instanceForCurrentUser"));
  objc_msgSend(v5, "purge");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
  v7 = objc_msgSend(v6, "isSharediPad");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForSystemSharedContent](MILaunchServicesOperationManager, "instanceForSystemSharedContent"));
    objc_msgSend(v8, "purge");

  }
  v10.receiver = self;
  v10.super_class = (Class)MIReferenceAwareLSDatabaseGatherer;
  return -[MIReferenceAwareLSDatabaseGatherer performGatherWithError:](&v10, "performGatherWithError:", a3);
}

- (unsigned)targetUID
{
  return self->_targetUID;
}

- (void)setTargetUID:(unsigned int)a3
{
  self->_targetUID = a3;
}

@end
