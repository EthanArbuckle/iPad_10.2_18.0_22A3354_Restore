@implementation ODCurarePersonalizationResult

- (ODCurarePersonalizationResult)initWithNewPersonalizedModelPath:(id)a3 currentlyUsedModelPath:(id)a4 isSelected:(BOOL)a5 saveModel:(BOOL)a6 newPersonalizedModelIdentifier:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  ODCurarePersonalizationResult *v15;
  ODCurarePersonalizationResult *v16;
  objc_super v18;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)ODCurarePersonalizationResult;
  v15 = -[ODCurarePersonalizationResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[ODCurarePersonalizationResult setPersonalizedModelPath:](v15, "setPersonalizedModelPath:", v12);
    -[ODCurarePersonalizationResult setCurrentlyUsedModelPath:](v16, "setCurrentlyUsedModelPath:", v13);
    -[ODCurarePersonalizationResult setNewPersonalizedModelIsSelected:](v16, "setNewPersonalizedModelIsSelected:", v9);
    -[ODCurarePersonalizationResult setSaveNewPersonalizedModel:](v16, "setSaveNewPersonalizedModel:", v8);
    -[ODCurarePersonalizationResult setPersonalizedModelIdentifier:](v16, "setPersonalizedModelIdentifier:", v14);
  }

  return v16;
}

- (NSURL)personalizedModelPath
{
  return self->_personalizedModelPath;
}

- (void)setPersonalizedModelPath:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedModelPath, a3);
}

- (NSURL)currentlyUsedModelPath
{
  return self->_currentlyUsedModelPath;
}

- (void)setCurrentlyUsedModelPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyUsedModelPath, a3);
}

- (BOOL)newPersonalizedModelIsSelected
{
  return self->_newPersonalizedModelIsSelected;
}

- (void)setNewPersonalizedModelIsSelected:(BOOL)a3
{
  self->_newPersonalizedModelIsSelected = a3;
}

- (BOOL)saveNewPersonalizedModel
{
  return self->_saveNewPersonalizedModel;
}

- (void)setSaveNewPersonalizedModel:(BOOL)a3
{
  self->_saveNewPersonalizedModel = a3;
}

- (NSString)personalizedModelIdentifier
{
  return self->_personalizedModelIdentifier;
}

- (void)setPersonalizedModelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedModelIdentifier, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_personalizedModelIdentifier, 0);
  objc_storeStrong((id *)&self->_currentlyUsedModelPath, 0);
  objc_storeStrong((id *)&self->_personalizedModelPath, 0);
}

@end
