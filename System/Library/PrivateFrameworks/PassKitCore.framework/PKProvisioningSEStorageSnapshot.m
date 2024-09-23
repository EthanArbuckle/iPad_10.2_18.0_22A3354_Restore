@implementation PKProvisioningSEStorageSnapshot

- (PKProvisioningSEStorageSnapshot)init
{

  return 0;
}

- (id)_initWithSnapshot:(id)a3
{
  id v5;
  PKProvisioningSEStorageSnapshot *v6;
  PKProvisioningSEStorageSnapshot *v7;
  objc_super v9;

  v5 = a3;
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKProvisioningSEStorageSnapshot;
    v6 = -[PKProvisioningSEStorageSnapshot init](&v9, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_snapshot, a3);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

+ (void)getCurrentSnapshot:(id)a3
{
  id v3;
  _PKProvisioningSEStorageManager *v4;
  id v5;
  _PKProvisioningSEStorageManager *v6;
  _QWORD v7[4];
  _PKProvisioningSEStorageManager *v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(_PKProvisioningSEStorageManager);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PKProvisioningSEStorageSnapshot_getCurrentSnapshot___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  -[_PKProvisioningSEStorageManager deleteExpiredReservationsWithCompletion:](v6, "deleteExpiredReservationsWithCompletion:", v7);

}

void __54__PKProvisioningSEStorageSnapshot_getCurrentSnapshot___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__PKProvisioningSEStorageSnapshot_getCurrentSnapshot___block_invoke_2;
  v2[3] = &unk_1E2ADD978;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "currentSnapshotWithCompletion:", v2);

}

void __54__PKProvisioningSEStorageSnapshot_getCurrentSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[PKProvisioningSEStorageSnapshot _initWithSnapshot:]([PKProvisioningSEStorageSnapshot alloc], "_initWithSnapshot:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (int64_t)totalUsageOfAppletType:(id)a3
{
  return -[_PKProvisioningSEStorageSnapshot totalUsageOfAppletType:](self->_snapshot, "totalUsageOfAppletType:", a3);
}

- (int64_t)usageOfAppletType:(id)a3
{
  return -[_PKProvisioningSEStorageSnapshot usageOfAppletType:](self->_snapshot, "usageOfAppletType:", a3);
}

- (int64_t)totalStorage
{
  return -[_PKProvisioningSEStorageSnapshot totalStorage](self->_snapshot, "totalStorage");
}

- (int64_t)totalUsage
{
  return -[_PKProvisioningSEStorageSnapshot totalUsage](self->_snapshot, "totalUsage");
}

- (BOOL)canFitAppletTypes:(id)a3
{
  return -[_PKProvisioningSEStorageSnapshot canFitWithAppletTypes:](self->_snapshot, "canFitWithAppletTypes:", a3);
}

- (BOOL)addAppletTypesToSnapshot:(id)a3
{
  return -[_PKProvisioningSEStorageSnapshot addToSnapshotWithAppletTypes:](self->_snapshot, "addToSnapshotWithAppletTypes:", a3);
}

- (void)removeAppletTypesFromSnapshot:(id)a3
{
  -[_PKProvisioningSEStorageSnapshot removeFromSnapshotWithAppletTypes:](self->_snapshot, "removeFromSnapshotWithAppletTypes:", a3);
}

- (id)appletTypesForAppletIDs:(id)a3
{
  return -[_PKProvisioningSEStorageSnapshot appletTypesForAppletIDs:](self->_snapshot, "appletTypesForAppletIDs:", a3);
}

- (int64_t)requiredStorageForAppletTypes:(id)a3
{
  return -[_PKProvisioningSEStorageSnapshot requiredStorageForAppletTypes:](self->_snapshot, "requiredStorageForAppletTypes:", a3);
}

- (void)reset
{
  -[_PKProvisioningSEStorageSnapshot reset](self->_snapshot, "reset");
}

+ (id)appletTypePurpleTrustAirHome
{
  return +[_PKProvisioningSEStorageSnapshot purpleTrustAirHomeAppletType](_PKProvisioningSEStorageSnapshot, "purpleTrustAirHomeAppletType");
}

+ (id)appletTypePurpleTrustAirAccess
{
  return +[_PKProvisioningSEStorageSnapshot purpleTrustAirAccessAppletType](_PKProvisioningSEStorageSnapshot, "purpleTrustAirAccessAppletType");
}

+ (id)appletTypePurpleTrustAirAliro
{
  return +[_PKProvisioningSEStorageSnapshot purpleTrustAirAliroAppletType](_PKProvisioningSEStorageSnapshot, "purpleTrustAirAliroAppletType");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningSEStorageSnapshot)initWithCoder:(id)a3
{
  id v4;
  PKProvisioningSEStorageSnapshot *v5;
  uint64_t v6;
  _PKProvisioningSEStorageSnapshot *snapshot;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKProvisioningSEStorageSnapshot;
  v5 = -[PKProvisioningSEStorageSnapshot init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snapshot"));
    v6 = objc_claimAutoreleasedReturnValue();
    snapshot = v5->_snapshot;
    v5->_snapshot = (_PKProvisioningSEStorageSnapshot *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_snapshot, CFSTR("snapshot"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
