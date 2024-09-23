@implementation SUSettingsUpdateParam

- (SUSettingsUpdateParam)initWithDescriptor:(id)a3 andUpdateOptions:(id)a4 forUnattendedInstall:(BOOL)a5
{
  SUSettingsUpdateParam *v5;
  SUSettingsUpdateParam *v7;
  SUSettingsUpdateParam *v10;
  objc_super v11;
  BOOL v12;
  id v13;
  id location[2];
  SUSettingsUpdateParam *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = a5;
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSettingsUpdateParam;
  v10 = -[SUSettingsUpdateParam init](&v11, sel_init);
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    -[SUSettingsUpdateParam setDescriptor:](v15, "setDescriptor:", location[0]);
    -[SUSettingsUpdateParam setOptions:](v15, "setOptions:", v13);
    -[SUSettingsUpdateParam setUnattendedInstall:](v15, "setUnattendedInstall:", v12);
  }
  v7 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
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
  BOOL v13;
  const char *v14;
  BOOL v15;
  const char *v16;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const __CFString *v21;
  id v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  int v37;
  const __CFString *v38;
  id v39;
  NSString *v40;
  SUSettingsUpdateParam *v41;
  SUDescriptor *v42;
  id v43;
  SUOperationProgress *v44;
  SUDownload *v45;
  SUDownload *v46;
  id v47;
  SUDescriptor *v48;
  SUDownload *v49;
  _BOOL4 v50;
  int v51;
  SUDownload *v52;
  _BOOL4 v53;
  char v54;
  __CFString *v55;
  char v56;
  SUDescriptor *v57;
  char v58;
  SUDescriptor *v59;
  char v60;
  SUDownload *v61;
  id location[2];
  SUSettingsUpdateParam *v63;
  id v64;

  v63 = self;
  location[1] = (id)a2;
  location[0] = CFSTR("(null)");
  v52 = -[SUSettingsUpdateParam currentDownload](v63, "currentDownload");
  v60 = 0;
  v58 = 0;
  v53 = 0;
  if (v52)
  {
    v61 = -[SUSettingsUpdateParam currentDownload](v63, "currentDownload");
    v51 = 1;
    v60 = 1;
    v59 = -[SUDownload descriptor](v61, "descriptor");
    v58 = 1;
    v53 = v59 != 0;
  }
  v50 = v53;
  if ((v58 & 1) != 0)

  if ((v60 & 1) != 0)
  if (v50)
  {
    v43 = (id)MEMORY[0x24BDD17C8];
    v49 = -[SUSettingsUpdateParam currentDownload](v63, "currentDownload");
    v48 = -[SUDownload descriptor](v49, "descriptor");
    v47 = (id)-[SUDescriptor humanReadableUpdateName](v48, "humanReadableUpdateName");
    v46 = -[SUSettingsUpdateParam currentDownload](v63, "currentDownload");
    v45 = -[SUSettingsUpdateParam currentDownload](v63, "currentDownload");
    v44 = -[SUDownload progress](v45, "progress");
    v2 = (id)objc_msgSend(v43, "stringWithFormat:", CFSTR("%@ (%p) (progress: %@)"), v47, v46, v44);
    v3 = location[0];
    location[0] = v2;

  }
  v39 = (id)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v40 = NSStringFromClass(v4);
  v41 = v63;
  v42 = -[SUSettingsUpdateParam descriptor](v63, "descriptor");
  v56 = 0;
  v54 = 0;
  if (v42)
  {
    v57 = -[SUSettingsUpdateParam descriptor](v63, "descriptor");
    v37 = 1;
    v56 = 1;
    v55 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v57, "humanReadableUpdateName");
    v54 = 1;
    v38 = v55;
  }
  else
  {
    v38 = CFSTR("(null)");
  }
  v21 = v38;
  v36 = -[SUSettingsUpdateParam descriptor](v63, "descriptor");
  v35 = -[SUSettingsUpdateParam operationError](v63, "operationError");
  v34 = -[SUSettingsUpdateParam options](v63, "options");
  v22 = location[0];
  v5 = -[SUSettingsUpdateParam isUnattendedInstall](v63, "isUnattendedInstall");
  v19 = "NO";
  v6 = "YES";
  v20 = "YES";
  if (!v5)
    v6 = "NO";
  v23 = v6;
  v7 = -[SUSettingsUpdateParam bypassTermsAndConditions](v63, "bypassTermsAndConditions");
  v8 = v20;
  if (!v7)
    v8 = v19;
  v24 = v8;
  v9 = -[SUSettingsUpdateParam createdKeybag](v63, "createdKeybag");
  v10 = v20;
  if (!v9)
    v10 = v19;
  v25 = v10;
  v26 = -[SUSettingsUpdateParam cellularAgreementStatus](v63, "cellularAgreementStatus");
  v11 = -[SUSettingsUpdateParam downloadStartedSuccessfully](v63, "downloadStartedSuccessfully");
  v12 = v20;
  if (!v11)
    v12 = v19;
  v27 = v12;
  v13 = -[SUSettingsUpdateParam updateScheduledSuccessfully](v63, "updateScheduledSuccessfully");
  v14 = v20;
  if (!v13)
    v14 = v19;
  v28 = v14;
  v15 = -[SUSettingsUpdateParam installInitiatedSuccessfully](v63, "installInitiatedSuccessfully");
  v16 = v20;
  if (!v15)
    v16 = v19;
  v29 = v16;
  v33 = -[SUSettingsUpdateParam autoInstallOperation](v63, "autoInstallOperation");
  v32 = -[SUSettingsUpdateParam autoInstallOperation](v63, "autoInstallOperation");
  v31 = -[SUSettingsUpdateParam scheduleError](v63, "scheduleError");
  v30 = &v18;
  v64 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(v39, "stringWithFormat:", CFSTR("<%@: %p, \n\tdescriptor: %@ (%p), \n\toperationError: %@, \n\toptions: %@, \n\tcurrentDownload: %@, \n\tunattendedInstall: %s, \n\tbypassTermsAndConditions: %s, \n\tcreatedKeybag: %s, \n\tcellularAgreementStatus: %ld, \n\tdownloadStartSuccessfully: %s, \n\tupdateScheduledSuccessfully: %s, \n\tinstallInitiatedSuccessfully: %s, \n\tautoInstallOperation: %@ (%p), \n\tscheduleError: %@>"), v40, v41, v21, v36, v35, v34, v22, v23, v24, v25, v26, v27, v28, v29, v33, v32,
                                                 v31));

  if ((v54 & 1) != 0)
  if ((v56 & 1) != 0)

  objc_storeStrong(location, 0);
  return v64;
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);
}

- (SUSettingsUpdateOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)createdKeybag
{
  return self->_createdKeybag;
}

- (void)setCreatedKeybag:(BOOL)a3
{
  self->_createdKeybag = a3;
}

- (SUDownload)currentDownload
{
  return self->_currentDownload;
}

- (void)setCurrentDownload:(id)a3
{
  objc_storeStrong((id *)&self->_currentDownload, a3);
}

- (BOOL)isUnattendedInstall
{
  return self->_unattendedInstall;
}

- (void)setUnattendedInstall:(BOOL)a3
{
  self->_unattendedInstall = a3;
}

- (BOOL)bypassTermsAndConditions
{
  return self->_bypassTermsAndConditions;
}

- (void)setBypassTermsAndConditions:(BOOL)a3
{
  self->_bypassTermsAndConditions = a3;
}

- (int)cellularAgreementStatus
{
  return self->_cellularAgreementStatus;
}

- (void)setCellularAgreementStatus:(int)a3
{
  self->_cellularAgreementStatus = a3;
}

- (BOOL)downloadStartedSuccessfully
{
  return self->_downloadStartedSuccessfully;
}

- (void)setDownloadStartedSuccessfully:(BOOL)a3
{
  self->_downloadStartedSuccessfully = a3;
}

- (BOOL)updateScheduledSuccessfully
{
  return self->_updateScheduledSuccessfully;
}

- (void)setUpdateScheduledSuccessfully:(BOOL)a3
{
  self->_updateScheduledSuccessfully = a3;
}

- (SUAutoInstallOperation)autoInstallOperation
{
  return self->_autoInstallOperation;
}

- (void)setAutoInstallOperation:(id)a3
{
  objc_storeStrong((id *)&self->_autoInstallOperation, a3);
}

- (NSError)scheduleError
{
  return self->_scheduleError;
}

- (void)setScheduleError:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleError, a3);
}

- (BOOL)installInitiatedSuccessfully
{
  return self->_installInitiatedSuccessfully;
}

- (void)setInstallInitiatedSuccessfully:(BOOL)a3
{
  self->_installInitiatedSuccessfully = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleError, 0);
  objc_storeStrong((id *)&self->_autoInstallOperation, 0);
  objc_storeStrong((id *)&self->_currentDownload, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
