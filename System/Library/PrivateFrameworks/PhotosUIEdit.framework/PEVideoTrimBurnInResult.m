@implementation PEVideoTrimBurnInResult

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setCompositionController:(id)a3
{
  objc_storeStrong((id *)&self->_compositionController, a3);
}

- (PHContentEditingInput)contentEditingInput
{
  return self->_contentEditingInput;
}

- (void)setContentEditingInput:(id)a3
{
  objc_storeStrong((id *)&self->_contentEditingInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEditingInput, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
