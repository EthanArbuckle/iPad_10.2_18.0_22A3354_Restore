@implementation MIAppIdentity

- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppIdentity bundleID](self, "bundleID"));
  if ((+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager"));
    v15 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueStringsForAppWithBundleID:error:", v4, &v15));
    v8 = v15;

    if (v7)
    {
      if (objc_msgSend(v7, "count") == (id)1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
        if (!a3)
          goto LABEL_13;
      }
      else
      {
        v12 = sub_100010E50((uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 44, MIInstallerErrorDomain, 192, 0, 0, CFSTR("Can't resolve the persona associated with the bundle %@ from the associated personas in app references: %@"), v9, (uint64_t)v4);
        v13 = objc_claimAutoreleasedReturnValue(v12);

        v10 = 0;
        v8 = (id)v13;
        if (!a3)
          goto LABEL_13;
      }
    }
    else
    {
      v10 = 0;
      if (!a3)
        goto LABEL_13;
    }
  }
  else
  {
    v11 = sub_100010E24((uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 32, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v5, (uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]");
    v8 = (id)objc_claimAutoreleasedReturnValue(v11);
    v10 = 0;
    v7 = 0;
    if (!a3)
      goto LABEL_13;
  }
  if (!v10)
    *a3 = objc_retainAutorelease(v8);
LABEL_13:

  return v10;
}

@end
