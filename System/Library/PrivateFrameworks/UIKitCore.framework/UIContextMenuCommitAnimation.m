@implementation UIContextMenuCommitAnimation

void __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") - 1);
  os_variant_has_internal_diagnostics();
  objc_msgSend(*(id *)(a1 + 32), "animationCount");
  if (!objc_msgSend(*(id *)(a1 + 32), "animationCount"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
    objc_msgSend(*(id *)(a1 + 32), "animationContainer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

  }
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareSnapshots");
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_2(uint64_t a1)
{
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", *(_QWORD *)(a1 + 32));
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareAnimationViews");
}

void __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double Width;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _OWORD v35[3];
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v31 = v10;
  v32 = v6 + v10 * 0.5;
  v33 = v4 + v8 * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "sourceTransformView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v38.origin.x = v4;
  v34 = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  Width = CGRectGetWidth(v38);
  v39.origin.x = v13;
  v39.origin.y = v15;
  v39.size.width = v17;
  v39.size.height = v19;
  v21 = Width / CGRectGetWidth(v39);
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v31;
  CGRectGetHeight(v40);
  v41.origin.x = v13;
  v41.origin.y = v15;
  v41.size.width = v17;
  v41.size.height = v19;
  CGRectGetHeight(v41);
  CGAffineTransformMakeScale(&v37, v21, v21);
  objc_msgSend(*(id *)(a1 + 32), "sourceTransformView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v37;
  objc_msgSend(v22, "setTransform:", &v36);

  objc_msgSend(*(id *)(a1 + 32), "sourceTransformView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCenter:", v33, v32);

  objc_msgSend(*(id *)(a1 + 32), "destinationTransformView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v35[0] = *MEMORY[0x1E0C9BAA8];
  v35[1] = v25;
  v35[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v24, "setTransform:", v35);

  objc_msgSend(*(id *)(a1 + 32), "destinationTransformView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", v33, v32);

  objc_msgSend(*(id *)(a1 + 32), "destinationRadius");
  v28 = v27;
  objc_msgSend(*(id *)(a1 + 32), "morphContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_setContinuousCornerRadius:", v28);

  objc_msgSend(*(id *)(a1 + 32), "morphContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBounds:", v34, v6, v8, v31);

}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "morphContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "destinationTransformView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_6;
  v11[3] = &unk_1E16B1B28;
  v9 = *(_QWORD *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", v9, v11, 0, 0.0, 0.0);
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_7;
  v5[3] = &unk_1E16B1B28;
  v5[4] = *(_QWORD *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.4);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_8;
  v4[3] = &unk_1E16B1B28;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.3, 0.4);
}

void __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_7(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sourceTransformView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_8(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "originalContentSnapshotView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

@end
