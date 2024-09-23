@implementation WLMessagesMigrator

- (WLMessagesMigrator)initWithSQLController:(id)a3
{
  id v4;
  WLMessagesMigrator *v5;
  WLMessagesMigrator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLMessagesMigrator;
  v5 = -[WLMessagesMigrator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[WLMessagesMigrator setSqlController:](v5, "setSqlController:", v4);

  return v6;
}

- (void)enable
{
  WLFeaturePayload **p_featurePayload;
  id WeakRetained;
  id v4;

  p_featurePayload = &self->_featurePayload;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setEnabled:", 1);

  v4 = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(v4, "setState:", CFSTR("enabled"));

}

- (void)setState:(id)a3
{
  WLFeaturePayload **p_featurePayload;
  id v4;
  id WeakRetained;

  p_featurePayload = &self->_featurePayload;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(WeakRetained, "setState:", v4);

}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", a3);

}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);

}

+ (id)contentType
{
  return CFSTR("messages");
}

- (id)contentType
{
  return +[WLMessagesMigrator contentType](WLMessagesMigrator, "contentType");
}

- (id)dataType
{
  return +[WLMessagesMigrator contentType](WLMessagesMigrator, "contentType");
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "itemSize"))
    objc_msgSend(v4, "setItemSize:", 20480);

}

- (void)performPreImportPhaseForSummary:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  WLMessagesMigrator *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _WLLog();
  -[WLMessagesMigrator sqlController](self, "sqlController", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v7;
  +[WLMessage mimeHeadersFromMimeData:sqlController:](WLMessage, "mimeHeadersFromMimeData:sqlController:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  _WLLog();
  +[WLMessage dateFromMimeHeaders:](WLMessage, "dateFromMimeHeaders:", v9, self, v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setModifiedDate:");
  -[WLMessagesMigrator sqlController](self, "sqlController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v6;
  objc_msgSend(v10, "updateModifiedDateForSummary:", v6);

  +[WLMessage senderFromMimeHeaders:](WLMessage, "senderFromMimeHeaders:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  _WLLog();
  v37 = (void *)v9;
  +[WLMessage recipientsFromMimeHeaders:](WLMessage, "recipientsFromMimeHeaders:", v9, self, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v30 = self;
  v31 = (void *)v12;
  _WLLog();
  v13 = (void *)MEMORY[0x24BDBD1A8];
  v34 = (void *)v12;
  if (v12)
    v13 = (void *)v12;
  v14 = v13;
  v15 = v14;
  v35 = (void *)v11;
  if (v11)
  {
    objc_msgSend(v14, "arrayByAddingObject:", v11, self, v12);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v22, "isPhoneNumber", v30, v31));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "icc");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = self;
        v31 = v22;
        _WLLog();

        if (objc_msgSend(v22, "isPhoneNumber"))
        {
          objc_msgSend(v22, "icc", self, v22, v23, v33, v34, v35);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "length");

          if (v25)
          {
            objc_msgSend(v22, "icc");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "ccAcNumber");
            v31 = v26;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = self;
            _WLLog();

            -[WLMessagesMigrator sqlController](self, "sqlController");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "icc");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "ccAcNumber");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "insertMessagePhoneNumberWithIcc:ccAcNumber:", v28, v29);

          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v19);
  }

  _WLLog();
}

- (id)importWillBegin
{
  id WeakRetained;
  void *v4;
  NSString *v5;
  NSString *accountGuid;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  WLMessagesMigrator *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", 0);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountGuid = self->_accountGuid;
  self->_accountGuid = v5;

  v7 = 0;
  if (!-[WLMessagesMigrator _openDatabase](self, "_openDatabase"))
  {
    self->_database = 0;
    v12 = self;
    _WLLog();
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BEC2878];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("Messages migrator couldn't open messages database");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)importDidEnd
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  -[WLMessagesMigrator _updateClient](self, "_updateClient");
  -[WLMessagesMigrator _closeDatabase](self, "_closeDatabase");
  -[WLMessagesMigrator sqlController](self, "sqlController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteGroupMessageInfoForAllDevices");

  -[WLMessagesMigrator sqlController](self, "sqlController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteMessagePhoneNumbersForAllDevices");

  _WLLog();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.imdpersistenceagent.notification.mergecompleted"), 0, 0, 1u);
  return 0;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  id WeakRetained;
  id v15;
  WLMessage *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

  v15 = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(v15, "setSize:", objc_msgSend(v15, "size") + objc_msgSend(v10, "length"));

  v16 = objc_alloc_init(WLMessage);
  v17 = -[WLMessage setSummary:](v16, "setSummary:", v11);
  if (!v10)
  {
    _WLLog();
    if (!v13)
      goto LABEL_7;
    goto LABEL_6;
  }
  v18 = (void *)MEMORY[0x2207BB344](v17);
  -[WLMessagesMigrator sqlController](self, "sqlController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMessage parseMIMEData:sqlController:](v16, "parseMIMEData:sqlController:", v10, v19);

  v20 = -[WLMessagesMigrator _insertMessage:](self, "_insertMessage:", v16);
  objc_autoreleasePoolPop(v18);
  if (v13)
  {
    if (!v20)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BEC2878];
      v25 = *MEMORY[0x24BDD0FC8];
      v26[0] = CFSTR("Message import failed");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v24);

      goto LABEL_7;
    }
LABEL_6:
    v13[2](v13, 1, 0);
  }
LABEL_7:

}

- (id)_databaseFilename
{
  void *v2;
  void *v3;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/SMS/sms.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_openDatabase
{
  id v3;
  int v4;

  -[WLMessagesMigrator _databaseFilename](self, "_databaseFilename");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = sqlite3_open((const char *)objc_msgSend(v3, "UTF8String"), &self->_database);
  if (v4)
    _WLLog();

  return v4 == 0;
}

- (void)_closeDatabase
{
  sqlite3 *database;

  database = self->_database;
  if (database)
  {
    sqlite3_close(database);
    self->_database = 0;
  }
}

- (BOOL)_performSimpleQuery:(id)a3
{
  id v4;
  sqlite3 *database;
  id v6;
  BOOL v7;
  int v8;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  database = self->_database;
  v6 = objc_retainAutorelease(v4);
  if (sqlite3_prepare_v2(database, (const char *)objc_msgSend(v6, "UTF8String"), -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    v7 = 0;
  }
  else
  {
    v8 = sqlite3_errcode(self->_database);
    v7 = v8 != 101;
    if (v8 == 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }

  return v7;
}

- (BOOL)_beginTransaction
{
  return -[WLMessagesMigrator _performSimpleQuery:](self, "_performSimpleQuery:", CFSTR("BEGIN TRANSACTION"));
}

- (BOOL)_commitTransaction
{
  return -[WLMessagesMigrator _performSimpleQuery:](self, "_performSimpleQuery:", CFSTR("COMMIT TRANSACTION"));
}

- (BOOL)_rollbackTransaction
{
  return -[WLMessagesMigrator _performSimpleQuery:](self, "_performSimpleQuery:", CFSTR("ROLLBACK TRANSACTION"));
}

- (id)_ourAddressWithMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "messageDirection");
  if (v4)
  {
    if (v4 != 1 || (objc_msgSend(v3, "isGroupMessage") & 1) != 0)
      goto LABEL_7;
    objc_msgSend(v3, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "sender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  if (!v7)
LABEL_7:
    v7 = &stru_24E376E00;

  return v7;
}

- (id)_otherPartyAddressWithNonGroupMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "messageDirection");
  if (v4)
  {
    if (v4 != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "sender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v6;
}

- (BOOL)_insertMessage:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  int v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  char v50;
  uint64_t v51;
  int64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  WLMessagesMigrator *v60;
  WLMessagesMigrator *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  _BOOL4 v73;
  _BOOL4 v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  id obj;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int64_t v82;
  void *v83;
  WLMessagesMigrator *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  BOOL v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[WLMessagesMigrator _beginTransaction](self, "_beginTransaction");
  if (v5)
  {
    -[WLMessagesMigrator _handleIDsForMessage:](self, "_handleIDsForMessage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = 0;
      v8 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
  }
  v60 = self;
  v62 = v4;
  _WLLog();
  v8 = 0;
  v7 = v5;
LABEL_6:
  if (objc_msgSend(v4, "isGroupMessage", v60, v62))
  {
    v9 = objc_msgSend(v4, "messageDirection") == 1;
    if (!v8)
    {
LABEL_8:
      v10 = 0;
      v11 = 0;
      v83 = 0;
      goto LABEL_54;
    }
  }
  else
  {
    v9 = 1;
    if (!v8)
      goto LABEL_8;
  }
  v12 = 0x24BDD1000;
  v77 = v6;
  v84 = self;
  v76 = v7;
  v74 = v5;
  v72 = v9;
  if (objc_msgSend(v4, "isGroupMessage"))
  {
    -[WLMessagesMigrator _sortedHandleIDs:](self, "_sortedHandleIDs:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    objc_msgSend(v4, "threadID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    -[WLMessagesMigrator sqlController](self, "sqlController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v4, "threadID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "groupMessageInfoMatchingSourceThreadID:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v93 = v19 != 0;
    }
    else
    {
      objc_msgSend(v16, "groupMessageInfoMatchingSortedHandleIDs:handleIDsAreComplete:didMatchExactly:", v13, v9, &v93);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v75 = v13;
    if (v19)
    {
      objc_msgSend(v19, "roomName");
      v79 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "groupID");
      v20 = objc_claimAutoreleasedReturnValue();
      v73 = !v93;
      objc_msgSend(v4, "threadID");
      v81 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sortedHandleIDs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v19, "handleIDsAreComplete"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v93);
      v70 = v25;
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v20;
      v69 = v24;
      v83 = (void *)v20;
      v26 = (void *)v81;
      v66 = v22;
      v67 = v79;
      v63 = v81;
      v64 = v21;
      v61 = v84;
      _WLLog();

      self = v84;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "generatedRoomNameForGroupChat");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "wl_uniqueIdentifier");
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "threadID");
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = (void *)v28;
      v67 = v27;
      v68 = v28;
      v26 = (void *)v29;
      v79 = v27;
      v64 = v21;
      v66 = v22;
      v61 = self;
      v63 = v29;
      _WLLog();
      v73 = 1;
    }

    v12 = 0x24BDD1000uLL;
  }
  else
  {
    v75 = 0;
    v79 = 0;
    v83 = 0;
    v73 = 0;
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend(v4, "attachments", v61, v63, v64, v66, v67, v68, v69, v70, v71);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v90 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD17C8], "wl_uniqueIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setGuid:", v36);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    }
    while (v32);
  }

  objc_msgSend(v4, "subject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v12 + 1760), "numberWithBool:", objc_msgSend(v4, "isGroupMessage"));
  v11 = (void *)v79;
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v6 = v77;
  v82 = -[WLMessagesMigrator _insertMessageRowWithMessage:handleIDs:groupRoomName:](self, "_insertMessageRowWithMessage:handleIDs:groupRoomName:", v4, v77, v79, self, v37, v65, v79);
  if (v82 < 0)
    goto LABEL_45;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v4, "attachments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v38)
  {
    v39 = v38;
    v80 = *(_QWORD *)v86;
    while (2)
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v86 != v80)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
        objc_msgSend(v41, "guid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "fileName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "mimeType");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "uti");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLMessagesMigrator _attachmentPersistentPathForGuid:fileName:mimeType:uti:](WLMessagesMigrator, "_attachmentPersistentPathForGuid:fileName:mimeType:uti:", v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v46)
        {
          self = v84;
          _WLLog();
LABEL_53:

          v6 = v77;
          v7 = v76;
          v10 = v75;
          v5 = v74;
          v11 = (void *)v79;
          goto LABEL_54;
        }
        v47 = objc_alloc_init(MEMORY[0x24BDD1580]);
        objc_msgSend(v46, "stringByDeletingLastPathComponent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        self = v84;
        if ((objc_msgSend(v47, "makeDirectoriesInPath:mode:", v48, 448) & 1) == 0
          || (objc_msgSend(v41, "data"),
              v49 = (void *)objc_claimAutoreleasedReturnValue(),
              v50 = objc_msgSend(v49, "writeToFile:atomically:", v46, 1),
              v49,
              (v50 & 1) == 0)
          || (v51 = -[WLMessagesMigrator _insertRowWithAttachment:filePath:forMessage:](v84, "_insertRowWithAttachment:filePath:forMessage:", v41, v46, v4), v51 < 0)|| !-[WLMessagesMigrator _insertMessageAttachmentJoinRowWithMessageID:attachmentID:](v84, "_insertMessageAttachmentJoinRowWithMessageID:attachmentID:", v82, v51))
        {
          _WLLog();

          goto LABEL_53;
        }

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      v6 = v77;
      v11 = (void *)v79;
      if (v39)
        continue;
      break;
    }
  }

  v52 = -[WLMessagesMigrator _chatIDForHandleIDs:groupRoomName:groupID:message:](self, "_chatIDForHandleIDs:groupRoomName:groupID:message:", v6, v11, v83, v4);
  if (v52 < 0)
  {
LABEL_45:
    _WLLog();
    v7 = v76;
    v10 = v75;
    v5 = v74;
  }
  else
  {
    v7 = v76;
    v10 = v75;
    v5 = v74;
    if (-[WLMessagesMigrator _insertChatMessageJoinRowWithChatID:messageID:date:](self, "_insertChatMessageJoinRowWithChatID:messageID:date:", v52, v82, -[WLMessagesMigrator _messageDateWithMessage:](self, "_messageDateWithMessage:", v4)))
    {
      if (-[WLMessagesMigrator _commitTransaction](self, "_commitTransaction"))
      {
        if (v73)
        {
          objc_msgSend(v4, "threadID");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "length");

          -[WLMessagesMigrator sqlController](self, "sqlController");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v55;
          if (v54)
          {
            objc_msgSend(v4, "threadID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "insertGroupMessageInfoWithSourceThreadID:roomName:groupID:", v57, v11, v83);

          }
          else
          {
            objc_msgSend(v55, "insertGroupMessageInfoWithSortedHandleIDs:handleIDsAreComplete:roomName:groupID:", v75, v72, v11, v83);
          }

        }
      }
      else
      {
        _WLLog();
      }
      v58 = 1;
      if (v76)
        goto LABEL_58;
      goto LABEL_59;
    }
    _WLLog();
  }
LABEL_54:
  if (v5 && !-[WLMessagesMigrator _rollbackTransaction](self, "_rollbackTransaction"))
    _WLLog();
  v58 = 0;
  if (v7)
  {
LABEL_58:
    v58 = 1;
    _WLLog();
  }
LABEL_59:

  return v58;
}

- (id)_sortedHandleIDs:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_8);
}

uint64_t __39__WLMessagesMigrator__sortedHandleIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)_attachmentPersistentPathForGuid:(id)a3 fileName:(id)a4 mimeType:(id)a5 uti:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;

  v10 = a3;
  v11 = a4;
  v29 = a5;
  v12 = a6;
  objc_msgSend(v11, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "hash");
  if (objc_msgSend(v13, "length"))
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE50898], "defaultHFSFileManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pathExtensionForUTIType:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x24BE50898], "defaultHFSFileManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pathExtensionForMIMEType:", v29);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(v11, "stringByAppendingPathExtension:", v15);
      v19 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v19;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x"), v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02d"), v14 & 0xF);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();
  if (objc_msgSend(v11, "length", a1, v11) && objc_msgSend(v10, "length"))
  {
    objc_msgSend(CFSTR("/var/mobile/Library/SMS/Attachments"), "stringByResolvingAndStandardizingPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathComponent:", v21);
    v24 = v12;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingPathComponent:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v24;
    objc_msgSend(v26, "stringByAppendingPathComponent:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  _WLLog();

  return v27;
}

- (int64_t)_insertRowWithAttachment:(id)a3 filePath:(id)a4 forMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  sqlite3_int64 insert_rowid;
  sqlite3_stmt *v12;
  id v13;
  sqlite3_stmt *v14;
  id v15;
  void *v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  sqlite3_stmt *v21;
  id v22;
  sqlite3_stmt *v23;
  void *v24;
  sqlite3_stmt *v25;
  id v26;
  sqlite3_stmt *ppStmt;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO attachment (guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, original_guid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    insert_rowid = -1;
  }
  else
  {
    v12 = ppStmt;
    objc_msgSend(v8, "guid");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v12, 1, (const char *)objc_msgSend(v13, "UTF8String"), -1, 0);

    sqlite3_bind_int64(ppStmt, 2, -[WLMessagesMigrator _attachmentDateWithMessage:](self, "_attachmentDateWithMessage:", v10));
    sqlite3_bind_int64(ppStmt, 3, -[WLMessagesMigrator _attachmentDateWithMessage:](self, "_attachmentDateWithMessage:", v10));
    v14 = ppStmt;
    v15 = objc_retainAutorelease(v9);
    sqlite3_bind_text(v14, 4, (const char *)objc_msgSend(v15, "UTF8String"), -1, 0);
    objc_msgSend(v8, "uti");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = ppStmt;
    if (v16)
    {
      objc_msgSend(v8, "uti");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v17, 5, (const char *)objc_msgSend(v18, "UTF8String"), -1, 0);

    }
    else
    {
      sqlite3_bind_null(ppStmt, 5);
    }
    v19 = ppStmt;
    objc_msgSend(v8, "mimeType");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v19, 6, (const char *)objc_msgSend(v20, "UTF8String"), -1, 0);

    sqlite3_bind_int(ppStmt, 7, 5);
    sqlite3_bind_int(ppStmt, 8, -[WLMessagesMigrator _messageIsFromMeWithMessage:](self, "_messageIsFromMeWithMessage:", v10));
    sqlite3_bind_null(ppStmt, 9);
    v21 = ppStmt;
    objc_msgSend(v15, "lastPathComponent");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v21, 10, (const char *)objc_msgSend(v22, "UTF8String"), -1, 0);

    v23 = ppStmt;
    objc_msgSend(v8, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int(v23, 11, objc_msgSend(v24, "length"));

    v25 = ppStmt;
    objc_msgSend(v8, "guid");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v25, 12, (const char *)objc_msgSend(v26, "UTF8String"), -1, 0);

    if (sqlite3_step(ppStmt) == 101)
    {
      insert_rowid = sqlite3_last_insert_rowid(self->_database);
    }
    else
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
      insert_rowid = -1;
    }
    sqlite3_finalize(ppStmt);
  }

  return insert_rowid;
}

- (BOOL)_insertMessageAttachmentJoinRowWithMessageID:(int64_t)a3 attachmentID:(int64_t)a4
{
  BOOL v7;
  int v8;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO message_attachment_join (message_id, attachment_id) VALUES (?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    return 0;
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, a3);
    sqlite3_bind_int64(ppStmt, 2, a4);
    v8 = sqlite3_step(ppStmt);
    v7 = v8 == 101;
    if (v8 != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
  return v7;
}

- (id)_handleIDsForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  sqlite3_stmt *v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  sqlite3_int64 insert_rowid;
  void *v19;
  id v20;
  WLMessagesMigrator *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  sqlite3_stmt *pStmt;
  sqlite3_stmt *ppStmt;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WLMessagesMigrator _uniqueHandleStringsWithMessage:](self, "_uniqueHandleStringsWithMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v20 = 0;
    goto LABEL_28;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  v9 = v6;
  if (!v8)
    goto LABEL_27;
  v10 = v8;
  v26 = v5;
  v11 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      ppStmt = 0;
      if (sqlite3_prepare(self->_database, "SELECT ROWID FROM handle WHERE id=? LIMIT 1", -1, &ppStmt, 0))
        goto LABEL_8;
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), -1, 0);
      if (sqlite3_step(ppStmt) == 100)
      {
        do
          insert_rowid = sqlite3_column_int64(ppStmt, 0);
        while (sqlite3_step(ppStmt) == 100);
      }
      else
      {
        insert_rowid = -1;
      }
      if (sqlite3_errcode(self->_database) != 101 && sqlite3_errcode(self->_database) >= 1)
      {
        v24 = sqlite3_errcode(self->_database);
        v25 = sqlite3_errmsg(self->_database);
        v22 = self;
        v23 = "SELECT ROWID FROM handle WHERE id=? LIMIT 1";
        _WLLog();
      }
      sqlite3_finalize(ppStmt);
      if (insert_rowid == -1)
      {
LABEL_8:
        pStmt = 0;
        if (sqlite3_prepare(self->_database, "INSERT INTO handle (id, country, service, uncanonicalized_id) VALUES (?, ?, ?, ?)", -1, &pStmt, 0))
        {
          sqlite3_errcode(self->_database);
          sqlite3_errmsg(self->_database);
          _WLLog();
        }
        else
        {
          sqlite3_bind_text(pStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), -1, 0);
          sqlite3_bind_null(pStmt, 2);
          v14 = pStmt;
          -[WLMessagesMigrator _serviceStringWithMessage:](self, "_serviceStringWithMessage:", v4);
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          sqlite3_bind_text(v14, 3, (const char *)objc_msgSend(v15, "UTF8String"), -1, 0);

          v16 = pStmt;
          -[WLMessagesMigrator _uncanonicalizedIDWithMessage:](self, "_uncanonicalizedIDWithMessage:", v4);
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          sqlite3_bind_text(v16, 4, (const char *)objc_msgSend(v17, "UTF8String"), -1, 0);

          if (sqlite3_step(pStmt) == 101)
          {
            insert_rowid = sqlite3_last_insert_rowid(self->_database);
            sqlite3_finalize(pStmt);
            goto LABEL_19;
          }
          sqlite3_errcode(self->_database);
          sqlite3_errmsg(self->_database);
          _WLLog();
          sqlite3_finalize(pStmt);
        }
        v9 = 0;
        goto LABEL_26;
      }
LABEL_19:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", insert_rowid, v22, v23, v24, v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v19);

    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
      continue;
    break;
  }
  v9 = v6;
LABEL_26:
  v5 = v26;
LABEL_27:

  v20 = v9;
LABEL_28:

  return v20;
}

- (id)_uniqueHandleStringsWithMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  if (objc_msgSend(v4, "isGroupMessage"))
  {
    if (objc_msgSend(v4, "messageDirection") == 1)
    {
      objc_msgSend(v4, "sender");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "sender");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "address");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");

        if (!v9)
        {
          _WLLog();
          goto LABEL_19;
        }
        objc_msgSend(v4, "sender");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "recipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
LABEL_8:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        objc_msgSend(v17, "address");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "length");

        if (!v19)
          goto LABEL_18;
        objc_msgSend(v17, "address");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v20);

        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            goto LABEL_8;
          break;
        }
      }
    }
  }
  else
  {
    -[WLMessagesMigrator _otherPartyAddressWithNonGroupMessage:](self, "_otherPartyAddressWithNonGroupMessage:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "length"))
    {
LABEL_18:
      _WLLog();

LABEL_19:
      v21 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v5, "addObject:", v12);
  }

  objc_msgSend(v5, "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v21;
}

- (int64_t)_senderHandleIDFromReceviedGroupMessageHandleIDs:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (int64_t)_handleIDFromNonGroupMessageHandleIDs:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (id)_serviceStringWithMessage:(id)a3
{
  return CFSTR("SMS");
}

- (id)_uncanonicalizedIDWithMessage:(id)a3
{
  return 0;
}

- (int64_t)_chatIDForHandleIDs:(id)a3 groupRoomName:(id)a4 groupID:(id)a5 message:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  sqlite3_int64 insert_rowid;
  int v16;
  sqlite3_stmt *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  sqlite3_stmt *v28;
  id v29;
  sqlite3_stmt *v30;
  id v31;
  void *v32;
  sqlite3_stmt *v33;
  int v34;
  sqlite3_stmt *v35;
  id v36;
  sqlite3_stmt *v37;
  id v38;
  sqlite3_stmt *v39;
  id v40;
  sqlite3_stmt *v41;
  id v42;
  sqlite3_stmt *v43;
  id v44;
  int v45;
  sqlite3_stmt *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  WLMessagesMigrator *v57;
  WLMessagesMigrator *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  sqlite3_stmt *pStmt;
  sqlite3_stmt *ppStmt;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "isGroupMessage"))
    v14 = "SELECT rowid FROM chat WHERE room_name=?";
  else
    v14 = "SELECT rowid FROM chat WHERE chat_identifier=?";
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, v14, -1, &ppStmt, 0))
    goto LABEL_5;
  v16 = objc_msgSend(v13, "isGroupMessage");
  v17 = ppStmt;
  if (v16)
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, 0);
  }
  else
  {
    -[WLMessagesMigrator _chatIdentifierWithNonGroupMessage:](self, "_chatIdentifierWithNonGroupMessage:", v13);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v17, 1, (const char *)objc_msgSend(v19, "UTF8String"), -1, 0);

  }
  if (sqlite3_step(ppStmt) == 100)
  {
    do
      insert_rowid = sqlite3_column_int64(ppStmt, 0);
    while (sqlite3_step(ppStmt) == 100);
  }
  else
  {
    insert_rowid = -1;
  }
  if (sqlite3_errcode(self->_database) != 101 && sqlite3_errcode(self->_database) >= 1)
  {
    v61 = sqlite3_errcode(self->_database);
    v63 = sqlite3_errmsg(self->_database);
    v57 = self;
    v59 = v14;
    _WLLog();
  }
  sqlite3_finalize(ppStmt);
  if (insert_rowid == -1)
  {
LABEL_5:
    pStmt = 0;
    if (sqlite3_prepare(self->_database, "INSERT INTO chat (guid, style, state, account_id, properties, chat_identifier, service_name, room_name, account_login, last_addressed_handle, display_name, group_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &pStmt, 0))
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
      insert_rowid = -1;
    }
    else
    {
      if (objc_msgSend(v13, "isGroupMessage"))
        -[WLMessagesMigrator _chatGUIDWithGroupRoomName:](self, "_chatGUIDWithGroupRoomName:", v11);
      else
        -[WLMessagesMigrator _chatGUIDWithNonGroupMessage:](self, "_chatGUIDWithNonGroupMessage:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = pStmt;
      v29 = objc_retainAutorelease(v18);
      sqlite3_bind_text(v28, 1, (const char *)objc_msgSend(v29, "UTF8String"), -1, 0);
      sqlite3_bind_int(pStmt, 2, -[WLMessagesMigrator _chatStyleWithMessage:](self, "_chatStyleWithMessage:", v13));
      sqlite3_bind_int(pStmt, 3, -[WLMessagesMigrator _chatStateWithMessage:](self, "_chatStateWithMessage:", v13));
      v30 = pStmt;
      -[WLMessagesMigrator _chatAccountIDWithMessage:](self, "_chatAccountIDWithMessage:", v13);
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v30, 4, (const char *)objc_msgSend(v31, "UTF8String"), -1, 0);

      -[WLMessagesMigrator _chatPropertiesDataWithMessage:](self, "_chatPropertiesDataWithMessage:", v13);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = pStmt;
      v67 = objc_retainAutorelease(v32);
      sqlite3_bind_blob(v33, 5, (const void *)objc_msgSend(v67, "bytes"), objc_msgSend(v67, "length"), 0);
      v34 = objc_msgSend(v13, "isGroupMessage");
      v35 = pStmt;
      if (v34)
      {
        sqlite3_bind_text(pStmt, 6, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, 0);
      }
      else
      {
        -[WLMessagesMigrator _chatIdentifierWithNonGroupMessage:](self, "_chatIdentifierWithNonGroupMessage:", v13);
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v35, 6, (const char *)objc_msgSend(v36, "UTF8String"), -1, 0);

      }
      v37 = pStmt;
      -[WLMessagesMigrator _chatServiceWithMessage:](self, "_chatServiceWithMessage:", v13, v57, v59, v61, v63);
      v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v37, 7, (const char *)objc_msgSend(v38, "UTF8String"), -1, 0);

      if (objc_msgSend(v13, "isGroupMessage"))
        sqlite3_bind_text(pStmt, 8, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, 0);
      else
        sqlite3_bind_null(pStmt, 8);
      v39 = pStmt;
      -[WLMessagesMigrator _chatAccountLoginWithMessage:](self, "_chatAccountLoginWithMessage:", v13);
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v39, 9, (const char *)objc_msgSend(v40, "UTF8String"), -1, 0);

      v41 = pStmt;
      -[WLMessagesMigrator _chatLastAddressedHandleWithMessage:](self, "_chatLastAddressedHandleWithMessage:", v13);
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v41, 10, (const char *)objc_msgSend(v42, "UTF8String"), -1, 0);

      v43 = pStmt;
      -[WLMessagesMigrator _chatDisplayNameWithMessage:](self, "_chatDisplayNameWithMessage:", v13);
      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v43, 11, (const char *)objc_msgSend(v44, "UTF8String"), -1, 0);

      v45 = objc_msgSend(v13, "isGroupMessage");
      v46 = pStmt;
      if (v45)
      {
        sqlite3_bind_text(pStmt, 12, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), -1, 0);
      }
      else
      {
        -[WLMessagesMigrator _chatGroupIDWithNonGroupMessage:](self, "_chatGroupIDWithNonGroupMessage:", v13);
        v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v46, 12, (const char *)objc_msgSend(v47, "UTF8String"), -1, 0);

      }
      if (sqlite3_step(pStmt) == 101)
      {
        insert_rowid = sqlite3_last_insert_rowid(self->_database);
      }
      else
      {
        v60 = sqlite3_errcode(self->_database);
        v62 = sqlite3_errmsg(self->_database);
        v58 = self;
        _WLLog();
        insert_rowid = -1;
      }
      sqlite3_finalize(pStmt);
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v48 = v10;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      if (v49)
      {
        v50 = v49;
        v64 = v29;
        v66 = v11;
        v51 = v10;
        v52 = v12;
        v53 = *(_QWORD *)v73;
        while (2)
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v73 != v53)
              objc_enumerationMutation(v48);
            v55 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            if (!-[WLMessagesMigrator _insertChatHandleJoinRowWithChatID:handleID:duplicateMightExist:](self, "_insertChatHandleJoinRowWithChatID:handleID:duplicateMightExist:", insert_rowid, objc_msgSend(v55, "longLongValue", v58, v60, v62), 0))
            {
              objc_msgSend(v55, "longLongValue");
              _WLLog();
              insert_rowid = -1;
              goto LABEL_53;
            }
          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
          if (v50)
            continue;
          break;
        }
LABEL_53:
        v12 = v52;
        v10 = v51;
        v29 = v64;
        v11 = v66;
      }

    }
  }
  else if (objc_msgSend(v13, "isGroupMessage"))
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v20 = v10;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v21)
    {
      v22 = v21;
      v65 = v11;
      v23 = v10;
      v24 = v12;
      v25 = *(_QWORD *)v69;
      while (2)
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v69 != v25)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          if (!-[WLMessagesMigrator _insertChatHandleJoinRowWithChatID:handleID:duplicateMightExist:](self, "_insertChatHandleJoinRowWithChatID:handleID:duplicateMightExist:", insert_rowid, objc_msgSend(v27, "longLongValue", v57, v59, v61, v63), 1))
          {
            objc_msgSend(v27, "longLongValue");
            _WLLog();
            insert_rowid = -1;
            goto LABEL_56;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        if (v22)
          continue;
        break;
      }
LABEL_56:
      v12 = v24;
      v10 = v23;
      v11 = v65;
    }

  }
  return insert_rowid;
}

- (id)_chatGUIDWithGroupRoomName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SMS;+;%@"), a3);
}

- (id)_chatGUIDWithNonGroupMessage:(id)a3
{
  void *v3;
  void *v4;

  -[WLMessagesMigrator _otherPartyAddressWithNonGroupMessage:](self, "_otherPartyAddressWithNonGroupMessage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SMS;-;%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_chatStyleWithMessage:(id)a3
{
  if (objc_msgSend(a3, "isGroupMessage"))
    return 43;
  else
    return 45;
}

- (int64_t)_chatStateWithMessage:(id)a3
{
  return 3;
}

- (id)_chatAccountIDWithMessage:(id)a3
{
  return self->_accountGuid;
}

- (id)_chatPropertiesDataWithMessage:(id)a3
{
  return 0;
}

- (id)_chatServiceWithMessage:(id)a3
{
  return CFSTR("SMS");
}

- (id)_chatAccountLoginWithMessage:(id)a3
{
  void *v3;
  void *v4;

  -[WLMessagesMigrator _ourAddressWithMessage:](self, "_ourAddressWithMessage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("P:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_chatDisplayNameWithMessage:(id)a3
{
  return &stru_24E376E00;
}

- (id)_chatGroupIDWithNonGroupMessage:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "wl_uniqueIdentifier", a3);
}

- (int64_t)_insertMessageRowWithMessage:(id)a3 handleIDs:(id)a4 groupRoomName:(id)a5
{
  id v8;
  id v9;
  id v10;
  sqlite3_int64 insert_rowid;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  int64_t v19;
  sqlite3_int64 v20;
  sqlite3_stmt *v21;
  id v22;
  void *v23;
  sqlite3_stmt *v24;
  id v25;
  sqlite3_stmt *v26;
  id v27;
  sqlite3_stmt *v28;
  id v29;
  sqlite3_stmt *v30;
  id v31;
  sqlite3_stmt *v32;
  id v33;
  sqlite3_stmt *ppStmt;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO message (guid, text, service_center, handle_id, subject, country, attributedBody, version, service, account, account_guid, error, date, date_read, date_delivered, is_finished, is_from_me, cache_roomnames, was_data_detected, date_played, group_title, is_read, is_sent) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    insert_rowid = -1;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "wl_uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = ppStmt;
  v14 = objc_retainAutorelease(v12);
  sqlite3_bind_text(v13, 1, (const char *)objc_msgSend(v14, "UTF8String"), -1, 0);
  v15 = ppStmt;
  objc_msgSend(v8, "messageText");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0);

  v17 = ppStmt;
  -[WLMessagesMigrator _messageServiceCenterWithMessage:](self, "_messageServiceCenterWithMessage:", v8);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v17, 3, (const char *)objc_msgSend(v18, "UTF8String"), -1, 0);

  if (objc_msgSend(v8, "isGroupMessage"))
  {
    if (!objc_msgSend(v8, "messageDirection"))
    {
      v20 = 0;
      goto LABEL_9;
    }
    v19 = -[WLMessagesMigrator _senderHandleIDFromReceviedGroupMessageHandleIDs:](self, "_senderHandleIDFromReceviedGroupMessageHandleIDs:", v9);
  }
  else
  {
    v19 = -[WLMessagesMigrator _handleIDFromNonGroupMessageHandleIDs:](self, "_handleIDFromNonGroupMessageHandleIDs:", v9);
  }
  v20 = v19;
LABEL_9:
  sqlite3_bind_int64(ppStmt, 4, v20);
  v21 = ppStmt;
  -[WLMessagesMigrator _messageSubjectWithMessage:](self, "_messageSubjectWithMessage:", v8);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v21, 5, (const char *)objc_msgSend(v22, "UTF8String"), -1, 0);

  sqlite3_bind_null(ppStmt, 6);
  -[WLMessagesMigrator _messageAttributedBodyDataWithMessage:](self, "_messageAttributedBodyDataWithMessage:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = ppStmt;
  v25 = objc_retainAutorelease(v23);
  sqlite3_bind_blob(v24, 7, (const void *)objc_msgSend(v25, "bytes"), objc_msgSend(v25, "length"), 0);
  sqlite3_bind_int(ppStmt, 8, -[WLMessagesMigrator _messageVersionWithMessage:](self, "_messageVersionWithMessage:", v8));
  v26 = ppStmt;
  -[WLMessagesMigrator _messageServiceWithMessage:](self, "_messageServiceWithMessage:", v8);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v26, 9, (const char *)objc_msgSend(v27, "UTF8String"), -1, 0);

  v28 = ppStmt;
  -[WLMessagesMigrator _messageAccountWithMessage:](self, "_messageAccountWithMessage:", v8);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v28, 10, (const char *)objc_msgSend(v29, "UTF8String"), -1, 0);

  v30 = ppStmt;
  -[WLMessagesMigrator _messageAccountGUIDWithMessage:](self, "_messageAccountGUIDWithMessage:", v8);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v30, 11, (const char *)objc_msgSend(v31, "UTF8String"), -1, 0);

  sqlite3_bind_int(ppStmt, 12, -[WLMessagesMigrator _messageErrorWithMessage:](self, "_messageErrorWithMessage:", v8));
  sqlite3_bind_int64(ppStmt, 13, -[WLMessagesMigrator _messageDateWithMessage:](self, "_messageDateWithMessage:", v8));
  sqlite3_bind_int64(ppStmt, 14, -[WLMessagesMigrator _messageDateReadWithMessage:](self, "_messageDateReadWithMessage:", v8));
  sqlite3_bind_int64(ppStmt, 15, -[WLMessagesMigrator _messageDateDeliveredWithMessage:](self, "_messageDateDeliveredWithMessage:", v8));
  sqlite3_bind_int(ppStmt, 16, 1);
  sqlite3_bind_int(ppStmt, 17, -[WLMessagesMigrator _messageIsFromMeWithMessage:](self, "_messageIsFromMeWithMessage:", v8));
  if (objc_msgSend(v8, "isGroupMessage"))
    sqlite3_bind_text(ppStmt, 18, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), -1, 0);
  else
    sqlite3_bind_null(ppStmt, 18);
  sqlite3_bind_int(ppStmt, 19, 1);
  sqlite3_bind_int(ppStmt, 20, 0);
  v32 = ppStmt;
  -[WLMessagesMigrator _messageGroupTitleWithMessage:](self, "_messageGroupTitleWithMessage:", v8);
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v32, 21, (const char *)objc_msgSend(v33, "UTF8String"), -1, 0);

  sqlite3_bind_int(ppStmt, 22, 1);
  sqlite3_bind_int(ppStmt, 23, 1);
  if (sqlite3_step(ppStmt) == 101)
  {
    insert_rowid = sqlite3_last_insert_rowid(self->_database);
  }
  else
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    insert_rowid = -1;
  }
  sqlite3_finalize(ppStmt);

LABEL_16:
  return insert_rowid;
}

- (id)_messageServiceCenterWithMessage:(id)a3
{
  return 0;
}

- (id)_messageSubjectWithMessage:(id)a3
{
  return 0;
}

- (id)_messageAttributedBodyDataWithMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v3, "messageText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  objc_msgSend(v3, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v3, "attachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v3, "attachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "guid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    v18 = IMCreateSuperFormatStringWithAppendedFileTransfers();
    v6 = (void *)v18;
  }
  objc_msgSend(MEMORY[0x24BDD1440], "archivedDataWithRootObject:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  return v19;
}

- (int64_t)_messageVersionWithMessage:(id)a3
{
  return 10;
}

- (id)_messageServiceWithMessage:(id)a3
{
  return CFSTR("SMS");
}

- (id)_messageAccountWithMessage:(id)a3
{
  void *v3;
  void *v4;

  -[WLMessagesMigrator _ourAddressWithMessage:](self, "_ourAddressWithMessage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("p:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_messageAccountGUIDWithMessage:(id)a3
{
  return self->_accountGuid;
}

- (int64_t)_messageErrorWithMessage:(id)a3
{
  return 0;
}

- (int64_t)_messageDateWithMessage:(id)a3
{
  void *v3;
  double v4;
  int64_t v5;

  objc_msgSend(a3, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = (uint64_t)(v4 * 1000000000.0);

  return v5;
}

- (int64_t)_messageDateReadWithMessage:(id)a3
{
  void *v3;
  double v4;
  int64_t v5;

  objc_msgSend(a3, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = (uint64_t)(v4 * 1000000000.0);

  return v5;
}

- (int64_t)_messageDateDeliveredWithMessage:(id)a3
{
  void *v3;
  double v4;
  int64_t v5;

  objc_msgSend(a3, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = (uint64_t)(v4 * 1000000000.0);

  return v5;
}

- (int64_t)_attachmentDateWithMessage:(id)a3
{
  void *v3;
  double v4;
  int64_t v5;

  objc_msgSend(a3, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = (uint64_t)v4;

  return v5;
}

- (BOOL)_messageIsFromMeWithMessage:(id)a3
{
  return objc_msgSend(a3, "messageDirection") == 0;
}

- (id)_messageGroupTitleWithMessage:(id)a3
{
  return 0;
}

- (BOOL)_insertChatMessageJoinRowWithChatID:(int64_t)a3 messageID:(int64_t)a4 date:(int64_t)a5
{
  BOOL v9;
  int v10;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO chat_message_join (chat_id, message_id, message_date) VALUES (?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    return 0;
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, a3);
    sqlite3_bind_int64(ppStmt, 2, a4);
    sqlite3_bind_int64(ppStmt, 3, a5);
    v10 = sqlite3_step(ppStmt);
    v9 = v10 == 101;
    if (v10 != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
  return v9;
}

- (BOOL)_insertChatHandleJoinRowWithChatID:(int64_t)a3 handleID:(int64_t)a4 duplicateMightExist:(BOOL)a5
{
  const char *v8;
  BOOL v9;
  int v10;
  sqlite3_stmt *ppStmt;

  if (a5)
    v8 = "INSERT OR IGNORE INTO chat_handle_join (chat_id, handle_id) VALUES (?, ?)";
  else
    v8 = "INSERT INTO chat_handle_join (chat_id, handle_id) VALUES (?, ?)";
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, v8, -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    return 0;
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, a3);
    sqlite3_bind_int64(ppStmt, 2, a4);
    v10 = sqlite3_step(ppStmt);
    v9 = v10 == 101;
    if (v10 != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
  return v9;
}

- (void)_updateClient
{
  void *v3;
  sqlite3 *database;
  id v5;
  sqlite3_stmt *ppStmt;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE _SqliteDatabaseProperties SET value = ? WHERE key = ?"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ppStmt = 0;
  database = self->_database;
  v5 = objc_retainAutorelease(v3);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v5, "UTF8String"), -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, 16199);
    sqlite3_bind_text(ppStmt, 2, (const char *)objc_msgSend(CFSTR("_ClientVersion"), "UTF8String"), -1, 0);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
    }
    _WLLog();
    sqlite3_finalize(ppStmt);
  }

}

- (BOOL)isValidTableName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_24E376E00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v6 = objc_msgSend(v3, "length");
    v7 = v6 == objc_msgSend(v5, "length");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)deleteFromTable:(id)a3
{
  id v4;
  void *v5;
  sqlite3 *database;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  if (!-[WLMessagesMigrator isValidTableName:](self, "isValidTableName:", v4))
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ppStmt = 0;
  database = self->_database;
  v4 = objc_retainAutorelease(v5);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v4, "UTF8String"), -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
LABEL_4:
    _WLLog();
    goto LABEL_5;
  }
  if (sqlite3_step(ppStmt) != 101)
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
  }
  sqlite3_finalize(ppStmt);
LABEL_5:

}

- (void)deleteData
{
  if (objc_msgSend(MEMORY[0x24BEC2810], "isInternal"))
  {
    -[WLMessagesMigrator _openDatabase](self, "_openDatabase");
    -[WLMessagesMigrator deleteFromTable:](self, "deleteFromTable:", CFSTR("message_attachment_join"));
    -[WLMessagesMigrator deleteFromTable:](self, "deleteFromTable:", CFSTR("chat_message_join"));
    -[WLMessagesMigrator deleteFromTable:](self, "deleteFromTable:", CFSTR("chat_handle_join"));
    -[WLMessagesMigrator deleteFromTable:](self, "deleteFromTable:", CFSTR("attachment"));
    -[WLMessagesMigrator deleteFromTable:](self, "deleteFromTable:", CFSTR("message"));
    -[WLMessagesMigrator deleteFromTable:](self, "deleteFromTable:", CFSTR("chat"));
    -[WLMessagesMigrator deleteFromTable:](self, "deleteFromTable:", CFSTR("handle"));
    -[WLMessagesMigrator _closeDatabase](self, "_closeDatabase");
  }
}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (WLSQLController)sqlController
{
  return self->_sqlController;
}

- (void)setSqlController:(id)a3
{
  objc_storeStrong((id *)&self->_sqlController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlController, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_accountGuid, 0);
}

@end
