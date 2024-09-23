@implementation ICQTileView

+ (BOOL)shouldShowForPremiumOffer:(id)a3
{
  return 0;
}

- (ICQTileView)initWithPremiumOffer:(id)a3
{
  id v4;
  ICQTileView *v5;
  ICQTileView *v6;
  void *v7;
  void *v8;
  ICQTileView *v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQTileView;
  v5 = -[ICQTileView init](&v13, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  -[ICQTileView configureSubviews](v5, "configureSubviews");
  if (v4)
  {
    -[ICQTileView setPremiumOffer:](v6, "setPremiumOffer:", v4);
    objc_msgSend(v4, "opportunityBubble");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportingDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQTileView setReportingDetails:](v6, "setReportingDetails:", v8);

    -[ICQTileView _startOnDeviceJourneyForSystemUpgrade](v6, "_startOnDeviceJourneyForSystemUpgrade");
LABEL_4:
    v9 = v6;
    goto LABEL_8;
  }
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to initialize ICQTileView with a nil offer", v12, 2u);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (void)_startOnDeviceJourneyForSystemUpgrade
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  -[ICQTileView reportingDetails](self, "reportingDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "displayRuleType") == 1)
  {
    -[ICQTileView premiumOffer](self, "premiumOffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldStartOnDeviceJourney");

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BEC72C0];
      -[ICQTileView premiumOffer](self, "premiumOffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendEventFor:withBundleID:link:", 2, v8, 0);

      _ICQGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v10 = "Started on-device journey for device that was upgraded to Sky after a Premium offer CFU was seen in Azul device.";
        v11 = (uint8_t *)&v13;
LABEL_8:
        _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 0;
    v10 = "No need to start on-device journey.";
    v11 = (uint8_t *)&v12;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)setPremiumOffer:(id)a3
{
  ICQPremiumOffer *v5;
  void *v6;
  void *v7;
  void *v8;
  _ICQOpportunityBubbleReportingSpecification *v9;
  _ICQOpportunityBubbleReportingSpecification *reportingDetails;
  _QWORD v11[5];
  ICQPremiumOffer *v12;

  v5 = (ICQPremiumOffer *)a3;
  if (self->_premiumOffer != v5)
  {
    objc_storeStrong((id *)&self->_premiumOffer, a3);
    if (objc_msgSend(MEMORY[0x24BEC7308], "shouldEnableUnifiedMessaging"))
    {
      v6 = (void *)MEMORY[0x24BEC72C0];
      -[ICQPremiumOffer bundleIdentifier](v5, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __31__ICQTileView_setPremiumOffer___block_invoke;
      v11[3] = &unk_24E3F4030;
      v11[4] = self;
      v12 = v5;
      objc_msgSend(v6, "fetchBubbleContentWithBundleID:completion:", v7, v11);

    }
    else
    {
      -[ICQPremiumOffer opportunityBubble](v5, "opportunityBubble");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reportingDetails");
      v9 = (_ICQOpportunityBubbleReportingSpecification *)objc_claimAutoreleasedReturnValue();
      reportingDetails = self->_reportingDetails;
      self->_reportingDetails = v9;

      -[ICQTileView updateTileViewWithOffer:](self, "updateTileViewWithOffer:", v5);
    }
  }

}

uint64_t __31__ICQTileView_setPremiumOffer___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "setOpportunityBubble:", a2);
  objc_msgSend(*(id *)(a1 + 40), "opportunityBubble");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportingDetails");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 680);
  *(_QWORD *)(v5 + 680) = v4;

  return objc_msgSend(*(id *)(a1 + 32), "updateTileViewWithOffer:", *(_QWORD *)(a1 + 40));
}

- (void)configureSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *titleLabelTrailingConstraint;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *titleLabelDismissButtonSpacingConstraint;
  double v19;
  NSLayoutConstraint *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v36;
  void *v37;
  void *v38;
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
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[24];

  v106[22] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[ICQTileView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 12.0);

  v5 = *MEMORY[0x24BDE58E8];
  -[ICQTileView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerCurve:", v5);

  -[ICQTileView createOrUpdateTitleLabelWithTitle:](self, "createOrUpdateTitleLabelWithTitle:", 0);
  -[ICQTileView createOrUpdateMessageLabelWithMessage:](self, "createOrUpdateMessageLabelWithMessage:", 0);
  -[ICQTileView createOrUpdateImageViewFromImageDetails:](self, "createOrUpdateImageViewFromImageDetails:", 0);
  -[ICQTileView createSeparator](self, "createSeparator");
  -[ICQTileView createActionButtons](self, "createActionButtons");
  -[ICQTileView createActionButtonsStack](self, "createActionButtonsStack");
  -[ICQTileView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView trailingAnchor](self, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v9, -14.0);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLabelTrailingConstraint = self->_titleLabelTrailingConstraint;
  self->_titleLabelTrailingConstraint = v10;

  LODWORD(v12) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_titleLabelTrailingConstraint, "setPriority:", v12);
  -[ICQTileView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView dismissButton](self, "dismissButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:constant:", v16, -10.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLabelDismissButtonSpacingConstraint = self->_titleLabelDismissButtonSpacingConstraint;
  self->_titleLabelDismissButtonSpacingConstraint = v17;

  LODWORD(v19) = 1144913920;
  -[NSLayoutConstraint setPriority:](self->_titleLabelTrailingConstraint, "setPriority:", v19);
  v71 = (void *)MEMORY[0x24BDD1628];
  -[ICQTileView iconImageView](self, "iconImageView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView leadingAnchor](self, "leadingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:constant:", v103, 14.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v102;
  -[ICQTileView iconImageView](self, "iconImageView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView messageLabel](self, "messageLabel");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "topAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v97;
  -[ICQTileView iconImageView](self, "iconImageView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "widthAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToConstant:", 60.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v94;
  -[ICQTileView iconImageView](self, "iconImageView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "heightAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToConstant:", 60.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v106[3] = v91;
  -[ICQTileView titleLabel](self, "titleLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView iconImageView](self, "iconImageView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, 10.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v106[4] = v86;
  -[ICQTileView titleLabel](self, "titleLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView topAnchor](self, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, 14.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self->_titleLabelTrailingConstraint;
  v106[5] = v82;
  v106[6] = v20;
  v106[7] = self->_titleLabelDismissButtonSpacingConstraint;
  -[ICQTileView messageLabel](self, "messageLabel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView titleLabel](self, "titleLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v106[8] = v77;
  -[ICQTileView messageLabel](self, "messageLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView titleLabel](self, "titleLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, 5.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v106[9] = v72;
  -[ICQTileView messageLabel](self, "messageLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView trailingAnchor](self, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68, -14.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v106[10] = v67;
  -[ICQTileView separator](self, "separator");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView titleLabel](self, "titleLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v106[11] = v62;
  -[ICQTileView separator](self, "separator");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView messageLabel](self, "messageLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 10.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v106[12] = v57;
  -[ICQTileView separator](self, "separator");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView trailingAnchor](self, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v106[13] = v53;
  -[ICQTileView separator](self, "separator");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "heightAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToConstant:", 0.5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v106[14] = v50;
  -[ICQTileView actionButtonsStack](self, "actionButtonsStack");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView titleLabel](self, "titleLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v106[15] = v45;
  -[ICQTileView actionButtonsStack](self, "actionButtonsStack");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView separator](self, "separator");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 10.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v106[16] = v40;
  -[ICQTileView actionButtonsStack](self, "actionButtonsStack");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView trailingAnchor](self, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:constant:", v37, -14.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v106[17] = v36;
  -[ICQTileView actionButtonsStack](self, "actionButtonsStack");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView bottomAnchor](self, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -14.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v106[18] = v32;
  -[ICQTileView widthAnchor](self, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToConstant:", 400.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v106[19] = v21;
  -[ICQTileView dismissButton](self, "dismissButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView topAnchor](self, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 14.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v106[20] = v25;
  -[ICQTileView dismissButton](self, "dismissButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView trailingAnchor](self, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -14.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v106[21] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "activateConstraints:", v30);

}

- (void)createSeparator
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[ICQTileView separator](self, "separator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBDB00]);
    v6 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICQTileView addSubview:](self, "addSubview:", v6);
    -[ICQTileView setSeparator:](self, "setSeparator:", v6);

  }
}

- (void)createActionButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ICQTileView dismissButton](self, "dismissButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[ICQPremiumButton buttonWithType:link:](ICQPremiumButton, "buttonWithType:link:", 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", CFSTR("Dismiss bubble"));
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v5);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("xmark"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:forState:", v6, 0);

    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_dismissButtonTapped_, 64);
    LODWORD(v7) = 1144913920;
    objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    LODWORD(v8) = 1132593152;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v8);
    -[ICQTileView addSubview:](self, "addSubview:", v4);
    -[ICQTileView setDismissButton:](self, "setDismissButton:", v4);

  }
  -[ICQTileView primaryButton](self, "primaryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[ICQPremiumButton buttonWithType:link:](ICQPremiumButton, "buttonWithType:link:", 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_actionButtonTapped_, 64);
    -[ICQTileView setPrimaryButton:](self, "setPrimaryButton:", v10);

  }
  -[ICQTileView secondaryButton](self, "secondaryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[ICQPremiumButton buttonWithType:link:](ICQPremiumButton, "buttonWithType:link:", 1, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_actionButtonTapped_, 64);
    -[ICQTileView setSecondaryButton:](self, "setSecondaryButton:", v12);

  }
}

- (void)createActionButtonsStack
{
  void *v3;
  id v4;
  id v5;

  -[ICQTileView actionButtonsStack](self, "actionButtonsStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD978]);
    v5 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v5, "setAxis:", 0);
    objc_msgSend(v5, "setSpacing:", 15.0);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICQTileView addSubview:](self, "addSubview:", v5);
    -[ICQTileView setActionButtonsStack:](self, "setActionButtonsStack:", v5);

  }
}

- (void)updateTileViewWithOffer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "opportunityBubble");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bubbleDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView createOrUpdateTitleLabelWithTitle:](self, "createOrUpdateTitleLabelWithTitle:", v5);

  objc_msgSend(v11, "bubbleDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView createOrUpdateMessageLabelWithMessage:](self, "createOrUpdateMessageLabelWithMessage:", v7);

  objc_msgSend(v11, "bubbleDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView createOrUpdateImageViewFromImageDetails:](self, "createOrUpdateImageViewFromImageDetails:", v9);

  objc_msgSend(v11, "bubbleDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView createButtonsFromBubbleDetails:](self, "createButtonsFromBubbleDetails:", v10);

}

- (void)createOrUpdateImageViewFromImageDetails:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  ICQAsyncImageView *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BEBD8F8];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  objc_msgSend(v5, "getURLForScale:", (uint64_t)v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[ICQTileView iconImageView](self, "iconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICQTileView iconImageView](self, "iconImageView");
    v10 = (ICQAsyncImageView *)objc_claimAutoreleasedReturnValue();
    -[ICQAsyncImageView updateToImageFromURL:](v10, "updateToImageFromURL:", v11);
  }
  else
  {
    v10 = -[ICQAsyncImageView initWithURL:]([ICQAsyncImageView alloc], "initWithURL:", v11);
    -[ICQAsyncImageView setContentMode:](v10, "setContentMode:", 1);
    -[ICQAsyncImageView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICQTileView addSubview:](self, "addSubview:", v10);
    -[ICQTileView setIconImageView:](self, "setIconImageView:", v10);
  }

}

- (id)createLabelWithText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BEBD708];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v6, "setText:", v4);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v6;
}

- (void)createOrUpdateTitleLabelWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ICQTileView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICQTileView titleLabel](self, "titleLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v4);

  }
  else
  {
    -[ICQTileView createLabelWithText:](self, "createLabelWithText:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v4);

    objc_msgSend(v7, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    -[ICQTileView addSubview:](self, "addSubview:", v7);
    -[ICQTileView setTitleLabel:](self, "setTitleLabel:", v7);
  }

}

- (void)createOrUpdateMessageLabelWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ICQTileView messageLabel](self, "messageLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICQTileView messageLabel](self, "messageLabel");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v4);

  }
  else
  {
    -[ICQTileView createLabelWithText:](self, "createLabelWithText:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v4);

    objc_msgSend(v8, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[ICQTileView addSubview:](self, "addSubview:", v8);
    -[ICQTileView setMessageLabel:](self, "setMessageLabel:", v8);
  }

}

- (void)createButtonsFromBubbleDetails:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
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
  id v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  NSObject *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = a3;
  objc_msgSend(v28, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v5)
  {
    v6 = v5;
    v29 = 0;
    v30 = 0;
    v7 = *(_QWORD *)v32;
    v8 = *MEMORY[0x24BEC71D8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v10 = *(NSObject **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[NSObject parameters](v10, "parameters");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[NSObject parameters](v10, "parameters");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v8);
          v13 = objc_claimAutoreleasedReturnValue();

          if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("closeBtnId")))
          {
            -[ICQTileView updateDismissButtonWithAction:](self, "updateDismissButtonWithAction:", v10);
            v30 = 1;
          }
          else if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("bubblePrimaryBtnId")))
          {
            -[ICQTileView updatePrimaryButtonWithAction:](self, "updatePrimaryButtonWithAction:", v10);
            BYTE4(v29) = 1;
          }
          else if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("bubbleSecondaryBtnId")))
          {
            -[ICQTileView updateSecondaryButtonWithAction:](self, "updateSecondaryButtonWithAction:", v10);
            LOBYTE(v29) = 1;
          }
          else
          {
            _ICQGetLogSystem();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v13;
              _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "Invalid action id %@ for button", buf, 0xCu);
            }

          }
        }
        else
        {
          _ICQGetLogSystem();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v10;
            _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Missing parameters from action: %@", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v6);
  }
  else
  {
    v29 = 0;
    v30 = 0;
  }

  -[ICQTileView dismissButton](self, "dismissButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", (v30 & 1) == 0);

  -[ICQTileView titleLabelDismissButtonSpacingConstraint](self, "titleLabelDismissButtonSpacingConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", v30 & 1);

  -[ICQTileView primaryButton](self, "primaryButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    -[ICQTileView createButtonsFromBubbleDetails:].cold.1();

  -[ICQTileView primaryButton](self, "primaryButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v29 & 0x100000000) != 0)
  {
    objc_msgSend(v18, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[ICQTileView primaryButton](self, "primaryButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");

    }
    -[ICQTileView actionButtonsStack](self, "actionButtonsStack");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQTileView primaryButton](self, "primaryButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addArrangedSubview:", v22);

  }
  else
  {
    objc_msgSend(v18, "removeFromSuperview");
  }

  -[ICQTileView secondaryButton](self, "secondaryButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if ((v29 & 1) != 0)
  {
    objc_msgSend(v23, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[ICQTileView secondaryButton](self, "secondaryButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeFromSuperview");

    }
    -[ICQTileView actionButtonsStack](self, "actionButtonsStack");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQTileView secondaryButton](self, "secondaryButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addArrangedSubview:", v27);

  }
  else
  {
    objc_msgSend(v23, "removeFromSuperview");
  }

}

- (void)updateDismissButtonWithAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICQTileView dismissButton](self, "dismissButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICQTileView dismissButton](self, "dismissButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLink:", v7);

    -[ICQTileView dismissButton](self, "dismissButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v7 == 0);

  }
}

- (void)updatePrimaryButtonWithAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ICQTileView primaryButton](self, "primaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICQTileView primaryButton](self, "primaryButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v6, 0);

    -[ICQTileView primaryButton](self, "primaryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLink:", v8);

  }
}

- (void)updateSecondaryButtonWithAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ICQTileView secondaryButton](self, "secondaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICQTileView secondaryButton](self, "secondaryButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v6, 0);

    -[ICQTileView secondaryButton](self, "secondaryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLink:", v8);

  }
}

- (void)dismissButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _ICQOpportunityBubbleReportingSpecification *reportingDetails;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t v20[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Dismiss button was tapped", v20, 2u);
  }

  -[ICQLegacyBannerView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tileView:performAction:parameters:", self, 1, 0);

  v7 = (void *)MEMORY[0x24BEC72E0];
  objc_msgSend(v4, "link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performAction:parameters:options:", 123, v9, 0);

  reportingDetails = self->_reportingDetails;
  if (reportingDetails
    && -[_ICQOpportunityBubbleReportingSpecification dismissRuleType](reportingDetails, "dismissRuleType") == 2)
  {
    v11 = (void *)MEMORY[0x24BEC72E0];
    -[_ICQOpportunityBubbleReportingSpecification dimissServerParam](self->_reportingDetails, "dimissServerParam");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performAction:parameters:options:", 123, v12, 0);
  }
  else
  {
    v13 = (void *)MEMORY[0x24BEC72C0];
    -[ICQPremiumOffer bundleIdentifier](self->_premiumOffer, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "link");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serverUIURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEventFor:withBundleID:link:", 1, v12, v15);

  }
  -[ICQTileView premiumOffer](self, "premiumOffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDismissed:", 1);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BEC7220];
  -[ICQTileView premiumOffer](self, "premiumOffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:", v18, v19);

}

- (void)actionButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "link");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Button with label \"%@\" was tapped", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(v4, "link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQTileView handleActionFromLink:](self, "handleActionFromLink:", v8);

  v9 = (void *)MEMORY[0x24BEC72C0];
  -[ICQPremiumOffer bundleIdentifier](self->_premiumOffer, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "link");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverUIURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEventFor:withBundleID:link:", 2, v10, v12);

}

- (BOOL)handleActionFromLink:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "ICQTile: action was nil, bailing", (uint8_t *)&v14, 2u);
    }
    goto LABEL_10;
  }
  -[ICQLegacyBannerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    goto LABEL_4;
  v7 = -[ICQTileView _delegateActionForAction:](self, "_delegateActionForAction:", objc_msgSend(v4, "action"));
  -[ICQLegacyBannerView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "tileView:performAction:parameters:", self, v7, v9);

  if ((v7 & 1) == 0)
  {
LABEL_4:
    if ((-[ICQTileView _performLink:](self, "_performLink:", v4) & 1) == 0)
    {
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "action");
        _ICQStringForAction();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "ICQTile: action %{public}@ not handled by delegate nor ICQTileView", (uint8_t *)&v14, 0xCu);

      }
LABEL_10:

      v10 = 0;
      goto LABEL_11;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)attributedText
{
  return 0;
}

- (id)detailAttributedText
{
  return 0;
}

- (BOOL)_launchFlowManagerWithLink:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  ICQPremiumFlowManager *v12;
  void *v13;
  ICQPremiumFlowManager *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQLegacyBannerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    goto LABEL_10;
  }
  -[ICQLegacyBannerView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingViewControllerForTileView:", self);
  v8 = objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
LABEL_9:
      objc_msgSend(v4, "action");
      _ICQStringForAction();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "ICQ Tile: not performing action %{public}@ since ICQTileViewDelegate did not provide presentingViewController", (uint8_t *)&v20, 0xCu);

    }
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  if (v10)
  {
    objc_msgSend(v4, "action");
    _ICQStringForAction();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v11;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "ICQ Tile: perform action %{public}@", (uint8_t *)&v20, 0xCu);

  }
  v12 = [ICQPremiumFlowManager alloc];
  -[ICQTileView premiumOffer](self, "premiumOffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ICQUpgradeFlowManager initWithOffer:](v12, "initWithOffer:", v13);

  -[ICQUpgradeFlowManager setDelegate:](v14, "setDelegate:", self);
  -[ICQLegacyBannerView flowOptions](self, "flowOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager setFlowOptions:](v14, "setFlowOptions:", v15);

  objc_msgSend(v4, "serverUIURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQPremiumFlowManager beginPremiumFlowWithURL:](v14, "beginPremiumFlowWithURL:", v16);

  -[ICQTileView setLocalFlowManager:](self, "setLocalFlowManager:", v14);
  v17 = 1;
  v9 = v8;
LABEL_11:

  return v17;
}

- (ICQPremiumOffer)premiumOffer
{
  return self->_premiumOffer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (ICQAsyncImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (ICQPremiumButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (ICQPremiumButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (ICQPremiumButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButton, a3);
}

- (UIStackView)actionButtonsStack
{
  return self->_actionButtonsStack;
}

- (void)setActionButtonsStack:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonsStack, a3);
}

- (NSLayoutConstraint)titleLabelTrailingConstraint
{
  return self->_titleLabelTrailingConstraint;
}

- (void)setTitleLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, a3);
}

- (NSLayoutConstraint)titleLabelDismissButtonSpacingConstraint
{
  return self->_titleLabelDismissButtonSpacingConstraint;
}

- (void)setTitleLabelDismissButtonSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelDismissButtonSpacingConstraint, a3);
}

- (_ICQOpportunityBubbleReportingSpecification)reportingDetails
{
  return self->_reportingDetails;
}

- (void)setReportingDetails:(id)a3
{
  objc_storeStrong((id *)&self->_reportingDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingDetails, 0);
  objc_storeStrong((id *)&self->_titleLabelDismissButtonSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonsStack, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_premiumOffer, 0);
}

- (void)createButtonsFromBubbleDetails:.cold.1()
{
  __assert_rtn("-[ICQTileView createButtonsFromBubbleDetails:]", "ICQTileView.m", 295, "self.primaryButton");
}

@end
