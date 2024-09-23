@implementation TrustedPeersHelperEgoPeerStatus

- (TrustedPeersHelperEgoPeerStatus)initWithEgoPeerID:(id)a3 egoPeerMachineID:(id)a4 status:(unint64_t)a5 viablePeerCountsByModelID:(id)a6 peerCountsByMachineID:(id)a7 isExcluded:(BOOL)a8 isLocked:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  TrustedPeersHelperEgoPeerStatus *v19;
  TrustedPeersHelperEgoPeerStatus *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v32.receiver = self;
  v32.super_class = (Class)TrustedPeersHelperEgoPeerStatus;
  v19 = -[TrustedPeersHelperEgoPeerStatus init](&v32, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_egoPeerID, a3);
    objc_storeStrong((id *)&v20->_egoPeerMachineID, a4);
    v20->_egoStatus = a5;
    objc_storeStrong((id *)&v20->_viablePeerCountsByModelID, a6);
    objc_storeStrong((id *)&v20->_peerCountsByMachineID, a7);
    v20->_numberOfPeersInOctagon = 0;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allValues"));
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          v20->_numberOfPeersInOctagon += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue");
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v23);
    }

    v20->_isExcluded = a8;
    v20->_isLocked = a9;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus egoPeerID](self, "egoPeerID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus egoPeerMachineID](self, "egoPeerMachineID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TPHEgoPeerState: %@ (mid:%@)>"), v3, v4));

  return v5;
}

- (TrustedPeersHelperEgoPeerStatus)initWithCoder:(id)a3
{
  id v4;
  TrustedPeersHelperEgoPeerStatus *v5;
  id v6;
  uint64_t v7;
  NSString *egoPeerID;
  id v9;
  uint64_t v10;
  NSString *egoPeerMachineID;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *viablePeerCountsByModelID;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *peerCountsByMachineID;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _QWORD v31[3];
  _BYTE v32[128];
  _QWORD v33[3];

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)TrustedPeersHelperEgoPeerStatus;
  v5 = -[TrustedPeersHelperEgoPeerStatus init](&v30, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("peerID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    egoPeerID = v5->_egoPeerID;
    v5->_egoPeerID = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("mID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    egoPeerMachineID = v5->_egoPeerMachineID;
    v5->_egoPeerMachineID = (NSString *)v10;

    v5->_egoStatus = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("egoStatus"));
    v33[0] = objc_opt_class(NSDictionary);
    v33[1] = objc_opt_class(NSString);
    v33[2] = objc_opt_class(NSNumber);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 3));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("viablePeerCountsByModelID")));
    viablePeerCountsByModelID = v5->_viablePeerCountsByModelID;
    v5->_viablePeerCountsByModelID = (NSDictionary *)v14;

    v5->_numberOfPeersInOctagon = 0;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](v5->_viablePeerCountsByModelID, "allValues", 0));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v5->_numberOfPeersInOctagon += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v20), "unsignedIntegerValue");
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v18);
    }

    v31[0] = objc_opt_class(NSDictionary);
    v31[1] = objc_opt_class(NSString);
    v31[2] = objc_opt_class(NSNumber);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 3));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("peerCountsByMachineID")));
    peerCountsByMachineID = v5->_peerCountsByMachineID;
    v5->_peerCountsByMachineID = (NSDictionary *)v23;

    v5->_isExcluded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isExcluded"));
    v5->_isLocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocked"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus egoPeerID](self, "egoPeerID"));
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("peerID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus egoPeerMachineID](self, "egoPeerMachineID"));
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("mID"));

  objc_msgSend(v8, "encodeInt64:forKey:", -[TrustedPeersHelperEgoPeerStatus egoStatus](self, "egoStatus"), CFSTR("egoStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus viablePeerCountsByModelID](self, "viablePeerCountsByModelID"));
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("viablePeerCountsByModelID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus peerCountsByMachineID](self, "peerCountsByMachineID"));
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("peerCountsByMachineID"));

  objc_msgSend(v8, "encodeBool:forKey:", -[TrustedPeersHelperEgoPeerStatus isExcluded](self, "isExcluded"), CFSTR("isExcluded"));
  objc_msgSend(v8, "encodeBool:forKey:", -[TrustedPeersHelperEgoPeerStatus isLocked](self, "isLocked"), CFSTR("isLocked"));

}

- (unint64_t)egoStatus
{
  return self->_egoStatus;
}

- (void)setEgoStatus:(unint64_t)a3
{
  self->_egoStatus = a3;
}

- (NSString)egoPeerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEgoPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)egoPeerMachineID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEgoPeerMachineID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)numberOfPeersInOctagon
{
  return self->_numberOfPeersInOctagon;
}

- (void)setNumberOfPeersInOctagon:(unint64_t)a3
{
  self->_numberOfPeersInOctagon = a3;
}

- (NSDictionary)viablePeerCountsByModelID
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setViablePeerCountsByModelID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)peerCountsByMachineID
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeerCountsByMachineID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isExcluded
{
  return self->_isExcluded;
}

- (void)setIsExcluded:(BOOL)a3
{
  self->_isExcluded = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerCountsByMachineID, 0);
  objc_storeStrong((id *)&self->_viablePeerCountsByModelID, 0);
  objc_storeStrong((id *)&self->_egoPeerMachineID, 0);
  objc_storeStrong((id *)&self->_egoPeerID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
