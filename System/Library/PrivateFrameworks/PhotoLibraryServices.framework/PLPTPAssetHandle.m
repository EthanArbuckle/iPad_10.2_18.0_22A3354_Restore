@implementation PLPTPAssetHandle

- (PLPTPAssetHandle)initWithType:(int64_t)a3 assetID:(id)a4 sidecarID:(id)a5 requiresConversion:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  PLPTPAssetHandle *v12;
  PLPTPAssetHandle *v13;
  objc_super v15;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLPTPAssetHandle;
  v12 = -[PLPTPAssetHandle init](&v15, sel_init);
  if (v12)
    v13 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:siblingAssetHandleTypes:](v12, "initWithType:assetID:sidecarID:requiresConversion:siblingAssetHandleTypes:", a3, v10, v11, v6, 0);
  else
    v13 = 0;

  return v13;
}

- (PLPTPAssetHandle)initWithType:(int64_t)a3 assetID:(id)a4 sidecarID:(id)a5 requiresConversion:(BOOL)a6 siblingAssetHandleTypes:(id)a7
{
  id v12;
  id v13;
  id v14;
  PLPTPAssetHandle *v15;
  PLPTPAssetHandle *v16;
  uint64_t v17;
  NSManagedObjectID *assetID;
  uint64_t v19;
  NSManagedObjectID *sidecarID;
  PLPTPAssetHandle *v21;
  objc_super v23;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PLPTPAssetHandle;
  v15 = -[PLPTPAssetHandle init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v17 = objc_msgSend(v12, "copy");
    assetID = v16->_assetID;
    v16->_assetID = (NSManagedObjectID *)v17;

    v19 = objc_msgSend(v13, "copy");
    sidecarID = v16->_sidecarID;
    v16->_sidecarID = (NSManagedObjectID *)v19;

    v16->_requiresConversion = a6;
    objc_storeStrong((id *)&v16->_siblingAssetHandleTypes, a7);
    v21 = v16;
  }

  return v16;
}

- (id)assetHandleBySettingRequiresConversion
{
  return -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:]([PLPTPAssetHandle alloc], "initWithType:assetID:sidecarID:requiresConversion:", self->_type, self->_assetID, self->_sidecarID, 1);
}

- (id)assetHandleBySettingSiblingAssetHandleTypes:(id)a3
{
  id v4;
  PLPTPAssetHandle *v5;

  v4 = a3;
  v5 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:siblingAssetHandleTypes:]([PLPTPAssetHandle alloc], "initWithType:assetID:sidecarID:requiresConversion:siblingAssetHandleTypes:", self->_type, self->_assetID, self->_sidecarID, self->_requiresConversion, v4);

  return v5;
}

- (BOOL)hasSiblingAssetWithAssetHandleType:(int64_t)a3
{
  NSSet *siblingAssetHandleTypes;
  void *v4;

  siblingAssetHandleTypes = self->_siblingAssetHandleTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(siblingAssetHandleTypes) = -[NSSet containsObject:](siblingAssetHandleTypes, "containsObject:", v4);

  return (char)siblingAssetHandleTypes;
}

- (id)description
{
  void *v3;
  void *v4;

  +[PLDescriptionBuilder descriptionBuilderWithObject:](PLDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("type"), "q", &self->_type);
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("assetID"), "@", &self->_assetID);
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("sidecarID"), "@", &self->_sidecarID);
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("requiresConversion"), "B", &self->_requiresConversion);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = self->_type == v5[2]
      && PLObjectIsEqual()
      && PLObjectIsEqual()
      && self->_requiresConversion == *((unsigned __int8 *)v5 + 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)auxiliaryResourceFilenameMarker
{
  unint64_t v2;

  v2 = self->_type - 2;
  if (v2 <= 9 && ((0x3FDu >> v2) & 1) != 0)
    return (NSString *)*(&off_1E366A330)[v2];
  else
    return (NSString *)0;
}

- (int64_t)type
{
  return self->_type;
}

- (NSManagedObjectID)assetID
{
  return self->_assetID;
}

- (NSManagedObjectID)sidecarID
{
  return self->_sidecarID;
}

- (BOOL)requiresConversion
{
  return self->_requiresConversion;
}

- (NSSet)siblingAssetHandleTypes
{
  return self->_siblingAssetHandleTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siblingAssetHandleTypes, 0);
  objc_storeStrong((id *)&self->_sidecarID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
