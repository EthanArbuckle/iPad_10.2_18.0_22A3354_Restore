@implementation VGExternalAccessoryModelFilter

- (void)_initializeAllowAndDenylists
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  NSArray *v17;
  NSArray *modelIdAllowlist;
  VGDenylistEntry *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  VGDenylistEntry *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  char v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char v40;
  NSObject *v41;
  char v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char v46;
  char v47;
  VGDenylistEntry *v48;
  NSObject *p_super;
  os_log_type_t v50;
  const char *v51;
  NSObject *v52;
  NSObject *v53;
  NSArray *v54;
  NSArray *denylist;
  NSObject *v56;
  void *v57;
  VGExternalAccessoryModelFilter *v58;
  VGExternalAccessoryModelFilter *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  id obj;
  VGDenylistEntry *v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 buf;
  id (*v73)(uint64_t, void *, uint64_t, void *, _BYTE *);
  void *v74;
  NSObject *v75;
  uint8_t v76[4];
  VGDenylistEntry *v77;
  int v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  VGAllowlistPayload();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    GEOConfigGetString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0x24BDBC000uLL;
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v58 = self;
      v60 = v4;
      v9 = objc_opt_new();
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, &v78, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v69 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[NSObject addObject:](v9, "addObject:", v15);
            }
            else
            {
              VGGetExternalAccessoryModelFilterLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v5;
                _os_log_impl(&dword_20A329000, v16, OS_LOG_TYPE_FAULT, "Encountered a non-number in payload: %@", (uint8_t *)&buf, 0xCu);
              }

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, &v78, 16);
        }
        while (v12);
      }

      v17 = -[NSObject copy](v9, "copy");
      self = v58;
      v4 = v60;
      v8 = 0x24BDBC000;
    }
    else
    {
      VGGetExternalAccessoryModelFilterLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v78 = 138412290;
        v79 = v7;
        _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_FAULT, "Parsing of allowlist failed. allowlistedModelIds were in an unexpected format: %@", (uint8_t *)&v78, 0xCu);
      }
      v17 = 0;
    }

    modelIdAllowlist = self->_modelIdAllowlist;
    self->_modelIdAllowlist = v17;

    v19 = (VGDenylistEntry *)v5;
    GEOConfigGetString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v19;
    -[VGDenylistEntry objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = self;
        v61 = v4;
        v62 = objc_opt_new();
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v57 = v21;
        obj = v21;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, &v78, 16);
        if (!v22)
          goto LABEL_63;
        v23 = v22;
        v24 = *(_QWORD *)v69;
        v63 = *(_QWORD *)v69;
        while (1)
        {
          v25 = 0;
          v64 = v23;
          do
          {
            if (*(_QWORD *)v69 != v24)
              objc_enumerationMutation(obj);
            v26 = *(VGDenylistEntry **)(*((_QWORD *)&v68 + 1) + 8 * v25);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(_QWORD *)&buf = MEMORY[0x24BDAC760];
              *((_QWORD *)&buf + 1) = 3221225472;
              v73 = __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_28;
              v74 = &unk_24C2FB738;
              v75 = v66;
              v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x20BD239CC](&buf);
              v28 = 1;
              v67 = 1;
              GEOConfigGetString();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_opt_class();
              ((void (**)(_QWORD, void *, uint64_t, VGDenylistEntry *, char *))v27)[2](v27, v29, v30, v26, &v67);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              GEOConfigGetString();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v8;
              v34 = objc_opt_class();
              ((void (**)(_QWORD, void *, uint64_t, VGDenylistEntry *, char *))v27)[2](v27, v32, v34, v26, &v67);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
                v28 = __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_30(v35);
              if (v67)
                v36 = v28;
              else
                v36 = 0;
              v67 = v36;
              GEOConfigGetString();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_opt_class();
              ((void (**)(_QWORD, void *, uint64_t, VGDenylistEntry *, char *))v27)[2](v27, v37, v38, v26, &v67);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
                v40 = __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_30(v39);
              else
                v40 = 1;
              if (v67)
                v42 = v40;
              else
                v42 = 0;
              v67 = v42;
              GEOConfigGetString();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_opt_class();
              ((void (**)(_QWORD, void *, uint64_t, VGDenylistEntry *, char *))v27)[2](v27, v43, v44, v26, &v67);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              if (v45)
                v46 = __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_30(v45);
              else
                v46 = 1;
              if (v67)
                v47 = v46;
              else
                v47 = 0;
              v67 = v47;
              if ((v47 & 1) != 0)
              {
                if (v31 || v35 || v39 || v45)
                {
                  v48 = -[VGDenylistEntry initWithModelId:firmwareIds:years:models:]([VGDenylistEntry alloc], "initWithModelId:firmwareIds:years:models:", v31, v35, v39, v45);
                  VGGetExternalAccessoryModelFilterLog();
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v76 = 138412290;
                    v77 = v48;
                    _os_log_impl(&dword_20A329000, v52, OS_LOG_TYPE_INFO, "Adding new entry to iAP2 denylist: %@", v76, 0xCu);
                  }

                  -[NSObject addObject:](v62, "addObject:", v48);
                }
                else
                {
                  VGGetExternalAccessoryModelFilterLog();
                  v48 = (VGDenylistEntry *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(&v48->super, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v76 = 138412290;
                    v77 = v26;
                    p_super = &v48->super;
                    v50 = OS_LOG_TYPE_FAULT;
                    v51 = "Encountered a configuration without any parameters: %@. Will skip it.";
                    goto LABEL_56;
                  }
                }
              }
              else
              {
                VGGetExternalAccessoryModelFilterLog();
                v48 = (VGDenylistEntry *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v48->super, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v76 = 138412290;
                  v77 = v26;
                  p_super = &v48->super;
                  v50 = OS_LOG_TYPE_ERROR;
                  v51 = "Encountered malformed configuration: %@. Will skip it.";
LABEL_56:
                  _os_log_impl(&dword_20A329000, p_super, v50, v51, v76, 0xCu);
                }
              }

              v41 = v75;
              v8 = v33;
              v24 = v63;
              v23 = v64;
              goto LABEL_61;
            }
            VGGetExternalAccessoryModelFilterLog();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v76 = 138412290;
              v77 = v66;
              _os_log_impl(&dword_20A329000, v41, OS_LOG_TYPE_FAULT, "Encountered a non-dictionary in payload: %@", v76, 0xCu);
            }
LABEL_61:

            ++v25;
          }
          while (v23 != v25);
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, &v78, 16);
          if (!v23)
          {
LABEL_63:

            v53 = v62;
            v54 = -[NSObject copy](v62, "copy");
            self = v59;
            v4 = v61;
            v21 = v57;
            goto LABEL_67;
          }
        }
      }
    }
    VGGetExternalAccessoryModelFilterLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      v78 = 138412290;
      v79 = v21;
      _os_log_impl(&dword_20A329000, v53, OS_LOG_TYPE_FAULT, "Parsing of denylist failed. denylistedConfigurations were in an unexpected format: %@", (uint8_t *)&v78, 0xCu);
    }
    v54 = 0;
LABEL_67:

    denylist = self->_denylist;
    self->_denylist = v54;

  }
  else
  {
    VGGetExternalAccessoryModelFilterLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v78) = 0;
      _os_log_impl(&dword_20A329000, v56, OS_LOG_TYPE_ERROR, "Parsing of allowlist failed. Payload was nil.", (uint8_t *)&v78, 2u);
    }

  }
}

- (VGExternalAccessoryModelFilter)init
{
  VGExternalAccessoryModelFilter *v2;
  VGExternalAccessoryModelFilter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VGExternalAccessoryModelFilter;
  v2 = -[VGExternalAccessoryModelFilter init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VGExternalAccessoryModelFilter _initializeAllowAndDenylists](v2, "_initializeAllowAndDenylists");
  return v3;
}

- (NSArray)modelIdAllowlist
{
  NSArray *modelIdAllowlist;

  modelIdAllowlist = self->_modelIdAllowlist;
  if (!modelIdAllowlist)
  {
    -[VGExternalAccessoryModelFilter _initializeAllowAndDenylists](self, "_initializeAllowAndDenylists");
    modelIdAllowlist = self->_modelIdAllowlist;
  }
  return modelIdAllowlist;
}

- (NSArray)denylist
{
  NSArray *denylist;

  denylist = self->_denylist;
  if (!denylist)
  {
    -[VGExternalAccessoryModelFilter _initializeAllowAndDenylists](self, "_initializeAllowAndDenylists");
    denylist = self->_denylist;
  }
  return denylist;
}

id __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_28(uint64_t a1, void *a2, uint64_t a3, void *a4, _BYTE *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        objc_msgSend(v9, "objectForKeyedSubscript:", v8),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v12,
        v11,
        (isKindOfClass & 1) == 0))
  {
    VGGetExternalAccessoryModelFilterLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_FAULT, "Encountered an invalid value under key: %@ in payload: %@", (uint8_t *)&v18, 0x16u);
    }

    v14 = 0;
    *a5 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

uint64_t __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_30(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
    v7 = 1;
LABEL_13:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)allowsVehicleWithModelId:(id)a3 firmwareId:(id)a4 year:(id)a5 model:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  VGDenylistEntry *v13;
  void *v14;
  NSArray *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  __CFString *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  VGDenylistEntry *v30;
  void *v31;
  BOOL v32;
  void *v33;
  NSArray *v34;
  NSArray *v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  __CFString *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v39 = a4;
  v40 = a5;
  v41 = a6;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  -[VGExternalAccessoryModelFilter modelIdAllowlist](self, "modelIdAllowlist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __81__VGExternalAccessoryModelFilter_allowsVehicleWithModelId_firmwareId_year_model___block_invoke;
  v45[3] = &unk_24C2FB760;
  v38 = v10;
  v46 = v38;
  v47 = &v48;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v45);

  if (*((_BYTE *)v49 + 24))
  {
    v13 = [VGDenylistEntry alloc];
    if (v39)
    {
      v58 = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDBD1A8];
    }
    if (v40)
    {
      v57 = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = (void *)MEMORY[0x24BDBD1A8];
    }
    if (v41)
    {
      v56 = v41;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = (void *)MEMORY[0x24BDBD1A8];
    }
    v30 = -[VGDenylistEntry initWithModelId:firmwareIds:years:models:](v13, "initWithModelId:firmwareIds:years:models:", v38, v14, v28, v29);
    if (v41)

    if (v40)
    if (v39)

    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    -[VGExternalAccessoryModelFilter denylist](self, "denylist");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v12;
    v42[1] = 3221225472;
    v42[2] = __81__VGExternalAccessoryModelFilter_allowsVehicleWithModelId_firmwareId_year_model___block_invoke_34;
    v42[3] = &unk_24C2FB788;
    v37 = v30;
    v43 = v37;
    v44 = &v63;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v42);

    v32 = *((_BYTE *)v64 + 24) == 0;
    _Block_object_dispose(&v63, 8);
  }
  else
  {
    VGGetExternalAccessoryModelFilterLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_modelIdAllowlist;
      v36 = v15;
      if (v15)
      {
        if (-[NSArray count](v15, "count"))
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v36, "count"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v17 = v36;
          v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v52, &v63, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v53;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v53 != v19)
                  objc_enumerationMutation(v17);
                v21 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * i);
                if (v21)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v21);
                  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v22 = CFSTR("<nil>");
                }

                objc_msgSend(v16, "addObject:", v22);
              }
              v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v52, &v63, 16);
            }
            while (v18);
          }

          -[NSArray componentsJoinedByString:](v17, "componentsJoinedByString:", CFSTR(", "));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BDD17C8];
          v25 = v17;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ [%@]"), v26, v23);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v33 = (void *)MEMORY[0x24BDD17C8];
          v34 = v36;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v34);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@ (empty)"), v16);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v27 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138412546;
      v60 = v38;
      v61 = 2112;
      v62 = v27;
      _os_log_impl(&dword_20A329000, v37, OS_LOG_TYPE_ERROR, "allowsVehicleWithModelId: denied modelId: %@ as it is not in the allowlist: %@", buf, 0x16u);

    }
    v32 = 0;
  }

  _Block_object_dispose(&v48, 8);
  return v32;
}

uint64_t __81__VGExternalAccessoryModelFilter_allowsVehicleWithModelId_firmwareId_year_model___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __81__VGExternalAccessoryModelFilter_allowsVehicleWithModelId_firmwareId_year_model___block_invoke_34(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (objc_msgSend(v6, "isSupersetOfEntry:", *(_QWORD *)(a1 + 32)))
  {
    VGGetExternalAccessoryModelFilterLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, "allowsVehicleWithModelId: denied entry: %@ as it matches entry from denylist: %@", (uint8_t *)&v9, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (void)setModelIdAllowlist:(id)a3
{
  objc_storeStrong((id *)&self->_modelIdAllowlist, a3);
}

- (void)setDenylist:(id)a3
{
  objc_storeStrong((id *)&self->_denylist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denylist, 0);
  objc_storeStrong((id *)&self->_modelIdAllowlist, 0);
}

@end
