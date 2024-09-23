@implementation PLAssetCollectionGenerationResult

- (PLAssetCollectionGenerationResult)initWithInsertedOrUpdatedMoments:(id)a3 frequentLocationsDidChange:(BOOL)a4
{
  id v7;
  PLAssetCollectionGenerationResult *v8;
  PLAssetCollectionGenerationResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetCollectionGenerationResult;
  v8 = -[PLAssetCollectionGenerationResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_insertedOrUpdatedMoments, a3);
    v9->_frequentLocationsDidChange = a4;
  }

  return v9;
}

- (NSSet)insertedOrUpdatedMoments
{
  return self->_insertedOrUpdatedMoments;
}

- (BOOL)frequentLocationsDidChange
{
  return self->_frequentLocationsDidChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedOrUpdatedMoments, 0);
}

@end
