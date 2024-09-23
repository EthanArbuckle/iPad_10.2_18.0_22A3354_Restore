@implementation PLSocialGroupAssetContainmentResult

- (PLSocialGroupAssetContainmentResult)initWithInclusiveAssetIDs:(id)a3 exclusiveAssetIDs:(id)a4
{
  id v7;
  id v8;
  PLSocialGroupAssetContainmentResult *v9;
  PLSocialGroupAssetContainmentResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLSocialGroupAssetContainmentResult;
  v9 = -[PLSocialGroupAssetContainmentResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inclusiveAssetIDs, a3);
    objc_storeStrong((id *)&v10->_exclusiveAssetIDs, a4);
  }

  return v10;
}

- (NSSet)inclusiveAssetIDs
{
  return self->_inclusiveAssetIDs;
}

- (NSSet)exclusiveAssetIDs
{
  return self->_exclusiveAssetIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusiveAssetIDs, 0);
  objc_storeStrong((id *)&self->_inclusiveAssetIDs, 0);
}

@end
