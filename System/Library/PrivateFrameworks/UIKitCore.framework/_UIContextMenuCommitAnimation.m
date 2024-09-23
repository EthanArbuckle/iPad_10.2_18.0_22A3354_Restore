@implementation _UIContextMenuCommitAnimation

- (_UIContextMenuCommitAnimation)initWithSource:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  _UIContextMenuCommitAnimation *v8;
  _UIContextMenuCommitAnimation *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIContextMenuCommitAnimation;
  v8 = -[_UIContextMenuCommitAnimation init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_UIContextMenuCommitAnimation setSource:](v8, "setSource:", v6);
    -[_UIContextMenuCommitAnimation setContainer:](v9, "setContainer:", v7);
    -[_UIContextMenuCommitAnimation setSourceRadius:](v9, "setSourceRadius:", 13.0);
    -[_UIContextMenuCommitAnimation container](v9, "container");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayCornerRadius");
    -[_UIContextMenuCommitAnimation setDestinationRadius:](v9, "setDestinationRadius:");

  }
  return v9;
}

- (void)animateWithAlongsideActions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIClickPresentationFeedbackGenerator *v14;
  void *v15;
  void *v16;
  _UIClickPresentationFeedbackGenerator *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[5];
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  _QWORD aBlock[5];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke;
  aBlock[3] = &unk_1E16BC218;
  aBlock[4] = self;
  v9 = v7;
  v46 = v9;
  v10 = _Block_copy(aBlock);
  -[_UIContextMenuCommitAnimation container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v12, "userInterfaceIdiom"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [_UIClickPresentationFeedbackGenerator alloc];
  v34 = v13;
  objc_msgSend(v13, "presentationFeedbackConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCommitAnimation container](self, "container");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_UIClickPresentationFeedbackGenerator initWithConfiguration:view:](v14, "initWithConfiguration:view:", v15, v16);

  -[_UIClickPresentationFeedbackGenerator userInteractionStarted](v17, "userInteractionStarted");
  -[_UIClickPresentationFeedbackGenerator poppedAtLocation:](v17, "poppedAtLocation:", 1.79769313e308, 1.79769313e308);
  -[_UIClickPresentationFeedbackGenerator userInteractionEnded](v17, "userInteractionEnded");
  v44[0] = v8;
  v44[1] = 3221225472;
  v44[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_8;
  v44[3] = &unk_1E16B1B28;
  v44[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v44);
  if (v6)
  {
    v42[0] = v8;
    v42[1] = 3221225472;
    v42[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_2;
    v42[3] = &unk_1E16B1BF8;
    v43 = v6;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v42);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[_UIContextMenuCommitAnimation container](self, "container");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subviews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (!v21)
  {

LABEL_17:
    -[_UIContextMenuCommitAnimation container](self, "container", v31, v32, v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCommitAnimation setDestination:](self, "setDestination:", v29);

    v23 = 0;
    goto LABEL_18;
  }
  v22 = v21;
  v31 = v10;
  v32 = v9;
  v33 = v6;
  v23 = 0;
  v24 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v39 != v24)
        objc_enumerationMutation(v20);
      v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v26, "isHidden") & 1) == 0)
      {
        objc_msgSend(v26, "alpha");
        if (v27 >= 2.22044605e-16)
        {
          v28 = v26;

          v23 = v28;
        }
      }
    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  }
  while (v22);

  v6 = v33;
  if (!v23)
    goto LABEL_17;
  -[_UIContextMenuCommitAnimation setDestination:](self, "setDestination:", v23);
LABEL_18:
  v30 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_3;
  v37[3] = &unk_1E16B1B28;
  v37[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v37, v31, v32, v33);
  v36[0] = v30;
  v36[1] = 3221225472;
  v36[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_4;
  v36[3] = &unk_1E16B1B28;
  v36[4] = self;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v36, v10, 0.5, 0.0, 0.7, 15.0);
  v35[0] = v30;
  v35[1] = 3221225472;
  v35[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_5;
  v35[3] = &unk_1E16B1888;
  v35[4] = self;
  v35[5] = 2;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v35, v10, 0.35, 0.0, 1.0, 0.0);

}

- (void)_prepareSnapshots
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;

  -[_UIContextMenuCommitAnimation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCommitAnimation container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  _UISnapshotScreenAtViewRectAfterCommit(v3, 0, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuCommitAnimation container](self, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "setFrame:");

  -[_UIContextMenuCommitAnimation setOriginalContentSnapshotView:](self, "setOriginalContentSnapshotView:", v9);
  -[_UIContextMenuCommitAnimation source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentationLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[_UIContextMenuCommitAnimation source](self, "source");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCommitAnimation container](self, "container");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertRect:toView:", v24, v15, v17, v19, v21);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[_UIContextMenuCommitAnimation container](self, "container");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  _UISnapshotScreenAtViewRectAfterCommit(v33, 0, v26, v28, v30, v32);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setFrame:", 0.0, 0.0, v30, v32);
  -[_UIContextMenuCommitAnimation sourceRadius](self, "sourceRadius");
  objc_msgSend(v34, "_setContinuousCornerRadius:");
  objc_msgSend(v34, "setClipsToBounds:", 1);
  -[_UIContextMenuCommitAnimation setSourceSnapshotView:](self, "setSourceSnapshotView:", v34);

}

- (void)_prepareAnimationViews
{
  _UIContextMenuCommitContainerView *v3;
  void *v4;
  _UIContextMenuCommitContainerView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIView *v20;
  void *v21;
  _UIPortalView *v22;
  void *v23;
  _UIPortalView *v24;
  void *v25;
  UIView *v26;
  UIView *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double Width;
  CGFloat v47;
  UIView *v48;
  void *v49;
  UIView *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double Height;
  CGFloat v73;
  CGFloat v74;
  CGRect rect;
  __int128 v76;
  __int128 v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v3 = [_UIContextMenuCommitContainerView alloc];
  -[_UIContextMenuCommitAnimation container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[UIView initWithFrame:](v3, "initWithFrame:");

  -[_UIContextMenuCommitAnimation originalContentSnapshotView](self, "originalContentSnapshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v5, "addSubview:", v6);

  -[_UIContextMenuCommitAnimation container](self, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v5);

  -[_UIContextMenuCommitAnimation setAnimationContainer:](self, "setAnimationContainer:", v5);
  -[_UIContextMenuCommitAnimation source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v13, v15, v17, v19);
  -[UIView setClipsToBounds:](v20, "setClipsToBounds:", 1);
  -[_UIContextMenuCommitAnimation sourceRadius](self, "sourceRadius");
  -[UIView _setContinuousCornerRadius:](v20, "_setContinuousCornerRadius:");
  -[_UIContextMenuCommitAnimation animationContainer](self, "animationContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v20);

  -[_UIContextMenuCommitAnimation setMorphContainer:](self, "setMorphContainer:", v20);
  v22 = [_UIPortalView alloc];
  -[_UIContextMenuCommitAnimation destination](self, "destination");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v24 = -[_UIPortalView initWithFrame:](v22, "initWithFrame:");

  -[_UIContextMenuCommitAnimation destination](self, "destination");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPortalView setSourceView:](v24, "setSourceView:", v25);

  -[_UIPortalView setAllowsBackdropGroups:](v24, "setAllowsBackdropGroups:", 1);
  -[_UIPortalView setAllowsHitTesting:](v24, "setAllowsHitTesting:", 1);
  -[_UIContextMenuCommitAnimation setDestinationContentPortalView:](self, "setDestinationContentPortalView:", v24);
  v26 = [UIView alloc];
  -[UIView bounds](v24, "bounds");
  v27 = -[UIView initWithFrame:](v26, "initWithFrame:");
  -[UIView addSubview:](v27, "addSubview:", v24);
  -[_UIContextMenuCommitAnimation morphContainer](self, "morphContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v27);

  -[_UIContextMenuCommitAnimation morphContainer](self, "morphContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  rect.origin.x = v34;
  v37 = v36;

  -[UIView bounds](v27, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v81.origin.x = v31;
  v81.origin.y = v33;
  v81.size.width = v35;
  v81.size.height = v37;
  Width = CGRectGetWidth(v81);
  v82.origin.x = v39;
  v82.origin.y = v41;
  v82.size.width = v43;
  v82.size.height = v45;
  v47 = Width / CGRectGetWidth(v82);
  v83.origin.x = v31;
  v83.origin.y = v33;
  v83.size.width = rect.origin.x;
  v83.size.height = v37;
  CGRectGetHeight(v83);
  v84.origin.x = v39;
  v84.origin.y = v41;
  v84.size.width = v43;
  v84.size.height = v45;
  CGRectGetHeight(v84);
  CGAffineTransformMakeScale(&v80, v47, v47);
  v79 = v80;
  -[UIView setTransform:](v27, "setTransform:", &v79);
  -[UIView setCenter:](v27, "setCenter:", v31 + rect.origin.x * 0.5, v33 + v37 * 0.5);

  -[_UIContextMenuCommitAnimation setDestinationTransformView:](self, "setDestinationTransformView:", v27);
  v48 = [UIView alloc];
  -[_UIContextMenuCommitAnimation sourceSnapshotView](self, "sourceSnapshotView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  v50 = -[UIView initWithFrame:](v48, "initWithFrame:");

  -[_UIContextMenuCommitAnimation sourceSnapshotView](self, "sourceSnapshotView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v50, "addSubview:", v51);

  -[_UIContextMenuCommitAnimation morphContainer](self, "morphContainer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addSubview:", v50);

  -[_UIContextMenuCommitAnimation morphContainer](self, "morphContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bounds");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;

  -[UIView bounds](v50, "bounds");
  v63 = v62;
  v74 = v64;
  rect.origin.x = v62;
  v66 = v65;
  v68 = v67;
  v85.origin.x = v55;
  v85.origin.y = v57;
  v69 = v57;
  rect.origin.y = v57;
  v85.size.width = v59;
  v85.size.height = v61;
  v70 = CGRectGetWidth(v85);
  v86.origin.x = v63;
  v86.origin.y = v66;
  v86.size.width = v68;
  v86.size.height = v74;
  v71 = v70 / CGRectGetWidth(v86);
  v87.origin.x = v55;
  v87.origin.y = v69;
  v87.size.width = v59;
  v87.size.height = v61;
  Height = CGRectGetHeight(v87);
  v88.origin.x = rect.origin.x;
  v88.origin.y = v66;
  v88.size.width = v68;
  v88.size.height = v74;
  v73 = CGRectGetHeight(v88);
  CGAffineTransformMakeScale(&v78, v71, Height / v73);
  rect.size = *(CGSize *)&v78.a;
  v76 = *(_OWORD *)&v78.c;
  v77 = *(_OWORD *)&v78.tx;
  -[UIView setTransform:](v50, "setTransform:", &rect.size);
  -[UIView setCenter:](v50, "setCenter:", v55 + v59 * 0.5, rect.origin.y + v61 * 0.5);
  -[_UIContextMenuCommitAnimation setSourceTransformView:](self, "setSourceTransformView:", v50);

}

- (double)sourceRadius
{
  return self->_sourceRadius;
}

- (void)setSourceRadius:(double)a3
{
  self->_sourceRadius = a3;
}

- (double)destinationRadius
{
  return self->_destinationRadius;
}

- (void)setDestinationRadius:(double)a3
{
  self->_destinationRadius = a3;
}

- (UIView)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (UIView)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (UIView)morphContainer
{
  return self->_morphContainer;
}

- (void)setMorphContainer:(id)a3
{
  objc_storeStrong((id *)&self->_morphContainer, a3);
}

- (UIView)sourceSnapshotView
{
  return self->_sourceSnapshotView;
}

- (void)setSourceSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceSnapshotView, a3);
}

- (UIView)sourceTransformView
{
  return self->_sourceTransformView;
}

- (void)setSourceTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTransformView, a3);
}

- (UIView)destinationTransformView
{
  return self->_destinationTransformView;
}

- (void)setDestinationTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_destinationTransformView, a3);
}

- (UIView)originalContentSnapshotView
{
  return self->_originalContentSnapshotView;
}

- (void)setOriginalContentSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_originalContentSnapshotView, a3);
}

- (_UIPortalView)destinationContentPortalView
{
  return self->_destinationContentPortalView;
}

- (void)setDestinationContentPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_destinationContentPortalView, a3);
}

- (_UIContextMenuCommitContainerView)animationContainer
{
  return self->_animationContainer;
}

- (void)setAnimationContainer:(id)a3
{
  objc_storeStrong((id *)&self->_animationContainer, a3);
}

- (unint64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unint64_t)a3
{
  self->_animationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_destinationContentPortalView, 0);
  objc_storeStrong((id *)&self->_originalContentSnapshotView, 0);
  objc_storeStrong((id *)&self->_destinationTransformView, 0);
  objc_storeStrong((id *)&self->_sourceTransformView, 0);
  objc_storeStrong((id *)&self->_sourceSnapshotView, 0);
  objc_storeStrong((id *)&self->_morphContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
