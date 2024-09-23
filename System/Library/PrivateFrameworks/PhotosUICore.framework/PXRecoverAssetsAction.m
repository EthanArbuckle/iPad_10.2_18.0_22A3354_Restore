@implementation PXRecoverAssetsAction

- (id)actionIdentifier
{
  return CFSTR("RecoverAssets");
}

- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[PXAssetsAction assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PXRecoverAssetsAction_executeWithUndoManager_completionHandler___block_invoke;
  v8[3] = &unk_1E5149198;
  v9 = v6;
  v7 = v6;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v8, v5);

}

uint64_t __66__PXRecoverAssetsAction_executeWithUndoManager_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD13B0], "recoverAssets:", *(_QWORD *)(a1 + 32));
}

@end
