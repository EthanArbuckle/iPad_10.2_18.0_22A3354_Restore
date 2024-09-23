@implementation CEMFontDeclaration

- (id)dmf_installAssetOperationWithReferenceResolver:(id)a3 error:(id *)a4
{
  id v5;
  CEMFontInstallOperation *v6;

  v5 = a3;
  v6 = -[CEMFontInstallOperation initWithFontDeclaration:resolver:]([CEMFontInstallOperation alloc], "initWithFontDeclaration:resolver:", self, v5);

  return v6;
}

- (id)dmf_removeAssetOperationWithInstallMetadata:(id)a3 error:(id *)a4
{
  id v5;
  CEMFontRemoveOperation *v6;

  v5 = a3;
  v6 = -[CEMFontRemoveOperation initWithFontDeclaration:installMetadata:]([CEMFontRemoveOperation alloc], "initWithFontDeclaration:installMetadata:", self, v5);

  return v6;
}

@end
