@implementation SUSettingsFullScanResults

- (id)initFromScanParam:(id)a3 withUUID:(id)a4
{
  SUSettingsFullScanResults *v4;
  uint64_t v5;
  char v6;
  char v7;
  SUSettingsFullScanResults *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SUSettingsFullScanResults *v19;
  objc_super v20;
  id v21;
  id location[2];
  SUSettingsFullScanResults *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v4 = v23;
  v23 = 0;
  v20.receiver = v4;
  v20.super_class = (Class)SUSettingsFullScanResults;
  v19 = -[SUSettingsScanResults initFromScanParam:withUUID:](&v20, sel_initFromScanParam_withUUID_, location[0], v21);
  v23 = v19;
  objc_storeStrong((id *)&v23, v19);
  if (v19)
  {
    v10 = (id)objc_msgSend(location[0], "preferredDescriptor");
    -[SUSettingsFullScanResults setPreferredDescriptor:](v23, "setPreferredDescriptor:");

    v11 = (id)objc_msgSend(location[0], "alternateDescriptor");
    -[SUSettingsFullScanResults setAlternateDescriptor:](v23, "setAlternateDescriptor:");

    v12 = (id)objc_msgSend(location[0], "scanError");
    -[SUSettingsFullScanResults setScanError:](v23, "setScanError:");

    v5 = objc_msgSend(location[0], "mdmPathRestrictions");
    -[SUSettingsFullScanResults setMdmPathRestrictions:](v23, "setMdmPathRestrictions:", v5);
    v6 = objc_msgSend(location[0], "isDelayingUpdate");
    -[SUSettingsFullScanResults setIsDelayingUpdate:](v23, "setIsDelayingUpdate:", v6 & 1);
    v7 = objc_msgSend(location[0], "isRollingBack");
    -[SUSettingsFullScanResults setIsRollingBack:](v23, "setIsRollingBack:", v7 & 1);
    v13 = (id)objc_msgSend(location[0], "rollbackDescriptor");
    -[SUSettingsFullScanResults setRollbackDescriptor:](v23, "setRollbackDescriptor:");

    v14 = (id)objc_msgSend(location[0], "currentSeedingDevice");
    -[SUSettingsFullScanResults setCurrentSeedingDevice:](v23, "setCurrentSeedingDevice:");

    v15 = (id)objc_msgSend(location[0], "betaPrograms");
    -[SUSettingsFullScanResults setBetaPrograms:](v23, "setBetaPrograms:");

    v16 = (id)objc_msgSend(location[0], "enrolledBetaProgram");
    -[SUSettingsFullScanResults setEnrolledBetaProgram:](v23, "setEnrolledBetaProgram:");

    v17 = (id)objc_msgSend(location[0], "ddmDeclaration");
    -[SUSettingsFullScanResults setDDMDeclaration:](v23, "setDDMDeclaration:");

  }
  v9 = v23;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v23, 0);
  return v9;
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
  SUSUIUpdateAgreementManager *v12;
  BOOL v13;
  BOOL v14;
  const char *v15;
  BOOL v16;
  const char *v17;
  BOOL v18;
  const char *v19;
  BOOL v20;
  const char *v21;
  uint64_t v23;
  _BOOL8 v24;
  const char *v25;
  const char *v26;
  id v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t *v34;
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
  id v46;
  id v47;
  id v48;
  int v49;
  const __CFString *v50;
  const __CFString *v51;
  id v52;
  id v53;
  int v54;
  const __CFString *v55;
  id v56;
  id v57;
  SUSettingsFullScanResults *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  SUDescriptor *v66;
  SUDownload *v67;
  _BOOL4 v68;
  int v69;
  SUDownload *v70;
  _BOOL4 v71;
  char v72;
  __CFString *v73;
  char v74;
  SUDescriptor *v75;
  char v76;
  __CFString *v77;
  char v78;
  SUDescriptor *v79;
  char v80;
  SUDescriptor *v81;
  char v82;
  SUDownload *v83;
  id location[2];
  SUSettingsFullScanResults *v85;
  id v86;

  v85 = self;
  location[1] = (id)a2;
  location[0] = CFSTR("(null)");
  v70 = -[SUSettingsScanResults currentDownload](v85, "currentDownload");
  v82 = 0;
  v80 = 0;
  v71 = 0;
  if (v70)
  {
    v83 = -[SUSettingsScanResults currentDownload](v85, "currentDownload");
    v69 = 1;
    v82 = 1;
    v81 = -[SUDownload descriptor](v83, "descriptor");
    v80 = 1;
    v71 = v81 != 0;
  }
  v68 = v71;
  if ((v80 & 1) != 0)

  if ((v82 & 1) != 0)
  if (v68)
  {
    v61 = (id)MEMORY[0x24BDD17C8];
    v67 = -[SUSettingsScanResults currentDownload](v85, "currentDownload");
    v66 = -[SUDownload descriptor](v67, "descriptor");
    v65 = (id)-[SUDescriptor humanReadableUpdateName](v66, "humanReadableUpdateName");
    v64 = -[SUSettingsScanResults currentDownload](v85, "currentDownload");
    v63 = -[SUSettingsScanResults currentDownload](v85, "currentDownload");
    v62 = (id)objc_msgSend(v63, "progress");
    v2 = (id)objc_msgSend(v61, "stringWithFormat:", CFSTR("%@ (%p) (progess: %@)"), v65, v64, v62);
    v3 = location[0];
    location[0] = v2;

  }
  v56 = (id)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v57 = NSStringFromClass(v4);
  v58 = v85;
  v59 = -[SUSettingsScanResults scanUUID](v85, "scanUUID");
  v60 = -[SUSettingsFullScanResults preferredDescriptor](v85, "preferredDescriptor");
  v78 = 0;
  v76 = 0;
  if (v60)
  {
    v79 = -[SUSettingsFullScanResults preferredDescriptor](v85, "preferredDescriptor");
    v54 = 1;
    v78 = 1;
    v77 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v79, "humanReadableUpdateName");
    v76 = 1;
    v55 = v77;
  }
  else
  {
    v55 = CFSTR("(null)");
  }
  v51 = v55;
  v52 = -[SUSettingsFullScanResults preferredDescriptor](v85, "preferredDescriptor");
  v53 = -[SUSettingsFullScanResults alternateDescriptor](v85, "alternateDescriptor");
  v74 = 0;
  v72 = 0;
  if (v53)
  {
    v75 = -[SUSettingsFullScanResults alternateDescriptor](v85, "alternateDescriptor");
    v49 = 1;
    v74 = 1;
    v73 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v75, "humanReadableUpdateName");
    v72 = 1;
    v50 = v73;
  }
  else
  {
    v50 = CFSTR("(null)");
  }
  v5 = -[SUSettingsFullScanResults alternateDescriptor](v85, "alternateDescriptor");
  v48 = v5;
  v6 = -[SUSettingsFullScanResults scanError](v85, "scanError");
  v47 = v6;
  v25 = "NO";
  v26 = "YES";
  if (-[SUSettingsFullScanResults emptyScanResults](v85, "emptyScanResults"))
    v7 = "YES";
  else
    v7 = "NO";
  if (-[SUSettingsScanResults preferredUpdateDownloadable](v85, "preferredUpdateDownloadable"))
    v8 = v26;
  else
    v8 = v25;
  if (-[SUSettingsScanResults alternateUpdateDownloadable](v85, "alternateUpdateDownloadable"))
    v9 = v26;
  else
    v9 = v25;
  v10 = -[SUSettingsScanResults preferredUpdateDownloadError](v85, "preferredUpdateDownloadError");
  v46 = v10;
  v11 = -[SUSettingsScanResults alternateUpdateDownloadError](v85, "alternateUpdateDownloadError");
  v45 = v11;
  v12 = -[SUSettingsScanResults agreementManager](v85, "agreementManager");
  v44 = v12;
  v13 = -[SUSettingsScanResults isClearingSpaceForDownload](v85, "isClearingSpaceForDownload");
  v27 = location[0];
  -[SUSettingsFullScanResults mdmPathRestrictions](v85, "mdmPathRestrictions");
  v43 = (id)SUStringFromMDMSUPath();
  v28 = -[SUSettingsFullScanResults mdmPathRestrictions](v85, "mdmPathRestrictions");
  v42 = -[SUSettingsFullScanResults ddmDeclaration](v85, "ddmDeclaration");
  v14 = -[SUSettingsFullScanResults isDelayingUpdate](v85, "isDelayingUpdate");
  v15 = v26;
  if (!v14)
    v15 = v25;
  v29 = v15;
  v16 = -[SUSettingsFullScanResults isRollingBack](v85, "isRollingBack");
  v17 = v26;
  if (!v16)
    v17 = v25;
  v30 = v17;
  v41 = -[SUSettingsFullScanResults rollbackDescriptor](v85, "rollbackDescriptor");
  v40 = -[SUSettingsFullScanResults currentSeedingDevice](v85, "currentSeedingDevice");
  v39 = -[SUSettingsFullScanResults betaPrograms](v85, "betaPrograms");
  v38 = -[SUSettingsFullScanResults betaPrograms](v85, "betaPrograms");
  v31 = objc_msgSend(v38, "count");
  v37 = -[SUSettingsFullScanResults enrolledBetaProgram](v85, "enrolledBetaProgram");
  v18 = -[SUSettingsScanResults isAutoUpdateScheduled](v85, "isAutoUpdateScheduled");
  v19 = v26;
  if (!v18)
    v19 = v25;
  v32 = v19;
  v36 = -[SUSettingsScanResults currentAutoInstallOperation](v85, "currentAutoInstallOperation");
  v20 = -[SUSettingsScanResults isUpdateReadyForInstallation](v85, "isUpdateReadyForInstallation");
  v21 = v26;
  if (!v20)
    v21 = v25;
  v33 = v21;
  v35 = -[SUSettingsScanResults updateInstallationError](v85, "updateInstallationError");
  v34 = &v23;
  v24 = v13;
  v86 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(v56, "stringWithFormat:", CFSTR("<%@: %p, \n\tscanUUID: %@, \n\tpreferredDescriptor: %@ (%p), \n\talternateDescriptor: %@ (%p), \n\tscanError: %@, \n\temptyScanResults: %s, \n\tpreferredUpdateDownloadable: %s, \n\talternateUpdateDownloadable: %s, \n\tpreferredUpdateDownloadError: %@, \n\talternateUpdateDownloadError: %@, \n\tagreementManager: %@, \n\tisClearingSpaceForDownload: %d, \n\tcurrentDownload: %@, \n\tmdmPathRestrictions: %@ (%ld), \n\tddmDeclaration: %p\n\tisDelayingUpdate: %s\n\tisRollingBack: %s\n\trollbackDescriptor: %p\n\tcurrentSeedingDevice: %p\n\tbetaPrograms: %p (count: %ld)\n\tenrolledBetaProgram: %p\n\tautoUpdateScheduled: %s (%p)\n\tisUpdateReadyForInstallation: %s\n\tupdateInstallationError: %@>"), v57, v58, v59, v51, v52, v50, v5, v6, v7, v8, v9, v10, v11, v12, v24, v27,
                                                 v43,
                                                 v28,
                                                 v42,
                                                 v29,
                                                 v30,
                                                 v41,
                                                 v40,
                                                 v39,
                                                 v31,
                                                 v37,
                                                 v32,
                                                 v36,
                                                 v33,
                                                 v35));

  if ((v72 & 1) != 0)
  if ((v74 & 1) != 0)

  if ((v76 & 1) != 0)
  if ((v78 & 1) != 0)

  objc_storeStrong(location, 0);
  return v86;
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
  return (SDDevice *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentSeedingDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSArray)betaPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBetaPrograms:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (SDBetaProgram)enrolledBetaProgram
{
  return (SDBetaProgram *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEnrolledBetaProgram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (SUCoreDDMDeclaration)ddmDeclaration
{
  return self->_ddmDeclaration;
}

- (void)setDDMDeclaration:(id)a3
{
  objc_storeStrong((id *)&self->_ddmDeclaration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ddmDeclaration, 0);
  objc_storeStrong((id *)&self->_enrolledBetaProgram, 0);
  objc_storeStrong((id *)&self->_betaPrograms, 0);
  objc_storeStrong((id *)&self->_currentSeedingDevice, 0);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_scanError, 0);
  objc_storeStrong((id *)&self->_alternateDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredDescriptor, 0);
}

@end
