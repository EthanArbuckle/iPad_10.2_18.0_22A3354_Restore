@implementation _UIScrollViewFPSHUD

+ (id)createFPSHUD
{
  objc_class *v0;
  int v1;
  void *v2;
  int v4;
  id v5;

  v0 = (objc_class *)objc_opt_self();
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v1 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1)
    goto LABEL_4;
  v4 = _UIInternalPreference_UIScrollViewFPSHUD;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_UIScrollViewFPSHUD)
    goto LABEL_4;
  while (v1 >= v4)
  {
    _UIInternalPreferenceSync(v1, &_UIInternalPreference_UIScrollViewFPSHUD, (uint64_t)CFSTR("UIScrollViewFPSHUD"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v2 = 0;
    v4 = _UIInternalPreference_UIScrollViewFPSHUD;
    if (v1 == _UIInternalPreference_UIScrollViewFPSHUD)
      return v2;
  }
  if (!byte_1ECD767EC)
  {
LABEL_4:
    v2 = 0;
  }
  else
  {
    v5 = [v0 alloc];
    v2 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  return v2;
}

- (void)updateDebugOverlayBounds:(CGFloat)a3 withScrollView:(CGFloat)a4
{
  id v11;
  BOOL v12;
  void *v13;
  CGRect v14;
  CGRect v15;

  v11 = a2;
  if (a1)
  {
    v13 = v11;
    if ((objc_msgSend(a1, "isDescendantOfView:", v11) & 1) != 0)
      objc_msgSend(v13, "bringSubviewToFront:", a1);
    else
      objc_msgSend(v13, "addSubview:", a1);
    objc_msgSend(a1, "frame");
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    v12 = CGRectEqualToRect(v14, v15);
    v11 = v13;
    if (!v12)
    {
      objc_msgSend(a1, "setFrame:", a3, a4, a5, a6);
      v11 = v13;
    }
  }

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (UILabel)createFormattedLabel
{
  UILabel *v0;
  void *v1;

  v0 = objc_alloc_init(UILabel);
  -[UILabel setTextAlignment:](v0, "setTextAlignment:", 0);
  +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v0, "setTextColor:", v1);

  return v0;
}

- (_UIScrollViewFPSHUD)initWithFrame:(CGRect)a3
{
  _UIScrollViewFPSHUD *v3;
  _UIScrollViewFPSHUD *v4;
  uint64_t v5;
  UILabel *preferredLabel;
  uint64_t v7;
  UILabel *reportedLabel;
  uint64_t v9;
  UILabel *mismatchesLabel;
  _UIScrollViewFPSHUDGraphView *v11;
  _UIScrollViewFPSHUDGraphView *preferredGraph;
  _UIScrollViewFPSHUDGraphView *v13;
  _UIScrollViewFPSHUDGraphView *reportedGraph;
  _UIScrollViewFPSHUDGraphView *v15;
  _UIScrollViewFPSHUDGraphView *mismatchesGraph;
  UIStackView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
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
  objc_super v41;
  _QWORD v42[10];

  v42[8] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)_UIScrollViewFPSHUD;
  v3 = -[UIView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_previousFramePreferred = 0;
    -[_UIScrollViewFPSHUD createFormattedLabel]();
    v5 = objc_claimAutoreleasedReturnValue();
    preferredLabel = v4->_preferredLabel;
    v4->_preferredLabel = (UILabel *)v5;

    -[_UIScrollViewFPSHUD createFormattedLabel]();
    v7 = objc_claimAutoreleasedReturnValue();
    reportedLabel = v4->_reportedLabel;
    v4->_reportedLabel = (UILabel *)v7;

    -[_UIScrollViewFPSHUD createFormattedLabel]();
    v9 = objc_claimAutoreleasedReturnValue();
    mismatchesLabel = v4->_mismatchesLabel;
    v4->_mismatchesLabel = (UILabel *)v9;

    -[UILabel setText:](v4->_mismatchesLabel, "setText:", CFSTR("Mismatches"));
    v11 = objc_alloc_init(_UIScrollViewFPSHUDGraphView);
    preferredGraph = v4->_preferredGraph;
    v4->_preferredGraph = v11;

    v13 = objc_alloc_init(_UIScrollViewFPSHUDGraphView);
    reportedGraph = v4->_reportedGraph;
    v4->_reportedGraph = v13;

    v15 = objc_alloc_init(_UIScrollViewFPSHUDGraphView);
    mismatchesGraph = v4->_mismatchesGraph;
    v4->_mismatchesGraph = v15;

    v17 = objc_alloc_init(UIStackView);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v17, "setAxis:", 1);
    -[UIStackView setDistribution:](v17, "setDistribution:", 3);
    +[UIColor systemBlackColor](UIColor, "systemBlackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorWithAlphaComponent:", 0.800000012);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](v17, "setBackgroundColor:", v19);

    -[UIStackView addArrangedSubview:](v17, "addArrangedSubview:", v4->_preferredLabel);
    -[UIStackView addArrangedSubview:](v17, "addArrangedSubview:", v4->_preferredGraph);
    -[UIStackView addArrangedSubview:](v17, "addArrangedSubview:", v4->_reportedLabel);
    -[UIStackView addArrangedSubview:](v17, "addArrangedSubview:", v4->_reportedGraph);
    -[UIStackView addArrangedSubview:](v17, "addArrangedSubview:", v4->_mismatchesLabel);
    -[UIStackView addArrangedSubview:](v17, "addArrangedSubview:", v4->_mismatchesGraph);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4, "addSubview:", v17);
    v32 = (void *)MEMORY[0x1E0D156E0];
    -[UIView trailingAnchor](v17, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v38;
    -[UIView centerYAnchor](v17, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v4, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v35;
    -[UIView heightAnchor](v4->_preferredGraph, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 30.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v33;
    -[UIView widthAnchor](v4->_preferredGraph, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 160.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v30;
    -[UIView heightAnchor](v4->_reportedGraph, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToConstant:", 30.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v20;
    -[UIView widthAnchor](v4->_reportedGraph, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 160.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v22;
    -[UIView heightAnchor](v4->_mismatchesGraph, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 5.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v24;
    -[UIView widthAnchor](v4->_mismatchesGraph, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToConstant:", 160.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[7] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v27);

  }
  return v4;
}

- (uint64_t)displayUpdateRequest:(uint64_t)a3 reportedRateForPreviousFrame:
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;

  if (result)
  {
    v5 = result;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Preferred: %d"), *(unsigned int *)(result + 464));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v5 + 416), "setText:", v6);

    -[_UIScrollViewFPSHUDGraphView addValue:](*(_QWORD *)(v5 + 440), *(_DWORD *)(v5 + 464));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Actual: %d"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v5 + 424), "setText:", v7);

    -[_UIScrollViewFPSHUDGraphView addValue:](*(_QWORD *)(v5 + 448), a3);
    if (*(_DWORD *)(v5 + 464) == (_DWORD)a3)
      v8 = 301;
    else
      v8 = 300;
    result = -[_UIScrollViewFPSHUDGraphView addValue:](*(_QWORD *)(v5 + 456), v8);
    *(_DWORD *)(v5 + 464) = *(_DWORD *)(a2 + 8);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mismatchesGraph, 0);
  objc_storeStrong((id *)&self->_reportedGraph, 0);
  objc_storeStrong((id *)&self->_preferredGraph, 0);
  objc_storeStrong((id *)&self->_mismatchesLabel, 0);
  objc_storeStrong((id *)&self->_reportedLabel, 0);
  objc_storeStrong((id *)&self->_preferredLabel, 0);
}

@end
