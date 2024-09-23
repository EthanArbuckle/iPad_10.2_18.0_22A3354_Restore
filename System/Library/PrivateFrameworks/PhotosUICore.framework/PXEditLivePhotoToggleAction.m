@implementation PXEditLivePhotoToggleAction

- (PXEditLivePhotoToggleAction)initWithCompositionController:(id)a3 livePhotoModel:(id)a4
{
  id v7;
  PXEditLivePhotoToggleAction *v8;
  const __CFString *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXEditLivePhotoToggleAction;
  v8 = -[PXEditCompositionAction initWithCompositionController:](&v11, sel_initWithCompositionController_, a3);
  if (v8)
  {
    if (objc_msgSend(v7, "isVideoEnabled"))
      v9 = CFSTR("PXLivePhotoDisableAction");
    else
      v9 = CFSTR("PXLivePhotoEnableAction");
    -[PXEditCompositionAction setActionNameLocalizationKey:](v8, "setActionNameLocalizationKey:", v9);
    objc_storeStrong((id *)&v8->_livePhotoModel, a4);
  }

  return v8;
}

- (void)performAction:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NUComposition *v5;
  NUComposition *sourceComposition;
  int v7;
  void *v8;
  void *v9;
  NUComposition *v10;
  NUComposition *targetComposition;
  id v12;
  _QWORD v13[4];
  char v14;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXEditCompositionAction compositionController](self, "compositionController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "composition");
  v5 = (NUComposition *)objc_claimAutoreleasedReturnValue();
  sourceComposition = self->_sourceComposition;
  self->_sourceComposition = v5;

  v7 = -[PXEditLivePhotoModel isVideoEnabled](self->_livePhotoModel, "isVideoEnabled");
  if (-[PXEditLivePhotoToggleAction _isLoopingVideo](self, "_isLoopingVideo"))
  {
    objc_msgSend(v12, "adjustmentConstants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "PIAutoLoopAdjustmentKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__PXEditLivePhotoToggleAction_performAction___block_invoke;
    v13[3] = &__block_descriptor_33_e40_v16__0__PIAutoLoopAdjustmentController_8l;
    v14 = v7;
    objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v9, v13);

  }
  objc_msgSend(v12, "composition");
  v10 = (NUComposition *)objc_claimAutoreleasedReturnValue();
  targetComposition = self->_targetComposition;
  self->_targetComposition = v10;

  -[PXEditLivePhotoModel setVideoEnabled:](self->_livePhotoModel, "setVideoEnabled:", v7 ^ 1u);
  v4[2](v4, 1, 0);

}

- (BOOL)_isLoopingVideo
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  -[PXEditCompositionAction compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoLoopAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "flavor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PIAutoLoopFlavorFromString();

    v6 = (unint64_t)(v5 - 1) < 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)performUndo:(id)a3
{
  PXEditLivePhotoModel *livePhotoModel;
  id v5;
  objc_super v6;

  livePhotoModel = self->_livePhotoModel;
  v5 = a3;
  -[PXEditLivePhotoModel setVideoEnabled:](self->_livePhotoModel, "setVideoEnabled:", -[PXEditLivePhotoModel isVideoEnabled](livePhotoModel, "isVideoEnabled") ^ 1);
  v6.receiver = self;
  v6.super_class = (Class)PXEditLivePhotoToggleAction;
  -[PXEditCompositionAction performUndo:](&v6, sel_performUndo_, v5);

}

- (void)performRedo:(id)a3
{
  PXEditLivePhotoModel *livePhotoModel;
  id v5;
  objc_super v6;

  livePhotoModel = self->_livePhotoModel;
  v5 = a3;
  -[PXEditLivePhotoModel setVideoEnabled:](self->_livePhotoModel, "setVideoEnabled:", -[PXEditLivePhotoModel isVideoEnabled](livePhotoModel, "isVideoEnabled") ^ 1);
  v6.receiver = self;
  v6.super_class = (Class)PXEditLivePhotoToggleAction;
  -[PXEditCompositionAction performRedo:](&v6, sel_performRedo_, v5);

}

- (id)sourceComposition
{
  return self->_sourceComposition;
}

- (id)targetComposition
{
  return self->_targetComposition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetComposition, 0);
  objc_storeStrong((id *)&self->_sourceComposition, 0);
  objc_storeStrong((id *)&self->_livePhotoModel, 0);
}

uint64_t __45__PXEditLivePhotoToggleAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", *(_BYTE *)(a1 + 32) == 0);
}

@end
