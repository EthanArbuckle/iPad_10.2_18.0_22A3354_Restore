@implementation OTControlCLI

- (OTControlCLI)initWithOTControl:(id)a3
{
  id v5;
  OTControlCLI *v6;
  OTControlCLI *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OTControlCLI;
  v6 = -[OTControlCLI init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_control, a3);

  return v7;
}

- (int)startOctagonStateMachine:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010C24;
  v7[3] = &unk_1000204B8;
  v7[4] = &v8;
  objc_msgSend(v5, "startOctagonStateMachine:reply:", v4, v7);

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)signIn:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010B98;
  v7[3] = &unk_1000204B8;
  v7[4] = &v8;
  objc_msgSend(v5, "appleAccountSignedIn:reply:", v4, v7);

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)signOut:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010B0C;
  v7[3] = &unk_1000204B8;
  v7[4] = &v8;
  objc_msgSend(v5, "appleAccountSignedOut:reply:", v4, v7);

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)depart:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010A80;
  v7[3] = &unk_1000204B8;
  v7[4] = &v8;
  objc_msgSend(v5, "leaveClique:reply:", v4, v7);

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)resetOctagon:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 timeout:(double)a7
{
  _BOOL8 v8;
  char *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v8 = a6;
  v12 = &v28;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a7));
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -86;
  do
  {
    *v12 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000109B4;
    v21[3] = &unk_1000204E0;
    v18 = v16;
    v22 = v18;
    v23 = &v25;
    v24 = &v29;
    objc_msgSend(v17, "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:", v13, 1, v14, v15, v8, 0, v21);

    v12 = (char *)(v26 + 3);
  }
  while (*((_BYTE *)v26 + 24));
  v19 = *((_DWORD *)v30 + 6);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

- (int)resetProtectedData:(id)a3 appleID:(id)a4 dsid:(id)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 notifyIdMS:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  FILE *v28;
  id v29;
  id v31;

  v8 = a8;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init((Class)OTConfigurationContext);
  v19 = sub_10000D6B4(v16, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  objc_msgSend(v18, "setPasswordEquivalentToken:", v20);
  objc_msgSend(v18, "setAuthenticationAppleID:", v16);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "altDSID"));
  objc_msgSend(v18, "setAltDSID:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contextID"));
  objc_msgSend(v18, "setContext:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "containerName"));
  objc_msgSend(v18, "setContainerName:", v23);

  v31 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[OTClique resetProtectedData:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:error:](OTClique, "resetProtectedData:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:error:", v18, v14, v13, v8, &v31));

  v25 = v31;
  v26 = v25;
  if (!v24 || v25)
  {
    v28 = __stderrp;
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description")));
    fprintf(v28, "resetProtectedData failed: %s\n", (const char *)objc_msgSend(v29, "UTF8String"));

    v27 = 1;
  }
  else
  {
    puts("resetProtectedData succeeded");
    v27 = 0;
  }

  return v27;
}

- (void)printPeer:(id)a3 prefix:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  id v19;
  const char *v20;
  id v21;
  const char *v22;
  id v23;
  const char *v24;
  const char *v25;
  void *v26;
  id v27;

  v27 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("peerID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("permanentInfo")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("model_id")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("permanentInfo")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("epoch")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stableInfo")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("device_name")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stableInfo")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("serial_number")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stableInfo")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("os_version")));

  if (v27)
    v25 = (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
  else
    v25 = (const char *)&unk_10001D77F;
  v16 = objc_retainAutorelease(v6);
  v24 = (const char *)objc_msgSend(v16, "UTF8String");
  v17 = objc_retainAutorelease(v8);
  v18 = (const char *)objc_msgSend(v17, "UTF8String");
  v19 = objc_retainAutorelease(v11);
  v20 = (const char *)objc_msgSend(v19, "UTF8String");
  v21 = objc_retainAutorelease(v13);
  v22 = (const char *)objc_msgSend(v21, "UTF8String");
  v23 = objc_retainAutorelease(v15);
  printf("%s%s hw:'%s' name:'%s' serial: '%s' os:'%s' epoch:%d\n", v25, v24, v18, v20, v22, (const char *)objc_msgSend(v23, "UTF8String"), objc_msgSend(v26, "intValue"));

}

- (void)printCRKWithPeer:(id)a3 information:(id)a4 prefix:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  id v14;
  const char *v15;
  const char *v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uuid")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kind")));

  if (v8)
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  else
    v12 = (const char *)&unk_10001D77F;
  v17 = objc_retainAutorelease(v7);
  v13 = (const char *)objc_msgSend(v17, "UTF8String");
  v14 = objc_retainAutorelease(v10);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");
  if (v11)
    v16 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  else
    v16 = "-";
  printf("%s%s uuid: %s kind: %s\n", v12, v13, v15, v16);

}

- (void)printPeers:(id)a3 egoPeerID:(id)a4 informationOnPeers:(id)a5 informationOnCRKs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  OTControlCLI *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23 = a6;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v17));
        if (v18)
        {
          if (objc_msgSend(v17, "isEqualToString:", v11))
          {
            v19 = self;
            v20 = v18;
            v21 = CFSTR("    Self: ");
          }
          else
          {
            v19 = self;
            v20 = v18;
            v21 = CFSTR("    Peer: ");
          }
          -[OTControlCLI printPeer:prefix:](v19, "printPeer:prefix:", v20, v21);
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v17));
          if (v22)
            -[OTControlCLI printCRKWithPeer:information:prefix:](self, "printCRKWithPeer:information:prefix:", v17, v22, CFSTR("    CRK: "));
          else
            printf("    Peer:  %s; further information missing\n",
              (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));

        }
      }
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

}

- (int)checkAndPrintEscrowRecords:(id)a3 error:(id)a4 json:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t PeerID;
  uint64_t v29;
  void *v30;
  id v31;
  FILE *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  FILE *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  id v46;
  _BOOL4 v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  const __CFString *v58;
  void *v59;
  _BYTE v60[128];
  const __CFString *v61;
  void *v62;
  _BYTE v63[128];

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || v8)
  {
    if (v5)
    {
      v58 = CFSTR("error");
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
      v59 = v36;
      v37 = 1;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
      sub_10000D9F8(v38);

    }
    else
    {
      v39 = __stderrp;
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
      fprintf(v39, "fetching escrow records failed: %s\n", (const char *)objc_msgSend(v40, "UTF8String"));

      v37 = 1;
    }
  }
  else
  {
    v47 = v5;
    if (!v5)
    {
      v10 = objc_msgSend(v7, "count");
      v11 = objc_msgSend(v7, "count");
      v12 = "s";
      if (v11 == (id)1)
        v12 = (const char *)&unk_10001D77F;
      printf("Successfully fetched %lu record%s.\n", v10, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v46 = v7;
    obj = v7;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v55;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v55 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "escrowInformationMetadata"));
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerInfo"));
          if (!v20)
          {

LABEL_17:
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recordId"));
LABEL_18:
            v30 = (void *)v29;
            objc_msgSend(v13, "addObject:", v29);

            goto LABEL_19;
          }
          v21 = (void *)v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "escrowInformationMetadata"));
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peerInfo")));
          v24 = objc_msgSend(v23, "bytes");

          if (!v24)
            goto LABEL_17;
          v53 = 0;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "escrowInformationMetadata"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "peerInfo"));
          v27 = SOSPeerInfoCreateFromData(kCFAllocatorDefault, &v53, v26);

          if (v27)
          {
            PeerID = SOSPeerInfoGetPeerID(v27);
            v29 = objc_claimAutoreleasedReturnValue(PeerID);
            goto LABEL_18;
          }
          v31 = v53;
          v32 = __stderrp;
          v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "description")));
          fprintf(v32, "Failed SOSPeerInfoCreateFromData: %s\n", (const char *)objc_msgSend(v33, "UTF8String"));

LABEL_19:
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        v15 = v34;
      }
      while (v34);
    }

    if (v47)
    {
      v61 = CFSTR("escrowRecords");
      v62 = v13;
      v35 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      sub_10000D9F8(v35);
      v7 = v46;
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v35 = v13;
      v41 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      v7 = v46;
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v43)
              objc_enumerationMutation(v35);
            printf("fetched record id: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i)), "UTF8String"));
          }
          v42 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
        }
        while (v42);
      }
    }

    v37 = 0;
    v9 = 0;
  }

  return v37;
}

- (int)fetchEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v13;

  v5 = a4;
  if (a5)
    v7 = 2;
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "makeConfigurationContext"));
  objc_msgSend(v8, "setEscrowFetchSource:", v7);
  v13 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[OTClique fetchEscrowRecords:error:](OTClique, "fetchEscrowRecords:error:", v8, &v13));
  v10 = v13;
  v11 = -[OTControlCLI checkAndPrintEscrowRecords:error:json:](self, "checkAndPrintEscrowRecords:error:json:", v9, v10, v5);

  return v11;
}

- (int)fetchAllEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v13;

  v5 = a4;
  if (a5)
    v7 = 2;
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "makeConfigurationContext"));
  objc_msgSend(v8, "setEscrowFetchSource:", v7);
  v13 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[OTClique fetchAllEscrowRecords:error:](OTClique, "fetchAllEscrowRecords:error:", v8, &v13));
  v10 = v13;
  v11 = -[OTControlCLI checkAndPrintEscrowRecords:error:json:](self, "checkAndPrintEscrowRecords:error:json:", v9, v10, v5);

  return v11;
}

- (int)performEscrowRecovery:(id)a3 recordID:(id)a4 appleID:(id)a5 secret:(id)a6 overrideForAccountScript:(BOOL)a7 overrideEscrowCache:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  FILE *v43;
  id v44;
  FILE *v45;
  id v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  FILE *v52;
  id v53;
  id v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _BYTE v68[128];

  v8 = a8;
  v9 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = objc_alloc_init((Class)OTICDPRecordContext);
  v18 = objc_alloc_init((Class)OTCDPRecoveryInformation);
  objc_msgSend(v17, "setCdpInfo:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cdpInfo"));
  objc_msgSend(v19, "setRecoverySecret:", v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cdpInfo"));
  objc_msgSend(v20, "setContainsIcdpData:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cdpInfo"));
  objc_msgSend(v21, "setUsesMultipleIcsc:", 1);

  v22 = objc_alloc_init((Class)OTEscrowAuthenticationInformation);
  objc_msgSend(v17, "setAuthInfo:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authInfo"));
  objc_msgSend(v23, "setAuthenticationAppleid:", v15);

  v24 = sub_10000D6B4(v15, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authInfo"));
  objc_msgSend(v26, "setAuthenticationPassword:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "makeConfigurationContext"));
  v28 = v27;
  if (v8)
    v29 = 2;
  else
    v29 = 0;
  objc_msgSend(v27, "setEscrowFetchSource:", v29);
  objc_msgSend(v28, "setOverrideForSetupAccountScript:", v9);
  v67 = 0;
  v60 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[OTClique fetchEscrowRecords:error:](OTClique, "fetchEscrowRecords:error:", v28, &v67));
  v31 = v67;
  v32 = v31;
  v59 = v30;
  if (!v30 || v31)
  {
    v45 = __stderrp;
    v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "description")));
    fprintf(v45, "Failed to fetch escrow records: %s\n", (const char *)objc_msgSend(v46, "UTF8String"));

    v47 = 1;
  }
  else
  {
    v57 = v13;
    v58 = v17;
    v55 = v16;
    v56 = v15;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v33 = v30;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v64;
LABEL_8:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v64 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v37);
        v62 = 0;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "escrowInformationMetadata"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "peerInfo"));
        v41 = SOSPeerInfoCreateFromData(kCFAllocatorDefault, &v62, v40);

        if (v41)
        {
          if ((objc_msgSend((id)SOSPeerInfoGetPeerID(v41), "isEqualToString:", v14) & 1) != 0)
          {
            v48 = v38;

            if (!v48)
              goto LABEL_23;
            v13 = v57;
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "makeConfigurationContext"));
            objc_msgSend(v49, "setEscrowFetchSource:", 2);
            v61 = 0;
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[OTClique performEscrowRecovery:cdpContext:escrowRecord:error:](OTClique, "performEscrowRecovery:cdpContext:escrowRecord:error:", v49, v58, v48, &v61));
            v51 = v61;
            v32 = v51;
            if (!v50 || v51)
            {
              v52 = __stderrp;
              v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "description")));
              fprintf(v52, "Escrow recovery failed: %s\n", (const char *)objc_msgSend(v53, "UTF8String"));

              v47 = 1;
            }
            else
            {
              puts("Successfully performed escrow recovery.");
              v47 = 0;
            }

            goto LABEL_26;
          }
        }
        else
        {
          v42 = v62;
          v43 = __stderrp;
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "description")));
          fprintf(v43, "Failed SOSPeerInfoCreateFromData: %s\n", (const char *)objc_msgSend(v44, "UTF8String"));

        }
        if (v35 == (id)++v37)
        {
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
          if (v35)
            goto LABEL_8;
          break;
        }
      }
    }

LABEL_23:
    v47 = 1;
    fwrite("Failed to find escrow record to restore.\n", 0x29uLL, 1uLL, __stderrp);
    v32 = 0;
    v13 = v57;
LABEL_26:
    v16 = v55;
    v15 = v56;
    v17 = v58;
  }

  return v47;
}

- (int)performSilentEscrowRecovery:(id)a3 appleID:(id)a4 secret:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  int v26;
  FILE *v27;
  FILE *v28;
  id v29;
  id v31;
  id v32;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init((Class)OTICDPRecordContext);
  v11 = objc_alloc_init((Class)OTCDPRecoveryInformation);
  objc_msgSend(v10, "setCdpInfo:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cdpInfo"));
  objc_msgSend(v12, "setRecoverySecret:", v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cdpInfo"));
  objc_msgSend(v13, "setContainsIcdpData:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cdpInfo"));
  objc_msgSend(v14, "setSilentRecoveryAttempt:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cdpInfo"));
  objc_msgSend(v15, "setUsesMultipleIcsc:", 1);

  v16 = objc_alloc_init((Class)OTEscrowAuthenticationInformation);
  objc_msgSend(v10, "setAuthInfo:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authInfo"));
  objc_msgSend(v17, "setAuthenticationAppleid:", v9);

  v18 = sub_10000D6B4(v9, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authInfo"));
  objc_msgSend(v20, "setAuthenticationPassword:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "makeConfigurationContext"));
  v32 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[OTClique fetchEscrowRecords:error:](OTClique, "fetchEscrowRecords:error:", v21, &v32));
  v23 = v32;

  if (!v22 || v23)
  {
    v27 = __stderrp;
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description")));
    fprintf(v27, "Failed to fetch escrow records: %s.\n", (const char *)objc_msgSend(v25, "UTF8String"));
LABEL_8:
    v26 = 1;
    goto LABEL_9;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "makeConfigurationContext"));
  v31 = 0;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[OTClique performSilentEscrowRecovery:cdpContext:allRecords:error:](OTClique, "performSilentEscrowRecovery:cdpContext:allRecords:error:", v24, v10, v22, &v31));
  v23 = v31;

  if (!v25 || v23)
  {
    v28 = __stderrp;
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description")));
    fprintf(v28, "Escrow recovery failed: %s\n", (const char *)objc_msgSend(v29, "UTF8String"));

    goto LABEL_8;
  }
  puts("Successfully performed escrow recovery.");
  v26 = 0;
LABEL_9:

  return v26;
}

- (int)tlkRecoverability:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  FILE *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  FILE *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  id v31;
  int v32;
  FILE *v33;
  const char *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  int v41;
  id v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v3 = a3;
  v4 = objc_alloc((Class)OTClique);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "makeConfigurationContext"));
  v6 = objc_msgSend(v4, "initWithContextData:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "makeConfigurationContext"));
    v54 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[OTClique fetchAllEscrowRecords:error:](OTClique, "fetchAllEscrowRecords:error:", v7, &v54));
    v9 = v54;

    if (!v8 || v9)
    {
      v33 = __stderrp;
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
      fprintf(v33, "Failed to fetch escrow records: %s.\n", (const char *)objc_msgSend(v10, "UTF8String"));
    }
    else
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v10 = v8;
      v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v43)
      {
        v36 = v8;
        v37 = v3;
        v11 = *(_QWORD *)v51;
        v40 = v6;
        v41 = 1;
        v38 = *(_QWORD *)v51;
        v39 = v10;
        do
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(_QWORD *)v51 != v11)
              objc_enumerationMutation(v10);
            v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
            v49 = 0;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tlkRecoverabilityForEscrowRecord:error:", v13, &v49));
            v15 = v49;
            if (v14 && (objc_msgSend(v14, "count") ? (v16 = v15 == 0) : (v16 = 0), v16))
            {
              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              v18 = v14;
              v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
              if (v26)
              {
                v27 = v26;
                v42 = v15;
                v28 = *(_QWORD *)v46;
                do
                {
                  for (j = 0; j != v27; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v46 != v28)
                      objc_enumerationMutation(v18);
                    v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
                    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordId")));
                    printf("%s has recoverable view: %s\n", (const char *)objc_msgSend(v31, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v30), "UTF8String"));

                  }
                  v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
                }
                while (v27);
                v41 = 0;
                v10 = v39;
                v6 = v40;
                v11 = v38;
                v15 = v42;
              }
              else
              {
                v41 = 0;
              }
            }
            else
            {
              v44 = v14;
              v17 = __stderrp;
              v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordId")));
              v19 = (const char *)objc_msgSend(v18, "UTF8String");
              v20 = v11;
              v21 = v6;
              v22 = v10;
              v23 = v15;
              v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description")));
              v35 = (const char *)objc_msgSend(v24, "UTF8String");
              v25 = v17;
              v14 = v44;
              fprintf(v25, "%s Failed TLK recoverability check: %s\n", v19, v35);

              v15 = v23;
              v10 = v22;
              v6 = v21;
              v11 = v20;
            }

          }
          v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v43);
        v8 = v36;
        v3 = v37;
        v9 = 0;
        v32 = v41;
        goto LABEL_30;
      }
    }
    v32 = 1;
LABEL_30:

    goto LABEL_31;
  }
  v32 = 1;
  fwrite("Failed to create clique\n", 0x18uLL, 1uLL, __stderrp);
LABEL_31:

  return v32;
}

- (int)status:(id)a3 json:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v9[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010078;
  v9[3] = &unk_100020508;
  v10 = a4;
  v9[4] = self;
  v9[5] = &v11;
  objc_msgSend(v7, "status:reply:", v6, v9);

  LODWORD(self) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return (int)self;
}

- (int)recoverUsingBottleID:(id)a3 entropy:(id)a4 arguments:(id)a5 control:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  int v17;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v13 = dispatch_semaphore_create(0);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000FFBC;
  v19[3] = &unk_100020530;
  v22 = &v23;
  v14 = v9;
  v20 = v14;
  v15 = v13;
  v21 = v15;
  objc_msgSend(v12, "restoreFromBottle:entropy:bottleID:reply:", v11, v10, v14, v19);
  v16 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v15, v16))
    fwrite("timed out waiting for restore/recover\n", 0x26uLL, 1uLL, __stderrp);
  v17 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (int)fetchAllBottles:(id)a3 control:(id)a4 overrideEscrowCache:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint8_t v17[8];
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_10000D840;
  v36[4] = sub_10000D850;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_10000D840;
  v34 = sub_10000D850;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10000D840;
  v28 = sub_10000D850;
  v29 = 0;
  v9 = dispatch_semaphore_create(0);
  v18[0] = _NSConcreteStackBlock;
  if (v5)
    v10 = 2;
  else
    v10 = 0;
  v18[1] = 3221225472;
  v18[2] = sub_10000FDB8;
  v18[3] = &unk_100020558;
  v20 = &v38;
  v21 = v36;
  v22 = &v30;
  v23 = &v24;
  v11 = v9;
  v19 = v11;
  objc_msgSend(v8, "fetchAllViableBottles:source:reply:", v7, v10, v18);
  v12 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    v13 = secLogObjForScope("clique");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData failed to fetch bottles\n", v17, 2u);
    }

    v15 = 1;
  }
  else
  {
    objc_msgSend((id)v31[5], "enumerateObjectsUsingBlock:", &stru_100020598);
    objc_msgSend((id)v25[5], "enumerateObjectsUsingBlock:", &stru_1000205B8);
    v15 = *((_DWORD *)v39 + 6);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  return v15;
}

- (int)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 json:(BOOL)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  _QWORD v13[5];
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FC3C;
  v13[3] = &unk_1000205E0;
  v14 = a6;
  v13[4] = &v15;
  objc_msgSend(v11, "healthCheck:skipRateLimitingCheck:repair:reply:", v10, v8, v7, v13);

  LODWORD(v7) = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (int)simulateReceivePush:(id)a3 json:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  _QWORD v10[5];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FB10;
  v10[3] = &unk_100020608;
  v11 = a4;
  v10[4] = &v12;
  objc_msgSend(v7, "simulateReceivePush:reply:", v6, v10);

  v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)refetchCKKSPolicy:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FA84;
  v7[3] = &unk_1000204B8;
  v7[4] = &v8;
  objc_msgSend(v5, "refetchCKKSPolicy:reply:", v4, v7);

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000F9F8;
  v13[3] = &unk_1000204B8;
  v13[4] = &v14;
  objc_msgSend(v11, "tapToRadar:description:radar:reply:", v8, v9, v10, v13);

  LODWORD(v11) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v11;
}

- (int)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v4 = a4;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F948;
  v9[3] = &unk_100020630;
  v9[4] = &v10;
  objc_msgSend(v7, "setUserControllableViewsSyncStatus:enabled:reply:", v6, v4, v9);

  LODWORD(v4) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return v4;
}

- (int)fetchUserControllableViewsSyncStatus:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F898;
  v7[3] = &unk_100020630;
  v7[4] = &v8;
  objc_msgSend(v5, "fetchUserControllableViewsSyncStatus:reply:", v4, v7);

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)resetAccountCDPContentsWithArguments:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  int v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v13 = dispatch_semaphore_create(0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000F80C;
  v19[3] = &unk_1000206A8;
  v21 = &v22;
  v15 = v13;
  v20 = v15;
  objc_msgSend(v14, "resetAccountCDPContents:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:reply:", v10, v11, v12, v6, v19);

  v16 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    v17 = 1;
    fwrite("timed out waiting for restore/recover\n", 0x26uLL, 1uLL, __stderrp);
    *((_DWORD *)v23 + 6) = 1;
  }
  else
  {
    v17 = *((_DWORD *)v23 + 6);
  }

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (int)createCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6
{
  id v10;
  id v11;
  int v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;

  v18 = a3;
  v10 = a4;
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v10);
    if (!v11)
    {
      v12 = 1;
      fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      goto LABEL_8;
    }
  }
  else
  {
    v11 = 0;
  }
  v13 = &v27;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a6));
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = -86;
  do
  {
    *v13 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000F700;
    v19[3] = &unk_100020658;
    v16 = v14;
    v20 = v16;
    v21 = &v24;
    v22 = &v28;
    v23 = a5;
    objc_msgSend(v15, "createCustodianRecoveryKey:uuid:reply:", v18, v11, v19);

    v13 = (char *)(v25 + 3);
  }
  while (*((_BYTE *)v25 + 24));
  v12 = *((_DWORD *)v29 + 6);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

LABEL_8:
  return v12;
}

- (int)joinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  void *v24;
  int v25;
  FILE *v26;
  id v27;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a7));
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = -86;
  v17 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v13, 0);
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v14, 0);
    if (v18)
    {
      v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v15);
      v20 = v19;
      if (v19)
      {
        v30 = v19;
        v35 = 0;
        v21 = objc_msgSend(objc_alloc((Class)OTCustodianRecoveryKey), "initWithWrappedKey:wrappingKey:uuid:error:", v18, v17, v19, &v35);
        v22 = v35;
        v29 = v22;
        if (v21)
        {
          v23 = v37;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_10000F634;
            v31[3] = &unk_1000204E0;
            v32 = v16;
            v33 = &v36;
            v34 = &v40;
            objc_msgSend(v24, "joinWithCustodianRecoveryKey:custodianRecoveryKey:reply:", v12, v21, v31);

            v23 = v37;
          }
          while (*((_BYTE *)v37 + 24));
          v25 = *((_DWORD *)v41 + 6);
        }
        else
        {
          v26 = __stderrp;
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description")));
          fprintf(v26, "failed to create OTCustodianRecoveryKey: %s\n", (const char *)objc_msgSend(v27, "UTF8String"));

          v25 = 1;
        }
        v20 = v30;

      }
      else
      {
        v25 = 1;
        fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      }

    }
    else
    {
      v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }

  }
  else
  {
    v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)preflightJoinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  void *v24;
  int v25;
  FILE *v26;
  id v27;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a7));
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = -86;
  v17 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v13, 0);
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v14, 0);
    if (v18)
    {
      v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v15);
      v20 = v19;
      if (v19)
      {
        v30 = v19;
        v35 = 0;
        v21 = objc_msgSend(objc_alloc((Class)OTCustodianRecoveryKey), "initWithWrappedKey:wrappingKey:uuid:error:", v18, v17, v19, &v35);
        v22 = v35;
        v29 = v22;
        if (v21)
        {
          v23 = v37;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_10000F568;
            v31[3] = &unk_1000204E0;
            v32 = v16;
            v33 = &v36;
            v34 = &v40;
            objc_msgSend(v24, "preflightJoinWithCustodianRecoveryKey:custodianRecoveryKey:reply:", v12, v21, v31);

            v23 = v37;
          }
          while (*((_BYTE *)v37 + 24));
          v25 = *((_DWORD *)v41 + 6);
        }
        else
        {
          v26 = __stderrp;
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description")));
          fprintf(v26, "failed to create OTCustodianRecoveryKey: %s\n", (const char *)objc_msgSend(v27, "UTF8String"));

          v25 = 1;
        }
        v20 = v30;

      }
      else
      {
        v25 = 1;
        fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      }

    }
    else
    {
      v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }

  }
  else
  {
    v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)removeCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t *v12;
  void *v13;
  int v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a5));
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -86;
  v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v9);
  if (v11)
  {
    v16 = v9;
    v12 = v22;
    do
    {
      *((_BYTE *)v12 + 24) = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control", v16));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000F49C;
      v17[3] = &unk_1000204E0;
      v18 = v10;
      v19 = &v21;
      v20 = &v25;
      objc_msgSend(v13, "removeCustodianRecoveryKey:uuid:reply:", v8, v11, v17);

      v12 = v22;
    }
    while (*((_BYTE *)v22 + 24));
    v14 = *((_DWORD *)v26 + 6);
    v9 = v16;
  }
  else
  {
    v14 = 1;
    fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)checkCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t *v12;
  void *v13;
  int v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a5));
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -86;
  v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v9);
  if (v11)
  {
    v16 = v9;
    v12 = v22;
    do
    {
      *((_BYTE *)v12 + 24) = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control", v16));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000F398;
      v17[3] = &unk_100020680;
      v18 = v10;
      v19 = &v21;
      v20 = &v25;
      objc_msgSend(v13, "checkCustodianRecoveryKey:uuid:reply:", v8, v11, v17);

      v12 = v22;
    }
    while (*((_BYTE *)v22 + 24));
    v14 = *((_DWORD *)v26 + 6);
    v9 = v16;
  }
  else
  {
    v14 = 1;
    fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)removeRecoveryKeyWithArguments:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F30C;
  v7[3] = &unk_1000204B8;
  v7[4] = &v8;
  objc_msgSend(v5, "removeRecoveryKey:reply:", v4, v7);

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)setRecoveryKeyWithArguments:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  FILE *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v17 = 0;
  v5 = SecRKCreateRecoveryKeyString(&v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v17;
  v8 = v7;
  if (!v6 || v7)
  {
    v11 = __stderrp;
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
    fprintf(v11, "failed to create recovery key: %s\n", (const char *)objc_msgSend(v12, "UTF8String"));

    v10 = *((_DWORD *)v19 + 6);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000F270;
    v14[3] = &unk_1000206A8;
    v15 = v6;
    v16 = &v18;
    objc_msgSend(v9, "createRecoveryKey:recoveryKey:reply:", v4, v15, v14);

    v10 = *((_DWORD *)v19 + 6);
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (int)joinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F1D4;
  v11[3] = &unk_1000206A8;
  v9 = v7;
  v12 = v9;
  v13 = &v14;
  objc_msgSend(v8, "joinWithRecoveryKey:recoveryKey:reply:", v6, v9, v11);

  LODWORD(v8) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v8;
}

- (int)checkRecoveryKeyWithArguments:(id)a3
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  FILE *v7;
  id v8;
  int v9;
  const char *v10;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "makeConfigurationContext"));
  v12 = 0;
  v4 = +[OTClique isRecoveryKeySet:error:](OTClique, "isRecoveryKeySet:error:", v3, &v12);
  v5 = v12;
  v6 = v5;
  if (v5)
  {
    v7 = __stderrp;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    fprintf(v7, "check recovery key failed: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

    v9 = 1;
  }
  else
  {
    v10 = "not set";
    if (v4)
      v10 = "set";
    printf("recovery key is %s\n", v10);
    v9 = v4 ^ 1;
  }

  return v9;
}

- (int)preflightJoinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F118;
  v11[3] = &unk_1000206D0;
  v9 = v7;
  v12 = v9;
  v13 = &v14;
  objc_msgSend(v8, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:reply:", v6, v9, v11);

  LODWORD(v8) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v8;
}

- (int)createInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6
{
  id v10;
  id v11;
  int v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;

  v18 = a3;
  v10 = a4;
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v10);
    if (!v11)
    {
      v12 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_8;
    }
  }
  else
  {
    v11 = 0;
  }
  v13 = &v27;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a6));
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = -86;
  do
  {
    *v13 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000F00C;
    v19[3] = &unk_1000206F8;
    v16 = v14;
    v20 = v16;
    v21 = &v24;
    v22 = &v28;
    v23 = a5;
    objc_msgSend(v15, "createInheritanceKey:uuid:reply:", v18, v11, v19);

    v13 = (char *)(v25 + 3);
  }
  while (*((_BYTE *)v25 + 24));
  v12 = *((_DWORD *)v29 + 6);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

LABEL_8:
  return v12;
}

- (int)generateInheritanceKeyWithArguments:(id)a3 json:(BOOL)a4 timeout:(double)a5
{
  char *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v8 = &v23;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a5));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = -86;
  do
  {
    *v8 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000EF10;
    v15[3] = &unk_1000206F8;
    v12 = v10;
    v16 = v12;
    v17 = &v20;
    v18 = &v24;
    v19 = a4;
    objc_msgSend(v11, "generateInheritanceKey:uuid:reply:", v9, 0, v15);

    v8 = (char *)(v21 + 3);
  }
  while (*((_BYTE *)v21 + 24));
  v13 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

- (int)storeInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  void *v24;
  int v25;
  id v26;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a7));
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 1;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -86;
  v17 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v13, 0);
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v14, 0);
    if (v18)
    {
      v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v15);
      v20 = v19;
      if (v19)
      {
        v29 = v19;
        v34 = 0;
        v21 = objc_msgSend(objc_alloc((Class)OTInheritanceKey), "initWithWrappedKeyData:wrappingKeyData:uuid:error:", v18, v17, v19, &v34);
        v22 = v34;
        v28 = v22;
        if (v21)
        {
          v23 = v36;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_10000EE5C;
            v30[3] = &unk_1000204E0;
            v31 = v16;
            v32 = &v35;
            v33 = &v39;
            objc_msgSend(v24, "storeInheritanceKey:ik:reply:", v12, v21, v30);

            v23 = v36;
          }
          while (*((_BYTE *)v36 + 24));
          v25 = *((_DWORD *)v40 + 6);
        }
        else
        {
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description")));
          printf("failed to create OTInheritanceKey: %s\n", (const char *)objc_msgSend(v26, "UTF8String"));

          v25 = 1;
        }
        v20 = v29;

      }
      else
      {
        puts("bad format for inheritanceUUID");
        v25 = 1;
      }

    }
    else
    {
      puts("bad base64 data for wrappedKey");
      v25 = 1;
    }

  }
  else
  {
    puts("bad base64 data for wrappingKey");
    v25 = 1;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v25;
}

- (int)joinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  void *v24;
  int v25;
  FILE *v26;
  id v27;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a7));
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = -86;
  v17 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v13, 0);
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v14, 0);
    if (v18)
    {
      v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v15);
      v20 = v19;
      if (v19)
      {
        v30 = v19;
        v35 = 0;
        v21 = objc_msgSend(objc_alloc((Class)OTInheritanceKey), "initWithWrappedKeyData:wrappingKeyData:uuid:error:", v18, v17, v19, &v35);
        v22 = v35;
        v29 = v22;
        if (v21)
        {
          v23 = v37;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_10000ED90;
            v31[3] = &unk_1000204E0;
            v32 = v16;
            v33 = &v36;
            v34 = &v40;
            objc_msgSend(v24, "joinWithInheritanceKey:inheritanceKey:reply:", v12, v21, v31);

            v23 = v37;
          }
          while (*((_BYTE *)v37 + 24));
          v25 = *((_DWORD *)v41 + 6);
        }
        else
        {
          v26 = __stderrp;
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description")));
          fprintf(v26, "failed to create OTInheritanceKey: %s\n", (const char *)objc_msgSend(v27, "UTF8String"));

          v25 = 1;
        }
        v20 = v30;

      }
      else
      {
        v25 = 1;
        fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      }

    }
    else
    {
      v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }

  }
  else
  {
    v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)preflightJoinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  void *v24;
  int v25;
  FILE *v26;
  id v27;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a7));
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = -86;
  v17 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v13, 0);
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v14, 0);
    if (v18)
    {
      v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v15);
      v20 = v19;
      if (v19)
      {
        v30 = v19;
        v35 = 0;
        v21 = objc_msgSend(objc_alloc((Class)OTInheritanceKey), "initWithWrappedKeyData:wrappingKeyData:uuid:error:", v18, v17, v19, &v35);
        v22 = v35;
        v29 = v22;
        if (v21)
        {
          v23 = v37;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_10000ECC4;
            v31[3] = &unk_1000204E0;
            v32 = v16;
            v33 = &v36;
            v34 = &v40;
            objc_msgSend(v24, "preflightJoinWithInheritanceKey:inheritanceKey:reply:", v12, v21, v31);

            v23 = v37;
          }
          while (*((_BYTE *)v37 + 24));
          v25 = *((_DWORD *)v41 + 6);
        }
        else
        {
          v26 = __stderrp;
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description")));
          fprintf(v26, "failed to create OTInheritanceKey: %s\n", (const char *)objc_msgSend(v27, "UTF8String"));

          v25 = 1;
        }
        v20 = v30;

      }
      else
      {
        v25 = 1;
        fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      }

    }
    else
    {
      v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }

  }
  else
  {
    v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)removeInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t *v12;
  void *v13;
  int v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a5));
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -86;
  v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v9);
  if (v11)
  {
    v16 = v9;
    v12 = v22;
    do
    {
      *((_BYTE *)v12 + 24) = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control", v16));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000EBF8;
      v17[3] = &unk_1000204E0;
      v18 = v10;
      v19 = &v21;
      v20 = &v25;
      objc_msgSend(v13, "removeInheritanceKey:uuid:reply:", v8, v11, v17);

      v12 = v22;
    }
    while (*((_BYTE *)v22 + 24));
    v14 = *((_DWORD *)v26 + 6);
    v9 = v16;
  }
  else
  {
    v14 = 1;
    fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)checkInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t *v12;
  void *v13;
  int v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a5));
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -86;
  v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v9);
  if (v11)
  {
    v16 = v9;
    v12 = v22;
    do
    {
      *((_BYTE *)v12 + 24) = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control", v16));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000EAF4;
      v17[3] = &unk_100020680;
      v18 = v10;
      v19 = &v21;
      v20 = &v25;
      objc_msgSend(v13, "checkInheritanceKey:uuid:reply:", v8, v11, v17);

      v12 = v22;
    }
    while (*((_BYTE *)v22 + 24));
    v14 = *((_DWORD *)v26 + 6);
    v9 = v16;
  }
  else
  {
    v14 = 1;
    fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)recreateInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 wrappingKey:(id)a5 wrappedKey:(id)a6 claimToken:(id)a7 json:(BOOL)a8 timeout:(double)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  void *v28;
  FILE *v29;
  id v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  BOOL v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;

  v37 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (v16)
  {
    v20 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v16);
    if (!v20)
    {
      v21 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_20;
    }
  }
  else
  {
    v20 = 0;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a9));
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 1;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = -86;
  v22 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v17, 0);
  if (v22)
  {
    v23 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v18, 0);
    if (v23)
    {
      v24 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v19, 0);
      if (v24)
      {
        v34 = v23;
        v35 = v22;
        v33 = objc_alloc_init((Class)NSUUID);
        v43 = 0;
        v25 = objc_msgSend(objc_alloc((Class)OTInheritanceKey), "initWithWrappedKeyData:wrappingKeyData:claimTokenData:uuid:error:", v23, v22, v24, v33, &v43);
        v26 = v43;
        v32 = v26;
        if (v25)
        {
          v27 = v45;
          do
          {
            *((_BYTE *)v27 + 24) = 0;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_10000E9E8;
            v38[3] = &unk_1000206F8;
            v39 = v36;
            v40 = &v44;
            v41 = &v48;
            v42 = a8;
            objc_msgSend(v28, "recreateInheritanceKey:uuid:oldIK:reply:", v37, v20, v25, v38);

            v27 = v45;
          }
          while (*((_BYTE *)v45 + 24));
          v21 = *((_DWORD *)v49 + 6);
        }
        else
        {
          v29 = __stderrp;
          v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "description")));
          fprintf(v29, "failed to create OTInheritanceKey: %s\n", (const char *)objc_msgSend(v30, "UTF8String"));

          v21 = 1;
        }

        v23 = v34;
        v22 = v35;
      }
      else
      {
        v21 = 1;
        fwrite("bad base64 data for claimToken\n", 0x1FuLL, 1uLL, __stderrp);
      }

    }
    else
    {
      v21 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }

  }
  else
  {
    v21 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

LABEL_20:
  return v21;
}

- (int)createInheritanceKeyWithClaimTokenAndWrappingKey:(id)a3 uuidString:(id)a4 claimToken:(id)a5 wrappingKey:(id)a6 json:(BOOL)a7 timeout:(double)a8
{
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  void *v21;
  id v23;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v26 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v13)
  {
    v25 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v13);
    if (!v25)
    {
      v16 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_14;
    }
  }
  else
  {
    v25 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a8));
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 1;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = -86;
  v18 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v15, 0);
  if (v18)
  {
    v19 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v14, 0);
    if (v19)
    {
      v23 = v15;
      v20 = v33;
      do
      {
        *((_BYTE *)v20 + 24) = 0;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10000E74C;
        v27[3] = &unk_1000206F8;
        v28 = v17;
        v29 = &v32;
        v30 = &v36;
        v31 = a7;
        objc_msgSend(v21, "createInheritanceKey:uuid:claimTokenData:wrappingKeyData:reply:", v26, v25, v19, v18, v27);

        v20 = v33;
      }
      while (*((_BYTE *)v33 + 24));
      v16 = *((_DWORD *)v37 + 6);
      v15 = v23;
    }
    else
    {
      v16 = 1;
      fwrite("bad base64 data for claimToken\n", 0x1FuLL, 1uLL, __stderrp);
    }

  }
  else
  {
    v16 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

LABEL_14:
  return v16;
}

- (int)disableWebAccessWithArguments:(id)a3 timeout:(double)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t *v9;
  void *v10;
  id v11;
  int v12;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v15 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = -86;
  v7 = objc_alloc_init((Class)OTAccountSettings);
  v8 = objc_alloc_init((Class)OTWebAccess);
  objc_msgSend(v8, "setEnabled:", 0);
  objc_msgSend(v7, "setWebAccess:", v8);
  v14 = v8;
  v9 = v21;
  do
  {
    *((_BYTE *)v9 + 24) = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control", v14));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E680;
    v16[3] = &unk_1000204E0;
    v11 = v6;
    v17 = v11;
    v18 = &v20;
    v19 = &v24;
    objc_msgSend(v10, "setAccountSetting:setting:reply:", v15, v7, v16);

    v9 = v21;
  }
  while (*((_BYTE *)v21 + 24));
  v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)enableWebAccessWithArguments:(id)a3 timeout:(double)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t *v9;
  void *v10;
  id v11;
  int v12;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v15 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = -86;
  v7 = objc_alloc_init((Class)OTAccountSettings);
  v8 = objc_alloc_init((Class)OTWebAccess);
  objc_msgSend(v8, "setEnabled:", 1);
  objc_msgSend(v7, "setWebAccess:", v8);
  v14 = v8;
  v9 = v21;
  do
  {
    *((_BYTE *)v9 + 24) = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control", v14));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E5B4;
    v16[3] = &unk_1000204E0;
    v11 = v6;
    v17 = v11;
    v18 = &v20;
    v19 = &v24;
    objc_msgSend(v10, "setAccountSetting:setting:reply:", v15, v7, v16);

    v9 = v21;
  }
  while (*((_BYTE *)v21 + 24));
  v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)enableWalrusWithArguments:(id)a3 timeout:(double)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t *v9;
  void *v10;
  id v11;
  int v12;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v15 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = -86;
  v7 = objc_alloc_init((Class)OTAccountSettings);
  v8 = objc_alloc_init((Class)OTWalrus);
  objc_msgSend(v8, "setEnabled:", 1);
  objc_msgSend(v7, "setWalrus:", v8);
  v14 = v8;
  v9 = v21;
  do
  {
    *((_BYTE *)v9 + 24) = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control", v14));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E4E8;
    v16[3] = &unk_1000204E0;
    v11 = v6;
    v17 = v11;
    v18 = &v20;
    v19 = &v24;
    objc_msgSend(v10, "setAccountSetting:setting:reply:", v15, v7, v16);

    v9 = v21;
  }
  while (*((_BYTE *)v21 + 24));
  v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)disableWalrusWithArguments:(id)a3 timeout:(double)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t *v9;
  void *v10;
  id v11;
  int v12;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v15 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = -86;
  v7 = objc_alloc_init((Class)OTAccountSettings);
  v8 = objc_alloc_init((Class)OTWalrus);
  objc_msgSend(v8, "setEnabled:", 0);
  objc_msgSend(v7, "setWalrus:", v8);
  v14 = v8;
  v9 = v21;
  do
  {
    *((_BYTE *)v9 + 24) = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control", v14));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E41C;
    v16[3] = &unk_1000204E0;
    v11 = v6;
    v17 = v11;
    v18 = &v20;
    v19 = &v24;
    objc_msgSend(v10, "setAccountSetting:setting:reply:", v15, v7, v16);

    v9 = v21;
  }
  while (*((_BYTE *)v21 + 24));
  v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)fetchAccountSettingsWithArguments:(id)a3 json:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  _QWORD v10[5];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E1B0;
  v10[3] = &unk_100020720;
  v11 = a4;
  v10[4] = &v12;
  objc_msgSend(v7, "fetchAccountSettings:reply:", v6, v10);

  v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)fetchAccountWideSettingsWithArguments:(id)a3 useDefault:(BOOL)a4 forceFetch:(BOOL)a5 json:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FILE *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  const __CFString *v31;
  id v32;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "makeConfigurationContext"));
  if (v8)
  {
    v28 = 0;
    v11 = (id *)&v28;
    v12 = objc_claimAutoreleasedReturnValue(+[OTClique fetchAccountWideSettingsDefaultWithForceFetch:configuration:error:](OTClique, "fetchAccountWideSettingsDefaultWithForceFetch:configuration:error:", v7, v10, &v28));
  }
  else
  {
    v27 = 0;
    v11 = (id *)&v27;
    v12 = objc_claimAutoreleasedReturnValue(+[OTClique fetchAccountWideSettingsWithForceFetch:configuration:error:](OTClique, "fetchAccountWideSettingsWithForceFetch:configuration:error:", v7, v10, &v27));
  }
  v13 = (void *)v12;
  v14 = *v11;

  if (v14)
  {
    if (v6)
    {
      v31 = CFSTR("error");
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
      v32 = v15;
      v16 = 1;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      sub_10000D9F8(v17);

    }
    else
    {
      v22 = __stderrp;
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description")));
      fprintf(v22, "Failed to fetch account wide settings: %s\n", (const char *)objc_msgSend(v15, "UTF8String"));
      v16 = 1;
    }
  }
  else
  {
    if (v6)
    {
      v29[0] = CFSTR("walrus");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "walrus"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v18, "enabled")));
      v29[1] = CFSTR("webAccess");
      v30[0] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "webAccess"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v20, "enabled")));
      v30[1] = v21;
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));

      sub_10000D9F8(v15);
    }
    else
    {
      puts("successfully fetched account wide settings!");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "walrus"));
      if (objc_msgSend(v23, "enabled"))
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      printf("walrus enabled? %s\n", (const char *)-[__CFString UTF8String](v24, "UTF8String"));

      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "webAccess"));
      if (objc_msgSend(v15, "enabled"))
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      printf("web access enabled? %s\n", (const char *)-[__CFString UTF8String](v25, "UTF8String"));
    }
    v16 = 0;
  }

  return v16;
}

- (int)setMachineIDOverride:(id)a3 machineID:(id)a4 json:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  _QWORD v13[5];
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v8 = a3;
  v9 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000E098;
  v13[3] = &unk_100020608;
  v14 = a5;
  v13[4] = &v15;
  objc_msgSend(v10, "setMachineIDOverride:machineID:reply:", v8, v9, v13);

  v11 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (int)printAccountMetadataWithArguments:(id)a3 json:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  BOOL v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DF48;
  v9[3] = &unk_100020740;
  v10 = a4;
  objc_msgSend(v7, "getAccountMetadata:reply:", v6, v9);

  return 1;
}

- (int)rerollWithArguments:(id)a3 json:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  _QWORD v10[5];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D8E0;
  v10[3] = &unk_100020608;
  v11 = a4;
  v10[4] = &v12;
  objc_msgSend(v7, "reroll:reply:", v6, v10);

  v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)reset:(id)a3 appleID:(id)a4 dsid:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  int v19;
  FILE *v20;
  id v21;
  id v23;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)OTConfigurationContext);
  v11 = sub_10000D6B4(v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v10, "setPasswordEquivalentToken:", v12);
  objc_msgSend(v10, "setAuthenticationAppleID:", v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "altDSID"));
  objc_msgSend(v10, "setAltDSID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
  objc_msgSend(v10, "setContext:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerName"));
  objc_msgSend(v10, "setContainerName:", v15);

  v23 = 0;
  v16 = +[OTClique resetAcountData:error:](OTClique, "resetAcountData:error:", v10, &v23);
  v17 = v23;
  v18 = v17;
  if (v17 || (v16 & 1) == 0)
  {
    v20 = __stderrp;
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description")));
    fprintf(v20, "Failed to wipe account data: %s\n", (const char *)objc_msgSend(v21, "UTF8String"));

    v19 = 1;
  }
  else
  {
    puts("Account data wiped.");
    v19 = 0;
  }

  return v19;
}

- (OTControl)control
{
  return (OTControl *)objc_getProperty(self, a2, 8, 1);
}

- (void)setControl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
}

+ (id)annotateStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextDump")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextDump")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("contextDump"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("self")));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("self")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dynamicInfo")));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dynamicInfo")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("included")));
        if (v12)
        {
          v13 = objc_alloc((Class)NSSet);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("included")));
          v34 = objc_msgSend(v13, "initWithArray:", v14);

        }
        else
        {
          v34 = objc_alloc_init((Class)NSSet);
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("excluded")));
        if (v16)
        {
          v17 = objc_alloc((Class)NSSet);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("excluded")));
          v19 = objc_msgSend(v17, "initWithArray:", v18);

        }
        else
        {
          v19 = objc_alloc_init((Class)NSSet);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("custodian_recovery_keys")));
        if (v20)
        {
          v30 = v9;
          v32 = v4;
          v33 = v3;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v31 = v7;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("custodian_recovery_keys")));
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(_QWORD *)v36 != v25)
                  objc_enumerationMutation(v22);
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i)));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("peerID")));
                if (objc_msgSend(v34, "containsObject:", v28))
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("trusted_by_self"));
                if (objc_msgSend(v19, "containsObject:", v28))
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("distrusted_by_self"));
                objc_msgSend(v21, "addObject:", v27);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
            }
            while (v24);
          }

          v7 = v31;
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v21, CFSTR("custodian_recovery_keys"));
          v4 = v32;
          v15 = v32;

          v3 = v33;
          v9 = v30;
        }
        else
        {
          v15 = v3;
        }

      }
      else
      {
        v15 = v3;
      }

    }
    else
    {
      v15 = v3;
    }

  }
  else
  {
    v15 = v3;
  }

  return v15;
}

@end
