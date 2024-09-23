@implementation UIAlertControllerPresentationController

uint64_t __95___UIAlertControllerPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsIfNecessary");
}

uint64_t __74___UIAlertControllerPresentationController__prepareConstraintsIfNecessary__block_invoke(id *a1)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;

  objc_msgSend((id)objc_opt_class(), "positionContentsOfAlertController:alertContentView:availableSpaceView:visualStyle:updatableConstraints:", a1[5], a1[6], a1[7], a1[4], *((_QWORD *)a1[8] + 47));
  objc_msgSend(a1[5], "_setShouldReverseActions:", objc_msgSend(a1[4], "_shouldReverseActions"));
  v2 = a1[4];
  objc_msgSend(a1[8], "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInsetsForContainerView:", v3);
  v5 = v4;
  v7 = v6;

  objc_msgSend(a1[6], "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v9, v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = a1[8];
  v12 = (void *)v11[48];
  v11[48] = v10;

  objc_msgSend(a1[6], "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:", v14, -v7);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = a1[8];
  v17 = (void *)v16[49];
  v16[49] = v15;

  objc_msgSend(a1[9], "addObject:", *((_QWORD *)a1[8] + 48));
  objc_msgSend(a1[9], "addObject:", *((_QWORD *)a1[8] + 49));
  return objc_msgSend(a1[10], "addConstraints:", a1[9]);
}

@end
