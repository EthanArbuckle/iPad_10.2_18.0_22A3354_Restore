@implementation REDuetContextQuery

- (REDuetContextQuery)initWithPredicate:(id)a3 remotePredicate:(id)a4 name:(id)a5 evaluationBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REDuetContextQuery *v15;
  REDuetContextQuery *v16;
  uint64_t v17;
  NSUUID *uuid;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id evalBlock;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)REDuetContextQuery;
  v15 = -[REDuetContextQuery init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_predicate, a3);
    objc_storeStrong((id *)&v16->_remotePredicate, a4);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = objc_claimAutoreleasedReturnValue();
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_name, a5);
    v19 = (void *)MEMORY[0x24BDBCF20];
    +[REDuetContextDevice localDevice](REDuetContextDevice, "localDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[REDuetContextQuery setDevices:](v16, "setDevices:", v21);

    v22 = MEMORY[0x2199B2434](v14);
    evalBlock = v16->_evalBlock;
    v16->_evalBlock = (id)v22;

  }
  return v16;
}

- (NSString)registrationID
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.RelevanceEngine.%@"), self->_name);
}

- (NSSet)keyPaths
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[_CDContextualPredicate keyPaths](self->_predicate, "keyPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (id)_localRegistrationWithCallback:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _CDContextualPredicate *predicate;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (v4 && self->_predicate)
  {
    v5 = get_CDContextualChangeRegistrationClass();
    -[REDuetContextQuery registrationID](self, "registrationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    predicate = self->_predicate;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __53__REDuetContextQuery__localRegistrationWithCallback___block_invoke;
    v10[3] = &unk_24CF8C100;
    v11 = v4;
    objc_msgSend(v5, "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", v6, predicate, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __53__REDuetContextQuery__localRegistrationWithCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (id)_remoteRegistrationForDevice:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _CDMDCSContextualPredicate *remotePredicate;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (v7 && self->_remotePredicate)
  {
    v8 = get_CDContextualChangeRegistrationClass();
    -[REDuetContextQuery registrationID](self, "registrationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(".%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    remotePredicate = self->_remotePredicate;
    v13 = objc_msgSend(v6, "deviceType");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __60__REDuetContextQuery__remoteRegistrationForDevice_callback___block_invoke;
    v16[3] = &unk_24CF8C128;
    v17 = v7;
    objc_msgSend(v8, "registrationWithIdentifier:contextualPredicate:deviceTypes:clientIdentifier:mustWake:callback:", v11, remotePredicate, v13, CFSTR("com.apple.RelevanceEngine"), 0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __60__REDuetContextQuery__remoteRegistrationForDevice_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)createRegistrationsWithCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
  {
    v20 = xmmword_24CF8C188;
    v21 = 0;
    CoreDuetContextLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v4 && CoreDuetContextLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[REDuetContextQuery devices](self, "devices", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            -[REDuetContextQuery _remoteRegistrationForDevice:callback:](self, "_remoteRegistrationForDevice:callback:", v11, v4);
          else
            -[REDuetContextQuery _localRegistrationWithCallback:](self, "_localRegistrationWithCallback:", v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (id)_keyPathsForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[REDuetContextQuery keyPaths](self, "keyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v24 = 0;
        v25 = &v24;
        v26 = 0x2050000000;
        v11 = (void *)get_CDContextualKeyPathClass_softClass;
        v27 = get_CDContextualKeyPathClass_softClass;
        if (!get_CDContextualKeyPathClass_softClass)
        {
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __get_CDContextualKeyPathClass_block_invoke;
          v23[3] = &unk_24CF8AC38;
          v23[4] = &v24;
          __get_CDContextualKeyPathClass_block_invoke((uint64_t)v23);
          v11 = (void *)v25[3];
        }
        v12 = objc_retainAutorelease(v11);
        _Block_object_dispose(&v24, 8);
        objc_msgSend(v4, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "remoteKeyPathForKeyPath:forDeviceID:", v10, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v7);
  }

  -[REDuetContextQuery _sortedKeyPaths:](self, "_sortedKeyPaths:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_localKeyPaths
{
  void *v3;
  void *v4;
  void *v5;

  -[REDuetContextQuery keyPaths](self, "keyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetContextQuery _sortedKeyPaths:](self, "_sortedKeyPaths:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sortedKeyPaths:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_48);
}

uint64_t __38__REDuetContextQuery__sortedKeyPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)setDevices:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;
  char v7;
  NSSet *v8;
  NSSet *devices;
  void *v10;
  NSSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *searchKeyPaths;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (NSSet *)a3;
  v5 = self->_devices;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSSet isEqual:](v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8 = (NSSet *)-[NSSet copy](v4, "copy");
      devices = self->_devices;
      self->_devices = v8;

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = self->_devices;
      v12 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v16, "identifier", (_QWORD)v21);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              -[REDuetContextQuery _keyPathsForDevice:](self, "_keyPathsForDevice:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v18);
            }
            else
            {
              -[REDuetContextQuery _localKeyPaths](self, "_localKeyPaths");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "insertObject:atIndex:", v18, 0);
            }

          }
          v13 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v13);
      }

      v19 = (NSArray *)objc_msgSend(v10, "copy");
      searchKeyPaths = self->_searchKeyPaths;
      self->_searchKeyPaths = v19;

    }
  }

}

- (id)valueFromUserContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  REDuetContextQuery *v28;
  NSArray *obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_evalBlock)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[REDuetContextQuery keyPaths](self, "keyPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v11, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v8);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = self->_searchKeyPaths;
    v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v31)
    {
      v28 = self;
      v30 = *(_QWORD *)v38;
      while (1)
      {
        v13 = 0;
LABEL_12:
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(obj);
        v32 = v13;
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        if (!v17)
          break;
        v18 = v17;
        v19 = *(_QWORD *)v34;
LABEL_16:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v20);
          objc_msgSend(v4, "objectForContextualKeyPath:", v21);
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
            break;
          v23 = (void *)v22;
          objc_msgSend(v21, "key");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v25);

          if (v18 == ++v20)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
            if (v18)
              goto LABEL_16;
            goto LABEL_28;
          }
        }

        v13 = v32 + 1;
        if (v32 + 1 != v31)
          goto LABEL_12;
        v26 = 0;
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (!v31)
          goto LABEL_31;
      }
LABEL_28:

      (*((void (**)(void))v28->_evalBlock + 2))();
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
    }
LABEL_31:

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NSSet)devices
{
  return self->_devices;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)name
{
  return self->_name;
}

- (_CDContextualPredicate)predicate
{
  return self->_predicate;
}

- (_CDMDCSContextualPredicate)remotePredicate
{
  return self->_remotePredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePredicate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong(&self->_evalBlock, 0);
  objc_storeStrong((id *)&self->_searchKeyPaths, 0);
}

@end
