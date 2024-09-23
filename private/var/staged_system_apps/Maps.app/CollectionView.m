@implementation CollectionView

- (CollectionView)initWithCollectionViewSize:(unint64_t)a3
{
  CollectionView *v4;
  uint64_t v5;
  CollectionView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CollectionView;
  v4 = -[CollectionView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v4;
  if (v4)
  {
    v4->_collectionViewSize = a3;
    if (a3 == 1 && _MKPlaceCardUseSmallerFont(v4, v5))
      v6->_collectionViewSize = 0;
    v6->_allowAccessibilityTextWrapping = 1;
    -[CollectionView commonInit](v6, "commonInit");
  }
  return v6;
}

- (CollectionView)initWithFrame:(CGRect)a3
{
  CollectionView *v3;
  CollectionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CollectionView;
  v3 = -[CollectionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_collectionViewSize = 0;
    -[CollectionView commonInit](v3, "commonInit");
  }
  return v4;
}

- (void)commonInit
{
  CollectionImageView *v3;
  double y;
  double width;
  double height;
  CollectionImageView *v7;
  CollectionImageView *imageView;
  id v9;
  UIImageView *v10;
  UIImageView *badgeImageView;
  UIImageView *v12;
  UILayoutGuide *v13;
  UILayoutGuide *textContainerLayoutGuide;
  UILayoutGuide *v15;
  UIImageView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIImageView *imageCheckmarkView;
  UIImageView *v22;
  UITextField *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UITextField *titleTextField;
  UITextField *v29;
  UILabel *v30;
  void *v31;
  void *v32;
  double v33;
  UILabel *titleLabel;
  UILabel *v35;
  UILabel *v36;
  void *v37;
  void *v38;
  double v39;
  UILabel *subtitleLabel;
  UILabel *v41;
  MapsThemeLabel *v42;
  void *v43;
  MapsThemeLabel *newCollectionLabel;
  CollectionImageView *v45;

  -[CollectionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CollectionView"));
  v3 = [CollectionImageView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[CollectionImageView initWithFrame:makeCornersRounded:](v3, "initWithFrame:makeCornersRounded:", 1, CGRectZero.origin.x, y, width, height);
  -[CollectionImageView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CollectionImageView setDelegate:](v7, "setDelegate:", self);
  -[CollectionImageView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  -[CollectionView addSubview:](self, "addSubview:", v7);
  imageView = self->_imageView;
  self->_imageView = v7;
  v45 = v7;

  v9 = objc_alloc((Class)UIImageView);
  -[CollectionView bounds](self, "bounds");
  v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:");
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setClipsToBounds:](v10, "setClipsToBounds:", 1);
  -[UIImageView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:", 5.0);
  -[UIImageView setHidden:](v10, "setHidden:", 1);
  -[UIImageView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("CollectionBadgeImage"));
  -[CollectionView addSubview:](self, "addSubview:", v10);
  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = v10;
  v12 = v10;

  v13 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  -[CollectionView addLayoutGuide:](self, "addLayoutGuide:", v13);
  textContainerLayoutGuide = self->_textContainerLayoutGuide;
  self->_textContainerLayoutGuide = v13;
  v15 = v13;

  v16 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](v16, "setContentMode:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
  -[UIImageView setImage:](v16, "setImage:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 7, 17.0));
  -[UIImageView setPreferredSymbolConfiguration:](v16, "setPreferredSymbolConfiguration:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView theme](self, "theme"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "keyColor"));
  -[UIImageView setTintColor:](v16, "setTintColor:", v20);

  -[UIImageView setHidden:](v16, "setHidden:", 1);
  -[UIImageView setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", CFSTR("CollectionImage"));
  -[CollectionView addSubview:](self, "addSubview:", v16);
  imageCheckmarkView = self->_imageCheckmarkView;
  self->_imageCheckmarkView = v16;
  v22 = v16;

  v23 = (UITextField *)objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UITextField setDelegate:](v23, "setDelegate:", self);
  -[UITextField setReturnKeyType:](v23, "setReturnKeyType:", 9);
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITextField setBackgroundColor:](v23, "setBackgroundColor:", v24);

  -[UITextField setUserInteractionEnabled:](v23, "setUserInteractionEnabled:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Collection] Collection Name placeholder"), CFSTR("localized string not found"), 0));
  -[UITextField setPlaceholder:](v23, "setPlaceholder:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UITextField setTextColor:](v23, "setTextColor:", v27);

  -[UITextField setEnabled:](v23, "setEnabled:", 0);
  -[UITextField setAccessibilityIdentifier:](v23, "setAccessibilityIdentifier:", CFSTR("CollectionTitleTextField"));
  -[UITextField setTextAlignment:](v23, "setTextAlignment:", 2* (-[CollectionView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1));
  -[CollectionView addSubview:](self, "addSubview:", v23);
  titleTextField = self->_titleTextField;
  self->_titleTextField = v23;
  v29 = v23;

  v30 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v30, "setBackgroundColor:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](v30, "setTextColor:", v32);

  LODWORD(v33) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](v30, "setContentHuggingPriority:forAxis:", 1, v33);
  -[UILabel setAccessibilityIdentifier:](v30, "setAccessibilityIdentifier:", CFSTR("CollectionTitleLabel"));
  -[CollectionView addSubview:](self, "addSubview:", v30);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v30;
  v35 = v30;

  v36 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v36, "setBackgroundColor:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v36, "setTextColor:", v38);

  LODWORD(v39) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](v36, "setContentHuggingPriority:forAxis:", 1, v39);
  -[UILabel setAccessibilityIdentifier:](v36, "setAccessibilityIdentifier:", CFSTR("CollectionSubtitleLabel"));
  -[CollectionView addSubview:](self, "addSubview:", v36);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v36;
  v41 = v36;

  v42 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MapsThemeLabel setBackgroundColor:](v42, "setBackgroundColor:", v43);

  -[MapsThemeLabel setTextColorProvider:](v42, "setTextColorProvider:", &stru_1011BE7C0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v42, "setAccessibilityIdentifier:", CFSTR("CollectionNewCollectionLabel"));
  -[CollectionView addSubview:](self, "addSubview:", v42);
  newCollectionLabel = self->_newCollectionLabel;
  self->_newCollectionLabel = v42;

  -[CollectionView _updateFonts](self, "_updateFonts");
  -[CollectionView _updateNumberOfLines](self, "_updateNumberOfLines");
  -[CollectionView _updateConstraints](self, "_updateConstraints");
  -[CollectionView _updateContent](self, "_updateContent");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CollectionView;
  v4 = a3;
  -[MapsThemeView traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory", v11.receiver, v11.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView maxContentSizeCategory](self, "maxContentSizeCategory"));
  v7 = sub_1002A8844(v5, 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveContentSizeCategory](self, "_effectiveContentSizeCategory"));
  v10 = sub_1002A8950(v9, v8);

  if (v10)
    -[CollectionView _effectiveContentSizeCategoryDidChange:](self, "_effectiveContentSizeCategoryDidChange:", v8);

}

- (BOOL)becomeFirstResponder
{
  return -[UITextField becomeFirstResponder](self->_titleTextField, "becomeFirstResponder");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_titleObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_titleObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)CollectionView;
  -[CollectionView dealloc](&v4, "dealloc");
}

- (double)_imageWidth
{
  unsigned __int8 v3;
  double result;
  unint64_t collectionViewSize;

  v3 = -[CollectionView _shouldWrapText](self, "_shouldWrapText");
  result = 30.0;
  if ((v3 & 1) == 0)
  {
    collectionViewSize = self->_collectionViewSize;
    result = 72.0;
    if (collectionViewSize != 1)
      result = 0.0;
    if (!collectionViewSize)
      return 50.0;
  }
  return result;
}

- (double)_verticalMargin
{
  unint64_t collectionViewSize;
  double result;

  collectionViewSize = self->_collectionViewSize;
  result = 0.0;
  if (collectionViewSize == 1)
    result = 12.0;
  if (!collectionViewSize)
    return 16.0;
  return result;
}

- (void)setDisabled:(BOOL)a3
{
  double v3;

  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    v3 = 1.0;
    if (a3)
      v3 = 0.5;
    -[CollectionView setAlpha:](self, "setAlpha:", v3);
  }
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  UITextField *titleTextField;
  NSObject *v9;
  NSObject *titleObserver;
  void *v11;
  NSString *v12;
  NSString *originalTitle;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  if (self->_editing != a3)
  {
    v3 = a3;
    if ((-[CollectionHandlerInfo canEditImage](self->_collectionInfo, "canEditImage") & 1) != 0
      || -[CollectionHandlerInfo canEditTitle](self->_collectionInfo, "canEditTitle"))
    {
      self->_editing = v3;
      if (-[CollectionHandlerInfo canEditTitle](self->_collectionInfo, "canEditTitle"))
      {
        -[UITextField setUserInteractionEnabled:](self->_titleTextField, "setUserInteractionEnabled:", v3);
        -[UITextField setEnabled:](self->_titleTextField, "setEnabled:", v3);
      }
      -[CollectionImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", v3);
      -[CollectionImageView setEditing:](self->_imageView, "setEditing:", v3);
      if (self->_editing)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView collectionInfo](self, "collectionInfo"));
        v6 = objc_msgSend(v5, "isEmpty");

        if (v6)
        {
          objc_initWeak(&location, self);
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          titleTextField = self->_titleTextField;
          v18 = _NSConcreteStackBlock;
          v19 = 3221225472;
          v20 = sub_100B25934;
          v21 = &unk_1011AD288;
          objc_copyWeak(&v22, &location);
          v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", UITextFieldTextDidChangeNotification, titleTextField, 0, &v18));
          titleObserver = self->_titleObserver;
          self->_titleObserver = v9;

          objc_destroyWeak(&v22);
          objc_destroyWeak(&location);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo title](self->_collectionInfo, "title", v18, v19, v20, v21));
        v12 = (NSString *)objc_msgSend(v11, "copy");
        originalTitle = self->_originalTitle;
        self->_originalTitle = v12;

      }
      else
      {
        if (self->_titleObserver)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          objc_msgSend(v14, "removeObserver:", self->_titleObserver);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_titleTextField, "text"));
        if (objc_msgSend(v15, "length"))
        {

        }
        else
        {
          v16 = self->_originalTitle;

          if (v16)
            -[CollectionHandlerInfo updateTitle:](self->_collectionInfo, "updateTitle:", self->_originalTitle);
        }
        v17 = self->_originalTitle;
        self->_originalTitle = 0;

      }
    }
    -[CollectionView _updateContent](self, "_updateContent");
  }
}

- (void)setCollectionInfo:(id)a3
{
  CollectionHandlerInfo *v5;
  CollectionHandlerInfo *collectionInfo;
  CollectionHandlerInfo *v7;

  v5 = (CollectionHandlerInfo *)a3;
  collectionInfo = self->_collectionInfo;
  v7 = v5;
  if (collectionInfo != v5)
  {
    -[CollectionHandlerInfo removeObserver:](collectionInfo, "removeObserver:", self);
    objc_storeStrong((id *)&self->_collectionInfo, a3);
    -[CollectionHandlerInfo addObserver:](self->_collectionInfo, "addObserver:", self);
    -[CollectionImageView setCollectionInfo:](self->_imageView, "setCollectionInfo:", v7);
    -[CollectionView _updateContent](self, "_updateContent");
  }

}

- (void)setShowCheckmark:(BOOL)a3
{
  if (self->_showCheckmark != a3)
  {
    self->_showCheckmark = a3;
    -[UIImageView setHidden:](self->_imageCheckmarkView, "setHidden:", !a3);
    -[CollectionView _updateConstraintConstants](self, "_updateConstraintConstants");
  }
}

- (void)setShrinkFactor:(double)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  if (self->_shrinkFactor != v3)
  {
    self->_shrinkFactor = v3;
    -[CollectionView _updateConstraintConstants](self, "_updateConstraintConstants");
    -[CollectionView _updateNumberOfLines](self, "_updateNumberOfLines");
  }
}

- (void)setCollectionViewSize:(unint64_t)a3
{
  if (self->_collectionViewSize != a3)
  {
    self->_collectionViewSize = a3;
    -[CollectionView _updateFonts](self, "_updateFonts");
    -[CollectionView _updateNumberOfLines](self, "_updateNumberOfLines");
    -[CollectionView _updateConstraintConstants](self, "_updateConstraintConstants");
  }
}

- (void)setMaxContentSizeCategory:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *v9;

  v5 = (NSString *)a3;
  if (self->_maxContentSizeCategory != v5)
  {
    v9 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveContentSizeCategory](self, "_effectiveContentSizeCategory"));
    objc_storeStrong((id *)&self->_maxContentSizeCategory, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveContentSizeCategory](self, "_effectiveContentSizeCategory"));
    v8 = sub_1002A8950(v7, v6);

    if (v8)
      -[CollectionView _effectiveContentSizeCategoryDidChange:](self, "_effectiveContentSizeCategoryDidChange:", v6);

    v5 = v9;
  }

}

- (void)setAllowAccessibilityTextWrapping:(BOOL)a3
{
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;

  if (self->_allowAccessibilityTextWrapping != a3)
  {
    self->_allowAccessibilityTextWrapping = a3;
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveContentSizeCategory](self, "_effectiveContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    if (IsAccessibilityCategory)
    {
      -[CollectionView _updateNumberOfLines](self, "_updateNumberOfLines");
      -[CollectionView _updateConstraints](self, "_updateConstraints");
      -[CollectionView _updateContent](self, "_updateContent");
    }
  }
}

- (void)_updateConstraints
{
  NSArray *constraints;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *imageHeight;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *badgeHeightConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *textContainerTrailingConstraint;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *v19;
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
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *v42;
  void *v43;
  void *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *v47;
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
  uint64_t *v58;
  void *v59;
  void *v60;
  void *v61;
  NSLayoutConstraint *v62;
  NSLayoutConstraint *topConstraint;
  void *v64;
  void *v65;
  double v66;
  NSLayoutConstraint *v67;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *v69;
  double v70;
  NSArray *v71;
  NSArray *v72;
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
  void *v110;
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
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  _QWORD v133[6];
  _QWORD v134[3];
  _QWORD v135[3];
  _QWORD v136[3];
  _QWORD v137[23];

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  constraints = self->_constraints;
  self->_constraints = 0;

  self->_textContainerHeightMatchesNewCollectionLabel = -[CollectionView _shouldTextContainerHeightMatchNewCollectionLabel](self, "_shouldTextContainerHeightMatchNewCollectionLabel");
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView heightAnchor](self->_imageView, "heightAnchor"));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 0.0));
  imageHeight = self->_imageHeight;
  self->_imageHeight = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_badgeImageView, "heightAnchor"));
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", 0.0));
  badgeHeightConstraint = self->_badgeHeightConstraint;
  self->_badgeHeightConstraint = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_textContainerLayoutGuide, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView trailingAnchor](self, "trailingAnchor"));
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 0.0));
  textContainerTrailingConstraint = self->_textContainerTrailingConstraint;
  self->_textContainerTrailingConstraint = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _subtitleFont](self, "_subtitleFont"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _subtitleFont](self, "_subtitleFont"));
  objc_msgSend(v15, "lineHeight");
  objc_msgSend(v14, "_scaledValueForValue:useLanguageAwareScaling:", 1);
  v17 = v16;

  v137[0] = self->_imageHeight;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField topAnchor](self->_titleTextField, "topAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_textContainerLayoutGuide, "topAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:", v124));
  v137[1] = v122;
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_textContainerLayoutGuide, "topAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v118));
  v137[2] = v117;
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:constant:", v115, v17));
  v137[3] = v114;
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_imageCheckmarkView, "centerYAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView centerYAnchor](self, "centerYAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v112));
  v137[4] = v111;
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_imageCheckmarkView, "heightAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToConstant:", 20.0));
  v18 = self->_badgeHeightConstraint;
  v137[5] = v109;
  v137[6] = v18;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_badgeImageView, "bottomAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView bottomAnchor](self->_imageView, "bottomAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:constant:", v107, 4.0));
  v19 = self->_textContainerTrailingConstraint;
  v137[7] = v106;
  v137[8] = v19;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView leadingAnchor](self->_imageView, "leadingAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView leadingAnchor](self, "leadingAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, 16.0));
  v137[9] = v103;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView widthAnchor](self->_imageView, "widthAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView heightAnchor](self->_imageView, "heightAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v101));
  v137[10] = v100;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_titleTextField, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textContainerLayoutGuide, "leadingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v98));
  v137[11] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_titleTextField, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_textContainerLayoutGuide, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v95));
  v137[12] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textContainerLayoutGuide, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
  v137[13] = v91;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_textContainerLayoutGuide, "trailingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
  v137[14] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textContainerLayoutGuide, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
  v137[15] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_textContainerLayoutGuide, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v83));
  v137[16] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](self->_newCollectionLabel, "leadingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textContainerLayoutGuide, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v137[17] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](self->_newCollectionLabel, "trailingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_textContainerLayoutGuide, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v137[18] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_imageCheckmarkView, "trailingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView trailingAnchor](self, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74, -16.0));
  v137[19] = v73;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageCheckmarkView, "widthAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 20.0));
  v137[20] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_badgeImageView, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_badgeImageView, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v137[21] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_badgeImageView, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView trailingAnchor](self->_imageView, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 4.0));
  v137[22] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v137, 23));
  objc_msgSend(v132, "addObjectsFromArray:", v28);

  if (-[CollectionView _shouldWrapText](self, "_shouldWrapText"))
  {
    v29 = v132;
    v30 = -[CollectionHandlerInfo handlerType](self->_collectionInfo, "handlerType");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView bottomAnchor](self->_imageView, "bottomAnchor"));
    v131 = v31;
    if (v30 == (id)1)
    {
      v128 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel firstBaselineAnchor](self->_newCollectionLabel, "firstBaselineAnchor"));
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:"));
      v136[0] = v125;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](self->_newCollectionLabel, "topAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_textContainerLayoutGuide, "topAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
      v136[1] = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](self->_newCollectionLabel, "bottomAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_textContainerLayoutGuide, "bottomAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
      v136[2] = v37;
      v38 = v136;
    }
    else
    {
      v128 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:"));
      v135[0] = v125;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_textContainerLayoutGuide, "bottomAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
      v135[1] = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](self->_newCollectionLabel, "centerYAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_textContainerLayoutGuide, "centerYAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
      v135[2] = v37;
      v38 = v135;
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 3));
    objc_msgSend(v132, "addObjectsFromArray:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_textContainerLayoutGuide, "topAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView topAnchor](self, "topAnchor"));
    v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
    topConstraint = self->_topConstraint;
    self->_topConstraint = v62;

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_textContainerLayoutGuide, "bottomAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView bottomAnchor](self, "bottomAnchor"));
    v58 = &qword_100E37000;
    LODWORD(v66) = 1144733696;
    v67 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:priority:", v65, 0.0, v66));
    bottomConstraint = self->_bottomConstraint;
    self->_bottomConstraint = v67;

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textContainerLayoutGuide, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView leadingAnchor](self, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 16.0));
    v69 = self->_topConstraint;
    v134[0] = v57;
    v134[1] = v69;
    v134[2] = self->_bottomConstraint;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v134, 3));
    objc_msgSend(v132, "addObjectsFromArray:", v48);
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView topAnchor](self->_imageView, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView topAnchor](self, "topAnchor"));
    v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    v42 = self->_topConstraint;
    self->_topConstraint = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView bottomAnchor](self->_imageView, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView bottomAnchor](self, "bottomAnchor"));
    v45 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
    v46 = self->_bottomConstraint;
    self->_bottomConstraint = v45;

    v47 = self->_bottomConstraint;
    v133[0] = self->_topConstraint;
    v133[1] = v47;
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_textContainerLayoutGuide, "centerYAnchor"));
    v121 = objc_claimAutoreleasedReturnValue(-[CollectionImageView centerYAnchor](self->_imageView, "centerYAnchor"));
    v129 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v121));
    v133[2] = v129;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_textContainerLayoutGuide, "bottomAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v130));
    v133[3] = v123;
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](self->_newCollectionLabel, "centerYAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_textContainerLayoutGuide, "centerYAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v49));
    v133[4] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textContainerLayoutGuide, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView trailingAnchor](self->_imageView, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 12.0));
    v133[5] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v133, 6));
    v29 = v132;
    objc_msgSend(v132, "addObjectsFromArray:", v54);

    v55 = (void *)v121;
    v56 = v126;

    v57 = (void *)v129;
    v58 = &qword_100E37000;

  }
  LODWORD(v70) = *((_DWORD *)v58 + 279);
  -[NSLayoutConstraint setPriority:](self->_bottomConstraint, "setPriority:", v70);
  v71 = (NSArray *)objc_msgSend(v29, "copy");
  v72 = self->_constraints;
  self->_constraints = v71;

  -[CollectionView _updateConstraintConstants](self, "_updateConstraintConstants");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);

}

- (void)_updateConstraintConstants
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double v10;

  -[CollectionView _imageWidth](self, "_imageWidth");
  v4 = v3;
  -[CollectionView _verticalMargin](self, "_verticalMargin");
  v5 = 1.0 - self->_shrinkFactor;
  v7 = v6 + -11.0;
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", v5 * (v6 + -11.0) + 11.0);
  -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", -(v5 * v7 + 11.0));
  -[NSLayoutConstraint setConstant:](self->_imageHeight, "setConstant:", (1.0 - self->_shrinkFactor) * (v4 + -48.0) + 48.0);
  v8 = -50.0;
  if (!self->_showCheckmark)
    v8 = -12.0;
  -[NSLayoutConstraint setConstant:](self->_textContainerTrailingConstraint, "setConstant:", v8);
  v9 = -[CollectionView _shouldWrapText](self, "_shouldWrapText");
  v10 = 30.0;
  if (v9)
    v10 = 20.0;
  -[NSLayoutConstraint setConstant:](self->_badgeHeightConstraint, "setConstant:", v10);
}

- (void)collectionImageViewButtonSelected:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_editing)
  {
    v6 = objc_alloc_init((Class)UIImagePickerController);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setAllowsEditing:", 1);
    objc_msgSend(v6, "setSourceType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView window](self, "window"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
    objc_msgSend(v5, "_maps_topMostPresentViewController:animated:completion:", v6, 1, 0);

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2074, 252, 0);
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", UIImagePickerControllerEditedImage));
  if (!v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", UIImagePickerControllerOriginalImage));
  -[CollectionHandlerInfo updateImage:](self->_collectionInfo, "updateImage:", v7);
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_textAttachmentSpacer
{
  id v3;
  double v4;

  v3 = objc_alloc_init((Class)NSTextAttachment);
  -[CollectionView _imageWidth](self, "_imageWidth");
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v4, 0.0);
  return v3;
}

- (void)_updateContent
{
  CollectionHandlerInfo *collectionInfo;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  if (self->_textContainerHeightMatchesNewCollectionLabel != -[CollectionView _shouldTextContainerHeightMatchNewCollectionLabel](self, "_shouldTextContainerHeightMatchNewCollectionLabel"))-[CollectionView _updateConstraints](self, "_updateConstraints");
  collectionInfo = self->_collectionInfo;
  if (collectionInfo && -[CollectionHandlerInfo handlerType](collectionInfo, "handlerType") != (id)1)
  {
    if (self->_editing && -[CollectionHandlerInfo canEditTitle](self->_collectionInfo, "canEditTitle"))
    {
      if (-[UITextField isEditing](self->_titleTextField, "isEditing"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo subtitle](self->_collectionInfo, "subtitle"));
        -[UILabel setText:](self->_subtitleLabel, "setText:", v11);

      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_titleTextField, "text"));
        v24 = objc_msgSend(v23, "length");

        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Collection] Tap to edit title"), CFSTR("localized string not found"), 0));
          -[UILabel setText:](self->_subtitleLabel, "setText:", v26);

        }
        else
        {
          -[UILabel setText:](self->_subtitleLabel, "setText:", &stru_1011EB268);
        }
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self->_editSession, "selectedObjectSet"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allObjects"));
      v29 = objc_msgSend(v28, "count");

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("[Collections] subtitle"), CFSTR("localized string not found"), 0));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v29));

        -[UILabel setText:](self->_subtitleLabel, "setText:", v32);
      }
      -[UITextField setHidden:](self->_titleTextField, "setHidden:", 0);
      -[UILabel setHidden:](self->_titleLabel, "setHidden:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField placeholder](self->_titleTextField, "placeholder"));
      -[UILabel setText:](self->_titleLabel, "setText:", v33);

    }
    else
    {
      if (-[CollectionView _shouldWrapText](self, "_shouldWrapText"))
      {
        v12 = objc_alloc_init((Class)NSMutableAttributedString);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _textAttachmentSpacer](self, "_textAttachmentSpacer"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v13));
        objc_msgSend(v12, "appendAttributedString:", v14);

        v15 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
        objc_msgSend(v12, "appendAttributedString:", v15);

        v16 = objc_alloc((Class)NSAttributedString);
        v17 = objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo title](self->_collectionInfo, "title"));
        v18 = (void *)v17;
        if (v17)
          v19 = (const __CFString *)v17;
        else
          v19 = &stru_1011EB268;
        v20 = objc_msgSend(v16, "initWithString:", v19);
        objc_msgSend(v12, "appendAttributedString:", v20);

        -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v12);
      }
      else
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo title](self->_collectionInfo, "title"));
        -[UILabel setText:](self->_titleLabel, "setText:", v12);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo title](self->_collectionInfo, "title"));
      -[UITextField setText:](self->_titleTextField, "setText:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo subtitle](self->_collectionInfo, "subtitle"));
      -[UILabel setText:](self->_subtitleLabel, "setText:", v22);

      -[UITextField setHidden:](self->_titleTextField, "setHidden:", 1);
      -[UILabel setHidden:](self->_titleLabel, "setHidden:", 0);
    }
    -[MapsThemeLabel setText:](self->_newCollectionLabel, "setText:", 0);
    -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 0);
    -[MapsThemeLabel setHidden:](self->_newCollectionLabel, "setHidden:", 1);
  }
  else
  {
    -[UITextField setText:](self->_titleTextField, "setText:", 0);
    -[UILabel setText:](self->_titleLabel, "setText:", 0);
    -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Guide] New guide cell"), CFSTR("localized string not found"), 0));

    if (-[CollectionView _shouldWrapText](self, "_shouldWrapText"))
    {
      v6 = objc_alloc_init((Class)NSMutableAttributedString);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _textAttachmentSpacer](self, "_textAttachmentSpacer"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v7));
      objc_msgSend(v6, "appendAttributedString:", v8);

      v9 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
      objc_msgSend(v6, "appendAttributedString:", v9);

      v10 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v5);
      objc_msgSend(v6, "appendAttributedString:", v10);

      -[MapsThemeLabel setAttributedText:](self->_newCollectionLabel, "setAttributedText:", v6);
    }
    else
    {
      -[MapsThemeLabel setText:](self->_newCollectionLabel, "setText:", v5);
    }
    -[UITextField setHidden:](self->_titleTextField, "setHidden:", 1);
    -[UILabel setHidden:](self->_titleLabel, "setHidden:", 1);
    -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 1);
    -[MapsThemeLabel setHidden:](self->_newCollectionLabel, "setHidden:", 0);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo badgeImage](self->_collectionInfo, "badgeImage"));
  -[UIImageView setImage:](self->_badgeImageView, "setImage:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo badgeImage](self->_collectionInfo, "badgeImage"));
  -[UIImageView setHidden:](self->_badgeImageView, "setHidden:", v35 == 0);

  -[CollectionView _updateConstraintConstants](self, "_updateConstraintConstants");
}

- (int64_t)_titleNumberOfLines
{
  double v4;

  if (-[CollectionView _shouldWrapText](self, "_shouldWrapText"))
    return 0;
  -[CollectionView shrinkFactor](self, "shrinkFactor");
  if (v4 == 0.0)
    return 2;
  else
    return 1;
}

- (int64_t)_subtitleNumberOfLines
{
  return -[CollectionView _shouldWrapText](self, "_shouldWrapText") ^ 1;
}

- (id)_titleFont
{
  unint64_t collectionViewSize;
  void *v3;
  uint64_t v4;
  void *v5;

  collectionViewSize = self->_collectionViewSize;
  if (collectionViewSize)
  {
    if (collectionViewSize != 1)
    {
      v5 = 0;
      return v5;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveTraitCollection](self, "_effectiveTraitCollection"));
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont system22SemiboldCompatibleWithTraitCollection:](UIFont, "system22SemiboldCompatibleWithTraitCollection:", v3));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveTraitCollection](self, "_effectiveTraitCollection"));
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont system17SemiboldCompatibleWithTraitCollection:](UIFont, "system17SemiboldCompatibleWithTraitCollection:", v3));
  }
  v5 = (void *)v4;

  return v5;
}

- (id)_subtitleFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveTraitCollection](self, "_effectiveTraitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15CompatibleWithTraitCollection:](UIFont, "system15CompatibleWithTraitCollection:", v2));

  return v3;
}

- (void)_updateFonts
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CollectionView _titleFont](self, "_titleFont"));
  -[UITextField setFont:](self->_titleTextField, "setFont:", v4);
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _subtitleFont](self, "_subtitleFont"));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v3);

  -[MapsThemeLabel setFont:](self->_newCollectionLabel, "setFont:", v4);
}

- (void)_updateNumberOfLines
{
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", -[CollectionView _titleNumberOfLines](self, "_titleNumberOfLines"));
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", -[CollectionView _subtitleNumberOfLines](self, "_subtitleNumberOfLines"));
  -[MapsThemeLabel setNumberOfLines:](self->_newCollectionLabel, "setNumberOfLines:", -[CollectionView _titleNumberOfLines](self, "_titleNumberOfLines"));
}

- (BOOL)_shouldWrapText
{
  NSString *v2;
  BOOL IsAccessibilityCategory;

  if (!self->_allowAccessibilityTextWrapping)
    return 0;
  v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveContentSizeCategory](self, "_effectiveContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (BOOL)_shouldTextContainerHeightMatchNewCollectionLabel
{
  _BOOL4 v3;

  v3 = -[CollectionView _shouldWrapText](self, "_shouldWrapText");
  if (v3)
    LOBYTE(v3) = -[CollectionHandlerInfo handlerType](self->_collectionInfo, "handlerType") == (id)1;
  return v3;
}

- (id)_effectiveContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView maxContentSizeCategory](self, "maxContentSizeCategory"));
  v6 = sub_1002A8844(v4, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)_effectiveContentSizeCategoryDidChange:(id)a3
{
  NSString *v4;
  int IsAccessibilityCategory;
  int v6;
  void *v7;
  BOOL v8;
  NSString *category;

  category = (NSString *)a3;
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveContentSizeCategory](self, "_effectiveContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);
  v6 = UIContentSizeCategoryIsAccessibilityCategory(category);

  if (IsAccessibilityCategory != v6)
  {
    -[CollectionView _updateNumberOfLines](self, "_updateNumberOfLines");
    -[CollectionView _updateConstraints](self, "_updateConstraints");
  }
  -[CollectionView _updateFonts](self, "_updateFonts");
  -[CollectionView _updateConstraintConstants](self, "_updateConstraintConstants");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveContentSizeCategory](self, "_effectiveContentSizeCategory"));
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v7))
  {

LABEL_6:
    -[CollectionView _updateContent](self, "_updateContent");
    goto LABEL_7;
  }
  v8 = UIContentSizeCategoryIsAccessibilityCategory(category);

  if (v8)
    goto LABEL_6;
LABEL_7:

}

- (id)_effectiveTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView traitCollection](self, "traitCollection"));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView _effectiveContentSizeCategory](self, "_effectiveContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v4));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", v6));

  return v7;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "collectionViewTextFieldDidBecomeSelected:", self);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t UInteger;
  id v13;
  uint64_t v14;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9));

  UInteger = GEOConfigGetUInteger(MapsConfig_CollectionNameMaximumLength, off_1014B4A18);
  v13 = objc_msgSend(v11, "length");
  if ((unint64_t)v13 > UInteger)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", 0, UInteger));

    objc_msgSend(v8, "setText:", v14);
    v11 = (void *)v14;
  }

  return (unint64_t)v13 <= UInteger;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CollectionHandlerInfo *collectionInfo;
  void *v8;
  id WeakRetained;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    collectionInfo = self->_collectionInfo;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    -[CollectionHandlerInfo updateTitle:](collectionInfo, "updateTitle:", v8);

    -[CollectionView endEditing:](self, "endEditing:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "collectionViewTextFieldDidResign:", self);

  }
  return v6 != 0;
}

- (CollectionViewDelegate)delegate
{
  return (CollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CollectionHandlerInfo)collectionInfo
{
  return self->_collectionInfo;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (unint64_t)collectionViewSize
{
  return self->_collectionViewSize;
}

- (BOOL)showsCheckmark
{
  return self->_showCheckmark;
}

- (CollectionEditSession)editSession
{
  return self->_editSession;
}

- (void)setEditSession:(id)a3
{
  objc_storeStrong((id *)&self->_editSession, a3);
}

- (double)shrinkFactor
{
  return self->_shrinkFactor;
}

- (NSString)maxContentSizeCategory
{
  return self->_maxContentSizeCategory;
}

- (BOOL)allowAccessibilityTextWrapping
{
  return self->_allowAccessibilityTextWrapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_storeStrong((id *)&self->_collectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleObserver, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_textContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_badgeHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeight, 0);
  objc_storeStrong((id *)&self->_textContainerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_imageCheckmarkView, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_newCollectionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
}

@end
