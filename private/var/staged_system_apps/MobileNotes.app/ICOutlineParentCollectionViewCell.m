@implementation ICOutlineParentCollectionViewCell

- (void)updateAccessories
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell folderListSectionIdentifier](self, "folderListSectionIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell activityIndicatorView](self, "activityIndicatorView"));
    v6 = objc_msgSend(v5, "isAnimating");

    if (v6)
    {
      v7 = objc_alloc((Class)UICellAccessoryCustomView);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell activityIndicatorView](self, "activityIndicatorView"));
      v9 = objc_msgSend(v7, "initWithCustomView:placement:", v8, 1);

      objc_msgSend(v9, "setDisplayedState:", 2);
      objc_msgSend(v3, "addObject:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell upgradeButtonTapHandler](self, "upgradeButtonTapHandler"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
      objc_msgSend(v11, "setButtonSize:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Upgrade"), &stru_1005704B8, 0));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredSingleLineAFontForTextStyle:](UIFont, "ic_preferredSingleLineAFontForTextStyle:", UIFontTextStyleBody));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString ic_attributedStringWithString:font:](NSAttributedString, "ic_attributedStringWithString:font:", v13, v14));
      objc_msgSend(v11, "setAttributedTitle:", v15);

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10006620C;
      v23[3] = &unk_1005518D0;
      v23[4] = self;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v23));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v11, v16));

      objc_msgSend(v11, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
      v18 = objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", v17, 1);
      objc_msgSend(v18, "setDisplayedState:", 2);
      objc_msgSend(v3, "addObject:", v18);

    }
  }
  if (-[ICOutlineParentCollectionViewCell displayDisclosure](self, "displayDisclosure"))
  {
    v19 = objc_alloc_init((Class)UICellAccessoryOutlineDisclosure);
    objc_msgSend(v19, "setDisplayedState:", 0);
    objc_msgSend(v19, "setStyle:", 1);
    objc_msgSend(v3, "addObject:", v19);

  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000159E0;
  v21[3] = &unk_10054FE80;
  v21[4] = self;
  v22 = v3;
  v20 = v3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);

}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
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
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[2];
  _QWORD v106[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
  -[ICOutlineParentCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell headerContentConfiguration](self, "headerContentConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedConfigurationForState:", v4));

  v8 = ICAccessibilityAccessibilityLargerTextSizesEnabled() ^ 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
  objc_msgSend(v9, "setNumberOfLines:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell folderListSectionIdentifier](self, "folderListSectionIdentifier"));
  if (v10)
  {
    if (-[ICOutlineParentCollectionViewCell displayGenericTitle](self, "displayGenericTitle"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Folders"), &stru_1005704B8, 0));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell folderListSectionIdentifier](self, "folderListSectionIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    }
    v13 = (void *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "font"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_fontWithSingleLineA"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    objc_msgSend(v17, "setFont:", v16);

    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell noteSectionIdentifier](self, "noteSectionIdentifier"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell noteSectionIdentifier](self, "noteSectionIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
LABEL_8:

  }
  objc_msgSend(v7, "setText:", v13);
  -[ICOutlineParentCollectionViewCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v13);
  if (-[ICOutlineParentCollectionViewCell shouldDisplayTagSelectionOperator](self, "shouldDisplayTagSelectionOperator"))
  {
    v18 = objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagSelection](self, "tagSelection"));
    if (v18)
    {
      v19 = (void *)v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagSelection](self, "tagSelection"));
      if ((unint64_t)objc_msgSend(v20, "selectedTagCount") <= 1)
      {

      }
      else
      {
        v21 = objc_msgSend(v4, "isEditing");

        if ((v21 & 1) == 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagSelection](self, "tagSelection"));
          v23 = objc_msgSend(v22, "tagOperator") == (id)2;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagAnyAction](self, "tagAnyAction"));
          objc_msgSend(v24, "setState:", v23);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagSelection](self, "tagSelection"));
          v26 = objc_msgSend(v25, "tagOperator") == (id)1;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagAllAction](self, "tagAllAction"));
          objc_msgSend(v27, "setState:", v26);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell listContentView](self, "listContentView"));
          if (!v28)
          {
            v29 = objc_alloc((Class)UIListContentView);
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell defaultContentConfiguration](self, "defaultContentConfiguration"));
            v31 = objc_msgSend(v29, "initWithConfiguration:", v30);
            -[ICOutlineParentCollectionViewCell setListContentView:](self, "setListContentView:", v31);

            v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell listContentView](self, "listContentView"));
            objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

            v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell listContentView](self, "listContentView"));
            LODWORD(v34) = 1148846080;
            objc_msgSend(v33, "setContentHuggingPriority:forAxis:", 0, v34);

            v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell listContentView](self, "listContentView"));
            LODWORD(v36) = 1148846080;
            objc_msgSend(v35, "setContentCompressionResistancePriority:forAxis:", 0, v36);

          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));

          if (!v37)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
            objc_msgSend(v39, "setBaseForegroundColor:", v40);

            objc_msgSend(v39, "contentInsets");
            objc_msgSend(v39, "setContentInsets:");
            v103[0] = _NSConcreteStackBlock;
            v103[1] = 3221225472;
            v103[2] = sub_100066314;
            v103[3] = &unk_1005518F8;
            v104 = v38;
            v41 = v38;
            objc_msgSend(v39, "setTitleTextAttributesTransformer:", v103);
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v39, 0));
            -[ICOutlineParentCollectionViewCell setTagOperatorButton:](self, "setTagOperatorButton:", v42);

            v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
            objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

            v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
            objc_msgSend(v44, "setShowsMenuAsPrimaryAction:", 1);

            v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
            objc_msgSend(v45, "setChangesSelectionAsPrimaryAction:", 1);

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
            objc_msgSend(v46, "setContentHorizontalAlignment:", 5);

            v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
            LODWORD(v48) = 1148846080;
            objc_msgSend(v47, "setContentHuggingPriority:forAxis:", 0, v48);

            v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
            LODWORD(v50) = 1148846080;
            objc_msgSend(v49, "setContentCompressionResistancePriority:forAxis:", 0, v50);

          }
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell horizontalStackView](self, "horizontalStackView"));

          if (!v51)
          {
            v52 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
            LODWORD(v53) = 1132068864;
            objc_msgSend(v52, "setContentHuggingPriority:forAxis:", 0, v53);
            LODWORD(v54) = 1132068864;
            objc_msgSend(v52, "setContentCompressionResistancePriority:forAxis:", 0, v54);
            v55 = objc_alloc((Class)UIStackView);
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell listContentView](self, "listContentView"));
            v106[0] = v56;
            v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
            v106[1] = v57;
            v106[2] = v52;
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v106, 3));
            v59 = objc_msgSend(v55, "initWithArrangedSubviews:", v58);
            -[ICOutlineParentCollectionViewCell setHorizontalStackView:](self, "setHorizontalStackView:", v59);

            v60 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell horizontalStackView](self, "horizontalStackView"));
            objc_msgSend(v60, "setAxis:", 0);

            v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell horizontalStackView](self, "horizontalStackView"));
            objc_msgSend(v61, "setSpacing:", 0.0);

            v62 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell horizontalStackView](self, "horizontalStackView"));
            objc_msgSend(v62, "setAlignment:", 3);

            v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "heightAnchor"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToConstant:", 26.0));
            objc_msgSend(v65, "setActive:", 1);

            v66 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell contentView](self, "contentView"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell horizontalStackView](self, "horizontalStackView"));
            objc_msgSend(v66, "addSubview:", v67);

            v68 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell horizontalStackView](self, "horizontalStackView"));
            objc_msgSend(v68, "ic_addAnchorsToFillSuperview");

          }
          objc_msgSend(v7, "directionalLayoutMargins");
          v70 = v69;
          v72 = v71;
          v74 = v73;
          -[ICOutlineParentCollectionViewCell horizontalInsetsOverride](self, "horizontalInsetsOverride");
          if (v75 != 2.22507386e-308)
          {
            -[ICOutlineParentCollectionViewCell horizontalInsetsOverride](self, "horizontalInsetsOverride");
            v72 = v76;
          }
          -[ICOutlineParentCollectionViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
          v78 = v77 + -8.0;
          v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
          objc_msgSend(v80, "setColor:", v79);

          objc_msgSend(v7, "setDirectionalLayoutMargins:", v70, v72, v74, v78);
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell listContentView](self, "listContentView"));
          objc_msgSend(v81, "setConfiguration:", v7);

          v82 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagAllAction](self, "tagAllAction"));
          v105[0] = v82;
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagAnyAction](self, "tagAnyAction"));
          v105[1] = v83;
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v105, 2));
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v84));
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
          objc_msgSend(v86, "setMenu:", v85);

          goto LABEL_28;
        }
      }
    }
  }
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell horizontalStackView](self, "horizontalStackView"));
  objc_msgSend(v87, "removeFromSuperview");

  -[ICOutlineParentCollectionViewCell setHorizontalStackView:](self, "setHorizontalStackView:", 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
  objc_msgSend(v88, "removeFromSuperview");

  -[ICOutlineParentCollectionViewCell setTagOperatorButton:](self, "setTagOperatorButton:", 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell listContentView](self, "listContentView"));
  objc_msgSend(v89, "removeFromSuperview");

  -[ICOutlineParentCollectionViewCell setListContentView:](self, "setListContentView:", 0);
  if (-[ICOutlineParentCollectionViewCell styleForCalculator](self, "styleForCalculator"))
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    objc_msgSend(v91, "setColor:", v90);

    v92 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    objc_msgSend(v93, "setFont:", v92);

    -[ICOutlineParentCollectionViewCell setHorizontalInsetsOverride:](self, "setHorizontalInsetsOverride:", 28.0);
  }
  -[ICOutlineParentCollectionViewCell horizontalInsetsOverride](self, "horizontalInsetsOverride");
  if (v94 != 2.22507386e-308)
  {
    objc_msgSend(v7, "directionalLayoutMargins");
    v96 = v95;
    v98 = v97;
    -[ICOutlineParentCollectionViewCell horizontalInsetsOverride](self, "horizontalInsetsOverride");
    v100 = v99;
    -[ICOutlineParentCollectionViewCell horizontalInsetsOverride](self, "horizontalInsetsOverride");
    v102 = v101;
    objc_msgSend(v7, "setAxesPreservingSuperviewLayoutMargins:", 2);
    objc_msgSend(v7, "setDirectionalLayoutMargins:", v96, v100, v98, v102);
  }
  -[ICOutlineParentCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v7);
LABEL_28:

}

- (BOOL)usesSidebarHeaderConfiguration
{
  return self->_usesSidebarHeaderConfiguration;
}

- (id)upgradeButtonTapHandler
{
  return self->_upgradeButtonTapHandler;
}

- (void)updateSyncActivityIndicator
{
  void *v3;
  unsigned int v4;
  void *v5;

  if (-[ICOutlineParentCollectionViewCell isSyncActivityVisible](self, "isSyncActivityVisible")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell progressIndicatorTracker](self, "progressIndicatorTracker")),
        v4 = objc_msgSend(v3, "progressIndicatorShouldAnimate"),
        v3,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell activityIndicatorView](self, "activityIndicatorView"));
    objc_msgSend(v5, "startAnimating");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell activityIndicatorView](self, "activityIndicatorView"));
    objc_msgSend(v5, "stopAnimating");
  }

  -[ICOutlineParentCollectionViewCell updateAccessories](self, "updateAccessories");
}

- (UIButton)tagOperatorButton
{
  return self->_tagOperatorButton;
}

- (BOOL)shouldDisplayTagSelectionOperator
{
  return self->_shouldDisplayTagSelectionOperator;
}

- (void)setUsesSidebarHeaderConfiguration:(BOOL)a3
{
  self->_usesSidebarHeaderConfiguration = a3;
}

- (void)setUpgradeButtonTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setTagSelectionDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setTagSelection:(id)a3
{
  objc_storeStrong((id *)&self->_tagSelection, a3);
  -[ICOutlineParentCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setTagOperatorButton:(id)a3
{
  objc_storeStrong((id *)&self->_tagOperatorButton, a3);
}

- (void)setShouldDisplayTagSelectionOperator:(BOOL)a3
{
  self->_shouldDisplayTagSelectionOperator = a3;
}

- (void)setListContentView:(id)a3
{
  objc_storeStrong((id *)&self->_listContentView, a3);
}

- (void)setIsSyncActivityVisible:(BOOL)a3
{
  self->_isSyncActivityVisible = a3;
}

- (void)setHorizontalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStackView, a3);
}

- (void)setFolderListSectionIdentifier:(id)a3
{
  ICNoteSectionIdentifier *noteSectionIdentifier;
  void *v6;
  id v7;
  uint64_t v8;
  ICICloudProgressIndicatorTracker *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_folderListSectionIdentifier, a3);
  if (v10)
  {
    noteSectionIdentifier = self->_noteSectionIdentifier;
    self->_noteSectionIdentifier = 0;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell activityIndicatorView](self, "activityIndicatorView"));

  if (!v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    -[ICOutlineParentCollectionViewCell setActivityIndicatorView:](self, "setActivityIndicatorView:", v7);

  }
  if (objc_msgSend(v10, "sectionType") == (id)2 || objc_msgSend(v10, "sectionType") == (id)3)
    v8 = -[ICOutlineParentCollectionViewCell displayGenericTitle](self, "displayGenericTitle") ^ 1;
  else
    v8 = 0;
  -[ICOutlineParentCollectionViewCell setIsSyncActivityVisible:](self, "setIsSyncActivityVisible:", v8);
  if (-[ICOutlineParentCollectionViewCell isSyncActivityVisible](self, "isSyncActivityVisible"))
  {
    v9 = -[ICICloudProgressIndicatorTracker initWithDelegate:]([ICICloudProgressIndicatorTracker alloc], "initWithDelegate:", self);
    -[ICOutlineParentCollectionViewCell setProgressIndicatorTracker:](self, "setProgressIndicatorTracker:", v9);

  }
  -[ICOutlineParentCollectionViewCell updateAccessories](self, "updateAccessories");
  -[ICOutlineParentCollectionViewCell updateSyncActivityIndicator](self, "updateSyncActivityIndicator");
  -[ICOutlineParentCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

}

- (void)setEditing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICOutlineParentCollectionViewCell;
  -[ICOutlineParentCollectionViewCell setEditing:](&v4, "setEditing:", a3);
  -[ICOutlineParentCollectionViewCell updateAccessories](self, "updateAccessories");
}

- (void)setDisplayGenericTitle:(BOOL)a3
{
  self->_displayGenericTitle = a3;
}

- (void)setDisplayDisclosure:(BOOL)a3
{
  self->_displayDisclosure = a3;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (BOOL)isSyncActivityVisible
{
  return self->_isSyncActivityVisible;
}

- (ICOutlineParentCollectionViewCell)initWithFrame:(CGRect)a3
{
  ICOutlineParentCollectionViewCell *v3;
  ICOutlineParentCollectionViewCell *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIAction *tagAnyAction;
  void *v9;
  void *v10;
  uint64_t v11;
  UIAction *tagAllAction;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICOutlineParentCollectionViewCell;
  v3 = -[ICOutlineParentCollectionViewCell initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_displayGenericTitle = 0;
    v3->_displayDisclosure = 1;
    v3->_shouldDisplayTagSelectionOperator = 0;
    v3->_horizontalInsetsOverride = 2.22507386e-308;
    objc_initWeak(&location, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Any Selected"), &stru_1005704B8, 0));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100065FC4;
    v16[3] = &unk_1005518A8;
    objc_copyWeak(&v17, &location);
    v7 = objc_claimAutoreleasedReturnValue(+[UIAction ic_actionWithTitle:handler:](UIAction, "ic_actionWithTitle:handler:", v6, v16));
    tagAnyAction = v4->_tagAnyAction;
    v4->_tagAnyAction = (UIAction *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("All Selected"), &stru_1005704B8, 0));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006608C;
    v14[3] = &unk_1005518A8;
    objc_copyWeak(&v15, &location);
    v11 = objc_claimAutoreleasedReturnValue(+[UIAction ic_actionWithTitle:handler:](UIAction, "ic_actionWithTitle:handler:", v10, v14));
    tagAllAction = v4->_tagAllAction;
    v4->_tagAllAction = (UIAction *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v4;
}

- (UIStackView)horizontalStackView
{
  return self->_horizontalStackView;
}

- (double)horizontalInsetsOverride
{
  return self->_horizontalInsetsOverride;
}

- (id)headerContentConfiguration
{
  void *v2;

  if (-[ICOutlineParentCollectionViewCell usesSidebarHeaderConfiguration](self, "usesSidebarHeaderConfiguration"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration headerConfiguration](UIListContentConfiguration, "headerConfiguration"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "prominentInsetGroupedHeaderConfiguration"));
  return v2;
}

- (ICFolderListSectionIdentifier)folderListSectionIdentifier
{
  return self->_folderListSectionIdentifier;
}

- (BOOL)displayGenericTitle
{
  return self->_displayGenericTitle;
}

- (BOOL)displayDisclosure
{
  return self->_displayDisclosure;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICOutlineParentCollectionViewCell;
  -[ICOutlineParentCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell progressIndicatorTracker](self, "progressIndicatorTracker"));
  objc_msgSend(v3, "invalidate");

  -[ICOutlineParentCollectionViewCell setProgressIndicatorTracker:](self, "setProgressIndicatorTracker:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell progressIndicatorTracker](self, "progressIndicatorTracker"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)ICOutlineParentCollectionViewCell;
  -[ICOutlineParentCollectionViewCell dealloc](&v4, "dealloc");
}

- (void)setNoteSectionIdentifier:(id)a3
{
  ICFolderListSectionIdentifier *folderListSectionIdentifier;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_noteSectionIdentifier, a3);
  if (v6)
  {
    folderListSectionIdentifier = self->_folderListSectionIdentifier;
    self->_folderListSectionIdentifier = 0;

  }
  -[ICOutlineParentCollectionViewCell updateAccessories](self, "updateAccessories");
  -[ICOutlineParentCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICOutlineParentCollectionViewCell;
  return UIAccessibilityTraitHeader | -[ICOutlineParentCollectionViewCell accessibilityTraits](&v3, "accessibilityTraits");
}

- (id)accessibilityDragSourceDescriptors
{
  return 0;
}

- (id)accessibilityDropPointDescriptors
{
  return 0;
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));
  v3 = v2 != 0;

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICOutlineParentCollectionViewCell tagOperatorButton](self, "tagOperatorButton"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Double tap to modify selection"), &stru_1005704B8, 0));

    return v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICOutlineParentCollectionViewCell;
    v7 = -[ICOutlineParentCollectionViewCell accessibilityHint](&v8, "accessibilityHint");
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }
}

- (ICNoteSectionIdentifier)noteSectionIdentifier
{
  return self->_noteSectionIdentifier;
}

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (id)tagSelectionDidChange
{
  return self->_tagSelectionDidChange;
}

- (BOOL)styleForCalculator
{
  return self->_styleForCalculator;
}

- (void)setStyleForCalculator:(BOOL)a3
{
  self->_styleForCalculator = a3;
}

- (void)setHorizontalInsetsOverride:(double)a3
{
  self->_horizontalInsetsOverride = a3;
}

- (ICProgressIndicatorTracker)progressIndicatorTracker
{
  return self->_progressIndicatorTracker;
}

- (void)setProgressIndicatorTracker:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorTracker, a3);
}

- (UIAction)tagAnyAction
{
  return self->_tagAnyAction;
}

- (void)setTagAnyAction:(id)a3
{
  objc_storeStrong((id *)&self->_tagAnyAction, a3);
}

- (UIAction)tagAllAction
{
  return self->_tagAllAction;
}

- (void)setTagAllAction:(id)a3
{
  objc_storeStrong((id *)&self->_tagAllAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagAllAction, 0);
  objc_storeStrong((id *)&self->_tagAnyAction, 0);
  objc_storeStrong((id *)&self->_tagOperatorButton, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_horizontalStackView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorTracker, 0);
  objc_storeStrong(&self->_upgradeButtonTapHandler, 0);
  objc_storeStrong(&self->_tagSelectionDidChange, 0);
  objc_storeStrong((id *)&self->_tagSelection, 0);
  objc_storeStrong((id *)&self->_noteSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifier, 0);
}

@end
