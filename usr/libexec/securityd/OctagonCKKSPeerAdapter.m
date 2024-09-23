@implementation OctagonCKKSPeerAdapter

- (OctagonCKKSPeerAdapter)initWithPeerID:(id)a3 specificUser:(id)a4 personaAdapter:(id)a5 cuttlefishXPC:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OctagonCKKSPeerAdapter *v15;
  uint64_t v16;
  NSString *providerID;
  CKKSListenerCollection *v18;
  CKKSListenerCollection *peerChangeListeners;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)OctagonCKKSPeerAdapter;
  v15 = -[OctagonCKKSPeerAdapter init](&v21, "init");
  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[OctagonCKKSPeerAdapter:%@]"), v11));
    providerID = v15->_providerID;
    v15->_providerID = (NSString *)v16;

    objc_storeStrong((id *)&v15->_peerID, a3);
    objc_storeStrong((id *)&v15->_specificUser, a4);
    objc_storeStrong((id *)&v15->_personaAdapter, a5);
    objc_storeStrong((id *)&v15->_cuttlefishXPCWrapper, a6);
    v18 = -[CKKSListenerCollection initWithName:]([CKKSListenerCollection alloc], "initWithName:", CFSTR("ckks-sos"));
    peerChangeListeners = v15->_peerChangeListeners;
    v15->_peerChangeListeners = v18;

    v15->_essential = 1;
  }

  return v15;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter peerID](self, "peerID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonCKKSPeerAdapter: %@ e:%d>"), v3, -[OctagonCKKSPeerAdapter essential](self, "essential")));

  return (NSString *)v4;
}

- (id)fetchIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100055DFC;
  v21 = sub_100055E0C;
  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personaUniqueString"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100056650;
  v13[3] = &unk_1002ED5E8;
  v10 = v6;
  v14 = v10;
  v15 = &v17;
  v16 = a4;
  objc_msgSend(v7, "performBlockWithPersonaIdentifier:block:", v9, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)fetchSelfPeers:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100055DFC;
  v15 = sub_100055E0C;
  v16 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueString"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000563C0;
  v10[3] = &unk_1002ED5E8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  objc_msgSend(v5, "performBlockWithPersonaIdentifier:block:", v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)fetchTrustedPeers:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100055DFC;
  v15 = sub_100055E0C;
  v16 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueString"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100055F94;
  v10[3] = &unk_1002ED5E8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  objc_msgSend(v5, "performBlockWithPersonaIdentifier:block:", v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)registerForPeerChangeUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueString"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100055F54;
  v9[3] = &unk_1002E9728;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "performBlockWithPersonaIdentifier:block:", v7, v9);

}

- (void)sendSelfPeerChangedUpdate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personaUniqueString"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100055ED4;
  v6[3] = &unk_1002EC350;
  v6[4] = self;
  objc_msgSend(v3, "performBlockWithPersonaIdentifier:block:", v5, v6);

}

- (void)sendTrustedPeerSetChangedUpdate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personaUniqueString"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100055E54;
  v6[3] = &unk_1002EC350;
  v6[4] = self;
  objc_msgSend(v3, "performBlockWithPersonaIdentifier:block:", v5, v6);

}

- (id)currentState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100055DFC;
  v13 = sub_100055E0C;
  v14 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personaUniqueString"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100055E14;
  v8[3] = &unk_1002EB140;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "performBlockWithPersonaIdentifier:block:", v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TPSpecificUser)specificUser
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 32, 1);
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 40, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersonaAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CKKSListenerCollection)peerChangeListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeerChangeListeners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerChangeListeners, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_cuttlefishXPCWrapper, 0);
  objc_storeStrong((id *)&self->_specificUser, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
}

@end
