@implementation SPMemberCircleDataIntegrity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPMemberCircleDataIntegrity)initWithCircleRecord:(id)a3 sharedBeaconRecord:(id)a4 sharedBeaconNameRecord:(id)a5 sharedBeaconOwnerName:(id)a6 peerTrusts:(id)a7 sharedSecrets:(id)a8 keySyncRecord:(id)a9 observations:(id)a10 itemSharingKey:(id)a11 estimatedLocations:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  SPMemberCircleDataIntegrity *v22;
  SPMemberCircleDataIntegrity *v23;
  id obj;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v32 = a5;
  v26 = a6;
  v31 = a6;
  v27 = a7;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)SPMemberCircleDataIntegrity;
  v22 = -[SPMemberCircleDataIntegrity init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_circleRecord, a3);
    objc_storeStrong((id *)&v23->_sharedBeaconRecord, obj);
    objc_storeStrong((id *)&v23->_sharedBeaconNameRecord, a5);
    objc_storeStrong((id *)&v23->_sharedBeaconOwnerName, v26);
    objc_storeStrong((id *)&v23->_peerTrusts, v27);
    objc_storeStrong((id *)&v23->_sharedSecrets, a8);
    objc_storeStrong((id *)&v23->_keySyncRecord, a9);
    objc_storeStrong((id *)&v23->_observations, a10);
    objc_storeStrong((id *)&v23->_itemSharingKey, a11);
    objc_storeStrong((id *)&v23->_estimatedLocations, a12);
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SPMemberCircleDataIntegrity *v13;
  void *v15;
  SPMemberCircleDataIntegrity *v16;

  v16 = [SPMemberCircleDataIntegrity alloc];
  -[SPMemberCircleDataIntegrity circleRecord](self, "circleRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity sharedBeaconRecord](self, "sharedBeaconRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity sharedBeaconNameRecord](self, "sharedBeaconNameRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity sharedBeaconOwnerName](self, "sharedBeaconOwnerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity peerTrusts](self, "peerTrusts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity sharedSecrets](self, "sharedSecrets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity keySyncRecord](self, "keySyncRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity observations](self, "observations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity itemSharingKey](self, "itemSharingKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPMemberCircleDataIntegrity estimatedLocations](self, "estimatedLocations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SPMemberCircleDataIntegrity initWithCircleRecord:sharedBeaconRecord:sharedBeaconNameRecord:sharedBeaconOwnerName:peerTrusts:sharedSecrets:keySyncRecord:observations:itemSharingKey:estimatedLocations:](v16, "initWithCircleRecord:sharedBeaconRecord:sharedBeaconNameRecord:sharedBeaconOwnerName:peerTrusts:sharedSecrets:keySyncRecord:observations:itemSharingKey:estimatedLocations:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  SPDataIntegrityCheck *circleRecord;
  id v5;

  circleRecord = self->_circleRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", circleRecord, CFSTR("circleRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedBeaconRecord, CFSTR("sharedBeaconRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedBeaconNameRecord, CFSTR("sharedBeaconNameRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedBeaconOwnerName, CFSTR("sharedBeaconOwnerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerTrusts, CFSTR("peerTrusts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedSecrets, CFSTR("sharedSecrets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keySyncRecord, CFSTR("keySyncRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_observations, CFSTR("observations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemSharingKey, CFSTR("itemSharingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_estimatedLocations, CFSTR("estimatedLocations"));

}

- (SPMemberCircleDataIntegrity)initWithCoder:(id)a3
{
  id v4;
  SPDataIntegrityCheck *v5;
  SPDataIntegrityCheck *circleRecord;
  SPDataIntegrityCheck *v7;
  SPDataIntegrityCheck *sharedBeaconRecord;
  SPDataIntegrityCheck *v9;
  SPDataIntegrityCheck *sharedBeaconNameRecord;
  SPDataIntegrityCheck *v11;
  SPDataIntegrityCheck *sharedBeaconOwnerName;
  NSArray *v13;
  NSArray *peerTrusts;
  SPSharedSecretsDataCheck *v15;
  SPSharedSecretsDataCheck *sharedSecrets;
  SPDataIntegrityCheck *v17;
  SPDataIntegrityCheck *keySyncRecord;
  NSArray *v19;
  NSArray *observations;
  NSArray *v21;
  NSArray *itemSharingKey;
  NSArray *v23;
  NSArray *estimatedLocations;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("circleRecord"));
  v5 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  circleRecord = self->_circleRecord;
  self->_circleRecord = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedBeaconRecord"));
  v7 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  sharedBeaconRecord = self->_sharedBeaconRecord;
  self->_sharedBeaconRecord = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedBeaconNameRecord"));
  v9 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  sharedBeaconNameRecord = self->_sharedBeaconNameRecord;
  self->_sharedBeaconNameRecord = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedBeaconOwnerName"));
  v11 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  sharedBeaconOwnerName = self->_sharedBeaconOwnerName;
  self->_sharedBeaconOwnerName = v11;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("peerTrusts"));
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  peerTrusts = self->_peerTrusts;
  self->_peerTrusts = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedSecrets"));
  v15 = (SPSharedSecretsDataCheck *)objc_claimAutoreleasedReturnValue();
  sharedSecrets = self->_sharedSecrets;
  self->_sharedSecrets = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keySyncRecord"));
  v17 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  keySyncRecord = self->_keySyncRecord;
  self->_keySyncRecord = v17;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("observations"));
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  observations = self->_observations;
  self->_observations = v19;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("itemSharingKey"));
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  itemSharingKey = self->_itemSharingKey;
  self->_itemSharingKey = v21;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("estimatedLocations"));
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();

  estimatedLocations = self->_estimatedLocations;
  self->_estimatedLocations = v23;

  return self;
}

- (SPDataIntegrityCheck)circleRecord
{
  return self->_circleRecord;
}

- (void)setCircleRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SPDataIntegrityCheck)sharedBeaconRecord
{
  return self->_sharedBeaconRecord;
}

- (void)setSharedBeaconRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SPDataIntegrityCheck)sharedBeaconNameRecord
{
  return self->_sharedBeaconNameRecord;
}

- (void)setSharedBeaconNameRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SPDataIntegrityCheck)sharedBeaconOwnerName
{
  return self->_sharedBeaconOwnerName;
}

- (void)setSharedBeaconOwnerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)peerTrusts
{
  return self->_peerTrusts;
}

- (void)setPeerTrusts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SPSharedSecretsDataCheck)sharedSecrets
{
  return self->_sharedSecrets;
}

- (void)setSharedSecrets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SPDataIntegrityCheck)keySyncRecord
{
  return self->_keySyncRecord;
}

- (void)setKeySyncRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)itemSharingKey
{
  return self->_itemSharingKey;
}

- (void)setItemSharingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)estimatedLocations
{
  return self->_estimatedLocations;
}

- (void)setEstimatedLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedLocations, 0);
  objc_storeStrong((id *)&self->_itemSharingKey, 0);
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_keySyncRecord, 0);
  objc_storeStrong((id *)&self->_sharedSecrets, 0);
  objc_storeStrong((id *)&self->_peerTrusts, 0);
  objc_storeStrong((id *)&self->_sharedBeaconOwnerName, 0);
  objc_storeStrong((id *)&self->_sharedBeaconNameRecord, 0);
  objc_storeStrong((id *)&self->_sharedBeaconRecord, 0);
  objc_storeStrong((id *)&self->_circleRecord, 0);
}

@end
