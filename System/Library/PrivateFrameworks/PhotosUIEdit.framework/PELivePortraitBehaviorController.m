@implementation PELivePortraitBehaviorController

- (PELivePortraitBehaviorController)initWithAsset:(id)a3 delegate:(id)a4 hasDepth:(BOOL)a5 hasLive:(BOOL)a6
{
  id v11;
  id v12;
  PELivePortraitBehaviorController *v13;
  PELivePortraitBehaviorController *v14;
  PELivePortraitBehaviorController *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PELivePortraitBehaviorController;
  v13 = -[PELivePortraitBehaviorController init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_asset, a3);
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_hasDepth = a5;
    v14->_hasLive = a6;
    v15 = v14;
  }

  return v14;
}

- (void)applySideEffectsForAction:(unint64_t)a3 compositionController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CMTime v30;
  CMTime time1;
  CMTime time2;
  CMTime v33;

  v6 = a4;
  -[PELivePortraitBehaviorController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _PFAssertContinueHandler();
    goto LABEL_44;
  }
  objc_msgSend(v6, "depthAdjustmentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v8;
  if (v8)
    LODWORD(v23) = objc_msgSend(v8, "enabled");
  else
    LODWORD(v23) = 0;
  objc_msgSend(v6, "livePhotoKeyFrameAdjustmentController", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autoLoopAdjustmentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v9;
  if (v9)
  {
    objc_msgSend(v9, "flavor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = PIAutoLoopFlavorFromString();

    v25 = v11 != 0;
    v12 = v11 != 3 && v11 != 0;
  }
  else
  {
    v12 = 0;
    v25 = 0;
  }
  v13 = objc_msgSend(v7, "isLivePhotoVideoEnabled");
  objc_msgSend(v6, "portraitAdjustmentController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "enabled");
  if (v15)
  {
    objc_msgSend(v14, "kind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(MEMORY[0x24BE71CC8], "isPortraitStageEffect:", v16);

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v6, "retouchAdjustmentController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v26, "retouchStrokeCount");
  switch(a3)
  {
    case 0uLL:
      goto LABEL_24;
    case 1uLL:
      if ((v13 & v15) != 1)
        goto LABEL_23;
      v12 = -[PELivePortraitBehaviorController changingPortraitLightingDisablesLive](self, "changingPortraitLightingDisablesLive") | v17;
      goto LABEL_24;
    case 2uLL:
    case 3uLL:
LABEL_23:
      v12 = 0;
LABEL_24:
      if (!v29)
      {
        if (v25)
          goto LABEL_41;
LABEL_29:
        if (!v12)
          goto LABEL_43;
        goto LABEL_42;
      }
      objc_msgSend(v6, "trimAdjustmentController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        memset(&v33, 0, sizeof(v33));
        -[PELivePortraitBehaviorController delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
          objc_msgSend(v21, "unadjustedStillImageTime");
        else
          memset(&v33, 0, sizeof(v33));

        objc_msgSend(v20, "startTime");
        time1 = v33;
        if (CMTimeCompare(&time1, &time2) < 0
          || (objc_msgSend(v20, "endTime"), time1 = v33, CMTimeCompare(&time1, &v30) >= 1))
        {
          objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x24BE71F38]);
        }
      }
      objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E08]);

      if (!v25)
        goto LABEL_29;
LABEL_41:
      objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x24BE71D50]);
      objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E50]);
      objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E48]);
      objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x24BE71DF8]);
      if ((v12 & 1) == 0)
        goto LABEL_43;
LABEL_42:
      objc_msgSend(v7, "setLivePhotoVideoEnabled:", 0);
LABEL_43:

LABEL_44:
      return;
    case 4uLL:
      if ((v15 & 1) != 0
        && ((-[PELivePortraitBehaviorController changingPortraitLightingDisablesLive](self, "changingPortraitLightingDisablesLive") | v17) & 1) != 0)
      {
        goto LABEL_33;
      }
      goto LABEL_34;
    case 5uLL:
    case 6uLL:
      if (v24
        && (objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", *MEMORY[0x24BE71DB8], &__block_literal_global_1375), objc_msgSend(v6, "portraitAdjustmentController"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, v19))
      {
        objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", *MEMORY[0x24BE71E20], &__block_literal_global_24);
        if ((v15 & 1) == 0)
          goto LABEL_34;
      }
      else if (!v15)
      {
        goto LABEL_34;
      }
LABEL_33:
      objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E20]);
LABEL_34:
      if (v18)
        objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E50]);
      goto LABEL_43;
    default:
      goto LABEL_43;
  }
}

- (id)confirmationWarningStringForAction:(unint64_t)a3 compositionController:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend(a4, "copy");
  -[PELivePortraitBehaviorController applySideEffectsForAction:compositionController:](self, "applySideEffectsForAction:compositionController:", a3, v6);

  return 0;
}

- (BOOL)hasLivePortrait
{
  _BOOL4 v3;

  v3 = -[PELivePortraitBehaviorController hasDepth](self, "hasDepth");
  if (v3)
    LOBYTE(v3) = -[PELivePortraitBehaviorController hasLive](self, "hasLive");
  return v3;
}

- (BOOL)changingPortraitLightingDisablesLive
{
  return self->_changingPortraitLightingDisablesLive;
}

- (void)setChangingPortraitLightingDisablesLive:(BOOL)a3
{
  self->_changingPortraitLightingDisablesLive = a3;
}

- (BOOL)hasDepth
{
  return self->_hasDepth;
}

- (BOOL)hasLive
{
  return self->_hasLive;
}

- (PEAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PELivePortraitBehaviorDelegate)delegate
{
  return (PELivePortraitBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asset, 0);
}

uint64_t __84__PELivePortraitBehaviorController_applySideEffectsForAction_compositionController___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 0);
}

uint64_t __84__PELivePortraitBehaviorController_applySideEffectsForAction_compositionController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 0);
}

@end
