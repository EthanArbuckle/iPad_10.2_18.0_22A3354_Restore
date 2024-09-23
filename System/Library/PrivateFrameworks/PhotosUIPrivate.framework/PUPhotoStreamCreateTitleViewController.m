@implementation PUPhotoStreamCreateTitleViewController

- (PUPhotoStreamCreateTitleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoStreamCreateTitleViewController;
  return -[PUPhotoStreamCreateTitleViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[PUPhotoStreamCreateTitleViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *createAsLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UITextView *v15;
  UITextView *textView;
  UITextView *v17;
  void *v18;
  void *v19;
  UITextView *v20;
  void *v21;
  void *v22;
  UILabel *v23;
  UILabel *textPlaceholderLabel;
  UILabel *v25;
  void *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  UILabel *v36;
  UILabel *instructionLabel;
  UILabel *v38;
  void *v39;
  void *v40;
  UILabel *v41;
  void *v42;
  UILabel *v43;
  void *v44;
  UILabel *v45;
  void *v46;
  UILabel *v47;
  void *v48;
  UILabel *v49;
  UILabel *axPlaceholderLabel;
  UILabel *v51;
  void *v52;
  void *v53;
  UILabel *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  UILabel *v59;
  void *v60;
  UILabel *v61;
  void *v62;
  UILabel *v63;
  void *v64;
  void *v65;
  NSString *v66;
  UILabel **p_axPlaceholderLabel;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;

  v73.receiver = self;
  v73.super_class = (Class)PUPhotoStreamCreateTitleViewController;
  -[PUPhotoStreamCreateTitleViewController viewDidLoad](&v73, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D719E0], "sharingDisplayNameIncludingEmail:allowsEmail:", 1, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E58AD278;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  PXLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (UILabel *)objc_opt_new();
  createAsLabel = self->_createAsLabel;
  self->_createAsLabel = v9;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_createAsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v6);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedAlbumCommentCardUserFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_createAsLabel, "setFont:", v12);

  -[UILabel setText:](self->_createAsLabel, "setText:", v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_createAsLabel, "setTextColor:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_createAsLabel, "setBackgroundColor:", v14);

  -[UILabel setTextAlignment:](self->_createAsLabel, "setTextAlignment:", 1);
  -[UILabel setPreferredMaxLayoutWidth:](self->_createAsLabel, "setPreferredMaxLayoutWidth:", 200.0);
  -[UILabel setNumberOfLines:](self->_createAsLabel, "setNumberOfLines:", 2);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_createAsLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v15 = (UITextView *)objc_opt_new();
  textView = self->_textView;
  self->_textView = v15;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = self->_textView;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sharedAlbumCommentCardTitleFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](v17, "setFont:", v19);

  v20 = self->_textView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](v20, "setBackgroundColor:", v21);

  -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
  -[UITextView setAdjustsFontForContentSizeCategory:](self->_textView, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextView textContainer](self->_textView, "textContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMaximumNumberOfLines:", 1);

  v23 = (UILabel *)objc_opt_new();
  textPlaceholderLabel = self->_textPlaceholderLabel;
  self->_textPlaceholderLabel = v23;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textPlaceholderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = self->_textPlaceholderLabel;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sharedAlbumCommentCardTitleFont");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v25, "setFont:", v27);

  v28 = self->_textPlaceholderLabel;
  PULocalizedString(CFSTR("ALBUM_TITLE_PLACEHOLDER"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v28, "setText:", v29);

  v30 = self->_textPlaceholderLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v30, "setTextColor:", v31);

  v32 = self->_textPlaceholderLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v32, "setBackgroundColor:", v33);

  v34 = self->_textPlaceholderLabel;
  -[UITextView font](self->_textView, "font");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v34, "setFont:", v35);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_textPlaceholderLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v36 = (UILabel *)objc_opt_new();
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v36;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v38 = self->_instructionLabel;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sharedAlbumCommentCardTitleFont");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v38, "setFont:", v40);

  v41 = self->_instructionLabel;
  PULocalizedString(CFSTR("ALBUM_TITLE_INSTRUCTION"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v41, "setText:", v42);

  v43 = self->_instructionLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v43, "setTextColor:", v44);

  v45 = self->_instructionLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v45, "setBackgroundColor:", v46);

  v47 = self->_instructionLabel;
  -[UITextView font](self->_textView, "font");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v47, "setFont:", v48);

  -[UILabel setTextAlignment:](self->_instructionLabel, "setTextAlignment:", 1);
  -[UILabel setPreferredMaxLayoutWidth:](self->_instructionLabel, "setPreferredMaxLayoutWidth:", 200.0);
  -[UILabel setNumberOfLines:](self->_instructionLabel, "setNumberOfLines:", 2);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_instructionLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v49 = (UILabel *)objc_opt_new();
  axPlaceholderLabel = self->_axPlaceholderLabel;
  self->_axPlaceholderLabel = v49;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_axPlaceholderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v51 = self->_axPlaceholderLabel;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sharedAlbumCommentCardTitleFont");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v51, "setFont:", v53);

  v54 = self->_axPlaceholderLabel;
  v55 = (void *)MEMORY[0x1E0CB3940];
  PULocalizedString(CFSTR("ALBUM_TITLE_PLACEHOLDER"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("ALBUM_TITLE_INSTRUCTION"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "stringWithFormat:", CFSTR("%@\n%@"), v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v54, "setText:", v58);

  v59 = self->_axPlaceholderLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v59, "setTextColor:", v60);

  v61 = self->_axPlaceholderLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v61, "setBackgroundColor:", v62);

  v63 = self->_axPlaceholderLabel;
  -[UITextView font](self->_textView, "font");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v63, "setFont:", v64);

  -[UILabel setNumberOfLines:](self->_axPlaceholderLabel, "setNumberOfLines:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_axPlaceholderLabel, "setAdjustsFontForContentSizeCategory:", 1);
  self->_hidePlaceholder = 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "preferredContentSizeCategory");
  v66 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = UIContentSizeCategoryIsAccessibilityCategory(v66);

  p_axPlaceholderLabel = &self->_axPlaceholderLabel;
  if ((_DWORD)v54)
  {
    -[UILabel setHidden:](self->_textPlaceholderLabel, "setHidden:", 1);
    p_axPlaceholderLabel = &self->_instructionLabel;
  }
  -[UILabel setHidden:](*p_axPlaceholderLabel, "setHidden:", 1);
  -[PUPhotoStreamCreateTitleViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addSubview:", self->_createAsLabel);

  -[PUPhotoStreamCreateTitleViewController view](self, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addSubview:", self->_textView);

  -[PUPhotoStreamCreateTitleViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addSubview:", self->_textPlaceholderLabel);

  -[PUPhotoStreamCreateTitleViewController view](self, "view");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addSubview:", self->_instructionLabel);

  -[UITextView addSubview:](self->_textView, "addSubview:", self->_axPlaceholderLabel);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addObserver:selector:name:object:", self, sel_contentSizeChanged, *MEMORY[0x1E0DC48E8], 0);

}

- (void)contentSizeChanged
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  NSLayoutConstraint *standardHeightConstraint;
  UILabel *axPlaceholderLabel;
  _BOOL8 hidePlaceholder;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  standardHeightConstraint = self->_standardHeightConstraint;
  if (IsAccessibilityCategory)
  {
    -[NSLayoutConstraint setActive:](standardHeightConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_axHeightConstraint, "setActive:", 1);
    -[UILabel setHidden:](self->_textPlaceholderLabel, "setHidden:", 1);
    -[UILabel setHidden:](self->_instructionLabel, "setHidden:", 1);
    axPlaceholderLabel = self->_axPlaceholderLabel;
    hidePlaceholder = self->_hidePlaceholder;
  }
  else
  {
    -[NSLayoutConstraint setActive:](standardHeightConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](self->_axHeightConstraint, "setActive:", 0);
    -[UILabel setHidden:](self->_textPlaceholderLabel, "setHidden:", self->_hidePlaceholder);
    -[UILabel setHidden:](self->_instructionLabel, "setHidden:", 0);
    axPlaceholderLabel = self->_axPlaceholderLabel;
    hidePlaceholder = 1;
  }
  -[UILabel setHidden:](axPlaceholderLabel, "setHidden:", hidePlaceholder);
}

- (void)textViewDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v9;
  UILabel *axPlaceholderLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (self->_textView == a3)
  {
    objc_msgSend(a3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    self->_hidePlaceholder = objc_msgSend(v16, "length") != 0;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (IsAccessibilityCategory)
    {
      v9 = 1040;
      axPlaceholderLabel = self->_axPlaceholderLabel;
      if (self->_hidePlaceholder)
      {
        -[UILabel setText:](self->_axPlaceholderLabel, "setText:", &stru_1E58AD278);
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        PULocalizedString(CFSTR("ALBUM_TITLE_PLACEHOLDER"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PULocalizedString(CFSTR("ALBUM_TITLE_INSTRUCTION"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@\n%@"), v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](axPlaceholderLabel, "setText:", v14);

      }
    }
    else
    {
      v9 = 1000;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v9), "setHidden:", self->_hidePlaceholder);
    -[UINavigationItem rightBarButtonItem](self->_navItem, "rightBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", self->_hidePlaceholder);

  }
}

- (CGSize)contentSizeForViewInPopover
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoStreamCreateTitleViewController;
  -[PUPhotoStreamCreateTitleViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PUPhotoStreamCreateTitleViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamCreateTitleViewController _addConstraintsForTraitCollection:](self, "_addConstraintsForTraitCollection:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoStreamCreateTitleViewController;
  -[PUPhotoStreamCreateTitleViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UITextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (void)_addConstraintsForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSArray *constraints;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *standardHeightConstraint;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *axHeightConstraint;
  void *v26;
  NSString *v27;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v29;
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
  id v43;
  _QWORD v44[20];

  v44[18] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotoStreamCreateTitleViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -16.0;
  if (!objc_msgSend(v4, "userInterfaceIdiom"))
  {
    if (objc_msgSend(v4, "verticalSizeClass") == 1)
      v6 = -22.0;
    else
      v6 = -16.0;
  }
  constraints = self->_constraints;
  if (constraints)
  {
    -[NSArray lastObject](constraints, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", v6);

    -[PUPhotoStreamCreateTitleViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsUpdateConstraints");

    -[PUPhotoStreamCreateTitleViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_createAsLabel, 3, 0, v5, 3, 1.0, 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v42;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_createAsLabel, 5, 0, v5, 5, 1.0, 8.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v41;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_createAsLabel, 6, 0, v5, 6, 1.0, -8.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v40;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textView, 3, 0, self->_createAsLabel, 4, 1.0, 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v39;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textView, 5, 0, v5, 5, 1.0, 8.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = v38;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textView, 6, 0, v5, 6, 1.0, -8.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[5] = v37;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textView, 4, 0, self->_instructionLabel, 3, 1.0, -8.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[6] = v36;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textPlaceholderLabel, 3, 0, self->_createAsLabel, 4, 1.0, 8.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[7] = v35;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textPlaceholderLabel, 5, 0, v5, 5, 1.0, 12.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44[8] = v34;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textPlaceholderLabel, 6, 0, v5, 6, 1.0, -8.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v44[9] = v33;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textPlaceholderLabel, 4, 0, self->_instructionLabel, 3, 1.0, -8.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[10] = v32;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionLabel, 5, 0, v5, 5, 1.0, 12.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44[11] = v31;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionLabel, 6, 0, v5, 6, 1.0, -12.0);
    v43 = v4;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[12] = v30;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionLabel, 4, 0, v5, 4, 1.0, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44[13] = v11;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_axPlaceholderLabel, 3, 0, self->_textView, 3, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44[14] = v12;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_axPlaceholderLabel, 4, 0, self->_textView, 4, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44[15] = v13;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_axPlaceholderLabel, 9, 0, self->_textView, 9, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44[16] = v14;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_axPlaceholderLabel, 7, 0, self->_textView, 7, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v44[17] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 18);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_constraints;
    self->_constraints = v16;

    v4 = v43;
  }
  -[UITextView bottomAnchor](self->_textView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 84.0);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  standardHeightConstraint = self->_standardHeightConstraint;
  self->_standardHeightConstraint = v20;

  -[UITextView heightAnchor](self->_textView, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -16.0);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  axHeightConstraint = self->_axHeightConstraint;
  self->_axHeightConstraint = v24;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "preferredContentSizeCategory");
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v27);

  if (IsAccessibilityCategory)
    v29 = 1056;
  else
    v29 = 1048;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v29), "setActive:", 1);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);

}

- (id)navigationItem
{
  UINavigationItem *navItem;
  id v4;
  void *v5;
  UINavigationItem *v6;
  UINavigationItem *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  navItem = self->_navItem;
  if (!navItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3A48]);
    PULocalizedString(CFSTR("PHOTO_STREAM_NAV_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UINavigationItem *)objc_msgSend(v4, "initWithTitle:", v5);
    v7 = self->_navItem;
    self->_navItem = v6;

    v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PULocalizedString(CFSTR("STREAM_NEXT_SHEET_BUTTON"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 2, self, sel__setTitle_);

    objc_msgSend(v10, "setEnabled:", 0);
    -[UINavigationItem setRightBarButtonItem:](self->_navItem, "setRightBarButtonItem:", v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPost_);
    -[UINavigationItem setLeftBarButtonItem:](self->_navItem, "setLeftBarButtonItem:", v11);

    navItem = self->_navItem;
  }
  return navItem;
}

- (void)_cancelPost:(id)a3
{
  id v4;

  -[PUPhotoStreamCreateTitleViewController titleDelegate](self, "titleDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleControllerDidCancel:", self);

}

- (void)_setTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UITextView resignFirstResponder](self->_textView, "resignFirstResponder", a3);
  -[UITextView text](self->_textView, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPhotoStreamCreateTitleViewController titleDelegate](self, "titleDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleController:didSetTitle:", self, v7);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoStreamCreateTitleViewController;
  -[PUPhotoStreamCreateTitleViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[PUPhotoStreamCreateTitleViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamCreateTitleViewController _addConstraintsForTraitCollection:](self, "_addConstraintsForTraitCollection:", v4);

}

- (void)dealloc
{
  objc_super v3;

  -[UITextView setDelegate:](self->_textView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoStreamCreateTitleViewController;
  -[PUPhotoStreamCreateTitleViewController dealloc](&v3, sel_dealloc);
}

- (PUPhotoStreamCreateTitleDelegate)titleDelegate
{
  return self->_titleDelegate;
}

- (void)setTitleDelegate:(id)a3
{
  self->_titleDelegate = (PUPhotoStreamCreateTitleDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHeightConstraint, 0);
  objc_storeStrong((id *)&self->_standardHeightConstraint, 0);
  objc_storeStrong((id *)&self->_axPlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_textPlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_createAsLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleField, 0);
}

@end
