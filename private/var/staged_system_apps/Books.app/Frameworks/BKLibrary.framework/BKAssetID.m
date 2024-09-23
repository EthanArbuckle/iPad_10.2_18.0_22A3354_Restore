@implementation BKAssetID

+ (id)identifierWithAssetID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithAssetID:", v4);

  return v5;
}

- (BKAssetID)initWithAssetID:(id)a3
{
  id v5;
  BKAssetID *v6;
  BKAssetID *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKAssetID;
  v6 = -[BKAssetID init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetID, a3);

  return v7;
}

- (NSString)permanentOrTemporaryAssetID
{
  return (NSString *)-[NSString copy](self->_assetID, "copy");
}

- (NSString)permanentAssetID
{
  return (NSString *)-[NSString copy](self->_assetID, "copy");
}

- (BOOL)isTemporary
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithAssetID:", self->_assetID);
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = (id *)a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = objc_msgSend(v4[1], "isEqual:", self->_assetID);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_assetID, "hash");
}

- (NSString)description
{
  return self->_assetID;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
