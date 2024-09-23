@implementation ADAppRepresentation

- (ADAppRepresentation)initWithAdamID:(id)a3
{
  id v5;
  ADAppRepresentation *v6;
  ADAppRepresentation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADAppRepresentation;
  v6 = -[ADAppRepresentation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_adamID, a3);

  return v7;
}

- (ADAppRepresentation)initWithAdamID:(id)a3 assetInformation:(id)a4
{
  id v7;
  id v8;
  ADAppRepresentation *v9;
  ADAppRepresentation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADAppRepresentation;
  v9 = -[ADAppRepresentation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_adamID, a3);
    objc_storeStrong((id *)&v10->_assetInformation, a4);
  }

  return v10;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (NSDictionary)assetInformation
{
  return self->_assetInformation;
}

- (void)setAssetInformation:(id)a3
{
  objc_storeStrong((id *)&self->_assetInformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetInformation, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
