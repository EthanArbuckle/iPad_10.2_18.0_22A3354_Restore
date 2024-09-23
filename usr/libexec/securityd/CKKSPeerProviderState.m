@implementation CKKSPeerProviderState

- (CKKSPeerProviderState)initWithPeerProviderID:(id)a3 essential:(BOOL)a4 selfPeers:(id)a5 selfPeersError:(id)a6 trustedPeers:(id)a7 trustedPeersError:(id)a8
{
  id v15;
  id v16;
  id v17;
  CKKSPeerProviderState *v18;
  CKKSPeerProviderState *v19;
  NSSet *v20;
  NSSet *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSSet *currentTrustedPeerIDs;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];

  v30 = a3;
  v29 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v35.receiver = self;
  v35.super_class = (Class)CKKSPeerProviderState;
  v18 = -[CKKSPeerProviderState init](&v35, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerProviderID, a3);
    v19->_essential = a4;
    objc_storeStrong((id *)&v19->_currentSelfPeers, a5);
    objc_storeStrong((id *)&v19->_currentSelfPeersError, a6);
    objc_storeStrong((id *)&v19->_currentTrustedPeers, a7);
    objc_storeStrong((id *)&v19->_currentTrustedPeersError, a8);
    if (v19->_currentTrustedPeers)
    {
      v20 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set", v29, v30));
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v21 = v19->_currentTrustedPeers;
      v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v32;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1)
                                                                               + 8 * (_QWORD)v25), "peerID"));
            -[NSSet addObject:](v20, "addObject:", v26);

            v25 = (char *)v25 + 1;
          }
          while (v23 != v25);
          v23 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v23);
      }

      currentTrustedPeerIDs = v19->_currentTrustedPeerIDs;
      v19->_currentTrustedPeerIDs = v20;

    }
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState peerProviderID](self, "peerProviderID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeers](self, "currentSelfPeers"));
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeersError](self, "currentSelfPeersError"));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1002EE888;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeers](self, "currentTrustedPeers"));
  v9 = objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeersError](self, "currentTrustedPeersError"));
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1002EE888;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSPeerProviderState(%@): %@%@ %@%@>"), v3, v4, v7, v8, v11));

  return v12;
}

- (BOOL)unwrapKey:(id)a3 fromShares:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  NSObject *v46;
  CKKSPeerProviderState *v47;
  id v48;
  void *j;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  BOOL v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  char *v73;
  void *v74;
  id v75;
  id *v76;
  id v77;
  uint64_t v78;
  char *v79;
  id obj;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  id v85;
  CKKSPeerProviderState *v86;
  void *context;
  void *contexta;
  void *v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  id v107;
  __int16 v108;
  id v109;
  __int16 v110;
  id v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];

  v85 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeers](self, "currentSelfPeers"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentSelf"));
  if (!v10)
  {

LABEL_10:
    v16 = v85;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "zoneName"));
    v25 = sub_10000BDF4(CFSTR("ckksshare"), v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState peerProviderID](self, "peerProviderID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeersError](self, "currentSelfPeersError"));
      *(_DWORD *)buf = 138412546;
      v105 = v27;
      v106 = 2112;
      v107 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Don't have self peers for %@: %@", buf, 0x16u);

      v16 = v85;
    }

    if (a5)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeersError](self, "currentSelfPeersError"));
      v22 = CFSTR("Key unwrap failed");
      v23 = 38;
      goto LABEL_14;
    }
LABEL_16:
    v29 = 0;
    goto LABEL_17;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeersError](self, "currentSelfPeersError"));

  if (v12)
    goto LABEL_10;
  v13 = objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeers](self, "currentTrustedPeers"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeersError](self, "currentTrustedPeersError"));

    if (!v15)
    {
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeers](self, "currentSelfPeers"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allSelves"));

      obj = v32;
      v16 = v85;
      v77 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
      v21 = 0;
      if (v77)
      {
        v78 = *(_QWORD *)v101;
        v81 = v8;
        v76 = a5;
        v86 = self;
        do
        {
          context = v21;
          v33 = 0;
          do
          {
            if (*(_QWORD *)v101 != v78)
              objc_enumerationMutation(obj);
            v79 = (char *)v33;
            v34 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v33);
            v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v96 = 0u;
            v97 = 0u;
            v98 = 0u;
            v99 = 0u;
            v35 = v81;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v97;
              do
              {
                for (i = 0; i != v37; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v97 != v38)
                    objc_enumerationMutation(v35);
                  v40 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i);
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "share"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "receiverPeerID"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "peerID"));
                  v44 = objc_msgSend(v42, "isEqualToString:", v43);

                  if (v44)
                    objc_msgSend(v89, "addObject:", v40);
                }
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
              }
              while (v37);
            }

            v45 = v89;
            if (objc_msgSend(v89, "count"))
            {
              v94 = 0u;
              v95 = 0u;
              v92 = 0u;
              v93 = 0u;
              v46 = v89;
              v16 = v85;
              v47 = v86;
              v84 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
              if (v84)
              {
                v83 = *(_QWORD *)v93;
                v48 = context;
                while (2)
                {
                  for (j = 0; j != v84; j = (char *)j + 1)
                  {
                    v50 = v48;
                    if (*(_QWORD *)v93 != v83)
                      objc_enumerationMutation(v46);
                    v51 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)j);
                    contexta = objc_autoreleasePoolPush();
                    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "zoneName"));
                    v53 = sub_10000BDF4(CFSTR("ckksshare"), v52);
                    v54 = objc_claimAutoreleasedReturnValue(v53);

                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v105 = v51;
                      v106 = 2112;
                      v107 = v34;
                      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Checking possible TLK share %@ as %@", buf, 0x16u);
                    }

                    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeers](v47, "currentTrustedPeers"));
                    v91 = 0;
                    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "recoverTLK:trustedPeers:error:", v34, v55, &v91));
                    v57 = v91;

                    if (v56)
                      v58 = v57 == 0;
                    else
                      v58 = 0;
                    if (v58)
                    {
                      v82 = v50;
                      v66 = v46;
                      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "aessivkey"));
                      v90 = 0;
                      v68 = objc_msgSend(v85, "trySelfWrappedKeyCandidate:error:", v67, &v90);
                      v57 = v90;

                      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "zoneName"));
                      v70 = sub_10000BDF4(CFSTR("ckksshare"), v69);
                      v64 = objc_claimAutoreleasedReturnValue(v70);

                      if (v68 && !v57)
                      {
                        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412802;
                          v105 = v51;
                          v106 = 2112;
                          v107 = v85;
                          v108 = 2112;
                          v109 = v34;
                          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "TLKShare(%@) unlocked TLK(%@) as %@", buf, 0x20u);
                        }

                        objc_autoreleasePoolPop(contexta);
                        v29 = 1;
                        v21 = v82;
                        v8 = v81;
                        goto LABEL_66;
                      }
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                      {
                        v71 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeers](v86, "currentSelfPeers"));
                        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "currentSelf"));
                        *(_DWORD *)buf = 138413058;
                        v105 = v51;
                        v106 = 2112;
                        v107 = v85;
                        v108 = 2112;
                        v109 = v72;
                        v110 = 2112;
                        v111 = v57;
                        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Unwrapped TLKShare(%@) does not unwrap proposed TLK(%@) as %@: %@", buf, 0x2Au);

                      }
                      v46 = v66;
                      v50 = v82;
                    }
                    else
                    {
                      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "zoneName"));
                      v60 = sub_10000BDF4(CFSTR("ckksshare"), v59);
                      v61 = objc_claimAutoreleasedReturnValue(v60);

                      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412802;
                        v105 = v51;
                        v106 = 2112;
                        v107 = v34;
                        v108 = 2112;
                        v109 = v57;
                        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Unable to unwrap TLKShare(%@) as %@: %@", buf, 0x20u);
                      }

                      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "zoneName"));
                      v63 = sub_10000BDF4(CFSTR("ckksshare"), v62);
                      v64 = objc_claimAutoreleasedReturnValue(v63);

                      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                      {
                        v65 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeers](v86, "currentTrustedPeers"));
                        *(_DWORD *)buf = 138412290;
                        v105 = v65;
                        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Current trust set: %@", buf, 0xCu);

                      }
                    }

                    v48 = v57;
                    objc_autoreleasePoolPop(contexta);
                    v47 = v86;
                  }
                  v84 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
                  if (v84)
                    continue;
                  break;
                }
                context = v48;
                v73 = v79;
                v45 = v89;
              }
              else
              {
                v73 = v79;
              }
            }
            else
            {
              v16 = v85;
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "zoneName"));
              v75 = sub_10000BDF4(CFSTR("ckksshare"), v74);
              v46 = objc_claimAutoreleasedReturnValue(v75);

              v73 = v79;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v105 = v34;
                v106 = 2112;
                v107 = v85;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "No CKKSTLKShares to %@ for %@", buf, 0x16u);
              }
            }

            v33 = v73 + 1;
            a5 = v76;
            v8 = v81;
          }
          while (v33 != v77);
          v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
          v21 = context;
        }
        while (v77);
      }

      if (a5)
      {
        obj = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No trusted TLKShares for %@"), v16));
        v29 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 35));
LABEL_66:

      }
      else
      {
        v29 = 0;
      }
      goto LABEL_15;
    }
  }
  v16 = v85;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "zoneName"));
  v18 = sub_10000BDF4(CFSTR("ckksshare"), v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeersError](self, "currentTrustedPeersError"));
    *(_DWORD *)buf = 138412290;
    v105 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Don't have trusted peers: %@", buf, 0xCu);

  }
  if (!a5)
    goto LABEL_16;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeersError](self, "currentTrustedPeersError"));
  v22 = CFSTR("No trusted peers");
  v23 = 24;
LABEL_14:
  v29 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), v23, v22, v21));
LABEL_15:

LABEL_17:
  return v29;
}

- (NSString)peerProviderID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPeerProviderID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (CKKSSelves)currentSelfPeers
{
  return self->_currentSelfPeers;
}

- (NSError)currentSelfPeersError
{
  return self->_currentSelfPeersError;
}

- (NSSet)currentTrustedPeers
{
  return self->_currentTrustedPeers;
}

- (NSSet)currentTrustedPeerIDs
{
  return self->_currentTrustedPeerIDs;
}

- (NSError)currentTrustedPeersError
{
  return self->_currentTrustedPeersError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTrustedPeersError, 0);
  objc_storeStrong((id *)&self->_currentTrustedPeerIDs, 0);
  objc_storeStrong((id *)&self->_currentTrustedPeers, 0);
  objc_storeStrong((id *)&self->_currentSelfPeersError, 0);
  objc_storeStrong((id *)&self->_currentSelfPeers, 0);
  objc_storeStrong((id *)&self->_peerProviderID, 0);
}

+ (id)noPeersState:(id)a3
{
  id v3;
  CKKSPeerProviderState *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CKKSPeerProviderState *v9;

  v3 = a3;
  v4 = [CKKSPeerProviderState alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerID"));
  v6 = objc_msgSend(v3, "essential");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 24, CFSTR("No current self peer available")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 24, CFSTR("No current trusted peers available")));
  v9 = -[CKKSPeerProviderState initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:](v4, "initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:", v5, v6, 0, v7, 0, v8);

  return v9;
}

+ (id)createFromProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  CKKSPeerProviderState *v9;
  void *v10;
  CKKSPeerProviderState *v11;
  id v13;
  id v14;

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v14 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchSelfPeers:", &v14));
  v6 = v14;
  v13 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchTrustedPeers:", &v13));
  v8 = v13;
  v9 = [CKKSPeerProviderState alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerID"));
  v11 = -[CKKSPeerProviderState initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:](v9, "initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:", v10, objc_msgSend(v3, "essential"), v5, v6, v7, v8);

  objc_autoreleasePoolPop(v4);
  return v11;
}

@end
