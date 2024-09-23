@implementation SPOwnedCircleDataIntegrity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOwnedCircleDataIntegrity)initWithCircleRecord:(id)a3 peerTrusts:(id)a4 sharedSecrets:(id)a5 keySyncRecord:(id)a6 observations:(id)a7 itemSharingKey:(id)a8 estimatedLocations:(id)a9
{
  id v16;
  id v17;
  SPOwnedCircleDataIntegrity *v18;
  SPOwnedCircleDataIntegrity *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SPOwnedCircleDataIntegrity;
  v18 = -[SPOwnedCircleDataIntegrity init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_circleRecord, a3);
    objc_storeStrong((id *)&v19->_peerTrusts, a4);
    objc_storeStrong((id *)&v19->_sharedSecrets, a5);
    objc_storeStrong((id *)&v19->_keySyncRecord, a6);
    objc_storeStrong((id *)&v19->_observations, a7);
    objc_storeStrong((id *)&v19->_itemSharingKey, a8);
    objc_storeStrong((id *)&v19->_estimatedLocations, a9);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPOwnedCircleDataIntegrity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SPOwnedCircleDataIntegrity *v12;

  v4 = [SPOwnedCircleDataIntegrity alloc];
  -[SPOwnedCircleDataIntegrity circleRecord](self, "circleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnedCircleDataIntegrity peerTrusts](self, "peerTrusts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnedCircleDataIntegrity sharedSecrets](self, "sharedSecrets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnedCircleDataIntegrity keySyncRecord](self, "keySyncRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnedCircleDataIntegrity observations](self, "observations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnedCircleDataIntegrity itemSharingKey](self, "itemSharingKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnedCircleDataIntegrity estimatedLocations](self, "estimatedLocations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SPOwnedCircleDataIntegrity initWithCircleRecord:peerTrusts:sharedSecrets:keySyncRecord:observations:itemSharingKey:estimatedLocations:](v4, "initWithCircleRecord:peerTrusts:sharedSecrets:keySyncRecord:observations:itemSharingKey:estimatedLocations:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  SPDataIntegrityCheck *circleRecord;
  id v5;

  circleRecord = self->_circleRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", circleRecord, CFSTR("circleRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerTrusts, CFSTR("peerTrusts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedSecrets, CFSTR("sharedSecrets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keySyncRecord, CFSTR("keySyncRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_observations, CFSTR("observations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemSharingKey, CFSTR("itemSharingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_estimatedLocations, CFSTR("estimatedLocations"));

}

- (SPOwnedCircleDataIntegrity)initWithCoder:(id)a3
{
  id v4;
  SPDataIntegrityCheck *v5;
  SPDataIntegrityCheck *circleRecord;
  NSArray *v7;
  NSArray *peerTrusts;
  SPSharedSecretsDataCheck *v9;
  SPSharedSecretsDataCheck *sharedSecrets;
  SPDataIntegrityCheck *v11;
  SPDataIntegrityCheck *keySyncRecord;
  NSArray *v13;
  NSArray *observations;
  NSArray *v15;
  NSArray *itemSharingKey;
  NSArray *v17;
  NSArray *estimatedLocations;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("circleRecord"));
  v5 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  circleRecord = self->_circleRecord;
  self->_circleRecord = v5;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("peerTrusts"));
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  peerTrusts = self->_peerTrusts;
  self->_peerTrusts = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedSecrets"));
  v9 = (SPSharedSecretsDataCheck *)objc_claimAutoreleasedReturnValue();
  sharedSecrets = self->_sharedSecrets;
  self->_sharedSecrets = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keySyncRecord"));
  v11 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  keySyncRecord = self->_keySyncRecord;
  self->_keySyncRecord = v11;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("observations"));
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  observations = self->_observations;
  self->_observations = v13;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("itemSharingKey"));
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  itemSharingKey = self->_itemSharingKey;
  self->_itemSharingKey = v15;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("estimatedLocations"));
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();

  estimatedLocations = self->_estimatedLocations;
  self->_estimatedLocations = v17;

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

- (NSArray)peerTrusts
{
  return self->_peerTrusts;
}

- (void)setPeerTrusts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SPSharedSecretsDataCheck)sharedSecrets
{
  return self->_sharedSecrets;
}

- (void)setSharedSecrets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SPDataIntegrityCheck)keySyncRecord
{
  return self->_keySyncRecord;
}

- (void)setKeySyncRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)itemSharingKey
{
  return self->_itemSharingKey;
}

- (void)setItemSharingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)estimatedLocations
{
  return self->_estimatedLocations;
}

- (void)setEstimatedLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedLocations, 0);
  objc_storeStrong((id *)&self->_itemSharingKey, 0);
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_keySyncRecord, 0);
  objc_storeStrong((id *)&self->_sharedSecrets, 0);
  objc_storeStrong((id *)&self->_peerTrusts, 0);
  objc_storeStrong((id *)&self->_circleRecord, 0);
}

@end
