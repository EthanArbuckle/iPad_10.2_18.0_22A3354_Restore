@implementation MCDomainsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "restrictions"));
  v11 = objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", MCFeatureCrossSiteTrackingPreventionRelaxedDomains, v10));
  v12 = objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", MCFeatureCrossSiteTrackingPreventionRelaxedApps, v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));

  v14 = objc_msgSend(v13, "BOOLValue");
  v15 = 0;
  if (v11 | v12 && (v14 & 1) == 0)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller notInstalledByMDMError](MCInstaller, "notInstalledByMDMError"));

  if (a6 && v15)
    *a6 = objc_retainAutorelease(v15);

  return v15 == 0;
}

@end
