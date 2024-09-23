@implementation PEEditActionResult

- (PEEditActionResult)initWithAssetUUID:(id)a3 targetAction:(id)a4
{
  id v7;
  id v8;
  PEEditActionResult *v9;
  PEEditActionResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PEEditActionResult;
  v9 = -[PEEditActionResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceAssetUUID, a3);
    objc_storeStrong((id *)&v10->_targetAction, a4);
  }

  return v10;
}

- (NSString)sourceAssetUUID
{
  return self->_sourceAssetUUID;
}

- (PEEditAction)targetAction
{
  return self->_targetAction;
}

- (PEEditAction)sourceAction
{
  return self->_sourceAction;
}

- (void)setSourceAction:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAction, a3);
}

- (PEAsset)savedAsset
{
  return self->_savedAsset;
}

- (void)setSavedAsset:(id)a3
{
  objc_storeStrong((id *)&self->_savedAsset, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_savedAsset, 0);
  objc_storeStrong((id *)&self->_sourceAction, 0);
  objc_storeStrong((id *)&self->_targetAction, 0);
  objc_storeStrong((id *)&self->_sourceAssetUUID, 0);
}

@end
