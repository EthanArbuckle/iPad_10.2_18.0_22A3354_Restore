@implementation SDClassroomBrowser

+ (id)sharedBrowser
{
  if (qword_1007C64B0 != -1)
    dispatch_once(&qword_1007C64B0, &stru_100714968);
  return (id)qword_1007C64B8;
}

- (SDClassroomBrowser)init
{
  SDClassroomBrowser *v2;
  SDClassroomBrowser *v3;
  CRKShareTargetBrowser *browser;
  NSMutableDictionary *v5;
  NSMutableDictionary *personIDToShareTarget;
  NSOperationQueue *v7;
  NSOperationQueue *operationsQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SDClassroomBrowser;
  v2 = -[SDClassroomBrowser init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    browser = v2->_browser;
    v2->_browser = 0;

    v3->_clientCount = 0;
    v5 = objc_opt_new(NSMutableDictionary);
    personIDToShareTarget = v3->_personIDToShareTarget;
    v3->_personIDToShareTarget = v5;

    v7 = objc_opt_new(NSOperationQueue);
    operationsQueue = v3->_operationsQueue;
    v3->_operationsQueue = v7;

    -[NSOperationQueue setQualityOfService:](v3->_operationsQueue, "setQualityOfService:", 25);
  }
  return v3;
}

- (void)start
{
  CRKShareTargetBrowser *v3;
  CRKShareTargetBrowser *browser;

  ++self->_clientCount;
  if (!self->_browser)
  {
    v3 = (CRKShareTargetBrowser *)objc_msgSend(objc_alloc(off_1007B03D0()), "initWithDelegate:queue:", self, &_dispatch_main_q);
    browser = self->_browser;
    self->_browser = v3;

    -[CRKShareTargetBrowser resume](self->_browser, "resume");
  }
}

- (void)stop
{
  int clientCount;
  BOOL v3;
  int v4;

  clientCount = self->_clientCount;
  v3 = __OFSUB__(clientCount, 1);
  v4 = clientCount - 1;
  if (v4 < 0 == v3)
  {
    self->_clientCount = v4;
    if (!v4)
      -[SDClassroomBrowser potentiallyInvalidate](self, "potentiallyInvalidate");
  }
}

- (void)transferConcluded
{
  if (!-[NSOperationQueue operationCount](self->_operationsQueue, "operationCount"))
    -[SDClassroomBrowser potentiallyInvalidate](self, "potentiallyInvalidate");
}

- (void)potentiallyInvalidate
{
  id v3;

  if (self->_browser
    && !-[NSOperationQueue operationCount](self->_operationsQueue, "operationCount")
    && !self->_clientCount)
  {
    -[CRKShareTargetBrowser invalidate](self->_browser, "invalidate");
    -[SDClassroomBrowser browserInvalidated](self, "browserInvalidated");
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.ClassroomChanged"), 0, 0);

  }
}

- (void)browserInvalidated
{
  CRKShareTargetBrowser *browser;
  NSArray *nodes;

  browser = self->_browser;
  self->_browser = 0;

  nodes = self->_nodes;
  self->_nodes = 0;

  -[NSMutableDictionary removeAllObjects](self->_personIDToShareTarget, "removeAllObjects");
  -[NSOperationQueue cancelAllOperations](self->_operationsQueue, "cancelAllOperations");
}

- (void)startSendingItems:(id)a3 withProperties:(id)a4 toPersonWithID:(id)a5 clientBundleID:(id)a6 airDropClientDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  SDClassroomBrowser *v23;
  id v24;
  id v25;
  void *v26;
  NSMutableArray *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  id v59;
  const char *v60;
  id v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  id v66;
  void *v67;
  id v68;
  __CFData *v69;
  SDClassroomBrowser *v70;
  void *v71;
  void *v72;
  id value;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  SDClassroomBrowser *v82;
  id v83;
  uint8_t v84[128];
  uint8_t buf[4];
  _BYTE v86[18];
  __int16 v87;
  const char *v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  const char *v94;

  v74 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v70 = self;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_personIDToShareTarget, "objectForKeyedSubscript:", v13));
  v16 = objc_msgSend(v12, "mutableCopy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", kSFOperationItemsDescriptionKey));
  v18 = kSFOperationFileIconKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", kSFOperationFileIconKey));

  if (v19)
    v69 = sub_1000CE5B0(v19, 0);
  else
    v69 = 0;
  v20 = objc_alloc((Class)NSProgress);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sf_initWithAppBundle:sessionID:andPersonRealName:", v14, v17, v13));

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100031F0C;
  v79[3] = &unk_100714990;
  value = v13;
  v80 = value;
  v22 = v17;
  v23 = v70;
  v81 = v22;
  v82 = v70;
  v24 = v14;
  v83 = v24;
  objc_msgSend(v21, "setCancellationHandler:", v79);
  objc_msgSend(v21, "_publish");
  v25 = objc_msgSend(v21, "setSf_transferState:", 2);
  v26 = v71;
  if (v71)
  {
    v25 = objc_msgSend(v74, "count");
    if (v25)
    {
      v25 = objc_msgSend(v12, "count");
      if (v15)
      {
        if (v24 && value && v25)
        {
          v68 = v22;
          v66 = v24;
          v67 = v15;
          objc_msgSend(v16, "removeObjectForKey:", v18);
          objc_msgSend(v16, "removeObjectForKey:", kSFOperationSmallFileIconKey);
          v27 = objc_opt_new(NSMutableArray);
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v28 = v74;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
          if (!v29)
            goto LABEL_23;
          v31 = v29;
          v32 = *(_QWORD *)v76;
          while (1)
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(_QWORD *)v76 != v32)
                objc_enumerationMutation(v28);
              v34 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
              v35 = objc_opt_class(NSURL, v30);
              if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
              {
                v37 = v34;
              }
              else
              {
                v38 = objc_opt_class(NSString, v36);
                if ((objc_opt_isKindOfClass(v34, v38) & 1) == 0)
                  continue;
                v37 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v34));
              }
              v39 = v37;
              if (v37)
              {
                -[NSMutableArray addObject:](v27, "addObject:", v37);

              }
            }
            v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
            if (!v31)
            {
LABEL_23:

              v41 = airdrop_log(v40);
              v42 = objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v43 = objc_msgSend(v28, "count");
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v86 = v43;
                *(_WORD *)&v86[4] = 2112;
                *(_QWORD *)&v86[6] = value;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser sending %d item(s) to %@", buf, 0x12u);
              }

              v26 = v71;
              v15 = v67;
              if (objc_msgSend(v71, "isInstructor"))
              {
                v44 = objc_claimAutoreleasedReturnValue(-[SDClassroomBrowser convertAdvancedDescriptionToSimple:](v70, "convertAdvancedDescriptionToSimple:", v72));

                v45 = (void *)v44;
              }
              else
              {
                v45 = v72;
              }
              objc_msgSend(v16, "setObject:forKeyedSubscript:", &off_10074B298, kSFOperationFilesCopiedKey);
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "displayName"));
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v50, kSFOperationReceiverCompositeNameKey);

              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "secondaryName"));
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v51, kSFOperationReceiverComputerNameKey);

              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "displayName"));
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v52, kSFOperationReceiverFirstNameKey);

              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "displayName"));
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v53, kSFOperationReceiverLastNameKey);

              objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Classroom"), kSFOperationReceiverModelNameKey);
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "identifier"));
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v54, kSFOperationReceiverIDKey);

              v72 = v45;
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "operationToSendItems:fromBundleIdentifier:description:previewImageData:", v27, v66, v45, v69));
              v22 = v68;
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[SDClassroomBrowser operationNameForPersonID:sessionID:clientBundleID:](v70, "operationNameForPersonID:sessionID:clientBundleID:", value, v68, v66));
              objc_msgSend(v55, "setName:", v56);

              objc_msgSend(v55, "addTarget:selector:forOperationEvents:delegateQueue:", v70, "operationStarted:", 1, &_dispatch_main_q);
              objc_msgSend(v55, "addTarget:selector:forOperationEvents:delegateQueue:", v70, "operationMadeProgress:", 8, &_dispatch_main_q);

              objc_msgSend(v55, "addTarget:selector:forOperationEvents:delegateQueue:", v70, "operationEnded:", 6, &_dispatch_main_q);
              v24 = v66;
              objc_setAssociatedObject(v55, "SFClassroomPersonID", value, (void *)0x301);
              objc_setAssociatedObject(v55, "SFClassroomDelegate", v67, (void *)0x301);
              objc_setAssociatedObject(v55, "SFClassroomProgress", v21, (void *)0x301);
              objc_setAssociatedObject(v55, "SFClassroomResults", v16, (void *)0x301);
              -[NSOperationQueue addOperation:](v70->_operationsQueue, "addOperation:", v55);

              goto LABEL_29;
            }
          }
        }
      }
    }
  }
  v46 = airdrop_log(v25);
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    v57 = v12;
    if (v71)
      v58 = "yes";
    else
      v58 = "no";
    v59 = v15;
    if (objc_msgSend(v74, "count"))
      v60 = "yes";
    else
      v60 = "no";
    v61 = objc_msgSend(v57, "count");
    *(_DWORD *)buf = 136316418;
    if (v61)
      v62 = "yes";
    else
      v62 = "no";
    *(_QWORD *)v86 = v58;
    v12 = v57;
    if (value)
      v63 = "yes";
    else
      v63 = "no";
    *(_WORD *)&v86[8] = 2080;
    if (v24)
      v64 = "yes";
    else
      v64 = "no";
    *(_QWORD *)&v86[10] = v60;
    v15 = v59;
    v23 = v70;
    v26 = v71;
    if (v15)
      v65 = "yes";
    else
      v65 = "no";
    v87 = 2080;
    v88 = v62;
    v89 = 2080;
    v90 = v63;
    v91 = 2080;
    v92 = v64;
    v93 = 2080;
    v94 = v65;
    _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "failed send via classroom: shareTarget %s, items.count %s, _properties.count %s, self.personID %s, _clientBundleID %s, _delegate %s", buf, 0x3Eu);
  }

  v48 = sub_10005081C(-1, 0);
  v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v48);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, kSFOperationErrorKey);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray localizedDescription](v27, "localizedDescription"));
  objc_msgSend(v21, "sf_failedWithError:", v49);

  objc_msgSend(v15, "airDropClient:event:withResults:", 0, 10, v16);
  objc_msgSend(v21, "_unpublish");
  -[SDClassroomBrowser transferConcluded](v23, "transferConcluded");
LABEL_29:

}

- (void)cancelSendingItemsToPersonWithID:(id)a3 sessionID:(id)a4 clientBundleID:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDClassroomBrowser operationNameForPersonID:sessionID:clientBundleID:](self, "operationNameForPersonID:sessionID:clientBundleID:", a3, a4, a5));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_operationsQueue, "operations", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        v14 = objc_msgSend(v13, "isEqual:", v6);

        if (v14)
          objc_msgSend(v12, "cancel");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[SDClassroomBrowser transferConcluded](self, "transferConcluded");
}

- (id)convertAdvancedDescriptionToSimple:(id)a3
{
  id v3;
  uint64_t IsJSON;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t isKindOfClass;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;

  v3 = a3;
  IsJSON = SFStringIsJSON();
  v6 = (void *)objc_claimAutoreleasedReturnValue(IsJSON);
  if (v6)
  {
    v7 = objc_opt_class(NSDictionary, v5);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);
    if ((isKindOfClass & 1) != 0)
    {
      v9 = airdrop_log(isKindOfClass);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_1000332F0();

      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SFAirDropActivitySubjectMain")));
      v3 = (id)v11;
    }
    else
    {

      v3 = 0;
    }
  }

  return v3;
}

- (id)operationNameForPersonID:(id)a3 sessionID:(id)a4 clientBundleID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  id v15;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 3));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR("_"), v13, v14, v15));
  return v11;
}

- (void)operationStarted:(id)a3
{
  id v3;
  id AssociatedObject;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;

  v3 = a3;
  AssociatedObject = objc_getAssociatedObject(v3, "SFClassroomResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = objc_getAssociatedObject(v3, "SFClassroomPersonID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_getAssociatedObject(v3, "SFClassroomProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setSf_transferState:", 3);
  objc_msgSend(v9, "setTotalUnitCount:", objc_msgSend(v3, "totalUnitCount"));
  v10 = airdrop_log(objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount")));
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser started send operation to %@", (uint8_t *)&v14, 0xCu);
  }

  v12 = objc_getAssociatedObject(v3, "SFClassroomDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v13, "airDropClient:event:withResults:", 0, 11, v5);
  objc_msgSend(v13, "airDropClient:event:withResults:", 0, 3, v5);
  objc_msgSend(v13, "airDropClient:event:withResults:", 0, 6, v5);

}

- (void)operationMadeProgress:(id)a3
{
  id v3;
  id AssociatedObject;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  AssociatedObject = objc_getAssociatedObject(v3, "SFClassroomProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = objc_getAssociatedObject(v3, "SFClassroomPersonID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "setTotalUnitCount:", objc_msgSend(v3, "totalUnitCount"));
  v8 = airdrop_log(objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount")));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100033358((uint64_t)v7, v5, v9);

  v10 = objc_getAssociatedObject(v3, "SFClassroomDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_getAssociatedObject(v3, "SFClassroomResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = kSFOperationTotalBytesKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));

  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v5, "totalUnitCount")));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v14);

    objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_10074B298, kSFOperationUsePKZip);
    objc_msgSend(v11, "airDropClient:event:withResults:", 0, 5, v13);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v5, "completedUnitCount")));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, kSFOperationBytesCopiedKey);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_10074B298, kSFOperationTimeRemainingKey);
  objc_msgSend(v11, "airDropClient:event:withResults:", 0, 7, v13);

}

- (void)operationEnded:(id)a3
{
  id v4;
  id AssociatedObject;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint8_t v34[24];

  v4 = a3;
  AssociatedObject = objc_getAssociatedObject(v4, "SFClassroomPersonID");
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v7 = objc_getAssociatedObject(v4, "SFClassroomDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_getAssociatedObject(v4, "SFClassroomProgress");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_getAssociatedObject(v4, "SFClassroomResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (!v13)
  {
    v21 = airdrop_log(v14);
    v19 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      *(_QWORD *)&v34[4] = v6;
      v20 = "SDClassroomBrowser finished send operation to %@";
      goto LABEL_7;
    }
LABEL_8:

    objc_msgSend(v10, "setSf_transferState:", 6);
    v22 = v8;
    v23 = 9;
LABEL_9:
    objc_msgSend(v22, "airDropClient:event:withResults:", 0, v23, v12, *(_OWORD *)v34);
    goto LABEL_10;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
  v16 = objc_msgSend(v15, "code");

  if (v16 == (id)404)
  {
    v18 = airdrop_log(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      *(_QWORD *)&v34[4] = v6;
      v20 = "SDClassroomBrowser sender cancelled send operation to %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, v34, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
  v25 = objc_msgSend(v24, "code");

  v27 = airdrop_log(v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  if (v25 == (id)18)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      *(_QWORD *)&v34[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser receiver cancelled send operation to %@", v34, 0xCu);
    }

    objc_msgSend(v10, "setSf_transferState:", 4);
    v22 = v8;
    v23 = 4;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    sub_100033414((uint64_t)v6, v4, v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
  v31 = sub_10005081C(-1, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v32, kSFOperationErrorKey);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedDescription"));
  objc_msgSend(v10, "sf_failedWithError:", v33);

  objc_msgSend(v8, "airDropClient:event:withResults:", 0, 10, v12);
LABEL_10:
  objc_msgSend(v10, "_unpublish");
  -[SDClassroomBrowser transferConcluded](self, "transferConcluded");

}

- (__SFNode)convertShareTargetToNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __SFNode *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  _QWORD *v17;
  CFNumberRef v18;
  uint64_t valuePtr;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (__SFNode *)SFNodeCreate(0, v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryName"));
  SFNodeSetSecondaryName(v7, v8);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconImageData"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v9)));
    v12 = SFDataFromCGImage(objc_msgSend(v11, "CGImage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  else
  {
    v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[SDClassroomBrowser clientBundleID](self, "clientBundleID"));
    v15 = v14;
    if (v14 == CFSTR("com.apple.finder"))
    {
      v16 = 0;
    }
    else if (v14)
    {
      v16 = -[__CFString isEqual:](v14, "isEqual:", CFSTR("com.apple.finder")) ^ 1;
    }
    else
    {
      v16 = 1;
    }

    v13 = sub_10004E578(0, v16, 0, 0);
    if (v13)
      SFNodeAddKind(v7, kSFNodeKindMonogram);
  }
  SFNodeSetIconData(v7, v13);
  SFNodeAddKind(v7, kSFNodeKindAirDrop);
  SFNodeAddKind(v7, kSFNodeKindClassroom);
  if ((objc_msgSend(v4, "isGroup") & 1) == 0 && !objc_msgSend(v4, "isCourse"))
  {
    v17 = &kSFNodeKindPerson;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isGroup"))
    SFNodeAddKind(v7, kSFNodeKindClassroomGroup);
  if (objc_msgSend(v4, "isCourse"))
  {
    v17 = &kSFNodeKindClassroomCourse;
LABEL_17:
    SFNodeAddKind(v7, *v17);
  }
  valuePtr = 705;
  v18 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  SFNodeSetFlags(v7, v18);
  CFRelease(v18);

  return v7;
}

- (void)shareTargetBrowser:(id)a3 didInterruptWithError:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v5 = a4;
  v7 = browser_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1000334C4();

  self->_clientCount = 1;
  -[SDClassroomBrowser stop](self, "stop");

}

- (void)shareTargetBrowser:(id)a3 didFindTargets:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSArray **p_nodes;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSMutableDictionary *personIDToShareTarget;
  void *v18;
  __SFNode *v19;
  NSUInteger v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];

  v5 = a4;
  v7 = browser_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100033534((uint64_t)v5, v8);

  p_nodes = &self->_nodes;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_nodes));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        personIDToShareTarget = self->_personIDToShareTarget;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](personIDToShareTarget, "setObject:forKeyedSubscript:", v16, v18);

        v19 = -[SDClassroomBrowser convertShareTargetToNode:](self, "convertShareTargetToNode:", v16);
        objc_msgSend(v10, "addObject:", v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v13);
  }

  objc_storeStrong((id *)&self->_nodes, v10);
  v20 = -[NSArray count](self->_nodes, "count");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_personIDToShareTarget, "allKeys"));
  v22 = objc_msgSend(v21, "count");

  if ((id)v20 != v22)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDClassroomBrowser.m"), 373, CFSTR("node and shareTarget count not matching"));

  }
  v25 = browser_log(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = SFCompactStringFromCollection(*p_nodes);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138412290;
    v37 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser shareTargetBrowser:didFindTargets: nodes %@", buf, 0xCu);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v29, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.ClassroomChanged"), 0, 0);

}

- (void)shareTargetBrowser:(id)a3 didRemoveTargets:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  NSMutableDictionary *personIDToShareTarget;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  SDClassroomBrowser *v36;
  id v37;
  uint64_t v38;
  id *location;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];

  v5 = a4;
  v7 = browser_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000335B4((uint64_t)v5, v8);

  v36 = self;
  location = (id *)&self->_nodes;
  v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_nodes));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v5;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v11 = *location;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v12)
        {
          v14 = v12;
          v15 = *(_QWORD *)v42;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v42 != v15)
                objc_enumerationMutation(v11);
              v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
              v18 = (void *)SFNodeCopyRealName(v17, v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
              v20 = objc_msgSend(v19, "isEqual:", v18);

              if (v20)
              {
                personIDToShareTarget = v36->_personIDToShareTarget;
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
                -[NSMutableDictionary removeObjectForKey:](personIDToShareTarget, "removeObjectForKey:", v22);

                objc_msgSend(v37, "removeObject:", v17);
                goto LABEL_18;
              }

            }
            v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v40);
  }

  objc_storeStrong(location, v37);
  v23 = -[NSArray count](v36->_nodes, "count");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v36->_personIDToShareTarget, "allKeys"));
  v25 = objc_msgSend(v24, "count");

  if (v23 != v25)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v36, CFSTR("SDClassroomBrowser.m"), 393, CFSTR("node and shareTarget count not matching"));

  }
  v28 = browser_log(v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = SFCompactStringFromCollection(*location);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    *(_DWORD *)buf = 138412290;
    v50 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SDClassroomBrowser shareTargetBrowser:didRemoveTargets: nodes %@", buf, 0xCu);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v32, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.ClassroomChanged"), 0, 0);

}

- (NSArray)nodes
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNodes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_operationsQueue, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_personIDToShareTarget, 0);
}

@end
