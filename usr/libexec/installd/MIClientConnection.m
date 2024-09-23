@implementation MIClientConnection

- (NSString)clientName
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "processIdentifier");
    v5 = objc_msgSend(v3, "effectiveUserIdentifier");
    v6 = objc_msgSend(v3, "effectiveGroupIdentifier");
    v7 = MICopyProcessNameForPid(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (pid %d (%u/%u))"), v8, v4, v5, v6));

  }
  else
  {
    v9 = CFSTR("Unknown client");
  }

  return (NSString *)v9;
}

- (void)sendProgressWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &stru_100085150));
    objc_msgSend(v6, "reportProgress:", v7);

  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection sendProgressWithDictionary:]", CFSTR("Failed to send progress; the connection has gone invalid."));
  }

}

- (void)sendProgressWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t percentComplete;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  percentComplete = self->_percentComplete;
  if (percentComplete < a4)
  {
    self->_percentComplete = a4;
    percentComplete = *(_QWORD *)&a4;
  }
  v9[0] = CFSTR("Status");
  v9[1] = CFSTR("PercentComplete");
  v10[0] = a3;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", percentComplete));
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  -[MIClientConnection sendProgressWithDictionary:](self, "sendProgressWithDictionary:", v8);
}

- (void)sendProgressWithStatus:(id)a3
{
  -[MIClientConnection sendProgressWithStatus:percentComplete:](self, "sendProgressWithStatus:percentComplete:", a3, self->_percentComplete);
}

- (void)sendDelegateMessagesComplete
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100011EA4;
    v5[3] = &unk_100085178;
    v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v5));
    objc_msgSend(v4, "delegateMessageDeliveryCompleteWithError:", 0);

  }
}

- (void)releaseTerminationAssertion
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100011FA0;
    v5[3] = &unk_100085178;
    v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v5));
    objc_msgSend(v4, "releaseTerminationAssertion");

  }
}

- (void)_callBlockAfterDelegateMessagesSend:(const char *)a3 dispatchBlock:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  void (**v11)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000120E0;
    v9[3] = &unk_1000851A0;
    v10 = (id)os_transaction_create(a3);
    v11 = v6;
    v8 = v10;
    objc_msgSend(v7, "addBarrierBlock:", v9);

  }
  else
  {
    v6[2](v6);
  }

}

- (BOOL)_validateAppWithBundleID:(id)a3 isNotInstalledInDomain:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v18;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager"));
  v9 = objc_msgSend(v8, "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:", v7, a4, sub_10000B4F8(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = (void *)MIInstallerErrorDomain;
    v13 = MIStringForInstallationDomain(a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = sub_100010E50((uint64_t)"-[MIClientConnection _validateAppWithBundleID:isNotInstalledInDomain:error:]", 301, v12, 189, 0, 0, CFSTR("Found references (%@) for %@ in %@"), v14, (uint64_t)v10);
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);

    if (a5)
    {
      v16 = objc_retainAutorelease(v16);
      *a5 = v16;
    }
  }
  else
  {
    v16 = 0;
  }

  return v11 == 0;
}

- (void)_doInstallationForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;

  v42 = a3;
  v41 = a4;
  v13 = a6;
  v39 = a8;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "installTypeSummaryString"));
  v14 = objc_msgSend(v13, "lsInstallType");
  v15 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "path"));
    v17 = MIStringForInstallationDomain(a5);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v35 = v40;
    v36 = v14;
    v34 = v16;
    MOLogWrite(v15, 5, "-[MIClientConnection _doInstallationForURL:identity:domain:options:operationType:completion:]", CFSTR("Install of \"%@\" type %@ (LSInstallType = %lu, Domain: %@) requested by %@"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIInstaller installerForURL:identity:domain:options:operationType:forClient:](MIInstaller, "installerForURL:identity:domain:options:operationType:forClient:", v42, v41, a5, v13, 0, self, v34, v35, v36, v37, v38));
  v19 = v18;
  if (!v18)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "path"));
    v26 = sub_100010E50((uint64_t)"-[MIClientConnection _doInstallationForURL:identity:domain:options:operationType:completion:]", 325, MIInstallerErrorDomain, 4, 0, &off_10008F398, CFSTR("Failed to create installer for %@"), v25, (uint64_t)v24);
    v27 = objc_claimAutoreleasedReturnValue(v26);
LABEL_13:

    v23 = 0;
    v22 = 0;
    v21 = (id)v27;
    goto LABEL_14;
  }
  v48 = 0;
  v20 = objc_msgSend(v18, "performInstallationWithError:", &v48);
  v21 = v48;
  if (!v20)
  {
    v23 = 0;
    v22 = 0;
    goto LABEL_14;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "receipt"));
  if (!v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "path"));
    v29 = sub_100010E50((uint64_t)"-[MIClientConnection _doInstallationForURL:identity:domain:options:operationType:completion:]", 335, MIInstallerErrorDomain, 4, 0, &off_10008F3C0, CFSTR("Failed to get receipt after installing %@"), v28, (uint64_t)v24);
    v27 = objc_claimAutoreleasedReturnValue(v29);

    goto LABEL_13;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordPromise"));
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    MOLogWrite(qword_10009E048, 7, "-[MIClientConnection _doInstallationForURL:identity:domain:options:operationType:completion:]", CFSTR("Returning array %@"));
LABEL_14:

  -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000126A0;
  v43[3] = &unk_1000851C8;
  v30 = v39;
  v47 = v30;
  v31 = v22;
  v44 = v31;
  v32 = v23;
  v45 = v32;
  v33 = v21;
  v46 = v33;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:](self, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.installation-for-url-complete", v43);

}

- (void)installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 returningResultInfo:(BOOL)a7 completion:(id)a8
{
  id v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100012770;
  v15[3] = &unk_1000851F0;
  v16 = a8;
  v17 = a7;
  v14 = v16;
  -[MIClientConnection _installURL:identity:targetingDomain:options:operationType:completion:](self, "_installURL:identity:targetingDomain:options:operationType:completion:", a3, a4, a5, a6, 0, v15);

}

- (void)cancelUpdateForStagedUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if ((+[ICLFeatureFlags twoStageAppInstallEnabled](ICLFeatureFlags, "twoStageAppInstallEnabled") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](MIJournal, "sharedInstance"));
    v10 = sub_100012A9C(self, CFSTR("InstallForInstallCoordination"));
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
LABEL_3:

      v12 = 0;
LABEL_4:
      v7[2](v7, 0, v11);
      goto LABEL_7;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "journalEntryForUniqueIdentifier:", v6));
    v16 = v14;
    if (!v14)
    {
      v19 = sub_100010E50((uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]", 397, MIInstallerErrorDomain, 218, 0, 0, CFSTR("Failed to find matching journal entry for %@"), v15, (uint64_t)v6);
      v11 = (id)objc_claimAutoreleasedReturnValue(v19);
      goto LABEL_3;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleID"));

    sub_10004E780(v12);
    v20 = 0;
    v18 = objc_msgSend(v9, "purgeJournalEntry:withError:", v16, &v20);
    v11 = v20;

    sub_10004E89C(v12);
    if (!v18)
      goto LABEL_4;
    v7[2](v7, 1, 0);
  }
  else
  {
    v13 = sub_100010E50((uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]", 374, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v8, (uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]");
    v11 = (id)objc_claimAutoreleasedReturnValue(v13);
    v7[2](v7, 0, v11);
    v12 = 0;
  }
LABEL_7:

}

- (void)registerPlaceholderForReference:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  unsigned int v14;
  void *v15;
  id *v16;
  void *v17;
  uint64_t v18;
  id *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  id *v27;
  void *v28;
  id v29;
  id *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void (**v64)(id, _QWORD, uint64_t);
  void *v65;
  _QWORD block[4];
  id v67;
  id v68;
  uint64_t *v69;
  uint64_t *v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  id v78;
  id v79;
  char v80;
  id obj;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  _BYTE v94[128];

  v5 = a3;
  v64 = (void (**)(id, _QWORD, uint64_t))a4;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = sub_1000136F8;
  v92 = sub_100013708;
  v93 = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = sub_1000136F8;
  v86 = sub_100013708;
  v87 = 0;
  v65 = v5;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identity"));
  if ((+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    v36 = sub_100010E50((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 448, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v6, (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]");
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = (void *)v89[5];
    v89[5] = v37;

    v22 = 0;
    v61 = 0;
    v62 = 0;
    v34 = 0;
    v15 = 0;
    v7 = 0;
    v29 = 0;
LABEL_27:
    v64[2](v64, 0, v89[5]);
    goto LABEL_28;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bundleID"));
  sub_10004E778(v7);
  v8 = objc_msgSend(v5, "domain");
  v9 = (id *)(v89 + 5);
  obj = (id)v89[5];
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v7, v8, &obj));
  objc_storeStrong(v9, obj);
  if (!v62)
  {
    v39 = sub_100010E50((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 458, MIInstallerErrorDomain, 4, (void *)v89[5], 0, CFSTR("Failed to find bundle container when registering placeholder for %@"), v10, (uint64_t)v5);
    v40 = objc_claimAutoreleasedReturnValue(v39);
LABEL_21:
    v42 = 0;
    v61 = 0;
    v15 = 0;
    goto LABEL_22;
  }
  v80 = 0;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bundle"));
  if (!v12)
  {
    v41 = sub_100010E50((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 465, MIInstallerErrorDomain, 36, 0, 0, CFSTR("Failed to find bundle in bundle container %@"), v11, (uint64_t)v62);
    v40 = objc_claimAutoreleasedReturnValue(v41);
    goto LABEL_21;
  }
  v13 = (id *)(v89 + 5);
  v79 = (id)v89[5];
  v14 = objc_msgSend(v63, "resolvePersonaWithError:", &v79);
  v61 = (void *)v12;
  objc_storeStrong(v13, v79);
  if (!v14)
  {
    v42 = 0;
    v15 = 0;
LABEL_25:
    v29 = 0;
LABEL_26:
    v34 = 0;
    v22 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identity"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bundleID"));
    sub_10004E89C(v44);

    goto LABEL_27;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "personaUniqueString"));
  v16 = (id *)(v89 + 5);
  v78 = (id)v89[5];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIDataContainer dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:](MIDataContainer, "dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:", v61, v15, 1, 0, &v80, &v78));
  objc_storeStrong(v16, v78);

  if (!v17)
  {
    v45 = sub_100010E50((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 475, MIInstallerErrorDomain, 4, (void *)v89[5], 0, CFSTR("Failed to create data container when registering placeholder for %@"), v18, (uint64_t)v65);
    v40 = objc_claimAutoreleasedReturnValue(v45);
LABEL_32:
    v42 = 0;
LABEL_22:
    v22 = (id)v89[5];
    v89[5] = v40;
LABEL_23:

    goto LABEL_25;
  }
  v19 = (id *)(v89 + 5);
  v77 = (id)v89[5];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "appExtensionBundlesWithError:", &v77));
  objc_storeStrong(v19, v77);
  if (!v20)
  {
    v52 = sub_100010E50((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 481, MIInstallerErrorDomain, 4, (void *)v89[5], 0, CFSTR("Failed to get app extensions when registering placeholder for %@"), v21, (uint64_t)v65);
    v40 = objc_claimAutoreleasedReturnValue(v52);
    goto LABEL_32;
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v74;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
        v27 = (id *)(v89 + 5);
        v72 = (id)v89[5];
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 1, v15, 1, 0, &v72));
        objc_storeStrong(v27, v72);

        if (!v28)
        {
          v46 = (void *)v89[5];
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
          v49 = sub_100010E50((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 487, MIInstallerErrorDomain, 4, v46, 0, CFSTR("Failed to create data container for app extension %@ when registering placeholder for %@"), v48, (uint64_t)v47);
          v50 = objc_claimAutoreleasedReturnValue(v49);
          v51 = (void *)v89[5];
          v89[5] = v50;

          v42 = v22;
          goto LABEL_23;
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
      if (v23)
        continue;
      break;
    }
  }

  v29 = objc_msgSend(objc_alloc((Class)MIInstalledInfoGatherer), "initWithBundleContainer:forPersona:", v62, v15);
  v30 = (id *)(v89 + 5);
  v71 = (id)v89[5];
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundleRecordWithError:", &v71));
  objc_storeStrong(v30, v71);
  if (!v59)
  {
    v42 = v22;
    goto LABEL_26;
  }
  objc_msgSend(v59, "setIsPlaceholder:", 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identity"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bundleID"));
  sub_10004E89C(v31);

  v32 = sub_10000B610();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013710;
  block[3] = &unk_100084EF0;
  v69 = &v82;
  v34 = v59;
  v67 = v34;
  v35 = v65;
  v68 = v35;
  v70 = &v88;
  dispatch_sync(v33, block);

  if (!v83[5])
  {
    v60 = (void *)v89[5];
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identity"));
    v55 = sub_100010E50((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 512, MIInstallerErrorDomain, 4, v60, 0, CFSTR("Failed to register installation record for %@"), v54, (uint64_t)v53);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    v57 = (void *)v89[5];
    v89[5] = v56;

    goto LABEL_27;
  }

  v64[2](v64, v83[5], 0);
LABEL_28:

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);

}

- (BOOL)_validateInstallRequestForURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 withError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t v47;
  void *v48;
  id v49;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  objc_opt_class(NSURL);
  v15 = v12;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  if (!v16)
  {
    v32 = sub_100010E50((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 563, MIInstallerErrorDomain, 25, 0, &off_10008F3E8, CFSTR("URL provided to install was not a URL or was nil"), v17, v47);
LABEL_16:
    v19 = objc_claimAutoreleasedReturnValue(v32);
LABEL_17:
    v31 = (id)v19;
    goto LABEL_18;
  }
  v18 = sub_100012A9C(self, CFSTR("InstallForInstallCoordination"));
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (v19)
    goto LABEL_17;
  if (objc_msgSend(v14, "allowLocalProvisioned"))
  {
    v20 = sub_100012A9C(self, CFSTR("InstallLocalProvisioned"));
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (v19)
      goto LABEL_17;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "linkedParentBundleID"));

  if (v21 && (sub_100013C48(self) & 1) == 0)
  {
    v35 = (void *)MIInstallerErrorDomain;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v38 = sub_100010E50((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 584, v35, 2, 0, &off_10008F410, CFSTR("Process %@ tried to set an install option %@, but that option may only be passed from callers originating through InstallCoordination SPI."), v37, (uint64_t)v36);
    v31 = (id)objc_claimAutoreleasedReturnValue(v38);

    goto LABEL_18;
  }
  if ((MIIsValidInstallationDomain(a5) & 1) == 0)
  {
    v32 = sub_100010E50((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 598, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Installation domain provided was not valid: %lu"), v22, a5);
    goto LABEL_16;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));

  if (!v23)
  {
    v39 = (void *)MIInstallerErrorDomain;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
    v41 = sub_100010E50((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 603, v39, 25, 0, 0, CFSTR("Install options did not specify a bundle identifier for the install of %@"), v40, (uint64_t)v28);
    v31 = (id)objc_claimAutoreleasedReturnValue(v41);
    goto LABEL_25;
  }
  if (!v13)
  {
    v42 = objc_alloc((Class)MIAppIdentity);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
    v13 = objc_msgSend(v42, "initWithBundleID:", v43);

LABEL_27:
    if (+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled"))
    {
      if (a5 == 3)
        v44 = 2;
      else
        v44 = 3;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
      v49 = 0;
      v46 = -[MIClientConnection _validateAppWithBundleID:isNotInstalledInDomain:error:](self, "_validateAppWithBundleID:isNotInstalledInDomain:error:", v45, v44, &v49);
      v31 = v49;

      if ((v46 & 1) == 0)
        goto LABEL_18;
    }
    else
    {
      v31 = 0;
    }
    v33 = 1;
    goto LABEL_21;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
  v26 = objc_msgSend(v24, "isEqualToString:", v25);

  if ((v26 & 1) != 0)
    goto LABEL_27;
  v27 = (void *)MIInstallerErrorDomain;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
  v30 = sub_100010E50((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 608, v27, 25, 0, 0, CFSTR("Bundle identifier in install options (%@) did not match the one in application identity (%@)"), v29, (uint64_t)v28);
  v31 = (id)objc_claimAutoreleasedReturnValue(v30);

LABEL_25:
LABEL_18:
  if (a7)
  {
    v31 = objc_retainAutorelease(v31);
    v33 = 0;
    *a7 = v31;
  }
  else
  {
    v33 = 0;
  }
LABEL_21:

  return v33;
}

- (void)_installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  unsigned __int8 v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  id v35[2];

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = sub_100013F44();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v35[0] = 0;
  v20 = -[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:](self, "_validateInstallRequestForURL:identity:targetingDomain:options:withError:", v14, v15, a5, v16, v35);
  v21 = v35[0];
  if ((v20 & 1) != 0)
  {
    v22 = sub_100013F84((int)objc_msgSend(v16, "isUserInitiated"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100014064;
    v27[3] = &unk_100085218;
    v27[4] = self;
    v28 = v14;
    v29 = v15;
    v33 = a5;
    v30 = v16;
    v34 = a7;
    v32 = v17;
    v31 = v19;
    MIRunTransactionalTask(v23, "com.apple.installd.install-url", v27);

  }
  else
  {
    -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001409C;
    v24[3] = &unk_1000851A0;
    v26 = v17;
    v25 = v21;
    -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:](self, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.install-url-error", v24);

    v23 = v26;
  }

}

- (void)_stageURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 completion:(id)a7
{
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;

  v40 = a3;
  v38 = a4;
  v11 = a6;
  v37 = a7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "installTypeSummaryString"));
  v13 = objc_msgSend(v11, "lsInstallType");
  v14 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "path"));
    v16 = MIStringForInstallationDomain(a5);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v33 = v12;
    v34 = v13;
    v32 = v15;
    MOLogWrite(v14, 5, "-[MIClientConnection _stageURL:identity:domain:options:completion:]", CFSTR("Staging request for \"%@\" type %@ (LSInstallType = %lu, Domain: %@) requested by %@"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIInstaller installerForURL:identity:domain:options:operationType:forClient:](MIInstaller, "installerForURL:identity:domain:options:operationType:forClient:", v40, v38, a5, v11, 1, self, v32, v33, v34, v35, v36));
  v18 = v17;
  if (!v17)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "path"));
    v24 = sub_100010E50((uint64_t)"-[MIClientConnection _stageURL:identity:domain:options:completion:]", 729, MIInstallerErrorDomain, 4, 0, &off_10008F438, CFSTR("Failed to create installer for %@"), v23, (uint64_t)v22);
    v25 = objc_claimAutoreleasedReturnValue(v24);
LABEL_13:

    v21 = 0;
    v20 = (id)v25;
    goto LABEL_14;
  }
  v45 = 0;
  v19 = objc_msgSend(v17, "performInstallationWithError:", &v45);
  v20 = v45;
  if (!v19)
  {
    v21 = 0;
    goto LABEL_14;
  }
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stagedJournalEntryUniqueID"));
  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "path"));
    v27 = sub_100010E50((uint64_t)"-[MIClientConnection _stageURL:identity:domain:options:completion:]", 739, MIInstallerErrorDomain, 4, 0, &off_10008F460, CFSTR("Failed to get receipt after installing %@"), v26, (uint64_t)v22);
    v25 = objc_claimAutoreleasedReturnValue(v27);

    goto LABEL_13;
  }
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    MOLogWrite(qword_10009E048, 7, "-[MIClientConnection _stageURL:identity:domain:options:completion:]", CFSTR("Returning staged update UUID %@"));
LABEL_14:

  v28 = (void *)v21;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100014500;
  v41[3] = &unk_100085240;
  v29 = v37;
  v44 = v29;
  v30 = v28;
  v42 = v30;
  v31 = v20;
  v43 = v31;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:](self, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.staging-url-complete", v41);

}

- (void)stageInstallURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  unint64_t v33;
  id v34[2];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = sub_100013F44();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if ((+[ICLFeatureFlags twoStageAppInstallEnabled](ICLFeatureFlags, "twoStageAppInstallEnabled") & 1) != 0)
  {
    v34[0] = 0;
    v19 = -[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:](self, "_validateInstallRequestForURL:identity:targetingDomain:options:withError:", v12, v13, a5, v14, v34);
    v20 = v34[0];
    if ((v19 & 1) != 0)
    {
      v21 = sub_100013F84((int)objc_msgSend(v14, "isUserInitiated"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100014814;
      v27[3] = &unk_100085268;
      v27[4] = self;
      v28 = v12;
      v29 = v13;
      v33 = a5;
      v30 = v14;
      v32 = v15;
      v31 = v17;
      MIRunTransactionalTask(v22, "com.apple.installd.staging-url", v27);

    }
    else
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100014848;
      v24[3] = &unk_1000851A0;
      v26 = v15;
      v25 = v20;
      -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:](self, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.staging-url-error", v24);

      v22 = v26;
    }

  }
  else
  {
    v23 = sub_100010E50((uint64_t)"-[MIClientConnection stageInstallURL:identity:targetingDomain:withOptions:completion:]", 765, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v18, (uint64_t)"-[MIClientConnection stageInstallURL:identity:targetingDomain:withOptions:completion:]");
    v20 = (id)objc_claimAutoreleasedReturnValue(v23);
    (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v20);
  }

}

- (void)_finalizeStagedUpdateForUUID:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v5 = a3;
  v41 = a4;
  v43 = v5;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](MIJournal, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "journalEntryForUniqueIdentifier:", v5));
  v8 = v6;
  if (!v6)
  {
    v25 = sub_100010E50((uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]", 826, MIInstallerErrorDomain, 218, 0, 0, CFSTR("Failed to find matching journal entry for %@"), v7, (uint64_t)v5);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v24 = 0;
    v18 = 0;
    v23 = 0;
    v10 = 0;
LABEL_13:
    v21 = (id)v26;
    goto LABEL_16;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "installOptions"));
  v10 = v9;
  v11 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "installTypeSummaryString"));
    v13 = objc_msgSend(v10, "lsInstallType");
    v14 = MIStringForInstallationDomain(objc_msgSend(v8, "installationDomain"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v36 = v12;
    v37 = v13;
    v35 = v43;
    MOLogWrite(v11, 5, "-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]", CFSTR("Installation staged update of \"%@\" type %@ (LSInstallType = %lu, Domain: %@) requested by %@"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identity", v35, v36, v37, v38, v39));
  v16 = objc_msgSend(v8, "installationDomain");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "installOptions"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIInstaller installerForURL:identity:domain:options:operationType:forClient:](MIInstaller, "installerForURL:identity:domain:options:operationType:forClient:", 0, v15, v16, v17, 2, self));

  if (!v18)
  {
    v27 = sub_100010E50((uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]", 835, MIInstallerErrorDomain, 4, 0, &off_10008F488, CFSTR("Failed to create installer for installing staged update %@"), v19, (uint64_t)v43);
    v26 = objc_claimAutoreleasedReturnValue(v27);
    v24 = 0;
    v18 = 0;
    v23 = 0;
    goto LABEL_13;
  }
  v49 = 0;
  v20 = objc_msgSend(v18, "applyStagedUpdateForUUID:withError:", v43, &v49);
  v21 = v49;
  if (v20)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "receipt"));
    if (v23)
    {
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recordPromise"));
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
        MOLogWrite(qword_10009E048, 7, "-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]", CFSTR("Returning array %@"));
    }
    else
    {
      v28 = sub_100010E50((uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]", 845, MIInstallerErrorDomain, 4, 0, &off_10008F4B0, CFSTR("Failed to get receipt after installing staged update %@"), v22, (uint64_t)v43);
      v29 = objc_claimAutoreleasedReturnValue(v28);

      v24 = 0;
      v23 = 0;
      v21 = (id)v29;
    }
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
LABEL_16:

  v30 = (void *)v24;
  -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100014DFC;
  v44[3] = &unk_1000851C8;
  v31 = v41;
  v48 = v31;
  v32 = v23;
  v45 = v32;
  v33 = v30;
  v46 = v33;
  v34 = v21;
  v47 = v34;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:](self, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.installation-for-staged-update-complete", v44);

}

- (void)finalizeStagedInstallForUUID:(id)a3 returningResultInfo:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  NSObject *v23;
  id v24;
  BOOL v25;

  v8 = a3;
  v9 = a5;
  if ((+[ICLFeatureFlags twoStageAppInstallEnabled](ICLFeatureFlags, "twoStageAppInstallEnabled") & 1) != 0)
  {
    v11 = sub_100013F44();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_100012A9C(self, CFSTR("InstallForInstallCoordination"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14)
    {
      -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100015170;
      v18[3] = &unk_1000851A0;
      v20 = v9;
      v19 = v14;
      -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:](self, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.installation-for-staged-update", v18);

      v15 = v20;
    }
    else
    {
      v17 = sub_100013F84(0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000150C4;
      v21[3] = &unk_100085290;
      v21[4] = self;
      v22 = v8;
      v24 = v9;
      v25 = a4;
      v23 = v12;
      MIRunTransactionalTask(v15, "com.apple.installd.installation-for-staged-update", v21);

    }
  }
  else
  {
    v16 = sub_100010E50((uint64_t)"-[MIClientConnection finalizeStagedInstallForUUID:returningResultInfo:completion:]", 874, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v10, (uint64_t)"-[MIClientConnection finalizeStagedInstallForUUID:returningResultInfo:completion:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, 0, v14);
  }

}

- (void)revertIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001521C;
  v9[3] = &unk_1000852B8;
  v10 = a5;
  v8 = v10;
  -[MIClientConnection revertForIXWithIdentity:withOptions:completion:](self, "revertForIXWithIdentity:withOptions:completion:", a3, a4, v9);

}

- (void)revertForIXWithIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
  v11 = sub_100012A9C(self, CFSTR("RevertForInstallCoordination"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_22;
  }
  if (v9)
  {
    objc_opt_class(NSDictionary);
    v16 = v9;
    v17 = (objc_opt_isKindOfClass(v16) & 1) != 0 ? v16 : 0;

    if (!v17)
    {
      v14 = 0;
      v28 = sub_100010E50((uint64_t)"-[MIClientConnection revertForIXWithIdentity:withOptions:completion:]", 959, MIInstallerErrorDomain, 25, 0, &off_10008F4D8, CFSTR("Options provided was not a dictionary"), v18, v33);
      v27 = objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_21;
    }
  }
  objc_opt_class(NSString);
  v19 = v36;
  if ((objc_opt_isKindOfClass(v19) & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  if (!v20)
  {
    v14 = 0;
    v26 = sub_100010E50((uint64_t)"-[MIClientConnection revertForIXWithIdentity:withOptions:completion:]", 964, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Identifier provided to revert was not a string or was nil"), v21, v33);
    v27 = objc_claimAutoreleasedReturnValue(v26);
LABEL_21:
    v12 = (void *)v27;
    v13 = 0;
    v15 = 0;
    goto LABEL_22;
  }
  v22 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v35 = v9;
    v33 = (uint64_t)v19;
    MOLogWrite(v22, 5, "-[MIClientConnection revertForIXWithIdentity:withOptions:completion:]", CFSTR("Revert of \"%@\" requested by %@ with options %@"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MIReverter reverterForAppIdentity:withOptions:forClient:](MIReverter, "reverterForAppIdentity:withOptions:forClient:", v8, v9, self, v33, v34, v35));
  v42 = 0;
  v24 = objc_msgSend(v23, "performRevertWithError:", &v42);
  v25 = v42;
  if (v24)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "receipt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "recordPromise"));
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  v12 = v25;
  v14 = v23;
LABEL_22:

  -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100015684;
  v37[3] = &unk_1000851C8;
  v29 = v10;
  v41 = v29;
  v30 = v15;
  v38 = v30;
  v31 = v13;
  v39 = v31;
  v32 = v12;
  v40 = v32;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:](self, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.revert-complete", v37);

}

- (void)uninstallIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_new(NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(objc_alloc((Class)MIAppIdentity), "initWithBundleID:persona:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15), CFSTR("PersonalPersonaPlaceholderString"));
        -[NSMutableArray addObject:](v10, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = -[NSMutableArray copy](v10, "copy");
  -[MIClientConnection _uninstallIdentities:withOptions:completion:](self, "_uninstallIdentities:withOptions:completion:", v17, v8, v9);

}

- (void)_uninstallIdentities:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  int v17;
  id v18;
  id v19;
  __CFString *v20;
  uint64_t v21;
  _UNKNOWN **v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unsigned int v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100012A9C(self, CFSTR("UninstallForInstallCoordination"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12)
  {
    objc_opt_class(NSArray);
    v15 = v8;
    if ((objc_opt_isKindOfClass(v15) & 1) != 0)
    {
      if (v15)
      {
        objc_opt_class(MIAppIdentity);
        v17 = sub_100011190(v15);

        if (v17)
        {
          if (!v9
            || ((objc_opt_class(NSDictionary),
                 v18 = v9,
                 (objc_opt_isKindOfClass(v18) & 1) == 0)
              ? (v19 = 0)
              : (v19 = v18),
                v18,
                v19,
                v19))
          {
            v28 = objc_msgSend(v15, "count");
            v29 = qword_10009E048;
            if (v28 == (id)1)
            {
              if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
                goto LABEL_25;
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
              v40 = v9;
              v38 = (uint64_t)v30;
              MOLogWrite(v29, 5, "-[MIClientConnection _uninstallIdentities:withOptions:completion:]", CFSTR("Uninstall requested by %@ for identity %@ with options: %@"));

            }
            else
            {
              if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
                goto LABEL_25;
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
              v39 = v15;
              v40 = v9;
              v38 = (uint64_t)v30;
              MOLogWrite(v29, 5, "-[MIClientConnection _uninstallIdentities:withOptions:completion:]", CFSTR("Uninstall requested by %@ for identities %@ with options: %@"));
            }

LABEL_25:
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstaller uninstallerForIdentities:withOptions:forClient:](MIUninstaller, "uninstallerForIdentities:withOptions:forClient:", v15, v9, self, v38, v39, v40));
            v13 = v31;
            if (v31)
            {
              v45 = 0;
              v33 = objc_msgSend(v31, "performUninstallationWithError:", &v45);
              v34 = v45;
              if (v33)
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "receipt"));
                if (!v14)
                {
                  v37 = sub_100010E50((uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]", 1050, MIInstallerErrorDomain, 4, 0, &off_10008F578, CFSTR("Failed to get receipt after uninstalling %@"), v35, (uint64_t)v15);
                  v12 = (void *)objc_claimAutoreleasedReturnValue(v37);

                  goto LABEL_3;
                }
                if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
                {
                  MOLogWrite(qword_10009E048, 7, "-[MIClientConnection _uninstallIdentities:withOptions:completion:]", CFSTR("Returning array %@"));
                  v12 = v34;
                  goto LABEL_14;
                }
              }
              else
              {
                v14 = 0;
              }
              v12 = v34;
              goto LABEL_14;
            }
            v36 = sub_100010E50((uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]", 1040, MIInstallerErrorDomain, 4, 0, &off_10008F550, CFSTR("Failed to create uninstaller for %@"), v32, (uint64_t)v15);
            v24 = objc_claimAutoreleasedReturnValue(v36);
LABEL_13:
            v12 = (void *)v24;
            v13 = 0;
            v14 = 0;
            goto LABEL_14;
          }
          v20 = CFSTR("Options provided was not a dictionary");
          v21 = 1028;
          v22 = &off_10008F528;
LABEL_12:
          v23 = sub_100010E50((uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]", v21, MIInstallerErrorDomain, 25, 0, v22, v20, v16, v38);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          goto LABEL_13;
        }
      }
    }
    else
    {

    }
    v20 = CFSTR("Identifers provided was not an array of strings");
    v21 = 1023;
    v22 = &off_10008F500;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_3:
  v14 = 0;
LABEL_14:

  -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100015D9C;
  v41[3] = &unk_100085240;
  v25 = v10;
  v44 = v25;
  v26 = v14;
  v42 = v26;
  v27 = v12;
  v43 = v27;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:](self, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.uninstall-identifiers-complete", v41);

}

- (void)uninstallIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a5;
  v15 = a3;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100015EB8;
  v13[3] = &unk_1000852E0;
  v14 = v8;
  v12 = v8;
  -[MIClientConnection _uninstallIdentities:withOptions:completion:](self, "_uninstallIdentities:withOptions:completion:", v11, v9, v13);

}

- (void)lookupUninstalledWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, void *);
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  v7 = sub_100012A9C(self, CFSTR("LookupUninstalled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
    goto LABEL_18;
  if (v19)
  {
    objc_opt_class(NSDictionary);
    v9 = v19;
    v10 = (objc_opt_isKindOfClass(v9) & 1) != 0 ? v9 : 0;

    if (!v10)
    {
      v16 = sub_100010E50((uint64_t)"-[MIClientConnection lookupUninstalledWithOptions:completion:]", 1093, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Options provided was not a dictionary"), v11, (uint64_t)v17);
      v15 = objc_claimAutoreleasedReturnValue(v16);
LABEL_17:
      v8 = (void *)v15;
LABEL_18:
      v14 = 0;
      goto LABEL_19;
    }
  }
  v12 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v18 = v19;
    MOLogWrite(v12, 5, "-[MIClientConnection lookupUninstalledWithOptions:completion:]", CFSTR("Lookup uninstalled requested by %@ with options %@"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstalledAppList sharedList](MIUninstalledAppList, "sharedList", v17, v18));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uninstalledDictionary"));

  if (!v14)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIClientConnection lookupUninstalledWithOptions:completion:]", CFSTR("Lookup failed"));
    v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MIInstallerErrorDomain, 1, &off_10008F5A0));
    goto LABEL_17;
  }
  v8 = 0;
LABEL_19:
  v6[2](v6, v14, v8);

}

- (void)clearUninstalledIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = sub_100012A9C(self, CFSTR("ClearUninstalled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
    goto LABEL_18;
  if (v8)
  {
    objc_opt_class(NSDictionary);
    v12 = v8;
    v13 = (objc_opt_isKindOfClass(v12) & 1) != 0 ? v12 : 0;

    if (!v13)
    {
      v19 = CFSTR("Options provided was not a dictionary");
      v20 = 1130;
      goto LABEL_17;
    }
  }
  objc_opt_class(NSArray);
  v15 = v25;
  if ((objc_opt_isKindOfClass(v15) & 1) == 0)
  {

LABEL_15:
    v19 = CFSTR("Identifers provided was not an array of strings");
    v20 = 1135;
LABEL_17:
    v21 = sub_100010E50((uint64_t)"-[MIClientConnection clearUninstalledIdentifiers:withOptions:completion:]", v20, MIInstallerErrorDomain, 25, 0, 0, v19, v14, (uint64_t)v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_18;
  }
  if (!v15)
    goto LABEL_15;
  objc_opt_class(NSString);
  v16 = sub_100011190(v15);

  if ((v16 & 1) == 0)
    goto LABEL_15;
  v17 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v23 = v8;
    v24 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    MOLogWrite(v17, 5, "-[MIClientConnection clearUninstalledIdentifiers:withOptions:completion:]", CFSTR("Clear uninstalled identifiers requested by %@ with options %@ : %@"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstalledAppList sharedList](MIUninstalledAppList, "sharedList", v22, v23, v24));
  objc_msgSend(v18, "removeIdentifiers:", v15);

  v11 = 0;
LABEL_18:
  v9[2](v9, v11);

}

- (void)lookupSystemAppStateWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, void *);
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;

  v21 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  v7 = sub_100012A9C(self, CFSTR("LookupSystemAppState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
    goto LABEL_18;
  if (v21)
  {
    objc_opt_class(NSDictionary);
    v9 = v21;
    v10 = (objc_opt_isKindOfClass(v9) & 1) != 0 ? v9 : 0;

    if (!v10)
    {
      v18 = sub_100010E50((uint64_t)"-[MIClientConnection lookupSystemAppStateWithOptions:completion:]", 1170, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Options provided was not a dictionary"), v11, (uint64_t)v19);
      v17 = objc_claimAutoreleasedReturnValue(v18);
LABEL_17:
      v8 = (void *)v17;
LABEL_18:
      v16 = 0;
      goto LABEL_19;
    }
  }
  v12 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v20 = v21;
    MOLogWrite(v12, 5, "-[MIClientConnection lookupSystemAppStateWithOptions:completion:]", CFSTR("Lookup system app state requested by %@ with options %@"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppState sharedList](MISystemAppState, "sharedList", v19, v20));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RestoreBackupAppState")));
  v15 = objc_msgSend(v13, "systemAppStateDictionaryRestoringBackedUpState:", sub_10001113C(v14, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (!v16)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIClientConnection lookupSystemAppStateWithOptions:completion:]", CFSTR("Lookup failed"));
    v17 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MIInstallerErrorDomain, 1, &off_10008F5C8));
    goto LABEL_17;
  }
  v8 = 0;
LABEL_19:
  v6[2](v6, v16, v8);

}

- (void)updateSystemAppStateForIdentifier:(id)a3 appState:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = sub_100012A9C(self, CFSTR("UpdateSystemAppState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    objc_opt_class(NSString);
    v12 = v8;
    if ((objc_opt_isKindOfClass(v12) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (!v13)
    {
      v17 = sub_100010E50((uint64_t)"-[MIClientConnection updateSystemAppStateForIdentifier:appState:completion:]", 1208, MIInstallerErrorDomain, 25, 0, 0, CFSTR("bundleID parameter was not a string"), v14, v22);
      v16 = objc_claimAutoreleasedReturnValue(v17);
      goto LABEL_9;
    }
    if (v6 >= 7)
    {
      v15 = sub_100010E50((uint64_t)"-[MIClientConnection updateSystemAppStateForIdentifier:appState:completion:]", 1213, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Unknown value for appState key : %lu"), v14, v6);
      v16 = objc_claimAutoreleasedReturnValue(v15);
LABEL_9:
      v11 = (void *)v16;
      goto LABEL_10;
    }
    v18 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v18, 5, "-[MIClientConnection updateSystemAppStateForIdentifier:appState:completion:]", CFSTR("Update system app state for %@ to %lu (requested by %@)"));

    }
    if ((_DWORD)v6)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppState sharedList](MISystemAppState, "sharedList"));
      objc_msgSend(v19, "addIdentifier:withState:", v12, v6);

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppState sharedList](MISystemAppState, "sharedList"));
      v24 = v12;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      objc_msgSend(v20, "removeIdentifiers:", v21);

    }
    v11 = 0;
  }
LABEL_10:
  v9[2](v9, v11);

}

- (void)registerContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(id, void *))a4;
  if ((sub_100013C48(self) & 1) != 0)
  {
    objc_opt_class(NSURL);
    v7 = v17;
    if ((objc_opt_isKindOfClass(v7) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (v8)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIDiskImageManager sharedInstance](MIDiskImageManager, "sharedInstance"));
      objc_msgSend(v14, "registerContentsAtMountPoint:completion:", v7, v6);

      v12 = 0;
    }
    else
    {
      v15 = sub_100010E50((uint64_t)"-[MIClientConnection registerContentsForDiskImageAtURL:completion:]", 1253, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Disk image path for registering contents was not a URL."), v13, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v6[2](v6, v12);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v11 = sub_100010E50((uint64_t)"-[MIClientConnection registerContentsForDiskImageAtURL:completion:]", 1247, MIInstallerErrorDomain, 2, 0, &off_10008F5F0, CFSTR("Process %@ tried to register disk image, but disk registration can only be done by InstallCoordination."), v10, (uint64_t)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v6[2](v6, v12);
  }

}

- (void)unregisterContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(id, void *))a4;
  if ((sub_100013C48(self) & 1) != 0)
  {
    objc_opt_class(NSURL);
    v7 = v17;
    if ((objc_opt_isKindOfClass(v7) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (v8)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIDiskImageManager sharedInstance](MIDiskImageManager, "sharedInstance"));
      objc_msgSend(v14, "unregisterContentsAtMountPoint:completion:", v7, v6);

      v12 = 0;
    }
    else
    {
      v15 = sub_100010E50((uint64_t)"-[MIClientConnection unregisterContentsForDiskImageAtURL:completion:]", 1284, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Disk image path for unregistering content was not a URL."), v13, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v6[2](v6, v12);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v11 = sub_100010E50((uint64_t)"-[MIClientConnection unregisterContentsForDiskImageAtURL:completion:]", 1278, MIInstallerErrorDomain, 2, 0, &off_10008F618, CFSTR("Process %@ tried to unregister disk image, but disk registration can only be done by InstallCoordination."), v10, (uint64_t)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v6[2](v6, v12);
  }

}

- (void)enumerateInstalledAppsWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (qword_10009DF50 != -1)
    dispatch_once(&qword_10009DF50, &stru_1000853C0);
  v8 = qword_10009DF58;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016FB0;
  block[3] = &unk_100085080;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)fetchInfoForFrameworkAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id, id);
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  NSMutableArray *v39;
  NSMutableDictionary *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  NSMutableDictionary *v44;
  NSMutableArray *v45;
  id v46;
  id v47;

  v41 = a3;
  v8 = a4;
  v9 = (void (**)(id, id, id))a5;
  v39 = objc_opt_new(NSMutableArray);
  v40 = objc_opt_new(NSMutableDictionary);
  v10 = sub_100012A9C(self, CFSTR("CopyFrameworkInfoForLaunchServices"));
  v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    v12 = 0;
    v13 = 0;
LABEL_3:
    v14 = 0;
    goto LABEL_26;
  }
  objc_opt_class(NSURL);
  v15 = v41;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  if (!v16)
  {
    v20 = CFSTR("frameworkBundleURL parameter was not a valid URL");
    v21 = 1412;
LABEL_23:
    v14 = 0;
    v34 = sub_100010E50((uint64_t)"-[MIClientConnection fetchInfoForFrameworkAtURL:options:completion:]", v21, MIInstallerErrorDomain, 25, 0, 0, v20, v17, v35);
    v11 = (id)objc_claimAutoreleasedReturnValue(v34);
    v12 = 0;
    v13 = 0;
    goto LABEL_26;
  }
  if (v8)
  {
    objc_opt_class(NSDictionary);
    v18 = v8;
    v19 = (objc_opt_isKindOfClass(v18) & 1) != 0 ? v18 : 0;

    if (!v19)
    {
      v20 = CFSTR("options parameter was not a dictionary");
      v21 = 1417;
      goto LABEL_23;
    }
  }
  v22 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v37 = v8;
    v35 = (uint64_t)v23;
    MOLogWrite(v22, 5, "-[MIClientConnection fetchInfoForFrameworkAtURL:options:completion:]", CFSTR("Fetch framework info at %@ requested by %@ with options %@"));

  }
  v47 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIExecutableBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v15, &v47, v35, v36, v37));
  v24 = v47;
  v25 = v24;
  if (!v13)
  {
    v12 = 0;
    v14 = 0;
    v11 = v24;
    goto LABEL_26;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "primaryPersonaString"));
  v46 = v25;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:](MILaunchServicesDatabaseGatherer, "entryForBundle:inContainer:forPersona:withError:", v13, 0, v27, &v46));
  v11 = v46;

  if (!v12)
    goto LABEL_3;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v12, v28);

  -[NSMutableArray addObject:](v39, "addObject:", v12);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100017A64;
  v43[3] = &unk_100085308;
  v44 = v40;
  v29 = v39;
  v45 = v29;
  v30 = objc_retainBlock(v43);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "primaryPersonaString"));
  v42 = v11;
  v33 = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:](MILaunchServicesDatabaseGatherer, "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:", v13, v32, 0, 0, 0, &v42, v30);
  v38 = v42;

  if ((v33 & 1) != 0)
    v14 = v29;
  else
    v14 = 0;
  v11 = v38;
LABEL_26:
  v9[2](v9, v14, v11);

}

- (void)fetchInfoForContainerizedAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  __CFString *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *, void *))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
  v14 = sub_100012A9C(self, CFSTR("CopyContainerizedAppInfoForLaunchServices"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (!v16)
  {
    if (v10)
    {
      if ((MIIsValidInstallationDomain(a4) & 1) == 0)
      {
        v17 = 0;
        v25 = sub_100010E50((uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]", 1487, MIInstallerErrorDomain, 25, 0, 0, CFSTR("domain %lu isn't valid"), v18, a4);
        v24 = objc_claimAutoreleasedReturnValue(v25);
        goto LABEL_11;
      }
      if (!v11
        || ((objc_opt_class(NSDictionary), v19 = v11, (objc_opt_isKindOfClass(v19) & 1) == 0)
          ? (v20 = 0)
          : (v20 = v19),
            v19,
            v20,
            v20))
      {
        v26 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
          MOLogWrite(v26, 5, "-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]", CFSTR("Got fetch info for containerized app %@ request from client %@"));

        }
        sub_10004E780(v13);
        v41 = 0;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v13, a4, &v41));
        v28 = v41;
        if (!v27)
        {
          v33 = 0;
          v30 = 0;
LABEL_27:

          v16 = v28;
          sub_10004E89C(v13);
          v17 = (void *)v33;
          goto LABEL_28;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundle"));
        if (v30)
        {
          v40 = v28;
          v31 = objc_msgSend(v10, "resolvePersonaWithError:", &v40);
          v32 = v40;

          if (!v31)
          {
            v33 = 0;
            goto LABEL_26;
          }
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaUniqueString"));
          v39 = v32;
          v33 = objc_claimAutoreleasedReturnValue(+[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:](MILaunchServicesDatabaseGatherer, "fetchInfoForBundle:forPersona:inContainer:withError:", v30, v38, v27, &v39));
          v34 = v39;

          v32 = v34;
          v28 = (id)v38;
        }
        else
        {
          v35 = sub_100010E50((uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]", 1509, MIInstallerErrorDomain, 36, 0, 0, CFSTR("Failed to find bundle in bundle container %@ for %@"), v29, (uint64_t)v27);
          v32 = (id)objc_claimAutoreleasedReturnValue(v35);
          v33 = 0;
          v30 = 0;
        }

LABEL_26:
        v28 = v32;
        goto LABEL_27;
      }
      v21 = CFSTR("options parameter was not a dictionary");
      v22 = 1492;
    }
    else
    {
      v21 = CFSTR("identity parameter was nil");
      v22 = 1482;
    }
    v17 = 0;
    v23 = sub_100010E50((uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]", v22, MIInstallerErrorDomain, 25, 0, 0, v21, v15, v36);
    v24 = objc_claimAutoreleasedReturnValue(v23);
LABEL_11:
    v16 = (void *)v24;
    goto LABEL_28;
  }
  v17 = 0;
LABEL_28:
  v12[2](v12, v17, v16);

}

- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 data:(id)a5 optionalOptions:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  BOOL v25;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class(NSString);
  v14 = v11;
  if ((objc_opt_isKindOfClass(v14) & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  if (v15)
  {
    objc_opt_class(NSData);
    v17 = v12;
    if ((objc_opt_isKindOfClass(v17) & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    if (v18)
    {
      if (!v13
        || ((objc_opt_class(NSDictionary), v21 = v13, (objc_opt_isKindOfClass(v21) & 1) == 0)
          ? (v22 = 0)
          : (v22 = v21),
            v21,
            v22,
            v22))
      {
        v24 = 0;
        goto LABEL_21;
      }
      v19 = sub_100010E50((uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]", 1551, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Parameter validation failed for: %s, options parameter was not a dictionary"), v23, (uint64_t)a3);
    }
    else
    {
      v19 = sub_100010E50((uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]", 1546, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Parameter validation failed for: %s, data parameter was not a data object"), v20, (uint64_t)a3);
    }
  }
  else
  {
    v19 = sub_100010E50((uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]", 1541, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Parameter validation failed for: %s, bundleIdentifier parameter was not a string"), v16, (uint64_t)a3);
  }
  v24 = (id)objc_claimAutoreleasedReturnValue(v19);
  if (a7 && v24)
  {
    v24 = objc_retainAutorelease(v24);
    *a7 = v24;
  }
LABEL_21:
  v25 = v24 == 0;

  return v25;
}

- (void)updateSinfForIXWithIdentifier:(id)a3 withOptions:(id)a4 sinfData:(id)a5 completion:(id)a6
{
  void (**v10)(id, id, _QWORD);
  id v11;
  uint64_t v12;
  id v13;
  id *v14;
  unsigned int v15;
  uint64_t v16;
  id *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  id *v25;
  unsigned __int8 v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  unsigned __int8 v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  unsigned __int8 v49;
  id *v50;
  unsigned __int8 v51;
  void *v52;
  void *v53;
  unint64_t v54;
  id v55;
  id v56;
  id v57;
  int v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD block[4];
  id v64;
  id v65;
  uint64_t *v66;
  uint64_t *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  unsigned int v72;
  id v73;
  id obj;
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  id *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;

  v61 = a3;
  v60 = a4;
  v59 = a5;
  v10 = (void (**)(id, id, _QWORD))a6;
  v80 = 0;
  v81 = (id *)&v80;
  v82 = 0x3032000000;
  v83 = sub_1000136F8;
  v84 = sub_100013708;
  v85 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v11 = sub_100012A9C(self, CFSTR("UpdateSinfForInstallCoordination"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v81[5];
  v81[5] = (id)v12;

  v14 = v81 + 5;
  if (v81[5]
    || (v75 = 0,
        v15 = -[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:](self, "_validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:", "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", v61, v59, v60, &v75), objc_storeStrong(v14, v75), !v15))
  {
    v24 = 0;
    v18 = 0;
    v21 = 0;
    v22 = 0;
    v29 = 0;
    v37 = 0;
    goto LABEL_27;
  }
  v16 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v55 = v61;
    v57 = v60;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    MOLogWrite(v16, 5, "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", CFSTR("Update sinf requested by client %@ for identifier %@ with options %@"));

  }
  sub_10004E780(v61);
  v17 = v81;
  obj = v81[5];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v61, 0, 0, &obj));
  objc_storeStrong(v17 + 5, obj);
  if (!v18)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v21 = 0;
      v22 = 0;
      MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", CFSTR("Failed to obtain app bundle container for %@: %@"));
      v24 = 0;
      v29 = 0;
LABEL_56:
      v37 = 0;
      sub_10004E89C(v61);
      goto LABEL_27;
    }
    v24 = 0;
    v21 = 0;
    v22 = 0;
LABEL_36:
    v29 = 0;
    goto LABEL_56;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundle"));
  v21 = v19;
  if (!v19)
  {
    v40 = sub_100010E50((uint64_t)"-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", 1761, MIInstallerErrorDomain, 36, 0, 0, CFSTR("Failed to get app bundle in bundle container for %@"), v20, (uint64_t)v61);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    v24 = 0;
    v21 = 0;
    v22 = 0;
    v29 = 0;
    v39 = v81[5];
    v81[5] = (id)v41;
LABEL_55:

    goto LABEL_56;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rootSinfURL"));
  v23 = v81;
  v73 = v81[5];
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v22, 2, &v73));
  objc_storeStrong(v23 + 5, v73);
  if (v24)
    goto LABEL_9;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81[5], "domain"));
  if ((objc_msgSend(v42, "isEqualToString:", NSCocoaErrorDomain) & 1) == 0)
  {

LABEL_38:
    v44 = v81[5];
    v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path", v53, v55, v57));
    v46 = sub_100010E50((uint64_t)"-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", 1769, MIInstallerErrorDomain, 4, v44, 0, CFSTR("Failed to read SINF from %@"), v45, (uint64_t)v39);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    v48 = v81[5];
    v81[5] = (id)v47;

    v24 = 0;
    v29 = 0;
    goto LABEL_55;
  }
  v43 = objc_msgSend(v81[5], "code");

  if (v43 != (id)260)
    goto LABEL_38;
LABEL_9:
  v72 = 0;
  v25 = v81;
  v71 = v81[5];
  v26 = objc_msgSend(v21, "getSinfDataType:withError:", &v72, &v71, v53, v55, v57);
  objc_storeStrong(v25 + 5, v71);
  if ((v26 & 1) == 0)
    goto LABEL_36;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("ApplicationSINFDataType")));
  objc_opt_class(NSNumber);
  v28 = sub_100013C00(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  if (v29 && (v30 = objc_msgSend(v29, "unsignedIntValue"), (_DWORD)v30 != v72))
  {
    v50 = v81;
    v70 = v81[5];
    v51 = objc_msgSend(v21, "setSinfDataType:withError:", v30, &v70);
    objc_storeStrong(v50 + 5, v70);
    if ((v51 & 1) == 0)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", CFSTR("Failed to set new Sinf data type to %u: %@"));
      goto LABEL_56;
    }
    v58 = 1;
  }
  else
  {
    v58 = 0;
  }
  v31 = v81;
  v69 = v81[5];
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "updateAndValidateSinf:error:", v59, &v69));
  objc_storeStrong(v31 + 5, v69);
  if (!v32)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", CFSTR("Sinf update failed: %@"));
    if (v58)
    {
      v68 = 0;
      v49 = objc_msgSend(v21, "setSinfDataType:withError:", v72, &v68);
      v39 = v68;
      if ((v49 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
        MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", CFSTR("Failed to revert Sinf data type to %u: %@"));
    }
    else
    {
      v39 = 0;
    }
    goto LABEL_55;
  }
  v33 = v81[5];
  v81[5] = 0;

  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v54 = (unint64_t)v32;
    MOLogWrite(qword_10009E048, 7, "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", CFSTR("UpdateSinf result: %@"));
  }
  sub_10004E89C(v61);
  v34 = sub_10000B610();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018BC8;
  block[3] = &unk_100084EF0;
  v66 = &v76;
  v36 = v61;
  v64 = v36;
  v37 = v32;
  v65 = v37;
  v67 = &v80;
  dispatch_sync(v35, block);

  if (!*((_BYTE *)v77 + 24))
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v54 = (unint64_t)v36;
      v56 = v81[5];
      MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", CFSTR("Failed to update Sinf in installation record for %@ : %@"));
    }

    sub_10004E780(v36);
    if (v58)
    {
      v62 = 0;
      v38 = objc_msgSend(v21, "setSinfDataType:withError:", v72, &v62);
      v39 = v62;
      if ((v38 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
      {
        v54 = v72;
        v56 = v39;
        MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", CFSTR("Failed to revert Sinf data type to %u: %@"));
      }
    }
    else
    {
      v39 = 0;
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundle", v54, v56));
    objc_msgSend(v52, "bestEffortRollbackSinfData:", v24);

    goto LABEL_55;
  }
LABEL_27:
  ((void (**)(id, id, id))v10)[2](v10, v37, v81[5]);

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);

}

- (void)updateiTunesMetadataForIXWithIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  void *v19;
  void *v20;
  id *v21;
  uint64_t v22;
  id *v23;
  unsigned int v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  _QWORD block[4];
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  id v52;
  id v53;
  id obj;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v8 = a3;
  v46 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v59 = 0;
  v60 = (id *)&v59;
  v61 = 0x3032000000;
  v62 = sub_1000136F8;
  v63 = sub_100013708;
  v64 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v10 = sub_100012A9C(self, CFSTR("UpdateiTunesMetadataForInstallCoordination"));
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v60[5];
  v60[5] = (id)v11;

  if (v60[5])
    goto LABEL_22;
  objc_opt_class(NSString);
  v13 = v8;
  if ((objc_opt_isKindOfClass(v13) & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  if (!v14)
  {
    v30 = sub_100010E50((uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", 1868, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Parameter validation failed: bundleIdentifier parameter was not a string"), v15, (uint64_t)v42);
    v31 = objc_claimAutoreleasedReturnValue(v30);
LABEL_21:
    v33 = v60[5];
    v60[5] = (id)v31;

LABEL_22:
    v29 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_23;
  }
  objc_opt_class(MIStoreMetadata);
  if ((objc_opt_isKindOfClass(v46) & 1) == 0)
  {
    v32 = sub_100010E50((uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", 1873, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Parameter validation failed: metadata parameter was not MIStoreMetadata instance"), v16, (uint64_t)v42);
    v31 = objc_claimAutoreleasedReturnValue(v32);
    goto LABEL_21;
  }
  v17 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v44 = v13;
    MOLogWrite(v17, 5, "-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", CFSTR("Update iTunesMetadata requested by client %@ for identifier %@"));

  }
  sub_10004E780(v13);
  v18 = v60;
  obj = v60[5];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v13, 0, 0, &obj));
  objc_storeStrong(v18 + 5, obj);
  if (!v19)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v29 = 0;
      MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", CFSTR("Failed to obtain app bundle container for %@: %@"));
      v20 = 0;
      v19 = 0;
LABEL_35:
      sub_10004E89C(v8);
      goto LABEL_23;
    }
    v20 = 0;
    v19 = 0;
LABEL_34:
    v29 = 0;
    goto LABEL_35;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "iTunesMetadataURL"));
  v21 = v60;
  v53 = v60[5];
  v22 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v20, 2, &v53));
  objc_storeStrong(v21 + 5, v53);
  if (v22)
    goto LABEL_12;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60[5], "domain"));
  if ((objc_msgSend(v34, "isEqualToString:", NSCocoaErrorDomain) & 1) == 0)
  {

LABEL_33:
    v36 = v60[5];
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path", v42, v44));
    v39 = sub_100010E50((uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", 1892, MIInstallerErrorDomain, 4, v36, 0, CFSTR("Failed to read iTunesMetadata from %@"), v38, (uint64_t)v37);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    v41 = v60[5];
    v60[5] = (id)v40;

    goto LABEL_34;
  }
  v35 = objc_msgSend(v60[5], "code");

  if (v35 != (id)260)
    goto LABEL_33;
LABEL_12:
  v23 = v60;
  v52 = v60[5];
  v24 = objc_msgSend(v19, "writeiTunesMetadata:error:", v46, &v52, v42, v44);
  objc_storeStrong(v23 + 5, v52);
  *((_BYTE *)v56 + 24) = v24;
  if (!v24)
  {
    v29 = (void *)v22;
    goto LABEL_35;
  }
  v25 = v60[5];
  v60[5] = 0;

  sub_10004E89C(v13);
  v26 = sub_10000B610();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000193E0;
  block[3] = &unk_100084EF0;
  v50 = &v55;
  v28 = v13;
  v48 = v28;
  v49 = v46;
  v51 = &v59;
  dispatch_sync(v27, block);

  if (!*((_BYTE *)v56 + 24))
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v43 = v28;
      v45 = (uint64_t)v60[5];
      MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", CFSTR("Failed to update iTunes Metadata in installation record for %@ : %@"));
    }
    objc_msgSend(v19, "bestEffortRollbackiTunesMetadata:error:", v22, 0, v43, v45);
  }
  v29 = (void *)v22;
LABEL_23:
  ((void (**)(id, id))v9)[2](v9, v60[5]);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

}

- (void)fetchDiskUsageForIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  id v16;
  id v17;
  __CFString *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  MIDiskUsageGatherer *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  v11 = sub_100012A9C(self, CFSTR("CopyDiskUsageForLaunchServices"));
  v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
    goto LABEL_11;
  objc_opt_class(NSArray);
  v13 = v8;
  if ((objc_opt_isKindOfClass(v13) & 1) == 0)
  {

LABEL_9:
    v18 = CFSTR("Identifers provided was not an array of strings");
    v19 = 1951;
LABEL_10:
    v20 = sub_100010E50((uint64_t)"-[MIClientConnection fetchDiskUsageForIdentifiers:withOptions:completion:]", v19, MIInstallerErrorDomain, 25, 0, 0, v18, v14, v24);
    v12 = (id)objc_claimAutoreleasedReturnValue(v20);
LABEL_11:
    v21 = 0;
    goto LABEL_12;
  }
  if (!v13)
    goto LABEL_9;
  objc_opt_class(NSString);
  v15 = sub_100011190(v13);

  if (!v15)
    goto LABEL_9;
  if (v9)
  {
    objc_opt_class(NSDictionary);
    v16 = v9;
    v17 = (objc_opt_isKindOfClass(v16) & 1) != 0 ? v16 : 0;

    if (!v17)
    {
      v18 = CFSTR("Options provided was not a dictionary");
      v19 = 1956;
      goto LABEL_10;
    }
  }
  v22 = qword_10009E048;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    MOLogWrite(v22, 7, "-[MIClientConnection fetchDiskUsageForIdentifiers:withOptions:completion:]", CFSTR("Fetch disk usage requested by %@ with options %@ for identifiers %@"));

  }
  v23 = -[MIDiskUsageGatherer initWithIdentifiers:options:]([MIDiskUsageGatherer alloc], "initWithIdentifiers:options:", v13, v9);
  v26 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskUsageGatherer gatherUsageInfoWithError:](v23, "gatherUsageInfoWithError:", &v26));
  v12 = v26;

LABEL_12:
  v10[2](v10, v21, v12);

}

- (void)registerSafeHarborAtPath:(id)a3 forIdentity:(id)a4 ofType:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id);
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  id v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  unint64_t v42;
  id v43;
  unsigned __int8 v44;
  id v45;
  id v46;
  id v47;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, id))a7;
  v16 = sub_100012A9C(self, CFSTR("RegisterSafeHarbor"));
  v17 = (id)objc_claimAutoreleasedReturnValue(v16);
  if (!v17)
  {
    objc_opt_class(NSString);
    v18 = v12;
    if ((objc_opt_isKindOfClass(v18) & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    if (!v19)
    {
      v28 = sub_100010E50((uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]", 1990, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Path parameter was not a string"), v20, (uint64_t)v39);
      v17 = (id)objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_2;
    }
    v47 = 0;
    v21 = +[MIAppIdentity validateAppIdentity:withError:](MIAppIdentity, "validateAppIdentity:withError:", v13, &v47);
    v22 = v47;
    v17 = v22;
    if (v21)
    {
      v46 = v22;
      v23 = objc_msgSend(v13, "resolvePersonaWithError:", &v46);
      v24 = v46;

      if (!v23)
      {
        v17 = v24;
        goto LABEL_2;
      }
      if (a5 - 15 <= 0xFFFFFFFFFFFFFFF1)
      {
        v26 = sub_100010E50((uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]", 2003, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Container type parameter did not correspond to a defined container content class."), v25, (uint64_t)v39);
        v27 = objc_claimAutoreleasedReturnValue(v26);
LABEL_11:
        v17 = (id)v27;

        goto LABEL_2;
      }
      if (v14)
      {
        objc_opt_class(NSDictionary);
        v29 = sub_100013C00(v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

        if (!v30)
        {
          v38 = sub_100010E50((uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]", 2008, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Options parameter was not a dictionary"), v31, (uint64_t)v39);
          v27 = objc_claimAutoreleasedReturnValue(v38);
          goto LABEL_11;
        }
      }
      v32 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v42 = a5;
        v43 = v14;
        v40 = v18;
        v41 = v13;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
        MOLogWrite(v32, 5, "-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]", CFSTR("Register safe harbor requested by client %@ for path %@, identity %@ of type %ld, with options %@"));

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MISafeHarborManager defaultManager](MISafeHarborManager, "defaultManager", v39, v40, v41, v42, v43));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v18));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "personaUniqueString"));
      v45 = v24;
      v44 = objc_msgSend(v33, "registerSafeHarborAtURL:withOptions:forIdentifier:forPersona:ofType:error:", v34, v14, v35, v36, a5, &v45);
      v37 = v33;
      v17 = v45;

      if ((v44 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
        MOLogWrite(qword_10009E048, 3, "-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]", CFSTR("Register Safe Harbor failed: %@"));
    }
  }
LABEL_2:
  v15[2](v15, v17);

}

- (void)removeSafeHarborForIdentity:(id)a3 ofType:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  id v14;
  unsigned int v15;
  id v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  void *v31;
  id v32;
  unint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  v13 = sub_100012A9C(self, CFSTR("RemoveSafeHarbor"));
  v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  if (!v14)
  {
    v37 = 0;
    v15 = +[MIAppIdentity validateAppIdentity:withError:](MIAppIdentity, "validateAppIdentity:withError:", v10, &v37);
    v16 = v37;
    v14 = v16;
    if (v15)
    {
      v36 = v16;
      v17 = objc_msgSend(v10, "resolvePersonaWithError:", &v36);
      v18 = v36;

      if (!v17)
      {
        v14 = v18;
        goto LABEL_20;
      }
      if (a4 - 15 <= 0xFFFFFFFFFFFFFFF1)
      {
        v20 = sub_100010E50((uint64_t)"-[MIClientConnection removeSafeHarborForIdentity:ofType:withOptions:completion:]", 2053, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Container type parameter did not correspond to a defined container content class."), v19, (uint64_t)v31);
        v21 = objc_claimAutoreleasedReturnValue(v20);
LABEL_6:
        v14 = (id)v21;

        goto LABEL_20;
      }
      if (v11)
      {
        objc_opt_class(NSDictionary);
        v22 = v11;
        v23 = (objc_opt_isKindOfClass(v22) & 1) != 0 ? v22 : 0;

        if (!v23)
        {
          v30 = sub_100010E50((uint64_t)"-[MIClientConnection removeSafeHarborForIdentity:ofType:withOptions:completion:]", 2058, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Options parameter was not a dictionary"), v24, (uint64_t)v31);
          v21 = objc_claimAutoreleasedReturnValue(v30);
          goto LABEL_6;
        }
      }
      v25 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v33 = a4;
        v34 = v11;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
        v32 = v10;
        MOLogWrite(v25, 5, "-[MIClientConnection removeSafeHarborForIdentity:ofType:withOptions:completion:]", CFSTR("Remove safe harbor requested by client %@ for identity %@ of type %ld with options %@"));

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MISafeHarborManager defaultManager](MISafeHarborManager, "defaultManager", v31, v32, v33, v34));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaUniqueString"));
      v35 = v18;
      v29 = objc_msgSend(v26, "removeSafeHarborWithIdentifier:forPersona:ofType:options:error:", v27, v28, a4, v11, &v35);
      v14 = v35;

      if ((v29 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
        MOLogWrite(qword_10009E048, 3, "-[MIClientConnection removeSafeHarborForIdentity:ofType:withOptions:completion:]", CFSTR("Remove Safe Harbor failed: %@"));
    }
  }
LABEL_20:
  v12[2](v12, v14);

}

- (void)listSafeHarborsOfType:(unint64_t)a3 forPersona:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  unint64_t v27;
  id v28;
  id v29;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, void *))a6;
  v13 = sub_100012A9C(self, CFSTR("CopySafeHarbors"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v15)
    goto LABEL_2;
  if (v11)
  {
    objc_opt_class(NSDictionary);
    v17 = v11;
    v18 = (objc_opt_isKindOfClass(v17) & 1) != 0 ? v17 : 0;

    if (!v18)
    {
      v19 = CFSTR("Options parameter was not a dictionary");
      v20 = 2096;
      goto LABEL_16;
    }
  }
  if (a3 - 15 <= 0xFFFFFFFFFFFFFFF1)
  {
    v19 = CFSTR("Container type parameter did not correspond to a defined container content class.");
    v20 = 2101;
LABEL_16:
    v16 = 0;
    v25 = sub_100010E50((uint64_t)"-[MIClientConnection listSafeHarborsOfType:forPersona:withOptions:completion:]", v20, MIInstallerErrorDomain, 25, 0, 0, v19, v14, (uint64_t)v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v25);
    goto LABEL_17;
  }
  v21 = qword_10009E048;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v27 = a3;
    v28 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    MOLogWrite(v21, 7, "-[MIClientConnection listSafeHarborsOfType:forPersona:withOptions:completion:]", CFSTR("List safe harbor requested by client %@ for type %ld with options %@"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MISafeHarborManager defaultManager](MISafeHarborManager, "defaultManager", v26, v27, v28));
  v29 = 0;
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "safeHarborListForType:forPersona:withError:", a3, v10, &v29));
  v24 = v29;

  if (v23)
  {
    v15 = v24;
    v16 = (void *)v23;
    goto LABEL_17;
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection listSafeHarborsOfType:forPersona:withOptions:completion:]", CFSTR("CopySafeHarbors failed: %@"));
  v15 = v24;
LABEL_2:
  v16 = 0;
LABEL_17:
  v12[2](v12, v16, v15);

}

- (void)checkCapabilities:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id, void *);
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, id, void *))a5;
  if (v8)
  {
    objc_opt_class(NSDictionary);
    v10 = v8;
    v11 = (objc_opt_isKindOfClass(v10) & 1) != 0 ? v10 : 0;

    if (!v11)
    {
      v19 = sub_100010E50((uint64_t)"-[MIClientConnection checkCapabilities:withOptions:completion:]", 2140, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Options parameter was not a dictionary"), v12, v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v19);
      goto LABEL_19;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MICapabilitiesManager defaultManager](MICapabilitiesManager, "defaultManager"));
  v21 = 0;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "checkCapabilities:withOptions:error:", v7, v8, &v21));
  v15 = v21;

  if (v14)
  {
    v16 = v15;
LABEL_8:
    v11 = (id)v14;
    goto LABEL_19;
  }
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
    if ((objc_msgSend(v17, "isEqualToString:", MIInstallerErrorDomain) & 1) != 0)
    {
      v18 = objc_msgSend(v15, "code") == (id)66;

      if (v18)
      {
        v22[0] = CFSTR("CapabilitiesMatch");
        v22[1] = CFSTR("MismatchedCapabilities");
        v23[0] = &__kCFBooleanFalse;
        v23[1] = &off_10008F640;
        v14 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));

        v16 = 0;
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection checkCapabilities:withOptions:completion:]", CFSTR("SPI failed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MIInstallerErrorDomain, 1, &off_10008F668));

  v11 = 0;
LABEL_19:
  v9[2](v9, v11, v16);

}

- (void)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failureReason:(unint64_t)a5 underlyingError:(id)a6 failureSource:(unint64_t)a7 completion:(id)a8
{
  id v13;
  void (**v14)(id, _QWORD);
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id *v28;
  id *v29;
  id *v30;
  unsigned int v31;
  void *v32;
  NSNumber *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  unint64_t v46;
  id v48;
  id v49;
  _QWORD block[4];
  id v51;
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  id v58;
  id obj;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  id *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;

  v13 = a3;
  v48 = a6;
  v14 = (void (**)(id, _QWORD))a8;
  v64 = 0;
  v65 = (id *)&v64;
  v66 = 0x3032000000;
  v67 = sub_1000136F8;
  v68 = sub_100013708;
  v69 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v15 = sub_100012A9C(self, CFSTR("UpdatePlaceholderMetadata"));
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v65[5];
  v65[5] = (id)v16;

  if (v65[5])
    goto LABEL_2;
  objc_opt_class(NSString);
  v24 = v13;
  if ((objc_opt_isKindOfClass(v24) & 1) != 0)
    v25 = v24;
  else
    v25 = 0;

  if (!v25)
  {
    v38 = sub_100010E50((uint64_t)"-[MIClientConnection updatePlaceholderMetadataForApp:installType:failureReason:underlyingError:failureSource:completion:]", 2188, MIInstallerErrorDomain, 25, 0, 0, CFSTR("bundleID parameter was not a string"), v26, (uint64_t)v41);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    v40 = v65[5];
    v65[5] = (id)v39;

LABEL_2:
    v18 = 0;
    v19 = 0;
    v20 = 0;
LABEL_3:
    v21 = 0;
    goto LABEL_4;
  }
  v27 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v45 = v48;
    v46 = a7;
    v43 = a4;
    v44 = a5;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v42 = v24;
    MOLogWrite(v27, 5, "-[MIClientConnection updatePlaceholderMetadataForApp:installType:failureReason:underlyingError:failureSource:completion:]", CFSTR("Update placeholder metadata requested by client %@ for app %@ installType = %lu failureReason = %lu underlyingError = %@ failureSource = %lu"));

  }
  sub_10004E780(v24);
  v28 = v65;
  obj = v65[5];
  v21 = 1;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v24, 0, 0, &obj));
  objc_storeStrong(v28 + 5, obj);
  if (!v20)
  {
    v18 = 0;
    goto LABEL_32;
  }
  v29 = v65;
  v58 = v65[5];
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleMetadataWithError:", &v58));
  objc_storeStrong(v29 + 5, v58);
  if (!v18)
  {
LABEL_32:
    v19 = 0;
    goto LABEL_4;
  }
  v19 = objc_msgSend(v18, "copy");
  objc_msgSend(v19, "setPlaceholderFailureReason:", a5);
  objc_msgSend(v19, "setPlaceholderFailureUnderlyingError:", v48);
  objc_msgSend(v19, "setPlaceholderFailureUnderlyingErrorSource:", a7);
  if (a4)
    objc_msgSend(v19, "setInstallType:", a4);
  v30 = v65;
  v57 = v65[5];
  v31 = objc_msgSend(v20, "saveBundleMetadata:withError:", v19, &v57, v41, v42, v43, v44, v45, v46);
  objc_storeStrong(v30 + 5, v57);
  if (v31)
  {
    sub_10004E89C(v24);
    v32 = (void *)objc_opt_new(LSOperationRequestContext);
    v33 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_10000B4F8());
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v32, "setTargetUserID:", v34);

    v35 = sub_10000B610();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AC44;
    block[3] = &unk_100085330;
    v53 = &v60;
    v51 = v24;
    v52 = v32;
    v55 = a4;
    v56 = a5;
    v54 = &v64;
    v37 = v32;
    dispatch_sync(v36, block);

    if (*((_BYTE *)v61 + 24) || qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_3;
    v21 = 0;
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updatePlaceholderMetadataForApp:installType:failureReason:underlyingError:failureSource:completion:]", CFSTR("Failed to update placeholder metadata for %@ : %@"));
  }
LABEL_4:

  if (*((_BYTE *)v61 + 24))
  {
    if (!v21)
      goto LABEL_13;
    goto LABEL_12;
  }
  v49 = 0;
  v22 = objc_msgSend(v20, "saveBundleMetadata:withError:", v18, &v49);
  v23 = v49;
  if ((v22 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection updatePlaceholderMetadataForApp:installType:failureReason:underlyingError:failureSource:completion:]", CFSTR("Failed to rollback bundle metadata for %@ : %@"));

  if (v21)
LABEL_12:
    sub_10004E89C(v13);
LABEL_13:
  ((void (**)(id, id))v14)[2](v14, v65[5]);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

}

- (void)getAppMetadataForApp:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unsigned __int8 v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = sub_100012A9C(self, CFSTR("GetAppMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    objc_opt_class(NSString);
    v11 = v6;
    if ((objc_opt_isKindOfClass(v11) & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (!v12)
    {
      v26 = sub_100010E50((uint64_t)"-[MIClientConnection getAppMetadataForApp:completion:]", 2282, MIInstallerErrorDomain, 25, 0, 0, CFSTR("bundleID parameter was not a string"), v13, (uint64_t)v31);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v10 = 0;
      goto LABEL_36;
    }
    v14 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      v32 = v11;
      MOLogWrite(v14, 5, "-[MIClientConnection getAppMetadataForApp:completion:]", CFSTR("Get app metadata requested by client %@ for app %@"));

    }
    sub_10004E778(v11);
    v37 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v11, 0, 0, &v37));
    v16 = v37;
    v17 = v16;
    if (!v15)
    {
      v10 = 0;
LABEL_35:

      v9 = v17;
      sub_10004E89C(v6);
      goto LABEL_36;
    }
    v36 = v16;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleMetadataWithError:", &v36));
    v18 = v36;

    if (!v10
      || (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "watchKitAppExecutableHash")),
          v19,
          v19))
    {
LABEL_34:
      v17 = v18;
      goto LABEL_35;
    }
    sub_10004E89C(v11);
    sub_10004E780(v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundle"));
    v35 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "watchKitAppExecutableHashWithError:", &v35));
    v22 = v35;

    if (v21)
    {
      objc_msgSend(v10, "setWatchKitAppExecutableHash:", v21);
      v34 = v22;
      v23 = objc_msgSend(v15, "saveBundleMetadata:withError:", v10, &v34);
      v18 = v34;

      if ((v23 & 1) != 0)
        goto LABEL_33;
      v24 = qword_10009E048;
      if (qword_10009E048)
      {
        if (*(int *)(qword_10009E048 + 44) < 3)
          goto LABEL_33;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundle", v31, v32));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
      MOLogWrite(v24, 3, "-[MIClientConnection getAppMetadataForApp:completion:]", CFSTR("Failed to save bundle metadata for %@. Error: %@"));
      goto LABEL_30;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "domain"));
    v27 = MIInstallerErrorDomain;
    if (objc_msgSend(v33, "isEqualToString:", MIInstallerErrorDomain)
      && objc_msgSend(v22, "code") == (id)85)
    {
      v18 = v22;
LABEL_31:

LABEL_33:
      goto LABEL_34;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "domain", v31, v32));
    if ((objc_msgSend(v28, "isEqualToString:", v27) & 1) != 0)
    {
      v29 = objc_msgSend(v22, "code");

      if (v29 == (id)139)
        goto LABEL_32;
    }
    else
    {

    }
    v30 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
      v18 = v22;
      MOLogWrite(v30, 3, "-[MIClientConnection getAppMetadataForApp:completion:]", CFSTR("Failed to calculate hash on watchkit app executable for %@. Error: %@"));
LABEL_30:

      goto LABEL_31;
    }
LABEL_32:
    v18 = v22;
    goto LABEL_33;
  }
  v10 = 0;
LABEL_36:
  v7[2](v7, v10, v9);

}

- (void)snapshotWKAppInCompanionAppID:(id)a3 toURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, void *);
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  __CFString *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  MIWatchKitAppSnapshot *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, void *))a6;
  v14 = sub_100012A9C(self, CFSTR("SnapshotWKApp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15)
    goto LABEL_28;
  objc_opt_class(NSString);
  v16 = v10;
  if ((objc_opt_isKindOfClass(v16) & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  if (!v17)
  {
    v21 = CFSTR("bundleID parameter was not a string");
    v22 = 2404;
LABEL_27:
    v35 = sub_100010E50((uint64_t)"-[MIClientConnection snapshotWKAppInCompanionAppID:toURL:options:completion:]", v22, MIInstallerErrorDomain, 25, 0, 0, v21, v18, v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v35);
LABEL_28:
    v34 = 0;
    v32 = 0;
    v29 = 0;
    goto LABEL_29;
  }
  objc_opt_class(NSURL);
  v19 = v11;
  if ((objc_opt_isKindOfClass(v19) & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  if (!v20)
  {
    v21 = CFSTR("destURL parameter was not a URL");
    v22 = 2409;
    goto LABEL_27;
  }
  if (v12)
  {
    objc_opt_class(NSDictionary);
    v23 = v12;
    v24 = (objc_opt_isKindOfClass(v23) & 1) != 0 ? v23 : 0;

    if (!v24)
    {
      v21 = CFSTR("Options parameter was not a dictionary");
      v22 = 2414;
      goto LABEL_27;
    }
  }
  v25 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));
    v39 = v12;
    v36 = (uint64_t)v16;
    v37 = v26;
    MOLogWrite(v25, 5, "-[MIClientConnection snapshotWKAppInCompanionAppID:toURL:options:completion:]", CFSTR("Snapshot requested for %@ by %@ to %@ with options %@"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMIWatchKitSnapshotOptionMaxWKAppVersion, v36, v37, v38, v39));
  objc_opt_class(NSString);
  v28 = v27;
  if ((objc_opt_isKindOfClass(v28) & 1) != 0)
    v29 = v28;
  else
    v29 = 0;

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kMIWatchKitSnapshotOptionCreatePlaceholder));
  v31 = sub_10001113C(v30, 0);

  v32 = -[MIWatchKitAppSnapshot initWithBundleID:snapshotTo:onlyV1AppIfPresent:placeholderOnly:]([MIWatchKitAppSnapshot alloc], "initWithBundleID:snapshotTo:onlyV1AppIfPresent:placeholderOnly:", v16, v19, objc_msgSend(v29, "isEqualToString:", CFSTR("1.0")), v31);
  v40 = 0;
  LODWORD(v31) = -[MIWatchKitAppSnapshot createSnapshotWithError:](v32, "createSnapshotWithError:", &v40);
  v33 = v40;
  v15 = v33;
  if ((_DWORD)v31)
  {

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIWatchKitAppSnapshot resultDict](v32, "resultDict"));
    v15 = 0;
  }
  else
  {
    v34 = 0;
  }
LABEL_29:

  v13[2](v13, v34, v15);
}

- (void)setSystemAppMigrationComplete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  v4 = sub_100012A9C(self, CFSTR("SetSystemAppMigrationComplete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    v6 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v6, 5, "-[MIClientConnection setSystemAppMigrationComplete:]", CFSTR("Set SystemAppMigrator complete requested by client %@"));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppMigrationState defaultManager](MISystemAppMigrationState, "defaultManager", v8));
    objc_msgSend(v7, "setSystemAppMigrationComplete:", 1);

    v5 = 0;
  }
  v9[2](v9, v5);

}

- (void)waitForSystemAppMigratorToComplete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**exc_buf)(id, void *);

  exc_buf = (void (**)(id, void *))a3;
  v4 = sub_100012A9C(self, CFSTR("WaitForSystemAppMigrationToComplete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    exc_buf[2](exc_buf, v5);
  }
  else
  {
    v6 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v6, 5, "-[MIClientConnection waitForSystemAppMigratorToComplete:]", CFSTR("SystemAppMigration finished callback registered by client %@"));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppMigrationState defaultManager](MISystemAppMigrationState, "defaultManager", v8));
    objc_msgSend(v7, "waitForSystemAppMigrationToComplete:", exc_buf);

    v5 = 0;
  }

}

- (void)systemAppMigratorHasCompleted:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, id, void *);

  v10 = (void (**)(id, id, void *))a3;
  v4 = sub_100012A9C(self, CFSTR("GetSystemAppMigrationStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v7, 5, "-[MIClientConnection systemAppMigratorHasCompleted:]", CFSTR("Get SystemAppMigrator complete requested by client %@"));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppMigrationState defaultManager](MISystemAppMigrationState, "defaultManager", v9));
    v6 = objc_msgSend(v8, "systemAppMigrationComplete");

    v5 = 0;
  }
  v10[2](v10, v6, v5);

}

- (void)finalizeReference:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id *v17;
  unsigned int v18;
  id v19;
  id *v20;
  uint64_t v21;
  id *v22;
  unsigned int v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unsigned int v37;
  id *location;
  id *locationa;
  NSObject *locationb;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id obj;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  id *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v60 = 0;
  v61 = (id *)&v60;
  v62 = 0x3032000000;
  v63 = sub_1000136F8;
  v64 = sub_100013708;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_1000136F8;
  v58 = sub_100013708;
  v59 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
  v10 = sub_100012A9C(self, CFSTR("InstallForInstallCoordination"));
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v61[5];
  v61[5] = (id)v11;

  if (v61[5])
    goto LABEL_2;
  if ((+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    v31 = sub_100010E50((uint64_t)"-[MIClientConnection finalizeReference:completion:]", 2553, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v16, (uint64_t)"-[MIClientConnection finalizeReference:completion:]");
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v30 = v61[5];
    v61[5] = (id)v32;
LABEL_16:

    goto LABEL_21;
  }
  v17 = v61;
  obj = v61[5];
  v18 = +[MIAppReference validateAppReference:withError:](MIAppReference, "validateAppReference:withError:", v6, &obj);
  objc_storeStrong(v17 + 5, obj);
  if (!v18)
  {
LABEL_2:
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_21;
  }
  sub_10004E778(v9);
  v19 = objc_msgSend(v6, "domain");
  v20 = v61;
  v52 = v61[5];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v9, v19, &v52));
  objc_storeStrong(v20 + 5, v52);
  if (!v14)
    goto LABEL_18;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundle"));
  if (!v13)
  {
    v33 = sub_100010E50((uint64_t)"-[MIClientConnection finalizeReference:completion:]", 2571, MIInstallerErrorDomain, 36, 0, 0, CFSTR("Failed to find bundle in bundle container %@ for %@"), v21, (uint64_t)v14);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = v61[5];
    v61[5] = (id)v34;

LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v22 = v61;
  v51 = v61[5];
  v23 = objc_msgSend(v8, "resolvePersonaWithError:", &v51);
  objc_storeStrong(v22 + 5, v51);
  if (!v23)
  {
LABEL_19:
    v28 = 0;
    v25 = 0;
    goto LABEL_20;
  }
  location = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personaUniqueString"));
  v24 = v61;
  v50 = v61[5];
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:](MILaunchServicesDatabaseGatherer, "fetchInfoForBundle:forPersona:inContainer:withError:", v13, location, v14, &v50));
  objc_storeStrong(v24 + 5, v50);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager"));
    locationa = v61 + 5;
    v48 = v61[5];
    v49 = 0;
    v37 = objc_msgSend(v26, "finalizeTemporaryReference:resultingPersonaUniqueStrings:error:", v6, &v49, &v48);
    v27 = v26;
    v28 = v49;
    objc_storeStrong(locationa, v48);

    if (v37)
    {
      sub_10004E89C(v9);
      v29 = sub_10000B610();
      locationb = objc_claimAutoreleasedReturnValue(v29);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001C210;
      block[3] = &unk_100085358;
      v46 = &v54;
      v15 = v25;
      v42 = v15;
      v43 = v9;
      v30 = v28;
      v44 = v30;
      v45 = v6;
      v47 = &v60;
      dispatch_sync(locationb, block);

      if (!v55[5] && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
        MOLogWrite(qword_10009E048, 3, "-[MIClientConnection finalizeReference:completion:]", CFSTR("Failed to register installation record for %@ : %@"));

      goto LABEL_16;
    }
  }
  else
  {
    v28 = 0;
  }
LABEL_20:

  v15 = v25;
  sub_10004E89C(v9);
LABEL_21:
  v36 = v55[5];
  if (v36)
    v7[2](v7, v36, 0);
  else
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v61[5]);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

}

- (void)acquireReferenceforInstalledAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 matchingInstallSessionID:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, id);
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  id v19;
  void *v20;
  const void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  void *v26;
  id v27;
  unint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58[2];
  id v59;
  id v60;
  id v61;

  v10 = a3;
  v56 = a5;
  v11 = (void (**)(id, _QWORD, id))a6;
  v12 = sub_100012A9C(self, CFSTR("InstallForInstallCoordination"));
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
LABEL_31:
    v11[2](v11, 0, v13);
    v44 = 0;
    goto LABEL_32;
  }
  if ((+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    v43 = sub_100010E50((uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]", 2642, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v17, (uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]");
    v13 = (id)objc_claimAutoreleasedReturnValue(v43);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_31;
  }
  v61 = 0;
  v18 = +[MIAppIdentity validateAppIdentity:withError:](MIAppIdentity, "validateAppIdentity:withError:", v10, &v61);
  v19 = v61;
  v20 = v19;
  if (!v18)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v13 = v19;
    goto LABEL_31;
  }
  v21 = (const void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
  sub_10004E778(v21);
  v60 = v20;
  v22 = objc_msgSend(v10, "resolvePersonaWithError:", &v60);
  v55 = (void *)v21;
  v13 = v60;

  if (!v22)
  {
    v44 = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
    goto LABEL_27;
  }
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
  if (a4 == 3)
    v24 = 2;
  else
    v24 = 3;
  v59 = v13;
  v25 = -[MIClientConnection _validateAppWithBundleID:isNotInstalledInDomain:error:](self, "_validateAppWithBundleID:isNotInstalledInDomain:error:", v23, v24, &v59);
  v26 = (void *)v23;
  v27 = v59;

  if ((v25 & 1) == 0)
  {
    v44 = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v13 = v27;
    goto LABEL_27;
  }
  if (a4 == 1)
    v28 = 2;
  else
    v28 = a4;
  v58[1] = v27;
  v53 = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v21));
  v30 = v27;

  if (v29)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundle"));
    v58[0] = v30;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "installationIdentitySettingIfNotSet:withError:", 0, v58));
    v54 = v29;
    v34 = v58[0];

    if (v33)
    {
      v51 = v34;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "installSessionID"));
      v36 = v33;
      if ((objc_msgSend(v14, "isEqualToData:", v56) & 1) == 0)
      {
        v50 = sub_100010E50((uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]", 2685, MIInstallerErrorDomain, 184, 0, 0, CFSTR("Installation session IDs did not match for %@"), v35, (uint64_t)v10);
        v40 = (id)objc_claimAutoreleasedReturnValue(v50);
        v45 = 0;
        v30 = v51;
        goto LABEL_25;
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
      v57 = v34;
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "addTemporaryReferenceForIdentity:inDomain:forUserWithID:error:", v10, v53, objc_msgSend(v37, "effectiveUserIdentifier"), &v57));
      v39 = v37;
      v40 = v57;

      v41 = v39;
      v42 = v38;
    }
    else
    {
      v41 = v34;
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundle"));
      v42 = 0;
      v49 = sub_100010E50((uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]", 2679, MIInstallerErrorDomain, 4, v34, 0, CFSTR("Failed to fetch installation identity for %@"), v48, (uint64_t)v52);
      v40 = (id)objc_claimAutoreleasedReturnValue(v49);
      v36 = 0;
      v14 = 0;
    }

    v30 = v52;
    v45 = (void *)v42;
LABEL_25:
    v47 = v54;
    goto LABEL_26;
  }
  v45 = 0;
  v46 = sub_100010E50((uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]", 2672, MIInstallerErrorDomain, 26, v30, 0, CFSTR("Could not find installed app with identity %@ in domain %lu"), v31, (uint64_t)v10);
  v40 = (id)objc_claimAutoreleasedReturnValue(v46);
  v47 = 0;
  v36 = 0;
  v14 = 0;
LABEL_26:

  v13 = v40;
  v44 = v45;
  v16 = v47;
  v15 = v36;
LABEL_27:
  if (v55)
  {
    sub_10004E89C(v55);

  }
  if (!v44)
    goto LABEL_31;
  ((void (**)(id, void *, id))v11)[2](v11, v44, 0);
LABEL_32:

}

- (void)invalidateReference:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = sub_100012A9C(self, CFSTR("InstallForInstallCoordination"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (v9)
    goto LABEL_6;
  if ((+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    v16 = sub_100010E50((uint64_t)"-[MIClientConnection invalidateReference:completion:]", 2725, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v10, (uint64_t)"-[MIClientConnection invalidateReference:completion:]");
    v9 = objc_claimAutoreleasedReturnValue(v16);
LABEL_6:
    v15 = (void *)v9;
    v7[2](v7, v9);
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identity"));
  v18 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstaller uninstallerForIdentities:withOptions:forClient:](MIUninstaller, "uninstallerForIdentities:withOptions:forClient:", v12, 0, self));

  v17 = 0;
  LODWORD(v12) = objc_msgSend(v13, "performUninstallationByRevokingTemporaryReference:error:", v6, &v17);
  v14 = v17;
  v15 = v14;
  if ((_DWORD)v12)
  {

    v15 = 0;
  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection invalidateReference:completion:]", CFSTR("Failed to uninstall %@ : %@"));
  }
  v7[2](v7, (uint64_t)v15);

LABEL_7:
}

- (void)referencesForBundleWithIdentifier:(id)a3 inDomain:(unint64_t)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, id);
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a5;
  if ((+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    v13 = sub_100010E50((uint64_t)"-[MIClientConnection referencesForBundleWithIdentifier:inDomain:completion:]", 2746, MIInstallerErrorDomain, 161, 0, 0, CFSTR("%s is not enabled"), v9, (uint64_t)"-[MIClientConnection referencesForBundleWithIdentifier:inDomain:completion:]");
    v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager"));
  v14 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "referencesForIdentifier:inDomain:error:", v7, a4, &v14));
  v12 = v14;

  if (!v11)
  {
LABEL_5:
    v8[2](v8, 0, v12);
    goto LABEL_6;
  }
  ((void (**)(id, void *, id))v8)[2](v8, v11, 0);

LABEL_6:
}

- (void)linkedBundleIDsForAppIdentity:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  uint64_t v8;
  const void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  if ((sub_100013C48(self) & 1) != 0)
  {
    v9 = (const void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
    sub_10004E780(v9);
    v22 = 0;
    v10 = objc_msgSend(v6, "resolvePersonaWithError:", &v22);
    v11 = v22;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", 2));
      v21 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "childrenForParentBundleID:error:", v9, &v21));
      v14 = v21;

      if (v13)
      {
        v11 = v14;
      }
      else
      {
        v18 = sub_100010E50((uint64_t)"-[MIClientConnection linkedBundleIDsForAppIdentity:withCompletion:]", 2857, MIInstallerErrorDomain, 4, v14, 0, CFSTR("Failed to query linked children for %@"), v15, (uint64_t)v6);
        v19 = objc_claimAutoreleasedReturnValue(v18);

        v13 = 0;
        v11 = (id)v19;
      }
    }
    else
    {
      v13 = 0;
    }
    v16 = (void *)v9;
    sub_10004E89C(v9);
  }
  else
  {
    v16 = 0;
    v17 = sub_100010E50((uint64_t)"-[MIClientConnection linkedBundleIDsForAppIdentity:withCompletion:]", 2843, MIInstallerErrorDomain, 2, 0, &off_10008F690, &stru_100086E88, v8, v20);
    v11 = (id)objc_claimAutoreleasedReturnValue(v17);
    v13 = 0;
  }
  v7[2](v7, v13, v11);

}

- (void)getPidForTestingWithCompletion:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = getpid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);

}

- (void)dieForTesting
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = sub_100012A9C(self, CFSTR("UnitTestRunner"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v5 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v5, 5, "-[MIClientConnection dieForTesting]", CFSTR("Unit test client %@ requested that installd exit. Exiting."));

    }
    exit(1);
  }

}

- (void)raiseExceptionWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a3;
  v4 = sub_100012A9C(self, CFSTR("UnitTestRunner"));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    v7 = objc_alloc((Class)NSException);
    objc_exception_throw(objc_retainAutorelease(objc_msgSend(v7, "initWithName:reason:userInfo:", NSGenericException, MITestExceptionReasonString, 0)));
  }
  v6 = (void *)v5;
  v8[2](v8, v5);

}

- (void)setTestModeWithCompletion:(id)a3
{
  void (**v4)(id, id);
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v4 = (void (**)(id, id))a3;
  v5 = sub_100012A9C(self, CFSTR("UnitTestRunner"));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
    v10 = 0;
    v9 = objc_msgSend(v7, "setIsRunningInTestModeForProcessWithPID:withError:", objc_msgSend(v8, "processIdentifier"), &v10);
    v6 = v10;

    if (v9)
    {

      v6 = 0;
    }
  }
  v4[2](v4, v6);

}

- (void)endTestModeWithCompletion:(id)a3
{
  void (**v4)(id, id);
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v4 = (void (**)(id, id))a3;
  v5 = sub_100012A9C(self, CFSTR("UnitTestRunner"));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
    v10 = 0;
    v9 = objc_msgSend(v7, "clearIsRunningInTestModeForProcessWithPID:withError:", objc_msgSend(v8, "processIdentifier"), &v10);
    v6 = v10;

    if (v9)
    {

      v6 = 0;
    }
  }
  v4[2](v4, v6);

}

- (void)getTestModeWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  unsigned __int8 v10;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v5 = sub_100012A9C(self, CFSTR("UnitTestRunner"));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
    v9 = 0;
    v8 = objc_msgSend(v7, "isRunningInTestMode:outError:", &v10, &v9);
    v6 = v9;

    if (v8)
    {

      v6 = 0;
    }
  }
  v4[2](v4, v10, v6);

}

- (void)setTestFlags:(unint64_t)a3 withCompletion:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  id v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  char v15;

  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
  v8 = sub_100012A9C(self, CFSTR("UnitTestRunner"));
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    v15 = 0;
    v14 = 0;
    v10 = objc_msgSend(v7, "isRunningInTestMode:outError:", &v15, &v14);
    v9 = v14;
    if (v10)
    {
      if (v15)
      {
        objc_msgSend(v7, "setTestFlags:", a3);
      }
      else
      {
        v12 = sub_100010E50((uint64_t)"-[MIClientConnection setTestFlags:withCompletion:]", 2977, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Can't set test flags because installd is not in test mode."), v11, (uint64_t)v14);
        v13 = objc_claimAutoreleasedReturnValue(v12);

        v9 = (id)v13;
      }
    }
  }
  v6[2](v6, v9);

}

- (void)clearTestFlags:(unint64_t)a3 withCompletion:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  id v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  char v15;

  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
  v8 = sub_100012A9C(self, CFSTR("UnitTestRunner"));
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    v15 = 0;
    v14 = 0;
    v10 = objc_msgSend(v7, "isRunningInTestMode:outError:", &v15, &v14);
    v9 = v14;
    if (v10)
    {
      if (v15)
      {
        objc_msgSend(v7, "clearTestFlags:", a3);
      }
      else
      {
        v12 = sub_100010E50((uint64_t)"-[MIClientConnection clearTestFlags:withCompletion:]", 3006, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Can't clear test flags because installd is not in test mode."), v11, (uint64_t)v14);
        v13 = objc_claimAutoreleasedReturnValue(v12);

        v9 = (id)v13;
      }
    }
  }
  v6[2](v6, v9);

}

- (void)setEligibilityTestOverrides:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = sub_100012A9C(self, CFSTR("UnitTestRunner"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    v9 = objc_opt_class(NSNumber);
    v10 = objc_opt_class(NSNumber);
    if ((sub_1000113E0(v15, v9, v10) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIEligibilityManager sharedInstance](MIEligibilityManager, "sharedInstance"));
      objc_msgSend(v12, "setTestOverrides:", v15);

      v8 = 0;
    }
    else
    {
      v13 = sub_100010E50((uint64_t)"-[MIClientConnection setEligibilityTestOverrides:withCompletion:]", 3028, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Supplied dictionary had non-number keys or values."), v11, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    }
  }
  v6[2](v6, v8);

}

- (void)_triggerRegistrationForContent:(unint64_t)a3 registrationOptions:(id)a4 writeLock:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MIReferenceAwareLSDatabaseGatherer *v22;
  id *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  _QWORD v29[5];
  int v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v7 = a5;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1000136F8;
  v36 = sub_100013708;
  v37 = 0;
  v11 = objc_msgSend(v9, "targetUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
  v31 = 0;
  v13 = objc_msgSend(v12, "isRunningInTestMode:outError:", &v31, 0);
  if (v31)
    v14 = v13;
  else
    v14 = 0;
  if (v14 == 1)
  {
    if (objc_msgSend(v12, "testFlagsAreSet:", 2))
    {
      v16 = sub_100010E50((uint64_t)"-[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:]", 3056, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Triggering registration with test mode enabled"), v15, v27);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)v33[5];
      v33[5] = v17;

LABEL_18:
      v10[2](v10, v33[5]);
      goto LABEL_19;
    }
    if (objc_msgSend(v12, "testFlagsAreSet:", 16))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "testFileSentinelForSyncURL"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
      objc_msgSend(v21, "removeItemAtURL:error:", v20, 0);

    }
  }
  if (v7)
    sub_10004EE54();
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    MOLogWrite(qword_10009E048, 5, "-[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:]", CFSTR("Received request to trigger registration of %lu content for %u"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001DA98;
  v29[3] = &unk_100085380;
  v30 = (int)v11;
  v29[4] = &v32;
  v22 = -[MIReferenceAwareLSDatabaseGatherer initWithOptions:forTargetUID:enumerator:]([MIReferenceAwareLSDatabaseGatherer alloc], "initWithOptions:forTargetUID:enumerator:", a3, v11, v29);
  v23 = (id *)(v33 + 5);
  obj = (id)v33[5];
  v24 = -[MIReferenceAwareLSDatabaseGatherer performGatherWithError:](v22, "performGatherWithError:", &obj);
  objc_storeStrong(v23, obj);

  if (v7)
    sub_10004EE5C(v25, v26);
  if (!v24)
    goto LABEL_18;
  v10[2](v10, 0);
LABEL_19:
  _Block_object_dispose(&v32, 8);

}

- (void)triggerRegistrationForContainerizedContentForOptions:(id)a3 withCompletion:(id)a4
{
  -[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:](self, "_triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:", 4, a3, 1, a4);
}

- (void)triggerRegistrationForDiskImageContentForOptions:(id)a3 withCompletion:(id)a4
{
  -[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:](self, "_triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:", 16, a3, 0, a4);
}

- (void)createSerializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 withCompletion:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  void (**v14)(id, id);
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  __CFString *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  _OWORD v34[2];

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v32 = a4;
  v13 = a5;
  v14 = (void (**)(id, id))a7;
  v15 = sub_100012A9C(self, CFSTR("CreateSerializedPlaceholder"));
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v17 = 0;
LABEL_22:
    v14[2](v14, v16);
    goto LABEL_23;
  }
  objc_opt_class(NSString);
  v18 = v12;
  if ((objc_opt_isKindOfClass(v18) & 1) != 0)
    v19 = v18;
  else
    v19 = 0;

  if (!v19)
  {
    v23 = CFSTR("Bundle ID parameter was not a string or was set to nil");
    v24 = 3141;
LABEL_15:
    v17 = 0;
    v25 = sub_100010E50((uint64_t)"-[MIClientConnection createSerializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:withCompletion:]", v24, MIInstallerErrorDomain, 25, 0, 0, v23, v20, v30);
    v16 = (id)objc_claimAutoreleasedReturnValue(v25);
    goto LABEL_22;
  }
  objc_opt_class(NSURL);
  v21 = v13;
  if ((objc_opt_isKindOfClass(v21) & 1) != 0)
    v22 = v21;
  else
    v22 = 0;

  if (!v22)
  {
    v23 = CFSTR("Resultant IPA URL parameter was not a URL or was set to nil");
    v24 = 3146;
    goto LABEL_15;
  }
  if (v32)
  {
    v17 = 0;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "primaryPersonaString"));

    v17 = (void *)v31;
  }
  sub_10004E778(v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  v28 = v27;
  if (v27)
    objc_msgSend(v27, "auditToken");
  else
    memset(v34, 0, sizeof(v34));
  v33 = 0;
  v29 = +[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:](MIPlaceholderSerializer, "serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:", v18, v17, v21, v8, v34, &v33);
  v16 = v33;

  sub_10004E89C(v12);
  if ((v29 & 1) == 0)
    goto LABEL_22;
  v14[2](v14, 0);
LABEL_23:

}

- (void)setLaunchWarningForApp:(id)a3 withUniqueInstallIdentifier:(id)a4 warningData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  id v14;
  uint64_t v15;
  id v16;
  char v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v14 = sub_100012A9C(self, CFSTR("SetLaunchWarning"));
  v16 = (id)objc_claimAutoreleasedReturnValue(v14);
  if (v16)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_9;
  }
  if (!v10 || (objc_opt_class(MIAppIdentity), (objc_opt_isKindOfClass(v10) & 1) == 0))
  {
    v17 = 0;
    v22 = sub_100010E50((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", 3203, MIInstallerErrorDomain, 25, 0, 0, CFSTR("App identity was nil or the wrong type for request to set launch warning"), v15, v40);
    v16 = (id)objc_claimAutoreleasedReturnValue(v22);
    v18 = 0;
LABEL_8:
    v19 = 0;
    goto LABEL_9;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
  objc_opt_class(NSData);
  v20 = v11;
  if ((objc_opt_isKindOfClass(v20) & 1) != 0)
    v21 = v20;
  else
    v21 = 0;

  if (!v21)
  {
    v26 = CFSTR("Unique install identifier was nil or the wrong type for request to set launch warning for %@");
    v27 = 3210;
LABEL_35:
    v17 = 0;
    v36 = sub_100010E50((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", v27, MIInstallerErrorDomain, 25, 0, 0, v26, v23, (uint64_t)v10);
    v16 = (id)objc_claimAutoreleasedReturnValue(v36);
    goto LABEL_8;
  }
  if (v12)
  {
    objc_opt_class(NSData);
    v24 = v12;
    if ((objc_opt_isKindOfClass(v24) & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    if (v25)
    {
      v28 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) > 4)
      {
        v29 = CFSTR("Setting launch warning for %@");
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    v26 = CFSTR("Warning data was of the wrong type for request to set launch warning for %@");
    v27 = 3215;
    goto LABEL_35;
  }
  v28 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v29 = CFSTR("Clearing launch warning for %@");
LABEL_27:
    MOLogWrite(v28, 5, "-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", v29);
  }
LABEL_28:
  sub_10004E780(v18);
  v47 = 0;
  v17 = 1;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v18, 0, 0, &v47));
  v30 = v47;
  if (v44)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bundle"));
    v43 = v31;
    if (v31)
    {
      v46 = v30;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "installationIdentitySettingIfNotSet:withError:", 0, &v46));
      v33 = v46;

      if (v42)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "uniqueInstallID"));
        if ((objc_msgSend(v20, "isEqualToData:", v41) & 1) != 0)
        {
          v45 = v33;
          v19 = objc_msgSend(v43, "setLaunchWarningData:withError:", v12, &v45);
          v16 = v45;
        }
        else
        {
          v39 = sub_100010E50((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", 3249, MIInstallerErrorDomain, 200, 0, 0, CFSTR("Installed app with identity %@ does not have supplied unique install identifier %@ (found %@)"), v35, (uint64_t)v10);
          v16 = (id)objc_claimAutoreleasedReturnValue(v39);
          v19 = 0;
        }

        v33 = v42;
      }
      else
      {
        v38 = sub_100010E50((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", 3242, MIInstallerErrorDomain, 200, v33, 0, CFSTR("Failed to get installation identity for %@"), v34, (uint64_t)v10);
        v16 = (id)objc_claimAutoreleasedReturnValue(v38);
        v19 = 0;
      }

      v30 = v43;
    }
    else
    {
      v37 = sub_100010E50((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", 3235, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to locate app bundle in container for %@"), v32, (uint64_t)v10);
      v16 = (id)objc_claimAutoreleasedReturnValue(v37);
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
    v16 = v30;
  }
LABEL_9:
  if ((v17 & 1) != 0)
    sub_10004E89C(v18);
  if (v19)
    v13[2](v13, 0);
  else
    ((void (**)(id, id))v13)[2](v13, v16);

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (unsigned)percentComplete
{
  return self->_percentComplete;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end
