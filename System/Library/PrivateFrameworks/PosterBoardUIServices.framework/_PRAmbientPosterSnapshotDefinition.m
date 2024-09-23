@implementation _PRAmbientPosterSnapshotDefinition

- (_PRAmbientPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 ambientPresentationSettings:(id)a4 renderingContent:(int64_t)a5 renderingMode:(int64_t)a6 previewContent:(unint64_t)a7
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _PRAmbientPosterSnapshotDefinition *v16;

  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v12, "isAmbientPresented");
  v15 = objc_msgSend(v12, "ambientDisplayStyle");

  v16 = -[_PRAmbientPosterSnapshotDefinition initWithUniqueIdentifier:ambientPresented:ambientDisplayStyle:renderingContent:renderingMode:previewContent:](self, "initWithUniqueIdentifier:ambientPresented:ambientDisplayStyle:renderingContent:renderingMode:previewContent:", v13, v14, v15, a5, a6, a7);
  return v16;
}

- (_PRAmbientPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 ambientPresented:(BOOL)a4 ambientDisplayStyle:(int64_t)a5 renderingContent:(int64_t)a6 renderingMode:(int64_t)a7 previewContent:(unint64_t)a8
{
  id v14;
  void *v15;
  _PRAmbientPosterSnapshotDefinition *v16;
  objc_super v18;

  v14 = a3;
  PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)_PRAmbientPosterSnapshotDefinition;
  v16 = -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:](&v18, sel_initWithUniqueIdentifier_includeHeaderElements_includesComplications_levelSets_isUnlocked_renderingContent_renderingMode_previewContent_, v14, 0, 0, v15, 1, a6, a7, a8);

  if (v16)
  {
    v16->_ambientPresented = a4;
    v16->_ambientDisplayStyle = a5;
  }
  return v16;
}

- (void)applySceneSettings:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_PRAmbientPosterSnapshotDefinition;
  -[PRPosterSnapshotDefinition applySceneSettings:](&v5, sel_applySceneSettings_, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setAmbientDisplayStyle:", self->_ambientDisplayStyle);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setAmbientPresented:", self->_ambientPresented);

}

- (BOOL)isEqualToDefinition:(id)a3
{
  _PRAmbientPosterSnapshotDefinition *v4;
  void *v5;
  char isKindOfClass;
  int64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  objc_super v11;

  v4 = (_PRAmbientPosterSnapshotDefinition *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_PRAmbientPosterSnapshotDefinition;
    if (-[PRPosterSnapshotDefinition isEqualToDefinition:](&v11, sel_isEqualToDefinition_, v4)
      && (objc_opt_self(),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v5,
          (isKindOfClass & 1) != 0)
      && (v7 = -[_PRAmbientPosterSnapshotDefinition ambientDisplayStyle](self, "ambientDisplayStyle"),
          v7 == -[_PRAmbientPosterSnapshotDefinition ambientDisplayStyle](v4, "ambientDisplayStyle")))
    {
      v8 = -[_PRAmbientPosterSnapshotDefinition isAmbientPresented](self, "isAmbientPresented");
      v9 = v8 ^ -[_PRAmbientPosterSnapshotDefinition isAmbientPresented](v4, "isAmbientPresented") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (BOOL)isAmbientPresented
{
  return self->_ambientPresented;
}

- (void)setAmbientPresented:(BOOL)a3
{
  self->_ambientPresented = a3;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

- (void)setAmbientDisplayStyle:(int64_t)a3
{
  self->_ambientDisplayStyle = a3;
}

@end
