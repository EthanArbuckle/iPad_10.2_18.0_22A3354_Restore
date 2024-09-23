@implementation TUThumperCTCapabilitiesState

- (TUThumperCTCapabilitiesState)init
{
  TUThumperCTCapabilitiesState *v2;
  NSSet *v3;
  NSSet *approvedSecondaryDeviceIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUThumperCTCapabilitiesState;
  v2 = -[TUThumperCTCapabilitiesState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    approvedSecondaryDeviceIDs = v2->_approvedSecondaryDeviceIDs;
    v2->_approvedSecondaryDeviceIDs = v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_approvedSecondaryDeviceIDs, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TUThumperCTCapabilitiesState;
  v4 = a3;
  -[TUCTCapabilitiesState encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  -[TUThumperCTCapabilitiesState accountID](self, "accountID", v17.receiver, v17.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[TUThumperCTCapabilitiesState isApproved](self, "isApproved");
  NSStringFromSelector(sel_isApproved);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  -[TUThumperCTCapabilitiesState approvedSecondaryDeviceIDs](self, "approvedSecondaryDeviceIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_approvedSecondaryDeviceIDs);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[TUThumperCTCapabilitiesState isAssociated](self, "isAssociated");
  NSStringFromSelector(sel_isAssociated);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  -[TUThumperCTCapabilitiesState localDeviceID](self, "localDeviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localDeviceID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  v15 = -[TUThumperCTCapabilitiesState supportsDefaultPairedDevice](self, "supportsDefaultPairedDevice");
  NSStringFromSelector(sel_supportsDefaultPairedDevice);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

}

- (BOOL)supportsDefaultPairedDevice
{
  return self->_supportsDefaultPairedDevice;
}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (BOOL)isAssociated
{
  return self->_associated;
}

- (BOOL)isApproved
{
  return self->_approved;
}

- (NSSet)approvedSecondaryDeviceIDs
{
  return self->_approvedSecondaryDeviceIDs;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (TUThumperCTCapabilitiesState)initWithCoder:(id)a3
{
  id v4;
  TUThumperCTCapabilitiesState *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *accountID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSSet *approvedSecondaryDeviceIDs;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *localDeviceID;
  void *v22;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TUThumperCTCapabilitiesState;
  v5 = -[TUCTCapabilitiesState initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_accountID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    NSStringFromSelector(sel_isApproved);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_approved = objc_msgSend(v4, "decodeBoolForKey:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_approvedSecondaryDeviceIDs);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    approvedSecondaryDeviceIDs = v5->_approvedSecondaryDeviceIDs;
    v5->_approvedSecondaryDeviceIDs = (NSSet *)v15;

    NSStringFromSelector(sel_isAssociated);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_associated = objc_msgSend(v4, "decodeBoolForKey:", v17);

    v18 = objc_opt_class();
    NSStringFromSelector(sel_localDeviceID);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    localDeviceID = v5->_localDeviceID;
    v5->_localDeviceID = (NSString *)v20;

    NSStringFromSelector(sel_supportsDefaultPairedDevice);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsDefaultPairedDevice = objc_msgSend(v4, "decodeBoolForKey:", v22);

  }
  return v5;
}

- (TUThumperCTCapabilitiesState)initWithCapabilityInfo:(id)a3
{
  id v4;
  TUThumperCTCapabilitiesState *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *accountID;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *localDeviceID;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  NSSet *approvedSecondaryDeviceIDs;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TUThumperCTCapabilitiesState;
  v5 = -[TUCTCapabilitiesState initWithCapabilityInfo:](&v36, sel_initWithCapabilityInfo_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA78E0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA78E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v9;

    v11 = *MEMORY[0x1E0CA78F8];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA78F8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    localDeviceID = v5->_localDeviceID;
    v5->_localDeviceID = (NSString *)v13;

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA78F0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0CA7900];
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7900]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
LABEL_8:
        if (objc_msgSend(v19, "count"))
        {
          v31 = v16;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v19, "count"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v30 = v19;
          v21 = v19;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v33 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "objectForKeyedSubscript:", v11, v30);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (v26)
                  objc_msgSend(v20, "addObject:", v26);

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            }
            while (v23);
          }

          v27 = objc_msgSend(v20, "copy");
          approvedSecondaryDeviceIDs = v5->_approvedSecondaryDeviceIDs;
          v5->_approvedSecondaryDeviceIDs = (NSSet *)v27;

          v19 = v30;
          v16 = v31;
        }

        goto LABEL_20;
      }
    }
    else
    {
      v18 = *MEMORY[0x1E0CA7900];
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_21:

  return v5;
}

- (BOOL)isEqualToCapabilitiesState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUThumperCTCapabilitiesState;
  if (-[TUCTCapabilitiesState isEqualToCapabilitiesState:](&v16, sel_isEqualToCapabilitiesState_, v4))
  {
    -[TUThumperCTCapabilitiesState accountID](self, "accountID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6)
      && (v7 = -[TUThumperCTCapabilitiesState isApproved](self, "isApproved"),
          v7 == objc_msgSend(v4, "isApproved")))
    {
      -[TUThumperCTCapabilitiesState approvedSecondaryDeviceIDs](self, "approvedSecondaryDeviceIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "approvedSecondaryDeviceIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10)
        && (v11 = -[TUThumperCTCapabilitiesState isAssociated](self, "isAssociated"),
            v11 == objc_msgSend(v4, "isAssociated")))
      {
        -[TUThumperCTCapabilitiesState localDeviceID](self, "localDeviceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localDeviceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v12, (uint64_t)v13))
        {
          v14 = -[TUThumperCTCapabilitiesState supportsDefaultPairedDevice](self, "supportsDefaultPairedDevice");
          v8 = v14 ^ objc_msgSend(v4, "supportsDefaultPairedDevice") ^ 1;
        }
        else
        {
          LOBYTE(v8) = 0;
        }

      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUThumperCTCapabilitiesState;
  v5 = -[TUCTCapabilitiesState copyWithZone:](&v13, sel_copyWithZone_);
  -[TUThumperCTCapabilitiesState approvedSecondaryDeviceIDs](self, "approvedSecondaryDeviceIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[6];
  v5[6] = v7;

  -[TUThumperCTCapabilitiesState localDeviceID](self, "localDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = (void *)v5[8];
  v5[8] = v10;

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v16.receiver = self;
  v16.super_class = (Class)TUThumperCTCapabilitiesState;
  -[TUCTCapabilitiesState description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_accountID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUThumperCTCapabilitiesState accountID](self, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@=%@"), v6, v7);

  NSStringFromSelector(sel_isApproved);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@=%d"), v8, -[TUThumperCTCapabilitiesState isApproved](self, "isApproved"));

  NSStringFromSelector(sel_isAssociated);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@=%d"), v9, -[TUThumperCTCapabilitiesState isAssociated](self, "isAssociated"));

  NSStringFromSelector(sel_approvedSecondaryDeviceIDs);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUThumperCTCapabilitiesState approvedSecondaryDeviceIDs](self, "approvedSecondaryDeviceIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@=%@"), v10, v11);

  NSStringFromSelector(sel_localDeviceID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUThumperCTCapabilitiesState localDeviceID](self, "localDeviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@=%@"), v12, v13);

  NSStringFromSelector(sel_supportsDefaultPairedDevice);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@=%d"), v14, -[TUThumperCTCapabilitiesState supportsDefaultPairedDevice](self, "supportsDefaultPairedDevice"));

  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return (NSString *)v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TUThumperCTCapabilitiesState;
  v3 = -[TUCTCapabilitiesState hash](&v17, sel_hash);
  -[TUThumperCTCapabilitiesState accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  if (-[TUThumperCTCapabilitiesState isApproved](self, "isApproved"))
    v6 = 1231;
  else
    v6 = 1237;
  v7 = v5 ^ v6;
  -[TUThumperCTCapabilitiesState approvedSecondaryDeviceIDs](self, "approvedSecondaryDeviceIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  if (-[TUThumperCTCapabilitiesState isAssociated](self, "isAssociated"))
    v10 = 1231;
  else
    v10 = 1237;
  v11 = v9 ^ v10 ^ v3;
  -[TUThumperCTCapabilitiesState localDeviceID](self, "localDeviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  if (-[TUThumperCTCapabilitiesState supportsDefaultPairedDevice](self, "supportsDefaultPairedDevice"))
    v14 = 1231;
  else
    v14 = 1237;
  v15 = v11 ^ v13 ^ v14;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  TUThumperCTCapabilitiesState *v4;
  BOOL v5;

  v4 = (TUThumperCTCapabilitiesState *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUThumperCTCapabilitiesState isEqualToCapabilitiesState:](self, "isEqualToCapabilitiesState:", v4);
  }

  return v5;
}

- (id)publiclyAccessibleCopy
{
  return -[TUThumperCTCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:", 0);
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUThumperCTCapabilitiesState;
  -[TUCTCapabilitiesState publiclyAccessibleCopyWithZone:](&v10, sel_publiclyAccessibleCopyWithZone_);
  v5 = objc_claimAutoreleasedReturnValue();
  -[TUThumperCTCapabilitiesState accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v7;

  *(_BYTE *)(v5 + 40) = -[TUThumperCTCapabilitiesState isApproved](self, "isApproved");
  *(_BYTE *)(v5 + 41) = -[TUThumperCTCapabilitiesState isAssociated](self, "isAssociated");
  *(_BYTE *)(v5 + 42) = -[TUThumperCTCapabilitiesState supportsDefaultPairedDevice](self, "supportsDefaultPairedDevice");
  return (id)v5;
}

+ (id)unarchivedObjectClasses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TUThumperCTCapabilitiesState;
  objc_msgSendSuper2(&v10, sel_unarchivedObjectClasses);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setApproved:(BOOL)a3
{
  self->_approved = a3;
}

- (void)setApprovedSecondaryDeviceIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAssociated:(BOOL)a3
{
  self->_associated = a3;
}

- (void)setLocalDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setSupportsDefaultPairedDevice:(BOOL)a3
{
  self->_supportsDefaultPairedDevice = a3;
}

@end
