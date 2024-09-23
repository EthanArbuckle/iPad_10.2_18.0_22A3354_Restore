@implementation PXEditAdjustmentAction

- (PXEditAdjustmentAction)initWithCompositionController:(id)a3 adjustmentKey:(id)a4 targetValue:(id)a5
{
  id v8;
  id v9;
  PXEditAdjustmentAction *v10;
  uint64_t v11;
  NSString *adjustmentKey;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXEditAdjustmentAction;
  v10 = -[PXEditCompositionAction initWithCompositionController:](&v14, sel_initWithCompositionController_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    adjustmentKey = v10->_adjustmentKey;
    v10->_adjustmentKey = (NSString *)v11;

    objc_storeStrong((id *)&v10->_targetValue, a5);
  }

  return v10;
}

- (PXEditAdjustmentAction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditAdjustmentAction.m"), 61, CFSTR("%s is not available as initializer"), "-[PXEditAdjustmentAction init]");

  abort();
}

- (void)performAction:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NUComposition *v5;
  NUComposition *sourceComposition;
  NSString *adjustmentKey;
  NUComposition *v8;
  NUComposition *targetComposition;
  id v10;
  _QWORD v11[5];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXEditCompositionAction compositionController](self, "compositionController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "composition");
  v5 = (NUComposition *)objc_claimAutoreleasedReturnValue();
  sourceComposition = self->_sourceComposition;
  self->_sourceComposition = v5;

  adjustmentKey = self->_adjustmentKey;
  if (self->_targetValue)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__PXEditAdjustmentAction_performAction___block_invoke;
    v11[3] = &unk_1E5127F68;
    v11[4] = self;
    objc_msgSend(v10, "modifyAdjustmentWithKey:modificationBlock:", adjustmentKey, v11);
  }
  else
  {
    objc_msgSend(v10, "removeAdjustmentWithKey:", adjustmentKey);
  }
  objc_msgSend(v10, "composition");
  v8 = (NUComposition *)objc_claimAutoreleasedReturnValue();
  targetComposition = self->_targetComposition;
  self->_targetComposition = v8;

  v4[2](v4, 1, 0);
}

- (id)sourceComposition
{
  return self->_sourceComposition;
}

- (id)targetComposition
{
  return self->_targetComposition;
}

- (NSString)adjustmentKey
{
  return self->_adjustmentKey;
}

- (NSNumber)targetValue
{
  return self->_targetValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetComposition, 0);
  objc_storeStrong((id *)&self->_sourceComposition, 0);
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_adjustmentKey, 0);
}

void __40__PXEditAdjustmentAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "BOOLValue"));

}

+ (id)muteToggleActionWithCompositionController:(id)a3 isLoopingVideo:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  const __CFString *v17;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "adjustmentConstants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "PIMuteAdjustmentKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "adjustmentControllerForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v12 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "enabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || objc_msgSend(v11, "BOOLValue"))
  {
LABEL_6:
    v14 = objc_msgSend(v12, "BOOLValue");
    v13 = (id)MEMORY[0x1E0C9AAA0];
    if ((v14 & 1) != 0)
      goto LABEL_10;
    goto LABEL_7;
  }
  v13 = 0;
LABEL_7:
  v15 = (void *)MEMORY[0x1E0C9AAB0];
  if (v4)
    v15 = v13;
  v13 = v15;
LABEL_10:
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCompositionController:adjustmentKey:targetValue:", v6, v8, v13);
  if (objc_msgSend(v13, "BOOLValue"))
    v17 = CFSTR("PXLivePhotoMuteAction");
  else
    v17 = CFSTR("PXLivePhotoUnmuteAction");
  objc_msgSend(v16, "setActionNameLocalizationKey:", v17);

  return v16;
}

@end
