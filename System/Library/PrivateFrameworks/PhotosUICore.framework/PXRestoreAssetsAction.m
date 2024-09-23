@implementation PXRestoreAssetsAction

- (id)actionIdentifier
{
  return CFSTR("RestoreAssets");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXRestoreActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PXRestoreAssetsAction_performAction___block_invoke;
  v7[3] = &unk_1E5149198;
  v8 = v5;
  v6 = v5;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__PXRestoreAssetsAction_performUndo___block_invoke;
  v7[3] = &unk_1E5149198;
  v8 = v5;
  v6 = v5;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v4);

}

uint64_t __37__PXRestoreAssetsAction_performUndo___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD13B0], "deleteAssets:", *(_QWORD *)(a1 + 32));
}

uint64_t __39__PXRestoreAssetsAction_performAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD13B0], "undeleteAssets:", *(_QWORD *)(a1 + 32));
}

@end
