@implementation SUSettingsStatefulErrorContextProvider

- (id)initForManager:(id)a3
{
  SUSettingsStatefulErrorContextProvider *v3;
  uint64_t v4;
  SUCoreLog *log;
  SUSettingsStatefulErrorContextProvider *v7;
  SUSettingsStatefulErrorContextProvider *v8;
  objc_super v9;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)SUSettingsStatefulErrorContextProvider;
  v8 = -[SUSettingsStatefulErrorContextProvider init](&v9, sel_init);
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    -[SUSettingsStatefulErrorContextProvider setOwnerManager:](v11, "setOwnerManager:", location[0]);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA70]), "initWithCategory:", CFSTR("SUSettingsStatefulErrorContextProvider"));
    log = v11->_log;
    v11->_log = (SUCoreLog *)v4;

  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)isError:(id)a3 intrinsicallyEquivalentToError:(id)a4 withStatefulDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  SUSettingsStatefulErrorContextProvider *v11;
  SUDownload *v12;
  SUSettingsStatefulUIManager *v13;
  BOOL v14;
  id v15;
  id v16;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v11 = v18;
  v8 = location[0];
  v9 = v16;
  v10 = v15;
  v13 = -[SUSettingsStatefulErrorContextProvider ownerManager](v18, "ownerManager");
  v12 = -[SUSettingsStatefulUIManager currentDownload](v13, "currentDownload");
  v14 = -[SUSettingsStatefulErrorContextProvider isError:intrinsicallyEquivalentToError:withStatefulDescriptor:download:](v11, "isError:intrinsicallyEquivalentToError:withStatefulDescriptor:download:", v8, v9, v10);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v14;
}

- (BOOL)isError:(id)a3 intrinsicallyEquivalentToError:(id)a4 withStatefulDescriptor:(id)a5 download:(id)a6
{
  uint64_t v7;
  id v8;
  id v9;
  BOOL v10;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  char v19;
  int v20;
  id v21;
  id v22;
  __int128 v23;
  SEL v24;
  SUSettingsStatefulErrorContextProvider *v25;
  BOOL v26;

  v25 = self;
  v24 = a2;
  *((_QWORD *)&v23 + 1) = 0;
  objc_storeStrong((id *)&v23 + 1, a3);
  *(_QWORD *)&v23 = 0;
  objc_storeStrong((id *)&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = 0;
  objc_storeStrong(&v21, a6);
  if (v23 == 0)
  {
    v26 = 1;
    v20 = 1;
  }
  else
  {
    v8 = (id)objc_msgSend(*((id *)&v23 + 1), "domain");
    v9 = (id)objc_msgSend((id)v23, "domain");
    v10 = 1;
    if ((objc_msgSend(v8, "isEqualToString:") & 1) != 0)
    {
      v7 = objc_msgSend(*((id *)&v23 + 1), "code");
      v10 = v7 != objc_msgSend((id)v23, "code");
    }

    if (v10)
    {
      v26 = 0;
      v20 = 1;
    }
    else
    {
      v19 = -[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForError:statefulDescriptor:download:](v25, "shouldEnableUpdateButtonForError:statefulDescriptor:download:", *((_QWORD *)&v23 + 1), v22, v21);
      v18 = -[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForError:statefulDescriptor:download:](v25, "shouldEnableUpdateButtonForError:statefulDescriptor:download:", (_QWORD)v23, v22, v21);
      if ((v19 & 1) == v18)
      {
        v17 = -[SUSettingsStatefulErrorContextProvider localizedTitleForError:statefulDescriptor:download:](v25, "localizedTitleForError:statefulDescriptor:download:", *((_QWORD *)&v23 + 1), v22, v21);
        v16 = -[SUSettingsStatefulErrorContextProvider localizedTitleForError:statefulDescriptor:download:](v25, "localizedTitleForError:statefulDescriptor:download:", (_QWORD)v23, v22, v21);
        if (v17 || v16)
        {
          if ((objc_msgSend(v17, "isEqualToString:", v16) & 1) != 0)
          {
            v15 = -[SUSettingsStatefulErrorContextProvider localizedDescriptionForError:statefulDescriptor:download:](v25, "localizedDescriptionForError:statefulDescriptor:download:", *((_QWORD *)&v23 + 1), v22, v21);
            v14 = -[SUSettingsStatefulErrorContextProvider localizedDescriptionForError:statefulDescriptor:download:](v25, "localizedDescriptionForError:statefulDescriptor:download:", (_QWORD)v23, v22, v21);
            if (v15 || v14)
            {
              v26 = (objc_msgSend(v15, "isEqualToString:", v14) & 1) != 0;
              v20 = 1;
            }
            else
            {
              v26 = v22 == 0;
              v20 = 1;
            }
            objc_storeStrong(&v14, 0);
            objc_storeStrong(&v15, 0);
          }
          else
          {
            v26 = 0;
            v20 = 1;
          }
        }
        else
        {
          v26 = v22 == 0;
          v20 = 1;
        }
        objc_storeStrong(&v16, 0);
        objc_storeStrong(&v17, 0);
      }
      else
      {
        v26 = 0;
        v20 = 1;
      }
    }
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong((id *)&v23, 0);
  objc_storeStrong((id *)&v23 + 1, 0);
  return v26;
}

- (BOOL)shouldIgnoreUpdateError:(id)a3 withStatefulDescriptor:(id)a4
{
  id v6;
  id v7;
  SUSettingsStatefulErrorContextProvider *v8;
  SUDownload *v9;
  SUSettingsStatefulUIManager *v10;
  BOOL v11;
  id v12;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v8 = v14;
  v6 = location[0];
  v7 = v12;
  v10 = -[SUSettingsStatefulErrorContextProvider ownerManager](v14, "ownerManager");
  v9 = -[SUSettingsStatefulUIManager currentDownload](v10, "currentDownload");
  v11 = -[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:download:](v8, "shouldIgnoreUpdateError:withStatefulDescriptor:download:", v6, v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (BOOL)shouldIgnoreUpdateError:(id)a3 withStatefulDescriptor:(id)a4 download:(id)a5
{
  float v5;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  id v15;
  char v16;
  id v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  int v23;
  uint64_t v24;
  id v25;
  id v26;
  id location[3];
  char v28;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v24 = objc_msgSend(location[0], "code");
  v15 = (id)objc_msgSend(location[0], "domain");
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BEAED98]);

  if ((v16 & 1) != 0)
  {
    if (v24 == 3 || v24 == 11 || v24 == 13)
    {
      v28 = 1;
      v23 = 1;
      goto LABEL_41;
    }
    v21 = 0;
    v12 = 1;
    if (v26)
    {
      v22 = (id)objc_msgSend(v26, "descriptor");
      v21 = 1;
      v12 = v22 == 0;
    }
    if ((v21 & 1) != 0)

    if (v12)
    {
      v28 = 0;
      v23 = 1;
      goto LABEL_41;
    }
    v19 = 0;
    v11 = 1;
    if (v25)
    {
      v20 = (id)objc_msgSend(v25, "progress");
      v19 = 1;
      v11 = 1;
      if (v20)
        v11 = objc_msgSend(v26, "currentState") != 2;
    }
    if ((v19 & 1) != 0)

    if (v11)
    {
      v28 = 0;
      v23 = 1;
      goto LABEL_41;
    }
    v18 = (id)objc_msgSend(v25, "progress");
    v9 = (id)objc_msgSend(v18, "phase");
    v10 = 0;
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEAEE98]) & 1) != 0)
    {
      objc_msgSend(v18, "percentComplete");
      v10 = v5 >= 1.0;
    }

    if (v10)
    {
      switch(v24)
      {
        case 33:
        case 34:
        case 8:
        case 31:
        case 9:
        case 83:
        case 26:
          v28 = 1;
          v23 = 1;
LABEL_40:
          objc_storeStrong(&v18, 0);
          goto LABEL_41;
        case 6:
          v28 = 1;
          v23 = 1;
          goto LABEL_40;
        case 20:
          v8 = (id)objc_msgSend(location[0], "userInfo");
          v7 = getkSUInstallationConstraintsUnmetKey_2();
          v17 = (id)objc_msgSend(v8, "objectForKey:");

          if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == 4)
          {
            v28 = 1;
            v23 = 1;
          }
          else
          {
            v23 = 0;
          }
          objc_storeStrong(&v17, 0);
          if (v23)
            goto LABEL_40;
          break;
      }
    }
    v28 = 0;
    v23 = 1;
    goto LABEL_40;
  }
  v28 = 0;
  v23 = 1;
LABEL_41:
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v28 & 1;
}

- (BOOL)shouldEnableUpdateButtonForError:(id)a3 statefulDescriptor:(id)a4
{
  id v6;
  id v7;
  SUSettingsStatefulErrorContextProvider *v8;
  SUDownload *v9;
  SUSettingsStatefulUIManager *v10;
  BOOL v11;
  id v12;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v8 = v14;
  v6 = location[0];
  v7 = v12;
  v10 = -[SUSettingsStatefulErrorContextProvider ownerManager](v14, "ownerManager");
  v9 = -[SUSettingsStatefulUIManager currentDownload](v10, "currentDownload");
  v11 = -[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForError:statefulDescriptor:download:](v8, "shouldEnableUpdateButtonForError:statefulDescriptor:download:", v6, v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (BOOL)shouldEnableUpdateButtonForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  NSObject *log;
  os_log_type_t type;
  id v8;
  SUCoreLog *v9;
  id v10;
  id v11;
  char v12;
  id v15;
  os_log_type_t v16;
  id v17;
  int v18;
  id v19;
  id v20;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v22;
  char v23;
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  if (-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:download:](v22, "shouldIgnoreUpdateError:withStatefulDescriptor:download:", location[0], v20, v19))
  {
    v23 = 1;
    v18 = 1;
  }
  else
  {
    v11 = (id)objc_msgSend(location[0], "domain");
    v10 = getSUErrorDomain_4();
    v12 = objc_msgSend(v11, "isEqualToString:");

    if ((v12 & 1) != 0)
    {
      if ((unint64_t)(objc_msgSend(location[0], "code") - 33) > 1)
        v23 = 0;
      else
        v23 = -[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForNetworkError:statefulDescriptor:download:](v22, "shouldEnableUpdateButtonForNetworkError:statefulDescriptor:download:", location[0], v20, v19);
      v18 = 1;
    }
    else
    {
      v9 = -[SUSettingsStatefulErrorContextProvider log](v22, "log");
      v17 = (id)-[SUCoreLog oslog](v9, "oslog");

      v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        log = v17;
        type = v16;
        v8 = (id)objc_msgSend(v20, "humanReadableUpdateName");
        v15 = v8;
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v24, (uint64_t)v15, (uint64_t)location[0]);
        _os_log_impl(&dword_21BF33000, log, type, "Receieved an unexpected non-SUS error for descriptor %{public}@. Not ignoring. Error: %{public}@", v24, 0x16u);

        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong(&v17, 0);
      v23 = 0;
      v18 = 1;
    }
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23 & 1;
}

- (id)localizedTitleForError:(id)a3 statefulDescriptor:(id)a4
{
  id v6;
  id v7;
  SUSettingsStatefulErrorContextProvider *v8;
  SUDownload *v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  id v12;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v8 = v14;
  v6 = location[0];
  v7 = v12;
  v10 = -[SUSettingsStatefulErrorContextProvider ownerManager](v14, "ownerManager");
  v9 = -[SUSettingsStatefulUIManager currentDownload](v10, "currentDownload");
  v11 = -[SUSettingsStatefulErrorContextProvider localizedTitleForError:statefulDescriptor:download:](v8, "localizedTitleForError:statefulDescriptor:download:", v6, v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)localizedTitleForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  id v5;
  id v6;
  id v8;
  NSObject *log;
  os_log_type_t type;
  id v11;
  SUCoreLog *v12;
  id v13;
  id v14;
  char v15;
  id v18;
  char v19;
  id v20;
  uint64_t v21;
  id v22;
  int v23;
  id v24;
  id v25;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v27;
  id v28;
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  if (-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:download:](v27, "shouldIgnoreUpdateError:withStatefulDescriptor:download:", location[0], v25, v24))
  {
    v28 = 0;
    v23 = 1;
  }
  else
  {
    v22 = 0;
    v14 = (id)objc_msgSend(location[0], "domain");
    v13 = getSUErrorDomain_4();
    v15 = objc_msgSend(v14, "isEqualToString:");

    if ((v15 & 1) != 0)
    {
      v21 = objc_msgSend(location[0], "code");
      if ((unint64_t)(v21 - 6) <= 0x64)
        __asm { BR              X8 }
    }
    v12 = -[SUSettingsStatefulErrorContextProvider log](v27, "log");
    v20 = (id)-[SUCoreLog oslog](v12, "oslog");

    v19 = 16;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      log = v20;
      type = v19;
      v11 = (id)objc_msgSend(v25, "humanReadableUpdateName");
      v18 = v11;
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v29, (uint64_t)v18, (uint64_t)location[0]);
      _os_log_error_impl(&dword_21BF33000, log, type, "Couldn't map the error into a localizable title for %{public}@: %{public}@", v29, 0x16u);

      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong(&v20, 0);
    v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UPDATE_ERROR_TITLE_GENERAL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
    v6 = v22;
    v22 = v5;

    v28 = v22;
    v23 = 1;
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v28;
}

- (id)localizedDescriptionForError:(id)a3 statefulDescriptor:(id)a4
{
  id v6;
  id v7;
  SUSettingsStatefulErrorContextProvider *v8;
  SUDownload *v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  id v12;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v8 = v14;
  v6 = location[0];
  v7 = v12;
  v10 = -[SUSettingsStatefulErrorContextProvider ownerManager](v14, "ownerManager");
  v9 = -[SUSettingsStatefulUIManager currentDownload](v10, "currentDownload");
  v11 = -[SUSettingsStatefulErrorContextProvider localizedDescriptionForError:statefulDescriptor:download:](v8, "localizedDescriptionForError:statefulDescriptor:download:", v6, v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)localizedDescriptionForError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  char v10;
  NSObject *log;
  os_log_type_t v12;
  id v13;
  SUCoreLog *v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  char v20;
  char v23;
  id v24;
  id v25;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v28;
  id v29;
  int v30;
  id v31;
  id v32;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v34;
  id v35;
  uint8_t v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = 0;
  objc_storeStrong(&v32, a4);
  v31 = 0;
  objc_storeStrong(&v31, a5);
  if (-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:download:](v34, "shouldIgnoreUpdateError:withStatefulDescriptor:download:", location[0], v32, v31))
  {
    v35 = 0;
    v30 = 1;
  }
  else
  {
    v29 = 0;
    v19 = (id)objc_msgSend(location[0], "domain");
    v18 = getSUErrorDomain_4();
    v20 = objc_msgSend(v19, "isEqualToString:");

    if ((v20 & 1) != 0)
    {
      v28 = objc_msgSend(location[0], "code");
      if ((unint64_t)(v28 - 6) <= 0x64)
        __asm { BR              X8 }
    }
    else
    {
      v16 = (id)objc_msgSend(location[0], "domain");
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.preferences.softwareupdate"));

      if ((v17 & 1) != 0 && objc_msgSend(location[0], "code") == 1)
      {
        v15 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("UPDATE_REQUESTED_EXPLANATION"), &stru_24E0011F0, CFSTR("Software Update"));
        v6 = v29;
        v29 = v5;

      }
    }
    if (location[0] && !v29)
    {
      v14 = -[SUSettingsStatefulErrorContextProvider log](v34, "log");
      oslog = (os_log_t)(id)-[SUCoreLog oslog](v14, "oslog");

      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v12 = type;
        v13 = (id)objc_msgSend(v32, "humanReadableUpdateName");
        v25 = v13;
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v36, (uint64_t)v25, (uint64_t)location[0]);
        _os_log_error_impl(&dword_21BF33000, log, v12, "Couldn't map the error into a localizable title for %{public}@: %{public}@", v36, 0x16u);

        objc_storeStrong(&v25, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_storeStrong(&v29, &stru_24E0011F0);
    }
    v23 = 0;
    v10 = 0;
    if (location[0])
    {
      v10 = 0;
      if ((objc_msgSend(v29, "isEqualToString:", &stru_24E0011F0) & 1) != 0)
      {
        v24 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v23 = 1;
        v10 = objc_msgSend(v24, "sf_isInternalInstall");
      }
    }
    if ((v23 & 1) != 0)

    if ((v10 & 1) != 0)
    {
      v7 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Internal Only] An unresolvable error has occurred, please file a radar. Error Code: %ld."), objc_msgSend(location[0], "code"));
      v8 = v29;
      v29 = v7;

    }
    v35 = v29;
    v30 = 1;
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v35;
}

- (BOOL)shouldEnableUpdateButtonForNetworkError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  id v5;
  id v7;
  SUCoreLog *v8;
  void *v9;
  id v10;
  SUCoreLog *v11;
  id v12;
  NSObject *v13;
  id v14;
  int v17;
  os_log_t oslog;
  id v19;
  id v20;
  os_log_type_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v31;
  char v32;
  uint8_t v33[16];
  uint8_t v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = 0;
  objc_storeStrong(&v28, a5);
  if (objc_msgSend(v29, "currentState") != 3)
    goto LABEL_16;
  v27 = 0;
  v12 = objc_alloc(MEMORY[0x24BDC2810]);
  v13 = dispatch_get_global_queue(33, 0);
  v26 = (id)objc_msgSend(v12, "initWithQueue:");

  v25 = 0;
  v23 = 0;
  v14 = (id)objc_msgSend(v26, "getPreferredDataSubscriptionContextSync:", &v23);
  objc_storeStrong(&v25, v23);
  v24 = v14;
  if (v14)
  {
    v20 = 0;
    v19 = 0;
    v9 = (void *)objc_msgSend(v26, "copyRegistrationStatus:error:", v24, &v19);
    objc_storeStrong(&v20, v19);
    v5 = v27;
    v27 = v9;

    if (!v27)
    {
      v8 = -[SUSettingsStatefulErrorContextProvider log](v31, "log");
      oslog = (os_log_t)(id)-[SUCoreLog oslog](v8, "oslog");

      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v7 = (id)objc_msgSend(v20, "description");
        __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v7);
        _os_log_error_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_ERROR, "Failed to copyRegistrationStatus from CoreTelephony. %@", v33, 0xCu);

      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v11 = -[SUSettingsStatefulErrorContextProvider log](v31, "log");
    v22 = (id)-[SUCoreLog oslog](v11, "oslog");

    v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      v10 = (id)objc_msgSend(v25, "description");
      __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v10);
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v22, v21, "Failed to get preferred CTXPCServiceSubscriptionContext. %@", v34, 0xCu);

    }
    objc_storeStrong(&v22, 0);
  }
  if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BDC2C68]) & 1) != 0 && (PSIsDataRoamingEnabled() & 1) != 0)
  {
    v32 = 1;
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  if (!v17)
LABEL_16:
    v32 = 0;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v32 & 1;
}

- (id)localizedTitleForUnmetConstraintsError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  float v5;
  float v6;
  double v7;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  SUSettingsStatefulUIManager *v20;
  SUSettingsStatefulUIOptions *v21;
  BOOL v22;
  float v23;
  id v26;
  int v27;
  int v28;
  uint64_t v29;
  char v30;
  id v31;
  char v32;
  id v33;
  float v34;
  id v35;
  id v36;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v38;
  id v39;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = 0;
  objc_storeStrong(&v35, a5);
  v34 = 0.0;
  v32 = 0;
  v30 = 0;
  if (v36 && (v33 = (id)objc_msgSend(v36, "descriptor"), v32 = 1, v33))
  {
    v31 = (id)objc_msgSend(v36, "descriptor");
    v30 = 1;
    SURequiredBatteryLevelForInstallation();
    v23 = v5;
  }
  else
  {
    SUPrefsRequiredBatteryLevelForInstall_0();
    v23 = v6;
  }
  if ((v30 & 1) != 0)

  if ((v32 & 1) != 0)
  v34 = v23;
  v18 = (id)objc_msgSend(location[0], "userInfo");
  v17 = getkSUInstallationConstraintsUnmetKey_2();
  v16 = (id)objc_msgSend(v18, "objectForKey:");
  v19 = objc_msgSend(v16, "unsignedIntegerValue");

  v29 = v19;
  v20 = -[SUSettingsStatefulErrorContextProvider ownerManager](v38, "ownerManager");
  v21 = -[SUSettingsStatefulUIManager options](v20, "options");
  v22 = 0;
  if (!-[SUSettingsStatefulUIOptions clientIsBuddy](v21, "clientIsBuddy"))
    v22 = (v29 & 4) != 0;

  if (v22)
  {
    v15 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v39 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("UPDATE_ERROR_TITLE_INSUFFICIENT_DISK_SPACE"), &stru_24E0011F0, CFSTR("Software Update"));

    v28 = 1;
  }
  else if ((v29 & 1) != 0)
  {
    v7 = floorf(100.0 * v34) / 100.0;
    *(float *)&v7 = v7;
    v27 = LODWORD(v7);
    v10 = (void *)MEMORY[0x24BDD16F0];
    v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
    v26 = (id)objc_msgSend(v10, "localizedStringFromNumber:numberStyle:");

    v12 = (void *)MEMORY[0x24BDD17C8];
    v14 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("UPDATE_ERROR_TITLE_LOW_BATTERY"), &stru_24E0011F0, CFSTR("Software Update"));
    v39 = (id)objc_msgSend(v12, "stringWithFormat:", v26);

    v28 = 1;
    objc_storeStrong(&v26, 0);
  }
  else
  {
    v9 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v39 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UPDATE_ERROR_TITLE_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));

    v28 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v39;
}

- (id)localizedDescriptionForNetworkError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  SUCoreLog *v13;
  void *v14;
  id v15;
  SUCoreLog *v16;
  id v17;
  NSObject *v18;
  id v19;
  char v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  char v28;
  id v29;
  char v30;
  id v31;
  int v32;
  id v33;
  id v34;
  id v35;
  os_log_type_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id location[2];
  SUSettingsStatefulErrorContextProvider *v47;
  id v48;
  uint8_t v49[16];
  uint8_t v50[24];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = 0;
  objc_storeStrong(&v45, a4);
  v44 = 0;
  objc_storeStrong(&v44, a5);
  v43 = objc_msgSend(location[0], "code");
  if (objc_msgSend(v45, "currentState") != 3)
    goto LABEL_34;
  v42 = 0;
  v17 = objc_alloc(MEMORY[0x24BDC2810]);
  v18 = dispatch_get_global_queue(33, 0);
  v41 = (id)objc_msgSend(v17, "initWithQueue:");

  v40 = 0;
  v38 = 0;
  v19 = (id)objc_msgSend(v41, "getPreferredDataSubscriptionContextSync:", &v38);
  objc_storeStrong(&v40, v38);
  v39 = v19;
  if (v19)
  {
    v35 = 0;
    v34 = 0;
    v14 = (void *)objc_msgSend(v41, "copyRegistrationStatus:error:", v39, &v34);
    objc_storeStrong(&v35, v34);
    v5 = v42;
    v42 = v14;

    if (!v42)
    {
      v13 = -[SUSettingsStatefulErrorContextProvider log](v47, "log");
      v33 = (id)-[SUCoreLog oslog](v13, "oslog");

      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      {
        v12 = (id)objc_msgSend(v35, "description");
        __os_log_helper_16_2_1_8_66((uint64_t)v49, (uint64_t)v12);
        _os_log_error_impl(&dword_21BF33000, (os_log_t)v33, OS_LOG_TYPE_ERROR, "Failed to copyRegistrationStatus from CoreTelephony. Error: %{public}@", v49, 0xCu);

      }
      objc_storeStrong(&v33, 0);
    }
    objc_storeStrong(&v35, 0);
  }
  else
  {
    v16 = -[SUSettingsStatefulErrorContextProvider log](v47, "log");
    v37 = (id)-[SUCoreLog oslog](v16, "oslog");

    v36 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
    {
      v15 = (id)objc_msgSend(v40, "description");
      __os_log_helper_16_2_1_8_66((uint64_t)v50, (uint64_t)v15);
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v37, v36, "Failed to get preferred CTXPCServiceSubscriptionContext. error: %{public}@", v50, 0xCu);

    }
    objc_storeStrong(&v37, 0);
  }
  if ((objc_msgSend(v42, "isEqualToString:", *MEMORY[0x24BDC2C68]) & 1) != 0)
  {
    if ((PSIsDataRoamingEnabled() & 1) != 0)
    {
      v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v48 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_RESUME_ROAMING_REQUIRED"), &stru_24E0011F0, CFSTR("Software Update"));

    }
    else
    {
      v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (id)SFLocalizableWAPIStringKeyForKey();
      v48 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:");

    }
    v32 = 1;
  }
  else if (v43 == 33)
  {
    v8 = (id)objc_msgSend(v45, "descriptor");
    v30 = 0;
    v28 = 0;
    v26 = 0;
    v24 = 0;
    v22 = 0;
    if (v8
      && (v31 = (id)objc_msgSend(v45, "descriptor"),
          v30 = 1,
          (objc_msgSend(v31, "isSplatOnly") & 1) != 0))
    {
      v29 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = 1;
      v27 = (id)objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("RSR_ANY_NETWORK_DOWNLOAD_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
      v26 = 1;
      v6 = v27;
    }
    else
    {
      v25 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = 1;
      v23 = (id)objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ANY_NETWORK_DOWNLOAD_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
      v22 = 1;
      v6 = v23;
    }
    v48 = v6;
    if ((v22 & 1) != 0)

    if ((v24 & 1) != 0)
    if ((v26 & 1) != 0)

    if ((v28 & 1) != 0)
    if ((v30 & 1) != 0)

    v32 = 1;
  }
  else
  {
    v32 = 0;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  if (!v32)
LABEL_34:
    v48 = 0;
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return v48;
}

- (id)localizedDescriptionForUnmetConstraintsError:(id)a3 statefulDescriptor:(id)a4 download:(id)a5
{
  float v5;
  float v6;
  float v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v54;
  float v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  char v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  char v90;
  id v91;
  char v92;
  id v93;
  char v94;
  id v95;
  char v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  char v106;
  id v107;
  char v108;
  id v109;
  char v110;
  id v111;
  char v112;
  id v113;
  char v114;
  id v115;
  char v116;
  id v117;
  char v118;
  id v119;
  char v120;
  id v121;
  char v122;
  id v123;
  char v124;
  id v125;
  char v126;
  id v127;
  char v128;
  id v129;
  char v130;
  id v131;
  char v132;
  id v133;
  char v134;
  id v135;
  char v136;
  id v137;
  char v138;
  id v139;
  char v140;
  id v141;
  char v142;
  id v143;
  char v144;
  id v145;
  char v146;
  id v147;
  char v148;
  id v149;
  char v150;
  id v151;
  char v152;
  id v153;
  char v154;
  id v155;
  char v156;
  id v157;
  char v158;
  id v159;
  char v160;
  id v161;
  char v162;
  id v163;
  char v164;
  id v165;
  char v166;
  id v167;
  char v168;
  id v169;
  char v170;
  id v171;
  char v172;
  id v173;
  char v174;
  id v175;
  char v176;
  id v177;
  char v178;
  id v179;
  char v180;
  id v181;
  char v182;
  id v183;
  char v184;
  id v185;
  char v186;
  id v187;
  char v188;
  id v189;
  char v190;
  id v191;
  char v192;
  id v193;
  char v194;
  id v195;
  char v196;
  id v197;
  char v198;
  id v199;
  char v200;
  id v201;
  char v202;
  id v203;
  char v204;
  id v205;
  char v206;
  id v207;
  char v208;
  id v209;
  char v210;
  id v211;
  char v212;
  char v213;
  id v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  int v219;
  char v220;
  id v221;
  char v222;
  id v223;
  char v224;
  id v225;
  char v226;
  id v227;
  char v228;
  id v229;
  char v230;
  id v231;
  char v232;
  id v233;
  uint64_t v234;
  id v235;
  float v236;
  id v237;
  id v238;
  id location[3];
  id v240;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v238 = 0;
  objc_storeStrong(&v238, a4);
  v237 = 0;
  objc_storeStrong(&v237, a5);
  v54 = (id)objc_msgSend(v238, "descriptor");
  SURequiredBatteryLevelForInstallation();
  v55 = v5;

  v6 = 100.0 * v55;
  v7 = floorf(v6) / 100.0;
  v236 = v7;
  v56 = (void *)MEMORY[0x24BDD1490];
  v57 = (id)objc_msgSend(v238, "descriptor");
  v235 = (id)objc_msgSend(v56, "stringFromByteCount:countStyle:", objc_msgSend(v57, "installationSize"), 2);

  v60 = (id)objc_msgSend(location[0], "userInfo");
  v59 = getkSUInstallationConstraintsUnmetKey_2();
  v58 = (id)objc_msgSend(v60, "objectForKey:");
  v61 = objc_msgSend(v58, "unsignedIntegerValue");

  v234 = v61;
  if ((v61 & 8) != 0)
  {
    v51 = (id)objc_msgSend(v238, "descriptor");
    v232 = 0;
    v230 = 0;
    v228 = 0;
    v226 = 0;
    v224 = 0;
    v222 = 0;
    v220 = 0;
    if (v51
      && (v233 = (id)objc_msgSend(v238, "descriptor"),
          v232 = 1,
          (objc_msgSend(v233, "isSplatOnly") & 1) != 0))
    {
      v231 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v230 = 1;
      v229 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("RSR_INSTALL_DELAYED_OTA_RESTORE"));
      v228 = 1;
      v227 = (id)objc_msgSend(v231, "localizedStringForKey:value:table:");
      v226 = 1;
      v9 = v227;
    }
    else
    {
      v225 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v224 = 1;
      v223 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("INSTALL_DELAYED_OTA_RESTORE"));
      v222 = 1;
      v221 = (id)objc_msgSend(v225, "localizedStringForKey:value:table:");
      v220 = 1;
      v9 = v221;
    }
    v240 = v9;
    if ((v220 & 1) != 0)

    if ((v222 & 1) != 0)
    if ((v224 & 1) != 0)

    if ((v226 & 1) != 0)
    if ((v228 & 1) != 0)

    if ((v230 & 1) != 0)
    if ((v232 & 1) != 0)

    v219 = 1;
  }
  else
  {
    v218 = 7;
    v217 = 3;
    v216 = 5;
    v215 = 6;
    v49 = (void *)MEMORY[0x24BDD16F0];
    *(float *)&v8 = v236;
    v50 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v214 = (id)objc_msgSend(v49, "localizedStringFromNumber:numberStyle:");

    v213 = 0;
    v212 = SUPrefsconnectedToCharger_0((uint64_t)&v213) & 1;
    if ((v234 & v218) == v218)
    {
      v47 = (void *)MEMORY[0x24BDD17C8];
      v48 = (id)objc_msgSend(v238, "descriptor");
      v210 = 0;
      v208 = 0;
      v206 = 0;
      v204 = 0;
      v202 = 0;
      if (v48
        && (v211 = (id)objc_msgSend(v238, "descriptor"),
            v210 = 1,
            (objc_msgSend(v211, "isSplatOnly") & 1) != 0))
      {
        v209 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v208 = 1;
        v207 = (id)objc_msgSend(v209, "localizedStringForKey:value:table:", CFSTR("RSR_BATTERY_STORAGE_AND_NETWORK_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v206 = 1;
        v46 = v207;
      }
      else
      {
        v205 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v204 = 1;
        v203 = (id)objc_msgSend(v205, "localizedStringForKey:value:table:", CFSTR("BATTERY_STORAGE_AND_NETWORK_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v202 = 1;
        v46 = v203;
      }
      v240 = (id)objc_msgSend(v47, "stringWithFormat:", v46, v214, v235);
      if ((v202 & 1) != 0)

      if ((v204 & 1) != 0)
      if ((v206 & 1) != 0)

      if ((v208 & 1) != 0)
      if ((v210 & 1) != 0)

      v219 = 1;
    }
    else if ((v234 & v215) == v215)
    {
      v44 = (void *)MEMORY[0x24BDD17C8];
      v45 = (id)objc_msgSend(v238, "descriptor");
      v200 = 0;
      v198 = 0;
      v196 = 0;
      v194 = 0;
      v192 = 0;
      if (v45
        && (v201 = (id)objc_msgSend(v238, "descriptor"),
            v200 = 1,
            (objc_msgSend(v201, "isSplatOnly") & 1) != 0))
      {
        v199 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v198 = 1;
        v197 = (id)objc_msgSend(v199, "localizedStringForKey:value:table:", CFSTR("RSR_STORAGE_AND_NETWORK_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v196 = 1;
        v43 = v197;
      }
      else
      {
        v195 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v194 = 1;
        v193 = (id)objc_msgSend(v195, "localizedStringForKey:value:table:", CFSTR("STORAGE_AND_NETWORK_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v192 = 1;
        v43 = v193;
      }
      v240 = (id)objc_msgSend(v44, "stringWithFormat:", v43, v235);
      if ((v192 & 1) != 0)

      if ((v194 & 1) != 0)
      if ((v196 & 1) != 0)

      if ((v198 & 1) != 0)
      if ((v200 & 1) != 0)

      v219 = 1;
    }
    else if ((v234 & v217) == v217)
    {
      v41 = (void *)MEMORY[0x24BDD17C8];
      v42 = (id)objc_msgSend(v238, "descriptor");
      v190 = 0;
      v188 = 0;
      v186 = 0;
      v184 = 0;
      v182 = 0;
      if (v42
        && (v191 = (id)objc_msgSend(v238, "descriptor"),
            v190 = 1,
            (objc_msgSend(v191, "isSplatOnly") & 1) != 0))
      {
        v189 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v188 = 1;
        v187 = (id)objc_msgSend(v189, "localizedStringForKey:value:table:", CFSTR("RSR_BATTERY_AND_NETWORK_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v186 = 1;
        v40 = v187;
      }
      else
      {
        v185 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v184 = 1;
        v183 = (id)objc_msgSend(v185, "localizedStringForKey:value:table:", CFSTR("BATTERY_AND_NETWORK_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v182 = 1;
        v40 = v183;
      }
      v240 = (id)objc_msgSend(v41, "stringWithFormat:", v40, v214);
      if ((v182 & 1) != 0)

      if ((v184 & 1) != 0)
      if ((v186 & 1) != 0)

      if ((v188 & 1) != 0)
      if ((v190 & 1) != 0)

      v219 = 1;
    }
    else if ((v234 & v216) == v216)
    {
      v38 = (void *)MEMORY[0x24BDD17C8];
      v39 = (id)objc_msgSend(v238, "descriptor");
      v180 = 0;
      v178 = 0;
      v176 = 0;
      v174 = 0;
      v172 = 0;
      if (v39
        && (v181 = (id)objc_msgSend(v238, "descriptor"),
            v180 = 1,
            (objc_msgSend(v181, "isSplatOnly") & 1) != 0))
      {
        v179 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v178 = 1;
        v177 = (id)objc_msgSend(v179, "localizedStringForKey:value:table:", CFSTR("RSR_BATTERY_AND_STORAGE_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v176 = 1;
        v37 = v177;
      }
      else
      {
        v175 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v174 = 1;
        v173 = (id)objc_msgSend(v175, "localizedStringForKey:value:table:", CFSTR("BATTERY_AND_STORAGE_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v172 = 1;
        v37 = v173;
      }
      v240 = (id)objc_msgSend(v38, "stringWithFormat:", v37, v214, v235);
      if ((v172 & 1) != 0)

      if ((v174 & 1) != 0)
      if ((v176 & 1) != 0)

      if ((v178 & 1) != 0)
      if ((v180 & 1) != 0)

      v219 = 1;
    }
    else if ((v234 & 1) == 0 || (v212 & 1) != 0)
    {
      if ((v234 & 1) != 0 && (v212 & 1) != 0 && (v213 & 1) == 0)
      {
        v32 = (void *)MEMORY[0x24BDD17C8];
        v33 = (id)objc_msgSend(v238, "descriptor");
        v160 = 0;
        v158 = 0;
        v156 = 0;
        v154 = 0;
        v152 = 0;
        if (v33
          && (v161 = (id)objc_msgSend(v238, "descriptor"),
              v160 = 1,
              (objc_msgSend(v161, "isSplatOnly") & 1) != 0))
        {
          v159 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v158 = 1;
          v157 = (id)objc_msgSend(v159, "localizedStringForKey:value:table:", CFSTR("RSR_BATTERY_WIRED_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v156 = 1;
          v31 = v157;
        }
        else
        {
          v155 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v154 = 1;
          v153 = (id)objc_msgSend(v155, "localizedStringForKey:value:table:", CFSTR("BATTERY_WIRED_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v152 = 1;
          v31 = v153;
        }
        v240 = (id)objc_msgSend(v32, "stringWithFormat:", v31, v214);
        if ((v152 & 1) != 0)

        if ((v154 & 1) != 0)
        if ((v156 & 1) != 0)

        if ((v158 & 1) != 0)
        if ((v160 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 1) != 0 && (v212 & 1) != 0 && (v213 & 1) != 0)
      {
        v29 = (void *)MEMORY[0x24BDD17C8];
        v30 = (id)objc_msgSend(v238, "descriptor");
        v150 = 0;
        v148 = 0;
        v146 = 0;
        v144 = 0;
        v142 = 0;
        if (v30
          && (v151 = (id)objc_msgSend(v238, "descriptor"),
              v150 = 1,
              (objc_msgSend(v151, "isSplatOnly") & 1) != 0))
        {
          v149 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v148 = 1;
          v147 = (id)objc_msgSend(v149, "localizedStringForKey:value:table:", CFSTR("RSR_BATTERY_WIRELESS_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v146 = 1;
          v28 = v147;
        }
        else
        {
          v145 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v144 = 1;
          v143 = (id)objc_msgSend(v145, "localizedStringForKey:value:table:", CFSTR("BATTERY_WIRELESS_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v142 = 1;
          v28 = v143;
        }
        v240 = (id)objc_msgSend(v29, "stringWithFormat:", v28, v214);
        if ((v142 & 1) != 0)

        if ((v144 & 1) != 0)
        if ((v146 & 1) != 0)

        if ((v148 & 1) != 0)
        if ((v150 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 4) != 0)
      {
        v26 = (void *)MEMORY[0x24BDD17C8];
        v27 = (id)objc_msgSend(v238, "descriptor");
        v140 = 0;
        v138 = 0;
        v136 = 0;
        v134 = 0;
        v132 = 0;
        if (v27
          && (v141 = (id)objc_msgSend(v238, "descriptor"),
              v140 = 1,
              (objc_msgSend(v141, "isSplatOnly") & 1) != 0))
        {
          v139 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v138 = 1;
          v137 = (id)objc_msgSend(v139, "localizedStringForKey:value:table:", CFSTR("RSR_STORAGE_DOWNLOAD_ERROR_%@"), &stru_24E0011F0, CFSTR("Software Update"));
          v136 = 1;
          v25 = v137;
        }
        else
        {
          v135 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v134 = 1;
          v133 = (id)objc_msgSend(v135, "localizedStringForKey:value:table:", CFSTR("STORAGE_DOWNLOAD_ERROR_%@"), &stru_24E0011F0, CFSTR("Software Update"));
          v132 = 1;
          v25 = v133;
        }
        v240 = (id)objc_msgSend(v26, "stringWithFormat:", v25, v235);
        if ((v132 & 1) != 0)

        if ((v134 & 1) != 0)
        if ((v136 & 1) != 0)

        if ((v138 & 1) != 0)
        if ((v140 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 2) != 0)
      {
        v24 = (id)objc_msgSend(v238, "descriptor");
        v130 = 0;
        v128 = 0;
        v126 = 0;
        v124 = 0;
        v122 = 0;
        if (v24
          && (v131 = (id)objc_msgSend(v238, "descriptor"),
              v130 = 1,
              (objc_msgSend(v131, "isSplatOnly") & 1) != 0))
        {
          v129 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v128 = 1;
          v127 = (id)objc_msgSend(v129, "localizedStringForKey:value:table:", CFSTR("RSR_NETWORK_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v126 = 1;
          v10 = v127;
        }
        else
        {
          v125 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v124 = 1;
          v123 = (id)objc_msgSend(v125, "localizedStringForKey:value:table:", CFSTR("NETWORK_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v122 = 1;
          v10 = v123;
        }
        v240 = v10;
        if ((v122 & 1) != 0)

        if ((v124 & 1) != 0)
        if ((v126 & 1) != 0)

        if ((v128 & 1) != 0)
        if ((v130 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 0x80) != 0)
      {
        v23 = (id)objc_msgSend(v238, "descriptor");
        v120 = 0;
        v118 = 0;
        v116 = 0;
        v114 = 0;
        v112 = 0;
        if (v23
          && (v121 = (id)objc_msgSend(v238, "descriptor"),
              v120 = 1,
              (objc_msgSend(v121, "isSplatOnly") & 1) != 0))
        {
          v119 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v118 = 1;
          v117 = (id)objc_msgSend(v119, "localizedStringForKey:value:table:", CFSTR("RSR_SYNCING_DATA_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v116 = 1;
          v11 = v117;
        }
        else
        {
          v115 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v114 = 1;
          v113 = (id)objc_msgSend(v115, "localizedStringForKey:value:table:", CFSTR("SYNCING_DATA_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v112 = 1;
          v11 = v113;
        }
        v240 = v11;
        if ((v112 & 1) != 0)

        if ((v114 & 1) != 0)
        if ((v116 & 1) != 0)

        if ((v118 & 1) != 0)
        if ((v120 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 0x100) != 0)
      {
        v22 = (id)objc_msgSend(v238, "descriptor");
        v110 = 0;
        v108 = 0;
        v106 = 0;
        v104 = 0;
        v102 = 0;
        if (v22
          && (v111 = (id)objc_msgSend(v238, "descriptor"),
              v110 = 1,
              (objc_msgSend(v111, "isSplatOnly") & 1) != 0))
        {
          v109 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v108 = 1;
          v107 = (id)objc_msgSend(v109, "localizedStringForKey:value:table:", CFSTR("RSR_PHONE_CALL_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v106 = 1;
          v12 = v107;
        }
        else
        {
          v105 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v104 = 1;
          v103 = (id)objc_msgSend(v105, "localizedStringForKey:value:table:", CFSTR("PHONE_CALL_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v102 = 1;
          v12 = v103;
        }
        v240 = v12;
        if ((v102 & 1) != 0)

        if ((v104 & 1) != 0)
        if ((v106 & 1) != 0)

        if ((v108 & 1) != 0)
        if ((v110 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 0x40) != 0)
      {
        v21 = (id)objc_msgSend(v238, "descriptor");
        v100 = 0;
        v98 = 0;
        v96 = 0;
        v94 = 0;
        v92 = 0;
        if (v21
          && (v101 = (id)objc_msgSend(v238, "descriptor"),
              v100 = 1,
              (objc_msgSend(v101, "isSplatOnly") & 1) != 0))
        {
          v99 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v98 = 1;
          v97 = (id)objc_msgSend(v99, "localizedStringForKey:value:table:", CFSTR("RSR_RESTORING_FROM_BACKUP_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v96 = 1;
          v13 = v97;
        }
        else
        {
          v95 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v94 = 1;
          v93 = (id)objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("RESTORING_FROM_BACKUP_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v92 = 1;
          v13 = v93;
        }
        v240 = v13;
        if ((v92 & 1) != 0)

        if ((v94 & 1) != 0)
        if ((v96 & 1) != 0)

        if ((v98 & 1) != 0)
        if ((v100 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 0x200) != 0)
      {
        v20 = (id)objc_msgSend(v238, "descriptor");
        v90 = 0;
        v88 = 0;
        v86 = 0;
        v84 = 0;
        v82 = 0;
        if (v20
          && (v91 = (id)objc_msgSend(v238, "descriptor"),
              v90 = 1,
              (objc_msgSend(v91, "isSplatOnly") & 1) != 0))
        {
          v89 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v88 = 1;
          v87 = (id)objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("RSR_CARPLAY_CONNECTED_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v86 = 1;
          v14 = v87;
        }
        else
        {
          v85 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v84 = 1;
          v83 = (id)objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("CARPLAY_CONNECTED_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v82 = 1;
          v14 = v83;
        }
        v240 = v14;
        if ((v82 & 1) != 0)

        if ((v84 & 1) != 0)
        if ((v86 & 1) != 0)

        if ((v88 & 1) != 0)
        if ((v90 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 0x400) != 0)
      {
        v19 = (id)objc_msgSend(v238, "descriptor");
        v80 = 0;
        v78 = 0;
        v76 = 0;
        v74 = 0;
        v72 = 0;
        if (v19
          && (v81 = (id)objc_msgSend(v238, "descriptor"),
              v80 = 1,
              (objc_msgSend(v81, "isSplatOnly") & 1) != 0))
        {
          v79 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v78 = 1;
          v77 = (id)objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("RSR_MEDIA_PLAYING_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v76 = 1;
          v15 = v77;
        }
        else
        {
          v75 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v74 = 1;
          v73 = (id)objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("MEDIA_PLAYING_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v72 = 1;
          v15 = v73;
        }
        v240 = v15;
        if ((v72 & 1) != 0)

        if ((v74 & 1) != 0)
        if ((v76 & 1) != 0)

        if ((v78 & 1) != 0)
        if ((v80 & 1) != 0)

        v219 = 1;
      }
      else if ((v234 & 0x800) != 0)
      {
        v18 = (id)objc_msgSend(v238, "descriptor");
        v70 = 0;
        v68 = 0;
        v66 = 0;
        v64 = 0;
        v62 = 0;
        if (v18
          && (v71 = (id)objc_msgSend(v238, "descriptor"),
              v70 = 1,
              (objc_msgSend(v71, "isSplatOnly") & 1) != 0))
        {
          v69 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v68 = 1;
          v67 = (id)objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("RSR_DRIVING_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v66 = 1;
          v16 = v67;
        }
        else
        {
          v65 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v64 = 1;
          v63 = (id)objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("DRIVING_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
          v62 = 1;
          v16 = v63;
        }
        v240 = v16;
        if ((v62 & 1) != 0)

        if ((v64 & 1) != 0)
        if ((v66 & 1) != 0)

        if ((v68 & 1) != 0)
        if ((v70 & 1) != 0)

        v219 = 1;
      }
      else
      {
        v240 = 0;
        v219 = 1;
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x24BDD17C8];
      v36 = (id)objc_msgSend(v238, "descriptor");
      v170 = 0;
      v168 = 0;
      v166 = 0;
      v164 = 0;
      v162 = 0;
      if (v36
        && (v171 = (id)objc_msgSend(v238, "descriptor"),
            v170 = 1,
            (objc_msgSend(v171, "isSplatOnly") & 1) != 0))
      {
        v169 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v168 = 1;
        v167 = (id)objc_msgSend(v169, "localizedStringForKey:value:table:", CFSTR("RSR_BATTERY_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v166 = 1;
        v34 = v167;
      }
      else
      {
        v165 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v164 = 1;
        v163 = (id)objc_msgSend(v165, "localizedStringForKey:value:table:", CFSTR("BATTERY_INSTALL_ERROR"), &stru_24E0011F0, CFSTR("Software Update"));
        v162 = 1;
        v34 = v163;
      }
      v240 = (id)objc_msgSend(v35, "stringWithFormat:", v34, v214);
      if ((v162 & 1) != 0)

      if ((v164 & 1) != 0)
      if ((v166 & 1) != 0)

      if ((v168 & 1) != 0)
      if ((v170 & 1) != 0)

      v219 = 1;
    }
    objc_storeStrong(&v214, 0);
  }
  objc_storeStrong(&v235, 0);
  objc_storeStrong(&v237, 0);
  objc_storeStrong(&v238, 0);
  objc_storeStrong(location, 0);
  return v240;
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
}

@end
