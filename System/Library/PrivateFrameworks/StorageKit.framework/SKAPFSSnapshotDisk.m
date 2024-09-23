@implementation SKAPFSSnapshotDisk

- (NSString)apfsUUID
{
  return self->_apfsUUID;
}

- (void)setApfsUUID:(id)a3
{
  objc_storeStrong((id *)&self->_apfsUUID, a3);
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  SKAPFSSnapshotDisk *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v9.receiver = v5;
  v9.super_class = (Class)SKAPFSSnapshotDisk;
  -[SKAPFSDisk updateWithDictionary:](&v9, sel_updateWithDictionary_, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("snapshotName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSSnapshotDisk setSnapshotName:](v5, "setSnapshotName:", v6);

  objc_msgSend(v4, "objectForKey:", CFSTR("snapshotSealStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSSnapshotDisk setSealStatus:](v5, "setSealStatus:", objc_msgSend(v7, "integerValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("apfsUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSSnapshotDisk setApfsUUID:](v5, "setApfsUUID:", v8);

  objc_sync_exit(v5);
}

- (id)dictionaryRepresentation
{
  SKAPFSSnapshotDisk *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v2 = self;
  objc_sync_enter(v2);
  v10.receiver = v2;
  v10.super_class = (Class)SKAPFSSnapshotDisk;
  -[SKAPFSDisk dictionaryRepresentation](&v10, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSSnapshotDisk snapshotName](v2, "snapshotName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SKAPFSSnapshotDisk snapshotName](v2, "snapshotName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("snapshotName"));

  }
  if (-[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("snapshotSealStatus"));

  }
  -[SKAPFSSnapshotDisk apfsUUID](v2, "apfsUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SKAPFSSnapshotDisk apfsUUID](v2, "apfsUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("apfsUUID"));

  }
  objc_sync_exit(v2);

  return v3;
}

- (id)minimalDictionaryRepresentation
{
  SKAPFSSnapshotDisk *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v2 = self;
  objc_sync_enter(v2);
  v10.receiver = v2;
  v10.super_class = (Class)SKAPFSSnapshotDisk;
  -[SKAPFSDisk minimalDictionaryRepresentation](&v10, sel_minimalDictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSSnapshotDisk snapshotName](v2, "snapshotName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SKAPFSSnapshotDisk snapshotName](v2, "snapshotName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("snapshotName"));

  }
  if (-[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("snapshotSealStatus"));

  }
  -[SKAPFSSnapshotDisk apfsUUID](v2, "apfsUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SKAPFSSnapshotDisk apfsUUID](v2, "apfsUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("apfsUUID"));

  }
  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)SKAPFSSnapshotDisk;
  -[SKAPFSDisk innerDescriptionWithPrivateData:](&v13, sel_innerDescriptionWithPrivateData_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SKAPFSSnapshotDisk snapshotName](self, "snapshotName");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("<private>");
  }
  -[SKAPFSSnapshotDisk snapshotUUID](self, "snapshotUUID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("--");
  if (v8)
    v10 = (const __CFString *)v8;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@, Snapshot Name: %@, Snapshot UUID: %@"), v6, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v11;
}

- (NSString)snapshotName
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSnapshotName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (int64_t)sealStatus
{
  return self->_sealStatus;
}

- (void)setSealStatus:(int64_t)a3
{
  self->_sealStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotName, 0);
  objc_storeStrong((id *)&self->_apfsUUID, 0);
}

@end
