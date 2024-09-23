@implementation NFStorageControllerESEExpress

- (void)updateESEExpressEntitiesWithConfig:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *Name;
  _QWORD v19[5];
  id v20;
  SEL v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __68__NFStorageControllerESEExpress_updateESEExpressEntitiesWithConfig___block_invoke;
    v19[3] = &unk_24D610E78;
    v19[4] = self;
    v21 = a2;
    v20 = v5;
    objc_msgSend(v7, "performBlockAndWait:", v19);

  }
  else
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v14, ClassName, Name, 152);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      *(_DWORD *)buf = 67109890;
      v23 = v17;
      v24 = 2082;
      v25 = object_getClassName(self);
      v26 = 2082;
      v27 = sel_getName(a2);
      v28 = 1024;
      v29 = 152;
      _os_log_impl(&dword_216CE4000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }

  }
}

- (id)_deleteAllESEExpressEntities
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *ClassName;
  const char *Name;
  id v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  +[ExpressESEEntity fetchRequest](ExpressESEEntity, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v4);
  -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v7 = (id)objc_msgSend(v6, "executeRequest:error:", v5, &v23);
  v8 = v23;

  if (v8)
  {
    v9 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Failed to execute delete request: %{public}@", v14, ClassName, Name, 142, v8);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v25 = v17;
      v26 = 2082;
      v27 = v18;
      v28 = 2082;
      v29 = v19;
      v30 = 1024;
      v31 = 142;
      v32 = 2114;
      v33 = v8;
      _os_log_impl(&dword_216CE4000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute delete request: %{public}@", buf, 0x2Cu);
    }

  }
  return v8;
}

void __66__NFStorageControllerESEExpress_fetchESEExpressEntitiesWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  void (*v63)(uint64_t, const char *, ...);
  objc_class *v64;
  _BOOL4 v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  int v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  int v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(uint64_t, const char *, ...);
  objc_class *v94;
  _BOOL4 v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  const void **v104;
  uint64_t Logger;
  void (*v106)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v110;
  objc_class *v111;
  int v112;
  const char *v113;
  const char *v114;
  const char *v115;
  const char *Name;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  id obj;
  _QWORD v131[5];
  _QWORD v132[5];
  uint8_t v133[128];
  uint8_t buf[4];
  int v135;
  __int16 v136;
  const char *v137;
  __int16 v138;
  const char *v139;
  __int16 v140;
  int v141;
  __int16 v142;
  uint64_t v143;
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  +[ExpressESEEntity fetchRequest](ExpressESEEntity, "fetchRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  v119 = (void *)v2;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v26 = objc_opt_new();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    if (!objc_msgSend(v5, "count"))
    {
      v6 = v5;
      v104 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v106 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 56));
        v110 = 45;
        if (isMetaClass)
          v110 = 43;
        v106(6, "%c[%{public}s %{public}s]:%i Nothing in DB - return an empty array", v110, ClassName, Name, 66);
      }
      dispatch_get_specific(*v104);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v111 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v111))
        v112 = 43;
      else
        v112 = 45;
      v113 = object_getClassName(*(id *)(a1 + 32));
      v114 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      v135 = v112;
      v136 = 2082;
      v137 = v113;
      v138 = 2082;
      v139 = v114;
      v140 = 1024;
      v141 = 66;
      v21 = "%c[%{public}s %{public}s]:%i Nothing in DB - return an empty array";
      v22 = v15;
      v23 = OS_LOG_TYPE_DEFAULT;
      v24 = 34;
      goto LABEL_11;
    }
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v118 = v5;
    v29 = v5;
    v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
    if (v30)
    {
      v31 = v30;
      v32 = 0;
      v33 = *(_QWORD *)v127;
      v121 = *MEMORY[0x24BDD0BA0];
      v122 = *MEMORY[0x24BDD0FC8];
      v120 = *MEMORY[0x24BDD0FD8];
      v34 = 0x24BDD1000uLL;
      v123 = *(_QWORD *)v127;
      v124 = a1;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v127 != v33)
            objc_enumerationMutation(v29);
          v36 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
          if (objc_msgSend(v36, "version") == 1)
          {
            if (objc_msgSend(v36, "version") == 1)
            {
              v37 = (void *)objc_opt_new();
              objc_msgSend(v36, "passID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, CFSTR("passUniqueID"));

              objc_msgSend(v36, "aid");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("appletIdentifier"));

              objc_msgSend(v36, "keyID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40)
              {
                objc_msgSend(v36, "keyID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, CFSTR("keyIdentifier"));

              }
              objc_msgSend(*(id *)(v34 + 1760), "numberWithBool:", objc_msgSend(v36, "expressEnabled"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v42, CFSTR("expressEnabled"));

              objc_msgSend(*(id *)(v34 + 1760), "numberWithBool:", objc_msgSend(v36, "inSessionOnly"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v43, CFSTR("inSessionOnly"));

              objc_msgSend(*(id *)(v34 + 1760), "numberWithBool:", objc_msgSend(v36, "uwbExpressEnabled"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v44, CFSTR("UWBExpressEnabled"));

              objc_msgSend(*(id *)(v34 + 1760), "numberWithBool:", objc_msgSend(v36, "isUserChoice"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v45, CFSTR("userChoice"));

              objc_msgSend(v36, "type");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v46, CFSTR("ExpressType"));

              objc_msgSend(v36, "ecp2Info");
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
              {
                objc_msgSend(v36, "ecp2Info");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v48, CFSTR("ECP2Info"));

              }
              objc_msgSend(v36, "readerID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if (v49)
              {
                objc_msgSend(v36, "readerID");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v50, CFSTR("readerIdentifier"));

              }
              objc_msgSend(v36, "moduleID");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v51, CFSTR("moduleIdentifier"));

              objc_msgSend(*(id *)(v34 + 1760), "numberWithInt:", objc_msgSend(v36, "groupActivationStyle"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v52, CFSTR("groupActivationStyle"));

              objc_msgSend(v36, "groupHead");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v53)
              {
                objc_msgSend(v36, "groupHead");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v54, CFSTR("groupHead"));

              }
              objc_msgSend(v36, "groupMembers");
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              if (v55)
              {
                objc_msgSend(v36, "groupMembers");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v56, CFSTR("groupMembers"));

              }
              objc_msgSend(v36, "aliroGroupResolvingKeys");
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              if (v57)
              {
                objc_msgSend(v36, "aliroGroupResolvingKeys");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v58, CFSTR("aliroGroupResolvingKeys"));

              }
              objc_msgSend(v36, "associatedReaderIdentifiers");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v59)
              {
                objc_msgSend(v36, "associatedReaderIdentifiers");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v60, CFSTR("associatedReaderIdentifiers"));

              }
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v37);
            }
            else
            {
              v61 = v29;
              dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
              v62 = NFLogGetLogger();
              if (v62)
              {
                v63 = (void (*)(uint64_t, const char *, ...))v62;
                v64 = object_getClass(*(id *)(a1 + 32));
                v65 = class_isMetaClass(v64);
                v66 = object_getClassName(*(id *)(a1 + 32));
                v67 = sel_getName(*(SEL *)(a1 + 56));
                v117 = objc_msgSend(v36, "version");
                v115 = v67;
                a1 = v124;
                v68 = 45;
                if (v65)
                  v68 = 43;
                v63(3, "%c[%{public}s %{public}s]:%i Unknown version info %d", v68, v66, v115, 101, v117);
              }
              v69 = v31;
              dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
              NFSharedLogGetLogger();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                v71 = object_getClass(*(id *)(a1 + 32));
                if (class_isMetaClass(v71))
                  v72 = 43;
                else
                  v72 = 45;
                v73 = object_getClassName(*(id *)(a1 + 32));
                v74 = sel_getName(*(SEL *)(a1 + 56));
                v75 = objc_msgSend(v36, "version");
                *(_DWORD *)buf = 67110146;
                v135 = v72;
                v136 = 2082;
                v137 = v73;
                v138 = 2082;
                v139 = v74;
                v140 = 1024;
                v141 = 101;
                v142 = 1024;
                LODWORD(v143) = v75;
                _os_log_impl(&dword_216CE4000, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown version info %d", buf, 0x28u);
              }

              v76 = objc_alloc(MEMORY[0x24BDD1540]);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v131[0] = v122;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Decoding Error");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v132[0] = v78;
              v132[1] = &unk_24D611FD0;
              v131[1] = CFSTR("Line");
              v131[2] = CFSTR("Method");
              v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
              v132[2] = v79;
              v131[3] = v121;
              v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(v124 + 56)), 102);
              v132[3] = v80;
              v131[4] = v120;
              v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("incorrect ESE model version"));
              v132[4] = v81;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v132, v131, 5);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 23, v82);
              v84 = *(_QWORD *)(*(_QWORD *)(v124 + 40) + 8);
              v85 = *(void **)(v84 + 40);
              *(_QWORD *)(v84 + 40) = v83;

              a1 = v124;
              v86 = *(_QWORD *)(*(_QWORD *)(v124 + 48) + 8);
              v37 = *(void **)(v86 + 40);
              *(_QWORD *)(v86 + 40) = 0;
              v32 = 1;
              v29 = v61;
              v31 = v69;
              v33 = v123;
              v34 = 0x24BDD1000;
            }

          }
          else
          {
            v32 = 1;
          }
        }
        v31 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
      }
      while (v31);

      v25 = v118;
      if ((v32 & 1) == 0)
        goto LABEL_73;
      -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "hasChanges");

      if (!v88)
        goto LABEL_73;
      v89 = (id)objc_msgSend(*(id *)(a1 + 32), "_deleteAllESEExpressEntities");
      -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v125 = *(id *)(v91 + 40);
      objc_msgSend(v90, "save:", &v125);
      objc_storeStrong((id *)(v91 + 40), v125);

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        goto LABEL_73;
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v92 = NFLogGetLogger();
      if (v92)
      {
        v93 = (void (*)(uint64_t, const char *, ...))v92;
        v94 = object_getClass(*(id *)(a1 + 32));
        v95 = class_isMetaClass(v94);
        v96 = object_getClassName(*(id *)(a1 + 32));
        v97 = sel_getName(*(SEL *)(a1 + 56));
        v98 = 45;
        if (v95)
          v98 = 43;
        v93(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v98, v96, v97, 114, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      NFSharedLogGetLogger();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v99 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v99))
          v100 = 43;
        else
          v100 = 45;
        v101 = object_getClassName(*(id *)(a1 + 32));
        v102 = sel_getName(*(SEL *)(a1 + 56));
        v103 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 67110146;
        v135 = v100;
        v136 = 2082;
        v137 = v101;
        v138 = 2082;
        v139 = v102;
        v140 = 1024;
        v141 = 114;
        v142 = 2114;
        v143 = v103;
        _os_log_impl(&dword_216CE4000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", buf, 0x2Cu);
      }
    }
    else
    {
      v25 = v5;
    }

LABEL_73:
    -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject reset](v15, "reset");
    goto LABEL_74;
  }
  v6 = v5;
  v7 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v8 = NFLogGetLogger();
  if (v8)
  {
    v9 = (void (*)(uint64_t, const char *, ...))v8;
    v10 = object_getClass(*(id *)(a1 + 32));
    v11 = class_isMetaClass(v10);
    v12 = object_getClassName(*(id *)(a1 + 32));
    v13 = sel_getName(*(SEL *)(a1 + 56));
    v14 = 45;
    if (v11)
      v14 = 43;
    v9(3, "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@", v14, v12, v13, 59, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  dispatch_get_specific(*v7);
  NFSharedLogGetLogger();
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    goto LABEL_12;
  v16 = object_getClass(*(id *)(a1 + 32));
  if (class_isMetaClass(v16))
    v17 = 43;
  else
    v17 = 45;
  v18 = object_getClassName(*(id *)(a1 + 32));
  v19 = sel_getName(*(SEL *)(a1 + 56));
  v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  *(_DWORD *)buf = 67110146;
  v135 = v17;
  v136 = 2082;
  v137 = v18;
  v138 = 2082;
  v139 = v19;
  v140 = 1024;
  v141 = 59;
  v142 = 2114;
  v143 = v20;
  v21 = "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@";
  v22 = v15;
  v23 = OS_LOG_TYPE_ERROR;
  v24 = 44;
LABEL_11:
  _os_log_impl(&dword_216CE4000, v22, v23, v21, buf, v24);
LABEL_12:
  v25 = v6;
LABEL_74:

}

- (id)fetchESEExpressEntitiesWithError:(id *)a3
{
  void *v6;
  void *v7;
  id v8;
  const void **v10;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *Name;
  _QWORD v28[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[8];
  _BYTE v36[32];
  id v37;
  _QWORD v38[5];
  _QWORD v39[6];

  v39[5] = *MEMORY[0x24BDAC8D0];
  -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)v36 = buf;
    *(_QWORD *)&v36[8] = 0x3032000000;
    *(_QWORD *)&v36[16] = __Block_byref_object_copy__0;
    *(_QWORD *)&v36[24] = __Block_byref_object_dispose__0;
    v37 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__0;
    v33 = __Block_byref_object_dispose__0;
    v34 = 0;
    -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __66__NFStorageControllerESEExpress_fetchESEExpressEntitiesWithError___block_invoke;
    v28[3] = &unk_24D610E00;
    v28[4] = self;
    v28[5] = &v29;
    v28[6] = buf;
    v28[7] = a2;
    objc_msgSend(v7, "performBlockAndWait:", v28);

    if (a3)
      *a3 = objc_retainAutorelease((id)v30[5]);
    v8 = *(id *)(*(_QWORD *)v36 + 40);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(buf, 8);
    return v8;
  }
  else
  {
    v10 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v16, ClassName, Name, 44);
    }
    dispatch_get_specific(*v10);
    NFSharedLogGetLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v19;
      *(_WORD *)v36 = 2082;
      *(_QWORD *)&v36[2] = object_getClassName(self);
      *(_WORD *)&v36[10] = 2082;
      *(_QWORD *)&v36[12] = sel_getName(a2);
      *(_WORD *)&v36[20] = 1024;
      *(_DWORD *)&v36[22] = 44;
      _os_log_impl(&dword_216CE4000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }

    if (a3)
    {
      v20 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unknown Error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v22;
      v39[1] = &unk_24D611FB8;
      v38[1] = CFSTR("Line");
      v38[2] = CFSTR("Method");
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v39[2] = v23;
      v38[3] = *MEMORY[0x24BDD0BA0];
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 46);
      v39[3] = v24;
      v38[4] = *MEMORY[0x24BDD0FD8];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("managedObjectContext is NULL"));
      v39[4] = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 6, v26);

      a3 = 0;
    }
    return a3;
  }
}

void __68__NFStorageControllerESEExpress_updateESEExpressEntitiesWithConfig___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  const void **v47;
  uint64_t v48;
  void (*v49)(uint64_t, const char *, ...);
  objc_class *v50;
  _BOOL4 v51;
  uint64_t v52;
  objc_class *v53;
  int v54;
  const char *v55;
  const char *v56;
  void *v57;
  const char *ClassName;
  const char *v59;
  const char *Name;
  const char *v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v1 = a1;
  v82 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllESEExpressEntities");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (id)v2;
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(v1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(v1 + 32));
      Name = sel_getName(*(SEL *)(v1 + 48));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Failed to delete all: %{public}@", v9, ClassName, Name, 163, v3);
    }
    dispatch_get_specific(*v4);
    NFSharedLogGetLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v11 = object_getClass(*(id *)(v1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(v1 + 32));
    v14 = sel_getName(*(SEL *)(v1 + 48));
    *(_DWORD *)buf = 67110146;
    v73 = v12;
    v74 = 2082;
    v75 = v13;
    v76 = 2082;
    v77 = v14;
    v78 = 1024;
    v79 = 163;
    v80 = 2114;
    v81 = v3;
    v15 = "%c[%{public}s %{public}s]:%i Failed to delete all: %{public}@";
LABEL_11:
    _os_log_impl(&dword_216CE4000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0x2Cu);
LABEL_12:

    goto LABEL_46;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = *(id *)(v1 + 40);
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v65)
  {
    v63 = v1;
    v64 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v68 != v64)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x24BDBB658];
        -[NFStorageController managedObjectContext](*(id **)(v1 + 32));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ExpressESEEntity"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("appletIdentifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAid:", v21);

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("passUniqueID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPassID:", v22);

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("keyIdentifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("keyIdentifier"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setKeyID:", v24);

        }
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("expressEnabled"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setExpressEnabled:", objc_msgSend(v25, "BOOLValue"));

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ExpressType"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setType:", v26);

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("inSessionOnly"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setInSessionOnly:", objc_msgSend(v27, "BOOLValue"));

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setUwbExpressEnabled:", objc_msgSend(v28, "BOOLValue"));

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("userChoice"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setIsUserChoice:", objc_msgSend(v29, "BOOLValue"));

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ECP2Info"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ECP2Info"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setEcp2Info:", v31);

        }
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("readerIdentifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("readerIdentifier"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setReaderID:", v33);

        }
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("moduleIdentifier"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setModuleID:", v34);

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("groupActivationStyle"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setGroupActivationStyle:", objc_msgSend(v35, "intValue"));

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("groupHead"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("groupHead"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setGroupHead:", v37);

        }
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("groupMembers"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("groupMembers"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setGroupMembers:", v39);

        }
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("aliroGroupResolvingKeys"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("aliroGroupResolvingKeys"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAliroGroupResolvingKeys:", v41);

        }
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("associatedReaderIdentifiers"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("associatedReaderIdentifiers"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAssociatedReaderIdentifiers:", v43);

        }
        objc_msgSend(v20, "setVersion:", 1);

        v1 = v63;
      }
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v65);
  }

  -[NFStorageController managedObjectContext](*(id **)(v1 + 32));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "hasChanges");

  if (!v45)
  {
    v3 = 0;
    goto LABEL_46;
  }
  -[NFStorageController managedObjectContext](*(id **)(v1 + 32));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v46, "save:", &v66);
  v3 = v66;

  if (v3)
  {
    v47 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v48 = NFLogGetLogger();
    if (v48)
    {
      v49 = (void (*)(uint64_t, const char *, ...))v48;
      v50 = object_getClass(*(id *)(v1 + 32));
      v51 = class_isMetaClass(v50);
      v59 = object_getClassName(*(id *)(v1 + 32));
      v61 = sel_getName(*(SEL *)(v1 + 48));
      v52 = 45;
      if (v51)
        v52 = 43;
      v49(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v52, v59, v61, 200, v3);
    }
    dispatch_get_specific(*v47);
    NFSharedLogGetLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v53 = object_getClass(*(id *)(v1 + 32));
    if (class_isMetaClass(v53))
      v54 = 43;
    else
      v54 = 45;
    v55 = object_getClassName(*(id *)(v1 + 32));
    v56 = sel_getName(*(SEL *)(v1 + 48));
    *(_DWORD *)buf = 67110146;
    v73 = v54;
    v74 = 2082;
    v75 = v55;
    v76 = 2082;
    v77 = v56;
    v78 = 1024;
    v79 = 200;
    v80 = 2114;
    v81 = v3;
    v15 = "%c[%{public}s %{public}s]:%i Failed to save: %{public}@";
    goto LABEL_11;
  }
LABEL_46:
  -[NFStorageController managedObjectContext](*(id **)(v1 + 32));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "reset");

}

- (id)name
{
  return CFSTR("Express");
}

- (id)dbProtectionType
{
  return (id)*MEMORY[0x24BDD0CE0];
}

- (void)deleteAllESEExpressEntities
{
  void *v4;
  NSObject *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  objc_class *v13;
  int v14;
  const char *Name;
  _QWORD v16[6];
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NFStorageController managedObjectContext]((id *)&self->super.super.isa);
    v5 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __60__NFStorageControllerESEExpress_deleteAllESEExpressEntities__block_invoke;
    v16[3] = &unk_24D610EA0;
    v16[4] = self;
    v16[5] = a2;
    -[NSObject performBlockAndWait:](v5, "performBlockAndWait:", v16);
  }
  else
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", v12, ClassName, Name, 215);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      *(_DWORD *)buf = 67109890;
      v18 = v14;
      v19 = 2082;
      v20 = object_getClassName(self);
      v21 = 2082;
      v22 = sel_getName(a2);
      v23 = 1024;
      v24 = 215;
      _os_log_impl(&dword_216CE4000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i managedObjectContext is NULL", buf, 0x22u);
    }
  }

}

void __60__NFStorageControllerESEExpress_deleteAllESEExpressEntities__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *ClassName;
  const char *Name;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllESEExpressEntities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasChanges");

    if (v4)
    {
      -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v5, "save:", &v20);
      v2 = v20;

      if (v2)
      {
        v6 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v8 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 40));
          v11 = 45;
          if (isMetaClass)
            v11 = 43;
          v8(3, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", v11, ClassName, Name, 227, v2);
        }
        dispatch_get_specific(*v6);
        NFSharedLogGetLogger();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v13))
            v14 = 43;
          else
            v14 = 45;
          v15 = object_getClassName(*(id *)(a1 + 32));
          v16 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67110146;
          v22 = v14;
          v23 = 2082;
          v24 = v15;
          v25 = 2082;
          v26 = v16;
          v27 = 1024;
          v28 = 227;
          v29 = 2114;
          v30 = v2;
          _os_log_impl(&dword_216CE4000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to save: %{public}@", buf, 0x2Cu);
        }

      }
    }
    else
    {
      v2 = 0;
    }
  }
  -[NFStorageController managedObjectContext](*(id **)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reset");

}

@end
