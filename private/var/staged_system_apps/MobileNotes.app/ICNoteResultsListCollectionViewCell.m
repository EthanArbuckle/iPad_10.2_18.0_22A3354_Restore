@implementation ICNoteResultsListCollectionViewCell

- (ICNoteResultsListCollectionViewCell)initWithFrame:(CGRect)a3
{
  ICNoteResultsListCollectionViewCell *v3;
  double v4;
  ICNoteResultsListCollectionViewCell *v5;
  int *v6;
  id v7;
  double y;
  double width;
  double height;
  UIImageView *v11;
  UIImageView *statusIndicatorImageView;
  UIImageView *v13;
  UIImageView *secondaryStatusIndicatorImageView;
  uint64_t v15;
  UILabel *titleLabel;
  void *v17;
  uint64_t v18;
  UILabel *dateLabel;
  void *v20;
  uint64_t v21;
  UILabel *summaryLabel;
  void *v23;
  uint64_t v24;
  UILabel *participantsLabel;
  void *v26;
  uint64_t v27;
  UILabel *folderAndAccountLabel;
  void *v29;
  UIImageView *v30;
  UIImageView *folderLabelImageView;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  UIStackView *v39;
  UIStackView *folderStackView;
  UIImageView *v41;
  UIImageView *thumbnailImageView;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  UIStackView *v51;
  UIStackView *verticalStackView;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  NSLayoutConstraint *separatorLeadingConstraint;
  uint64_t v61;
  NSLayoutConstraint *verticalStackViewTopConstraint;
  uint64_t v63;
  NSLayoutConstraint *verticalStackViewLeadingConstraint;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSLayoutConstraint *verticalStackViewTrailingConstraint;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  uint64_t v76;
  NSLayoutConstraint *verticalStackViewBottomConstraint;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  NSLayoutConstraint *secondaryStatusIndicatorCenterYNormalConstraint;
  void *v83;
  void *v84;
  uint64_t v85;
  NSLayoutConstraint *secondaryStatusIndicatorCenterYAXConstraint;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSArray *trailingThumbnailConstraints;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  NSArray *bottomThumbnailConstraints;
  id v108;
  void *v109;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  objc_super v145;
  id v146;
  _QWORD v147[4];
  _QWORD v148[3];
  _QWORD v149[10];
  _QWORD v150[5];
  _QWORD v151[2];

  v145.receiver = self;
  v145.super_class = (Class)ICNoteResultsListCollectionViewCell;
  v3 = -[ICBaseNoteResultsCollectionViewCell initWithFrame:](&v145, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  v6 = &OBJC_IVAR___ICNoteResultsListCollectionViewCell__dateLabel;
  if (v3)
  {
    -[ICNoteResultsListCollectionViewCell setAutomaticallyUpdatesContentConfiguration:](v3, "setAutomaticallyUpdatesContentConfiguration:", 0);
    -[ICNoteResultsListCollectionViewCell setAutomaticallyUpdatesBackgroundConfiguration:](v5, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
    v7 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = (UIImageView *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    statusIndicatorImageView = v5->_statusIndicatorImageView;
    v5->_statusIndicatorImageView = v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_statusIndicatorImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    secondaryStatusIndicatorImageView = v5->_secondaryStatusIndicatorImageView;
    v5->_secondaryStatusIndicatorImageView = v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_secondaryStatusIndicatorImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICNoteResultsListCollectionViewCell resetColors](v5, "resetColors");
    v15 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell createLabel](v5, "createLabel"));
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell primaryLabelColor](v5, "primaryLabelColor"));
    -[UILabel setTextColor:](v5->_titleLabel, "setTextColor:", v17);

    v18 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell createLabel](v5, "createLabel"));
    dateLabel = v5->_dateLabel;
    v5->_dateLabel = (UILabel *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](v5, "secondaryLabelColor"));
    -[UILabel setTextColor:](v5->_dateLabel, "setTextColor:", v20);

    v21 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell createLabel](v5, "createLabel"));
    summaryLabel = v5->_summaryLabel;
    v5->_summaryLabel = (UILabel *)v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](v5, "secondaryLabelColor"));
    -[UILabel setTextColor:](v5->_summaryLabel, "setTextColor:", v23);

    v24 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell createLabel](v5, "createLabel"));
    participantsLabel = v5->_participantsLabel;
    v5->_participantsLabel = (UILabel *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](v5, "secondaryLabelColor"));
    -[UILabel setTextColor:](v5->_participantsLabel, "setTextColor:", v26);

    v27 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell createLabel](v5, "createLabel"));
    folderAndAccountLabel = v5->_folderAndAccountLabel;
    v5->_folderAndAccountLabel = (UILabel *)v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](v5, "secondaryLabelColor"));
    -[UILabel setTextColor:](v5->_folderAndAccountLabel, "setTextColor:", v29);

    v30 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    folderLabelImageView = v5->_folderLabelImageView;
    v5->_folderLabelImageView = v30;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_folderLabelImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel textColor](v5->_folderAndAccountLabel, "textColor"));
    -[UIImageView setTintColor:](v5->_folderLabelImageView, "setTintColor:", v32);

    -[UIImageView setContentMode:](v5->_folderLabelImageView, "setContentMode:", 1);
    -[UIImageView setOpaque:](v5->_folderLabelImageView, "setOpaque:", 1);
    LODWORD(v33) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_folderLabelImageView, "setContentCompressionResistancePriority:forAxis:", 1, v33);
    LODWORD(v34) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_folderLabelImageView, "setContentCompressionResistancePriority:forAxis:", 0, v34);
    LODWORD(v35) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v5->_folderLabelImageView, "setContentHuggingPriority:forAxis:", 1, v35);
    LODWORD(v36) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v5->_folderLabelImageView, "setContentHuggingPriority:forAxis:", 0, v36);
    v37 = objc_alloc((Class)UIStackView);
    v151[0] = v5->_folderLabelImageView;
    v151[1] = v5->_folderAndAccountLabel;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v151, 2));
    v39 = (UIStackView *)objc_msgSend(v37, "initWithArrangedSubviews:", v38);
    folderStackView = v5->_folderStackView;
    v5->_folderStackView = v39;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_folderStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v5->_folderStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v5->_folderStackView, "setDistribution:", 0);
    v41 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    thumbnailImageView = v5->_thumbnailImageView;
    v5->_thumbnailImageView = v41;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_thumbnailImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
    -[UIImageView setBackgroundColor:](v5->_thumbnailImageView, "setBackgroundColor:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIImageView setTintColor:](v5->_thumbnailImageView, "setTintColor:", v44);

    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor")));
    v46 = objc_msgSend(v45, "CGColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_thumbnailImageView, "layer"));
    objc_msgSend(v47, "setBorderColor:", v46);

    -[ICNoteResultsListCollectionViewCell ic_hairlineWidth](v5, "ic_hairlineWidth");
    v49 = v48;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_thumbnailImageView, "layer"));
    objc_msgSend(v50, "setBorderWidth:", v49);

    -[UIImageView ic_applyRoundedCornersWithRadius:](v5->_thumbnailImageView, "ic_applyRoundedCornersWithRadius:", 6.0);
    v150[0] = v5->_titleLabel;
    v150[1] = v5->_dateLabel;
    v150[2] = v5->_summaryLabel;
    v150[3] = v5->_participantsLabel;
    v150[4] = v5->_folderStackView;
    v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v150, 5));
    v51 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", v140);
    verticalStackView = v5->_verticalStackView;
    v5->_verticalStackView = v51;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_verticalStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v5->_verticalStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v5->_verticalStackView, "setDistribution:", 0);
    -[UIStackView setSpacing:](v5->_verticalStackView, "setSpacing:", 2.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    objc_msgSend(v53, "addSubview:", v5->_verticalStackView);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    objc_msgSend(v54, "addSubview:", v5->_statusIndicatorImageView);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    objc_msgSend(v55, "addSubview:", v5->_secondaryStatusIndicatorImageView);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    objc_msgSend(v56, "addSubview:", v5->_thumbnailImageView);

    v57 = objc_alloc_init((Class)UILayoutGuide);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    objc_msgSend(v58, "addLayoutGuide:", v57);

    v136 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell separatorLayoutGuide](v5, "separatorLayoutGuide"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "leadingAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v5->_verticalStackView, "leadingAnchor"));
    v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:", v134));
    separatorLeadingConstraint = v5->_separatorLeadingConstraint;
    v5->_separatorLeadingConstraint = (NSLayoutConstraint *)v59;

    v149[0] = v59;
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "leadingAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "leadingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v131));
    v149[1] = v130;
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v5->_verticalStackView, "leadingAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v128));
    v149[2] = v127;
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v5->_statusIndicatorImageView, "centerXAnchor"));
    v139 = v57;
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "centerXAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v125));
    v149[3] = v124;
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_statusIndicatorImageView, "centerYAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:", v122));
    v149[4] = v121;
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v5->_secondaryStatusIndicatorImageView, "centerXAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "centerXAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v119));
    v149[5] = v118;
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v5->_verticalStackView, "topAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "topAnchor"));
    -[ICNoteResultsListCollectionViewCell verticalPadding](v5, "verticalPadding");
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:constant:", v115));
    verticalStackViewTopConstraint = v5->_verticalStackViewTopConstraint;
    v5->_verticalStackViewTopConstraint = (NSLayoutConstraint *)v61;

    v149[6] = v61;
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackView](v5, "verticalStackView"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "leadingAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "leadingAnchor"));
    v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:constant:", v111, 28.0));
    verticalStackViewLeadingConstraint = v5->_verticalStackViewLeadingConstraint;
    v5->_verticalStackViewLeadingConstraint = (NSLayoutConstraint *)v63;

    v149[7] = v63;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackView](v5, "verticalStackView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
    v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68, -12.0));
    verticalStackViewTrailingConstraint = v5->_verticalStackViewTrailingConstraint;
    v5->_verticalStackViewTrailingConstraint = (NSLayoutConstraint *)v69;

    v149[8] = v69;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackView](v5, "verticalStackView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
    -[ICNoteResultsListCollectionViewCell verticalPadding](v5, "verticalPadding");
    v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, -v75));
    verticalStackViewBottomConstraint = v5->_verticalStackViewBottomConstraint;
    v5->_verticalStackViewBottomConstraint = (NSLayoutConstraint *)v76;

    v149[9] = v76;
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v149, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v78);

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_secondaryStatusIndicatorImageView, "centerYAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_summaryLabel, "centerYAnchor"));
    v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v80));
    secondaryStatusIndicatorCenterYNormalConstraint = v5->_secondaryStatusIndicatorCenterYNormalConstraint;
    v5->_secondaryStatusIndicatorCenterYNormalConstraint = (NSLayoutConstraint *)v81;

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_secondaryStatusIndicatorImageView, "centerYAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_dateLabel, "centerYAnchor"));
    v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v84));
    secondaryStatusIndicatorCenterYAXConstraint = v5->_secondaryStatusIndicatorCenterYAXConstraint;
    v5->_secondaryStatusIndicatorCenterYAXConstraint = (NSLayoutConstraint *)v85;

    v141 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v5->_thumbnailImageView, "trailingAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "trailingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:constant:", v137, -12.0));
    v148[0] = v87;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_thumbnailImageView, "centerYAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "centerYAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v90));
    v148[1] = v91;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_thumbnailImageView, "widthAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_thumbnailImageView, "heightAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v93));
    v148[2] = v94;
    v95 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v148, 3));
    trailingThumbnailConstraints = v5->_trailingThumbnailConstraints;
    v5->_trailingThumbnailConstraints = (NSArray *)v95;

    v142 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v5->_thumbnailImageView, "bottomAnchor"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell contentView](v5, "contentView"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "bottomAnchor"));
    -[ICNoteResultsListCollectionViewCell verticalPadding](v5, "verticalPadding");
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintEqualToAnchor:constant:", v138, v97 * -2.0));
    v147[0] = v98;
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v5->_thumbnailImageView, "leadingAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v100));
    v147[1] = v101;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_thumbnailImageView, "heightAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToConstant:", 68.0));
    v147[2] = v103;
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_thumbnailImageView, "widthAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToConstant:", 68.0));
    v147[3] = v105;
    v106 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v147, 4));
    bottomThumbnailConstraints = v5->_bottomThumbnailConstraints;
    v5->_bottomThumbnailConstraints = (NSArray *)v106;

    -[ICNoteResultsListCollectionViewCell enableIntrinsicSizeShortcut:](v5, "enableIntrinsicSizeShortcut:", 1);
    -[ICNoteResultsListCollectionViewCell updateViewStateProperties](v5, "updateViewStateProperties");
    v108 = objc_alloc_init((Class)UICellAccessoryMultiselect);
    objc_msgSend(v108, "setDisplayedState:", 1);
    v146 = v108;
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v146, 1));
    -[ICNoteResultsListCollectionViewCell setAccessories:](v5, "setAccessories:", v109);

    -[ICNoteResultsListCollectionViewCell addNotificationObservers](v5, "addNotificationObservers");
    -[ICNoteResultsListCollectionViewCell registerForTraitChanges](v5, "registerForTraitChanges");

    v6 = &OBJC_IVAR___ICNoteResultsListCollectionViewCell__dateLabel;
  }
  LODWORD(v4) = 1144750080;
  objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v6[12]), "setPriority:", v4);
  return v5;
}

- (void)setConfiguration:(id)a3 synchronously:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[ICNoteResultsListCollectionViewCell enableIntrinsicSizeShortcut:](self, "enableIntrinsicSizeShortcut:", 1);
  v7.receiver = self;
  v7.super_class = (Class)ICNoteResultsListCollectionViewCell;
  -[ICBaseNoteResultsCollectionViewCell setConfiguration:synchronously:](&v7, "setConfiguration:synchronously:", v6, v4);

  -[ICNoteResultsListCollectionViewCell resetColors](self, "resetColors");
}

- (void)setHidesThumbnail:(BOOL)a3
{
  self->_hidesThumbnail = a3;
  -[ICNoteResultsListCollectionViewCell updateFromConfiguration](self, "updateFromConfiguration");
}

- (void)setPinDropTarget:(BOOL)a3
{
  self->_pinDropTarget = a3;
  -[ICNoteResultsListCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)updateViewStateProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  unint64_t v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICNoteResultsListCollectionViewCell;
  -[ICBaseNoteResultsCollectionViewCell updateViewStateProperties](&v19, "updateViewStateProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredSingleLineAFontForTextStyle:](UIFont, "ic_preferredSingleLineAFontForTextStyle:", UIFontTextStyleSubheadline));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredSingleLineAFontForTextStyle:](UIFont, "ic_preferredSingleLineAFontForTextStyle:", UIFontTextStyleSubheadline));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell participantsLabel](self, "participantsLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell traitCollection](self, "traitCollection"));
  -[ICNoteResultsListCollectionViewCell setIsInSplitView:](self, "setIsInSplitView:", objc_msgSend(v7, "_splitViewControllerContext") == (id)3);

  -[ICNoteResultsListCollectionViewCell setIsAXSize:](self, "setIsAXSize:", ICAccessibilityAccessibilityLargerTextSizesEnabled(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell traitCollection](self, "traitCollection"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredContentSizeCategory"));
  -[ICNoteResultsListCollectionViewCell setIsLargerThanAXLarge:](self, "setIsLargerThanAXLarge:", UIContentSizeCategoryCompareToCategory(v10, UIContentSizeCategoryAccessibilityLarge) > NSOrderedSame);

  if (-[ICNoteResultsListCollectionViewCell isAXSize](self, "isAXSize"))
    v11 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryStatusIndicatorCenterYAXConstraint](self, "secondaryStatusIndicatorCenterYAXConstraint"));
  else
    v11 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryStatusIndicatorCenterYNormalConstraint](self, "secondaryStatusIndicatorCenterYNormalConstraint"));
  v12 = (void *)v11;
  if (-[ICNoteResultsListCollectionViewCell isAXSize](self, "isAXSize"))
    v13 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryStatusIndicatorCenterYNormalConstraint](self, "secondaryStatusIndicatorCenterYNormalConstraint"));
  else
    v13 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryStatusIndicatorCenterYAXConstraint](self, "secondaryStatusIndicatorCenterYAXConstraint"));
  v14 = (void *)v13;
  if ((objc_msgSend(v12, "isActive") & 1) == 0)
  {
    objc_msgSend(v12, "setActive:", 1);
    objc_msgSend(v14, "setActive:", 0);
  }
  if (-[ICNoteResultsListCollectionViewCell isAXSize](self, "isAXSize"))
    v15 = 37.0;
  else
    v15 = 28.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewLeadingConstraint](self, "verticalStackViewLeadingConstraint"));
  objc_msgSend(v16, "setConstant:", v15);

  v17 = -[ICNoteResultsListCollectionViewCell numberOfLines](self, "numberOfLines");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  objc_msgSend(v18, "setMaxNumberOfLabelLines:", v17);

}

- (CGRect)estimatedBoundsForLabel:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  v5 = 0.0;
  if ((objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
    objc_msgSend(v6, "lineHeight");
    v5 = v7;

  }
  -[ICNoteResultsListCollectionViewCell frame](self, "frame");
  v9 = v8 + -24.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewLeadingConstraint](self, "verticalStackViewLeadingConstraint"));
  objc_msgSend(v10, "constant");
  v12 = v9 - v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewTrailingConstraint](self, "verticalStackViewTrailingConstraint"));
  objc_msgSend(v13, "constant");
  v15 = v12 - v14;

  v16 = 0.0;
  v17 = 0.0;
  v18 = v15;
  v19 = v5;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;

  v4 = a3;
  -[ICNoteResultsListCollectionViewCell updateColorsUsingState:](self, "updateColorsUsingState:", v4);
  -[ICNoteResultsListCollectionViewCell updateStatusIndicatorsUsingState:](self, "updateStatusIndicatorsUsingState:", v4);
  -[ICNoteResultsListCollectionViewCell updateBackgroundConfigurationUsingState:](self, "updateBackgroundConfigurationUsingState:", v4);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[ICNoteResultsListCollectionViewCell enableIntrinsicSizeShortcut:](self, "enableIntrinsicSizeShortcut:", 0);
  -[ICNoteResultsListCollectionViewCell updateViewStateProperties](self, "updateViewStateProperties");
  -[ICNoteResultsListCollectionViewCell updateFromConfiguration](self, "updateFromConfiguration");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unsigned int v2;
  unint64_t *v3;

  v2 = -[ICNoteResultsListCollectionViewCell isSelected](self, "isSelected");
  v3 = &UIAccessibilityTraitSelected;
  if (!v2)
    v3 = &UIAccessibilityTraitNone;
  return *v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell accessibilityCustomActionsDelegate](self, "accessibilityCustomActionsDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "customAccessibilityActionsForObjectID:galleryView:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell accessibilityCustomActionsDelegate](self, "accessibilityCustomActionsDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "note"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customAccessibilityActionsForObjectID:galleryView:", v8, 0));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unint64_t)numberOfLines
{
  if (!-[ICNoteResultsListCollectionViewCell isAXSize](self, "isAXSize"))
    return 1;
  if (-[ICNoteResultsListCollectionViewCell isLargerThanAXLarge](self, "isLargerThanAXLarge"))
    return 3;
  return 2;
}

- (void)updateBackgroundConfigurationUsingState:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
    v4 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listPlainCellConfiguration](UIBackgroundConfiguration, "listPlainCellConfiguration"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
  v5 = (void *)v4;
  if (objc_msgSend(v9, "cellDropState") == (id)2)
  {
    objc_msgSend(v9, "setCellDropState:", 1);
    objc_msgSend(v9, "setFocused:", 0);
  }
  if (-[ICNoteResultsListCollectionViewCell isPinDropTarget](self, "isPinDropTarget"))
  {
    if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemFillColor](UIColor, "systemFillColor"));
    v7 = (void *)v6;
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedConfigurationForState:", v9));
  -[ICNoteResultsListCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v8);

}

- (void)updateColorsUsingState:(id)a3
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
  unsigned int v13;
  char v14;
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
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration valueCellConfiguration](UIListContentConfiguration, "valueCellConfiguration"));
  if (objc_msgSend(v4, "cellDropState") == (id)2 || objc_msgSend(v4, "cellDropState") == (id)1)
  {
    objc_msgSend(v4, "setCellDropState:", 1);
    objc_msgSend(v4, "setFocused:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedConfigurationForState:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "color"));
  -[ICNoteResultsListCollectionViewCell setPrimaryLabelColor:](self, "setPrimaryLabelColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondaryTextProperties"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "color"));
  -[ICNoteResultsListCollectionViewCell setSecondaryLabelColor:](self, "setSecondaryLabelColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchResult"));

  if (v12)
  {
    v44 = v4;
    v13 = objc_msgSend(v4, "isSelected");
    v14 = v13;
    v43 = v6;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("selected_search_highlight")));
    }
    else
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell window](self, "window"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintColor"));
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    objc_msgSend(v16, "setHighlightColor:", v15);

    if ((v14 & 1) == 0)
    {

      v15 = v4;
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v47[0] = NSFontAttributeName;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "font"));
    v48[0] = v18;
    v47[1] = NSForegroundColorAttributeName;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell primaryLabelColor](self, "primaryLabelColor"));
    v48[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
    v45[0] = NSFontAttributeName;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell summaryLabel](self, "summaryLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "font"));
    v45[1] = NSForegroundColorAttributeName;
    v46[0] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](self, "secondaryLabelColor"));
    v46[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
    objc_msgSend(v42, "updateTitleLabelAttributes:summaryLabelAttributes:", v20, v24);

    v6 = v43;
    v4 = v44;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "searchResult"));

  if (v26)
  {
    -[ICBaseNoteResultsCollectionViewCell synchronouslyLoadConfigurationDataAndUpdate](self, "synchronouslyLoadConfigurationDataAndUpdate");
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell primaryLabelColor](self, "primaryLabelColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v28, "setTextColor:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](self, "secondaryLabelColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell summaryLabel](self, "summaryLabel"));
    objc_msgSend(v30, "setTextColor:", v29);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](self, "secondaryLabelColor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel"));
  objc_msgSend(v32, "setTextColor:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](self, "secondaryLabelColor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell participantsLabel](self, "participantsLabel"));
  objc_msgSend(v34, "setTextColor:", v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](self, "secondaryLabelColor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
  objc_msgSend(v36, "setTextColor:", v35);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryLabelColor](self, "secondaryLabelColor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderLabelImageView](self, "folderLabelImageView"));
  objc_msgSend(v38, "setTintColor:", v37);

  if (objc_msgSend(v4, "isSelected"))
    v39 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v39 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v40 = (void *)v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v41, "setTintColor:", v40);

}

- (void)resetColors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[ICNoteResultsListCollectionViewCell setPrimaryLabelColor:](self, "setPrimaryLabelColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[ICNoteResultsListCollectionViewCell setSecondaryLabelColor:](self, "setSecondaryLabelColor:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  objc_msgSend(v5, "setHighlightColor:", v6);

}

- (id)createLabel
{
  id v2;
  double v3;

  v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v3) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 1, v3);
  return v2;
}

- (void)enableIntrinsicSizeShortcut:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "_setUseShortcutIntrinsicContentSize:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v6, "_setUseShortcutIntrinsicContentSize:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel"));
  objc_msgSend(v7, "_setUseShortcutIntrinsicContentSize:", v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell participantsLabel](self, "participantsLabel"));
  objc_msgSend(v8, "_setUseShortcutIntrinsicContentSize:", v3);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
  objc_msgSend(v9, "_setUseShortcutIntrinsicContentSize:", v3);

}

- (void)setCurrentThumbnailLocation:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;

  switch(a3)
  {
    case 2:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell trailingThumbnailConstraints](self, "trailingThumbnailConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v9);

      -[ICNoteResultsListCollectionViewCell currentThumbnailSize](self, "currentThumbnailSize");
      v11 = v10;
      -[ICNoteResultsListCollectionViewCell verticalPadding](self, "verticalPadding");
      v13 = -(v11 + v12 * 3.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewBottomConstraint](self, "verticalStackViewBottomConstraint"));
      objc_msgSend(v14, "setConstant:", v13);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewTrailingConstraint](self, "verticalStackViewTrailingConstraint"));
      objc_msgSend(v15, "setConstant:", -12.0);

      v16 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell bottomThumbnailConstraints](self, "bottomThumbnailConstraints"));
LABEL_7:
      v8 = (void *)v16;
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);
      goto LABEL_8;
    case 1:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell bottomThumbnailConstraints](self, "bottomThumbnailConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v17);

      -[ICNoteResultsListCollectionViewCell currentThumbnailSize](self, "currentThumbnailSize");
      v19 = -(v18 + 24.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewTrailingConstraint](self, "verticalStackViewTrailingConstraint"));
      objc_msgSend(v20, "setConstant:", v19);

      -[ICNoteResultsListCollectionViewCell verticalPadding](self, "verticalPadding");
      v22 = -v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewBottomConstraint](self, "verticalStackViewBottomConstraint"));
      objc_msgSend(v23, "setConstant:", v22);

      v16 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell trailingThumbnailConstraints](self, "trailingThumbnailConstraints"));
      goto LABEL_7;
    case 0:
      -[ICNoteResultsListCollectionViewCell verticalPadding](self, "verticalPadding");
      v6 = -v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewBottomConstraint](self, "verticalStackViewBottomConstraint"));
      objc_msgSend(v7, "setConstant:", v6);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewTrailingConstraint](self, "verticalStackViewTrailingConstraint"));
      objc_msgSend(v8, "setConstant:", -12.0);
LABEL_8:

      break;
  }
  self->_currentThumbnailLocation = a3;
}

- (void)updateFromConfiguration
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v3 = -[ICNoteResultsListCollectionViewCell numberOfLines](self, "numberOfLines");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setNumberOfLines:", v3);

  v5 = -[ICNoteResultsListCollectionViewCell numberOfLines](self, "numberOfLines");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v6, "setNumberOfLines:", v5);

  v7 = -[ICNoteResultsListCollectionViewCell numberOfLines](self, "numberOfLines");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
  objc_msgSend(v8, "setNumberOfLines:", v7);

  v9 = -[ICNoteResultsListCollectionViewCell numberOfLines](self, "numberOfLines");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell participantsLabel](self, "participantsLabel"));
  objc_msgSend(v10, "setNumberOfLines:", v9);

  v11 = -[ICNoteResultsListCollectionViewCell isLargerThanAXLarge](self, "isLargerThanAXLarge");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v13 = objc_msgSend(v12, "showParticipantsInfo");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  if ((objc_msgSend(v14, "showFolderName") & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v15 = objc_msgSend(v16, "showAccountName");

  }
  if (-[ICNoteResultsListCollectionViewCell hidesThumbnail](self, "hidesThumbnail"))
  {
    -[ICNoteResultsListCollectionViewCell setIsThumbnailPresent:](self, "setIsThumbnailPresent:", 0);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    -[ICNoteResultsListCollectionViewCell setIsThumbnailPresent:](self, "setIsThumbnailPresent:", objc_msgSend(v17, "hasThumbnailImage"));

  }
  if (-[ICNoteResultsListCollectionViewCell isThumbnailPresent](self, "isThumbnailPresent"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "font"));
    objc_msgSend(v19, "lineHeight");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell summaryLabel](self, "summaryLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "font"));
    objc_msgSend(v23, "lineHeight");
    v25 = v21 + v24;
    v26 = 0.0;
    v27 = 0.0;
    if (v11)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel", 0.0));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "font"));
      objc_msgSend(v58, "lineHeight");
    }
    v28 = v25 + v27;
    if (v13)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell participantsLabel](self, "participantsLabel"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "font"));
      objc_msgSend(v60, "lineHeight");
      v26 = v29;
    }
    v30 = v28 + v26;
    if ((v15 & 1) != 0)
    {
      v31 = v11;
      v32 = v13;
      v33 = v23;
      v34 = v22;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
      v36 = v19;
      v37 = v18;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "font"));
      objc_msgSend(v38, "lineHeight");
      v40 = v30 + v39;

      v18 = v37;
      v19 = v36;

      v22 = v34;
      v23 = v33;
      v13 = v32;
      v11 = v31;
    }
    else
    {
      v40 = v30 + 0.0;
    }
    if (v13)
    {

    }
    if (v11)
    {

    }
    v41 = fmin(ceil(v40), 68.0);
    -[ICNoteResultsListCollectionViewCell setCurrentThumbnailSize:](self, "setCurrentThumbnailSize:", v41, v41);
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel"));
  objc_msgSend(v42, "setHidden:", v11 ^ 1);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell participantsLabel](self, "participantsLabel"));
  objc_msgSend(v43, "setHidden:", v13 ^ 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderStackView](self, "folderStackView"));
  objc_msgSend(v44, "setHidden:", v15 ^ 1);

  v45 = -[ICNoteResultsListCollectionViewCell isThumbnailPresent](self, "isThumbnailPresent") ^ 1;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v46, "setHidden:", v45);

  if (-[ICNoteResultsListCollectionViewCell isThumbnailPresent](self, "isThumbnailPresent")
    && !-[ICNoteResultsListCollectionViewCell currentThumbnailLocation](self, "currentThumbnailLocation")
    || !-[ICNoteResultsListCollectionViewCell isThumbnailPresent](self, "isThumbnailPresent")
    && -[ICNoteResultsListCollectionViewCell currentThumbnailLocation](self, "currentThumbnailLocation")
    || -[ICNoteResultsListCollectionViewCell isAXSize](self, "isAXSize")
    && (id)-[ICNoteResultsListCollectionViewCell currentThumbnailLocation](self, "currentThumbnailLocation") != (id)2
    || !-[ICNoteResultsListCollectionViewCell isAXSize](self, "isAXSize")
    && (id)-[ICNoteResultsListCollectionViewCell currentThumbnailLocation](self, "currentThumbnailLocation") != (id)1)
  {
    if (-[ICNoteResultsListCollectionViewCell isAXSize](self, "isAXSize")
      && -[ICNoteResultsListCollectionViewCell isThumbnailPresent](self, "isThumbnailPresent"))
    {
      v47 = 2;
    }
    else
    {
      v47 = -[ICNoteResultsListCollectionViewCell isThumbnailPresent](self, "isThumbnailPresent");
    }
    -[ICNoteResultsListCollectionViewCell setCurrentThumbnailLocation:](self, "setCurrentThumbnailLocation:", v47);
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell configurationState](self, "configurationState"));
  -[ICNoteResultsListCollectionViewCell updateStatusIndicatorsUsingState:](self, "updateStatusIndicatorsUsingState:", v48);

  -[ICNoteResultsListCollectionViewCell updateLabelsFromConfiguration](self, "updateLabelsFromConfiguration");
  -[ICNoteResultsListCollectionViewCell updateThumbnailFromConfiguration](self, "updateThumbnailFromConfiguration");
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v50 = objc_msgSend(v49, "styleForCalculator");

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell separatorLeadingConstraint](self, "separatorLeadingConstraint"));
  objc_msgSend(v51, "setActive:", v50 ^ 1);

  -[ICNoteResultsListCollectionViewCell verticalPadding](self, "verticalPadding");
  v53 = v52;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackViewTopConstraint](self, "verticalStackViewTopConstraint"));
  objc_msgSend(v54, "setConstant:", v53);

  if (v50)
    v55 = 4.0;
  else
    v55 = 2.0;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell verticalStackView](self, "verticalStackView"));
  objc_msgSend(v56, "setSpacing:", v55);

  -[ICNoteResultsListCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (double)verticalPadding
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  if (objc_msgSend(v2, "styleForCalculator"))
    v3 = 18.0;
  else
    v3 = 10.0;

  return v3;
}

- (void)updateStatusIndicatorsUsingState:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryStatusIndicatorImageView](self, "secondaryStatusIndicatorImageView"));
  objc_msgSend(v5, "setHidden:", 1);

  if ((objc_msgSend(v27, "isSelected") & 1) != 0 || objc_msgSend(v27, "isFocused"))
    v6 = -[ICNoteResultsListCollectionViewCell isInSplitView](self, "isInSplitView");
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryStatusImage"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryStatusImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
    objc_msgSend(v11, "setImage:", v10);

    if (v6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textColor"));
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryStatusImageTintColor"));
    }
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
    objc_msgSend(v15, "setTintColor:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
    objc_msgSend(v16, "setHidden:", 0);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "secondaryStatusImage"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "secondaryStatusImage"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryStatusIndicatorImageView](self, "secondaryStatusIndicatorImageView"));
    objc_msgSend(v21, "setImage:", v20);

    if (v6)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "textColor"));
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "secondaryStatusImageTintColor"));
    }
    v24 = (void *)v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryStatusIndicatorImageView](self, "secondaryStatusIndicatorImageView"));
    objc_msgSend(v25, "setTintColor:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell secondaryStatusIndicatorImageView](self, "secondaryStatusIndicatorImageView"));
    objc_msgSend(v26, "setHidden:", 0);

  }
}

- (void)updateLabelsFromConfiguration
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
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
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
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
  uint64_t v51;
  void *v52;
  void *v53;
  unsigned int v54;
  id v55;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "isDataLoaded");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleAttributedString"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v8 = v7;
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleAttributedString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
      objc_msgSend(v10, "setAttributedText:", v9);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
      objc_msgSend(v10, "setText:", v9);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel"));
    v23 = objc_msgSend(v22, "isHidden");

    if ((v23 & 1) == 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dateString"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel"));
      objc_msgSend(v26, "setText:", v25);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "summaryAttributedString"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v30 = v29;
    if (v28)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "summaryAttributedString"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell summaryLabel](self, "summaryLabel"));
      objc_msgSend(v32, "setAttributedText:", v31);
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "summaryString"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell summaryLabel](self, "summaryLabel"));
      objc_msgSend(v32, "setText:", v31);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v34 = objc_msgSend(v33, "showParticipantsInfo");

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "participantsInfoString"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell participantsLabel](self, "participantsLabel"));
      objc_msgSend(v37, "setText:", v36);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v39 = objc_msgSend(v38, "showsNoteContainer");

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "folderAndAccountInfoString"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
      objc_msgSend(v42, "setText:", v41);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "folderImage"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderLabelImageView](self, "folderLabelImageView"));
      objc_msgSend(v45, "setImage:", v44);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "folderImage"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderLabelImageView](self, "folderLabelImageView"));
      objc_msgSend(v48, "setHidden:", v47 == 0);

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "searchResult"));

    if (v50)
    {
      v51 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell superview](self, "superview"));
      if (v51)
      {
        v52 = (void *)v51;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v54 = objc_msgSend(v53, "isRunningTest");

        if (v54)
        {
          v55 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
          objc_msgSend(v55, "searchResultBecameVisible");
          goto LABEL_24;
        }
      }
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v11, "setText:", CFSTR(" "));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell summaryLabel](self, "summaryLabel"));
    objc_msgSend(v12, "setText:", CFSTR(" "));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel"));
    v14 = objc_msgSend(v13, "isHidden");

    if ((v14 & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell dateLabel](self, "dateLabel"));
      objc_msgSend(v15, "setText:", CFSTR(" "));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v17 = objc_msgSend(v16, "showParticipantsInfo");

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell participantsLabel](self, "participantsLabel"));
      objc_msgSend(v18, "setText:", CFSTR(" "));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v20 = objc_msgSend(v19, "showsNoteContainer");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
      objc_msgSend(v21, "setText:", CFSTR(" "));

      v55 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell folderLabelImageView](self, "folderLabelImageView"));
      objc_msgSend(v55, "setHidden:", 1);
LABEL_24:

    }
  }
}

- (void)updateThumbnailFromConfiguration
{
  void *v3;
  void *v4;
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
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
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
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[5];

  if (-[ICNoteResultsListCollectionViewCell isThumbnailPresent](self, "isThumbnailPresent"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "note"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v6 = v5;
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchResult"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "foundAttachmentObjectID"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchResult"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectWithID:", v9));

        v15 = objc_alloc((Class)ICThumbnailConfiguration);
        -[ICNoteResultsListCollectionViewCell currentThumbnailSize](self, "currentThumbnailSize");
        v17 = v16;
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v20, "scale");
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell ic_appearanceInfo](self, "ic_appearanceInfo"));
        v24 = objc_msgSend(v15, "initForNoteListWithFoundAttachment:preferredSize:scale:appearanceInfo:", v14, v23, v17, v19, v22);
      }
      else
      {
        if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
          v46 = objc_claimAutoreleasedReturnValue(+[ICAppearanceInfo appearanceInfoWithType:](ICAppearanceInfo, "appearanceInfoWithType:", 0));
        else
          v46 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell ic_appearanceInfo](self, "ic_appearanceInfo"));
        v14 = (void *)v46;
        v58 = objc_alloc((Class)ICThumbnailConfiguration);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "note"));
        -[ICNoteResultsListCollectionViewCell currentThumbnailSize](self, "currentThumbnailSize");
        v60 = v59;
        v62 = v61;
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v63, "scale");
        v24 = objc_msgSend(v58, "initForNoteListWithNote:preferredSize:scale:appearanceInfo:", v23, v14, v60, v62, v64);

      }
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[ICThumbnailService sharedThumbnailService](ICThumbnailService, "sharedThumbnailService"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueKey"));
      -[ICNoteResultsListCollectionViewCell setCurrentThumbnailConfigurationUniqueKey:](self, "setCurrentThumbnailConfigurationUniqueKey:", v66);

      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_1000D2E08;
      v68[3] = &unk_100554378;
      v68[4] = self;
      objc_msgSend(v65, "thumbnailWithConfiguration:completion:", v24, v68);

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invitation"));

      if (!v25)
        return;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "invitation"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rootObjectType"));
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.notes.note"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "invitation"));
      v32 = v31;
      if (v29)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell traitCollection](self, "traitCollection"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ic_appearanceInfo"));
        -[ICNoteResultsListCollectionViewCell currentThumbnailSize](self, "currentThumbnailSize");
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "thumbnailImageForAppearance:size:", v34));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        objc_msgSend(v36, "setImage:", v35);

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        objc_msgSend(v37, "setContentMode:", 2);

        v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        objc_msgSend(v39, "setBackgroundColor:", v38);

        -[ICNoteResultsListCollectionViewCell ic_hairlineWidth](self, "ic_hairlineWidth");
        v41 = v40;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layer"));
        objc_msgSend(v43, "setBorderWidth:", v41);

        v67 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "image"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        objc_msgSend(v45, "setHidden:", v44 == 0);

      }
      else
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "rootObjectType"));
        v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.notes.folder"));

        if (!v48)
          return;
        v67 = (id)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 26.0));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("folder.badge.person.crop"), v67));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        objc_msgSend(v50, "setImage:", v49);

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        objc_msgSend(v51, "setContentMode:", 1);

        v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        objc_msgSend(v53, "setBackgroundColor:", v52);

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "layer"));
        objc_msgSend(v55, "setBorderWidth:", 0.0);

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "image"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsListCollectionViewCell thumbnailImageView](self, "thumbnailImageView"));
        objc_msgSend(v57, "setHidden:", v56 == 0);

      }
    }
  }
}

- (void)addNotificationObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)removeNotificationObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;

  v6 = objc_opt_class(UITraitUserInterfaceStyle);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D3274;
  v5[3] = &unk_1005543A0;
  v5[4] = self;
  v4 = -[ICNoteResultsListCollectionViewCell registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

- (BOOL)hidesThumbnail
{
  return self->_hidesThumbnail;
}

- (BOOL)isPinDropTarget
{
  return self->_pinDropTarget;
}

- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate
{
  return (ICAccessibilityCustomActionsDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityCustomActionsDelegate);
}

- (void)setAccessibilityCustomActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityCustomActionsDelegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabel, a3);
}

- (UILabel)participantsLabel
{
  return self->_participantsLabel;
}

- (void)setParticipantsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_participantsLabel, a3);
}

- (UILabel)folderAndAccountLabel
{
  return self->_folderAndAccountLabel;
}

- (void)setFolderAndAccountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_folderAndAccountLabel, a3);
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorImageView, a3);
}

- (UIImageView)secondaryStatusIndicatorImageView
{
  return self->_secondaryStatusIndicatorImageView;
}

- (void)setSecondaryStatusIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorImageView, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (void)setThumbnailImageView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageView, a3);
}

- (UIStackView)folderStackView
{
  return self->_folderStackView;
}

- (void)setFolderStackView:(id)a3
{
  objc_storeStrong((id *)&self->_folderStackView, a3);
}

- (UIImageView)folderLabelImageView
{
  return self->_folderLabelImageView;
}

- (void)setFolderLabelImageView:(id)a3
{
  objc_storeStrong((id *)&self->_folderLabelImageView, a3);
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackView, a3);
}

- (NSLayoutConstraint)verticalStackViewLeadingConstraint
{
  return self->_verticalStackViewLeadingConstraint;
}

- (void)setVerticalStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)verticalStackViewTrailingConstraint
{
  return self->_verticalStackViewTrailingConstraint;
}

- (void)setVerticalStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)verticalStackViewTopConstraint
{
  return self->_verticalStackViewTopConstraint;
}

- (void)setVerticalStackViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackViewTopConstraint, a3);
}

- (NSLayoutConstraint)verticalStackViewBottomConstraint
{
  return self->_verticalStackViewBottomConstraint;
}

- (void)setVerticalStackViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackViewBottomConstraint, a3);
}

- (NSLayoutConstraint)separatorLeadingConstraint
{
  return self->_separatorLeadingConstraint;
}

- (void)setSeparatorLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLeadingConstraint, a3);
}

- (NSArray)bottomThumbnailConstraints
{
  return self->_bottomThumbnailConstraints;
}

- (void)setBottomThumbnailConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_bottomThumbnailConstraints, a3);
}

- (NSArray)trailingThumbnailConstraints
{
  return self->_trailingThumbnailConstraints;
}

- (void)setTrailingThumbnailConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_trailingThumbnailConstraints, a3);
}

- (NSLayoutConstraint)secondaryStatusIndicatorCenterYAXConstraint
{
  return self->_secondaryStatusIndicatorCenterYAXConstraint;
}

- (void)setSecondaryStatusIndicatorCenterYAXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorCenterYAXConstraint, a3);
}

- (NSLayoutConstraint)secondaryStatusIndicatorCenterYNormalConstraint
{
  return self->_secondaryStatusIndicatorCenterYNormalConstraint;
}

- (void)setSecondaryStatusIndicatorCenterYNormalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorCenterYNormalConstraint, a3);
}

- (ICThumbnailKey)currentThumbnailConfigurationUniqueKey
{
  return self->_currentThumbnailConfigurationUniqueKey;
}

- (void)setCurrentThumbnailConfigurationUniqueKey:(id)a3
{
  objc_storeStrong((id *)&self->_currentThumbnailConfigurationUniqueKey, a3);
}

- (CGSize)currentThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentThumbnailSize.width;
  height = self->_currentThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentThumbnailSize:(CGSize)a3
{
  self->_currentThumbnailSize = a3;
}

- (BOOL)isAXSize
{
  return self->_isAXSize;
}

- (void)setIsAXSize:(BOOL)a3
{
  self->_isAXSize = a3;
}

- (BOOL)isLargerThanAXLarge
{
  return self->_isLargerThanAXLarge;
}

- (void)setIsLargerThanAXLarge:(BOOL)a3
{
  self->_isLargerThanAXLarge = a3;
}

- (BOOL)isInSplitView
{
  return self->_isInSplitView;
}

- (void)setIsInSplitView:(BOOL)a3
{
  self->_isInSplitView = a3;
}

- (BOOL)isThumbnailPresent
{
  return self->_isThumbnailPresent;
}

- (void)setIsThumbnailPresent:(BOOL)a3
{
  self->_isThumbnailPresent = a3;
}

- (int64_t)currentThumbnailLocation
{
  return self->_currentThumbnailLocation;
}

- (UIColor)primaryLabelColor
{
  return self->_primaryLabelColor;
}

- (void)setPrimaryLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabelColor, a3);
}

- (UIColor)secondaryLabelColor
{
  return self->_secondaryLabelColor;
}

- (void)setSecondaryLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabelColor, 0);
  objc_storeStrong((id *)&self->_primaryLabelColor, 0);
  objc_storeStrong((id *)&self->_currentThumbnailConfigurationUniqueKey, 0);
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorCenterYNormalConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorCenterYAXConstraint, 0);
  objc_storeStrong((id *)&self->_trailingThumbnailConstraints, 0);
  objc_storeStrong((id *)&self->_bottomThumbnailConstraints, 0);
  objc_storeStrong((id *)&self->_separatorLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_folderLabelImageView, 0);
  objc_storeStrong((id *)&self->_folderStackView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_folderAndAccountLabel, 0);
  objc_storeStrong((id *)&self->_participantsLabel, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_accessibilityCustomActionsDelegate);
}

@end
