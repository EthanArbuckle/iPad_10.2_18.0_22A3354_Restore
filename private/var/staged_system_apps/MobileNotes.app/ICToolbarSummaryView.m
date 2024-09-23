@implementation ICToolbarSummaryView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_progressIndicatorTracker, 0);
  objc_storeStrong((id *)&self->_syncMessage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong((id *)&self->_lockNowButton, 0);
  objc_storeStrong((id *)&self->_syncStackView, 0);
  objc_storeStrong((id *)&self->_syncActionButton, 0);
  objc_storeStrong((id *)&self->_syncSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_syncTitleLabel, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
}

+ (id)syncActionButtonConfigurationWithTitle:(id)a3 showingAsFooter:(BOOL)a4
{
  id *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (id *)&UIFontTextStyleFootnote;
  if (!a4)
    v6 = (id *)&UIFontTextStyleCaption2;
  v7 = *v6;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
  objc_msgSend(v9, "setTitle:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "buttonTitleTextAttributesTransformerWithTextStyle:", v7));
  objc_msgSend(v9, "setTitleTextAttributesTransformer:", v10);

  objc_msgSend(v9, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
  objc_msgSend(v9, "setButtonSize:", 2);
  return v9;
}

- (UIStackView)syncStackView
{
  UIStackView *syncStackView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIStackView *v8;
  UIStackView *v9;
  _QWORD v11[2];

  syncStackView = self->_syncStackView;
  if (!syncStackView)
  {
    v4 = objc_alloc((Class)UIStackView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncSubtitleLabel](self, "syncSubtitleLabel"));
    v11[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncActionButton](self, "syncActionButton"));
    v11[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    v8 = (UIStackView *)objc_msgSend(v4, "initWithArrangedSubviews:", v7);
    v9 = self->_syncStackView;
    self->_syncStackView = v8;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_syncStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_syncStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](self->_syncStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](self->_syncStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](self->_syncStackView, "setSpacing:", 0.0);
    -[UIStackView setHidden:](self->_syncStackView, "setHidden:", 1);
    syncStackView = self->_syncStackView;
  }
  return syncStackView;
}

+ (id)buttonTitleTextAttributesTransformerWithTextStyle:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D910;
  v6[3] = &unk_1005518F8;
  v7 = a3;
  v3 = v7;
  v4 = objc_retainBlock(v6);

  return v4;
}

- (UIButton)lockNowButton
{
  UIButton *lockNowButton;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  lockNowButton = self->_lockNowButton;
  if (!lockNowButton)
  {
    objc_initWeak(&location, self);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100082F04;
    v16 = &unk_1005518A8;
    objc_copyWeak(&v17, &location);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v13));
    v6 = (void *)objc_opt_class(self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lockNowButtonConfigurationShowingAsFooter:", 0, v13, v14, v15, v16));
    v8 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v7, v4));
    v9 = self->_lockNowButton;
    self->_lockNowButton = v8;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_lockNowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_lockNowButton, "titleLabel"));
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_lockNowButton, "titleLabel"));
    objc_msgSend(v11, "setMaximumContentSizeCategory:", UIContentSizeCategoryMedium);

    -[UIButton setShowsLargeContentViewer:](self->_lockNowButton, "setShowsLargeContentViewer:", 1);
    -[UIButton setHidden:](self->_lockNowButton, "setHidden:", 1);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    lockNowButton = self->_lockNowButton;
  }
  return lockNowButton;
}

- (UIButton)syncActionButton
{
  UIButton *syncActionButton;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *v9;
  double v10;
  void *v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  syncActionButton = self->_syncActionButton;
  if (!syncActionButton)
  {
    objc_initWeak(&location, self);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100082E98;
    v17 = &unk_1005518A8;
    objc_copyWeak(&v18, &location);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v14));
    v6 = (void *)objc_opt_class(self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syncActionButtonConfigurationWithTitle:showingAsFooter:", &stru_1005704B8, 0, v14, v15, v16, v17));
    v8 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v7, v4));
    v9 = self->_syncActionButton;
    self->_syncActionButton = v8;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_syncActionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v10) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](self->_syncActionButton, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_syncActionButton, "titleLabel"));
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_syncActionButton, "titleLabel"));
    objc_msgSend(v12, "setMaximumContentSizeCategory:", UIContentSizeCategoryMedium);

    -[UIButton setShowsLargeContentViewer:](self->_syncActionButton, "setShowsLargeContentViewer:", 1);
    -[UIButton setHidden:](self->_syncActionButton, "setHidden:", 1);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    syncActionButton = self->_syncActionButton;
  }
  return syncActionButton;
}

- (void)updateConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICToolbarSummaryView;
  -[ICToolbarSummaryView updateConstraints](&v15, "updateConstraints");
  -[ICToolbarSummaryView availableWidth](self, "availableWidth");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView widthConstraint](self, "widthConstraint"));
  objc_msgSend(v5, "setConstant:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView widthConstraint](self, "widthConstraint"));
  objc_msgSend(v6, "constant");
  v8 = v7 > 0.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView widthConstraint](self, "widthConstraint"));
  objc_msgSend(v9, "setActive:", v8);

  LODWORD(v8) = -[ICToolbarSummaryView isShowingAsFooter](self, "isShowingAsFooter");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView topConstraint](self, "topConstraint"));
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "setConstant:", 40.0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView bottomConstraint](self, "bottomConstraint"));
    v13 = v12;
    v14 = -40.0;
  }
  else
  {
    objc_msgSend(v10, "setConstant:", 0.0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView bottomConstraint](self, "bottomConstraint"));
    v13 = v12;
    v14 = 0.0;
  }
  objc_msgSend(v12, "setConstant:", v14);

}

+ (id)primaryLabelFontShowingAsFooter:(BOOL)a3
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (id *)&UIFontTextStyleHeadline;
  if (!a3)
    v3 = (id *)&UIFontTextStyleCaption2;
  v4 = *v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryMedium));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_fontWithSingleLineA"));
  return v7;
}

+ (id)lockNowButtonConfigurationShowingAsFooter:(BOOL)a3
{
  _BOOL8 v3;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v5 = (id *)&UIFontTextStyleHeadline;
  if (!a3)
    v5 = (id *)&UIFontTextStyleCaption2;
  v6 = *v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Lock Now"), &stru_1005704B8, 0));
  objc_msgSend(v7, "setTitle:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "buttonTitleTextAttributesTransformerWithTextStyle:", v6));
  objc_msgSend(v7, "setTitleTextAttributesTransformer:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("lock.open.fill")));
  objc_msgSend(v7, "setImage:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "primaryLabelFontShowingAsFooter:", v3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v12, 1));
  objc_msgSend(v7, "setPreferredSymbolConfigurationForImage:", v13);

  objc_msgSend(v7, "setImagePlacement:", 8);
  objc_msgSend(v7, "setImagePadding:", 2.0);
  objc_msgSend(v7, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
  objc_msgSend(v7, "setButtonSize:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Double tap to lock all notes."), &stru_1005704B8, 0));
  objc_msgSend(v7, "setAccessibilityHint:", v15);

  return v7;
}

- (void)update
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
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
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  ICICloudProgressIndicatorTracker *v85;
  void *v86;

  -[ICToolbarSummaryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[ICToolbarSummaryView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
  v4 = objc_msgSend((id)objc_opt_class(self, v3), "primaryLabelFontShowingAsFooter:", -[ICToolbarSummaryView isShowingAsFooter](self, "isShowingAsFooter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
  objc_msgSend(v6, "setFont:", v5);

  if (-[ICToolbarSummaryView isLockNowHidden](self, "isLockNowHidden")
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage")),
        v7,
        v7))
  {
    v8 = -[ICToolbarSummaryView isShowingAsFooter](self, "isShowingAsFooter");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](self, "rootStackView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
    if (v8)
    {
      objc_msgSend(v9, "setCustomSpacing:afterView:", v10, 10.0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summary](self, "summary"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
      objc_msgSend(v12, "setText:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryAccessibilityLabel](self, "summaryAccessibilityLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
      objc_msgSend(v14, "setAccessibilityLabel:", v13);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
      objc_msgSend(v15, "setHidden:", 0);

      v17 = objc_msgSend((id)objc_opt_class(self, v16), "secondaryLabelFontShowingAsFooter:", -[ICToolbarSummaryView isShowingAsFooter](self, "isShowingAsFooter"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncTitleLabel](self, "syncTitleLabel"));
      objc_msgSend(v19, "setFont:", v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncTitleLabel](self, "syncTitleLabel"));
      objc_msgSend(v22, "setText:", v21);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncTitleLabel](self, "syncTitleLabel"));
      v24 = v23;
      v25 = 0;
    }
    else
    {
      objc_msgSend(v9, "setCustomSpacing:afterView:", v10, 0.0);

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "title"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
      objc_msgSend(v42, "setText:", v41);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "title"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
      objc_msgSend(v45, "setAccessibilityLabel:", v44);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncTitleLabel](self, "syncTitleLabel"));
      v24 = v23;
      v25 = 1;
    }
    objc_msgSend(v23, "setHidden:", v25);

    v47 = objc_msgSend((id)objc_opt_class(self, v46), "secondaryLabelFontShowingAsFooter:", -[ICToolbarSummaryView isShowingAsFooter](self, "isShowingAsFooter"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncSubtitleLabel](self, "syncSubtitleLabel"));
    objc_msgSend(v49, "setFont:", v48);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "subTitle"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncSubtitleLabel](self, "syncSubtitleLabel"));
    objc_msgSend(v52, "setText:", v51);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "subTitle"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncSubtitleLabel](self, "syncSubtitleLabel"));
    objc_msgSend(v55, "setAccessibilityLabel:", v54);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "actions"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstObject"));

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncSubtitleLabel](self, "syncSubtitleLabel"));
    v59 = v58;
    if (v39)
    {
      objc_msgSend(v58, "setNumberOfLines:", 1);

      v61 = (void *)objc_opt_class(self, v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "title"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "syncActionButtonConfigurationWithTitle:showingAsFooter:", v62, -[ICToolbarSummaryView isShowingAsFooter](self, "isShowingAsFooter")));
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncActionButton](self, "syncActionButton"));
      objc_msgSend(v64, "setConfiguration:", v63);

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncActionButton](self, "syncActionButton"));
      objc_msgSend(v65, "setHidden:", 0);

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncSubtitleLabel](self, "syncSubtitleLabel"));
      objc_msgSend(v66, "intrinsicContentSize");
      v68 = v67;
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncActionButton](self, "syncActionButton"));
      objc_msgSend(v69, "intrinsicContentSize");
      v71 = v68 + v70;

      -[ICToolbarSummaryView availableWidth](self, "availableWidth");
      if (v71 <= v72 + -42.0)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "subTitle"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ · "), v77));
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncSubtitleLabel](self, "syncSubtitleLabel"));
        objc_msgSend(v79, "setText:", v78);

        v80 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncMessage](self, "syncMessage"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "subTitle"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncSubtitleLabel](self, "syncSubtitleLabel"));
        objc_msgSend(v82, "setAccessibilityLabel:", v81);

        v73 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncStackView](self, "syncStackView"));
        v74 = v73;
        v75 = 0;
      }
      else
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncStackView](self, "syncStackView"));
        v74 = v73;
        v75 = 1;
      }
      objc_msgSend(v73, "setAxis:", v75);
    }
    else
    {
      objc_msgSend(v58, "setNumberOfLines:", 2);

      v74 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncActionButton](self, "syncActionButton"));
      objc_msgSend(v74, "setHidden:", 1);
    }

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncStackView](self, "syncStackView"));
    objc_msgSend(v83, "setHidden:", 0);

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView lockNowButton](self, "lockNowButton"));
    objc_msgSend(v84, "setHidden:", 1);

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](self, "rootStackView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
    objc_msgSend(v26, "setCustomSpacing:afterView:", v27, 0.0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summary](self, "summary"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
    objc_msgSend(v29, "setText:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryAccessibilityLabel](self, "summaryAccessibilityLabel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
    objc_msgSend(v31, "setAccessibilityLabel:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncTitleLabel](self, "syncTitleLabel"));
    objc_msgSend(v32, "setHidden:", 1);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncStackView](self, "syncStackView"));
    objc_msgSend(v33, "setHidden:", 1);

    v35 = objc_msgSend((id)objc_opt_class(self, v34), "lockNowButtonConfigurationShowingAsFooter:", -[ICToolbarSummaryView isShowingAsFooter](self, "isShowingAsFooter"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView lockNowButton](self, "lockNowButton"));
    objc_msgSend(v37, "setConfiguration:", v36);

    v38 = -[ICToolbarSummaryView isLockNowHidden](self, "isLockNowHidden");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView lockNowButton](self, "lockNowButton"));
    objc_msgSend(v39, "setHidden:", v38);
  }

  if (-[ICToolbarSummaryView isSyncActivityVisible](self, "isSyncActivityVisible"))
  {
    v85 = -[ICICloudProgressIndicatorTracker initWithDelegate:]([ICICloudProgressIndicatorTracker alloc], "initWithDelegate:", self);
    -[ICToolbarSummaryView setProgressIndicatorTracker:](self, "setProgressIndicatorTracker:", v85);

    -[ICToolbarSummaryView updateSyncActivityIndicator](self, "updateSyncActivityIndicator");
  }
  else
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView progressIndicatorTracker](self, "progressIndicatorTracker"));
    objc_msgSend(v86, "invalidate");

    -[ICToolbarSummaryView setProgressIndicatorTracker:](self, "setProgressIndicatorTracker:", 0);
  }
}

- (ICToolbarSummaryView)initWithFrame:(CGRect)a3
{
  ICToolbarSummaryView *v3;
  ICToolbarSummaryView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSLayoutConstraint *topConstraint;
  uint64_t v9;
  NSLayoutConstraint *bottomConstraint;
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
  uint64_t v22;
  NSLayoutConstraint *widthConstraint;
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
  objc_super v39;
  _QWORD v40[6];

  v39.receiver = self;
  v39.super_class = (Class)ICToolbarSummaryView;
  v3 = -[ICToolbarSummaryView initWithFrame:](&v39, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_lockNowHidden = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](v3, "rootStackView"));
    -[ICToolbarSummaryView addSubview:](v4, "addSubview:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView activityIndicatorView](v4, "activityIndicatorView"));
    -[ICToolbarSummaryView addSubview:](v4, "addSubview:", v6);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](v4, "rootStackView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView topAnchor](v4, "topAnchor"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v7;

    v40[0] = v7;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](v4, "rootStackView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView bottomAnchor](v4, "bottomAnchor"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v9;

    v40[1] = v9;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](v4, "rootStackView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView leadingAnchor](v4, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v40[2] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](v4, "rootStackView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView trailingAnchor](v4, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
    v40[3] = v25;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](v4->_activityIndicatorView, "centerYAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](v4, "rootStackView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
    v40[4] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](v4->_activityIndicatorView, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](v4, "rootStackView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -10.0));
    v40[5] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView rootStackView](v4, "rootStackView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "widthAnchor"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToConstant:", 0.0));
    widthConstraint = v4->_widthConstraint;
    v4->_widthConstraint = (NSLayoutConstraint *)v22;

  }
  return v4;
}

- (UIStackView)rootStackView
{
  UIStackView *rootStackView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIStackView *v10;
  UIStackView *v11;
  _QWORD v13[4];

  rootStackView = self->_rootStackView;
  if (!rootStackView)
  {
    v4 = objc_alloc((Class)UIStackView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryLabel](self, "summaryLabel"));
    v13[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncTitleLabel](self, "syncTitleLabel"));
    v13[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView syncStackView](self, "syncStackView"));
    v13[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView lockNowButton](self, "lockNowButton"));
    v13[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));
    v10 = (UIStackView *)objc_msgSend(v4, "initWithArrangedSubviews:", v9);
    v11 = self->_rootStackView;
    self->_rootStackView = v10;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_rootStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_rootStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](self->_rootStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](self->_rootStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](self->_rootStackView, "setSpacing:", 0.0);
    rootStackView = self->_rootStackView;
  }
  return rootStackView;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (UILabel)syncTitleLabel
{
  UILabel *syncTitleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  syncTitleLabel = self->_syncTitleLabel;
  if (!syncTitleLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_syncTitleLabel;
    self->_syncTitleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_syncTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_syncTitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](self->_syncTitleLabel, "setMaximumContentSizeCategory:", UIContentSizeCategoryMedium);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_syncTitleLabel, "setTextColor:", v6);

    -[UILabel setShowsLargeContentViewer:](self->_syncTitleLabel, "setShowsLargeContentViewer:", 1);
    -[UILabel setAccessibilityIdentifier:](self->_syncTitleLabel, "setAccessibilityIdentifier:", CFSTR("sync title label"));
    -[UILabel setHidden:](self->_syncTitleLabel, "setHidden:", 1);
    syncTitleLabel = self->_syncTitleLabel;
  }
  return syncTitleLabel;
}

- (UILabel)syncSubtitleLabel
{
  UILabel *syncSubtitleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  syncSubtitleLabel = self->_syncSubtitleLabel;
  if (!syncSubtitleLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_syncSubtitleLabel;
    self->_syncSubtitleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_syncSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_syncSubtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](self->_syncSubtitleLabel, "setMaximumContentSizeCategory:", UIContentSizeCategoryMedium);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_syncSubtitleLabel, "setTextColor:", v6);

    -[UILabel setTextAlignment:](self->_syncSubtitleLabel, "setTextAlignment:", 1);
    -[UILabel setShowsLargeContentViewer:](self->_syncSubtitleLabel, "setShowsLargeContentViewer:", 1);
    -[UILabel setAccessibilityIdentifier:](self->_syncSubtitleLabel, "setAccessibilityIdentifier:", CFSTR("sync subtitle label"));
    syncSubtitleLabel = self->_syncSubtitleLabel;
  }
  return syncSubtitleLabel;
}

- (ICQInAppMessage)syncMessage
{
  return self->_syncMessage;
}

- (NSString)summary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryComponents](self, "summaryComponents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" · ")));

  return (NSString *)v3;
}

- (UILabel)summaryLabel
{
  UILabel *summaryLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  summaryLabel = self->_summaryLabel;
  if (!summaryLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_summaryLabel;
    self->_summaryLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_summaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_summaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](self->_summaryLabel, "setMaximumContentSizeCategory:", UIContentSizeCategoryMedium);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_summaryLabel, "setTextColor:", v6);

    -[UILabel setShowsLargeContentViewer:](self->_summaryLabel, "setShowsLargeContentViewer:", 1);
    -[UILabel setAccessibilityIdentifier:](self->_summaryLabel, "setAccessibilityIdentifier:", CFSTR("note count label"));
    summaryLabel = self->_summaryLabel;
  }
  return summaryLabel;
}

- (NSArray)summaryComponents
{
  id v3;
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

  if (-[ICToolbarSummaryView countsHidden](self, "countsHidden"))
  {
    v3 = &__NSArray0__struct;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (-[ICToolbarSummaryView totalInvitationsCount](self, "totalInvitationsCount"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%lu Invitations"), &stru_1005704B8, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, -[ICToolbarSummaryView totalInvitationsCount](self, "totalInvitationsCount")));

      objc_msgSend(v4, "addObject:", v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%lu Notes"), &stru_1005704B8, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, -[ICToolbarSummaryView totalNoteCount](self, "totalNoteCount")));

    objc_msgSend(v4, "addObject:", v10);
    if (-[ICToolbarSummaryView totalFolderCount](self, "totalFolderCount"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%lu Folders"), &stru_1005704B8, 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, -[ICToolbarSummaryView totalFolderCount](self, "totalFolderCount")));

      objc_msgSend(v4, "addObject:", v13);
    }
    v3 = objc_msgSend(v4, "copy");

  }
  return (NSArray *)v3;
}

- (NSString)summaryAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView summaryComponents](self, "summaryComponents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", ")));

  return (NSString *)v3;
}

- (void)setSyncMessage:(id)a3
{
  objc_storeStrong((id *)&self->_syncMessage, a3);
}

- (void)setProgressIndicatorTracker:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorTracker, a3);
}

- (void)setCountsHidden:(BOOL)a3
{
  self->_countsHidden = a3;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

- (ICProgressIndicatorTracker)progressIndicatorTracker
{
  return self->_progressIndicatorTracker;
}

- (BOOL)isSyncActivityVisible
{
  return self->_syncActivityVisible;
}

- (BOOL)isShowingAsFooter
{
  return self->_showingAsFooter;
}

- (BOOL)isLockNowHidden
{
  return self->_lockNowHidden;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView progressIndicatorTracker](self, "progressIndicatorTracker"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)ICToolbarSummaryView;
  -[ICToolbarSummaryView dealloc](&v4, "dealloc");
}

- (BOOL)countsHidden
{
  return self->_countsHidden;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  UIActivityIndicatorView *activityIndicatorView;
  uint64_t v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;

  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
      v4 = 3;
    else
      v4 = 100;
    v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", v4);
    v6 = self->_activityIndicatorView;
    self->_activityIndicatorView = v5;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICToolbarSummaryView addSubview:](self, "addSubview:", self->_activityIndicatorView);
    activityIndicatorView = self->_activityIndicatorView;
  }
  return activityIndicatorView;
}

+ (id)secondaryLabelFontShowingAsFooter:(BOOL)a3
{
  const UIFontTextStyle *v3;
  void *v4;
  void *v5;

  v3 = &UIFontTextStyleFootnote;
  if (!a3)
    v3 = &UIFontTextStyleCaption2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", *v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_fontWithSingleLineA"));

  return v5;
}

- (void)updateSyncActivityIndicator
{
  void *v3;
  unsigned int v4;
  id v5;

  if (-[ICToolbarSummaryView isSyncActivityVisible](self, "isSyncActivityVisible")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView progressIndicatorTracker](self, "progressIndicatorTracker")),
        v4 = objc_msgSend(v3, "progressIndicatorShouldAnimate"),
        v3,
        v4))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView activityIndicatorView](self, "activityIndicatorView"));
    objc_msgSend(v5, "startAnimating");
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView activityIndicatorView](self, "activityIndicatorView"));
    objc_msgSend(v5, "stopAnimating");
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  _QWORD v5[6];
  _QWORD v6[3];
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100083110;
  v12 = sub_100083120;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100083128;
  v5[3] = &unk_1005522F8;
  v5[4] = &v8;
  v5[5] = v6;
  -[ICToolbarSummaryView enumerateAccessibleSubviewsWithBlock:](self, "enumerateAccessibleSubviewsWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9[5], "componentsJoinedByString:", CFSTR(", ")));
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView buttonElement](self, "buttonElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityHint"));

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView buttonElement](self, "buttonElement"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICToolbarSummaryView;
    -[ICToolbarSummaryView accessibilityActivationPoint](&v11, "accessibilityActivationPoint");
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)buttonElement
{
  id v2;
  _QWORD v4[6];
  _QWORD v5[3];
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100083110;
  v11 = sub_100083120;
  v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100083328;
  v4[3] = &unk_1005522F8;
  v4[4] = &v7;
  v4[5] = v5;
  -[ICToolbarSummaryView enumerateAccessibleSubviewsWithBlock:](self, "enumerateAccessibleSubviewsWithBlock:", v4);
  v2 = (id)v8[5];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);

  return v2;
}

- (void)enumerateAccessibleSubviewsWithBlock:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = (uint64_t (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICToolbarSummaryView _accessibleSubviews](self, "_accessibleSubviews"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9)) & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (ICToolbarSummaryViewDelegate)delegate
{
  return (ICToolbarSummaryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)totalFolderCount
{
  return self->_totalFolderCount;
}

- (void)setTotalFolderCount:(unint64_t)a3
{
  self->_totalFolderCount = a3;
}

- (unint64_t)totalNoteCount
{
  return self->_totalNoteCount;
}

- (void)setTotalNoteCount:(unint64_t)a3
{
  self->_totalNoteCount = a3;
}

- (unint64_t)totalInvitationsCount
{
  return self->_totalInvitationsCount;
}

- (void)setTotalInvitationsCount:(unint64_t)a3
{
  self->_totalInvitationsCount = a3;
}

- (void)setLockNowHidden:(BOOL)a3
{
  self->_lockNowHidden = a3;
}

- (void)setSyncActivityVisible:(BOOL)a3
{
  self->_syncActivityVisible = a3;
}

- (void)setShowingAsFooter:(BOOL)a3
{
  self->_showingAsFooter = a3;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

@end
