@implementation OBTouchIDEnrollmentWelcomeController

- (void)startTitleTransitionAnimated:(BOOL)a3 heightDifference:(id)a4
{
  void (**v5)(_QWORD, double);
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
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
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD, double))a4;
  -[OBWelcomeController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  -[OBWelcomeController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "headerLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  LODWORD(v13) = 1112014848;
  LODWORD(v15) = 1132068864;
  objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v14, 0.0, v13, v15);
  v17 = v16;

  -[OBWelcomeController headerView](self, "headerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "detailLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;

  -[OBWelcomeController headerView](self, "headerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "detailLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self, "headerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  LODWORD(v25) = 1112014848;
  LODWORD(v27) = 1132068864;
  objc_msgSend(v23, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v26, 0.0, v25, v27);
  v29 = v28;

  v30 = v29 != v21 || v17 != v9;
  if (v5)
    v5[2](v5, v9 - v17 + v21 - v29);
  -[OBWelcomeController headerView](self, "headerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[OBWelcomeController headerView](self, "headerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "headerLabel");

  }
  -[OBWelcomeController headerView](self, "headerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "headerLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[OBWelcomeController headerView](self, "headerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[OBTouchIDEnrollmentWelcomeController shouldAnimateEntireView](self, "shouldAnimateEntireView"))
    {
      -[OBTouchIDEnrollmentWelcomeController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = v37;
    }
  }
  -[OBWelcomeController _animatePushTransitionForViews:transitionSubtype:](self, "_animatePushTransitionForViews:transitionSubtype:", v35, 0);

}

- (BOOL)shouldAnimateEntireView
{
  return 0;
}

@end
