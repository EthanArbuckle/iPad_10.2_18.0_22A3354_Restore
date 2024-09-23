@implementation TransitDirectionsInstructionsStepView

- (void)prepareForReuse
{
  NSMutableDictionary *layoutItemsByType;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsIconStepView prepareForReuse](&v4, "prepareForReuse");
  layoutItemsByType = self->_layoutItemsByType;
  self->_layoutItemsByType = 0;

}

- (void)_createSubviews
{
  id v3;
  double y;
  double width;
  double height;
  _MKUILabel *v7;
  _MKUILabel *primaryLabel;
  uint64_t v9;
  void *v10;
  TransitDirectionsInstructionsStepView *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  MKMultiPartLabel *v18;
  MKMultiPartLabel *secondaryLabel;
  TransitDirectionsInstructionsStepView *v20;
  unsigned int v21;
  id *v22;
  uint64_t v23;
  double v24;
  double v25;
  double x;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double left;
  double bottom;
  double right;
  double v34;
  double v35;
  id v36;
  id v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  TransitArtworkListView *v46;
  id v47;
  double v48;
  double v49;
  id v50;
  id v51;
  id *v52;
  void *v53;
  id v54;
  UIFontTextStyle v55;
  NSString *v56;
  void *v57;
  void *v58;
  TransitDirectionsInstructionsStepView *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  id v65;
  id v66;
  id *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  PassThroughStackView *v78;
  id v79;
  double v80;
  double v81;
  double v82;
  double v83;
  id v84;
  id v85;
  uint64_t v86;
  id v87;
  float v88;
  double v89;
  float v90;
  double v91;
  uint64_t v92;
  id v93;
  void *v94;
  double v95;
  void *v96;
  id v97;
  id *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  double v104;
  objc_super v105;

  v105.receiver = self;
  v105.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsIconStepView _createSubviews](&v105, "_createSubviews");
  self->_cellStyle = -[TransitDirectionsInstructionsStepView _bestCellStyleForCurrentState](self, "_bestCellStyleForCurrentState");
  v3 = objc_alloc((Class)_MKUILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (_MKUILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v7;

  -[_MKUILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (sub_1002A8AA0(self) == 5)
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  else
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v10 = (void *)v9;
  -[_MKUILabel setHighlightedTextColor:](self->_primaryLabel, "setHighlightedTextColor:", v9);

  -[_MKUILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  -[_MKUILabel setUserInteractionEnabled:](self->_primaryLabel, "setUserInteractionEnabled:", 0);
  v11 = self;
  if (-[TransitDirectionsStepView useNavigationMetrics](v11, "useNavigationMetrics"))
  {
    v12 = -[TransitDirectionsStepView navigationState](v11, "navigationState");
    v13 = sub_1002A8AA0(v11);
    if (v12 == (id)4)
    {
      if (v13 != 5)
      {
        v14 = objc_claimAutoreleasedReturnValue(+[UIFont system22Bold](UIFont, "system22Bold"));
        goto LABEL_14;
      }
    }
    else if (v13 != 5)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[UIFont system22Semibold](UIFont, "system22Semibold"));
      goto LABEL_14;
    }
    v14 = objc_claimAutoreleasedReturnValue(+[UIFont system22](UIFont, "system22"));
    goto LABEL_14;
  }
  if (sub_1002A8AA0(v11) == 5)
    v14 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v14 = objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
LABEL_14:
  v15 = (void *)v14;

  -[_MKUILabel setFont:](self->_primaryLabel, "setFont:", v15);
  LODWORD(v16) = 1148846080;
  -[_MKUILabel _mapkit_setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v16);
  LODWORD(v17) = 1148846080;
  -[_MKUILabel _mapkit_setContentHuggingPriority:forAxis:](self->_primaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v17);
  v18 = (MKMultiPartLabel *)objc_msgSend(objc_alloc((Class)MKMultiPartLabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  secondaryLabel = v11->_secondaryLabel;
  v11->_secondaryLabel = v18;

  -[MKMultiPartLabel setAccessibilityIdentifier:](v11->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[MKMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = v11;
  v21 = -[TransitDirectionsStepView useNavigationMetrics](v20, "useNavigationMetrics");
  v22 = v20;
  v23 = sub_1002A8AA0(v22);
  v104 = height;
  if (v21 || v23 == 5)
  {
    v24 = width;
    v25 = y;
    x = CGRectZero.origin.x;
    v27 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  }
  else
  {
    v24 = width;
    v25 = y;
    x = CGRectZero.origin.x;
    v27 = objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  }
  v28 = (void *)v27;

  -[MKMultiPartLabel setFont:](v11->_secondaryLabel, "setFont:", v28);
  -[MKMultiPartLabel setNumberOfLines:](v11->_secondaryLabel, "setNumberOfLines:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MKMultiPartLabel setTextColor:](v11->_secondaryLabel, "setTextColor:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel highlightedTextColor](self->_primaryLabel, "highlightedTextColor"));
  -[MKMultiPartLabel setHighlightedTextColor:](v11->_secondaryLabel, "setHighlightedTextColor:", v30);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  -[MKMultiPartLabel setTextInset:](v11->_secondaryLabel, "setTextInset:", UIEdgeInsetsZero.top, left, bottom, right);
  -[MKMultiPartLabel setUserInteractionEnabled:](v11->_secondaryLabel, "setUserInteractionEnabled:", 0);
  LODWORD(v34) = 1148846080;
  -[MKMultiPartLabel _mapkit_setContentCompressionResistancePriority:forAxis:](v11->_secondaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v34);
  LODWORD(v35) = 1148846080;
  -[MKMultiPartLabel _mapkit_setContentHuggingPriority:forAxis:](v11->_secondaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v35);
  v36 = objc_msgSend(objc_alloc((Class)MKMultiPartLabel), "initWithFrame:", x, v25, v24, v104);
  v37 = v22[44];
  v22[44] = v36;

  objc_msgSend(v22[44], "setAccessibilityIdentifier:", CFSTR("TertiaryLabel"));
  objc_msgSend(v22[44], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v38 = v22;
  if (sub_1002A8AA0(v38) == 5)
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v40 = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "_mapkit_fontByAddingFeaturesForTimeDisplay"));

  objc_msgSend(v22[44], "setFont:", v41);
  objc_msgSend(v22[44], "setNumberOfLines:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v22[44], "setTextColor:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel highlightedTextColor](self->_primaryLabel, "highlightedTextColor"));
  objc_msgSend(v22[44], "setHighlightedTextColor:", v43);

  objc_msgSend(v22[44], "setTextInset:", UIEdgeInsetsZero.top, left, bottom, right);
  objc_msgSend(v22[44], "setUserInteractionEnabled:", 0);
  LODWORD(v44) = 1148846080;
  objc_msgSend(v22[44], "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v44);
  LODWORD(v45) = 1148846080;
  objc_msgSend(v22[44], "_mapkit_setContentHuggingPriority:forAxis:", 1, v45);
  v46 = -[TransitArtworkListView initWithFrame:]([TransitArtworkListView alloc], "initWithFrame:", x, v25, v24, v104);
  v47 = v38[45];
  v38[45] = v46;

  objc_msgSend(v38[45], "setAccessibilityIdentifier:", CFSTR("BadgesArtworkListView"));
  objc_msgSend(v38[45], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v38[45], "setUserInteractionEnabled:", 0);
  LODWORD(v48) = 1148846080;
  objc_msgSend(v38[45], "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v48);
  LODWORD(v49) = 1148846080;
  objc_msgSend(v38[45], "_mapkit_setContentHuggingPriority:forAxis:", 1, v49);
  v50 = objc_msgSend(objc_alloc((Class)_MKUILabel), "initWithFrame:", x, v25, v24, v104);
  v51 = v38[46];
  v38[46] = v50;

  objc_msgSend(v38[46], "setAccessibilityIdentifier:", CFSTR("PrimaryAccessoryLabel"));
  objc_msgSend(v38[46], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v52 = v38;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "traitCollection"));
  v54 = objc_msgSend(v53, "userInterfaceIdiom");
  v55 = UIFontTextStyleBody;
  if (v54 != (id)5)
    v55 = UIFontTextStyleSubheadline;
  v56 = v55;

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", v56));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "fontDescriptor"));
  v59 = self;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", 1));

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v60, 0.0));
  objc_msgSend(v38[46], "setFont:", v61);

  objc_msgSend(v38[46], "_setMultilineLabelRequiresCarefulMeasurement:", 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel highlightedTextColor](v59->_primaryLabel, "highlightedTextColor"));
  objc_msgSend(v38[46], "setHighlightedTextColor:", v62);

  objc_msgSend(v38[46], "setUserInteractionEnabled:", 0);
  LODWORD(v63) = 1148846080;
  objc_msgSend(v38[46], "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v63);
  LODWORD(v64) = 1148846080;
  objc_msgSend(v38[46], "_mapkit_setContentHuggingPriority:forAxis:", 1, v64);
  v65 = objc_msgSend(objc_alloc((Class)_MKUILabel), "initWithFrame:", x, v25, v24, v104);
  v66 = v52[47];
  v52[47] = v65;

  objc_msgSend(v52[47], "setAccessibilityIdentifier:", CFSTR("SecondaryAccessoryLabel"));
  objc_msgSend(v52[47], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v67 = v52;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleSubheadline));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "traitCollection"));
  v70 = objc_msgSend(v69, "userInterfaceIdiom");

  if (v70 == (id)5)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "fontDescriptor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplay"));

    v73 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v72, 0.0));
    v68 = (void *)v73;
  }

  objc_msgSend(v52[47], "setFont:", v68);
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v52[47], "setTextColor:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel highlightedTextColor](v59->_primaryLabel, "highlightedTextColor"));
  objc_msgSend(v52[47], "setHighlightedTextColor:", v75);

  objc_msgSend(v52[47], "setUserInteractionEnabled:", 0);
  LODWORD(v76) = 1148846080;
  objc_msgSend(v52[47], "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v76);
  LODWORD(v77) = 1148846080;
  objc_msgSend(v52[47], "_mapkit_setContentHuggingPriority:forAxis:", 1, v77);
  v78 = -[PassThroughStackView initWithArrangedSubviews:]([PassThroughStackView alloc], "initWithArrangedSubviews:", &__NSArray0__struct);
  v79 = v67[37];
  v67[37] = v78;

  objc_msgSend(v67[37], "setAccessibilityIdentifier:", CFSTR("TextStackView"));
  objc_msgSend(v67[37], "setAlignment:", 1);
  objc_msgSend(v67[37], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v67[37], "set_mk_axis:", 1);
  objc_msgSend(v67[37], "setSpacing:", 0.0);
  objc_msgSend(v67[37], "setDistribution:", 0);
  LODWORD(v80) = 1144766464;
  objc_msgSend(v67[37], "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v80);
  LODWORD(v81) = 1148846080;
  objc_msgSend(v67[37], "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v81);
  LODWORD(v82) = 1148846080;
  objc_msgSend(v67[37], "_mapkit_setContentHuggingPriority:forAxis:", 1, v82);
  LODWORD(v83) = 1132068864;
  objc_msgSend(v67[37], "_mapkit_setContentHuggingPriority:forAxis:", 0, v83);
  objc_msgSend(v67, "addSubview:", v67[37]);
  v84 = objc_alloc_init((Class)UILayoutGuide);
  v85 = v67[33];
  v67[33] = v84;

  objc_msgSend(v67, "addLayoutGuide:", v67[33]);
  v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "_createImageView"));
  v87 = v67[48];
  v67[48] = (id)v86;

  objc_msgSend(v67[48], "setAccessibilityIdentifier:", CFSTR("PlatformArtworkImageView"));
  -[MKMultiPartLabel _mapkit_contentHuggingPriorityForAxis:](v11->_secondaryLabel, "_mapkit_contentHuggingPriorityForAxis:", 0);
  *(float *)&v89 = v88 + 1.0;
  objc_msgSend(v67[48], "_mapkit_setContentHuggingPriority:forAxis:", 0, v89);
  -[MKMultiPartLabel _mapkit_contentCompressionResistancePriorityForAxis:](v11->_secondaryLabel, "_mapkit_contentCompressionResistancePriorityForAxis:", 0);
  *(float *)&v91 = v90 + 1.0;
  objc_msgSend(v67[48], "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v91);
  objc_msgSend(v67, "addSubview:", v67[48]);
  v92 = objc_claimAutoreleasedReturnValue(+[MapsLargerHitTargetButton buttonWithType:](MapsLargerHitTargetButton, "buttonWithType:", 1));
  v93 = v67[49];
  v67[49] = (id)v92;

  objc_msgSend(v67[49], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v67[49], "setAccessibilityIdentifier:", CFSTR("DetailButton"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "traitCollection"));
  if (objc_msgSend(v94, "userInterfaceIdiom") == (id)5)
    v95 = 6.0;
  else
    v95 = 8.0;

  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "detailButton"));
  objc_msgSend(v96, "setTouchInsets:", -v95, -16.0, -v95, -16.0);

  v97 = v67[49];
  v98 = v67;
  if (sub_1002A8AA0(v98) == 5)
    v99 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v99 = objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v100 = (void *)v99;

  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "_mapkit_fontByAddingFeaturesForTimeDisplay"));
  objc_msgSend(v97, "_setFont:", v101);

  v102 = v67[49];
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v102, "setTitleColor:forStates:", v103, 2);

  objc_msgSend(v67[49], "addTarget:action:forControlEvents:", v98, "_detailButtonTapped:", 64);
  objc_msgSend(v98, "addSubview:", v67[49]);
  objc_msgSend(v98, "updateExpandCollapseStyling");
  objc_msgSend(v98, "_setCellStyle:", v59->_cellStyle);
}

- (unint64_t)_bestCellStyleForCurrentState
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    return 1;
  if (-[TransitDirectionsStepView useNavigationMetrics](self, "useNavigationMetrics"))
    return 2;
  return 0;
}

- (void)_setCellStyle:(unint64_t)cellStyle
{
  _TransitDirectionsInstructionsCellConstraints *styleConstraints;
  _TransitDirectionsInstructionsCellConstraints *v5;
  unsigned int v6;
  UIStackView *v7;
  _MKUILabel *v8;
  MKMultiPartLabel *tertiaryLabel;
  void *v10;
  UIStackView *textStackView;
  _MKUILabel **p_primaryAccessoryLabel;
  _MKUILabel *primaryAccessoryLabel;
  MKMultiPartLabel *secondaryLabel;
  TransitArtworkListView *badgesArtworkListView;
  void *v16;
  uint64_t v17;
  MKMultiPartLabel *v18;
  TransitArtworkListView *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _TransitDirectionsInstructionsCellConstraints *v24;
  _TransitDirectionsInstructionsCellConstraints *v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[4];
  _QWORD v29[5];

  self->_cellStyle = cellStyle;
  styleConstraints = self->_styleConstraints;
  if (styleConstraints)
  {
    -[_TransitDirectionsInstructionsCellConstraints deactivateConstraints](styleConstraints, "deactivateConstraints");
    v5 = self->_styleConstraints;
    self->_styleConstraints = 0;

    cellStyle = self->_cellStyle;
  }
  switch(cellStyle)
  {
    case 2uLL:
      goto LABEL_6;
    case 1uLL:
      textStackView = self->_textStackView;
      p_primaryAccessoryLabel = &self->_primaryAccessoryLabel;
      primaryAccessoryLabel = self->_primaryAccessoryLabel;
      v27[0] = self->_primaryLabel;
      v27[1] = primaryAccessoryLabel;
      secondaryLabel = self->_secondaryLabel;
      v27[2] = self->_secondaryAccessoryLabel;
      v27[3] = secondaryLabel;
      badgesArtworkListView = self->_badgesArtworkListView;
      v27[4] = self->_tertiaryLabel;
      v27[5] = badgesArtworkListView;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 6));
      -[UIStackView _mapkit_setArrangedSubviews:](textStackView, "_mapkit_setArrangedSubviews:", v16);

      -[_MKUILabel setTextAlignment:](self->_primaryAccessoryLabel, "setTextAlignment:", 4);
      -[_MKUILabel setTextAlignment:](self->_secondaryAccessoryLabel, "setTextAlignment:", 4);
      v17 = 2;
LABEL_17:
      -[_MKUILabel setNumberOfLines:](*p_primaryAccessoryLabel, "setNumberOfLines:", v17);
      break;
    case 0uLL:
LABEL_6:
      v6 = -[TransitDirectionsInstructionsStepView _combineAccessoryLabels](self, "_combineAccessoryLabels");
      v7 = self->_textStackView;
      if (v6)
      {
        v8 = self->_primaryAccessoryLabel;
        v29[0] = self->_primaryLabel;
        v29[1] = v8;
        tertiaryLabel = self->_tertiaryLabel;
        v29[2] = self->_secondaryLabel;
        v29[3] = tertiaryLabel;
        v29[4] = self->_badgesArtworkListView;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 5));
        -[UIStackView _mapkit_setArrangedSubviews:](v7, "_mapkit_setArrangedSubviews:", v10);

        -[_MKUILabel setTextAlignment:](self->_primaryAccessoryLabel, "setTextAlignment:", 4);
        -[_MKUILabel setTextAlignment:](self->_secondaryAccessoryLabel, "setTextAlignment:", 4);
        -[_MKUILabel removeFromSuperview](self->_secondaryAccessoryLabel, "removeFromSuperview");
      }
      else
      {
        v18 = self->_secondaryLabel;
        v28[0] = self->_primaryLabel;
        v28[1] = v18;
        v19 = self->_badgesArtworkListView;
        v28[2] = self->_tertiaryLabel;
        v28[3] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
        -[UIStackView _mapkit_setArrangedSubviews:](v7, "_mapkit_setArrangedSubviews:", v20);

        if (MKApplicationLayoutDirectionIsRightToLeft(v21))
          v22 = 0;
        else
          v22 = 2;
        if (MKApplicationLayoutDirectionIsRightToLeft(-[_MKUILabel setTextAlignment:](self->_primaryAccessoryLabel, "setTextAlignment:", v22)))
          v23 = 0;
        else
          v23 = 2;
        -[_MKUILabel setTextAlignment:](self->_secondaryAccessoryLabel, "setTextAlignment:", v23);
        -[TransitDirectionsInstructionsStepView addSubview:](self, "addSubview:", self->_primaryAccessoryLabel);
        -[TransitDirectionsInstructionsStepView addSubview:](self, "addSubview:", self->_secondaryAccessoryLabel);
      }
      p_primaryAccessoryLabel = &self->_primaryAccessoryLabel;
      v17 = 3;
      goto LABEL_17;
  }
  -[TransitDirectionsInstructionsStepView _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
  v24 = (_TransitDirectionsInstructionsCellConstraints *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView _constraintsForCellStyle:](self, "_constraintsForCellStyle:", self->_cellStyle));
  v25 = self->_styleConstraints;
  self->_styleConstraints = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints initialConstraints](self->_styleConstraints, "initialConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  -[TransitDirectionsInstructionsStepView _cellStyleDidChange](self, "_cellStyleDidChange");
  -[TransitDirectionsInstructionsStepView _updateConstraints](self, "_updateConstraints");
}

- (double)_extraSpacingAboveView:(id)a3
{
  _MKUILabel *v4;
  double v5;
  double v6;
  double v8;
  double v9;

  v4 = (_MKUILabel *)a3;
  v5 = 0.0;
  if (self->_primaryAccessoryLabel == v4)
  {
    -[TransitDirectionsInstructionsStepView _metrics](self, "_metrics", 0.0);
    v5 = v9;
  }
  if (self->_secondaryLabel == v4)
  {
    -[TransitDirectionsInstructionsStepView _metrics](self, "_metrics", v5);
    v5 = v8;
  }
  if ((_MKUILabel *)self->_badgesArtworkListView == v4)
    v6 = 4.0;
  else
    v6 = v5;

  return v6;
}

- (id)_constraintsForCellStyle:(unint64_t)a3
{
  id v4;
  _TransitDirectionsInstructionsCellConstraints *v5;
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
  TransitDirectionsInstructionsStepView *v35;
  _TransitDirectionsInstructionsCellConstraints *v36;
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
  id *p_isa;
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
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
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
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  void *i;
  _MKUILabel *v114;
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
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  id v153;
  void *j;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  _TransitDirectionsInstructionsCellConstraints *v174;
  id obja;
  id objb;
  uint64_t v178;
  TransitDirectionsInstructionsStepView *v179;
  void *v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  _BYTE v189[128];
  _QWORD v190[2];
  _BYTE v191[128];

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_alloc_init(_TransitDirectionsInstructionsCellConstraints);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView heightAnchor](self, "heightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintGreaterThanOrEqualToConstant:", 0.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_withIdentifier:", CFSTR("minimumCellHeightConstraint")));
  -[_TransitDirectionsInstructionsCellConstraints setMinimumCellHeightConstraint:](v5, "setMinimumCellHeightConstraint:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints minimumCellHeightConstraint](v5, "minimumCellHeightConstraint"));
  objc_msgSend(v4, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView bottomAnchor](self->_platformArtworkImageView, "bottomAnchor"));
  -[TransitDirectionsInstructionsStepView _minPlatformArtworkBottomToBottomDistance](self, "_minPlatformArtworkBottomToBottomDistance");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:constant:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_withIdentifier:", CFSTR("platformArtworkBottomToBottomConstraint")));
  -[_TransitDirectionsInstructionsCellConstraints setPlatformArtworkBottomToBottomConstraint:](v5, "setPlatformArtworkBottomToBottomConstraint:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkBottomToBottomConstraint](v5, "platformArtworkBottomToBottomConstraint"));
  objc_msgSend(v4, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton trailingAnchor](self->_detailButton, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_maps_withIdentifier:", CFSTR("detailButtonTrailingToContentTrailing")));
  objc_msgSend(v4, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton firstBaselineAnchor](self->_detailButton, "firstBaselineAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_maps_withIdentifier:", CFSTR("detailButtonBaselineToPrimaryLabelBaseline")));
  objc_msgSend(v4, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView bottomAnchor](self->_platformArtworkImageView, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel firstBaselineAnchor](self->_secondaryLabel, "firstBaselineAnchor"));
  -[TransitDirectionsInstructionsStepView _secondaryFirstBaselineToBottomPlatformArtworkDistance](self, "_secondaryFirstBaselineToBottomPlatformArtworkDistance");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_maps_withIdentifier:", CFSTR("secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint")));
  -[_TransitDirectionsInstructionsCellConstraints setSecondaryLabelFirstBaselineToPlatformArtworkBottomConstraint:](v5, "setSecondaryLabelFirstBaselineToPlatformArtworkBottomConstraint:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint](v5, "secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint"));
  objc_msgSend(v4, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_textStackView, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_maps_withIdentifier:", CFSTR("contentBottomToTextStackBaseline")));
  objc_msgSend(v4, "addObject:", v34);

  v35 = self;
  v36 = v5;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView _platformArtworkHorizontalPositioningConstraint](v35, "_platformArtworkHorizontalPositioningConstraint"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "_maps_withIdentifier:", CFSTR("platformArtworkHorizontalPositioning")));
  objc_msgSend(v4, "addObject:", v38);

  v179 = v35;
  v180 = v4;
  switch(a3)
  {
    case 2uLL:
      goto LABEL_4;
    case 1uLL:
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v35->_textStackView, "leadingAnchor"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v35, "contentLayoutGuide"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "leadingAnchor"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v95));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "_maps_withIdentifier:", CFSTR("contentLayoutGuideToPrimaryLeadingConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setContentLayoutGuideToPrimaryLeadingConstraint:](v36, "setContentLayoutGuideToPrimaryLeadingConstraint:", v97);

      v98 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints contentLayoutGuideToPrimaryLeadingConstraint](v36, "contentLayoutGuideToPrimaryLeadingConstraint"));
      objc_msgSend(v4, "addObject:", v98);

      v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v35->_textStackView, "topAnchor"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v35, "contentLayoutGuide"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "topAnchor"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v101));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "_maps_withIdentifier:", CFSTR("topToPrimaryConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setTopToPrimaryConstraint:](v36, "setTopToPrimaryConstraint:", v103);

      v174 = v36;
      v104 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints topToPrimaryConstraint](v36, "topToPrimaryConstraint"));
      objc_msgSend(v4, "addObject:", v104);

      v105 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v35, "contentLayoutGuide"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "trailingAnchor"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v35->_textStackView, "trailingAnchor"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v107));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "_maps_withIdentifier:", CFSTR("contentTrailingToTextStackTrailing")));
      objc_msgSend(v4, "addObject:", v109);

      v183 = 0u;
      v184 = 0u;
      v181 = 0u;
      v182 = 0u;
      obja = (id)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](v35->_textStackView, "arrangedSubviews"));
      v110 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v181, v189, 16);
      if (v110)
      {
        v111 = v110;
        v112 = *(_QWORD *)v182;
        do
        {
          for (i = 0; i != v111; i = (char *)i + 1)
          {
            if (*(_QWORD *)v182 != v112)
              objc_enumerationMutation(obja);
            v114 = *(_MKUILabel **)(*((_QWORD *)&v181 + 1) + 8 * (_QWORD)i);
            v115 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v35, "contentLayoutGuide"));
            v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "trailingAnchor"));
            v117 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](v114, "trailingAnchor"));
            v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:", v117));
            v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "_maps_withIdentifier:", CFSTR("contentTrailingToLabelTrailing")));

            v35 = v179;
            if (v114 == v179->_primaryLabel)
            {
              -[_TransitDirectionsInstructionsCellConstraints setPrimaryAccessoryToTrailingConstraint:](v174, "setPrimaryAccessoryToTrailingConstraint:", v119);
              v120 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryToTrailingConstraint](v174, "primaryAccessoryToTrailingConstraint"));
              objc_msgSend(v120, "setIdentifier:", CFSTR("primaryAccessoryToTrailingConstraint"));

            }
            v4 = v180;
            objc_msgSend(v180, "addObject:", v119);

          }
          v111 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v181, v189, 16);
        }
        while (v111);
      }

      goto LABEL_27;
    case 0uLL:
LABEL_4:
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel topAnchor](v35->_primaryLabel, "topAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v35, "contentLayoutGuide"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_maps_withIdentifier:", CFSTR("topToPrimaryConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setTopToPrimaryConstraint:](v36, "setTopToPrimaryConstraint:", v43);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints topToPrimaryConstraint](v36, "topToPrimaryConstraint"));
      objc_msgSend(v4, "addObject:", v44);

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](v35, "contentLayoutGuide"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](v35, "primaryLabel"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintGreaterThanOrEqualToAnchor:", v48));
      p_isa = (id *)&v35->super.super.super.super.super.isa;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "_maps_withIdentifier:", CFSTR("primaryToContentBottomConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setPrimaryBaselineToBottomConstraint:](v36, "setPrimaryBaselineToBottomConstraint:", v51);

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryBaselineToBottomConstraint](v36, "primaryBaselineToBottomConstraint"));
      objc_msgSend(v4, "addObject:", v52);

      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "primaryLabel"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "contentLayoutGuide"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v56));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "_maps_withIdentifier:", CFSTR("contentLayoutGuideToPrimaryLeadingConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setContentLayoutGuideToPrimaryLeadingConstraint:](v36, "setContentLayoutGuideToPrimaryLeadingConstraint:", v58);

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints contentLayoutGuideToPrimaryLeadingConstraint](v36, "contentLayoutGuideToPrimaryLeadingConstraint"));
      objc_msgSend(v4, "addObject:", v59);

      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[37], "leadingAnchor"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[48], "trailingAnchor"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "traitCollection"));
      if (objc_msgSend(v62, "userInterfaceIdiom") == (id)5)
        v63 = 6.0;
      else
        v63 = 4.0;

      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, v63));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "_maps_withIdentifier:", CFSTR("platformArtworkTrailingToTextStackLabelLeadingConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setPlatformArtworkTrailingToTextStackLabelLeadingConstraint:](v36, "setPlatformArtworkTrailingToTextStackLabelLeadingConstraint:", v65);

      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[37], "leadingAnchor"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[42], "leadingAnchor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "_maps_withIdentifier:", CFSTR("textStackLeadingToPrimaryLabelLeadingConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setTextStackLeadingToPrimaryLabelLeadingConstraint:](v36, "setTextStackLeadingToPrimaryLabelLeadingConstraint:", v69);

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints textStackLeadingToPrimaryLabelLeadingConstraint](v36, "textStackLeadingToPrimaryLabelLeadingConstraint"));
      LODWORD(v71) = 1148829696;
      objc_msgSend(v70, "setPriority:", v71);

      v72 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints textStackLeadingToPrimaryLabelLeadingConstraint](v36, "textStackLeadingToPrimaryLabelLeadingConstraint"));
      objc_msgSend(v4, "addObject:", v72);

      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[33], "leadingAnchor"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[42], "trailingAnchor"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v74));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "_maps_withIdentifier:", CFSTR("primaryLabelTrailingToTrailingContentConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setPrimaryLabelTrailingToTrailingContentConstraint:](v36, "setPrimaryLabelTrailingToTrailingContentConstraint:", v76);

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryLabelTrailingToTrailingContentConstraint](v36, "primaryLabelTrailingToTrailingContentConstraint"));
      objc_msgSend(v4, "addObject:", v77);

      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[33], "leadingAnchor"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[43], "trailingAnchor"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v79));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "_maps_withIdentifier:", CFSTR("secondaryLabelTrailingToTrailingContentConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setSecondaryLabelTrailingToTrailingContentConstraint:](v36, "setSecondaryLabelTrailingToTrailingContentConstraint:", v81);

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints secondaryLabelTrailingToTrailingContentConstraint](v36, "secondaryLabelTrailingToTrailingContentConstraint"));
      objc_msgSend(v4, "addObject:", v82);

      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[44], "trailingAnchor"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "contentLayoutGuide"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "trailingAnchor"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v85));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "_maps_withIdentifier:", CFSTR("tertiaryLabelTrailingToContentTrailing")));
      objc_msgSend(v4, "addObject:", v87);

      if ((objc_msgSend(p_isa, "_combineAccessoryLabels") & 1) != 0)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "contentLayoutGuide"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[37], "trailingAnchor"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v90));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "_maps_withIdentifier:", CFSTR("contentTrailingToTextStackTrailing")));
        objc_msgSend(v4, "addObject:", v92);

        break;
      }
      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[46], "trailingAnchor"));
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "contentLayoutGuide"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "trailingAnchor"));
      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v123));
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "_maps_withIdentifier:", CFSTR("primaryAccessoryToTrailingConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setPrimaryAccessoryToTrailingConstraint:](v36, "setPrimaryAccessoryToTrailingConstraint:", v125);

      v126 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryToTrailingConstraint](v36, "primaryAccessoryToTrailingConstraint"));
      objc_msgSend(v4, "addObject:", v126);

      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[47], "trailingAnchor"));
      v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[46], "trailingAnchor"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:", v128));
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "_maps_withIdentifier:", CFSTR("secondaryAccessoryTrailingToPrimaryAccessoryTrailing")));
      objc_msgSend(v4, "addObject:", v130);

      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[47], "bottomAnchor"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "contentLayoutGuide"));
      v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "bottomAnchor"));
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintLessThanOrEqualToAnchor:", v133));
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "_maps_withIdentifier:", CFSTR("secondaryAccessoryBaselineToContentBottom")));
      objc_msgSend(v4, "addObject:", v135);

      v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[47], "topAnchor"));
      v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[46], "bottomAnchor"));
      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:", v137));
      v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "_maps_withIdentifier:", CFSTR("primaryAccessoryToSecondaryAccessoryConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setPrimaryAccessoryToSecondaryAccessoryConstraint:](v36, "setPrimaryAccessoryToSecondaryAccessoryConstraint:", v139);

      v140 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryToSecondaryAccessoryConstraint](v36, "primaryAccessoryToSecondaryAccessoryConstraint"));
      objc_msgSend(v4, "addObject:", v140);

      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[46], "firstBaselineAnchor"));
      v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "primaryLabel"));
      v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "firstBaselineAnchor"));
      v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v143));
      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "_maps_withIdentifier:", CFSTR("primaryAccessoryBaselineToPrimaryBaseline")));
      objc_msgSend(v4, "addObject:", v145);

      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[46], "widthAnchor"));
      v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "contentLayoutGuide"));
      v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "widthAnchor"));
      v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "constraintLessThanOrEqualToAnchor:multiplier:", v148, 0.5));
      v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "_maps_withIdentifier:", CFSTR("primaryAccessoryMaximumWidthFactorConstraint")));
      -[_TransitDirectionsInstructionsCellConstraints setPrimaryAccessoryMaximumWidthFactorConstraint:](v36, "setPrimaryAccessoryMaximumWidthFactorConstraint:", v150);

      v187 = 0u;
      v188 = 0u;
      v185 = 0u;
      v186 = 0u;
      v151 = p_isa[47];
      v190[0] = p_isa[46];
      v190[1] = v151;
      objb = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v190, 2));
      v152 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v185, v191, 16);
      v174 = v36;
      if (v152)
      {
        v153 = v152;
        v178 = *(_QWORD *)v186;
        do
        {
          for (j = 0; j != v153; j = (char *)j + 1)
          {
            if (*(_QWORD *)v186 != v178)
              objc_enumerationMutation(objb);
            v155 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * (_QWORD)j);
            v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "topAnchor"));
            v157 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v179->_trailingContentLayoutGuide, "topAnchor"));
            v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintGreaterThanOrEqualToAnchor:", v157));
            v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "_maps_withIdentifier:", CFSTR("accessoryTopToTrailingContentTop")));
            objc_msgSend(v180, "addObject:", v159);

            v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "leadingAnchor"));
            v161 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v179->_trailingContentLayoutGuide, "leadingAnchor"));
            v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "constraintEqualToAnchor:", v161));
            v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "_maps_withIdentifier:", CFSTR("accessoryLeadingToTrailingContentLeading")));
            objc_msgSend(v180, "addObject:", v163);

            v164 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v179->_trailingContentLayoutGuide, "trailingAnchor"));
            v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "trailingAnchor"));
            v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "constraintEqualToAnchor:", v165));
            v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "_maps_withIdentifier:", CFSTR("accessoryTrailingToTrailingContentTrailing")));
            objc_msgSend(v180, "addObject:", v167);

            v168 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v179->_trailingContentLayoutGuide, "bottomAnchor"));
            v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "bottomAnchor"));
            v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintGreaterThanOrEqualToAnchor:", v169));
            v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "_maps_withIdentifier:", CFSTR("accessoryBottomToTrailingContentBottom")));
            objc_msgSend(v180, "addObject:", v171);

          }
          v153 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v185, v191, 16);
        }
        while (v153);
      }

      v4 = v180;
LABEL_27:
      v36 = v174;
      break;
  }
  v172 = objc_msgSend(v4, "copy");
  -[_TransitDirectionsInstructionsCellConstraints setInitialConstraints:](v36, "setInitialConstraints:", v172);

  return v36;
}

- (id)_imageViewPositionConstraints
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *imageViewSingleInstructionConstraint;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *imageViewMultipleInstructionsConstraint;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TransitDirectionsInstructionsStepView;
  v3 = -[TransitDirectionsIconStepView _imageViewPositionConstraints](&v22, "_imageViewPositionConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  if (!self->_imageViewSingleInstructionConstraint)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->super._iconImageView, "centerYAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](self->_textStackView, "centerYAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_withIdentifier:", CFSTR("imageViewCenterToTextStackCenter")));
    imageViewSingleInstructionConstraint = self->_imageViewSingleInstructionConstraint;
    self->_imageViewSingleInstructionConstraint = v9;

  }
  if (!self->_imageViewMultipleInstructionsConstraint)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView topAnchor](self->super._iconImageView, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_textStackView, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_withIdentifier:", CFSTR("imageViewTopToTextStackTop")));
    imageViewMultipleInstructionsConstraint = self->_imageViewMultipleInstructionsConstraint;
    self->_imageViewMultipleInstructionsConstraint = v14;

  }
  objc_msgSend(v5, "addObject:", self->_imageViewSingleInstructionConstraint);
  objc_msgSend(v5, "addObject:", self->_imageViewMultipleInstructionsConstraint);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView widthAnchor](self->super._iconImageView, "widthAnchor"));
  -[TransitDirectionsInstructionsStepView _maximumIconWidth](self, "_maximumIconWidth");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:"));
  objc_msgSend(v5, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView heightAnchor](self->super._iconImageView, "heightAnchor"));
  -[TransitDirectionsInstructionsStepView _maximumIconHeight](self, "_maximumIconHeight");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:"));
  objc_msgSend(v5, "addObject:", v19);

  v20 = objc_msgSend(v5, "copy");
  return v20;
}

- (void)_updateMultipleInstructionImagePositionConstraint
{
  void *v3;
  double v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  TransitDirectionsInstructionsStepView *v8;
  double v9;
  double v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "userInterfaceIdiom");

  v4 = 6.0;
  if (-[TransitDirectionsStepView useNavigationMetrics](self, "useNavigationMetrics"))
  {
    v5 = -[TransitDirectionsStepView navigationState](self, "navigationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
    objc_msgSend(v6, "userInterfaceIdiom");

    if (v5 == 4)
      v4 = 10.0;
    else
      v4 = 8.0;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_primaryLabel, "font"));
  v8 = self;
  if (v11)
  {
    objc_msgSend(v11, "_scaledValueForValue:", v4);
    v4 = v9;
  }
  v10 = UIRoundToViewScale(v8, v7, v4);

  -[NSLayoutConstraint setConstant:](v8->_imageViewMultipleInstructionsConstraint, "setConstant:", v10);
}

- (void)_updateConstraints
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  _TransitDirectionsInstructionsCellConstraints *styleConstraints;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  -[TransitDirectionsInstructionsStepView _updateConstraintValues](self, "_updateConstraintValues");
  v3 = -[TransitDirectionsInstructionsStepView _hasTrailingContent](self, "_hasTrailingContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryMaximumWidthFactorConstraint](self->_styleConstraints, "primaryAccessoryMaximumWidthFactorConstraint"));
  objc_msgSend(v4, "setActive:", v3);

  -[TransitDirectionsInstructionsStepView _updateAccessoryLabelCompressionHuggingPriorities](self, "_updateAccessoryLabelCompressionHuggingPriorities");
  v5 = -[TransitDirectionsInstructionsStepView _useSingleInstructionMetrics](self, "_useSingleInstructionMetrics");
  LODWORD(v3) = v5;
  -[NSLayoutConstraint setActive:](self->_imageViewSingleInstructionConstraint, "setActive:", v5);
  -[NSLayoutConstraint setActive:](self->_imageViewMultipleInstructionsConstraint, "setActive:", v3 ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minorStringImage"));

  styleConstraints = self->_styleConstraints;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints textStackLeadingToPrimaryLabelLeadingConstraint](styleConstraints, "textStackLeadingToPrimaryLabelLeadingConstraint"));
    objc_msgSend(v9, "setActive:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkTrailingToTextStackLabelLeadingConstraint](self->_styleConstraints, "platformArtworkTrailingToTextStackLabelLeadingConstraint"));
    objc_msgSend(v10, "setActive:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkBottomToBottomConstraint](self->_styleConstraints, "platformArtworkBottomToBottomConstraint"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkBottomToBottomConstraint](styleConstraints, "platformArtworkBottomToBottomConstraint"));
    objc_msgSend(v12, "setActive:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkTrailingToTextStackLabelLeadingConstraint](self->_styleConstraints, "platformArtworkTrailingToTextStackLabelLeadingConstraint"));
    objc_msgSend(v13, "setActive:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints textStackLeadingToPrimaryLabelLeadingConstraint](self->_styleConstraints, "textStackLeadingToPrimaryLabelLeadingConstraint"));
  }
  v14 = v11;
  objc_msgSend(v11, "setActive:", 1);

  v15.receiver = self;
  v15.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsStepView _updateConstraints](&v15, "_updateConstraints");
}

- (void)_updateConstraintValues
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  unint64_t cellStyle;
  UIStackView *textStackView;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  void *v24;
  TransitDirectionsInstructionsStepView *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  -[TransitDirectionsInstructionsStepView _updateMultipleInstructionImagePositionConstraint](self, "_updateMultipleInstructionImagePositionConstraint");
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  -[TransitDirectionsInstructionsStepView _metrics](self, "_metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints minimumCellHeightConstraint](self->_styleConstraints, "minimumCellHeightConstraint"));
  objc_msgSend(v3, "setConstant:", 0.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints contentLayoutGuideToPrimaryLeadingConstraint](self->_styleConstraints, "contentLayoutGuideToPrimaryLeadingConstraint"));
  objc_msgSend(v4, "setConstant:", 0.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints topToPrimaryConstraint](self->_styleConstraints, "topToPrimaryConstraint"));
  objc_msgSend(v5, "setConstant:", 0.0);

  -[TransitDirectionsInstructionsStepView _secondaryFirstBaselineToBottomPlatformArtworkDistance](self, "_secondaryFirstBaselineToBottomPlatformArtworkDistance");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint](self->_styleConstraints, "secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint"));
  objc_msgSend(v8, "setConstant:", v7);

  cellStyle = self->_cellStyle;
  if (cellStyle == 2)
  {
LABEL_4:
    textStackView = self->_textStackView;
    -[TransitDirectionsInstructionsStepView _extraSpacingAboveView:](self, "_extraSpacingAboveView:", self->_badgesArtworkListView);
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView tertiaryLabel](self, "tertiaryLabel"));
    -[UIStackView setCustomSpacing:afterView:](textStackView, "setCustomSpacing:afterView:", v13, v12);

    v14 = 0.0;
    if (-[TransitDirectionsStepView useNavigationMetrics](self, "useNavigationMetrics"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
      if (objc_msgSend(v15, "userInterfaceIdiom") == (id)5)
        v14 = 0.0;
      else
        v14 = 46.0;

    }
    if (-[TransitDirectionsInstructionsStepView _hasTrailingContent](self, "_hasTrailingContent"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
      objc_msgSend(v16, "userInterfaceIdiom");

      v14 = 10.0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryLabelTrailingToTrailingContentConstraint](self->_styleConstraints, "primaryLabelTrailingToTrailingContentConstraint"));
    objc_msgSend(v17, "setConstant:", v14);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryLabelTrailingToTrailingContentConstraint](self->_styleConstraints, "primaryLabelTrailingToTrailingContentConstraint"));
    objc_msgSend(v18, "constant");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints secondaryLabelTrailingToTrailingContentConstraint](self->_styleConstraints, "secondaryLabelTrailingToTrailingContentConstraint"));
    objc_msgSend(v21, "setConstant:", v20);
    goto LABEL_13;
  }
  if (cellStyle != 1)
  {
    if (cellStyle)
      return;
    goto LABEL_4;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_textStackView, "arrangedSubviews"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100BB2964;
  v23[3] = &unk_1011E7E40;
  v25 = self;
  v26 = objc_msgSend(v22, "count");
  v24 = v22;
  v18 = v22;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);
  v21 = v24;
LABEL_13:

}

- (void)layoutSubviews
{
  unint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unsigned __int8 v29;
  const char *v30;
  char v31;
  unsigned __int8 v32;
  uint64_t v33;
  id v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];

  v40.receiver = self;
  v40.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsIconStepView layoutSubviews](&v40, "layoutSubviews");
  v3 = -[TransitDirectionsInstructionsStepView _bestCellStyleForCurrentState](self, "_bestCellStyleForCurrentState");
  if (v3 != self->_cellStyle)
  {
    -[TransitDirectionsInstructionsStepView _setCellStyle:](self, "_setCellStyle:", v3);
    -[TransitDirectionsInstructionsStepView updateConstraints](self, "updateConstraints");
    -[TransitDirectionsInstructionsStepView layoutSubviews](self, "layoutSubviews");
    return;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = objc_msgSend(&off_101274328, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v4)
    return;
  v5 = v4;
  v30 = "layoutSubviews";
  v31 = 0;
  v6 = *(_QWORD *)v37;
  v33 = *(_QWORD *)v37;
  do
  {
    v7 = 0;
    v34 = v5;
    do
    {
      if (*(_QWORD *)v37 != v6)
        objc_enumerationMutation(&off_101274328);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v7), "integerValue", v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView _layoutItemForInstructionType:](self, "_layoutItemForInstructionType:", v8));
      v10 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView _labelViewForInstructionType:](self, "_labelViewForInstructionType:", v8));
      v11 = (void *)v10;
      if (v9)
        v12 = v10 == 0;
      else
        v12 = 1;
      if (!v12)
      {
        v13 = objc_opt_class(MKMultiPartLabel);
        if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
        {
          v14 = v11;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "text"));
          if (objc_msgSend(v15, "length"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bestFittingMultiPartString"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributedString"));
            if (objc_msgSend(v17, "length"))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "multiPartString"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bestFittingMultiPartString"));
              v20 = v18;
              v21 = v19;
              if (!(v20 | v21))
              {

                goto LABEL_29;
              }
              v28 = (void *)v21;
              v32 = objc_msgSend((id)v20, "isEqual:", v21);

              if ((v32 & 1) != 0)
              {
                v6 = v33;
                v5 = v34;
LABEL_31:

                goto LABEL_32;
              }
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bestFittingMultiPartString"));
              objc_msgSend(v14, "setMultiPartString:", v15);
LABEL_29:
              v6 = v33;
              v5 = v34;
            }
            else
            {

              v5 = v34;
            }
          }
        }
        else
        {
          v22 = objc_opt_class(_MKUILabel);
          if ((objc_opt_isKindOfClass(v11, v22) & 1) == 0)
            goto LABEL_32;
          v23 = v11;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bestFittingMultiPartString"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "attributedString"));

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "attributedText"));
          if (objc_msgSend(v25, "length") && objc_msgSend(v15, "length"))
          {
            v26 = (unint64_t)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "attributedText"));
            v27 = v15;
            if (v27 | v26)
            {
              v15 = (void *)v27;
              v29 = objc_msgSend((id)v26, "isEqual:", v27);

              if ((v29 & 1) == 0)
              {
                objc_msgSend(v23, "setAttributedText:", v15);
                v31 = 1;
              }
              v6 = v33;
            }
            else
            {

              v15 = 0;
            }
          }
          else
          {

          }
        }

        goto LABEL_31;
      }
LABEL_32:

      v7 = (char *)v7 + 1;
    }
    while (v5 != v7);
    v5 = objc_msgSend(&off_101274328, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v5);
  if ((v31 & 1) != 0)
  {
    -[TransitDirectionsInstructionsStepView _updateConstraints](self, "_updateConstraints");
    -[TransitDirectionsInstructionsStepView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    v35.receiver = self;
    v35.super_class = (Class)TransitDirectionsInstructionsStepView;
    objc_msgSendSuper2(&v35, v30);
  }
}

- (TransitDirectionsListExpandableItem)expandableItem
{
  void *v3;
  void *v4;

  if (!self->_checkedItemIsExpandable)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
    if ((objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem) & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
      objc_storeWeak((id *)&self->_expandableItem, v4);

    }
    else
    {
      objc_storeWeak((id *)&self->_expandableItem, 0);
    }

    self->_checkedItemIsExpandable = 1;
  }
  return (TransitDirectionsListExpandableItem *)objc_loadWeakRetained((id *)&self->_expandableItem);
}

- (void)updateExpandCollapseStyling
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView expandableItem](self, "expandableItem"));
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton currentTitle](self->_detailButton, "currentTitle"));
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "expandingButtonTitleForExpandedState:", objc_msgSend(v7, "expanded")));

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100BB2FE4;
    v8[3] = &unk_1011AD238;
    v8[4] = self;
    v3 = v4;
    v9 = v3;
    v10 = v7;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

  }
  if (objc_msgSend(v3, "length"))
    v5 = objc_msgSend(v7, "shouldDisplayExpandButton") ^ 1;
  else
    v5 = 1;
  -[MapsLargerHitTargetButton setHidden:](self->_detailButton, "setHidden:", v5);
  if (v7)
  {
    -[TransitDirectionsInstructionsStepView _updateConstraints](self, "_updateConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView detailButton](self, "detailButton"));
    objc_msgSend(v6, "sizeToFit");

  }
}

- (BOOL)_useSingleInstructionMetrics
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  _MKUILabel *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_textStackView, "arrangedSubviews", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_MKUILabel **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (v9 != self->_primaryLabel && !-[_MKUILabel isHidden](v9, "isHidden"))
        {
          v10 = 0;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)_hasTrailingContent
{
  if (self->_cellStyle == 1)
    return 0;
  if (-[_MKUILabel isHidden](self->_primaryAccessoryLabel, "isHidden"))
    return -[_MKUILabel isHidden](self->_secondaryAccessoryLabel, "isHidden") ^ 1;
  return 1;
}

- ($29727DC6989B69F22950FCD998EA20D4)_metrics
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  char *v9;
  double v10;
  unsigned int v11;
  void *v12;
  id v13;
  unsigned int v14;
  void *v15;
  void *v16;
  double v17;
  $29727DC6989B69F22950FCD998EA20D4 *result;

  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var6 = 10.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v5, "userInterfaceIdiom") == (id)5)
    v6 = 30.0;
  else
    v6 = 40.0;

  retstr->var3 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
  objc_msgSend(v7, "userInterfaceIdiom");

  retstr->var4 = 30.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v9 = (char *)objc_msgSend(v8, "type");

  if ((unint64_t)(v9 - 2) >= 0xD || (v10 = 0.0, ((0x130Bu >> ((_BYTE)v9 - 2)) & 1) == 0))
  {
    v11 = -[TransitDirectionsStepView useNavigationMetrics](self, "useNavigationMetrics", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    v10 = 70.0;
    if (v11)
      v10 = 82.0;
    if (v13 == (id)5)
      v10 = 43.0;
  }
  retstr->var2 = v10;
  v14 = -[TransitDirectionsStepView useNavigationMetrics](self, "useNavigationMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
  v16 = v15;
  if (v14)
    v17 = 24.0;
  else
    v17 = 16.0;
  if (objc_msgSend(v15, "userInterfaceIdiom") == (id)5)
    v17 = 10.0;

  retstr->var0 = v17;
  return result;
}

- (double)_maximumIconWidth
{
  double v3;

  -[TransitDirectionsInstructionsStepView _metrics](self, "_metrics");
  return v3;
}

- (double)_maximumIconHeight
{
  double v3;

  -[TransitDirectionsInstructionsStepView _metrics](self, "_metrics");
  return v3;
}

- (double)_secondaryFirstBaselineToBottomPlatformArtworkDistance
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](self->_secondaryLabel, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 2.0);
  v5 = v4;

  return UIRoundToViewScale(self, v6, v5);
}

- (double)_detailButtonBaselineToLabelBaselineDistance
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](self->_secondaryLabel, "font"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v4, "userInterfaceIdiom") == (id)5)
    v5 = 8.0;
  else
    v5 = 20.0;

  objc_msgSend(v3, "_scaledValueForValue:", v5);
  v7 = v6;

  return UIRoundToViewScale(self, v8, v7);
}

- (double)_minPlatformArtworkBottomToBottomDistance
{
  double v3;
  uint64_t v4;

  -[TransitDirectionsInstructionsStepView _secondaryFirstBaselineToBottomPlatformArtworkDistance](self, "_secondaryFirstBaselineToBottomPlatformArtworkDistance");
  return UIRoundToViewScale(self, v4, -v3);
}

- (double)_instructionsLabelToTrailingLayoutGuideDistance
{
  double result;

  UIRoundToViewScale(self, a2, 0.0);
  return result;
}

- (void)_detailButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView expandableCellDelegate](self, "expandableCellDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView expandableItem](self, "expandableItem"));
  objc_msgSend(v5, "transitDirectionsCell:wantsToExpandOrCollapseItem:", self, v4);

}

- (void)_updateNavigationStateDependentFonts
{
  TransitDirectionsInstructionsStepView *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_layoutItemsByType, "setObject:forKeyedSubscript:", 0, &off_101270B10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_layoutItemsByType, "setObject:forKeyedSubscript:", 0, &off_101270B28);
  v3 = self;
  if (-[TransitDirectionsStepView useNavigationMetrics](v3, "useNavigationMetrics"))
  {
    v4 = -[TransitDirectionsStepView navigationState](v3, "navigationState");
    v5 = sub_1002A8AA0(v3);
    if (v4 == (id)4)
    {
      if (v5 != 5)
      {
        v6 = objc_claimAutoreleasedReturnValue(+[UIFont system22Bold](UIFont, "system22Bold"));
        goto LABEL_11;
      }
    }
    else if (v5 != 5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[UIFont system22Semibold](UIFont, "system22Semibold"));
      goto LABEL_11;
    }
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont system22](UIFont, "system22"));
    goto LABEL_11;
  }
  if (sub_1002A8AA0(v3) == 5)
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
LABEL_11:
  v7 = (void *)v6;

  -[_MKUILabel setFont:](v3->_primaryLabel, "setFont:", v7);
  v8 = v3;
  LODWORD(v7) = objc_msgSend(v8, "useNavigationMetrics");
  v9 = sub_1002A8AA0(v8);
  if ((_DWORD)v7 || v9 == 5)
    v10 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v11 = (void *)v10;

  objc_msgSend(v8[43], "setFont:", v11);
  objc_msgSend(v8, "_configureLabelForInstruction:", 0);
  objc_msgSend(v8, "_configureLabelForInstruction:", 1);
}

- (void)_contentSizeCategoryDidChange
{
  NSMutableDictionary *layoutItemsByType;
  MapsLargerHitTargetButton *detailButton;
  TransitDirectionsInstructionsStepView *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  UIFontTextStyle v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsStepView _contentSizeCategoryDidChange](&v39, "_contentSizeCategoryDidChange");
  layoutItemsByType = self->_layoutItemsByType;
  self->_layoutItemsByType = 0;

  detailButton = self->_detailButton;
  v5 = self;
  if (sub_1002A8AA0(v5) == 5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapkit_fontByAddingFeaturesForTimeDisplay"));

  -[MapsLargerHitTargetButton _setFont:](detailButton, "_setFont:", v8);
  v9 = v5;
  if (objc_msgSend(v9, "useNavigationMetrics"))
  {
    v10 = objc_msgSend(v9, "navigationState");
    v11 = sub_1002A8AA0(v9);
    if (v10 == (id)4)
    {
      if (v11 != 5)
      {
        v12 = objc_claimAutoreleasedReturnValue(+[UIFont system22Bold](UIFont, "system22Bold"));
        goto LABEL_14;
      }
    }
    else if (v11 != 5)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[UIFont system22Semibold](UIFont, "system22Semibold"));
      goto LABEL_14;
    }
    v12 = objc_claimAutoreleasedReturnValue(+[UIFont system22](UIFont, "system22"));
    goto LABEL_14;
  }
  if (sub_1002A8AA0(v9) == 5)
    v12 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v12 = objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
LABEL_14:
  v13 = (void *)v12;

  objc_msgSend(v9[42], "setFont:", v13);
  v14 = v9;
  LODWORD(v13) = objc_msgSend(v14, "useNavigationMetrics");
  v15 = v14;
  v16 = sub_1002A8AA0(v15);
  if ((_DWORD)v13 || v16 == 5)
    v17 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v17 = objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v18 = (void *)v17;

  objc_msgSend(v15[43], "setFont:", v18);
  v19 = v15;
  if (sub_1002A8AA0(v19) == 5)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_mapkit_fontByAddingFeaturesForTimeDisplay"));

  objc_msgSend(v19[44], "setFont:", v22);
  v23 = v19;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "traitCollection"));
  v25 = objc_msgSend(v24, "userInterfaceIdiom");
  v26 = UIFontTextStyleBody;
  if (v25 != (id)5)
    v26 = UIFontTextStyleSubheadline;
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", v27));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fontDescriptor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", 1));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v30, 0.0));
  objc_msgSend(v23[46], "setFont:", v31);

  v32 = v23;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleSubheadline));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "traitCollection"));
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if (v35 == (id)5)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fontDescriptor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplay"));

    v38 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v37, 0.0));
    v33 = (void *)v38;
  }

  objc_msgSend(v32[47], "setFont:", v33);
  objc_msgSend(v32, "_updateConstraints");
}

- (void)_updateAccessoryLabelCompressionHuggingPriorities
{
  double v3;
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;

  if (-[TransitDirectionsInstructionsStepView _hasTrailingContent](self, "_hasTrailingContent"))
  {
    -[_MKUILabel _mapkit_contentCompressionResistancePriorityForAxis:](self->_primaryLabel, "_mapkit_contentCompressionResistancePriorityForAxis:", 0);
    v4 = 1000.0;
    if ((float)(*(float *)&v3 + 100.0) <= 1000.0)
    {
      -[_MKUILabel _mapkit_contentCompressionResistancePriorityForAxis:](self->_primaryLabel, "_mapkit_contentCompressionResistancePriorityForAxis:", 0);
      v4 = *(float *)&v3 + 100.0;
    }
    v5 = v4 + -1.0;
  }
  else
  {
    v5 = 999.0;
    v4 = 1000.0;
  }
  *(float *)&v3 = v4;
  -[_MKUILabel _mapkit_setContentCompressionResistancePriority:forAxis:](self->_primaryAccessoryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v3);
  *(float *)&v6 = v4;
  -[_MKUILabel _mapkit_setContentCompressionResistancePriority:forAxis:](self->_secondaryAccessoryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v6);
  *(float *)&v7 = v5;
  -[_MKUILabel _mapkit_setContentHuggingPriority:forAxis:](self->_primaryAccessoryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 0, v7);
  *(float *)&v8 = v5;
  -[_MKUILabel _mapkit_setContentHuggingPriority:forAxis:](self->_secondaryAccessoryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 0, v8);
}

- (void)configureWithItem:(id)a3
{
  id v4;
  NSMutableDictionary *layoutItemsByType;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  TransitArtworkListView **p_badgesArtworkListView;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsIconStepView configureWithItem:](&v20, "configureWithItem:", v4);
  self->_checkedItemIsExpandable = 0;
  layoutItemsByType = self->_layoutItemsByType;
  self->_layoutItemsByType = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_textStackView, "arrangedSubviews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", CFSTR("isHidden")));

  -[TransitDirectionsInstructionsStepView _configureLabelForInstruction:](self, "_configureLabelForInstruction:", 0);
  -[TransitDirectionsInstructionsStepView _configureLabelForInstruction:](self, "_configureLabelForInstruction:", 1);
  -[TransitDirectionsInstructionsStepView _configureLabelForInstruction:](self, "_configureLabelForInstruction:", 2);
  -[TransitDirectionsInstructionsStepView _configureLabelForInstruction:](self, "_configureLabelForInstruction:", 3);
  -[TransitDirectionsInstructionsStepView _configureLabelForInstruction:](self, "_configureLabelForInstruction:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minorStringImage"));
  -[MKArtworkImageView setImageSource:](self->_platformArtworkImageView, "setImageSource:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "minorStringImage"));
  -[MKArtworkImageView setHidden:](self->_platformArtworkImageView, "setHidden:", v11 == 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "badges"));
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "badges"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTransitStepBadge _maps_artworkListFromStepBadges:](GEOTransitStepBadge, "_maps_artworkListFromStepBadges:", v14));
    p_badgesArtworkListView = &self->_badgesArtworkListView;
    -[TransitArtworkListView setArtworkData:](self->_badgesArtworkListView, "setArtworkData:", v15);

  }
  else
  {
    p_badgesArtworkListView = &self->_badgesArtworkListView;
    -[TransitArtworkListView setArtworkData:](self->_badgesArtworkListView, "setArtworkData:", 0);
  }
  -[TransitArtworkListView setHidden:](*p_badgesArtworkListView, "setHidden:", v13 == 0);
  -[TransitDirectionsInstructionsStepView _updateAccessoryLabelCompressionHuggingPriorities](self, "_updateAccessoryLabelCompressionHuggingPriorities");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView expandableItem](self, "expandableItem"));
  if (v17)
    -[TransitDirectionsInstructionsStepView updateExpandCollapseStyling](self, "updateExpandCollapseStyling");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_textStackView, "arrangedSubviews"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKeyPath:", CFSTR("isHidden")));

  if ((objc_msgSend(v19, "isEqualToArray:", v7) & 1) == 0)
    -[TransitDirectionsInstructionsStepView _updateConstraints](self, "_updateConstraints");

}

- (void)_configureLabelForInstruction:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView _layoutItemForInstructionType:](self, "_layoutItemForInstructionType:"));
  v21 = v5;
  switch(a3)
  {
    case 0:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bestFittingMultiPartString"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributedString"));
      -[_MKUILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", v7);

      goto LABEL_13;
    case 1:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "strings"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bestFittingMultiPartString"));
        v11 = 344;
        goto LABEL_7;
      }
      v20 = 344;
      goto LABEL_16;
    case 2:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "strings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

      if (v13)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bestFittingMultiPartString"));
        v11 = 352;
LABEL_7:
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v11), "setMultiPartString:", v10);

        v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
        v15 = 0;
      }
      else
      {
        v20 = 352;
LABEL_16:
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v20), "setText:", 0);
        v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v20);
        v15 = 1;
      }
      objc_msgSend(v14, "setHidden:", v15);
LABEL_18:
      v5 = v21;
LABEL_19:

      return;
    case 3:
      if (-[TransitDirectionsInstructionsStepView _combineAccessoryLabels](self, "_combineAccessoryLabels"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        -[_MKUILabel setTextColor:](self->_primaryAccessoryLabel, "setTextColor:", v16);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bestFittingMultiPartString"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributedString"));
      v19 = 368;
      goto LABEL_12;
    case 4:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bestFittingMultiPartString"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributedString"));
      v19 = 376;
LABEL_12:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v19), "setAttributedText:", v18);

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                        + v19), "attributedText"));
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v19), "setHidden:", objc_msgSend(v6, "length") == 0);
LABEL_13:

      goto LABEL_18;
    default:
      goto LABEL_19;
  }
}

- (id)_layoutItemForInstructionType:(int64_t)a3
{
  double v5;
  double v6;
  NSMutableDictionary *layoutItemsByType;
  void *v8;
  void *v9;
  TransitInstructionLayoutItem *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  TransitInstructionLayoutItem *v22;
  NSMutableDictionary *v23;
  void *v24;

  -[TransitDirectionsInstructionsStepView _availableWidthForInstructionType:](self, "_availableWidthForInstructionType:");
  v6 = v5;
  layoutItemsByType = self->_layoutItemsByType;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](layoutItemsByType, "objectForKeyedSubscript:", v8));

  if (v9)
  {
    objc_msgSend(v9, "setWidth:", v6);
    v10 = v9;
    goto LABEL_16;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView _fontForInstructionType:](self, "_fontForInstructionType:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "formattedStringsForType:", a3));

  if ((unint64_t)(a3 - 3) <= 1
    && -[TransitDirectionsInstructionsStepView _combineAccessoryLabels](self, "_combineAccessoryLabels"))
  {
    v14 = 0;
    if (a3 == 4)
    {
      v18 = 0;
    }
    else
    {
      if (a3 != 3)
        goto LABEL_9;
      v15 = objc_msgSend(v13, "mutableCopy");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "formattedStringsForType:", 4));
      objc_msgSend(v15, "addObjectsFromArray:", v17);

      v18 = objc_msgSend(v15, "copy");
      v14 = 1;
      v13 = v15;
    }

    v13 = v18;
  }
  else
  {
    v14 = 0;
  }
LABEL_9:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView _textAttributesForInstructionType:](self, "_textAttributesForInstructionType:", a3));
  if (v11 && objc_msgSend(v13, "count"))
  {
    if (!self->_layoutItemsByType)
    {
      v20 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 5);
      v21 = self->_layoutItemsByType;
      self->_layoutItemsByType = v20;

    }
    v22 = -[TransitInstructionLayoutItem initWithStrings:font:width:extraTextAttributes:]([TransitInstructionLayoutItem alloc], "initWithStrings:font:width:extraTextAttributes:", v13, v11, v19, v6);
    -[TransitInstructionLayoutItem setCombineStrings:](v22, "setCombineStrings:", v14);
    v23 = self->_layoutItemsByType;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v22, v24);

    v10 = v22;
  }
  else
  {
    v10 = 0;
  }

LABEL_16:
  return v10;
}

- (id)_platformArtworkHorizontalPositioningConstraint
{
  void *v2;
  unint64_t cellStyle;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  cellStyle = self->_cellStyle;
  switch(cellStyle)
  {
    case 2uLL:
      goto LABEL_4;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](self->_platformArtworkImageView, "trailingAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](self->super._iconImageView, "trailingAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
      v8 = v7;
      v9 = CFSTR("platformArtworkTrailingToIconTrailing");
      goto LABEL_6;
    case 0uLL:
LABEL_4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView leadingAnchor](self->_platformArtworkImageView, "leadingAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
      v8 = v7;
      v9 = CFSTR("platformArtworkLeadingToPrimaryLeading");
LABEL_6:
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_withIdentifier:", v9));

      break;
  }
  return v2;
}

- (double)_availableWidthForInstructionType:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;

  -[TransitDirectionsInstructionsStepView bounds](self, "bounds");
  v6 = v5;
  -[TransitDirectionsStepView leadingInstructionMargin](self, "leadingInstructionMargin");
  v8 = v6 - v7;
  -[TransitDirectionsStepView _trailingGuideToContentViewDistance](self, "_trailingGuideToContentViewDistance");
  v10 = v8 - v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView trailingView](self, "trailingView"));
  objc_msgSend(v11, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v13 = v10 - v12;

  switch(a3)
  {
    case 2:
      return v13 + -16.0;
    case 1:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "minorStringImage"));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "minorStringImage"));
        objc_msgSend(v22, "size");
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
        if (objc_msgSend(v25, "userInterfaceIdiom") == (id)5)
          v26 = 6.0;
        else
          v26 = 4.0;

        v13 = v13 - (v24 - v26);
      }
      break;
    case 0:
      v14 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView expandableItem](self, "expandableItem"));
      if (v14)
      {
        v15 = (void *)v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView expandableItem](self, "expandableItem"));
        v17 = objc_msgSend(v16, "shouldDisplayExpandButton");

        if (v17)
        {
          -[TransitDirectionsInstructionsStepView _instructionsLabelToTrailingLayoutGuideDistance](self, "_instructionsLabelToTrailingLayoutGuideDistance");
          return v13 - v18;
        }
      }
      break;
  }
  return v13;
}

- (id)_fontForInstructionType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  switch(a3)
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](self, "primaryLabel"));
      goto LABEL_8;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryLabel](self, "secondaryLabel"));
      goto LABEL_8;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView tertiaryLabel](self, "tertiaryLabel"));
      goto LABEL_8;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
      goto LABEL_8;
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
LABEL_8:
      v5 = v3;
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)_labelViewForInstructionType:(int64_t)a3
{
  int *v3;

  if ((unint64_t)a3 > 4)
    v3 = &OBJC_IVAR___TransitDirectionsInstructionsStepView__tertiaryLabel;
  else
    v3 = off_1011E7E60[a3];
  return *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
}

- (id)_textAttributesForInstructionType:(int64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  int IsAccessibilityContentSizeCategory;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
      return 0;
    if (-[TransitDirectionsStepView useNavigationMetrics](self, "useNavigationMetrics")
      || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "preferredContentSizeCategory")),
          IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(),
          v12,
          v11,
          IsAccessibilityContentSizeCategory))
    {
      v14 = 6;
    }
    else
    {
      v14 = 5;
    }
    v19 = MKServerFormattedStringArtworkSizeAttributeKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14));
    v20 = v8;
    v9 = &v20;
    v10 = &v19;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView traitCollection](self, "traitCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
    v6 = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

    if (v6)
      v7 = 6;
    else
      v7 = 5;
    v17 = MKServerFormattedStringArtworkSizeAttributeKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
    v18 = v8;
    v9 = &v18;
    v10 = &v17;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v10, 1));

  return v16;
}

- (BOOL)_combineAccessoryLabels
{
  uint64_t v3;

  v3 = objc_opt_class(self);
  return v3 == objc_opt_class(TransitDirectionsInstructionsStepView) && sub_1002A8AA0(self) == 5;
}

- (void)setUseNavigationMetrics:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsStepView setUseNavigationMetrics:](&v4, "setUseNavigationMetrics:", a3);
  -[TransitDirectionsInstructionsStepView _setCellStyle:](self, "_setCellStyle:", -[TransitDirectionsInstructionsStepView _bestCellStyleForCurrentState](self, "_bestCellStyleForCurrentState"));
}

- (void)setNavigationState:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v5 = -[TransitDirectionsStepView navigationState](self, "navigationState");
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsStepView setNavigationState:](&v6, "setNavigationState:", a3);
  if (v5 != (void *)-[TransitDirectionsStepView navigationState](self, "navigationState"))
  {
    -[TransitDirectionsInstructionsStepView _updateNavigationStateDependentFonts](self, "_updateNavigationStateDependentFonts");
    -[TransitDirectionsInstructionsStepView _updateMultipleInstructionImagePositionConstraint](self, "_updateMultipleInstructionImagePositionConstraint");
  }
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TransitDirectionsInstructionsStepView;
  -[TransitDirectionsIconStepView _updateNavigationStateAlpha:](&v11, "_updateNavigationStateAlpha:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](self, "primaryLabel"));
  objc_msgSend(v5, "setAlpha:", a3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v6, "setAlpha:", a3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v7, "setAlpha:", a3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
  objc_msgSend(v8, "setAlpha:", a3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](self, "secondaryAccessoryLabel"));
  objc_msgSend(v9, "setAlpha:", a3);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView platformArtworkImageView](self, "platformArtworkImageView"));
  objc_msgSend(v10, "setAlpha:", a3);

}

- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate
{
  return (TransitDirectionsExpandableCellDelegate *)objc_loadWeakRetained((id *)&self->_expandableCellDelegate);
}

- (void)setExpandableCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_expandableCellDelegate, a3);
}

- (unint64_t)cellStyle
{
  return self->_cellStyle;
}

- (_MKUILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (MKMultiPartLabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (MKMultiPartLabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (TransitArtworkListView)badgesArtworkListView
{
  return self->_badgesArtworkListView;
}

- (_MKUILabel)primaryAccessoryLabel
{
  return self->_primaryAccessoryLabel;
}

- (_MKUILabel)secondaryAccessoryLabel
{
  return self->_secondaryAccessoryLabel;
}

- (MKArtworkImageView)platformArtworkImageView
{
  return self->_platformArtworkImageView;
}

- (MapsLargerHitTargetButton)detailButton
{
  return self->_detailButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailButton, 0);
  objc_storeStrong((id *)&self->_platformArtworkImageView, 0);
  objc_storeStrong((id *)&self->_secondaryAccessoryLabel, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryLabel, 0);
  objc_storeStrong((id *)&self->_badgesArtworkListView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_destroyWeak((id *)&self->_expandableCellDelegate);
  objc_storeStrong((id *)&self->_imageViewMultipleInstructionsConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewSingleInstructionConstraint, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_layoutItemsByType, 0);
  objc_destroyWeak((id *)&self->_expandableItem);
  objc_storeStrong((id *)&self->_trailingContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_styleConstraints, 0);
}

@end
