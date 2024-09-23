@implementation fskitdExtensionManager

- (fskitdExtensionManager)init
{
  fskitdExtensionManager *v2;
  uint64_t v3;
  NSMapTable *instances;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)fskitdExtensionManager;
  v2 = -[fskitdExtensionManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    instances = v2->_instances;
    v2->_instances = (NSMapTable *)v3;

  }
  return v2;
}

- (void)extensionForDefaultBundle:(id)a3 user:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[FSModuleHost defaultInstanceUUID](FSModuleHost, "defaultInstanceUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fs_containerIdentifier"));
  -[fskitdExtensionManager extensionForBundle:user:instance:replyHandler:](self, "extensionForBundle:user:instance:replyHandler:", v10, v9, v11, v8);

}

- (id)instanceKeyFor:(unsigned int)a3 bundleID:(id)a4 instanceID:(id)a5
{
  id v6;
  id v7;
  NSNumber *v8;
  void *v9;
  void *v10;

  v6 = a5;
  v7 = a4;
  v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", getuid());
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FSItemTriple tripleWith:second:third:](FSItemTriple, "tripleWith:second:third:", v9, v7, v6));

  return v10;
}

- (void)extensionForBundle:(id)a3 user:(id)a4 instance:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, _QWORD);
  void *v13;
  NSMapTable *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, id, _QWORD))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionManager instanceKeyFor:bundleID:instanceID:](self, "instanceKeyFor:bundleID:instanceID:", objc_msgSend(v10, "ruid"), v19, v11));
  v14 = self->_instances;
  objc_sync_enter(v14);
  v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_instances, "objectForKey:", v13));
  if (v15)
  {
    v12[2](v12, v15, 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
    v15 = +[fskitdExtensionInstance newForBundle:user:instance:](fskitdExtensionInstance, "newForBundle:user:instance:", v19, v10, v16);

    if (v15)
    {
      -[NSMapTable setObject:forKey:](self->_instances, "setObject:forKey:", v15, v13);
      v12[2](v12, v15, 0);
    }
    else
    {
      v17 = fs_errorForPOSIXError(2);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      ((void (**)(id, id, void *))v12)[2](v12, 0, v18);

      v15 = 0;
    }
  }
  objc_sync_exit(v14);

}

- (void)existingExtensionForBundle:(id)a3 user:(id)a4 instance:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  void *v14;
  NSMapTable *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionManager instanceKeyFor:bundleID:instanceID:](self, "instanceKeyFor:bundleID:instanceID:", objc_msgSend(v11, "ruid"), v10, v12));
  v15 = self->_instances;
  objc_sync_enter(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_instances, "objectForKey:", v14));
  objc_sync_exit(v15);

  if (v16)
  {
    v13[2](v13, v16, 0);
  }
  else
  {
    v18 = fskit_std_log(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v22 = 136315906;
      v23 = "-[fskitdExtensionManager existingExtensionForBundle:user:instance:replyHandler:]";
      v24 = 2112;
      v25 = v10;
      v26 = 1024;
      v27 = objc_msgSend(v11, "ruid");
      v28 = 2112;
      v29 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s: Can't find any instance using bundleID (%@), uid %u, and instanceID (%@)", (uint8_t *)&v22, 0x26u);
    }

    v20 = fs_errorForPOSIXError(2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    ((void (**)(id, void *, void *))v13)[2](v13, 0, v21);

  }
}

- (BOOL)enumerateInstancesForBundle:(id)a3 uid:(unsigned int)a4 block:(id)a5
{
  uint64_t v6;
  uint64_t (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  char v18;
  BOOL v19;
  NSMapTable *obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = *(_QWORD *)&a4;
  v23 = a3;
  v7 = (uint64_t (**)(id, void *, void *))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  obj = self->_instances;
  objc_sync_enter(obj);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_instances, "keyEnumerator"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "first"));
        if ((objc_msgSend(v14, "isEqual:", v8) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "second"));
          v16 = objc_msgSend(v15, "isEqual:", v23);

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_instances, "objectForKey:", v13));
            v18 = v7[2](v7, v13, v17);

            if ((v18 & 1) != 0)
            {
              v19 = 1;
              goto LABEL_14;
            }
          }
        }
        else
        {

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }
  v19 = 0;
LABEL_14:

  objc_sync_exit(obj);
  return v19;
}

- (BOOL)enumerateInstancesForBundle:(id)a3 user:(id)a4 block:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  LOBYTE(a4) = -[fskitdExtensionManager enumerateInstancesForBundle:uid:block:](self, "enumerateInstancesForBundle:uid:block:", v9, objc_msgSend(a4, "ruid"), v8);

  return (char)a4;
}

- (void)existingExtensionForBundle:(id)a3 user:(id)a4 volume:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100033DCC;
  v23[3] = &unk_100055F30;
  v13 = v11;
  v24 = v13;
  v14 = v12;
  v25 = v14;
  LOBYTE(a4) = -[fskitdExtensionManager enumerateInstancesForBundle:user:block:](self, "enumerateInstancesForBundle:user:block:", v10, a4, v23);

  if ((a4 & 1) == 0)
  {
    v16 = fskit_std_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_10003DFD4();

    v19 = fskit_std_log(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_10003DF50(self);

    v21 = fs_errorForPOSIXError(2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v22);

  }
}

- (void)isVolumeIDUsed:(id)a3 bundle:(id)a4 user:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = fskit_std_log(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_10003E138();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100033FC8;
  v17[3] = &unk_100055F58;
  v16 = v10;
  v18 = v16;
  v19 = &v20;
  -[fskitdExtensionManager enumerateInstancesForBundle:user:block:](self, "enumerateInstancesForBundle:user:block:", v11, v12, v17);
  (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, *((unsigned __int8 *)v21 + 24), 0);

  _Block_object_dispose(&v20, 8);
}

- (void)existingExtensionForBundle:(id)a3 user:(id)a4 resource:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100034284;
  v23[3] = &unk_100055F30;
  v13 = v11;
  v24 = v13;
  v14 = v12;
  v25 = v14;
  LOBYTE(a4) = -[fskitdExtensionManager enumerateInstancesForBundle:user:block:](self, "enumerateInstancesForBundle:user:block:", v10, a4, v23);

  if ((a4 & 1) == 0)
  {
    v16 = fskit_std_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_10003E234((uint64_t)v10, v13, v17);

    v19 = fskit_std_log(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_10003E1B0(self);

    v21 = fs_errorForPOSIXError(2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v22);

  }
}

- (id)getInstancesInfo
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSMapTable *v22;
  id obj;
  uint64_t v24;
  fskitdExtensionManager *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v26 = (id)objc_opt_new(NSMutableArray, a2);
  v22 = self->_instances;
  objc_sync_enter(v22);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_instances, "keyEnumerator"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v4)
  {
    obj = v3;
    v24 = *(_QWORD *)v32;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v25->_instances, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v5)));
        v8 = (void *)objc_opt_new(NSMutableDictionary, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("bundleID"));

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "uid")));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("user"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instanceID"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("instanceID"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerID"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("containerID"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceIDs"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("resourceIDs"));

        v15 = (void *)objc_opt_new(NSMutableArray, v14);
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "volumeIDs"));
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v28;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v28 != v18)
                objc_enumerationMutation(v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1)
                                                                                 + 8 * (_QWORD)v19), "uuid"));
              objc_msgSend(v15, "addObject:", v20);

              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v17);
        }

        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("volumeIDs"));
        objc_msgSend(v26, "addObject:", v8);

        v5 = (char *)v5 + 1;
      }
      while (v5 != v4);
      v3 = obj;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v4);
  }

  objc_sync_exit(v22);
  return v26;
}

- (void)instanceDied:(id)a3 instanceUUID:(id)a4 uid:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000327E4;
  v21 = sub_1000327F4;
  v22 = 0;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000347C4;
  v14 = &unk_100055F58;
  v9 = a4;
  v15 = v9;
  v16 = &v17;
  -[fskitdExtensionManager enumerateInstancesForBundle:uid:block:](self, "enumerateInstancesForBundle:uid:block:", v8, v5, &v11);
  v10 = (void *)v18[5];
  if (v10)
    objc_msgSend(v10, "weDied", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
}

- (void)cleanUpInstance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMapTable *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionManager instanceKeyFor:bundleID:instanceID:](self, "instanceKeyFor:bundleID:instanceID:", v4, v5, v6));

  v8 = self->_instances;
  objc_sync_enter(v8);
  -[NSMapTable removeObjectForKey:](self->_instances, "removeObjectForKey:", v7);
  objc_sync_exit(v8);

}

- (NSMapTable)instances
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInstances:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instances, 0);
}

@end
