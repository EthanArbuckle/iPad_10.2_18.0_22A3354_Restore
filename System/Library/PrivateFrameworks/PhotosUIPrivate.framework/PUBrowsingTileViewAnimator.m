@implementation PUBrowsingTileViewAnimator

- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  objc_super v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingTileViewAnimator.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileController isKindOfClass:[PUTileViewController class]]"));

  }
  v15 = v11;
  v16 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "kind") == 101)
  {
    objc_msgSend(v15, "view");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "snapshotViewAfterScreenUpdates:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "presentationLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    objc_msgSend(v18, "setFrame:", v22, v24, v26, v28);
    objc_msgSend(v17, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v18);

    if (v18)
    {
      v39[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0C9AA60];
    }
    v31 = (void *)MEMORY[0x1E0DC3F10];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __95__PUBrowsingTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_2;
    v37[3] = &unk_1E58AA518;
    v38 = v14;
    v32 = v14;
    objc_msgSend(v31, "performSystemAnimation:onViews:options:animations:completion:", 0, v30, 0, &__block_literal_global_17863, v37);
    objc_msgSend(v15, "applyLayoutInfo:", v12);

  }
  else
  {
    v35[1] = 3221225472;
    v35[2] = __95__PUBrowsingTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_3;
    v35[3] = &unk_1E58ABAC8;
    v36 = v14;
    v34.receiver = self;
    v34.super_class = (Class)PUBrowsingTileViewAnimator;
    v35[0] = MEMORY[0x1E0C809B0];
    v17 = v14;
    -[PUTileViewAnimator animateTileController:toLayoutInfo:withOptions:completionHandler:](&v34, sel_animateTileController_toLayoutInfo_withOptions_completionHandler_, v15, v12, v16, v35);
    v18 = v36;
  }

}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

uint64_t __95__PUBrowsingTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __95__PUBrowsingTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
