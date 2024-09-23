@implementation PXAssetCollectionReference

- (PXAssetCollectionReference)initWithAssetCollection:(id)a3 keyAssetReference:(id)a4 indexPath:(PXSimpleIndexPath *)a5
{
  id v9;
  __int128 v10;
  PXAssetCollectionReference *v11;
  PXAssetCollectionReference *v12;
  _OWORD v14[2];

  v9 = a4;
  v10 = *(_OWORD *)&a5->item;
  v14[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v14[1] = v10;
  v11 = -[PXSectionedObjectReference initWithSectionObject:itemObject:subitemObject:indexPath:](self, "initWithSectionObject:itemObject:subitemObject:indexPath:", a3, 0, 0, v14);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_keyAssetReference, a4);

  return v12;
}

- (PXDisplayAssetCollection)assetCollection
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  -[PXSectionedObjectReference sectionObject](self, "sectionObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetCollectionReference.m"), 15, CFSTR("%@ should conform to protocol %@, but it is nil"), CFSTR("self.sectionObject"), CFSTR("PXDisplayAssetCollection"));
LABEL_6:

    return (PXDisplayAssetCollection *)v5;
  }
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_2573748F8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetCollectionReference.m"), 15, CFSTR("%@ should conform to protocol %@, but %@ doesn't"), CFSTR("self.sectionObject"), CFSTR("PXDisplayAssetCollection"), v8);

    goto LABEL_6;
  }
  return (PXDisplayAssetCollection *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetReference, 0);
}

- (PXAssetReference)keyAssetReference
{
  return self->_keyAssetReference;
}

@end
