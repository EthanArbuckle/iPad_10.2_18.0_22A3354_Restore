@implementation PRItem

+ (id)itemWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  PRItem *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[PRItem initWithUUID:productUUID:isOwned:requiresLowerRangingFrequency:]([PRItem alloc], "initWithUUID:productUUID:isOwned:requiresLowerRangingFrequency:", v8, v7, v5, 0);

  return v9;
}

- (PRItem)initWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5
{
  id v9;
  id v10;
  PRItem *v11;
  PRItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRItem;
  v11 = -[PRItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    objc_storeStrong((id *)&v12->_productUUID, a4);
    v12->_isOwned = a5;
    v12->_requiresLowerRangingFrequency = 0;
  }

  return v12;
}

+ (id)itemWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5 requiresLowerRangingFrequency:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  PRItem *v11;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PRItem initWithUUID:productUUID:isOwned:requiresLowerRangingFrequency:]([PRItem alloc], "initWithUUID:productUUID:isOwned:requiresLowerRangingFrequency:", v10, v9, v7, v6);

  return v11;
}

- (PRItem)initWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5 requiresLowerRangingFrequency:(BOOL)a6
{
  id v11;
  id v12;
  PRItem *v13;
  PRItem *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PRItem;
  v13 = -[PRItem init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uuid, a3);
    objc_storeStrong((id *)&v14->_productUUID, a4);
    v14->_isOwned = a5;
    v14->_requiresLowerRangingFrequency = a6;
  }

  return v14;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (BOOL)isOwned
{
  return self->_isOwned;
}

- (BOOL)requiresLowerRangingFrequency
{
  return self->_requiresLowerRangingFrequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
