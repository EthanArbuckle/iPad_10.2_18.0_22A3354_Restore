@implementation OBSetupAssistantProgressController

- (OBSetupAssistantProgressController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBSetupAssistantProgressController;
  return -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v6, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, a5, 2);
}

- (OBSetupAssistantProgressController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBSetupAssistantProgressController;
  return -[OBWelcomeController initWithTitle:detailText:symbolName:contentLayout:](&v6, sel_initWithTitle_detailText_symbolName_contentLayout_, a3, a4, a5, 2);
}

- (void)viewDidLoad
{
  uint64_t v3;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v82;
  _QWORD v83[10];

  v83[8] = *MEMORY[0x1E0C80C00];
  v82.receiver = self;
  v82.super_class = (Class)OBSetupAssistantProgressController;
  -[OBBaseWelcomeController viewDidLoad](&v82, sel_viewDidLoad);
  -[OBWelcomeController setTemplateType:](self, "setTemplateType:", 2);
  -[OBSetupAssistantProgressController _progressFont](self, "_progressFont");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBSetupAssistantProgressController setProgressLabel:](self, "setProgressLabel:", v5);

  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v3);

  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 0);
  -[OBSetupAssistantProgressController setProgressBar:](self, "setProgressBar:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProgressTintColor:", v13);

  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBWelcomeController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[OBWelcomeController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollView](self, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)v3;
  -[OBSetupAssistantProgressController _progressLabelTopAnchorConstraintConstantWithFont:](self, "_progressLabelTopAnchorConstraintConstantWithFont:", v3);
  objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:constant:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController setProgressLabelTopAnchorConstraint:](self, "setProgressLabelTopAnchorConstraint:", v24);

  v65 = (void *)MEMORY[0x1E0CB3718];
  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintGreaterThanOrEqualToAnchor:", v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v76;
  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v71;
  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "heightAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "intrinsicContentSize");
  objc_msgSend(v68, "constraintEqualToConstant:", v25);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v67;
  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -14.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v83[3] = v61;
  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leftAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "safeAreaLayoutGuide");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "leftAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v83[4] = v55;
  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "rightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "safeAreaLayoutGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v83[5] = v27;
  -[OBSetupAssistantProgressController progressLabelTopAnchorConstraint](self, "progressLabelTopAnchorConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v83[6] = v28;
  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v83[7] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "activateConstraints:", v34);

  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = 1148846080;
  objc_msgSend(v35, "setContentHuggingPriority:forAxis:", 1, v36);

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "type");

  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v38 == 2)
  {
    objc_msgSend(v39, "widthAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToConstant:", 448.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);
  }
  else
  {
    objc_msgSend(v39, "leftAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "safeAreaLayoutGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leftAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

    -[OBSetupAssistantProgressController progressBar](self, "progressBar");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "rightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "safeAreaLayoutGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "rightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OBSetupAssistantProgressController;
  -[OBWelcomeController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  -[OBSetupAssistantProgressController _progressFont](self, "_progressFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[OBSetupAssistantProgressController _progressLabelTopAnchorConstraintConstantWithFont:](self, "_progressLabelTopAnchorConstraintConstantWithFont:", v4);
  v7 = v6;
  -[OBSetupAssistantProgressController progressLabelTopAnchorConstraint](self, "progressLabelTopAnchorConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OBWelcomeController headerView](self, "headerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)setProgressText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OBSetupAssistantProgressController progressLabel](self, "progressLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setProgress:(double)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3;
  -[OBSetupAssistantProgressController progressBar](self, "progressBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setProgress:", v4);

}

- (id)_progressFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (double)_progressLabelTopAnchorConstraintConstantWithFont:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "ascender");
  v5 = v4;
  objc_msgSend(v3, "descender");
  v7 = v6;

  return -(v5 - v7);
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
  objc_storeStrong((id *)&self->_progressBar, a3);
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_progressLabel, a3);
}

- (NSLayoutConstraint)progressLabelTopAnchorConstraint
{
  return self->_progressLabelTopAnchorConstraint;
}

- (void)setProgressLabelTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_progressLabelTopAnchorConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabelTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
}

@end
