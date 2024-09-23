@implementation KCSharingDatabaseUpdatePlan

- (KCSharingDatabaseUpdatePlan)init
{
  KCSharingDatabaseUpdatePlan *v2;
  uint64_t v3;
  NSMutableArray *insertIntoLocalAndMirror;
  uint64_t v5;
  NSMutableArray *reinsertIntoLocal;
  NSMutableArray *v7;
  NSMutableArray *insertIntoIncoming;
  uint64_t v9;
  NSMutableArray *insertIntoMirror;
  uint64_t v11;
  NSMutableArray *insertIntoOutgoing;
  uint64_t v13;
  NSMutableArray *itemsToDelete;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)KCSharingDatabaseUpdatePlan;
  v2 = -[KCSharingDatabaseUpdatePlan init](&v16, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    insertIntoLocalAndMirror = v2->_insertIntoLocalAndMirror;
    v2->_insertIntoLocalAndMirror = (NSMutableArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    reinsertIntoLocal = v2->_reinsertIntoLocal;
    v2->_reinsertIntoLocal = (NSMutableArray *)v5;

    v7 = objc_opt_new(NSMutableArray);
    insertIntoIncoming = v2->_insertIntoIncoming;
    v2->_insertIntoIncoming = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    insertIntoMirror = v2->_insertIntoMirror;
    v2->_insertIntoMirror = (NSMutableArray *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    insertIntoOutgoing = v2->_insertIntoOutgoing;
    v2->_insertIntoOutgoing = (NSMutableArray *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    itemsToDelete = v2->_itemsToDelete;
    v2->_itemsToDelete = (NSMutableArray *)v13;

  }
  return v2;
}

- (BOOL)hasChanges
{
  return -[NSMutableArray count](self->_insertIntoLocalAndMirror, "count")
      || -[NSMutableArray count](self->_reinsertIntoLocal, "count")
      || -[NSMutableArray count](self->_insertIntoIncoming, "count")
      || -[NSMutableArray count](self->_insertIntoMirror, "count")
      || -[NSMutableArray count](self->_insertIntoOutgoing, "count")
      || -[NSMutableArray count](self->_itemsToDelete, "count") != 0;
}

- (id)groupUpdateInfoFrom:(SecDbItem *)a3 to:(id)a4
{
  id v5;
  KCSharingMirrorEntry *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;

  v5 = a4;
  v41 = 0;
  v6 = -[KCSharingMirrorEntry initWithMirrorDatabaseItem:error:]([KCSharingMirrorEntry alloc], "initWithMirrorDatabaseItem:error:", a3, &v41);
  v7 = v41;
  if (!v6)
  {
    v28 = KCSharingLogObject(CFSTR("KCSharingDatabaseUpdatePlan"));
    v15 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v25 = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    v43 = v7;
    v29 = "Existing stored share didn't turn into MirrorEntry: %@";
    v30 = v15;
    v31 = 12;
LABEL_18:
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMirrorEntry record](v6, "record"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordName"));
  if ((objc_msgSend(v10, "isEqual:", CKRecordNameZoneWideShare) & 1) == 0)
  {

    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "record"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordName"));
  v14 = objc_msgSend(v13, "isEqual:", CKRecordNameZoneWideShare);

  if ((v14 & 1) == 0)
  {
LABEL_10:
    v32 = KCSharingLogObject(CFSTR("KCSharingDatabaseUpdatePlan"));
    v15 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v29 = "Stored share or new share isn't actually a share?!";
    v30 = v15;
    v31 = 2;
    goto LABEL_18;
  }
  v15 = objc_claimAutoreleasedReturnValue(-[KCSharingMirrorEntry record](v6, "record"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "record"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "participants"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject participants](v15, "participants"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));
  objc_msgSend(v18, "minusSet:", v20);

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000CDF60;
  v39[3] = &unk_1002DD3A0;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v40 = v21;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v39);
  if (objc_msgSend(v21, "count"))
  {
    v22 = objc_alloc((Class)KCSharingGroupUpdateInfo);
    v23 = sub_10004D234(v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = objc_msgSend(v22, "initWithGroup:addedParticipants:", v24, v21);

    v26 = KCSharingLogObject(CFSTR("KCSharingDatabaseUpdatePlan"));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v43 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Group update info: %{private}@", buf, 0xCu);
    }
  }
  else
  {
    v34 = KCSharingLogObject(CFSTR("KCSharingDatabaseUpdatePlan"));
    v27 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "zoneID"));
      v36 = sub_10004CEEC(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      *(_DWORD *)buf = 138412290;
      v43 = v37;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Group update for %@ with no new participants", buf, 0xCu);

    }
    v25 = 0;
  }

LABEL_12:
  return v25;
}

- (id)updateInfoForDeletion:(SecDbItem *)a3
{
  SecDbClass *var1;
  id v5;
  const void *v7;
  NSString *v8;
  BOOL v9;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;

  var1 = a3->var1;
  if (var1 != (SecDbClass *)sub_1000119B8((uint64_t)CFSTR("sharingIncomingQueue"), &qword_100341280, (uint64_t)&unk_100341278))goto LABEL_2;
  v7 = sub_10000C1D0(a3, CFSTR("deln"));
  if (!v7 || !CFEqual(v7, &off_10030A6D0))
    goto LABEL_2;
  v8 = (NSString *)sub_10000C1D0(a3, kSecAttrUUID);
  if (v8)
    v9 = CKRecordNameZoneWideShare == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v8 != CKRecordNameZoneWideShare)
    {
LABEL_2:
      v5 = 0;
      return v5;
    }
  }
  else if (!CFEqual(v8, CKRecordNameZoneWideShare))
  {
    goto LABEL_2;
  }
  if (!sub_10000C1D0(a3, CFSTR("zone")))
    goto LABEL_2;
  v11 = (id)sub_10000C1D0(a3, CFSTR("zone"));
  if (objc_msgSend(v11, "hasPrefix:", CFSTR("group-")))
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("group-"), "length")));
  else
    v12 = 0;

  v5 = objc_msgSend(objc_alloc((Class)KCSharingGroupUpdateInfo), "initWithDepartedGroupID:", v12);
  v13 = KCSharingLogObject(CFSTR("KCSharingDatabaseUpdatePlan"));
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138477827;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Group update info: %{private}@", (uint8_t *)&v15, 0xCu);
  }

  return v5;
}

- (BOOL)applyInTransaction:(__OpaqueSecDbConnection *)a3 withAccessGroups:(id)a4 error:(id *)a5
{
  return -[KCSharingDatabaseUpdatePlan applyInTransaction:withAccessGroups:updateInfos:error:](self, "applyInTransaction:withAccessGroups:updateInfos:error:", a3, a4, 0, a5);
}

- (BOOL)applyInTransaction:(__OpaqueSecDbConnection *)a3 withAccessGroups:(id)a4 updateInfos:(id)a5 error:(id *)a6
{
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  char *v14;
  void *v15;
  KCSharingMirrorEntry *v16;
  void *v17;
  uint64_t v18;
  KCSharingMirrorEntry *v19;
  void *v20;
  uint64_t v21;
  KCSharingMirrorEntry *v22;
  KCSharingMirrorEntry *v23;
  KCSharingMirrorEntry *v24;
  uint64_t v25;
  KCSharingMirrorEntry *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSMutableArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char *v37;
  void *v38;
  KCSharingMirrorEntry *v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  void *v43;
  KCSharingMirrorEntry *v44;
  KCSharingMirrorEntry *v45;
  KCSharingMirrorEntry *v46;
  unsigned int v47;
  uint64_t v48;
  KCSharingMirrorEntry *v49;
  KCSharingMirrorEntry *v50;
  NSMutableArray *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  const __CFDictionary *v58;
  id v59;
  void *v60;
  id v61;
  const void *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  const void *v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  const void *v81;
  id v82;
  id v83;
  uint64_t v84;
  void *j;
  CFStringRef **v86;
  void *v87;
  const void *v88;
  const void *v89;
  const void *v90;
  id v91;
  const void *v92;
  BOOL v93;
  const void *v94;
  id v96;
  char v98;
  KCSharingDatabaseUpdatePlan *v99;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  id v114;
  KCSharingDatabaseUpdatePlan *v115;
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  KCSharingMirrorEntry *v128;
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  id v134;
  KCSharingMirrorEntry *v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  uint8_t v145[128];
  _BYTE buf[24];
  _BYTE v147[128];

  v101 = a4;
  v96 = a5;
  v102 = -[NSMutableArray mutableCopy](self->_insertIntoMirror, "mutableCopy");
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v99 = self;
  v8 = self->_insertIntoLocalAndMirror;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
  if (!v9)
  {
    v98 = 0;
    goto LABEL_39;
  }
  v10 = v9;
  v98 = 0;
  v11 = *(_QWORD *)v138;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v138 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)i);
      v14 = (char *)objc_msgSend(v13, "type");
      if ((unint64_t)(v14 - 1) < 2)
      {
        v136 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remoteItemWithAccessGroups:error:", v101, &v136));
        v16 = (KCSharingMirrorEntry *)v136;
        if (v15)
        {
          v22 = (KCSharingMirrorEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contents"));
          if (v22)
          {
            v135 = v16;
            v23 = (KCSharingMirrorEntry *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan updateLocalItemWithRemoteItem:inTransaction:withAccessGroups:error:](v99, "updateLocalItemWithRemoteItem:inTransaction:withAccessGroups:error:", v22, a3, v101, &v135));
            v24 = v135;

            if (v23)
            {
              if (objc_msgSend(v15, "isFullyDecoded"))
                v25 = 0;
              else
                v25 = 2;
              v26 = -[KCSharingMirrorEntry initWithUpdatedLocalItem:forIncomingEntry:flags:]([KCSharingMirrorEntry alloc], "initWithUpdatedLocalItem:forIncomingEntry:flags:", v23, v13, v25);
              objc_msgSend(v102, "addObject:", v26);
              v27 = KCSharingLogObject(CFSTR("KCSharingDatabaseUpdatePlan"));
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v23;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Inserted item into local: %@", buf, 0xCu);
              }

              v29 = KCSharingLogObject(CFSTR("KCSharingDatabaseUpdatePlan"));
              v30 = objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v26;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "...with corresponding mirror: %@", buf, 0xCu);
              }

              v98 = 1;
            }
            else
            {
              v26 = -[KCSharingMirrorEntry initWithIncomingEntry:flags:]([KCSharingMirrorEntry alloc], "initWithIncomingEntry:flags:", v13, 8);
              objc_msgSend(v102, "addObject:", v26);
            }

            v16 = v24;
          }
          else
          {
            v23 = -[KCSharingMirrorEntry initWithIncomingEntry:flags:]([KCSharingMirrorEntry alloc], "initWithIncomingEntry:flags:", v13, 2);
            objc_msgSend(v102, "addObject:", v23);
          }

          goto LABEL_33;
        }
LABEL_26:
        v19 = [KCSharingMirrorEntry alloc];
        v20 = v13;
        v21 = 2;
LABEL_27:
        v22 = -[KCSharingMirrorEntry initWithIncomingEntry:flags:](v19, "initWithIncomingEntry:flags:", v20, v21);
        objc_msgSend(v102, "addObject:", v22);
LABEL_33:

        goto LABEL_34;
      }
      if (v14)
      {
        if (v14 != (char *)3)
          continue;
        v134 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shareWithAccessGroups:error:", v101, &v134));
        v16 = (KCSharingMirrorEntry *)v134;
        if (!v15)
          goto LABEL_26;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contents"));

        if (!v17)
          goto LABEL_26;
        if (objc_msgSend(v15, "isFullyDecoded"))
          v18 = 0;
        else
          v18 = 2;
        v19 = [KCSharingMirrorEntry alloc];
        v20 = v13;
        v21 = v18;
        goto LABEL_27;
      }
      v16 = -[KCSharingMirrorEntry initWithIncomingEntry:flags:]([KCSharingMirrorEntry alloc], "initWithIncomingEntry:flags:", v13, 2);
      objc_msgSend(v102, "addObject:", v16);
LABEL_34:

    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
  }
  while (v10);
LABEL_39:

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v31 = v99->_reinsertIntoLocal;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v130, v145, 16);
  if (!v32)
    goto LABEL_70;
  v33 = v32;
  v34 = *(_QWORD *)v131;
  while (2)
  {
    v35 = 0;
    while (2)
    {
      if (*(_QWORD *)v131 != v34)
        objc_enumerationMutation(v31);
      v36 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v35);
      v37 = (char *)objc_msgSend(v36, "type");
      if ((unint64_t)(v37 - 1) < 2)
      {
        v129 = 0;
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "remoteItemWithAccessGroups:error:", v101, &v129));
        v39 = (KCSharingMirrorEntry *)v129;
        if (v43)
        {
          v44 = (KCSharingMirrorEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "contents"));
          if (v44)
          {
            v128 = v39;
            v45 = (KCSharingMirrorEntry *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan updateLocalItemWithRemoteItem:inTransaction:withAccessGroups:error:](v99, "updateLocalItemWithRemoteItem:inTransaction:withAccessGroups:error:", v44, a3, v101, &v128));
            v46 = v128;

            v47 = objc_msgSend(v36, "flags");
            if (v45)
            {
              if (objc_msgSend(v43, "isFullyDecoded"))
                v48 = v47 & 0xFFFFFFF5;
              else
                v48 = v47 & 0xFFFFFFF5 | 2;
              v49 = -[KCSharingMirrorEntry initWithUpdatedLocalItem:forMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithUpdatedLocalItem:forMirrorEntry:flags:", v45, v36, v48);
              v98 = 1;
            }
            else
            {
              v49 = -[KCSharingMirrorEntry initWithMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithMirrorEntry:flags:", v36, v47 & 0xFFFFFFF5 | 8);
            }
            objc_msgSend(v102, "addObject:", v49);

            v39 = v46;
          }
          else
          {
            v45 = -[KCSharingMirrorEntry initWithMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithMirrorEntry:flags:", v36, objc_msgSend(v36, "flags") & 0xFFFFFFF5 | 2);
            objc_msgSend(v102, "addObject:", v45);
          }

        }
        else
        {
          v44 = -[KCSharingMirrorEntry initWithMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithMirrorEntry:flags:", v36, objc_msgSend(v36, "flags") & 0xFFFFFFF5 | 2);
          objc_msgSend(v102, "addObject:", v44);
        }

LABEL_67:
      }
      else
      {
        if (!v37)
        {
          v39 = -[KCSharingMirrorEntry initWithMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithMirrorEntry:flags:", v36, objc_msgSend(v36, "flags") & 0xFFFFFFF5 | 2);
          objc_msgSend(v102, "addObject:", v39);
          goto LABEL_67;
        }
        if (v37 == (char *)3)
        {
          v127 = 0;
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "shareWithAccessGroups:error:", v101, &v127));
          v39 = (KCSharingMirrorEntry *)v127;
          v40 = objc_msgSend(v36, "flags");
          v41 = v40;
          if (v38)
          {
            if (objc_msgSend(v38, "isFullyDecoded"))
              v42 = v41 & 0xFFFFFFF5;
            else
              v42 = v41 & 0xFFFFFFF5 | 2;
          }
          else
          {
            v42 = v40 & 0xFFFFFFF5 | 2;
          }
          v50 = -[KCSharingMirrorEntry initWithMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithMirrorEntry:flags:", v36, v42);
          objc_msgSend(v102, "addObject:", v50);

          goto LABEL_67;
        }
      }
      if (v33 != (id)++v35)
        continue;
      break;
    }
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v130, v145, 16);
    if (v33)
      continue;
    break;
  }
LABEL_70:

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v51 = v99->_insertIntoIncoming;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
  if (!v52)
    goto LABEL_83;
  v53 = v52;
  v54 = *(_QWORD *)v124;
  while (2)
  {
    v55 = 0;
    while (2)
    {
      if (*(_QWORD *)v124 != v54)
        objc_enumerationMutation(v51);
      v56 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v55);
      *(_QWORD *)buf = 0;
      v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "attributesWithAccessGroups:error:", v101, a6));
      if (!v57)
        goto LABEL_150;
      v58 = (const __CFDictionary *)v57;
      v59 = objc_msgSend((id)objc_opt_class(v56), "databaseItemClass");
      v60 = (void *)sub_10001E9E8((uint64_t)v59, v58, dword_1003414E0, (__CFString **)buf);
      if (!v60)
      {
LABEL_122:
        v88 = *(const void **)buf;
        if (a6)
        {
          *a6 = *(id *)buf;
          *(_QWORD *)buf = 0;
        }
        else if (*(_QWORD *)buf)
        {
          *(_QWORD *)buf = 0;
          CFRelease(v88);
        }
LABEL_149:

        goto LABEL_150;
      }
      v121[0] = _NSConcreteStackBlock;
      v121[1] = 3221225472;
      v121[2] = sub_1000CDE84;
      v121[3] = &unk_1002DD3C8;
      v61 = v60;
      v122 = v61;
      if ((sub_10001DADC((uint64_t)v61, (uint64_t)a3, (__CFString **)buf, (uint64_t)v121) & 1) == 0
        && (sub_1001165A4(*(__CFError **)buf) & 1) == 0)
      {
        v89 = *(const void **)buf;
        if (a6)
        {
          *a6 = *(id *)buf;
          *(_QWORD *)buf = 0;
        }
        else if (*(_QWORD *)buf)
        {
          *(_QWORD *)buf = 0;
          CFRelease(v89);
        }
        v91 = v122;
LABEL_148:

        goto LABEL_149;
      }
      v62 = *(const void **)buf;
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)buf = 0;
        CFRelease(v62);
      }

      if (v53 != (id)++v55)
        continue;
      break;
    }
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
    if (v53)
      continue;
    break;
  }
LABEL_83:

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v51 = (NSMutableArray *)v102;
  v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v117, v143, 16);
  if (!v63)
  {
LABEL_96:

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v51 = v99->_insertIntoOutgoing;
    v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v110;
LABEL_98:
      v76 = 0;
      while (1)
      {
        if (*(_QWORD *)v110 != v75)
          objc_enumerationMutation(v51);
        v77 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v76);
        *(_QWORD *)buf = 0;
        v78 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "attributesWithAccessGroups:error:", v101, a6));
        if (!v78)
          goto LABEL_150;
        v58 = (const __CFDictionary *)v78;
        v79 = objc_msgSend((id)objc_opt_class(v77), "databaseItemClass");
        v80 = (void *)sub_10001E9E8((uint64_t)v79, v58, dword_1003414E0, (__CFString **)buf);
        if (!v80)
          goto LABEL_122;
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_1000CDF28;
        v107[3] = &unk_1002DD3C8;
        v61 = v80;
        v108 = v61;
        if ((sub_10001DADC((uint64_t)v61, (uint64_t)a3, (__CFString **)buf, (uint64_t)v107) & 1) == 0
          && (sub_1001165A4(*(__CFError **)buf) & 1) == 0)
        {
          v94 = *(const void **)buf;
          if (a6)
          {
            *a6 = *(id *)buf;
            *(_QWORD *)buf = 0;
          }
          else if (*(_QWORD *)buf)
          {
            *(_QWORD *)buf = 0;
            CFRelease(v94);
          }
          v91 = v108;
          goto LABEL_148;
        }
        v81 = *(const void **)buf;
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)buf = 0;
          CFRelease(v81);
        }

        if (v74 == (id)++v76)
        {
          v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
          if (v74)
            goto LABEL_98;
          break;
        }
      }
    }

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v51 = v99->_itemsToDelete;
    v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v103, v141, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v104;
      while (2)
      {
        for (j = 0; j != v83; j = (char *)j + 1)
        {
          if (*(_QWORD *)v104 != v84)
            objc_enumerationMutation(v51);
          v86 = *(CFStringRef ***)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)j);
          *(_QWORD *)buf = 0;
          if (v96)
          {
            v87 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan updateInfoForDeletion:](v99, "updateInfoForDeletion:", v86));
            if (v87)
              objc_msgSend(v96, "addObject:", v87);

          }
          if (!sub_10000C25C(v86, (uint64_t)a3, (CFTypeRef *)buf, (uint64_t)&stru_1002DD410))
          {
            v92 = *(const void **)buf;
            if (a6)
            {
              *a6 = *(id *)buf;
            }
            else if (*(_QWORD *)buf)
            {
              *(_QWORD *)buf = 0;
              CFRelease(v92);
            }
            goto LABEL_150;
          }
        }
        v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v103, v141, 16);
        if (v83)
          continue;
        break;
      }

    }
    else
    {

      if ((v98 & 1) == 0)
      {
LABEL_137:
        v93 = 1;
        goto LABEL_151;
      }
    }
    sub_100133324();
    goto LABEL_137;
  }
  v64 = v63;
  v65 = *(_QWORD *)v118;
LABEL_85:
  v66 = 0;
  while (1)
  {
    if (*(_QWORD *)v118 != v65)
      objc_enumerationMutation(v51);
    v67 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v66);
    *(_QWORD *)buf = 0;
    v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "attributesWithAccessGroups:error:", v101, a6));
    if (!v68)
      break;
    v58 = (const __CFDictionary *)v68;
    v69 = objc_msgSend((id)objc_opt_class(v67), "databaseItemClass");
    v70 = (void *)sub_10001E9E8((uint64_t)v69, v58, dword_1003414E0, (__CFString **)buf);
    if (!v70)
      goto LABEL_122;
    v71 = v70;
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_1000CDEAC;
    v113[3] = &unk_1002DD3F0;
    v113[4] = v67;
    v114 = v96;
    v115 = v99;
    v61 = v71;
    v116 = v61;
    if ((sub_10001DADC((uint64_t)v61, (uint64_t)a3, (__CFString **)buf, (uint64_t)v113) & 1) == 0
      && (sub_1001165A4(*(__CFError **)buf) & 1) == 0)
    {
      v90 = *(const void **)buf;
      if (a6)
      {
        *a6 = *(id *)buf;
        *(_QWORD *)buf = 0;
      }
      else if (*(_QWORD *)buf)
      {
        *(_QWORD *)buf = 0;
        CFRelease(v90);
      }

      v91 = v114;
      goto LABEL_148;
    }
    v72 = *(const void **)buf;
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)buf = 0;
      CFRelease(v72);
    }

    if (v64 == (id)++v66)
    {
      v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v117, v143, 16);
      if (v64)
        goto LABEL_85;
      goto LABEL_96;
    }
  }
LABEL_150:

  v93 = 0;
LABEL_151:

  return v93;
}

- (id)updateLocalItemWithRemoteItem:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 withAccessGroups:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  const __CFDictionary *v14;
  void *v15;
  id v16;
  void *v17;
  const __CFData *v18;
  __CFString *v19;
  id v20;
  __CFString *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  const __CFData *v26;
  void *v27;
  id v28;
  __CFString *v29;
  KCSharingLocalItem *v30;
  int v31;
  __CFString *v33;
  __CFString *v34;
  void **v35;
  uint64_t v36;
  CFTypeRef (*v37)(uint64_t, const void *, _QWORD *);
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  __CFString *v43;

  v9 = a3;
  v10 = a5;
  v43 = 0;
  v11 = objc_msgSend(v9, "type");
  if (v11 == (id)2)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "internetPassword"));
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "attributesWithAccessGroups:error:", v10, a6));

    if (!v14)
    {
LABEL_29:
      v12 = 0;
      goto LABEL_30;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "internetPassword"));
    v25 = objc_msgSend((id)objc_opt_class(v24), "databaseItemClass");
    v17 = (void *)sub_10001E9E8((uint64_t)v25, v14, dword_1003414E0, &v43);

    if (v17)
    {
      v26 = sub_10001CDC8();
      v42 = 0;
      sub_10001D918((uint64_t)v17, v26, (__CFString **)&v42);
      if (v26)
        CFRelease(v26);
      v19 = (__CFString *)v42;
      if (!v42)
      {
        v35 = _NSConcreteStackBlock;
        v36 = 3221225472;
        v37 = sub_1000CDE00;
        v38 = &unk_1002DD3C8;
        v28 = v17;
        v39 = v28;
        if ((sub_10001DADC((uint64_t)v28, (uint64_t)a4, &v43, (uint64_t)&v35) & 1) != 0
          || (sub_1001165A4((__CFError *)v43) & 1) != 0)
        {
          v29 = v43;
          if (v43)
          {
            v43 = 0;
            CFRelease(v29);
          }
          v30 = [KCSharingLocalItem alloc];
          v12 = -[KCSharingLocalItem initPasswordWithInternetPasswordDatabaseItem:error:](v30, "initPasswordWithInternetPasswordDatabaseItem:error:", v28, a6, v35, v36, v37, v38);
          v31 = 1;
        }
        else
        {
          v34 = v43;
          if (a6)
          {
            v31 = 0;
            v12 = 0;
            *a6 = v43;
            v43 = 0;
          }
          else
          {
            if (v43)
            {
              v43 = 0;
              CFRelease(v34);
            }
            v31 = 0;
            v12 = 0;
          }
        }

        if (v31)
          goto LABEL_37;
        goto LABEL_30;
      }
      goto LABEL_20;
    }
LABEL_22:
    v19 = v43;
    if (a6)
    {
      *a6 = v43;
      v43 = 0;
      goto LABEL_28;
    }
    if (!v43)
      goto LABEL_28;
    v43 = 0;
LABEL_27:
    CFRelease(v19);
    goto LABEL_28;
  }
  v12 = 0;
  if (v11 != (id)1)
  {
LABEL_37:
    v12 = v12;
    v27 = v12;
    goto LABEL_38;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "privateKey"));
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributesWithAccessGroups:error:", v10, a6));

  if (!v14)
    goto LABEL_29;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "privateKey"));
  v16 = objc_msgSend((id)objc_opt_class(v15), "databaseItemClass");
  v17 = (void *)sub_10001E9E8((uint64_t)v16, v14, dword_1003414E0, &v43);

  if (!v17)
    goto LABEL_22;
  v18 = sub_10001CDC8();
  v42 = 0;
  sub_10001D918((uint64_t)v17, v18, (__CFString **)&v42);
  if (v18)
    CFRelease(v18);
  v19 = (__CFString *)v42;
  if (v42)
  {
LABEL_20:
    if (a6)
    {
      *a6 = v19;
LABEL_28:

      goto LABEL_29;
    }
    v42 = 0;
    goto LABEL_27;
  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000CDD7C;
  v40[3] = &unk_1002DD3C8;
  v20 = v17;
  v41 = v20;
  if ((sub_10001DADC((uint64_t)v20, (uint64_t)a4, &v43, (uint64_t)v40) & 1) != 0
    || (sub_1001165A4((__CFError *)v43) & 1) != 0)
  {
    v21 = v43;
    if (v43)
    {
      v43 = 0;
      CFRelease(v21);
    }
    v12 = -[KCSharingLocalItem initPasskeyWithPrivateKeyDatabaseItem:error:]([KCSharingLocalItem alloc], "initPasskeyWithPrivateKeyDatabaseItem:error:", v20, a6);
    v22 = 1;
  }
  else
  {
    v33 = v43;
    if (a6)
    {
      v22 = 0;
      v12 = 0;
      *a6 = v43;
      v43 = 0;
    }
    else
    {
      if (v43)
      {
        v43 = 0;
        CFRelease(v33);
      }
      v22 = 0;
      v12 = 0;
    }
  }

  if ((v22 & 1) != 0)
    goto LABEL_37;
LABEL_30:
  v27 = 0;
LABEL_38:

  return v27;
}

- (NSMutableArray)insertIntoLocalAndMirror
{
  return self->_insertIntoLocalAndMirror;
}

- (NSMutableArray)reinsertIntoLocal
{
  return self->_reinsertIntoLocal;
}

- (NSMutableArray)insertIntoIncoming
{
  return self->_insertIntoIncoming;
}

- (NSMutableArray)insertIntoMirror
{
  return self->_insertIntoMirror;
}

- (NSMutableArray)insertIntoOutgoing
{
  return self->_insertIntoOutgoing;
}

- (NSMutableArray)itemsToDelete
{
  return self->_itemsToDelete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToDelete, 0);
  objc_storeStrong((id *)&self->_insertIntoOutgoing, 0);
  objc_storeStrong((id *)&self->_insertIntoMirror, 0);
  objc_storeStrong((id *)&self->_insertIntoIncoming, 0);
  objc_storeStrong((id *)&self->_reinsertIntoLocal, 0);
  objc_storeStrong((id *)&self->_insertIntoLocalAndMirror, 0);
}

@end
