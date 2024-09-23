@implementation SUSettingsScanParam

- (SUSettingsScanParam)initWithScanOptions:(id)a3
{
  SUSettingsScanParam *v3;
  SUSettingsScanParam *v5;
  SUSettingsScanParam *v6;
  objc_super v7;
  id location[2];
  SUSettingsScanParam *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)SUSettingsScanParam;
  v6 = -[SUSettingsScanParam init](&v7, sel_init);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
    -[SUSettingsScanParam setOptions:](v9, "setOptions:", location[0]);
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (SUSettingsScanParam)initWithError:(id)a3
{
  SUSettingsScanParam *v3;
  SUSettingsScanParam *v5;
  SUSettingsScanParam *v6;
  objc_super v7;
  id location[2];
  SUSettingsScanParam *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)SUSettingsScanParam;
  v6 = -[SUSettingsScanParam init](&v7, sel_init);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
    -[SUSettingsScanParam setOperationError:](v9, "setOperationError:", location[0]);
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4
{
  SUSettingsScanParam *v4;
  SUSettingsScanParam *v6;
  SUSettingsScanParam *v8;
  objc_super v9;
  id v10;
  id location[2];
  SUSettingsScanParam *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)SUSettingsScanParam;
  v8 = -[SUSettingsScanParam init](&v9, sel_init);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    -[SUSettingsScanParam setPreferredDescriptor:](v12, "setPreferredDescriptor:", location[0]);
    -[SUSettingsScanParam setAlternateDescriptor:](v12, "setAlternateDescriptor:", v10);
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4 previouslyDiscoveredDownloadedUpdate:(id)a5 previouslyDiscoveredAutoInstallOperation:(id)a6 encounteredError:(id)a7
{
  SUSettingsScanParam *v7;
  SUSettingsScanParam *v9;
  SUSettingsScanParam *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  SUSettingsScanParam *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v16 = 0;
  objc_storeStrong(&v16, a6);
  v15 = 0;
  objc_storeStrong(&v15, a7);
  v7 = v20;
  v20 = 0;
  v14 = -[SUSettingsScanParam initWithPreferredDescriptor:andAlternateDescriptor:](v7, "initWithPreferredDescriptor:andAlternateDescriptor:", location[0], v18);
  v20 = v14;
  objc_storeStrong((id *)&v20, v14);
  if (v14)
  {
    -[SUSettingsScanParam setCurrentDownload:](v20, "setCurrentDownload:", v17);
    -[SUSettingsScanParam setCurrentAutoInstallOperation:](v20, "setCurrentAutoInstallOperation:", v16);
    -[SUSettingsScanParam setIsAutoUpdateScheduled:](v20, "setIsAutoUpdateScheduled:", v16 != 0);
    -[SUSettingsScanParam setOperationError:](v20, "setOperationError:", v15);
  }
  v9 = v20;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v9;
}

- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4 previouslyDiscoveredDownloadedUpdate:(id)a5 encounteredError:(id)a6
{
  SUSettingsScanParam *v6;
  SUSettingsScanParam *v8;
  SUSettingsScanParam *v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  SUSettingsScanParam *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v6 = v17;
  v17 = 0;
  v12 = -[SUSettingsScanParam initWithPreferredDescriptor:andAlternateDescriptor:](v6, "initWithPreferredDescriptor:andAlternateDescriptor:", location[0], v15);
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    -[SUSettingsScanParam setCurrentDownload:](v17, "setCurrentDownload:", v14);
    -[SUSettingsScanParam setOperationError:](v17, "setOperationError:", v13);
  }
  v8 = v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v8;
}

- (id)description
{
  id v2;
  id v3;
  objc_class *v4;
  SUDescriptor *v5;
  NSError *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  NSError *v10;
  NSError *v11;
  BOOL v12;
  const char *v13;
  BOOL v14;
  const char *v15;
  BOOL v16;
  const char *v17;
  BOOL v18;
  const char *v19;
  uint64_t v21;
  _BOOL8 v22;
  const char *v23;
  const char *v24;
  _BOOL4 v25;
  id v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  int v46;
  const __CFString *v47;
  const __CFString *v48;
  id v49;
  id v50;
  int v51;
  const __CFString *v52;
  id v53;
  id v54;
  SUSettingsScanParam *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  SUDescriptor *v64;
  SUDownload *v65;
  _BOOL4 v66;
  int v67;
  SUDownload *v68;
  _BOOL4 v69;
  char v70;
  __CFString *v71;
  char v72;
  SUDescriptor *v73;
  char v74;
  __CFString *v75;
  char v76;
  SUDescriptor *v77;
  char v78;
  SUDescriptor *v79;
  char v80;
  SUDownload *v81;
  id location[2];
  SUSettingsScanParam *v83;
  id v84;

  v83 = self;
  location[1] = (id)a2;
  location[0] = CFSTR("(null)");
  v68 = -[SUSettingsScanParam currentDownload](v83, "currentDownload");
  v80 = 0;
  v78 = 0;
  v69 = 0;
  if (v68)
  {
    v81 = -[SUSettingsScanParam currentDownload](v83, "currentDownload");
    v67 = 1;
    v80 = 1;
    v79 = -[SUDownload descriptor](v81, "descriptor");
    v78 = 1;
    v69 = v79 != 0;
  }
  v66 = v69;
  if ((v78 & 1) != 0)

  if ((v80 & 1) != 0)
  if (v66)
  {
    v59 = (id)MEMORY[0x24BDD17C8];
    v65 = -[SUSettingsScanParam currentDownload](v83, "currentDownload");
    v64 = -[SUDownload descriptor](v65, "descriptor");
    v63 = (id)-[SUDescriptor humanReadableUpdateName](v64, "humanReadableUpdateName");
    v62 = -[SUSettingsScanParam currentDownload](v83, "currentDownload");
    v61 = -[SUSettingsScanParam currentDownload](v83, "currentDownload");
    v60 = (id)objc_msgSend(v61, "progress");
    v2 = (id)objc_msgSend(v59, "stringWithFormat:", CFSTR("%@ (%p) (progess: %@)"), v63, v62, v60);
    v3 = location[0];
    location[0] = v2;

  }
  v53 = (id)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v54 = NSStringFromClass(v4);
  v55 = v83;
  v56 = -[SUSettingsScanParam options](v83, "options");
  v57 = -[SUSettingsScanParam operationError](v83, "operationError");
  v58 = -[SUSettingsScanParam preferredDescriptor](v83, "preferredDescriptor");
  v76 = 0;
  v74 = 0;
  if (v58)
  {
    v77 = -[SUSettingsScanParam preferredDescriptor](v83, "preferredDescriptor");
    v51 = 1;
    v76 = 1;
    v75 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v77, "humanReadableUpdateName");
    v74 = 1;
    v52 = v75;
  }
  else
  {
    v52 = CFSTR("(null)");
  }
  v48 = v52;
  v49 = -[SUSettingsScanParam preferredDescriptor](v83, "preferredDescriptor");
  v50 = -[SUSettingsScanParam alternateDescriptor](v83, "alternateDescriptor");
  v72 = 0;
  v70 = 0;
  if (v50)
  {
    v73 = -[SUSettingsScanParam alternateDescriptor](v83, "alternateDescriptor");
    v46 = 1;
    v72 = 1;
    v71 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v73, "humanReadableUpdateName");
    v70 = 1;
    v47 = v71;
  }
  else
  {
    v47 = CFSTR("(null)");
  }
  v5 = -[SUSettingsScanParam alternateDescriptor](v83, "alternateDescriptor");
  v45 = v5;
  v6 = -[SUSettingsScanParam scanError](v83, "scanError");
  v44 = v6;
  v23 = "NO";
  v24 = "YES";
  if (-[SUSettingsScanParam emptyScanResults](v83, "emptyScanResults"))
    v7 = "YES";
  else
    v7 = "NO";
  if (-[SUSettingsScanParam preferredUpdateDownloadable](v83, "preferredUpdateDownloadable"))
    v8 = v24;
  else
    v8 = v23;
  if (-[SUSettingsScanParam alternateUpdateDownloadable](v83, "alternateUpdateDownloadable"))
    v9 = v24;
  else
    v9 = v23;
  v10 = -[SUSettingsScanParam preferredUpdateDownloadError](v83, "preferredUpdateDownloadError");
  v43 = v10;
  v11 = -[SUSettingsScanParam alternateUpdateDownloadError](v83, "alternateUpdateDownloadError");
  v42 = v11;
  v41 = -[SUSettingsScanParam agreementManager](v83, "agreementManager");
  v25 = -[SUSettingsScanParam isClearingSpaceForDownload](v83, "isClearingSpaceForDownload");
  v26 = location[0];
  -[SUSettingsScanParam mdmPathRestrictions](v83, "mdmPathRestrictions");
  v40 = (id)SUStringFromMDMSUPath();
  v27 = -[SUSettingsScanParam mdmPathRestrictions](v83, "mdmPathRestrictions");
  v12 = -[SUSettingsScanParam isDelayingUpdate](v83, "isDelayingUpdate");
  v13 = v24;
  if (!v12)
    v13 = v23;
  v28 = v13;
  v14 = -[SUSettingsScanParam isRollingBack](v83, "isRollingBack");
  v15 = v24;
  if (!v14)
    v15 = v23;
  v29 = v15;
  v39 = -[SUSettingsScanParam rollbackDescriptor](v83, "rollbackDescriptor");
  v38 = -[SUSettingsScanParam currentSeedingDevice](v83, "currentSeedingDevice");
  v37 = -[SUSettingsScanParam betaPrograms](v83, "betaPrograms");
  v36 = -[SUSettingsScanParam betaPrograms](v83, "betaPrograms");
  v30 = objc_msgSend(v36, "count");
  v35 = -[SUSettingsScanParam enrolledBetaProgram](v83, "enrolledBetaProgram");
  v16 = -[SUSettingsScanParam isAutoUpdateScheduled](v83, "isAutoUpdateScheduled");
  v17 = v24;
  if (!v16)
    v17 = v23;
  v31 = v17;
  v18 = -[SUSettingsScanParam isUpdateReadyForInstallation](v83, "isUpdateReadyForInstallation");
  v19 = v24;
  if (!v18)
    v19 = v23;
  v32 = v19;
  v34 = -[SUSettingsScanParam updateInstallationError](v83, "updateInstallationError");
  v33 = &v21;
  v22 = v25;
  v84 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(v53, "stringWithFormat:", CFSTR("<%@: %p, \n\tscanOptions: %@\n\toperationError: %@\n\tpreferredDescriptor: %@ (%p), \n\talternateDescriptor: %@ (%p), \n\tscanError: %@, \n\temptyScanResults: %s, \n\tpreferredUpdateDownloadable: %s, \n\talternateUpdateDownloadable: %s, \n\tpreferredUpdateDownloadError: %@, \n\talternateUpdateDownloadError: %@, \n\tagreementManager: %@, \n\tisClearingSpaceForDownload: %d, \n\tcurrentDownload: %@, \n\tmdmPathRestrictions: %@ (%ld), \n\tisDelayingUpdate: %s\n\tisRollingBack: %s\n\trollbackDescriptor: %p\n\tcurrentSeedingDevice: %p\n\tbetaPrograms: %p (count: %ld)\n\tenrolledBetaProgram: %p\n\tautoUpdateScheduled: %s\n\tisUpdateReadyForInstallation: %s\n\tupdateInstallationError: %@>"), v54, v55, v56, v57, v48, v49, v47, v5, v6, v7, v8, v9, v10, v11, v41, v22,
                                                 v26,
                                                 v40,
                                                 v27,
                                                 v28,
                                                 v29,
                                                 v39,
                                                 v38,
                                                 v37,
                                                 v30,
                                                 v35,
                                                 v31,
                                                 v32,
                                                 v34));

  if ((v70 & 1) != 0)
  if ((v72 & 1) != 0)

  if ((v74 & 1) != 0)
  if ((v76 & 1) != 0)

  objc_storeStrong(location, 0);
  return v84;
}

- (SUSettingsScanOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);
}

- (SUDescriptor)preferredDescriptor
{
  return self->_preferredDescriptor;
}

- (void)setPreferredDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_preferredDescriptor, a3);
}

- (SUDescriptor)alternateDescriptor
{
  return self->_alternateDescriptor;
}

- (void)setAlternateDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_alternateDescriptor, a3);
}

- (NSError)scanError
{
  return self->_scanError;
}

- (void)setScanError:(id)a3
{
  objc_storeStrong((id *)&self->_scanError, a3);
}

- (BOOL)emptyScanResults
{
  return self->_emptyScanResults;
}

- (void)setEmptyScanResults:(BOOL)a3
{
  self->_emptyScanResults = a3;
}

- (BOOL)preferredUpdateDownloadable
{
  return self->_preferredUpdateDownloadable;
}

- (void)setPreferredUpdateDownloadable:(BOOL)a3
{
  self->_preferredUpdateDownloadable = a3;
}

- (BOOL)alternateUpdateDownloadable
{
  return self->_alternateUpdateDownloadable;
}

- (void)setAlternateUpdateDownloadable:(BOOL)a3
{
  self->_alternateUpdateDownloadable = a3;
}

- (NSError)preferredUpdateDownloadError
{
  return self->_preferredUpdateDownloadError;
}

- (void)setPreferredUpdateDownloadError:(id)a3
{
  objc_storeStrong((id *)&self->_preferredUpdateDownloadError, a3);
}

- (NSError)alternateUpdateDownloadError
{
  return self->_alternateUpdateDownloadError;
}

- (void)setAlternateUpdateDownloadError:(id)a3
{
  objc_storeStrong((id *)&self->_alternateUpdateDownloadError, a3);
}

- (SUSUIUpdateAgreementManager)agreementManager
{
  return self->_agreementManager;
}

- (void)setAgreementManager:(id)a3
{
  self->_agreementManager = (SUSUIUpdateAgreementManager *)a3;
}

- (BOOL)isClearingSpaceForDownload
{
  return self->_clearingSpaceForDownload;
}

- (void)setClearingSpaceForDownload:(BOOL)a3
{
  self->_clearingSpaceForDownload = a3;
}

- (SUDownload)currentDownload
{
  return self->_currentDownload;
}

- (void)setCurrentDownload:(id)a3
{
  objc_storeStrong((id *)&self->_currentDownload, a3);
}

- (SUCoreDDMDeclaration)ddmDeclaration
{
  return self->_ddmDeclaration;
}

- (void)setDDMDeclaration:(id)a3
{
  objc_storeStrong((id *)&self->_ddmDeclaration, a3);
}

- (unint64_t)mdmPathRestrictions
{
  return self->_mdmPathRestrictions;
}

- (void)setMdmPathRestrictions:(unint64_t)a3
{
  self->_mdmPathRestrictions = a3;
}

- (BOOL)isDelayingUpdate
{
  return self->_isDelayingUpdate;
}

- (void)setIsDelayingUpdate:(BOOL)a3
{
  self->_isDelayingUpdate = a3;
}

- (BOOL)isRollingBack
{
  return self->_isRollingBack;
}

- (void)setIsRollingBack:(BOOL)a3
{
  self->_isRollingBack = a3;
}

- (SURollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (void)setRollbackDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_rollbackDescriptor, a3);
}

- (SDDevice)currentSeedingDevice
{
  return self->_currentSeedingDevice;
}

- (void)setCurrentSeedingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentSeedingDevice, a3);
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
  objc_storeStrong((id *)&self->_betaPrograms, a3);
}

- (SDBetaProgram)enrolledBetaProgram
{
  return self->_enrolledBetaProgram;
}

- (void)setEnrolledBetaProgram:(id)a3
{
  objc_storeStrong((id *)&self->_enrolledBetaProgram, a3);
}

- (BOOL)isAutoUpdateScheduled
{
  return self->_isAutoUpdateScheduled;
}

- (void)setIsAutoUpdateScheduled:(BOOL)a3
{
  self->_isAutoUpdateScheduled = a3;
}

- (SUAutoInstallOperation)currentAutoInstallOperation
{
  return self->_currentAutoInstallOperation;
}

- (void)setCurrentAutoInstallOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentAutoInstallOperation, a3);
}

- (BOOL)isUpdateReadyForInstallation
{
  return self->_isUpdateReadyForInstallation;
}

- (void)setIsUpdateReadyForInstallation:(BOOL)a3
{
  self->_isUpdateReadyForInstallation = a3;
}

- (NSError)updateInstallationError
{
  return self->_updateInstallationError;
}

- (void)setUpdateInstallationError:(id)a3
{
  objc_storeStrong((id *)&self->_updateInstallationError, a3);
}

- (SUScanResults)thirdPartyDiscoveredScanResults
{
  return self->_thirdPartyDiscoveredScanResults;
}

- (void)setThirdPartyDiscoveredScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_thirdPartyDiscoveredScanResults, a3);
}

- (NSError)thirdPartyDiscoveredScanError
{
  return self->_thirdPartyDiscoveredScanError;
}

- (void)setThirdPartyDiscoveredScanError:(id)a3
{
  objc_storeStrong((id *)&self->_thirdPartyDiscoveredScanError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyDiscoveredScanError, 0);
  objc_storeStrong((id *)&self->_thirdPartyDiscoveredScanResults, 0);
  objc_storeStrong((id *)&self->_updateInstallationError, 0);
  objc_storeStrong((id *)&self->_currentAutoInstallOperation, 0);
  objc_storeStrong((id *)&self->_enrolledBetaProgram, 0);
  objc_storeStrong((id *)&self->_betaPrograms, 0);
  objc_storeStrong((id *)&self->_currentSeedingDevice, 0);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_ddmDeclaration, 0);
  objc_storeStrong((id *)&self->_currentDownload, 0);
  objc_storeStrong((id *)&self->_alternateUpdateDownloadError, 0);
  objc_storeStrong((id *)&self->_preferredUpdateDownloadError, 0);
  objc_storeStrong((id *)&self->_scanError, 0);
  objc_storeStrong((id *)&self->_alternateDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredDescriptor, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
