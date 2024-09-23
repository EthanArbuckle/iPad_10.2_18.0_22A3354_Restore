@implementation UARPiCloudZone

- (UARPiCloudZone)initWithZoneID:(id)a3 containerID:(id)a4
{
  id v6;
  id v7;
  UARPiCloudZone *v8;
  uint64_t v9;
  CKRecordZoneID *zoneID;
  uint64_t v11;
  NSString *containerID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UARPiCloudZone;
  v8 = -[UARPiCloudZone init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    zoneID = v8->_zoneID;
    v8->_zoneID = (CKRecordZoneID *)v9;

    v11 = objc_msgSend(v7, "copy");
    containerID = v8->_containerID;
    v8->_containerID = (NSString *)v11;

  }
  return v8;
}

- (void)setChangeToken:(id)a3
{
  CKServerChangeToken *v4;
  void *v5;
  id v6;
  void *v7;
  NSString *containerID;
  void *v9;
  void *v10;
  CKServerChangeToken *changeToken;
  CKServerChangeToken *v12;
  id v13;

  v4 = (CKServerChangeToken *)a3;
  if (v4)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v7 = (void *)MEMORY[0x24BDD17C8];
    containerID = self->_containerID;
    -[CKRecordZoneID zoneName](self->_zoneID, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_%@"), containerID, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    saveEntryForKey(v5, v10);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  changeToken = self->_changeToken;
  self->_changeToken = v4;
  v12 = v4;

}

- (CKServerChangeToken)changeToken
{
  void *v3;
  NSString *containerID;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CKServerChangeToken *v9;
  CKServerChangeToken *changeToken;
  CKServerChangeToken *v11;
  id v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  containerID = self->_containerID;
  -[CKRecordZoneID zoneName](self->_zoneID, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@"), containerID, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_changeToken)
  {
    v7 = 0;
  }
  else
  {
    getEntryForKey(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v13);
      v9 = (CKServerChangeToken *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      changeToken = self->_changeToken;
      self->_changeToken = v9;

      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:
  v11 = self->_changeToken;

  return v11;
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainerID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
}

@end
