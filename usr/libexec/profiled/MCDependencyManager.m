@implementation MCDependencyManager

+ (id)sharedManager
{
  return objc_msgSend(a1, "sharedReader");
}

- (id)_init
{
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCDependencyManager;
  v2 = -[MCDependencyManager _init](&v8, "_init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)v2[1];
    v2[1] = v3;

    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)v2[2];
    v2[2] = v5;

  }
  return v2;
}

- (void)commitChanges
{
  NSObject *v3;
  _QWORD v4[4];
  dispatch_semaphore_t v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100063C00;
  v4[3] = &unk_1000E2C50;
  v5 = dispatch_semaphore_create(0);
  v3 = v5;
  -[MCDependencyManager commitChangesCompletion:](self, "commitChangesCompletion:", v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)commitChangesCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Committing dependency changes to disk.", buf, 2u);
  }
  v6 = objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100063CE4;
  v8[3] = &unk_1000E3128;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)memberQueueAddOrphanParent:(id)a3 inDomain:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (v7)
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Adding parent %{public}@ to domain %{public}@ orphan list.", (uint8_t *)&v20, 0x16u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));

    if (!v14)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v11);

    }
    objc_msgSend(v14, "addObject:", v10);

  }
  if (v6)
  {
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Adding parent %{public}@ to domain %{public}@ orphan list.", (uint8_t *)&v20, 0x16u);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v11));

    if (!v18)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v11);

    }
    objc_msgSend(v18, "addObject:", v10);

  }
}

- (void)memberQueueRemoveOrphanParent:(id)a3 inDomain:(id)a4 fromSystem:(BOOL)a5 user:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (v7)
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Removing parent %{public}@ from domain %{public}@ orphan list.", (uint8_t *)&v20, 0x16u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));

    if (v14)
    {
      objc_msgSend(v14, "removeObject:", v10);
      if (!objc_msgSend(v14, "count"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
        objc_msgSend(v15, "removeObjectForKey:", v11);

      }
    }

  }
  if (v6)
  {
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Removing parent %{public}@ from domain %{public}@ orphan list.", (uint8_t *)&v20, 0x16u);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v11));

    if (v18)
    {
      objc_msgSend(v18, "removeObject:", v10);
      if (!objc_msgSend(v18, "count"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
        objc_msgSend(v19, "removeObjectForKey:", v11);

      }
    }

  }
}

- (id)orphanedParentsForDomain:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100064314;
  v16 = sub_100064324;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006432C;
  block[3] = &unk_1000E3F00;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)orphanedParentsForSystemDomain:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100064314;
  v16 = sub_100064324;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006451C;
  block[3] = &unk_1000E3F28;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)orphanedParentsForUserDomain:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100064314;
  v16 = sub_100064324;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064678;
  block[3] = &unk_1000E3F28;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)memberQueueOrphanedParentsInSystemDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)memberQueueOrphanedParentsInUserDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5
{
  -[MCDependencyManager addDependent:ofParent:inDomain:toSystem:user:](self, "addDependent:ofParent:inDomain:toSystem:user:", a3, a4, a5, 1, 0);
}

- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (v12 && v13 && v14)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100064920;
    block[3] = &unk_1000E3F50;
    block[4] = self;
    v19 = v12;
    v20 = v13;
    v21 = v15;
    v22 = a6;
    v23 = a7;
    dispatch_sync(v16, block);

  }
  else
  {
    v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      v28 = 2114;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Attempting to add dependent %{public}@ to parent %{public}@ in domain %{public}@. Ignoring.", buf, 0x20u);
    }
  }

}

- (void)memberQueueAddDependent:(id)a3 toParent:(id)a4 inDomain:(id)a5
{
  -[MCDependencyManager memberQueueAddDependent:toParent:inDomain:toSystem:user:](self, "memberQueueAddDependent:toParent:inDomain:toSystem:user:", a3, a4, a5, 1, 0);
}

- (void)memberQueueAddDependent:(id)a3 toParent:(id)a4 inDomain:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v8)
  {
    v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v25 = 138543874;
      v26 = v12;
      v27 = 2114;
      v28 = v13;
      v29 = 2114;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Adding dependent %{public}@ to parent %{public}@ in domain %{public}@ to system", (uint8_t *)&v25, 0x20u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v14));

    if (!v17)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v14);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v13));
    if (!v19)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v13);
    }
    objc_msgSend(v19, "addObject:", v12);

  }
  if (v7)
  {
    v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v25 = 138543874;
      v26 = v12;
      v27 = 2114;
      v28 = v13;
      v29 = 2114;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Adding dependent %{public}@ to parent %{public}@ in domain %{public}@ to user", (uint8_t *)&v25, 0x20u);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v14));

    if (!v22)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v14);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v13));
    if (!v24)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, v13);
    }
    objc_msgSend(v24, "addObject:", v12);

  }
  -[MCDependencyManager memberQueueRemoveOrphanParent:inDomain:fromSystem:user:](self, "memberQueueRemoveOrphanParent:inDomain:fromSystem:user:", v13, v14, v8, v7);

}

- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5
{
  -[MCDependencyManager removeDependent:fromParent:inDomain:fromSystem:user:](self, "removeDependent:fromParent:inDomain:fromSystem:user:", a3, a4, a5, 1, 0);
}

- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 fromSystem:(BOOL)a6 user:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (v12 && v13 && v14)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100064DC4;
    block[3] = &unk_1000E3F50;
    block[4] = self;
    v19 = v13;
    v20 = v15;
    v21 = v12;
    v22 = a6;
    v23 = a7;
    dispatch_sync(v16, block);

  }
  else
  {
    v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      v28 = 2114;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Attempting to remove dependent %{public}@ from parent %{public}@ in domain %{public}@. Ignoring.", buf, 0x20u);
    }
  }

}

- (void)memberQueueRemoveDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5
{
  -[MCDependencyManager memberQueueRemoveDependent:fromParent:inDomain:fromSystem:user:](self, "memberQueueRemoveDependent:fromParent:inDomain:fromSystem:user:", a3, a4, a5, 1, 0);
}

- (void)memberQueueRemoveDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 fromSystem:(BOOL)a6 user:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v8)
  {
    v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v29 = 138543874;
      v30 = v12;
      v31 = 2114;
      v32 = v13;
      v33 = 2114;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Removing dependent %{public}@ from parent %{public}@ in domain %{public}@ from system", (uint8_t *)&v29, 0x20u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v14));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v13));
      v19 = v18;
      if (v18)
      {
        v20 = objc_msgSend(v18, "indexOfObject:", v12);
        if (v20 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v19, "removeObjectAtIndex:", v20);
          if (!objc_msgSend(v19, "count"))
          {
            objc_msgSend(v17, "removeObjectForKey:", v13);
            -[MCDependencyManager memberQueueAddOrphanParent:inDomain:toSystem:user:](self, "memberQueueAddOrphanParent:inDomain:toSystem:user:", v13, v14, 1, 0);
            if (!objc_msgSend(v17, "count"))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict"));
              objc_msgSend(v21, "removeObjectForKey:", v14);

            }
          }
        }
      }

    }
  }
  if (v7)
  {
    v22 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v29 = 138543874;
      v30 = v12;
      v31 = 2114;
      v32 = v13;
      v33 = 2114;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Removing dependent %{public}@ from parent %{public}@ in domain %{public}@ from user", (uint8_t *)&v29, 0x20u);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v14));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v13));
      v26 = v25;
      if (v25)
      {
        v27 = objc_msgSend(v25, "indexOfObject:", v12);
        if (v27 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v26, "removeObjectAtIndex:", v27);
          if (!objc_msgSend(v26, "count"))
          {
            objc_msgSend(v24, "removeObjectForKey:", v13);
            -[MCDependencyManager memberQueueAddOrphanParent:inDomain:toSystem:user:](self, "memberQueueAddOrphanParent:inDomain:toSystem:user:", v13, v14, 0, 1);
            if (!objc_msgSend(v24, "count"))
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict"));
              objc_msgSend(v28, "removeObjectForKey:", v14);

            }
          }
        }
      }

    }
  }

}

- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6
{
  -[MCDependencyManager addDependent:ofParent:inDomain:reciprocalDomain:toSystem:user:](self, "addDependent:ofParent:inDomain:reciprocalDomain:toSystem:user:", a3, a4, a5, a6, 1, 0);
}

- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000652EC;
  block[3] = &unk_1000E3F78;
  block[4] = self;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v28 = a7;
  v29 = a8;
  v27 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_sync(v18, block);

}

- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6
{
  -[MCDependencyManager removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:](self, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:", a3, a4, a5, a6, 1, 0);
}

- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6 fromSystem:(BOOL)a7 user:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065460;
  block[3] = &unk_1000E3F78;
  block[4] = self;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v28 = a7;
  v29 = a8;
  v27 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_sync(v18, block);

}

- (NSMutableDictionary)memberQueueSystemOrphansDict
{
  return self->_memberQueueSystemOrphansDict;
}

- (void)setMemberQueueSystemOrphansDict:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueSystemOrphansDict, a3);
}

- (NSMutableDictionary)memberQueueUserOrphansDict
{
  return self->_memberQueueUserOrphansDict;
}

- (void)setMemberQueueUserOrphansDict:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueUserOrphansDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueUserOrphansDict, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemOrphansDict, 0);
}

@end
