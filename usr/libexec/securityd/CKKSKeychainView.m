@implementation CKKSKeychainView

- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6 rateLimiter:(id)a7
{
  SecDbItem *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  int v40;
  SecDbItem *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  id v48;
  NSObject *v49;
  const void *v50;
  void *v51;
  void (**v52)(_QWORD, _QWORD, _QWORD);
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  BOOL v58;
  BOOL v59;
  int v60;
  int v61;
  int v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  const char *v67;
  NSObject *v68;
  uint32_t v69;
  void *v70;
  void *v71;
  id v72;
  SecDbItem *v73;
  const void *v74;
  unint64_t v75;
  __OpaqueSecDbConnection *v76;
  const void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  const __CFString *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  id v87;
  int v88;
  int v89;
  id obj;
  int obja;
  void *v92;
  __OpaqueSecDbConnection *v93;
  unint64_t v94;
  SecDbItem *v95;
  SecDbItem *v96;
  id v97;
  _QWORD v98[4];
  NSObject *v99;
  CKKSKeychainView *v100;
  id v101;
  _BYTE *v102;
  SecDbItem *v103;
  SecDbItem *v104;
  unint64_t v105;
  __OpaqueSecDbConnection *v106;
  char v107;
  char v108;
  char v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD block[7];
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  char v118;
  uint8_t v119[4];
  _BYTE v120[10];
  void *v121;
  _BYTE buf[24];
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  NSErrorUserInfoKey v126;
  void *v127;
  _BYTE v128[128];

  v97 = a7;
  if ((sub_10000BD64() & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v19 = sub_10000BDF4(CFSTR("ckks"), v18);
    v13 = objc_claimAutoreleasedReturnValue(v19);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skipping handleKeychainEventDbConnection due to disabled CKKS", buf, 2u);
    }
    goto LABEL_109;
  }
  v93 = a3;
  v94 = a4;
  v95 = a6;
  if (a5)
    v12 = a5;
  else
    v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(+[CKKSKey isItemKeyForKeychainView:](CKKSKey, "isItemKeyForKeychainView:", v12));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v15 = sub_10000BDF4(CFSTR("ckks"), v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v94;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Potential new key material from %@ (source %lu)", buf, 0x16u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    objc_msgSend(v17, "handleFlag:", CFSTR("key_process_requested"));

    goto LABEL_109;
  }
  if (a5)
    v20 = sub_10000BC78(a5);
  else
    v20 = 0;
  v21 = (int)v95;
  if (v95)
    v21 = sub_10000BC78(v95);
  if (((v20 | v21) & 1) == 0)
  {
    v32 = sub_10000BDF4(CFSTR("ckks"), 0);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "skipping sync of non-sync item (%d, %d)", buf, 0xEu);
    }
    goto LABEL_31;
  }
  v89 = v21;
  if (!sub_1001164E4(v12))
  {
    v34 = sub_10000BDF4(CFSTR("ckks"), 0);
    v33 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Ignoring syncable keychain item for non-primary account", buf, 2u);
    }
LABEL_31:

    goto LABEL_108;
  }
  v88 = v20;
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v22 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017A8F0;
  block[3] = &unk_1002ED5E8;
  block[5] = &v115;
  block[6] = v12;
  block[4] = self;
  dispatch_sync(v22, block);

  if (!*((_BYTE *)v116 + 24))
  {
    -[CKKSKeychainView notifyPasswordsOrPCSChangedForAddedItem:modified:deleted:](self, "notifyPasswordsOrPCSChangedForAddedItem:modified:deleted:", a5, v12, v95);
    goto LABEL_107;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "viewNameForItem:", v12));

  if (!v92)
  {
    v56 = sub_10000BDF4(CFSTR("ckks"), 0);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "No intended CKKS view for item; skipping: %{private}@",
        buf,
        0xCu);
    }

    -[CKKSKeychainView notifyPasswordsOrPCSChangedForAddedItem:modified:deleted:](self, "notifyPasswordsOrPCSChangedForAddedItem:modified:deleted:", a5, v12, v95);
    goto LABEL_106;
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allCKKSManagedViews"));

  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
  if (!v25)
    goto LABEL_28;
  v26 = *(_QWORD *)v111;
  while (2)
  {
    for (i = 0; i != v25; i = (char *)i + 1)
    {
      if (*(_QWORD *)v111 != v26)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)i);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "zoneID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneName"));
      v31 = objc_msgSend(v30, "isEqualToString:", v92);

      if ((v31 & 1) != 0)
      {
        v35 = v28;

        if (!v35)
          goto LABEL_42;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "zoneID"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "zoneName"));
        v38 = sub_10000BDF4(CFSTR("ckks"), v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);

        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412547;
          *(_QWORD *)&buf[4] = v92;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Routing item to zone %@: %{private}@", buf, 0x16u);
        }

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v123 = sub_100174EB0;
        v124 = sub_100174EC0;
        v125 = 0;
        if (a5)
        {
          v40 = sub_10001DA80(a5);
          v41 = v95;
          if (!v95)
          {
            v42 = 0;
            v43 = 0;
            v44 = 0;
            v45 = 1;
            v46 = 1;
            v47 = v89;
            goto LABEL_66;
          }
        }
        else
        {
          v40 = 0;
          v41 = v95;
          if (!v95)
          {
            v58 = 1;
            v44 = 0;
            v43 = 0;
LABEL_52:
            if (a5)
              v59 = v41 == 0;
            else
              v59 = 1;
            v42 = !v59;
            v45 = v42 ^ 1;
            v46 = v42 & ~v40 & v43;
            v47 = v89;
            if ((v46 & 1) == 0 && (v45 & 1) == 0)
              v46 = v88 & (v89 ^ 1);
            if (!v41)
              v58 = 0;
            if (v58)
            {
              if ((v42 & 1) == 0)
              {
                if ((v44 & 1) == 0)
                {
                  v61 = 0;
                  v60 = 1;
                  goto LABEL_83;
                }
                goto LABEL_79;
              }
              v60 = 1;
              goto LABEL_70;
            }
LABEL_66:
            if (v42 & v40 & (v43 ^ 1) | v45)
              v60 = v42 & v40 & (v43 ^ 1);
            else
              v60 = v47 & ~v88;
            if ((v42 & 1) == 0)
            {
              v62 = v40 ^ 1;
              if (v41)
                v62 = 1;
              if (!v62)
                v41 = a5;
              if (!v44)
              {
                v61 = 0;
                v60 |= v62 ^ 1;
                v46 &= v62;
                goto LABEL_83;
              }
LABEL_79:
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "zoneID"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "zoneName"));
              v65 = sub_10000BDF4(CFSTR("ckks"), v64);
              v66 = objc_claimAutoreleasedReturnValue(v65);

              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v119 = 67109376;
                *(_DWORD *)v120 = 1;
                *(_WORD *)&v120[4] = 1024;
                *(_DWORD *)&v120[6] = 1;
                v67 = "skipping syncing update of tombstone item (%d, %d)";
                v68 = v66;
                v69 = 14;
LABEL_87:
                _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, v67, v119, v69);
              }
LABEL_104:

              _Block_object_dispose(buf, 8);
              goto LABEL_105;
            }
LABEL_70:
            if ((v44 & 1) == 0)
            {
              v61 = (v46 | v60) ^ 1;
LABEL_83:
              if (!v60 || (v40 & 1) != 0)
              {
                obja = v61;
                v96 = v41;
                if (a5)
                  v73 = a5;
                else
                  v73 = v41;
                v74 = sub_10000C1D0(v73, kSecAttrAccessible);
                v66 = objc_claimAutoreleasedReturnValue(v74);
                v76 = v93;
                v75 = v94;
                if ((-[NSObject isEqualToString:](v66, "isEqualToString:", kSecAttrAccessibleWhenUnlocked) & 1) != 0|| (-[NSObject isEqualToString:](v66, "isEqualToString:", kSecAttrAccessibleAfterFirstUnlock) & 1) != 0|| (-[NSObject isEqualToString:](v66, "isEqualToString:", kSecAttrAccessibleAlwaysPrivate) & 1) != 0)
                {
                  if (!v94)
                  {
                    v77 = sub_100019204(a5, (uint64_t)&off_1002E9538, 0);
                    v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
                    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "zoneID"));
                    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "zoneName"));
                    v81 = sub_10000BDF4(CFSTR("ckks"), v80);
                    v82 = objc_claimAutoreleasedReturnValue(v81);

                    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                    {
                      v83 = CFSTR("deletion");
                      if (obja)
                        v83 = CFSTR("modification");
                      if (v46)
                        v83 = CFSTR("addition");
                      *(_DWORD *)v119 = 138412546;
                      *(_QWORD *)v120 = v83;
                      *(_WORD *)&v120[8] = 2112;
                      v121 = v78;
                      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Received an incoming %@ from SOS (%@)", v119, 0x16u);
                    }

                    v76 = v93;
                    v75 = v94;
                  }
                  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView databaseProvider](self, "databaseProvider"));
                  v98[0] = _NSConcreteStackBlock;
                  v98[1] = 3221225472;
                  v98[2] = sub_10017A9F0;
                  v98[3] = &unk_1002E9590;
                  v99 = v35;
                  v100 = self;
                  v107 = v46;
                  v102 = buf;
                  v103 = a5;
                  v108 = v60;
                  v109 = obja;
                  v104 = v96;
                  v105 = v75;
                  v101 = v97;
                  v106 = v76;
                  objc_msgSend(v84, "dispatchSyncWithConnection:readWriteTxion:block:", v76, 1, v98);

                  v85 = v99;
                }
                else
                {
                  v86 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
                  v87 = sub_10000BDF4(CFSTR("ckks"), v86);
                  v85 = objc_claimAutoreleasedReturnValue(v87);

                  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v119 = 138412290;
                    *(_QWORD *)v120 = v66;
                    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "skipping sync of device-bound(%@) item", v119, 0xCu);
                  }
                }

                goto LABEL_104;
              }
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "zoneID"));
              v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "zoneName"));
              v72 = sub_10000BDF4(CFSTR("ckks"), v71);
              v66 = objc_claimAutoreleasedReturnValue(v72);

              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v119 = 0;
                v67 = "Client has asked for an item deletion to not sync. Keychain is now out of sync with account";
                v68 = v66;
                v69 = 2;
                goto LABEL_87;
              }
              goto LABEL_104;
            }
            goto LABEL_79;
          }
        }
        v43 = sub_10001DA80(v41);
        v44 = v40 & v43;
        v58 = a5 == 0;
        goto LABEL_52;
      }
    }
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
    if (v25)
      continue;
    break;
  }
LABEL_28:

LABEL_42:
  v48 = sub_10000BDF4(CFSTR("ckks"), 0);
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    *(_QWORD *)&buf[4] = v92;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, skipping: %{private}@", buf, 0x16u);
  }

  v50 = sub_100019204(v12, (uint64_t)&off_1002E9538, 0);
  v35 = (id)objc_claimAutoreleasedReturnValue(v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v52 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "claimCallbackForUUID:", v35));

  if (v52)
  {
    v126 = NSLocalizedDescriptionKey;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No syncing view for '%@'"), v92));
    v127 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 11, v54));
    ((void (**)(_QWORD, _QWORD, void *))v52)[2](v52, 0, v55);

  }
LABEL_105:

LABEL_106:
LABEL_107:
  _Block_object_dispose(&v115, 8);
LABEL_108:
  v13 = 0;
LABEL_109:

}

- (CKKSKeychainView)initWithContainer:(id)a3 contextID:(id)a4 activeAccount:(id)a5 accountTracker:(id)a6 lockStateTracker:(id)a7 reachabilityTracker:(id)a8 savedTLKNotifier:(id)a9 cloudKitClassDependencies:(id)a10 personaAdapter:(id)a11 accountsAdapter:(id)a12 cuttlefishAdapter:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  CKKSKeychainView *v24;
  CKKSKeychainView *v25;
  NSString *zoneName;
  uint64_t v27;
  CKKSResultOperation *accountLoggedInDependency;
  void *v29;
  id v30;
  const char *v31;
  dispatch_queue_attr_t v32;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *queue;
  NSOperationQueue *v36;
  NSOperationQueue *operationQueue;
  CKKSSecDbAdapter *v38;
  CKKSSecDbAdapter *databaseProvider;
  CKKSCondition *v40;
  CKKSCondition *loggedIn;
  CKKSCondition *v42;
  CKKSCondition *loggedOut;
  CKKSCondition *v44;
  CKKSCondition *accountStateKnown;
  CKKSCondition *v46;
  CKKSCondition *trustStatusKnown;
  uint64_t v48;
  NSHashTable *outgoingQueueOperations;
  NSArray *currentTrustStates;
  NSMutableSet *resyncRecordsSeen;
  const __CFString *v52;
  OctagonStateMachine *v53;
  id v54;
  id v55;
  OctagonStateMachine *v56;
  OctagonStateMachine *stateMachine;
  uint64_t v58;
  uint64_t v59;
  CKKSNearFutureScheduler *v60;
  void *v61;
  CKKSNearFutureScheduler *v62;
  CKKSNearFutureScheduler *outgoingQueueOperationScheduler;
  CKKSNearFutureScheduler *v64;
  void *v65;
  CKKSNearFutureScheduler *v66;
  CKKSNearFutureScheduler *outgoingQueuePriorityOperationScheduler;
  void *v68;
  id v69;
  CKKSCondition *v70;
  CKKSCondition *policyLoaded;
  CKKSOperationDependencies *v72;
  void *v73;
  void *v74;
  CKKSOperationDependencies *v75;
  CKKSOperationDependencies *operationDependencies;
  CKKSZoneChangeFetcher *v77;
  id v78;
  CKKSReachabilityTracker *reachabilityTracker;
  void *v80;
  CKKSZoneChangeFetcher *v81;
  CKKSZoneChangeFetcher *zoneChangeFetcher;
  void *v83;
  id v84;
  AAFAnalyticsEventSecurity *v85;
  void *v86;
  AAFAnalyticsEventSecurity *v87;
  uint64_t v89;
  id *p_container;
  id v92;
  __CFString *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  id location;
  objc_super v110;

  v18 = a3;
  v19 = a4;
  v101 = a5;
  v92 = a6;
  v20 = a6;
  v102 = a7;
  v104 = a8;
  v21 = a9;
  v103 = a10;
  v100 = a11;
  v22 = v18;
  v23 = v19;
  v97 = a12;
  v96 = a13;
  v110.receiver = self;
  v110.super_class = (Class)CKKSKeychainView;
  v24 = -[CKKSKeychainView init](&v110, "init");
  v25 = v24;
  if (v24)
  {
    v95 = v21;
    v99 = v20;
    p_container = (id *)&v24->_container;
    objc_storeStrong((id *)&v24->_container, a3);
    objc_storeStrong((id *)&v25->_accountTracker, v92);
    objc_storeStrong((id *)&v25->_reachabilityTracker, a8);
    objc_storeStrong((id *)&v25->_lockStateTracker, a7);
    objc_storeStrong((id *)&v25->_cloudKitClassDependencies, a10);
    objc_storeStrong((id *)&v25->_personaAdapter, a11);
    objc_storeStrong((id *)&v25->_accountsAdapter, a12);
    zoneName = v25->_zoneName;
    v25->_zoneName = (NSString *)CFSTR("all");

    *(_WORD *)&v25->_halted = 0;
    v25->_accountStatus = 0;
    v27 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView createAccountLoggedInDependency:](v25, "createAccountLoggedInDependency:", CFSTR("CloudKit account logged in.")));
    accountLoggedInDependency = v25->_accountLoggedInDependency;
    v25->_accountLoggedInDependency = (CKKSResultOperation *)v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "containerIdentifier"));
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKKSQueue.%@.%@"), v29, v19)));
    v31 = (const char *)objc_msgSend(v30, "UTF8String");
    v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = dispatch_queue_create(v31, v33);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v34;

    v36 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v25->_operationQueue;
    v25->_operationQueue = v36;

    v38 = -[CKKSSecDbAdapter initWithQueue:]([CKKSSecDbAdapter alloc], "initWithQueue:", v25->_queue);
    databaseProvider = v25->_databaseProvider;
    v25->_databaseProvider = v38;

    v40 = objc_alloc_init(CKKSCondition);
    loggedIn = v25->_loggedIn;
    v25->_loggedIn = v40;

    v42 = objc_alloc_init(CKKSCondition);
    loggedOut = v25->_loggedOut;
    v25->_loggedOut = v42;

    v44 = objc_alloc_init(CKKSCondition);
    accountStateKnown = v25->_accountStateKnown;
    v25->_accountStateKnown = v44;

    v25->_initiatedLocalScan = 0;
    v25->_trustStatus = 0;
    v46 = objc_alloc_init(CKKSCondition);
    trustStatusKnown = v25->_trustStatusKnown;
    v25->_trustStatusKnown = v46;

    v48 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    outgoingQueueOperations = v25->_outgoingQueueOperations;
    v25->_outgoingQueueOperations = (NSHashTable *)v48;

    currentTrustStates = v25->_currentTrustStates;
    v25->_currentTrustStates = (NSArray *)&__NSArray0__struct;

    resyncRecordsSeen = v25->_resyncRecordsSeen;
    v25->_resyncRecordsSeen = 0;

    v25->_firstManateeKeyFetched = 0;
    if ((objc_msgSend(v19, "isEqualToString:", &stru_1002EE888) & 1) != 0)
      v52 = CFSTR("ckks");
    else
      v52 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ckks-%@"), v19));
    v53 = [OctagonStateMachine alloc];
    if (qword_100340E98 != -1)
      dispatch_once(&qword_100340E98, &stru_1002DBB30);
    v54 = (id)qword_100340E90;
    if (qword_100340EA8 != -1)
      dispatch_once(&qword_100340EA8, &stru_1002DBB50);
    v55 = (id)qword_100340EA0;
    v56 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:](v53, "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:", v52, v54, v55, CFSTR("wait_for_ck_account_status"), v25->_queue, v25, CFSTR("com.apple.ckks.state"), v102, v104);
    stateMachine = v25->_stateMachine;
    v25->_stateMachine = v56;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v25);
    v93 = (__CFString *)v52;
    if (qword_100341048 != -1)
      dispatch_once(&qword_100341048, &stru_1002DCC20);
    v94 = v19;
    if (byte_100341050)
      v58 = 200000000;
    else
      v58 = 1000000000;
    if (byte_100341050)
      v59 = 200000000;
    else
      v59 = 30000000000;
    v60 = [CKKSNearFutureScheduler alloc];
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("outgoing-queue-scheduler")));
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_10017F74C;
    v107[3] = &unk_1002EB598;
    objc_copyWeak(&v108, &location);
    v62 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v60, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", v61, v58, v59, 0, 1003, v107);
    outgoingQueueOperationScheduler = v25->_outgoingQueueOperationScheduler;
    v25->_outgoingQueueOperationScheduler = v62;

    v64 = [CKKSNearFutureScheduler alloc];
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("outgoing-queue-priority-scheduler")));
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_10017F798;
    v105[3] = &unk_1002EB598;
    objc_copyWeak(&v106, &location);
    v66 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v64, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", v65, 500000000, 500000000, 0, 1003, v105);
    outgoingQueuePriorityOperationScheduler = v25->_outgoingQueuePriorityOperationScheduler;
    v25->_outgoingQueuePriorityOperationScheduler = v66;

    v23 = v19;
    v68 = v22;
    v69 = objc_msgSend(objc_alloc((Class)SecLaunchSequence), "initWithRocketName:", CFSTR("com.apple.security.ckks.launch"));
    objc_msgSend(v69, "addAttribute:value:", CFSTR("view"), CFSTR("global"));
    v70 = objc_alloc_init(CKKSCondition);
    policyLoaded = v25->_policyLoaded;
    v25->_policyLoaded = v70;

    v72 = [CKKSOperationDependencies alloc];
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_container, "privateCloudDatabase"));
    LOBYTE(v89) = 0;
    v75 = -[CKKSOperationDependencies initWithViewStates:contextID:activeAccount:ckdatabase:cloudKitClassDependencies:ckoperationGroup:flagHandler:overallLaunch:accountStateTracker:lockStateTracker:reachabilityTracker:peerProviders:databaseProvider:savedTLKNotifier:personaAdapter:sendMetric:](v72, "initWithViewStates:contextID:activeAccount:ckdatabase:cloudKitClassDependencies:ckoperationGroup:flagHandler:overallLaunch:accountStateTracker:lockStateTracker:reachabilityTracker:peerProviders:databaseProvider:savedTLKNotifier:personaAdapter:sendMetric:", v73, v94, v101, v74, v25->_cloudKitClassDependencies, 0, v25->_stateMachine, v69, v99, v25->_lockStateTracker, v104, &__NSArray0__struct, v25->_databaseProvider, v95, v100,
            v89);
    operationDependencies = v25->_operationDependencies;
    v25->_operationDependencies = v75;

    v77 = [CKKSZoneChangeFetcher alloc];
    v78 = objc_msgSend(v103, "fetchRecordZoneChangesOperationClass");
    reachabilityTracker = v25->_reachabilityTracker;
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "altDSID"));
    v81 = -[CKKSZoneChangeFetcher initWithContainer:fetchClass:reachabilityTracker:altDSID:sendMetric:](v77, "initWithContainer:fetchClass:reachabilityTracker:altDSID:sendMetric:", v68, v78, reachabilityTracker, v80, 0);
    zoneChangeFetcher = v25->_zoneChangeFetcher;
    v25->_zoneChangeFetcher = v81;

    v83 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonAPSReceiver receiverForNamedDelegatePort:apsConnectionClass:](OctagonAPSReceiver, "receiverForNamedDelegatePort:apsConnectionClass:", CFSTR("com.apple.securityd.aps"), objc_msgSend(v103, "apsConnectionClass")));
    v84 = objc_msgSend(v83, "registerCKKSReceiver:contextID:", v25->_zoneChangeFetcher, v94);
    v85 = [AAFAnalyticsEventSecurity alloc];
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "altDSID"));
    v87 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v85, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", &__NSDictionary0__struct, v86, CFSTR("com.apple.security.ckks.launchStart"), 0, &off_10030AF70, 1);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v87, 1, 0);
    objc_storeStrong((id *)&v25->_cuttlefishAdapter, a13);
    -[OctagonStateMachine startOperation](v25->_stateMachine, "startOperation");

    objc_destroyWeak(&v106);
    objc_destroyWeak(&v108);
    objc_destroyWeak(&location);

    v20 = v99;
    v21 = v95;
    v22 = v68;
  }

  return v25;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "views"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: cid:%@ state:%@ views:%@>"), v5, v7, v9, v11));

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "views"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: cid:%@ state:%@ views:%@ %p>"), v5, v7, v9, v11, self));

  return (NSString *)v12;
}

- (NSDictionary)stateConditions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stateConditions"));

  return (NSDictionary *)v3;
}

- (id)performInitializedOperation
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10017EBC0;
  v4[3] = &unk_1002EB5E8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("ckks-initialized-operation"), CFSTR("become_ready"), CFSTR("error"), v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)rpcResetLocal:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[16];
  id location;
  _QWORD v29[2];
  _QWORD v30[2];
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[7];

  v6 = a3;
  v23 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  v8 = sub_10000BDF4(CFSTR("ckksreset"), v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting local data reset", buf, 2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10017E9C4;
  v24[3] = &unk_1002E9440;
  objc_copyWeak(&v26, &location);
  v21 = v6;
  v25 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("set-zones"), CFSTR("resetlocal"), CFSTR("error"), v24));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v35[2] = CFSTR("fetchcomplete");
  v35[3] = CFSTR("process_key_hierarchy");
  v35[0] = CFSTR("ready");
  v35[1] = CFSTR("initialized");
  v35[4] = CFSTR("waitfortrust");
  v35[5] = CFSTR("loggedout");
  v35[6] = CFSTR("error");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
  v33 = CFSTR("resetlocal");
  v31 = CFSTR("initializing");
  v29[0] = CFSTR("initialized");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v29[1] = CFSTR("loggedout");
  v30[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v30[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v32 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v34 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:", CFSTR("local-reset"), v12, v18, v22, v23));

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v19;
}

- (id)rpcResetCloudKit:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  void *v27;
  void (**v28)(id, id);
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[16];
  id location;
  _QWORD v34[4];
  id v35;
  id v36;
  const __CFString *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  const __CFString *v43;
  void *v44;
  _QWORD v45[7];
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  void *v49;

  v26 = a3;
  v28 = (void (**)(id, id))a4;
  v36 = 0;
  LOBYTE(a4) = -[CKKSKeychainView waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:](self, "waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:", CFSTR("reset-cloudkit"), 0, 1, 1, &v36);
  v6 = v36;
  v27 = v6;
  if ((a4 & 1) != 0)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v8 = sub_10000BDF4(CFSTR("ckksreset"), v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting reset of CK zone (logged in)", buf, 2u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10017E734;
    v29[3] = &unk_1002E9440;
    objc_copyWeak(&v31, &location);
    v30 = v26;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("set-zones"), CFSTR("resetzone"), CFSTR("error"), v29));
    v48 = CFSTR("initializing");
    v46[0] = CFSTR("initialized");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
    v46[1] = CFSTR("loggedout");
    v47[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
    v47[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 2));
    v49 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v45[0] = CFSTR("ready");
    v45[1] = CFSTR("initialized");
    v45[2] = CFSTR("fetchcomplete");
    v45[3] = CFSTR("process_key_hierarchy");
    v45[4] = CFSTR("waitfortrust");
    v45[5] = CFSTR("loggedout");
    v45[6] = CFSTR("error");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));
    v43 = CFSTR("resetzone");
    v41[1] = CFSTR("resetzone");
    v42[0] = v13;
    v41[0] = CFSTR("resetlocal");
    v39[1] = CFSTR("resetzone");
    v40[0] = v13;
    v38 = v13;
    v39[0] = CFSTR("resetlocal");
    v37 = CFSTR("resetlocal");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    v40[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));
    v42[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));
    v44 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:", CFSTR("ckks-cloud-reset"), v16, v21, v25, v28));

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    v28[2](v28, v6);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10017E728;
    v34[3] = &unk_1002E9468;
    v35 = v27;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("fail"), v34));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    objc_msgSend(v23, "addOperation:", v22);

  }
  return v22;
}

- (void)keyStateMachineRequestProcess
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "handleFlag:", CFSTR("key_process_requested"));

}

- (void)_onqueuePokeKeyStateMachine
{
  NSObject *v3;
  id v4;

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v4, "_onqueuePokeStateMachine");

}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  CKKSLocalResetOperation *v16;
  void *v17;
  CKKSLocalResetOperation *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  CKKSLocalResetOperation *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  CKKSCreateCKZoneOperation *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CKKSLocalResetOperation *v46;
  const __CFString *v47;
  const __CFString *v48;
  CKKSFixupRefetchAllCurrentItemPointers *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  CKKSFixupRefetchAllCurrentItemPointers *v56;
  CKKSFixupLocalReloadOperation *v57;
  const __CFString *v58;
  CKKSFixupLocalReloadOperation *v59;
  void *v60;
  uint64_t v61;
  CKKSFixupResaveDeviceStateEntriesOperation *v62;
  CKKSFixupLocalReloadOperation *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  CKKSDeleteCKZoneOperation *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  CKKSLocalResetOperation *v78;
  void *v79;
  OctagonPendingFlag *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  NSObject *v88;
  CKKSNewTLKOperation *v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *j;
  void *v104;
  void *v105;
  id v106;
  NSObject *v107;
  void *v108;
  unsigned __int8 v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  NSObject *v114;
  void *v115;
  void *v116;
  id v117;
  NSObject *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  NSObject *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  CKKSProcessReceivedKeysOperation *v130;
  void *v131;
  CKKSProcessReceivedKeysOperation *v132;
  void *v133;
  id v134;
  NSObject *v135;
  void *v136;
  void *v137;
  id v138;
  NSObject *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  NSObject *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  unsigned __int8 v149;
  void *v150;
  id v151;
  NSObject *v152;
  void *v153;
  void *v154;
  void *v155;
  BOOL v156;
  void *v157;
  id v158;
  NSObject *v159;
  _BOOL4 v160;
  CKKSHealKeyHierarchyOperation *v161;
  void *v162;
  OctagonPendingFlag *v163;
  id v164;
  NSObject *v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  uint64_t v170;
  void *k;
  void *v172;
  id v173;
  void *v174;
  unsigned __int8 v175;
  id v176;
  NSObject *v177;
  CKKSNewTLKOperation *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  id v183;
  NSObject *v184;
  CKKSIncomingQueueOperation *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  NSObject *v193;
  CKKSScanLocalItemsOperation *v194;
  void *v195;
  CKKSReencryptOutgoingItemsOperation *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  id v201;
  uint64_t v202;
  void *i;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  CKKSOutgoingQueueOperation *v209;
  void *v210;
  void *v211;
  void *v212;
  id *v213;
  void *v214;
  id v215;
  void *v216;
  id obj;
  uint64_t v218;
  unsigned int v219;
  void *v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  _QWORD v225[4];
  id v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  _QWORD v231[4];
  id v232;
  id location;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  _QWORD v238[4];
  id v239;
  _BYTE v240[128];
  _BYTE buf[12];
  __int16 v242;
  unsigned int v243;
  _BYTE v244[128];
  _BYTE v245[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ck_account_logged_out")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ck_account_logged_out"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v13 = sub_10000BDF4(CFSTR("ckkskey"), v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CK account is not present", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v15, "setStateForActiveZones:", CFSTR("loggedout"));

    v16 = [CKKSLocalResetOperation alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v18 = -[CKKSLocalResetOperation initWithDependencies:intendedState:errorState:](v16, "initWithDependencies:intendedState:errorState:", v17, CFSTR("loggedout"), CFSTR("error"));

    goto LABEL_35;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ck_zone_missing")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ck_zone_missing"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v19, "setStateForActiveZones:", CFSTR("initializing"));

    v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("ck-zone-missing"), CFSTR("resetlocal")));
LABEL_34:
    v18 = (CKKSLocalResetOperation *)v20;
    goto LABEL_35;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ck_change_token_expired")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ck_change_token_expired"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v21, "setStateForActiveZones:", CFSTR("initializing"));

    v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("ck-token-expired"), CFSTR("resetlocal")));
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("loggedout")))
  {
    if ((objc_msgSend(v9, "_onqueueContains:", CFSTR("ck_account_logged_in")) & 1) != 0
      || (id)-[CKKSKeychainView accountStatus](self, "accountStatus") == (id)1)
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ck_account_logged_in"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v23 = sub_10000BDF4(CFSTR("ckkskey"), v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "CloudKit account now present", buf, 2u);
      }
LABEL_14:

      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("ck-sign-in"), CFSTR("initializing")));
      goto LABEL_34;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v32, "setStateForAllViews:", CFSTR("loggedout"));

    goto LABEL_27;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("wait_for_ck_account_status")))
  {
    if ((objc_msgSend(v9, "_onqueueContains:", CFSTR("ck_account_logged_in")) & 1) != 0
      || (id)-[CKKSKeychainView accountStatus](self, "accountStatus") == (id)1)
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ck_account_logged_in"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v26 = sub_10000BDF4(CFSTR("ckkskey"), v25);
      v24 = objc_claimAutoreleasedReturnValue(v26);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "CloudKit account now present", buf, 2u);
      }
      goto LABEL_14;
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ck_account_logged_out")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ck_account_logged_out"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v35 = sub_10000BDF4(CFSTR("ckkskey"), v34);
      v29 = objc_claimAutoreleasedReturnValue(v35);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No account available", buf, 2u);
      }
LABEL_25:

      v30 = [CKKSLocalResetOperation alloc];
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v18 = -[CKKSLocalResetOperation initWithDependencies:intendedState:errorState:](v30, "initWithDependencies:intendedState:errorState:", v31, CFSTR("loggedout"), CFSTR("error"));

      goto LABEL_35;
    }
LABEL_52:
    v18 = 0;
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("initializing")))
  {
    if ((id)-[CKKSKeychainView accountStatus](self, "accountStatus") == (id)3)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v28 = sub_10000BDF4(CFSTR("ckkskey"), v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "CloudKit account is missing. Departing!", buf, 2u);
      }
      goto LABEL_25;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v36, "operateOnAllViews");

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v37, "setStateForAllViews:", CFSTR("initializing"));

    v38 = [CKKSCreateCKZoneOperation alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v18 = -[CKKSCreateCKZoneOperation initWithDependencies:intendedState:errorState:](v38, "initWithDependencies:intendedState:errorState:", v39, CFSTR("initialized"), CFSTR("zonecreationfailed"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "cloudkitRetryAfter"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "operationDependency"));
    -[CKKSLocalResetOperation addNullableDependency:](v18, "addNullableDependency:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "cloudkitRetryAfter"));
    goto LABEL_41;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("initialized")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("new_priority_views"))
      && (id)-[CKKSKeychainView trustStatus](self, "trustStatus") == (id)1)
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("new_priority_views"));
      -[CKKSKeychainView _onqueuePrioritizePriorityViews](self, "_onqueuePrioritizePriorityViews");
    }
    v20 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView performInitializedOperation](self, "performInitializedOperation"));
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("error")))
  {
    if (!objc_msgSend(v9, "_onqueueContains:", CFSTR("ck_account_logged_in")))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v53 = sub_10000BDF4(CFSTR("ckkskey"), v52);
      v54 = objc_claimAutoreleasedReturnValue(v53);

      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Staying in error state %@", buf, 0xCu);
      }

      goto LABEL_52;
    }
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ck_account_logged_in"));
    v46 = [CKKSLocalResetOperation alloc];
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v47 = CFSTR("initializing");
    v48 = CFSTR("error");
    goto LABEL_46;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fixup_fetch_cip")))
  {
    v49 = [CKKSFixupRefetchAllCurrentItemPointers alloc];
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v51 = objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("fixup")));
LABEL_55:
    v55 = (void *)v51;
    v56 = -[CKKSFixupRefetchAllCurrentItemPointers initWithOperationDependencies:ckoperationGroup:](v49, "initWithOperationDependencies:ckoperationGroup:", v50, v51);
LABEL_56:
    v18 = (CKKSLocalResetOperation *)v56;

LABEL_57:
    -[CKKSKeychainView setLastFixupOperation:](self, "setLastFixupOperation:", v18);
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fixup_fetch_tlkshares")))
  {
    v49 = [CKKSFixupFetchAllTLKShares alloc];
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v51 = objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("fixup")));
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fixup_local_reload")))
  {
    v57 = [CKKSFixupLocalReloadOperation alloc];
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("fixup")));
    v58 = CFSTR("fixup_resave_cdse");
    v59 = v57;
    v60 = v50;
    v61 = 3;
LABEL_60:
    v56 = -[CKKSFixupLocalReloadOperation initWithOperationDependencies:fixupNumber:ckoperationGroup:entering:](v59, "initWithOperationDependencies:fixupNumber:ckoperationGroup:entering:", v60, v61, v55, v58);
    goto LABEL_56;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fixup_resave_cdse")))
  {
    v62 = [CKKSFixupResaveDeviceStateEntriesOperation alloc];
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v18 = -[CKKSFixupResaveDeviceStateEntriesOperation initWithOperationDependencies:](v62, "initWithOperationDependencies:", v50);
    goto LABEL_57;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fixup_delete_tombstones")))
  {
    v63 = [CKKSFixupLocalReloadOperation alloc];
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("fixup")));
    v58 = CFSTR("initialized");
    v59 = v63;
    v60 = v50;
    v61 = 5;
    goto LABEL_60;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("resetzone")))
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v65 = sub_10000BDF4(CFSTR("ckkskey"), v64);
    v66 = objc_claimAutoreleasedReturnValue(v65);

    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "views"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v68;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Deleting the CloudKit Zones for %@", buf, 0xCu);

    }
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v69, "setStateForActiveZones:", CFSTR("resetzone"));

    v70 = [CKKSDeleteCKZoneOperation alloc];
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v18 = -[CKKSDeleteCKZoneOperation initWithDependencies:intendedState:errorState:](v70, "initWithDependencies:intendedState:errorState:", v71, CFSTR("resetlocal"), CFSTR("resetzone"));

    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("zone_deletion_failed_due_to_network_error")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("zone_deletion")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("zone_deletion"));
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("recover-from-zone-deletion-network-failure"), CFSTR("resetzone")));
      goto LABEL_34;
    }
    v80 = -[OctagonPendingFlag initWithFlag:conditions:delayInSeconds:]([OctagonPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("zone_deletion"), 2, 0.2);
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    goto LABEL_77;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("resetlocal")))
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v73 = sub_10000BDF4(CFSTR("ckkskey"), v72);
    v74 = objc_claimAutoreleasedReturnValue(v73);

    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "views"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v76;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Resetting local data for %@", buf, 0xCu);

    }
    -[CKKSKeychainView setLastNewTLKOperation:](self, "setLastNewTLKOperation:", 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v77, "setStateForActiveZones:", CFSTR("initializing"));

    v78 = [CKKSLocalResetOperation alloc];
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v18 = -[CKKSLocalResetOperation initWithDependencies:intendedState:errorState:](v78, "initWithDependencies:intendedState:errorState:", v79, CFSTR("initializing"), CFSTR("error"));

    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("zonecreationfailed")))
  {
    v18 = (CKKSLocalResetOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("recover-from-cloudkit-failure"), CFSTR("initializing")));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "cloudkitRetryAfter"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "operationDependency"));
    -[CKKSLocalResetOperation addNullableDependency:](v18, "addNullableDependency:", v85);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "cloudkitRetryAfter"));
LABEL_41:
    v45 = v44;
    objc_msgSend(v44, "trigger");

LABEL_42:
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("zone_creation_failed_due_to_network_error")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("zone_creation")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("zone_creation"));
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("recover-from-zone-creation-network-failure"), CFSTR("initializing")));
      goto LABEL_34;
    }
    v80 = -[OctagonPendingFlag initWithFlag:conditions:delayInSeconds:]([OctagonPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("zone_creation"), 2, 0.2);
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
LABEL_77:
    v82 = v81;
    objc_msgSend(v81, "_onqueueHandlePendingFlagLater:", v80);

    goto LABEL_52;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("lose_trust")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("trusted_operation_begin")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("trusted_operation_begin"));
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("begin-trusted-operation"), CFSTR("initialized")));
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView loseTrustOperation:](self, "loseTrustOperation:", CFSTR("waitfortrust")));
    }
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("waitfortrust")))
  {
    if ((id)-[CKKSKeychainView trustStatus](self, "trustStatus") == (id)1)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v87 = sub_10000BDF4(CFSTR("ckkskey"), v86);
      v88 = objc_claimAutoreleasedReturnValue(v87);

      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Beginning trusted state machine operation", buf, 2u);
      }

      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("begin-trusted-operation"), CFSTR("initialized")));
      goto LABEL_34;
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("fetch_requested")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("fetch_requested"));
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("fetch-requested"), CFSTR("begin_fetch")));
      goto LABEL_34;
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("key_process_requested")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("key_process_requested"));
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("begin-trusted-operation"), CFSTR("process_key_hierarchy")));
      goto LABEL_34;
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("key_set")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("key_set"));
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("provide-key-set"), CFSTR("provide_key_hieararchy_untrusted")));
      goto LABEL_34;
    }
LABEL_27:
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("24_hr_notification")))
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("24_hr_notification"));
    goto LABEL_52;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("provide_key_hieararchy")))
  {
    v89 = [CKKSNewTLKOperation alloc];
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView lastNewTLKOperation](self, "lastNewTLKOperation"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "keysets"));
    v93 = CFSTR("become_ready");
LABEL_99:
    v18 = -[CKKSNewTLKOperation initWithDependencies:rollTLKIfPresent:preexistingPendingKeySets:intendedState:errorState:](v89, "initWithDependencies:rollTLKIfPresent:preexistingPendingKeySets:intendedState:errorState:", v90, 0, v92, v93, CFSTR("error"));

    -[CKKSKeychainView setLastNewTLKOperation:](self, "setLastNewTLKOperation:", v18);
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("provide_key_hieararchy_untrusted")))
  {
    v89 = [CKKSNewTLKOperation alloc];
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView lastNewTLKOperation](self, "lastNewTLKOperation"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "keysets"));
    v93 = CFSTR("waitfortrust");
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("handle_all_views")))
  {
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v238[0] = _NSConcreteStackBlock;
    v238[1] = 3221225472;
    v238[2] = sub_10017E3B4;
    v238[3] = &unk_1002EB5E8;
    objc_copyWeak(&v239, (id *)buf);
    v18 = (CKKSLocalResetOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("handle-all-views"), CFSTR("initializing"), CFSTR("initializing"), v238));
    objc_destroyWeak(&v239);
    objc_destroyWeak((id *)buf);
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("become_ready")))
  {
    v20 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView becomeReadyOperation:](self, "becomeReadyOperation:", CFSTR("ready")));
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ready")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("trusted_operation_begin"));
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("device_unlocked")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("device_unlocked"));
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("key-state-after-unlock"), CFSTR("initialized")));
      goto LABEL_34;
    }
    if (-[CKKSKeychainView keyStateFullRefetchRequested](self, "keyStateFullRefetchRequested"))
    {
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v113 = sub_10000BDF4(CFSTR("ckkskey"), v112);
      v114 = objc_claimAutoreleasedReturnValue(v113);

      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = -[CKKSKeychainView keyStateFullRefetchRequested](self, "keyStateFullRefetchRequested");
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Kicking off a full key refetch based on request:%d", buf, 8u);
      }

      v115 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      objc_msgSend(v115, "setStateForActiveZones:", CFSTR("fetching"));

      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("full-refetch"), CFSTR("needrefetch")));
      goto LABEL_34;
    }
    if (!objc_msgSend(v9, "_onqueueContains:", CFSTR("fetch_requested")))
    {
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("key_process_requested")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("key_process_requested"));
        v121 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v122 = sub_10000BDF4(CFSTR("ckkskey"), v121);
        v123 = objc_claimAutoreleasedReturnValue(v122);

        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "Kicking off a key reprocess based on request", buf, 2u);
        }

        v124 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
        objc_msgSend(v124, "setStateForActiveCKKSManagedViews:", CFSTR("process_key_hierarchy"));

        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("key-process"), CFSTR("process_key_hierarchy")));
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("key_set")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("key_set"));
        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("provide-key-set"), CFSTR("provide_key_hieararchy")));
        goto LABEL_34;
      }
      if ((id)-[CKKSKeychainView trustStatus](self, "trustStatus") != (id)1)
      {
        v137 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v138 = sub_10000BDF4(CFSTR("ckkskey"), v137);
        v139 = objc_claimAutoreleasedReturnValue(v138);

        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "In ready, but there's no trust; going into waitfortrust",
            buf,
            2u);
        }

        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("trust-gone"), CFSTR("lose_trust")));
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("trusted_peers_changed")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("trusted_peers_changed"));
        v133 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v134 = sub_10000BDF4(CFSTR("ckkskey"), v133);
        v135 = objc_claimAutoreleasedReturnValue(v134);

        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "Received a nudge that the trusted peers set might have changed! Reprocessing.", buf, 2u);
        }

        v136 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
        objc_msgSend(v136, "setStateForActiveCKKSManagedViews:", CFSTR("process_key_hierarchy"));

        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("trusted-peers-changed"), CFSTR("process_key_hierarchy")));
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("check_queues")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("check_queues"));
        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("check-queues"), CFSTR("become_ready")));
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("24_hr_notification")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("24_hr_notification"));
        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("24-hr-check"), CFSTR("initialized")));
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("item_reencryption_needed")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("item_reencryption_needed"));
        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("reencrypt"), CFSTR("reencrypt_outgoing_items")));
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("process_incoming_queue")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("process_incoming_queue"));
        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("process-incoming"), CFSTR("process_incoming_queue")));
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("dropped_items")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("dropped_items"));
        v191 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v192 = sub_10000BDF4(CFSTR("ckkskey"), v191);
        v193 = objc_claimAutoreleasedReturnValue(v192);

        if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_DEFAULT, "Launching a scan operation to find dropped items", buf, 2u);
        }

        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("scan"), CFSTR("scan_local_items")));
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("process_outgoing_queue")))
      {
        if (objc_msgSend(v9, "_onqueueContains:", CFSTR("oqo_token")))
        {
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("process_outgoing_queue"));
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("oqo_token"));
          v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("oqo"), CFSTR("process_outgoing_queue")));
          goto LABEL_34;
        }
        v198 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperationScheduler](self, "outgoingQueueOperationScheduler"));
        objc_msgSend(v198, "trigger");

      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("new_priority_views")))
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("new_priority_views"));
      v236 = 0u;
      v237 = 0u;
      v234 = 0u;
      v235 = 0u;
      v199 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "views"));

      v201 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v234, v245, 16);
      if (v201)
      {
        v202 = *(_QWORD *)v235;
        do
        {
          for (i = 0; i != v201; i = (char *)i + 1)
          {
            if (*(_QWORD *)v235 != v202)
              objc_enumerationMutation(v200);
            objc_msgSend(*(id *)(*((_QWORD *)&v234 + 1) + 8 * (_QWORD)i), "launchComplete");
          }
          v201 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v234, v245, 16);
        }
        while (v201);
      }

      v204 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "overallLaunch"));
      objc_msgSend(v205, "launch");

      v206 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
      v207 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "overallLaunch"));
      objc_msgSend(v206, "noteLaunchSequence:", v208);

      goto LABEL_52;
    }
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("fetch_requested"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v117 = sub_10000BDF4(CFSTR("ckkskey"), v116);
    v118 = objc_claimAutoreleasedReturnValue(v117);

    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Kicking off a key refetch based on request", buf, 2u);
    }
LABEL_138:

    v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("fetch-requested"), CFSTR("begin_fetch")));
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("begin_fetch")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("fetch_complete"));
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("new_priority_views"))
      && (id)-[CKKSKeychainView trustStatus](self, "trustStatus") == (id)1)
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("new_priority_views"));
      -[CKKSKeychainView _onqueuePrioritizePriorityViews](self, "_onqueuePrioritizePriorityViews");
    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "currentFetchReasons"));
    v215 = objc_msgSend(v95, "copy");

    v96 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "currentFetchReasons"));
    objc_msgSend(v97, "removeAllObjects");

    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneChangeFetcher](self, "zoneChangeFetcher"));
    v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "requestSuccessfulFetchForManyReasons:", v215));

    v231[0] = _NSConcreteStackBlock;
    v231[1] = 3221225472;
    v231[2] = sub_10017E5AC;
    v231[3] = &unk_1002EB598;
    v213 = &v232;
    objc_copyWeak(&v232, &location);
    v216 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("post-fetch"), v231));
    objc_msgSend(v216, "addDependency:", v214);
    -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v216);
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "currentFetchReasons"));
    v219 = objc_msgSend(v100, "containsObject:", CFSTR("keyhierarchy"));

    v229 = 0u;
    v230 = 0u;
    v227 = 0u;
    v228 = 0u;
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "views"));

    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v244, 16);
    if (v102)
    {
      v218 = *(_QWORD *)v228;
      do
      {
        for (j = 0; j != v102; j = (char *)j + 1)
        {
          if (*(_QWORD *)v228 != v218)
            objc_enumerationMutation(obj);
          v104 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * (_QWORD)j);
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "zoneName", v213));
          v106 = sub_10000BDF4(CFSTR("fetch"), v105);
          v107 = objc_claimAutoreleasedReturnValue(v106);

          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v104;
            v242 = 1024;
            v243 = v219;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Current state is %@, khf: %d", buf, 0x12u);
          }

          if ((v219 & 1) == 0)
          {
            v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "viewKeyHierarchyState"));
            v109 = objc_msgSend(v108, "isEqualToString:", CFSTR("ready"));

            if ((v109 & 1) != 0)
              continue;
          }
          objc_msgSend(v104, "setViewKeyHierarchyState:", CFSTR("fetching"));
        }
        v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v244, 16);
      }
      while (v102);
    }

    v110 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "overallLaunch"));
    objc_msgSend(v111, "addEvent:", CFSTR("begin-fetch"));

    v18 = (CKKSLocalResetOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("waiting-for-fetch"), CFSTR("fetching")));
    objc_destroyWeak(v213);

    objc_destroyWeak(&location);
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fetching")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("fetch_complete")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("fetch_complete"));
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("fetch-complete"), CFSTR("fetchcomplete")));
      goto LABEL_34;
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("new_priority_views"))
      && (id)-[CKKSKeychainView trustStatus](self, "trustStatus") == (id)1)
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("new_priority_views"));
      -[CKKSKeychainView _onqueuePrioritizePriorityViews](self, "_onqueuePrioritizePriorityViews");
    }
    goto LABEL_52;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fetchcomplete")))
  {
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "overallLaunch"));
    objc_msgSend(v120, "addEvent:", CFSTR("fetch-complete"));

    v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("post-fetch-process"), CFSTR("process_key_hierarchy")));
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("process_key_hierarchy")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("fetch_requested")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("fetch_requested"));
      v125 = sub_10000BDF4(CFSTR("ckkskey"), 0);
      v118 = objc_claimAutoreleasedReturnValue(v125);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Kicking off a fetch based on request", buf, 2u);
      }
      goto LABEL_138;
    }
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("key_process_requested"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v126, "setStateForActiveCKKSManagedViews:", CFSTR("process_key_hierarchy"));

    v127 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v127, "setStateForActiveExternallyManagedViews:", CFSTR("ready"));

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "overallLaunch"));
    objc_msgSend(v129, "addEvent:", CFSTR("process_key_hierarchy"));

    v130 = [CKKSProcessReceivedKeysOperation alloc];
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v132 = -[CKKSProcessReceivedKeysOperation initWithDependencies:allowFullRefetchResult:intendedState:errorState:](v130, "initWithDependencies:allowFullRefetchResult:intendedState:errorState:", v131, -[CKKSKeychainView keyStateMachineRefetched](self, "keyStateMachineRefetched") ^ 1, CFSTR("check_zone_hierarchies"), CFSTR("error"));
LABEL_159:
    v18 = (CKKSLocalResetOperation *)v132;

    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("check_zone_hierarchies")))
  {
    if (-[CKKSKeychainView anyViewsInState:](self, "anyViewsInState:", CFSTR("unhealthy")))
    {
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("unhealthy"), CFSTR("unhealthy")));
      goto LABEL_34;
    }
    if (-[CKKSKeychainView anyViewsInState:](self, "anyViewsInState:", CFSTR("tlkmissing")))
    {
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("tlk-missing"), CFSTR("tlkmissing")));
      goto LABEL_34;
    }
    if (-[CKKSKeychainView anyViewsInState:](self, "anyViewsInState:", CFSTR("newtlksfailed")))
    {
      v140 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "currentFetchReasons"));
      objc_msgSend(v141, "addObject:", CFSTR("conflict"));

      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("newtlks-failed"), CFSTR("begin_fetch")));
      goto LABEL_34;
    }
    if (-[CKKSKeychainView anyViewsInState:](self, "anyViewsInState:", CFSTR("waitfortrust")))
    {
      v145 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "allViews"));
      v147 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "views"));
      v149 = objc_msgSend(v146, "isEqualToSet:", v148);

      if ((v149 & 1) == 0)
      {
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v225[0] = _NSConcreteStackBlock;
        v225[1] = 3221225472;
        v225[2] = sub_10017E5F8;
        v225[3] = &unk_1002EB5E8;
        objc_copyWeak(&v226, (id *)buf);
        v18 = (CKKSLocalResetOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("handle-all-views-trust-loss"), CFSTR("initializing"), CFSTR("initializing"), v225));
        objc_destroyWeak(&v226);
        objc_destroyWeak((id *)buf);
        goto LABEL_35;
      }
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("no-trust"), CFSTR("lose_trust")));
      goto LABEL_34;
    }
    if (-[CKKSKeychainView anyViewsInState:](self, "anyViewsInState:", CFSTR("needrefetch")))
    {
      v131 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewsInState:](self, "viewsInState:", CFSTR("needrefetch")));
      v155 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      objc_msgSend(v155, "operateOnSelectViews:", v131);

      v132 = (CKKSProcessReceivedKeysOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("reset-views"), CFSTR("needrefetch")));
      goto LABEL_159;
    }
    if (-[CKKSKeychainView anyViewsInState:](self, "anyViewsInState:", CFSTR("waitforunlock")))
    {
      v163 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("device_unlocked"), 1);
      objc_msgSend(v10, "_onqueueHandlePendingFlagLater:", v163);

    }
    if (-[CKKSKeychainView anyViewsInState:](self, "anyViewsInState:", CFSTR("waitfortlkcreation")))
    {
      v164 = sub_10000BDF4(CFSTR("ckkskey"), 0);
      v165 = objc_claimAutoreleasedReturnValue(v164);
      if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_DEFAULT, "Requesting TLK upload", buf, 2u);
      }

      v166 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView suggestTLKUpload](self, "suggestTLKUpload"));
      objc_msgSend(v166, "trigger");

    }
    v220 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v223 = 0u;
    v224 = 0u;
    v221 = 0u;
    v222 = 0u;
    v167 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "views"));

    v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v221, v240, 16);
    if (v169)
    {
      v170 = *(_QWORD *)v222;
      do
      {
        for (k = 0; k != v169; k = (char *)k + 1)
        {
          if (*(_QWORD *)v222 != v170)
            objc_enumerationMutation(v168);
          v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v221 + 1) + 8 * (_QWORD)k), "viewKeyHierarchyState"));
          objc_msgSend(v220, "addObject:", v172);

        }
        v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v221, v240, 16);
      }
      while (v169);
    }

    v173 = sub_1000B38C8();
    v174 = (void *)objc_claimAutoreleasedReturnValue(v173);
    v175 = objc_msgSend(v220, "isSubsetOfSet:", v174);

    if ((v175 & 1) == 0)
    {
      v176 = sub_10000BDF4(CFSTR("ckks"), 0);
      v177 = objc_claimAutoreleasedReturnValue(v176);
      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v220;
        _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "Misbehaving key states: %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("key_set")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("key_set"));
      v178 = [CKKSNewTLKOperation alloc];
      v179 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v180 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView lastNewTLKOperation](self, "lastNewTLKOperation"));
      v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "keysets"));
      v18 = -[CKKSNewTLKOperation initWithDependencies:rollTLKIfPresent:preexistingPendingKeySets:intendedState:errorState:](v178, "initWithDependencies:rollTLKIfPresent:preexistingPendingKeySets:intendedState:errorState:", v179, 0, v181, CFSTR("check_zone_hierarchies"), CFSTR("error"));

      -[CKKSKeychainView setLastNewTLKOperation:](self, "setLastNewTLKOperation:", v18);
    }
    else
    {
      v18 = (CKKSLocalResetOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("heal-tlk-shares"), CFSTR("heal_tlk_shares")));
    }

  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("tlkmissing")))
    {
      v20 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView tlkMissingOperation:](self, "tlkMissingOperation:", CFSTR("check_zone_hierarchies")));
      goto LABEL_34;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("heal_tlk_shares")))
    {
      v46 = [CKKSHealTLKSharesOperation alloc];
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v47 = CFSTR("process_incoming_queue");
      v48 = CFSTR("healtlksharesfailed");
LABEL_46:
      v18 = -[CKKSLocalResetOperation initWithDependencies:intendedState:errorState:](v46, "initWithDependencies:intendedState:errorState:", v43, v47, v48);
      goto LABEL_42;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("needrefetch")))
    {
      v142 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v143 = sub_10000BDF4(CFSTR("ckkskey"), v142);
      v144 = objc_claimAutoreleasedReturnValue(v143);

      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "Starting a key hierarchy full refetch", buf, 2u);
      }

      -[CKKSKeychainView setKeyStateMachineRefetched:](self, "setKeyStateMachineRefetched:", 1);
      -[CKKSKeychainView setKeyStateFullRefetchRequested:](self, "setKeyStateFullRefetchRequested:", 0);
      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("fetch-complete"), CFSTR("resetlocal")));
      goto LABEL_34;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("healtlksharesfailed")))
    {
      v150 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v151 = sub_10000BDF4(CFSTR("ckkskey"), v150);
      v152 = objc_claimAutoreleasedReturnValue(v151);

      if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "Creating new TLK shares didn't work. Attempting to refetch!", buf, 2u);
      }

      v153 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "currentFetchReasons"));
      objc_msgSend(v154, "addObject:", CFSTR("conflict"));

      v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("heal-tlks-failed"), CFSTR("begin_fetch")));
      goto LABEL_34;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("unhealthy")))
    {
      v156 = (id)-[CKKSKeychainView trustStatus](self, "trustStatus") == (id)1;
      v157 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v158 = sub_10000BDF4(CFSTR("ckkskey"), v157);
      v159 = objc_claimAutoreleasedReturnValue(v158);

      v160 = os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT);
      if (!v156)
      {
        if (v160)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "Looks like the key hierarchy is unhealthy, but we're untrusted.", buf, 2u);
        }

        v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("unhealthy-lacking-trust"), CFSTR("lose_trust")));
        goto LABEL_34;
      }
      if (v160)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "Looks like the key hierarchy is unhealthy. Launching fix.", buf, 2u);
      }

      v161 = [CKKSHealKeyHierarchyOperation alloc];
      v162 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v18 = -[CKKSHealKeyHierarchyOperation initWithDependencies:allowFullRefetchResult:intending:errorState:](v161, "initWithDependencies:allowFullRefetchResult:intending:errorState:", v162, -[CKKSKeychainView keyStateMachineRefetched](self, "keyStateMachineRefetched") ^ 1, CFSTR("check_zone_hierarchies"), CFSTR("error"));

    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("process_incoming_queue")))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("class_a_incoming_items_remaining")))
        {
          v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("iqo-errored"), CFSTR("become_ready")));
          goto LABEL_34;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("scan_local_items")))
        {
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("dropped_items"));
          v194 = [CKKSScanLocalItemsOperation alloc];
          v195 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
          v18 = -[CKKSScanLocalItemsOperation initWithDependencies:intending:errorState:ckoperationGroup:](v194, "initWithDependencies:intending:errorState:ckoperationGroup:", v195, CFSTR("become_ready"), CFSTR("error"), 0);

          -[CKKSKeychainView setInitiatedLocalScan:](self, "setInitiatedLocalScan:", 1);
          goto LABEL_35;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("reencrypt_outgoing_items")))
        {
          v196 = [CKKSReencryptOutgoingItemsOperation alloc];
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
          v18 = -[CKKSReencryptOutgoingItemsOperation initWithDependencies:intendedState:errorState:holdOperation:](v196, "initWithDependencies:intendedState:errorState:holdOperation:", v197, CFSTR("become_ready"), CFSTR("error"), 0);

          -[CKKSKeychainView setLastReencryptOutgoingItemsOperation:](self, "setLastReencryptOutgoingItemsOperation:", v18);
          goto LABEL_35;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("process_outgoing_queue")))
        {
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("process_outgoing_queue"));
          v209 = [CKKSOutgoingQueueOperation alloc];
          v210 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
          v18 = -[CKKSOutgoingQueueOperation initWithDependencies:intending:ckErrorState:errorState:](v209, "initWithDependencies:intending:ckErrorState:errorState:", v210, CFSTR("become_ready"), CFSTR("process_outgoing_queue_failed"), CFSTR("initialized"));

          v211 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView holdOutgoingQueueOperation](self, "holdOutgoingQueueOperation"));
          -[CKKSLocalResetOperation addNullableDependency:](v18, "addNullableDependency:", v211);

          v212 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
          -[CKKSLocalResetOperation linearDependencies:](v18, "linearDependencies:", v212);

          -[CKKSKeychainView setLastOutgoingQueueOperation:](self, "setLastOutgoingQueueOperation:", v18);
          goto LABEL_35;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("process_outgoing_queue_failed")))
        {
          v20 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("oqo-failure"), CFSTR("become_ready")));
          goto LABEL_34;
        }
        goto LABEL_52;
      }
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("process_incoming_queue"));
      v182 = objc_msgSend(v9, "_onqueueContains:", CFSTR("policy_fresh"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("policy_fresh"));
      if ((_DWORD)v182)
      {
        v183 = sub_10000BDF4(CFSTR("ckksincoming"), 0);
        v184 = objc_claimAutoreleasedReturnValue(v183);
        if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v184, OS_LOG_TYPE_DEFAULT, "Going to process the incoming queue with a fresh policy", buf, 2u);
        }

      }
      v185 = [CKKSIncomingQueueOperation alloc];
      v186 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v18 = -[CKKSIncomingQueueOperation initWithDependencies:intending:pendingClassAItemsRemainingState:errorState:handleMismatchedViewItems:](v185, "initWithDependencies:intending:pendingClassAItemsRemainingState:errorState:handleMismatchedViewItems:", v186, CFSTR("become_ready"), CFSTR("class_a_incoming_items_remaining"), CFSTR("become_ready"), v182);

      v187 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation](self, "resultsOfNextIncomingQueueOperationOperation"));
      if (v187)
      {
        v188 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation](self, "resultsOfNextIncomingQueueOperationOperation"));
        objc_msgSend(v188, "addSuccessDependency:", v18);

        v189 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation](self, "resultsOfNextIncomingQueueOperationOperation"));
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v189);

        -[CKKSKeychainView setResultsOfNextIncomingQueueOperationOperation:](self, "setResultsOfNextIncomingQueueOperationOperation:", 0);
      }
      -[CKKSKeychainView setLastIncomingQueueOperation:](self, "setLastIncomingQueueOperation:", v18);
      v190 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView holdIncomingQueueOperation](self, "holdIncomingQueueOperation"));
      -[CKKSLocalResetOperation addNullableDependency:](v18, "addNullableDependency:", v190);

    }
  }
LABEL_35:

  return v18;
}

- (id)becomeReadyOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017C4E4;
  v8[3] = &unk_1002E9440;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("become-ready"), v5, CFSTR("error"), v8));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)loseTrustOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017C2E4;
  v8[3] = &unk_1002E9440;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("lose-trust"), v5, CFSTR("error"), v8));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)anyViewsInState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "views"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "viewKeyHierarchyState"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (id)viewsInState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewsInState:", v4));

  return v6;
}

- (NSSet)viewList
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeManagedViews"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "zoneID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
        objc_msgSend(v3, "addObject:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return (NSSet *)v3;
}

- (NSDate)earliestFetchTime
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v5)
  {

LABEL_17:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    return (NSDate *)v7;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v24;
  obj = v4;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contextID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSZoneStateEntry contextID:zoneName:](CKKSZoneStateEntry, "contextID:zoneName:", v12, v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastFetchTime"));
      if (!v15)
      {
        v20 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));

        v7 = (void *)v20;
        v19 = obj;
        goto LABEL_14;
      }
      if (!v7
        || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastFetchTime")),
            v17 = objc_msgSend(v7, "compare:", v16),
            v16,
            v17 == (id)1))
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastFetchTime"));

        v7 = (void *)v18;
      }

    }
    v19 = obj;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
      continue;
    break;
  }
LABEL_14:

  if (!v7)
    goto LABEL_17;
  return (NSDate *)v7;
}

- (BOOL)allowOutOfBandFetch:(id *)a3
{
  void *v4;
  void *v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id obj;
  id v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];

  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allCKKSManagedViews"));

  obj = v5;
  v30 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (!v30)
  {
    v20 = 0;
    goto LABEL_22;
  }
  v31 = *(_QWORD *)v34;
  while (2)
  {
    for (i = 0; i != v30; i = (char *)i + 1)
    {
      if (*(_QWORD *)v34 != v31)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSZoneStateEntry contextID:zoneName:](CKKSZoneStateEntry, "contextID:zoneName:", v9, v10));

      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastFetchTime"));
      if (!v12
        || (v13 = (void *)v12,
            v14 = objc_msgSend(v11, "moreRecordsInCloudKit"),
            v13,
            (v14 & 1) != 0))
      {
        v20 = 1;
        goto LABEL_21;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contextID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v32 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSIncomingQueueEntry fetch:startingAtUUID:state:action:contextID:zoneID:error:](CKKSIncomingQueueEntry, "fetch:startingAtUUID:state:action:contextID:zoneID:error:", 50, 0, CFSTR("new"), 0, v16, v17, &v32));
      v19 = v32;

      v20 = v19 == 0;
      if (!v19)
      {
        if (!objc_msgSend(v18, "count"))
          goto LABEL_14;
        v26 = 0;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "zoneName"));
      v23 = sub_10000BDF4(CFSTR("ckks"), v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
        *(_DWORD *)buf = 138412546;
        v38 = v25;
        v39 = 2112;
        v40 = v19;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error fetching IQEs for zone %@: %@", buf, 0x16u);

      }
      if (a3)
      {
        v26 = objc_retainAutorelease(v19);
        *a3 = v26;
        goto LABEL_20;
      }
LABEL_14:

    }
    v20 = 0;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v30)
      continue;
    break;
  }
LABEL_22:

  return v20;
}

- (id)tlkMissingOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017BD34;
  v8[3] = &unk_1002E9440;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("tlk-missing"), v5, CFSTR("error"), v8));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)_onqueueOtherDevicesReportHavingTLKs:(id)a3 trustStates:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  BOOL v32;
  NSObject *v33;
  id v34;
  __int128 v35;
  id v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  _BOOL4 v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  id v89;
  BOOL v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  const char *v102;
  void *v103;
  id v104;
  __int128 v105;
  void *v106;
  NSObject *v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  NSObject *obj;
  void *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  uint8_t v140[128];
  uint8_t buf[4];
  NSObject *v142;
  __int16 v143;
  NSObject *v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];

  v112 = a3;
  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v7, "setDay:", -45);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v109 = v7;
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v6, 0));

  v9 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v9, "setDay:", -4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v108 = v9;
  v110 = (void *)v6;
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v9, v6, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v136 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)i);
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        v134 = 0u;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentTrustedPeers"));
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v132;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(_QWORD *)v132 != v21)
                objc_enumerationMutation(v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1)
                                                                                 + 8 * (_QWORD)j), "peerID"));
              objc_msgSend(v11, "addObject:", v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
          }
          while (v20);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
    }
    while (v14);
  }

  v24 = v112;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "currentTLKPointer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneID"));
  v130 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSDeviceStateEntry allInZone:error:](CKKSDeviceStateEntry, "allInZone:error:", v26, &v130));
  v28 = v130;

  v111 = v27;
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v30 = sub_10000BDF4(CFSTR("ckkskey"), v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);

    obj = v28;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v142 = v28;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error fetching device states: %@", buf, 0xCu);
    }
    v32 = 1;
    goto LABEL_57;
  }
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v33 = v27;
  v34 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v126, v145, 16);
  if (!v34)
    goto LABEL_48;
  v36 = v34;
  v37 = *(_QWORD *)v127;
  *(_QWORD *)&v35 = 138412546;
  v105 = v35;
  obj = v33;
  do
  {
    v38 = 0;
    do
    {
      if (*(_QWORD *)v127 != v37)
        objc_enumerationMutation(obj);
      v39 = *(NSObject **)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject circlePeerID](v39, "circlePeerID", v105));
      if (v40)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject circlePeerID](v39, "circlePeerID"));
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("spid-"), "stringByAppendingString:", v41));

      }
      else
      {
        v31 = 0;
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject circlePeerID](v39, "circlePeerID"));
      if ((objc_msgSend(v11, "containsObject:", v42) & 1) != 0
        || v31 && objc_msgSend(v11, "containsObject:", v31))
      {

      }
      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject octagonPeerID](v39, "octagonPeerID"));
        v44 = objc_msgSend(v11, "containsObject:", v43);

        if (!v44)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject storedCKRecord](v39, "storedCKRecord"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "modificationDate"));
          v56 = objc_msgSend(v55, "compare:", v113);

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
          v58 = sub_10000BDF4(CFSTR("ckkskey"), v57);
          v53 = objc_claimAutoreleasedReturnValue(v58);

          v59 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
          if (v56 != (id)-1)
          {
            if (v59)
            {
              v60 = objc_claimAutoreleasedReturnValue(-[NSObject circlePeerID](v39, "circlePeerID"));
              *(_DWORD *)buf = v105;
              v142 = v60;
              v143 = 2112;
              v144 = v39;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Device (%@) is not trusted, but very recent. Including in heuristic: %@", buf, 0x16u);

            }
            goto LABEL_33;
          }
          if (v59)
          {
            v61 = objc_claimAutoreleasedReturnValue(-[NSObject circlePeerID](v39, "circlePeerID"));
            *(_DWORD *)buf = v105;
            v142 = v61;
            v143 = 2112;
            v144 = v39;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Device (%@) is not trusted and from too long ago; ignoring device state (%@)",
              buf,
              0x16u);

          }
LABEL_38:

          goto LABEL_39;
        }
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject storedCKRecord](v39, "storedCKRecord"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "modificationDate"));
      v47 = objc_msgSend(v46, "compare:", v116);

      if (v47 == (id)-1)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v52 = sub_10000BDF4(CFSTR("ckkskey"), v51);
        v53 = objc_claimAutoreleasedReturnValue(v52);

        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v142 = v39;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Trusted device state (%@) is too old; ignoring",
            buf,
            0xCu);
        }
        goto LABEL_38;
      }
LABEL_33:
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject keyState](v39, "keyState"));
      if (objc_msgSend(v48, "isEqualToString:", CFSTR("ready")))
      {

LABEL_53:
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v73 = sub_10000BDF4(CFSTR("ckkskey"), v72);
        v74 = objc_claimAutoreleasedReturnValue(v73);

        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v142 = v39;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Other device (%@) has keys; it should send them to us",
            buf,
            0xCu);
        }

        v32 = 1;
        goto LABEL_56;
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject keyState](v39, "keyState"));
      v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("readypendingunlock"));

      if (v50)
        goto LABEL_53;
LABEL_39:

      v38 = (char *)v38 + 1;
    }
    while (v36 != v38);
    v33 = obj;
    v62 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v126, v145, 16);
    v36 = v62;
  }
  while (v62);
LABEL_48:

  v24 = v112;
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "currentTLKPointer"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "currentKeyUUID"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "currentTLKPointer"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "contextID"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "currentTLKPointer"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "zoneID"));
  v125 = 0;
  v68 = objc_claimAutoreleasedReturnValue(+[CKKSTLKShareRecord allForUUID:contextID:zoneID:error:](CKKSTLKShareRecord, "allForUUID:contextID:zoneID:error:", v63, v65, v67, &v125));
  v31 = v125;

  obj = v68;
  if (v31)
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v70 = sub_10000BDF4(CFSTR("ckkskey"), v69);
    v71 = objc_claimAutoreleasedReturnValue(v70);

    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v142 = v31;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Error fetching device states: %@", buf, 0xCu);
    }
    v32 = 0;
    goto LABEL_86;
  }
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v31 = v68;
  v79 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
  if (!v79)
  {
LABEL_71:

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v31 = v31;
    v91 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
    if (v91)
    {
      v92 = v91;
      v93 = *(_QWORD *)v118;
LABEL_73:
      v94 = 0;
      while (1)
      {
        if (*(_QWORD *)v118 != v93)
          objc_enumerationMutation(v31);
        v95 = *(NSObject **)(*((_QWORD *)&v117 + 1) + 8 * v94);
        v96 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject storedCKRecord](v95, "storedCKRecord"));
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "modificationDate"));
        v98 = objc_msgSend(v97, "compare:", v113);

        if (v98 == (id)1)
          break;
        if (v92 == (id)++v94)
        {
          v92 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
          if (v92)
            goto LABEL_73;
          goto LABEL_79;
        }
      }
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v104 = sub_10000BDF4(CFSTR("ckkskey"), v103);
      v71 = objc_claimAutoreleasedReturnValue(v104);

      if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        goto LABEL_85;
      *(_DWORD *)buf = 138412290;
      v142 = v95;
      v102 = "Untrusted TLK Share (%@) created very recently; other devices might have keys and should rejoin the circle "
             "(and send them to us)";
LABEL_84:
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, v102, buf, 0xCu);
      goto LABEL_85;
    }
LABEL_79:
    v32 = 0;
LABEL_56:
    v24 = v112;
LABEL_57:
    v76 = v109;
    v75 = v110;
    v77 = v108;
    goto LABEL_58;
  }
  v80 = v79;
  v81 = *(_QWORD *)v122;
  v107 = v31;
LABEL_61:
  v82 = 0;
  while (1)
  {
    if (*(_QWORD *)v122 != v81)
      objc_enumerationMutation(v31);
    v83 = *(NSObject **)(*((_QWORD *)&v121 + 1) + 8 * v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject senderPeerID](v83, "senderPeerID"));
    if ((objc_msgSend(v11, "containsObject:", v84) & 1) != 0)
      break;

LABEL_69:
    if (v80 == (id)++v82)
    {
      v80 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
      if (v80)
        goto LABEL_61;
      goto LABEL_71;
    }
  }
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject storedCKRecord](v83, "storedCKRecord"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "modificationDate"));
  v87 = v80;
  v88 = v81;
  v89 = objc_msgSend(v86, "compare:", v116);

  v90 = v89 == (id)1;
  v81 = v88;
  v80 = v87;
  v31 = v107;
  if (!v90)
    goto LABEL_69;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  v100 = sub_10000BDF4(CFSTR("ckkskey"), v99);
  v71 = objc_claimAutoreleasedReturnValue(v100);

  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v142 = v83;
    v102 = "Trusted TLK Share (%@) created recently; other devices have keys and should send them to us";
    goto LABEL_84;
  }
LABEL_85:
  v32 = 1;
  v24 = v112;
LABEL_86:
  v76 = v109;
  v75 = v110;
  v77 = v108;

LABEL_58:
  return v32;
}

- (void)notifyForItem:(SecDbItem *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *cf;

  v5 = (void *)sub_100019204(a3, (uint64_t)&off_1002E94E8, 0);
  if (v5)
  {
    v6 = v5;
    if (!CFEqual(v5, kCFNull))
    {
      CFRetain(v6);
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.cfnetwork")))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cloudKitClassDependencies](self, "cloudKitClassDependencies"));
        v8 = objc_msgSend(v7, "notifierClass");
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.security.view-change.Passwords")));
        objc_msgSend(v8, "post:", v9);

      }
    }
  }
  v10 = (void *)sub_100019204(a3, (uint64_t)&off_1002E9510, 0);
  if (v10)
  {
    cf = v10;
    if (!CFEqual(v10, kCFNull))
    {
      CFRetain(cf);
      if (objc_msgSend(cf, "isEqualToString:", kSOSViewHintPCSMasterKey))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cloudKitClassDependencies](self, "cloudKitClassDependencies"));
        v12 = objc_msgSend(v11, "notifierClass");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.security.view-change.PCS")));
        objc_msgSend(v12, "post:", v13);

      }
    }
  }
}

- (void)notifyPasswordsOrPCSChangedForAddedItem:(SecDbItem *)a3 modified:(SecDbItem *)a4 deleted:(SecDbItem *)a5
{
  if (a3)
    -[CKKSKeychainView notifyForItem:](self, "notifyForItem:");
  if (a4)
    -[CKKSKeychainView notifyForItem:](self, "notifyForItem:", a4);
  if (a5)
    -[CKKSKeychainView notifyForItem:](self, "notifyForItem:", a5);
}

- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  int64_t v25;
  id v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  CKKSUpdateCurrentItemPointerOperation *v39;
  void *v40;
  void *v41;
  CKKSUpdateCurrentItemPointerOperation *v42;
  CKKSUpdateCurrentItemPointerOperation *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  CKKSUpdateCurrentItemPointerOperation *v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;

  v51 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v56 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView policyDependentViewStateForName:error:](self, "policyDependentViewStateForName:error:", a7, &v56));
  v23 = v56;
  if (v22)
  {
    v50 = v19;
    if (v17 && v18)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
      objc_msgSend(v24, "wait:", 30000000000);

      v25 = -[CKKSKeychainView accountStatus](self, "accountStatus");
      if (v25 == 1)
      {
        v49 = v16;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v37 = sub_10000BDF4(CFSTR("ckkscurrent"), v36);
        v38 = objc_claimAutoreleasedReturnValue(v37);

        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v58 = v17;
          v59 = 2112;
          v60 = v18;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Starting change current pointer operation for %@-%@", buf, 0x16u);
        }

        v39 = [CKKSUpdateCurrentItemPointerOperation alloc];
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("currentitem-api")));
        v42 = -[CKKSUpdateCurrentItemPointerOperation initWithCKKSOperationDependencies:viewState:newItem:hash:accessGroup:identifier:replacing:hash:ckoperationGroup:](v39, "initWithCKKSOperationDependencies:viewState:newItem:hash:accessGroup:identifier:replacing:hash:ckoperationGroup:", v40, v22, v51, v49, v17, v18, v50, v20, v41);

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_10017A744;
        v52[3] = &unk_1002E95B8;
        v53 = v42;
        v54 = v22;
        v55 = v21;
        v43 = v42;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation operationWithBlock:](CKKSResultOperation, "operationWithBlock:", v52));
        objc_msgSend(v44, "setName:", CFSTR("setCurrentItem-return-callback"));
        objc_msgSend(v44, "addDependency:", v43);
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
        -[CKKSUpdateCurrentItemPointerOperation linearDependencies:](v43, "linearDependencies:", v45);

        v46 = -[CKKSResultOperation timeout:](v43, "timeout:", 60000000000);
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v43);

        v16 = v49;
        goto LABEL_18;
      }
      v26 = v16;
      if (v25)
      {
        v27 = CFSTR("User is not signed into iCloud.");
        v28 = 10;
      }
      else
      {
        v27 = CFSTR("iCloud account status unknown.");
        v28 = 64;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), v28, v27));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v48 = sub_10000BDF4(CFSTR("ckkscurrent"), v47);
      v32 = objc_claimAutoreleasedReturnValue(v48);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v29;
        v33 = "Rejecting current item pointer set since we don't have an iCloud account: %@";
        v34 = v32;
        v35 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_16;
      }
    }
    else
    {
      v26 = v16;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), -50, CFSTR("No access group or identifier given")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v31 = sub_10000BDF4(CFSTR("ckkscurrent"), v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v29;
        v33 = "Cancelling request: %@";
        v34 = v32;
        v35 = OS_LOG_TYPE_ERROR;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v34, v35, v33, buf, 0xCu);
      }
    }

    (*((void (**)(id, void *))v21 + 2))(v21, v29);
    v16 = v26;
LABEL_18:
    v19 = v50;
    goto LABEL_19;
  }
  (*((void (**)(id, id))v21 + 2))(v21, v23);
LABEL_19:

}

- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  CKKSDeleteCurrentItemPointersOperation *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int64_t v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  CKKSDeleteCurrentItemPointersOperation *v27;
  void *v28;
  void *v29;
  CKKSDeleteCurrentItemPointersOperation *v30;
  CKKSDeleteCurrentItemPointersOperation *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  void **v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  CKKSDeleteCurrentItemPointersOperation *v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  CKKSDeleteCurrentItemPointersOperation *v47;
  __int16 v48;
  id v49;

  v10 = (CKKSDeleteCurrentItemPointersOperation *)a3;
  v11 = a4;
  v12 = a6;
  v45 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView policyDependentViewStateForName:error:](self, "policyDependentViewStateForName:error:", a5, &v45));
  v14 = v45;
  if (v13)
  {
    if (v10 && v11 && objc_msgSend(v11, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
      objc_msgSend(v15, "wait:", 30000000000);

      v16 = -[CKKSKeychainView accountStatus](self, "accountStatus");
      if (v16 == 1)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v24 = sub_10000BDF4(CFSTR("ckkscurrent"), v23);
        v25 = objc_claimAutoreleasedReturnValue(v24);

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend(v11, "count");
          *(_DWORD *)buf = 138412546;
          v47 = v10;
          v48 = 2048;
          v49 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Starting delete current item pointer(s) operation for %@ (%lu)", buf, 0x16u);
        }

        v27 = [CKKSDeleteCurrentItemPointersOperation alloc];
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("currentitem-api")));
        v30 = -[CKKSDeleteCurrentItemPointersOperation initWithCKKSOperationDependencies:viewState:accessGroup:identifiers:ckoperationGroup:](v27, "initWithCKKSOperationDependencies:viewState:accessGroup:identifiers:ckoperationGroup:", v28, v13, v10, v11, v29);

        v38 = _NSConcreteStackBlock;
        v39 = 3221225472;
        v40 = sub_10017A5D4;
        v41 = &unk_1002E95B8;
        v42 = v30;
        v43 = v13;
        v44 = v12;
        v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation operationWithBlock:](CKKSResultOperation, "operationWithBlock:", &v38));
        objc_msgSend(v32, "setName:", CFSTR("unsetCurrentItems-return-callback"), v38, v39, v40, v41);
        objc_msgSend(v32, "addDependency:", v31);
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
        -[CKKSDeleteCurrentItemPointersOperation linearDependencies:](v31, "linearDependencies:", v33);

        v34 = -[CKKSResultOperation timeout:](v31, "timeout:", 60000000000);
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v31);

      }
      else
      {
        if (v16)
        {
          v17 = CFSTR("User is not signed into iCloud.");
          v18 = 10;
        }
        else
        {
          v17 = CFSTR("iCloud account status unknown.");
          v18 = 64;
        }
        v31 = (CKKSDeleteCurrentItemPointersOperation *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), v18, v17));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v36 = sub_10000BDF4(CFSTR("ckkscurrent"), v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v31;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer delete since we don't have an iCloud account: %@", buf, 0xCu);
        }

        (*((void (**)(id, CKKSDeleteCurrentItemPointersOperation *))v12 + 2))(v12, v31);
      }

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v20 = sub_10000BDF4(CFSTR("ckkscurrent"), v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v10;
        v48 = 2112;
        v49 = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer delete since no access group(%@) or identifiers(%@) given", buf, 0x16u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), -50, CFSTR("No access group or identifier given")));
      (*((void (**)(id, void *))v12 + 2))(v12, v22);

    }
  }
  else
  {
    (*((void (**)(id, id))v12 + 2))(v12, v14);
  }

}

- (id)zoneIDForViewHint:(id)a3 pcsShortcut:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v6 = a4;
  v8 = a3;
  if (v6)
    v9 = 0;
  else
    v9 = 5000000000;
  v18 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView policyDependentViewStateForName:timeout:error:](self, "policyDependentViewStateForName:timeout:error:", v8, v9, &v18));
  v11 = v18;
  if (v10)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
LABEL_6:
    v13 = v12;
    goto LABEL_7;
  }
  if (v6 && objc_msgSend(v8, "isEqualToString:", CFSTR("ProtectedCloudStorage")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v16 = sub_10000BDF4(CFSTR("ckkscurrent"), v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to retrieve view state, using ProtectedCloudStorage: %@", buf, 0xCu);
    }

    v12 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("ProtectedCloudStorage"), CKCurrentUserDefaultName);
    goto LABEL_6;
  }
  v13 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v11);
LABEL_7:

  return v13;
}

- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id *location;
  void **v35;
  uint64_t v36;
  void (*v37)(id *);
  void *v38;
  id v39;
  CKKSKeychainView *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _BYTE buf[12];
  __int16 v49;
  id v50;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v8)
    v16 = 0;
  else
    v16 = objc_msgSend(v14, "isEqualToString:", CFSTR("ProtectedCloudStorage"));
  v47 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneIDForViewHint:pcsShortcut:error:](self, "zoneIDForViewHint:pcsShortcut:error:", v14, v16, &v47));
  v18 = v47;
  if (v17)
  {
    if (v12 && v13)
    {
      if ((v16 & 1) != 0
        || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown")),
            objc_msgSend(v19, "wait:", 30000000000),
            v19,
            v20 = -[CKKSKeychainView accountStatus](self, "accountStatus"),
            v20 == 1))
      {
        if (v8)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView rpcFetchAndProcessIncomingQueue:because:errorOnClassAFailure:](self, "rpcFetchAndProcessIncomingQueue:because:errorOnClassAFailure:", v26, CFSTR("currentitemcheck"), 0));

        }
        else
        {
          v27 = 0;
        }
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v35 = _NSConcreteStackBlock;
        v36 = 3221225472;
        v37 = sub_100179E2C;
        v38 = &unk_1002EA9D0;
        v28 = v27;
        v39 = v28;
        v40 = self;
        v45 = v15;
        objc_copyWeak(&v46, (id *)buf);
        v41 = v12;
        v42 = v13;
        v43 = v14;
        v44 = v17;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("get-current-item-pointer"), &v35));
        objc_msgSend(v29, "addNullableDependency:", v28);
        if ((_DWORD)v16)
          -[CKKSKeychainView scheduleOperationWithoutDependencies:](self, "scheduleOperationWithoutDependencies:", v29, &v46, v35, v36, v37, v38, v39, v40, v41, v42, v43);
        else
          -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v29, &v46, v35, v36, v37, v38, v39, v40, v41, v42, v43);

        objc_destroyWeak(location);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        if (v20)
          v21 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 10, CFSTR("User is not signed into iCloud.")));
        else
          v21 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 64, CFSTR("iCloud account status unknown.")));
        v30 = (void *)v21;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v32 = sub_10000BDF4(CFSTR("ckkscurrent"), v31);
        v33 = objc_claimAutoreleasedReturnValue(v32);

        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v30;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer get since we don't have an iCloud account: %@", buf, 0xCu);
        }

        (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v30);
      }
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v23 = sub_10000BDF4(CFSTR("ckkscurrent"), v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v12;
        v49 = 2112;
        v50 = v13;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer get since no access group(%@) or identifier(%@) given", buf, 0x16u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), -50, CFSTR("No access group or identifier given")));
      (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v25);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v18);
  }

}

- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  int64_t v11;
  void *v12;
  unsigned __int8 v13;
  __CFString *v14;
  char v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CuttlefishCurrentItemSpecifier *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  NSObject *v50;
  __CFString *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  __CFString *v58;
  id v59;
  id obj;
  id v61;
  _QWORD v62[5];
  __CFString *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  uint8_t buf[4];
  const __CFString *v71;
  __int16 v72;
  __CFString *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
  objc_msgSend(v10, "wait:", 30000000000);

  v11 = -[CKKSKeychainView accountStatus](self, "accountStatus");
  if (!v11)
  {
    v41 = CFSTR("iCloud account status unknown.");
    v42 = 64;
    goto LABEL_25;
  }
  if (v11 != 1
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cuttlefishAdapter](self, "cuttlefishAdapter")),
        v12,
        !v12))
  {
    v41 = CFSTR("User is not signed into iCloud.");
    v42 = 10;
LABEL_25:
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), v42, v41));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v44 = sub_10000BDF4(CFSTR("ckkscurrent"), v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);

    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v14;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Rejecting current item requests since we don't have an iCloud account: %@", buf, 0xCu);
    }

    v9[2](v9, 0, v14);
    goto LABEL_39;
  }
  v69 = 0;
  v13 = -[CKKSKeychainView allowOutOfBandFetch:](self, "allowOutOfBandFetch:", &v69);
  v14 = (__CFString *)v69;
  v15 = v13 | v6;
  if (v14)
  {
    v16 = sub_10000BDF4(CFSTR("ckkscurrent"), 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("DISABLED");
      if (v6)
        v18 = CFSTR("ENABLED");
      *(_DWORD *)buf = 138412546;
      v71 = v18;
      v72 = 2112;
      v73 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error fetching out of band fetch permission, relying on forceFetch enablement (%@) : %@", buf, 0x16u);
    }

  }
  if ((v15 & 1) != 0)
  {
    v61 = objc_alloc_init((Class)NSMutableArray);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v8;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v66;
      v58 = v14;
      v59 = v8;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
          if (!v24
            || (v25 = (void *)v24,
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessGroup")),
                v26,
                v25,
                !v26))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
            v49 = sub_10000BDF4(CFSTR("ckkscurrent"), v48);
            v50 = objc_claimAutoreleasedReturnValue(v49);

            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
              v52 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessGroup"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
              *(_DWORD *)buf = 138412802;
              v71 = v51;
              v72 = 2112;
              v73 = v52;
              v74 = 2112;
              v75 = v53;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer for identifier(%@) get since no access group(%@) or zoneID(%@) given", buf, 0x20u);

            }
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No access group or view given for identifier(%@)"), v38));
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), -50, v54));
            v9[2](v9, 0, v55);

            v14 = v58;
            v8 = v59;
            v40 = v61;
            goto LABEL_37;
          }
          v27 = [CuttlefishCurrentItemSpecifier alloc];
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessGroup"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v28, v29));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
          v32 = -[CuttlefishCurrentItemSpecifier init:zoneID:](v27, "init:zoneID:", v30, v31);
          objc_msgSend(v61, "addObject:", v32);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        v14 = v58;
        v8 = v59;
        if (v20)
          continue;
        break;
      }
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountsAdapter](self, "accountsAdapter"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView personaAdapter](self, "personaAdapter"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "contextID"));
    v64 = 0;
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "findAccountForCurrentThread:optionalAltDSID:cloudkitContainerName:octagonContextID:error:", v34, 0, CFSTR("com.apple.security.keychain"), v36, &v64));
    v38 = (__CFString *)v64;

    obj = (id)v37;
    if (!v37 || v38)
    {
      v56 = sub_10000BDF4(CFSTR("ckks-cuttlefish"), 0);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      v40 = v61;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v71 = CFSTR("defaultContext");
        v72 = 2112;
        v73 = v38;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "unable to determine active account for context(%@). Issues ahead: %@", buf, 0x16u);
      }

      v9[2](v9, 0, v38);
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cuttlefishAdapter](self, "cuttlefishAdapter"));
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100179664;
      v62[3] = &unk_1002E9658;
      v62[4] = self;
      v63 = v9;
      v40 = v61;
      objc_msgSend(v39, "fetchCurrentItem:items:reply:", v37, v61, v62);

      v38 = v63;
    }
LABEL_37:

  }
  else
  {
    v46 = sub_10000BDF4(CFSTR("ckks"), 0);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Out of band fetch disabled due to CKKS readiness", buf, 2u);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 67, CFSTR("Out of band fetch disabled due to CKKS readiness")));
    v9[2](v9, 0, v40);
  }

LABEL_39:
}

- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  int64_t v11;
  void *v12;
  unsigned __int8 v13;
  __CFString *v14;
  char v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CuttlefishPCSServiceIdentifier *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  void *v49;
  id v50;
  NSObject *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  __CFString *v57;
  id v58;
  id obj;
  id v60;
  _QWORD v61[5];
  __CFString *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  __CFString *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
  objc_msgSend(v10, "wait:", 30000000000);

  v11 = -[CKKSKeychainView accountStatus](self, "accountStatus");
  if (!v11)
  {
    v42 = CFSTR("iCloud account status unknown.");
    v43 = 64;
    goto LABEL_25;
  }
  if (v11 != 1
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cuttlefishAdapter](self, "cuttlefishAdapter")),
        v12,
        !v12))
  {
    v42 = CFSTR("User is not signed into iCloud.");
    v43 = 10;
LABEL_25:
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), v43, v42));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v45 = sub_10000BDF4(CFSTR("ckkscurrent"), v44);
    v46 = objc_claimAutoreleasedReturnValue(v45);

    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v14;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Rejecting PCS Identity requests since we don't have an iCloud account: %@", buf, 0xCu);
    }

    v9[2](v9, 0, v14);
    goto LABEL_39;
  }
  v68 = 0;
  v13 = -[CKKSKeychainView allowOutOfBandFetch:](self, "allowOutOfBandFetch:", &v68);
  v14 = (__CFString *)v68;
  v15 = v13 | v6;
  if (v14)
  {
    v16 = sub_10000BDF4(CFSTR("ckkscurrent"), 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("DISABLED");
      if (v6)
        v18 = CFSTR("ENABLED");
      *(_DWORD *)buf = 138412546;
      v70 = v18;
      v71 = 2112;
      v72 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error fetching out of band fetch permission, relying on forceFetch enablement (%@) : %@", buf, 0x16u);
    }

  }
  if ((v15 & 1) != 0)
  {
    v60 = objc_alloc_init((Class)NSMutableArray);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v8;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v65;
      v57 = v14;
      v58 = v8;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v65 != v21)
            objc_enumerationMutation(obj);
          v23 = *(__CFString **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
          v24 = objc_claimAutoreleasedReturnValue(-[__CFString accessGroup](v23, "accessGroup"));
          if (!v24
            || (v25 = (void *)v24,
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v23, "zoneID")),
                v26,
                v25,
                !v26))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
            v50 = sub_10000BDF4(CFSTR("ckkscurrent"), v49);
            v51 = objc_claimAutoreleasedReturnValue(v50);

            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v52 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString accessGroup](v23, "accessGroup"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v23, "zoneID"));
              *(_DWORD *)buf = 138412802;
              v70 = v23;
              v71 = 2112;
              v72 = v52;
              v73 = 2112;
              v74 = v53;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Rejecting pcs service (%@) get since no access group(%@) or zoneID(%@) given", buf, 0x20u);

            }
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No access group or view given for PCS Service(%@)"), v23));
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), -50, v39));
            v9[2](v9, 0, v54);

            v14 = v57;
            v8 = v58;
            v41 = v60;
            goto LABEL_37;
          }
          v27 = [CuttlefishPCSServiceIdentifier alloc];
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString serviceNumber](v23, "serviceNumber"));
          v29 = objc_alloc((Class)NSData);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString publicKey](v23, "publicKey"));
          v31 = objc_msgSend(v29, "initWithBase64EncodedString:options:", v30, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v23, "zoneID"));
          v33 = -[CuttlefishPCSServiceIdentifier init:PCSPublicKey:zoneID:](v27, "init:PCSPublicKey:zoneID:", v28, v31, v32);
          objc_msgSend(v60, "addObject:", v33);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
        v14 = v57;
        v8 = v58;
        if (v20)
          continue;
        break;
      }
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountsAdapter](self, "accountsAdapter"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView personaAdapter](self, "personaAdapter"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "contextID"));
    v63 = 0;
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "findAccountForCurrentThread:optionalAltDSID:cloudkitContainerName:octagonContextID:error:", v35, 0, CFSTR("com.apple.security.keychain"), v37, &v63));
    v39 = (__CFString *)v63;

    obj = (id)v38;
    if (!v38 || v39)
    {
      v55 = sub_10000BDF4(CFSTR("ckks-cuttlefish"), 0);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      v41 = v60;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v70 = CFSTR("defaultContext");
        v71 = 2112;
        v72 = v39;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "unable to determine active account for context(%@). Issues ahead: %@", buf, 0x16u);
      }

      v9[2](v9, 0, v39);
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cuttlefishAdapter](self, "cuttlefishAdapter"));
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10017904C;
      v61[3] = &unk_1002E9658;
      v61[4] = self;
      v62 = v9;
      v41 = v60;
      objc_msgSend(v40, "fetchPCSIdentityByKey:pcsservices:reply:", obj, v60, v61);

      v39 = v62;
    }
LABEL_37:

  }
  else
  {
    v47 = sub_10000BDF4(CFSTR("ckks"), 0);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Out of band fetch disabled due to CKKS readiness", buf, 2u);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 67, CFSTR("Out of band fetch disabled due to CKKS readiness")));
    v9[2](v9, 0, v41);
  }

LABEL_39:
}

- (void)sendMetricForFirstManateeAccess
{
  void *v3;
  unsigned int v4;
  AAFAnalyticsEventSecurity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AAFAnalyticsEventSecurity *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v4 = objc_msgSend(v3, "sendMetric");

  if (v4)
  {
    v5 = [AAFAnalyticsEventSecurity alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v10 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v5, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", &__NSDictionary0__struct, v8, CFSTR("com.apple.security.ckks.firstManateeKeyFetch"), 0, &off_10030AF70, objc_msgSend(v9, "sendMetric"));

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v10, 1, 0);
  }
}

- (id)findKeySets:(BOOL)a3
{
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD block[5];

  if (a3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100178A34;
    block[3] = &unk_1002EC350;
    block[4] = self;
    dispatch_sync(v4, block);

  }
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100174EB0;
  v12 = sub_100174EC0;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100178AB0;
  v7[3] = &unk_1002EB140;
  v7[4] = self;
  v7[5] = &v8;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](self, "dispatchSyncWithReadOnlySQLTransaction:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)receiveTLKUploadRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  CKKSKeychainView *v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  v6 = sub_10000BDF4(CFSTR("ckkskey"), v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received a set of %lu TLK upload records", buf, 0xCu);
  }

  if (v4 && objc_msgSend(v4, "count"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100178900;
    v8[3] = &unk_1002E9418;
    v9 = v4;
    v10 = self;
    -[CKKSKeychainView dispatchSyncWithSQLTransaction:](self, "dispatchSyncWithSQLTransaction:", v8);

  }
}

- (id)viewsRequiringTLKUpload
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100174EB0;
  v11 = sub_100174EC0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001788A4;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)findFirstPendingOperation:(id)a3
{
  return -[CKKSKeychainView findFirstPendingOperation:ofClass:](self, "findFirstPendingOperation:ofClass:", a3, 0);
}

- (id)findFirstPendingOperation:(id)a3 ofClass:(Class)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  objc_sync_enter(v5);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        if (v10
          && objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "isPending", (_QWORD)v13)
          && (!a4 || (objc_opt_isKindOfClass(v10, a4) & 1) != 0))
        {
          v11 = v10;
          goto LABEL_14;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  objc_sync_exit(v6);
  return v11;
}

- (id)rpcProcessOutgoingQueue:(id)a3 operationGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  OctagonStateTransitionWatcher *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void **v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  CKKSKeychainView *v25;
  id v26;
  _QWORD block[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100174EB0;
  v34 = sub_100174EC0;
  v35 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001783F4;
  block[3] = &unk_1002EAC48;
  block[4] = self;
  v29 = &v30;
  v9 = v6;
  v28 = v9;
  dispatch_sync(v8, block);

  if (v31[5])
  {
    -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:");
    v10 = (id)v31[5];
  }
  else
  {
    v38 = CFSTR("process_outgoing_queue");
    v36 = CFSTR("become_ready");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
    v37 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v39 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v13));
    v15 = [OctagonStateTransitionWatcher alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v17 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:](v15, "initNamed:stateMachine:path:initialRequest:", CFSTR("push"), v16, v14, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    objc_msgSend(v18, "registerStateTransitionWatcher:startTimeout:", v17, 300000000000);

    v19 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_1001786B4;
    v24 = &unk_1002E9728;
    v25 = self;
    v26 = v7;
    dispatch_sync(v19, &v21);

    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "result", v21, v22, v23, v24, v25));
  }

  _Block_object_dispose(&v30, 8);
  return v10;
}

- (void)_onqueueProcessOutgoingQueue:(id)a3 priorityRush:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentOutgoingQueueOperationGroup"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      v11 = sub_10000BDF4(CFSTR("ckks"), v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ckoperationGroup"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
        v20 = 138412546;
        v21 = v13;
        v22 = 2112;
        v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Throwing away CKOperationGroup(%@) in favor of (%@)", (uint8_t *)&v20, 0x16u);

      }
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      -[NSObject setCurrentOutgoingQueueOperationGroup:](v12, "setCurrentOutgoingQueueOperationGroup:", v6);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v17, "_onqueueHandleFlag:", CFSTR("process_outgoing_queue"));

  if (v4)
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueuePriorityOperationScheduler](self, "outgoingQueuePriorityOperationScheduler"));
  else
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperationScheduler](self, "outgoingQueueOperationScheduler"));
  v19 = v18;
  objc_msgSend(v18, "trigger");

}

- (id)resultsOfNextProcessIncomingQueueOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation](self, "resultsOfNextIncomingQueueOperationOperation"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation](self, "resultsOfNextIncomingQueueOperationOperation")), v6 = objc_msgSend(v5, "isPending"), v5, v4, (v6 & 1) == 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wait-for-next-incoming-queue-operation")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", v7, &stru_1002E9748));
    -[CKKSKeychainView setResultsOfNextIncomingQueueOperationOperation:](self, "setResultsOfNextIncomingQueueOperationOperation:", v8);

  }
  return (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation](self, "resultsOfNextIncomingQueueOperationOperation"));
}

- (id)rpcFetchBecause:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OctagonStateTransitionWatcher *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD block[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;

  v4 = a3;
  v38 = 0;
  v5 = -[CKKSKeychainView waitForPolicy:error:](self, "waitForPolicy:error:", 5000000000, &v38);
  v6 = v38;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v53 = CFSTR("begin_fetch");
    v30 = v6;
    v31 = v4;
    v51 = CFSTR("fetching");
    v49[0] = CFSTR("fetchcomplete");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
    v49[1] = CFSTR("resetlocal");
    v50[0] = v29;
    v47 = CFSTR("initializing");
    v45 = CFSTR("initialized");
    v43 = CFSTR("begin_fetch");
    v41 = CFSTR("fetching");
    v39 = CFSTR("fetchcomplete");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
    v40 = v28;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    v42 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    v44 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v46 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
    v48 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
    v50[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
    v52 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    v54 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v15));

    v4 = v31;
    v17 = [OctagonStateTransitionWatcher alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v19 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:](v17, "initNamed:stateMachine:path:initialRequest:", CFSTR("rpc-fetch"), v18, v16, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    objc_msgSend(v20, "registerStateTransitionWatcher:startTimeout:", v19, 300000000000);

    v21 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100178250;
    block[3] = &unk_1002E9728;
    block[4] = self;
    v35 = v31;
    dispatch_sync(v21, block);

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001782C8;
    v32[3] = &unk_1002E9468;
    v33 = v19;
    v22 = v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("check-keys"), v32));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "result"));
    objc_msgSend(v23, "addDependency:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    objc_msgSend(v25, "addOperation:", v23);

    v7 = v30;
  }
  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100178244;
    v36[3] = &unk_1002E9468;
    v37 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("fail"), v36));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    objc_msgSend(v26, "addOperation:", v23);

    v16 = v37;
  }

  return v23;
}

- (id)rpcFetchAndProcessIncomingQueue:(id)a3 because:(id)a4 errorOnClassAFailure:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  OctagonStateTransitionWatcher *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id location;
  _QWORD block[5];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  const __CFString *v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[2];
  _QWORD v58[2];
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  const __CFString *v73;
  void *v74;

  v5 = a5;
  v37 = a3;
  v38 = a4;
  v48 = 0;
  LOBYTE(a4) = -[CKKSKeychainView waitForPolicy:error:](self, "waitForPolicy:error:", 5000000000, &v48);
  v8 = v48;
  v36 = v8;
  if ((a4 & 1) != 0)
  {
    if (v5)
    {
      v73 = CFSTR("become_ready");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v74 = v9;
      v35 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
    }
    else
    {
      v71[0] = CFSTR("become_ready");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v71[1] = CFSTR("class_a_incoming_items_remaining");
      v72[0] = v9;
      v69 = CFSTR("become_ready");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v70 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
      v72[1] = v14;
      v35 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 2));

    }
    v67 = CFSTR("begin_fetch");
    v65 = CFSTR("fetching");
    v63 = CFSTR("fetchcomplete");
    v61 = CFSTR("process_key_hierarchy");
    v59 = CFSTR("check_zone_hierarchies");
    v55 = CFSTR("process_incoming_queue");
    v56 = v35;
    v57[0] = CFSTR("heal_tlk_shares");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
    v57[1] = CFSTR("tlkmissing");
    v58[0] = v34;
    v53 = CFSTR("check_zone_hierarchies");
    v49 = CFSTR("process_incoming_queue");
    v50 = v35;
    v51 = CFSTR("heal_tlk_shares");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
    v52 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    v54 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
    v58[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 2));
    v60 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
    v62 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
    v64 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
    v66 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
    v68 = v22;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v33));
    v24 = [OctagonStateTransitionWatcher alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v26 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:](v24, "initNamed:stateMachine:path:initialRequest:", CFSTR("fetch-and-process"), v25, v23, 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    objc_msgSend(v27, "registerStateTransitionWatcher:startTimeout:", v26, 300000000000);

    v28 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100177DFC;
    block[3] = &unk_1002E9728;
    block[4] = self;
    v45 = v38;
    dispatch_sync(v28, block);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100177E74;
    v39[3] = &unk_1002E9770;
    objc_copyWeak(&v42, &location);
    v29 = v26;
    v40 = v29;
    v41 = v37;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("check-keys"), v39));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "result"));
    objc_msgSend(v10, "addDependency:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    objc_msgSend(v31, "addOperation:", v10);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    v12 = (void *)v35;
  }
  else
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100177DF0;
    v46[3] = &unk_1002E9468;
    v47 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("fail"), v46));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    objc_msgSend(v11, "addOperation:", v10);

    v12 = v47;
  }

  return v10;
}

- (id)rpcProcessIncomingQueue:(id)a3 errorOnClassAFailure:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OctagonStateTransitionWatcher *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  void *v25;

  if (a4)
  {
    v24 = CFSTR("become_ready");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success", a3));
    v25 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  }
  else
  {
    v22[0] = CFSTR("become_ready");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success", a3));
    v22[1] = CFSTR("class_a_incoming_items_remaining");
    v23[0] = v5;
    v20 = CFSTR("become_ready");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
    v21 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v23[1] = v8;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));

  }
  v18 = CFSTR("process_incoming_queue");
  v19 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v9));
  v11 = [OctagonStateTransitionWatcher alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v13 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:](v11, "initNamed:stateMachine:path:initialRequest:", CFSTR("process-incoming-queue"), v12, v10, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v14, "registerStateTransitionWatcher:startTimeout:", v13, 300000000000);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v15, "handleFlag:", CFSTR("process_incoming_queue"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "result"));
  return v16;
}

- (id)rpcWaitForPriorityViewProcessing
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100174EB0;
  v11 = sub_100174EC0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100177990;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)scanLocalItems
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "handleFlag:", CFSTR("dropped_items"));

}

- (id)updateDeviceState:(BOOL)a3 waitForKeyHierarchyInitialization:(unint64_t)a4 ckoperationGroup:(id)a5
{
  _BOOL8 v6;
  id v8;
  OctagonStateMultiStateArrivalWatcher *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  CKKSUpdateDeviceStateOperation *v15;
  void *v16;
  CKKSUpdateDeviceStateOperation *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v8 = a5;
  v9 = [OctagonStateMultiStateArrivalWatcher alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v11 = sub_1000B38C8();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[OctagonStateMultiStateArrivalWatcher initNamed:serialQueue:states:](v9, "initNamed:serialQueue:states:", CFSTR("rpc-watcher"), v10, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v14, "registerMultiStateArrivalWatcher:startTimeout:", v13, a4);

  v15 = [CKKSUpdateDeviceStateOperation alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v17 = -[CKKSUpdateDeviceStateOperation initWithOperationDependencies:rateLimit:ckoperationGroup:](v15, "initWithOperationDependencies:rateLimit:ckoperationGroup:", v16, v6, v8);

  -[CKKSGroupOperation setName:](v17, "setName:", CFSTR("device-state-operation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "result"));
  -[CKKSGroupOperation addDependency:](v17, "addDependency:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
  -[CKKSUpdateDeviceStateOperation linearDependenciesWithSelfFirst:](v17, "linearDependenciesWithSelfFirst:", v19);

  -[CKKSKeychainView scheduleOperationWithoutDependencies:](self, "scheduleOperationWithoutDependencies:", v17);
  return v17;
}

- (void)toggleHavoc:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017789C;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);

}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(id *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1001775F0;
  v14 = &unk_1002E97B8;
  objc_copyWeak(&v17, &location);
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("pcs-mirror-keys"), &v11));
  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)xpc24HrNotification
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "handleFlag:", CFSTR("24_hr_notification"));

}

- (id)resyncWithCloud
{
  CKKSSynchronizeOperation *v3;
  void *v4;
  CKKSSynchronizeOperation *v5;

  v3 = [CKKSSynchronizeOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v5 = -[CKKSSynchronizeOperation initWithCKKSKeychainView:dependencies:](v3, "initWithCKKSKeychainView:dependencies:", self, v4);

  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v5);
  return v5;
}

- (id)resyncLocal
{
  CKKSLocalSynchronizeOperation *v3;
  void *v4;
  CKKSLocalSynchronizeOperation *v5;

  v3 = [CKKSLocalSynchronizeOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v5 = -[CKKSLocalSynchronizeOperation initWithCKKSKeychainView:operationDependencies:](v3, "initWithCKKSKeychainView:operationDependencies:", self, v4);

  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v5);
  return v5;
}

- (BOOL)_onqueueResetAllInflightOQE:(id *)a3
{
  CKKSKeychainView *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void **p_cache;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CKKSKeychainView *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  id v27;
  BOOL v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v4 = self;
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v50 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](v4, "operationDependencies"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allCKKSManagedViews"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v8)
  {
    v39 = a3;
    v40 = v7;
    v9 = *(_QWORD *)v48;
    p_cache = OTAccountsActualAdapter.cache;
    v11 = CFSTR("inflight");
    v36 = *(_QWORD *)v48;
    do
    {
      v12 = 0;
      v37 = v8;
      while (2)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v7);
        v38 = v12;
        v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v12);
        while (1)
        {
          v14 = p_cache + 488;
          v15 = v4;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](v4, "operationDependencies", v36));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contextID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
          v46 = 0;
          v19 = v11;
          v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetch:state:contextID:zoneID:error:", 100, v11, v17, v18, &v46));
          v21 = v46;

          if (v21)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](v15, "zoneName"));
            v34 = sub_10000BDF4(CFSTR("ckks"), v33);
            v35 = objc_claimAutoreleasedReturnValue(v34);

            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v21;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Error finding inflight outgoing queue records: %@", buf, 0xCu);
            }

            v7 = v40;
            if (v39)
            {
              v21 = objc_retainAutorelease(v21);
              *v39 = v21;
            }
LABEL_26:

            v28 = 0;
            goto LABEL_28;
          }
          if (!objc_msgSend(v20, "count"))
            break;
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v20 = v20;
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v43;
            while (2)
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(_QWORD *)v43 != v24)
                  objc_enumerationMutation(v20);
                v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
                v41 = 0;
                objc_msgSend(v26, "intransactionMoveToState:viewState:error:", CFSTR("new"), v13, &v41);
                v27 = v41;
                if (v27)
                {
                  v21 = v27;
                  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](v15, "zoneName"));
                  v30 = sub_10000BDF4(CFSTR("ckks"), v29);
                  v31 = objc_claimAutoreleasedReturnValue(v30);

                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v52 = v26;
                    v53 = 2112;
                    v54 = v21;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error fixing up inflight OQE(%@): %@", buf, 0x16u);
                  }

                  v7 = v40;
                  if (v39)
                    *v39 = objc_retainAutorelease(v21);

                  goto LABEL_26;
                }
              }
              v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
              if (v23)
                continue;
              break;
            }
          }

          p_cache = (void **)(OTAccountsActualAdapter + 16);
          v11 = v19;
          v4 = v15;
        }

        v12 = v38 + 1;
        v7 = v40;
        v9 = v36;
        p_cache = (void **)(OTAccountsActualAdapter + 16);
        v11 = v19;
        v4 = v15;
        if ((id)(v38 + 1) != v37)
          continue;
        break;
      }
      v8 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      v28 = 1;
    }
    while (v8);
  }
  else
  {
    v28 = 1;
  }
LABEL_28:

  return v28;
}

- (void)dispatchSyncWithSQLTransaction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "databaseProvider"));
  objc_msgSend(v5, "dispatchSyncWithSQLTransaction:", v4);

}

- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "databaseProvider"));
  objc_msgSend(v5, "dispatchSyncWithReadOnlySQLTransaction:", v4);

}

- (BOOL)insideSQLTransaction
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "databaseProvider"));
  v4 = objc_msgSend(v3, "insideSQLTransaction");

  return v4;
}

- (void)beginCloudKitOperation
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountTracker](self, "accountTracker"));
  v3 = objc_msgSend(v4, "registerForNotificationsOfCloudKitAccountStatusChange:", self);

}

- (id)createAccountLoggedInDependency:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100177514;
  v8[3] = &unk_1002EA8C8;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("account-logged-in-dependency"), v8));
  objc_msgSend(v6, "setDescriptionErrorCode:", 3);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (int64_t)accountStatusFromCKAccountInfo:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "accountStatus") == (id)1 && (objc_msgSend(v4, "hasValidCredentials") & 1) != 0)
      v5 = 1;
    else
      v5 = 3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _BYTE v31[12];
  __int16 v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  v9 = sub_10000BDF4(CFSTR("ckkszone"), v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v31 = 138412546;
    *(_QWORD *)&v31[4] = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received notification of CloudKit account status change, moving from %@ to %@", v31, 0x16u);
  }

  v11 = -[CKKSKeychainView accountStatusFromCKAccountInfo:](self, "accountStatusFromCKAccountInfo:", v6);
  v12 = -[CKKSKeychainView accountStatusFromCKAccountInfo:](self, "accountStatusFromCKAccountInfo:", v7);
  if (v11 == v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v14 = sub_10000BDF4(CFSTR("ckkszone"), v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAccountStateTracker stringFromAccountStatus:](CKKSAccountStateTracker, "stringFromAccountStatus:", v11));
      *(_DWORD *)v31 = 138412290;
      *(_QWORD *)&v31[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Computed status of new CK account info is same as old status: %@", v31, 0xCu);

    }
    goto LABEL_22;
  }
  if (v12)
  {
    if (v12 != 3)
    {
      if (v12 == 1)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        v18 = sub_10000BDF4(CFSTR("ckkszone"), v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);

        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Logged into iCloud.", v31, 2u);
        }

        -[CKKSKeychainView handleCKLogin](self, "handleCKLogin");
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountLoggedInDependency](self, "accountLoggedInDependency"));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountLoggedInDependency](self, "accountLoggedInDependency"));
          objc_msgSend(v21, "addOperation:", v22);

          -[CKKSKeychainView setAccountLoggedInDependency:](self, "setAccountLoggedInDependency:", 0);
        }
      }
      goto LABEL_22;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v28 = sub_10000BDF4(CFSTR("ckkszone"), v27);
    v25 = objc_claimAutoreleasedReturnValue(v28);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      v26 = "Logging out of iCloud. Shutting down.";
      goto LABEL_18;
    }
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v24 = sub_10000BDF4(CFSTR("ckkszone"), v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      v26 = "Account status has become undetermined. Pausing!";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, v31, 2u);
    }
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountLoggedInDependency](self, "accountLoggedInDependency"));
  if (!v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView createAccountLoggedInDependency:](self, "createAccountLoggedInDependency:", CFSTR("CloudKit account logged in again.")));
    -[CKKSKeychainView setAccountLoggedInDependency:](self, "setAccountLoggedInDependency:", v30);

  }
  -[CKKSKeychainView handleCKLogout](self, "handleCKLogout", *(_QWORD *)v31);
LABEL_22:

}

- (void)handleCKLogin
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  AAFAnalyticsEventSecurity *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AAFAnalyticsEventSecurity *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  v4 = sub_10000BDF4(CFSTR("ckks"), v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received a notification of CK login", buf, 2u);
  }

  if ((sub_10000BD64() & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100177414;
    block[3] = &unk_1002EC350;
    block[4] = self;
    dispatch_sync(v6, block);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "overallLaunch"));
    objc_msgSend(v8, "addEvent:", CFSTR("ck-account-login"));

    v9 = [AAFAnalyticsEventSecurity alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeAccount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "altDSID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v14 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v9, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", &__NSDictionary0__struct, v12, CFSTR("com.apple.security.ckks.CKAccountLogin"), 0, &off_10030AF70, objc_msgSend(v13, "sendMetric"));

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    objc_msgSend(v15, "handleFlag:", CFSTR("ck_account_logged_in"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
    objc_msgSend(v16, "fulfill");

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v18 = sub_10000BDF4(CFSTR("ckks"), v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping CloudKit initialization due to disabled CKKS", buf, 2u);
    }

  }
}

- (void)handleCKLogout
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177314;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overallLaunch"));
  objc_msgSend(v5, "addEvent:", CFSTR("ck-account-logout"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v6, "handleFlag:", CFSTR("ck_account_logged_out"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
  objc_msgSend(v7, "fulfill");

}

- (void)beginTrustedOperation:(id)a3 suggestTLKUpload:(id)a4 requestPolicyCheck:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  AAFAnalyticsEventSecurity *v14;
  int64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AAFAnalyticsEventSecurity *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  __CFString *v38;
  _BYTE v39[128];

  v8 = a3;
  v28 = a4;
  v9 = a5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v13), "registerForPeerChangeUpdates:", self);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v11);
  }
  v14 = [AAFAnalyticsEventSecurity alloc];
  v37 = CFSTR("trustStatus");
  v15 = -[CKKSKeychainView trustStatus](self, "trustStatus");
  v16 = CFSTR("available");
  if (v15 == 3)
    v16 = CFSTR("no account");
  if (!v15)
    v16 = CFSTR("unknown");
  v17 = v16;
  v38 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeAccount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "altDSID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v23 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v14, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v18, v21, CFSTR("com.apple.security.ckks.trustGain"), 0, &off_10030AF70, objc_msgSend(v22, "sendMetric"));

  v24 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176FDC;
  block[3] = &unk_1002E97E0;
  block[4] = self;
  v30 = v8;
  v31 = v9;
  v32 = v28;
  v25 = v28;
  v26 = v9;
  v27 = v8;
  dispatch_sync(v24, block);

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v23, 1, 0);
}

- (void)endTrustedOperation
{
  AAFAnalyticsEventSecurity *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  AAFAnalyticsEventSecurity *v9;
  _QWORD block[5];

  v3 = [AAFAnalyticsEventSecurity alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "altDSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v9 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v3, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", &__NSDictionary0__struct, v6, CFSTR("com.apple.security.ckks.trustLoss"), 0, &off_10030AF70, objc_msgSend(v7, "sendMetric"));

  v8 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176EA8;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v8, block);

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v9, 1, 0);
}

- (TPSyncingPolicy)syncingPolicy
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "syncingPolicy"));

  return (TPSyncingPolicy *)v3;
}

- (BOOL)setCurrentSyncingPolicy:(id)a3
{
  return -[CKKSKeychainView setCurrentSyncingPolicy:policyIsFresh:](self, "setCurrentSyncingPolicy:policyIsFresh:", a3, 0);
}

- (BOOL)setCurrentSyncingPolicy:(id)a3 policyIsFresh:(BOOL)a4
{
  id v5;
  AAFAnalyticsEventSecurity *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AAFAnalyticsEventSecurity *v15;
  void *v16;
  id v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  BOOL v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  uint8_t v57[8];
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  _BYTE *v63;
  BOOL v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  _QWORD v69[2];
  _BYTE buf[24];
  void *v71;
  _QWORD v72[3];
  _QWORD v73[3];

  v55 = a4;
  v5 = a3;
  v56 = v5;
  if (v5)
  {
    v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), -[NSObject versionNumber](v54, "versionNumber")));
    v6 = [AAFAnalyticsEventSecurity alloc];
    v73[0] = v53;
    v72[0] = CFSTR("syncingPolicy");
    v72[1] = CFSTR("policyFreshness");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v55));
    v73[1] = v7;
    v72[2] = CFSTR("numViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "viewList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count")));
    v73[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "altDSID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v15 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v6, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v10, v13, CFSTR("com.apple.security.ckks.syncingPolicySet"), 0, &off_10030AF70, objc_msgSend(v14, "sendMetric"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "viewList"));
    v17 = sub_10000BDF4(CFSTR("ckks-policy"), 0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("cached");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v56;
      *(_WORD *)&buf[12] = 2112;
      if (v55)
        v19 = CFSTR("fresh");
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v71 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "New syncing policy: %@ (%@) views: %@", buf, 0x20u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "overallLaunch"));
    objc_msgSend(v21, "addEvent:", CFSTR("syncing-policy-set"));

    v69[0] = CKKSSEViewPTA;
    v69[1] = CKKSSEViewPTC;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewAllowList](self, "viewAllowList"));
    if (v24)
    {
      v25 = sub_10000BDF4(CFSTR("ckks-policy"), 0);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewAllowList](self, "viewAllowList"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Intersecting view list with allow list: %@", buf, 0xCu);

      }
      v28 = objc_msgSend(v16, "mutableCopy");
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewAllowList](self, "viewAllowList"));
      objc_msgSend(v28, "intersectSet:", v29);

      v30 = v28;
      v31 = sub_10000BDF4(CFSTR("ckks-policy"), 0);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v30;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Final list: %@", buf, 0xCu);
      }

      v33 = objc_msgSend(v23, "mutableCopy");
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewAllowList](self, "viewAllowList"));
      objc_msgSend(v33, "intersectSet:", v34);

      v35 = v33;
      v36 = sub_10000BDF4(CFSTR("ckks-policy"), 0);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v35;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Final list of externally-managed view names: %@", buf, 0xCu);
      }

    }
    else
    {
      v30 = v16;
      v35 = v23;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v71) = 0;
    v65 = 0;
    v66 = &v65;
    v67 = 0x2020000000;
    v68 = 0;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "databaseProvider"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10017649C;
    v58[3] = &unk_1002E9808;
    v58[4] = self;
    v43 = v30;
    v59 = v43;
    v60 = v56;
    v44 = v35;
    v61 = v44;
    v62 = &v65;
    v63 = buf;
    v64 = v55;
    objc_msgSend(v42, "dispatchSyncWithReadOnlySQLTransaction:", v58);

    if (v55)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
      objc_msgSend(v45, "handleFlag:", CFSTR("policy_fresh"));

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
      objc_msgSend(v46, "handleFlag:", CFSTR("process_incoming_queue"));

    }
    if (-[CKKSKeychainView itemModificationsBeforePolicyLoaded](self, "itemModificationsBeforePolicyLoaded"))
    {
      v47 = sub_10000BDF4(CFSTR("ckks-policy"), 0);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Issuing scan suggestions to handle missed items", v57, 2u);
      }

      -[CKKSKeychainView setItemModificationsBeforePolicyLoaded:](self, "setItemModificationsBeforePolicyLoaded:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
      objc_msgSend(v49, "handleFlag:", CFSTR("dropped_items"));

    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
    objc_msgSend(v50, "setupAnalytics");

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView policyLoaded](self, "policyLoaded"));
    objc_msgSend(v51, "fulfill");

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v15, 1, 0);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      v40 = 1;
    else
      v40 = *((_BYTE *)v66 + 24) != 0;

    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(buf, 8);

    v39 = v54;
  }
  else
  {
    v38 = sub_10000BDF4(CFSTR("ckks-policy"), 0);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Nil syncing policy presented; ignoring",
        buf,
        2u);
    }
    v40 = 0;
  }

  return v40;
}

- (void)onqueueCreatePriorityViewsProcessedWatcher
{
  OctagonStateMultiStateArrivalWatcher *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];

  v3 = [OctagonStateMultiStateArrivalWatcher alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v15[0] = CFSTR("ready");
  v15[1] = CFSTR("handle_all_views");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  v13[0] = CFSTR("loggedout");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 10, CFSTR("CloudKit account not present")));
  v13[1] = CFSTR("error");
  v14[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 65, CFSTR("CKKS currently in error state")));
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
  v10 = -[OctagonStateMultiStateArrivalWatcher initNamed:serialQueue:states:failStates:](v3, "initNamed:serialQueue:states:failStates:", CFSTR("wait-for-priority-view-processing"), v4, v6, v9);
  -[CKKSKeychainView setPriorityViewsProcessed:](self, "setPriorityViewsProcessed:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView priorityViewsProcessed](self, "priorityViewsProcessed"));
  objc_msgSend(v11, "_onqueueRegisterMultiStateArrivalWatcher:startTimeout:", v12, -1);

}

- (id)createViewState:(id)a3 contextID:(id)a4 zoneIsNew:(BOOL)a5 priorityView:(BOOL)a6 ckksManagedView:(BOOL)a7
{
  id v9;
  id v10;
  CKKSNearFutureScheduler *v11;
  void *v12;
  id v13;
  CKKSNearFutureScheduler *v14;
  CKKSNearFutureScheduler *v15;
  void *v16;
  id v17;
  CKKSNearFutureScheduler *v18;
  CKKSKeychainViewState *v19;
  id v20;
  CKKSKeychainViewState *v21;
  void *v22;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;

  v25 = a7;
  v26 = a6;
  v24 = a5;
  v9 = a3;
  v10 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11 = [CKKSNearFutureScheduler alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ckks-%@-notify-scheduler"), v9));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001761FC;
  v30[3] = &unk_1002EA8C8;
  objc_copyWeak(&v32, &location);
  v13 = v9;
  v31 = v13;
  v14 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v11, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", v12, 250000000, 1000000000, 1, 1001, v30);

  v15 = [CKKSNearFutureScheduler alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-ready-scheduler"), v13));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100176358;
  v27[3] = &unk_1002EA8C8;
  objc_copyWeak(&v29, &location);
  v17 = v13;
  v28 = v17;
  v18 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v15, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", v16, 250000000, 120000000000, 1, 1001, v27);

  v19 = [CKKSKeychainViewState alloc];
  v20 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v17, CKCurrentUserDefaultName);
  v21 = -[CKKSKeychainViewState initWithZoneID:forContextID:ckksManagedView:priorityView:notifyViewChangedScheduler:notifyViewReadyScheduler:](v19, "initWithZoneID:forContextID:ckksManagedView:priorityView:notifyViewChangedScheduler:notifyViewReadyScheduler:", v20, v10, v25, v26, v14, v18);

  if (v24)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState launch](v21, "launch"));
    objc_msgSend(v22, "setFirstLaunch:", 1);

  }
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v21;
}

- (void)setSyncingViewsAllowList:(id)a3
{
  -[CKKSKeychainView setViewAllowList:](self, "setViewAllowList:", a3);
}

- (void)testDropPolicy
{
  void *v3;
  void *v4;
  CKKSCondition *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  objc_msgSend(v3, "applyNewSyncingPolicy:viewStates:", 0, v4);

  v5 = objc_alloc_init(CKKSCondition);
  -[CKKSKeychainView setPolicyLoaded:](self, "setPolicyLoaded:", v5);

}

- (id)viewStateForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewStateForName:", v4));

  return v6;
}

- (void)_onqueuePrioritizePriorityViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allPriorityViews"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_msgSend(v5, "limitOperationToPriorityViews");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v7 = sub_10000BDF4(CFSTR("ckksviews"), v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "views"));
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restricting operation to priority views: %@", buf, 0xCu);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allViews"));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v18 = objc_msgSend(v17, "priorityView");
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "launch"));
          v20 = v19;
          if (v18)
            v21 = CFSTR("priority-start");
          else
            v21 = CFSTR("priority-pause");
          objc_msgSend(v19, "addEvent:", v21);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "overallLaunch"));
    objc_msgSend(v23, "addEvent:", CFSTR("priority-start"));

  }
}

- (BOOL)zoneIsReadyForFetching:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[4];
  CKKSKeychainView *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001761C8;
  v6[3] = &unk_1002EAC48;
  v9 = &v10;
  v7 = self;
  v3 = a3;
  v8 = v3;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](v7, "dispatchSyncWithReadOnlySQLTransaction:", v6);
  v4 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (BOOL)_onQueueZoneIsReadyForFetching:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _BYTE v35[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ((id)-[CKKSKeychainView accountStatus](self, "accountStatus") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
    v9 = objc_claimAutoreleasedReturnValue(+[CKKSZoneStateEntry contextID:zoneName:](CKKSZoneStateEntry, "contextID:zoneName:", v7, v8));

    if ((-[NSObject ckzonecreated](v9, "ckzonecreated") & 1) != 0)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "views"));

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
LABEL_5:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if ((v19 & 1) != 0)
            break;
          if (v13 == (id)++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
            if (v13)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v25 = v16;

        if (!v25)
          goto LABEL_19;
        v22 = 1;
        goto LABEL_23;
      }
LABEL_11:

LABEL_19:
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
      v27 = sub_10000BDF4(CFSTR("ckksfetch"), v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Not participating in fetch: zone is not active", buf, 2u);
      }

      v25 = 0;
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
      v24 = sub_10000BDF4(CFSTR("ckksfetch"), v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not participating in fetch: zone not created yet", buf, 2u);
      }
    }
    v22 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  v21 = sub_10000BDF4(CFSTR("ckksfetch"), v20);
  v9 = objc_claimAutoreleasedReturnValue(v21);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not participating in fetch: not logged in", buf, 2u);
  }
  v22 = 0;
LABEL_24:

  return v22;
}

- (id)participateInFetch:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  CKKSCloudKitFetchRequest *v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100174EB0;
  v15 = sub_100174EC0;
  v16 = (CKKSCloudKitFetchRequest *)0xAAAAAAAAAAAAAAAALL;
  v16 = objc_alloc_init(CKKSCloudKitFetchRequest);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100175FB4;
  v8[3] = &unk_1002EAC48;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](self, "dispatchSyncWithReadOnlySQLTransaction:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)changesFetched:(id)a3 deletedRecordIDs:(id)a4 zoneID:(id)a5 newChangeToken:(id)a6 moreComing:(BOOL)a7 resync:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void **v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  CKKSKeychainView *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BOOL v36;
  BOOL v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_100175400;
  v30 = &unk_1002E9830;
  v31 = self;
  v18 = v16;
  v32 = v18;
  v19 = v14;
  v33 = v19;
  v36 = a8;
  v20 = v15;
  v37 = a7;
  v34 = v20;
  v35 = v17;
  v21 = v17;
  -[CKKSKeychainView dispatchSyncWithSQLTransaction:](self, "dispatchSyncWithSQLTransaction:", &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", v27, v28, v29, v30, v31));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "zoneName"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "viewStateForName:", v23));

  if (objc_msgSend(v20, "count"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "notifyViewChangedScheduler"));
    objc_msgSend(v25, "trigger");

  }
  if ((objc_msgSend(v24, "ckksManagedView") & 1) == 0)
  {
    if (objc_msgSend(v19, "count") || objc_msgSend(v20, "count"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "notifyViewChangedScheduler"));
      objc_msgSend(v26, "trigger");

    }
    if (!a7)
      objc_msgSend(v24, "launchComplete");
  }

}

- (BOOL)ckErrorOrPartialError:(id)a3 isError:(int64_t)a4 zoneID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "code") == (id)a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v10 = objc_msgSend(v9, "isEqualToString:", CKErrorDomain);

    if ((v10 & 1) != 0)
      goto LABEL_3;
  }
  if (objc_msgSend(v7, "code") != (id)2
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain")),
        v13 = objc_msgSend(v12, "isEqualToString:", CKErrorDomain),
        v12,
        !v13))
  {
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v8));
  if (objc_msgSend(v16, "code") != (id)a4)
  {

    goto LABEL_10;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "domain"));
  v18 = objc_msgSend(v17, "isEqualToString:", CKErrorDomain);

  if ((v18 & 1) == 0)
    goto LABEL_10;
LABEL_3:
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)shouldRetryAfterFetchError:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  void *v19;
  id v20;
  void *v21;
  id v22;
  int v23;
  id v24;

  v6 = a3;
  v7 = a4;
  if (-[CKKSKeychainView ckErrorOrPartialError:isError:zoneID:](self, "ckErrorOrPartialError:isError:zoneID:", v6, 21, v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
    v9 = sub_10000BDF4(CFSTR("ckks"), v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Received notice that our change token is out of date (for %@). Resetting local data...", (uint8_t *)&v23, 0xCu);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v12 = v11;
    v13 = CFSTR("ck_change_token_expired");
  }
  else
  {
    if (!-[CKKSKeychainView ckErrorOrPartialError:isError:zoneID:](self, "ckErrorOrPartialError:isError:zoneID:", v6, 26, v7))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      if (objc_msgSend(v19, "isEqualToString:", CKErrorDomain))
      {
        v20 = objc_msgSend(v6, "code");

        if (v20 == (id)5)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
          v22 = sub_10000BDF4(CFSTR("ckks"), v21);
          v12 = objc_claimAutoreleasedReturnValue(v22);

          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v23) = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Received notice that our container does not exist. Nothing to do.", (uint8_t *)&v23, 2u);
          }
          goto LABEL_10;
        }
      }
      else
      {

      }
      v17 = 1;
      goto LABEL_11;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
    v15 = sub_10000BDF4(CFSTR("ckks"), v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Received notice that our zone(%@) does not exist. Resetting local data.", (uint8_t *)&v23, 0xCu);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v12 = v11;
    v13 = CFSTR("ck_zone_missing");
  }
  -[NSObject handleFlag:](v11, "handleFlag:", v13);
LABEL_10:

  v17 = 0;
LABEL_11:

  return v17;
}

- (void)selfPeerChanged:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName", a3));
  v5 = sub_10000BDF4(CFSTR("ckks"), v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Received update that our self identity has changed", v7, 2u);
  }

  -[CKKSKeychainView keyStateMachineRequestProcess](self, "keyStateMachineRequestProcess");
}

- (void)trustedPeerSetChanged:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName", a3));
  v5 = sub_10000BDF4(CFSTR("ckks"), v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Received update that the trust set has changed", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v7, "handleFlag:", CFSTR("trusted_peers_changed"));

}

- (BOOL)outgoingQueueEmpty:(id *)a3
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10017539C;
  v5[3] = &unk_1002EAD08;
  v5[4] = &v6;
  v5[5] = a3;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](self, "dispatchSyncWithReadOnlySQLTransaction:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)waitForFetchAndIncomingQueueProcessing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneChangeFetcher](self, "zoneChangeFetcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inflightFetch"));

  if (v4)
    objc_msgSend(v4, "waitUntilFinished");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conditionForFlagIfPresent:", CFSTR("process_incoming_queue")));

  if (v7)
    v8 = objc_msgSend(v7, "wait:", 117000000000) == 0;
  else
    v8 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "paused"));
  if (objc_msgSend(v10, "wait:", 109000000000))
    v8 = 0;

  return v8;
}

- (BOOL)waitForKeyHierarchyReadiness
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  char v7;
  void *i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allCKKSManagedViews"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "keyHierarchyConditions"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ready")));
        v11 = objc_msgSend(v10, "wait:", 300000000000) == 0;

        v7 &= v11;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)scheduleOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (-[CKKSKeychainView halted](self, "halted"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v6 = sub_10000BDF4(CFSTR("ckkszone"), v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "attempted to schedule an operation on a halted zone, ignoring", v9, 2u);
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountLoggedInDependency](self, "accountLoggedInDependency"));
    objc_msgSend(v4, "addNullableDependency:", v8);

    v7 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    -[NSObject addOperation:](v7, "addOperation:", v4);
  }

}

- (BOOL)scheduleOperationWithoutDependencies:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  v5 = -[CKKSKeychainView halted](self, "halted");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v7 = sub_10000BDF4(CFSTR("ckkszone"), v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "attempted to schedule an non-dependent operation on a halted zone, ignoring", v10, 2u);
    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    -[NSObject addOperation:](v8, "addOperation:", v4);
  }

  return v5 ^ 1;
}

- (BOOL)waitUntilAllOperationsAreFinished
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "paused"));
  v4 = objc_msgSend(v3, "wait:", 189000000000) == 0;

  return v4;
}

- (void)waitForOperationsOfClass:(Class)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "operations"));
  v6 = objc_msgSend(v5, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v12, a3) & 1) != 0)
          objc_msgSend(v12, "waitUntilFinished", (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)cancelPendingOperations
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "cancel");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
  objc_msgSend(v8, "removeAllObjects");

  objc_sync_exit(v3);
}

- (void)cancelAllOperations
{
  id v3;

  -[CKKSKeychainView cancelPendingOperations](self, "cancelPendingOperations");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
  objc_msgSend(v3, "cancelAllOperations");

}

- (void)halt
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[5];
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "haltOperation");

  v4 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100175390;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v4, block);

  -[CKKSKeychainView cancelAllOperations](self, "cancelAllOperations");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operations"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isExecuting"))
          objc_msgSend(v11, "waitUntilFinished");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allViews"));

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "notifyViewChangedScheduler"));
        objc_msgSend(v19, "cancel");

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "notifyViewReadyScheduler"));
        objc_msgSend(v20, "cancel");

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v15);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneChangeFetcher](self, "zoneChangeFetcher"));
  objc_msgSend(v21, "halt");

}

- (BOOL)waitForPolicy:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v13[8];
  NSErrorUserInfoKey v14;
  void *v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView policyLoaded](self, "policyLoaded"));
  v7 = objc_msgSend(v6, "wait:", a3);

  if (v7)
  {
    v8 = sub_10000BDF4(CFSTR("ckks"), 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Haven't yet received a syncing policy", v13, 2u);
    }

    if (a4)
    {
      v14 = NSLocalizedDescriptionKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKKS syncing policy not yet loaded")));
      v15 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 56, v11));

    }
  }
  return v7 == 0;
}

- (id)policyDependentViewStateForName:(id)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  NSErrorUserInfoKey v26;
  void *v27;

  v8 = a3;
  if (-[CKKSKeychainView waitForPolicy:error:](self, "waitForPolicy:error:", a4, a5))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_100174EB0;
    v24 = sub_100174EC0;
    v25 = 0;
    v9 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100175234;
    block[3] = &unk_1002EAC48;
    block[4] = self;
    v10 = v8;
    v18 = v10;
    v19 = &v20;
    dispatch_sync(v9, block);

    v11 = (void *)v21[5];
    if (v11)
    {
      if ((objc_msgSend(v11, "ckksManagedView") & 1) != 0)
      {
        a5 = (id *)(id)v21[5];
LABEL_11:

        _Block_object_dispose(&v20, 8);
        goto LABEL_12;
      }
      if (!a5)
        goto LABEL_11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21[5], "zoneName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot get view %@; is externally managed"),
                        v14));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 63, v15));

    }
    else
    {
      if (!a5)
        goto LABEL_11;
      v26 = NSLocalizedDescriptionKey;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No syncing view for '%@'"), v10));
      v27 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 11, v13));

    }
    a5 = 0;
    goto LABEL_11;
  }
  a5 = 0;
LABEL_12:

  return a5;
}

- (id)policyDependentViewStateForName:(id)a3 error:(id *)a4
{
  return -[CKKSKeychainView policyDependentViewStateForName:timeout:error:](self, "policyDependentViewStateForName:timeout:error:", a3, 5000000000, a4);
}

- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 errorOnNoCloudKitAccount:(BOOL)a5 errorOnPolicyMissing:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  const __CFString *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  BOOL v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  int v32;
  id v33;
  __int16 v34;
  NSObject *v35;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "completedSecCKKSInitialize"));
  v15 = objc_msgSend(v14, "wait:", 5000000000);

  if (v15)
  {
    v16 = sub_10000BDF4(CFSTR("ckks"), 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Haven't yet initialized SecDb; expect failure",
        (uint8_t *)&v32,
        2u);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
  v19 = v18;
  if (v10)
    v20 = 500000000;
  else
    v20 = 2000000000;
  objc_msgSend(v18, "wait:", v20);

  v21 = -[CKKSKeychainView accountStatus](self, "accountStatus");
  if (v9 && v21 != 1)
  {
    if (v21)
    {
      v22 = CFSTR("User is not signed into iCloud.");
      v23 = 10;
    }
    else
    {
      v22 = CFSTR("iCloud account status unknown.");
      v23 = 64;
    }
    v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), v23, v22));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    v28 = sub_10000BDF4(CFSTR("ckkscurrent"), v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138412546;
      v33 = v12;
      v34 = 2112;
      v35 = v25;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Rejecting %@ RPC since we don't have an iCloud account: %@", (uint8_t *)&v32, 0x16u);
    }

    if (a7)
    {
      v25 = objc_retainAutorelease(v25);
      v26 = 0;
      *a7 = v25;
LABEL_27:

      goto LABEL_28;
    }
LABEL_23:
    v26 = 0;
    goto LABEL_27;
  }
  if (v8)
  {
    if (!-[CKKSKeychainView waitForPolicy:error:](self, "waitForPolicy:error:", 5000000000, a7))
    {
      v24 = sub_10000BDF4(CFSTR("ckks"), 0);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v32 = 138412290;
        v33 = v12;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Haven't yet received a policy; failing %@",
          (uint8_t *)&v32,
          0xCu);
      }
      goto LABEL_23;
    }
  }
  else if (!-[CKKSKeychainView waitForPolicy:error:](self, "waitForPolicy:error:", 500000000, 0))
  {
    v30 = sub_10000BDF4(CFSTR("ckks"), 0);
    v25 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v32 = 138412290;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Haven't yet received a policy; expect failure later doing %@",
        (uint8_t *)&v32,
        0xCu);
    }
    v26 = 1;
    goto LABEL_27;
  }
  v26 = 1;
LABEL_28:

  return v26;
}

- (id)viewsForPeerID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100174EB0;
  v24 = sub_100174EC0;
  v25 = (id)0xAAAAAAAAAAAAAAAALL;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100174EB0;
  v18 = sub_100174EC0;
  v19 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100174EC8;
  v10[3] = &unk_1002EB320;
  v10[4] = self;
  v12 = &v14;
  v7 = v6;
  v11 = v7;
  v13 = &v20;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](self, "dispatchSyncWithReadOnlySQLTransaction:", v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  OctagonStateMultiStateArrivalWatcher *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id location;
  id v32;
  _QWORD v33[5];

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v32 = 0;
  v12 = -[CKKSKeychainView waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:](self, "waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:", CFSTR("status"), v8, 0, 0, &v32);
  v13 = v32;
  if ((v12 & 1) != 0)
  {
    v14 = [OctagonStateMultiStateArrivalWatcher alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    v33[0] = CFSTR("loggedout");
    v33[1] = CFSTR("ready");
    v33[2] = CFSTR("error");
    v33[3] = CFSTR("waitfortrust");
    v33[4] = CFSTR("halted");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 5));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
    v18 = -[OctagonStateMultiStateArrivalWatcher initNamed:serialQueue:states:](v14, "initNamed:serialQueue:states:", CFSTR("rpc-watcher"), v15, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    objc_msgSend(v19, "registerMultiStateArrivalWatcher:startTimeout:", v18, a5);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_1001740C8;
    v26 = &unk_1002E9880;
    objc_copyWeak(&v29, &location);
    v30 = v8;
    v27 = v10;
    v28 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("status-rpc"), &v23));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "result", v23, v24, v25, v26));
    objc_msgSend(v20, "addDependency:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    objc_msgSend(v22, "addOperation:", v20);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v13);
  }

}

- (id)intransactionSlowStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  unsigned int v113;
  const __CFString *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *contexta;
  void *context;
  id v127;
  void *v128;
  id v129;
  id v130;
  id v132;
  id v133;
  id v134;
  id v135;
  _QWORD v136[4];
  id v137;
  id v138;
  _QWORD v139[4];
  id v140;
  id v141;
  _QWORD v142[4];
  _QWORD v143[4];
  _QWORD v144[14];
  _QWORD v145[14];
  uint8_t buf[4];
  void *v147;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeySet loadForZone:contextID:](CKKSCurrentKeySet, "loadForZone:contextID:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
    v10 = sub_10000BDF4(CFSTR("ckks"), v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
      *(_DWORD *)buf = 138412290;
      v147 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "error loading keyset: %@", buf, 0xCu);

    }
  }
  v13 = v3;
  v14 = objc_alloc_init((Class)NSMutableArray);
  v129 = objc_alloc_init((Class)NSMutableArray);
  contexta = objc_autoreleasePoolPush();
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
  v141 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSDeviceStateEntry allInZone:error:](CKKSDeviceStateEntry, "allInZone:error:", v15, &v141));
  v17 = v141;

  v139[0] = _NSConcreteStackBlock;
  v139[1] = 3221225472;
  v139[2] = sub_100174040;
  v139[3] = &unk_1002E98A8;
  v127 = v14;
  v140 = v127;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v139);
  v128 = v6;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTLKPointer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentKeyUUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
  v138 = v17;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSTLKShareRecord allForUUID:contextID:zoneID:error:](CKKSTLKShareRecord, "allForUUID:contextID:zoneID:error:", v19, v20, v21, &v138));
  v23 = v138;

  v136[0] = _NSConcreteStackBlock;
  v24 = v13;
  v136[1] = 3221225472;
  v136[2] = sub_100174084;
  v136[3] = &unk_1002E98A8;
  v130 = v129;
  v137 = v130;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v136);

  objc_autoreleasePoolPop(contexta);
  if (objc_msgSend(v13, "ckksManagedView"))
  {
    v144[0] = CFSTR("statusError");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
    v26 = v25;
    if (v25)
      v27 = v25;
    else
      v27 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v31 = v27;

    context = v31;
    v145[0] = v31;
    v144[1] = CFSTR("oqe");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contextID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneID"));
    v135 = v23;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry countsByStateWithContextID:zoneID:error:](CKKSOutgoingQueueEntry, "countsByStateWithContextID:zoneID:error:", v33, v34, &v135));
    v36 = v135;

    if (v35)
      v37 = v35;
    else
      v37 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v43 = v37;

    v124 = v43;
    v145[1] = v43;
    v144[2] = CFSTR("iqe");
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "contextID"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneID"));
    v134 = v36;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSIncomingQueueEntry countsByStateWithContextID:zoneID:error:](CKKSIncomingQueueEntry, "countsByStateWithContextID:zoneID:error:", v45, v46, &v134));
    v48 = v134;

    if (v47)
      v49 = v47;
    else
      v49 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v54 = v49;

    v123 = v54;
    v145[2] = v54;
    v144[3] = CFSTR("ckmirror");
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "contextID"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneID"));
    v133 = v48;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSMirrorEntry countsByParentKeyWithContextID:zoneID:error:](CKKSMirrorEntry, "countsByParentKeyWithContextID:zoneID:error:", v56, v57, &v133));
    v59 = v133;

    if (v58)
      v60 = v58;
    else
      v60 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v65 = v60;

    v145[3] = v65;
    v144[4] = CFSTR("devicestates");
    v66 = v127;
    v67 = v66;
    if (v66)
      v68 = v66;
    else
      v68 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v71 = v68;

    v145[4] = v71;
    v144[5] = CFSTR("tlkshares");
    v72 = v130;
    v73 = v72;
    v121 = v71;
    v122 = v65;
    if (v72)
      v74 = v72;
    else
      v74 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v75 = v74;

    v145[5] = v75;
    v144[6] = CFSTR("keys");
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "contextID"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneID"));
    v132 = v59;
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey countsByClassWithContextID:zoneID:error:](CKKSKey, "countsByClassWithContextID:zoneID:error:", v77, v78, &v132));
    v80 = v132;

    if (v79)
      v81 = v79;
    else
      v81 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v82 = v81;

    v119 = v82;
    v145[6] = v82;
    v144[7] = CFSTR("currentTLK");
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "tlk"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "uuid"));

    if (v84)
      v85 = v84;
    else
      v85 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v86 = v85;

    v118 = v86;
    v145[7] = v86;
    v144[8] = CFSTR("currentClassA");
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "classA"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "uuid"));

    if (v88)
      v89 = v88;
    else
      v89 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v90 = v89;

    v117 = v90;
    v145[8] = v90;
    v144[9] = CFSTR("currentClassC");
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "classC"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "uuid"));

    if (v92)
      v93 = v92;
    else
      v93 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v94 = v93;

    v116 = v94;
    v145[9] = v94;
    v144[10] = CFSTR("currentTLKPtr");
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "currentTLKPointer"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "currentKeyUUID"));

    if (v96)
      v97 = v96;
    else
      v97 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v98 = v97;

    v145[10] = v98;
    v144[11] = CFSTR("currentClassAPtr");
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "currentClassAPointer"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "currentKeyUUID"));

    v120 = v75;
    if (v100)
      v101 = v100;
    else
      v101 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v102 = v101;
    v103 = v24;

    v145[11] = v102;
    v144[12] = CFSTR("currentClassCPtr");
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "currentClassCPointer"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "currentKeyUUID"));

    v106 = v80;
    if (v105)
      v107 = v105;
    else
      v107 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v108 = v107;

    v145[12] = v108;
    v144[13] = CFSTR("itemsyncing");
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "syncingPolicy"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "zoneID"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "zoneName"));
    v113 = objc_msgSend(v110, "isSyncingEnabledForView:", v112);
    v114 = CFSTR("paused");
    if (v113)
      v114 = CFSTR("enabled");
    v145[13] = v114;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v145, v144, 14));

    v39 = v128;
    v24 = v103;
    v50 = v124;
    v38 = context;
    v23 = v106;
    v69 = v122;
    v61 = v123;
  }
  else
  {
    v142[0] = CFSTR("statusError");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
    v29 = v28;
    if (v28)
      v30 = v28;
    else
      v30 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v38 = v30;
    v39 = v128;

    v143[0] = v38;
    v142[1] = CFSTR("tlkshares");
    v40 = v130;
    v41 = v40;
    if (v40)
      v42 = v40;
    else
      v42 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v50 = v42;

    v143[1] = v50;
    v142[2] = CFSTR("currentTLK");
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "tlk"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "uuid"));

    if (v52)
      v53 = v52;
    else
      v53 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v61 = v53;

    v143[2] = v61;
    v142[3] = CFSTR("currentTLKPtr");
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "currentTLKPointer"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "currentKeyUUID"));

    if (v63)
      v64 = v63;
    else
      v64 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v69 = v64;

    v143[3] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v143, v142, 4));
  }

  return v70;
}

- (id)fastStatus:(id)a3 zoneStateEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v26[7];
  _QWORD v27[7];

  v5 = a3;
  v26[0] = CFSTR("view");
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v10 = v9;

  v27[0] = v10;
  v26[1] = CFSTR("zoneCreated");
  if (objc_msgSend(v6, "ckzonecreated"))
    v11 = CFSTR("yes");
  else
    v11 = CFSTR("no");
  v27[1] = v11;
  v26[2] = CFSTR("zoneSubscribed");
  v12 = objc_msgSend(v6, "ckzonesubscribed");

  if (v12)
    v13 = CFSTR("yes");
  else
    v13 = CFSTR("no");
  v27[2] = v13;
  v26[3] = CFSTR("keystate");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewKeyHierarchyState"));
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v27[3] = v17;
  v26[4] = CFSTR("ckksManaged");
  if (objc_msgSend(v5, "ckksManagedView"))
    v18 = CFSTR("yes");
  else
    v18 = CFSTR("no");
  v27[4] = v18;
  v26[5] = CFSTR("statusError");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v27[5] = v19;
  v26[6] = CFSTR("launchSequence");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launch"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "eventsByTime"));

  if (v21)
    v22 = v21;
  else
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v23 = v22;

  v27[6] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 7));

  return v24;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 24, 1);
}

- (CKKSAccountStateTracker)accountTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccountTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 40, 1);
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (CKKSCondition)loggedIn
{
  return (CKKSCondition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLoggedIn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CKKSCondition)loggedOut
{
  return (CKKSCondition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLoggedOut:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CKKSCondition)accountStateKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAccountStateKnown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)trustStatus
{
  return self->_trustStatus;
}

- (void)setTrustStatus:(int64_t)a3
{
  self->_trustStatus = a3;
}

- (CKKSCondition)trustStatusKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTrustStatusKnown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 112, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPersonaAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)keyStateMachineRefetched
{
  return self->_keyStateMachineRefetched;
}

- (void)setKeyStateMachineRefetched:(BOOL)a3
{
  self->_keyStateMachineRefetched = a3;
}

- (BOOL)keyStateFullRefetchRequested
{
  return self->_keyStateFullRefetchRequested;
}

- (void)setKeyStateFullRefetchRequested:(BOOL)a3
{
  self->_keyStateFullRefetchRequested = a3;
}

- (BOOL)firstManateeKeyFetched
{
  return self->_firstManateeKeyFetched;
}

- (void)setFirstManateeKeyFetched:(BOOL)a3
{
  self->_firstManateeKeyFetched = a3;
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccountsAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (CKKSCuttlefishAdapterProtocol)cuttlefishAdapter
{
  return (CKKSCuttlefishAdapterProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCuttlefishAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CKKSZoneChangeFetcher)zoneChangeFetcher
{
  return (CKKSZoneChangeFetcher *)objc_getProperty(self, a2, 144, 1);
}

- (void)setZoneChangeFetcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CKKSNearFutureScheduler)suggestTLKUpload
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSuggestTLKUpload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (CKKSNearFutureScheduler)outgoingQueueOperationScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOutgoingQueueOperationScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (CKKSNearFutureScheduler)outgoingQueuePriorityOperationScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOutgoingQueuePriorityOperationScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (CKKSIncomingQueueOperation)lastIncomingQueueOperation
{
  return (CKKSIncomingQueueOperation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastIncomingQueueOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (CKKSNewTLKOperation)lastNewTLKOperation
{
  return (CKKSNewTLKOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastNewTLKOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (CKKSOutgoingQueueOperation)lastOutgoingQueueOperation
{
  return (CKKSOutgoingQueueOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLastOutgoingQueueOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (CKKSProcessReceivedKeysOperation)lastProcessReceivedKeysOperation
{
  return (CKKSProcessReceivedKeysOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastProcessReceivedKeysOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (CKKSReencryptOutgoingItemsOperation)lastReencryptOutgoingItemsOperation
{
  return (CKKSReencryptOutgoingItemsOperation *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastReencryptOutgoingItemsOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (CKKSSynchronizeOperation)lastSynchronizeOperation
{
  return (CKKSSynchronizeOperation *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLastSynchronizeOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (CKKSResultOperation)lastFixupOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLastFixupOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSOperation)holdOutgoingQueueOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 232, 1);
}

- (void)setHoldOutgoingQueueOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSOperation)holdIncomingQueueOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHoldIncomingQueueOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSOperation)holdLocalSynchronizeOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 248, 1);
}

- (void)setHoldLocalSynchronizeOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)initiatedLocalScan
{
  return self->_initiatedLocalScan;
}

- (void)setInitiatedLocalScan:(BOOL)a3
{
  self->_initiatedLocalScan = a3;
}

- (CKKSOperationDependencies)operationDependencies
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 264, 1);
}

- (CKKSCondition)policyLoaded
{
  return (CKKSCondition *)objc_getProperty(self, a2, 272, 1);
}

- (void)setPolicyLoaded:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (OctagonStateMultiStateArrivalWatcher)priorityViewsProcessed
{
  return (OctagonStateMultiStateArrivalWatcher *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPriorityViewsProcessed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (BOOL)itemModificationsBeforePolicyLoaded
{
  return self->_itemModificationsBeforePolicyLoaded;
}

- (void)setItemModificationsBeforePolicyLoaded:(BOOL)a3
{
  self->_itemModificationsBeforePolicyLoaded = a3;
}

- (CKKSResultOperation)resultsOfNextIncomingQueueOperationOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 288, 1);
}

- (void)setResultsOfNextIncomingQueueOperationOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSHashTable)outgoingQueueOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 296, 1);
}

- (void)setOutgoingQueueOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSMutableSet)resyncRecordsSeen
{
  return (NSMutableSet *)objc_getProperty(self, a2, 304, 1);
}

- (void)setResyncRecordsSeen:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (CKKSSecDbAdapter)databaseProvider
{
  return (CKKSSecDbAdapter *)objc_getProperty(self, a2, 312, 1);
}

- (void)setDatabaseProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 320, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (CKKSResultOperation)accountLoggedInDependency
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 328, 1);
}

- (void)setAccountLoggedInDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (NSArray)currentTrustStates
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setCurrentTrustStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSSet)viewAllowList
{
  return (NSSet *)objc_getProperty(self, a2, 344, 1);
}

- (void)setViewAllowList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (BOOL)havoc
{
  return self->_havoc;
}

- (void)setHavoc:(BOOL)a3
{
  self->_havoc = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewAllowList, 0);
  objc_storeStrong((id *)&self->_currentTrustStates, 0);
  objc_storeStrong((id *)&self->_accountLoggedInDependency, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_resyncRecordsSeen, 0);
  objc_storeStrong((id *)&self->_outgoingQueueOperations, 0);
  objc_storeStrong((id *)&self->_resultsOfNextIncomingQueueOperationOperation, 0);
  objc_storeStrong((id *)&self->_priorityViewsProcessed, 0);
  objc_storeStrong((id *)&self->_policyLoaded, 0);
  objc_storeStrong((id *)&self->_operationDependencies, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_holdLocalSynchronizeOperation, 0);
  objc_storeStrong((id *)&self->_holdIncomingQueueOperation, 0);
  objc_storeStrong((id *)&self->_holdOutgoingQueueOperation, 0);
  objc_storeStrong((id *)&self->_lastFixupOperation, 0);
  objc_storeStrong((id *)&self->_lastSynchronizeOperation, 0);
  objc_storeStrong((id *)&self->_lastReencryptOutgoingItemsOperation, 0);
  objc_storeStrong((id *)&self->_lastProcessReceivedKeysOperation, 0);
  objc_storeStrong((id *)&self->_lastOutgoingQueueOperation, 0);
  objc_storeStrong((id *)&self->_lastNewTLKOperation, 0);
  objc_storeStrong((id *)&self->_lastIncomingQueueOperation, 0);
  objc_storeStrong((id *)&self->_outgoingQueuePriorityOperationScheduler, 0);
  objc_storeStrong((id *)&self->_outgoingQueueOperationScheduler, 0);
  objc_storeStrong((id *)&self->_suggestTLKUpload, 0);
  objc_storeStrong((id *)&self->_zoneChangeFetcher, 0);
  objc_storeStrong((id *)&self->_cuttlefishAdapter, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_trustStatusKnown, 0);
  objc_storeStrong((id *)&self->_accountStateKnown, 0);
  objc_storeStrong((id *)&self->_loggedOut, 0);
  objc_storeStrong((id *)&self->_loggedIn, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudKitClassDependencies, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_accountTracker, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (id)externalManagedViewForRPC:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  if (-[CKKSKeychainView waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:](self, "waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:", CFSTR("external operation"), 0, 1, 1, a4))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allExternalManagedViews"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
        v15 = objc_msgSend(v14, "isEqualToString:", v6);

        if ((v15 & 1) != 0)
          break;
        if (v10 == (id)++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v16 = v13;

      if (!v16)
        goto LABEL_16;
      if (!objc_msgSend(v16, "ckksManagedView"))
      {
        v16 = v16;
        a4 = (id *)v16;
        goto LABEL_21;
      }
      if (!a4)
        goto LABEL_21;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("View is not externally managed: '%@'"), v6));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 62, v17));

    }
    else
    {
LABEL_10:

LABEL_16:
      if (!a4)
      {
        v16 = 0;
        goto LABEL_21;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown external view: '%@'"), v6));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 11, v18));

      v16 = 0;
    }
    a4 = 0;
LABEL_21:

    goto LABEL_22;
  }
  a4 = 0;
LABEL_22:

  return a4;
}

- (void)resetExternallyManagedCloudKitView:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v14 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView externalManagedViewForRPC:error:](self, "externalManagedViewForRPC:error:", v6, &v14));
  v9 = v14;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
    v11 = -[CKKSKeychainView rpcResetCloudKit:reply:](self, "rpcResetCloudKit:reply:", v10, v7);

  }
  else
  {
    v12 = sub_10000BDF4(CFSTR("ckkszone"), 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Can't reset CloudKit zone for view %@: %@", buf, 0x16u);
    }

    v7[2](v7, v9);
  }

}

- (void)proposeTLKForExternallyManagedView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _BYTE location[12];
  __int16 v34;
  id v35;

  v12 = a3;
  v23 = a4;
  v24 = a5;
  v13 = a6;
  v14 = a7;
  v32 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView externalManagedViewForRPC:error:](self, "externalManagedViewForRPC:error:", v12, &v32));
  v16 = v32;
  if (v15)
  {
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001A730C;
    v25[3] = &unk_1002EA9F8;
    objc_copyWeak(&v31, (id *)location);
    v26 = v23;
    v27 = v15;
    v28 = v24;
    v17 = v14;
    v30 = v17;
    v29 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionGroupOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("external-tlk-rpc"), CFSTR("ready"), CFSTR("ready"), v25));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("ready")));
    objc_msgSend(v19, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("external-tlk-rpc"), v18, v20, v17);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v21 = sub_10000BDF4(CFSTR("ckkszone"), 0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v12;
      v34 = 2112;
      v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Can't propose TLKs for view %@: %@", location, 0x16u);
    }

    (*((void (**)(id, id))v14 + 2))(v14, v16);
  }

}

- (void)fetchExternallyManagedViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v14 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView externalManagedViewForRPC:error:](self, "externalManagedViewForRPC:error:", v8, &v14));
  v11 = v14;
  if (v10)
  {
    if (v6)
      -[CKKSKeychainView fetchCloudKitExternallyManagedViewKeyHierarchy:reply:](self, "fetchCloudKitExternallyManagedViewKeyHierarchy:reply:", v10, v9);
    else
      -[CKKSKeychainView loadKeys:reply:](self, "loadKeys:reply:", v10, v9);
  }
  else
  {
    v12 = sub_10000BDF4(CFSTR("ckkszone"), 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Can't fetch CloudKit zone for view %@: %@", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, 0, v11);
  }

}

- (void)fetchCloudKitExternallyManagedViewKeyHierarchy:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView rpcFetchBecause:](self, "rpcFetchBecause:", CFSTR("se-api")));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A71A4;
  v13[3] = &unk_1002EAA20;
  objc_copyWeak(&v17, &location);
  v9 = v8;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("rpc-response"), v13));
  objc_msgSend(v12, "addDependency:", v9);
  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)loadKeys:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView databaseProvider](self, "databaseProvider"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A6A70;
  v11[3] = &unk_1002EB078;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "dispatchSyncWithReadOnlySQLTransaction:", v11);

}

- (void)modifyTLKSharesForExternallyManagedView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _BYTE location[12];
  __int16 v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id))a6;
  v26 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView externalManagedViewForRPC:error:](self, "externalManagedViewForRPC:error:", v10, &v26));
  v15 = v26;
  if (v14)
  {
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001A56C4;
    v21[3] = &unk_1002EAAD8;
    objc_copyWeak(&v25, (id *)location);
    v22 = v14;
    v23 = v11;
    v24 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionGroupOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("external-tlk-rpc"), CFSTR("ready"), CFSTR("ready"), v21));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("ready")));
    objc_msgSend(v17, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("external-tlkshare-modification-rpc"), v16, v18, v13);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v19 = sub_10000BDF4(CFSTR("ckkszone"), 0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v10;
      v28 = 2112;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Can't modify CloudKit zone for view %@: %@", location, 0x16u);
    }

    v13[2](v13, v15);
  }

}

@end
