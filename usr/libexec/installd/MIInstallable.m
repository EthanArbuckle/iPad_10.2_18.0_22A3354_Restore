@implementation MIInstallable

- (MIInstallable)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 operationType:(unint64_t)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  MIInstallable *v20;
  MIInstallable *v21;
  unint64_t v22;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MIInstallable;
  v20 = -[MIInstallable init](&v25, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identity, a6);
    objc_storeStrong((id *)&v21->_installOptions, a8);
    v22 = 2;
    if (a7 != 1)
      v22 = a7;
    v21->_installationDomain = v22;
    v21->_packageFormat = a5;
    objc_storeStrong((id *)&v21->_bundle, a3);
    objc_storeStrong((id *)&v21->_stagingRootURL, a4);
    v21->_installOperationType = a9;
  }

  return v21;
}

- (BOOL)shouldModifyExistingContainers
{
  return 1;
}

- (BOOL)applyPatchWithError:(id *)a3
{
  return 1;
}

- (BOOL)performPreflightWithError:(id *)a3
{
  return -[MIInstallable applyPatchWithError:](self, "applyPatchWithError:", a3);
}

- (BOOL)performVerificationWithError:(id *)a3
{
  return 1;
}

- (BOOL)performInstallationWithError:(id *)a3
{
  return 1;
}

- (BOOL)postFlightInstallationWithError:(id *)a3
{
  return 1;
}

- (BOOL)finalizeInstallationWithError:(id *)a3
{
  return 1;
}

- (BOOL)stageBackgroundUpdate:(id *)a3 withError:(id *)a4
{
  return 1;
}

- (id)launchServicesBundleRecordsWithError:(id *)a3
{
  return &__NSArray0__struct;
}

- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoPlistSubset"));

  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaUniqueString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCFBundleVersionKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _kCFBundleShortVersionStringKey));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ ID=%@; Persona=%@, Version=%@, ShortVersion=%@>"),
                    v7,
                    v9,
                    v11,
                    v12,
                    v13));

  return v14;
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (MIInstallOptions)installOptions
{
  return self->_installOptions;
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (NSURL)stagingRootURL
{
  return self->_stagingRootURL;
}

- (unsigned)packageFormat
{
  return self->_packageFormat;
}

- (MIBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)installOperationType
{
  return self->_installOperationType;
}

- (void)setInstallOperationType:(unint64_t)a3
{
  self->_installOperationType = a3;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (NSString)installedDistributorID
{
  return self->_installedDistributorID;
}

- (void)setInstalledDistributorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedDistributorID, 0);
  objc_storeStrong((id *)&self->_recordPromise, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_stagingRootURL, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
