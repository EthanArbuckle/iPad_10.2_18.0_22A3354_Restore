@implementation PXSurveyRadarReporterViewController

- (PXSurveyRadarReporterViewController)initWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  PXSurveyRadarReporterViewController *v12;
  PXSurveyRadarReporterViewController *v13;
  void *v14;
  id completionHandler;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  UILabel *detailLabel;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIButton *readReleaseAgreementButton;
  UIButton *v28;
  void *v29;
  UIButton *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UILabel *v37;
  UIButton *v38;
  UILabel *v39;
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
  uint64_t v50;
  OBTrayButton *notNowButton;
  OBTrayButton *v52;
  void *v53;
  OBTrayButton *v54;
  void *v55;
  void *v56;
  void *v58;
  id v59;
  id v60;
  objc_super v61;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyRadarReporterViewController.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionTitle"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("Photos_GettingStarted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v61.receiver = self;
  v61.super_class = (Class)PXSurveyRadarReporterViewController;
  v12 = -[PXSurveyRadarReporterViewController initWithTitle:detailText:icon:contentLayout:](&v61, sel_initWithTitle_detailText_icon_contentLayout_, v10, 0, v11, 2);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    v14 = _Block_copy(v9);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = v14;

    v16 = objc_alloc(MEMORY[0x1E0DC3990]);
    v17 = *MEMORY[0x1E0C9D648];
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v21 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E0C9D648], v18, v19, v20);
    v59 = v9;
    detailLabel = v13->_detailLabel;
    v13->_detailLabel = (UILabel *)v21;

    -[PXSurveyRadarReporterViewController attributedDetailText](v13, "attributedDetailText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v13->_detailLabel, "setAttributedText:", v23);

    -[UILabel setTextAlignment:](v13->_detailLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13->_detailLabel, "setTextColor:", v24);

    -[UILabel setAdjustsFontSizeToFitWidth:](v13->_detailLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v13->_detailLabel, "setMinimumScaleFactor:", 0.75);
    -[UILabel setNumberOfLines:](v13->_detailLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXSurveyRadarReporterViewController contentView](v13, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v13->_detailLabel);

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", v17, v18, v19, v20);
    readReleaseAgreementButton = v13->_readReleaseAgreementButton;
    v13->_readReleaseAgreementButton = (UIButton *)v26;

    v28 = v13->_readReleaseAgreementButton;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionPhotosReadFullReleaseAgreement"), CFSTR("PhotosUICore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v28, "setTitle:forState:", v29, 0);

    -[UIButton addTarget:action:forControlEvents:](v13->_readReleaseAgreementButton, "addTarget:action:forControlEvents:", v13, sel__didSelectReadReleaseAgreementButton, 64);
    v30 = v13->_readReleaseAgreementButton;
    -[PXSurveyRadarReporterViewController view](v13, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "tintColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v30, "setTitleColor:forState:", v32, 0);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v13->_readReleaseAgreementButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton titleLabel](v13->_readReleaseAgreementButton, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNumberOfLines:", 0);

    -[UIButton titleLabel](v13->_readReleaseAgreementButton, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLineBreakMode:", 0);

    -[UIButton titleLabel](v13->_readReleaseAgreementButton, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTextAlignment:", 1);

    -[PXSurveyRadarReporterViewController contentView](v13, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v13->_readReleaseAgreementButton);

    v60 = v8;
    v37 = v13->_detailLabel;
    v38 = v13->_readReleaseAgreementButton;
    v39 = v37;
    _NSDictionaryOfVariableBindings(CFSTR("detailLabel, readReleaseAgreementButton"), v39, v38, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyRadarReporterViewController contentView](v13, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[detailLabel]|"), 0, 0, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addConstraints:", v42);

    -[PXSurveyRadarReporterViewController contentView](v13, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[readReleaseAgreementButton]-|"), 0, 0, v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addConstraints:", v44);

    -[PXSurveyRadarReporterViewController contentView](v13, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[detailLabel]-[readReleaseAgreementButton]|"), 0, 0, v40);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addConstraints:", v46);

    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionAgree"), CFSTR("PhotosUICore"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTitle:forState:", v48, 0);

    objc_msgSend(v47, "addTarget:action:forControlEvents:", v13, sel__handleAgreeButton_, 0x2000);
    -[PXSurveyRadarReporterViewController buttonTray](v13, "buttonTray");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addButton:", v47);

    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v50 = objc_claimAutoreleasedReturnValue();
    notNowButton = v13->_notNowButton;
    v13->_notNowButton = (OBTrayButton *)v50;

    -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v13->_notNowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v52 = v13->_notNowButton;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionNotNow"), CFSTR("PhotosUICore"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v52, "setTitle:forState:", v53, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](v13->_notNowButton, "addTarget:action:forControlEvents:", v13, sel__handleNotNowButton_, 0x2000);
    v54 = v13->_notNowButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitleColor:forState:](v54, "setTitleColor:forState:", v55, 0);

    -[PXSurveyRadarReporterViewController buttonTray](v13, "buttonTray");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v60;
    objc_msgSend(v56, "addButton:", v13->_notNowButton);

    v9 = v59;
    -[PXSurveyRadarReporterViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 2);

  }
  return v13;
}

- (PXSurveyRadarReporterViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyRadarReporterViewController.m"), 91, CFSTR("%s is not available as initializer"), "-[PXSurveyRadarReporterViewController initWithTitle:detailText:icon:]");

  abort();
}

- (PXSurveyRadarReporterViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyRadarReporterViewController.m"), 95, CFSTR("%s is not available as initializer"), "-[PXSurveyRadarReporterViewController initWithTitle:detailText:icon:contentLayout:]");

  abort();
}

- (id)attributedDetailText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionDescriptionLine1"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@\n\n"), v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionDescriptionLine2"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\n\n"), v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionDescriptionLine3"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@\n\n"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionDescriptionLine4"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@\n\n"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionDescriptionLine5"), CFSTR("PhotosUICore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@\n\n"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionDescriptionLine6"), CFSTR("PhotosUICore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 2, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x1E0DC1138];
  v31[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v29, v20);
  v22 = (void *)v6;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, 0);
  objc_msgSend(v21, "appendAttributedString:", v23);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v20);
  objc_msgSend(v21, "appendAttributedString:", v24);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v12, 0);
  objc_msgSend(v21, "appendAttributedString:", v25);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v15, v20);
  objc_msgSend(v21, "appendAttributedString:", v26);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v18, 0);
  objc_msgSend(v21, "appendAttributedString:", v27);

  return v21;
}

- (void)_didSelectReadReleaseAgreementButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DC3450];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSubmissionPhotosReleaseAgreement"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRadarConfiguration description](self->_configuration, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[PXSurveyRadarReporterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)_handleAgreeButton:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PXSurveyRadarReporterViewController__handleAgreeButton___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXSurveyRadarReporterViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)_handleNotNowButton:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PXSurveyRadarReporterViewController__handleNotNowButton___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXSurveyRadarReporterViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (OBTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
  objc_storeStrong((id *)&self->_notNowButton, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (UIButton)readReleaseAgreementButton
{
  return self->_readReleaseAgreementButton;
}

- (void)setReadReleaseAgreementButton:(id)a3
{
  objc_storeStrong((id *)&self->_readReleaseAgreementButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readReleaseAgreementButton, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __59__PXSurveyRadarReporterViewController__handleNotNowButton___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__PXSurveyRadarReporterViewController__handleAgreeButton___block_invoke(uint64_t a1)
{
  uint64_t result;

  PXFileRadarWithConfiguration(*(void **)(*(_QWORD *)(a1 + 32) + 1176));
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
