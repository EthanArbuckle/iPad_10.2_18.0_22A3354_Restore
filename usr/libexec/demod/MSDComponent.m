@implementation MSDComponent

- (MSDComponent)initWithName:(id)a3 andOperations:(id)a4
{
  id v6;
  id v7;
  MSDComponent *v8;
  MSDComponent *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MSDComponent;
  v8 = -[MSDComponent init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDComponent setName:](v8, "setName:", v6);
    -[MSDComponent setRetryCount:](v9, "setRetryCount:", 3);
    -[MSDComponent setForRemoval:](v9, "setForRemoval:", 0);
    v10 = objc_alloc_init((Class)NSMutableOrderedSet);
    -[MSDComponent setRemoveOperations:](v9, "setRemoveOperations:", v10);

    v11 = objc_alloc_init((Class)NSMutableOrderedSet);
    -[MSDComponent setStagedOperations:](v9, "setStagedOperations:", v11);

    v12 = objc_alloc_init((Class)NSMutableOrderedSet);
    -[MSDComponent setActiveOperations:](v9, "setActiveOperations:", v12);

    v13 = objc_alloc_init((Class)NSMutableOrderedSet);
    -[MSDComponent setFinishedOperations:](v9, "setFinishedOperations:", v13);

    -[MSDComponent _addStagedOperations:forRollback:](v9, "_addStagedOperations:forRollback:", v7, 0);
    -[MSDComponent _estimateDiskSpaceRequirementFromOperations:](v9, "_estimateDiskSpaceRequirementFromOperations:", v7);
    -[MSDComponent setObserver:](v9, "setObserver:", 0);
    -[MSDComponent setComponentLock:](v9, "setComponentLock:", 0);
  }

  return v9;
}

- (BOOL)result
{
  os_unfair_lock_s *p_componentLock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "result") & 1) == 0 && !objc_msgSend(v9, "skipped"))
        {
          v10 = 0;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_12:

  os_unfair_lock_unlock(p_componentLock);
  return v10;
}

- (id)finishedOperationContexts
{
  id v3;
  os_unfair_lock_s *p_componentLock;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "context"));
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_componentLock);
  return v3;
}

- (id)errors
{
  id v3;
  os_unfair_lock_s *p_componentLock;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_componentLock);
  return v3;
}

- (void)addObserver:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MSDComponentObserver) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSDComponent.m"), 118, CFSTR("Observer does not conform to protocol"));

  }
  os_unfair_lock_lock(&self->_componentLock);
  -[MSDComponent setObserver:](self, "setObserver:", v5);

  os_unfair_lock_unlock(&self->_componentLock);
}

- (void)addRemoveOperations:(id)a3
{
  os_unfair_lock_s *p_componentLock;
  id v5;
  void *v6;

  p_componentLock = &self->_componentLock;
  v5 = a3;
  os_unfair_lock_lock(p_componentLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent removeOperations](self, "removeOperations"));
  objc_msgSend(v6, "addObjectsFromArray:", v5);

  os_unfair_lock_unlock(p_componentLock);
}

- (id)activateStagedOperations
{
  os_unfair_lock_s *p_componentLock;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  objc_msgSend(v7, "unionOrderedSet:", v5);

  os_unfair_lock_unlock(p_componentLock);
  return v5;
}

- (id)createRemovableCounterpartComponent
{
  os_unfair_lock_s *p_componentLock;
  void *v4;
  id v5;
  MSDComponent *v6;
  void *v7;
  void *v8;
  void *v9;
  MSDComponent *v10;

  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent removeOperations](self, "removeOperations"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = [MSDComponent alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent removeOperations](self, "removeOperations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "array"));
    v10 = -[MSDComponent initWithName:andOperations:](v6, "initWithName:andOperations:", v7, v9);

    -[MSDComponent setForRemoval:](v10, "setForRemoval:", 1);
  }
  else
  {
    v10 = 0;
  }
  os_unfair_lock_unlock(p_componentLock);
  return v10;
}

- (id)setupIntraComponentDependency:(BOOL)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  os_unfair_lock_t lock;
  id v35;
  uint64_t v37;
  id v38;
  id obj;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  lock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v53;
    v35 = v4;
    v37 = *(_QWORD *)v53;
    do
    {
      v8 = 0;
      v38 = v6;
      do
      {
        if (*(_QWORD *)v53 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "type") == (id)1)
        {
          v42 = v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "context"));
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueName"));

          v41 = (void *)v11;
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v11));
          v43 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v43, "addObject:", v9);
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dependents"));
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v49;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v49 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v17, "type") == (id)2)
                {
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "context"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "context"));

                  if (v18 == v19)
                  {
                    objc_msgSend(v43, "addObject:", v17);
                    v46 = 0u;
                    v47 = 0u;
                    v44 = 0u;
                    v45 = 0u;
                    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dependents"));
                    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
                    if (v21)
                    {
                      v22 = v21;
                      v23 = *(_QWORD *)v45;
                      while (2)
                      {
                        for (j = 0; j != v22; j = (char *)j + 1)
                        {
                          if (*(_QWORD *)v45 != v23)
                            objc_enumerationMutation(v20);
                          v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
                          if (objc_msgSend(v25, "type") == (id)3)
                          {
                            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "context"));
                            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "context"));

                            if (v26 == v27)
                            {
                              objc_msgSend(v43, "addObject:", v25);
                              goto LABEL_28;
                            }
                          }
                        }
                        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
                        if (v22)
                          continue;
                        break;
                      }
                    }
LABEL_28:

                    v4 = v35;
                    goto LABEL_29;
                  }
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
              if (v14)
                continue;
              break;
            }
          }
LABEL_29:

          v8 = v42;
          if (v40)
          {
            v28 = sub_1000604F0();
            v29 = objc_claimAutoreleasedReturnValue(v28);
            v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
            if (a3)
            {
              if (v30)
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "lastObject"));
                *(_DWORD *)buf = 138412546;
                v57 = v9;
                v58 = 2112;
                v59 = v31;
                _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Setting up intra-component dependency: %@ -> %@", buf, 0x16u);

              }
              v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "lastObject"));
              objc_msgSend(v9, "addDependency:", v29);
            }
            else if (v30)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "lastObject"));
              *(_DWORD *)buf = 138412546;
              v57 = v9;
              v58 = 2112;
              v59 = v32;
              _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Skipping intra-component dependency linking: %@ -> %@", buf, 0x16u);

            }
          }
          objc_msgSend(v4, "setObject:forKey:", v43, v41);

          v7 = v37;
          v6 = v38;
        }
        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  return v4;
}

- (void)addInstallDependency:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  os_unfair_lock_t lock;
  void *v25;
  uint64_t v26;
  MSDComponent *v27;
  id v28;
  id obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v4 = a3;
  v27 = self;
  lock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v4;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stagedOperations"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    v26 = *(_QWORD *)v36;
    do
    {
      v8 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "type") == (id)3)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("MSDProvisioningProfileInstallOperation")))
          {

LABEL_11:
            v30 = v8;
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](v27, "stagedOperations"));
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
            if (!v13)
              goto LABEL_27;
            v14 = v13;
            v15 = *(_QWORD *)v32;
            while (2)
            {
              v16 = 0;
LABEL_14:
              if (*(_QWORD *)v32 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
              if (objc_msgSend(v17, "type") == (id)3
                && (objc_msgSend(v17, "runInstallInParallel") & 1) == 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
                if (objc_msgSend(v18, "isEqualToString:", CFSTR("MSDProvisioningProfileInstallOperation")))
                {
                  v19 = objc_msgSend(v17, "isLeaf");

                  if ((v19 & 1) == 0)
                    goto LABEL_25;
                }
                else
                {

                }
                v20 = sub_1000604F0();
                v21 = objc_claimAutoreleasedReturnValue(v20);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "component"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "component"));
                  *(_DWORD *)buf = 138413058;
                  v40 = v17;
                  v41 = 2112;
                  v42 = v22;
                  v43 = 2112;
                  v44 = v9;
                  v45 = 2112;
                  v46 = v23;
                  _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Setting up install dependency: %@(%@) -> %@(%@)", buf, 0x2Au);

                }
                objc_msgSend(v17, "addDependency:", v9);
              }
LABEL_25:
              if (v14 == (id)++v16)
              {
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
                if (!v14)
                {
LABEL_27:

                  v7 = v26;
                  v6 = v28;
                  v8 = v30;
                  goto LABEL_28;
                }
                continue;
              }
              goto LABEL_14;
            }
          }
          v11 = objc_msgSend(v9, "isLeaf");

          if ((v11 & 1) != 0)
            goto LABEL_11;
        }
LABEL_28:
        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)discardStagedOperationsAndTriggerCompletion
{
  os_unfair_lock_s *p_componentLock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "cancel");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  objc_msgSend(v9, "unionOrderedSet:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  objc_msgSend(v11, "removeAllObjects");

  -[MSDComponent _handleActiveOperationsDepleted](self, "_handleActiveOperationsDepleted");
  os_unfair_lock_unlock(p_componentLock);
}

- (void)operationWillFinish:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  MSDComponent *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation will finish: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  os_unfair_lock_lock(&self->_componentLock);
  if ((objc_msgSend(v4, "isCancelled") & 1) == 0)
  {
    if (objc_msgSend(v4, "type") == (id)5)
    {
      os_unfair_lock_unlock(&self->_componentLock);
      v7 = 0;
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
      objc_msgSend(v8, "componentDidComplete:", self);
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend(v4, "result"))
    {
      -[MSDComponent _handleSuccessfulOperation:](self, "_handleSuccessfulOperation:", v4);
    }
    else if (objc_msgSend(v4, "skipped"))
    {
      -[MSDComponent _handleSkippedOperation:](self, "_handleSkippedOperation:", v4);
    }
    else
    {
      if (objc_msgSend(v4, "retryable"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent _handleRetryableOperation:](self, "_handleRetryableOperation:", v4));
        goto LABEL_18;
      }
      -[MSDComponent _handleFailedOperation:](self, "_handleFailedOperation:", v4);
    }
    v7 = 0;
LABEL_18:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      os_unfair_lock_unlock(&self->_componentLock);
      if (!v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
        objc_msgSend(v8, "componentDidHaveNewOperationStaged:", self);
        goto LABEL_8;
      }
      v11 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
      if (objc_msgSend(v12, "count"))
      {
        v11 = 0;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
        v11 = objc_msgSend(v13, "count") == 0;

      }
      os_unfair_lock_unlock(&self->_componentLock);
      if (!v7)
      {
LABEL_29:
        if (!v11)
          goto LABEL_9;
        goto LABEL_7;
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
    objc_msgSend(v14, "component:didProduceClonedComponent:", self, v7);

    if (v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
      objc_msgSend(v15, "componentDidHaveNewOperationStaged:", self);

      if (!v11)
        goto LABEL_9;
      goto LABEL_7;
    }
    goto LABEL_29;
  }
  -[MSDComponent _handleCancelledOperation:](self, "_handleCancelledOperation:", v4);
  os_unfair_lock_unlock(&self->_componentLock);
  v7 = 0;
LABEL_9:

}

- (void)operation:(id)a3 didProduceNewOperation:(id)a4 forRollback:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  MSDComponent *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;

  v5 = a5;
  v7 = a4;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543874;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    v15 = 1024;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: New operation produced: %{public}@ rollback: %{BOOL}d", (uint8_t *)&v11, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_componentLock);
  -[MSDComponent _addStagedOperation:forRollback:](self, "_addStagedOperation:forRollback:", v7, v5);
  os_unfair_lock_unlock(&self->_componentLock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
  objc_msgSend(v10, "componentDidHaveNewOperationStaged:", self);

}

- (void)_addStagedOperations:(id)a3 forRollback:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a4;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[MSDComponent _addStagedOperation:forRollback:](self, "_addStagedOperation:forRollback:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), v4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_addStagedOperation:(id)a3 forRollback:(BOOL)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  objc_msgSend(v6, "addObject:", v7);

  if (!a4)
  {
    objc_msgSend(v7, "associateWithComponent:", self);
    objc_msgSend(v7, "addObserver:", self);
  }

}

- (void)_estimateDiskSpaceRequirementFromOperations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "context"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueName"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "diskSpacedRequired"));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(v4, "containsObject:", v12);

          if ((v15 & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "diskSpacedRequired"));
            v8 += (uint64_t)objc_msgSend(v16, "unsignedLongLongValue");

            objc_msgSend(v4, "addObject:", v12);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[MSDComponent setDiskSpaceRequired:](self, "setDiskSpaceRequired:", v8);
}

- (id)_cloneComponent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MSDComponent *v8;
  void *v9;
  MSDComponent *v10;
  void *v11;
  id v12;

  v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  objc_msgSend(v3, "unionOrderedSet:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  objc_msgSend(v3, "unionOrderedSet:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent _cloneOperations:](self, "_cloneOperations:", v6));

  v8 = [MSDComponent alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent name](self, "name"));
  v10 = -[MSDComponent initWithName:andOperations:](v8, "initWithName:andOperations:", v9, v7);

  -[MSDComponent setRetryCount:](v10, "setRetryCount:", -[MSDComponent retryCount](self, "retryCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  v12 = objc_msgSend(v11, "mutableCopy");
  -[MSDComponent setFinishedOperations:](v10, "setFinishedOperations:", v12);

  return v10;
}

- (id)_cloneOperations:(id)a3
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v6));
      v9 = (objc_class *)objc_opt_class(v7, v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDOperationRepository createOperationFromIdentifier:withContext:](MSDOperationRepository, "createOperationFromIdentifier:withContext:", v11, v12));

      objc_msgSend(v5, "addObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash")));
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

      ++v6;
    }
    while ((unint64_t)objc_msgSend(v3, "count") > v6);
  }
  if (objc_msgSend(v5, "count"))
  {
    v16 = 0;
    v28 = v3;
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v16, v28));
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v29 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v16));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dependencies"));

      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v31;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v23), "hash")));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v24));

            if (v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", (int)objc_msgSend(v25, "intValue")));
              objc_msgSend(v17, "addDependency:", v26);

            }
            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v21);
      }

      v16 = v29 + 1;
      v3 = v28;
    }
    while ((unint64_t)objc_msgSend(v5, "count") > v29 + 1);
  }

  return v5;
}

- (void)_cancelRemainingOperations
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v14 = v3;
  if (objc_msgSend(v3, "count"))
  {
    do
    {
      v4 = objc_autoreleasePoolPush();
      v5 = objc_alloc_init((Class)NSMutableSet);
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v6 = v14;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v11, "isAllDependentInComponentCancelled"))
            {
              v12 = sub_1000604F0();
              v13 = objc_claimAutoreleasedReturnValue(v12);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v20 = v11;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cancelling operation: %{public}@", buf, 0xCu);
              }

              objc_msgSend(v11, "cancel");
            }
            if (objc_msgSend(v11, "isCancelled"))
              objc_msgSend(v5, "addObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        }
        while (v8);
      }

      objc_msgSend(v6, "minusSet:", v5);
      objc_autoreleasePoolPop(v4);
    }
    while (objc_msgSend(v6, "count"));
  }

}

- (void)_rollbackFinishedOperations
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  v4 = objc_msgSend(v3, "copy");

  -[MSDComponent setRollbackOperations:](self, "setRollbackOperations:", 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = sub_1000604F0();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Rolling back finished operation: %@", buf, 0xCu);
        }

        objc_msgSend(v10, "rollback");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

}

- (void)_handleActiveOperationsDepleted
{
  MSDOperationContext *v3;
  void *v4;
  id v5;

  if (!-[MSDComponent forRemoval](self, "forRemoval"))
  {
    v3 = objc_alloc_init(MSDOperationContext);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent name](self, "name"));
    -[MSDOperationContext setIdentifier:](v3, "setIdentifier:", v4);

    v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDOperationRepository createOperationFromIdentifier:withContext:](MSDOperationRepository, "createOperationFromIdentifier:withContext:", CFSTR("MSDComponentCompleteOperation"), v3));
    -[MSDComponent _addStagedOperation:forRollback:](self, "_addStagedOperation:forRollback:", v5, 0);

  }
}

- (void)_handleSuccessfulOperation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000B9D14();

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  objc_msgSend(v7, "removeObject:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  objc_msgSend(v8, "addObject:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    -[MSDComponent _handleActiveOperationsDepleted](self, "_handleActiveOperationsDepleted");

}

- (void)_handleFailedOperation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000B9D74();

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v8 = objc_msgSend(v7, "pauseContentUpdateOnError");

    if (v8)
    {
      do
      {
        v9 = sub_1000604F0();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pausing content update as requested. Will check the value again in 30s.", v18, 2u);
        }

        sleep(0x1Eu);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
        v12 = objc_msgSend(v11, "pauseContentUpdateOnError");

      }
      while ((v12 & 1) != 0);
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  objc_msgSend(v13, "removeObject:", v4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  objc_msgSend(v14, "addObject:", v4);

  -[MSDComponent _cancelRemainingOperations](self, "_cancelRemainingOperations");
  -[MSDComponent _rollbackFinishedOperations](self, "_rollbackFinishedOperations");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  objc_msgSend(v15, "unionOrderedSet:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  objc_msgSend(v17, "removeAllObjects");

  -[MSDComponent _handleActiveOperationsDepleted](self, "_handleActiveOperationsDepleted");
}

- (id)_handleRetryableOperation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  MSDComponent *v12;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000B9DD4();

  -[MSDComponent setRetryCount:](self, "setRetryCount:", (char *)-[MSDComponent retryCount](self, "retryCount") - 1);
  if (-[MSDComponent retryCount](self, "retryCount") <= 0)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Component retry count exhausted.", (uint8_t *)&v11, 0xCu);
    }

    -[MSDComponent _handleFailedOperation:](self, "_handleFailedOperation:", v4);
    v7 = 0;
  }
  else
  {
    -[MSDComponent _cancelRemainingOperations](self, "_cancelRemainingOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent _cloneComponent](self, "_cloneComponent"));
  }

  return v7;
}

- (void)_handleSkippedOperation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000B9E34();

  -[MSDComponent _handleSuccessfulOperation:](self, "_handleSuccessfulOperation:", v4);
}

- (void)_handleCancelledOperation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000B9E94();

  if (-[MSDComponent rollbackOperations](self, "rollbackOperations"))
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rolling back cancelled operation: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v4, "rollback");
  }

}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent name](self, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: Name: %@>"), v5, v6));

  return (NSString *)v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)forRemoval
{
  return self->_forRemoval;
}

- (void)setForRemoval:(BOOL)a3
{
  self->_forRemoval = a3;
}

- (unint64_t)diskSpaceRequired
{
  return self->_diskSpaceRequired;
}

- (void)setDiskSpaceRequired:(unint64_t)a3
{
  self->_diskSpaceRequired = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)rollbackOperations
{
  return self->_rollbackOperations;
}

- (void)setRollbackOperations:(BOOL)a3
{
  self->_rollbackOperations = a3;
}

- (NSMutableOrderedSet)removeOperations
{
  return self->_removeOperations;
}

- (void)setRemoveOperations:(id)a3
{
  objc_storeStrong((id *)&self->_removeOperations, a3);
}

- (NSMutableOrderedSet)stagedOperations
{
  return self->_stagedOperations;
}

- (void)setStagedOperations:(id)a3
{
  objc_storeStrong((id *)&self->_stagedOperations, a3);
}

- (NSMutableOrderedSet)activeOperations
{
  return self->_activeOperations;
}

- (void)setActiveOperations:(id)a3
{
  objc_storeStrong((id *)&self->_activeOperations, a3);
}

- (NSMutableOrderedSet)finishedOperations
{
  return self->_finishedOperations;
}

- (void)setFinishedOperations:(id)a3
{
  objc_storeStrong((id *)&self->_finishedOperations, a3);
}

- (MSDComponentObserver)observer
{
  return (MSDComponentObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (os_unfair_lock_s)componentLock
{
  return self->_componentLock;
}

- (void)setComponentLock:(os_unfair_lock_s)a3
{
  self->_componentLock = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_finishedOperations, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_stagedOperations, 0);
  objc_storeStrong((id *)&self->_removeOperations, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
