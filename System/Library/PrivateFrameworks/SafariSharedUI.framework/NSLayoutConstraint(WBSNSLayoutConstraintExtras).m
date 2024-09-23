@implementation NSLayoutConstraint(WBSNSLayoutConstraintExtras)

+ (uint64_t)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:
{
  return objc_msgSend(a1, "safari_constraintsMatchingFrameOfView:withFrameOfView:edgeInsets:", 0.0, 0.0, 0.0, 0.0);
}

+ (id)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:edgeInsets:
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a7;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 3, 0, v14, 3, 1.0, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 4, 0, v14, 4, 1.0, -a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 5, 0, v14, 5, 1.0, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 6, 0, v14, 6, 1.0, -a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:directionalInsets:
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v13 = a8;
  v14 = a7;
  objc_msgSend(v14, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  objc_msgSend(v14, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v20;
  objc_msgSend(v14, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

@end
