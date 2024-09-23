@implementation TrustedPeersHelperPeerState

- (TrustedPeersHelperPeerState)initWithPeerID:(id)a3 isPreapproved:(BOOL)a4 status:(unint64_t)a5 memberChanges:(BOOL)a6 unknownMachineIDs:(BOOL)a7 osVersion:(id)a8 walrus:(id)a9 webAccess:(id)a10
{
  id v15;
  id v16;
  id v17;
  TrustedPeersHelperPeerState *v18;
  TrustedPeersHelperPeerState *v19;
  id v23;
  objc_super v24;

  v23 = a3;
  v15 = a8;
  v16 = a9;
  v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)TrustedPeersHelperPeerState;
  v18 = -[TrustedPeersHelperPeerState init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerID, a3);
    v19->_identityIsPreapproved = a4;
    v19->_peerStatus = a5;
    v19->_memberChanges = a6;
    v19->_unknownMachineIDsPresent = a7;
    objc_storeStrong((id *)&v19->_osVersion, a8);
    objc_storeStrong((id *)&v19->_walrus, a9);
    objc_storeStrong((id *)&v19->_webAccess, a10);
  }

  return v19;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState peerID](self, "peerID"));
  v4 = -[TrustedPeersHelperPeerState identityIsPreapproved](self, "identityIsPreapproved");
  v5 = TPPeerStatusToString(-[TrustedPeersHelperPeerState peerStatus](self, "peerStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[TrustedPeersHelperPeerState memberChanges](self, "memberChanges"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[TrustedPeersHelperPeerState unknownMachineIDsPresent](self, "unknownMachineIDsPresent"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState osVersion](self, "osVersion"));
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("unknown");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState walrus](self, "walrus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState webAccess](self, "webAccess"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TPHPeerState: %@ preapproved:%d status:%@ memberChanges: %@ unk. mIDs: %@ osVersion: %@ walrus: %@ webAccess: %@>"), v3, v4, v6, v7, v8, v11, v12, v13));

  return v14;
}

- (TrustedPeersHelperPeerState)initWithCoder:(id)a3
{
  id v4;
  TrustedPeersHelperPeerState *v5;
  id v6;
  uint64_t v7;
  NSString *peerID;
  id v9;
  uint64_t v10;
  NSString *osVersion;
  id v12;
  uint64_t v13;
  TPPBPeerStableInfoSetting *walrus;
  id v15;
  uint64_t v16;
  TPPBPeerStableInfoSetting *webAccess;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TrustedPeersHelperPeerState;
  v5 = -[TrustedPeersHelperPeerState init](&v19, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("peerID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    peerID = v5->_peerID;
    v5->_peerID = (NSString *)v7;

    v5->_identityIsPreapproved = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("identityIsPreapproved"));
    v5->_peerStatus = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("peerStatus"));
    v5->_memberChanges = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("memberChanges")) != 0;
    v5->_unknownMachineIDsPresent = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("unknownMachineIDs")) != 0;
    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("osVersion"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(TPPBPeerStableInfoSetting), CFSTR("walrus"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    walrus = v5->_walrus;
    v5->_walrus = (TPPBPeerStableInfoSetting *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(TPPBPeerStableInfoSetting), CFSTR("webAccess"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    webAccess = v5->_webAccess;
    v5->_webAccess = (TPPBPeerStableInfoSetting *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState peerID](self, "peerID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("peerID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[TrustedPeersHelperPeerState identityIsPreapproved](self, "identityIsPreapproved"), CFSTR("identityIsPreapproved"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[TrustedPeersHelperPeerState peerStatus](self, "peerStatus"), CFSTR("peerStatus"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[TrustedPeersHelperPeerState memberChanges](self, "memberChanges"), CFSTR("memberChanges"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[TrustedPeersHelperPeerState unknownMachineIDsPresent](self, "unknownMachineIDsPresent"), CFSTR("unknownMachineIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState osVersion](self, "osVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("osVersion"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState walrus](self, "walrus"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("walrus"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState webAccess](self, "webAccess"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("webAccess"));

}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)identityIsPreapproved
{
  return self->_identityIsPreapproved;
}

- (void)setIdentityIsPreapproved:(BOOL)a3
{
  self->_identityIsPreapproved = a3;
}

- (unint64_t)peerStatus
{
  return self->_peerStatus;
}

- (void)setPeerStatus:(unint64_t)a3
{
  self->_peerStatus = a3;
}

- (BOOL)memberChanges
{
  return self->_memberChanges;
}

- (void)setMemberChanges:(BOOL)a3
{
  self->_memberChanges = a3;
}

- (BOOL)unknownMachineIDsPresent
{
  return self->_unknownMachineIDsPresent;
}

- (void)setUnknownMachineIDsPresent:(BOOL)a3
{
  self->_unknownMachineIDsPresent = a3;
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TPPBPeerStableInfoSetting)walrus
{
  return (TPPBPeerStableInfoSetting *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWalrus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (TPPBPeerStableInfoSetting)webAccess
{
  return (TPPBPeerStableInfoSetting *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWebAccess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAccess, 0);
  objc_storeStrong((id *)&self->_walrus, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
