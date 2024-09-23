@implementation SSKDisplayAssertionCoordinatorPolicy

- (SSKDisplayAssertionCoordinatorPolicy)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinatorPolicy.m"), 32, CFSTR("i don't think so tim"));

  return 0;
}

- (SSKDisplayAssertionCoordinatorPolicy)initWithDisplayMonitor:(id)a3
{
  id v5;
  SSKDisplayAssertionCoordinatorPolicy *v6;
  SSKDisplayAssertionCoordinatorPolicy *v7;
  uint64_t v8;
  NSMutableDictionary *rootIdentityToDisplayArrangementItems;
  uint64_t v10;
  NSMutableDictionary *rootIdentityToCloneMirroringMode;
  uint64_t v12;
  NSMutableDictionary *rootIdentityToCloneMirroringModeTokens;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSKDisplayAssertionCoordinatorPolicy;
  v6 = -[SSKDisplayAssertionCoordinatorPolicy init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayMonitor, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    rootIdentityToDisplayArrangementItems = v7->_rootIdentityToDisplayArrangementItems;
    v7->_rootIdentityToDisplayArrangementItems = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    rootIdentityToCloneMirroringMode = v7->_rootIdentityToCloneMirroringMode;
    v7->_rootIdentityToCloneMirroringMode = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    rootIdentityToCloneMirroringModeTokens = v7->_rootIdentityToCloneMirroringModeTokens;
    v7->_rootIdentityToCloneMirroringModeTokens = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (void)assertionCoordinator:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5 forDisplay:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  v9 = a4;
  SSKLogDisplayControlling();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    _SSKLoggingMethodProem(self, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_245FEA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ assertion preferences changed. reevaluating", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(v9, "displayArrangement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSKDisplayAssertionCoordinatorPolicy _setDisplayArrangementItem:forDisplay:](self, "_setDisplayArrangementItem:forDisplay:", v12, v8);

  v13 = objc_msgSend(v9, "cloneMirroringMode");
  -[SSKDisplayAssertionCoordinatorPolicy _setCloneMirroringMode:forDisplay:](self, "_setCloneMirroringMode:forDisplay:", v13, v8);

  SSKLogDisplayControlling();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    _SSKLoggingMethodProem(self, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v15;
    _os_log_impl(&dword_245FEA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ assertion preferences changed. done reevaluating", (uint8_t *)&v16, 0xCu);

  }
}

- (void)_setDisplayArrangementItem:(id)a3 forDisplay:(id)a4
{
  unint64_t v6;
  id v7;
  uint64_t v8;
  NSMutableDictionary *rootIdentityToDisplayArrangementItems;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SSKDisplayMonitor *displayMonitor;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  id v30;
  NSMutableDictionary *obj;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_rootIdentityToDisplayArrangementItems, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v8, "isEqual:", v6) & 1) == 0 && v6 | v8)
  {
    rootIdentityToDisplayArrangementItems = self->_rootIdentityToDisplayArrangementItems;
    v30 = v7;
    if (v6)
      -[NSMutableDictionary setObject:forKey:](rootIdentityToDisplayArrangementItems, "setObject:forKey:", v6, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](rootIdentityToDisplayArrangementItems, "removeObjectForKey:", v7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_rootIdentityToDisplayArrangementItems, "count", v8));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = self->_rootIdentityToDisplayArrangementItems;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    if (v10)
    {
      v11 = v10;
      v33 = *(_QWORD *)v35;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v35 != v33)
            objc_enumerationMutation(obj);
          -[SSKDisplayMonitor configurationForIdentity:](self->_displayMonitor, "configurationForIdentity:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "hardwareIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          displayMonitor = self->_displayMonitor;
          objc_msgSend((id)v6, "relativeDisplayIdentity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSKDisplayMonitor configurationForIdentity:](displayMonitor, "configurationForIdentity:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "hardwareIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v19 = objc_alloc(MEMORY[0x24BE0B668]);
            v20 = objc_msgSend((id)v6, "edge");
            objc_msgSend((id)v6, "offset");
            v21 = objc_msgSend(v19, "initWithDisplayUUID:relativeToDisplayUUID:alongEdge:atOffset:", v14, v18, v20);
            objc_msgSend(v32, "addObject:", v21);
          }
          else
          {
            SSKLogDisplayControlling();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              _SSKLoggingMethodProem(self, 0);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v39 = v22;
              v40 = 2114;
              v41 = v13;
              v42 = 2114;
              v43 = 0;
              v44 = 2114;
              v45 = v17;
              v46 = 2114;
              v47 = v18;
              _os_log_fault_impl(&dword_245FEA000, v21, OS_LOG_TYPE_FAULT, "%{public}@ got nil displayUUIDs, which shouldn't be happening for newly active assertions. rootDisplayConfig: %{public}@; rootDisplayUUID: %{public}@; relativeDisplayConfig: %{public}@; relativeDisplayUUID: %{public}@",
                buf,
                0x34u);

            }
          }

          ++v12;
        }
        while (v11 != v12);
        v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      }
      while (v11);
    }

    SSKLogDisplayControlling();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      v7 = v30;
      if (v24)
      {
        _SSKLoggingMethodProem(self, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v39 = v25;
        v40 = 2114;
        v41 = v30;
        v42 = 2114;
        v43 = v6;
        v44 = 2114;
        v45 = v32;
        v26 = "%{public}@ %{public}@ display arrangement item changed: %{public}@\n"
              "updating backboard with global arrangement: %{public}@";
        v27 = v23;
        v28 = 42;
LABEL_22:
        _os_log_impl(&dword_245FEA000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);

      }
    }
    else
    {
      v7 = v30;
      if (v24)
      {
        _SSKLoggingMethodProem(self, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v25;
        v40 = 2114;
        v41 = v30;
        v42 = 2114;
        v43 = (unint64_t)v32;
              "updating backboard with global arrangement: %{public}@";
        v27 = v23;
        v28 = 32;
        goto LABEL_22;
      }
    }

    BKSDisplayServicesSetArrangement();
    v8 = v29;
  }

}

- (void)_setCloneMirroringMode:(unint64_t)a3 forDisplay:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *rootIdentityToCloneMirroringMode;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if ((objc_msgSend(v7, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinatorPolicy.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_rootIdentityToCloneMirroringMode, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!a3)
  {
    SSKLogDisplayControlling();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      _SSKLoggingMethodProem(self, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SSKDisplayCloneMirroringModeDescription(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2114;
      v32 = v14;

    }
    -[NSMutableDictionary objectForKey:](self->_rootIdentityToCloneMirroringModeTokens, "objectForKey:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidate](v15, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_rootIdentityToCloneMirroringMode, "removeObjectForKey:", v7);
    goto LABEL_18;
  }
  if (v9 != a3)
  {
    rootIdentityToCloneMirroringMode = self->_rootIdentityToCloneMirroringMode;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](rootIdentityToCloneMirroringMode, "setObject:forKey:", v11, v7);

    if (a3 != 1 && a3 != 2)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinatorPolicy.m"), 112, CFSTR("unexpected mirroring mode: %lu"), a3);

    }
    if ((objc_msgSend(v7, "isMainDisplay") & 1) != 0)
    {
      SSKLogDisplayControlling();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        _SSKLoggingMethodProem(self, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        SSKDisplayCloneMirroringModeDescription(v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        SSKDisplayCloneMirroringModeDescription(a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v17;
        v31 = 2114;
        v32 = v18;
        v33 = 2114;
        v34 = v19;

      }
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_rootIdentityToCloneMirroringModeTokens, "objectForKey:", v7);
      v15 = objc_claimAutoreleasedReturnValue();
      -[SSKDisplayMonitor configurationForIdentity:](self->_displayMonitor, "configurationForIdentity:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hardwareIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      SSKLogDisplayControlling();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        _SSKLoggingMethodProem(self, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        SSKDisplayCloneMirroringModeDescription(v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        SSKDisplayCloneMirroringModeDescription(a3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBKSDisplayServicesCloneMirroringMode();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v23;
        v31 = 2114;
        v32 = v24;
        v33 = 2114;
        v34 = v25;
        v35 = 2114;
        v36 = v26;

      }
      -[NSMutableDictionary setObject:forKey:](self->_rootIdentityToCloneMirroringModeTokens, "setObject:forKey:", v21, v7);
      -[NSObject invalidate](v15, "invalidate");

    }
LABEL_18:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIdentityToCloneMirroringModeTokens, 0);
  objc_storeStrong((id *)&self->_rootIdentityToCloneMirroringMode, 0);
  objc_storeStrong((id *)&self->_rootIdentityToDisplayArrangementItems, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
}

@end
