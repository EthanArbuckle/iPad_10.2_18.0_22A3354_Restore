@implementation SUSettingsScanResults

- (id)initFromScanParam:(id)a3 withUUID:(id)a4
{
  SUSettingsScanResults *v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  SUSettingsScanResults *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SUSettingsScanResults *v19;
  objc_super v20;
  id v21;
  id location[2];
  SUSettingsScanResults *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v4 = v23;
  v23 = 0;
  v20.receiver = v4;
  v20.super_class = (Class)SUSettingsScanResults;
  v19 = -[SUSettingsScanResults init](&v20, sel_init);
  v23 = v19;
  objc_storeStrong((id *)&v23, v19);
  if (v19)
  {
    -[SUSettingsScanResults setScanUUID:](v23, "setScanUUID:", v21);
    v5 = objc_msgSend(location[0], "preferredUpdateDownloadable");
    -[SUSettingsScanResults setPreferredUpdateDownloadable:](v23, "setPreferredUpdateDownloadable:", v5 & 1);
    v6 = objc_msgSend(location[0], "alternateUpdateDownloadable");
    -[SUSettingsScanResults setAlternateUpdateDownloadable:](v23, "setAlternateUpdateDownloadable:", v6 & 1);
    v12 = (id)objc_msgSend(location[0], "preferredUpdateDownloadError");
    -[SUSettingsScanResults setPreferredUpdateDownloadError:](v23, "setPreferredUpdateDownloadError:");

    v13 = (id)objc_msgSend(location[0], "alternateUpdateDownloadError");
    -[SUSettingsScanResults setAlternateUpdateDownloadError:](v23, "setAlternateUpdateDownloadError:");

    v14 = (id)objc_msgSend(location[0], "agreementManager");
    -[SUSettingsScanResults setAgreementManager:](v23, "setAgreementManager:");

    v7 = objc_msgSend(location[0], "isClearingSpaceForDownload");
    -[SUSettingsScanResults setClearingSpaceForDownload:](v23, "setClearingSpaceForDownload:", v7 & 1);
    v15 = (id)objc_msgSend(location[0], "currentDownload");
    -[SUSettingsScanResults setCurrentDownload:](v23, "setCurrentDownload:");

    v8 = objc_msgSend(location[0], "isUpdateReadyForInstallation");
    -[SUSettingsScanResults setIsUpdateReadyForInstallation:](v23, "setIsUpdateReadyForInstallation:", v8 & 1);
    v16 = (id)objc_msgSend(location[0], "updateInstallationError");
    -[SUSettingsScanResults setUpdateInstallationError:](v23, "setUpdateInstallationError:");

    v9 = objc_msgSend(location[0], "isAutoUpdateScheduled");
    -[SUSettingsScanResults setIsAutoUpdateScheduled:](v23, "setIsAutoUpdateScheduled:", v9 & 1);
    v17 = (id)objc_msgSend(location[0], "currentAutoInstallOperation");
    -[SUSettingsScanResults setCurrentAutoInstallOperation:](v23, "setCurrentAutoInstallOperation:");

  }
  v11 = v23;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v23, 0);
  return v11;
}

- (id)description
{
  id v2;
  id v3;
  objc_class *v4;
  BOOL v5;
  const char *v6;
  BOOL v7;
  const char *v8;
  BOOL v9;
  const char *v10;
  BOOL v11;
  const char *v12;
  SUSettingsScanResults *v14;
  const char *v15;
  const char *v16;
  BOOL v17;
  id v18;
  const char *v19;
  const char *v20;
  void *v21;
  NSError *v22;
  SUAutoInstallOperation *v23;
  SUSUIUpdateAgreementManager *v24;
  NSError *v25;
  NSError *v26;
  NSString *v27;
  NSString *v28;
  id v29;
  void *v30;
  SUOperationProgress *v31;
  SUDownload *v32;
  SUDownload *v33;
  id v34;
  SUDescriptor *v35;
  SUDownload *v36;
  SUDownload *v37;
  BOOL v38;
  char v39;
  SUDescriptor *v40;
  char v41;
  SUDownload *v42;
  id v43[2];
  SUSettingsScanResults *v44;

  v44 = self;
  v43[1] = (id)a2;
  v43[0] = CFSTR("(null)");
  v37 = -[SUSettingsScanResults currentDownload](v44, "currentDownload");
  v41 = 0;
  v39 = 0;
  v38 = 0;
  if (v37)
  {
    v42 = -[SUSettingsScanResults currentDownload](v44, "currentDownload");
    v41 = 1;
    v40 = -[SUDownload descriptor](v42, "descriptor");
    v39 = 1;
    v38 = v40 != 0;
  }
  if ((v39 & 1) != 0)

  if ((v41 & 1) != 0)
  if (v38)
  {
    v30 = (void *)MEMORY[0x24BDD17C8];
    v36 = -[SUSettingsScanResults currentDownload](v44, "currentDownload");
    v35 = -[SUDownload descriptor](v36, "descriptor");
    v34 = (id)-[SUDescriptor humanReadableUpdateName](v35, "humanReadableUpdateName");
    v33 = -[SUSettingsScanResults currentDownload](v44, "currentDownload");
    v32 = -[SUSettingsScanResults currentDownload](v44, "currentDownload");
    v31 = -[SUDownload progress](v32, "progress");
    v2 = (id)objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ (%p) (progess: %@)"), v34, v33, v31);
    v3 = v43[0];
    v43[0] = v2;

  }
  v21 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v4);
  v14 = v44;
  v27 = -[SUSettingsScanResults scanUUID](v44, "scanUUID");
  v5 = -[SUSettingsScanResults preferredUpdateDownloadable](v44, "preferredUpdateDownloadable");
  v6 = "YES";
  if (!v5)
    v6 = "NO";
  v15 = v6;
  v7 = -[SUSettingsScanResults alternateUpdateDownloadable](v44, "alternateUpdateDownloadable");
  v8 = "YES";
  if (!v7)
    v8 = "NO";
  v16 = v8;
  v26 = -[SUSettingsScanResults preferredUpdateDownloadError](v44, "preferredUpdateDownloadError");
  v25 = -[SUSettingsScanResults alternateUpdateDownloadError](v44, "alternateUpdateDownloadError");
  v24 = -[SUSettingsScanResults agreementManager](v44, "agreementManager");
  v17 = -[SUSettingsScanResults isClearingSpaceForDownload](v44, "isClearingSpaceForDownload");
  v18 = v43[0];
  v9 = -[SUSettingsScanResults isAutoUpdateScheduled](v44, "isAutoUpdateScheduled");
  v10 = "YES";
  if (!v9)
    v10 = "NO";
  v19 = v10;
  v23 = -[SUSettingsScanResults currentAutoInstallOperation](v44, "currentAutoInstallOperation");
  v11 = -[SUSettingsScanResults isUpdateReadyForInstallation](v44, "isUpdateReadyForInstallation");
  v12 = "YES";
  if (!v11)
    v12 = "NO";
  v20 = v12;
  v22 = -[SUSettingsScanResults updateInstallationError](v44, "updateInstallationError");
  v29 = (id)objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p, \n\tscanUUID: %@\n\tpreferredUpdateDownloadable: %s, \n\talternateUpdateDownloadable: %s, \n\tpreferredUpdateDownloadError: %@, \n\talternateUpdateDownloadError: %@, \n\tagreementManager: %@, \n\tisClearingSpaceForDownload: %d, \n\tcurrentDownload: %@, \n\tautoUpdateScheduled: %s (%p)\n\tisUpdateReadyForInstallation: %s\n\tupdateInstallationError: %@>"), v28, v14, v27, v15, v16, v26, v25, v24, v17, v18, v19, v23, v20, v22);

  objc_storeStrong(v43, 0);
  return v29;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (void)setScanUUID:(id)a3
{
  objc_storeStrong((id *)&self->_scanUUID, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateInstallationError, 0);
  objc_storeStrong((id *)&self->_currentAutoInstallOperation, 0);
  objc_storeStrong((id *)&self->_currentDownload, 0);
  objc_storeStrong((id *)&self->_alternateUpdateDownloadError, 0);
  objc_storeStrong((id *)&self->_preferredUpdateDownloadError, 0);
  objc_storeStrong((id *)&self->_scanUUID, 0);
}

@end
