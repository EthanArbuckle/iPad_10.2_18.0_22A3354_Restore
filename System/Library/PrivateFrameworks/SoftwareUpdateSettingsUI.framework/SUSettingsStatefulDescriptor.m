@implementation SUSettingsStatefulDescriptor

- (id)initForDescriptor:(unint64_t)a3 fromScanResults:(id)a4 managedBy:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  char v9;
  objc_class *v10;
  id v11;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  BOOL v16;
  __CFString *v17;
  NSObject *log;
  os_log_type_t type;
  NSString *v20;
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  SUSettingsStatefulDescriptor *v28;
  uint8_t v29[15];
  os_log_type_t v30;
  id v31;
  int v32;
  NSString *v33;
  __CFString *v34;
  os_log_type_t v35;
  id v36;
  objc_super v37;
  id v38;
  id location;
  unint64_t v40;
  SEL v41;
  id v42;
  id v43;
  uint8_t v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = self;
  v41 = a2;
  v40 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v38 = 0;
  objc_storeStrong(&v38, a5);
  v5 = v42;
  v42 = 0;
  v37.receiver = v5;
  v37.super_class = (Class)SUSettingsStatefulDescriptor;
  v28 = -[SUSettingsStatefulDescriptor init](&v37, sel_init);
  v42 = v28;
  objc_storeStrong(&v42, v28);
  if (!v28)
    goto LABEL_14;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA70]), "initWithCategory:", CFSTR("SUSettingsStatefulDescriptor"));
  v7 = (void *)*((_QWORD *)v42 + 6);
  *((_QWORD *)v42 + 6) = v6;

  *((_QWORD *)v42 + 2) = 0;
  *((_QWORD *)v42 + 3) = v40;
  objc_msgSend(v42, "setOwnerManager:", v38);
  if (!v40)
  {
    v25 = (id)objc_msgSend(location, "preferredDescriptor");
    objc_msgSend(v42, "setDescriptor:");

    v8 = objc_msgSend(location, "preferredUpdateDownloadable");
    objc_msgSend(v42, "setUpdateDownloadable:", v8 & 1);
    v26 = (id)objc_msgSend(location, "preferredUpdateDownloadError");
    objc_msgSend(v42, "setUpdateDownloadError:");

LABEL_9:
    v11 = (id)objc_msgSend(v42, "descriptor");
    v16 = v11 != 0;

    if (!v16)
    {
      v15 = (id)objc_msgSend(v42, "log");
      v31 = (id)objc_msgSend(v15, "oslog");

      v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v31;
        v14 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_impl(&dword_21BF33000, v13, v14, "Could not instantiate a stateful descriptor descriptor for nil SUDescriptor.", v29, 2u);
      }
      objc_storeStrong(&v31, 0);
      v43 = 0;
      v32 = 1;
      goto LABEL_15;
    }
    objc_msgSend(v42, "updateStateWithScanResults:andWithConcreteError:", location, 0);
LABEL_14:
    v43 = v42;
    v32 = 1;
    goto LABEL_15;
  }
  if (v40 == 1)
  {
    v23 = (id)objc_msgSend(location, "alternateDescriptor");
    objc_msgSend(v42, "setDescriptor:");

    v9 = objc_msgSend(location, "alternateUpdateDownloadable");
    objc_msgSend(v42, "setUpdateDownloadable:", v9 & 1);
    v24 = (id)objc_msgSend(location, "alternateUpdateDownloadError");
    objc_msgSend(v42, "setUpdateDownloadError:");

    goto LABEL_9;
  }
  v22 = (id)objc_msgSend(v42, "log");
  v36 = (id)objc_msgSend(v22, "oslog");

  v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
  {
    log = v36;
    type = v35;
    v21 = SUSettingsDescriptorTypeToString(v40);
    v17 = v21;
    v34 = v17;
    v10 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v10);
    v33 = v20;
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v44, (uint64_t)v17, (uint64_t)v33);
    _os_log_impl(&dword_21BF33000, log, type, "Could not use descriptor of type %{public}@ for %{public}@ instantiation.", v44, 0x16u);

    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong((id *)&v34, 0);
  }
  objc_storeStrong(&v36, 0);
  v43 = v42;
  v32 = 1;
LABEL_15:
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v42, 0);
  return v43;
}

- (id)humanReadableUpdateName
{
  void *v3;
  __CFString *v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)-[SUDescriptor humanReadableUpdateName](self->_descriptor, "humanReadableUpdateName");
  v4 = SUSettingsDescriptorTypeToString(self->_descriptorType);
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v4);

  return v6;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  char v4;
  id location[2];
  SUSettingsStatefulDescriptor *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUDescriptor isEqual:](v6->_descriptor, "isEqual:", location[0]);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)isEqual:(id)a3
{
  int v4;
  uint64_t v5;
  SUSettingsStatefulDescriptor *v6;
  id v7;
  BOOL v8;
  char v9;
  id v10;
  char v11;
  NSError *v12;
  char v13;
  SUSettingsStatefulErrorContextProvider *v14;
  char v15;
  SUSettingsStatefulUIManager *v16;
  id v17;
  int v18;
  id location[2];
  SUSettingsStatefulDescriptor *v20;
  char v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (v20 == location[0])
    {
      v21 = 1;
      v18 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = location[0];
        v6 = v20;
        v7 = (id)objc_msgSend(v17, "descriptor");
        v15 = 0;
        v13 = 0;
        v11 = 0;
        v9 = 0;
        v8 = 0;
        if (-[SUSettingsStatefulDescriptor isEqualToDescriptor:](v6, "isEqualToDescriptor:"))
        {
          v5 = objc_msgSend(v17, "currentState");
          v8 = 0;
          if (v5 == -[SUSettingsStatefulDescriptor currentState](v20, "currentState"))
          {
            v4 = -[SUSettingsStatefulDescriptor updateDownloadable](v20, "updateDownloadable");
            v8 = 0;
            if (v4 == (objc_msgSend(v17, "updateDownloadable") & 1))
            {
              v16 = -[SUSettingsStatefulDescriptor ownerManager](v20, "ownerManager");
              v15 = 1;
              v14 = -[SUSettingsStatefulUIManager errorContextProvider](v16, "errorContextProvider");
              v13 = 1;
              v12 = -[SUSettingsStatefulDescriptor updateDownloadError](v20, "updateDownloadError");
              v11 = 1;
              v10 = (id)objc_msgSend(v17, "updateDownloadError");
              v9 = 1;
              v8 = -[SUSettingsStatefulErrorContextProvider isError:intrinsicallyEquivalentToError:withStatefulDescriptor:](v14, "isError:intrinsicallyEquivalentToError:withStatefulDescriptor:", v12);
            }
          }
        }
        v21 = v8;
        if ((v9 & 1) != 0)

        if ((v11 & 1) != 0)
        if ((v13 & 1) != 0)

        if ((v15 & 1) != 0)
        v18 = 1;
        objc_storeStrong(&v17, 0);
      }
      else
      {
        v21 = 0;
        v18 = 1;
      }
    }
  }
  else
  {
    v21 = 0;
    v18 = 1;
  }
  objc_storeStrong(location, 0);
  return v21 & 1;
}

- (id)description
{
  id v2;
  id v3;
  objc_class *v4;
  const char *v5;
  SUSettingsStatefulDescriptor *v7;
  id v8;
  unint64_t currentState;
  SUDescriptor *descriptor;
  const char *v11;
  NSError *updateDownloadError;
  void *v13;
  id WeakRetained;
  id v15;
  __CFString *v16;
  __CFString *v17;
  NSString *v18;
  id v19;
  void *v20;
  __CFString *v21;
  char v22;
  SUSettingsStatefulUIManager *v23;
  char v24;
  char v25;
  SUSettingsStatefulUIManager *v26;
  char v27;
  SUSettingsStatefulUIManager *v28;
  id v29[2];
  SUSettingsStatefulDescriptor *v30;

  v30 = self;
  v29[1] = (id)a2;
  v29[0] = &stru_24E0011F0;
  v23 = -[SUSettingsStatefulDescriptor ownerManager](v30, "ownerManager");
  v27 = 0;
  v25 = 0;
  v24 = 0;
  if (v23)
  {
    v28 = -[SUSettingsStatefulDescriptor ownerManager](v30, "ownerManager");
    v27 = 1;
    v22 = 1;
    if (!-[SUSettingsStatefulUIManager hidingPreferredDescriptor](v28, "hidingPreferredDescriptor"))
    {
      v26 = -[SUSettingsStatefulDescriptor ownerManager](v30, "ownerManager");
      v25 = 1;
      v22 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v26, "hidingAlternateDescriptor");
    }
    v24 = v22;
  }
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  if ((v24 & 1) != 0)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    v21 = SUSettingsDescriptorTypeToString(-[SUSettingsStatefulDescriptor maskedDescriptorType](v30, "maskedDescriptorType"));
    v2 = (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("maskedType = %@, "), v21);
    v3 = v29[0];
    v29[0] = v2;

  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v4);
  v7 = v30;
  v17 = SUSettingsDescriptorTypeToString(v30->_descriptorType);
  v8 = v29[0];
  v16 = SUSettingsDescriptorStateToString(v30->_currentState);
  currentState = v30->_currentState;
  v15 = (id)-[SUDescriptor humanReadableUpdateName](v30->_descriptor, "humanReadableUpdateName");
  descriptor = v30->_descriptor;
  v5 = "YES";
  if (!v30->_updateDownloadable)
    v5 = "NO";
  v11 = v5;
  updateDownloadError = v30->_updateDownloadError;
  WeakRetained = objc_loadWeakRetained((id *)&v30->_ownerManager);
  v19 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p> { type = %@, %@currentState = %@ (%lu), descriptor = %@ (%p), updateDownloadable = %s, updateDownloadError = %@, owner = %p }"), v18, v7, v17, v8, v16, currentState, v15, descriptor, v11, updateDownloadError, WeakRetained);

  objc_storeStrong(v29, 0);
  return v19;
}

- (void)updateStateWithScanResults:(id)a3 andWithConcreteError:(id)a4
{
  char v4;
  id v5;
  id v6;
  int v7;
  SUSettingsStatefulDescriptor *v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;
  id v16;
  id location[2];
  SUSettingsStatefulDescriptor *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = -[SUSettingsStatefulDescriptor maskedDescriptorType](v18, "maskedDescriptorType");
  v9 = v18;
  v10 = (id)objc_msgSend(location[0], "currentDownload");
  if (v15)
    v7 = objc_msgSend(location[0], "alternateUpdateDownloadable") & 1;
  else
    v7 = objc_msgSend(location[0], "preferredUpdateDownloadable") & 1;
  v13 = 0;
  v11 = 0;
  if (v15)
  {
    v12 = (id)objc_msgSend(location[0], "alternateUpdateDownloadError");
    v11 = 1;
    v6 = v12;
  }
  else
  {
    v14 = (id)objc_msgSend(location[0], "preferredUpdateDownloadError");
    v13 = 1;
    v6 = v14;
  }
  v4 = objc_msgSend(location[0], "isUpdateReadyForInstallation");
  v5 = (id)objc_msgSend(location[0], "updateInstallationError");
  -[SUSettingsStatefulDescriptor updateStateFromConcreteDownload:downloadable:downloadError:isUpdateReadyForInstallation:updateInstallationError:error:](v9, "updateStateFromConcreteDownload:downloadable:downloadError:isUpdateReadyForInstallation:updateInstallationError:error:", v10, v7 != 0, v6, v4 & 1);

  if ((v11 & 1) != 0)
  if ((v13 & 1) != 0)

  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)assignState:(unint64_t)a3 fromScanResults:(id)a4 withConcreteError:(id)a5
{
  id v5;
  int v6;
  SUSettingsStatefulDescriptor *v8;
  unint64_t v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;
  id v16;
  id location;
  unint64_t v18;
  SEL v19;
  SUSettingsStatefulDescriptor *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v15 = -[SUSettingsStatefulDescriptor maskedDescriptorType](v20, "maskedDescriptorType");
  v8 = v20;
  v9 = v18;
  v10 = (id)objc_msgSend(location, "currentDownload");
  if (v15)
    v6 = objc_msgSend(location, "alternateUpdateDownloadable") & 1;
  else
    v6 = objc_msgSend(location, "preferredUpdateDownloadable") & 1;
  v13 = 0;
  v11 = 0;
  if (v15)
  {
    v12 = (id)objc_msgSend(location, "alternateUpdateDownloadError");
    v11 = 1;
    v5 = v12;
  }
  else
  {
    v14 = (id)objc_msgSend(location, "preferredUpdateDownloadError");
    v13 = 1;
    v5 = v14;
  }
  -[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:](v8, "assignState:fromConcreteDownload:downloadable:downloadError:error:", v9, v10, v6 != 0, v5, v16);
  if ((v11 & 1) != 0)

  if ((v13 & 1) != 0)
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);
}

- (void)updateStateFromConcreteDownload:(id)a3 downloadable:(BOOL)a4 downloadError:(id)a5 isUpdateReadyForInstallation:(BOOL)a6 updateInstallationError:(id)a7 error:(id)a8
{
  SUDescriptor *v8;
  uint64_t v9;
  SUSettingsStatefulDescriptor *v10;
  id v11;
  SUSettingsStatefulDescriptor *v12;
  int v13;
  BOOL v19;
  id v20;
  char v21;
  id v22;
  int v23;
  id v24;
  id v25;
  BOOL v26;
  id v27;
  BOOL v28;
  id location[2];
  SUSettingsStatefulDescriptor *v30;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = a6;
  v25 = 0;
  objc_storeStrong(&v25, a7);
  v24 = 0;
  objc_storeStrong(&v24, a8);
  v8 = -[SUSettingsStatefulDescriptor descriptor](v30, "descriptor");
  v19 = v8 != 0;

  if (v19)
  {
    v21 = 0;
    LOBYTE(v13) = 1;
    if (location[0])
    {
      v12 = v30;
      v22 = (id)objc_msgSend(location[0], "descriptor");
      v21 = 1;
      v13 = !-[SUSettingsStatefulDescriptor isEqualToDescriptor:](v12, "isEqualToDescriptor:");
    }
    if ((v21 & 1) != 0)

    if ((v13 & 1) != 0)
    {
      -[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:](v30, "assignState:fromConcreteDownload:downloadable:downloadError:error:", 1, location[0], v28, v27, v24);
      v23 = 1;
    }
    else
    {
      v20 = (id)objc_msgSend(location[0], "progress");
      if ((objc_msgSend(v20, "isDone") & 1) != 0)
      {
        if (v26)
        {
          -[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:](v30, "assignState:fromConcreteDownload:downloadable:downloadError:error:", 4, location[0], v28, v27, v24);
          v23 = 1;
        }
        else
        {
          -[SUSettingsStatefulDescriptor resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:](v30, "resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:", v25, location[0], v28, v27, v24);
          v23 = 0;
        }
      }
      else
      {
        v10 = v30;
        v11 = (id)objc_msgSend(v20, "phase");
        if ((SUPrefsDownloadPhaseIsStalled(v11) & 1) != 0)
          v9 = 3;
        else
          v9 = 2;
        -[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:](v10, "assignState:fromConcreteDownload:downloadable:downloadError:error:", v9, location[0], v28, v27, v24);

        v23 = 1;
      }
      objc_storeStrong(&v20, 0);
    }
  }
  else
  {
    -[SUSettingsStatefulDescriptor assignState:](v30, "assignState:", 0);
    v23 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)assignState:(unint64_t)a3 fromConcreteDownload:(id)a4 downloadable:(BOOL)a5 downloadError:(id)a6 error:(id)a7
{
  uint64_t v7;
  __CFString *v8;
  id v9;
  SUSettingsStatefulDescriptor *v10;
  NSObject *v11;
  os_log_type_t v12;
  __CFString *v13;
  id v14;
  SUDescriptor *v15;
  __CFString *v16;
  SUCoreLog *v17;
  __CFString *v18;
  id v19;
  SUSettingsStatefulDescriptor *v20;
  NSObject *log;
  os_log_type_t v22;
  __CFString *v23;
  id v24;
  SUDescriptor *v25;
  __CFString *v26;
  SUCoreLog *v27;
  SUSettingsStatefulErrorContextProvider *v28;
  SUSettingsStatefulUIManager *v29;
  BOOL v30;
  SUSettingsStatefulDescriptor *v31;
  id v32;
  BOOL v33;
  id v37;
  char v38;
  __CFString *v39;
  id v40;
  __CFString *v41;
  os_log_type_t v42;
  os_log_t v43;
  int v44;
  __CFString *v45;
  id v46;
  __CFString *v47;
  os_log_type_t type;
  os_log_t oslog;
  id v50;
  id v51;
  id v52;
  BOOL v53;
  id location;
  uint64_t v55;
  SEL v56;
  SUSettingsStatefulDescriptor *v57;
  uint8_t v58[96];
  uint8_t v59[72];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v57 = self;
  v56 = a2;
  v55 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v53 = a5;
  v52 = 0;
  objc_storeStrong(&v52, a6);
  v51 = 0;
  objc_storeStrong(&v51, a7);
  v37 = (id)objc_msgSend(location, "progress");
  v38 = objc_msgSend(v37, "isDone");

  if ((v38 & 1) != 0)
  {
    v31 = v57;
    v32 = (id)objc_msgSend(location, "descriptor");
    v33 = -[SUSettingsStatefulDescriptor isEqualToDescriptor:](v31, "isEqualToDescriptor:");

    if (v33)
      objc_storeStrong(&v52, 0);
  }
  v50 = -[SUSettingsStatefulDescriptor updateDownloadError](v57, "updateDownloadError");
  v57->_updateDownloadable = v53;
  if (v51)
    objc_storeStrong((id *)&v57->_updateDownloadError, v51);
  else
    objc_storeStrong((id *)&v57->_updateDownloadError, v52);
  v7 = -[SUSettingsStatefulDescriptor currentState](v57, "currentState");
  if (v7 != v55)
    goto LABEL_15;
  v29 = -[SUSettingsStatefulDescriptor ownerManager](v57, "ownerManager");
  v28 = -[SUSettingsStatefulUIManager errorContextProvider](v29, "errorContextProvider");
  v30 = -[SUSettingsStatefulErrorContextProvider isError:intrinsicallyEquivalentToError:withStatefulDescriptor:download:](v28, "isError:intrinsicallyEquivalentToError:withStatefulDescriptor:download:", v50, v57->_updateDownloadError, v57, location);

  if (!v30)
  {
    v17 = -[SUSettingsStatefulDescriptor log](v57, "log");
    v43 = (os_log_t)(id)-[SUCoreLog oslog](v17, "oslog");

    v42 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v43;
      v12 = v42;
      v16 = SUSettingsDescriptorTypeToString(v57->_descriptorType);
      v8 = v16;
      v41 = v8;
      v15 = -[SUSettingsStatefulDescriptor descriptor](v57, "descriptor");
      v14 = (id)-[SUDescriptor humanReadableUpdateName](v15, "humanReadableUpdateName");
      v9 = v14;
      v40 = v9;
      v10 = v57;
      v13 = SUSettingsDescriptorStateToString(v55);
      v39 = v13;
      __os_log_helper_16_2_8_8_32_8_66_8_66_8_0_8_66_8_0_8_66_8_66((uint64_t)v58, (uint64_t)"-[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v39, v55, (uint64_t)v50, (uint64_t)v57->_updateDownloadError);
      _os_log_impl(&dword_21BF33000, v11, v12, "%s [%{public}@, %{public}@, %p]: Allowing to re-assign the state %{public}@ (%ld) because the old error is not intrinsically equivalent to the new error.\n\tPrevious Error: %{public}@\n\tNew Error: %{public}@", v58, 0x52u);

      objc_storeStrong((id *)&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong((id *)&v41, 0);
    }
    objc_storeStrong((id *)&v43, 0);
LABEL_15:
    -[SUSettingsStatefulDescriptor assignState:](v57, "assignState:", v55);
    v44 = 0;
    goto LABEL_16;
  }
  v27 = -[SUSettingsStatefulDescriptor log](v57, "log");
  oslog = (os_log_t)(id)-[SUCoreLog oslog](v27, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    v22 = type;
    v26 = SUSettingsDescriptorTypeToString(v57->_descriptorType);
    v18 = v26;
    v47 = v18;
    v25 = -[SUSettingsStatefulDescriptor descriptor](v57, "descriptor");
    v24 = (id)-[SUDescriptor humanReadableUpdateName](v25, "humanReadableUpdateName");
    v19 = v24;
    v46 = v19;
    v20 = v57;
    v23 = SUSettingsDescriptorStateToString(v55);
    v45 = v23;
    __os_log_helper_16_2_6_8_32_8_66_8_66_8_0_8_66_8_0((uint64_t)v59, (uint64_t)"-[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v18, (uint64_t)v19, (uint64_t)v20, (uint64_t)v45, v55);
    _os_log_impl(&dword_21BF33000, log, v22, "%s [%{public}@, %{public}@, %p]: Skipping on state assignment as it matches the current state: %{public}@ (%ld)", v59, 0x3Eu);

    objc_storeStrong((id *)&v45, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong((id *)&v47, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  v44 = 1;
LABEL_16:
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&location, 0);
}

- (void)updateStateFromProgressedDownload:(id)a3
{
  id v3;
  BOOL v4;
  SUSettingsStatefulDescriptor *v5;
  id v6;
  BOOL v7;
  id v8;
  int v9;
  id location[2];
  SUSettingsStatefulDescriptor *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v5 = v11;
    v6 = (id)objc_msgSend(location[0], "descriptor");
    v7 = -[SUSettingsStatefulDescriptor isEqualToDescriptor:](v5, "isEqualToDescriptor:");

    if (v7)
    {
      v8 = (id)objc_msgSend(location[0], "progress");
      if ((objc_msgSend(v8, "isDone") & 1) == 0)
      {
        v3 = (id)objc_msgSend(v8, "phase");
        v4 = 0;
        if ((SUPrefsDownloadPhaseIsStalled(v3) & 1) != 0)
          v4 = v11->_currentState != 3;

        if (v4)
        {
          -[SUSettingsStatefulDescriptor assignState:](v11, "assignState:", 3);
        }
        else if (v11->_currentState != 2)
        {
          -[SUSettingsStatefulDescriptor assignState:](v11, "assignState:", 2);
        }
      }
      objc_storeStrong(&v8, 0);
      v9 = 0;
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    -[SUSettingsStatefulDescriptor assignState:](v11, "assignState:", 1);
    v9 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)assignState:(unint64_t)a3
{
  NSObject *queue;
  OS_dispatch_queue *v4;
  SUSettingsStatefulUIManager *v5;
  id v6;
  SUSettingsStatefulUIManager *v7;
  SUSettingsStatefulUIManagerDelegate *v8;
  char v9;
  __CFString *v10;
  id v11;
  SUSettingsStatefulDescriptor *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  __CFString *v17;
  __CFString *v18;
  id v19;
  SUDescriptor *v20;
  __CFString *v21;
  SUCoreLog *v22;
  __CFString *v23;
  id v24;
  SUSettingsStatefulDescriptor *v25;
  NSObject *log;
  os_log_type_t type;
  __CFString *v28;
  id v29;
  SUDescriptor *v30;
  __CFString *v31;
  SUCoreLog *v32;
  uint64_t v33;
  int v34;
  int v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38[3];
  char v39;
  id v40;
  char v41;
  id v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  id v46;
  __CFString *v47;
  os_log_type_t v48;
  os_log_t oslog;
  __CFString *v50;
  id v51;
  __CFString *v52;
  os_log_type_t v53;
  id v54;
  void *v55;
  SEL v56;
  SUSettingsStatefulDescriptor *v57;
  uint8_t v58[96];
  uint8_t v59[72];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v57 = self;
  v56 = a2;
  v55 = (void *)a3;
  if (-[SUSettingsStatefulDescriptor currentState](self, "currentState") == a3)
  {
    v32 = -[SUSettingsStatefulDescriptor log](v57, "log");
    v54 = (id)-[SUCoreLog oslog](v32, "oslog");

    v53 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
    {
      log = v54;
      type = v53;
      v31 = SUSettingsDescriptorTypeToString(v57->_descriptorType);
      v23 = v31;
      v52 = v23;
      v30 = -[SUSettingsStatefulDescriptor descriptor](v57, "descriptor");
      v29 = (id)-[SUDescriptor humanReadableUpdateName](v30, "humanReadableUpdateName");
      v24 = v29;
      v51 = v24;
      v25 = v57;
      v28 = SUSettingsDescriptorStateToString(-[SUSettingsStatefulDescriptor currentState](v57, "currentState"));
      v50 = v28;
      __os_log_helper_16_2_6_8_32_8_66_8_66_8_0_8_66_8_0((uint64_t)v59, (uint64_t)"-[SUSettingsStatefulDescriptor assignState:]", (uint64_t)v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v50, -[SUSettingsStatefulDescriptor currentState](v57, "currentState"));
      _os_log_impl(&dword_21BF33000, log, type, "%s [%{public}@, %{public}@, %p]: Skipping on Descriptor State Assignment request: currentState == currentState (%{public}@ (%ld))", v59, 0x3Eu);

      objc_storeStrong((id *)&v50, 0);
      objc_storeStrong(&v51, 0);
      objc_storeStrong((id *)&v52, 0);
    }
    objc_storeStrong(&v54, 0);
  }
  else
  {
    v22 = -[SUSettingsStatefulDescriptor log](v57, "log");
    oslog = (os_log_t)(id)-[SUCoreLog oslog](v22, "oslog");

    v48 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = oslog;
      v16 = v48;
      v21 = SUSettingsDescriptorTypeToString(v57->_descriptorType);
      v10 = v21;
      v47 = v10;
      v20 = -[SUSettingsStatefulDescriptor descriptor](v57, "descriptor");
      v19 = (id)-[SUDescriptor humanReadableUpdateName](v20, "humanReadableUpdateName");
      v11 = v19;
      v46 = v11;
      v12 = v57;
      v18 = SUSettingsDescriptorStateToString(-[SUSettingsStatefulDescriptor currentState](v57, "currentState"));
      v13 = v18;
      v45 = v13;
      v14 = -[SUSettingsStatefulDescriptor currentState](v57, "currentState");
      v17 = SUSettingsDescriptorStateToString((unint64_t)v55);
      v44 = v17;
      __os_log_helper_16_2_8_8_32_8_66_8_66_8_0_8_66_8_0_8_66_8_0((uint64_t)v58, (uint64_t)"-[SUSettingsStatefulDescriptor assignState:]", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, v14, (uint64_t)v44, (uint64_t)v55);
      _os_log_impl(&dword_21BF33000, v15, v16, "%s [%{public}@, %{public}@, %p]: Assigning Descriptor state: %{public}@ (%ld) -> %{public}@ (%ld)", v58, 0x52u);

      objc_storeStrong((id *)&v44, 0);
      objc_storeStrong((id *)&v45, 0);
      objc_storeStrong(&v46, 0);
      objc_storeStrong((id *)&v47, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v43 = -[SUSettingsStatefulDescriptor currentState](v57, "currentState");
    -[SUSettingsStatefulDescriptor setCurrentState:](v57, "setCurrentState:", v55);
    v7 = -[SUSettingsStatefulDescriptor ownerManager](v57, "ownerManager");
    v8 = -[SUSettingsStatefulUIManager delegate](v7, "delegate");
    v41 = 0;
    v39 = 0;
    v9 = 0;
    if (v8)
    {
      v42 = -[SUSettingsStatefulDescriptor ownerManager](v57, "ownerManager");
      v41 = 1;
      v40 = (id)objc_msgSend(v42, "delegate");
      v39 = 1;
      v9 = objc_opt_respondsToSelector();
    }
    if ((v39 & 1) != 0)

    if ((v41 & 1) != 0)
    if ((v9 & 1) != 0)
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      v5 = -[SUSettingsStatefulDescriptor ownerManager](v57, "ownerManager");
      v4 = -[SUSettingsStatefulUIManager delegateCallbackQueue](v5, "delegateCallbackQueue");
      queue = (id)objc_msgSend(v6, "selectDelegateCallbackQueue:");
      v33 = MEMORY[0x24BDAC760];
      v34 = -1073741824;
      v35 = 0;
      v36 = __44__SUSettingsStatefulDescriptor_assignState___block_invoke;
      v37 = &unk_24DFF7B30;
      v38[0] = v57;
      v38[1] = v43;
      v38[2] = v55;
      dispatch_async(queue, &v33);

      objc_storeStrong(v38, 0);
    }
  }
}

void __44__SUSettingsStatefulDescriptor_assignState___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "ownerManager");
  v3 = (id)objc_msgSend(v4, "delegate");
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "ownerManager");
  objc_msgSend(v3, "statefulUIManager:descriptor:didTransitionFromDescriptorState:toState:");

}

- (void)resolveInstallationError:(id)a3 fromConcreteDownload:(id)a4 downloadable:(BOOL)a5 downloadError:(id)a6 error:(id)a7
{
  __CFString *v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  SUDescriptor *v11;
  __CFString *v12;
  SUCoreLog *v13;
  unint64_t v14;
  __CFString *v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  SUDescriptor *v19;
  __CFString *v20;
  SUCoreLog *v21;
  id v22;
  id v23;
  char v24;
  __CFString *v25;
  NSObject *log;
  os_log_type_t v27;
  id v28;
  SUDescriptor *v29;
  __CFString *v30;
  SUCoreLog *v31;
  id v36;
  __CFString *v37;
  os_log_type_t v38;
  os_log_t v39;
  int v40;
  id v41;
  __CFString *v42;
  os_log_type_t v43;
  os_log_t v44;
  char v45;
  uint64_t v46;
  id v47;
  __CFString *v48;
  os_log_type_t type;
  os_log_t oslog;
  id v51;
  id v52;
  BOOL v53;
  id v54;
  id location[2];
  SUSettingsStatefulDescriptor *v56;
  uint8_t v57[64];
  uint8_t v58[48];
  uint8_t v59[56];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v56 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v54 = 0;
  objc_storeStrong(&v54, a4);
  v53 = a5;
  v52 = 0;
  objc_storeStrong(&v52, a6);
  v51 = 0;
  objc_storeStrong(&v51, a7);
  v31 = -[SUSettingsStatefulDescriptor log](v56, "log");
  oslog = (os_log_t)(id)-[SUCoreLog oslog](v31, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    v27 = type;
    v30 = SUSettingsDescriptorTypeToString(v56->_descriptorType);
    v25 = v30;
    v48 = v25;
    v29 = -[SUSettingsStatefulDescriptor descriptor](v56, "descriptor");
    v28 = (id)-[SUDescriptor humanReadableUpdateName](v29, "humanReadableUpdateName");
    v47 = v28;
    __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66((uint64_t)v59, (uint64_t)"-[SUSettingsStatefulDescriptor resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v25, (uint64_t)v47, (uint64_t)v56, (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, log, v27, "%s [%{public}@, %{public}@, %p]: Resolving installation error: %{public}@", v59, 0x34u);

    objc_storeStrong(&v47, 0);
    objc_storeStrong((id *)&v48, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  v46 = 4;
  v45 = 1;
  v23 = (id)objc_msgSend(location[0], "domain");
  v22 = getSUErrorDomain_0();
  v24 = objc_msgSend(v23, "isEqualToString:");

  if ((v24 & 1) != 0)
  {
    if (v51)
      objc_storeStrong(&v51, v51);
    else
      objc_storeStrong(&v51, location[0]);
    v14 = objc_msgSend(location[0], "code") - 3;
    if (v14 <= 0x27)
      __asm { BR              X8 }
    v13 = -[SUSettingsStatefulDescriptor log](v56, "log");
    v39 = (os_log_t)(id)-[SUCoreLog oslog](v13, "oslog");

    v38 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v8 = v39;
      v9 = v38;
      v12 = SUSettingsDescriptorTypeToString(v56->_descriptorType);
      v7 = v12;
      v37 = v7;
      v11 = -[SUSettingsStatefulDescriptor descriptor](v56, "descriptor");
      v10 = (id)-[SUDescriptor humanReadableUpdateName](v11, "humanReadableUpdateName");
      v36 = v10;
      __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66((uint64_t)v57, (uint64_t)"-[SUSettingsStatefulDescriptor resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v7, (uint64_t)v36, (uint64_t)v56, (uint64_t)v51);
      _os_log_error_impl(&dword_21BF33000, v8, v9, "%s [%{public}@, %{public}@, %p]: Couldn't resolve the installation error: %{public}@", v57, 0x34u);

      objc_storeStrong(&v36, 0);
      objc_storeStrong((id *)&v37, 0);
    }
    objc_storeStrong((id *)&v39, 0);
    if ((v45 & 1) != 0)
      -[SUSettingsStatefulDescriptor assignState:fromConcreteDownload:downloadable:downloadError:error:](v56, "assignState:fromConcreteDownload:downloadable:downloadError:error:", v46, v54, v53, v52, v51);
    v40 = 0;
  }
  else
  {
    v21 = -[SUSettingsStatefulDescriptor log](v56, "log");
    v44 = (os_log_t)(id)-[SUCoreLog oslog](v21, "oslog");

    v43 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v16 = v44;
      v17 = v43;
      v20 = SUSettingsDescriptorTypeToString(v56->_descriptorType);
      v15 = v20;
      v42 = v15;
      v19 = -[SUSettingsStatefulDescriptor descriptor](v56, "descriptor");
      v18 = (id)-[SUDescriptor humanReadableUpdateName](v19, "humanReadableUpdateName");
      v41 = v18;
      __os_log_helper_16_2_4_8_32_8_66_8_66_8_0((uint64_t)v58, (uint64_t)"-[SUSettingsStatefulDescriptor resolveInstallationError:fromConcreteDownload:downloadable:downloadError:error:]", (uint64_t)v15, (uint64_t)v41, (uint64_t)v56);
      _os_log_error_impl(&dword_21BF33000, v16, v17, "%s [%{public}@, %{public}@, %p]: The installation error domain doesn't match SUSErrorDomain.", v58, 0x2Au);

      objc_storeStrong(&v41, 0);
      objc_storeStrong((id *)&v42, 0);
    }
    objc_storeStrong((id *)&v44, 0);
    v40 = 1;
  }
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)maskedDescriptorType
{
  SUSettingsStatefulUIManager *v2;
  SUSettingsStatefulUIManager *v4;
  BOOL v5;
  __CFString *v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  SUDescriptor *v10;
  __CFString *v11;
  SUCoreLog *v12;
  BOOL v13;
  id v14;
  __CFString *v15;
  os_log_type_t v16;
  id v17[2];
  SUSettingsStatefulDescriptor *v18;
  uint8_t v20[56];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  v17[1] = (id)a2;
  v2 = -[SUSettingsStatefulDescriptor ownerManager](self, "ownerManager");
  v13 = v2 != 0;

  if (v13)
  {
    v4 = -[SUSettingsStatefulDescriptor ownerManager](v18, "ownerManager");
    v5 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v4, "hidingPreferredDescriptor");

    if (v5)
      return v18->_descriptorType != 1;
    else
      return v18->_descriptorType;
  }
  else
  {
    v12 = -[SUSettingsStatefulDescriptor log](v18, "log");
    v17[0] = (id)-[SUCoreLog oslog](v12, "oslog");

    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v17[0];
      type = v16;
      v11 = SUSettingsDescriptorTypeToString(v18->_descriptorType);
      v6 = v11;
      v15 = v6;
      v10 = -[SUSettingsStatefulDescriptor descriptor](v18, "descriptor");
      v9 = (id)-[SUDescriptor humanReadableUpdateName](v10, "humanReadableUpdateName");
      v14 = v9;
      __os_log_helper_16_2_4_8_32_8_66_8_66_8_0((uint64_t)v20, (uint64_t)"-[SUSettingsStatefulDescriptor maskedDescriptorType]", (uint64_t)v6, (uint64_t)v14, (uint64_t)v18);
      _os_log_impl(&dword_21BF33000, log, type, "%s [%{public}@, %{public}@, %p]: Could not get the masked descriptor type because the ownerManager is nil. This is likely a bug.", v20, 0x2Au);

      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v15, 0);
    }
    objc_storeStrong(v17, 0);
    return v18->_descriptorType;
  }
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (unint64_t)descriptorType
{
  return self->_descriptorType;
}

- (void)setDescriptorType:(unint64_t)a3
{
  self->_descriptorType = a3;
}

- (SUDescriptor)descriptor
{
  return (SUDescriptor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)updateDownloadable
{
  return self->_updateDownloadable;
}

- (void)setUpdateDownloadable:(BOOL)a3
{
  self->_updateDownloadable = a3;
}

- (NSError)updateDownloadError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdateDownloadError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SUCoreLog)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (SUSettingsStatefulUIManager)ownerManager
{
  return (SUSettingsStatefulUIManager *)objc_loadWeakRetained((id *)&self->_ownerManager);
}

- (void)setOwnerManager:(id)a3
{
  objc_storeWeak((id *)&self->_ownerManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ownerManager);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_updateDownloadError, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
