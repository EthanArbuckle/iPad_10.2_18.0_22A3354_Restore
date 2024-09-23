@implementation UIView(SiriUIAutoLayout)

- (id)siriui_pinToSuperviewWithEdgeInsets:()SiriUIAutoLayout
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(a1, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 6, 0, a1, 6, 1.0, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(a1, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 5, 0, a1, 5, 1.0, -a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(a1, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, 0, a1, 4, 1.0, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(a1, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 3, 0, a1, 3, 1.0, a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v28[1] = v12;
  v28[2] = v21;
  v28[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addConstraints:", v23);

  v26[0] = &unk_24D7EF3E8;
  v26[1] = &unk_24D7EF400;
  v27[0] = v21;
  v27[1] = v18;
  v26[2] = &unk_24D7EF418;
  v26[3] = &unk_24D7EF430;
  v27[2] = v15;
  v27[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)siriui_pinToLayoutGuide:()SiriUIAutoLayout
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v7;
  v22[1] = v13;
  v22[2] = v10;
  v22[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraints:", v17);

  v20[0] = &unk_24D7EF3E8;
  v20[1] = &unk_24D7EF400;
  v21[0] = v10;
  v21[1] = v16;
  v20[2] = &unk_24D7EF418;
  v20[3] = &unk_24D7EF430;
  v21[2] = v7;
  v21[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)siriui_pinLeadingToLeadingEdgeOf:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 5, 0, a4, 5, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinLeadingToTrailingEdgeOf:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 5, 0, a4, 6, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinTrailingToLeadingEdgeOf:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 6, 0, a4, 5, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinTrailingToTrailingEdgeOf:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 6, 0, a4, 6, 1.0, -a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_centerHorizontallyWithItem:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 9, 0, a4, 9, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_centerVerticallyWithItem:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 10, 0, a4, 10, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinTopTo:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 3, 0, a4, 3, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinBottomTo:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 4, 0, a4, 4, 1.0, -a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinBottomToTopOf:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 4, 0, a4, 3, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinLastBaselineToFirstBaseline:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 11, 0, a4, 12, 1.0, -a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinLeadingTo:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 5, 0, a4, 5, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_pinTrailingTo:()SiriUIAutoLayout withMargin:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 6, 0, a4, 6, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v5);

  return v5;
}

- (id)siriui_addWidthConstraint:()SiriUIAutoLayout
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 7, 0, 0, 0, 1.0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v3);
  return v3;
}

- (id)siriui_addHeightConstraint:()SiriUIAutoLayout
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 8, 0, 0, 0, 1.0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v3);
  return v3;
}

- (id)siriui_pinTopTo:()SiriUIAutoLayout withMargin:priority:
{
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 3, 0, a5, 3, 1.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setPriority:", v8);
  objc_msgSend(a1, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v7);

  return v7;
}

- (id)siriui_pinBottomTo:()SiriUIAutoLayout withMargin:priority:
{
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 4, 0, a5, 4, 1.0, -a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setPriority:", v8);
  objc_msgSend(a1, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v7);

  return v7;
}

- (id)siriui_pinBottomToTopOf:()SiriUIAutoLayout withMargin:priority:
{
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 4, 0, a5, 3, 1.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setPriority:", v8);
  objc_msgSend(a1, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v7);

  return v7;
}

- (id)siriui_pinLeadingToLeadingEdgeOf:()SiriUIAutoLayout withMargin:priority:
{
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 5, 0, a5, 5, 1.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setPriority:", v8);
  objc_msgSend(a1, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v7);

  return v7;
}

- (id)siriui_pinTrailingToTrailingEdgeOf:()SiriUIAutoLayout withMargin:priority:
{
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 6, 0, a5, 6, 1.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setPriority:", v8);
  objc_msgSend(a1, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v7);

  return v7;
}

- (id)siriui_pinLeadingToTrailingEdgeOf:()SiriUIAutoLayout withMargin:priority:
{
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 5, 0, a5, 6, 1.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setPriority:", v8);
  objc_msgSend(a1, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v7);

  return v7;
}

- (id)siriui_pinTrailingToLeadingEdgeOf:()SiriUIAutoLayout withMargin:priority:
{
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 6, 0, a5, 5, 1.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setPriority:", v8);
  objc_msgSend(a1, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v7);

  return v7;
}

- (id)siriui_centerVerticallyWithView:()SiriUIAutoLayout withMargin:priority:
{
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 10, 0, a5, 10, 1.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setPriority:", v8);
  objc_msgSend(a1, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v7);

  return v7;
}

- (id)siriui_addWidthConstraint:()SiriUIAutoLayout priority:
{
  void *v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 7, 0, 0, 0, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setPriority:", v6);
  objc_msgSend(a1, "addConstraint:", v5);
  return v5;
}

- (id)siriui_addHeightConstraint:()SiriUIAutoLayout priority:
{
  void *v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 8, 0, 0, 0, 1.0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setPriority:", v6);
  objc_msgSend(a1, "addConstraint:", v5);
  return v5;
}

@end
