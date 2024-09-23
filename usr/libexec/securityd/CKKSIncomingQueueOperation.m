@implementation CKKSIncomingQueueOperation

- (CKKSIncomingQueueOperation)init
{

  return 0;
}

- (CKKSIncomingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 pendingClassAItemsRemainingState:(id)a5 errorState:(id)a6 handleMismatchedViewItems:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKKSIncomingQueueOperation *v17;
  CKKSIncomingQueueOperation *v18;
  uint64_t v19;
  NSMutableSet *viewsToScan;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CKKSIncomingQueueOperation;
  v17 = -[CKKSResultOperation init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_intendedState, a4);
    objc_storeStrong((id *)&v18->_nextState, a6);
    objc_storeStrong((id *)&v18->_stateIfClassAItemsRemaining, a5);
    v18->_pendingClassAEntries = 0;
    v18->_handleMismatchedViewItems = a7;
    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    viewsToScan = v18->_viewsToScan;
    v18->_viewsToScan = (NSMutableSet *)v19;

    -[CKKSIncomingQueueOperation setName:](v18, "setName:", CFSTR("incoming-queue-operation"));
  }

  return v18;
}

- (BOOL)processNewCurrentItemPointers:(id)a3 viewState:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];

  v5 = a3;
  v6 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        v14 = objc_autoreleasePoolPush();
        objc_msgSend(v13, "setState:", CFSTR("local"));
        v24 = v12;
        objc_msgSend(v13, "saveToDatabase:", &v24);
        v9 = v24;

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
        v16 = sub_10000BDF4(CFSTR("ckkspointer"), v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Saving new current item pointer: %@", buf, 0xCu);
        }

        if (v9)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
          v19 = sub_10000BDF4(CFSTR("ckksincoming"), v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v9;
            v31 = 2112;
            v32 = v13;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error saving new current item pointer: %@ %@", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v14);
        v11 = (char *)v11 + 1;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v8);

  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(obj, "count"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notifyViewChangedScheduler"));
    objc_msgSend(v21, "trigger");

  }
  return v9 == 0;
}

- (BOOL)intransaction:(id)a3 processQueueEntries:(id)a4
{
  id v6;
  id v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  __CFString **v24;
  __CFString **v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CKKSIncomingQueueOperation *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  CKKSIncomingQueueOperation *v82;
  void *v83;
  unsigned int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  unsigned int v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  id v108;
  id v109;
  id obj;
  CKKSIncomingQueueOperation *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  id v115;
  CKKSMemoryKeyCache *v116;
  void *context;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  NSErrorUserInfoKey v127;
  void *v128;
  uint8_t buf[4];
  id v130;
  __int16 v131;
  id v132;
  __int16 v133;
  void *v134;
  _BYTE v135[128];

  v6 = a3;
  v7 = a4;
  v109 = objc_alloc_init((Class)NSMutableArray);
  v108 = objc_alloc_init((Class)NSMutableArray);
  v116 = objc_alloc_init(CKKSMemoryKeyCache);
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v7;
  v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
  if (v115)
  {
    v114 = *(_QWORD *)v124;
    v8 = &AAAccountClassPrimary_ptr;
    v111 = self;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v124 != v114)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)v9);
        context = objc_autoreleasePoolPush();
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
        v14 = sub_10000BDF4(CFSTR("ckksincoming"), v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "action"));
          *(_DWORD *)buf = 138412802;
          v130 = v11;
          v131 = 2112;
          v132 = v16;
          v133 = 2112;
          v134 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ready to process an incoming queue entry: %@ %@ %@", buf, 0x20u);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "item"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v122 = 0;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:](CKKSIncomingQueueOperation, "decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:", v18, v116, v19, &v122));
        v21 = v122;

        if (v20 && !v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", kSecClass));
          v23 = objc_opt_class(v8[322]);
          if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
          {
            if (v22)
            {
              v24 = sub_100011884(v22);
              if (v24)
              {
                v25 = v24;
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "syncingPolicy"));
                v112 = v20;
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapDictionaryToView:", v20));

                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneName"));
                v31 = self;
                v32 = objc_msgSend(v30, "isEqualToString:", v28);

                if ((v32 & 1) != 0)
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "action"));
                  if (objc_msgSend(v33, "isEqualToString:", CFSTR("add")))
                  {

                    goto LABEL_53;
                  }
                  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "action"));
                  v84 = objc_msgSend(v83, "isEqualToString:", CFSTR("modify"));

                  if (v84)
                  {
LABEL_53:
                    v20 = v112;
                    -[CKKSIncomingQueueOperation _onqueueHandleIQEChange:attributes:class:viewState:sortedForThisView:keyCache:](v111, "_onqueueHandleIQEChange:attributes:class:viewState:sortedForThisView:keyCache:", v11, v112, v25, v6, 1, v116);
                    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "item"));
                    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
                    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "CKRecordWithZoneID:", v86));
                    objc_msgSend(v109, "addObject:", v87);

                    self = v111;
                    v21 = 0;
                    v8 = &AAAccountClassPrimary_ptr;
                  }
                  else
                  {
                    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "action"));
                    v100 = objc_msgSend(v99, "isEqualToString:", CFSTR("delete"));

                    self = v111;
                    if (v100)
                    {
                      -[CKKSIncomingQueueOperation _onqueueHandleIQEDelete:class:viewState:](v111, "_onqueueHandleIQEDelete:class:viewState:", v11, v25, v6);
                      v101 = objc_alloc((Class)CKRecordID);
                      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
                      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
                      v104 = objc_msgSend(v101, "initWithRecordName:zoneID:", v102, v103);
                      objc_msgSend(v108, "addObject:", v104);

                      self = v111;
                    }
                    v21 = 0;
                    v8 = &AAAccountClassPrimary_ptr;
                    v20 = v112;
                  }
                }
                else
                {
                  self = v31;
                  if (-[CKKSIncomingQueueOperation handleMismatchedViewItems](v31, "handleMismatchedViewItems"))
                  {
                    v82 = v31;
                    v20 = v112;
                    -[CKKSIncomingQueueOperation _onqueueHandleMismatchedViewItem:secDbClass:attributes:intendedView:viewState:keyCache:](v82, "_onqueueHandleMismatchedViewItem:secDbClass:attributes:intendedView:viewState:keyCache:", v11, v25, v112, v28, v6, v116);
                    v21 = 0;
                  }
                  else
                  {
                    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
                    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "zoneName"));
                    v90 = sub_10000BDF4(CFSTR("ckksincoming"), v89);
                    v91 = objc_claimAutoreleasedReturnValue(v90);

                    v20 = v112;
                    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                    {
                      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
                      *(_DWORD *)buf = 138412546;
                      v130 = v92;
                      v131 = 2112;
                      v132 = v28;
                      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Received an item (%@), but our current policy claims it should be in view %@", buf, 0x16u);

                    }
                    v118 = 0;
                    -[CKKSIncomingQueueOperation _onqueueUpdateIQE:withState:error:](self, "_onqueueUpdateIQE:withState:error:", v11, CFSTR("mismatched_view"), &v118);
                    v21 = v118;
                    if (v21)
                    {
                      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
                      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "zoneName"));
                      v95 = sub_10000BDF4(CFSTR("ckksincoming"), v94);
                      v96 = objc_claimAutoreleasedReturnValue(v95);

                      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v130 = v21;
                        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Couldn't save mismatched IQE to database: %@", buf, 0xCu);
                      }

                      self = v111;
                      -[CKKSIncomingQueueOperation setErrorItemsProcessed:](v111, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](v111, "errorItemsProcessed") + 1);
                      -[CKKSResultOperation setError:](v111, "setError:", v21);
                    }
                    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "requestPolicyCheck"));
                    objc_msgSend(v98, "trigger");

                  }
                  v8 = &AAAccountClassPrimary_ptr;
                }

LABEL_38:
                goto LABEL_48;
              }
            }
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "zoneName"));
            v67 = sub_10000BDF4(CFSTR("ckksincoming"), v66);
            v68 = objc_claimAutoreleasedReturnValue(v67);

            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v130 = v22;
              v131 = 2112;
              v132 = v11;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "unknown class in object: %@ %@", buf, 0x16u);
            }

            objc_msgSend(v11, "setState:", CFSTR("error"));
            v119 = 0;
            objc_msgSend(v11, "saveToDatabase:", &v119);
            v21 = v119;
            if (v21)
            {
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "zoneName"));
              v71 = sub_10000BDF4(CFSTR("ckksincoming"), v70);
              v72 = objc_claimAutoreleasedReturnValue(v71);

              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v130 = v21;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "Couldn't save errored IQE to database: %@", buf, 0xCu);
              }

              -[CKKSResultOperation setError:](self, "setError:", v21);
            }
            -[CKKSIncomingQueueOperation setErrorItemsProcessed:](self, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
          }
          else
          {
            v127 = NSLocalizedDescriptionKey;
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[322], "stringWithFormat:", CFSTR("Item did not have a reasonable class: %@"), v22));
            v128 = v57;
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1));
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -67671, v58));
            -[CKKSResultOperation setError:](self, "setError:", v59);

            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "zoneName"));
            v62 = sub_10000BDF4(CFSTR("ckksincoming"), v61);
            v63 = objc_claimAutoreleasedReturnValue(v62);

            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              v64 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
              *(_DWORD *)buf = 138412290;
              v130 = v64;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Synced item seems wrong: %@", buf, 0xCu);

            }
            -[CKKSIncomingQueueOperation setErrorItemsProcessed:](self, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
            v21 = 0;
          }
          v8 = &AAAccountClassPrimary_ptr;
          goto LABEL_38;
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lockStateTracker"));
        v36 = objc_msgSend(v35, "isLockedError:", v21);

        if (v36)
        {
          v113 = v20;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "zoneName"));
          v39 = sub_10000BDF4(CFSTR("ckksincoming"), v38);
          v40 = objc_claimAutoreleasedReturnValue(v39);

          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v130 = v11;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Keychain is locked; can't decrypt IQE %@",
              buf,
              0xCu);
          }

          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "item"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "parentKeyUUID"));
          v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
          v44 = v6;
          v45 = (void *)v43;
          v46 = v44;
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "zoneID"));
          v121 = 0;
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v42, v45, v47, &v121));
          v49 = v121;

          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "keyclass"));
          LODWORD(v42) = objc_msgSend(v50, "isEqualToString:", CFSTR("classA"));

          self = v111;
          if ((_DWORD)v42)
          {
            -[CKKSIncomingQueueOperation setPendingClassAEntries:](v111, "setPendingClassAEntries:", 1);
            -[CKKSIncomingQueueOperation setPendingClassAEntriesError:](v111, "setPendingClassAEntriesError:", v21);
          }

          v6 = v46;
          v8 = &AAAccountClassPrimary_ptr;
          v20 = v113;
        }
        else
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "domain"));
          if (!objc_msgSend(v51, "isEqualToString:", CFSTR("securityd")))
          {

            self = v111;
LABEL_40:
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "zoneName"));
            v75 = sub_10000BDF4(CFSTR("ckksincoming"), v74);
            v76 = objc_claimAutoreleasedReturnValue(v75);

            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v130 = v11;
              v131 = 2112;
              v132 = v21;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Couldn't decrypt IQE %@ for some reason: %@", buf, 0x16u);
            }

            objc_msgSend(v11, "setState:", CFSTR("error"));
            v120 = 0;
            objc_msgSend(v11, "saveToDatabase:", &v120);
            v77 = v120;
            if (v77)
            {
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
              v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "zoneName"));
              v80 = sub_10000BDF4(CFSTR("ckksincoming"), v79);
              v81 = objc_claimAutoreleasedReturnValue(v80);

              if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v130 = v11;
                v131 = 2112;
                v132 = v77;
                _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Couldn't save IQE %@ as error for some reason: %@", buf, 0x16u);
              }

              v8 = &AAAccountClassPrimary_ptr;
            }
            -[CKKSResultOperation setError:](self, "setError:", v21);

            goto LABEL_47;
          }
          v52 = objc_msgSend(v21, "code");

          self = v111;
          if (v52 != (id)-25300)
            goto LABEL_40;
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "zoneName"));
          v55 = sub_10000BDF4(CFSTR("ckksincoming"), v54);
          v56 = objc_claimAutoreleasedReturnValue(v55);

          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v130 = v21;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Coudn't find key in keychain; will attempt to poke key hierarchy: %@",
              buf,
              0xCu);
          }

          -[CKKSIncomingQueueOperation setMissingKey:](v111, "setMissingKey:", 1);
          -[CKKSResultOperation setError:](v111, "setError:", v21);
        }
LABEL_47:
        -[CKKSIncomingQueueOperation setErrorItemsProcessed:](self, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
LABEL_48:

        objc_autoreleasePoolPop(context);
        v9 = (char *)v9 + 1;
      }
      while (v115 != v9);
      v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
      v115 = v105;
    }
    while (v105);
  }

  if (objc_msgSend(v109, "count") || v108)
  {
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notifyViewChangedScheduler"));
    objc_msgSend(v106, "trigger");

  }
  return 1;
}

- (void)_onqueueHandleMismatchedViewItem:(id)a3 secDbClass:(const SecDbClass *)a4 attributes:(id)a5 intendedView:(id)a6 viewState:(id)a7 keyCache:(id)a8
{
  id v14;
  const __CFDictionary *v15;
  __CFString *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  unsigned int v39;
  id v40;
  void *v41;
  CKKSIncomingQueueOperation *v42;
  id v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  __CFString *v58;
  void *v59;
  id v60;
  id v61;
  __CFString *v62;
  uint8_t buf[4];
  __CFString *v64;
  __int16 v65;
  __CFString *v66;

  v14 = a3;
  v15 = (const __CFDictionary *)a5;
  v16 = (__CFString *)a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));
  v21 = sub_10000BDF4(CFSTR("ckksincoming"), v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
    *(_DWORD *)buf = 138412546;
    v64 = v23;
    v65 = 2112;
    v66 = v16;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received an item (%@), which should be in view %@", buf, 0x16u);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "action"));
  if (objc_msgSend(v24, "isEqualToString:", CFSTR("add")))
  {

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "action"));
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("modify"));

    if (!v26)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "action"));
      v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("delete"));

      if (v39)
      {
        v40 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v16, CKCurrentUserDefaultName);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
        v42 = self;
        v43 = v40;
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](v42, "deps"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "contextID"));
        v61 = 0;
        v59 = v43;
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CKKSMirrorEntry tryFromDatabase:contextID:zoneID:error:](CKKSMirrorEntry, "tryFromDatabase:contextID:zoneID:error:", v41, v45, v43, &v61));
        v47 = (__CFString *)v61;

        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "zoneName"));
        v50 = sub_10000BDF4(CFSTR("ckksincoming"), v49);
        v51 = objc_claimAutoreleasedReturnValue(v50);

        v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
        if (!v46 || v47)
        {
          if (v52)
          {
            *(_DWORD *)buf = 138412290;
            v64 = v47;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Unable to load CKKSMirrorEntry from database* %@", buf, 0xCu);
          }
          v53 = v59;
        }
        else
        {
          if (v52)
          {
            *(_DWORD *)buf = 138412546;
            v64 = v16;
            v65 = 2112;
            v66 = v46;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Other view (%@) already knows about this item, dropping incoming queue entry: %@", buf, 0x16u);
          }

          v60 = 0;
          objc_msgSend(v14, "deleteFromDatabase:", &v60);
          v51 = v60;
          v53 = v59;
          if (v51)
          {
            v58 = v46;
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "zoneName"));
            v56 = sub_10000BDF4(CFSTR("ckksincoming"), v55);
            v57 = objc_claimAutoreleasedReturnValue(v56);

            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v64 = (__CFString *)v51;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Unable to delete IQE: %@", buf, 0xCu);
            }

            v46 = v58;
            v53 = v59;
          }
        }

      }
      goto LABEL_17;
    }
  }
  v62 = 0;
  v27 = (__CFString *)sub_10001E9E8((uint64_t)a4, v15, dword_1003414E0, &v62);
  if (v27 && !v62)
  {
    v28 = v27;
    if (-[CKKSIncomingQueueOperation _onqueueHandleIQEChange:item:viewState:sortedForThisView:keyCache:](self, "_onqueueHandleIQEChange:item:viewState:sortedForThisView:keyCache:", v14, v27, v17, 0, v18))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneName"));
      v31 = sub_10000BDF4(CFSTR("ckksincoming"), v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v16;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Wrote a keychain item that is actually for %@; requesting scan",
          buf,
          0xCu);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation viewsToScan](self, "viewsToScan"));
      objc_msgSend(v33, "addObject:", v16);

    }
    goto LABEL_16;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneName"));
  v36 = sub_10000BDF4(CFSTR("ckksincoming"), v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);

  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v62;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Unable to create SecDbItemRef from IQE: %@", buf, 0xCu);
  }

  v28 = v62;
  if (v62)
  {
    v62 = 0;
LABEL_16:
    CFRelease(v28);
  }
LABEL_17:

}

- (BOOL)_onqueueUpdateIQE:(id)a3 withState:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _BOOL4 v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "state"));
  v10 = objc_msgSend(v9, "isEqualToString:", v8);

  if ((v10 & 1) != 0)
    goto LABEL_4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "whereClauseToFindSelf"));
  v12 = objc_msgSend(v11, "mutableCopy");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "state"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("state"));

  objc_msgSend(v7, "setState:", v8);
  if (!objc_msgSend(v7, "saveToDatabase:", a5))
  {

    LOBYTE(v16) = 0;
    goto LABEL_6;
  }
  v14 = objc_msgSend((id)objc_opt_class(v7), "sqlTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:](CKKSSQLDatabaseObject, "deleteFromTable:where:connection:error:", v15, v12, 0, a5);

  if (v16)
LABEL_4:
    LOBYTE(v16) = 1;
LABEL_6:

  return v16;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  AAFAnalyticsEventSecurity *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AAFAnalyticsEventSecurity *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  const char *v46;
  void *v47;
  id v48;
  void *v49;
  AAFAnalyticsEventSecurity *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  AAFAnalyticsEventSecurity *v55;
  void *v56;
  void *v57;
  AAFAnalyticsEventSecurity *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  OctagonPendingFlag *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unsigned __int8 v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  unint64_t v99;
  void *v100;
  void *v101;
  unint64_t v102;
  void *v103;
  void *v104;
  unint64_t v105;
  void *v106;
  void *v107;
  unint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  AAFAnalyticsEventSecurity *v120;
  AAFAnalyticsEventSecurity *v121;
  AAFAnalyticsEventSecurity *v122;
  id obj;
  void *v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[6];
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD v137[6];
  _QWORD v138[6];
  _BYTE v139[128];
  _QWORD v140[2];
  _QWORD v141[2];
  uint8_t buf[4];
  unint64_t v143;
  __int16 v144;
  unint64_t v145;
  _BYTE v146[128];
  const __CFString *v147;
  void *v148;
  _QWORD v149[3];
  _QWORD v150[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readyAndSyncingViews"));

  v6 = sub_10000BDF4(CFSTR("ckksincoming"), 0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v143 = (unint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Going to process the incoming queues for %@", buf, 0xCu);
  }

  if (-[CKKSIncomingQueueOperation handleMismatchedViewItems](self, "handleMismatchedViewItems"))
  {
    v8 = sub_10000BDF4(CFSTR("ckksincoming"), 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Will handle mismatched view items along the way", buf, 2u);
    }

  }
  v10 = [AAFAnalyticsEventSecurity alloc];
  v149[0] = CFSTR("missingKey");
  v149[1] = CFSTR("pendingClassAEntries");
  v150[0] = &__kCFBooleanFalse;
  v150[1] = &__kCFBooleanFalse;
  v149[2] = CFSTR("numViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
  v150[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v150, v149, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeAccount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "altDSID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v122 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v10, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v12, v15, CFSTR("com.apple.security.ckks.processIncomingQueue"), 0, &off_10030AF70, objc_msgSend(v16, "sendMetric"));

  v17 = [AAFAnalyticsEventSecurity alloc];
  v147 = CFSTR("numViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
  v148 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeAccount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "altDSID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v120 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v17, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v19, v22, CFSTR("com.apple.security.ckks.processIncomingQueue.loadAndProcessIQEs"), 0, &off_10030AF70, objc_msgSend(v23, "sendMetric"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "overallLaunch"));
  objc_msgSend(v25, "addEvent:", CFSTR("incoming-processing-begin"));

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v26 = v5;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
  obj = v26;
  if (!v27)
  {
    v29 = 0;
LABEL_24:

    if (objc_msgSend(v26, "count"))
      v41 = (int)v29 / (unint64_t)objc_msgSend(v26, "count");
    else
      v41 = 0;
    v58 = v120;
    v140[0] = CFSTR("avgCKRecords");
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41, v120));
    v140[1] = CFSTR("totalCKRecords");
    v141[0] = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v29));
    v141[1] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v141, v140, 2));
    -[AAFAnalyticsEventSecurity addMetrics:](v58, "addMetrics:", v61);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v58, 1, 0);
    if (-[CKKSIncomingQueueOperation newOutgoingEntries](self, "newOutgoingEntries"))
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("incoming-queue-response")));
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      objc_msgSend(v63, "setCurrentOutgoingQueueOperationGroup:", v62);

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "flagHandler"));
      objc_msgSend(v65, "handleFlag:", CFSTR("process_outgoing_queue"));

    }
    if (-[CKKSIncomingQueueOperation missingKey](self, "missingKey"))
    {
      -[CKKSIncomingQueueOperation setNextState:](self, "setNextState:", CFSTR("process_key_hierarchy"));
    }
    else
    {
      if (-[CKKSIncomingQueueOperation pendingClassAEntries](self, "pendingClassAEntries"))
      {
        v66 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("process_incoming_queue"), 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "flagHandler"));
        objc_msgSend(v68, "handlePendingFlag:", v66);

        v69 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation pendingClassAEntriesError](self, "pendingClassAEntriesError"));
        -[CKKSResultOperation setError:](self, "setError:", v69);

        v70 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation stateIfClassAItemsRemaining](self, "stateIfClassAItemsRemaining"));
        -[CKKSIncomingQueueOperation setNextState:](self, "setNextState:", v70);

      }
      else
      {
        v66 = (OctagonPendingFlag *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation intendedState](self, "intendedState"));
        -[CKKSIncomingQueueOperation setNextState:](self, "setNextState:", v66);
      }

    }
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation viewsToScan](self, "viewsToScan"));
    v72 = objc_msgSend(v71, "count");

    if (v72)
    {
      v73 = sub_10000BDF4(CFSTR("ckksincoming"), 0);
      v74 = objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation viewsToScan](self, "viewsToScan"));
        *(_DWORD *)buf = 138412290;
        v143 = (unint64_t)v75;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Requesting scan for %@", buf, 0xCu);

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "flagHandler"));
      objc_msgSend(v77, "handleFlag:", CFSTR("dropped_items"));

    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v125 = v26;
    v78 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
    if (!v78)
    {
LABEL_62:

      v97 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "activeManagedViews"));
      if (objc_msgSend(v98, "count"))
      {
        v99 = (int)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed");
        v100 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "activeManagedViews"));
        v102 = v99 / (unint64_t)objc_msgSend(v101, "count");

      }
      else
      {
        v102 = 0;
      }

      v103 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "activeManagedViews"));
      if (objc_msgSend(v104, "count"))
      {
        v105 = (int)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed");
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "activeManagedViews"));
        v108 = v105 / (unint64_t)objc_msgSend(v107, "count");

      }
      else
      {
        v108 = 0;
      }

      v137[0] = CFSTR("pendingClassAEntries");
      v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CKKSIncomingQueueOperation pendingClassAEntries](self, "pendingClassAEntries")));
      v138[0] = v109;
      v137[1] = CFSTR("missingKey");
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CKKSIncomingQueueOperation missingKey](self, "missingKey")));
      v138[1] = v110;
      v137[2] = CFSTR("avgSuccessfulItemsProcessed");
      v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v102));
      v138[2] = v111;
      v137[3] = CFSTR("avgErrorItemsProcessed");
      v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v108));
      v138[3] = v112;
      v137[4] = CFSTR("successfulItemsProcessed");
      v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", -[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed")));
      v138[4] = v113;
      v137[5] = CFSTR("errorItemsProcessed");
      v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", -[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed")));
      v138[5] = v114;
      v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v138, v137, 6));
      -[AAFAnalyticsEventSecurity addMetrics:](v122, "addMetrics:", v115);

      if (-[CKKSIncomingQueueOperation pendingClassAEntries](self, "pendingClassAEntries"))
        v116 = 0;
      else
        v116 = -[CKKSIncomingQueueOperation missingKey](self, "missingKey") ^ 1;
      v50 = v121;
      v56 = obj;
      v117 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      v55 = v122;
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v122, v116, v117);

      v118 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "overallLaunch"));
      objc_msgSend(v119, "addEvent:", CFSTR("incoming-processing-complete"));

      goto LABEL_72;
    }
    v79 = v78;
    v80 = *(_QWORD *)v127;
LABEL_51:
    v81 = 0;
    while (1)
    {
      if (*(_QWORD *)v127 != v80)
        objc_enumerationMutation(v125);
      v82 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v81);
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "launch"));
      objc_msgSend(v83, "addEvent:", CFSTR("incoming-processed"));

      v84 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      if (v84)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "zoneID"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "zoneName"));
        objc_msgSend(v57, "logRecoverableError:forEvent:zoneName:withAttributes:", v85, CFSTR("CKKSEventProcessIncomingQueueClassC"), v87, 0);

        v88 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "lockStateTracker"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
        v91 = objc_msgSend(v89, "isLockedError:", v90);

        if ((v91 & 1) == 0)
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "zoneID"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "zoneName"));
          objc_msgSend(v57, "logRecoverableError:forEvent:zoneName:withAttributes:", v92, CFSTR("CKKSEventProcessIncomingQueueClassA"), v94, 0);

LABEL_59:
        }
      }
      else
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "zoneID"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "zoneName"));
        objc_msgSend(v57, "logSuccessForEvent:zoneName:", CFSTR("CKKSEventProcessIncomingQueueClassC"), v96);

        if (!-[CKKSIncomingQueueOperation pendingClassAEntries](self, "pendingClassAEntries"))
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "zoneID"));
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "zoneName"));
          objc_msgSend(v57, "logSuccessForEvent:zoneName:", CFSTR("CKKSEventProcessIncomingQueueClassA"), v93);
          goto LABEL_59;
        }
      }
      if (v79 == (id)++v81)
      {
        v79 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
        if (!v79)
          goto LABEL_62;
        goto LABEL_51;
      }
    }
  }
  v28 = v27;
  v29 = 0;
  v30 = *(_QWORD *)v134;
LABEL_9:
  v31 = 0;
  while (1)
  {
    if (*(_QWORD *)v134 != v30)
      objc_enumerationMutation(obj);
    v32 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "launch", v120));
    objc_msgSend(v33, "addEvent:", CFSTR("incoming-processing-begin"));

    v131 = 0;
    v132 = 0;
    if (!-[CKKSIncomingQueueOperation loadAndProcessEntries:withActionFilter:totalQueueEntries:](self, "loadAndProcessEntries:withActionFilter:totalQueueEntries:", v32, CFSTR("delete"), &v132))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
      v43 = sub_10000BDF4(CFSTR("ckksincoming"), v42);
      v44 = objc_claimAutoreleasedReturnValue(v43);

      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
        *(_DWORD *)buf = 138412290;
        v143 = (unint64_t)v45;
        v46 = "Early-exiting from IncomingQueueOperation (after processing deletes): %@";
        goto LABEL_30;
      }
LABEL_31:

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      v50 = v120;
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v120, 0, v49);

      goto LABEL_35;
    }
    v34 = v132;
    if (!-[CKKSIncomingQueueOperation loadAndProcessEntries:withActionFilter:totalQueueEntries:](self, "loadAndProcessEntries:withActionFilter:totalQueueEntries:", v32, 0, &v131))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
      v48 = sub_10000BDF4(CFSTR("ckksincoming"), v47);
      v44 = objc_claimAutoreleasedReturnValue(v48);

      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
        *(_DWORD *)buf = 138412290;
        v143 = (unint64_t)v45;
        v46 = "Early-exiting from IncomingQueueOperation (after processing all incoming entries): %@";
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);

      }
      goto LABEL_31;
    }
    v35 = v131;
    if (-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed")
      || -[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
      v37 = sub_10000BDF4(CFSTR("ckksincoming"), v36);
      v38 = objc_claimAutoreleasedReturnValue(v37);

      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = -[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed");
        v40 = -[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed");
        *(_DWORD *)buf = 134218240;
        v143 = v39;
        v144 = 2048;
        v145 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Processed %lu items in incoming queue (%lu errors)", buf, 0x16u);
      }

    }
    if (!-[CKKSIncomingQueueOperation fixMismatchedViewItems:](self, "fixMismatchedViewItems:", v32))
      break;
    v130[0] = _NSConcreteStackBlock;
    v29 += v34 + v35;
    v130[1] = 3221225472;
    v130[2] = sub_10007E0A8;
    v130[3] = &unk_1002E9418;
    v130[4] = v32;
    v130[5] = self;
    objc_msgSend(v124, "dispatchSyncWithSQLTransaction:", v130);
    if (v28 == (id)++v31)
    {
      v26 = obj;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
      if (!v28)
        goto LABEL_24;
      goto LABEL_9;
    }
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
  v52 = sub_10000BDF4(CFSTR("ckksincoming"), v51);
  v53 = objc_claimAutoreleasedReturnValue(v52);

  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Early-exiting from IncomingQueueOperation due to failure fixing mismatched items", buf, 2u);
  }

  v50 = v120;
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v120, 1, 0);
LABEL_35:
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
  v55 = v122;
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v122, 0, v54);
  v56 = obj;

  v57 = obj;
LABEL_72:

}

- (BOOL)loadAndProcessEntries:(id)a3 withActionFilter:(id)a4 totalQueueEntries:(int64_t *)a5
{
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[16];
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v18 = a3;
  v17 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 50;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_10007CD94;
  v31[4] = sub_10007CDA4;
  v32 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "databaseProvider"));

  v10 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (v34[3] == 50)
  {
    while (1)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10007DBF0;
      v20[3] = &unk_1002DC408;
      v20[4] = self;
      v11 = v18;
      v21 = v11;
      v23 = &v37;
      v24 = v31;
      v22 = v17;
      v25 = &v33;
      v26 = &v27;
      objc_msgSend(v9, "dispatchSyncWithSQLTransaction:", v20);
      if (*((_BYTE *)v38 + 24))
        break;

      if (v34[3] != 50)
      {
        v10 = v28[3];
        goto LABEL_5;
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
    v14 = sub_10000BDF4(CFSTR("ckksincoming"), v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Early-exiting from IncomingQueueOperation", buf, 2u);
    }

    *a5 = v28[3];
    v12 = 0;
  }
  else
  {
LABEL_5:
    *a5 = v10;
    v12 = 1;
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v12;
}

- (BOOL)fixMismatchedViewItems:(id)a3
{
  id v4;
  AAFAnalyticsEventSecurity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  BOOL v19;
  AAFAnalyticsEventSecurity *v21;
  _QWORD v22[5];
  id v23;
  uint8_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;

  v4 = a3;
  if (-[CKKSIncomingQueueOperation handleMismatchedViewItems](self, "handleMismatchedViewItems"))
  {
    v5 = [AAFAnalyticsEventSecurity alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    v21 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v5, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", &__NSDictionary0__struct, v8, CFSTR("com.apple.security.ckks.processIncomingQueue.fixMismatchedViewItems"), 0, &off_10030AF70, objc_msgSend(v9, "sendMetric"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
    v11 = sub_10000BDF4(CFSTR("ckksincoming"), v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handling policy-mismatched items", buf, 2u);
    }

    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 50;
    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x3032000000;
    v39 = sub_10007CD94;
    v40 = sub_10007CDA4;
    v41 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "databaseProvider"));

    while (v43[3] == 50)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10007D7F4;
      v22[3] = &unk_1002DC430;
      v24 = buf;
      v22[4] = self;
      v23 = v4;
      v25 = &v32;
      v26 = &v42;
      v27 = &v28;
      objc_msgSend(v14, "dispatchSyncWithSQLTransaction:", v22);

    }
    if (v29[3] >= 1)
    {
      v46 = CFSTR("numMismatchedItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:"));
      v47 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
      -[AAFAnalyticsEventSecurity addMetrics:](v21, "addMetrics:", v16);

      v17 = *((unsigned __int8 *)v33 + 24);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, v17 == 0, v18);

    }
    v19 = *((_BYTE *)v33 + 24) == 0;

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (void)_onqueueGenerateNewUUIDPersistentRefOnSecItem:(SecDbItem *)a3 viewState:(id)a4
{
  id v5;
  const __CFUUID *v6;
  const __CFData *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  CFTypeRef v12;
  CFTypeRef cf;
  CFUUIDBytes bytes;
  uint8_t buf[4];
  SecDbItem *v16;
  __int16 v17;
  CFTypeRef v18;

  v5 = a4;
  v6 = CFUUIDCreate(kCFAllocatorDefault);
  bytes = CFUUIDGetUUIDBytes(v6);
  v7 = CFDataCreate(kCFAllocatorDefault, &bytes.byte0, 16);
  cf = 0;
  sub_10001D918((uint64_t)a3, v7, (__CFString **)&cf);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
  v10 = sub_10000BDF4(CFSTR("ckksincoming"), v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v16 = a3;
    v17 = 2112;
    v18 = cf;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "set a new persistentref UUID for item %@: %@", buf, 0x16u);
  }

  if (v6)
    CFRelease(v6);
  if (v7)
    CFRelease(v7);
  v12 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v12);
  }
}

- (void)_onqueueHandleIQEChange:(id)a3 attributes:(id)a4 class:(const SecDbClass *)a5 viewState:(id)a6 sortedForThisView:(BOOL)a7 keyCache:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  const void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v25;

  v9 = a7;
  v14 = a3;
  v15 = a6;
  v16 = a8;
  cf = 0;
  v17 = sub_10001E9E8((uint64_t)a5, (const __CFDictionary *)a4, dword_1003414E0, (__CFString **)&cf);
  -[CKKSIncomingQueueOperation _onqueueGenerateNewUUIDPersistentRefOnSecItem:viewState:](self, "_onqueueGenerateNewUUIDPersistentRefOnSecItem:viewState:", v17, v15);
  if (v17)
    v18 = cf == 0;
  else
    v18 = 0;
  if (v18)
  {
    -[CKKSIncomingQueueOperation _onqueueHandleIQEChange:item:viewState:sortedForThisView:keyCache:](self, "_onqueueHandleIQEChange:item:viewState:sortedForThisView:keyCache:", v14, v17, v15, v9, v16);
    goto LABEL_10;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));
  v21 = sub_10000BDF4(CFSTR("ckksincoming"), v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);

  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v25 = cf;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to make SecDbItemRef out of attributes: %@", buf, 0xCu);
  }

  v17 = cf;
  if (cf)
  {
    cf = 0;
LABEL_10:
    CFRelease(v17);
  }

}

- (BOOL)_onqueueHandleIQEChange:(id)a3 item:(SecDbItem *)a4 viewState:(id)a5 sortedForThisView:(BOOL)a6 keyCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  const void *Value;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  uint64_t v73;
  const char *v74;
  BOOL v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  id *v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  uint64_t v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id obj;
  _QWORD v100[4];
  id v101;
  id v102;
  CKKSIncomingQueueOperation *v103;
  id v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t *v107;
  _BYTE *v108;
  uint64_t *v109;
  SecDbItem *v110;
  BOOL v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  char v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD v136[2];
  _QWORD v137[2];
  NSErrorUserInfoKey v138;
  const __CFString *v139;
  uint8_t v140[4];
  uint64_t v141;
  _BYTE buf[24];
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v132 = 0;
  v133 = &v132;
  v134 = 0x2020000000;
  v135 = 0;
  v126 = 0;
  v127 = &v126;
  v128 = 0x3032000000;
  v129 = sub_10007CD94;
  v130 = sub_10007CDA4;
  v131 = 0;
  if (sub_10001DA80(a4))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
    v17 = sub_10000BDF4(CFSTR("ckksincoming"), v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      *(_DWORD *)buf = 138412547;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = a4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Rejecting a tombstone item addition from CKKS(%@): %{private}@", buf, 0x16u);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contextID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v125 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry withItem:action:contextID:zoneID:keyCache:error:](CKKSOutgoingQueueEntry, "withItem:action:contextID:zoneID:keyCache:error:", a4, CFSTR("delete"), v21, v22, v14, &v125));
    v24 = v125;

    v124 = v24;
    objc_msgSend(v23, "saveToDatabase:", &v124);
    v25 = v124;

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "zoneName"));
      v28 = sub_10000BDF4(CFSTR("ckksincoming"), v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to save new deletion OQE: %@", buf, 0xCu);
      }

    }
    else
    {
      v123 = 0;
      objc_msgSend(v12, "deleteFromDatabase:", &v123);
      v56 = v123;
      if (v56)
      {
        v25 = v56;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "zoneName"));
        v59 = sub_10000BDF4(CFSTR("ckksincoming"), v58);
        v60 = objc_claimAutoreleasedReturnValue(v59);

        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v25;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "couldn't delete CKKSIncomingQueueEntry: %@", buf, 0xCu);
        }

        -[CKKSResultOperation setError:](self, "setError:", v25);
        -[CKKSIncomingQueueOperation setErrorItemsProcessed:](self, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
      }
      else
      {
        -[CKKSIncomingQueueOperation setSuccessfulItemsProcessed:](self, "setSuccessfulItemsProcessed:", (char *)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed") + 1);
        v25 = 0;
      }
    }
    -[CKKSIncomingQueueOperation setNewOutgoingEntries:](self, "setNewOutgoingEntries:", 1);

LABEL_44:
    v75 = 0;
    goto LABEL_45;
  }
  if (!sub_1001164E4(a4))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "zoneName"));
    v43 = sub_10000BDF4(CFSTR("ckksincoming"), v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);

    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      *(_DWORD *)buf = 138412547;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = a4;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Rejecting a multiuser item addition from CKKS(%@): %{private}@", buf, 0x16u);

    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "contextID"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v122 = 0;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry withItem:action:contextID:zoneID:keyCache:error:](CKKSOutgoingQueueEntry, "withItem:action:contextID:zoneID:keyCache:error:", a4, CFSTR("delete"), v47, v48, v14, &v122));
    v50 = v122;

    v121 = v50;
    objc_msgSend(v49, "saveToDatabase:", &v121);
    v51 = v121;

    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "zoneName"));
      v54 = sub_10000BDF4(CFSTR("ckksincoming"), v53);
      v55 = objc_claimAutoreleasedReturnValue(v54);

      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v51;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Unable to save new deletion OQE: %@", buf, 0xCu);
      }

    }
    else
    {
      v120 = 0;
      objc_msgSend(v12, "deleteFromDatabase:", &v120);
      v61 = v120;
      if (v61)
      {
        v51 = v61;
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "zoneName"));
        v64 = sub_10000BDF4(CFSTR("ckksincoming"), v63);
        v65 = objc_claimAutoreleasedReturnValue(v64);

        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v51;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "couldn't delete CKKSIncomingQueueEntry: %@", buf, 0xCu);
        }

        -[CKKSResultOperation setError:](self, "setError:", v51);
        -[CKKSIncomingQueueOperation setErrorItemsProcessed:](self, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
      }
      else
      {
        -[CKKSIncomingQueueOperation setSuccessfulItemsProcessed:](self, "setSuccessfulItemsProcessed:", (char *)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed") + 1);
        v51 = 0;
      }
    }
    -[CKKSIncomingQueueOperation setNewOutgoingEntries:](self, "setNewOutgoingEntries:", 1);

    goto LABEL_44;
  }
  v116 = 0;
  v117 = &v116;
  v118 = 0x2020000000;
  v119 = 0;
  v112 = 0;
  v113 = &v112;
  v114 = 0x2020000000;
  v115 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v143 = sub_10007CD94;
  v144 = sub_10007CDA4;
  v145 = (id)0xAAAAAAAAAAAAAAAALL;
  Value = CFDictionaryGetValue(a4->var6, kSecAttrModificationDate);
  v145 = (id)objc_claimAutoreleasedReturnValue(Value);
  v31 = (uint64_t)(v133 + 3);
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_10007CDAC;
  v100[3] = &unk_1002DC480;
  v110 = a4;
  v105 = &v132;
  v32 = v13;
  v101 = v32;
  v33 = v12;
  v111 = a6;
  v106 = &v116;
  v102 = v33;
  v103 = self;
  v104 = v14;
  v107 = &v126;
  v108 = buf;
  v109 = &v112;
  if (!sub_100011A30(1, 1, 0, v31, (uint64_t)v100) || v133[3])
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneName"));
    v36 = sub_10000BDF4(CFSTR("ckksincoming"), v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = v133[3];
      *(_DWORD *)v140 = 138412290;
      v141 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "couldn't process item from IncomingQueue: %@", v140, 0xCu);
    }

    v39 = v133[3];
    if (v39)
    {
      v40 = (void *)v127[5];
      v127[5] = v39;

      -[CKKSResultOperation setError:](self, "setError:", v127[5]);
    }
    else
    {
      v138 = NSLocalizedDescriptionKey;
      v139 = CFSTR("kc_with_dbt failed without error");
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1));
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -67671, v66));
      -[CKKSResultOperation setError:](self, "setError:", v67);

    }
    objc_msgSend(v33, "setState:", CFSTR("error"));
    v68 = (id *)(v127 + 5);
    obj = (id)v127[5];
    objc_msgSend(v33, "saveToDatabase:", &obj);
    objc_storeStrong(v68, obj);
    if (!v127[5])
      goto LABEL_35;
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "zoneName"));
    v71 = sub_10000BDF4(CFSTR("ckksincoming"), v70);
    v72 = objc_claimAutoreleasedReturnValue(v71);

    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v73 = v127[5];
    *(_DWORD *)v140 = 138412290;
    v141 = v73;
    v74 = "Couldn't save errored IQE to database: %@";
    goto LABEL_33;
  }
  if (v127[5])
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "zoneName"));
    v78 = sub_10000BDF4(CFSTR("ckksincoming"), v77);
    v72 = objc_claimAutoreleasedReturnValue(v78);

    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v79 = v127[5];
    *(_DWORD *)v140 = 138412290;
    v141 = v79;
    v74 = "Couldn't handle IQE, but why?: %@";
LABEL_33:
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, v74, v140, 0xCu);
LABEL_34:

    -[CKKSResultOperation setError:](self, "setError:", v127[5]);
    goto LABEL_35;
  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "zoneName"));
  v83 = sub_10000BDF4(CFSTR("ckksincoming"), v82);
  v84 = objc_claimAutoreleasedReturnValue(v83);

  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v140 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "Correctly processed an IQE; deleting",
      v140,
      2u);
  }

  v85 = (id *)(v127 + 5);
  v98 = (id)v127[5];
  objc_msgSend(v33, "deleteFromDatabase:", &v98);
  objc_storeStrong(v85, v98);
  if (v127[5])
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "zoneName"));
    v88 = sub_10000BDF4(CFSTR("ckksincoming"), v87);
    v89 = objc_claimAutoreleasedReturnValue(v88);

    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      v90 = v127[5];
      *(_DWORD *)v140 = 138412290;
      v141 = v90;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "couldn't delete CKKSIncomingQueueEntry: %@", v140, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v127[5]);
    -[CKKSIncomingQueueOperation setErrorItemsProcessed:](self, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
  }
  else
  {
    -[CKKSIncomingQueueOperation setSuccessfulItemsProcessed:](self, "setSuccessfulItemsProcessed:", (char *)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed") + 1);
  }
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v91, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v93 = v92;

    v136[0] = CFSTR("time");
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v93 * 1000.0)));
    v136[1] = CFSTR("view");
    v137[0] = v94;
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "zoneName"));
    v137[1] = v96;
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v137, v136, 2));
    +[SecCoreAnalytics sendEvent:event:](SecCoreAnalytics, "sendEvent:event:", CFSTR("com.apple.ckks.item.propagation"), v97);

  }
  if (!*((_BYTE *)v117 + 24))
  {
    v75 = *((_BYTE *)v113 + 24) == 0;
    goto LABEL_36;
  }
LABEL_35:
  v75 = 0;
LABEL_36:

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v116, 8);
LABEL_45:
  _Block_object_dispose(&v126, 8);

  _Block_object_dispose(&v132, 8);
  return v75;
}

- (void)_onqueueHandleIQEDelete:(id)a3 class:(const SecDbClass *)a4 viewState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const __CFDictionary *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const void **v23;
  int v24;
  __CFString **v25;
  __CFError *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  const __CFDictionary *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  const __CFDictionary *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  const __CFDictionary *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  const __CFDictionary *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  _QWORD v55[6];
  uint64_t v56;
  __CFString **v57;
  uint64_t v58;
  uint64_t v59;
  NSErrorUserInfoKey v60;
  const __CFString *v61;
  uint8_t buf[4];
  const __CFDictionary *v63;
  _QWORD v64[3];
  _QWORD v65[3];

  v8 = a3;
  v9 = a5;
  v56 = 0;
  v57 = (__CFString **)&v56;
  v58 = 0x2020000000;
  v59 = 0;
  v65[0] = a4->var0;
  v64[0] = kSecClass;
  v64[1] = kSecAttrUUID;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  v64[2] = kSecAttrSynchronizable;
  v65[1] = v10;
  v65[2] = &__kCFBooleanTrue;
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 3));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v14 = sub_10000BDF4(CFSTR("ckksincoming"), v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "trying to delete with query: %@", buf, 0xCu);
  }

  v16 = sub_1000112B0(v11, 0, -1, 0, v57 + 3);
  *(_BYTE *)(v16 + 155) = 1;
  if (v57[3])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
    v19 = sub_10000BDF4(CFSTR("ckksincoming"), v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (const __CFDictionary *)v57[3];
      *(_DWORD *)buf = 138412290;
      v63 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "couldn't create query: %@", buf, 0xCu);
    }

    v22 = (const __CFDictionary *)v57[3];
    -[CKKSResultOperation setError:](self, "setError:", v22);
    goto LABEL_7;
  }
  v23 = (const void **)v16;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10007CD78;
  v55[3] = &unk_1002DC4A8;
  v55[4] = &v56;
  v55[5] = v16;
  v24 = sub_100011A30(1, 1, 0, (uint64_t)(v57 + 3), (uint64_t)v55);
  v25 = v57;
  v26 = (__CFError *)v57[3];
  if (v26)
  {
    if (CFErrorGetCode(v26) != -25300)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneName"));
      v35 = sub_10000BDF4(CFSTR("ckksincoming"), v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (const __CFDictionary *)v57[3];
        *(_DWORD *)buf = 138412290;
        v63 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "couldn't delete item: %@", buf, 0xCu);
      }

      v22 = (const __CFDictionary *)v57[3];
      -[CKKSIncomingQueueOperation setErrorItemsProcessed:](self, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
      -[CKKSResultOperation setError:](self, "setError:", v22);
      sub_100011108(v23, 0);
      goto LABEL_7;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "zoneName"));
    v29 = sub_10000BDF4(CFSTR("ckksincoming"), v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = (const __CFDictionary *)v57[3];
      *(_DWORD *)buf = 138412290;
      v63 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "couldn't delete item (as it's already gone); this is okay: %@",
        buf,
        0xCu);
    }

    v25 = v57;
    v32 = v57[3];
    if (v32)
    {
      v57[3] = 0;
      CFRelease(v32);
      v24 = 1;
      v25 = v57;
    }
    else
    {
      v24 = 1;
    }
  }
  if (!sub_10001CAF8((uint64_t)v23, v24, (CFErrorRef *)v25 + 3) || v57[3])
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "zoneName"));
    v40 = sub_10000BDF4(CFSTR("ckksincoming"), v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);

    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = (const __CFDictionary *)v57[3];
      *(_DWORD *)buf = 138412290;
      v63 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "couldn't delete query: %@", buf, 0xCu);
    }

    v22 = (const __CFDictionary *)v57[3];
    if (v22)
    {
      -[CKKSResultOperation setError:](self, "setError:", v57[3]);
      goto LABEL_7;
    }
    v60 = NSLocalizedDescriptionKey;
    v61 = CFSTR("query_notify_and_destroy failed without error");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -67671, v43));
    -[CKKSResultOperation setError:](self, "setError:", v44);

LABEL_25:
    v22 = 0;
    goto LABEL_7;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "zoneName"));
  v47 = sub_10000BDF4(CFSTR("ckksincoming"), v46);
  v48 = objc_claimAutoreleasedReturnValue(v47);

  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Correctly processed an IQE; deleting", buf, 2u);
  }

  v54 = 0;
  objc_msgSend(v8, "deleteFromDatabase:", &v54);
  v49 = (const __CFDictionary *)v54;
  if (!v49)
  {
    -[CKKSIncomingQueueOperation setSuccessfulItemsProcessed:](self, "setSuccessfulItemsProcessed:", (char *)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed") + 1);
    goto LABEL_25;
  }
  v22 = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "zoneName"));
  v52 = sub_10000BDF4(CFSTR("ckksincoming"), v51);
  v53 = objc_claimAutoreleasedReturnValue(v52);

  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v22;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "couldn't delete CKKSIncomingQueueEntry: %@", buf, 0xCu);
  }

  -[CKKSResultOperation setError:](self, "setError:", v22);
  -[CKKSIncomingQueueOperation setErrorItemsProcessed:](self, "setErrorItemsProcessed:", (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
LABEL_7:

  _Block_object_dispose(&v56, 8);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 96, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)handleMismatchedViewItems
{
  return self->_handleMismatchedViewItems;
}

- (void)setHandleMismatchedViewItems:(BOOL)a3
{
  self->_handleMismatchedViewItems = a3;
}

- (unint64_t)successfulItemsProcessed
{
  return self->_successfulItemsProcessed;
}

- (void)setSuccessfulItemsProcessed:(unint64_t)a3
{
  self->_successfulItemsProcessed = a3;
}

- (unint64_t)errorItemsProcessed
{
  return self->_errorItemsProcessed;
}

- (void)setErrorItemsProcessed:(unint64_t)a3
{
  self->_errorItemsProcessed = a3;
}

- (BOOL)newOutgoingEntries
{
  return self->_newOutgoingEntries;
}

- (void)setNewOutgoingEntries:(BOOL)a3
{
  self->_newOutgoingEntries = a3;
}

- (BOOL)pendingClassAEntries
{
  return self->_pendingClassAEntries;
}

- (void)setPendingClassAEntries:(BOOL)a3
{
  self->_pendingClassAEntries = a3;
}

- (NSError)pendingClassAEntriesError
{
  return (NSError *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPendingClassAEntriesError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)missingKey
{
  return self->_missingKey;
}

- (void)setMissingKey:(BOOL)a3
{
  self->_missingKey = a3;
}

- (NSMutableSet)viewsToScan
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setViewsToScan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OctagonStateString)stateIfClassAItemsRemaining
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setStateIfClassAItemsRemaining:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateIfClassAItemsRemaining, 0);
  objc_storeStrong((id *)&self->_viewsToScan, 0);
  objc_storeStrong((id *)&self->_pendingClassAEntriesError, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

+ (id)decryptCKKSItemToAttributes:(id)a3 keyCache:(id)a4 ckksOperationalDependencies:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItemEncrypter decryptItemToDictionary:keyCache:error:](CKKSItemEncrypter, "decryptItemToDictionary:keyCache:error:", v8, a4, a6));
  v10 = objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, kSecAttrUUID);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "plaintextPCSServiceIdentifier"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "plaintextPCSServiceIdentifier"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, kSecAttrPCSPlaintextServiceIdentifier);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "plaintextPCSPublicKey"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "plaintextPCSPublicKey"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, kSecAttrPCSPlaintextPublicKey);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "plaintextPCSPublicIdentity"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "plaintextPCSPublicIdentity"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, kSecAttrPCSPlaintextPublicIdentity);

    }
    objc_msgSend(v10, "setValue:forKey:", &__kCFBooleanTrue, kSecAttrSynchronizable);
    v18 = v10;
  }

  return v10;
}

@end
