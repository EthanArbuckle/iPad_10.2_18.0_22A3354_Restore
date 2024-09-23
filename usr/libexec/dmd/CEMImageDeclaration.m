@implementation CEMImageDeclaration

- (id)dmf_installAssetOperationWithReferenceResolver:(id)a3 error:(id *)a4
{
  id v5;
  CEMImageInstallOperation *v6;

  v5 = a3;
  v6 = -[CEMImageInstallOperation initWithImageDeclaration:resolver:]([CEMImageInstallOperation alloc], "initWithImageDeclaration:resolver:", self, v5);

  return v6;
}

- (id)dmf_removeAssetOperationWithInstallMetadata:(id)a3 error:(id *)a4
{
  id v5;
  CEMImageRemoveOperation *v6;

  v5 = a3;
  v6 = -[CEMImageRemoveOperation initWithImageDeclaration:installMetadata:]([CEMImageRemoveOperation alloc], "initWithImageDeclaration:installMetadata:", self, v5);

  return v6;
}

@end
