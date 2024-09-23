@implementation PXPhotosGridActionMenuController

- (PXPhotosGridActionMenuController)initWithActionManagers:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridActionMenuController.m"), 40, CFSTR("%s is not available as initializer"), "-[PXPhotosGridActionMenuController initWithActionManagers:]");

  abort();
}

- (PXPhotosGridActionMenuController)initWithActionManagers:(id)a3 viewModel:(id)a4
{
  id v7;
  PXPhotosGridActionMenuController *v8;
  PXPhotosGridActionMenuController *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosGridActionMenuController;
  v8 = -[PXActionMenuController initWithActionManagers:](&v11, sel_initWithActionManagers_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_viewModel, a4);

  return v9;
}

- (void)updateActions
{
  PXPhotosGridActionMenuCustomizer *v3;
  void *v4;
  void *v5;
  PXPhotosGridActionMenuCustomizer *v6;
  objc_super v7;

  v3 = [PXPhotosGridActionMenuCustomizer alloc];
  -[PXPhotosGridActionMenuController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionMenuController excludedActionTypes](self, "excludedActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPhotosGridActionMenuCustomizer initWithViewModel:excludedActionTypes:](v3, "initWithViewModel:excludedActionTypes:", v4, v5);
  -[PXPhotosGridActionMenuController setActionMenuCustomizer:](self, "setActionMenuCustomizer:", v6);

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosGridActionMenuController;
  -[PXActionMenuController updateActions](&v7, sel_updateActions);
}

- (id)availableActionTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[10];

  v10[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridActionMenuController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "searchActionLocation");

  if (v5 == 2)
    objc_msgSend(v3, "addObject:", CFSTR("PXPhotosGridActionSearch"));
  v10[0] = CFSTR("PXAssetCollectionActionTypeAddFrom");
  v10[1] = CFSTR("PXAssetCollectionActionTypePlayMovie");
  v10[2] = CFSTR("PXAssetCollectionActionTypeCustomize");
  v10[3] = CFSTR("PXAssetCollectionActionTypeMoveOut");
  v10[4] = CFSTR("PXAssetCollectionActionTypeCustomizeMemory");
  v10[5] = CFSTR("PXAssetCollectionActionTypeDelete");
  v10[6] = CFSTR("PXAssetCollectionActionTypeRemoveSharingSuggestion");
  v10[7] = CFSTR("PXPhotosGridActionShowMap");
  v10[8] = CFSTR("PXPhotosGridActionTogglePreviewHeader");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  -[PXPhotosGridActionMenuController additionalActionTypes](self, "additionalActionTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXPhotosGridActionMenuController additionalActionTypes](self, "additionalActionTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  }
  return v3;
}

- (id)availableInternalActionTypes
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXAssetCollectionActionTypeAddPersonToAutoCounter");
  v3[1] = CFSTR("PXAssetCollectionActionTypeFileRadar");
  v3[2] = CFSTR("PXAssetCollectionActionTypeDebugCuration");
  v3[3] = CFSTR("PXAssetCollectionActionTypeCopyInternalURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)availableHeaderActionTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXAssetCollectionActionTypePersonInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)availableDestructiveActionTypes
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXAssetCollectionActionTypeBlockPerson");
  v3[1] = CFSTR("PXAssetCollectionActionTypeRemovePersonFromHome");
  v3[2] = CFSTR("PXAssetCollectionActionTypeRemoveSocialGroupFromHome");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)customizeActions:(id)a3 withActionTypes:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a3;
  -[PXPhotosGridActionMenuController actionMenuCustomizer](self, "actionMenuCustomizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridActionMenuController.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionMenuCustomizer != nil"));

  }
  objc_msgSend(v8, "customizedActions:actionTypes:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArray:", v9);

}

- (BOOL)actionsAreExcludedWhenCustomized
{
  return 1;
}

- (BOOL)shouldAllowPerformanceOfActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PXPhotosGridActionMenuController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsActionType:", v4);

  return v7;
}

- (NSArray)additionalActionTypes
{
  return self->_additionalActionTypes;
}

- (void)setAdditionalActionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosGridActionMenuCustomizer)actionMenuCustomizer
{
  return self->_actionMenuCustomizer;
}

- (void)setActionMenuCustomizer:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuCustomizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuCustomizer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_additionalActionTypes, 0);
}

@end
